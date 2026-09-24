# REV-RT-AREA-functionfields — independent verification

Codex — `codex-c83e7a`; issue #1488; 2026-09-24. **The sole finding is rejected.** ABP lifting has an existing stage owner and accepted source routes. The finding also conflates the lifting theorem with the separate linear-independence assumption in the Carlitz-logarithm application.

Target author: Claude Code — `cc-fb70e5`. This worker did not write or review RT-AREA-functionfields. Earlier paper work by this session is context, not a deliverable being reviewed here. The decision is supported independently by the DM.8 text, the accepted Chang–Chen–Mishiba route and primary theorem statements.

Input snapshot: `2f82d0fe011aa6415b86bed59a089ff8bf277c67`. Only the review JSON and this report are changed. No underlying roadmap, paper extraction or red-team finding is edited.

## 1. The owner is already specified

The [complete DM.8 construction](https://github.com/CBirkbeck/tauceti-explorer/blob/2f82d0fe011aa6415b86bed59a089ff8bf277c67/content/campaign/DrinfeldModulesAndTModules/README.md) requests an analytic trivialization matrix and a specialization/lifting criterion before its Carlitz-logarithm application. The [stage extract](https://github.com/CBirkbeck/tauceti-explorer/blob/2f82d0fe011aa6415b86bed59a089ff8bf277c67/research/blueprint/atlas/roadmaps/DrinfeldModulesAndTModules.json) has the same construction and explicitly records `needs_source_decomposition`. It does not claim a finished proof or an implementation.

More specific ownership is present in the paper layer that the red team itself cites:

| Extraction item | Exact mathematical input | Assignment and review |
| --- | --- | --- |
| [CHANG-CHEN-MISHIBA-23/31](https://github.com/CBirkbeck/tauceti-explorer/blob/2f82d0fe011aa6415b86bed59a089ff8bf277c67/research/blueprint/papers/PAPER-CHANG-CHEN-MISHIBA-23.result.json) | ABP polynomial-relation lifting for a Frobenius system | Source route 2 to DM.8; [review route 2 accepted](https://github.com/CBirkbeck/tauceti-explorer/blob/2f82d0fe011aa6415b86bed59a089ff8bf277c67/research/blueprint/papers/PAPER-CHANG-CHEN-MISHIBA-23.review.json), explicitly naming DM.8 as owner |
| [NGODAC-21/ABP-lifting](https://github.com/CBirkbeck/tauceti-explorer/blob/2f82d0fe011aa6415b86bed59a089ff8bf277c67/research/blueprint/papers/PAPER-NGODAC-21.result.json) | Corrected nonzero-determinant ABP statement, with proof-input items | Source route 5 to DM.8; [review route 5 accepted](https://github.com/CBirkbeck/tauceti-explorer/blob/2f82d0fe011aa6415b86bed59a089ff8bf277c67/research/blueprint/papers/PAPER-NGODAC-21.review.json) |
| [WEI-26/80](https://github.com/CBirkbeck/tauceti-explorer/blob/2f82d0fe011aa6415b86bed59a089ff8bf277c67/research/blueprint/papers/PAPER-WEI-26.result.json) | Exact ABP lifting theorem, marked planned at DM.8 | Source route 2 to DM.8; [review route 2 accepted](https://github.com/CBirkbeck/tauceti-explorer/blob/2f82d0fe011aa6415b86bed59a089ff8bf277c67/research/blueprint/papers/PAPER-WEI-26.review.json), despite overall revise for a different route |
| [IM-KIM-LE-ETAL-24/27](https://github.com/CBirkbeck/tauceti-explorer/blob/2f82d0fe011aa6415b86bed59a089ff8bf277c67/research/blueprint/papers/PAPER-IM-KIM-LE-ETAL-24.result.json) | The same lifting statement | Explicit source assignment to DM.8; not needed as an independently accepted premise of this verdict |

The items classified as missing in some extractions have nevertheless been **routed**. Their status does not erase the stated owner. [PROTOCOL §16](https://github.com/CBirkbeck/tauceti-explorer/blob/2f82d0fe011aa6415b86bed59a089ff8bf277c67/research/blueprint/PROTOCOL.md) makes an accepted source route part of the named layer's blueprint instructions. Searching only roadmap-description directories for an acronym therefore cannot establish that nothing in the atlas plans the theorem. The accepted Chang–Chen–Mishiba route alone suffices to defeat the no-owner claim.

The IM–Kim–Le route's observation that the abbreviated layer does not state the criterion is followed by an explicit assignment of that criterion to DM.8. The finding uses the observation but omits its effect as an ownership decision. Adding an explicit named ABP subtarget when decomposing DM.8 would improve the short description, but it would implement an existing assignment rather than repair an unowned prerequisite.

## 2. The Carlitz-logarithm hypothesis cannot be replaced by ABP

I opened the two primary papers rather than relying solely on the extractions. [Papanikolas, arXiv:math/0506078v2](https://arxiv.org/pdf/math/0506078v2), Theorem 1.2.6 on printed p.4, assumes linear independence over `k=F_q(theta)` of logarithms of algebraic points and concludes algebraic independence over its algebraic closure. The rendered page was checked to distinguish k from k-bar. That premise is a genuine condition on the chosen logarithms, not a theorem promised for arbitrary choices.

The same paper states ABP as Theorem 5.1.1, p.32: special-value relations lift to polynomial relations. Section 1.3.3 explains that role. These passages and surrounding specialization discussion were read; the whole paper was not reread.

[Anderson–Brownawell–Papanikolas, arXiv:math/0207168v1](https://arxiv.org/pdf/math/0207168v1), Theorem 3.1.1 on printed pp.7–8, directly confirms that interpretation: a row relation annihilating the solution at the distinguished point lifts to a polynomial row relation with that prescribed specialization. The determinant restriction and entire-function solution space are part of the theorem. The original proof remains a legitimate source-decomposition obligation, already routed to DM.8.

The proposed fix's instruction to replace the logarithm independence assumption by the criterion would change the intended theorem incorrectly. The valid next work is to decompose/prove the assigned ABP input while preserving the application theorem's actual independence premise.

## Scope and checks

Read the full red-team JSON and report; the complete DM.8 description and roadmap scope/source-readiness clauses; all four relevant source routes and exact ABP item statements; the three cited independent route verdicts; PROTOCOL §§16–17; and the primary passages above. The earlier reads of routed paper work are not claimed as new independent reviews of those papers. This verdict does not certify all 25 stages or the report's other clean-area assertions.

A declaration-index probe followed by bounded searches of both pinned Lean trees found no named ABP implementation. Broad substring hits were narrowed to the acronym as a word and the author names. This does not prove universal library absence and is not the reason for rejection: the distinction is between already **planned** mathematics and already **implemented** mathematics. No library declaration is cited as implementing ABP.

Primary sources downloaded and accessed on 2026-09-24:

| Source | Version and size | SHA-256 |
| --- | --- | --- |
| Papanikolas | arXiv v2, 39 pages; read selected statements/discussion on pp.1–5 and 32–33 | `6b5d3436da4d309fa77de77d23a0ed1781ee7fe90c544e55a229ef5cae026cf3` |
| Anderson–Brownawell–Papanikolas | arXiv v1, 62 pages; read Theorem 3.1.1 and explanation on pp.7–8 | `a22c328ea63a1d2d43309bc125b5f377c88d853ff0f1b21039fba14b924ff8c2` |

No Lean file is requested, changed or compiled. The single finding receives exactly one verdict. No confirmed medium/high finding remains to generate a fix job from this review.

Validation passed: `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AREA-functionfields.review.json`; intake `check-files` reports two files and zero problems. The 32 guarded inputs were unchanged at `4793453227e652a33b8327e1fa75da77205f6990`. Both downloaded primary PDFs reproduce their recorded SHA-256 hashes.
