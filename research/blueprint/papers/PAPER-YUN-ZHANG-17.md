# PAPER-YUN-ZHANG-17: Shtukas and the Taylor expansion of L-functions

Zhiwei Yun and Wei Zhang, *Shtukas and the Taylor expansion of L-functions*, [Ann. of Math. 186 (2017), no. 3, 767–911](https://doi.org/10.4007/annals.2017.186.3.2); arXiv [1512.02683](https://arxiv.org/abs/1512.02683).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1163). Status: **complete**. The whole paper was read and every missing item is routed once. The machine-readable extraction is [PAPER-YUN-ZHANG-17.result.json](PAPER-YUN-ZHANG-17.result.json): 43 items (7 planned, 36 missing), 5 routes, 31 prerequisite entries and 8 recorded source issues.

**Source.** The **published version** was read in full (145 pp., from the author's copy at `math.mit.edu/~zyun/Taylor_Expansion_published.pdf`, SHA-256 `b02ed5cb…c50fc111`, fetched 2026-09-22); locators are journal pages (journal page = pdf page + 766). **arXiv v3** (24 January 2017) carries the same 112 numbered statements; each recorded misprint was compared with it, and the one place where the two differ is named. Pages 902, 903, 887 and 905 were also read as rendered images, because a text layer flattens the superscripts on which items E1, E2 and E4 turn.

## What the paper proves

**Setting.** X is a smooth proper geometrically connected curve over k = F_q (p > 2), ν : X′ → X an étale double cover with X′ geometrically connected, G = PGL_2, and T = (Res_{F′/F}G_m)/G_m the resulting nonsplit torus. Sht^r_G is the moduli of PGL_2-shtukas with r legs (dimension 2r), Sht′^r_G = Sht^r_G ×_{X^r} X′^r, and Sht^μ_T the moduli of T-shtukas with r legs — a smooth proper Deligne–Mumford stack of dimension r, finite étale over X′^r. Its image θ^μ_*[Sht^μ_T] is the **Heegner–Drinfeld cycle**, of middle dimension in Sht′^r_G.

**Theorem 1.2.** For r even and π everywhere unramified cuspidal,

  (1/(2(log q)^r|ω_X|))·ℒ^{(r)}(π_{F′}, 1/2) = ([Sht^μ_T]_π, [Sht^μ_T]_π)_π,

with ℒ(π_{F′}, s) = ε(π_{F′}, s)^{−1/2}L(π_{F′}, s)/L(π, Ad, 1), self-dual under s ↦ 1−s.

**Every** Taylor coefficient is an intersection number: r = 0 is Waldspurger's formula (Remark 1.3), r = 1 the Gross–Zagier formula over function fields. Theorem 1.6 is the same identity in ℓ-adic cohomology; Theorem 1.1 and Theorem 7.16 are the underlying spectral decompositions (each π-eigenspace of W has dimension ≤ 1); Theorem 1.7 deduces that the intersection pairing is **positive definite** on the cuspidal part — evidence for the Hodge standard conjecture for a subquotient of Ch_r(Sht′^r_G); Theorem 1.8 is a Kronecker limit formula for the Eisenstein part.

**Method (§1.7).** Two relative trace formulae are compared, and the theorem follows from the key identity I_r(f) = (log q)^{−r}J_r(f) for all f ∈ H. The proof is global throughout: no local orbital integrals are matched, and in fact the orbital expansions agree term by term (Remark 1.10).

- **Analytic side (§§2–4).** J(f, s) = ∫^{reg}_{[A]×[A]}K_f(h_1,h_2)|h_1h_2|^sη(h_2) is a Laurent polynomial in q^s (Propositions 2.1, 2.3), with an orbital expansion over u = inv(γ) ∈ P¹(F) ∖ {1} computed explicitly for f = 1_K (Proposition 2.4: L(η,2s) + L(η,−2s) at u ∈ {0, ∞}), and — after the Eisenstein ideal kills the Eisenstein part of the kernel (Theorem 4.3) — the spectral expansion J(f,s) = (1/2|ω_X|)Σ_π ℒ(π_{F′}, s+1/2)λ_π(f) (Proposition 4.5, Theorem 4.7), which is Waldspurger's formula by Jacquet's relative trace formula.
- **Geometric side (§§5–7).** The Hecke action on Sht^r_G is defined by cycles on the *whole* stack rather than by étale correspondences away from bad points (Proposition 5.10), so I_r(f) is defined for every f. It is rewritten as a trace on a Hitchin-type moduli stack M_d (Theorems 6.5–6.6) — the hardest part, and where the Octahedron Lemma is used. A finiteness analysis of the Hecke action on H^{2r}_c(Sht_G) (Lemmas 7.9–7.13) makes the image H_ℓ a finitely generated algebra of Krull dimension one, giving the orthogonal spectral decomposition (Theorems 7.14, 7.16).
- **Comparison (§§3, 8–9).** Both sides become Frobenius traces on direct images over the same base A_d: Rf_{M,*}Q_ℓ ≅ ⊕_{i,j}K_i ⊠ K_j with the Hecke correspondence acting by (d−2j) (Propositions 8.2–8.3), while Rf_{N_d,*}L_d ≅ K_{d₁₁} ⊠ K_{d₁₂} as a middle extension (Proposition 8.5). Hence (log q)^{−r}J_r(u, h_D) = I_r(u, h_D) orbit by orbit for deg D large (Theorem 8.1), and then for all f ∈ H by a density argument in H_ℓ (Lemma 9.1, Theorem 9.2).

**Appendix A** builds the intersection theory this needs on Deligne–Mumford stacks locally of finite type: Chow groups of proper cycles with the 1/|Aut| degree, a *corrected* filtration on K′_0 through finite flat presentations (the naive one is wrong for stacks and can be nonzero in negative degrees), the compatibility of refined Gysin maps with derived pullback (Proposition A.5), the **Octahedron Lemma** (Theorem A.10: intersections may be taken in any order), and a Lefschetz trace formula against the graph of Frobenius (Proposition A.12). **Appendix B** proves **super-positivity**: Λ^{(r)}(π, 1/2) ≥ 0 for self-dual cuspidal π of GL_n under RH, unconditional over function fields — the input that makes Theorem 1.7 unconditional.

## What the atlas already has

- **Library.** Nothing: no Bun_G or moduli of shtukas over a curve, no Chow groups of stacks, no perverse sheaves, no automorphic L-functions.
- **Planned** (7 items): GlobalShtukasAndFunctionFieldLanglands GS.0–GS.2 (Bun_G with level structures and HN opens, global Hecke stacks, multi-leg shtuka stacks with representability and smoothness); SchemeAndStackFoundations SF.5 (Chow groups, refined Gysin maps, intersection products, Riemann–Roch); EtaleDualityAndPerverseSheaves EDC.5 and EDC.7 (perverse t-structure and intermediate extension; purity and decomposition) and EDC.8 (cohomological correspondences and trace classes); FunctionFieldArithmetic FA.6 (G(K)\\G(A_K), compact-level functions, cuspidal subspaces, Satake) and FA.5 with AutomorphicLFunctionsAndLocalFactors AL.2 (function-field zeta and Artin factors; Godement–Jacquet standard L-functions).
- **Not in the atlas.** Cycles on moduli of shtukas and their intersection pairing; the Heegner–Drinfeld cycle; Hitchin-type moduli of the kind used in §§3 and 6; the Octahedron Lemma; the Frobenius-graph trace formula for stacks; positivity of central values or of higher derivatives of automorphic L-functions (no stage anywhere plans it).

## Routes

1. **Part II of GlobalShtukasAndFunctionFieldLanglands: `ShtukaSpecialCyclesAndHigherSiegelWeil`** (22 items) — this **joins the Part II proposed by PAPER-FENG-YUN-ZHANG-24**, keeping its id and title. That brief already says to plan the unitary higher Siegel–Weil formula "together with the Yun–Zhang PGL_2 theory it generalizes, whose Octahedron Lemma and Hecke-action computation it imports"; this is that theory, so a second roadmap would duplicate the cycle theory. It takes the main theorems, the geometrization of the orbital integrals (§3), the cycle-level Hecke action and the Heegner–Drinfeld cycle (§5), the Hitchin-type stacks and the trace/Gysin rewriting of I_r (§6), the cohomological spectral decomposition (§7) and the comparison (§§8–9). The brief refines the FYZ one in one respect: the Octahedron Lemma is routed to SF.5, so both Part II strands import it from there.
2. **Source of GrossZagierAndArithmeticHeights GZ.5** (6 items). GZ.5 plans the Waldspurger period formula by the coherent theta-kernel route; this supplies the other proof — Jacquet's relative trace formula — in the everywhere unramified function-field case, with the regularization and finiteness theorems, the explicit unramified orbital integrals, the Eisenstein ideal, and the spectral identity J_π(f,s) = (1/2|ω_X|)ℒ(π_{F′}, s+1/2)λ_π(f) in exactly the adjoint-L-value normalization GZ.5 asks for.
3. **Source of SchemeAndStackFoundations SF.5** (5 items): Appendix A §§A.1–A.3 — Ch_{c,i} of a stack locally of finite type, the K′_0 filtration through finite flat presentations, Proposition A.5 with Lemma A.8 and Corollary A.6, and the Octahedron Lemma. This is general intersection theory with no shtukas in it.
4. **Source of EtaleDualityAndPerverseSheaves EDC.8** (1 item): §A.4 — Lemma A.11 (Δ^!_M is compatible with Varshavsky's trace map τ_C through the cycle class maps) and Proposition A.12 (⟨ζ, Γ(Fr_M)⟩_s = Tr((f_!cl_C(ζ))_s ∘ Frob_s, (f_!Q_ℓ)_s)), the bridge from intersection numbers to trace formulas.
5. **Source of AutomorphicLFunctionsAndLocalFactors AL.2** (2 items): Appendix B — Proposition B.1 on entire functions of order ≤ 1, Lemma B.3 (L(π_v, s) has real coefficients for unitary π_v, from the Godement–Jacquet zeta integrals) and Theorem B.2, super-positivity. Nothing in the atlas plans positivity of central values or higher derivatives.

## Source issues (`sourceIssues` E1–E8)

All eight are misprints, and no mathematical error or gap was found. Seven are in both the published version and arXiv v3; E7 was introduced in production.

- **E1.** Proposition B.1, p. 902, and §B.2, p. 903: `φ^{(r)}(0) := (d/ds)|_{s=0}φ(s)` and `Λ^{(r)}(π, 1/2) := (d/ds)|_{s=1/2}Λ(π, s)` — the r-th derivative is meant, as the statements' quantification over all r and the proofs both require. Verified on rendered page images.
- **E2.** Remark B.4, p. 905: `2Σ_{j≥1}(s log q)^{2j}/j!` should be `/(2j)!`, since q^s + q^{−s} = 2Σ_{j≥0}(s log q)^{2j}/(2j)!. Affects this proof (the coefficient of s² is wrong by a factor 2). Verified on a rendered page image.
- **E3.** Display (B.1), p. 901: the product is indexed `∏_{i∈Z}` although the roots are "indexed by a subset I of Z_{>0}" and the convergence condition (B.2) sums over i ∈ I; the re-indexing by Z ∖ {0} happens only later, in the proof of Proposition B.1.
- **E4.** Proof of Proposition A.5, p. 887: "the image of s^* lands K_0(X′)_{Q,≤n−d}" — six lines earlier the same condition correctly reads "lands in K′_0(X′)_{Q,≤n−d}", and it is K′_0 (coherent sheaves) that carries the filtration. Verified on a rendered page image (the arrow is s^*, not s_*).
- **E5.** Same proof, p. 887: "a closed n-dimensional closed substack Y″ ⊂ Y′" — "closed" twice.
- **E6.** §A.1.6, p. 882: "convolutiton".
- **E7.** Bibliography [4], p. 909: "T. S. NSorfolk" for Timothy S. Norfolk. **Published version only**; arXiv v3 prints the name correctly.
- **E8.** Remark B.5, p. 906: "the super-positivity is known without assuming the Riemann hypothesis, by Pólya [4]" — [4] is Csordas–Norfolk–Varga, *The Riemann hypothesis and the Turán inequalities*, not a paper of Pólya.

**Also checked:**

- The two normalizations that the main theorem's constants depend on: |ω_X| = q^{−deg ω_X}, ε(π_{F′}, s) = q^{−8(g−1)(s−1/2)} with deg L(π_{F′}) = 8(g−1), and the self-duality ℒ(π_{F′}, s) = ℒ(π_{F′}, 1−s) that makes odd-order derivatives at 1/2 vanish — consistent with Theorem 1.8's 2^{r+2} and with Corollary 2.5's three cases (r = 0, r > 0 even, r > 0 odd).
- Corollary 2.5 against Theorem 1.8 and Remark 9.3: J_r(1_K) = 4L(η,0) + q − 2 = 4·#Jac_{X′}(k)/#Jac_X(k) + q − 2 for r = 0, and 2^{r+2}L^{(r)}(η,0) for r > 0 even.
- The dimension bookkeeping of §§5–6: dim Sht^r_G = 2r, dim Sht^μ_T = r (so the cycle is middle-dimensional), dim Sht^r_G(h_D) = 2r via Lemma 5.9, dim M_d = dim N_d = 2d − g + 1 for d ≥ 2g′ − 1 with g′ = 2g − 1, and the degree-(d − 2j) action of Proposition 8.3 against the (2d_{12} − d)^r weights of Corollary 3.3 — the two match under d_{12} = j.
- Appendices A–B were read in full, including every numbered hypothesis of §§A.2.8 and A.2.10 against their uses in Lemmas 6.11 and 6.14.
- Every internal cross-reference, mechanically, against the statement it names: no further defect.
- Crossref for the article (no correction notice, no `update-to` or `updated-by` relation) and the DOIs of the prerequisites, which are quoted from the paper's own bibliography.
- The sequel, *Shtukas and the Taylor expansion of L-functions (II)*, Ann. of Math. 189 (2019), 393–526 (DOI 10.4007/annals.2019.189.2.2), which removes the unramifiedness restriction: it lists no errata for this paper. It is recorded as a prerequisite so the two are planned together.

## Prerequisites not yet covered

Drinfeld and Varshavsky (moduli of shtukas; the Lefschetz–Verdier trace formula and contracting correspondences); V. Lafforgue (shtukas for reductive groups); Deligne, Drinfeld and L. Lafforgue (the Riemann hypothesis over function fields, cited by name in §B.2); Jacquet (the relative trace formula) and Waldspurger; Gross–Zagier and Yuan–Zhang–Zhang; W. Zhang (automorphic periods, arithmetic fundamental lemmas); Yun (the Jacquet–Rallis fundamental lemma); Ngô (Hitchin fibration and endoscopy, the support theorem); Laumon (geometric Langlands over function fields); BBD and Goresky–MacPherson; Laszlo–Olsson (six operations on Artin stacks); Kresch (cycle groups for Artin stacks; canonical rational equivalence), Fulton, Vistoli, Gillet, Behrend–Fantechi; Godement–Jacquet; Ahlfors (Hadamard factorization); Stark–Zagier, Csordas–Norfolk–Varga, Lapid–Rallis, Goldfeld–Huang (positivity); and the sequel, Yun–Zhang II.

Links and reasons are in the JSON.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-YUN-ZHANG-17.result.json`: ok.
- `python3 research/blueprint/intake.py check-files …`: ok.
- Every missing item appears in exactly one route, and no route takes a planned item.
- The cited stages (GS.0–GS.2, SF.5, EDC.5, EDC.7, EDC.8, FA.5, FA.6, AL.2, GZ.5) and the parent were checked against `data/atlas.json`, every accepted restructure in `data/restructure/` and `data/roadmap-retirements.json`: none is restructured or retired (RS-07, RS-28, RS-30 and RS-31 mention these roadmaps only as prerequisites or links). Library verdicts come from `data/library-coverage.json`.
- The Part II id is the one PAPER-FENG-YUN-ZHANG-24 introduced, reused deliberately with the same parent, title and area; no new id was reserved.
- No Lean was written, as none is a deliverable of this job.
