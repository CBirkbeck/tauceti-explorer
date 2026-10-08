# Handoff: BP-DeligneWeightsAndPurity--DWP.0~2

Completed revision for [issue #6953](https://github.com/CBirkbeck/tauceti-explorer/issues/6953) by Codex, session `codex-aflhpc`, on 2026-10-08. This is a completed target-level planning revision, ready for independent review, not a checkpoint or a formalization claim.

## Result and scope

The independent review had already corrected the packet and suggested signatures. Its acceptance blocker was the reader's disagreement with that packet. This revision synchronizes all 83 reader entries, including every statement, hypothesis, API specification, test, proof step, acceptance check, direct input, use and source locator. It also synchronizes the 28 supplier contracts, 29 baseline declarations, four source boundaries and all eight source issues. The introduction, proof-order explanation and ownership proposals remain connected to those specifications.

All 34 corrected nodes and both added nodes listed in `research/blueprint/reviews/REV-DeligneWeightsAndPurity--DWP.0.md` were checked against their mathematical arguments and cited passages. Their corrected specifications stand. Every existing node id, statement, dependency, API, test and planet is preserved. The packet's historical top-level `review` object remains unchanged: its `needs_changes` verdict describes the previous submission, and the next independent reviewer must replace it. In source issue E1, the author's short proof-warning quotation is paraphrased, including in the recorded confirmation reason, to comply with the standing source rule; its independent verdict and attribution are preserved. There are no `excerpt` fields or source passages in the deliverables.

Only the issue's packet, reader, suggested file and this handoff are changed. No atlas data, accepted route, restructuring result, upstream roadmap or other worker's packet is edited.

## Mathematical agreement

The reader now states d(1−πᵐ)=+1 and explains the finite étale multiplicity-one kernel argument for abelian-variety point counts. It imports the added distinct-position exterior-spectrum theorem for the higher cohomological factors. This includes ∧⁰, degrees above the rank, multiplicities and nonsplit Jordan blocks, without semisimplicity.

Weil I's dimension induction uses the half-unit interval inherited from dimension d−2, shifted by the (−1) twist. Exact purity enters only after arbitrarily large even Cartesian powers remove that error. Every vanishing-cycle case, the radical, skyscraper contributions and the filtration use of Leray remain present. The relevant source is Weil I Lemmas 7.1–7.2 and §7.3, printed pp. 298–301.

With the source convention ω₁=q^(−deg), the compact-form norm exponent gives weight −2Re(r). The Tate-character counterexample detects the printed positive-sign error in Weil II (2.2.8)(i), p. 195, repeated in (3.5.1), p. 211. The reader now includes source issues E7 (finite-index central degree, 1.3.10(iv), p. 160) and E8 (that repeated sign).

Other synchronized corrections include the invertibility requirement for numerical twist translation, the singular-zero regression test, the characteristic-zero boundary for formal logarithms, lisse versus constructible Weil descent, geometric connectedness, exact extreme-degree and j_* duality suppliers, and the per-degree conditional-Haar contract. The added determinantal functoriality theorem uses rank capacities for exterior sums and a dominant-normal finite-index fundamental-group contract. Normal-scheme curve reduction is a precise Part II request, not the narrower projective-pencil Bertini input. The square-improvement cover is finite surjective between smooth curves; the cover morphism need not be smooth. Companion nearby-cycle and Newton conclusions remain imports with corrected locators.

Milne's III.11.2 proof warning is retained as an unfinished source calculation; the reader no longer claims a certified repair. The trace/Jacobian supplier must furnish the actual fixed-point theorem. Schiffmann's half-weight normalization and density-owner boundary, and Yu v5's tensor–Hom order, remain explicit version-specific corrections.

## Counts and coverage

The packet has 83 nodes: 8 definitions, 4 constructions, 12 lemmas and 59 theorems; 81 API items; 44 tests; 27 planets; 29 pinned baseline declarations; 28 supplier requests; two explicit gaps; and eight source issues.

| Stage | Nodes | Coverage |
| --- | ---: | --- |
| DWP.0 | 18 | planned |
| DWP.1 | 9 | planned |
| DWP.2 | 11 | planned |
| DWP.3 | 11 | planned |
| DWP.4 | 3 | planned |
| DWP.5 | 19 | planned |
| DWP.6 | 5 | planned |
| DWP.10 | 7 | planned |

Every in-scope target is planned at target granularity, within the issue's approximately 300-node budget. None of the eight stages is closed. Every `implementationStatus` remains `unchecked`.

## Sources and verification

Read the worker instructions, both protocols, upstream guide, issue, original author handoff, independent review, reviewed library audit and binding RS-17 result. ArithmeticDirichletSeries and CompactGroups supply the upstream density/style comparison. The exact source and supplier boundaries are retained in the reader and packet, rather than replanning upstream work.

The six public PDFs match every recorded SHA-256. Rechecked the correction-facing passages of Weil I, Weil II, Milne's abelian-variety and curve estimates, Yu's public v5 and Schiffmann's published/preprint comparison; the packet's appended reading records give the precise theorem, section and printed-page ranges. The source-version history is retained. No restricted library book was used, and no source file is committed.

All 29 Mathlib baseline declarations and their surrounding hypotheses were read at `082e2d37e8b0463410cdb532e111cd43d5a66174`. The Tau Ceti pin remains `f790474821cf4256814db967cb154e7af3d0c369`. Exterior construction and basis declarations are not presented as the missing spectral theorem; the field-classification ring equivalence is not presented as an extension of a prescribed base embedding.

Checks:

- `python3 scripts/check_blueprint.py research/blueprint/packets/DeligneWeightsAndPurity--DWP.0.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/DeligneWeightsAndPurity--DWP.0.lean`: **exit 0**, **89 warnings, all for `sorry`**, no errors or other warnings. The final file was checked in the existing pinned shared build, with over 100 GB available beforehand. No library build, cache fetch or language server was started.
- Reader/packet agreement checks cover all 83 nodes and their specification fields, all API/test names, every source locator and match, baseline rows, contracts, source issues and internal anchors. Original node data, coverage, baseline, requests and historical packet review compare equal to the base revision.
- All 65 uninstantiated target schemas in the suggested file match the packet's statements and direct inputs. Every API/test name is either expressed or explicitly omitted, with no unknown omissions. The file expresses **52 API names and 30 test names**, and records **29 API names and 14 test names** awaiting genuine owner interfaces.
- `git diff --check` passes; changed paths are restricted to this job's deliverables.

## What remains and where to resume

This revision is complete. Independent review should check the reader's corrected mathematical assertions against the preserved packet and replace the historical review verdict. The original report supplies the full 34-correction/two-addition checklist. No scratch file is needed to resume.

Supplier closure still requires the 28 exact contracts, plus the two retained obligations:

1. Establish compatibility with a prescribed countable-subfield embedding in the complex-isomorphism construction; the existing classification theorem alone is insufficient.
2. Instantiate geometric and representation/analytic signatures using their genuine owner interfaces. The suggested-file ledger identifies missing API/test names and their suppliers. Its subgroup, stalk-family and valuation cores are mathematical abstractions, not constructed schemes or sheaf categories.

The accepted RS-17 ownership and existing companion DWP.7–DWP.9 declarations remain binding. The recorded DWP.5 sublayers, equidistribution placement and upstream Part II proposals await their own review/application; they do not authorize edits outside this job. No second issue is claimed in this run.
