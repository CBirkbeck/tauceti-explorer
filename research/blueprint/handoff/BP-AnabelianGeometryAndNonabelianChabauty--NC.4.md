# Handoff — BP-AnabelianGeometryAndNonabelianChabauty--NC.4

Agent: Codex · session `codex-L2CG9q` · issue [#6345](https://github.com/CBirkbeck/tauceti-explorer/issues/6345) · branch `codex-L2CG9q-nc4-blueprint`.

This is a complete target-level planning pass, ready for independent review. It is not a checkpoint. The packet status is **complete**, and its sole stage `AnabelianGeometryAndNonabelianChabauty:NC.4` is **planned**, not closed. Every implementation status is **unchecked**. No second job was claimed. The manager's priority issues were unavailable; the suitable fallback blueprint was claimed with `/claim Codex — codex-L2CG9q` and the bot confirmed the claim.

## Delivered

Only this issue's packet, reader, suggested file and this handoff are changed. The accepted parent and the NC.2/NC.3 supplier packets are untouched.

- 19 nodes: 7 constructions, 5 comparisons, 6 theorems and 1 definition.
- 41 API items and 24 tests across every definition/construction.
- Six planets: Admissible torsor period, Unipotent Albanese map, Kim density theorem, Crystalline period map, Chabauty–Kim locus, and Chabauty–Kim finiteness criterion.
- Eight checked Mathlib baseline declarations; 6 exact supplier requests; 3 explicit gaps; 2 source printing slips awaiting independent review.
- One ownership proposal: put the requested general split-unipotent homogeneous-space refinements in **Reductive groups, Part II**, retaining current upstream layers 3 and 5 as prerequisites and owners until the maintainer assigns the refinement. No upstream document is edited or re-planned.

The target chain covers admissible torsor periods and classification, local de Rham and local/global étale path maps, the represented crystalline and global Selmer period morphisms, their actual comparison diagram, three precise image/closure loci, rational/integral containment, regular-function pullback, discwise density, conditional finiteness and the exact classical depth-one comparison.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/AnabelianGeometryAndNonabelianChabauty--NC.4.json` passed against the pinned declaration index: **0 errors, 0 warnings**. The final prerequisite graph is acyclic and all references resolve. Definition API/test names and statements were checked against the reader and suggested file, including each explicit geometric omission. Scope, status, planets, source records and deliverable paths were checked.

`lean-check research/blueprint/suggested/AnabelianGeometryAndNonabelianChabauty--NC.4.lean` passed on the shared pinned build, exit code 0, with **63 admitted-proof warnings and no other warnings or errors**. Available memory exceeded 20 GB before each invocation. No build, update, cache download or language server was started, and no elaboration remains running.

The suggested file types eight native definitions, 32 of the packet's API signatures, and 18 of its definition tests; the 9 local/global étale API signatures and 6 tests require the native continuous crystalline/Selmer path-class carriers and are explicitly omitted under their exact names. Available named targets are stated as native point/linear consequences; full geometric signatures are explicitly omitted where their carriers are missing. The torsor-family depth projection is typed on actual equivariant torsor maps, and represented Selmer composition uses schemes over a common native base. Elaboration verifies these reductions, not their geometric instantiation or any theorem proof.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All eight cited baseline statements and surrounding hypotheses were read at the Mathlib pin. The declaration index independently corroborated their names/modules.

## Precise supplier work and closure boundary

The pass has no unplanned NC.4 target. Closure requires the following interfaces and the transitive gaps of the imported plans to be resolved:

1. Current ReductiveGroups layer 3: represented nonnormal right homogeneous quotient U/H, smooth geometrically integral affine target, coefficient points, induced maps and scalar extension.
2. Current ReductiveGroups layer 5: fppf torsors under split smooth unipotent H vanish over every affine coefficient algebra, including nonreduced algebras; this gives Q(R)=U(R)/H(R). These two refinements belong to the ownership proposal, not to NC.4's period construction.
3. SchemeAndStackFoundations SF.0: the reduced geometric image-closure subscheme and its rational-point bridge, functorial closure maps and injectivity of field-extension maps on curve points.
4. NC.2: native filtered/Frobenius right paths and depth projections, its already-recorded two-augmentation multiplicative crystalline comparison, and the proper Hodge–Abel–Jacobi bridge with the explicit forward-word/ordered-ratio convention transport.
5. NC.3: native coefficient-algebra-valued crystalline and global continuous nonabelian cohomology, conditional finite-type representability with its H⁰/H¹/H² and closed local-condition hypotheses, and actual localization respecting every imposed condition.
6. ColemanIntegration L1: proper ordinary residue-disc charts and analytic word evaluation, including a finite étale auxiliary boundary divisor when no second K-rational residue disc exists. The imported ED.4 Strassmann bound handles the compact rescaled series.

The three packet gaps are the missing native geometric signatures, the nonlinear/depth-one supplier bridges and conditional global/local representability. The strict Selmer dimension inequality remains an external mathematical input. The existence of a depth satisfying Kim Conjecture 1 is not an NC.4 theorem.

An independent reviewer should check the ordered ratio p_φu=p_H and the nonnormal S₃ test; Kim U_(n+1) versus our depth n; the period representative I⁻¹γ versus NC.2's forward word element I; and the sign transport in the normalized Lie comparison. That transport is an explicit supplier interface, not a silent change to NC.2. The raw quotient coordinate is γ_i−I_i, whereas pairing the normalized Lie period with ω gives the forward Coleman integral.

Also check the three locus inclusions without asserting equality, all bad-place conditions, geometric image closure rather than rational source image, reduced-image vanishing rather than an erroneous zero pullback on a nonreduced source, and discwise density before analytic finiteness. For K≠ℚ_p the original Weil-restriction dimension bound alone is insufficient; use explicit K-disc nonvanishing or the stronger auxiliary K-morphism bound. At depth one W_MW⊆W_S is explicit, equality needs its own hypothesis, and rank alone does not bound the full Selmer locus. A common-annihilator locus is not claimed to equal the inverse image of the literal topological Mordell–Weil closure.

## Sources and existing-work checks

Read the published Kim 2009 paper, DOI [10.2977/PRIMS/1234361156](https://doi.org/10.2977/PRIMS/1234361156), [public version of record](https://content.ems.press/assets/public/full-texts/serials/prims/45/1/2127/online/10.2977-prims-1234361156.pdf), on 2026-10-11: introduction pp.91–96; §1 pp.96–114, including Lemma 1, Proposition 1, Lemmas 2–4 and the proof of Theorem 1; §2 pp.114–120; and the conditional finiteness argument of §3 pp.120–121. SHA256: `b06562bc28c5648152b54d5539af8b8a4cf902192eeb37f36b0db5dfc45a4566`. No required source is missing, and no restricted source was used. All source statements are in our own words; no source passages, PDFs or extracted source text are committed.

The packet records two clear contextual printing slips: the local place on p.92 and the realization of the annihilator target on p.121. Checked the EMS article/journal record, arXiv record/version history and web results for corrections. No correction to these slips was located; the 2011 Massey-product erratum concerns a different paper. Neither finding has an independent review verdict.

Read the reviewed NC.4 audit, accepted parent coverage and applicable parent H¹ restriction, and exact NC.2, NC.3, L1, ED.4, SF.0/SF.1 and Weil-restriction supplier statements. Read every link-map entry mentioning this roadmap; these entries are screens with no additional exact NC.4 dependency, not absence proofs. Searched open Mathlib PRs for Chabauty and Albanese (no matches) and indexed Zulip for the same direction (no relevant result); these searches do not replace the pinned library audit.

Current read-only upstream roadmap HEAD `070dc2becd74419e76303ede84b465ed4a69461f` and current Tau Ceti HEAD `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were searched. Read JacobianChallenge and Completed/HodgeStructures readers in full and the relevant current ReductiveGroups and ReductiveGroupsPartII quotient/Weil-restriction material. No existing Albanese/Chabauty–Kim target was found. General Hodge structures, Jacobians, Tate modules, integration, classical Chabauty and homogeneous quotients retain their owners.

The generic Tau Ceti analytic-zero finiteness theorem with a preconnected-set hypothesis is a near match that cannot justify finiteness on totally disconnected p-adic residue discs. This pass uses the actual ED.4 restricted-series Strassmann interface instead.

Resume from independent review of this complete pass, then resolve the listed supplier refinements for closure. There is no interrupted extraction or draft to continue, and nothing required by a subsequent worker lives only in scratch space.
