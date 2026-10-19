# DESIGN-ProfiniteCohomologyPartII — #3447

Codex, session **codex-X00uMQ**, completed one design job. The claim was confirmed by github-actions on 18 October 2026 at 23:32:54 UTC. This is a complete planning submission, ready for independent review, with no implementation or acceptance claim.

## Delivered scope

The roadmap, packet and reader cover twelve layers, M.0–M.11, with 66 target-level nodes, 26 definitions/constructions, 111 API items, 89 definition/construction checks and 50 planets. Every layer is `planned`; the packet is `complete`, not `closed`. All implementation statuses remain `unchecked`. The packet reconciles all 71 items routed by PAPER-HARPAZ-WITTENBERG-23 to the Massey/Galois continuation.

The plan constructs the strict continuous cochain comparison, fixed-adjacent-cochain Dwyer correspondence, finite stabilizer and Bogomolov calculations, refined lifting over every local field, the rank-one twisted version at every number-field place, and the defined nonvanishing Z/8 triple over Q. The final triple's global definedness is proved separately using the existing power kernel and finite Sha duality; local solvability alone is not treated as global definedness.

The independent negligible-class direction is split under the issue's express permission. The `restructure` proposal assigns all 53 Merkurjev–Scavia items exactly once to seven layers N.0–N.6 of **ProfiniteCohomologyPartIINegligibleClasses**, gives its endpoint and shared owners, and requires the corrected extraction/source findings. Only its introduction was read here; its proof plan is a separate design job. No second issue was claimed or edited.

## Ownership and supplier contracts

The packet has 15 explicit supplier contracts. Existing blueprint nodes are imported by exact id; no second definition is introduced for their objects.

- Parent **ProfiniteCohomology** Layers 0, 2, 3, 5, 8–12 retain continuous module/cohomology carriers, exact sequences, cups, Kummer and all-degree restriction/corestriction. Layer 11 owns general dimension definitions, not arithmetic local-field values.
- **DGAInfinity** Layers 1, 8 retain strict dg and generic defining-system/Massey carriers. M.0 supplies the continuous instance/comparison; M.9 supplies the Hom coefficient specialization. For nontrivial Γ-action on a coefficient ring the DGA is over Z or the fixed subring.
- **ProfiniteProPGroups** Layer 5 retains weak embedding problems, continuous factor sets, abelian H² obstructions and splitting. Proper solutions are not required here.
- **ClassFieldTheory** Layer 5 supplies local finite duality in the stated characteristic range. The one-local ordinary characteristic-p bound comes from **HigherLocalFieldsAndHigherClassFieldTheory:HL.2/cohomological-dimension-and-tate-twists**. Neither current **LocalGaloisGroups** nor parent PC11 is assigned a new arithmetic calculation here.
- **ArithmeticGaloisDuality:R02.1** retains pointwise Hom, finite-domain discreteness, the splitting torsor and the connecting-cup comparison. This roadmap specializes those interfaces to the finite boundary sequence.
- **InverseGaloisAndArithmeticFundamentalGroups:IG.4** already owns `finite-galois-localization`, `restricted-poitou-tate`, `solution-twisting`, `grunwald-wang-boundary`, `independent-cyclic-eight-lifts` and `wang-cyclic-eight-counterexample`. Finite Sha duality and the independent degree 64 cyclic-eight splitting field are imported there. The handoff records this existing allocation so overlapping finite-duality work in AGD can point to that owner; this submission changes no supplier files.
- **HeightsRationalPointsPartIIHomogeneousMassey** owns the homogeneous-space construction, general unramified-Brauer formula, Brauer–Manin argument and global mod-p/rank-one vanishing theorems. It consumes this roadmap's finite algebra and local lifting. No reverse dependency on those geometric targets is introduced.
- The negligible-class split retains generic dimension at PC11, full signed Hochschild–Serre at AGD:R02.2, finite universal coefficients/Tor₁ at AGD:D7, and generic embedding/Galois-algebra interfaces at their existing PPG/IG owners. Its all-fields characteristic-p input must generalize the arithmetic supplier once, not duplicate dimension theory.

The current read-only TauCetiRoadmap and Tau Ceti library were searched in addition to the older atlas. DGAInfinity and ProfiniteArithmetic were read as nearby upstream models, together with the relevant PC/PPG/CFT/LocalGaloisGroups supplier sections and suggested files. In particular, current ProfiniteArithmetic's profinite powering, conjugacy and outer-action carriers are not replanned. Existing UT groups, transvections, filtration and its forward commutator estimate are baseline imports; the reverse equality and public support interface are new targets. Twenty baseline declarations were checked in actual pinned source and against the declaration index. The reviewed parent audit was used as an inventory, with source checks determining the precise missing interfaces.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ProfiniteCohomologyPartII.json`: **0 errors, 0 warnings**; all 12 stages planned, no unrecorded gap. A planned supplier contract does not mean its implementation is complete.
- `lean-check` elaborated **ProfiniteCohomologyPartII.lean**, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and TauCeti `f790474821cf4256814db967cb154e7af3d0c369`, with **only the expected proof-placeholder warnings**. Memory availability exceeded 20 GB. No build, dependency update, cache fetch or language server was started.
- The suggested file has 175 lines, three real-bodied light definitions and 16 theorem/example statements. It follows the current WORKERS/PACKAGE_REVIEW shape: no missing-carrier encodings, data placeholders, construction development or auxiliary lemma chains. Its closing comment names the README targets that need their supplier carriers. Power conjugacy is stated inside the derived subgroup itself.
- Independent scratch finite calculations confirmed the length-six F₂ example: fixed B-space dimension 6, fixed-class-image span dimension 5; among 4096 fixed-B candidates, 1036 admit a commuting lift and every one has 25-coordinate zero. The length-four example has 8 cyclically trivial cocycles and 4 coboundaries. All 256 auxiliary-cocycle products and 16 cyclic tests passed, and all 32 possible dual coboundaries failed to trivialize β.
- Cross-file checks cover all 111 API names and 89 definition/construction check names in the reader, all 71 routed targets, the 53-item split partition, acyclicity, at most 6 planets per layer, allowed paths, no copied source passages/excerpts and source-version metadata. The finite calculations are verification evidence, not Lean proofs.

## Sources and findings

Read the relevant HW preprint material through the end of the counterexample: Definition 2.1/Proposition 2.2/Corollary 2.3, pp. 4–5; pairing and Remark 3.4, pp. 9–11; finite-group arguments, pp. 11–18; Definition 5.2/Proposition 5.3/Lemma 5.5, pp. 18–22; Proposition 6.1 and examples, pp. 23–24; twisted coefficients and Theorem 7.5/Lemmas 7.6–7.7, pp. 24–31. The packet records exact per-node locators. Pagination is the 33-page arXiv:1904.06512v2 revision of 9 December 2021. The Duke 41-page version of record was not obtained; no finding is asserted about that unread text.

Read Michailov's 11-page arXiv:1308.3408v2, especially Theorem 3.1 Cases I–II, pp. 5–8; read Moravec arXiv:1203.3190 §2, pp. 3–4, Lemma 3.1/Theorem 3.2, pp. 4–6, and the opening of §4, pp. 9–10. Read Merkurjev–Scavia arXiv:2410.12560v1 introduction pp. 1–4 only for the independent split. Consulted the cleared-library index; no uncleared book was obtained or copied. The proof sources' URLs, hashes and reading ranges are recorded in the packet. All committed source descriptions are in our own words.

Twelve version-scoped, unreviewed findings are recorded, with correction, reason, reach and searches. The substantive ones concern unrestricted discrete Hom, the fixed-representative hypothesis in the twisted bijection, the literal characteristic-two outer exponent, the missing real-place proof, and Michailov's lower-central endpoint. The other findings repair a bound direction, coefficients, subgroup size, common-corner counting, a target typo, row/column notation and a gap-ℓ index. ArXiv histories, the HW author publication page and correction searches revealed no correction in the consulted sources. This is not a priority claim. Independent review must verify the findings and collate against the published texts when available.

## What remains

This design requires the normal independent review and the named supplier implementations; no layer is claimed formally closed. The independent negligible-class design needs its full source reading and proof decomposition. The HW publisher text needs version collation. The worker stops after submitting this job; the next independent design belongs to a fresh process.
