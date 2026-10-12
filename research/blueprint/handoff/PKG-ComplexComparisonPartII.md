# PKG-ComplexComparisonPartII — roadmap package

Issue [#8889](https://github.com/CBirkbeck/tauceti-explorer/issues/8889). Agent: Claude (Opus 5.5), session
**claude-AxboDs**, branch **claude-AxboDs-pkg-complexcomparisonpartii**. The bot confirmed the claim on
2026-10-12. This submission is the complete package job. It is not a checkpoint. No second job was taken.

## Deliverables

- `research/blueprint/packages/ComplexComparisonPartII/README.md`
  - About 146 KB and 1,900 lines, in the 2026-10-12 shape: an opening **Summary**, then *Scope and ownership*, *Conventions*, *Exact supplier contracts* and *How to read the build*.
  - Layers C0–C5 follow. Every target has its exact hypotheses, a source locator and its *Needs*. Every definition has its API and at least three **Checks**. Each layer ends with *Examples* and *Dependencies*.
  - The package closes with *Worked examples* (anchor `c6`, which absorbs the former acceptance stage C6), *Downstream consumers* and *References*.
  - Layer names are the stage ids C0–C5, so that consumer citations such as `ComplexComparisonPartII:C4` still resolve.
- `research/blueprint/packages/ComplexComparisonPartII/Suggested.lean`
  - 485 lines, with `import Mathlib` plus five pinned Tau Ceti modules. It contains:
    - `#check` pins of the consumed library declarations;
    - real-bodied light definitions: `ringSheaf`, `CoherentAnalyticModule`, `dbar`, `cauchyGreen`, `commutatorWith`, `IsDifferentialOperator`, `AlgebraicConnection`, `IsLogStructure`, `standardLogPoint`, `IsFineMonoid`, `IsSaturatedSubmonoid`, `logDifferentialRelations`, `LogDifferentials`, `residueStripRep`, `localMonodromy`, `hodgeLaplacianFun`;
    - theorems statable at the pins: `localDolbeault_oneVariable`, `montelTheorem`, `schwartzFiniteness_banach`, `nagataCompactification`, `puncturedRiemannSurfaceConnected`, `AlgebraicConnection.exists_trivial`, `residueStripRep_mem`, `localMonodromy_add_int`, `det_le_det_of_posSemidef`, `fubiniStudy_integral_eq_one`;
    - discriminating `example`s and negative controls that fix every sign the README pins: `∂̄z̄ = 1`, `∮dz/z = 2πi`, `Δ_Hodge(x₁²) = −2`, `exp(−2πia)`, the residue strip, the standard log point, and `⟨2,3⟩ ⊆ ℤ` being fine but unsaturated.
  - It has no sorry'd data, no `True` placeholders and no `Prop := sorry`. A closing comment lists, grouped by missing carrier, every README target that cannot be typed at the pins.
- `research/blueprint/packages/ComplexComparisonPartII/metadata.toml`: `topic = "math.AG"`.

## Validation

- `lean-check research/blueprint/packages/ComplexComparisonPartII/Suggested.lean`
  - Result: exit 0, with **33 `sorry` warnings and no other warnings or errors**.
  - Build: the shared pinned build (Mathlib 082e2d37e8, Tau Ceti f790474).
  - Free memory was about 105 GB, and only one check ran at a time.
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.
- There are no local paths and no process vocabulary in the package. I grepped for packet, review, job, atlas, gap and similar words.
- Coverage: every README `Prove`/`Define` paragraph names its prerequisites. Every one of the 97 plan nodes maps to a README target or to a cited owner (table below).

## Removed as duplicates (cited instead)

The fix job FIX-PKG-AlgebraicModuliForArithmeticGeometry~adv moved the complex local analytic algebra, analytic spaces, analytification and proper GAGA down into **AlgebraicModuliForArithmeticGeometry** (tier 4, package accepted), Layer 7 §§7.10.1 and 7.10.3. That handoff says "ComplexComparisonPartII consumes these outputs".

I therefore removed 18 plan nodes and cited them instead. The 7 C0 removals are `repair-analytification`, `convergent-germs`, `weierstrass-division`, `weierstrass-preparation`, `noetherian-germs`, `oka-coherence` and `repair-local-faithful-flatness`. The other 11 are the projective GAGA nodes of C2 (5) and the proper GAGA nodes of C3 (6, including `proper-algebraic-space-gaga`). Two further changes:
- `repair-exact-faithful-pullback` keeps only faithfulness. Exactness is AlgebraicModuli's `coherentPullbackExact`.
- Projective GAGA is the projective case of AlgebraicModuli's `properSchemeGagaPushforward` and `properSchemeGagaEquivalence`. The proper Ext comparison is part of `properSchemeGagaEquivalence`.

I also checked TauCetiRoadmap main and Tau Ceti a91d3aaf. They have:
- no GAGA, Dolbeault, Stein, log, regular-singular or Hodge-star material;
- `TauCeti.holomorphicSheaf` in one variable only;
- DifferentialGeometry over ℝ only.

So nothing else was removed.

## Added to close supplier gaps (no nonexistent "Part II" roadmaps are cited)

The plan pointed several proof inputs at roadmaps that do not exist: DifferentialGeometry/PDE/OperatorTheory Part II, SF.2 extensions, and the open PR196 and PR279. The package plans them here as targets instead, with public sources:

| Target | Replaces | Source |
| --- | --- | --- |
| `ChernConnection` | Hermitian Chern-connection request | Demailly V.10.3 p.267, V.12.1–12.2 pp.268–269 |
| `StronglyOneComplete` | Stein-recognition gap | Demailly I.6.13–6.18 pp.49–51, IX.2.5/2.7 p.410 |
| `cartanTheoremB` restated | Stein version | Demailly IX.4.1 p.419, IX.4.10–4.13 pp.425–428 |
| `montelTheorem` | Montel request | Demailly I.3.12 p.23 |
| `schwartzFiniteness` | OperatorTheory Part II request | Demailly IX.1.8–1.9 p.406 |
| `nagataCompactification` | SF.2 compactification request | Conrad 2007, Theorem 4.1, author PDF p.28 (sha256 7677caec…) |
| `ehresmannFibration` | DifferentialGeometry Part II request | tom Dieck, *Differential Manifolds*, Cor. 2.2.4 p.53 (sha256 4f12bff4…) |
| `compactEllipticHodge` | "PDE Part II" import | Demailly VI.1.6, VI.2.2–2.4 pp.288–291 |
| `DQCohSpace`, `pseudoCoherenceDetection` | SF.2 algebraic-space requests | Hall §4 pp.10–11, Theorem 3.8 p.8, Proposition 4.1 p.10 |

`HodgeStar`, `HodgeLaplacian` and `kaehlerIdentities` moved from C5 to C1.2. In the plan, C1's `bochner-kodaira` used Kähler identities planned in C5, a forward reference.

Other changes:
- The holomorphic-bundle dictionary uses Mathlib's holomorphic vector bundles (`ContMDiffVectorBundle ω` over `𝓘(ℂ, E)`) instead of the open PR279 carrier.
- `GaussManin` gets local freeness of `H_dR(X/S)` from the existence of a connection, not from a later layer.
- `logChartCriterion` keeps Kato's étale condition, as in the plan.

## Plan points for the maintainer

1. **AlgebraicModuliForArithmeticGeometry depends on this roadmap.** Its §7.10.3 proper GAGA proof uses three things this roadmap plans:
   - the coherent analytic module category (C0.1) and the exchange map θ (C0.5), which its statements presuppose;
   - "projective GAGA over a polydisc", whose analytic inputs are C1 (Cartan B on polydiscs, twist cohomology, Cartan–Serre finiteness, Serre's analytic theorems);
   - none of these are planned there.

   Its §7.4 also still says "complex coherent GAGA is a downstream C3 target", which contradicts §7.10.3. I recommend either bundling the two roadmaps or moving C0.1, C0.5 and C1 down into AlgebraicModuli. The package itself cites only lower tiers and Tau Ceti.
2. **Consumers that cite `ComplexComparisonPartII:C2` or `C3` for GAGA itself** should be pointed at AlgebraicModuli §7.10.3. These are AutomorphicBundles, AlgebraicModularFormsAndSerreWeights, HodgeStructuresPartII H.1/H.3/H.6, InverseGalois and ShimuraVarieties V0. C2 and C3 here now hold the base-change and dictionary consequences, descent on algebraic spaces, and derived GAGA.
3. **`fibreDimensionLoci` (C0.6) has no cleared proof source.** Its statement is sourced (Peterzil–Starchenko Lemma 8.2, Theorem 7.2), but they quote Whitney, *Complex Analytic Varieties*, Theorem 9F p.240, which is not freely available or cleared, and it was not read. Remmert's theorem does not need it: Demailly's proof uses only semicontinuity, II.8.2–8.6. Only the `B_k` corollary does.
4. `affineCurveConnectedness` is the one-dimensional case of SGA 1 XII Proposition 2.4 (printed p.243), which holds for every scheme locally of finite type over ℂ. The package keeps the planned curve target and cites 2.4; a later revision could promote the general statement.

## Sources checked in this job

These locators were re-read in public copies.
- **Demailly** (sha256 d7c7654a…, matching the plan's copy). Every new locator above was read, and the plan's C0/C1/C5 locators were spot-checked; all are on the stated pages within one page.
- **SGA 1 XII** (arXiv math/0206203v2): §1 pp.239–241, Proposition 2.4/Lemma 2.5 pp.243–244, §4.2–4.6 pp.248–251.
- **Hall**, *GAGA theorems* (author version): §4, Theorems 3.8, 8.1 and 9.1, Lemmas 5.5 and 7.4.
- **Conrad 2007** and **tom Dieck**.

These were not re-verified and are carried from the reviewed plan: Serre GAGA, Serre's exposés 18–19, Grothendieck 1966, Deligne 1968/1970 (with erratum), Katz–Oda, Kato, Sella, Qian, DGH, BKT, CS17 and PS08. Downloads were kept in scratch only.

## Plan node → package map

| Plan node | In the package |
| --- | --- |
| `C0/repair-analytification` | cited: AlgebraicModuliForArithmeticGeometry §7.10.1 `complexSchemeAnalytification` (and §7.10.3 `complexSpaceAnalytification`) |
| `C0/convergent-germs` | cited: AlgebraicModuliForArithmeticGeometry §7.10.1 `ConvergentGerm`, `HolomorphicStructureSheaf` |
| `C0/weierstrass-division` | cited: AlgebraicModuliForArithmeticGeometry §7.10.1 `convergentWeierstrassDivision` |
| `C0/weierstrass-preparation` | cited: AlgebraicModuliForArithmeticGeometry §7.10.1 `convergentWeierstrassPreparation` |
| `C0/noetherian-germs` | cited: AlgebraicModuliForArithmeticGeometry §7.10.1 `convergentGerm_noetherian` |
| `C0/oka-coherence` | cited: AlgebraicModuliForArithmeticGeometry §7.10.1 `ComplexAnalyticSpace.coherentStructure` |
| `C0/coherent-analytic-module` | C0.1 `CoherentAnalyticModule` |
| `C0/coherent-operations` | C0.1 `coherentOperations` |
| `C0/coherent-analytic-ideal` | C0.2 `CoherentAnalyticIdeal` |
| `C0/holomorphic-bundle-dictionary` | C0.3 `holomorphicBundleDictionary` (carrier: Mathlib holomorphic vector bundles instead of the open PR279 carrier) |
| `C0/repair-local-faithful-flatness` | cited: AlgebraicModuliForArithmeticGeometry §7.10.3 `completedAnalyticStalkComparison` (`flat`, `completionIso`) + Mathlib `Module.FaithfullyFlat.of_flat_of_isLocalHom` |
| `C0/repair-coherent-pullback` | C0.4 `CoherentAnalytification` |
| `C0/repair-exact-faithful-pullback` | C0.4 `coherentAnalytification_faithful` (exactness cited: `completedAnalyticStalkComparison.coherentPullbackExact`) |
| `C0/coherent-pullback-operations` | C0.4 `coherentPullbackOperations` |
| `C0/fiber-dimension-loci` | C0.6 `fibreDimensionLoci` |
| `C1/local-dolbeault` | C1.1 `localDolbeault` (Lean: `localDolbeault_oneVariable`, `dbar`, `cauchyGreen`) |
| `C1/weighted-dolbeault-estimate` | C1.4 `weightedDolbeaultEstimate` |
| `C1/stein-coherent-acyclicity` | C1.5 `cartanTheoremB` (for strongly 1-complete spaces, with new `StronglyOneComplete`) |
| `C1/acyclic-projective-cover` | C1.7 `projectiveLerayCover` |
| `C1/analytic-twisting-sheaf` | C1.7 `AnalyticTwist` |
| `C1/twist-cohomology` | C1.7 `analyticTwistCohomology` |
| `C1/compact-coherent-finiteness` | C1.6 `cartanSerreFiniteness` (with new `montelTheorem`, `schwartzFiniteness`) |
| `C1/analytic-serre-generation` | C1.8 `analyticSerreGeneration` |
| `C1/analytic-serre-vanishing` | C1.8 `analyticSerreVanishing` |
| `C1/twist-presentations` | C1.8 `twistPresentations` |
| `C3/repair-higher-image-comparison-map` | C0.5 `HigherImageComparison` |
| `C2/projective-cohomology` | cited: AlgebraicModuliForArithmeticGeometry §7.10.3 `properSchemeGagaPushforward` (projective case) |
| `C2/projective-full-faithfulness` | cited: AlgebraicModuliForArithmeticGeometry §7.10.3 `properSchemeGagaEquivalence` (projective case) |
| `C2/projective-essential-surjectivity` | cited: AlgebraicModuliForArithmeticGeometry §7.10.3 `properSchemeGagaEquivalence` (projective case) |
| `C2/projective-gaga-equivalence` | cited: AlgebraicModuliForArithmeticGeometry §7.10.3 `properSchemeGagaEquivalence` (projective case) |
| `C2/relative-projective-comparison` | cited: AlgebraicModuliForArithmeticGeometry §7.10.3 `properSchemeGagaPushforward` (projective case, nonproper base allowed there) |
| `C2/gaga-base-change` | C2.1 `gagaBaseChange` (stated for proper f) |
| `C2/projective-geometric-dictionaries` | C2.2 `projectiveGeometricDictionaries` (stated for proper X) |
| `C3/repair-relative-proper-gaga` | cited: AlgebraicModuliForArithmeticGeometry §7.10.3 `properSchemeGagaPushforward` |
| `C3/repair-proper-coherent-full-faithfulness` | cited: AlgebraicModuliForArithmeticGeometry §7.10.3 `properSchemeGagaEquivalence` |
| `C3/proper-coherent-ext-comparison` | cited: AlgebraicModuliForArithmeticGeometry §7.10.3 `properSchemeGagaEquivalence` (every global Ext group) |
| `C3/repair-proper-coherent-essential-surjectivity` | cited: AlgebraicModuliForArithmeticGeometry §7.10.3 `properSchemeGagaEquivalence` |
| `C3/proper-gaga-equivalence` | cited: AlgebraicModuliForArithmeticGeometry §7.10.3 `properSchemeGagaEquivalence` |
| `C3/analytic-etale-descent` | C3.1 `analyticEtaleDescent` (+ `SpaceCoherentAnalytification` with Checks) |
| `C3/closed-point-reconstruction` | C3.3 `derivedGagaProperSpace` (Hall Thm 9.1), with new C3.2 `DQCohSpace` and `pseudoCoherenceDetection` replacing the SF.2 requests |
| `C3/proper-algebraic-space-gaga` | cited: AlgebraicModuliForArithmeticGeometry §7.10.3 `properSpaceComplexGaga` |
| `C4/remmert-proper-image` | C4.1 `remmertProperImage` |
| `C4/remmert-stein-extension` | C4.1 `remmertSteinExtension` |
| `C4/nonreduced-projective-chow` | C4.2 `projectiveChowNonreduced` |
| `C4/proper-support-algebraization` | C4.3 `properSupportAlgebraization` (with new `nagataCompactification`, replacing the SF.2 request) |
| `C4/repair-proper-morphism-algebraicity` | C4.4 `properSourceMorphismAlgebraicity` |
| `C4/algebraic-graph-regular` | C4.4 `algebraicGraphRegular` |
| `C4/family-morphism-interface` | C4.4 `familyMorphismInterface` |
| `C4/repair-affine-curve-completion-interface` | C4.5 `affineCurveCompletionInterface` |
| `C4/punctured-riemann-connected` | C4.5 `puncturedRiemannSurfaceConnected` (Lean theorem) |
| `C4/affine-curve-connectedness` | C4.5 `affineCurveConnectedness` |
| `C5/algebraic-de-rham-complex` | C5.1 `AlgebraicDeRham` |
| `C5/holomorphic-de-rham-complex` | C5.1 `HolomorphicDeRham` |
| `C5/holomorphic-poincare` | C5.1 `holomorphicPoincare` |
| `C5/differential-operator-analytification` | C5.1 `IsDifferentialOperator`, `DifferentialOperatorAnalytification` |
| `C5/bounded-operator-hypergaga` | C5.1 `boundedOperatorHyperGaga` |
| `C5/small-singular-cochain-sheaf` | C5.1 `SmallSingularCochains` |
| `C5/repair-sheaf-singular-comparison` | C5.1 `sheafSingularComparison` |
| `C5/repair-proper-de-rham-betti` | C5.1 `properDeRhamBetti` |
| `C5/multiplicative-period-interface` | C5.1 `multiplicativePeriodInterface` |
| `C5/relative-poincare` | C5.2 `relativePoincare` |
| `C5/relative-betti-local-system` | C5.2 `relativeBettiLocalSystem` (with new `ehresmannFibration`) |
| `C5/gauss-manin-connection` | C5.2 `GaussManin` |
| `C5/relative-de-rham-betti` | C5.2 `relativeDeRhamBetti` |
| `C5/relative-hodge-bundles` | C5.3 `relativeHodgeBundles` |
| `C5/hodge-star` | C1.2 `HodgeStar` (moved from C5: needed by C1.3) |
| `C5/hodge-laplacian` | C1.2 `HodgeLaplacian` (moved from C5) |
| `C5/compact-elliptic-hodge` | C5.3 `compactEllipticHodge` (own target; no PDE PartII) |
| `C5/harmonic-projection-green` | C5.3 `HarmonicGreen` |
| `C5/kaehler-identities` | C1.2 `kaehlerIdentities` (moved from C5) |
| `C5/kaehler-hodge-decomposition` | C5.3 `kaehlerHodgeDecomposition` |
| `C5/proper-pure-hodge` | C5.3 `properPureHodge` |
| `C5/analytic-cycle-integration` | C5.4 `AnalyticCycleIntegration` |
| `C5/semipositive-wedge` | C5.4 `semipositiveWedge` (Lean: `det_le_det_of_posSemidef`) |
| `C5/chern-fubini-study-intersection` | C5.4 `chernFubiniStudyIntersection` (Lean: `fubiniStudy_integral_eq_one`) |
| `C5/dgh-integration-application` | C5.4 `dghIntegrationApplication` |
| `C5/algebraic-connection` | C5.2 `AlgebraicConnection` (Lean structure) |
| `C5/regular-singular-connection` | C5.6 `RegularSingular` |
| `C5/canonical-logarithmic-extension` | C5.6 `CanonicalLogExtension` (Lean: `residueStripRep`, `localMonodromy`) |
| `C5/deligne-regular-singular-equivalence` | C5.6 `deligneRiemannHilbert` |
| `C5/regular-singular-de-rham-comparison` | C5.6 `regularSingularDeRhamComparison` |
| `C5/curve-log-complex` | C5.7 `CurveLogComplex` |
| `C5/curve-residue-localization` | C5.7 `curveResidueLocalization` |
| `C5/prelog-structure` | C5.5 `PrelogStructure` |
| `C5/log-structure` | C5.5 `LogStructure` (Lean chart form: `IsLogStructure`, `standardLogPoint`) |
| `C5/associated-log-structure` | C5.5 `AssociatedLog` |
| `C5/log-pullback` | C5.5 `LogPullback` |
| `C5/fine-log-chart` | C5.5 `FineLogChart` (Lean: `IsFineMonoid`, `IsSaturatedSubmonoid`) |
| `C5/divisorial-log-structure` | C5.5 `DivisorialLog` |
| `C5/log-differentials` | C5.5 `LogDifferentials` (Lean chart form) |
| `C5/log-smoothness` | C5.5 `LogSmooth` |
| `C5/log-chart-criterion` | C5.5 `logChartCriterion` |
| `C5/log-de-rham-complex` | C5.5 `LogDeRham` |
| `C5/log-differential-transitivity-split` | C5.5 `logDifferentialTransitivitySplit` |
| `C5/proper-log-gaga-monodromy` | C5.7 `properLogGagaMonodromy` |
| `C1/bochner-kodaira` | C1.3 `bochnerKodaira` (with new `ChernConnection`) |
| `C5/closed-current-extension` | C5.4 `closedCurrentExtension` |
