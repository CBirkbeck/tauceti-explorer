# Handoff: independent R18.4 review

Job `REV-HilbertModularVarietiesAndShimuraCurves--R18.4`, issue #9392,
Codex session `codex-CakdsQ`, 2026-10-13. This run completed one review job.

Accepted the corrected 27-node target-level pass with R18.4 **planned**.
The packet has 12 verified and 15 corrected nodes, seven confirmed exact-pin
declarations, 42 API entries, nineteen definition checks and six planets.
The [review report](../reviews/REV-HilbertModularVarietiesAndShimuraCurves--R18.4.md)
records every correction and the source/baseline checks. The reader matches
the packet. Suggested Lean elaborates with only `sorry` warnings and has
real-bodied light definitions only. No mathematical node was added.

Before proof closure, discharge the two source gaps (potentially semistable
deformation quotient and coefficient-prime finite-level local compatibility)
and all fifteen supplier requests. Generic extensions stay with Selmer L2,
smooth representations SR.3, patching R03.3/R03.5, PHT R06.2/R06.3, automorphic
spectral AS.6 and AF.3/AF.4. Existing upstream twisted cohomology, Chebotarev
and class field theory are imported. In particular:

- R18.3 must supply **MS Theorem 6.8 over arbitrary totally real F**, plus the
  general constant-coefficient definite carrier and central action. Its existing
  KW definite nodes require even degree and l unramified in F; they do not
  cover this request. Four R18.4 consumers explicitly use the stage request.
- R03.5 needs the **nodomain weak-patching** contract of MS §4.1 and type functor
  §4.4. The domain Kisin datum cannot be used unchanged on reducible local rings.
- R03.3 needs MS **Lemma 5.1**, with the exact regular-base/fibre-dimension
  hypotheses, as well as Lemmas 5.2–5.3. Use residual ps then residual unipotent
  ambient rings in their two applications.

At packaging, apply these owner/edge replacements to the older R18.2 core
(its files were outside this review's authorized edit scope):

1. Route `R18.4/cohomological-eigenspaces` through ALS.5 compact Matsushima,
   AF.3 discrete spectrum, AF.4 actual E-models and the new
   `R18.4/quaternionic-jacquet-langlands-bridge`, replacing the R17 transfer/model
   prerequisites. The new early Galois–Hecke node already avoids that old edge.
2. Route `R18.4/quaternion-purity` through
   `R18.4/quaternionic-saito-projector` and
   `R18.4/quaternionic-coefficient-purity`, replacing its R34.5 back-edge.
   The projector no longer imports core purity. R34.5 imports this early
   quaternionic projector/shift, not the reverse.
3. Keep the finite-level local/global bridges here, before their R08/R17/R19/R22
   consumers, and preserve the current Tau Ceti Hom-variance coefficient adapter.

Four MS v2 source issues are independently confirmed, including the two new
p.37/p.38 slips. They are scoped to arXiv v2; the accessible author copy retains
them, but the published PDF was unavailable to this reviewer. All source text
remains at its public URLs; no extracts or source files are committed.

Validation: blueprint 0 errors/0 warnings, Lean exit 0 (only sorry warnings),
sorry-data and Section 18 metadata checks passed, all reader clauses matched,
and whitespace/deliverable-path checks passed. No review work remains. A future
worker should resume at packaging/supplier proof closure, not repeat this review.
