# EMC First Midterm — Exam Preparation Examples

**Course:** Electromagnetic Compatibility, NTUST  
**Format:** Closed-book midterm  
**Source of truth:** chap1.pdf – chap4.pdf

---

## Key Formulas Likely to Be Tested

### Chapter 1 — Foundations

$$T_D = \frac{\mathscr{L}}{v}$$
*(chap1.pdf, p.16)*

$$v = \frac{1}{\sqrt{\epsilon\mu}} = \frac{v_0}{\sqrt{\epsilon_r\mu_r}}, \quad v_0 = 3\times10^8 \text{ m/s}$$
*(chap1.pdf, p.20)*

$$k = \frac{\mathscr{L}}{\lambda} \quad \text{(electrical dimension)}$$
*(chap1.pdf, p.21)*

$$\text{Voltage gain (dB)} = 20\log_{10}\!\left(\frac{V_\text{out}}{V_\text{in}}\right), \quad \text{Power gain (dB)} = 10\log_{10}\!\left(\frac{P_\text{out}}{P_\text{in}}\right)$$
*(chap1.pdf, p.25–26)*

$$\text{Cable loss (dB)} = 8.686\,\alpha\mathscr{L}$$
*(chap1.pdf, p.30)*

$$\text{dB}\mu\text{V} = 107 + \text{dBm} \quad \text{(50 }\Omega\text{ system)}$$
*(chap1.pdf, p.30)*

---

### Chapter 2 — Regulatory Limits

Distance normalization for radiated emission comparisons:

$$\Delta E_\text{dB} = 20\log_{10}\!\left(\frac{d_1}{d_2}\right)$$
*(chap2.pdf, p.13)*

Class A vs. Class B at same distance: Class A is ~10 dB less stringent. *(chap2.pdf, p.13)*

---

### Chapter 3 — Signal Spectra

$$c_n = \frac{1}{T}\int_{t_1}^{t_1+T} x(t)\,e^{-jn\omega_0 t}\,dt$$
*(chap3.pdf, p.8)*

$$|c_n| = \frac{A\tau}{T}\left|\frac{\sin(\pi f\tau)}{\pi f\tau}\right| \quad \text{(rectangular pulse train)}$$
*(chap3.pdf, p.12)*

$$f_1 = \frac{1}{\pi\tau}, \quad f_2 = \frac{1}{\pi\tau_r}, \quad \text{BW} = \frac{1}{\tau_r}$$
*(chap3.pdf, p.34, 37)*

$$G_x(f) = \frac{X_0^2}{4}\,\delta(f) + \frac{X_0^2 T}{4}\,\frac{\sin^2(\pi fT)}{(\pi fT)^2} \quad \text{(PCM-NRZ PSD)}$$
*(chap3.pdf, p.52)*

---

### Chapter 4 — Transmission Lines

$$\frac{\partial V}{\partial z} = -l\,\frac{\partial I}{\partial t}, \quad \frac{\partial I}{\partial z} = -c\,\frac{\partial V}{\partial t}$$
*(chap4.pdf, p.8–9)*

$$Z_C = \sqrt{\frac{l}{c}}, \quad v = \frac{1}{\sqrt{lc}}, \quad lc = \mu\epsilon$$
*(chap4.pdf, p.12, 28)*

$$\Gamma_L = \frac{R_L - Z_C}{R_L + Z_C}, \quad \Gamma_S = \frac{R_S - Z_C}{R_S + Z_C}$$
*(chap4.pdf, p.35, 37)*

$$V(0,t) = \frac{Z_C}{R_S + Z_C}\,V_S(t) \quad \text{(initially launched voltage)}$$
*(chap4.pdf, p.37)*

$$\tau_r > 10\,T_D \quad \text{(transmission line negligible criterion)}$$
*(chap4.pdf, p.59)*

$$\hat{Z}_\text{in} = Z_C\,\frac{\hat{Z}_L + jZ_C\tan\beta\mathscr{L}}{Z_C + j\hat{Z}_L\tan\beta\mathscr{L}}$$
*(chap4.pdf, p.76)*

$$\text{VSWR} = \frac{1 + |\hat{\Gamma}_L|}{1 - |\hat{\Gamma}_L|}$$
*(chap4.pdf, p.77)*

$$\hat{\gamma} = \sqrt{(r + j\omega l)(g + j\omega c)} = \alpha + j\beta$$
*(chap4.pdf, p.81)*

$$\delta = \frac{1}{\sqrt{\pi f\mu_0\sigma}} \quad \text{(skin depth)}$$
*(chap4.pdf, p.82)*

$$\tan\theta = \frac{\epsilon_r''}{\epsilon_r'}, \quad g = \omega c\tan\theta$$
*(chap4.pdf, p.87)*

$$\alpha \approx \frac{1}{2}\!\left(\frac{r}{Z_C} + gZ_C\right) \quad \text{(low-loss)}$$
*(chap4.pdf, p.91)*

---

## Example Problems from Slides

### Example 1 — dBµV / dBm Conversion *(chap1.pdf, p.30)*

**Problem:** A signal source delivers 0 dBm into a 50 Ω spectrum analyzer. What is the voltage level in dBµV?

**Solution:**

$$\text{dB}\mu\text{V} = 107 + \text{dBm} = 107 + 0 = 107 \text{ dB}\mu\text{V}$$

*(chap1.pdf, p.30)*

---

### Example 2 — Cable Loss Calculation *(chap1.pdf, p.30)*

**Problem:** A coaxial cable has attenuation constant $\alpha = 0.05$ Np/m. Find the cable loss in dB for a cable of length $\mathscr{L} = 10$ m.

**Solution:**

$$\text{Cable loss} = 8.686 \times 0.05 \times 10 = 4.34 \text{ dB}$$

*(chap1.pdf, p.30)*

---

### Example 3 — Electrical Dimension and Wavelength *(chap1.pdf, p.21)*

**Problem:** A PCB trace is 17.78 cm long. The substrate is epoxy glass with $\epsilon_r = 4.7$, $\mu_r = 1$. At $f = 1$ GHz, is the trace electrically short?

**Solution:**

$$v = \frac{v_0}{\sqrt{\epsilon_r}} = \frac{3\times10^8}{\sqrt{4.7}} = 1.383\times10^8 \text{ m/s}$$

$$\lambda = \frac{v}{f} = \frac{1.383\times10^8}{10^9} = 0.138 \text{ m} = 13.8 \text{ cm}$$

$$k = \frac{\mathscr{L}}{\lambda} = \frac{17.78}{13.8} = 1.29$$

The trace is **electrically long** ($k > 1$) at 1 GHz — transmission-line analysis is required.

*(chap1.pdf, p.21; chap2.pdf, p.37)*

---

### Example 4 — Normalizing Radiated Emission Distance *(chap2.pdf, p.13)*

**Problem:** The FCC Class A limit at 30–88 MHz is 39 dBµV/m measured at 10 m. What is the equivalent limit at 3 m?

**Solution:**

$$\Delta E = 20\log_{10}\!\left(\frac{10}{3}\right) = 20\log_{10}(3.33) = 20\times0.523 = 10.46 \text{ dB}$$

$$\text{Limit at 3 m} = 39 + 10.46 = 49.46 \text{ dB}\mu\text{V/m}$$

Compare to Class B at 3 m: 40 dBµV/m — so Class A is ~9.5 dB less stringent.

*(chap2.pdf, p.13)*

---

### Example 5 — Trapezoidal Spectral Bounds *(chap3.pdf, p.34)*

**Problem:** A clock signal has amplitude $A = 3.3$ V, period $T = 10$ ns ($f_0 = 100$ MHz), pulse width $\tau = 5$ ns (50% duty cycle), and rise time $\tau_r = 1$ ns.

**(a)** Find the spectral bound breakpoints $f_1$ and $f_2$.  
**(b)** Find the DC level and peak envelope level.  
**(c)** Estimate the level at $f = 200$ MHz.

**Solution:**

**(a)** Breakpoints:

$$f_1 = \frac{1}{\pi\tau} = \frac{1}{\pi\times5\times10^{-9}} = 63.7 \text{ MHz}$$

$$f_2 = \frac{1}{\pi\tau_r} = \frac{1}{\pi\times1\times10^{-9}} = 318 \text{ MHz}$$

*(chap3.pdf, p.34)*

**(b)** Levels:

$$c_0 = A\frac{\tau}{T} = 3.3 \times 0.5 = 1.65 \text{ V}$$

Peak envelope: $2A\tau/T = 2\times1.65 = 3.3$ V → $20\log_{10}(3.3) = 10.4$ dBV *(chap3.pdf, p.30)*

**(c)** Estimate at $f = 200$ MHz (in the $-20$ dB/dec region, since $f_1 < 200$ MHz $< f_2$):

$$\text{Level}_{200} = \text{Level}_{f_1} - 20\log_{10}\!\left(\frac{200}{63.7}\right) = 10.4 - 20\log_{10}(3.14) = 10.4 - 9.9 = 0.5 \text{ dBV}$$

*(chap3.pdf, p.34–36)*

---

### Example 6 — Transmission Line Reflection *(chap4.pdf, p.38)*

**Problem (based on Example 4.1):** A transmission line has $Z_C = 50\,\Omega$, $v = 200$ m/µs, $\mathscr{L} = 400$ m. The source is a 30 V step with $R_S = 0\,\Omega$ and the load is $R_L = 100\,\Omega$.

**(a)** Find $T_D$, $\Gamma_L$, and $\Gamma_S$.  
**(b)** Find the initially launched voltage.  
**(c)** Find the load voltage at $t = T_D^+$ and $t = 3T_D^+$.

**Solution:**

**(a)**

$$T_D = \frac{400}{200\times10^6} = 2\,\mu\text{s}$$

$$\Gamma_L = \frac{100 - 50}{100 + 50} = \frac{50}{150} = \frac{1}{3}$$

$$\Gamma_S = \frac{0 - 50}{0 + 50} = -1$$

*(chap4.pdf, p.35, 37)*

**(b)** Initial voltage:

$$V^+ = \frac{Z_C}{R_S + Z_C}V_S = \frac{50}{0+50}\times30 = 30 \text{ V}$$

*(chap4.pdf, p.37)*

**(c)** Load voltage:

At $t = T_D^+$ (first arrival at load):

$$V(\mathscr{L}) = V^+(1 + \Gamma_L) = 30\!\left(1 + \frac{1}{3}\right) = 40 \text{ V}$$

Reflected wave $V^- = \Gamma_L V^+ = 10$ V travels back, reaches source at $t = 2T_D$. At source: re-reflected by $\Gamma_S = -1$, so $V^{++} = -10$ V.

At $t = 3T_D^+$ (second arrival at load):

$$V(\mathscr{L}) = 40 + (-10)(1 + \Gamma_L) = 40 - 10\times\frac{4}{3} = 40 - 13.3 = 26.7 \text{ V}$$

*(chap4.pdf, p.38, 43)*

**Steady state:** $V_{SS} = V_S \times R_L/(R_S + R_L) = 30\times100/100 = 30$ V.

---

### Example 7 — Is the Transmission Line Important? *(chap4.pdf, p.59)*

**Problem:** A PCB trace has $\mathscr{L} = 10$ cm, $\epsilon_r = 4.7$ (microstrip). A CMOS gate drives it with rise time $\tau_r = 1$ ns. Does the trace behave as a transmission line?

**Solution:**

$$v = \frac{v_0}{\sqrt{\epsilon_r'}} \approx \frac{3\times10^8}{\sqrt{4.7}} = 1.38\times10^8 \text{ m/s}$$

$$T_D = \frac{0.10}{1.38\times10^8} = 0.72 \text{ ns}$$

Check criterion: $\tau_r = 1$ ns vs. $10T_D = 7.2$ ns.

$$\tau_r < 10T_D \quad (1 \text{ ns} < 7.2 \text{ ns})$$

**The line matters** — transmission-line analysis required. Reflections and overshoot will occur.

*(chap4.pdf, p.59)*

---

### Example 8 — VSWR Calculation *(chap4.pdf, p.77)*

**Problem:** A 50 Ω transmission line is terminated with $R_L = 150\,\Omega$. Find $\Gamma_L$ and VSWR.

**Solution:**

$$\Gamma_L = \frac{150 - 50}{150 + 50} = \frac{100}{200} = 0.5$$

$$\text{VSWR} = \frac{1 + |\Gamma_L|}{1 - |\Gamma_L|} = \frac{1.5}{0.5} = 3$$

*(chap4.pdf, p.77)*

---

### Example 9 — Skin Depth *(chap4.pdf, p.82)*

**Problem:** Find the skin depth in copper ($\sigma = 5.8\times10^7$ S/m) at $f = 100$ MHz.

**Solution:**

$$\delta = \frac{1}{\sqrt{\pi f\mu_0\sigma}} = \frac{1}{\sqrt{\pi\times10^8\times4\pi\times10^{-7}\times5.8\times10^7}}$$

$$= \frac{1}{\sqrt{\pi\times10^8\times4\pi\times10^{-7}\times5.8\times10^7}}$$

$$= \frac{1}{\sqrt{4\pi^2\times5.8\times10^8}} = \frac{1}{\sqrt{2.285\times10^{10}}} = \frac{1}{1.512\times10^5} \approx 6.6\,\mu\text{m}$$

*(chap4.pdf, p.82)*

---

### Example 10 — Low-Loss Attenuation Constant *(chap4.pdf, p.91)*

**Problem:** A coaxial cable at 1 GHz has: $r = 0.1\,\Omega$/m, $g = 2\times10^{-4}$ S/m, $Z_C = 50\,\Omega$. Find $\alpha$ using the low-loss approximation. Then find the cable loss for $\mathscr{L} = 2$ m.

**Solution (low-loss, verify $r \ll \omega l$ and $g \ll \omega c$ — assumed satisfied):**

$$\alpha \approx \frac{1}{2}\!\left(\frac{r}{Z_C} + gZ_C\right) = \frac{1}{2}\!\left(\frac{0.1}{50} + 2\times10^{-4}\times50\right)$$

$$= \frac{1}{2}(0.002 + 0.01) = \frac{0.012}{2} = 0.006 \text{ Np/m}$$

$$\text{Cable loss} = 8.686\times0.006\times2 = 0.104 \text{ dB}$$

*(chap4.pdf, p.89–91)*

---

## Concepts Most Likely Tested on Closed-Book Exam

| Topic | Key Concept | Where |
|-------|-------------|-------|
| EMC definition | Three criteria (cause/susceptible/self) | *chap1.pdf, p.4* |
| Three-element model | Source → Path → Receptor | *chap1.pdf, p.5* |
| Electrical dimension | $k = \mathscr{L}/\lambda$; lumped vs. distributed | *chap1.pdf, p.21* |
| dB conversions | 20 log (V/I), 10 log (P); 6 dB = ratio of 2 | *chap1.pdf, p.25–27* |
| Cable loss | $8.686\alpha\mathscr{L}$ dB | *chap1.pdf, p.30* |
| FCC Class A vs. B | Residential vs. commercial; B more stringent | *chap2.pdf, p.6* |
| Conducted emissions | LISN; 150 kHz–30 MHz | *chap2.pdf, p.7, 29* |
| Distance normalization | $20\log_{10}(d_1/d_2)$ | *chap2.pdf, p.13* |
| Trapezoidal spectrum | Two-sinc product; three-region Bode | *chap3.pdf, p.29, 34* |
| Breakpoints | $f_1 = 1/(\pi\tau)$, $f_2 = 1/(\pi\tau_r)$ | *chap3.pdf, p.34* |
| Bandwidth | $\text{BW} = 1/\tau_r$ | *chap3.pdf, p.37* |
| Rise time vs. emissions | Slower edges → less high-freq content | *chap3.pdf, p.35* |
| PCM-NRZ PSD | Delta at DC + sinc-squared continuous | *chap3.pdf, p.52* |
| Telegrapher's equations | Two coupled PDEs | *chap4.pdf, p.8–9* |
| $lc = \mu\epsilon$ | Velocity formula; $v = 1/\sqrt{lc}$ | *chap4.pdf, p.12* |
| Reflection coefficients | $\Gamma_L$ and $\Gamma_S$; open = +1, short = −1 | *chap4.pdf, p.35, 37* |
| Launched voltage | Voltage divider between $R_S$ and $Z_C$ | *chap4.pdf, p.37* |
| TL negligibility | $\tau_r > 10T_D$ | *chap4.pdf, p.59* |
| Input impedance formula | $Z_\text{in} = Z_C\frac{Z_L + jZ_C\tan\beta\ell}{Z_C + jZ_L\tan\beta\ell}$ | *chap4.pdf, p.76* |
| VSWR | $(1+\|\Gamma\|)/(1-\|\Gamma\|)$ | *chap4.pdf, p.77* |
| Skin depth | $\delta = 1/\sqrt{\pi f\mu_0\sigma}$; $\delta \propto 1/\sqrt{f}$ | *chap4.pdf, p.82* |
| Loss tangent | $\tan\theta = \epsilon_r''/\epsilon_r'$; FR-4 ≈ 0.02 | *chap4.pdf, p.87* |
| Low-loss $\alpha$ | $\frac{1}{2}(r/Z_C + gZ_C)$ | *chap4.pdf, p.91* |
