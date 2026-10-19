# BP-MotivesAndAlgebraicCycles--MC.2

Issue #10829; Codex, session `codex-exmfR8`. This is the completed target-level planning pass, submitted for independent review, not a checkpoint and not a claim that MC.2 is closed or implemented.

## Delivered

- Follow-up packet `research/blueprint/packets/MotivesAndAlgebraicCycles--MC.2.json`: eleven new targets, 39 API items, twenty tests, seven checked baseline references, five supplier requests and three explicit gaps. All implementation statuses remain unchecked.
- Definitive reader `research/blueprint/readmes/MotivesAndAlgebraicCycles--MC.2.md`: the three realization constructions, cycle maps and first-Chern normalization, correspondence/projector/Tate extension, two named motivic comparisons, exact quotient criterion and worked curve divisor/trace acceptance calculation.
- Compact suggested file `research/blueprint/suggested/MotivesAndAlgebraicCycles--MC.2.lean`: two range/kernel statements on existing linear-map carriers. Heavy geometric carriers, APIs and all geometric tests remain in the reader under the current maintainer rule. No admitted data, opaque substitutes or admitted examples.

The twenty-five inherited MC.2 nodes remain in the whole-roadmap packet and must be imported by id at assembly. Their five existing planets plus the new **Normalized realization comparisons** give six in total. No other stage was changed; RS-08's MC.4 rescope does not narrow MC.2. No mathematical ownership moved between tiers.

## Remaining supplier work and review priorities

1. C5's existing proper de Rham–Betti and multiplicative-period nodes need the exact arbitrary-characteristic-zero base-change/cocycle, first-Chern sign and normalized-trace contracts, plus shared Betti/analytic Gysin and divisor-support exports. The packet records the precise maps/equations.
2. All-degree finite Artin comparison needs an accepted owner-level node with coefficient reduction, cup, Kummer and trace compatibility. SF.6 is process-only and proposes C7; no C7 theorem exists to import. The request stays at existing C5 pending the maintainer's ownership decision.
3. SF.2 must identify the native pinned pro-étale carrier with the derived finite-coefficient tower, retaining lim¹ until Mittag–Leffler is proved, then rationalize with operation/Galois/trace compatibility. EDC's classical rational duality and cycle nodes do not establish that identification.

Independent review should concentrate on the negative-dlog convention, the line map `t_dR↦(2πi)⁻¹t_B`, the inverse finite site-comparison direction in Betti→étale, and the homological-versus-numerical ideal containment. General-field realization uses MC.1's universal property directly; it does not apply the inherited algebraically-closed-base theorem outside its hypotheses. Rational divisor Chern classes are extended ℚ-linearly from integral divisors, without assigning a line bundle to a nonintegral divisor.

The baseline audit (AUDIT-35 and accepted REV-AUDIT-35) and pinned declarations were read. The newer read-only roadmap tree at `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were screened, including the nine newer roadmaps; AlgebraicTopology, DifferentialGeometry and AlgebraicVectorBundles boundaries were checked. No duplicate topology, smooth de Rham theory or linear-algebra image construction is planned.

## Sources and incidental findings

All source reading used public sources, recorded in the packet with editions, hashes and theorem/section/page locators. No restricted library file or passage was copied. No source passage or section-by-section source summary is included in the deliverables.

The packet continues the inherited source-issue numbering with E48–E50. E48 is the revised Deligne82 transcription's incorrect first-Chern “isomorphism”, corrected already in the original scan. E49 is the omitted alternating factor in the structure-sheaf Chern formula, checked by a point on ℙ² and Grothendieck 1958 §4.3 (15)–(16). E50 records the A9 invocation under the A1–A8 statement in Stacks 0FIT/0FIU, as a proof-dependency gap rather than a false-theorem verdict. Original/revised author copies, the DMOS addendum and live Stacks comments were checked. The present constructions avoid reliance on the problematic formulas/proof. These findings still need the job's independent review; no separate source/errata/red-team job was claimed.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/MotivesAndAlgebraicCycles--MC.2.json`: **0 errors, 0 warnings**; MC.2 planned, zero stages closed.
- `lean-check research/blueprint/suggested/MotivesAndAlgebraicCycles--MC.2.lean`: **elaborated successfully** against pinned Mathlib `082e2d37e8`, with only the two expected declaration-uses-`sorry` warnings. Available memory was 74 GB before starting; no language server or library build was started.
- All ten source PDF hashes matched the packet. Every new target, all 39 API names and twenty tests occur in the reader; both suggested theorem names agree with the packet.
- `git diff --check`: passed.

Resume at independent review and the three supplier frontiers above. There is no unfinished writing or implementation promised by this planning job.
