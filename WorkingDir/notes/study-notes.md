<<<<<<< HEAD
# EMC First Midterm --- Study Notes
=======
# EMC First Midterm — Study Notes

**Course:** Electromagnetic Compatibility, NTUST  
**Target audience:** Student familiar with EM fields and radio-wave basics  
**Source of truth:** chap1.pdf – chap4.pdf
>>>>>>> c5b0b435f3af3f08f08cea2c9c10c79f92a8dbe0

---

## Chapter 1: Introduction to EMC

<<<<<<< HEAD
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
=======
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
>>>>>>> c5b0b435f3af3f08f08cea2c9c10c79f92a8dbe0

---

## Chapter 3: Signal Spectra

<<<<<<< HEAD
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
=======
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
>>>>>>> c5b0b435f3af3f08f08cea2c9c10c79f92a8dbe0

---

## Chapter 4: Transmission Lines and Signal Integrity

### Why Transmission Lines?

<<<<<<< HEAD
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
=======
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
>>>>>>> c5b0b435f3af3f08f08cea2c9c10c79f92a8dbe0
