# PAPER-DEMARCO-MAVRAKI-YE-26: Bounded geometry for PCF-special subvarieties

Laura DeMarco, Niki Myrto Mavraki and Hexi Ye, *Bounded geometry for PCF-special subvarieties*, [Forum of Mathematics, Pi 14 (2026), e4](https://doi.org/10.1017/fmp.2026.10024); arXiv [2405.17343](https://arxiv.org/abs/2405.17343).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1338). Status: **complete**. The whole published article was read and every missing item is routed once. The machine-readable extraction is [PAPER-DEMARCO-MAVRAKI-YE-26.result.json](PAPER-DEMARCO-MAVRAKI-YE-26.result.json): 35 items (1 library, 1 planned, 33 missing), 5 routes, 13 prerequisite entries and 5 recorded source issues.

**Source.** The published open-access article (CC BY 4.0), 22 pages, SHA-256 `7845e297f7c154ab6233cb9ea42702e1884764af6b0b6e2b286b62695abe4048`, read in full on 2026-09-22. Locators refer to the published pages.

## What the paper proves

Let M_d be the moduli space of degree-d rational maps of ℙ¹, and PCF_d ⊂ M_d the postcritically finite maps. A subvariety is *PCF-special* if its PCF points are Zariski dense.

- **Theorem 1.1 (uniform Dynamical André–Oort).** For every complex X ⊂ M_d of degree ≤ D, the Zariski closure of X ∩ PCF_d has at most N(D,d) components, each of degree ≤ B(D,d).
- **Theorem 1.2.** Only finitely many positive-dimensional PCF-special subvarieties have degree ≤ D. So, for example, the components of Per_n(0) grow in degree (Example 1.3).
- **Theorems 1.5 and 1.6.** These are small-critical-height versions over Q̄, a gap principle relative to max{1, h_Ch(X)} in the spirit of Gao–Ge–Kühne.
- **Theorem 1.8.** In a maximally varying family X → V of r-dimensional subvarieties over an ℓ-dimensional base, points of the (ℓ+1)-fold fibre power with Σ ĥ_crit < ε max{1, h_Ch(λ)} are not Zariski dense.

Remarkably, no classification of PCF-special subvarieties is used (Remark 1.7).

The proof of Theorem 1.8 runs as follows.

1. **Measures (§3).** Maximal variation makes ρ_ℓ : X^ℓ_V → M_d^ℓ generically finite (Proposition 2.1). Powers of bifurcation currents then give a non-zero measure µ_ℓ on X^ℓ_V (Proposition 3.1), using Gauthier–Okuyama–Vigny's T_bif^{∧r} ≠ 0 and Dujardin's support theorem. Two r-tuples of critical points give two non-zero measures on X^{ℓ+1}_V (Proposition 3.2). At a parameter x₁ one tuple is transversely prerepelling while the omitted critical point is in a parabolic basin; this uses Mañé–Sad–Sullivan and renormalization.
2. **Heights (§4).** Deligne pairings of Yuan–Zhang invariant adelic line bundles give two non-degenerate nef bundles M₁, M₂ with the corresponding curvatures. The Yuan–Zhang height inequality gives (4.6). If small points were dense, the fundamental inequality and equidistribution would make the two measures proportional; slicing makes them proportional fibrewise (4.8).
3. **Contradiction (§4).** Zooming at s_ℓ at the repelling rates (Buff–Epstein, Gauthier) gives a non-zero limit for one measure. For the other the limit is 0, because the orbit of the parabolically attracted critical point collapses under any exponential zoom (Lemma 4.1).
4. **Counting (§5).** Gao–Ge–Kühne Lemma 4.3 and induction on dimension give Theorems 1.1, 1.2, 1.5 and 1.6.

## What the atlas already has

- **Library.** Mathlib has the Weil height `Projectivization.logHeight`.
- **Planned.** ArithmeticDynamics DY.1 plans Call–Silverman canonical heights.
- **Not in the atlas.** Complex dynamics in parameter space, currents, the critical height, Chow varieties and Yuan–Zhang quasi-projective adelic geometry.

## Routes

1. **Source of ArithmeticDynamics DY.0, DY.4 and DY.6.** It covers:
   - the moduli space M_d (Silverman's GIT quotient over ℤ) and its critically marked cover;
   - the critical height with Ingram's comparison to a moduli height (canonical heights in families, DY.6);
   - equidistribution of PCF parameters to the bifurcation measure (Gauthier; Yuan–Zhang §6.3), a dynamical application of DY.4 equidistribution.
2. **Source of AlgebraicModuliForArithmeticGeometry R09.1 and R09.2.** It covers Chow varieties of bounded-degree cycles as parameter spaces.
3. **Part II `ArakelovGeometryAndAbelianHeightsPartII`**, the YUAN-26 id. It takes Yuan–Zhang adelic line bundles on quasi-projective varieties: invariant extensions, Deligne pairings, non-degeneracy, the height inequality, the fundamental inequality and equidistribution.
4. **Part II `HeightsRationalPointsAndObstructionsPartII`**, the uniformity id. It takes only consumers: heights of cycles on Chow varieties, and Gao–Ge–Kühne Lemma 4.3, which is already routed there by GAO-GE-KUHNE-26. Nothing is duplicated.
5. **New Part II `ArithmeticDynamicsPartIIBifurcation`**, titled *Arithmetic dynamics, Part II: bifurcation currents and PCF-special subvarieties*.
   - It covers currents with continuous potentials, bifurcation currents and measure, activity and McMullen/GOV non-vanishing, prerepelling parameters, J-stability and parabolic parameters, Thurston rigidity, and the flexible Lattès locus.
   - It also takes the paper's own Propositions 2.1, 3.1 and 3.2, Lemma 4.1, the zoom, and Theorems 1.8, 1.1, 1.2, 1.5 and 1.6.
   - No atlas layer treats complex dynamics in parameter space. ArithmeticDynamics is the parent it extends, following the pattern of MARTIN-25's `ArithmeticDynamicsPartIIMarkoff`.
   - The uniform results are exported to DY.6 as proven unlikely-intersection endpoints.

## Source issues (`sourceIssues` E1–E5)

- **E4** (gap, affects the proof of Theorems 1.1–1.2 over ℂ).
  - **The problem.** §5 bounds only algebraic points of small critical height, Σ_{λ,ε} ⊂ M_d(Q̄). For transcendental λ, X_λ ∩ PCF_d can also contain flexible Lattès maps, which are PCF but not defined over Q̄ when their j-invariant is transcendental.
  - **The repair.** By Thurston rigidity these extra points lie in the curve L_d, so Bézout bounds them uniformly: at most D·deg L_d points plus components of L_d. Only N and B change.
- **E1–E3, E5** (misprints):
  - **E1:** "≠ 0" is missing in the ℓ = 1 case of Proposition 3.1.
  - **E2:** in the closed form for M_i in Lemma 4.1, 1/ρ^i should be 1/ρ^{i−1}. The conclusion M_i → 0 still holds.
  - **E3:** in the definition of Σ^r_{λ,ε}, "h_Ch(f)" should be "h_Ch(λ)".
  - **E5:** (4.3) omits the positive multiplicity factor coming from the tensor product over all critical tuples.

The argument that x₁ can be taken in supp µ_ℓ was reconstructed; Proposition 3.2's proof leaves it implicit. Prerepelling parameters on Γ are properly prerepelling for the full ℓ(r+1)-tuple, so the bifurcation locus of c_{ℓ,r+1} along Γ lies in supp µ_ℓ, and parabolic parameters there are limits. No correction notice is listed on the journal page, and Crossref has no correction relation.

## Prerequisites not yet covered

- Yuan–Zhang (arXiv:2105.13587).
- Gauthier–Okuyama–Vigny 2020.
- Dujardin 2013, and Dujardin–Favre 2008.
- DeMarco–Mavraki 2024.
- Gauthier 2023 and 2026.
- Ingram 2018.
- Bassanelli–Berteloot 2007.
- McMullen 1987, and Mañé–Sad–Sullivan.
- Douady–Hubbard 1993.
- Silverman 1998.
- Baker–DeMarco 2013.

Links and reasons are in the JSON.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json`: ok.
- Every missing item appears in exactly one route, and no source route takes a planned or library item. The three briefs are 140–278 words.
- The Mathlib citation was read at 082e2d3 (`NumberTheory/Height/Projectivization.lean:51`). Planned layer ids were checked against `data/atlas.json`. Prerequisite DOIs were checked against Crossref.
- No Lean was written or compiled; none is a deliverable of this job.
