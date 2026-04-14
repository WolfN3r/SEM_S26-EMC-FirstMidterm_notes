# Chapter 3: Signal Spectra --- Time Domain and Frequency Domain

## 3.1 Preview: Why Spectra Matter for EMC

The frequency spectrum of a signal is the **most important factor** determining whether a product can meet EMC limits. *(chap3.pdf, p.3)*

Key insight: the **rise/fall time** of digital signals dominates their bandwidth --- not the fundamental clock frequency. This is why a slow 100 MHz clock can radiate less than a fast 10 MHz one. *(chap3.pdf, p.3)*

---

## 3.2 Periodic vs. Random Signals *(chap3.pdf, p.4)*

| Type | Description | Example |
|------|-------------|---------|
| **Periodic (deterministic)** | Repeats exactly with period $T$ | Clock signals |
| **Random (nondeterministic)** | Only described statistically | Data streams |

Data streams must be random --- if they were deterministic, no information would be conveyed. *(chap3.pdf, p.4)*

### Basic Definitions *(chap3.pdf, p.5)*

Periodic signal property:

$$x(t + T) = x(t)$$
*(chap3.pdf, p.5)* <!-- VERIFY -->

Fundamental frequency:

$$f_0 = \frac{1}{T}$$
*(chap3.pdf, p.5)* <!-- VERIFY -->

Average power:

$$P_{av} = \frac{1}{T}\int_0^T |x(t)|^2\,dt$$
*(chap3.pdf, p.5)* <!-- VERIFY -->

Signal energy:

$$E = \int_{-\infty}^{\infty} |x(t)|^2\,dt$$
*(chap3.pdf, p.5)* <!-- VERIFY -->

- Periodic signals are called **power signals** (finite average power, infinite energy). *(chap3.pdf, p.5)*
- Nonperiodic signals are called **energy signals** (finite total energy). *(chap3.pdf, p.5)*

### Linear System Response to Periodic Input *(chap3.pdf, p.6)*

For a linear system, if each basis function $\phi_n(t)$ produces output $\psi_n(t)$, then by **superposition**, any linear combination of basis functions produces the corresponding linear combination of outputs. *(chap3.pdf, p.6)*

---

## 3.3 Fourier Series

### Complex-Exponential Form *(chap3.pdf, p.7)*

Any periodic signal $x(t)$ with fundamental radian frequency $\omega_0 = 2\pi f_0$ can be written as:

$$x(t) = \sum_{n=-\infty}^{\infty} c_n\,e^{jn\omega_0 t}$$
*(chap3.pdf, p.7)* <!-- VERIFY -->

### Expansion Coefficients *(chap3.pdf, p.8)*

For $n \neq 0$:

$$c_n = \frac{1}{T}\int_0^T x(t)\,e^{-jn\omega_0 t}\,dt$$
*(chap3.pdf, p.8)* <!-- VERIFY -->

For $n = 0$ (DC component):

$$c_0 = \frac{1}{T}\int_0^T x(t)\,dt$$
*(chap3.pdf, p.8)*

$c_0$ is always real and equals the time-average of $x(t)$.

### Relating to the One-Sided Spectrum *(chap3.pdf, p.9)*

The double-sided spectrum uses both positive and negative frequencies. The one-sided spectrum (positive frequencies only) is obtained by doubling the magnitudes:

$$c_n^+ = 2|c_n|, \quad n > 0; \qquad c_0^+ = c_0$$
*(chap3.pdf, p.9)*

The signal can also be expressed as a sum of sines (trigonometric form); expanding that form yields the trigonometric Fourier series. *(chap3.pdf, p.10)*

---

## 3.4 Spectrum of a Square-Wave Pulse Train *(chap3.pdf, pp.11--14)*

### Setup

A periodic rectangular pulse train: amplitude $A$, pulse width $\tau$, period $T$, duty cycle $D = \tau/T$.

### Fourier Coefficients *(chap3.pdf, p.11)*

$$c_n = AD\,\frac{\sin(n\pi D)}{n\pi D} = AD\,\text{sinc}(n\pi D)$$
*(chap3.pdf, p.11)* <!-- VERIFY: standard result; sinc here is sin(x)/x form -->

This is a **sinc function** of the harmonic index $n$.

At $n = 0$: $c_0 = AD$ (DC average value). *(chap3.pdf, p.12)*

### Effect of 50% Duty Cycle *(chap3.pdf, p.14)*

When $D = 1/2$:

$$c_n = \frac{A}{2}\,\frac{\sin(n\pi/2)}{n\pi/2}$$
*(chap3.pdf, p.14)* <!-- VERIFY -->

For even $n$ ($n = 2, 4, 6, \ldots$): $\sin(n\pi/2) = \sin(k\pi) = 0$ $\to$ **even harmonics vanish**. *(chap3.pdf, p.14)*

---

## 3.5 Important Computational Techniques *(chap3.pdf, pp.19--26)*

### Linearity *(chap3.pdf, p.19)*

If $x(t) = \sum_k a_k\,x_k(t)$ and each $x_k(t)$ has Fourier coefficients $c_{k,n}$, then:

$$c_n = \sum_k a_k\,c_{k,n}$$
*(chap3.pdf, p.19)* <!-- VERIFY -->

### Time-Shifting *(chap3.pdf, p.20)*

If $x(t)$ has coefficients $c_n$, then $x(t-\alpha)$ has coefficients:

$$c_n\,e^{-jn\omega_0\alpha}$$
*(chap3.pdf, p.20)* <!-- VERIFY -->

Time-shifting only changes the **phase** of each harmonic; magnitudes are unchanged.

### Unit Impulse Function $\delta(t)$ *(chap3.pdf, p.21)*

Definition:

$$\delta(t) = 0 \text{ for } t \neq 0, \qquad \int_{-\infty}^{\infty} \delta(t)\,dt = 1$$
*(chap3.pdf, p.21)* <!-- VERIFY -->

For a **periodic impulse train** $\sum_k \delta(t - kT)$, all Fourier coefficients are equal:

$$c_n = \frac{1}{T} \quad \text{for all } n$$
*(chap3.pdf, p.21)* <!-- VERIFY -->

### Derivative Property *(chap3.pdf, pp.22--23)*

If $x(t)$ has coefficients $c_n$, then its $k$th derivative has coefficients:

$$(jn\omega_0)^k\,c_n$$
*(chap3.pdf, p.23)* <!-- VERIFY -->

### Procedure for Finding Coefficients via Differentiation *(chap3.pdf, p.24)*

1. Differentiate $x(t)$ repeatedly until an impulse train appears.
2. Find the coefficients of the impulse train (easy --- use time-shifting and linearity).
3. Divide by $(jn\omega_0)^k$ to recover the original coefficients.

This approach avoids evaluating the integral directly for piecewise waveforms.

---

## 3.6 Spectrum of Trapezoidal (Clock) Waveforms *(chap3.pdf, pp.27--36)*

### Trapezoidal Pulse Parameters *(chap3.pdf, p.27)*

- $\tau_r$: rise time (10%--90%)
- $\tau_f$: fall time (10%--90%)
- $\tau$: pulse width (measured at midpoints)

The trapezoidal waveform is found by differentiating twice: the second derivative consists of pairs of positive and negative impulses at the transitions. *(chap3.pdf, p.27)*

### Fourier Coefficients (for $\tau_r = \tau_f$) *(chap3.pdf, p.29)*

$$|c_n| = AD\left|\frac{\sin(n\pi D)}{n\pi D}\right|\cdot\left|\frac{\sin(n\pi f_0\tau_r)}{n\pi f_0\tau_r}\right|$$
*(chap3.pdf, p.29)* <!-- VERIFY: product of two sinc functions -->

This is the **product of two sinc functions**: one controlled by duty cycle $D$ and one by the rise/fall time $\tau_r$.

### One-Sided Spectral Envelope *(chap3.pdf, p.30)*

$$|c_n^+| = 2AD\left|\text{sinc}(n\pi D)\right|\cdot\left|\text{sinc}(n\pi f_0\tau_r)\right|$$
*(chap3.pdf, p.30)* <!-- VERIFY -->

### 50% Duty Cycle Case *(chap3.pdf, p.31)*

When $\tau = T/2$ ($D = 1/2$):
$$\sin(n\pi D) = \sin(n\pi/2) = 0 \text{ for even } n$$

$\to$ Theoretically **no even harmonics**. *(chap3.pdf, p.31)*

In practice: odd harmonics are stable; even harmonics are very sensitive to duty-cycle variation. Hence, even-harmonic signals should be avoided. *(chap3.pdf, p.31)*

---

## 3.7 Spectral Bounds (Bode-Plot Envelope) *(chap3.pdf, pp.32--36)*

### Piecewise Envelope for $2|c_n|$ *(chap3.pdf, p.33)*

The continuous envelope bounding the discrete spectrum has three regions:

| Frequency range | Slope (natural scale) | Slope (dB scale) |
|----------------|-----------------------|------------------|
| $f < f_1 = 1/(\pi\tau)$ | Constant: $2A\tau/T$ | 0 dB/decade (flat) |
| $f_1 < f < f_2 = 1/(\pi\tau_r)$ | $\propto 1/f$ | -20 dB/decade |
| $f > f_2$ | $\propto 1/f^2$ | -40 dB/decade |

*(chap3.pdf, pp.33--34)* <!-- VERIFY: breakpoints from sinc function nulls -->

The **DC level** is $2A\tau/T = 2AD$ (the starting height of the flat region). *(chap3.pdf, p.34)*

### Key Conclusion *(chap3.pdf, p.35)*

**The high-frequency spectral content is dominated by the rise/fall time, not the clock frequency.** To reduce high-frequency emissions, increase the rise/fall time (slow down the edges). *(chap3.pdf, p.35)*

### Interpolation on the dB Scale *(chap3.pdf, p.36)*

On the dB scale: $y_{dB} = 20\log_{10}(y)$, $f_{dB} = 20\log_{10}(f)$ (using natural values $y$ and $f$). The -20 dB/decade slope becomes a straight line on the log-log Bode plot, enabling interpolation between breakpoints.

---

## 3.8 Bandwidth of Digital Waveforms *(chap3.pdf, p.37)*

From the Bode-plot envelope, the bandwidth is approximately 3 times the second breakpoint frequency:

$$BW \approx \frac{3}{\pi\tau_r} \approx \frac{1}{\tau_r}$$
*(chap3.pdf, p.37)*

The **first spectral null** in the true spectrum occurs at $f = 1/\tau_r$, consistent with this definition. *(chap3.pdf, p.37)*

Note: judging bandwidth by power is misleading --- 96% of the total average power is contained in the DC term and first harmonic alone. *(chap3.pdf, p.37)*

---

## 3.9 Effect of Duty Cycle on Spectral Bounds *(chap3.pdf, pp.38--39)*

The one-sided spectrum level is proportional to $D = \tau/T$:

$$2|c_n| \propto D \cdot |\text{sinc}(n\pi D)| \cdot |\text{sinc}(n\pi f_0\tau_r)|$$
*(chap3.pdf, p.38)* <!-- VERIFY -->

Reducing the duty cycle (shorter pulse):
- **Lowers the starting (DC) level** of the spectral envelope
- **Moves the first breakpoint** $f_1 = 1/(\pi\tau)$ outward in frequency ($\tau$ decreases $\to$ f$_1$ increases)
- **Does NOT change the high-frequency content** (the second breakpoint $f_2 = 1/(\pi\tau_r)$ depends only on rise time) *(chap3.pdf, p.39)*

---

## 3.10 Effect of Ringing (Undershoot/Overshoot) *(chap3.pdf, pp.40--42)*

### Cause *(chap3.pdf, p.40)*

PCB trace inductance and capacitance cause **ringing** --- oscillation superimposed on transitions. The expansion coefficients of the ringing signal are a superposition:

$$c_n^{\text{total}} = c_n^{\text{square}} + c_n^{\text{ring}}$$
*(chap3.pdf, p.42)* <!-- VERIFY -->

### Effect *(chap3.pdf, p.41)*

Ringing **increases emissions near the ringing frequency** in the spectrum.

### Mitigation *(chap3.pdf, p.40)*

- Series resistor at the driving gate output (common)
- Ferrite beads on the line
- Matching the transmission line (impedance match)

---

## 3.11 Linear System Output Spectrum *(chap3.pdf, p.43)*

For a linear system with impulse response $h(t)$, input $x(t)$, output $y(t)$:

$$Y(jn\omega_0) = H(jn\omega_0)\,X(jn\omega_0)$$
*(chap3.pdf, p.43)* <!-- VERIFY -->

In terms of magnitude and phase:

$$|y_n| = |H(jn\omega_0)|\,|x_n|, \qquad \angle y_n = \angle H(jn\omega_0) + \angle x_n$$
*(chap3.pdf, p.43)* <!-- VERIFY -->

In dB:

$$|y_n|_{\text{dB}} = |H(jn\omega_0)|_{\text{dB}} + |x_n|_{\text{dB}}$$
*(chap3.pdf, p.43)* <!-- VERIFY -->

This allows the system's transfer function to be applied directly to the spectral bounds.

---

## 3.12 Spectrum Analyzers *(chap3.pdf, pp.44--46)*

A spectrum analyzer (SA) is a swept bandpass-filter receiver displaying the **magnitude spectrum** of periodic signals. *(chap3.pdf, p.44)*

### Resolution Bandwidth *(chap3.pdf, p.45)*

The **6 dB resolution bandwidth (RBW)** is the bandwidth at which the filter response is 6 dB below its peak at the center frequency. *(chap3.pdf, p.45)*

Rules:
- Use the **smallest possible RBW** to detect the lowest spectral levels.
- Harmonics of signals in the system should be spaced at least one RBW apart, otherwise adjacent harmonics blend and give incorrect readings. *(chap3.pdf, p.45)*

### Peak vs. Quasi-Peak Detectors *(chap3.pdf, p.46)*

| Detector | Used for | Notes |
|----------|----------|-------|
| **Peak** | General SA display | Displayed value is actually RMS |
| **Quasi-Peak (QP)** | Regulatory measurements (FCC, CISPR) | Weighted response --- responds faster to increasing signals than decreasing |

Regulatory emission limits are **measured with a quasi-peak detector**. *(chap3.pdf, p.46)*

---

## 3.13 Fourier Transform (Nonperiodic Signals) *(chap3.pdf, pp.47--49)*

### From Fourier Series to Transform *(chap3.pdf, p.47)*

As $T \to \infty$ (pulse repetition rate goes to zero), $f_0 \to 0$ and the discrete spectrum becomes a **continuous spectrum**.

**Fourier Transform:**

$$X(j\omega) = \int_{-\infty}^{\infty} x(t)\,e^{-j\omega t}\,dt$$
*(chap3.pdf, p.47)* <!-- VERIFY -->

**Inverse Fourier Transform:**

$$x(t) = \frac{1}{2\pi}\int_{-\infty}^{\infty} X(j\omega)\,e^{j\omega t}\,d\omega$$
*(chap3.pdf, p.47)* <!-- VERIFY -->

The signal $x(t)$ is a continuum of complex sinusoids.

### Single Square Pulse *(chap3.pdf, p.48)*

For a rectangular pulse of amplitude $A$, duration $\tau$ (centered at $t = \tau/2$):

$$X(j\omega) = A\tau\,\frac{\sin(\omega\tau/2)}{\omega\tau/2}$$
*(chap3.pdf, p.48)* <!-- VERIFY -->

Relationship to Fourier series: for a periodic train of such pulses,

$$c_n = \frac{1}{T}X(jn\omega_0)$$
*(chap3.pdf, p.48)* <!-- VERIFY -->

### Properties *(chap3.pdf, p.49)*

All Fourier series properties (linearity, time-shifting, differentiation, impulse functions, superposition) carry over identically to the Fourier transform.

The output of a linear system in the frequency domain:
$$Y(j\omega) = H(j\omega)\,X(j\omega)$$
*(chap3.pdf, p.49)* <!-- VERIFY -->

---

## 3.14 Random (Data) Signals *(chap3.pdf, pp.50--53)*

### PCM-NRZ Model *(chap3.pdf, p.50)*

A random waveform transitioning between $0$ and $X_0$:

$$x(t) = \frac{X_0}{2}[1 + m(t)]$$
*(chap3.pdf, p.50)* <!-- VERIFY -->

where $m(t)$ is a random variable taking values $\pm 1$ with equal probability within each bit interval $nT < t < (n+1)T$. *(chap3.pdf, p.50)*

### Autocorrelation Function *(chap3.pdf, pp.50--51)*

$$R_{xx}(\tau) = \lim_{T_0\to\infty}\frac{1}{T_0}\int_{-T_0/2}^{T_0/2} x(t)\,x(t-\tau)\,dt$$
*(chap3.pdf, p.50)* <!-- VERIFY -->

For PCM-NRZ, this simplifies to a **triangle function** over the bit interval $T$. *(chap3.pdf, p.51)*

### Power Spectral Density (Wiener-Kinchine Theorem) *(chap3.pdf, p.52)*

$$S_{xx}(f) = \mathcal{F}\{R_{xx}(\tau)\}$$
*(chap3.pdf, p.52)* <!-- VERIFY -->

Average power:

$$P_{av} = \int_{-\infty}^{\infty} S_{xx}(f)\,df$$
*(chap3.pdf, p.52)* <!-- VERIFY -->

For the PCM-NRZ waveform, the power spectral density is:

$$S_{xx}(f) = \frac{X_0^2\,T}{4}\,\text{sinc}^2(fT)$$
*(chap3.pdf, p.52)* <!-- VERIFY -->

Physical intuition: since $m(t)$ takes $+1$ and $-1$ with equal probability, on average half the intervals look like "high" and half like "low" --- equivalent to a 50% duty-cycle square wave. Hence, PSD is derived from the square pulse train spectrum. *(chap3.pdf, p.53)*
