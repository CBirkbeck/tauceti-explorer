# Independent package review: explicit K₃ and Bloch groups (round 3)

Job REV-PKG-K3BlochGroups~codex3, issue #11375. Reviewer: Claude (Opus 5.5), session claude-aYCldf, 2026-10-20.

**Verdict: accepted, after the corrections below.** The package went through PKG-K3BlochGroups~codex (codex-zi0zxQ), the independent review REV-PKG-K3BlochGroups~adv (codex-xyX96G), and the fixes FIX-PKG-K3BlochGroups~adv (codex-DXquWa) and ~adv2 (codex-52zHpj). This reviewer wrote none of them. With the corrections made here, items 1–6 of the job hold, subject to the size remark under item 1.

## The five earlier findings and the de-cycling round

| Earlier finding | State found | Action here |
| --- | --- | --- |
| 1. Hopf/Whitehead and the sphere unit (§1.5) | The four targets were fully stated, but the README sent them to an "AlgebraicTopology continuation" and a "StableHomotopyKTheory continuation". Neither exists, so the contract had no owner. | Made them targets of this roadmap, in Scope and ownership, the Hopf supplier bullet and §1.5. Hatcher Ex. 4.51–4.52 and Exercise 37 remain the route. |
| 2. Integral Chern diagonal, char-p Milnor torsion, degree-zero comparison, K₄ divisibility (§2.2) | All four were stated, but routed to "MotivicEtaleKTheory / K2SymbolsBrauer continuations". Those do not exist; the grep finds the names only in this README. | Made them owned targets. They now build on cited sections: MotivicEtaleKTheory §§7.5, 9.1, 10.4; SchemeKTheoryOperations §§5.5, 6.4; K2SymbolsBrauer Layers 5 and 10, §§5.13–5.14; GeneralAlgebraicKTheory §13.8c. |
| 3. Unstable rank-two symbols (§4.5) | Stated as a "K2SymbolsBrauer continuation" contract. | Owned here. I checked the five relations and the action formula against Hutchinson Thm 2.9 and its proof (pp.9–10). Both agree, and the theorem needs \|F\|≥10, which every infinite field satisfies. |
| 4. GL₂ d³ and the monomial inputs (§§4.11, 4.15) | Closed by the earlier fix. However, §4.15 used `symmetricGroup_homology_stable` and the cyclic power formula, which were stated later, in §5.2. That was a forward reference. | Moved `cyclicHomology_maps` and `symmetricGroup_homology_stable`, with their Checks, into §4.15; §5.2 now cites them. I also recomputed the ψ′ and norm conventions (see the adversarial pass). |
| 5. Actual finite-field maps (§§5.2–5.5) | The proof decomposition is closed, and Sah is no longer an input. The finite-group module was routed to a "StableHomotopyKTheory continuation". | Owned here; it builds on Tau Ceti transfer/Shapiro/Mackey and the Mathlib cyclic resolution, all checked at current Tau Ceti `a91d3aaf` and Mathlib `082e2d3`. |
| De-cycling (#11336): PolylogarithmFunctions supplies the analytic function, and Polylogarithms is downstream only | Done for Polylogarithms. HabiroNumberFields HB.1–HB.2 was still a supplier of §6.7, but HabiroNumberFields imports this roadmap (its README, "From K3BlochGroups V.2–V.6"). That is a cycle. | Removed the Habiro-dependent composite Φ_ζ=R_ζ⁻¹c̄₂,₁ from §6.7, together with the Lean section `FiniteCoefficients`. HabiroNumberFields owns the étale Bloch group and R_ζ (its §§1.6, 1.13) and now consumes `finiteChernIndEquiv`, which stays here. |

## Corrections made

1. **Supplier order.** Every supplier was checked against its package README for any use of this roadmap. A Sonnet helper did the mechanical cross-check; I read every quoted line.
   - None of the cited suppliers uses this roadmap: K2SymbolsBrauer, StableHomotopyKTheory, GeneralAlgebraicKTheory (TauCetiRoadmap PR #1212), KTheoryFiniteLocalFields, ArithmeticKTheory, MotivicEtaleKTheory and SchemeKTheoryOperations.
   - Two consumer claims were false and created apparent cycles:
     - "ArithmeticKTheory N.8 consumes …": ArithmeticKTheory §8 needs no Bloch group, and its README calls this roadmap a downstream consumer.
     - "BorelRegulators R.7 consumes …": BorelRegulators §8.5 builds its own minimal pre-Bloch interface. BorelRegulators R.3 was also cited as a supplier.
   - Both claims were removed. Ranks are now cited from ArithmeticKTheory §3.4, which imports Borel's theorem.
   - The README now states that every supplier precedes this roadmap and names the five consumer roadmaps.
2. **Citations by roadmap name and section.**
   - Every atlas stage id (U.1/U.3, T.1/T.2, H.1–H.6, K.2/K.7, L.1, N.3–N.8, R.3/R.7, M.4–M.8) was replaced by the supplier package's section. Four were wrong:
     - StableHomotopyKTheory §4.11 → §4.14 (block-sum H-space).
     - §1.27 (category homology) → §§1.30, 1.32 (group homology).
     - `plusGroup_fibreUCE` is in §3.30, not §3.33.
     - The external product is GeneralAlgebraicKTheory §7.4, with §1.8.
   - KTheoryLowDegrees was not the owner of stable GL/E. Its own README defers them to GeneralAlgebraicKTheory §§3.3–3.4. St(A) and its universal central extension come from AlgebraicKTheory A5 (TauCetiRoadmap PR #1142), as K2SymbolsBrauer states.
3. **Unmet supplier properties made targets.**
   - StableHomotopyKTheory §7.30 has the Atiyah–Hirzebruch spectral sequence (AHSS), but not its π^s_*-module structure or unit splitting; the contract said it supplied both.
   - StableHomotopyKTheory §6.3 has Barratt–Priddy–Quillen–Segal only for G=1.
   - §4.16 now owns `ahss_sphereModule`, `ahss_unitSplitting` and `barrattPriddy_freeGSets`, with locators Weibel IV Ex. 4.10.1 (PDF p.316) and VI proof of Prop. 5.17 (ch. p.33).
4. **Polylogarithms consumer contracts** (Polylogarithms README l.12, l.83, §4.2).
   - It consumes V.3 "`preBlochGroup`, the five-term class, `blochBoundary` with value x∧(1−x), and its rational strict-exterior comparison". All are present (§§3.1, 3.3–3.5, 3.8), under the name `preBloch`.
   - It consumes V.4 "the rational Suslin comparison". This was only implicit in §6.6; §4.20 now states it as `suslin_rational`.
   - It consumes V.4 "rigidity under purely transcendental extension in weight two", which it uses to identify explicit and rational-curve B₂. **This was missing** (and missing from the plan).
   - New §4.21 supplies it, as four targets:
     - `k3ind_rationalFunctionField`, for all fields: Weibel V.6.7.1 + K2SymbolsBrauer §10.5 + snake lemma.
     - `bloch_rationalFunctionField`, for infinite fields: Weibel VI Ex. 5.8, ch. p.35. §6.6 extends it to finite fields with \|F\|≥4.
     - `preBloch_rationalSpecialization`, with a collision-by-collision proof.
     - `rationalCurve_relations_eq`, using the R(tx,ty) family and Goncharov Prop. 1.22(a), p.225.
   - §3.12 now points to §4.21 for the P¹ case.
5. **Generality** (maintainer rule 2026-10-19).
   - §5.6's norm-one Cartan statement was restricted to odd q without need. It holds for every q≥4 with n odd and n\|q+1, since gcd(n,q−1)=1 and the torus injection is multiplication by q−1 up to a unit. I added the check q=4, n=5.
   - §5.8 gave exact order six of c only for ℝ and ℚ. Suslin Prop. 1.1 (p.220) states it for every formally real field. It is now stated so, with the proof for fields without a real embedding: real closure plus model completeness of real closed fields, since a five-term certificate of fixed length is existential with rational parameters.
6. **Suggested.lean.** Removed the declarations that tested only library objects or were weakened substitutes (2026-10-19 example rule):
   - the `Matrix.det` transposition example;
   - `rational_quotient_kernel`, `rational_quotient_nonsplit`, `finite_lift_nonsplit` (ZMod arithmetic);
   - `nonflat_kernel_control`;
   - `blochBoundary_valuation_sign` (a padicValRat number);
   - the Habiro-application section `finiteCoefficientBlochEquiv*`.

   Also:
   - Generalised `cyclic_seven_power_two` to `cyclicHomology_power_map`, for every m, a and odd degree 2j−1, matching README `cyclicHomology_maps`.
   - Added a short closing comment listing the README-only carriers.
   - The README Checks keep the numeric facts in prose.
7. **Process residue removed:**
   - "upstream PR #1212 at 67c1f58…", "the atlas's earlier K.7 interface", "continuation", "No numeric tier is assigned …", "remains unverified", "checked by computer".
   - Bloch's monograph is now named only for the convention, with no theorem used.
   - A broken paragraph join in §4.15 was fixed.

## Source check (public copies; the K-book's combined-PDF page numbers checked against the 29 Aug 2013 combined file)

| README place | Source and location | Result |
| --- | --- | --- |
| §3.4–3.5 | Weibel VI Def. 5.1, ch. p.23 = PDF p.495 | ✓ presentation, [1]=0, exact sequence |
| §3.6 | Weibel VI Lemma 5.4, ch. p.24 | ✓; (c)'s target B(F) is a misprint for P(F), as the README says |
| §4.20 | Weibel VI Thm 5.2, PDF p.495 | ✓ infinite fields |
| §2.5, §5.7 | Weibel VI Cor. 5.3, ch. p.24 | ✓ ambient structures, now via ArithmeticKTheory §§5.3–5.4 |
| §4.12 | Weibel VI Thm 5.7, PDF p.498 | ✓; the printed "H₂(GL₂)=F^×" and Δ={(a,a⁻¹)} are misprints, corrected in the README |
| §4.13 | Weibel VI Def. 5.9, ch. p.27 | the printed N=Σ(−1)ⁱtⁱ is not a chain map for n≥2 (computed); README's Σ((−1)ⁿt)ⁱ is |
| §4.14 | Weibel VI Prop. 5.12 and ψ′, ch. p.29 | ψ′(P)=−2c with the README's cone: Σᵢψ′(tⁱ[a;x])=2c verified for all 72 pairs over 𝔽₁₁ and 110 over 𝔽₁₃ |
| §4.15 | Weibel VI Ex. 5.5, ch. p.35 | printed (ii) fails; README's (ii) and (i) hold over 𝔽₄…𝔽₁₃ and under ρ over ℝ |
| §4.16 | Weibel VI Prop. 5.17 and proof, ch. p.33 | ✓; uses the module structure and Barratt–Priddy now owned in §4.16 |
| §2.2 | Weibel VI Prop. 4.3.2, ch. p.18 | ✓ |
| §4.5 | Hutchinson arXiv:1107.0264v2 Thm 2.9, pp.9–10 | ✓ relations (i)–(v), action, \|F\|≥10 |
| §5.2 | Hutchinson Lemma 3.14, p.17 | ✓ k=3 exceptions {2,3,4,5,8,9,27} |
| §3.13 | CGZ arXiv v3 Def. 1.1, p.2 | ✓; C(F)⊆A(F) fails as printed (ξ₂,₁) |
| §§3.14–3.16 | CGZ 2023 Def. 2.1 and Lemma 2.2, p.391 | ✓ |
| §3.12 | Goncharov 1995 Lemma 1.16 p.221, Cor. 1.19 p.224, Conj. 1.20 and Prop. 1.22 p.225 | ✓ |
| §5.8 | Suslin 1991 Lemmas 1.4–1.6 p.219, Prop. 1.1 p.220 | ✓; ρ formulas agree with ψ there |
| §6.7 | Hutchinson arXiv:2104.14413v4 Thm 2.10, p.4 (= Levine Thm 4.12) | ✓ any field, n prime to char |
| §4.21 | Weibel V Thm 6.7 / Cor. 6.7.1, PDF pp.418–419; VI Ex. 5.8, ch. p.35 | ✓ |
| §3.6–3.7 | Weibel VI Ex. 5.3, ch. p.35 | B(𝔽₇) claim ✓, but "c=[4]" is a misprint: c=2[4]≠[4] (computed); the README already has c=2[4] |

Scanned papers (Suslin 1991, Goncharov 1995) were rendered and read page by page.

## Adversarial pass (changed or added statements, plus recomputed Checks)

| Statement | Instances | Result |
| --- | --- | --- |
| Pre-Bloch/Bloch groups (§§3.4–3.7) | Smith normal forms for 𝔽₂…𝔽₁₃ | P=0, ℤ, ℤ/5, ℤ/6, ℤ/8, ℤ/9, ℤ/10, ℤ/12, ℤ/14 and B=0, ℤ, ℤ/5, ℤ/3, ℤ/4, ℤ/9, ℤ/5, ℤ/6, ℤ/7, as stated |
| c and ⟨x⟩ (§3.6) | q=4…13 | c independent of x; 3c=⟨−1⟩; 2⟨x⟩=0; h a homomorphism; ord c = 1, 3, 2, 3, 1, 6, 1 |
| CGZ groups (§§3.13–3.16) | q=2, 3, 4, 5, 7, 11 | B_old=ℤ/3, ℤ/2, ℤ/5, ℤ/3, ℤ/4, ℤ/6; B_new=ℤ/3, 0, ℤ/5, ℤ/3, ℤ/2, ℤ/3; [0] orders as stated |
| Real Rogers ρ (§5.8) | 20,000 random admissible real pairs | five-term residue mod π² below 4·10⁻¹⁵; ρ[1/2], ρ[2], ρ[−1], ρ(c) = −1/12, 1/12, −1/4, −1/6 (units π²) |
| Formally real generalisation | ℚ, ℝ, non-archimedean real closures | upper bound 6c=0 from §3.6; lower bound by naturality or transfer; the q≤3 exceptions do not arise |
| Configuration complexes (§§4.9, 4.13) | \|X\|=2, 3, 4 | H₁=ℤ for \|X\|=2; ℤ, 0, ℤ² for \|X\|=3; acyclic-complex top ranks 3 and 8 |
| Norm-one Cartan (§5.6), all parities | q=4, n=5; q=5, 11 with n=3; q=7, n=3 excluded | ℤ/5 throughout at q=4; gcd(3,6)=3 fails, as stated |
| Rigidity (§4.21) | F finite or infinite; F₃ | K₃^ind rigidity holds for all F; B-rigidity for infinite F and \|F\|≥4; over 𝔽₃ the curve kernel is ℚ (§3.12), so no infinite-field assertion is extended there |
| Rational specialization (§4.21) | no, one pair, two pairs, a 3-cluster, a 4-cluster, interleaved positions | sign of the induced S₃ permutation cancels pairs; 0/0 faces become rescaled five-term elements |
| R(tx,ty) family | x=2, y=3 | t=1 gives R(2,3); t=0 gives arguments 0, 0, y/x, y/x, 1, hence [1] |
| `cyclicHomology_power_map` | m=1; a=0; m=7, a=2, j=2 | trivial group; zero map for j≥1; ×4 |
| §6.7 after the cut | ℚ, n=5 | {2,−31}∈K₂(ℚ)[5], with tame residue 2 of order 5 mod 31, so K₃(ℚ;ℤ/5)≠0=K₃(ℚ)/5 |

## Lean

`lean-check research/blueprint/packages/K3BlochGroups/Suggested.lean`:
- Exit 0 at Mathlib `082e2d37e8` in the pinned Tau Ceti build.
- 16 warnings, all "declaration uses `sorry`", on theorem statements only.
- 23 proved examples; no `set_option`, `#eval`, `#print` or `lemma`; single `import Mathlib`; no sorry'd data.
- 398 lines (was 453).

Spot-checked signatures against the README: `eval3_eq_iff_certificate`, `eval3_surjective`, `bar_four_identity_boundary`, `bar_noncycle`, `fiveTermRaw_oneSub`, `rankTwoFaceMatrices_det`, `finite_sl2_localized_homology`, `cyclicHomology_power_map`, `rootCoefficient_denominator_independent`, `SuslinLift.unique_difference`, `BarLiftCertificate.trivial_boundary`. They match, and none is vacuous.

The gate's `mech_check.py` reports:
- 0 round-named labels (was 1: "continuation");
- 0 empty sections;
- the same README-only API names as before.

## Other checks

- `intake.py check-files` on the four deliverables: 0 problems.
- `git diff --check`: clean.
- metadata.toml is `topic = "math.KT"`.
- No Tate's-thesis theorem; no packet, supplier or upstream file was changed.

**Size.** The README is 259 KB. That is above the 200 KB figure in the job template, but within PACKAGE_REVIEW's 2026-10-12 shape rule, which overrides older size notes. Many accepted packages are 400–1,700 KB. Nothing was cut to reduce size.

## For the maintainer (outside this job's files)

1. **Packets to repoint.**
   - `K3BlochGroups--V.6` node `finite-coefficient-identification` still cites HabiroNumberFields HB.1–HB.2; its Φ_ζ composite now belongs to HabiroNumberFields.
   - `K3BlochGroups--V.3` node `goncharov-curve-boundary` imports the specialization formula "from Polylogarithms:P.4"; the package owns it (§3.12).
   - The new §4.21 targets and the owned supplements (§§1.5, 2.2, 4.5, 4.15, 4.16, 5.2) have no packet nodes.
2. **Stale cycle edges in other packets.**
   - `BorelRegulators.json` R.7 nodes list K3BlochGroups V.3/V.4 as prerequisites, though the README does not.
   - `ArithmeticKTheory--N.7.json` N.8 nodes say K₃(ℤ)≅ℤ/48 is "imported" from K3BlochGroups V.5, contradicting the AKT README (§§5.4, 8.10).
3. **Duplication.** BorelRegulators §8.5 plans a "minimal" pre-Bloch group, boundary and B(F) for infinite characteristic-zero fields, which is a special case of §§3.1–3.5 here. Since BorelRegulators precedes this roadmap, one of the two should own it.
4. **Polylogarithms.**
   - It calls the pre-Bloch group `preBlochGroup`; the name here is `preBloch`.
   - Its §2.1 Check says a primitive sixth root w "need not have [w] in the strict-exterior Bloch kernel". In the exterior square ∂[w]=w∧w⁻¹=0, so [w] is in that kernel; it fails only in the antisymmetric-tensor kernel B.
5. **Owner ambiguity upstream.**
   - Stable GL/E is claimed by GeneralAlgebraicKTheory §§3.3–3.4, AlgebraicKTheory A1 (PR #1142) and StableHomotopyKTheory §4.14.
   - St/K₂ is claimed by AlgebraicKTheory A5, while KTheoryLowDegrees' README says K2SymbolsBrauer owns it.
   - The README here follows K2SymbolsBrauer's own contract.
6. **Errata candidates** (for an errata job):
   - Weibel VI Ex. 5.3: c=[4] in B(𝔽₇) should be c=2[4].
   - Already handled in the README: Weibel VI Lemma 5.4(c), Thm 5.7, Def. 5.9, Prop. 5.12's ψ′(P), Ex. 5.5; CGZ v3 Def. 1.1.

No suspicious instructions were found in issue comments, other packages or fetched sources.
