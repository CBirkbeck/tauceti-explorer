# FIX-RT-PAPER-CHENEVIER-TAIBI-20

Codex, session `codex-J6LwjP`, 2 October 2026. Refs [#5534](https://github.com/CBirkbeck/tauceti-explorer/issues/5534).
All twelve independently confirmed findings are corrected in the extraction and reader. This report is a fix submission,
not an independent review verdict. The original 151 IDs, 28 bibliography entries and eleven source observations are retained.
One additional library item credits the symplectic scheme separately: **152 items, 5 library, 13 planned, 134 missing**.
All 134 missing items have one route; all twelve routes remain. Nine new source observations, E12–E20, await independent review.

## Corrections by finding

1. **Theorem 3 uniqueness.** The list still contains thirteen symplectic self-dual forms. Uniqueness by weights now
   applies to cases (ii)–(iv). Case (i) explicitly contains two distinct PGL₂ forms with weights ±23/2. The L24 notation
   requires established uniqueness and retains Δ¹₂₃ and Δ²₂₃ separately. The route-1 final theorem is corrected; E12 records
   the false published final uniqueness assertion (p.266), affecting a stated result rather than the total of thirteen.

2. **Regular weights.** The regularity definition now quantifies over i<j, preserving the parity and central-zero
   conditions. Equivalently, the exception uses the unordered central index pair. The dependent regular-properties item
   and brief import this predicate. E13 records the published oriented-pair slip on p.264. The vector (1,0,0,−1) passes
   the corrected predicate; its reversed central pair refutes the former quantification.

3. **Inverse weight formulas.** `regular-w-unique-G` now restricts to the actual images: integral regular weights for odd
   m≥3 (Sp), nonintegral half-integral regular weights for even m (odd SO), and integral regular weights for m divisible
   by four (even SO with discrete series). In the last case λ_last≥0 selects the inverse, or one may retain uniqueness
   only modulo the outer automorphism. The m=1 trivial parameter is separate. Excluded determinant/parity cases are
   eliminated before the group induction. E14 records the published overbroad all-W_m existence assertion and the sign
   convention needed for the inverse. The regular (1,−1)∈W₂ cannot come from SO₃; SO₄ weights (1,1) and (1,−1) have the
   same image. **Literal-source distinction:** p.268 says “some dominant weight”, not explicitly a unique λ. Both
   existence and inverse ambiguity are documented in E14; no invented unique-λ quotation is added as a second erratum.

4. **Explicit-formula decorations.** Restored conjugation of the first trace and Re in B_f, F̂(t) in the archimedean
   integral, and Re in Z and POS. All affected definitions, positivity statements and certificate consumers retain even
   real source test functions and F̂(ξ)=∫F(x)exp(−2πixξ)dx. The inner Re on Γ′/Γ is equivalent to the source integral for
   these real even functions. Complex Fourier-transform values are ordered only after Re. These were extraction errors;
   the published formulas on pp.275–276 already carry the correct decorations, so no new source observation is added.

5. **Realness before optimization.** The quadruple now has the guard ε(U_iU_j)∈{±1} whenever δ_iδ_j=1. The real Gram
   matrix, eigenvalue and minimum constructions require it. The guard is carried through reduction, Proposition 2.5,
   Example 2.7, Lemma 2.8, Corollary 2.9, monotonicity, both algorithms and certificate checking. Monotonicity checks
   both Q and Q′, including pairs newly activated by larger δ′. Algorithm 2.4.5 uses effective determinant-one
   candidates, as actual PGL parameters are; otherwise a symbolic obstruction precedes computation. Determinant-one
   inputs suffice because det(U⊗V)=det(U)^dim(V)det(V)^dim(U), and their epsilon values are real. E15 records the
   overbroad source domain on p.278: U₁=1,U₂=ε_C/R with δ₁=δ₂=1 gives ε(U₁U₂)=i and a nonreal off-diagonal coefficient.
   Existing E3 normalization corrections are retained. No replacement of ε by Re ε is silently made.

6. **Lowest-weight regularity.** Put a_i=k_i−i. The exact distinctness criterion is a_i≠0 and a_i+a_j≠0 for i≠j,
   since the a_i are already strictly decreasing. k_g>g remains sufficient and separately the holomorphic discrete-series
   criterion. E16 records the false converse on p.302; g=1,k=0 gives the existing trivial module with eigenvalues
   0,−1,1. The later calculations in the discrete-series range retain their hypotheses.

7. **Theta lift genus.** The square-integrable relations now use the lift genus g:
   ψ_G=ψ_F⊕[n−2g−1] for n>2g+1, and ψ_F=ψ_G⊕[2g+1−n] for n<2g+1. The degree g₀ remains in its definition and in
   Lemma 5.8. E17 records the published index slip on p.312. Dimensions are n and 2g+1; the E₈ example
   n=8,g₀=0,g=8 has 17=8+9, whereas the printed branch would give 8=17+7. The theta layer in the brief is corrected.

8. **Integral models and existing Sp.** The mixed `split-classical-groups` item is planned at the exact
   `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ` import.
   The comparison of its split integral SO model with the paper's displayed quadratic form is explicitly owed to that
   supplier interface, including residue characteristic two. The new **library** item `symplectic-smooth-scheme` reuses
   Tau Ceti's affine group scheme, smooth coordinate algebra and natural point equivalence. The original abstract
   quadratic isometry groups are partial ingredients. The standard sum-of-squares bilinear SO scheme is not identified
   with the split integral model; its smoothness theorem requires 2 invertible. General ring/Spin work remains at GN.2.
   No Tau Ceti roadmap is edited or re-planned. This is a library boundary correction, not new source errata.

9. **SO₃ character denominator.** The corrected denominator sin(π/i) is retained and E18 now records the published
   sin(2π/i) on p.271. At k=0,i=4 the latter gives 1/√2 rather than the trivial character 1; it is undefined at i=2.
   The displayed character matrix and masses are unchanged; their equations were checked exactly over Q.

10. **Mass special-value range.** The note now explicitly identifies non-positive integers as a correction of the
    published non-negative range (p.270), recorded as E19. ζ(2)=π²/6 refutes the blanket positive range. The relevant
    Artin character/value-field and rational-motive qualifications are retained; no general rationality claim for arbitrary
    characters is substituted, and the Gross–Siegel supplier proof is not recursively audited.

11. **Enumeration conventions.** The theorem statement now uses **223 actual positive-genus candidates / 58 accepted**,
    distinguishing the two Δ₂₃ forms. Equivalently: **198/58 positive-genus shapes**, or **199/59 shapes including
    genus zero**. E20 records the stated positive-genus count discrepancy on p.309. The red team's exact doubled-weight
    enumerator was rerun after comparing its constituent list with the authors' `gp/vvalued.gp` and the signs with
    published (5.1.2), (5.1.3), (5.2.1). All 25 additional actual choices fail the multiplicity test. Tables 5–6 and
    their dimension conclusions are preserved. The reader no longer calls 199/59 a literal positive-genus reproduction.

12. **GRH owner.** Route 6, its item note, the new-roadmap import brief and the reader now name AN.3. The accepted
    RS-07 owner row assigns RH/GRH statements there and drops AN.6. Route 5's general explicit formula and route 6's
    conditional hypothesis remain separate, each taking its missing item once. Theorem 4 remains conditional.

## Primary sources and pinned evidence

Read/downloaded on 2 October 2026:

- [Published CT20 PDF](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf): 63 pages, SHA-256
  `ea90fb0faabeaaa56be15f2c6f9c22450e7891c2181130fd79fe356cd83ba3de`. Targeted printed pp.264–266,268,270–271,
  274–276,278–283,292,300–303,308–309,312; rendered checks of the affected formula pages. No new full-paper reading.
- [arXiv v1](https://arxiv.org/pdf/1907.08783v1): 62 pages, SHA-256
  `81b7fe2c31d0ab4ac7465c7d5209611638fa0d8c7c4ff11f7f4746866491742c`; corresponding targeted passages only.
- [Current linked author copy](https://otaibi.perso.math.cnrs.fr/levelone/mot23.pdf): 63 pages, SHA-256
  `562a1a471954c30733729d59c68bb389d6dbfcd1d8b4992657830269a7178b9f`; targeted passages, not complete collation.
- [Companion archive](https://otaibi.perso.math.cnrs.fr/levelone/levelone_src_data.tar.gz), SHA-256
  `b0bd028b886b91d996d0562798c0800fdf465d7b39dc82eeea1a2e22ec6be87b`. Read its README, `gp/vvalued.gp` and relevant
  `gp/testfin.gp` formulas. No end-to-end mass/certificate computation or interval recertification of stored decimals.

Correction searches covered the journal page, arXiv history (only v1 listed), Taïbi's publication and companion pages,
README and current linked PDF, and bounded title/erratum search. No matching correction was located. Chenevier's
publication page was found in search but its direct opening timed out; direct PDF retrieval failed certificate-name
validation. His page is not claimed fully read. The findings are against the actual published PDF. The current author
mirror retains the targeted slips; no universal absence-of-errata claim is made.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, actual statements read:
`Symplectic.groupScheme` (Basic.lean:122), `pointsMulEquiv` (209), `pointsMulEquiv_mapValue` (260) and
`instSmoothCoordinateHopfAlgebra` (Smooth.lean:94). The special-orthogonal scheme's bilinear-model scope and its
`Invertible (2:R)` smoothness hypothesis (Smooth.lean:83) were also read. Reviewed coverage entries AN.3/AN.6/GN.2
and the accepted RS-07 transfer were inspected. ReductiveGroups Layer 9 has no exact reviewed coverage entry; its actual
contract was read and treated as planned. No upstream declaration or roadmap is re-planned.

## Validation

- Paper schema, intake checks on the three deliverables and whitespace checks passed.
- Structural checks: 152 unique acyclic items; 134 missing items routed once; exact 5/13/134 status totals; twelve
  routes; 28 bibliography entries and eleven original source issues unchanged; no self-authored review verdict.
- Exact regressions: **4,592** classical inverse cases; **12,375** lowest-weight vectors; **3,400** theta dimension
  cases; **16,384** determinant-one tensor epsilon pairs; **18** monotonicity cases; the rational SO₃ mass system and
  conjugate-trace witness. These bounded regressions check correction interfaces, not the main classification proofs.
- Exact enumeration reproduces all three conventions above. Its reproducer is already preserved in the red-team report;
  no duplicate research computation is checked into the authorized deliverables.
- No Lean file is authorized; no pinned compiled build is available; no Lean compilation or background build was run.

Source proof closure and implementation remain the owning blueprints' work. All twelve correction deliverables are complete.
