# Independent review of the HC.4 blueprint part

Accepted after correction. Job `REV-HabiroCyclotomicCompletions--HC.4`, issue
#6413; Codex session `codex-8xzsT5`, 2026-10-05. The author of the input was
Codex session `codex-CrXH74` on #6470. This session did none of that work.

The reviewed packet is a complete pass, with HC.4 closed in its explicitly
chosen scope. Its fifteen inherited classical targets remain imports from the
accepted parent packet. This part supplies GSWZ §5.1 and Examples 5.6–5.7,
including the finite integral image criterion, compatible reconstruction,
local detection, and the finite-domain separation input to Habiro's Theorem
5.2. It retains the parent's irreducibility-qualified individual-root theorem.
It does not assert the broader Theorem 6.2 across the parent's unresolved
coefficient-field boundary. The rescope proposal makes that decision explicit.
Assembly must reconcile the parent coverage and apply the display proposal;
this review changes neither the parent packet nor the atlas.

## Counts and verdicts

| Item | Input | Reviewed |
| --- | ---: | ---: |
| Nodes | 36 | 59: 36 corrected, 23 added, none deleted |
| Definitions / constructions | 4 / 4 | 4 / 4 |
| Comparisons / lemmas / theorems / applications | 2 / 19 / 5 / 2 | 3 / 37 / 5 / 6 |
| API items | 40 | 42 |
| Unit tests | 25 | 25 |
| Planets | 6 | 6 |
| Pinned Mathlib references | 32 | 41: all confirmed, none removed |
| Source issues | 5 | 5: E19–E23 independently confirmed |
| Gaps / requests / remaining refinements in this part | 0 / 0 / 0 | 0 / 0 / 0 |

Every node has a corresponding entry in `review.checked`; added nodes carry
`addedBy: REV-HabiroCyclotomicCompletions--HC.4`. All implementation statuses
remain `unchecked`. Elaboration checks signatures, not the proofs represented
by `sorry`.

## Sources and inherited work

I read the mathematical statements, locators and excerpts of all 36 original
nodes against [GSWZ, arXiv v2](https://arxiv.org/pdf/2412.04241v2), §5.1,
pp. 59–64, and the examples and local context on pp. 65–66. I also read the
coefficient conventions in §1.4, compared the relevant formulas with the
[Wheeler author copy](https://www.ihes.fr/~wheeler/files/text128.pdf), and checked
the rendered determinant/matrix and quotient pages against text extraction.
For coefficient transfer and the inherited scope I read the relevant proofs
and §7.5 in [Habiro's published paper](https://ems.press/content/serial-article-files/40881),
pp. 1138–1141 and 1145–1146. The three downloaded PDFs match the SHA-256 values
in `sourceVersions`. All were accessed on 2026-10-05.

The packet's generic source matches have been replaced throughout by explicit
descriptions of what each passage establishes. The universal quotient
`A_m(R) = R[q]/(Phi_m)` is an explicit formalisation convention required by
the source's phi(m) coordinates for arbitrary R, rather than a tensor-product
definition literally printed in the paper. At R = Q(i), an embedded single
root algebra loses a component. The split-root test now checks rank two and a
nonzero kernel element. The two-factor determinant and finite-domain embedding
are independently derived auxiliary lemmas; their citations identify the
source application, rather than claiming that the source states those lemmas.
Wrongly located excerpts were corrected, including the universal-product
passage. Hypotheses now distinguish arbitrary rings, nontrivial rank
statements, torsion-free injectivity, rational reconstruction and fixed
integer examples; irrelevant stock hypotheses were removed from examples.

I read the accepted parent nodes supplying HC.1 finite quotients and factorial
cofinality, HC.2 digits, HC.3 Taylor/substitution maps, HC.4 resultants and
rigidity, and HC.5 rational and prime-inversion components. Their exact
statements supply the uses made here. Completion and normalized digit
expansion are imported, with only finite ordered-basis wrappers added. HC.5
owns the prime-inversion decomposition; HB.6 owns Frobenius gluing and the
number-field ring. The finite comparison is untwisted. The reviewed audit
`AUDIT-17` marks HC.4 not built; existing general CRT, resultants, adjugates,
quotient bases and separatedness are used as baseline, rather than replanned.
The pinned Tau Ceti sources do not supply this Habiro comparison or the
required general finite-domain embedding. The Integral lattices and
Multiquadratic upstream documents were read for roadmap density and vocabulary.

## Corrections to the original declarations

The following table records the declaration changes in addition to the
source/hypothesis corrections above. Identifiers below omit the common prefix
`HabiroCyclotomicCompletions:HC.4/`.

| Original declaration(s) | Correction |
| --- | --- |
| `universal-taylor-product` | Distinguish the universal quotient convention from the literal source notation; fix locator and strengthen the split-root test. |
| `factorial-kernel-filtration`, `factorial-kernel-characterisation` | Keep the principal-kernel assertion separate from digits, decreasing filtration, separation and quotient comparison; add `mem_hFiltration_digits`. |
| `weighted-taylor-filtration`, `weighted-jet-kernel` | Keep the coordinate kernel separate from decreasing filtration and separation. |
| `factorial-graded-piece`, `taylor-graded-piece` | Remove bundled finite reconstruction/base-change assertions; give direct identification inputs. |
| `finite-precision-bases` | Specify the ordered digit basis and its polynomial classes and coordinate representation; split the jet basis and dimension count. |
| `multiplicative-taylor-comparison`, `factorial-vanishing-order` | State the completed comparison separately from its filteredness; retain the divisibility assertion at arbitrary coefficients. |
| `leading-factor`, `root-product-identity`, `factorial-leading-coefficient` | Verify signs, exponent l−1 and positive-order conventions; supply a concrete complex primitive root and transfer the domain identity through the integral universal quotient. |
| `graded-taylor-map` | Give the simultaneous remainder map and scalar-block inputs directly. |
| `simultaneous-cyclotomic-remainders`, `graded-taylor-injective` | Separate torsion-free injectivity from rational bijectivity; justify rational CRT with exact baseline declarations. |
| `finite-taylor-map`, `finite-taylor-injective` | Add completed-element compatibility `iota_hProjection`, direct separated filtration inputs and a separate rational finite bijectivity lemma. |
| `global-taylor-injective`, `rational-taylor-isomorphism` | Use finite injectivity and factorial separation; provide coherent finite preimages and Taylor reconstruction for rational surjectivity. |
| `taylor-matrix`, `finite-taylor-coordinate-matrix` | Specify both bases and the `toMatrix` identification; separate action on digits and the triangular vanishing assertion. |
| `two-factor-remainder-determinant` | Explain the two unit-triangular monomial basis changes and the Sylvester map; retain repeated factors, noncoprime factors and degree-zero cases. |
| `cyclotomic-remainder-determinant`, `graded-taylor-determinant` | Check the pairwise resultant convention, positivity and the scalar-block multiplicities. |
| `finite-taylor-determinant` | Make triangularity a direct prerequisite; explicitly use `OrderDual` weights for Mathlib's block-triangular convention; separate positivity. The already corrected n<N indexing is retained. |
| `signed-adjugate`, `signed-adjugate-identities` | Separate the two matrix multiplication identities; keep the signed integer adjugate and rational inverse API. |
| `finite-integral-image-criterion` | Require both adjugate identities and positive determinant directly; cancel the scalar using Z-torsion-freeness. |
| `global-integral-image-criterion` | Add explicit finite coordinate/basis inputs and unique compatible preimages, followed by factorial reconstruction and Taylor separation. |
| `localized-scalar-divisibility`, `local-integrality-detection` | Isolate integer denominator clearing and finite prime-exponent arithmetic; supply the away-localization map and p-adic unit/divisibility facts. |
| `kontsevich-matrix-example` | Separate the Kontsevich multiplication from the nonintegral perturbed inverse. |
| `odd-order-idempotent-example` | Separate membership/idempotency, normalized digits, the companion's Taylor collection and its digits. |
| `finite-domain-module-embedding`, `finite-domain-separation-transfer` | Explain the fraction-field embedding and common denominator proof without a Noetherian assumption; state accurately the implicit input repaired in Habiro's proof. |

Finite injectivity is proved from the graded maps and a finite filtration; it
is not deduced from global injectivity. For the image criterion, a solution at
each precision is unique, so the transition square gives compatibility. The
cofinal factorial completion reconstructs the element, and weighted Taylor
separation identifies its image. For finite domain extensions, a basis of the
finite fraction-field span and a common denominator embed B into R^r;
coordinatewise separation then transfers from R to B. These arguments supply
the non-routine steps previously bundled into theorem sketches.

The 23 added nodes are:

| Purpose | Added identifiers |
| --- | --- |
| Factorial filtration | `factorial-digit-kernel`, `factorial-filtration-antitone`, `factorial-filtration-separated`, `factorial-finite-quotient` |
| Taylor filtration and finite coordinates | `taylor-filtration-antitone`, `taylor-filtration-separated`, `finite-jet-basis`, `finite-precision-rank`, `taylor-finite-reconstruction`, `taylor-comparison-filtered` |
| Rational finite maps | `simultaneous-remainders-rational`, `graded-taylor-rational`, `finite-taylor-rational` |
| Matrix and image prerequisites | `taylor-matrix-digits`, `taylor-matrix-triangular`, `finite-taylor-determinant-positive`, `signed-adjugate-left`, `compatible-finite-preimages` |
| Localization arithmetic | `localized-integer-divisibility` |
| Separate example declarations | `kontsevich-perturbation`, `odd-projector-digits`, `companion-projector`, `companion-projector-digits` |

## Pinned baseline

Every baseline statement was read with its namespace and typeclass context at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti was inspected at
`f790474821cf4256814db967cb154e7af3d0c369`. All 32 original citations are valid
and retained. These comprise the four AdjoinRoot declarations; cyclotomic
monicity, degree and product; Hasse derivatives and their coefficient formula;
resultant product and Sylvester matrix; totient sum; block determinant and
both adjugate identities; adic Hausdorffness; finite-module generators and
finite basis; fraction-field injectivity, vector-space basis and finite span;
common localization denominators; four p-adic integer/rational facts and
`padicValRat.defn`; natural prime factorization; the primitive-root product;
the rational cyclotomic minimal polynomial and `minpoly.dvd_iff`.

The following nine exact references were added. Their full statements and
uses are recorded in `baseline.declarations`.

| Declaration | Mathlib module | Needed input |
| --- | --- | --- |
| `IsFractionRing.lift` | `RingTheory/Localization/FractionRing.lean` | Extend the injective map R→Frac(B) to Frac(R). |
| `IsLocalization.Away.surj` | `RingTheory/Localization/Away/Basic.lean` | Express an element with a power denominator. |
| `IsLocalization.Away.exists_of_eq` | same | Clear an equality by a power of the inverted element. |
| `IsLocalization.Away.lift` | same | Construct the coefficient map into Z_p when Delta is a unit. |
| `PadicInt.isUnit_iff` | `NumberTheory/Padics/PadicIntegers.lean` | The unit criterion for that map. |
| `PadicInt.pow_p_dvd_int_iff` | same | Integer p-power divisibility agrees with divisibility in Z_p, including zero. |
| `Complex.isPrimitiveRoot_exp` | `RingTheory/RootsOfUnity/Complex.lean` | A primitive positive-order root in a characteristic-zero field. |
| `Polynomial.cyclotomic.isCoprime_rat` | `RingTheory/Polynomial/Cyclotomic/Roots.lean` | Coprimality of distinct rational cyclotomic factors. |
| `Ideal.quotientMulEquivQuotientProd` | `RingTheory/Ideal/Quotient/Operations.lean` | Finite rational CRT, iterated over factors. |

The block determinant citation's `provides` field now states its orientation:
`BlockTriangular` zeros M(i,j) when b(j)<b(i), so lower weight-triangular
matrices use the dual order. This is a convention correction, not a removed
citation. Rational finite CRT replaces an unnecessarily indirect appeal to
the infinite rational product as a direct proof input.

## Source issues, tests and checks

All five source issues received independent `confirmed` verdicts and reasons:

| Issue | Independent check |
| --- | --- |
| E19 | At the precision in (301)–(306), (313) must stop at n<N. M_3 has determinant 4; the printed product through n=3 gives 216. The displayed table is shifted by one. |
| E20 | The uncompleted infinite tensor-product assertions on p. 61 fail. In H_Q the odd-order idempotent contradicts domain localization H_Z⊗Q; arbitrary rational Taylor coefficients need not have a common denominator in P_Z⊗Q. Finite base change and completed reconstruction remain valid. |
| E21 | In (317) the quotient denominator must be the filtration ideal P_(R,N), not the finite quotient P_R^N. |
| E22 | In (323), a u^k coefficient is gamma_(1,k+1,0), not gamma_(1,k,0); k=0 already exposes the error. |
| E23 | (299) requires R coefficients for arbitrary R; filtration ideals decrease with N; the digit range is 0≤k<n. Infinite coordinates describe a topological expansion, not a Hamel basis. |

The arXiv version history, EMS publication page and available author pages
were checked for public corrections. No correction addressing these five
findings was found in those searches as of 2026-10-05. This is a report of the
search, not a claim that no correction exists anywhere.

Each of the eight definitions/constructions has at least three tests, with
computation, degenerate, compatibility or non-example cases as appropriate.
The completed-element factorial test was strengthened beyond its polynomial
specialization. The existing numerical matrices, root sign, empty precision,
split coefficient algebra and nonsurjectivity examples are retained. The
six planets identify the comparison, leading factor, joint injectivity,
matrix, determinant and image criterion.

Independent standard-library integer/rational arithmetic constructed matrix
entries by expanding q^k P_(n−1) at q=z(1−u), extracting u^(l−1), reducing
modulo Phi_m(z), then extracting z^j. Columns are ordered by n then k; rows
by ml, decreasing m within a weight, then j. Direct determinants and the
graded recurrence agree for every N=1,…,8. The first six absolute determinants
are 1, 1, 4, 216, 1327104, 99532800000. Direct simultaneous remainder
determinants agree with the prime-power resultant formula
D_2(1,…,8)=1,2,3,8,5,72,7,128. The M_3 signed adjugate, Kontsevich vector,
perturbed rational inverse, and odd/companion digit lists all reproduce the
packet. Two-factor remainder versus Sylvester determinants were also checked
for distinct factors, repeated factors, a shared factor and unit/empty cases.

Validation completed:

- `scripts/check_blueprint.py`: zero errors and zero warnings.
- `scripts/check_errata.py` on the five source issues in an errata-v1 wrapper:
  passed.
- `lean-check` on the suggested file at the pinned shared build: exit 0,
  118 warnings, all declarations using `sorry`. Only a node-identification
  comment was added after this final elaboration. No library build or
  language server was started.
- Correspondence: all 59 nodes, 42 API items and 25 test names appear in the
  suggested file, accounting for namespace-qualified declarations.
- Dependency traversal through the supplier packets: 90 reachable nodes,
  no cycle or unresolved HC node identifier; all 59 review entries correspond
  exactly to the packet nodes.
- `git diff --check` and the intake file checker: passed.

## Assembly notes for the orchestrator

1. The issue does not authorize the part's reader document as a deliverable.
   Its mathematical conventions remain valid; this report supplements its
   original 36-node catalogue and old counts with the 59-node refinement and
   41 baseline references. Assembly should update that catalogue and counts
   from the reviewed packet, including the specified finite bases and the
   explicit interpretation of universal coefficient algebras.
2. Add the two finite-domain lemmas to the inherited rootwise Taylor proof
   and resolve the parent's corresponding non-Noetherian transfer gap at
   assembly. Preserve the honest boundary around the broader individual-root
   Theorem 6.2; its proof is not supplied by this part.
3. Apply the existing rescope and display split proposals: HC.4a has fifteen
   parent declarations plus two transfer lemmas and five parent planets;
   HC.4b has 57 declarations from this part and six planets. Counts were
   corrected in the packet proposal. Preserve declaration identifiers as
   aliases, and route HB.6's finite-matrix use to HC.4b. The maintainer owns
   the atlas restructuring; workers have not promoted anything.

No further mathematical work remains for this review's chosen scope.
