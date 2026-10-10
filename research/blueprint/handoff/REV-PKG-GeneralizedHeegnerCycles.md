# REV-PKG-GeneralizedHeegnerCycles — review handoff

Completed independent package review for [issue #7930](https://github.com/CBirkbeck/tauceti-explorer/issues/7930), by Codex (GPT-6), session `codex-qfier3`. Claim: [worker comment](https://github.com/CBirkbeck/tauceti-explorer/issues/7930#issuecomment-6091993581); [bot confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7930#issuecomment-6091994698). The package author was `codex-JffRsg`; this session did none of that work.

## Outcome

**needs_changes**, recorded in [review.json](../packages/GeneralizedHeegnerCycles/review.json) and the [completed report](../reviews/REV-PKG-GeneralizedHeegnerCycles.md). This is a completed review, not an unfinished checkpoint. The next revision needs coordinated target/owner changes; no further review work remains for this session.

The package retains all 82 targets, 66 API items and 58 named tests. Corrected seven missing source page locators and the degree-zero symmetric-power/induction rank explanation in README. Suggested.lean and metadata were unchanged. All remaining package content and accepted inputs were checked without editing their owners or scope.

Three precise revision requirements are in the report:

1. Reconcile the canonical Kuga–Sato resolution/boundary geometry, classical projector and integral newform lattice owners. R14.3 currently plans weight-two material; R19.1 owns the Scholl projector but requests its geometric input from GH.0, which imports it from R14.3. A blanket redirect would create a circular handoff.
2. Give the relative Lubin–Tate, ideal-J, Yager and two-variable regulator extension an actual owner/layer with matching target contracts. Current accepted PHR L3 is cyclotomic. Preserve quotient-kernel control, the nonzero line pairing and the exceptional-lambda regular model.
3. Construct the GH.8.16 auxiliary-form source-range adapter. All-split CH/LV hypotheses do not supply the nonsplit tame-prime/varying-weight BSD range. Retain integral leading-class units and the actual local/non-torsion requirements; compare the LV19 input rather than treating the LV16 v1 preprint as interchangeable.

Honest omitted arithmetic Lean signatures are not grounds to insert vacuous types or assumptions of the desired conclusion. The file's 48 explicit arithmetic omissions, including four API signatures, are discussed in the report under PROTOCOL section 13. Its expressible components and 58 named tests remain intact.

## Checks and library evidence

- Fresh `lean-check research/blueprint/packages/GeneralizedHeegnerCycles/Suggested.lean` on 10 October 2026: **exit 0, 239 warnings, all declaration uses sorry; no errors or other warnings**. Code unchanged after this check. Memory exceeded 20 GB available before compilation. Only the shared wrapper was used; no language server or library build/update/cache command was run.
- Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 19 distinct cited baseline declarations were reread at the pins. Eight Tau Ceti files in the native import closure match the pinned source byte-for-byte.
- Both accepted packets pass `scripts/check_blueprint.py` with **0 errors, 0 warnings**. Packets were not modified.
- Corrected README: 174,462 bytes, 82 target anchors plus nine layer anchors, 173 resolving internal links. Exact metadata line, unique anchors, target/API/test inventory, process-language and JSON checks pass.
- Current read-only upstream commits: TauCetiRoadmap `37769f03c170a7bc3e1082df70522a0ad59c5ffd`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Screened the nine post-snapshot roadmaps and four Completed roadmaps named in WORKERS, including the eight nested OperatorTheory files, and current native library. Existing abelian-variety/isogeny and abstract divisor-class APIs are distinct from the missing arithmetic constructions.
- Read WORKERS, blueprint PROTOCOL, expansion PROTOCOL, UPSTREAM_GUIDE, the GH library audit and relevant link/supplier plans. Read current AlgebraicVectorBundles and JacobianChallenge completely and the ClassFieldTheory opening as style comparisons. No restricted source was needed.

## Reacquisition receipts

Nine fresh public copies matched the accepted source hashes. Source reading was bounded to the relevant formulas, hypotheses and proof interfaces, not a new complete line-by-line audit of all nine papers. The report separates plan fidelity from these fresh source checks. PDFs, extracted texts and compiler scratch are deleted after submission; no source file or passage is committed.

| Source edition | Public copy | SHA-256 |
| --- | --- | --- |
| bdp-published-2013-gh8 | [PDF](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc` |
| ch-author-2022-gh8 | [PDF](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf) | `5c85ea3c0d53ce4825ade4213b930c6542bf628cba6d506bb8c3e46960f02bba` |
| ch-erratum-gh8 | [PDF](https://www.math.ntu.edu.tw/~mlhsieh/research/erratum2.pdf) | `2a8b615daf100b0f2e8ee5890462a91dde9c860492ec920d2a1a7d5827028678` |
| longo-vigni | [PDF](https://arxiv.org/pdf/1605.03168) | `afc1a2146cae0397c5aabb337f5955d182a0dab3dd50949ec2e274426a9a5c75` |
| castella-family-author-gh8 | [PDF](https://web.math.ucsb.edu/~castella/Heegner.pdf) | `6ebd71311d6841d15d653183e9ca3adaabbe9720416e86f6731e7c1ecbb1156d` |
| kobayashi-ota | [PDF](https://www.math.keio.ac.jp/~kurihara/20.ASPMstyle.pdf) | `377cf3e5c53b00bed813a06e18ad8dac9315997497f2dabe57a435664b9764b4` |
| ch-published-2018-gh8 | [PDF](https://web.math.ucsb.edu/~castella/HeegnerCycles-print.pdf) | `be67ffe80a7fa346e8cb0733f38c776268174eebc6277a85bfa9b91c49073ade` |
| lz14-v3-gh8 | [PDF](https://arxiv.org/pdf/1108.5954v3) | `0da539348716fa2293377bba81b07de3d851f3e98bbc9b244b19e639a5ae5341` |
| bsd-multiplicative-erratum-gh8 | [PDF](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf) | `c04dff16c27bc3ca4f4e235e366fcd4c95a43cfb9215f75a2584dfeb7114edcf` |

## Submission

Only the corrected package README, package review.json, review report and this handoff change. Intake file validation passed for all four files with zero problems; `git diff --check` passed. The PR references #7930 and uses a `codex-qfier3` branch. This session takes no second job.
