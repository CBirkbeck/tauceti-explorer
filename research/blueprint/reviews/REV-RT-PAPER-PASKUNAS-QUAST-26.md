# REV-RT-PAPER-PASKUNAS-QUAST-26

Independent verification of the red team RT-PAPER-PASKUNAS-QUAST-26 (Codex, session `codex-rtOQ9t`, PR #5408) on the
extraction PAPER-PASKUNAS-QUAST-26 (Paškūnas–Quast, *On local Galois deformation rings: generalised reductive groups*,
Forum Math. Pi 14 (2026), e15), for issue #4205.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-39fac3`, PR #2083);
- its review REV-PAPER-PASKUNAS-QUAST-26 (`cc-7b31c4`, PR #2509);
- the red team.

None of the findings cites work of mine.

**Result: all twelve findings confirmed.** /1–/6 are high and /7–/12 medium. None refutes the paper's main theorems.

## What I read

- **The paper.** The published open-access PDF (<https://doi.org/10.1017/fmp.2026.10030>, 96 pages; printed page = PDF
  page). I read pp. 35, 51–56, 63, 68, 76, 80, 82, 85, 90 and 94. I also read the arXiv v2 TeX source
  (arXiv:2404.14622v2), Lemma 5.17 and §15.6.
- **The prerequisites.**
  - Paškūnas–Quast, *generalised tori*, Forum Math. Sigma 13 (2025) e45 (<https://doi.org/10.1017/fms.2024.137>),
    Lemmas 8.4 and 8.7 on p. 30.
  - Birkbeck's p-adic Langlands for tori (JTNB), the definition of admissible homomorphisms.
- **The extraction.** Items /4, /10, /32, /54, /70, /71, /76, /77 and /81.
- **Tau Ceti** f790474: `Dynamic/Parabolic.lean` and `Dynamic/Functor.lean`.

## The high findings

- **/1 (Lemma 5.17).** The TeX has the completed local ring of the total space X, not of X̄. Item /32's Ô_{X̄,x}⟦T⟧ is
  killed by ϖ, while R^□ is flat over the mixed-characteristic coefficient ring, so the item's isomorphism cannot hold.
- **/2 (the isogenies of §15).** p. 76 calls Z(G⁰) → G/G′ and Z_i → H_i isogenies, and the proof of Proposition 15.1 calls
  G → H₁ × Ḡ one. When Δ ≠ 1 the targets are disconnected, so these maps are not surjective. Separately, Proposition
  13.25's "split torus" fails for SL₂, whose centre is μ₂; diagonalizability suffices for its argument.
- **/3 (the H¹ identification).** p. 85 uses Γ_F where (93) has Γ_E. Separately, the identification of all of H¹ with
  characters of a pro-p group fails: an unramified character of order 2 cannot factor through Γ_F^{ab,p} for p odd.
- **/4 (item /81).** Birkbeck's correspondence uses the Weil group. The character x ↦ p^{v(x)} has no Γ_F-parameter,
  because continuous characters of the compact Γ_F have compact image.
- **/5 (item /76).** The paper applies Grothendieck's factoriality theorem to complete local rings (Corollary 15.22). As a
  global statement it fails for Z[√−5].
- **/6 (Lemma 11.3).** The section allows p = 2. For SL₂ over F̄₂ the scheme-theoretic H₀ is the non-reduced μ₂, so it is
  not smooth.

## The medium findings

- **/7 (the cocharacter lift).** For SL₂ a lift composes to t ↦ t^{2n}, so α∘p₂∘λ = id is impossible. A positive multiple
  suffices.
- **/8 (Lemma 11.4).** ρ̃ e₂₁ ρ̃⁻¹ has the term b(e₁₁ − e₂₂) ≡ 2b·e₁₁ modulo scalars. The flag argument is unaffected.
- **/9 (Tau Ceti carriers).** Tau Ceti's dynamic parabolic, Levi and unipotent carriers and functors exist for any Hopf
  algebra, with no reductivity hypothesis.
- **/10 (the Conrad citations).** The cited numbers (Example 1.1.16, 5.3.9, 1.2.7, Theorem 4.1.7) belong to [19],
  *Reductive group schemes*, not to [16], *Irreducible components of rigid spaces*.
- **/11 (Appendix A.1).** A constant accessible functor gives 2 on the empty profinite set, so composing an arbitrary
  accessible presheaf with a condensed ring need not give a condensed set.
- **/12 (the generalised-tori prerequisite).** The integral normal basis fails under wild ramification (Noether). For
  Q₂(√2), the trace has image 2Z₂, while the group-ring norm is onto its invariants.
