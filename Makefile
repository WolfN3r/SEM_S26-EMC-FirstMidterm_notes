# =============================================================================
# EMC Midterm Preparation — Makefile
# =============================================================================

SHELL             := /bin/bash

CLAUDE_IMAGE      := claude-code-emc
CLAUDE_CONTAINER  := claude-code-emc
WORKSPACE         := $(shell pwd)

# Resource limits for container
DOCKER_MEMORY     ?= 8g
DOCKER_CPUS       ?= 4
DOCKER_LIMITS     := --memory $(DOCKER_MEMORY) --cpus $(DOCKER_CPUS)

# Cache volume (persists npm/uvx caches across runs)
CACHE_VOLUME      := claude-cache
DOCKER_VOLUMES    := -v $(WORKSPACE)/WorkingDir:/workspace -v $(CACHE_VOLUME):/home/claude/.cache

# Environment variables passed into the container
DOCKER_ENV        := --env ANTHROPIC_API_KEY --env ANTHROPIC_MODEL --env NTFY_TOPIC

# Load .env if exists
ifneq (,$(wildcard .env))
    include .env
    export
endif

YES       ?= 0   # Set YES=1 to skip confirmation: make claude YES=1

# ---- Validation ----
check-api-key:
ifndef ANTHROPIC_API_KEY
	@echo "ERROR: ANTHROPIC_API_KEY not set. Run: cp .env.example .env && nano .env"
	@exit 1
endif

check-security:
	@echo "==> Security pre-flight checks..."
	@test ! -f .env || (grep -q "sk-ant-PASTE" .env && echo "  ✗ .env still has placeholder key — edit it!" && exit 1 || echo "  ✓ .env has a real key")
	@if echo "$$ANTHROPIC_API_KEY" | grep -q "sk-ant-PASTE"; then \
		echo "  - Skipping git history check (placeholder key)"; \
	elif git log --all -S "$$ANTHROPIC_API_KEY" --oneline 2>/dev/null | head -1 | grep -q .; then \
		echo "  ✗ WARNING: API key found in git history!"; exit 1; \
	else \
		echo "  ✓ No API key in git history"; \
	fi
	@echo "  ✓ Security checks passed"

# ============================
# BUILD
# ============================

.PHONY: build
build: build-claude ## Build Claude Code container
	@echo ""
	@echo "==> Build complete. Next: make verify"

.PHONY: build-claude
build-claude: ## Build the Claude Code Docker image
	docker build -t $(CLAUDE_IMAGE) .

.PHONY: update-claude
update-claude: ## Rebuild Claude Code image, forcing latest npm version (busts cache)
	docker build --no-cache -t $(CLAUDE_IMAGE) .

# ============================
# RUN
# ============================

.PHONY: start
start: check-api-key check-security ## Start Claude Code container (interactive shell)
	docker run -it --rm \
		--name $(CLAUDE_CONTAINER) \
		$(DOCKER_ENV) \
		$(DOCKER_LIMITS) \
		$(DOCKER_VOLUMES) \
		$(CLAUDE_IMAGE)

.PHONY: claude
claude: check-api-key check-security ## Launch Claude Code with --dangerously-skip-permissions
	@echo "==> SECURITY REMINDER:"
	@echo "    - Set a spending limit at console.anthropic.com → Billing"
	@echo "    - Claude Code has FULL shell access (--dangerously-skip-permissions)"
	@echo "    - Monitor usage at console.anthropic.com → Usage"
	@echo "    - Container limits: memory=$(DOCKER_MEMORY), cpus=$(DOCKER_CPUS)"
	@echo ""
	@if [ "$(YES)" != "1" ]; then \
		read -p "    Continue? [y/N] " confirm && [ "$$confirm" = "y" ] || exit 1; \
	fi
	docker run -it --rm \
		--name $(CLAUDE_CONTAINER) \
		$(DOCKER_ENV) \
		$(DOCKER_LIMITS) \
		$(DOCKER_VOLUMES) \
		$(CLAUDE_IMAGE) \
		bash -c "cd /workspace && claude --dangerously-skip-permissions"

.PHONY: claude-attach
claude-attach: ## Open an additional Claude session inside the already-running container (use in a new tab)
	docker exec -it $(CLAUDE_CONTAINER) bash -c "cd /workspace && claude --dangerously-skip-permissions"

.PHONY: cc
cc: check-api-key check-security ## Smart open: starts Claude if not running, attaches if already running
	@if docker ps -q -f name=$(CLAUDE_CONTAINER) | grep -q .; then \
		echo "==> Container running — opening new session..."; \
		docker exec -it $(CLAUDE_CONTAINER) \
			bash -c "cd /workspace && claude --dangerously-skip-permissions"; \
	else \
		echo "==> No container running — starting fresh..."; \
		if [ "$(YES)" != "1" ]; then \
			echo "    Claude Code has FULL shell access (--dangerously-skip-permissions)"; \
			echo "    Container limits: memory=$(DOCKER_MEMORY), cpus=$(DOCKER_CPUS)"; \
			read -p "    Continue? [y/N] " confirm && [ "$$confirm" = "y" ] || exit 1; \
		fi; \
		docker run -it --rm \
			--name $(CLAUDE_CONTAINER) \
			$(DOCKER_ENV) \
			$(DOCKER_LIMITS) \
			$(DOCKER_VOLUMES) \
			$(CLAUDE_IMAGE) \
			bash -c "cd /workspace && claude --dangerously-skip-permissions"; \
	fi

# ============================
# SETUP
# ============================

.PHONY: env-setup
env-setup: ## Create .env from template
	@test -f .env && echo ".env exists already" || (cp .env.example .env && echo "Created .env — edit it: nano .env")

.PHONY: verify
verify: check-api-key ## Verify the full setup
	@echo "==> Verifying environment..."
	@docker image inspect $(CLAUDE_IMAGE) >/dev/null 2>&1 && echo "  ✓ Claude Code image" || echo "  ✗ Claude Code image — run: make build-claude"
	@test -f .env && echo "  ✓ .env file" || echo "  ✗ .env — run: make env-setup"
	@test -f WorkingDir/CLAUDE.md && echo "  ✓ CLAUDE.md" || echo "  ✗ WorkingDir/CLAUDE.md missing"
	@test -d WorkingDir/LectureSlides && echo "  ✓ LectureSlides/" || echo "  ✗ WorkingDir/LectureSlides/ missing"
	@echo "==> Checking Claude Code version inside container..."
	@docker run --rm $(CLAUDE_IMAGE) claude --version 2>/dev/null || echo "  ⚠ Could not check version"
	@echo "==> Checking cache volume..."
	@docker volume inspect $(CACHE_VOLUME) >/dev/null 2>&1 && echo "  ✓ Cache volume '$(CACHE_VOLUME)'" || echo "  ⚠ Cache volume missing (will be created on first run)"
	@echo "==> Checking ntfy.sh notification..."
	@if [ -z "$(NTFY_TOPIC)" ]; then \
		echo "  ⚠ NTFY_TOPIC not set — skipping (add NTFY_TOPIC=your-topic to .env)"; \
	elif curl -sf -o /dev/null \
		-H "Title: EMC verify" \
		-H "Tags: white_check_mark" \
		-d "Verify ping from $$(hostname)" \
		"https://ntfy.sh/$(NTFY_TOPIC)"; then \
		echo "  ✓ ntfy.sh → topic '$(NTFY_TOPIC)' reachable"; \
	else \
		echo "  ✗ ntfy.sh delivery failed — check NTFY_TOPIC and network"; \
	fi
	@echo "==> Done."

# ============================
# PIPELINE (session-per-phase, fresh context each call)
# ============================
# Each `claude -p` call starts a fresh conversation -- no cross-task context
# bleed, no image accumulation. Chapters process one at a time.

CLAUDE_FLAGS := --dangerously-skip-permissions

# Extract a single chapter: make extract-chap-1, extract-chap-2, ...
.PHONY: extract-chap-%
extract-chap-%: check-api-key check-security ## Extract one chapter (e.g. make extract-chap-1)
	docker run --rm \
		--name $(CLAUDE_CONTAINER)-extract-$* \
		$(DOCKER_ENV) $(DOCKER_LIMITS) $(DOCKER_VOLUMES) \
		$(CLAUDE_IMAGE) \
		bash -c "cd /workspace && claude $(CLAUDE_FLAGS) -p 'Execute Task 1 from CLAUDE.md for chap$*.pdf ONLY. Produce knowledge/chap$*.md. Use pdftotext (do NOT load slide images into chat). Do not touch other chapters.'"

.PHONY: extract-all
extract-all: check-api-key check-security ## Extract all 4 chapters sequentially (fresh session each)
	@docker run -it --rm \
		--name $(CLAUDE_CONTAINER) \
		$(DOCKER_ENV) $(DOCKER_LIMITS) $(DOCKER_VOLUMES) \
		$(CLAUDE_IMAGE) \
		bash -c 'set -e; cd /workspace; for N in 1 2 3 4; do \
			echo "==> Extracting chap$$N (fresh session)..."; \
			claude $(CLAUDE_FLAGS) -p "Execute Task 1 from CLAUDE.md for chap$$N.pdf ONLY. Produce knowledge/chap$$N.md. Use pdftotext (do NOT load slide images into chat). Do not touch other chapters."; \
		done'

.PHONY: verify-equations
verify-equations: check-api-key check-security ## Task 2: spot-check equations against PDFs (text-only)
	docker run -it --rm \
		--name $(CLAUDE_CONTAINER) \
		$(DOCKER_ENV) $(DOCKER_LIMITS) $(DOCKER_VOLUMES) \
		$(CLAUDE_IMAGE) \
		bash -c "cd /workspace && claude $(CLAUDE_FLAGS) -p 'Execute Task 2 from CLAUDE.md. Read knowledge/chap*.md, spot-check equations with pdftotext. Write knowledge/equation-corrections.md. Do NOT load any slide images.'"

.PHONY: synthesize
synthesize: check-api-key check-security ## Tasks 3-5: produce study-notes, exam-examples, practice-questions (text-only)
	docker run -it --rm \
		--name $(CLAUDE_CONTAINER) \
		$(DOCKER_ENV) $(DOCKER_LIMITS) $(DOCKER_VOLUMES) \
		$(CLAUDE_IMAGE) \
		bash -c "cd /workspace && claude $(CLAUDE_FLAGS) -p 'Execute Tasks 3, 4, and 5 from CLAUDE.md. Work ONLY from knowledge/*.md and existing figures/. Do NOT reopen PDFs. Produce notes/study-notes.md, notes/exam-examples.md, notes/practice-questions.md.'"

.PHONY: pdfs
pdfs: ## Task 6: render all markdown to PDF via pandoc+lualatex (no Claude)
	docker run --rm \
		$(DOCKER_VOLUMES) \
		$(CLAUDE_IMAGE) \
		bash -c 'set -e; cd /workspace; mkdir -p pdf figures; \
			for f in knowledge/chap*.md; do \
				[ -f "$$f" ] || continue; \
				base=$$(basename "$$f" .md); \
				echo "==> pdf/$$base-knowledge.pdf"; \
				pandoc "$$f" -o "pdf/$$base-knowledge.pdf" \
					--pdf-engine=lualatex \
					--template=templates/notes-template.tex \
					-V title="EMC $$base -- Knowledge"; \
			done; \
			for f in notes/study-notes.md notes/exam-examples.md notes/practice-questions.md; do \
				[ -f "$$f" ] || continue; \
				base=$$(basename "$$f" .md); \
				echo "==> pdf/$$base.pdf"; \
				pandoc "$$f" -o "pdf/$$base.pdf" \
					--pdf-engine=lualatex \
					--template=templates/notes-template.tex \
					-V title="EMC $$base"; \
			done'

.PHONY: pipeline
pipeline: extract-all verify-equations synthesize pdfs ## Run full pipeline: extract-all -> verify -> synthesize -> pdfs
	@echo "==> Pipeline complete. Run: make check-output"

.PHONY: check-output
check-output: ## Verify that expected output files were generated
	@echo "==> Checking outputs..."
	@fail=0; \
	for f in \
		knowledge/chap1.md knowledge/chap2.md knowledge/chap3.md knowledge/chap4.md \
		knowledge/equation-corrections.md \
		notes/study-notes.md notes/exam-examples.md notes/practice-questions.md \
		pdf/study-notes.pdf pdf/exam-examples.pdf pdf/practice-questions.pdf; \
	do \
		if [ -f "WorkingDir/$$f" ]; then \
			echo "  ✓ $$f"; \
		else \
			echo "  ✗ $$f — MISSING"; \
			fail=1; \
		fi; \
	done; \
	if [ "$$fail" = "1" ]; then \
		echo "==> Some outputs missing. Re-run Claude or check for errors."; \
	else \
		echo "==> All outputs present."; \
	fi

# ============================
# CLEANUP
# ============================

.PHONY: stop
stop: ## Stop running container
	-docker stop $(CLAUDE_CONTAINER) 2>/dev/null

.PHONY: clean
clean: stop ## Remove container + Claude image
	-docker rm $(CLAUDE_CONTAINER) 2>/dev/null
	-docker rmi $(CLAUDE_IMAGE) 2>/dev/null

.PHONY: clean-all
clean-all: clean ## Remove container + image + cache volume
	-docker volume rm $(CACHE_VOLUME) 2>/dev/null

# ============================
# HELP
# ============================

.PHONY: help
help: ## Show this help
	@echo "======================================================"
	@echo " EMC Midterm Preparation"
	@echo "======================================================"
	@echo ""
	@echo " QUICK START:"
	@echo "   1. make env-setup        # Create .env config"
	@echo "   2. nano .env             # Add your API key"
	@echo "   3. make build            # Build container"
	@echo "   4. make verify           # Check everything"
	@echo "   5. make claude           # Launch Claude Code"
	@echo ""
	@echo " AUTOMATED PIPELINE (recommended — avoids context blowup):"
	@echo "   make pipeline            # extract-all -> verify -> synthesize -> pdfs"
	@echo "   make extract-chap-1      # Extract a single chapter (fresh session)"
	@echo "   make extract-all         # Extract all 4 chapters (fresh session each)"
	@echo "   make verify-equations    # Task 2 alone"
	@echo "   make synthesize          # Tasks 3-5 alone"
	@echo "   make pdfs                # Task 6 alone (pandoc, no Claude)"
	@echo ""
	@echo " INTERACTIVE (one long session — may hit context limits):"
	@echo "   make cc                  # Smart open: starts or attaches automatically"
	@echo "   make cc YES=1            # Same, skip confirmation on first start"
	@echo "   make check-output        # Verify outputs after Claude finishes"
	@echo ""
	@echo " COMMANDS:"
	@grep -hE '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "   \033[36m%-18s\033[0m %s\n", $$1, $$2}'
	@echo ""

.DEFAULT_GOAL := help
