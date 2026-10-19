# REV-DESIGN-ReductiveGroupsPartIII handoff

Issue #3603; Codex session `codex-98PYit`; branch
`codex-98PYit-review-reductive-groups-iii`. The winning claim was
[confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/3603#issuecomment-6260714073).
The independent review is complete and accepts the corrected target-level
planning pass. This is a finished review, not a checkpoint. See the review
report and the packet's per-node verdicts for evidence.

The plan now has 41 nodes: 32 verified, 9 corrected, none added. Its five
definitions and four constructions retain 45 API statements and 36 worked
tests. All seven baseline declarations were confirmed at the exact pins. All
ten public source hashes matched; all six source findings were independently
confirmed against those specific versions. Six stages remain planned, none
closed, with seven explicit gaps, fifteen requests and thirty planets. All
implementation statuses remain `unchecked`.

## Changes to preserve

- Removed `RG3.0/chevalley-line-stabilizer`, already implemented by
  `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer`.
  The full statement is in
  `TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean`,
  [line 101 at inspected Tau Ceti a91d3aa](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean#L101).
  Its finitely generated ideal hypothesis follows from finite type over a
  field. It handles arbitrary commutative value algebras and nonreduced
  subgroup schemes. The highest-weight consumer imports the theorem through
  RG Layer 1; only the representation/comodule dictionary is requested.
- This module is absent at the fixed Tau Ceti pin. Keep it in
  `libraryAudit.currentLibraryImports`, not the pinned baseline. Packaging
  must consume a library revision containing it, not plan it again.
- Corrected current-checkout attribution: TauCetiRoadmap
  `0d144d044dacebca17b654695b6f1ad58f159b27`, separately from Tau Ceti
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
- Corrected Steinberg §§6.1–6.6 to pp.62–63, including Lemma 6.3 rather than
  a purported Proposition 6.2, and Corollary 6.6 p.63. Corrected KMPS Lemma
  1.2.1 to pp.13–14, Lemma 1.2.2 to p.14 and Lemma 2.2.10's proof to
  pp.28–29. Packet, roadmap bibliography and reader agree.
- Clarified `RG3.4/rational-torus-embedding` as the local/Galois descent
  application of the general quasi-split embedding theorem owned by ET.0.
- All 487 incoming items retain dispositions. Howe–Klevdal `/019` now imports
  the current library declaration; apply this when routing the proposal.
  Galois gerbs still belong to
  `SchemeAndStackFoundations:key/galois-gerbs`.

## Open contracts for subsequent work

1. **Geometry for RG3.5:** KZ Theorem 5.1.4 and Proposition 6.2.4/Lemma
   6.2.6(1), with strongly acceptable triple, all-representation common
   Frobenius class, unchanged residue field, very special parahoric and
   adelic local representatives. The proposed `ShimuraVarietiesHondaTatePartII`
   supplier consumes RG3.0–RG3.4; only RG3.5 consumes its output. Do not create
   reciprocal whole-roadmap edges.
2. **KMPS/Noot realization:** the isogeny group, central neat Frobenius
   power, connected-centralizer isomorphisms, compactness modulo the ambient
   centre and common rational Conj′ values for every neat Weil point.
   Obtain Noot 2009, DOI 10.1112/jlms/jdn049, Theorem 2.4, Lemmas 2.5–2.6
   and §3, especially p.68; the original was not obtained.
3. **Global embedding obstruction:** LR87 Lemma 5.6 internal p.55 was read;
   obtain its original input, Langlands, *Les débuts d’une formule des traces
   stable*, Lemma 7.15. Preserve the quotient by local images and use the
   modern simply connected Hasse theorem.
4. **Quasi-split embedding:** obtain Kottwitz 1982, Duke Math. J. 49,
   785–806, Corollary 2.2. The required maximal-torus embedding theorem is
   not the equal-form or semisimple-element rationality statement.
5. **Approximation:** obtain Harder 1966, Math. Z. 92, 396–415, Lemma
   5.5.3. KMPS and Borovoi restate it. The planned proof uses weak
   approximation for a Lie vector space plus local conjugacy-type openness,
   not weak approximation for G.
6. **Outer action:** obtain Noot §1.5 and verify descent of the actual SO
   factor involutions. Do not replace SO with Spin or add D₄ triality.
7. **Odd unitary Hasse:** extend the dual-centre calculation to arbitrary
   CM F/F⁺ of odd totally real degree. The read Shin proof assumes
   F=F⁺E for an imaginary quadratic E; that specialization does not prove
   the general target.

The fifteen supplier requests remain exact. In particular, A4 must provide
coherent Betti–étale/absolute-Hodge comparisons beyond its exterior-cohomology
node, and ET.0 must provide the relative-inner-form obstruction, the
quasi-split embedding theorem, completed-unramified Steinberg vanishing with
finite-level descent, and the exact torus localization map. Existing supplier
statements were read, not inferred from their names. The geometry owner and
source acquisition remain routing work; no supplier files were changed.

## Checks and resumption

The corrected packet validator reports **0 errors, 0 warnings**.
Independent `lean-check` of the unchanged 102-line suggested file exited
**0**, with exactly ten `sorry` warnings and no other diagnostics; the shared
build uses the fixed pins. Available memory was 87 GB before compilation.
No library build, cache download or language server was started. The final
concordance, route, source-hash, scope and whitespace checks are recorded in
the review report. All durable findings are in the deliverables; no scratch
file is needed by the next worker. Do not treat this review's acceptance as
proof that the seven contracts are closed.
