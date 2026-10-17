# Independent package review: ArithmeticStatistics

Reviewer: Codex, session `codex-NXdGFK`, for #10117, 2026-10-17.
Input: package from #10115 / PR #10131, authored by a different session.

**Verdict: needs_changes.** The local corrections below are applied. The
remaining obstacle is mathematical closure of the counting suppliers, rather
than Lean elaboration. In particular, an elliptic, conditional orbit count
does not yet support the unconditional general-abelian three-isogeny average.
The even-degree binary count has a similar conditional-to-unconditional
transition at arithmetic Bertini. These need exact intermediate statements
and proof plans, not merely a successful `sorry` build.

This is a completed independent review, not a checkpoint. The remaining-work
section is the durable handoff; no source files or source passages accompany
the submission.

## Scope and method

Read WORKERS, PROTOCOL, PACKAGE_REVIEW, UPSTREAM_GUIDE, the source-faithfulness
protocol, and the Caraiani–Newton tier order. Used LocalGaloisGroups and
ProfiniteArithmetic, both README and Suggested.lean, as current upstream
models. Read the ArithmeticStatistics entries of the reviewed AUDIT-07 library
coverage, the core packet, the six refinement inventories and the author's
conservation, source and gap handoff.

The input contains 711 packet nodes. Its package combines the two acceptable
weight interfaces and already defers the field-permutation predicate. This
review additionally removes the pointwise two-Selmer rank identity. The
result has 708 individually anchored target paragraphs: 89, 84, 102, 156,
102 and 175 in Layers 0 through 5. Supporting prose supplies further local
contracts. No packet was edited.

Walked the target statements, their local prerequisites, the conventions and
the definition APIs. Checked all 174 API blocks for at least three Checks;
replaced or supplemented the weak examples described below. Checked the 167
input definition/construction nodes against the representative Lean file or
its closing inventory: the only absent original name is the already deferred
field-permutation predicate. Heavy constructions remain README targets.

All explicit local anchors resolve, with no duplicate anchor. The directed
graph formed by local links in `Needs` paragraphs has no cycle. This checks
the explicit links; it does not certify that an informal supporting paragraph
has supplied the exact theorem a consumer needs. The remaining-work findings
are examples of that distinction.

## Corrections applied

- Corrected the reciprocal-orbit-length negative control. For the units of
  F3 acting on F3, reciprocal stabilizers are `(1/2,1)` and reciprocal orbit
  lengths are `(1,1/2)`. Both totals equal `3/2`; the original claimed second
  total of `2` was false. The README now tests individual weights, and Lean
  records the two stabilizer cardinalities.
- Corrected the finite-cutoff height-rescaling formula to
  `Avg_(cH)(phi;X)=Avg_H(phi;X/c)`. Added a strict-cutoff positive-integer
  example with `X=5`, for which rescaling by two changes `5/2` to `3/2`.
- Added a characteristic-three quartic control: `x^3 y-x y^3` has
  `I=J=0` and discriminant `1`. The integral identity survives, whereas
  division by `27` cannot recover the discriminant. Added its Lean example.
- Expanded Picard carry Checks to include a trivial degree-zero group,
  a nontrivial carry of order three that distinguishes its sign, and a
  negative-degree normalization. Specified the chosen degree-one divisor
  in the original order-four example.
- Expanded the binary Stickelberger, monic-density and binary-density APIs
  to at least three discriminating Checks, including leading-zero forms,
  degrees zero and one, the prime two, and distinct maximality and
  squarefree-discriminant probabilities.
- Expanded quartic-of-a-point comparison Checks to include the identity and
  a two-torsion point. At the root zero on `y^2=x^3-81x`, the corrected
  descent values are `(-81,-9,9)`, not the nonunit triple `(0,-9,9)`.
  Added the linear-factor identity to the locally soluble quartic API.
- Replaced the type-automorphism identity tautology by the full C3 wreath
  example, whose automorphism count is two. Made the Wood infinity and type
  controls concrete: a C3 quotient lost by prime-to-three completion,
  two distinct ramified squareclasses at infinity over F3, and two choices
  of the real outside involution.
- Added `k<=n` to Gaussian-binomial symmetry and the product API, with a
  negative control for natural subtraction when `k>n`.
- Corrected the restricted real quadratic family's matrix-law prerequisite
  from Layer 5 to the earlier Layer 3 laws.
- Corrected a local-topology step in the large-elliptic-family count:
  intersecting the minimal-pair clopen conditions with a relatively closed,
  null-boundary local specification preserves the latter properties, but
  need not make the intersection clopen.
- Added Lean controls distinguishing weak divisibility of a linear
  invariant from strong divisibility of its square, and the empty pencil's
  determinant-one invariant. Neither changes the intended theorem scope.
- Repaired the source locators detailed below and two incomplete reference
  sentences. Added an anchor for the coregular supporting contract and made
  its unresolved uses explicit, including the even-degree input at Bertini.
- Removed the duplicate pointwise two-Selmer rank target and redirected its
  consumers to the existing EllipticCurves supplier. Clarified the new
  real-metric polynomial-order reduction adapter against IntegralLattices.

## Independent source checks

The reproducible sample is `random.Random(10117).sample(blocks,15)`, where
`blocks` is the ordered list of the original 709 target paragraphs selected
by an explicit HTML anchor followed by a bold target title. This selection
was saved before edits. The table gives all fifteen, not a substitute sample
chosen after examining the sources. Page numbers below are the source's
printed manuscript pages unless journal pagination is explicitly stated.

| Sampled target | Public primary text actually read; result |
|---|---|
| Locally soluble forms attached to a family | Bhargava–Shankar, [1006.1002v3](https://arxiv.org/pdf/1006.1002v3), §3.2 p.24, §3.3 p.25, Proposition 3.9 p.26, §3.6 p.33. Integral scaling, local solubility and orbit weight refer to the same family. |
| Monic weak tail | Bhargava–Shankar–Wang I, [1611.09806v3](https://arxiv.org/pdf/1611.09806v3), Theorem 1.5(b) p.4 and §§2–4. Added the theorem page; retained the degree restrictions and the separate odd-degree argument. |
| FK maximal unlinked support | Fouvry–Klüners, [author text](https://math.uni-paderborn.de/fileadmin/mathematik/AG-Computeralgebra/Publications-klueners/ranks.pdf), §§5.3–5.5 pp.17–23, Lemma 18 pp.22–23 and Proposition 3 p.23. Corrected the section range: §5.5 is needed. |
| Injection moment conjecture | BKLPR, [1304.3971v2](https://arxiv.org/pdf/1304.3971v2), Conjecture 5.11 p.20 and Remark 5.12 pp.20–21. Retained a conjectural proposition and the prime-power coefficient-ring hypotheses. |
| Davenport–Heilbronn cubic field count | Bhargava–Shankar–Tsimerman, [1005.0672v3](https://arxiv.org/pdf/1005.0672v3), Theorem 1 p.1 and §8.3 p.24. Signature constants are `1/(12 zeta(3))` and `1/(4 zeta(3))`; stabilizer denominators are six and two. |
| Binary discriminant local factors | BSW II, [published text](https://doi.org/10.1017/fmp.2025.9), Appendix A, Propositions A.1–A.2 pp.53–55. The printed quartic expression is not accepted uncritically: independently recomputed the corrected coefficient counts below. |
| Discriminant loci of codimension two | BS2, text after Theorem 2.18 p.18, and Bhargava, [1402.0031](https://arxiv.org/pdf/1402.0031), proof of Lemma 3.6 p.14. Checked the primitive discriminant/derivative argument and the need for an exceptional-prime set. |
| Pencil finite-congruence count | Bhargava–Gross–Wang, [1310.7692v2](https://arxiv.org/pdf/1310.7692v2), Theorem 36 p.30, §§10–11 pp.29–30. Retained even matrix size at least four and the specified integral group. |
| Tamagawa number of PGL2 | BS2 §3.6 p.34 and §2.4 equation (23) p.13. Archimedean mass and local factors combine to two with the source differential normalization. |
| Normalized eigenangle spacing | Lipnowski–Tsimerman, [1511.02212v1](https://arxiv.org/pdf/1511.02212v1), proof of Corollary 5.14 p.34. Retained cyclic spacing, multiplicities and the `N/(2 pi)` normalization. |
| Volume of PGL2(Zp) | BS2 §3.4 p.30 and §3.6 p.34. Local volume is `1-p^-2` for the chosen differential, including at two. |
| Quartic invariant index | Bhargava, [Higher composition laws III](https://annals.math.princeton.edu/wp-content/uploads/annals-v159-n3-p08.pdf), §3.8 Corollary 18, journal p.1350 (PDF p.22). Retained the content factors in the invariant-order inclusion. |
| Pencil Selmer weighted count | BGW, Theorem 40 pp.31–32, equations (18)–(20). Read the rendered page as well as extracted text. Checked the scaling against Theorem 15's integrality condition; stronger coefficient divisibility is sufficient. Rational stabilizer weights are retained. |
| Malle conjecture | Klüners, [math/0411486](https://arxiv.org/pdf/math/0411486), Conjecture 1.3 p.1 and the counterexample pp.2–3; Wood's [survey](https://people.math.harvard.edu/~mmwood/Publications/ArithStats.pdf), §10.2 p.22. Strong and weak predictions remain separate; no present-day claim is inferred from the survey's historical status statement. |
| Nonabelian tame local model | Wood, [1702.04644v2](https://arxiv.org/pdf/1702.04644v2), §6 pp.26–28, Question 6.1 p.28. The NSF journal copy timed out; replaced the unchecked journal locator with the checked author-version locator. The local finite sum is distinct from the global conjectural asymptotic. |

The author's outstanding journal-verification caveat concerns Wood. Also
opened the author version at Proposition 2.2, §2 p.8, Lemma 6.2, §6
pp.28–29, and the predictions in §1 pp.2–3. The admissibility/abelianization
target now cites these checked author pages. This does not claim to have
read the unavailable journal pages.

For the closure finding additionally read BKLOS,
[1709.09790v2](https://arxiv.org/pdf/1709.09790v2), Theorem 8.1 and proof,
§8 pp.12–13, and its references on p.23. Its main-term source is Global
Fields II, Theorem 13, listed there as in preparation. The six axioms it
invokes concern the representation, local conditions, local spreading,
two archimedean counts and a uniformity estimate. These are not identical
to the six informal headings in the package. Global Fields I is separately
used for uniformity, and cannot silently replace the missing main-term
contract. Also read BSW II §7, Theorem 7.1 pp.51–52 and its deduction of
Theorems 1–2: maximality is passed through the same tail argument there.

The cleared-library index was consulted. No restricted book was needed.
This is a source sample and targeted follow-up, not a claim to have checked
all 130 reference editions in full.

## Adversarial mathematics pass

The layer walk checked domains, degenerate dimensions, prime restrictions,
signs, denominators and the distinction between a model identity and an
arithmetic theorem. The table records representative witnesses and the
changes or unresolved interfaces they expose; it supplements the target
Checks rather than replacing them.

| Statements and conventions checked | Instances and calculation | Outcome |
|---|---|---|
| Layer 0 families, Northcott and cutoffs | Empty family; natural heights at cutoff three; rationals with bounded ordinary absolute value; strict cutoff five before and after doubling | Finiteness is a field of the family; corrected rescaling direction and finite-average control. |
| Stabilizer weights and quotient carriers | Units of F3 acting on F3; regular action; identity orbit | Fixed false reciprocal-orbit-length total and tested the two weights individually. |
| Integral quartic invariants | `x^4-y^4`; `x^3 y-x y^3` over Z and F3; null form | Symbolically checked `27 Delta=4 I^3-J^2`; added the F3 division control. |
| Fixed-degree discriminant and strong/weak loci | Leading-zero `xy`, `y^2`; `x^2-y^2`; linear invariant and its square at zero | `Delta(xy)=1`; even-middle-coefficient quadratic perturbations have discriminant divisible by four. Added stronger Checks and a Lean example. |
| Monic and binary local factors | Degrees zero, one, two and four; primes two and three | Finite counts below confirm the retained corrected quartic formula; added degree and prime controls. |
| Picard quotient and carry | Z with kappa two; Z times C2; Z times C3 with kappa `(2,1)` | Odd plus odd carries minus the degree-zero class; the C3 example detects the sign. |
| Wood type and infinity conventions | Trivial group, C2, C3; order-three quotient; two ramified infinity squareclasses | Replaced tautological type checks; retained full versus prime-to-Delta group distinction and real rigidification. |
| Layer 1 cubic/quartic dictionaries and local descent | Split, reducible and singular forms; point at infinity; two-torsion root on `y^2=x^3-81x` | No division by a zero descent coordinate: use cofactor and identity conventions. Added explicit unit-squareclass tests. |
| Alternating tensors and minors | Zero matrix; swapped indices; two-row change of basis | Signed minors and determinant scaling agree with the ordinary coefficient convention. |
| Symmetric pencils and isotropic dimensions | Matrix sizes zero, one and three; zero pencil; positive-definite real form | Empty determinant is one; positive-size zero pencil is zero. Vector and projective dimensions remain distinct. Added the empty-pencil Lean control. |
| Layer 2 tails and divisor multiplicities | Delta zero; Delta linear; Delta a square; codimension one versus two | Singular locus separated; no finite divisor count at zero; no vanishing codimension-one prime-tail inference. |
| Finite congruence counts and Haar normalizations | Coupled CRT residues; local PGL2 at two and three; quartic real signs | Actual residue proportion required; differential Jacobian uses absolute value; real sign regions have unequal volumes. |
| Infinite local conditions and topology | Null local mass; relatively closed null-boundary specification intersected with minimal-pair conditions | Corrected the unwarranted clopen conclusion; retained separate zero-main-term and positive-denominator branches. |
| Even-degree tails and coregular counts | Degree two versus even degree at least four; raw archimedean sign cone | Conditional estimates do not become unconditional main terms. Remaining-work items 1–2. |
| Layer 3 field counts and multiplicities | Quadratic versus cubic constants; S4 versus all quartic fields; trace-zero quadratic discriminant `-4a` | Retained D4 contribution and zero trace-slice squarefree density; polynomial counts alone are not field lower bounds. Remaining item 3. |
| Gaussian, matrix and group laws | `q=1` via polynomial specialization, zero dimension, `k>n`, trivial group; F2 matrix enumerations below | Added the range to symmetry/product API; denominators only used where nonzero. No arithmetic distribution follows from a model identity. |
| FK directed phase and good planes | `k=0,1,2`; directed phase at zero; four unlinked pairs for `k=1` | Asymmetry and maximal affine rather than merely linear supports retained; corrected source section. |
| Layer 4 averages, Selmer and rank consequences | Identity orbit; full rational two-torsion; vanishing local family mass; nonidentity versus all elements | Existing exact sequence is imported, not replanned; finiteness and positive denominators precede division; averages do not identify rank with Selmer dimension. |
| Layer 5 finite quadratic and locally compact models | Zero module; dyadic quadratic versus polar isotropy; trivial group; empty set of primes | Existing finite quadratic quotient reused; common-parity law has singleton empty carrier and total one. |
| Moments and limits | Escaping mass versus unbounded moments; fixed degree versus fixed q; whole versus stable-range component profile | Tightness and uniform integrability remain explicit; no interchange of the two limits or unsupported ordinary component limit. |
| Isogeny/rank applications | Elliptic versus arbitrary abelian kernel; identity added to nonidentity count; local cokernel/kernel ratio | Same degree-three kernel is insufficient to supply a general-abelian counting specialization without the missing contracts. Remaining item 1. |

Independent exact computations, separate from the sorry examples:

- Enumerated all `4^5` binary quartic vectors modulo four: 384 have
  discriminant not divisible by four, giving `3/8`.
- Enumerated all `9^5` binary quartic vectors modulo nine: 42,768 are good,
  giving `176/243`. For the `9^4` monic quartics, the discriminant-unit and
  valuation-one counts are 4,374 and 648, giving `2/3` and `8/81`.
- Expanded the quartic invariant identity symbolically; checked primitive
  coefficient content, leading coefficient `256a^3` in the constant
  variable, and coprimality with its derivative over Q.
- Substituted the corrected monic local strata into the binary partition
  identity symbolically in degrees two through eleven.
- Enumerated F2 matrices: 3-by-3 unrestricted ranks zero through three have
  counts `(1,49,294,168)`; symmetric 2-by-2 ranks zero through two have
  counts `(1,3,4)`; alternating 4-by-4 ranks zero, two and four have counts
  `(1,35,28)`. Alternating includes zero diagonal in characteristic two.
- Enumerated the FK one-coordinate unlinked pairs (four), and normalized
  the common-parity law for zero through three primes using equal
  two-point parity marginals. These are finite regressions, not proofs of
  the general distribution theorems.

## Existing mathematics and dependency order

Checked current TauCetiRoadmap commit
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only. Searched by objects,
including quotient fields, quadratic vanishing, pairings, reduced Gram
matrices, moments, orbit actions, discriminants and Selmer exact sequences.
The search included the nine roadmaps newer than the atlas snapshot and
the four named Completed roadmaps, as well as current library sources.

| Existing supplier read | Ownership consequence |
|---|---|
| EllipticCurves Layers 6–7 and `AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean` | Removed `two-selmer-rank-identity` completely. Scope cites the cohomological exact sequence and Mordell–Weil, plus native `card_range_μ` / `pow_rank_le_card_of_range_μ_le`. Updated all three consumers. No removed stub remains. |
| IntegralLattices §2G and Suggested.lean reduction statements | Generic integral Minkowski reduction and bounded Gram entries are supplied there. Retained only the real embedding-metric adapter and restricted change-of-basis use, which need not be integral. |
| `LinearAlgebra/FiniteBilinearModule/Quadratic.lean` | Existing `IsIsotropic`, `IsLagrangian` and `orthogonalQuotient` are deferrals already correctly recorded in Scope. Statistical maximal-isotropic parameter spaces and intersection probabilities differ from these carriers. |
| `Probability/Moments/Determinacy.lean` | Existing scalar exponential-moment determinacy is a deferral. Group-valued surjection moments and rank-grid separator hypotheses are different and retained. |
| Completed RestrictedProducts and Mathlib product measures | Existing restricted products and independent products remain deferrals. Quadratic self-duality and the maximal-isotropic probability are the new interfaces. |

At the pinned Mathlib `082e2d3` / Tau Ceti `f790474`, read actual statements
for Northcott and its finite-fibre composition, natural height sublevel and
summatory functions, polynomial discriminants (constant, linear and
quadratic), the signed number-field discriminant, the Dedekind-zeta residue
and the Chebyshev bound. Also read the native explicit descent cardinal
and rank inequalities rather than assuming they state the full
cohomological exact sequence.

The Caraiani–Newton order puts ArithmeticStatistics and AnalyticNumberTheory
in the same tier-14 bundle. The listed geometry, moduli, Galois, duality,
height and cohomological suppliers are lower-tier. The restricted-family
matrix-law forward citation was fixed locally. No
`FoundationsAndLibraryIntegration` or `UPSTREAM:` identifier remains in the
package. This review makes no new ownership move into a higher roadmap.

## Lean comparison and validation

The revised 529-line Suggested.lean elaborated successfully through
`lean-check`. It produced 71 warnings, all exactly declaration-uses-sorry,
and no errors. Compilation checks types; the computations above are
separate mathematical checks. No carrier is defined by sorry, and the
file does not develop the omitted heavy theory.

More than ten representative signatures were compared against the README:

| Signature | Hypothesis/convention checked |
|---|---|
| `ArithmeticFamily.count` | Inclusive real cutoff and Northcott field, no quotient inferred from raw representatives. |
| `relativeDensity_mul` | Nested subfamilies, infinite ambient family and correctly ordered product. |
| `boxHeight_count` | Natural inclusive cutoff, including zero-dimensional vector and zero bound. |
| `monicPolynomial`, `weightedBox` | Descending coefficients, strict weighted cutoff, degree-zero polynomial one. |
| `StrongSquareDivides`, `WeakSquareDivides` | Universal perturbation versus divisible-at-point and not strong. |
| `twentySeven_mul_disc` | Integral polynomial identity over any commutative ring, no inverse of 27. |
| `quarticMinors_mul` | Two-row determinant scaling with signed minors. |
| `pencilInvariant_congr` | Descending signed determinant, square determinant multiplier, all matrix sizes. |
| `commonIsotropic` | Bilinear vanishing on all vector pairs, vector dimension, characteristic-two caveat. |
| `monic_rational_root_bound` | Degree at least two, real cutoff at least two, actual weighted coefficient box. |
| `powerRank_prod` | Finite commutative groups, prime p and positive power index. |
| `fk_good_subspace_bijection` | Directed pairing vanishing and exactly k-dimensional good planes. |
| `woodGridSeparator_upper`, `woodGridSeparator_diagonal` | Prime base and antitone partitions; strict lexicographic comparison. |
| `parityCoupledWeight_total` | Nonnegative summable marginals, half mass in each parity, empty prime set. |

Validation completed:

- `lean-check` on the package Suggested.lean: exit zero, only sorry warnings.
- `scripts/check_sorry_data.py` on that file: exit zero.
- `scripts/check_blueprint.py` on the core packet and all six stage packets:
  seven successes, each with zero errors and zero warnings.
- `research/blueprint/intake.py check-files` on the submitted deliverables:
  zero problems.
- JSON parsing, local-anchor resolution, explicit prerequisite-cycle check,
  definition inventory, API Check counts and `git diff --check`: passed.

## Remaining work and handoff

1. **Replace the informal coregular checklist by an exact supplier plan.**
   Consumers are [number-field twist orbit count](../packages/ArithmeticStatistics/README.md#refinement-number-field-twist-orbit-count),
   [BKLOS elliptic average](../packages/ArithmeticStatistics/README.md#bklos-average-size-of-three-isogeny-selmer-groups)
   and [abelian three-isogeny average](../packages/ArithmeticStatistics/README.md#refinement-abelian-three-isogeny-average).
   The current Layer 2 theorem is elliptic and explicitly conditional.
   The supporting paragraph says to establish equidistribution, negligible
   nongeneric contributions, uniform tails and a mass identity, but does
   not state their quantified representation-specific estimates or give
   a complete chain to them. Specify the exact SL2 cubic count, height,
   integral representative multiplicity, finite archimedean window,
   differential and six source axioms; give each missing instance an exact
   statement, prerequisites and proof outline. Reconcile the squareclass
   representative measure with the denominator. Supply the corresponding
   orbit/local-solubility and counting specialization for arbitrary
   abelian degree-three isogenies, or retain that conclusion conditionally.
   Then trace the rank applications using it. A roadmap need not contain
   formal proofs of these estimates, but it must plan the actual estimates;
   a request to prove an unspecified counting theorem does not close it.

2. **Close or propagate the even-degree binary assumptions.**
   [Binary-form sieve counts](../packages/ArithmeticStatistics/README.md#binary-form-sieve-counts)
   correctly retains the paired-fibre, restricted Gram and non-Sn
   estimates with `delta,eta,xi` and both cutoff inequalities. The
   [Bertini target](../packages/ArithmeticStatistics/README.md#binary-form-arithmetic-bertini)
   is all-degree and invokes maximal-order density without those
   conditions. The source's §7 proof passes both densities through the
   same tail; the supplied plan gives no independent maximal-order
   replacement. State the restricted estimates with sufficient uniformity
   and a proof plan replacing the disputed Lemma 6.25 step, or formulate
   the even-degree deduction with those hypotheses. The numerical
   `1/(88 n^6)` saving cannot be inferred just from positivity of a saving.
   The README now explicitly marks this consumer gap.

3. **Retain the field-lower-bound restoration obligations.**
   The [monogenic](../packages/ArithmeticStatistics/README.md#monogenic-field-lower-bound-target)
   and [binary-form](../packages/ArithmeticStatistics/README.md#binary-form-field-lower-bound-target)
   targets already acknowledge missing positive regular restricted sieves
   and bounded field multiplicity. The trace-zero quadratic counterexample
   prevents a universal positive slice density; openness near one form
   does not by itself give strong reduction on every dilated region.
   Supply a quantified replacement regular family and multiplicity
   theorem, with a viable proof route. The unramified alternating-extension
   target also explicitly requests its original parametrization and
   infinity/multiplicity comparison. These obligations were preserved,
   not relabelled as proved consequences. A formalization roadmap can plan
   new proofs, but the replacement theorem and its hypotheses still need
   to be determined before this is a gap-free upstream package.

No statistical conjecture is rejected merely for being conjectural: the
named Cohen–Lenstra, Malle, Selmer and component-profile propositions keep
their explicit conjectural status. The verdict concerns missing exact
inputs in claimed theorem chains, not those separately stated predictions.
