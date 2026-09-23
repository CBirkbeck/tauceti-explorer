# Mistakes in Kisin–Pappas, *Integral models of Shimura varieties with parahoric level structure*

Job ERRATA-PAPER-KISIN-PAPPAS-18. Worker: Claude Code, session `cc-442dc5`, 23 September 2026. The findings are in `PAPER-KISIN-PAPPAS-18.json` beside this file.

**Paper and version read.** Mark Kisin and Georgios Pappas, Publ. Math. IHÉS 128 (2018), 121–218, DOI 10.1007/s10240-018-0100-0. The version read is the Numdam PDF (SHA-256 `e2b4a076…`, 98 pages, printed page = PDF page + 120). The quoted passages were re-read at pp. 162, 166, 169, 173, 187 and 205.

**Earlier work.**
- The extraction PAPER-KISIN-PAPPAS-18 (complete) recorded seven findings, E1–E7. They are kept here with everything they say.
- All seven are corrections the authors themselves published in the sequel: Kisin–Pappas–Zhou, *Integral models of Shimura varieties with parahoric level structure, II*, Forum Math. Pi 14 (2026) e14 (KPZ26), in §1.3.1, Remark 5.1.17, footnote 8 and §7.3.
- This job found E8.

**Existing corrections.**
- **E1–E7** are corrected in KPZ26, so their `known` value names KPZ26.
- **Nothing is registered against the article itself.** Crossref records no correction for its DOI, and neither the Springer nor the Numdam article page links an erratum. (The only "Corrigendum" on the Numdam page belongs to a cited paper of Haines.)
- **arXiv 1512.01149** stops at v3 (April 2018), before the corrections.
- **E8 is new.**

**Effect on the main results.** This paper's final results need an extra hypothesis. Theorem 4.2.7, Corollaries 4.2.12–4.2.13 and the local-model diagram of Theorem 4.6.23 hold only for **very good** Hodge embeddings (E1–E3). KPZ26 supplies the corrected theorems: Theorem 7.1.3 and Theorem 7.2.21.

## E1 — Lemma 3.1.9: the connection isomorphism is not canonical (p. 166)

- **The error.** The proof builds the isomorphism c from a normal decomposition M = L ⊕ T. The result depends on that choice.
- **Why the diagram doesn't pin c down.** The diagram's horizontal maps need not be injective, even when Ŵ(R) is p-torsion free.
- **Consequence.** Lemma 3.1.12 fails for this c.
- **The correction.** KPZ26 Lemma 5.1.15 replaces the construction, following Hoff and Zink. The error was pointed out by M. Hoff, [Ho23, Rem. 2.29].

## E2 — §3.2.12: Ψ_{R_G} needs a very good embedding (p. 173)

- **The error.** The isomorphism Ψ_{R_G} preserving the tensors is said to exist "as G is smooth".
- **Why it fails.** Smoothness does not give it. It exists only when the Hodge embedding is very good (KPZ26 Definition 5.2.5).
- **What changes.** Lemma 3.2.14 and Propositions 3.2.17 and 3.3.13 hold with that hypothesis, with the same proofs.

## E3 — the main theorems inherit the hypothesis (pp. 186–188, 208)

- **What changes.** Theorem 4.2.7 and Corollaries 4.2.12–4.2.13 go through Ψ_{R_G}, so they need the very-good hypothesis.
- **The replacements.** Theorem 4.2.7 is replaced by KPZ26 Theorem 7.1.3, and Theorem 4.6.23 by KPZ26 Theorem 7.2.21.

## E4 — the proof of Theorem 4.2.7: q^loc is not a torsor (p. 187)

- **The error.** "One sees easily that q^loc is a G-torsor" is false.
- **The correction.** q^loc is isomorphic to the action morphism G × M^loc → M^loc. That morphism is smooth, and smoothness is all the proof uses.

## E5 — the proof of Lemma 3.1.17: the wrong topology (p. 169)

- **The gap.** The series is summed in the topology τ, but Ŵ(A)[1/p] is not complete for τ.
- **The repair.** KPZ26 §7.3.1(2) shows Ŵ(A)[1/p] is p-adically complete and separated, and that p^{−m}φ^m(x) → 0 p-adically, using Zink's logarithmic coordinates (p > 2).

## E6 — Lemma 4.6.13 and Corollary 4.6.15: the component levels (pp. 202–203)

- **The error.** The connected Shimura varieties in the union must have the conjugated levels jK°_p j^{−1} (j ∈ J), not the single level K°_p.
- **The correction.** KPZ26 §7.3.1(3) gives the corrected formula and the corrected integral model.

## E7 — §4.6.21: H♯ is not defined for every classical (H, Y) (p. 205)

- **The error.** The paper asserts H♯ exists for any (H, Y) with H of classical type.
- **The correction.** The third defining condition can fail in general. It holds when (H^ad, Y^ad) is of abelian type, which is the case used (KPZ26, footnote 8).

## E8 — §2.3.15: the rank of the Grassmannian (p. 162)

- **What the paper says.** "the smooth Grassmannian Gr(V′_{Z_p}) classifying subbundles F ⊂ V′_{Z_p} ⊗ O_S of rank dim_{Q_p}(V′)".
- **Why it is wrong.** μ₀ comes from a symplectic Hodge embedding, so the Hodge filtration is Lagrangian, of rank ½·dim V′. Subbundles of full rank would make this Grassmannian a point.
- **The correction.** Rank ½·dim_{Q_p}(V′).
- **Effect.** A misprint with a clear intended form; it affects nothing. The extraction's item M13 already uses Gr(g′, Λ′) with 2g′ = dim V′.
