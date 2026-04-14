<<<<<<< HEAD
# EMC First Midterm --- Practice Questions
=======
# EMC First Midterm — Practice Questions

**Course:** Electromagnetic Compatibility, NTUST  
**Format:** Closed-book midterm  
**All citations refer to:** chap1.pdf – chap4.pdf
>>>>>>> c5b0b435f3af3f08f08cea2c9c10c79f92a8dbe0

---

## Chapter 1: Introduction to EMC

### Conceptual Questions

<<<<<<< HEAD
**Q1.1** *(chap1.pdf, p.4)*
Define electromagnetic compatibility. List the three criteria that must be simultaneously satisfied for a system to be EMC-compliant.

**Q1.2** *(chap1.pdf, p.5)*
True or False: If an unintended EM signal is picked up by a radio receiver, this constitutes electromagnetic interference.
Explain your answer.

**Q1.3** *(chap1.pdf, p.6)*
List the three general approaches to preventing EMI in order of cost-effectiveness. Why is the first approach usually the most effective?

**Q1.4** *(chap1.pdf, p.7)*
Name and briefly describe the four basic EMC subproblems. Which two involve the power cable?

**Q1.5** *(chap1.pdf, p.9)*
What is ESD, and approximately how large can the voltage become? Why is it a concern even though it is not regulated in the same way as FCC emissions?

**Q1.6** *(chap1.pdf, p.15)*
A circuit element has physical length 2 cm. Under what conditions can you safely use lumped-circuit analysis (KVL, KCL) to model it? Express your answer in terms of wavelength.

### Short Calculation

**Q1.7** *(chap1.pdf, pp.20--21)*
A signal at 3 GHz propagates in a PCB dielectric with $\varepsilon_r = 4$ (assume $\mu_r = 1$).
(a) Find the phase velocity $v$.
(b) Find the wavelength $\lambda$.
(c) What is the maximum trace length that allows lumped-circuit modelling?

**Q1.8** *(chap1.pdf, pp.25--26)*
Express the following gains in decibels:
(a) Power gain of 500
(b) Voltage gain of 30
(c) A factor of 1/4 in power
(d) A factor of 1/4 in voltage

**Q1.9** *(chap1.pdf, p.28)*
A $-5$ dBm signal passes through a cable with 4 dB of loss, then through an amplifier with 35 dB gain, then through another cable with 2 dB of loss. What is the output power in dBm?

**Q1.10** *(chap1.pdf, p.30)*
A 50-m coaxial cable has a measured power loss of 0.5 dB. Find the attenuation constant $\alpha$ in Np/m.

**Q1.11** *(chap1.pdf, p.30)*
A spectrum analyser shows a signal level of 80 dB$\mu$V (RMS). The measurement is performed at $R = 50\,\Omega$. What is the signal power in dBm?

**Q1.12** *(chap1.pdf, p.17)*
A 3 GHz sinusoidal signal propagates along a 4.5 cm trace on FR-4 ($\varepsilon_r = 4$). What is the phase difference between the input and output of the trace?

---

## Chapter 2: Regulatory Requirements

### Conceptual Questions

**Q2.1** *(chap2.pdf, p.6)*
What is the difference between FCC Class A and Class B devices? Which class has stricter limits, and why?

**Q2.2** *(chap2.pdf, p.7)*
State the frequency ranges for (a) conducted emission testing and (b) radiated emission testing under FCC regulations. What instrument is used for conducted emission measurements?

**Q2.3** *(chap2.pdf, p.13)*
FCC Class A radiated emission limits are measured at 10 m and Class B at 3 m. After normalising both to 3 m, how many dB less stringent are the Class A limits compared to Class B? Show the calculation.

**Q2.4** *(chap2.pdf, p.16)*
In what important way did the European EMC Directive (CISPR 22) go further than FCC Part 15?

**Q2.5** *(chap2.pdf, pp.25--27)*
Describe the construction of a semianechoic chamber (SAC). What detector type is used for FCC measurements? For MIL-STD-461E measurements?

**Q2.6** *(chap2.pdf, pp.28--32)*
Explain the two purposes served by the LISN in conducted emission testing. Why must its impedance be constant with frequency?

**Q2.7** *(chap2.pdf, p.41)*
True or False: The best time to address EMC in a product design is during the board layout phase.
Explain the preferred approach.

**Q2.8** *(chap2.pdf, p.17)*
How do MIL-STD-461E requirements compare to FCC/CISPR 22 in terms of frequency range and flexibility?
=======
**Q1.1** Define electromagnetic compatibility (EMC). What are the three criteria a system must satisfy to be considered electromagnetically compatible? *(chap1.pdf, p.4)*

**Q1.2** Describe the three-element model of EMC coupling. What are the three ways to prevent electromagnetic interference, and why is suppressing the source the most preferred approach? *(chap1.pdf, p.5–6)*

**Q1.3** List the four basic EMC subproblems and give a brief description of each. *(chap1.pdf, p.7)*

**Q1.4** A PCB trace has a physical length of 5 cm. At 1 GHz, would you analyze it using lumped-circuit theory or distributed (transmission-line) theory? Justify your answer using the concept of electrical dimension. Assume the substrate is air ($\epsilon_r = 1$). *(chap1.pdf, p.21)*

**Q1.5** Explain why, for an EMC engineer, a signal's **electrical dimension** is more important than its physical dimension. *(chap1.pdf, p.15, 21)*

---

### Short Calculations — Chapter 1

**Q1.6** A signal propagates along a PCB trace of length $\mathscr{L} = 20$ cm through a medium with $\epsilon_r = 4.0$, $\mu_r = 1$.

(a) Find the propagation velocity $v$.  
(b) Find the time delay $T_D$.  
(c) At $f = 750$ MHz, find the wavelength $\lambda$ in the medium.  
(d) Compute the electrical dimension $k = \mathscr{L}/\lambda$.

*(chap1.pdf, p.16, 18, 20, 21)*

**Q1.7** Convert the following:

(a) A voltage ratio of 100 to dB.  
(b) A power ratio of 0.001 to dB.  
(c) −14 dBm to dBµV (50 Ω system).  
(d) 87 dBµV to dBm (50 Ω system).

*(chap1.pdf, p.25–27, 30)*

**Q1.8** A cable has an attenuation constant $\alpha = 0.08$ Np/m and length $\mathscr{L} = 5$ m. Find the cable loss in dB. *(chap1.pdf, p.30)*

**Q1.9** Three amplifier stages are cascaded with gains 20 dB, −6 dB, and 14 dB. What is the total gain in dB? What is the output power in dBm if the input is −10 dBm? *(chap1.pdf, p.28)*

---

### True/False — Chapter 1

**Q1.10** In a denser dielectric (higher $\epsilon_r$), the wavelength is longer. **T / F** *(chap1.pdf, p.20–21)*

**Q1.11** Doubling the voltage gain doubles the gain in dB. **T / F** *(chap1.pdf, p.26)*

**Q1.12** The time delay $T_D = \mathscr{L}/v$ depends on the signal frequency. **T / F** *(chap1.pdf, p.16)*

**Q1.13** Suppressing the emission at its source is the most cost-effective EMC solution. **T / F** *(chap1.pdf, p.6)*

---

### Multiple Choice — Chapter 1

**Q1.14** The electrical dimension $k = \mathscr{L}/\lambda$ of a 10 cm conductor at 3 GHz in air is approximately:  
(A) 0.01  (B) 0.1  (C) 1.0  (D) 10

*(chap1.pdf, p.21)*

**Q1.15** When $R_\text{in} = R_L$, the power gain in dB equals:  
(A) $10\log_{10}(V_\text{out}/V_\text{in})$  
(B) $20\log_{10}(V_\text{out}/V_\text{in})$  
(C) $10\log_{10}(V_\text{out}^2/V_\text{in}^2)$  
(D) Both (B) and (C)

*(chap1.pdf, p.26)*

---

## Chapter 2: EMC Requirements

### Conceptual Questions

**Q2.1** What is the difference between FCC Class A and Class B digital devices? Which has more stringent limits and why? *(chap2.pdf, p.6)*

**Q2.2** Describe the two types of FCC emissions that digital devices must comply with. State the frequency ranges for each. *(chap2.pdf, p.7)*

**Q2.3** What is a LISN (Line Impedance Stabilization Network)? Describe its two functions and why the 50 Ω impedance it presents is important. *(chap2.pdf, p.29, 32)*

**Q2.4** Compare FCC and CISPR 22 radiated emission limits: what frequency range does each cover, and at what measurement distance? *(chap2.pdf, p.11, 14)*

**Q2.5** MIL-STD-461E requirements can be tailored or waived by the procuring authority. Why is this different from FCC or CISPR 22 regulations? *(chap2.pdf, p.17)*

---

### Short Calculations — Chapter 2

**Q2.6** The FCC Class A radiated emission limit at 30–88 MHz is 39 dBµV/m measured at 10 m. Convert this to a 3 m measurement distance and compare it to the Class B limit at 3 m (40 dBµV/m). Which is more stringent at 3 m? *(chap2.pdf, p.11, 13)*

**Q2.7** A product passes the FCC Class B radiated emission limit at 10 m with a margin of 5 dB. What margin does it have at 3 m (i.e., does passing at 10 m guarantee passing at 3 m)? *(chap2.pdf, p.13)*

**Q2.8** A digital product generates harmonics at 74.9 MHz, 134.8 MHz, and 174.8 MHz. The FCC Class B radiated limit at 3 m for the frequency range 88–216 MHz is 43.5 dBµV/m. A measurement shows 38.5 dBµV/m at 158.8 MHz. By how many dB does it pass or fail? *(chap2.pdf, p.11, 33)*

---

### True/False — Chapter 2

**Q2.9** CISPR 22 conducted emission limits are the same as FCC Part 15 conducted emission limits. **T / F** *(chap2.pdf, p.15)*

**Q2.10** The FCC Class B limit is measured at 3 m; the Class A limit is measured at 10 m. When normalized to the same distance, Class A is less stringent. **T / F** *(chap2.pdf, p.13)*

**Q2.11** CISPR 22 radiated emissions cover frequencies up to 40 GHz. **T / F** *(chap2.pdf, p.14)*

**Q2.12** MIL-STD-461E RS103 requires an electric field immunity of up to 200 V/m for aircraft. **T / F** *(chap2.pdf, p.20)*

---

### Multiple Choice — Chapter 2

**Q2.13** The frequency range for FCC conducted emission measurements is:  
(A) 30 Hz – 30 MHz  
(B) 150 kHz – 30 MHz  
(C) 30 MHz – 1 GHz  
(D) 10 kHz – 40 GHz

*(chap2.pdf, p.7)*

**Q2.14** Moving a measurement antenna from 10 m to 3 m changes the measured field level by approximately:  
(A) +3.3 dB  (B) +10 dB  (C) +10.5 dB  (D) −10.5 dB

*(chap2.pdf, p.13)*
>>>>>>> c5b0b435f3af3f08f08cea2c9c10c79f92a8dbe0

---

## Chapter 3: Signal Spectra

### Conceptual Questions

<<<<<<< HEAD
**Q3.1** *(chap3.pdf, p.3)*
What property of a digital clock signal most strongly determines its high-frequency spectral content, and why does it matter for EMC?

**Q3.2** *(chap3.pdf, p.4)*
Why must a data stream in a digital communication system be nondeterministic (random)?

**Q3.3** *(chap3.pdf, p.9)*
A signal has complex Fourier coefficients $c_n$. How do you obtain the one-sided (positive-frequency) spectrum from these? What happens to the DC component $c_0$?

**Q3.4** *(chap3.pdf, p.14)*
A symmetric square wave has a 50% duty cycle. What can be said about its even harmonics? Explain physically why they vanish.

**Q3.5** *(chap3.pdf, pp.33--35)*
Sketch the Bode-plot spectral envelope of a trapezoidal clock waveform. Label the two breakpoint frequencies, the DC level, and the slopes in each region. What design change has the greatest effect on reducing high-frequency emissions?

**Q3.6** *(chap3.pdf, p.37)*
A digital clock has $\tau_r = 2\text{ ns}$. Estimate its signal bandwidth. Where does the first spectral null occur in the true spectrum?

**Q3.7** *(chap3.pdf, pp.40--42)*
What causes ringing in digital signals on PCBs? How does ringing affect the frequency spectrum? List two circuit-level remedies.

**Q3.8** *(chap3.pdf, p.46)*
What is a quasi-peak detector, and why is it required for regulatory measurements instead of a simple peak detector?

### Short Calculation

**Q3.9** *(chap3.pdf, pp.11--12)*
A periodic rectangular pulse train has amplitude $A = 5\text{ V}$, period $T = 20\text{ ns}$, pulse width $\tau = 5\text{ ns}$.
(a) Find the duty cycle $D$.
(b) Find the DC component $c_0$.
(c) Find $|c_3|$ (the magnitude of the 3rd harmonic coefficient).

**Q3.10** *(chap3.pdf, pp.33--34)*
For the clock in Q3.9, add rise time $\tau_r = 1\text{ ns}$. Find:
(a) The DC level of the spectral envelope ($2AD$).
(b) The first breakpoint $f_1$.
(c) The second breakpoint $f_2$.
(d) The bandwidth $BW$.

**Q3.11** *(chap3.pdf, p.36)*
Using the spectral envelope from Q3.10, estimate the spectral level (in V) at $f = 2\text{ GHz}$ relative to the DC level. Express as a dB ratio.

**Q3.12** *(chap3.pdf, pp.38--39)*
Compare two clock signals both with $A = 3.3\text{ V}$, $T = 10\text{ ns}$, $\tau_r = 0.5\text{ ns}$:
Clock 1: $\tau = 5\text{ ns}$ ($D = 0.5$)
Clock 2: $\tau = 1\text{ ns}$ ($D = 0.1$)

(a) What is the DC spectral level for each?
(b) For each, at what frequency does the flat region end?
(c) What happens to the high-frequency ($f > f_2$) content when we switch from Clock 1 to Clock 2?

**Q3.13** *(chap3.pdf, p.20)*
A periodic signal $x(t)$ has Fourier coefficients $c_n$. Signal $y(t) = x(t - 3\text{ ns})$ is a delayed version of $x(t)$ with period $T = 10\text{ ns}$.
(a) Write the Fourier coefficients of $y(t)$ in terms of $c_n$.
(b) Does the time delay affect the magnitude of any harmonic? Explain.
=======
**Q3.1** Explain why the **rise time** of a digital signal, rather than its clock frequency, dominates the high-frequency content of its spectrum. Use the spectral bound breakpoints to support your answer. *(chap3.pdf, p.3, 34)*

**Q3.2** A trapezoidal clock signal has breakpoints $f_1 = 1/(\pi\tau)$ and $f_2 = 1/(\pi\tau_r)$. Sketch the spectral envelope on a log-log (Bode-style) plot, labeling the slopes in each region. *(chap3.pdf, p.34)*

**Q3.3** For a 50% duty cycle clock signal, why are even harmonics theoretically zero? *(chap3.pdf, p.14, 31)*

**Q3.4** Reducing the duty cycle of a clock signal (shorter pulse width) lowers the DC level but does not change the high-frequency content of the spectrum. Explain why. *(chap3.pdf, p.39)*

**Q3.5** What is the difference between a peak detector and a quasi-peak detector in a spectrum analyzer? Why does the regulatory standard use quasi-peak? *(chap3.pdf, p.46)*

**Q3.6** Describe the power spectral density (PSD) of a PCM-NRZ data signal. What does the delta function at DC represent physically? *(chap3.pdf, p.52)*

---

### Short Calculations — Chapter 3

**Q3.7** A trapezoidal clock waveform has: $A = 5$ V, $T = 20$ ns, $\tau = 8$ ns, $\tau_r = 2$ ns.

(a) Find $f_0$, $f_1$, $f_2$, and BW.  
(b) Find the DC (average) level $c_0$.  
(c) State the slope of the envelope for $f > f_2$.

*(chap3.pdf, p.34, 37)*

**Q3.8** For a rectangular pulse train with $A = 3$ V, $\tau = 10$ ns, $T = 100$ ns:

(a) Find $|c_n|$ at $n = 1$ ($f = 10$ MHz).  
(b) Find $|c_n|$ at $n = 5$ ($f = 50$ MHz).

*(chap3.pdf, p.12)*

**Q3.9** A PCM-NRZ signal has bit period $T = 1$ ns and amplitude $X_0 = 3.3$ V.

(a) Find the bit rate (in Gbps).  
(b) At what frequency is the first null in the sinc-squared component of the PSD?  
(c) Write the PSD $G_x(f)$ with numerical values substituted.

*(chap3.pdf, p.52)*

---

### True/False — Chapter 3

**Q3.10** Increasing the rise time of a clock signal (making edges slower) reduces its high-frequency emissions. **T / F** *(chap3.pdf, p.35)*

**Q3.11** For a PCM-NRZ signal with equal probability of 0 and 1, the PSD has a DC delta function. **T / F** *(chap3.pdf, p.52)*

**Q3.12** The bandwidth of a digital signal is $\text{BW} = 1/T$ where $T$ is the clock period. **T / F** *(chap3.pdf, p.37)*

**Q3.13** For a 50% duty cycle clock, odd harmonics are zero and even harmonics are nonzero. **T / F** *(chap3.pdf, p.14)*

---

### Multiple Choice — Chapter 3

**Q3.14** A clock signal has rise time $\tau_r = 0.5$ ns. Its bandwidth is approximately:  
(A) 0.5 GHz  (B) 1 GHz  (C) 2 GHz  (D) 4 GHz

*(chap3.pdf, p.37)*

**Q3.15** The slope of the trapezoidal spectral bound above the second breakpoint $f_2$ is:  
(A) 0 dB/decade  (B) −20 dB/decade  (C) −40 dB/decade  (D) −60 dB/decade

*(chap3.pdf, p.34)*

**Q3.16** If the pulse width $\tau$ is doubled (duty cycle doubled) while keeping $\tau_r$ constant, the second spectral breakpoint $f_2$:  
(A) doubles  (B) halves  (C) stays the same  (D) quadruples

*(chap3.pdf, p.34)*
>>>>>>> c5b0b435f3af3f08f08cea2c9c10c79f92a8dbe0

---

## Chapter 4: Transmission Lines

### Conceptual Questions

<<<<<<< HEAD
**Q4.1** *(chap4.pdf, p.3)*
What are the two main effects that make a conductor at high frequencies behave as a transmission line rather than a simple wire?

**Q4.2** *(chap4.pdf, p.7)*
What physical phenomenon causes the per-unit-length resistance of a transmission line to increase significantly at GHz frequencies?

**Q4.3** *(chap4.pdf, pp.4--5)*
Why is a coaxial cable non-dispersive while a microstrip is dispersive? Relate your answer to the medium surrounding the conductors.

**Q4.4** *(chap4.pdf, p.12)*
For a TEM-mode transmission line in a homogeneous medium, write the relationship between the per-unit-length inductance $l$, capacitance $c$, and the medium parameters $\mu$ and $\varepsilon$. What does this imply about the phase velocity?

**Q4.5** *(chap4.pdf, p.35)*
The current reflection coefficient is the **negative** of the voltage reflection coefficient. Explain physically why this makes sense (consider what happens to current direction upon reflection from an open circuit vs. a short circuit).

**Q4.6** *(chap4.pdf, pp.54--55)*
Compare series matching and parallel matching. For each: (a) state the design condition, (b) state whether the load sees the full source voltage, (c) state whether the matching resistor consumes power.

**Q4.7** *(chap4.pdf, p.59)*
State both forms of the criterion for when a transmission line can be treated as a lumped element. Express one criterion in terms of rise time and one in terms of electrical length.

**Q4.8** *(chap4.pdf, p.87)*
Explain why dielectric loss increases directly with frequency while skin-effect resistance increases only with $\sqrt{f}$. What does this mean for which loss mechanism dominates at very high frequencies?

**Q4.9** *(chap4.pdf, pp.92--94)*
For a typical PCB above what frequency is the low-loss approximation valid? Above what frequency does $\beta$ dispersion disappear? Does $\alpha$ dispersion ever disappear?

### Short Calculation

**Q4.10** *(chap4.pdf, pp.18--20)*
Two 1 mm radius wires are separated by 20 mm centre-to-centre. Find the approximate per-unit-length inductance $l$ and capacitance $c$ in air ($\varepsilon_r = \mu_r = 1$).
(Hint: use the approximate formulas valid for $d \gg a$.)

**Q4.11** *(chap4.pdf, pp.25--26)*
A coaxial cable has inner radius $a = 1\text{ mm}$ and outer radius $b = 5\text{ mm}$. The dielectric has $\varepsilon_r = 2.25$. Find:
(a) $l$ [H/m], (b) $c$ [F/m], (c) $Z_C$ [$\Omega$], (d) $v$ [m/s].

**Q4.12** *(chap4.pdf, pp.34--37)*
A lossless line has $Z_C = 75\,\Omega$, $v = 2\times10^8\text{ m/s}$, length $L = 30\text{ cm}$. The source is $V_S = 10\text{ V}$ step with $Z_S = 75\,\Omega$. The load is $Z_L = 300\,\Omega$.
(a) Find $T_D$.
(b) Find $V^+_{\text{init}}$.
(c) Find $\Gamma_L$ and $\Gamma_S$.
(d) Find the load voltage at $t = T_D$, $t = 3T_D$, and $t = \infty$.

**Q4.13** *(chap4.pdf, pp.59--63)*
A line has $T_D = 0.3\text{ ns}$. A signal with $\tau_r = 2\text{ ns}$ drives the line. Does the line distort the signal significantly? Justify with the criterion.

**Q4.14** *(chap4.pdf, p.77)*
A line has $Z_C = 50\,\Omega$ and is terminated with $Z_L = 150 + j50\,\Omega$.
(a) Find $|\Gamma_L|$.
(b) Find the VSWR.
(c) Find the fraction of incident power delivered to the load.

**Q4.15** *(chap4.pdf, pp.82--83)*
A 1 mm radius copper wire ($\sigma = 5.8\times10^7\text{ S/m}$) carries current at 100 MHz.
(a) Find the skin depth $\delta$.
(b) Is the high-frequency resistance formula applicable (i.e. is $r_w \gg \delta$)?
(c) Find the per-unit-length resistance $r_{hf}$.
=======
**Q4.1** Write the two Telegrapher's equations (first-order coupled form) for a lossless transmission line and identify the physical law (KVL or KCL) behind each. *(chap4.pdf, p.8–9)*

**Q4.2** What does it mean for a transmission line to support a TEM wave? What restriction does this place on field components in the direction of propagation? *(chap4.pdf, p.11)*

**Q4.3** Explain the physical meaning of the characteristic impedance $Z_C = \sqrt{l/c}$. Why is it important for signal integrity? *(chap4.pdf, p.28, 34)*

**Q4.4** For each of the three special load cases (open circuit, short circuit, matched), state the reflection coefficient $\Gamma_L$ and describe what happens to an incident pulse. *(chap4.pdf, p.35)*

**Q4.5** What is the criterion for a transmission line to be negligible (treated as a simple wire)? Express it in terms of rise time and time delay. *(chap4.pdf, p.59)*

**Q4.6** Compare series termination and parallel termination for eliminating reflections. What are the trade-offs? *(chap4.pdf, p.54–55)*

**Q4.7** Explain what happens to conductor resistance as frequency increases, and why. How does skin depth relate to this? *(chap4.pdf, p.82–83)*

**Q4.8** Define loss tangent $\tan\theta$ and explain how dielectric loss (conductance $g$) differs from skin-effect loss (resistance $r$) in terms of frequency dependence. *(chap4.pdf, p.85–87)*

---

### Short Calculations — Chapter 4

**Q4.9** A transmission line has $Z_C = 75\,\Omega$ and is driven by a source with $R_S = 150\,\Omega$ and $V_S = 6$ V (step). The load is $R_L = 25\,\Omega$.

(a) Find $\Gamma_L$ and $\Gamma_S$.  
(b) Find the initially launched voltage $V^+$.  
(c) Find the load voltage immediately after the first arrival ($t = T_D^+$).

*(chap4.pdf, p.35, 37)*

**Q4.10** A lossless 50 Ω line has $v = 2\times10^8$ m/s and $\mathscr{L} = 0.5$ m. At $f = 1$ GHz, find:

(a) The phase constant $\beta$.  
(b) $\beta\mathscr{L}$ in radians.  
(c) The input impedance for an **open-circuit** load ($Z_L \to \infty$).

*(chap4.pdf, p.74, 76)*

**Q4.11** A 50 Ω transmission line is terminated with $Z_L = 100 + j50\,\Omega$. Find $|\Gamma_L|$ and VSWR. *(chap4.pdf, p.74, 77)*

**Q4.12** Check the transmission-line negligibility criterion for:

(a) $\tau_r = 5$ ns, $\mathscr{L} = 10$ cm, $v = 2\times10^8$ m/s, $\epsilon_r' \approx 2.25$.  
(b) $\tau_r = 0.5$ ns, same line.

*(chap4.pdf, p.59)*

**Q4.13** A stripline PCB trace has $Z_C = 50\,\Omega$ and $\epsilon_r = 4.0$. A CMOS gate with output resistance $R_S = 20\,\Omega$ drives it. What series resistor value should be added to achieve series matching? *(chap4.pdf, p.54)*

**Q4.14** Find the skin depth in copper ($\sigma = 5.8\times10^7$ S/m) at:

(a) $f = 1$ MHz  
(b) $f = 1$ GHz  

How does skin depth change between these frequencies?

*(chap4.pdf, p.82)*

**Q4.15** A lossy transmission line has $r = 0.5\,\Omega$/m, $g = 10^{-4}$ S/m, $Z_C = 50\,\Omega$. Using the low-loss approximation, find $\alpha$. Then find the cable loss for $\mathscr{L} = 3$ m. *(chap4.pdf, p.91, 89)*

---

### True/False — Chapter 4

**Q4.16** For an open-circuit load, the voltage reflection coefficient is $\Gamma_L = +1$. **T / F** *(chap4.pdf, p.35)*

**Q4.17** The product $lc$ depends on the geometry of the transmission line, not the surrounding medium. **T / F** *(chap4.pdf, p.12)*

**Q4.18** A matched load ($R_L = Z_C$) eliminates reflections and produces a clean time-delayed replica of the source waveform at the load. **T / F** *(chap4.pdf, p.43)*

**Q4.19** VSWR = 1 corresponds to a perfectly matched line. **T / F** *(chap4.pdf, p.77)*

**Q4.20** Skin depth increases with frequency ($\delta \propto \sqrt{f}$). **T / F** *(chap4.pdf, p.82)*

**Q4.21** In the low-loss approximation, the phase constant $\beta \approx \omega\sqrt{lc}$, which is linear in frequency — meaning no phase dispersion. **T / F** *(chap4.pdf, p.91)*

---

### Multiple Choice — Chapter 4

**Q4.22** A 50 Ω line is short-circuit terminated. The reflection coefficient and VSWR are:  
(A) $\Gamma_L = +1$, VSWR = ∞  
(B) $\Gamma_L = -1$, VSWR = ∞  
(C) $\Gamma_L = 0$, VSWR = 1  
(D) $\Gamma_L = -1$, VSWR = 1

*(chap4.pdf, p.35, 77)*

**Q4.23** The telegrapher's equation $\partial V/\partial z = -l\,\partial I/\partial t$ is derived by applying:  
(A) KCL at a node  
(B) KVL around a loop  
(C) Gauss's law  
(D) Faraday's law in integral form

*(chap4.pdf, p.8)*

**Q4.24** A signal with rise time $\tau_r = 2$ ns travels on a line with $T_D = 0.1$ ns. The line:  
(A) Must be analyzed as a transmission line  
(B) Can be treated as a lumped element ($\tau_r > 10T_D$)  
(C) Requires Maxwell's equations  
(D) None of the above

*(chap4.pdf, p.59)*

**Q4.25** At high frequencies, the resistance per unit length $r$ of a wire scales approximately as:  
(A) Constant (independent of $f$)  
(B) $\propto f$  
(C) $\propto \sqrt{f}$  
(D) $\propto f^2$

*(chap4.pdf, p.83)*
>>>>>>> c5b0b435f3af3f08f08cea2c9c10c79f92a8dbe0

---

## Answers

<<<<<<< HEAD
### Chapter 1 Answers

**A1.1** Three criteria *(chap1.pdf, p.4)*: (1) does not cause interference with others; (2) is not susceptible to others; (3) does not interfere with itself.

**A1.2** False. *(chap1.pdf, p.5)* Receiving an unintended signal constitutes interference only if the receiver **behaves in an undesired manner**. Mere coupling is not interference if the system still works correctly.

**A1.3** *(chap1.pdf, p.6)* (1) Suppress source, (2) attenuate coupling path, (3) harden receptor. The source fix works because it reduces the problem at the root before it propagates.

**A1.4** *(chap1.pdf, p.7)* Radiated emissions, radiated susceptibility, conducted emissions, conducted susceptibility. Conducted emissions and conducted susceptibility involve the power cable.

**A1.5** *(chap1.pdf, p.9)* ESD: static discharge; can approach 25 kV. Concern in design because it can damage semiconductors or cause malfunction even if not government-regulated like emissions.

**A1.6** *(chap1.pdf, p.15)* Safe to use lumped-circuit theory when $L < \lambda/10$.

**A1.7** $v = 3\times10^8/2 = 1.5\times10^8\text{ m/s}$; $\lambda = 1.5\times10^8/(3\times10^9) = 0.05\text{ m} = 5\text{ cm}$; max lumped length = $5\text{ cm}/10 = 0.5\text{ cm}$. *(chap1.pdf, pp.20--21)*

**A1.8** (a) $10\log 500 = 27.0\text{ dB}$; (b) $20\log 30 = 29.5\text{ dB}$; (c) $10\log(1/4) = -6.0\text{ dB}$; (d) $20\log(1/4) = -12.0\text{ dB}$. *(chap1.pdf, pp.25--26)*

**A1.9** $-5 - 4 + 35 - 2 = +24\text{ dBm}$. *(chap1.pdf, p.28)*

**A1.10** $P_L = 0.5\text{ dB}/50\text{ m} = 0.01\text{ dB/m}$; $\alpha = 0.01/8.686 = 1.15\times10^{-3}\text{ Np/m}$. *(chap1.pdf, p.30)*

**A1.11** dBm = $80 - 107 = -27\text{ dBm}$. *(chap1.pdf, p.30)*

**A1.12** $v = v_0/2 = 1.5\times10^8\text{ m/s}$; $\beta = 2\pi\times3\times10^9/(1.5\times10^8) = 125.7\text{ rad/m}$; $\Delta\phi = 125.7\times0.045 = 5.66\text{ rad} \approx 324^\circ$. *(chap1.pdf, p.17)*

---

### Chapter 2 Answers

**A2.1** *(chap2.pdf, p.6)* Class A: commercial/industrial; Class B: residential. Class B is stricter because residential users lack expertise/resources to deal with interference.

**A2.2** *(chap2.pdf, p.7)* (a) 150 kHz -- 30 MHz (LISN); (b) 30 MHz -- 40 GHz (OATS or SAC).

**A2.3** $20\log(10/3) = 10.46\text{ dB}$; Class A is $\approx 10$ dB less stringent. *(chap2.pdf, p.13)*

**A2.4** *(chap2.pdf, p.16)* CISPR 22/EU directive was first to require susceptibility (immunity) testing for commercial products --- FCC only requires emission limits.

**A2.5** *(chap2.pdf, pp.25--27)* Top+sides: absorbers; floor: ground plane. FCC: quasi-peak; MIL: peak.

**A2.6** *(chap2.pdf, pp.28--32)* (1) Present constant 50 $\Omega$ to EUT; (2) reject 60 Hz, pass RF noise to receiver. Constant impedance is required so the measurement gives unambiguous, repeatable results.

**A2.7** False. *(chap2.pdf, p.41)* The preferred approach is "paper work before layout" --- address EMC during design/planning, not after the board is fabricated.

**A2.8** *(chap2.pdf, p.17)* MIL-STD-461E spans much larger frequency ranges and is more complex, but requirements can be waived/tailored --- unlike FCC/CISPR which are fixed.

---

### Chapter 3 Answers

**A3.1** *(chap3.pdf, p.3)* Rise/fall time. Faster edges produce higher-frequency spectral content, which radiates more efficiently from PCB traces acting as antennas.

**A3.2** *(chap3.pdf, p.4)* If the data were deterministic, no information would be conveyed --- the receiver could predict it in advance.

**A3.3** *(chap3.pdf, p.9)* $c_n^+ = 2|c_n|$ for $n > 0$; $c_0$ is unchanged (already real).

**A3.4** *(chap3.pdf, p.14)* Even harmonics vanish. At $D = 1/2$: $\sin(n\pi/2) = 0$ for even $n$ $\to$ $c_n = 0$. Physically, the +ve and -ve pulse contributions cancel for even harmonics.

**A3.5** *(chap3.pdf, pp.33--34)* Flat at $2AD$ for $f < 1/(\pi\tau)$; -20 dB/decade for $1/(\pi\tau) < f < 1/(\pi\tau_r)$; -40 dB/decade above $1/(\pi\tau_r)$. Increasing rise time is most effective.

**A3.6** $BW \approx 1/(2\times10^{-9}) = 500\text{ MHz}$; first null at $1/\tau_r = 500\text{ MHz}$. *(chap3.pdf, p.37)*

**A3.7** *(chap3.pdf, pp.40--42)* PCB trace inductance and capacitance. Ringing adds emission peaks at the ringing frequency. Remedies: series resistor at gate output, ferrite beads.

**A3.8** *(chap3.pdf, p.46)* QP responds more quickly to rising signals than falling; gives a weighted average that accounts for annoyance level. Required by FCC and CISPR.

**A3.9** (a) $D = 5/20 = 0.25$; (b) $c_0 = AD = 5 \times 0.25 = 1.25\text{ V}$; (c) $c_3 = 5\times0.25\times|\sin(3\pi\times0.25)/(3\pi\times0.25)| = 1.25\times|\sin(0.75\pi)/(0.75\pi)| = 1.25\times(0.7071/2.356) = 0.375\text{ V}$. *(chap3.pdf, pp.11--12)*

**A3.10** (a) $2AD = 2\times5\times0.25 = 2.5\text{ V}$; (b) $f_1 = 1/(\pi\times5\times10^{-9}) = 63.7\text{ MHz}$; (c) $f_2 = 1/(\pi\times10^{-9}) = 318\text{ MHz}$; (d) $BW = 1/\tau_r = 1\text{ GHz}$. *(chap3.pdf, pp.33--34, 37)*

**A3.11** 2 GHz is in the -40 dB/decade region (above $f_2 = 318\text{ MHz}$). From $f_2$ to 2 GHz: $\log(2000/318) = 0.799$ decades $\to$ $40\times0.799 = 32\text{ dB}$ extra drop beyond the -20 dB/decade drop from $f_1$ to $f_2$. Drop $f_1$ to $f_2$: $20\log(318/63.7) = 20\times0.699 = 14\text{ dB}$. Total drop at 2 GHz: $14 + 32 = 46\text{ dB}$ below DC level. *(chap3.pdf, pp.33--36)*

**A3.12** (a) Clock 1: $2\times3.3\times0.5 = 3.3\text{ V}$; Clock 2: $2\times3.3\times0.1 = 0.66\text{ V}$ (14 dB lower). (b) Clock 1: $f_1 = 1/(\pi\times5\text{ ns}) = 63.7\text{ MHz}$; Clock 2: $f_1 = 1/(\pi\times1\text{ ns}) = 318\text{ MHz}$. (c) No change --- both have same $\tau_r = 0.5\text{ ns}$ $\to$ same $f_2 = 637\text{ MHz}$ $\to$ same -40 dB/decade high-frequency slope. *(chap3.pdf, pp.38--39)*

**A3.13** (a) $c_n^{y} = c_n\,e^{-jn\omega_0\times3\times10^{-9}} = c_n\,e^{-j2\pi n(3/10)} = c_n\,e^{-j0.6\pi n}$. (b) No --- $|e^{-j\theta}| = 1$ for all $\theta$, so magnitude of every harmonic is unchanged. *(chap3.pdf, p.20)*

---

### Chapter 4 Answers

**A4.1** *(chap4.pdf, p.3)* (1) Time delay: $T_D = L/v$; (2) reflections from impedance mismatch.

**A4.2** *(chap4.pdf, p.82)* Skin effect --- current concentrates in a thin annulus of depth $\delta = 1/\sqrt{\pi f\mu\sigma}$, reducing the effective cross-section.

**A4.3** *(chap4.pdf, pp.4--5)* Coaxial: fields entirely inside the homogeneous dielectric fill $\to$ $lc$ is constant, $v$ is constant $\to$ non-dispersive. Microstrip: field partially in air and partially in dielectric $\to$ effective permittivity varies with frequency $\to$ dispersive.

**A4.4** *(chap4.pdf, p.12)* $lc = \mu\varepsilon$; therefore $v = 1/\sqrt{lc} = 1/\sqrt{\mu\varepsilon}$ is determined entirely by the medium properties.

**A4.5** Open circuit ($Z_L = \infty$): $\Gamma_V = +1$ (voltage doubles), $\Gamma_I = -1$ (current reverses --- it must be zero at the open end). Short circuit ($Z_L = 0$): $\Gamma_V = -1$ (voltage = 0), $\Gamma_I = +1$.

**A4.6** *(chap4.pdf, pp.54--55)* Series: $Z_S + R = Z_C$; load voltage = full $V_0$; no steady-state power loss. Parallel: $R = Z_C$ (for high-Z load); load voltage < source; resistor draws current and dissipates power.

**A4.7** *(chap4.pdf, p.59)* (1) $\tau_r > 10\,T_D$ (rise time criterion); (2) $L < \lambda/10$ (electrical-length criterion).

**A4.8** *(chap4.pdf, p.87)* Dielectric: $g = \omega c\tan\theta \propto f$ (20 dB/decade). Skin effect: $r \propto \sqrt{f}$ (10 dB/decade). At very high frequencies, dielectric loss overtakes conductor loss.

**A4.9** *(chap4.pdf, pp.92--94)* Low-loss valid above ~5 MHz; $\beta$ dispersion disappears above ~20 MHz; $\alpha$ dispersion from skin effect persists above 20 MHz (no, it never completely disappears in the skin-effect region).

**A4.10** $l \approx (\mu_0/\pi)\ln(d/a) = (4\pi\times10^{-7}/\pi)\ln(20/1) = 4\times10^{-7}\times2.996 = 1.198\,\mu\text{H/m}$; $c \approx \pi\varepsilon_0/\ln(d/a) = \pi\times8.854\times10^{-12}/2.996 = 9.28\text{ pF/m}$. *(chap4.pdf, pp.19--22)*

**A4.11** (a) $l = (\mu_0/2\pi)\ln(5) = (2\times10^{-7})\times1.609 = 321.8\text{ nH/m}$; (b) $c = 2\pi\varepsilon_0\varepsilon_r/\ln(5) = 2\pi\times8.854\times10^{-12}\times2.25/1.609 = 77.7\text{ pF/m}$; (c) $Z_C = \sqrt{l/c} = \sqrt{321.8\times10^{-9}/77.7\times10^{-12}} = \sqrt{4141} = 64.3\,\Omega$; (d) $v = 1/\sqrt{lc} = 1/\sqrt{321.8\times10^{-9}\times77.7\times10^{-12}} = 2\times10^8\text{ m/s} = v_0/\sqrt{2.25} = v_0/1.5$. *(chap4.pdf, pp.25--27)*

**A4.12** (a) $T_D = 0.3/(2\times10^8) = 1.5\text{ ns}$; (b) $V^+_{\text{init}} = 10\times75/(75+75) = 5\text{ V}$; (c) $\Gamma_L = (300-75)/(300+75) = 225/375 = 0.6$; $\Gamma_S = (75-75)/(75+75) = 0$; (d) $V_L(T_D) = 5\times(1+0.6) = 8\text{ V}$; since $\Gamma_S = 0$, no re-reflection $\to$ $V_L(3T_D) = 8\text{ V}$; $V_L(\infty) = 10\times300/375 = 8\text{ V}$ (consistent). *(chap4.pdf, pp.34--37)*

**A4.13** $\tau_r/T_D = 2\text{ ns}/0.3\text{ ns} = 6.7 < 10$. The criterion is NOT met. The line will significantly distort the waveform (overshoot expected). *(chap4.pdf, p.59)*

**A4.14** $\Gamma_L = (150+j50-50)/(150+j50+50) = (100+j50)/(200+j50)$; $|100+j50| = \sqrt{100^2+50^2} = 111.8$; $|200+j50| = \sqrt{200^2+50^2} = 206.2$; $|\Gamma_L| = 111.8/206.2 = 0.542$. VSWR $= (1+0.542)/(1-0.542) = 1.542/0.458 = 3.37$. Power to load $= 1 - |\Gamma_L|^2 = 1 - 0.294 = 0.706 = 70.6\%$. *(chap4.pdf, pp.77--78)*

**A4.15** (a) $\delta = 1/\sqrt{\pi\times10^8\times4\pi\times10^{-7}\times5.8\times10^7} = 1/\sqrt{\pi\times4\pi\times10^{8}\times5.8} = 1/\sqrt{7.27\times10^9} = 6.63\times10^{-6}\text{ m} = 6.63\,\mu\text{m}$; (b) $r_w = 1\text{ mm} = 1000\,\mu\text{m} \gg 6.63\,\mu\text{m}$ $\to$ yes, HF formula applies; (c) $r_{hf} = 1/(2\pi r_w\sigma\delta) = 1/(2\pi\times10^{-3}\times5.8\times10^7\times6.63\times10^{-6}) = 1/(2\pi\times384.5) = 4.14\times10^{-4}\,\Omega/\text{m} = 0.414\text{ m}\Omega/\text{m}$. *(chap4.pdf, pp.82--83)*
=======
### Chapter 1

**A1.1** A system is EMC when it: (1) does not cause interference with others; (2) is not susceptible to interference from others; (3) does not interfere with itself. *(chap1.pdf, p.4)*

**A1.2** Source → Path → Receptor. Three prevention methods: (1) suppress emission at source, (2) attenuate the coupling path, (3) make receptor less susceptible. Fixing the source is cheapest and most effective because it prevents the problem before it propagates. *(chap1.pdf, p.5–6)*

**A1.3** (1) Radiated emissions: noisy component radiates outward. (2) Radiated susceptibility: external radiation couples in. (3) Conducted emissions: noise exits via cable. (4) Conducted susceptibility: noise enters via cable. *(chap1.pdf, p.7)*

**A1.4** At $f = 1$ GHz in air: $\lambda = v_0/f = 0.3$ m. $k = 0.05/0.3 = 0.167$. Since $k > 0.1$ and approaching 0.2, transmission-line analysis is advisable. *(chap1.pdf, p.21)*

**A1.5** Two structures with the same physical size but in different media have different electrical sizes ($k = \mathscr{L}/\lambda$, and $\lambda$ changes with $\epsilon_r$). A structure's ability to radiate and its need for distributed analysis depends on $k$, not physical length. *(chap1.pdf, p.15, 21)*

**A1.6** (a) $v = v_0/\sqrt{4} = 1.5\times10^8$ m/s. (b) $T_D = 0.20/(1.5\times10^8) = 1.33$ ns. (c) $\lambda = v/f = 1.5\times10^8/(7.5\times10^8) = 0.2$ m. (d) $k = 0.20/0.20 = 1.0$. The trace is one full wavelength long — strongly distributed. *(chap1.pdf, p.16–21)*

**A1.7** (a) $20\log_{10}(100) = 40$ dB. (b) $10\log_{10}(0.001) = -30$ dB. (c) $-14 + 107 = 93$ dBµV. (d) $87 - 107 = -20$ dBm. *(chap1.pdf, p.25–27, 30)*

**A1.8** Cable loss $= 8.686\times0.08\times5 = 3.47$ dB. *(chap1.pdf, p.30)*

**A1.9** Total gain $= 20 - 6 + 14 = 28$ dB. Output $= -10 + 28 = 18$ dBm. *(chap1.pdf, p.28)*

**A1.10** False. In a denser dielectric, $v$ is smaller, so $\lambda = v/f$ is **shorter**. *(chap1.pdf, p.20–21)*

**A1.11** False. Doubling the ratio adds 6 dB ($20\log_{10}2 \approx 6$), not doubles the dB value. *(chap1.pdf, p.26–27)*

**A1.12** False. $T_D = \mathscr{L}/v$ depends on length and medium, not frequency (for lossless line). *(chap1.pdf, p.16)*

**A1.13** True. *(chap1.pdf, p.6)*

**A1.14** (C) 1.0. At 3 GHz, $\lambda = 0.1$ m in air. $k = 0.10/0.10 = 1.0$. *(chap1.pdf, p.21)*

**A1.15** (D). When $R_\text{in} = R_L$, power gain in dB $= 20\log_{10}(V_\text{out}/V_\text{in})$, same as voltage gain. *(chap1.pdf, p.26)*

---

### Chapter 2

**A2.1** Class A = commercial/industrial; Class B = residential. Class B is **more stringent** because residential users lack technical expertise or resources to resolve interference problems. *(chap2.pdf, p.6)*

**A2.2** (1) Conducted emissions: noise via AC power cord, 150 kHz–30 MHz, measured with LISN. (2) Radiated emissions: electromagnetic radiation, 30 MHz–40 GHz, measured in SAC or OATS. *(chap2.pdf, p.7)*

**A2.3** The LISN is inserted between the power net and EUT. It (1) blocks 60 Hz from reaching the receiver, and (2) passes 150 kHz–30 MHz noise to the receiver. Its ~50 Ω impedance ensures standardized, repeatable measurements. *(chap2.pdf, p.29, 32)*

**A2.4** FCC radiated: 30 MHz–40 GHz, Class B at 3 m, Class A at 10 m. CISPR 22 radiated: 30 MHz–1 GHz, both classes at 10 m. *(chap2.pdf, p.11, 14)*

**A2.5** FCC and CISPR 22 are legal requirements that cannot be waived — non-compliance means a product cannot be sold. MIL-STD-461E can be tailored or waived by the procuring military authority for specific platforms or applications. *(chap2.pdf, p.5, 17)*

**A2.6** $\Delta E = 20\log_{10}(10/3) \approx 10.46$ dB. Class A at 3 m: $39 + 10.46 = 49.46$ dBµV/m. Class B at 3 m: 40 dBµV/m. Class B is **more stringent** (lower limit = stricter). *(chap2.pdf, p.13)*

**A2.7** The margin at 3 m is **not the same** as at 10 m — FCC Class B is measured at 3 m, Class A at 10 m. A Class A product passing at 10 m by 5 dB means it is 5 dB below 39 dBµV/m = 34 dBµV/m at 10 m = 44.5 dBµV/m at 3 m. The Class B limit at 3 m is 40 dBµV/m. The product **fails** Class B by 4.5 dB. *(chap2.pdf, p.11, 13)*

**A2.8** Measured: 38.5 dBµV/m; limit: 43.5 dBµV/m. Margin = $43.5 - 38.5 = 5$ dB below limit → **passes by 5 dB**. *(chap2.pdf, p.11, 33)*

**A2.9** True. *(chap2.pdf, p.15)*

**A2.10** True. When normalized to 3 m, Class A = Class A (10 m) + 10.5 dB, which is still about 10 dB above the Class B limit. *(chap2.pdf, p.13)*

**A2.11** False. CISPR 22 covers up to **1 GHz**; FCC goes up to 40 GHz. *(chap2.pdf, p.14)*

**A2.12** True (for aircraft external/safety-critical: 200 V/m). *(chap2.pdf, p.20)*

**A2.13** (B) 150 kHz – 30 MHz. *(chap2.pdf, p.7)*

**A2.14** (C) $+10.5$ dB ($= 20\log_{10}(10/3)$). *(chap2.pdf, p.13)*

---

### Chapter 3

**A3.1** The spectral envelope has two breakpoints: $f_1 = 1/(\pi\tau)$ from the pulse width, and $f_2 = 1/(\pi\tau_r)$ from the rise time. Above $f_2$, the envelope falls at $-40$ dB/decade. The clock frequency determines the harmonic spacing ($f_0 = 1/T$) but does not change $f_2$. Faster edges (smaller $\tau_r$) push $f_2$ higher, generating more energy at high frequencies. *(chap3.pdf, p.3, 34)*

**A3.2** Sketch: flat at $2A\tau/T$ for $f < f_1$; drops at $-20$ dB/dec between $f_1$ and $f_2$; drops at $-40$ dB/dec above $f_2$. Label $f_1 = 1/(\pi\tau)$ and $f_2 = 1/(\pi\tau_r)$. *(chap3.pdf, p.34)*

**A3.3** For 50% duty cycle, $\tau = T/2$. The first sinc factor in $c_n$ becomes $|\sin(n\pi\tau/T)| = |\sin(n\pi/2)|$, which is zero for all even $n$. *(chap3.pdf, p.14)*

**A3.4** Reducing duty cycle moves $f_1 = 1/(\pi\tau)$ higher (since $\tau$ is smaller), but $f_2 = 1/(\pi\tau_r)$ depends only on $\tau_r$, which is unchanged. The high-frequency roll-off (above $f_2$) is identical regardless of duty cycle. *(chap3.pdf, p.39)*

**A3.5** A peak detector captures the peak amplitude (slow discharge). A quasi-peak detector has a discharge resistor so its reading falls between peak and average — it weights pulsed interference less than CW. QP is used in regulations because it better represents the subjective nuisance of different interference types. *(chap3.pdf, p.46)*

**A3.6** The PSD has: (1) a delta function at DC representing the average power ($X_0^2/4$ per unit bandwidth); (2) a continuous sinc-squared component representing the power distributed across frequency due to random bit transitions. The DC delta function exists because even random data has a nonzero average value ($X_0/2$). *(chap3.pdf, p.52)*

**A3.7** (a) $f_0 = 1/T = 50$ MHz; $f_1 = 1/(\pi\times8\times10^{-9}) = 39.8$ MHz; $f_2 = 1/(\pi\times2\times10^{-9}) = 159$ MHz; BW $= 1/\tau_r = 500$ MHz. (b) $c_0 = A\tau/T = 5\times8/20 = 2$ V. (c) $-40$ dB/decade. *(chap3.pdf, p.34, 37)*

**A3.8** $|c_n| = \frac{A\tau}{T}\left|\frac{\sin(\pi n\tau/T)}{n\pi\tau/T}\right|$ where $A=3$ V, $\tau = 10$ ns, $T = 100$ ns.

(a) $n=1$: $|c_1| = \frac{3\times10}{100}\left|\frac{\sin(\pi\times0.1)}{\pi\times0.1}\right| = 0.3\times\left|\frac{\sin(0.314)}{0.314}\right| = 0.3\times0.984 = 0.295$ V.

(b) $n=5$: $|c_5| = 0.3\times\left|\frac{\sin(5\pi\times0.1)}{5\pi\times0.1}\right| = 0.3\times\left|\frac{\sin(\pi/2)}{\pi/2}\right| = 0.3\times\frac{2}{\pi} = 0.191$ V.

*(chap3.pdf, p.12)*

**A3.9** (a) Bit rate $= 1/T = 1/10^{-9} = 1$ Gbps. (b) First null at $f = 1/T = 1$ GHz. (c) $G_x(f) = \frac{(3.3)^2}{4}\delta(f) + \frac{(3.3)^2\times10^{-9}}{4}\frac{\sin^2(\pi f\times10^{-9})}{(\pi f\times10^{-9})^2} = 2.72\,\delta(f) + 2.72\times10^{-9}\frac{\sin^2(\pi f\times10^{-9})}{(\pi f\times10^{-9})^2}$ W/Hz. *(chap3.pdf, p.52)*

**A3.10** True. Higher $\tau_r$ → lower $f_2 = 1/(\pi\tau_r)$ → the $-40$ dB/decade slope starts sooner → less energy at high frequencies. *(chap3.pdf, p.35)*

**A3.11** True. *(chap3.pdf, p.52)*

**A3.12** False. BW $= 1/\tau_r$ (rise time, not clock period). *(chap3.pdf, p.37)*

**A3.13** False. For 50% duty cycle, **even harmonics** are zero and odd harmonics are nonzero. *(chap3.pdf, p.14)*

**A3.14** (C) 2 GHz. BW $= 1/\tau_r = 1/(0.5\times10^{-9}) = 2\times10^9$ Hz. *(chap3.pdf, p.37)*

**A3.15** (C) $-40$ dB/decade. *(chap3.pdf, p.34)*

**A3.16** (C) stays the same. $f_2 = 1/(\pi\tau_r)$ depends only on $\tau_r$, not $\tau$. *(chap3.pdf, p.34)*

---

### Chapter 4

**A4.1** KVL: $\partial V/\partial z = -l\,\partial I/\partial t$ *(chap4.pdf, p.8)*; KCL: $\partial I/\partial z = -c\,\partial V/\partial t$ *(chap4.pdf, p.9)*. KVL gives the voltage equation (series inductance drops voltage); KCL gives the current equation (shunt capacitance draws current).

**A4.2** TEM = Transverse ElectroMagnetic. There are no electric or magnetic field components in the direction of propagation ($E_z = 0$, $H_z = 0$). This allows the static-field formulas for $l$ and $c$ to be used. *(chap4.pdf, p.11)*

**A4.3** $Z_C = \sqrt{l/c}$ is the ratio of voltage to current for a single traveling wave. For signal integrity, if the load impedance matches $Z_C$, the wave is fully absorbed — no reflections, no distortion. Any mismatch causes partial reflection, creating signal distortion and overshoot. *(chap4.pdf, p.28, 34)*

**A4.4** Open ($R_L \to \infty$): $\Gamma_L = +1$, wave reflects with same polarity, voltage doubles at load. Short ($R_L = 0$): $\Gamma_L = -1$, wave reflects with reversed polarity, voltage is zero at load. Matched ($R_L = Z_C$): $\Gamma_L = 0$, no reflection, clean waveform at load. *(chap4.pdf, p.35)*

**A4.5** The line can be ignored when $\tau_r > 10T_D$. If rise time is at least 10 times the one-way travel time, the line appears as a lumped element. *(chap4.pdf, p.59)*

**A4.6** Series match ($R_S + R = Z_C$): eliminates reflections; no power dissipated in $R$ at steady state; load voltage may reach full $V_0$. Parallel match ($R \| R_L = Z_C$): eliminates reflections; continuously dissipates power; load voltage is reduced. *(chap4.pdf, p.54–55)*

**A4.7** Current at DC is uniformly distributed across the conductor cross-section. As $f$ increases, skin effect concentrates current in a thin annular shell of thickness $\delta = 1/\sqrt{\pi f\mu_0\sigma}$. Since $\delta \propto 1/\sqrt{f}$, the effective conducting area decreases, so resistance increases as $\sqrt{f}$ (10 dB/decade). *(chap4.pdf, p.82–83)*

**A4.8** Loss tangent: $\tan\theta = \epsilon_r''/\epsilon_r'$. It gives the dielectric conductance $g = \omega c\tan\theta$, which increases **linearly with $f$** (20 dB/decade). Skin-effect resistance $r$ increases as $\sqrt{f}$ (10 dB/decade). So at high enough frequency, dielectric loss dominates over conductor loss. *(chap4.pdf, p.87)*

**A4.9** (a) $\Gamma_L = (25-75)/(25+75) = -50/100 = -0.5$. $\Gamma_S = (150-75)/(150+75) = 75/225 = 1/3$. (b) $V^+ = \frac{75}{150+75}\times6 = \frac{75}{225}\times6 = 2$ V. (c) $V(\mathscr{L},T_D^+) = V^+(1+\Gamma_L) = 2\times(1-0.5) = 1$ V. *(chap4.pdf, p.35, 37)*

**A4.10** (a) $\beta = \omega/v = 2\pi\times10^9/(2\times10^8) = 10\pi = 31.4$ rad/m. (b) $\beta\mathscr{L} = 31.4\times0.5 = 15.7$ rad $= 5\pi$ rad. (c) Open circuit: $Z_L\to\infty$. $Z_\text{in} = Z_C/(j\tan\beta\mathscr{L}) = 50/(j\tan 5\pi) = 50/(j\times0)$. Since $\tan(5\pi) = 0$: $Z_\text{in} \to \infty$ — open circuit (makes sense for line that is 2.5 wavelengths long). *(chap4.pdf, p.74, 76)*

**A4.11** $\Gamma_L = \frac{Z_L - Z_C}{Z_L + Z_C} = \frac{(100+j50)-50}{(100+j50)+50} = \frac{50+j50}{150+j50}$.

$|\Gamma_L| = \frac{|50+j50|}{|150+j50|} = \frac{\sqrt{50^2+50^2}}{\sqrt{150^2+50^2}} = \frac{70.7}{158.1} = 0.447$.

VSWR $= (1+0.447)/(1-0.447) = 1.447/0.553 = 2.62$. *(chap4.pdf, p.74, 77)*

**A4.12** $T_D = \mathscr{L}/v = 0.10/(2\times10^8) = 0.5$ ns.

(a) $\tau_r = 5$ ns, $10T_D = 5$ ns. $\tau_r = 10T_D$ — on the boundary; line effects are just beginning to matter.  
(b) $\tau_r = 0.5$ ns, $10T_D = 5$ ns. $\tau_r < 10T_D$ — **line matters significantly**.

*(chap4.pdf, p.59)*

**A4.13** Series match requires $R_S + R = Z_C$, so $R = Z_C - R_S = 50 - 20 = 30\,\Omega$. *(chap4.pdf, p.54)*

**A4.14** $\delta = 1/\sqrt{\pi f\mu_0\sigma}$ where $\mu_0 = 4\pi\times10^{-7}$ H/m, $\sigma = 5.8\times10^7$ S/m.

(a) At 1 MHz: $\delta = 1/\sqrt{\pi\times10^6\times4\pi\times10^{-7}\times5.8\times10^7} = 1/\sqrt{4\pi^2\times5.8\times10^6} = 1/\sqrt{2.285\times10^8} = 66\,\mu$m.  
(b) At 1 GHz: $\delta = 66\,\mu\text{m}/\sqrt{1000} = 66/31.6 \approx 2.1\,\mu$m.

Skin depth decreases by $\sqrt{1000} \approx 31.6\times$ when frequency increases $1000\times$. *(chap4.pdf, p.82)*

**A4.15** $\alpha \approx \frac{1}{2}(r/Z_C + gZ_C) = \frac{1}{2}(0.5/50 + 10^{-4}\times50) = \frac{1}{2}(0.01 + 0.005) = 0.0075$ Np/m.

Cable loss $= 8.686\times0.0075\times3 = 0.196$ dB. *(chap4.pdf, p.91, 89)*

**A4.16** True. *(chap4.pdf, p.35)*

**A4.17** False. $lc = \mu\epsilon$ — the product depends entirely on the surrounding medium ($\mu$ and $\epsilon$), not the geometry. *(chap4.pdf, p.12)*

**A4.18** True. *(chap4.pdf, p.43)*

**A4.19** True. *(chap4.pdf, p.77)*

**A4.20** False. Skin depth **decreases** as $1/\sqrt{f}$ (i.e., $\delta \propto f^{-1/2}$). *(chap4.pdf, p.82)*

**A4.21** True. *(chap4.pdf, p.91)*

**A4.22** (B) $\Gamma_L = -1$, VSWR = ∞. *(chap4.pdf, p.35, 77)*

**A4.23** (B) KVL around a loop. *(chap4.pdf, p.8)*

**A4.24** (B) Can be treated as lumped — $\tau_r = 2$ ns, $10T_D = 1$ ns, so $\tau_r > 10T_D$. *(chap4.pdf, p.59)*

**A4.25** (C) $\propto \sqrt{f}$ (10 dB/decade). *(chap4.pdf, p.83)*
>>>>>>> c5b0b435f3af3f08f08cea2c9c10c79f92a8dbe0
