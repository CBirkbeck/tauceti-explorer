# Independent package review: AutomorphicGaloisRepresentations

**Verdict: needs_changes.** Codex (GPT-6), session `codex-inpulW`, completed
this review on 9 October 2026 for issue #7506. This session did not write the
package or its accepted plan. The README's mathematical presentation is
substantial and its clear omissions have been corrected. The suggested file
elaborates, but most promised interfaces and named theorems occur only in
comments. Elaboration therefore does not establish the correspondence required
by PROTOCOL §§13 and 20. This is a completed independent review.

## The six acceptance checks

| Check | Result | Evidence |
| --- | --- | --- |
| 1. Upstream form and size | Pass | Introduction, boundaries, common conventions, six mathematical layers, sources and prerequisites per target, APIs and discriminating test specifications. Final README: 142,482 bytes, below 200 KB. |
| 2. Fidelity to the accepted plan | Pass after corrections | All 66 targets are located below; all 90 API names and 66 test names occur in the README. Statements were compared with the accepted nodes and their hypotheses, not merely matched by name. Supplier boundaries and the distinction between geometric, residual and unrestricted theorems are preserved. |
| 3. Own words and source locators | Pass within the package review's evidence | The roadmap specifies mathematical work rather than reproducing a paper's text or outline. Every target has local references with theorem/section and page locators. Four public source versions were freshly retrieved and checked as described below; the remaining source checks are inherited from the accepted plan's independent review, not claimed as fresh readings. |
| 4. No programme process in the roadmap | Pass | The README contains mathematical layer IDs and supplier IDs, but no packet paths, job IDs, review history, checkpoints or coverage statuses. |
| 5. Suggested Lean file | **Fail on correspondence; pass on elaboration** | Final `lean-check`: exit 0, 29 warnings, all `declaration uses sorry`, no errors or other Lean warnings. Comment-stripped code has 12 definitions, 10 named theorem commands and 55 examples. Only 10 of the 90 proposed API names are active declarations, several with narrower algebraic contracts. |
| 6. Metadata | Pass | Exactly `topic = "math.NT"` followed by a newline. This category fits the modular/Hilbert arithmetic targets. |

The comparison for form and density used the complete upstream
`content/tau-ceti/Multiquadratic/README.md` and
`content/tau-ceti/ArithmeticDirichletSeries/README.md`, as well as
UPSTREAM_GUIDE. The package groups construction contracts and their usable
APIs by mathematical subject. Its size and explicit interfaces are appropriate
for a roadmap with this many targets.

## Corrections made in the package

These changes restore information already supported by the accepted plan; no
new theorem or owner is introduced.

1. **Parabolic realization.** Made the k, N and character-conductor hypotheses,
   the set S_N of primes dividing Nk!, the condition S_M=S_N, and DFG's
   operator/scalar conventions explicit on the whole parabolic object.
2. **Rank-two newform factor.** Restored the alternating perfect pairing and
   its exterior-square target, transported it through the character twist,
   and stated the arithmetic dual's Tate-twist identification, determinant,
   continuity, ramification and complex-conjugation shape. This is the
   pairing in Diamond–Flach–Guo Lemma 5.7, arXiv v2 p. 58, transported using
   their §1.3, p. 12, and §5.5, pp. 59–60. The twist remains visible for
   nonquadratic nebentypus.
3. **Geometric Hilbert arguments.** Added the common exclusion of the
   coefficient characteristic and the auxiliary quaternionic place to the
   bad-reduction subsection. The separate Theorem A/base-change step removes
   the latter exclusion. Specified the local base-change conclusion for every
   extension of degree at most three. Corrected the reference to the
   unrestricted constructor's position in the document.
4. **CM definition.** Specified the infinity exponents of the inducing
   character and explained why its half-norm twist is algebraic. The regular
   weight and nonconjugate-character hypotheses remain explicit.
5. **Weight-two and residual factors.** Specified the imported modular
   abelian quotient and its coefficient-linear λ-summands. Restored the
   equivalence of irreducibility and absolute irreducibility for odd residual
   characteristic, and the full good arithmetic Frobenius polynomial. Made
   the oldform scalar-extension identification and the hypotheses of the
   reduced-localization theorem explicit.
6. **Quaternionic Hecke family.** Specified the open, compact-modulo-centre
   level and character domain, and the conjugacy/strict-equivalence uniqueness
   conventions.
7. **Lean test descriptions.** Removed the assertion that the s=1 polynomial
   identity tests agreement between two Hilbert constructions. Marked the
   ordinary-intersection example as the membership part of the saturation
   test, rather than a test of the torsion quotient of a nonsaturated lattice.
   The executable statements and their honest mathematical limits are
   preserved.

## Required revision: declarations must express the promised interfaces

The inventory beginning after the namespace is one block comment. It records
all target statements, APIs and test descriptions, but none of those entries
is checked by Lean. Earlier comments also explicitly say that many signatures
are not stated. This is candid documentation of what remains; it cannot serve
as the definitions, theorem signatures, API lemmas and examples required for
a completed package by PROTOCOL §20.

The following table accounts for all 15 definition/construction nodes and all
90 API entries. Names are relative to `TauCeti.ModularGalois`. A number in the
third column counts exact active names, not satisfaction of the full contract.

| Interface | API entries | Active names | Remaining mathematical contract |
| --- | ---: | ---: | --- |
| Higher-coefficient Eichler–Shimura | 4 | 0 | Coefficient pull–push, level transport and the correspondence identities |
| Deligne–Serre Condition C | 5 | 5 | The finite-matrix definitions and API have signatures; retain them |
| Parabolic premotive | 5 | 0 | Realizations, Hodge/cusp-space comparison, pairings and Hecke action |
| Integral parabolic/newform structure | 7 | 0 | Integral modules, top filtration, Hecke duality, kernel and rationalization |
| Carayol multiplicity space | 4 | 0 | The cohomological Hom, dimension, level independence and decomposition |
| Residual newform representation | 5 | 0 | Semisimplified reduction, polynomial/determinant, lattice independence and recognition |
| Full weight-two Hecke algebra | 7 | 0 | Full algebra, faithful/rank-two module, polynomial and residual specializations |
| Scholl projector | 5 | 2 | The finite averaging operator has signatures; its geometric action, parabolic identification and level/Hecke compatibility do not |
| Newform orbit factor | 7 | 1 | `newformFactor` is an arbitrary linear idempotent's image, without orbit selection, coefficient action/descent, rank two or period/lattice comparisons |
| Unrestricted Hilbert representation | 10 | 0 | Continuous global representation, good polynomials, construction independence and coefficient/twist/classical comparisons |
| CM Hilbert predicate | 6 | 0 | Inducing extension/character, trace formulas and functoriality |
| Fixed-eigenform family | 6 | 0 | Instance of the imported carrier with members, polynomials, local parameters, coefficient change and strictness |
| Ordinary lattice refinement | 7 | 2 | Intersection and scalar saturation are present; invariant characters/flag, rank-one quotient, coefficient transport and period compatibility are absent |
| Crystalline/Wach realization | 6 | 0 | Correctly normalized period/projector/Wach identifications, integral quotient and semilinear basis change |
| Geometric Hecke determinant | 6 | 0 | Whole-ring continuous law, descent from cohomology and finite-quotient/nilpotent specialization |
| **Total** | **90** | **10** | |

The seven other active definitions are polynomial and degree models. They do
not supply any of the omitted Galois, automorphic, period or cohomological
objects. Of the plan's 51 theorem/lemma targets, only the bounded-semisimple-
group theorem and the finite prime-to-order lifting theorem have corresponding
named target signatures. Even the latter leaves faithful lifting as an
unstated consequence. The other 49 targets need named statements, including
classical and Hilbert existence, the representation dictionary, both local
compatibility layers, irreducibility/large image/purity and Hecke-law
reconstruction. Additional active algebra lemmas are useful API, but are not
statements of those targets.

The standard notice that Suggested.lean is not exhaustive does not remove
§20's package requirement. The earlier target-plan review also recorded the
small active fragment. Its acceptance is not evidence that these absent
package signatures elaborate. The revision must supply actual mathematical
signatures wherever the imported/existing carriers permit them, retain
concrete definitions rather than arbitrary `Prop` stand-ins, and make any
unstateable imported conditions explicit. Do not replace an omitted theorem
with an unrelated coefficient calculation to obtain a passing compile.

## Required revision: tests must exercise their specified contracts

There are 55 `example` commands, but this is not 55 completed tests out of 66:
some tests have several examples, some examples check acceptance arithmetic,
and several only check a part of a test. In particular:

| Promised test | Current example | What the revision must test |
| --- | --- | --- |
| Hecke-correspondence fibres | Integer arithmetic about p+1 and the two fibre cases | Cardinality of the actual correspondence fibre in the three characteristic/reduction cases |
| `hilbertGaloisRep_branches` | Equality of two rational polynomial formulas at s=1, now correctly labelled | Isomorphism of geometric and congruence constructions for the same qualifying π, using the full uniqueness theorem |
| `newformFactor_orbit` | Membership in an arbitrary idempotent's image | Rational orbit factor versus an individual embedding, with the coefficient action and dimension comparison |
| `ordinaryLatticePlus_saturation` | Membership in T∩V⁺, now correctly labelled | Saturation and the torsion quotient that rejects pOe₁ inside O² |
| Strict family/local compatibility tests | Polynomial or numerical degree checks, or comment-only descriptions | The specified member/local-parameter statements, including nonzero monodromy at a Steinberg place |
| Whole-ring determinant/local-condition tests | Useful actual dual-number matrix and mixed-coefficient examples | Law specialization and condition factorization on the Hecke algebra and its nilpotent finite quotients |

Retain the genuine finite-matrix tests for Condition C and the existing
division-free determinant examples. Their statements already distinguish
meaningful algebraic failures. Complete the missing geometric/arithmetic
tests as those interfaces acquire signatures; they must use the actual
objects they are supposed to distinguish.

## Mathematical boundaries, conventions and source evidence

The six reviewed library-audit entries were read. They record these layers as
not built; existing analytic form spaces, representation/matrix/submodule
carriers and the analytic baseline are reused. All 13 baseline declarations
were reread at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. In particular, Landau requires
nonnegative coefficients and the actual finite abscissa; the embedding
finiteness theorem requires integrality and all embeddings; neither replaces
the requested Euler-log/density arguments.

The atlas extract's 30 stage edges and the 29 link-map examination records
mentioning this base roadmap were inspected. Those examination records assert
no direct link, often only after a limited screen; they are not proofs of
absence. No contradictory direct link was found. The README correctly imports
coefficient geometry from R14/GH/R18, transfer from R16/R17, generic period
comparison from R06, ordinary characters from R21.3, compatible-system carriers
from R24.5, and generic whole-ring laws/reconstruction from IHG. It keeps the
modular arithmetic applications here. Early AG2 character/geometric imports
are distinguished from later AG2 comparisons that consume this roadmap.
Dependencies on later displayed layers remain specific interfaces rather
than an assertion that the layer-number order is a proof order. The accepted
plan's 12 gaps and 51 supplier requests are not claimed resolved by packaging.

The hypothesis comparison preserved these consequential distinctions:

- Carayol/Saito's geometric even-degree theorem retains its finite
  discrete-series hypothesis; the unrestricted Hilbert constructor does not.
- Kisin's coefficient-prime route retains residual absolute irreducibility;
  Skinner's theorem removes it and compares full Frobenius-semisimple
  Weil–Deligne data, including N.
- Geometric Frobenius, inverse-uniformiser Hecke operators, arithmetic duals
  and cyclotomic twists remain separate. Skinner's printed Hodge degrees are
  transported with the recorded shift; the elliptic and Δ checks keep it
  visible.
- DFG's conjugate eigensystem and its character twist are retained, including
  the perfect pairing restored above.
- The Fontaine–Laffaille interval limits the chosen integral comparison,
  not characteristic-zero existence or good-prime crystallinity. Endpoint
  weights do not become Barsotti–Tate without a different specified lift.
- Ordinary lines use the correct arithmetic quotient/cohomological
  subrepresentation and the fixed lattice's saturated intersection.
- Nilpotent Hecke structure survives geometric determinant descent and
  local-condition factorization. Reduced eigenform points are insufficient.

Four public PDFs were retrieved on 2026-10-09 and reproduced the plan's hashes:

| Source/version | SHA-256 | Freshly checked portions |
| --- | --- | --- |
| [Diamond–Flach–Guo, arXiv 2512.02348v2](https://arxiv.org/pdf/2512.02348v2) | `0f4984acdabd2efd542aae932850da83c36ec023185a47f40c8ef5813bd21898` | §5.4, Lemma 5.7, pp. 58–59; §5.5, pp. 59–60, for the pairing and conjugate-factor convention |
| [Carayol, Numdam ASENS 1986 scan](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) | `d4a5fb6b1cd76f944f8948e06df1c7ad5656ae5ee14b9189178ee1e8f2b0dab8` | §§0.2–0.7, pp. 409–411, for parity, auxiliary place, geometric reciprocity and Hecke/dual conventions |
| [Skinner, Documenta Math. 14 (2009), EMS PDF](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) | `4a2a489aa1401431b5b8279c5a246bfa147debba10698764fd6612ef37d0928d` | Theorem 1, equations (1)–(2) and Hodge-degree definition, p. 242; introduction's cases, p. 243 |
| [Deligne–Serre, Numdam ASENS 1974 scan](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) | `65b390f6d33e827e30c6c66bbc15421eca51db3180bdf5996dcee19047be97fc` | Retrieved for the own-words comparison; the earlier accepted review supplies the mathematical verification of §§3–8, pp. 513–527 |

The inherited source audit is
`research/blueprint/reviews/REV-AutomorphicGaloisRepresentations~2.md` and the
accepted nodes' source anchors. This review did not reread all 26 sources or
reprove their arguments. A fresh ten-word-run comparison against the four
retrieved texts found only bibliographic titles; manual reading found no
copied passage or source-section outline. No private-library book was needed
or copied. An attempted Scholl author-copy retrieval failed certificate
verification; its locators and mathematics are inherited from the accepted
audit, not represented as freshly verified here.

## Validation and limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicGaloisRepresentations.json`:
  0 errors, 0 warnings. The accepted packet is unchanged.
- `lean-check research/blueprint/packages/AutomorphicGaloisRepresentations/Suggested.lean`:
  final exit 0; 29 `sorry` warnings, no errors or other Lean warnings. Memory
  was checked before elaboration and one Lean process was run at a time.
- The shared build's Mathlib commit equals the required pin. The file imports
  only individual Mathlib modules. The shared Tau Ceti checkout is at a different
  commit, so this check does **not** demonstrate elaboration of Tau Ceti imports
  at its pin. Its one cited baseline declaration was read with `git show` at
  the exact pin; this is source verification, not compilation of that module.
- The active-declaration audit removes nested block comments and line comments
  before counting commands and matching the proposed API names. It is a
  correspondence audit, not a proof of semantic correctness by counting.
- `python3 research/blueprint/intake.py check-files` on the five changed
  deliverables: 5 files, 0 problems. JSON/metadata parsing, target-map/API-name
  checks and `git diff --check` also passed.

The following target map gives the README location after corrections. It is a
prose-fidelity record, not a claim that each target has an active Lean
signature. Common conventions, subsection hypotheses, APIs and local source
paragraphs form part of each comparison.

## Target map

| Accepted target (within AutomorphicGaloisRepresentations) | README paragraph | Line |
| --- | --- | ---: |
| `R19.1/geometric-construction-and-the-eichler-congruence-relation` | Coefficient Eichler–Shimura | 186 |
| `R19.1/lambda-adic-representation-of-a-weight-k-eigenform` | Higher-weight classical existence | 192 |
| `R19.1/parabolic-realisation-premotive` | Parabolic realisations | 216 |
| `R19.1/newform-rank-two-realisation` | Rank-two newform realisation | 229 |
| `R19.1/integral-structure-of-the-newform-premotive` | Integral newform structures | 243 |
| `R19.1/scholl-projector` | Scholl's projector | 285 |
| `R19.1/newform-projector-and-coefficient-descent` | Rational orbit projector and coefficient descent | 291 |
| `R19.1/mod-lambda-representation-of-a-mod-lambda-eigenform` | Residual eigensystems before characteristic-zero eigenforms | 334 |
| `R19.1/rankin-bound-for-a-cuspidal-eigenform` | Rankin's prime estimate | 340 |
| `R19.1/weight-one-eigenvalues-outside-a-sparse-set` | Finite eigenvalue sets off sparse primes | 346 |
| `R19.1/deligne-serre-condition-c` | Deligne–Serre Condition C | 354 |
| `R19.1/bounded-semisimple-subgroups-of-gl2` | Bounded finite semisimple images | 360 |
| `R19.1/uniformly-bounded-residual-images-in-weight-one` | A bound uniform in splitting coefficient primes | 366 |
| `R19.1/lifting-representations-of-groups-of-order-prime-to-l` | Prime-to-residue-characteristic lifting | 372 |
| `R19.1/weight-one-characteristic-zero-lift` | A characteristic-zero weight-one lift | 398 |
| `R19.1/weight-one-cuspidal-irreducibility` | Weight-one cuspidal irreducibility | 404 |
| `R19.1/weight-one-artin-representation` | The weight-one Artin representation | 410 |
| `R19.2/all-cohomological-hilbert-representation` | The unrestricted Hilbert constructor | 420 |
| `R19.2/hilbert-normalisation-dictionary` | The representation dictionary as a theorem | 426 |
| `R19.2/carayol-sigma-lambda-construction` | The quaternionic multiplicity space | 458 |
| `R19.2/carayol-twisting-and-determinant` | Twisting and the exact determinant | 464 |
| `R19.2/hilbert-modular-compatible-system-carayol-theorem-A` | Carayol's geometric Hilbert theorem | 470 |
| `R19.2/carayol-vanishing-cycle-filtration` | Vanishing-cycle filtration | 498 |
| `R19.2/carayol-special-places` | Special local components | 504 |
| `R19.2/carayol-local-fundamental-representation` | The local fundamental representation | 510 |
| `R19.2/carayol-ordinary-cuspidal-places` | Ordinary cuspidal local components | 516 |
| `R19.2/carayol-theorem-b` | Carayol's Theorem B | 522 |
| `R19.2/carayol-primitive-restriction-lemma` | Primitive two-dimensional restriction | 530 |
| `R19.2/carayol-cubic-base-change-of-extraordinary` | The extraordinary cubic step | 536 |
| `R19.2/hilbert-hodge-tate-property` | Hilbert Hodge–Tate property | 549 |
| `R19.2/hilbert-uniqueness-determinant-oddness-irreducibility` | Determinant, total oddness and absolute irreducibility | 555 |
| `R19.2/cm-hilbert-eigenform` | The CM predicate | 563 |
| `R19.2/virtual-reducibility-implies-cm` | Virtual reducibility characterizes CM | 573 |
| `R19.2/wiles-ordinary-hilbert-representation` | The nearly ordinary Hilbert construction | 600 |
| `R19.2/ordinary-cm-primes-split` | Ordinary CM primes split | 606 |
| `R19.2/cm-ordinary-line-complex-conjugation` | Complex conjugation moves the ordinary CM line | 612 |
| `R19.3/strict-compatibility-and-the-monodromy-weight-purity` | Geometric weight-monodromy and strict compatibility | 622 |
| `R19.3/hilbert-ramanujan-conjecture` | Hilbert Ramanujan–Petersson | 628 |
| `R19.3/monodromy-weight-purity-of-the-family` | Purity of the entire family | 634 |
| `R19.3/classical-newform-irreducibility` | Classical characteristic-zero irreducibility | 642 |
| `R19.3/dimitrov-large-image` | Dimitrov's residual large image | 648 |
| `R19.3/ribet-momose-classical-large-image` | Ribet–Momose classical large image | 654 |
| `R19.3/fixed-eigenform-compatible-family` | The fixed-eigenform compatible family | 662 |
| `R19.3/skinner-density-one-ordinary-primes` | Density-one ordinary primes for the fixed weight-two form | 668 |
| `R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility` | Hecke versus Langlands normalization | 696 |
| `R19.4/all-hilbert-local-global-compatibility` | All-Hilbert compatibility away from λ | 702 |
| `R19.4/nearly-ordinary-hilbert-compatibility-away-from-p` | Nearly ordinary compatibility away from p | 708 |
| `R19.4/conductor-and-local-factors-classical` | Classical conductors and bad Euler factors | 716 |
| `R19.4/quaternionic-sigma-place-local-form` | A fixed character at quaternionic ramification places | 722 |
| `R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime` | Geometric coefficient-prime comparison | 732 |
| `R19.5/kisin-hilbert-coefficient-prime` | Kisin's coefficient-prime theorem | 738 |
| `R19.5/skinner-full-hilbert-coefficient-prime` | Skinner's full coefficient-prime theorem | 744 |
| `R19.5/hilbert-local-behaviour-at-p` | The KW coefficient-prime local forms | 752 |
| `R19.5/endpoint-weight-local-contract` | The endpoint-weight local contract | 758 |
| `R19.5/ordinary-refinement-and-saturated-lattice` | Ordinary refinement and the fixed lattice | 766 |
| `R19.5/good-nonordinary-crystalline-wach-realisation` | Good-prime crystalline and Wach factors | 772 |
| `R19.5/shimura-curve-hk-dR-multiplicity` | Shimura-curve Hyodo–Kato/de Rham multiplicity | 816 |
| `R19.6/weight-two-tate-module-decomposition` | Weight-two Tate-module decomposition | 826 |
| `R19.6/residual-representation-of-a-newform` | Residual newform representation | 837 |
| `R19.6/full-weight-two-hecke-algebra-and-its-galois-representations` | The full weight-two Hecke algebra | 869 |
| `R19.6/reduced-hecke-algebra-as-a-localisation` | The specified reduced localization | 879 |
| `R19.6/geometric-hecke-determinant` | The geometric Hecke determinant | 911 |
| `R19.6/determinants-and-representability-over-a-hecke-algebra` | From a determinant law to a Hecke representation | 917 |
| `R19.6/hecke-algebra-representation-quaternionic` | Quaternionic Hecke-algebra representations | 943 |
| `R19.6/hecke-algebra-representation-classical` | Classical type-Σ Hecke representation | 954 |
| `R19.6/hecke-family-local-conditions` | Local conditions on the entire Hecke family | 962 |
