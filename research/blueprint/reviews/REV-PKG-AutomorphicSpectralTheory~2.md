# Independent package review, round 2: AutomorphicSpectralTheory

Verdict: **accepted**, after the corrections below were made in place.
Reviewer: `independent-review-REV-PKG-AutomorphicSpectralTheory~2`.
Worker: Claude (Opus 5.5), session `claude-nLVIpm`. Date: 14 October 2026.
Issue: [#9684](https://github.com/CBirkbeck/tauceti-explorer/issues/9684).
This session did not write the package, its revision, its plan or the first package review.

## What the revision changed

The first review returned `needs_changes` on the 2026-10-12 shape rule. Its requests and their status:

| Request of the first review | Status in the revision |
|---|---|
| A.1 Remove the 46 sorry'd data definitions | Done. `scripts/check_sorry_data.py` reports nothing. |
| A.2 Remove stand-in carriers (`HilbertModel`, `GLAutomorphicDatum`, `CochainData`, …) | Done. None remain. |
| A.3 Namespace `TauCetiRoadmap.AutomorphicSpectralTheory`, one module docstring, `Layer k` headings, no atlas ids | Done. |
| A.4 Compact keep-list (strip order, Bessel J/I, Whittaker M, Kloosterman, weight Laplacian, Eisenstein series, Legendre Q, V_s, Herglotz) | Done. The file has 403 lines. |
| B.1 `# Roadmap:` title and `**Summary.**` | Done. |
| B.2 Scope, Conventions, supplier contracts, How to read the build | Done. Supplier contracts corrected here (see below). |
| B.3 `## Layer k` / `### k.n`, Checks, Examples, Dependencies | Done. |
| B.4 Drop field lists, `AS.k.j`, B- and S-labels; replace slugs | Done, apart from about 105 run-in "Throughout this statement, assume X" remnants, rewritten here. |
| B.5 Remove process traces | Mostly done. Remaining fixture-style Checks rewritten here. |
| B.6 Franke clause (c) | Done. It is the new §5.14, `franke_support_weights`, and `franke_input` combines §§5.10, 5.12 and 5.14. |

## The six checks

| Check | Result |
|---|---|
| 1. Upstream form | **Holds after fixes.** The shape is upstream's, and every definition has at least three Checks. Two branches cite later-numbered sections, so the numbering is not a strict build order. "How to read the build" now gives the exact order. |
| 2. Fidelity to the plan | **Holds.** All 190 plan targets appear, matched by title and statement. The projection-valued measure appears as a supplier contract because OperatorTheory owns it. Six sections are not in the plan; all are sanctioned (see "Fidelity" below). |
| 3. Own words | **Holds.** All of Layers 0–6 were read. There are no source passages and no section-by-section summaries. 95 locators were verified. |
| 4. No process | **Holds after fixes.** No packet ids, slugs, job language or coverage statuses remain. |
| 5. Suggested.lean | **Holds.** `lean-check` exits 0 with no errors and 57 warnings, all `declaration uses sorry`, before and after the review (shared build, Mathlib `082e2d3`, Tau Ceti `f790474`). The file has 403 lines and no sorry'd data or theory. Every declaration is a README target or API item with the same hypotheses (table below). |
| 6. metadata.toml | **Holds.** `topic = "math.NT"`. |

## Fidelity

The plan's 190 targets map onto 189 README sections; the projection-valued measure became a supplier contract. Eight plan titles were reworded without changing the target:
- Hilbert–Schmidt operators → §0.8, measurable Hilbert–Schmidt kernels.
- Trace class → §0.9, complex operator trace.
- The "Correct"/"New" sine-power and cycle integrals → §§0.29–0.30.
- The "(cited)"/"(quoted)" expansions → §§1.22, 1.29, 1.30.
- The typed finite-fibre trace → §6.36.

There are six sections beyond the plan:
- §0.25 Bessel J/I, §1.16 Kloosterman sums and the weight Laplacian, §2.7 generic packets, §6.9 invariant orbital integrals and §6.18 pseudo-coefficients. These are the notions the first package round moved down from higher-tier roadmaps (EndoscopicTransfer, QSeries, EllipticRegulators). WORKERS.md requires that move.
- §5.14, Franke clause (c), which the first review asked for.

The `euclidean_paley_wiener` statement added in §1.6 by this review is a prerequisite inside an existing section, not a new section.

I compared statements and hypotheses with the packet for the lowest-overlap sections: §§0.36, 0.38, 0.44, 1.24, 1.29, 3.16, 3.19 and 4.15. They agree. Every definition or construction has at least three Checks.

## Sources verified (95 locators, all correct)

The public PDFs were opened and each theorem, equation and page was found on the cited printed page. The free Annals PDF of [DIT16] turned out to contain all 42 pages with Annals pagination, so the DIT16 locators are checkable from the link given.

| Source | Locators checked |
|---|---|
| [Art05] (19) | Lemma 7.1 p.34; Theorem 7.2(a), (7.3)–(7.4) p.35; Theorem 9.1 p.46; Lemmas 12.2, 12.4 pp.64–66; (13.1) and Proposition 13.1 p.68, with the remark that [A4] = Arthur 1980, Lemma 1.1, should read ≤; Proposition 13.2 p.71; Theorem 14.1 p.74; Lemma 17.1 pp.93–94; (18.3) p.104; (18.10) p.107; Theorem 18.2 p.108; Theorem 19.2 p.113; (21.5) p.130; Corollary 21.3 p.134; (21.13) p.136; Theorem 21.6 p.137; Proposition 23.1 p.148; Theorem 23.4 p.151 |
| [DIT16] (18) | (5.1)–(5.6) pp.961–962; (5.2) p.961; (5.3), (5.4), (5.5) p.962; (5.10)–(5.12) p.963; Lemma 1 proof p.972; (8.1)–(8.3) and Proposition 3 p.973; (8.4) p.974; Kloosterman sum p.974; printed a(m)a(n) p.975; (9.2) p.979; Lemma 7 and (9.4) p.980; (A.1) p.983; 3.892 p.984; (A.2), (A.3) p.985 |
| [GZ86] (9) | (2.4)–(2.9) p.238; (2.10)–(2.14), with κ_N, p.239; (3.2) and (3.3a)–(3.3b) p.277 (scanned pages, read as images) |
| [Yu22] (20) | Théorème 2.3.6 and "bon représentant" p.12; Proposition 2.3.7 p.13; Théorème 3.3.1 p.18; Remarque 3.3.3 p.19; Proposition 4.2.3 and Théorème 4.2.2 p.23; Lemme 4.2.5 p.26; Corollaire 4.2.6 p.27; Lemmes 4.2.7–4.2.8 pp.27–29; Proposition 5.2.1 p.32; (5.2.8) p.33; (5.2.10) p.34; (5.2.12) p.35; Proposition 5.3.1 and Corollaire 5.2.3 p.36; Proposition 5.3.4 p.39; Lemmes A.1–A.3 pp.75–77 |
| [Fra98] (6) | Theorem 7 p.208; Theorem 14 p.236; Theorem 16 p.246; Theorem 17 p.247; Theorem 18 pp.255–256; Theorem 20 p.261 |
| [CD90] (4) | Théorème 1 pp.194–195; Lemme 6 and Proposition 4 p.212; Théorème 3 p.213 |
| [JZ20] (4) | (5.4) p.48; Proposition B.1 and Theorem B.2 p.85; (B.7) p.86 |
| [Tes14] (14) | Theorems 0.23, 0.26 pp.22–23; Lemma 3.4 p.93; Theorem 3.7 p.96 (A=∫λdP_A); Lemma 3.16 p.104; Theorem 3.17 p.105; Theorem 3.20 p.107; Theorems 6.6–6.7 pp.136–137; Lemma 6.10 p.140; Lemma 6.13 pp.142–143; Corollary 6.14 and Lemma 6.15 p.143; Lemma 6.16 p.144 |
| [MW89] (1) | Théorème, p.606 |

Two of the Duke–Imamoḡlu–Tóth corrections the README makes were rechecked against the source:
- **§2.21–§2.22, parity.** With φ=2√y Σa(m)K_{ir}(2π|m|y)e(mx) ((5.7), p.962) and a(−m)=a(−1)a(m), the correct residue of (2s−1)Φ(−m,n;s) is 2Σ⟨φ,φ⟩⁻¹a(−m)a(n). The printed a(m)a(n) on p.975 is right only for even φ. The source's proof pairs u(z)u(z′) without conjugation, which fails for odd forms: those are purely imaginary when a(n) is real. The README's statement of Proposition 3 is the correct one for both parities.
- **§2.23, zero mode.** The README writes the m=0 term of Fay's expansion (8.3) explicitly as (2s−1)⁻¹y′^(1−s)E(z,s). The jump condition for Δ−s(1−s) with dμ=dxdy/y² gives exactly the constant 1/(2s−1).

## Adversarial mathematics pass

The first review checked about 25 explicit formulas numerically. This pass covered every declaration of the rewritten Suggested.lean and every Check changed or added here. Each was checked by hand, including the degenerate and totalized cases.

| Statement | Instances and degenerate cases | Result |
|---|---|---|
| `StripOrder`, `FiniteStripOrder` and their examples | z³; exp z (bounded by e^b on strips); exp(z²) (|·|=e^{x²−y²}); exp(exp(−iz)) at z=it gives exp(eᵗ) | holds |
| `CommonDenominator` examples | z⁻¹ at 0 (n=1, g≡1) and away from 0 (n=0); exp(1/z) essential | holds |
| `Herglotz.weightedMeasure`, `weighted_mass`, `integral_conversion` | (1+t²)·[(t−z)⁻¹−t/(1+t²)]=(1+tz)/(t−z); δ₂↦5δ₂; ρ=0; matches Tau Ceti's `nevanlinnaKernel` (1+xz)/(x−z) | holds |
| `herglotz_representation` | Re F(i)=a, since Re[(t−i)⁻¹−t/(1+t²)]=0; F(z)=z gives (0,1,0); uniqueness is not in Tau Ceti a91d3aaf | holds; new content |
| `rpowC` | 4^(1/2)=2, 4^(−1)=1/4 | holds |
| `bessel_j`, `bessel_i` and their series | Mathlib's `regularizedHGFun` divides by ∏Γ(b+n) (checked in source); at y=0, ν=0 both sides give 1; at ν=−2, y=0 both sides give 0 under the totalized Γ(0)=Γ(−1)=0 | holds |
| `bessel_j_ode`, `bessel_i_ode`, J_{1/2}, I_{1/2}, J_{−n}, I₀(0) | DLMF 10.2.1, 10.16.1, 10.25.1, 10.39.1 | holds |
| `whittaker_m` and `whittaker_m_euler` | M=Γ(1+2ν)e^{−y/2}y^{ν+1/2}M̃(ν−μ+½;1+2ν;y); Euler integral after t↦1−t; M_{0,1/2}=2sinh(y/2); M_{1,1/2}=ye^{−y/2} | holds |
| `whittaker_bessel_comparison` | DLMF 13.18.8; the hypothesis Re ν>−½ excludes the poles of Γ(1+2ν) and Γ(ν+1) | holds |
| `whittaker_asymptotics` | near 0: Γ(1+2ν)·(1/Γ(1+2ν))=1, needing Re(2ν+1)>0, which the two hypotheses give; at ∞: DLMF 13.19.2 | holds |
| `sine_power_integral` | (ν,β)=(1,0) gives π; (2,0) gives 2; poles of the reciprocal Γ give 0 on both sides | holds |
| `legendre_q`, `legendre_q_hypergeometric` | s=1: −½log(1−x) with x=2/(1+t); Q₀(3)=½log2; Q₁(3)=(3/2)log2−1 | holds |
| `point_pair_invariant` at s=1 | t+1=|z̄−z′|²/(2yy′) gives log(|z−z′|²/|z̄−z′|²); the diagonal is junk-valued and excluded | holds |
| `archimedean_v_integrable_iff`, `archimedean_v_at_zero` | integrability iff 2k−1+2Re s>1; k=s=1 by residues gives −πi/2, which matches the formula and the example | holds |
| `weight_laplacian`, `weight_laplacian_power` | Δ_k y^s=s(1−k−s)y^s; Δ₀y²=−2y²; Δ_k1=0 | holds |
| `kloosterman_sum` | c=1 gives 1; S(0,0;c)=|(ℤ/c)ˣ|=φ(c) | holds |
| `nonholomorphic_eisenstein` and `level_eisenstein` | ½ for ±(c,d); level 1 equals full level; N=0 leaves (0,±1) and gives y^s; s=1 diverges | holds |
| `completed_eisenstein_continuation` | Λ(2)=π/6 times residue 3/π gives ½ at s=1, and −½ at 0 by reflection; analytic off {0,1} | holds |
| §1.4 new Checks | Λ(2s−1)/Λ(2s)=π^{1/2}Γ(s−½)ζ(2s−1)/(Γ(s)ζ(2s)), the DIT16 constant term | holds |
| §1.6 Euclidean Checks | 1_{[−1,1]} has transform 2sinh λ/λ, which is O(1/|t|) on iℝ; translation multiplies by e^{−λ(H₀)} | holds |
| §6.8 two-chamber family | (cd)_M=c_Md₀+c₀d_M; 2·5+2·3=16 | holds |
| §6.10 rank-one weight | the zero value of Σe^{−λH_P}/θ_P is r·vol | holds |
| §6.19 new Checks | compact G: EP(π)=dim π^G, and the constant 1 has those traces; 𝔤=ℝ: H⁰=H¹=ℂ | holds |
| §6.28 | λ₁/(λ₁−λ₂)+λ₂/(λ₂−λ₁)=1 | holds |
| §5.14 Kostant weights | GL₂, λ=0: s·0=−α=(−1,1), dual (1,−1); −(w·λ+ρ_L)=−w(λ+ρ)+ρ_P | holds |
| §6.9 Checks | PGL₂(ℝ), diag(1,−1): antidiagonal w gives index 2 | holds |
| §2.7 Checks | SL₂: Ind(|·|^β) is irreducible for 0<β<1/2; Ind(|·|) has trivial quotient | holds |
| §2.25 residue κ_N=−12/index | free kernel ×(−4π) and 1/vol, with Γ₀(N)/±I counted once | holds |

No statement checked was false. The generality of the README and the Lean signatures agrees: the same hypotheses on y, Re ν, Re s, N and c appear in both.

## Supplier contracts and duplication

I checked every Mathlib and Tau Ceti name at the pins and in the current Tau Ceti library, and every upstream roadmap label the README cites. Mathlib names, including `Ideal.primaryComponent` and its API, `Module.AEval'.X_smul_of`, `Complex.regularizedHGFun`, `TestFunction.topologicalSpace` and `IsHilbertSum.mkInternal`, all exist at `082e2d3`. The following were wrong and are corrected:

| README claim | Fact | Fix |
|---|---|---|
| SelfAdjointSpectralTheory supplies `scalarMeasure`, `inter`, `borelIntegral` | The names are `ProjValMeasure.diagMeasure` (SA-B21), `proj_inter` (SA-B29) and `borelCalculus` (SA-B05); `borelIntegral` does not exist | Renamed, with labels. |
| Part E supplies A=∫t dE(t) on {v:∫t²dμ_v<∞} | Part E supplies P_A (SA-E01, SA-E03), the resolvent formula (SA-E05), Stone (SA-E43) and uniqueness (SA-E44), but not this representation | Contract corrected; the representation is now a stated corollary in §0.6 ([Tes14], Theorem 3.7, p.96). |
| OperatorIdeals B46–B52 supplies the Hilbert–Schmidt ideal bound | That bound is OI-B40; B46–B52 is Ky Fan and finite-dimensional Schatten material | Corrected. |
| `mul_hs`: HS·HS is trace class, as an OperatorIdeals contract | No OperatorIdeals item states it | It is now the API item `trace_class_of_hs_mul` of §0.9 ([Tes14], Lemma 6.13, pp.142–143). |
| Mathlib `LinearPMap.resolvent`, `IsResolventAt`, `analyticAt_resolvent` (§2.19), and the resolvent core described as being "beyond the pin" | They are Tau Ceti's `TauCeti.LinearPMap.*`, present at f790474 (`Resolvent/Unbounded.lean`, `Resolvent/Analytic.lean`) | Attribution and module paths corrected. |
| ALS.F.5 supplies (𝔪_G,K_∞) cochains | F.5 is the general (𝔤,K) version; 𝔪_G enters at ALS.5b.1 | Corrected. |
| ALS.F.6 supplies transitivity of constant terms | Not in F.6; it is AutomorphicFormsOnReductiveGroups Layer 3, the constant-term transitivity node (tier 11) | Corrected in the contract and in §§1.10 and 5.5. |
| AL Layer 0 supplies Fourier–Laplace inversion | AL.0 supplies Fourier inversion with self-dual measures and the K-Bessel API, not the Euclidean Paley–Wiener theorem | Corrected; §1.6 now states that theorem as an open prerequisite. |
| SmoothRepresentations supplies the local Langlands classification | SR.3.3 states the Langlands classification conditionally | Recorded in the contract; §2.7 inherits the hypothesis. |
| AdelicAlgebraicGroups §§3.1, 3.4 (relative roots and chambers) | Relative roots and chambers are in §3.1 | Corrected in three places. |
| §6.3 "the growth step is `PaleyWienerBound.mul_of_polynomialGrowth`" | No such declaration exists in any tree, and the plan has no such name | Now the target `spectral_multiplier_growth` of §6.3. |

**Duplication.** I searched TauCetiRoadmap main `0d144d0`, including the nine newer roadmaps and Completed, and Tau Ceti `a91d3aaf`, by object. Neither library and no upstream roadmap has:
- Bessel, Whittaker or Legendre-Q functions;
- Kloosterman sums or the hyperbolic Laplacian;
- nonholomorphic Eisenstein series;
- orbital integrals, truncation operators or trace formulas.

Tau Ceti `a91d3aaf` has the Nevanlinna existence theorem `TauCeti.exists_isFiniteMeasure_eq_nevanlinnaKernel_add`, but no uniqueness. §0.5 already cites it and keeps only the density conversion, uniqueness and the resolvent specialization. Tau Ceti's holomorphic Eisenstein series are a different object. No target is removed.

**Tiers.** AutomorphicSpectralTheory is tier 13 and unbundled. Every roadmap it cites is lower or upstream:
- ReductiveGroupsPartII (1);
- AdelicAlgebraicGroups and SmoothRepresentationsOfLocalGroups (2);
- ArithmeticLocallySymmetricSpaces and AutomorphicFormsOnReductiveGroups (11, bundled);
- AutomorphicLFunctionsAndLocalFactors (12);
- OperatorTheory and RepresentationTheory (TauCetiRoadmap main).

## Other corrections made in the README

- **§6.32.** "nonzero and finite on [Yetter04]" was a label mis-substitution. It now reads "on the unit circle |z|=1", as in the plan and [Yu22], Corollaire 4.2.6.
- **Fixture-style Checks.** These were replaced by concrete discriminating tests: §1.2 (a garbled second Checks line), §1.4, §1.9, §0.3, §4.11, §6.4, §6.10, §6.11 and §6.19. The inline Checks of §1.10 and §6.8 are now lists, and §6.28's two Checks blocks are merged.
- **Run-in hypotheses.** About 105 "Throughout this statement, assume X" remnants of the field lists became "*Standing hypotheses:* …" with normal capitalization; §4.20's "assume D." became "convention D".
- **Citation form.** Raw and misspaced keys were normalized: "Arthur88global", "Arthur89", "CT20 §1.4", "Laf97 p284", "Proposition5.3.4 p39", "AppendixA, p984" and similar. Arthur 1980 and 1981 are now cited as [Art80] and [Art81]. Yu's [Ar82] (Amer. J. Math. 104) is cited in full in §6.40.
- **References.** Six uncited entries were removed: [Lan76], [Art78], [Art83M], [Art88L], [CG20], [BCGP21]. [MW89] (Numdam) and [MW94] (book, cited through [Yu22]) were added, and the free arXiv version of [ACC+23] noted.
- **Build order.** "How to read the build" now lists the exact order for the two branches that cite later-numbered sections: the modular resolvent §§2.19–2.23 after §4.8, §§1.29–1.30 after §2.17, and the function-field branch across Layers 0, 1, 2, 3, 4 and 6. A script over the `*Needs:*` lines found 21 such forward edges, no cycles and no dangling references.
- **Suggested.lean.** The closing list of README-only constructions now includes `euclidean_paley_wiener`. Nothing else in the Lean changed.

`python3 research/blueprint/intake.py check-files` on README.md, Suggested.lean and metadata.toml: 0 problems.

## What remains

1. **Euclidean Paley–Wiener theorem (§1.6, open gap).** The pseudo-Eisenstein construction needs the theorem that Fourier–Laplace transforms of smooth compactly supported functions on 𝔞_P^G are exactly the entire functions of exponential type with rapid decay on vertical lines, with inversion on every real shift. It is not in Mathlib at the pin or in Tau Ceti, and no supplier roadmap plans it; [Art05] uses it as classical (§12, p.65). The README now states it as `euclidean_paley_wiener` with three Checks and marks the missing proof locator as a gap. A sources job should supply a citable proof.
2. **Layer numbering (optional).** Layers group targets by subject, so the modular and function-field branches cite later-numbered sections. The explicit order now makes the build followable. A later revision could renumber them into strict build order, for example moving §§2.19–2.24 into Layer 4 and the function-field prefix into an early layer; that was not required for acceptance.
3. **For the orchestrator.** `upstream/CaraianiNewton.md` records that ArithmeticLocallySymmetricSpaces ("move down: AutomorphicSpectralTheory (5)") and AutomorphicFormsOnReductiveGroups ("AutomorphicSpectralTheory (2)"), both tier 11, cite this tier-13 roadmap upward. ALS handles Franke through its `FrankeInput` hypothesis, which §§5.10, 5.12 and 5.14 discharge. AF's remaining upward citations should be pointed at their owners when AF is packaged.

## Files

- `research/blueprint/packages/AutomorphicSpectralTheory/README.md`: corrected in place.
- `research/blueprint/packages/AutomorphicSpectralTheory/Suggested.lean`: one closing-comment line.
- `research/blueprint/packages/AutomorphicSpectralTheory/metadata.toml`: unchanged.
- `research/blueprint/packages/AutomorphicSpectralTheory/review.json`: status `accepted`.
