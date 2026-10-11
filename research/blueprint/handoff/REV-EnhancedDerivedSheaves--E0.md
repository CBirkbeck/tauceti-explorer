# Handoff: REV-EnhancedDerivedSheaves--E0

Completed independent review of #719 through issue #396, by Codex session `codex-KAgYbr`, 2026-10-11. Verdict: accepted as a complete target-level planning pass. The [report](../reviews/REV-EnhancedDerivedSheaves--E0.md), [packet](../packets/EnhancedDerivedSheaves--E0.json) and [suggested file](../suggested/EnhancedDerivedSheaves--E0.lean) are authoritative for the corrected plan. All 120 original ids remain; five key inputs were added. Individual verdicts cover every one of the 125 nodes. No stage is closed and all implementation statuses are unchecked.

Checks pass: packet with independently generated pinned declaration index, zero errors/warnings; final `lean-check`, exit 0, 242 proof-placeholder warnings only; all 58 pinned file hashes, exhaustive 125/210/155 signature matrix, definition fixtures and planet bounds; authorized-path intake check and whitespace check. There is no running Lean process or task to resume. Public source downloads and temporary index/logs were scratch only and will be deleted after submission.

## Required ownership redirects

The current upstream order puts EnhancedDerivedSheaves in tier 4 and DerivedDeRhamCohomology in tier 9. WORKERS requires these upward inputs to move down, superseding the older AUDIT-22/DD.1 ownership for the foundations needed here. This review changes only its authorized files. The orchestrator/packager should redirect the later DD.1 packet and package as follows; retain its genuinely additional filtered/de Rham targets.

| Earlier DD.1 input | Lower-tier owner |
| --- | --- |
| `koszul-complex` | `EnhancedDerivedSheaves:E1/koszul-complex` |
| `derived-completeness` | `EnhancedDerivedSheaves:E4/derived-complete-sheaves`, point-topos case |
| `derived-completion` | `EnhancedDerivedSheaves:E4/the-imported-completion-interface`, now the generic and sheaf reflector |
| `koszul-completion-tower` | `EnhancedDerivedSheaves:E4/koszul-completion-tower` |
| `ordinary-quotient-completion`, regular-sequence case | `EnhancedDerivedSheaves:E4/regular-ideal-quotients` |
| generic completed tensor | `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`, point-topos case |
| derived Nakayama needed for the regular-ideal application | `EnhancedDerivedSheaves:E4/mod-ideal-detection` |

The generic Koszul definition permits arbitrary modules and linear functionals; its bounded perfectness has the finite-projective hypothesis. Its full DG contraction/multiplication/functoriality API remains explicitly partial/omitted in the suggested matrix. The Koszul power tower works without Noetherianity or regularity; ordinary quotient replacement retains the finite regular-sequence condition. A further Noetherian-only completion target can remain a later application, importing the lower-tier carrier/model. Stronger varying-unbounded-coefficient pro-Tor is the existing E4 `coefficient-pro-tor-comparison`, with a formal uniform-amplitude comparison gap; it is not a reason to restore a higher-tier request.

The other added key inputs are `E0/locally-kan-coherent-nerve` and `E2/perfect-h-cover-descendability`. The latter consumes ordinary geometric Noetherian fppf/proper cover bounds, owns the enhanced uniform-index Frobenius/telescope argument, and precedes `perfect-h-cech-descent`. The perfected-fibre-product/Frobenius comparison is explicitly a gap. D0 is not made dependent on enhanced E2 descent, and the E5 abstract module-descent request must depend only on E0/E1 foundations.

## Reader and package reconciliation

`readmes/EnhancedDerivedSheaves--E0.md` was not an authorized file for #396. Before packaging, mirror all corrected packet statements, prerequisites, API items, fixtures and locators, especially these sections:

- **CoCartesian fibrations:** use relative `Fun_B(B,E)` in every simplicial degree; add `coherentSections`, the degreewise fixed-projection equation and inclusion, and the identity-over-`BG` terminality fixture. Include the quasicategory hypotheses for mapping-space and transport claims.
- **Universe control for mapping spaces:** replace raw simplex smallness with homotopy-small Kan models, add the large contractible model fixture, require quasicategories, and use natural equivalence for representable evaluation. Coherent naturality remains partial.
- **Cat∞ and Spaces:** cite the added general locally Kan coherent-nerve/mapping theorem. Keep its full universe/naturality obligation distinct from the equal-universe typed specialization.
- **Ringed pullback/pushforward:** replace the blanket K-injective preservation argument with the derived K-flat/K-injective comparison; restrict preservation to an exact underived left adjoint. Keep enough points out of the point-free targets.
- **E1 Koszul and E4 completion:** add the three moved foundational nodes and the generic point-topos instances. Remove the old claim that E4 imports generic completion from DD.1. Mirror the ownership table above and all updated direct links. The original id `the-imported-completion-interface` is retained for link stability despite its changed ownership.
- **Compatible coefficient systems:** add zero-ideal evaluation and state categorical equivalence, not simplicial isomorphism. Specify degreewise pro-isomorphism/error cohomology and the uniform regular-sequence amplitude in the pro-Tor comparison.
- **h-descent:** add the quantitative perfect-cover key theorem. Distinguish geometric tensor-nilpotence with uniform Frobenius index from generic abstract module descent and from mere ordinary cover cohomology.
- **E3:** require a quasicategory base for terminal-fibre finality and transport; use a small site presentation for the ringed-system theorem; test all shifted compact generators; require each cutoff category presentable.
- Mirror the corrected ≤-truncation citations and source locators, the Roos/Milnor/stability/Hom direct prerequisites, and the exhaustive suggested matrix. Stage totals are E0 25, E1 23, E2 41, E3 13, E4 23. There are 47 definitions/constructions, 30 planets, 12 recorded gaps and four requests.

The current Tau Ceti DG carriers and H⁰ functoriality remain imports; ordinary and arbitrary-site extension-by-zero must retain their different generalities. AlgebraicTopology owns Kan homotopy groups. The current pinned internal-Hom quasicategory instance is existing infrastructure. Do not recreate any of these during packaging.

## Remaining scope

Use `gaps`, the per-stage `remaining` lists and `suggestedCoverage` as the worklist for subsequent formal-interface work. The principal obligations are signed/right-lax DG comparison, coherent classifier/size construction, functorial cardinal-controlled replacements, point-free variable-ring localization, higher matching objects/Postnikov interfaces, perfected geometric comparisons, uniform coefficient pro-Tor, and higher reconstruction/mate coherence. The four public-version source issues are confirmed; full version-of-record collation remains separate and is not claimed complete.

This review is finished. No second issue is claimed by this session.
