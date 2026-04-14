# EMC First Midterm --- Practice Questions

---

## Chapter 1: Introduction to EMC

### Conceptual Questions

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

---

## Chapter 3: Signal Spectra

### Conceptual Questions

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

---

## Chapter 4: Transmission Lines

### Conceptual Questions

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

---

## Answers

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
