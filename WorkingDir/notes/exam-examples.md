# EMC First Midterm --- Exam Preparation Examples

---

## Key Formulas Quick Reference

### Chapter 1

| Formula | Expression | Source |
|---------|------------|--------|
| Electrical dimension | $k = L/\lambda$ | *(chap1.pdf, p.21)* |
| Phase velocity | $v = v_0/\sqrt{\mu_r\varepsilon_r}$ | *(chap1.pdf, p.20)* |
| Wavelength | $\lambda = v/f = v_0/(f\sqrt{\mu_r\varepsilon_r})$ | *(chap1.pdf, p.21)* |
| Phase difference | $\Delta\phi = \beta L = 2\pi L/\lambda$ | *(chap1.pdf, p.17)* |
| Time delay | $T_D = L/v$ | *(chap1.pdf, p.16)* |
| Power gain (dB) | $G_{p,dB} = 10\log(P_{out}/P_{in})$ | *(chap1.pdf, p.25)* |
| Voltage gain (dB) | $G_{V,dB} = 20\log(V_{out}/V_{in})$ | *(chap1.pdf, p.26)* |
| dB arithmetic | $P_{out,dBm} = G_{dB} + P_{in,dBm}$ | *(chap1.pdf, p.28)* |
| Attenuation constant | $\alpha = P_L(\text{dB/m})/8.686$ | *(chap1.pdf, p.30)* |
| Voltage--power (50 $\Omega$) | dB$\mu$V$_{RMS}$ = 107 + dBm | *(chap1.pdf, p.30)* |

### Chapter 2

| Formula | Expression | Source |
|---------|------------|--------|
| Class A normalization | $20\log(10/3) \approx 10.46$ dB | *(chap2.pdf, p.13)* |

### Chapter 3

| Formula | Expression | Source |
|---------|------------|--------|
| Fourier coefficients | $c_n = \frac{1}{T}\int_0^T x(t)e^{-jn\omega_0 t}dt$ | *(chap3.pdf, p.8)* |
| Square pulse $c_n$ | $c_n = AD\frac{\sin(n\pi D)}{n\pi D}$ | *(chap3.pdf, p.11)* |
| Trapezoidal $|c_n|$ | $AD|\text{sinc}(n\pi D)||\text{sinc}(n\pi f_0\tau_r)|$ | *(chap3.pdf, p.29)* |
| Bandwidth | $BW \approx 1/\tau_r$ | *(chap3.pdf, p.37)* |
| Breakpoints | $f_1 = 1/(\pi\tau)$; $f_2 = 1/(\pi\tau_r)$ | *(chap3.pdf, p.33)* |
| Time-shift | $c_n \to c_n e^{-jn\omega_0\alpha}$ | *(chap3.pdf, p.20)* |
| Derivative | $c_n^{(k)} = (jn\omega_0)^k c_n$ | *(chap3.pdf, p.23)* |

### Chapter 4

| Formula | Expression | Source |
|---------|------------|--------|
| TEM relation | $lc = \mu\varepsilon$; $v = 1/\sqrt{lc}$ | *(chap4.pdf, p.12)* |
| Char. impedance | $Z_C = \sqrt{l/c}$ | *(chap4.pdf, p.34)* |
| Reflection coefficient | $\Gamma = (Z_L-Z_C)/(Z_L+Z_C)$ | *(chap4.pdf, p.35)* |
| Initial voltage | $V^+_{\text{init}} = V_S Z_C/(Z_S+Z_C)$ | *(chap4.pdf, p.37)* |
| Capacitive time const. | $\tau_C = Z_C C_L$ | *(chap4.pdf, p.50)* |
| Inductive time const. | $\tau_L = L_L/Z_C$ | *(chap4.pdf, p.53)* |
| Series match | $Z_S + R = Z_C$ | *(chap4.pdf, p.54)* |
| Line negligibility | $\tau_r > 10 T_D$ | *(chap4.pdf, p.59)* |
| VSWR | $S = (1+|\Gamma_L|)/(1-|\Gamma_L|)$ | *(chap4.pdf, p.77)* |
| Input impedance | $Z_{in}(-d) = Z_C\frac{Z_L+jZ_C\tan\beta d}{Z_C+jZ_L\tan\beta d}$ | *(chap4.pdf, p.75)* |
| Skin depth | $\delta = 1/\sqrt{\pi f\mu\sigma}$ | *(chap4.pdf, p.82)* |
| Low-loss $\alpha$ | $\alpha \approx r/(2Z_C) + gZ_C/2$ | *(chap4.pdf, p.91)* |

---

## Worked Examples

### Example 1: Is a Circuit Board a Lumped Element?

**Problem:** A PCB trace is 12 cm long. The board material has $\varepsilon_r = 4.5$, $\mu_r = 1$.
The highest significant clock frequency is 400 MHz. Should the trace be modelled as a
lumped element or a transmission line?

**Solution:**

Phase velocity in the board:

$$v = \frac{v_0}{\sqrt{\varepsilon_r}} = \frac{3\times10^8}{\sqrt{4.5}} = \frac{3\times10^8}{2.12} \approx 1.41\times10^8\text{ m/s}$$
*(chap1.pdf, p.20)*

Wavelength at 400 MHz:

$$\lambda = \frac{v}{f} = \frac{1.41\times10^8}{4\times10^8} = 0.353\text{ m} = 35.3\text{ cm}$$
*(chap1.pdf, p.21)*

Electrical dimension:

$$k = \frac{L}{\lambda} = \frac{0.12}{0.353} = 0.34$$

Since $k = 0.34 \gg 0.1$, the trace is electrically long. **Must be treated as a transmission line.**

---

### Example 2: Phase Difference along a PCB Trace

**Problem:** A 5 cm trace on FR-4 ($\varepsilon_r = 4.2$) carries a 1 GHz signal. What is the phase difference between the two ends of the trace?

**Solution:**

$$v = \frac{3\times10^8}{\sqrt{4.2}} \approx 1.46\times10^8\text{ m/s}$$

$$\beta = \frac{\omega}{v} = \frac{2\pi \times 10^9}{1.46\times10^8} = 43.0\text{ rad/m}$$

$$\Delta\phi = \beta L = 43.0 \times 0.05 = 2.15\text{ rad} \approx 123^\circ$$
*(chap1.pdf, p.17)*

This large phase difference means the trace is acting as a distributed element, not a short wire.

---

### Example 3: dB Arithmetic Through an RF Chain

**Problem:** A signal source outputs $-10$ dBm. It feeds a 5 m coaxial cable with a loss of 1.5 dB/m, then a 30 dB amplifier, then another 2 m cable at 1.5 dB/m. What is the output power in dBm and in dB$\mu$V (RMS) across 50 $\Omega$?

**Solution:**

Cable 1 loss: $1.5 \times 5 = 7.5$ dB

Cable 2 loss: $1.5 \times 2 = 3.0$ dB

$$P_{out} = -10 - 7.5 + 30 - 3.0 = +9.5\text{ dBm}$$
*(chap1.pdf, p.28)*

Converting to dB$\mu$V:

$$\text{dB$\mu$V}_{RMS} = 107 + 9.5 = 116.5\text{ dB$\mu$V}$$
*(chap1.pdf, p.30)*

---

### Example 4: Finding Attenuation Constant

**Problem:** A 50-cm cable reduces signal power by 3.2 dB. Find the attenuation constant $\alpha$ in Np/m.

**Solution:**

Loss per unit length: $3.2\text{ dB} / 0.5\text{ m} = 6.4\text{ dB/m}$

$$\alpha = \frac{6.4}{8.686} = 0.737\text{ Np/m}$$
*(chap1.pdf, p.30)*

---

### Example 5: Spectral Bounds of a Clock Signal

**Problem:** A digital clock has: amplitude $A = 3.3$ V, period $T = 10$ ns ($f_0 = 100$ MHz), pulse width $\tau = 4$ ns ($D = 0.4$), rise time $\tau_r = 1$ ns. Find:
(a) the DC level of the spectral envelope,
(b) the two breakpoint frequencies,
(c) the bandwidth,
(d) the spectral level (in dB relative to the DC level) at 500 MHz.

**Solution:**

**(a) DC level:**

$$2AD = 2 \times 3.3 \times 0.4 = 2.64\text{ V}$$
*(chap3.pdf, p.34)*

**(b) Breakpoints:**

$$f_1 = \frac{1}{\pi\tau} = \frac{1}{\pi \times 4\times10^{-9}} = 79.6\text{ MHz}$$

$$f_2 = \frac{1}{\pi\tau_r} = \frac{1}{\pi \times 1\times10^{-9}} = 318\text{ MHz}$$
*(chap3.pdf, p.33)*

**(c) Bandwidth:**

$$BW \approx \frac{1}{\tau_r} = \frac{1}{1\times10^{-9}} = 1\text{ GHz}$$
*(chap3.pdf, p.37)*

**(d) Level at 500 MHz:**

500 MHz is above $f_2 = 318$ MHz, so we are in the -40 dB/decade region.

At $f_2$, the slope changed from -20 to -40 dB/decade. We need the level at $f_2$ first.

Level at $f_1$: 0 dB relative (flat region ends).
From $f_1$ to $f_2$: -20 dB/decade over one decade ratio $= \log_{10}(318/79.6) = \log_{10}(4) = 0.602$ decades.
Drop at $f_2$: $20 \times 0.602 = 12.0$ dB below DC level.

From $f_2$ to 500 MHz: -40 dB/decade over $\log_{10}(500/318) = \log_{10}(1.572) = 0.196$ decades.
Additional drop: $40 \times 0.196 = 7.85$ dB.

Total drop at 500 MHz: $12.0 + 7.85 = 19.85$ dB below DC level.

---

### Example 6: Reflection on a Transmission Line

**Problem:** A lossless $Z_C = 50\,\Omega$ line of length 10 cm is driven by a $V_S = 5\text{ V}$ step source with $Z_S = 10\,\Omega$ and terminated with $Z_L = 200\,\Omega$. The line has $v = 2\times10^8\text{ m/s}$.

Find: (a) $T_D$, (b) $V^+_{\text{init}}$, (c) $\Gamma_L$, (d) $\Gamma_S$, (e) load voltage at $t = T_D$ and $t = 3T_D$.

**Solution:**

**(a)**

$$T_D = \frac{L}{v} = \frac{0.10}{2\times10^8} = 0.5\text{ ns}$$
*(chap4.pdf, p.16)*

**(b)** Initial forward voltage:

$$V^+_{\text{init}} = V_S\,\frac{Z_C}{Z_S + Z_C} = 5 \times \frac{50}{10 + 50} = 5 \times \frac{50}{60} = 4.167\text{ V}$$
*(chap4.pdf, p.37)*

**(c)** Load reflection coefficient:

$$\Gamma_L = \frac{Z_L - Z_C}{Z_L + Z_C} = \frac{200 - 50}{200 + 50} = \frac{150}{250} = 0.6$$
*(chap4.pdf, p.35)*

**(d)** Source reflection coefficient:

$$\Gamma_S = \frac{Z_S - Z_C}{Z_S + Z_C} = \frac{10 - 50}{10 + 50} = \frac{-40}{60} = -0.667$$
*(chap4.pdf, p.36)*

**(e)** Load voltage history:

- At $t = T_D$: first forward wave arrives.

$$V_L(T_D) = V^+_{\text{init}}(1 + \Gamma_L) = 4.167 \times 1.6 = 6.667\text{ V}$$

- Reflected wave back to source: $V^- = \Gamma_L \times V^+_{\text{init}} = 0.6 \times 4.167 = 2.5$ V

- At source ($t = 2T_D$): re-reflection.

$$V^{++} = \Gamma_S \times V^- = -0.667 \times 2.5 = -1.667\text{ V}$$

- At $t = 3T_D$: second forward wave arrives at load.

$$V_L(3T_D) = V_L(T_D) + V^{++}(1 + \Gamma_L) = 6.667 + (-1.667)(1.6) = 6.667 - 2.667 = 4.0\text{ V}$$

Steady-state: $V_L(\infty) = V_S \times Z_L/(Z_S + Z_L) = 5 \times 200/210 = 4.762\text{ V}$ (voltage divider).

---

### Example 7: Series Match with Capacitive Load

**Problem:** A transmission line with $Z_C = 50\,\Omega$ connects two gates. The source has $Z_S = 10\,\Omega$, so a series resistor $R$ is added for matching. The load is a capacitor $C_L = 5\text{ pF}$. Find $R$ and the time delay to 50% at the load.

**Solution:**

Series match: $Z_S + R = Z_C$

$$R = Z_C - Z_S = 50 - 10 = 40\,\Omega$$
*(chap4.pdf, p.54)*

With matched source, $V^+_{\text{init}} = V_S/2 = 2.5$ V (for $V_S = 5$ V step).

Capacitive time constant:

$$\tau_C = Z_C\,C_L = 50 \times 5\times10^{-12} = 250\text{ ps}$$
*(chap4.pdf, p.50)*

Additional 50% delay: $0.693 \times \tau_C = 0.693 \times 250 = 173\text{ ps}$. *(chap4.pdf, p.57)*

Total delay from source to 50% at load = $T_D + 173\text{ ps}$.

---

### Example 8: Low-Loss Line Regime

**Problem:** A PCB microstrip has $r = 5\,\Omega/\text{m}$ at 10 MHz, $l = 300\text{ nH/m}$, $g = 0.01\text{ mS/m}$, $c = 100\text{ pF/m}$. Is the low-loss approximation valid at 10 MHz? Find $Z_C$, $\alpha$, and $\beta$.

**Solution:**

Check criteria:

$$\omega l = 2\pi\times10^7 \times 300\times10^{-9} = 18.85\,\Omega/\text{m} \gg r = 5\,\Omega/\text{m} \quad \checkmark$$

$$\omega c = 2\pi\times10^7 \times 10^{-10} = 6.28\,\text{mS/m} \gg g = 0.01\,\text{mS/m} \quad \checkmark$$

Low-loss approximation is valid.

$$Z_C \approx \sqrt{l/c} = \sqrt{\frac{300\times10^{-9}}{10^{-10}}} = \sqrt{3000} = 54.8\,\Omega$$
*(chap4.pdf, p.91)*

$$\alpha \approx \frac{r}{2Z_C} + \frac{gZ_C}{2} = \frac{5}{2\times54.8} + \frac{0.01\times10^{-3}\times54.8}{2}$$
$$= 0.0456 + 2.74\times10^{-4} \approx 0.0459\text{ Np/m}$$
*(chap4.pdf, p.91)*

$$\beta \approx \omega\sqrt{lc} = 2\pi\times10^7\times\sqrt{3\times10^{-17}} = 2\pi\times10^7\times1.73\times10^{-8.5} = 2\pi\times10^7\times\frac{1}{\sqrt{lc}}$$

More directly:

$$\beta = \omega\sqrt{lc} = 2\pi\times10^7\times\sqrt{300\times10^{-9}\times10^{-10}} = 2\pi\times10^7\times\sqrt{3\times10^{-17}} = 2\pi\times10^7\times1.732\times10^{-8.5}$$

$$\sqrt{lc} = \sqrt{3\times10^{-17}} = 5.477\times10^{-9}\,\text{s/m}$$

$$\beta = 2\pi\times10^7\times5.477\times10^{-9} = 0.344\text{ rad/m}$$
*(chap4.pdf, p.91)*

Phase velocity: $v = \omega/\beta = (2\pi\times10^7)/0.344 = 1.83\times10^8\text{ m/s} = v_0/\sqrt{\varepsilon_r'} \Rightarrow \varepsilon_r' = (3/1.83)^2 = 2.69$.
