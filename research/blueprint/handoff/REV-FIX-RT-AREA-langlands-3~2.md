# REV-FIX-RT-AREA-langlands-3~2 handoff

Codex, session codex-vUp5LQ, 18 October 2026. Refs #7019. **Completed independent review; accepted with corrections.** This is not a checkpoint. This session did none of FIX-RT-AREA-langlands-3~2 (#6980).

The report is `research/blueprint/reviews/REV-FIX-RT-AREA-langlands-3~2.md`. It gives every finding's verdict, public source URLs and locators, baseline checks, corrections and validation. The packet carries the new independent verdict and preserves its preceding review in `reviewHistory`. The suggested Lean manifest agrees with it; executable Lean is unchanged.

Done: corrected the classification-only prerequisite rule and extra inner-form conditions; separated unconditional generic descent; limited memberwise strong transfer to general type; removed a circular descent hypothesis; clarified real quadratic-form scope and the rank-zero exception; corrected Ishimoto locators; recorded the existing ET.4 general-type-transfer overlap. Findings /2 and /3 remain rejected. Finding /4 remains assigned to the existing completed-cohomology blueprint issue #700, whose body explicitly includes it.

Checks: packet checker 0 errors/0 warnings; `lean-check` exit 0 with 38 sorry warnings only; all 142 manifest entries match; internal graph acyclic; proposed sublayers partition 31 ML.4 targets (2/13/12/2/2); 27 definition/construction targets retain APIs and at least three tests; submission path/JSON checks and `git diff --check` pass. No Lean process remains running. No source PDFs or extracts are needed to resume: use the public URLs and exact version locators in the report and packet.

Remaining work belongs to other jobs or the maintainer:

- Synchronize the reader's seven changed node sections, status title, Ishimoto references and ET.4 request from the packet. The reader is outside #7019's allowed deliverables.
- Apply the round-two package corrections listed in `RT-AREA-langlands-3.fixes-2.md`, then this review's narrower general-type transfer, descent-input, real-form and prerequisite corrections, before upstream submission. The package is not certified here.
- Reconcile `EndoscopicTransferAndUnitaryTraceComparison:ET.4/gsp4-gl4-transfer` with the ML.4 classification/descent interface as one ownership boundary. Its current conditional statement does not supply full stabilization.
- Install the proposed ML.4 sublayers and route pointers, preserving ids and the existing GSp₄/Galois continuation's separate ownership. Carry precise status notes to consumers with coarse ML.4 imports.
- Keep #700's definite degree-zero branch separate from the curve theorem: C⁰(X), local residual absolute irreducibility at p, positive multiplicity and the actual completed evaluation comparison are required.

The fourteen gaps, sixty-one supplier requests and six planned stages remain explicit. Acceptance of these fixes does not close the constructive endoscopic Part II or assert formalisation. No second job is to be claimed by this run.
