# PAPER-SKOROBOGATOV-SOFOS-23 — partial checkpoint

Worker: Codex, session `codex-a71f92`; issue [#1256](https://github.com/CBirkbeck/tauceti-explorer/issues/1256).
Claim comment 5778218247 was confirmed by bot comment 5778220607. One job only; no upstream atlas or library files changed.

## Done

Read all 67 pages of the published paper, including proofs and references. Compared only the arXiv v3 introduction and Lemma6.6, not the whole version. Recorded provenance and limits of the later-paper/correction search.

The result has 91 items (6 library, 6 planned, 79 missing), 29 definitions, 87 API contracts and 59 proposed tests. Each missing item has exactly one of seven routes. There are 22 source findings awaiting independent review; E18 is already corrected in arXivv3.

Executed 374 exact rational local-model checks, mod4 enumeration through degree6, and an exact Euler-product tail certificate. The report embeds the complete standalone Python script and gives a general-degree proof of the mod4 count.

## Crucial next step

Do not make the printed Lemma3.14 a theorem target. For d=k=Ω=1 its left side is exactly Σ_{a=1}^Hθ(H+a)~(3/2)H², not2H². Repair positive/negative/zero-value handling, obtain a valid uniform real-region estimate, and propagate it through the dispersion proof. This is not a disproof of the main theorems.

Then close G2–G10 in the JSON: original analytic and local-global suppliers, remaining fine lemma extraction, prime-power deletion, simultaneous-in-x exception sets, and full version/correction review. No author contact has been made.

## Resume map

- Items1–25: coefficient-family and local probability interfaces.
- Items26–50 plus88–90: analytic chain and explicit obstruction.
- Items51–68 and91: norm families and Brauer interfaces.
- Items69–82: conic bundles, characters and repeated-polynomial correction.
- Items83–87: explicit mod4 and Euler-product lower bound.
- Report: mathematical counterexamples, seven route explanations, exact finite certificates.
- JSON completionGates: precise remaining tasks, all open.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-SKOROBOGATOV-SOFOS-23.result.json` — passed.
- `python3 research/blueprint/intake.py check-files` on exactly the three deliverables — 3 files, 0 problems.
- Custom item/route audit — 91 unique resolved IDs, acyclic dependencies, all 79 missing items routed exactly once, API/tests and consumers present for all 29 definitions.
- Re-executed the certificate extracted from the report itself — all 374 rational identities, mod4 enumerations and exact tail-bound checks passed.
- Fresh publication snapshot had no prior SS23 deliverables or AGENTS.md; binding instructions, reviewed audit, and both PartII parent extracts remained unchanged.

No Lean file is authorized or delivered for this paper job. No Lean compilation or Lean test execution was performed. The Python finite checks are not formal proofs.

Publication base: `2b68718fe486e286620941d9c7d2fe5fc92ac4ca`; mathematical atlas inspection: `6660b3c597a8c70872eeb63f3d01a198cfeb0dd9`. Binding protocol and reviewed-audit hashes remained unchanged.
