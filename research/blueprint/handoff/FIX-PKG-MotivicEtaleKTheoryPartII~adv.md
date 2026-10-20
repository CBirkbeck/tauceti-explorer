# Handoff: FIX-PKG-MotivicEtaleKTheoryPartII~adv

Codex, session `codex-2iIWYW`, issue #11379, 2026-10-20. Branch
`codex-2iIWYW-motivic-etale-part-ii`, starting from `dfbd09c26`.

**Checkpoint; verdict `needs_changes`.** The Part II construction contracts,
general comparisons and small-prime normalization have been repaired. The
remaining blocker is the registration of the virtual-determinant foundation
in its existing owner, GeneralAlgebraicKTheory Layer 4, and the corresponding
PeriodsAndSpecialValues supplier reference. Those files are outside this
issue's four deliverables. The complete extension, including its universal
property, coherence requirements, dependencies, proof route and discriminating
Checks, is now specified in Part II's **Exact supplier contracts**, under
**Virtual determinants**. Treat it as an outstanding owner extension, not as
an assertion that the owner already contains it. The generality of the
comparisons is unchanged.

The requested `REV-PKG-MotivicEtaleKTheoryPartII~adv.md` was absent at the
starting revision. I read the complete available `~codex` report and handoff;
the issue itself repeats their four open mathematical contracts. Only the
README, Suggested.lean, review.json and this handoff were changed. No second
issue was claimed. No suspicious instructions were encountered in untrusted
source material. No restricted book was used.

## Finding → change

| Finding | Applied repair | Disposition |
| --- | --- | --- |
| 1. Generic correspondences need not extend to the recorded model; their action on the ambient group does not prove preservation of its image. | §1.2 adds `regularModelCharacter`, the arithmetic regular-scheme rational comparison, with open-restriction compatibility and the normalized generic character. Taking images gives `modelImage_eq_KIntegralPart`. Scholl's integral-part functor and alteration spans give `modelImage_genericCorrespondence`; Corollary 1.3.4 with generic alteration equal to the identity identifies the image for a regular **proper**, not necessarily projective, model. Additivity, transposition, finite copowers and coefficient projectors follow on this image. `modelImage_changeModel` concerns rational subspaces only. | Repaired in scope. Sources and proof dependencies are explicit; no hypothesis requiring extension of correspondences was added. |
| 2. A commutative graded determinant does not construct V(A) for semisimple noncommutative A; general duality was supported only by an Artin specialization. | The supplier section gives four actual foundation targets: `virtualObjects` with its determinant-functor universal property, `virtualPerfectDeterminant`, its commutative realization, and duality/Morita compatibility. §§2.6 and 3.6 retain every semisimple A, use A-opposite duality, and give the general Burns–Flach corrected duality diagrams. The real correction is epsilon on both the Betti plus and F-zero de Rham spaces; the p-adic correction uses the finite quotient complexes and the actual Artin–Verdier cone. | Part II mathematics and generality repaired. **Owner registration remains blocked by file scope.** Neither relative triples nor K0/K1 identifications alone close this contract. |
| 3. General geometric H1-g membership and its good-reduction consequence had been replaced by an assumption. | §3.1 owns the rational h-syntomic complex, period map, descent spectral sequence and normalized syntomic character, with their maps and compatibilities. The compatible degree-one edges construct `padicRealizationOne_mem_g`; crystalline purity and Bloch–Kato give `padicRealizationOne_mem_f_goodReduction` in weight at most -3. Scholl supplies the higher-K model-image inclusion in the unramified condition away from p. `PadicRealizationFinite` now states the precise all-finite-place membership condition on the constructed map; only its unproved cases remain assumptions. | Repaired in scope from earlier suppliers. No input from PadicHodgeRegulators is used. Rational p = 2 is included; exceptional weights and general homologically trivial cycles at bad places remain appropriately conditional. |
| 4. The K-theory lattice specialization only removed the index for p at least k, whereas Huber–Kings uses all odd primes. | §§3.1 and 4.5 construct the integral stable edge from Quillen–Lichtenbaum and the single surviving odd-degree descent column, normalized by the first Chern class and Bott element. Its rationalization is the normalized character used by the regulator. Localization passes from S-integers to integers and identifies the free quotient in the field. Consequently the normalized K-lattice has index one for **every odd p**. The ordinary Chern class differs by the signed factorial; k = 5, p = 3 detects this difference without changing the regulator lattice. | Repaired in scope. The arbitrary-lattice index formula is retained in addition to the full K-lattice specialization. No p-bound or index-formula substitute remains. |

Further consistency corrections: separate the K1 Adams argument on units
from Borel injectivity in higher twists; bound the datum's cohomological degree
by 0 and 2d; keep datum formation independent of its factor API; replace the
stale elliptic reference to an image-stability gap by the new theorem; use the
full Betti realization in the local duality object; distinguish the auxiliary
local determinant from the determinant of the Artin–Verdier cone; give
the actual ordinary-to-Tate compact-support triangle at odd primes; and fix
the trace-form identification between rational and module duals, as in
Burns–Flach (52), p. 544. No
integral dyadic assertion is inferred from a rational comparison.

## Exact remaining action and where to resume

The four virtual-determinant targets have a single owner. A continuation with
authority to edit that owner should do the following, without creating a
second V(R) in this package:

1. Add the **Virtual determinants** contract from Part II's supplier section
   to GeneralAlgebraicKTheory Layer 4 and its owning plan. Its inputs already
   exist there: the Q-construction and KSpace (§§2.4–2.5), conflations and
   additivity (§§4.2–4.3), relative triples/boundary/exact sequence
   (§§4.15–4.17). The perfect determinant is constructed using bounded
   projective complexes and acyclic cones; agreement with the later
   perfect-complex comparison (§6.19) is a subsequent theorem, not an
   input to Layer 4. This avoids a new internal layer cycle.
2. Include the normalized determinant functor on the exact category of
   finite projectives, its universal property for every symmetric Picard
   target, the zero and conflation maps, nested-filtration and split-symmetry
   coherence, and exact-functor identity/composition/natural-isomorphism API.
   The construction uses the fundamental groupoid of KSpace, with paths and
   the two- and three-simplex relations. Specifying only its components and
   unit automorphisms is insufficient.
3. Register `virtualPerfectDeterminant` with quasi-isomorphism, true short
   exact sequence, filtration, true nine-term, shift, acyclic, perfect
   cohomology and derived-base-change API. Register the commutative
   graded-line realization and its precise equivalence criterion, and
   opposite-dual and Morita compatibilities. Retain the nonflat base-change,
   odd swap, negative component and matrix-module Checks.
4. Point PeriodsAndSpecialValues PS.3–PS.5's existing
   `virtualPerfectDeterminant` input at these owner targets. Its current
   **Virtual objects** paragraph explicitly says that the cited relative
   K-groups do not provide the category or coherences. The new contract
   supplies that missing plan, rather than changing the line or obstruction
   conventions. NoncommutativeAndEquivariantIwasawa NE.2 and NE.7 should use
   the same owner, as PeriodsAndSpecialValues already requires.
5. Recheck the owner dependency graph and then Part II's two general
   comparisons. Once the owner has adopted the complete contract, reconsider
   `review.json`; this checkpoint does not self-certify an absent dependency.

These are extensions of an existing roadmap, not a request for a new
roadmap. The blocker is scope, not elapsed time or a request to formalize
the foundation during blueprint work. The issue explicitly permits an honest
`needs_changes` residue and restricts edits to its listed files.

Two other ownership notes for the manager, outside this patch:

- PadicHodgeRegulators should consume §3.1's new rational syntomic/local
  regulator adapter. The required part has moved down to Part II; do not
  restore an upward dependency to fill it.
- The predecessor MotivicEtaleKTheory §12.7 has both the independent
  arithmetic determinant/local determinant paragraph and a later
  special-value paragraph referring to PeriodsAndSpecialValues. Part II
  explicitly imports only the first paragraph. The older sibling-loop
  separation remains a sibling task, as the independent review noted.

## Source verification

I read the mathematical statements and proof portions used below, rather
than treating source summaries as proof contracts. All repository prose is
in my own words. The five original public sources were retained; five
additional public primary sources supply the newly closed constructions.
No source files or extracted text belong in the repository.

| Source and public copy | Checked locators and use | SHA-256 of PDF read |
| --- | --- | --- |
| [Burns–Flach](https://ems.press/content/serial-article-files/25892?nt=1) | §§2.1–2.5, pp. 504–509, especially Proposition 2.1 and the warning about arbitrary distinguished triangles; (53)–(57), pp. 544–545, real local object and signs; Lemma 12 and (62)–(64), pp. 546–549, local complex duality; (66)–(82), pp. 549–553, p-adic corrected cone; Theorem 5.3, p. 556, extra local obstruction; Lemmas 17–19 and diagrams (95), (99), pp. 558–566, general comparison compatibility. | `d9caa72585d3ae77f34fd1798289345ca2d7a0f4284933c1c0945cb0f0994e5b` |
| [Huber–Kings v2](https://arxiv.org/pdf/math/0101071v2) | §§1.1–1.2, pp. 3–11, Artin factors and comparison conventions; Theorem 1.4.1 and proof, pp. 13–14, all-odd-prime cohomological formula and K-lattice regulator; Proposition 2.2.3, pp. 17–18, restricted Artin/abelian duality; Propositions 2.3.1–2.3.2, pp. 18–21, class-number cases. Its restricted duality result is no longer the justification for arbitrary motives. | `d2e682fd63b9d4079b19bcb2d31b9188bc72ebf35d1cbc3c77b7b1b8bd3b5f37` |
| [Bloch–Kato](https://math.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf) | Proposition 3.8 and Corollary 3.8.4, pp. 354–355, finite/geometric conditions and crystalline fixed-vector criterion; Example 3.9, p. 359, Tate local conditions; Definition 5.1 and (5.2)–Proposition 5.4, pp. 369–371, motivic factor and realization conventions. | `ec89c6436c7e16580791eddd562c8c04a12442d8a8484f8ac75c5ea8dc04f5e5` |
| [Fontaine](https://www.numdam.org/item/SB_1991-1992__34__205_0.pdf) | §§7–9, pp. 224–234: weight reductions, unit and elliptic factors, inverse height direction, and regulator exactness. | `0947234dbb5fbe00bc6ac92c0e102e35e8dede76a196023a50a518ed13eeee9c` |
| [Kato v1](https://arxiv.org/pdf/math/0304233v1) | §1.2, p. 165, inverse determinant convention; §2.1, pp. 166–168, comparison directions and rational zeta element. | `6d7f3a5924fd5291bc23870547b05552ba7fb1e39413d551f11daf052fbcf12b` |
| [Levine](https://www.esaga.uni-due.de/f/marc.levine/publ/KthyMotI12.01.pdf) | §1.5 and Theorem 1.6, pp. 6–7, cycle-sheaf convention over a one-dimensional base; §§2.2–2.3, tower; Theorem 12.12, Adams action; Theorem 14.7(1)–(3),(5), pp. 73–74, rational splitting and comparison for regular schemes. The semilocal-base hypothesis of part (4), about the gamma filtration, is not silently applied to arbitrary models. | `67affc5d6f837a78281c824d21723be9af1180bb77d44e8cff9cca5b0b2ef820` |
| [Scholl, Integral elements I](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/k1.pdf) | Theorem 1.1.6 and Warning 1.1.7, p. 4, intrinsic Chow-motive functor and singular-model control; Lemma 1.2.5, p. 5, alteration spans; §1.3.3 and Corollary 1.3.4, p. 8, compatibility with the specified regular proper flat model. The identity generic alteration is the step needed for the model in this package. | `7bffc95825735b551d93cf8074dba61d28131c3b6302bf855fd1f0e38349a9e6` |
| [Scholl, Integral elements II](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/int.pdf) | §2, diagram (3), pp. 5–6, regular-model higher-K image in the unramified condition away from p. No converse equality or general bad-prime homologically trivial cycle assertion is inferred. | `e22965852b56010698de71e61d0fb813454ff32ab9242b76f50fd9aa0b4f37ca` |
| [Nekovář–Nizioł](https://msp.org/ant/2016/10-8/ant-v10-n8-p04-s.pdf) | Remark 2.6, p. 1711, H-st as extension classes; Proposition 3.20 and construction, pp. 1744–1746, rational syntomic complex; Proposition 3.22, pp. 1749–1750, geometric base change; Theorem 4.8 and proof, pp. 1764–1769, compatible descent spectral sequences; Proposition 4.13, pp. 1770–1771, exponential; Propositions 5.6–5.7, pp. 1776–1778, universal Chern classes and period compatibility; the **proof diagram** of Theorem 5.9, p. 1779, the degree-one regulator factorization. The diagram supplies the cohomological degree used here. | `290577d5eda6fd70ad593493b4c206abc965754eca003a87bf8e0492afc89711` |
| [Feng–Galatius–Venkatesh](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf) | §§2.5–2.7, pp. 10–14, Bott and descent normalization; Proposition 2.9 and Lemmas 2.10–2.11, especially (2.7), the odd-degree edge; proof of Corollary 2.12, p. 14, first Chern identification; Remark 2.13, p. 15, an abstract isomorphism alone does not identify the map. Their printed base rings are rational/cyclotomic. The package explicitly supplies the extension to arbitrary F by MotivicEtaleKTheory §10.4 and cohomological dimension two. | `5d717b2a94288593049be2aed34e38dbde10750beba4bd3d3387820d038e8807` |

The source table has ten entries: the original five plus Levine, the two
Scholl papers, Nekovář–Nizioł and Feng–Galatius–Venkatesh. The latter two
normalizations are used on actual constructed maps, not inferred from an
isomorphism of vector spaces or equality of ranks.

## Adversarial pass

All 23 existing target subsections remain. The table covers their statements
and interfaces, plus the new contracts. These are mathematical case checks of
a roadmap, not claims that the heavy constructions are formalized.

| Statement or interface | Instances tried and result | Change or retained restriction |
| --- | --- | --- |
| V(E), universal determinant functor | Zero exact category; a field with virtual component -1; line automorphism 3; direct sums and split conflations. K0 alone loses the automorphism 3. | Added actual groupoid and coherence/universality targets; owner adoption remains outstanding. |
| Perfect determinant | Zero and identity cones; differential 3 in degrees 0,1 and its shift; two odd lines; nonflat reduction modulo 3. Coordinates are 3, 1/3 and -1; reduction retains the Tor term. | Canonical acyclic maps, true diagrams, ordered products and derived base change explicit. |
| Commutative realization | Field, DVR, product of two fields, nonprincipal ideal in a number ring; a hypothetical nonzero SK1 element maps to scalar 1. | Locally constant rank and Picard class retained; equivalence requires both K-maps to be isomorphisms. Exterior powers defer to AlgebraicVectorBundles L0C. |
| Dual/Morita determinant | Zero module; line versus its shift; M2(F) simple column with scalar 3; extension of the base field. Morita coordinate is 3, underlying-vector-space coordinate 9. | Duality and inversion distinguished, with the fixed trace identification of rational and module duals; no determinant of the underlying module is substituted. |
| 1.1 datum, copower, dual | Zero projector; point in twists 0, 2 and -1; elliptic degree 1; quadratic coefficient extension, basis change and matrix idempotent. Double dual returns i,j. | Rational-projector carrier and 0 ≤ i ≤ 2d explicit; no requirement that the projector extend to the chosen model. |
| 1.2 factor cases | n < 0, n = 0, n = 1; Spec Z versus Spec Q units; weight-zero positive K-degree; disjoint union and diagonal projector. | Chosen-model image retained; arithmetic character identifies it with the K-image. |
| 1.2 model/correspondence API | Degree-three alteration; generic identity with a merely proper regular model; transpose; matrix action on I plus I; singular-model negative control. | Rational push-pull splits by 1/3, including over Q3; no integral splitting, finite generation or lattice independence claimed. |
| 1.3 vanishing and exponents | Weights -4, -2, -1, 0; rank zero; dual weight -2-w. | All four factor exponents retained; no finiteness used in vanishing. |
| 1.4 Artin ranks and maps | Twists at most zero, 1, 2, 3; Q, real quadratic, imaginary quadratic; zero idempotent and matrix summand. | Units use the K1 Adams action, higher twists use Borel; transfer/matrix naturality replaces an automorphism-only argument. |
| 1.5 elliptic factors | Mordell–Weil ranks zero and one; j = 0,1,2; dual twist 2-j. | Higher-twist finite dimensionality remains an explicit determinant hypothesis. |
| 2.1 period and Deligne API | Q(0), Q(1), Q(2), Q(3); weight -1; zero Hodge space. | Negative-weight injectivity and weight-at-least-minus-one surjectivity agree; involution includes the Tate coordinate. |
| 2.2 sequence and coefficient balance | Zero pairing in positive rank; rank-one height; replacing P by 3P; nilpotent 2-by-2 matrix with its transpose; complex-place logarithm. | Inverse height direction, factor two and transposed coefficient action preserved. Stale model-stability gap removed. |
| 2.3 exactness predicate | Rank zero, exact isomorphism, zero map between equal-dimensional positive-rank spaces, degenerate height. | Predicate uses the supplied maps and inverse adjoint; dimension equality is insufficient. |
| 2.4 Artin real exactness | r ≥ 2; unit hyperplane at r = 1; r = 0,-1 by duality; imaginary quadratic in even twist. | All twists retained; unit endpoint has the missing-one dimension. |
| 2.5 elliptic real exactness | Rank zero and one; a hypothetical real radical with rounded lattice points; j = 2 over Q and an imaginary quadratic field. | Northcott gives positivity on the real span; higher-twist regulator isomorphism stays conditional. |
| 2.6 general real comparison | Regulator 3 has coordinate 1/3; doubling it gives 1/6; odd swap -1; Q(0) has two sign factors -1 whose product is 1; Q(1) has neither; imaginary quadratic Betti rank 2 versus plus rank 1. | General semisimple A retained, full Betti local object and both signs explicit. The coherent supplier remains the named residue. |
| 3.1 global realization edge | Finite coefficients with geometric invariants; rational pure projector; zero model lift; n = 0 Abel–Jacobi and n > 0 character. | F1/F2 edge distinguished from an isomorphism; projected edge and lift independence retained. No finite factorial division. |
| 3.1 syntomic complex | Zero input, point, two-point union; nonzero N with N phi = 3 phi N; singular variety versus its h-descent complex. | Correct second Frobenius factor makes d-squared zero. Hypercover/extension/uniformizer maps named. |
| 3.1 syntomic period and character | Identity unit, product of units, restriction/trace degree; ch1 = c1, positive-degree ch2 = -c2 and ch3 = c3/2; zero and direct-sum K-classes. | Rational normalization explicit even at p = 2; K0 uses the Newton character, not an uncorrected higher Chern class. |
| 3.1 descent and H1-g | Point, zero realization, direct sum; restriction-kernel condition before the degree-one edge; pure projector in each direction. | Compatible filtered maps give the actual Abel–Jacobi class in H-st and hence H-g. No equality of an entire abutment with H1-st. |
| 3.1 H1-f consequence | Qp(2) in weight -4; Qp(1) in weight -2 with a Tate-parameter Kummer class of positive valuation; bad reduction and p = 2. | Crystallinity and pure Frobenius weight at most -3 are used (a smooth proper local model suffices); uniformizer classes need not be finite in weight -2. General bad-cycle conditions stay explicit. |
| 3.2 local/realization duality | Zero V, scalar V, H-f versus its actual cone complement, M and its dual. | Chain null homotopy and cone duality added; H1 annihilation alone is not used as a complex-level theorem. Finite membership required for both motives. |
| 3.3 Artin p-adic comparison | Q in twists 0,1,2,3; imaginary quadratic twist 2; every rational prime including 2. | All rational primes and twists retained. Integral p = 2 does not follow. |
| 3.4 elliptic comparison | Rank zero with possibly nonzero rational Tate module of Sha; rank one; p-primary Sha finite. | Sha criterion retained; rank alone never proves the realization isomorphism. |
| 3.5 compact/Selmer complexes | Real trivial action at odd p and p = 2; sign action; twists 0,1,2. Ordinary Q2 cochains retain Q2[0], complete Tate cochains vanish. | Infinity counted once; integral Z2 cochains can be nonperfect. |
| 3.6 general p-adic comparison | Frobenius 1; Euler 1-3 = -2; zero complex; scalar rescaling by p; plus and minus archimedean pieces; one versus two odd quotient lines. | Identity versus acyclic trivializations distinguished; actual AV cone and epsilon specified; no local-obstruction theorem inferred merely from a commuting square. |
| 4.1 rational zeta element and lattice | Zero complex; differential p in two terms; rational element 3 fails to generate Z3; diagonal sum of elements p and inverse p. | Span equality, inverse-line orientation and coefficient product versus diagonal sum retained. |
| 4.2 obstruction equivalence | Empty prime set, one-prime set, nonzero 3-component, rescaled comparison. | Nonempty hypothesis retained; an empty conjunction does not imply rationality. |
| 4.3 alternative forms | T and pT; zero local complex; finite module in degree zero or one; trivial/sign real action; ordinary versus modified support. | Correct triangle Cc → modified Cc → T-plus[0] and odd-prime integral duality explicit. No zeroth-Tate substitution at 2. |
| 4.4 class number | Q gives zeta(0) = -1/2 and residue at 1 equal to 1; real quadratic leading coefficient; rank-zero regulator 1. | Original class-number normalizations retained; dyadic integral case remains outside the theorem. |
| 4.5 integral edge and lattice | Rank zero; k = 2, p = 3; k = 5, p = 3; coefficients modulo powers of 3 and the cofinal powers at exponent at least two; integers, S-integers and fraction field. | Stable edge is integral for every odd p; free quotients, not whole integral K-groups, are identified on passing to the field. |
| 4.5 Lichtenbaum scaling | k = 5 has Chern factor 24 of 3-adic valuation one; normalized index is still one. Replacing an arbitrary lattice by p times itself subtracts the rank on both sides. | Full K-lattice specialization restored in addition to the arbitrary-lattice formula. No factorial-based small-prime index is asserted. |
| 4.6 elliptic BSD data | Ranks zero and one; basis P versus 3P; finite Sha input; p = 2. | Existing BSD adapter is consumed with its analytic input. No proof of BSD or dyadic extension is claimed. |

Other proposed degeneracies are excluded by explicit hypotheses: the motive
base is a number field and hence characteristic zero; p is prime, so p = 1
is excluded; a residue-field cardinality q is at least two, so q = 1 is not
a possible Euler-factor input. Formally setting q = 1 would give a zero
Euler factor, contradicting the unit claim, as expected. Field/DVR and
characteristic-two coefficient cases of the determinant foundation are
separately covered above. Compactness concerns in the height argument apply
only to the bounded rounding-error box, whose finite dimension supplies it.

## Libraries, suppliers and duplication

Pinned dependencies: Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. I read the relevant reviewed
`data/library-coverage.json` entries (AUDIT-30, MotivicEtaleKTheory M.1–M.8
and refinements; AUDIT-27, PeriodsAndSpecialValues PS.3 and PS.5), then
checked statements and objects in the pinned source.

Current read-only audit: TauCetiRoadmap checkout revision
`0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches included every current
roadmap and Completed directory, especially all nine newer areas named in
WORKERS and Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases
and RestrictedProducts. OperatorTheory was searched recursively: it contains
subroadmaps rather than a single root Suggested.lean. Current Completed
HodgeStructures and GlobalNumberFields were read as roadmap models, alongside
the required package exemplar. No read-only checkout was modified or built.

The object search covered Picard categories and determinant-functor
coherences, higher Chow/cycle complexes, motivic cohomology and Adams
components, model-image and transfer operations, Hyodo–Kato/monodromy,
syntomic cohomology, Bloch–Kato local complexes, Hodge opposedness, Kummer
boundaries and regulators. Current syntomic **algebras and morphisms** are
flat local complete intersections; they do not provide the syntomic
cohomology constructed here.

Existing inputs actually inspected and retained as inputs:

- Mathlib's `NumberField.Units.rank`, `finrank_eq`, `logEmbedding`,
  `regulator` and `regulator_pos`; infinite-place cardinality/rank identities;
  `dedekindZeta_residue` and
  `tendsto_sub_one_mul_dedekindZeta_nhdsGT`; one- and two-dimensional matrix
  determinant formulas; singleton-span membership.
- Tau Ceti's `HodgeStructureOn` fields and `isCompl_F_conjF`,
  `conjF_antitone`; the finite-coefficient `kummerMap` as the connecting
  homomorphism; the elliptic regulator as the absolute Gram determinant and
  its rank-zero value. The new Hodge consequences merely use this
  opposedness API; the new height target concerns the real span, beyond
  nonnegativity of the height on points.
- TauCetiRoadmap AlgebraicVectorBundles **L0C** already owns exterior powers
  and the ordinary fixed-rank vector-bundle determinant. The boundaries now
  cite it, and the commutative virtual-object realization uses it.
  PadicMeasuresIwasawaAlgebras §5.1 remains the commutative perfect-complex
  determinant supplier; no such infrastructure is replanned in Part II.

No Part II heavy target was found already present and requiring deletion.
The additional AlgebraicVectorBundles deferral is recorded explicitly above;
it is not evidence for the missing universal noncommutative foundation.

Supplier statements were checked directly: GeneralAlgebraicKTheory's
conflation/additivity, relative and perfect-complex targets; PeriodsAndSpecialValues'
virtual-object gap and its formal line/comparison predicates;
MotivicEtaleKTheory's mixed-base cycle complex, normalized smooth-field
character, general Quillen–Lichtenbaum/adic comparison, finite Chern classes,
model image, Tate/elliptic local adapters and the independent first
arithmetic-determinant paragraph of §12.7; SchemeKTheoryOperations'
regular K/G comparison, operations and Riemann–Roch; CrystallineCohomology
§§5–6; PadicHodgeTheory §§3.1, 3.4–3.5, 5.3 and 8.1; and
SchemeAndStackFoundations SF.4e T404, T415 and T420. PadicHodgeTheory's
`classicalStComplex` is not silently substituted for the three-column C-st
complex used in syntomic descent.

## Suggested.lean and validation

The file has five real-bodied light definitions, eight `sorry` theorem
statements, sixteen proved examples, and 270 lines. The examples include the
new zero/negative-twist rank controls, reciprocal determinant coordinates,
odd swap, Morita scalar, inverse regulator, monodromy differential,
non-generator lattice element, small-prime factorial and Euler unit. They
check scalar coordinates on existing carriers; they do not claim to
construct virtual determinants, motives or syntomic complexes in Lean.
The closing comment names all new heavy Part II targets.

All thirteen kept definition/theorem signatures were checked against the
README: the three integer functions and their two duality identities; the
two Artin rank definitions and their three theorems; both Hodge F-zero
consequences, with the exact weight inequalities; and the shifted one-sided
Dedekind-zeta limit. No variable block adds an unintended hypothesis or
omits the hypothesis tying a map to its construction. The formal integer
identities intentionally allow arbitrary integers, while the geometric
datum separately imposes its degree bound.

Final validation:

- `lean-check research/blueprint/packages/MotivicEtaleKTheoryPartII/Suggested.lean`:
  exit **0**, exactly eight `declaration uses sorry` warnings, no other
  diagnostics. All sixteen examples elaborate. No Lean statement or proof
  changed after this successful run.
- `python3 scripts/check_blueprint.py research/blueprint/packets/MotivicEtaleKTheoryPartII.json`:
  23 nodes, **0 errors, 0 warnings**. The packet is unchanged.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit **0**.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  **4 files, 0 problems**.
- JSON and TOML parsing, 23-subsection and declaration/example counts, single
  Mathlib import, no lemma/set-option/True placeholders: passed. Metadata
  remains exactly `topic = "math.NT"`.
- `git diff --check`: passed. README is below 200 KB; Suggested.lean is below
  5,000 lines. All ten PDF checksums match the source table above.

Scratch sources and logs are disposable. The source URLs, hashes, proof
routes, owner action and all continuation information are preserved here;
the next worker needs no scratch file.
