# Independent verification: REV-RT-AREA-padic-3

Refs #1514. Reviewer: ChatGPT Pro (GPT-6 Astra Pro), session `gpt-20260926-c4e7b2`, 26 September 2026. Claim comment `5848898738`; workflow confirmation `5848899968`.

**Result: one finding checked, one confirmed, none rejected.** A supplement at the end of this report verifies the red team's later findings /2 and /3; both are confirmed. This completes verification of the submitted findings, not a new audit certifying the whole p-adic area.

## Independence and inspected repository inputs

The red team was Codex, session `codex-7e92bd`. The Ding extraction was by Claude Code `cc-442dc5`, and its earlier review by `cc-d67081`, as recorded in the paper review. This reviewer did none of those jobs. The earlier acceptance is provenance, not evidence that the statement is correct.

The following repository inputs were read; blob identifiers record the versions inspected:

| Input | Blob |
| --- | --- |
| `research/blueprint/redteam/RT-AREA-padic-3.result.json` | `40abc3e663bad2dc7955a64f502b4a0ff7c827cd` |
| `research/blueprint/papers/PAPER-DING-25.result.json` | `66b49f56d0abc251d4c4d7337495e77af7e9cfcd` |
| `research/blueprint/papers/PAPER-DING-25.review.json` | `190b6eab439793ceabafc130f7366a08dbbba19d` |
| `content/campaign/PhiGammaModulesAndIwasawaCohomology/README.md` | `722a1fae051b6766955328555186219a6b09c2fc` |

The extraction inspection covered the disputed item, its neighboring local application `PAPER-DING-25/4.2-pseudo`, and the relevant context, not all 156 items. The existing review accepts source route 5. The roadmap was read through PG.7; that stage already asks for source-qualified family results and exceptional loci.

## Finding RT-AREA-padic-3/1 — confirmed, medium severity

The disputed item `PAPER-DING-25/4.2-global-triangulation` asserts a shrinking theorem from reducedness and a Zariski-dense set of trianguline points. It does not specify an interpolating ordered parameter family or distinguish the point retained from the locus removed. This is a real exported-contract defect rather than a request for stylistic elaboration.

### Published-source check

**Ding.** In the proof of Proposition 4.17, p. 69, the family has ordered characters `δ_X,i`. The local successive-extension assertion uses the parameters

`δ_X,i · |·|_K^(2i − (n+1)) · ε^(1−i)`.

Its justification invokes Bergdall at the noncritical, φ-generic base point. The surrounding eigenvariety setup and the hypotheses of the application must remain attached to this local statement. Smoothness is a conclusion of Proposition 4.17, not a replacement premise licensing its triangulation step. See [the published PDF, p. 69](https://link.springer.com/content/pdf/10.1007/s10240-025-00156-2.pdf#page=69).

**Kedlaya–Pottharst–Xiao.** Published Definition 6.3.2 requires global continuous ordered characters specializing to strict triangulations on a common dense set. Corollary 6.3.10 provides a proper birational modification and a coherent filtration, with an exceptional closed locus disjoint from the inverse image of that set. Graded pieces embed into the parameter modules tensored with line bundles; their cokernels are locally killed by a power of `t` and supported on the exceptional locus. The corollary does not assume irreducible connected components. See [the published JAMS text, pp. 1102–1103 and 1108–1109](https://www.mathi.uni-heidelberg.de/~otmar/lehre/seminare/KPX.pdf#page=60).

Thus neither inspected source licenses dropping compatibility data in the separately routed item. The better-qualified neighboring pseudo-character item is useful context, but does not amend the broader statement that PG.7 is asked to supply. This supports the red team's limited, medium-severity diagnosis. It does not establish a counterexample to every conceivable interpretation of an unspecified shrinking.

## Repair to pass to the fix worker

Keep `PhiGammaModulesAndIwasawaCohomology:PG.7` as owner and retain the existing item identifier where possible. Choose one precise export rather than combining two different assertions:

1. For the local Ding application, replace the disputed contract by that application with the ambient assumptions, distinguished point, and parameter normalization recorded above. Use the neighboring item to reconcile the two descriptions, rather than duplicate an incompatible theorem.
2. For a general KPX export, separately give the cited definition and corollary, retaining their hypothesis package and all the conclusion's data. A shrinking-only consequence needs its own statement identifying the surviving locus and a justification of passage from the modification theorem.

Do not add an irreducible-component restriction absent from the published corollary. Do not use the smoothness under proof to justify the local construction. No source-paper correction, new owner, graph reorganization, or blanket claim that shrinking is impossible is requested.

## Source versions and scope of verification

Both published PDFs linked above were opened on 26 September 2026. Page images were inspected for Ding pp. 62, 68–69 and KPX pp. 1102–1103, 1108–1109. Ding was obtained from Springer, not from the inaccessible Centre Mersenne PDF endpoint. The KPX copy has published JAMS pagination. No PDF hash was computed by this reviewer; the red team's hashes are not presented as independently verified.

The older KPX arXiv version was not read in this review. The repair is checked directly against the published statement, so no preprint-only restriction is imported. No complete re-proof of Bergdall or KPX, full-paper review, library-absence audit, or Lean compilation is claimed. The finding cites no specific missing library declaration requiring a separate pinned-code check.

## Validation and deliverables

The repository checker was copied into isolated scratch space and its Git blob hash verified as `c736ae33fd46ec11c6e718be27479d9d5a520211`. The complete result input was also copied and its blob hash verified as `40abc3e663bad2dc7955a64f502b4a0ff7c827cd`, matching the inspected repository file.

The following command ran successfully with exit code 0; both files reported `ok`:

```sh
python3 scripts/check_redteam.py \
  research/blueprint/redteam/RT-AREA-padic-3.result.json \
  research/blueprint/redteam/RT-AREA-padic-3.review.json
```

Additional assertions checked exact finding-ID coverage and absence of duplicate verdicts: 1/1, passed. Only the review JSON and this report are submitted. The result, extraction, roadmap, source-issue register and library files are unchanged. Applying the correction remains the subsequent fix job's responsibility.

## Supplement: findings /2 and /3

The red team's supplement (#3016) added two findings on PAPER-COLMEZ-NIZIOL-25 after this verification was finished. Issue #1514 was reopened for them.

- **Verifier:** Claude Code, session `cc-58621d`, 30 September 2026.
- **Independence.** This verifier took no part in any of these jobs:
  - the red team (Codex, `codex-7e92bd`);
  - the Colmez–Nizioł extraction (`cc-fb70e5`);
  - its review (`cc-7b31c4`);
  - the fix job for /1 (`cc-e94dc5`).
- **Source.** The author copy https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf, fetched again on 30 September 2026. Its SHA-256 is `bb1628cf…d52a`, as the red team records. I read §§3.2.6–3.2.8 and p. 18 (Corollaries 3.20–3.21 and footnote 9). The published Duke text was not read, and nothing here is claimed about it.
- **Checks.** `python3 scripts/check_redteam.py` reports `ok` for the result and the review.

**/2 (high): confirmed.**
- §3.2.6 prints End(O(λ)) = D_λ in (1) and Hom(O(λ₁), O(λ₂)) = Hom(O, O(λ₂ − λ₁)) in (2), and item /320 copies both. At λ₁ = λ₂ = 1/2 the first has dimension 4 over ℚ_p and the second dimension 1.
- The correct statement: O(λ₁)^∨ ⊗ O(λ₂) is semistable of rank h₁h₂ and slope λ₂ − λ₁, so Hom(O(λ₁), O(λ₂)) ≅ H⁰(X, O(λ₂ − λ₁))^N, non-canonically, with N = h₁h₂/h.
- The formula is used nowhere else in the paper, so the new source issue affects nothing in the paper; the harm is in the routed item.
- The fix stands. When recording the issue, also add the top-level `sourceVersions` the file lacks.

**/3 (medium): confirmed.**
- /326(b) and /327(iv) still state the printed versions of E31 and E3, which the review confirmed, and their own notes give the counterexamples.
- §18 requires the items to state the corrected versions. The fix stands.

**What becomes a fix job.** Both findings are high or medium. FIX-RT-AREA-padic-3 is recorded as done, and its report says /2 and /3 "have no verdict and are not part of this job". The maintainer should make sure they get a fix pass.

No Lean file is a deliverable, and no Lean was run.
