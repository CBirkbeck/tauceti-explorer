# PAPER-DING-25 — Ding, *p-adic Hodge parameters in the crystabelline representations of GL_n*

Yiwen Ding, **Publications Mathématiques de l'IHÉS 142 (2025), 1–74**, [doi:10.1007/s10240-025-00156-2](https://doi.org/10.1007/s10240-025-00156-2), arXiv [2407.21237](https://arxiv.org/abs/2407.21237).

Read in full in the **published** version: the open-access PDF from Centre Mersenne, 74 pages, SHA-256 `741a49c0677a77b22c9759a016e215882b70dc760eb9e41fd2fe45cc633d05ba`, retrieved 2026-09-23. The printed page equals the PDF page, so every locator below is a printed page. arXiv v2 (79 pp., 12 June 2025, marked "final version") was downloaded as well and its LaTeX source used as a reading aid, but it is **not** the same text: at least two slips of v2 are corrected in print, so every quotation and every finding was checked in the published PDF.

> **A warning for the next IHÉS extraction.** Neither identifier can be guessed. The DOI formed from the volume's pattern and the obvious arXiv number both belong to other papers; this one was found by a Crossref *title* query and the arXiv API, and the first page of each candidate was checked before it was believed.

**Status: `complete`.** 156 items (138 missing, 18 planned), 11 routes, 22 prerequisites, 24 source issues, 6 gaps.

## What the paper proves

For a crystabelline `ρ: Gal_K → GL_n(E)` with regular Hodge–Tate weights, classical local Langlands plus the weights produce the locally algebraic representation `π_alg(φ,h) = π_sm(φ) ⊗ L(λ)` of `GL_n(K)`. Passing from `ρ` to that data **loses the Hodge filtration**, and for `n ≥ 3` what is lost is a positive-dimensional family of parameters: with `(φ,h)` fixed, the non-critical `ρ` are an open subset of `T\GL_n/B`, an infinite set. For `n = 2` there is nothing to lose, which is why the question was invisible in the GL₂ theory. Example 2.9 makes the `n = 3` case concrete: the filtered module is determined by a single coordinate `a_{D_σ} ∈ E∖{0,1}`.

The paper finds those parameters on the automorphic side, in three moves.

1. **Galois side (§2).** Reinterpret the Hodge parameter: for `D ∈ ΦΓ_nc(φ,h)` let `D_1` be the rank `n-1` saturated submodule and `C_1` the rank `n-1` quotient for the refinement `φ`, and let `ι_D: D_1 ↪ D ↠ C_1`. Then `dim Hom(D_1,C_1) ≤ 2` (Proposition 2.2), and `ι_D` up to scalar determines `D` when `K = Q_p` (Proposition 2.4). For general `K` the honest invariant is the family `{D_σ}_{σ∈Σ_K}` of partial modifications, and `ι_{D_σ}` always determines `D_σ` (Proposition 2.8). The parameter is then made visible *infinitesimally*: a deformation of `D` admits two different parabolic filtrations exactly when its graded piece lies in the subspace `Ext^1_{ι_D}(D_1,D_1)` cut out by `ι_D` (Theorem 2.32, "higher intertwining"), so the kernel `L(D,D_1,C_1)` of the amalgamation of the two paraboline deformation spaces determines `ι_D` (Corollary 2.34).
2. **`GL_n(K)` side (§3).** Amalgamate the `n!` locally analytic principal series `PS_1(w(φ),h)` along their common socle into `π_1(φ,h)`, which depends only on `(φ,h)`, and compute `dim Ext^1_{GL_n(K)}(π_alg(φ,h),π_1(φ,h)) = n + (2^n-1)d_K` (Proposition 3.8). **Theorem 3.21**, the heart of the paper: the amalgamation of the trianguline deformation spaces of `D` factors through that extension group, giving a surjection `t_D` onto `\bar Ext^1(D,D)` with `dim Ker(t_D) = (2^n - n(n+1)/2 - 1)d_K`. The kernel is the parameter. The extension `π_min(D)` of `π_alg(φ,h) ⊗ Ker(t_D)` by `π_1(φ,h)` satisfies `π_min(D) ≅ π_min(D')` iff `D_σ ≅ D'_σ` for every `σ` (**Theorem 3.34**), so for `K = Q_p` it determines `ρ`. §3.2.2 restates this with deformation rings: an Artinian algebra `A_D` acts on a `D`-independent representation `π_1(φ,h)^univ`, and `π_min(D) ≅ π_1(φ,h)^univ[m_{A_D}]`.
3. **Global (§4).** This is not an artefact. In the patched setting of Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin, `π_1(φ,h)^univ ≅ π̃ ⊂ Π_∞^{R_∞-an}[a_x]` `A_D`-equivariantly (**Theorem 4.5**), hence `π_min(D) ↪ Π_∞[m_x]` and it is the **maximal** subrepresentation of its shape (Corollary 4.8); so `Π_∞[m_x]` determines `{D_σ}` and, for `K = Q_p`, determines `ρ`. §4.2 proves the same without patching, in the completed cohomology of a definite unitary group, under a vanishing hypothesis on the adjoint Selmer group (**Theorem 4.18**).

## Routing — three new roadmaps, two of them shared, and one Part II

Checked against `data/atlas.json`, `research/blueprint/roadmaps/` and every other paper extraction. The atlas has **nothing** on the locally analytic representation theory this paper runs on, and nothing on the trianguline side; `PadicLocalLanglandsForGL2Qp` is the `n = 2`, `K = Q_p` case built through Colmez's functor and does not go in this direction.

| # | route | roadmap | area | items |
|---|-------|---------|------|-------|
| 1 | new | **`LocallyAnalyticRepresentationsOfLocalGroups`** | `representations` | 33 |
| 2 | new | **`TriangulineVarietyAndItsLocalModel`** *(shared)* | `padic` | 59 |
| 3 | new | **`PadicHodgeParametersInLocallyAnalyticRepresentations`** | `langlands` | 24 |
| 4 | part-ii | **`LocalGlobalCompatibilityPartIIEigenvarietyCompanions`** *(shared)*, parent `CompletedCohomologyAndLocalGlobalCompatibility` | `automorphic` | 22 |
| 5–11 | source | `PhiGammaModulesAndIwasawaCohomology` PG.3/PG.7 · `PadicHodgeTheory` P7 · `SmoothRepresentationsOfLocalGroups` SR.1/SR.2/SR.3 · `LocalGaloisDeformationRings` R08.1/R08.3 · `CompletedCohomologyAndLocalGlobalCompatibility` R31.2/R31.5 · `AutomorphicFormsOnReductiveGroups` AF.5 · `OverconvergentAutomorphicForms` O0 | — | 17 planned |

**Two roadmaps are deliberately shared with `PAPER-BREUIL-HELLMANN-SCHRAEN-19`** (merged as PR #2022). Route 2 reuses that extraction's `TriangulineVarietyAndItsLocalModel`: §§2.1–2.4 here are the infinitesimal theory of exactly the objects that roadmap is proposed to build — trianguline and paraboline deformations of a crystabelline (φ,Γ)-module, their partially de Rham variants, the modification `D ↦ D_σ` — so they are a second source for one design job, not a second roadmap. Route 4 reuses the same extraction's Part II of `CompletedCohomologyAndLocalGlobalCompatibility` for §4. That is what PROTOCOL §15 asks for, and it is the established practice here: `ArcTopologyAndDescent` is proposed by four extractions, `ShimuraVarietiesHondaTatePartII` by eight.

**Route 1 exists because the locally analytic theory is genuinely unplanned.** `SmoothRepresentationsOfLocalGroups` covers the smooth category (and is the source route for the smooth inputs: generic principal series, admissibility, the Bernstein centre, Hecke algebras). `LocallyAnalyticDistributions` L0–L4 builds Q_p-analytic distributions on `O_F` and finite products of local integer rings with their character spaces and operator theory — not the distribution algebra of a p-adic reductive group, not coadmissible modules, not `Ext` in that category. `PadicLocalLanglandsForGL2Qp` R30.2 builds the locally analytic category for GL₂(Q_p) alone. So the Orlik–Strauch functors, the constituents and socle filtration of a locally analytic principal series of `GL_n(K)`, Emerton's Jacquet functor with the balanced-map adjunction, and Schraen's spectral sequence are planned once, for a general group — they are used by this paper, by Breuil–Hellmann–Schraen and by most of the p-adic Langlands literature.

**Route 3 is the paper's own theory** and is placed in the `langlands` galaxy ("p-adic local Langlands"): the comparison `t_D` itself, `π_min(D)`, its central and infinitesimal characters, its compatibility with parabolic induction and with the decomposition over `Σ_K`, Theorem 3.34, and the deformation-ring reformulation. It imports the GL_n(K)-side from route 1 and the Galois side from route 2 and plans neither again.

One item is `planned` and **not** routed: category O and Verma modules for `gl_{n,Σ_K}` are planned by a Tau Ceti roadmap (Lie highest weight, Layer 3), and a source route may not re-plan a Tau Ceti roadmap.

## Source issues — 24, every one verified in the published text

Crossref has no correction, no erratum and no update relation for the DOI (checked 2026-09-23; the paper has no citing works yet), arXiv has no v3, and the Mersenne article page lists no corrigendum, so these are new findings. Comparing arXiv v2 with the print shows the copy-editing did fix things — v2's `κ_F: Ext^1_{σ,F_P}(D_σ,D_σ)` before Theorem 2.37 is given its own filtration in print, and v2's `R(φ_n z^{h_n}) ⊂ C_1` in the proof of Theorem 3.34 is corrected to `R(φ_n z^{h_1}) ⊂ D` — which is why each finding below was checked in the published PDF and two candidates were dropped.

Four touch statements:

- **E1 (Proposition 3.8, p. 38, and three more places).** The displayed exact sequence sums over `I ⊂ {1,…,n-1}`, but `C(I,s_{i,σ})` is defined for `I ⊂ {1,…,n}` and `π_1(φ,h)` is built from **all** of them — "(2^n-2)d_K constituents in total". With the printed index set the sum has `2^{n-1}-1` terms per embedding and the dimension asserted in the same proposition, `n + (2^n-1)d_K`, does not follow; that dimension is the one used everywhere afterwards, so it is the index set that is wrong. The same misprint recurs in the diagram (3.15), in Proposition 3.18 (1) and in (4.11).
- **E2 (proof of Theorem 3.21, p. 49, (3.43)).** `Hom(T(K),E) ≅ ⊕_{j=1}^{n-1} Hom(Z_j(K),E) ⊕ Hom(Z(K),E)` with `Z_j` the centre of the Levi of the maximal parabolic `P_j`. False for `n ≥ 3`: `Z_j` is a two-dimensional torus, so the right-hand side has dimension `(2(n-1)+1)(1+d_K)` against `n(1+d_K)` — 10 against 6 for `n = 3`, `K = Q_p` — and `Hom(Z(K),E)` sits inside every summand. Only the *spanning*, which the proof states four lines later, is needed, and it is true.
- **E3 (p. 51).** `χ_D := z^{|λ|}|·|_K^{n(n-1)/2}∏φ_i` with `|λ| = Σ_{i,σ} λ_{i,σ}`. But `z^k` is defined only for `k ∈ Z^{Σ_K}`; `|λ|` must be the tuple `(Σ_i λ_{i,σ})_σ`. With the tuple reading the identity `∧^n D ≅ R_{K,E}(χ_D ε^{-n(n-1)/2})` printed in the same sentence holds; with the printed reading it fails whenever `K ≠ Q_p`.
- **E4 (Lemma 3.2, p. 34).** `Hom_{T(Q_p)}(…)` where the acting group is `T(K)`, twice (statement and proof). Every parallel statement in the paper prints `T(K)`.

Then five misprints that garble a proof step — the interchanged parabolic subscripts `P_1`/`P_2` for `P_{n-1}`/`P_1` on p. 43 (E5); a sign `−n` for `+n` in the dimension check of Corollary 2.14 (E6); the last graded piece of a trianguline deformation printed with `z^{h_1}` instead of `z^{h_n}` in Lemma 2.11 (E7); the composition defining the `A_D`-action in Theorem 3.36 landing in `π_1(φ,h)^univ_w` instead of `π_1(φ,h)^univ`, so that the action the theorem asserts is not defined (E8); and, in the proof of the main local theorem, "replacing `D_σ` by `D'_σ`, we obtain `L ≅ L(D_σ,…)`", repeating the previous conclusion so that the next sentence follows from nothing (E9) — plus the universal extension with sub and quotient interchanged in Corollary 4.8 (E10), the polarisation `ρ^c_X ≅ ρ_X ⊗ ε^{1-n}` printed without the dual, twice, in Proposition 4.17 (E11), a broken displayed computation in Corollary 2.33 (E13), the weights of `D ⊗ D^∨` indexed `i,j = 1,…,r` (E16), and a lost minus sign together with an undefined `L^-_σ` on p. 44 (E17).

The rest (E12, E14, E15, E18–E24) are notational: `M_i` defined as an integer and then used as a module; `E[ϵ/ϵ²]`; `L(D_σ,D_{1,σ},D_{2,σ})_σ` with an argument that is never defined; `R_{E[ϵ]/ϵ²}` without its field in two theorem statements; an index `φ_0 z^{h_0}`; the same lemma cited as `[31]` once and `[32]` three times, and the same theorem of one paper as "Thm. 4.35" twice and "Thm. 4.3.5" once; `m_D` for `m_{A_D}`; `W_{ξ,τ}` as a lattice in one factor of a tensor product over places; `π_alg(φ,λ)` for `π_alg(φ,h)` in three places; and `C(w(φ),s_{i,σ})` for `C(w,s_{i,σ})`. Candidates I could not confirm in the published text were dropped.

## Recorded as gaps for the design jobs

Hypotheses 4.10 and 4.15 are **hypotheses** and must not be planned as targets (Hypothesis 4.15 is known by Allen, by Breuil–Hellmann–Schraen and by Newton–Thorne); so are the standing assumption `Π_∞[m_x]^lalg ≠ 0` and the Taylor–Wiles hypotheses inside the patched module, which the paper does not restate. Remark 1.2 (4) and Remark 4.7 record **expectations** — that `π_min(D)` and even `π_fs(D)` are far from the full locally analytic representation attached to `D` — not theorems. Three steps are **left to the reader**, one of them (Proposition 3.6 (1)) carrying the dimension count on which Theorem 3.21 rests. Six inputs are quoted from sources written for `K = Q_p`, for another group or for the crystalline case with the assertion that the argument generalises, including the construction of the patched eigenvariety itself ("an easy variation") and all of Proposition 4.14; each is a real obligation. Two load-bearing steps depend on **unpublished** work: Lemma 3.5 (1) on Breuil–Qian (arXiv:2407.06651, 2024) and Proposition 3.1 (2)(3) on Orlik (arXiv:1802.07514, 2018), while Emerton's "Jacquet modules II", used twice in §4, is cited as "to appear". Finally, three notational overloadings would break a formalisation: `h^1, h^2` with two meanings inside §3.1.3, the symbol `𝔗_σ` for four different operations, and `Ext^1_g, Ext^1_{g'}, Ext^1_w, Ext^1_{F_P}` used with the same names on both sides of the correspondence — the entire content of Theorem 3.21 being that the two families match.

## Checks

`scripts/check_paper.py`: ok with `"status": "complete"`, so the exactly-once routing of all 138 missing items is enforced. All route areas are galaxy ids of `data/galaxies.json`; the three proposed roadmap ids are free in the atlas and in `research/blueprint/roadmaps/`, and the two shared ids are proposed only by `PAPER-BREUIL-HELLMANN-SCHRAEN-19`; every `planned` stage id was checked against `data/atlas.json`, and the `part-ii` parent exists.

## Review (REV-PAPER-DING-25, 23 September 2026)

An independent review by Claude Code, session cc-d67081, for issue
[#1441](https://github.com/CBirkbeck/tauceti-explorer/issues/1441). **Verdict: accept.**
Nothing needed correcting in place.

- **All 24 recorded mistakes confirmed**, eleven of them verified in full. E1 by the paper's
  own count — p. 35 states "(2ⁿ − 2)d_K constituents in total" and the proposition asserts
  `n + (2ⁿ−1)d_K`, both of which require `I ⊂ {1,…,n}`, not the printed `{1,…,n−1}`. E2 by
  dimension — the printed direct sum has dimension `(2n−1)(1+d_K)` against `n(1+d_K)`, 10
  against 6 for `n = 3` over `Q_p`. E13 by arithmetic —
  `2(1+(n²−n+1)d_K) − (1+(n²−2n+2)d_K) = 1 + n²d_K` exactly. E18 and E20 by the paper
  contradicting itself three and five lines apart. E3 on a page image.
- For the other thirteen the quotation was verified but the correction rests on the
  extraction's reading; each verdict says so explicitly.
- **Items and routes:** no library items; 18 planned items resolving; 138 missing items
  routed exactly once; no run-together numbering. Three of the four proposed roadmaps are
  co-proposed identically by other papers, so they are merges.
- **Referred to the maintainer, not edited:** the Part II title drops "over Q" from its
  parent's. Three papers now carry it verbatim, so it is one decision for the merger.

Full report: `research/blueprint/reviews/REV-PAPER-DING-25.md`.
