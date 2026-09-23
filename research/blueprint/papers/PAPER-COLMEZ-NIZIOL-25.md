# PAPER-COLMEZ-NIZIOL-25 — Colmez–Nizioł, *On the cohomology of p-adic analytic spaces, II: The C_st-conjecture*

Pierre Colmez and Wiesława Nizioł, **Duke Mathematical Journal 174 (2025), 2203–2301**, [doi:10.1215/00127094-2024-0074](https://doi.org/10.1215/00127094-2024-0074).

Read in full in the **authors' version**: `webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf`, 61 pages, SHA-256 `bb1628cf…`, compiled 24 November 2024, retrieved 2026-09-23. Locators are its statement numbers together with the printed folios of that 61-page preprint, **not** the Duke pagination.

> **Provenance.** The paper *is* on arXiv, as [2108.12785](https://arxiv.org/abs/2108.12785), in four versions (v1 2021-08-29, v2 2022-07-19, v3 2024-06-20, v4 2024-11-25). Version **v4 was downloaded and compared page by page** with the authors' PDF: the two are textually identical up to glyph rendering, line breaking and the compilation date, and **every source issue below is present in v4**, the final preprint version, with identical occurrence counts. The published Duke text is behind a subscription and was not consulted, so production copy-editing may have corrected some of these; each finding says so in its `searched` field. Part I of the series, *The basic comparison theorem* (J. Algebraic Geom. 34 (2025), 481–597), is reference `[18]` and is the paper's indispensable input — see the gaps.

**Status: `complete`.** 177 items (173 missing, 4 planned; 119 theorems, 30 definitions, 28 constructions), 7 routes, 14 prerequisites, 36 source issues, 8 gaps.

## What the paper proves

Fontaine's `C_dR` and `C_st` conjectures describe the étale cohomology of a proper smooth variety over `K` in terms of de Rham and Hyodo–Kato data. This paper states analogues for an **arbitrary smooth dagger variety** — no properness, no quasi-compactness, no semistable model — and proves them for a large class.

> **Conjecture 1.4 = Conjecture 6.21 (the C_st-conjecture).** For `X` smooth dagger over `C` and `i ≤ r`, the *fundamental diagram*, with corners `H̃^i_proét(X,Q_p(r))`, `(H̃^i_HK(X) ⊗̂ B⁺_st)^{N=0,ϕ=p^r}`, `H̃^i(F^rRΓ_dR(X/B⁺_dR))` and `H̃^i_dR(X/B⁺_dR)`, is bicartesian in the left heart `LH(C_{Q_p})`.
>
> **Conjectures 1.6 and 1.8 (the converse direction).** Over `K`, `Hom^sm_{G_K}(H^i_proét(X_C,Q_p),B_st) ≅ H^i_HK(X_C)^*` as `(ϕ,N,G_K)`-modules and `Hom_{G_K}(—,B_dR) ≅ H^i_dR(X)^*` as filtered `K`-modules; over `C` the same with `Hom_TVS`, but as modules only — `ϕ`, `N` and the filtration are irrecoverably lost (Remarks 1.9, 9.9).
>
> **Theorem 1.11 + Theorem 8.1.** All of this holds if `X` is **small** (`H^i_dR(X/B⁺_dR)` free of finite rank) and has **de Rham slopes ≥ 0** (each `(H^i_HK(X), F^0H^i_dR(X/B_dR))` acyclic); and products of such, analytifications of algebraic varieties, and *almost proper* varieties are of this kind — as is a proper times a Stein variety (Proposition 8.17), by a limit argument.
>
> **Theorem 1.12.** `ht(H^r_proét(X,Q_p)) = dim_C H^r_dR(X)`.

The method is a **geometrization**. All four cohomologies are realized as *quasi*-Banach–Colmez spaces — "quasi" because the finiteness in a BC is relaxed to allow extensions by arbitrary torsion `B⁺_dR`-modules — so the diagram becomes a statement about a vector bundle on the Fargues–Fontaine curve, and bicartesianness becomes the vanishing of its `H^1`. That is why the four a priori different Conjectures 6.21, 7.1, 7.3, 7.4 turn out **equivalent** (Proposition 7.10, Corollary 7.11): acyclicity of a filtered `(ϕ,N)`-module, curvature `≤ 0` of pro-étale cohomology, and a height equality are three faces of one bundle condition. Corollary 7.9 makes this concrete: `H^{r,i}` is a qBC whose canonical filtration has `h^1(H^{i−1}_HK{−r})` above and `h^0(H^i_HK{−r})` below, and these two are exactly the obstructions to exactness.

Reaching the geometry takes four chapters of preparation, and they are the bulk of the paper: Fontaine's almost `C`-representations and the vanishing of `Hom_{G_K}` out of torsion `B⁺_dR`-objects (§2, quoted); Banach–Colmez spaces through Le Bras's equivalence `Coh⁻_X ≃ BC`, with curvature, the canonical filtration and a *categorification of height* as `rk Hom_VS(−,B_dR)` (§3); the category `qBC`, with a perfectoid computation of `Ext¹_TVS(V_1,V_1) = C` via the cover `O_C{X}[(E^{1/p^n}−1)/p^{1/p^{n+1}}]` of the unit disc and a theorem that module, Module and topological `Hom`/`Ext¹` all agree for reasonable objects (§4); and **acyclicity**, the generalization of weak admissibility to slopes `≥ 0`, with the `Hom`-computations out of a Frobenius eigenspace that drive the converse direction (§5).

## Routing — one new roadmap, one Part II, five source routes

| # | route | roadmap | items |
|---|---|---|---|
| 1 | `new` | `CstConjectureForDaggerVarieties` — the fundamental diagram and its qBC geometrization | 74 |
| 2 | `part-ii` | `VectorBundlesAndIsocrystalsPartII` — qBC's, almost `C`-representations, the `Hom`-vanishing toolkit | 49 |
| 3 | `source` | `VectorBundlesAndIsocrystals` VB0–VB3 — §3 is a review of exactly these layers | 31 |
| 4 | `source` | `PadicHodgeTheory` R06.1, R06.2 — period rings; period functors and admissibility | 13 |
| 5 | `source` | `CohomologyComparisons` CP.4, CP.3 — the algebraic `C_st` that this paper generalizes | 3 |
| 6 | `source` | `AdicSpacesPartII` F1 — dagger geometry; the home for Grosse-Klönne's Proposition 8.3 | 1 |
| 7 | `source` | `LocallyAnalyticDistributions` L0, L1 — Appendix A's three-space problems | 6 |

Nothing in the atlas compares pro-étale with de Rham cohomology for a space that is neither proper nor Stein, which is the whole point of the paper; CP.4 and R06.5 own the proper algebraic case it takes as its model. The two **neighbouring proposals in this same series** — the syntomic roadmap proposed by `PAPER-COLMEZ-NIZIOL-17` and the Stein roadmap proposed by `PAPER-COLMEZ-DOSPINESCU-NIZIOL-20` — exist so far only as proposals in those result files, not as roadmaps, so they could be named in a reason but not used as a `source` or `parent`; this paper is the sequel to the second, removing both its properness and its model hypotheses. The Part II is split off because §4 opens by *dropping* the finiteness that the parent roadmap is built on ("We need to enlarge the category `BC` to allow extensions by arbitrary `B_m`-Modules"), and because none of that work is specific to analytic spaces.

## The 36 source issues

29 misprints, 5 errors, 2 gaps; 28 affect nothing, 4 affect a proof, 4 affect a stated result. Each was checked against the printed page, in rendered clips wherever the point is glyph-level. The five errors, and the three findings established by *refuting* the printed text from the paper's own content, are the ones worth flagging here:

- **`E1` (error, §5.1.2).** The degree of a filtered `(ϕ,N,G_K)`-module is printed `deg = t_N − t_H`, **twice** on the page, but must be `t_H − t_N`. Three checks force it, and one is a computation this session did independently of the readers: for `M = F` with `ϕ(e) = pe` and a single filtration jump at `0`, the fundamental complex has `H^0 = 0` and `H^1 ≠ 0`, so `M` is *not* acyclic — while the printed formula gives degree `+1` and would call it acyclic, contradicting Remark 5.5(ii). Definition 5.13, stated directly on the bundle, is unaffected and independently fixes the intended sign.
- **`E3` (error, Corollary 3.21(iv)).** "A quotient of height 0 of a BC of curvature ≥ 0 has curvature 0" is **refuted by footnote 9 on the same page**: for `x ≠ ∞`, `U_1/Q_p t_x` has `ht = 0` and curvature `> 0`, and is a quotient of itself. Nothing downstream uses (iv) — only (ii), in Remark 3.22.
- **`E5` (error, Lemma 4.24(i)).** `Ext¹_TVS(U_d,W) ≅ W` **contradicts its own proof**, which concludes `h¹(U_d) = 0`; and part (ii) follows from (i) only *through* that vanishing.
- **`E4` (error, §3.2.2).** The fourth Harder–Narasimhan bullet is false as printed: `E_1 = O(5)` has slopes `≥ 0`, `E_2 = O` has slopes `≤ 1`, and the split extension has a slope `5 ∉ [0,1]`. Two-sided hypotheses on both terms are needed.
- **`E31` (error, Corollary 3.20(b)).** "Curvature `< 0` implies height `> 0`" needs `W ≠ 0`.
- **`E6`, `E7`, `E8` (Proposition 5.20)** — three defects in one proposition: the weakly admissible lattice is said to *contain* `M⁺_dR` where Remark 5.14(iii) and the argument both need it *contained in* `M⁺_dR` (this one affects the proof); the source of `V^r_st` is written `B_st` where `B⁺_st` is required for the map even to be defined; and `Ext` carries a natural-sign superscript that occurs **exactly once in the paper** and is nowhere defined.
- **`E12` (Lemma 8.13).** Perfectness is attributed to `RΓ_ét(T,RΓ_ét(Y,Z_p))`, which is unavailable, instead of to `RΓ_ét(Y,Z_p)`, which is what `Y` proper gives; Step 2 states the same argument correctly.

Three findings were confirmed by counting across the whole document: `"spherically closed"` occurs once against four of `"spherically complete"` (`E13`), `"Topological Pair"` once against thirteen of `"Topological Vector Space"` (`E15`), and the natural sign once (`E8`). The rest are index and reference slips — `f_i` for `f_r`, `H^i_dR` for `H^r_dR`, `⊕_{j∈J_j}` for `⊕_{j∈J_i}`, `Q_{p^{h_i}}` for `Q_{p^{h_j}}`, a stray tower subscript in (8.7), `(6.11)` for `(8.8)`, `H^r_ét` for `H^r_proét` in (6.20), a missing `F^0` in Remark 6.13(i), an empty range `0 ≤ j ≤ j−1` in Lemma 2.10 — each verifiable at its locator.

Candidates that did **not** survive were dropped rather than recorded. One, the inconsistent citation into part I (`[18, 6.10]` twice, `[18, 6.19]` once, for the same isomorphism), is recorded as a **gap** because this session could not determine which number is right without part I; another, a suggested inversion in the last sentence of Remark A.2, was dropped as arguably loose phrasing of two claims the authors advance only tentatively ("It seems…").

## Gaps

Eight, the load-bearing ones being: **`Ext²(Y,W)` is left open** (Remark 4.8(i) and footnote 11) — "presumably" zero, proved only for `W` of finite length, with a sequel announced; so `qBC` is *not* known to be abelian here and §4 supplies no kernels, cokernels or exactness, which is why Proposition 4.26 and Corollary 4.31 substitute maximality and full faithfulness. **All four conjectures are open in general**, Remark 1.10(ii) expecting every small variety to have de Rham slopes `≥ 0`. **Proposition 6.1 is imported wholesale from part I**, as are the `R¹lim` statements of Remark 8.9(i), footnote 22 and Lemma 7.13(i): nothing above §5 is self-contained without it, which is why it is routed as a *missing* item of the new roadmap rather than as planned by any existing layer. And §8.1.1's two tube examples are explicitly not general — "It should be possible to vastly generalize these examples, but this would require other techniques than the ones used in the paper."

## Prerequisite papers the atlas does not cover

Fourteen. Part I of the series above all; then Colmez's two Banach-Space papers (the functor-on-sympathetic-algebras language of §4.2 in its entirety), Le Bras (the equivalence every §3 proof runs through), Fargues–Fontaine, Fontaine's *Presque C_p-représentations* (all of §2), Fontaine/Faltings/Colmez–Fontaine for weak admissibility and the fundamental complex, Grosse-Klönne (both explicit examples), **Shao** (Hyodo–Kato GAGA and the log-space sequence — these carry Theorem 8.1(b) and (c), the largest class in the main theorem), Bhatt–Hansen, Beilinson, Scholze, Kohlhaase/Dierolf–Roelcke/Colmez–Gilles–Nizioł for Appendix A, Anschütz–Le Bras, and Bierstone–Milman.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-COLMEZ-NIZIOL-25.result.json`: **ok** with `status: complete`.
- `python3 research/blueprint/intake.py check-files` on the two deliverables: **no problems**.
- Route targets verified against `data/atlas.json`: every stage named belongs to the roadmap it is claimed for, and all seven owners have `origin: campaign`, so no `source` route re-plans a Tau Ceti roadmap.
