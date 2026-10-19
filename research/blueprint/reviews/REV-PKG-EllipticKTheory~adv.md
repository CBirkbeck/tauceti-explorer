# Review: K-theory of curves and elliptic curves

Issue: #11068 (`REV-PKG-EllipticKTheory~adv`). Reviewer: Codex, session
`codex-qMo7Az`. Date: 2026-10-19. **Verdict: needs_changes.**

The fixing review is complete. The package has been corrected in place, but §7.7 retains
one explicit source-comparison gap: the identification of its corrected symbol class with
Bloch's historical normalisation. This is a completed review with a specific unresolved
finding, not an unfinished-review checkpoint. No packet was edited.

## Remaining defect and handoff

`blochClass_eq_Bloch` in §7.7 needs verification against Bloch, *Higher regulators, algebraic
K-theory, and zeta functions of elliptic curves*, Lecture 10, (10.1.2), p. 76. The book is not
among the cleared library sources, and an authorised readable copy of that passage was not
available. No unofficial book mirror was used. The inherited locator is explicitly marked
unverified in the README and bibliography.

The revised package gives an independent construction: §7.6 proves the correction by
valuation and Weil reciprocity, extending Young, Lemma 3.1, pp. 37–38; §7.7 distinguishes a
choice-dependent lift from its canonical class in the quotient by constants and torsion,
and explains the tensor-exactness argument. What remains is to check the historical
quotient, the factor `1/C`, and the tame-symbol orientation. Resume at this comparison;
obtain an authorised copy, verify the locator and equality, then update the verdict if the
comparison is correct. If Bloch's normalisation differs, correct the identification without
removing the general construction or its negative controls. This gap prevents acceptance
for the upstream draft PR.

This report is also the handoff note: the issue permits only the package files and this
report. All information needed to resume is here; scratch source files are disposable.

## Scope, shape and coverage

Read WORKERS.md, PACKAGE_REVIEW.md, PROTOCOL §§5, 13, 20, UPSTREAM_GUIDE.md and the expansion
protocol. Compared the package with the PadicMeasuresIwasawaAlgebras exemplar and current
JacobianChallenge, UniversalCovers, ModularCurves and ProfiniteArithmetic material. Read the
package, the parent packet's 53 nodes, the E.5 continuation's 11 nodes, the E.6 continuation's
six nodes, and the EllipticKTheory entries in the reviewed library audit. The continuations
refine some parent nodes; these counts are input nodes, not distinct new targets.

All eight layers and all three worked examples remain. The README retains its detailed
API and Checks; new definitions and repairs have discriminating positive and negative
controls. Heavy K-theory, motivic, cohomological and explicit-place statements remain README
targets, named in the Lean closing comment. There are no admitted data definitions or
admitted examples. `metadata.toml` remains `topic = "math.KT"`, the correct subject.

The source text is expressed in the package's own mathematical exposition. No passage
from a paper or book was copied into a deliverable, and no source is summarised section by
section. No suspicious instructions were encountered in the material used.

## Library, ownership and prerequisite audit

Checked the pins Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Also checked current TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, without building either read-only checkout.
Searched by objects and hypotheses: projective Weierstrass charts and base change, divisor
classes and line bundles, degree-one points, higher K-groups and Adams operations, tame
symbols and symbol certificates, torsion functions, regular models and their markings.

The search covered current roadmaps and Completed, including all nine post-snapshot
roadmaps and the four named Completed additions. OperatorTheory's individual subroadmaps
were included in the recursive search. Read relevant results in AlgebraicVectorBundles,
GrothendieckEulerForms, AlgebraicCurves, EllipticCurves, ModularCurves, JacobianChallenge and
StableReduction; unrelated operator, lattice, topological and analytic targets are not
K-theory-of-curves suppliers. Current exact-category/Grothendieck-group work supplies
foundations, not the higher curve K-theory planned here.

Removed the following duplicate owned targets, retaining the supplied results in the
boundary/contracts sections and keeping only the new comparison content:

| Removed ownership | Supplier | Content retained here |
| --- | --- | --- |
| A second projective elliptic scheme and its base definition | Current `WeierstrassCurve.projModel`, `projModelOver`, `projModelZero`; ModularCurves 1A | Identification of the affine chart with the existing coordinate ring and the two-chart cover |
| Properness, smoothness, and absolute integrality of that model | Current `isProper_projModelOver`, `smoothOfRelativeDimension_one_projModelOver`, `isIntegral_projModel` | Geometric integrality, dimension, and genus/cohomology |
| A second function-field/closed-point equivalence | ModularCurves 2A and AlgebraicCurves 12A–12B | `closedPointEquivPlace_compat`, fixing the actual algebra map, orders, residues and degrees |
| A second points equivalence or group law | ModularCurves 1B, 1D; pinned point/place/class equivalences | `pointsDivisor_compat`, including coordinate changes |
| A second scheme Weil-class/Picard equivalence | Current `SchemeWeilDivisor.classGroupAddEquivLineBundleClass` | Compatibility with function-field classes, their sign, and open-curve centres |
| A second genus-one point/Picard bijection and class-group splitting | Current `degreeOneEquivPicZero`; pinned `pointEquivDegreeZeroDivisorClass` and `classGroupAddEquivPicZeroProdInt` | The diagram identifying them, with degree placed first by exchanging factors |
| The rational-point principal-divisor criterion and single-point torsion functions | Pinned point/class equivalence, `Divisor.divisorClass_eq_zero_iff`, `exists_principal_zsmul_pointPlace_sub_infinity` | The full-torsion aggregate `blochRho` and scheme-divisor compatibility |
| Néron model properness/good-reduction equivalence | NeronModelsAndSemistableAbelianVarieties §§1.8, 2.7, 6.5 | Use of that comparison in the regular-model Checks |

No `UPSTREAM:` or FoundationsAndLibraryIntegration citation remains. Consulted the tier
order: this roadmap is outside the 94-roadmap list, so no tier number was invented for it.
The existing package's four arithmetic inputs are explicitly owned in §5.5 rather than
silently requested back from MotivicEtaleKTheory or K2SymbolsBrauer, avoiding the circular
Harder argument. Their owners and downstream consumption are stated in the boundary.

Two missing supplier contracts were repaired:

- M.6 supplies the motivic comparison for smooth schemes over a perfect field. It does not
  supply regular, possibly nonsmooth curves over arbitrary fields. §4.5 now plans the
  regular-curve homotopy-coniveau adapter, its cycle layers, convergence, Adams action and
  smooth-case comparison, using Levine's regular-scheme construction. The imperfect-field
  target was preserved. Arbitrary-field applications in §§4.6 and 5.5 explain the passage
  through smooth models over the perfect prime field and filtered colimits.
- The non-elliptic finite-field statements need general curve Weil bounds, a degree-one
  integral zero-cycle, and all `2g` Jacobian eigenvalues. §5.5 supplies the zero-cycle and
  splitting, and §§5.5/5.8 state the exact DeligneWeightsAndPurity DWP.1 input. They no longer
  apply an elliptic Hasse polynomial or assume a rational point for an arbitrary curve.

These are new adapter targets in this package; no other roadmap was edited. The full
regular-curve and general finite-field-curve targets have not been replaced by elliptic
special cases.

## Sources

Checked the inherited Bloch citations as far as authorised access allowed; the unresolved
one is recorded above. The correction and transfer arguments no longer rely on an unread
Bloch proposition or exercise. Source checks also covered the tame orientation, Steinberg
relations, exact localisation, Adams weights, Geisser–Levine, explicit DGJK divisors and
residues, and the Stacks regular-model constructions.

A reproducible random sample used Python `random.Random(11068).sample(pool, 15)`, with a
pool of 30 distinct explicit source/locator pairs from the package. The pool comprised
Weibel I.5.14; II.8.2.1, 8.2.3; III.6.3; V.6.6, 6.6.3–4, 6.12, 9.5; VI.4.3, 4.7, 6.4, 6.5–6,
6.7–8; Scholl 1.1.1–2, 1.1.6–7, 1.3.3, 1.3.6; Young Lemma 3.1 and Theorem 3.3; Conrad
Definition 3.1, Theorem 3.10 and Corollary 4.7; DDJZ Lemma 4.2, Proposition 4.3, Remark 4.14
and Theorem 8.3; DGJK Proposition 10.2 and Remark 10.3; Stacks 0C2N and 0C6B. This is a
sample from those 30 candidate pairs, not a claim of uniform sampling from every citation.
Every selected passage was read in a primary author/institutional source:

| Selected locator | Result |
| --- | --- |
| Conrad, Theorem 3.10, p. 8 | Existence and uniqueness in positive genus checked |
| Scholl, 1.3.3, p. 8 | Model-independence maps and Cartan argument checked |
| Conrad, Definition 3.1, p. 6 | Generic-fibre marking checked; strengthened to an isomorphism over the fraction field |
| Stacks, Lemma 55.10.1, 0C6B | Positive-genus minimal-model uniqueness checked |
| Scholl, 1.1.1–1.1.2, p. 3 | Regular projective models and S-integral image definition checked |
| Scholl, 1.1.6–1.1.7, p. 4 | Weight statement and warning checked; removed the unsupported elliptic attribution of the nonregular-model example |
| Weibel, VI.6.7–6.8, p. 505 | Positive K-descent and odd/even finite-field forms checked |
| Weibel, VI.6.5–6.6, p. 504 | Twist restriction and cohomology shift checked |
| Conrad, Corollary 4.7, p. 12 | Regular Weierstrass/irreducible minimal-fibre criterion checked |
| Weibel, V.6.12–6.12.1, pp. 416–417 | All-point localisation and normed reciprocity checked |
| Stacks, Lemma 54.16.9, 0C2N | Projective contraction and regular contracted point checked |
| Young, Theorem 3.3, p. 41 | Fibre obstruction torsion except at split multiplicative reduction checked |
| DDJZ, Remark 4.14, p. 11, arXiv v2 | Rational Galois descent checked |
| Weibel, II.8.2.3, p. 147 | Euler pushforward checked; constant-field caveat added to Riemann–Roch |
| Weibel, VI.6.4, p. 503 | Geometric groups and coefficient twist shift checked |

Additional locator repairs: Weibel I.5.14 does not establish noetherian regularity; §1.3
now uses Stacks 29.15.6, 10.140.3 and 10.119.7. Resolution preserves the regular locus,
not the normal locus: §6.2 now uses the construction in Stacks 54.14.5 (0BGP), while
55.8.3 (0C2U) is cited only for local existence. The original Stacks 55.8.3 proof's
normal-locus phrase is itself inaccurate; a normal singular surface is the negative
control, and no upstream source was edited. Levine's §3.2, Lemma 3.3, Proposition 3.5,
Theorems 12.12 and 14.7 supply the regular-scheme weight comparison. Weibel VI.4.3.2,
p. 482, actually gives integral injectivity of the degree-three Milnor comparison; a
kernel-exponent bound does not provide a nonzero-kernel example.

Primary sources used include [Weibel](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf),
[Conrad](https://math.stanford.edu/~conrad/papers/minimalmodel.pdf),
[Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/k1.pdf),
[Young](https://etheses.durham.ac.uk/id/eprint/5114/1/5114_2567.PDF),
[Levine](https://www.esaga.uni-due.de/f/marc.levine/publ/KthyMotI12.01.pdf),
[DDJZ v2](https://arxiv.org/abs/math/0405040), [DGJK v1](https://arxiv.org/abs/2605.11100),
[Poonen](https://math.mit.edu/~poonen/papers/Qpoints.pdf), and the Stacks tags cited above.
Printed K-book page `n` corresponds to one-based PDF page `n + 8`.

## Adversarial mathematics pass

Each row covers the whole indicated statement/API family, including its displayed
identities and named computation rules. Inputs not applicable to a statement were not
forced into it: finite fields have `q ≥ 2`, divisors use nonzero rational functions, and
regular arithmetic surfaces have codimension-one DVRs, not arbitrary valuation rings.
The examples, dependencies and downstream summaries were checked against these same
families. An unchanged row means no defect was found in this pass, not that the theorem
has been formalised.

| Statement/API family | Instances and calculations tried | Result and change |
| --- | --- | --- |
| Curve, closed-point and field conventions | Imperfect `F`; a degree-two point; affine versus proper curve | Retain regularity separately from smoothness; all closed points remain |
| Weierstrass origin/equation convention | Smooth cubic over F₂; singular `y²=x³` over F₅ | Origin `[0:1:0]`; nonsingular point group does not count the singular point |
| K versus G and coefficient conventions | A field, a regular curve, a singular fibre; integral versus rational classes | Cartan only on regular schemes; fibre obstruction stays in G-theory |
| Tame orientation and residue units | Unit `u` of residue 2 and uniformiser `t`, in both orders; `{t,t}`; characteristic two | Values `2`, `1/2`, `−1`; proved Lean witnesses added |
| Arithmetic Frobenius and twists | F₂ traces `2` and `−2`; `i=0,1,2` | Extra `q^i` retained; orders 5/13 distinguish the sign and twist |
| S-integers, markings and coefficients | Empty S, one inverted prime, all primes; an absolute field automorphism | Marking required over F; rational and integral variants distinguished |
| §1.1 charts, cover, zero section | `Y=Z=0`; origin absent from affine chart; singular cubic | Remove duplicate scheme carrier; keep actual chart comparison and two-chart cover |
| §1.2 geometric integrality, dimension, cohomology | Singular cubic, arbitrary characteristic, field extension | Cubic still integral of arithmetic genus one; smoothness not inferred |
| §1.3 noetherian regular/DVR hypotheses | Generic stalk versus closed stalk; regular nonsmooth imperfect-field curve | Correct sources; no dimension-one DVR claim at the generic point |
| §1.4 closed-point/place compatibility | Origin; degree-two point with residue Q(√−3); field-map transport | Keep the specific algebra-map, valuation and residue comparison, not a duplicate equivalence |
| §1.5 points/divisor compatibility | Zero, affine point, coordinate change, singular cubic | Diagram target replaces a duplicate point group |
| §1.6 scheme isogeny comparison and zero map | Identity; prime-to-characteristic `[m]`; constant map | Nonzero isogenies finite; zero map separate, with origin and composition controls added |
| §2.1 rank/determinant class API | Rank zero skyscraper; unit; degree-two point | `[O_x]` has coordinates `(0,O(x))`, with positive divisor sign |
| §2.2 Euler characteristic and pushforward | P¹, elliptic curve, nonrational point; P¹ over F₄ viewed over F₂ | General formula `χ(L)=deg L+χ(O)`; `1−g` requires full constant field |
| §2.3 class/Picard/function-field comparison | Principal divisor; origin; A¹ missing infinity | Restrict to places centred on open X; fix `O(D)`, not `O(−D)` |
| §2.4 Picard decomposition and point diagram | Origin, rational point, real conic of index two | Exchange the existing Pic⁰×Z factors; a degree splitting needs degree-one data |
| §2.5 line-bundle descent | Rational origin; real conic; separable versus algebraic closure | Keep pointed descent and the conic obstruction; imperfect-field invariants need separable closure |
| §2.6 square-zero product | Two rank-zero classes; line bundle minus one; `(0,1,O)²` | Remove the ill-defined componentwise ring on E(F); degree-coordinate square is zero |
| §2.7 elliptic K₀ | F₅ curve with group Z/4×Z/2; rational skyscraper; origin | Rank, degree and point coordinates agree with §2.6 |
| §3.1 localisation and exact tail | `(t²+1)/(t²+2)` on P¹_Q; rank of O versus determinant degree | All closed points necessary; final map rank, not degree |
| §3.2 boundary/tame comparison | `{t,t²+1}` and its reverse at Q(i); unit/uniformiser | Values `i` and `−i`; inverse K-book orientation recorded |
| §3.3 divisor boundary, transfer and rank | `div(t²+1)=[x]−2[∞]`; `[O]↦1` | Positive divisor sign and rank endpoint retained |
| §3.4 open restriction | Empty deleted set; delete infinity | Residue map is projection away from deleted points, in the stated direction |
| §3.5 finite pullback | `t=s²` at zero, ramification index two; identity | Residue changes `u` to `u²`; ramification factor retained |
| §3.6 finite transfer | Identity; nontrivial residue extension; restriction then norm | Residue-field norms and multiplication by field degree retained |
| §3.7 rational K₂ injectivity | Every closed number-field residue; torsion with unbounded exponent | Tensor Q kills the kernel without a uniform annihilator; no integral identification asserted |
| §3.8 finite-field integral injectivity | P¹; finite nonrational residue fields | Vanishing K₂ of each residue field gives integral injectivity |
| §4.1 curve SK₁, cokernel, norm and affine comparison | P¹ and its two affine charts; F₂ where F× is trivial | Remove arbitrary-affine SK₁ vanishing; proper SK₁ is not determined by chart SK₁ |
| §4.2 base-point splitting and self-intersection | Point equal to P and distinct from P; Q(i) norm of i | Self-intersection `(1−1)u=0`; `π_*P_*=id`, norm is 1 in the example |
| §4.3 coniveau and filtration API | Dimension zero, A¹, P¹, `n=0,3` | Columns can vanish; put K₋₁ of a field equal to zero in the endpoint |
| §4.4 K₃ extension | P¹_Q and 37a1, both containing two Z/48 contributions | Kernel alone is not K₃; remove undefined integral K₃-ind-to-curve map |
| §4.5 weight components, tower, layers, convergence, Adams, pullback | P¹ weights; P² index-two integral obstruction; regular nonsmooth curve over F₂(t) | Preserve arbitrary regular curves; add sourced tower adapter instead of misapplying smooth/perfect M.6 |
| §4.6 field indecomposable K₃ and Gysin weights | Q, number-field rank r₂, P¹'s F¹ | Rational eigenspaces correct; integral Milnor map is injective, not an example of a nonzero 2-kernel |
| §5.1 curve pull/push API and isogeny finite flatness | Identity; generic-point restriction; nonproper open; finite field extension | Proper/perfect pushforward separated from unrestricted perfect-complex pullback |
| §5.2 isogeny projection formula | Unit class; separable degree-two isogeny | Composite is multiplication by `[f_*O]`; degree alone can be wrong |
| §5.3 determinant and coordinate action | Identity; `[3]`; separable degree two in characteristic not two | Extra term `rP_f` retained; trace pairing needs separability, half-trace needs 2 invertible |
| §5.4 P¹ basis and inverse | `[O]`, `[O(−1)]`, `[O_∞]`; F₂ positive groups | Coordinates `(1,0)`, `(0,1)`, `(1,−1)`; zero even group has order one |
| §5.5 coprime degrees and degree-one zero-cycle API | Degrees 2 and 3; zero cycle; rational point | Signed cycle `[x₃]−[x₂]` gives composite `3−2=1`; a lone degree-two point gives 2 |
| §5.5 BMS, exact reciprocity, tame-kernel finiteness, Geisser–Levine | Affine line, punctured line, F₂, n=2 versus n≥3, imperfect field | Distinct arithmetic inputs retained; normed-composite vanishing alone not exactness; arbitrary-field colimit spelled out |
| §5.6 Harder and elliptic specialisation | `n=1,2,3`; P¹; punctured affine line | Properness needed; retain all five terms in the p-divisibility argument |
| §5.7 geometric Galois module and coefficient table | `i=1`; P¹; integral versus divisible coefficients | Coefficient twist `i−1` versus integral twist `i`; missing geometric bar and extension/splitting issues explicit |
| §5.8 cohomology descent | `j=0` fails; `j=2`; genus zero, one, two | Restrict to `j≥2`; use all 2g roots, not an elliptic quadratic for a general curve |
| §5.9 positive K-descent | `n=0,1`; constant-field extension | Positive-degree finiteness separate; zero-cycle covers curves without a chosen rational point |
| §5.10 twisted Frobenius kernel and map API | Origin; rational 2-torsion over F₃; excluded characteristic-2 torsion; `i=0,1` | Definition valid for nonsingular point groups; elliptic K-interpretation requires ellipticity |
| §5.11 odd/even groups, lattice cokernel and orders | F₂ traces ±2; F₃ trace 0; `i=1,2`; reduction modulo p | Orders 5,13,28,25,41; use cokernel on Tate lattice, not its zero invariant kernel; no cyclicity from cardinality |
| §6.1 model carrier, generic inclusion, fibre multiplicities and Weierstrass comparison | Good, I₁, I₅ and rescaled nonminimal equations; base-field automorphism | Add over-F marking; regular total scheme need not have smooth fibres; Néron properness deferred to its owner |
| §6.2 existence and regular-locus preservation | 37a1 identity; 11a1 resolution; normal cone `xy=z²` | Change normal locus to regular locus, with correct construction source |
| §6.3 Hom/category, minimal predicate and local comparison | Identity; elliptic involution; one point blow-up | Marking rejects involution; outgoing map for minimality; uniqueness needs Dedekind fraction-field hypotheses |
| §6.4 common blow-up model | Equal models; one blow-up; two marked models | Arrows from common dominating model to both models |
| §6.5 locally minimal existence | Smooth model; single blow-up; finite bad-prime set | Contract actual exceptional Cartier curves; component-count termination retained |
| §6.6 terminality and local criterion | Blow-down; identity; genus-zero failure | Arrows go from arbitrary regular model to minimal model; positive genus essential |
| §6.7 uniqueness and localisation | Invert 37; invert no new prime; unmarked involution | Uniqueness is marked; principal-open localisation and comparison composition retained |
| §6.8 integral/S-integral images and independence | Empty S; good prime; all primes; nonregular total schemes | Keep integral all-degree image independence with Cartan; do not label Scholl's general counterexample elliptic |
| §6.9 good-prime condition | q=2 fibre, zero K₁; split multiplicative fibre | Good prime imposes no rational condition; integral surjectivity only when obstruction vanishes |
| §6.10 vertical residues | Integral β versus rational α; good and split multiplicative fibres | Correct types; multiplicities use uniformiser order; integral conclusion requires a positive multiple |
| §7.1 tame-value and candidate API | Two units; negative coefficient; Steinberg single symbol; characteristic-two sign | Formal candidate not Steinberg quotient; two-term subtraction gives quotient of tame values |
| §7.2 certificate, soundness and completeness | Empty support; 11a3 corrected symbol; norm-one degree-two counterexample | Require all tame values on support, not a fixed count; norm one is insufficient |
| §7.3 integral certificate and soundness | Global units; 11a3 at 11; u=1/3 obstruction | Empty horizontal support allowed; exceptional primes must include bad fibres even for constants |
| §7.4 last rational point and normed reciprocity | Degree-one last point; degree-two norm kernel; explicit five-factor product | Degree-one hypothesis retained; unnormed product differs from one |
| §7.5 aggregate torsion function and divisor compatibility | C=1; C=2 over Q; ordinary characteristic-2 E[2] | Require C positive and prime to characteristic with full geometric torsion rational; remove duplicate single-point torsion construction |
| §7.6 Bloch correction | T trivial; general positive annihilator; nonzero P and O | Tame factors `c_P^C c_P^(−C)=1`; origin by reciprocity; positivity explicit in Lean |
| §7.7 lift, canonical quotient class and well-definedness | C=2 on `y²=x³−x`; change constants/correction; tensor sign projection | `{1/y,x}` not correctable before multiplication by C; distinguish lift from quotient class; historical identification remains the stated gap |
| §7.8 transfer of certified classes | Identity extension; Q(√2)/Q with conjugate degree-two residues | Residue product `1/4·2x₀=x₀/2`; no missed conjugation; replace unread Bloch exercise citation |
| §7.9 Galois descent | Trivial G; nontrivial degree; invariant but nonintegral u=1/3 class | Norm/degree rational inverse; descent does not imply vertical integrality |
| §8.1 E₄ certificate and nonconstancy | Eight residues; specialisations 0 and `{−1,5}` | Values multiply to one; nonconstant detected at 5; degree zero alone does not prove divisor exhaustiveness |
| §8.2 degree-two residue example | Five local values; field norm; norm-one nontrivial residue | Normed product 1, unnormed product `−1−√−3`; negative certificate retained |
| §8.3 split multiplicative example | 11a3 positive; u=1/3 negative; u=4 positive after doubling | Vertical value `1/w` has infinite order; call displayed global model projective, asserting regularity only at η |

All divisions in the retained formulas are by nonzero units, positive annihilators after
localisation, nonzero field elements, or inverted differences of eigenvalues under the
explicit finite-coefficient hypothesis. The rational `1/[L:k]` appears only for a finite
extension of positive degree. Trace splitting uses characteristic different from two.
The Tate-lattice operator is invertible on its rational space by the Weil bounds.

For sign and direction witnesses whose K-theoretic carriers do not exist at the pins,
the named README Checks are theorem targets; they are not forced into unrelated Lean
objects. The Lean closing block retains those target families. The tame sign/orientation,
integer-coefficient quotient, model-marking triangle and characteristic-torsion exclusion
are proved Lean examples over existing carriers.

## Lean signature audit and validation

Checked all retained theorem statements against their `variable` blocks, including the
following independent signature checks (more than ten):

| Signature | Hypotheses/domain checked |
| --- | --- |
| `ord_tameQuotient` | Both functions are units; integer orders cancel |
| `tameValue` | Residue in `P.ResidueFieldˣ`; order-zero witness is proved |
| `card_twistedFrobeniusKernel` | Finite field, ellipticity, algebraic closure, `1≤i`, integer cardinality formula |
| `tame_last_point` | Function field and degree-one exceptional place; all other places quantified |
| `blochCorrection` | Positive C, rational subgroup annihilated by C, complete support, divisors and specified tame constants |
| `mem_twistedFrobeniusKernel` | No hidden ellipticity assumption for the subgroup definition |
| `eq_zero_of_mem_twistedFrobeniusKernel_of_char_smul` | Coprime annihilator and characteristic annihilator force zero |
| `baseChange_mem_twistedFrobeniusKernel_iff` | Rational point, positive coprime annihilator, `q^i−1` natural exponent with `q≥2` |
| `map_mem_twistedFrobeniusKernel` | A k-algebra map commutes with the fixed q-power action |
| `RegularProperModel` and `genericFibreInclusion` | Proper, flat, regular; marking commutes with the fixed F-structure map |
| `Hom.subsingleton` | Dedekind base and actual fraction field; reduced source/dense generic fibre/separated target |
| `tameValue_eq_leading` | Uniformiser order one, leading units order zero, both factorisation equations |
| `tameValue_of_ord_eq_zero`, `swap`, `mul_left`, `self` | Both units and correct integer sign; no conclusion supplied as a hypothesis |
| `tameValue_one_sub` | Two units with sum one, excluding zero and one as required |
| `SymbolCertificate.tame_eq_one_everywhere` | Complete off-support unit condition plus every on-support tame equality |
| `SymbolCertificate.nonempty_iff` | Function-field hypothesis used for finite divisor support |

No `True` placeholder, sorry-bodied data definition, data instance with admitted body,
Lean language server, or new build project was introduced. The added examples are proved,
with at most two per retained definition. The only retained auxiliary order identity is
needed to type the real residue-unit definition; no new K-theory is developed in Lean.

Validation:

- `lean-check` on the final Suggested.lean: exit 0, only declaration-uses-sorry warnings.
  Available memory was above 20 GB; the shared pinned build was used. No compile remains
  running. The file has fewer than 500 lines, well below 5,000.
- `python3 scripts/check_blueprint.py` on each of the parent, E.5 and E.6 packets:
  zero errors, zero warnings. The packets were read only.
- `python3 research/blueprint/intake.py check-files` on the package and review deliverables:
  zero problems.
- `git diff --check`: clean. No private filesystem path is included in a deliverable.
