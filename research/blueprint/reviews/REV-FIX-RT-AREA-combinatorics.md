# REV-FIX-RT-AREA-combinatorics

Independent review of FIX-RT-AREA-combinatorics (Claude Code, session `cc-39fac3`, issue #3989, PR #4635) for issue
#5164.

Reviewer: Claude Code, session `cc-c2c06b`, 30 September 2026. I did not write:
- RS-03 or its first review;
- the red team (`cc-2aeb03`) or its verification (`codex-7e92bd`);
- either round of fixes.

**Verdict: accepted.** No correction was needed.

**What I reviewed.** The only file under review is `research/blueprint/restructure/RS-03.result.json`. The fix report
routes three findings to it: /3, /14 and /16. I read:
- those findings, their verdicts and the fixer's sections on them;
- the diff of the fix commit (a2194142) for RS-03;
- the stage texts of AC.0, AC.2, ER.4 and ER.5 in `data/atlas.json`;
- `data/library-coverage.json` and the job files `AUDIT-06.json` and `AUDIT-16.json`.

The fixer handled the other 33 confirmed findings as maintainer edits or notes, outside this file. The round-2 fix
(FIX-RT-AREA-combinatorics~2) later sent them to the blueprint jobs. They are not reviewed here.

**The diff.** Round 1 changes exactly four things, and nothing else:
- a new layer entry `AdditiveCombinatorics:AC.2`, action `narrow` (/3);
- a new link AC.0 → EllipticRegulators:ER.4 (/14);
- ER.4 added to the `formerly` list of the owner entry "Missing arbitrary finite-abelian Fourier
  normalization/comparison interface" (/14);
- "AUDIT-06" → "AUDIT-16" in AC.0's `suppliedBy` and in the matching owner entry (/16).

A later commit, e3064573 (round 2, PR #5210), rewrote only the reason of the AC.0 → ER.4 link. It is the subject of
REV-FIX-RT-AREA-combinatorics~2 (#5165). Here I check only that it keeps round 1's link and its normalization.

**Checks.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-03.result.json`: ok, before and after my
  review object. The file has 23 layer entries (22 narrow, 1 keep), 64 links and 25 owner entries.
- `research/blueprint/intake.py check-files` on the two deliverables: no problems.
- I re-ran `apply_restructurings` in `scripts/restructure.py` read-only against `data/atlas.json`:

| RS-03 used | RS-03 links added | Narrowed layers | Skipped stage-to-stage links | ER.4 `requires` AC.0 | Cycle |
|---|---|---|---|---|---|
| promoted copy, among all 31 proposals | 63 | 21 | none | no | no |
| this file, in place of the promoted copy | 64 | 22 | none | yes | no |
| this file alone | 64 | 22 | none | yes | no |

The only differences are the new edge AC.0 → ER.4 and the AC.2 narrowing. Across all proposals the skipped entries are
the same 134 in both runs, and none of them joins two stages.

## /3 (medium, library-claim): AC.2 imports Roth, Behrend and van der Waerden. Right.

**The imports.** The verifier asked AC.2 to use the pinned theorems instead of re-proving them. All five declarations
are in the declaration index at the cited places at Mathlib 082e2d3:

| Declaration | File and line | Checked content |
|---|---|---|
| `roth_3ap_theorem` | `Mathlib/Combinatorics/Additive/Corner/Roth.lean:137` | hypotheses `0 < ε` and `cornersTheoremBound ε ≤ card G` |
| `roth_3ap_theorem_nat` | same file, line 163 | hypothesis `cornersTheoremBound (ε / 3) ≤ n` |
| `rothNumberNat_isLittleO_id` | same file, line 196 | the o(N) form |
| `Behrend.roth_lower_bound` | `…/AP/Three/Behrend.lean:481` | `N * exp (-4 * √(log N)) ≤ rothNumberNat N` |
| `Combinatorics.exists_mono_homothetic_copy` | `Mathlib/Combinatorics/HalesJewett.lean:459` | a monochromatic homothetic copy of a finite set |

`cornersTheoremBound` (Roth.lean:74) is defined through `triangleRemovalBound`, so "tower-type" is a fair description.

**What AC.2 keeps.** AC.2's stage text asks for Roth/Szemerédi, arithmetic removal and a proved correspondence between the
finite and infinite forms. The narrowing keeps everything the imports do not cover:
- Szemerédi's theorem for k ≥ 4;
- k = 3 bounds stronger than the imported one;
- the Varnavides count and the correspondence. The index has no upper or Banach density at the pin, only Schnirelmann
  and Dirichlet density.
- the arithmetic removal lemma. I checked its citation, Král'–Serra–Vena, arXiv:0804.4847v1, Theorem 2 (p. 2), against
  the PDF (SHA-256 `dea848ae1941e898b390aa71b1b32efbc404a46b7016747dea0e1359831dba1b`, as in the fix report). Theorem 2
  is the removal lemma for x_1⋯x_m = g in a finite group of order N. This matches the /2 fix and the verdict on it.

**The ThreeAPFree remark.** It is right. `ThreeAPFree` is the additive form of `ThreeGPFree` (AP/Three/Defs.lean:72):
a + c = b + b implies a = b. In a group of exponent two, a + a = b + b always holds, so the triple (a, b, a) with a ≠ b
witnesses failure.

**The audit.** The verifier said AUDIT-16's Roth evidence is already present and its "partly built" verdict is right.
The reason says both, and `data/library-coverage.json` still lists `roth_3ap_theorem`, `roth_3ap_theorem_nat` and
`corners_theorem` for AC.2 with that verdict. The supplier is UPSTREAM, so no §15 forwarding link is needed. REV-RS-03
decided the same for the other UPSTREAM suppliers.

## /14 (medium, duplicate): ER.4 consumes AC.0's finite Fourier interface. Right for RS-03.

**What the verifier asked for.** Reconcile ER.4's finite transform on C-torsion with the finite-abelian interface that
RS-03 gives to AC.0. Do not rebuild the generic character theory, and impose no whole-stage coding prerequisite.

**The RS-03 part.** RS-03 now does two things:
- The link AC.0 → ER.4 records the reuse contract. The ER.4 stage text ("Establish the finite Fourier transform on
  C-torsion") is where the duplicate sits.
- ER.4 is added to the owner entry's `formerly`, which keeps AC.0 as the single owner of the missing interface.

**Order and prerequisites.**
- ER.4 does not reach AC.0 over the atlas stage edges and `requires`, plus every research link file and every RS link.
  The link closes no cycle, and the replay above adds it.
- RS-03 has no link from AlgebraicCodingTheory into AC.0, so no coding prerequisite is imposed.

**The normalization.** Round 1's reason calls Lecture 11's factor 1/C the unitary normalization on a group of order C².
The C-torsion has order C², and |G|^{−1/2} = 1/C, so this is right. It agrees with the EllipticRegulators README (line
87: "normalized by 1/C … it is not the ordinary 1/C² average"). The round-2 reason keeps that statement and the
link itself.

**Outside this file.** The comparison obligations and the audit citation are the fixer's maintainer edits (README AC.0,
AUDIT-16's note), and round 2 moved them to the blueprint jobs.

## /16 (low, error): AUDIT-16, not AUDIT-06. Right.

- `AUDIT-06.json` covers FuchsianOrbifolds, OneParameterSemigroups, OptimalTransport and AnalyticNumberTheory.
- `AUDIT-16.json` covers ModularForms, AdditiveCombinatorics, AlgebraicCodingTheory and DenseGraphLimits.
- `data/library-coverage.json` records AUDIT-16 on AC.0 and AC.2.

Both strings in the file now read "(AUDIT-16; canonical audit pins)", and no "AUDIT-06" is left. The pin and the imports
are unchanged, as the verifier required.

## My review object

It replaces REV-RS-03's review object. That object's count of "21 narrow" was out of date after the AC.2 entry, and my
notes give the current count. Its `corrections` list goes with it; REV-RS-03.md keeps the record of those 42
forwarding links, which are unchanged in the file.

## For the maintainer

- **Promotion.** `data/restructure/RS-03.result.json` still has "AUDIT-06" and has neither the AC.2 entry nor the
  AC.0 → ER.4 link until this file is promoted.
- **RS-03.md.** The fixer's two edits to `research/blueprint/restructure/RS-03.md` are still pending:
  - line 32: "AUDIT-06" → "AUDIT-16";
  - line 110: the AC.2 row.
