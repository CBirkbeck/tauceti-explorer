# BP-PrismaticCohomology~2 — blocked checkpoint

Issue #10119; Codex, session codex-ruVgAp; 2026-10-17. The bot confirmed claim comment 6232735943 in comment 6232737185. This is an unfinished revision checkpoint, not a completed blueprint or an independent review. No second job was claimed.

The required whole-roadmap serialization still conflicts with the checker and the four-file issue scope. This run independently reproduced the blocker **after merging source and baseline metadata**: exactly 361 duplicate-ID errors and no other errors. The packet remains `partial`, with all nine stages partial. Its historical `review` applies to the previous seven-node version; neither the previous general-envelope addition nor this run's formal-affine addition has independent review.

## Blocking scope decision

WORKERS.md, “Doing the work”, says: **“Edit only the files the issue names, plus your own scratch space.”** Issue #10119 names the top packet, reader, suggested file and this handoff. The retained part packets, checker and submission/intake machinery are outside that scope. A scope extension was requested during this session; none was received before submission. No out-of-scope file was changed.

The independent review requires the top packet to serialize the retained 290 PR.0–PR.7 nodes and 79 PR.8 nodes, preserving their IDs. `imports` is provenance: the importer does not expand it. `check_blueprint.world()` visits the retained part files before the top packet, and `check()` rejects an ID already owned by another blueprint file of this roadmap. Renaming mathematical targets would duplicate notions and discard canonical identities.

Reproduction, without changing the checker or its context:

1. Load the top packet and `PrismaticCohomology--PR.0.json` and `PrismaticCohomology--PR.8.json`.
2. In scratch, union `nodes` by `id`, `sources` by `id`, and `baseline.declarations` by `ref`, keeping top records first. Write a scratch file named `PrismaticCohomology.json`.
3. Call `check_blueprint.check(scratch_path, None, check_blueprint.world())` to inspect the full error list; the CLI displays only its first 200 errors.

This yields 378 nodes, 154 baseline declarations and 54 planets; **282** duplicate-ID errors against PR.0 and **79** against PR.8, total **361**, with **zero other errors**. Eight inherited IDs first resolve to integrated decomposition nodes and escape that particular check. The 305 warnings are inherited metadata warnings, not validation of a finished assembly. This minimal reproduction deliberately does not merge all gaps, requests or sourceIssue verdicts and is not a submission candidate.

**Maintainer action needed before another same-scope assembly attempt:** establish an explicit assembly/part lifecycle in checker and promotion, or authorize archiving the superseded research parts while preserving their historical reviews and provenance. The submission allowlist and intake also need to accept the chosen lifecycle operation; permitting a deletion alone is insufficient. Do not edit promoted atlas data. Another worker with the same four-file scope will encounter the same blocker.

## Progress saved in this run

Added `PR.5/formal-affine-complete-qcoh`, specifying the equivalence between the ordinary-ring pointwise D(Spf A) and the **unbounded** derived (p,I)-complete category for a bounded prism. Seven API entries specify evaluation, unit, completed tensor, completed colimits, completed pullback and reconstruction from compatible reductions. Four discriminating tests cover Q_p being killed by completion, the completed countable coproduct of Z_p, Tor in reduction of F_p, and shifts in every degree.

The two top-level descent/direct-image targets now depend explicitly on that target. Two other bare DD.1 prerequisites were refined to the existing animated completion, quotient completeness and completion-exchange nodes, so removing the misplaced geometric request does not leave unexplained supplier-stage citations. R1 lists it as a candidate supplier for inherited formal consumers, without applying any retained-part rewrite. The reader has the same API and tests, and marks the inherited arbitrary nonflat pushforward inference as withdrawn. The suggested file lists missing carriers and all new API/test names; no placeholder carrier or data axiom was introduced.

DD.1 already owns algebraic completion, complete-category colimits and completion/tensor exchanges. Its old top-level request for the entire geometric comparison was removed because that comparison now has a precise owner in PR.5; **the proof obligation was retained as a PR.5 gap**, not declared supplied by DD.1. The remaining obligation is unbounded effectivity: for a compatible system M_n over A/((p)+I)^n, prove that derived reduction of Rlim M_n recovers each M_n, and establish coherent completed pullback/tensor compatibility. Do not infer this by commuting tensor with an inverse limit.

Fresh source reading, in the public PDFs identified and hashed in the packet:

- Bhatt–Lurie, *Absolute prismatic cohomology*, arXiv v1, Proposition 3.2.8 and Corollaries 3.2.9–3.2.10 with proofs, pp.41–43; §3.3, pp.43–45. The paragraph before Proposition 3.3.5 states the full bounded-prism comparison; Warning 3.3.6 explains the boundedness boundary. Lemma 3.3.10 and the following paragraph give the complete-module Čech description and completed transitions; Corollary 3.3.11 gives global sections.
- Lurie, *Spectral Algebraic Geometry*, February 2018 manuscript, §8.2.4, pp.647–652 and §8.3.4, pp.666–669. Corollary 8.2.4.15 describes spectral formal QCoh using complete modules; Corollary 8.2.4.22 gives completed tensor. Theorem 8.3.4.4 compares **connective** formal complexes with functorial QCoh, with the almost-connective extension in Corollary 8.3.4.6. Remark 8.3.4.5 leaves the unrestricted spectral comparison open. Do not cite that theorem as the missing unbounded ordinary-ring effectivity proof.

Correction to the previous handoff's continuation item 3: BL **Corollary 3.2.9 proves affineness**; **Corollary 3.2.10 gives flatness iff transversality** for bounded prisms. The latter, not the former, supports the flat ordinary-point base-change specialization. The historical independent review is outside this issue's edit scope and was not rewritten.

No source passages, excerpts or source files were committed. Read current TauCetiRoadmap at 0d144d044dacebca17b654695b6f1ad58f159b27 and current Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 read-only, including AlgebraicVectorBundles and the DG/enhanced-module boundary in DGAInfinity. Ordinary scheme QCoh and DG modules do not supply this bounded-prism formal comparison. Read the relevant reviewed AUDIT-38 prismatic coverage; `data/library-coverage.json` has no PrismaticCohomology entry. No new baseline declaration was introduced.

## Earlier work preserved

The previous checkpoint's `PR.0/general-prismatic-envelope` remains a bounded-orientable-base target for arbitrary delta-pair kernels, distinct from regular-envelope complete flatness. It has five API entries and four tests. Its transfinite delta torsion-removal/completion realization is still a gap. Bhatt Lecture V Lemma 5.1 is a sketch over a bounded base; Koshikawa I Proposition 3.1 states a stronger orientable-base range. The unbounded-base extension and the initial log prism's QRSP regular-presentation reduction remain separate obligations. This run did not newly read or recertify those sources.

The 369 inherited targets, 54 planets, 91 sourceIssue verdicts, historical reviews and exact supplier requests still require preservation in the eventual assembly. The retained part packets and independent review were left unchanged. R1–R7 remain proposals; neither generic formal-QCoh planning nor the general-envelope target justifies blanket consumer repointing.

## Resume after the scope decision

1. Serialize the effective graph with the authorized lifecycle, preserving canonical IDs, historical reviews, source issues and exact metadata. Remove inherited excerpt fields rather than moving them into the assembled artifact. Reconcile source IDs/editions carefully; the reproduction's first-record union is only a blocker test.
2. Refine bounded-prism formal-affine effectivity and coherent complete-module operations. Apply the corrected flat affine theorem only to appropriate consumers; individual unbounded-prism comparison is not provided.
3. Resolve the general-envelope transfinite proof, unbounded-base range and QRSP regular-presentation reduction. Do not conflate general existence with bounded output or flatness.
4. Reconcile completed q-framing topology, quotient completeness, A_inf (p,ξ) versus (p,q−1), infinite-coordinate summability and extra-direction naturality. Retain the QW.6 request until the actual consumer range is covered.
5. Apply justified R1–R7 changes to the effective graph and reader. Preserve the trace-square, syntomic/derived-de-Rham and Fargues–Fontaine schematic/analytic dictionary and construction-matching gaps; AdicSpaces supplies only its stated adic quotient construction.
6. Run the unmodified checker and Lean. Submit a completed revision only when the effective artifact satisfies the independent review. This checkpoint does not finish the job or modify atlas data.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PrismaticCohomology.json`: **0 errors, 0 warnings**; 9 nodes, 46 API entries, 24 tests, 8 gaps, 7 requests; no stage claimed planned/closed.
- `lean-check research/blueprint/suggested/PrismaticCohomology.lean`: **exit 0**, 22 warnings, all uses of `sorry`; no other warning/error. Checked memory first: 96 GiB available. Lean changes are documentation only.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/PrismaticCohomology.lean`: exit 0. Suggested file is 261 lines.
- `git diff --check`: passed. Only the four issue deliverables changed. Scratch is removed after opening the checkpoint PR; continuation information is contained here.
