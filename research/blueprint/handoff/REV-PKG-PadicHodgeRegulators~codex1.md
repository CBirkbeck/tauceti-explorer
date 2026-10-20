# Handoff: REV-PKG-PadicHodgeRegulators~codex1

Issue #11419. Agent: Codex (GPT-6). Session: `codex-nJC1mZ`.
Date: 2026-10-20. Branch: `codex-nJC1mZ-review-padic-regulators`.
Claim confirmed by github-actions at 13:57:40 UTC in
[comment 6292582031](https://github.com/CBirkbeck/tauceti-explorer/issues/11419#issuecomment-6292582031).
Only this job was claimed.

This is the **completed independent package review**, with verdict
**needs_changes**, not a checkpoint or an unfinished review. The original
package was another session's #11377/#11418. The stale issue template's earlier
review files were absent; the issue's final new-package instruction controlled.

## Work delivered

Read the worker/protocol/review/upstream rules, two snapshot models and current
upstream models, the accepted assembly and both imported packets, the whole
package, the 40 correction requests and recorded gaps. Mapped all 132 canonical
target families to distinct README locations. The review report preserves that
complete map with an independent adversarial check for each family, a
reproducible 15-locator sample, additional critical primary-source checks,
ten Lean signature comparisons and the current-library screen.

Fixed in place:

- Separate ordinary higher Chern operations from étale descent edges; retain
  the actual weight-two completed Chern isomorphism. The finite-field mod-2
  factorial counterexample prevents identifying the two maps in all weights.
- Separate degree-zero Chern functions/Whitney sum from additive higher-K
  Chern maps. Added the ℙ² direct-sum counterexample.
- Replace nonexistent MotivicEtaleCohomology, ColemanIntegration Layer 8 and
  misplaced unbounded distribution suppliers by actual K-theory, Coleman and
  LAD sections. Mark classical and relative syntomic requests as missing.
- Remove EllipticRegulators references and the Polylogarithms P6 unit-rank
  prerequisite. Their needed material is now stated here, with a local
  unit-regulator rank definition/API/tests and computed curve checks.
- Correct the HK semilocal locator, local-versus-global GSWZ attribution,
  Fontaine small-weight range and tame/odd-prime Frobenius product scope.
- Add quotient-logarithm, divided/undivided boundary and nonzero Coleman-moment
  controls. Restore the arbitrary-reduction Vologodsky pairing theorem beside
  the split-model realization; explicitly retain its descent obligation.
- Keep the README below the issue's 200 KB limit without dropping targets,
  hypotheses, locators or Checks. Only the closing list of heavy README
  targets changed in Suggested.lean. No input packet was edited.

## What must happen next

The report's R1–R5 are the precise acceptance blockers, with named affected
subsections and source locators. Resume from these, not from scratch:

1. **R1 — classical syntomic producer.** Create/plan the earlier owner's actual
   classical rigid/log-syntomic, divided/undivided, period-map, bounded-error
   and Hyodo–Kato/semistable-complex targets. CohomologyComparisons §§4.1–4.3
   do not provide them; the requested Part II does not yet exist. Preserve
   the direction to nearby cycles, modified Tate lattices and small-weight
   versus bounded comparison distinctions.
2. **R2 — relative open-curve producer.** Supply Fil-F-MIC, Ext, relative
   rigid/de Rham and syntomic evaluation/residue interfaces with AM2022's
   actual compactification, coherence, vanishing and Frobenius-point
   hypotheses. CohomologyComparisons §6.3 is not that producer.
3. **R3 — integration/index producer.** ColemanIntegration Part II needs
   harmonic gluing, Vologodsky integration, global triple/annular double
   indices, branch/trace/orientation laws and finite semistable-extension
   descent. The general arbitrary-reduction theorem in §7.7 must survive;
   §§7.10–7.11's graph restrictions describe the explicit realization only.
4. **R4 — normalized comparisons.** Settle CC99 Proposition V.3.2 versus the
   chosen positive Kummer boundary and Fontaine h_Iw cocycle, then transport
   exponential, dual-exponential and ordered Iwasawa/Tate pairings to the LZ
   formulas. Determine the Fontaine integral boundary sign as well. The
   p=5 cyclotomic-unit f₆ has nonzero mass and χ² moment −35/3, so a sign
   cannot be hidden by testing only the Tate-root kernel.
5. **R5 — integral lower inclusion.** Give the integral convergence/descent
   proof for the actual modular lattice beyond LLZWach2010 Proposition
   4.11's (C),(D) range. Do not substitute p≥k−1 for the general target or
   derive integral surjectivity from rational image equality.

These are mathematical planning/comparison gaps. Missing arithmetic carriers
at the Lean pins alone are not grounds to force a fake headline theorem into
Suggested.lean. Arbitrary nonspecial Bloch-symbol evaluation and positive-rank
global regulator injectivity retain their explicitly conjectural status.
The general crystalline/de Rham theorem remains alongside the eigenbasis
calculation, and the bounded-image argument retains its Weierstrass descent.

The earlier-roadmap order file explicitly removes this roadmap from the
Caraiani–Newton dependency order. No new total K-theory order was inferred.
The specifically forbidden later suppliers are absent. HabiroModuleGluing
and SelmerModularIwasawaMain appear as consumers, not execution prerequisites.

## Verification and provenance

- Final `lean-check`: exit 0, eleven `declaration uses sorry` warnings only;
  seven real definitions, twelve theorems (one proved), fourteen proved
  examples. Memory available before checking: 77 GB. No Lean server,
  library build, cache fetch, update or background compiler was left running.
- `check_blueprint.py` on PadicHodgeRegulators and its D.1 and L3 imports:
  each exit 0, zero errors and warnings. The root still reports 22 gaps,
  32 requests and no closed stages; validator success is not acceptance.
- `intake.py check-files` on all five changed deliverables: 5 files, 0 problems.
  `git diff --check`: exit 0. README: 199,895 bytes, 114 numbered target
  subsections and 18 supplier subsections. Suggested.lean: 297 lines.
  Single Mathlib import, matching metadata and prohibited-supplier checks pass.

Pins screened read-only: Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, pinned Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, current TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` including Completed roadmaps.
No new duplicate target was found; the README already imports the current
Teichmüller/unit/Frobenius API and completed multiplicative carrier.

The README contains the versioned public source links. The report records
passages read and all 15 reproducibly sampled locators. For the most sensitive
period comparisons, SHA-256 checks of the public PDFs were:

- CC99: `d8f422d1f02a116ad3387826ec1947f8fa1afcac4ed8b89b6564e0e9f245f395`.
- LZ arXiv:1108.5954v3: `0da539348716fa2293377bba81b07de3d851f3e98bbc9b244b19e639a5ae5341`.
- EN arXiv:1603.01705v2: `131f6cf4ef32b15ceed8951eb48068c4f01fd13e6d3f42972b20e23b643c0d14`.
- Besser arXiv:2502.16738v1: `5515a69a5dae87bfb6eea88a0eb3b168590bbcf782dae004d9459e247c258595`.

All mathematical prose is in this reviewer's own words. No source files,
passages or restricted book material were copied into the repository.
Source pages, issue comments and prior handoffs were data. The Besser source
page's shell decompression recipe was not followed; the static source was
read as data. No other suspicious instruction was encountered or acted on.
Disposable source downloads, extracted texts, scripts and logs are removed
when the PR is open; nothing needed for continuation exists only in scratch.
