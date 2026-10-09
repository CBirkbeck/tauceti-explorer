# Independent review: Arithmetic Galois representations, revision 3

Verdict: **accepted**, as a complete budgeted planning pass with all seven stages **partial**. Reviewer: Codex, session `codex-I3a2ds`, job `REV-ArithmeticGaloisRepresentations~3`, issue #7487. Date: 9 October 2026. This session wrote none of the three blueprint inputs. The packet records `independent-review-REV-ArithmeticGaloisRepresentations~3` and a separate verdict for every final node.

The mathematical assertions retained in the plan are justified by the cited statements, explicit corrections or clearly recorded conditional proof tasks. Acceptance does not certify implementation or stage closure. Every implementation status remains `unchecked`. The existing declaration-splitting worklists remain precise follow-up tasks under PROTOCOL §0; the review does not turn their honest incompleteness into a rejection.

## Counts and scope

| Item | Input | Reviewed result |
|---|---:|---:|
| Nodes | 300 | 327 |
| Definitions / constructions | 30 / 28 | 30 / 28 |
| Lemmas / theorems | 84 / 145 | 84 / 172 |
| Comparisons / applications | 9 / 4 | 9 / 4 |
| API items / unit tests | 540 / 287 | 540 / 287 |
| Planets | 40 | 40 |
| Baseline declarations | 420 | 420 |
| Primary source records | 53 | 53 |
| Source-version records | 55 | 56 |
| Source findings | 47 | 52 |
| Gaps / requests | 37 / 61 | 38 / 61 |
| Restructuring records / upstream notes | 8 / 6 | 8 / 7 |

Per-node verdicts: **253 verified, 47 corrected, 27 added, zero unverifiable**. The additions split existing residual-image assertions and introduce no new targets. All retained node IDs survive.

| Stage | Final nodes | Remaining entries | Coverage |
|---|---:|---:|---|
| G7 | 77 | 63 | partial |
| R01.1 | 59 | 17 | partial |
| R01.2 | 27 | 31 | partial |
| R01.3 | 62 | 29 | partial |
| R01.4 | 31 | 19 | partial |
| R01.5 | 53 | 14 | partial |
| R01.6 | 18 | 27 | partial |

The direct prerequisite graph remains acyclic. Its edges comprise 753 baseline references, 1,086 own-node references, 149 stage references and 29 other-blueprint node references. I read every request, gap, restructuring record, upstream note, scoped-stage description and referenced supplier statement. The seven reviewed library audits and the upstream arithmetic/elliptic ownership boundaries were also checked.

## Previous review and red-team requirements

Both blocking findings in `REV-ArithmeticGaloisRepresentations~2` are resolved in the input revision. The generic canonical nilpotent monodromy filtration, including its primitive and tensor/dual theory, is no longer constructed in Arithmetic. RS-17 O20 assigns it to `LefschetzPencilsAndVanishingCycles:LPV.1`. Arithmetic retains the Weil–Deligne stability and arithmetic rank-sum applications. The supplier request is explicitly for an independent pure linear-algebra export; the present LPV geometric logarithm is not silently installed as a reverse dependency. Its absence remains an honest supplier task.

The 92 API entries and 51 tests missing in the earlier prototype review now have typed counterparts. I checked their mathematical meaning, rather than only searching for names. The geometry is stated on the pinned Tau Ceti abelian-variety carrier with explicit requested dual, polarization and finite-pairing data. These interfaces do not assert that unavailable supplier constructions are implemented. All 540 API items and 287 tests were compared with their prototypes; each of the 58 definitions/constructions retains at least three discriminating tests. The 40 planets remain mathematical definitions, central constructions or named theorems.

`RT-AREA-langlands-1/6` is reflected in the Ogg–Saito boundary: geometric components are those of the minimal proper regular model, wild conductor terms at two and three are retained, and the mixed-characteristic comparison is a named gap. `RT-AREA-langlands-1/17` is reflected in the Brauer–Nesbitt dependency order: the classical proof precedes determinant reconstruction. The determinant supplier does not prove its own prerequisite here.

## Baseline verification

I read all 420 declaration statements, including their ambient variables and instances, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every declaration exists under the cited name and module. I also compared each statement with every citing node, including Frobenius conventions, finite/free/projective hypotheses, topological assumptions and the limits of the library result. Each `baseline.declarations[].checked` now records this independent statement-and-adequacy check.

**No baseline citation was removed, replaced or added.** In particular, the existing algebraic induction, Mackey, exterior-power, projective base-change, tensor-power and geometric carriers are imported. The jointly continuous representation carrier is justified separately from Mathlib's operatorwise `ContRepresentation`; stronger arithmetic or geometric results remain requested or conditional.

## Mathematical and prototype corrections

The following clear corrections were applied in place and synchronized with the reader.

- R01.4's prime-to-characteristic PGL₂ classification includes the trivial group: the cyclic-subgroup enumeration has `r=0`, `Ω=1`. Its suggested theorem already permitted that case; the statement and proof now do too.
- R01.4's bad-dihedral proof no longer calls the Dieulefait–Pacetti normal-abelian-subgroup argument correct. The existing eigenline/cyclic-quotient proof preserves the conclusion; source finding E793 explains the failed step.
- R01.6's CM example asserts one-dimensional Galois eigenspace characters. Identifying them with algebraic Hecke characters requires the separate `ComplexMultiplicationAndExplicitReciprocity:CM.4` theorem.
- G7's Hodge–Tate projective lifting proof distinguishes de Rham descent from ramification. Unramifiedness almost everywhere descends along a finite global extension by excluding its finitely many ramified places. Unramifiedness at a single local place does not descend across a ramified extension.
- The characteristic-three disjointness assumption for the SL₂ wreath argument uses the kernel fields of the restricted projective representations over `K(ζ₃)`. General coefficient fields do not justify asserting that the unrestricted kernel fields contain `K(ζ₃)`. The field-automorphism graph case is excluded by the characteristic-three assumption; in that case the remaining characteristic is at least five and the field size at least 25. Its exact image/coset proof remains the existing gap.
- In the GSp₄ example, the cyclotomic adjoint image contains the normal perfect group `PSp₄(F_p)` with prime-to-p quotient; equality with that group is unnecessary and need not hold.
- The Zariski image-closedness API takes a subgroup of algebraic-group points. The assertion is false for arbitrary subsets. The set-level vanishing-ideal test remains valid. Openness of the identity-component preimage uses finitely many closed cosets and Hausdorff coefficient topology; it does not need compactness of the source group.
- The lifted fundamental character includes an explicit reduction embedding into `F_{p^n}` and `n>0`. A canonical identification of Witt vectors with an unramified extension's integers is not silently assumed.
- The Weil–Deligne prototypes require a topological group and an open degree kernel where smoothness or conversion needs them. The carrier alone is not strengthened by an irrelevant open-kernel assumption. In particular, the elaborated type of `special` retains the open-kernel instance. Induction uses an open subgroup embedding, positive degree/index data and compatible degree and residue-cardinality maps; its local-factor and ℓ-adic comparison signatures use the same data.
- Continuous tensor induction and Asai operations require open finite-index subgroups. Ring operations used to build continuous representations require topological coefficient rings; abstract continuous-conductor signatures use Hausdorff coefficient fields. These assumptions hold in the arithmetic coefficient tiers already stated. Pure algebraic induction in the CHT group is not burdened with a topological condition.
- Wild-character lifting now has a separate closure gap for prime-to-characteristic character lifting, automorphism compatibility and preservation of all subgroup-invariant dimensions. Maschke and averaging do not supply this lifting theorem. Brumer–Kramer Lemma 2.7, printed p.230 (PDF p.5), motivates the use; the source conclusion is not alleged false.
- Split Taylor–Wiles scalar witnesses retain the determinant/multiplier and cyclotomic-surjectivity assumptions used in their proofs. The cyclic-induced and solvable-induced statements now repeat their own number-field, prime, induction and absolute-irreducibility hypotheses, rather than referring to a discarded local clause.

The added PadicHodgeTheory upstream note concerns only a supplier's stronger normal form: over a general p-adic field, rank-one labelled Hodge–Tate weights need not be equal. The consumer needs Hodge–Tate implies de Rham and zero Sen operator implies finite inertia. Those narrower statements are sufficient; no supplier file was edited.

This table records every changed retained node and its packet fields. Changes to the associated suggested signatures are described above; source-version metadata, coverage wording, the source-verdict register and baseline check metadata are recorded elsewhere in this report.

| Retained node slug | Changed fields |
|---|---|
| `continuous-representation` | `hypotheses` |
| `restriction-dual-tensor-twist` | `hypotheses` |
| `tame-inertia-and-fundamental-characters` | `api`, `hypotheses` |
| `weil-deligne-representation` | `hypotheses` |
| `grothendieck-monodromy-and-the-weil-deligne-functor` | `hypotheses` |
| `frobenius-semisimplification` | `hypotheses` |
| `local-factor-of-induced-representation` | `hypotheses` |
| `purity-of-weil-deligne-representations` | `hypotheses` |
| `local-epsilon-factor` | `hypotheses` |
| `breaks-and-swan-conductor` | `hypotheses` |
| `artin-conductor-with-its-wild-part` | `hypotheses` |
| `wild-character-lift` | `proofSteps` |
| `conductor-of-a-weil-deligne-representation` | `hypotheses` |
| `swan-additive` | `hypotheses` |
| `additivity-twist-and-unramified-invariance` | `hypotheses` |
| `conductor-dual` | `hypotheses` |
| `conductor-twist-unramified-tame` | `hypotheses` |
| `conductor-twist-dominant-character` | `hypotheses` |
| `conductor-unramified-base-change` | `hypotheses` |
| `conductor-tame-base-change` | `hypotheses` |
| `conductor-extend-scalars` | `hypotheses` |
| `induction-formula-for-conductors` | `hypotheses` |
| `quadratic-induction-conductor` | `hypotheses` |
| `local-induction-formula` | `hypotheses` |
| `swan-conductor-of-reduction` | `hypotheses` |
| `reduction-does-not-increase-the-conductor` | `hypotheses` |
| `conductor-of-residual-semisimplification` | `hypotheses` |
| `finite-subgroups-of-pgl2-of-order-prime-to-the-characteristic` | `proofSteps`, `statement` |
| `bad-dihedral-representations-and-the-oddness-criterion` | `proofSteps` |
| `required-examples` | `hypotheses`, `statement` |
| `symmetric-and-exterior-powers` | `hypotheses` |
| `tensor-induction` | `hypotheses` |
| `restriction-of-scalars` | `hypotheses` |
| `adjoint-representations` | `hypotheses` |
| `polarized-representation` | `hypotheses` |
| `operations-on-polarized-representations` | `hypotheses` |
| `zariski-closure-and-monodromy-groups` | `api`, `proofSteps` |
| `lifting-projective-representations-hodge-tate` | `proofSteps` |
| `adequacy-criteria` | `acceptance`, `hypotheses`, `prerequisites`, `proofSteps`, `sources`, `statement`, `title` |
| `enormous-image-and-its-coefficient-extension-invariance` | `acceptance` |
| `enormous-symmetric-powers` | `acceptance`, `hypotheses`, `prerequisites`, `proofSteps`, `sources`, `statement`, `title` |
| `adequacy-of-symmetric-powers` | `prerequisites`, `proofSteps` |
| `vast-tidy-and-enormous-gsp4-subgroups` | `acceptance` |
| `gsp4-big-image-verification` | `acceptance`, `hypotheses`, `prerequisites`, `proofSteps`, `sources`, `statement`, `title` |
| `cg20-big-image-assumption` | `tests` |
| `cg20-big-image-examples` | `hypotheses`, `prerequisites`, `proofSteps` |
| `taylor-wiles-image-lemmas` | `acceptance`, `hypotheses`, `prerequisites`, `proofSteps`, `sources`, `statement`, `title` |

## Declaration-sized additions

Four bundles become 31 nodes, retaining each original ID on its first assertion and marking the other 27 `addedBy: REV-ArithmeticGaloisRepresentations~3`:

| Original bundle | Resulting nodes | Sources |
|---|---:|---|
| `adequacy-criteria` | 7 | GHTT Theorem 9 and corollary, appendix running pp.60–74; BLGG13 Appendix A, pp.29–35; GHT17 Remark 6.1 and Corollaries 9.4–9.5, pp.28,50–51 |
| `enormous-symmetric-powers` | 4 | Allen et al. Lemmas 7.1.4 and 7.1.6, printed pp.1089–1090; Gee–Newton Lemma 3.2.4, arXiv v5 p.15 |
| `gsp4-big-image-verification` | 12 | BCGP21 Lemmas 7.5.9, 7.5.12–7.5.22 and Remark 7.5.23, arXiv v3 pp.200–205 |
| `taylor-wiles-image-lemmas` | 8 | BCGNT25 Lemmas 5.2.3–5.2.6, arXiv v3 pp.52–55; Allen et al. Lemma 7.1.6(1), printed p.1090 |

The induced-adjoint decompositions are one simultaneous calculation of the same representation decomposition. The independent image, adequacy and scalar-witness results receive separate nodes. Consumer dependencies, acceptance examples, source matches and the precise gap owners were updated to the exported assertions. Remaining carrier and proof splits are retained in the partial-stage worklists.

Exact added IDs, all in `ArithmeticGaloisRepresentations:G7`:

- `adequacy-of-prime-to-p-groups`.
- `adequacy-of-prime-to-p-normal-overgroups`.
- `ght-adequacy-of-sylow-containing-overgroups`.
- `adequacy-of-tensor-products`.
- `adequacy-of-rank-two-groups`.
- `ght-adequacy-of-sl2-representations`.
- `enormous-symmetric-powers-of-sl2-overgroups`.
- `enormous-symmetric-powers-after-global-base-change`.
- `enormous-standard-sl-overgroups`.
- `gsp4-tidiness-from-the-centre`.
- `gsp4-tidiness-from-equal-determinant-blocks`.
- `gsp4-adequacy-in-characteristic-at-least-eleven`.
- `gsp4-standard-image-enormity-and-tidiness`.
- `gsp4-induced-adjoint-decomposition`.
- `gsp4-e3-from-an-element-outside-the-index-two-subgroup`.
- `gsp4-sl2-wreath-enormity`.
- `gsp4-induced-mod-five-vastness`.
- `gsp4-characteristic-three-subgroup-enumeration`.
- `gsp4-sl2-wreath-vastness-and-tidiness`.
- `gsp4-quaternion-wreath-enormity`.
- `taylor-wiles-unitary-tensor-adequacy`.
- `taylor-wiles-unitary-tensor-multiplier`.
- `taylor-wiles-unitary-tensor-scalar-witness`.
- `cyclic-induced-frobenius-eigenvalues`.
- `taylor-wiles-solvable-induced-tensor-adequacy`.
- `taylor-wiles-solvable-induced-tensor-scalar-witness`.
- `taylor-wiles-symmetric-power-scalar-witness`.

## Source review and additional findings

I retrieved and verified the recorded hashes of all 53 primary public source files, and read every cited source-match passage. Scanned or unreliable text was checked on page images. I additionally compared the published Qian paper, the Allen et al. preprint numberings, the CHT author version and the published Dieulefait–Pacetti PDF where the source findings required them. The source-version register distinguishes actual reading from availability checks. There is no passage or section-by-section source summary in these deliverables.

All 47 inherited source findings have fresh independent verdicts and reasons: 43 confirmed and four rejected. E351 confuses Brumer–Kramer's direct-sum additivity with exact-sequence additivity; the latter is asserted separately only for Swan conductor. E401 asks for an unnecessary hypothesis, since extending an irreducible representation over the perfect finite field preserves semisimplicity. E752's proposed quantifier objection fails: in a supposed counterexample, absence of fixed vectors holds for every regular semisimple element and survives conjugation, sums and quotients. E769 is resolved by the Allen et al. v1/v2 theorem numbering used by Qian. The records remain for provenance. E301 confirms Ulmer's accessible report, not an unread Tate original; E754 remains explicitly preprint-specific.

Five new findings give **48 confirmed, four rejected**:

| Finding | Locator and independently checked correction |
|---|---|
| E790 | [DDT, 2007 author text](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §1.1 equation (1.1.2), p.19: Frobenius power traces are not the coefficients of the Euler series. At the square of a good prime, the two expressions are `a_p²−2p` and `a_p²−p`. The good-reduction Euler polynomial planned here remains correct. |
| E791 | [Serre, local factors](https://www.numdam.org/item/SDPP_1969-1970__11_2_A4_0/), §2.1, printed 19-05 (PDF p.6): the increasing filtration uses successive quotients `V_{n+1}/V_n`; the displayed quotient has its order reversed. |
| E792 | [Chenevier, determinants, arXiv v2](https://arxiv.org/pdf/0809.0415v2), after Lemma 1.9, p.11: the cubic trace identity must contain both three-cycle orderings; one is repeated. For `E11,E12,E21` in `M₂`, the two traces are one and zero, so the repeated term gives a nonzero erroneous identity. |
| E793 | [Dieulefait–Pacetti, published PDF](https://link.springer.com/content/pdf/10.1007/s13398-023-01478-8.pdf), Lemma 1.13 proof, p.8, also [arXiv v2](https://arxiv.org/pdf/2108.07577v2): a normal abelian subgroup outside a Cartan can be normalized by nonscalar diagonal elements. With `a=diag(1,−1)`, `b` the swap matrix and `G=⟨a,b⟩`, the subgroup `⟨−I,b⟩` is normal abelian and `aba⁻¹=−b`. The conclusion is preserved by the packet's eigenline proof. |
| E794 | [Milne, Abelian Varieties v2.00](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter I Proposition 13.2(b), printed p.58 (PDF p.64): the pullback polarization is `α∨λα`, replacing an unrelated final symbol. This is already in the [author's errata](https://www.jmilne.org/math/CourseNotes/errata.html), credited to Everett Howe. |

The E790 curve check uses `y²+y=x³−x` over `F₅`, which has eight points including infinity: `a₅=−2`, Euler coefficient at 25 is −1 and the Frobenius-square trace is −6. These explicit checks are independent of the source's proof.

The published Dieulefait–Pacetti file has SHA-256 `2a133808911a1819ea9480bea0bfc18846035f961e866ddec4d05d69b093e0f8`. It confirms that E793 is present in the publication as well as the preprint. The original sources for the inaccessible Tate, Livné, Ogg and Saito results remain unread; accessible reports and exact gaps identify what was established. No restricted library copy was used.

## Independent finite-group check

I recomputed the small rank-two adjoint cohomology examples using actual group matrices, independently of a presentation or the previous reviewer. In the basis `diag(1,−1),E12,E21`, compute the conjugation action, optionally multiply by `det^j`, and traverse the Cayley graph from the identity. Assign three unknown cocycle coordinates to each generator. A first path defines each vertex's cocycle as a linear expression. Every later generator edge imposes `c(gs)=c(g)+g·c(s)`. Gaussian elimination over the coefficient field computes `dim Z¹`; the rank of stacked generator matrices `g−1` computes `dim B¹`. The traversal's group orders are checked against the known SL₂/GL₂ orders. For `F₉`, use `F₃[u]/(u²+1)` and both root-subgroup generators for each field-basis element.

| Group | Twist | Order | dim Z¹ | dim B¹ | dim H¹ |
|---|---:|---:|---:|---:|---:|
| SL2(F_5) | 0 | 120 | 4 | 3 | 1 |
| GL2(F_5) | 0 | 480 | 3 | 3 | 0 |
| GL2(F_5) | 1 | 480 | 3 | 3 | 0 |
| GL2(F_5) | 2 | 480 | 4 | 3 | 1 |
| GL2(F_5) | 3 | 480 | 3 | 3 | 0 |
| SL2(F_9) | 0 | 720 | 3 | 3 | 0 |
| SL2(F_3) | 0 | 24 | 3 | 3 | 0 |
| SL2(F_7) | 0 | 336 | 3 | 3 | 0 |
| SL2(F_11) | 0 | 1320 | 3 | 3 | 0 |
| SL2(F_13) | 0 | 2184 | 3 | 3 | 0 |

This distinguishes the exceptional SL₂(F₅) module from the adequate untwisted GL₂(F₅) module and checks that the determinant-square twist preserves the exceptional class. It supports E754–E755 and the corrected rank-two criterion. It is a finite computational consistency check, not a formal certificate or a proof for all fields. I did not rerun the former reviewer's Sp₄ subgroup enumeration; its certificates and general cohomology inputs remain explicit gaps.

## Validation and limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticGaloisRepresentations.json`: **zero errors, zero warnings**.
- Source-issue schema and source-version checks: all 52 findings and 56 records pass. Every source finding names this independent review; the 327 review entries cover exactly the 327 node IDs.
- Reader synchronization: every statement, hypothesis, proof step, prerequisite, acceptance case, API name/statement and test name/statement in the packet appears in the reader. Its counts, partial coverage, source register, requests, gaps and review verdict are current.
- All API/test names have typed counterparts in the suggested file, with manual checking of the mathematical correspondence; all implementation statuses remain unchecked. The full reader, packet and suggested file contain no source excerpts.
- `lean-check` of the full suggested file stops at the unavailable object file for `TauCeti.AlgebraicGeometry.AbelianVariety.Hom.BaseChange`. The existing shared build has the pinned Mathlib, but does not supply the geometric Tau Ceti build at the required pin. No library build, update, cache fetch or language server was started.
- As a limited elaboration check, I temporarily excluded the four Tau Ceti imports and the final geometric Tate-module section in the suggested file under review, ran `lean-check`, and restored the whole file. The final Mathlib-only prefix elaborated successfully with **938 sorry warnings and no other warnings**. Inspection of the elaborated `special` type confirmed its open-kernel instance. The geometric section is inspected against pinned sources but has not elaborated in this environment. This check is not reported as full-file compilation.
- `git diff --check`: clean. Only the named deliverables and this job's handoff are changed.

## Follow-up for the orchestrator

There is no unresolved contradiction or blocking question for this review. Preserve the seven partial-stage worklists, 38 gaps and 61 requests for later jobs. The ownership decisions that need orchestration are the standalone LPV pure-monodromy export and the mixed-characteristic curve-cohomology/discriminant supplier for Ogg–Saito; both are precisely recorded in the packet. The PadicHodgeTheory stronger rank-one normal form is an upstream note for its maintainer. A subsequent worker with the pinned geometric Tau Ceti build should elaborate the full suggested file before claiming geometric compilation. No roadmap promotion or upstream edit is performed by this review.
