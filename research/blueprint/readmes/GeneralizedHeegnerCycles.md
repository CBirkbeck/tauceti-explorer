# Generalized Heegner cycles and their Iwasawa variation

*Roadmap `GeneralizedHeegnerCycles`: the complete blueprint, assembled from its two parts.*

This document is definitive. Its machine form is two part packets, and it is generated from them as their independent reviews left them, so that document and packets agree node for node:

- `research/blueprint/packets/GeneralizedHeegnerCycles--GH.0.json`: layers GH.0–GH.7, 66 nodes. Written by BP-GeneralizedHeegnerCycles--GH.0 and corrected in place by REV-GeneralizedHeegnerCycles--GH.0, whose verdict is *needs changes*.
- `research/blueprint/packets/GeneralizedHeegnerCycles--GH.8.json`: layer GH.8, 16 nodes. Written by BP-GeneralizedHeegnerCycles--GH.8 and corrected in place by REV-GeneralizedHeegnerCycles--GH.8, whose verdict is *accepted*.

The review of the GH.0 part gives two reasons for its verdict. First, its part document could not be edited by the review and still states mathematics the review corrected in the packet; this document is generated from the corrected packet and replaces that part document. Second, five suggested interfaces and their unit tests do not yet discriminate a wrong definition; they are listed under [G18](#gap-18) and remain for a revision of the GH.0 part. The review states that the recorded proof-closure gaps are not grounds for its verdict.

The document replaces the part documents `research/blueprint/readmes/GeneralizedHeegnerCycles--GH.0.md` and `--GH.8.md`. Their layer prose is rewritten here against the corrected packets, and the corrections both reviews list for those documents are in the node sections below. The suggested Lean file `research/blueprint/suggested/GeneralizedHeegnerCycles.lean` joins the two parts' files; it proposes names and signatures, it is not an implementation, and `implementationStatus` is `unchecked` for every node. Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

<a id="purpose-and-scope"></a>
## Purpose and scope

This roadmap plans the generalized Heegner cycles of Bertolini, Darmon and Prasanna and the Iwasawa theory built on them. A generalized Heegner cycle is the graph of a CM isogeny φ: A → A′, raised to the m-th power and projected, on the product X_m = W_m × A^m of a Kuga–Sato variety with a power of a fixed CM elliptic curve. Its Abel–Jacobi images give Galois cohomology classes with coefficients in V_f ⊗ Sym^m H¹(A). Three sources then use them in three different ways, and the roadmap keeps their hypotheses and normalizations apart:

- Bertolini–Darmon–Prasanna (BDP): the p-adic Abel–Jacobi image computed by Coleman integration, and the special value formula for their p-adic Rankin L-function;
- Castella–Hsieh (CH), with their erratum and the Kobayashi–Ota (KO) replacement argument: norm relations, local conditions, ordinary stabilization, the big-logarithm explicit reciprocity law and Selmer consequences at fixed weight;
- Longo–Vigni (LV): universal norms, the Kolyvagin system of generalized Heegner cycles and its Λ-adic bound; and Castella's Hida-family classes (Cas), with their two-variable reciprocity law and specialization.

These are genuine higher-dimensional cycles, not Heegner points with a renamed coefficient module. At weight two (m = 0) the cycle is a CM point minus a cusp, and the last layer compares it with the Heegner point system by proved maps.

The proof is staged so that each layer uses only earlier ones:

1. geometry and coefficients (GH.0);
2. the cycles and their realizations (GH.1);
3. relations in the ring-class tower and local conditions (GH.2);
4. ordinary stabilization and universal norms (GH.3);
5. special values and explicit reciprocity (GH.4);
6. the Kolyvagin system and the Λ-adic bound (GH.5);
7. nonvanishing and Selmer consequences (GH.6);
8. Hida-family classes (GH.7);
9. the weight-two comparison and the exports to consumers (GH.8).

The layers, with what each plans:

- **GH.0, Kuga–Sato geometry and coefficient projectors.** The CM curve A with its Hodge splitting and normalized (ω_A, η_A); the signed CM projector ε_A and Lemma 1.8; the CM character decomposition of Sym^m H¹_dR(A); X_m and ε_X = ε_W ε_A with its denominator N^m2^{2m}(m!)²; concentration of the projected cohomology in degree 2m + 1, its Hodge filtration and self-duality; the newform and CM coefficient projector; the good model of the CM product.
- **GH.1, algebraic cycles and Abel–Jacobi realizations.** Marked CM isogenies Isog_c^𝔑(A); the cycle Δ_φ, its field of definition and homological triviality (BDP Remark 2.6, Proposition 2.7); the étale Abel–Jacobi map (BDP Definition 3.1) and its integral version; filtered Frobenius extensions (BDP Proposition 3.5) and the p-adic Abel–Jacobi map; the character-projected class z_{f,χ} of CH (4.6)–(4.7); the parabolic residue pairing, the Coleman primitive and BDP's Coleman Abel–Jacobi formula with the depleted components; the syntomic comparison and the comparison with classical Heegner cycles.
- **GH.2, ring-class trace, congruence and local conditions.** The norm relations (CH Proposition 4.4), conjugation (CH Lemma 4.6), the Frobenius congruence (CH Lemma 4.7), the finite local class, and the corrected local condition at p (CH Proposition 7.8 by KO Lemma 4.10).
- **GH.3, ordinary stabilization and universal norms.** CH's stabilized classes and their first step, the Iwasawa class z_f; LV's trace polynomials, their intersection theorem and the universal-norm class.
- **GH.4, explicit reciprocity and p-adic Abel–Jacobi formulas.** BDP Theorem 5.13 and the scaling of the CM differential; CH Theorem 4.9 for ramified characters; the fixed-weight regulator adapter; CH Theorem 5.7 and Corollary 5.8.
- **GH.5, higher-weight Kolyvagin system and arithmetic hypotheses.** LV admissible triples, the verification of Howard's hypotheses and of LV's local assumptions, specialization control, the corrected Kolyvagin system and the conditional Λ-adic bound.
- **GH.6, nonvanishing and source-qualified Selmer consequences.** Anticyclotomic nonvanishing (CH Theorem 3.9), the rank-one and rank-zero theorems (CH Theorems 6.1–6.2), the corrected growth formula (CH Theorem 6.3) and parity (CH Theorem 6.4); LV's universal-norm module of rank one and the resulting Λ-structure.
- **GH.7, Hida-family classes and specialization.** Castella's critical twist and Howard's family tower; the family representation and measure checkpoints; the Ochiai, Yager and two-variable regulator checkpoints and their anticyclotomic descent; Castella Theorem 5.3, Lemma 6.4 and Theorem 6.5.
- **GH.8, weight-two and main-conjecture consumer comparisons.** The weight-two cycle and its Abel–Jacobi and Kummer classes under the modular quotient; characters and positive-conductor stabilization; the initial Euler factor; uniform integral lattices and the counterexample with unbounded denominators; the modular differential; the p-old Hida specialization; weight-two reciprocity; the exports to AutomorphicCongruences L2 and RankZeroOneBSD BSD.6a.

The blueprint has 82 nodes: 33 theorems, 20 comparisons, 15 constructions, 8 lemmas, 3 definitions, 3 applications, with 63 API items, 54 unit tests and 40 planets, citing 113 source passages from 11 sources and 19 pinned library declarations. Every layer is planned at target level; none is closed. The 24 recorded gaps, the 19 requests to other roadmaps and the 8 requests of the GH.8 part to earlier layers are listed at the end, with each layer's open items.

**What is not here.**

- The universal generalized elliptic curve, the parabolic cohomology H¹_par(C, 𝕃_m) with its Hecke action and lattices, and their models: ModularCurvesPartII R14.3, by the accepted restructuring RS-06. Scholl's projector ε_W: AutomorphicGaloisRepresentations R19.1 on that restructuring's division, although GH.0 requests it from R14.3. The Kuga–Sato variety W_m itself has no owner yet ([the ownership question](#kuga-sato-ownership)). GH.0 adds the CM factor, the product and the coefficient adapter.
- CM elliptic curves, the ideal action, CM descent and the Weil-restriction CM characters: ComplexMultiplicationAndExplicitReciprocity CM.1 and CM.2 (RS-04) and HeegnerPointEulerSystems HE.1.
- Ring class fields and their towers, CM points, Heegner-point norm relations, Kummer classes and the anticyclotomic point families: HeegnerPointEulerSystems HE.0–HE.3 and HE.8, over upstream ClassFieldTheory Layer 13.
- Chow groups and correspondences (SchemeAndStackFoundations SF.5); étale and de Rham realizations, Künneth, Gysin sequences and Poincaré duality (EtaleDualityAndPerverseSheaves EDC.2, EDC.3, EDC.6; DerivedDeRhamCohomology DD.2); continuous Galois cohomology and descent (ArithmeticGaloisDuality R02.1–R02.2).
- Period rings and comparison theorems (PadicHodgeTheory R06.2, R06.5); Bloch–Kato maps, syntomic regulators and big logarithms (PadicHodgeRegulators L1, D.2, L3 and its requested Part II); rigid cohomology and overconvergent isocrystals (PadicDifferentialEquationsAndRigidCohomology RD.3, RD.4).
- The BDP/CH square-root p-adic L-function, its family version, its interpolation and Hsieh's nonvanishing theorem: AutomorphicPadicLFunctions L3h. This roadmap owns the cycle side of the special value and reciprocity formulas, never the distribution.
- Generic Euler and Kolyvagin systems, Howard's hypotheses and the Λ-adic bound: EulerSystemsAndKolyvaginSystems ES.3, ES.5 and ES.8. GH.5 verifies their hypotheses for the higher-weight system and supplies its classes.
- Selmer structures, Iwasawa cohomology, Shapiro's lemma and Bloch–Kato conditions: SelmerIwasawaCohomology L2–L4. Nekovář's family parity is requested from a Part II of L4.
- Hida families and their Galois representations: PadicFamilies L0 and AutomorphicGaloisRepresentations R19.1 and R19.6.
- The consumers: GrossZagierAndArithmeticHeights GZ.9 takes the m = 0 case of BDP's formula; AutomorphicCongruences L2 and RankZeroOneBSD BSD.6a take the GH.8 exports and prove their own congruences and divisibilities; ModularIwasawaMainConjectures L6 owns the general main-conjecture formulations.
- Not targets anywhere here: equality of characteristic ideals (LV's main conjecture, which GH.6 identifies as a conjecture); nonordinary or supersingular variants of the ordinary theorems; and nonzero higher-weight cycles from a simple complex zero, which needs a height or nondegeneracy theorem that CH's remarks leave open.

<a id="boundaries"></a>
## Boundaries

The roadmap sits between the geometric, cohomological and p-adic Hodge-theoretic roadmaps it imports and the Iwasawa-theoretic roadmaps that consume it. A one-line test decides whether something is in scope: it is here if it constructs, projects or compares a generalized Heegner cycle or a class made from one, verifies a source's hypotheses for that cycle system, or evaluates such a class against a p-adic L-function. Everything such a statement uses about modular curves, CM theory, cohomology, regulators, distributions, Euler systems or Hida families is imported.

**Restructuring decisions that fix the boundary.** Three accepted proposals settle ownership here.

- **RS-04.** ComplexMultiplicationAndExplicitReciprocity CM.1 supplies the CM construction and CM.2 the reciprocity law directly to GH.0, after HeegnerPointEulerSystems HE.1 is narrowed; the level-structured cycle construction stays here. The nodes cite CM.1 and HE.1/canonical-model-cm-descent (GH.0/cm-elliptic-curve-and-its-hodge-splitting, GH.1/isogenies-of-conductor-c-prime-to-n, GH.1/field-of-definition-of-generalized-heegner-cycles, GH.1/character-projected-heegner-class, GH.2/cycle-conjugation, GH.7/critical-character-twist), and request the general CM.1 export beyond HE.1's restricted unit fields. No node cites CM.2.
- **RS-06.** ModularCurvesPartII R14.3 owns the finite-level universal-family carrier and its symmetric-power local systems with their Hecke and level comparison, formerly planned in GH.0 (R14.3 → GH.0: "GH constructs Kuga–Sato projectors/cycles"). The components GH.0 used to import through ModularCurvesPartII R14.1 reach it from their owners: AbelianSchemesAndArithmeticModuli A3, upstream ModularCurves 2b (isogenies and quotients) and upstream ModularForms Layers 2–3 (Hecke operators, oldforms and newforms); R14.1 → GH.0 stays for its own comparison. GH.0 keeps the CM factor, the product X_m and the cycle-specific coefficient adapter, and requests from R14.3 the higher fibre powers, Scholl's projector, the parabolic Hodge filtration, the integral lattices and the fine-level descent for N ≤ 4. The nodes cite R14.3; none cites A3, R14.1 or the upstream layers.
- **RS-08.** ArithmeticGaloisDuality R02.1–R02.4 and DeformationAndDerivedPatchingAlgebra P7 reach GH.1, and ModularSymbolsPadicLFunctions L0–L2 with upstream ModularForms Layer 8 reach GH.7, as forwarded imports. The nodes cite R02.1 (the continuous Ext¹ = H¹ identification) and R02.2/compact-five-term; P7, R02.3, R02.4, the modular-symbol layers and ModularForms Layer 8 are cited by no node, since the BDP and Castella constructions use neither modular symbols nor derived coefficient change.

**Dependency discipline.** Every edge between layers points to an earlier layer: GH.1 uses GH.0; GH.2 uses GH.0–GH.1; GH.3 uses GH.1–GH.2; GH.4 uses GH.0, GH.1 and GH.3; GH.5 uses GH.0, GH.2 and GH.3; GH.6 uses GH.2–GH.5; GH.7 uses GH.0, GH.1, GH.3, GH.4 and GH.6; GH.8 uses all earlier layers. Two choices keep the graph acyclic. The Λ-adic bound of GH.5 takes κ′₁ ≠ 0 as a hypothesis, because GH.6 supplies the nonvanishing and the identification Λκ′₁ = H_∞ from GH.5's classes. The control theorem of GH.5 does not use the Λ-adic bound of EulerSystemsAndKolyvaginSystems ES.8 that it feeds (the GH.0 review removed that circular prerequisite). The node graph of both parts, with the cross-part edges of this document added, has no cycle.

**Source routes stay apart.** CH's running Hypothesis (H) (weight 2r, odd discriminant −D_K < −3, p ∤ 2(2r−1)!Nφ(N), every prime of N split in K, p split, χ of conductor prime to N), LV's admissibility (Definition 2.1, with its exceptional set and big image) and Castella's family hypotheses are separate hypothesis packages, with implications only where proved. CH's rank-zero and reciprocity statements need f ordinary; its rank-one implication from a nonzero class does not, and is not a Gross–Zagier nonvanishing theorem. CH's bounded-error descent is requested from ES.5 separately from Howard's clean hypotheses, so that LV's big image is never imposed on CH's fixed-weight theorems.

<a id="kuga-sato-ownership"></a>
**An open ownership question: the Kuga–Sato variety W_m and Scholl's projector.** No roadmap plans the Kuga–Sato variety itself, the canonical desingularization W_m of the m-fold fibre power of the universal generalized elliptic curve over X₁(N) with its boundary cohomology, and the requests for it form a loop:

- GH.0 imports W_m and the projector ε_W and requests both from ModularCurvesPartII R14.3 ([request 8](#req-8)); the R14.3 packet has no node on fibre powers, Kuga–Sato varieties or Scholl's projector.
- AutomorphicGaloisRepresentations R19.1 plans Scholl's projector, `R19.1/scholl-projector`, which is the ε_W of GH.0 (the signed average over ((ℤ/nℤ)² ⋊ μ₂)^r ⋊ S_r on the resolved fibre power, concentrated in degree r + 1), and requests the fibre powers, their resolution and boundary cohomology from GH.0.
- WeightsInEtaleCohomology R34.5 requests the classical W_r and its projector from GH.0.

RS-06 divides the work as follows: R14.3 constructs the integral finite-level cohomology and the Sym^{k−2} local systems on the universal family and supplies the curve and coefficient carrier to R19.1 and GH.0; R19.1 constructs the eigenspace and projector; GH.0 constructs the higher-dimensional cycles. On that division GH.0 should take ε_W and Scholl's concentration theorem from `R19.1/scholl-projector`, not from R14.3, and the geometry of W_m needs an owner before both, naturally R14.3 (or a layer it imports), to which the R19.1 and R34.5 requests should then go. As long as `R19.1/scholl-projector` cites GH.0, citing it from GH.0 would make the layers GH.0 and R19.1 depend on each other, so the R19.1 citation has to move first. This document records the question; resolving it is a restructuring decision for the maintainer.

### What this roadmap imports

Every layer of another roadmap that a node cites, or from which a part requests something, with the nodes that use it. "The layer" means a citation of the layer as a whole; a request link leads to the exact statement asked for. Node-level citations are exact supplier nodes, which the review of each part read. One upstream Tau Ceti edge concerns this roadmap: the link map of upstream ClassFieldTheory records an inferred edge from Layer 13 (norm theorems and class fields, with Gal(H_O/K) ≅ Pic O) to GH.1. The nodes take ring class fields and their tower from HeegnerPointEulerSystems HE.0/ring-class-tower-quotients rather than citing Layer 13 directly.

| Layer | What is cited | Consuming nodes |
|---|---|---|
| `ArithmeticGaloisDuality:R02.1` (Topological coefficients and inverse limits) | the layer, [request](#req-18) | [`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map) |
| `ArithmeticGaloisDuality:R02.2` (Hochschild–Serre and descent) | `compact-five-term` | [`GH.1/character-projected-heegner-class`](#n-gh-1-character-projected-heegner-class), [`GH.1/integral-abel-jacobi-comparison`](#n-gh-1-integral-abel-jacobi-comparison), [`GH.5/higher-weight-howard-hypotheses`](#n-gh-5-higher-weight-howard-hypotheses), [`GH.5/specialization-control`](#n-gh-5-specialization-control) |
| `AutomorphicGaloisRepresentations:R19.1` (Classical Galois representations) | the layer, [request](#req-1) | [`GH.5/longo-vigni-admissible-triple`](#n-gh-5-longo-vigni-admissible-triple) |
| `AutomorphicGaloisRepresentations:R19.6` (Representations over Hecke algebras) | the layer, [request](#req-2) | [`GH.7/critical-character-twist`](#n-gh-7-critical-character-twist), [`GH.7/family-representation-specialization`](#n-gh-7-family-representation-specialization), [`GH.7/howard-family-tower`](#n-gh-7-howard-family-tower) |
| `AutomorphicPadicLFunctions:L3h` (Anticyclotomic toric distributions and Hsieh's μ theorem) | the layer, [request](#req-3) | [`GH.1/coleman-depletion-calculation`](#n-gh-1-coleman-depletion-calculation), [`GH.4/bdp-special-value-formula`](#n-gh-4-bdp-special-value-formula), [`GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`](#n-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity), [`GH.4/dual-exponential-special-value`](#n-gh-4-dual-exponential-special-value), [`GH.4/ramified-character-abel-jacobi-formula`](#n-gh-4-ramified-character-abel-jacobi-formula), [`GH.6/anticyclotomic-nonvanishing`](#n-gh-6-anticyclotomic-nonvanishing), [`GH.7/family-measure-specialization`](#n-gh-7-family-measure-specialization) |
| `ComplexMultiplicationAndExplicitReciprocity:CM.1` (Elliptic CM and ideal actions) | the layer, [request](#req-4) | [`GH.0/cm-elliptic-curve-and-its-hodge-splitting`](#n-gh-0-cm-elliptic-curve-and-its-hodge-splitting), [`GH.1/character-projected-heegner-class`](#n-gh-1-character-projected-heegner-class), [`GH.1/field-of-definition-of-generalized-heegner-cycles`](#n-gh-1-field-of-definition-of-generalized-heegner-cycles), [`GH.1/isogenies-of-conductor-c-prime-to-n`](#n-gh-1-isogenies-of-conductor-c-prime-to-n), [`GH.2/cycle-conjugation`](#n-gh-2-cycle-conjugation), [`GH.7/critical-character-twist`](#n-gh-7-critical-character-twist) |
| `DerivedDeRhamCohomology:DD.2` (Derived de Rham and the Hodge filtration) | the layer, [request](#req-5) | [`GH.0/cohomology-of-the-generalized-kuga-sato-variety`](#n-gh-0-cohomology-of-the-generalized-kuga-sato-variety), [`GH.0/projected-hodge-filtration`](#n-gh-0-projected-hodge-filtration), [`GH.1/homological-triviality-of-generalized-heegner-cycles`](#n-gh-1-homological-triviality-of-generalized-heegner-cycles) |
| `EtaleDualityAndPerverseSheaves:EDC.2` (Smooth trace, relative purity and Poincaré duality) | `adic-and-rational-poincare-duality` | [`GH.0/cohomology-of-the-generalized-kuga-sato-variety`](#n-gh-0-cohomology-of-the-generalized-kuga-sato-variety), [`GH.0/self-duality-of-the-projected-cohomology`](#n-gh-0-self-duality-of-the-projected-cohomology), [`GH.1/p-adic-abel-jacobi-map`](#n-gh-1-p-adic-abel-jacobi-map), [`GH.1/parabolic-residue-pairing`](#n-gh-1-parabolic-residue-pairing) |
| `EtaleDualityAndPerverseSheaves:EDC.3` (Gysin maps and cycle classes) | `gysin-sequence` | [`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map) |
| `EtaleDualityAndPerverseSheaves:EDC.6` (Integral, analytic and diamond comparison of operations) | the layer, [request](#req-6) | [`GH.0/cohomology-of-the-generalized-kuga-sato-variety`](#n-gh-0-cohomology-of-the-generalized-kuga-sato-variety), [`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map), [`GH.1/homological-triviality-of-generalized-heegner-cycles`](#n-gh-1-homological-triviality-of-generalized-heegner-cycles) |
| `EulerSystemsAndKolyvaginSystems:ES.3` (Derivative operators and corrected Kolyvagin classes) | `kolyvagin-system-module` | [`GH.5/higher-weight-kolyvagin-class`](#n-gh-5-higher-weight-kolyvagin-class) |
| `EulerSystemsAndKolyvaginSystems:ES.5` (Primitivity and sharpness over DVRs) | the layer, `howard-hypotheses`, [request](#req-17) | [`GH.5/higher-weight-howard-hypotheses`](#n-gh-5-higher-weight-howard-hypotheses), [`GH.5/longo-vigni-local-assumptions`](#n-gh-5-longo-vigni-local-assumptions), [`GH.6/selmer-rank-one`](#n-gh-6-selmer-rank-one), [`GH.6/selmer-rank-zero`](#n-gh-6-selmer-rank-zero) |
| `EulerSystemsAndKolyvaginSystems:ES.8` (Iwasawa variation and application handoffs) | `self-dual-lambda-adic-kolyvagin-bound` | [`GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound`](#n-gh-5-longo-vigni-admissibility-and-the-lambda-adic-bound) |
| `HeegnerPointEulerSystems:HE.0` (Quadratic orders, ring class fields and reciprocity) | `conductor-change-kernel`, `ring-class-tower-quotients` | [`GH.1/field-of-definition-of-generalized-heegner-cycles`](#n-gh-1-field-of-definition-of-generalized-heegner-cycles), [`GH.1/isogenies-of-conductor-c-prime-to-n`](#n-gh-1-isogenies-of-conductor-c-prime-to-n), [`GH.3/iwasawa-heegner-class`](#n-gh-3-iwasawa-heegner-class), [`GH.3/longo-vigni-trace-polynomials`](#n-gh-3-longo-vigni-trace-polynomials), [`GH.3/ordinary-stabilized-class`](#n-gh-3-ordinary-stabilized-class), [`GH.3/universal-norm-heegner-class`](#n-gh-3-universal-norm-heegner-class), [`GH.5/longo-vigni-admissible-triple`](#n-gh-5-longo-vigni-admissible-triple), [`GH.6/selmer-consequences-with-the-corrected-dimension-formula`](#n-gh-6-selmer-consequences-with-the-corrected-dimension-formula), [`GH.8/initial-corestriction-comparison`](#n-gh-8-initial-corestriction-comparison), [`GH.8/primitive-character-stabilization`](#n-gh-8-primitive-character-stabilization) |
| `HeegnerPointEulerSystems:HE.1` (CM points and compatible modular parametrizations) | the layer, `canonical-model-cm-descent`, `heegner-points-of-conductor-m-and-the-modular-parametrisation`, [request](#req-7) | [`GH.0/cm-elliptic-curve-and-its-hodge-splitting`](#n-gh-0-cm-elliptic-curve-and-its-hodge-splitting), [`GH.1/field-of-definition-of-generalized-heegner-cycles`](#n-gh-1-field-of-definition-of-generalized-heegner-cycles), [`GH.1/isogenies-of-conductor-c-prime-to-n`](#n-gh-1-isogenies-of-conductor-c-prime-to-n), [`GH.7/howard-family-tower`](#n-gh-7-howard-family-tower), [`GH.8/modular-quotient-kummer`](#n-gh-8-modular-quotient-kummer), [`GH.8/weight-zero-cycle`](#n-gh-8-weight-zero-cycle) |
| `HeegnerPointEulerSystems:HE.2` (Geometric norm and reduction-congruence relations) | `cm-hecke-conductor-classification`, `inert-reduction-frobenius-congruence`, `repeated-conductor-predecessor-recurrence`, `split-ramified-first-step-recurrence` | [`GH.2/cycle-frobenius-congruence`](#n-gh-2-cycle-frobenius-congruence), [`GH.2/cycle-norm-relations`](#n-gh-2-cycle-norm-relations), [`GH.3/stabilized-first-step-adapter`](#n-gh-3-stabilized-first-step-adapter), [`GH.8/initial-corestriction-comparison`](#n-gh-8-initial-corestriction-comparison), [`GH.8/positive-tail-corestriction`](#n-gh-8-positive-tail-corestriction) |
| `HeegnerPointEulerSystems:HE.3` (Kummer classes and exact Selmer conditions) | `kummer-classes-and-the-modified-selmer-conditions` | [`GH.8/character-sum-comparison`](#n-gh-8-character-sum-comparison), [`GH.8/initial-corestriction-comparison`](#n-gh-8-initial-corestriction-comparison), [`GH.8/modular-quotient-kummer`](#n-gh-8-modular-quotient-kummer), [`GH.8/positive-conductor-stabilization`](#n-gh-8-positive-conductor-stabilization), [`GH.8/positive-tail-corestriction`](#n-gh-8-positive-tail-corestriction), [`GH.8/primitive-character-stabilization`](#n-gh-8-primitive-character-stabilization), [`GH.8/uniform-coherent-kernel-bound`](#n-gh-8-uniform-coherent-kernel-bound), [`GH.8/uniform-coherent-lift`](#n-gh-8-uniform-coherent-lift) |
| `HeegnerPointEulerSystems:HE.8` (Anticyclotomic families, nonvanishing and divisibility defects) | `anticyclotomic-heegner-class`, `ordinary-stabilized-point`, `stabilized-corestriction` | [`GH.8/positive-conductor-stabilization`](#n-gh-8-positive-conductor-stabilization), [`GH.8/positive-tail-corestriction`](#n-gh-8-positive-tail-corestriction), [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity) |
| `ModularCurvesPartII:R14.3` (Cohomological realisations and pairings) | the layer, [request](#req-8) | [`GH.0/cm-product-good-model`](#n-gh-0-cm-product-good-model), [`GH.0/cohomology-of-the-generalized-kuga-sato-variety`](#n-gh-0-cohomology-of-the-generalized-kuga-sato-variety), [`GH.0/generalized-kuga-sato-variety-and-its-projector`](#n-gh-0-generalized-kuga-sato-variety-and-its-projector), [`GH.0/newform-cm-projector`](#n-gh-0-newform-cm-projector), [`GH.0/projected-hodge-filtration`](#n-gh-0-projected-hodge-filtration), [`GH.1/coleman-depletion-calculation`](#n-gh-1-coleman-depletion-calculation), [`GH.2/cycle-conjugation`](#n-gh-2-cycle-conjugation), [`GH.7/howard-family-tower`](#n-gh-7-howard-family-tower) |
| `PadicDifferentialEquationsAndRigidCohomology:RD.3` (Overconvergent isocrystals and frames) | `overconvergent-f-isocrystal` | [`GH.1/coleman-primitive`](#n-gh-1-coleman-primitive), [`GH.1/parabolic-residue-pairing`](#n-gh-1-parabolic-residue-pairing) |
| `PadicDifferentialEquationsAndRigidCohomology:RD.4` (Rigid cohomology and compact support) | the layer, [request](#req-9) | [`GH.1/coleman-primitive`](#n-gh-1-coleman-primitive), [`GH.1/parabolic-residue-pairing`](#n-gh-1-parabolic-residue-pairing) |
| `PadicFamilies:L0` (Ordinary modular forms and Hecke algebras) | `hida-control-theorem` | [`GH.7/critical-character-twist`](#n-gh-7-critical-character-twist), [`GH.7/family-measure-specialization`](#n-gh-7-family-measure-specialization), [`GH.7/family-representation-specialization`](#n-gh-7-family-representation-specialization) |
| `PadicHodgeRegulators:D.2` (Étale and syntomic regulators) | the layer, [request](#req-10) | [`GH.1/syntomic-abel-jacobi-comparison`](#n-gh-1-syntomic-abel-jacobi-comparison) |
| `PadicHodgeRegulators:L1` (Bloch–Kato maps) | the layer, `bloch-kato-logarithm`, [request](#req-22) | [`GH.1/p-adic-abel-jacobi-map`](#n-gh-1-p-adic-abel-jacobi-map), [`GH.8/differential-evaluation`](#n-gh-8-differential-evaluation), [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity) |
| `PadicHodgeRegulators:L3` (The big logarithm and explicit interpolation) | the layer, [request](#req-11) | [`GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`](#n-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections), [`GH.4/dual-exponential-special-value`](#n-gh-4-dual-exponential-special-value), [`GH.4/fixed-weight-regulator-adapter`](#n-gh-4-fixed-weight-regulator-adapter), [`GH.5/longo-vigni-local-assumptions`](#n-gh-5-longo-vigni-local-assumptions), [`GH.7/critical-character-twist`](#n-gh-7-critical-character-twist), [`GH.7/ochiai-exponential-checkpoint`](#n-gh-7-ochiai-exponential-checkpoint), [`GH.7/two-variable-regulator-checkpoint`](#n-gh-7-two-variable-regulator-checkpoint), [`GH.7/yager-unramified-checkpoint`](#n-gh-7-yager-unramified-checkpoint) |
| `PadicHodgeTheory:R06.2` (Period functors and admissibility) | the layer, [request](#req-12) | [`GH.1/extensions-of-filtered-frobenius-modules`](#n-gh-1-extensions-of-filtered-frobenius-modules) |
| `PadicHodgeTheory:R06.5` (Geometric comparison theorems) | the layer, [request](#req-13) | [`GH.1/extensions-of-filtered-frobenius-modules`](#n-gh-1-extensions-of-filtered-frobenius-modules), [`GH.1/p-adic-abel-jacobi-map`](#n-gh-1-p-adic-abel-jacobi-map), [`GH.2/cycle-frobenius-congruence`](#n-gh-2-cycle-frobenius-congruence), [`GH.2/finite-local-abel-jacobi-class`](#n-gh-2-finite-local-abel-jacobi-class) |
| `SchemeAndStackFoundations:SF.2` (Sites and scheme cohomology) | [request](#req-14), the layer | [`GH.0/cm-product-good-model`](#n-gh-0-cm-product-good-model), [`GH.1/parabolic-residue-pairing`](#n-gh-1-parabolic-residue-pairing) |
| `SchemeAndStackFoundations:SF.5` (Intersection theory and Riemann-Roch) | [request](#req-15), the layer | [`GH.0/cm-projector-and-symmetric-power`](#n-gh-0-cm-projector-and-symmetric-power), [`GH.0/generalized-kuga-sato-variety-and-its-projector`](#n-gh-0-generalized-kuga-sato-variety-and-its-projector), [`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map), [`GH.1/generalized-heegner-cycle`](#n-gh-1-generalized-heegner-cycle) |
| `SelmerIwasawaCohomology:L2` (Selmer structures and duals) | `condition-propagation`, `galois-selmer-group` | [`GH.2/finite-local-abel-jacobi-class`](#n-gh-2-finite-local-abel-jacobi-class), [`GH.5/specialization-control`](#n-gh-5-specialization-control), [`GH.6/selmer-rank-one`](#n-gh-6-selmer-rank-one), [`GH.6/selmer-rank-zero`](#n-gh-6-selmer-rank-zero), [`GH.7/ordinary-localization-injective`](#n-gh-7-ordinary-localization-injective) |
| `SelmerIwasawaCohomology:L3` (Iwasawa cohomology and control) | `iwasawa-cohomology`, `iwasawa-shapiro` | [`GH.3/iwasawa-heegner-class`](#n-gh-3-iwasawa-heegner-class), [`GH.3/universal-norm-heegner-class`](#n-gh-3-universal-norm-heegner-class), [`GH.6/selmer-consequences-with-the-corrected-dimension-formula`](#n-gh-6-selmer-consequences-with-the-corrected-dimension-formula), [`GH.7/family-regulator-localization`](#n-gh-7-family-regulator-localization), [`GH.7/higher-weight-family-specialization`](#n-gh-7-higher-weight-family-specialization), [`GH.7/howard-family-tower`](#n-gh-7-howard-family-tower), [`GH.7/ordinary-localization-injective`](#n-gh-7-ordinary-localization-injective) |
| `SelmerIwasawaCohomology:L4` (Arithmetic examples and conjectures) | [request](#req-16), the layer, `bloch-kato-condition` | [`GH.2/finite-local-abel-jacobi-class`](#n-gh-2-finite-local-abel-jacobi-class), [`GH.3/universal-norm-heegner-class`](#n-gh-3-universal-norm-heegner-class), [`GH.5/longo-vigni-local-assumptions`](#n-gh-5-longo-vigni-local-assumptions), [`GH.6/selmer-parity`](#n-gh-6-selmer-parity) |

### Roadmaps that cite this one

Every node of another roadmap's packet that cites this roadmap, with the node here that answers the citation. Seven citations name a layer (GH.0, GH.1 or GH.7) where nodes now exist, one names the integrated checkpoint id `GH.1/generalized-heegner-cycles-and-their-abel-jacobi-images`, which the GH.0 part refines into five nodes, and one names a node; the answers give the nodes. The atlas also records GH.8 as feeding AutomorphicCongruences L2, whose packets do not yet cite a node of this roadmap.

| Citing node | Cites | Answer |
|---|---|---|
| `AutomorphicGaloisRepresentations:R19.1/parabolic-realisation-premotive` | `GH.0` | Cited as a layer. No GH.0 node plans the Kuga–Sato variety W_m, its resolution and boundary cohomology, or the projector ε_W alone: GH.0 imports both and requests them from ModularCurvesPartII R14.3 ([request 8](#req-8)), and the R14.3 packet does not plan them. GH.0 plans the product X_m = W_m × A^m and its CM factor ([`GH.0/generalized-kuga-sato-variety-and-its-projector`](#n-gh-0-generalized-kuga-sato-variety-and-its-projector), [`GH.0/cohomology-of-the-generalized-kuga-sato-variety`](#n-gh-0-cohomology-of-the-generalized-kuga-sato-variety)). See [the ownership question](#kuga-sato-ownership). |
| `AutomorphicGaloisRepresentations:R19.1/scholl-projector` | `GH.0` | Cited as a layer. No GH.0 node plans the Kuga–Sato variety W_m, its resolution and boundary cohomology, or the projector ε_W alone: GH.0 imports both and requests them from ModularCurvesPartII R14.3 ([request 8](#req-8)), and the R14.3 packet does not plan them. GH.0 plans the product X_m = W_m × A^m and its CM factor ([`GH.0/generalized-kuga-sato-variety-and-its-projector`](#n-gh-0-generalized-kuga-sato-variety-and-its-projector), [`GH.0/cohomology-of-the-generalized-kuga-sato-variety`](#n-gh-0-cohomology-of-the-generalized-kuga-sato-variety)). See [the ownership question](#kuga-sato-ownership). |
| `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison` | `GH.0` | Cited as a layer. No GH.0 node plans the Kuga–Sato variety W_m, its resolution and boundary cohomology, or the projector ε_W alone: GH.0 imports both and requests them from ModularCurvesPartII R14.3 ([request 8](#req-8)), and the R14.3 packet does not plan them. GH.0 plans the product X_m = W_m × A^m and its CM factor ([`GH.0/generalized-kuga-sato-variety-and-its-projector`](#n-gh-0-generalized-kuga-sato-variety-and-its-projector), [`GH.0/cohomology-of-the-generalized-kuga-sato-variety`](#n-gh-0-cohomology-of-the-generalized-kuga-sato-variety)). See [the ownership question](#kuga-sato-ownership). |
| `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula` | `GH.1` | Cited as a layer. The m = 0 cycle P_{A′} − ∞ is [`GH.1/generalized-heegner-cycle`](#n-gh-1-generalized-heegner-cycle); its p-adic Abel–Jacobi value is [`GH.1/p-adic-abel-jacobi-map`](#n-gh-1-p-adic-abel-jacobi-map), whose acceptance check m = 0 is the Coleman integral ∫_∞^P ω_f. BDP Theorem 5.13 itself is [`GH.4/bdp-special-value-formula`](#n-gh-4-bdp-special-value-formula). |
| `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula` | `GH.1/generalized-heegner-cycles-and-their-abel-jacobi-images` | Integrated checkpoint id, refined into five nodes ([refinements](#refinements)); BDP Theorem 5.13, which this citation needs, is [`GH.4/bdp-special-value-formula`](#n-gh-4-bdp-special-value-formula). |
| `GrossZagierAndArithmeticHeights:GZ.9/weight-two-abel-jacobi-is-logarithm` | `GH.1/p-adic-abel-jacobi-map` | Exact node; its acceptance check m = 0 gives AJ_F(P − ∞)(ω_f) = ∫_∞^P ω_f. |
| `RankZeroOneBSD:BSD.6a/castella-anticyclotomic-main-conjecture` | `GH.7` | Cited as a layer. Castella Theorems 2.11, 5.3 and 6.5 are [`GH.7/family-measure-specialization`](#n-gh-7-family-measure-specialization), [`GH.7/two-variable-explicit-reciprocity`](#n-gh-7-two-variable-explicit-reciprocity) and [`GH.7/higher-weight-family-specialization`](#n-gh-7-higher-weight-family-specialization); the bundle BSD.6a consumes is [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export), and the conditional Λ-adic bound is [`GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound`](#n-gh-5-longo-vigni-admissibility-and-the-lambda-adic-bound). |
| `RankZeroOneBSD:BSD.6a/castella-higher-weight-input` | `GH.7` | Cited as a layer. Castella Theorems 2.11, 5.3 and 6.5 are [`GH.7/family-measure-specialization`](#n-gh-7-family-measure-specialization), [`GH.7/two-variable-explicit-reciprocity`](#n-gh-7-two-variable-explicit-reciprocity) and [`GH.7/higher-weight-family-specialization`](#n-gh-7-higher-weight-family-specialization); the bundle BSD.6a consumes is [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export), and the conditional Λ-adic bound is [`GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound`](#n-gh-5-longo-vigni-admissibility-and-the-lambda-adic-bound). |
| `RankZeroOneBSD:BSD.6a/higher-weight-integral-kolyvagin-bound` | `GH.7` | Cited as a layer. Castella Theorems 2.11, 5.3 and 6.5 are [`GH.7/family-measure-specialization`](#n-gh-7-family-measure-specialization), [`GH.7/two-variable-explicit-reciprocity`](#n-gh-7-two-variable-explicit-reciprocity) and [`GH.7/higher-weight-family-specialization`](#n-gh-7-higher-weight-family-specialization); the bundle BSD.6a consumes is [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export), and the conditional Λ-adic bound is [`GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound`](#n-gh-5-longo-vigni-admissibility-and-the-lambda-adic-bound). |

<a id="requests-filed-here"></a>
**Requests other roadmaps have filed with this one.**

| Filed by | Supplier named | Need | Answer |
|---|---|---|---|
| `AutomorphicGaloisRepresentations.json` for `AutomorphicGaloisRepresentations:R19.1/scholl-projector` | `GH.0` | Fine-level Kuga–Sato fibre powers, canonical equivariant smooth compactification/resolution and the boundary cohomology needed in Scholl §1.3; the ε-projector and its arithmetic application are owned here. | Not planned here: GH.0 imports the fibre powers W_m and requests them from ModularCurvesPartII R14.3 ([request 8](#req-8)), whose packet does not plan them. By RS-06, R19.1's own projector is the ε_W that GH.0 uses. The geometry of W_m has no owner yet; see [the ownership question](#kuga-sato-ownership). |
| `GrossZagierAndArithmeticHeights--GZ.8.json` for `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula` | `GH.1` | State BDP Theorem 5.13 in the generality of BDP Assumption 5.12 (any class number, odd conductor c prime to N d_K, characters of finite type (c, 𝔑, ε_f), all 0 ≤ j ≤ r), not only under the three simplifying hypotheses of the decomposition node GH.1/generalized-heegner-cycles-and-their-abel-jacobi-images, and include the r = 0 cycle Δ_φ − ∞ explicitly. GZ.9 imports the r = j = 0 case and does not plan Theorem 5.13 itself (resolution of RT-AREA-iwasawa-1/11: GH owns BDP Theorem 5.13 for every r). | Answered by [`GH.4/bdp-special-value-formula`](#n-gh-4-bdp-special-value-formula), stated under the five clauses of BDP Assumption 5.12 for 0 ≤ j ≤ m, with the m = 0 specialization named for GZ.9; the m = 0 cycle P_{A′} − ∞ is [`GH.1/generalized-heegner-cycle`](#n-gh-1-generalized-heegner-cycle). The theorem sits in GH.4, not GH.1. |
| `RankZeroOneBSD--BSD.0.json` for `RankZeroOneBSD:BSD.6a/castella-higher-weight-input`, `RankZeroOneBSD:BSD.6a/castella-anticyclotomic-main-conjecture` | `GH.7` | Castella–Hsieh (4.7), §5.2 and Theorems 5.7/6.1, Longo–Vigni Theorem 4.7 and Castella Theorems 2.11/5.3: big Heegner/generalized Heegner classes in Hida families, their two-variable explicit reciprocity and the congruence of BDP p-adic L-functions along the family, with the Chida–Hsieh erratum and the Kobayashi–Ota local-condition replacement. | Collected by [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export): CH (4.7) is [`GH.1/character-projected-heegner-class`](#n-gh-1-character-projected-heegner-class), CH §5.2 [`GH.3/ordinary-stabilized-class`](#n-gh-3-ordinary-stabilized-class), CH Theorem 5.7 [`GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`](#n-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity), CH Theorem 6.1 [`GH.6/selmer-rank-one`](#n-gh-6-selmer-rank-one), LV Theorem 4.7 [`GH.5/higher-weight-kolyvagin-class`](#n-gh-5-higher-weight-kolyvagin-class), Castella Theorems 2.11 and 5.3 [`GH.7/family-measure-specialization`](#n-gh-7-family-measure-specialization) and [`GH.7/two-variable-explicit-reciprocity`](#n-gh-7-two-variable-explicit-reciprocity), and the erratum with the Kobayashi–Ota replacement [`GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`](#n-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections). The family congruence of the p-adic L-functions is AutomorphicPadicLFunctions L3h's. The erratum meant is Castella–Hsieh's (the request says Chida–Hsieh). The nonsplit tame-level range and the integral leading-class unit remain open ([G23](#gap-23)). |
| `WeightsInEtaleCohomology.json` for `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison` | `GH.0` | Classical W_r and the symmetric degree-one algebraic projector with Hecke/Galois-compatible étale parabolic comparison; denominator ledger and good-prime extension, retaining R14.3 ownership of classical modular geometry. Existing W_r×A^r CM nodes have total degree 2r+1 and do not supply the classical degree-r+1 comparison. Saito’s separate Hilbert model and projector are requested from R18.2; GH.0 is not asked to own Hilbert geometry. | Not planned here: the classical W_m and its projector are imported by GH.0 ([request 8](#req-8)); GH.0 records only the denominators N^m and 2^m m! of the W_m factor inside the product projector ([`GH.0/generalized-kuga-sato-variety-and-its-projector`](#n-gh-0-generalized-kuga-sato-variety-and-its-projector)). By RS-06 the projector is R19.1's (`R19.1/scholl-projector`); the geometry of W_m has no owner yet ([the ownership question](#kuga-sato-ownership)). |

<a id="conventions"></a>
## Conventions

**Fields, orders and levels.** K is an imaginary quadratic field of discriminant −D_K, O_c = ℤ + cO_K the order of conductor c, H a field containing the Hilbert class field, H_c (BDP) or K_c (CH) the ring class field of conductor c, and K̃_c the ray field over which a chosen level structure is defined. The Heegner hypothesis provides an ideal 𝔑 ⊂ O_K with O_K/𝔑 ≅ ℤ/Nℤ, and a marked isogeny φ: A → A′ satisfies ker φ ∩ A[𝔑] = 0, not ker φ ∩ A[N] = 0. The ideal semigroup acting on marked isogenies of conductor c is that of invertible integral O_c-ideals prime to 𝔑_c = 𝔑 ∩ O_c. C = X₁(N) with N > 4 for the fine model; source levels N ≤ 4 need the fine-level descent requested from ModularCurvesPartII R14.3. A good model of W_m does not give a good model of a CM twist: the CM factor needs its own model.

**The CM differential.** A/H has a specified isomorphism O_K ≅ End_H(A), normalized on differentials by [α]^*ω = αω. η_A lies on the conjugate eigenline with ⟨ω_A, η_A⟩ = 1. Rescaling ω_A by a rescales η_A by a⁻¹ and the class ω_A^jη_A^{m−j} by a^{2j−m}; these signed exponents enter the period factors of GH.4.

**Weights and indices.** The sources index weights differently. This document writes **m** for the BDP fibre-power index and **r** only for CH's half weight.

| Source | Weight of f | Fibre-power index | Self-dual coefficient twist |
|---|---|---|---|
| BDP | k | m = k − 2 (BDP writes r) | ε_X H^{2m+1}(X_m)(m + 1) |
| CH | 2r | m = 2r − 2 | V_f(r), coefficients Sym^{2r−2} T_p(A)(1 − r) |
| LV | even k ≥ 4 | k − 2 | as CH, with k = 2r |
| Castella | k_ν = 2r_ν on arithmetic specializations | 2r_ν − 2 | T† = T ⊗ Θ^{-1}, the critical twist |
| GH.8 (weight two) | 2 | m = 0, CH r = 1 | V_p E; the cycle is a CM point minus a cusp |

At m = 0 the cycle needs the degree-zero cusp correction; the positive-degree vanishing argument does not apply.

**Notation reconciled inside the GH.0 part.** In seven nodes drawn from BDP, the packet writes r for the fibre-power index in some fields, while its other nodes write m. This document prints m in those fields:

- [`GH.0/cm-projector-and-symmetric-power`](#n-gh-0-cm-projector-and-symmetric-power), [`GH.0/cm-character-decomposition`](#n-gh-0-cm-character-decomposition), [`GH.0/generalized-kuga-sato-variety-and-its-projector`](#n-gh-0-generalized-kuga-sato-variety-and-its-projector) and [`GH.0/self-duality-of-the-projected-cohomology`](#n-gh-0-self-duality-of-the-projected-cohomology): title, statement, hypotheses, proof steps, acceptance checks and uses;
- [`GH.1/field-of-definition-of-generalized-heegner-cycles`](#n-gh-1-field-of-definition-of-generalized-heegner-cycles): proof steps;
- [`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map) and [`GH.1/p-adic-abel-jacobi-map`](#n-gh-1-p-adic-abel-jacobi-map): acceptance checks.

So "the projector ε_A on A^r" becomes "on A^m", "X_r = W_r × A^r" becomes "X_m = W_m × A^m", and "Self-duality of ε_X H^{2r+1}(X_r)(r + 1)" becomes "of ε_X H^{2m+1}(X_m)(m + 1)". Only the letter changes; no formula changes. Source excerpts, locators and the "match" notes beside them keep BDP's r. The suggested file prints m in the comment blocks of the same nodes.

**Notation of the GH.8 part.** The GH.8 packet writes Greek letters and some symbols in ASCII; this document prints them as the GH.0 part does: `Gamma_tilde` as Γ̃, `C_bar` as C̄, `T-dagger` as T†, `c_0` as c₀, `alpha` as α, `beta` as β, `chi` as χ, `ell` as ℓ, `gamma` as γ, `infinity` as ∞, `infty` as ∞, `kappa` as κ, `lambda` as λ, `mu` as μ, `nu` as ν, `omega` as ω, `Omega` as Ω, `phi` as φ, `pi` as π, `psi` as ψ, `Psi` as Ψ, `rho` as ρ, `sigma` as σ, `Sigma` as Σ, `tau` as τ, `theta` as θ, `xi` as ξ, `--` as –, `->` as →, `>=` as ≥, `<=` as ≤. Excerpts, locators, identifiers and Lean names are unchanged, and so is the word "zeta" in "zeta elements". Exponents such as ^{-1} keep their ASCII minus.

**Projectors and denominators.** ε_A averages the signed action of Ξ_m = μ₂^m ⋊ S_m with denominator 2^m m!; the permutation sign cancels the graded Künneth sign, and the unsigned average projects to ∧^m H¹, which is zero for m ≥ 3. The imported ε_W contains the N-torsion averaging and the sign projector. ε_X = ε_W ε_A has clearing denominator N^m2^{2m}(m!)²; (2N·m!)² need not clear it. Inverting 2N·m! clears the geometric denominators but not an independent Hecke congruence denominator, which the coefficient projector and the integral Abel–Jacobi comparison record separately.

**Filtered Frobenius modules.** Over a finite unramified F/ℚ_p, Φ = Φ₀^{[F:ℚ_p]} is the F-linear iterate of crystalline Frobenius. The class of an extension is the holomorphic lift minus the Frobenius lift, modulo Fil⁰; the opposite order changes the sign of AJ_p. BDP's local comparison uses finite unramified F and good models; CH's finite conductor fields can be ramified, and GH.8 requests the finite-base-change squares needed there.

**Stabilization and units.** For CH, α is the unit root of X² − a_pX + p^{2r−1}. For p | c, z_{c,α} = z_c − (p^{2r−2}/α) res(z_{c/p}); for p ∤ c, z_{c,α} = u_c^{-1}(1 − p^{r−1}σ_p/α)(1 − p^{r−1}σ_p̄/α) z_c with CH's u_c = |O_c^×|. Castella's u_c is |O_c^×|/2. The Iwasawa class is normalized by α^{-n}. At weight two α is the unit root of X² − a_pX + p and the subtraction is by α^{-1}. The finite ring-class quotient Δ is kept apart from Γ ≅ ℤ_p and from a Δ-character projection.

**Distributions and reciprocity.** BDP's special value identity is squared. CH's big logarithm equals the linear square-root distribution times −c₀^{r−1} and the group element σ_{−1,p} = rec_p(−1), of order dividing 2, and pairs with ω_f ⊗ t^{−2r}. Castella's family reciprocity has σ_{−1,p} and no −c₀^{r−1} factor, and his proof pairs with t^{1−2r}; the GH.8 part requests the comparison of the two presentations. The ramified logarithmic range, BDP's unramified Euler factor and the dual-exponential range are separate formulas.

**Signs, growth and divisibility.** The Selmer growth slope is (1 − ε)/2 for the root number ε, and the parity residue is (1 − ε)/2 modulo 2. A characteristic-ideal statement is a divisibility, char(M) dividing char(Selhat/Λκ₁), equivalently the containment char(Selhat/Λκ₁) ⊆ char(M); no equality is asserted.

**Source editions.** CH locators refer to the author copy dated 2 July 2022 unless a node says "published"; the coefficient display of §4.4 was collated against both versions. LV locators refer to arXiv:1605.03168v1, Castella's to his 31-page author copy, BDP's to the Duke version. The editions and hashes are under Sources.

<a id="sources"></a>
## Sources

Eleven documents, all freely readable. The two parts cite five of them under different identifiers; both identifiers lead to the same entry, and the SHA-256 hashes the parts recorded agree. Each entry lists, for each part, the edition read and the passages read; a node's locator refers to that edition. The Mathlib entries are cited by GH.8 for the algebra of its comparison lemmas.

<a id="src-bertolini-darmon-prasanna-generalized-heegner"></a>
### M. Bertolini, H. Darmon, K. Prasanna; appendix B. Conrad: Generalized Heegner cycles and p-adic Rankin L-series

Cited as `bertolini-darmon-prasanna-generalized-heegner` and `bdp-published-2013-gh8` (43 node citations). <https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf>

- **Part GH.0.** Published Duke Math. J. 162 (2013), 1033–1148; 116 pages. SHA-256 `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc`. Accessed 2026-10-07.
  Read: §1.4, pp.1051–1054; §2.1–2.4, pp.1055–1064; §3.1–3.7, pp.1064–1083; §3.8 Proposition 3.24 and its proof, pp.1086–1088; §5.3, Assumption 5.12 and Theorem 5.13 with proof, pp.1137–1139; appendix introduction, pp.1139–1141.
- **Part GH.8.** Duke Mathematical Journal 162 (2013), 1033--1148; 116-page published PDF on Darmon’s page. SHA-256 `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc`. Accessed 2026-10-06.
  Read: Section 2.3, Remark 2.6, index-zero paragraph and Proposition 2.7, pp. 1062--1063; Sections 3.1--3.4, pp. 1065--1070: Gysin extension, crystalline comparison and de Rham functional.
- Version record (GH.0): published, read 2026-10-07.
- Version record (GH.8): published, read 2026-10-06. Bounded read scope is listed in sources; not a claim to have read the whole paper.

<a id="src-castella-hsieh"></a>
### F. Castella, M.-L. Hsieh: Heegner cycles and p-adic L-functions (Author copy dated July 2, 2022, 40 pages)

Cited as `castella-hsieh` and `ch-author-2022-gh8` (29 node citations). <https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf>

- **Part GH.0.** Author copy dated July 2, 2022, 40 pages; distinct from Math. Ann. 370 (2018). SHA-256 `5c85ea3c0d53ce4825ade4213b930c6542bf628cba6d506bb8c3e46960f02bba`. Accessed 2026-10-07.
  Read: Hypothesis (H); Proposition 3.8 and Theorem 3.9 nonvanishing statements and proof; §4.1–4.7 cycle, norm, character and logarithm constructions; §5.1–5.3 relative regulator, stabilization and reciprocity; §6.1–6.4 with proofs; §7.1–7.5 descent and local condition arguments.
- **Part GH.8.** Author revision dated 2 July 2022, 40 pages; distinct from the 2018 journal typesetting. SHA-256 `5c85ea3c0d53ce4825ade4213b930c6542bf628cba6d506bb8c3e46960f02bba`. Accessed 2026-10-06.
  Read: Standing Hypothesis (H), pp. 1--2; Sections 4.2--4.4, pp. 15--19: coefficient carrier, Proposition 4.4 and its proof, symmetric-power display and character projection; Sections 5.1--5.3, pp. 21--25: Theorem 5.1 and quotient proof, Definition 5.2, Lemmas 5.3--5.5, period pairings, Definition 5.6 and Theorem 5.7 with proof; p. 25 rendered and inspected; Section 6.1 hypothesis package and Theorem 6.1, pp. 26--27.
- Version record (GH.0): author copy, read 2026-10-07.
- Version record (GH.8): author copy, read 2026-10-06. Bounded read scope is listed in sources; not a claim to have read the whole paper.

<a id="src-castella-hsieh-erratum"></a>
### F. Castella, M.-L. Hsieh: Erratum to Heegner cycles and p-adic L-functions

Cited as `castella-hsieh-erratum` and `ch-erratum-gh8` (4 node citations). <https://www.math.ntu.edu.tw/~mlhsieh/research/erratum2.pdf>

- **Part GH.0.** One-page author-hosted erratum. SHA-256 `2a8b615daf100b0f2e8ee5890462a91dde9c860492ec920d2a1a7d5827028678`. Accessed 2026-10-07.
  Read: Entire text, including all three corrections.
- **Part GH.8.** One-page author erratum linked by Hsieh. SHA-256 `2a8b615daf100b0f2e8ee5890462a91dde9c860492ec920d2a1a7d5827028678`. Accessed 2026-10-06.
  Read: Entire one-page erratum: Theorem 6.3, Lemma 7.5/Proposition 7.8 and Lemma 7.10 corrections.
- Version record (GH.0): author copy, read 2026-10-07.
- Version record (GH.8): author copy, read 2026-10-06. Bounded read scope is listed in sources; not a claim to have read the whole paper.

<a id="src-longo-vigni"></a>
### M. Longo, S. Vigni: Kolyvagin systems and Iwasawa theory of generalized Heegner cycles

Cited as `longo-vigni` (11 node citations). <https://arxiv.org/pdf/1605.03168>

- **Part GH.0.** arXiv:1605.03168v1, May 10, 2016; findings and obligations refer to this edition. SHA-256 `afc1a2146cae0397c5aabb337f5955d182a0dab3dd50949ec2e274426a9a5c75`. Accessed 2026-10-07.
  Read: Introduction and Theorem 1.1; §2–5 (hypotheses, control, universal norms, Kolyvagin construction, rank-one module and bound).
  Publisher full-text URL was opened on 2026-10-07 but returned an Incapsula access page. arXiv lists only v1; the author publications page timed out. This packet does not claim to have collated the 2019 version of record.
- Version record (GH.0): preprint, read 2026-10-07.

<a id="src-castella-variation"></a>
### F. Castella: On the p-adic variation of Heegner points

Cited as `castella-variation` and `castella-family-author-gh8` (17 node citations). <https://web.math.ucsb.edu/~castella/Heegner.pdf>

- **Part GH.0.** 31-page author-hosted copy of J. Inst. Math. Jussieu 19 (2020), 2127–2164. SHA-256 `6ebd71311d6841d15d653183e9ca3adaabbe9720416e86f6731e7c1ecbb1156d`. Accessed 2026-10-07.
  Read: §1 introduction and conventions; §2.1–2.7; §3.1–3.4; §4.1–4.2; §5.1–5.2; §6.1–6.2, through Theorem 6.5 and Remark 6.6; §6.3 is outside this part.
- **Part GH.8.** 31-page author copy; numbering of this copy. Published: J. Inst. Math. Jussieu 19 (2020), 2127--2164. SHA-256 `6ebd71311d6841d15d653183e9ca3adaabbe9720416e86f6731e7c1ecbb1156d`. Accessed 2026-10-06.
  Read: Introduction and standing ordinary/Hida hypotheses, pp. 2--3; Theorem 2.11 and analytic-specialization proof, p. 12; Section 5.1--5.2, pp. 21--23: Lemma 5.1, lambda localization, Proposition 5.2, twist, corestriction/restriction and Theorem 5.3 statement; Section 6.2, pp. 27--29: Lemma 6.4 proof, Theorem 6.5 and proof, equations (6.7)--(6.9) and Remark 6.6; p. 28 rendered and inspected.
- Version record (GH.0): author copy, read 2026-10-07.
- Version record (GH.8): author copy, read 2026-10-06. Bounded read scope is listed in sources; not a claim to have read the whole paper.

<a id="src-kobayashi-ota"></a>
### S. Kobayashi, K. Ota: Anticyclotomic main conjecture for modular forms and integral Perrin-Riou twists

Cited as `kobayashi-ota` (1 node citations). <https://www.math.keio.ac.jp/~kurihara/20.ASPMstyle.pdf>

- **Part GH.0.** Author-hosted proceedings copy, 58 pages, cited by CH erratum. SHA-256 `377cf3e5c53b00bed813a06e18ad8dac9315997497f2dabe57a435664b9764b4`. Accessed 2026-10-07.
  Read: §4.7 Lemma 4.10 and its entire proof; Lemma 4.7 and Remark 4.8; integral twisting prerequisites are requested, not independently established.
- Version record (GH.0): author copy, read 2026-10-07.

<a id="src-castella-hsieh-published"></a>
### F. Castella, M.-L. Hsieh: Heegner cycles and p-adic L-functions (Publisher-formatted Math. Ann. 370 (2018), 567–628)

Cited as `castella-hsieh-published` and `ch-published-2018-gh8` (4 node citations). <https://web.math.ucsb.edu/~castella/HeegnerCycles-print.pdf>

- **Part GH.0.** Publisher-formatted Math. Ann. 370 (2018), 567–628; author-hosted 62-page print copy. SHA-256 `be67ffe80a7fa346e8cb0733f38c776268174eebc6277a85bfa9b91c49073ade`. Accessed 2026-10-07.
  Read: §4.4, p.593: coefficient definition and symmetric-power/induction display, collated for E7 only.
  This review collates the coefficient display in §4.4 only; all other CH node locators remain explicitly tied to the July 2, 2022 author copy.
- **Part GH.8.** Mathematische Annalen 370 (2018), 567--628; DOI 10.1007/s00208-017-1517-3; 62-page journal-typeset PDF. SHA-256 `be67ffe80a7fa346e8cb0733f38c776268174eebc6277a85bfa9b91c49073ade`. Accessed 2026-10-06.
  Read: Standing Hypothesis (H); Sections 4.3--4.4, Proposition 4.4 and the symmetric-power display, pp. 591--593; p. 593 rendered and inspected; Section 5.2, Definition 5.2 and Lemmas 5.3--5.4, pp. 601--602.
- Version record (GH.0): published, read 2026-10-07.
- Version record (GH.8): published, read 2026-10-06. Bounded read scope is listed in sources; not a claim to have read the whole paper.

<a id="src-lz14-v3-gh8"></a>
### David Loeffler; Sarah Livia Zerbes: Iwasawa theory and p-adic L-functions over Z_p^2-extensions

Cited as `lz14-v3-gh8` (1 node citations). <https://arxiv.org/pdf/1108.5954v3>

- **Part GH.8.** arXiv:1108.5954v3, 22 April 2014; 45-page accepted-version preprint, distinct from the journal typesetting. SHA-256 `0da539348716fa2293377bba81b07de3d851f3e98bbc9b244b19e639a5ae5341`. Accessed 2026-10-06.
  Read: Definition 4.6 and Theorem 4.7 statement, p. 16; Propositions 4.9--4.11 including the complete injectivity proof, p. 18.
- Version record (GH.8): preprint, read 2026-10-06. Bounded read scope is listed in sources; not a claim to have read the whole paper.

<a id="src-mathlib-quotient-082e2d3-gh8"></a>
### Mathlib contributors: Mathlib quotient modules and kernels

Cited as `mathlib-quotient-082e2d3-gh8` (1 node citations). <https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Quotient/Basic.lean>

- **Part GH.8.** Commit 082e2d37e8b0463410cdb532e111cd43d5a66174. Accessed 2026-10-06.
  Read: Quotient/Basic.lean: mkQ_map_self, mapQ and ker_mapQ with their surrounding hypotheses; Submodule/Ker.lean: ker_eq_bot.

<a id="src-mathlib-finite-characters-082e2d3-gh8"></a>
### Mathlib contributors: Finite sums and multiplicative-character orthogonality

Cited as `mathlib-finite-characters-082e2d3-gh8` (1 node citations). <https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/MulChar/Basic.lean>

- **Part GH.8.** Commit 082e2d37e8b0463410cdb532e111cd43d5a66174. Accessed 2026-10-06.
  Read: MulChar Basic.lean finite CommMonoid/CommRing/IsDomain context and sum_eq_zero_of_ne_one statement/proof; BigOperators Finset Defs.lean: Equiv.prod_comp and its generated additive form Equiv.sum_comp.

<a id="src-bsd-multiplicative-erratum-gh8"></a>
### Francesc Castella: Erratum to On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes

Cited as `bsd-multiplicative-erratum-gh8` (1 node citations). <https://web.math.ucsb.edu/~castella/Birch-erratum.pdf>

- **Part GH.8.** Five-page author erratum; acquired copy includes Theorem 2.3 and its proof. SHA-256 `c04dff16c27bc3ca4f4e235e366fcd4c95a43cfb9215f75a2584dfeb7114edcf`. Accessed 2026-10-06.
  Read: Introduction, corrected Theorem 1.1 and Theorem A′, pp. 1--2; Theorem 2.3 and proof, pp. 3--4; proof of Theorem 1.1 and footnote 1, p. 4; reference register, p. 5.
- Version record (GH.8): author copy, read 2026-10-06. Bounded read scope is listed in sources; not a claim to have read the whole paper.

<a id="libraries"></a>
## What the pinned libraries have

The reviewed library audit (AUDIT-24, in `data/library-coverage.json`) finds every layer GH.0–GH.8 not built at the pins: no generalized Heegner cycle, Kuga–Sato product, Abel–Jacobi map, Coleman primitive, stabilized or Iwasawa Heegner class, Kolyvagin system or family class exists in Mathlib or Tau Ceti. The plan therefore builds on what is there and plans nothing the libraries contain. Tau Ceti supplies the abelian-variety carrier, its endomorphism ring with `mulBy`, and the isogeny predicate; Mathlib supplies scheme morphism properties, linear maps, quotients, duals, finite character sums and integer divisibility. Both reviews read every cited declaration at the pins. Near misses that are not baseline: Tau Ceti's `OrderSystem.weightedAbelJacobiClass` is an abstract divisor-class map, not the Jacobian or its étale realization, and its multiplicative Kummer theory concerns roots of unity, not E[p^m] (both read by the GH.8 review).

The audit also records overlaps with other layers. The boundaries above address each:

- GH.0 with AutomorphicGaloisRepresentations R19.1, AutomorphicGaloisRepresentationsPartII AG2.1 and ModularCurvesPartII R14.1 (Kuga–Sato projectors and Hecke correspondences): RS-06 gives the local systems and their cohomology to R14.3 and the projector to R19.1; GH.0 keeps only the product with the CM factor. The Kuga–Sato variety itself is left without an owner ([the ownership question](#kuga-sato-ownership)).
- GH.1, GH.2, GH.3 and GH.5 with HeegnerPointEulerSystems HE.1, HE.2, HE.8 and HE.5: those layers own the weight-two Heegner-point versions, which GH imports or compares with in GH.8; GH plans only the higher-weight cycle versions.
- GH.4 with GrossZagierAndArithmeticHeights GZ.9: by the resolution of RT-AREA-iwasawa-1/11, AutomorphicPadicLFunctions L3h owns the BDP distribution, GH.4 owns BDP Theorem 5.13 and CH Theorem 4.9, and GZ.9 imports the m = 0 case.
- GH.8 with ModularIwasawaMainConjectures L6: L6 owns the generic coefficient-ring, determinant-line, characteristic-ideal and primitive/imprimitive comparisons; GH.8 supplies the geometric, differential and source-qualified producer maps, and L6 is not a GH.8 prerequisite.

The pinned declarations the nodes cite, with what each provides:

| Declaration | Module | What it provides | Cited by |
|---|---|---|---|
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety` | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean` | A proper geometrically integral group object over Spec K, for a field K; smoothness and the dimension interface are already available. | [`GH.0/cm-elliptic-curve-and-its-hodge-splitting`](#n-gh-0-cm-elliptic-curve-and-its-hodge-splitting) |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End` | `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean` | Additive endomorphism ring of the existing abelian variety object, including toHom and integer multiplication. | [`GH.0/cm-elliptic-curve-and-its-hodge-splitting`](#n-gh-0-cm-elliptic-curve-and-its-hodge-splitting) |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.mulBy` | `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean` | mulBy A n is End.toHom of the integer n in End A; used by the scalar endomorphism compatibility test. | [`GH.0/cm-elliptic-curve-and-its-hodge-splitting`](#n-gh-0-cm-elliptic-curve-and-its-hodge-splitting) |
| `mathlib:LinearMap` | `Mathlib/Algebra/Module/LinearMap/Defs.lean` | (GH.0) The bundled semilinear map extends AddHom and MulActionHom; the identity-ring case supplies linear correspondence realizations. / (GH.8) Bundled semilinear maps, including ordinary linear maps; supplies the linear algebra of transport, stabilization and comparisons, not an arithmetic realization theorem. | [`GH.0/cm-projector-and-symmetric-power`](#n-gh-0-cm-projector-and-symmetric-power), [`GH.3/longo-vigni-trace-polynomials`](#n-gh-3-longo-vigni-trace-polynomials), [`GH.8/character-sum-comparison`](#n-gh-8-character-sum-comparison), [`GH.8/initial-corestriction-comparison`](#n-gh-8-initial-corestriction-comparison), [`GH.8/initial-only-rescaling-obstruction`](#n-gh-8-initial-only-rescaling-obstruction), [`GH.8/positive-conductor-stabilization`](#n-gh-8-positive-conductor-stabilization), [`GH.8/positive-tail-corestriction`](#n-gh-8-positive-tail-corestriction), [`GH.8/primitive-character-stabilization`](#n-gh-8-primitive-character-stabilization), [`GH.8/unbounded-denominators-counterexample`](#n-gh-8-unbounded-denominators-counterexample), [`GH.8/uniform-coherent-kernel-bound`](#n-gh-8-uniform-coherent-kernel-bound), [`GH.8/uniform-coherent-lift`](#n-gh-8-uniform-coherent-lift), [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity) |
| `mathlib:LinearMap.range` | `Mathlib/Algebra/Module/Submodule/Range.lean` | The image submodule of a linear map, with membership equivalent to existence of a preimage. | [`GH.0/cm-projector-and-symmetric-power`](#n-gh-0-cm-projector-and-symmetric-power) |
| `mathlib:Submodule.span` | `Mathlib/LinearAlgebra/Span/Defs.lean` | The infimum of submodules containing a supplied set; used for the coefficient eigenline and Selmer generation statements. | [`GH.0/cm-elliptic-curve-and-its-hodge-splitting`](#n-gh-0-cm-elliptic-curve-and-its-hodge-splitting) |
| `mathlib:AlgebraicGeometry.Smooth` | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean` | Smooth scheme morphisms, with composition and pullback stability already in the baseline. | [`GH.0/cm-product-good-model`](#n-gh-0-cm-product-good-model) |
| `mathlib:AlgebraicGeometry.IsProper` | `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean` | Proper scheme morphisms, defined by separatedness, universal closedness and local finite type; composition and pullback stability are already available. | [`GH.0/cm-product-good-model`](#n-gh-0-cm-product-good-model) |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny` | `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean` | The existing isogeny predicate is finiteness and surjectivity of the underlying scheme homomorphism; identities, composition and base change are already available. | [`GH.1/isogenies-of-conductor-c-prime-to-n`](#n-gh-1-isogenies-of-conductor-c-prime-to-n) |
| `mathlib:Module.Dual` | `Mathlib/LinearAlgebra/Dual/Defs.lean` | The algebraic dual of a module; no de Rham or Galois comparison is supplied. | [`GH.8/differential-evaluation`](#n-gh-8-differential-evaluation) |
| `mathlib:LinearMap.dualMap_apply` | `Mathlib/LinearAlgebra/Dual/Defs.lean` | Evaluation of the transpose: q.dualMap ℓ x = ℓ (q x). | [`GH.8/differential-evaluation`](#n-gh-8-differential-evaluation), [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity) |
| `mathlib:LinearMap.dualMap_comp_dualMap` | `Mathlib/LinearAlgebra/Dual/Defs.lean` | Contravariant composition of transposes, used for the differential comparison composite maps. | [`GH.8/differential-evaluation`](#n-gh-8-differential-evaluation) |
| `mathlib:Int.natAbs_le_of_dvd_ne_zero` | `Mathlib/Data/Int/Basic.lean` | If m divides a nonzero integer n, natAbs(m) ≤ natAbs(n); rules out divisibility of a fixed nonzero integer by every power of two. | [`GH.8/unbounded-denominators-counterexample`](#n-gh-8-unbounded-denominators-counterexample) |
| `mathlib:Submodule.mapQ` | `Mathlib/LinearAlgebra/Quotient/Basic.lean` | Induced map M/P → N/Q from a linear map f with P contained in f^{-1}(Q); does not imply injectivity. | [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family) |
| `mathlib:Submodule.ker_mapQ` | `Mathlib/LinearAlgebra/Quotient/Basic.lean` | The kernel of the induced quotient map is the image of f^{-1}(Q) under M → M/P. | [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family) |
| `mathlib:Submodule.mkQ_map_self` | `Mathlib/LinearAlgebra/Quotient/Basic.lean` | The image of P under its own quotient map is zero. | [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family) |
| `mathlib:LinearMap.ker_eq_bot` | `Mathlib/Algebra/Module/Submodule/Ker.lean` | A linear map of modules is injective exactly when its kernel is zero. | [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family) |
| `mathlib:Equiv.prod_comp` | `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean` | Reindex a finite product by an equivalence of finite types; its to_additive attribute generates Equiv.sum_comp, the finite-sum form used here. The literal source declaration is cited because the repository index does not enumerate generated additive declarations. No arithmetic cohomology or character-specialization map is supplied. | [`GH.8/primitive-character-stabilization`](#n-gh-8-primitive-character-stabilization) |
| `mathlib:MulChar.sum_eq_zero_of_ne_one` | `Mathlib/NumberTheory/MulChar/Basic.lean` | A nontrivial multiplicative character on a finite commutative monoid has scalar sum zero in a commutative integral domain. Apply to the finite abelian conductor kernel, where every element is a unit. This existing scalar theorem, not a new orthogonality theory, supplies cancellation. | [`GH.8/primitive-character-stabilization`](#n-gh-8-primitive-character-stabilization) |

<a id="layer-overview"></a>
## Layer overview

| Layer | Title | Part | Nodes | Planets | Coverage |
|---|---|---|---:|---:|---|
| [GH.0](#layer-gh-0) | Kuga–Sato geometry and coefficient projectors | GH.0 | 9 | 4 | planned |
| [GH.1](#layer-gh-1) | Algebraic cycles and Abel–Jacobi realizations | GH.0 | 15 | 6 | planned |
| [GH.2](#layer-gh-2) | Ring-class trace, congruence and local conditions | GH.0 | 5 | 4 | planned |
| [GH.3](#layer-gh-3) | Ordinary stabilization and universal norms | GH.0 | 6 | 4 | planned |
| [GH.4](#layer-gh-4) | Explicit reciprocity and p-adic Abel–Jacobi formulas | GH.0 | 6 | 4 | planned |
| [GH.5](#layer-gh-5) | Higher-weight Kolyvagin system and arithmetic hypotheses | GH.0 | 6 | 3 | planned |
| [GH.6](#layer-gh-6) | Nonvanishing and source-qualified Selmer consequences | GH.0 | 7 | 6 | planned |
| [GH.7](#layer-gh-7) | Hida-family classes and specialization | GH.0 | 12 | 5 | planned |
| [GH.8](#layer-gh-8) | Weight-two and main-conjecture consumer comparisons | GH.8 | 16 | 4 | planned |

Every layer is planned at target level: every target of the layer has a node, and every input not yet available has a supplier node, a precise request or a recorded gap. No layer is closed, and no node is implemented.

The planets, at most six per layer, are the layer's key objects and named theorems: the generalized Kuga–Sato variety, its projected cohomology and Hodge filtration and the coefficient projector (GH.0); the cycle, the two Abel–Jacobi maps, the character-projected class, the Coleman primitive and the Coleman Abel–Jacobi formula (GH.1); the norm relations, conjugation, the Frobenius congruence and the corrected local condition (GH.2); the stabilized, Iwasawa and universal-norm classes and the trace polynomials (GH.3); BDP's special value formula, the ramified Abel–Jacobi formula, the CH reciprocity law and the dual exponential formula (GH.4); admissible triples, the higher-weight Kolyvagin system and the LV bound (GH.5); nonvanishing, the rank-one and rank-zero theorems, the growth formula, parity and the universal-norm module (GH.6); the critical twist, Howard's family tower, the two-variable reciprocity law and the two specialization theorems (GH.7); and the weight-two Abel–Jacobi, differential, ordinary-family and reciprocity comparisons (GH.8).

<a id="layer-gh-0"></a>
## GH.0 — Kuga–Sato geometry and coefficient projectors

*Part GH.0. Coverage: planned. 9 nodes, 4 planets.*

The layer fixes the geometry and the coefficients every later layer uses. The universal-family side is imported: the layer requests the fibre powers W_m over C = X₁(N), Scholl's projector ε_W and the parabolic cohomology H¹_par(C, 𝕃_m) with its Hecke action, lattices and models from ModularCurvesPartII R14.3. (On the division of RS-06 the projector is AutomorphicGaloisRepresentations R19.1's, and W_m has no owner yet; see [the ownership question](#kuga-sato-ownership).) The layer adds the CM side and the product.

- **The CM factor.** A CM elliptic curve A/H with O_K ≅ End_H(A), normalized on differentials, and the splitting H¹_dR(A/F) = Fω_A ⊕ Fη_A into CM eigenlines with ⟨ω_A, η_A⟩ = 1; at an ordinary split prime the conjugate line is the unit-root line. The signed projector ε_A on A^m (BDP (1.4.4), Lemma 1.8) has image Sym^m H¹(A) in degree m; the unsigned average would select ∧^m. Its monomial basis ω_A^jη_A^{m−j} carries the joint CM characters α^jᾱ^{m−j}. Distinct bidegrees, not distinct values: for K = ℚ(i), α = i and m = 2 the extreme values coincide.
- **The product.** X_m = W_m × A^m of dimension 2m + 1 with ε_X = ε_W ε_A, self-transpose, clearing denominator N^m2^{2m}(m!)²; no global model of X_m over ℤ[1/N] is claimed. The projected cohomology is concentrated in degree 2m + 1, equal to H¹_par(C, 𝕃_m) ⊗ Sym^m H¹(A) in the de Rham and p-adic étale realizations (BDP Proposition 2.4), so ε_X H^{2m+2}(X_m) = 0, which is what makes the cycles null-homologous. Its Hodge piece Fil^{m+1} is S_{m+2} ⊗ Sym^m H¹_dR(A), the whole symmetric CM factor (BDP Proposition 2.5); Poincaré duality makes ε_X H^{2m+1}(X_m)(m + 1) self-dual up to ℚ_p(1).
- **Coefficients and models.** The newform and CM coefficient projector selects V_f(r) ⊗ (a CM character line), with the Hecke idempotent's own denominator recorded; the good model of the CM product over O_F is formed from separately supplied models of W_m and A, for finite unramified F and, in the canonical application, p ∤ cNd_K.

**Planets.** Generalized Kuga–Sato variety ([`GH.0/generalized-kuga-sato-variety-and-its-projector`](#n-gh-0-generalized-kuga-sato-variety-and-its-projector)); Projected middle cohomology ([`GH.0/cohomology-of-the-generalized-kuga-sato-variety`](#n-gh-0-cohomology-of-the-generalized-kuga-sato-variety)); Projected Hodge filtration ([`GH.0/projected-hodge-filtration`](#n-gh-0-projected-hodge-filtration)); Coefficient projector ([`GH.0/newform-cm-projector`](#n-gh-0-newform-cm-projector)).

**Still open in this layer.**

- [G1](#gap-1) Higher-weight universal-family export
- [G2](#gap-2) Product realizations and CM good model
- [G18](#gap-18) Suggested interfaces and discriminating geometric tests

*Every target has a declaration node; proof closure awaits the recorded supplier exports and named refinements.*

<a id="n-gh-0-cm-elliptic-curve-and-its-hodge-splitting"></a>
### The CM elliptic curve A and the algebraic splitting of H¹_dR(A)

`GH.0/cm-elliptic-curve-and-its-hodge-splitting` · definition · part GH.0 · review: unverifiable

A CM elliptic curve is an elliptic abelian variety A/H, with H containing the Hilbert class field of the imaginary quadratic K, and a specified isomorphism O_K ≅ End_H(A), normalized so [α]*ω=αω. For F⊇H, H¹_dR(A/F)=Fω⊕Fη, where η lies on the conjugate CM eigenline and ⟨ω,η⟩=1. At an ordinary good split prime this conjugate eigenline is the unit-root line. No good model is inferred from the level N.

**Hypotheses and conventions.**

- The normalization of the O_K-action is on differentials: [α]^*ω = αω. The opposite normalization swaps H^{1,0} and H^{0,1}.
- Existence of A over H with End_H(A) = O_K, and its descent, are HeegnerPointEulerSystems HE.1's and ComplexMultiplicationAndExplicitReciprocity CM.1's.

**Construction.**

1. O_K acts on H¹_dR(A/F) through the two characters α and ᾱ, which are distinct since K is imaginary quadratic. The two eigenlines split the space, and the α-eigenline is Ω¹, because [α]^* acts on differentials by α.
2. Functoriality: morphisms commuting with O_K preserve the eigenlines.
3. Over ℂ, H^{0,1} = conj(Ω¹) is the ᾱ-eigenline, and over ℂ_p for ordinary A the unit-root line is O_K-stable and different from Ω¹.

**API.**

- `TauCeti.GeneralizedHeegner.CMCurve.h10` (characterisation): The identity-character eigenvector ω lies in ker([α]*−α).
- `TauCeti.GeneralizedHeegner.CMCurve.h01` (characterisation): The conjugate-character eigenvector η lies in ker([α]*−ᾱ).
- `TauCeti.GeneralizedHeegner.CMCurve.hodgeSplitting` (equivalence): The two distinct CM eigenlines span the cohomology space and have zero intersection.
- `TauCeti.GeneralizedHeegner.CMCurve.etaOfOmega` (characterisation): Dividing η by ⟨ω,η⟩ gives cup product 1. It is the unique scalar multiple aη with cup product 1; on the one-dimensional conjugate eigenline this gives the unique normalized vector.
- `TauCeti.GeneralizedHeegner.CMCurve.map_eigenvector` (functoriality): A linear realization map commuting with the CM action transports a character eigenvector to an eigenvector with the same character value.

**Unit tests.**

- `TauCeti.GeneralizedHeegner.cmCurve_i_action` (computation): For the ordered CM eigenbasis at K=Q(i), [i]* acts diagonally by i and −i.
- `TauCeti.GeneralizedHeegner.cmCurve_normalization` (characterisation): Scaling ω by a≠0 scales its normalized η by a⁻¹, preserving the cup product 1.
- `TauCeti.GeneralizedHeegner.cmCurve_scalar_endomorphism` (compatibility): Integer multiplication on the CM curve agrees with the existing abelian variety mulBy map.

**Acceptance.**

- A = ℂ/O_K for K = ℚ(i): [i]^* dz = i dz on Ω¹, and [i]^* dz̄ = −i dz̄ on H^{0,1}.

**Used by.**

- [`GH.0/cm-character-decomposition`](#n-gh-0-cm-character-decomposition): Fixes the normalized eigenbasis and prevents a free choice of complementary line.
- [`GH.4/bdp-special-value-formula`](#n-gh-4-bdp-special-value-formula): Tracks the power of a when the CM differential is rescaled.
- [`GH.0/cm-projector-and-symmetric-power`](#n-gh-0-cm-projector-and-symmetric-power)

**Depends on.** other roadmaps: `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent` (CM descent to the canonical tower); `ComplexMultiplicationAndExplicitReciprocity:CM.1` (Elliptic CM and ideal actions). libraries: `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.mulBy`, `mathlib:Submodule.span`.

**Open items.** requests [CM.1](#req-4); gaps [G18](#gap-18).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.CMCurve`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (unverifiable).** BDP §1.4 gives the normalized CM action and both Hodge lines. Added eigenvector naturality and scalar-normalization uniqueness. The i-action example contains no curve or CM action, and the normalization example does not use etaOfOmega; opposite CM normalization cannot be detected. Revise the geometric tests.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §1.4, p. 1051: “Let A be a fixed elliptic curve” — A over H with End_H(A) ≅ O_K.
- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §1.4, (1.4.1), p. 1051: “admits a canonical, functorial algebraic splitting” — The algebraic splitting of H¹_dR(A/F).
- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §1.4, (1.4.2), p. 1052: “denotes the algebraic cup product pairing on de Rham cohomology” — ⟨ω_A, η_A⟩ = 1.

<a id="n-gh-0-cm-projector-and-symmetric-power"></a>
### The projector ε_A on A^m and Lemma 1.8

`GH.0/cm-projector-and-symmetric-power` · construction · part GH.0 · review: unverifiable

For m≥0 let Ξ_m=μ₂^m⋊S_m act on A^m by inversion and permutation, and χ_m be the product of the inversion signs and the permutation sign. Define ε_A=(2^m m!)⁻¹Σ_g χ_m(g)Γ_g as a rational correspondence. Its realization is idempotent and projects H^j(A^m) to Sym^m H¹(A) in degree m and to zero otherwise. The permutation sign cancels the graded Künneth sign; it must not be replaced by unsigned geometric symmetrization.

**Hypotheses and conventions.**

- The denominator 2^m m! must be inverted. ε_A is not in ℤ[Aut(A^m)], so an integral projector needs 2 and m! invertible.
- The sign twist on S_m is essential. By the Koszul rule, geometric permutations act on H¹^{⊗m} with the sign, so the twisted sum is the symmetrization. Without the twist the sum projects to ∧^m H¹, which vanishes for m ≥ 3.
- Only μ_2 ⊂ O_K^× is used. For K = ℚ(i) or ℚ(√−3) the larger unit group gives further characters, which the node cm-character-decomposition records.

**Construction.**

1. Idempotence: j is a character of Ξ_m, so ε_A = (1/|Ξ_m|) Σ j(ξ)ξ is the idempotent of the character j in ℚ[Ξ_m].
2. Künneth: H^*(A^m) = ⊕ H^{i_1} ⊗ … ⊗ H^{i_m}, and [−1] acts on H^i by (−1)^i. So the μ_2^m-part of ε_A kills every summand with some i_k ≠ 1, leaving H¹^{⊗m}.
3. On H¹^{⊗m}, the geometric action of σ ∈ S_m is sgn(σ) times the permutation of tensor factors (odd classes anticommute). The j-twisted average is therefore the symmetrizer, with image Sym^m H¹.
4. Correspondences: ε_A is an element of the ring of correspondences on A^m with ℚ-coefficients, acting on every cohomology theory by functoriality (MotivicEtaleKTheory M.4).

**API.**

- `TauCeti.GeneralizedHeegner.epsA_idem` (relation): ε_A²=ε_A for the graph action of Ξ_m.
- `TauCeti.GeneralizedHeegner.epsA_image` (characterisation): Its range is the χ_m-isotypic subspace of the tensor realization.
- `TauCeti.GeneralizedHeegner.epsA_transpose` (compatibility): The inverse-graph involution fixes ε_A.
- `TauCeti.GeneralizedHeegner.epsA_natural` (functoriality): An equivariant linear map intertwines the signed character average with the same average on the target realization.

**Unit tests.**

- `TauCeti.GeneralizedHeegner.epsA_order` (computation): For m=2 the character average has denominator 8.
- `TauCeti.GeneralizedHeegner.epsA_weight_zero` (degenerate): At m=0 the projector acts as the identity on H⁰(A⁰)=F.
- `TauCeti.GeneralizedHeegner.epsA_koszul` (non-example): A transposition acts with −1 on H¹⊗H¹; multiplying by its character sign therefore selects symmetric tensors.

**Acceptance.**

- m = 2: ε_A H²(A²) = Sym² H¹(A), of dimension 3, while H²(A²) has dimension 6.

**Used by.**

- [`GH.0/cohomology-of-the-generalized-kuga-sato-variety`](#n-gh-0-cohomology-of-the-generalized-kuga-sato-variety): Eliminates all CM-factor cohomology except middle symmetric power.
- [`GH.1/generalized-heegner-cycle`](#n-gh-1-generalized-heegner-cycle): Projects products of isogeny graphs without changing the intended symmetric tensor.
- [`GH.0/cm-character-decomposition`](#n-gh-0-cm-character-decomposition)
- [`GH.0/generalized-kuga-sato-variety-and-its-projector`](#n-gh-0-generalized-kuga-sato-variety-and-its-projector)

**Depends on.** this roadmap: [`GH.0/cm-elliptic-curve-and-its-hodge-splitting`](#n-gh-0-cm-elliptic-curve-and-its-hodge-splitting). other roadmaps: `SchemeAndStackFoundations:SF.5` (Intersection theory and Riemann-Roch). libraries: `mathlib:LinearMap`, `mathlib:LinearMap.range`.

**Open items.** requests [SF.5](#req-15); gaps [G18](#gap-18).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.epsA`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (unverifiable).** BDP (1.4.4) and Lemma 1.8 require the signed permutation projector. Added equivariant-map naturality. The unsigned permutation average passes the displayed cardinality, unique-group and scalar double-minus examples; a genuine tensor/permutation fixture is still required.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §1.4, (1.4.4), p. 1052: “denote the associated idempotent in the rational group ring of” — ε_A = (1/2^r r!) Σ j(ξ)ξ.
- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §1.4, Lemma 1.8, p. 1052: “The image of the projector” — ε_A H^*(A^r) = Sym^r H¹(A), in degree r.
- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §1.4, p. 1052: “classes which are fixed by this action” — Sym^r as the S_r-fixed tensors.

<a id="n-gh-0-cm-character-decomposition"></a>
### The eigenbasis ω_A^jη_A^{m−j} of Sym^m H¹_dR(A) and its O_K-characters

`GH.0/cm-character-decomposition` · theorem · part GH.0 · review: corrected

For 0 ≤ j ≤ m, the classes ω_A^jη_A^{m−j} := ε_A(p_1^*ω_A ∧ … ∧ p_j^*ω_A ∧ p_{j+1}^*η_A ∧ … ∧ p_m^*η_A) form a basis of ε_A H^m_dR(A^m/F) = Sym^m H¹_dR(A/F). The diagonal action of α ∈ O_K on A^m acts on ω_A^jη_A^{m−j} by α^jᾱ^{m−j}. Moreover ω_A^jη_A^{m−j} = (j!(m − j)!/m!) Σ_{|I| = j} p_1^*ϖ_{1,I} ∧ … ∧ p_m^*ϖ_{m,I}, where ϖ_{i,I} = ω_A for i ∈ I and η_A otherwise.

**Hypotheses and conventions.**

- The Hodge type of ω^jη^{m−j} is (j, m − j), and Fil^m Sym^m H¹ is spanned by ω^m.
- Rescaling ω_A by λ multiplies ω^jη^{m−j} by λ^{2j−m}, because η_A scales by λ⁻¹. Formulas of GH.4 depend on this normalization.

**Proof outline.**

1. ε_A applied to a pure tensor of ω's and η's averages over S_m, with the sign twist compensating the Koszul sign. Each subset I with |I| = j arises from j!(m − j)! permutations.
2. The normalized CM eigenbasis gives the usual monomial basis of the symmetric power, of dimension m+1. Its joint algebraic CM characters have distinct bidegrees (j,m−j). Do not claim that their values at every α∉ℤ are distinct: for K=ℚ(i), α=i and m=2 the j=0 and j=2 values coincide.
3. The O_K-action on p_i^*ω is by α and on p_i^*η by ᾱ (node cm-elliptic-curve-and-its-hodge-splitting).

**Acceptance.**

- m = 2: the basis is ω², ωη, η², with characters α², |α|², ᾱ².

**Used by.**

- [`GH.0/newform-cm-projector`](#n-gh-0-newform-cm-projector)
- [`GH.1/character-projected-heegner-class`](#n-gh-1-character-projected-heegner-class)
- [`GH.4/cm-differential-scaling`](#n-gh-4-cm-differential-scaling)

**Depends on.** this roadmap: [`GH.0/cm-projector-and-symmetric-power`](#n-gh-0-cm-projector-and-symmetric-power); [`GH.0/cm-elliptic-curve-and-its-hodge-splitting`](#n-gh-0-cm-elliptic-curve-and-its-hodge-splitting).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.cmCharacterDecomposition`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** Corrected the proof: distinct joint algebraic characters do not mean distinct values at every noninteger α. At K=Q(i), α=i and m=2, the extreme eigenvalues coincide. Added the normalized CM eigenbasis prerequisite; the symmetric-power monomial basis proves independence.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §1.4, (1.4.6), p. 1053: “form a basis of the vector space” — ω^jη^{r−j} form a basis of Sym^r H¹_dR(A).

<a id="n-gh-0-generalized-kuga-sato-variety-and-its-projector"></a>
### The variety X_m = W_m × A^m and the projector ε_X = ε_W ε_A

`GH.0/generalized-kuga-sato-variety-and-its-projector` · construction · planet “Generalized Kuga–Sato variety” · part GH.0 · review: corrected

Over F⊇H form X_m=W_m×_F A^m, dim X_m=2m+1, and ε_X=ε_W ε_A using commuting factor correspondences. ε_W is the imported universal-family projector, including the N-torsion averaging and sign projector. ε_X is self-transpose and is defined over Z[1/(2N m!)] at the level of denominators; this does not assert that X_m itself has a model over Z[1/N].

**Hypotheses and conventions.**

- The denominators are those of ε_W^{(1)} (N^m), ε_W^{(2)} (2^m m!) and ε_A (2^m m!), so ε_X is integral after 2N·m! is inverted. The atlas asks for this record before an integral projector is asserted.
- Characteristic 0 only: the desingularization and smoothness of W_m are used over F ⊇ H of characteristic 0, as imported. The integral model over ℤ[1/N] (Conrad's appendix) is not used here.
- N > 4 makes the universal generalized elliptic curve over X₁(N) exist as a scheme.

**Construction.**

1. X_m is a product of smooth proper F-varieties, so it is smooth and proper of dimension (m + 1) + m.
2. π_m = (W_m → C) ∘ pr_1, whose fibres are those of W_m times A^m.
3. ε_W acts on the first factor and ε_A on the second, so they commute, and both preserve the fibres of π_m.
4. Transpose: the transpose of Σ c_g·g is Σ c_g·g⁻¹, and the coefficient functions of ε_W^{(1)}, ε_W^{(2)} and ε_A are invariant under g ↦ g⁻¹ (j(ξ⁻¹) = j(ξ)), so ε_X^t = ε_X.

**API.**

- `TauCeti.GeneralizedHeegner.epsX_commute` (relation): For commuting factor realizations, interchanging ε_W and ε_A leaves ε_X unchanged. The geometric factor-commutation input comes from their separate factor actions.
- `TauCeti.GeneralizedHeegner.epsX_idem` (relation): The commuting product of the two idempotents is idempotent.
- `TauCeti.GeneralizedHeegner.epsX_factor` (simp): ε_X acts by applying ε_A and then ε_W.
- `TauCeti.GeneralizedHeegner.epsX_denominator` (data): The product-projector denominator is N^m2^{2m}(m!)²; inverting 2N m! clears it.

**Unit tests.**

- `TauCeti.GeneralizedHeegner.X_dim` (computation): At m=2, X has dimension 5 and the graph cycle has codimension 3.
- `TauCeti.GeneralizedHeegner.epsX_weight_zero` (degenerate): With the CM factor trivial, ε_X=ε_W.
- `TauCeti.GeneralizedHeegner.epsX_factor_test` (compatibility): On a supplied tensor-factor realization the action is the composite, in the displayed order.

**Acceptance.**

- m = 0: X_0 = W_0 = C, and ε_X = 1.
- m = 1: X_1 = E × A, of dimension 3, a threefold fibred over X₁(N).

**Used by.**

- [`GH.1/generalized-heegner-cycle`](#n-gh-1-generalized-heegner-cycle): Defines the ambient projected Chow group.
- [`GH.0/self-duality-of-the-projected-cohomology`](#n-gh-0-self-duality-of-the-projected-cohomology): Self-transposition passes Poincaré duality to the image.
- [`GH.0/cohomology-of-the-generalized-kuga-sato-variety`](#n-gh-0-cohomology-of-the-generalized-kuga-sato-variety)
- [`GH.0/cm-product-good-model`](#n-gh-0-cm-product-good-model)
- [`GH.8/weight-zero-cycle`](#n-gh-8-weight-zero-cycle), through its citation of layer GH.0 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.0/cm-projector-and-symmetric-power`](#n-gh-0-cm-projector-and-symmetric-power). other roadmaps: `ModularCurvesPartII:R14.3` (Cohomological realisations and pairings); `SchemeAndStackFoundations:SF.5` (Intersection theory and Riemann-Roch).

**Open items.** requests [R14.3](#req-8), [SF.5](#req-15).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.epsX`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** BDP §2.1–2.2 and the R14.3 request supply the two factor correspondences, with clearing denominator N^m2^{2m}(m!)². The commutation prototype now explicitly assumes commutation of its linear inputs; the geometric fact remains a factor-action theorem. No global model of X is claimed.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §2.2, p. 1060: “Like the Kuga–Sato variety” — X_r = W_r × A^r, fibred over C.
- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §2.2, (2.2.1), p. 1061: “give rise
to commuting idempotents in the ring of correspondences on” — ε_X = ε_W ε_A with commuting factors.
- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §2.1, (2.1.2), p. 1057: “defines a projector in the ring of rational correspondences on Wr” — The projector ε_W.

<a id="n-gh-0-cohomology-of-the-generalized-kuga-sato-variety"></a>
### Projected middle cohomology

`GH.0/cohomology-of-the-generalized-kuga-sato-variety` · theorem · planet “Projected middle cohomology” · part GH.0 · review: verified

For m≥1, ε_X H*_dR(X_m)=ε_X H^{2m+1}_dR(X_m)=H¹_par(C,L_m,∇)⊗Sym^m H¹_dR(A). In the p-adic étale realization, ε_X H^{2m+1}_et(X_m,Fbar,Q_p)≅H¹_par(C_Fbar,𝕃_m)⊗Sym^m H¹_et(A_Fbar,Q_p), Galois-equivariantly. The projector kills every other cohomological degree. In particular ε_X H^{2m+2}(X_m)=0. The Hodge-filtration identification is the separate projected-hodge-filtration theorem.

**Hypotheses and conventions.**

- The imported Scholl realization has ε_W H*(W_m)=H¹_par(C,L_m) in degree m+1. Both product realizations and their correspondence-compatible Künneth isomorphisms are supplied.
- The degree-2m+2 vanishing is the input for GH.1 null-homology; the m=0 divisor uses its degree-zero correction.

**Proof outline.**

1. Apply the supplied de Rham Künneth decomposition for W_m×A^m, respecting both factor projectors.
2. The CM projector kills degrees other than m; the modular projector kills degrees other than m+1. Their surviving tensor summand is therefore in degree 2m+1.
3. Use the rational p-adic étale Künneth export and the same graph actions to obtain the Galois-equivariant identification.

**Acceptance.**

- For m=1 the projected H³ of the universal elliptic surface times A is H¹_par(C,L₁)⊗H¹(A), of dimension 4 dim S₃(Γ₁(N)).

**Used by.**

- [`GH.0/projected-hodge-filtration`](#n-gh-0-projected-hodge-filtration)
- [`GH.0/self-duality-of-the-projected-cohomology`](#n-gh-0-self-duality-of-the-projected-cohomology)
- [`GH.1/homological-triviality-of-generalized-heegner-cycles`](#n-gh-1-homological-triviality-of-generalized-heegner-cycles)

**Depends on.** this roadmap: [`GH.0/generalized-kuga-sato-variety-and-its-projector`](#n-gh-0-generalized-kuga-sato-variety-and-its-projector). other roadmaps: `ModularCurvesPartII:R14.3` (Cohomological realisations and pairings); `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality` (ℓ-adic and rational Poincaré duality, with the integral derived form kept separate); `DerivedDeRhamCohomology:DD.2` (Derived de Rham and the Hodge filtration); `EtaleDualityAndPerverseSheaves:EDC.6` (Integral, analytic and diamond comparison of operations).

**Open items.** requests [DD.2](#req-5), [EDC.6](#req-6), [R14.3](#req-8); gaps [G2](#gap-2).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.epsX_middle`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** BDP Proposition 2.4 and Lemma 1.8 give concentration in degree 2m+1 and the parabolic tensor factor. Rational étale and filtered de Rham Künneth are precise EDC.6/DD.2 requests; the modular higher-fiber-power export remains a gap.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §2.2, Proposition 2.4, p. 1061: “The image of the projector” — ε_X H^*_dR(X_r) = H¹_par(C, L_r, ∇) ⊗ Sym^r H¹_dR(A).
- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §2.2, proof of Proposition 2.4, p. 1062: “This follows directly from Lemmas 1.8 and 2.2 in light of the Künneth decomposition” — Proof via Künneth.

<a id="n-gh-0-projected-hodge-filtration"></a>
### Projected Hodge filtration

`GH.0/projected-hodge-filtration` · theorem · planet “Projected Hodge filtration” · part GH.0 · review: verified

For m≥1 and X_m/F with its supplied de Rham realization, f⊗α↦ω_f∧α identifies S_{m+2}(Γ₁(N),F)⊗Sym^m H¹_dR(A/F) with Fil^{m+1}(ε_X H^{2m+1}_dR(X_m/F)). The entire symmetric CM factor occurs, not only its holomorphic line. This is the filtration piece used as the domain of the p-adic Abel–Jacobi dual functional.

**Hypotheses and conventions.**

- The modular projected factor has Hodge types (m+1,0) and (0,m+1), with Fil¹=Fil^{m+1}=S_{m+2}; the CM symmetric factor has Hodge filtration in degrees 0 through m.
- Use the field of definition and filtered de Rham product export of the preceding realization theorem.

**Proof outline.**

1. Import the modular Hodge identification from R14.3 and the filtered Künneth theorem from DD.2.
2. The holomorphic modular summand of filtration m+1 tensored with Fil⁰ of the CM factor contributes the stated whole tensor. The antiholomorphic modular summand has filtration zero, while the CM factor has filtration at most m, so it contributes nothing to Fil^{m+1}.
3. Identify the surviving tensor by the wedge map, preserving the specified differential normalization.

**Acceptance.**

- At m=1 the filtration has dimension 2 dim S₃, and contains both ω_f⊗ω_A and ω_f⊗η_A; retaining only ω_A gives half the required space.

**Used by.**

- [`GH.1/p-adic-abel-jacobi-map`](#n-gh-1-p-adic-abel-jacobi-map)

**Depends on.** this roadmap: [`GH.0/cohomology-of-the-generalized-kuga-sato-variety`](#n-gh-0-cohomology-of-the-generalized-kuga-sato-variety). other roadmaps: `ModularCurvesPartII:R14.3` (Cohomological realisations and pairings); `DerivedDeRhamCohomology:DD.2` (Derived de Rham and the Hodge filtration).

**Open items.** requests [DD.2](#req-5), [R14.3](#req-8); gaps [G2](#gap-2).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH0`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.projectedHodgeFiltration`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** BDP Proposition 2.5 gives the full CM symmetric factor in Fil^{m+1}, rather than only its holomorphic line. The separate filtration theorem is the correct input to the AJ quotient.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §2.2, Proposition 2.5, p. 1062: “induces an identification” — The wedge map identifies the cusp-form tensor with Fil^{m+1} of the projected middle cohomology.

<a id="n-gh-0-self-duality-of-the-projected-cohomology"></a>
### Self-duality of ε_X H^{2m+1}(X_m)(m + 1)

`GH.0/self-duality-of-the-projected-cohomology` · theorem · part GH.0 · review: corrected

Poincaré duality on the smooth proper (2m + 1)-dimensional X_m restricts to a perfect pairing ε_X H^{2m+1}(X_m) × ε_X H^{2m+1}(X_m) → H^{4m+2}(X_m) ≅ ℚ_p(−2m − 1) in étale cohomology (and into F in de Rham). So V := ε_X H^{2m+1}_et(X_{m,F̄}, ℚ_p)(m + 1) is self-dual up to ℚ_p(1): V ≅ V^∨(1). The pairing is the one induced by (2.2.3) on L_{m,m} = L_m ⊗ Sym^m H¹(A). V is the coefficient representation of the generalized Heegner classes, and its f-isotypic part is V_f ⊗ Sym^m H¹(A)(m + 1).

**Hypotheses and conventions.**

- ε_X^t = ε_X (node generalized-kuga-sato-variety-and-its-projector) is what makes the pairing restrict to the image.
- The twist (m + 1) is the self-dual twist of a weight 2m + 1 representation: V is pure of weight −1 at good primes.
- The f-isotypic identification uses the Hecke action on H¹_par(C, 𝕃_m) and the newform f's Galois representation V_f, imported from ModularCurvesPartII R14.3.

**Proof outline.**

1. Poincaré duality on X_m pairs H^{2m+1} with itself into H^{4m+2} = ℚ_p(−2m − 1) (EtaleDualityAndPerverseSheaves EDC.2).
2. For correspondences, ⟨εx, y⟩ = ⟨x, ε^t y⟩, and ε_X^t = ε_X. So ε_X H^{2m+1} is orthogonal to (1 − ε_X)H^{2m+1}, and the pairing restricts to a perfect pairing on ε_X H^{2m+1}.
3. Twisting by (m + 1) turns the target ℚ_p(−2m − 1) into ℚ_p(1).
4. Under node cohomology-of-the-generalized-kuga-sato-variety, the pairing is the tensor product of the pairing on H¹_par(C, L_m) and the one on Sym^m H¹(A), which is (2.2.3).

**Acceptance.**

- m = 0: V = H¹_par(C)(1) = V_p J₁(N), which is self-dual through the Weil pairing.

**Used by.**

- [`GH.0/newform-cm-projector`](#n-gh-0-newform-cm-projector)

**Depends on.** this roadmap: [`GH.0/cohomology-of-the-generalized-kuga-sato-variety`](#n-gh-0-cohomology-of-the-generalized-kuga-sato-variety); [`GH.0/generalized-kuga-sato-variety-and-its-projector`](#n-gh-0-generalized-kuga-sato-variety-and-its-projector). other roadmaps: `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality` (ℓ-adic and rational Poincaré duality, with the integral derived form kept separate).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.projectedSelfDuality`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** Replaced the irrelevant Proposition 2.7 citation by BDP §3.4 projected Poincaré duality and exact annihilators. Added the self-transpose projector prerequisite. EDC.2 rational duality matches the Tate target Q_p(1) after twisting.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §2.2, (2.2.3), p. 1061: “is equipped with the self-duality” — The self-duality of L_{r,r} from Poincaré duality on the fibres.
- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §3.4, (3.4.1)–(3.4.2), p.1070: “are exact annihilators of each other” — Projected Poincaré duality and the annihilator filtration, rather than Proposition 2.7 (homological triviality).

<a id="n-gh-0-newform-cm-projector"></a>
### Newform and CM coefficient projector

`GH.0/newform-cm-projector` · construction · planet “Coefficient projector” · part GH.0 · review: corrected

For a normalized eigenform f of weight k=m+2, take the imported f-isotypic Hecke summand of ε_W cohomology and tensor the specified CM character line in Sym^m H¹(A). Extend the coefficient field enough to split both actions. Choose an integral stable lattice only after accounting for the denominators of ε_W, ε_A and the Hecke idempotent; p∤2N m! alone does not make the Hecke idempotent integral. The Tate twist is the cohomological self-dual one, V_f(r) when k=2r.

**Hypotheses and conventions.**

- N>4 for the chosen fine Γ₁ model; k≥2; supplied Hecke eigensystem and CM realization
- At original source levels N≤4, use the requested R14.3 fine-level descent; the displayed N>4 condition belongs to the chosen model, not to CH’s source theorem.

**Construction.**

1. Import the Hecke action and f projector from R14.3.
2. Apply the explicit CM character decomposition, record localization denominators, and use Poincaré duality for the twist.

**API.**

- `TauCeti.GeneralizedHeegner.coefficientProjector_factor` (simp): The modular and CM projections compose.
- `TauCeti.GeneralizedHeegner.coefficientProjector_twist` (compatibility): For r≥1, the fiber-power index 2r−2 gives weight 2r and the self-dual modular twist V_f(r).
- `TauCeti.GeneralizedHeegner.coefficientProjector_lattice` (data): A recorded integral lattice is preserved by the composite only after both factor projectors preserve that lattice.

**Unit tests.**

- `TauCeti.GeneralizedHeegner.coefficientProjector_identity` (degenerate): After restricting the coefficient space to the trivial CM character summand, its identity projector leaves the f summand. The trivial-character projector on the whole symmetric power need not be the identity.
- `TauCeti.GeneralizedHeegner.coefficientProjector_order` (compatibility): On commuting projectors the order of projection does not matter.
- `TauCeti.GeneralizedHeegner.coefficientProjector_denominator` (non-example): A rational idempotent with 1/2 entries need not preserve an integral lattice: the average of (1,0) and (0,1) is (1/2,1/2).

**Acceptance.**

- A congruence prime for f can divide the Hecke denominator even if p avoids 2N m!.

**Used by.**

- [`GH.1/integral-abel-jacobi-comparison`](#n-gh-1-integral-abel-jacobi-comparison): Fixes the coefficient lattice and denominator assumptions before integral descent.
- [`GH.5/longo-vigni-admissible-triple`](#n-gh-5-longo-vigni-admissible-triple)
- [`GH.7/family-representation-specialization`](#n-gh-7-family-representation-specialization)
- [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export), through its citation of layer GH.0 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/weight-zero-cycle`](#n-gh-8-weight-zero-cycle), through its citation of layer GH.0 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.0/cm-character-decomposition`](#n-gh-0-cm-character-decomposition); [`GH.0/self-duality-of-the-projected-cohomology`](#n-gh-0-self-duality-of-the-projected-cohomology). other roadmaps: `ModularCurvesPartII:R14.3` (Cohomological realisations and pairings).

**Open items.** requests [R14.3](#req-8); gaps [G1](#gap-1).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH0`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.coefficientProjector`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** Clarified that identity for the trivial CM character is on its selected component. Higher-weight modular/lattice data are requested from R14.3. Added auxiliary fine-level descent for source levels N≤4; N>4 is a model condition, not CH (H).

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §4.2, pp.14–15: “where T is the Galois stable OF -lattice in Vf (r) in [Nek92, §3], and S r−1 (A) is the GHK -module
                                      S r−1 (A) := Sym2r−2 Tp (A)(1 − r)
with Tp” — Names the lattice and the self-dual Vf(r) representation.

<a id="n-gh-0-cm-product-good-model"></a>
### Good model comparison for the CM product

`GH.0/cm-product-good-model` · comparison · part GH.0 · review: corrected

If W_m and A have smooth proper models over O_F, their product has a smooth proper model over O_F. For BDP §3 take F/Q_p finite unramified, p∤N, and a chosen good CM model; in their canonical conductor-c application also p∤c d_K. An arbitrary CM twist is not made good by p∤N. The model of W_m over Z[1/N] supplied by Conrad belongs to R14.3; it is not a global model of X_m.

**Hypotheses and conventions.**

- Both factors have supplied models; F is the local field of the chosen comparison.
- Smooth/proper product stability is already in Mathlib; this node exports the chosen arithmetic models and local comparison data to the cycle construction, rather than re-planning that stability theorem.

**Proof outline.**

1. Base change the universal-family model.
2. Use stability of smoothness and properness under products and the independently supplied model of A.

**Acceptance.**

- At p=5 the CM curve y²=x³−25x has bad reduction although 5∤7; the level criterion cannot apply to its CM factor.
- Positive product-model test: at p=5 the CM curve y²=x³−x has discriminant 64, a unit in Z₅. With the supplied smooth proper W_m model for level 13, the product after a common finite unramified base change is smooth proper. Smoothness and properness must be checked on both supplied factors.

**Used by.**

- [`GH.1/p-adic-abel-jacobi-map`](#n-gh-1-p-adic-abel-jacobi-map)
- [`GH.1/parabolic-residue-pairing`](#n-gh-1-parabolic-residue-pairing)
- [`GH.1/syntomic-abel-jacobi-comparison`](#n-gh-1-syntomic-abel-jacobi-comparison)
- [`GH.2/finite-local-abel-jacobi-class`](#n-gh-2-finite-local-abel-jacobi-class)

**Depends on.** this roadmap: [`GH.0/generalized-kuga-sato-variety-and-its-projector`](#n-gh-0-generalized-kuga-sato-variety-and-its-projector). other roadmaps: `ModularCurvesPartII:R14.3` (Cohomological realisations and pairings); `SchemeAndStackFoundations:SF.2` (Sites and scheme cohomology). libraries: `mathlib:AlgebraicGeometry.Smooth`, `mathlib:AlgebraicGeometry.IsProper`.

**Open items.** requests [R14.3](#req-8), [SF.2](#req-14); gaps [G2](#gap-2).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH0`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.cmProductGoodModel`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** Corrected the local source page to 1067. Separate good models of W and A, finite unramified F and p∤cNd_K in the canonical application are retained. The native scheme-property baseline is used, rather than re-planned.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §3.2, p.1067; appendix introduction, p.1139: “The extension F is a finite unramified extension of Qp .
(2)       The varieties C and Xr over F extend to smooth proper models C and Xr
          over OF .
If ' bel” — The finite unramified local comparison requires the smooth models.

<a id="layer-gh-1"></a>
## GH.1 — Algebraic cycles and Abel–Jacobi realizations

*Part GH.0. Coverage: planned. 15 nodes, 6 planets.*

The layer constructs the cycles and their two realizations, and computes the p-adic one.

- **Cycles.** Marked isogenies (φ, A′) of conductor c with ker φ ∩ A[𝔑] = 0 give points P_{A′} of C, and the projected graph Δ_φ = ε_X(Graph(φ)^m) is a codimension-(m + 1) cycle on the fibre of X_m over P_{A′} (BDP §2.3). It is defined over H̃·H_c (BDP Remark 2.6, by the CM main theorem, not by invariance), and it is homologically trivial for m ≥ 1 because ε_X H^{2m+2}(X_m) = 0 (BDP Proposition 2.7); for m = 0 the cycle is P_{A′} − ∞.
- **Étale and p-adic Abel–Jacobi maps.** AJ_et pulls back the Gysin sequence of the fibre along the cycle class and identifies Ext¹ with continuous H¹ (BDP Definition 3.1); the rational Gysin and Ext¹ = H¹ inputs are requested from EtaleDualityAndPerverseSheaves EDC.6 and ArithmeticGaloisDuality R02.1. Over finite unramified F with good models the class is crystalline, BDP Proposition 3.5 classifies the filtered Frobenius extension by "holomorphic minus Frobenius" modulo Fil⁰, and duality turns this into AJ_F, a functional on S_{m+2} ⊗ Sym^m H¹_dR(A). The integral comparison keeps the lattice and projector denominators; CH's character-projected class z_{f,χ,c} and its weighted corestriction z_{f,χ} use the full symmetric power of T_p(Res A), not the induced module printed in CH §4.4 (source issue E7).
- **Coleman's computation.** Parabolic classes are those with vanishing residues, and their pairing is a sum of residues of local primitives (BDP Propositions 3.9–3.10); the Coleman primitive F_f of ω_f is normalized by a Frobenius annihilator. The Coleman Abel–Jacobi formula evaluates AJ_F(Δ_φ) on ω_A^jη_A^{m−j} as d^j G_j(A′, t′, ω′) (BDP Propositions 3.18, 3.21, Lemma 3.22), and the depleted components are j! θ^{−1−j} f♭ (BDP Proposition 3.24). Two comparisons stay open: the higher-dimensional syntomic regulator (requested from PadicHodgeRegulators D.2) and the comparison with classical Heegner cycles (BDP 2017 Proposition 4.1.2, not read).

**Planets.** Generalized Heegner cycle ([`GH.1/generalized-heegner-cycle`](#n-gh-1-generalized-heegner-cycle)); Étale Abel–Jacobi map ([`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map)); p-adic Abel–Jacobi map ([`GH.1/p-adic-abel-jacobi-map`](#n-gh-1-p-adic-abel-jacobi-map)); Character-projected Heegner class ([`GH.1/character-projected-heegner-class`](#n-gh-1-character-projected-heegner-class)); Coleman primitive ([`GH.1/coleman-primitive`](#n-gh-1-coleman-primitive)); Coleman Abel–Jacobi formula ([`GH.1/coleman-abel-jacobi-formula`](#n-gh-1-coleman-abel-jacobi-formula)).

**Still open in this layer.**

- [G1](#gap-1) Higher-weight universal-family export
- [G3](#gap-3) Integral descent and CM character coefficient adapter
- [G4](#gap-4) Geometric syntomic regulator comparison
- [G5](#gap-5) Classical-cycle source comparison
- [G6](#gap-6) Wide-open residue and Coleman comparison export
- [G17](#gap-17) Rational Gysin and continuous extension adapter
- [G18](#gap-18) Suggested interfaces and discriminating geometric tests

*Every target has a declaration node; proof closure awaits the recorded supplier exports and named refinements.*

<a id="n-gh-1-isogenies-of-conductor-c-prime-to-n"></a>
### The sets Isog_c^𝔑(A) of CM isogenies of conductor c with kernel prime to A[𝔑]

`GH.1/isogenies-of-conductor-c-prime-to-n` · definition · part GH.0 · review: unverifiable

Assume the Heegner hypothesis: there is an ideal 𝔑 ⊂ O_K with O_K/𝔑 ≅ ℤ/Nℤ. Fix A with End(A) = O_K and a Γ₁(N)-level structure t_A ∈ A[𝔑] over the field H̃ ⊇ H over which A[𝔑] becomes constant. Isog(A) is the set of isomorphism classes of pairs (φ, A′) with φ : A → A′ an isogeny over K̄. (φ, A′) has conductor c if End(A′) = O_c = ℤ + cO_K. Isog^𝔑(A) consists of the pairs with ker φ ∩ A[𝔑] = 0, and Isog_c^𝔑(A) = Isog_c(A) ∩ Isog^𝔑(A). For (φ, A′) ∈ Isog^𝔑(A), (A′, φ(t_A)) is a Γ₁(N)-structure and determines a point P_{A′} of C = X₁(N). The semigroup P(O_c) of invertible integral O_c-ideals relatively prime to 𝔑_c=𝔑∩O_c acts on Isog_c^𝔑(A) by 𝔞 ⋆ (φ, A′) = (φ_𝔞φ, A′/A′[𝔞]).

**Hypotheses and conventions.**

- The kernel condition ker φ ∩ A[𝔑] = 0 makes φ(t_A) a point of exact order N.
- The conductor c is determined by End(A′), an order of K.

**Construction.**

1. The endomorphism ring of an isogenous curve is an order of K, hence O_c for a unique c ≥ 1.
2. φ is injective on A[𝔑] and t_A has order N, so φ(t_A) has order N.
3. For an invertible integral O_c-ideal 𝔞 relatively prime to 𝔑_c, the quotient isogeny φ_𝔞 preserves the marked cyclic level subgroup and the target endomorphism order. Import the ideal-action theorem from CM.1, including exceptional unit fields; primality to the whole integer cN is not the definition of P(O_c).

**API.**

- `TauCeti.GeneralizedHeegner.IsogPair.conductor` (data): The target endomorphism order is O_c; the conductor is preserved under isomorphism of marked targets.
- `TauCeti.GeneralizedHeegner.IsogPair.level` (projection): The kernel condition ker φ∩A[𝔑]=0 transports the marked point of exact order N to a point of exact order N.
- `TauCeti.GeneralizedHeegner.IsogPair.idealAction` (functoriality): The ideal-action transports the isogeny pair through the commutative CM reciprocity square.

**Unit tests.**

- `TauCeti.GeneralizedHeegner.isog_identity_conductor` (degenerate): The identity isogeny of A has target order O_K, conductor 1.
- `TauCeti.GeneralizedHeegner.isog_level_failure` (non-example): Multiplication by N kills an N-torsion level point and cannot satisfy the prime-to-N condition.
- `TauCeti.GeneralizedHeegner.isog_degree_multiplicativity` (compatibility): Composing finite isogenies multiplies their degree, in agreement with the elliptic-curve isogeny degree API supplied upstream.

**Acceptance.**

- K = ℚ(i), N = 5 = (2 + i)(2 − i): 𝔑 = (2 + i), with O_K/𝔑 ≅ ℤ/5ℤ.
- For A = ℂ/O_K, z ↦ cz defines an isogeny ℂ/O_K → ℂ/O_c with cyclic kernel c⁻¹O_c/O_K ≅ ℤ/cℤ, and End(ℂ/O_c) = O_c: a pair of conductor c.

**Used by.**

- [`GH.1/generalized-heegner-cycle`](#n-gh-1-generalized-heegner-cycle): Specifies the graph in the fiber over the transported CM pair.
- [`GH.2/cycle-norm-relations`](#n-gh-2-cycle-norm-relations): Conductor-changing ideal isogenies index Hecke neighbors.

**Depends on.** other roadmaps: `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent` (CM descent to the canonical tower); `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients` (Ring-class tower and finite Galois quotients); `ComplexMultiplicationAndExplicitReciprocity:CM.1` (Elliptic CM and ideal actions). libraries: `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`.

**Open items.** requests [CM.1](#req-4); gaps [G18](#gap-18).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.IsogPair`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (unverifiable).** Corrected ker φ∩A[𝔑]=0, the marked ideal notation and the invertible-ideal semigroup prime to 𝔑∩O_c. The native identity test checks a morphism, not conductor 1; the degree test takes three unrelated degree functions. Neither verifies the promised conductor/degree contract.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §1.4, Assumption 1.9, p. 1053: “There is an ideal N of OK of norm N such that” — The Heegner hypothesis.
- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §1.4, p. 1053: “is said to be of conductor c if” — Conductor of a pair (φ, A′).
- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §1.4, p. 1054: “is an isogeny whose kernel intersects” — Isog^𝔑(A): kernel meets A[𝔑] trivially.

<a id="n-gh-1-generalized-heegner-cycle"></a>
### The generalized Heegner cycle Δ_φ = ε_X Υ_φ

`GH.1/generalized-heegner-cycle` · construction · planet “Generalized Heegner cycle” · part GH.0 · review: corrected

For (φ, A′) ∈ Isog^𝔑(A), the pair (A′, φ(t_A)) gives an embedding ι_{A′} : (A′)^m → W_m onto the fibre of W_m over P_{A′}. Let Υ_φ be the image of Graph(φ)^m ⊂ (A × A′)^m ≅ (A′)^m × A^m in X_m = W_m × A^m under ι_{A′} × id. It is a codimension-(m + 1) cycle. The generalized Heegner cycle is Δ_φ := ε_X Υ_φ ∈ CH^{m+1}(X_m)_ℚ, supported on the fibre π_m^{−1}(P_{A′}) ≅ (A′)^m × A^m. For m = 0, Δ_φ is the CM point P_{A′} of C, and it is replaced by P_{A′} − ∞ for a cusp ∞.

**Hypotheses and conventions.**

- The rational correspondence ε_X has clearing denominator N^m2^{2m}(m!)², the product of the W_m and A^m averaging denominators. This scalar (or an explicitly justified multiple) clears its graph-cycle denominators; (2N·m!)² need not do so. Additional f-projector and integral-lattice denominators belong to the separate coefficient comparison.
- Graph(φ)^m has dimension m in the 2m-dimensional fibre, so it has codimension m+1 in X_m of dimension 2m+1.

**Construction.**

1. ι_{A′} identifies (A′)^m with the fibre of the fibre-power E^m over P_{A′}, which lies in the smooth locus of W_m since P_{A′} is not a cusp.
2. Graph(φ) ⊂ A × A′ is a curve. Its m-th power is an m-dimensional subvariety of (A × A′)^m, reordered as (A′)^m × A^m.
3. Apply the correspondence ε_X (GH.0) on Chow groups with ℚ-coefficients (SchemeAndStackFoundations SF.5). ε_X preserves the fibres of π_m, so the support stays in π_m^{−1}(P_{A′}).

**API.**

- `TauCeti.GeneralizedHeegner.gHC_codim` (data): The m-dimensional graph product in X_m of dimension 2m+1 has codimension m+1.
- `TauCeti.GeneralizedHeegner.gHC_projector` (characterisation): ε_X fixes Δ_φ.
- `TauCeti.GeneralizedHeegner.gHC_rational_equivalence` (compatibility): Rationally equivalent graph representatives give the same cycle class.
- `TauCeti.GeneralizedHeegner.gHC_baseChange` (functoriality): Base change commutes with projection when graph correspondences and the projector are transported.

**Unit tests.**

- `TauCeti.GeneralizedHeegner.upsilon_codim` (computation): At m=2 the graph has dimension 2 and codimension 3 in X₂.
- `TauCeti.GeneralizedHeegner.gHC_weight_zero` (degenerate): At m=0 replace the point by point minus a chosen cusp; its degree is zero.
- `TauCeti.GeneralizedHeegner.gHC_projected_test` (characterisation): An idempotent ε fixes gHC(ε,graph), and gHC(id,graph)=graph. Together these exclude both an unprojected graph and the identically zero construction (take a nonzero graph for the identity fixture).

**Acceptance.**

- m = 1: Υ_φ = Graph(φ) ⊂ A′ × A = the fibre of E × A over P_{A′}, a curve in the threefold X_1.

**Used by.**

- [`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map): Provides the null-homologous Chow input to the Gysin extension.
- [`GH.4/bdp-special-value-formula`](#n-gh-4-bdp-special-value-formula): Provides the isogeny-indexed cycle whose Abel–Jacobi image occurs in the formula.
- [`GH.1/field-of-definition-of-generalized-heegner-cycles`](#n-gh-1-field-of-definition-of-generalized-heegner-cycles)
- [`GH.1/homological-triviality-of-generalized-heegner-cycles`](#n-gh-1-homological-triviality-of-generalized-heegner-cycles)
- [`GH.8/weight-zero-cycle`](#n-gh-8-weight-zero-cycle), through its citation of layer GH.1 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.0/generalized-kuga-sato-variety-and-its-projector`](#n-gh-0-generalized-kuga-sato-variety-and-its-projector); [`GH.1/isogenies-of-conductor-c-prime-to-n`](#n-gh-1-isogenies-of-conductor-c-prime-to-n). other roadmaps: `SchemeAndStackFoundations:SF.5` (Intersection theory and Riemann-Roch).

**Open items.** requests [SF.5](#req-15).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.gHC`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** Corrected the clearing denominator to N^m2^{2m}(m!)², the dimension indices and SF.5 ownership. Strengthened the projected test with gHC(id,g)=g, which detects the identically zero construction as well as an unprojected graph. The geometric graph and Chow carrier remain supplied.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §2.3, p. 1062: “We associate to any” — The cycle Υ_φ = Graph(φ)^r.
- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §2.3, p. 1063: “is supported on the fiber” — Δ_φ = ε_X Υ_φ is supported on the fibre over P_{A′}, in CH^{r+1}(X_r)_ℚ.

<a id="n-gh-1-field-of-definition-of-generalized-heegner-cycles"></a>
### BDP Remark 2.6: the field of definition of Δ_φ

`GH.1/field-of-definition-of-generalized-heegner-cycles` · theorem · part GH.0 · review: corrected

If (φ, A′) ∈ Isog_c^𝔑(A), then Δ_φ is defined over the compositum H̃·H_c of the abelian extension H̃/K over which (A, t_A) is defined with the ring class field H_c of conductor c. So the Δ_φ are defined over abelian extensions of K.

**Hypotheses and conventions.**

- The CM main theorem supplies descent of the marked pair to H̃·H_c; use the requested general CM.1 export when HE.1’s restricted unit-field hypotheses do not apply.

**Proof outline.**

1. The CM main theorem makes (A′, φ(t_A)) and φ defined over H̃·H_c for (φ, A′) of conductor c (HE.1 under its hypotheses, otherwise the CM.1 request).
2. W_m, A and ε_X are defined over H (GH.0), so ι_{A′}, Υ_φ and Δ_φ are defined over H̃·H_c.

**Acceptance.**

- c = 1: Δ_φ is defined over H̃, the field of definition of A[𝔑].

**Depends on.** this roadmap: [`GH.1/generalized-heegner-cycle`](#n-gh-1-generalized-heegner-cycle). other roadmaps: `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent` (CM descent to the canonical tower); `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients` (Ring-class tower and finite Galois quotients); `ComplexMultiplicationAndExplicitReciprocity:CM.1` (Elliptic CM and ideal actions).

**Open items.** requests [CM.1](#req-4).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.gHC_descent`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** BDP Remark 2.6 gives H̃·H_c. Added the general CM.1 descent request beyond HE.1’s restricted unit fields, and corrected the marked-ideal notation. No descent from invariance alone is used.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §2.3, Remark 2.6, p. 1063: “defined over abelian extensions of K” — Δ_φ is defined over H̃·H_c.

<a id="n-gh-1-homological-triviality-of-generalized-heegner-cycles"></a>
### BDP Proposition 2.7: Δ_φ is homologically trivial

`GH.1/homological-triviality-of-generalized-heegner-cycles` · theorem · part GH.0 · review: corrected

For m ≥ 1, the cycle class of Δ_φ in ε_X H^{2m+2}(X_m) vanishes in every cohomology theory (de Rham, étale, Betti), so Δ_φ ∈ CH^{m+1}(X_m)_{0,ℚ}. For m = 0, P_{A′} − ∞ is homologically trivial.

**Hypotheses and conventions.**

- The vanishing of ε_X H^{2m+2}(X_m) is the only input for m ≥ 1.
- Cycle class maps in the claimed realizations commute with correspondences. The rational étale passage from finite Gysin/cycle-class maps is part of the EDC.6 request; filtered de Rham compatibility is requested from DD.2. Betti compatibility requires the corresponding classical realization and is not inferred from torsion étale purity.

**Proof outline.**

1. cl(Δ_φ) = cl(ε_X Υ_φ) = ε_X cl(Υ_φ) ∈ ε_X H^{2m+2}(X_m) (requested rational EDC.6 and de Rham DD.2 correspondence compatibilities, with a separate Betti realization comparison).
2. ε_X H^{2m+2}(X_m) = 0 for m ≥ 1 (GH.0/cohomology-of-the-generalized-kuga-sato-variety).
3. m = 0: a degree-zero divisor on a curve is homologically trivial.

**Acceptance.**

- m = 1: cl(Δ_φ) ∈ ε_X H⁴(E × A) = 0.

**Used by.**

- [`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map)
- [`GH.8/weight-zero-cycle`](#n-gh-8-weight-zero-cycle), through its citation of layer GH.1 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.0/cohomology-of-the-generalized-kuga-sato-variety`](#n-gh-0-cohomology-of-the-generalized-kuga-sato-variety); [`GH.1/generalized-heegner-cycle`](#n-gh-1-generalized-heegner-cycle). other roadmaps: `EtaleDualityAndPerverseSheaves:EDC.6` (Integral, analytic and diamond comparison of operations); `DerivedDeRhamCohomology:DD.2` (Derived de Rham and the Hodge filtration).

**Open items.** requests [DD.2](#req-5), [EDC.6](#req-6); gaps [G17](#gap-17).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.gHC_homologically_trivial`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** Corrected m/r indices and added rational étale/de Rham cycle-class compatibility prerequisites. The zero projected cohomology proves triviality; the Betti realization compatibility is explicitly a gap rather than a consequence of torsion purity.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §2.3, Proposition 2.7, p. 1063: “is homologically trivial on” — Δ_φ is homologically trivial.

<a id="n-gh-1-etale-abel-jacobi-map"></a>
### BDP Definition 3.1: the étale Abel–Jacobi map on ε_X-cycles supported on a fibre

`GH.1/etale-abel-jacobi-map` · construction · planet “Étale Abel–Jacobi map” · part GH.0 · review: corrected

For X_m/F and V=ε_XH_et^{2m+1}(X̄_m,Q_p)(m+1), the étale Abel–Jacobi map sends a projected null-homologous codimension m+1 cycle to H¹(F,V). Use the Gysin exact sequence for U=X minus its support, pull back along its cycle class in the residue term, then identify Ext¹_G(Q_p,V) with H¹(F,V). It is independent of support and representative, with restriction, proper pushforward and correspondence equivariance. For m=0 the degree-zero cusp correction is required.

**Hypotheses and conventions.**

- The exactness uses m ≥ 1: ε_X H^{2m−1}(X_P)(m) = 0, and ε_X H^{2m}(X_P)(m)^0 = ε_X H^{2m}(X_P)(m) because ε_X H^{2m+2}(X_m) = 0.
- The target is rational continuous Galois cohomology. Its Gysin sequence and Ext¹-to-H¹ identification, including support/rational-equivalence independence, are explicit EDC.6, R02.1 and SF.5 requests. The integral lattice and projector denominators are the separate integral-abel-jacobi-comparison node.

**Construction.**

1. Gysin sequence for the smooth divisor X_P ⊂ X_m with complement X_m^♮, twisted by (m + 1) (finite-coefficient EDC.3 followed by the requested EDC.6 rational passage).
2. Apply ε_X, which preserves X_P and X_m^♮ because it preserves the fibres of π_m. Then ε_X H^{2m−1}(X_P) = 0 (the ε_W part of the cohomology of a single fibre lives in degree m), and ε_X H^{2m+2}(X_m) = 0, giving the short exact sequence.
3. cl_P(Δ) ∈ ε_X H^{2m}(X̄_P)(m). Pull back along the map sending 1 to it; the class in Ext¹ = H¹ of Galois cohomology (requested ArithmeticGaloisDuality R02.1 continuous-representation Ext/H¹ comparison) is AJ^et_F(Δ).
4. For support enlargement and rational-equivalence independence, use the requested rational Gysin compatibility and Chow-cycle Abel–Jacobi comparison. BDP Remark 3.2 cites Nekovář Proposition II.2.4; compact inflation–restriction alone does not prove this comparison.

**API.**

- `TauCeti.GeneralizedHeegner.ajEt_add` (simp): The map is additive on projected null-homologous cycles.
- `TauCeti.GeneralizedHeegner.ajEt_correspondence` (compatibility): A correspondence acts compatibly on cycles and the coefficient representation.
- `TauCeti.GeneralizedHeegner.ajEt_restriction` (functoriality): Restriction to F′ carries AJ_F(Δ) to AJ_F′(Δ_F′).
- `TauCeti.GeneralizedHeegner.ajEt_extension` (characterisation): The cocycle is g↦g·lift(1)−lift(1), and changing the lift adds a coboundary.

**Unit tests.**

- `TauCeti.GeneralizedHeegner.ajEt_zero` (degenerate): The zero cycle gives the split extension and the zero cohomology class.
- `TauCeti.GeneralizedHeegner.ajEt_lift_change` (characterisation): Changing the lift by b adds precisely the coboundary g·b−b, with this sign.
- `TauCeti.GeneralizedHeegner.ajEt_weight_zero` (compatibility): On X₀ the degree-zero divisor map agrees with Jacobian Kummer under the imported Abel–Jacobi comparison.

**Acceptance.**

- m = 0 analogue: for P − ∞ on a curve, AJ^et is the Kummer class of the point of the Jacobian.

**Used by.**

- [`GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`](#n-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections): The finite local condition is imposed on actual cohomology classes.
- [`GH.7/higher-weight-family-specialization`](#n-gh-7-higher-weight-family-specialization): Fixes the cycle class normalization being compared with Howard’s point tower.
- [`GH.1/p-adic-abel-jacobi-map`](#n-gh-1-p-adic-abel-jacobi-map)
- [`GH.1/integral-abel-jacobi-comparison`](#n-gh-1-integral-abel-jacobi-comparison)
- [`GH.2/cycle-norm-relations`](#n-gh-2-cycle-norm-relations)
- [`GH.8/character-sum-comparison`](#n-gh-8-character-sum-comparison), through its citation of layer GH.1 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/modular-quotient-kummer`](#n-gh-8-modular-quotient-kummer), through its citation of layer GH.1 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity), through its citation of layer GH.1 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.1/homological-triviality-of-generalized-heegner-cycles`](#n-gh-1-homological-triviality-of-generalized-heegner-cycles). other roadmaps: `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence` (The Gysin sequence); `SchemeAndStackFoundations:SF.5` (Intersection theory and Riemann-Roch); `ArithmeticGaloisDuality:R02.1` (Topological coefficients and inverse limits); `EtaleDualityAndPerverseSheaves:EDC.6` (Integral, analytic and diamond comparison of operations).

**Open items.** requests [EDC.6](#req-6), [SF.5](#req-15), [R02.1](#req-18); gaps [G17](#gap-17).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.ajEt`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** EDC.3 only supplies finite Gysin, and R02.2 compact five-term is not continuous Ext¹=H¹. Added the EDC.6 rational/support adapter and precise R02.1 request, retaining Chow rational-equivalence and the m=0 Jacobian comparison. These are honest open exports.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §3.1, p. 1065: “Consider the following Gysin sequence in p-adic étale cohomology” — The Gysin sequence (3.1.1).
- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §3.1, Definition 3.1, p. 1066: “sends the class of the null-homologous codimension-.r C 1/ cycle” — AJ^et_F as the class of the pulled-back extension.
- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §3.1, Remark 3.2, p. 1067: “It can be checked, following the argument that is explained in” — Compatibility with the general definition.

<a id="n-gh-1-extensions-of-filtered-frobenius-modules"></a>
### BDP Proposition 3.5: Ext of the unit by a filtered Frobenius module of negative weight

`GH.1/extensions-of-filtered-frobenius-modules` · lemma · part GH.0 · review: verified

For a negative-weight admissible filtered Frobenius module H over finite unramified F/Q_p, write Φ=Φ₀^[F:Q_p], the F-linear iterate of semilinear crystalline Frobenius. Weight separation gives 1−Φ invertible. Every extension 0→H→D→F→0 has a unique Φ-fixed lift of 1 and a lift in Fil⁰D; their difference, in the order holomorphic minus Frobenius, defines a class in H/Fil⁰H and induces Ext_ffm¹(F,H)≅H/Fil⁰H. Semilinear Φ₀-fixed elements alone do not form the required F-linear splitting.

**Hypotheses and conventions.**

- The weight hypothesis is used to make E^{Φ=1} → F an isomorphism, and to make the class independent of the lift η^frob.

**Proof outline.**

1. Since H^{Φ=1} = 0, the map E^{Φ=1} → F^{Φ=1} = F is injective, and it is surjective because the extension of φ-modules splits (Φ − 1 is bijective on H by the weight hypothesis). This gives a φ-module splitting E = H ⊕ F with η^frob = (0, 1).
2. The filtration on E is determined by Fil⁰E = Fil⁰H + F·η^hol, with η^hol = (h, 1). Two choices give the same filtration iff h − h′ ∈ Fil⁰H.
3. Hence the class of h in H/Fil⁰H classifies the extension.

**Acceptance.**

- H = F(1), the Tate twist of weight −2 (Fil⁰H = 0): Ext¹_ffm(F, F(1)) ≅ F.

**Used by.**

- [`GH.1/p-adic-abel-jacobi-map`](#n-gh-1-p-adic-abel-jacobi-map)

**Depends on.** other roadmaps: `PadicHodgeTheory:R06.2` (Period functors and admissibility); `PadicHodgeTheory:R06.5` (Geometric comparison theorems).

**Open items.** requests [R06.2](#req-12), [R06.5](#req-13).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.filteredFrobeniusExtension`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** BDP Proposition 3.5 uses the F-linear iterate of crystalline Frobenius, negative weight and holomorphic-minus-Frobenius lift. The R06.2 request is the required filtered-extension theorem; the quotient prototype only models lift independence.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §3.3, p. 1068: “Let H be a filtered Frobenius module of strictly negative weight” — The setting of Proposition 3.5.
- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §3.3, Proposition 3.5, p. 1069: “yields an isomorphism” — Ext_ffm(F, H) = H/Fil⁰H.

<a id="n-gh-1-p-adic-abel-jacobi-map"></a>
### The p-adic Abel–Jacobi map AJ_F on projected cycles in X_m

`GH.1/p-adic-abel-jacobi-map` · construction · planet “p-adic Abel–Jacobi map” · part GH.0 · review: corrected

Under BDP §3’s finite unramified F/Q_p and supplied smooth proper models, AJ_et(Δ) lies in H¹_f(F,V). The crystalline extension gives the filtered Frobenius extension of the preceding node; its holomorphic-minus-Frobenius class lies in D_dR(V)/Fil⁰. Poincaré duality identifies this quotient with (S_{m+2}⊗Sym^mH¹_dR(A/F))∨, yielding AJ_F. This use of an unramified F records the selected presentation, not a claim that Bloch–Kato theory requires unramified F in general.

**Hypotheses and conventions.**

- F unramified over ℚ_p with good reduction of C and X_m (p ∤ cNd_K). The comparison and Nekovář's theorem are imported from PadicHodgeTheory R06.5.
- H = ε_X H^{2m+1}_dR(m + 1) has weight −1 < 0, as Proposition 3.5 requires.
- Negative weight gives D_cris(V)^{φ=1}=0. Consequently H¹_e(F,V)=H¹_f(F,V), so the L1 logarithm, whose supplied domain is H¹_e, applies to the geometric finite class.

**Construction.**

1. AJ^et_F(CH^{m+1}_0) ⊆ H¹_f (Nekovář, Theorem 3.1.1; Nizioł), requested from PadicHodgeTheory R06.5.
2. Faltings: ε_X H^{2m+1}_et(X̄_m)(m + 1) is crystalline with D_cris equal to ε_X H^{2m+1}_dR(X_m/F)(m + 1) (R06.5). D_cris is fully faithful, and surjectivity onto Ext_ffm comes from the Bloch–Kato exponential (BDP Corollary 3.4; R06.2).
3. Use negative weight to exclude the Frobenius eigenvalue 1, identify H¹_f with H¹_e, then use the supplied L1 logarithm. The filtration identification is the separate projected-hodge-filtration node, not Künneth alone.
4. Proposition 3.5 with H = ε_X H^{2m+1}_dR(m + 1) of weight −1.
5. Poincaré duality makes Fil¹ε_X H^{2m+1}(m) and Fil⁰ε_X H^{2m+1}(m + 1) exact annihilators, so H/Fil⁰H = (Fil^{m+1} ε_X H^{2m+1}_dR)^∨ (GH.0/self-duality-of-the-projected-cohomology).
6. Fil^{m+1} ε_X H^{2m+1}_dR = S_{m+2}(Γ, F) ⊗ Sym^m H¹_dR(A) (GH.0/projected-hodge-filtration).

**API.**

- `TauCeti.GeneralizedHeegner.ajP_etale` (compatibility): AJ_p is the crystalline/Bloch–Kato logarithm of AJ_et under the stated quotient and duality identification.
- `TauCeti.GeneralizedHeegner.ajP_add` (simp): AJ_p is additive in Δ.
- `TauCeti.GeneralizedHeegner.ajP_pairing` (data): Evaluation on ω_f⊗ω_A^jη_A^(m−j) uses the Poincaré dual functional and the fixed Tate twist.

**Unit tests.**

- `TauCeti.GeneralizedHeegner.ajP_zero` (degenerate): A split étale extension has zero p-adic Abel–Jacobi functional.
- `TauCeti.GeneralizedHeegner.ajP_filtration_independence` (characterisation): Changing the Hodge lift by Fil⁰ does not change its quotient class.
- `TauCeti.GeneralizedHeegner.ajP_sign` (non-example): The recipe is holomorphic lift minus Frobenius lift: swapping the order negates the quotient class.

**Acceptance.**

- m = 0: AJ_F(P − ∞)(ω_f) = ∫_∞^P ω_f, the Coleman integral, which BDP §3.6 recovers.

**Used by.**

- [`GH.1/coleman-abel-jacobi-formula`](#n-gh-1-coleman-abel-jacobi-formula): Allows the analytic primitive to evaluate the cycle extension.
- [`GH.4/bdp-special-value-formula`](#n-gh-4-bdp-special-value-formula): Fixes the functional and periods in the squared formula.
- [`GH.1/syntomic-abel-jacobi-comparison`](#n-gh-1-syntomic-abel-jacobi-comparison)
- [`GH.8/differential-evaluation`](#n-gh-8-differential-evaluation), through its citation of layer GH.1 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity), through its citation of layer GH.1 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map); [`GH.1/extensions-of-filtered-frobenius-modules`](#n-gh-1-extensions-of-filtered-frobenius-modules); [`GH.0/cm-product-good-model`](#n-gh-0-cm-product-good-model); [`GH.0/projected-hodge-filtration`](#n-gh-0-projected-hodge-filtration). other roadmaps: `PadicHodgeTheory:R06.5` (Geometric comparison theorems); `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality` (ℓ-adic and rational Poincaré duality, with the integral derived form kept separate); `PadicHodgeRegulators:L1/bloch-kato-logarithm` (The Bloch–Kato logarithm).

**Open items.** requests [R06.5](#req-13).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.ajP`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** Corrected the R06.6 proof reference to the actual R06.5 request and consistent m indices. Made D_cris^{φ=1}=0 and H¹_f=H¹_e explicit for the imported L1 logarithm; the quotient uses the separate projected filtration theorem.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §3.2, p. 1067: “The extension F is a finite unramified extension of Qp .
(2)       The varieties C and Xr over F extend to smooth proper models C and Xr
          over OF .
If ' belongs to IsogN  ” — Hypotheses on F.
- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §3.2, Theorem 3.3, p. 1068: “is crystalline, and there is a canon-” — Faltings' crystalline comparison.
- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §3.4, p. 1069: “whose elements correspond to crystalline exten-” — AJ^et lands in H¹_f = Ext_cris.
- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §3.4, p. 1070: “The p-adic Abel–Jacobi map, denoted AJF , is the diagonal map in the diagram” — Definition of AJ_F.

<a id="n-gh-1-integral-abel-jacobi-comparison"></a>
### Integral Abel–Jacobi comparison

`GH.1/integral-abel-jacobi-comparison` · comparison · part GH.0 · review: verified

For p∤2N m!, invert the remaining f-projector denominator and choose the specified stable lattice T in V_f(r), m=2r−2. The cycle extension gives an integral class in H¹(K̃_c,T⊗Sym^{2r−2}T_p(A)(1−r)); its rationalization is AJ_et in the displayed self-dual twist. Descent from the ray field K̃_c to K_c uses invariance together with the compact inflation–restriction sequence and vanishing of coefficient invariants, rather than invariance alone.

**Hypotheses and conventions.**

- The coefficient lattice and the f-projector denominator are fixed; r≥1; residual invariant vanishing is stated separately.

**Proof outline.**

1. Track the localization of every correspondence in the Gysin sequence.
2. Use the integral Hecke lattice comparison requested from R14.3, then HS/compact-five-term to descend.

**Acceptance.**

- Integral descent fails without the invariant-vanishing input; rationalization alone does not remove a congruence denominator.

**Used by.**

- [`GH.1/character-projected-heegner-class`](#n-gh-1-character-projected-heegner-class)
- [`GH.1/classical-generalized-cycle-comparison`](#n-gh-1-classical-generalized-cycle-comparison)
- [`GH.2/finite-local-abel-jacobi-class`](#n-gh-2-finite-local-abel-jacobi-class)
- [`GH.8/uniform-coherent-kernel-bound`](#n-gh-8-uniform-coherent-kernel-bound), through its citation of layer GH.1 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/uniform-coherent-lift`](#n-gh-8-uniform-coherent-lift), through its citation of layer GH.1 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.0/newform-cm-projector`](#n-gh-0-newform-cm-projector); [`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map). other roadmaps: `ArithmeticGaloisDuality:R02.2/compact-five-term` (Inflation–restriction for compact and rational coefficients).

**Open items.** gaps [G1](#gap-1), [G3](#gap-3).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH1`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.integralAJComparison`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** CH (4.2) uses an integral f lattice and the full symmetric-power Tate twist. The existing denominator and coefficient-invariant gaps are real: R02.2 supplies a descent sequence, not automatic descent. The rationalization prototype does not prove this missing geometry.

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §4.2, (4.2), pp.14–15: “where T is the Galois stable OF -lattice in Vf (r) in [Nek92, §3], and S r−1 (A) is the GHK -module
                                      S r−1 (A) := Sym2r−2 Tp (A)(1 − r)
with Tp” — Integral lattice, symmetric power and descent target are explicit.

<a id="n-gh-1-character-projected-heegner-class"></a>
### Character-projected Heegner class

`GH.1/character-projected-heegner-class` · construction · planet “Character-projected Heegner class” · part GH.0 · review: corrected

For CH’s canonical CM A/H_K and B=Res_{H_K/K}A, use the literal full symmetric-power module S=Sym^{2r−2}T_p(B)(1−r)⊗O_F, after the required coefficient extension. For an anticyclotomic χ of type (j,−j), −r<j<r, conductor c₀p^s with (c₀,Np)=1, choose the finite-order anticyclotomic χ_t of the same conductor, unique up to a Hilbert class character, so χ is a coefficient summand of S⊗χ_t. Apply its G_K-equivariant projector to the twisted finite-level class to define z_{f,χ,c}∈H¹(K_c,T⊗χ), as in (4.6), for c divisible by the conductor. The separately weighted corestriction (4.7) defines z_{f,χ}∈H¹(K,T⊗χ). Do not identify S with Ind_{G_H_K}^{G_K}Sym^{2r−2}T_p(A)(1−r): the printed isomorphism has unequal ranks (source issue E7). Integral projectors and the inclusion of the original A-coefficient class require the recorded CM.1 adapter.

**Hypotheses and conventions.**

- CH §4.4 hypotheses and coefficient field containing CM and χ values.
- The literal symmetric-power carrier and the chosen character summand must be checked independently of the false Sym/Ind identification. A finite-order χ_t is not necessarily unramified: only its ambiguity is a Hilbert class character. Integral eigenprojection denominators remain a gap.

**Construction.**

1. Import the Weil restriction Tate module and CM characters, extend coefficients, and decompose the full symmetric power into monomial character lines; do not commute Sym with induction.
2. Use the chosen χ line in S⊗χ_t to project the finite-level class, following (4.5)–(4.6). Establish the requested integral projector and class inclusion separately.
3. Apply (4.7)’s weighted corestriction for the global class, retaining the distinction between z_{f,χ,c} and z_{f,χ}.

**API.**

- `TauCeti.GeneralizedHeegner.characterHeegnerClass_eigen` (characterisation): With the character-projector law ρ(g)e_χ=χ(g)e_χ, the projected class satisfies ρ(g)z_χ=χ(g)z_χ. Idempotence alone asserts membership in the projector image and does not specify χ.
- `TauCeti.GeneralizedHeegner.characterHeegnerClass_cores` (functoriality): Corestriction commutes with the character projector after coefficient descent.
- `TauCeti.GeneralizedHeegner.characterHeegnerClass_sum` (constructor): Weighted corestriction is additive in the conductor-indexed cycle classes.

**Unit tests.**

- `TauCeti.GeneralizedHeegner.characterHeegnerClass_trivial` (degenerate): On the already selected trivial CM character component its projector is the identity. This does not assert identity on the entire symmetric-power coefficient module.
- `TauCeti.GeneralizedHeegner.characterHeegnerClass_orthogonal` (non-example): Orthogonal idempotents kill the class projected to the other character.
- `TauCeti.GeneralizedHeegner.characterHeegnerClass_add_test` (compatibility): The construction agrees with the linear coefficient projection on a sum of two classes.

**Acceptance.**

- A class merely valued in Sym^mT_p(A) is not yet a G_K class when A is only defined over H_K.

**Used by.**

- [`GH.4/ramified-character-abel-jacobi-formula`](#n-gh-4-ramified-character-abel-jacobi-formula): Provides the correctly twisted class whose local logarithm is evaluated.
- [`GH.6/selmer-rank-one`](#n-gh-6-selmer-rank-one): Supplies the actual nonzero class generating the Selmer space.
- [`GH.1/classical-generalized-cycle-comparison`](#n-gh-1-classical-generalized-cycle-comparison)
- [`GH.2/cycle-norm-relations`](#n-gh-2-cycle-norm-relations)
- [`GH.2/cycle-conjugation`](#n-gh-2-cycle-conjugation)
- [`GH.2/cycle-frobenius-congruence`](#n-gh-2-cycle-frobenius-congruence)
- [`GH.3/ordinary-stabilized-class`](#n-gh-3-ordinary-stabilized-class)

**Depends on.** this roadmap: [`GH.1/integral-abel-jacobi-comparison`](#n-gh-1-integral-abel-jacobi-comparison); [`GH.0/cm-character-decomposition`](#n-gh-0-cm-character-decomposition). other roadmaps: `ComplexMultiplicationAndExplicitReciprocity:CM.1` (Elliptic CM and ideal actions); `ArithmeticGaloisDuality:R02.2/compact-five-term` (Inflation–restriction for compact and rational coefficients).

**Open items.** requests [CM.1](#req-4); gaps [G3](#gap-3).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH1`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.characterHeegnerClass`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** Corrected χ_t to finite order of the same conductor, unique only up to a Hilbert class character, and separated finite-level (4.6) from global (4.7). Kept literal full Sym(T_p(Res A)); recorded false printed Sym/Ind identity as E7. Strengthened the eigen API to the character-action law. Integral inclusion/projector remains a precise CM.1 gap.

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §4.4, (4.5)–(4.7), pp.17–18: “4.4. Generalized Heegner classes (II). Let co be a positive integer with (co , pN ) = 1, and let
χ : Gal(Kco p∞ /K) → OF× be a locally algebraic anticyclotomic character of infinit” — The Weil restriction supplies a G_K action that A/H alone does not have.

<a id="n-gh-1-parabolic-residue-pairing"></a>
### Parabolic residue pairing

`GH.1/parabolic-residue-pairing` · theorem · part GH.0 · review: verified

For BDP’s punctured good-reduction curve with coefficient isocrystal L_{m,m}, a de Rham class is parabolic exactly when its annular residues vanish, including the horizontal cusp residue. For parabolic representatives ω₁,ω₂, the Poincaré pairing is Σ_j res_{V_j}⟨F_{1,j},ω₂⟩, where ∇F_{1,j}=ω₁. Changing a local primitive by a horizontal section does not change the pairing.

**Hypotheses and conventions.**

- BDP §3.5 good model, distinct residue disks, annuli and self-dual coefficient system; both classes parabolic.

**Proof outline.**

1. Import the rigid/algebraic comparison and residue theorem.
2. Use the Cech–de Rham description and zero residue to eliminate dependence on horizontal constants.

**Acceptance.**

- Adding a horizontal constant changes no parabolic residue pairing.

**Used by.**

- [`GH.1/coleman-primitive`](#n-gh-1-coleman-primitive)
- [`GH.1/coleman-abel-jacobi-formula`](#n-gh-1-coleman-abel-jacobi-formula)

**Depends on.** this roadmap: [`GH.0/cm-product-good-model`](#n-gh-0-cm-product-good-model). other roadmaps: `SchemeAndStackFoundations:SF.2` (Sites and scheme cohomology); `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality` (ℓ-adic and rational Poincaré duality, with the integral derived form kept separate); `PadicDifferentialEquationsAndRigidCohomology:RD.4` (Rigid cohomology and compact support); `PadicDifferentialEquationsAndRigidCohomology:RD.3/overconvergent-f-isocrystal` (Overconvergent F-isocrystals).

**Open items.** requests [RD.4](#req-9), [SF.2](#req-14); gaps [G6](#gap-6).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH1`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.parabolicResiduePairing`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** BDP Propositions 3.9–3.10 use vanishing annular/cusp residues and the Cech cup-product formula. RD.4 is a precise wide-open comparison request; RD.3’s F-isocrystal alone is not asserted to prove residues.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §3.5, Propositions 3.9–3.10, pp.1073–1074: “PROPOSITION 3.10
                   1
For all   1 ; 2 2 Hpar .C; Lr;r ; r/,

                                         t
                                         X
                 ” — The cup product is calculated as a sum of annular residues.

<a id="n-gh-1-coleman-primitive"></a>
### Coleman primitive for the modular differential

`GH.1/coleman-primitive` · construction · planet “Coleman primitive” · part GH.0 · review: unverifiable

For ω_f valued in L_m choose a Frobenius annihilator P killing its parabolic cohomology class, invertible on horizontal sections, with P(1)≠0. The Coleman primitive F_f is the locally analytic section with ∇F_f=ω_f and P(Φ)F_f rigid analytic on a Frobenius neighborhood. Weight separation and gluing make it choice independent; for m>0 it is unique and for m=0 unique modulo constants. Evaluation uses the specified ordinary CM residue disk and normalized basis.

**Hypotheses and conventions.**

- The good unramified local model and overconvergent Frobenius isocrystal are supplied; the weight-separation lemma applies.

**Construction.**

1. Import overconvergent Frobenius and solve locally by an analytic primitive.
2. Invert P(Φ) on horizontal sections to impose the rigid condition; glue and track the m=0 constant ambiguity.

**API.**

- `TauCeti.GeneralizedHeegner.colemanPrimitive_differential` (characterisation): The Gauss–Manin connection of F_f is ω_f.
- `TauCeti.GeneralizedHeegner.colemanPrimitive_frobenius` (characterisation): P(Φ)F_f is a rigid section on a Frobenius neighborhood.
- `TauCeti.GeneralizedHeegner.colemanPrimitive_choice` (extensionality): Any two admissible primitives differ by a global horizontal section.

**Unit tests.**

- `TauCeti.GeneralizedHeegner.colemanPrimitive_zero` (degenerate): With the zero normalization the zero differential has zero Coleman primitive.
- `TauCeti.GeneralizedHeegner.colemanPrimitive_constants` (non-example): In weight zero adding a horizontal constant preserves the differential, so uniqueness without normalization is false.
- `TauCeti.GeneralizedHeegner.colemanPrimitive_residue_test` (compatibility): Changing a primitive by a horizontal constant does not change its pairing with a zero-residue differential.

**Acceptance.**

- For m=0 an arbitrary constant remains; at m>0 no global horizontal section remains.

**Used by.**

- [`GH.1/coleman-abel-jacobi-formula`](#n-gh-1-coleman-abel-jacobi-formula): Computes the holomorphic extension term and kills the Frobenius term.
- [`GH.1/coleman-depletion-calculation`](#n-gh-1-coleman-depletion-calculation): Relates component pairings to p-depleted modular forms.

**Depends on.** this roadmap: [`GH.1/parabolic-residue-pairing`](#n-gh-1-parabolic-residue-pairing). other roadmaps: `PadicDifferentialEquationsAndRigidCohomology:RD.4` (Rigid cohomology and compact support); `PadicDifferentialEquationsAndRigidCohomology:RD.3/overconvergent-f-isocrystal` (Overconvergent F-isocrystals).

**Open items.** requests [RD.4](#req-9); gaps [G6](#gap-6), [G18](#gap-18).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH1`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.colemanPrimitive`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (unverifiable).** The source specifies an admissible Frobenius-normalized Coleman primitive (weight zero modulo constants). The native zero construction passes all three named examples: only the zero example references colemanPrimitive. A nonzero differential/primitive fixture and actual admissibility data are missing.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §3.6, Lemma 3.14, Theorem 3.15 and Remarks 3.16–3.17, pp.1076–1078: “THEOREM 3.15 ([C3, Theorem 10.1])
Let ! be a global section of the sheaf ! r ˝ 1C over C . Choose a polynomial P
satisfying the properties of Lemma 3.14, and let d be its degree. There exists a locally
analytic section F! of Lr over C satisfying the following conditions:
(1)    ” — Choice independence and the weight-zero constant ambiguity are explicit.

<a id="n-gh-1-coleman-abel-jacobi-formula"></a>
### Coleman Abel–Jacobi formula

`GH.1/coleman-abel-jacobi-formula` · theorem · planet “Coleman Abel–Jacobi formula” · part GH.0 · review: verified

For an ordinary marked isogeny φ:A→A′ and α∈Sym^mH¹_dR(A), AJ_F(Δ_φ)(ω_f⊗α)=⟨F_f(P_{A′})⊗α,cl_{P_{A′}}Δ_φ⟩=⟨φ*F_f(P_{A′}),α⟩_A. If φ*ω′=ω and d=deg φ, then evaluation on ω_A^jη_A^{m−j} is d^jG_j(A′,t′,ω′).

**Hypotheses and conventions.**

- BDP §3.7 local hypotheses; 0≤j≤m; normalized isogeny differential.

**Proof outline.**

1. Use the parabolic residue formula on the extension defining AJ_p.
2. The holomorphic term is the evaluation at the CM point (Lemma 3.19). The Frobenius term vanishes by P(1)≠0 and the rigid residue theorem (Lemma 3.20).
3. Apply the projection formula to the isogeny graph and φ*η′=dη.

**Acceptance.**

- At j=0 the degree factor is 1; at j=m it is d^m.

**Used by.**

- [`GH.4/bdp-special-value-formula`](#n-gh-4-bdp-special-value-formula)
- [`GH.4/ramified-character-abel-jacobi-formula`](#n-gh-4-ramified-character-abel-jacobi-formula)
- [`GH.7/two-variable-explicit-reciprocity`](#n-gh-7-two-variable-explicit-reciprocity)

**Depends on.** this roadmap: [`GH.1/p-adic-abel-jacobi-map`](#n-gh-1-p-adic-abel-jacobi-map); [`GH.1/coleman-primitive`](#n-gh-1-coleman-primitive); [`GH.1/parabolic-residue-pairing`](#n-gh-1-parabolic-residue-pairing).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH1`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.colemanAJ`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** BDP Propositions 3.18, 3.21 and Lemma 3.22 supply graph-cycle evaluation and the degree^j factor. The ordinary marked-isogeny and normalized differential assumptions are preserved; the residue/Coleman inputs are explicit preceding targets.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §3.7, Propositions 3.18, 3.21 and Lemma 3.22, pp.1078–1084: “PROPOSITION 3.18
Let ' be a generalized Heegner cycle attached to an isogeny of ordinary pairs ' W
” — The residue computation evaluates AJ on the isogeny graph.

<a id="n-gh-1-coleman-depletion-calculation"></a>
### Depleted Coleman component calculation

`GH.1/coleman-depletion-calculation` · theorem · part GH.0 · review: verified

For the normalized components G_j=⟨F_f,ω^jη^{m−j}⟩ and f♭ the p-depletion, G_j♭=j! θ^{−1−j}f♭ on the ordinary locus. The negative power is the continuous p-adic extension of θ on p-depleted q-series. The proof uses the connection in the Tate-curve basis, the recurrence G_0♭=θ⁻¹f♭ and G_j♭=jθ⁻¹G_{j−1}♭, plus the q-expansion principle. θ, U, V, depletion and q-expansion principle belong to the modular-forms suppliers.

**Hypotheses and conventions.**

- 0≤j≤m; ordinary locus; supplied q-expansion principle and inverse θ on p-depleted forms.

**Proof outline.**

1. Use the connection and unit-root splitting to obtain the component recurrence.
2. Check the q-expansion and apply the imported q-expansion principle.

**Acceptance.**

- The coefficient of q^n, p∤n, is j! a_n/n^{j+1}; at j=0 it is a_n/n.

**Used by.**

- [`GH.4/bdp-special-value-formula`](#n-gh-4-bdp-special-value-formula)

**Depends on.** this roadmap: [`GH.1/coleman-primitive`](#n-gh-1-coleman-primitive). other roadmaps: `ModularCurvesPartII:R14.3` (Cohomological realisations and pairings); `AutomorphicPadicLFunctions:L3h` (Anticyclotomic toric distributions and Hsieh's μ theorem).

**Open items.** requests [L3h](#req-3), [R14.3](#req-8).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH1`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.colemanDepletion`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** BDP Proposition 3.24 gives j!θ^{−1−j}f♭ via the component recurrence. Depletion and negative θ powers are supplied by the modular/measure owner request, not a private GH measure.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §3.8, Proposition 3.24, (3.8.5)–(3.8.6), pp.1086–1088: “PROPOSITION 3.24
For all .E; t / 2 C ord ,

                                   Gj[ .E; t; !/ D j Š 1j f [ .E; t; !/:                               (3.8.5)
                       ” — States the factorial and negative Atkin–Serre power.

<a id="n-gh-1-syntomic-abel-jacobi-comparison"></a>
### Syntomic Abel–Jacobi comparison

`GH.1/syntomic-abel-jacobi-comparison` · comparison · part GH.0 · review: verified

For the supplied smooth proper model of X_m and projected homologically trivial cycles, a geometric syntomic regulator and its étale comparison must identify the syntomic Abel–Jacobi image with AJ_p after Bloch–Kato logarithm and the exact Frobenius normalization. Besser’s regulator on Spec O_F, or its K₂ curve specialization, does not supply this higher-dimensional correspondence-compatible statement. This is a requested extension of D.2, with the precise comparison a gap until supplied.

**Hypotheses and conventions.**

- Good model, cycle support extension and the same Tate and Frobenius conventions as AJ_p.

**Proof outline.**

1. Import the generic syntomic complex and Chern class formalism.
2. Obtain the higher-dimensional cycle regulator and compare its Gysin extension with the étale one. The absent supplier comparison is explicitly recorded.

**Acceptance.**

- At weight zero the syntomic regulator must reproduce the Abel–Jacobi/Kummer comparison, including the Frobenius factor.

**Depends on.** this roadmap: [`GH.1/p-adic-abel-jacobi-map`](#n-gh-1-p-adic-abel-jacobi-map); [`GH.0/cm-product-good-model`](#n-gh-0-cm-product-good-model). other roadmaps: `PadicHodgeRegulators:D.2` (Étale and syntomic regulators).

**Open items.** requests [D.2](#req-10); gaps [G4](#gap-4).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH1`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.syntomicAJComparison`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** The packet accurately records the higher-dimensional syntomic comparison as a D.2 request/gap. The existing Spec O_F Tate and K₂ curve statements are insufficient; no proof is claimed from them.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §3.4, pp.1068–1070: “3.4. The p-adic Abel–Jacobi map
We can now define the p-adic Abel–Jacobi map attached to the p-adic field F intro-
duced in Section 3.2. By Theorem 3.1.1. of [Ne3] (see also [Ni]),” — Identifies the realization to which a geometric syntomic regulator must compare.

<a id="n-gh-1-classical-generalized-cycle-comparison"></a>
### Classical and generalized cycle comparison

`GH.1/classical-generalized-cycle-comparison` · comparison · part GH.0 · review: verified

For m=2r−2, the trivial CM-character projection of the generalized cycle class agrees with the classical Heegner cycle on W_m with the normalization u_{c₀}(2√−D_K)^{r−1} appearing in Castella Theorem 6.5; Castella uses u_{c₀}=|O_{c₀}×|/2. The comparison is cited there from BDP (2017), Proposition 4.1.2 with r₁=2r−2,r₂=0,u=r−1. It is not established by the 2013 homological-triviality calculation. Its proof and precise cycle adapter are recorded as an outstanding source input.

**Hypotheses and conventions.**

- Canonical CM data and coefficient projection; r>1 in the family comparison; period and sign choices fixed.

**Proof outline.**

1. Use the trivial CM-character projector.
2. Read and realize BDP 2017 Proposition 4.1.2 before identifying the generalized and classical class normalizations; this source is not silently replaced by BDP 2013.

**Acceptance.**

- The half-unit convention is distinct from CH Definition 5.2’s full-unit convention.

**Used by.**

- [`GH.3/stabilized-first-step-adapter`](#n-gh-3-stabilized-first-step-adapter)
- [`GH.7/initial-family-specialization`](#n-gh-7-initial-family-specialization)

**Depends on.** this roadmap: [`GH.1/character-projected-heegner-class`](#n-gh-1-character-projected-heegner-class); [`GH.1/integral-abel-jacobi-comparison`](#n-gh-1-integral-abel-jacobi-comparison).

**Open items.** gaps [G5](#gap-5).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH1`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.classicalGeneralizedComparison`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** Castella’s use of BDP2017 Proposition 4.1.2 and its half-unit normalization is read. The primary BDP2017 comparison is explicitly unread and recorded as a gap; the 2013 paper is not substituted for it.

**Sources.**

- [castella-variation](#src-castella-variation), §6.2, proof of Theorem 6.5, p.28: “BDP17, Prop. 4.1.2] (with r1 = 2rν −2, r2 = 0, and so u = rν −1)
the equality of classes (6.7) follows.                                   ” — States the unit convention and invokes BDP17 for the comparison.

<a id="layer-gh-2"></a>
## GH.2 — Ring-class trace, congruence and local conditions

*Part GH.0. Coverage: planned. 5 nodes, 4 planets.*

The layer proves the relations among the classes in the ring-class tower and their local conditions, at the generality CH needs.

- **Norm relations, conjugation and Frobenius congruence.** For split p and n > 1, cor(z_{f,cp^n}) = a_p z_{f,cp^{n−1}} − p^{2r−2} res(z_{f,cp^{n−2}}), and for inert ℓ, cor(z_{f,cℓ}) = a_ℓ z_{f,c} (CH Proposition 4.4); the first step n = 1 is a separate obligation, handled in GH.3. Complex conjugation sends the χ-class to the χ^{-1}-class with w_f χ(σ_N) (CH Lemma 4.6). The Frobenius congruence is an equality of local classes after restriction (CH Lemma 4.7), not a global congruence modulo ℓ. The geometric inputs are HeegnerPointEulerSystems HE.2's Hecke-neighbour classification and reduction congruence, carried through the graph correspondences.
- **Local conditions.** At good unramified places the class is crystalline, hence finite; CH Lemma 7.5's Fontaine–Laffaille argument needs the local field absolutely unramified (erratum, source issue E2). The derivative local condition at p in CH Proposition 7.8 is proved instead by the integral Perrin-Riou lifting and orthogonality argument of KO Lemma 4.10, with KO's Condition 2.3 and the identification of its local condition with CH's left as a gap.

**Planets.** Cycle norm relations ([`GH.2/cycle-norm-relations`](#n-gh-2-cycle-norm-relations)); Conjugation relation ([`GH.2/cycle-conjugation`](#n-gh-2-cycle-conjugation)); Cycle Frobenius congruence ([`GH.2/cycle-frobenius-congruence`](#n-gh-2-cycle-frobenius-congruence)); Corrected local condition ([`GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`](#n-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections)).

**Still open in this layer.**

- [G7](#gap-7) Corrected integral p-condition adapter

*Every target has a declaration node; proof closure awaits the recorded supplier exports and named refinements.*

<a id="n-gh-2-cycle-norm-relations"></a>
### Heegner cycle norm relations

`GH.2/cycle-norm-relations` · theorem · planet “Cycle norm relations” · part GH.0 · review: verified

For CH’s classes with p∤c and split p, n>1, cor_{K_{cp^n}/K_{cp^{n−1}}}(z_{f,cp^n})=a_p z_{f,cp^{n−1}}−p^{2r−2}res(z_{f,cp^{n−2}}). For an inert ℓ∤cND_Kp, cor_{K_{cℓ}/K_c}(z_{f,cℓ})=a_ℓ z_{f,c}. These equations are transported through the character projection with the prescribed χ weights. The n=1 split relation includes units and both Artin operators and requires an additional normalization check; it is not asserted by Proposition 4.4 in the 2022 copy.

**Hypotheses and conventions.**

- CH canonical CM data, p∤c, r≥1, prime-to-projector denominators and the displayed conductor exclusions.

**Proof outline.**

1. Classify conductor-changing Hecke neighbors using HE.2.
2. Compare graph cycles in the Néron–Severi group: the predecessor term contributes p^{2r−2}; use the torsion-translation invariance of the projected graph.
3. Apply the f-projector, AJ functoriality and CM coefficient projection.

**Acceptance.**

- For r=1 the predecessor coefficient is 1; for r=2 it is p².

**Used by.**

- [`GH.3/ordinary-stabilized-class`](#n-gh-3-ordinary-stabilized-class)
- [`GH.3/longo-vigni-trace-polynomials`](#n-gh-3-longo-vigni-trace-polynomials)
- [`GH.6/selmer-rank-one`](#n-gh-6-selmer-rank-one)

**Depends on.** this roadmap: [`GH.1/character-projected-heegner-class`](#n-gh-1-character-projected-heegner-class); [`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map). other roadmaps: `HeegnerPointEulerSystems:HE.2/cm-hecke-conductor-classification` (Hecke neighbors of a CM point).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH2`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.cycleNormRelations`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** CH Proposition 4.4 has n>1 for split p and the inert-prime recurrence. The first step and unit indices are separately assigned to the adapter, and the cycle proof needs graph/NS compatibility beyond the imported CM point trace.

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §4.3, Proposition 4.4 and (4.3)–(4.4), pp.15–17: “Proposition 4.4. Assume that p - c. If p = pp is split in K, then for all n > 1 we have
                             Tp zf,cpn−1 = p2r−2 · zf,cpn−2 + corKcpn /Kcpn−1 (zf,cpn ),
whe” — States the split recurrence for n>1 and the inert trace.

<a id="n-gh-2-cycle-conjugation"></a>
### Complex conjugation of Heegner classes

`GH.2/cycle-conjugation` · theorem · planet “Conjugation relation” · part GH.0 · review: verified

With τ complex conjugation, w_f the Atkin–Lehner eigenvalue and σ_N the fixed Artin class, (z_{f,χ,c})^τ=w_f χ(σ_N)(z_{f,χ^{-1},c})^{σ_N}. The CM curve is defined over H_K^+ so τ acts on the chosen geometric cycle. Conjugation changes the coefficient character to χ^{-1}; it is not a same-character identity unless χ²=1.

**Hypotheses and conventions.**

- The decomposition N O_K=𝔑 𝔑̄ and geometric/Artin normalization are fixed.

**Proof outline.**

1. Apply the Atkin–Lehner correspondence to the conjugate graph; the cycle comparison has N^{r−1}.
2. Use CH Lemma 4.5’s weighted Galois action to absorb the norm factor.

**Acceptance.**

- At χ=1 the remaining sign is w_f and the fixed σ_N action.

**Used by.**

- [`GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`](#n-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections)
- [`GH.6/selmer-rank-one`](#n-gh-6-selmer-rank-one)

**Depends on.** this roadmap: [`GH.1/character-projected-heegner-class`](#n-gh-1-character-projected-heegner-class). other roadmaps: `ModularCurvesPartII:R14.3` (Cohomological realisations and pairings); `ComplexMultiplicationAndExplicitReciprocity:CM.1` (Elliptic CM and ideal actions).

**Open items.** requests [CM.1](#req-4), [R14.3](#req-8).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH2`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.cycleConjugation`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** CH Lemma 4.6 changes χ to χ^{-1}, with w_f and the Artin class. The canonical CM real descent is a CM.1 input; there is no unjustified same-character conjugation identity.

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §4.4, Lemma 4.6, p.18: “Lemma 4.6. Let τ be the complex conjugation. Then
                                    (zf,χ,c )τ = wf · χ(σN ) · (zf,χ−1 ,c )σN ,
where wf ∈ {±1} is the Atkin–Lehner eigenvalue of ” — States the character inversion and Artin coefficient.

<a id="n-gh-2-cycle-frobenius-congruence"></a>
### Frobenius congruence for cycle classes

`GH.2/cycle-frobenius-congruence` · theorem · planet “Cycle Frobenius congruence” · part GH.0 · review: verified

For ℓ∤cND_K inert, let λ_c and λ_{cℓ} be the chosen compatible local primes. Then res_{K_{λ_{cℓ}}/K_{λ_c}}(loc_{λ_c}(z_{f,χ,c})^{Frob_ℓ})=loc_{λ_{cℓ}}(z_{f,χ,cℓ}). The anticyclotomic χ is trivial on the relevant local decomposition group. This is an equality after restriction of local classes, deduced from reduction of the conductor-changing isogeny to Frobenius; it is not equality of global classes modulo ℓ.

**Hypotheses and conventions.**

- Compatible local embeddings; good reduction at ℓ; inert conductor-changing prime.

**Proof outline.**

1. Import the geometric CM reduction congruence from HE.2.
2. Apply the graph correspondence, smooth specialization, AJ functoriality and local restriction.

**Acceptance.**

- The local Frobenius acts on the untwisted module because χ is trivial at this inert place.

**Used by.**

- [`GH.5/higher-weight-kolyvagin-class`](#n-gh-5-higher-weight-kolyvagin-class)
- [`GH.6/selmer-rank-one`](#n-gh-6-selmer-rank-one)

**Depends on.** this roadmap: [`GH.1/character-projected-heegner-class`](#n-gh-1-character-projected-heegner-class). other roadmaps: `HeegnerPointEulerSystems:HE.2/inert-reduction-frobenius-congruence` (Heegner reduction congruence); `PadicHodgeTheory:R06.5` (Geometric comparison theorems).

**Open items.** requests [R06.5](#req-13).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH2`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.cycleFrobeniusCongruence`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** CH Lemma 4.7 is an equality after local restriction, not a global congruence modulo ℓ. The graph reduction and character triviality at the inert place are matched to HE.2 and the comparison request.

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §4.4, Lemma 4.7, pp.18–19: “Lemma 4.7. Let ` - cN DK be a prime inert in K. Let λ be a prime of Q above `, and let λc` and λc
be the primes of Kc` and Kc below λ. Denote by Kλc` and Kλc be the completions of ” — The local restriction and Frobenius equality are stated exactly.

<a id="n-gh-2-finite-local-abel-jacobi-class"></a>
### Finite local Abel–Jacobi class

`GH.2/finite-local-abel-jacobi-class` · theorem · part GH.0 · review: verified

At a good unramified local model AJ_et(Δ) is crystalline and hence lies in H¹_f; outside p its unramified local class follows from the good integral support and specialization. CH Proposition 7.6’s propagation through coefficient quotients uses the corrected Fontaine–Laffaille hypothesis: the local field L must be absolutely unramified over Q_p, not just relatively unramified over K_{c,w}. A ramified conductor field requires a different argument. Bloch–Kato, Greenberg and a chosen regulator-image condition are identified only after the stated comparison is proved.

**Hypotheses and conventions.**

- Good models, admissible Hodge interval p>2r−1, and absolute unramifiedness when Fontaine–Laffaille is used.

**Proof outline.**

1. Use the geometric crystalline extension theorem at p and proper smooth specialization away from p.
2. Import propagation and lattice comparison of local conditions; use CH Lemma 7.5 only with its erratum hypothesis.

**Acceptance.**

- A relatively unramified extension of a ramified base is still ramified over Q_p.

**Used by.**

- [`GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`](#n-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections)
- [`GH.6/selmer-rank-one`](#n-gh-6-selmer-rank-one)
- [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export), through its citation of layer GH.2 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.0/cm-product-good-model`](#n-gh-0-cm-product-good-model); [`GH.1/integral-abel-jacobi-comparison`](#n-gh-1-integral-abel-jacobi-comparison). other roadmaps: `SelmerIwasawaCohomology:L4/bloch-kato-condition` (The Bloch–Kato local condition on T and W); `SelmerIwasawaCohomology:L2/condition-propagation` (Propagating local conditions); `PadicHodgeTheory:R06.5` (Geometric comparison theorems).

**Open items.** requests [R06.5](#req-13).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH2`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.finiteLocalAJ`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** CH Lemma 7.5/Proposition 7.6 are checked with the erratum: absolute unramifiedness over Q_p is required for Fontaine–Laffaille. Ramified conductor derivatives are handled in the next node, not by extending that lemma.

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §7.3, Lemma 7.5 and Proposition 7.6, p.31: “Lemma 7.5. Suppose p > 2r − 1 and p - c. Let w be a place of Kc above p, and let Kc,w be the
completion of Kc at w. If L0 /L/Kc,w are finite unramified extensions, then the corestr” — The finite condition is propagated via the local coefficient quotient.
- [castella-hsieh-erratum](#src-castella-hsieh-erratum), Second correction, entire one-page erratum: “Lemma 7.5: We have to assume further L/Qp to be unramified in
the proof in order to use Fontaine-Laffaille theory, and we do not know
if Lemma 7.5 holds when L/Qp is ramified. This” — Adds absolute unramifiedness and routes the replacement proof.

<a id="n-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections"></a>
### Corrected derivative local condition

`GH.2/local-condition-at-p-and-the-castella-hsieh-corrections` · theorem · planet “Corrected local condition” · part GH.0 · review: corrected

For the specialized anticyclotomic Heegner Euler system in CH Proposition 7.8, the derivative classes satisfy axiom (E5) at p by the integral Perrin–Riou lifting and orthogonality argument of KO Lemma 4.10. At a height-one P≠pΛ, use the integral regulator image defining F_P, lift the period vector through the unramified trace, apply Ω, specialize and use the local Tate pairing; use conjugation for p̄. The proof cannot use CH Lemma 7.5 over arbitrary ramified conductor fields. The identification of F_P with the CH local condition and its integral lattice must be checked explicitly.

**Hypotheses and conventions.**

- KO Condition 2.3 and CH specialization hypotheses as supplied; prime P≠pΛ; coefficient and local regulator normalizations matched.

**Proof outline.**

1. Lift h∈R̃₁^{ψ=0}⊗D_cris(V_f)^{φ=α}(r) to h′ over the conductor coefficient ring using surjectivity of unramified trace.
2. Apply the integral Ω map to h′; use norm compatibility and the finite local pairing (KO (4.49)–(4.50)).
3. KO Lemma 4.7 makes regulator images orthogonal. Apply conjugation at p̄ and ordinary/regulator-image comparison where its hypotheses hold.

**Acceptance.**

- The same conclusion over a ramified local field cannot be deduced from the printed Fontaine–Laffaille proof.

**Used by.**

- [`GH.5/higher-weight-kolyvagin-class`](#n-gh-5-higher-weight-kolyvagin-class)
- [`GH.6/selmer-rank-zero`](#n-gh-6-selmer-rank-zero)
- [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export), through its citation of layer GH.2 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.2/finite-local-abel-jacobi-class`](#n-gh-2-finite-local-abel-jacobi-class); [`GH.2/cycle-conjugation`](#n-gh-2-cycle-conjugation). other roadmaps: `PadicHodgeRegulators:L3` (The big logarithm and explicit interpolation).

**Open items.** requests [L3](#req-11); gaps [G7](#gap-7).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH2`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.correctedDerivativeLocalCondition`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** Corrected KO locator through p.45 and removed the unrelated clean Howard prerequisite. The integral Ω lifting/orthogonality route uses KO Condition 2.3 and the PHR L3 request; matching its regulator-image lattice to CH remains explicitly open.

**Sources.**

- [kobayashi-ota](#src-kobayashi-ota), §4, Lemma 4.7 p.42; Lemma 4.10 pp.44–45; (4.47) p.44 and (4.49)–(4.50) p.45: “Lemma 4.10. For c ∈ N , we have κP
                                      c ∈ HF (c) (K, TP /Ic ), where
                                           1
                               ” — The load-bearing local lifting and orthogonality proof was read in full.
- [castella-hsieh-erratum](#src-castella-hsieh-erratum), Second correction: “The correct proof of Prop. 7.8 has been given in a work of
Kobayashi and Ota [KO20, Lemma 4.10]. The authors are very grateful
to Shinichi Kobayashi for pointing this out.

  Lemma” — Routes the repaired argument to KO20 Lemma 4.10.

<a id="layer-gh-3"></a>
## GH.3 — Ordinary stabilization and universal norms

*Part GH.0. Coverage: planned. 6 nodes, 4 planets.*

The layer builds the norm-compatible classes, along two routes that are not identified without a normalization comparison.

- **CH's route.** For ordinary f the stabilized classes are z_{c,α} = z_c − (p^{2r−2}/α) res(z_{c/p}) when p | c, and u_c^{-1}(1 − p^{r−1}σ_p/α)(1 − p^{r−1}σ_p̄/α) z_c at the bottom (CH Definition 5.2). The first-step adapter must prove cor(z_{cp,α}) = α z_{c,α} from the conductor-one trace and the exact unit index, and compare CH's full-unit with Castella's half-unit convention; CH's Proposition 4.4 covers only n > 1. The α^{-n}-normalized sequence then defines z_f in Iwasawa cohomology, imported from SelmerIwasawaCohomology L3, with the finite quotient Δ kept apart from Γ.
- **LV's route.** The trace polynomials γ_m in O_p[G(n)], their factorization through Φ = ρρ̄ with increasingly divisible remainders (LV Lemmas 4.1–4.2), and the intersection ΦM = ⋂ γ_mM (LV Corollary 4.3) produce universal norms: LV Proposition 4.5 constructs β[n] with bottom Φz_n, compatible with the tame traces. The review found the suggested carrier of this construction inadequate (it takes no norm tower as input); see G18.

**Planets.** Ordinary stabilized class ([`GH.3/ordinary-stabilized-class`](#n-gh-3-ordinary-stabilized-class)); Iwasawa Heegner class ([`GH.3/iwasawa-heegner-class`](#n-gh-3-iwasawa-heegner-class)); Trace polynomials ([`GH.3/longo-vigni-trace-polynomials`](#n-gh-3-longo-vigni-trace-polynomials)); Universal norm Heegner class ([`GH.3/universal-norm-heegner-class`](#n-gh-3-universal-norm-heegner-class)).

**Still open in this layer.**

- [G8](#gap-8) Bottom conductor and full/half unit normalization
- [G14](#gap-14) LV universal-norm identification
- [G18](#gap-18) Suggested interfaces and discriminating geometric tests

*Every target has a declaration node; proof closure awaits the recorded supplier exports and named refinements.*

<a id="n-gh-3-ordinary-stabilized-class"></a>
### Ordinary stabilized Heegner class

`GH.3/ordinary-stabilized-class` · construction · planet “Ordinary stabilized class” · part GH.0 · review: verified

For CH k=2r, ap a p-adic unit and α the unit root of X²−apX+p^{2r−1}, set z_{c,α}=z_c−(p^{2r−2}/α)res(z_{c/p}) when p|c. When p∤c set z_{c,α}=u_c^{-1}(1−p^{r−1}σ_p/α)(1−p^{r−1}σ_p̄/α)z_c, with CH’s u_c=|O_c×|. The factor at p∤c is a pair of Euler operators, not the same formula as at positive p-conductor.

**Hypotheses and conventions.**

- r≥1, p split, ap unit; lattice integral away from the recorded denominators; compatible Artin operators.

**Construction.**

1. Use the unit-root factorization and the split predecessor relation.
2. Separate the bottom conductor case and track the source’s full-unit convention; the first-step trace adapter remains a gap.

**API.**

- `TauCeti.GeneralizedHeegner.stabilizedClass_upper` (simp): At positive p-conductor the subtraction coefficient is p^{2r−2}/α.
- `TauCeti.GeneralizedHeegner.stabilizedClass_bottom` (constructor): The bottom class is u_c⁻¹ times the product of the p and p̄ Euler operators.
- `TauCeti.GeneralizedHeegner.stabilizedClass_trace` (relation): With the matched first-step normalization, cor(z_{cp,α})=α z_{c,α}.
- `TauCeti.GeneralizedHeegner.stabilizedClass_integral` (structure): The normalized subtraction preserves the integral lattice when both classes and its explicitly recorded scalar action preserve that lattice.

**Unit tests.**

- `TauCeti.GeneralizedHeegner.stabilizedClass_weight_two` (computation): For r=1 the predecessor coefficient is α⁻¹.
- `TauCeti.GeneralizedHeegner.stabilizedClass_zero_predecessor` (degenerate): A zero predecessor leaves the current class unchanged.
- `TauCeti.GeneralizedHeegner.stabilizedClass_root_relation` (characterisation): The unit-root equation gives α+p^{2r−1}/α=ap, which is the coefficient identity used in the trace computation.

**Acceptance.**

- At r=1 the upper-layer subtraction is α⁻¹z_{c/p}; the bottom layer still has two Artin operators.

**Used by.**

- [`GH.3/iwasawa-heegner-class`](#n-gh-3-iwasawa-heegner-class): Multiplying the conductor-n class by α^{-n} gives norm compatibility.
- [`GH.7/initial-family-specialization`](#n-gh-7-initial-family-specialization): Tracks the unit convention before identifying Howard’s specialization.
- [`GH.3/stabilized-first-step-adapter`](#n-gh-3-stabilized-first-step-adapter)
- [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export), through its citation of layer GH.3 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), through its citation of layer GH.3 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/positive-tail-corestriction`](#n-gh-8-positive-tail-corestriction), through its citation of layer GH.3 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.2/cycle-norm-relations`](#n-gh-2-cycle-norm-relations); [`GH.1/character-projected-heegner-class`](#n-gh-1-character-projected-heegner-class). other roadmaps: `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients` (Ring-class tower and finite Galois quotients).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH3`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.stabilizedClass`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** CH Definition 5.2 fixes the upper subtraction and the separate bottom Euler operators, with r≥1 and ordinary unit root. The scalar tests detect the weight-two normalization; the first conductor trace remains a named adapter rather than a hidden assumption.

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §5.2, Definition 5.2, p.22: “Definition 5.2. Let α be the p-adic unit root of X 2 − ap (f )X + p2r−1 . The α-stabilized Heegner class
zf,a,α ∈ H 1 (Kc , T ⊗ S r−1 (A)) is given by
                             ” — The two formulas and u_c are explicit.

<a id="n-gh-3-stabilized-first-step-adapter"></a>
### First-step stabilization adapter

`GH.3/stabilized-first-step-adapter` · comparison · part GH.0 · review: verified

The upper and lower formulas of CH Definition 5.2 must satisfy cor_{K_{cp}/K_c}(z_{cp,α})=α z_{c,α}. Prove the conductor-one trace from the Hecke neighbor classification with both Frobenius classes and the exact unit index. The July 2022 Proposition 4.4 states only n>1; its proof does not, by itself, discharge the n=1 assertion in Lemma 5.3. Compare CH’s full-unit and Castella’s half-unit conventions by an explicit scaling of the cycle classes.

**Hypotheses and conventions.**

- p∤c and the same geometric graph and AJ normalization in all three sources.

**Proof outline.**

1. Import the first-step Heegner neighbor classification.
2. Compute the unit orbit multiplicities of the higher-weight graph cycle and both split ideal terms.
3. Substitute the unit-root relation; establish the normalization adapter before using an inverse limit.

**Acceptance.**

- The classical weight-two first-step check must reproduce the full versus half unit scaling.

**Used by.**

- [`GH.3/iwasawa-heegner-class`](#n-gh-3-iwasawa-heegner-class)
- [`GH.7/initial-family-specialization`](#n-gh-7-initial-family-specialization)
- [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity), through its citation of layer GH.3 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.3/ordinary-stabilized-class`](#n-gh-3-ordinary-stabilized-class); [`GH.1/classical-generalized-cycle-comparison`](#n-gh-1-classical-generalized-cycle-comparison). other roadmaps: `HeegnerPointEulerSystems:HE.2/split-ramified-first-step-recurrence` (Split and ramified first-step relations).

**Open items.** gaps [G8](#gap-8).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH3`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.stabilizedFirstStep`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** CH Lemma 5.3’s first-step obligation is not supplied by the revised Proposition 4.4 n>1 proof. The gap names the missing neighbor/unit calculation and full-unit versus half-unit scaling.

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §5.2, Lemma 5.3, p.22: “Lemma 5.3. For all c ≥ 1, we have
                                        corKcp /Kc (zf,cp,α ) = α · zf,c,α .

Proof.         This follows from a straightforward computation using” — States the trace that needs the bottom-layer calculation.

<a id="n-gh-3-iwasawa-heegner-class"></a>
### Iwasawa Heegner class

`GH.3/iwasawa-heegner-class` · construction · planet “Iwasawa Heegner class” · part GH.0 · review: verified

After the first-step adapter, the sequence (α^{-n}z_{c₀p^n,α})_n, with its compatible coefficient projections, defines z_f in H¹_Iw(K_{c₀p∞},T). Keep the finite ring-class quotient Δ distinct from the anticyclotomic Γ≅Z_p and from a possible Δ-character projection. A finite-order nontrivial character of exact p-conductor n specializes to α^{-n}z_{f,χ}; Shapiro identifies the inverse limit with cohomology of the completed coefficient representation, with the inversion convention explicit.

**Hypotheses and conventions.**

- ap unit, compatible stable lattice, trace lemma including n=0, continuous coefficient twist.

**Construction.**

1. Normalize by α^{-n}; use the exact trace equation at every layer.
2. Use IW and iwasawa-shapiro rather than rebuilding Iwasawa cohomology.
3. Take the finite Δ projection or corestriction before passing to the Γ module.

**API.**

- `TauCeti.GeneralizedHeegner.iwasawaClass_level` (projection): The conductor-n projection is α^{-n}z_n.
- `TauCeti.GeneralizedHeegner.iwasawaClass_norm` (relation): The normalized sequence is corestriction compatible.
- `TauCeti.GeneralizedHeegner.iwasawaClass_character` (compatibility): A nontrivial exact conductor-n character specialization gives α^{-n} times the weighted finite-level class.

**Unit tests.**

- `TauCeti.GeneralizedHeegner.iwasawaClass_bottom` (degenerate): The bottom projection has normalization α⁰=1.
- `TauCeti.GeneralizedHeegner.iwasawaClass_unit_one` (computation): If α=1 the sequence is unchanged.
- `TauCeti.GeneralizedHeegner.iwasawaClass_sign` (non-example): At α=−1 level 1 changes sign; at α=2 and a nonzero class over Q it is one half of the class, not twice the class. The latter distinguishes α^{-n} from α^n.

**Acceptance.**

- Corestriction of α^{-(n+1)}z_{n+1,α} equals α^{-n}z_{n,α}.

**Used by.**

- [`GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`](#n-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity): Supplies the functional class in the reciprocity law.
- [`GH.5/higher-weight-kolyvagin-class`](#n-gh-5-higher-weight-kolyvagin-class): Supplies the inverse-limit class to which derivative operators are applied.
- [`GH.4/fixed-weight-regulator-adapter`](#n-gh-4-fixed-weight-regulator-adapter)
- [`GH.8/character-sum-comparison`](#n-gh-8-character-sum-comparison), through its citation of layer GH.3 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export), through its citation of layer GH.3 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), through its citation of layer GH.3 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/positive-tail-corestriction`](#n-gh-8-positive-tail-corestriction), through its citation of layer GH.3 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/primitive-character-stabilization`](#n-gh-8-primitive-character-stabilization), through its citation of layer GH.3 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/uniform-coherent-kernel-bound`](#n-gh-8-uniform-coherent-kernel-bound), through its citation of layer GH.3 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/uniform-coherent-lift`](#n-gh-8-uniform-coherent-lift), through its citation of layer GH.3 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity), through its citation of layer GH.3 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.3/stabilized-first-step-adapter`](#n-gh-3-stabilized-first-step-adapter). other roadmaps: `SelmerIwasawaCohomology:L3/iwasawa-cohomology` (Iwasawa cohomology); `SelmerIwasawaCohomology:L3/iwasawa-shapiro` (Shapiro's lemma for Iwasawa cohomology); `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients` (Ring-class tower and finite Galois quotients).

**Open items.** gaps [G8](#gap-8).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH3`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.iwasawaClass`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** CH (5.8) and the imported Iwasawa carrier give α^{-n} normalization after the first-step adapter. The α=2 test distinguishes inverse powers from positive powers. Finite Δ, Γ and Shapiro conventions remain separate.

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §5.2, following Lemma 5.3 and (5.8), pp.23–24: “or zf,O c ,α
                                                   . In view of Lemma 5.3, the classes α−n · zf,cp
                                                                                              o
            ” — The norm-compatible class is the input to the big logarithm.

<a id="n-gh-3-longo-vigni-trace-polynomials"></a>
### Longo–Vigni trace polynomials

`GH.3/longo-vigni-trace-polynomials` · construction · planet “Trace polynomials” · part GH.0 · review: corrected

In O_p[G(n)] define ρ=p^{k/2}−a_pσ_p+p^{(k−2)/2}σ_p², its conjugate ρ̄, and Φ=ρρ̄. Let γ₀=a_p−p^{(k−2)/2}(σ_p+σ_p̄), γ₁=a_pγ₀−p^{k−2}δ and γ_m=a_pγ_{m−1}−p^{k−1}γ_{m−2} for m≥2. Here δ is the fixed ring-class-to-Γ degree in LV §4.1, not a freely chosen constant. LV Lemma 4.2 gives q_m with γ_m=q_mΦ+p^{(m−1)k/2}r_m for m≥2 and q_{m+1}≡a_pq_m mod p, q₂=1.

**Hypotheses and conventions.**

- Even k≥4, LV coefficient and tower conventions, finite quotient split from Γ; ordinary ap.

**Construction.**

1. Obtain the raw trace sequence from the cycle norm recurrence and finite quotient corestriction.
2. Apply the polynomial recurrence and LV Lemma 4.2’s inductive division.

**API.**

- `TauCeti.GeneralizedHeegner.tracePolynomial_initial` (projection): The first two values are γ₀ and γ₁.
- `TauCeti.GeneralizedHeegner.tracePolynomial_recurrence` (relation): γ_{m+2}=a_pγ_{m+1}−p^{k−1}γ_m.
- `TauCeti.GeneralizedHeegner.tracePolynomial_remainder` (data): The higher terms equal q_mΦ plus the explicitly p-divisible remainder.

**Unit tests.**

- `TauCeti.GeneralizedHeegner.tracePolynomial_two` (computation): The second recurrence value is apγ₁−qγ₀.
- `TauCeti.GeneralizedHeegner.tracePolynomial_zero` (degenerate): Zero initial values give the zero sequence.
- `TauCeti.GeneralizedHeegner.tracePolynomial_error_power` (non-example): At k=4,m=2 the displayed LV remainder exponent is 2. No p⁴ divisibility follows from that displayed exponent alone; a particular remainder may have additional divisibility.

**Acceptance.**

- γ₂ has leading term Φ; the error has p^{k/2} divisibility.

**Used by.**

- [`GH.3/trace-polynomial-intersection`](#n-gh-3-trace-polynomial-intersection): Controls the stable image of the corestriction sequence.
- [`GH.3/universal-norm-heegner-class`](#n-gh-3-universal-norm-heegner-class): Pins the bottom universal-norm class Φz_n.

**Depends on.** this roadmap: [`GH.2/cycle-norm-relations`](#n-gh-2-cycle-norm-relations). other roadmaps: `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients` (Ring-class tower and finite Galois quotients). libraries: `mathlib:LinearMap`.

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH3`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.tracePolynomial`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** LV Lemmas 4.1–4.2 specify the actual initial terms and δ. Corrected the error-power test: the displayed exponent 2 does not forbid additional p⁴ divisibility in a particular remainder. The recursive prototype tests the recurrence, not the geometric δ.

**Sources.**

- [longo-vigni](#src-longo-vigni), §4.1, Lemmas 4.1–4.2, pp.12–13: “Lemma 4.2. For all m ≥ 2 there exist qm , rm ∈ Op [G(n)] with qm+1 ≡ ap qm (mod p), q2 = 1
such that
                              γm = qm Φ + p(m−1)k/2 rm .
Proof. The elements rm” — Controls the remainder and q_m modulo p.

<a id="n-gh-3-trace-polynomial-intersection"></a>
### Trace polynomial intersection theorem

`GH.3/trace-polynomial-intersection` · theorem · part GH.0 · review: corrected

For a finitely generated O_p[G(n)]-module M in LV’s setting, ordinarity and the q_m estimates imply ΦM=⋂_m γ_mM. This is equality of images/submodules. After augmentation, eventual equality of the corresponding ideals is what is used, not literal equality γ_m=Φ.

**Hypotheses and conventions.**

- LV tower and p-adic finite coefficient ring; a_p unit; finitely generated M.

**Proof outline.**

1. Reduce q_m modulo p, showing the successive q_m are units.
2. Use the increasingly p-divisible remainder and p-adic completeness to compute the stable intersection.

**Acceptance.**

- Multiplying a generator by a unit changes its value but not the principal ideal.

**Used by.**

- [`GH.3/universal-norm-heegner-class`](#n-gh-3-universal-norm-heegner-class)
- [`GH.6/universal-norm-module-rank-one`](#n-gh-6-universal-norm-module-rank-one)

**Depends on.** this roadmap: [`GH.3/longo-vigni-trace-polynomials`](#n-gh-3-longo-vigni-trace-polynomials).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH3`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.tracePolynomialIntersection`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** LV Corollary 4.3 is equality of images/submodules. Corrected the locator to pp.12–13. Augmented ideals, not literally stabilized scalars, are used downstream (E6).

**Sources.**

- [longo-vigni](#src-longo-vigni), §4.1, Corollary 4.3, pp.12–13: “Corollary 4.3. If M is a finitely generated Op [G(n)]-module then
                                            \
                                     ΦM =        γm M.
             ” — Identifies ΦM with the intersection of γ_mM.

<a id="n-gh-3-universal-norm-heegner-class"></a>
### Universal norm Heegner class

`GH.3/universal-norm-heegner-class` · construction · planet “Universal norm Heegner class” · part GH.0 · review: unverifiable

Let H_m[n] be the O_p[Gal(K_m[n]/K)] submodule generated by the restrictions of z_n and by the trace classes α_j[n], j≤m, and H_∞[n]=lim_cor H_m[n]. LV Proposition 4.5 constructs β[n]∈H_∞[n] with β₀[n]=Φz_n and cor_{K_∞[nℓ]/K_∞[n]}β[nℓ]=a_ℓβ[n] for the permitted inert ℓ. The finite Δ corestriction and p∤h_K are retained; this construction is not identified with the CH α-stabilized sequence without the normalization comparison.

**Hypotheses and conventions.**

- LV admissible triple; finite quotient of order prime to p; tower control.

**Construction.**

1. Use the trace-polynomial stable image to make each finite bottom lift nonempty.
2. Use compactness of the inverse system of finite lift sets for a simultaneous norm-compatible class.
3. Transport the tame trace relation through the universal lift construction.

**API.**

- `TauCeti.GeneralizedHeegner.universalNormClass_bottom` (projection): β₀[n]=Φz_n.
- `TauCeti.GeneralizedHeegner.universalNormClass_norm` (relation): Each upper component corestricts to the preceding component.
- `TauCeti.GeneralizedHeegner.universalNormClass_tame` (functoriality): Corestriction along an inert auxiliary prime is multiplication by a_ℓ.

**Unit tests.**

- `TauCeti.GeneralizedHeegner.universalNormClass_bottom_test` (characterisation): The zero-level projection keeps Φ rather than dropping it.
- `TauCeti.GeneralizedHeegner.universalNormClass_zero` (degenerate): Choosing the zero lift for zero geometric input gives the zero sequence.
- `TauCeti.GeneralizedHeegner.universalNormClass_two_steps` (compatibility): Two successive corestrictions equal the corestriction across two levels.

**Acceptance.**

- The bottom class is Φz_n, not simply z_n.

**Used by.**

- [`GH.5/higher-weight-kolyvagin-class`](#n-gh-5-higher-weight-kolyvagin-class): Provides conductor-indexed universal norms for differentiation.
- [`GH.6/universal-norm-module-rank-one`](#n-gh-6-universal-norm-module-rank-one): Defines the generator module H∞ whose nonvanishing is established separately.

**Depends on.** this roadmap: [`GH.3/trace-polynomial-intersection`](#n-gh-3-trace-polynomial-intersection). other roadmaps: `SelmerIwasawaCohomology:L3/iwasawa-cohomology` (Iwasawa cohomology); `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients` (Ring-class tower and finite Galois quotients); `SelmerIwasawaCohomology:L4/bloch-kato-condition` (The Bloch–Kato local condition on T and W).

**Open items.** gaps [G14](#gap-14), [G18](#gap-18).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH3`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.universalNormClass`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (unverifiable).** LV Proposition 4.5 concerns a specified tower H_m[n], Φz_n and simultaneous tame compatibility. universalNormClass(z) has no norm tower input, while its APIs quantify over unrelated cor maps. A coherent nonzero-bottom construction cannot satisfy those APIs for both identity and zero cor maps. Revise the carrier and tests.

**Sources.**

- [longo-vigni](#src-longo-vigni), §4.2, Definition 4.4 and Proposition 4.5, pp.13–14: “Proposition 4.5. There exists a family
                          
                            β[n] = (βm [n])m≥0 ∈ H∞ [n] n∈N
such that β0 [n] = Φzn and
                          ” — Constructs the compatible β[n] and fixes its bottom value.

<a id="layer-gh-4"></a>
## GH.4 — Explicit reciprocity and p-adic Abel–Jacobi formulas

*Part GH.0. Coverage: planned. 6 nodes, 4 planets.*

The layer proves the special value and reciprocity formulas; the p-adic L-functions themselves are imported from AutomorphicPadicLFunctions L3h.

- **BDP's formula.** Under BDP Assumption 5.12, the squared p-adic Rankin L-function at a character of infinity type (k − 1 − j, 1 + j) outside the interpolation range equals a squared Euler factor times the squared sum over Pic(O_c) of AJ_F(Δ_{φ_aφ₀}) evaluated on ω_f ⊗ ω_A^jη_A^{m−j} (BDP Theorem 5.13). It is a value of the squared function, not a derivative. Rescaling the CM differential changes both sides by matching signed powers.
- **CH's formulas.** For ramified characters of exact conductor p^n, CH Theorem 4.9 evaluates the linear square-root distribution through ⟨log_p z_{f,χ}, ω_f ⊗ ω_A^{r−1+j}η_A^{r−1−j} t^{1−2r}⟩, with the boundary n = 1 a recorded gap. The relative Lubin–Tate regulator (CH Theorem 5.1, requested from a Part II of PadicHodgeRegulators L3) then gives the big-logarithm reciprocity law ⟨L_{p,ψ}(z_f), ω_f ⊗ t^{−2r}⟩ = −c₀^{r−1} L_{p,ψ}(f) σ_{−1,p} by density (CH Theorem 5.7), and its dual-exponential range gives the central-value formula used for rank zero (CH Corollary 5.8).

**Planets.** BDP special value formula ([`GH.4/bdp-special-value-formula`](#n-gh-4-bdp-special-value-formula)); Ramified Abel–Jacobi formula ([`GH.4/ramified-character-abel-jacobi-formula`](#n-gh-4-ramified-character-abel-jacobi-formula)); Castella–Hsieh reciprocity law ([`GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`](#n-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity)); Dual exponential formula ([`GH.4/dual-exponential-special-value`](#n-gh-4-dual-exponential-special-value)).

**Still open in this layer.**

- [G9](#gap-9) Ramified conductor-one logarithm boundary
- [G10](#gap-10) Generic local regulator Part II

*Every target has a declaration node; proof closure awaits the recorded supplier exports and named refinements.*

<a id="n-gh-4-bdp-special-value-formula"></a>
### BDP special value formula

`GH.4/bdp-special-value-formula` · theorem · planet “BDP special value formula” · part GH.0 · review: verified

Under BDP Assumption 5.12 (normalized f∈S_k(Γ₀(N),ε_f), odd c prime to Nd_K, odd discriminant K with the stated Heegner ideal, split p prime to Nc, and the finite-local-sign conditions on Σ_cc), let m=k−2 and χ∈Σ_cc^(1) have infinity type (k−1−j,1+j), 0≤j≤m. Then L_p(f,χ)/Ω_p^{2(m−2j)}=(1−χ^{-1}(p̄)a_p+χ^{-2}(p̄)ε_f(p)p^{k−1})² · (c^{−j}/j! · Σ_[a]∈Pic(O_c) χ^{-1}(a)N(a) AJ_F(Δ_{φ_aφ₀})(ω_f⊗ω_A^jη_A^{m−j}))². This is a special value of the squared BDP function, not a complex derivative. The underlying GL₂ square-root distribution and its interpolation are imported from L3h. GZ.9 consumes the m=0 specialization of this one owner; quaternionic formulas and exceptional branches remain in GZ.9.

**Hypotheses and conventions.**

- All five clauses of BDP Assumption 5.12; CM differential, periods, representatives and geometric reciprocity fixed.

**Proof outline.**

1. Import BDP’s p-adic modular interpolation and continuity from L3h; approximate the noninterpolating character by characters in Σ_cc^(2).
2. Apply the depleted Coleman component calculation to the continued negative θ power.
3. Use the p-depletion Euler identity, change the ideal class variables, and apply the isogeny degree d=cN(a) in the Coleman AJ formula.

**Acceptance.**

- At m=j=0 the factorial and c power are 1; the degree-zero correction remains. A vanishing Euler polynomial forces this special value to vanish without forcing each cycle to vanish.

**Used by.**

- [`GH.4/cm-differential-scaling`](#n-gh-4-cm-differential-scaling)

**Depends on.** this roadmap: [`GH.1/coleman-abel-jacobi-formula`](#n-gh-1-coleman-abel-jacobi-formula); [`GH.1/coleman-depletion-calculation`](#n-gh-1-coleman-depletion-calculation). other roadmaps: `AutomorphicPadicLFunctions:L3h` (Anticyclotomic toric distributions and Hsieh's μ theorem).

**Open items.** requests [L3h](#req-3).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH4`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.bdpSpecialValue`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** BDP Assumption 5.12/Theorem 5.13 give a squared special value with the factorial, Euler factors and differential normalization. The GL₂ square-root distribution is imported from L3h; GH owns this geometric value identity.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §5.3, Assumption 5.12 and Theorem 5.13, pp.1137–1139: “THEOREM 5.13
Suppose that  2 †.1/
                  cc .N/ is a character of infinity type .k  1  j; 1 C j /, with
0  j  r . Then

    Lp .f; /                              ” — The range, squared Euler polynomial and c^{-j}/j! weighted AJ sum are explicit.

<a id="n-gh-4-cm-differential-scaling"></a>
### CM differential scaling

`GH.4/cm-differential-scaling` · lemma · part GH.0 · review: corrected

Under ω_A↦aω_A and η_A↦a^{-1}η_A with a≠0, the AJ evaluation on ω_A^jη_A^{m−j} scales by a^{2j−m}, and its square scales by a^{2(2j−m)}. The period Ω_p scales by a in the matching convention, so BDP’s normalized equation transforms consistently. These are signed integer exponents, not truncated natural subtraction.

**Hypotheses and conventions.**

- Nonzero a and the pairing normalization ⟨ω_A,η_A⟩=1.

**Proof outline.**

1. Use multilinearity of the symmetric tensor evaluation and the reciprocal normalization of η.
2. Square and compare the signed period exponent on the other side.

**Acceptance.**

- For m=2,j=0 the evaluation scales by a^{-2}; using a^0 from natural subtraction fails.

**Depends on.** this roadmap: [`GH.0/cm-character-decomposition`](#n-gh-0-cm-character-decomposition); [`GH.4/bdp-special-value-formula`](#n-gh-4-bdp-special-value-formula).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH4`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.cmDifferentialScaling`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** Corrected scaling locator to (1.4.2) and (1.4.6), not (1.4.3). Reciprocal normalization gives signed exponent 2j−m and its doubled square exponent, consistent with the period factor.

**Sources.**

- [bertolini-darmon-prasanna-generalized-heegner](#src-bertolini-darmon-prasanna-generalized-heegner), §1.4, (1.4.2) and (1.4.6), pp.1052–1053: “denotes the algebraic cup product pairing on de Rham cohomology.
    Let Sr denote the symmetric group on r letters. Multiplication by 1 on A,
combined with the natural permutatio” — The normalization determines reciprocal scaling of η.

<a id="n-gh-4-ramified-character-abel-jacobi-formula"></a>
### Ramified character Abel–Jacobi formula

`GH.4/ramified-character-abel-jacobi-formula` · theorem · planet “Ramified Abel–Jacobi formula” · part GH.0 · review: verified

In CH Theorem 4.9 let ψ have type (r,−r), conductor c₀ prime to Np, and φ type (r+j,−j−r), −r<j<r, with exact conductor p^n, n≥1; put χ=ψ̂^{-1}φ̂. Then L_{p,ψ}(f)(φ̂^{-1})/Ω_p^{−2j}=[g(φ_p^{-1})φ_p(p^n)c₀^{1−r}ψ̂_p^{-1}(p^n)/(r−1+j)!] · ⟨log_p z_{f,χ},ω_f⊗ω_A^{r−1+j}η_A^{r−1−j}t^{1−2r}⟩. This evaluates the linear square-root distribution, and the proof’s exact conductor cancellations cannot substitute for BDP’s unramified Euler polynomial.

**Hypotheses and conventions.**

- CH setup and critical interval; exact ramified conductor n≥1; periods and geometric reciprocity fixed.

**Proof outline.**

1. Relate the weighted corestriction class to the CM sum using Lemma 4.5.
2. Use the CM expansion of the p-adic L-function, the Gauss sum identity and the Coleman AJ evaluation.
3. For the cancellation using exact conductor n>1, establish the n=1 boundary separately; the boundary is a recorded refinement.

**Acceptance.**

- At j=0 the factorial is (r−1)! and the t factor is t^{1−2r}; squaring is not part of this equation.

**Used by.**

- [`GH.4/fixed-weight-regulator-adapter`](#n-gh-4-fixed-weight-regulator-adapter)
- [`GH.6/anticyclotomic-nonvanishing`](#n-gh-6-anticyclotomic-nonvanishing)

**Depends on.** this roadmap: [`GH.1/character-projected-heegner-class`](#n-gh-1-character-projected-heegner-class); [`GH.1/coleman-abel-jacobi-formula`](#n-gh-1-coleman-abel-jacobi-formula). other roadmaps: `AutomorphicPadicLFunctions:L3h` (Anticyclotomic toric distributions and Hsieh's μ theorem).

**Open items.** requests [L3h](#req-3); gaps [G9](#gap-9).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH4`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.ramifiedCharacterAJ`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** CH Theorem 4.9 is in the critical interval with ramified conductor n≥1. The packet explicitly retains the n=1 versus n>1 cancellation gap and does not replace the unramified BDP Euler formula.

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §4.5, Theorem 4.9, pp.19–21: “Theorem 4.9. Suppose p = pp splits in K. Let ψ be an anticyclotomic Hecke character of infinity type
(r, −r) and conductor co OK with (co , N p) = 1. If φb ∈ Xp∞ is the p-adic avat” — The ramified conductor, factorial and period/Tate factors are explicit.

<a id="n-gh-4-fixed-weight-regulator-adapter"></a>
### Fixed-weight regulator specialization

`GH.4/fixed-weight-regulator-adapter` · comparison · part GH.0 · review: verified

Apply the supplier’s relative Lubin–Tate Perrin–Riou map to V=V_f(r)⊗ψ̂^{-1}, whose F⁺ line is unramified after this twist. Pair with ω_f⊗t^{−2r} and the CM period identifications η_A=t_A^{-1}t, ω_A=t_A=Ω_pt. CH Theorem 5.1’s specialization in the positive logarithmic range and the dual exponential range supplies the epsilon, Euler and factorial factors; the density argument in Theorem 5.7 uses ramified n>1 characters and the epsilon identity ε(φ̂)=g(φ_p^{-1})φ_p(−p^n). The finite unramified base change and Γ̃ finite quotient are part of the map.

**Hypotheses and conventions.**

- Theorem 5.1 hypotheses: nonnegative Hodge–Tate weights, no trivial quotient and no invariants on the relevant tower; ordinary rank-one line and matched twists.

**Proof outline.**

1. Import the relative Lubin–Tate regulator as an extension of L3 rather than a duplicate construction.
2. Match the de Rham differential and t powers, then compare the interpolation factor at exact ramified characters.

**Acceptance.**

- The line unramified before a Tate twist need not stay unramified after the twist; ψ is part of the repair.

**Used by.**

- [`GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`](#n-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity)
- [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), through its citation of layer GH.4 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity), through its citation of layer GH.4 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.3/iwasawa-heegner-class`](#n-gh-3-iwasawa-heegner-class); [`GH.4/ramified-character-abel-jacobi-formula`](#n-gh-4-ramified-character-abel-jacobi-formula). other roadmaps: `PadicHodgeRegulators:L3` (The big logarithm and explicit interpolation).

**Open items.** requests [L3](#req-11); gaps [G10](#gap-10).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH4`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.fixedWeightRegulator`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** The source’s relative Lubin–Tate regulator and ordinary coefficient functional are matched through a named PHR Part II request. The accepted cyclotomic L3 theorem is not treated as this relative map.

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §5.1 and §5.3, Theorem 5.1, Lemma 5.5 and proof of Theorem 5.7, pp.21–25: “Theorem 5.1. Let V be a crystalline F -representation of GL with non-negative Hodge–Tate weights,
and assume that V has no quotient isomorphic to the trivial representation. Let F ” — Supplies the relative regulator whose scalar normalization is used.

<a id="n-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity"></a>
### Castella–Hsieh explicit reciprocity law

`GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity` · theorem · planet “Castella–Hsieh reciprocity law” · part GH.0 · review: verified

Under CH §5, in Λ_{F̂^ur}(Γ̃), ⟨L_{p,ψ}(z_f),ω_f⊗t^{−2r}⟩=−c₀^{r−1} L_{p,ψ}(f)·σ_{−1,p}, where σ_{−1,p}=rec_p(−1)|_{K_{c₀p∞}} has order dividing 2. The analytic side is the linear square-root distribution. The sign, c₀ power and group-algebra translation remain in the identity; equality after squaring loses this normalization.

**Hypotheses and conventions.**

- Ordinary f; ψ of type (r,−r) and conductor c₀ prime to Np; the first-step class adapter and regulator interpolation checked.

**Proof outline.**

1. Use the preceding regulator adapter and CH 4.9 at a dense set of exact-conductor n>1 characters with j=0.
2. The epsilon identity contributes φ_p(−1), producing σ_{−1,p}; collect c₀^{r−1} and the sign.
3. Use boundedness (Lemma 5.5) and Weierstrass density to conclude equality of Iwasawa algebra elements.

**Acceptance.**

- After augmenting the Artin operator one still has −c₀^{r−1}; a measure equality without these factors is a different normalization.

**Used by.**

- [`GH.4/dual-exponential-special-value`](#n-gh-4-dual-exponential-special-value)
- [`GH.7/ordinary-localization-injective`](#n-gh-7-ordinary-localization-injective)
- [`GH.7/higher-weight-family-specialization`](#n-gh-7-higher-weight-family-specialization)
- [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity)
- [`GH.8/automorphic-reciprocity-export`](#n-gh-8-automorphic-reciprocity-export)
- [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export)
- [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), through its citation of layer GH.4 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.4/fixed-weight-regulator-adapter`](#n-gh-4-fixed-weight-regulator-adapter); [`GH.3/iwasawa-heegner-class`](#n-gh-3-iwasawa-heegner-class). other roadmaps: `AutomorphicPadicLFunctions:L3h` (Anticyclotomic toric distributions and Hsieh's μ theorem).

**Open items.** requests [L3h](#req-3).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH4`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.castellaHsiehReciprocity`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** CH Theorem 5.7 is linear with −c₀^{r−1}, σ_{−1,p} and its specified t power. Interpolation uses the exact source character range and measure normalization; it is not inferred from a squared identity alone.

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §5.3, Theorem 5.7 and proof, pp.24–25: “Theorem 5.7. Suppose p = pp splits in K. Let f ∈ S2r         (Γ0 (N )) with p - N be a p-ordinary newform,
and let ψ be an anticyclotomic Hecke character of infinity type (r, −r) a” — The linear reciprocity law retains −c₀^{r−1} and σ_{−1,p}.

<a id="n-gh-4-dual-exponential-special-value"></a>
### Dual exponential special value

`GH.4/dual-exponential-special-value` · theorem · planet “Dual exponential formula” · part GH.0 · review: verified

CH Corollary 5.8 gives, in the j≥r range, ⟨exp*loc(z_{f}^{χ^{-1}}),ω_f⊗ω_A^{−j−r}η_A^{j−r}⟩² = c_{f,K}(e′_p(f,χ))²(p^{2r−1}/α²)^n χ^{-1}ψ(𝔑)L_alg(f,χ,r)/Γ(j−r+1)², with c_{f,K}=8u_K²√D_K c₀^{2r−1}ε(f). For n>0 e′_p=1; for n=0 it is (1−α^{-1}χ(σ_p)p^{r−j−1})(1−α^{-1}χ(σ_p̄)p^{r−j−1}). This is the local nonvanishing input to rank zero, distinct from the logarithmic critical range.

**Hypotheses and conventions.**

- Ordinary f and CH’s locally algebraic character and period normalization; j≥r; α unit root.

**Proof outline.**

1. Use the dual-exponential specialization of the regulator.
2. Combine CH 5.7 with the analytic interpolation and functional equation; square to express the normalized central complex value.

**Acceptance.**

- At positive conductor there is no unramified e′_p factor; a nonzero L-value gives nonzero local dual exponential.

**Used by.**

- [`GH.6/selmer-rank-zero`](#n-gh-6-selmer-rank-zero)

**Depends on.** this roadmap: [`GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`](#n-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity). other roadmaps: `AutomorphicPadicLFunctions:L3h` (Anticyclotomic toric distributions and Hsieh's μ theorem); `PadicHodgeRegulators:L3` (The big logarithm and explicit interpolation).

**Open items.** requests [L3h](#req-3), [L3](#req-11).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH4`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.dualExponentialValue`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** CH Corollary 5.8 is the dual-exponential range, with its factorial/Euler factors and ordinary hypothesis. It is linked to the regulator request and is not the critical-interval logarithm formula.

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §5.3, Corollary 5.8, pp.25–26: “Corollary 5.8. With notations and assumptions as in Theorem 5.7, let χ : Gal(Kco p∞ /K) → OF× be
a locally algebraic p-adic character of infinity type (j, −j) with j ≥ r and conduc” — The squared exponential formula and the n=0/n>0 Euler factors are separate.

<a id="layer-gh-5"></a>
## GH.5 — Higher-weight Kolyvagin system and arithmetic hypotheses

*Part GH.0. Coverage: planned. 6 nodes, 3 planets.*

The layer applies the generic Kolyvagin-system machinery of EulerSystemsAndKolyvaginSystems to the higher-weight classes, verifying its hypotheses rather than re-planning it.

- **Hypotheses.** LV's admissible triple (Definition 2.1): the exceptional set dividing 6N(k − 2)!φ(N)c_f or failing the determinant-restricted big image, p ∤ h_K, p unramified in the coefficient field, p split, a_p a unit, and O_K^× = {±1}. Howard's hypotheses H0–H5 (ES.5) are verified for the specializations (LV Lemma 2.4, Proposition 3.3); LV's local Assumption 3.2 is kept as a hypothesis, with the Tate-twist question for the self-dual representation recorded as a gap; specialization control (LV Proposition 3.4) has bounded kernel and cokernel away from a finite exceptional set.
- **Classes and the bound.** The derivative classes of LV §4.3 (Theorem 4.7), corrected by the inverse units of the finite–singular relation, form a Kolyvagin system in ES.3's module with κ′₁ = κ₁. Given κ′₁ ≠ 0, ES.5 and ES.8 give LV Theorem 3.5: the pro-Selmer module has Λ-rank one, X ∼ Λ ⊕ M ⊕ M, and char(M) divides char(Selhat/Λκ′₁). Equality is not asserted.

**Planets.** Admissible triple ([`GH.5/longo-vigni-admissible-triple`](#n-gh-5-longo-vigni-admissible-triple)); Higher-weight Kolyvagin system ([`GH.5/higher-weight-kolyvagin-class`](#n-gh-5-higher-weight-kolyvagin-class)); Longo–Vigni bound ([`GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound`](#n-gh-5-longo-vigni-admissibility-and-the-lambda-adic-bound)).

**Still open in this layer.**

- [G7](#gap-7) Corrected integral p-condition adapter
- [G11](#gap-11) LV local twist and integral local verification

*Every target has a declaration node; proof closure awaits the recorded supplier exports and named refinements.*

<a id="n-gh-5-longo-vigni-admissible-triple"></a>
### Longo–Vigni admissible triple

`GH.5/longo-vigni-admissible-triple` · definition · planet “Admissible triple” · part GH.0 · review: corrected

LV Definition 2.1 excludes primes in Ξ: those dividing 6N(k−2)!φ(N)c_f, or for which im ρ_{f,p} does not contain {g∈GL₂(O_F⊗Z_p):det g∈(Z_p×)^{k−1}}. Require also p∤h_K, p unramified in F, p split in K, and a_p∈O_p×. Fix k≥4 even, (D_K,N)=1 with all primes of N split in K and O_K×={±1}; thus K=Q(i),Q(√−3) are excluded in this application. c_f is the integral index specified by the newform lattice, not an arbitrary normalizing scalar.

**Hypotheses and conventions.**

- LV §1–2 coefficient field and lattice conventions; all four admissibility clauses and its CM-unit restriction.

**Construction.**

1. Import the newform lattice and residual representation from R14.3/R19.1.
2. Form the actual exceptional set and check each arithmetic and image condition separately.

**API.**

- `TauCeti.GeneralizedHeegner.admissibleTriple_exceptional` (projection): Admissibility implies p∤6N(k−2)!φ(N)c_f.
- `TauCeti.GeneralizedHeegner.admissibleTriple_classNumber` (projection): Admissibility implies p∤h_K, so the bottom Hilbert class quotient has prime-to-p order; it does not assert that every auxiliary-conductor ring class quotient does.
- `TauCeti.GeneralizedHeegner.admissibleTriple_ordinary` (projection): The ordinary Fourier coefficient is a unit, not merely nonzero in F.
- `TauCeti.GeneralizedHeegner.admissibleTriple_bigImage` (data): The source p-adic image must contain the determinant-restricted subgroup, not merely be irreducible.

**Unit tests.**

- `TauCeti.GeneralizedHeegner.admissibleTriple_two` (non-example): p=2 always belongs to the excluded set.
- `TauCeti.GeneralizedHeegner.admissibleTriple_class_number` (non-example): If p divides h_K the triple is excluded even when its Fourier coefficient is a unit.
- `TauCeti.GeneralizedHeegner.admissibleTriple_unit` (compatibility): The ordinarity projection is Mathlib’s unit predicate in O_p.

**Acceptance.**

- Ordinary a_p alone is insufficient; p∤h_K and the specified big image are independent requirements.

**Used by.**

- [`GH.5/higher-weight-howard-hypotheses`](#n-gh-5-higher-weight-howard-hypotheses): Provides the residual and finite-quotient input to H0–H5.
- [`GH.6/lambda-structure-consequence`](#n-gh-6-lambda-structure-consequence): Limits the higher-weight Iwasawa application to the actual source hypotheses.
- [`GH.5/longo-vigni-local-assumptions`](#n-gh-5-longo-vigni-local-assumptions)
- [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export), through its citation of layer GH.5 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.0/newform-cm-projector`](#n-gh-0-newform-cm-projector). other roadmaps: `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients` (Ring-class tower and finite Galois quotients); `AutomorphicGaloisRepresentations:R19.1` (Classical Galois representations).

**Open items.** requests [R19.1](#req-1).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH5`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.admissibleTriple`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** LV Definition 2.1 includes the exceptional set, determinant-restricted big image, p∤h_K, unramified coefficient field, split p and unit a_p. Corrected the API to the bottom Hilbert class quotient, not every auxiliary ring class quotient. Missing owner field types in the prototype are permitted by §13.

**Sources.**

- [longo-vigni](#src-longo-vigni), §2.2, Definition 2.1 and Remark 2.2, pp.4–5: “Definition 2.1. The triple (f, K, p) is admissible if
   (1) p ∈
         / Ξ ∪ {ℓ prime : ℓ | hK };
   (2) p does not ramify in F ;
   (3) p splits in K;
   (4) ap ∈ Op× .
Remark ” — The exceptional set and four clauses fix the application’s hypotheses.

<a id="n-gh-5-higher-weight-howard-hypotheses"></a>
### Higher-weight Howard hypotheses

`GH.5/higher-weight-howard-hypotheses` · comparison · part GH.0 · review: verified

For LV’s T⊗Λ and each permitted height-one specialization S_P, verify the imported Howard H0–H5: rank two freeness; absolute residual irreducibility; the auxiliary extension and residual cohomology vanishing; Cartesian propagation of every local condition; a perfect self-dual pairing; and the τ-decomposition with its compatible sign. LV Lemma 2.4 gives A[p](K_∞)=0 from its determinant-restricted big image and solvable ring-class tower. Proposition 3.3 then verifies the specialization hypotheses. The pairing, local Cartier property and admissible auxiliary primes are actual verification obligations, not definitions of the source’s classes.

**Hypotheses and conventions.**

- LV admissibility; coefficients and τ action fixed; all hypotheses of ES.5 stated by its exact supplier node.

**Proof outline.**

1. Use the residual representation and solvable tower to show invariant vanishing.
2. Apply compact inflation–restriction to propagate this to specializations.
3. Check each local condition and pairing against ES.5/howard-hypotheses and use its auxiliary-prime theorem.

**Acceptance.**

- A self-dual pairing alone does not imply Cartesian propagation at p.

**Used by.**

- [`GH.5/specialization-control`](#n-gh-5-specialization-control)
- [`GH.5/higher-weight-kolyvagin-class`](#n-gh-5-higher-weight-kolyvagin-class)

**Depends on.** this roadmap: [`GH.5/longo-vigni-admissible-triple`](#n-gh-5-longo-vigni-admissible-triple). other roadmaps: `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses` (Howard's self-dual Selmer triples and hypotheses H.0–H.5); `ArithmeticGaloisDuality:R02.2/compact-five-term` (Inflation–restriction for compact and rational coefficients).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH5`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.higherWeightHowardHypotheses`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** The exact ES.5 H0–H5 statement is read, together with LV §5.1, Lemma 2.4 and Proposition 3.3. Pairing, local Cartesian propagation and solvable-tower invariants are verification obligations, not consequences of irreducibility alone.

**Sources.**

- [longo-vigni](#src-longo-vigni), §5.1, verification of (H.0)–(H.5), pp.18–19; Lemma 2.4, p.5: “We note that hypotheses (H.0)–(H.5) and Assumption 3.2 in
§3.1 are satisfied in this setting. First of all, th” — The higher-weight application verifies generic Howard hypotheses at S_P.

<a id="n-gh-5-longo-vigni-local-assumptions"></a>
### Longo–Vigni local assumptions

`GH.5/longo-vigni-local-assumptions` · comparison · part GH.0 · review: verified

LV Assumption 3.2 requires V crystalline at p; a rank-one ordinary filtration of T whose F⁻T has trivial inertia; F⁺T and F⁺A exact annihilators under local duality; and finiteness of H⁰(K_{∞,v},F⁻A) and H⁰(K_v,F⁻A). These clauses are kept as application hypotheses. For the self-dual higher-weight twist, the untwisted ordinary quotient’s unramifiedness is not itself proof of trivial inertia on F⁻T: its Tate character must be tracked. Resolve this with the edition’s representation convention or a stronger applicable control theorem before claiming the unconditional application.

**Hypotheses and conventions.**

- LV §3.1 Assumption 3.2, rather than ordinarity alone; explicit local representation convention.

**Proof outline.**

1. Write the local ordinary characters before and after the Tate twist.
2. Compare annihilators with the exact local duality pairing.
3. Check the two H⁰ groups and the control input; keep the missing twist verification as a gap.

**Acceptance.**

- Multiplying an unramified character by a nontrivial cyclotomic power usually changes its inertia action.

**Used by.**

- [`GH.5/specialization-control`](#n-gh-5-specialization-control)
- [`GH.5/higher-weight-kolyvagin-class`](#n-gh-5-higher-weight-kolyvagin-class)

**Depends on.** this roadmap: [`GH.5/longo-vigni-admissible-triple`](#n-gh-5-longo-vigni-admissible-triple). other roadmaps: `SelmerIwasawaCohomology:L4/bloch-kato-condition` (The Bloch–Kato local condition on T and W); `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses` (Howard's self-dual Selmer triples and hypotheses H.0–H.5); `PadicHodgeRegulators:L3` (The big logarithm and explicit interpolation).

**Open items.** requests [L3](#req-11); gaps [G11](#gap-11).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH5`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.longoVigniLocalAssumptions`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** LV Assumption 3.2 includes trivial inertia on F⁻T and both local H⁰ finiteness clauses. The packet retains the self-dual Tate-twist conflict as a gap; an untwisted unramified quotient is not used to discharge it.

**Sources.**

- [longo-vigni](#src-longo-vigni), §3.1, Assumption 3.2, pp.8–9: “Assumption 3.2.     (1) The p-adic representation V is crystalline and for every prime v
     of K above p its restriction to GQp is equipped with a filtration of GQp -modules
    ” — All local clauses are necessary in the theorem’s hypothesis package.

<a id="n-gh-5-specialization-control"></a>
### Specialization and exceptional-prime control

`GH.5/specialization-control` · comparison · part GH.0 · review: corrected

LV Proposition 3.4 compares the specialized Selmer module with the S_P Selmer group, with kernel and cokernel finite and bounded in terms of [S_P:Λ/P], away from a finite exceptional set. Use the actual H⁰ and local annihilator hypotheses of Assumption 3.2. This is the application’s control input for the ES.8 height-one patching theorem, including perturbed primes (g+p^m), rather than a blanket isomorphism at every prime.

**Hypotheses and conventions.**

- LV local assumptions, finite-exception exclusion, no residual tower invariants; finite degree specialization.

**Proof outline.**

1. Use compact inflation–restriction and local-condition propagation to construct the specialization map.
2. Bound both global and local error terms and identify the finite exceptional set.
3. Feed the bounded comparison to ES.8’s patching hypothesis.

**Acceptance.**

- The pΛ prime is excluded from the unramified height-one comparison; its contribution is controlled separately.

**Used by.**

- [`GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound`](#n-gh-5-longo-vigni-admissibility-and-the-lambda-adic-bound)
- [`GH.6/universal-norm-module-rank-one`](#n-gh-6-universal-norm-module-rank-one)

**Depends on.** this roadmap: [`GH.5/higher-weight-howard-hypotheses`](#n-gh-5-higher-weight-howard-hypotheses); [`GH.5/longo-vigni-local-assumptions`](#n-gh-5-longo-vigni-local-assumptions). other roadmaps: `SelmerIwasawaCohomology:L2/galois-selmer-group` (Galois-cohomological Selmer groups); `ArithmeticGaloisDuality:R02.2/compact-five-term` (Inflation–restriction for compact and rational coefficients).

**Open items.** gaps [G11](#gap-11).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH5`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.specializationControl`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** Removed ES.8’s final Λ bound from the prerequisites of the control input used to prove that bound. Added compact inflation–restriction instead. LV Proposition 3.4 retains the finite exceptional set and bounded finite kernel/cokernel.

**Sources.**

- [longo-vigni](#src-longo-vigni), §3.1, Proposition 3.4, pp.10–11: “Proposition 3.4. For all but finitely many prime ideals P of Λ the maps (10) and (11) have
finite kernel and cokernels that are bounded by a constant depending only on [SP : Λ/P].
” — Provides bounded control outside finitely many primes.

<a id="n-gh-5-higher-weight-kolyvagin-class"></a>
### Higher-weight Kolyvagin system

`GH.5/higher-weight-kolyvagin-class` · construction · planet “Higher-weight Kolyvagin system” · part GH.0 · review: verified

Starting from LV β[n], apply D_n=∏_{ℓ|n}Σ_{i=1}^{|G_ℓ|−1}iσ_ℓ^i, sum over the specified coset representatives, reduce modulo I_n and descend uniquely using residual invariant vanishing. The raw κ_n satisfy the finite–singular relation up to units u_ℓ determined by Nekovář/CH’s local calculation. Set κ′_n=(∏_{ℓ|n}u_ℓ)^{-1}κ_n⊗⊗_{ℓ|n}σ_ℓ. This lies in the imported ES.3 Kolyvagin-system module and has κ′₁=κ₁. Transverse local membership and the p-condition are separate checks; κ₁≠0 is supplied by GH.6, not by the definition.

**Hypotheses and conventions.**

- LV admissible tower and the required local assumptions; choices of generators fixed then checked for independence; coefficient and admissible-prime ideals as in ES.5.

**Construction.**

1. Apply the derivative norm identity and residual invariant vanishing to obtain descent.
2. Use the tame Frobenius congruence for finite–singular comparison and CH’s K2 correction units.
3. Verify local conditions at p and auxiliary primes, then apply the unit correction to obtain a genuine generic KS.

**API.**

- `TauCeti.GeneralizedHeegner.correctedKolyvaginClass_unit` (relation): The local correction is the inverse product of u_ℓ, with each u_ℓ a unit.
- `TauCeti.GeneralizedHeegner.correctedKolyvaginClass_bottom` (projection): At n=1 the correction leaves κ₁ unchanged.
- `TauCeti.GeneralizedHeegner.correctedKolyvaginClass_fs` (compatibility): The corrected localization satisfies the exact generic finite–singular square.
- `TauCeti.GeneralizedHeegner.correctedKolyvaginClass_generator` (functoriality): Changing σ_ℓ rescales the derivative coefficient and the G_ℓ tensor by reciprocal factors, preserving the intrinsic class.

**Unit tests.**

- `TauCeti.GeneralizedHeegner.correctedKolyvaginClass_empty` (degenerate): The empty correction product is 1 and κ′₁=κ₁.
- `TauCeti.GeneralizedHeegner.correctedKolyvaginClass_minus` (computation): A correction u=−1 negates the raw class.
- `TauCeti.GeneralizedHeegner.correctedKolyvaginClass_wrong_unit` (non-example): Replacing a correction unit by 0 kills the class and cannot give an equivalent system.

**Acceptance.**

- At n=1 the empty derivative and unit products are 1, so the initial class is unchanged.

**Used by.**

- [`GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound`](#n-gh-5-longo-vigni-admissibility-and-the-lambda-adic-bound): Supplies the nontrivial higher-weight input to generic Howard descent.
- [`GH.6/universal-norm-module-rank-one`](#n-gh-6-universal-norm-module-rank-one): Its leading class generates H∞ after the nonvanishing proof.
- [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export), through its citation of layer GH.5 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.3/universal-norm-heegner-class`](#n-gh-3-universal-norm-heegner-class); [`GH.2/cycle-frobenius-congruence`](#n-gh-2-cycle-frobenius-congruence); [`GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`](#n-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections); [`GH.5/higher-weight-howard-hypotheses`](#n-gh-5-higher-weight-howard-hypotheses); [`GH.5/longo-vigni-local-assumptions`](#n-gh-5-longo-vigni-local-assumptions). other roadmaps: `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module` (Kolyvagin systems, weak Kolyvagin systems and their limits).

**Open items.** gaps [G7](#gap-7).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH5`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.correctedKolyvaginClass`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** LV §4.3 derivative descent, coefficient ideals and units are supplied to the imported ES.3 Kolyvagin-system carrier. The inverse-unit scalar adapter and generator-change tests are valid; local membership and residual descent remain explicit source-specific obligations.

**Sources.**

- [longo-vigni](#src-longo-vigni), §4.3, Lemma 4.6 and Theorem 4.7, pp.14–16: “Theorem 4.7. There exists a Kolyvagin system κHeeg ∈ KS(T, FΛ , L) such that the class
κHeeg
 1    ∈ HF1 Λ (K, T) is non-zero.
Proof. The classes κn , n ∈ N , almost form a Kolyvag” — The corrected classes form the KS; nonzero leading term has a separate proof.

<a id="n-gh-5-longo-vigni-admissibility-and-the-lambda-adic-bound"></a>
### Conditional Longo–Vigni bound

`GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound` · theorem · planet “Longo–Vigni bound” · part GH.0 · review: verified

Given the verified higher-weight H0–H5, local Assumption 3.2, bounded specialization control and κ′₁≠0, import ES.5’s DVR theorem and ES.8’s Λ theorem. The pro-Selmer module is torsion free of Λ-rank one and X is pseudo-isomorphic to Λ⊕M⊕M with M torsion, char(M)=char(M)^ι and char(M) dividing char(Selhat/Λκ′₁). In ideal-containment language char(Selhat/Λκ′₁)⊆char(M). This is a conditional application of generic descent; it does not re-plan Howard’s theory or reverse the divisibility. GH.6 supplies κ′₁≠0 and identifies Λκ′₁ with H∞.

**Hypotheses and conventions.**

- All application inputs explicitly verified; generic ES.8 patching assumptions, including height-one symmetry, hold.

**Proof outline.**

1. Apply the imported generic DVR bound at each permitted S_P.
2. Use the finite exceptional-set and perturbed-prime control to patch and establish characteristic-ideal symmetry.
3. Keep κ′₁ nonzero as a hypothesis here to avoid a dependency cycle with GH.6.

**Acceptance.**

- The asserted inequality is an upper bound on the torsion length; equality is the separate main conjecture.

**Used by.**

- [`GH.6/lambda-structure-consequence`](#n-gh-6-lambda-structure-consequence)

**Depends on.** this roadmap: [`GH.5/higher-weight-kolyvagin-class`](#n-gh-5-higher-weight-kolyvagin-class); [`GH.5/specialization-control`](#n-gh-5-specialization-control). other roadmaps: `EulerSystemsAndKolyvaginSystems:ES.8/self-dual-lambda-adic-kolyvagin-bound` (The self-dual Λ-adic Kolyvagin bound (Howard, Theorem 2.2.10)).

**Open items.** gaps [G11](#gap-11).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH5`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.longoVigniBound`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** LV Theorem 3.5 is a conditional application of ES.5/ES.8 after all patching hypotheses. The paired torsion pseudo-isomorphism and ideal containment direction are correct; no main-conjecture equality is asserted.

**Sources.**

- [longo-vigni](#src-longo-vigni), §3.1, Theorem 3.5, pp.11–12: “Theorem 3.5. Let (T, FΛ , L) be a Selmer triple satisfying (H.1)–(H.5) and Assumption 3.2.
Set X := HF1 Λ (K, A)∨ . Suppose that for some s ≥ 1 the Selmer triple (T, FΛ , Ls ) admits a
Kolyvagin system κ with κ1 6= 0. Then
    (1) HF1 Λ (K, T) is a torsion-free Λ-module” — States the rank, paired torsion structure and oriented divisibility.

<a id="layer-gh-6"></a>
## GH.6 — Nonvanishing and source-qualified Selmer consequences

*Part GH.0. Coverage: planned. 7 nodes, 6 planets.*

The layer draws the arithmetic consequences, each in its own source's hypotheses.

- **CH at fixed weight.** Nonvanishing of the square-root measure at almost all anticyclotomic characters (CH Theorem 3.9, through Hsieh's theorem requested from L3h) gives nonzero classes z_{f,χφ}. A nonzero z_{f,χ} gives Sel(K, V_f(r) ⊗ χ) = F·z_{f,χ} in the critical range, without ordinarity (CH Theorem 6.1); a nonzero central value gives a zero Selmer group outside it, for ordinary f (CH Theorem 6.2). Together they give the corrected growth formula with slope (1 − ε)/2 (CH Theorem 6.3, erratum; source issue E1) and parity (CH Theorem 6.4, through Nekovář's family parity theorem requested from SelmerIwasawaCohomology; source issue E4). The descent uses CH's bounded-error argument, requested from ES.5, not Howard's clean hypotheses.
- **LV's structure theorem.** The universal-norm module H_∞ is free of rank one and generated by κ̃₁ (LV Theorem 4.12, through the Φ intersection and a Nakayama argument, not from κ̃₁ ≠ 0 alone); with GH.5 this gives LV Theorem 1.1, the conditional structure X_∞ ∼ Λ ⊕ M ⊕ M with char(M) dividing char(Selhat/H_∞).

**Planets.** Anticyclotomic nonvanishing ([`GH.6/anticyclotomic-nonvanishing`](#n-gh-6-anticyclotomic-nonvanishing)); Rank-one Selmer theorem ([`GH.6/selmer-rank-one`](#n-gh-6-selmer-rank-one)); Rank-zero Selmer theorem ([`GH.6/selmer-rank-zero`](#n-gh-6-selmer-rank-zero)); Selmer growth formula ([`GH.6/selmer-consequences-with-the-corrected-dimension-formula`](#n-gh-6-selmer-consequences-with-the-corrected-dimension-formula)); Selmer parity theorem ([`GH.6/selmer-parity`](#n-gh-6-selmer-parity)); Universal norm module ([`GH.6/universal-norm-module-rank-one`](#n-gh-6-universal-norm-module-rank-one)).

**Still open in this layer.**

- [G7](#gap-7) Corrected integral p-condition adapter
- [G11](#gap-11) LV local twist and integral local verification
- [G12](#gap-12) Analytic nonvanishing supplier
- [G13](#gap-13) CH versus clean Howard descent
- [G14](#gap-14) LV universal-norm identification
- [G15](#gap-15) Parity supplier and sign convention

*Every target has a declaration node; proof closure awaits the recorded supplier exports and named refinements.*

<a id="n-gh-6-anticyclotomic-nonvanishing"></a>
### Anticyclotomic nonvanishing

`GH.6/anticyclotomic-nonvanishing` · theorem · planet “Anticyclotomic nonvanishing” · part GH.0 · review: verified

Under CH Theorem 3.9’s extra (N_f,D_K)=1, the square-root measure L_{p,ψ}(f) has nonzero value at all but finitely many finite-order anticyclotomic p-power characters. Its proof chooses an auxiliary coefficient prime ℓ with absolutely irreducible residual restriction to G_K and invokes Hsieh’s Theorem C after switching the analytic tower and auxiliary prime roles; this analytic theorem is requested from L3h. Combining nonzero values with the ramified logarithm formula gives nonzero z_{f,χφ} for all but finitely many finite-order φ in the critical interval. The analytic and algebraic conclusions retain their own hypotheses.

**Hypotheses and conventions.**

- CH §3 setup, (N_f,D_K)=1 and the auxiliary residual condition of Hsieh’s input; −r<j<r for the algebraic logarithm implication.

**Proof outline.**

1. Import the precise mod-ℓ central-value nonvanishing theorem from L3h.
2. Show the bounded one-variable measure is not identically zero and apply p-adic Weierstrass preparation.
3. Use the nonzero interpolation constants in CH 4.9 to deduce nonzero localized class, hence nonzero global class.

**Acceptance.**

- A nonzero class follows from a nonzero local logarithm; a complex simple zero alone has no such implication here.

**Used by.**

- [`GH.6/selmer-consequences-with-the-corrected-dimension-formula`](#n-gh-6-selmer-consequences-with-the-corrected-dimension-formula)
- [`GH.6/selmer-parity`](#n-gh-6-selmer-parity)
- [`GH.6/universal-norm-module-rank-one`](#n-gh-6-universal-norm-module-rank-one)
- [`GH.7/ordinary-localization-injective`](#n-gh-7-ordinary-localization-injective)
- [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export), through its citation of layer GH.6 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.4/ramified-character-abel-jacobi-formula`](#n-gh-4-ramified-character-abel-jacobi-formula). other roadmaps: `AutomorphicPadicLFunctions:L3h` (Anticyclotomic toric distributions and Hsieh's μ theorem).

**Open items.** requests [L3h](#req-3); gaps [G12](#gap-12).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH6`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.anticyclotomicNonvanishing`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** CH Theorem 3.9 uses the extra coprimality and auxiliary residual nonvanishing input. The unread Hsieh theorem is requested from L3h and is an explicit gap; nonzero cycles are not inferred merely from complex analytic rank one.

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §3, Theorem 3.9 and proof, p.14; §6, Theorem 6.1(2), p.27: “Theorem 3.9. Suppose (Nf , DK ) = 1. For all but finitely many φ ∈ Xp∞ , we have Lp,ψ (f )(φ) 6= 0.
Proof. Since f has conductor prime to DK , f can not be a CM form arising from K” — The nonvanishing theorem has an explicit discriminant-level hypothesis.

<a id="n-gh-6-selmer-rank-one"></a>
### Rank-one Selmer consequence

`GH.6/selmer-rank-one` · theorem · planet “Rank-one Selmer theorem” · part GH.0 · review: corrected

For CH Hypothesis (H), canonical CM data and an anticyclotomic χ of type (j,−j) with −r<j<r, if z_{f,χ}≠0 then Sel(K,V_f(r)⊗χ)=F·z_{f,χ}. Ordinarity is not required for this fixed-weight implication. CH Theorem 7.7 identifies the source local conditions with Bloch–Kato and supplies Euler-system descent; its higher-weight verification uses the actual local p-condition. The eventual nonvanishing assertion is supplied separately by the preceding node.

**Hypotheses and conventions.**

- CH (H): p∤2(2r−1)!Nφ(N), conductor χ prime to N, every prime of N split in K, p split; class nonzero; canonical CM/period setup.

**Proof outline.**

1. Use the cycle norm, Frobenius and conjugation relations to verify CH’s anticyclotomic Euler-system axioms.
2. Use the separately requested CH bounded-error anticyclotomic descent in ES.5 and verify its Bloch–Kato local conditions via Theorem 7.7. Do not substitute the stronger clean Howard hypotheses for CH (H).
3. The resulting dimension bound plus a nonzero Selmer class gives equality with its one-dimensional span.

**Acceptance.**

- For z=0 the conclusion cannot be inferred; the nonzero hypothesis is essential.

**Used by.**

- [`GH.6/selmer-consequences-with-the-corrected-dimension-formula`](#n-gh-6-selmer-consequences-with-the-corrected-dimension-formula)
- [`GH.6/selmer-parity`](#n-gh-6-selmer-parity)
- [`GH.7/ordinary-localization-injective`](#n-gh-7-ordinary-localization-injective)
- [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export), through its citation of layer GH.6 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.2/cycle-norm-relations`](#n-gh-2-cycle-norm-relations); [`GH.2/cycle-frobenius-congruence`](#n-gh-2-cycle-frobenius-congruence); [`GH.2/cycle-conjugation`](#n-gh-2-cycle-conjugation); [`GH.2/finite-local-abel-jacobi-class`](#n-gh-2-finite-local-abel-jacobi-class). other roadmaps: `SelmerIwasawaCohomology:L2/galois-selmer-group` (Galois-cohomological Selmer groups); `EulerSystemsAndKolyvaginSystems:ES.5` (Primitivity and sharpness over DVRs).

**Open items.** requests [ES.5](#req-17); gaps [G13](#gap-13).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH6`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.selmerRankOne`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** Removed the stronger clean Howard-hypotheses prerequisite and directed the proof to the distinct requested CH bounded-error descent. Theorem 6.1(1) is the nonordinary nonzero-class implication under CH (H), with local conditions checked via 7.7.

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §6, Theorem 6.1(1), p.27; §7.3, Theorem 7.7, pp.31–32: “Theorem 6.1. Suppose that (Vf,χ ) = −1. The following two statements hold.
    (1) If zf,χ 6= 0, then Sel(K, Vf,χ ) = F · zf,χ .
    (2) The classes zf,χφ are nonzero in H 1 (K, V” — The nonzero-cycle implication is the critical-range Selmer statement.

<a id="n-gh-6-selmer-rank-zero"></a>
### Rank-zero Selmer consequence

`GH.6/selmer-rank-zero` · theorem · planet “Rank-zero Selmer theorem” · part GH.0 · review: corrected

Under CH (H), for ordinary f and χ of type (j,−j) with j≥r or j≤−r, L(f,χ,r)≠0 implies Sel(K,V_f(r)⊗χ)=0. The dual-exponential special value supplies a nonzero local class in the complementary Euler-system condition; CH Theorem 7.9 and the corrected Proposition 7.8 local proof then force vanishing of the Bloch–Kato Selmer group. Use χ^{-1} and conjugation for the opposite range.

**Hypotheses and conventions.**

- Ordinary a_p; CH (H); outside the critical interval; nonzero normalized central value; corrected local condition adapter.

**Proof outline.**

1. Apply the dual-exponential formula and nonvanishing interpolation constants.
2. Verify the specialized anticyclotomic Euler-system local axioms by the KO replacement.
3. Use local duality and the separately requested CH bounded-error descent from ES.5 to eliminate the Bloch–Kato subspace; the clean Howard big-image package is not a stated hypothesis of CH Theorem 6.2.

**Acceptance.**

- In the critical interval the root number is −1; this theorem’s nonzero central-value hypothesis applies to the opposite range.

**Used by.**

- [`GH.6/selmer-consequences-with-the-corrected-dimension-formula`](#n-gh-6-selmer-consequences-with-the-corrected-dimension-formula)
- [`GH.6/selmer-parity`](#n-gh-6-selmer-parity)

**Depends on.** this roadmap: [`GH.4/dual-exponential-special-value`](#n-gh-4-dual-exponential-special-value); [`GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`](#n-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections). other roadmaps: `SelmerIwasawaCohomology:L2/galois-selmer-group` (Galois-cohomological Selmer groups); `EulerSystemsAndKolyvaginSystems:ES.5` (Primitivity and sharpness over DVRs).

**Open items.** requests [ES.5](#req-17); gaps [G7](#gap-7), [G13](#gap-13).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH6`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.selmerRankZero`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** Removed the stronger clean Howard-hypotheses prerequisite and specified CH bounded-error descent. The ordinary outside-critical-range Theorem 6.2 uses dual exponential and the repaired Proposition 7.8 local input.

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §6, Theorem 6.2 and proof, p.27; §7.3, Theorem 7.9, p.32: “Theorem 6.2. If L(f, χ, r) 6= 0, then Sel(K, Vf,χ ) = {0}.
Proof. The nonvanishing of the central value L(f, χ, r) implies that (Vf,χ ) = +1, and hence χ
has infinity type (j, −j)” — The ordinary central-value implication uses the specialized local class.

<a id="n-gh-6-selmer-consequences-with-the-corrected-dimension-formula"></a>
### Corrected Selmer growth formula

`GH.6/selmer-consequences-with-the-corrected-dimension-formula` · theorem · planet “Selmer growth formula” · part GH.0 · review: verified

For the CH anticyclotomic ring-class p-tower, the eventual dimension is dim_F Sel(K_{p^n},V_{f,χ})=((1−ε(V_{f,χ}))/2)[K_{p^n}:K]+e with e≥0 independent of n. The root sign is −1 exactly for −r<j<r and +1 outside; thus the slope is 1 or 0. This is CH Theorem 6.3 in its corrected form, with the finite quotient and coefficient extensions in the character decomposition tracked.

**Hypotheses and conventions.**

- The fixed-weight CH setup and hypotheses used by Theorems 6.1–6.2; n sufficiently large; ordinary assumption for the rank-zero branch.

**Proof outline.**

1. Use finite-level Shapiro and decompose into characters of the finite abelian tower quotient, extending coefficients and accounting for multiplicities.
2. Apply eventual nonvanishing and the rank-one/rank-zero results; finitely many exceptional characters contribute the constant e.
3. Insert the corrected factor (1−ε)/2 from the erratum.

**Acceptance.**

- For ε=+1 the dimensions stabilize; for ε=−1 their leading term is the tower degree.

**Depends on.** this roadmap: [`GH.6/anticyclotomic-nonvanishing`](#n-gh-6-anticyclotomic-nonvanishing); [`GH.6/selmer-rank-one`](#n-gh-6-selmer-rank-one); [`GH.6/selmer-rank-zero`](#n-gh-6-selmer-rank-zero). other roadmaps: `SelmerIwasawaCohomology:L3/iwasawa-shapiro` (Shapiro's lemma for Iwasawa cohomology); `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients` (Ring-class tower and finite Galois quotients).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH6`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.selmerGrowth`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** CH corrected Theorem 6.3 and erratum give slope (1−ε)/2 and a constant e. Both signs and finite-character decomposition are consistent; E1 is independently confirmed.

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §6, Theorem 6.3, p.27: “Theorem 6.3. There exists a non-negative integer e such that the formula
                                                      (1 − (Vf,χ ))
                            dimF Sel(K” — The revised author copy carries the corrected growth factor.
- [castella-hsieh-erratum](#src-castella-hsieh-erratum), First correction: “Theorem 6.3: The statement should read
                               (1 − (Vf,χ ))
       dimF Sel(Kpn , Vf,χ ) =                · [Kpn : K] + e.
                                ” — The factor is (1−ε)/2.

<a id="n-gh-6-selmer-parity"></a>
### Selmer parity

`GH.6/selmer-parity` · theorem · planet “Selmer parity theorem” · part GH.0 · review: verified

For ordinary f under CH (H), ord_{s=r}L(f,χ,s)≡dim_F Sel(K,V_f(r)⊗χ) mod 2. The proof uses Nekovář’s self-dual family parity theorem and its 2009 correction, plus one sufficiently ramified specialization whose Selmer dimension is 0 or 1 according to the root sign. The residue is (1−ε)/2 mod 2; ±1 itself cannot represent the two different residues modulo 2.

**Hypotheses and conventions.**

- Ordinary f; the self-dual induced family and its local parity hypotheses are supplied; the corrected Nekovář theorem applies.

**Proof outline.**

1. Form the induced self-dual family and track its local plus-submodule in each j range.
2. Use nonvanishing and the two fixed-weight Selmer theorems to choose a known parity specialization.
3. Apply the supplier’s corrected parity invariance theorem and the complex functional-equation sign.

**Acceptance.**

- The parity residue is 0 at ε=+1 and 1 at ε=−1.

**Depends on.** this roadmap: [`GH.6/selmer-rank-one`](#n-gh-6-selmer-rank-one); [`GH.6/selmer-rank-zero`](#n-gh-6-selmer-rank-zero); [`GH.6/anticyclotomic-nonvanishing`](#n-gh-6-anticyclotomic-nonvanishing). other roadmaps: `SelmerIwasawaCohomology:L4` (Arithmetic examples and conjectures).

**Open items.** requests [L4](#req-16); gaps [G15](#gap-15).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH6`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.selmerParity`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** CH Theorem 6.4 requires the separately requested corrected Nekovář parity theorem. The final proof-line residue is (1−ε)/2 (E4), not ±1 modulo 2. The unread parity supplier is honestly a gap.

**Sources.**

- [castella-hsieh](#src-castella-hsieh), §6.4, Theorem 6.4 and proof, pp.27–28: “Theorem 6.4. Suppose that f is ordinary at p. Then we have
                              ords=r L(f, χ, s) ≡ dimF Sel(K, Vf,χ )      (mod 2).

   3Here our convention is that p-adi” — The proof invokes Nek07 and Nek09 for parity in a family.

<a id="n-gh-6-universal-norm-module-rank-one"></a>
### Universal norm module of rank one

`GH.6/universal-norm-module-rank-one` · theorem · planet “Universal norm module” · part GH.0 · review: verified

For LV’s admissible triple and its verified control and local assumptions, H∞, the Λ-submodule of the pro-Selmer module generated by the norm classes, is free of rank one and is generated by κ̃₁. Theorem 4.12 uses eventual nonzero generalized cycles from CH, the Φ image/intersection calculation and a universal-norm/Nakayama argument. Merely knowing κ̃₁≠0 does not prove that it generates all of H∞ or that H∞ is saturated.

**Hypotheses and conventions.**

- LV admissibility and verified application conditions; comparison of CH classes with the LV finite Δ norm convention.

**Proof outline.**

1. Use CH nonvanishing to find a nonzero norm class at a finite level.
2. Compute the stable augmentation image using the trace-polynomial ideal equality.
3. Apply the cited universal-norm argument and Nakayama to show generation by κ̃₁, then use torsion freeness.

**Acceptance.**

- A nonzero element p of Λ is not a generator of Λ; nonvanishing alone cannot justify the module-generation conclusion.

**Used by.**

- [`GH.6/lambda-structure-consequence`](#n-gh-6-lambda-structure-consequence)

**Depends on.** this roadmap: [`GH.3/universal-norm-heegner-class`](#n-gh-3-universal-norm-heegner-class); [`GH.3/trace-polynomial-intersection`](#n-gh-3-trace-polynomial-intersection); [`GH.6/anticyclotomic-nonvanishing`](#n-gh-6-anticyclotomic-nonvanishing); [`GH.5/specialization-control`](#n-gh-5-specialization-control); [`GH.5/higher-weight-kolyvagin-class`](#n-gh-5-higher-weight-kolyvagin-class).

**Open items.** gaps [G14](#gap-14).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH6`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.universalNormModuleRankOne`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** LV Theorem 4.12 uses universal norms, the Φ intersection, nonvanishing and Nakayama to identify the full module, not just a nonzero class. The existing universal-norm identification gap is essential; E6 is confirmed at its corrected location.

**Sources.**

- [longo-vigni](#src-longo-vigni), §4.4, Definition 4.10 and Theorem 4.12, pp.16–18: “Theorem 4.12. The Λ-module H∞ is free of rank 1, generated by κ̃” — Gives freeness and generation, a stronger statement than nonvanishing.

<a id="n-gh-6-lambda-structure-consequence"></a>
### Higher-weight Iwasawa structure

`GH.6/lambda-structure-consequence` · application · part GH.0 · review: verified

With the GH.5 application hypotheses verified and GH.6’s H∞=Λκ̃₁ free of rank one, LV Theorem 1.1 follows by importing the generic Λ bound: X∞∼Λ⊕M⊕M, char(M)=char(M)^ι, char(M) divides char(Selhat/H∞). Equality of characteristic ideals is LV’s main conjecture and is not asserted here. This conditional structure consequence retains the local-filtration and normalization gaps until the supplier and source comparison obligations are discharged.

**Hypotheses and conventions.**

- The admissible triple, H0–H5, local Assumption 3.2, control and universal-norm identification are all verified.

**Proof outline.**

1. Supply κ̃₁≠0 and H∞=Λκ̃₁ from the preceding theorem.
2. Apply the already imported generic Howard Λ theorem through the GH.5 adapter.

**Acceptance.**

- The quotient in the divisibility is Selhat/H∞ after identifying H∞, not a quotient by an arbitrary nonzero class.

**Depends on.** this roadmap: [`GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound`](#n-gh-5-longo-vigni-admissibility-and-the-lambda-adic-bound); [`GH.6/universal-norm-module-rank-one`](#n-gh-6-universal-norm-module-rank-one).

**Open items.** gaps [G11](#gap-11).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH6`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.lambdaStructureConsequence`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** LV Theorem 1.1 is a conditional consumer of the generic Λ bound and H∞=Λκ̃₁. Local/control and normalization gaps remain visible; the characteristic-ideal equality is identified as a conjecture.

**Sources.**

- [longo-vigni](#src-longo-vigni), Introduction Theorem 1.1 and §5.1, pp.2,18–19: “Theorem 1.1. Suppose that (f, K, p) is an admissible triple. Then there exist a finitely
generated torsion Λ-module M such that char(M ) = char(M )ι and a pseudo-isomorphism
      ” — The source distinguishes the proven divisibility from conjectural equality.

<a id="layer-gh-7"></a>
## GH.7 — Hida-family classes and specialization

*Part GH.0. Coverage: planned. 12 nodes, 5 planets.*

The layer constructs Castella's Hida-family classes and proves their specialization, keeping each of his theorems as a separate checkpoint rather than one black-box "big class" theorem.

- **The family class.** Castella's critical character Θ and CM twist ξ; Howard's CM points on X₁(Np^s), their ordinary Kummer classes and the U_p-normalized tower Z_{c₀,∞} in Iwasawa cohomology of T† (Castella §4); the family representation T and its specializations (Castella Theorem 4.3) and the family measure (Theorem 2.11) are imported from AutomorphicGaloisRepresentations R19.6, PadicFamilies L0 and L3h and checked against the GH conventions.
- **Local theory.** The Ochiai exponential on the ideal J = (Ψ(Fr_p) − 1, γ₀ − 1) with pseudo-null cokernel (Castella Theorem 3.4), Yager's module for the unramified tower (Proposition 3.5) and the two-variable regulator into λ_reg^{-1}J (Theorem 3.7) are consumer checkpoints for the requested Part II of PadicHodgeRegulators L3; their anticyclotomic descent (Proposition 5.2) uses the H² correction.
- **Reciprocity and specialization.** The two-variable reciprocity law L(res_p Z_{c₀,∞}) = L_{p,ξ}(f)·σ_{−1,p} (Castella Theorem 5.3), localization injectivity (Lemma 6.4), and the initial and higher-weight specialization formulas at weights 2r_ν > 2 (Theorem 6.5), which compare the family class with GH.3's classes through the normalization adapters.

**Planets.** Critical family twist ([`GH.7/critical-character-twist`](#n-gh-7-critical-character-twist)); Howard family tower ([`GH.7/howard-family-tower`](#n-gh-7-howard-family-tower)); Two-variable reciprocity law ([`GH.7/two-variable-explicit-reciprocity`](#n-gh-7-two-variable-explicit-reciprocity)); Initial family specialization ([`GH.7/initial-family-specialization`](#n-gh-7-initial-family-specialization)); Higher-weight specialization ([`GH.7/higher-weight-family-specialization`](#n-gh-7-higher-weight-family-specialization)).

**Still open in this layer.**

- [G5](#gap-5) Classical-cycle source comparison
- [G8](#gap-8) Bottom conductor and full/half unit normalization
- [G10](#gap-10) Generic local regulator Part II
- [G16](#gap-16) Hida point and representation tower exports

*Every target has a declaration node; proof closure awaits the recorded supplier exports and named refinements.*

<a id="n-gh-7-critical-character-twist"></a>
### Critical character and CM family twist

`GH.7/critical-character-twist` · construction · planet “Critical family twist” · part GH.0 · review: corrected

Fix the Hida component and a lift i modulo 2(p−1). Castella’s critical character is Θ=ω^{i/2}[⟨ε_cyc⟩^{1/2}]. Extend the branch to include the CM character λ, and construct Ξ and ξ=Ξ/Ξ̄ as in §2.6. The self-dual family is T†=T⊗Θ^{-1}; the regulator line is in T†|_{G_K}⊗ξ^{-1}. The induced unramified rank-one character Ψ at p, its Frobenius value and λ_reg=Ψ(Fr_p)−1 must be tracked through this precise twist. ξ is not substituted for an arbitrary anticyclotomic character.

**Hypotheses and conventions.**

- Fixed branch, geometric reciprocity, square-root lift and CM character λ; ordinary residual irreducible and p-distinguished family.

**Construction.**

1. Import the Hida branch and continuous character algebra from PadicFamilies.
2. Apply the critical half-weight twist, then the CM anticyclotomic twist.
3. Compute the resulting local rank-one Frobenius character from the ordinary exact sequence.

**API.**

- `TauCeti.GeneralizedHeegner.criticalTwist_apply` (simp): The twisting character is Θ(g)^{-1}ξ(g)^{-1}.
- `TauCeti.GeneralizedHeegner.criticalTwist_selfDual` (compatibility): If the untwisted determinant character δ=Θ²ε_cyc, twisting by Θ⁻¹ξ⁻¹ gives determinant ε_cyc ξ⁻². This records the actual determinant relation, not just the square of an arbitrary inverse character.
- `TauCeti.GeneralizedHeegner.criticalTwist_specialize` (functoriality): Specialization of the coefficient ring commutes with both inverse character factors.

**Unit tests.**

- `TauCeti.GeneralizedHeegner.criticalTwist_trivial` (degenerate): With both characters trivial the twist is trivial.
- `TauCeti.GeneralizedHeegner.criticalTwist_inverse` (characterisation): Multiplying the twist by Θξ gives the trivial character.
- `TauCeti.GeneralizedHeegner.criticalTwist_order` (compatibility): The CM and critical inverse factors commute in the coefficient unit group.

**Acceptance.**

- Different lifts of i modulo 2(p−1) can change the half-weight character; a square-root choice must be fixed.

**Used by.**

- [`GH.7/family-regulator-localization`](#n-gh-7-family-regulator-localization): Makes the actual plus line unramified for the supplier regulator.
- [`GH.7/higher-weight-family-specialization`](#n-gh-7-higher-weight-family-specialization): Pins the self-dual representation identified with V_fν(rν).
- [`GH.7/howard-family-tower`](#n-gh-7-howard-family-tower)
- [`GH.7/family-representation-specialization`](#n-gh-7-family-representation-specialization)
- [`GH.7/family-measure-specialization`](#n-gh-7-family-measure-specialization)
- [`GH.7/ochiai-exponential-checkpoint`](#n-gh-7-ochiai-exponential-checkpoint)
- [`GH.8/automorphic-reciprocity-export`](#n-gh-8-automorphic-reciprocity-export), through its citation of layer GH.7 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), through its citation of layer GH.7 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** other roadmaps: `PadicFamilies:L0/hida-control-theorem` (Hida's control theorem); `ComplexMultiplicationAndExplicitReciprocity:CM.1` (Elliptic CM and ideal actions); `AutomorphicGaloisRepresentations:R19.6` (Representations over Hecke algebras); `PadicHodgeRegulators:L3` (The big logarithm and explicit interpolation).

**Open items.** requests [R19.6](#req-2), [CM.1](#req-4), [L3](#req-11).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH7`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.criticalTwist`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** The critical Θ and CM ξ twists follow Castella §2.6/§4.1. Corrected the self-dual API and Lean signature to use δ=Θ²ε_cyc and compute the twisted determinant ε_cycξ^{-2}; squaring arbitrary inverses was insufficient.

**Sources.**

- [castella-variation](#src-castella-variation), §2.6, (2.8)–(2.10); §4.1 and §5.1, pp.9–10,18,21: “Θ : GQ → Λwt,× by
                                 Θ(σ) := ω i/2 (σ) · [hεcyc (σ)i1/2 ],
    ” — The family CM character and critical twist determine the regulator normalization.

<a id="n-gh-7-howard-family-tower"></a>
### Howard family class tower

`GH.7/howard-family-tower` · construction · planet “Howard family tower” · part GH.0 · review: corrected

On X₁(Np^s), form the ordinary divisor/Kummer classes from Howard’s CM points P_{c₀p^n,s} defined over K̃_{c₀p^n}(μ_{p^s}), with the diamond character ϑ²=ε_cyc and critical twist Θ^{-1}. The horizontal degeneracy trace is U_p; after U_p^{-s} normalization take the s-inverse limit to X_c. Then Z_{c₀,t}=U_p^{1−t}X_{c₀p^t} is corestriction compatible in t and defines Z_{c₀,∞}∈H¹_Iw(K̃_{c₀p∞},T†). It lies in the strict Greenberg condition when the required bad-prime residual ramification holds.

**Hypotheses and conventions.**

- Hida ordinary, residual irreducible and p-distinguished; fine-level CM data; bad-prime torsion freeness as in Castella Proposition 4.8.

**Construction.**

1. Import Howard’s CM point tower from HE and the family representation from R19.6.
2. Apply the Kummer maps and ordinary control with the U_p^{-s} normalization.
3. Use the vertical trace relation to normalize by U_p^{1−t}; apply the local Greenberg verification at p and at bad primes.

**API.**

- `TauCeti.GeneralizedHeegner.howardTowerClass_level` (projection): The conductor-t class is U_p^{1−t}X_{c₀p^t}.
- `TauCeti.GeneralizedHeegner.howardTowerClass_trace` (relation): The normalized family classes are corestriction compatible.
- `TauCeti.GeneralizedHeegner.howardTowerClass_greenberg` (structure): The local family class lies in the strict Greenberg submodule under the source bad-prime hypotheses.

**Unit tests.**

- `TauCeti.GeneralizedHeegner.howardTowerClass_one` (computation): At t=1 the class is X₁.
- `TauCeti.GeneralizedHeegner.howardTowerClass_two` (computation): At t=2 the class is U_p^{-1}X₂.
- `TauCeti.GeneralizedHeegner.howardTowerClass_unit` (degenerate): With U_p=1 there is no renormalization.

**Acceptance.**

- The t=1 class has U_p⁰ normalization; omitting the +1 in 1−t changes its initial comparison.

**Used by.**

- [`GH.7/two-variable-explicit-reciprocity`](#n-gh-7-two-variable-explicit-reciprocity): Supplies the global class to the localized regulator.
- [`GH.7/initial-family-specialization`](#n-gh-7-initial-family-specialization): Fixes the precise bottom point class whose specialization is evaluated.
- [`GH.8/automorphic-reciprocity-export`](#n-gh-8-automorphic-reciprocity-export), through its citation of layer GH.7 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), through its citation of layer GH.7 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.7/critical-character-twist`](#n-gh-7-critical-character-twist). other roadmaps: `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent` (CM descent to the canonical tower); `AutomorphicGaloisRepresentations:R19.6` (Representations over Hecke algebras); `SelmerIwasawaCohomology:L3/iwasawa-cohomology` (Iwasawa cohomology); `ModularCurvesPartII:R14.3` (Cohomological realisations and pairings); `HeegnerPointEulerSystems:HE.1` (CM points and compatible modular parametrizations).

**Open items.** requests [R19.6](#req-2), [HE.1](#req-7), [R14.3](#req-8); gaps [G16](#gap-16).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH7`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.howardTowerClass`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** Corrected the locator: Proposition 4.4, Definitions 4.5–4.6 and Proposition 4.8 through p.21. HE.1 supplies the requested point tower, R19.6 its representation and GH the U_p^{1−t} class adapter; the three scalar tests fix that normalization.

**Sources.**

- [castella-variation](#src-castella-variation), §4.2, Proposition 4.4, Definitions 4.5–4.6 and Proposition 4.8, pp.19–21: “4.2. Howard’s big Heegner points. Fix a positive integer co prime to N p. For n ⩾ s, the
CM points xco pn ∈ Ig(N )(C) constructed in §2.5 descend to points Pco pn ,s ∈ X” — The point tower, horizontal and vertical normalization are described.

<a id="n-gh-7-family-representation-specialization"></a>
### Family representation specialization

`GH.7/family-representation-specialization` · comparison · part GH.0 · review: corrected

Castella’s T=lim_s e^ord T_p(J_s)⊗_h I is free of rank two under residual irreducibility and p-distinguishedness. It has trace ρ(Fr_ℓ^{-1})=a_ℓ and determinant ε_f(ℓ)[ℓ]ℓ, and its ordinary quotient is unramified with geometric Frobenius inverse eigenvalue a_p. At an arithmetic ν the critically twisted specialization identifies with T_{fν}(rν) after the specified coefficient extension and residual assumptions. This family representation and control belong to R19.6/PadicFamilies; this node checks their convention against the GH class.

**Hypotheses and conventions.**

- Normal finite-flat Hida branch and arithmetic ν of the source’s weight and character; ordinary/residual hypotheses.

**Proof outline.**

1. Import the family representation, ordinary exact sequence and arithmetic specialization.
2. Compare geometric Frobenius, determinant and critical twist with the fixed-weight coefficient projector.

**Acceptance.**

- A trace convention at Fr_ℓ^{-1} cannot be silently replaced by arithmetic Fr_ℓ.

**Used by.**

- [`GH.7/family-regulator-localization`](#n-gh-7-family-regulator-localization)
- [`GH.7/initial-family-specialization`](#n-gh-7-initial-family-specialization)
- [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), through its citation of layer GH.7 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.7/critical-character-twist`](#n-gh-7-critical-character-twist); [`GH.0/newform-cm-projector`](#n-gh-0-newform-cm-projector). other roadmaps: `AutomorphicGaloisRepresentations:R19.6` (Representations over Hecke algebras); `PadicFamilies:L0/hida-control-theorem` (Hida's control theorem).

**Open items.** requests [R19.6](#req-2); gaps [G16](#gap-16).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH7`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.familyRepresentationSpecialization`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** Corrected Theorem 4.3 page to 19. Rank-two freeness, geometric Frobenius inverse and the ordinary quotient are requested from the family representation owner, not proved by weight-two H¹ reconstruction alone.

**Sources.**

- [castella-variation](#src-castella-variation), §4.1, Theorem 4.3, p.19: “Theorem 4.3. Assume that ρ̄f is irreducible and p-distinguished. Then the following hold:
  (1) The module                                      
                               T ” — The exact representation and ordinary convention are stated.

<a id="n-gh-7-family-measure-specialization"></a>
### Family square-root measure specialization checkpoint

`GH.7/family-measure-specialization` · comparison · part GH.0 · review: corrected

Import L_{p,ξ}(f)∈I_W[[Γ̃]] from L3h. Castella Theorem 2.11 gives for ν of weight (kν,1), kν≥1, and φ type (ℓ,−ℓ), ℓ≥0, conductor c₀p^n: ν(L_{p,ξ}(f))(φ̂)²/Ω_p^{2kν+4ℓ}=L_alg(fν/K,χνξνφ,kν−1)E_p²φ(𝔑^{-1})8c₀ε(fν)w_K²√D_K. Here ψ=ξνφ. For n=0 E_p=(1−ν(a_p)(χνψ)_p(p)p^{-kν/2})(1−(χνψ)_p(p)p^{kν/2−1}ν(a_p)^{-1}); for n≥1 E_p=ε((χνψ)_p^{-1})p^{-n}. The χν norm factor converts kν−1 to the central kν/2 convention (Remark 2.12). The measure is square-root normalized; the displayed interpolation squares it.

**Hypotheses and conventions.**

- Castella §2.3–2.7’s CM and modular measure data; exact arithmetic ν and locally algebraic φ; complete unramified coefficient extension W.
- This is the consumer normalization comparison using the imported L3h interpolation theorem, not a second owner of the family distribution or Theorem 2.11.

**Proof outline.**

1. Import the family CM modular measure and its toric interpolation from L3h.
2. Check specialization of χν, ξν, periods, gamma factors and the ramified/unramified Euler cases.
3. Match the fixed-weight CH distribution with the family measure at the chosen branch; do not define a second BDP measure in GH.7.

**Acceptance.**

- At n>0 the epsilon factor replaces the two unramified Euler factors.

**Used by.**

- [`GH.7/two-variable-explicit-reciprocity`](#n-gh-7-two-variable-explicit-reciprocity)
- [`GH.8/automorphic-reciprocity-export`](#n-gh-8-automorphic-reciprocity-export), through its citation of layer GH.7 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export), through its citation of layer GH.7 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.7/critical-character-twist`](#n-gh-7-critical-character-twist). other roadmaps: `AutomorphicPadicLFunctions:L3h` (Anticyclotomic toric distributions and Hsieh's μ theorem); `PadicFamilies:L0/hida-control-theorem` (Hida's control theorem).

**Open items.** requests [L3h](#req-3).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH7`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.familyMeasureSpecialization`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** Defined ψ=ξνφ in the displayed Euler factors. Castella Theorem 2.11 and Remark 2.12 distinguish square-root measure, squared interpolation and the central-value norm shift; this is a consumer checkpoint for L3h.

**Sources.**

- [castella-variation](#src-castella-variation), §2.7, Theorem 2.11 and Remark 2.12, pp.11–12: “Theorem 2.11. Let ν ∈ XO (I) of weight (k, 1) with k ⩾ 1 be such that fν is classical, and
let φb be the p-adic avatar of an anticyclotomic Hecke character φ of K of infinity type ” — The family interpolation and central normalization are explicit.

<a id="n-gh-7-ochiai-exponential-checkpoint"></a>
### Ochiai exponential checkpoint

`GH.7/ochiai-exponential-checkpoint` · comparison · part GH.0 · review: verified

The local supplier must provide Castella Theorem 3.4: with Ical=I⊗̂Z_p[[Γ_cyc]], D=(F⁺T⊗Ẑ_p^ur)^{G_Qp} and J=(Ψ(Fr_p)−1,γ₀−1), an injective E_F^cyc:J(D⊗O_F)→H¹(F,F⁺Tcal) with pseudo-null cokernel for finite unramified F/Q_p. Its arithmetic specialization, including the weight-positive exponential interpolation, differs at conductor 0 and positive conductor. This ideal-restricted domain and pseudo-null error must survive every regulator adapter.

**Hypotheses and conventions.**

- Castella ordinary deformation Definition 3.1, rank-one unramified F⁺ line, determinant convention and finite unramified F.

**Proof outline.**

1. Request the generic Ochiai exponential as a Part II extension of the cyclotomic regulator packet.
2. Verify the actual GH critical twist satisfies its local ordinary deformation input, and retain J and its specialization error.

**Acceptance.**

- At an exceptional arithmetic character the J-specialized map can vanish; an everywhere-isomorphism claim is invalid.

**Used by.**

- [`GH.7/yager-unramified-checkpoint`](#n-gh-7-yager-unramified-checkpoint)
- [`GH.7/two-variable-regulator-checkpoint`](#n-gh-7-two-variable-regulator-checkpoint)

**Depends on.** this roadmap: [`GH.7/critical-character-twist`](#n-gh-7-critical-character-twist). other roadmaps: `PadicHodgeRegulators:L3` (The big logarithm and explicit interpolation).

**Open items.** requests [L3](#req-11); gaps [G10](#gap-10).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH7`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.ochiaiExponentialCheckpoint`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** Castella Theorem 3.4 has the ideal J source and pseudo-null cokernel. The requested PHR extension retains this integral domain and both exponential conductor ranges.

**Sources.**

- [castella-variation](#src-castella-variation), §3.2, Theorem 3.4, pp.14–15: “Theorem 3.4. Let T be a p-ordinary deformation, and define
                           J := (Ψ(Frp ) − 1, γo − 1) ⊆ I,
where Ψ : GQp → I is the unramified character by which GQp act” — The map’s ideal domain, injectivity, interpolation and pseudo-null cokernel are the checkpoint.

<a id="n-gh-7-yager-unramified-checkpoint"></a>
### Yager unramified descent checkpoint

`GH.7/yager-unramified-checkpoint` · comparison · part GH.0 · review: verified

The supplier’s Yager module S∞ is the inverse limit under trace of the finite unramified coefficient modules S_m generated by y_m(x)=Σ_σ x^σ[σ^{-1}]. It is free of rank one over Z_p[[U]], satisfies y^u=[u]y, and identifies with lim_trace O_{F_m}. Use this equivariance to descend the tensor of the cyclotomic local maps to the unramified×cyclotomic tower. Finite unramified base change of a cyclotomic regulator alone is not this construction.

**Hypotheses and conventions.**

- Unramified Z_p-tower with its Galois action and trace; Castella §3.3 coefficient convention.

**Proof outline.**

1. Request Yager’s trace module and free rank-one basis/covariance theorem from the PHR local Part II owner.
2. Use trace compatibility and covariance to obtain the local two-variable map; retain finite-level corestriction checks.

**Acceptance.**

- The coefficient action is by [u], with σ^{-1} in the Yager sum; changing either inversion changes descent.

**Used by.**

- [`GH.7/two-variable-regulator-checkpoint`](#n-gh-7-two-variable-regulator-checkpoint)

**Depends on.** this roadmap: [`GH.7/ochiai-exponential-checkpoint`](#n-gh-7-ochiai-exponential-checkpoint). other roadmaps: `PadicHodgeRegulators:L3` (The big logarithm and explicit interpolation).

**Open items.** requests [L3](#req-11); gaps [G10](#gap-10).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH7`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.yagerUnramifiedCheckpoint`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** Castella Proposition 3.5/Corollary 3.6 provide the infinite unramified Yager trace module and y^u=[u]y covariance. A finite unramified scalar extension of the cyclotomic map is explicitly ruled out as a substitute.

**Sources.**

- [castella-variation](#src-castella-variation), §3.3, Proposition 3.5 and Corollary 3.6, pp.15–16: “Proposition 3.5. The module S∞ is free of rank 1 over Zp [[U ]], and it is identified with
                          {g ∈ ObF∞ [[U ]] : g u = [u]g for all u ∈ U },
where g u denotes the action of u on the coefficients O bF∞ and [u]g denotes the action of u via
multiplicatio” — The infinite unramified coefficient module is part of the construction.

<a id="n-gh-7-two-variable-regulator-checkpoint"></a>
### Two-variable regulator checkpoint

`GH.7/two-variable-regulator-checkpoint` · comparison · part GH.0 · review: verified

With G=U×Γ_cyc and λ_reg=Ψ(Fr_p)−1, the supplier map of Castella Theorem 3.7 has target λ_reg^{-1}J(D⊗Ô_{F∞}[[G]]), is injective, and interpolates the logarithm for w>0 at nonexceptional characters. Corollary 3.9 gives the dual exponential range w≤0 with its factorial and Euler factors. Keep the conductor-zero exceptional denominator and the integral ideal J; the target is not an unlocalized unrestricted coefficient algebra.

**Hypotheses and conventions.**

- The rank-one unramified ordinary line, Yager covariance and nonexceptional arithmetic specialization; all §3 conventions.

**Proof outline.**

1. Combine the requested exponential and Yager module into the two-variable regulator.
2. Check logarithmic and dual-exponential interpolation against the same twists before passing to the anticyclotomic quotient.

**Acceptance.**

- At λ_reg=0 localization does not produce a value; exceptional arithmetic primes require a separate statement.

**Used by.**

- [`GH.7/family-regulator-localization`](#n-gh-7-family-regulator-localization)
- [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), through its citation of layer GH.7 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.7/yager-unramified-checkpoint`](#n-gh-7-yager-unramified-checkpoint); [`GH.7/ochiai-exponential-checkpoint`](#n-gh-7-ochiai-exponential-checkpoint). other roadmaps: `PadicHodgeRegulators:L3` (The big logarithm and explicit interpolation).

**Open items.** requests [L3](#req-11); gaps [G10](#gap-10).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH7`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.twoVariableRegulatorCheckpoint`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** Castella Theorem 3.7/Corollary 3.9 require λ_reg^{-1}J, nonexceptional arithmetic interpolation and the two local ranges. These are exact PHR owner requests, not an unrestricted coefficient-ring map.

**Sources.**

- [castella-variation](#src-castella-variation), §3.4, Theorem 3.7 and Corollary 3.9, pp.16–17: “Theorem 3.7. Let T be a p-ordinary deformation, and set λ := Ψ(Frp ) − 1 ∈ I. Then there
is an injective I[[G]]-linear map
                         LG : HIw
                       ” — The localized ideal target and both specialization ranges are the checkpoint.

<a id="n-gh-7-family-regulator-localization"></a>
### Anticyclotomic family regulator

`GH.7/family-regulator-localization` · comparison · part GH.0 · review: verified

Castella Proposition 5.2 supplies L_ωf^Γ:H¹_Iw(K∞/F,F⁺T†⊗ξ^{-1})→I[λ_reg^{-1}]⊗W[[Γ]], injective with pseudo-null cokernel. It pairs the local map with the canonical family differential functional of Lemma 5.1. Passing from the two-variable tower to Γ uses the H² correction; the needed vanishing is checked through H⁰(K∞,F⁺T)=0. A quotient of the local regulator cannot be declared injective solely by tensoring its source and target.

**Hypotheses and conventions.**

- The critical/CM twist is the one giving Ψ; λ_reg is inverted; H⁰/H² condition and the canonical family differential are fixed.

**Proof outline.**

1. Pair the imported map with the family ω functional and descend to Γ.
2. Use the specialization exact sequence and the H² correction to prove injectivity and the pseudo-null bound.

**Acceptance.**

- The nonexceptional condition λ_reg≠0 is retained in each arithmetic specialization.

**Used by.**

- [`GH.7/two-variable-explicit-reciprocity`](#n-gh-7-two-variable-explicit-reciprocity)
- [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), through its citation of layer GH.7 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity), through its citation of layer GH.7 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.7/two-variable-regulator-checkpoint`](#n-gh-7-two-variable-regulator-checkpoint); [`GH.7/family-representation-specialization`](#n-gh-7-family-representation-specialization); [`GH.7/critical-character-twist`](#n-gh-7-critical-character-twist). other roadmaps: `SelmerIwasawaCohomology:L3/iwasawa-shapiro` (Shapiro's lemma for Iwasawa cohomology).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH7`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.familyRegulatorLocalization`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** Castella Lemma 5.1/Proposition 5.2 pair with the canonical family differential. Injectivity after anticyclotomic descent uses the H²/H⁰ correction, not just tensoring an injective map.

**Sources.**

- [castella-variation](#src-castella-variation), §5.1, Lemma 5.1 and Proposition 5.2, pp.21–22: “Proposition 5.2. Let K∞ /F be a Z×    p -extension contained in L∞ obtained by adjoining the
torsion points of a relative Lubin–Tate formal group over F/Qp , and let Γ = Gal(K∞ /F ” — The localized scalar regulator uses a cohomological descent check.

<a id="n-gh-7-two-variable-explicit-reciprocity"></a>
### Two-variable explicit reciprocity

`GH.7/two-variable-explicit-reciprocity` · theorem · planet “Two-variable reciprocity law” · part GH.0 · review: corrected

In I[λ_reg^{-1}]⊗W[[Γ̃]], L_ωf^Γ(res_p Z_{c₀,∞}^{ξ^{-1}})=L_{p,ξ}(f)·σ_{−1,p}. This is Castella Theorem 5.3 with its own class/measure normalization; it has no additional −c₀^{r−1} prefactor. Its specialization must be compared with CH 5.7 through the named normalization adapter, not by identifying the two unnormalized class towers.

**Hypotheses and conventions.**

- Castella’s ordinary residual irreducible/p-distinguished family, local regulator domain, CM tower and measure; localized λ_reg.

**Proof outline.**

1. Verify the local restriction is in the plus-line Iwasawa source.
2. At a dense set of weight-two arithmetic specializations with sufficiently ramified φ, compute the Coleman evaluation and period-normalized CM measure (Proposition 5.4).
3. Apply family control and density; the local epsilon sign gives σ_{−1,p}.

**Acceptance.**

- Squaring conceals the class normalization; the family identity is kept linear.

**Used by.**

- [`GH.7/initial-family-specialization`](#n-gh-7-initial-family-specialization)
- [`GH.7/higher-weight-family-specialization`](#n-gh-7-higher-weight-family-specialization)
- [`GH.8/automorphic-reciprocity-export`](#n-gh-8-automorphic-reciprocity-export), through its citation of layer GH.7 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export), through its citation of layer GH.7 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.7/howard-family-tower`](#n-gh-7-howard-family-tower); [`GH.7/family-regulator-localization`](#n-gh-7-family-regulator-localization); [`GH.7/family-measure-specialization`](#n-gh-7-family-measure-specialization); [`GH.1/coleman-abel-jacobi-formula`](#n-gh-1-coleman-abel-jacobi-formula).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH7`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.twoVariableReciprocity`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (corrected).** Corrected Theorem 5.4 to Proposition 5.4. Castella Theorem 5.3 has σ_{−1,p} and no CH −c₀^{r−1} prefactor; density, source-qualified plus restriction and normalization are separate inputs.

**Sources.**

- [castella-variation](#src-castella-variation), §5.2, Theorem 5.3, Proposition 5.4 and proof, pp.22–25: “Theorem 5.3. The following equality holds in eIW [[Γ]]:
                                                   e
                                                    −1
                ” — The localized family reciprocity law uses the Artin sign translation.

<a id="n-gh-7-ordinary-localization-injective"></a>
### Ordinary localization injectivity

`GH.7/ordinary-localization-injective` · lemma · part GH.0 · review: verified

For the ordinary fixed-weight specialization with residual restriction to G_K irreducible, Castella Lemma 6.4 makes the localization Sel_Gr(K_{c₀p∞}/K_{c₀},T_f(r))→H¹_Iw(local,F⁺T_f(r)) injective. The proof uses Λ-torsion freeness and infinitely many arithmetic specializations where the global rank-one class and its local logarithm are nonzero. This additional result is what turns equality of local regulator images into equality of global classes.

**Hypotheses and conventions.**

- Residual |G_K irreducibility, ordinary filtration, torsion-free global module and nonzero local classes at infinitely many finite characters.

**Proof outline.**

1. Use the fixed-weight nonvanishing/reciprocity and Selmer rank-one result to show the finite-character localization kernels vanish.
2. Apply torsion freeness and infinitely many specializations to kill the global kernel.

**Acceptance.**

- Equality after a local regulator gives a global equality only after this injectivity input.

**Used by.**

- [`GH.7/initial-family-specialization`](#n-gh-7-initial-family-specialization)
- [`GH.7/higher-weight-family-specialization`](#n-gh-7-higher-weight-family-specialization)
- [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), through its citation of layer GH.7 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.6/anticyclotomic-nonvanishing`](#n-gh-6-anticyclotomic-nonvanishing); [`GH.6/selmer-rank-one`](#n-gh-6-selmer-rank-one); [`GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`](#n-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity). other roadmaps: `SelmerIwasawaCohomology:L2/galois-selmer-group` (Galois-cohomological Selmer groups); `SelmerIwasawaCohomology:L3/iwasawa-cohomology` (Iwasawa cohomology).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH7`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.ordinaryLocalizationInjective`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** Castella Lemma 6.4 is the additional global-to-local injectivity input, using infinitely many nonzero specializations and torsion freeness. Matching local regulator values alone would not give the global conclusion.

**Sources.**

- [castella-variation](#src-castella-variation), §6.1, Lemma 6.4, pp.26–27: “Lemma 6.4. Assume that ρ̄f |GK is irreducible. Then for every place v of Hco above p the
restriction map
                                                         1
                ” — Localization injectivity is a distinct ingredient in the global comparison.

<a id="n-gh-7-initial-family-specialization"></a>
### Initial family specialization

`GH.7/initial-family-specialization` · theorem · planet “Initial family specialization” · part GH.0 · review: verified

Under Castella Theorem 6.5, at an arithmetic ν of trivial character and weight 2rν>2 with 2rν≡k mod 2(p−1), ν(Z_{c₀,0})=(1−p^{rν−1}/ν(a_p))² AJ_et(Δ_heeg_{rν})/[u_{c₀}(2√−D_K)^{rν−1}], u_{c₀}=|O_{c₀}×|/2. Require k≡2 mod p−1, residual |G_K irreducibility, p-distinguishedness and ramification at every q|(D_K,N), with Castella’s odd-discriminant Heegner and split-p setup. The weight-two p-new exceptional prime is outside this theorem.

**Hypotheses and conventions.**

- All Castella §6.2 hypotheses; α=ν(a_p) is the ordinary root; period and cycle normalization fixed.

**Proof outline.**

1. Specialize family reciprocity and match it with CH’s fixed-weight identity using the normalization adapter.
2. Use the classical/generalized cycle comparison and its half-unit convention.
3. Use ordinary localization injectivity to promote the local equality to the global initial class.

**Acceptance.**

- At a vanishing ordinary Euler factor the initial class can vanish; no exceptional-branch claim is made.

**Used by.**

- [`GH.7/higher-weight-family-specialization`](#n-gh-7-higher-weight-family-specialization)

**Depends on.** this roadmap: [`GH.7/two-variable-explicit-reciprocity`](#n-gh-7-two-variable-explicit-reciprocity); [`GH.7/ordinary-localization-injective`](#n-gh-7-ordinary-localization-injective); [`GH.7/family-representation-specialization`](#n-gh-7-family-representation-specialization); [`GH.1/classical-generalized-cycle-comparison`](#n-gh-1-classical-generalized-cycle-comparison); [`GH.3/stabilized-first-step-adapter`](#n-gh-3-stabilized-first-step-adapter).

**Open items.** gaps [G5](#gap-5), [G8](#gap-8).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH7`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.initialFamilySpecialization`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** Castella Theorem 6.5 keeps weight >2, congruence and residual/bad-prime hypotheses, the squared initial Euler factor and half-unit normalization. The BDP2017 adapter is still a source gap; exceptional p-new weight two is excluded.

**Sources.**

- [castella-variation](#src-castella-variation), §6.2, Theorem 6.5 and proof, pp.27–28: “Theorem 6.5. Assume that:
      • k ≡ 2 (mod p − 1);
      • ρ̄f is ramified at every prime q | (DK , N );
      • ρ̄f p-distinguished;
      • ρ̄f |GK is irreducible.
Then for all” — The first specialization and its stronger residual hypotheses are explicit.

<a id="n-gh-7-higher-weight-family-specialization"></a>
### Higher-weight family specialization

`GH.7/higher-weight-family-specialization` · theorem · planet “Higher-weight specialization” · part GH.0 · review: verified

Under the same source-qualified hypotheses as the initial formula, c₀^{rν−1}ν(Z_{c₀,∞})=z_{fν,c₀,α} in the strict Greenberg Iwasawa Selmer module, α=ν(a_p). The system comparison is global: it uses the family local reciprocity, CH’s fixed-weight reciprocity, exact differential and c₀ normalization, plus localization injectivity. It includes finite conductor moments through Shapiro and the specified character twists, while keeping λ_reg exceptional primes outside the localized comparison.

**Hypotheses and conventions.**

- Castella Theorem 6.5: weight and parity congruence, trivial arithmetic character, residual |G_K irreducibility, p-distinguishedness, required bad-prime ramification, odd CM discriminant, split p, c₀ prime to Np.

**Proof outline.**

1. Compare both local regulator images at each nonexceptional arithmetic specialization with the exact c₀^{rν−1} factor.
2. Use Lemma 6.4 localization injectivity to identify global Iwasawa classes.
3. Project to finite conductor/character moments using the same Shapiro inversion and compare the initial formula.

**Acceptance.**

- The initial cycle equality and the full system equality are different conclusions; both retain their normalization factors.

**Used by.**

- [`GH.8/automorphic-reciprocity-export`](#n-gh-8-automorphic-reciprocity-export), through its citation of layer GH.7 ([cross-part prerequisites](#cross-part-prerequisites))
- [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), through its citation of layer GH.7 ([cross-part prerequisites](#cross-part-prerequisites))

**Depends on.** this roadmap: [`GH.7/initial-family-specialization`](#n-gh-7-initial-family-specialization); [`GH.7/ordinary-localization-injective`](#n-gh-7-ordinary-localization-injective); [`GH.7/two-variable-explicit-reciprocity`](#n-gh-7-two-variable-explicit-reciprocity); [`GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`](#n-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity). other roadmaps: `SelmerIwasawaCohomology:L3/iwasawa-shapiro` (Shapiro's lemma for Iwasawa cohomology).

**Proposed location.** `TauCeti/NumberTheory/GeneralizedHeegner/GH7`, namespace `TauCeti.GeneralizedHeegner`, declaration `TauCeti.GeneralizedHeegner.higherWeightFamilySpecialization`.

**Suggested file.** declaration, API items and unit tests all present.

**Independent review (verified).** Castella (6.7)/Theorem 6.5 compares the actual global systems with c₀^{r−1}, character twists, conductor moments and localization injectivity. It does not identify unnormalized CH/Castella towers or include exceptional regulator primes.

**Sources.**

- [castella-variation](#src-castella-variation), §6.2, Theorem 6.5, (6.7), pp.27–28: “Theorem 6.5. Assume that:
      • k ≡ 2 (mod p − 1);
      • ρ̄f is ramified at every prime q | (DK , N );
      • ρ̄f p-distinguished;
      • ρ̄f |GK is irreducible.
Then for all” — Gives the full higher-weight Iwasawa class comparison, with c₀^{rν−1}.

<a id="layer-gh-8"></a>
## GH.8 — Weight-two and main-conjecture consumer comparisons

*Part GH.8. Coverage: planned. 16 nodes, 4 planets.*

The layer compares the weight-two specialization with the Heegner point system and hands the source-qualified formulas to the two main-conjecture consumers. Equality of two scalar logarithms is never a substitute for equality of classes: every comparison goes through the actual modular quotient, coefficient lattice, differential, character twist, conductor normalization and period maps.

- **Weight two.** The m = 0 cycle is the CM point minus a cusp, e_f([x_φ] − [b]); under the modular quotient q_π: J → E its Abel–Jacobi class is the Kummer class of π(x_φ) − π(b). Finite character sums commute with the comparison without averaging; positive-conductor stabilization and its normalized tail compare directly, while the initial Euler factor needs the raw first trace and degree (an algebraic lemma, plus the obstruction to rescaling only the bottom). A common reverse map with one scalar bounds kernels and cokernels of the integral towers; a counterexample shows that levelwise rational isomorphisms do not compare integral limits. The modular differential enters through π^*ω_E = c_π ω_f, giving c_π^{-2} in a squared identity.
- **Families and reciprocity.** The p-old weight-two specialization of the ordinary family (Castella Remark 6.6) and weight-two reciprocity: CH Theorem 5.7 at r = 1 transported to the elliptic curve, −c_π L_{p,ψ}(f) σ_{−1,p}.
- **Exports.** To AutomorphicCongruences L2, the CH and Castella reciprocity identities with their coefficient maps and exact ranges; to RankZeroOneBSD BSD.6a, the higher-weight inputs of Castella's corrected multiplicative proof, whose nonsplit tame-level range and integral leading-class unit are recorded gaps. The consumers prove their own congruences and divisibilities.

The GH.8 part cites earlier layers by layer id; the [cross-part prerequisites](#cross-part-prerequisites) give the supplying nodes.

**Planets.** Weight-two Abel–Jacobi comparison ([`GH.8/modular-quotient-kummer`](#n-gh-8-modular-quotient-kummer)); Modular differential comparison ([`GH.8/differential-evaluation`](#n-gh-8-differential-evaluation)); Weight-two ordinary-family comparison ([`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family)); Weight-two explicit reciprocity ([`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity)).

**Still open in this layer.**

- Realize the degree-one Picard–Kummer/Gysin and de Rham quotient comparisons, including restriction/logarithm and corestriction/trace base-change squares at ramified local conductor fields, and the selected uniform integral lattice maps.
- Supply the repaired CM carrier, quotient action and finite-character specialization/descent.
- Instantiate the actual first trace/degree and source-normalization square using the finer HE.0/HE.2/HE.3/HE.8 plans. Retain HE.8’s E(K)[p]=0 and finite-component hypotheses.
- Prove the regulator quotient kernel, global localization chain, source-version pairing/period diagram and legal coefficient specializations.
- Supply the nonsplit tame-level and weight-admissibility adapters and integral Kolyvagin leading-class unit for the corrected BSD auxiliary forms.
- Express the arithmetic signatures once the named supplier APIs exist; the current suggested file checks only algebraic compatibility.

**Target inventory of the GH.8 part.**

| Target | Nodes |
|---|---|
| Weight two agrees with HE.3/HE.8 | [`GH.8/weight-zero-cycle`](#n-gh-8-weight-zero-cycle), [`GH.8/modular-quotient-kummer`](#n-gh-8-modular-quotient-kummer), [`GH.8/character-sum-comparison`](#n-gh-8-character-sum-comparison), [`GH.8/positive-conductor-stabilization`](#n-gh-8-positive-conductor-stabilization), [`GH.8/positive-tail-corestriction`](#n-gh-8-positive-tail-corestriction), [`GH.8/initial-corestriction-comparison`](#n-gh-8-initial-corestriction-comparison), [`GH.8/primitive-character-stabilization`](#n-gh-8-primitive-character-stabilization) |
| Exact modular-parametrization, differential, twist and period comparisons | [`GH.8/differential-evaluation`](#n-gh-8-differential-evaluation), [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity) |
| Integral lattice/Iwasawa comparison without unbounded denominators | [`GH.8/uniform-coherent-kernel-bound`](#n-gh-8-uniform-coherent-kernel-bound), [`GH.8/uniform-coherent-lift`](#n-gh-8-uniform-coherent-lift), [`GH.8/unbounded-denominators-counterexample`](#n-gh-8-unbounded-denominators-counterexample), [`GH.8/initial-only-rescaling-obstruction`](#n-gh-8-initial-only-rescaling-obstruction) |
| Source-qualified GH.4/GH.7 exports to the two main-conjecture consumers | [`GH.8/automorphic-reciprocity-export`](#n-gh-8-automorphic-reciprocity-export), [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export) |

**Ownership recorded by the GH.8 part.**

- `ModularIwasawaMainConjectures:L6`: Generic canonical coefficient-ring, determinant-line, characteristic-ideal, primitive/imprimitive and BDP square-root-versus-square comparisons. GH.8 supplies its geometric, differential and source-qualified producer maps; L6 is not an early GH.8 prerequisite.
- `AutomorphicCongruences:L2`: FW congruence divisibilities, period-integrality and excluded height-one-prime arguments; its Rankin–Eisenstein/Beilinson–Flach system is distinct from GH.8 Heegner exports.
- `RankZeroOneBSD:BSD.6a`: Auxiliary-form selection, lattice and analytic congruences, Selmer control, divisibilities, integral ambiguities and arithmetic specialization; separate BSTW/CLW supersingular route.

<a id="n-gh-8-weight-zero-cycle"></a>
### The weight-two cycle is the corrected CM divisor

`GH.8/weight-zero-cycle` · comparison · part GH.8 · review: verified

Let C be the modular curve used by the BDP construction, L a characteristic-zero field over which the CM point x_φ and a degree-one cusp b are rational, and identify X_0 with C by the empty-fiber-power identification. The homologically trivial weight-two cycle is [x_φ]-[b] in CH^1(C_L)_Q. After applying the chosen cuspidal Hecke correspondence e_f it is e_f([x_φ]-[b]). The raw point [x_φ] has degree one and is not the input to the degree-zero Abel–Jacobi map.

**Hypotheses and conventions.**

- BDP's fiber-power index is k-2, whereas CH writes the weight as 2r; weight two means respectively index 0 and r=1.
- Use the actual level structure and its field of definition. A ring class field alone is not asserted to define every chosen level point or cusp.
- The empty fiber-power identification and e_f are supplied by GH.0–GH.1, not new abstract carriers.

**Proof outline.**

1. Compute the zeroth graph product in the fiber above x_φ and carry it through X_0=C.
2. Subtract the chosen cusp and compute its degree as 1-1. On a smooth proper curve this degree-zero class has zero geometric degree-two cycle class.
3. Apply the already constructed correspondence; do not apply the positive-fiber-power vanishing argument at index zero.

**Acceptance.**

- x_φ=b gives zero, whereas retaining [x_φ] gives degree one.
- Changing b to b_prime changes the class by [b]-[b_prime], not a literal integral independence assertion.
- Test k=2 against both source indices and retain the field extension needed for the level structure.

**Used by.**

- [`GH.8/modular-quotient-kummer`](#n-gh-8-modular-quotient-kummer)

**Depends on.** this roadmap: [GH.0](#layer-gh-0) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)); [GH.1](#layer-gh-1) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)). other roadmaps: `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation` (Heegner point family).

**Open items.** requests [GH.0](#req-19); gaps [G20](#gap-20), [G24](#gap-24).

**Proposed location.** `TauCeti/NumberTheory/HeegnerCycles/WeightTwo`, namespace `TauCeti.GeneralizedHeegnerCycles.WeightTwo`.

**Suggested file.** arithmetic signature omitted: Actual arithmetic supplier carriers and maps are unavailable at the pins. The suggested file lists this target and any expressible algebraic component explicitly; it does not invent a curve, cohomology, regulator or coefficient ring.

**Independent review (verified).** BDP Section 2.3 identifies the zero-power cycle as the degree-zero point-minus-cusp divisor; field of definition, projector and homological triviality remain explicit.

**Sources.**

- [bdp-published-2013-gh8](#src-bertolini-darmon-prasanna-generalized-heegner), Section 2.3, Proposition 2.7 and preceding paragraph, printed p. 1063: “PROPOSITION 2.7” — The preceding paragraph supplies the index-zero cusp correction; the proposition gives homological triviality.

<a id="n-gh-8-modular-quotient-kummer"></a>
### Abel–Jacobi and Kummer classes under the modular quotient

`GH.8/modular-quotient-kummer` · theorem · planet “Weight-two Abel–Jacobi comparison” · part GH.8 · review: verified

For the preceding C, x_φ, b and L, let J=Pic^0(C), let π:C→E be the chosen modular parametrization defined over L, and let q_π:J→E satisfy q_π([x]-[b])=π(x)-π(b). Let θ_C:V_p J → H^1_et(C̄,Q_p(1)) be the Picard–Kummer identification. With the corresponding f-projector on J satisfying q_π e_f=q_π, set γ_π=V_p(q_π) composed with θ_C^{-1}. Then H^1(L,γ_π)(AJ_et(e_f([x_φ]-[b]))) equals κ_E(π(x_φ)-π(b)) in H^1_cont(L,V_p E). Both sides may be extended to the same finite coefficient field. This is a rational-coefficient statement; it does not identify two chosen integral lattices.

**Hypotheses and conventions.**

- C is smooth, proper and geometrically connected, L has characteristic zero, and p is prime.
- Use the GH.1 Hochschild–Serre/Gysin convention, with connecting cocycle σ(Q)-Q.
- The Picard–Kummer comparison and correspondence action must agree with that convention; see the GH.1 request.
- The actual quotient supplies q_π and q_π e_f=q_π; equality of dimensions or eigenvalues does not.

**Proof outline.**

1. Use the finite-level Picard–Kummer/Gysin comparison to identify the degree-one Abel–Jacobi class with the Kummer class of its divisor class in J. The sign comparison is explicitly requested from GH.1.
2. For a p^n-division point Q, applying q_π takes σ(Q)-Q to the connecting cocycle of q_π([D]); changes of Q give corresponding coboundaries.
3. Use compatible division points and the continuous-cochain/adic realization comparison, not an unproved interchange of H^1 and inverse limits.
4. Apply q_π e_f=q_π and the preceding divisor description, retaining the basepoint translation.

**Acceptance.**

- For C=E, origin b and identity π, recover the rational Kummer class.
- Replacing b by b_prime adds κ_E(π(b)-π(b_prime)).
- Torsion basepoint differences vanish rationally; p-primary torsion cannot be discarded integrally.
- An isogeny of rational representations need not identify the integral Tate lattices.

**Used by.**

- [`GH.8/character-sum-comparison`](#n-gh-8-character-sum-comparison)
- [`GH.8/positive-conductor-stabilization`](#n-gh-8-positive-conductor-stabilization)
- [`GH.8/differential-evaluation`](#n-gh-8-differential-evaluation)
- [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family)
- [`GH.8/primitive-character-stabilization`](#n-gh-8-primitive-character-stabilization)
- [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity)

**Depends on.** this roadmap: [`GH.8/weight-zero-cycle`](#n-gh-8-weight-zero-cycle); [GH.1](#layer-gh-1) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)). other roadmaps: `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation` (Heegner point family); `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions` (Heegner Kummer classes).

**Open items.** requests [GH.1](#req-20); gaps [G19](#gap-19), [G24](#gap-24).

**Proposed location.** `TauCeti/NumberTheory/HeegnerCycles/WeightTwo`, namespace `TauCeti.GeneralizedHeegnerCycles.WeightTwo`.

**Suggested file.** arithmetic signature omitted: Actual arithmetic supplier carriers and maps are unavailable at the pins. The suggested file lists this target and any expressible algebraic component explicitly; it does not invent a curve, cohomology, regulator or coefficient ring.

**Independent review (verified).** The actual Picard/Jacobian multiplication sequence and the signed two-support Gysin comparison are precise GH.1 obligations; the quotient Kummer target does not assume them proved.

**Sources.**

- [bdp-published-2013-gh8](#src-bertolini-darmon-prasanna-generalized-heegner), Section 3.1, Definition 3.1 and Remark 3.2, printed pp. 1065--1066: “Remark 3.2” — Supplies the extension realization; the finite Picard comparison is a separate requested proof.
- [castella-family-author-gh8](#src-castella-variation), Remark 6.6, p. 29: “Kummer images” — The actual quotient map and basepoint identify the weight-two objects used by the remark.

<a id="n-gh-8-character-sum-comparison"></a>
### Character-weighted comparison without averaging

`GH.8/character-sum-comparison` · lemma · part GH.8 · review: verified

Let F/L be a finite abelian extension defining a compatible family of the preceding cycles and points, let G=Gal(F/L), and let χ:G→B^x be a character in a common coefficient field B. For the G-equivariant scalar extension γ_* of the preceding comparison, γ_*(sum_g χ(g) g.z)=sum_g χ(g) g.κ_E(P). With this left-action convention each weighted sum lies in the χ^{-1}-eigenspace. No factor 1/|G| is introduced. A descent to H^1(L,V tensor χ), if used, is a further cohomological map with its own hypotheses.

**Hypotheses and conventions.**

- The coefficient representations extend to G_L, giving the quotient action on H^1(F,-).
- The parametrization, correspondence and comparison descend to L.
- χ is finite order with values in B; it is not an unspecified Hecke character or averaging idempotent.

**Proof outline.**

1. Apply the quotient comparison to every conjugate.
2. Commute the equivariant linear map with the finite weighted sum.
3. For h in G substitute t=hg; χ(h^{-1}t)=χ(h)^{-1}χ(t).
4. An averaging projector needs |G| invertible; inflation–restriction descent is a separate argument.
5. Identify the finite group action on continuous cohomology from GH.3; apply the coefficient-map naturality of GH.1. The weighted finite sum has the inverse-character eigenspace convention. Restriction and twisted descent must realize that convention rather than assuming invariants under the untwisted action.

**Acceptance.**

- The trivial character gives the trace, not the average.
- For a cyclic group of order three, check the inverse-character eigenvalue.
- When p divides |G|, the unnormalized sum is integral but division by |G| is not.

**Used by.**

- [`GH.8/primitive-character-stabilization`](#n-gh-8-primitive-character-stabilization)

**Depends on.** this roadmap: [`GH.8/modular-quotient-kummer`](#n-gh-8-modular-quotient-kummer); [GH.1](#layer-gh-1) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)); [GH.3](#layer-gh-3) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)). other roadmaps: `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions` (Heegner Kummer classes). libraries: `mathlib:LinearMap`.

**Open items.** requests [GH.1](#req-20), [GH.3](#req-21); gaps [G20](#gap-20), [G24](#gap-24).

**Proposed location.** `TauCeti/NumberTheory/HeegnerCycles/WeightTwo`, namespace `TauCeti.GeneralizedHeegnerCycles.WeightTwo`.

**Suggested file.** arithmetic signature omitted: Actual arithmetic supplier carriers and maps are unavailable at the pins. The suggested file lists this target and any expressible algebraic component explicitly; it does not invent a curve, cohomology, regulator or coefficient ring.

**Independent review (verified).** Linear transport of the unaveraged finite sum is valid; χ-inverse eigenspace and arithmetic descent are separated and requested.

**Sources.**

- [ch-author-2022-gh8](#src-castella-hsieh), Section 5.2, character specialization after equation (5.1) and Lemma 5.4: “Lemma 5.4.” — Direct reindexing fixes the convention without the problematic Section 4.4 identification.

<a id="n-gh-8-positive-conductor-stabilization"></a>
### Comparison of positive-conductor stabilized classes

`GH.8/positive-conductor-stabilization` · comparison · part GH.8 · review: corrected

Let p be good ordinary for a weight-two form f of trivial character, and let α be the unit root of X^2-a_p X+p. Put K_n=K_{c₀ p^n} with (c₀,p)=1. For n≥1 let z_n be the rational corrected cycle class and k_n=κ_E(P_n) its image under compatible maps γ_n. Then γ_n(z_n-α^{-1} res(z_{n-1}))=k_n-α^{-1} res(k_{n-1}). This compares only the p-divisible-conductor branch. The α^{-n} normalization belongs to the tower, not to the unnormalized stabilized finite-level class.

**Hypotheses and conventions.**

- CM points, basepoints and coefficient identifications are compatible with the field inclusions.
- p splits, the imaginary quadratic discriminant is less than -3, all level primes split, and p does not divide 2N φ(N), in the weight-two CH range.
- Use the same coefficient extension containing α and the actual continuous-cohomology restriction.
- When invoking the existing HE.8 point-system nodes, retain their E(K)[p]=0 hypothesis and their actual ring-class-to-anticyclotomic trace/index maps. For auxiliary c₀ retain the finite ring-class component until its explicit corestriction; this is not an automatic identification with the c₀=1 system.

**Proof outline.**

1. At r=1, p^{2r-2}/α becomes α^{-1}.
2. Apply the quotient comparison at n and n-1.
3. Use restriction naturality and linearity; no initial-conductor formula is needed.

**Acceptance.**

- The coefficient is α^{-1}, not p/α.
- At n=1 the lower class is raw conductor-c₀, not an unverified stabilized bottom.
- A nonordinary α is rejected for integral normalization although the rational linear identity can be written.

**Used by.**

- [`GH.8/positive-tail-corestriction`](#n-gh-8-positive-tail-corestriction)
- [`GH.8/primitive-character-stabilization`](#n-gh-8-primitive-character-stabilization)

**Depends on.** this roadmap: [`GH.8/modular-quotient-kummer`](#n-gh-8-modular-quotient-kummer). other roadmaps: `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions` (Heegner Kummer classes); `HeegnerPointEulerSystems:HE.8/ordinary-stabilized-point` (Ordinary stabilization of Heegner points). libraries: `mathlib:LinearMap`.

**Open items.** gaps [G24](#gap-24).

**Proposed location.** `TauCeti/NumberTheory/HeegnerCycles/WeightTwo`, namespace `TauCeti.GeneralizedHeegnerCycles.WeightTwo`.

**Suggested file.** arithmetic signature omitted: Actual arithmetic supplier carriers and maps are unavailable at the pins. The suggested file lists this target and any expressible algebraic component explicitly; it does not invent a curve, cohomology, regulator or coefficient ring.

**Independent review (corrected).** Confirmed r=1 gives α^{-1} and retains α^{-n} only for normalization; added the present HE.8 E(K)[p]=0 and finite-component import conditions.

**Sources.**

- [ch-author-2022-gh8](#src-castella-hsieh), Section 5.2, Definition 5.2 and equation (5.1), pp. 22--23: “Definition 5.2.” — Separates positive-conductor stabilization from tower normalization.

<a id="n-gh-8-positive-tail-corestriction"></a>
### Corestriction of the normalized positive-conductor tail

`GH.8/positive-tail-corestriction` · lemma · part GH.8 · review: corrected

In the preceding ordinary split setting, assume the actual geometric trace relation cor(k_n)=a_p k_{n-1}-res(k_{n-2}) and [K_n:K_{n-1}]=p for n≥2. Define y_n=α^{-n}(k_n-α^{-1} res(k_{n-1})) for n≥1. Then cor(y_n)=y_{n-1} for every n≥2. The uniquely determined bottom term is y_0=cor(y_1). Its Euler-factor expression is specified by initial-corestriction-comparison once the distinct first trace and degree have been supplied.

**Hypotheses and conventions.**

- The lower restriction in the trace equation lands in K_{n-1}.
- The raw trace and degree are geometric results, not postulated normalized Euler-system relations.
- Corestriction after restriction is the degree; the lattice contains the raw classes and α is a unit for integral boundedness.
- When invoking the existing HE.8 point-system nodes, retain their E(K)[p]=0 hypothesis and their actual ring-class-to-anticyclotomic trace/index maps. For auxiliary c₀ retain the finite ring-class component until its explicit corestriction; this is not an automatic identification with the c₀=1 system.

**Proof outline.**

1. Corestriction of k_n-α^{-1}res(k_{n-1}) is (a_p-p/α)k_{n-1}-res(k_{n-2}).
2. The Hecke polynomial gives a_p-p/α=α.
3. Multiply by α^{-n}.
4. The single equation at n=1 determines the bottom. The first-conductor comparison is distinct; GH.3 supplies the actual Iwasawa realization.
5. If two actual positive tails are identified by comparison maps commuting with the first corestriction, their norm-compatible bottoms agree by that commutative square. This determines the bottom from the tail, but does not identify the printed conductor-zero formula without the actual initial trace and normalization map.
6. Compare with HE.8 ordinary-stabilized-point, stabilized-corestriction and anticyclotomic-heegner-class at the actual ring-class levels before taking its anticyclotomic quotient; use the supplier’s layer shift if the p-part of the class group changes the indexing.

**Acceptance.**

- Check n=2 without a degree-p claim for K_1/K_0.
- Using 1/α in place of p/α fails the Hecke-polynomial calculation.
- The bottom is determined before expressing it using the two Frobenius operators.
- The abstract positive-tail calculation does not prove E(K)[p]=0. Verify this separately whenever importing the present HE.8 arithmetic realization.

**Used by.**

- [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity)

**Depends on.** this roadmap: [`GH.8/positive-conductor-stabilization`](#n-gh-8-positive-conductor-stabilization); [GH.3](#layer-gh-3) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)). other roadmaps: `HeegnerPointEulerSystems:HE.2/repeated-conductor-predecessor-recurrence` (Repeated-conductor predecessor relation); `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions` (Heegner Kummer classes); `HeegnerPointEulerSystems:HE.8/stabilized-corestriction` (Norm compatibility of stabilized Heegner points); `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class` (Anticyclotomic Heegner class). libraries: `mathlib:LinearMap`.

**Open items.** requests [GH.3](#req-21); gaps [G21](#gap-21), [G24](#gap-24).

**Proposed location.** `TauCeti/NumberTheory/HeegnerCycles/WeightTwo`, namespace `TauCeti.GeneralizedHeegnerCycles.WeightTwo`.

**Suggested file.** arithmetic signature omitted: Actual arithmetic supplier carriers and maps are unavailable at the pins. The suggested file lists this target and any expressible algebraic component explicitly; it does not invent a curve, cohomology, regulator or coefficient ring.

**Independent review (corrected).** The n≥2 degree-p algebra is correct and does not determine a printed first-step convention; added HE.8 range checks without imposing them on the abstract calculation.

**Sources.**

- [ch-published-2018-gh8](#src-castella-hsieh-published), Proposition 4.4, printed pp. 591--593; Lemma 5.3, printed pp. 601--602: “for all n > 1” — The split recurrence is explicitly in the positive range; it is not a computation of the initial split case.

<a id="n-gh-8-differential-evaluation"></a>
### The modular differential factor in the logarithm comparison

`GH.8/differential-evaluation` · theorem · planet “Modular differential comparison” · part GH.8 · review: corrected

Base change the quotient comparison to a finite unramified extension L_v/Q_p with the good-reduction models used in BDP Section 3. If π^*ω_E=c_π ω_f for the chosen invariant and modular differentials, then log_{E,ω_E}(π(x_φ)-π(b))=c_π AJ_dR(e_f([x_φ]-[b]))(ω_f), transporting the realization and f-projection through the same quotient. Replacing the Abel–Jacobi evaluation by the elliptic logarithm in a squared identity introduces c_π^{-2}, not c_π^{-1}. No claim that c_π=1 or is a p-adic unit is made.

**Hypotheses and conventions.**

- Use the GH.1 and PadicHodgeRegulators L1 local realization; do not extend the inspected unramified-base theorem without proof.
- c_π is the actual nonzero pullback scalar.
- The f-projector fixes the differential and is compatible with the quotient and pairing.
- The elliptic logarithm includes its compatible extension from the formal group to the rational Kummer image.
- To use this comparison at a ramified conductor completion E, first obtain the finite-base-change restriction and corestriction/trace squares requested from GH.1 and PadicHodgeRegulators L1. This node retains the inspected unramified-base statement; it does not silently enlarge it.

**Proof outline.**

1. Localize the quotient/Kummer comparison.
2. Apply naturality of the Bloch–Kato logarithm and its formal-group comparison.
3. Use adjunction of the de Rham quotient and differential pullback.
4. Evaluate c_π ω_f and square the resulting equality; cancellation uses c_π nonzero.

**Acceptance.**

- Scaling ω_E by u scales the equality by u and its square by u^2.
- For c_π=3 use 1/9, not 1/3, in the squared substitution.
- A p-divisible scalar need not preserve an integral principal ideal.
- The zero CM-power exponent at weight two does not cancel c_π.
- A conductor c₀ p^n completion is not treated as unramified merely because the regulator coefficient extension is completed unramified. The local field and coefficient field are separate data.

**Used by.**

- [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity)

**Depends on.** this roadmap: [`GH.8/modular-quotient-kummer`](#n-gh-8-modular-quotient-kummer); [GH.1](#layer-gh-1) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)). other roadmaps: `PadicHodgeRegulators:L1` (Bloch–Kato maps). libraries: `mathlib:Module.Dual`, `mathlib:LinearMap.dualMap_apply`, `mathlib:LinearMap.dualMap_comp_dualMap`.

**Open items.** requests [GH.1](#req-20), [L1](#req-22); gaps [G19](#gap-19), [G24](#gap-24).

**Proposed location.** `TauCeti/NumberTheory/HeegnerCycles/WeightTwo`, namespace `TauCeti.GeneralizedHeegnerCycles.WeightTwo`.

**Suggested file.** arithmetic signature omitted: Actual arithmetic supplier carriers and maps are unavailable at the pins. The suggested file lists this target and any expressible algebraic component explicitly; it does not invent a curve, cohomology, regulator or coefficient ring.

**Independent review (corrected).** Retained BDP’s finite-unramified good-reduction statement; made the ramified-conductor base-change squares explicit and added the c_π^{-2} algebraic signature/regressions.

**Sources.**

- [bdp-published-2013-gh8](#src-bertolini-darmon-prasanna-generalized-heegner), Sections 3.2--3.4, printed pp. 1066--1070: “p-adic Abel–Jacobi map” — The quotient-adjunction and scalar calculation specify the comparison with the local realization.

<a id="n-gh-8-ordinary-p-old-family"></a>
### Weight-two p-old specialization of the ordinary family

`GH.8/ordinary-p-old-family` · theorem · planet “Weight-two ordinary-family comparison” · part GH.8 · review: verified

Use the integral Hida branch I, critically twisted representation T†, and Howard class Z_{c₀,∞} constructed in GH.7 with Castella's author-copy normalization. Let its reference form have even weight k>2 with k congruent to 2 modulo p-1, and let ν be an arithmetic specialization of weight two and trivial character with 2 congruent to k modulo 2(p-1). Suppose its form is the ordinary p-stabilization of a newform of level prime to p. With α=ν(a_p), the source-normalized comparison is ν(Z_{c₀,∞})=z_{f_ν,c₀,α} in the identified Greenberg Iwasawa cohomology of T_{f_ν}(1). The coefficient-specialization and critical-twist identification are part of the map. This target does not identify every later version of the CH classes without a normalization map.

**Hypotheses and conventions.**

- p does not divide 6N; c₀ is prime to pN; the imaginary quadratic discriminant is odd and less than -3; p splits.
- For comparison with CH impose the all-split classical Heegner hypothesis; this is a restricted common range, not all ramified-level cases in Castella.
- The residual representation is p-distinguished and remains irreducible over G_K. Retain the source ramification condition at primes dividing (D_K,N), vacuous in this common range.
- Use the source lattices, ordinary filtration and specialization, not arbitrary rationally isomorphic representations.
- Exclude p-new/multiplicative and nonordinary weight-two specializations.

**Proof outline.**

1. Use the actual weight-two quotient/Kummer comparison to identify both inputs of Castella equation (6.6). GH.7 supplies moments, critical twists and the coefficient/regulator specialization maps of (6.8)–(6.9).
2. For global localization injectivity, follow Castella Lemma 6.4 through GH.7: torsion-freeness of the integral Greenberg module, specialization/control of the localization kernel, nonvanishing at infinitely many characters on every finite ring-class component, and the rank-one Selmer conclusion. Irreducibility alone is not that proof.
3. For local injectivity, GH.7 must transport the two-variable regulator of Loeffler–Zerbes Proposition 4.11, whose hypothesis is an infinite unramified direction, through CH Theorem 5.1's quotient construction. Identify the coefficient algebra and the source/target submodules P,Q before taking quotients. For its linear map f, the pinned Submodule.ker_mapQ gives the descended kernel as the image of f^{-1}(Q) in M/P. The sufficient equality f^{-1}(Q)=P is an additional arithmetic/analytic obligation; injectivity before quotienting does not imply it.
4. After the vector regulator descends injectively, evaluate on the specified nonzero dual vector of the one-dimensional ordinary crystalline line. CH (2022) Section 5.3 supplies the nonzero projection and the period relation (5.3); GH.7 must realize that pairing and coefficient extension. Evaluation on the full two-dimensional crystalline space is not injective in general.
5. Transport the source-version pairing and group-like factors before comparing (6.8)–(6.9). Apply local injectivity, then global localization injectivity. At weight two c₀^{r_ν-1}=1. Neither the quotient-kernel calculation nor the fixed-denominator lemmas supplies the missing period, realization or lattice maps.

**Acceptance.**

- Admit ordinary p-stabilizations of prime-to-p newforms, not p-new forms.
- Check both weight congruences, not just evenness.
- Keep the finite ring-class component; this is not automatically the class traced to K.
- Do not infer global-class equality from scalar regulator values without both injectivity statements.
- Injectivity must survive the actual quotient: multiplication by X on Q[X] is injective but induces the zero map on Q[X]/(X), a nonzero quotient. This is a regression against an invalid general inference, not a counterexample to the arithmetic source theorem.
- Nonzero evaluation on a one-dimensional line is injective. Projection from Q^2 to its first coordinate is not: (0,1) is lost. Keep the ordinary line, its dual vector and the nonzero pairing factor.

**Used by.**

- [`GH.8/automorphic-reciprocity-export`](#n-gh-8-automorphic-reciprocity-export)

**Depends on.** this roadmap: [`GH.8/modular-quotient-kummer`](#n-gh-8-modular-quotient-kummer); [GH.3](#layer-gh-3) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)); [GH.4](#layer-gh-4) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)); [GH.7](#layer-gh-7) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)). libraries: `mathlib:Submodule.mapQ`, `mathlib:Submodule.ker_mapQ`, `mathlib:Submodule.mkQ_map_self`, `mathlib:LinearMap.ker_eq_bot`.

**Open items.** requests [GH.3](#req-21), [GH.4](#req-23), [GH.7](#req-24); gaps [G20](#gap-20), [G21](#gap-21), [G22](#gap-22), [G24](#gap-24).

**Proposed location.** `TauCeti/NumberTheory/HeegnerCycles/WeightTwo`, namespace `TauCeti.GeneralizedHeegnerCycles.WeightTwo`.

**Suggested file.** arithmetic signature omitted: Actual arithmetic supplier carriers and maps are unavailable at the pins. The suggested file lists this target and any expressible algebraic component explicitly; it does not invent a curve, cohomology, regulator or coefficient ring.

**Independent review (verified).** Read Castella Lemma 6.4, Theorem 6.5 and Remark 6.6. Both weight congruences, p-old range, localization, quotient-kernel and ordinary-line pairing obligations are retained.

**Sources.**

- [castella-family-author-gh8](#src-castella-variation), Theorem 6.5, equations (6.8)--(6.9), p. 28; Remark 6.6, p. 29: “weight 2 and trivial character” — The theorem is higher-weight; the remark gives the stated p-old weight-two extension.
- [lz14-v3-gh8](#src-lz14-v3-gh8), Proposition 4.11 and proof, p. 18; context Theorem 4.7, pp. 16--17: “the regulator map” — The two-variable injectivity input includes the infinite-unramified-direction hypothesis; quotient descent still requires its own kernel calculation.
- [ch-author-2022-gh8](#src-castella-hsieh), Theorem 5.1 and proof, pp. 21--22; Section 5.3, (5.3) and Lemma 5.5, p. 24: “Thus quotienting” — Locates the quotient step and the subsequent nonzero ordinary-line pairing; neither is replaced by a generic claim that injective maps stay injective after quotienting.
- [mathlib-quotient-082e2d3-gh8](#src-mathlib-quotient-082e2d3-gh8), Quotient/Basic.lean lines 228--229, together with 158--159 and Submodule/Ker.lean 199--200: “ker_mapQ” — Provides the existing algebraic kernel calculation used to specify the unresolved arithmetic descent condition.

<a id="n-gh-8-initial-corestriction-comparison"></a>
### The initial Euler factor from the raw trace and degree

`GH.8/initial-corestriction-comparison` · lemma · part GH.8 · review: verified

Let F be a field, M_0 and M_1 F-vector spaces, res:M_0→M_1 and cor:M_1→M_0 linear, and σ,τ endomorphisms of M_0. Let α,u be nonzero scalars, and a,p,d scalars satisfying α^2-a α+p=0 and u d=p-1. If u cor(x_1)=a x_0-σ(x_0)-τ(x_0), cor(res(x_0))=d x_0 and σ(τ(x_0))=x_0, then cor(α^{-1}(x_1-α^{-1}res(x_0)))=u^{-1}(1-α^{-1}σ)(1-α^{-1}τ)x_0.

**Hypotheses and conventions.**

- This is the algebraic comparison lemma. The symbols p,u,d are scalars, not implicit arithmetic objects.
- For application, HE.0 and HE.2 must identify u with the actual conductor-change unit index and d with the first field degree for the specified class convention.
- Only σ(τ(x_0))=x_0 is needed; no unmentioned splitting or commutation theorem is assumed.

**Proof outline.**

1. Read the HE.0 conductor-change-kernel and ring-class-tower-quotients together with HE.2 split-ramified-first-step-recurrence. Transport their actual point trace through HE.3 Kummer naturality, keeping any cleared Hodge/basepoint factor. The algebraic identity below applies only once u, d, σ and τ have been identified with these maps; a published positive-conductor recurrence does not prove this initial identification.
2. Expand corestriction by linearity, and multiply by u α. The raw trace and u d=p-1 yield (a-(p-1)/α)x_0-σ(x_0)-τ(x_0).
3. The root identity gives a-(p-1)/α=α+α^{-1}.
4. Expand the two Euler factors and use σ(τ(x_0))=x_0. Cancel the nonzero scalars.
5. In the actual ring-class application the degree and raw trace must first be transported through the level maps, cusp correction and quotient. This lemma does not certify that transport.

**Acceptance.**

- For σ=τ=id the factor is u^{-1}(1-α^{-1})^2.
- Exact rational test: p=5, α=2, a=9/2, u=1, d=4, x_0=1, cor=id, res=4 and x_1=5/2 give normalized bottom 1/4. These are algebraic test data, not asserted modular-form coefficients.
- Using the full unit count 2 instead of the index 1 in that test predicts 1/8 and fails.
- No degree-p assertion is made for the initial step.

**Used by.**

- [`GH.8/initial-only-rescaling-obstruction`](#n-gh-8-initial-only-rescaling-obstruction)
- [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity)

**Depends on.** other roadmaps: `HeegnerPointEulerSystems:HE.0/conductor-change-kernel` (Conductor-change kernel); `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients` (Ring-class tower and finite Galois quotients); `HeegnerPointEulerSystems:HE.2/split-ramified-first-step-recurrence` (Split and ramified first-step relations); `HeegnerPointEulerSystems:HE.2/repeated-conductor-predecessor-recurrence` (Repeated-conductor predecessor relation); `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions` (Heegner Kummer classes). libraries: `mathlib:LinearMap`.

**Open items.** gaps [G21](#gap-21).

**Proposed location.** `TauCeti/NumberTheory/HeegnerCycles/WeightTwo`, namespace `TauCeti.GeneralizedHeegnerCycles.WeightTwo`; suggested-file name `TauCeti.GeneralizedHeegnerCycles.WeightTwoChecks.initial_corestriction_comparison`.

**Suggested file.** algebraic signature: Expressible algebraic component in the suggested file; instantiation on the actual arithmetic maps and types remains in the statement and supplier contracts.

**Independent review (verified).** Expanded the raw first trace using α^2-a α+p=0 and u d=p-1; the unit index, first degree, Frobenius and source-normalization comparisons remain explicit.

**Sources.**

- [ch-published-2018-gh8](#src-castella-hsieh-published), Section 5.2, Definition 5.2 and Lemma 5.3, printed pp. 601--602: “5.2” — New explicit algebraic comparison of the two branches; the paper is not claimed to supply the missing initial raw trace proof.
- [castella-family-author-gh8](#src-castella-variation), Equation (6.7), author-copy p. 28: “(6.7)” — The half-unit normalization is a comparison target, not a substitute for identifying the raw geometric classes.

<a id="n-gh-8-initial-only-rescaling-obstruction"></a>
### Rescaling only the bottom breaks a nonzero norm relation

`GH.8/initial-only-rescaling-obstruction` · application · part GH.8 · review: verified

For a linear map cor:M_1→M_0 of vector spaces over a field F, suppose cor(y_1)=y_0 and y_0 is nonzero. For every scalar t different from one, cor(y_1) is not t y_0. Thus changing only the initial factor cannot be justified as a uniform change of normalization. Multiplying every level by t does preserve all norm relations.

**Hypotheses and conventions.**

- The nonzero bottom hypothesis is essential; this test cannot prove nonvanishing of an arithmetic Heegner class.

**Proof outline.**

1. An equality cor(y_1)=t y_0 would imply (1-t)y_0=0. Cancel 1-t in the field.
2. For a uniform rescaling, linearity gives cor(t y_1)=t cor(y_1); the same calculation works at every step.

**Acceptance.**

- In the rational model of initial-corestriction-comparison, the bottom 1/4 differs from 1/8.
- For bottom zero, every initial scalar has the same value; do not report a contradiction without nonvanishing.
- Scaling the whole system by 1/2 is allowed over Q and is distinct from scaling only y_0.

**Depends on.** this roadmap: [`GH.8/initial-corestriction-comparison`](#n-gh-8-initial-corestriction-comparison). libraries: `mathlib:LinearMap`.

**Proposed location.** `TauCeti/NumberTheory/HeegnerCycles/WeightTwo`, namespace `TauCeti.GeneralizedHeegnerCycles.WeightTwo`; suggested-file name `TauCeti.GeneralizedHeegnerCycles.WeightTwoChecks.initial_only_rescaling_obstruction`.

**Suggested file.** algebraic signature: Expressible algebraic component in the suggested file; instantiation on the actual arithmetic maps and types remains in the statement and supplier contracts.

**Independent review (verified).** For a nonzero bottom and t!=1, changing only the bottom violates linear corestriction; uniform rescaling preserves it.

**Sources.**

- [ch-published-2018-gh8](#src-castella-hsieh-published), Definition 5.2 and Lemma 5.3, printed p. 601: “5.2” — New negative test for a proposed normalization change. It does not assert a second independently established source error.

<a id="n-gh-8-uniform-coherent-kernel-bound"></a>
### A common reverse comparison bounds the tower kernel

`GH.8/uniform-coherent-kernel-bound` · lemma · part GH.8 · review: verified

Let R be a commutative ring, M_n,N_n R-modules, f_n:M_n→N_n and g_n:N_n→M_n linear, and d one fixed scalar. If g_n f_n=d id for every n, then every sequence x_n with f_n(x_n)=0 satisfies d x_n=0 for every n. In particular, this holds for every compatible sequence and bounds the kernel of the induced comparison of integral towers.

**Hypotheses and conventions.**

- For the cycle/point application, M_n is the chosen coefficient summand on which the modular quotient is a rational isomorphism, not the entire Jacobian cohomology.
- A reverse comparison on that summand and a single d for all levels are actual supplier obligations; level-dependent rational inverses do not suffice.

**Proof outline.**

1. Apply g_n to f_n(x_n)=0. Its left side is d x_n and its right side is zero.
2. Interpret this componentwise conclusion in the existing compatible-sequence realization. No interchange of inverse limits and cohomology is used.

**Acceptance.**

- The statement permits torsion: d x=0 need not imply x=0 unless multiplication by d is injective.
- When d is a unit the bound gives injectivity.
- A bound d_n depending on n is not the asserted uniform conclusion.

**Used by.**

- [`GH.8/uniform-coherent-lift`](#n-gh-8-uniform-coherent-lift)

**Depends on.** this roadmap: [GH.1](#layer-gh-1) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)); [GH.3](#layer-gh-3) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)). other roadmaps: `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions` (Heegner Kummer classes). libraries: `mathlib:LinearMap`.

**Open items.** requests [GH.0](#req-19), [GH.1](#req-20), [GH.3](#req-21); gaps [G19](#gap-19).

**Proposed location.** `TauCeti/NumberTheory/HeegnerCycles/WeightTwo`, namespace `TauCeti.GeneralizedHeegnerCycles.WeightTwo`; suggested-file name `TauCeti.GeneralizedHeegnerCycles.WeightTwoChecks.uniform_coherent_kernel_bound`.

**Suggested file.** algebraic signature: Expressible algebraic component in the suggested file; instantiation on the actual arithmetic maps and types remains in the statement and supplier contracts.

**Independent review (verified).** The common reverse composite kills every kernel coordinate by the same d, including compatible sequences; the selected factor is required.

**Sources.**

- [ch-author-2022-gh8](#src-castella-hsieh), Section 5.2, equation (5.1) and the preceding integral inverse-limit construction: “(5.1)” — Elementary comparison check required for transporting the integral cycle tower; neither a new Iwasawa carrier nor a claimed source theorem.

<a id="n-gh-8-uniform-coherent-lift"></a>
### A common reverse comparison lifts a fixed multiple

`GH.8/uniform-coherent-lift` · lemma · part GH.8 · review: verified

Let M_n,N_n be R-module inverse systems with transitions μ_n and ν_n. Suppose linear f_n:M_n→N_n and g_n:N_n→M_n satisfy f_n g_n=d id for one scalar d independent of n, and μ_n g_{n+1}=g_n ν_n. Every compatible sequence y_n in N has the compatible sequence x_n=g_n(y_n) in M, with f_n(x_n)=d y_n at every level. Thus, when f is also transition-compatible, the cokernel of its tower map is annihilated by d.

**Hypotheses and conventions.**

- The conclusion uses a compatible family of reverse maps; pointwise existence of preimages of d y_n is weaker and is not substituted.
- R is a commutative ring. Neither d invertible nor module freeness is needed for the multiple-lifting statement.
- The arithmetic application must construct the same fixed coefficient comparison at each field level, restricted to the correct f-summand.

**Proof outline.**

1. Set x_n=g_n(y_n) without making independent lifting choices.
2. Naturality of g and compatibility of y give μ_n(x_{n+1})=g_n(ν_n(y_{n+1}))=x_n.
3. The other composite identity gives f_n(x_n)=d y_n.
4. Together with the kernel bound, localization at powers of a nonzero d gives the rationalized comparison when the coefficient ring is a domain. An integral isomorphism needs stronger input, for example d a unit.

**Acceptance.**

- For constant Z towers with f=2, g=id and d=2, twice every target element lifts but 1 does not.
- No right-exactness of inverse limits is invoked.
- For d a unit the explicit inverse is d^{-1}g; for nonunit d only the bounded kernel/cokernel conclusion is asserted.

**Used by.**

- [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity)

**Depends on.** this roadmap: [`GH.8/uniform-coherent-kernel-bound`](#n-gh-8-uniform-coherent-kernel-bound); [GH.1](#layer-gh-1) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)); [GH.3](#layer-gh-3) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)). other roadmaps: `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions` (Heegner Kummer classes). libraries: `mathlib:LinearMap`.

**Open items.** requests [GH.1](#req-20), [GH.3](#req-21); gaps [G19](#gap-19).

**Proposed location.** `TauCeti/NumberTheory/HeegnerCycles/WeightTwo`, namespace `TauCeti.GeneralizedHeegnerCycles.WeightTwo`; suggested-file name `TauCeti.GeneralizedHeegnerCycles.WeightTwoChecks.uniform_coherent_lift`.

**Suggested file.** algebraic signature: Expressible algebraic component in the suggested file; instantiation on the actual arithmetic maps and types remains in the statement and supplier contracts.

**Independent review (verified).** Transition-compatible reverse maps give an explicit coherent lift of d y; no exactness of inverse limits or integral isomorphism from a nonunit is asserted.

**Sources.**

- [ch-author-2022-gh8](#src-castella-hsieh), Section 5.2, equation (5.1) and its integral inverse-limit carrier: “(5.1)” — New explicit comparison proof for fixed denominator data; the actual geometric data remain requested.

<a id="n-gh-8-unbounded-denominators-counterexample"></a>
### Rational level isomorphisms need not compare integral limits

`GH.8/unbounded-denominators-counterexample` · application · part GH.8 · review: verified

Take M_n=Z with transition multiplication by 2, N_n=Z with identity transitions, and f_n multiplication by 2^n. The f_n are compatible and become isomorphisms over Q at every level. Nevertheless the integral compatible sequences in M are only zero, whereas those in N are all constant integer sequences. Consequently (lim M_n) tensor Q → (lim N_n) tensor Q is 0 → Q and is not an isomorphism. This does not deny that the limit of the rationalized M_n has compatible sequences with increasing denominators.

**Proof outline.**

1. Compatibility is 2^n(2x)=2^{n+1}x; the inverse over Q is multiplication by 2^{-n}.
2. For a compatible integral sequence x and fixed n, iteration gives x_n=2^k x_{n+k} for every k. If x_n is nonzero, the pinned integer divisibility bound forces 2^k≤|x_n|.
3. By induction 2^k≥k+1; choose k>|x_n| to contradict that bound. Thus every x_n is zero.
4. The constant sequence 1 survives in the target and has no integral compatible preimage. After tensoring the integral limits with Q the source stays zero.
5. In the rationalized source levels the sequence x_n=2^{-n} is compatible and maps to the constant sequence 1. Its denominators are unbounded, identifying precisely the illegitimate interchange.

**Acceptance.**

- Check the naturality identity at n=0 as well as positive n.
- Finite truncations admit nonzero integral solutions, so testing finitely many levels is not a proof about the infinite limit.
- The rational sequence 2^{-n} must be admitted in lim(M_n tensor Q) and excluded from every single bounded-denominator multiple of lim M_n.
- This is a regression example for a method, not a counterexample to the arithmetic theorems of CH.

**Depends on.** libraries: `mathlib:LinearMap`, `mathlib:Int.natAbs_le_of_dvd_ne_zero`.

**Proposed location.** `TauCeti/NumberTheory/HeegnerCycles/WeightTwo`, namespace `TauCeti.GeneralizedHeegnerCycles.WeightTwo`; suggested-file name `TauCeti.GeneralizedHeegnerCycles.WeightTwoChecks.doubling_tower_zero`.

**Suggested file.** algebraic signature: Expressible algebraic component in the suggested file; instantiation on the actual arithmetic maps and types remains in the statement and supplier contracts.

**Independent review (verified).** Doubling source transitions force all integral coordinates to vanish; identity target transitions give constant sequences. The maps 2^n commute and distinguish scalar extension before and after limits.

**Sources.**

- [ch-author-2022-gh8](#src-castella-hsieh), Section 5.2, equation (5.1), order of integral inverse limit and coefficient extension: “(5.1)” — New explicit counterexample to replacing that order by levelwise rationalization without uniform control; not an example attributed to the source.

<a id="n-gh-8-primitive-character-stabilization"></a>
### Exact-conductor character comparison of stabilized classes

`GH.8/primitive-character-stabilization` · comparison · part GH.8 · review: verified

Let G be a finite abelian group, H a subgroup, R a commutative integral domain, M and N R-modules, χ:G→R^x a character with χ restricted to H nontrivial, and q:M→N R-linear. For functions a,b:G→M with b(g h)=b(g) for all h in H, every β,c in R satisfy q(c sum_g χ(g)(a(g)-β b(g)))=c sum_g χ(g)q(a(g)). No division by |H| or |G| and no torsion-freeness of M or N is required. For the weight-two application take G=Gal(K_n/K_0), H=Gal(K_n/K_{n-1}), n≥1, b(g)=g res(z_{n-1}), β=α^{-1}, c=α^{-n}, with α a unit. This proves the finite weighted cycle/point comparison; identifying it with the actual twisted cohomological specialization is a further GH.3 map.

**Hypotheses and conventions.**

- R contains the character values; α and its inverse lie in R for the integral arithmetic application. Over the coefficient field the same formula holds for any nonzero α.
- The exact conductor condition must be translated to χ|H nontrivial for the actual ring-class quotient. A character nontrivial on G but inflated from G/H is excluded.
- HE.3 supplies the quotient Galois action and H-invariance of the restriction image. The existing modular-quotient-kummer comparison supplies q, with equivariance when a(g)=g z_n.
- This is a comparison on actual modules and finite sums, not a new character carrier, an averaging projector, an inverse-limit interchange or an assumed cohomological descent theorem.

**Proof outline.**

1. View χ|H as the existing MulChar on the finite commutative group H (the nonunit condition is vacuous), and check it is not the trivial character. Apply the pinned MulChar.sum_eq_zero_of_ne_one to obtain the scalar equality sum_h χ(h)=0 in R.
2. Partition G into left cosets tH and choose representatives only for this finite proof. By b(t h)=b(t) and multiplicativity, the sum over tH of χ(t h)b(t h) equals χ(t)(sum_h χ(h))b(t), hence zero. Reindexing is the existing finite-sum API; the result is independent of the temporary representatives.
3. Sum over the cosets, expand the stabilized expression, and commute q with scalar multiplication and the finite sum. Cancellation happened in the coefficient ring before acting on M, so possible torsion of M is harmless.
4. For n≥1, use positive-conductor-stabilization and the quotient comparison at each conjugate to identify q(a(g)). Retain α^{-n}; do not replace the unit-root coefficient α^{-1} by p/α.
5. GH.3 must construct the finite-character evaluation of the integral Iwasawa class, the coefficient twist and its descent. CH Lemma 5.4 invokes Rubin Lemma 2.4.3 for this map. The finite-sum calculation is not a substitute for it and does not settle the conductor-zero branch.

**Acceptance.**

- For G=C2, H=G, χ(g)=(-1)^g and b constant, the lower sum is zero over Z, including after acting on a torsion Z-module.
- For G=C4 and H={0,2}, χ(g)=(-1)^g is nontrivial on G but trivial on H. With b(g)=(-1)^g, b is H-invariant and the weighted lower sum is 4. The weakened condition must be rejected.
- For G=C9, H={0,3,6}, R=F19 and χ(g)=4^g, the restriction is nontrivial and every H-invariant b has zero weighted sum. Exact finite-field computation tests the last-kernel condition independently of characteristic zero.
- The domain hypothesis is genuine: for R=Z/8, G=C2, H=G, χ(1)=3 and constant b=1, the character is nontrivial with 3^2=1 but its weighted sum is 4, not zero. This input must be rejected.
- For the trivial character, lower-conductor terms need not vanish. Ramified finite-character checks therefore do not by themselves verify the printed initial Euler factor.
- At n=1 the lower term is the raw conductor-c₀ class. No equality with an unverified stabilized bottom is used; the same α^{-n} scalar occurs on both sides.

**Used by.**

- [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity)

**Depends on.** this roadmap: [`GH.8/modular-quotient-kummer`](#n-gh-8-modular-quotient-kummer); [`GH.8/character-sum-comparison`](#n-gh-8-character-sum-comparison); [`GH.8/positive-conductor-stabilization`](#n-gh-8-positive-conductor-stabilization); [GH.3](#layer-gh-3) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)). other roadmaps: `HeegnerPointEulerSystems:HE.0/conductor-change-kernel` (Conductor-change kernel); `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients` (Ring-class tower and finite Galois quotients); `HeegnerPointEulerSystems:HE.3/kummer-classes-and-the-modified-selmer-conditions` (Heegner Kummer classes). libraries: `mathlib:LinearMap`, `mathlib:Equiv.prod_comp`, `mathlib:MulChar.sum_eq_zero_of_ne_one`.

**Open items.** requests [GH.3](#req-21); gaps [G20](#gap-20).

**Proposed location.** `TauCeti/NumberTheory/HeegnerCycles/WeightTwo`, namespace `TauCeti.GeneralizedHeegnerCycles.WeightTwo`; suggested-file name `TauCeti.GeneralizedHeegnerCycles.WeightTwoChecks.primitive_character_stabilization`.

**Suggested file.** algebraic signature: Expressible algebraic component in the suggested file; instantiation on the actual arithmetic maps and types remains in the statement and supplier contracts.

**Independent review (verified).** Coset decomposition and the domain-valued character sum kill the lower term even in torsion modules. C4, ZMod 8 and C9/F19 diagnostics check the necessary hypotheses.

**Sources.**

- [ch-published-2018-gh8](#src-castella-hsieh-published), Lemma 5.4 and its proof, printed p. 602; exact conductor cp^n and equation (5.1): “Lemma 5.4” — The source uses exact conductor before dropping the lower term; the comparison spells out the last-kernel condition and supplies an integral coset proof. The separate specialization is not claimed constructed.
- [ch-author-2022-gh8](#src-castella-hsieh), Section 5.2, Lemma 5.4, printed p. 23, including the citation of Rubin Lemma 2.4.3: “nontrivial finite order character” — Separates the finite weighted-sum calculation from the cohomological evaluation/descent used by the source.
- [mathlib-finite-characters-082e2d3-gh8](#src-mathlib-finite-characters-082e2d3-gh8), Basic.lean, section sum, theorem sum_eq_zero_of_ne_one; finite commutative-monoid and integral-domain context: “sum_eq_zero_of_ne_one” — Already-built scalar orthogonality supports the coset proof without cancellation in the possibly torsion coefficient module.

<a id="n-gh-8-weight-two-reciprocity"></a>
### Weight-two reciprocity through the modular quotient

`GH.8/weight-two-reciprocity` · theorem · planet “Weight-two explicit reciprocity” · part GH.8 · review: corrected

Let f be the weight-two ordinary prime-to-p newform attached to E, with the CH standing hypotheses, p split in K and (c₀,Np)=1. Let ψ have ∞ type (1,-1) and conductor c₀. Use the GH.3 class z_f, its CH 2022 ψ^{-1}-twist and finite-ring-class corestriction, and the GH.1 quotient coefficient map γ_π into V_p E. Let S_F be the completed unramified coefficient Iwasawa algebra on the same ring-class quotient used in CH Theorem 5.7. On the corresponding ordinary crystalline line let d_γ be the induced coefficient map, and let ℓ_f be the CH functional written ω_f tensor t^{-2}. Transport the elliptic differential and CM generator to a functional ℓ_E satisfying ℓ_E composed with d_γ = c_π ℓ_f, where π*ω_E=c_π ω_f; this equality is an arithmetic comparison target. Then, for the transported vector regulator R_E and point Iwasawa class y_E=H^1_Iw(γ_π)(z_f), ℓ_E(R_E(y_E tensor ψ^{-1})) = -c_π L_{p,ψ}(f) σ_{-1,p} in S_F. The point class is identified with the HE.8 Kummer system using the actual first-corestriction square. After any defined coefficient/group-quotient homomorphism ρ, the image is -ρ(c_π) ρ(L_{p,ψ}(f)) ρ(σ_{-1,p}). No invertibility of c_π in the integral ring is asserted.

**Hypotheses and conventions.**

- The common range is odd discriminant -D_K<-3, all primes of N split in K, p not dividing 2N φ(N), ordinary good reduction at p, and the actual level/cusp descent from GH.0–GH.1.
- Use rational coefficients until the uniform integral comparison is supplied. The two-sided lattice maps are on the selected multiplicity-one f-factor; periods in the completed unramified extension are not automatically integral units.
- For the ψ-twisted differential, equation (5.3) introduces Ω_ψ. Its generator and nonzero inverse must be transported explicitly when extracting ℓ_f. Changing ω_E or ω_ψ changes both the functional and the formula.
- The chosen coefficient map and distribution pushforward respect restriction, corestriction, twisting and crystalline duality. GH.7 supplies this anticyclotomic regulator diagram.
- Finite-conductor local fields can be ramified over the unramified BDP base. GH.1 and PadicHodgeRegulators L1 must provide the de Rham/Bloch–Kato finite-base-change squares before differential-evaluation is used there; completed unramified coefficients do not remove this obligation.
- When invoking the existing HE.8 point-system nodes, retain their E(K)[p]=0 hypothesis and their actual ring-class-to-anticyclotomic trace/index maps. For auxiliary c₀ retain the finite ring-class component until its explicit corestriction; this is not an automatic identification with the c₀=1 system.

**Proof outline.**

1. Apply the imported GH.4 CH 2022 reciprocity node at r=1: the conductor factor is c₀^0=1 and the scalar is negative, with the group-like σ_{-1,p} retained.
2. Identify the positive finite-level cycle and point classes with modular-quotient-kummer, positive-conductor-stabilization and primitive-character-stabilization. Use GH.3 finite-character descent and the genuine first-corestriction comparison to identify their Iwasawa classes.
3. First apply the GH.1/PadicHodgeRegulators L1 finite-base-change restriction and corestriction/trace squares at each actual local conductor field. Then use differential-evaluation and GH.1 de Rham duality to compute the pullback of the elliptic functional. Insert the GH.4 CM-period and Tate-period maps; verify ℓ_E d_γ=c_π ℓ_f on the actual line. Do not apply the inspected unramified BDP theorem directly to a ramified completion.
4. Use GH.7 regulator naturality to move γ_π through the vector regulator, then evaluate the functional and apply the imported reciprocity identity. Apply ρ as a ring homomorphism; do not infer an integral characteristic-ideal identity from a rational scalar equation.

**Acceptance.**

- At r=1 the factorial and c₀ power become 1; the minus sign and σ_{-1,p} remain.
- Replacing ω_E by b ω_E multiplies the elliptic functional and c_π by b. The scalar reciprocity identity changes by the same factor, and a squared logarithm formula changes by b squared.
- At a character θ the group-like term evaluates to θ(σ_{-1,p}). It can be 1 or -1 on the full ring-class quotient; projecting to a pro-p Z_p quotient may kill it and must be stated.
- A map ρ killing c_π produces a zero image identity. This gives no nonvanishing conclusion and no licence to cancel ρ(c_π).
- Check E(K)[p]=0 before the present HE.8 identification, or request and prove a supplier extension. The scalar transport by itself imposes no such torsion vanishing.

**Used by.**

- [`GH.8/automorphic-reciprocity-export`](#n-gh-8-automorphic-reciprocity-export)

**Depends on.** this roadmap: [`GH.8/modular-quotient-kummer`](#n-gh-8-modular-quotient-kummer); [`GH.8/differential-evaluation`](#n-gh-8-differential-evaluation); [`GH.8/positive-tail-corestriction`](#n-gh-8-positive-tail-corestriction); [`GH.8/initial-corestriction-comparison`](#n-gh-8-initial-corestriction-comparison); [`GH.8/primitive-character-stabilization`](#n-gh-8-primitive-character-stabilization); [`GH.8/uniform-coherent-lift`](#n-gh-8-uniform-coherent-lift); [`GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`](#n-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity); [GH.3](#layer-gh-3) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)); [GH.4](#layer-gh-4) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)); [GH.7](#layer-gh-7) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)); [GH.1](#layer-gh-1) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)). other roadmaps: `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class` (Anticyclotomic Heegner class); `PadicHodgeRegulators:L1` (Bloch–Kato maps). libraries: `mathlib:LinearMap`, `mathlib:LinearMap.dualMap_apply`.

**Open items.** requests [GH.1](#req-20), [GH.3](#req-21), [L1](#req-22), [GH.4](#req-23), [GH.7](#req-24); gaps [G19](#gap-19), [G20](#gap-20), [G21](#gap-21), [G22](#gap-22), [G24](#gap-24).

**Proposed location.** `TauCeti/NumberTheory/HeegnerCycles/WeightTwo`, namespace `TauCeti.GeneralizedHeegnerCycles.WeightTwo`.

**Suggested file.** arithmetic signature omitted: Actual arithmetic supplier carriers and maps are unavailable at the pins. The suggested file lists this target and any expressible algebraic component explicitly; it does not invent a curve, cohomology, regulator or coefficient ring.

**Independent review (corrected).** Confirmed revised CH Theorem 5.7 negative sign, t^{-2}, ψ^{-1}, c₀^0 and σ factor. Added local base-change prerequisites and HE.8 range checks; period/lattice maps remain requested.

**Sources.**

- [ch-author-2022-gh8](#src-castella-hsieh), Section 5.3, equations (5.3)--(5.5), Definition 5.6 and Theorem 5.7, pp. 24--25: “Theorem 5.7.” — The exact completed-unramified formula is imported from GH.4; this node adds quotient, differential and consumer coefficient transport at r=1.
- [bdp-published-2013-gh8](#src-bertolini-darmon-prasanna-generalized-heegner), Sections 3.1--3.4, pp. 1065--1070: “Definition 3.1” — Functorial realization and its de Rham dual determine the sign and differential map; elliptic logarithm naturality is a supplier obligation.
- [ch-author-2022-gh8](#src-castella-hsieh), Section 4.5, de Rham base-change discussion, p. 19: “for any finite extension E/L” — States the de Rham scalar-extension identification. The additional Abel–Jacobi, Bloch–Kato logarithm and trace squares are explicit supplier requests, not conclusions inferred from this vector-space identity.

<a id="n-gh-8-automorphic-reciprocity-export"></a>
### Source-qualified ordinary inputs for automorphic congruences

`GH.8/automorphic-reciprocity-export` · comparison · part GH.8 · review: verified

Export to AutomorphicCongruences L2 the GH.4 CH 2022 scalar regulator identity and GH.7 Castella Theorem 5.3 with their actual coefficients and classes. For a Hida branch I and the character ξ in the Castella author copy, set λ=Ψ(Frob_p)-1 and S_I=I[λ^{-1}] completed tensor W. The family identity is R_Cas(loc_p(Z_{c₀,∞} tensor ξ^{-1}))=L_{p,ξ}(family) σ_{-1,p} in S_I[[Γ̃]], where R_Cas includes the printed finite-ring-class corestriction and group restriction. At a permitted specialization ν with ν(λ) nonzero, the coefficient homomorphism sends the analytic distribution to the CH-convention L_{p,ξ_ν}(f_ν) by Castella Theorem 2.11. The class moment is c₀^{1-r_ν} z_{f_ν,c₀,α} in the exact range of Theorem 6.5; the weight-two p-old extension uses ordinary-p-old-family and weight-two-reciprocity. For a continuous coefficient/group homomorphism ρ defined on S_I[[Γ̃]], the exact family identity transfers to ρ(R_Cas(...))=ρ(L_{p,ξ}(family)) ρ(σ_{-1,p}). The CH identity transfers separately with its -c₀^{r-1} factor and t^{-2r} functional. Identify these source presentations only after the GH.4/GH.7 period, twist, pairing and coefficient diagram is proved.

**Hypotheses and conventions.**

- The family has p not dividing 6N, odd discriminant -D_K<-3, the classical Heegner hypothesis, split p, ordinary and p-distinguished residual representation irreducible on G_K, and residual ramification at primes of (D_K,N) for the comparison. The common CH weight-two comparison imposes the stronger all-tame-primes-split hypothesis.
- Theorem 6.5 requires a reference weight k congruent to 2 modulo p-1, weight 2r_ν>2 congruent to k modulo 2(p-1) and trivial character. At weight two use Remark 6.6 only when the specialization is p-old of prime-to-p level.
- A specialization of I need not extend to S_I. If ν(λ)=0, GH.7 must construct an integral/regular model and its moment; no evaluation of a pole is allowed.
- The output is the native source identity and its defined transport. L2 constructs the automorphic congruence divisibility and compares its analytic function on the same lattice and character domain. Its Beilinson–Flach classes and its L2s semi-ordinary branch are separate inputs.

**Proof outline.**

1. Reuse GH.7 Theorems 2.11 and 5.3, including the ξ^{-1} critical twist, ω_family trivialization, λ localization and completion. Track the local-to-global corestriction and restriction through the finite ring-class component.
2. Use GH.7 moments and ordinary-p-old-family to compare the class at admissible weights; use weight-two-reciprocity to compare the elliptic differential functional. Carry the CH and Castella pairings separately until the version diagram commutes.
3. Apply a defined continuous ring homomorphism ρ to each exact equality. Verify its action on coefficients and group generators, and its commutation with the class/regulator specialization, rather than naming two distributions equal.
4. Hand these identities, their coefficient maps and their exact hypothesis ranges to L2. Period units, excluded height-one primes and resulting congruence divisibilities are proved by that consumer; the GH.8 export supplies no universal nonordinary specialization.

**Acceptance.**

- If ν(λ)=0, a proposed map from S_I must be rejected unless a regular model has been proved. A denominator-cleared equality cannot be specialized by cancelling the zero denominator.
- Compare the positive Castella 5.3 sign with the negative CH 2022 sign and their t^{1-2r}/t^{-2r} conventions through actual maps; dropping the difference fails the export.
- Evaluate at a finite ring-class character before taking the anticyclotomic quotient, and check the image of σ_{-1,p}; the full finite part cannot be replaced silently by a torsion-free group.
- A supersingular weight-two point does not pass the ordinary-family hypotheses. No claim about FW Beilinson–Flach classes follows from this Heegner identity.

**Depends on.** this roadmap: [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family); [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity); [`GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`](#n-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity); [GH.4](#layer-gh-4) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)); [GH.7](#layer-gh-7) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)).

**Open items.** requests [GH.4](#req-23), [GH.7](#req-24); gaps [G22](#gap-22), [G24](#gap-24).

**Proposed location.** `TauCeti/NumberTheory/HeegnerCycles/WeightTwo`, namespace `TauCeti.GeneralizedHeegnerCycles.WeightTwo`.

**Suggested file.** arithmetic signature omitted: Actual arithmetic supplier carriers and maps are unavailable at the pins. The suggested file lists this target and any expressible algebraic component explicitly; it does not invent a curve, cohomology, regulator or coefficient ring.

**Independent review (verified).** Read the native Castella 5.3 identity and 2.11 analytic moments; λ localization and the distinct L2/L2s/L6 consumer ownership are explicit. Sign/t-power version maps remain gaps.

**Sources.**

- [castella-family-author-gh8](#src-castella-variation), Theorem 2.11 and proof, pp. 12--13; Proposition 5.2 and Theorem 5.3, pp. 22--23; Theorem 6.5 and Remark 6.6, pp. 28--29: “Theorem 5.3.” — Native family scalar identity, analytic specialization and its range; GH.8 translates the imported data for the congruence consumer.
- [ch-author-2022-gh8](#src-castella-hsieh), Theorem 5.7, p. 25: “Theorem 5.7.” — The distinct revised CH identity retains its negative scalar, group-like term and pairing.

<a id="n-gh-8-corrected-bsd-input-export"></a>
### Higher-weight input comparison for the corrected multiplicative BSD proof

`GH.8/corrected-bsd-input-export` · comparison · part GH.8 · review: corrected

For each auxiliary ordinary prime-to-p-level newform g_m of even weight k_m>2 in the corrected Castella multiplicative proof, export the GH.2–GH.7 Heegner system with its actual lattice T_{g_m}, Selmer local conditions, character convention and completed unramified coefficients. In the source convention used by the proof, its initial Kolyvagin class agrees with the stabilized Iwasawa class κ_{g_m,∞} through the higher-weight GH.5 comparison on the actual GH.3 class; GH.5 supplies that unit and its inverse, not just a rational nonzero multiple. Export the CH 5.7 scalar regulator formula -c₀^{r_m-1} L_{p,ψ}(g_m) σ_{-1,p}, and GH.7 Castella 2.11/5.3 analytic moments, along their proved normalization maps. Under any specified coefficient reduction R_{g_m} to R_{g_m}/p^m, these exact identities commute with reduction. The source Selmer containment and non-torsion conclusion must be proved under the precise tame-level hypotheses used for g_m. BSD.6a supplies the congruences T_{g_m}/p^m congruent to T_pE/p^m, the analytic-function congruence, control, both divisibilities and the limit argument; GH.8 supplies their source-qualified higher-weight inputs, without claiming a p-old cycle/point comparison for the p-new multiplicative weight-two form.

**Hypotheses and conventions.**

- The corrected source has p>3, split p, an ideal M in O_K with O_K/M congruent to Z/MZ, residual irreducibility on G_K for g_m, a nonsplit q exactly dividing M, the stated nonsplit-special local automorphic type, and 2 exactly dividing M if 2 is nonsplit. The lattice congruence and rigidity arguments deriving these conditions belong to BSD.6a.
- CH standing Hypothesis (H) instead assumes all tame primes split, and its factorial restriction is weight-dependent. Longo–Vigni admissibility and its exceptional set must also be verified. The export in the corrected source range therefore requires an explicit extension/adapter from GH.0–GH.7; the all-split theorem cannot be applied by dropping these conditions.
- GH.2 must supply the CH erratum and the Kobayashi–Ota replacement for the derived local condition, not the original absolutely-unramified-only Lemma 7.5 at ramified conductor.
- For E itself retain the corrected Theorem 1.1 conditions including E(Q_p)[p]=0 and the nonsplit residually ramified multiplicative prime. The transfer to E is congruence/control in BSD.6a, not Theorem 6.5 or Remark 6.6 at a p-new point.
- Use the native higher-weight GH.3/GH.5 classes and GH.7 analytic moments directly. The all-split p-old weight-two comparison and the elliptic HE.8 class are not suppliers of the higher-weight leading-class unit. The generic fixed-denominator bounds do not replace that integral unit.

**Proof outline.**

1. Read the corrected proof of Theorem 2.3 as an import list: CH (4.7) and Section 5.2 from GH.2/GH.3, CH Theorem 5.7 from GH.4, LV Theorem 4.7 and the integral leading-class unit from GH.5, and CH Theorem 6.1 non-torsion from GH.6. GH.7 supplies the native Castella Theorems 2.11/5.3 analytic inputs. Do not replan those systems.
2. Prove the source-range adapter for nonsplit tame primes and weight-dependent admissibility in GH.0–GH.7. Until it is supplied, record the export as a target with this gap; the corrected consumer conclusion is not a proof of the adapter.
3. Compare the selected integral coefficient lattice, Iwasawa group action (including any inversion from discrete-dual conventions) and local conditions by actual maps. GH.5 supplies the higher-weight leading-class unit, and GH.7 the analytic moment identity in a defined coefficient model.
4. Apply coefficient reduction to the exact scalar reciprocity identities. Hand the resulting equalities and verified hypothesis packages to BSD.6a; that consumer compares with its Σ-imprimitive analytic function and proves the congruence/control passage to the multiplicative elliptic curve.

**Acceptance.**

- An all-split auxiliary level fails the corrected Theorem 2.3 nonsplit-prime requirement; the CH all-split range and the corrected range need an explicit extension, not a common-range shortcut.
- A merely nonzero lattice multiplier, for example p, cannot replace the asserted p-adic unit relating the leading Kolyvagin class and κ_{g_m,∞}.
- Reduction modulo p^m respects the displayed scalar equation, but reduction of characteristic ideals is not inferred from it. The congruence and Fitting/control calculation remains in BSD.6a.
- A p-new multiplicative weight-two form fails Remark 6.6. Reject a direct application, while retaining its valid auxiliary higher-weight and family analytic inputs.
- The supersingular BSTW/CLW branch has its own zeta elements and signed reciprocity. This ordinary export supplies none of those conclusions.
- The dependency graph for this export does not require a weight-two point comparison at an auxiliary nonsplit tame level. Its native higher-weight supplier range is checked separately.

**Depends on.** this roadmap: [`GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`](#n-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity); [GH.0](#layer-gh-0) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)); [GH.2](#layer-gh-2) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)); [GH.3](#layer-gh-3) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)); [GH.4](#layer-gh-4) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)); [GH.5](#layer-gh-5) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)); [GH.6](#layer-gh-6) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)); [GH.7](#layer-gh-7) (layer citation; see [cross-part prerequisites](#cross-part-prerequisites)).

**Open items.** requests [GH.0](#req-19), [GH.3](#req-21), [GH.4](#req-23), [GH.7](#req-24), [GH.2](#req-25), [GH.6](#req-26), [GH.5](#req-27); gaps [G20](#gap-20), [G22](#gap-22), [G23](#gap-23), [G24](#gap-24).

**Proposed location.** `TauCeti/NumberTheory/HeegnerCycles/WeightTwo`, namespace `TauCeti.GeneralizedHeegnerCycles.WeightTwo`.

**Suggested file.** arithmetic signature omitted: Actual arithmetic supplier carriers and maps are unavailable at the pins. The suggested file lists this target and any expressible algebraic component explicitly; it does not invent a curve, cohomology, regulator or coefficient ring.

**Independent review (corrected).** Corrected GH.5 Kolyvagin/unit versus GH.6 non-torsion ownership; removed all-split/p-old/elliptic prerequisites and use native higher-weight suppliers. Retained nonsplit tame-level, factorial/LV range adapters and BSD.6a congruence/control ownership.

**Sources.**

- [bsd-multiplicative-erratum-gh8](#src-bsd-multiplicative-erratum-gh8), Theorem 2.3 and proof, pp. 3--4; proof of Theorem 1.1 and footnote 1, p. 4: “higher weight extension” — Names the exact higher-weight systems, source theorem calls and congruence route consumed by BSD.6a; its arithmetic main-conjecture conclusions remain consumer-owned.
- [ch-erratum-gh8](#src-castella-hsieh-erratum), Lemma 7.5/Proposition 7.8 correction, p. 1: “Perrin-Riou” — Supplies the corrected proof route for derived local conditions; its replacement theorem is GH.2 work.

<a id="cross-part-prerequisites"></a>
## Cross-part prerequisites

The GH.0 part never cites the GH.8 part. The GH.8 part cites the earlier layers in 28 places by layer id (`GeneralizedHeegnerCycles:GH.1` and so on), written before the nodes of GH.0–GH.7 existed, and three times names the node `GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity` directly. It also files eight requests with GH.0–GH.7 ([below](#internal-requests)).

The table gives, for each layer citation, the nodes of GH.0–GH.7 whose statement, API or acceptance checks contain what the citing node uses, read from the citing node's hypotheses and proof steps, and what no node supplies. Where something stays open, it is already a request or a gap of the GH.8 part; this table adds no new obligation and changes no statement. With these edges added, the node graph of the roadmap has no cycle, and every edge points to an earlier layer. Replacing the layer citations by these node ids in the GH.8 packet is a packet change left to a job that owns that packet.

Three findings of this reading:

- Several weight-two facts that GH.8 asks for exist in the GH.0 part only as acceptance checks: X_0 = C ([`GH.0/generalized-kuga-sato-variety-and-its-projector`](#n-gh-0-generalized-kuga-sato-variety-and-its-projector)), AJ_et(P − ∞) is the Kummer class of the point of the Jacobian ([`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map)) and AJ_F(P − ∞)(ω_f) is a Coleman integral ([`GH.1/p-adic-abel-jacobi-map`](#n-gh-1-p-adic-abel-jacobi-map)). The GH.8 requests for proved statements therefore stand, and the GH.0 part sends the degree-zero divisor and Jacobian Kummer case on to SchemeAndStackFoundations SF.5 ([request 15](#req-15)).
- No node of GH.5 states the integral comparison κ₁ = v·κ_∞ between the leading Kolyvagin class and the stabilized Iwasawa class that `GH.8/corrected-bsd-input-export` needs from GH.5; this is the GH.8 gap [G23](#gap-23).
- `GH.8/corrected-bsd-input-export` takes CH (4.7) "from GH.2/GH.3", but CH (4.7) is [`GH.1/character-projected-heegner-class`](#n-gh-1-character-projected-heegner-class), and GH.1 is not among its prerequisites.

| GH.8 node | Cites | Supplying nodes | What stays open |
|---|---|---|---|
| [`weight-zero-cycle`](#n-gh-8-weight-zero-cycle) | [GH.0](#layer-gh-0) | [`GH.0/generalized-kuga-sato-variety-and-its-projector`](#n-gh-0-generalized-kuga-sato-variety-and-its-projector): the empty fibre power: its acceptance check m = 0 gives X_0 = W_0 = C with ε_X = 1<br>[`GH.0/newform-cm-projector`](#n-gh-0-newform-cm-projector): the f-isotypic Hecke projector e_f, for every weight k ≥ 2 | X_0 = C is an acceptance check of the GH.0 node, not a stated result; the GH.8 request to GH.0 (empty fibre-power identification, correspondence action) stands. |
| [`weight-zero-cycle`](#n-gh-8-weight-zero-cycle) | [GH.1](#layer-gh-1) | [`GH.1/generalized-heegner-cycle`](#n-gh-1-generalized-heegner-cycle): the m = 0 cycle: Δ_φ is the CM point P_{A′} of C, replaced by P_{A′} − ∞<br>[`GH.1/homological-triviality-of-generalized-heegner-cycles`](#n-gh-1-homological-triviality-of-generalized-heegner-cycles): homological triviality of P_{A′} − ∞ for m = 0 | Nothing beyond the level-structure field of definition, which the GH.8 node keeps as a hypothesis. |
| [`modular-quotient-kummer`](#n-gh-8-modular-quotient-kummer) | [GH.1](#layer-gh-1) | [`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map): AJ_et by the Gysin sequence and Ext¹ = H¹, with the cocycle convention g ↦ g·lift(1) − lift(1) (API `ajEt_extension`); its acceptance check for m = 0 says that AJ_et(P − ∞) is the Kummer class of the point of the Jacobian | The weight-two Kummer comparison is only an acceptance check of the GH.1 node, and the finite Picard–Kummer/Gysin sign comparison is not stated. The GH.0 part routes the degree-zero divisor/Jacobian Kummer case to SchemeAndStackFoundations SF.5 (its SF.5 request), so the GH.8 request to GH.1 is answered only by that SF.5 request. |
| [`character-sum-comparison`](#n-gh-8-character-sum-comparison) | [GH.1](#layer-gh-1) | [`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map): restriction and correspondence equivariance of AJ_et (APIs `ajEt_restriction`, `ajEt_correspondence`) | Coefficient-map naturality for the quotient γ_π is not stated by a GH.1 node; the GH.8 request to GH.1 stands. |
| [`character-sum-comparison`](#n-gh-8-character-sum-comparison) | [GH.3](#layer-gh-3) | [`GH.3/iwasawa-heegner-class`](#n-gh-3-iwasawa-heegner-class): the finite ring-class quotient Δ kept separate from Γ, and the Shapiro inversion convention | The twisted descent to H¹(L, V ⊗ χ) is not planned in GH.3; the GH.8 request to GH.3 stands. |
| [`positive-tail-corestriction`](#n-gh-8-positive-tail-corestriction) | [GH.3](#layer-gh-3) | [`GH.3/ordinary-stabilized-class`](#n-gh-3-ordinary-stabilized-class): z_{c,α} = z_c − (p^{2r−2}/α) res(z_{c/p}), which at r = 1 is the α^{-1} subtraction of the GH.8 node<br>[`GH.3/iwasawa-heegner-class`](#n-gh-3-iwasawa-heegner-class): the Iwasawa realization of the α^{-n}-normalized sequence (APIs `iwasawaClass_level`, `iwasawaClass_norm`) | The initial term needs the first trace and degree; see initial-corestriction-comparison. |
| [`differential-evaluation`](#n-gh-8-differential-evaluation) | [GH.1](#layer-gh-1) | [`GH.1/p-adic-abel-jacobi-map`](#n-gh-1-p-adic-abel-jacobi-map): AJ_F over finite unramified F with good models, the de Rham quotient and Poincaré duality; its acceptance check m = 0 is AJ_F(P − ∞)(ω_f) = ∫_∞^P ω_f | The finite-base-change restriction and corestriction/trace squares at ramified conductor fields: GH.8 requests them from GH.1 and PadicHodgeRegulators L1; no GH.1 node states them. |
| [`ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family) | [GH.3](#layer-gh-3) | [`GH.3/ordinary-stabilized-class`](#n-gh-3-ordinary-stabilized-class): z_{f_ν,c₀,α}<br>[`GH.3/iwasawa-heegner-class`](#n-gh-3-iwasawa-heegner-class): the Iwasawa class compared at weight two | — |
| [`ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family) | [GH.4](#layer-gh-4) | [`GH.4/fixed-weight-regulator-adapter`](#n-gh-4-fixed-weight-regulator-adapter): CH Theorem 5.1, the quotient construction of the regulator<br>[`GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`](#n-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity): CH §5.3: the nonzero ordinary-line projection and the period relation (5.3) | — |
| [`ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family) | [GH.7](#layer-gh-7) | [`GH.7/critical-character-twist`](#n-gh-7-critical-character-twist): T† and the critical twist<br>[`GH.7/howard-family-tower`](#n-gh-7-howard-family-tower): Z_{c₀,∞}<br>[`GH.7/family-representation-specialization`](#n-gh-7-family-representation-specialization): arithmetic specialization of T†<br>[`GH.7/two-variable-regulator-checkpoint`](#n-gh-7-two-variable-regulator-checkpoint): the two-variable regulator (Castella Theorem 3.7)<br>[`GH.7/family-regulator-localization`](#n-gh-7-family-regulator-localization): its anticyclotomic descent (Castella Proposition 5.2)<br>[`GH.7/ordinary-localization-injective`](#n-gh-7-ordinary-localization-injective): Castella Lemma 6.4 at fixed weight<br>[`GH.7/higher-weight-family-specialization`](#n-gh-7-higher-weight-family-specialization): Castella Theorem 6.5 at weight 2r_ν > 2 | GH.7 states Lemma 6.4 and Theorem 6.5 only above weight two. The weight-two p-old extension, the LZ14 Proposition 4.11 transport and the quotient-kernel equality f⁻¹(Q) = P are in the GH.8 request to GH.7. |
| [`uniform-coherent-kernel-bound`](#n-gh-8-uniform-coherent-kernel-bound) | [GH.1](#layer-gh-1) | [`GH.1/integral-abel-jacobi-comparison`](#n-gh-1-integral-abel-jacobi-comparison): the integral classes and the chosen stable lattice | The two-sided maps on the selected f-factor with one fixed scalar are not planned; GH.8 requests them. |
| [`uniform-coherent-kernel-bound`](#n-gh-8-uniform-coherent-kernel-bound) | [GH.3](#layer-gh-3) | [`GH.3/iwasawa-heegner-class`](#n-gh-3-iwasawa-heegner-class): the integral Iwasawa carrier | Uniform lattice comparison data are requested from GH.3. |
| [`uniform-coherent-lift`](#n-gh-8-uniform-coherent-lift) | [GH.1](#layer-gh-1) | [`GH.1/integral-abel-jacobi-comparison`](#n-gh-1-integral-abel-jacobi-comparison): the integral classes and the chosen stable lattice | As for the kernel bound: transition-compatible reverse maps are requested. |
| [`uniform-coherent-lift`](#n-gh-8-uniform-coherent-lift) | [GH.3](#layer-gh-3) | [`GH.3/iwasawa-heegner-class`](#n-gh-3-iwasawa-heegner-class): the integral Iwasawa carrier | As for the kernel bound. |
| [`primitive-character-stabilization`](#n-gh-8-primitive-character-stabilization) | [GH.3](#layer-gh-3) | [`GH.3/iwasawa-heegner-class`](#n-gh-3-iwasawa-heegner-class): the statement that a nontrivial character of exact conductor p^n specializes the class to α^{-n} times the weighted finite-level class (API `iwasawaClass_character`) | Its proof steps do not construct the finite-character evaluation through CH Lemma 5.4 and Rubin Lemma 2.4.3 with the coefficient twist and descent; that part of the GH.8 request to GH.3 stands. |
| [`weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity) | [GH.1](#layer-gh-1) | [`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map): the étale classes and their restriction<br>[`GH.1/p-adic-abel-jacobi-map`](#n-gh-1-p-adic-abel-jacobi-map): the de Rham quotient and duality used to pull back the functional | The ramified finite-base-change squares, as for differential-evaluation. |
| [`weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity) | [GH.3](#layer-gh-3) | [`GH.3/iwasawa-heegner-class`](#n-gh-3-iwasawa-heegner-class): the class z_f<br>[`GH.3/stabilized-first-step-adapter`](#n-gh-3-stabilized-first-step-adapter): the first-corestriction square for CH Definition 5.2; at weight two the GH.8 node initial-corestriction-comparison supplies the algebra | The finite-character descent, as for primitive-character-stabilization. |
| [`weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity) | [GH.4](#layer-gh-4) | [`GH.4/fixed-weight-regulator-adapter`](#n-gh-4-fixed-weight-regulator-adapter): the CM-period and Tate-period identifications η_A = t_A^{-1}t, ω_A = t_A = Ω_p t and ω_f ⊗ t^{−2r} | The castella-hsieh node is also cited directly. The source-version comparison (t^{1−2r} against t^{−2r}, CM generator (5.3)) is in the GH.8 request to GH.4. |
| [`weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity) | [GH.7](#layer-gh-7) | [`GH.7/family-regulator-localization`](#n-gh-7-family-regulator-localization): the anticyclotomic regulator diagram | No GH.7 node states naturality of the regulator under the coefficient map γ_π. The fixed-weight regulator is CH Theorem 5.1, which GH.4/fixed-weight-regulator-adapter imports from the requested PadicHodgeRegulators L3 Part II; that owner is the natural home of this naturality. |
| [`automorphic-reciprocity-export`](#n-gh-8-automorphic-reciprocity-export) | [GH.4](#layer-gh-4) | [`GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`](#n-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity): CH Theorem 5.7 (also cited directly) | — |
| [`automorphic-reciprocity-export`](#n-gh-8-automorphic-reciprocity-export) | [GH.7](#layer-gh-7) | [`GH.7/critical-character-twist`](#n-gh-7-critical-character-twist): ξ and λ_reg = Ψ(Frob_p) − 1<br>[`GH.7/howard-family-tower`](#n-gh-7-howard-family-tower): Z_{c₀,∞}<br>[`GH.7/family-measure-specialization`](#n-gh-7-family-measure-specialization): Castella Theorem 2.11<br>[`GH.7/two-variable-explicit-reciprocity`](#n-gh-7-two-variable-explicit-reciprocity): Castella Theorem 5.3<br>[`GH.7/higher-weight-family-specialization`](#n-gh-7-higher-weight-family-specialization): the class moments of Theorem 6.5 | The period, twist and pairing diagram between the CH 2022 and Castella conventions is requested from GH.4/GH.7. |
| [`corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export) | [GH.0](#layer-gh-0) | [`GH.0/newform-cm-projector`](#n-gh-0-newform-cm-projector): the level, projector and lattice of g_m | GH.0 plans the all-split CH range; the nonsplit tame-prime range of Castella’s corrected Theorem 2.3 is a gap. |
| [`corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export) | [GH.2](#layer-gh-2) | [`GH.2/finite-local-abel-jacobi-class`](#n-gh-2-finite-local-abel-jacobi-class): the finite local condition with the CH erratum<br>[`GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`](#n-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections): the Kobayashi–Ota replacement for CH Proposition 7.8 | Only in the all-split range; the nonsplit extension is requested from GH.2. |
| [`corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export) | [GH.3](#layer-gh-3) | [`GH.3/ordinary-stabilized-class`](#n-gh-3-ordinary-stabilized-class): CH §5.2<br>[`GH.3/iwasawa-heegner-class`](#n-gh-3-iwasawa-heegner-class): the stabilized Iwasawa class κ_{g_m,∞} | CH (4.7), which the node’s first proof step attributes to GH.2/GH.3, is planned in GH.1 (GH.1/character-projected-heegner-class); GH.1 is not among the node’s prerequisites. |
| [`corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export) | [GH.4](#layer-gh-4) | [`GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`](#n-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity): CH Theorem 5.7 (also cited directly) | — |
| [`corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export) | [GH.5](#layer-gh-5) | [`GH.5/longo-vigni-admissible-triple`](#n-gh-5-longo-vigni-admissible-triple): LV admissibility and its exceptional set<br>[`GH.5/higher-weight-kolyvagin-class`](#n-gh-5-higher-weight-kolyvagin-class): LV Theorem 4.7, the corrected Kolyvagin system with κ′₁ = κ₁ | No GH.5 node states the integral leading-class comparison κ₁ = v·κ_∞ with an explicit unit v; GH.3/universal-norm-heegner-class says the LV construction is not identified with the CH α-stabilized sequence without a normalization comparison. This is the GH.8 gap [G23](#gap-23). |
| [`corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export) | [GH.6](#layer-gh-6) | [`GH.6/selmer-rank-one`](#n-gh-6-selmer-rank-one): CH Theorem 6.1, the rank-one consequence of a nonzero class<br>[`GH.6/anticyclotomic-nonvanishing`](#n-gh-6-anticyclotomic-nonvanishing): the nonvanishing behind non-torsion | In the nonsplit range the GH.8 request to GH.6 stands. |
| [`corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export) | [GH.7](#layer-gh-7) | [`GH.7/family-measure-specialization`](#n-gh-7-family-measure-specialization): Castella Theorem 2.11<br>[`GH.7/two-variable-explicit-reciprocity`](#n-gh-7-two-variable-explicit-reciprocity): Castella Theorem 5.3 | — |

<a id="requests-to-other-roadmaps"></a>
## Requests to other roadmaps

Every request the two parts file with other roadmaps, grouped by the layer asked, with the exact statement needed and the nodes that need it. Two of them ask for a Part II of an existing roadmap (PadicHodgeRegulators after L3, for the relative and two-variable regulators; SelmerIwasawaCohomology after L4, for family parity) and one for an extension of EulerSystemsAndKolyvaginSystems ES.5 (CH's bounded-error descent); see the [structural proposals](#structural-proposals).

### `ArithmeticGaloisDuality:R02.1` — Topological coefficients and inverse limits

<a id="req-18"></a>
*Request 18, from part GH.0. Needed by* [`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map).

For continuous finite-dimensional Q_p representations of G_F, identify extension classes 0→V→E→Q_p→0 with continuous H¹(F,V) by g↦g·lift(1)−lift(1), independently of lift, functorially under restriction and coefficient maps. Apply to the rational Gysin pullback for AJ_et. The R02.2 compact five-term sequence is not this theorem.

### `AutomorphicGaloisRepresentations:R19.1` — Classical Galois representations

<a id="req-1"></a>
*Request 1, from part GH.0. Needed by* [`GH.5/longo-vigni-admissible-triple`](#n-gh-5-longo-vigni-admissible-triple).

Deligne newform representation with the exact geometric Frobenius, self-dual twist and lattice index used by LV Definition 2.1, plus its determinant-restricted big-image input and solvable-tower invariant-vanishing consequence under the stated nonexceptional prime conditions.

### `AutomorphicGaloisRepresentations:R19.6` — Representations over Hecke algebras

<a id="req-2"></a>
*Request 2, from part GH.0. Needed by* [`GH.7/critical-character-twist`](#n-gh-7-critical-character-twist), [`GH.7/family-representation-specialization`](#n-gh-7-family-representation-specialization), [`GH.7/howard-family-tower`](#n-gh-7-howard-family-tower).

The Hida ordinary branch representation T=lim_s e^ord T_pJ_s⊗_h I of Castella Theorem 4.3: free rank two under residual irreducibility/p-distinguishedness, trace and determinant conventions, rank-one ordinary sequence and arithmetic specialization after the critical twist. The current weight-two Hecke reconstruction nodes do not themselves prove this tower theorem.

### `AutomorphicPadicLFunctions:L3h` — Anticyclotomic toric distributions and Hsieh's μ theorem

<a id="req-3"></a>
*Request 3, from part GH.0. Needed by* [`GH.1/coleman-depletion-calculation`](#n-gh-1-coleman-depletion-calculation), [`GH.4/bdp-special-value-formula`](#n-gh-4-bdp-special-value-formula), [`GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`](#n-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity), [`GH.4/dual-exponential-special-value`](#n-gh-4-dual-exponential-special-value), [`GH.4/ramified-character-abel-jacobi-formula`](#n-gh-4-ramified-character-abel-jacobi-formula), [`GH.6/anticyclotomic-nonvanishing`](#n-gh-6-anticyclotomic-nonvanishing), [`GH.7/family-measure-specialization`](#n-gh-7-family-measure-specialization).

One GL₂ BDP/CH square-root distribution owner, including p-depletion and negative θ powers on the CM ordinary locus, BDP 5.9–5.10 toric interpolation/continuity, CH Proposition 3.8 and Theorem 3.9’s Hsieh Theorem C nonvanishing with auxiliary residual hypotheses, and Castella Theorem 2.11 family interpolation with period, epsilon, Euler and gamma normalization. GH.4 owns the generalized-cycle special value identity, while GZ.9 imports m=0; do not rebuild the measure in either place.

### `ComplexMultiplicationAndExplicitReciprocity:CM.1` — Elliptic CM and ideal actions

<a id="req-4"></a>
*Request 4, from part GH.0. Needed by* [`GH.0/cm-elliptic-curve-and-its-hodge-splitting`](#n-gh-0-cm-elliptic-curve-and-its-hodge-splitting), [`GH.1/character-projected-heegner-class`](#n-gh-1-character-projected-heegner-class), [`GH.1/isogenies-of-conductor-c-prime-to-n`](#n-gh-1-isogenies-of-conductor-c-prime-to-n), [`GH.2/cycle-conjugation`](#n-gh-2-cycle-conjugation), [`GH.7/critical-character-twist`](#n-gh-7-critical-character-twist), [`GH.1/field-of-definition-of-generalized-heegner-cycles`](#n-gh-1-field-of-definition-of-generalized-heegner-cycles).

General CM A/H with End_H(A)=O_K, including exceptional unit fields; normalized Hodge characters and ideal action; the Tate module and CM character of B=Res_{H_K/K}A; decomposition of its full Sym^{2r−2} Tate module after coefficient extension, the G_K-equivariant χ projector after the finite-order twist χ_t (same conductor as χ, unique up to a Hilbert class character), and integral projector/class-inclusion denominators. Do not infer this from the false Sym/Ind isomorphism in CH §4.4. Also supply marked-isogeny descent to H̃·H_c beyond HE.1’s restricted unit fields.

### `DerivedDeRhamCohomology:DD.2` — Derived de Rham and the Hodge filtration

<a id="req-5"></a>
*Request 5, from part GH.0. Needed by* [`GH.0/cohomology-of-the-generalized-kuga-sato-variety`](#n-gh-0-cohomology-of-the-generalized-kuga-sato-variety), [`GH.0/projected-hodge-filtration`](#n-gh-0-projected-hodge-filtration), [`GH.1/homological-triviality-of-generalized-heegner-cycles`](#n-gh-1-homological-triviality-of-generalized-heegner-cycles).

Scheme-level algebraic de Rham realization for smooth proper schemes, filtered Künneth for W_m×A^m, cup product, compatibility with correspondence action and the classical smooth de Rham complex. Extend DD.2 beyond its present algebra/complex interface if this global filtered Künneth theorem is not yet included. Include the cycle-class and correspondence compatibility required for de Rham homological triviality.

### `EtaleDualityAndPerverseSheaves:EDC.6` — Integral, analytic and diamond comparison of operations

<a id="req-6"></a>
*Request 6, from part GH.0. Needed by* [`GH.0/cohomology-of-the-generalized-kuga-sato-variety`](#n-gh-0-cohomology-of-the-generalized-kuga-sato-variety), [`GH.1/homological-triviality-of-generalized-heegner-cycles`](#n-gh-1-homological-triviality-of-generalized-heegner-cycles), [`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map).

Rational p-adic étale Künneth and correspondence compatibility for proper smooth products, obtained from integral/finite systems with derived-limit control; no torsion duality statement alone supplies the rational product formula. Also export the rational p-adic Gysin exact sequence and cycle-class/correspondence compatibilities used for null-homologous codimension m+1 cycles supported on a smooth divisor in X_m, with derived-limit exactness, Tate twists, support enlargement and rational-equivalence independence for the pulled-back extension.

### `EulerSystemsAndKolyvaginSystems:ES.5` — Primitivity and sharpness over DVRs

<a id="req-17"></a>
*Request 17, from part GH.0. Needed by* [`GH.6/selmer-rank-one`](#n-gh-6-selmer-rank-one), [`GH.6/selmer-rank-zero`](#n-gh-6-selmer-rank-zero).

CH §7.2–7.5 anticyclotomic Euler-system descent with its bounded local errors and Nekovář auxiliary constants: nonzero bottom class gives the one-dimensional self-dual Selmer bound, and a nonzero complementary local class kills the Bloch–Kato group. Supply the finite–singular coefficient correction, residual Kummer detection, admissible primes and p^C annihilator independently of the stronger clean Howard hypothesis package; verify that CH (H) satisfies this source-specific instance. Do not infer this theorem by silently imposing LV big image on CH Theorem 6.1.

### `HeegnerPointEulerSystems:HE.1` — CM points and compatible modular parametrizations

<a id="req-7"></a>
*Request 7, from part GH.0. Needed by* [`GH.7/howard-family-tower`](#n-gh-7-howard-family-tower).

Compatible finite-level CM points on X₁(Np^s) with p-power conductor, defined over K̃_c(μ_{p^s}), their diamond character ϑ²=ε_cyc and degeneracy/vertical trace in Castella §4.2. The existing prime-to-level canonical CM pair node is insufficient when conductor and level both have p-parts; extend that point interface, while GH.7 owns the family coefficient/class adapter.

### `ModularCurvesPartII:R14.3` — Cohomological realisations and pairings

<a id="req-8"></a>
*Request 8, from part GH.0. Needed by* [`GH.0/cm-product-good-model`](#n-gh-0-cm-product-good-model), [`GH.0/cohomology-of-the-generalized-kuga-sato-variety`](#n-gh-0-cohomology-of-the-generalized-kuga-sato-variety), [`GH.0/generalized-kuga-sato-variety-and-its-projector`](#n-gh-0-generalized-kuga-sato-variety-and-its-projector), [`GH.0/newform-cm-projector`](#n-gh-0-newform-cm-projector), [`GH.1/coleman-depletion-calculation`](#n-gh-1-coleman-depletion-calculation), [`GH.2/cycle-conjugation`](#n-gh-2-cycle-conjugation), [`GH.7/howard-family-tower`](#n-gh-7-howard-family-tower), [`GH.0/projected-hodge-filtration`](#n-gh-0-projected-hodge-filtration).

RS-06 higher-weight extension of the universal-family carrier: W_m as canonical desingularized fiber power of the generalized elliptic curve over X₁(N), N>4; commuting N-torsion and signed Ξ_m projectors with denominator N^m2^m m!; Scholl projected degree m+1 cohomology, parabolic Hodge filtration Fil^{m+1}=S_{m+2}, Hecke action and f summand, integral stable lattice with an explicit Hecke congruence denominator, and smooth proper model over Z[1/N]. The current finite-level H¹ packet is insufficient for these higher fiber powers; extend the owner, not GH. For source levels N≤4, supply an auxiliary fine-level descent (or the appropriate stack realization) to the original newform, tracing degree, projector and lattice denominators and the CM level structures. N>4 on the chosen model is not an additional hypothesis of CH (H).

### `PadicDifferentialEquationsAndRigidCohomology:RD.4` — Rigid cohomology and compact support

<a id="req-9"></a>
*Request 9, from part GH.0. Needed by* [`GH.1/coleman-primitive`](#n-gh-1-coleman-primitive), [`GH.1/parabolic-residue-pairing`](#n-gh-1-parabolic-residue-pairing).

BDP §3.5 algebraic/rigid wide-open curve comparison with overconvergent coefficients, invariance under shrinking Frobenius neighborhoods, annular and cusp residues, rigid residue theorem and the Cech–de Rham cup-product formula. RD.3 supplies the F-isocrystal carrier separately; these exact wide-open comparisons need proof, not just a formal site map.

### `PadicHodgeRegulators:D.2` — Étale and syntomic regulators

<a id="req-10"></a>
*Request 10, from part GH.0. Needed by* [`GH.1/syntomic-abel-jacobi-comparison`](#n-gh-1-syntomic-abel-jacobi-comparison).

Higher-dimensional Chow-cycle syntomic Abel–Jacobi regulator for smooth proper X_m with projector action, proper/flat functoriality, and comparison with the étale Gysin extension and BK logarithm with an explicit Frobenius normalization. The existing Spec O_F Tate regulator and K₂ curve comparison nodes do not supply this statement.

### `PadicHodgeRegulators:L1` — Bloch–Kato maps

<a id="req-22"></a>
*Request 22, from part GH.8. Needed by* [`GH.8/differential-evaluation`](#n-gh-8-differential-evaluation), [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity).

Provide Bloch–Kato logarithm naturality for the quotient and its elliptic formal-group comparison, with the de Rham pairing and exact good-reduction range. For every finite local extension E/L_v occurring at conductor c₀ p^n, including ramified E/L_v, supply the canonical de Rham scalar-extension map D_dR,L_v(V) tensor_{L_v} E → D_dR,E(V) and the commutative square between restriction on H^1_f and the Bloch–Kato logarithm, with the actual filtration quotient and differential functional. Prove the Abel–Jacobi/Kummer comparison commutes with this restriction. Supply the corestriction/field-trace adjoint square and its pairing compatibility before passing to the tower. Retain good reduction and all logarithm-domain hypotheses; scalar extension of D_dR alone does not prove these arithmetic squares. Prove the degree-one comparison for the CM point-minus-cusp divisors defined over E itself, not only for classes descending to L_v: base-change compatibility on restricted classes alone does not cover all E-rational points.

### `PadicHodgeRegulators:L3` — The big logarithm and explicit interpolation

<a id="req-11"></a>
*Request 11, from part GH.0. Needed by* [`GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`](#n-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections), [`GH.4/dual-exponential-special-value`](#n-gh-4-dual-exponential-special-value), [`GH.4/fixed-weight-regulator-adapter`](#n-gh-4-fixed-weight-regulator-adapter), [`GH.5/longo-vigni-local-assumptions`](#n-gh-5-longo-vigni-local-assumptions), [`GH.7/critical-character-twist`](#n-gh-7-critical-character-twist), [`GH.7/ochiai-exponential-checkpoint`](#n-gh-7-ochiai-exponential-checkpoint), [`GH.7/two-variable-regulator-checkpoint`](#n-gh-7-two-variable-regulator-checkpoint), [`GH.7/yager-unramified-checkpoint`](#n-gh-7-yager-unramified-checkpoint).

Part II of Padic Hodge regulators: integral relative Lubin–Tate Perrin–Riou twists Ω with coefficient-lattice and finite pairing compatibility (KO 3.7, 4.7, 4.10); CH Theorem 5.1 relative regulator with its two interpolation ranges; Castella Theorem 3.4 exponential on J=(Ψ(Fr_p)−1,γ₀−1) with injectivity and pseudo-null cokernel; Yager trace module for the unramified Z_p tower, its rank-one freeness and y^u=[u]y covariance; Theorem 3.7 two-variable map into λ_reg^{-1}J and Corollary 3.9, with arithmetic exceptional denominators. The accepted L3 packet is strictly cyclotomic and finite unramified scalar extension is not an infinite unramified tower. This extension is the preferred local owner required by RT-iwasawa-1/27; AC L2 keeps bounded fixed-weight BK logarithms.

### `PadicHodgeTheory:R06.2` — Period functors and admissibility

<a id="req-12"></a>
*Request 12, from part GH.0. Needed by* [`GH.1/extensions-of-filtered-frobenius-modules`](#n-gh-1-extensions-of-filtered-frobenius-modules).

Negative-weight filtered Frobenius extensions over unramified F, admissible/crystalline extension comparison, Φ=Φ₀^[F:Q_p] convention and the quotient D_dR/Fil⁰ with the holomorphic-minus-Frobenius sign, as BDP §§3.2–3.4 uses.

### `PadicHodgeTheory:R06.5` — Geometric comparison theorems

<a id="req-13"></a>
*Request 13, from part GH.0. Needed by* [`GH.1/extensions-of-filtered-frobenius-modules`](#n-gh-1-extensions-of-filtered-frobenius-modules), [`GH.1/p-adic-abel-jacobi-map`](#n-gh-1-p-adic-abel-jacobi-map), [`GH.2/cycle-frobenius-congruence`](#n-gh-2-cycle-frobenius-congruence), [`GH.2/finite-local-abel-jacobi-class`](#n-gh-2-finite-local-abel-jacobi-class).

Application of proper smooth comparison to projected X_m cohomology, including its Hodge/Tate normalization and the geometric Abel–Jacobi extension landing in H¹_f. The generic geometric comparison is imported from CP and the regulator extension must be compatible with the higher-dimensional Chow Gysin construction. The finite-class assertion for conductor p-power cycles must allow finite ramified support fields, using the base-changed good model; keep D_cris over the maximal unramified subfield and D_dR over the full field distinct. The unramified BDP filtered-Frobenius presentation alone does not supply that ramified comparison.

### `SchemeAndStackFoundations:SF.2` — Sites and scheme cohomology

<a id="req-14"></a>
*Request 14, from part GH.0. Needed by* [`GH.0/cm-product-good-model`](#n-gh-0-cm-product-good-model), [`GH.1/parabolic-residue-pairing`](#n-gh-1-parabolic-residue-pairing).

Proper smooth base change and relative Gysin/specialization with the coefficient levels used for the product model and graph support. The already existing smooth/proper stability under products is imported from Mathlib, not re-planned.

### `SchemeAndStackFoundations:SF.5` — Intersection theory and Riemann-Roch

<a id="req-15"></a>
*Request 15, from part GH.0. Needed by* [`GH.0/cm-projector-and-symmetric-power`](#n-gh-0-cm-projector-and-symmetric-power), [`GH.0/generalized-kuga-sato-variety-and-its-projector`](#n-gh-0-generalized-kuga-sato-variety-and-its-projector), [`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map), [`GH.1/generalized-heegner-cycle`](#n-gh-1-generalized-heegner-cycle).

Ordinary rational Chow groups, rational equivalence, proper pushforward/flat pullback, isogeny graph products, correspondence composition and action, including base change and transpose. Compare degree-zero Bloch cycle complexes with this intersection-theory API instead of giving GH a private Chow carrier. Supply compatibility of ordinary Chow rational equivalence with the support-independent Gysin Abel–Jacobi construction, and its degree-zero divisor/Jacobian Kummer case.

### `SelmerIwasawaCohomology:L4` — Arithmetic examples and conjectures

<a id="req-16"></a>
*Request 16, from part GH.0. Needed by* [`GH.6/selmer-parity`](#n-gh-6-selmer-parity).

Corrected Nekovář family parity theorem (Nek07 Corollary 5.3.2 with Nek09 correction), including the precise self-dual induced family and local plus-module hypotheses used by CH §6.4. This is a proposed Part II arithmetic-consequence extension, not an assertion that RJW criticality examples already prove family parity.

<a id="internal-requests"></a>
### Requests of the GH.8 part to layers GH.0–GH.7

The GH.8 part, written before the GH.0 part's nodes existed, files eight requests with the earlier layers. They are listed in full; the [cross-part prerequisites](#cross-part-prerequisites) say which parts of each the GH.0–GH.7 nodes now supply. In short: the GH.4 request for the CH 2022 formula is met by `GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`, and the class, projector and local-condition requests are met at weight 2r in the all-split range; the version transports, the finite-base-change squares, the uniform integral maps, the finite-character descent, the weight-two extension of Castella's Lemma 6.4 and Theorem 6.5, the nonsplit tame-level range and the integral leading-class unit are not planned by any GH.0–GH.7 node and remain open.

#### `GeneralizedHeegnerCycles:GH.0` — Kuga–Sato geometry and coefficient projectors

<a id="req-19"></a>
*Request 19, from part GH.8. Needed by* [`GH.8/weight-zero-cycle`](#n-gh-8-weight-zero-cycle), [`GH.8/uniform-coherent-kernel-bound`](#n-gh-8-uniform-coherent-kernel-bound), [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export).

Supply the empty fiber-power identification, the correspondence action and q_π e_f=q_π for the actual quotient. Do not use the false full symmetric-power/induction display. For a two-sided lattice comparison select a multiplicity-one coefficient factor on which the quotient is a rational isomorphism; a reverse scalar identity on the whole Jacobian is not asserted. For corrected-bsd-input-export provide the actual level/projector/cycle construction in the nonsplit tame-prime range of Castella Birch erratum Theorem 2.3; CH standing Hypothesis (H) all-split does not cover it.

#### `GeneralizedHeegnerCycles:GH.1` — Algebraic cycles and Abel–Jacobi realizations

<a id="req-20"></a>
*Request 20, from part GH.8. Needed by* [`GH.8/modular-quotient-kummer`](#n-gh-8-modular-quotient-kummer), [`GH.8/differential-evaluation`](#n-gh-8-differential-evaluation), [`GH.8/uniform-coherent-kernel-bound`](#n-gh-8-uniform-coherent-kernel-bound), [`GH.8/uniform-coherent-lift`](#n-gh-8-uniform-coherent-lift), [`GH.8/character-sum-comparison`](#n-gh-8-character-sum-comparison), [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity).

Supply the finite Picard–Kummer/Gysin sign comparison: at m=p^n, U=C minus the finite support S of the degree-zero divisor D, compare the boundary of (n_s mod m)_s in ker((Z/m)^S → Z/m) with the Kummer boundary of [D] under J[m]=H^1_et(C̄,μ_m). Use a division line bundle and its trivialization on U to compute the cocycle, with choices, Galois descent, transitions and the continuous-cochain passage checked. Also supply de Rham quotient compatibility. For the integral tower, construct actual forward/backward coefficient maps on the selected f-factor, with both composites equal to one fixed nonzero scalar, and prove their induced cohomology maps respect all corestrictions. The Jacobian multiplication sequence and Kummer functoriality for q_π must use the actual Picard variety, not just the elliptic Kummer theorem. Supply coefficient-map naturality and the crystalline/de Rham duality convention at degree one. For every finite local extension E/L_v occurring at conductor c₀ p^n, including ramified E/L_v, supply the canonical de Rham scalar-extension map D_dR,L_v(V) tensor_{L_v} E → D_dR,E(V) and the commutative square between restriction on H^1_f and the Bloch–Kato logarithm, with the actual filtration quotient and differential functional. Prove the Abel–Jacobi/Kummer comparison commutes with this restriction. Supply the corestriction/field-trace adjoint square and its pairing compatibility before passing to the tower. Retain good reduction and all logarithm-domain hypotheses; scalar extension of D_dR alone does not prove these arithmetic squares. Prove the degree-one comparison for the CM point-minus-cusp divisors defined over E itself, not only for classes descending to L_v: base-change compatibility on restricted classes alone does not cover all E-rational points.

#### `GeneralizedHeegnerCycles:GH.2` — Ring-class trace, congruence and local conditions

<a id="req-25"></a>
*Request 25, from part GH.8. Needed by* [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export).

Supply the corrected Selmer containment for generalized and derived classes in the exact auxiliary higher-weight range of Castella Birch erratum Theorem 2.3, including nonsplit tame primes. Use the CH erratum and KO20 replacement with its actual hypotheses; extend the all-split construction explicitly.

#### `GeneralizedHeegnerCycles:GH.3` — Ordinary stabilization and universal norms

<a id="req-21"></a>
*Request 21, from part GH.8. Needed by* [`GH.8/positive-tail-corestriction`](#n-gh-8-positive-tail-corestriction), [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), [`GH.8/uniform-coherent-kernel-bound`](#n-gh-8-uniform-coherent-kernel-bound), [`GH.8/uniform-coherent-lift`](#n-gh-8-uniform-coherent-lift), [`GH.8/primitive-character-stabilization`](#n-gh-8-primitive-character-stabilization), [`GH.8/character-sum-comparison`](#n-gh-8-character-sum-comparison), [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity), [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export).

Identify the integral normalized tail with the existing Iwasawa-cohomology carrier. Supply uniform, not level-dependent, lattice comparison data and the compatible reverse maps needed by uniform-coherent-lift; the explicit multiple-lifting argument avoids asserting right-exactness of inverse limits. Identify the initial term only after the raw HE.0/HE.2 formulas and source normalization maps have been checked. Supply the finite-character evaluation of the integral inverse-limit class and its coefficient twist/descent, as used in CH Lemma 5.4 via Rubin Lemma 2.4.3. Identify its finite-level value with the unnormalized weighted sum before applying GH.8 primitive-character-stabilization. Do not infer this map from a formal scalar sum, and do not infer a conductor-zero identity from ramified character values without a proved separation/control theorem. For the actual finite quotient action, prove that restriction from the lower conductor has image fixed by its last conductor kernel. Identify exact conductor with failure to factor through the preceding ring-class quotient, using HE.0 conductor-change-kernel and ring-class-tower-quotients. The HE.3 node supplies the elliptic Kummer maps and trace compatibility; it does not supply this twisted descent or repair the CH carrier. Extend the actual stabilized integral system to the corrected BSD auxiliary-form tame-level range, with its weight-dependent denominator/admissibility conditions proved. When invoking the existing HE.8 point-system nodes, retain their E(K)[p]=0 hypothesis and their actual ring-class-to-anticyclotomic trace/index maps. For auxiliary c₀ retain the finite ring-class component until its explicit corestriction; this is not an automatic identification with the c₀=1 system.

#### `GeneralizedHeegnerCycles:GH.4` — Explicit reciprocity and p-adic Abel–Jacobi formulas

<a id="req-23"></a>
*Request 23, from part GH.8. Needed by* [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity), [`GH.8/automorphic-reciprocity-export`](#n-gh-8-automorphic-reciprocity-export), [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export).

Provide version-qualified reciprocity with actual twist, scalar and group-like-factor maps; compare the t^{1-2r} pairing in the family proof with t^{-2r} in the 2022 CH text before transporting equalities. The integrated GH.4 reciprocity node supplies the CH 2022 formula. The additional request is the comparison of source coefficient rings, de Rham duals, Tate-period powers, signs and CM-period generators when transporting that formula to the Castella author-copy conventions. Provide the exact pullback of the elliptic differential functional after ψ^{-1} twisting. It must be c_π times the CH scalar functional in the same completed unramified ring; prove this from π*ω_E=c_π ω_f and the CM generator identity (5.3), rather than treating t as a scalar unit. Supply the source-qualified CH reciprocity extension in the corrected BSD auxiliary-form tame-level range. Its all-split theorem alone is insufficient.

#### `GeneralizedHeegnerCycles:GH.5` — Higher-weight Kolyvagin system and arithmetic hypotheses

<a id="req-27"></a>
*Request 27, from part GH.8. Needed by* [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export).

Supply the actual Longo–Vigni Kolyvagin system and its integral leading-class comparison κ_1=v κ_∞ with an explicitly identified p-adic unit v. Verify LV admissibility/exceptional primes and justify the nonsplit tame-prime and varying-weight range needed by Castella Birch erratum Theorem 2.3. Preserve integral constants and lattice maps.

#### `GeneralizedHeegnerCycles:GH.6` — Nonvanishing and source-qualified Selmer consequences

<a id="req-26"></a>
*Request 26, from part GH.8. Needed by* [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export).

Supply CH Theorem 6.1 non-torsion and rank-one consequences for the actual higher-weight Iwasawa class in the nonsplit tame-prime range of the corrected BSD auxiliary theorem; prove the source-range extension rather than omitting standing Hypothesis (H).

#### `GeneralizedHeegnerCycles:GH.7` — Hida-family classes and specialization

<a id="req-24"></a>
*Request 24, from part GH.8. Needed by* [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity), [`GH.8/automorphic-reciprocity-export`](#n-gh-8-automorphic-reciprocity-export), [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export).

Supply Hida moments and actual specialization/twist maps for Castella (6.8)–(6.9). Prove the weight-two p-old extension of Lemma 6.4 using Greenberg torsion-freeness, specialization/control, characterwise nonvanishing and rank-one Selmer bounds on every finite ring-class component. For local injectivity, realize LZ14 v3 Proposition 4.11 with its infinite unramified direction, then identify the bounded Iwasawa coefficient ideal and the analytic distribution ideal in the CH Theorem 5.1 descent. For the relative Lubin–Tate map verify the finite unramified base, crystalline nonnegative Hodge–Tate range, absence of a trivial quotient and vanishing of the fixed vectors over the torsion extension, as required by CH Theorem 5.1; prove these for the actual ordinary rank-one representation. Supply the comparison maps and prove that the preimage of the target quotient submodule is exactly the source quotient submodule (or prove the descended kernel zero directly). Finally prove the nonzero pairing on the ordinary crystalline line survives the chosen scalar extension and source-version transport. Retain Yager-module, completion and specialization corrections; the L3 cyclotomic packet does not supply this two-variable descent. Export Theorem 5.3 in S=I[λ^{-1}] completed tensor W, λ=Ψ(Frob_p)-1, with the exact ξ^{-1} twist and finite-ring-class corestriction/restriction maps. Identify the allowed specializations of this localized coefficient ring. If ν(λ)=0, give a regular integral model or cleared-denominator identity and prove its specialization; direct evaluation of λ^{-1} is undefined. Prove regulator naturality along the actual weight-two coefficient map and the ensuing ordinary crystalline-line map, including the induced distribution pushforward; cyclotomic naturality alone does not prove this anticyclotomic diagram. The corrected BSD export also needs the precise admissible congruence-weight set and a regular model for analytic moments at the multiplicative point; do not use the excluded p-old class comparison there.

<a id="recorded-gaps"></a>
## Recorded gaps

The 24 gaps of the two parts, numbered G1–G18 (GH.0 part) and G19–G24 (GH.8 part). A gap is something a node needs that neither the libraries nor an existing node supplies, recorded rather than papered over; each names the nodes that need it. G18 is the review's finding on five suggested interfaces and tests.

<a id="gap-1"></a>
### G1. Higher-weight universal-family export

*Part GH.0. Layers: [GH.0](#layer-gh-0), [GH.1](#layer-gh-1).*

R14.3 currently supplies finite-level H¹ rather than the full Scholl fiber-power/projector/lattice package. Its requested RS-06 extension must prove the integral Hecke denominator and the f-lattice comparison, beyond p∤2N m!. Source levels N≤4 also require auxiliary fine-level descent to the original newform with its CM structures and denominators; the N>4 model condition does not follow from CH (H).

Needed by: [`GH.0/newform-cm-projector`](#n-gh-0-newform-cm-projector), [`GH.1/integral-abel-jacobi-comparison`](#n-gh-1-integral-abel-jacobi-comparison).

<a id="gap-2"></a>
### G2. Product realizations and CM good model

*Part GH.0. Layers: [GH.0](#layer-gh-0).*

Filtered de Rham and rational étale Künneth exports and the independently chosen CM good model are not supplied by level p∤N. Verify the selected canonical CM application over finite unramified F; do not extend it to arbitrary CM twists.

Needed by: [`GH.0/cohomology-of-the-generalized-kuga-sato-variety`](#n-gh-0-cohomology-of-the-generalized-kuga-sato-variety), [`GH.0/cm-product-good-model`](#n-gh-0-cm-product-good-model), [`GH.0/projected-hodge-filtration`](#n-gh-0-projected-hodge-filtration).

<a id="gap-3"></a>
### G3. Integral descent and CM character coefficient adapter

*Part GH.0. Layers: [GH.1](#layer-gh-1).*

Prove vanishing of coefficient invariants for the K̃_c/K_c descent, and construct the Weil-restriction CM-character summand with all lattice/projector denominators. Invariance of a class alone does not identify the two H¹ groups. Use the full symmetric power of T_p(Res A) and prove the actual character/class inclusion; the published Sym/Ind identity is false by rank (E7), so it cannot supply the missing integral adapter.

Needed by: [`GH.1/integral-abel-jacobi-comparison`](#n-gh-1-integral-abel-jacobi-comparison), [`GH.1/character-projected-heegner-class`](#n-gh-1-character-projected-heegner-class).

<a id="gap-4"></a>
### G4. Geometric syntomic regulator comparison

*Part GH.0. Layers: [GH.1](#layer-gh-1).*

Obtain the higher-dimensional Chow regulator and its exact Frobenius/Tate comparison. Current D.2 Spec O_F and D.5 K₂ curve comparison theorems are insufficient.

Needed by: [`GH.1/syntomic-abel-jacobi-comparison`](#n-gh-1-syntomic-abel-jacobi-comparison).

<a id="gap-5"></a>
### G5. Classical-cycle source comparison

*Part GH.0. Layers: [GH.1](#layer-gh-1), [GH.7](#layer-gh-7).*

BDP 2017, p-adic L-functions and the coniveau filtration on Chow groups, Proposition 4.1.2 was not read in this run. Castella’s use and constants were read. Acquire that source and verify the cycle adapter rather than claim BDP 2013 proves it.

Needed by: [`GH.1/classical-generalized-cycle-comparison`](#n-gh-1-classical-generalized-cycle-comparison), [`GH.7/initial-family-specialization`](#n-gh-7-initial-family-specialization).

<a id="gap-6"></a>
### G6. Wide-open residue and Coleman comparison export

*Part GH.0. Layers: [GH.1](#layer-gh-1).*

The exact BDP §§3.5–3.6 wide-open algebraic/rigid comparison and residue theorem with L_{m,m} must be exported by RD.4. The F-isocrystal carrier alone does not prove the analytic primitive calculation.

Needed by: [`GH.1/parabolic-residue-pairing`](#n-gh-1-parabolic-residue-pairing), [`GH.1/coleman-primitive`](#n-gh-1-coleman-primitive).

<a id="gap-7"></a>
### G7. Corrected integral p-condition adapter

*Part GH.0. Layers: [GH.2](#layer-gh-2), [GH.5](#layer-gh-5), [GH.6](#layer-gh-6).*

KO Lemma 4.10’s proof was read, but its Condition 2.3 and integral Ω construction are not discharged. Prove the requested lifting/orthogonality theorem and identify its height-one regulator-image local condition and lattice with the CH or LV condition at each required specialization.

Needed by: [`GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`](#n-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections), [`GH.5/higher-weight-kolyvagin-class`](#n-gh-5-higher-weight-kolyvagin-class), [`GH.6/selmer-rank-zero`](#n-gh-6-selmer-rank-zero).

<a id="gap-8"></a>
### G8. Bottom conductor and full/half unit normalization

*Part GH.0. Layers: [GH.3](#layer-gh-3), [GH.7](#layer-gh-7).*

Compute the missing n=1 split trace in CH’s 2022 copy and the unit orbit multiplicity. CH u_c=|O_c×| differs from Castella u_c=|O_c×|/2. No equality of their raw initial classes is assumed.

Needed by: [`GH.3/stabilized-first-step-adapter`](#n-gh-3-stabilized-first-step-adapter), [`GH.3/iwasawa-heegner-class`](#n-gh-3-iwasawa-heegner-class), [`GH.7/initial-family-specialization`](#n-gh-7-initial-family-specialization).

<a id="gap-9"></a>
### G9. Ramified conductor-one logarithm boundary

*Part GH.0. Layers: [GH.4](#layer-gh-4).*

Theorem 4.9 states n≥1, while the conductor cancellation used in the density argument is n>1. Verify the n=1 calculation from the CM sum and lower conductor contributions; retain the separate BDP unramified Euler formula.

Needed by: [`GH.4/ramified-character-abel-jacobi-formula`](#n-gh-4-ramified-character-abel-jacobi-formula).

<a id="gap-10"></a>
### G10. Generic local regulator Part II

*Part GH.0. Layers: [GH.4](#layer-gh-4), [GH.7](#layer-gh-7).*

L3 presently proves the cyclotomic map. The relative Lubin–Tate and unramified×cyclotomic ordinary deformation contracts, ideal J, Yager module, λ_reg localization, pseudo-null errors and exceptional denominators require the precise proposed extension.

Needed by: [`GH.4/fixed-weight-regulator-adapter`](#n-gh-4-fixed-weight-regulator-adapter), [`GH.7/ochiai-exponential-checkpoint`](#n-gh-7-ochiai-exponential-checkpoint), [`GH.7/yager-unramified-checkpoint`](#n-gh-7-yager-unramified-checkpoint), [`GH.7/two-variable-regulator-checkpoint`](#n-gh-7-two-variable-regulator-checkpoint).

<a id="gap-11"></a>
### G11. LV local twist and integral local verification

*Part GH.0. Layers: [GH.5](#layer-gh-5), [GH.6](#layer-gh-6).*

Check Assumption 3.2 in the representation convention of the LV edition read: trivial inertia on the quotient is not implied just by ordinarity of the untwisted form. Prove the actual annihilator, H⁰ and Cartesian/control conditions or supply a corrected applicable control theorem. This is a verification gap against arXiv v1, not an accusation about the published version.

Needed by: [`GH.5/longo-vigni-local-assumptions`](#n-gh-5-longo-vigni-local-assumptions), [`GH.5/specialization-control`](#n-gh-5-specialization-control), [`GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound`](#n-gh-5-longo-vigni-admissibility-and-the-lambda-adic-bound), [`GH.6/lambda-structure-consequence`](#n-gh-6-lambda-structure-consequence).

<a id="gap-12"></a>
### G12. Analytic nonvanishing supplier

*Part GH.0. Layers: [GH.6](#layer-gh-6).*

Hsieh’s Theorem C itself was not read; CH’s use and auxiliary-prime proof route were read. L3h must supply its exact level/discriminant/residual conditions and the resulting bounded nonzero measure before the eventual algebraic nonvanishing claim is applied.

Needed by: [`GH.6/anticyclotomic-nonvanishing`](#n-gh-6-anticyclotomic-nonvanishing).

<a id="gap-13"></a>
### G13. CH versus clean Howard descent

*Part GH.0. Layers: [GH.6](#layer-gh-6).*

Import or extend ES.5 to the CH/Nekovář bounded-error descent under CH (H). The stronger clean Howard H0–H5 criterion or LV big image is not silently added to the fixed-weight CH conclusion.

Needed by: [`GH.6/selmer-rank-one`](#n-gh-6-selmer-rank-one), [`GH.6/selmer-rank-zero`](#n-gh-6-selmer-rank-zero).

<a id="gap-14"></a>
### G14. LV universal-norm identification

*Part GH.0. Layers: [GH.3](#layer-gh-3), [GH.6](#layer-gh-6).*

Track finite Δ corestriction, p∤h_K, eventual augmented ideal equality and the Perrin–Riou universal-norm/Nakayama input. Verify generation of H∞ by κ̃₁ rather than infer it from nonvanishing of κ̃₁.

Needed by: [`GH.3/universal-norm-heegner-class`](#n-gh-3-universal-norm-heegner-class), [`GH.6/universal-norm-module-rank-one`](#n-gh-6-universal-norm-module-rank-one).

<a id="gap-15"></a>
### G15. Parity supplier and sign convention

*Part GH.0. Layers: [GH.6](#layer-gh-6).*

Supply Nekovář’s corrected family parity theorem and check its local family hypotheses. Use parity residue (1−ε)/2; the final congruence in the CH author-copy proof printed with ε alone cannot distinguish the two root signs modulo 2.

Needed by: [`GH.6/selmer-parity`](#n-gh-6-selmer-parity).

<a id="gap-16"></a>
### G16. Hida point and representation tower exports

*Part GH.0. Layers: [GH.7](#layer-gh-7).*

Extend the finite-level CM point interface to shared p-parts of conductor/level; provide the ordinary rank-two Hida representation and specialization with its bad-prime residual hypotheses. A weight-two Hecke representation and fixed-weight Hida control alone do not give the complete tower contract.

Needed by: [`GH.7/howard-family-tower`](#n-gh-7-howard-family-tower), [`GH.7/family-representation-specialization`](#n-gh-7-family-representation-specialization).

<a id="gap-17"></a>
### G17. Rational Gysin and continuous extension adapter

*Part GH.0. Layers: [GH.1](#layer-gh-1).*

EDC.3 is a finite-coefficient Gysin theorem. Establish the EDC.6 rational derived-limit and Chow-support compatibilities, the R02.1 continuous Ext¹/H¹ identification and the SF.5 rational-equivalence/Jacobian case; compact inflation–restriction is insufficient. Betti cycle-class compatibility in the homological-triviality claim must also be stated rather than inferred from torsion étale purity.

Needed by: [`GH.1/homological-triviality-of-generalized-heegner-cycles`](#n-gh-1-homological-triviality-of-generalized-heegner-cycles), [`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map).

<a id="gap-18"></a>
### G18. Suggested interfaces and discriminating geometric tests

*Part GH.0. Layers: [GH.0](#layer-gh-0), [GH.1](#layer-gh-1), [GH.3](#layer-gh-3).*

The CM action, signed permutation, marked conductor, admissible Coleman primitive and inverse-limit norm carrier are not tested by the current named arithmetic/linear examples. Replace the detached identities with fixtures referring to these objects; include a nonzero primitive test and a norm tower whose maps and bottom constraint are part of the universalNormClass input. Protocol §13 permits missing owner conditions, but does not make unrelated examples tests of an object. See the completed independent review for exact examples and the reader synchronization required.

Needed by: [`GH.0/cm-elliptic-curve-and-its-hodge-splitting`](#n-gh-0-cm-elliptic-curve-and-its-hodge-splitting), [`GH.0/cm-projector-and-symmetric-power`](#n-gh-0-cm-projector-and-symmetric-power), [`GH.1/isogenies-of-conductor-c-prime-to-n`](#n-gh-1-isogenies-of-conductor-c-prime-to-n), [`GH.1/coleman-primitive`](#n-gh-1-coleman-primitive), [`GH.3/universal-norm-heegner-class`](#n-gh-3-universal-norm-heegner-class).

<a id="gap-19"></a>
### G19. Degree-one realization and uniform integral lattice

*Part GH.8.*

Supply GH.1’s finite Picard–Kummer/Gysin sign comparison on the actual curve, Jacobian and multiplication sequence, continuous passage and de Rham duality. Construct the selected f-factor maps with both composites equal to one fixed nonzero scalar and with all corestrictions commuting. A levelwise rational isomorphism does not give an integral Iwasawa isomorphism; unbounded-denominators-counterexample rejects that inference. For every finite local extension E/L_v occurring at conductor c₀ p^n, including ramified E/L_v, supply the canonical de Rham scalar-extension map D_dR,L_v(V) tensor_{L_v} E → D_dR,E(V) and the commutative square between restriction on H^1_f and the Bloch–Kato logarithm, with the actual filtration quotient and differential functional. Prove the Abel–Jacobi/Kummer comparison commutes with this restriction. Supply the corestriction/field-trace adjoint square and its pairing compatibility before passing to the tower. Retain good reduction and all logarithm-domain hypotheses; scalar extension of D_dR alone does not prove these arithmetic squares. Prove the degree-one comparison for the CM point-minus-cusp divisors defined over E itself, not only for classes descending to L_v: base-change compatibility on restricted classes alone does not cover all E-rational points.

Needed by: [`GH.8/modular-quotient-kummer`](#n-gh-8-modular-quotient-kummer), [`GH.8/differential-evaluation`](#n-gh-8-differential-evaluation), [`GH.8/uniform-coherent-kernel-bound`](#n-gh-8-uniform-coherent-kernel-bound), [`GH.8/uniform-coherent-lift`](#n-gh-8-uniform-coherent-lift), [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity).

<a id="gap-20"></a>
### G20. CM carrier and finite-character descent

*Part GH.8.*

Repair or bypass the full symmetric-power/induction display E-GH8-1, including the degree-zero case, in GH.0/GH.3. Realize the quotient Galois action, exact-conductor/last-kernel comparison, restriction-image invariance and the finite-character specialization/descent of CH Lemma 5.4 (Rubin Lemma 2.4.3). The finite integral weighted-sum lemma alone proves none of these arithmetic maps.

Needed by: [`GH.8/weight-zero-cycle`](#n-gh-8-weight-zero-cycle), [`GH.8/character-sum-comparison`](#n-gh-8-character-sum-comparison), [`GH.8/primitive-character-stabilization`](#n-gh-8-primitive-character-stabilization), [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity), [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export).

<a id="gap-21"></a>
### G21. Initial conductor and source normalization

*Part GH.8.*

Instantiate the existing HE.0/HE.2 declaration-level degree and trace results on the actual level curve, basepoint and Kummer normalization. Check geometric versus arithmetic Frobenius and any p-class tower shift. Reconcile the full unit order printed in CH Definition 5.2 with the half-order in Castella (6.7) by actual normalization maps. CH Proposition 4.4 covers n>1; it does not certify the initial input. Compare norm-compatible bottoms only through the proved first-corestriction square. The factor mismatch remains a comparison gap, not an additional established source error. Retain E(K)[p]=0 and the finite c₀ component when applying the existing HE.8 supplier; any extension outside its statement requires proof.

Needed by: [`GH.8/initial-corestriction-comparison`](#n-gh-8-initial-corestriction-comparison), [`GH.8/positive-tail-corestriction`](#n-gh-8-positive-tail-corestriction), [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity).

<a id="gap-22"></a>
### G22. Regulator descent and source-qualified period maps

*Part GH.8.*

GH.7 must prove the typed coefficient/distribution quotient descent with zero descended kernel, nonzero pairing on the ordinary crystalline line, and the torsion-free/control/nonvanishing/rank-one chain of Castella Lemma 6.4. LZ14 Proposition 4.11 concerns an infinite unramified direction, and does not alone prove injectivity after quotienting it out. GH.4/GH.7 must transport CH 2022 and Castella author-copy twists, signs, t-powers, CM generators and completed-unramified rings by actual maps. Verify which specializations extend over λ^{-1}; at a zero of λ construct a regular coefficient model instead of evaluating a pole.

Needed by: [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity), [`GH.8/automorphic-reciprocity-export`](#n-gh-8-automorphic-reciprocity-export), [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export).

<a id="gap-23"></a>
### G23. Corrected BSD auxiliary-form range and integral leading class

*Part GH.8.*

The corrected multiplicative proof uses nonsplit tame primes and varying higher weights. CH standing Hypothesis (H) has all tame primes split and a weight-dependent factorial exclusion; LV also has admissibility restrictions. GH.0–GH.7 must justify the exact extension to this auxiliary-form range, including corrected derived local conditions, non-torsion and the explicit unit relating the leading Kolyvagin class to the stabilized Iwasawa class. This is not supplied by the common all-split p-old comparison. BSD.6a owns the congruence/control transfer to the multiplicative curve; its theorem is not assumed to prove the missing source-range adapter. GH.5 owns the integral leading-class unit; GH.6 owns non-torsion. Native GH.7 analytic moments supply this export directly, without the p-old point-comparison prerequisites.

Needed by: [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export).

<a id="gap-24"></a>
### G24. Arithmetic Lean interfaces

*Part GH.8.*

The arithmetic targets need the actual curve/Jacobian, Chow group, continuous Tate-module Kummer, Iwasawa cohomology, crystalline-line and completed coefficient APIs named in their supplier contracts. The suggested file gives the expressible algebraic components and identifies the omitted arithmetic signatures individually. No opaque curve/cohomology types or conclusion-bearing fields stand in for them.

Needed by: [`GH.8/weight-zero-cycle`](#n-gh-8-weight-zero-cycle), [`GH.8/modular-quotient-kummer`](#n-gh-8-modular-quotient-kummer), [`GH.8/character-sum-comparison`](#n-gh-8-character-sum-comparison), [`GH.8/positive-conductor-stabilization`](#n-gh-8-positive-conductor-stabilization), [`GH.8/positive-tail-corestriction`](#n-gh-8-positive-tail-corestriction), [`GH.8/differential-evaluation`](#n-gh-8-differential-evaluation), [`GH.8/ordinary-p-old-family`](#n-gh-8-ordinary-p-old-family), [`GH.8/weight-two-reciprocity`](#n-gh-8-weight-two-reciprocity), [`GH.8/automorphic-reciprocity-export`](#n-gh-8-automorphic-reciprocity-export), [`GH.8/corrected-bsd-input-export`](#n-gh-8-corrected-bsd-input-export).

<a id="source-issues"></a>
## Source issues

The mistakes in published sources that the two parts found, with their review verdicts; the atlas register is `research/errata/REGISTER.md`. E1–E3 are the authors' own erratum items; E4–E7 and E-GH8-1 are new.

**E7 and E-GH8-1 are one finding.** Both concern the same display of CH §4.4, which identifies the full symmetric power Sym^{2r−2} T_p(B)(1 − r) ⊗ O_F with the induced module Ind S^{r−1}(A) ⊗ O_F: E7 cites it in the 2022 author copy (p. 17) and in the published print (p. 593), E-GH8-1 in the published print and the author copy. Both reviews confirmed it, with the same rank count: with h = [H_K : K] and m = 2r − 2 the two sides have ranks binomial(2h + m − 1, m) and h(m + 1), so 1 and h at m = 0, and h(2h + 1) and 3h at m = 2. The register lists it twice, once under each edition. The roadmap uses the literal full symmetric power and requests the character adapter from ComplexMultiplicationAndExplicitReciprocity CM.1 ([G3](#gap-3), [G20](#gap-20)).

<a id="issue-e1"></a>
### GeneralizedHeegnerCycles/E1 — misprint

*Part GH.0. Source* [castella-hsieh-erratum](#src-castella-hsieh-erratum), Theorem 6.3; corrected July 2, 2022 author copy p.27 and first item of author-hosted erratum.

- **Printed:** Theorem 6.3: The statement should read
- **Correction:** Use ((1−ε(V_f,χ))/2)[K_p^n:K]+e, not an expression using the root sign itself as a slope.
- **Reason:** A root number +1 gives eventual rank-zero characters and slope 0; root number −1 gives rank-one characters and slope 1.
- **Affects:** a stated result. **Known:** Castella–Hsieh erratum, first item; incorporated in the July 2, 2022 author copy.
- **Searched:** Author-hosted revised HCES.pdf; Author-hosted erratum2.pdf
- **Review:** confirmed by REV-GeneralizedHeegnerCycles--GH.0. A root number +1 gives eventual rank-zero characters and slope 0; root number −1 gives rank-one characters and slope 1.

<a id="issue-e2"></a>
### GeneralizedHeegnerCycles/E2 — error

*Part GH.0. Source* [castella-hsieh-erratum](#src-castella-hsieh-erratum), Lemma 7.5 and its use in Proposition 7.8; author copy pp.31–32; second erratum item.

- **Printed:** Lemma 7.5: We have to assume further L/Qp to be unramified
- **Correction:** Require absolute unramifiedness over Q_p for the Fontaine–Laffaille proof. Use KO20 Lemma 4.10’s integral Perrin–Riou argument for the required ramified-conductor derivative local condition.
- **Reason:** Relative unramifiedness over a ramified conductor field does not put the base in the Fontaine–Laffaille setting; the authors explicitly state that the ramified version of Lemma 7.5 is not known.
- **Affects:** the proof. **Known:** Castella–Hsieh erratum, second item; correct replacement KO20 Lemma 4.10.
- **Searched:** Author-hosted revised HCES.pdf and its Proposition 7.8 footnote; Author-hosted erratum2.pdf; KO author-hosted proceedings copy, Lemma 4.10
- **Review:** confirmed by REV-GeneralizedHeegnerCycles--GH.0. Relative unramifiedness over a ramified conductor field does not put the base in the Fontaine–Laffaille setting; the authors explicitly state that the ramified version of Lemma 7.5 is not known.

<a id="issue-e3"></a>
### GeneralizedHeegnerCycles/E3 — misprint

*Part GH.0. Source* [castella-hsieh-erratum](#src-castella-hsieh-erratum), Lemma 7.10 and explanation; author copy pp.32–33; third erratum item.

- **Printed:** Lemma 7.10: “...be a p-ramified extension..”
- **Correction:** The p-ramified extension in the lemma is abelian.
- **Reason:** The character/class-field argument uses abelianity; it does not classify arbitrary p-ramified extensions.
- **Affects:** a stated result. **Known:** Castella–Hsieh erratum, third item; corrected in the July 2, 2022 author copy.
- **Searched:** Author-hosted revised HCES.pdf; Author-hosted erratum2.pdf
- **Review:** confirmed by REV-GeneralizedHeegnerCycles--GH.0. The character/class-field argument uses abelianity; it does not classify arbitrary p-ramified extensions.

<a id="issue-e4"></a>
### GeneralizedHeegnerCycles/E4 — misprint

*Part GH.0. Source* [castella-hsieh](#src-castella-hsieh), July 2, 2022 author copy, proof of Theorem 6.4, p.28, final displayed congruence; not a finding against the 2018 version of record.

- **Printed:** dimF Sel(K, Vf,χ ) ≡ dimF (φ) Sel(K, Vf,χφ ) ≡ (Vf,χ ) (mod 2),
- **Correction:** The final parity residue is (1−ε(V_f,χ))/2 modulo 2, rather than ε(V_f,χ) modulo 2. The statement of Theorem 6.4 remains the parity equality.
- **Reason:** The preceding paragraph gives dimension 0 for root sign +1 and dimension 1 for root sign −1. Both +1 and −1 are odd, so the printed residue cannot encode the former case.
- **Affects:** the proof. **Known:** new
- **Searched:** CH July 2, 2022 author copy; Hsieh erratum2.pdf (all three corrections); Castella erratum.pdf (older author-hosted correction notice); Hsieh research page and exact theorem/parity web search; no correction to this proof line found
- **Review:** confirmed by REV-GeneralizedHeegnerCycles--GH.0. The preceding paragraph gives dimension 0 for root sign +1 and dimension 1 for root sign −1. Both +1 and −1 are odd, so the printed residue cannot encode the former case.

<a id="issue-e5"></a>
### GeneralizedHeegnerCycles/E5 — misprint

*Part GH.0. Source* [longo-vigni](#src-longo-vigni), arXiv:1605.03168v1, §5.1, p.18, opening paragraph; published text not accessible in this run.

- **Printed:** (5) of Assumption 2.3
- **Correction:** Refer to the ordinarity clause (4) of Definition 2.1, imposed by Assumption 2.3.
- **Reason:** Assumption 2.3 merely states admissibility; Definition 2.1 has four clauses, and its fourth clause is a_p a unit. This corrects the reference only; whether the self-dual twist satisfies the local quotient clause remains a separate recorded gap.
- **Affects:** nothing. **Known:** new
- **Searched:** arXiv abstract and submission history: only v1 listed; Publisher DOI/full-text page: Incapsula access block; Longo publications page: timeout; no erratum found in primary-source search
- **Review:** confirmed by REV-GeneralizedHeegnerCycles--GH.0. Assumption 2.3 merely states admissibility; Definition 2.1 has four clauses, and its fourth clause is a_p a unit. This corrects the reference only; whether the self-dual twist satisfies the local quotient clause remains a separate recorded gap.

<a id="issue-e6"></a>
### GeneralizedHeegnerCycles/E6 — misprint

*Part GH.0. Source* [longo-vigni](#src-longo-vigni), arXiv:1605.03168v1, §4.4, p.18, proof of Theorem 4.12, Claim 2; published text not accessible in this run.

- **Printed:** aug(γℓ ) = aug(Φ)
- **Correction:** Use equality of generated ideals aug(γ_ℓ)O_p=aug(Φ)O_p for all sufficiently large ℓ, as in the preceding paragraph. Scalar values need not become equal.
- **Reason:** Corollary 4.3 and the recurrence prove eventual equality of ideals, with a unit factor permitted. For example, a nonzero scalar sequence satisfying x_(m+2)=a_p x_(m+1)−p^(k−1)x_m cannot be eventually constant unless a_p−p^(k−1)=1. The lifting argument only needs ideal equality.
- **Affects:** the proof. **Known:** new
- **Searched:** arXiv abstract and submission history: only v1 listed; Publisher DOI/full-text page: Incapsula access block; Longo publications page: timeout; no erratum found in primary-source search
- **Review:** confirmed by REV-GeneralizedHeegnerCycles--GH.0. Corollary 4.3 and the recurrence prove eventual equality of ideals, with a unit factor permitted. For example, a nonzero scalar sequence satisfying x_(m+2)=a_p x_(m+1)−p^(k−1)x_m cannot be eventually constant unless a_p−p^(k−1)=1. The lifting argument only needs ideal equality. The corrected locator is §4.4 Claim 2 on p.18, not §5.1 p.19.

<a id="issue-e7"></a>
### GeneralizedHeegnerCycles/E7 — error

*Part GH.0. Source* [castella-hsieh](#src-castella-hsieh), July 2, 2022 author copy §4.4 p.17; same display in author-hosted publisher-formatted Math. Ann. 370 (2018), §4.4 p.593 (castella-hsieh-published).

- **Printed:** Sym^{2r−2} T_p(B)(1−r) ⊗ O_F ≃ Ind_{G_H_K}^{G_K} S^{r−1}(A) ⊗ O_F
- **Correction:** Delete the asserted isomorphism for the literal full symmetric-power carrier. If an induced symmetric-power carrier is intended instead, it must be defined separately with its own character projection and class inclusion; this review does not identify it with the full symmetric power.
- **Reason:** Write h=[H_K:K] and m=2r−2. The rational ranks are binomial(2h+m−1,m) and h(m+1). For h=2,m=2 they are 10 and 6, and for m=0 they are 1 and h. A Tate twist and coefficient extension do not change ranks. Symmetric powers do not commute with induction. The character projection on the literal full Sym can be checked separately and is the requested CM.1 adapter.
- **Affects:** the proof. **Known:** new
- **Searched:** The July 2, 2022 author copy and the author-hosted publisher-formatted print copy, §4.4; Hsieh erratum2.pdf, all three corrections; Castella author-hosted older erratum notice; Primary-source web searches for the Sym/Ind display and Heegner cycles errata; no correction to this display located
- **Review:** confirmed by REV-GeneralizedHeegnerCycles--GH.0. Write h=[H_K:K] and m=2r−2. The rational ranks are binomial(2h+m−1,m) and h(m+1). For h=2,m=2 they are 10 and 6, and for m=0 they are 1 and h. A Tate twist and coefficient extension do not change ranks. Symmetric powers do not commute with induction. The character projection on the literal full Sym can be checked separately and is the requested CM.1 adapter.

<a id="issue-e-gh8-1"></a>
### GeneralizedHeegnerCycles/E-GH8-1 — error

*Part GH.8. Source* [ch-published-2018-gh8](#src-castella-hsieh-published), Published Section 4.4, printed p. 593, display defining S^{r-1}(B); also present in the 2 July 2022 author revision, Section 4.4.

- **Printed:** S^{r-1}(B) := Sym^{2r-2} T_p(B)(1-r) tensor O_F ≃ Ind_{G_H_K}^{G_K} S^{r-1}(A) tensor O_F.
- **Correction:** Do not identify the full ordinary symmetric power with the induced symmetric power. For positive degree the direct sum of the pure symmetric powers of the conjugate Tate modules is the relevant induced submodule; mixed monomials remain in the full symmetric power. In degree zero the full symmetric power is one-dimensional and needs a separate treatment. A repaired CM-character carrier and its maps must be constructed; simply changing the notation does not supply them.
- **Reason:** Put h=[H_K:K] and extend scalars to a characteristic-zero coefficient field. T_p(B) has dimension 2h. At r=1 the left side has dimension 1 and the right side dimension h, so the displayed isomorphism is impossible when h>1. At r=2 their dimensions are h(2h+1) and 3h, again unequal for h>1. Tate twisting and coefficient extension do not change these dimensions. This refutes the display, not automatically all later theorems.
- **Affects:** the proof. **Known:** new
- **Searched:** Published author-hosted journal PDF, Section 4.4 p. 593; 2026-10-06 parsed and rendered read; 2 July 2022 Hsieh author revision, Section 4.4 p. 17, reread 2026-10-06; same full symmetric-power display; Entire author erratum2.pdf reread 2026-10-06; it corrects Section 6/7 and does not correct this display; Castella publication page checked 2026-10-06; no further correction of the display located; Historical checkpoint checked arXiv:1505.08165v2; this version is not freshly acquired or reread; Independent review 2026-10-06: rendered journal p. 593; author revision p. 17; NTU erratum2.pdf and UCSB erratum.pdf; both author publication pages and source-specific searches. Neither erratum addresses the symmetric-power display. No claim to an exhaustive literature search.
- **Review:** confirmed by REV-GeneralizedHeegnerCycles--GH.8. Independently inspected the rendered published p. 593 and the 2022 author p. 17. With h=[H_K:K]>1 the displayed ranks are 1 versus h at r=1, and h(2h+1) versus 3h at r=2. Tate twist and coefficient extension preserve rank. Both author-hosted one-page errata and the authors’ publication pages were checked on 2026-10-06; no correction to this display was located. This confirms the displayed isomorphism is false and leaves the actual carrier repair with GH.0/GH.3; it does not refute every downstream theorem.

<a id="structural-proposals"></a>
## Structural proposals

The GH.0 part proposes six rescopings, each applying a reviewed red-team finding or restructuring, and maps the six integrated checkpoint nodes of the earlier decomposition to their refinements. The GH.8 part records the ownership of the generic main-conjecture comparisons (under GH.8 above) and proposes no restructuring. None of these proposals is applied here; they await the maintainer.

- **Part II of PadicHodgeRegulators**, immediately after L3: integral relative Lubin–Tate and ordinary-family regulators with the KO, CH and Castella statements and Yager's module ([request 11](#req-11)). GH.4, GH.5, GH.7 and GH.2 import it.
- **Part II of SelmerIwasawaCohomology**, extending L4 with Nekovář's corrected family parity theorem ([request 16](#req-16)).
- **EulerSystemsAndKolyvaginSystems ES.5** extended by CH's bounded-error anticyclotomic descent ([request 17](#req-17)), with ES.5 → GH.5 and ES.8 → GH.5 as supplier edges.
- **RS-06 applied**: R14.3 extended to the higher fibre powers ([request 8](#req-8)), with R14.3 → GH.0 and A3 → GH.0 edges once the exports exist. The proposal writes "A.3"; the layer id is A3. RS-06 itself gives the projector to R19.1; see [the ownership question](#kuga-sato-ownership).
- **RT-AREA-iwasawa-1/11 applied**: L3h owns the GL₂ BDP measure, GH.4 owns BDP Theorem 5.13 and CH's cycle identities, GZ.9 imports m = 0; L3h → GZ.9 and GH.4 → GZ.9.

**Restructuring proposals of the GH.0 part** (`restructure`).

| Action | Roadmaps | Detail | Proposal |
|---|---|---|---|
| rescope | GeneralizedHeegnerCycles, ModularCurvesPartII, AbelianSchemesAndArithmeticModuli | Apply reviewed RS-06 ownership: R14.3 supplies the universal family/cohomology/projector carrier and A.3 its relative symmetric-power realization. GH.0 owns only the fixed CM factor, product and cycle-specific coefficients. | Extend R14.3 to the explicitly requested higher fiber-power interface; keep GH.0 at the CM/product boundary. Add R14.3→GH.0 and A.3→GH.0 supplier edges when the exports are available. |
| rescope | EulerSystemsAndKolyvaginSystems, GeneralizedHeegnerCycles, HeegnerPointEulerSystems | RT-iwasawa-1/10 fixes generic Howard ownership at ES.5 and ES.8. The higher-weight application verifies hypotheses and supplies κ; it does not reproduce generic descent. | Keep Howard DVR theory in ES.5 and Λ patching in ES.8. Add ES.5→GH.5 and ES.8→GH.5; keep the distinct bounded-error CH adapter as a requested ES.5 extension. Record HE.6→HE.8 for the point application without editing that owner. |
| rescope | AutomorphicPadicLFunctions, GeneralizedHeegnerCycles, GrossZagierAndArithmeticHeights | RT-iwasawa-1/11 separates one GL₂ square-root distribution owner from its generalized-cycle special value and weight-zero applications. | L3h owns the GL₂ BDP/CH measure and family measure interpolation; GH.4 owns BDP Theorem 5.13 and the CH cycle identities; GZ.9 imports m=0 and owns its quaternionic/exceptional variants. Record L3h→GZ.9 and GH.4→GZ.9, with no duplicated BDP measure. |
| rescope | PadicHodgeRegulators, GeneralizedHeegnerCycles, AutomorphicCongruences | RT-iwasawa-1/27 prefers the local regulator owner for Yager/unramified tower and big exponentials. Current L3 scope is cyclotomic, so this requires a genuine supplier extension. | Create Padic Hodge regulators, Part II: integral relative and ordinary-family regulators, immediately after L3, with the requested KO/CH/Castella statements and Yager module. GH.4/GH.7 import it; AC L2 retains only bounded fixed-weight BK-logarithm conventions. |
| rescope | SelmerIwasawaCohomology, GeneralizedHeegnerCycles | The arithmetic examples scope at L4 does not contain Nekovář family parity. | Extend the Selmer arithmetic-consequence direction as Part II with the corrected self-dual family parity theorem; GH.6 remains its fixed-weight application. |
| rescope | GeneralizedHeegnerCycles | Six integrated source units bundled different constructions and contained an overstrong CM product-model claim. | Refine the integrated GH.0 model unit into generalized-kuga-sato-variety-and-its-projector and cm-product-good-model; GH.1 bundle into cycle/descent/null-homology/AJ nodes and GH.4/bdp-special-value-formula; GH.2 into finite and corrected local conditions; GH.4 into its two fixed-weight formulas; GH.5 into admissibility, hypothesis verification and generic-bound application; GH.6 into four Selmer consequences. Keep the six integrated IDs as aliases to these refinements; the product model is local after base change, not globally over Z[1/N]. |

<a id="refinements"></a>
**Integrated checkpoint ids and their refinements** (`refines`, GH.0 part). The atlas keeps each integrated id as an alias of the nodes that refine it.

| Integrated id | Refined into |
|---|---|
| `GH.0/the-variety-X-r-and-its-smooth-proper-model` | [`GH.0/generalized-kuga-sato-variety-and-its-projector`](#n-gh-0-generalized-kuga-sato-variety-and-its-projector), [`GH.0/cm-product-good-model`](#n-gh-0-cm-product-good-model) |
| `GH.1/generalized-heegner-cycles-and-their-abel-jacobi-images` | [`GH.1/generalized-heegner-cycle`](#n-gh-1-generalized-heegner-cycle), [`GH.1/homological-triviality-of-generalized-heegner-cycles`](#n-gh-1-homological-triviality-of-generalized-heegner-cycles), [`GH.1/etale-abel-jacobi-map`](#n-gh-1-etale-abel-jacobi-map), [`GH.1/p-adic-abel-jacobi-map`](#n-gh-1-p-adic-abel-jacobi-map), [`GH.4/bdp-special-value-formula`](#n-gh-4-bdp-special-value-formula) |
| `GH.2/local-condition-at-p-and-the-castella-hsieh-corrections` | [`GH.2/finite-local-abel-jacobi-class`](#n-gh-2-finite-local-abel-jacobi-class), [`GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`](#n-gh-2-local-condition-at-p-and-the-castella-hsieh-corrections) |
| `GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity` | [`GH.4/ramified-character-abel-jacobi-formula`](#n-gh-4-ramified-character-abel-jacobi-formula), [`GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`](#n-gh-4-castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity) |
| `GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound` | [`GH.5/longo-vigni-admissible-triple`](#n-gh-5-longo-vigni-admissible-triple), [`GH.5/longo-vigni-admissibility-and-the-lambda-adic-bound`](#n-gh-5-longo-vigni-admissibility-and-the-lambda-adic-bound) |
| `GH.6/selmer-consequences-with-the-corrected-dimension-formula` | [`GH.6/selmer-rank-one`](#n-gh-6-selmer-rank-one), [`GH.6/selmer-rank-zero`](#n-gh-6-selmer-rank-zero), [`GH.6/selmer-consequences-with-the-corrected-dimension-formula`](#n-gh-6-selmer-consequences-with-the-corrected-dimension-formula), [`GH.6/selmer-parity`](#n-gh-6-selmer-parity) |

<a id="layer-dependencies"></a>
## Layer dependencies

| Layer | Layers of this roadmap it uses | Other layers it uses |
|---|---|---|
| [GH.0](#layer-gh-0) | — | `ComplexMultiplicationAndExplicitReciprocity:CM.1`, `DerivedDeRhamCohomology:DD.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.6`, `HeegnerPointEulerSystems:HE.1`, `ModularCurvesPartII:R14.3`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.5` |
| [GH.1](#layer-gh-1) | [GH.0](#layer-gh-0) | `ArithmeticGaloisDuality:R02.1`, `ArithmeticGaloisDuality:R02.2`, `AutomorphicPadicLFunctions:L3h`, `ComplexMultiplicationAndExplicitReciprocity:CM.1`, `DerivedDeRhamCohomology:DD.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.3`, `EtaleDualityAndPerverseSheaves:EDC.6`, `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`, `ModularCurvesPartII:R14.3`, `PadicDifferentialEquationsAndRigidCohomology:RD.3`, `PadicDifferentialEquationsAndRigidCohomology:RD.4`, `PadicHodgeRegulators:D.2`, `PadicHodgeRegulators:L1`, `PadicHodgeTheory:R06.2`, `PadicHodgeTheory:R06.5`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.5` |
| [GH.2](#layer-gh-2) | [GH.0](#layer-gh-0), [GH.1](#layer-gh-1) | `ComplexMultiplicationAndExplicitReciprocity:CM.1`, `HeegnerPointEulerSystems:HE.2`, `ModularCurvesPartII:R14.3`, `PadicHodgeRegulators:L3`, `PadicHodgeTheory:R06.5`, `SelmerIwasawaCohomology:L2`, `SelmerIwasawaCohomology:L4` |
| [GH.3](#layer-gh-3) | [GH.1](#layer-gh-1), [GH.2](#layer-gh-2) | `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.2`, `SelmerIwasawaCohomology:L3`, `SelmerIwasawaCohomology:L4` |
| [GH.4](#layer-gh-4) | [GH.0](#layer-gh-0), [GH.1](#layer-gh-1), [GH.3](#layer-gh-3) | `AutomorphicPadicLFunctions:L3h`, `PadicHodgeRegulators:L3` |
| [GH.5](#layer-gh-5) | [GH.0](#layer-gh-0), [GH.2](#layer-gh-2), [GH.3](#layer-gh-3) | `ArithmeticGaloisDuality:R02.2`, `AutomorphicGaloisRepresentations:R19.1`, `EulerSystemsAndKolyvaginSystems:ES.3`, `EulerSystemsAndKolyvaginSystems:ES.5`, `EulerSystemsAndKolyvaginSystems:ES.8`, `HeegnerPointEulerSystems:HE.0`, `PadicHodgeRegulators:L3`, `SelmerIwasawaCohomology:L2`, `SelmerIwasawaCohomology:L4` |
| [GH.6](#layer-gh-6) | [GH.2](#layer-gh-2), [GH.3](#layer-gh-3), [GH.4](#layer-gh-4), [GH.5](#layer-gh-5) | `AutomorphicPadicLFunctions:L3h`, `EulerSystemsAndKolyvaginSystems:ES.5`, `HeegnerPointEulerSystems:HE.0`, `SelmerIwasawaCohomology:L2`, `SelmerIwasawaCohomology:L3`, `SelmerIwasawaCohomology:L4` |
| [GH.7](#layer-gh-7) | [GH.0](#layer-gh-0), [GH.1](#layer-gh-1), [GH.3](#layer-gh-3), [GH.4](#layer-gh-4), [GH.6](#layer-gh-6) | `AutomorphicGaloisRepresentations:R19.6`, `AutomorphicPadicLFunctions:L3h`, `ComplexMultiplicationAndExplicitReciprocity:CM.1`, `HeegnerPointEulerSystems:HE.1`, `ModularCurvesPartII:R14.3`, `PadicFamilies:L0`, `PadicHodgeRegulators:L3`, `SelmerIwasawaCohomology:L2`, `SelmerIwasawaCohomology:L3` |
| [GH.8](#layer-gh-8) | [GH.0](#layer-gh-0), [GH.1](#layer-gh-1), [GH.2](#layer-gh-2), [GH.3](#layer-gh-3), [GH.4](#layer-gh-4), [GH.5](#layer-gh-5), [GH.6](#layer-gh-6), [GH.7](#layer-gh-7) | `HeegnerPointEulerSystems:HE.0`, `HeegnerPointEulerSystems:HE.1`, `HeegnerPointEulerSystems:HE.2`, `HeegnerPointEulerSystems:HE.3`, `HeegnerPointEulerSystems:HE.8`, `PadicHodgeRegulators:L1` |

<a id="notes-for-the-maintainer"></a>
## Notes for the maintainer

- **Review state.** The GH.8 packet is accepted; the GH.0 packet is *needs changes*. Its review's reader objection is answered by this document, which is generated from the corrected packet; its five interface and test objections ([G18](#gap-18)) remain for a revision of the GH.0 part, which would edit that packet and the joined suggested file.
- **Kuga–Sato ownership.** The variety W_m has no owner, and GH.0, R19.1 and R34.5 request it from each other or from R14.3, whose packet does not plan it ([the ownership question](#kuga-sato-ownership)). This needs a restructuring decision; until then GH.0's request 8 stands.
- **Elaboration.** The joined suggested file imports `TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny`, which the shared Lean build lacks, so neither the GH.0 author nor its review could elaborate the whole GH.0 body (the author checked the Mathlib-only portion). A scratch copy with the eight pinned Tau Ceti modules inlined in place of that import elaborates at Mathlib 082e2d3 with no errors and only `sorry` warnings (266: 221 from GH.0, 45 from GH.8). This is a harness check, not a compilation of the file itself.
- **Packet fixes for a job that owns the packets**, none of which changes a statement: replace the 28 layer citations of the GH.8 packet by the node ids of the [cross-part table](#cross-part-prerequisites); merge E-GH8-1 into E7; apply the r → m notation of [Conventions](#conventions) to the seven GH.0 nodes and the ASCII → Unicode notation to the GH.8 packet, including its planet names; give the GH.8 suggested names a namespace under `TauCeti.GeneralizedHeegner`. The handoff note `research/blueprint/handoff/ASM-GeneralizedHeegnerCycles.md` lists them exactly.
