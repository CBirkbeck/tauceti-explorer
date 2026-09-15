# Birch–Tate and arithmetic special-value formulas

Birch–Tate, S-integer corrections and higher-value statements.

## Canonical ownership and interfaces

- The all-prime endpoint is a proof target with the Kurihara/Kolster comparison still to be proved explicitly. A determinant identity after height-one localization cannot discard finite terms at arithmetic specialization.
- The independent Q and quadratic examples precede any use of this endpoint to compute a tame-kernel order. Distinguish Borel rational proportionality, finite group equalities and conjectural integral refinements.

**Campaign dependencies:** [ArithmeticKTheory](../ArithmeticKTheory/README.md), [MotivicEtaleKTheory](../MotivicEtaleKTheory/README.md), [IntegralIwasawaTheory](../IntegralIwasawaTheory/README.md), [BorelRegulators](../BorelRegulators/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

**Prefix:** B. **Dependencies:** T.7, N, R.5, M's arithmetic cohomology, I. **References:** Handbook I.5 §§5.3, 5.7–5.8; Weibel VI §8; Kolster (1989); Wiles (1990); Kurihara (2025), Theorem 4.1.

## B.1 — The statement and its inputs

For a totally real number field F, define

\[
 W_2(F)=H^0(F,\mathbb Q/\mathbb Z(2)),\qquad
 w_2(F)=\#W_2(F).
\]

Use N's actual cyclotomic Galois module, not the ordinary group of roots of unity in F. Prove finiteness and positivity of w₂. Use the general K-theory group K₂(O_F), its Steinberg/tame-kernel comparison and its finiteness theorem. Use the analytically continued Dedekind zeta function constructed in R.5.

Define the proposition

\[
 \mathrm{BirchTate}(F):\quad
 \zeta_F(-1)=(-1)^{[F:\mathbb Q]}
                  \frac{\#K_2(\mathcal O_F)}{w_2(F)}.
\]

The formula is not asserted for a number field with complex places. In that case ζ_F has a zero at −1, and a leading-term regulator formula, rather than this nonzero-value formula, is required. The word “pole” at −1 in the historical Handbook passage is not adopted.

## B.2 — Rationality, sign and equivalent formulations

Prove that ζ_F(−1) is nonzero and rational for totally real F. Supply the sign from the functional equation and positivity in the convergent half-plane; prove the required gamma-factor limit rather than evaluating a product containing a gamma pole by totalisation.

Derive the absolute-value formulation and the equality of prime valuations

\[
 v_\ell(\#K_2(\mathcal O_F))
   =v_\ell(w_2(F))+v_\ell(|\zeta_F(-1)|).
\]

Develop a general rational-number lemma reconstructing a positive rational number from all prime valuations, and combine it with the sign theorem. This keeps the primewise arithmetic proof separate from the analytic sign. Prove the denominator integrality consequence only after the identity or an independent Deligne–Ribet integrality result, not by assuming the proposed order is an integer.

## B.3 — The base example and independent computations

Prove Birch–Tate for Q directly from the independently established results

\[
 K_2(\mathbb Z)\simeq\mathbb Z/2,\quad w_2(\mathbb Q)=24,
 \quad\zeta_{\mathbb Q}(-1)=-1/12.
\]

The K₂ computation must not use Birch–Tate. The ζ-value must come from the existing Bernoulli/zeta theory or R.5. Verify the sign, denominator and Tate twist in this test.

Add a real quadratic example by combining an independently certified tame-kernel computation, an explicit cyclotomic computation of w₂, and the factorisation into Riemann and Dirichlet L-functions. Keep the certificate and the proof of the class-group/unit bounds used by it. Agreement of a numerical approximation with a rational candidate is not a proof.

## B.4 — The historical odd-primary theorem

For every totally real F and odd prime ℓ, prove the valuation identity in B.2. Start from Tate's K₂-to-Galois-cohomology comparison, pass from O_F to O_F[1/ℓ] with the exact localisation sequence, and identify the finite Euler characteristic in I.5 with the interpolated ζ-value.

At a prime above ℓ, the localisation factor `N(v)−1` is an ℓ-adic unit, so the ℓ-primary K₂ group is unchanged. Prove this elementary fact in the same diagram as the localisation comparison. Identify the denominator group with the ℓ-primary part of W₂(F), using the precise cohomology coefficient sequence.

This proof does not require the full norm-residue theorem in every weight. T.7 and the degree-two arithmetic comparison suffice for its K-theoretic part. The full general theory remains available for higher Lichtenbaum statements.

## B.5 — Totally real abelian fields over Q

Prove the full formula for totally real abelian extensions of Q, including the 2-primary part, through the classical abelian main-conjecture route and the 2-adic comparison. Make the abelian extension hypothesis apply to F/Q, not merely to the finite layers of its cyclotomic Z₂-extension.

This historical endpoint should remain separately available: it is useful earlier in the implementation and tests the modern argument against a second proof. The statement “all abelian extensions of Q” is always accompanied by total reality when used for the nonzero ζ(−1) formula.

## B.6 — The modern 2-primary route for arbitrary totally real fields

Use I.9 with k=F and its trivial finite extension, then I.10, to obtain the main-conjecture formulation needed in Kolster's implication to the 2-primary Birch–Tate identity. Formalise that implication, including the finite descent and real-place correction, rather than appealing to an unnamed equivalence of conjectures.

The required comparison document must contain an explicit table: the Iwasawa module, its dual or twist, the compact-support convention, the specialisation character, the finite cohomology groups, the archimedean contribution, the S-Euler factors, and the identification of W₂. Each entry has a map-level theorem. Test the final table on Q before applying it generally.

The complete Kolster 1989 paper is now downloaded. On printed p.250, Conjecture 3 compares the ideals generated by G(T) and 2^[F:Q] f(T); Lemma 2 specializes the twisted characteristic polynomial at u^(-1)−1, and Theorem 5 is the explicit implication to Birch–Tate. Identify his norm-kernel minus class module with the module used in the modern proof, rather than replacing it by an eigenspace at p=2. His absence-of-finite-submodules input is a proof obligation before using characteristic-polynomial evaluation to compute an order. The equality comparison to Kurihara remains to be proved; reading both statements does not discharge it.

**Source status.** The 2005 Handbook and the older K-book describe the general 2-primary part as unsettled. Kurihara's 2025 Theorem 4.1 supplies an all-prime main-conjecture theorem over an arbitrary totally real base. The route here combines that newer result with the older Birch–Tate reduction. The precise comparison between formulations is an explicit proof obligation in I.10/B.6; this roadmap does not present that comparison as already formalised or as checked merely from the abstract of either paper.

Once this comparison is proved, combine B.4 and B.6 by B.2 to obtain the full theorem for every totally real number field. Thus the programme is not artificially stopped at the abelian-Q case, and it does not silently discard the prime 2.

## B.7 — S-integers and Euler factors

For a finite set S of finite places, prove from localisation

\[
 \#K_2(\mathcal O_{F,S})
    =\#K_2(\mathcal O_F)\prod_{v\in S}(Nv-1).
\]

Define ζ_{F,S}(s)=ζ_F(s)∏_{v∈S}(1−(Nv)^{−s}) through the same Euler-factor API. Deduce the compatible formula

\[
 \zeta_{F,S}(-1)=(-1)^{[F:\mathbb Q]+|S|}
                 \frac{\#K_2(\mathcal O_{F,S})}{w_2(F)}.
\]

Show that changing S commutes with all regulator/cohomology comparisons used above. Do not retain the unmodified sign after removing a finite prime.

## B.8 — Higher special values and conjecture statements

Develop the statement infrastructure for Lichtenbaum formulas at all negative integers using N's groups, R's regulators, leading terms and determinant lines. Prove the odd-primary, totally real even-weight consequences supplied by the appropriate Iwasawa theorem. At real places and the prime 2, derive the correction from M's comparison; do not extrapolate the degree-two formula by replacing subscripts.

For number fields with complex places, state the higher regulator formula with the order of vanishing and the normalised lattice covolume. State the full integral/equivariant refinement separately from Borel's rational-proportionality theorem. No use is made of a conjectural vanishing such as Vandiver in an unconditional calculation.

## Completion tests

The public API contains a general proposition, primewise equivalences, an independent Q proof, the odd-prime theorem, the classical totally real abelian theorem, the modern all-prime comparison and theorem, and S-integer compatibility. A theorem with an unproved main-conjecture hypothesis is a useful intermediate result, but it does not complete B.4, B.5 or B.6.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-birchq"></a>

**KU-birchq — Birch–Tate for Q independently.** Readiness checkpoint for original `birchq`: verify completion and map-level compatibility of [SpecialValuesBirchTate:B.1](README.md), [SpecialValuesBirchTate:B.2](README.md), [SpecialValuesBirchTate:B.3](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `k2classical`, `zeta`, `tate2`. 

<a id="stage-KU-birchodd"></a>

**KU-birchodd — Birch–Tate at odd primes.** Readiness checkpoint for original `birchodd`: verify completion and map-level compatibility of [SpecialValuesBirchTate:B.4](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `oddmain`, `tate2`, `finitegeneration`, `zeta`. 

<a id="stage-KU-birchabelian"></a>

**KU-birchabelian — Classical totally real abelian-Q endpoint.** Readiness checkpoint for original `birchabelian`: verify completion and map-level compatibility of [SpecialValuesBirchTate:B.5](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `oddmain`, `arithmeticstructure`, `zeta`. Includes the additional classical abelian 2-primary argument; oddmain alone is not sufficient.

<a id="stage-KU-birchall"></a>

**KU-birchall — All-totally-real Birch–Tate and S-integers.** Readiness checkpoint for original `birchall`: verify completion and map-level compatibility of [SpecialValuesBirchTate:B.6](README.md), [SpecialValuesBirchTate:B.7](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `maincomparison`, `birchodd`, `finitegeneration`, `zeta`. 

<a id="stage-KU-conjectures"></a>

**KU-conjectures — Higher special-value, Zagier, Leopoldt and elliptic statements.** Readiness checkpoint for original `conjectures`: verify completion and map-level compatibility of [SpecialValuesBirchTate:B.8](README.md), [Polylogarithms:P.4](../Polylogarithms/README.md), [Polylogarithms:P.6](../Polylogarithms/README.md), [EllipticRegulators:ER.6](../EllipticRegulators/README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `arithmeticstructure`, `realregulators`, `padicreg`, `models`, `ellipticreg`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `B.4` | Build a single diagram from K2(O_F) to K2(O_F[1/ell]), finite cohomology and the specialized odd-primary Iwasawa Euler characteristic; prove that every added Nv−1 factor is an ell-adic unit. |
| `B.6` | Before claiming the all-prime endpoint, produce the actual Kurihara-to-Kolster comparison: coefficient ring, norm-kernel module, twist, specialization character, real-place terms, finite correction and W2 identification. |
| `B.8` | State higher integral/equivariant formulas on determinant lines separately from Borel rational proportionality; all-prime reconstruction requires every exceptional valuation, including two. |

**Producer–consumer handoff.** IntegralIwasawaTheory I.9 supplies its source-qualified determinant theorem; I.10/B.6 must prove the old-to-new finite arithmetic comparison, which is still an open implementation gate.

**Acceptance.** Check Q independently using K2(Z), W2(Q)=24 and zeta(−1); then change S by one prime and check the extra sign.

**Source-readiness boundary.** The Kurihara/Kolster implication is not approved merely because both formulations are available; full comparison and source proof interiors remain.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
