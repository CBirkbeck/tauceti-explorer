# PAPER-DISEGNI-LIU-24: A p-adic arithmetic inner product formula

Daniel Disegni and Yifeng Liu, *A p-adic arithmetic inner product formula*, [Invent. Math. 236 (2024), no. 1, 219–371](https://doi.org/10.1007/s00222-024-01243-7); arXiv [2204.09239](https://arxiv.org/abs/2204.09239).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1228). Status: **complete**. The whole paper was read and every missing item is routed once. The machine-readable extraction is [PAPER-DISEGNI-LIU-24.result.json](PAPER-DISEGNI-LIU-24.result.json): 62 items (9 planned, 53 missing), 7 routes, 20 prerequisite entries and 7 recorded source issues.

**Source.** The article is open access (CC BY 4.0), so the **published version** was read in full: 153 pages, SHA-256 `e8c4e026fab0fe89fd7dcbc724009af7b867ad910937ffb9fa7e72289f0f1ef8`, fetched 2026-09-22; locators are its journal pages. **arXiv v3** (23 February 2024, "to appear in Invent. Math") was consulted throughout and checked at every recorded misprint: it agrees with the published text.

## What the paper proves

**Setting.** E/F is a CM extension of number fields in which every p-adic place of F splits; n = 2r; G_r = U(W_r) is the quasi-split unitary group; π is a *relevant* representation of G_r(A^∞_F) with coefficients in a p-adic field L (Definition 1.1: tempered cuspidal with holomorphic discrete series at infinity), **Panchishkin unramified** above p — equivalently, ordinary for the Siegel parabolic.

**Theorem 1.4 (= 3.37): the cyclotomic p-adic L-function.** There is a unique L-valued p-adic measure L^♦_p(π) on Γ_{F,p} interpolating L(1/2, BC(ιπ^♦) ⊗ ιχ^♦) against explicit periods, the archimedean constant Z_r and the gamma factors Π_{v|p}Π_{u|v}γ((1+r)/2, π_u ⊗ χ_v, ψ)^{−1}, **for every** embedding ι: Q_p → C.

**Theorem 1.7 (= 4.20) and Theorem 1.8 (= 4.21).** Under Assumption 1.6 and n < p, if ord_{χ=1}L^♦_p(π) = 1 then Kudla's generating series of Selmer classes is modular, and for the resulting **Selmer theta lifts**
⟨Θ^Sel_{φ_1}(ϕ_1), Θ^Sel_{φ_2}(ϕ_2)⟩^♮_{π,F} = ∂L^♦_p(π) · Π_{v|p}Π_{u|v} γ((1+r)/2, π_u, ψ_{F,v}) · Π_{v∈♦} Z(ϕ^†_{1,v} ⊗ ϕ_{2,v}, f^{SW}),
the left-hand side being Nekovář's p-adic height. If the order is not 1, the heights vanish. Corollary 1.9 gives dim H^1_f(E, ρ_π(r)) ≥ 1, and Corollary 1.12 the same for Sym^{n−1} of an ordinary modular elliptic curve over F.

**Method.**
- **§§2–3 (analytic side).** The doubling method with a family of *big-cell* sections f^{[e]}_{χ_p} on which the U_p-operators act by translation (Lemma 3.11); no Weil representation and no explicit Schwartz function at p are needed, only Fourier transforms, and the local doubling zeta integral at p produces the gamma factors directly (Proposition 3.32). Rationality is obtained on Siegel hermitian varieties over Q_p compared with PEL moduli, where the algebraic q-expansion principle lives (§2.3).
- **§4 (geometric side).** V_{π,L} is the θ_π-part of H^{2r−1}_ét(X_L, L_π(r)) and ℘_π lands in H^1(E, V_{π,L}) (Lemmas 4.6–4.8); it is crystalline at p and satisfies the Panchishkin condition (Lemmas 4.9, 4.14), so Nekovář's height pairing exists. The global height decomposes into local ones; away from p these are Beilinson's local indices (Proposition A.7) and are known from Li–Liu; above p they are shown to **tend to 0 p-adically** along the U_p-iteration (Proposition 4.35). A limit argument (§4.8) and a p-adic doubling formula (Proposition 4.48) finish both theorems.
- **Appendices.** Appendix A develops p-adic heights for cycles: bi-extensions, the comparison of Nekovář's and Beilinson's local indices, the Panchishkin condition, and **Theorem A.8** — on a proper strictly semistable model with n < p, after localising the Hecke ring away from the deeper strata, the bi-extension of two cycles with disjoint closures is crystalline. Appendix B proves it, through log syntomic cohomology, rigid de Rham–Witt complexes, log rigid cohomology with proper support and its weight spectral sequence, de Jong's alterations and Tsuji's C_st.

## What the atlas already has

- **Library.** Nothing. There are no unitary Shimura varieties or special cycles, no doubling method, no p-adic measures attached to automorphic forms, no Selmer groups with local conditions, no crystalline or rigid cohomology.
- **Planned** (9 items): PadicMeasuresIwasawaAlgebras L0a/L1/L3 (character spaces, completed group rings, measures and derivatives); ShimuraVarieties V6 (canonical models, hence X_L); EtaleDualityAndPerverseSheaves EDC.3 with ArithmeticGaloisDuality R02.2 (cycle classes and Hochschild–Serre); SelmerIwasawaCohomology L2/L4 (Selmer structures and the Bloch–Kato conditions); ArithmeticGaloisDuality D7 (continuous derived cohomology, i.e. Jannsen's theory of §A.2); PadicHodgeTheory R06.1/R06.2 (period rings, D_dR, D_cris, admissibility); CrystallineCohomology CR.6 with CohomologyComparisons CP.4 (Hyodo–Kato and C_st); AdicCoefficientsAndComparisons L5 (de Jong's alterations).
- **Not in the atlas.** Everything else, and in particular **p-adic height pairings**: the only heights planned anywhere are the quadratic-Chabauty heights (NC.5) and the rank-one p-adic Gross–Zagier/BDP formula (GZ.9).

## Routes

1. **New Part II of GrossZagierAndArithmeticHeights: `PadicArithmeticInnerProductFormula`** (18 items) — "Gross–Zagier formulas and arithmetic heights, Part II: Selmer theta lifts and the p-adic arithmetic inner product formula". It takes the θ_π-part and ℘_π, the Selmer generating function and the Modularity Hypothesis, the Selmer theta lifts, the reduction of modularity to a height identity, the choice of Schwartz functions with the U_p-operators, the local height computations away from and above p, the limit formalism, and Theorems 4.20, 4.21 with Corollaries 1.9 and 1.12. It **imports** the complex `UnitaryArithmeticInnerProductFormula` Part II (Li–Liu) rather than repeating it, and is its p-adic sibling: the objects are Selmer classes, not cycles in Chow groups, and the paper itself notes (Remark 4.47) that the method cannot produce the latter.
2. **New Part II of SelmerIwasawaCohomology: `SelmerComplexesAndPadicHeights`** (14 items) — "…, Part II: p-adic height pairings and bi-extensions of cycles". It takes the whole of Appendix A (admissible objects and the continuous Hochschild–Serre edge map, the localisation diagram and bi-extension of two cycles, Nekovář's and Beilinson's local indices with Scholl's comparison, the Panchishkin condition, the height pairing and its local decomposition, Theorem A.8) together with the parts of Appendix B that prove Theorem A.8 (log syntomic Abel–Jacobi maps, Proposition B.9, the Hecke localisation and Proposition B.11, the alteration argument and the barred complexes), and the local decomposition (4.8) used in §4.5.
3. **Source of AutomorphicPadicLFunctions L4–L5** (15 items): the entire construction of the p-adic L-function — Siegel hermitian varieties and the PEL comparison, the doubling degenerate principal series and Whittaker functionals, the sections f^{[e]}_{χ_p} and the U_p-operators, the Eisenstein family and its rational pullback, Panchishkin unramified representations, the local zeta integrals, Theorem 3.37 and Proposition 3.39.
4. **Source of MetaplecticAutomorphicForms MP.2–MP.3** (2 items): the unitary Weil representation with the Siegel–Weil section and measure, and the rationality of local theta lifts (dichotomy space V_{π_v}, π-coherence, Galois equivariance over Q_π).
5. **Source of PadicDifferentialEquationsAndRigidCohomology RD.4** (2 items): tubular neighbourhoods and the functor f^!_{(U,X)}, admissible embedding systems, **log rigid cohomology with proper support** (Definition B.4) and its weight spectral sequences (Lemmas B.5–B.6).
6. **Source of CrystallineCohomology CR.4–CR.6** (1 item): the rigid (convergent) de Rham–Witt complexes ω_X, ω̃_X with the monodromy triangle, their proper-support versions, the comparison with Wω^•_X and Sato's cohomological variant.
7. **Source of PadicHodgeTheory R06.1** (1 item): Breuil's rings 𝒦 and B̂⁺_st, Lemma B.13 (B⁺_st = (B̂⁺_st)^{N-nilp}, flatness, surjectivity of N) and Lemma B.14 on the Frobenius-isotypic part.

## Source issues (`sourceIssues` E1–E7)

All seven are misprints; no mathematical error or gap was found, and each was checked in arXiv v3 as well as in the published text.

- **E1.** The proof of Lemma 3.6 writes V^(v)_F for V^(w)_F (twice); w is the fixed rational place, v the index of the product.
- **E2.** Definition 3.21 defines "π_v is Panchishkin" where the notion, used everywhere else, is "Panchishkin **unramified**".
- **E3.** §4.8 cites "(Notation 4.33)" for Notation 4.32, which defines Herm°_{2r}(F)^+_V and v_{T□}. A mechanical check of every internal cross-reference found no other mismatch.
- **E4.** In the proof of Lemma A.5: the display describing H^q_G(S, C_L)_0 writes E^q_L three times for C^q_L; "the choice of x" should be "of a"; and ν^q(y^q) should be ν^q(b^q).
- **E5.** In §A.3 the clause fixing κ_{c′} names H^{2d−2}(−, L(d)) where its source is H^{2d−2}(Z′, L(d−1)) (the L(d)-statement is the one for κ_{c′}(1)).
- **E6.** In the third application of Proposition B.11 (proof of Theorem A.8) the target is printed H^{2d−1}_c(Ū_t, L(d)) where Proposition B.11 gives H^{2d−1}_c(Ū, L(d)); the subscript also clashes with the t := t_1t_2 of the same sentence.
- **E7.** Notational slips in the appendices: Lemma A.4 is stated over Z_{p•} but applied (p. 363, via Lemma B.21(5)) to a W_•-object; "H^q_K" for H^q_{G_K} (p. 367); "H^q_rig(V(h), W°)" for H^q_rig(V(h)/W°) (Lemma B.20); and "wit", "factors though" (twice), "edges maps".

**The paper's own errata for Li–Liu (§4.10).** Remark 4.50: in both Li–Liu papers χ^R_{π^∨} was mistakenly identified with (χ^R_π)^c, so [LL21, Prop. 6.10(1)] and the choices in S^R_{Q^ac} must be restated; the proofs are unaffected. Remark 4.51: Shah's preprint arXiv:2310.01677 shows that two formulae in the proof of [LL21, Lemma 4.4] are wrong in general, and a correct argument is given here. Both are recorded in PAPER-LI-LIU-21 and PAPER-LI-LIU-22 as well.

**Also checked:**
- the archimedean constant Z_r = (−1)^r 2^{−r²−r}π^{r²}Γ(1)⋯Γ(r)/(Γ(r+1)⋯Γ(2r)) on a rendering of the page, since the text extraction flattens exponents;
- the internal consistency of the Panchishkin formalism in the symmetric-power example of §1.4: with α_{v,1} a unit and val(α_{v,2}) = 1, the multiset A(π_u, r) has exactly one unit, coming from the r parameters of valuations 0, …, r−1, and the valuation bookkeeping matches γ_{u,r} ∈ O^×_L;
- the rationality computation b^∞_{2r}(1) ∼ π^{r(2r+1)[F:Q]} in the proof of Lemma 3.2 (π^{r²} against π^{−r(r+1)});
- every internal cross-reference in the paper, mechanically, against the statement it names (only E3);
- Crossref for all twenty prerequisite entries and for the article itself: no correction notice or update relation. (Disegni's *universal p-adic Gross–Zagier formula*, cited as [14], does carry a published correction, Invent. Math. 243 (2025), 243–244; it is not used in the proofs here.)

## Prerequisites not yet covered

Li–Liu I and II (the complex formula and all the local indices); Nekovář's three papers on p-adic heights; Eischen–Harris–Li–Skinner; Kudla–Sweet and Tan on degenerate principal series; Wallach and Karel on Whittaker functionals; Li–Zhang (JAMS 2022); Liu's arithmetic theta lifting papers and his almost unramified theta correspondence; Harris–Kudla–Sweet, Gan–Ichino, Gong–Grenié on theta dichotomy; Mok and Kaletha–Minguez–Shin–White; Caraiani and Taylor–Yoshida; Kisin–Shin–Zhu (for Hypothesis 4.11); LTXZZ; Rapoport–Smithling–Zhang; Scholl and Beilinson; Shnidman; Lan; Newton–Thorne; Disegni's p-adic Gross–Zagier formulas; Perrin-Riou; Shah. The appendices add Berkovich, Berthelot, Breuil, Colmez–Fontaine, de Jong, Grosse-Klönne, Hyodo and Hyodo–Kato, Jannsen, Kato, Langer, Mokrane, Sato (two papers), Tsuji (two papers) and Yamashita.

Links and reasons are in the JSON; the DOIs printed in the paper's bibliography were spot-checked on Crossref and are correct.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-DISEGNI-LIU-24.result.json`: ok.
- `python3 research/blueprint/intake.py check-files …`: ok.
- Every missing item appears in exactly one route, and no route takes a planned item.
- All cited stages (AutomorphicPadicLFunctions L4–L5, MetaplecticAutomorphicForms MP.2–MP.3, RD.4, CR.4–CR.6, R06.1–R06.2, D7, R02.2, SelmerIwasawaCohomology L2/L4, ShimuraVarieties V6, PadicMeasuresIwasawaAlgebras L0a/L1/L3, EDC.3, CP.4, AdicCoefficientsAndComparisons L5) and both parents were checked against `data/atlas.json`, every accepted restructure in `data/restructure/` and `data/roadmap-retirements.json`: none is restructured or retired. Library verdicts come from `data/library-coverage.json`.
- The two new Part II ids were checked against the routes of every existing extraction: nothing in the atlas or in the pending candidates plans p-adic heights or a p-adic arithmetic inner product formula.
- No Lean was written, as none is a deliverable of this job.

## Review (REV-PAPER-DISEGNI-LIU-24, 23 September 2026)

An independent review by Claude Code, session cc-d67081, for issue
[#1229](https://github.com/CBirkbeck/tauceti-explorer/issues/1229). **Verdict: accept.** All seven
routes accepted; nothing needed correcting in place.

- **A provenance limitation.** Springer's PDF endpoint returns a JavaScript challenge page to every
  request made here, so the recorded SHA-256 could not be re-verified. The published *text* was read
  through a rendering proxy, with the journal page map rebuilt from the running heads (146 marks,
  pp. 220–371), and every finding checked at its recorded page. Crossref records no correction.
- **All 7 mistakes confirmed**, each a misprint affecting nothing and most settled by their own
  neighbourhood: **E2** (Definition 3.21 says "Panchishkin" while Lemma 3.22 on the same page and
  Lemma 4.14 on p. 281 both say "Panchishkin unramified", the latter citing this very definition);
  **E4** (the lemma fixes `a` and the proof says "the choice of x"; `ν^q(y^q)` with `y^q` undefined
  and `ν^q(b^q)` correct two words later); **E5** (the source of `κ_{c′}` carries `L(d−1)`, and the
  next sentence applies `κ_{c′}(1)` to the `L(d)` of (A.2)); **E6** (Proposition B.11 concludes over
  `Ū`, and the subscript `t` collides with the `t := t₁t₂` of the same sentence); **E7** ("the
  corresponding edges maps", followed four words later by "the corresponding edge maps").
- **One substantive item sits inside E7:** Lemma A.4 is stated over `Z_{p•}` while Definition A.3 and
  Lemma A.5 are over `W_•` and the lemma is applied on p. 363 to an object of `D⁺_{G_K}(X_ét, W_•)`,
  so its hypothesis as printed is narrower than its use; the proof does work verbatim over `W_•`.
- **Items and routes:** 62 items (no library, 14 planned, 53 missing), each missing item routed once;
  all ten stage ids and fourteen planned targets present. The two Part IIs divide the paper correctly
  — the inner product formula extends Gross–Zagier, the bi-extensions and height decomposition extend
  the Selmer-complex roadmap — with both titles exact prefix extensions and both ids free.

Full report: `research/blueprint/reviews/REV-PAPER-DISEGNI-LIU-24.md`.
