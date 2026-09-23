# REV-ERRATA-PAPER-FU-24 — review of the mistakes recorded in Fu (2024)

Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The errata job ERRATA-PAPER-FU-24 was done by Claude Code, session `cc-fb70e5`; this reviewer took no part in it or in the paper's extraction.

**Sources read.**
- **The paper.** W. Fu, *Sharp bounds for multiplicities of Bianchi modular forms*, Annals of Mathematics 200 (2024), 123–152.
  - **Version.** arXiv 2201.11190v2 (15 February 2024), the version the errata name, downloaded fresh. Its SHA-256 matches the recorded `d71e9d3f8d3a1217743c3ba72c9a9630981f054ecefd943ff4edb4879b842614`.
  - **Pages read.** Pp. 1–6, 13–17, 19–21 and 23–24; pp. 13–14 and 19–21 as page images.
- **Marshall 2012**, §2.1: *Bounds for the multiplicities of cohomological automorphic forms on SL₂*, Ann. of Math. 175 (2012), from the Annals PDF linked by the extraction (SHA-256 `0f7afc37…5081`).
- **Ardakov–Wadsley 2013**, §10.1: arXiv 1102.2606 (SHA-256 `26529781…9323`).

**Existing corrections looked for.** The published Annals text was not collated. arXiv v2 is the latest version, and no erratum is linked from the Annals page.

## Verdicts

All seven findings are confirmed.

- **E1 (gap, the proof): confirmed.**
  - **The mismatch.** Marshall's H^i_c is "the subspace of classes whose restriction to some neighbourhood of the cusps is trivial", which is cuspidal cohomology inside H^i. Fu calls it "the first compactly supported cohomology".
  - **What survives.** The upper bound of Theorem 1.2 needs only the cuspidal part, so it is unaffected.
  - **What needs repair.** Corollary 1.3 for compactly supported cohomology needs the boundary step, and the correction's bound |dim H^n_c − dim H^n| ⩽ 3c is right. Each cusp torus has cohomology of dimensions (1, 2, 1).
- **E2 (error, nothing): confirmed.** The ‖·‖_r-completion of D(G,K) is the null-sequence space (|λ_α| r^{|α|} → 0), not the "sup < ∞" space printed in (16). The Fréchet algebra is unchanged.
- **E3 (error, the proof): confirmed.**
  - **The computation.** HC(Δ) = ½h² + h, so an induced λ has λ(Δ) = a(a+2)/2 with a ∈ Z_p. For p = 3, λ(Δ) = 1 would need (a+1)² = 3 in Q_3, which is impossible.
  - **The consequence.** Remark 5.8's "if and only if" is only "only if". §5 proves Theorem 1.5 for induced λ; the other integral λ need [AW14] or the correction's argument.
- **E4 (error, the proof): confirmed.** Ardakov–Wadsley §10.1 assumes that the uniformizer of R is p. For ramified R, p + 𝔪² contains 0, so S₀ is not an Ore set.
- **E5 (gap, the proof): confirmed.**
  - **The missing step.** Deducing "domain" from the graded ring needs a separated quotient filtration, which the proof does not establish. It follows from closedness of ideals in the Noetherian Banach algebra D_r, but that is not argued.
  - **A second omission.** The PBW normal form in the proof of Theorem 5.1 is left to the reader.
- **E6 (misprint, nothing): confirmed.**
  - **The index.** Theorem 1.2 takes the minimum over i ⩽ r, but in §1's notation k has r₁ + r₂ entries. §7 indexes k by the r embeddings, where the minimum is the same, so this mixes two conventions.
  - **The notation.** ∼ in Corollary 1.3 means a two-sided bound up to constants.
- **E7 (error, a stated result): confirmed.** In §5 an infinitesimal character is any λ : Z(g) → Q_p. For v(λ₀) ⩽ 1 the proof itself makes D^λ_r(G,Q_p) = 0, so Theorem 5.7 as stated fails there. It holds for v(λ₀) ⩾ 2, which covers the induced case that Theorem 5.1 uses.

`python3 scripts/check_errata.py research/blueprint/errata/PAPER-FU-24.json` reports `ok`.

## Missed mistakes

On the pages read, the review found no further mathematical slip that the list lacks. The bibliography entries for [Mar12], [AW13], [CE09] and [Hu21] agree with the published volumes and pages. Pages 7–12, 18 and 22 were not re-read line by line.

## Question for the orchestrator

**The weight of E3 and E7.** E3 and E7 together mean that §5 proves Theorem 1.5 only for induced integral λ, while Theorem 1.5 is stated for all λ ∈ Z_p^r. The paper points to Ardakov–Wadsley [AW14] for the general case. Blueprint layers that consume Theorem 1.5 or Theorem 5.7 should import the induced-λ statement, or [AW14], rather than the printed unrestricted one.
