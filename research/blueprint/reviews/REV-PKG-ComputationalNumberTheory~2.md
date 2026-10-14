# Independent package review: ComputationalNumberTheory, revision 2

Verdict: **accepted, with the corrections in this review applied**. Reviewer:
Codex, session `codex-C9WySH`, issue [#9205](https://github.com/CBirkbeck/tauceti-explorer/issues/9205),
2026-10-14. I authored neither package version. This reviews the roadmap and
representative signatures; it does not certify an implementation or replay the
complete Platt, companion-eigensystem or CT datasets.

## Required checks

1. **Upstream form: passes.** Read the MultiquadraticExtensions and
   JacobianChallenge reader models and current EffectiveBounds and
   RealAlgebraicGeometry Lean models, together with UPSTREAM_GUIDE. Read the
   entire package README and Suggested.lean. The README has the summary,
   ownership boundaries, standing conventions, exact supplier contracts,
   ordered layers, precise targets, API lists, Checks and references required
   by PACKAGE_REVIEW. The final README is 203,706 bytes. Its size preserves
   the mathematics rather than hiding construction obligations.
2. **Plan fidelity and closure: passes with a native deferral.** The input
   has 108 nodes, 187 API entries and 185 tests. The revision adds 21 targets.
   I removed one original target already supplied by current Tau Ceti, leaving
   128 target subsections. Every other original declaration name and all 187
   original API names remain. The 69 definition/construction subsections each
   have at least three Check bullets; there are 221 such bullets in total,
   plus theorem counterexamples. CN.5 adds replay requirements without a new
   carrier. The 28 recorded construction gaps and 19 requests were reconciled
   with the package's explicit obligations or named suppliers, not assumed
   implemented. The prior review's upward ED.3 dependency is resolved by
   CN.3-owned finite algorithms, as detailed below.
3. **Sources and own words: passes.** Independently obtained all 14 original
   public source versions; their SHA-256 values match the accepted packet.
   Read the locations in the seeded random sample below, and additional
   locations for the revision's new services. The package author flagged no
   remaining unverified package locator. Arb remains a source of enclosure
   semantics, not an alleged theorem proving exact algebraic root isolation.
   The document states its own objects, proofs and interfaces; it contains
   neither source passages nor a section-by-section source digest. No source
   files or passages are submitted.
4. **Unit tests and adversarial mathematics: passes after correction.**
   Reviewed each target and convention, including every denominator,
   hypothesis and promised interface. The table below records the instances
   and fixes. Replaced the unused-cell RAM magnitude test and the zero-centre
   p-adic precision tests with computed discriminating cases. Added negative
   controls for the newly found false unrestricted statements.
5. **Suggested Lean: passes.** Final `lean-check` exited 0 at Mathlib
   `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
   `f790474821cf4256814db967cb154e7af3d0c369`. There are exactly 106 warnings,
   all `declaration uses sorry`, and no errors or other warnings. The file is
   1,272 lines, including 59 examples. All kept data definitions have real
   bodies over existing carriers. Heavy algorithms remain exact README
   targets. Every README definition's name occurs as a declaration or in the
   closing comment. Ten representative signature comparisons appear below.
6. **Metadata and intake: passes.** Metadata remains the single line
   `topic = "math.NT"`. The blueprint checker reports 0 errors and 0 warnings;
   the sorry-data checker passes; intake reports 0 problems for the package,
   review report and handoff; `git diff --check` passes. No private paths,
   packet edits or source material are included.

## Corrections made in this review

- **Linear Rabin certificates:** compare the two reduced remainders,
  `X^(q^n) mod f` and `X mod f`. A monic linear polynomial has constant
  remainder; comparing with the unreduced `X` incorrectly rejects it. The
  existing Lean predicate already states divisibility of the difference;
  added a degree-one remainder example.
- **Native order integrality:** delete old subsection 2.2
  `OrderBasisCertificate.isIntegral` and its Lean theorem; renumber the rest
  of CN.2 and remove stale prerequisite references. Current Tau Ceti's
  `TauCeti.GlobalNumberFields.NumberFieldOrder.isIntegral`, in
  `NumberTheory/NumberField/Global/Orders/Basic`, supplies precisely this
  conclusion after the finite basis identities construct the native order.
  The deferral appears only in the boundaries.
- **Rational factorization source and monicity:** replace the extension-field
  citation by LLL82's rational factorization, lifting and coefficient-bound
  locations. Specify the reduction from a primitive nonmonic integer input
  to the monic polynomial `a^(n−1) F(Y/a)`, the coefficient bound, the modulus
  exceeding twice that bound, exhaustive subset recombination, exact division
  and descent in degree. Distinguish this exhaustive variant from LLL82's LLL
  search. A nonmonic quadratic example pins the change of variables.
- **Class–unit stopping bound:** require `h′ > 0` in both prose and Lean.
  With `h = 1, h′ = 0`, divisibility and the old strict inequality hold, but
  `h′ = h` fails. A finite relation quotient has positive order; the generic
  theorem must state it. Added the zero-order negative control.
- **Local-image index and existence:** add the checked Mattuck Theorem 7,
  printed p.114, as the source of the nonarchimedean open subgroup. Explain
  the finite-quotient kernel/cokernel cancellation and identify FPS's
  dimension-two argument as a model for the dimension-one specialization.
  Explain why every descent-image coset has a non-torsion finite point before
  using openness and density of rational abscissae for terminating search.
- **Good odd primes:** state the norm-on-units supplier from
  LocalFieldsRamification Layer 2. The kernel orders for splitting types
  `(3), (1,2), (1,1,1)` are respectively `1,2,4`, agreeing with `1 + r_p`.
  Cremona's local-solubility section supplies context rather than a claimed
  proof of the norm-kernel equality.
- **Saturation at two and torsion:** use representatives `0,1` at `p = 2`;
  the odd-prime symmetric bound would discard the only nonzero coefficient.
  Add the named quotient-generating criterion
  `isPSaturated_iff_forall_not_dvd_of_span_quotient` in prose and Lean.
  The torsion representatives in the saturation algorithm generate `G/pG`,
  rather than necessarily all of `G`. Retain the ambient `A[p] ≤ G`
  hypothesis. Added controls with `2ℤ`, `ℤ/3` and `ℤ/2`.
- **Precision and scalar conventions:** correct the addition, multiplication
  and inverse locators to Caruso's equations (2.1), (2.3) and (2.5). Compute
  mixed zero/unit and two-zero-ball products explicitly. Pin
  `ctTailKernel 0 = 2/π²`; at `ℓ = 0` specify only the shared scalar at indices
  1 and 4, and keep the other six CT evaluations restricted to positive `ℓ`.
- **Fincke–Pohst:** restrict negation symmetry to centre zero and zero
  membership to positive completion pivots. Add dimension-zero,
  half-integer-centre and nonpositive-pivot controls. Require symmetry and
  positive pivots when constructing a cover through the enumeration.
- **Generality:** align the Loewner theorem with its Lean signature by requiring symmetry of the positive-semidefinite difference only. Make the general subalgebra, natural-prime-parameter and normed-field certificate carriers explicit, while keeping their computational theorems at the stated full-order, prime and local-field hypotheses.
- **Representative examples:** add examples for previously untested light
  carriers, including finite-field factors, order/integral bases, p-radicals,
  prime-ideal factors, Newton sides, local expansions, complex boxes, outward
  rounding, empty local-image spans and zero-dimensional Gram certificates.
  The two-block multiplicity witness computes `−34` in both normalizations;
  its exact rational computation is proved in Lean.

## Source sample and supplementary checks

The random sample uses seed **9205** on the 108 input nodes, without
replacement. Locations below are printed pages of the linked source version.
Adapters motivated by a source are distinguished from its actual theorems.

| Target in the final README | Location read | Result |
| --- | --- | --- |
| 2.12 `minkowski_factorBase_generates` | NumberRings §12, pp.245–248 | Small-norm representatives yield a complete prime factor base; no GRH used. |
| 1.15 `pocklington_prime_divisor` | Théry Theorems 6.1–6.2, p.9 | Prime-power order argument supports partial factors; retain the correction `F² > n` for primality. |
| 2.3 `IsPMaximal` | NumberRings §9, pp.233–235 | Prime-to-p denominator clearing describes the p-primary overorder. |
| 3.4 `levelOne_congruence_sturm` | Stein Theorem 9.18, pp.171–172 | Congruence theorem needs the integral model and prime-ideal reduction. |
| 0.8 `AlgebraicRootCertificate` | Arb §§5–5.3, pp.7–9 | Enclosure motivation only; exact root-count, separation and verification remain explicit obligations. |
| 4.1 `intervalMul` | Arb §3.1.2 p.5, §4 p.6, §5 p.7 | Inclusion semantics matches the rational four-corner adapter. |
| 2.4 `nilpotent_iff_frobenius_zero` | NumberRings §9, pp.233–234 | The dimension bound controls the chosen Frobenius power. |
| 3.8 `weight26_coeff_107` | BCG §2.3, Theorem 2.4 proof, p.515 | Normalized integer coefficient and residue `−1` agree. |
| 4.14 `ctTailKernel` | CL §3.16, Proposition 3.17 and comments (3), pp.304–307 | The French preprint gives the kernel and tails; its pagination is explicit. |
| 1.18 `PocklingtonCertificate.sound` | Théry Theorems 6.1–6.2, p.9 | Accepted child certificates supply every required prime divisor of the certified part. |
| 2.9 `PrimeIdealFactorCertificate` | NumberRings §9 pp.234–235, §12 p.248 | The maximal-order factorization avoids assuming a monogenic index condition. |
| 0.1 `RAMInstruction` | Shoup §3.2, pp.53–55 | Integer-word RAM semantics supports the specified instruction adapter. |
| 4.6 `dyadicHull_width` | Arb §3.1 p.4, §5 p.7 | Directed rounding motivates the adapter; its strict width bound follows from floor/ceiling inequalities. |
| 3.7 `integralHeckeMatrix` | Stein Proposition 2.31 p.24, Lemma 2.20 pp.20–21 | Integral Miller coordinates and the Hecke recurrence agree. |
| 0.13 `algebraicEqual` | Arb §§5–5.3, pp.7–9 | Overlap is insufficient; gcd and certified common-root isolation are separately specified. |

Supplementary primary-source readings covered all new local-image and
saturation contracts and the questionable algorithmic attributions:

- Shoup Exercise 20.2(a), p.524, Theorem 19.10, p.513, and §20.1, p.523:
  the Rabin tests, including degree one.
- LLL82, CWI report Proposition 2.13, pp.19–20, Algorithm 3.3, p.23,
  Algorithm 3.5 and Theorem 3.6, pp.25–26: coefficient bounds, monic modular
  lifting and rational factorization. The exhaustive recombination variant
  has its own completeness argument. Read the pinned Mathlib Mahler-measure
  factor bound and coefficient-sum bound, including their hypotheses.
- Milne ANT Theorem 7.32, p.120, and Proposition 8.2, p.136:
  the `4π` unit-square test and completion degrees used for p-adic roots.
- Mattuck Theorem 7, p.114, and FPS §7 Lemmas 3–4, pp.16–17:
  the local open subgroup, quotient sizes and density argument. The lower
  RP.1 plan had an unverified Mattuck locator; this review independently
  read the public published article and records the exact page without
  editing that foreign packet.
- Siksek §4, equation (39), p.17, §4.1, equation (40), pp.17–18,
  and §4.2, equation (41), pp.18–19: saturation, the sieve, representatives
  at two and the exact division-polynomial test.
- Cremona §3.3, Propositions 3.3.1–3.3.2, pp.69–70, and §3.6, p.80:
  integral-model torsion bounds and local-solubility context.
- Caruso §2.1.1, Proposition 2.1.1 and Definition 2.1.2, pp.II–17–II–18;
  Proposition 2.1.3 and equations (2.1), (2.3), (2.5), pp.II–18–II–19:
  absolute precision, zero balls, multiplication and inversion.
- GMN Theorem 1.19 and Corollary 1.20, pp.14–15: exponent-one residual
  factors, degree and ramification/residue-degree conclusions.
- de Weger §3.6 and Figure 2, pp.51–53: quadratic completion, recursion and
  translated centres. Keeping zero and both signs at centre zero is an
  explicit variant of the source enumeration.
- Sutherland Lecture 7, equation (1), p.2: the odd-characteristic point count.
- CT equation (2.4.4), p.278, Algorithm 2.4.4, pp.282–283,
  §4.1, pp.295–296, and Proposition 4.4, pp.298–299; CL Proposition 3.17,
  pp.304–307: all eight scalar expressions, G gamma shifts, weighted tails,
  multiplicity normalization and the distinction between a cover and a
  smaller exact ellipsoid. The scalar identities have no GRH premise.
- Platt Theorems 7.1–7.2, pp.14–15: modulus parity, height cutoffs and the
  separate central nonvanishing computation. Reflection to negative heights
  uses the conjugate primitive character and the functional equation.

## Dependencies and current duplication

Read the reviewed CN.0–CN.5 library audit, the packet's native baselines and
supplier requests, and the current tier order. CN is tier 15; RP is tier 9,
R15 and AL are tier 12, and AN is tier 14. No upward prerequisite, tierless
finite-field supplier, `FoundationsAndLibraryIntegration` or `UPSTREAM:` id
remains in the target dependencies. ED is a downstream consumer.

The revision's replacement for ED.3 is substantive: local-image certificates,
size completeness, terminating search, good-place equality, saturation,
exact divisibility, sieve soundness and the finite saturation test are named
CN.3 targets with sources and interfaces. The finite-field presentation,
factorization, Hensel and character-sum targets formerly deferred to the
tierless finite-field roadmap are likewise owned here. The existing GN
package supplies LLL rather than the promised Fincke–Pohst enumeration; CN.4
owns the latter. Field kernel computation uses native `TauCeti.kernelBasis`,
and residual eigensystem lifting uses R15.5 rather than ModularForms Layer 8.

Checked all targets against current TauCetiRoadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27`, its Completed roadmaps, and current
Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches included
mathematical properties as well as declaration names: Frobenius factor
degrees and divisibility, orders and stabilizers, local integral closure,
root counts/separation, reduction and descent images, multiplication-index
and saturation conditions, unit indices, positive quadratic completions,
interval endpoints and analytic certification.

**Exact removal:** old 2.2 order-basis integrality, described above. No other
exact duplicate remains. Relevant overlaps were read and distinguished:

| Current supplier | Boundary of the kept CN target |
| --- | --- |
| `NumberFieldOrder.multiplierRing`, `Orders/ProperIdeal` | CN accepts any integer submodule, including zero; the native version takes a fractional ideal of an order. The equality on that domain is explicit. |
| `IntegralPrimitiveElement.not_dvd_index_iff` | CN's local maximality predicate and improvement algorithm also handle nonmonogenic orders. |
| NumberFieldArithmetic Layers 3 and 7 | CN supplies full-order improvement and unit stopping at every rank, beyond the intrinsic index identities and rank-one certificates. |
| PolynomialGaloisGroups Layer 5 | The Frobenius orbit lemma is imported; a finite Rabin certificate with Bézout witnesses is additional data. |
| RealAlgebraicGeometry Layers 1–4 | Intrinsic root theory is imported; finite rational certificates, decoding, complex boxes and refinement are the adapters planned here. |
| EllipticCurves Layers 4, 6 and 7; native descent | Intrinsic reduction, torsion, descent and local conditions are imported; complete finite local-image certificates and the saturation algorithm are additional. |
| LocalFieldsRamification Layer 2; native unramified norm | The norm-on-units theorem is imported for the good-odd-prime count. |
| Mathlib regulator quotient | The identity is imported; the positive-integer stopping inequalities are its additional corollaries. |
| EffectiveBounds; IntegralLattices | Read the bound and lattice signatures; neither supplies the finite rational interval/Gram verifier or translated exhaustive ellipsoid recursion. |

## Adversarial pass

Ranges below cover every numbered subsection and CN.5. A row groups targets
sharing a carrier or convention; their hypotheses and interfaces were checked
individually. Numerical controls are small exact cases, not evidence that the
large published datasets have been replayed.

| Statements checked | Instances and computed controls | Outcome |
| --- | --- | --- |
| 0.1–0.4 RAM syntax, reads, transitions, traces | Empty program; halt; zero divisor; negative indirect address; `3/(−2)=−2`; zero-length trace. | Partial failure and normal halt remain distinct; floor direction agrees with Lean. |
| 0.5–0.7 costs and magnitude | Empty cost sum; constant stored word 7 in an unused cell; proposed bound 6. | All memory cells matter; corrected vacuous example and added Lean control. |
| 0.8–0.13 algebraic certificates and operations | Rational zero; `1/2+1/3=5/6`; `X²−1` with both roots in one box; overlapping boxes for unequal values; inverse of zero. | Unique distinct root and nonzero inverse guard are explicit; exact algorithms remain obligations. |
| 0.14 p-adic syntax | Zero ball; negative initial valuation; mantissa divisible by p; N=0. | Zero precision means a ball; canonical alternatives match Lean. |
| 0.15 Rabin | Linear `X−2` over `𝔽₅`; irreducible quadratic over `𝔽₂`; split `X²+1` over `𝔽₅`; repeated factors. | Corrected degree-one remainder comparison; squarefreeness and Bézout tests prevent false positives. |
| 0.16–0.17 field presentations and change | Degree-one base field; `𝔽₉` presentations with substitutions `X+2`, `X+1`; order-three map whose inverse needs `4X`. | Root images, composition order and inverse direction are explicit; positive degree excludes infinite-extension finrank zero. |
| 1.1–1.6 Pratt trees and size | Base 2; tree for 3; malformed/empty child lists; repeated children. | Product must equal n−1; repetition is charged, and size is separate from discovery cost. |
| 1.7–1.10 strong liars and rounds | n=0,1,2; n=9 has two passing bases among eight; 2047 passes base 2; k=0 gives one empty tuple. | Odd composite and independent uniform tuple hypotheses retain the correct bound. |
| 1.11–1.14 AKS | n=1 sentinel; n=2 accepted; n=9 parameter 3 but rejected as a power; empty polynomial-check range. | The wrapper supplies all guards; a vacuous identity predicate is not primality. |
| 1.15–1.18 Pocklington | n=17,F=8,witness 3; F=2 too small; F=1; repeated factors of the certified part. | Strict `F²>n` and child coverage retained; witnesses need not share a base. |
| 1.19–1.21 integer factors | −1 with empty list; 12 with 2,2,3; zero. | Sign, multiplicity and nonzero input match the native factorization. |
| 1.22–1.25 finite-field factors and transport | Nonzero constant with empty factors; `(X−1)²`; zero polynomial; change-of-presentation inverse. | Positive multiplicities and leading scalar retained; added repeated-factor Lean example. |
| 1.26 Hensel lifting | k=1; constant monic factor; repeated noncoprime residue factors; k=0 excluded. | Monicity preserves degree under reduction; coprimality is essential for uniqueness. |
| 1.27–1.28 rational factors | Zero excluded; constants; repeated factors; primitive nonmonic `2X²+3X+1` becomes `Y²+3Y+2`. | Corrected algorithm's monic input reduction and source; inverse substitution restores the scalar. |
| 2.1–2.3 orders and stabilizers | ℚ basis [1]; basis [1/2] fails multiplication closure; rank zero; zero lattice; p=1. | Native integrality deferred; general stabilizer variant remains; local maximality arithmetic assumes prime p. |
| 2.4–2.6 radical and multiplier criterion | Zero-dimensional algebra; `𝔽_p[ε]/ε²`; ℤ in ℚ with radical pℤ; p prime versus p=1. | Dimension-dependent power and full-order hypotheses retained; zero is not an order input. |
| 2.7–2.9 integral bases and prime ideals | Maximal ℚ basis; proper suborder; prime 2 in ℚ; zero ideal and exponent zero. | Maximality requires finite local checks; prime factors are nonzero and positive-exponent. |
| 2.10–2.12 class relations and factor base | Empty coordinates; unit ideals; found proper relation sublattice; complete versus truncated factor base. | Found relations give divisibility, not equality; no unconditional Bach bound substituted. |
| 2.13–2.15 class/unit stopping | Rank-zero units with torsion; index 2 at the strict threshold; h=1,h′=0. | Added positivity of h′; torsion is included in generation and strictness is necessary. |
| 2.16–2.20 φ-expansions, sides and Ore | φ=X; φ=X−1 on X² gives 1,2,1; zero coefficient has infinity valuation; `X²−3` slope −1/2; repeated residual factor. | Negative slope and residual exponent-one hypotheses retained; incorrect slope rejected in Lean. |
| 2.21 local expansion | Length zero at x=0; π⁻¹ with digit 1; zero centre cannot approximate 1 at positive precision. | π≠0 and norm<1 justify negative powers and the error scale. |
| 2.22 unit squares | ℚ₂: 17 square, 5 not; ℚ₅: 6 square; ramified L/ℚ₂ requires `4π`, rather than a copied mod-8 rule. | README general extension theorem and explicitly specialized ℚ_p Lean signature agree. Equal characteristic 2 is outside scope. |
| 2.23 p-adic root counts | `X²−2` at 7 splits and at 2 ramifies; constant factor; repeated polynomial excluded by separability. | Counts use both e=f=1; multiplicities are not distinct roots. |
| 3.1–3.4 modular lattices, Miller and Sturm | E₄ integral, E₄/2 not; zero cusp space at weight 2; weight 12 basis Δ; coefficient threshold inclusive. | Integral model and congruence hypotheses remain distinct from characteristic-zero equality. |
| 3.5–3.7 data equality, recurrence, matrices | Empty coefficient prefix; zero-dimensional determinant 1; weight 12 T₂=−24; column i/j convention. | Binding proofs and full recurrence determine the intrinsic operator. |
| 3.8–3.10 BCG witnesses | Integer coefficient at 107 reduces to −1; weight-38 matrix mod 79 is `[[3,17],[25,10]]`, determinant −395. | Exact witnesses are compatible with the source and integral normalization; eigenform lifting is a separate supplier. |
| 3.11–3.16 ordinary/nonordinary lists | Zero-dimensional determinant; gcd(37,80)=1; twist exponent 81; excluded prime-151 gcd 3. | Empty spaces cannot certify nonordinarity; residual common eigensystems and corrected exclusions remain explicit. Large lists were not replayed. |
| 3.17 point count | ℤ/5 curve y²=x³+x+1 gives 9 points, trace −3; singular cusp count 6; ℤ/2 y²=x³+1 gives 3 rather than the proposed odd-character formula's 4. | Odd characteristic is necessary; singular count and nonsingular point type are distinguished. |
| 3.18–3.20 local images | Real cubic with one or three roots gives target 1 or 2; split cubic at 2 gives 8; incomplete one-generator certificate. | Finite size criterion and the dense-search proof retain separate obligations; added source and non-torsion-coset argument. |
| 3.21 good odd primes | Cubic splitting types (3), (1,2), (1,1,1); kernel sizes 1,2,4. | Added unramified norm supplier; p=2 and bad reduction excluded. |
| 3.22–3.23 saturation criterion | 6ℤ at p=5,2; 2ℤ at p=2; ℤ/3 with empty quotient basis; ℤ/2 with missing ambient torsion. | Added correct representatives at two and quotient-generating theorem; cannot omit A[p]. |
| 3.24–3.26 divisibility, sieve, algorithm | Identity point; affine nonzero point; p=2; zero sieve quotient; redundant generators Q,2Q; rank zero with all torsion. | Degree p² nonzero polynomial yields finite roots; sieve is necessary only; verdict includes independence. |
| 4.1–4.4 interval operations | [−1,1] squared has lower endpoint −1; negative reciprocal; singleton zero; interval straddling zero. | Four corners and reciprocal failure guard are correct; no denominator can vanish on accepted reciprocal inputs. |
| 4.5–4.9 rounding, boxes, integer extraction | 1/3 at precision 2 gives [1/4,1/2]; −1/3 at 0 gives [−1,0]; singleton i; no integer versus one integer versus two. | Outward signs and inclusive endpoints agree with Lean; added exact rounding proof. |
| 4.10–4.13 p-adic arithmetic | At 3: zero O(3²) plus unit, zero times unit, O(3²)O(3⁴)=O(3⁶), negative valuation product, inverse of 3+O(3⁴). | Correct absolute precisions and zero-ball valuations; replaced weak tests and fixed locators. |
| 4.14–4.18 CT kernel, tails and enclosures | r(0)=2/π²; r(−1)>r(1); α>0, N=0; weighted threshold; ℓ=0; weight zero. | Positive denominators/shifts and tail convergence explicit; corrected zero convention; only positive ℓ evaluates all eight formulas. |
| 4.19 roots | Nonzero constant; zero polynomial; X² has one distinct root; X²+1 has two. | Nonzero guard and distinct-root completeness retained; overlapping boxes are insufficient. |
| 4.20–4.24 L-values and Platt | Modulus 1 at ζ(2); pole at 1; central point; zero cusp form; q odd/even; real s in (0,1). | Continued functions, pole guard, modulus parity, normalization and zero counts are explicit; no global GRH claim. |
| 4.25 entrywise Gram bounds | Empty matrix; nonnegative vector; mixed-sign vector and off-diagonal bound. | Nonnegative coordinates are essential; symmetry is unnecessary here. |
| 4.26–4.27 enumeration | I₂,R=1 gives 5 vectors; [[2,1],[1,2]],R=2 gives 7; n=0; negative R; t=1/2; zero pivot. | Fixed centre-zero symmetry and valid-pivot zero membership; boundary points retained. |
| 4.28 Loewner comparison | Zero difference; mixed-sign vector; nonsymmetric proposed difference. | Positive-semidefinite difference supplies the unrestricted comparison. |
| 4.29–4.30 negative witness | Dimension 0; [−2,−1] with vector 1; [−1,1]; scaling by a positive rational. | Nonzero nonnegative vector and strict rational upper bound are necessary. |
| 4.31 cover | Zero with nonnegative cutoff; negative coordinate; exact boundary; inflated cutoff. | Added positive-pivot requirement for construction; extra cover rows are kept rather than mislabeled exact. |
| 4.32–4.33 finite checkers | Zero vector; one negative row; appended zero row; empty dataset. | Empty conjunction is true but proves no coverage; added conjunction negative control. |
| 4.34 multiplicity lift | Blocks (2,3), A=6, K=[[1,2],[2,4]], t=(2,3) yield −34 on both sides; empty index set; zero block excluded. | Denominators positive; t_i/m_i direction pinned by exact Lean arithmetic. |
| CN.5 replay and standing conventions | One-row negative dataset; missing cover; changed normalization; checksum without decoding. | Hashes identify bytes only; mathematical binding and exhaustive coverage remain necessary. |

## Ten Lean/README signature comparisons

| Declaration | Comparison |
| --- | --- |
| `ramStep` | Negative indirect address and division by zero are errors; halt is `some none`; signed division uses `Int.fdiv`. |
| `RabinCertificate` | Monic positive degree, Frobenius divisibility and prime-divisor Bézout witnesses match the corrected reduced-remainder specification. |
| `FiniteFieldPresentation` | A root and matching positive degree give the power-basis extension; infinite-dimensional finrank zero cannot satisfy the certificate. |
| `henselLift` | Prime p, k≥1, monic integer input, monic coprime residue factors, both reductions and uniqueness are present. |
| `nilpotent_iff_frobenius_zero` | Finite-dimensional commutative characteristic-p algebra and dimension≤p^k are both required. |
| `joint_class_unit_bound` | Full unit rank, h>0, newly required h′>0, divisibility and strict inequality match the corrected prose. |
| `isSquare_iff_isSquare_mod` | Explicit ℚ_p specialization of the general finite-extension README target; unit input and modulus 4p are correct. |
| `localImageSpan_eq_range_of_card_padic` and `_real` | Elliptic normal form, genuine abscissae, p=2 multiplier and the real factor 2 agree with the local-size count. |
| `isPSaturated_iff_forall_not_dvd_of_span_quotient` | Exact quotient-generation hypothesis and ambient p-torsion condition implement the named variant used by the algorithm. |
| `multiplicityGram_lift` | Every block size is positive; expanded diagonal, reduced diagonal A/m_i and division by m_i match the two-block witness. |

The compiled theorem statements still use `sorry`, as intended for a roadmap.
Computed Lean examples and source checks do not turn those declarations or
the large finite certificate targets into completed formal proofs.

## Remaining work

No unresolved package defect remains from this review. The maintainer must
reconcile the old foreign ownership/link records with CN.3 and the moved-down
finite-field/Fincke–Pohst services before those downstream plans are ported.
The exact mappings and the RP.1 source finding are recorded in the
[handoff](../handoff/REV-PKG-ComputationalNumberTheory~2.md). Those edits are
outside this job's allowed paths. Actual implementations and full dataset
replays remain future Tau Ceti contributions described by the roadmap.
