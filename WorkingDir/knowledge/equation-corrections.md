# Equation Verification Report

## Method

Each chapter's `knowledge/chapN.md` was spot-checked against the source PDF using
`pdftotext -layout -f P -l P LectureSlides/chapN.pdf -` for the cited pages.

**Important limitation:** All equations in the slides are embedded as images (vector graphics or
bitmapped math). `pdftotext` extracts blank lines in place of every equation. Verification was
therefore limited to:

1. **Text-visible formulas** --- expressions that happen to appear in the slide text (not rendered
   as images), e.g., `Gain=Pout/Pin`, `Pout dB = GaindB + Pin dB`, inline annotations,
   and the Maxwell equations on chap4 p.11.
2. **Structural context** --- the surrounding descriptive text tightly constrains what each
   equation must be, allowing high-confidence reconstruction.

All equations that could not be directly read from the PDF are marked `<!-- VERIFY -->` in the
knowledge files. These should be confirmed against the original slides by a human reader.

---

## Chapter 1

### Confirmed (text-visible)

- **p.28** --- `Gain = Pout/Pin`, `Pout dB = GaindB + Pin dB`, `Pout dBm = GaindB + Pin dBm`,
  `vout dB = GaindB + vin dB`, `iout dB = GaindB + iin dB` --- confirmed exact. *(chap1.pdf, p.28)*
- **p.30** --- `dB$\mu$V (RMS) = 107 + dBm` (for $R_L = 50\,\Omega$) --- confirmed exact. *(chap1.pdf, p.30)*
- **p.30** --- Attenuation formula structure:
  `PL = vL²/R`, `10 log PL = 10 log(vL²/RL)`, denominator `8.686L` --- confirms
  $\alpha = P_L(\text{dB/length})/8.686$ is correct. *(chap1.pdf, p.30)*

### Inferred (image equations, flagged <!-- VERIFY -->)

- p.16: $T_D = L/v$ --- standard formula, consistent with context. No errors found.
- p.17: Sinusoidal wave, phase difference $\Delta\phi = \beta L = 2\pi L/\lambda$ --- standard, consistent.
- p.18--19: $v = \omega/\beta$; current in delay form --- standard.
- p.20: $v = v_0/\sqrt{\mu_r\varepsilon_r}$ --- consistent with context ("velocity smaller in denser medium").
- p.21: $\lambda = v/f$; electrical dimension $k = L/\lambda$ --- consistent.
- p.25--27: Power gain $G_{p,dB} = 10\log(P_{out}/P_{in})$; voltage/current gain $20\log$ --- standard.
- p.29: Matched transmission line voltage, average power --- standard.

**Chapter 1 verdict: No transcription errors found; image equations are standard and context-consistent.**

---

## Chapter 2

### Confirmed (text-visible)

- **p.13** --- Normalization calculation: `39 + 10.46 = 49.46`, `20log(10/3) = 10.46 dB` --- confirmed
  exact. Class A limits approximately 10 dB less stringent than Class B. *(chap2.pdf, p.13)*
- **p.5** --- Range `9 kHz` (clock frequency threshold), `150 kHz -- 30 MHz` (conducted),
  `30 MHz -- 40 GHz` (radiated) --- confirmed. *(chap2.pdf, p.7)*
- **p.12** --- Antenna height: `1--4 m`. *(chap2.pdf, p.12)*
- **p.39** --- ESD: `25 kV` --- confirmed. *(chap2.pdf, p.39)*
- **p.37** --- Example PCB: `L = 7 in = 17.78 cm`; at 1 GHz, $\lambda = 30$ cm; at 30 GHz,
  $\lambda = 10$ mm --- confirmed. *(chap2.pdf, p.37)*

### Notes

No quantitative equations in the knowledge sense (no physics formulas). Chapter 2 is
primarily regulatory tables and measurement procedures. Limits themselves are given in
tables/figures (image-based) and cannot be extracted by pdftotext.

**Chapter 2 verdict: No errors found. All numerical values confirmed from text.**

---

## Chapter 3

### Confirmed (text-visible)

- **p.12** --- Duty cycle defined as $D = \tau/T$; described as "sinx/x" (sinc) function --- confirmed. *(chap3.pdf, p.12)*
- **p.27** --- $\tau_r$: rise time (10--90%), $\tau_f$: fall time (10--90%), $\tau$: pulse width (midpoints) --- confirmed. *(chap3.pdf, p.27)*
- **p.29** --- "product of two sinx/x functions" --- confirmed; consistent with $|c_n| \propto \text{sinc}(n\pi D)\cdot\text{sinc}(n\pi f_0\tau_r)$. *(chap3.pdf, p.29)*
- **p.37** --- $BW \approx 3/(\pi\tau_r) \approx 1/\tau_r$ --- confirmed exact text. *(chap3.pdf, p.37)*
- **p.37** --- "first null in the true spectrum occurs at $f = 1/\tau_r$" --- confirmed. *(chap3.pdf, p.37)*
- **p.37** --- "96% of total average power in dc term and first harmonic" --- confirmed. *(chap3.pdf, p.37)*
- **p.9** --- "$c_n^+ = 2|c_n|$" and "dc component $c_0$ unchanged" --- confirmed exact. *(chap3.pdf, p.9)*
- **p.9** --- Rewritten as function of sines expanding to trigonometric form --- confirmed. *(chap3.pdf, p.9)*
- **p.20** --- "multiply the expansion coefficients of $x(t)$ by $\exp(-jn\omega_0\alpha)$" --- confirmed exact. *(chap3.pdf, p.20)*
- **p.38** --- $BW = 1/\tau_r$ breakpoint; first breakpoint moves when duty cycle reduced --- confirmed. *(chap3.pdf, p.38)*
- **p.50** --- Autocorrelation definition includes "$x(t)x(t-\tau)dt$" --- confirmed. *(chap3.pdf, p.50)*
- **p.52** --- "PCM-NRZ" (Pulse Code Modulation - None Return to Zero) --- confirmed. *(chap3.pdf, p.52)*

### Inferred (image equations, flagged <!-- VERIFY -->)

- Fourier series complex form and coefficients --- standard, context confirmed.
- Square-wave $c_n = AD\,\text{sinc}(n\pi D)$ --- standard result, consistent with "sinx/x" text.
- Trapezoidal double-sinc product --- consistent with "product of two sinx/x" text.

**Chapter 3 verdict: No errors found.**

---

## Chapter 4

### Confirmed (text-visible / extracted text)

- **p.11** --- Maxwell equations explicitly extracted:
  $\nabla \times \mathbf{E} = -\partial\mathbf{B}/\partial t$ and
  $\nabla \times \mathbf{H} = \mathbf{J} + \partial\mathbf{D}/\partial t$ --- confirmed exact. *(chap4.pdf, p.11)*
- **p.15** --- "$\Psi = lI$" (magnetic flux = per-unit-length inductance $\times$ current) --- confirmed. *(chap4.pdf, p.15)*
- **p.17** --- "$q = cV$" --- confirmed. *(chap4.pdf, p.17)*
- **p.28** --- "effective relative permittivity $\varepsilon_r'$" defined --- confirmed. *(chap4.pdf, p.28)*
- **p.29** --- "Stripline: $\varepsilon_r' = \varepsilon_r$" (fully embedded) --- confirmed. *(chap4.pdf, p.29)*
- **p.34** --- "V+: forward-traveling wave, V-: backward-traveling wave" --- confirmed. *(chap4.pdf, p.34)*
- **p.35** --- "current reflection coefficient is the negative of the voltage reflection coefficient" --- confirmed. *(chap4.pdf, p.35)*
- **p.37** --- "process of repeated reflections continue as re-reflections at the source and load" --- confirmed. *(chap4.pdf, p.37)*
- **p.43** --- "Only a time delay is imposed, the line 'doesn't matter.'" (matched line) --- confirmed. *(chap4.pdf, p.43)*
- **p.46** --- CMOS gate parameters: output resistance 10--30 $\Omega$, input capacitance 5--15 pF --- confirmed. *(chap4.pdf, p.46)*
- **p.50** --- $V_L(t) = (V_0/2)u(t-T_D) + V_r(t)$ for TDR analysis --- confirmed text. *(chap4.pdf, p.50)*
- **p.54** --- "No current flows in the line and the resistor R ... dissipates no power" (series match) --- confirmed. *(chap4.pdf, p.54)*
- **p.59** --- "$\tau_r > 10 T_D$" criterion --- confirmed exact text. *(chap4.pdf, p.59)*
- **p.82** --- Skin depth "decreases with the square root of f" --- confirmed. *(chap4.pdf, p.82)*
- **p.83** --- High-frequency resistance "increases with the square root of f or 10 dB/decade" --- confirmed. *(chap4.pdf, p.83)*
- **p.84** --- "turning point obtained from $r_{dc} = r_{hf}$" --- confirmed. *(chap4.pdf, p.84)*
- **p.84** --- "current peaks at the corners" (rectangular land) --- confirmed. *(chap4.pdf, p.84)*
- **p.87** --- "$g = \omega c\tan\theta$" mentioned in annotation context --- confirmed. *(chap4.pdf, p.94)*
- **p.94** --- "tan$\theta$ ... 0.02 for FR-4"; "$g = \omega c\tan\theta$ (20 dB/decade)", "r (10 dB/decade)" --- confirmed. *(chap4.pdf, p.94)*
- **p.95** --- "lumped-$\pi$" and "lumped-T" models named --- confirmed. *(chap4.pdf, p.95)*
- **p.95** --- "Difficult to be used in time-domain, since losses are not easily handled" --- confirmed. *(chap4.pdf, p.95)*
- **p.97** --- "lumped-$\pi$ model with one section is valid up to 10 MHz where the line is one-tenth of a wavelength; two sections valid up to 20 MHz" --- confirmed exact. *(chap4.pdf, p.97)*
- **p.50** --- Time constant annotation "0.693CZC" appears in text --- confirms $t_d = 0.693 Z_C C_L$. *(chap4.pdf, p.57)*

### Potential issues

- Stripline, microstrip, and coplanar strip impedance formulas (pp.29--31) are entirely image-based and the specific form used by the textbook may differ from the standard approximations used here. These carry `<!-- VERIFY -->` flags.
- The exact per-unit-length formulas for PCB structures (pp.29--31) use conformal mapping results --- the specific form in the slides may differ slightly. Flagged accordingly.

**Chapter 4 verdict: No errors found in text-accessible content; PCB structure formulas (pp.29--31) need visual verification against slide images.**
