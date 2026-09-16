# LINK-tauceti_TauCetiRoadmap_EllipticCurves: handoff

**Status:** `complete`. The whole catalogue has been screened, and `python3 scripts/check_links.py` reports 0 errors and 0 warnings.
**Output:** `research/blueprint/links/tauceti_TauCetiRoadmap_EllipticCurves.json`, with 67 links (36 explicit, 31 inferred), 10 overlaps (5 rescope, 5 keep, none merge) and 218 examined entries: the focal roadmap and the 217 others.
No other repository file was touched, and git was not run. There was no earlier checkpoint for this job.

## Inputs

- **Atlas.** `data/atlas.json`, edition `2026-09-15-comprehensive-roadmap-revision`. Its sha256 is in the packet's `provenance`.
- **Focal document.** `content/tau-ceti/EllipticCurves/README.md`, sha256 `7df03806…eb6d14d0`.
- **Atlas records.** The atlas has no stage-level edges for the focal roadmap. It has one roadmap edge, to WeilConjectures, and the stage edge `UPSTREAM:EllipticCurves → WeilConjectures:WC.5`. The `external` registry lists `UPSTREAM:EllipticCurves` (consumer WC.5), `UPSTREAM:EllipticCurves Layers 4–7` (RankZeroOneBSD, HeegnerPointEulerSystems) and `Layers 6–7` (GrossZagier). The integration owner of all three is FoundationsAndLibraryIntegration LI.4.
- **New roadmaps.** All six files in `research/blueprint/roadmaps/`.
- **Other link packets.** Only AlgebraicCurves and ModularCurves record pairs touching this roadmap; none of them is repeated here.
  - AlgebraicCurves: 7 links and 2 overlaps. The links are AlgebraicCurves Layers 0, 2, 3 and 6 → Layer 0; Layer 0 → AlgebraicCurves Layer 10; and Layer 1 → AlgebraicCurves Layers 9 and 12. The overlaps are with AlgebraicCurves Layers 10 and 9.
  - ModularCurves: 3 links and 3 overlaps. The links are Layer 1 → 2A, Layer 2 → 2E and Layer 1 → Layer 10. The overlaps are with 7E, 7C and Layer 10.
- **Library.** One declaration was read at the baseline Mathlib pin: `WeierstrassCurve.localPolynomial` in `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean`. Its Euler factors come from `Nat.card` of reduced points, so L-function consumers such as EllipticRegulators ER.5 use Mathlib's factors, not Layer 3's.

## Read scope

- **Focal roadmap.** The full document and all 12 stage descriptions were read. The inputs and outputs of each layer are in the job's scratch notes; a condensed version is below.
- **Read in full, or every stage.** RankZeroOneBSD; GrossZagierAndArithmeticHeights; HeegnerPointEulerSystems; EllipticCurveModularity; ArithmeticGaloisRepresentations; NeronModelsAndSemistableAbelianVarieties; EllipticKTheory; EllipticRegulators; WeilConjectures; FoundationsAndLibraryIntegration; ModularCurvesPartII; ArithmeticGaloisDuality; SelmerIwasawaCohomology; EulerSystemsAndKolyvaginSystems; FaltingsFinitenessAndIsogenyTheorems; ComplexMultiplicationAndExplicitReciprocity; HeightsRationalPointsAndObstructions; EffectiveDiophantineMethods; ArithmeticStatistics; ComputationalNumberTheory; PeriodsAndSpecialValues; FiniteFieldsAndCharacterSums; GlobalNumberFields (all 12 stage descriptions).
- **Targeted full-stage reads.**
  - ProfiniteCohomology: scope, boundaries, conventions, export table, and Layers 0, 1, 2, 4, 5 and 9.
  - ClassFieldTheory: Layers 5 and 10.
  - NumberFieldArithmetic: Layers 5 and 6.
  - LocalFieldsRamification: scope and Layer 0.
  - StableReduction: inventory, and Layers 5 and 6.
  - ModularCurves: every stage citing EllipticCurves, including 2A in full.
  - AlgebraicCurves: every stage citing EllipticCurves.
  - PadicHodgeTheory: R06.6.
  - DeligneWeightsAndPurity: DWP.1.
  - ModularIwasawaMainConjectures: L3.
- **Screened.** Every other roadmap had its summary and keyword-in-context extracts read, and any matching stage was read in full. The screen covered this roadmap's objects: Weierstrass curves, isogenies, Weil pairing, Tate module, Hasse, point counts and Frobenius trace, ordinary/supersingular, reduction types, Tate's algorithm and Kodaira symbols, conductors, Tate curve, minimal models and discriminants, semistability, twists, Mordell–Weil, heights, Selmer, Sha, BSD, Nagell–Lutz, Frey, Szpiro, abc and integral points. It also covered the roadmap's declaration names, and its inputs: places and completions, nonabelian and continuous cohomology, Kummer theory, duality, orders, S-units, Hermite–Minkowski and finite approximation.
- **Meaning of "none".** In each `examined` note, "none" means no edge was found within the recorded scope. False-positive hits are explained in the notes, for example Hasse invariants, isogenies of algebraic groups and A∞ minimal models.

## Focal stages: inputs and outputs (condensed)

- **L0.** Places of `W.FunctionField` (the infinity place, affine places as maximal ideals), `inducedPlace` with e, f and Σ e·f, the point–place dictionary, divisors and `div f`, `toClass_surjective`, and the principal-divisor criterion without Riemann–Roch.
- **L0.5.** Base change, Galois actions on points, functions, places and isogenies, translations, the fixed-field theorem, and descent from Kˢᵉᵖ to K.
- **L1.** The `Isogeny` type (coordinate-ring pullback with `MapsInfinity`), degree and separability, `toPointHom`, `[n]` with deg = n², Frobenius and relative Frobenius, Verschiebung, the Hom group and degree form, End/Aut and CM predicates, End(E) as an order in ℚ(π_q), the factorisation theorem, Vélu quotients, the dual, `[n]` surjectivity, the invariant differential, separable ⟹ unramified, and the formal group in four milestones.
- **L2.** E[N] ≃+ (ZMod N)², the Weil pairing by divisors, T_ℓE, the ℓ-adic pairing, and det = cyclotomic character.
- **L3.** Finiteness, `pointCount` and `frobeniusTrace`, supersingular/ordinary with base-change invariance, the Hasse bound, and the zeta function with its recurrence, rationality, functional equation and RH.
- **L4.**
  - Discrete strand: potential good reduction, the local minimal discriminant, good ordinary and supersingular reduction, the reduction map and E₀ ⊇ E₁, Ê(𝔪) ≅ E₁, Néron–Ogg–Shafarevich, and Tate's algorithm with `ReductionSymbol`, the Ogg exponent and c_p.
  - Analytic strand: the Tate curve with its ℤ⟦q⟧ coefficients and L^×/q^ℤ ≅ E_q(L).
- **L4.5a.** Localisation instances; global, semi-global and sharp minimality; the minimal discriminant ideal; defect and Weierstrass classes; `IsReducedMinimal`; `IsSemistable`.
- **L4.5b.** Kraus local and global criteria, finite approximation, patching, the global-minimality equivalence over 𝓞_K, the unique reduced minimal model over ℚ, and the sharp semi-global model.
- **L5.** The pointed-twist type, cocycles and effective descent, the H¹(Gal, Aut) classification (stretch), quadratic twists, and nonsplit ⟹ split after a quadratic twist.
- **L6.** fg_point_of_numberField by the naive x-height and weak Mordell–Weil, finiteness of K(S,n), the canonical height, pairing and regulator, explicit 2-descent, Nagell–Lutz, and reduction injectivity on torsion.
- **L7.** The forced-discrete constructor, Selmer structures (Rubin), Sel_m and its exact sequence, Ш, WC(E/K), and the local–global interface.
  - Stretch: the BSD quotient over ℚ with the explicit real period, Cassels, and statement-only BSD.
- **L8.** The minimal-pair model and naive height, bounded-height finiteness, abc quality, the Szpiro ratio, the Szpiro/abc statements and implications, asymptotic Fermat, and integral points with bounded search.

## Links out of Elliptic curves (55)

| Consumer | Links (E = explicit, I = inferred) | Content |
|---|---|---|
| RankZeroOneBSD (12) | L5→BSD.0 E; L4,L5,L6,L7→BSD.1 E; L7→BSD.5 E; L4,L4.5a→BSD.6 I; L4,L6,L7→BSD.8 E; L6→BSD.9 E | twists, Tamagawa factors, MW lattice/regulator, Selmer/Sha/period/Cassels, BSD quotient, reduction-type and semistability hypotheses, descent certificates, acceptance examples |
| HeegnerPointEulerSystems (7) | L2→HE.3 I; L7→HE.3 E; L7→HE.6 E; L5,L6,L7→HE.7 E; L4→HE.8 I | Weil-pairing self-duality, Kummer maps, Sha identification, finite Selmer, MW index, twists, good ordinary reduction |
| EllipticCurveModularity (6) | L1→R29.1 I; L4→R29.2 E; L3→R29.3 E; L3,L4→R29.4 E; L3→R29.6 E | invariant differential/degree form/Vélu, conductor N_E, a_ℓ(E) and bad Euler factors |
| GrossZagierAndArithmeticHeights (5) | L6,L7→GZ.0 E; L6→GZ.1 E; L6→GZ.8 E; L1→GZ.9 E | height and period normalisation, elliptic height, formal logarithm |
| FoundationsAndLibraryIntegration (5) | L3,L4,L5,L6,L7→LI.4 E | integration of the pinned snapshot, anchored at the layers of the registry's consumer contracts |
| ArithmeticGaloisRepresentations (4) | L0.5→R01.6 I; L2→R01.6 E; L3→R01.6 I; L4→R01.3 I | pointwise action, torsion and pairing, Frobenius polynomial, conductor comparison |
| NeronModelsAndSemistableAbelianVarieties (3) | L4→R11.2 E; L3→R11.6 I; L4→R11.6 E | filtration and Tate's algorithm comparison, invariants used in R29 |
| EllipticKTheory (3) | L1→E.1 E; L0→E.2 I; L0→E.7 I | isogeny/scheme comparison, Pic⁰(E) ≃ E(F), torsion-divisor functions |
| PeriodsAndSpecialValues (3) | L4,L6,L7→PS.6 I | Tamagawa numbers, regulators and torsion, periods and Sha in the BSD adapters |
| one each | L3→WC.5 E; L4→StableReduction L5 E; L1→MCPII R12.1 I; L1→Faltings R28.6 I; L4→PadicHodgeTheory R06.6 I; L4→ModularIwasawaMainConjectures L3 I; L8→ArithmeticStatistics ST.4 I | Hasse compatibility; ReductionSymbol vs Kodaira fibres; invariant differential vs analytic; Hom group; Tate-curve extension class; good ordinary hypothesis; Bhargava–Shankar height |

## Links into Elliptic curves (12, all inferred)

| Supplier | Consumer | Content |
|---|---|---|
| ProfiniteCohomology L1, L2, L4, L5 | L7 | discrete coefficients and restriction; explicit H¹; finite-quotient colimit; connecting maps and inflation–restriction |
| ProfiniteCohomology L9 | L5 | Kummer isomorphism, square classes for quadratic twists |
| GlobalNumberFields L0 | L7 | places and completions |
| GlobalNumberFields L11 | L1 | NumberFieldOrder: End(E) as an order, CM by an order |
| ClassFieldTheory L5, L10 | L7 | local Tate duality; sum of local invariants (Cassels) |
| ArithmeticGaloisDuality R02.3, R02.4 | L7 | finiteness of H¹(G_{K,S}, finite module); Poitou–Tate (Cassels) |
| ArithmeticGaloisRepresentations R01.2 | L7 | restriction through an embedding into a local separable closure, independent of the choice |

## Overlaps

1. **Layer 2 / ArithmeticGaloisRepresentations R01.6 (rescope).** Both construct the Tate module from torsion, with rank, continuity and the Weil-pairing determinant. For elliptic curves R01.6 should import Layer 2.
2. **Layer 4 / NeronModels R11.5 (keep).** Both prove Néron–Ogg–Shafarevich, on equations and through Néron models respectively. State the elliptic case of R11.5 as a comparison in R11.6.
3. **Layer 3 / WeilConjectures WC.1, WC.5 (keep).** Both give the genus-one zeta function, its recurrence and rationality. WC.5 and WC.7 should identify N_r and P_1 with Layer 3's objects instead of rederiving them.
4. **Layer 7 / ProfiniteCohomology L1 (rescope Layer 7).** Layer 7 plans a forced-discrete constructor that ProfiniteCohomology L1, L2 and L4 already build. Layer 7 should keep only a discrete-topology wrapper feeding `ofDiscreteModule`.
5. **Layer 7 / SelmerIwasawaCohomology L2 (rescope).** Both define a Selmer-structure carrier for discrete coefficients. There should be a single declaration: Layer 7 owns it and L2 extends it to T, V and complexes, or the reverse.
6. **Layers 6, 7 / HeightsRationalPoints RP.1 (keep).** Both prove weak Mordell–Weil, descent and finite generation, RP.1 for abelian varieties. RP.1's elliptic example and dimension-one case should be comparisons with Layers 6 and 7.
7. **Layer 6 / HeightsRationalPoints RP.0 (keep).** Both develop the Néron–Tate height. RP.0 should reach elliptic curves through GZ.1's comparison, with the factor-two normalisation made explicit.
8. **Layer 2 / ModularCurves 2A (rescope).** 2A restates E[N](k) ≅ (ℤ/N)². It should derive this from `torsion_addEquiv_prod` via 1B's points dictionary, as it already transports deg [N] = N².
9. **Layer 3 / DeligneWeightsAndPurity DWP.1 (keep).** DWP.1's Weil estimate by positivity is the Hasse-bound argument in dimension one. Record the dimension-one case as a comparison.
10. **Layer 7 / RankZeroOneBSD BSD.0, BSD.9 (rescope).** Both define the BSD statement and analytic rank. BSD.0 should prove that the modular continuation satisfies Layer 7's pinned analytic hypothesis, and BSD.9 should state its signatures against Layer 7's statement.

## Restructuring recommendations for the orchestrator

- **Rescope Layer 7.**
  - Remove the forced-discrete cohomology constructor as a milestone, since ProfiniteCohomology owns it.
  - Settle, with SelmerIwasawaCohomology, which roadmap owns the Selmer-structure carrier for discrete coefficients.
  - Its supplier list is now covered in the atlas: places and completions (GNF L0), embeddings of separable closures (ArithmeticGaloisRepresentations R01.2), finiteness of H¹(G_{K,S}, M) (ArithmeticGaloisDuality R02.3), local Tate duality (CFT L5), and the product formula and global duality (CFT L10, AGD R02.4).
- **Rescope ArithmeticGaloisRepresentations R01.6 and ModularCurves 2A** to import Layer 2 for elliptic curves.
- **Unowned input.** Continuous nonabelian H¹ of a profinite group with coefficients in a discrete group is needed by Layer 5's classification of twists by H¹(Gal, Aut(E_{Kˢᵉᵖ}, O)). No atlas roadmap owns it: ProfiniteCohomology excludes it, AnabelianGeometry NC.3 treats only unipotent torsors, and GlobalQuadraticForms defers to an "Orthogonal and Spin Groups" roadmap that is not in the atlas. A supplier stage should be assigned, most naturally in ProfiniteCohomology.
- **Inputs with no atlas owner beyond Mathlib or the Stoll port.**
  - Layer 6 needs the S-unit theorem and finiteness of S-class groups.
  - Layer 7's Hermite–Minkowski route is covered only through AGD R02.3's finiteness statement. MordellLawrenceVenkatesh LV.5 cites a "Faltings R28.1 node" for Hermite–Minkowski that R28.1's text does not contain.

## Judgement calls for the reviewer

- **LI.4 anchoring.** LI.4 names EllipticCurves as a whole. The five links are anchored at the layers of the registry's consumer contracts, as the NumberFieldArithmetic and LocalFieldsRamification packets did. If whole-roadmap integration should not produce stage links, drop these five.
- **Hypothesis links.** Layer 4 → BSD.6, HE.8 and MIMC L3, and Layer 4.5a → BSD.6, are inferred from theorems stated for E/ℚ under good ordinary, multiplicative, supersingular or semistable hypotheses. Layer 4 says it names these predicates for exactly that literature. BSD.6a and HE.8b/8c repeat the same text and are not linked separately.
- **Layer 8 → ArithmeticStatistics ST.4.** This rests on Bhargava–Shankar's family being the minimal-pair naive-height ordering Layer 8 pins, which ST.4 does not spell out.
- **Conductor.** EllipticCurveModularity uses the EllipticCurves conductor, but Layer 4 defines only the algorithmic Ogg exponent. The Artin identification, including wild primes 2 and 3, is ArithmeticGaloisRepresentations R01.3 (link Layer 4 → R01.3) and R01.6's conductor comparison. The chain is consistent, but R29 should cite that comparison explicitly.
- **Pairs considered and not recorded.**
  - ComputationalNumberTheory CN.3: point counts, isogenies and descent "through existing owners", for generic curves.
  - EllipticRegulators ER.5: the Euler factors are Mathlib's, and CM comes from the CM roadmaps.
  - EffectiveDiophantineMethods ED.3: descent is taken from RP.1.
  - HeightsRationalPoints RP.4: Siegel's theorem for affine curves, with no use of `integralPoints`.
  - NumberFieldArithmetic L5.6: finite-level decomposition groups.
  - LocalFieldsRamification: local fields only, whereas Layer 4 works over complete DVRs.
  - AlgebraicCurves Layer 12's use of the induced-place criterion: covered by the recorded Layer 1 → Layer 12 link.
