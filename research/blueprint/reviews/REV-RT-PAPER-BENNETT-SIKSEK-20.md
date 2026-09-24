# REV-RT-PAPER-BENNETT-SIKSEK-20

**Complete: one confirmed finding, one rejected.** Refs #1732. Codex / `codex-7e92bd`, 24 September 2026.

The confirmed finding is a low-severity stale count. The rejected finding identifies a real source typo that already has its own reviewed erratum. Neither verdict calls for changing a mathematical statement, owner or route.

## Independence and scope

The extraction was written by `codex-a71f92`, continuing `chatgpt-0921-b74e`; its review was by `cc-fb70e5`; the red team was by `cc-d67081`. This session did none of those three jobs. This session did previously review the separate errata file. To avoid relying on that earlier verdict for the rejection, I independently reread the publisher page and checked that E19 already existed in the original errata author's [22 September commit](https://github.com/CBirkbeck/tauceti-explorer/blob/23a554b22392ddd048985a6eb8624db30d42041b/research/blueprint/errata/PAPER-BENNETT-SIKSEK-20.json), before this session's errata review.

Inputs are frozen at atlas commit `c0b31581c16016c179671ea2fb3b765d85e21f5f`. This verification addresses every submitted finding. It does not repeat the red team's broader proof, catalogue or library-coverage claims. Neither finding depends on a Lean declaration, so no pinned-library theorem is invoked and no Lean compilation is claimed.

## Finding /1 — rejected as an alleged omission

The [publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf) was fetched on 24 September 2026 and has SHA-256 `3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf`. I read the proof of Lemma 4.1 on printed p.364 in both extracted text and a rendered page image. The duplicated word is visibly present. It has no mathematical effect.

The relevant record is already [PAPER-BENNETT-SIKSEK-20/E19](../errata/PAPER-BENNETT-SIKSEK-20.json), also explained in [the errata report](../errata/PAPER-BENNETT-SIKSEK-20.md). Its locator, printed wording and correction match this finding. E19 existed on 22 September and its review is confirmed in the current input. Thus the assertion that the errata register lacks this misprint is not established by the absence of `sourceIssues` from the extraction.

[PROTOCOL §18](../PROTOCOL.md) expressly provides separate errata files for older extractions and says the earlier work remains unchanged. An absent `sourceIssues` field also differs from an explicitly empty checked list. The proposed new entry would duplicate E19. Retain the existing entry; the red-team explanation can point to it. No fresh novelty claim or further published-correction search is needed to settle this duplication question.

A supporting metadata correction: the downloaded PDF has **38 pages**, agreeing with its 355–392 pagination and the extraction. The red team's 39-page statement is inaccurate. Its hash and page-10 locator still identify the correct document and passage.

## Finding /2 — confirmed, low severity

I recalculated the accepted JSON inventory and every route array:

| Check | Result |
| --- | ---: |
| All items / unique IDs | 152 / 152 |
| Missing / planned / library | 129 / 12 / 11 |
| Routes | 12 |
| Route slots / distinct routed IDs | 129 / 129 |
| Routed ID set equals missing-item ID set | Yes |

The accepted `verification.routeAudit` sentence still gives 130. The corrected summary and prior review give 129, but this verification field is an unqualified present-tense assertion, so it should be made consistent. Replace **130 with 129 in that sentence**. Preserve every item and route. The finding's proposed fix and low severity are appropriate.

## Validation

**PASS:** red-team checker; exact coverage of both supplied finding IDs with no extras; two-file intake with zero problems. All 12 captured input blobs and both output guards matched fresh main `c32d613232d8ba5593d05ad592a45ce769f844fe`. The bot-confirmed claim and issue instructions were unchanged before publication. No Lean file was compiled or required. The paper source was read at the finding's passage; a new complete audit of the paper is not claimed.
