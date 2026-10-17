# Fix: imaginary-quadratic elliptic modularity package

Issue [#10050](https://github.com/CBirkbeck/tauceti-explorer/issues/10050),
`FIX-PKG-EllipticCurveModularityImaginaryQuadratic~adv`.
Codex, session `codex-dGnOsV`, 2026-10-17. **Complete.**

## Findings and dispositions

The issue's named `REV-PKG-EllipticCurveModularityImaginaryQuadratic~adv.md`
does not exist in this checkout. Read all three available package reviews,
the package, PACKAGE_REVIEW, PROTOCOL, WORKERS, UPSTREAM_GUIDE and the exemplar.
The binding 16 October decision in the issue supplies the concrete new finding.
This is a package fix, not an independent review of this session's work.

| Finding or requirement | Disposition |
|---|---|
| ComputationalNumberTheory is dropped; Layer 5 must not require CN.5. | Removed its supplier row and its Gaussian-comparison prerequisite. Neither package document now mentions that roadmap or CN.5. |
| The explicit modular-curve computations must be hypotheses of the final theorem. | Moved the six former targets into exact, sourced contracts: `LevelFifteenModels`, `QuadraticLevelFifteenTorsion`, `GenusOneModel`, `GenusOneJacobian`, `GenusOneRationalPicard`, `GenusOneQuadraticPoints`. They specify the actual equations, modular maps, fields, groups, divisor classes, conics and point classification. The final theorem explicitly assumes them. |
| Removing the computational supplier must not leave an unowned Gaussian input. | Named `GaussianComparisonData`: the complete eight-point matching table, automorphic candidate, coefficient choices, residual/determinant/ramification information, and the admissible exhaustive Faltings–Serre test data. Its source is CN's Corollary 7.1.2 proof, p.93, with DGP10 and the specified LMFDB curve. The hypothesis does not contain the final representation isomorphism or assert modularity. |
| Everything derived from those facts remains a target. | Added explicit `level_fifteen_finiteness_transfer`, `quadratic_level_fifteen_points`, `genus_one_no_rational_point` and `genus_one_picard_comparison`. Retained Gaussian modularity, genus-one modularity, the genus-two and quartic computations, residual modularity, the final modularity endpoints, small-field rank calculations and the √−10 control. Moved the finiteness and rational-point consequences out of the input statements. |
| Hypotheses must propagate through all consumers. | Updated Summary, ownership, build table, Layer 5, the branch comparison in `quartic_models`, standing hypotheses for all Layer 7 geometric targets, the residual theorem, both final modularity statements and downstream consumers. The √−10 argument explicitly takes the torsion input; the modular interpretation takes the model input. |
| Lean must respect the assumed-data boundary. | Replaced the unconditional torsion-computation theorem by the proof-only, real-bodied structure `QuadraticLevelFifteenTorsion F`. Its six concrete fields refer to the genuine Mathlib point groups and base-change maps. No inhabitance theorem, arbitrary proposition parameter, axiom or sorry-defined data was introduced. Added this hypothesis to the √−10 infinitude theorem. |
| Pin normalizations and add negative controls. | Added three torsion-input examples: Gaussian growth only for E15, growth for both curves over the √5 field, and no growth for either when neither root exists. Added a README Check and Lean example distinguishing the two Fricke lifts at `(1+2i,3+6i)`. Added the scalar-one versus scalar-minus-three infinity control in both files. |
| Earlier reviews requested heavy Lean carriers and exhaustive declaration inventories. | The binding 12 October shape supersedes those requests, as the accepted round-three review already records. Genuine automorphic, compactified-curve and Jacobian interfaces remain in the README; no fictitious carriers were added. The round-three corrections to R21.4, GT.6, ML.1 and the Kwon locator remain. |
| Retain APIs, tests, citations and exemplar form. | All 138 previously named API/check entries remain: 69 API entries and 69 checks. Two named negative controls and three input checks were added. The package keeps its eight layers, per-layer examples/dependencies, exact suppliers, locators and full geometric contracts. |

The final theorem has seven named arithmetic inputs (the six required contracts
and the Gaussian comparison data). The small-field conclusions use these same
inputs; their rank computations remain targets under ED.3/ED.6, rather than
being silently added to the assumed data. In particular the purely equation-level
Lean finiteness theorem for d=1,2,3,5 remains a theorem to prove.

## Source checks

Read CN's definition and results in §6.1, pp.87–90, Lemmas 6.2.1–6.2.2,
pp.90–91, Theorem 7.1 and Lemma 7.1.1, pp.91–93, the full proof of
Corollary 7.1.2, p.93, and Propositions 7.2.1–7.2.4, Remark 7.2.3 and
Corollary 7.2.5, pp.94–97. Read the fixed-commit `ns3ob5.m` model,
Jacobian, divisor and Riemann–Roch blocks. Read FLHS v4 Lemmas 15.3–15.4,
p.29, and BF §2, PDF pp.2–4. The Kwon Theorem 1(iii), pp.144–145 locator
is retained from the accepted round-three review; the torsion inputs were also
checked directly in CN's p.93 proof. This run does not claim to have reopened
the original Kwon paper or repeated the previous review's fifteen-source sample.

The additive Riemann–Roch numerators agree with the author script and the
quadratic fiber equations. Neither the old typesetting ambiguity nor a source
passage has been copied into the package. No restricted book was used.

Freshly inspected public inputs, accessed 2026-10-17:

| Source | SHA-256 |
|---|---|
| [CN arXiv v3 PDF](https://arxiv.org/pdf/2301.10509v3) | `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3` |
| [FLHS arXiv v4 PDF](https://arxiv.org/pdf/1310.7088v4) | `aea71f7698edac25fedaf03627b7703c0ed6138e4e9c012b06b41822819d0403` |
| [BF author PDF](https://people.maths.ox.ac.uk/flynn/arts/art24.pdf) | `efd0361bc5a8b7e2675fbcd854a26a353c9ce6ebca917177849daa245554557a` |
| [ns3ob5.m at e6e2e901](https://raw.githubusercontent.com/jjmnewton/modularity-iqf/e6e2e9014f55f91e1d27a23e225a5f474d2e1d81/ns3ob5.m) | `04da9d9260d653ac87b0683003e9fb906fb6cc301d23074d99adccbcddd8303f` |

## Ownership and carrier audit

Read the reviewed elliptic/Jacobian and CN.5 library-audit records. Checked the
current roadmaps at `0d144d044dacebca17b654695b6f1ad58f159b27` and current
Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the nine
roadmaps newer than the atlas snapshot, OperatorTheory's subroadmaps and
Completed's ContourIntegration, EffectiveBounds, OrthogonalL2Bases and
RestrictedProducts. Searches used equations and objects, including the actual
Weierstrass coefficients/discriminants, quadratic torsion, Mordell–Weil,
Picard/Jacobian and Faltings–Serre data. An `E15` hit in OperatorTheory is its
unrelated `SA-E15` identifier.

Read the current elliptic and modular-curve ownership/contracts and relevant
Jacobian sections. General isogenies, Mordell–Weil, torsion, coarse moduli,
Picard and symmetric-power theory remain suppliers, rather than new targets.
The current integral covariant Tate representation is not the rational dual
representation used for modularity. Read its `tateModuleGaloisRepresentation`
and the divisor equivalences `classGroupAddEquivLineBundleClass`,
`classGroupPicZeroAddEquivPicZero`, and `rigidifiedPicardFunctor` with their
actual curve, cohomology and section hypotheses. The package already cites
these in its ownership boundary. No additional duplicate target was found.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, checked the actual
point-group base-change homomorphism, its injectivity, ellipticity instances,
Weierstrass invariants, rational-function constructors/evaluation/degrees and
polynomial carriers used here. The build uses Tau Ceti pin
`f790474821cf4256814db967cb154e7af3d0c369`; the suggested file imports only
Mathlib. No current upstream checkout was modified or built.

## Adversarial pass

Reviewed all target statements, their API/check families, the Lean hypotheses
and the new input fields. The table groups assertions with the same domain and
controls; all touched consumers are included. Elementary checks are independent
exact calculations, not proofs of the proposed descent, rank or sieve results.

| Statements / interface family | Instances and calculations | Result / change |
|---|---|---|
| `Modular`, `modularity_transport` | Geometric CM, rational j, j=0,1728, isogeny, twist and conjugation; non-CM soluble descent requires irreducibility. Covariant determinant ε versus dual ε⁻¹ at p=5. | CM branch and dual convention retained; Gaussian transport still a derived target. |
| `automorphic_unique`, `automorphic_all_primes`, `automorphic_wd`, `automorphic_potentially_multiplicative_ordinary` | Good reduction has N=0; potentially multiplicative reduction retains nonzero Steinberg monodromy after Frobenius semisimplification. Auxiliary ℓ differs from p. | CN Lemma 6.1.3 hypotheses and separate comparisons retained. |
| `symplecticTwist`, `solvable_preparation`, `seed_modular`, `hilbert_local_selection` | p=3 versus 5; geometric genus zero versus a rational point; all places over p; empty versus nonempty prescribed local opens; independent dyadic/ordinary seed. | Pairing, rigidification, disjointness and local solvability hypotheses retained. No application to arbitrary residual data without determinant/genericity conditions. |
| `switch_five`, `switch_three`, `auxiliary_local_types`, `elliptic_lifting_data`, `cm_modularity`, `quadratic_modularity` | Ordinary/supersingular/multiplicative partitions; ζ5 exclusion; projective-field condition; cyclotomic absolute irreducibility versus ordinary irreducibility. | Reduction partitions and independent seed order retained; no circular lifting premise. |
| `shortEquationFamily`, discriminant/height/count API, `density_one` | (0,0) and (−3,2) singular; (0,1),(0,64) distinct nonsingular equations related by scaling 2; X≤0; finite lattice count versus isomorphism quotient. | Discriminants 0,0,−432,−1769472; coefficient-pair and norm-height formulations retained. |
| `cartanCurve`, `small_curve_models`, `nonsplit_cartan_conic`, `mixed_elliptic_model` | Compactification versus affine poles; actual Cartan conic versus its normalizer line; proper normalization versus raw fiber product. | General constructions remain suppliers and source-coordinate comparisons remain targets. |
| `b3J`, `b5J`, `ns3J`, `ns5J`, `s3J`, degree/evaluation API | Reduced numerator/denominator coprimality; samples 1792,38477541376,8,0,−1728; poles; function-field degrees 4,6,3,10,6. ns5 has integer degree zero and infinity value 8000. | Totalized evaluation at a pole is distinguished from the proper j-map; no division by a geometric zero denominator. |
| `B`, `B_mordell_weil` | Δ=−675, j=0; (1,2) fails when a3's sign is reversed; saturated generator versus twice a generator. | Rank-one/bijective ℤ-multiple condition retained; neither trivial nor finite cyclic groups satisfy it. |
| `E15`, `Es35`, `LevelFifteenModels`, `level_fifteen_finiteness_transfer` | Cubic roots (0,−16,−25) and (0,−1,−16); discriminants 207360000 and 921600; rank 0 versus rank 1 under isogeny. | Models, maps and rational groups assumed; finite generation/isogeny finiteness implication kept as a target. |
| `QuadraticLevelFifteenTorsion` and its six projections | Degree-one fields excluded; Q(i) grows only E15, Q(√5) grows both, neither root gives no growth. Eight rational points versus eight additional Gaussian torsion points. | Replaced computation theorem with explicit input structure and three conditional Lean examples. No full-group finiteness follows from the torsion table alone. |
| `quadratic_level_fifteen_points` | Imaginary quadratic excludes √5; finite full group makes every point torsion. Positive-rank √−10 tests the missing finiteness premise. | All-point classification is derived only with the explicit finite-point hypothesis. |
| `gaussianExceptional`, invariant/conjugation API, `GaussianComparisonData`, `gaussian_exceptional_modular` | Reduce i²=−1: Δ=58752+107136i, j=(−47709+15363i)/256; conjugation changes i's sign; j is nonrational. Finite matching without exhaustive admissibility is insufficient. | Coefficient identities remain targets; named finite data replaces CN.5, while recognition and modularity transport remain targets. |
| `ns3b5Quartic`, `GenusOneModel`, Fricke API | h(0)=−75, h(−2)=−3, h(−5/2)=−75/16; squarefreeness; x⁴h(5/x)=25h(x) for x≠0; scalar 1 gives a rational infinity point. | Model comparison assumed; literal arithmetic retained. New scalar control appears in README and Lean. |
| `genusOneSpecialPoints`, coordinate/conjugation API | All five triples satisfy the weight-(1,2,1) equation for s²=−3. Two infinity triples are distinct in characteristic zero. | No ordinary-projective homogenization or rational basepoint introduced. |
| `GenusOneJacobian`, `genus_one_no_rational_point` | Jacobian cubic factors as (x+15)(x+18)(x−30). The untwisted quartic factor is 1 mod 3 for each residue; integral and reciprocal charts force odd 3-adic valuation of a square. | Actual Jacobian/local obstruction assumed; rational emptiness remains a base-change consequence to prove. |
| `GenusOneRationalPicard`, `genus_one_picard_comparison` | Jacobian has four rational points, divisor image two. Conics become u²+3(v+1)²+12=0 and +9=0; the third has (3,2). | Exact rational-divisor image assumed; index two/nonsurjectivity derived, without equating rational divisors and all rational geometric classes. |
| `GenusOneQuadraticPoints`, Riemann–Roch data | Three additive-numerator substitutions give the author-script fibers. For α=−s, the first fiber becomes −36x=0; division by its leading coefficient is invalid. | Classification and computational data assumed with the exceptional fiber and infinity exclusions explicit. |
| `genus_one_points_modular` | P=(1+2i,3+6i) has norm-five x. Plus lift gives (1−2i,3−6i); minus lift gives the same x and a different y. Real fields use FLHS; CM uses its separate branch. | New Lean two-coordinate witness mirrors the README Check. Modularity uses quotient moduli and a geometric degree-five conjugate isogeny, without choosing a lift from x alone. |
| `b3ns5Sextic`, `genus_two_model`, `genus_two_jacobian` | Squarefree sextic; roots −1,1/3,2; constant −8; leading square 9 gives two rational infinity points. Rank zero is separate from torsion or bounded search. | All genus-two model, rank and group targets retained. |
| `genus_two_divisor_dichotomy`, `genus_two_quadratic_points` | Canonical degree-two class moves; noncanonical class has unique effective divisor. Nineteen classes split 9+2+2+6. Substitution checks both signs of the √−11 pair. | Exact degree, rational sums, infinity and real/imaginary distinctions retained. |
| `elevenExceptional`, invariants, `eleven_exceptional_modular`, `genus_two_points_modular` | Reduce a²−a+3: Δ=4512−736a, j=(11155375a+3126750)/32. Full nonsplit normalizer versus containment; rational infinity fixed by σ but exchanged by w3. | No false residual shortcut or universal σP=w3P assertion; rational-j and nonrational affine branches retained. |
| `quartic1`, `quartic2`, their coordinate maps, `quartic_involutions`, `quartic_models` | Homogeneous degree four; M1²=I, M2²=25I, F2(M2v)=625F2(v); det M2=−125. Zero vector identities versus nonzero projective points; characteristic five would destroy the inverse. | Polynomial identities retain their ring generality. Geometric targets explicitly inherit `GenusOneModel`; characteristic-zero projective comparisons stay separate. |
| `quarticImaginaryPoints`, equation/j API | Both triples reduce to zeros under s²=−55; denominators 4,28,56 invertible in characteristic zero; distinct nonrational x, Z=1. | Literal equation check remains distinct from certified modular j=−32768. |
| `quartic_jacobian_ranks`, `quarticTorsionClasses`, `quartic_jacobian_torsion` | Factor ranks (0,1,0)/(1,0,0); divisor degree 5(1+1+2−4)=0; exact orders 10,2 and independent generators; first torsion only embeds in (Z/2)². | Descent, projector, principal-divisor and reduction certificates remain targets; no numerical-rank or torsion-equality substitution. |
| `quartic_pullback_indices` | Rank-equal norm/pullback gives only 2J inclusion; torsion exponents yield 4J1⊆2G1 and 10J2⊆5G2+J2[2]. | Typed G2 consequence retained; no unjustified saturation or stronger integral inclusion. |
| Both quartic quadratic-divisor sieves and both quartic modularity endpoints | I=4/10; primes 43 versus 11,43; eight divisors covering seven reduced classes versus sixteen exceptions, including six real pairs. | Full bad-coset emptiness remains a target. Imaginary restriction retained for the second endpoint; all geometric statements inherit the model input. |
| `imaginary_quadratic_residual_modularity` | Ordinary irreducibility at 5; mod-3 exclusion is equality with the whole split normalizer, not containment. | Explicit genus-one inputs propagated; original sharp residual hypotheses retained. |
| `finite_level_fifteen_modularity`, `small_imaginary_quadratic_modularity`, Lean finiteness milestone | Finite compactified point set versus finite torsion; d=1,2,3,5 versus d=10; Gaussian extra torsion does not force positive rank. | Seven arithmetic inputs explicit in the main and small-field modularity statements. Small-field rank computations remain targets, and Lean retains their purely arithmetic finiteness conclusion. |
| `sqrt_minus_ten_infinite_level_fifteen` | At x=−1,y=6s,s²=−10 both sides are −360; y=6 gives 36 and fails. The nonrational point cannot be torsion under the no-growth input. | Lean now takes `hTorsion` explicitly; modular X0(15) infinitude also cites `LevelFifteenModels`. No nonmodularity claim. |

Global domain checks: number fields and characteristic-zero hypotheses exclude
finite fields, characteristic two and equal-characteristic DVR substitutions in
the arithmetic/geometric assertions. The two coordinate maps remain identities
over rings, including the zero ring/vector; they alone do not assert geometric
invertibility. The level primes are exactly 3 and 5; dyadic seed assumptions are
separately imported. The divisor degree is fixed at two and elliptic/Jacobian
ranks are the specified zero/one cases, not arbitrary n or arbitrary modules.
There is no integration, unit-ideal or q=1 theorem here to which an unrelated
compactness, DVR or zero-module example could be applied. All denominators in
field identities have their nonvanishing hypotheses or a characteristic-zero
constant; totalized rational-function evaluation is explicitly distinguished.

## Validation

- Independent exact rational/polynomial calculation: **95 controls passed**,
  including the new sign/scalar/input-boundary controls. These calculations do
  not rerun Magma or prove rank, saturation, torsion completeness or sieve
  completeness; those retained targets have their exact certificate obligations.
- `lean-check research/blueprint/packages/EllipticCurveModularityImaginaryQuadratic/Suggested.lean`:
  exit **0**, **zero errors**, **63 warnings**, all `declaration uses sorry`.
  Final file: 528 lines, 19 light definitions, one proof-only input structure,
  19 theorems, five ellipticity instances and 45 examples.
- `python3 scripts/check_sorry_data.py` on the suggested file: exit **0**.
- `python3 scripts/check_blueprint.py` on the unchanged accepted packet:
  **zero errors, zero warnings**, 68 nodes, 69 API items, 69 unit tests.
- Intake file validation and `git diff --check`: **zero problems**.

Only the package README, Suggested.lean, review.json and this handoff change.
The accepted packet and all atlas/base data are untouched. No fix residue or
checkpoint remains; future proofs are the stated roadmap work.
