# REV-EndoscopicTransferAndUnitaryTraceComparison--ET.6

Issue #9764. Codex, session `codex-m93qgM`, 14 October 2026.
Independent of original worker `codex-kCEWcW` (#9760, PR #9809).

Completed independent review; verdict **accepted with in-place corrections**.
All 33 nodes checked: 13 corrected, 20 verified, none added or unverifiable.
The packet and reader now agree: 45 API items, 30 tests, six planets,
four confirmed pinned declarations, 28 supplier requests, five explicit
primary-proof gaps, five restructuring proposals and five confirmed source
findings. ET.6 is planned, not closed. Implementation remains unchecked.

The report is
[REV-EndoscopicTransferAndUnitaryTraceComparison--ET.6.md](../reviews/REV-EndoscopicTransferAndUnitaryTraceComparison--ET.6.md).
The packet's per-node verdicts, requests, source receipts, source issues and
gaps are authoritative. The unchanged suggested Lean file elaborated with
exit 0 and seven `sorry` warnings only; it contains real-bodied matrix
definitions rather than replacement WD or smooth-representation objects.

## Interfaces packaging must preserve

- The connected geometric special fibre permits the zero Drinfeld level;
  the characteristic-zero generic fibre does not. Dieudonné transport needs
  a chosen conjugator. Scholze §4 uses contravariance, O_A^op and the stated
  rank-one freeness condition. Norms are integral conjugacy classes; product
  comparisons assert characteristic-polynomial equality.
- Lemma 3.1 isolates generalized Speh from the complement of its tempered
  inducing family and vanishes on square-integrables. It does not isolate an
  essentially-square-integrable family. The packet gives the exact rank-d
  supercuspidal family when n=dt, plus density and centre requirements.
- For π_w=π∨⊗χ, use rec_un(π)=a⁻¹W⊗χ_sim⊗χ. Do not restore the source
  proof's dual/inverse twists. For restricted global extraction, globalize
  Π∨ and use sign(a)W⊗χ_ψ. The auxiliary quadratic R is real and satisfies
  the completion and splitting conditions stated in the packet.
- Define M(ρ)=Hom_D×(ρ,c-Ind[RΨ]). The virtual tower identity uses M(ρ),
  not M(ρ∨), and equals (−1)^(n−1)π∨|_K⊗rec_un(π), π=JL(ρ).
  The finite cyclic projector test distinguishes this correction.
- Keep semisimple Weil data separate from full WD monodromy. Import WD and
  its factor conventions from R01.2/R01.3, segments from current SR.5.3.
  Signed additive LJ is separate from the parameter of an actual inner-form
  representation. The trivial/Steinberg and principal-series tests matter.

## Ownership and remaining work

The original [planning handoff](BP-EndoscopicTransferAndUnitaryTraceComparison--ET.6.md)
contains the coarse ET.4-to-ET.6 alias table. Keep that table at assembly,
while using the corrected interfaces in this review. The old ET.4 packet is
needs_changes and should not remain a second owner of these targets.

Preserve the early ET.4b → ET.6/ET.7a direction and the character Part II after
SR.3/ET.1/RG2.0, including nonconnected twisted characters. AC tempered twisted
identities must not be asserted for arbitrary non-tempered representations.

New ownership correction: R07.3 is Fontaine–Laffaille, not strict-O
Deformation theory. Request FiniteFlatGroups Part II after R07.1–R07.2 for
strict-O deformation, Drinfeld levels and algebraization. On R07.2 carriers
request the relative/opposite-algebra adapter. PEL imports those shared
objects and supplies the auxiliary ramified instantiation, beyond its current
M2/M4 good-prime scope. ET.6a must import the same general deformation owner.

Current ClassFieldTheory excludes global Weil groups. Its proposed Part II
must supply localization and algebraic realization through R01.1; reuse
GlobalNumberFields' Hecke-character carriers. The additional AF.1
archimedean request is explicit. AF.1/AF.5 are currently needs_changes.

Five primary-proof gaps remain: Harris–Taylor restricted globalization,
DKV all-inner-form JL/Jacquet, Henniart highly ramified stability, JPSS
nongeneric factors, and Schneider–Zink/Kazhdan isolation/density. The packet
states exact locators, consumers and missing proof obligations. Do not infer
closure from public restatements. No uncleared book copy was used.

All five source findings have independent confirmed verdicts. E-ET6-1/3/4/5
refer only to the hashed 2010 Scholze author copy; the inaccessible published
text was not collated. E-ET6-2 is the published Jacquet 2012 correction of the
1981 essential-vector proof. No further external errata job was taken.

Validation: pinned-baseline blueprint validator (0 errors, 0 warnings),
sorry-data check, Lean elaboration, reader consistency and internal DAG,
source-issue/version validators, intake deliverable-path check and diff
whitespace check. The four changed files are the packet, reader, review and
this handoff; no upstream file or other job's deliverable was changed.
