# REV-PAPER-SCHMIDT-STIX-16

Reviewer: Codex — codex-a71f92. Date: 2026-09-23. Issue: #1169.
Input: Claude Code — cc-39fac3, issue #1167, PR #1976, merged commit c077b97df9dc0b269b15cf1d8c35c60bcb0c59d6.
Independent review base: 62fce41dc4440191942ba3990fc1b8e80f7f7ca9.

Verdict: **revise**. This review is finished; the extraction is not complete. I did not author or checkpoint the input extraction.

## Reading and reproducibility

Read all published pp. 817–868, including references, from the [Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf). Locators use published pagination.

| Object | SHA-256 |
| --- | --- |
| Published PDF, 52 pages | 6e9083efdb484e6f3dae456bcb55fa8369e2ab35a727da36809f8611eef70759 |
| arXiv v2 PDF, 33 pages | 89d49a17bfd5d00b5e05aefec90c5d75753c86221023a52f9401719f77634226 |
| arXiv v2 source | f7998556f22fa94f6822f5629d2d690d47a61b07007e76b93870b28be08cbfc8 |
| Schmidt-hosted PDF, 33 pages | b88d9981a2012ce3641d75e31947055e1415e40f5f90a9a7d9b158e347af9895 |

The [v2 source](https://arxiv.org/src/1504.01068v2) is a single gzipped TeX file, not a tar archive. Compared selected passages with the [v2 PDF](https://arxiv.org/pdf/1504.01068v2) and [Schmidt's PDF](https://www.mathi.uni-heidelberg.de/~schmidt/papers/anab-hotype.pdf); I do not claim a full independent version diff. Visual inspections of published pp. 848, 857 and 858 were essential for fonts, totalization and the cylinder.

Selected prerequisite reading:

- [Isaksen 2001](https://arxiv.org/pdf/math/0106152): Corollary 7.5, Propositions 8.2/8.4, §10 including Corollaries 10.7/10.8, and Proposition 18.4. These distinguish the homotopy-pro-group model from the strict model and require local systems for general cohomology detection.
- [Isaksen strict models](https://arxiv.org/pdf/math/0108189): the properness correction, Remark 4.16 in this preprint; the paper cites published Remark 4.14. Different version numbering is not itself an error.
- [Isaksen étale realization](https://arxiv.org/pdf/math/0106158): introduction and Theorems 2.5/2.6, Corollary 2.7. The general A¹ target is Z/p-cohomological with p invertible. The uncompleted characteristic-zero comparison needs a separately checked argument.
- [Deligne–Mumford 1969](https://www.numdam.org/item/PMIHES_1969__36__75_0.pdf), p. 84, Definition 1.10/Theorem 1.11: proper stable curves, not directly affine curves with unlabelled boundary.
- [Mochizuki 2006](https://www.math.okayama-u.ac.jp/mjou/mjou48/_07_mochizuki.pdf), pp. 62–63, Theorem 2.4: the absolute-Galois normal-subgroup argument in the number-field setting, with Fried–Jarden and Weissauer inputs.

I have not read the full prerequisite books, the full cited Pop proofs or Serre's 1965 Theorem 7. G2–G4 explicitly prevent those citations from masquerading as verified closure.

## Inventory and change log

Original: 74 items, 2 library / 10 planned / 62 missing, eight routes, twelve prerequisites, seven source issues, status complete.
Corrected: 93 items, 2 library / 9 planned / 82 missing, eleven routes, eighteen prerequisites, fifteen reviewed source issues, status partial.

All original item identifiers are retained. Added /75–/93. Every missing item occurs in exactly one route; that structural property does not validate rejected routes.

Clear in-place corrections:

- /1: fix filtered/cofiltered variance and universe qualification; change to planned D0. Separate cofinite reindexing /75 and remove generic pro-categories from the new roadmap.
- /2–/4: distinguish actual simplicial carriers from the unbuilt Kan–Quillen instance; separate ordinary BG/EG (/76–/78) and exact Isaksen criteria (/79–/81). Remove the false strict-model identification.
- /5–/7: specify rigid hypercovers, characteristic-zero smooth elementary fibrations and completion-sensitive A¹ realization.
- /12: split Proposition 2.4(b)/(c) into /82 and /83.
- /19: change planned to missing; state finite-field-coefficient Künneth, not an unqualified tensor formula for arbitrary Z/n. Route to SF.2.
- /29: correct the appendix subsection locator.
- /34 and /58: distinguish a cover whose rational-point image is one selected point from a cover with only one rational point. The factorization count retains q raised to the dimension difference.
- /37: retain characteristic zero and correct the SGA 7 I bibliography.
- /38: restrict arithmetic-scheme Chebotarev to the regular connected arithmetic-model setting; split its Galois-cover dominance consequence /84. A zero-dimensional finite-field scheme cannot realize every conjugacy class at closed points.
- /39: fix the Jacobson assertion; a closed subset is the closure of its closed points, not generally their union. Separate finite residue fields /85.
- /41: change planned to missing; a general smooth-variety compactification extending a map is not R09.7d's quasi-projective resolution statement.
- /44–/45: add invertibility, finiteness, descent and geometric-Frobenius qualifications; /54 uses the distinct arithmetic-Frobenius convention.
- /46–/49: retain proper/henselian cover lifting; require finite étale over the open curve in Hurwitz; specify ℓ invertible and n≥3 for independent inertia lines; change /48 from planned IG.3 to missing; identify the proper stable/marked-boundary adapter and normal-base hypothesis.
- /50: retain n≥1 and the natural μ_n action; acknowledge the implemented Kummer map/injection and leave surjectivity in its upstream plan.
- /51: narrow the library bundle to verified carrier/compactness inputs, with a nonempty directed index.
- /52: separate Isom Theorem 1.1 into /87 from the dominant Hom theorem.
- /54, /60, /66: make base/integrality/field hypotheses explicit and remove the claimed E6 proof gap.
- /70: separate fundamental-group Corollary 1.6 into /88.
- /71: reject E7's alleged circularity; preserve infinite-perfect versus finitely-generated-over-Q distinctions.
- /72–/74: retain smooth/reduced finite-type constant-field hypotheses, separate all-n divisibility /86, and correct the direction of the base-field scheme arrow.
- /89–/93: expose the Bousfield–Kan totalization/convergence, weak-equivalence cylinder, ordinary Kan–Quillen, cohomology continuity and rigid-type cohomology-comparison prerequisites.

Both briefs were rewritten to remove false provider claims and marked unaccepted. /35 (Pop) moved out of fixed-base NC.1; /41 is quarantined with it in rejected route 8, not made a new anabelian-owned general theory. Route 9 supplies generic pro-categories/reindexing from D0, route 10 ordinary EG/BG lemmas from H.1, and route 11 cohomology inputs from SF.2.

Remaining multipart bundles include /14,/20,/22,/24–26,/28–31,/53,/59,/61,/68,/71,/73–74,/81, as well as the library index bundles. G1 requires splitting and prerequisite closure. No claim is made that adding nineteen records exhausts the paper.

## Pinned libraries and atlas evidence

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Opened every cited declaration in the two library items:

| Item | Declaration | Mathlib file |
| --- | --- | --- |
| /2 | SSet | AlgebraicTopology/SimplicialSet/Basic.lean |
| /2 | CategoryTheory.Under | CategoryTheory/Comma/Over/Basic.lean |
| /2 | SSet.stdSimplex | AlgebraicTopology/SimplicialSet/StdSimplex.lean |
| /2 | SSet.horn | AlgebraicTopology/SimplicialSet/Horn.lean |
| /2 | SSet.KanComplex | AlgebraicTopology/SimplicialSet/KanComplex.lean |
| /2 | CategoryTheory.nerve | AlgebraicTopology/SimplicialSet/Nerve.lean |
| /2 | HomotopicalAlgebra.ModelCategory | AlgebraicTopology/ModelCategory/Basic.lean |
| /51 | Field.absoluteGaloisGroup | FieldTheory/AbsoluteGaloisGroup.lean |
| /51 | krullTopology | FieldTheory/KrullTopology.lean |
| /51 | ProfiniteGrp | Topology/Algebra/Category/ProfiniteGrp/Basic.lean |
| /51 | IsCompact.nonempty_iInter_of_directed_nonempty_isCompact_isClosed | Topology/Compactness/Compact.lean |

The full Quillen structure is explicitly TODO in SimplicialSet/CategoryWithFibrations.lean. Read CategoryTheory/Limits/Indization/Category.lean for the reusable Ind/opposite infrastructure; AlgebraicGeometry/Morphisms/FiniteType.lean for the conditional Jacobson-space transfer; and TauCeti/FieldTheory/GaloisCohomology/Kummer.lean for its map/injection and stated remaining surjectivity obligation. Existing partial code is not a full provider, but must be reused.

Searched pinned libraries and atlas for the mathematical families in every missing record: pro-categories/reindexing/model structures, étale types/homotopy, coverings/BG/EG/lim¹, curve reconstruction/centre-freeness, Hilbertian/Pop inputs, Frobenius/Chebotarev, compactification, Isom, cohomology and Artin neighbourhoods. Search absence is not proof of universal absence.

Read relevant reviewed library-coverage entries: AUDIT-08 NC.0/NC.1; AUDIT-09 IG.0–IG.3; AUDIT-01 SF.0/SF.2 and R09.2/R09.7; AUDIT-06 AN.4; AUDIT-18 EDC.2 and its trace/purity/pairing branches; AUDIT-22 E2; AUDIT-30 H.1 and M.5a. No D0 entry was found in the inspected audit map; its positive pro-category ownership comes from the layer text, not a claimed audit.

Read the cited layer descriptions, not just names: NC.1 variants; IG.1 scheme specialization/tame scope and IG.3 Riemann existence; SF.0/SF.2; R09.2 and R09.7d; AN.4; EDC.2 branches; E2; D0; H.1; upstream AlgebraicTopology Stage 8, AlgebraicCurves Layer 7, ProfiniteCohomology Layer 9 and ProfiniteProPGroups Layer 0. Also checked MotivicEtaleKTheory M.5a's A¹ prerequisites and M.7's étale K-theory descent: these are not the unstable étale-type construction. RS-07's AN.4 and RS-29's IG.1 decisions were checked directly.

## Route verdicts

1. **accept** — NC.1 explicitly requests separately sourced Hom/affine/local/finite-field curve variants. Accept /11,/33,/34 only. Pop's field reconstruction /35 has been removed.

2. **accept** — IG.1 is the scheme π_1, specialization and tame-inertia owner. Accept the corrected characteristic-zero product/finite-generation and proper-henselian-cover statements plus the ℓ-invertible elementary abelian inertia calculation; do not identify it with IG.3's characteristic-zero Riemann-existence method.

3. **reject** — IG.2's ordinary HIT does not establish the full absolute-Galois-group normal-subgroup assertion. Read FJ08 16.11.6 and its consequences and resolve the exact field range and ownership (G2).

4. **reject** — AN.4 and RS-07 concern number-field analytic comparisons, not general arithmetic-scheme Frobenius density. /38 and /84 need a source-qualified supplier (G4).

5. **accept** — R09.2 is the relative Hom/Isom owner. The source task is explicitly the marked-boundary extension of DM69's proper stable-curve result, with normal-base generic-section extension. This accepts ownership, not a claim that the affine adapter is already proved (G6).

6. **accept** — SF.0 owns Jacobson/finite-presentation/spreading-out arithmetic scheme foundations; /39 and /85 are now distinct and the Mathlib partial transfer theorem is not mistaken for the full Z-case.

7. **reject** — Pro-space direction is plausible but source/API closure is incomplete. D0, H.1 and motivic owners must be imported; ordinary Kan–Quillen and homotopy-limit providers remain unresolved. Strict and Isaksen models, cohomology ranges and A¹ completion targets were conflated in the original (G1/G3/G7/G8).

8. **reject** — The anabelian extension depends on rejected route 7 plus unresolved Pop/Hilbertian, arithmetic-scheme Chebotarev and general compactification imports. Quarantining /35 and /41 here does not assign this candidate their ownership (G1–G8).

9. **accept** — D0 already owns size-aware pro-categories; source its cofinite directed reindexing and dual-Ind interface there, once. /1 is planned, /75 missing.

10. **accept** — H.1's ordinary nerve/bar/BG construction is the owner for discrete EG and group-surjection Kan fibrations. The pro-level variants are distinct downstream inputs.

11. **accept** — SF.2 owns scheme/site étale cohomology. Add exact F_ℓ Künneth and affine-limit continuity sources there, with explicit hypotheses; neither is a new étale-type carrier.

The overall revise verdict prevents all automatic route application in the current queue. Narrow accepted source routes can be preserved by the reviser without treating unproved adapters as implemented theorems.

## Independent source-issue verification

E1–E5 confirmed. E2's missing explicit smoothness is read within the already smooth ambient family; affects is corrected to nothing, not a false intended theorem.

E3 is a type check: for f:X→Y, r(γ):X→X and r(δ):Y→Y, the meaningful equation is r(δ)f=f r(γ)=f. E4 excludes zero because its closed cyclic subgroup is not open in Zhat; nonzero ordinary integers are dense, and surjective profinite homomorphisms are open.

E6 rejected. The displayed base-change triangle gives ι′_et γ′=ι′_et, making γ′ relative to k′. The unique auxiliary morphism in the definition of r is ι′, and its factorization is id. No uniqueness of the chosen lift γ′ is needed.

E7 rejected after visual inspection of p. 848 and v2 TeX line 1797. The universal calligraphic family maps to P(𝒲), and the inverse image of P(W) defines its fibre. The original extraction lost the font distinction. E14 is a different later subscript slip.

Newly checked entries E8–E15:

| ID | Published page | Verification |
| --- | --- | --- |
| E8 | 850 | f_c and the displayed base change require Spec(k)→Spec(ℓ), not the reverse; v2 TeX 1866. |
| E9 | 857 | Product over n-chains is degree n of cosimplicial replacement, not Tot^n; v2 TeX 2186–2189. |
| E10 | 858 | Relative cylinder projection need not be a fibration; v2 TeX 2218 and visual page. |
| E11 | 858 | Endpoint labels are 0,1 and source is (X,x); v2 TeX 2230. |
| E12 | 853 | The connected pointed subcategory lives in the pointed homotopy category; v2 TeX 2001. |
| E13 | 861 | Hom sets in (9)–(10) retain structural maps, hence are relative; v2 TeX 2371/2376. |
| E14 | 848 | The open Grassmannian image belongs to the universal family, not one fibre. |
| E15 | 825 | A.13(b), not (a), defines the stabilizer preimage; v2 TeX 777. |

For E9, take the identity inverse diagram on a discrete two-point set indexed by one arrow. Including identities, there are three one-arrows, so the degree-one product has eight points. Partial totalization imposes compatibility and has two. The proof needs the genuine totalization tower and its convergence, not that product identification.

For E10, let constant X have three vertices a,b,c, with distinguished a,b. The cylinder is two points plus Δ[1]. Over c, the outer horn with vertices (0,1,0) has the edges 01 and 02 but cannot have the missing 12 edge. It has no filler. A constant horn inclusion is an acyclic cofibration in the pro-model, so passage to pro-objects does not repair the lifting failure. The projection is still a weak equivalence; that is the sufficient cylinder condition. No main theorem is declared false.

Thirteen records are confirmed and two rejected. Rejected entries remain for auditability and must not appear as confirmed errata.

Correction search, 2026-09-23:

- [Annals article page](https://annals.math.princeton.edu/2016/184-3/p05): no matching correction listed.
- [arXiv history](https://arxiv.org/abs/1504.01068): v1 2015-04-04, v2 2016-07-12; no later revision shown.
- [Schmidt publications](https://www.mathi.uni-heidelberg.de/~schmidt/publ_de.html), [paper page](https://www.mathi.uni-heidelberg.de/~schmidt/papers/schmidt40-de.html) and linked PDF: no matching correction.
- [Stix publications](https://www.math.uni-frankfurt.de/~stix/publikationen.html): no correction on this paper's entry. The nearby harmless-correction note belongs to a different Shapiro-lemma paper.
- [Crossref record](https://api.crossref.org/works/10.4007/annals.2016.184.3.5): no update/correction relation in the retrieved metadata; title/author correction search found none.

“New” means no correction found in that bounded search. Nothing was sent to the authors.

## Remaining gaps and verification

- **G1: Atomic coverage remains incomplete despite 19 added items.** Split bundled definitions/theorems, especially /2,/14,/20,/22,/24–26,/28–31,/51,/53,/59,/61,/68,/71,/73–74,/81. Inventory all proof dependencies and APIs; do not equate 93 records with complete closure.
- **G2: Hilbertian Galois-group assertion and Pop field-reconstruction ownership are not source-closed.** Read FJ08 16.11.6 and the needed Weissauer argument with exact field hypotheses; read the cited Pop theorem. Determine suppliers/extensions beyond IG.2 ordinary HIT and NC.1 fixed-base curve reconstruction. Routes 3 and 8 are not accepted.
- **G3: Pro-homotopy prerequisite proofs and coefficient/completion ranges are incomplete.** Read the relevant Friedlander, Artin–Mazur, Bousfield–Kan, Edwards–Hastings, Hirschhorn and Isaksen sources, separating corrected properness, cosimplicial replacement/partial totalization, convergence, rigid hypercovers, local coefficients and the A¹ realization comparison. The selected Isaksen passages are not full source closure.
- **G4: General arithmetic-scheme Chebotarev has no justified owner here.** Read Serre 1965 Theorem 7 with regularity/flatness/connectedness hypotheses and verify the splitting-set corollary. AN.4/RS-07 does not supply it; route 4 is a rejected candidate.
- **G5: General compactification in Proposition 4.1 exceeds the named resolution layer.** Provide compactification of a smooth variety extending the map to proper W, followed by characteristic-zero resolution and an SNC boundary. R09.7d's quasi-projective case is not this contract. Choose a general supplier; /41 is quarantined in rejected route 8.
- **G6: The proper-stable-curve source needs a marked-boundary adapter.** Derive finite-unramified relative Isom for the compactifications with finite étale boundary, descend from an étale marking, and use normality for extension of a generic section. DM69 1.11 directly treats proper stable curves, not unmarked affine hyperbolic curves.
- **G7: Ordinary homotopy foundations must have explicit owners before a new pro-space roadmap.** Keep generic pro-categories/reindexing at D0 and BG/EG at H.1. Resolve the ordinary Kan–Quillen model structure and any remaining ordinary covering/homotopy-limit providers without replanning them inside EtaleHomotopyTypes. The abstract Mathlib class is not a supplied SSet instance.
- **G8: Exact cohomology/base-change imports still need source closure.** Check all coefficient ranges and finiteness hypotheses, characteristic-zero π_1 and F_ℓ cohomological Künneth, continuity and the rigid-type cohomology comparison; include the Gabber/SGA references actually used in §4. Accepted SF.2 routing establishes ownership, not a completed proof.

Checks: paper schema validator; the repository's test_check_paper, test_source_issues and test_papers_queue suites; and an independent stdlib-only regression script. The latter checks all item identifiers and unique routing, all route/source verdicts, coefficient/owner invariants, elementary abelian inertia lines for ℓ=2,3,5 and n=3,…,6 (with negative n=1,2 controls), the Lemma 5.4 numerical bound for n≥6, arithmetic/geometric Frobenius point counts, and the E9/E10 finite counterexamples. Test outcomes are recorded in the handoff.

No Lean written or compiled. Finite examples test formulas and counterexamples, not general étale comparison or homotopy-limit theorems. No rejected candidate is offered as an accepted blueprint dependency.
