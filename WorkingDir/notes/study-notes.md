# EMC First Midterm --- Study Notes

---

## Chapter 1: Introduction to EMC

### What is EMC?

**Electromagnetic Compatibility (EMC)** is the discipline of ensuring that electronic systems neither produce nor are affected by harmful electromagnetic interference (EMI). A system is EMC-compliant when it satisfies all three criteria simultaneously *(chap1.pdf, p.4)*:

1. It does **not cause** interference with other systems.
2. It is **not susceptible** to emissions from other systems.
3. It does **not cause** interference **with itself**.

Interference only occurs when unwanted coupling actually causes a receptor to **misbehave**. Mere coupling --- without degraded behaviour --- is not interference. *(chap1.pdf, p.5)*

### Three-Stage EMC Coupling Model

Every EMC problem has three stages: **Source $\to$ Coupling Path $\to$ Receptor**. *(chap1.pdf, p.5)*

To fix an EMC problem, attack at one or more of these stages --- in order of cost-effectiveness *(chap1.pdf, p.6)*:

1. Suppress the **source** (cheapest, most effective).
2. Break or attenuate the **coupling path**.
3. Harden the **receptor**.

### Four Basic EMC Subproblems *(chap1.pdf, p.7)*

| # | Type | Path |
|---|------|------|
| 1 | Radiated emissions | Device $\to$ air $\to$ external |
| 2 | Radiated susceptibility | External $\to$ air $\to$ device |
| 3 | Conducted emissions | Device $\to$ power cord $\to$ system |
| 4 | Conducted susceptibility | System $\to$ power cord $\to$ device |

The power cord carries not only 60 Hz but also high-frequency noise; these can radiate or conduct to other equipment. *(chap1.pdf, p.8)*

---

### Electrical Dimensions and Waves

The key question is: how large is a circuit element or conductor relative to the wavelength of the highest-frequency signal?

$$k = \frac{L}{\lambda}$$
*(chap1.pdf, p.21)*

| Condition | Appropriate model |
|-----------|------------------|
| $k \ll 0.1$ (i.e. $L < \lambda/10$) | Lumped-circuit theory (KVL, KCL) |
| $k \sim 1$ or larger | Maxwell's equations |

**Phase velocity** in a medium with relative permittivity $\varepsilon_r$ and permeability $\mu_r$:

$$v = \frac{v_0}{\sqrt{\mu_r\,\varepsilon_r}}, \qquad v_0 = 3\times10^8\text{ m/s}$$
*(chap1.pdf, p.20)*

**Wavelength** in the medium:

$$\lambda = \frac{v}{f} = \frac{v_0}{f\sqrt{\mu_r\,\varepsilon_r}}$$
*(chap1.pdf, p.21)*

A denser medium (larger $\varepsilon_r$) $\to$ smaller $\lambda$ $\to$ larger electrical dimension $\to$ the circuit is **more like a transmission line** and less like a lumped element.

**Phase difference** over a length $L$:

$$\Delta\phi = \beta L = \frac{2\pi L}{\lambda}$$
*(chap1.pdf, p.17)*

This phase shift is equivalent to a **time delay** $T_D = L/v$. *(chap1.pdf, p.16--19)*

---

### Decibels and EMC Units

#### dB Definitions

$$G_{p,\text{dB}} = 10\log_{10}\!\left(\frac{P_{out}}{P_{in}}\right)$$
*(chap1.pdf, p.25)*

$$G_{V,\text{dB}} = 20\log_{10}\!\left(\frac{V_{out}}{V_{in}}\right)$$
*(chap1.pdf, p.26)*

When input and load resistances are equal ($R_{in} = R_L$), the power gain equals the voltage gain in dB. *(chap1.pdf, p.26)*

#### dB Arithmetic

Gains add, losses subtract in dB:

$$P_{out,\text{dBm}} = G_{\text{dB}} + P_{in,\text{dBm}}$$
*(chap1.pdf, p.28)*

#### Cable Attenuation

For a matched, lossy cable (attenuation constant $\alpha$ Np/m), power falls off exponentially. The attenuation in dB per unit length is:

$$\alpha\,[\text{Np/m}] = \frac{P_L\,[\text{dB/m}]}{8.686}$$
*(chap1.pdf, p.30)*

**Voltage--Power relationship** (50 $\Omega$ system):

$$\text{dB$\mu$V}_{\text{RMS}} = 107 + \text{dBm}$$
*(chap1.pdf, p.30)*

#### 50 $\Omega$ Standard Impedance *(chap1.pdf, p.33)*

All modern EMC test equipment (spectrum analysers, signal sources, cables) uses 50 $\Omega$. When the load equals the cable characteristic impedance, the input impedance is constant at all frequencies and cable lengths --- essential for swept-frequency measurements.

---

## Chapter 2: EMC Regulatory Requirements

### Overview

Two categories of requirements *(chap2.pdf, p.3)*:
- **Governmental** (FCC, CISPR, MIL-STD): legally mandatory.
- **Manufacturer-imposed**: for product quality/reliability.

### FCC (USA)

Any digital device using a clock > 9 kHz must comply with FCC Part 15. *(chap2.pdf, p.5)*

| Class | Environment | Limits |
|-------|-------------|--------|
| A | Commercial/industrial | Less stringent |
| B | Residential | More stringent |

**Conducted emissions:** 150 kHz -- 30 MHz, measured with a LISN. *(chap2.pdf, p.7)*

**Radiated emissions:** 30 MHz -- 40 GHz, measured at OATS or SAC. *(chap2.pdf, p.7)*

Class A measured at 10 m; Class B at 3 m. After normalising Class A to 3 m:

$$\Delta = 20\log_{10}\!\left(\frac{10}{3}\right) \approx 10.46\text{ dB}$$
*(chap2.pdf, p.13)*

Class A limits are ~10 dB **less stringent** than Class B. *(chap2.pdf, p.13)*

### CISPR 22 (International)

- Conducted limits: same as FCC. *(chap2.pdf, p.15)*
- Radiated limits: up to 1 GHz only; measured at 10 m. *(chap2.pdf, p.16)*
- First standard to mandate **susceptibility (immunity)** testing for commercial products. *(chap2.pdf, p.16)*

### MIL-STD-461E

Much wider frequency range; requirements can be waived or tailored. Key tests: RS103 (radiated susceptibility), CE102 (conducted emissions), RE102 (radiated emissions). *(chap2.pdf, pp.17--23)*

### Measurement Infrastructure

#### Semianechoic Chamber (SAC) *(chap2.pdf, pp.25--27)*

- Top + sides: RF absorbers; Floor: ground plane.
- Measurement antenna scanned from 1--4 m height; maximum emission recorded.
- Detector: quasi-peak (FCC/CISPR), peak (MIL).
- Antennas: biconical (30--200 MHz), log-periodic (200 MHz -- 1 GHz), rod dipole/horn (MIL).

#### LISN *(chap2.pdf, pp.28--32)*

The Line Impedance Stabilisation Network (LISN):
- Presents a **constant 50 $\Omega$** to the EUT at RF
- Rejects 60 Hz power, passes 150 kHz -- 30 MHz noise to the receiver

A PCB that complied with the DIP-oscillator design still exceeded Class B by 30 dB (horizontal) and 15 dB (vertical) because the board itself --- $\lambda/2$ at 1 GHz --- acted as an antenna. *(chap2.pdf, p.38)*

### EMC Design Principles *(chap2.pdf, p.41)*

> "Paper work before layout" --- analyse EMC before committing to PCB layout.
>
> "Prepare holes for capacitors and resistors" --- reserve component footprints for EMC fixes.

---

## Chapter 3: Signal Spectra

### Why Spectra Matter

EMC compliance depends on the **frequency content** of signals, not just their amplitude or fundamental frequency. The **rise/fall time** dominates high-frequency spectral content. *(chap3.pdf, p.3)*

### Fourier Series of a Periodic Signal

$$x(t) = \sum_{n=-\infty}^{\infty} c_n\,e^{jn\omega_0 t}, \qquad \omega_0 = 2\pi/T$$
*(chap3.pdf, p.7)*

Expansion coefficients:

$$c_n = \frac{1}{T}\int_0^T x(t)\,e^{-jn\omega_0 t}\,dt, \qquad c_0 = \frac{1}{T}\int_0^T x(t)\,dt$$
*(chap3.pdf, p.8)*

One-sided spectrum: $c_n^+ = 2|c_n|$ for $n > 0$; $c_0^+ = c_0$. *(chap3.pdf, p.9)*

### Square-Wave Pulse Train *(chap3.pdf, p.11)*

Amplitude $A$, pulse width $\tau$, period $T$, duty cycle $D = \tau/T$:

$$c_n = AD\,\frac{\sin(n\pi D)}{n\pi D}$$
*(chap3.pdf, p.11)*

This is a **sinc function** in $n$. At $D = 1/2$, even harmonics vanish. *(chap3.pdf, p.14)*

### Computational Shortcuts *(chap3.pdf, pp.19--24)*

| Property | Effect on $c_n$ |
|----------|----------------|
| Linearity | $c_n$ scales and adds |
| Time-shift by $\alpha$ | Multiply by $e^{-jn\omega_0\alpha}$ |
| Derivative | Multiply by $(jn\omega_0)^k$ |
| Impulse train $\sum\delta(t-kT)$ | All $c_n = 1/T$ |

Practical method: differentiate until impulses appear, find their $c_n$, then divide by $(jn\omega_0)^k$.

### Trapezoidal Clock Waveform *(chap3.pdf, pp.27--30)*

With rise time $\tau_r = \tau_f$:

$$|c_n| = AD\left|\frac{\sin(n\pi D)}{n\pi D}\right|\cdot\left|\frac{\sin(n\pi f_0\tau_r)}{n\pi f_0\tau_r}\right|$$
*(chap3.pdf, p.29)*

Product of two sinc functions --- one for duty cycle, one for rise time.

### Spectral Bounds (Bode Envelope) *(chap3.pdf, pp.33--34)*

The envelope of $2|c_n|$ vs. frequency:

| Region | Behavior |
|--------|----------|
| $f < 1/(\pi\tau)$ | Flat at $2AD$ |
| $1/(\pi\tau) < f < 1/(\pi\tau_r)$ | -20 dB/decade |
| $f > 1/(\pi\tau_r)$ | -40 dB/decade |

**Bandwidth:**

$$BW \approx \frac{1}{\tau_r}$$
*(chap3.pdf, p.37)*

**Key takeaway:** To reduce high-frequency emissions, **slow down the edges** (increase $\tau_r$). Reducing duty cycle lowers low-frequency content but does not affect high-frequency content. *(chap3.pdf, p.35, p.39)*

### Ringing *(chap3.pdf, pp.40--42)*

Undershoot/overshoot (from PCB trace L and C) increases emissions at the **ringing frequency**. Remedies: series damping resistor, ferrite bead, or matched transmission line.

### Spectrum Analyser *(chap3.pdf, pp.44--46)*

- **Resolution bandwidth (RBW):** 6 dB bandwidth. Use smallest RBW for lowest noise floor.
- Regulatory measurements use the **quasi-peak (QP)** detector.
- Harmonic spacing must exceed RBW to avoid blending.

### Fourier Transform *(chap3.pdf, p.47)*

$$X(j\omega) = \int_{-\infty}^{\infty} x(t)\,e^{-j\omega t}\,dt, \qquad x(t) = \frac{1}{2\pi}\int_{-\infty}^{\infty} X(j\omega)\,e^{j\omega t}\,d\omega$$
*(chap3.pdf, p.47)*

Linear system output: $Y(j\omega) = H(j\omega)\,X(j\omega)$. *(chap3.pdf, p.49)*

### Random (PCM-NRZ) Signals *(chap3.pdf, pp.50--53)*

Power spectral density via Wiener-Kinchine theorem:

$$S_{xx}(f) = \mathcal{F}\{R_{xx}(\tau)\}$$
*(chap3.pdf, p.52)*

For PCM-NRZ (bit period $T$, levels 0 and $X_0$):

$$S_{xx}(f) = \frac{X_0^2\,T}{4}\,\text{sinc}^2(fT)$$
*(chap3.pdf, p.52)*

This is equivalent to squaring the spectrum of a 50% duty-cycle square pulse train.

---

## Chapter 4: Transmission Lines and Signal Integrity

### Why Transmission Lines?

When a conductor's physical length approaches $\lambda/10$ at the highest signal frequency, lumped-circuit theory fails and the conductor must be treated as a **transmission line**. The line imposes a time delay and can cause reflections. *(chap4.pdf, p.3)*

### Lossless Line Equations *(chap4.pdf, pp.8--10)*

KVL and KCL on a $\Delta z$ section give:

$$-\frac{\partial V}{\partial z} = l\,\frac{\partial I}{\partial t}, \qquad -\frac{\partial I}{\partial z} = c\,\frac{\partial V}{\partial t}$$
*(chap4.pdf, pp.8--9)*

Decoupled wave equations:

$$\frac{\partial^2 V}{\partial z^2} = lc\,\frac{\partial^2 V}{\partial t^2}, \qquad \frac{\partial^2 I}{\partial z^2} = lc\,\frac{\partial^2 I}{\partial t^2}$$
*(chap4.pdf, p.10)*

### TEM Mode Relationship *(chap4.pdf, p.12)*

For homogeneous surrounding medium:

$$lc = \mu\varepsilon, \qquad v = \frac{1}{\sqrt{lc}} = \frac{v_0}{\sqrt{\mu_r\,\varepsilon_r}}$$
*(chap4.pdf, p.12)*

This allows $l$ and $c$ to be computed using static (dc) field solutions. *(chap4.pdf, p.12)*

### Per-Unit-Length Parameters (Key Results)

| Structure | $l$ [H/m] | $c$ [F/m] |
|-----------|-----------|-----------|
| Two-wire (exact, radii $a$, sep. $d$) | $\dfrac{\mu_0}{\pi}\cosh^{-1}\!\dfrac{d}{2a}$ | $\dfrac{\pi\varepsilon_0}{\cosh^{-1}(d/2a)}$ |
| Wire above ground (height $h$, radius $a$) | $\dfrac{\mu_0}{2\pi}\cosh^{-1}\!\dfrac{h}{a}$ | $\dfrac{2\pi\varepsilon_0}{\cosh^{-1}(h/a)}$ |
| Coaxial (inner $a$, outer $b$) | $\dfrac{\mu_0}{2\pi}\ln\!\dfrac{b}{a}$ | $\dfrac{2\pi\varepsilon_0\varepsilon_r}{\ln(b/a)}$ |

*(chap4.pdf, pp.19--26)*

Note: $lc = \mu_0\varepsilon_0$ for all lossless homogeneous-medium lines. *(chap4.pdf, p.12)*

### Time-Domain Solution *(chap4.pdf, pp.34--37)*

General solution:

$$V(z,t) = V^+(t-z/v) + V^-(t+z/v)$$
*(chap4.pdf, p.34)*

$$I(z,t) = \frac{V^+(t-z/v) - V^-(t+z/v)}{Z_C}, \qquad Z_C = \sqrt{l/c}$$
*(chap4.pdf, p.34)*

**Load reflection coefficient:**

$$\Gamma_L = \frac{Z_L - Z_C}{Z_L + Z_C}$$
*(chap4.pdf, p.35)*

**Source reflection coefficient** (identical form):

$$\Gamma_S = \frac{Z_S - Z_C}{Z_S + Z_C}$$
*(chap4.pdf, p.36)*

**Initial forward voltage** (launched at $t = 0$):

$$V^+_{\text{init}} = V_S\,\frac{Z_C}{Z_S + Z_C}$$
*(chap4.pdf, p.37)*

The current reflection coefficient is **negative** of the voltage reflection coefficient. *(chap4.pdf, p.35)*

### Bounce Diagram *(chap4.pdf, pp.42--43)*

Plot of position $z$ vs. time $t$; each line segment is a traveling wave. Used to determine $V(z_0, t)$ or $V(z, t_0)$ graphically by summing all waves that have reached the point.

When both ends are matched ($\Gamma_S = \Gamma_L = 0$): only a time delay $T_D = L/v$ exists.

### Signal Integrity Criteria *(chap4.pdf, p.59)*

The line can be treated as a lumped element (negligible distortion) when:

$$\tau_r > 10\,T_D \quad \text{or equivalently} \quad L < \frac{\lambda}{10}$$
*(chap4.pdf, p.59)*

Simulation results: at $\tau_r = T_D$, overshoot is 7 V for a 5 V supply; at $\tau_r = 10\,T_D$, it drops to 5.3 V. *(chap4.pdf, pp.60--63)*

### Termination Loads *(chap4.pdf, pp.50--53)*

**Capacitive load** (source-matched, $Z_S = Z_C$):

$$V_L(t) = V_0\!\left(1 - e^{-t/\tau_C}\right)u(t - T_D), \qquad \tau_C = Z_C\,C_L$$
*(chap4.pdf, pp.50--52)*

Initial response: capacitor looks like a short circuit; final: open circuit. Added 50% delay: $0.693\,Z_C C_L$.

**Inductive load:** opposite behaviour --- initially open, finally short:

$$\tau_L = L_L / Z_C$$
*(chap4.pdf, p.53)*

### Matching Schemes *(chap4.pdf, pp.54--55)*

**Series match** (add $R$ at source so $Z_S + R = Z_C$):
- Load voltage = full source voltage. *(chap4.pdf, p.54)*
- No DC power loss. *(chap4.pdf, p.54)*

**Parallel match** (add $R$ across load so $R = Z_C$ for high-Z load):
- Load voltage is less than source voltage. *(chap4.pdf, p.55)*
- Consumes power; fails at high frequencies with capacitive loads. *(chap4.pdf, pp.55, 58)*

For lines with discontinuities: must use **series match at source AND parallel match at load** to eliminate all reflections. *(chap4.pdf, p.67)*

### Discontinuity Coefficients *(chap4.pdf, pp.64--65)*

At a junction between $Z_{C1}$ and $Z_{C2}$:

$$\Gamma_{12} = \frac{Z_{C2} - Z_{C1}}{Z_{C2} + Z_{C1}}, \qquad T_{12} = 1 + \Gamma_{12}$$
*(chap4.pdf, pp.64--65)*

### Phasor (Sinusoidal) Solution *(chap4.pdf, pp.73--78)*

$$\hat{V}(z) = V^+\,e^{-j\beta z} + V^-\,e^{+j\beta z}, \qquad \beta = \omega\sqrt{lc}$$
*(chap4.pdf, p.73)*

Input impedance (distance $d$ from load):

$$Z_{in}(-d) = Z_C\,\frac{Z_L + jZ_C\tan(\beta d)}{Z_C + jZ_L\tan(\beta d)}$$
*(chap4.pdf, p.75)*

VSWR:

$$S = \frac{1 + |\Gamma_L|}{1 - |\Gamma_L|}$$
*(chap4.pdf, p.77)*

Average power (lossless line):

$$P_{av} = \frac{|V^+|^2}{2Z_C}\!\left(1 - |\Gamma_L|^2\right)$$
*(chap4.pdf, p.78)*

### Lossy Line *(chap4.pdf, pp.79--81)*

Propagation constant:

$$\gamma = \sqrt{(r+j\omega l)(g+j\omega c)} = \alpha + j\beta$$
*(chap4.pdf, p.80)*

Both $\alpha$ (attenuation) and $\beta$ (phase) are frequency-dependent $\to$ dispersion.

### Conductor and Dielectric Losses *(chap4.pdf, pp.82--87)*

| Loss mechanism | Resistance / conductance | Frequency dependence |
|----------------|--------------------------|---------------------|
| Skin effect (circular wire) | $r_{hf} = \frac{1}{2\pi r_w\sigma\delta}$ | $\propto \sqrt{f}$ (10 dB/dec) |
| Skin effect (PCB land $w \times t$) | $r_{hf} = \frac{1}{2\sigma w\delta}$ | $\propto \sqrt{f}$ |
| Dielectric loss | $g = \omega c\tan\theta$ | $\propto f$ (20 dB/dec) |

Skin depth: $\delta = 1/\sqrt{\pi f\mu\sigma}$ --- decreases with $\sqrt{f}$. *(chap4.pdf, p.82)*

For FR-4: $\tan\theta \approx 0.02$. *(chap4.pdf, p.94)*

### Low-Loss Approximation *(chap4.pdf, pp.90--91)*

Valid when $r \ll \omega l$ and $g \ll \omega c$ (above ~5 MHz for typical PCB):

$$\alpha \approx \frac{r}{2Z_C} + \frac{gZ_C}{2}, \qquad \beta \approx \omega\sqrt{lc}, \qquad Z_C \approx \sqrt{l/c}$$
*(chap4.pdf, p.91)*

Above 20 MHz: no $\beta$ dispersion; $\alpha$ dispersion from skin effect remains.

### Lumped-Circuit Model Validity *(chap4.pdf, pp.95--97)*

Use lumped models only when $L < \lambda/10$.

| Model | Valid frequency range |
|-------|-----------------------|
| Lumped-$\pi$, 1 section | Up to 10 MHz (example: 7-cm line on FR-4) |
| Lumped-$\pi$, 2 sections | Up to 20 MHz |

Each additional section extends the range by approximately the same factor.
