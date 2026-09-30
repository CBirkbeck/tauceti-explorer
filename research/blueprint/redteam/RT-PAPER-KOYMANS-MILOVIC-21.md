# RT-PAPER-KOYMANS-MILOVIC-21

Red team of the extraction PAPER-KOYMANS-MILOVIC-21: Koymans and Milovic, *Joint distribution of
spins*, Duke Math. J. 170 (2021) 1723–1755, read as arXiv 1809.09597v1. The red team is Claude
Code, session `cc-c2c06b`, 30 September 2026, issue #4186. The extraction is by `cc-fb70e5` and
its review by `cc-442dc5`. I did neither.

**Result: 2 findings, 1 medium and 1 low.**

## Findings

**1. Route 5 sends Conjecture C_n to a dropped layer. (error, medium)**
- Route 5 sends FIMR's Conjecture C_n (short real character sums) and its arithmetic-progression
  form, Corollary 2.2, to AnalyticNumberTheory:AN.6, "the statement register for conjectural analytic
  inputs".
- The accepted RS-07 dropped AN.6 on 21 September, the day before this extraction: "This is an
  export/register stage, not a separate mathematical construction". The AN packet closes it with no
  nodes. The review accepted route 5 anyway.
- None of RS-07's successor layers takes a conjectural character-sum bound:
  - AN.2 gets zero-free regions, and AN.3 RH/GRH;
  - AN.4 keeps only conditional *continuation* statements;
  - SV.3 gets prime-distribution hypotheses, and SV.4 prime tuples.
- No stage in the atlas mentions Burgess or short character sums.
- The only consumers of C_n are this paper's spin sieve and Theorems 1–2, which route 1 already sends
  to SV.5. SV.5 owns sieves "with their own bilinear … inputs".

**Fix.** Move items 11 and 12 onto route 1, stated as explicit, named hypotheses rather than
theorems, with Burgess's n = 3 case as a remark. Then drop route 5.

**2. There is no `sourceVersions` list. (other, low)**
- What was read is recorded only in the free text of readSections: arXiv v1 and its hash, and that
  the Duke version was not accessible.
- All eight source issues affect nothing, so the checker does not require the list.

## What held

**Unconditional input.** I downloaded arXiv v1; its hash matches. Every theorem is stated under
C_{|S|n} or C_{tn}, and the paper never invokes Burgess, so no unconditional input is missing.

**Routes and narrowed stages.** All 11 cited stage ids exist.
- ST.2 and ST.3 (RS-07) still fit route 2: the geometric-sieve tail estimates, and the governing
  fields with the 16-rank.
- CA.1 (RS-03) still keeps the Hilbert symbols at 2 and ∞ for route 3.

**Neighbouring extractions.**
- PAPER-BHARGAVA-GROSS-WANG-17 routes the geometric sieve to ST.2 too.
- PAPER-KOYMANS-PAGANO's Smith-method Part II imports ST.3's governing fields and 2^k-ranks
  "through PAPER-KOYMANS-MILOVIC-21", which matches route 2.
- No other extraction owns spins, FIMR's sieve, or Widmer's count.

**Statuses.**
- Tau Ceti has only the natural-density definitions, not Chebotarev's density theorem, so item 7 is
  rightly planned.
- The prerequisites cover every source a proof uses.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-KOYMANS-MILOVIC-21.result.json`: ok.
- No Lean was compiled.
