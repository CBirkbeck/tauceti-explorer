# REV-PKG-HodgeTateAndCanonicalSubgroups

This is an independent review of the roadmap package `research/blueprint/packages/HodgeTateAndCanonicalSubgroups/`, which holds README.md, Suggested.lean and metadata.toml. The package was written by Codex, session `codex-u7tIH6` (PR #9808). It is checked against its accepted plan:

- `packets/HodgeTateAndCanonicalSubgroups.json`, the whole-roadmap packet with four new targets and the assembly overlays;
- `packets/HodgeTateAndCanonicalSubgroups--T0.json`, holding T0–T5 with 65 targets;
- `packets/HodgeTateAndCanonicalSubgroups--T6.json`, holding T6 with 68 targets.

Reviewer: Claude (Opus 5.5), session `claude-2BRfhd`, 14 October 2026. I wrote none of the package. Other sessions wrote the plan (Claude `claude-NEhd3x`), the assembly (Claude `claude-fAsYHI`) and the plan's reviews (Codex).

**Verdict: `needs_changes`.** The mathematics I checked is sound, apart from four errors in Checks, which I corrected. The Lean file elaborates, and the README follows the plan faithfully. Two defects remain that a review cannot repair in place.

1. **Unsupplied supplier contracts.** The README carries the plan's 25 open requests and 23 gaps as `## Exact supplier contracts`, and these are explicitly "additional mathematical requirements". Most of them are not stated by the lower-tier roadmaps they name.
   - Some go further than that. The FiniteFlatGroupsAndIntegralPadicHodgeTheory package (TauCetiRoadmap PR #879) assigns some items back to this roadmap. Its scope paragraph, README line 150, reads: "Faltings' integral Hodge–Tate complex, Fargues' degree function and canonical subgroups belong to HodgeTateAndCanonicalSubgroups". Yet the R07.1 contract here asks R07.1 for exactly the integral Faltings complex and for the Fitting degree over rank-one valuation rings.
   - Under the upstream "no gaps" rule, each such item must become a target here or in a cited roadmap. Writing roughly 25 groups of new targets, with sources and checks, is a package revision. The revision map below lists them.
2. **Cross-package duplication with lower-tier packages.**
   - PrismaticCohomology (tier 13) states the fs log adic Kummer foundations in its README §8.60, after they moved down from this roadmap's T6 log sites: log structures on étale sites, logification and pullback, charts with O⁺ image, fs, strictness, the Kummer étale site, local systems and R^iε_*(ℤ/n) ≅ ∧^i(M̄^gp/n)(−i). Layer 6 still plans these as 6.1, 6.3, 6.11, 6.14, 6.16 and 6.17.
   - CohomologyComparisons (tier 14), README §6.1, constructs the Kummer and pro-Kummer sites, OB⁺_dR,log, its connection and the log Faltings extension for modular curves. That is the special case of 6.20–6.24, 6.27, 7.8 and 7.10–7.13.
   - Re-scoping Layer 6 (deleting or narrowing targets, renumbering, re-pointing about 40 internal links) is also a revision.

Everything else the review found has been corrected in place (section 4).

## 1. Scope and method

- **README.** I read the whole README myself, all 4903 lines.
  - Layers 0–5 and the front matter I read in full and worked by hand. For Layers 6–8 I read every statement and every Check, and I spot-read the proofs.
- **Lean.** I read Suggested.lean myself, all 242 lines, and recompiled it after my edits.
- **Sources.** I fetched all 23 sources named in the References into scratch. Every SHA-256 equals the hash the README records.
  - The README holds 403 locator citations, 367 of them distinct. Three Haiku retrieval agents located every label on the per-page texts.
  - I read the source lines myself for every flagged locator and for more than 20 others: FAR11 Théorème 6 (pp. 38–39) and the introduction (p. 3); SCH15 Corollary III.2.6, Definition III.2.7 and Proposition III.2.8 (pp. 33–34), Theorem III.2.15 (pp. 39–40) and Corollary III.2.2 (p. 32); BHW Propositions 5.18–5.19 and their proof (pp. 24–25) and Lemma 7.12 (p. 30); CS17 §2.2–2.3 (pp. 15–21); SW13 Proposition 5.1.6 (p. 49); DLLZ-adic Example 2.3.17, Construction 3.3.2–Lemma 3.3.5, Proposition 5.1.5 and Example 6.3.8; DLLZ-RH Proposition 2.3.15 with the paragraph after its proof, and Theorem 3.2.4.
- **Sonnet cross-checks.** Five Sonnet agents did the mechanical checks, and I read their results:
  - packet-to-README fidelity, node by node, for T0–T5 and the whole-roadmap targets (69 nodes) and for T6 (68 nodes);
  - a duplication sweep over current TauCetiRoadmap main, current Tau Ceti a91d3aaf and the pinned Mathlib;
  - a supplier, tier and "moved down" audit over every cited roadmap's package and packets;
  - a proofread of my edits.
- **Verification of their findings.** I checked the strongest findings myself:
  - PrismaticCohomology README §8.60;
  - CohomologyComparisons README §6.1 and line 1261;
  - FiniteFlat README line 150 and §R07.6.6;
  - the absence of canonical subgroups from the HilbertModularVarietiesAndShimuraCurves package;
  - the absence of filtered fibre functors from TauCetiRoadmap ReductiveGroups;
  - the names of the current Tau Ceti declarations, read in source.

## 2. The six checks of the job

| Item | Result |
|---|---|
| 1. Upstream form | The README has the upstream shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, then Layers with `### k.n` targets, Examples, Dependencies, Downstream consumers and References. Every target has its statement, hypotheses, proof route, API, Checks, locator and *Needs*. All 62 definitions and constructions carry 4–7 Checks each. I removed the residue: an index-maintenance sentence, the "RS-05 owners entry", "the Layer 0–Layer 5 part", "T0" used as a layer name, 65 atlas node ids and 27 `roadmap/` fragments turned into prose, 32 internal slugs turned into section links, three "S0 imports" lines that broke the Checks lists, and 40 lines of doubled punctuation. Remaining defect: the supplier contracts (section 5.1). |
| 2. Fidelity to the plan | All 137 effective targets are present one-to-one with the plan (69 + 68 nodes). Every API name, test name, numeral, inequality direction, Tate twist and locator matches. The packager's four deliberate corrections are consistent across the README: ω_G = T ⊗ ω_μ with det T; ht G > 0 for the slope duality; n ≥ 1 for the BT_n slope; and the trivial-group control. I verified the det T convention independently: a character χ pulls dt/t back to an invariant differential. |
| 3. Own words | No passage of a source and no section-by-section summary. Every citation has theorem, section and page. |
| 4. No process | Corrected in place (item 1). The forbidden words optional/deferred/later now occur 0 times; there were 6 instances of "later". "request(ed)" now occurs 0 times; there were 5. |
| 5. Suggested.lean | `lean-check` exits 0 with five `sorry` warnings only (lines 43, 104, 132, 147 and 211). 265 lines; no sorry'd data (`scripts/check_sorry_data.py` passes); no theory developed. Its declarations match README 2.1, 3.1, 3.4, 4.4, 4.6, 5.8 and 6.1, and all 62 README definitions and constructions are named in the closing comment. |
| 6. metadata.toml | `topic = "math.NT"`. This fits: canonical subgroups, Shimura varieties and p-adic Hodge theory. |

## 3. Adversarial mathematics pass

I worked these checks by hand or recomputed them from the sources.

| Statement | Instances tried | Outcome |
|---|---|---|
| 0.1 ω of μ_{p^n}, α_p, ℤ/p^n | t^{p^n} − 1 ≡ p^n(t − 1) mod (t−1)²; α_p and ℤ/p | correct |
| 0.2 α_H direction | ℤ/p versus μ_p over ℤ_p[ζ_p] | correct |
| 0.4 ordinary kernel of α_G ⊗ C | E ordinary | **wrong twist**: the kernel is T_p(G°) ⊗ C, not ⊗ C(1). Fixed. |
| 0.6 supersingular degree 1/(p+1) | Newton polygon of [p] over W(l); point (p, ≥ 1) lies above the line | correct |
| 0.6 deg ≠ length | ω ≅ O_K/p^{1/2}, value group ℚ | correct |
| 0.8 generic isomorphisms | discriminant-index formula δ′^n = det(M)²δ^n | correct; the "μ_p → …" truncation is removed |
| 0.9 locally constant degree | D_H = V(p^{1/2}) on Spf ℤ_p[p^{1/2}] | **"multiple of V(p)" too strong**: the correct condition is a rational multiple on a normal model. Fixed. |
| 0.10 Tate-curve Checks | quotient by μ_p (finite flat kernel) versus by ⟨q^{1/p}⟩ | **the two bullets contradicted each other**. The kernel of the quotient by μ_p is finite flat. The non-finite example is the quotient by ⟨q^{1/p}⟩, with D_f = 0. Fixed. |
| 0.19 HN Checks for E[p] | w = Ha(E): subgroup degrees 1 − w, w/p or 1/(p+1); slope of E[p] is 1/2 | **wrong threshold**: the canonical subgroup is an HN step only for w < 1/2. For 1/2 ≤ w < p/(p+1), E[p] is semistable. Also, the ordinary BT_n check needs 0 < d < h. Fixed. |
| 0.20 different | μ_p: e*D⁻¹ = p⁻¹R; Σ v(ζ^i − 1) = 1 | correct |
| 2.1–2.3 tower tests | φ(Np^m) components; transition degree p⁴; 𝔾_m: 𝔽_p^×/±1 and ℤ_p^×/±1; T_{p·1} trivial iff p ≡ 1 mod N, using −1 ∉ K(N)^p | correct |
| 2.7 charts | C(4,2) = 6; (1 0; 1 1) sends D₀ to a disc containing 0 and ∞ | correct |
| 3.1–3.8 constants | Scholze III.2.6–III.2.8 (S_m w < 1/2; strong p^m w < 1/2); FAR11 Thm 6 (< 1/(2p^{n−1}), p = 3: < 1/3^n, deg G/C = S_n w, (6), (7)); 3.5 at p = 5, w = 1/10, 1/6; 3.8 at w = 1/(2p) | correct |
| 3.4 non-normal counterexample | R′ = {a ≡ b mod p^{1/(p−1)}}, s = (ζ_p, 1) | correct (s ∉ p^{1/p}R′) |
| 4.1 decomposition at Γ₀(p) | radius of the canonical subgroup used | **"ε < p/(p+1)" was outside the roadmap's own canonical range**; corrected to ε < 1/2 |
| 4.3–4.8 | AL_n radii; z = −HT(e₂)/HT(e₁); γ^∨e₁ ≡ (cz+d)e₁; cocycle test; c_p bound p/(c_p(p−1)) < 1, so x > m; x = y − w/(p−1) = n − p^n w/(p−1) | correct |
| 5.1–5.12 | Igusa degree p^{m−1}(p−1); I′₁ = p^{1−pw/(p−1)}; D = gb, 4[F:ℚ] at p = 2; ρ = u_nγu_n⁻¹ = (a, p^n b; p^{−n}c, d), j(ρ, u_n x) = cz + d | correct |
| 6.5, 6.7, 6.13, 6.14, 6.17, 6.19 | (ℕ⊕_ℕℕ)^sat = ℕ ⊕ ℤ/n; d = 0, δ = 1 into k; index n for ℕ²; rank-two point missed by a rank-one cover; R¹ε_*(ℤ/n) = ℤ/n(−1) | correct |
| 7.22, 7.31–7.35 twists | ℚ_p(1): M⁰ = t⁻¹M, F_{−2} = 0, F_{−1} = Ô(1), Gr_{−1}(−1) ≅ Gr^{−1}W_dR ⊗ Ô; duality F_i(W^∨) = F_{−i−1}(W)^⊥ on the Tate line; lim_{t→0} Ad µ(t) stabilises the "weight ≥" filtration; residues 2/3 ⊗ 2/3 ↦ 1/3 | correct |
| Lean | `autFactor_mul` and `coordAction_mul` checked algebraically; `weakCanonicalRange_of_strong` (S_n ≤ p^n for p ≥ 2); `isCofiltered` (T2 makes a meet of compact opens compact) | true as stated |

## 4. Corrections applied in place

The edits come from rerunnable scratch scripts applied to `origin/main`, each with asserted replacements.

**README**

- **Mathematics.** The fixes to 0.4, 0.9, 0.10, 0.19 (three Checks) and 4.1 listed in section 3.
- **R07.6 contract.** The FiniteFlat package's §R07.6.6 already states Illusie's obstruction theory for lifting homomorphisms, with Scholze's canonical-subgroup lifting as its check. The contract now cites it for 3.2. It records that the δ-additivity, duality and trace–codifferent statements are this roadmap's own 0.7, 0.9 and 0.20, not R07.6's, and it keeps one real requirement: amplitude [−1, 0] over an arbitrary base.
- **Current Tau Ceti.** The front matter now cites, as used and not re-planned:
  - the scheme-level Fitting ideal sheaf `AlgebraicGeometry.Scheme.Modules.fittingIdeal` with `fittingIdeal_pullback`. The README had said scheme-level gluing was still a StableReduction contract.
  - `AlgebraicGeometry.Scheme.relativeDifferentials`;
  - `TauCeti.RootsOfUnityGroup.groupScheme`, `TauCeti.AlphaP.CoordinateRing` and `TauCeti.PadicTateTwist`;
  - the monogenic different `TauCeti.natCast_differentExponent_eq_addVal_aeval_derivative_minpoly`.

  0.6 now imports Fitting ideals from Tau Ceti.
- **Mathlib and ModularCurves.**
  - 4.4 states that `coordAction` agrees with Mathlib's action of GL₂ on `OnePoint K` (`OnePoint.instGLAction`, `OnePoint.smul_some_eq_ite`).
  - The boundaries cite TauCetiRoadmap ModularCurves 0G for the relative Grassmannian scheme.
- **0.14.** The torus and Raynaud API items are marked as restating ShimuraCompactifications C4's theorem for the named section.
- **PrismaticCohomology.** PR.8 is removed as a "consumer": it is lower tier and plans its own foundations. 6.17 points to §8.60 for the exterior formula.
- **Locators.**
  - SW13 Prop 5.1.6: pp. 49–50.
  - SCH15 Cor III.2.2: p. 32, not pp. 30–31.
  - FAR11 §2.1.1: p. 6, not p. 4 (two places).
  - SCH15 Thm 3.2.15(iii): pp. 39–40.
  - BHW Lemma 7.12: pp. 30–31.
  - DLLZ-adic Ex. 2.3.17: pp. 16–17; Ex. 6.3.8: pp. 89–90; the 3.3.2–3.3.5 labels.
  - DLLZ-RH Thm 3.2.4(1): pp. 25–26; the paragraph after Prop 2.3.15.
  - CDM12 duplicated label.
  - The CS17 Blasius section is §2.3, not §2.2.
- **Form.** The process residue listed in section 2, item 1. The "How to read the build" pointers now give 3.1, 3.4, 4.4 and 4.6.

**Suggested.lean**

- `CompactOpenSubgroup` is now the compact members of Mathlib's `OpenSubgroup G`, following Mathlib and the SmoothRepresentationsOfLocalGroups idiom.
- New proved theorem `coordAction_eq_smul`: `coordAction` is Mathlib's `OnePoint` action on the domain where cz + d ≠ 0. This is the library-agreement test.
- The node slug "(Layer 5/aip-automorphy-factor)" in a docstring is removed.
- The closing comment now names all 62 README definitions and constructions by layer; it had 22.

## 5. What remains (for the package revision)

### 5.1 Supplier contracts the named suppliers do not state

Each item must become a target here, or the maintainer must place it in a lower-tier roadmap. Alternatively the dependent target is narrowed, deciding the generality up front. Sources and locators are already in the README text of each contract.

| Contract (README) | Not supplied | Supplier's actual content | Suggested resolution |
|---|---|---|---|
| R07.1 | (a) ω_{G[p^n]} = ω_G/p^n, dim G + dim G^D = ht and completeness over O_C; (b) integral Faltings complex with annihilator 1/(p−1) (CDM12 Thm 4.13); (c) embedding finite flat O_C-groups in p-divisible groups; (d) cyclic presentations and Fitting degree over rank-one valuation rings; (e) BT quotient p^{−a}D/D (FAR11 Thm 5–6) | R07.1.17 is over complete DVRs. FiniteFlat README line 150 assigns the Faltings complex, Fargues degree and canonical subgroups to this roadmap. | New Layer 0 targets (a), (b), (d) and (e). For (c), a target, or 0.5's abstract-group extension restricted to subgroups of p-divisible groups. |
| R07.2 | (1) normalized multiplicative determinant pullback (PIL20 Lemma 6.3.4.1); (2) Frobenius-twist compatibility of Ha/LF for BT₁ quotients | R07.2.21 has Ha and det ω^{(p)} only | 0.12 proves (1) itself; (2) a lemma in 3.5 |
| R07.6 | amplitude [−1, 0] of ℓ̌_G over an arbitrary base | coLie for BT_n; syntomic over DVRs | target, or restrict to valuation bases |
| A2 | V_A = (F_{A^∨})^∨ over 𝔽_p-bases | finite-flat version R07.1.1 only | Layer 0 target from R07.1.1 on A[p^n] |
| A4 | (1) Hodge triangle of an isogeny via co-Lie complexes; (2) H¹(A,𝒪) = Lie(A^∨) with duality | A4.3 has ω ⊂ H¹_dR ↠ Lie(A^∨) | targets (needed by 0.7(2)) |
| P8 | (1) relative comparison over complete discretely valued K (P8 has finite K/ℚ_p); (2) relative Kummer/character compatibility (CDM12 Prop 4.15); (3) algebraic degree-one HT spectral sequence over arbitrary C with duality | CP.3 degeneration and point cases only | Layer 1 targets, or restrict 1.1–2.6 to finite K/ℚ_p |
| C4, C5 | one-motive at p-power level; multiplicative pieces; GSp₄/F model identification; f_*𝒪/p^k = f_*(𝒪/p^k); PS/A.10 projection formula; norm descent | partial (good-prime base level; ampleness) | targets, or restrict 0.17 and 5.6 to the Siegel data C5 covers |
| H2, H4 | Hilbert canonical module and unsplit O_F/p^n generator; all-prime formal radius; BHW position radius with inclusive endpoints; first-vector generator; Igusa map | the HilbertModular package has no canonical subgroups at all | Layer 3 targets (HALO A.2, AIPH §3, BHW §5.2) |
| P9 | completed pullback of the Layer 2 filtered frames and Levi torsors to all perfectoid untilts, with D6 flag compatibility | P9.7–P9.13 partial | Layer 2 target |
| R11.3 | O_C Raynaud extension and uniformization | complete DVR only | target, or restrict 0.18 and 2.5's character interpretation |
| B1, R09.1 | Tate-basis torsor contraction (BP Remark 4.4.23); determinant local systems; integral frames; homogeneous torsor G → G/P_HT; Levi quotient; reflex-field descent | absent (R09.1 has the Grassmannian and flag bundle) | 2.9–2.10 own them |
| ReductiveGroups | strict filtered Tannakian theory (Ziegler Thms 3.14–3.15, 3.52) | TauCetiRoadmap ReductiveGroups has only plain reconstruction | 2.11 owns Ziegler's theorems |
| AdicSpacesPartII R0, R2, R3 | normal extension across a normal-crossings boundary (Hansen, Lütkebohmert, Bartenwerfer); matrix generic-fibre transfer and normalization of formal models; étale descent of coherent modules (DLLZ-adic A.10) | absent | targets |
| CR.5:log-algebra | four ringed-site items | ComplexComparisonPartII C5 has log structures, pullback and fine charts on ringed sites | cite C5 where it suffices |
| H0, E1, E2 | acyclicity for finite modules; Scholze 2013 Cor 3.17(i) beyond noetherian; pro-Kummer Cartan–Leray; cd bounds; projection formula; basis-acyclic R lim | absent (E2 needs replete topoi) | targets in Layers 6–7 |
| ALS.1, V8.general, P8:local-rational | Borel density, Margulis, CSP; Piatetski-Shapiro embeddings; coefficient horizontal frames | absent | targets, or restrict 7.29 to abelian-type data |
| Additional interfaces (README "Additional comparison and analytic interfaces") | rigid resolution; Banach decompletion; Liu–Zhu RH and rigidity, and the de Rham property of canonical local systems; CM special points; GAGA-type full faithfulness; Gauss–Manin residues; relative finiteness | no owner | targets, or a named owner |

### 5.2 Duplication with lower-tier packages

| Lower-tier package | Its targets | This README | Resolution |
|---|---|---|---|
| PrismaticCohomology (tier 13), README §8.60, with §8.59 and §8.61 | log structures on étale sites, logification, pullback, O⁺-charts, fs, strict maps; the Kummer étale site; Loc_Λ; R^iε_*(ℤ/n) and log inertia | 6.1, 6.3, 6.11, 6.14, 6.16, 6.17 | Import §8.60. Keep here only what it lacks: 6.2 monoid algebras, 6.4 NC log structures, 6.5 fs products, 6.12 root covers, 6.13 ramification index and the analytic refinements. Renumber Layer 6. |
| CohomologyComparisons (tier 14), README §6.1 | modular-curve Kummer and pro-Kummer sites, OB⁺_dR,log, connection, log Faltings extension | general versions 6.20–6.24, 6.27, 7.8, 7.10–7.13 | Maintainer decision: move the general construction down into CohomologyComparisons, or record its §6.1 as the special case of the general targets here. |

### 5.3 For the maintainer (other packages)

- **AutomorphicBundles (tier 15).** Its gaps `HodgeTateVBInput` and `LogHodgeTateInput` (B4.21, B5.20–B5.22) expect this tier-16 roadmap to export them. That is an upward dependency, which AutomorphicBundles must resolve.
- **PerfectoidShimuraVarieties (tier 17).** Its package still plans the p-level tower, the right action and the infinite-level diamond in its 0.2–0.4, although those moved down to 2.1–2.3 here.
- **PadicFamilies (same tier 16).** It cites T5 (Igusa torsor). That is a same-tier edge.
- **AdicSpacesPartII.** Whether TauCetiRoadmap PRs #813 and #815 renumber the R0, R2 and R3 cited here could not be checked from the repository.

## 6. Files

Deliverables: `packages/HodgeTateAndCanonicalSubgroups/{README.md, Suggested.lean, review.json}` and this report; metadata.toml is unchanged. Checks run:

- `lean-check` exits 0 with `sorry` warnings only.
- `python3 scripts/check_sorry_data.py`: no offenders.
- `python3 research/blueprint/intake.py check-files`: 0 problems.
