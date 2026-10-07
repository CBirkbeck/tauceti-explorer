# REV-KTheoryFiniteLocalFields~2

**Accepted.** Completed independent target-level review for issue #7068 by Codex, session `codex-Xj2W99`, on 7 October 2026. This is a completed review, not a checkpoint. This reviewer did not write the plan or its revision. The previous review’s reader reconciliation blocker is resolved: this issue authorizes correcting the reader, and the packet, reader and suggested comments now agree. Acceptance does not certify formalization, supplier proof completion or Lean elaboration.

The packet records `independent-review-REV-KTheoryFiniteLocalFields~2`, with a specific verdict for every node: **252 verified, 28 corrected, zero added, zero unverifiable**. All **102 baseline declarations** were independently read at the exact pins and confirmed for their uses. No baseline citation was removed or replaced. No unresolved mathematical contradiction remains in the reviewed deliverables. The prior review’s 65 corrections are retained; the changes below address additional scope, proof and citation defects without expanding the target-level node budget.

| Material checked | Count |
| --- | ---: |
| Nodes | 280 |
| Definitions / constructions | 13 / 13 |
| Theorems / lemmas / comparisons / applications | 117 / 113 / 21 / 3 |
| Local API entries | 209 |
| Object tests / all test entries | 117 / 122 |
| Planets | 42, six per stage |
| Pinned baseline declarations | 102 |
| Public source entries / historical version records | 25 / 31 |
| Distinct final node citation tuples | 529 |
| Supplier requests / structural proposals | 34 / 26 |
| Named gaps | 39 |
| Local source findings independently reviewed | 48 confirmed |
| Added / removed nodes | 0 / 0 |

Stage counts remain L.1 61, L.2 17, L.3 21, L.4 35, L.5 85, L.6 50 and L.7 11. All seven stages remain `planned`, none `closed`, and every node remains `implementationStatus: unchecked`. `status: complete` records a completed planning pass under PROTOCOL §0. The precise gaps and remaining lists preserve the distinction between target coverage and proof closure.

## Scope and evidence

Read the binding blueprint and expansion protocols, WORKERS, UPSTREAM_GUIDE, BROWSER_AGENTS, the full issue, the previous review and revision handoff, the campaign and reviewed library audit, and the nearby upstream AlgebraicTopology and RepresentationTheory/InductionRestriction roadmap documents. Checked every node’s statement, hypotheses, prerequisites, proof outline, acceptance and sources, including the routed finite-rank, Nikolaus–Scholze, hermitian and dyadic targets. Reviewed all local object APIs/tests, supplier contracts, structural proposals, source findings and suggested executable forms.

Independently fetched the 25 public PDFs and confirmed every current SHA-256 against the packet. Checked the cited passages and finding locators in those versions. Text extraction assisted navigation; formula OCR and best-match search were not treated as proof or page-location evidence. Inspected original page images for the Chern-class index E42, the level generator E47 and the degree typo E48. The reading scope is the cited passages and target-level proof checks, not a claim to have newly audited every proof in every paper. Historical source-version records and inherited broader reading scopes are retained as historical records.

All 102 baseline declarations were checked at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: name, full Lean statement, hypotheses, conventions and the use recorded by the packet. This includes the Grothendieck/representation-ring inputs, finite-field norm and Galois declarations, local-field/Teichmüller and completion maps, truncated Witt operations, Kähler differential maps, and the transcendence/cardinality inputs for uncountability. No higher-K, THH/TR/TC or generic log-Witt carrier was inferred from a nearby low-degree or Witt declaration. The reviewed library audit gives no reason to re-plan an existing declaration here.

## Every corrected node

- `KTheoryFiniteLocalFields:L.1/mod-m-products`: Added the direct positive-even-vanishing prerequisite for the finite-field use of Browder’s scholium; Quillen’s proof does not depend on this coefficient-product theorem.
- `KTheoryFiniteLocalFields:L.1/adams-psi-p-frobenius`: Corrected the representation-ring Frobenius exercise locator from PDF p.106 to p.109.
- `KTheoryFiniteLocalFields:L.1/algebraic-closure-mod-m-ring`: Made m≥2 explicit and supplied the prime-power/Chinese remainder product argument; the cited finite-field multiplication theorem alone covers prime powers.
- `KTheoryFiniteLocalFields:L.3/tame-unit-pair`: Replaced the uninformative excerpt “tame” by the actual formula in Sharifi Theorem9.3.8; checked the rec(second)/rec(first) argument-order dictionary and negative exponent.
- `KTheoryFiniteLocalFields:L.3/tame-uniformizer-unit`: Replaced the uninformative excerpt “tame” by the actual formula in Sharifi Theorem9.3.8; checked the rec(second)/rec(first) argument-order dictionary and negative exponent.
- `KTheoryFiniteLocalFields:L.3/tame-integer-coordinates`: Replaced the uninformative excerpt “tame” by the actual formula in Sharifi Theorem9.3.8; checked the rec(second)/rec(first) argument-order dictionary and negative exponent. Separated the p.197 theorem formula from the p.198 coordinate expansion in its locator.
- `KTheoryFiniteLocalFields:L.3/tame-component`: Replaced the uninformative excerpt “tame” by the actual formula in Sharifi Theorem9.3.8; checked the rec(second)/rec(first) argument-order dictionary and negative exponent.
- `KTheoryFiniteLocalFields:L.4/tr-homotopy-orbit-spectral-sequence`: Separated the all-prime spectral sequence/graded module from the odd-prime differential identities, retained the η correction at two, and supplied the Connes prerequisite and adjacent-level range.
- `KTheoryFiniteLocalFields:L.4/pi0-tr-is-witt-vectors`: Spelled out F_rΔ_r(a)=a^r; the source’s diagrammatic r is not additive multiplication by r.
- `KTheoryFiniteLocalFields:L.5/tame-base-change-of-log-differentials`: Replaced the unsupported reuse of tame uniformizer normalization in the wild case by reduction modulo the maximal ideal and Nakayama.
- `KTheoryFiniteLocalFields:L.5/tr-log-structure-maps`: Corrected the determinant proof and API to the self-weak-equivalence monoid M, rather than ordinary Aut_A(A), which excludes the uniformizer.
- `KTheoryFiniteLocalFields:L.5/log-thh-mod-p`: Restored the actual log differential graded ring excerpt; the packet’s acyclic proof staging remains explicitly distinguished from the source’s final theorem.
- `KTheoryFiniteLocalFields:L.5/tate-infinite-cycle-dlog`: Made the positive TR/Tate level and adjacent-map range explicit; no level-zero TR group or C₁ Tate comparison is intended.
- `KTheoryFiniteLocalFields:L.5/tate-infinite-cycles-v1`: Made the positive TR/Tate level and adjacent-map range explicit; no level-zero TR group or C₁ Tate comparison is intended.
- `KTheoryFiniteLocalFields:L.5/tate-spectral-sequence-unramified`: Made the positive TR/Tate level and adjacent-map range explicit; no level-zero TR group or C₁ Tate comparison is intended.
- `KTheoryFiniteLocalFields:L.5/tate-spectral-sequence-deeply-ramified`: Made the positive TR/Tate level and adjacent-map range explicit; no level-zero TR group or C₁ Tate comparison is intended.
- `KTheoryFiniteLocalFields:L.5/tate-spectral-sequence-e-r-terms`: Made the positive TR/Tate level and adjacent-map range explicit; no level-zero TR group or C₁ Tate comparison is intended.
- `KTheoryFiniteLocalFields:L.5/tate-spectral-sequence-differentials`: Made the positive TR/Tate level and adjacent-map range explicit; no level-zero TR group or C₁ Tate comparison is intended.
- `KTheoryFiniteLocalFields:L.5/tr-mod-p-dimension`: Made the positive TR/Tate level and adjacent-map range explicit; no level-zero TR group or C₁ Tate comparison is intended. Corrected the missing opening parenthesis in the standard-basis counting interval.
- `KTheoryFiniteLocalFields:L.5/bott-multiplication-standard-basis`: Made the positive TR/Tate level and adjacent-map range explicit; no level-zero TR group or C₁ Tate comparison is intended.
- `KTheoryFiniteLocalFields:L.5/image-of-log-de-rham-witt`: Made the positive TR/Tate level and adjacent-map range explicit; no level-zero TR group or C₁ Tate comparison is intended.
- `KTheoryFiniteLocalFields:L.5/log-de-rham-witt-tr-mod-p`: Made the positive TR/Tate level and adjacent-map range explicit; no level-zero TR group or C₁ Tate comparison is intended.
- `KTheoryFiniteLocalFields:L.5/tate-spectral-sequence-truncated`: Made the positive TR/Tate level and adjacent-map range explicit; no level-zero TR group or C₁ Tate comparison is intended.
- `KTheoryFiniteLocalFields:L.5/tr-of-smooth-fp-algebra`: Explicitly retained positive truncated-Witt/TR lengths and n≥2 for adjacent maps.
- `KTheoryFiniteLocalFields:L.6/milnor-k-of-local-fields`: Supplied the missing cofinal modulus hypothesis and full w₂ torsion bound in the n=3 coefficient-sequence argument, and separated equal-characteristic duality from the p-adic specialization.
- `KTheoryFiniteLocalFields:L.7/boundary-completion-compatibility`: Removed the hypothesis naming the incompatible K-book boundary; both displayed boundaries now explicitly use the established left-linear convention.
- `KTheoryFiniteLocalFields:L.7/unramified-chern-class-reduction`: Corrected the CGZ Lemma4.1 proof locator: the unramified-class paragraph is on arXiv-v3 printed/PDF p.22.
- `KTheoryFiniteLocalFields:L.7/semilocal-completed-map`: Corrected the semilocal localization subscript: p denotes the completion prime, while n=3 is the K-degree.

The finite-field positive-even-vanishing edge is acyclic: Quillen’s integral computation does not depend on the finite-coefficient product theorem. For composite moduli the prime-power products are combined componentwise by the natural coprime coefficient decomposition, rather than descended from a larger modulus. The tame formulas retain the left-linear boundary `∂{u,π}=ū` and the negative exponent for T.7’s rec(first) convention; Sharifi uses rec(second).

The wild log-differential argument keeps `π_K=uπ_L^e` instead of invoking a principal-unit root that exists only in the tame case. Modulo the maximal ideal both coefficients of its differential vanish when p divides e, giving the stated nonsurjectivity by Nakayama. The determinant input is the monoid of multiplication weak equivalences after inverting the uniformizer, so the uniformizer is included.

For Milnor K₃ the finite coefficient argument uses a cofinal family of moduli divisible by the full applicable w₂ torsion bound. Local duality makes the reduction on H² an isomorphism after the dual H⁰ invariants stabilize; naturality and the torsion bound kill the connecting map. The equal-characteristic input is requested from ClassFieldTheory and the characteristic-p step remains separate. The p-adic specialization is not asserted to cover every local field.

## Reader and suggested forms

Reconciled every reader node against the packet: statements, hypotheses, proof steps, acceptance, API/test statements, sources and direct prerequisite references. This also removes small inherited typographical differences. In particular, the reader preserves the previous corrections to the ordinary THH κ̃ range, noncanonical finite-cyclic identifications, torsion Tate twist μ(i), pro-level Bott comparisons, completion/continuity arguments, first-level Tate computation, local duality twists and density only in the closed ordinary-completion subgroup. Stage summaries and the suggested header now distinguish the odd-prime mixed-characteristic calculations from results valid at every prime and the separately stated hermitian/dyadic ranges. The structural proposal now also distinguishes the degree-three component from the completion prime in λ_{F,p}.

Updated the suggested file’s review reference, prime/index scope and self-weak-equivalence determinant comment. Added a concordance recording all 28 current node corrections. No executable Lean declaration or import changed during this review, as confirmed by comparing the files after removing nested comments. Unavailable spectrum/log-Witt carriers remain honestly commented with their suppliers. No fake carrier, implementation or new `sorry` theorem was introduced.

All 26 local definitions/constructions have at least three tests that detect plausible wrong definitions. The Connes nonzero-square test remains a fourth, explicit ηd-witness gap; η≠0 alone is not a witness. All 42 planets remain central definitions, constructions or named results; six per stage, with no planet renamed or added.

## Ownership and the assigned red-team findings

Read the full statements of the 60 distinct referenced blueprint supplier nodes and the relevant registered stage targets/contracts. Checked all 34 requests and 26 structural proposals for precise exports and ownership. The following four assigned findings are correctly represented in both packet and reader:

| Finding | Verified disposition |
| --- | --- |
| RT-AREA-ktheory-1/37 | InductionRestriction Layer6 owns integral virtual characters/Brauer lifting. RT.4 supplies Atiyah–Segal/topological K-theory; H.3 supplies the simple-space plus/Whitehead foundations. Unsupplied proofs remain named gaps. |
| RT-AREA-ktheory-1/39 | CR.4 owns universal log-Witt complexes/initiality over CR.5:log-algebra. L.5 imports the five generic specifications and owns its complete-DVR calculations. |
| RT-AREA-ktheory-2/21 | L.1’s finite-field K₃ coefficient calculation supplies K3BlochGroups V.5; V.5 is not duplicated. |
| RT-AREA-ktheory-2/33 | RT.2 owns the general genuine/Nikolaus–Scholze comparison. L.4 imports it and checks the bounded-below HM field/DVR scope. |

The early representation/coefficient Chern export remains an M-owned request. The whole M.8 regulator stage, downstream of M.7 and L.2, is not made a prerequisite of L.1. Generic log objects, Poincaré foundations, Moore products and finite-level continuity remain with their recorded suppliers. The packet’s 39 honest gaps are compatible with acceptance at target level; none is silently marked closed.

## Source findings and public versions

All 48 local findings have a new independent `confirmed` verdict naming this review, with a locator-specific reason; no finding was added, removed or rejected. Confirmation of a source proof gap does not assert that the result itself is false. Independently reproduced the GL₂(F₃) enumeration for E1: its lifted virtual character has norm 2 and zero inner product with both degree-one characters, excluding an actual two-dimensional representation. Checked the stable-GL restriction and field-coefficient homology repair, the norm-kernel Tate degree, and the HM/GH symbol/index corrections carried forward from the prior review.

Clarified E16’s binomial endpoint without asserting a factor count from an ambiguous ellipsis. Clarified E32: finite mod-p cohomology is indeed finitely generated over Z_p, so the finding is the missing Z_p-coefficient proof input/notation, not a false finite-generation statement. Rechecked E37 with Q₅, n=2, a=4, c=1: the left side is −3 and the chosen-root norm is −1; the product-of-root-norms repair still proves the symbol relation. The reader carries these corrected explanations and all 48 current reviewer labels.

Corrected two public PDF locators: K-book Exercise II.4.2(b) is PDF p.109, and the CGZ Lemma4.1 unramified-class paragraph is printed/PDF p.22. Distinguished the Sharifi theorem formula on p.197 from its coordinate expansion on p.198. Added the exact Hesselholt1996 Lemma1.5.1 circle-transfer citation for the η correction. Current source hashes, bibliographic identity and historical records otherwise remain unchanged. Existing novelty-search scopes are historical; this review makes no fresh or exhaustive novelty claim and no claim about unread publisher versions.

The public versions used for this review are below; the packet retains their editions, reading scopes and fingerprints.

| Source | Public text checked |
| --- | --- |
| `Kbook.2013` | [Public copy](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) |
| `Weibel.Handbook.I5` | [Public copy](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/KZsurvey-published.pdf) |
| `CMM.2018` | [Public copy](https://arxiv.org/pdf/1803.10897v2) |
| `Haine.2016` | [Public copy](https://math.berkeley.edu/~phaine/files/KFF.pdf) |
| `Mestel.2014` | [Public copy](https://www.cs.ox.ac.uk/people/david.mestel/essay.pdf) |
| `Kbook.errata` | [Public copy](https://web.archive.org/web/20191110143141id_/https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf) |
| `HesselholtMadsen.2003` | [Public copy](https://arxiv.org/pdf/math/9910186v2) |
| `Milne.CFT.2020` | [Public copy](https://www.jmilne.org/math/CourseNotes/CFT.pdf) |
| `Fesenko.GTM3.2000` | [Public copy](https://msp.org/gtm/2000/03/gtm-2000-03-006p.pdf) |
| `CGZ.BlochUnits.2021` | [Public copy](https://arxiv.org/pdf/1712.04887v3) |
| `HesselholtMadsen.1997a` | [Public copy](https://www.math.nagoya-u.ac.jp/~larsh/papers/004/paper.pdf) |
| `HesselholtMadsen.1997b` | [Public copy](https://www.math.nagoya-u.ac.jp/~larsh/papers/007/polytope.pdf) |
| `Hesselholt.2005` | [Public copy](https://www.math.nagoya-u.ac.jp/~larsh/papers/s01/handbook.pdf) |
| `Hesselholt.1996` | [Public copy](https://www.math.nagoya-u.ac.jp/~larsh/papers/005/acta.pdf) |
| `HesselholtMadsen.2004` | [Public copy](https://www.math.nagoya-u.ac.jp/~larsh/papers/013/final.pdf) |
| `GeisserHesselholt.2006` | [Public copy](https://www.math.nagoya-u.ac.jp/~larsh/papers/011/paper.pdf) |
| `NikolausScholze.2018` | [Public copy](https://arxiv.org/pdf/1707.01799v2) |
| `Sharifi.ANT.20260926` | [Public copy](https://math.ucla.edu/~sharifi/notes/algnum.pdf) |
| `NikolausScholze.2018.published` | [Public copy](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf) |
| `CalmesEtAl.2026.v4` | [Public copy](https://arxiv.org/pdf/2009.07225v4) |
| `AbdurrahmanVenkatesh.2025.v1` | [Public copy](https://arxiv.org/pdf/2303.13436v1) |
| `AtiyahSegal.1969` | [Public copy](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/atiyahsegal1.pdf) |
| `CalmesEtAl.II.20261005` | [Public copy](https://arxiv.org/pdf/2009.07224v5) |
| `Weibel.Chern2.1993.author` | [Public copy](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chernclass.pdf) |
| `AbdurrahmanVenkatesh.20261006.author` | [Public copy](https://www.math.ias.edu/~akshay/research/RT.pdf) |

## Validation and remaining orchestration

- `python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryFiniteLocalFields.json`: **0 errors, 0 warnings**, with all seven stages planned and no prerequisite cycle.
- The shared `source_issues.check_issues` and `check_errata.versions_checked` functions applied to this packet’s findings/version data: **0 errors**.
- Review coverage and reader concordance audit: all 280 IDs covered once; 252 verified and 28 corrected; every reader node agrees with the packet fields and dependencies; all 48 findings name the current reviewer; all 102 baseline records include the current independent pin check.
- Public fingerprint audit: **25/25 match**. The independent finite-group counterexample computation passed.
- Suggested executable-content comparison: unchanged by this review, with balanced nested comments.
- `research/blueprint/intake.py check-files` on all five deliverables: **5 files, 0 problems**.
- `git diff --check`: clean.
- `lean-check research/blueprint/suggested/KTheoryFiniteLocalFields.lean`: **did not compile**. The attempt stopped before elaboration because `TauCeti/CategoryTheory/GrothendieckGroup/Abelian.olean` is missing. Memory was sufficient (98 GB available). Shared Mathlib is at the required pin, but the shared Tau Ceti checkout is `cf386627e9176a3827c1a5fe804989fd94a4d216`, not the required pin. Exact pinned declaration reading was possible from existing git objects. The attempt preceded this review’s comment edits, checked no declarations and does not certify the final file. No build, cache retrieval, dependency update or language server was started.

There is no remaining reader reconciliation blocker. Questions for the orchestrator concern existing named supplier contracts, not further work required to finish this review:

1. Register the early M-owned coefficient/representation Chern export before the downstream regulator stage, without introducing the whole-stage cycle.
2. Assign and deliver the finite-level Popescu/continuity and Geisser–Levine proof inputs before attempting the two characteristic-p inverse-limit arguments.
3. Deliver the Cohen/Witt coefficient embedding and the genuine completed profinite Adams operation contracts.
4. Resolve the characteristic-two ηd witness with an explicit nonzero-square example before treating that non-example as established.
5. Provide existing import artifacts at both exact pins before accepting any elaboration claim for the suggested forms.

No atlas promotion, supplier-file edit, issue closure, label change or merge was performed by this worker.
