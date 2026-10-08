# Independent review of Relative Fargues–Fontaine RF4, revision 2

**Job:** `REV-RelativeFarguesFontaine--RF4~2`, issue #7088. **Reviewer:** Codex, session `codex-ZPo7ok`. **Date:** 2026-10-08. **Verdict:** accepted as a complete target-level planning pass. The reviewer did neither planning job.

The packet has 23 nodes: four definitions, two constructions, sixteen theorems and one comparison. This review verifies fifteen nodes and corrects eight. It adds no mathematical nodes and removes no baseline citations. All 37 baseline declarations were checked by reading their actual statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. There remain 67 API items, 25 mathematical tests, seven planets, five supplier requests and six explicit gaps. All three stages are **planned**, with precise remaining lists; none is closed, and every implementation remains unchecked.

This meets PROTOCOL sections 0 and 2: every target has a node whose prerequisites end at a baseline, an exact external node, a requested supplier stage or a named gap. Acceptance does not discharge the arbitrary analytic/formal comparison or the other five gaps. Source statements, hypotheses and proof routes were read independently; the suggested file and reader were reviewed as deliverables.

## The seven requirements of the earlier review

| Earlier requirement | Revision and independent result |
| --- | --- |
| Native algebra API, morphisms, adjunction, tensor/base change and twisted ℤ test | The revision supplied genuine module carriers, compatible triples, functor laws, adjunction naturality, scalar-change and the actual sections `(k,k/3)`. This review completes ten missing signatures: all KL1.3.8–1.3.9 clauses, algebra-map descent, general Beauville–Laszlo unit/counit/full faithfulness, and generic effective tensor/dual compatibility. Three pure algebra theorem inventories no longer invoke nonexistent geometric obstructions. |
| Full arbitrary-complement target, distinct from fixed-reference modifications | A new revision node explicitly realizes the full target. Its R3 request specifies compatible analytic/formal punctures, module models, morphisms and refinements, and requires a proof or justified scope correction. This is an honest conditional target and gap, rather than an assertion that every analytic punctured bundle is an algebraic localization. The fixed-reference theorem still uses a cover around D. |
| Acyclic BG0 supplier and correct dictionaries | The current BG0 node has no RF4 prerequisite. Its reductive E/sousperfectoid scope was read, and the missing scheme, smooth integral and broader representation contracts are precise requests to BG0. RF4 transfers patching and does not reconstruct torsor dictionaries. |
| VB4 no-leg and normalized one-leg recovery, with integral T | The existing VB4 node supplies SW12.3.4 only. SW12.3.5 and 12.4.1 are requested from VB4, with morphisms and normalized tail comparison. The varying pair retains the integral finite-free module T. HS2 is a consumer, not the recovery supplier. |
| Exact approximation input for local triviality | The proof gives the filtered pointed étale-neighbourhood ring R, regular t, I=R, henselianity, the smooth affine torsor, completed nonemptiness, and finite-presentation descent. GR5.4.21/5.4.22 are cited at the public v3 locators. The geometric completed-stalk comparison remains an exact RF2 gap; the general local-triviality claim remains reductive. |
| Whole punctured Witt locus and RF0 chart ownership | Kedlaya3.8 includes the crystalline end. The theorem uses the exact RF0 whole-locus and sheafiness nodes, whose A₁/A₁₂ and crystalline-end charts were read; it does not replace them by positive annuli. RF4 owns algebraicity; RF0 owns the charts and their proof gaps. |
| Reader reconciliation | The revision reader already reflected the changed scope. This review updates its acceptance provenance, every corrected mathematical sentence, native inventories and the independently checked source findings. |

These are resolved at the required planning standard. Requirements involving absent supplier mathematics remain explicit requests and gaps, as allowed for planned coverage; they are not described as proved.

## Corrections made in this review

1. Completed KL1.3.8 with a typed finite-datum difference-surjectivity statement, surjectivity of the second comparison and a finite set of sections generating both pieces. Added KL1.3.9(a) with finite presentation and both bijective comparisons, without the extra maximal-ideal hypothesis of part (b).
2. Added unique descent of compatible algebra maps between scalar extensions of finite étale algebras. Together with the existing object-effectivity signature this covers the equivalence on objects and morphisms.
3. Added Beauville–Laszlo unit bijectivity precisely for glueable modules, glueable sections and canonical bijective comparisons for arbitrary data, and fully faithful Can on all glueable modules. The arbitrary-module flatness and finite-projectivity criteria were checked against Stacks15.92.18–15.92.19; they do not require assuming glueability first.
4. Completed the datum API with the pure-tensor computation of Can on morphisms, flat-target full faithfulness, tensor comparison bijectivity and dual compatibility for arbitrary effective finite-projective data. These use actual module and tensor carriers, with KL1.3.9(b)'s exact hypotheses.
5. Corrected the period-ring completion proof: the quotients are of the ambient integral period ring by powers of ker θ. The untilt algebra A is not the ring containing this kernel.
6. Clarified field-case B-pair freeness: Bₑ is a PID, using its Dedekind property together with trivial Picard group. Trivial Picard group alone is insufficient over a general ring.
7. Added independently confirmed `RelativeFarguesFontaine/E15` for the slope normalization already used correctly in the packet. The relevant preprint line bundle has slope 1/a, rather than 1. Positivity and affine-complement conclusions are unchanged. This is the portion of the previously reviewed extraction finding `PAPER-KEDLAYA-LIU-15/E78` needed here, not a claim of first discovery.
8. Corrected SW17.1.8 to **Lemma** and added its exact pp.150–151 locator. Added confirmed source finding E16 for the name slip in the proof of SW19.5.3, p.180, in the author copy. Its statement and use are unaffected.

No baseline was removed or replaced. No new mathematical node was necessary at target granularity; the added declarations are prototypes for already planned clauses and APIs. All corrections were mirrored in the reader and relevant suggested-file CONTRACT inventories. No source excerpt was introduced.

## Per-node check

The linear nodes have prefix `RelativeFarguesFontaine:RF4:vector-bundles/`; the final seven have prefix `RelativeFarguesFontaine:RF4:G-torsors/`. The packet records the full IDs and the same verdicts.

| Node | Verdict | Independent check |
| --- | --- | --- |
| `glueing-datum-over-exact-square` | corrected | KL1.3.7 and the module adjunction checked. Completed native pure-tensor morphism computation, flat-target full faithfulness, and tensor/dual compatibility for arbitrary effective finite-projective data. The twisted-Z sections remain (k,k/3). |
| `finite-projective-glueing-over-exact-square` | corrected | KL1.3.8-1.3.9 hypotheses checked separately for all three clauses. Added native finite-datum surjectivity/generators and finite-presentation signatures, and removed the inapplicable geometric-carrier excuse. Full faithfulness now has a native signature. |
| `finite-etale-glueing-over-exact-square` | corrected | KL1.3.10 object and morphism descent checked. Added unique compatible algebra-map descent; effectivity and full faithfulness give the categorical claim. Removed the geometric-carrier excuse. |
| `glueing-pair` | verified | Stacks15.92.6-15.92.12 quotient and torsion hypotheses checked. Native zero-completion, noetherian and infinite-polynomial tests discriminate the pair and module conditions; smooth germs remain a precise missing native carrier. |
| `beauville-laszlo-module-gluing` | corrected | Stacks15.92.16-15.92.19 and SW5.2.9 checked, including the arbitrary-module flatness/projectivity criteria. Added native glueable-unit, arbitrary-datum counit and fully faithful Can signatures; removed the geometric-carrier excuse. |
| `modification-of-vector-bundles` | verified | FS III.3 and FF5.3 support locally bounded poles in both directions, twists by the Cartier ideal and the groupoid convention. Native local specialization is not presented as the geometric carrier. |
| `meromorphic-modification-at-a-divisor` | verified | SW14.1.1 and 19.1.2, FS VI.1 and HK4.3 checked. Fixed reference bundle, both pole bounds, local chart cover and canonical lattice localization are retained; affineness of D is not used to invent one global chart. |
| `arbitrary-complement-formal-patching` | verified | Full stage target is explicitly conditional on the R3 compatible-data model, including morphisms and refinements. Source algebraic/schematic cases are distinguished from the unresolved unrestricted analytic/general-E comparison; the precise request and gap justify planned, not closed, coverage. |
| `gluing-exactness-tensor-and-base-change` | verified | Exact tensor transfer uses effective finite-projective patching and faithful detection, not unproved flatness of completion. Intrinsic completed pullback is separate from ordinary tensor base change; arbitrary inputs retain the R3 condition. |
| `disjoint-and-colliding-legs` | verified | FS VI.1.6, SW12.4.6 and FF5.3.1 checked. Disjoint CRT decomposition, cofinal completion for repeated support, rescaling bounds, and absence of a uniform bound for arbitrary infinite families are consistent. |
| `untilt-divisor-complement-affine` | corrected | KL8.9.3 and its positive-slope proof checked in the unramified setting. The existing corrected slope 1/a is now accompanied by independently confirmed sourceIssue E15 and exact sourceVersions; ampleness and affineness are unaffected. |
| `relative-period-rings-Be-BdR` | corrected | KL8.9.4 and CS3.5.1 checked. Corrected the completion proof to quotients of the ambient period ring, not A/ker(theta)^n. RF2 owns intrinsic completion; the Mathlib comparison remains limited to its p-typical specialization. |
| `B-pair-cohomology` | verified | KL8.9.5-8.9.6(a) and FF5.3.3 checked. The complex uses tensoring the flat quasicoherent module with the formal ring, without claiming completion commutes with arbitrary infinite modules. |
| `vector-bundles-as-relative-B-pairs` | corrected | KL8.9.6(b)-(c), CS3.5.1 and FF5.3.2 checked. Clarified that field-case freeness uses the PID property, not trivial Picard group alone; general relative triples remain finite projective. |
| `lattices-and-modifications-of-trivial-bundles` | verified | SW12.3.4-12.4.6, SW14.1.1 and BMS4.29 checked. VB4 no-leg and normalized tail recovery are requested explicitly; the integral finite-free T is retained when varying the pair. No HS2 cycle. |
| `kedlaya-algebraicity-of-punctured-bundles` | verified | Kedlaya3.8-3.9 and SW14.2.1/14.2.3 checked against the whole analytic puncture, including its crystalline end. RF0 chart/sheafiness ownership is separate. AI.2 imports essential surjectivity only; algebraic full faithfulness remains local to AI.2 per RT19. |
| `meromorphic-G-modification` | verified | FS III.3 and SW19.1.3 checked. Meromorphy is representationwise with duals; BG0 owns each needed dictionary, including the requested integral/scheme/broader field scopes. |
| `tannakian-transfer-of-gluing` | verified | SW19.1.2 and CS3.5.2 checked. Linear gluing transfers to exact tensor functors; arbitrary-complement generality is explicitly conditional. No second torsor dictionary or loop quotient is constructed. |
| `faithful-representation-criterion` | verified | DM2.20(b) with its footnote and FS III.3 checked: a faithful representation plus its dual tensor-generates over a field; subquotients split locally after an exact bundle functor. No unproved integral analogue is asserted. |
| `change-of-structure-group` | verified | DM2.21(b) and SW19.1.5 checked. Precomposition handles an arbitrary morphism; the faithful embedding recognition clause stays over the field with its exact representation hypotheses. |
| `base-change-and-divisor-compatibility` | verified | FS VI.1.5-1.6 checked. Intrinsic completed scalar change, disjoint products and repeated-support cofinality are compatible; chains with overlapping divisors retain intermediate modification data. |
| `v-descent-and-local-triviality` | corrected | SW19.5.3 and Lemma17.1.8, FS VI.1.7 and GR5.4.21-5.4.22 checked. Corrected the internal lemma reference and recorded E16. Completed pointed etale stalk comparison and effective D2 bundle descent remain explicit gaps; regular t, I=R and reductivity are retained. |
| `modification-of-G-bundle-by-lattice` | verified | HK4.3, CS3.5.2 and FS III.3 checked. The input is a G(B_D^+) lattice torsor, not an arbitrary faithful-representation lattice. The Gm sign and SL2 determinant non-example are correct. |

## Source and baseline evidence

All twelve source records were checked through public texts. The eleven source-PDF hashes reproduce the packet's exact hashes. Stacks is a live public tagged text, read on 2026-10-08; section numbers are paired with stable tags. The report and packet use results in the reviewer's own words. Printed-page locators refer to the versions actually read, not guessed published numbering.

| Public text read | Relevant checked locators |
| --- | --- |
| [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf) | March 27, 2020 author copy: 5.2.8–5.2.9 pp.37–38; 12.3.4–12.4.6 pp.104–107; 14.1.1 and 14.2.1/14.2.3 pp.115–119; 17.1.8 pp.150–151; 19.1.2–19.1.5 pp.170–171; 19.5.1–19.5.3 pp.178–181. |
| [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) | Hashed MPIM author copy: III.3 pp.97–98; VI.1.5–VI.1.7 and surrounding completion/local-triviality argument pp.192–194. |
| [KL15-foundations](https://arxiv.org/abs/1301.0792v5) | arXiv1301.0792v5: 1.3.7–1.3.10 pp.17–19, 1.3.6 pp.16–17 and Remark2.7.9 p.58; 8.9.1–8.9.6 pp.187–188; slope normalization 4.1.13 p.105, 6.2.1 p.135, 7.2.1/7.3.1 pp.147–148, 8.8.18–8.8.19 p.186. |
| [Stacks-BL](https://stacks.math.columbia.edu/tag/0BNI) | Section15.92, especially 15.92.6, 15.92.10 and 15.92.16–15.92.19; tags0BNI, 0BNR, 0BNW, 0BP2. Quotient completion and the f-divisible torsion counterexample distinguish nonflat patching from fpqc descent. |
| [CS17-generic](https://arxiv.org/abs/1511.02418v1) | arXiv1511.02418v1: Theorem3.5.1 and Corollary3.5.2, preprint p.33; no assumption that this preprint page is the journal page. |
| [FF18-courbe](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf) | Author copy of April16,2017: 5.3, Proposition5.3.1, Corollary5.3.2 and Proposition5.3.3 pp.208–209; 5.6.4.2/Theorem5.6.26 pp.234–235 and 8.3.1 p.289 for discriminating absolute/minuscule cases. |
| [HK-admissible](https://arxiv.org/abs/2308.11064v2) | arXiv2308.11064v2: Section4.3 p.29, representationwise modification by a lattice. |
| [Kedlaya-Ainf](https://arxiv.org/abs/1602.09016v5) | arXiv1602.09016v5: Theorem3.8 pp.8–9, Theorem3.9 p.9, the whole-chart argument and Example3.14; the article’s public numbering is used rather than SW’s older citation number. |
| [GR24-prismatic](https://arxiv.org/abs/2203.09490v3) | arXiv2203.09490v3: proof of Theorem4.15 p.43, whole-puncture algebraicity application. |
| [GR02-almost](https://arxiv.org/abs/math/0201175v3) | arXivmath/0201175v3: Proposition5.4.21 and Claim5.4.22 pp.121–122, with regular t, the specified ideal, henselianity and completed nonemptiness. Springer numbering is not inferred. |
| [DM82-tannakian](https://www.jmilne.org/math/xnotes/tc2018.pdf) | Revised author copy dated November4,2018: Proposition2.20(b), footnote11, and Proposition2.21(b), pp.25–26; tensor generation and faithful embedding criteria over a field. |
| [BMS18-integral](https://arxiv.org/abs/1602.03148v3) | arXiv1602.03148v3: Remark4.29 p.43, supporting the algebraic full-faithfulness boundary. |

For E15, the [SMF publisher record](https://smf.emath.fr/node/28040) was opened and its restricted full-text route attempted; the legacy download was inaccessible. The finding is therefore expressly against the hashed arXiv v5 only. The [author publication page](https://kskedlaya.org/papers/) directs Foundations errata to Part II; [Part II v3](https://arxiv.org/pdf/1602.06899v3), Appendix A pp.189–191, was read independently and contains no correction of this normalization. SourceVersions records the unavailable publisher text honestly. E16 concerns only an internal reference name in the identified author copy. Both findings carry confirmed verdicts by this review.

The following table records the exact scope of the baseline check. All names in each row were read at the pin, including surrounding variables and instances. Their modules and immutable GitHub links remain in the packet and reader; a declaration name alone was never treated as evidence.

| Baseline declarations | What their statements supply and what was checked |
| --- | --- |
| `AdicCompletion`, `AdicCompletion.of`, `IsAdicComplete` | Algebraic inverse-limit completion, its canonical module map and completeness condition. These do not identify geometric divisor completion automatically. |
| `IsLocalization.Away`, `Localization.Away`, `nonZeroDivisors` | The localization carrier and universal property, and regularity of the local Cartier equation. Ring structures are supplied by the appropriate localization imports. |
| `Module.Projective`, `Module.Finite`, `Module.FinitePresentation` | Distinct projectivity, finite generation and presentation hypotheses; finite projective pieces, not arbitrary infinite locally free predicates. |
| `Module.Flat`, `Module.FaithfullyFlat` | Algebraic flatness and faithful flatness. Completion is not asserted flat. Faithful detection used for patching is distinguished from a claim of fpqc descent. |
| `Module.Free`, `Module.Dual`, `Module.Invertible` | Free modules need a separate finite-generation hypothesis. The dual is the module of linear maps; invertibility uses the canonical contraction, not an arbitrary unrelated equivalence. |
| `TensorProduct`, `LinearEquiv` | Actual tensor-module and linear-equivalence carriers, with their scalar hypotheses. |
| `CommAlgCat.FiniteEtale`, `Algebra.Etale`, `Algebra.Smooth` | Finite étale algebras and étale/smooth predicates with the correct base rings. |
| `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` | A section lifts through the stated adic quotient when the algebra is formally smooth and the target adically complete. This is the lifting core, not a geometric torsor triviality theorem by itself. |
| `HenselianRing`, `IsDiscreteValuationRing` | Ring predicates and the relevant complete-local instances. The approximation signature specializes GR's pair to I=R; geometric products of DVRs still require their supplier identification. |
| `BDeRhamPlus`, `BDeRham`, `WittVector` | The pinned p-typical algebraic carriers, their p-completeness/nonunit assumptions, and Witt vectors. No general-E geometric comparison follows solely from these names. |
| `CategoryTheory.Equivalence`, `CategoryTheory.Functor.Monoidal`, `CategoryTheory.MonoidalCategory` | Category equivalences and monoidal infrastructure; none supplies the absent analytic bundle/torsor categories. |
| `TauCeti.Comodule.IsFaithful`, `TauCeti.Comodule.isFaithful_iff_isClosedImmersion_coordinateGroupSchemeHom` | Faithful comodules and the coordinate group-scheme embedding equivalence under the pinned basis/scalar hypotheses. These do not themselves prove DM tensor generation in every requested integral scope. |
| `TauCeti.AffineGroupSchemeCat`, `TauCeti.ReductiveAffineGroupSchemeCat` | Algebraic affine group-scheme categories, including the reductive field category. The latter is not an integral O_E carrier. |
| `MvPolynomial`, `Ideal.Quotient.mk` | The actual infinite polynomial quotient and its canonical ring map used in the torsion counterexample. |
| `IsLocalization.Away.awayToAwayLeft`, `IsLocalization.Away.awayToAwayRight`, `TensorProduct.AlgebraTensorModule.rid` | Canonical overlap maps and tensor cancellation used in the concrete twisted ℤ datum; compatible scalar towers were read. |

This accounts for all 37 entries: 33 Mathlib and four Tau Ceti declarations. The Mathlib build used for elaboration is exactly the packet pin. Tau Ceti citations were read from the exact commit object; no inference was made from a newer working checkout or from a successfully elaborated Mathlib-only import file.

## Closure, ownership and tests

All forty distinct external node/stage prerequisites were read from their actual supplier packets or the integrated contracts. RF0 owns whole-locus chart construction; RF2 owns divisor completion and intrinsic puncture; RF3's partial schematic presentation is not substituted for global GAGA; VB2 supplies the latter and ampleness. R3 supplies the topological comparison and is requested for the stronger compatible analytic/formal data. VB4's exact supplied clause is distinguished from its recovery extension. D2's function descent and higher acyclicity do not prove bundle effectivity; it receives the exact SW17.1.8 request. BG0's current scope is separated from all requested dictionary extensions.

The relevant reviewed library audit is AUDIT-20/REV-AUDIT-20, including its BG0 entries in `data/library-coverage.json`. That file has no separately audited RF4 entry; this review does not invent one. Its algebraic Tannakian infrastructure and absent analytic torsor carriers agree with the packet. The audit's broad BG0/RF4 overlap is resolved by the accepted RS-20 allocation: BG0 supplies dictionaries, RF4 transfers patching. The accepted RS-20 ownership contract and RT-AREA-padic-1/19 were read. AI.2 keeps algebraic full faithfulness of restriction at its own owner and imports curve input only for essential surjectivity. Nearby complete upstream AdicSpaces and ReductiveGroups documents were also read.

Each of the six definition/construction nodes has at least four mathematical tests (25 total). They distinguish transition conventions, torsion failure, zero/empty cases, generator invariance, pole bounds, geometric-point comparisons and determinant compatibility. The native twisted ℤ test computes the actual equalizer and generator; the infinite-polynomial quotient test includes nonzero torsion killed by completion. The smooth-germ test remains a precise mathematical example without a pinned germ-ring carrier. The local modification and localization tests are actual algebraic specializations. Geometric tests in CONTRACT comments are not counted as elaborated geometric examples. The packet's inventories name the missing curve, divisor, bundle, Frobenius and torsor carriers and introduce no arbitrary proposition as a substitute.

The seven planets are central named results/constructions, with four on the linear layer and three on the G-torsor layer. All names are under 60 characters and each layer is below the six-planet limit. No supplier's torsor dictionary or loop quotient becomes a duplicate planet here.

## Orchestrator follow-up and validation

The next planning passes should discharge the five existing supplier requests: R3 compatible analytic/formal data; BG0 scheme/integral/broader representation dictionaries; VB4 no-leg and normalized one-leg recovery; RF2 completed pointed étale-stalk comparison, including collisions; and D2 effective vector-bundle v-descent. The sixth gap is native geometric carriers, including the smooth-germ example. Preserve the precise conditional scopes until these contracts are established. No promotion, restructuring application or supplier edit was made by this review.

Checks on the final deliverables:

- `python3 scripts/check_blueprint.py research/blueprint/packets/RelativeFarguesFontaine--RF4.json`: **0 errors, 0 warnings**; 23 nodes, all three stages planned, zero closed.
- Source-issue and source-version validation through the repository's `source_issues.check_issues` and `check_errata.versions_checked`: passed. The standalone errata CLI expects a separate errata-v1 artifact, so the packet's own protocol was retained.
- `lean-check research/blueprint/suggested/RelativeFarguesFontaine--RF4.lean`: **exit 0**, exactly 78 warnings, all declarations using `sorry`; no other warnings or errors. This is elaboration of proposed signatures, not formalization of their proofs.
- Per-node verdict coverage, definition/construction test counts, native inventory, reader statements, unchanged implementation statuses, planet limits and obsolete-sentence removal: checked.
- `git diff --check` and deliverable-path verification: passed. Only this issue's four deliverables and its permitted handoff are changed.

The completed review is ready for intake; no checkpoint or additional job is requested.
