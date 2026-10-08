# REV-CrystallineCohomology--CR.5~2 handoff

Completed independent review of revision 2, issue #7039, by Codex session
codex-I5hOH7 on 8 October 2026. Verdict: **needs_changes**. This is a completed
review submission, not an unfinished checkpoint. This session did not author
either blueprint version. No second job was claimed.

The [review report](../reviews/REV-CrystallineCohomology--CR.5~2.md) contains
the findings, prior-review reconciliation, baseline/source checks and all 88
individual node verdicts. The packet, reader and suggested file agree.
Counts: 74 verified, two corrected, 12 unverifiable; 25 baseline declarations;
18 public source versions; 165 APIs and 165 tests; 19 planets; seven gaps;
nine requests; four planned stages and none closed. Stable IDs are unchanged.
The old review object is preserved as reviewHistory.

R1 fine/fs base-change signatures and R3 bounded-below support-test scope were
corrected in place. R5 geometric coefficient ownership was corrected; R06.2
still supplies period normalization. All four existing source issues were
independently confirmed. No baseline citation or planet was removed/added.

Next revision must address:

1. R2, CR.5: unrestricted versus QC crystals, PD-stratification affine scope,
   sheaf coefficient tensors and local/stalkwise quasi-nilpotence. Resume at
   LogCrystal, pdDiagonalDiagram, PDConnectionSheaf,
   PDConnectionQuasiNilpotent and logPDDeRham.coefficient_tensor. The P1/F_p
   example in the report distinguishes the section tensor from the sheaf
   tensor. Repair the common adapter used by Poincaré as well.
2. R4, CR.6: resume at AdmissibleTubeEmbedding and sato-residue-variant. Encode
   the actual DL Appendix B.2 degree-zero lift, its W[t] map, relative t=0 SNC
   fibre/divisor log, and compatible higher levels. Preserve supplier ownership.
3. R5, CR.7: resume at RationalCoefficientCrystal, its de Rham/model-pullback
   adapters and ArithmeticCoefficientData. Construct the category from local
   completed finite locally free crystals with p-inversion; use a locally split
   transverse sheaf filtration, or an explicit affine slice with descent.

The earlier log-regularity/Abhyankar, formal-boundary, Tate geometric monodromy
and generic enhanced Rlim gaps remain recorded. They are not new interface
findings and should not be silently closed. Supplier contracts and the proposed
qc-crystalline substage/RD Part II are detailed in the packet. The integrated
atlas and upstream roadmaps were not edited.

Checks: packet checker zero errors/warnings; suggested Lean elaborates with
only placeholder-proof warnings using lean-check in the existing pinned build;
hash/ID/API/test/reader reconciliation and git diff --check pass. Lean proofs
remain placeholders and implementation status remains unchecked. Exact public
URLs, hashes, consulted sections and pins are in the packet; this handoff
depends on no scratch files or private source copies.
