# Chapter 4: Transmission Lines and Signal Integrity

## 4.1 Preview: Why Transmission Lines Matter *(chap4.pdf, p.3)*

At high speeds, an interconnect is no longer a simple wire --- it behaves as a transmission line because:

1. **Time delay:** a signal takes a finite, nonzero time $T_D = L/v$ to travel from one end to the other.
2. **Reflections:** any impedance mismatch causes reflected waves that distort the signal --- the dominant mechanism of **signal integrity** degradation. *(chap4.pdf, p.3)*

**Signal integrity** means the waveforms at input and output of the line are identical (or approximately so). *(chap4.pdf, p.3)*

### Types of Transmission Lines *(chap4.pdf, pp.4--5)*

| Structure | Dispersive? | Notes |
|-----------|-------------|-------|
| Two-wire | Yes | Outer insulator causes dispersion |
| Wire above ground | Yes | Outer insulator causes dispersion |
| Coaxial cable | No | Fields entirely inside; no dispersion |
| Stripline (PCB inner layer) | No | Fields entirely inside dielectric |
| Microstrip (PCB outer layer) | Yes | Partial air, partial dielectric |
| Coplanar strip (no inner planes) | Yes | Partial air, partial dielectric |

*(chap4.pdf, pp.4--5)*

---

## 4.2 Transmission-Line Equations (Lossless)

### Distributed Model *(chap4.pdf, p.6)*

The lossless line is modeled as an infinite cascade of inductors ($l\,\Delta z$ H) in series and capacitors ($c\,\Delta z$ F) in shunt, where $l$ and $c$ are the **per-unit-length** inductance [H/m] and capacitance [F/m].

Physical meaning *(chap4.pdf, p.7)*:
- $l$ and $c$ cause a finite transit time: $T_D = L/v$
- At GHz frequencies, conductor resistance $r$ (due to skin effect) can become significant

### First-Order Coupled Equations *(chap4.pdf, pp.8--9)*

Applying KVL around a $\Delta z$ section:

$$-\frac{\partial V}{\partial z} = l\,\frac{\partial I}{\partial t}$$
*(chap4.pdf, p.8)* <!-- VERIFY: standard result; image not rendered -->

Applying KCL at the shunt capacitor node:

$$-\frac{\partial I}{\partial z} = c\,\frac{\partial V}{\partial t}$$
*(chap4.pdf, p.9)* <!-- VERIFY -->

These are the **coupled transmission-line equations** (first-order form). *(chap4.pdf, p.9)*

### Second-Order Wave Equations *(chap4.pdf, p.10)*

Decoupling the two equations above:

$$\frac{\partial^2 V}{\partial z^2} = lc\,\frac{\partial^2 V}{\partial t^2}$$
*(chap4.pdf, p.10)* <!-- VERIFY -->

$$\frac{\partial^2 I}{\partial z^2} = lc\,\frac{\partial^2 I}{\partial t^2}$$
*(chap4.pdf, p.10)* <!-- VERIFY -->

These are called the **uncoupled transmission-line equations** (second-order form). *(chap4.pdf, p.10)*

---

## 4.3 Per-Unit-Length Parameters

### TEM Mode Properties *(chap4.pdf, pp.11--12)*

Transmission lines support the **Transverse Electromagnetic (TEM) mode**: $H_z = 0$ and $E_z = 0$. This allows static (dc) field solutions to be used for $l$ and $c$ even for time-varying excitations. *(chap4.pdf, p.11)*

Faraday's law ($H_z = 0$):

$$\nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t}$$
*(chap4.pdf, p.11)*

Ampere's law ($E_z = 0$):

$$\nabla \times \mathbf{H} = \mathbf{J} + \frac{\partial \mathbf{D}}{\partial t}$$
*(chap4.pdf, p.11)*

For a **homogeneous** medium surrounding the conductors, $l$ and $c$ satisfy: *(chap4.pdf, p.12)*

$$lc = \mu\varepsilon = \mu_0\varepsilon_0\mu_r\varepsilon_r$$
*(chap4.pdf, p.12)* <!-- VERIFY -->

from which the phase velocity:

$$v = \frac{1}{\sqrt{lc}} = \frac{1}{\sqrt{\mu\varepsilon}} = \frac{v_0}{\sqrt{\mu_r\varepsilon_r}}$$
*(chap4.pdf, p.12)* <!-- VERIFY -->

### Effective Relative Permittivity *(chap4.pdf, p.13)*

For **inhomogeneous** media (e.g., microstrip with partial air and partial dielectric), an effective permittivity $\varepsilon_r'$ is defined such that an equivalent homogeneous medium would give the same $l$ and $c$:

$$lc = \mu_0\varepsilon_0\varepsilon_r'$$
*(chap4.pdf, p.13)* <!-- VERIFY -->

This gives $v = v_0/\sqrt{\varepsilon_r'}$ and $Z_C = \sqrt{l/c} = (1/v)\sqrt{1/\varepsilon_0\mu_0}\cdot 1/\sqrt{\varepsilon_r'/\mu_r}$. <!-- VERIFY -->

---

### Wire-Type Structures

#### Magnetic Field around a Current-Carrying Wire *(chap4.pdf, p.14)*

By Ampere's law (current uniformly distributed, cylindrical symmetry):

$$H_\phi = \frac{I}{2\pi r}$$
*(chap4.pdf, p.14)* <!-- VERIFY -->

#### Magnetic Flux through a Surface *(chap4.pdf, p.15)*

Per unit length of line, the flux threading between two radii $r_1$ and $r_2$:

$$\Psi = \frac{\mu_0 I}{2\pi}\ln\!\left(\frac{r_2}{r_1}\right)$$
*(chap4.pdf, p.15)* <!-- VERIFY -->

Used to find $l$ via $\Psi = l\,I$. *(chap4.pdf, p.15)*

#### Electric Field around a Charged Wire *(chap4.pdf, p.16)*

By Gauss' law (charge $q$ per unit length, cylindrical symmetry):

$$E_r = \frac{q}{2\pi\varepsilon r}$$
*(chap4.pdf, p.16)* <!-- VERIFY -->

#### Voltage between Two Points *(chap4.pdf, p.17)*

$$V = \frac{q}{2\pi\varepsilon}\ln\!\left(\frac{r_2}{r_1}\right)$$
*(chap4.pdf, p.17)* <!-- VERIFY -->

Used to find $c$ via $q = c\,V$. *(chap4.pdf, p.17)*

---

#### Two-Wire Line *(chap4.pdf, pp.18--22)*

To avoid the proximity effect, assume widely separated wires (wire radius $a$, separation $d$, with $a \ll d$).

Total magnetic flux between the two wires per unit length:

$$\Psi \approx \frac{\mu_0 I}{\pi}\ln\!\left(\frac{d}{a}\right)$$
*(chap4.pdf, p.18)* <!-- VERIFY -->

**Approximate** per-unit-length inductance (valid for $d \gg a$):

$$l \approx \frac{\mu_0}{\pi}\ln\!\left(\frac{d}{a}\right) \quad \text{[H/m]}$$
*(chap4.pdf, p.19)* <!-- VERIFY -->

**Exact** per-unit-length inductance:

$$l = \frac{\mu_0}{\pi}\cosh^{-1}\!\left(\frac{d}{2a}\right) \quad \text{[H/m]}$$
*(chap4.pdf, p.20)* <!-- VERIFY -->

**Exact** per-unit-length capacitance:

$$c = \frac{\pi\varepsilon_0}{\cosh^{-1}(d/2a)} \quad \text{[F/m]}$$
*(chap4.pdf, p.20)* <!-- VERIFY -->

Voltage between the two wires (sum of contributions from each wire):

$$V = \frac{q}{\pi\varepsilon}\ln\!\left(\frac{d}{a}\right)$$
*(chap4.pdf, p.21)* <!-- VERIFY -->

**Approximate** per-unit-length capacitance (same result as simplifying the exact formula):

$$c \approx \frac{\pi\varepsilon_0}{\ln(d/a)} \quad \text{[F/m]}$$
*(chap4.pdf, p.22)* <!-- VERIFY -->

---

#### Wire above a Ground Plane *(chap4.pdf, pp.23--24)*

Using the **method of images**: the ground plane is replaced by an image wire at distance $2h$ below the original. The capacitance between the wire and ground plane equals **twice** the capacitance of two wires with separation $2h$: *(chap4.pdf, p.23)*

**Exact** per-unit-length capacitance (wire height $h$ above ground, wire radius $a$):

$$c = \frac{2\pi\varepsilon_0}{\cosh^{-1}(h/a)} \quad \text{[F/m]}$$
*(chap4.pdf, p.24)* <!-- VERIFY -->

**Exact** per-unit-length inductance (half of two-wire result, by reciprocity):

$$l = \frac{\mu_0}{2\pi}\cosh^{-1}\!\left(\frac{h}{a}\right) \quad \text{[H/m]}$$
*(chap4.pdf, p.24)* <!-- VERIFY -->

---

#### Coaxial Cable *(chap4.pdf, pp.25--27)*

No proximity effect due to symmetry (inner radius $a$, outer radius $b$).

From Ampere's law:

$$H_\phi = \frac{I}{2\pi r}, \quad a \leq r \leq b$$
*(chap4.pdf, p.25)* <!-- VERIFY -->

Flux per unit length:

$$\Psi = \frac{\mu_0 I}{2\pi}\ln\!\left(\frac{b}{a}\right)$$
*(chap4.pdf, p.25)* <!-- VERIFY -->

**Exact** per-unit-length inductance:

$$l = \frac{\mu_0}{2\pi}\ln\!\left(\frac{b}{a}\right) \quad \text{[H/m]}$$
*(chap4.pdf, p.26)* <!-- VERIFY -->

**Exact** per-unit-length capacitance (using $lc = \mu_0\varepsilon_0\varepsilon_r$):

$$c = \frac{2\pi\varepsilon_0\varepsilon_r}{\ln(b/a)} \quad \text{[F/m]}$$
*(chap4.pdf, p.26)* <!-- VERIFY -->

Alternatively, voltage between inner and outer conductors:

$$V = \frac{q}{2\pi\varepsilon}\ln\!\left(\frac{b}{a}\right)$$
*(chap4.pdf, p.27)* <!-- VERIFY -->

giving the same $c = 2\pi\varepsilon/\ln(b/a)$. *(chap4.pdf, p.27)*

---

### PCB Structures *(chap4.pdf, pp.28--32)*

In PCB work, the key parameters are the **characteristic impedance** and **velocity**: *(chap4.pdf, p.28)*

$$Z_C = \sqrt{\frac{l}{c}}, \qquad v = \frac{1}{\sqrt{lc}} = \frac{v_0}{\sqrt{\varepsilon_r'}}$$
*(chap4.pdf, p.28)* <!-- VERIFY -->

PCB geometries do not have closed-form exact solutions; approximate formulas are used.

#### Stripline ($t = 0$) *(chap4.pdf, p.29)*

The inner strip is fully embedded in a uniform dielectric ($\varepsilon_r' = \varepsilon_r$):

$$Z_C = \frac{60}{\sqrt{\varepsilon_r}}\ln\!\left(\frac{4b}{\pi d}\right) \quad [\Omega]$$
*(chap4.pdf, p.29)* <!-- VERIFY: standard stripline approximation; verify exact form in slides -->

where $b$ = board thickness between ground planes, $d$ = strip width.

#### Microstrip ($t = 0$) *(chap4.pdf, p.30)*

The outer strip is on the surface with air above and dielectric below:

$$Z_C = \frac{120\pi}{\sqrt{\varepsilon_r'}\left(W/h + 1.393 + 0.667\ln(W/h + 1.444)\right)} \quad [\Omega]$$
*(chap4.pdf, p.30)* <!-- VERIFY: this is the standard Hammerstad approximation; verify against actual slides -->

Effective relative permittivity:

$$\varepsilon_r' = \frac{\varepsilon_r+1}{2} + \frac{\varepsilon_r-1}{2}\left(1 + \frac{12h}{W}\right)^{-1/2}$$
*(chap4.pdf, p.30)* <!-- VERIFY -->

where $W$ = strip width, $h$ = substrate height.

#### Coplanar Strip ($t = 0$) *(chap4.pdf, p.31)*

$$Z_C \approx \frac{120\pi}{\sqrt{\varepsilon_r'}}\cdot\frac{K(k')}{K(k)}$$
*(chap4.pdf, p.31)* <!-- VERIFY: based on conformal mapping; verify form in slides -->

Effective permittivity:

$$\varepsilon_r' = 1 + \frac{\varepsilon_r - 1}{2}\cdot\frac{K(k')K(k_1)}{K(k)K(k_1')}$$
*(chap4.pdf, p.31)* <!-- VERIFY -->

#### Strips on Opposite Sides of the Board ($t = 0$) *(chap4.pdf, p.32)*

Wide lands on opposite sides give **lower characteristic impedance** than same-side placement, because the facing area creates more capacitance. This is exploited for power planes, which need low impedance ($V = L\,di/dt$, so low $L$ minimizes noise). *(chap4.pdf, p.32)*

---

## 4.4 Time-Domain Solution

### General Solution for the Lossless Line *(chap4.pdf, p.34)*

The general solution consists of forward- ($+z$) and backward-($-z$) traveling waves:

$$V(z, t) = V^+(t - z/v) + V^-(t + z/v)$$
*(chap4.pdf, p.34)* <!-- VERIFY -->

$$I(z, t) = \frac{V^+(t - z/v) - V^-(t + z/v)}{Z_C}$$
*(chap4.pdf, p.34)* <!-- VERIFY -->

where:

$$Z_C = \sqrt{\frac{l}{c}}, \qquad v = \frac{1}{\sqrt{lc}}$$
*(chap4.pdf, p.34)* <!-- VERIFY -->

### Reflection Coefficients *(chap4.pdf, pp.35--37)*

**Load reflection coefficient** (at $z = L$):

$$\Gamma_L = \frac{Z_L - Z_C}{Z_L + Z_C}$$
*(chap4.pdf, p.35)* <!-- VERIFY -->

**Source reflection coefficient** (at $z = 0$):

$$\Gamma_S = \frac{Z_S - Z_C}{Z_S + Z_C}$$
*(chap4.pdf, p.36)* <!-- VERIFY -->

The **current reflection coefficient is the negative** of the voltage reflection coefficient. *(chap4.pdf, p.35)*

**Initial forward-traveling voltage** launched from the source at $t = 0$:

$$V^+_{\text{init}} = V_S\,\frac{Z_C}{Z_S + Z_C}$$
*(chap4.pdf, p.37)* <!-- VERIFY -->

where $V_S$ is the source open-circuit voltage. The process of repeated reflections continues: a wave reflecting at the load re-reflects at the source, and so on. *(chap4.pdf, p.37)*

### Bounce (Lattice) Diagram *(chap4.pdf, pp.42--43)*

The lattice diagram is a graphical tool with:
- Horizontal axis: position $z$ (0 to $L$)
- Vertical axis: time $t$

Each line segment represents a traveling wave. The total voltage or current at any $(z, t)$ is the superposition of all waves that have reached that point. *(chap4.pdf, p.42)*

When the line is matched at both ends ($\Gamma_S = \Gamma_L = 0$), all reflections vanish and only a time delay $T_D = L/v$ is imposed --- the line "doesn't matter." *(chap4.pdf, p.43)*

---

## 4.5 High-Speed Digital Interconnects and Signal Integrity

### Clock Skew *(chap4.pdf, p.44)*

Unequal time delays for signals reaching different logic gates cause **clock skew**. At high speeds, these delays are on the order of rise/fall times and become critical in the system timing budget.

### Impedance Mismatch Effects *(chap4.pdf, pp.45--46)*

Any change in line cross-section (and thus $Z_C$) causes reflections. Common sources:
- Different trace widths
- Vias (signal transitions between PCB layers)
- Connector transitions

Result: ringing --- the load voltage oscillates around the final value, potentially causing false logic transitions. *(chap4.pdf, p.46)*

Typical CMOS gate parameters: output resistance 10--30 $\Omega$, input capacitance 5--15 pF. *(chap4.pdf, p.46)*

### Load Voltage with Mismatch *(chap4.pdf, p.48)*

For a line connecting two gates ($Z_S \neq Z_C$, $Z_L \neq Z_C$):

$$V_L(t) = V^+_{\text{init}}\,(1 + \Gamma_L) \sum_{k=0}^{n} (\Gamma_S\Gamma_L)^k \cdot u(t - (2k+1)T_D)$$
*(chap4.pdf, p.48)* <!-- VERIFY: represents superposition of successive re-reflections -->

The sign of the reflection coefficients determines whether the signal overshoots or undershoots:
- Positive $\Gamma_L$: may cause **multiple activations** of the gate *(chap4.pdf, p.49)*
- Negative $\Gamma_L$: may **postpone activation** *(chap4.pdf, p.49)*

---

### Capacitive Termination *(chap4.pdf, pp.50--52)*

For a source-matched line ($Z_S = Z_C$) terminated with a capacitor $C_L$:

The load voltage in the Laplace domain:

$$\hat{V}_L(s) = \frac{V_0}{s}\,\frac{1}{1 + sZ_C C_L}$$
*(chap4.pdf, p.51)* <!-- VERIFY -->

Inverse transform (time domain):

$$V_L(t) = V_0\left(1 - e^{-t/\tau_C}\right)u(t - T_D)$$
*(chap4.pdf, p.52)* <!-- VERIFY -->

with time constant:

$$\tau_C = Z_C\,C_L$$
*(chap4.pdf, p.50)* <!-- VERIFY -->

Behavior: initially the capacitor looks like a **short circuit**, gradually transitioning to an **open circuit**. The capacitive load introduces additional time delay (measured at the 50% point) $t_d = 0.693\,\tau_C$. *(chap4.pdf, p.52)*

This is also the basis of **Time Domain Reflectometry (TDR)**: by observing the reflected waveform, one can characterize the load. *(chap4.pdf, p.50)*

---

### Inductive Termination *(chap4.pdf, p.53)*

For a source-matched line terminated with an inductance $L_L$, the time constant is:

$$\tau_L = \frac{L_L}{Z_C}$$
*(chap4.pdf, p.53)* <!-- VERIFY -->

Behavior: initially the inductor looks like an **open circuit**, gradually transitioning to a **short circuit**. *(chap4.pdf, p.53)*

---

### Matching Schemes *(chap4.pdf, pp.54--63)*

#### Series Match *(chap4.pdf, p.54)*

A resistor $R$ is inserted in series at the source such that:

$$R_S + R = Z_C$$
*(chap4.pdf, p.54)* <!-- VERIFY -->

Results:
1. Load voltage equals source level (full signal swing) *(chap4.pdf, p.54)*
2. The resistor dissipates **no power** in steady state (no dc current through the line) *(chap4.pdf, p.54)*

With a capacitive load, the total delay at the 50% point consists of: *(chap4.pdf, p.57)*
1. Source rise time / 2
2. One-way line delay $T_D$
3. Capacitive load delay $0.693\,Z_C C_L$

#### Parallel Match *(chap4.pdf, pp.55--58)*

A resistor $R$ in parallel with the load such that $R \parallel Z_L = Z_C$ (approximately, $R = Z_C$ for high-impedance load). *(chap4.pdf, p.55)*

Results:
1. Load voltage is **less than** source level *(chap4.pdf, p.55)*
2. Resistor **consumes power** even in steady state *(chap4.pdf, p.55)*

With a capacitive load: the parallel match fails at high frequencies because the capacitor dominates and acts as a short circuit. Logic errors may result. *(chap4.pdf, p.58)*

---

### When Does the Line Not Matter? *(chap4.pdf, pp.59--63)*

#### Criterion 1: Electrical Length *(chap4.pdf, p.59)*

$$L < \frac{\lambda}{10} \quad \text{at the highest significant frequency}$$
*(chap4.pdf, p.59)* <!-- VERIFY -->

#### Criterion 2: Rise Time vs. Time Delay *(chap4.pdf, p.59)*

$$\tau_r > 10\,T_D$$
*(chap4.pdf, p.59)*

If the pulse rise time is greater than 10 times the one-way line delay, line effects do not significantly degrade the output waveform. *(chap4.pdf, p.59)*

Simulation results *(chap4.pdf, pp.60--63)*:
| $\tau_r / T_D$ | Overshoot |
|----------------|-----------|
| 1 | 7 V (for 5 V supply) |
| 5 | 6 V |
| 10 | 5.3 V |
| 20 | 5.2 V |

As $\tau_r$ increases: maximum frequency decreases ($f_{max} \propto 1/\tau_r$), high-frequency content is reduced, and ringing diminishes. *(chap4.pdf, p.63)*

---

### Discontinuities *(chap4.pdf, pp.64--72)*

#### Different Characteristic Impedances *(chap4.pdf, pp.64--65)*

At a junction between line 1 ($Z_{C1}$) and line 2 ($Z_{C2}$):

**Reflection coefficient** (incident from left):

$$\Gamma_{12} = \frac{Z_{C2} - Z_{C1}}{Z_{C2} + Z_{C1}}$$
*(chap4.pdf, p.64)* <!-- VERIFY -->

**Transmission coefficient** (voltage transmitted into line 2):

$$T_{12} = 1 + \Gamma_{12} = \frac{2Z_{C2}}{Z_{C1} + Z_{C2}}$$
*(chap4.pdf, p.65)* <!-- VERIFY -->

Similarly from right to left:

$$\Gamma_{21} = \frac{Z_{C1} - Z_{C2}}{Z_{C1} + Z_{C2}} = -\Gamma_{12}, \qquad T_{21} = 1 + \Gamma_{21}$$
*(chap4.pdf, p.65)* <!-- VERIFY -->

#### Eliminating Reflections at Discontinuities *(chap4.pdf, pp.66--67)*

- **Series match at source only:** does not eliminate reflections at an internal junction. *(chap4.pdf, p.66)*
- **Parallel match at load only:** does not eliminate reflections either. *(chap4.pdf, p.67)*
- **Series match at source + parallel match at load:** eliminates all reflections. *(chap4.pdf, p.67)*

#### Series Multiple Feedlines (Fan-Out) *(chap4.pdf, pp.68--69)*

A series match at the source ($R_S + R = Z_C$) eliminates all reflections if the feedline characteristic impedances are equal. *(chap4.pdf, p.68)*

A parallel match at a midpoint junction does **not** eliminate reflections --- it creates a new impedance mismatch: *(chap4.pdf, p.69)*

$$Z_{\text{junction}} = Z_{C2} \parallel Z_{C3} \neq Z_{C1}$$
*(chap4.pdf, p.69)* <!-- VERIFY -->

#### Parallel Multiple Feedlines *(chap4.pdf, pp.70--72)*

Initial forward voltage for two parallel lines from one source:

$$V^+_{\text{init}} = V_S\,\frac{Z_{C1} \parallel Z_{C2}}{Z_S + Z_{C1} \parallel Z_{C2}}$$
*(chap4.pdf, p.70)* <!-- VERIFY -->

Reflection and transmission at the parallel junction *(chap4.pdf, p.71)*: <!-- VERIFY actual formulas -->

When $T_{D1} = T_{D2}$ and $R_S = Z_C/2$: the reflected waves from the two lines cancel each other ($\Gamma_{12} = -T_{12} = -T_{21}$). *(chap4.pdf, p.71)*

Best matching scheme for parallel lines: **parallel match at each load** (place $Z_C$ across each load). This is less power-efficient than series match. *(chap4.pdf, p.72)*

---

## 4.6 Sinusoidal (Phasor) Analysis of the Line

### Lossless Line --- Phasor Form *(chap4.pdf, pp.73--78)*

From the time-domain solution, substituting sinusoidal steady-state $e^{j\omega t}$:

$$\hat{V}(z) = V^+\,e^{-j\beta z} + V^-\,e^{+j\beta z}$$
*(chap4.pdf, p.73)* <!-- VERIFY -->

$$\hat{I}(z) = \frac{V^+\,e^{-j\beta z} - V^-\,e^{+j\beta z}}{Z_C}$$
*(chap4.pdf, p.73)* <!-- VERIFY -->

where:

$$Z_C = \sqrt{\frac{l}{c}}, \qquad \beta = \omega\sqrt{lc}$$
*(chap4.pdf, p.74)* <!-- VERIFY -->

**Voltage reflection coefficient** at position $z$:

$$\Gamma(z) = \frac{V^-}{V^+}\,e^{+2j\beta z}$$
*(chap4.pdf, p.74)* <!-- VERIFY -->

At $z = L$ (load): $\Gamma_L = (Z_L - Z_C)/(Z_L + Z_C)$.

**Input impedance** at distance $d$ from the load:

$$Z_{in}(-d) = Z_C\,\frac{Z_L + jZ_C\tan(\beta d)}{Z_C + jZ_L\tan(\beta d)}$$
*(chap4.pdf, p.75)* <!-- VERIFY -->

Or equivalently in terms of $\Gamma$:

$$Z_{in}(z) = Z_C\,\frac{1 + \Gamma(z)}{1 - \Gamma(z)}$$
*(chap4.pdf, p.75)* <!-- VERIFY -->

**VSWR** (voltage standing-wave ratio) --- a measure of reflection:

$$S = \frac{1 + |\Gamma_L|}{1 - |\Gamma_L|}$$
*(chap4.pdf, p.77)* <!-- VERIFY -->

When matched ($\Gamma_L = 0$): $S = 1$ (no reflections). *(chap4.pdf, p.77)*

**Average power** flowing in the $+z$ direction:

$$P_{av} = \frac{|V^+|^2}{2Z_C}\left(1 - |\Gamma_L|^2\right)$$
*(chap4.pdf, p.78)* <!-- VERIFY -->

This equals the power of the forward wave minus the power of the backward wave. *(chap4.pdf, p.78)*

---

### Lossy Line --- Phasor Form *(chap4.pdf, pp.79--81)*

Equivalent circuit adds series resistance $r$ [$\Omega$/m] and shunt conductance $g$ [S/m]:

**Per-unit-length impedance and admittance:**

$$z = r + j\omega l, \qquad y = g + j\omega c$$
*(chap4.pdf, p.80)* <!-- VERIFY -->

The decoupled wave equation:

$$\frac{d^2\hat{V}}{dz^2} = \gamma^2\,\hat{V}, \qquad \gamma = \sqrt{zy} = \alpha + j\beta$$
*(chap4.pdf, p.80)* <!-- VERIFY -->

Solution:

$$\hat{V}(z) = V^+\,e^{-\gamma z} + V^-\,e^{+\gamma z}$$
*(chap4.pdf, p.81)* <!-- VERIFY -->

**Characteristic impedance** of lossy line:

$$Z_C = \sqrt{\frac{z}{y}} = \sqrt{\frac{r + j\omega l}{g + j\omega c}}$$
*(chap4.pdf, p.81)* <!-- VERIFY -->

Both forward and backward traveling waves are **attenuated** exponentially as they travel. *(chap4.pdf, p.81)*

Note: $r(f)$ is frequency-dependent due to skin effect. *(chap4.pdf, p.80)*

---

## 4.7 Effect of Losses on Signal Integrity

### Conductor Losses --- Circular Wire *(chap4.pdf, pp.82--83)*

**DC resistance** per unit length (current uniformly distributed over cross-section):

$$r_{dc} = \frac{1}{\sigma\,\pi r_w^2} \quad [\Omega/\text{m}]$$
*(chap4.pdf, p.82)* <!-- VERIFY -->

**Skin depth** (current confined to outer annulus at high frequency):

$$\delta = \frac{1}{\sqrt{\pi f\,\mu\,\sigma}} \quad [\text{m}]$$
*(chap4.pdf, p.82)*

Skin depth **decreases** with the square root of frequency. *(chap4.pdf, p.82)*

**High-frequency resistance** per unit length (for $r_w \gg \delta$):

$$r_{hf} = \frac{1}{2\pi r_w\,\sigma\,\delta} = \frac{1}{2\pi r_w}\sqrt{\frac{\pi f\,\mu}{\sigma}} \quad [\Omega/\text{m}]$$
*(chap4.pdf, p.83)* <!-- VERIFY -->

$r_{hf}$ **increases** with $\sqrt{f}$ (10 dB/decade). *(chap4.pdf, p.83)*

### Conductor Losses --- Rectangular PCB Land *(chap4.pdf, p.84)*

**DC resistance** per unit length (width $w$, thickness $t$):

$$r_{dc} = \frac{1}{\sigma\,w\,t} \quad [\Omega/\text{m}]$$
*(chap4.pdf, p.84)* <!-- VERIFY -->

**High-frequency resistance** per unit length (current concentrated on the wide faces):

$$r_{hf} = \frac{1}{2\,\sigma\,w\,\delta} \quad [\Omega/\text{m}]$$
*(chap4.pdf, p.84)* <!-- VERIFY -->

The turning frequency between $r_{dc}$ and $r_{hf}$ is obtained by setting $r_{dc} = r_{hf}$. In practice, current actually peaks at corners. *(chap4.pdf, p.84)*

### Dielectric Losses *(chap4.pdf, pp.85--87)*

Dielectrics have bound charge (dipoles) but no appreciable free charge. Dielectric loss arises because dipoles cannot completely follow the time-varying electric field. *(chap4.pdf, p.85)*

**Complex permittivity:**

$$\varepsilon = \varepsilon' - j\varepsilon''$$
*(chap4.pdf, p.86)* <!-- VERIFY -->

The capacitive per-unit-length admittance with complex $\varepsilon$:

$$y_c = j\omega\,c\,\frac{\varepsilon' - j\varepsilon''}{\varepsilon'} = \omega c\,\frac{\varepsilon''}{\varepsilon'} + j\omega c$$
*(chap4.pdf, p.86)* <!-- VERIFY -->

Real part $\to$ per-unit-length **conductance**: $g = \omega c \tan\theta$. *(chap4.pdf, p.87)*

**Loss tangent:**

$$\tan\theta = \frac{\varepsilon''}{\varepsilon'}$$
*(chap4.pdf, p.87)* <!-- VERIFY -->

Key: $g = \omega c \tan\theta$ $\to$ **conductance increases directly with frequency** (20 dB/decade), unlike skin-effect resistance (10 dB/decade). *(chap4.pdf, p.87)*

For FR-4 PCB material: $\tan\theta \approx 0.02$. *(chap4.pdf, p.94)*

### Dispersion Effects *(chap4.pdf, pp.88--89)*

Two types of pulse distortion from line losses:
- **Due to $\alpha(f)$ dispersion:** different frequency components are attenuated by different amounts $\to$ shape distortion.
- **Due to $\beta(f)$ dispersion:** different frequency components travel at different speeds $\to$ arrival-time distortion.

Both reduce bandwidth: high-frequency components are attenuated/delayed more, increasing pulse rise/fall times. *(chap4.pdf, p.88)*

**Power loss** for a matched load over length $L$:

$$P_L = e^{-2\alpha L}$$
*(chap4.pdf, p.89)* <!-- VERIFY -->

Loss is negligible when $r \ll \omega l$ and $g \ll \omega c$. *(chap4.pdf, p.89)*

---

### Low-Loss Approximation *(chap4.pdf, pp.90--94)*

**Criterion:**

$$r \ll \omega l \quad \text{and} \quad g \ll \omega c$$
*(chap4.pdf, p.90)* <!-- VERIFY -->

Under this condition, the propagation constant simplifies to: *(chap4.pdf, p.90)*

$$\alpha \approx \frac{r}{2Z_C} + \frac{g Z_C}{2} \quad [\text{Np/m}]$$
*(chap4.pdf, p.91)* <!-- VERIFY -->

$$\beta \approx \omega\sqrt{lc} \quad [\text{rad/m}]$$
*(chap4.pdf, p.91)* <!-- VERIFY -->

**Characteristic impedance** (frequency-independent):

$$Z_C \approx \sqrt{\frac{l}{c}} \quad [\Omega]$$
*(chap4.pdf, p.91)* <!-- VERIFY -->

Sub-regions for typical PCB (FR-4): *(chap4.pdf, pp.92--94)*

| Frequency | $\alpha$ behavior | $\beta$ behavior |
|-----------|-------------------|-----------------|
| $< \sim 5\text{ MHz}$ | Dominated by $r_{dc}$ (constant) | Dispersive |
| $5\text{ MHz} -- 20\text{ MHz}$ | No significant dispersion | Linear with $f$ |
| $> 20\text{ MHz}$ | Skin-effect $\alpha \propto \sqrt{f}$ | Linear with $f$ (no dispersion) |

Above 5 MHz: low-loss approximation is valid. Above 20 MHz: no $\beta$ dispersion, but $\alpha$ dispersion (from skin effect) remains. *(chap4.pdf, p.93)*

Because $g = \omega c \tan\theta$ is always smaller than $\omega c$ by a factor of $\tan\theta \approx 0.02$, dielectric loss is dominated by conductor loss at lower frequencies but becomes comparable at very high frequencies. *(chap4.pdf, p.94)*

---

## 4.8 Lumped-Circuit Approximate Models *(chap4.pdf, pp.95--97)*

### Criterion for Use *(chap4.pdf, p.95)*

The transmission line can be modeled as lumped elements only when the line is **electrically short** at the highest frequency of interest:

$$L < \frac{\lambda}{10}$$
*(chap4.pdf, p.95)* <!-- VERIFY -->

### Lumped-$\pi$ and Lumped-$T$ Models *(chap4.pdf, p.95)*

Two common approximations:
- **Lumped-$\pi$**: half-capacitor --- inductor --- half-capacitor
- **Lumped-$T$**: half-inductor --- capacitor --- half-inductor

Lossy lines are **difficult** to handle in time-domain with lumped models because the per-unit-length resistance is frequency-dependent. *(chap4.pdf, p.95)*

### Accuracy vs. Number of Sections *(chap4.pdf, pp.96--97)*

| Model | Valid up to |
|-------|------------|
| Distributed (exact) | All frequencies |
| Lumped-$\pi$, 1 section | $f$ where $L = \lambda/10$ |
| Lumped-$\pi$, 2 sections | Approximately $2\times$ the 1-section limit |

Each additional section extends the valid frequency range by approximately the same factor. *(chap4.pdf, p.97)*
