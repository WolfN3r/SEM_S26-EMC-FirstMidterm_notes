# EMC First Midterm — Study Notes

**Course:** Electromagnetic Compatibility, NTUST  
**Target audience:** Student familiar with EM fields and radio-wave basics  
**Source of truth:** chap1.pdf – chap4.pdf

---

## Chapter 1: Introduction to EMC

### What Is EMC?

A system is **electromagnetically compatible** when it:
1. Does not cause interference with other systems
2. Is not susceptible to emissions from other systems
3. Does not interfere with itself

*(chap1.pdf, p.4)*

### The Three-Element Model

Every EMC problem reduces to:

$$\text{Source} \;\rightarrow\; \text{Coupling Path} \;\rightarrow\; \text{Receptor}$$

*(chap1.pdf, p.5)*

Interference occurs only when the received energy causes the receptor to behave undesirably. The most cost-effective fix attacks the source first, then the coupling path, and last the receptor. *(chap1.pdf, p.6)*

### Four EMC Subproblems

| # | Problem | Transfer mechanism |
|---|---------|-------------------|
| 1 | Radiated emissions | Source radiates outward |
| 2 | Radiated susceptibility | External radiation couples in |
| 3 | Conducted emissions | Noise exits via power/signal cable |
| 4 | Conducted susceptibility | Noise enters via power/signal cable |

*(chap1.pdf, p.7)*

### Other EMC Phenomena (Not Government-Regulated)

ESD, EMP, lightning, and TEMPEST all fall outside standard emission limits but must be designed against. *(chap1.pdf, p.9)*

---

### Electrical Dimensions and Wave Propagation

**Why it matters:** A structure's ability to radiate scales with its electrical size (size relative to wavelength), not its physical size.

**Time delay** for a signal to traverse length $\mathscr{L}$:

$$T_D = \frac{\mathscr{L}}{v}$$

*(chap1.pdf, p.16)*

**Phase velocity** (relates wavelength and frequency):

$$v = \lambda f \quad \text{m/s}$$

*(chap1.pdf, p.18)*

**Velocity in a medium** (slows in denser dielectric):

$$v = \frac{1}{\sqrt{\epsilon\mu}} = \frac{v_0}{\sqrt{\epsilon_r \mu_r}}, \quad v_0 = 3\times10^8 \text{ m/s}$$

*(chap1.pdf, p.20)*

**Electrical dimension** (dimensionless measure of electrical size):

$$k = \frac{\mathscr{L}}{\lambda}$$

*(chap1.pdf, p.21)*

Rule of thumb: if $k < 0.1$ ($\mathscr{L} < \lambda/10$), lumped-circuit analysis is adequate. If $k \sim 1$ or larger, transmission-line or full-wave analysis is needed.

**Key frequencies and wavelengths in free space** *(chap1.pdf, p.21)*:

| Frequency | $\lambda$ |
|-----------|----------|
| 30 MHz | 10 m |
| 300 MHz | 1 m |
| 3 GHz | 10 cm |

**PCB substrate:** Epoxy glass ($\epsilon_r = 4.7$), so $\lambda_\text{PCB} = \lambda_0/\sqrt{4.7} \approx \lambda_0/2.17$. *(chap1.pdf, p.23)*

---

### Decibels

**Power gain:**

$$G_\text{dB} = 10\log_{10}\!\left(\frac{P_\text{out}}{P_\text{in}}\right)$$

*(chap1.pdf, p.25)*

**Voltage/current gain:**

$$G_\text{dB} = 20\log_{10}\!\left(\frac{V_\text{out}}{V_\text{in}}\right) = 20\log_{10}\!\left(\frac{I_\text{out}}{I_\text{in}}\right)$$

*(chap1.pdf, p.26)*

Handy values: ratio of 2 → 6 dB (voltage), 3 dB (power); ratio of 10 → 20 dB (voltage), 10 dB (power). *(chap1.pdf, p.27)*

**Gains add in dB** — useful for cascaded amplifiers/attenuators. *(chap1.pdf, p.28)*

**Cable loss formula** (for matched load, $Z_L = Z_C$):

$$\text{Cable loss (dB)} = 8.686\,\alpha\mathscr{L}$$

*(chap1.pdf, p.30)*

where $\alpha$ (Np/m) is the attenuation constant. This formula appears again in Chapter 4.

**Unit conversion** (for 50 Ω system):

$$\text{dB}\mu\text{V (RMS)} = 107 + \text{dBm}$$

*(chap1.pdf, p.30)*

---

## Chapter 2: EMC Requirements

### Regulatory Overview

| Region | Body | Standard |
|--------|------|---------|
| USA | FCC | Part 15 of Title 47 CFR |
| International | CISPR (IEC committee) | CISPR 22 |
| Military | DoD | MIL-STD-461E |

*(chap2.pdf, p.4–5)*

**Class A** = commercial/industrial (less stringent).  
**Class B** = residential (more stringent, because residents lack technical resources). *(chap2.pdf, p.6)*

### Conducted Emissions (150 kHz – 30 MHz)

Measured via **LISN** (Line Impedance Stabilization Network). The LISN presents ~50 Ω to the EUT and blocks 60 Hz power from reaching the receiver. *(chap2.pdf, p.28–30)*

Key Class B limits: 56–60 dBµV (quasi-peak).  
Key Class A limits: 73–79 dBµV (quasi-peak). *(chap2.pdf, p.8)*

CISPR 22 conducted limits are the same as FCC. *(chap2.pdf, p.15)*

### Radiated Emissions (30 MHz – 40 GHz)

Measured in a **Semianechoic Chamber (SAC)** or **OATS**.  
Both vertical and horizontal polarizations measured; antenna scanned 1–4 m height. *(chap2.pdf, p.26)*

Class B at **3 m**: 40 dBµV/m (30–88 MHz) to 54 dBµV/m (>960 MHz). *(chap2.pdf, p.11)*  
Class A at **10 m**: 39 dBµV/m (30–88 MHz) to 49.5 dBµV/m (>960 MHz). *(chap2.pdf, p.11)*

**Distance normalization:** To compare limits measured at different distances:

$$\Delta E_\text{dB} = 20\log_{10}\!\left(\frac{d_1}{d_2}\right)$$

*(chap2.pdf, p.13)*

Normalizing Class A (10 m) to 3 m adds $20\log_{10}(10/3) \approx 10.5$ dB — confirming Class A is about 10 dB less stringent than Class B. *(chap2.pdf, p.13)*

CISPR 22 radiated limits cover only up to **1 GHz** (FCC goes to 40 GHz). European CISPR 22 Class B limits (30 dBµV/m at 10 m, 30–230 MHz) are more stringent than FCC Class B. *(chap2.pdf, p.14)*

### MIL-STD-461E

Much wider frequency ranges and can be **tailored** (waived) by procuring authority. Key test families:

- **CE** = Conducted Emissions; **CS** = Conducted Susceptibility
- **RE** = Radiated Emissions; **RS** = Radiated Susceptibility

CE102 covers 10 kHz–10 MHz on power leads. RE102 covers 10 kHz–18 GHz. RS103 sets up to 200 V/m for external aircraft. *(chap2.pdf, p.17–22)*

### Design Strategy

- Find the **dominant emission source** before applying fixes. *(chap2.pdf, p.40)*
- Plan for EMC early: "Paper work before layout." Provide passive component footprints (capacitors, resistors) as an insurance policy. *(chap2.pdf, p.41)*
- Even a simple PCB with a 10 MHz oscillator can exceed Class B radiated limits by **30 dB**. *(chap2.pdf, p.38)*

---

## Chapter 3: Signal Spectra

### Why the Spectrum Matters for EMC

The **rise time** ($\tau_r$), not the clock frequency, dominates how much high-frequency energy a signal produces. Faster edges → broader spectrum → harder to pass EMC. *(chap3.pdf, p.3)*

### Fourier Series

Any periodic signal with period $T$ and fundamental frequency $f_0 = 1/T$:

$$x(t) = \sum_{n=-\infty}^{\infty} c_n\, e^{jn\omega_0 t}$$

*(chap3.pdf, p.7)*

Fourier coefficients:

$$c_n = \frac{1}{T}\int_{t_1}^{t_1+T} x(t)\,e^{-jn\omega_0 t}\,dt$$

*(chap3.pdf, p.8)*

$c_0$ is the DC (average) value; $c_n = c_{-n}^*$ for real signals. The one-sided spectrum uses $2|c_n|$ for $n \geq 1$. *(chap3.pdf, p.9)*

### Spectrum of a Rectangular Pulse Train

For a train of rectangular pulses, amplitude $A$, width $\tau$, period $T$:

$$|c_n| = \frac{A\tau}{T}\left|\frac{\sin(\pi f\tau)}{\pi f\tau}\right|$$

*(chap3.pdf, p.12)*

DC level: $c_0 = A\tau/T = AD$ where $D = \tau/T$ is duty cycle. *(chap3.pdf, p.12)*

**50% duty cycle:** Even harmonics are zero ($c_n = 0$ for even $n$). *(chap3.pdf, p.14)*

### Spectrum of a Trapezoidal (Clock) Waveform

A trapezoidal pulse has finite rise time $\tau_r$ and fall time $\tau_f$. For $\tau_r = \tau_f$, the coefficients are the **product of two sinc functions**:

$$c_n = A\frac{\tau}{T} \cdot \frac{\sin\!\left(\tfrac{1}{2}n\omega_0\tau\right)}{\tfrac{1}{2}n\omega_0\tau} \cdot \frac{\sin\!\left(\tfrac{1}{2}n\omega_0\tau_r\right)}{\tfrac{1}{2}n\omega_0\tau_r} \cdot e^{-jn\omega_0(\tau+\tau_r)/2}$$

*(chap3.pdf, p.29)*

### Spectral Envelope (Bode Plot Approximation)

The magnitude spectrum envelope has **three regions**:

| Frequency range | Slope | Breakpoint |
|----------------|-------|-----------|
| $f < f_1 = \dfrac{1}{\pi\tau}$ | 0 dB/decade (flat) | $f_1$ |
| $f_1 < f < f_2 = \dfrac{1}{\pi\tau_r}$ | $-20$ dB/decade | $f_2$ |
| $f > f_2$ | $-40$ dB/decade | — |

*(chap3.pdf, p.34)*

Peak envelope level: $2A\tau/T$. The first breakpoint $f_1$ depends on pulse width $\tau$; the second breakpoint $f_2$ depends on rise time $\tau_r$.

> **Key insight:** To reduce high-frequency emissions, increase the rise/fall time $\tau_r$. This moves $f_2$ lower and steepens the roll-off sooner. *(chap3.pdf, p.35)*

### Signal Bandwidth

$$\text{BW} = \frac{1}{\tau_r}$$

*(chap3.pdf, p.37)*

This is the frequency at which the high-frequency ($-40$ dB/dec) region begins; above this frequency the spectrum falls very fast.

### Effect of Duty Cycle

Reducing duty cycle $D = \tau/T$:
- Lowers the flat (DC) spectral level
- Moves the first breakpoint $f_1 = 1/(\pi\tau)$ to higher frequency
- Does **not** change the high-frequency content (no effect on $f_2$ or the $-40$ dB/dec slope)

*(chap3.pdf, p.38–39)*

### Ringing (Undershoot/Overshoot)

PCB trace inductance and capacitance cause ringing oscillations at frequency $\omega_r$ on signal edges. In the spectrum, ringing adds a **spectral peak at $\omega_r$**. Fix with a series damping resistor or ferrite bead. *(chap3.pdf, p.40–41)*

### Spectrum Analyzers

A spectrum analyzer is a swept bandpass receiver. The **resolution bandwidth** must be smaller than the harmonic spacing to resolve individual harmonics. Regulatory measurements use a **quasi-peak (QP) detector** (penalizes pulsed interference more than CW). *(chap3.pdf, p.44–46)*

### PCM-NRZ Power Spectral Density

For random binary data (0 to $X_0$, equal probability):

$$G_x(f) = \frac{X_0^2}{4}\,\delta(f) + \frac{X_0^2 T}{4}\,\frac{\sin^2(\pi fT)}{(\pi fT)^2} \quad \text{W/Hz}$$

*(chap3.pdf, p.52)*

The first term is a DC spike; the second is a continuous sinc-squared spectrum with nulls at $f = n/T$.

---

## Chapter 4: Transmission Lines and Signal Integrity

### Why Transmission Lines?

At high frequencies, a PCB trace is not a simple wire — it is a **transmission line** that:
- Imposes a **time delay** $T_D = \mathscr{L}/v$ *(chap4.pdf, p.3)*
- Can cause **reflections** when impedance is mismatched → signal integrity degradation

### Telegrapher's Equations

A lossless transmission line is modeled as cascaded $l\Delta z$ inductors (series) and $c\Delta z$ capacitors (shunt), where $l$ (H/m) and $c$ (F/m) are per-unit-length parameters.

**KVL → voltage equation:**

$$\frac{\partial V}{\partial z} = -l\,\frac{\partial I}{\partial t}$$

*(chap4.pdf, p.8)*

**KCL → current equation:**

$$\frac{\partial I}{\partial z} = -c\,\frac{\partial V}{\partial t}$$

*(chap4.pdf, p.9)*

Combined into wave equations:

$$\frac{\partial^2 V}{\partial z^2} = lc\,\frac{\partial^2 V}{\partial t^2}, \quad \frac{\partial^2 I}{\partial z^2} = lc\,\frac{\partial^2 I}{\partial t^2}$$

*(chap4.pdf, p.10)*

### Key Relationships

For a **homogeneous** medium:

$$lc = \mu\epsilon, \quad v = \frac{1}{\sqrt{lc}} = \frac{v_0}{\sqrt{\epsilon_r}}, \quad Z_C = \sqrt{\frac{l}{c}}$$

*(chap4.pdf, p.12, 28)*

TEM waves are supported: no field components along the direction of propagation.

### Time-Domain Solution

General solution (forward + backward waves):

$$V(z,t) = V^+\!\!\left(t - \frac{z}{v}\right) + V^-\!\!\left(t + \frac{z}{v}\right)$$

$$I(z,t) = \frac{1}{Z_C}V^+\!\!\left(t - \frac{z}{v}\right) - \frac{1}{Z_C}V^-\!\!\left(t + \frac{z}{v}\right)$$

*(chap4.pdf, p.34)*

**Initially launched voltage** from source (voltage divider between $R_S$ and $Z_C$):

$$V(0,t) = \frac{Z_C}{R_S + Z_C}\,V_S(t)$$

*(chap4.pdf, p.37)*

### Reflection Coefficients

**Load reflection coefficient:**

$$\Gamma_L = \frac{R_L - Z_C}{R_L + Z_C}$$

*(chap4.pdf, p.35)*

**Source reflection coefficient:**

$$\Gamma_S = \frac{R_S - Z_C}{R_S + Z_C}$$

*(chap4.pdf, p.37)*

Special cases:

| Load | $\Gamma_L$ |
|------|-----------|
| Matched ($R_L = Z_C$) | 0 — no reflection |
| Open circuit ($R_L \to \infty$) | +1 — full reflection |
| Short circuit ($R_L = 0$) | −1 — full reflection, reversed |

### Bounce (Lattice) Diagram

A graphical tool: plot $z$ on the horizontal axis, time on vertical, and trace diagonal lines for each forward/backward wave. Multiply voltage by $\Gamma_L$ at the load end and $\Gamma_S$ at the source end with each bounce. *(chap4.pdf, p.42–43)*

**Steady-state voltage** on a lossless line equals the DC voltage divider result $V_S \cdot R_L/(R_S + R_L)$ regardless of $Z_C$ — after enough reflections, the voltage settles.

### When Can the Line Be Ignored?

A transmission line can be treated as a lumped element (just a wire) when:

$$\tau_r > 10\,T_D$$

*(chap4.pdf, p.59)*

where $\tau_r$ is the signal rise time and $T_D = \mathscr{L}/v$ is the one-way travel time. If $\tau_r < 10\,T_D$, transmission-line effects (reflections, overshoot) are significant.

### Matching Schemes

**Series match:** Insert resistor $R$ at the source so that $R_S + R = Z_C$. *(chap4.pdf, p.54)*  
- Eliminates ringing; zero steady-state power dissipation in $R$.

**Parallel match:** Add resistor $R$ at load so that $R \| R_L = Z_C$. *(chap4.pdf, p.55)*  
- Eliminates ringing; dissipates power continuously.

### Capacitive and Inductive Terminations

A **capacitive load** looks initially like a short ($\Gamma_L = -1$) then transitions to open ($\Gamma_L = +1$). Added delay at 50% threshold:

$$t_d = 0.693\,Z_C\,C$$

*(chap4.pdf, p.52)*

An **inductive load** is initially open ($\Gamma_L = +1$), then short-circuits ($\Gamma_L = -1$). *(chap4.pdf, p.53)*

### Phasor (Sinusoidal Steady-State) Analysis

For sinusoidal excitation at frequency $f$, with phase constant $\beta = \omega/v = 2\pi/\lambda$:

$$\hat{V}(z) = \hat{V}^+ e^{-j\beta z} + \hat{V}^- e^{j\beta z}$$

*(chap4.pdf, p.73)*

**Input impedance** of a lossless line of length $\mathscr{L}$ with load $\hat{Z}_L$:

$$\hat{Z}_\text{in} = Z_C\,\frac{\hat{Z}_L + jZ_C\tan\beta\mathscr{L}}{Z_C + j\hat{Z}_L\tan\beta\mathscr{L}}$$

*(chap4.pdf, p.76)*

**VSWR** (measures the severity of mismatch):

$$\text{VSWR} = \frac{1 + |\hat{\Gamma}_L|}{1 - |\hat{\Gamma}_L|}, \quad 1 \leq \text{VSWR} \leq \infty$$

*(chap4.pdf, p.77)*

VSWR = 1 means perfectly matched; VSWR = ∞ means total reflection (open or short load).

**Average power flow:**

$$P_\text{av} = \frac{|\hat{V}^+|^2}{2Z_C}\!\left(1 - |\hat{\Gamma}_L|^2\right)$$

*(chap4.pdf, p.78)*

### Lossy Transmission Lines

Add per-unit-length resistance $r$ (skin effect) and conductance $g$ (dielectric loss):

**Propagation constant:**

$$\hat{\gamma} = \sqrt{(r + j\omega l)(g + j\omega c)} = \alpha + j\beta$$

*(chap4.pdf, p.81)*

**Skin depth** (current penetration depth in conductor):

$$\delta = \frac{1}{\sqrt{\pi f\mu_0\sigma}} \text{ m}$$

*(chap4.pdf, p.82)*

Skin depth decreases as $1/\sqrt{f}$, so conductor resistance increases as $\sqrt{f}$ at high frequency (10 dB/decade). *(chap4.pdf, p.82–83)*

**Loss tangent** (dielectric loss):

$$\tan\theta = \frac{\epsilon_r''}{\epsilon_r'}, \quad g = \omega c\tan\theta$$

*(chap4.pdf, p.87)*

Dielectric conductance $g$ increases linearly with frequency (20 dB/decade). For FR-4: $\tan\theta \approx 0.02$.

**Low-loss approximation** (valid when $r \ll \omega l$ and $g \ll \omega c$):

$$\alpha \approx \frac{1}{2}\!\left(\frac{r}{Z_C} + gZ_C\right), \quad \beta \approx \omega\sqrt{lc}, \quad Z_C \approx \sqrt{\frac{l}{c}}$$

*(chap4.pdf, p.90–91)*

In this regime $\beta$ is linear in $f$ (no phase dispersion) and $Z_C$ is real and frequency-independent.

**Cable loss** (matched load):

$$\text{Loss (dB)} = 8.686\,\alpha\mathscr{L}$$

*(chap4.pdf, p.89)*

---

## Quick-Reference Formula Sheet

| Concept | Formula | Source |
|---------|---------|--------|
| Time delay | $T_D = \mathscr{L}/v$ | *(chap1.pdf, p.16)* |
| Phase velocity | $v = \lambda f = v_0/\sqrt{\epsilon_r\mu_r}$ | *(chap1.pdf, p.18, 20)* |
| Electrical dimension | $k = \mathscr{L}/\lambda$ | *(chap1.pdf, p.21)* |
| Voltage gain (dB) | $20\log_{10}(V_\text{out}/V_\text{in})$ | *(chap1.pdf, p.26)* |
| Cable loss | $8.686\alpha\mathscr{L}$ dB | *(chap1.pdf, p.30)* |
| Distance normalization | $\Delta E = 20\log_{10}(d_1/d_2)$ dB | *(chap2.pdf, p.13)* |
| Fourier coefficient | $c_n = \frac{1}{T}\int x(t)e^{-jn\omega_0 t}dt$ | *(chap3.pdf, p.8)* |
| Rect. pulse spectrum | $\|c_n\| = \frac{A\tau}{T}\left\|\frac{\sin\pi f\tau}{\pi f\tau}\right\|$ | *(chap3.pdf, p.12)* |
| First breakpoint | $f_1 = 1/(\pi\tau)$ | *(chap3.pdf, p.34)* |
| Second breakpoint | $f_2 = 1/(\pi\tau_r)$ | *(chap3.pdf, p.34)* |
| Signal bandwidth | $\text{BW} = 1/\tau_r$ | *(chap3.pdf, p.37)* |
| PCM-NRZ PSD | $G_x(f) = \frac{X_0^2}{4}\delta(f) + \frac{X_0^2 T}{4}\frac{\sin^2\pi fT}{(\pi fT)^2}$ | *(chap3.pdf, p.52)* |
| Telegrapher's (KVL) | $\partial V/\partial z = -l\,\partial I/\partial t$ | *(chap4.pdf, p.8)* |
| Telegrapher's (KCL) | $\partial I/\partial z = -c\,\partial V/\partial t$ | *(chap4.pdf, p.9)* |
| Characteristic impedance | $Z_C = \sqrt{l/c}$ | *(chap4.pdf, p.28)* |
| $lc$ product | $lc = \mu\epsilon$, so $v = 1/\sqrt{lc}$ | *(chap4.pdf, p.12)* |
| Load reflection | $\Gamma_L = (R_L - Z_C)/(R_L + Z_C)$ | *(chap4.pdf, p.35)* |
| Source reflection | $\Gamma_S = (R_S - Z_C)/(R_S + Z_C)$ | *(chap4.pdf, p.37)* |
| Launched voltage | $V(0,t) = \frac{Z_C}{R_S+Z_C}V_S(t)$ | *(chap4.pdf, p.37)* |
| TL negligible | $\tau_r > 10T_D$ | *(chap4.pdf, p.59)* |
| Input impedance | $Z_\text{in} = Z_C\frac{Z_L + jZ_C\tan\beta\mathscr{L}}{Z_C + jZ_L\tan\beta\mathscr{L}}$ | *(chap4.pdf, p.76)* |
| VSWR | $(1+\|\Gamma_L\|)/(1-\|\Gamma_L\|)$ | *(chap4.pdf, p.77)* |
| Propagation constant | $\hat{\gamma} = \sqrt{(r+j\omega l)(g+j\omega c)}$ | *(chap4.pdf, p.81)* |
| Skin depth | $\delta = 1/\sqrt{\pi f\mu_0\sigma}$ | *(chap4.pdf, p.82)* |
| Loss tangent | $\tan\theta = \epsilon_r''/\epsilon_r'$, $g = \omega c\tan\theta$ | *(chap4.pdf, p.87)* |
| Low-loss $\alpha$ | $\alpha \approx \frac{1}{2}(r/Z_C + gZ_C)$ | *(chap4.pdf, p.91)* |
