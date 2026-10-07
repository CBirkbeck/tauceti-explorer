# Handoff — BP-CohomologyComparisons

Issue #697. Agent: Codex. Session: `codex-mCCbxV`. Date: 7 October 2026.

This is a completed target-level planning pass for CP.0–CP.6, submitted for independent review, not a checkpoint and not a claim of formalisation. All seven stages are **planned**, none is **closed**. Every owned declaration remains `unchecked`. The stopping rule is the protocol's completed breadth pass; the precise remaining work is recorded instead of claiming proof closure.

## Deliverables and scope

- [Packet](../packets/CohomologyComparisons.json): 82 nodes (2 definitions, 2 constructions, 54 theorems, 18 applications, 6 comparisons), 20 API items, 12 tests, 31 planets, 14 pinned baseline references, 13 gaps and 51 supplier requests. Each definition/construction has at least three mathematical tests; every stage has at most six planets.
- [Reader](../readmes/CohomologyComparisons.md): the definitive mathematical document, with statements, hypotheses, proof outlines, APIs, tests, supplier evidence, source corrections and closure instructions.
- [Suggested Lean](../suggested/CohomologyComparisons.lean): typed prototypes for the specialization homomorphism dictionary and the underlying presented adic completion, plus an explicitly omitted mathematical inventory for the geometric signatures whose supplier types are missing.

CP.0 fixes coefficient maps, geometric/site interfaces and conventions. CP.1 plans the integral derived specialization diagram, including Frobenius pullback, Bockstein and completion boundaries. CP.2 retains rational crystalline comparison and descent. CP.3 supplies the supporting BMS §13 construction and comparison chain, degeneration, Guo–Reinecke relative infinitesimal theory and the smooth absolute-relative agreement. CP.4 separates good-reduction, semistable, arbitrary algebraic and proper rigid comparisons and their different hypotheses. CP.5 covers torsion inequalities, lattice recovery, small-weight arithmetic interfaces and the two geometric counterexamples. CP.6 gives products, trace/duality/cycle/Chern and arithmetic exports and the routed Pan truncated-period adapters.

All twenty original declaration identifiers survive as owned nodes or explicit import aliases. Accepted RS-01 ownership is followed: generic A_inf linear algebra belongs to AI.5, residue-section crystalline invariance to CR.3, and integral lattice classification to R07.4. The ten displaced generic nodes retain their full source/proof evidence as supplier records. The corrected AI.6 semistable length/lattice results are imported by exact node, rather than redeveloped here. No upstream roadmap or atlas data was edited.

## Sources and baseline

The public source register in the packet records URLs, exact editions, PDF SHA-256 hashes and sections read. The reader records the same reading boundaries. It replaces the old private extraction hash and line locators with reproducible printed page/theorem references. The comparison pass read BMS v3 §§2, 12–14 and the retained supplier sections; Česnavičius–Koshikawa v3 §§6–9; Guo–Reinecke v3 §10.1 and §10.2 comparison statements; Guo v1's smooth infinitesimal inputs; the November 2024 Colmez–Nizioł author manuscript's §6.2; the April 2022 Betts–Stix manuscript §3.4; Pan v1 §§6.3.9, 7.2.3–7.2.6; CDN's proper-curve Proposition 3.12; Prisms v4 §18; Scholze's primitive/local/global comparison statements and the full official erratum.

Original Beilinson h-descent, Kisin existence/uniqueness, Lang–Ogus/Illusie Enriques, positive-characteristic Bertini, early analytic BC/syntomic and DLLZ proofs are not claimed read or closed. Their exact imported statements and proof obligations are in the requests and gaps.

The reviewed library audit contains no reviewed CP layer entry. All fourteen named baseline declarations were checked in sources at Mathlib 082e2d3 and Tau Ceti f790474. The actual statements matter: completion completeness needs a finitely generated ideal; module length is extended-natural; finrank is not torsion length; the pinned BDeRham definitions do not themselves provide field/DVR instances. Ordinary derived categories and tensor products do not supply completed E∞ or filtered geometric theories. Two nearby upstream documents, AdicSpaces and EllipticCurves, supplied the planning standard.

Three source issues are recorded with their precise text/version and correction search: Scholze's official corrections to pro-étale covers/point descriptions and structural OB_dR⁺ completion; and the Betts–Stix manuscript's nonproper total-bundle invocation in its Chern-class proof. The last finding is a proof gap in that manuscript only: published full text was unavailable, and no claim is made that the published version retains the step or that the result is false. The required proper projective-compactification argument is a closure obligation.

## Structural and verified findings

All four attached findings are addressed: `RT-AREA-padic-1/24`, `RT-AREA-padic-2/3`, `/4` and `/23`. The primitive comparison request states the absolute/relative almost comparison and local-system finiteness with corrected covers. The two proposed orderings of a nonexistent early P8 primitive cut are exposed for restructuring, rather than silently citing an invented stage. The all-weight Kisin request is distinguished from rational classification and the finite-flat/p-divisible range. PR.8, R07.3/R06.4 and PR.4/EDC inputs and the R06.6 return interface have their actual mathematical scopes.

Pan's late adapters have actual parent CP.6 and realise the routed CP.0/CP.3 extensions. They depend on T6:comparison after the ordinary CP.3 core, avoiding a whole-stage cycle back into CP.3. A late log-truncated substage is proposed. Likewise, the CP.6-consuming cyclotomic-character suffix of RT.6 must be separated from the early THH/prismatic input to PR.7. CN's earlier h/BC/syntomic proof inputs cannot come from R06.5/R06.6, which consume CP.4. The packet proposes source-qualified scope extensions in the owning roadmaps; it does not create those suppliers.

## What remains and where to resume

Independent review should first check the target/source crosswalk, map-level hypotheses and ownership boundaries. The exact next work is indexed by the thirteen gap IDs; the reader's “Required supplier interfaces” and “Explicit gaps and closure work” give complete statements and the packet gives node incidence:

1. `G-primitive`: establish and place the corrected early absolute/relative primitive comparison and separately sourced log primitive input.
2. `G-map-agreement`: write the explicit coordinate, Koszul and cup homotopies relating integral and rational comparison maps.
3. `G-affine-crystalline`: supply CR.3's rational smooth affine/qcqs Frobenius-isogeny and completed residue-section invariance proof.
4. `G-relative-filtration`: close the relative filtered comparison foundations and singular/éh extensions with the stated flatness, section and transversality hypotheses.
5. `G-hk-conventions`: prove the exact log-base descent and signed uniformizer transport/cocycle with N = −d/dT.
6. `G-log-products`: verify PR.8's log range/map agreement and supply the semistable tensor/cup enhancement separately.
7. `G-analytic-cst`: provide h-derived and overconvergent HK, syntomic and Banach–Colmez inputs to the distinct algebraic and rigid K/C theorems.
8. `G-kisin`: extend the owner to all-weight crystalline lattices, Kummer restriction and the original existence/uniqueness argument.
9. `G-counterexamples`: supply the original lifting, crystalline computation, Bertini and weak-Lefschetz inputs to the two constructed surfaces.
10. `G-chern`: supply PR.4's actual Chern constructions and the proper compactification proof; do not assume equality of the trace-normalized period with Fontaine's canonical one.
11. `G-pan`: supply Pan22's earlier coefficient/flag comparison, tower torsion/completeness, analytic exactness and decompletion interfaces.
12. `G-exports`: close the owner's normalized cyclotomic-character and Habiro specialization squares with their intersection hypotheses.
13. `G-lean-types`: supply genuine geometric, completed, enhanced, filtered and analytic supplier types before giving the omitted Lean signatures.

The source-level proof gaps and supplier scope extensions above prevent closure. Review acceptance should lead to the protocol's follow-up jobs for open stages, then assembly. This pass does not require a worker to resume the old CP.5-heavy checkpoint.

## Validation and prototype limits

`python3 scripts/check_blueprint.py research/blueprint/packets/CohomologyComparisons.json` passes with **0 errors and 0 warnings**, using the installed pinned declaration index. Submission path checks pass for the four deliverables, as does `git diff --check`. Additional consistency checks confirmed preservation of all original IDs, all 82 proposed names, every API/test name, gap/request incidence, the six-planets limit and honest seven-stage coverage. Short owned-source excerpts were matched against the downloaded source texts. Both the owned-node graph and the atlas stage graph augmented by accepted RS-01 links and this packet's cross-stage prerequisites and R06.6 return were checked acyclic.

`lean-check research/blueprint/suggested/CohomologyComparisons.lean` elaborates at the pinned Mathlib, with only fourteen admitted-proof warnings. It checks two typed adapters, eight API lemma signatures and six examples. The other geometric definitions/constructions, advanced comparison signatures and remaining six tests are mathematical inventory entries explicitly omitted because their supplier types are absent. This is not verification of their geometric statements, and there are no truth-valued or axiom stand-ins for the missing theories. Every implementation status remains unchecked.

No background Lean process or repository copy was created. Job scratch is deleted on submission; all information needed by independent review and follow-up workers is in these four deliverables.
