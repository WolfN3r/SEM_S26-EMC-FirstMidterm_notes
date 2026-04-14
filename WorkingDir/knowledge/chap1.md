# Chapter 1: Introduction to Electromagnetic Compatibility

## 1.1 What is EMC?

Electromagnetic Compatibility (EMC) is about managing electromagnetic energy so that electronic systems coexist without causing interference. Three criteria must all be satisfied *(chap1.pdf, p.4)*:

1. The system **does not cause interference** with other systems.
2. The system **is not susceptible** to emissions from other systems.
3. The system **does not interfere with itself**.

Formal definition: *"An electronic system is said to be electromagnetically compatible with its environment if it does not produce or be susceptible to interference."* *(chap1.pdf, p.4)*

Note: coupling signal into a system is not by itself interference --- interference only occurs when the receptor behaves in an undesired manner. *(chap1.pdf, p.5)*

## 1.2 EMC Coupling Decomposition

EMC is concerned with three stages of electromagnetic energy: **generation $\to$ transmission $\to$ reception**. *(chap1.pdf, p.5)*

### Ways to Prevent Interference (in order of ease/cost-effectiveness) *(chap1.pdf, p.6)*

1. Suppress the emission **at its source**.
2. Make the **coupling path** as inefficient as possible.
3. Make the **receptor** less susceptible.

Working from step 1 to step 3 is progressively harder and more expensive. The simplest (but most costly) fix is a fully enclosed metallic housing with internal batteries.

### Four Basic EMC Subproblems *(chap1.pdf, p.7)*

| # | Type | Description |
|---|------|-------------|
| 1 | Radiated emissions | Device radiates EM energy into the environment |
| 2 | Radiated susceptibility | Device is affected by external radiated fields |
| 3 | Conducted emissions | Noise passes out via the power cord |
| 4 | Conducted susceptibility | Device is affected by noise on the power cord |

### Power Net Concern *(chap1.pdf, p.8)*

The ac power cord is intended for 60 Hz, but higher-frequency signals inevitably exist on it. These can interfere with other systems via conduction or radiation --- hence power-net EMC is critical.

### Other EMC Concerns *(chap1.pdf, p.9)*

- **ESD** (Electrostatic Discharge): e.g., static build-up reaching kV levels
- **EMP** (Electromagnetic Pulse): e.g., nuclear-generated burst
- **Lightning**: atmospheric discharge coupling
- **TEMPEST**: EM emissions that carry information (security concern)

These are not government-regulated in the same way but must be considered in design.

## 1.3 History and Regulation *(chap1.pdf, p.11)*

- **CISPR** (Comité International Spécial des Perturbations Radioélectriques, 1933): international committee under IEC; produced earliest EMI measurement-equipment standards.
- **FCC** (USA, 1979): required digital devices to limit EM emissions; governed by Part 15 of FCC Rules, Title 47 CFR.

## 1.4 Real-World Examples *(chap1.pdf, pp.12--14)*

Selected illustrative cases from the textbook:

- Motor spark-gap $\to$ power cord $\to$ TV interference
- Copying machine $\to$ power net $\to$ hall clock reset
- Surveillance radar $\to$ airport computer data loss
- Falkland War (1982): communication system interference $\to$ antimissile detection failure $\to$ destroyer lost
- UH-60 Black Hawk helicopter crashes due to EM emissions affecting electronic flight controls
- Ship radar $\to$ RF voltages $\to$ inadvertent missile deployment

These examples demonstrate that EMC failures span from annoyances to life-threatening situations.

## 1.5 Electrical Dimensions and Waves

### Why Electrical Dimensions Matter *(chap1.pdf, p.15)*

The **electrical dimension** (size relative to wavelength) determines which model to use:

| Condition | Model |
|-----------|-------|
| $L \ll \lambda/10$ | Lumped-circuit theory (KVL/KCL) |
| $L \sim \lambda$ or larger | Maxwell's equations required |

### Time Delay *(chap1.pdf, p.16)*

For a wave propagating from node $a$ to node $b$ along a conductor of length $L$:

$$T_D = \frac{L}{v}$$
*(chap1.pdf, p.16)* <!-- VERIFY: equation inferred from context; images not rendered by pdftotext -->

where $v$ is the phase velocity of the wave in the medium.

### Phase Difference and Electrical Length *(chap1.pdf, p.17)*

A sinusoidal propagating wave traveling in the $+z$ direction:

$$V(z,t) = V^+ e^{j(\omega t - \beta z)}$$
*(chap1.pdf, p.17)* <!-- VERIFY -->

where $\beta$ is the phase constant and $\omega$ is the radian frequency.

For a wave traveling a length $L$, the **phase difference** between the two ends is:

$$\Delta\phi = \beta L$$
*(chap1.pdf, p.17)* <!-- VERIFY -->

Since $\beta = 2\pi/\lambda$, the **electrical length** (phase difference expressed in wavelengths) is:

$$\Delta\phi = \frac{2\pi L}{\lambda}$$
*(chap1.pdf, p.17)* <!-- VERIFY -->

### Phase Velocity *(chap1.pdf, pp.18--20)*

Phase velocity relates angular frequency to phase constant:

$$v = \frac{\omega}{\beta}$$
*(chap1.pdf, p.18)* <!-- VERIFY -->

The current can be written in time-delay form, showing that phase shift is equivalent to a time delay $z/v$:

$$I(z,t) = I^+ e^{j\omega(t - z/v)}$$
*(chap1.pdf, p.19)* <!-- VERIFY -->

In a medium with relative permittivity $\varepsilon_r$ and relative permeability $\mu_r$:

$$v = \frac{1}{\sqrt{\mu\varepsilon}} = \frac{v_0}{\sqrt{\mu_r\varepsilon_r}}$$
*(chap1.pdf, p.20)* <!-- VERIFY -->

where the free-space velocity is:

$$v_0 = \frac{1}{\sqrt{\mu_0\varepsilon_0}} \approx 3 \times 10^8 \text{ m/s}$$
*(chap1.pdf, p.20)* <!-- VERIFY -->

Key insight: wave velocity is **smaller** in denser media (larger $\varepsilon_r$). *(chap1.pdf, p.20)*

### Wavelength and Electrical Dimension in a Denser Medium *(chap1.pdf, p.21)*

Wavelength in a medium:

$$\lambda = \frac{v}{f} = \frac{v_0}{f\sqrt{\mu_r\varepsilon_r}}$$
*(chap1.pdf, p.21)* <!-- VERIFY -->

Electrical dimension of a circuit element of physical length $L$:

$$k = \frac{L}{\lambda}$$
*(chap1.pdf, p.21)* <!-- VERIFY -->

In a denser medium ($\varepsilon_r$ larger): $v$ is smaller $\to$ $\lambda$ is smaller $\to$ $k$ is **larger** (more electrically significant). *(chap1.pdf, p.21)*

### Reference Tables *(chap1.pdf, pp.22--24)*

- **Table (p.22):** Frequencies and corresponding free-space wavelengths for common electronic systems. Knowing the spectrum distribution helps identify interference sources.
- **Table (p.23):** Relative permittivities $\varepsilon_r$ of various dielectrics.
- **Table (p.24):** Relative permeabilities $\mu_r$ and conductivities (relative to copper) of various metals.

---

## 1.6 Decibels and Common EMC Units

### Power Gain *(chap1.pdf, p.25)*

Power gain defined as ratio of output to input power:

$$G_p = \frac{P_{out}}{P_{in}}$$
*(chap1.pdf, p.25)* <!-- VERIFY -->

where the powers are:

$$P_{in} = \frac{v_{in}^2}{R_{in}}, \qquad P_{out} = \frac{v_{out}^2}{R_L}$$
*(chap1.pdf, p.25)* <!-- VERIFY -->

Power gain in decibels:

$$G_{p,\text{dB}} = 10\log_{10}\!\left(\frac{P_{out}}{P_{in}}\right)$$
*(chap1.pdf, p.25)* <!-- VERIFY -->

### Voltage and Current Gains *(chap1.pdf, p.26)*

$$G_{V,\text{dB}} = 20\log_{10}\!\left(\frac{V_{out}}{V_{in}}\right), \qquad G_{I,\text{dB}} = 20\log_{10}\!\left(\frac{I_{out}}{I_{in}}\right)$$
*(chap1.pdf, p.26)* <!-- VERIFY -->

When $R_{in} = R_L$:

$$G_{V,\text{dB}} = G_{I,\text{dB}} = G_{p,\text{dB}}$$
*(chap1.pdf, p.26)* <!-- VERIFY -->

**Factor-to-dB conversion table** (p.27): multiplying a quantity by 2 adds 6 dB; by 10 adds 20 dB (voltage/current) or 10 dB (power).

### Using dB for Amplifier Calculations *(chap1.pdf, p.28)*

Since $G_p = P_{out}/P_{in}$:

$$P_{out,\text{dBm}} = G_{\text{dB}} + P_{in,\text{dBm}}$$
*(chap1.pdf, p.28)*

This also applies to dB$\mu$W and dB$\mu$V, dB$\mu$A (when $R_{in} = R_L$):

$$V_{out,\text{dBmV}} = G_{\text{dB}} + V_{in,\text{dBmV}}$$
*(chap1.pdf, p.28)*

Gains and losses have **opposite signs**: a loss of $x$ dB appears as $-x$ dB.

### Power Loss in Cables *(chap1.pdf, pp.29--30)*

For a lossy transmission line, when the line is matched ($Z_L = Z_C$), the forward-traveling voltage wave is:

$$V(z) = V^+ e^{-\gamma z}$$
*(chap1.pdf, p.29)* <!-- VERIFY -->

where $\gamma = \alpha + j\beta$ is the complex propagation constant and $\alpha$ is the attenuation constant (Np/m).

The average power delivered in the $+z$ direction:

$$P_{av}(z) = \frac{|V^+|^2}{2R_C}\,e^{-2\alpha z}$$
*(chap1.pdf, p.29)* <!-- VERIFY -->

where $R_C = \text{Re}(Z_C)$.

Power loss over cable length $L$:

$$P_L = \frac{P_{av}(L)}{P_{av}(0)} = e^{-2\alpha L}$$
*(chap1.pdf, p.30)* <!-- VERIFY -->

Cable loss in dB:

$$P_{L,\text{dB}} = 10\log_{10}(P_L) = 8.686\,\alpha L$$
*(chap1.pdf, p.30)* <!-- VERIFY -->

Rearranging to find the attenuation constant from a measured cable loss (in dB per unit length):

$$\alpha\,[\text{Np/m}] = \frac{P_L\,[\text{dB/m}]}{8.686}$$
*(chap1.pdf, p.30)*

**Important voltage--power relationship** (valid when $R_L = 50\,\Omega$):

$$\text{dB$\mu$V}_{\text{RMS}} = 107 + \text{dBm}$$
*(chap1.pdf, p.30)*

### Signal Source and Instrument Impedances *(chap1.pdf, pp.31--33)*

- Modern signal sources use a Thevenin equivalent with $R_S = 50\,\Omega$.
- **Spectrum analyzer:** $C_{in} = 0$, $R_{in} = 50\,\Omega$.
- **Oscilloscope:** $C_{in} = 47\,\text{pF}$, $R_{in} = 1\,\text{M}\Omega$.

Because the SA has $R_{in} = 50\,\Omega = Z_C$, the cable is matched, and the input impedance is $Z_{in} = 50\,\Omega$ regardless of cable length or frequency. *(chap1.pdf, p.32)*

This is why modern EMC test equipment uses $50\,\Omega$ throughout: a swept-frequency measurement is meaningless if the source output varies with frequency, which would happen with an unmatched load. *(chap1.pdf, p.33)*
