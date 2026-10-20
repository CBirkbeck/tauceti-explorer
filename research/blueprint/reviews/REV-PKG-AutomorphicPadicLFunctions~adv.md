# Independent adversarial review: AutomorphicPadicLFunctions

Issue #11450; reviewer Codex, session `codex-ycTzpH`; 20 October 2026.
Input: package submitted in #11443 by session `codex-UmyIz6` for #10881.
This reviewer did not write that package. The review is complete, with verdict
**needs_changes**. The corrections below are applied; this is not a checkpoint.

## Remaining defects and the acceptance boundary

1. **Rank-one cofiniteness has no verified replacement proof.**
   `hsieh_centralValues_cofinite_rankOne` (§3h.7) and
   `HeckeValues_cofinite_rankOne` (§3h.8) retain the full intended conclusions.
   Hsieh 2014 Theorem 7.1, p. 759, uses Hida 2004 Theorems 3.2–3.3 on
   p. 760. Hida's revision dated 27 March 2025, pp. 2–3 and Theorem 5.2,
   pp. 28–29, withdraws the inference to cofiniteness. Algebraic Zariski
   density in a torus does not imply finitely many bad characters, even in
   rank one. Corollary 5.3, pp. 29–30, restricts bad conductor levels without
   proving finiteness. Supply an independent argument under the actual local,
   residual-irreducibility and conductor hypotheses of each target. A special
   result over Q cannot replace the requested general totally real target.
   The construction, interpolation and Fourier μ criterion do not depend on
   this strengthening. Neither target was deleted or declared proved.
2. **The integral rank-one EHLS/Katz dictionary remains incomplete.**
   `unitaryRankOne_KatzComparison` (§5.2) names the required ray-group,
   complex-shift, local-section, ordinary-pairing and period identifications.
   EHLS §1.2, pp. 9–11, motivates the comparison but supplies no full integral
   identity with those choices. Establish the dictionary, including its
   coefficient lattice and correction unit/ideal, before invoking
   bounded-measure uniqueness. Agreement of unnormalized L-values is
   insufficient.
3. **Lower-owner extensions must be incorporated before an upstream port.**
   The twenty old Layer 3 construction nodes are detailed contracts for
   PadicFamilies Layer 5, as required by the upstream order. The checked
   PadicFamilies §5.10 coefficient-family/Eisenstein API does not yet supply
   the entire Deligne–Ribet/Katz construction. In particular the ordinary
   finite-field equivalence and compactified ideal space for the full
   dyadic refinement must have an actual lower-owner plan. The general
   compact-support/cochain-compatible Eichler–Shimura–Harder input also
   needs the stated ArithmeticLocallySymmetricSpaces extension. These
   contracts are useful specifications, not evidence that the suppliers
   already provide them. Carry the contracts to their owners without making
   PadicFamilies depend upward on this roadmap. Editing those owners is
   outside this review's permitted files.

## Corrections applied

- Separated the prime-to-p tame ray modulus from the automorphic level.
  Classical GL₂ permits any nonzero level; overconvergent Layer 2 requires
  `(p)|𝔫` (BSW §6.1, p. 21). This removes contradictory standing hypotheses
  without restricting classical generality.
- Restored the archimedean sign in the p-adic avatar on a **full idele**
  (BSW Definition 1.3 and Proposition 1.4, p. 7). For the inverse norm over Q,
  the diagonal idele −1 gives `(−1)·1·(−1)=1`; omitting the first factor
  gives −1 and prevents descent through Q×. Positive-infinite representatives
  alone conceal this defect.
- Removed a false claim that every even finite-order character vanishes at
  zero. The even trivial character over Q has ζ(0)=−1/2, pinned by Mathlib
  `riemannZeta_zero`. The totally odd sufficient theorem is preserved.
- Corrected the Hilbert cusp normalization. A norm-negative first-column
  scaling changes an odd-weight constant by a sign. Over Q, A and −A give
  opposite constants at weight one and the same constant at weight two.
  Added the GL₂⁺ representative, ideal/determinant factors and the distinct
  transport for nonconstant Fourier indices (Dasgupta–Kakde §§7.2.3–7.2.6,
  pp. 44–46).
- Added independent failures of weight nonnegativity and purity, negative
  critical indices and the weight-zero critical boundary. The proved Lean
  examples now test these clauses separately. Added the orientation API and
  zero-degree sign check; retained two examples per light definition.
- Made the analytic polynomial chart explicit: P(z,1) has X=z, Y=1;
  diag(2,3) gives 3z,2, and the two unipotents give z+1,1 and z,z+1.
  The existing proved coordinate examples pin the same substitution.
- Required the period coefficient field to contain the normal closure of F,
  as well as Hecke eigenvalues (BSW Theorem 2.3, p. 10).
- Corrected the dyadic fibre count: level p has p−1 components for **every**
  p; over Q, levels 2 and 4 have one and two respectively.
- Restored the full Hida 2010 Theorem 3.20 local-ring linear-disjointness
  target and the fixed nonzero parallel weight/Hasse-form hypotheses of
  Corollary 3.21. Specified the stabilizer quotient precisely.
- Defined corrected Hida density in the algebraic torus over Q̄_ℓ using
  character coordinates. It is not an unspecified rigid-space density
  claim. Distinguished the minimal one-residue condition from the stronger
  all-residue hypothesis used in applications.
- Corrected Eischen–Wan Proposition 3.4 to pp. 21–22 and its local section
  computations to §4, pp. 22–30; retained the two different absolute
  convergence ranges. Corrected Hsieh Proposition 2.1 to pp. 720–722, Katz's
  partial Fourier factor to (5.2.26)–(5.2.38), pp. 272–273, and the
  Deligne–Ribet (8.4) locator to pp. 278–279.
- Added Katz's second critical chamber from Corollary (5.7.9), p. 285,
  alongside the first chamber; the tame Hida–Tilouine theorem already
  retained both. Added explicit unramified/ramified local Fourier checks.
- Specified EHLS arithmetic pairs in `Y_H^class`, with the cone and
  differential-weight compatibility, and the m≥n hypothesis for the
  direct integral comparison. The main theorem is not asserted at every
  algebraic χ without a compatible classical pair.
- Replaced an ambiguous anticyclotomic norm image by a typed quotient
  `G/closure(image(g↦g·c(g)))`, with a named universal property and character
  criterion. A field norm has a different codomain. For c=1 on additive Z₂
  the quotient is Z/2Z, whereas for odd p it is zero; passing directly to a
  torsion-free quotient loses that distinction. Added three Checks and the
  heavy definition's closing-comment entry.
- Added specific Checks for `PadicHilbertForm` and
  `deligneRibetParityDefect`, and included the former in the closing Lean
  list. No source passage, source PDF or executable fetched content is
  submitted. Metadata remains `topic = "math.NT"`.

## Scope, prerequisites and duplication audit

The main packet has 105 nodes in eight layers; all are accounted for in the
pass table below, including statements imported from suppliers. The separate
44-node Kings–Sprang Part II is a downstream extension, not part of this
package. No packet or reader was changed. The README retains the definition
APIs, at least three discriminating Checks per definition, worked examples,
exact supplier contracts and layer dependencies. Heavy examples stay prose
when their mathematical carriers are unavailable at the pins; no ad hoc
encoding was added to force them into Lean.

The form was checked against the atlas ModularForms and AdicSpaces roadmaps,
the current GlobalNumberFields and ProfiniteArithmetic roadmaps, and the
PadicMeasuresIwasawaAlgebras exemplar. The current-upstream audit used
TauCetiRoadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, and current Mathlib
`6b7abb3c7686292736be2955bd3eb9ebf63b456a`. All inspection was read-only.
Compilation separately used the required Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Object searches covered the nine post-snapshot roadmaps
AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices,
LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions,
ProfiniteArithmetic and RealAlgebraicGeometry, and Completed
ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts.
The queries included coefficient representations, ray modulus/transition,
profinite limit and closure, Hecke character/conductor/infinity type,
weighted Fourier sum, completed group algebra, analytic dual/compact slope,
ordinary CM/Igusa data, theta translation and integral eigenlattice.

Finite `Modulus`, `classMap`, `classMap_surjective` and
`finite_rayClassGroup` are consumed from Tau Ceti. The transition direction
was checked by reading the pinned declaration. Current complex Hecke
characters, `ofRayClassCharacter`, infinity types, algebraicity and finite
conductors are already supplied; their later availability is distinguished
from the pin. `HeckeCharacter.IsAlgebraic` allows real sign characters.
Mathlib's `gaussSum` and inverse-character shift theorem are consumed; the
weighted finite kernel here just makes the arithmetic sign testable, while
the global conductor/different correction remains new. The current dyadic
cyclic-two group-algebra file concerns rational splitting and the absence of
integral idempotents, not the general completed Iwasawa algebra.

General topology, closure, bundles, connections, integral lattices, compact
operators and rational modular-symbol carriers stay with their existing
owners. No additional source-specific BSW, Hsieh, Finis, EHLS, Disegni–Liu
or Eischen–Wan construction was found in the current library/roadmaps.
There was consequently no additional construction target to delete at this
review; the added ζ(0) value is cited only as an existing-library control.
The reviewed library-coverage entries for all eight layers record partial
general carriers rather than an implemented analytic construction.
There are no `FoundationsAndLibraryIntegration` or `UPSTREAM:` prerequisites.

The old Layer 3 move to PadicFamilies is required by CaraianiNewton's order,
not a new ownership decision. The extra ordinary Deligne module belongs in
that lower construction chain, with the general ordinary abelian supplier.
No main-conjecture, Heegner, modularity-lifting or general metaplectic theorem
was imported upward. The compatible Galois representation in the μ theorem
is explicit input. The remaining supplier work is item 3 above.

## Independent source audit

Printed page numbers are used for journals/books; versioned arXiv page
numbers are used for preprints. Each row is a locator check and a
mathematical test, not a section summary. The random sample was selected
before the audit using `random.Random(11450).sample(nodes, 15)` on the
main packet's ordered 105-node list.

| Sampled node | Primary source and checked locator | Result |
| --- | --- | --- |
| L2/normalised-evaluation | [BSW], Theorem 9.10 and Definition 9.11, p. 34 | Nonzero eigenvalue division follows the actual norm relation. |
| L3h/theorem-c | [Hsieh2014], Theorem C, p. 713; Theorem 7.1 and §7.1, pp. 759–760 | The rank-one cofinite proof uses the withdrawn input; gap retained. |
| L2/overconvergent-evaluation | [BSW], §§9.1.1–9.1.5 and Definitions 9.1–9.2, pp. 28–30 | Quotient-test duality, not an invariant-upstairs-distribution identity. |
| L3/hilbert-cusp-combinatorics | [DK], §§7.2.3–7.2.6, pp. 44–46 | Odd-weight norm-negative sign found and corrected. |
| L3h/hida-linear-independence | [Hida2010], Theorem 3.20, pp. 98–100; Corollary 3.21, p. 101 | Restored the full ring target and exact fixed-weight hypotheses. |
| L2/bsw-choice-independence | [BSW], §12, pp. 39–40 | General field choice-independence does not give general growth uniqueness. |
| L2/finite-evaluation | [BSW], Definition 9.5, p. 31 | All ray components and the weight twist are required; dyadic count fixed. |
| L3/deligne-ribet-pseudomeasure | [DR], p. 232 | Norm-twisted numerator and nonzero-divisor denominator retained. |
| L2/finite-evaluation-representative | [BSW], Proposition 9.3, p. 31; Proposition 9.6, pp. 31–32 | The forward chart gives cancelling primal and dual unit actions. |
| L1/hida-period-algebraicity | [BSW], Theorem 2.3 and remarks, p. 10 | Normal-closure coefficient field restored; Gauss sum remains in denominator. |
| L4e/ew-pullback-and-local-computations | [EW], Proposition 3.4, pp. 21–22; §4, pp. 22–30 | Fixed page references and two convergence bounds; retained p and infinity factors. |
| L2/growth-uniqueness-totally-real-imaginary-quadratic | [Williams], Definitions 5.10, 6.14, Proposition 6.15, pp. 28, 35; Theorem 7.4, p. 40; [BH], Theorem 1.1.2(c),(f), pp. 4–5, §1.8, pp. 11–12; [BSW], §12, p. 39 | Strict growth/moment range and Leopoldt-dependent comparison are separate. |
| L3/deligne-ribet-measure | [DR], (0.4)–(0.5), pp. 231–232; (8.2)–(8.4), pp. 278–279; (8.11)–(8.12), pp. 283–284 | Full dyadic boundary/parity formulation retained. |
| L1/admissible-weight-coefficients | [BSW], §1.1, pp. 5–6; Definition 1.8, p. 8; Definitions 3.1–3.2, p. 11 | Independent purity, nonnegativity and conjugation tests added. |
| L2/small-slope-eigenlift | [BSW], introduction, p. 3; Theorem 8.7, pp. 26–27, and §9 opening, p. 28; §11, p. 38 | Uniqueness is in the simultaneous small-slope summand. |

All six inherited unverified-source/gap entries were also revisited:

| Flag | Work and disposition |
| --- | --- |
| Hida 2004 density | Read the author's public [Hida2004] and [Hida2025] correction. The latter's pp. 2–3, Corollary 2.12, p. 17, and Theorem 5.2/Corollary 5.3, pp. 28–30, explain precisely why the cofinite gap remains. |
| Vatsal 2003 | The input states no Vatsal theorem to verify. No such theorem is asserted or used as a prerequisite here. Checked [Finis] Theorem 1.1, pp. 769–770, and correction (14), pp. 788–789, directly; Vatsal remains contextual. A future Vatsal comparison needs its own source audit. |
| BSW archimedean integral | Read [WilliamsThesis] §12.1.4, pp. 138–145, including the unfolding, real/complex Mellin integrals and Gauss reduction. Independently using the K-Bessel Mellin formula gives the factor `1/[4(2πa)^(j+j̄+2s+2)]`, not the real-place factor; it agrees with the README and BSW Theorem 4.6. |
| Katz/HT local and proof details | Read [Katz] (5.2.26)–(5.2.38), pp. 272–273, Theorem (5.3.0), pp. 274–275, and the construction/interpolation/functional-equation proof in §§5.4–5.6, pp. 275–284. The transform is partial, the unramified value is 1, and the primitive Gauss numerator is nonzero. Read [HT] Theorem II, p. 193, Theorem 5.1, pp. 229–230, and its proof through the functional-equation comparison, pp. 230–232. Tame factors and both chambers remain explicit; corrected the Katz locator and added its second chamber from p. 285. |
| Totally real growth | Read [Barrera] Proposition 6.10, p. 2208, and Theorem 7.2, pp. 2209–2210. Growth of this construction has a primary source; uniqueness additionally needs the stated moment/order hypotheses. It does not prove an unconditional comparison without Leopoldt. |
| Ordinary finite-field equivalence | Read [Deligne] Theorem 7, pp. 240–242, against DR (4.5), pp. 255–258. The exact module and equivalence are specified with q=2 and rank-zero controls, but their lower-owner incorporation is still required. |

The seven inherited source issues were checked against the original items:

| Flag | Independent check and disposition |
| --- | --- |
| E1, BSW inverse chart | §9.2.2 and Propositions 9.3, 9.6, 9.9, pp. 31–34: the corrected forward chart gives the unit cancellation; the inverse chart gives an unwanted inverse factor. Already corrected in the package. |
| E2, BSW compactness | Lemma 6.7, p. 22: the identity satisfies the printed matrix condition but cannot improve radius on the infinite distribution space. The package correctly requires improvement in all analytic coordinates. |
| E3, BSW negative slopes | Lemma 8.1(iii), p. 24: a zero submodule cannot force the slope of U=p⁻¹ on L to disappear. A bounded absorbing integral stable lattice is required and already specified. |
| E4, BSW units | §9.2.1, p. 30, versus [Katz] (5.4.6), p. 275: the profinite kernel is closed. Positive-rank global units must be replaced by their closure; the package does so. |
| E5, EW reference | Corollary 5.9, p. 37, uses item 4.17; it is Lemma 4.17, p. 29, not a proposition. The package's constant-term chain does not reproduce the wrong label. |
| E6, Hsieh unramified p | Theorem C, p. 713, versus Theorem 7.1, p. 759, which invokes Theorem 6.2, p. 757: p∤D_F is inherited by the proof. Already present in the package. This repair does not repair the separate cofinite gap. |
| E7, Hsieh conductor index | The published Theorem C, p. 713, indexes the χ groups by c_λ⁻; Theorem 7.1(2), p. 759, uses the χ conductor. The package uses the latter local-defect hypothesis. No claim about a new erratum or a different job is made. |

Additional checks read the primary interpolation identities in EHLS Main
Theorem 9.2.2, pp. 145–146, Disegni–Liu Theorem 3.37 and Proposition 3.39,
and Eischen–Wan Theorem 1.2, p. 4, and §5.4, pp. 36–37. These retain the
EHLS reciprocal period denominator and congruence factor, the Disegni–Liu
normalized middle root and nonzero-germ parity condition, and the rank-two
restriction of the EW constant-term comparison. The rational square
comparison was checked against [CGLS] Theorem 2.1.1, pp. 12–13; it has the
square of the Euler factor and two period exponents, not a square-root
identity. No theorem of Tate's thesis is stated as a target.

## Adversarial pass

The rows below account for every main-packet node. Related API statements
share a row only when the displayed instances test their common domain or
normalization. Imported statements were checked as contracts, not claimed
as newly proved results. Characteristic-p instances apply to the light
algebraic definitions; the analytic characteristic-zero assertions retain
their characteristic-zero hypotheses. An unramified or ramified DVR of
mixed characteristic is not identified with Z_p, and an equal-characteristic
DVR does not inherit the interpolation theorem.

| Statements / packet nodes | Instances tried | Result / correction |
| --- | --- | --- |
| `L0/unit-invariance-closure` | Positive unit rank; dense unit image in a Hausdorff profinite kernel. | Invariance extends to closure. Generic closure theorem stays with its supplier. |
| `L0/ray-class-tower`, `L0/ray-class-unit-sequence` | Q, tame ideal (1), conductors p and p²; p=2 levels 2,4; zero modulus. | Finite reductions go from larger to smaller modulus; closed unit kernel. Zero modulus excluded. |
| `L0/leopoldt-dimension-formula` | Q: unit rank 0; imaginary quadratic: rank 0; signature (1,1). | Dimensions 1,2,at least 2 respectively. No general Leopoldt assumption. |
| `L0/ray-class-reciprocity` | Fixed tame exponent versus arbitrary tame ramification; Frobenius at a prime outside np. | Conductor divides the fixed tame bound; not all extensions with the same ramification support. |
| `L0/hecke-character-avatar`, `L0/locally-algebraic-characters` | Inverse norm, u=2,3 and diagonal −1; a monomial nontrivial on positive units; p=2. | Added full-idele sign; unit compatibility is necessary for descent, not only paired purity. |
| `L0/gauss-sum-and-depleted-l-function` | Conductor one; primitive quadratic mod 3; F₇ sums 5 and 2; repeated depleted prime. | Primitive Gauss nonvanishing; inverse additive sign negates the sum; set union removes each Euler factor once. |
| `L0/odd-character-l-zero-nonvanishing` | Totally odd character; even trivial Q character; Euler value 1 at a p-prime. | Fixed false even converse: ζ(0)=−1/2. Depleted zero occurs exactly at the stated Euler zeros under total oddness. |
| `L0/ray-class-distributions` | Dirac upstairs not invariant under kernel; one-point quotient; discontinuous functional. | Dual of invariant tests, not invariant upstairs distributions. Continuity remains necessary. |
| `L0/evaluation-norm-twist-maps` | Dirac at x, map x↦x², tests x and x²; zero functional. | Pushforward gives x²,x⁴; pullback direction and twist order agree. |
| `L0/conditional-evaluation-principle`, `L0/euler-factor-elements` | Zero evaluator; nonzero-slope norm relation; g=1,a=1; F₅[C₃] with trivial character. | Compatibility is an actual norm hypothesis. Euler augmentation can be zero; no unit assertion follows from integrality. |
| `L1/admissible-weight-coefficients` | k=(0,2),v=(1,0); swapped (2,3); pure negative k; impure v; critical endpoints and negative j; two shears. | Independent negative controls added. Polynomial and dual-action orders match both coefficient systems. |
| `L1/cusp-forms-and-twisted-l-functions` | Q weight k+2; one complex place; Eisenstein vector. | Critical shift is j+1, complex pair has two gamma factors, cusp datum excludes the Eisenstein vector. |
| `L1/eichler-shimura-harder` | Compact support versus ordinary support; degree q in signature (1,1). | Imported cuspidal realization is needed; no reverse-support injection inferred. Dimension 5, q=2. |
| `L1/hida-period-algebraicity`, `L1/period-normalised-symbol` | Wrong real sign; no real places; p=2 over L versus O; one period rescaled by a. | Normal closure added to K. Gauss denominator retained; one sign component scales by a⁻¹; no integral dyadic projectors. |
| `L1/automorphic-cycles` | Q; signature (1,1); conductor one; change of ray representative. | Cycle dimension q and additive b_f=0 at conductor one. Compact-support pullback uses the actual cohomological construction. |
| `L1/classical-evaluation-maps` | Real k=2,j=0,1; add one complex degree; conductor exponents 1,2. | Signs +1,−1 then −1,+1. Coefficient intertwiner has positive conductor exponents; orientation API added. |
| `L1/integral-formula`, `L1/critical-value-formula` | k=j=0 over Q; one complex pair; zero L-value; nonzero primitive Gauss sum and periods. | Real/complex Mellin calculation checked; complex factor 1/4 survives. No division by a presumed nonzero L-value. |
| `L1/rational-modular-symbol-comparison` | Q with both sign periods and same cusp orientation. | Uses the supplied rational carrier; equality requires the actual coefficient and period choices. |
| `L2/locally-analytic-coefficients`, `L2/overconvergent-modular-symbols` | P(z,1)=z and 1; diagonal and both unipotents; radius restriction; arbitrary cohomological degree. | Chart action made explicit. Continuous dual and cochain-level slope compatibility required; no degree-q-only control. |
| `L2/up-compactness`, `L2/slope-decomposition` | Identity on infinite distribution space; improvement at one but not every analytic coordinate; zero module. | Identity rejected. All-coordinate radius improvement gives the intended compactness; supplied spectral theorem then applies. |
| `L2/negative-slope-vanishing` | L with U=p⁻¹ and zero submodule; integral U on an absorbing bounded lattice. | First case disproves the uncorrected source hypothesis. Integral stable lattice is the correct assumption. |
| `L2/theta-maps-partial-classicality` | k=0; one classical embedding and one still analytic; zero derivative. | Each theta changes its own weight and has the specified character twist; partial classicality retained. |
| `L2/control-theorem`, `L2/small-slope-eigenlift` | Strict bound, equality at boundary, all primes versus one prime, simultaneous slope summand. | Equality is not small slope. Uniqueness only in the controlled summand and control holds in every cohomological degree. |
| `L2/overconvergent-evaluation`, `L2/inversion-weight-twist` | Weighted inversion f(x)=x+1 at 2,3 gives 3,4; delta at 2 moves to 1/2; quotient tests. | Same weighted inversion is involutive. Weight-free inversion and invariant-upstairs duality would fail. |
| `L2/finite-evaluation`, `L2/finite-evaluation-representative` | All p−1 Q components, p=2 levels 2,4; one ray representative multiplied by a unit. | Dyadic count corrected. Forward chart action cancels the inverse dual coefficient action. |
| `L2/refinement-eigenvalue`, `L2/norm-relation` | One prime n=0,1,2; two primes α=(2,3), n=(1,2); α=0. | Eigenvalues 1,2,4 and 18; zero α excluded by finite slope. Norm relation is equality on all analytic tests. |
| `L2/normalised-evaluation`, `L2/normalised-evaluation-common-level` | raw(n)=2ⁿ·3 versus raw(n)=3; empty coordinate set; zero module; two-coordinate common upper level. | First normalizes to 3; second gives 3,3/2. Genuine update relation and nonzero eigenvalues are indispensable. |
| `L2/classical-overconvergent-compatibility`, `L2/bsw-interpolation` | j at each endpoint; prime absent from conductor; ramified χ extended by zero; exceptional Euler zero. | Conductor, refinement, period and different factors retained. No division by a vanishing Euler factor. |
| `L2/bsw-choice-independence`, `L2/growth-uniqueness-totally-real-imaginary-quadratic`, `L2/specialisations-q-hilbert-bianchi` | Q ordinary and supersingular; Bianchi split primes; totally real with or without Leopoldt; same finite-order values at positive growth. | Nonzero growth stays positive. Full moments and strict order give supported uniqueness; no unsupported general-field comparison. |
| `L3/partial-zeta-distributions` | Q k=2: −1/12; smoothing c of norm 2: 1/4; c=1; extra Euler prime. | Correct norm exponent and imprimitive convention; lower PadicFamilies contract remains explicit. |
| `L3/hilbert-cusp-combinatorics` | A and −A over Q at odd/even weight; nonprincipal narrow class; infinity/zero cusp. | Fixed sign(Nu)^k and exact normalization; nonconstant index transport distinguished. |
| `L3/hilbert-eisenstein-series`, `L3/eisenstein-constant-terms` | Good-prime divisor sum 1+ℓ^(k−1); cusp failing conductor divisibility; ψ=1; weight-one overlap. | All cusp terms, including both weight-one contributions, retained. No reciprocal of an ideal character extended by zero. |
| `L3/siegel-klingen-rationality` | Rational combination of partial zeta values; parity mismatch; finite character decomposition. | Complex continuation is supplied, rationality remains the precise lower construction target; no arbitrary scalar tags. |
| `L3/padic-hilbert-modular-forms`, `L3/igusa-irreducibility` | Zero q-expansion; classical Eisenstein image; incompatible functions at two tower levels; supersingular point; two determinant components. | Added three form-specific Checks. Ordinary tower is componentwise irreducible, not a disconnected union; no supersingular ordinary trivialization. |
| `L3/padic-q-expansion-principle` | One integral nonconstant q-expansion; constant differences at another cusp; disconnected arbitrary Shimura space. | Statement is specific to the DR integral geometry and flat coefficients. No generic one-cusp extrapolation. |
| `L3/deligne-ribet-measure` | Cancellation between weights; c=1; d=1,p=2; boundary defect zero/one; two odd boundary orbits. | Base theorem keeps p=2. Extra factor 2 has the exact exceptional-field/parity/Artin hypotheses, on compactified ideal tests. |
| `L3/deligne-ribet-pseudomeasure`, `L3/deligne-ribet-rational-comparison` | Augmentation denominator zero; c=1; admissible nonzero-divisor c; Q smoothing. | Norm twist and localization retained; compare smoothed measures before pseudomeasures, never 0/0. |
| `L3/cm-type-p-ordinary`, `L3/cm-points-and-canonical-trivialisations` | Imaginary quadratic split versus inert p; empty CM type; negative polarization component; homothetic lattices. | Split ordinary condition, positive polarization and full level/differential transport required. |
| `L3/cm-periods`, `L3/katz-differential-operators`, `L3/katz-cm-algebraicity` | Zero differential; weight 1 versus 2 under scaling; derivative of constant; two commuting embedding derivatives; nonordinary point. | Periods are nonzero data in separate fields; unit-root splitting only ordinary; derivative kills constant term. |
| `L3/katz-eisenstein-measure` | F(x,y)=x⁻¹ at x=2,3; covariance failure; dense positive unit subgroup. | Transformed H is 1,1. Weighted inversion and closure are necessary for descent. |
| `L3/katz-padic-l-function`, `L3/katz-functional-equation`, `L3/katz-hida-tilouine-tame` | k=1,d=0; second chamber k=0,d=1; unramified local factor; primitive ramified Fourier numerator; Euler zero; tame ideal one. | Exact partial-transform locator corrected; both Katz chambers retained. Nonzero Gauss factors do not eliminate Euler zeros. Tame functional equation remains separately normalized. |
| `L3/group-ring-eisenstein-families` | Character specialization; good-ideal coefficient; p=2 parity idempotent. | Full q-expansion descent, not constants alone. Away-from-2 parity quotient does not overwrite dyadic DR theorem. |
| `L3h/hsieh-setting` | n⁻=(1); nonordinary π with ordinary CM type; one bad local root sign; p=2. | No unnecessary ordinary π hypothesis; source integral construction remains odd-p and local-sign dependent. |
| `L3h/explicit-waldspurger`, `L3h/toric-test-vectors` | Good spherical coefficient 1; two torus elements; zero toric Hom; vector rescaled by nonunit. | Bilinear same-χ period product and inverse toric action retained; nonunit rescaling is not the same normalized lattice. Locator fixed. |
| `L3h/anticyclotomic-distribution`, `L3h/theorem-a` | Trivial φ; zero coefficient; sign change ℒ↦−ℒ; nonzero period rescaling. | Central value interpolates ℒ². Squaring doubles μ in torsion-free domain; torsion branch and all local constants retained. |
| `L3h/cm-integrality-criterion`, `L3h/theorem-b` | Zero measure μ=∞; scale by ϖ in ramified O; 1−[γ] has μ=0 and augmentation zero; reducible residual representation. | Local/global content valuations distinguished. Residual irreducibility and p∤D_F remain actual hypotheses; scalar zero does not imply positive μ. |
| `L3h/hida-linear-independence` | Equal torus translates; Hasse form with Serre–Tate expansion 1; weight zero versus fixed nonzero parallel weight. | Full local-ring theorem restored; separated translate corollary has exact weight and independence hypotheses. |
| `L3h/hida-cm-density` | Zero form; one nonzero residue class; all-unit-residue condition; arbitrary infinite points versus torus-stable levels containing an arithmetic progression. | Minimal condition and algebraic torus topology made explicit. Infinite selection alone does not prove density. |
| `L3h/theorem-c`, `L3h/mod-p-nonvanishing` | Rank one bad set infinite without an infinite arithmetic progression; rank greater than one; p ramified in F. | Cofinite gap remains. Supported conclusion is algebraic density with corrected coefficient step; p∤D_F retained. |
| `L3h/hida-katz-mu-vanishing` | Self-dual sign −1; exceptional anticyclotomic branch; unramified unit restriction but nontrivial uniformizer value. | Zero branch has μ=∞; branch/full measure distinguished. General local character defect cannot be computed on units alone. |
| `L3h/hsieh-hecke-nonvanishing` | Self-dual versus non-self-dual; 𝔩 split condition; nonsquarefree conductor; dense rank-one character set. | Exact source distinctions retained; cofinite strengthening still needs replacement proof, not density alone. |
| `L3h/finis-divisibility` | Primitive theta vector versus nonunit multiple; ν=0,1; split versus nonsplit valuation prime; K=Q(√−3),ℓ=3. | Dimension retains ν+1, correction is negative minimum pairing valuation. Nonsplit higher weights and universal lower-bound exception are not dropped. |
| `L3h/bdp-castella-hsieh-specialisation` | F=Q,n⁻=1; n>0 critical weights; sign change of square root; possible Euler zero. | Compare squares, retain negative norm twist, squared Euler factor and CM period powers; no canonical sign of ℒ inferred. |
| `L4/ehls-unitary-datum` | n=1; arbitrary signature (a,b); n=0; inert p. | n≥1 and ordinary split/unramified hypotheses. Equal-multiplier fibre product, not unrestricted GU product. |
| `L4/ehls-ordinary-forms-hecke`, `L4/ehls-hypotheses` | Finite flat versus free; ordinary but non-Gorenstein Hecke algebra; finite test-vector rank greater than one. | Actual control, minimality and dual modules retained. Only Hecke-algebra dual has rank-one Gorenstein condition. |
| `L4/ehls-differential-operators`, `L4/ehls-eisenstein-measure` | Zero raising indices; arithmetic χ outside weight cone; ordinary versus nonordinary splitting; X_p group versus its characters. | Classical pair compatibility made explicit; coefficients remain on X_p×torus until pairing. |
| `L4/doubling-global-identity`, `L4/local-zeta-at-p`, `L4/archimedean-zeta-integral` | Zero pairing; vanishing Euler polynomial; nonzero archimedean normalized factor; local different. | No cancellation by zero pairings/Euler factors. Exact inverse local factors and normalized algebraicity remain required. |
| `L4/ehls-main-theorem` | n=1; compatible arithmetic weight pair; ramified O versus Z_p; nonunit congruence ideal. | Restored Y_H^class hypothesis. Reciprocal period P and congruence factor retained; no automatic integral unit or universal motive construction. |
| `L4/dl-siegel-hermitian-varieties`, `L4/dl-big-cell-sections`, `L4/dl-eisenstein-family` | m=1; complement of big cell; change auxiliary δ; boundary m=0; ordinary and nonordinary points. | m≥1; support is the big cell, with explicit section invariance and actual line-bundle/descent transport. |
| `L4/panchishkin-unramified`, `L4/dl-local-doubling-at-p` | r=1; two local Satake roots; normalized β unit versus raw middle coefficient divisible by q; p=2. | n=2r≥2. Normalized eigenline and local gamma/different factor retained. No extra odd-p restriction introduced. |
| `L4/dl-padic-l-function`, `L4/dl-vanishing-order-parity` | r=1 archimedean factor −π/4; all finite-order characters in several variables; zero germ; same π under inversion. | Bounded-measure uniqueness uses all finite characters. Zero germ has no finite-order parity; same-π functional equation is retained. |
| `L4e/ew-setting`, `L4e/ew-siegel-eisenstein-measure` | r=1,2,3; repeated χ_i; finite positive slope; zero coefficient; cyclotomic slice alone. | Regularity and odd split p retained; not restricted to ordinary π. Two-variable measure not determined by one line. |
| `L4e/ew-pullback-and-local-computations`, `L4e/klingen-family` | r=1,2 pullback ranks; Re(s) at versus above boundary; finite-slope U eigenvalue. | Correct group embeddings and two convergence domains; local/highest-weight constants retained, nonzero U does not mean unit U. |
| `L4e/ew-padic-l-function`, `L4e/constant-term-divisibility` | r=2 versus r=3; vanished Euler value; auxiliary split ordinary prime; full Fourier–Jacobi family. | Rank-two constant-term theorem not extrapolated to every r; auxiliary input and exact Euler factors remain explicit. |
| `L5/normalisation-comparisons`, `L5/evaluation-principle-instances` | Linear period scale a versus square-root scale; distinct ray quotients; augmentation of pseudomeasure; CM induction product. | Added typed anticyclotomic quotient and dyadic controls. Compare ℒ² with Katz product. EHLS/Katz integral dictionary remains a gap. |
| `L5/cpr-panchishkin-proposition` | Ordinary Newton=Hodge; supersingular gap 1/2 gives floor(gap)+1=1; pure motive without a supplied construction. | h=1 does not prove boundedness. General existence proposition remains a supplied conjectural proposition, not data. |

The new `anticyclotomicRayQuotient` additionally passes the additive Z_p
tests c=−1 (whole group) and c=1 (zero for odd p, Z/2Z for p=2), and
G=Z_p×T with inversion (finite torsion T retained). The parity-defect
supplier passes zero-boundary, one/two odd boundary orbits, and addition in
F₂. The ordinary Deligne supplier passes rank zero, the q=2 companion
matrix of X²−X+2 with V=1−F, and rejection of X²+2 and q=1. These are
additional named obligations, not library implementations.

## Lean statement audit and validation

The final file has 240 lines, nine light real-bodied definitions, three
theorems (two admitted), and eighteen proved examples. There are no sorry'd
data definitions, admitted examples, auxiliary lemma chains, invented heavy
carriers, `True` placeholders or proof-process directives. Heavy-carrier names
remain in the closing comment. The following twelve
signatures were compared directly to the prose:

| Declaration | Hypotheses and generality checked |
| --- | --- |
| `finiteGaussCore` | Finite index type and commutative coefficient ring; no unwritten character assumption. The F₇ sign test and zero weight are valid in this generality. |
| `linearEulerCore` | CommRing/Monoid, finite monoid algebra, subtraction `1−a[g]`. No commutative group or completed algebra silently assumed. |
| `linearEulerCore_eval` | Multiplicative χ into the coefficient ring; evaluation is exactly `1−aχ(g)`, including characteristic p and the trivial χ. |
| `coefficientSubstitution` | Arbitrary commutative ring; diagonal entries are reversed in the two polynomial coordinates. It does not assert an invertible matrix action without invertibility. |
| `admissibleWeight` | Integer-valued indices, actual conjugation invariance, nonnegative k and existential parallel purity; all clauses tested independently. The geometric involution comes from the embedding data. |
| `criticalBox` | Both inclusive bounds, independently of existence of a global Hecke character. |
| `orientationSign` | Natural degree sums and integer value; degrees 0,2,3 and the complex increment pin the signs. |
| `weightedInversion` | Group, field and unit-valued multiplicative χ; the weight is multiplied before evaluating f at the inverse. |
| `weightedInversion_involutive` | Same χ twice is correct since χ(x)χ(x⁻¹)=1; no commutativity of G required. Proof is complete. |
| `refinementEigenvalue` | Finite coordinate set, nonzero eigenvalues as units; positive exponent product, zero index gives 1. |
| `normalisedLevelValue` | Field, additive group and module; inverse eigenvalue product acts on raw(n). This light algebra works in characteristic p as well; no analytic conclusion is attached. |
| `normalisedLevelValue_independent` | Genuine update relation for every n and coordinate, not equality of the normalized values as a hypothesis. Empty coordinate set and zero module satisfy the statement; raw(n)=3, α=2 supplies a negative control when the update relation is removed. |

All README heavy definitions are named in the closing block or are API
components of those named constructions. The latest two-examples-per-light-
definition rule is followed; no attempt was made to mirror the hundreds of
heavy prose Checks with weakened scalar substitutes.

Validation completed successfully:

- `lean-check research/blueprint/packages/AutomorphicPadicLFunctions/Suggested.lean`
  exited 0. The only warnings are the two intended `sorry` theorem bodies;
  the library checks resolve `classMap_surjective` and `riemannZeta_zero`.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicPadicLFunctions.json`
  reported zero errors and zero warnings for the unchanged 105-node packet.
- `python3 research/blueprint/intake.py check-files` on the five changed
  deliverables and handoff reported `5 file(s), 0 problem(s)`.
- `git diff --check` passed. The declaration count is nine definitions,
  three theorems, eighteen proved examples and two admitted theorem bodies.

## Public-source provenance

All PDFs were obtained from the following primary/author or journal URLs on
2026-10-20. The SHA-256 identifies the bytes inspected, especially the
unversioned Hida revisions. Sources stayed in scratch and are not part of
the submission. No private book or alternate copy of a restricted source
was used. No suspicious instruction was encountered in the issue, package
or fetched sources.

| Public source | SHA-256 | Access date |
| --- | --- | --- |
| [P-adic L-functions for GL₂](https://arxiv.org/pdf/1602.06244v3) | `4209161c0b5f139372833fd873cbaf2b99fcef3e6edef3ec50ba3869096d8d5f` | 2026-10-20 |
| [Overconvergent cohomology of Hilbert modular varieties and p-adic L-functions](https://aif.centre-mersenne.org/item/10.5802/aif.3206.pdf) | `674375eb4324a1e5f3abc7f16620f1a4843d344fb89ab442f29313b498625fdc` | 2026-10-20 |
| [P-adic L-functions of Bianchi modular forms](https://arxiv.org/pdf/1404.2100v2) | `21411af46d6d06a3ca0dba477c3550e85818cdb9f276a1a6fc517373b1f55f77` | 2026-10-20 |
| [Overconvergent modular symbols over number fields](https://wrap.warwick.ac.uk/id/eprint/87870/1/WRAP_Theses_Williams_2016.pdf) | `f71dbba7e31b2b11235f88b4983bc89c569bb05070730760fad2ff4c1e78e4c6` | 2026-10-20 |
| [On p-adic L-functions for Hilbert modular forms](https://arxiv.org/pdf/1710.05324v2) | `73d1ad765ec4bf6c3801930e075476a0d6f1aabad8a55b34eab0c1f1a99687c2` | 2026-10-20 |
| [Values of abelian L-functions at negative integers over totally real fields](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0059/LOG_0021.pdf) | `686455853c893666773ac7a86763878c5e00280705bf8ee950f5f245caf37223` | 2026-10-20 |
| [Variétés abéliennes ordinaires sur un corps fini](https://publications.ias.edu/sites/default/files/Number6.pdf) | `b96581ff47f1455f2bf6e98e302c37d20c0d17a1c210b0a5a0fc3e8ee472fef5` | 2026-10-20 |
| [p-adic L-functions for CM fields](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0049/LOG_0014.pdf) | `2eb27c8f827fb9d71049c96ddbeee083c69824861c3878e59e865034bee26599` | 2026-10-20 |
| [Anti-cyclotomic Katz p-adic L-functions and congruence modules](https://www.numdam.org/item/10.24033/asens.1671.pdf) | `a0caa6b587b0120c0394704576fdcbfd2cfa9af5be00e5a98ecca2cfcd787075` | 2026-10-20 |
| [The Iwasawa μ-invariant of p-adic Hecke L-functions](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n1-p02-p.pdf) | `1a97277068aefe67926966d2ad1bb254f115fb610e82391c0d3123b45c80b9f1` | 2026-10-20 |
| [Non-vanishing modulo p of Hecke L-values](https://www.math.ucla.edu/~hida/Ellf.pdf) | `6771580979e658aa862f796c17465d16ad2a8a59f54342d0f4fc24d1e3842df1` | 2026-10-20 |
| [Non-vanishing of integrals of a mod p modular form](https://www.math.ucla.edu/~hida/EllrevF.pdf) | `a41b6e91efff93dd7e21c774fb790efa19ca88db1667df291d463c0111f73980` | 2026-10-20 |
| [Special values of anticyclotomic Rankin–Selberg L-functions](https://emis.muni.cz/journals/DMJDMV/vol-19/24.pdf) | `a662df673725f6abbdb5b3ee272e78973c125cbc5d6fd0ba9307c790e8070718` | 2026-10-20 |
| [On the non-vanishing of Hecke L-values modulo p](https://arxiv.org/pdf/1208.4751v1) | `330cbaa073b6998f51647f34eff43b2c4d8293abaf236296477cc1953a9156c5` | 2026-10-20 |
| [On the μ-invariant of anticyclotomic p-adic L-functions for CM fields](https://arxiv.org/pdf/1112.1574v3) | `454b784296a8bfc553562243593b474ea317421c9b56c1d89eeed230ec950c56` | 2026-10-20 |
| [Divisibility of anticyclotomic L-functions and theta functions with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v163-n3-p02.pdf) | `878674736df503052d7b0a58504740050016a3f7dd0a0048d66cd85eb4c40f82` | 2026-10-20 |
| [p-adic L-functions for unitary groups](https://arxiv.org/pdf/1602.01776v5) | `881a496afe0a7f4707fed614a969af481ed737ae1174db1995be3164a90b9569` | 2026-10-20 |
| [A p-adic arithmetic inner product formula](https://arxiv.org/pdf/2204.09239v3) | `1f759774cdbf8700c5978b6ea45c1bf63c99b993136a82a45a907320fef53bfa` | 2026-10-20 |
| [p-adic Eisenstein series and L-functions of certain cusp forms on definite unitary groups](https://arxiv.org/pdf/1404.7153v2) | `df523d74a0bdf668ea619e82074721ca953874331a3289784bd94ad197a9f40e` | 2026-10-20 |
| [On the Brumer–Stark conjecture](https://arxiv.org/pdf/2010.00657v3) | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` | 2026-10-20 |
| [On the Gross–Stark conjecture](https://arxiv.org/pdf/1605.08169v1) | `0bc900e2c7c16fa9aff1147ec138d121b4798fab3b4deb76eed415ba7f409a99` | 2026-10-20 |
| [On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://arxiv.org/pdf/2008.02571v2) | `7cd995e0d9ee1c931f728da8b39603c4205fa0a84c25df27d44b4451a81a2c59` | 2026-10-20 |
| [Motives over totally real fields and p-adic L-functions](https://www.numdam.org/item/AIF_1994__44_4_989_0.pdf) | `21ea67c1af63972d14f44c6651f89cda8ec9284d6fa10fae4cfdf19b0c2dbadd` | 2026-10-20 |

[BSW]: https://arxiv.org/pdf/1602.06244v3
[Barrera]: https://aif.centre-mersenne.org/item/10.5802/aif.3206.pdf
[Williams]: https://arxiv.org/pdf/1404.2100v2
[WilliamsThesis]: https://wrap.warwick.ac.uk/id/eprint/87870/1/WRAP_Theses_Williams_2016.pdf
[BH]: https://arxiv.org/pdf/1710.05324v2
[DR]: https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0059/LOG_0021.pdf
[Deligne]: https://publications.ias.edu/sites/default/files/Number6.pdf
[Katz]: https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0049/LOG_0014.pdf
[HT]: https://www.numdam.org/item/10.24033/asens.1671.pdf
[Hida2010]: https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n1-p02-p.pdf
[Hida2004]: https://www.math.ucla.edu/~hida/Ellf.pdf
[Hida2025]: https://www.math.ucla.edu/~hida/EllrevF.pdf
[Hsieh2014]: https://emis.muni.cz/journals/DMJDMV/vol-19/24.pdf
[Finis]: https://annals.math.princeton.edu/wp-content/uploads/annals-v163-n3-p02.pdf
[EW]: https://arxiv.org/pdf/1404.7153v2
[DK]: https://arxiv.org/pdf/2010.00657v3
[CGLS]: https://arxiv.org/pdf/2008.02571v2
