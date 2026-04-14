# Chapter 2: EMC Requirements for Electronic Systems

<<<<<<< HEAD
## 2.1 Overview of EMC Requirements

Two broad categories: *(chap2.pdf, p.3)*

1. **Government-mandated requirements** --- legal; product cannot be sold without compliance; do not guarantee zero interference.
2. **Manufacturer-imposed requirements** --- for product reliability and customer satisfaction.

---

## 2.2 Governmental Requirements

### USA --- FCC Regulations *(chap2.pdf, p.4)*

The **Federal Communications Commission (FCC)** regulates radio and wire communications in the USA. Part 15 of the FCC Rules (Title 47, CFR) applies to radio-frequency devices. Any digital device using a clock signal above **9 kHz** must comply. *(chap2.pdf, p.5)*

#### FCC Device Classes *(chap2.pdf, p.6)*

| Class | Target environment | Limits |
|-------|--------------------|--------|
| **Class A** | Commercial / industrial / business | Less stringent |
| **Class B** | Residential | More stringent |

Class B is stricter because residential users typically lack the technical expertise or financial resources to deal with interference. *(chap2.pdf, p.6)*

#### FCC Conducted Emission Limits *(chap2.pdf, p.7)*

- **Frequency range:** 150 kHz -- 30 MHz
- **Measurement instrument:** Line Impedance Stabilization Network (LISN)
- Measurement receiver detectors: **QP** (quasi-peak) and **AV** (average) *(chap2.pdf, p.9)*

#### FCC Radiated Emission Limits *(chap2.pdf, p.7)*

- **Frequency range:** 30 MHz -- 40 GHz
- **Measurement sites:** open-area test site (OATS) or semianechoic chamber (SAC)
- Both **vertical** and **horizontal** polarizations required *(chap2.pdf, p.7)*

#### Class A vs. Class B Comparison *(chap2.pdf, p.13)*

Class A limits are measured at 10 m; Class B at 3 m. To compare them, Class A data are normalized to 3 m:

$$\Delta_{\text{normalize}} = 20\log_{10}\!\left(\frac{10}{3}\right) \approx 10.46\,\text{dB}$$
*(chap2.pdf, p.13)*

After normalization: **Class A limits are approximately 10 dB less stringent than Class B limits.** *(chap2.pdf, p.13)*

Note: normalized lower-frequency Class A data are not reliable because at lower frequencies the 10 m measurement distance is not yet in the far field. *(chap2.pdf, p.13)*

---

### Outside USA --- CISPR 22 *(chap2.pdf, p.4)*

The **International Special Committee on Radio Interference (CISPR)**, under IEC, governs requirements outside the USA. *(chap2.pdf, p.4)*

- **Conducted emissions:** same limits as FCC *(chap2.pdf, p.15)*
- **Radiated emissions:** measured at **10 m**, limited to **up to 1 GHz** *(chap2.pdf, p.16)*
- The European EMC Directive was the **first** to mandate susceptibility (immunity) testing for commercial products *(chap2.pdf, p.16)*

---

### Military --- MIL-STD-461E (1999) *(chap2.pdf, pp.17--23)*

- Much more complex limits spanning much **larger frequency ranges** than FCC or CISPR 22
- Requirements can be **waived and/or tailored** for specific applications
- Key requirements include:
  - **RS103:** Radiated susceptibility
  - **CE102:** Conducted emissions (power leads, ac and dc)
  - **RE102:** Radiated emissions (different limits for aircraft/space vs. ground)

---

## 2.3 Measurement Methods

### Radiated Emissions Measurement *(chap2.pdf, pp.25--27)*

Commercial tests (FCC, CISPR 22) use either an OATS or a **semianechoic chamber (SAC)**:

| SAC Feature | Detail |
|-------------|--------|
| Top | Absorbing material |
| Sides | Absorbing material |
| Floor | Metallic ground plane |
| Advantage | All-weather capability + security |

**Measurement receivers:**

| Standard | Detector type |
|----------|---------------|
| FCC | Quasi-peak (QP) |
| CISPR | Quasi-peak (QP) |
| MIL-STD-461 | Peak |

**Antennas used:**

| Standard | Antenna | Frequency range |
|----------|---------|-----------------|
| FCC & CISPR | Biconical | 30 -- 200 MHz |
| FCC & CISPR | Log-periodic | 200 MHz -- 1 GHz |
| MIL-STD-461E | 104-cm rod dipole | 10 kHz -- 30 MHz |
| MIL-STD-461E | Biconical | 30 -- 200 MHz |
| MIL-STD-461E | Double-ridge horn | Above 200 MHz |

The measurement antenna must be elevated 1--4 m above the ground plane, and the maximum emission recorded. *(chap2.pdf, p.12)*

---

### Conducted Emissions Measurement *(chap2.pdf, pp.28--31)*

Goal: measure conducted noise current passing back to the power system via the ac power cord.

#### LISN Function *(chap2.pdf, pp.29--32)*

The **Line Impedance Stabilization Network (LISN)** serves two purposes:
1. Presents a **constant 50 $\Omega$ impedance** to the equipment under test (EUT) at RF frequencies --- independent of the actual power-line impedance
2. **Separates** the 60 Hz power signal from the RF noise signal, passing only the 150 kHz -- 30 MHz noise to the receiver while rejecting 60 Hz

This constant impedance is essential: if the impedance varied with frequency, the measurement result would be ambiguous. *(chap2.pdf, p.32)*

A PSPICE simulation can verify that $Z_{in}$ of the LISN is indeed 50 $\Omega$ across the measurement band. *(chap2.pdf, p.32)*

LISN element values differ between:
- FCC and CISPR 22 tests *(chap2.pdf, p.30)*
- MIL-STD-461E tests *(chap2.pdf, p.31)*

---

### Typical Product Emissions *(chap2.pdf, pp.33--36)*

A typical digital product shows both:
- Radiated emissions: measured vertically and horizontally *(chap2.pdf, pp.33--34)*
- Conducted emissions: measured on phase and neutral conductors *(chap2.pdf, pp.35--36)*
  - Products with switching power supplies often show prominent conducted noise

---

### Difficulty in Meeting Limits: PCB Layout Example *(chap2.pdf, pp.37--38)*

Example PCB with oscillator in DIP package + internal battery:

- Board length: $L = 7\text{ in} = 17.78\text{ cm}$
- At $f = 1\text{ GHz}$: $\lambda = 300\text{ mm} = 30\text{ cm}$ (board is $\approx \lambda/2$)
- At $f = 30\text{ GHz}$: $\lambda = 10\text{ mm}$ (note for context)

Measurement results showed:
- Horizontal emissions: exceeded FCC Class B limit by **up to 30 dB** *(chap2.pdf, p.38)*
- Vertical emissions: exceeded FCC Class B limit by **up to 15 dB** *(chap2.pdf, p.38)*

Even though the board was placed parallel to the chamber ground plane, vertical emissions were still significant --- a common surprise.

---

## 2.4 Additional Product Requirements *(chap2.pdf, p.39)*

Beyond governmental mandates, products may need to meet:

- **Radiated susceptibility (immunity):** resist external fields without malfunction
- **Conducted susceptibility (immunity):** resist conducted noise on power/signal lines
- **ESD:** static voltage can approach **25 kV** in magnitude
- **Commercial aircraft requirements:** for airborne electronics
- **Commercial vehicle requirements:** for automotive on-board electronics

---

## 2.5 Design Constraints *(chap2.pdf, p.40)*

Competing constraints in product design:

- **Product cost** --- EMC fixes add cost if not designed in early
- **Consumer acceptability** --- aesthetics, size constraints may limit shielding options
- **Automatic assembly** --- components must be compatible with pick-and-place manufacturing
- **Product development schedule** --- delays affect marketability and increase cost

Key insight: identify the **dominant source** of emission before selecting a fix, to avoid unnecessary cost. *(chap2.pdf, p.40)*

---

## 2.6 Advantages of EMC Design *(chap2.pdf, p.41)*

Early and consistent attention to EMC:

- Minimizes product cost
- Minimizes development schedule delays
- Minimizes customer complaints

**Practical rules:** *(chap2.pdf, p.41)*

1. *"Paper work before layout"* --- do EMC analysis before PCB layout, not after.
2. *"Prepare holes for capacitors and resistors"* --- assume EMC suppression components will be needed; reserve footprints on the PCB even if they are unpopulated initially.
=======
**Source:** chap2.pdf — National Taiwan University of Science and Technology, Chun-Long Wang

---

## Outline *(chap2.pdf, p.2)*

- Preview
- Governmental Requirements
- Additional Product Requirements
- Design Constraints for Products
- Advantages of EMC Design

---

## 1. Preview: Categories of EMC Requirements *(chap2.pdf, p.3)*

### 1.1 Requirements Mandated by Governmental Agencies
- **Legal requirements** — generally **cannot be waived**.
- Compliance does **not guarantee** that the product will not cause interference.
- A product **cannot be legally sold** if it does not comply.

### 1.2 Requirements Imposed by the Product Manufacturer
- Imposed to ensure a **reliable, quality product** and customer satisfaction.
- These may be more stringent than governmental requirements.

---

## 2. Governmental Requirements *(chap2.pdf, p.4)*

### 2.1 Sectors

| Market | Governing Body |
|---|---|
| USA | Federal Communications Commission (FCC) — regulates radio and wire communications |
| Outside USA | International Special Committee on Radio Interference (CISPR), a committee of the International Electrotechnical Committee (IEC) |

---

## 3. FCC Requirements (USA Commercial Products) *(chap2.pdf, p.5–p.13)*

### 3.1 Scope *(chap2.pdf, p.5)*
- **FCC Part 15** of Title 47 of the Code of Federal Regulations applies to radio-frequency devices.
- RF range covered: **9 kHz to 3000 GHz**.
- Any electronic device with digital circuitry and a clock signal exceeding **9 kHz** must comply.

### 3.2 Class Definitions *(chap2.pdf, p.6)*

| Class | Environment | Stringency |
|---|---|---|
| **Class A** | Commercial, industrial, or business | Less stringent |
| **Class B** | Residential | More stringent (because residents lack technical expertise/resources) |

> Class B limits are **more stringent** than Class A because residents are not likely to have expertise or financial resources to deal with interference.

### 3.3 Emission Types *(chap2.pdf, p.7)*

#### Conducted Emissions
- Noise currents passed out through the unit's **AC power cord**
- Frequency range: **150 kHz – 30 MHz**
- Measured with a **Line Impedance Stabilization Network (LISN)**

#### Radiated Emissions
- Frequency range: **30 MHz – 40 GHz**
- Measured in a **Semianechoic Chamber (SAC)** or at an **Open-Field Test Site (OATS)**
- Data for **both vertical and horizontal polarizations** are required

### 3.4 FCC and CISPR 22 Conducted Emission Limits *(chap2.pdf, p.8)*

#### Class B Digital Devices

| Frequency (MHz) | $\mu$V QP (AV) | dB$\mu$V QP (AV) |
|---|---|---|
| 0.15 | 1995 (631) | 66 (56) |
| 0.5 | 631 (199.5) | 56 (46) |
| 0.5–5 | 631 (199.5) | 56 (46) |
| 5–30 | 1000 (316) | 60 (50) |

#### Class A Digital Devices

| Frequency (MHz) | $\mu$V QP (AV) | dB$\mu$V QP (AV) |
|---|---|---|
| 0.15–0.5 | 8912.5 (1995) | 79 (66) |
| 0.5–30 | 4467 (1000) | 73 (60) |

> **QP** = quasi-peak detector; **AV** = average detector. Both measurements are made with the LISN.
*(chap2.pdf, p.9)*

### 3.5 Conducted Emission Limit Plots *(chap2.pdf, p.9)*

Figure description: Two plots side by side (Class B left, Class A right). Both are voltage (dBµV) vs. frequency.
- **Class B**: QP limit starts at 66 dBµV at 150 kHz, drops linearly to 56 dBµV at 500 kHz, remains flat to 5 MHz, then steps up to 60 dBµV through 30 MHz. AV limit is 10 dB lower.
- **Class A**: QP limit starts at 79 dBµV at 150 kHz, flat to 500 kHz, then steps to 73 dBµV through 30 MHz. AV limit is 13 dB lower.
- Both measured with LISN.

### 3.6 Upper Limit of Measurement Frequency *(chap2.pdf, p.10)*

| Highest Frequency Generated or Used (MHz) | Upper Frequency of Measurement Range (MHz) |
|---|---|
| < 1.705 | 30 |
| 1.705–108 | 1000 |
| 108–500 | 2000 |
| 500–1000 | 5000 |
| > 1000 | 5th harmonic of highest frequency, or 40 GHz (whichever is lower) |

### 3.7 FCC Radiated Emission Limits *(chap2.pdf, p.11)*

#### Class B Digital Devices — Measured at **3 m**

| Frequency (MHz) | $\mu$V/m | dB$\mu$V/m |
|---|---|---|
| 30–88 | 100 | 40 |
| 88–216 | 150 | 43.5 |
| 216–960 | 200 | 46 |
| > 960 | 500 | 54 |
| > 1 GHz | 500 (AV) / 5000 (PK) | 54 (AV) / 74 (PK) |

#### Class A Digital Devices — Measured at **10 m**

| Frequency (MHz) | $\mu$V/m | dB$\mu$V/m |
|---|---|---|
| 30–88 | 90 | 39 |
| 88–216 | 150 | 43.5 |
| 216–960 | 210 | 46.4 |
| > 960 | 300 | 49.5 |
| > 1 GHz | 300 (AV) / 3000 (PK) | 49.5 (AV) / 69.5 (PK) |

### 3.8 Radiated Emission Limit Plots *(chap2.pdf, p.12)*

Figure description: Two staircase plots (Class B at 3 m, Class A at 10 m). Both show electric field (µV/m and dBµV/m) vs. frequency from 30 MHz to 960 MHz. Class B steps up at 88, 216, and 960 MHz. Class A (at 10 m) shows similar staircase shape but lower values.

> The antenna must be elevated above the ground plane at distances of **1–4 m**, and the maximum emission recorded.
*(chap2.pdf, p.12)*

### 3.9 Comparison: Class A vs. Class B at 3 m *(chap2.pdf, p.13)*

The Class A limits are measured at 10 m. To compare with Class B (measured at 3 m), the Class A data must be normalized to 3 m. Normalizing from 10 m to 3 m increases the apparent field by:

$$\Delta E = 20\log_{10}\!\left(\frac{10}{3}\right) \approx 10.46 \text{ dB}$$
*(chap2.pdf, p.13)*

For example, the Class A 30–88 MHz limit at 10 m is 39 dBµV/m; normalized to 3 m: $39 + 10.46 = 49.46$ dBµV/m.

> **The Class A limits are some 10 dB less stringent than the Class B limits** (when compared at the same distance).
> Note: the normalized Class A data in the lower frequency range are not reliable because those distances are not far-field.
*(chap2.pdf, p.13)*

---

## 4. CISPR 22 Requirements (Outside USA) *(chap2.pdf, p.14–p.16)*

### 4.1 CISPR 22 Radiated Emission Limits *(chap2.pdf, p.14)*

Both measured at **10 m**. CISPR 22 radiated limits cover only **up to 1 GHz** (unlike FCC which goes to 40 GHz).

#### Class B ITE Equipment

| Frequency (MHz) | $\mu$V/m | dB$\mu$V/m |
|---|---|---|
| 30–230 | 31.6 | 30 |
| 230–1000 | 70.8 | 37 |

#### Class A ITE Equipment

| Frequency (MHz) | $\mu$V/m | dB$\mu$V/m |
|---|---|---|
| 30–230 | 100 | 40 |
| 230–1000 | 224 | 47 |

### 4.2 CISPR 22 Conducted Emission Limits *(chap2.pdf, p.15)*

**The same as those of FCC regulations** (same dBµV QP and AV values, same LISN measurement).

### 4.3 CISPR 22 Radiated Emission Plots *(chap2.pdf, p.16)*

Figure description: Two plots (Class B left, Class A right), both at 10 m measurement distance, showing FCC and CISPR 22 limits overlaid. The CISPR 22 limits are generally lower (more stringent) than FCC in the 30–216 MHz range for Class B. The upper frequency is 1 GHz for CISPR 22.

> **The European EMC Directive was the first one to mandate susceptibility (immunity) for commercial products.**
*(chap2.pdf, p.16)*

---

## 5. MIL-STD-461E: Military Requirements *(chap2.pdf, p.17–p.23)*

### 5.1 Overview *(chap2.pdf, p.17)*

- Standard: **MIL-STD-461E:1999**
- More **complicated** limits and requirements spanning **much larger frequency ranges** than FCC or CISPR 22.
- Requirements **can be waived and/or tailored** (unlike commercial standards).

### 5.2 MIL-STD-461E Requirement List *(chap2.pdf, p.18)*

| Requirement | Description |
|---|---|
| **CE101** | Conducted emissions, power leads, 30 Hz–10 kHz |
| **CE102** | Conducted emissions, power leads, 10 kHz–10 MHz |
| **CE106** | Conducted emissions, antenna terminal, 10 kHz–40 GHz |
| **CS101** | Conducted susceptibility, power leads, 30 Hz–150 kHz |
| **CS103** | Conducted susceptibility, antenna port, intermodulation, 15 kHz–10 GHz |
| **CS104** | Conducted susceptibility, antenna port, rejection of undesired signals, 30 Hz–20 GHz |
| **CS105** | Conducted susceptibility, antenna port, cross-modulation, 30 Hz–20 GHz |
| **CS109** | Conducted susceptibility, structure current, 60 Hz–100 kHz |
| **CS114** | Conducted susceptibility, bulk cable injection, 10 kHz–200 MHz |
| **CS115** | Conducted susceptibility, bulk cable injection, impulse excitation |
| **CS116** | Conducted susceptibility, damped sinusoidal transients, cables and power leads, 10 kHz–100 MHz |
| **RE101** | Radiated emissions, magnetic field, 30 Hz–100 kHz |
| **RE102** | Radiated emissions, electric field, 10 kHz–18 GHz |
| **RE103** | Radiated emissions, antenna spurious and harmonic outputs, 10 kHz–40 GHz |
| **RS101** | Radiated susceptibility, magnetic field, 30 Hz–100 kHz |
| **RS103** | Radiated susceptibility, electric field, 2 MHz–40 GHz |
| **RS105** | Radiated susceptibility, transient electromagnetic field |

### 5.3 Requirement Matrix *(chap2.pdf, p.19)*

The applicability of each requirement depends on the platform. Legend: **A** = applicable; **L** = limited (as specified in individual sections); **S** = procuring activity must specify in procurement documentation.

| Platform | CE101 | CE102 | CE106 | CS101 | CS114 | CS115 | RE101 | RE102 | RS101 | RS103 |
|---|---|---|---|---|---|---|---|---|---|---|
| Surface ships | — | A | L | A | A | L | A | A | A | A |
| Submarines | A | A | L | A | A | L | A | A | A | A |
| Aircraft, army | A | A | L | A | A | A | A | A | A | A |
| Aircraft, navy | L | A | L | A | A | A | L | A | L | A |
| Aircraft, air force | — | A | L | A | A | A | — | A | L | A |
| Space systems | — | A | L | A | A | A | — | A | — | A |
| Ground, army | — | A | L | A | A | A | — | A | L | A |
| Ground, navy | — | A | L | A | A | A | — | A | A | A |
| Ground, air force | — | A | L | A | A | A | — | A | — | A |

*(chap2.pdf, p.19)*

### 5.4 RS103 Limits *(chap2.pdf, p.20)*

Limit levels are given in V/m for various platforms and frequency ranges. Key values:

| Frequency Range | Aircraft External/Safety-Critical | Aircraft Internal | Ships Above Decks (External) | Ships Metallic Below Decks | Ground | Space |
|---|---|---|---|---|---|---|
| 2–30 MHz | 200 | 200 | 200 | 10 | 50 | 20 |
| 30 MHz–1 GHz | 200 | 200 | 200 | 10 | 50 | 20 |
| 1–18 GHz | 200 | 200 | 200 | 10 | 50 | 20 |
| 18–40 GHz | 200 | 200 | 200 | 10 | 50 | 20 |

Key: A = Army; N = Navy; AF = Air Force.
*(chap2.pdf, p.20)*

### 5.5 CE102 Limit *(chap2.pdf, p.21)*

Figure description: Log-log plot of limit level (dBµV) vs. frequency (10 kHz–100 MHz). The basic curve starts at ~100 dBµV at 10 kHz, falls linearly (on log scale) to ~60 dBµV at 10 MHz, then remains flat at 60 dBµV through 100 MHz. Higher nominal voltages get relaxations: 28 V supply → basic curve; 115 V → +6 dB; 220 V → +9 dB; 270 V → +10 dB; 440 V → +12 dB. Applies to EUT power leads (AC and DC) for all applications.

### 5.6 RE102 Limit — Aircraft and Space Applications *(chap2.pdf, p.22)*

Figure description: Log-log plot of limit level (dBµV/m) vs. frequency (10 kHz–100 GHz). Three curves:
- Fixed wing external (2 MHz–18 GHz) and helicopters: lowest curve (~20–24 dBµV/m at 10 kHz–1 MHz)
- Fixed wing internal, nose-to-tail < 25 m: middle curve (~34 dBµV/m flat region)
- Fixed wing internal, nose-to-tail ≥ 25 m: higher curve (~44 dBµV/m flat region)
All curves rise steeply above ~1 GHz reaching ~69–89 dBµV/m at 18 GHz.

### 5.7 RE102 Limit — Ground Applications *(chap2.pdf, p.23)*

Figure description: Log-log plot, frequency 100 kHz–100 GHz. Two curves:
- Navy mobile & army: lower curve (~24 dBµV/m at low frequencies, rising above ~100 MHz)
- Navy fixed & air force: upper curve (~44 dBµV/m at low frequencies)
Both rise steeply above 1 GHz, reaching ~69–89 dBµV/m at 18 GHz.

---

## 6. Measurement of Emissions for Compliance Verification *(chap2.pdf, p.24–p.36)*

### 6.1 Introduction *(chap2.pdf, p.24)*

Every standard (FCC, CISPR 22, MIL-STD-461) clearly defines how data are to be measured, including:
- Test procedure
- Test equipment
- Bandwidth
- Test antennas

### 6.2 Radiated Emissions — Test Sites *(chap2.pdf, p.25)*

Commercial tests (FCC and CISPR 22) are measured either at:
- **Open-Area Test Site (OATS)** — preferred
- **Semianechoic Chamber (SAC)** — preferred for all-weather capability and security

### 6.3 Semianechoic Chamber (SAC) Construction *(chap2.pdf, p.26)*

Figure description: Diagram of a shielded room. Interior surfaces:
- **Top**: RF absorber material (pyramidal foam absorbers)
- **Sides**: RF absorber material
- **Floor**: Metallic ground plane

The Equipment Under Test (EUT) sits on a turntable 1 m above the ground plane. The receiving antenna is placed at 3 m or 10 m distance, elevated 1–4 m (scan height) for both vertical and horizontal polarizations.

**Receiver detector types:**
- FCC: quasi-peak
- CISPR: quasi-peak
- MIL: peak

*(chap2.pdf, p.26)*

### 6.4 Test Antennas *(chap2.pdf, p.27)*

Figure: Photograph of actual SAC with antenna masts and absorber-covered walls.

**For FCC and CISPR:**
- **Biconical antenna**: 30–200 MHz
- **Log-periodic antenna**: 200 MHz–1 GHz

**For MIL-STD-461E:**
- **104-cm rod dipole antenna**: 10 kHz–30 MHz
- **Biconical antenna**: 30–200 MHz
- **Double-ridge horn antenna**: above 200 MHz

*(chap2.pdf, p.27)*

### 6.5 Conducted Emissions — Measurement Setup *(chap2.pdf, p.28–p.29)*

Figure (p.28): Typical household power distribution system showing hot (black), neutral (white/bare), and ground (green) conductors from service entrance panel through circuit breakers to load outlets. The EUT (product under test) plugs into an outlet. Noise currents return via power leads.

> Goal: Measure the conducted noise current passing back to the power system.

**LISN Circuit Concept** *(chap2.pdf, p.29)*

The LISN is inserted between the AC power net and the EUT. It has two functions:
1. **Block** the 60 Hz (or 50 Hz) power-line signal from reaching the measurement receiver
2. **Pass** the 150 kHz–30 MHz product noise to the receiver

Figure (p.29): Full LISN schematic showing:
- Phase ($I_P$) and Neutral ($I_N$) paths each with: series inductor $L_1$, shunt capacitors $C_1$ (toward EUT) and $C_2$ (toward power net), shunt resistors $R_1$ (1 kΩ) and 50 Ω measurement port
- Green wire ground
- Output labeled "To receivers"

### 6.6 LISN Element Values — FCC and CISPR 22 *(chap2.pdf, p.30)*

Figure description: Circuit diagram (one phase shown). From EUT side to power source:
- Series inductor: **50 µH**
- Shunt capacitor (EUT side): **0.1 µF**
- Shunt capacitor (power side): **1.0 µF**
- Shunt resistor from measurement tap: **1000 Ω** (in parallel with 50 Ω noise meter/termination)

### 6.7 LISN Element Values — MIL-STD-461E *(chap2.pdf, p.31)*

Figure description: Circuit diagram (b). From power source to EUT:
- Series inductor: **50 µH**
- Shunt capacitor (power side): **8 µF**
- Shunt capacitor (EUT side): **0.25 µF**
- Shunt resistor (power side): **5 Ω**
- Shunt resistor (EUT side): **1 kΩ**
- Signal output port connects to 50 Ω termination or 50 Ω input of measurement receiver

### 6.8 LISN Impedance — PSPICE Simulation *(chap2.pdf, p.32)*

> **An important purpose of the LISN is to present a constant 50 Ω impedance** to the EUT over the conducted emissions measurement range.

Figure description: Left — PSPICE schematic of LISN (FCC/CISPR 22 version) with node labels. Right — Plot of input impedance $Z_{in}$ (Ω) vs. frequency.
- At 150 kHz: impedance ≈ 36 Ω (slightly below target)
- From ~300 kHz through 30 MHz: impedance approaches and holds at ~47–48 Ω ≈ 50 Ω
- The LISN effectively presents ~50 Ω across the entire 150 kHz–30 MHz range

*(chap2.pdf, p.32)*

### 6.9 Typical Product Emission Examples *(chap2.pdf, p.33–p.36)*

#### Radiated Emissions of a Typical Digital Product *(chap2.pdf, p.33–p.34)*

Figure (p.33): Vertical polarization measurement. Narrowband radiated EMI spectrum from 30 MHz to ~1 GHz plotted against FCC Part 15, German GOP Class B, and CISPR 22 limits. Discrete harmonic spikes visible at 74.902 MHz (38.9 dB), 134.829 MHz (34.8 dB), 158.789 MHz (38.5 dB), 174.771 MHz (35.2 dB). Most spikes fall below FCC Part 15 Class B limits.

Figure (p.34): Horizontal polarization measurement. Similar narrowband spectrum. Notable peaks at 119.847 MHz (35.9 dB), 129.835 MHz (30.5 dB), 134.036 MHz (30.3 dB), 144.808 MHz (40.2 dB), and many more discrete harmonics. Shows FCC Part 15, German GOP Class B, and CISPR 22 overlaid limits.

#### Conducted Emissions of a Typical Digital Product (Switching Power Supply) *(chap2.pdf, p.35–p.36)*

Figure (p.35): Phase conductor measurement (0.01 MHz–30 MHz), plotted against German GOP (G-P), CISPR 22 Quasi-Peak, and CISPR 22 Average limits. Large spike near 0.048 MHz (84.7 dB — far above limit), with emissions generally falling below CISPR 22 QP limit above ~1 MHz.

Figure (p.36): Neutral conductor measurement (0.01 MHz–30 MHz). Similar plot showing spikes at 0.025 MHz (85.2 dB), 0.033 MHz (83.6 dB), 0.045 MHz (60 dB). Above ~0.15 MHz the emissions approach the CISPR 22 QP and Average limits.

---

## 7. Difficulty in Meeting Regulatory Limits — PCB Example *(chap2.pdf, p.37–p.38)*

### 7.1 Typical PCB Layout *(chap2.pdf, p.37)*

Figure (p.37, a): A simple digital PCB with:
- 10 MHz oscillator (battery-powered, dual inline package)
- Two 74LS04 inverters connected by a 7-inch (180 mils wide) trace over a ground plane
- Glass epoxy substrate with $\varepsilon_r = 4.7$, 62 mils thick, 15 mil trace width

Key dimensions:
$$L = 7 \text{ in} = 7 \times 2.54 \text{ cm} = 17.78 \text{ cm}$$
*(chap2.pdf, p.37)*

At 1 GHz:
$$\lambda = \frac{3 \times 10^8}{10^9} = 300 \text{ mm} = 30 \text{ cm}$$
*(chap2.pdf, p.37)*

Note: at 30 GHz, $\lambda = 10$ mm — the trace length becomes significant relative to wavelength.

> The oscillator is battery-powered (dual inline package) to prevent illumination from the general power system.

### 7.2 PCB Emission Results *(chap2.pdf, p.38)*

Figure (p.38): Side-by-side plots of narrowband radiated EMI for horizontal (left) and vertical (right) polarizations. FCC Part 15 Class B limit overlaid.

Results:
- **Horizontal emissions exceed the FCC Class B limit by as much as 30 dB.**
- **Vertical emissions also exceed the FCC Class B limit by approximately 15 dB** (even though the board is placed parallel to the ground plane of the chamber).

This demonstrates that even a simple, minimal PCB with a battery-powered oscillator can fail compliance testing by large margins.
*(chap2.pdf, p.38)*

---

## 8. Additional Product Requirements *(chap2.pdf, p.39)*

Beyond governmental emission limits, manufacturers may impose additional EMC requirements:

| Requirement | Notes |
|---|---|
| **Radiated Susceptibility (Immunity)** | Product must function correctly when exposed to radiated EM fields |
| **Conducted Susceptibility (Immunity)** | Product must withstand noise injected via power/signal lines |
| **Electrostatic Discharge (ESD)** | Static voltage can approach **25 kV** in magnitude |
| **Requirements for Commercial Aircraft** | For commercial aircraft and airborne electronic systems |
| **Requirements for Commercial Vehicles** | For onboard electronics of vehicles |

---

## 9. Design Constraints for Products *(chap2.pdf, p.40)*

When designing for EMC compliance, engineers must balance:

1. **Product Cost** — EMC fixes add cost
2. **Consumer Acceptability** — Shielding, filtering must not degrade usability
3. **Automatic Assembly Process** — EMC components must be compatible with manufacturing
4. **Product Development Schedule** — Delays reduce marketability and increase costs

> Key principle: **Determine the primary or dominant source of the emission** so that a fix can be efficiently made and unnecessary cost is not added.
*(chap2.pdf, p.40)*

---

## 10. Advantages of EMC Design *(chap2.pdf, p.41)*

### 10.1 Benefits
- Minimizing product cost
- Minimizing development schedule delays
- Minimizing customer complaints

### 10.2 How to Follow the Rules *(chap2.pdf, p.41)*
1. **Early and consistent attention** to EMC minimizes cost and schedule delays and provides the best chance of complying with regulatory requirements. ("Paper work before layout")
2. **Assume that some EMC suppressions will be needed** for compliance and provide the ability to implement them if needed. ("Prepare holes for capacitors and resistors")

---

## Summary Table: Key Emission Limits

| Standard | Type | Class | Freq. Range | Limit | Distance |
|---|---|---|---|---|---|
| FCC Part 15 | Conducted | B | 150 kHz–30 MHz | 56–60 dBµV (QP) | Via LISN |
| FCC Part 15 | Conducted | A | 150 kHz–30 MHz | 73–79 dBµV (QP) | Via LISN |
| FCC Part 15 | Radiated | B | 30 MHz–40 GHz | 40–54 dBµV/m | 3 m |
| FCC Part 15 | Radiated | A | 30 MHz–40 GHz | 39–49.5 dBµV/m | 10 m |
| CISPR 22 | Conducted | B | 150 kHz–30 MHz | Same as FCC | Via LISN |
| CISPR 22 | Conducted | A | 150 kHz–30 MHz | Same as FCC | Via LISN |
| CISPR 22 | Radiated | B | 30 MHz–1 GHz | 30–37 dBµV/m | 10 m |
| CISPR 22 | Radiated | A | 30 MHz–1 GHz | 40–47 dBµV/m | 10 m |
| MIL-STD-461E | CE102 | — | 10 kHz–10 MHz | ~60–100 dBµV | Via LISN |
| MIL-STD-461E | RE102 | — | 10 kHz–18 GHz | varies by platform | — |
| MIL-STD-461E | RS103 | — | 2 MHz–40 GHz | 5–200 V/m | — |

---

## Key Equations and Conversions

Distance normalization for radiated emissions (p.13):

$$\Delta E_{dB} = 20\log_{10}\!\left(\frac{d_1}{d_2}\right)$$
*(chap2.pdf, p.13)*

Normalizing Class A from 10 m to 3 m:

$$\Delta E = 20\log_{10}\!\left(\frac{10}{3}\right) = 10.46 \text{ dB}$$
*(chap2.pdf, p.13)*

Example: Class A 30–88 MHz at 10 m is 39 dBµV/m; at 3 m this becomes $39 + 10.46 \approx 49.5$ dBµV/m, which is about 10 dB above the Class B limit of 40 dBµV/m at 3 m.
>>>>>>> c5b0b435f3af3f08f08cea2c9c10c79f92a8dbe0
