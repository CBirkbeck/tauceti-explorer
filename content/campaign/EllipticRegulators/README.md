# Elliptic regulators, explicit K₂ classes and L-values

Complex, Deligne and p-adic regulators of elliptic K₂.

## Canonical ownership and interfaces

- ModularCurvesPartII and ArithmeticGaloisRepresentations supply modular parametrizations and comparison geometry. Generic complex/cohomology comparison is imported; elliptic uniformization and explicit period-normalized regulator identities remain here.
- Bloch's precise CM theorem and its nonzero class remain distinct from full generation of the arithmetic integral part. The final scalar must be transcribed from a legible original Lecture 11; no arbitrary nonzero factor substitutes for it.

**Campaign dependencies:** [EllipticKTheory](../EllipticKTheory/README.md), [Polylogarithms](../Polylogarithms/README.md), [BorelRegulators](../BorelRegulators/README.md), [PadicHodgeRegulators](../PadicHodgeRegulators/README.md), [ModularSymbolsPadicLFunctions](../ModularSymbolsPadicLFunctions/README.md), [ArithmeticGaloisRepresentations](../ArithmeticGaloisRepresentations/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

**Prefix:** ER. **Dependencies:** E, P, R's regulator infrastructure, and D for the p-adic comparison layer. **References:** Bloch, *Higher regulators, algebraic K-theory, and zeta functions of elliptic curves*, all eleven lectures; Handbook II.3; Beilinson's modular-curve regulator theorem and its precise later formulations.

The principal complete worked theorem follows Bloch: an explicit nonzero rational K₂ class and its regulator formula for the stated CM elliptic curves. More general elliptic Beilinson statements and modular constructions are specified separately, so a special-value formula for a constructed class is not mistaken for a proof that it generates all of K₂.

## ER.1 — The analytic elliptic curve and its periods

Construct the complex manifold of a smooth projective elliptic curve and prove complex uniformisation `E(C)≃C/Λ`. Identify invariant differentials, period lattices, homology, the intersection pairing, and the multiplicative presentation `C×/q^Z` for a chosen oriented lattice basis. Prove the relation `q=exp(2πiτ)`, `Im τ>0`, and transformations under a change of basis.

For E over a number field, carry all complex embeddings and the conjugation action. Compare algebraic de Rham cohomology, holomorphic differentials and singular cohomology. The source of the period matrix and its nondegeneracy are the comparison theorem and integration pairing, not a matrix attached as part of a definition.

These analytic results are not supplied by the existing arithmetic EllipticCurves roadmap. Coordinate the general compact-Riemann-surface and comparison theory with any verified supplier; complete the missing elliptic specialisation here.

## ER.2 — Deligne cohomology and the symbol regulator

Construct the real Deligne complex, hypercohomology and its exact sequence in degree two and weight two. Obtain the target

\[
 r_{\mathcal D}:K_2(E)\longrightarrow
 H^2_{\mathcal D}(E_{\mathbb R},\mathbb R(2)).
\]

For a number-field curve, the notation includes the specified embeddings and conjugation invariants. Identify this target with the appropriate period/cohomology quotient and prove its dimension. For E/Q the relevant real regulator target is one-dimensional; the identification with R requires the chosen normalised homology/differential data.

On a symbol construct

\[
 \eta(f,g)=\log|f|\,d\arg(g)-\log|g|\,d\arg(f).
\]

Prove its differential identity, the Steinberg relation through the Bloch–Wigner dilogarithm, and the behaviour around zeros and poles. Use tame-symbol triviality to obtain the period pairing and prove independence of representatives, cuts and punctured cycles. Fix the factor of `2π` and orientation by comparison with the universal Chern/Deligne regulator; do not choose that factor to make the final L-value formula true.

Compare the function-field formula with E.3's restriction image and show that the torsion ambiguity in lifting a number-field symbol has zero real regulator.

## ER.3 — The elliptic dilogarithm and its companion

Define the elliptic Bloch–Wigner dilogarithm by the convergent q-orbit sum and construct the regularised logarithmic companion J_q. Prove convergence, the Bernoulli-polynomial correction, invariance under `z↦qz`, inversion, conjugation and lattice-basis change. Pin Bloch's convention `R_q=J_q+iD_q`.

Formalise both parts of Bloch's regulator argument, not just the D_q identity: Lecture 9's proofs for J_q and D_q, their uniform estimates, the truncation of divisors on annuli and the limiting argument giving the Steinberg relation. The companion is necessary to reproduce the complex regulator formula and to compare different real components correctly.

Establish the Fourier/Kronecker–Eisenstein descriptions by justified interchange of sums and integrals. Where the function is singular, use the explicitly regularised expression rather than an unproved absolutely convergent double series.

## ER.4 — The divisor formula and Bloch's classes

For divisors `(f)=∑m_i[P_i]`, `(g)=∑n_j[Q_j]`, use the convention

\[
 (f)\diamond(g)=\sum_{i,j}m_in_j[Q_j-P_i].
\]

This matches the multiplicative argument `α_i^{-1}β_j` in Bloch's formula; a convention with `P_i−Q_j` requires the corresponding sign change. Prove the formula relating `R_q({f,g})` to evaluation on this divisor. Prove independence of permitted lifts to C×, including the degree-zero and product-one conditions.

Apply the formula to the corrected classes S_a from E.7. Compute their regulator using the actual divisors of Bloch's function ρ and the functions f_a, and show that constant-symbol corrections have the prescribed zero contribution. Establish the finite Fourier transform on C-torsion and the odd-function identities of Lecture 10.

The hypotheses that torsion points are defined over the field and that C is invertible in the relevant geometric setting remain explicit. Extend the result by transfer only after proving the trace formula for the regulator.

## ER.5 — The complete CM example of Bloch

Take E/Q with complex multiplication by the full ring of integers of an imaginary quadratic field of class number one, in the precise setup of Bloch Lecture 11. Construct the associated Hecke character by the CM theory of the elliptic curve and prove Deuring's comparison with its Hasse–Weil L-function. This requires the conductor and the local Euler factors, including bad primes; it does not follow simply from a complex torus having extra endomorphisms.

Choose the conductor/torsion data exactly as in Lecture 11: the integer C, conductor element f, the element g with C=fg, the finite character, roots of unity and the Gauss/Fourier transform. Construct the rational K₂ class U as the specified finite combination of the S_a, with descent to E/Q proved.

Prove Bloch's Theorem 11.2.1 by evaluating the regulator through the finite Fourier identity, identifying the resulting Kronecker–Eisenstein series with the Hecke L-series, and accounting for every period, conductor, Gauss-sum and root-of-unity factor. The scalar in the final equality is an explicit expression in these constructed quantities; an existential unspecified nonzero constant is not the full target. The supplied 2000 CRM Monograph Series 11 scan (SUP_Bloch_HigherRegulators_2000.pdf, printed pp.87–93; PDF pp.99–105) is now available and the formula on printed p.92 is legible. Transcribe Theorem 11.2.1 and equation (11.2.4) from that actual scan, retaining C=fg and its Gauss/Fourier normalization, and verify the expression in two independent calculations before fixing a final Lean signature. This closes access, not the transcription/proof task.

Use absolute convergence and the Euler product at s=2 to prove that the relevant L-value is nonzero, and hence U is nonzero in rational K₂. Formalise the book's intermediate calculations in Lectures 1–10 as prerequisites or compare them with the general constructions of H–R; do not leave the book's reliance on Borel, group cohomology or the regulator construction as an implicit assumption.

The visually checked equation (11.2.4), printed p.92, is

\[
 L(2,\chi^{\rm Gross})=
 \frac{\pi\,|\mu_\kappa|\,\widehat\chi(\overline g)\,g}
 {i\,y^2 C^4}\,R_q(U).
\]

Here O_κ=Z+Zτ, y=Im(τ)>0, q and R_q have Lecture 10's conventions, f generates the Grossencharacter's conductor and fg=C∈Z. The finite Fourier transform is normalized by **1/C**, with kernel exp(2πi(−aℓ+bk)/C) at x=a+bτ and dual argument k+ℓτ (11.1.1); it is not the ordinary 1/C² average. Extend the finite character as in the source. Construct U as the ray-class quotient sum of S_{x̄χ(x)/C} in (11.2.3), and prove invariance/descent. This transcribes the required scalar, but the proof of the formula and comparison with ER.3's regulator still remain implementation targets. The supplied scan was checked at printed pp.87,89,92; no OCR-only verification is claimed.

This endpoint does not assert that U spans the whole rational K₂ group. Bloch's subsequent spanning assertion is presented as a conjecture in the source and is kept separate. Extension from maximal-order class-number-one CM curves to other CM orders or fields requires an additional theorem with its own descent and conductor hypotheses.

## ER.6 — Integral parts and the Beilinson statement

Restrict the regulator to the integral part from E.6. State the elliptic Beilinson conjecture using its rational structure, determinant line and the period-normalised leading term at zero, or the equivalent L(E,2) form after the functional equation has been proved. Prove the equivalence of these two formulations, including the conductor and gamma factors.

Separate three logically different conclusions: a constructed class has nonzero regulator; a constructed rational subspace has the expected determinant relation; the regulator on the entire integral part has the predicted rank and is an isomorphism after extension of scalars. The first two do not imply the third without a separate dimension/injectivity theorem.

Likewise, generic-fibre unramifiedness of Bloch's classes does not by itself prove membership in E.6's arithmetic integral part. Prove the required vertical-residue statement, or state exactly the weaker rational K₂ theorem actually established. A proof claimed to match an integral Beilinson formulation must include that extra step.

## ER.7 — General modular elliptic curves

Construct modular units, their divisors at cusps, the relevant Manin–Drinfeld relation and the modular-curve K₂ classes. Prove the regulator integral and its Rankin–Selberg/Hecke evaluation in the exact level and character generality of the chosen Beilinson theorem. Construct pushforward along a genuine modular parametrisation to E, and prove nonvanishing of the resulting class and the resulting rational proportionality statement.

The modular-curve scheme/analytic comparison, modular parametrisation and modularity theorem are dependencies, not consequences of defining a weight-two newform. Start with a theorem conditional on a supplied parametrisation and a verified newform correspondence; remove that hypothesis for E/Q only after importing a proved modularity theorem from the modularity family. Include the conductor, oldform projections, cuspidal boundary and rationality/descent calculations.

The selected implementation source is Schappacher–Scholl, *Beilinson’s theorem on modular curves* (1988), Theorem 1.1.2 and its integral-image proof. Its finite-level modular-unit regulator and projection theorem must be matched, including the correction to the integral Manin–Drinfeld argument discussed in the introduction. Public author-PDF retrieval was attempted but failed in this round; access remains a recorded gap, not an unspecified source choice. Inspect the complete theorem and §7 before transcribing the final integral statement. Do not cite the phrase “Beilinson proved the conjecture for modular curves” as a proof of an unrestricted rank statement for all elliptic K₂ groups.

## ER.8 — p-adic comparison and worked examples

For the good-reduction cases covered by D.5, compare the syntomic regulator with the explicit symbols and their p-adic elliptic integrals. State the associated p-adic Beilinson conjecture only after defining its p-adic L-function, periods and exceptional factors. This is not part of the proof of ER.5 and introduces no p-adic conjecture into that real-regulator theorem.

Required examples are a P¹ normalisation check, a CM class U with its exact divisor and residue certificates, a calculation involving non-rational torsion followed by transfer, and an arithmetic-model integrality test. A numerical regulator approximation may accompany a proof but cannot substitute for a divisor, tame-symbol or L-series identity.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-ellipticanalytic"></a>

**KU-ellipticanalytic — Elliptic uniformisation, periods and comparison.** Readiness checkpoint for original `ellipticanalytic`: verify completion and map-level compatibility of [EllipticRegulators:ER.1](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `geometry`, `existing`. 

<a id="stage-KU-ellipticreg"></a>

**KU-ellipticreg — Elliptic Deligne regulator and divisor formula.** Readiness checkpoint for original `ellipticreg`: verify completion and map-level compatibility of [EllipticRegulators:ER.2](README.md), [EllipticRegulators:ER.3](README.md), [EllipticRegulators:ER.4](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `ellipticanalytic`, `curvek`, `realregulators`. 

<a id="stage-KU-cmvalue"></a>

**KU-cmvalue — Bloch CM class and exact L-value theorem.** Readiness checkpoint for original `cmvalue`: verify completion and map-level compatibility of [EllipticRegulators:ER.5](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `ellipticreg`, `symbols`, `zeta`. Includes CM Hecke characters, conductor/Euler factors and the exact scalar transcription.

<a id="stage-KU-modularparam"></a>

**KU-modularparam — Algebraic modular curves and proved modular parametrisations.** Readiness checkpoint for original `modularparam`: verify completion and map-level compatibility of [ModularCurvesPartII:R14.6](../ModularCurvesPartII/README.md), [EllipticCurveModularity:R29.5](../EllipticCurveModularity/README.md), [EllipticCurveModularity:R29.6](../EllipticCurveModularity/README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `geometry`, `existing`. Proposed external proof dependency, not a claim that modularity is implemented.

<a id="stage-KU-modularreg"></a>

**KU-modularreg — General modular constructed-class theorem.** Readiness checkpoint for original `modularreg`: verify completion and map-level compatibility of [EllipticRegulators:ER.7](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `modularparam`, `ellipticreg`, `symbols`, `models`. 

<a id="stage-KU-ellipticpadic"></a>

**KU-ellipticpadic — Good-reduction p-adic elliptic regulator.** Readiness checkpoint for original `ellipticpadic`: verify completion and map-level compatibility of [PadicHodgeRegulators:D.5](../PadicHodgeRegulators/README.md), [EllipticRegulators:ER.8](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `padicreg`, `curvek`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `ER.2` | Prove the tame-symbol boundary cancellation for integrals of η(f,g), then compare its normalization with the Deligne Chern class; cuts and punctured cycles must disappear by a theorem. |
| `ER.5` | Keep the printed Lecture 11 Fourier normalization 1/C and the constructed class U together; calculate the exact scalar from conductor, period and Gauss data independently of desired nonvanishing. |
| `ER.6` | Separate nonzero regulator, the determinant formula on the constructed rational subspace, and the conjectural dimension/generation of the full integral part. Attach vertical-residue membership to the integral formulation. |

**Producer–consumer handoff.** PeriodsAndSpecialValues consumes established CM/modular class formulas; no consumer receives generation of all elliptic K2 from ER.5.

**Acceptance.** Run the divisor-diamond sign test, a transferred torsion construction and a bad-fibre integrality test before a special-value certificate.

**Source-readiness boundary.** Schappacher–Scholl full theorem/§7 remains a source check unless its complete text is separately supplied; the Bloch scan closes access only.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
