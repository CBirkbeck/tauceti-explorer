# REV-PKG-PadicDifferentialEquationsAndRigidCohomology

Independent package review of `research/blueprint/packages/PadicDifferentialEquationsAndRigidCohomology/` (README.md, Suggested.lean, metadata.toml). The package was written by Claude session `claude-Y7BNdS` for #9854 (PR #9863). Reviewer: Claude (Opus), session `claude-TCVion`, issue #9855, 2026-10-14. I did not write any part of the package. Method: research/blueprint/PACKAGE_REVIEW.md, with PROTOCOL.md §§5, 13 and 20 and UPSTREAM_GUIDE.md.

## Verdict: accepted, after the corrections below

All 503 targets of the accepted plan and the 26 targets the packager added are present. Their statements, hypotheses and Checks are mathematically sound; I read every target's statement, hypotheses, API list and Checks. The corrections are local:
- one false Check;
- one Lean definition that duplicated Mathlib's `LinearMap.index`;
- one Lean pairing attached to the wrong target;
- three supplier section labels that do not exist, and about twenty supplier titles that did not match;
- seven wrong section numbers for AdicSpacesPartII;
- mixed pagination for *Slope filtrations revisited*;
- leftover fragments of computer-algebra output;
- references to a roadmap outside the tier order, and one misplaced sentence.

Nothing needs to go back to the packager. One matter is left to the maintainer: the README is 1.7 MB, discussed under "Remaining".

## What was checked

| Item | Result |
| --- | --- |
| Upstream form | The README follows the accepted package shape. In order: `**Summary.**`, layer table, Scope and ownership, Conventions, How to read the build, Exact supplier contracts (Mathlib, Tau Ceti, TauCetiRoadmap, other roadmaps by section), Layers RD.0–RD.7 with `### RD.k.n` targets, per-layer Examples and Dependencies, Downstream consumers, Corrections to the sources, References. Each target has its statement, hypotheses, API (for definitions and constructions), proof sketch, sources, *Needs* and **Checks**. This is the same form as the accepted CrystallineCohomology package. No packet ids, job ids, node ids or coverage words appear in it; a script scan for planning vocabulary found only mathematical uses of "gap". |
| Fidelity to the plan | Scripted: the plan's nine packets have 503 nodes. 484 titles match a README heading exactly. The other 19 are renamed but present: "Acceptance:" became "Example:" or "Counterexample:", and four titles lost bookkeeping words. 529 headings = 503 + 26. All 3,351 internal links resolve. I read the 26 added targets (ledger in the package handoff); each answers a supplier request or plan gap and states its hypotheses and sources. |
| Unit tests | Scripted: every one of the 130 definitions and constructions has at least three Checks bullets, and no target has none. While reading I checked that the Checks of definitions include a computed value, a degenerate case and a non-example. The Checks I recomputed are in the adversarial table. |
| Tiers and suppliers | Every roadmap cited as a supplier is below tier 12 in upstream/CaraianiNewton.md: SchemeAndStackFoundations 2, AdicSpacesPartII 3, PerfectoidSpaces 3, LocallyAnalyticDistributions 4, EnhancedDerivedSheaves 4, ClassicalArithmeticCompletion 5, InverseGalois 6, AbelianSchemes 6, ArithmeticGaloisRepresentations 7, NeronModels 8, CrystallineCohomology 9, FiniteFlat 10, ClassicalAdicEtale 10, AdicCoefficients 10, LefschetzPencils 10, DeligneWeights 11, ModularCurvesPartII 11. ReductiveGroupsPartII is tier 1 (open upstream PR #785). There is no FoundationsAndLibraryIntegration or `UPSTREAM:` id. ColemanIntegration (tier 15) and the p-adic Hodge theory roadmaps appear only under Downstream consumers. Pull request #196 is still open; it is cited as in the accepted InverseGalois package, and I checked its layer numbers at head 4bd7237 (TraceFormula Layers 12–13, ConstructibleEtale Layer 3). |
| Supplier sections | A Sonnet agent extracted all 243 distinct (roadmap, section, title) citations and matched them against the supplier READMEs. I read every mismatch it reported. The fixes are listed under "Corrections". |
| Library names | Scripted against the pinned declaration index (Mathlib 082e2d3, Tau Ceti f790474): every name in the Mathlib and Tau Ceti contract lists exists, and so do all 135 names written as Mathlib `X` or Tau Ceti `X` in the body. |
| Duplication with current TauCetiRoadmap and Tau Ceti a91d3aaf | Searched by object: Robba, isocrystal, Monsky–Washnitzer, dagger, Dwork, Kloosterman, Newton polygon, Gauss norm, Dieudonné, cyclic vector, upper numbering, Herbrand, Swan, Tannaka, Lang, Fatou, Hankel, Bézout, Lazard, slope filtration, Fredholm, Artin–Schreier, Zarhin, Ax–Sen, Mittag-Leffler, zeta function, index. The hits are listed below. |
| Own words | I read every target. Statements and proof sketches are paraphrases with locators. The Corrections section states each correction and its reason without quoting the source. |
| Suggested.lean | `lean-check` exit 0 before and after my edits. After: 74 warnings, all `declaration uses sorry`; before there were 76, and two examples are now proved. `scripts/check_sorry_data.py` exit 0. 1,284 lines. One `import Mathlib` block with six Tau Ceti modules and one module docstring. The namespace is `TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology`, with one `/-! ## Layer RD.k -/` section per layer. It contains only real-bodied light definitions, sorry'd theorems and examples, and no sorry'd data. I read every declaration against its README target; see the adversarial table. |
| metadata.toml | `topic = "math.NT"`: fitting. |
| intake | `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems. |

## Duplication found and resolved

- **`LinearMap.index` (Mathlib, at the pin).** `Mathlib/Algebra/Module/LinearMap/Index.lean` defines `LinearMap.index` (dim ker − dim coker), with `index_comp`, `index_zero` and `LinearEquiv.index_eq_zero`. Suggested.lean redefined it as `RD5.finiteIndex`, with a sorry'd `finiteIndex_comp`, and README §RD.5.23 listed "index" as API to build. Fixed:
  - Lean now uses `LinearMap.index`. `HasFiniteIndex` is renamed `NearIsomorphism`, matching the README API.
  - `finiteIndex_comp` became `NearIsomorphism.comp`, since additivity is Mathlib's `index_comp`.
  - The square identity now states its conclusion with `LinearMap.index`.
  - Both index examples are proved by `simp` from Mathlib's lemmas.
  - The README API line, *Needs* line and Mathlib contract list now name `LinearMap.index` and `LinearMap.index_comp`.
- **Upper numbering and Herbrand functions (TauCetiRoadmap LocalFieldsRamification Layer 3; Tau Ceti a91d3aaf `TauCeti/NumberTheory/LocalField/Herbrand/*`).** These are stated for nonarchimedean local fields, which have finite residue field. §RD.2.45 extends upper numbering and Swan conductors to infinite perfect residue fields, which is not in Tau Ceti. Kept, and now marked as an extension:
  - its hypotheses name LocalFieldsRamification Layer 3 for the finite case;
  - its *Needs*, the Scope paragraph, the "From TauCetiRoadmap" contracts and the RD.2 Dependencies all cite it.
- No other overlap. Tau Ceti's `Dwork` hits are unrelated: knot theory, and Chebyshev's Hilbert basis. The other hits are likewise unrelated: Cartan–Dieudonné; Swan's theorem on group rings; Fatou's lemma in measure theory; positive Hankel matrices; Fredholm operators in functional analysis; polynomial results under the name Lazard. The Gauss norm and Tannaka items were already cited as suppliers.

## Adversarial mathematics pass

I checked the statements, identities and conventions by reading every target and computing an instance wherever one was available. In the table, "verified" means that I did the computation or the brute-force count myself.

| Statements | Instances and computation | Result |
| --- | --- | --- |
| Dwork Frobenius direction and sign (§§RD.1.43, 1.46, 1.64, 2.19, 2.24, 3.31, 6.42, 6.48; Conventions; Lean `dwork_multiplier_horizontal`) | ∇w = −πt⁻²w with F = exp(π(t^{−p} − t^{−1})): D(Fw) = −pπt^{−p−1}Fw = (dt^p/dt)F(Dw). ∇e = πe dx with exp(π(x^q − x)), and ∇1 = −π dt with exp(π(t − t^p)), agree. The printed exp(πx − πx^q) leaves the defect 2π(1 − qx^{q−1}), with constant term 2π. M_f with ∇v = π₀t^{−2}v is the dual of E_π. | Verified; all statements consistent. Lean now assumes 0 < q, because the substituted series has a nonzero constant term at q = 0. |
| Artin–Schreier lifts (§§RD.0.31, 2.11, 2.18, 2.24, 2.42) | (1 + π₀u)^p = 1 + pπ₀t^{−1} reduces to ū^p − ū = −t^{−1}, which is the same cover as z^p − z = t^{−1} under z = −ū. The derivative of y^p − y − t^{−1} is a unit. exp(−πt) = E(y) when y^p − y = t, with \|y\| = \|t\|^{1/p} → 1. | Verified. |
| \|E(t^{−1}) − 1\|₁ = \|π₀\| (§RD.2.19) | Each coefficient π₀^{a+b}/(a!b!) of exp(π₀z)exp(−π₀z^p) with (a, b) ≠ (0, 0) has valuation at least 1/(p − 1). The Check's own justification, coefficients in ℤ_p[π₀] of positive valuation, also suffices. | Verified; sharpness threshold c = p^{−1/(p−1)} confirmed. |
| Generic radius and breaks (§§RD.1.8–1.19, 1.46, 2.41, 2.44) | Rank one: D(e) = λt^{−2}e with \|λ\| < \|π\| gives T = min(1, \|π\|ρ/\|λ\|), so f has slope −1 past log(\|π\|/\|λ\|). D(e) = ae has radius min(ρ, ω/\|a\|). Lah numbers and n/3ⁿ tables recomputed. Herbrand inverse: φ(pβ − (p − 1)d) = β. The D^p argument for λ = 1 checked. | Verified. |
| Slopes and Dieudonné–Manin (§§RD.1.21–1.42) | M_{1,2} ⊗ M_{1,3} = M_{5,6}. [2]_*M_{1,2} = A(1)². Rank one Fe = ±e over W(𝔽_p)[1/p] become isomorphic after [2]_* but not before. deg [[0,1],[p,0]] = 1 with slope 1/2. Hom(M_{c',d'}, M_{c,d}) ≠ 0 iff c'/d' ≥ c/d. | Verified. |
| Monodromy conventions (§§RD.2.28, 2.33, 2.34, 2.40; Lean `FrobeniusMonodromyRelation`, `monodromy_nilpotent`) | N(z) = −1 and Nφ = qφN on R_log. Example 7.2.6: N(e₂ − ℓe₁) = e₁, φ = diag(1, q), both sides [[0, q], [0, 0]]. For \|q\| > 1, N ~ q^{−1}N forces nilpotence. | Verified. Two garbled Checks rewritten (Corrections 6). |
| Weyl algebra and Fourier transform (§§RD.6.36–6.44) | ∂²x² = x²∂² + 4π^{−1}x∂ + 2π^{−2}. The ρ coefficient formula, recomputed from ρ(x^i∂^j) = (−1)^j∂^i x^j, gives ρ(x) = ∂, ρ(∂) = −x and ρ(x∂) = −x∂ − π^{−1}. The transform of D†/D†(∂ − a) is D†/D†(x + a). | Verified. |
| Dwork operators and the trace formula (§§RD.6.6–6.23) | ψ(x^{qj}) = qx^j and ψ(x^{qj−1}dx) = x^{j−1}dx, so Tr(ψ\|A) − Tr(ψ\|Ω¹) = q = #A¹(𝔽_q). ψ∘F = q^n but F∘ψ ≠ q^n on A. A¹ minus its q points has alternating trace 0. Spec 𝔽_{q²}: (1 − t²)^{−1}. | Verified. |
| Hankel rationality (§RD.6.24) | Σ(1 + q^r)t^r: D₁ = 1 + q, D₂ = q(q − 1)², D_n = 0 for n ≥ 3. | Verified. The supplier label was wrong (Corrections 2). |
| Weil factor functional equation (§RD.6.87) | Derived c_i = (−1)^{b_i}q^{nb_i}/det(F\|H^i). ℙ¹: −q·t·(1 − 1/(qt)) = 1 − qt. | Verified; the source correction recorded in the README is right. |
| Kloosterman (§§RD.6.94–6.98; Lean `kloostermanSum`) | Kl₁(z) = ψ(z). Kl₂(z; q²) = 2q − Kl₂(z; q)² from eigenvalues with product q. χ(G_m, Kl_{n+1}) = −1. The ker N weight of a single block of size n + 1 is 0. | Verified. |
| Index of affine curves (§§RD.5.23, 5.32, 5.33; Lean `affineCurve_index_identity`) | ind ρ + ind d_loc − ind dρ = (1 − g) − d − (g − 1) = 2 − 2g − d, so dim H¹ = 2g + d − 1. For A¹_{k'} over k, the formula gives 1 while H¹ = 0, so geometric irreducibility is needed. | Verified. |
| Point counts in RD.5–RD.7 (brute force over 𝔽₃, 𝔽₅, 𝔽₇, 𝔽₁₁, 𝔽₁₃, 𝔽₄₉, 𝔽₃₄₃) | y² = x³+x+1/𝔽₇: 5, a = 3. y² = x³+x/𝔽₇: 8, and /𝔽₄₉: 64. y² = x³−x/𝔽₅: 8. y² = x³+1/𝔽₇: 12. y² = x³+2x+3/𝔽₁₃: a = −4. y² = x³+x+1/𝔽₅: a = −3. y² = x³+x/𝔽₅: 4. y² = x³ ± x/𝔽₃: 4. y² + y = x³/𝔽₂, 𝔽₄: 3, 9. y² = x⁵+x+3: #C = 11, 55, 371 over 𝔽₇, 𝔽₄₉, 𝔽₃₄₃, and f has no roots there, which matches 1 + 3t + 7t² + 21t³ + 49t⁴ and #C' = 10, 54, 370. | All match the README and the Lean examples. |
| Twisted Frobenius products (§RD.7.18) | 𝔽₈ = 𝔽₂[a]/(a³ + a + 1), A = [[0, 1], [a, a²]]: tr(A^{σ²}A^{σ}A) = 0 and tr(AA^{σ}A^{σ²}) = 1. | Verified. |
| Weight versus slope (§RD.7.12) | α = (2 + i)(1 + √−19)/2 has minimal polynomial T⁴ − 4T³ + 35T² − 100T + 625, all conjugates of absolute value 5, and 5-adic valuations 0, 1, 1, 2. | Verified. |
| Kedlaya's Lemma 3 (§RD.7.13; Lean examples) | Q = x³ + x + 1, p = 5: Q − (2/5)(Q + xQ'/2) = (2/5)x + 3/5, and ⌊log₅ 7⌋ = 1. Tuitman's B for genus 2 over 𝔽₇ is 3. | Verified. |
| Functional analysis (§RD.5.40 Check) | The Check said that the bidual of c₀(ℕ) over ℚ_p is ℓ^∞ again. That is false over a spherically complete field: Hahn–Banach gives a nonzero functional on ℓ^∞/c₀. | **Corrected.** The new Check shows that c₀ → (ℓ^∞)' is not surjective. The conclusion, that c₀ is not reflexive, was right. |
| Remaining Lean signatures | All 164 declarations and examples checked against the README. Examples: `IsValuationBasis` and its non-examples; Katz's candidate; `IsRationalType` (equivalent to Kedlaya–Xiao 1.4.1); `isAlgClosed_of_denseRange`; Tsuzuki exponents at and below p^{−1/(p−1)}; `exists_conj_eq_smul_of_isNilpotent`; `horizontal_formal_solutions`; growth predicates and the Liouville exponent (m₁ = 2, m_{k+1} = N_k − k, p = 2 values 4, 12, 3, 10); `IsUnitRootIsocrystal` at slopes 0 and 1; `fatou_local` against Milne LEC 27.10; `weightSeparated_factor_extraction`, via Gauss's lemma and Galois stability of each weight class; `pure_charpolys_coprime`; `eigenvalue_norm_eq_on_image`, since the image is an F_W-stable quotient of V; `neutralTannakian_recognition` hypotheses. | No false or vacuous statement. Three fixes: the duplicated index, the misattached residue pairing (Corrections 9), and a docstring that called Σ(1 + q^r)t^r the zeta function of ℙ¹. |

## Source checks

Random sample: 15 targets, `random.seed(9855)` over the 529 headings. I opened each cited source and read the statement at the cited place.

| Target | Locator checked | Outcome |
| --- | --- | --- |
| RD.0.27 | SFR Cor. 2.5.12 p. 19; proof of Prop. 3.3.2 p. 33; Kedlaya 2004 Cor. 3.23 p. 36 (arXiv v4) | Match. |
| RD.1.23 | SFR Prop. 3.3.2 and proof p. 33 | Match; n ≥ 0 over Γ^alg_con and n = w(x) are as stated. |
| RD.1.68 | SFR Prop. 3.3.7(c) pp. 34–35; FF Prop. 11.2.24 p. 378 (author PDF) | Match. |
| RD.2.5 | SFR Lemma 6.1.1 p. 62 and Prop. 6.2.2 p. 63 | Match, including h = −w_r(D) − w_r(D^{−1}) and the bound h/(q − 1). |
| RD.3.3 | Berthelot 1986 (2.5) Remarques a) p. 19; Kedlaya 2006 Def. 4.2.2 p. 26 | Match. |
| RD.3.23 | Berthelot 1986 (4.2.2) p. 27; Kedlaya Notes Lemma 2.6 p. 3 | Match. |
| RD.3.33 | Berthelot 96-03 (2.2.5), (2.2.14), (2.3.2), (2.3.4), (2.3.9) at pp. 61, 66, 69–73, 72, 77 (page markers of the archived preprint); Guo–Reinecke Construction 2.11, Def. 2.12, Rem. 2.13 p. 15 (arXiv v3); Kedlaya Notes Def. 2.1, Rem. 2.3, 2.12, pp. 2–5 | Match. |
| RD.4.1 | Kedlaya 2006 Def. 3.4.1 p. 23; van der Put §2.3 p. 36; Kedlaya 2001 §2 pp. 2–3 | Match. |
| RD.4.5 | Berthelot 1986 (2.2) and (2.5) a); Kedlaya 2006 Def. 4.3.1 p. 27; Kedlaya Weil II §2.2 p. 12 | (2.2) starts at the foot of p. 16. Corrected to pp. 16–17 in its three citations. |
| RD.5.62 | Kedlaya 2006 Prop. 8.5.3 p. 59 | Match, including the added hypothesis that H^i_rig(A^n, E^∨) is finite dimensional and separated. |
| RD.5.111 | Guo–Reinecke Thm. 6.13 pp. 60–61 (arXiv v3) | Match. |
| RD.6.3 | Kedlaya Weil II §2 opening p. 9, §2.1 p. 10 | Match (setup and convention). |
| RD.6.20 | Kedlaya Weil II (2.1.1) p. 10; proof of Thm. 5.3.2 p. 39 | Match. |
| RD.7.3 | Kedlaya Weil II §6.6 (a) p. 51; Kedlaya Notes Rem. 9.7 pp. 22–23 | Match. |
| RD.7.4 | Deligne Weil I, proof of (1.7) ⇒ (1.6), pp. 276–277; Milne LEC v2.21 Lemma 27.9 p. 156, Lemma 27.10 p. 158 | Match. |

Locators the packager flagged as unverified:
- **Katz–Lang Theorem 1** (§RD.6.63). e-periodica still refuses automated download. The statement is confirmed through Crew, *F-isocrystals and their monodromy groups*, Theorem 1.6 p. 435 (Numdam), which the README also cites. Crew states it for X₀ smooth proper over an absolutely finitely generated field and attributes it to Katz–Lang without a theorem number. The theorem number "1" is therefore unverified.
- **Schneider–Teitelbaum** (§RD.5.40). The JAMS paper is arXiv:math/9912073v1; the arXiv id the packager had was a different paper. Theorem 1.1 (p. 3), Theorem 1.3 and Corollary 1.4 (p. 4) give exactly part (h). The README now cites them, and the reference entry has the arXiv link.
- **Cited by section only:** Serre, *Local Fields*; Humphreys; Milne, *Algebraic Groups*; Moret-Bailly; Deligne LNM 163; Malgrange. None of these books is freely available or cleared in the library index. Their section citations stand.

In passing I also confirmed a number of other locators:
- Crew 1992, Theorems 1.3 and 1.4 p. 434 (§RD.6.61).
- van der Put (2.4.4) p. 37 and (4.1.0) p. 41.
- Kedlaya 2001, Lemmas 2–3 p. 5 and Step 3 p. 8.
- FF Lemme 11.2.25 p. 379, Prop. 11.2.20 p. 377 and Remarque 11.3.4 p. 382.
- Kedlaya 2004 Prop. 6.11 p. 79 and Thm. 6.12 p. 81.

## Corrections made in place

All README edits were made by exact-string replacement, with each occurrence count asserted. After the edits the README has 15,173 lines and 1,735,411 bytes. All 529 anchors and all 3,351 internal links resolve, and every definition and construction still has at least three Checks.

1. **Supplier contracts.**
   - The "AdicEtaleGeometry" heading listed AdicSpacesPartII §R2.76 and ClassicalAdicEtaleCohomology §§4.1–4.2, which belong to other roadmaps. Both are now listed under their own roadmaps, and the RD.4 Dependencies line names ClassicalAdicEtaleCohomology instead of AdicEtaleGeometry.
   - ArithmeticGaloisRepresentations §2.6 was listed under LefschetzPencils; it is now under ArithmeticGaloisRepresentations.
   - A duplicate pull request #196 line under InverseGalois was removed; it is already in "From TauCetiRoadmap".
   - Titles are now given for §R2.76, AGR §§2.6 and 6.3, and AbelianSchemes §A5.7.
2. **Nonexistent supplier labels.**
   - "ArithmeticGaloisRepresentations Layer R01.3" (three places) → Layer 3 (§3.1).
   - "ClassicalArithmeticCompletion Layer CA.6" → Layer 6 (§6.44).
   - "LocallyAnalyticDistributions Layer L0", cited for the bipolar theorem, Banach–Steinhaus and barrelledness in §§RD.5.42, 5.44 and 5.45 → §RD.5.40 (a)/(b). LocallyAnalyticDistributions does not state these, and §RD.5.40 owns them.
3. **Supplier titles**, corrected to the headings the suppliers actually use, globally (contracts and *Needs*):
   - AGR §§3.1, 3.2, 3.4, 3.5, 3.7, with duplicate entries merged;
   - LocallyAnalyticDistributions §0.0 (two titles);
   - AbelianSchemes §A6.11; LefschetzPencils §1.3; InverseGalois §IG.0.3; SchemeAndStackFoundations T386;
   - AdicSpacesPartII "§R3" → §R3.22, and "§F1, compact-support logarithmic complex" → §F1.55.
   - §RD.2.46 had cited AGR §3.5 for ψ_{L/K}, which AGR does not state. It now cites §RD.2.45, which defines ψ for perfect residue fields.
   - Four layer-level AdicSpacesPartII citations now name the section: §R3 → §R3.23, Kiehl's Theorem B (§RD.4.12); §R3 → §R3.37, Kiehl's proper mapping theorem (§RD.5.115, also added to its *Needs* and to the contracts); §F1 → §F1.22 (§RD.0.40); §R2 → §R2.13 (§RD.3.2).
4. **Wrong AdicSpacesPartII section §F1.55**, which is compact support. It had been cited for:
   - the weak completion (now §F1.22);
   - radius-indexed presentations (now §F1.15);
   - dagger differentials (now §§F1.6, F1.46);
   - rigid-space differentials (now §R3.36);
   - noetherianity and regularity of W_n (now §§F1.6, F1.9).

   It is kept, with its title, for RD.4.56.
5. **Upward references.** VectorBundlesAndIsocrystals is outside the tier order, and three Checks or API items referred to its layers VB0 and VB1 (§§RD.1.26, 1.27, 1.32). They now state the sign dictionary for vector bundles directly.
6. **Computer-output residue.**
   - PARI-style `newtonpoly`, `ellap` and `hyperellcharpoly` references, empty parentheses "()", "(, p = 3)", "checked in (… returns 1)", "verified symbolically" and "numerically confirmed" were rewritten as mathematical statements.
   - This covers 17 places in §§RD.0.38, 1.9, 1.11, 1.32, 1.35, 1.42, 1.46, 2.3, 2.34, 2.40, 2.41, 2.42, 5.96, 5.97, 6.23, 6.42, 6.58, 6.92 and 7.12.
   - Two garbled bullets in §RD.6.42 and the garbled Nφ = qφN Check in §RD.2.34 were rewritten.
7. **Pagination.** Sixteen citations of *Slope filtrations revisited* used Doc. Math. pages, while 136 used arXiv v4 pages. The ten located in §§RD.0.2–RD.0.52 were converted to arXiv pages; each page was checked in the arXiv text. The References entry now says which pagination is used. The Corrections entries already give both.
8. **Wording and small mathematical fixes.**
   - The false c₀-bidual Check (§RD.5.40), as in the table above.
   - §RD.5.67: the Čech nerve of one alteration *is* a proper hypercovering; its terms need not be smooth.
   - §RD.3.52: λ ∈ ℤ_{≥0} gives an overconvergent series, and a negative integer makes a term undefined.
   - §RD.6.92: each closed point of degree d contributes q·ζ with ζ^d = 1.
   - §RD.5.34: y² = x³ − x is the Legendre curve with ū = −1, not a translate.
   - §RD.0.49: "empty-or-{t}"; §RD.0.51: an undefined field L.
   - §§RD.0.9 and 0.29: the undefined variable u in the non-noetherian example is t.
   - §RD.6.28: "DeligneWeightsAndPurity Layer 0" → Layer DWP.0.
   - §RD.4.19 carried the supports triangle of §§RD.4.20–4.21, a statement about cohomology with supports defined only afterwards; removed there.
   - §RD.4.31 had an imperative paragraph ("Use … Retain …"), now declarative.
   - "a smooth V-algebra" → O_K-algebra (§§RD.3.28, 3.32); spacing "E∈Isoc†" and "M⊗Ω•_(A†_K/K)"; "Α is fixed" → "α"; three "(…v2;)" fixed.
9. **Lean.**
   - Index duplication: see "Duplication found and resolved" above.
   - `localPairing`, the constant term of fg, is the residue pairing of §RD.5.45 in the coordinate dx/x, not the shifted pairing of §RD.5.61. Its "declares" line moved to §RD.5.45, and its docstring and non-example now say so.
   - `dwork_multiplier_horizontal` gained `(hq : 0 < q)`.
   - The `rational_descent` test docstring no longer calls Σ(1 + q^r)t^r a zeta function.
   - A closing comment now lists by section the 112 README definitions and constructions whose carriers are not at the pins.
   - Final check: `lean-check` exit 0, 74 `sorry` warnings and nothing else.
10. **Locator updates** from the source checks above: Berthelot 1986 (2.2) → pp. 16–17 (three places). §RD.5.40 now cites Schneider–Teitelbaum Theorems 1.1 and 1.3 and Corollary 1.4 with the arXiv pages. "Theorem 6.5.3 ()" → p. 106.
11. **TauCetiRoadmap citations.** LocalFieldsRamification Layer 3 is added, as described under "Duplication found and resolved". The Dependencies lines of RD.3 and RD.7 now name pull request #196 and EllipticCurves, which their targets already used.

## Remaining (for the maintainer; not defects of the review)

- **Size.** The README is 1.74 MB for 529 targets, about twice CrystallineCohomology (834 KB). GitHub may show a Markdown file this large as raw text. If it is split, the packager's suggested Parts are natural: RD.0–RD.2 (local theory), RD.3–RD.5 (coefficients and cohomology), RD.6–RD.7 (traces, weights, Weil factors). Splitting is a structural decision, not a correctness fix, so I did not do it.
- **Pull request #196** (CohomologicalPointCounting) is still open upstream. §§RD.3.48, RD.3.53, RD.7.7, RD.7.8 and RD.7.22 use it, as InverseGalois does.
- **Katz–Lang Theorem 1:** see Source checks.
- **Book locators at section level:** Serre *Local Fields*, Humphreys, Milne *Algebraic Groups*, Moret-Bailly, Deligne LNM 163, Malgrange. None is freely available or cleared.
- **Moved-down targets.** The package handoff lists targets owned here that naturally belong lower: Arabia's lifting, characteristic-p Ax–Sen, locally convex duality, universal cohomological descent, upper numbering for perfect residue fields, Zarhin's trick, geometric class field theory for curves, Lie normalisers. They are correct as stated here, and the maintainer may relocate them.

## Checks run

- `lean-check …/Suggested.lean`: exit 0, 74 warnings, all `declaration uses sorry` (76 before the edits).
- `python3 scripts/check_sorry_data.py …/Suggested.lean`: exit 0.
- `python3 research/blueprint/intake.py check-files` on README.md, Suggested.lean and metadata.toml: 0 problems.
- Scripts in scratch:
  - plan-title coverage, 503/503;
  - Checks counts, at least 3 for all 130 definitions and constructions;
  - internal links, 3,351 resolve;
  - library names against the pinned declaration index, all found;
  - tier check of every cited roadmap;
  - brute-force point counts over finite fields.
- A Sonnet cross-check of 243 supplier citations. I read every mismatch it reported.
