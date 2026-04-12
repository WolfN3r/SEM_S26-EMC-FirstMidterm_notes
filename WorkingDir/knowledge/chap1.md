# Chapter 1 Knowledge: Introduction to Electromagnetic Compatibility

## Outline
- Preview / Basic Description of EMC
- Aspects of EMC
- History of EMC
- Examples
- Electrical Dimensions and Waves
- Decibels and Common EMC Units

---

## 1. Preview — Basic Description of EMC

### Categories of Receiver Interference *(chap1.pdf, p.3)*

- **Intentional Receiver**: A receiver designed to receive signals (e.g., AM radio) may receive unintended signals (e.g., noise from lightning, or transmissions it is not tuned to).
- **Unintentional Receiver**: A device not designed to receive signals (e.g., a digital computer) may nonetheless pick up strong FM/TV transmissions, or conversely radiate emissions that interfere with nearby devices (e.g., TV screens).

### Definition of EMC *(chap1.pdf, p.4)*

> An electronic system is said to be **electromagnetically compatible** with its environment if it does not produce or be susceptible to interference. (It may couple a signal into the system, but does not cause interference.)

### Criteria of EMC *(chap1.pdf, p.4)*

1. It does **not cause interference** with other systems.
2. It is **not susceptible** to emissions from other systems.
3. It does **not cause interference with itself**.

---

## 2. Aspects of EMC

### Basic Decomposition of EMC Coupling *(chap1.pdf, p.5)*

EMC is concerned with the **generation, transmission, and reception** of electromagnetic energy.

The three-element model:

$$\text{Source (emitter)} \rightarrow \text{Transfer (coupling) path} \rightarrow \text{Receptor (receiver)}$$

*(chap1.pdf, p.5)*

- Interference occurs if the **received energy** causes the receptor to behave in an **undesired manner**.
- Unintentional transmission or reception is **not necessarily detrimental**; only undesired behavior of the receptor constitutes interference.

### Ways to Prevent Interference *(chap1.pdf, p.6)*

1. **Suppress the emission at its source** (most effective, least costly).
2. Make the **coupling path as inefficient** as possible for the noise.
3. Make the **receptor less susceptible** to the emission.

> Working from step 1 to step 3, success will usually be easier to achieve and with less additional design cost.

The simplest (but costliest) solution would be to enclose all electronics in a metallic enclosure with internal batteries.

### Basic EMC Subproblems — Transfer of Electromagnetic Energy *(chap1.pdf, p.7)*

| # | Type | Description |
|---|------|-------------|
| 1 | Radiated emissions | Noisy component radiates energy out |
| 2 | Radiated susceptibility | Susceptible component receives radiated energy |
| 3 | Conducted emissions | Noisy component injects noise onto power/signal lines |
| 4 | Conducted susceptibility | Susceptible component affected by conducted noise |

*Figure description: Four diagrams (a)–(d) show: (a) radiation from a noisy component on a PCB; (b) external radiation coupling into a susceptible component; (c) conducted noise injected back through cables; (d) conducted susceptibility from power lines.*

### Importance of Power Net *(chap1.pdf, p.8)*

Although a power cable is intended to carry 60 Hz commercial power, **higher-frequency signals commonly exist on the AC power cord**. These can interfere via conduction or radiation. Reducing power-net interference is a key EMC topic.

### Other Aspects of EMC *(chap1.pdf, p.9)*

These are **not restricted by government** regulations but must be considered during design:

1. **Electrostatic Discharge (ESD)** — e.g., person walking on carpet touching a computer.
2. **Electromagnetic Pulse (EMP)** — e.g., from nuclear detonation affecting aircraft/facilities.
3. **Lightning** — e.g., 50,000 A strike coupling into power lines.
4. **TEMPEST** — unintentional electromagnetic emanations that can reveal processed information.

### Solutions for EMC — Mathematical Model *(chap1.pdf, p.10)*

A **mathematical model** is the primary tool for understanding interference effects. A model is valid if it can **predict experimentally observed results**. Once established, it enables prediction of future events in the design process, reducing costs.

---

## 3. History of EMC

### Key Organizations *(chap1.pdf, p.11)*

| Region | Organization | Year | Action |
|--------|-------------|------|--------|
| Europe | **CISPR** (International Special Committee on Radio Interference) | 1933 | Produced measurement equipment document for EMI emissions |
| USA | **FCC** (Federal Communications Commission) | 1979 | Published regulations requiring emissions of "digital devices" to be below limits |
| USA | Military | — | Sets susceptibility requirements |

---

## 4. Examples of EMI Events *(chap1.pdf, p.12–14)*

### Textbook Events
- Motor spark-gap → Power cord → TV antenna → TV screen interference
- Copying machine DC transient → Power net → Hall clock reset
- Illegal FM transmitter → Microprocessor-controlled fuel system shutdown
- Citizens Band (CB) transmitter → Car braking system locked up
- Surveillance radar → Computer data loss/corruption
- Falkland Battle (1982): UK communication system interfered with antimissile detection system, destroyer lost
- EM emissions → UH-60 Black Hawk helicopter flight control malfunction
- Ship high-power radar → Inadvertent missile deployment

### Daily Life Events *(chap1.pdf, p.14)*
- Mobile phone connecting to base station → Strongest EM wave → Interferes with speakers or CRT monitors
- Driving across radio station coverage areas → Favorite station disturbed by local stations

---

## 5. Electrical Dimensions and Waves

### Why Electrical Dimensions Matter *(chap1.pdf, p.15)*

- **Electrical dimensions** (in wavelengths) are more significant than physical dimensions in determining a structure's ability to radiate EM energy.
- If electrical dimensions are **small compared to $\lambda/10$**: lumped elements and circuit theory suffice.
- If electrical dimensions are **large compared to $\lambda$**: Maxwell's equations must be used.

### Time Delay *(chap1.pdf, p.16)*

The time delay for a wave propagating from node $a$ to node $b$ along a connection lead of length $\mathscr{L}$:

$$T_D = \frac{\mathscr{L}}{v}$$

*(chap1.pdf, p.16)*

*Figure description: Circuit showing source $i_1(t)$ connecting through a "Connection lead → Lumped element → Connection lead" to $i_2(t)$, with total length $\mathscr{L}$. The time-domain plots show $i_1(t)$ and $i_2(t)$ offset by $\mathscr{L}/v$.*

### Phase Difference and Electrical Length *(chap1.pdf, p.17)*

For a sinusoidal propagating wave:

$$i(z,t) = I\cos(\omega t - \beta z)$$

*(chap1.pdf, p.17)*

where $\beta$ is the **phase constant** and $\omega$ is the radian frequency. For a wave traveling length $\mathscr{L}$, the **phase difference** is:

$$\phi = \beta \mathscr{L} \quad \text{radians}$$

*(chap1.pdf, p.17)*

Since $\beta\lambda = 2\pi$ radians, the wave can be rewritten in terms of **electrical length**:

$$i(z,t) = I\cos\!\left(\omega t - 2\pi\frac{z}{\lambda}\right)$$

*(chap1.pdf, p.17)*

*Figure description: Sinusoidal wave $i(0,z)$ plotted along $z$, showing one full wavelength $\lambda$.*

### Phase Velocity *(chap1.pdf, p.18)*

Since $\omega t - \beta z = \text{constant}$, the wave propagates in the $+z$ direction. The **phase velocity** is:

$$v = \frac{dz}{dt} = \frac{\omega}{\beta} = \lambda f \quad \text{m/s}$$

*(chap1.pdf, p.18)*

Therefore:

$$\lambda = \frac{v}{f} \quad \text{m}$$

*(chap1.pdf, p.18)*

The current with phase delay:

$$i(z,t) = I\cos\!\left(\omega\!\left(t - \frac{z}{v}\right)\right)$$

*(chap1.pdf, p.19)*

The **phase shift** of a wave is equivalent to a **time delay** of $z/v$ seconds.

### Phase Velocity in a Medium *(chap1.pdf, p.20)*

$$v = \frac{1}{\sqrt{\epsilon\mu}} = \frac{v_0}{\sqrt{\epsilon_r \mu_r}}$$

*(chap1.pdf, p.20)*

where $v_0$ is the speed of light in free space:

$$v_0 = \frac{1}{\sqrt{\epsilon_0\mu_0}} = 3 \times 10^8 \text{ m/s (approx)}$$

$$\epsilon_0 = \frac{1}{36\pi} \times 10^{-9} \text{ F/m (approx)}$$

$$\mu_0 = 4\pi \times 10^{-7} \text{ H/m (exact)}$$

*(chap1.pdf, p.20)*

> In a denser medium (larger $\epsilon_r$), the velocity is smaller.

### Wavelength and Electrical Dimension *(chap1.pdf, p.21)*

Wavelength in a medium:

$$\lambda = \frac{v}{f} = \frac{v_0}{f\sqrt{\epsilon_r\mu_r}} = \frac{\lambda_0}{\sqrt{\epsilon_r\mu_r}}$$

*(chap1.pdf, p.21)*

**Electrical dimension** of a circuit:

$$k = \frac{\mathscr{L}}{\lambda}$$

*(chap1.pdf, p.21)*

> In a denser medium: $v$ is smaller $\Rightarrow$ $\lambda$ is smaller $\Rightarrow$ $k$ is larger.

### Frequency–Wavelength Table *(chap1.pdf, p.21)*

| Frequency | Wavelength |
|-----------|-----------|
| 60 Hz | 3107 miles (5000 km) |
| 3 kHz | 100 km |
| 30 kHz | 10 km |
| 300 kHz | 1 km |
| 3 MHz | 100 m |
| 30 MHz | 10 m |
| **300 MHz** | **1 m** |
| 3 GHz | 10 cm |
| 30 GHz | 1 cm |
| 300 GHz | 1 mm |

### Frequency Bands of Electronic Systems *(chap1.pdf, p.22)*

| Band | Wavelength | Uses |
|------|-----------|------|
| EHF (30–300 GHz) | 1 cm–1 mm | Radar, remote sensing, radio astronomy |
| SHF (3–30 GHz) | 10 cm–1 cm | Radar, satellite, microwave, **digital systems** |
| UHF (300–3000 MHz) | 1 m–10 cm | Radar, TV, cell phones, **digital systems** |
| VHF (30–300 MHz) | 10 m–1 m | TV, FM radio, police radio, **digital systems** |
| HF (3–30 MHz) | 100 m–10 m | Shortwave radio (ham), citizens band |
| MF (300–3000 kHz) | 1 km–100 m | AM broadcasting, maritime radio |
| LF (30–300 kHz) | 10 km–1 km | Loran navigation, ADF beacons |
| VLF (3–30 kHz) | 100 km–10 km | Long-range navigation, sonar |
| ELF (3–30 Hz) | 62,137 mi–6214 mi | Detection of buried metal objects |

> Knowing the spectrum distribution of electronic systems helps identify interference sources.

### Relative Permittivities of Various Dielectrics *(chap1.pdf, p.23)*

| Material | $\epsilon_r$ |
|----------|------------|
| Air | 1.0005 |
| Styrofoam | 1.03 |
| Teflon | 2.1 |
| Polyethylene | 2.3 |
| Polystyrene | 2.5 |
| Nylon | 3.5 |
| PVC | 3.5 |
| Epoxy resin | 3.6 |
| Quartz (fused) | 3.8 |
| Mylar | 4.0 |
| **Epoxy glass (PCB substrate)** | **4.7** |
| Bakelite | 4.9 |
| Glass (pyrex) | 5.0 |
| Silicon | 12.0 |

### Relative Permeabilities and Conductivities of Metals *(chap1.pdf, p.24)*

(Relative to copper)

| Conductor | $\sigma_r$ | $\mu_r$ |
|-----------|----------|--------|
| Silver | 1.05 | 1 |
| Copper-annealed | 1.00 | 1 |
| Gold | 0.70 | 1 |
| Aluminum | 0.61 | 1 |
| Nickel | 0.20 | 600 |
| Steel (SAE 1045) | 0.10 | 1000 |
| Stainless Steel (430) | 0.02 | 500 |
| Mumetal (at 1 kHz) | 0.03 | 30,000 |

---

## 6. Decibels and Common EMC Units

### Power Gain *(chap1.pdf, p.25)*

$$\text{Power gain} \equiv \frac{P_\text{out}}{P_\text{in}} = \frac{v_\text{out}^2/R_L}{v_\text{in}^2/R_\text{in}}$$

*(chap1.pdf, p.25)*

where $P_\text{in} = v_\text{in}^2/R_\text{in}$ and $P_\text{out} = v_\text{out}^2/R_L$.

Power gain in decibels:

$$\text{Power gain}_\text{dB} \equiv 10\log_{10}\!\left(\frac{P_\text{out}}{P_\text{in}}\right)$$

*(chap1.pdf, p.25)*

*Figure description: Amplifier circuit with source $V_S$, source resistance $R_S$, input resistance $R_\text{in}$, amplifier block, load $R_L$.*

### Voltage and Current Gains *(chap1.pdf, p.26)*

$$\text{Voltage gain} \equiv \frac{v_\text{out}}{v_\text{in}}, \qquad \text{Current gain} \equiv \frac{i_\text{out}}{i_\text{in}}$$

In dB:

$$\text{Voltage gain}_\text{dB} \equiv 20\log_{10}\!\left(\frac{v_\text{out}}{v_\text{in}}\right)$$

$$\text{Current gain}_\text{dB} \equiv 20\log_{10}\!\left(\frac{i_\text{out}}{i_\text{in}}\right)$$

*(chap1.pdf, p.26)*

When $R_\text{in} = R_L$:

$$\text{Power gain} = \left(\frac{v_\text{out}}{v_\text{in}}\right)^2_{R_L=R_\text{in}}, \qquad \text{Power gain}_\text{dB} = 20\log_{10}\!\left(\frac{v_\text{out}}{v_\text{in}}\right)_{R_L=R_\text{in}}$$

*(chap1.pdf, p.26)*

This equals the voltage gain (and similarly the current gain via $P=i^2R$).

### Conversion Table *(chap1.pdf, p.27)*

| Ratio | $V$ or $I$ in dB | $P$ in dB |
|-------|-----------------|---------|
| $10^6$ | 120 | 60 |
| $10^4$ | 80 | 40 |
| $10^2$ | 40 | 20 |
| 10 | 20 | 10 |
| 2 | 6.02 | 3.01 |
| 1 | 0 | 0 |
| $10^{-1}$ | −20 | −10 |
| $10^{-2}$ | −40 | −20 |

### Using dB in Amplifier Chains *(chap1.pdf, p.28)*

$$P_\text{out,dB} = \text{Gain}_\text{dB} + P_\text{in,dB}$$

$$P_\text{out,dBm} = \text{Gain}_\text{dB} + P_\text{in,dBm}$$

$$P_\text{out,dB$\mu$W} = \text{Gain}_\text{dB} + P_\text{in,dB$\mu$W}$$

When $R_\text{in}=R_L$:

$$v_\text{out,dB} = \text{Gain}_\text{dB} + v_\text{in,dB}$$

$$i_\text{out,dB} = \text{Gain}_\text{dB} + i_\text{in,dB}$$

*(chap1.pdf, p.28)*

> Gain and Loss are opposite in sign. (dBmV, dB$\mu$V) and (dBmA, dB$\mu$A) also apply.

### Power Loss in Cables — Lossy Transmission Line *(chap1.pdf, p.29)*

For a lossy transmission line (matched, $Z_L = Z_C$):

$$\hat{V}(z) = \hat{V}^+ e^{-\alpha z}e^{-j\beta z} = \hat{V}_f(z)$$

$$\hat{I}(z) = \frac{\hat{V}^+}{Z_C}e^{-\alpha z}e^{-j\beta z} = \frac{\hat{V}_f(z)}{Z_C}$$

*(chap1.pdf, p.29)*

Average power delivered:

$$P_\text{av}(z) = \frac{1}{2}\,\mathcal{Re}[\hat{V}(z)\hat{I}^*(z)] = \frac{1}{2}\frac{V^{+2}}{Z_C}e^{-2\alpha z}\cos\theta_{Z_C}$$

*(chap1.pdf, p.29)*

### Power Loss Definition *(chap1.pdf, p.30)*

$$\text{Power loss} = \frac{P_\text{av}(z=0)}{P_\text{av}(z=\mathscr{L})} = \frac{P_\text{in}}{P_\text{out}} = e^{2\alpha\mathscr{L}}$$

*(chap1.pdf, p.30)*

Cable loss in dB:

$$\text{Cable loss}_\text{dB} = 10\log_{10}(e^{2\alpha\mathscr{L}}) = 20\alpha\mathscr{L}\log_{10}e = 8.686\,\alpha\mathscr{L}$$

*(chap1.pdf, p.30)*

Therefore the **attenuation constant** can be found from measured loss:

$$\alpha = \frac{\text{power loss in dB/length}}{8.686\,L}$$

*(chap1.pdf, p.30)*

**Important relationship** when $R_L = 50\,\Omega$:

$$\text{dB}\mu\text{V (RMS)} = 107 + \text{dBm}$$

*(chap1.pdf, p.30)*

### Signal Source and Measurement Instruments *(chap1.pdf, p.31)*

- Signal sources modeled as **Thevenin equivalent** with $R_S = 50\,\Omega$ (virtually all modern sources).
- **Spectrum analyzer**: $C_\text{in}=0$, $R_\text{in}=50\,\Omega$
- **Oscilloscope**: $C_\text{in}=47\,\text{pF}$, $R_\text{in}=1\,\text{M}\Omega$

### Matched Measurement System *(chap1.pdf, p.32–33)*

*Figure description: Signal source (50 Ω) connected via coaxial cable ($\hat{Z}_C = 50\,\Omega$) to signal measurer (50 Ω).*

When the load equals $Z_C$ (matched), the input impedance **at any frequency and for any cable length** is $Z_\text{in} = 50\,\Omega = Z_C$. This is why modern EMC test equipment uses pure 50 Ω impedances and 50-Ω coaxial cables — it enables **swept-frequency measurements** with constant output.
