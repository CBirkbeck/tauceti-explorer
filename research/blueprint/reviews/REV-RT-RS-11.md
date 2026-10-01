# Independent verification of RT-RS-11

Codex, session `codex-J6LwjP`, 2026-10-01. Refs #5106.
Input checkout: `59cfbe54ce1a206188a44047cf11c106393d04ab`.

All three medium findings are confirmed, with the repair qualifications in
the JSON verdicts. I did none of RS-11 (ChatGPT Astra `astra-7c41e9`),
REV-RS-11 (Claude Code `cc-39fac3`) or RT-RS-11 (Codex `codex-rtOQ9t`).
This independently verifies the three findings; it does not repeat the
red team's entire family audit.

## Evidence and repair boundaries

**/1: proof owner and ordering.** The accepted first owner record and C.L1
reason conflict with C.L2's actual proof contract. Their direct edge forces
the two-stage cycle if the promised reverse import is added. Move the FW
route to the later owner; retain SU and the ordinary assembly separately.
Its Kato dependency must cover intermediate integral and factor-separation
work, not only final equality. The source sketch still needs the named
comparison and weight-extension proof in the blueprint.

**/2: parallel branch endpoints.** The accepted Kato addition is a real
repair, but the obsolete HE.8b input and aggregate route remain. Removing
the aggregate import requires forwarding its genuinely used interfaces:
AutomorphicGaloisRepresentations and analytic-function inputs must not be
lost merely because C.L5b supplies the cyclotomic theorem. Early HE/GZ,
local-condition and normalization work remains. A completed anticyclotomic
equality is unnecessary in that proof.

**/3: ordinary shared supplier.** The theorem-number correction is valid
but does not resolve construction ownership. BSD.6a explicitly includes
ordinary material as well as its signed branch. Splitting out an early
ordinary supplier requires both normalized reciprocity laws and the actual
comparison, with its coefficient and nonvanishing restrictions. An edge
or source label cannot replace that construction. The supersingular branch
retains its additional work.

I read the RS-11 family input and accepted result, its original report and
REV-RS-11; both complete member documents; Kato L4, HE.8b and BSD.6a;
and the relevant /22, /30 and /31 area findings, verdicts and fixes sections.
Those prior fixes describe intended handoffs, not already-live stages.
Kato L5 is absent from the assembled stages and reserved-ID file. The 17
member entries of reviewed library coverage were read; their inherited
absence judgments are not newly asserted. No finding relies on a Lean
declaration or a newly asserted library search result.

## Primary sources inspected

- [Fouquet–Wan, 2107.13726v3](https://arxiv.org/pdf/2107.13726v3):
  the period discussion on p.6, section 4.8 on p.68, and the start of
  section 4.6.3 on pp.61–62. The source identifies the Greenberg,
  reciprocity and duality route and separately addresses powers of p.
- [Burungale–Castella–Skinner, 2405.00270v2](https://arxiv.org/pdf/2405.00270v2):
  pp.2 and 7–11, including 4.1.3/4.1.4 and the separate proofs on
  pp.10–11. The four-factor cyclotomic argument was rechecked in browser
  text. A requested screenshot failed; no visual-inspection claim is made.
- [Burungale–Skinner–Tian–Wan, 2409.01350v2](https://arxiv.org/pdf/2409.01350v2):
  Theorem 1.14 on printed p.6 and Proposition 9.18, including
  (9.11)–(9.13), on printed pp.82–83 (PDF pages 83–84). This checks
  provenance and the hypothesis boundary of the ordinary comparison,
  rather than every proof interior in sections 3–6.

The downloaded FW and BCS PDFs were respectively 103 and 12 pages, with
SHA-256 values
`39cee6cec8a5d56baf5c0b19dd892a571bc7945eab281d6ec9a9c14fa70294ee`
and
`bf87592cdbaabb5c57004bfd44dd5b4d712cb306bbbdc36520a3daf92fa416f3`,
matching the red team's recorded versions.

## Independent graph checks

`scripts.build.assemble(require_distances=False)` produces 2,907 stages
and 8,322 distinct edges. I independently checked all six accepted links,
the disputed direct edges, and the following experiments against the full
assembly. The initial restricted browser checks were superseded by these
complete checks after command access was restored.

- The assembled graph is acyclic. Adding C.L2 -> C.L1 creates a cycle.
- Neither C.L5a nor BSD.6a reaches the other.
- Removing HE.8b -> C.L5b and C.L5 -> I.L3 removes every C.L4 -> I.L3 path.
- With those cuts, adding Kato L4 -> C.L2 and the proposed Kato L5's
  six inputs and two outputs together remains acyclic. Its inputs are
  Kato L3/L4, PadicFamilies L4, PadicHodgeRegulators L3,
  SelmerIwasawaCohomology L3 and AutomorphicPadicLFunctions L3; its outputs
  are C.L5a and BSD.6a.

These experiments validate graph order only. The actual analytic supplier
and complete ordinary arithmetic construction still require authorized
blueprint contracts. This verification creates no new stage and modifies
no underlying roadmap or dependency data.

## Validation and handoff

The required `scripts/check_redteam.py` check passed. Intake `check-files`
accepted both deliverables with zero problems, and `git diff --check`
passed. The review contains exactly one verdict for each input finding.
Earlier sandbox command/write failures were resolved before submission;
the actual Python checker and full assembly were then run locally.

Pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau
Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No Lean file is required
or compiled; no library build, cache or language server was started.
Only the two issue deliverables are changed. Scratch will be deleted after
the pull request opens, as WORKERS.md requires; no background job remains.
