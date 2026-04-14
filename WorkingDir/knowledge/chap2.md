# Chapter 2: EMC Requirements for Electronic Systems

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
