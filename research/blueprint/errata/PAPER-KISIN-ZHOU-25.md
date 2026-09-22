# Mistakes in Kisin–Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*

Job ERRATA-PAPER-KISIN-ZHOU-25. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-KISIN-ZHOU-25.json` beside this file.

**Paper and version read.** Mark Kisin and Rong Zhou, Annals of Mathematics 202 (2025), 1077–1156, DOI 10.4007/annals.2025.202.3.3.
- **Read:** arXiv 2103.09945v2 of 7 October 2024 (SHA-256 `62d26eb9…34c8`), the latest arXiv version and the one the extraction used. Every passage below was re-read there.
- **Not collated:** the final Annals revision of 19 November 2024.

**Earlier work.** The extraction PAPER-KISIN-ZHOU-25 (partial) listed "printed anomalies" in its version gate. Four are confirmed here. Two others were not recorded:
- **The "nonnegative" in 5.2.1:** not located.
- **The step on p.50:** from λ + σ_qⁱ(α∨) ⪯ μ for each i, it concludes λ + Σᵢ σ_qⁱ(α∨) ⪯ μ. This deserves a check. In type A₃ with the diagram involution, the highest coroot dominates both (α₁+α₂)∨ and (α₂+α₃)∨ but not their sum. However, Stembridge's lemma also makes λ + α∨ dominant, which may exclude such cases, so no mistake is asserted.

**Existing corrections.** None was found:
- Crossref registers no erratum;
- v2 is the latest arXiv version;
- a web search found nothing.

**Effect.** None of these affects the results. All four are misprints in displayed formulas and hypotheses, each contradicted by the surrounding text.

## E1. The mod-a comparison in 3.2.5 (misprint)

The isomorphism c in the definition of a very good embedding is printed from a module over Ŵ(A_G̃/a_G̃) to one over Ŵ(A_G̃), which does not typecheck. Both sides are base-changed modulo a_G̃. Also, a_G̃ should be m²_{A_G̃} + π_E A_G̃, not "m²_{A_E} + π_E A_E".

## E2. Labels in (3.3.2.1) (misprint)

The printed display is "T_pG^∨ ⊗_{Z̆_p} Ŵ(O_K) ≅ D(G)(Ŵ(O_K)) taking s_{α,0} to s̃_α". It should read ⊗_{Z_p} and "taking s_{α,ét}", as §3.3.3 restates it.

## E3. Torsion-free, not torsion, in 4.2.3(5) (misprint)

Property (5) says X_*(G^ab)_I "is torsion". The proof immediately applies Lemma 4.2.4, which assumes torsion-free. The group has positive rank anyway, so it cannot be torsion.

## E4. The loop group in Lemma 5.2.5 (misprint)

The lemma assumes "ṫ_λ ∈ G(F_q[[t]])". A lift of a nonzero translation lies in G(F_q((t))), which is where the proof, and its application in Proposition 5.2.3, place it.
