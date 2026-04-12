# Chapter 4: Transmission Lines and Signal Integrity

**Source:** chap4.pdf  
**Topics:** Transmission-line equations, per-unit-length parameters, time-domain solution, signal integrity, sinusoidal/phasor analysis, lossy lines, lumped-circuit models

---

## Table of Contents
1. [Preview](#1-preview)
2. [The Transmission-Line Equations](#2-the-transmission-line-equations)
3. [The Per-Unit-Length Parameters](#3-the-per-unit-length-parameters)
4. [The Time-Domain Solution](#4-the-time-domain-solution)
5. [High-Speed Digital Interconnects and Signal Integrity](#5-high-speed-digital-interconnects-and-signal-integrity)
6. [Sinusoidal Excitation and the Phasor Solution](#6-sinusoidal-excitation-and-the-phasor-solution)
7. [Lumped-Circuit Approximate Models](#7-lumped-circuit-approximate-models)

---

## 1. Preview

### Why Transmission Lines Matter

*(chap4.pdf, p.3)*

- A transmission line imposes a **time delay** as signals propagate from one end to the other:

$$T_D = \frac{\mathscr{L}}{v}$$
*(chap4.pdf, p.3)*

where $\mathscr{L}$ is the line length and $v$ is the velocity of propagation.

- **Impedance mismatch** causes reflections, which distort the original signal — the primary mechanism degrading signal integrity.
- **Signal integrity** means the waveforms at the input and output of a line are identical or approximately so.

### Categories of Transmission Lines

*(chap4.pdf, p.4–5)*

**Wire-type transmission lines:**

| Structure | Dispersive? | Notes |
|-----------|-------------|-------|
| Two-wire | Yes | Dispersive due to outer insulator |
| Wire above ground plane | Yes | Dispersive due to outer insulator |
| Coaxial cable | No | Not dispersive |

**Printed Circuit Board (PCB) structures:**

| Structure | Dispersive? | Notes |
|-----------|-------------|-------|
| Stripline (inner-plane boards) | No | Field fully enclosed in dielectric |
| Microstrip (outer lands of inner-plane board) | Yes | Inhomogeneous medium |
| Coplanar strip (lands on board without inner planes) | Yes | Inhomogeneous medium |

*Figure descriptions: (p.4) Three wire-type TX line cross sections shown as (a) two-wire, (b) wire above ground, (c) coaxial. (p.5) Three PCB structures: (a) stripline between two ground planes, (b) microstrip on substrate above ground, (c) coplanar strips on substrate.*

---

## 2. The Transmission-Line Equations

### Lossless Equivalent Circuit Model

*(chap4.pdf, p.6–7)*

A two-conductor transmission line is modeled as a **distributed parameter circuit**: a sequence of series inductors ($l \Delta z$ each) and shunt capacitors ($c \Delta z$ each), where $l$ and $c$ are per-unit-length inductance (H/m) and capacitance (F/m).

*Figure (p.6): Distributed circuit model showing repeated $l\Delta z$ inductors in series and $c\Delta z$ capacitors to ground for each $\Delta z$ cell.*

**Physical interpretation:**
- **Effect of L and C:** Energizing/de-energizing inductors and capacitors takes finite time → signal propagates at finite speed → time delay $T_D = \mathscr{L}/v$.
- **Effect of R:** At GHz frequencies, conductor resistance becomes significant due to skin effect and cannot be neglected.

### Telegrapher's Equations — First-Order (Coupled) Form

*(chap4.pdf, p.8–9)*

Applying **KVL** around the outer loop of a $\Delta z$ section and taking $\lim_{\Delta z \to 0}$:

$$\frac{\partial V(z,t)}{\partial z} = -l \frac{\partial I(z,t)}{\partial t} \tag{1}$$
*(chap4.pdf, p.8)*

Applying **KCL** at the upper node of the capacitor:

$$\frac{\partial I(z,t)}{\partial z} = -c \frac{\partial V(z,t)}{\partial t} \tag{2}$$
*(chap4.pdf, p.9)*

Equations (1) and (2) are the **coupled transmission-line equations** in first-order form (Telegrapher's equations).

### Telegrapher's Equations — Second-Order (Uncoupled) Form

*(chap4.pdf, p.10)*

Differentiating (1) with respect to $z$ and (2) with respect to $t$, then combining:

$$\frac{\partial^2 V(z,t)}{\partial z^2} = lc \frac{\partial^2 V(z,t)}{\partial t^2}$$
*(chap4.pdf, p.10)*

$$\frac{\partial^2 I(z,t)}{\partial z^2} = lc \frac{\partial^2 I(z,t)}{\partial t^2}$$
*(chap4.pdf, p.10)*

These are the **uncoupled transmission-line equations** in second-order form (wave equations).

---

## 3. The Per-Unit-Length Parameters

### TEM Wave and Field Derivation

*(chap4.pdf, p.11)*

Transmission lines support **Transverse ElectroMagnetic (TEM)** waves: no field components in the direction of propagation ($H_z = 0$, $E_z = 0$).

- From Faraday's law with $H_z = 0$: derive transverse electric field $\vec{E}_T$
- From Ampere's law with $E_z = 0$: derive transverse magnetic field $\vec{H}_T$
- From $\vec{E}_T$ and $\vec{H}_T$, compute per-unit-length $l$ and $c$ using **dc field computations** (valid because TEM fields have the same spatial distribution as static fields)

### Homogeneous Medium Relations

*(chap4.pdf, p.12)*

For a **homogeneous** surrounding medium:

$$lc = \mu\epsilon$$
*(chap4.pdf, p.12)*

This yields:

$$l = \frac{1}{cv^2}, \quad c = \frac{1}{lv^2}$$

where the velocity of propagation is:

$$v = \frac{1}{\sqrt{\mu\epsilon}} = \frac{v_0}{\sqrt{\epsilon_r}} = \frac{3 \times 10^8}{\sqrt{\epsilon_r}} \text{ m/s}$$
*(chap4.pdf, p.12)*

### Effective Relative Permittivity (Inhomogeneous Medium)

*(chap4.pdf, p.13)*

For inhomogeneous media (e.g., microstrip with air above and dielectric below), replace $\epsilon_r$ with an **effective relative permittivity** $\epsilon_r'$:

$$lc = \mu_0 \epsilon_0 \epsilon_r'$$

$$v = \frac{1}{\sqrt{\mu_0 \epsilon_0 \epsilon_r'}} = \frac{v_0}{\sqrt{\epsilon_r'}} \text{ m/s}$$
*(chap4.pdf, p.13)*

### Wire-Type Structure Formulas

#### Magnetic Field of a Current-Carrying Wire

*(chap4.pdf, p.14)*

By Ampere's law (uniformly distributed current):

$$H_T = \frac{I}{2\pi r} \text{ (A/m)}$$
*(chap4.pdf, p.14)*

#### Magnetic Flux (Used to Find $l$)

*(chap4.pdf, p.15)*

$$\psi_m = \int_S \vec{B}_T \cdot d\vec{s} = \int_{R_1}^{R_2} \frac{\mu_0 I}{2\pi r} dr = \frac{\mu_0 I}{2\pi} \ln\!\left(\frac{R_2}{R_1}\right) \text{ (Wb)}$$
*(chap4.pdf, p.15)*

Per-unit-length inductance: $\Psi = lI$, so $l = \psi_m / I$.

#### Electric Field of a Charged Wire

*(chap4.pdf, p.16)*

By Gauss's law:

$$E_T = \frac{q}{2\pi\epsilon_0 r} \text{ (V/m)}$$
*(chap4.pdf, p.16)*

#### Voltage Between Two Points (Used to Find $c$)

*(chap4.pdf, p.17)*

$$V = \frac{q}{2\pi\epsilon_0} \ln\!\left(\frac{R_2}{R_1}\right) \text{ (V)}, \quad R_2 \geq R_1$$
*(chap4.pdf, p.17)*

Per-unit-length capacitance: $q = cV$, so $c = q/V$.

### Two-Wire Line

*(chap4.pdf, p.18–22)*

For two wires of radius $r_w$ separated by distance $s$ ($s \gg r_w$):

**Approximate per-unit-length inductance:**

$$l \approx \frac{\mu_0}{\pi}\ln\!\left(\frac{s}{r_w}\right) = 0.4\ln\!\left(\frac{s}{r_w}\right) \text{ (\mu H/m)} = 10.16\ln\!\left(\frac{s}{r_w}\right) \text{ (nH/in.)}$$
*(chap4.pdf, p.19)*

**Exact per-unit-length inductance:**

$$l = \frac{\mu_0}{\pi}\cosh^{-1}\!\left(\frac{s}{2r_w}\right) = \frac{\mu_0}{\pi}\ln\!\left[\frac{s}{2r_w} + \sqrt{\left(\frac{s}{2r_w}\right)^2 - 1}\right] \text{ (H/m)}$$
*(chap4.pdf, p.20)*

**Approximate per-unit-length capacitance:**

$$c \approx \frac{\pi\epsilon_0}{\ln(s/r_w)} = \frac{27.78}{\ln(s/r_w)} \text{ (pF/m)} = \frac{0.706}{\ln(s/r_w)} \text{ (pF/in.)}$$
*(chap4.pdf, p.22)*

**Exact per-unit-length capacitance:**

$$c = \frac{\pi\epsilon_0}{\cosh^{-1}(s/2r_w)} \text{ (F/m)}$$
*(chap4.pdf, p.20)*

Note: $\cosh^{-1}(x) \approx \ln(2x)$ for $x \gg 1$.

### Wire Above a Ground Plane

*(chap4.pdf, p.23–24)*

Using the **method of images**: capacitance between wire (height $h$, radius $r_w$) and ground plane equals twice the capacitance of two wires at separation $2h$.

**Exact per-unit-length capacitance:**

$$c = \frac{2\pi\epsilon_0}{\cosh^{-1}(h/r_w)} \approx \frac{2\pi\epsilon_0}{\ln(2h/r_w)} \text{ (F/m)}, \quad h \gg r_w$$
*(chap4.pdf, p.24)*

**Exact per-unit-length inductance** (half the inductance of the two-wire line):

$$l = \frac{\mu_0}{2\pi}\cosh^{-1}\!\left(\frac{h}{r_w}\right) \approx \frac{\mu_0}{2\pi}\ln\!\left(\frac{2h}{r_w}\right) \text{ (H/m)}, \quad h \gg r_w$$
*(chap4.pdf, p.24)*

### Coaxial Cable

*(chap4.pdf, p.25–27)*

For inner wire of radius $r_w$ and outer shield of inner radius $r_s$, no proximity effect due to symmetry.

**Exact per-unit-length inductance:**

$$l = \frac{\mu_0}{2\pi}\ln\!\left(\frac{r_s}{r_w}\right) = 0.2\ln\!\left(\frac{r_s}{r_w}\right) \text{ (\mu H/m)} = 5.08\ln\!\left(\frac{r_s}{r_w}\right) \text{ (nH/in.)}$$
*(chap4.pdf, p.26)*

**Exact per-unit-length capacitance:**

$$c = \frac{2\pi\epsilon}{\ln(r_s/r_w)} = \frac{55.56\epsilon_r}{\ln(r_s/r_w)} \text{ (pF/m)} = \frac{1.4\epsilon_r}{\ln(r_s/r_w)} \text{ (pF/in.)}$$
*(chap4.pdf, p.27)*

### PCB Structures — Characteristic Impedance

*(chap4.pdf, p.28)*

For PCB lines, work with **characteristic impedance** $Z_C$ and **velocity** $v$:

$$Z_C = \sqrt{\frac{l}{c}} \;\Omega, \quad v = \frac{1}{\sqrt{lc}} = \frac{v_0}{\sqrt{\epsilon_r'}} \text{ m/s}$$
*(chap4.pdf, p.28)*

From which: $l = Z_C/v$ and $c = 1/(vZ_C)$.

#### Stripline (inner-plane boards, $t = 0$)

*(chap4.pdf, p.29)*

$$Z_C = \frac{30\pi}{\sqrt{\epsilon_r}} \cdot \frac{1}{\left[\frac{w_e}{s} + 0.441\right]}$$
*(chap4.pdf, p.29)*

where $s$ is board thickness between planes, $w$ is land width, and

$$\frac{w_e}{s} = \begin{cases} \frac{w}{s} & \frac{w}{s} \geq 0.35 \\ \frac{w}{s} - \left(0.35 - \frac{w}{s}\right)^2 & \frac{w}{s} \leq 0.35 \end{cases}$$

Note: $\epsilon_r' = \epsilon_r$ for stripline (homogeneous medium).

#### Microstrip Line (outer lands of inner-plane board, $t = 0$)

*(chap4.pdf, p.30)*

$$Z_C = \begin{cases} \dfrac{60}{\sqrt{\epsilon_r'}}\ln\!\left[\dfrac{8h}{w} + \dfrac{w}{4h}\right] & \dfrac{w}{h} \leq 1 \\[10pt] \dfrac{120\pi}{\sqrt{\epsilon_r'}}\left[\dfrac{w}{h} + 1.393 + 0.667\ln\!\left(\dfrac{w}{h} + 1.444\right)\right]^{-1} & \dfrac{w}{h} \geq 1 \end{cases}$$
*(chap4.pdf, p.30)*

where $h$ is substrate thickness, $w$ is land width, and the **effective relative permittivity** is:

$$\epsilon_r' = \frac{\epsilon_r + 1}{2} + \frac{\epsilon_r - 1}{2} \cdot \frac{1}{\sqrt{1 + 10h/w}}$$
*(chap4.pdf, p.30)*

Limiting cases: $\epsilon_r' \approx \epsilon_r$ for $h \ll w$; $\epsilon_r' \approx (\epsilon_r+1)/2$ for $h \gg w$.

#### Coplanar Strip (lands on board without inner planes, $t = 0$)

*(chap4.pdf, p.31)*

$$Z_C = \begin{cases} \dfrac{120}{\sqrt{\epsilon_r'}}\ln\!\left(2\dfrac{1+\sqrt{k}}{1-\sqrt{k}}\right) & \dfrac{1}{\sqrt{2}} \leq k \leq 1 \\[10pt] \dfrac{377\pi}{\sqrt{\epsilon_r'}\ln\!\left(2\dfrac{1+\sqrt{k'}}{1-\sqrt{k'}}\right)} & 0 \leq k \leq \dfrac{1}{\sqrt{2}} \end{cases}$$
*(chap4.pdf, p.31)*

where $k = s/(s+2w)$ and $k' = \sqrt{1-k^2}$.

#### Strips on Opposite Sides (power plane configuration)

*(chap4.pdf, p.32)*

Two formulas depending on $w/h > 1$ or $w/h < 1$. Wide lands on opposite sides give **lower characteristic impedance** than on the same side — useful for power planes where low inductance ($v = L\,di/dt$) is needed.

---

## 4. The Time-Domain Solution

### Definition

*(chap4.pdf, p.33)*

The time-domain solution is the **complete solution** (transient + steady state) with no assumptions about the time form of excitation. It is the primary tool for signal integrity analysis.

### Lossless Line Solution

*(chap4.pdf, p.34)*

The general solution of the wave equations consists of forward- and backward-traveling waves:

$$V(z,t) = V^+\!\left(t - \frac{z}{v}\right) + V^-\!\left(t + \frac{z}{v}\right)$$
*(chap4.pdf, p.34)*

$$I(z,t) = \frac{1}{Z_C}V^+\!\left(t - \frac{z}{v}\right) - \frac{1}{Z_C}V^-\!\left(t + \frac{z}{v}\right)$$
*(chap4.pdf, p.34)*

where:
- $V^+$: forward-traveling wave (in $+z$ direction)
- $V^-$: backward-traveling wave (in $-z$ direction)
- Characteristic impedance: $Z_C = \sqrt{l/c} = vl = 1/(vc)$
- Velocity: $v = 1/\sqrt{lc} = 1/\sqrt{\mu\epsilon}$

Each wave's current is related to its voltage by $Z_C$:

$$I^+\!\left(t - \frac{z}{v}\right) = \frac{1}{Z_C}V^+\!\left(t - \frac{z}{v}\right)$$

$$I^-\!\left(t + \frac{z}{v}\right) = -\frac{1}{Z_C}V^-\!\left(t + \frac{z}{v}\right)$$
*(chap4.pdf, p.35)*

### Load and Source Reflection Coefficients

*(chap4.pdf, p.35–37)*

**Load reflection coefficient** (at $z = \mathscr{L}$):

$$\Gamma_L = \frac{V^-(t + \mathscr{L}/v)}{V^+(t - \mathscr{L}/v)} = \frac{R_L - Z_C}{R_L + Z_C}$$
*(chap4.pdf, p.35)*

**Source reflection coefficient** (at $z = 0$):

$$\Gamma_S = \frac{R_S - Z_C}{R_S + Z_C}$$
*(chap4.pdf, p.37)*

The current reflection coefficient is the **negative** of the voltage reflection coefficient.

**Initially launched voltage and current** from source:

$$V(0,t) = \frac{Z_C}{R_S + Z_C}V_S(t), \quad I(0,t) = \frac{V_S(t)}{R_S + Z_C}$$
*(chap4.pdf, p.37)*

The backward-traveling wave is related to the forward wave at the load:

$$V^-\!\left(t + \frac{\mathscr{L}}{v}\right) = \Gamma_L V^+\!\left(t - \frac{\mathscr{L}}{v}\right)$$
*(chap4.pdf, p.36)*

**Multiple reflections** continue bouncing between source and load.

**Matched case** ($R_L = Z_C$): Only a time delay is imposed; the line "doesn't matter."

$$V(0,t) = \frac{Z_C}{R_S + Z_C}V_S(t), \quad V(\mathscr{L},t) = \frac{Z_C}{R_S + Z_C}V_S(t - T_D)$$
*(chap4.pdf, p.43)*

### Bounce (Lattice) Diagram

*(chap4.pdf, p.42–43)*

The bounce diagram is a graphical tool for tracking multiple reflections:
- Horizontal axis: position $z$ from 0 to $\mathscr{L}$
- Vertical axis: time
- Diagonal lines represent forward/backward wave bounces
- At each bounce: multiply by $\Gamma_L$ (at load) or $\Gamma_S$ (at source)

**Voltage at $z = 0$ (source end):**

$$V(0,t) = \frac{Z_C}{R_S + Z_C}\bigl[V_S(t) + (1+\Gamma_S)\Gamma_L V_S(t-2T_D) + (1+\Gamma_S)(\Gamma_S\Gamma_L)\Gamma_L V_S(t-4T_D) + \cdots\bigr]$$
*(chap4.pdf, p.43)*

**Voltage at $z = \mathscr{L}$ (load end):**

$$V(\mathscr{L},t) = \frac{Z_C}{R_S+Z_C}\bigl[(1+\Gamma_L)V_S(t-T_D) + (1+\Gamma_L)\Gamma_S\Gamma_L V_S(t-3T_D) + \cdots\bigr]$$
*(chap4.pdf, p.43)*

### Example 4.1: Voltage on a Line as a Function of t

*(chap4.pdf, p.38)*

Circuit: $V_S = 30$ V, $R_S = 0$ ($\Gamma_S = -1$), $Z_C = 50\,\Omega$, $v = 200$ m/µs, $\mathscr{L} = 400$ m, $R_L = 100\,\Omega$ ($\Gamma_L = 1/3$), $T_D = 2\,\mu$s.

As time progresses, the load voltage converges to the steady-state value of **30 V**.

### Example 4.3: Short Pulsewidth

*(chap4.pdf, p.40)*

With $T_D = 1\,\mu$s, $R_S = 300\,\Omega$, $Z_C = 100\,\Omega$, $R_L = \infty$:

Initially sent voltage: $\frac{100}{300+100} \times 20 = 5$ V

Both $V(0,t)$ and $V(\mathscr{L},t)$ decay to zero in steady state (as expected for a pulse with no DC component).

### Example 4.4: Long Pulsewidth / Ringing

*(chap4.pdf, p.41)*

Circuit with $R_S = 150\,\Omega$, $Z_C = 50\,\Omega$, $R_L = 0\,\Omega$ ($\Gamma_L = -1$), $\Gamma_S = 1/2$, $T_D = 2\,\mu$s.

Initial voltage: $\frac{50}{150+50}\times 100 = 25$ V

The **overlap of forward and backward waves creates ringing** — a complicated waveform with oscillations.

---

## 5. High-Speed Digital Interconnects and Signal Integrity

### Clock Skew

*(chap4.pdf, p.44)*

The time delay $T_D = \mathscr{L}/v$ in traversing PCB traces becomes critical when it is on the order of the pulse rise/fall times. Unequal path lengths to different clocked elements cause **clock skew** (different arrival times). Careful routing equalizes path lengths.

### Impedance Mismatch Effects

*(chap4.pdf, p.45–46)*

- Mismatched source and load cause reflections → distorted signal
- Changes in trace cross-section change $Z_C$ → reflections at discontinuities
- Layer changes via vias → impedance discontinuity

**Typical CMOS gate parameters:**
- Output resistance: 10–30 Ω
- Input capacitance: 5–15 pF

A mismatched line causes ringing in $V(L,t)$, which is caused by multiple reflections.

### Effect of Resistive Termination

*(chap4.pdf, p.47–49)*

Load voltage with resistive termination:

$$V(\mathscr{L},t) = \frac{Z_C}{R_S + Z_C}(1 + \Gamma_L)\bigl[V_S(t - T_D) + \Gamma_S\Gamma_L V_S(t-3T_D) + (\Gamma_S\Gamma_L)^2 V_S(t-5T_D) + \cdots\bigr]$$
*(chap4.pdf, p.48)*

**Effects of sign combinations of $\Gamma_S$ and $\Gamma_L$:**

| $\Gamma_S$ | $\Gamma_L$ | Condition | Effect |
|-----------|-----------|-----------|--------|
| $-$ | $+$ | $R_S < Z_C$, $R_L > Z_C$ | May cause **multiple activations** (overshoot above logic 1) |
| $+$ | $+$ | $R_S > Z_C$, $R_L > Z_C$ | |
| $+$ | $-$ | $R_S > Z_C$, $R_L < Z_C$ | May **postpone activation** (undershoot) |
| $-$ | $-$ | $R_S < Z_C$, $R_L < Z_C$ | |

*(chap4.pdf, p.49)*

### Effect of Capacitive Termination

*(chap4.pdf, p.50–52)*

For a line with matched source ($\Gamma_S = 0$) terminated in capacitor $C$:

Load reflection coefficient (in Laplace domain):

$$\Gamma_L(s) = \frac{Z_L - Z_C}{Z_L + Z_C} = \frac{1 - sT_C}{1 + sT_C}$$

where $T_C = Z_C C$.
*(chap4.pdf, p.50)*

The load voltage (time domain, for step input $V_S = V_0 u(t)$):

$$V_L(t) = V_0 u(t - T_D) - e^{-(t-T_D)/T_C} V_0 u(t - T_D)$$
*(chap4.pdf, p.52)*

Behavior:
- **Initially**: capacitor looks like a **short circuit**
- **Steady state**: capacitor transitions to an **open circuit**
- **Additional time delay** at the 50% point:

$$t_d = 0.693 T_C = 0.693 C Z_C$$
*(chap4.pdf, p.52)*

### Effect of Inductive Termination

*(chap4.pdf, p.53)*

For matched source terminated in inductor $L$:

$$\Gamma_L(s) = \frac{sT_L - 1}{sT_L + 1}, \quad T_L = \frac{L}{Z_C}$$

Load voltage: $V_L(t) = V_0 e^{-(t-T_D)/T_L} u(t-T_D)$

*(chap4.pdf, p.53)*

Behavior:
- **Initially**: inductor looks like an **open circuit**
- **Steady state**: inductor transitions to a **short circuit**

### Matching Schemes for Signal Integrity

*(chap4.pdf, p.54–58)*

#### Series Match

*(chap4.pdf, p.54)*

Add resistor $R$ in **series with the source** such that:

$$R_S + R = Z_C$$
*(chap4.pdf, p.54)*

Advantages:
1. Output reaches same level as input (no attenuation)
2. No DC current flows in the line → **resistor dissipates no power** in steady state

*Figure (p.54): Source, series resistor R, transmission line to open-circuit load. Load voltage rises cleanly to $V_0$ at $t = T_D$, holds at $V_0/2$ until $t = 2T_D$, then rises to $V_0$.*

#### Parallel Match

*(chap4.pdf, p.55)*

Add resistor $R$ in **parallel with the load** such that:

$$R \| R_L = \frac{R R_L}{R + R_L} = Z_C$$
*(chap4.pdf, p.55)*

Disadvantages:
1. Load voltage is always less than source level $V_0$
2. Matching resistor **consumes power** even at steady state

#### Comparison Example

*(chap4.pdf, p.56–58)*

Circuit: $R_S = 20\,\Omega$, $Z_C = 50\,\Omega$, $T_D = 0.2$ ns, $C_L = 5$ pF.

- **No match:** Load shows severe ringing (overshoot to ~8 V, undershoot to −1 V for 5 V input)
- **Series match ($R = 30\,\Omega$):** Load rises smoothly to 5 V; three delays sum to:
  - 0.05 ns (source rise time $\tau_r/2$)
  - 0.2 ns ($T_D$)
  - 0.1733 ns ($0.693CZ_C$)
  - Total = 0.4233 ns
- **Parallel match ($R = 50\,\Omega$):** Still has ringing; capacitor dominates at high frequencies; steady-state voltage falls below 5 V

*(chap4.pdf, p.57)*

### When Does the Line Not Matter?

*(chap4.pdf, p.59–63)*

**Criterion:** When the line is electrically short at the highest significant frequency:

$$\mathscr{L} < \frac{1}{10}\left(\frac{v}{f_\text{max}}\right)\lambda \quad \Rightarrow \quad T_D = \frac{\mathscr{L}}{v} < \frac{1}{10}\tau_r$$

$$\boxed{\tau_r > 10 T_D}$$
*(chap4.pdf, p.59)*

where $f_\text{max} = 1/\tau_r$ is the maximum significant frequency (bandwidth = $1/\tau_r$).

**Examples ($R_S = 20\,\Omega$, $Z_C = 50\,\Omega$, $T_D = 0.2$ ns, $C_L = 5$ pF):**

| $\tau_r$ | $\tau_r / T_D$ | Overshoot |
|---------|---------------|-----------|
| 0.2 ns | $= T_D$ | 7.0 V (very severe) |
| 1 ns | $= 5 T_D$ | 6.0 V (still significant) |
| 2 ns | $= 10 T_D$ | 5.3 V (moderate) |
| 4 ns | $= 20 T_D$ | 5.2 V (mild) |

*(chap4.pdf, p.60–63)*

As $\tau_r$ increases, $f_\text{max}$ decreases → high-frequency components are reduced → overshoot decreases.

### Effects of Line Discontinuities

*(chap4.pdf, p.64–65)*

At a junction between two lines with characteristic impedances $Z_{C1}$ and $Z_{C2}$:

**Reflection/transmission from left ($Z_{C1}$ incident):**

$$\Gamma_{12} = \frac{Z_{C2} - Z_{C1}}{Z_{C2} + Z_{C1}}, \quad T_{12} = \frac{2Z_{C2}}{Z_{C1} + Z_{C2}}$$
*(chap4.pdf, p.64)*

**Reflection/transmission from right ($Z_{C2}$ incident):**

$$\Gamma_{21} = \frac{Z_{C1} - Z_{C2}}{Z_{C1} + Z_{C2}}, \quad T_{21} = \frac{2Z_{C1}}{Z_{C1} + Z_{C2}}$$
*(chap4.pdf, p.65)*

Continuity condition: $v_{i1} + v_{r1} = v_{t2}$, so $1 + \Gamma_{12} = T_{12}$.

**Example 4.9 (p.67):** To eliminate reflections on lines with discontinuities, must use **series match at the source AND parallel match at the load** simultaneously.

### Effects of Feedline Discontinuities

*(chap4.pdf, p.68–72)*

**Series multiple feedlines (daisy chain):**
- Series match at source ($R_S + R = Z_C$): eliminates all reflections
- Parallel match at midpoint: does NOT eliminate reflections (because $\Gamma_{12} = -1/3$, not zero)

**Parallel multiple feedlines (bus topology):**
- For $N$ equal branches each with impedance $Z_C$: the parallel combination is $Z_C/N$
- Series match at source: $R_S = Z_C/N$ — works only if all time delays are equal ($T_{D1} = T_{D2}$)
- Parallel match at loads ($Z_C$ across each load): works but dissipates power

*(chap4.pdf, p.72)*

---

## 6. Sinusoidal Excitation and the Phasor Solution

### Phasor Form of Lossless TX Line

*(chap4.pdf, p.73)*

Starting from Telegrapher's equations and converting to phasor/frequency domain ($\partial/\partial t \to j\omega$):

$$\frac{d\hat{V}(z)}{dz} = -j\omega l \hat{I}(z), \quad \frac{d\hat{I}(z)}{dz} = -j\omega c \hat{V}(z)$$
*(chap4.pdf, p.73)*

Second-order uncoupled equations:

$$\frac{d^2\hat{V}(z)}{dz^2} + \omega^2 lc\, \hat{V}(z) = 0, \quad \frac{d^2\hat{I}(z)}{dz^2} + \omega^2 lc\, \hat{I}(z) = 0$$

**Phasor solution (forward + backward waves):**

$$\hat{V}(z) = \hat{V}^+ e^{-j\beta z} + \hat{V}^- e^{j\beta z}$$

$$\hat{I}(z) = \frac{\hat{V}^+}{Z_C}e^{-j\beta z} - \frac{\hat{V}^-}{Z_C}e^{j\beta z}$$
*(chap4.pdf, p.73)*

### Characteristic Impedance and Phase Constant

*(chap4.pdf, p.74)*

$$Z_C = \sqrt{\frac{l}{c}} = vl = \frac{1}{vc}, \quad \beta = \frac{\omega}{v} = \omega\sqrt{lc} = \frac{2\pi}{\lambda}$$
*(chap4.pdf, p.74)*

### Voltage Reflection Coefficient

*(chap4.pdf, p.74)*

The voltage reflection coefficient at position $z$:

$$\hat{\Gamma}(z) = \frac{\hat{V}^- e^{j\beta z}}{\hat{V}^+ e^{-j\beta z}} = \frac{\hat{V}^-}{\hat{V}^+}e^{j2\beta z}$$

At the load ($z = \mathscr{L}$):

$$\hat{\Gamma}_L = \frac{\hat{Z}_L - Z_C}{\hat{Z}_L + Z_C}$$
*(chap4.pdf, p.74)*

Reflection coefficient at arbitrary point $z$ in terms of load reflection:

$$\hat{\Gamma}(z) = \hat{\Gamma}_L e^{j2\beta(z - \mathscr{L})}$$
*(chap4.pdf, p.74)*

### Voltage and Current in Terms of $\hat{\Gamma}$

*(chap4.pdf, p.75)*

$$\hat{V}(z) = \hat{V}^+ e^{-j\beta z}\bigl[1 + \hat{\Gamma}(z)\bigr]$$

$$\hat{I}(z) = \frac{\hat{V}^+}{Z_C}e^{-j\beta z}\bigl[1 - \hat{\Gamma}(z)\bigr]$$

### Input Impedance

*(chap4.pdf, p.75–76)*

$$\hat{Z}_\text{in}(z) = \frac{\hat{V}(z)}{\hat{I}(z)} = Z_C \frac{1 + \hat{\Gamma}(z)}{1 - \hat{\Gamma}(z)}$$
*(chap4.pdf, p.75)*

At the source end ($z = 0$), with $\hat{\Gamma}(0) = \hat{\Gamma}_L e^{-j2\beta\mathscr{L}}$:

$$\hat{Z}_\text{in}(0) = Z_C \frac{1 + \hat{\Gamma}_L e^{-j2\beta\mathscr{L}}}{1 - \hat{\Gamma}_L e^{-j2\beta\mathscr{L}}} = Z_C \frac{\hat{Z}_L + jZ_C\tan\beta\mathscr{L}}{Z_C + j\hat{Z}_L\tan\beta\mathscr{L}}$$
*(chap4.pdf, p.76)*

### Voltage Standing-Wave Ratio (VSWR)

*(chap4.pdf, p.77)*

$$\text{VSWR} = \frac{|\hat{V}(z)|_\text{max}}{|\hat{V}(z)|_\text{min}} = \frac{1 + |\hat{\Gamma}_L|}{1 - |\hat{\Gamma}_L|}, \quad 1 \leq \text{VSWR} \leq \infty$$
*(chap4.pdf, p.77)*

- VSWR = 1: matched line ($\Gamma_L = 0$), forward wave only
- VSWR = $\infty$: total reflection ($|\Gamma_L| = 1$, open or short circuit load)

**When matched** ($\hat{Z}_L = Z_C$, $\Gamma_L = 0$):

$$\hat{V}(z) = \frac{Z_C}{Z_C + \hat{Z}_S}\hat{V}_S e^{-j\beta z}, \quad \hat{I}(z) = \frac{1}{Z_C + \hat{Z}_S}\hat{V}_S e^{-j\beta z}$$
*(chap4.pdf, p.77)*

### Power Flow

*(chap4.pdf, p.78)*

Average power flow in the $+z$ direction:

$$P_\text{av}(z) = \frac{1}{2}\mathscr{Re}\{\hat{V}(z)\hat{I}^*(z)\} = \frac{1}{2}\frac{|\hat{V}^+|^2}{Z_C}\left(1 - |\hat{\Gamma}_L|^2\right)$$
*(chap4.pdf, p.78)*

Ratio of reflected to incident power:

$$\frac{P_\text{av, reflected}}{P_\text{av, incident}} = |\hat{\Gamma}_L|^2$$
*(chap4.pdf, p.78)*

---

## 7. Phasor Form of Lossy TX Line

### Lossy Telegrapher's Equations

*(chap4.pdf, p.79–80)*

For a **lossy** TX line, the equivalent circuit adds series resistance $r$ (Ω/m) and shunt conductance $g$ (S/m):

$$\frac{d\hat{V}(z)}{dz} = -\hat{z}\hat{I}(z), \quad \frac{d\hat{I}(z)}{dz} = -\hat{y}\hat{V}(z)$$
*(chap4.pdf, p.80)*

where the per-unit-length impedance and admittance are:

$$\hat{z} = r(f) + j\omega l, \quad \hat{y} = g + j\omega c$$
*(chap4.pdf, p.80)*

Note: $r(f)$ is frequency-dependent due to **skin effect**.

### Solution of Lossy Line

*(chap4.pdf, p.80–81)*

$$\hat{V}(z) = \hat{V}^+ e^{-\alpha z}e^{-j\beta z} + \hat{V}^- e^{\alpha z}e^{j\beta z}$$

$$\hat{I}(z) = \frac{\hat{V}^+}{\hat{Z}_C}e^{-\alpha z}e^{-j\beta z} - \frac{\hat{V}^-}{\hat{Z}_C}e^{\alpha z}e^{j\beta z}$$
*(chap4.pdf, p.80)*

### Propagation Constant and Characteristic Impedance

*(chap4.pdf, p.81)*

**Propagation constant:**

$$\hat{\gamma} = \sqrt{\hat{z}\hat{y}} = \sqrt{(r+j\omega l)(g+j\omega c)} = \alpha + j\beta$$
*(chap4.pdf, p.81)*

- $\alpha$: attenuation constant (Np/m)
- $\beta$: phase constant (rad/m)

**Characteristic impedance:**

$$\hat{Z}_C = \sqrt{\frac{\hat{z}}{\hat{y}}} = \sqrt{\frac{r(f) + j\omega l}{g + j\omega c}}$$
*(chap4.pdf, p.81)*

Forward and backward waves are **attenuated** as they travel along the line.

---

## 8. Effect of Losses on Signal Integrity

### Skin Effect — Circular Wire

*(chap4.pdf, p.82–83)*

**DC resistance per unit length:**

$$r_\text{dc} = \frac{1}{\sigma\pi r_w^2} \;\Omega/\text{m}$$
*(chap4.pdf, p.82)*

As frequency increases, current concentrates in an annulus of thickness equal to the **skin depth**:

$$\delta = \frac{1}{\sqrt{\pi f \mu_0 \sigma}} \text{ m}$$
*(chap4.pdf, p.82)*

Skin depth **decreases** as $\sqrt{f}$.

For $r_w \gg \delta$ (high frequency):

$$r_\text{hf} = \frac{1}{\sigma(\pi r_w^2 - \pi(r_w - \delta)^2)} \approx \frac{1}{\sigma 2\pi r_w \delta} \;\Omega/\text{m}$$
*(chap4.pdf, p.83)*

$r(f)$ **increases as $\sqrt{f}$** (or 10 dB/decade). The transition frequency from $r_\text{dc}$ to $r_\text{hf}$ is determined by setting $r_\text{dc} = r_\text{hf}$.

*Figure (p.83): Graph of $r(\Omega/\text{m})$ vs. $f$ showing flat $r_\text{dc}$ region then rising at 10 dB/decade after $f_\text{break}$.*

### Skin Effect — Rectangular PCB Land

*(chap4.pdf, p.84)*

For a rectangular land of width $w$ and thickness $t$:

**DC resistance:**

$$r_\text{dc} = \frac{1}{\sigma wt} \;\Omega/\text{m}$$
*(chap4.pdf, p.84)*

At high frequency (current in annulus of depth $\delta$):

$$r_\text{hf} = \frac{1}{\sigma(2\delta t + 2\delta w)} = \frac{1}{2\sigma\delta(w+t)} \;\Omega/\text{m}$$
*(chap4.pdf, p.84)*

Transition skin depth: $\delta_\text{break} = \frac{1}{2}\frac{wt}{w+t} \approx \frac{t}{2}$ for $w \gg t$.

Current also peaks at the **corners** of the rectangular land.

### Dielectric Loss

*(chap4.pdf, p.85–87)*

Dielectrics have **bound charge** (microscopic dipoles) but no appreciable free charge. Dielectric loss arises from inability of dipoles to follow time-varying electric fields.

**Complex permittivity:**

$$\epsilon_r = \epsilon_r' - j\epsilon_r''$$
*(chap4.pdf, p.86)*

The per-unit-length admittance becomes:

$$j\omega c = j\omega\epsilon_0\epsilon_r K = \underbrace{\omega\epsilon_0\epsilon_r'' K}_{g} + j\underbrace{\omega\epsilon_0\epsilon_r' K}_{c}$$
*(chap4.pdf, p.86)*

**Loss tangent:**

$$\tan\theta = \frac{\epsilon_r''}{\epsilon_r'} \approx \frac{g}{\omega c} \quad \Rightarrow \quad g = \omega c\tan\theta$$
*(chap4.pdf, p.87)*

For FR-4: $\tan\theta \approx 0.02$.

Dielectric conductance $g$ increases **directly with frequency** (20 dB/decade), unlike skin-effect resistance (10 dB/decade).

Both $\alpha$ and $\beta$ are frequency-dependent → **two kinds of dispersion**.

*Figure (p.94): Graph showing $r(f)$ at 10 dB/decade and $g = \omega c\tan\theta$ at 20 dB/decade.*

### Signal Distortion Due to Losses

*(chap4.pdf, p.88)*

- **Phase dispersion** ($\beta$ frequency-dependent): sinusoidal components travel at different speeds → arrive at different times → pulse distortion
- **Attenuation dispersion** ($\alpha$ frequency-dependent): components attenuated by different amounts → pulse shape distortion
- **General effect**: high-frequency components attenuated more → pulse bandwidth reduced → rise/fall times increased

### Low-Loss Approximation

*(chap4.pdf, p.89–91)*

Condition for low-loss:

$$r \ll \omega l, \quad g \ll \omega c$$
*(chap4.pdf, p.90)*

Simplified propagation constant:

$$\hat{\gamma} \approx j\omega\sqrt{lc}\left[1 - j\left(\frac{r}{2\omega l} + \frac{g}{2\omega c}\right)\right]$$
*(chap4.pdf, p.90)*

**Attenuation constant (low-loss):**

$$\alpha \approx \frac{1}{2}\left(\frac{r}{Z_C} + gZ_C\right)$$
*(chap4.pdf, p.91)*

- Constant at low frequency (dominated by $r_\text{dc}$)

**Phase constant (low-loss):**

$$\beta \approx \omega\sqrt{lc}$$
*(chap4.pdf, p.91)*

- Linear function of frequency → no phase dispersion in low-loss regime

**Characteristic impedance (low-loss):**

$$Z_C \approx \sqrt{\frac{l}{c}} \quad (\text{independent of frequency})$$
*(chap4.pdf, p.91)*

### Cable Loss Formula

*(chap4.pdf, p.89)*

For a matched load, power is attenuated as $e^{-2\alpha\mathscr{L}}$, giving:

$$\text{Loss}_\text{dB} = 8.686\alpha\mathscr{L} \text{ dB}$$
*(chap4.pdf, p.89)*

### Typical PCB Board Example

*(chap4.pdf, p.92–94)*

For typical board dimensions:
- Low-loss region (both $r \ll \omega l$ and $g \ll \omega c$): above ~**5 MHz**
- Region with no $\alpha$ or $\beta$ dispersion: 5–20 MHz
- Above 20 MHz: no $\beta$ dispersion, but $\alpha$ dispersion present (skin effect)

*Figures (p.92–93): Characteristic impedance magnitude decreases from 100s Ω below 5 MHz to ~50 Ω above 5 MHz. Attenuation constant shows transition at 5 MHz and 20 MHz. Velocity of propagation rises and stabilizes above 5 MHz.*

---

## 9. Lumped-Circuit Approximate Models

### When to Use Lumped Models

*(chap4.pdf, p.95)*

Use lumped-circuit models when the line is **electrically short** at the highest significant frequency:

$$\mathscr{L} < \frac{\lambda}{10} \text{ at } f_\text{max}$$
*(chap4.pdf, p.95)*

### Lumped-$\pi$ and Lumped-T Models

*(chap4.pdf, p.95)*

Two standard approximations for a transmission line of length $\mathscr{L}$:

**Lumped-$\pi$ model:** Series $r\mathscr{L}$, $l\mathscr{L}$ in center; shunt $g\mathscr{L}/2$, $c\mathscr{L}/2$ on each side.

**Lumped-T model:** Series $r\mathscr{L}/2$, $l\mathscr{L}/2$ on each end; shunt $g\mathscr{L}$, $c\mathscr{L}$ in center.

*Figure (p.95): Circuit diagrams of lumped-$\pi$ and lumped-T models.*

**Note:** Difficult to use in time-domain since losses are not easily handled.

### Example 4.12: Number of Subsections Required

*(chap4.pdf, p.96–97)*

For a 1 m lossless line ($Z_C = 50\,\Omega$, $v = 2\times 10^8$ m/s):

- **1-section lumped-$\pi$**: valid up to **10 MHz** (line is $\lambda/10$ at 10 MHz)
- **2-section lumped-$\pi$**: valid up to **20 MHz** (each section is $\lambda/10$ at 20 MHz)

Each additional section doubles the useful frequency range. Each section should be $\leq \lambda/10$.

---

## Summary Tables

### Key Equations Summary

| Quantity | Formula | Location |
|----------|---------|----------|
| Time delay | $T_D = \mathscr{L}/v$ | p.3 |
| Telegrapher's eq. (KVL) | $\partial V/\partial z = -l\,\partial I/\partial t$ | p.8 |
| Telegrapher's eq. (KCL) | $\partial I/\partial z = -c\,\partial V/\partial t$ | p.9 |
| Wave equation (voltage) | $\partial^2 V/\partial z^2 = lc\,\partial^2 V/\partial t^2$ | p.10 |
| $lc = \mu\epsilon$ relation | $v = 1/\sqrt{lc} = v_0/\sqrt{\epsilon_r}$ | p.12 |
| Characteristic impedance | $Z_C = \sqrt{l/c}$ | p.28, 34 |
| Load reflection coeff. | $\Gamma_L = (R_L - Z_C)/(R_L + Z_C)$ | p.35 |
| Source reflection coeff. | $\Gamma_S = (R_S - Z_C)/(R_S + Z_C)$ | p.37 |
| Initial launched voltage | $V(0,t) = \frac{Z_C}{R_S+Z_C}V_S(t)$ | p.37 |
| Series match condition | $R_S + R = Z_C$ | p.54 |
| Parallel match condition | $R \| R_L = Z_C$ | p.55 |
| TL negligible criterion | $\tau_r > 10T_D$ | p.59 |
| Phase constant | $\beta = \omega/v = \omega\sqrt{lc}$ | p.74 |
| VSWR | $(1+|\Gamma_L|)/(1-|\Gamma_L|)$ | p.77 |
| Input impedance | $Z_\text{in} = Z_C(Z_L + jZ_C\tan\beta\mathscr{L})/(Z_C + jZ_L\tan\beta\mathscr{L})$ | p.76 |
| Propagation constant | $\hat{\gamma} = \sqrt{(r+j\omega l)(g+j\omega c)} = \alpha+j\beta$ | p.81 |
| Skin depth | $\delta = 1/\sqrt{\pi f\mu_0\sigma}$ | p.82 |
| Cable loss | $8.686\alpha\mathscr{L}$ dB | p.89 |
| Low-loss criterion | $r \ll \omega l$, $g \ll \omega c$ | p.90 |
| Loss tangent | $\tan\theta = \epsilon_r''/\epsilon_r'$, $g = \omega c\tan\theta$ | p.87 |

### Per-Unit-Length Parameter Summary

| Structure | $l$ (H/m) | $c$ (F/m) |
|-----------|----------|----------|
| Two-wire ($s \gg r_w$) | $\frac{\mu_0}{\pi}\ln(s/r_w)$ | $\frac{\pi\epsilon_0}{\ln(s/r_w)}$ |
| Wire above ground ($h \gg r_w$) | $\frac{\mu_0}{2\pi}\ln(2h/r_w)$ | $\frac{2\pi\epsilon_0}{\ln(2h/r_w)}$ |
| Coaxial cable | $\frac{\mu_0}{2\pi}\ln(r_s/r_w)$ | $\frac{2\pi\epsilon}{\ln(r_s/r_w)}$ |

### Special Load Reflection Coefficients

| Load | $\Gamma_L$ | Behavior |
|------|-----------|----------|
| Matched ($Z_L = Z_C$) | 0 | No reflection |
| Open circuit ($Z_L = \infty$) | +1 | Full reflection, same polarity |
| Short circuit ($Z_L = 0$) | −1 | Full reflection, reversed polarity |
| Inductive ($Z_L = j\omega L$) | $+1$ at $t=0^+$, $0$ at $t\to\infty$ (for matched source) | Initially open, then matched |
| Capacitive ($Z_L = 1/j\omega C$) | $-1$ at $t=0^+$, $+1$ at $t\to\infty$ (for matched source) | Initially short, then open |
