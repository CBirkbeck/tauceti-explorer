# REV-RT-PAPER-KOYMANS-MILOVIC-21

**Complete: both findings are confirmed, and both fixes are corrected.** Finding 1's destination changes from SV.5 to ES.0. Finding 2's proposed "published" entry is dropped. The fixer follows the reasons in the verdict file, not the red team's fix text.

- **Job:** Refs #4185.
- **Verifier:** Claude Code, session `cc-f805bf`, 30 September 2026.
- **Independence:** other sessions did all the earlier work on this paper:
  - the extraction PAPER-KOYMANS-MILOVIC-21 (cc-fb70e5);
  - its review REV-PAPER-KOYMANS-MILOVIC-21 (cc-442dc5);
  - the red team RT-PAPER-KOYMANS-MILOVIC-21 (cc-c2c06b).

  The string `cc-f805bf` occurs in none of the red-team, extraction or review files for this paper.
- **Disclosure:** this session red-teamed PAPER-KOYMANS-PAGANO (#4705). That work compared this extraction for overlapping owners: ST.5, SV.2, and Legendre-symbol bilinear estimates. It said nothing about route 5 or `sourceVersions`. This session also wrote FIX-RT-AUDIT-07.
- **Verdicts:** [`research/blueprint/redteam/RT-PAPER-KOYMANS-MILOVIC-21.review.json`](../redteam/RT-PAPER-KOYMANS-MILOVIC-21.review.json). `python3 scripts/check_redteam.py` on it reports `ok`.

| Finding | Severity | Verdict |
| --- | --- | --- |
| /1: route 5 sends Conjecture C_n to the dropped AN.6 | medium | confirmed; the fix goes to ES.0, not SV.5 |
| /2: no `sourceVersions` list | low | confirmed; one preprint entry, no "published" entry |

## Evidence

**Paper.** I read [arXiv 1809.09597v1](https://arxiv.org/pdf/1809.09597v1), fetched 30 September 2026. Its SHA-256 `d56a738a…f433` matches the extraction's record. Sections read:
- the introduction (pp. 1–3);
- §2.5 and §2.6 (pp. 6–7);
- §3 up to (3.6) (p. 9).

The version of record is Duke Math. J. 170 (2021) 1723–1755. It was not read, as for all earlier work. Neither finding depends on its wording.

**FIMR.** I read [arXiv 1110.6331v2](https://arxiv.org/pdf/1110.6331v2), SHA-256 `b51c25e1…1b44`: the introduction, Proposition 6.1, and §9 "Direct Estimates for Character Sums" (PDF p. 39).

**Repository.** Read at `ff8656a9`. None of the files involved has changed since the red team's input `d4afbc98`. No Lean was compiled; neither finding needs it.

## /1: Conjecture C_n has no live owner (confirmed, with a different owner)

**The dead owner.**
- Route 5 sends items 11 (Conjecture C_n) and 12 (Corollary 2.2) to AnalyticNumberTheory:AN.6.
- RS-07 drops AN.6, and the drop is already in the REV-RS-07 commit `61767904` (21 September, 17:35 UTC). That is before the extraction (22 September) and its review (23 September). The review accepted route 5 unchanged.
- The AN packet closes AN.6 with no nodes.
- RS-07's owners list spreads AN.6 over AN.2, AN.3, AN.4, SV.3 and SV.4. None of these takes a bound for short character sums.
- The atlas extract of AnalyticNumberTheory still prints AN.6 with its old text, which probably misled the extraction.

**Where C_n belongs.** The paper introduces C_n as "a conjecture on short character sums". FIMR §9 puts it right after Burgess's bound:
- Corollary 9.1 takes r = 6, which gives N^{5/6} q^{7/144+ε}.
- With N ≤ Q^{1/3} this is Q^{47/144+ε} = Q^{(1−1/48)/3+ε}, so C_3 holds with δ = 1/48.
- For n > 3, "nothing useful is available at present … (except in the case of special moduli, cf [IK])".

So C_n is character-sum mathematics. The atlas already owns that at ExponentialSumsAndCircleMethod:ES.0:
- ES.0 does "completion of sums; connect to finite-field character-sum producers", with input FF.2.
- Its packet carries the Graham–Ringrose smooth-modulus estimate: the "special moduli" case, routed there by the accepted PAPER-BENNETT-SIKSEK-20.
- RS-07 moved each conjectural input to the owner of the matching unconditional theory: GRH to AN.3, Elliott–Halberstam-type hypotheses to SV.3, prime tuples to SV.4. That rule puts C_n at ES.0.

**Against the red team.**
- SV.5 is a sieve stage.
- C_n is also consumed at ST.3: Theorem 3 (item 28) assumes it. The red team's "only consumers" leaves this out.
- The next consumers are FIMR itself and Koymans–Milovic IMRN, the source of Corollary 2.2. PROTOCOL §15 plans a notion once, at its owner; it should not be imported from a sieve application.
- "No stage mentions short character sums" holds for the atlas stage texts only. It misses ES.0's packet.

**Corollary 2.2, re-derived.**
- Put d = gcd(q, k) < q. Then χ_d is constant on the progression.
- Since q is squarefree, gcd(q/d, k) = 1.
- So the sum is a short sum of the non-principal χ_{q/d}, of at most N ≤ q^{1/n} terms.
- C_n with Q = q gives q^{(1−δ)/n+ε}, the E2-corrected form.

It is a character-sum consequence of C_n and belongs with it.

**Fix for the fixer.** Edit PAPER-KOYMANS-MILOVIC-21.result.json and the route-5 paragraph of its `.md`:
- Keep route 5 at position 5, since accepted routes are matched to review verdicts by position. Retarget it to `ExponentialSumsAndCircleMethod:ES.0` with a new reason.
- Rewrite the notes of items 11 and 12. Their statements, statuses and locators are unchanged.
- Add one sentence to route 1's reason: items 14, 23 and 24 import C_n and Corollary 2.2 from ES.0 as explicit hypotheses.
- Do not move the items to route 1.
- Do not edit the paper review. This verdict supersedes its route-5 reason.

The exact texts are in the verdict file.

**Maintainer notes, not fixer edits:**
- The atlas extract still shows AN.6.
- PAPER-CHENEVIER-TAIBI-20 and PAPER-HARPAZ-WITTENBERG-16 also still route to it.

## /2: no `sourceVersions` (confirmed, low)

**What the file records.**
- The extraction has eight source issues, all affecting nothing, and no `sourceVersions`.
- What was read (arXiv v1, its hash, the Duke version not accessible) sits only in `source.readSections`.
- The checker requires the list only for stated-result findings.
- The gap is systemic: 191 of 229 extractions with source issues lack the list.

This is presentation only. The fix job for /1 applies it too.

**Correction to the red team's fix.** Its extra entry `{"kind": "published", …, "not read"}` is rejected:
- `scripts/collation.py` treats any `published` entry as having read the version of record.
- A read-only run shows that such entries already drop PAPER-BHARGAVA-25, PAPER-FARGUES-SCHOLZE-21 and PAPER-STEVENS-08 from the collation worklist.

The fix is one `preprint` entry for arXiv v1, with its hash and read date 2026-09-22. Its citation says that the Duke version was not accessible, as PAPER-CIUBOTARU-HARRIS-26 does.

**Maintainer note, not a fixer edit:** `collation.provenance()` should not count a "published … not read" entry.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-KOYMANS-MILOVIC-21.review.json`: ok.
- `python3 research/blueprint/intake.py check-files` on both files: 0 problems.
