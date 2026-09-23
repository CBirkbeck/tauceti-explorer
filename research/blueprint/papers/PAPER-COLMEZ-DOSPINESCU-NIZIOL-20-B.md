# PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B — Colmez–Dospinescu–Nizioł, *Cohomologie p-adique de la tour de Drinfeld : le cas de la dimension 1*

Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, **J. Amer. Math. Soc. 33 (2020), 311–362**, [doi:10.1090/jams/935](https://doi.org/10.1090/jams/935), arXiv [1704.08928](https://arxiv.org/abs/1704.08928). In French.

Read in full in the **published** version: the AMS PDF, 52 pages, SHA-256 `db810ee0b4017eba2f30801c8cc76df6d61f3b32a6ef07cb891586e4121f0a16`, retrieved 2026-09-23. Locators are printed pages (311–362).

> **JAMS opens its back content six years after publication** (the journal record gives `YearsUntilFree: 6`), so volume 33 (2020) is now free and the published text could be read directly instead of a preprint. Worth remembering for any AMS paper older than six years. The authors' final version (`niziol/GPW5.pdf`, 60 pp.) agrees with the published text word for word — same reference numbers, same statement numbers — and its text layer extracts far more cleanly, so it was used for reading and every quotation was then checked in the AMS PDF. arXiv v2 (June 2018) is the *earlier* submitted version (received May 2017, revised August 2019) and was used only for its LaTeX source.

**Status: `complete`.** 102 items (81 missing, 21 planned), 15 routes, 17 prerequisites, 6 source issues, 6 gaps.

## What the paper proves

For ℓ ≠ p, the ℓ-adic cohomology of the Drinfeld tower realises the classical local Langlands and Jacquet–Langlands correspondences. This paper shows that the **p-adic** étale cohomology realises the **p-adic** local Langlands correspondence:

> **Theorem 0.2.** For `F = Q_p` and `V` absolutely irreducible of dimension ≥ 2: if `V` is supercuspidal of dimension 2 with Hodge–Tate weights 0 and 1, then `Hom_{W_{Q_p}}(V, H¹_ét(M_∞,Q_p(1))) = JL(V) ⊗ Π(V)*`; otherwise it is 0.

So Colmez's `Π(V)` is constructed geometrically for those `V`, and the socle of `H¹_ét(M_∞)` contains nothing else (beyond smooth characters from `Ω_Dr × π_0`). Remark 0.3 stresses how surprising the second half is: only de Rham representations of weights 0 and 1 appear, "comme si `M_∞` était une courbe algébrique", in sharp contrast with the Lubin–Tate tower, where every finite-dimensional representation with 0 as a generalised Hodge–Tate weight occurs with infinite multiplicity.

Four independent ingredients:

1. **Étale = G-bounded pro-étale** (Proposition 2.12). `H¹_ét(M_n,L(1))` is exactly the set of `G`-bounded vectors of `H¹_proét(M_n,L(1))`; dually, `Π(V)*` is the `G`-bounded part of `(Π(V)^an)*` because `Π(V)` is the universal unitary completion of `Π(V)^an`.
2. **A fundamental diagram for any Stein curve** (Theorem 3.3). From the fundamental exact sequence of pro-étale period sheaves and Scholze's `Ω¹_ét ≅ R¹ν_*Ô(1)`, `H¹_proét(X,Q_p(1))` is an extension of `~HK(X)` by `O(X)`, compatibly with `0 → O(X) → Ω¹(X) → H¹_dR(X) → 0`. §0.6.1 sketches an alternative syntomic route, which is the one that generalises to higher dimension.
3. **The Hyodo–Kato and de Rham cohomology of the tower** (Theorems 0.4/5.10) in terms of the *classical* correspondences, via p-adic uniformisation of Shimura curves and Carayol–Saito — and, where the p-adic correspondence is unavailable, via a new comparison **`H¹_{dR,c}(LT^ϖ_∞) ≅ H¹_{dR,c}(M^ϖ_∞)`** (Theorem 0.6), proved through the Scholze–Weinstein isomorphism of the *completed* towers. Remark 0.7 notes why this is surprising: perfectoid spaces have no sensible de Rham cohomology, "extraire des racines d'ordre p^∞ et compléter rend la dérivation problématique".
4. **The Breuil–Strauch conjecture** (Proposition 0.9), proved by Dospinescu–Le Bras — the only place the p-adic correspondence enters, and the reason the main theorem is restricted to `F = Q_p`.

An appendix builds a `G × Ǧ × Gal_F`-equivariant semi-stable model of every level, which is what makes Hyodo–Kato cohomology available; since `M^ϖ_n` is **not compact** this does not follow from semi-stable reduction, and the proof goes through Berkovich triangulations, using the `G`-action to reduce to the compact case.

## Routing — one new roadmap and one Part II

The atlas turns out to plan a great deal of the input, including two stages that a keyword sweep missed because the atlas writes "Lubin–Tate" with an en dash:

| # | route | roadmap | area | items |
|---|-------|---------|------|-------|
| 1 | new | **`ProetaleCohomologyOfPAdicCurvesAndTowers`** | `padic` | 55 |
| 2 | part-ii | **`PadicLocalLanglandsForGL2QpPartIIGeometricRealisation`**, parent `PadicLocalLanglandsForGL2Qp` | `langlands` | 26 |
| 3–15 | source | `EndoscopicTransferAndUnitaryTraceComparison` ET.6a · `PadicHodgeTheory` P8/R06.3 · `CrystallineCohomology` CR.6 · `CohomologyComparisons` CP.4 · `PrismaticCohomology` PR.4 · `PerfectoidSpaces` P1/P2 · `PadicLocalLanglandsForGL2Qp` R30.2/R30.3 · `GL2AutomorphicRepresentationsAndTransfer` R16.3/R17.1/R17.3 · `AutomorphicGaloisRepresentations` R19.4/R19.5 · `HilbertModularVarietiesAndShimuraCurves` R18.5 · `TropicalAndBerkovichArithmetic` TB.1/TB.2 · `VectorBundlesAndIsocrystals` VB3 · `AdicEtaleGeometry` A1 | — | 19 planned |

**`EndoscopicTransferAndUnitaryTraceComparison:ET.6a` is the decisive find.** It is titled "Two-tower cohomological realization (mixed characteristic)" and already plans: the Lubin–Tate tower with its `GL_n(E)`, `D^×` and `W_E` actions; the Drinfeld tower with its level maps, **period morphisms** and compact-support complexes; "the infinite-level moduli description and duality isomorphism" from Scholze–Weinstein §§6–7; and the supercuspidal isotypic realisation — that is, **non-abelian Lubin–Tate theory**, quoted here as Proposition 5.1. So the towers, their equivariant identification at infinite level, the Gross–Hopkins period map and the ℓ-adic decomposition are all `planned`, and this paper is a *source* for them (it is the paper that uses the equivariance of the Scholze–Weinstein isomorphism "pleinement"). Likewise `VectorBundlesAndIsocrystals:VB3` plans Banach–Colmez geometry, so Colmez's Banach Space `X⁺_st(M)` with its Dimension `([L:Q_p],2)` is planned too.

**Route 1 exists because the atlas has nothing on a non-proper p-adic curve.** `AdicEtaleGeometry` builds the sites, `PadicHodgeTheory` P8 the period sheaves, `CohomologyComparisons` and `CrystallineCohomology` the comparison theorems for proper formal models. None of them provides the Stein package the paper runs on — affinoid exhaustions with `R¹ lim = 0`, Kiehl's theorem, Serre duality on a Stein curve, Scholze's `R¹ν_*Ô` computation, the two local computations for a disc and an annulus, the closedness of the image of `dlog` and the injectivity of `λ_X` — nor any of the cohomological computations for the tower (Theorems 4.1, 5.8, 5.10, 5.11), nor the equivariant semi-stable models of Appendix A. That is 55 items with no home.

**Route 2 is a Part II of the p-adic local Langlands roadmap**, not a new roadmap and not a source: the parent builds `Π(V)` through Colmez's functor (R30.3) in the representation categories of R30.2, and a *geometric realisation of that correspondence* is new layers in precisely its direction, while no stage of the parent mentions the tower. It carries the main theorems, the classification statements (`V_{M,L}`, Proposition 2.5, Lemma 2.7, Remark 2.6), the finite-length statement Theorem 2.15 with its linear-algebra Lemma 2.18, the `G`-bounded-vectors theorem, and the representation theory the construction needs — the Steinberg representation in its smooth, continuous and locally analytic forms with its duals, which nothing in the atlas builds.

One `planned` item is deliberately left unrouted: the existence and uniqueness of semi-stable and stable models of an algebraic curve is planned by the **Tau Ceti** stable reduction roadmap (layers 5, 7, 8), and a source route may not re-plan a Tau Ceti roadmap. What Appendix A adds — the equivariance of every step under `Aut_K(X) × Gal(K′/K)` — would be a Part II of that roadmap.

## Source issues — 6, each verified in the published text

Crossref has no correction, erratum or update relation for the DOI (checked 2026-09-23), the AMS article page lists no corrigendum, and the authors' later papers on the same tower carry no correction notice. This is a carefully written paper and the findings are all small; four sit inside proofs.

- **E1 (proof of Proposition 4.8, p. 345).** "Le (ii) est une conséquence directe du (i) … **Pour montrer le (ii)**, on montre d'abord que l'action de `G_j` … peut se dériver" — the rest of the proof establishes **(i)**; as printed the proof announces (ii) twice and (i) never.
- **E2 (proof of Proposition 5.2, p. 349).** "qui découle de l'hypothèse **`Π_p ≃ JL(M)`**" — the hypothesis fixed on p. 348 is `Π̌_p = JL(M)`, with `Π_p = LL(M)`; the isomorphism being justified concerns `ρ_{Π̌,p}`.
- **E3 (§5.4.2, p. 355).** "le noyau `t(B⁺_st ⊗ M)^{N=0,φ=1}` de `θ: (B⁺_st ⊗ M)^{N=0,φ=1} → C ⊗ M_dR`" — the source of `θ` must be `X⁺_st(M) = (B⁺_st ⊗ M)^{N=0,φ=p}`; as printed the source equals the kernel.
- **E4 (Proposition 5.16, p. 355).** `C(S_p(U),F) = H⁰(G, Hom(π, LC(S(U)))⊗X` — a closing parenthesis is missing; that `X` sits outside the invariants is the content of the proof and the way the proposition is applied three lines later.
- **E5 (§5.4.2, p. 355).** `Hom_G(π, LC(U^p)) ⊗_L Z ≃ (B⁺_st ⊗ H¹_HK(Sh_n(U)[M]))^{φ=p,N=0}` — two slips: `U^p` is undefined (the space is `S(U)`, as in Proposition 5.16, which is what is being applied), and the `M`-part is taken of `H¹_HK(Sh_n(U))`, so the bracket closes after `Sh_n(U)`.
- **E6 (Lemma 4.4, p. 343).** "des affinoïdes `X_n` dont les images inverses **dans `X`** sont des affinoïdes perfectoïdes" — must be "dans `X̂`": the inverse image of `X_n` in `X` is `X_n`, never perfectoid. The proof states the intended reading.

## Recorded as gaps

Remark 0.3 is a **programme**, not results: symmetric powers for arbitrary weights, an Emerton-style description of the full `G × Ǧ × W_{Q_p}`-structure, and everything about the completed tower (agreement with Scholze's functor, non-vanishing of `m(Π(V))`, a p-adic Jacquet–Langlands factorisation); Remarks 2.11 and 2.14 likewise only *propose* `Π^an_geo` and `Π_geo` as candidates for `F ≠ Q_p`. Two steps are carried by companion papers that were "en préparation" — the Stein-curve form of `~HK(X) ≅ (B⁺_st ⊗̂ H¹_HK(X))^{N=0,φ=p}` and the completed-tower expectations — though the route actually used in the paper is self-contained and Proposition 3.12 proves the proper-curve case. **Remark 2.6 says exactly where `F = Q_p` bites**, and the items keep the general-`F` results (Theorems 0.4, 0.6, 0.8 and all of §§3–5) apart from the `Q_p`-only identification with the correspondence. Remark 4.6 admits that the definitions of `O(∂X)` and `H¹_c(X,O)` are "parfaitement ad hoc" and only checks agreement with the natural ones in the cases at hand. And three near-identical symbols denote genuinely different objects — `M_∞`, `M̂_∞` and the completed cohomology `H̃¹_ét`, which differ by interchanging a colimit and a limit because the `M_n` are not compact — as do `~HK(X)`, `HK¹_1(X)` and `(B⁺_st ⊗ H¹_HK(X))^{N=0,φ=p}`, which agree for a proper curve but not for an affinoid, where `HK¹_1(X)` is not even separated.

Separately, and recorded in the errata log rather than here because it is not a mistake of this paper: footnote 3, p. 312, states that Drinfeld asserted Proposition 0.1 for every prime ℓ including `ℓ = p`, but that — as Grosse-Klönne and Berkovich pointed out to the authors — **"la preuve de Drinfeld de ce résultat pour ℓ = p laisse beaucoup à désirer"**. The paper supplies its own proof (Theorem 1.7), so a layer citing Drinfeld for the p-adic statement must cite this paper instead.

## Checks

`scripts/check_paper.py`: ok with `"status": "complete"`, so exactly-once routing of the 81 missing items is enforced. All route areas are galaxy ids of `data/galaxies.json`; the proposed new id and the Part II id are free in the atlas, in `research/blueprint/roadmaps/` and in every other paper extraction; the `part-ii` parent exists and is of atlas origin; and every `planned` stage id was checked against `data/atlas.json`.
