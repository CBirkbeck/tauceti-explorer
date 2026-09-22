# Mistakes in Kisin–Madapusi Pera–Shin, *Honda–Tate theory for Shimura varieties*

Job ERRATA-PAPER-KISIN-MADAPUSIPERA-SHIN-22. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-KISIN-MADAPUSIPERA-SHIN-22.json` beside this file.

**Paper and version read.** M. Kisin, K. Madapusi Pera and S. W. Shin, Duke Mathematical Journal 171 (2022), 1559–1614, DOI 10.1215/00127094-2021-0063.
- **Version read:** the author PDF on S. W. Shin's page (`HT.pdf`, 41 pages, created 27 January 2021, SHA-256 `fd22990b…52db`), the latest version found and the one the extraction used. Every passage below was re-read there and checked on the page image.
- **Older version:** M. Kisin's copy (`newton2.pdf`, 18 August 2018) is earlier. It has E1–E3 and E7 verbatim and does not yet contain Lemmas 2.2.8 and 2.2.11.
- **Not collated:** the published text.

**Earlier work.** The extraction PAPER-KISIN-MADAPUSIPERA-SHIN-22 (partial) lists eight "source discrepancies", all re-examined here.
- **Recorded:** discrepancies 1–4 and 7, and two of the three points in 8. Here they are E1–E7, with the analysis of E5 and the second counterexample in E6 added.
- **Not recorded as mistakes:**
  - item 5, the tensor-category identification in Corollary 1.3.13;
  - item 6, the μ-ordinary class for arbitrary inner forms.

  The extraction itself leaves both as open questions, not errors.
- **Dismissed:** the "Q_p intersection" in §2.1.3 is harmless. Elements of Aut(A_{s₀}) are rational points, so I_{s₀}(Q_p) ∩ Aut(A_{s₀}) = I_{s₀}(Q) ∩ Aut(A_{s₀}).

**Existing corrections.** None was found:
- Crossref registers no erratum;
- the paper is not on arXiv;
- Shin's errata page covers three other papers;
- a web search found nothing.

**Effect.** The main theorems are unaffected. E2 is a false statement whose corrected form is what the proof gives and what its one use needs. E5 is a proof step that fails as written but has a direct repair. The rest are misprints or missing hypotheses.

## E1. The decency equation (misprint)

(1.1.2.2) writes c b σ(b) ··· σ^r(b) σ^r(c)^{−1} = c(rν_b)(p)c^{−1}, a product of r + 1 terms. The r-th power of bσ has r terms, ending with σ^{r−1}(b). The paper's own (1.1.4.1) and Kottwitz's original have r terms, and for G_m, b = p the printed version gives p^{r+1} = p^r.

## E2. The Weyl group in Corollary 1.1.15 (error)

The corollary promises w ∈ W(G, M) := N_G(M)/M with ([b_M], {w·μ}) M-admissible. The relative Weyl group is too small.

**Counterexample.** Take G = GL₃, M = GL₁ × GL₂, μ = (0,1,0) and b_M = diag(p,1,1).
- The pair is G-admissible: Newton point and Hodge point are both (1,0,0).
- κ_M(b_M) = (1,0) but κ_M(μ) = (0,1).
- N_G(M) = M because the blocks have different sizes, so no w in W(G, M) helps.

**Correction.** Use the absolute Weyl group W(G, T) of a maximal torus of M, as in the quasi-split Proposition 1.1.13 that the proof applies to G*. The proof then proves the corrected statement.

**Use.** Corollary 1.1.17 needs exactly the corrected statement; its proof writes "Lemma 1.1.13" and w ∈ W(G, T).

## E3. A missing inverse in Proposition 1.2.5 (misprint)

The conclusion reads "[b_bas(μ_x)] maps to [b]". The hypothesis, the parenthesis "μ_x^{−1} ∈ X_*(T)" and the last line of the proof all use μ_x^{−1}, so the conclusion should read [b_bas(μ_x^{−1})].

## E4. A circular definition in §2.2.6 (misprint)

"ι is accommodating if there is a finite collection of accommodating embeddings ι_j …" defines the notion in terms of itself. The factors should be the *strictly* accommodating embeddings defined just before, as in Noot.

## E5. The auxiliary group in Lemma 2.2.8 (gap)

To produce a Q-rational map I_{s₀} → G^ab, the proof takes G′ = G × T acting on V ⊕ V. It maps I_{s′₀} to T through the CM factor A_T and says the composite to G^ab "factors through I_{s₀}, as this is true over Q_ℓ".

**Why it fails as written.**
- G × T does not preserve ψ ⊕ ψ up to a scalar, so it is not a subgroup of GSp(V ⊕ V).
- The factorization is false. The automorphisms (1, t), t ∈ T, lie in I_{s′₀} and in the kernel of I_{s′₀} → I_{s₀}, yet map onto G^ab.

**Repair.** Take G′ = G ×_{G^ab} T instead.
- It sits in GSp(V ⊕ V).
- X × {h_T} maps into it, since h^ab is constant on X.
- The kernel T ∩ G^der of G′ → G dies in G^ab, so the factorization holds.

The lemma is used in the proof of Proposition 2.2.2.

## E6. Lemma 2.2.11 needs reduced and separated (error)

The lemma concludes σ = w₀ from agreement on a dense set of points. That needs S reduced and separated. Two counterexamples with W trivial:
- **Not reduced:** on Spec k[ε]/ε² (char k ≠ 2), ε ↦ 2ε fixes the only point.
- **Not separated:** on the line with doubled origin, swapping the origins fixes all other points.

The lemma is applied to a torus, so nothing changes.

## E7. The complement and the log structure in A.2 (misprint)

The appendix sets "j : U = D − S ↪ S" and gives S "the log structure j_*O_U". The open set is U = S − D, where the abelian scheme lives. The log structure is the divisorial one, O_S ∩ j_*O_U^× → O_S; the sheaf of rings j_*O_U is not a log structure.
