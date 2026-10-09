# REV-PKG-HabiroRings — issue #7520

Completed by Codex (GPT-6), session `codex-oSU38t`, on 2026-10-09.
Branch: `codex-oSU38t-review-habiro`. This is a complete independent review,
not a checkpoint. The claim was confirmed in
[comment 6073726811](https://github.com/CBirkbeck/tauceti-explorer/issues/7520#issuecomment-6073726811).

## Done

- Accepted the package after checking every item of the six-check review.
- Added [the review report](../reviews/REV-PKG-HabiroRings.md) and
  [review.json](../packages/HabiroRings/review.json).
- Clarified the README's notation paragraph: perfect Λ-rings are perfectly
  covered. The detailed target and Lean interface were already correct.
- Reviewed all 89 targets, 294 API items and 131 unit specifications. Of the
  APIs, 213 are typed declarations/projections and 81 are explicit omitted
  signatures requiring the named enhanced suppliers. These are suggestions,
  with admitted proofs; the review makes no formalization claim.
- Read the reviewed library audit and relevant accepted ownership/link-map
  decisions. Checked all 109 cited baseline declarations at the pins.
- Read the supporting primary statements and arguments and verified all 13
  distinct download hashes against the accepted-input receipts. The report
  records the public versions, mathematical checks and precise locators.
  No source passages, public PDFs or private-library material were committed.

## Checks and limitations

`lean-check research/blueprint/packages/HabiroRings/Suggested.lean` returned
**exit 0, zero errors, 454 warnings, all `declaration uses sorry`** on
2026-10-09. The file was not subsequently changed. The check used the shared
build with available memory above the required threshold; no library build,
update, cache command or language server was started.

Mathlib was exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti
statements were read at `f790474821cf4256814db967cb154e7af3d0c369`.
The shared checkout has a different Tau Ceti HEAD and lacks the compiled
cyclotomic Lift module. Suggested.lean imports only individual Mathlib modules,
and its `phiFiveResidues` example uses that baseline. The header identifies
the intended native pinned cyclotomic APIs. Native Tau Ceti integration was
not compiled; the accepted review does not claim otherwise.

`python3 scripts/check_blueprint.py` passed separately on the parent and
HR.1, HR.2, HR.3, HR.4 and HR.6 inputs, with zero errors and zero warnings
in each. Inventory and local-anchor checks pass. README size is 187,277
UTF-8 bytes. Metadata is exactly the required single `math.NT` topic line.
A sixteen-word overlap scan found no README passage shared with any of the
eleven PDF source texts; the two Stacks statements were checked directly.

`python3 research/blueprint/intake.py check-files` accepted all four changed
paths with zero problems. `git diff --check` passed. Final package SHA-256:

| File | SHA-256 |
| --- | --- |
| README.md | `1d8995e161834de30522a5907e6bc7815e76c13cdfe7d003f72a83711aa1ff62` |
| Suggested.lean | `eff8830ddb8e32376b133963036555f656e1e3905667706334b38aef4d2797f9` |
| metadata.toml | `d303572d699e7ef5619039e39ca2cc23feb22354dad61e5014fe05151078b2a7` |

The report preserves the full solid spectral contract, coherent-descent
conditions, completed base-change convention, and HB.7 global-descent and
integral-line hypotheses. Acceptance does not resolve supplier gaps outside
this job or erase the input review qualifications.

## Remaining and resume

No package-review work remains. Submit this completed review through the
ordinary swarm intake and address any submission-check failure on this same
branch. Subsequent implementation should follow the package's explicit
supplier contracts; it must not replace unavailable carriers with arbitrary
propositions or infer unconditional arithmetic claims from local rank one.
All evidence needed to assess this review is in the report and accepted
input receipts; nothing needed by the next worker remains solely in scratch.
