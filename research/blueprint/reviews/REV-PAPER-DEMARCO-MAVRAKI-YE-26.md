# REV-PAPER-DEMARCO-MAVRAKI-YE-26: review of the DeMarco–Mavraki–Ye extraction

**Verdict: accept, after corrections made in place.** All five routes are accepted; the brief of route 5 is amended. The five recorded source issues are confirmed, and four new ones are added, including two gaps in the proofs.
- **Paper.** DeMarco–Mavraki–Ye, *Bounded geometry for PCF-special subvarieties*, Forum Math. Pi 14 (2026) e4.
- **Extraction.** cc-fb70e5, issue #1338.
- **Reviewer.** Claude Code, session cc-442dc5, which took no part in the extraction.

## Sources read

- **The paper.** The whole published article, 22 pages, open access, read by the reviewer from the text and the page images.
  - The review's copy has SHA-256 `c14888b9…2041`; the extraction's has `7845e297…4048`. Cambridge Core stamps each download with a line giving the time and IP address, so the hashes differ; the text is the same.
  - arXiv 2405.17343v3 (the accepted version) was compared at every place below and has the same text.
  - Crossref records no update or correction relation, and the article page lists none.
- **DeMarco–Mavraki [DM1]**, arXiv 2212.13215v2, §4.3: the rigid-repeller criterion (Proposition 4.8) behind (3.2).
- **Gao–Ge–Kühne Lemma 4.3**, as extracted in PAPER-GAO-GE-KUHNE-26 (its item 58).

## 1. Items

All 35 statements and locators match the paper, and nothing on the way to Theorems 1.1–1.8 is missing. Small corrections:
- **Item 14 (Theorem 1.1).** It now records that degrees are taken for a fixed very ample line bundle on M_d, and that B and N depend on that choice (p.1).
- **Item 24.** It adds T_i ∧ T_i = 0, which §4 uses.
- **Item 26.** The paper states Dujardin's density theorem for a single family (f, …, f) with m ≤ 2d − 2 marked critical points. The extraction had stated it without that restriction. The restriction matters for E7.
- **Items 12, 16, 17, 22 and 27.** Their locators and notes now point to the page and to the new issues.

## 2. Statuses

- **Library.** `Projectivization.logHeight` (Mathlib/NumberTheory/Height/Projectivization.lean:51, at 082e2d3) is the Weil height on projective space over a number field. It provides item 7, and, as the extraction notes, the Q̄-normalised version is RP.0 work.
- **Planned.** ArithmeticDynamics DY.1 plans Call–Silverman canonical heights (f*L ≅ L^d), which is item 6.
- **Missing.** The declaration index has nothing on rational-map dynamics, bifurcation currents, plurisubharmonic functions, Chow varieties or Yuan–Zhang adelic line bundles. Tau Ceti's canonical heights are Néron–Tate heights on elliptic curves only.

## 3. Routes

Every missing item is routed exactly once (5 + 1 + 3 + 2 + 22 = 33).

- **1. ArithmeticDynamics DY.0, DY.4 and DY.6: accept.** These stages own dynamical moduli, equidistribution with dynamical applications, and canonical heights in families, and none of them yet constructs M_d or the critical height.
- **2. AlgebraicModuliForArithmeticGeometry R09.1–R09.2: accept.** Nothing plans Chow varieties. The projective parameter spaces and Hilbert schemes of R09 are the closest owner.
- **3. ArakelovGeometryAndAbelianHeightsPartII: accept.** PAPER-YUAN-26's brief for this Part II already covers Yuan–Zhang adelic divisors, Deligne pairings, non-degeneracy and the height inequality. DMY only adds consumers.
- **4. HeightsRationalPointsAndObstructionsPartII: accept.** PAPER-GAO-GE-KUHNE-26 already routes Lemma 4.3 here, so nothing is duplicated.
- **5. ArithmeticDynamicsPartIIBifurcation: accept, amended.** No atlas layer treats complex dynamics in parameter space. The only hits for bifurcation, currents or subharmonic functions are Tau Ceti's Thurston geometries, the real Monge–Ampère theory in OptimalTransport, and Tau Ceti PDE's Lane C.
  - **Lane C.** Lane C (harmonic and subharmonic functions, Perron's method) is what the pluripotential theory builds on, so the brief now imports it.
  - **Corrections.** The brief carries E7–E9 into the statements to be proved.
  - **Acceptance test.** The test asked that Per₁(λ) be PCF-special only for λ = 0. That is DeMarco–Wang–Ye's theorem, an input to Example 1.4, so the test now takes it as a stated hypothesis.
- **Prerequisites.** Three were added:
  - Buff–Epstein 2009, which supplies the zoom (4.11) and the support of the bifurcation measure;
  - DeMarco–Wang–Ye 2015, for Example 1.4;
  - Douady–Hubbard 1985, for the polynomial-like renormalization in Proposition 3.2.

## 4. Mistakes in the paper

The five recorded issues are confirmed at their locators:
- **E1.** "≠ 0" is missing after T_bif^{∧(r+1)} ∧ [Y] (p.10).
- **E2.** In Lemma 4.1 the closed form should have 1/ρ^{i−1}. The reviewer recomputed M₃ and M₄ from the recursion. The conclusion M_i → 0 holds either way.
- **E3.** "h_Ch(f)" should be h_Ch(λ) (p.19).
- **E4.** Flexible Lattès maps with transcendental modulus are PCF but are not points of M_d(Q̄), so §5 misses them. The Bézout repair is correct and applies in the step for r > 1 too.
- **E5.** The height of the tensor product L̄ is κ Σ ĥ_crit(f_i) with κ > 0 (p.14). The hat is also missing.

The extraction missed four issues. I found and confirmed them:

- **E6** (misprint, Example 1.4, p.2). "PCF_d" is printed twice where PCF₂ is meant.

- **E7** (gap, proof of Proposition 3.1, pp.10–11).
  - **The problem.** The witness is built at y = (y₀, …, y₀), with the same point y₀ in every factor. By the proof's own choice of U, the fibres of ρ₁ have dimension r + ℓ − k, where k = dim ρ₁(X). So ρ_ℓ^{−1}(y) contains the (r + ℓ − k)-dimensional set {(λ′, y₀, …, y₀) : y₀ ∈ X_{λ′}}. Every landing condition depends only on (f₁, …, f_ℓ), so all of them hold along this set. When k < r + ℓ, c is therefore not even properly prerepelling at any preimage of y over X^ℓ_V. The final paragraph ("since the map from X^ℓ_V to Y_ℓ is generically finite…") does not give what Proposition 3.2 needs.
  - **When it happens.** The paper allows r + 1 ≤ k ≤ r + ℓ, and in §5, where V is a whole component of Ch(M_d, r, D), k < r + ℓ is the usual case.
  - **Example.** For the lines in M₂ ≅ ℂ² (ℓ = 2, r = 1, k = 2), the curve Γ in the proof of Proposition 3.2 is {(λ, y₀) : y₀ ∈ X_λ}. The map along it is constant, so c_{ℓ,r+1} is not active along Γ.
  - **What survives.** µ_ℓ ≠ 0 stands, since (3.2) is applied over Y_ℓ, where the intersection at y is isolated. The witness must instead be found where ρ_ℓ is a local isomorphism, for instance from a density theorem of Dujardin's type for the product family Φ. The paper states Dujardin's theorem only for a single family.

- **E8** (error, (4.4), p.14).
  - **The problem.** c₁(L̄) is a positive multiple of Σ_i π_i^*T_bif, so its (r + 1)ℓ-th power is a sum over all splittings a₁ + ⋯ + a_ℓ = (r + 1)ℓ, and µ_ℓ is only the term with every a_i = r + 1. Neither T_c ∧ T_c = 0 nor the dimension count removes the other terms.
  - **Example.** For ℓ = 2 and dim ρ₁(X) = r + 2, the term π₁^*T_bif^{∧(r+2)} ∧ π₂^*T_bif^{∧r} is non-zero by [GOV, Lemma 6.8].
  - **Repair.** Only c₁(L̄)^{∧(r+1)ℓ} ≥ α₁µ_ℓ holds. Running (4.5)–(4.8) with c₁(L̄)^{∧(r+1)ℓ} in place of µ_ℓ gives (4.8) on a set containing supp π_*µ_ℓ, so the proof survives.

- **E9** (gap, §5, p.20).
  - **The problem.** For r ≥ 2 the proof applies the induction hypotheses to the components Y(λ) of Z(λ) and says that, "by reducing ε if needed", the closure of Σ^r_{λ,ε} ∩ Y(λ) is uniformly bounded. But Σ^r_{λ,ε} is cut out by ĥ_crit < (ε/(ℓ+1)) max{1, h_Ch(λ)}, a threshold measured by the height of X_λ, while Theorem 1.5 for Y(λ) controls only thresholds ε′ max{1, h_Ch(Y(λ))}.
  - **Why reducing ε does not help.** No inequality relates the two heights. A fixed Y can lie in X_λ for a positive-dimensional set of λ with h_Ch(λ) unbounded.
  - **What is affected.** Theorem 1.5 in dimension ≥ 2 needs either a version whose threshold is measured against the ambient variety or a lower bound for h_Ch(Y(λ)). Theorems 1.1, 1.2 and 1.6, and Theorem 1.5 for curves, do not use this step.

Theorems 1.1, 1.2, 1.5 and 1.6 all rest on Theorem 1.8, and so on the repair of E7. E9 affects only Theorem 1.5 beyond curves. I have not found a counterexample to any stated theorem.

Four small slips are noted in the extraction's notes but not registered:
- "Theorem 1.5 and 1.2" on p.19 should read 1.1;
- the polydisc factor √r is missing in Lemma 4.1's choice of δ;
- (4.11) calls a weak limit "uniform";
- "Theorems 1.8" is a typo on p.4.

## Checks

- `python3 scripts/check_paper.py` on the extraction: ok.
- The intake `check-files` on the four deliverables passes.

Lean: none.
