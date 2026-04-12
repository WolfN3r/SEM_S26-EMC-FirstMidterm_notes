# Chapter 3: Signal Spectra — Time Domain and Frequency Domain

**Source:** chap3.pdf — National Taiwan University of Science and Technology, Chun-Long Wang

---

## Outline *(chap3.pdf, p.2)*

- Preview
- Periodic Signals
- Spectra of Digital Waveforms
- Spectrum Analyzers
- Representation of Nonperiodic Waveforms
- Representation of Random (Data) Signals

---

## 1. Preview *(chap3.pdf, p.3)*

- The **frequency spectrum** of signals is the most important aspect of the ability to satisfy EMC requirements.
- The **rise/fall time** of digital signals **dominates the bandwidth** — not the fundamental frequency.
- Fundamental frequency is not as important as commonly expected.

> Key insight: Faster edges = more high-frequency content = harder to pass EMC.

---

## 2. Periodic Signals *(chap3.pdf, p.4)*

### 2.1 Categories of Signals

| Type | Description | Examples |
|---|---|---|
| **Periodic (Deterministic)** | Waveform repeats in time | Clock signals, symmetric data |
| **Random (Nondeterministic)** | Time behavior only described statistically | Data streams |

> Data streams are nondeterministic — otherwise no information would be conveyed. *(chap3.pdf, p.4)*

> Periodic signals are **power signals** (finite power). Nonperiodic signals are **energy signals** (finite energy). *(chap3.pdf, p.5)*

### 2.2 General Form of Periodic Signals *(chap3.pdf, p.5)*

A periodic signal satisfies:

$$x(t \pm kT) = x(t), \quad k = 1, 2, 3, \ldots$$
*(chap3.pdf, p.5)*

Fundamental frequency:

$$f_0 = \frac{1}{T} \qquad \omega_0 = 2\pi f_0 = \frac{2\pi}{T}$$
*(chap3.pdf, p.5)*

Average power:

$$P_\text{av} = \frac{1}{T} \int_{t_1}^{t_1+T} x^2(t)\, dt$$
*(chap3.pdf, p.5)*

Energy in a signal:

$$E = \int_{-\infty}^{\infty} x^2(t)\, dt$$
*(chap3.pdf, p.5)*

Periodic signals can be represented as linear combinations of basis functions:

$$x(t) = \sum_{n=0}^{\infty} c_n \phi_n(t) = c_0\phi_0(t) + c_1\phi_1(t) + c_2\phi_2(t) + \cdots$$
*(chap3.pdf, p.6)*

For a linear system: if $\phi_n(t) \to y_n(t)$, then by superposition:

$$y(t) = \sum_{n=0}^{\infty} c_n y_n(t)$$
*(chap3.pdf, p.6)*

---

## 3. Fourier Series Representation *(chap3.pdf, p.7–p.15)*

### 3.1 Trigonometric Form *(chap3.pdf, p.7)*

Basis functions: $\Phi_0 = 1$ and $\Phi_n = \cos(n\omega_0 t),\, \sin(n\omega_0 t)$ for $n = 1, 2, 3, \ldots, \infty$

Expansion coefficients are **real** in this case.

### 3.2 Complex-Exponential Form *(chap3.pdf, p.7)*

$$x(t) = \sum_{n=-\infty}^{\infty} c_n e^{jn\omega_0 t}$$
*(chap3.pdf, p.7)*

where $\phi_n = e^{jn\omega_0 t} = \cos(n\omega_0 t) + j\sin(n\omega_0 t)$ for $n = -\infty, \ldots, -1, 0, 1, \ldots, \infty$.

### 3.3 Complex Coefficients *(chap3.pdf, p.8)*

$$c_n = \frac{1}{T} \int_{t_1}^{t_1+T} x(t) e^{-jn\omega_0 t}\, dt$$
*(chap3.pdf, p.8)*

For $n = 0$ (DC component):

$$c_0 = \frac{1}{T} \int_{t_1}^{t_1+T} x(t)\, dt = \frac{\text{area under curve over one period}}{T} = \text{average value of } x(t)$$
*(chap3.pdf, p.8)*

This is a **real number**.

### 3.4 One-Sided Spectrum Form *(chap3.pdf, p.9)*

Since $c_{-n} = c_n^*$ (complex conjugate), after manipulation:

$$x(t) = c_0 + \sum_{n=1}^{\infty} 2|c_n| \cos(n\omega_0 t + \angle c_n)$$
*(chap3.pdf, p.9)*

Or equivalently as a function of sines:

$$x(t) = c_0 + \sum_{n=1}^{\infty} 2|c_n| \sin(n\omega_0 t + \angle c_n + 90°)$$
*(chap3.pdf, p.10)*

One-sided spectrum coefficients: $c_n^+ = 2|c_n|$ (double the two-sided magnitudes); DC component $c_0$ remains unchanged. *(chap3.pdf, p.10)*

---

## 4. Fourier Series of a Periodic "Square Wave" Pulse Train *(chap3.pdf, p.11–p.14)*

Figure: Periodic rectangular pulse train — amplitude $A$, pulse width $\tau$, period $T$.

### 4.1 Expansion Coefficients *(chap3.pdf, p.11)*

$$c_n = \frac{A\tau}{T} e^{-jn\omega_0\tau/2} \frac{\sin\!\left(\frac{1}{2}n\omega_0\tau\right)}{\frac{1}{2}n\omega_0\tau}$$
*(chap3.pdf, p.11)*

Substituting $\omega_0 = 2\pi/T$ and $n/T = f$:

$$|c_n| = \frac{A\tau}{T} \left|\frac{\sin(n\pi\tau/T)}{n\pi\tau/T}\right| = \frac{A\tau}{T}\left|\frac{\sin(\pi f\tau)}{\pi f\tau}\right|$$
*(chap3.pdf, p.12)*

This is a **sinc function** of the form $\sin x / x$.

### 4.2 Duty Cycle *(chap3.pdf, p.12)*

$$D = \frac{\tau}{T}$$
*(chap3.pdf, p.12)*

### 4.3 Special Case: D = 1/2 (50% duty cycle) *(chap3.pdf, p.14)*

$$|c_n| = \frac{A}{2}\left|\frac{\sin(n\pi/2)}{n\pi/2}\right| = \begin{cases} \dfrac{A}{n\pi} & n = 1, 3, 5, \ldots \\ 0 & n = 2, 4, 6, \ldots \end{cases}$$
*(chap3.pdf, p.14)*

> **Even harmonics are zero for a 50% duty cycle.** The odd-harmonic levels are stable for slight variations in duty cycle, but **even-harmonic levels are unstable**. *(chap3.pdf, p.14)*

Phase: $\angle c_n = -90°$ for $n = 1, 3, 5, \ldots$; DC component $c_0 = A/2$.

### 4.4 Harmonic Reconstruction *(chap3.pdf, p.15)*

Figure (Example 3.1): A square wave reconstructed from 7 harmonics. The number of harmonics needed is determined by the **bandwidth** of the signal. Fewer harmonics = softer edges; more harmonics = sharper edges.

---

## 5. Response of Linear Systems to Periodic Inputs *(chap3.pdf, p.16–p.17)*

For a linear system with transfer function $H(j\omega) = |H(j\omega)|\angle H(j\omega)$ and input $x(t) = X\cos(\omega t + \phi_x)$:

$$Y\angle\theta_y = H(j\omega) X\angle\phi_x \quad \Rightarrow \quad Y = |H(j\omega)| X, \quad \theta_y = \angle H(j\omega) + \phi_x$$
*(chap3.pdf, p.16)*

For a periodic input $x(t) = c_0 + \sum_{n=1}^\infty 2|c_n|\cos(n\omega_0 t + \angle c_n)$, the output is:

$$y(t) = c_0 H(0) + \sum_{n=1}^{\infty} 2|c_n||H(jn\omega_0)|\cos[n\omega_0 t + \angle c_n + \angle H(jn\omega_0)]$$
*(chap3.pdf, p.17)*

This result is obtained via superposition. *(chap3.pdf, p.17)*

Example 3.2 *(chap3.pdf, p.18)*: A square wave through an RC circuit — if the pulse width is small compared to the RC time constant, the capacitor cannot reach its maximum value.

---

## 6. Important Computational Techniques *(chap3.pdf, p.19–p.26)*

### 6.1 Linearity *(chap3.pdf, p.19–p.20)*

Any waveform can be written as a linear combination:

$$x(t) = A_1 x_1(t) + A_2 x_2(t) + \cdots$$
*(chap3.pdf, p.19)*

If $x_1(t) = \sum c_{1n} e^{jn\omega_0 t}$ and $x_2(t) = \sum c_{2n} e^{jn\omega_0 t}$, then $x(t) = x_1(t) + x_2(t)$ has:

$$c_n = c_{1n} + c_{2n}$$
*(chap3.pdf, p.20)*

### 6.2 Time-Shifting *(chap3.pdf, p.20)*

If $x(t)$ has coefficients $c_n$, then $x(t - \alpha)$ has coefficients:

$$c_n' = c_n e^{-jn\omega_0 \alpha}$$
*(chap3.pdf, p.20)*

> Shifting in time multiplies the expansion coefficients by $e^{-jn\omega_0\alpha}$.

### 6.3 Unit Impulse Function $\delta(t)$ *(chap3.pdf, p.21)*

Definition:

$$\delta(t) = \begin{cases} 0 & t < 0 \\ 0 & t > 0 \end{cases}, \qquad \int_{0^-}^{0^+} \delta(t)\, dt = 1$$
*(chap3.pdf, p.21)*

For a periodic impulse train $x(t) = \delta(t \pm kT)$, the coefficients are:

$$c_n = \frac{1}{T}$$
*(chap3.pdf, p.21)*

For a shifted impulse train, the coefficients become:

$$c_n = \frac{1}{T} e^{-jn\omega_0 \alpha}$$
*(chap3.pdf, p.22)*

### 6.4 Derivative Property *(chap3.pdf, p.22–p.23)*

If $x(t) = \sum_{n=-\infty}^{\infty} c_n e^{jn\omega_0 t}$, then the $k$th derivative has coefficients:

$$c_n^{(k)} = (jn\omega_0)^k c_n$$
*(chap3.pdf, p.23)*

Thus the original coefficients can be recovered from derivative coefficients:

$$c_n = \frac{1}{(jn\omega_0)^k} c_n^{(k)} \qquad n \neq 0$$
*(chap3.pdf, p.23)*

### 6.5 Procedure for Obtaining Expansion Coefficients *(chap3.pdf, p.24)*

1. Repeatedly **differentiate** the function until the first occurrence of an impulse function.
2. If some parts are not impulse functions, continue differentiating that part.
3. Use linearity, time-shifting, unit impulse response, and derivative properties to reconstruct.

---

## 7. Spectra of Trapezoidal (Clock) Waveforms *(chap3.pdf, p.27–p.35)*

### 7.1 Trapezoidal Pulse Parameters *(chap3.pdf, p.27)*

Figure: Trapezoidal waveform with:
- $\tau_r$: rise time (10%–90% of amplitude)
- $\tau_f$: fall time (10%–90% of amplitude)
- $\tau$: pulse width (at midpoints)
- $T$: period, $A$: amplitude

Differentiating twice produces impulses; the 2nd derivative has coefficients:

$$c_n^{(2)} = j\frac{A}{2\pi n}(n\omega_0)^2 e^{-jn\omega_0(\tau+\tau_r)/2}\left[\frac{\sin\!\left(\frac{1}{2}n\omega_0\tau_r\right)}{\frac{1}{2}n\omega_0\tau_r}e^{jn\omega_0\tau/2} - \frac{\sin\!\left(\frac{1}{2}n\omega_0\tau_f\right)}{\frac{1}{2}n\omega_0\tau_f}e^{-jn\omega_0\tau/2}\right]$$
*(chap3.pdf, p.28)*

### 7.2 Trapezoidal Pulse Coefficients *(chap3.pdf, p.29)*

For $\tau_r = \tau_f$:

$$c_n = A\frac{\tau}{T} \frac{\sin\!\left(\frac{1}{2}n\omega_0\tau\right)}{\frac{1}{2}n\omega_0\tau} \cdot \frac{\sin\!\left(\frac{1}{2}n\omega_0\tau_r\right)}{\frac{1}{2}n\omega_0\tau_r} \cdot e^{-jn\omega_0(\tau+\tau_r)/2}$$
*(chap3.pdf, p.29)*

This is the **product of two sinc functions**: one from the pulse width, one from the rise time.

### 7.3 One-Sided Spectrum *(chap3.pdf, p.30)*

$$|c_n^+| = 2|c_n| = 2A\frac{\tau}{T}\left|\frac{\sin(n\pi\tau/T)}{n\pi\tau/T}\right|\left|\frac{\sin(n\pi\tau_r/T)}{n\pi\tau_r/T}\right| \quad \text{for } n \neq 0, \; (\tau_r = \tau_f)$$
*(chap3.pdf, p.30)*

$$c_0 = A\frac{\tau}{T} \quad (\tau_r = \tau_f)$$
*(chap3.pdf, p.30)*

Phase angle:

$$\angle c_n = \pm n\pi\frac{\tau + \tau_r}{T} \quad (\tau_r = \tau_f)$$
*(chap3.pdf, p.30)*

**50% duty cycle** ($\tau = T/2$): The first sinc term equals $|\sin(\frac{1}{2}n\pi)|/|\frac{1}{2}n\pi|$, which is **zero for even $n$**.
Therefore, there are **no even harmonics** for a 50% duty cycle (theoretically). *(chap3.pdf, p.31)*

---

## 8. Spectral Bounds for Trapezoidal Waveforms *(chap3.pdf, p.32–p.39)*

### 8.1 Bounds on the sinc Function *(chap3.pdf, p.32)*

$$\left|\frac{\sin x}{x}\right| \leq \begin{cases} 1 & \text{for small } x \\ \dfrac{1}{|x|} & \text{for large } x \end{cases}$$
*(chap3.pdf, p.32)*

Figure: Plot of $|\sin x / x|$ vs $x$ — flat at 1 (0 dB/decade) for $x < 1$, then falls off at −20 dB/decade for $x > 1$.

### 8.2 Spectral Envelope (Bode Plot Approximation) *(chap3.pdf, p.33–p.34)*

Replacing the discrete spectrum with a **continuous envelope** and converting to dB:

$$20\log_{10}(\text{envelope}) = 20\log_{10}\!\left(2A\frac{\tau}{T}\right) + 20\log_{10}\!\left|\frac{\sin(\pi\tau f)}{\pi\tau f}\right| + 20\log_{10}\!\left|\frac{\sin(\pi\tau_r f)}{\pi\tau_r f}\right|$$
*(chap3.pdf, p.33)*

Figure (Bode plot) *(chap3.pdf, p.34)*: Three-region approximation for $|c_n^+|$:

| Region | Slope | Breakpoint |
|---|---|---|
| $f < \dfrac{1}{\pi\tau}$ | 0 dB/decade (flat) | First breakpoint at $f_1 = \dfrac{1}{\pi\tau}$ |
| $\dfrac{1}{\pi\tau} < f < \dfrac{1}{\pi\tau_r}$ | −20 dB/decade | Second breakpoint at $f_2 = \dfrac{1}{\pi\tau_r}$ |
| $f > \dfrac{1}{\pi\tau_r}$ | −40 dB/decade | — |

Starting (DC) level: $c_0 = A\tau/T$; Peak envelope: $2A\tau/T$.

> **The high-frequency content of a trapezoidal pulse train is determined primarily by the rise/fall time.** To reduce high-frequency emissions, **increase the rise/fall times**. *(chap3.pdf, p.35)*

### 8.3 Interpolation on the dB Scale *(chap3.pdf, p.36)*

On a log-log scale, along a line of slope $M$ dB/decade:

$$\log_{10} Y_2 = \log_{10} Y_1 + M \log_{10}\!\left(\frac{f_2}{f_1}\right)$$
*(chap3.pdf, p.36)*

Corrections at breakpoints:

$$\Delta_1 = -20\log_{10}\!\left(\frac{f_2}{f_1}\right), \quad \Delta_2 = -20\log_{10}\!\left(\frac{f_3}{f_1}\right), \quad \Delta_3 = -40\log_{10}\!\left(\frac{f_4}{f_3}\right)$$
*(chap3.pdf, p.36)*

---

## 9. Bandwidth of Digital Waveforms *(chap3.pdf, p.37)*

From the Bode plot, the bandwidth is defined as **3 times the second breakpoint** or $3/(\pi\tau_r)$, which is approximately:

$$\text{BW} = \frac{1}{\tau_r}$$
*(chap3.pdf, p.37)*

The first null in the true spectrum also occurs at $f = 1/\tau_r$.

> Lower frequencies affect the **pulse level**; higher frequencies affect the **sharp edges**.
> Judging BW from power is unfair: 96% of the total average power is contained in the DC term and first harmonic for a square wave. *(chap3.pdf, p.37)*

---

## 10. Effect of Repetition Rate and Duty Cycle *(chap3.pdf, p.38–p.39)*

With $D = \tau/T$, the one-sided spectrum becomes:

$$|c_n^+| = 2AD\left|\frac{\sin(n\pi D)}{n\pi D}\right|\left|\frac{\sin(n\pi\tau_r f_0)}{n\pi\tau_r f_0}\right| \quad \text{for } n \neq 0$$
*(chap3.pdf, p.38)*

$$c_0 = AD$$
*(chap3.pdf, p.38)*

First breakpoint: $f_1 = f_0/(\pi D) = 1/(\pi\tau)$ — moves with duty cycle.

> **Reducing the duty cycle** (reducing pulsewidth $\tau$) **lowers the starting level** and **moves the first breakpoint to higher frequency**, but **does not affect the high-frequency content**. *(chap3.pdf, p.39)*

---

## 11. Effect of Ringing (Undershoot/Overshoot) *(chap3.pdf, p.40–p.42)*

### 11.1 Cause *(chap3.pdf, p.40)*

Inductance and capacitance of PCB lands cause **ringing** — oscillations on edges. Fixes:
- Place a **discrete resistor in series** with the output to damp oscillations
- Use **ferrite beads** or match transmission lines

### 11.2 Frequency Domain Effect *(chap3.pdf, p.41)*

Figure: Ringing waveform modeled as $V_0 + Ke^{-\alpha t}\sin(\omega_r t)$. In the frequency domain, there is a **spectral peak at the ringing frequency $\omega_r$**.

> **Undershoot/overshoot increases emissions around the ringing frequency.** *(chap3.pdf, p.41)*

### 11.3 Expansion Coefficients with Ringing *(chap3.pdf, p.42)*

For a typical ringing problem, the Fourier coefficients are the superposition:

$$c_n = \underbrace{\frac{V_0}{2}\frac{\sin\!\left(\frac{1}{4}n\omega_0 T\right)}{\frac{1}{4}n\omega_0 T} e^{-jn\omega_0 T/4}}_{\text{square wave}} + \underbrace{\frac{K}{2}\frac{\sin\!\left(\frac{1}{4}n\omega_0 T\right)}{\frac{1}{4}n\omega_0 T} e^{-jn\omega_0 T/4} \frac{p\omega_r}{p^2 + 2\alpha p + \alpha^2 + \omega_r^2}}_{\text{ringing wave}}$$
*(chap3.pdf, p.42)*

---

## 12. Use of Spectral Bounds for Linear Systems *(chap3.pdf, p.43)*

For a linear system $Y(jn\omega_0) = H(jn\omega_0) X(jn\omega_0)$:

$$|Y(jn\omega_0)| = |H(jn\omega_0)| \times |X(jn\omega_0)|$$
*(chap3.pdf, p.43)*

$$\angle Y(jn\omega_0) = \angle H(jn\omega_0) + \angle X(jn\omega_0)$$
*(chap3.pdf, p.43)*

In dB:

$$20\log_{10}|Y(jn\omega_0)| = 20\log_{10}|H(jn\omega_0)| + 20\log_{10}|X(jn\omega_0)|$$
*(chap3.pdf, p.43)*

---

## 13. Spectrum Analyzers *(chap3.pdf, p.44–p.46)*

### 13.1 Definition *(chap3.pdf, p.44)*

- Spectrum analyzers (SA) are devices that **display the magnitude spectrum** for periodic signals.
- They are radio receivers with a **bandpass filter swept in time**.
- If the **resolution bandwidth is too large**, incorrect output is obtained (adjacent harmonics are combined).

Figure: When filter bandwidth is larger than harmonic spacing, overlapping harmonics are summed incorrectly (e.g., three closely spaced components A, B, C appear as A+B+C).

### 13.2 Resolution Bandwidth *(chap3.pdf, p.45)*

- The bandwidth is the **6 dB bandwidth** (where response is 6 dB below maximum at center frequency).
- To obtain the **lowest displayed level**, choose **as small a bandwidth as possible**.
- **Design rule**: Choose clock and data repetition rates such that no harmonics from any signal are closer than the measurement bandwidth of the SA. *(chap3.pdf, p.45)*

### 13.3 Peak vs. Quasi-Peak Detectors *(chap3.pdf, p.46)*

| Detector | Description |
|---|---|
| **Peak detector** | Displays peak (actually RMS) value. Simple RC circuit with fast charge, no discharge resistor. |
| **Quasi-Peak (QP) detector** | Has a discharge resistor R in parallel with C; output is weighted between peak and average. **Regulatory requirements use this detector.** |

Figure: Peak detector — fast charge, slow discharge. Quasi-peak detector — fast charge, controlled discharge through R. For impulsive signals QP << Peak; for CW signals QP ≈ Peak.

---

## 14. Representation of Nonperiodic Waveforms *(chap3.pdf, p.47–p.49)*

### 14.1 Fourier Transform *(chap3.pdf, p.47–p.48)*

As $T \to \infty$, $f_0 = 1/T \to 0$, the discrete spectrum becomes continuous. The envelope of $|c_n|$ approaches:

$$\text{Envelope} = \frac{A\tau}{T}\left|\frac{\sin(\pi f\tau)}{\pi f\tau}\right| \xrightarrow{T\to\infty} A\tau\left|\frac{\sin(\pi f\tau)}{\pi f\tau}\right|$$
*(chap3.pdf, p.47)*

**Fourier Transform** (FT):

$$\mathcal{F}\{x(t)\} = X(j\omega) = \int_{-\infty}^{\infty} x(t) e^{-j\omega t}\, dt$$
*(chap3.pdf, p.47)*

**Inverse Fourier Transform**:

$$x(t) = \frac{1}{2\pi}\int_{-\infty}^{\infty} X(j\omega) e^{j\omega t}\, d\omega$$
*(chap3.pdf, p.47)*

> The spectrum of a single pulse is a continuum of frequency components; $x(t)$ consists of a continuum of complex sinusoids. *(chap3.pdf, p.47)*

For a single rectangular pulse of amplitude $A$ and width $\tau$:

$$X(j\omega) = A\tau \frac{\sin\!\left(\frac{1}{2}\omega\tau\right)}{\frac{1}{2}\omega\tau} e^{-j\omega\tau/2}$$
*(chap3.pdf, p.48)*

The Fourier series coefficients of a periodic train of such pulses are related to the single-pulse FT by:

$$c_n = \frac{1}{T} X(jn\omega_0)$$
*(chap3.pdf, p.48)*

### 14.2 Linear Systems with Nonperiodic Inputs *(chap3.pdf, p.49)*

All properties — linearity, superposition, differentiation, time-shifting, impulse functions — apply to the Fourier transform.

$$Y(j\omega) = H(j\omega)X(j\omega)$$
*(chap3.pdf, p.49)*

---

## 15. Representation of Random (Data) Signals *(chap3.pdf, p.50–p.53)*

### 15.1 PCM-NRZ Model *(chap3.pdf, p.50)*

A random binary waveform transitioning between 0 and $X_0$:

$$x(t) = \frac{1}{2}X_0[1 + m(t)]$$
*(chap3.pdf, p.50)*

where $m(t)$ is a random variable assuming values $\pm 1$ with equal probability in each bit interval $nT < t < (n+1)T$.

### 15.2 Autocorrelation Function *(chap3.pdf, p.50–p.51)*

$$R_x(\tau) = \overline{x(t)x(t+\tau)} = \lim_{t\to\infty} \frac{1}{T}\int_{-T/2}^{T/2} x(t)x(t-\tau)\, dt$$
*(chap3.pdf, p.50)*

Simplified:

$$R_x(\tau) = \frac{1}{4}X_0^2[1 + R_m(\tau)]$$
*(chap3.pdf, p.51)*

where:

$$R_m(\tau) = 1 - \frac{|\tau|}{T} \; \text{ for } |\tau| < T, \qquad R_m(\tau) = 0 \; \text{ for } |\tau| > T$$
*(chap3.pdf, p.51)*

Figure: $R_m(\tau)$ is a triangle function — peak 1 at $\tau = 0$, linearly falling to 0 at $\tau = \pm T$.

### 15.3 Power Spectral Density (PSD) *(chap3.pdf, p.52–p.53)*

By the **Wiener-Kinchine theorem**:

$$G_x(f) = \int_{-\infty}^{\infty} R_x(\tau) e^{-j\omega\tau}\, d\tau \quad \text{W/Hz}$$
*(chap3.pdf, p.52)*

Average power:

$$P_\text{av} = \int_{-\infty}^{\infty} G_x(f)\, df \quad \text{W}$$
*(chap3.pdf, p.52)*

For the **PCM-NRZ waveform** (Pulse Code Modulation — Non-Return to Zero):

$$G_x(f) = \frac{X_0^2}{4}\delta(f) + \frac{X_0^2 T}{4}\frac{\sin^2(\pi f T)}{(\pi f T)^2} \quad \text{W/Hz}$$
*(chap3.pdf, p.52)*

Figure *(chap3.pdf, p.53)*: PSD consists of a delta function at DC ($\frac{X_0^2}{4}\delta(f)$) plus a sinc-squared continuous component ($\frac{X_0^2 T}{4}\cdot\frac{\sin^2(\pi fT)}{(\pi fT)^2}$), with nulls at $f = 1/T, 2/T, 3/T, \ldots$

> This can also be derived from the Fourier series of a square pulse train by replacing $A$, $\tau$ with $X_0$, $T$, and squaring to give power. This makes sense since $m(t)$ is of equal probability in each interval (half 1s and half 0s). *(chap3.pdf, p.53)*

---

## Summary of Key Equations

| Equation | Description | Citation |
|---|---|---|
| $f_0 = 1/T$, $\omega_0 = 2\pi/T$ | Fundamental frequency | *(chap3.pdf, p.5)* |
| $c_n = \frac{1}{T}\int_{t_1}^{t_1+T} x(t)e^{-jn\omega_0 t}dt$ | Fourier coefficient | *(chap3.pdf, p.8)* |
| $\|c_n\| = \frac{A\tau}{T}\left\|\frac{\sin(\pi f\tau)}{\pi f\tau}\right\|$ | Square pulse spectrum | *(chap3.pdf, p.12)* |
| $D = \tau/T$, even harmonics = 0 when $D = 1/2$ | 50% duty cycle property | *(chap3.pdf, p.14)* |
| $\text{BW} = 1/\tau_r$ | Digital signal bandwidth | *(chap3.pdf, p.37)* |
| $f_1 = 1/(\pi\tau)$, $f_2 = 1/(\pi\tau_r)$ | Spectral bound breakpoints | *(chap3.pdf, p.34)* |
| Slope below $f_1$: 0 dB/dec; between $f_1$, $f_2$: −20 dB/dec; above $f_2$: −40 dB/dec | Trapezoidal spectral bounds | *(chap3.pdf, p.34)* |
| $G_x(f) = \frac{X_0^2}{4}\delta(f) + \frac{X_0^2 T}{4}\frac{\sin^2(\pi fT)}{(\pi fT)^2}$ | PCM-NRZ power spectral density | *(chap3.pdf, p.52)* |
