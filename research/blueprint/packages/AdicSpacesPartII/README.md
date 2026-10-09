# Roadmap: foundations of adic spaces, Part II — analytic and formal geometry

This roadmap continues the Tau Ceti roadmap **Foundations of adic spaces** (`AdicSpaces`, called *the
anchor* below). The anchor builds Huber rings and pairs, the valuation and adic spectra, rational
localisation, the structure presheaf, sheafiness for strongly noetherian and stably uniform Tate rings,
and the category of adic spaces with open and closed immersions, morphisms locally of finite type and
gluing. It stops before fibre products and says that separatedness, properness and the diagonal
belong "together with completed tensor products and fibre products in a separate roadmap". This is
that roadmap. It develops the analytic and formal geometry that p-adic Hodge theory, the étale
cohomology of rigid spaces, overconvergent automorphic forms and p-adic Shimura varieties use:

- **completed tensor products** of Huber pairs (topology, plus ring, universal property,
  uniformisation) and **fibre products** of adic spaces under Huber's noetherian hypotheses;
- the **morphism theory**: adic morphisms, the finite-type classes, separated, proper and partially
  proper morphisms with their valuative criteria, finite and quasi-finite morphisms, continuous
  differentials, unramified, smooth and étale morphisms, the Jacobian criterion and standard étale
  presentations;
- the **classical affinoid algebras** and **analytification** of schemes locally of finite type over
  a nonarchimedean field, Tate's rigid-analytic spaces and Huber's rigid–adic comparison, analytic
  groups and invariant differentials;
- **noetherian formal geometry**: Spf, formal schemes, completion, coherent formal modules, the
  theorem on formal functions, Grothendieck's existence and algebraisation theorems;
- **formal models**: admissible formal schemes over an arbitrary complete rank-one valuation ring,
  admissible blow-ups, flattening, Raynaud's theorem, generic fibres, the good-reduction locus,
  residue discs and Hasse domains with fractional valuation bounds;
- **coherent sheaves**: the sheaf of a finite module, Tate acyclicity for finite modules and for
  every sheafy Tate pair, Kiehl's theorems on affinoid and quasi-Stein spaces, vector bundles on
  sheafy affinoids, the proper mapping theorem, base change, proper GAGA, and **traces** along finite
  locally free morphisms with pull–identify–trace on correspondences;
- the **étale and pro-étale sites** of AdicEtaleGeometry A1 on these carriers, smooth pairs and
  boundary complements;
- **sousperfectoid** rings and spaces, products of perfectoid spaces with smooth rigid spaces, and
  the coefficient algebras and sheaves of p-adic families;
- **dagger geometry**: overconvergent Tate algebras, dagger algebras, Monsky–Washnitzer weak
  completions, dagger spaces, strict neighbourhoods, the comparison with rigid spaces, and the
  overconvergent, logarithmic and compactly supported de Rham complexes.

The morphism theory is built once, here, for the whole area; AdicEtaleGeometry, PerfectoidSpaces,
DiamondsAndVStacks and the Shimura-variety roadmaps import it.

| Layer | Title | What it builds |
|---|---|---|
| R0 | Morphisms and admissible affinoid products | affinoid algebras, completed tensor products, fibre products, the morphism classes, differentials, smooth and étale morphisms |
| R1 | Analytification and algebraic correspondences | X ↦ X^ad, rigid spaces and affinoid subdomains, the rigid–adic comparison, analytic groups |
| F0 | Formal geometry | Spf and formal schemes, completion, coherent formal modules, formal functions, existence and algebraisation |
| R2 | Formal schemes, generic fibres and Hasse domains | admissible formal schemes, blow-ups, Raynaud's theorem, generic fibres, good reduction, Hasse domains |
| R3 | Coherent sheaves and finite traces | M̃, Tate and Kiehl, vector bundles, the proper mapping theorem, GAGA, traces |
| R4 | Étale and pro-étale sites | A1's sites on these carriers, functoriality, smooth pairs, boundary complements |
| R5 | Families and sousperfectoid spaces | sousperfectoid rings and spaces, perfectoid × smooth, coefficient algebras and sheaves |
| F1 | Dagger geometry and overconvergent de Rham complexes | dagger algebras and spaces, strict neighbourhoods, de Rham complexes |

```text
anchor Layers 0–5 → R0 → R1 → R2 → R3 → R5
F0 → R0,  F0 → R2,  F0 → R3
R0, R1, AdicEtaleGeometry A1 → R4
R0–R4 → F1
AdicEtaleGeometry A1, PerfectoidSpaces P1–P3 → R5
```

F0 depends on nothing in this roadmap and precedes R0 (Huber's sheafiness theorem for rings with a
noetherian ring of definition uses F0's Artin–Rees input) and R2.

## Prerequisites and boundaries

- **The anchor** (Tau Ceti roadmap `AdicSpaces`), Layers 0–5. Of it, Tau Ceti already contains: Huber
  rings and pairs, pairs of definition, completion, weighted restricted power series with their
  universal property, strong noetherianness, topologically-finite-type maps (`Huber.IsTopologicallyFiniteType`),
  rational localisation, `Spa` and rational subsets, the analytic locus `spaAnalytic`, the quotient pair
  `Huber.Pair.quotient` with the closed embedding `Spa(A/J) → Spa(A, A⁺)` onto `V(J)`
  (`isClosedEmbedding_spaComap_quotientMk`), uniform and stably uniform rings (`Huber.IsUniform`,
  `Huber.IsStablyUniform`), ring-level and pair-level sheafiness (`Huber.IsSheafyRing`,
  `Huber.IsStablySheafyRing`, `Huber.IsSheafyForEveryPresentation` — the anchor's `IsSheafyPair`),
  sheafiness of strongly noetherian Tate rings (`isSheafyRing_of_isStronglyNoetherian`, Wedhorn 8.28(b)),
  exactness of the two-piece Laurent cover of a strongly noetherian Tate ring (`laurentCover_exact`),
  strictness of linear maps of finite modules over complete noetherian Tate rings
  (`isStrictMap_of_module_finite`), `M ⊗_A A⟨T⟩ ≅ M⟨T⟩` (`restrictedMvPowerSeriesBaseChange`), the
  Gauss norm on `K⟨X⟩` and Gauss points of polydiscs, the gluing of valuations along directed unions
  (`ValuationSpectrum.ofDirected`), pre-adic spaces with their morphisms, open immersions
  (`PreAdicSpace.IsOpenImmersion`) and the category `TauCeti.AdicSpace` of adic spaces, and the
  augmented Čech complex criterion `quasiIso_cechAugmentation_iff`. None of this is re-planned: the
  targets below cite these declarations, and the R0 and R3 targets on rings with a noetherian ring of
  definition are the non-Tate case that the library's Tate-ring theorems do not cover.
  Still owned by the anchor and cited, not planned here: strong noetherianness of complete rank-one
  fields and of `K⟨X₁,…,Xₙ⟩` (anchor §0.5), closed immersions defined affinoid-locally by closed ideals
  (anchor §5.1), morphisms locally of finite type (anchor §5.2), gluing (§5.3), the closed and open
  discs (§5.4), Tate acyclicity in all degrees and Corollary 8.35 for strongly noetherian Tate rings
  (§4.1) and the Buzzard–Verberkmoes theorem (§4.2).
- **AdicEtaleGeometry A1** owns the étale and pro-étale sites with the corrected covering convention,
  geometric points, and the local description of étale and finite étale morphisms. R4 builds no
  second site. **PerfectoidSpaces P1–P3** own perfectoid Tate rings, their rational localisations and
  fibre products, tilting and almost purity; **DiamondsAndVStacks D0** owns Cartan's criterion and the
  Čech-to-derived comparison on a basis. These three roadmaps form one bundle with this one.
- **SchemeAndStackFoundations SF.2** (Godement resolutions and flasque sheaves) and the Tau Ceti
  roadmaps **StableReduction** Layers 0 and 2 (Fitting ideals; coherence of higher direct images along
  proper morphisms of locally noetherian schemes), **JacobianChallenge** Layers B and C (acyclicity of
  affines, Čech-to-derived on separated schemes, flat base change of higher direct images) and
  **ModularCurves** 0e (effective faithfully flat descent of modules) are cited for F0 and R3.
- Notions that this roadmap needs from roadmaps it may not cite (projective bundles, ample sheaves,
  Serre finiteness and vanishing, Chow's lemma, the Deligne–Rapoport moduli of generalised elliptic
  curves, the Gel'fand spectrum of a Banach ring, the affinoid criterion for tilde-limits, de Jong's
  strictly semistable alteration) are stated as targets of this roadmap, at the end of the layer that
  uses them, under the heading "Notions this roadmap states for its own use".
- Not in scope: derived étale cohomology of the sites (ClassicalAdicEtaleCohomology H0), the
  specialisation morphism and nearby cycles (ClassicalAdicEtaleCohomology H1), rigid cohomology, frames,
  tubes of frames, Robba rings and Frobenius structures (PadicDifferentialEquationsAndRigidCohomology
  RD.0–RD.6), the ordinary-locus boundary cohomology formed from F1's complexes
  (AutomorphicGaloisRepresentationsPartII AG2.4), bounded-height Grassmannians over deformation rings
  (LocalGaloisDeformationRings L7), continuous torsor descent with coefficients (PerfectoidSpaces P9),
  and the adic Fargues–Fontaine curve (anchor Layer 6).
- **Consumers.** PerfectoidSpaces P2–P9, AdicEtaleGeometry A0–A4, DiamondsAndVStacks D2–D6, the
  étale-cohomology, Hodge–Tate, overconvergent-forms, Shimura-variety, Néron-model, deformation-ring
  and formal-moduli roadmaps, and the dagger and rigid-cohomology roadmaps, each importing the layers
  named in its own document.

## Conventions

1. **Huber pairs** are Tau Ceti's `Huber.Pair A`: the plus ring is explicit data. Morphisms are
   `Huber.Pair.Hom` (continuous, carrying `A⁺` into `B⁺`). Pairs of definition are `Huber.PairOfDefinition`.
2. **Complete includes Hausdorff**, as in the anchor; every statement about complete rings, modules
   or pairs carries both.
3. **Adic spaces** are the objects of the anchor's category (`TauCeti.AdicSpace`): locally `Spa(A, A⁺)`
   for sheafy complete Huber pairs. A point is *analytic* if it has an open neighbourhood whose ring of
   sections has a topologically nilpotent unit. A Huber ring is *of noetherian type* if it has a
   noetherian ring of definition or is a strongly noetherian Tate ring; an adic space is *locally
   noetherian* if it is locally `Spa` of such a ring.
4. **The base field.** `K` is complete for a nontrivial rank-one nonarchimedean absolute value,
   `O_K = K°`, `ϖ` a pseudouniformiser, `Spa K = Spa(K, K°)`. `O_K` is noetherian exactly when `K` is
   discretely valued; no statement assumes this unless it says so.
5. **Completed tensor products** `B ⊗̂_A C` are formed only along adic structure maps, with the
   topology from rings and ideals of definition, plus ring the integral closure of the image of
   `B⁺ ⊗_{A⁺} C⁺`, then completion. They are neither uniform nor sheafy in general; every fibre product
   carries its own existence and sheafiness hypotheses.
6. **Fibre products** are taken in the anchor's category and exist under Huber's hypotheses (R0); the
   map from `|X ×_Z Y|` to the fibre product of the underlying sets is surjective, not injective.
7. **Formal schemes** (F0) are locally `Spf A` for `A` complete and separated for an adic topology with
   a finitely generated ideal of definition. Admissible formal `O_K`-schemes (R2) are topologically
   finitely presented and `ϖ`-torsion-free, and are not noetherian unless `K` is discretely valued.
8. **Rigid spaces** are Tate's (R1). `X^an` is the rigid and `X^ad` the adic analytification; they are
   identified only through Huber's functor `r_K`.
9. **Valuation bounds.** `|f| ≤ |g|^{a/b}` means `v(f^b) ≤ v(g^a)`; no root of `g` in the base field is
   assumed. Tubes and strict Hasse loci are interiors of preimages under specialisation (R2).
10. **Coherent and locally free.** Coherent sheaves are defined on locally noetherian adic spaces only;
    vector bundles on every adic space, corresponding to finite projective modules on sheafy Tate
    affinoids.
11. **Traces.** The trace of an endomorphism of a finite projective module is `LinearMap.projectiveTrace`
    (R3), through `dualTensorHomEquiv`; Mathlib's `LinearMap.trace` and `Algebra.trace` are used only for
    free modules. A trace is never defined as a sum over geometric points.
12. **Names.** Ring-level declarations live in `Huber`, adic-space geometry in `AdicSpace`, formal
    schemes in `FormalScheme`, dagger algebras in `Dagger` and dagger spaces in `DaggerSpace`.

**How the targets are written.** Each layer lists its targets in dependency order, numbered `R0.1`,
`R0.2`, …; each is a definition, construction, theorem, comparison or lemma. A definition or construction
states the object, then its *API* (the lemmas it needs, named relative to the declaration) and its
*Tests* (examples a wrong definition would fail); a theorem states its hypotheses; every target names its
*Source* (short keys are resolved in the Sources section at the end, with the locator as "§, result,
page") and what it *Needs*: earlier targets of this roadmap, layers of other roadmaps, or the library
(Mathlib and Tau Ceti declarations named in the target text). Lemmas are intermediate steps; their
statements are in `Suggested.lean` where they can be typed.


<a id="r0"></a>

## R0. Morphisms and admissible affinoid products

**R0. Morphisms and admissible affinoid products.** Depends on the anchor and F0. Three parts: (a) ring-level inputs — rings of noetherian type, adic homomorphisms, Huber's sheafiness theorem for rings with a noetherian ring of definition (Case I of Huber 1994 Theorem 2.2, whose Tate-ring case is the library's), the completed tensor product with its universal property, uniformisation and the uniform completed tensor product, completed tensor products of Banach modules, then adic morphisms, the finite-type hierarchy, locally noetherian spaces, fibre products, closed subspaces and the diagonal; (b) separated, universally closed, proper and partially proper morphisms with the valuative criteria, finite and quasi-finite morphisms; (c) continuous differentials, flat, unramified, smooth and étale morphisms, the local structure theorems and étale affinoid morphisms over a field. Classical `K`-affinoid algebras (Noether normalisation, residue fields, the supremum seminorm, integrality of `A°`, reductions) open the layer. Where a target below specialises to Tate rings, the library's theorem is cited in its text and the target is the non-Tate case.


### Ring-level inputs

**R0.1 Huber rings of noetherian type (Huber's noetherian hypothesis)** (definition `Huber.IsNoetherianType`). A is *of noetherian type* if (i) A admits a pair of definition (A₀ … *API* (on `Huber`): `IsNoetherianType, isNoetherianType_iff, IsNoetherianType.of_pairOfDefinition, IsNoetherianType.of_isStronglyNoetherian` (+8). *Tests:* `isNoetherianType_discrete_polynomial, isNoetherianType_padicPowerSeries, not_isNoetherianType_perfectoidDisc` (+3). *Source:* Huber94 §3, Prop. 3.7, p. 535. *Needs:* R0.2.

- **R0.2** A noetherian ring of definition stays noetherian under completion. *Source:* EGA I Ch. 0, §7.3, (7.3.1).

**R0.3 Adic homomorphisms of Huber rings** (definition `Huber.IsAdicHom`). A ring homomorphism φ : A → B is *adic* if there exist a pair of definition (A₀ … *API* (on `Huber`): `IsAdicHom, IsAdicHom.continuous, IsAdicHom.comp, IsAdicHom.of_comp` (+8). *Tests:* `isAdicHom_padicInt_padic, not_isAdicHom_padicInt_powerSeries, isAdicHom_of_discrete_iff` (+2). *Source:* Huber94 §3, par. before the Def. of adic morphisms, p. 532.

- **R0.4** Topologically-finite-type homomorphisms are adic. *Source:* Huber94 §3, Lem. 3.3(ii), condition (b).

- **R0.5** Rings topologically of finite type over a ring of noetherian type are of noetherian type. *Source:* Huber94 §3, Cor. 3.4(iii).

- **R0.6** Ideals of complete rings of noetherian type are closed. *Source:* Huber94 §2, Lem. 2.3(ii).

### Sheafiness of rings of noetherian type (Huber 1994 Theorem 2.2)

- **R0.7** Exactness of the extended Čech complex of localisations. *Source:* Stacks Tag 01X9, Lem. 30.2.1.

- **R0.8** Completion of a strict exact complex is strict exact. *Source:* Huber94 §2, proof of (1.3).

- **R0.9** Linear maps of finite modules over a Huber ring with a noetherian ring of definition are strict (Huber Lemma 2.3(i)). *Source:* Huber94 §2, Lem. 2.3.

- **R0.10** Finite modules over a complete Huber ring with a noetherian ring of definition are complete, with closed submodules (Huber Lemma 2.3(ii)). *Source:* Huber94 §2, Lem. 2.3.

- **R0.11** Completion of a finite module over a Huber ring with a noetherian ring of definition is base change to Â (Huber Lemma 2.3(iii)). *Source:* Huber94 §2, Lem. 2.3.

- **R0.12** Spec of a Huber ring and of an open subring agree away from the open primes (Huber 1993 Lemma 3.7). *Source:* Huber93 §3, Lem. 3.7.

**R0.13 The blow-up scheme Proj(⊕ Jⁿ) of a finitely generated submodule (Huber 1994 (1.1)–(1.2))** (construction `AlgebraicGeometry.submoduleBlowup`). Let R(J) := ⊕_{n≥0} Jⁿ·Tⁿ ⊆ B[T] (J⁰ := φ(C); for n ≥ 1 … *API* (on `AlgebraicGeometry`): `submoduleBlowup, submoduleBlowup.gradedRing, submoduleBlowup.toSpec, submoduleBlowup.fromSpec` (+8). *Tests:* `submoduleBlowup_test_unit, submoduleBlowup_test_padicLaurent, submoduleBlowup_reesAlgebra_compat` (+2). *Source:* Huber94 §2, proof of Thm 2.5, Case I, (1.1), p. 526.

- **R0.14** The submodule blow-up is an isomorphism away from the centre (Huber 1994 (1.2)(iii)). *Source:* Huber94 §2, (1.2)(iii).

- **R0.15** Deep Čech cocycles are coboundaries from a fixed level (Huber 1994 (1.3.1)(i)). *Source:* Huber94 §2, (1.3.1)(i).

- **R0.16** The Čech complexes of Iⁱ𝒢 form a neighbourhood basis in the natural topology (Huber 1994 (1.3.1)(ii)). *Source:* Huber94 §2, (1.3.1)(ii).

- **R0.17** Strict Čech exactness for standard rational coverings when B has a noetherian ring of definition (Huber 1994 (1.3)). *Source:* Huber94 §2, proof of Thm 2.5, Case I.

**R0.18 Huber pairs with a noetherian ring of definition are sheafy (Huber 1994 Theorem 2.2, Case I)** (theorem). Then: (a) for every rational subset U ⊆ X the complete ring 𝒪_X(U) has a noetherian ring of definition … Tau Ceti's `isSheafyRing_of_isStronglyNoetherian` is Case II (strongly noetherian Tate rings); this target is Case I. *Hypotheses:* A complete Hausdorff Huber ring with a noetherian ring of de … *Source:* Huber94 §2, Thm 2.2, p. 524. *Needs:* R0.17, R0.10, R0.2.

- **R0.19** Discrete Huber pairs are sheafy with Čech-acyclic rational coverings (Wedhorn Theorem 8.28(c)). *Source:* Wedhorn §8.2, Thm 8.28.

- **R0.20** Complete rings of noetherian type are stably sheafy. *Source:* Huber94 §2, Thm 2.2.

### The completed tensor product

**R0.21 The completed tensor product of Huber pairs along adic homomorphisms** (construction `Huber.Pair.completedTensor`). Let E := B ⊗_A C (Mathlib `Algebra.TensorProduct` … Then E is a Huber ring with pair of definition (F, I·F) … *API* (on `Huber.Pair`): `completedTensor, completedTensor.inl, completedTensor.inr, completedTensor.inl_comp` (+13). *Tests:* `completedTensor_test_polydisc, completedTensor_test_plus_not_image, completedTensor_test_not_adic` (+3). *Source:* Huber94 §3, proof of Lem. 3.9(i), p. 537. *Needs:* R0.3, R0.125.

**R0.22 Universal property of the completed tensor product** (theorem). Let f : (A, A⁺) → (B, B⁺) and g : (A, A⁺) → (C, C⁺) be morphisms of Huber pairs with adic underlying ring homomorphisms, and let D = B ⊗̂_A C with inl … *Hypotheses:* f, g morphisms of Huber pairs whose underlying ring homomorp … *Source:* Huber94 §3, proof of Prop. 3.7, p. 536. *Needs:* R0.21, R0.3, R0.125.

- **R0.23** Base change of weighted restricted power series and of their quotients. *Source:* Huber94 §3, proof of Prop. 3.7.

- **R0.24** Completed base change along a topologically-finite-type map preserves noetherian type and sheafiness. *Source:* Huber94 §3, proof of Prop. 3.7.

- **R0.25** Rational localisation commutes with completed tensor products. *Source:* KL15 §2.4, after Def. 2.4.12.

### The spectral seminorm, uniformization and the uniform completed tensor product

**R0.26 The norm of a Tate ring attached to a ring of definition, a pseudouniformiser and a radius** (definition `Huber.TateNormDatum`). A *norm datum* d = (A₀, ϖ … Then α_d is a nonarchimedean ring seminorm (Mathlib `RingSeminorm A` with `IsNonarchime … *API* (on `Huber`): `TateNormDatum, tateNorm, tateNorm_apply, isNonarchimedean_tateNorm` (+8). *Tests:* `tateNorm_padic, tateNorm_not_multiplicative, tateNorm_zero_ring` (+2). *Source:* KL15 §2.4, Rem. 2.4.4, p. 39.

**R0.27 The spectral seminorm of a Tate ring** (definition `Huber.spectralSeminorm`). The *spectral seminorm* of (A, d) is |x|_sp := lim_{n→∞} α_d(xⁿ)^{1/n} = inf_{n≥1} α_d(xⁿ)^{1/n} (Kedlaya–Liu Defin … *API* (on `Huber`): `spectralSeminorm, spectralSeminorm_apply, spectralSeminorm_eq_smoothingSeminorm, isPowMul_spectralSeminorm` (+9). *Tests:* `spectralSeminorm_tateAlgebra, spectralSeminorm_dualNumbers, spectralSeminorm_eq_spectralNorm` (+2). *Source:* KL15 §2.1, Def. 2.1.9, p. 27. *Needs:* R0.26, R0.3.

**R0.28 The spectral topology of a Tate ring** (definition `Huber.SpectralTop`). The *spectral topology* on A is the topology define … Then: (i) the identity A → A_sp is continuous … *API* (on `Huber`): `SpectralTop, SpectralTop.hasBasis_nhds_zero, SpectralTop.nhds_zero_eq_seminorm, SpectralTop.continuous_toSpectralTop` (+8). *Tests:* `spectralTop_uniform_tateAlgebra, spectralTop_dualNumbers, spectralTop_weightedSeries` (+1). *Source:* KL15 §2.3, Rem. 2.3.11(c), p. 36. *Needs:* R0.27, R0.26, R0.3.

- **R0.29** The spectral topology has the same continuous valuations, adic spectrum and rational subsets. *Source:* KL15 §2.8, Def. 2.8.13.

**R0.30 The uniformization of a Tate Huber pair** (construction `Huber.Pair.uniformization`). Its *uniformization* is the Huber pair (A^u, A^{u+}) where A^u is the Hausdorff completion of A_sp = `Huber.Spectra … *API* (on `Huber.Pair`): `uniformization, toUniformization, uniformization.isTateRing, uniformization.isBounded_powerBoundedSubring` (+10). *Tests:* `uniformization_dualNumbers, uniformization_weightedSeries, uniformization_tateAlgebra` (+2). *Source:* KL15 §2.8, Def. 2.8.13, p. 63. *Needs:* R0.28, R0.29, R0.27, R0.3.

**R0.31 The uniform completed tensor product of Tate Huber pairs** (construction `Huber.Pair.uniformCompletedTensor`). The *uniform completed tensor product* is B ⊗̂ᵘ_A C := (B ⊗̂_A C)^u … *API* (on `Huber.Pair`): `uniformCompletedTensor, uniformCompletedTensor.inl, uniformCompletedTensor.inr, uniformCompletedTensor.inl_comp` (+9). *Tests:* `uniformCompletedTensor_polydisc, uniformCompletedTensor_Cp, uniformCompletedTensor_unit` (+2). *Source:* KL15 §2.8, Rem. 2.8.5, p. 60. *Needs:* R0.21, R0.22, R0.30, R0.3.

### Completed tensor products of Banach modules

**R0.32 Completed tensor products of Banach modules over complete Tate rings** (construction `Huber.IsBanachModule`). Let A be a complete Tate ring (Tau Ceti IsTateRing, … Then for every Banach L-module E, E ⊗̂_L V ≅ c₀(I, E) … *API* (on `Huber`): `IsBanachModule, BanachModule.CompletedTensor, BanachModule.CompletedTensor.tmul, BanachModule.CompletedTensor.lift` (+13). *Tests:* `banachCompletedTensor_test_tateAlgebra, banachCompletedTensor_test_notAlgebraic, banachCompletedTensor_test_unit` (+2). *Source:* KL15 §2.1, Def. 2.1.10, p. 27. *Needs:* R0.26, R0.21.

### Adic morphisms, finiteness classes, locally noetherian spaces

**R0.33 Adic morphisms of adic spaces** (definition `AdicSpace.IsAdic`). A morphism f : X → Y of adic spaces (the anchor's category … *API* (on `AdicSpace`): `IsAdic, isAdic_iff_image_analytic, IsAdic.isAdicHom_app, image_nonanalytic_subset` (+7). *Tests:* `isAdic_test_disc, not_isAdic_test_powerSeries, isAdic_of_isAnalytic_test` (+2). *Source:* Huber94 §3, Def. of adic morphisms, p. 532. *Needs:* R0.3.

- **R0.34** A morphism is adic exactly when it preserves analytic points. *Source:* Huber94 §3, Prop. 3.2(ii).

**R0.35 Morphisms locally of weakly finite type and the finite-type hierarchy** (definition `AdicSpace.LocallyOfWeaklyFiniteType`). A morphism f : X → Y of adic spaces is *locally of weakly finite type* if every x ∈ X has an open affinoid neighbou … Morphisms locally of finite type are the anchor's §5.2; this target adds the weakly and +weakly finite type classes and their relations. *API* (on `AdicSpace`): `LocallyOfWeaklyFiniteType, IsWeaklyFiniteType, LocallyOfWeaklyFiniteType.isAdic, LocallyOfFiniteType.locallyOfWeaklyFiniteType` (+7). *Tests:* `locallyOfFiniteType_test_disc, plusWeaklyFiniteType_not_finiteType_test, locallyOfWeaklyFiniteType_discrete_iff` (+2). *Source:* Huber96 §1.2, Def. 1.2.1 and the following remarks, pp. 45-47. *Needs:* R0.4, R0.33.

**R0.36 Morphisms locally of +weakly finite type** (definition `AdicSpace.LocallyOfPlusWeaklyFiniteType`). A morphism f : X → Y of adic spaces is *locally of +weakly finite type* if every x ∈ X has an open affinoid neighbo … *API* (on `AdicSpace`): `LocallyOfPlusWeaklyFiniteType, IsPlusWeaklyFiniteType, LocallyOfFiniteType.locallyOfPlusWeaklyFiniteType, LocallyOfPlusWeaklyFiniteType.locallyOfWeaklyFiniteType` (+4). *Tests:* `plusWeaklyFiniteType_test_disc, plusWeaklyFiniteType_not_finiteType, plusWeaklyFiniteType_iff_finiteType_over_field` (+1). *Source:* Huber96 §1.2, Def. 1.2.1(ii), p. 46 (page image of a full copy of the book). *Needs:* R0.35.

**R0.37 Morphisms locally of finite presentation** (definition `AdicSpace.LocallyOfFinitePresentation`). A morphism f : X → Y of adic spaces is *locally of finite presentation* if every x ∈ X has an open affinoid neighbo … *API* (on `AdicSpace`): `LocallyOfFinitePresentation, LocallyOfFinitePresentation.locallyOfFiniteType, locallyOfFinitePresentation_iff_of_isAnalytic, locallyOfFinitePresentation_iff_of_discrete_noetherian` (+5). *Tests:* `locallyOfFinitePresentation_test_hypersurface, locallyOfFinitePresentation_discrete_iff, locallyOfFiniteType_not_finitePresentation_discrete` (+3). *Source:* Huber96 §1.2, Def. 1.2.1(v), p. 46 (page image of a full copy of the book). *Needs:* R0.35, R0.34.

**R0.38 Locally noetherian adic spaces (Huber's noetherian hypothesis)** (definition `AdicSpace.IsLocallyNoetherian`). An adic space X (the anchor's category, Layer 5) is *locally noetherian* if every x ∈ X has an open affinoid neighb … *API* (on `AdicSpace`): `IsLocallyNoetherian, IsLocallyNoetherian.exists_affinoid, IsLocallyNoetherian.spa, IsLocallyNoetherian.affinoid_basis` (+6). *Tests:* `isLocallyNoetherian_test_disc, isLocallyNoetherian_test_formal, not_isLocallyNoetherian_test_perfectoid` (+2). *Source:* Huber94 §3, Prop. 3.7, p. 535. *Needs:* R0.1, R0.5.

### Fibre products

- **R0.39** Valuations agreeing on a common subring extend jointly to the tensor product. *Source:* Huber94 §3, proof of Lem. 3.9(i).

**R0.40 Spa of a sheafy completed tensor product is the fibre product** (theorem). Let f : (A, A⁺) → (B, B⁺) and g : (A, A⁺) → (C, C⁺) be morphisms of complete Hausdorff Huber pairs with adic ring homomorphisms, such that Spa A, Spa B … *Hypotheses:* f, g morphisms of complete Hausdorff Huber pairs with adic r … *Source:* Huber94 §3, proof of Prop. 3.7, p. 536. *Needs:* R0.21, R0.22.

- **R0.41** Fibre products along a finite-type morphism over an arbitrary affinoid base change. *Source:* Huber96 §1.2, proof of Prop. 1.2.2, part 2).

**R0.42 Existence of fibre products of adic spaces** (theorem). Then the fibre product X ×_S Y exists in the category of adic spaces (Mathlib `CategoryTheory.Limits.HasPullback f g` for that category). *Hypotheses:* f : X → S, g : Y → S morphisms of adic spaces. *Source:* Huber94 §3, Prop. 3.7, p. 535. *Needs:* R0.40, R0.41, R0.23, R0.4, R0.34, R0.35, R0.33, R0.5, R0.20, R0.38, R0.21, R0.25.

- **R0.43** Points of a fibre product surject onto compatible pairs, not injectively. *Source:* Huber94 §3, Lem. 3.9(i).

- **R0.44** Stability of adicness and of the finite-type classes under base change. *Source:* Wedhorn §8.6, Rem. 8.57.

### Closed subspaces and the diagonal

**R0.45 Closed adic subspaces cut out by ideal sheaves; closed, open and locally closed embeddings** (definition `AdicSpace.closedSubspace`). (1) Affinoid model: for a complete Hausdorff sheafy Huber pair (A, A⁺) and a closed ideal J ⊆ A with A/J sheafy … The affinoid model is the anchor's §5.1 and Tau Ceti's `Huber.Pair.quotient` with `isClosedEmbedding_spaComap_quotientMk`; this target adds the ideal-sheaf form on an arbitrary adic space, open and locally closed embeddings. *API* (on `AdicSpace`): `closedSubspace, closedSubspace.ι, closedSubspace.range_ι, closedSubspace.affinoidIso` (+9). *Tests:* `closedSubspace_test_origin, closedSubspace_test_nonreduced, closedSubspace_test_not_closed_ideal` (+2). *Source:* Huber96 §1.4, (1.4.1), p. 60. *Needs:* R0.6, R0.20, R0.23.

- **R0.46** The diagonal of a morphism locally of weakly finite type is a locally closed embedding. *Source:* Zavyalov-Q Appendix B.7, Lem. B.7.3 and its proof.

### Separated, universally closed, proper and partially proper morphisms

### Closure properties of separated, universally closed and proper morphisms

- **R0.47** Closed embeddings are proper. *Source:* Stacks Tag 01W5 (Morphisms, Lem. 29.42.6).

### Finite morphisms

### Quasi-finite morphisms

### Continuous differentials

### Flat, unramified, smooth and étale morphisms

- **R0.48** Base change of unramified, smooth and étale morphisms. *Source:* Huber96 §1.6, Def. 1.6.5.

### Local structure

### Étale affinoid morphisms over a field

- **R0.49** Noether normalisation for K-affinoid algebras. *Source:* KL15 §2.5, Lem. 2.5.4.

- **R0.50** Residue fields of K-affinoid algebras at maximal ideals are finite over K. *Source:* Wedhorn §5.7 (Tate algebras), Prop. 5.61.

- **R0.51** K-affinoid algebras are Jacobson rings. *Source:* Conrad-AWS §1.1, Thm 1.1.5(2).

- **R0.52** Maximal ideals of Tate algebras are generated by polynomials. *Source:* Conrad-IC Appendix A.1, proof of Lem. A.1.2(2).

**R0.53 The supremum seminorm of a K-affinoid algebra** (definition `Huber.Affinoid.supNorm`). Let K be a field complete for a nontrivial nonarchimedean absolute value |·| of rank one and A a K-affinoid algebra … *API* (on `Huber.Affinoid`): `supNorm, supNorm_le_residueNorm, supNorm_add_le, supNorm_mul_le` (+8). *Tests:* `supNorm_test_dualNumbers, supNorm_test_gauss, supNorm_test_zero` (+2). *Source:* Kedlaya06 §2.1, Def. 2.1.7, p. 9. *Needs:* R0.50, R0.51, R0.124.

- **R0.54** Maximum modulus principle for K-affinoid algebras. *Source:* Conrad-AWS §1.2, Thm 1.2.6(5).

- **R0.55** Power-bounded elements of K-affinoid algebras are those of supremum seminorm at most one. *Source:* Conrad-AWS §1.2, discussion after Thm 1.2.6.

- **R0.56** On a reduced K-affinoid algebra the supremum norm defines the topology. *Source:* KL15 §2.5, Cor. 2.5.6.

- **R0.57** Homomorphisms of K-affinoid algebras are continuous. *Source:* Wedhorn §5.7 (Tate algebras), Prop. 5.60.

- **R0.58** Power-bounded elements are integral over the image of the unit ball of a Tate algebra. *Source:* Huber94 §4, proof of Lem. 4.4, p. 543 (page image read).

- **R0.59** Finite homomorphisms of K-affinoid algebras induce finite maps of reductions. *Source:* KL15 §2.5, Cor. 2.5.7.

- **R0.60** A ring of definition with reduced reduction is the ring of power-bounded elements. *Source:* FK Ch. 0, Appendix B.1(b), Prop. B.1.3(1), p. 236 (PDF p. 254 of arXiv v5).

**R0.61 Separated morphism of adic spaces** (definition `AdicSpace.IsSeparated`). Let f: X → Y be a morphism of adic spaces (the category of the AdicSpaces anchor … *API* (on `AdicSpace`): `IsSeparated, IsSeparated.isClosed_range_diagonal, IsSeparated.iff_isClosedImmersion_diagonal, IsSeparated.of_isAffinoid` (+6). *Tests:* `IsSeparated_test_closedDisc, IsSeparated_test_doubledOrigin, IsSeparated_test_id` (+1). *Source:* Huber96 §1.3, Def. 1.3.1, p. 51. *Needs:* R0.35, R0.33, R0.42, R0.43, R0.46, R0.45.

**R0.62 Universally closed morphism of adic spaces** (definition `AdicSpace.UniversallyClosed`). Let f: X → Y be a morphism of adic spaces that is locally of weakly finite type. *API* (on `AdicSpace`): `UniversallyClosed, UniversallyClosed.isClosedMap, UniversallyClosed.baseChange, UniversallyClosed.comp` (+3). *Tests:* `UniversallyClosed_test_id, UniversallyClosed_test_closedDisc, UniversallyClosed_test_specializing`. *Source:* Huber96 §1.3, Def. 1.3.2(i), p. 51. *Needs:* R0.35, R0.33, R0.42.

**R0.63 Proper morphism of adic spaces** (definition `AdicSpace.IsProper`). A morphism f: X → Y of adic spaces is proper if it is of +weakly finite type (quasi-compact and locally of +weakly … *API* (on `AdicSpace`): `IsProper, IsProper.toIsSeparated, IsProper.toUniversallyClosed, IsProper.quasiCompact` (+7). *Tests:* `IsProper_test_closedDisc, IsProper_test_projectiveLine, IsProper_test_openDisc` (+2). *Source:* Huber96 §1.3, Def. 1.3.2(ii), p. 51. *Needs:* R0.35, R0.61, R0.62.

**R0.64 Universally specializing morphism of adic spaces** (definition `AdicSpace.SpecializingAt`). Let f: X → Y be a morphism of adic spaces. For x ∈ X … *API* (on `AdicSpace`): `SpecializingAt, UniversallySpecializingAt, UniversallySpecializing, specializingAt_forall_iff` (+4). *Tests:* `UniversallySpecializing_test_closedEmbedding, UniversallySpecializing_test_discInP1, UniversallySpecializing_test_specializingMap` (+1). *Source:* Huber96 §1.3, Def. 1.3.3(i), p. 51. *Needs:* R0.35, R0.42.

**R0.65 Partially proper morphism of adic spaces** (definition `AdicSpace.IsPartiallyProper`). A morphism f: X → Y of adic spaces is partially proper if it is locally of +weakly finite type (R0/finite-type-morp … *API* (on `AdicSpace`): `IsPartiallyProper, IsPartiallyProper.toIsSeparated, IsPartiallyProper.universallySpecializing, IsPartiallyProper.comp` (+5). *Tests:* `IsPartiallyProper_test_openDisc, IsPartiallyProper_test_closedDisc, IsPartiallyProper_test_id` (+1). *Source:* Huber96 §1.3, Def. 1.3.3(ii), p. 51. *Needs:* R0.35, R0.61, R0.64.

**R0.66 Valuation rings of an analytic adic space and their centres** (definition `AdicSpace.ValuationRing`). Let X be an analytic adic space. For x ∈ X let k(x) be the residue field of the local ring O_{X,x} … *API* (on `AdicSpace`): `ValuationRing, ValuationRing.affinoidField, ValuationRing.IsCentre, ValuationRing.IsCentre.specializes` (+7). *Tests:* `ValuationRing_test_trivial, ValuationRing_test_gaussPoint, ValuationRing_test_notGeneralisation` (+1). *Source:* Huber96 §1.3, Def. 1.3.5, p. 52.

- **R0.67** Valuative criterion for separatedness (Huber 1.3.7). *Source:* Huber96 §1.3, Prop. 1.3.7.

- **R0.68** Valuative criterion for universal specialization (Huber 1.3.8). *Source:* Huber96 §1.3, Prop. 1.3.8.

**R0.69 Valuative criterion for partial properness and properness of analytic adic spaces (Huber 1.3.9)** (theorem). Then f is partially proper (R0/partially-proper-morphism) if and only if for every (x, A) ∈ X_v and every centre y of (x, A) on Y there is exactly one centre z of (x … *Hypotheses:* X, Y analytic adic spaces (the source proves the criterion o … *Source:* Huber96 §1.3, Cor. 1.3.9, pp. 54-55. *Needs:* R0.67, R0.68, R0.65, R0.63, R0.70, R0.66.

- **R0.70** Proper equals partially proper and quasi-compact (Huber 1.3.4). *Source:* Huber96 §1.3, Lem. 1.3.4 and proof.

- **R0.71** The space of valuation rings of a qcqs analytic adic space is spectral (Huber 1.3.12). *Source:* Huber96 §1.3, (1.3.11) and Lem. 1.3.12.

- **R0.72** Closures of quasi-compact sets under partially proper morphisms (Huber 1.3.13). *Source:* Huber96 §1.3, Lem. 1.3.13 and proof.

- **R0.73** The diagonal of a separated morphism is a closed embedding. *Source:* Zavyalov-Q Appendix B.6, Lem. B.6.14.

- **R0.74** Universally closed, separated and proper morphisms are stable under adic base change. *Source:* Stacks Tag 01W4 (Morphisms, Lem. 29.42.5).

- **R0.75** Composites of universally closed, separated and proper morphisms. *Source:* Stacks Tag 01W3 (Morphisms, Lem. 29.42.4).

- **R0.76** Cancellation: g ∘ h proper and g separated imply h proper. *Source:* Stacks Tag 01W6 (Morphisms, Lem. 29.42.7).

- **R0.77** Universal closedness descends along surjections. *Source:* Stacks Tag 03GN (Morphisms, Lem. 29.42.9).

**R0.78 Finite morphism of complete Huber pairs** (definition `Huber.Pair.Hom.IsFinite`). Let (A, A⁺) and (B, B⁺) be complete Huber pairs (Tau Ceti Huber.Pair on complete Hausdorff Huber rings A … *API* (on `Huber.Pair.Hom`): `IsFinite, IsFinite.finite, IsFinite.isIntegral_plus, IsFinite.plus_eq_integralClosure` (+7). *Tests:* `Pair.Hom.IsFinite_test_ramified, Pair.Hom.IsFinite_test_plusNotIntegral, Pair.Hom.IsFinite_test_tateAlgebra` (+2). *Source:* Huber96 §1.4, (1.4.2), p. 61. *Needs:* R0.35.

**R0.79 Finite morphism of adic spaces** (definition `AdicSpace.IsFinite`). A morphism f: X → Y of adic spaces is finite if every y ∈ Y has an open affinoid neighbourhood V ⊆ Y such that f⁻¹( … *API* (on `AdicSpace`): `IsFinite, IsFinite.of_spa, IsFinite.isAffinoid_preimage, IsFinite.quasiCompact` (+7). *Tests:* `IsFinite_test_squaring, IsFinite_test_rationalEmbedding, IsFinite_test_genericPoint` (+2). *Source:* Huber96 §1.4, (1.4.4), p. 61. *Needs:* R0.78.

**R0.80 The Huber pair of a finite algebra over a noetherian affinoid ring** (construction `Huber.Pair.finiteAlgebra`). Let (A, A⁺) be a complete Huber pair such that A is … Then: (i) C is a complete Hausdorff Huber ring … *API* (on `Huber.Pair`): `finiteAlgebra, finiteAlgebra_plus, finiteAlgebra.isModuleTopology, finiteAlgebra.completeSpace` (+8). *Tests:* `finiteAlgebra_test_self, finiteAlgebra_test_squareRoot, finiteAlgebra_test_nonClosedIdeal` (+2). *Source:* Huber96 §1.4, (1.4.2), p. 61. *Needs:* R0.78, R0.79, R0.10, R0.5.

- **R0.81** Finiteness from monic relations with topologically nilpotent values (Huber 1.4.3). *Source:* Huber96 §1.4, Lem. 1.4.3.

**R0.82 Finite morphisms are proper (Huber 1.4.5(ii))** (theorem). Then f is proper (R0/universally-closed-and-proper-morphism). (Huber states 1.4.5(ii) for arbitrary adic spaces, deducing the specializing property from Huber–Knebusch [HK, 2.1.2 … *Hypotheses:* Y analytic (the proof via the valuative criterion 1.3.9 need … *Source:* Huber96 §1.4, (1.4.4) and Lem. 1.4.5(ii) with proof, pp. 61-62. *Needs:* R0.79, R0.78, R0.69, R0.66, R0.63, R0.35.

- **R0.83** Closed embeddings are finite (Huber 1.4.5(iii)). *Source:* Huber96 §1.4, (1.4.1) and Lem. 1.4.5(iii).

- **R0.84** Topological nilpotence in a fibre spreads to a rational neighbourhood (Huber 1.4.8). *Source:* Huber96 §1.4, Lem. 1.4.8.

- **R0.85** Finiteness near a point with proper fibre (Huber 1.4.6-1.4.7). *Source:* Huber96 §1.4, Prop. 1.4.6 and Lem. 1.4.7.

- **R0.86** Finiteness descends along finite faithfully flat affinoid covers (Huber 1.4.9). *Source:* Huber96 §1.4, Lem. 1.4.9.

- **R0.87** Base change of a finite algebra over a complete Tate ring needs no completion. *Source:* Zavyalov-Q Appendix B.3, Lem. B.3.5.

**R0.88 Locally quasi-finite and quasi-finite morphisms of adic spaces** (definition `AdicSpace.LocallyQuasiFinite`). A morphism f: X → Y of adic spaces is locally quasi-finite if it is locally of weakly finite type (R0/finite-type-m … *API* (on `AdicSpace`): `LocallyQuasiFinite, QuasiFinite, LocallyQuasiFinite.isDiscrete_preimage_singleton, QuasiFinite.finite_preimage_singleton` (+7). *Tests:* `LocallyQuasiFinite_test_squaring, LocallyQuasiFinite_test_projection, LocallyQuasiFinite_test_infiniteDisjointUnion` (+2). *Source:* Huber96 §1.5, Def. 1.5.1, p. 66. *Needs:* R0.35.

- **R0.89** Fibre criteria for quasi-finiteness (Huber 1.5.2). *Source:* Huber96 §1.5, Lem. 1.5.2.

- **R0.90** Stalk criterion for local quasi-finiteness (Huber 1.5.4). *Source:* Huber96 §1.5, Prop. 1.5.4.

**R0.91 Quasi-finite and proper equals finite (Huber 1.5.5)** (theorem). Then f is finite (R0/finite-morphism) if and only if f is quasi-finite (R0/quasi-finite-morphism) and proper (R0/universally-closed-and-proper-morphism) (Huber 1996 … *Hypotheses:* X, Y analytic adic spaces; Y locally noetherian (needed by R … *Source:* Huber96 §1.5, Prop. 1.5.5 and proof, pp. 68-70. *Needs:* R0.88, R0.79, R0.82, R0.63, R0.89, R0.85, R0.86, R0.66, R0.67, R0.43, R0.44, R0.38.

- **R0.92** Partially proper locally quasi-finite morphisms are finite near closures of points (Huber 1.5.6). *Source:* Huber96 §1.5, Prop. 1.5.6.

**R0.93 Module of continuous differentials of a topologically finite type map** (construction `Huber.ContinuousKaehlerDifferential`). The module of continuous differentials is Ωᶜ_{B/A} := I/I², a B-module via (B ⊗̂_A B)/I ≅ B … *API* (on `Huber`): `ContinuousKaehlerDifferential, ContinuousKaehlerDifferential.D, ContinuousKaehlerDifferential.continuous_D, ContinuousKaehlerDifferential.lift` (+11). *Tests:* `ContinuousKaehlerDifferential_test_tateAlgebra, ContinuousKaehlerDifferential_test_notAlgebraic, ContinuousKaehlerDifferential_test_finite` (+2). *Source:* Huber96 §1.6, Def. 1.6.1 and the par. after it, p. 76. *Needs:* R0.21, R0.22, R0.1, R0.5, R0.24, R0.6, R0.10.

- **R0.94** First fundamental exact sequence of continuous differentials (Huber 1.6.3). *Source:* Huber96 §1.6, Prop. 1.6.3(i).

- **R0.95** Conormal exact sequence for quotient mappings (Huber 1.6.3). *Source:* Huber96 §1.6, Prop. 1.6.3(ii).

- **R0.96** Stalks of continuous differentials of locally quasi-finite morphisms (Huber 1.6.4(i)). *Source:* Huber96 §1.6, Lem. 1.6.4(i) and the definition of Ω_{X/Y} before it.

**R0.97 Flat morphism of adic spaces** (definition `AdicSpace.Flat`). A morphism f: X → Y of adic spaces is flat if for every x ∈ X the local homomorphism of stalks O_{Y,f(x)} → O_{X,x} … *API* (on `AdicSpace`): `Flat, Flat.flat_stalkMap, Flat.comp, Flat.of_isOpenImmersion` (+5). *Tests:* `Flat_test_openImmersion, Flat_test_origin, Flat_test_squaring` (+1). *Source:* Zavyalov-Q Appendix B.4, Def. B.4.1, p. 49.

**R0.98 Unramified morphism of adic spaces** (definition `AdicSpace.Unramified`). A morphism f: X → Y of adic spaces is unramified if it is locally of finite type (R0/finite-type-morphism-classes) … *API* (on `AdicSpace`): `Unramified, Unramified.hom_ext, Unramified.comp, Unramified.of_comp` (+6). *Tests:* `Unramified_test_origin, Unramified_test_squaring, Unramified_test_id` (+1). *Source:* Huber96 §1.6, Def. 1.6.5, p. 78. *Needs:* R0.35.

**R0.99 Smooth morphism of adic spaces** (definition `AdicSpace.Smooth`). A morphism f: X → Y of adic spaces is smooth if it is locally of finite presentation (R0/locally-finite-presentatio … *API* (on `AdicSpace`): `Smooth, Smooth.exists_lift, Smooth.comp, Smooth.baseChange` (+6). *Tests:* `Smooth_test_polydisc, Smooth_test_node, Smooth_test_notAlgebraSmooth` (+2). *Source:* Huber96 §1.6, Def. 1.6.5, p. 78. *Needs:* R0.37, R0.35.

**R0.100 Étale morphism of adic spaces** (definition `AdicSpace.Etale`). A morphism f: X → Y of adic spaces is étale if it is locally of finite presentation (R0/locally-finite-presentation … *API* (on `AdicSpace`): `Etale, Etale.iff_smooth_and_unramified, Etale.lift, Etale.comp` (+9). *Tests:* `Etale_test_kummer, Etale_test_rationalEmbedding, Etale_test_frobenius` (+2). *Source:* Huber96 §1.6, Def. 1.6.5, p. 78. *Needs:* R0.37, R0.35, R0.99, R0.98.

- **R0.101** Open embeddings are étale (Huber 1.6.7). *Source:* Huber96 §1.6, Prop. 1.6.7(i).

- **R0.102** Locally closed embeddings are unramified (Huber 1.6.7). *Source:* Huber96 §1.6, Prop. 1.6.7(i).

- **R0.103** Relative polydiscs are smooth (Huber 1.6.7). *Source:* Huber96 §1.6, Prop. 1.6.7(i).

- **R0.104** Composites of unramified, smooth and étale morphisms (Huber 1.6.7). *Source:* Huber96 §1.6, Prop. 1.6.7(ii).

- **R0.105** Cancellation for unramified, smooth and étale morphisms (Huber 1.6.7). *Source:* Huber96 §1.6, Prop. 1.6.7(iii).

- **R0.106** Unramified, smooth and étale are local on the source (Huber 1.6.7). *Source:* Huber96 §1.6, Prop. 1.6.7(v) and Def. 1.6.5(ii).

- **R0.107** Unramified morphisms are locally quasi-finite (Huber 1.7.4). *Source:* Huber96 §1.7, Cor. 1.7.4.

- **R0.108** Characterisations of unramified morphisms (Huber 1.6.8). *Source:* Huber96 §1.6, Prop. 1.6.8.

- **R0.109** Continuous differentials of a smooth morphism are locally free (Huber 1.6.9(i)). *Source:* Huber96 §1.6, Prop. 1.6.9(i).

- **R0.110** Jacobian criterion for closed subspaces of smooth spaces (Huber 1.6.9(ii)). *Source:* Huber96 §1.6, Prop. 1.6.9(ii).

- **R0.111** Differential criterion for étale and smooth morphisms between smooth spaces (Huber 1.6.9(iii)). *Source:* Huber96 §1.6, Prop. 1.6.9(iii).

**R0.112 Finite étale adic spaces over a noetherian affinoid are finite étale algebras (Huber 1.6.6(ii))** (comparison). Let (A, A⁺) be a complete strongly noetherian Tate Huber pair. The functor C ↦ Spa(Huber.Pair.finiteAlgebra C) (R0/finite-algebra-over-affinoid) … *Hypotheses:* A complete strongly noetherian Tate ring (the construction o … *Source:* Huber96 §1.6, Ex. 1.6.6(ii), pp. 78-79. *Needs:* R0.80, R0.79, R0.100, R0.108, R0.93, R0.121, R0.122.

**R0.113 Morphisms of Huber pairs of algebraically finite type** (definition `Huber.Pair.Hom.IsAlgebraicallyFiniteType`). Let (A, A⁺) be a Huber pair (not necessarily complete). *API* (on `Huber.Pair.Hom`): `IsAlgebraicallyFiniteType, Huber.Pair.polynomialWeighted, IsAlgebraicallyFiniteType.finiteType, IsAlgebraicallyFiniteType.completion` (+5). *Tests:* `IsAlgebraicallyFiniteType_test_torus, IsAlgebraicallyFiniteType_test_tateAlgebra, IsAlgebraicallyFiniteType_test_id` (+1). *Source:* Huber96 §1.2, Def. 1.2.5 and Rem. 1.2.6, p. 50. *Needs:* R0.35.

**R0.114 Standard étale presentation of étale affinoid maps (Huber 1.7.1)** (theorem). Let A = (A, A⁺) be a Huber pair (not necessarily complete) whose completion is of noetherian type or discrete (R0/noetherian-type-huber-ring … *Hypotheses:* X affinoid, Y = Spa A affinoid (A not necessarily complete). … *Source:* Huber96 §1.7, Prop. 1.7.1, p. 80. *Needs:* R0.100, R0.95, R0.108, R0.110, R0.93, R0.103, R0.101, R0.115, R0.37, R0.35, R0.1.

- **R0.115** Stability of standard étale presentations under perturbation (Huber 1.7.2). *Source:* Huber96 §1.7, Cor. 1.7.2(i) and proof.

- **R0.116** Algebraic models of affinoid étale maps (Huber 1.7.3(iii)). *Source:* Huber96 §1.7, Cor. 1.7.3(iii) and its proof.

**R0.117 Smooth morphisms are locally étale over relative polydiscs (Huber 1.6.10)** (theorem). Then f is smooth if and only if every x ∈ X has an open neighbourhood U for which there are n ≥ 0, finite subsets M₁,…,Mₙ ⊆ A with each MᵢA open … *Hypotheses:* (A, A⁺) Huber pair with Â of noetherian type or discrete (co … *Source:* Huber96 §1.6, Cor. 1.6.10 and proof, p. 80. *Needs:* R0.99, R0.109, R0.111, R0.103, R0.93, R0.104, R0.106, R0.100, R0.38.

- **R0.118** Étale morphisms of affinoids over a field embed locally into finite étale covers (de Jong–van der Put 3.1.4). *Source:* dJvdP §3.1, Prop. 3.1.4.

- **R0.119** Étale maps are locally open embeddings into finite étale covers (Huber 2.2.8). *Source:* Huber96 §2.2, Lem. 2.2.8 and proof.

- **R0.120** Étale toric charts on smooth affinoids (Scholze 2013, Lemma 5.2). *Source:* Scholze13 §5, Lem. 5.2.

**R0.121 Étale equals flat and unramified for analytic adic spaces (Huber 1.7.5)** (theorem). Let f: X → Y be a morphism locally of finite type between analytic adic spaces, with Y locally noetherian (Huber's standing assumption (1.1.1) … *Hypotheses:* X, Y analytic; Y locally noetherian. *Source:* Huber96 §1.7, Prop. 1.7.5 and proof, p. 87. *Needs:* R0.100, R0.97, R0.98, R0.107, R0.90, R0.96, R0.89, R0.114, R0.108, R0.101, R0.104, R0.122, R0.106, R0.130, R0.38.

- **R0.122** Flatness of the ring map of an étale affinoid morphism (Huber 1.7.6). *Source:* Huber96 §1.7, Lem. 1.7.6 and proof.

- **R0.123** Smooth and étale morphisms are open (Huber 1.7.7-1.7.9). *Source:* Huber96 §1.7, (1.7.7), Prop. 1.7.8 and Lem. 1.7.9.

- **R0.124** On a Tate algebra the Gauss norm is the maximum of |f(x)| over Max K⟨X⟩. *Source:* Conrad-AWS §1.1, Exercise 1.1.3(3).

- **R0.125** Adic homomorphisms are bounded and adic for every choice of rings of definition. *Source:* Huber93 §1, Lem. 1.8 and proof, p. 459 (GDZ scan, page image read).

- **R0.126** Spa of a continuous homomorphism and the analytic locus (affinoid adicness criterion). *Source:* Wedhorn §7.5, Lem. 7.46(1),(2).

- **R0.127** Banach spaces of countable type have t-orthogonal Schauder bases. *Source:* HK §7, Rem. 7.8.

- **R0.128** Completed tensor products over a nonarchimedean field: cross norm, injectivity, kernels and strictness (Kedlaya–Liu Lemma 2.2.9). *Source:* KL15 §2.2, Lem. 2.2.9(b).

- **R0.129** The fibre of a morphism over a point (Huber (1.2.4)). *Source:* Huber96 §1.2, (1.2.4).

- **R0.130** Flat locally quasi-finite morphisms stay flat after base change (Huber 1.6.4(ii)). *Source:* Huber96 §1.6, Lem. 1.6.4(ii) and proof.

- **R0.131** The closure of a maximal point is the intersection of the rational subsets containing it (Huber 1.5.10). *Source:* Huber96 §1.5, Lem. 1.5.10 and proof.

- **R0.132** Closure of a pro-constructible set is its set of specializations (Stacks 0903). *Source:* Stacks Tag 0903, Lem. 5.23.6.

- **R0.133** Images of pro-constructible sets under quasi-compact spectral maps are pro-constructible. *Source:* Stacks Tag 0A2S, Lem. 5.23.3.


<a id="r1"></a>

## R1. Analytification and algebraic correspondences

**R1. Analytification and algebraic correspondences.** Depends on R0. Affinoid subdomains of `Max A`; Huber's fibre product of a scheme locally of finite type with an adic space; the analytification functor `X ↦ X^ad` over `K` with its universal property and its compatibilities with fibre products, immersions, finite, smooth and étale morphisms; local rings, constructible sets and connectedness; separatedness and properness comparisons; Tate's rigid spaces and Huber's rigid–adic comparison; analytification of group schemes, abelian schemes and isogenies with their invariant differentials; dimension of affinoid domains and the identity principle.

- **R1.1** For a Tate ring of topologically finite type over K, the power-bounded subring is the only ring of integral elements making it of topologically finite type over (K, K°). *Source:* Huber94 §4, Lem. 4.4.

### Affinoid subdomains

**R1.2 Affinoid subdomains of the maximal spectrum of a K-affinoid algebra** (definition `RigidSpace.IsAffinoidSubdomain`). Let K be a field complete for a nontrivial nonarchimedean absolute value |·| of rank one … *API* (on `RigidSpace`): `IsAffinoidSubdomain, IsAffinoidSubdomain.coordRing, IsAffinoidSubdomain.lift, IsAffinoidSubdomain.maxSpectrumEquiv` (+8). *Tests:* `isAffinoidSubdomain_test_disc, isAffinoidSubdomain_test_openDisc, isAffinoidSubdomain_test_univ` (+1). *Source:* Conrad-AWS §2.2, Def. 2.2.1, p. 12. *Needs:* R0.50, R0.51, R0.55, R0.21.

- **R1.3** Coordinate rings of affinoid subdomains are flat. *Source:* Conrad-AWS §2.2, discussion after Def. 2.2.1.

**R1.4 The Gerritzen–Grauert theorem** (theorem). Then there are finitely many rational subdomains V₁,…,V_n covering Max A — induced by a rational covering of Spa(A … *Hypotheses:* K is a field complete for a nontrivial nonarchimedean absolu … *Source:* Conrad-AWS §2.2, Thm 2.2.5, p. 14. *Needs:* R1.2, R1.45.

**R1.5 Tate's acyclicity theorem for finite coverings by affinoid subdomains** (theorem). Then the augmented Čech complex 0 → M → ∏_i M ⊗_A A_{U_i} → ∏_{i<j} M ⊗_A A_{U_i ∩ U_j} → ⋯ is exact. *Hypotheses:* K is a field complete for a nontrivial nonarchimedean absolu … *Source:* Conrad-AWS §2.3, Thm 2.3.3, p. 17. *Needs:* R1.2, R1.3, R1.4, R1.45.

- **R1.6** Local rings of affinoid spaces at points are noetherian with the algebraic completion. *Source:* Conrad-AWS §2.3, after Exercise 2.3.6.

**R1.7 Rigid-analytic spaces over K in the sense of Tate (BGR 9.3.1)** (definition `RigidSpace`). Let K be a complete rank-one nonarchimedean field. For a K-affinoid algebra A (a quotient of some Tate algebra K⟨T₁ … *API* : `RigidSpace, RigidSpace.Sp, RigidSpace.Sp.map, RigidSpace.homSpEquiv` (+10). *Tests:* `RigidSpace.test_sp_point, RigidSpace.test_sp_homEquiv, RigidSpace.test_nonadmissible_cover` (+2). *Source:* Conrad-AWS §2.4, Def. 2.4.1, p. 19. *Needs:* R1.2, R1.4, R1.5.

- **R1.8** At a classical point, the local ring of X^ad has the same completion as the local ring of X. *Source:* Conrad-IC Appendix A.1, Lem. A.1.2(1)-(2).

**R1.9 Rigid analytification X ↦ X^an of schemes locally of finite type over K** (construction `RigidSpace.analytification`). For a K-scheme X locally of finite type there is a rigid-analytic space X^an with a morphism of locally G-ringed K- … *API* (on `RigidSpace`): `analytification, analytification.toScheme, analytification.homEquiv, analytificationFunctor` (+2). *Tests:* `rigidAnalytification_test_point, rigidAnalytification_test_affineLine_hom, rigidAnalytification_test_closedPoints` (+1). *Source:* Conrad-IC Appendix A.1, p. 32. *Needs:* R1.7, R0.53, R0.54, R1.46, R0.55.

- **R1.10** Closures of constructible sets are compatible with analytification; closedness is detected on X^ad. *Source:* Conrad-IC Appendix A.1, Thm A.1.3(2)-(3).

- **R1.11** A finite locally free surjection of adic spaces locally of finite type over Spa K is an effective epimorphism. *Source:* Conrad-RA §4.2, Cor. 4.2.5.

### Huber's fibre product of a scheme and an adic space

- **R1.12** The affine chart of X ×_Y S: the increasing union of the affinoids Spa(A_k, A_k⁺) and its universal property on affinoid test objects. *Source:* Huber94 §3, proof of Prop. 3.8.

**R1.13 Huber's fibre product X ×_Y S of a scheme locally of finite type with an adic space over a scheme** (construction `AdicSpace.schemePullback`). Let f: X → Y be a morphism of schemes locally of fi … Then there are an adic space R = X ×_Y S … *API* (on `AdicSpace`): `schemePullback, schemePullback.fst, schemePullback.snd, schemePullback.condition` (+11). *Tests:* `schemePullback_test_affineLine, schemePullback_test_id, schemePullback_test_empty` (+2). *Source:* Huber94 §3, Prop. 3.8, p. 536. *Needs:* R1.12, R0.38, R0.35, R0.24, R0.42.

- **R1.14** Points of X ×_Y S and of X^ad: surjectivity onto compatible pairs; classical points correspond to closed points; q_X is not injective. *Source:* Huber94 §3, Lem. 3.9(ii).

### The analytification functor over K

**R1.15 The adic analytification X ↦ X^ad = X ×_{Spec K} Spa(K, K°) of schemes locally of finite type over K** (construction `AdicSpace.analytification`). Fix a field K complete for a nontrivial nonarchimedean absolute value |·| of rank one … *API* (on `AdicSpace`): `analytification, analytification.toScheme, analytification.structureMorphism, analytification.locallyOfFiniteType` (+9). *Tests:* `analytification_spec_field, analytification_test_finiteExtension, analytification_test_not_unitDisc` (+2). *Source:* Wedhorn §8.7, Def. 8.64, p. 92. *Needs:* R1.13, R1.12, R1.1.

**R1.16 Universal property of X^ad: morphisms from adic spaces over Spa K into X^ad are morphisms of locally ringed spaces into X** (theorem). Let X be a scheme locally of finite type over K and Y an adic space over Spa K with structure morphism π: Y → Spa K. *Hypotheses:* X locally of finite type over K (K complete, rank one). *Source:* Zavyalov24 §6, Def. 6.1, p. 12. *Needs:* R1.13, R1.15.

- **R1.17** The adic affine space A^{n,ad}: an increasing union of closed polydiscs, not quasi-compact, with entire functions as global sections. *Source:* Hübner §4, Ex. 4.3.

- **R1.18** Analytification preserves and reflects surjectivity. *Source:* Huber94 §3, Lem. 3.9(ii).

### Compatibilities

- **R1.19** Analytification of open and closed immersions: open subspaces and closed adic subspaces cut out by the analytified ideal. *Source:* Conrad-RA §2.2, Ex. 2.2.11.

- **R1.20** Analytification commutes with fibre products and preserves finite products. *Source:* Conrad-IC Appendix A.1, Lem. A.1.2(3).

- **R1.21** Analytification of finite and finite locally free morphisms. *Source:* Conrad-IC Appendix A.2, proof of Thm A.2.1.

- **R1.22** The analytification morphism q_X: X^ad → X is flat. *Source:* Zavyalov24 §6, Lem. 6.7.

**R1.23 Analytification of O_X-modules F ↦ F^ad = q_X^*F, its exactness, and analytified ideal sheaves** (construction `AdicSpace.analytificationModule`). For a K-scheme X locally of finite type and an O_X- … Then F ↦ F^ad is an exact functor O_X-Mod → O_{X^ad}-Mod with … *API* (on `AdicSpace`): `analytificationModule, analytificationModule.map, analytificationModule.exact, analytificationModule.unitIso` (+6). *Tests:* `analytification_modules_test_structureSheaf, analytification_modules_test_skyscraper, analytification_modules_test_ideal` (+2). *Source:* Conrad-IC Appendix A.1, Lem. A.1.2(4), p. 32. *Needs:* R1.22, R1.15, R1.19.

- **R1.24** Continuous differentials of the analytification charts: Ωᶜ_{A_k/A'} ≅ A_k ⊗_C Ω_{C/B'} (chart form of Ω_{X^ad/Y^ad} ≅ (Ω_{X/Y})^ad). *Source:* Zavyalov24 §5, proof of Lem. 5.9.

- **R1.25** Analytification preserves étale, smooth and unramified morphisms. *Source:* Huber96 §1.7, Prop. 1.7.1.

### Local rings, constructible sets, connectedness

- **R1.26** X is connected iff X^ad is connected. *Source:* Conrad-IC Appendix A.1, Thm A.1.3(1).

### Separatedness and properness

- **R1.27** The analytified projective space P^{n,ad} → Spa K is proper; relatively (P^n_Y)^ad → Y^ad is proper. *Source:* Conrad-AWS §3.2, Ex. 3.2.5.

**R1.28 Separatedness and properness comparison: f is separated (proper) iff f^ad is** (theorem). Let f: X → Y be a morphism of K-schemes locally of finite type (K complete of rank one). (i) f is separated iff f^ad is separated (R0.61). *Hypotheses:* K complete of rank one; in (iii) f quasi-compact (A^{1,ad} → … *Source:* Conrad-RA Appendix A.1, p. 38. *Needs:* R1.13, R1.20, R1.19, R1.10, R1.18, R1.27, R0.61, R0.63, R0.35, R0.43, R0.69, R0.47, R0.75, R0.76, R0.77, R0.74.

**R1.29 For f of finite type: f is finite (resp. a closed immersion) iff f^ad is** (theorem). Then f is finite iff f^ad is finite (R0.79), and f is a closed immersion iff f^ad is a closed embedding (R0.45). *Hypotheses:* f of finite type (quasi-compact); K complete of rank one. *Source:* Conrad-IC Appendix A.2, Thm A.2.1(2), p. 33. *Needs:* R1.21, R1.14, R1.19, R1.28, R1.20, R1.23, R1.8, R0.82, R0.79, R0.83, R0.45.

**R1.30 f is étale (resp. smooth) iff f^ad is** (theorem). Then f is étale (resp. smooth, resp. unramified) iff f^ad is étale (resp. smooth, resp. unramified) in the sense of Huber 1996 Definition 1.6.5. *Hypotheses:* K complete of rank one. *Source:* Conrad-IC Appendix A.2, Thm A.2.1(1), p. 33. *Needs:* R1.25, R1.14, R1.24, R1.8, R0.121, R1.20, R0.97, R0.117, R0.109, R0.48, R0.108.

### Rigid–adic comparison

**R1.31 Huber's functor r_K from rigid-analytic spaces to adic spaces locally of finite type over Spa(K, K°)** (construction `AdicSpace.rigidToAdic`). Let K be a complete rank-one nonarchimedean field. There is a functor r_K: Rig_K → Adic^{lft}_K together with … *API* (on `AdicSpace`): `rigidToAdic, rigidToAdic.rho, rigidToAdic.lift, rigidToAdic_Sp` (+7). *Tests:* `rigidToAdic_test_point, rigidToAdic_test_gaussPoint, rigidToAdic_test_nonadmissible_cover` (+2). *Source:* Huber94 §4, Prop. 4.3, p. 541. *Needs:* R1.7, R1.1, R0.40, R1.47, R0.57, R1.4, R0.45.

**R1.32 r_K is fully faithful, generates the lft adic spaces, restricts to an equivalence on quasi-separated objects, and detects affinoids** (theorem). Let K be complete of rank one. (i) r_K: Rig_K → Adic_K is fully faithful (Huber 1994 4.5(ii)). *Hypotheses:* K complete of rank one; in (iii) both sides quasi-separated. *Source:* Huber94 §4, Prop. 4.5(iv), p. 543. *Needs:* R1.31, R1.1, R0.35, R1.49, R1.7.

**R1.33 The rigid and adic ringed topoi agree: ρ_X induces an equivalence Shv(r_K(X)) ≃ Shv(X)** (theorem). Let K be complete of rank one and X a rigid-analytic space over K. The morphism of ringed sites ρ_X: (|r_K(X)|, O_{r_K(X)}) → (X … *Hypotheses:* K complete of rank one. *Source:* Huber94 §4, Prop. 4.5(i), p. 543. *Needs:* R1.31, R1.47, R1.4, R1.7.

**R1.34 r_K(X^an) ≅ X^ad: the adic space of the rigid analytification is the adic analytification** (comparison). Let K be complete of rank one and X a K-scheme locally of finite type. There is a unique isomorphism r_K(X^an) ≅ X^ad over Spa(K … *Hypotheses:* K complete of rank one; X locally of finite type over K (no … *Source:* Huber94 §4, Rem. 4.6(i), p. 543. *Needs:* R1.31, R1.9, R1.15, R1.16, R1.19, R1.20.

**R1.35 Separated, partially proper and proper morphisms of rigid spaces versus their adic counterparts (Huber 1996 1.3.19)** (comparison). Let f: X → Y be a morphism of rigid-analytic spaces over K (K complete of rank one), with Kiehl's notions: separated (diagonal a closed immersion) … *Hypotheses:* K complete of rank one; the converses of (ii)–(iii) need K° … *Source:* Huber96 §1.3, Rem. 1.3.19, pp. 59-60. *Needs:* R1.31, R1.7, R0.61, R0.65, R0.63, R0.69, R0.92, R0.88.

**R1.36 Rigid and adic étale, unramified and smooth morphisms agree under Huber's functor** (comparison). Then: (a) r_K(f) is étale in Huber's sense (R0.100) iff f is étale in the rigid sense; (b) r_K(f) is unramified (R0.98) iff f is unramified in the rigid sense … *Hypotheses:* K complete for a nontrivial nonarchimedean absolute value of … *Source:* Huber96 §1.7, Def. 1.7.10 and Prop. 1.7.11, p. 89. *Needs:* R1.7, R1.31, R0.100, R0.98, R0.99, R0.114, R0.108, R0.93, R0.117, R1.6, R0.51, R0.122, R0.103, R0.104, R0.106, R0.109, R0.111, R1.1.

### Analytic groups and invariant differentials

**R1.37 Analytic groups: analytification of group schemes, finite locally free group schemes, abelian varieties and isogenies** (construction `AdicSpace.analytificationFunctor.monoidal`). Let Sch^{lft}_K be the category of K-schemes locally of finite type (a full subcategory of Over(Spec K) closed unde … *API* (on `AdicSpace.analytificationFunctor`): `monoidal, AdicSpace.analytificationGrp, AdicSpace.analytificationGrp.mul_def, AdicSpace.analytificationGrp.one_def` (+10). *Tests:* `analytificationGrp_test_trivial, analytificationGrp_test_Ga_points, analytificationGrp_test_unitCircle` (+2). *Source:* Conrad-MR §2, p. 11 (multiplication by n on the smooth locus over an artin base). *Needs:* R1.15, R1.13, R1.20, R1.16, R1.21, R1.28, R1.25, R1.26, R1.18, R0.42.

**R1.38 Analytification of quotient maps by finite locally free subgroups: (A/G)^ad ≅ A^ad/G^ad** (theorem). Then π^ad: A^ad → B^ad is a finite locally free surjective homomorphism of analytic groups with kernel G^ad … *Hypotheses:* π finite locally free and surjective with kernel G … *Source:* Conrad-RA §4.2, Cor. 4.2.5. *Needs:* R1.37, R1.21, R1.18, R1.20, R1.11.

- **R1.39** Invariant differentials of an analytified group: ω_{G^ad/Y^ad} ≅ (ω_{G/Y})^ad. *Source:* Stacks Tag 047I (Groupoids, Lem. 39.6.3).

### Dimension of affinoid domains and the rigid identity principle

- **R1.40** Every maximal ideal of a K-affinoid domain has height equal to its dimension. *Source:* Conrad-IC §2.1, Lem. 2.1.5.

- **R1.41** Identity principle on connected normal rigid spaces. *Source:* Conrad-IC §2.1, Lem. 2.1.4.

- **R1.42** If T generates an open ideal then every T^n·U is a neighbourhood of 0: Huber's 'M·A open' gives a Tau Ceti weight family. *Source:* Huber94 §1, Lem. 1.1.

- **R1.43** Extending a valuation along a finitely generated algebra with value group in the divisible hull. *Source:* Wedhorn §8.7, proof of Prop. 8.63.

- **R1.44** Fibre products of schemes are fibre products of locally ringed spaces. *Source:* Stacks Tag 01I4 (Schemes, Lem. 26.6.7).

- **R1.45** Finite coverings of Max A by rational subdomains are refined by standard rational coverings (Huber's product trick on classical points). *Source:* KL15 §2.5, Lem. 2.5.10.

- **R1.46** Morphisms from a rigid space to a finite-type affine K-scheme are K-algebra maps on global sections (Conrad, Lemma A.1.1). *Source:* Conrad-IC Appendix A.1, Lem. A.1.1.

**R1.47 Classical points of Spa(A, A°) for a K-affinoid algebra: constructible density, and rational subsets ↔ rational subdomains of Max A (Huber 1993 §4)** (theorem). Then: (i) L_A is the closure of Max A in the constructible topology of Spv A (Huber 1993 Theorem 4.1) … *Hypotheses:* K complete, nontrivially valued, rank one … *Source:* Huber93 §4, before Thm 4.1, p. 471. *Needs:* R0.50, R1.2, R1.4.

- **R1.48** Restricted power series are flat over polynomials for strongly noetherian Tate rings. *Source:* Zavyalov24 §6, proof of Lem. 6.7.

**R1.49 Affinoid opens locally of finite type over a noetherian-type affinoid are of topologically finite type (Huber 1994 Proposition 3.6)** (theorem). Then the morphism of affinoid rings (O_Y(V), O⁺_Y(V)) → (O_X(U), O⁺_X(U)) is of topologically finite type. *Hypotheses:* O_Y(V) of Huber's noetherian type … *Source:* Huber94 §3, Prop. 3.6, p. 535. *Needs:* R0.35, R1.1.

**R1.50 A K-scheme locally of finite type is connected iff its rigid analytification is connected** (theorem). Then X is connected if and only if X^an is connected (X^an has no admissible covering by two disjoint nonempty admissible opens). *Hypotheses:* K complete, nontrivially valued, rank one. *Source:* Conrad-IC §2.3, Thm 2.3.1, p. 16. *Needs:* R1.9, R1.7, R1.41, R1.31.


<a id="f0"></a>

## F0. Formal geometry

**F0. Noetherian formal geometry.** Depends on Mathlib's schemes and adic completion and on the Tau Ceti coherent-cohomology roadmaps named above; nothing in this roadmap precedes it. Adic rings of finite ideal type, `Spf`, formal schemes and their thickenings, adic, finite-type and proper morphisms, closed formal subschemes, completion of schemes and coherent sheaves along a closed subset, coherent formal modules, the theorem on formal functions, Grothendieck's existence theorem and the algebraisation theorem (formal GAGA), following EGA I §10 and EGA III §§4–5.


### Adic rings

**F0.1 Coherent modules on a locally noetherian formal scheme as compatible systems** (theorem). Let X be a locally noetherian formal scheme, 𝒥 an ideal of definition and X_n = (X, O_X/𝒥^{n+1}), u_{mn} : X_m → X_n (m ≤ n). *Hypotheses:* X locally noetherian; 𝒥 an ideal of definition. *Source:* EGA I Ch. I, (10.11.3) Théorème, p. 204. *Needs:* F0.38, F0.9, F0.18, F0.20, F0.36, F0.2, F0.30, F0.60.

**F0.2 Adic rings of finite ideal type and their ideals of definition** (definition `IsAdicRing.exists_isAdic`). Let A be a commutative topological ring. An ideal J of A is an ideal of definition when J is open and every neighbo … *API* (on `IsAdicRing`): `exists_isAdic, isAdic_iff_of_isAdic, isAdicComplete_of_isAdic, le_jacobson_of_isAdic` (+7). *Tests:* `padicInt, of_discreteTopology, not_isAdicRing_padic` (+2). *Source:* EGA I Ch. 0, (7.1.2) Définition, p. 60.

- **F0.3** Noetherianity of adically complete rings and of adic completions. *Source:* EGA I Ch. 0, (7.2.6) Corollaire.

**F0.4 The completed localisation A_{f} of an adic ring** (construction `AdicRing.CompletedAway`). The completed localisation is A_{f} := AdicCompletion (I·A_f) A_f, where A_f = Localization.Away f … *API* (on `AdicRing`): `CompletedAway, CompletedAway.algebraMap_continuous, CompletedAway.lift, CompletedAway.lift_comp_algebraMap` (+5). *Tests:* `completedAway_one, completedAway_eq_zero_iff, completedAway_quotient` (+2). *Source:* EGA I Ch. 0, (7.6.6), p. 73. *Needs:* F0.2, F0.3.

- **F0.5** Restricted power series over an adic noetherian ring. *Source:* EGA I Ch. 0, (7.5.1).

- **F0.6** Adic algebras topologically of finite type over an adic noetherian ring. *Source:* EGA I Ch. 0, (7.5.5) Prop..

**F0.7 Completed tensor product of adic rings of finite ideal type** (construction `AdicRing.CompletedTensorProduct`). The completed tensor product is B ⊗̂_A C := AdicCompletion J (B ⊗_A C) with its J-adic topology. *API* (on `AdicRing`): `CompletedTensorProduct, CompletedTensorProduct.inl, CompletedTensorProduct.inr, CompletedTensorProduct.lift` (+6). *Tests:* `completedTensor_powerSeries, completedTensor_self_left, completedTensor_discrete` (+2). *Source:* EGA I Ch. 0, (7.7.1), p. 75. *Needs:* F0.2, F0.6, F0.5.

- **F0.8** Inverse limits of Mittag-Leffler systems of abelian groups. *Source:* EGA III₁ Ch. 0, (13.2.2) Prop., p. 66 (Publ. IHES 11).

- **F0.9** Finite modules over an adic noetherian ring as compatible systems. *Source:* EGA I Ch. 0, (7.2.9) Prop..

### The formal spectrum

**F0.10 The formal spectrum Spf A of an adic ring** (construction `FormalScheme.Spf`). For each n let O_n be the structure sheaf of Spec(A … Then: Γ(Spf A, O) ≅ A (EGA I, 10.1.3) … *API* (on `FormalScheme`): `Spf, Spf.mem_iff, Spf.homeomorphSpecQuotient, Spf.globalSectionsIso` (+8). *Tests:* `Spf_padicInt_points, Spf_discrete_eq_Spec, Spf_globalSections` (+3). *Source:* EGA I Ch. I, (10.1.2) Définition, p. 181. *Needs:* F0.2, F0.4.

- **F0.11** Spf A depends only on the topology of A. *Source:* EGA I Ch. I, (10.1.1).

**F0.12 Morphisms into Spf A and automatic continuity** (theorem). Let X be a formal scheme (F0.16) and A an adic ring of finite ideal type with ideal of definition I. *Hypotheses:* X a formal scheme; A adic of finite ideal type (the ideal of … *Source:* EGA I Ch. I, after (10.2.2), p. 183. *Needs:* F0.10, F0.4, F0.2, F0.16, F0.58.

### Formal schemes, ideals of definition and thickenings

- **F0.13** A formal scheme of finite ideal type is the colimit of its thickenings along an ideal of definition of finite type. *Source:* EGA I Ch. I, (10.6.2) Prop..

**F0.14 Morphisms of formal schemes of finite ideal type as compatible systems of morphisms of thickenings** (theorem). Then every S-morphism u : X → Y satisfies u*(𝒦)·O_X ⊆ 𝒥, and u ↦ (u_n) is a bijection Hom_S(X, Y) ≃ lim_n Hom_{S_n}(X_n, Y_n), the limit along the maps Hom_{S_n}(X_n … *Hypotheses:* X, Y (and S) formal schemes of finite ideal type … *Source:* EGA I Ch. I, (10.6.7), p. 191. *Needs:* F0.13, F0.18, F0.12, F0.2, F0.16.

**F0.15 Formal schemes of finite ideal type adic over S are adic inductive systems of S_n-schemes** (theorem). Then X ↦ (X_n)_n := ((X, O_X/(ℒO_X)^{n+1}))_n = (X ×_S S_n)_n is an equivalence from the category of formal schemes of finite ideal type adic over S (with S-morphisms) to the categ … *Hypotheses:* S a formal scheme of finite ideal type with an ideal of defi … *Source:* EGA I Ch. I, (10.12.3) Théorème, p. 206. *Needs:* F0.19, F0.13, F0.14, F0.2, F0.18, F0.16.

**F0.16 Formal schemes and locally noetherian formal schemes** (definition `FormalScheme`). A formal scheme (of finite ideal type) is a locally ringed space X such that every point has an open neighbourhood … *API* : `FormalScheme, FormalScheme.instCategory, FormalScheme.IsLocallyNoetherian, FormalScheme.IsNoetherian` (+8). *Tests:* `FormalScheme.ofScheme_Spec, FormalScheme.Spf_padicInt_isNoetherian, FormalScheme.not_isLocallyNoetherian_Spf_OC` (+3). *Source:* EGA I Ch. I, (10.4.2) Définition, p. 185. *Needs:* F0.10, F0.4, F0.2.

**F0.17 Gluing formal schemes along open subschemes** (construction `FormalScheme.GlueData`). A glue datum of formal schemes is a glue datum of locally ringed spaces (Mathlib LocallyRingedSpace.GlueData: piece … *API* (on `FormalScheme`): `GlueData, GlueData.glued, GlueData.ι, GlueData.glue_condition` (+4). *Tests:* `GlueData.projectiveLine_globalSections, GlueData.single, GlueData.ofScheme_glued` (+1). *Source:* EGA I Ch. 0, (4.1.7), p. 39. *Needs:* F0.16.

**F0.18 Ideals of definition of a formal scheme and the thickenings X_n** (definition `FormalScheme.IdealSheafData`). Notation: X_n := (X, O_X/𝒥^{n+1}), n ≥ 0. If X is locally noetherian: the powers 𝒥^{n+1} are ideals of definition a … *API* (on `FormalScheme`): `IdealSheafData, IdealSheafData.IsIdealOfDefinition, IdealSheafData.isIdealOfDefinition_of_cover, thickening` (+6). *Tests:* `IdealSheafData.isIdealOfDefinition_Spf, thickening_Spf, largestIdealOfDefinition_powerSeries` (+2). *Source:* EGA I Ch. I, (10.5.1), p. 186. *Needs:* F0.16, F0.10, F0.2, F0.4.

**F0.19 The formal scheme attached to an adic system of thickenings** (construction `FormalScheme.ThickeningSystem`). Then the locally ringed space X := (T, lim_n O_n) is a formal scheme; the maps lim O_k → O_n are surjective … *API* (on `FormalScheme`): `ThickeningSystem, ofThickenings, ofThickenings.ι, ofThickenings.idealOfDefinition` (+4). *Tests:* `ofThickenings_padic, ofThickenings_const, ofThickenings_thickening` (+2). *Source:* EGA I Ch. I, (10.6.3) Prop. b), c), p. 189. *Needs:* F0.10, F0.3, F0.16, F0.18, F0.2, F0.59.

**F0.20 A locally noetherian formal scheme is the colimit of its thickenings** (theorem). Then (X_n) is an adic thickening system with X_0 locally noetherian, and (X, (ι_n)) is a colimit of the diagram (X_n) in the category of formal schemes (EGA I … *Hypotheses:* X locally noetherian; 𝒥 an ideal of definition (exists: take … *Source:* EGA I Ch. I, (10.6.2) Prop., p. 189. *Needs:* F0.18, F0.19, F0.12, F0.16.

**F0.21 Morphisms of locally noetherian formal schemes as compatible systems** (theorem). Let X, Y be locally noetherian formal schemes with ideals of definition 𝒥 ⊆ O_X and 𝒦 ⊆ O_Y, and X_n = (X, O_X/𝒥^{n+1}), Y_n = (Y, O_Y/𝒦^{n+1}). *Hypotheses:* X, Y (and S) locally noetherian formal schemes with chosen i … *Source:* EGA I Ch. I, (10.6.10) Corollaire (i), p. 192. *Needs:* F0.20, F0.18, F0.12, F0.2.

### A formal scheme of finite ideal type is the colimit of its thickenings

### Morphisms of formal schemes of finite ideal type as compatible systems

**F0.22 Fibre products of formal schemes** (theorem). Let f : X → S and g : Y → S be morphisms of formal schemes (finite ideal type). The fibre product X ×_S Y exists in formal schemes … *Hypotheses:* formal schemes of finite ideal type … *Source:* EGA I Ch. I, proof of (10.7.2), p. 193. *Needs:* F0.7, F0.12, F0.17, F0.19, F0.6, F0.25, F0.13, F0.58.

### Adic, finite-type and proper morphisms; closed formal subschemes

**F0.23 Adic morphisms of locally noetherian formal schemes** (definition `FormalScheme.Hom.IsAdic`). A morphism f : X → Y of locally noetherian formal schemes is adic if there is an ideal of definition 𝒦 of Y such th … *API* (on `FormalScheme.Hom`): `IsAdic, IsAdic.forall, IsAdic.comp, IsAdic.of_comp` (+4). *Tests:* `isAdic_Spf_restricted, not_isAdic_Spf_powerSeries, isAdic_id` (+1). *Source:* EGA I Ch. I, (10.12.1), p. 206. *Needs:* F0.16, F0.18, F0.2, F0.21.

**F0.24 Adic formal S-schemes are adic inductive systems of S_n-schemes** (theorem). Let S be a locally noetherian formal scheme with ideal of definition ℒ and S_n = (S, O_S/ℒ^{n+1}). *Hypotheses:* S locally noetherian formal scheme with ideal of definition … *Source:* EGA I Ch. I, (10.12.3) Théorème, p. 206. *Needs:* F0.23, F0.19, F0.20, F0.21, F0.2.

### Formal schemes of finite ideal type adic over S are adic inductive systems

**F0.25 Morphisms of finite type of locally noetherian formal schemes** (definition `FormalScheme.Hom.FiniteType`). Let Y be a locally noetherian formal scheme with ideal of definition 𝒦 and f : X → Y a morphism of formal schemes. *API* (on `FormalScheme.Hom`): `FiniteType, finiteType_iff_reduction, finiteType_Spf_iff, FiniteType.comp` (+4). *Tests:* `finiteType_restricted, not_finiteType_powerSeries, finiteType_ofScheme` (+1). *Source:* EGA I Ch. I, (10.13.1) a), p. 207. *Needs:* F0.23, F0.24, F0.6, F0.5, F0.59.

- **F0.26** Properness, finiteness and closed immersions are insensitive to thickenings. *Source:* Stacks Tag 0BPG (More on Morphisms, Lem. 37.3.4).

**F0.27 Proper morphisms of locally noetherian formal schemes** (definition `FormalScheme.Hom.IsProper`). A morphism f : X → Y of locally noetherian formal schemes is proper if f is of finite type (F0.25) and … *API* (on `FormalScheme.Hom`): `IsProper, isProper_iff_reduction, IsProper.comp, IsProper.baseChange` (+3). *Tests:* `isProper_completion_projectiveLine, not_isProper_restricted, isProper_ofScheme` (+1). *Source:* EGA III₁ Ch. III, (3.4.1), p. 119. *Needs:* F0.25, F0.23, F0.18, F0.26.

**F0.28 Closed formal subschemes and closed immersions** (construction `FormalScheme.subscheme`). Let X be a locally noetherian formal scheme and 𝒜 ⊆ O_X a coherent ideal (F0.36). *API* (on `FormalScheme`): `subscheme, subschemeι, Hom.IsClosedImmersion, Hom.IsClosedImmersion.ker` (+4). *Tests:* `subscheme_Spf_quotient_example, subscheme_zero, subscheme_idealOfDefinition` (+1). *Source:* EGA I Ch. I, (10.14.2) Définition, p. 210. *Needs:* F0.36, F0.1, F0.19, F0.38, F0.25, F0.2, F0.34, F0.30.

- **F0.29** An adic morphism is a closed immersion iff its reduction is. *Source:* EGA III₁ Ch. III, (4.8.10) Corollaire.

### Completion along a closed subset

**F0.30 The formal completion of a locally noetherian scheme along a closed subset** (construction `FormalScheme.completion`). Let X be a locally noetherian scheme and X′ ⊆ X a closed subset. *API* (on `FormalScheme`): `completion, completion.ofIdeal, completion.toScheme, completion.idealOfDefinition` (+6). *Tests:* `completion_Spec_padic, completion_affine, completion_self` (+2). *Source:* EGA I Ch. I, (10.8.2) Lemme, p. 194. *Needs:* F0.19, F0.3, F0.10, F0.11, F0.16, F0.18.

**F0.31 Extension of a morphism to formal completions** (construction `FormalScheme.completion.map`). Let f : X → Y be a morphism of locally noetherian schemes and X′ ⊆ X, Y′ ⊆ Y closed with f(X′) ⊆ Y′. *API* (on `FormalScheme.completion`): `map, map_toScheme, map_unique, map_id` (+4). *Tests:* `map_id_example, map_comp_example, map_Spec` (+2). *Source:* EGA I Ch. I, (10.9.1), p. 198. *Needs:* F0.30, F0.21, F0.7, F0.22.

- **F0.32** Morphisms with equal completions agree near the closed subset. *Source:* EGA I Ch. I, (10.9.4) Prop..

**F0.33 Completion of a coherent sheaf along a closed subset** (construction `FormalScheme.completeModule`). The completion of F along X′ is F̂ = F_{/X′} := lim_n (F ⊗_{O_X} O_X/𝓘^{n+1})|_{X′} for any 𝓘 of finite type with V … *API* (on `FormalScheme`): `completeModule, completeModule.sectionsIso, completeModule.specIso, completeModule.pullbackIso` (+5). *Tests:* `completeModule_structureSheaf, completeModule_Spec, completeModule_self` (+2). *Source:* EGA I Ch. I, (10.8.4) Définition, p. 194. *Needs:* F0.30, F0.36, F0.31, F0.60.

- **F0.34** Completion of coherent sheaves is exact, agrees with pullback along X̂ → X, and commutes with ⊗, Hom and base change. *Source:* EGA I Ch. I, (10.8.8) Prop..

- **F0.35** What completion sees: sections and maps near the closed subset. *Source:* EGA I Ch. I, (10.8.11) Prop..

### Coherent formal modules

**F0.36 Coherent modules on a locally noetherian formal scheme** (definition `FormalScheme.Coh`). Let X be a locally noetherian formal scheme. An O_X-module is a sheaf of modules over the sheaf of rings O_X (Mathl … *API* (on `FormalScheme`): `Coh, isCoherentRing_structureSheaf, Coh.ker_mem, Coh.tensor` (+4). *Tests:* `Coh.structureSheaf, Coh.Spf_equiv, Coh.not_rationals` (+1). *Source:* EGA I Ch. I, (10.11.1) Prop., p. 204. *Needs:* F0.16, F0.18.

**F0.37 The coherent module M^Δ on Spf A attached to a finite A-module** (construction `FormalScheme.Spf.completedTilde`). For a finite A-module M, M^Δ := (M~)^ is the completion along V(I) of the coherent sheaf M~ on X (EGA I, 10.10.1). *API* (on `FormalScheme.Spf`): `completedTilde, completedTilde.map, completedTilde.basicOpenIso, completedTilde.globalSectionsIso` (+3). *Tests:* `completedTilde_self, completedTilde_discrete, completedTilde_basicOpen` (+2). *Source:* EGA I Ch. I, (10.10.1), p. 201. *Needs:* F0.33, F0.30, F0.4, F0.10.

**F0.38 Coherent modules on Spf A are finite A-modules** (theorem). Let A be an adic noetherian ring with ideal of definition I and 𝔛 = Spf A. (i) M ↦ M^Δ is exact and Γ(𝔛, M^Δ) ≅ M naturally (EGA I, 10.10.2 (i)). *Hypotheses:* A adic noetherian; modules finite. *Source:* EGA I Ch. I, (10.10.2) Prop., p. 201. *Needs:* F0.37, F0.34, F0.33, F0.9, F0.10, F0.60.

**F0.36 Coherent modules on a locally noetherian formal scheme** (definition `FormalScheme.Coh`). Let X be a locally noetherian formal scheme. An O_X-module is a sheaf of modules over the sheaf of rings O_X (Mathl … *API* (on `FormalScheme`): `Coh, isCoherentRing_structureSheaf, Coh.ker_mem, Coh.tensor` (+4). *Tests:* `Coh.structureSheaf, Coh.Spf_equiv, Coh.not_rationals` (+1). *Source:* EGA I Ch. I, (10.11.1) Prop., p. 204. *Needs:* F0.16, F0.18.

**F0.39 The theorem on formal functions** (theorem). Let A be a noetherian ring, I ⊆ A an ideal, f : X → Spec A a proper morphism, F a coherent O_X-module and F_n := F/I^{n+1}F. *Hypotheses:* A noetherian (not necessarily complete); f proper … *Source:* Stacks Tag 02OC (Thm 30.20.5). *Needs:* F0.41, F0.8, F0.9, F0.2, `TC:AlgebraicGeometry.Scheme.Modules.cohomologyMapBaseLinear`.

- **F0.40** Finiteness and uniform Serre vanishing for graded coherent modules over a proper scheme. *Source:* EGA III₁ Ch. III, (3.3.2) Corollaire.

- **F0.41** Good filtrations and the Mittag-Leffler property of H^p(X, F/I^{n+1}F). *Source:* EGA III₁ Ch. III, (4.1.7) Corollaire.

**F0.39 The theorem on formal functions** (theorem). Let A be a noetherian ring, I ⊆ A an ideal, f : X → Spec A a proper morphism, F a coherent O_X-module and F_n := F/I^{n+1}F. *Hypotheses:* A noetherian (not necessarily complete); f proper … *Source:* Stacks Tag 02OC (Thm 30.20.5). *Needs:* F0.41, F0.8, F0.9, F0.2, `TC:AlgebraicGeometry.Scheme.Modules.cohomologyMapBaseLinear`.

- **F0.42** Formal functions at a point of the base. *Source:* EGA III₁ Ch. III, (4.2).

- **F0.43** Cohomology of an inverse limit of sheaves. *Source:* EGA III₁ Ch. 0, proof of (13.3.1) b).

**F0.44 Comparison of algebraic and formal higher direct images** (theorem). Then R^n f̂_*(F̂) is a coherent O_Ŷ-module and the canonical maps φ_n : (R^n f_*F)^ → R^n f̂_*(F̂) and ψ_n : R^n f̂_*(F̂) → lim_k R^n f_*(F_k) are isomorphisms of O_Ŷ-modules … *Hypotheses:* Y locally noetherian; f proper; F coherent. *Source:* EGA III₁ Ch. III, (4.1.5) Théorème, p. 125. *Needs:* F0.43, F0.41, F0.39, F0.31, F0.33, F0.1, `TC:AlgebraicGeometry.Scheme.Modules.cohomologyMapBaseLinear`.

### Grothendieck's existence theorem

- **F0.45** Over a complete base, every neighbourhood of the closed fibre is everything. *Source:* EGA III₁ Ch. III, (5.1.3.1) Lemme.

- **F0.46** Completion of coherent sheaves is fully faithful over a complete base. *Source:* EGA III₁ Ch. III, (5.1.3) Corollaire.

- **F0.47** Uniform vanishing and lifting of sections on a proper formal scheme with an ample reduction. *Source:* EGA III₁ Ch. III, (5.2.3) Prop..

- **F0.48** Grothendieck existence for projective schemes. *Source:* EGA III₁ Ch. III, (5.2.5).

- **F0.49** Comparison along a proper modification up to a power of the exceptional ideal. *Source:* Stacks Tag 088B (Lem. 30.25.3).

- **F0.50** Algebraizing a formal module that maps to a completion with bounded torsion kernel and cokernel. *Source:* Stacks Tag 0889 (Lem. 30.23.6).

- **F0.51** Dévissage: extending algebraizability from thickenings of a closed subscheme. *Source:* Stacks Tag 088A (Lem. 30.25.2).

- **F0.52** Coherent formal modules with proper support live on a proper closed subscheme. *Source:* EGA III₁ Ch. III, (5.3.5).

**F0.53 Grothendieck’s existence theorem** (theorem). Then F ↦ F̂ is an equivalence from the category of coherent O_X-modules whose support is proper over Spec A to the category of coherent O_X̂-modules whose support is proper over Sp … *Hypotheses:* A adic noetherian (complete and separated for the I-adic top … *Source:* EGA III₁ Ch. III, (5.1.1), p. 149. *Needs:* F0.46, F0.48, F0.49, F0.51, F0.52, F0.1, F0.30, F0.28, F0.33, F0.65.

### Morphisms and algebraization (formal GAGA)

- **F0.54** Closed formal subschemes proper over Spf A are completions. *Source:* EGA III₁ Ch. III, (5.1.8) Corollaire.

- **F0.55** Isomorphisms and closed immersions of proper schemes are detected on completions. *Source:* EGA III₁ Ch. III, (4.6.8) Prop..

**F0.56 Morphisms from proper schemes are determined by their completions** (theorem). Then f ↦ f̂ is a bijection Hom_S(X, Y) ≅ Hom_{Spf A}(X̂, Ŷ) (EGA III, 5.4.1). Equivalently, S-morphisms X → Y correspond to compatible systems of S_n-morphisms X_n → Y_n (EGA III … *Hypotheses:* A adic noetherian; X proper over S … *Source:* EGA III₁ Ch. III, (5.4.1) Théorème, p. 156. *Needs:* F0.32, F0.45, F0.31, F0.29, F0.54, F0.55, F0.24, F0.23.

**F0.57 Grothendieck’s algebraization theorem (formal GAGA)** (theorem). Then 𝔛 is algebraizable: there are a scheme X proper over S and an isomorphism X̂ ≅ 𝔛 (X is unique up to unique isomorphism by F0.56) … *Hypotheses:* A adic noetherian with ideal of definition I. *Source:* EGA III₁ Ch. III, (5.4.5) Théorème, p. 157. *Needs:* F0.47, F0.24, F0.29, F0.54, F0.53, F0.35, F0.45, F0.46, F0.56, F0.27, F0.64.

- **F0.58** Morphisms of locally ringed spaces glue along open covers. *Source:* EGA I Ch. I, proof of (2.2.4) Prop..

- **F0.59** A nilpotent thickening of an affine scheme is affine. *Source:* EGA I Ch. I, (5.1.9) Prop..

**F0.60 Internal Hom of sheaves of modules; compatibility of ⊗ and ℋom with pullback and with M ↦ M~** (construction `SheafOfModules.internalHom`). (b) For every morphism of ringed spaces f : Y → X, f*(F ⊗ G) ≅ f*F ⊗ f*G canonically (EGA 0, 4.3.3.1 … *API* (on `SheafOfModules`): `internalHom, internalHomFunctor, globalSectionsInternalHomEquiv, pullbackTensorIso` (+3). *Tests:* `internalHom_unit, globalSections_internalHom, internalHom_tilde` (+2). *Source:* EGA I Ch. 0, (4.1.5), pp. 37–38.

- **F0.61** Closure properties of coherent modules on a locally noetherian formal scheme. *Source:* EGA I Ch. I, (10.11.1) Prop..

- **F0.62** Formal glueing of modules along a flat map that is an isomorphism modulo I. *Source:* Stacks Tag 0ALK (More on Algebra, Lem. 15.91.17).

- **F0.63** Coherent formal modules with proper support form Serre subcategories. *Source:* Stacks Tag 0CYV (Lem. 30.26.11).

### Notions this roadmap states for its own use

**F0.64 Projective bundles, ample sheaves and Serre finiteness and vanishing over a noetherian base** (theorem). For a noetherian ring A and a finite A-module E, the projective bundle P(E) = Proj(Sym E) with its universal property (morphisms S → P(E) over Spec A correspond to invertible quotients of E ⊗ 𝒪_S) and its compatibility with base change along Spec A/I^{n+1} → Spec A. For X proper over A with an ample invertible sheaf L and a coherent 𝒪_X-module F: some power of L is very ample; the A-modules Hⁱ(X, F) are finitely generated; and Hⁱ(X, F ⊗ L^{⊗n}) = 0 for every i > 0 and all n ≫ 0, uniformly in F running over the graded pieces of a finitely generated graded module. *Source:* EGA II 4.4.3, 4.6.8; EGA III₁ 2.2.1, 2.2.2, 3.2.1; Stacks Tags 01Q4, 02O5.

**F0.65 Chow's lemma and dévissage over a noetherian base** (theorem). For a separated morphism of finite type X → S with S noetherian there is a projective (in particular proper, surjective) morphism X′ → X which is an isomorphism over a dense open of X and such that X′ → S is quasi-projective (projective when X → S is proper). Dévissage: a property of coherent sheaves on a noetherian scheme stable under extensions and kernels of surjections, and holding for all coherent sheaves supported on each integral closed subscheme after pushforward, holds for all coherent sheaves. *Source:* EGA II 5.6.1; EGA III₁ 3.1.2, 3.1.3; Stacks Tags 0200, 01YI.


<a id="r2"></a>

## R2. Formal schemes, generic fibres and Hasse domains

**R2. Formal schemes, generic fibres and Hasse domains.** Depends on F0, R0, R1. Algebras topologically of finite type and presentation over `O_K` (arbitrary complete rank-one valuation ring); admissible formal schemes, Huber's type (S) and Conrad's category FS_C; the generic-fibre functor to adic spaces and its invariance under admissible blow-ups; specialisation, tubes and rig-points; Raynaud's theorem; flattening by admissible blow-up after Bosch–Lütkebohmert and Raynaud–Gruson, with its proof broken into its lemmas; formal completions of schemes and the good-reduction locus; smooth formal schemes, Frobenius lifts and residue discs; fractional valuation bounds, section domains and Hasse domains with their transition maps.


### Algebras topologically of finite presentation

**R2.1 Algebras topologically of finite type and of finite presentation over a complete rank-one valuation ring; admissible algebras** (definition `Huber.IsTopologicallyFinitePresentation`). Standing data: K is a field complete for a nontrivial rank-one nonarchimedean absolute value |·| … *API* (on `Huber`): `IsTopologicallyFinitePresentation, IsTopologicallyFinitePresentation.of_presentation, IsTopologicallyFinitePresentation.isTopologicallyFiniteType, IsTopologicallyFinitePresentation.iff_of_surjective` (+8). *Tests:* `topologicallyFinitePresentation_test_restricted, topologicallyFinitePresentation_test_torsion, topologicallyFinitePresentation_test_madic` (+2). *Source:* BL I §1, definitions before Prop. 1.1, p. 293. *Needs:* F0.2, F0.4.

- **R2.2** Saturated submodules of finite free modules over tft algebras are finitely generated. *Source:* BL I §1, Lem. 1.2(c).

- **R2.3** A flat algebra topologically of finite type over O_K is topologically finitely presented. *Source:* BL I §1, Prop. 1.1(c).

- **R2.4** Algebras topologically of finite presentation are coherent; torsion and annihilators are coherent. *Source:* BL I §1, Prop. 1.3.

- **R2.5** Being topologically finitely presented or admissible is local on Spf; flatness mod ϖ^m and faithful flatness of covers. *Source:* BL I §1, Prop. 1.7 and the globalisation after it.

### Admissible formal schemes, type (S) and FS_C

**R2.6 Admissible formal O_K-schemes (formal schemes locally topologically of finite presentation without ϖ-torsion)** (definition `FormalScheme.IsLocallyTFP`). A formal O_K-scheme locally of tf presentation is a formal scheme X of finite ideal type in the sense of F0 (F0.16: … *API* (on `FormalScheme`): `IsLocallyTFP, IsAdmissible, isAdmissible_spf_iff, isAdmissible_iff_affineOpens` (+9). *Tests:* `admissible_test_formalAffineLine, admissible_test_torsion, admissible_test_powerSeries` (+3). *Source:* BL I §1, after Prop. 1.7, p. 297. *Needs:* R2.1, R2.5, R2.4, F0.10, F0.16, F0.2, F0.22, F0.7, F0.17, F0.18, F0.23, F0.25, R2.87.

**R2.7 Formal schemes of type (S): the class on which Huber's generic-fibre functor is defined, and its relation to admissible formal schemes and to Conrad's FS_C** (definition `FormalScheme.IsTypeS`). A formal scheme X = (X, O_X) is of type (S) if every point has an open affine neighbourhood U such that the topolog … *API* (on `FormalScheme`): `IsTypeS, IsTypeS.of_isLocallyNoetherian, IsTypeS.of_isLocallyTFP, IsTypeS.of_mem_FSC` (+5). *Tests:* `typeS_test_admissible_not_noetherian, typeS_test_powerSeries_nondiscrete, typeS_test_dvr_powerSeries` (+2). *Source:* Huber96 §1.9, condition (S), p. 96. *Needs:* R2.6, R2.1, F0.16, F0.2, R0.3.

### Generic fibres

**R2.8 Huber's functor t from locally noetherian formal schemes to adic spaces** (construction `FormalScheme.toAdicSpace`). The smallest saturated subcategory of adic spaces containing the image of t consists of the adic spaces locally of … *API* (on `FormalScheme`): `toAdicSpace, toAdicSpace_spf, centerMap, centerMap_spf_apply` (+7). *Tests:* `toAdicSpace_test_spf_Zp, toAdicSpace_test_ZpT, toAdicSpace_test_discrete` (+2). *Source:* Huber94 §4, Prop. 4.1, p. 539. *Needs:* F0.16, F0.10, F0.23, F0.25, R0.38, R0.33, R0.35, R0.20.

**R2.9 Huber's analytic adic space d(X) of a formal scheme of type (S)** (construction `FormalScheme.genericFibre`). (b) O_X → λ_* O_{d(X)} factors through λ_* O⁺_{d(X)} and λ: (d(X), O⁺_{d(X)}) → (X … *API* (on `FormalScheme`): `genericFibre, genericFibre.lift, genericFibre.lift_unique, genericFibre.map` (+8). *Tests:* `genericFibre_test_formalAffineLine, genericFibre_test_powerSeries_dvr, genericFibre_test_torsion` (+2). *Source:* Huber96 §1.9, Prop. 1.9.1, pp. 96-97. *Needs:* R2.7, R2.8, R2.6, R0.33, R0.20.

**R2.10 For formal O_K-schemes locally of tf presentation, d(X) is the adic space of Raynaud's rigid generic fibre** (comparison). Let X be a formal O_K-scheme locally of tf presentation (in particular admissible), K complete of rank one. *Hypotheses:* K complete, nontrivial rank-one valuation … *Source:* Huber96 §1.9, Ex. 1.9.2.ii, pp. 97-98. *Needs:* R2.9, R2.6, R2.1, R1.31, R1.1, R1.7, R1.32.

- **R2.11** The generic fibre commutes with fibre products and with completed extension of the base field. *Source:* BL I §4, Cor. 4.6.

### Specialisation, tubes and rig-points

**R2.12 The specialisation map λ_X = sp: d(X) → X** (construction `FormalScheme.specialisation`). For X of type (S) the specialisation map is the continuous map λ_X: d(X) → X underlying Proposition 1.9.1. *API* (on `FormalScheme`): `specialisation, specialisation_spf_apply, specialisation_eq_center, continuous_specialisation` (+8). *Tests:* `specialisation_test_closedDisc, specialisation_test_Spf_OK, specialisation_test_preimage_closed` (+2). *Source:* Huber94 §4, proof of Prop. 4.1, point (1), p. 539. *Needs:* R2.9, R2.10, R2.14, R2.6, R1.31, R1.7.

**R2.13 Tubes ]T[ of locally closed subsets of the special fibre, adic and rigid** (construction `FormalScheme.tube`). For T ⊆ X locally closed (X and X_s have the same space): (i) if T = U is open, ]U[ := λ⁻¹(U) = d(X|_U) … *API* (on `FormalScheme`): `tube, tube_of_isOpen, tube_spf_of_isClosed, tube_eq_interior_preimage` (+6). *Tests:* `tube_test_origin_disc, tube_test_preimage_not_open, tube_test_classical` (+2). *Source:* GK02 §2.3, p. 18. *Needs:* R2.12, R2.9, R2.6, R2.79, R1.31, R1.7, R0.54.

**R2.14 Rig-points of admissible formal schemes** (definition `FormalScheme.RigPoint`). Let X be an admissible formal O_K-scheme. A rig-point of X is a morphism u: T → X of admissible formal O_K-schemes … *API* (on `FormalScheme`): `RigPoint, RigPoint.residueField, RigPoint.integralClosure_eq_valuationRing, RigPoint.map` (+5). *Tests:* `rigPoint_test_disc, rigPoint_test_notDim1, rigPoint_test_blowUp` (+1). *Source:* BL I §3, Def. 3.1(b), p. 303. *Needs:* R2.6, R2.1, R2.10, R2.15, R1.31, R0.50.

### Admissible blow-ups and Raynaud's theorem

**R2.15 Admissible formal blow-ups and strict transforms** (construction `FormalScheme.admissibleBlowUp`). The admissible blow-up of 𝒜 is X' := lim_m Proj(⊕_{n≥0} 𝒜ⁿ ⊗_{O_X} O_X/ϖ^{m+1}) with its projection φ: X' → X. *API* (on `FormalScheme`): `admissibleBlowUp, admissibleBlowUp.π, admissibleBlowUp.isAdmissible, admissibleBlowUp.isInvertible` (+14). *Tests:* `admissibleBlowUp_test_disc_origin, admissibleBlowUp_test_unit, admissibleBlowUp_test_nonOpenCentre` (+3). *Source:* BL I §2, p. 298. *Needs:* R2.6, R2.4, R2.3, R2.2, R2.5, F0.19, F0.17, F0.14.

- **R2.16** The generic fibre of an admissible blow-up is an isomorphism. *Source:* BL I §4, proof of Thm 4.1(a).

- **R2.17** Adjoining power-bounded functions to an admissible algebra is an admissible blow-up. *Source:* BL I §4, Lem. 4.5.

- **R2.18** Quasi-compact opens of the generic fibre come from open formal subschemes of an admissible blow-up. *Source:* BL I §4, Lem. 4.4.

- **R2.19** Every affinoid has an admissible formal model. *Source:* BL I §4, after Thm 4.1.

**R2.20 Raynaud's theorem: quasi-compact admissible formal schemes localised at admissible blow-ups are quasi-compact quasi-separated rigid spaces** (theorem). Let K be complete with nontrivial rank-one valuation (not necessarily discrete). The functor X ↦ X_rig from quasi-compact admissible formal O_K-schemes to rigid K-spaces sends admi … *Hypotheses:* K complete, nontrivial rank one; O_K may be non-noetherian. *Source:* BL I §4, Thm 4.1, p. 306. *Needs:* R2.16, R2.14, R2.18, R2.17, R2.19, R2.15, R2.10, R1.31, R1.7, R1.32.

### Separatedness, flattening, quasi-finite models and finiteness criteria

- **R2.21** A morphism of admissible formal schemes is separated iff its generic fibre is. *Source:* BL I §4, Prop. 4.7.

**R2.22 Separatedness, properness and partial properness of a formal model versus its generic fibre (Huber 1996 Remark 1.3.18)** (comparison). Then (i) d(f) is separated iff f is separated (node formal-model-separatedness, and R1's comparison of rigid and adic separatedness); (ii) d(f) is proper (R0.63) iff f is proper … *Hypotheses:* X, Y flat and locally of finite type over Spf O_K … *Source:* Huber96 §1.3, Rem. 1.3.18, p. 59. *Needs:* R2.21, R2.10, R2.12, R2.6, R1.35, R1.7, R0.63, R0.65, R0.69.

**R2.23 Flattening by admissible blow-up (Bosch–Lütkebohmert II Theorem 5.2)** (theorem). Let f: X → Y be a morphism of quasi-compact admissible formal O_K-schemes (K complete of rank one, not necessarily discretely valued … *Hypotheses:* X, Y quasi-compact admissible over Spf O_K … *Source:* BL II §5, Thm 5.2, p. 426. *Needs:* R2.69, R2.58, R2.55, R2.56, R2.15, R2.6.

- **R2.24** Quasi-finite and bounded-fibre-dimension formal models (Bosch–Lütkebohmert II Corollary 5.3). *Source:* BL II §5, Cor. 5.3(b).

- **R2.25** Conrad's scheme lemma: a flat, locally finitely presented, separated morphism with finite fibres of locally constant rank is finite. *Source:* Conrad-MR Appendix A.1, Lem. A.1.4.

**R2.26 Conrad's fibral finiteness criterion for flat rigid (adic) morphisms** (theorem). Theorem A.1.2: a flat map f: X → Y of rigid spaces over k (k complete nonarchimedean … *Hypotheses:* f flat; quasi-compact; separated (quasi-separated is insuffi … *Source:* Conrad-MR Appendix A.1, Thm A.1.2, p. 37. *Needs:* R2.25, R2.21, R2.24, R2.23, R2.14, R2.20, R0.79, R0.61, R1.31, R1.7, R1.32.

**R2.27 Topological invariance of affinoidness and finiteness (Conrad A.1.1)** (theorem). A rigid space X over k is affinoid iff X_red is affinoid; hence a morphism f: Y → Z of rigid spaces is finite iff Y_red → Z_red is finite. *Hypotheses:* Rigid spaces over a complete nonarchimedean field k … *Source:* Conrad-MR Appendix A.1, Thm A.1.1, p. 36. *Needs:* R1.7, R1.31, R1.32, R0.79, R0.45, R1.4.

### The proof of flattening (Bosch–Lütkebohmert II §§1–4)

- **R2.28** Generators modulo ϖ generate topologically (Bosch–Lütkebohmert II Lemma 1.3(a)). *Source:* BL II §1, Lem. 1.3(a) and its proof.

- **R2.29** A basis modulo ϖ of a flat module lifts to a topological basis (Bosch–Lütkebohmert II Lemma 1.3(b)). *Source:* BL II §1, Lem. 1.3(b).

- **R2.30** Smooth morphisms of the reduction lift to smooth formal morphisms (Bosch–Lütkebohmert II Lemma 1.4(a)). *Source:* BL II §1, Lem. 1.4(a).

- **R2.31** Lifting factorisations through smooth and étale morphisms (Bosch–Lütkebohmert II Lemma 1.4(b)). *Source:* BL II §1, Lem. 1.4(b).

- **R2.32** Generisation maps of stalks of formal schemes are flat (Bosch–Lütkebohmert I Corollary 1.8(b)). *Source:* BL I §1, Cor. 1.8(b).

- **R2.33** Connected elementary étale neighbourhoods at points with geometrically irreducible closure are geometrically irreducible (Raynaud–Gruson I, Lemme 1.1.2). *Source:* RG Première partie, §1.1, Lemme 1.1.2.

- **R2.34** After an elementary étale base change, a smooth morphism has geometrically integral fibres near a geometrically integral fibre (Raynaud–Gruson I, Lemme 1.1.3). *Source:* RG Première partie, §1.1, Lemme 1.1.3.

**R2.35 Étale-local structure of a morphism locally of finite type: finite over smooth with geometrically integral fibres (Raynaud–Gruson I, Théorème 1.1.1)** (theorem). Let f: (X, x) → (S, s) be a pointed morphism of schemes with X locally of finite type over S, and n = dim_x(X ⊗ k(s)). *Hypotheses:* X locally of finite type over S (no noetherian hypothesis). *Source:* RG Première partie, §1.1, Théorème 1.1.1, p. 3. *Needs:* R2.33, R2.34.

**R2.36 Local structure of formal morphisms: finite over smooth with geometrically irreducible fibres (Bosch–Lütkebohmert II Theorem 1.5)** (theorem). Conventions: K is complete for a nontrivial rank-one valuation, O_K its valuation ring, ϖ a pseudouniformiser … *Hypotheses:* f locally of tf presentation; no flatness assumption. *Source:* BL II §1, before Thm 1.5, p. 406. *Needs:* R2.35, R2.30, R2.31, R2.76, R2.75, R2.6, R2.28.

- **R2.37** A smooth algebra with geometrically integral fibres is a projective module (Raynaud–Gruson I, Proposition 3.3.1). *Source:* RG Première partie, §3.3, Prop. 3.3.1.

- **R2.38** Smooth formal morphisms with geometrically irreducible fibres admit local topological bases (Bosch–Lütkebohmert II Proposition 1.8(b), smooth case). *Source:* BL II §1, proof of Prop. 1.8(b).

**R2.39 Ideals of coefficients (Bosch–Lütkebohmert II Definition 2.1, Remark 2.2)** (definition `FormalScheme.IsIdealOfCoefficients`). Let h: Z → T be a morphism of formal O_K-schemes locally of tf presentation and 𝒥 ⊆ O_Z a coherent ideal … *API* (on `FormalScheme`): `IsIdealOfCoefficients, IsIdealOfCoefficients.unique, IsIdealOfCoefficients.le_map, IsIdealOfCoefficients.baseChange` (+7). *Tests:* `idealOfCoefficients_test_polynomial, idealOfCoefficients_test_unit, idealOfCoefficients_test_baseChange` (+1). *Source:* BL II §2, Def. 2.1, p. 407. *Needs:* R2.6, R2.4, R2.29, R2.3, R2.14, R2.10, F0.22.

- **R2.40** Existence of ideals of coefficients for open ideals along smooth morphisms with geometrically irreducible fibres (Bosch–Lütkebohmert II Proposition 2.3(b)). *Source:* BL II §2, Prop. 2.3(b).

- **R2.41** Ideals of coefficients on generic fibres, and openness when the rigid ideal of coefficients is the unit ideal (Bosch–Lütkebohmert II Proposition 2.3(b), rigid parts). *Source:* BL II §2, proof of Prop. 2.3(b).

- **R2.42** A function vanishing on no fibre is a non-zero-divisor at every level (Bosch–Lütkebohmert II Lemma 2.5(a)). *Source:* BL II §2, Lem. 2.5(a).

- **R2.43** A function vanishing on no fibre is a non-zero-divisor (Bosch–Lütkebohmert II Lemma 2.5(b)). *Source:* BL II §2, proof of Lem. 2.5(b).

- **R2.44** Hartogs-type extension across subsets of the special fibre of smaller relative dimension (Bosch–Lütkebohmert II Lemma 2.5(c), classical rigid case). *Source:* BL II §2, proof of Lem. 2.5(c).

- **R2.45** Contents are homogeneous: c(af) = a·c(f) (Bosch–Lütkebohmert II Lemma 2.6(a)). *Source:* BL II §2, Lem. 2.6.

- **R2.46** Multiplying by a function vanishing on no fibre does not change contents (Bosch–Lütkebohmert II Lemma 2.6(b)). *Source:* BL II §2, proof of Lem. 2.6(b).

- **R2.47** Contents are multiplicative when one factor has principal content (Bosch–Lütkebohmert II Lemma 2.6(c)). *Source:* BL II §2, proof of Lem. 2.6(c).

- **R2.48** Fibres over the generic fibre of the base are integral (Bosch–Lütkebohmert II Proposition 2.4(a), classical rigid case). *Source:* BL II §2, Prop. 2.4(a).

- **R2.49** Associated primes of B are generic points of fibres over the generic fibre (Bosch–Lütkebohmert II Proposition 2.4(b)). *Source:* BL II §2, Prop. 2.4(b).

**R2.50 T-dévissages of a coherent module in one dimension (Bosch–Lütkebohmert II Definition 3.1)** (definition `FormalScheme.DevissageStep`). (c) a homomorphism α: ℒ = O_Z^ℓ → 𝒩 := g_*ℳ of cohe … Then dim_z(𝒫 ⊗ k(t)) ≤ n − 1 … *API* (on `FormalScheme`): `DevissageStep, DevissageStep.pushforward, DevissageStep.cokernel, DevissageStep.surjective_generic` (+5). *Tests:* `devissageStep_test_free, devissageStep_test_dimZero, devissageStep_test_notFlat` (+1). *Source:* BL II §3, Def. 3.1, p. 411. *Needs:* R2.6, R2.75, R2.4, F0.22.

**R2.51 T-dévissages in several dimensions and complete dévissages (Bosch–Lütkebohmert II Definition 3.2)** (definition `FormalScheme.Devissage`). In the setting of node formal-devissage-step, a T-dévissage of ℳ at x in dimensions N = n¹ > n² > … > n^r = n ≥ 0 ( … *API* (on `FormalScheme`): `Devissage, Devissage.IsComplete, Devissage.length, Devissage.dim` (+4). *Tests:* `devissage_test_complete_free, devissage_test_lengthTwo, devissage_test_single` (+1). *Source:* BL II §3, Def. 3.2, p. 411. *Needs:* R2.50.

- **R2.52** Existence of complete dévissages after elementary étale localisation (Bosch–Lütkebohmert II Proposition 3.3). *Source:* BL II §3, before Prop. 3.3.

- **R2.53** Universal injectivity of α at z is bijectivity at the generic point of the fibre (Bosch–Lütkebohmert II Lemma 3.6). *Source:* BL II §3, proof of Lem. 3.6.

- **R2.54** Flatness in terms of a dévissage (Bosch–Lütkebohmert II Proposition 3.5). *Source:* BL II §3, before Prop. 3.5.

**R2.55 Flat locus and flatness in dimension ≥ n (Bosch–Lütkebohmert II §3, after Corollary 3.8)** (definition `FormalScheme.flatLocus`). Let f: X → T be a morphism of formal O_K-schemes locally of tf presentation and ℳ a coherent O_X-module. *API* (on `FormalScheme`): `flatLocus, mem_flatLocus_iff, IsFlatInDimAt, IsFlatInDim` (+5). *Tests:* `flatInDim_test_annulusModel, flatInDim_test_zero, flatInDim_test_relDim` (+1). *Source:* BL II §3, before Cor. 3.7, p. 415. *Needs:* R2.6, R2.5.

- **R2.56** The flat locus of a coherent module is open (Bosch–Lütkebohmert II Corollary 3.7). *Source:* BL II §3, Cor. 3.7.

- **R2.57** Flatness in dimension ≥ n in terms of a dévissage (Bosch–Lütkebohmert II Corollary 3.8). *Source:* BL II §3, before Cor. 3.8.

**R2.58 Rig-flatness, relative rig-dimension and rig-flatness in dimension ≥ n (Bosch–Lütkebohmert I §5; II Definition 3.9 and §4)** (definition `FormalScheme.IsRigFlatAt`). Let f: X → T be a morphism of quasi-compact formal O_K-schemes locally of tf presentation with T admissible … *API* (on `FormalScheme`): `IsRigFlatAt, isRigFlatAt_iff_localization, IsRigFlatAt.admissibleBlowUp, rigRelDim` (+7). *Tests:* `rigFlat_test_annulusModel, rigFlat_test_torsion, rigFlat_test_closedPoint` (+1). *Source:* BL I §5, p. 313. *Needs:* R2.14, R2.10, R2.6, R2.15, R2.16, R1.6, R0.97.

- **R2.59** Rig-flatness in top dimension is freeness at the generic point of the fibre (Bosch–Lütkebohmert II Proposition 3.12). *Source:* BL II §3, before Prop. 3.12.

**R2.60 Fitting ideals of coherent modules on formal schemes (Bosch–Lütkebohmert II Definition 3.13)** (construction `FormalScheme.fittingIdeal`). Let X be a formal O_K-scheme locally of tf presentation and ℳ a coherent O_X-module. *API* (on `FormalScheme`): `fittingIdeal, fittingIdeal_spf, fittingIdeal_mono, fittingIdeal_pullback` (+4). *Tests:* `fittingIdeal_test_cyclic, fittingIdeal_test_diagonal, fittingIdeal_test_zero` (+2). *Source:* BL II §3, Def. 3.13, p. 418. *Needs:* R2.4, R2.5, R2.6, F0.17.

- **R2.61** A principal Fitting ideal makes M/Ann_M(F_r(M)) generated by r elements (Raynaud–Gruson I, Lemme 5.4.2). *Source:* RG Première partie, §5.4, Lemme 5.4.2.

- **R2.62** An invertible Fitting ideal and generic freeness give local freeness modulo the annihilator (Bosch–Lütkebohmert II Lemma 3.14 = Raynaud–Gruson I, Lemme 5.4.3). *Source:* BL II §3, Lem. 3.14.

- **R2.63** An open and closed partition of the generic fibre extends to an admissible blow-up (formal form of Raynaud–Gruson I, Lemme 5.1.5). *Source:* RG Première partie, §5.1, Lemme 5.1.5.

- **R2.64** Flattening for modules on smooth formal schemes with geometrically irreducible fibres (Bosch–Lütkebohmert II Special case 4.4). *Source:* BL II §4, before Special case 4.4.

- **R2.65** Torsion in extensions of a module of small support by a free module (Bosch–Lütkebohmert II Lemma 4.5). *Source:* BL II §4, Lem. 4.5.

- **R2.66** In a dévissage of a module flat in dimension ≥ m + 1, the upper maps are universally injective and all 𝒩^i stay rig-flat (Bosch–Lütkebohmert II Lemma 4.6). *Source:* BL II §4, proof of Lem. 4.6(a).

- **R2.67** One step of the flattening induction: enlarging the locus of flatness in dimension ≥ m (Bosch–Lütkebohmert II Lemma 4.7). *Source:* BL II §4, proof of Lem. 4.7.

- **R2.68** Lowering the dimension of the non-flat locus by one admissible blow-up (Bosch–Lütkebohmert II Proposition 4.2). *Source:* BL II §4, Prop. 4.2.

**R2.69 Flattening a coherent module by an admissible blow-up of the base (Bosch–Lütkebohmert II Theorem 4.1)** (theorem). Then there is an admissible blow-up T' → T such that the strict transform ℳ' of ℳ on X' = X ×_T T' (node admissible-blow-up) is T'-flat in dimension ≥ n (node flat-in-dimension). *Hypotheses:* T quasi-compact admissible; X quasi-compact (Bosch–Lütkebohm … *Source:* BL II §4, Thm 4.1, p. 419. *Needs:* R2.68, R2.55, R2.58, R2.15, R2.6.

- **R2.70** The flattened strict transform is the pull-back modulo ϖ-torsion off a small closed set (Bosch–Lütkebohmert II Theorem 4.1, additional claim). *Source:* BL II §4, Thm 4.1.

### Formal completions of schemes and the good-reduction locus

**R2.71 Formal completion of a scheme, the morphism σ: d(X̂) → X and the comparison φ: d(X̂) → X ×_Y d(Ŷ)** (comparison). (1.9.4) For a scheme X and its formal completion X̂ along a closed subscheme, assumed of type (S), there is a natural morphism of locally ringed spaces σ_X: d(X̂) → X … *Hypotheses:* X̂ (resp. Ŷ) of type (S); the ideal defining Y' of finite ty … *Source:* Huber96 §1.9, Prop. 1.9.6, p. 98. *Needs:* R2.9, R2.7, R2.12, R1.13, F0.30, F0.19.

**R2.72 The generic fibre of the completion of an O_K-scheme is the integral (good-reduction) locus of the analytified generic fibre** (theorem). Then the comparison map φ_X: d(X̂) → X_K^ad of node formal-completion-and-algebraic-comparison (with Y = Spec O_K, Y' = V(ϖ)) is an open embedding … *Hypotheses:* X separated and locally of finite type over O_K … *Source:* Huber96 §1.9, Prop. 1.9.6, p. 98. *Needs:* R2.71, R2.7, R2.9, R2.12, F0.19, R1.15, R1.34.

- **R2.73** If the completion's generic fibre is all of the analytified generic fibre, a flat quasi-projective model is proper. *Source:* FK Ch. 0, §9.2(a), Cor. 9.2.3.

### Conrad's FS_C, smooth formal schemes, étale sites, Frobenius lifts and residue discs

**R2.74 Conrad's Berthelot-type functor (·)^rig on FS_C for arbitrary complete k** (construction `FormalScheme.FSC`). Fix an adic noetherian ring C with a continuous map C → R to the valuation ring R of a complete nonarchimedean fiel … *API* (on `FormalScheme`): `FSC, rigOfFSC, rigOfFSC.homEquiv, rigOfFSC_isOpenImmersion` (+7). *Tests:* `rigOfFSC_test_powerSeries, rigOfFSC_test_nondiscrete, rigOfFSC_test_restricted` (+1). *Source:* Conrad-MR §3.1, Thm 3.1.5, p. 16. *Needs:* F0.16, F0.10, R1.7, R1.31, R2.10, R2.8, R2.20, R0.55.

**R2.75 Smooth and étale morphisms of formal schemes locally of tf presentation; continuous differentials** (definition `FormalScheme.IsSmoothAt`). The module of continuous differentials Ω¹_{X/Y} := lim_m Ω¹_{X_m/Y_m} is coherent … *API* (on `FormalScheme`): `IsSmoothAt, IsSmooth, isSmoothAt_iff_flat_specialFibre, isSmooth_iff_forall_level` (+9). *Tests:* `smoothFormal_test_affineSpace, smoothFormal_test_torus, smoothFormal_test_semistable` (+2). *Source:* BL II §1, Def. 1.1, p. 404. *Needs:* R2.6, R2.5, R2.76, R0.99, R0.100, R0.93.

**R2.76 The étale site of a formal scheme is the étale site of its special fibre; the generic-fibre functor on étale objects** (comparison). Let 𝔛 be a formal O_K-scheme locally of tf presentation, 𝔛_m = 𝔛 ⊗ O_K/ϖ^{m+1}. (a) The functor 𝔜 ↦ 𝔜_0 is an equivalence from the category of formal schemes étale over 𝔛 (adic … *Hypotheses:* 𝔛 locally tfp over O_K (the same holds for adic noetherian f … *Source:* Stacks Tag 039R (Étale Morphisms of Schemes, Thm 41.15.2). *Needs:* R2.6, R2.9, R2.11, R2.12, R0.100, R0.114, F0.19, F0.15.

- **R2.77** Unique Frobenius lift on a formal scheme étale over the formal torus. *Source:* TT §2.3, Rem. 2.20.

- **R2.78** The residue disc of a rational smooth point is an open unit polydisc. *Source:* GK02 §2, Lem. 2.6.

### Fractional bounds, section domains and Hasse domains

**R2.79 Fractional valuation bounds |f| ≤ |g|^q and |f| ≥ |g|^q for q ∈ ℚ_{≥0}** (definition `ValuationSpectrum.fracPowLE`). Put fracPowLE f g q := {v ∈ Spv A : v(f^b) ≤ v(g^a)} and fracPowGE f g q := {v : v(f^b) ≥ v(g^a)}. *API* (on `ValuationSpectrum`): `fracPowLE, fracPowGE, mem_fracPowLE_iff, fracPowLE_natCast` (+8). *Tests:* `fracPowLE_test_halfDisc, fracPowLE_test_representative, fracPowLE_test_rounding` (+2). *Source:* BHW §2.1, p. 1721.

**R2.80 The domain {|s| ≥ |ϖ|^q} cut out by a section of an invertible sheaf on a formal model** (construction `FormalScheme.sectionDomainGE`). Define 𝔛_η(|s| ≥ |ϖ|^q) := ⋃_j (fracPowGE f_j ϖ q ∩ d(U_j)) ⊆ d(𝔛), and likewise 𝔛_η(|s| ≤ |ϖ|^q) with fracPowLE. *API* (on `FormalScheme`): `sectionDomainGE, sectionDomainLE, sectionDomainGE_of_trivialization, sectionDomainGE_indep_generator` (+8). *Tests:* `sectionDomain_test_projectiveLine, sectionDomain_test_generatorIndependence, sectionDomain_test_liftIndependence` (+2). *Source:* BHW §2.1, p. 1721. *Needs:* R2.79, R2.6, R2.9, R2.12.

**R2.81 Formal model of a section domain: the open chart of the admissible blow-up of (s, c)** (construction `FormalScheme.sectionDomainModel`). Universal property: for a ϖ-torsion-free formal scheme Z over Spf O_K with g: Z → 𝔛 … *API* (on `FormalScheme`): `sectionDomainModel, sectionDomainModel.toBlowUp, sectionDomainModel_affine, sectionDomainModel.homEquiv` (+6). *Tests:* `sectionDomainModel_test_annulus, sectionDomainModel_test_torsion, sectionDomainModel_test_points` (+2). *Source:* Scholze15 §III.2, Lem. III.2.13, p. 38. *Needs:* R2.15, R2.16, R2.80, R2.79, R2.6, R2.5.

**R2.82 Hasse domains X(ε) = {|Ha| ≥ |p|^ε} and their formal models** (construction `FormalScheme.hasseDomain`). For ε ∈ ℚ with 0 ≤ ε < 1 the Hasse domain is X(ε) := 𝔛_η(|Ha| ≥ |p|^ε) ⊆ d(𝔛) … *API* (on `FormalScheme`): `hasseDomain, hasseDomain_eq_sectionDomainGE, hasseDomain_indep_lift, hasseDomainModel` (+7). *Tests:* `hasseDomain_test_toy, hasseDomain_test_liftAtOne, hasseDomain_test_ordinary` (+2). *Source:* Scholze15 §III.2, Def. III.2.12, p. 38. *Needs:* R2.80, R2.81, R2.79, R2.6, R2.13, R2.11.

- **R2.83** Transition maps between Hasse domains as the radius changes. *Source:* Conrad-MR §4.1, Thm 4.1.1(1).

**R2.84 Conrad's Hasse-invariant loci S^{>h}, S^{≥h} of a generalized elliptic curve are admissible opens** (construction `AdicSpace.hasseInvariantValue`). Local description: on a formal affine Spf A of the formal completion M̂ of the proper moduli scheme M over which e* … *API* (on `AdicSpace`): `hasseInvariantValue, hasseLocusGT, hasseLocusGE, isOpen_hasseLocusGE` (+6). *Tests:* `hasseLocus_test_ordinary, hasseLocus_test_floor, hasseLocus_test_withoutMax` (+2). *Source:* Conrad-MR §4.1, proof of Thm 4.1.1, p. 27. *Needs:* R2.74, R2.72, R2.14, R2.79, R2.80, R2.82, R2.83, R2.11, R1.7, R1.31, R1.15, R2.88.

- **R2.85** Flatness from flatness modulo powers of an ideal (the adic flatness criterion behind Bosch–Lütkebohmert I Lemma 1.6). *Source:* BL I §1, proof of Lem. 1.6.

**R2.86 Conrad's Berthelot-type generic fibre preserves finiteness, smoothness, flatness, properness and fibre dimension (Conrad genpaper Theorem 3.1.6)** (theorem). Then: (a) if f is finite so is f^rig; (b) if f is formally smooth of pure relative dimension d then f^rig is smooth of pure relative dimension d (formally étale ⇒ étale) … *Hypotheses:* f locally topologically of finite type in FS_C … *Source:* Conrad-MR §3.1, Thm 3.1.6, p. 17. *Needs:* R2.74, R2.10, R2.20, R2.22, R2.75, R2.76, R1.7.

**R2.87 Coherent modules and coherent rings (the ring case of EGA 0 §5.3, as recalled in Bosch–Lütkebohmert I §1)** (definition `Module.IsCoherent`). Let A be a commutative ring. A finitely generated A-module M is coherent if every finitely generated submodule of M … *API* (on `Module`): `IsCoherent, IsCoherentRing, IsCoherent.of_exact_left / of_exact_right / of_exact_middle, IsCoherent.ker / coker / range / sup / inf` (+4). *Tests:* `coherent_test_noetherian, coherent_test_nonCoherentRing, coherent_test_notJustFinitelyPresented` (+2). *Source:* BL I §1, before Prop. 1.3, p. 294.

### Notions this roadmap states for its own use

**R2.88 The compactified moduli of generalised elliptic curves with level structure, and the formal group along the identity section** (definition). The Deligne–Rapoport moduli scheme of generalised elliptic curves with Γ(N)-structure (N ≥ 3) or Γ₁(N)-structure (N ≥ 5), proper and finitely presented over ℤ[1/N], with its universal generalised elliptic curve; the formal group of the smooth locus of the universal curve along its identity section, as a one-parameter formal group over the moduli scheme. API: the moduli scheme and its properness; the identity section; the formal group and its coordinate. Tests: over ℂ the N = 1 moduli is the j-line; the formal group of the Tate curve is 𝔾̂_m; the smooth locus of a generalised elliptic curve with n-gon fibre is 𝔾_m × ℤ/n over the cusp. *Source:* Deligne–Rapoport, Les schémas de modules de courbes elliptiques (LNM 349), IV.3.1 and IV.4.3; Conrad-MR §4.1 (the universal case of Thm 4.1.1).


<a id="r3"></a>

## R3. Coherent sheaves and finite traces

**R3. Coherent sheaves and finite traces.** Depends on R0–R2. The sheaf `M̃` of a finite module on a noetherian affinoid and its acyclicity (Huber's Theorem 2.5 in both cases); Čech acyclicity of the structure sheaf on every sheafy Tate affinoid (Kedlaya–Liu), via the reduction of rational coverings to simple Laurent coverings — the library has this reduction for the structure presheaf in degree 0 only, and the targets here are for an arbitrary presheaf in all degrees; glueing squares and Kiehl's theorem; the abelian category of coherent sheaves, coherent ideals and finite algebras; quasi-Stein spaces and Theorems A and B; vector bundles on sheafy Tate affinoids and uniform rings (the library's `Huber.IsUniform` is uniformity as boundedness of `A°`; the target here is its Banach-ring form through the square bound); the sheaf of continuous differentials; Kiehl's proper mapping theorem with its base-change statements; proper GAGA; traces of finite projective modules and of finite locally free morphisms, and pull–identify–trace along correspondences.


### The associated sheaf and acyclicity for finite modules

**R3.1 The sheaf M̃ = M ⊗ 𝒪_X associated with a finite module on a noetherian affinoid** (construction `AdicSpace.tilde`). Let (A, A⁺) is a Huber pair with A complete and Hausdorff … *API* (on `AdicSpace`): `tilde, tilde_obj_rationalSubset, tilde_map, tildeRestrictIso` (+5). *Tests:* `tilde_test_quotient, tilde_test_zero_and_self, tilde_test_not_algebraic_localisation` (+1). *Source:* Huber94 §2, definition preceding Thm 2.5, p. 525. *Needs:* R0.38, R0.18, R0.10.

**R3.2 Tate acyclicity for finite modules over a strongly noetherian Tate affinoid** (theorem). Then: (i) for every rational subset U ⊆ X and every finite covering 𝔘 of U by rational subsets … *Hypotheses:* (A, A⁺) is a Huber pair with A a complete Hausdorff strongly … *Source:* Huber94 §2, Thm 2.5, p. 525. *Needs:* R3.1, `DiamondsAndVStacks:D0`.

**R3.3 Acyclicity of M̃ when A has a noetherian ring of definition (Huber Theorem 2.5, Case I)** (theorem). Then M̃ is a sheaf of complete topological groups on X, and Hⁱ(U, M̃) = 0 for every i > 0 and every rational subset U ⊆ X. *Hypotheses:* A complete with a noetherian ring of definition. *Source:* Huber94 §2, proof of Thm 2.5, p. 525. *Needs:* R3.1, R0.18, R0.10, `DiamondsAndVStacks:D0`.

- **R3.4** Reduction of local transitive properties of rational coverings to simple Laurent coverings. *Source:* KL15 §2.4, Prop. 2.4.20.

- **R3.5** The two edges of a double complex with exact augmented rows and columns have the same cohomology. *Source:* Stacks Tag 00M1, Lem. 10.75.3.

- **R3.6** Čech acyclicity is inherited from a refinement whose restrictions are acyclic. *Source:* KL15 §2.4, proof of Prop. 2.4.21.

- **R3.7** Čech acyclicity of a presheaf on all rational coverings follows from simple Laurent coverings (Kedlaya–Liu Proposition 2.4.21). *Source:* KL15 §2.4, Prop. 2.4.21.

- **R3.8** For a simple Laurent covering the difference map B₁ ⊕ B₂ → B₁₂ is surjective (Kedlaya–Liu Lemma 2.4.22). *Source:* KL15 §2.4, Lem. 2.4.22.

**R3.9 Čech acyclicity of the structure sheaf on every sheafy Tate affinoid (Kedlaya–Liu Theorem 2.4.23)** (theorem). Then (1) for every rational subset U ⊆ X and every finite covering 𝔘 = (U_i) of U by rational subsets … Pair-level sheafiness is Tau Ceti's `Huber.IsSheafyForEveryPresentation`; the Čech framework is `quasiIso_cechAugmentation_iff`; the target is exactness in all positive degrees. *Hypotheses:* (A, A⁺) complete Hausdorff Tate Huber pair. *Source:* KL15 §2.4, Thm 2.4.23, p. 46. *Needs:* R3.8, R3.7, `DiamondsAndVStacks:D0`.

### Glueing squares and Kiehl's theorem

**R3.10 Glueing squares of complete Tate rings** (definition `Huber.GlueingSquare`). A glueing square is a commutative square of complete Hausdorff Tate rings with continuous homomorphisms R → R₁ … *API* (on `Huber`): `GlueingSquare, GlueingSquare.exact_sub, GlueingSquare.isStrictMap_sub, GlueingSquare.denseRange` (+5). *Tests:* `GlueingSquare.test_laurent, GlueingSquare.test_trivial, GlueingSquare.test_not_exact` (+2). *Source:* KL15 §2.7, Def. 2.7.3, pp. 56-57. *Needs:* R0.26.

- **R3.11** Factorisation of matrices near the identity along a strict surjection. *Source:* KL15 §2.7, Lem. 2.7.2.

- **R3.12** Sections of a finite glueing datum generate each piece. *Source:* KL15 §2.7, Lem. 2.7.4(a).

- **R3.13** The simple Laurent covering of a sheafy Tate affinoid is a glueing square. *Source:* KL15 §2.4, Lem. 2.4.22.

- **R3.14** Finite glueing data on a simple Laurent covering of a strongly noetherian Tate affinoid are effective. *Source:* Kiehl-AB §1, proof of Satz 1.4.

**R3.15 Coherent sheaves on locally noetherian adic spaces** (definition `AdicSpace.IsCoherent`). Let X be a locally noetherian adic space (R0.38) with structure sheaf 𝒪_X (anchor Layer 5). *API* (on `AdicSpace`): `IsCoherent, Coh, IsCoherent.of_iso, isCoherent_tilde` (+6). *Tests:* `IsCoherent.test_ideal, IsCoherent.test_point, IsCoherent.test_extension_by_zero` (+1). *Source:* Kiehl-E §0, Def. 0.5, p. 195. *Needs:* R0.38, R3.1, R3.2, R3.3.

**R3.16 Kiehl's theorem: coherent sheaves on a strongly noetherian Tate affinoid are the M̃** (theorem). Let (A, A⁺) is a Huber pair with A a complete Hausdorff strongly noetherian Tate ring and A⁺ a ring of integral elements and X = Spa(A, A⁺). *Hypotheses:* (A, A⁺) is a Huber pair with A a complete Hausdorff strongly … *Source:* KL15 §2.5, Thm 2.5.20(b), p. 52. *Needs:* R3.15, R3.1, R3.2, R3.14, R3.4.

### Operations, coherent ideals and finite algebras

- **R3.17** Small perturbations of surjections of complete modules are surjective. *Source:* Kiehl-E §1, Lem. 1.3.

**R3.18 The abelian tensor category of coherent sheaves and pullback** (construction `AdicSpace.Coh.instAbelian`). For a morphism f : Y → X of such spaces, the pullback f*F = 𝒪_Y ⊗_{f⁻¹𝒪_X} f⁻¹F defines a right exact monoidal func … *API* (on `AdicSpace.Coh`): `instAbelian, tensorObj, internalHom, instMonoidal` (+6). *Tests:* `test_cokernel_skyscraper, test_point, test_pullback_not_left_exact` (+1). *Source:* Kiehl-AB §2, Def. 2.1.1, p. 270. *Needs:* R3.15, R3.16, R3.1, R0.42, R1.31.

**R3.19 Closed adic subspaces correspond to coherent ideals** (theorem). Let X is a locally noetherian analytic adic space in the sense of R0.38 whose points all have affinoid neighbourhoods Spa(A … *Hypotheses:* X is a locally noetherian analytic adic space in the sense o … *Source:* Kiehl-E §0, p. 197. *Needs:* R3.16, R3.15, R3.2, R0.45, `TC:IsOpenQuotientMap.isStronglyNoetherian`.

**R3.20 Finite morphisms correspond to coherent 𝒪_X-algebras** (theorem). Let X is a locally noetherian analytic adic space in the sense of R0.38 whose points all have affinoid neighbourhoods Spa(A … *Hypotheses:* X is a locally noetherian analytic adic space in the sense o … *Source:* Conrad-RA Cor. 2.2.8, p. 12. *Needs:* R0.79, R0.80, R0.25, R3.16, R3.15, R0.87.

### Quasi-Stein spaces

**R3.21 Quasi-Stein adic spaces** (definition `AdicSpace.IsQuasiStein`). Let X an adic space locally of finite type over Spa(K, K°) … *API* (on `AdicSpace`): `IsQuasiStein, IsQuasiStein.exhaustion, IsQuasiStein.of_isAffinoid, isQuasiStein_openPolydisc` (+4). *Tests:* `IsQuasiStein.test_openDisc, IsQuasiStein.test_affinoid, IsQuasiStein.test_projectiveLine` (+2). *Source:* Kiehl-AB §2, Def. 2.3, p. 270. *Needs:* R1.31, R1.17.

- **R3.22** Dense restriction of coherent sections on a quasi-Stein space. *Source:* Kiehl-AB §2, Hilfssatz 2.5 and its consequence.

**R3.23 Kiehl's Theorem B on quasi-Stein spaces** (theorem). Then Hⁱ(X, F) = 0 for all i > 0. *Hypotheses:* X quasi-Stein. F coherent. Hⁱ sheaf cohomology on the topolo … *Source:* Kiehl-AB §2, Satz 2.4, p. 271. *Needs:* R3.21, R3.22, R3.2, R3.16, R3.15, `DiamondsAndVStacks:D0`.

- **R3.24** Kiehl's Theorem A on quasi-Stein spaces. *Source:* Kiehl-AB §2, Satz 2.4.3.

- **R3.25** Coherent cohomology of the open polydisc vanishes. *Source:* Kiehl-AB §2, after Def. 2.3.

- **R3.26** Acyclicity of direct images along quasi-Stein inclusions. *Source:* Kiehl-AB §2, proof of Satz 2.4.

### Vector bundles on sheafy Tate affinoids and uniform rings

**R3.27 Vector bundles (locally free sheaves of finite rank) on adic spaces** (definition `AdicSpace.VectorBundle`). Let X be an adic space (anchor Layer 5; 𝒪_X is a sheaf). *API* (on `AdicSpace`): `VectorBundle, VectorBundle.rank, VectorBundle.tensor, VectorBundle.pullback` (+5). *Tests:* `VectorBundle.test_disconnected, VectorBundle.test_rank_zero, VectorBundle.test_skyscraper` (+1). *Source:* KL15 §2.7, Def. 2.7.6, p. 58. *Needs:* `TC:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation`.

- **R3.28** Finite projective glueing data on a glueing square are effective. *Source:* KL15 §2.7, Prop. 2.7.5.

**R3.29 Kiehl glueing of finite projective modules over sheafy Tate affinoids** (theorem). Let (A, A⁺) be a complete Tate Huber pair which is sheafy (its structure presheaf is a sheaf on every rational subset). *Hypotheses:* (A, A⁺) complete Tate and sheafy. modules finite projective. *Source:* KL15 §2.7, Thm 2.7.7, p. 58. *Needs:* R3.27, R3.30, R3.13, R3.28, R3.4, R3.9.

- **R3.30** Acyclicity of P̃ for finite projective P over a sheafy Tate affinoid. *Source:* KL15 §2.7, proof of Thm 2.7.7.

- **R3.31** Vector bundles on sheafy Tate affinoids are generated by global sections and acyclic. *Source:* KL15 §2.7, Def. 2.7.6.

- **R3.32** Descent of finite projective modules along finite étale covers of affinoids. *Source:* Scholze13 §7, proof of Lem. 7.3.

- **R3.33** Uniformity of a Banach ring via the square bound, and its relation to boundedness of A°. *Source:* KL15 §2.8, Def. 2.8.1(c).

- **R3.34** A split injection into a stably uniform ring gives stable uniformity (Kedlaya–Liu Remark 2.8.12). *Source:* KL15 §2.8, Rem. 2.8.12.

- **R3.35** Spectral norms of uniform rings and isometric maps. *Source:* KL15 §2.8, Rem. 2.8.3(a).

### R3.5a The sheaf of continuous differentials

**R3.36 The coherent sheaf of continuous differentials Ω¹_{X/Y} and its exterior powers** (construction `AdicSpace.relativeDifferentials`). (b) exact sequences: for X → Y → Z (both locally of finite type) the sequence f*Ω¹_{Y/Z} → Ω¹_{X/Z} → Ω¹_{X/Y} → 0 … *API* (on `AdicSpace`): `relativeDifferentials, relativeDifferentials.d, relativeDifferentials.isCoherent, relativeDifferentials.affinoidIso` (+11). *Tests:* `relativeDifferentials.test_disc, relativeDifferentials.test_openEmbedding, relativeDifferentials.test_notAlgebraic` (+2). *Source:* DLLZ-A §3.3, Construction 3.3.2, p. 34. *Needs:* R3.15, R3.1, R3.2, R3.16, R3.18, R3.19, R3.27, R3.32, R0.38, R0.93, R0.94, R0.95, R0.108, R0.109, R0.117, R0.111, R0.99, R0.100, R0.119, R0.42, R0.41, R0.48, R1.24, R1.23.

**R3.37 Kiehl's proper mapping theorem** (theorem). Let K be a complete nonarchimedean field with nontrivial absolute value and f : X → Y a proper morphism (R0.63) of adic spaces locally of finite type over Spa(K, K°). *Hypotheses:* K complete nonarchimedean, nontrivially valued. *Source:* Kiehl-E §3, Thm 3.3, p. 206. *Needs:* R3.44, R3.46, R3.2, R3.15, R0.63, R0.44, `DiamondsAndVStacks:D0`.

**R3.38 Completely continuous maps of Banach modules over an affinoid algebra** (definition `Huber.IsCompletelyContinuous`). Let K a complete nonarchimedean field with nontrivial absolute value … *API* (on `Huber`): `IsCompletelyContinuous, IsStrictlyCompletelyContinuous, IsStrictlyCompletelyContinuous.isCompletelyContinuous, IsCompletelyContinuous.of_finiteRank` (+4). *Tests:* `IsCompletelyContinuous.test_restriction, IsCompletelyContinuous.test_finite, IsCompletelyContinuous.test_identity` (+1). *Source:* Kiehl-E §1, Def. 1.1, p. 198.

- **R3.39** The Schwartz finiteness theorem over affinoid algebras. *Source:* Kiehl-E §1, Satz 1.2.

- **R3.40** Strict complete continuity descends to a closed submodule for topologically free sources. *Source:* Kiehl-E §1, Satz 1.4.

**R3.41 Relatively compact affinoid subdomains over an affinoid base (Kiehl)** (definition `AdicSpace.RelativelyCompact`). Let K a complete nonarchimedean field with nontrivial absolute value … *API* (on `AdicSpace`): `RelativelyCompact, RelativelyCompact.mono, RelativelyCompact.inter, RelativelyCompact.prod` (+4). *Tests:* `RelativelyCompact.test_disc, RelativelyCompact.test_finite, RelativelyCompact.test_unit_disc_not_self` (+1). *Source:* Kiehl-E §2, Def. 2.1, p. 202. *Needs:* R1.31.

- **R3.42** Proper morphisms to an affinoid admit relatively compact affinoid covers. *Source:* Kiehl-E §2, Def. 2.3.

- **R3.43** Restriction along a relatively compact inclusion is strictly completely continuous. *Source:* Kiehl-E §2, before Satz 2.5.

- **R3.44** Finiteness of coherent cohomology over an affinoid base (Kiehl Satz 2.6). *Source:* Kiehl-E §2, Satz 2.6.

- **R3.45** Completion of proper coherent cohomology (Kiehl Theorems 3.4 and 3.7). *Source:* Kiehl-E §3, Thm 3.4.

- **R3.46** Proper coherent cohomology commutes with affinoid subdomains (Kiehl Satz 3.5). *Source:* Kiehl-E §3, Satz 3.5.

**R3.37 Kiehl's proper mapping theorem** (theorem). Let K be a complete nonarchimedean field with nontrivial absolute value and f : X → Y a proper morphism (R0.63) of adic spaces locally of finite type over Spa(K, K°). *Hypotheses:* K complete nonarchimedean, nontrivially valued. *Source:* Kiehl-E §3, Thm 3.3, p. 206. *Needs:* R3.44, R3.46, R3.2, R3.15, R0.63, R0.44, `DiamondsAndVStacks:D0`.

- **R3.47** Closed subspaces of Banach spaces of countable type have continuous linear sections. *Source:* Conrad-IC proof of Lem. 1.1.5.

- **R3.48** Completed extension of the base field for affinoid algebras is faithfully flat. *Source:* Conrad-IC Lem. 1.1.5.

- **R3.49** Proper coherent cohomology commutes with completed extension of the base field. *Source:* Conrad-RA Appendix A.1, Thm A.1.2.

- **R3.50** Proper coherent cohomology commutes with finite flat base change of affinoids. *Source:* Scholze13 §9, proof of Prop. 9.2.

**R3.51 Base change of proper coherent cohomology along étale maps of affinoids (Scholze Proposition 9.2(ii))** (theorem). Then for all i the natural map Hⁱ(X, F_X) ⊗_{𝒪_S(S)} 𝒪_T(T) → Hⁱ(Y, F_Y) is an isomorphism; equivalently g*(Rⁱf_*F_X) ≅ Rⁱf_{T*}F_Y. *Hypotheses:* g étale, S and T affinoid. f proper. F_X coherent. *Source:* Scholze13 §9, Prop. 9.2(ii), p. 54. *Needs:* R3.37, R3.46, R3.50, R0.121, R0.100, R0.44, R0.118.

### Proper GAGA

- **R3.52** Analytification carries coherent sheaves to coherent sheaves. *Source:* Conrad-RA Ex. 2.2.11.

**R3.53 The GAGA comparison maps on cohomology and higher direct images** (construction `AdicSpace.cohomologyComparison`). The comparison map c_F : Hⁱ(X, F) → Hⁱ(X^an, F^an) is the composite of Hⁱ(X, F) → Hⁱ(X … *API* (on `AdicSpace`): `cohomologyComparison, cohomologyComparison_naturality, cohomologyComparison_δ, cohomologyComparison_zero` (+4). *Tests:* `cohomologyComparison_test_affineLine, cohomologyComparison_test_point, cohomologyComparison_test_skyscraper` (+1). *Source:* Conrad-RA Appendix A.1, p. 38. *Needs:* R1.23, R1.20, `DiamondsAndVStacks:D0`.

- **R3.54** Coherent cohomology of O(m) on analytic projective space. *Source:* Conrad-RA Appendix A.1.

**R3.55 Proper GAGA: comparison of coherent cohomology (Köpf)** (theorem). Then f^an : X^an → Y^an is proper and the δ-functorial comparison maps (Rⁱf_*F)^an → Rⁱf^an_*(F^an) are isomorphisms of coherent 𝒪_{Y^an}-modules for all i. *Hypotheses:* K a complete nonarchimedean field with nontrivial absolute v … *Source:* Conrad-RA Appendix A.1, p. 38. *Needs:* R3.53, R3.52, R3.54, R3.37, R3.45, R1.28, R1.8, R1.23, F0.39, F0.65.

**R3.56 Proper GAGA: analytification is an equivalence on coherent sheaves** (theorem). Then F ↦ F^an is an exact equivalence of abelian tensor categories Coh(X) → Coh(X^an). *Hypotheses:* K a complete nonarchimedean field with nontrivial absolute v … *Source:* Scholze13 §9, Thm 9.1(i), p. 53. *Needs:* R3.55, R3.52, R3.53, R3.54, R3.18, R3.19, R1.23, R1.22, F0.65.

- **R3.57** Finite analytic covers of proper varieties are algebraic. *Source:* Conrad-RA proof of Thm 3.1.5.

### Finite locally free traces and pull–identify–trace

**R3.58 Trace of endomorphisms of finite projective modules** (construction `LinearMap.projectiveTrace`). Let R be a commutative ring and M a finitely generated projective R-module. *API* (on `LinearMap`): `projectiveTrace, projectiveTrace_dualTensorHom, projectiveTrace_eq_trace, projectiveTrace_comp_comm` (+5). *Tests:* `projectiveTrace_test_nonfree, projectiveTrace_test_matrix, projectiveTrace_test_zero_self` (+1). *Source:* Stacks Tag 02DU, Exercise 111.22.6.

**R3.59 The trace of a finite locally free algebra** (construction `Algebra.projectiveTrace`). Let R be a commutative ring and B a commutative R-algebra which is finitely generated and projective as an R-module … *API* (on `Algebra`): `projectiveTrace, projectiveTrace_apply, projectiveTrace_eq_trace, projectiveTrace_algebraMap` (+6). *Tests:* `projectiveTrace_test_ramified, projectiveTrace_test_nonconstant_rank, projectiveTrace_test_quadratic` (+2). *Source:* Stacks Tag 02DV, Exercise 111.22.7. *Needs:* R3.58.

- **R3.60** Base change of the finite projective trace. *Source:* Stacks Tag 02DV, Exercise 111.22.7.

- **R3.61** Transitivity of the finite projective trace in towers. *Source:* Stacks Tag 02DU, Exercise 111.22.6.

- **R3.62** A finite locally free algebra is étale iff its trace pairing is perfect. *Source:* KL15 §1.2.

- **R3.63** The trace of a finite étale algebra over a field is the sum over geometric points. *Source:* Stacks Tag 03SH, §59.66.

**R3.64 The trace of a finite locally free morphism of schemes** (construction `AlgebraicGeometry.Scheme.Hom.finiteTrace`). Let π : X → Y be a finite locally free morphism of schemes (Mathlib: AlgebraicGeometry.IsFinite … *API* (on `AlgebraicGeometry.Scheme.Hom`): `finiteTrace, finiteTrace_app_affine, finiteTrace_comp_unit, finiteTrace_baseChange` (+4). *Tests:* `finiteTrace_test_double_cover, finiteTrace_test_ramified, finiteTrace_test_id` (+1). *Source:* Stacks Tag 0BVH, §49.3. *Needs:* R3.59, R3.60, R3.61.

**R3.65 Finite locally free morphisms of adic spaces** (definition `AdicSpace.IsFiniteLocallyFree`). A morphism of adic spaces f : Y → X is finite locally free if it is finite (R0.79) and f_*𝒪_Y is a vector bundle on … *API* (on `AdicSpace`): `IsFiniteLocallyFree, IsFiniteLocallyFree.degree, IsFiniteLocallyFree.comp, IsFiniteLocallyFree.baseChange` (+4). *Tests:* `IsFiniteLocallyFree.test_power_map, IsFiniteLocallyFree.test_closed_point, IsFiniteLocallyFree.test_id_empty` (+1). *Source:* BHW §10.1, Def. 10.2, p. 1789. *Needs:* R0.79, R3.27, R3.29, R0.100, R0.42, R1.21, R0.87.

- **R3.66** Projection formula for finite morphisms. *Source:* BHW §10.1, Def. 10.2.

**R3.67 The trace of a finite locally free morphism of adic spaces** (construction `AdicSpace.finiteTrace`). The trace Tr_f : f_*𝒪_Y → 𝒪_X is the composite of the multiplication map f_*𝒪_Y → ℋom_{𝒪_X}(f_*𝒪_Y … *API* (on `AdicSpace`): `finiteTrace, VectorBundle.trace, finiteTrace_app_affinoid, finiteTrace_comp_unit` (+5). *Tests:* `finiteTrace_test_power_map, finiteTrace_test_ramified, finiteTrace_test_id` (+2). *Source:* BHW §10.1, Def. 10.2, p. 1789. *Needs:* R3.65, R3.59, R3.60, R3.58, R3.27.

- **R3.68** Base change and composition laws for the analytic trace. *Source:* Stacks Tag 0BVH, proof of Lem. 49.3.1.

- **R3.69** Perfect trace pairing and point-count formula for finite étale morphisms. *Source:* KL15 §1.2.

- **R3.70** The analytic trace of an analytified finite locally free morphism is the analytified algebraic trace. *Source:* Stacks Tag 0BVH, §49.3.

**R3.71 Pull–identify–trace operators along correspondences** (construction `AdicSpace.Correspondence`). Given vector bundles (or, on locally noetherian analytic spaces … *API* (on `AdicSpace`): `Correspondence, Correspondence.pullIdentifyTrace, Correspondence.pullIdentifyTrace_id, Correspondence.pullIdentifyTrace_comp` (+4). *Tests:* `Correspondence.test_split, Correspondence.test_identity, Correspondence.test_ramified_count` (+1). *Source:* BHW §10.1, Def. 10.2, p. 1789. *Needs:* R3.67, R3.66, R3.18, R3.68, R3.2, R3.30.

- **R3.72** Almost noetherianity of modules over integral affinoid rings (Kiehl, Anhang Satz 5.1). *Source:* Kiehl-E §5 (Anhang), Satz 5.1.

### Notions this roadmap states for its own use

**R3.73 The Gel'fand spectrum of a Banach ring and Berkovich's formula for the spectral seminorm** (construction). For a complete normed commutative ring A (a Banach ring, not assumed an algebra over a field) the set M(A) of bounded multiplicative seminorms, with the topology of pointwise convergence. M(A) is nonempty when A ≠ 0, compact Hausdorff, and functorial in bounded ring homomorphisms; the spectral seminorm of x ∈ A is lim ‖xⁿ‖^{1/n} = max_{α ∈ M(A)} α(x). API: `GelfandSpectrum`, `compactSpace`, `nonempty_of_nontrivial`, `comap`, `spectralSeminorm_eq_sup`. Tests: M(ℚ_p) is a single point; for a complete nonarchimedean field K the Gauss norm is a point of M(K⟨X⟩) at which the maximum is attained for every f; the spectral seminorm of a nilpotent element is 0 while its norm need not be. *Source:* Berkovich, Spectral theory and analytic geometry over non-Archimedean fields (1990), Thms 1.2.1 and 1.3.1; KL15 Thm 2.3.10.


<a id="r4"></a>

## R4. Étale and pro-étale sites

**R4. Étale and pro-étale sites.** Depends on R0, R1 and AdicEtaleGeometry A1. The layer transports A1's sites to the carriers of R0 and R1 and proves what the consumers need on them: functoriality and slices, the pro-étale site and the morphism ν, the comparison with the rigid étale site, analytification, geometric points and pullback, smooth pairs, and restriction to the complement of a boundary. No site is constructed here and no derived cohomology is defined.


### The étale site on the analytic carriers

**R4.1 The étale site of AdicEtaleGeometry A1 on the analytic carriers of R0 and R1** (comparison). Let X be a locally noetherian analytic adic space (R0.38): every point has an open affinoid neighbourhood Spa(A … *Hypotheses:* X locally noetherian and analytic … *Source:* Huber96 §2.1, p. 109. *Needs:* R0.38, R0.100, R0.42, R0.44, R0.119, R0.48, R0.105, R0.104, R0.101, R0.43, R0.33, `AdicEtaleGeometry:A1/etale-morphisms-local-description-and-comparison`, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`.

### Functoriality and slices

- **R4.2** Base change defines a morphism of étale sites f_ét: X_ét -> Y_ét. *Source:* Huber96 §2.1.

- **R4.3** The étale site of an étale X-space is the slice site: U_ét ≃ X_ét/U. *Source:* Huber96 §2.1.

### Pro-étale site and ν

**R4.4 The corrected pro-étale site of AdicEtaleGeometry A1 on the analytic carriers, and ν: X_proét -> X_ét** (comparison). Let X be a locally noetherian analytic adic space as in R4.1 (Scholze's standing hypothesis: locally Spa(A, A⁺) with A strongly noetherian or with a noetherian ring of definition … *Hypotheses:* X locally noetherian (Scholze 2013 §3) … *Source:* Scholze13 §3, before Def. 3.3, p. 13. *Needs:* R4.1, R0.38, `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `AdicEtaleGeometry:A1`.

- **R4.5** Functoriality of the corrected pro-étale site and compatibility with ν. *Source:* Scholze13 §3, after Prop. 3.12.

- **R4.6** The pro-étale site of an open subspace is the slice site: U_proét ≃ X_proét/U. *Source:* Scholze13 §3, Lem. 3.10 (iii).

### Rigid comparison

**R4.7 Huber 2.1.4: the étale topos of a rigid analytic variety is the étale topos of its adic space** (comparison). Then the functor r: X_ét^rig -> r(X)_ét into the étale site of R4.1 induces an equivalence of topoi ρ_X: Sh(r(X)_ét) ≃ Sh(X_ét^rig) (Huber Proposition 2.1.4) … *Hypotheses:* X any rigid analytic variety (not necessarily quasi-separate … *Source:* Huber96 §2.1, Prop. 2.1.4, p. 111. *Needs:* R4.1, R4.8, R4.2, R1.31, R1.36, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`.

- **R4.8** Strongly surjective rigid étale families are exactly those with jointly surjective adic image (Huber 2.1.2). *Source:* Huber96 §2.1, Def. 2.1.1 and Lem. 2.1.2 with proof.

### Analytification

**R4.9 The morphism of sites X^ad_ét -> X_ét for a scheme X locally of finite type over k** (comparison). Let k be a complete nonarchimedean field and X a scheme locally of finite type over k, with analytification X^ad = X ×_{Spec k} Spa(k, k°) (R1.15). *Hypotheses:* X locally of finite type over the complete nonarchimedean fi … *Source:* Huber96 §1.7, Cor. 1.7.3, pp. 85-86. *Needs:* R1.15, R1.25, R1.13, R1.20, R1.14, R4.1.

### Geometric points and pullback

**R4.10 Geometric points of A1 as points of the étale site, and their compatibility with pullback** (comparison). Let X be a locally noetherian analytic adic space. A geometric point of X (AdicEtaleGeometry:A1/etale-site-and-geometric-points) is a morphism ξ: Spa(C … *Hypotheses:* X locally noetherian analytic … *Source:* Huber96 §2.1, p. 109. *Needs:* R4.1, R4.2, R4.4, R4.5, R0.42, R0.108, R0.48, R0.119, R0.43, R0.112, R0.114, `AdicEtaleGeometry:A1/etale-site-and-geometric-points`, `AdicEtaleGeometry:A1/pro-etale-site-corrected`.

### Smooth pairs

**R4.11 Smooth pairs: a smooth adic space with a strict normal crossings divisor** (definition `AdicSpace.SmoothPair`). Let K be a complete nonarchimedean field and B^n_K := Spa(K⟨T_1, ..., T_n⟩, K°⟨T_1, ... … *API* (on `AdicSpace`): `SmoothPair, SmoothPair.Chart, SmoothPair.complement, SmoothPair.j` (+9). *Tests:* `SmoothPair.test_punctured_disc, SmoothPair.test_empty_boundary, SmoothPair.test_three_lines_not_pair` (+2). *Source:* DLLZ-RH §2.1, Ex. 2.1.2, p. 10. *Needs:* R0.99, R0.45, R0.100, R0.101, R0.104, R0.121, R0.117.

- **R4.12** Analytification of an algebraic strict normal crossings pair is a smooth pair. *Source:* Huber96 §1.7, Cor. 1.7.3.

### Restriction to the boundary complement

**R4.13 Restriction of the étale and pro-étale sites of a smooth pair to its boundary complement** (construction `AdicSpace.SmoothPair.complementEtale`). (b) the functors on sheaves of sets and of abelian groups j^{-1}F = F|_U with (j^{-1}F)(V) = F(V) for V ∈ U_ét … *API* (on `AdicSpace.SmoothPair`): `complementEtale, etaleSiteComplementEquiv, jEtale, jInv` (+9). *Tests:* `SmoothPair.test_restriction_empty_boundary, SmoothPair.test_jShriek_global_sections_disc, SmoothPair.test_j_not_quasicompact` (+2). *Source:* DLLZ-A §2.3, Ex. 2.3.16, p. 16. *Needs:* R4.11, R4.1, R4.2, R4.3, R4.6, R4.5, R0.101.


<a id="r5"></a>

## R5. Families and sousperfectoid spaces

**R5. Families and sousperfectoid spaces.** Depends on R0, R3, AdicEtaleGeometry A1 and PerfectoidSpaces P1–P3. Sousperfectoid rings, their stability under rational localisation and finite étale extension, uniformity (the library's `IsUniform.isReduced` gives the reducedness clause) and sheafiness; sousperfectoid spaces; the product of a perfectoid space with a smooth rigid space, its sheafiness and its tilde-limit presentation; completed coefficient algebras and coefficient sheaves with their base-change and dense-restriction properties.


### Sousperfectoid rings

**R5.1 Sousperfectoid Tate rings and perfectoid frames** (definition `Huber.PerfectoidFrame`). Fix a prime p. Let R be a complete Hausdorff Tate ring (tauceti:TauCeti.Huber.IsTateRing) in which p is topological … *API* (on `Huber`): `PerfectoidFrame, IsSousperfectoid, IsSousperfectoid.of_frame, IsSousperfectoid.of_isPerfectoidTateRing` (+11). *Tests:* `IsSousperfectoid.test_padic_tateAlgebra, IsSousperfectoid.test_padic_tateAlgebra_not_perfectoid, IsSousperfectoid.test_dualNumbers` (+3). *Source:* Berkeley Lecture 6, §6.3, Def. 6.3.1, p. 47. *Needs:* `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`.

### Stability of the class

- **R5.2** Topologically split injections are stable under completed base change (Hansen-Kedlaya Remark 7.2). *Source:* HK §7, Rem. 7.2.

- **R5.3** Sousperfectoid rings are uniform. *Source:* HK §7, Def. 7.1.

- **R5.4** Rational localisations of sousperfectoid rings are sousperfectoid (Berkeley 6.3.3(1)). *Source:* Berkeley Lecture 6, §6.3, Prop. 6.3.3(1).

- **R5.5** Finite étale algebras over sousperfectoid rings are sousperfectoid (Berkeley 6.3.3(2), HK 7.5(a)). *Source:* Berkeley Lecture 6, §6.3, Prop. 6.3.3(2).

- **R5.6** Descent of the sousperfectoid property along faithfully flat finite étale maps (HK 7.5(b)). *Source:* HK §7, Lem. 7.5.

**R5.7 Tate algebras over sousperfectoid rings are sousperfectoid (Berkeley 6.3.3(3), HK Lemma 7.3)** (theorem). Then R⟨T_1, ..., T_n⟩ (tauceti:TauCeti.Huber.restrictedMvPowerSeriesCompletion) is sousperfectoid: for a frame (R̃, ι, σ) of R, the perfectoid Tate ring R̃⟨T_1^{1/p^∞}, ... … *Hypotheses:* R sousperfectoid; the case n = 0 is trivial. *Source:* Berkeley Lecture 6, §6.3, Prop. 6.3.3(3), p. 47. *Needs:* R5.1, R0.23, `PerfectoidSpaces:P1`.

- **R5.8** Laurent algebras and annuli over sousperfectoid rings are sousperfectoid. *Source:* HK §7, Lem. 7.3.

- **R5.9** Finite extensions of Q_p are sousperfectoid. *Source:* HK §7, Rem. 7.8.

### Stable uniformity and sheafiness

**R5.10 Sousperfectoid pairs are stably uniform (Berkeley 6.3.4)** (theorem). Then (R, R⁺) is stably uniform: for every rational subset U ⊆ Spa(R, R⁺), O(U) is uniform (Hansen-Kedlaya Definition 3.13; anchor Layer 4.2). *Hypotheses:* R complete Tate sousperfectoid … *Source:* Berkeley Lecture 6, §6.3, Prop. 6.3.4, p. 48. *Needs:* R5.4, R5.3, R3.34, `PerfectoidSpaces:P2`.

- **R5.11** Sousperfectoid pairs are sheafy, strongly sheafy and O-acyclic. *Source:* BHW §3.1, Prop. 3.3.

### Sousperfectoid spaces

**R5.12 Sousperfectoid adic spaces** (definition `AdicSpace.IsSousperfectoid`). An adic space X (anchor Layer 5: an object of Huber's category 𝒱 covered by affinoid adic spaces) is sousperfectoid … *API* (on `AdicSpace`): `IsSousperfectoid, IsSousperfectoid.spa, IsSousperfectoid.of_perfectoidSpace, IsSousperfectoid.restrict` (+7). *Tests:* `IsSousperfectoid.test_closedDisc_Qp, IsSousperfectoid.test_perfectoid, IsSousperfectoid.test_dualNumbers` (+2). *Source:* BHW §3.1, Def. 3.2(3), p. 1724. *Needs:* R5.1, R5.11, R5.4, `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`.

- **R5.13** Étale spaces over a sousperfectoid space are sousperfectoid adic spaces. *Source:* Berkeley Appendix to Lecture 19, §19.5.

- **R5.14** Sousperfectoid spaces are stably adic. *Source:* KL15 §8.2, Def. 8.2.19.

- **R5.15** Base change of étale maps to locally noetherian spaces along sousperfectoid spaces. *Source:* Berkeley Lecture 7, §7.5, after Def. 7.5.1.

### Perfectoid times smooth

- **R5.16** Perfectoid space times a polydisc: sousperfectoid, not perfectoid. *Source:* BHW §3.1, proof of Cor. 3.4.

**R5.17 The product X ×_L Y of a perfectoid space and a smooth rigid space (BHW Corollary 3.4)** (construction `AdicSpace.perfectoidTimesSmooth`). Then the fibre product X ×_L Y := X ×_{Spa(L, O_L)} Y exists in the category of adic spaces and is a sousperfectoid … *API* (on `AdicSpace`): `perfectoidTimesSmooth, perfectoidTimesSmooth.fst, perfectoidTimesSmooth.snd, perfectoidTimesSmooth.isPullback` (+7). *Tests:* `perfectoidTimesSmooth_test_point, perfectoidTimesSmooth_test_polydisc, perfectoidTimesSmooth_test_not_perfectoid` (+2). *Source:* BHW §3.1, Cor. 3.4, p. 1724. *Needs:* R5.16, R5.15, R5.12, R0.117, R0.99, R0.40, `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces`, `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`.

- **R5.18** Products with a smooth space preserve tilde-limits (BHW Corollary 3.5). *Source:* BHW §3.1, Cor. 3.5.

### Coefficient algebras

**R5.19 Profinite flat modules over the ring of integers of a p-adic field** (definition `Huber.IsProfiniteFlat`). Let E be a finite extension of Q_p … Then the topology of M is profinite, every open submodule has finite index … *API* (on `Huber`): `IsProfiniteFlat, IsProfiniteFlat.pi, IsProfiniteFlat.pseudobasis, IsProfiniteFlat.finite_quotient` (+3). *Tests:* `IsProfiniteFlat.test_powerSeries, IsProfiniteFlat.test_zero_and_O, IsProfiniteFlat.test_torsion` (+2). *Source:* CHJ §6.1, Def. 6.1(2), p. 46.

- **R5.20** Pseudobases of profinite flat modules (CHJ Proposition 6.2). *Source:* CHJ §6.1, Prop. 6.2.

**R5.21 Small Z_p-algebras** (definition `Huber.IsSmallZpAlgebra`). A small Z_p-algebra (CHJ §1.4) is a ring R that is reduced, p-torsion-free and finite as an algebra over Z_p[[X_1 … *API* (on `Huber`): `IsSmallZpAlgebra, IsSmallZpAlgebra.topology, IsSmallZpAlgebra.isNoetherianRing, IsSmallZpAlgebra.isProfiniteFlat` (+2). *Tests:* `IsSmallZpAlgebra.test_iwasawa, IsSmallZpAlgebra.test_Zp, IsSmallZpAlgebra.test_nonreduced` (+2). *Source:* CHJ §1.4, p. 7. *Needs:* R5.19.

**R5.22 The mixed completed tensor product V ⊗̂ M (CHJ §6.1)** (construction `Huber.mixedTensorInt`). For an O-module X define X ⊗̂ M := lim_i (X ⊗_O M/I_i) … *API* (on `Huber`): `mixedTensorInt, mixedTensorOfLattice, mixedTensor, mixedTensor.latticeIndep` (+7). *Tests:* `mixedTensor_test_tateAlgebra_powerSeries, mixedTensor_test_not_algebraic, mixedTensor_test_unbounded_lattice` (+2). *Source:* CHJ §6.1, Def. 6.3, p. 46. *Needs:* R5.19, R5.21.

- **R5.23** The product formula X ⊗̂ M ≅ ∏_I X̂ (CHJ Proposition 6.4). *Source:* CHJ §6.1, Prop. 6.4.

- **R5.24** Exactness of - ⊗̂ M (CHJ Corollary 6.5). *Source:* CHJ §6.1, Cor. 6.5(1).

- **R5.25** Rational and integral coefficient sheaves agree: O_X ⊗̂ M = (O_X⁺ ⊗̂ M)[1/ϖ] on reduced affinoids. *Source:* CHJ §6.1, Cor. 6.5(2).

- **R5.26** Finite projective base change of mixed tensors (CHJ Lemma 6.7). *Source:* CHJ §6.1, Lem. 6.7.

### Coefficient sheaves

**R5.27 The coefficient sheaf R = O_X ⊗̂ R on an affinoid rigid space (CHJ §6.3)** (construction `AdicSpace.coefficientSheaf`). On the site of rational subsets of X with finite rational covers, define R(U) := O_X(U) ⊗̂ R. *API* (on `AdicSpace`): `coefficientSheaf, coefficientSheaf.isSheaf, coefficientSheaf.obj_eq, coefficientSheaf.banach` (+6). *Tests:* `coefficientSheaf_test_Zp, coefficientSheaf_test_disc_powerSeries, coefficientSheaf_test_not_structure_sheaf_of_product` (+2). *Source:* CHJ §6.3, p. 50. *Needs:* R5.22, R5.24, R5.21, R5.25.

**R5.28 The localisation functor Loc for R-modules (CHJ Definition 6.14, Proposition 6.16)** (construction `AdicSpace.Loc`). Let X be affinoid rigid over a complete nonarchimedean extension K of Q_p, R small … *API* (on `AdicSpace`): `Loc, Loc.obj_apply, Loc.isSheaf, Loc.functor` (+4). *Tests:* `Loc_test_free, Loc_test_quotient_T, Loc_test_fully_faithful` (+1). *Source:* CHJ §6.3, Def. 6.14, p. 51. *Needs:* R5.33, R5.31, R5.30, R5.27.

**R5.29 Coherent R-modules (CHJ Definition 6.18)** (definition `AdicSpace.IsCoherentCoefficient`). Let K be a discretely valued complete extension of Q_p, X affinoid rigid over K, R small. *API* (on `AdicSpace`): `IsCoherentCoefficient, IsCoherentCoefficient.of_Loc, IsCoherentCoefficient.kernel, IsCoherentCoefficient.restrict` (+2). *Tests:* `IsCoherentCoefficient.test_Loc, IsCoherentCoefficient.test_glued_line_bundle, IsCoherentCoefficient.test_not_coherent`. *Source:* CHJ §6.3, Def. 6.18, p. 52. *Needs:* R5.28.

- **R5.30** R(U) is noetherian over a discretely valued base (CHJ Lemma 6.13(1)). *Source:* CHJ §6.3, Lem. 6.13.

- **R5.31** Rational restriction maps of R are flat (CHJ Lemma 6.13(2)). *Source:* CHJ §6.3, Lem. 6.13.

- **R5.32** Finite rational covers give faithfully flat maps (CHJ Lemma 6.13(3)). *Source:* CHJ §6.3, Lem. 6.13(3).

**R5.33 Tate acyclicity for the coefficient sheaf (CHJ Proposition 6.15)** (theorem). Let K be a complete nonarchimedean extension of Q_p (not necessarily discretely valued), X affinoid rigid over K and R small. *Hypotheses:* X affinoid, K ⊇ Q_p. The unit balls are open bounded lattice … *Source:* CHJ §6.3, Prop. 6.15, p. 52. *Needs:* R5.27, R5.23, R3.2, R3.16, `DiamondsAndVStacks:D0`.

- **R5.34** Local equalizers for the integral and rational coefficient sheaves. *Source:* CHJ §6.3, Prop. 6.15.

- **R5.35** Density of restriction for Laurent covers (CHJ Lemma 6.19). *Source:* CHJ §6.3, Lem. 6.19(2).

**R5.36 Kiehl's theorem for coherent R-modules (CHJ Theorem 6.20)** (theorem). Let K be a discretely valued complete extension of Q_p, X affinoid rigid over K, R small, and F a coherent R-module on X (R5.29). *Hypotheses:* K discretely valued, K ⊇ Q_p … *Source:* CHJ §6.3, Thm 6.20, p. 53. *Needs:* R5.29, R5.28, R5.33, R5.35, R5.32, R5.30, R3.16.

- **R5.37** Base change of coefficient sheaves to C (CHJ Lemma 6.21). *Source:* CHJ §6.3, Lem. 6.21.

- **R5.38** Affinoid coefficient algebras: O_X ⊗̂_{Q_p} S is the structure sheaf of a product (CHJ Remark 6.22). *Source:* CHJ §6.3, Rem. 6.22.

**R5.39 Reduction of étale coverings to rational and finite étale coverings on a stable basis (Kedlaya-Liu 8.2.20-8.2.21)** (theorem). Then every covering of and by elements of B has P. (ii) Let F be a presheaf of abelian groups on X_ét such that … *Hypotheses:* Kedlaya-Liu state this for preadic spaces over an analytic f … *Source:* KL15 §8.2, Prop. 8.2.20, p. 163. *Needs:* R3.7, R3.4, R0.25, `AdicEtaleGeometry:A1`.

**R5.40 Vector bundles on the étale site of an affinoid with a stable basis (Kedlaya-Liu 8.2.22(c),(d))** (theorem). Let X = Spa(A, A⁺) with (A, A⁺) a complete Tate sheafy pair, and let B be a stable basis of X_ét as in R5.39. *Hypotheses:* (A, A⁺) sheafy; B a stable basis (closed under fibre product … *Source:* KL15 §8.2, Thm 8.2.22(c), p. 165. *Needs:* R5.39, R3.30, R3.9, R3.32, R3.29.

- **R5.41** Tilde-limits are stable under base change along morphisms locally of weakly finite type (Huber Remark 2.4.3(ii)). *Source:* Huber96 §2.4, Rem. 2.4.3 (ii).

- **R5.42** Rational localisations of reduced affinoid algebras are reduced, and preserve A⁺ = A° (KL Lemma 2.5.9(c),(d)). *Source:* KL15 §2.5, Lem. 2.5.9.

### Notions this roadmap states for its own use

**R5.43 The affinoid criterion for tilde-limits** (theorem). Let X_n = Spa(A_n, A_n⁺) be a filtered inverse system of affinoid adic spaces with adic transition maps, and X = Spa(A, A⁺) with compatible maps X → X_n such that colim A_n → A has dense image and A⁺ is the closure of the integral closure of the image of colim A_n⁺. Then |X| → lim |X_n| is a homeomorphism and X ∼ lim X_n (every open affinoid of X that lies over some X_n and is the preimage of a rational subset is identified with the completed pullback). Hypotheses: all pairs complete; transition maps adic; dense image; A⁺ as stated. *Source:* Scholze–Weinstein, Moduli of p-divisible groups (Camb. J. Math. 1, 2013), Def. 2.4.1, Prop. 2.4.2; Huber96 (2.4.1)–(2.4.2).


<a id="f1"></a>

## F1. Dagger geometry and overconvergent de Rham complexes

**F1. Dagger geometry and overconvergent de Rham complexes.** Depends on R0–R4. Overconvergent Tate algebras and their Weierstrass theory; dagger algebras with the comparison to their completions, approximation and finiteness statements; fringe presentations and the fringe topology; dagger tensor products and rational localisation; weak completions and algebras of Monsky–Washnitzer type; affinoid dagger spaces, Tate acyclicity and the G-topology; dagger spaces, coherent modules and strict neighbourhoods; the dagger–rigid comparison; differentials and the overconvergent de Rham complex; supports, compact support and duality; finiteness (Grosse-Klönne's Theorems A and C) and Künneth; logarithmic and compact-support complexes for smooth pairs.


### Overconvergent power series

- **F1.1** Tate algebras of polydiscs of radius rho are affinoid, and shrinking the radius is injective with dense image. *Source:* GK00 §1, 1.1.

**F1.2 The Monsky–Washnitzer algebra W_n = K⟨X_1, …, X_n⟩† of overconvergent power series** (construction `Dagger.washnitzerAlgebra`). For n ∈ ℕ define W_n = K⟨X_1, …, X_n⟩† := ⋃_{ρ>1} T_n(ρ) ⊆ K[[X_1, …, X_n]] … *API* (on `Dagger`): `washnitzerAlgebra, mem_washnitzerAlgebra_iff, mem_washnitzerAlgebra_iff_exists_bound, mem_washnitzerAlgebra_iff_exists_mem_gamma` (+10). *Tests:* `washnitzerAlgebra_test_geometric, washnitzerAlgebra_test_not_mem_lacunary, washnitzerAlgebra_test_radii_in_gamma` (+2). *Source:* GK00 §1, 1.2, p. 3. *Needs:* F1.1.

- **F1.3** Weierstrass division and preparation in W_n, and distinguishedness after an automorphism. *Source:* GK00 §1, 1.3 (i).

- **F1.4** W_n is a noetherian factorial Jacobson ring and every ideal of W_n is strictly closed. *Source:* GK00 §1, 1.4 (1).

- **F1.5** W_n → T_n is faithfully flat, bijective on maximal ideals with equal residue fields, and W_n is regular of dimension n. *Source:* GK00 §1, Prop. 1.5.

### Dagger algebras

**F1.6 Dagger algebras over a complete nonarchimedean field** (definition `Dagger.IsDaggerAlgebra`). Let K be a field complete for a nontrivial nonarchimedean absolute value |.| of rank one (in Lean: NontriviallyNorm … *API* (on `Dagger`): `IsDaggerAlgebra, IsDaggerAlgebra.washnitzerAlgebra, IsDaggerAlgebra.quotient, IsDaggerAlgebra.of_finite` (+10). *Tests:* `IsDaggerAlgebra_test_laurent, IsDaggerAlgebra_test_trivial, IsDaggerAlgebra_test_polynomial` (+3). *Source:* GK00 §1, 1.2, p. 3. *Needs:* F1.2, F1.4, R0.53, R0.55.

- **F1.7** Noether normalisation for dagger algebras and finiteness of residue fields. *Source:* GK00 §1, 1.4 (2).

- **F1.8** Residue norms on dagger algebras and automatic continuity of morphisms. *Source:* GK00 §1, Prop. 1.6 (1).

**F1.9 A dagger algebra and its completion: faithful flatness, points, completed local rings, reducedness and regularity, supremum norm** (theorem). Then: (1) τ is faithfully flat and m ↦ τ^{-1}(m) is a bijection Max(Â) → Max(A) with isomorphic residue fields … *Hypotheses:* A a K-dagger algebra. K complete … *Source:* GK00 §1, Thm 1.7 (1), p. 5. *Needs:* F1.5, F1.8, F1.6, R0.56, F1.71.

- **F1.10** Dagger algebras are weakly complete; elements of A^int with reduction 1 are units. *Source:* GK00 §1, 1.9.

- **F1.11** Finite algebras over a dagger algebra are dagger algebras. *Source:* GK00 §1, Lem. 1.10.

**F1.12 Finiteness, surjectivity, injectivity and strictness of morphisms of dagger algebras are detected on completions** (theorem). Then: (a) φ is surjective (resp. bijective) iff φ̂ is; (b) the following are equivalent: (i) φ is finite, (ii) φ̂ is finite … *Hypotheses:* φ : A → B a morphism of K-dagger algebras. *Source:* GK00 §1, Thm 1.12 (b), p. 7. *Needs:* F1.11, F1.9, F1.8, F1.10, F1.3, R0.59, `TC:LinearMap.isStrictMap_of_module_finite`.

**F1.13 Approximation of solutions and of morphisms from the completion (Bosch's rigid Artin approximation)** (theorem). Then there are morphisms γ_A : A_1 → A_2 and γ_B : B_1 → B_2 with γ_B ∘ p_1 = p_2 ∘ γ_A, and for given ε > 0 and a Banach norm on Â_2, γ_A can be chosen with |γ̂_A − φ_A| < ε … *Hypotheses:* K complete, nontrivially and nonarchimedeanly valued … *Source:* GK00 §1, Prop. 1.13, p. 8. *Needs:* F1.12, F1.9, F1.6, F1.10.

- **F1.14** Reduced dagger algebras are integrally closed in their completions; A is a domain iff Â is. *Source:* GK00 §1, Prop. 1.14 (1).

### Fringe presentations and the fringe topology

**F1.15 Fringe (radius-indexed) presentations of a dagger algebra** (construction `Dagger.FringePresentation`). A fringe presentation of A consists of n ∈ ℕ … Then A = colim_{ρ → 1+} A_ρ as K-algebras … *API* (on `Dagger`): `FringePresentation, FringePresentation.exists, FringePresentation.stage, FringePresentation.transition` (+8). *Tests:* `FringePresentation_test_washnitzer, FringePresentation_test_field, FringePresentation_test_dependence` (+2). *Source:* GK00 §1, Lem. 1.8, p. 6. *Needs:* F1.6, F1.1, F1.4, F1.2, F1.8.

- **F1.16** Morphisms of dagger algebras respect fringe systems (independence of fringe presentations). *Source:* GK00 §1, Lem. 1.8.

**F1.17 The fringe (direct limit) topology on dagger algebras and their finite modules** (construction `Dagger.fringeTopology`). Let K be a field complete for a nontrivial nonarchimedean absolute value |.| of rank one (in Lean: NontriviallyNorm … *API* (on `Dagger`): `fringeTopology, fringeTopology_independent, continuous_of_fringe, fringeTopology_le_affinoid` (+4). *Tests:* `fringeTopology_test_field, fringeTopology_test_not_affinoid, fringeTopology_test_restriction` (+1). *Source:* GK00 §4, 4.2, p. 19. *Needs:* F1.15, F1.16, F1.18, F1.8.

- **F1.18** Finite modules and their morphisms descend to a fringe stage. *Source:* GK00 §2, Lem. 2.15 (1).

### Tensor products and rational localisation

**F1.19 The dagger (overconvergent completed) tensor product A_1 ⊗†_B A_2** (construction `Dagger.tensor`). Define A_1 ⊗†_B A_2 as the image of W_{n_1+n_2} = K⟨X … *API* (on `Dagger`): `tensor, tensor.lift, tensor.lift_comp_inl, tensor.hom_ext` (+7). *Tests:* `tensor_test_washnitzer, tensor_test_base, tensor_test_not_naive` (+2). *Source:* GK00 §1, 1.16, p. 9. *Needs:* F1.6, F1.10, F1.9, F1.16, F1.11, R0.21.

**F1.20 Rational localisation A⟨f/g⟩† of a dagger algebra and its universal property** (construction `Dagger.rationalLocalization`). Define A⟨f/g⟩† := A⟨X_1, …, X_m⟩†/(gX_i − f_i)_{i≤m} (A⟨X⟩† from F1/dagger-tensor-product). *API* (on `Dagger`): `rationalLocalization, rationalLocalization.algebraMap, rationalLocalization.lift, rationalLocalization.lift_comp_algebraMap` (+6). *Tests:* `rationalLocalization_test_annulus, rationalLocalization_test_trivial, rationalLocalization_test_not_algebraic` (+2). *Source:* GK00 §1, 1.18, p. 9. *Needs:* F1.19, F1.6, F1.10, F1.9.

### Weak completions and algebras of Monsky–Washnitzer type

**F1.21 The integral Monsky–Washnitzer algebra O_K⟨X_1, …, X_n⟩† = W_n ∩ O_K[[X]]** (construction `Dagger.intWashnitzerAlgebra`). Define O_K⟨X_1..X_n⟩† := W_n ∩ O_K[[X_1..X_n]], the overconvergent power series with coefficients in O_K … *API* (on `Dagger`): `intWashnitzerAlgebra, mem_intWashnitzerAlgebra_iff, mem_intWashnitzerAlgebra_iff_degree, intWashnitzerAlgebra_eq_intSubring` (+5). *Tests:* `intWashnitzerAlgebra_test_geometric, intWashnitzerAlgebra_test_zero, intWashnitzerAlgebra_test_not_mem` (+1). *Source:* vdP §2, p. 35. *Needs:* F1.2, F1.6, F1.9, F1.3, F1.5, F1.72.

**F1.22 The Monsky–Washnitzer weak completion S† of a finitely generated O_K-algebra** (construction `Dagger.weakCompletion`). The dagger algebra attached to S is A† := S† ⊗_{O_K} K (F1/weak-completion-generic-fibre). *API* (on `Dagger`): `weakCompletion, mem_weakCompletion_iff, weakCompletion_eq_range, weakCompletion_independent` (+8). *Tests:* `weakCompletion_test_laurent, weakCompletion_test_finite, weakCompletion_test_not_completion` (+2). *Source:* Kedlaya01 §2, p. 2. *Needs:* F1.21.

- **F1.23** Presentation, noetherianity and reduction of a weak completion. *Source:* vdP §2, (2.2).

- **F1.24** Weak completeness and the universal property of the weak completion. *Source:* vdP §2, (2.1).

- **F1.25** The generic fibre S† ⊗ K of a weak completion is a dagger algebra with completion Ŝ ⊗ K. *Source:* GK02 Introduction.

**F1.26 Dagger algebras of Monsky–Washnitzer type** (definition `Dagger.IsMWType`). Let O_K be a complete discrete valuation ring with uniformiser π … *API* (on `Dagger`): `IsMWType, IsMWType.reduction, IsMWType.reduction_eq, IsMWType.of_smooth` (+5). *Tests:* `IsMWType_test_washnitzer, IsMWType_test_field, IsMWType_test_not_regular` (+2). *Source:* Kedlaya06 §3.2, Def. 3.2.1. *Needs:* F1.6, F1.25.

**F1.27 Lifting morphisms of smooth reductions to weak completions (van der Put 2.4.4 (ii))** (theorem). Then every k-algebra homomorphism f : A_0 → C_0 lifts to an O_K-algebra homomorphism F : A → C (F mod π = f). *Hypotheses:* O_K a complete DVR of mixed characteristic (0, p). *Source:* vdP §2, (2.4.4) (ii), p. 37. *Needs:* F1.24, F1.23, F1.21.

**F1.28 Existence and uniqueness of dagger algebras of MW-type with a given smooth reduction** (theorem). Then (a) there is a smooth finitely generated O_K-algebra B with B/πB ≅ A_0 (Elkik) … *Hypotheses:* O_K a complete DVR of mixed characteristic (0, p). *Source:* vdP §2, p. 35. *Needs:* F1.27, F1.23, F1.25, F1.26.

### Affinoid dagger spaces

**F1.29 Affinoid subdomains of the maximal spectrum of a dagger algebra** (definition `Dagger.IsAffinoidSubdomain`). Let A be a K-dagger algebra (K is a field complete … Then B is unique up to unique isomorphism and Sp(π) : Sp(B) → … *API* (on `Dagger`): `IsAffinoidSubdomain, IsAffinoidSubdomain.algebra, IsAffinoidSubdomain.lift, IsAffinoidSubdomain.maximalSpectrum_equiv` (+6). *Tests:* `IsAffinoidSubdomain_test_weierstrass, IsAffinoidSubdomain_test_whole, IsAffinoidSubdomain_test_open_disc` (+2). *Source:* GK00 §2, 2.1, p. 9. *Needs:* F1.20, F1.19, F1.7, F1.6.

- **F1.30** Affinoid subdomains, stalks, open immersions and Runge immersions agree with their completions. *Source:* GK00 §2, 2.2.

**F1.31 Tate acyclicity for dagger algebras** (theorem). Let A be a K-dagger algebra (K is a field complete for a nontrivial nonarchimedean absolute value |.| of rank one (in Lean: NontriviallyNormedField K, IsUltrametricDist K … *Hypotheses:* A a K-dagger algebra. a finite covering of Sp(A) by affinoid … *Source:* GK00 §2, Prop. 2.6, p. 11. *Needs:* F1.29, F1.30, F1.20, F1.3.

- **F1.32** The G-topology of an affinoid dagger space is that of its completion; affinoid subdomains form a basis. *Source:* GK00 §2, 2.7.

### Dagger spaces, coherent modules and strict neighbourhoods

**F1.33 Dagger spaces (rigid spaces with overconvergent structure sheaf)** (definition `DaggerSpace`). The affinoid dagger space of a dagger algebra A is Sp(A) := (Sp(Â), O†_A) with O†_A(R(f/g)) = A⟨f/g⟩†. *API* : `DaggerSpace, DaggerSpace.Hom, DaggerSpace.Sp, DaggerSpace.Sp_fullyFaithful` (+8). *Tests:* `DaggerSpace_test_disc, DaggerSpace_test_point, DaggerSpace_test_not_full_sheaf` (+2). *Source:* GK00 §2, 2.12, p. 12. *Needs:* F1.20, F1.31, F1.32, F1.9, F1.8, F1.19, R1.7, R1.31, R0.42.

**F1.34 Coherent modules on dagger spaces** (definition `DaggerSpace.tilde`). Let X be a K-dagger space. For an affinoid X = Sp(A) and an A-module M … *API* (on `DaggerSpace`): `tilde, IsCoherent, IsCoherent.tilde, IsCoherent.kernel` (+4). *Tests:* `IsCoherent_test_skyscraper, IsCoherent_test_zero, IsCoherent_test_not_coherent` (+1). *Source:* GK00 §2, 2.14, p. 12. *Needs:* F1.33, F1.31, F1.32, F1.29, R3.15.

**F1.35 Coherent modules on affinoid dagger spaces come from finite modules (dagger Kiehl theorem)** (theorem). Then there are a finite A-module M and an isomorphism F ≅ M ⊗ O_X; the functor M ↦ M ⊗ O_X is an equivalence between finite A-modules and coherent O_X-modules … *Hypotheses:* X = Sp(A) affinoid. F coherent. *Source:* GK00 §2, Thm 2.16, p. 13. *Needs:* F1.34, F1.18, F1.30, F1.31, R3.16.

**F1.36 Theorems A and B for affinoid dagger spaces** (theorem). Then F is generated by its global sections and H^n(X, F) = 0 for all n ≥ 1. *Hypotheses:* X = Sp(A) affinoid. F coherent. *Source:* GK00 §3, Prop. 3.1, p. 17. *Needs:* F1.35, F1.31, F1.32.

**F1.37 Strict neighbourhoods of affinoids and the cofinal fringe system** (definition `DaggerSpace.IsStrictNeighbourhood`). Let K be a field complete for a nontrivial nonarchimedean absolute value |.| of rank one (in Lean: NontriviallyNorm … *API* (on `DaggerSpace`): `IsStrictNeighbourhood, isStrictNeighbourhood_iff_closure, IsStrictNeighbourhood.inter, IsStrictNeighbourhood.mono` (+5). *Tests:* `IsStrictNeighbourhood_test_discs, IsStrictNeighbourhood_test_whole, IsStrictNeighbourhood_test_self` (+2). *Source:* GK00 §2, 2.22, p. 15. *Needs:* F1.15, F1.33, R1.7, R1.31.

- **F1.38** Overconvergent sections are sections extending to a strict neighbourhood. *Source:* GK00 §2, 2.23.

**F1.39 Relative compactness, partially proper and proper morphisms, and Stein spaces for dagger spaces** (definition `DaggerSpace.RelCompact`). Let f : X = Sp(A) → Y = Sp(B) be a morphism of affinoid K-dagger spaces and U ⊆ X an affinoid subdomain. *API* (on `DaggerSpace`): `RelCompact, IsPartiallyProper, IsProper, IsStein` (+4). *Tests:* `IsStein_test_open_disc, IsPartiallyProper_test_point, IsPartiallyProper_test_closed_disc` (+1). *Source:* GK00 §2, 2.24, p. 15. *Needs:* F1.33, F1.29, F1.37, F1.9, F1.34, R0.65, R0.61, R1.7, R1.31.

### The dagger–rigid comparison

**F1.40 The comparison functor from dagger spaces to rigid spaces** (construction `DaggerSpace.toRigidFunctor`). Let K be a field complete for a nontrivial nonarchimedean absolute value |.| of rank one (in Lean: NontriviallyNorm … *API* (on `DaggerSpace`): `toRigidFunctor, toRigidFunctor.faithful, toRigid_Sp, toRigid.structureInclusion` (+6). *Tests:* `toRigid_test_disc, toRigid_test_not_full, toRigid_test_point` (+2). *Source:* GK00 §2, Thm 2.19, p. 14. *Needs:* F1.33, F1.34, F1.9, F1.12, F1.14, F1.30, F1.13, F1.20, R1.7, R1.31, R1.9, R3.15, R3.16, R1.4.

**F1.41 On partially proper dagger spaces coherent modules are those of the associated rigid space** (theorem). Then the functor (·)' : coh(O†_X) → coh(O_{X'}) of F1/dagger-to-rigid-functor is an equivalence of categories, and Γ(X, M) = Γ(X', M') for every coherent O†_X-module M. *Hypotheses:* X partially proper (F1/dagger-partially-proper) … *Source:* GK00 §2, Thm 2.26, p. 15. *Needs:* F1.40, F1.38, F1.39, F1.35, F1.37, R3.15.

**F1.42 Partially proper dagger spaces are equivalent to partially proper rigid spaces** (theorem). The functor (·)' of F1/dagger-to-rigid-functor restricts to an equivalence between the category of partially proper K-dagger spaces and the category of partially proper rigid space … *Hypotheses:* partial properness over Sp(K) (F1/dagger-partially-proper). *Source:* GK00 §2, Thm 2.27, p. 16. *Needs:* F1.41, F1.39, F1.40, F1.38, R0.65, R1.7.

**F1.43 Coherent cohomology of partially proper dagger spaces equals that of the associated rigid space** (theorem). Then H^i(X, F) = H^i(X', F') for all i ≥ 0. If X is a Stein space, these groups vanish for i > 0. *Hypotheses:* X partially proper, quasi-separated. F coherent. *Source:* GK00 §3, Thm 3.2, p. 17. *Needs:* F1.41, F1.36, F1.38, F1.39, R3.23.

**F1.44 Dagger analytification of schemes of finite type** (construction `DaggerSpace.analytification`). Let K be a field complete for a nontrivial nonarchimedean absolute value |.| of rank one (in Lean: NontriviallyNorm … *API* (on `DaggerSpace`): `analytification, analytification_toRigid, analytification.map, analytification.isPartiallyProper` (+4). *Tests:* `analytification_test_line, analytification_test_point, analytification_test_not_affinoid` (+2). *Source:* GK00 §3, 3.3, p. 18. *Needs:* F1.42, F1.43, F1.39, R1.9, R1.7, R3.55.

- **F1.45** Identity principle on connected smooth dagger spaces. *Source:* Conrad-IC §2.1, Lem. 2.1.4.

### Differentials and the overconvergent de Rham complex

**F1.46 The module of (universally finite) differentials Ω^1_A of a dagger algebra and the exterior derivative** (construction `Dagger.Omega`). Let A be a K-dagger algebra (K is a field complete for a nontrivial nonarchimedean absolute value |.| of rank one ( … *API* (on `Dagger`): `Omega, Omega.d, Omega.lift, Omega.lift_comp_d` (+11). *Tests:* `Omega_test_annulus, Omega_test_field, Omega_test_not_kaehler` (+2). *Source:* GK00 §4, 4.1, p. 19. *Needs:* F1.2, F1.4, F1.6, F1.19, F1.20, F1.34, F1.23, R0.93, R3.36.

**F1.47 Smooth dagger spaces** (definition `DaggerSpace.IsSmooth`). X has pure dimension n if dim O_{X,x} = n at every point; then ω_X := Ω^n_X. *API* (on `DaggerSpace`): `IsSmooth, isSmooth_iff_affinoid, IsSmooth.locallyEtale, IsSmooth.omega_locallyFree` (+4). *Tests:* `IsSmooth_test_polydisc, IsSmooth_test_point, IsSmooth_test_node` (+1). *Source:* GK00 §4, 4.1, p. 19. *Needs:* F1.33, F1.46, F1.9, F1.40, F1.13, R0.99, R0.117, R1.31.

**F1.48 The overconvergent de Rham complex of a smooth dagger space, with coefficients in a module with integrable connection** (construction `DaggerSpace.deRhamComplex`). The de Rham cohomology is the hypercohomology H^i_dR(X, E) := H^i(X, DR(E)) on the site of X … *API* (on `DaggerSpace`): `deRhamComplex, IntegrableConnection, IntegrableConnection.deRhamComplex, deRham` (+6). *Tests:* `deRham_test_disc, deRham_test_point, deRham_test_rigid_disc` (+2). *Source:* GK00 §4, 4.1, p. 19. *Needs:* F1.46, F1.47, F1.34, F1.36, F1.40, F1.33.

- **F1.49** De Rham cohomology of dagger polyannuli and the relative Poincaré lemma. *Source:* GK02 §2, Lem. 2.1 (a).

**F1.50 De Rham cohomology of a smooth partially proper dagger space equals that of its rigid space (and fails to for affinoids)** (theorem). Then the natural map H^i_dR(X) → H^i_dR(X') is an isomorphism for all i. The partial properness hypothesis cannot be dropped: for the closed unit disc … *Hypotheses:* X smooth and partially proper. *Source:* GK00 §3, 3.3, p. 18. *Needs:* F1.48, F1.43, F1.49, F1.39, F1.47.

**F1.51 De Rham cohomology of a smooth dagger space depends only on its rigid space** (theorem). Then φ induces an isomorphism φ† : H^*_dR(X_2) → H^*_dR(X_1). (Grosse-Klönne states without proof in the source that φ ↦ φ† is compatible with composition … *Hypotheses:* char K = 0. X_1, X_2 smooth. φ an isomorphism of rigid space … *Source:* GK02 §1, Lem. 1.18, p. 14. *Needs:* F1.49, F1.13, F1.48, F1.19, F1.40, F1.12, F1.37.

- **F1.52** Strictness and closed image of de Rham differentials on smooth affinoid and Stein dagger spaces. *Source:* GK00 §4, Lem. 4.7.

### Supports, compact support and duality

**F1.53 De Rham cohomology with supports in the complement of an admissible open** (construction `DaggerSpace.deRhamSupport`). For a sheaf F on X let Γ_Y(F) = ker(F → j_*j^{-1}F) and RΓ_Y its right derived functor … *API* (on `DaggerSpace`): `deRhamSupport, deRhamSupport.triangle, deRhamSupport.excision, deRhamSupport.mayerVietoris` (+3). *Tests:* `deRhamSupport_test_disc, deRhamSupport_test_empty, deRhamSupport_test_not_cohomology_of_Y` (+1). *Source:* GK02 §1, 1.15, p. 11. *Needs:* F1.48, F1.33, F1.47.

- **F1.54** Local cohomology of the de Rham complex along closed subspaces: algebraic versus topological supports, Gysin isomorphism and independence of the embedding. *Source:* GK02 §1, Prop. 1.16 (a).

**F1.55 Compactly supported coherent and de Rham cohomology of affinoid and Stein dagger spaces** (construction `DaggerSpace.compactSupport`). For a coherent O†_X-module F choose (after shrinking ρ_0) a coherent O_{X_{ρ_0}}-module F_{ρ_0} with F(X) = colim_ρ … *API* (on `DaggerSpace`): `compactSupport, compactSupportDeRham, compactSupport_independent, compactSupport.longExact` (+4). *Tests:* `compactSupport_test_disc, compactSupport_test_point, compactSupport_test_not_ordinary` (+2). *Source:* GK00 §4, 4.3, p. 19. *Needs:* F1.53, F1.15, F1.18, F1.16, F1.37, F1.48, F1.34, F1.39.

**F1.56 Serre duality for smooth affinoid dagger spaces** (theorem). Then for 0 ≤ i ≤ d there is a pairing Ext^i_{O_X}(F, ω_X) × H^{d−i}_c(X, F) → K, functorial in F, inducing topological isomorphisms Ext^i_{O_X}(F, ω_X) ≅ Hom_{K,cont}(H^{d−i}_c(X … *Hypotheses:* K spherically complete. X smooth affinoid of pure dimension … *Source:* GK00 §4, Thm 4.4, p. 20. *Needs:* F1.55, F1.17, F1.47, F1.35, F1.34.

**F1.57 Poincaré duality for de Rham cohomology of smooth affinoid and smooth Stein dagger spaces** (theorem). Let K be discretely valued of characteristic 0, and (for the strictness and finiteness inputs … *Hypotheses:* K the fraction field of a complete DVR of mixed characterist … *Source:* GK00 §4, Thm 4.9, p. 22. *Needs:* F1.56, F1.55, F1.52, F1.65, F1.48, F1.39.

### Finiteness

- **F1.58** Resolution of a closed subspace of a smooth affinoid dagger space to a normal crossings divisor. *Source:* GK02 §0, Lem. 0.1.

- **F1.59** Trace on de Rham complexes for finite étale morphisms of smooth dagger spaces. *Source:* GK02 §1, 1.14.

- **F1.60** Long exact sequence of de Rham cohomology with supports for a proper modification. *Source:* GK02 §1, Cor. 1.17.

**F1.61 De Rham cohomology of tubes in a strictly semistable formal scheme (Grosse-Klönne's Theorem C)** (theorem). Then for every nonempty J ⊆ I the restriction H^*_dR(]Y_J[^†) → H^*_dR(]Y_J − (Y_J ∩ ⋃_{i∈I−J} Y_i)[^†) is bijective. *Hypotheses:* R complete DVR of mixed characteristic. *Source:* GK02 §2, Thm 2.4, p. 18. *Needs:* F1.51, F1.49, F1.53, F1.33, F1.47, R2.6, R2.9, R2.12.

**F1.62 Finiteness of de Rham cohomology of tubes in a quasi-compact strictly semistable formal scheme** (theorem). Then for every J ⊆ I and q ∈ ℕ, dim_K H^q_dR(]Y_J[^†_𝔛) < ∞, and dim_K H^q_dR(𝔛^†) < ∞. *Hypotheses:* R complete DVR of mixed characteristic. *Source:* GK02 §2, Thm 2.5, p. 20. *Needs:* F1.61, F1.49, F1.51, F1.25, F1.53.

- **F1.63** De Rham cohomology of dagger spaces commutes with finite extensions of the base field. *Source:* GK02 §1, 1.13.

- **F1.64** Finiteness of the de Rham invariants h^dR_q of quasi-algebraic affinoid dagger spaces. *Source:* GK02 §3, Thm 3.4.

**F1.65 Finiteness of de Rham cohomology of smooth quasi-compact dagger spaces (Grosse-Klönne's Theorem A), and base change to finite extensions** (theorem). Then T = X − (U ∪ Z) has finite-dimensional de Rham cohomology: dim_K H^q_dR(T) < ∞ for all q. *Hypotheses:* R complete DVR of mixed characteristic (0 … *Source:* GK02 Introduction, Thm A, p. 2. *Needs:* F1.64, F1.58, F1.54, F1.53, F1.59, F1.60, F1.62, F1.13, F1.63, F1.44, R2.6, R2.15, F1.77.

**F1.66 Künneth formula for de Rham cohomology of smooth dagger spaces** (theorem). Then the cup-product maps ⊕_{p+q=n} H^p_dR(X) ⊗_K H^q_dR(Y) → H^n_dR(X × Y) are isomorphisms for all n. *Hypotheses:* K discretely valued of characteristic 0. X, Y smooth. *Source:* GK00 §4, Thm 4.12, p. 22. *Needs:* F1.65, F1.52, F1.19, F1.46, F1.48, F1.17, F1.53.

### Smooth pairs: logarithmic and compact-support complexes

**F1.67 Strict normal crossings divisors on smooth dagger spaces (smooth dagger pairs)** (definition `DaggerSpace.IsSNCDivisor`). Let X be a smooth K-dagger space (K is a field complete for a nontrivial nonarchimedean absolute value |.| of rank … *API* (on `DaggerSpace`): `IsSNCDivisor, isSNCDivisor_iff_toRigid, IsSNCDivisor.exists_coordinates, IsSNCDivisor.components` (+5). *Tests:* `IsSNCDivisor_test_axes, IsSNCDivisor_test_empty, IsSNCDivisor_test_cusp` (+1). *Source:* Stacks Tag 0BI9, Def. 41.21.1. *Needs:* F1.47, F1.34, F1.40, F1.13, R4.11, R1.31.

**F1.68 The logarithmic de Rham complex Ω^•_X(log D) along a strict normal crossings divisor** (construction `DaggerSpace.logOmega`). The sheaf Ω^1_X(log D) ⊆ j_*Ω^1_{X−D} is the O†_X-submodule generated locally, in coordinates with D = V(x_1⋯x_r) … *API* (on `DaggerSpace`): `logOmega, logOmega_basis, logDeRhamComplex, logDeRhamComplex.incl` (+7). *Tests:* `logDeRham_test_polydisc, logDeRham_test_empty, logDeRham_test_not_meromorphic` (+2). *Source:* Stacks Tag 0FMU, Def. 50.15.3. *Needs:* F1.67, F1.48, F1.46, F1.40.

**F1.69 The boundary-vanishing (compact-support) logarithmic de Rham complex Ω^•_X(log D)(−D)** (construction `DaggerSpace.compactLogDeRhamComplex`). The compact-support logarithmic de Rham complex is the subcomplex Ω^•_X(log D)(−D) := I_D · Ω^•_X(log D) of Ω^•_X(l … *API* (on `DaggerSpace`): `compactLogDeRhamComplex, compactLogDeRhamComplex_le, compactLogDeRham, compactLogDeRhamComplex_restrict` (+4). *Tests:* `compactLogDeRham_test_P1, compactLogDeRham_test_empty, compactLogDeRham_test_naive_twist` (+1). *Source:* Stacks Tag 0FMU, proof of Lem. 50.15.2. *Needs:* F1.68, F1.67, F1.48, F1.34.

- **F1.70** Localisation sequences for boundary-vanishing log de Rham complexes and for compactly supported cohomology. *Source:* Stacks Tag 0FMU, proof of Lem. 50.15.2.

- **F1.71** Dagger algebras (and affinoid algebras) are excellent in characteristic 0. *Source:* GK00 §1, proof of Thm 1.7 (3).

- **F1.72** The integral Monsky–Washnitzer algebra O_K⟨X_1, …, X_n⟩† is noetherian (O_K a DVR). *Source:* Kedlaya06 §2.4, after Lem. 2.4.1.

- **F1.73** The integral subring of a dagger algebra of MW-type is a Monsky–Washnitzer lift. *Source:* Kedlaya06 §3.2, after Def. 3.2.1.

- **F1.74** A locally closed immersion of affinoid rigid spaces is Runge over a finite rational covering (BGR 7.3.5/1). *Source:* GK00 §2, proof of Prop. 2.5.

- **F1.75** Trace maps for the projection X × Y → Y with X smooth and proper (Grosse-Klönne, Finiteness, Proposition 1.11). *Source:* GK02 §1, Prop. 1.11.

- **F1.76** Independence of the embedding for de Rham cohomology with supports, and the invariants h^dR_q (Grosse-Klönne, Finiteness, 1.12–1.13). *Source:* GK02 §1, Cor. 1.12.

### Notions this roadmap states for its own use

**F1.77 De Jong's strictly semistable alteration theorem** (theorem). Let O_K be a complete discrete valuation ring with fraction field K and X a proper scheme over O_K with integral generic fibre of dimension d. There exist a finite extension K′/K with valuation ring O_{K′}, a projective strictly semistable scheme X′ over O_{K′} (regular, with special fibre a reduced strict normal crossings divisor) and a proper surjective generically finite morphism X′ → X ×_{O_K} O_{K′} (an alteration). Hypotheses: O_K complete discretely valued; X proper and flat over O_K with integral generic fibre. *Source:* de Jong, Smoothness, semi-stability and alterations, Publ. Math. IHÉS 83 (1996), Thm 6.5.


## Sources

- **Huber94**: Roland Huber, *A generalization of formal schemes and rigid analytic varieties*, Math. Z. 217 (1994), 513–551; Göttingen Digitisation Centre scan (PPN266833020_0217, article LOG_0038) with its OCR text; formula passages. <https://gdz.sub.uni-goettingen.de/id/PPN266833020_0217>
- **Huber96**: Roland Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces*, Aspects of Mathematics E30, Vieweg 1996 (not freely available); the review. <https://link.springer.com/book/10.1007/978-3-663-09991-8>
- **Wedhorn**: Torsten Wedhorn, *Adic Spaces*, arXiv:1910.05934v1 (14 Oct 2019). <https://arxiv.org/abs/1910.05934v1>
- **Hübner**: Katharina Hübner, *Adic spaces*, arXiv:2405.06435v1 (10 May 2024). <https://arxiv.org/abs/2405.06435>
- **Morel**: Sophie Morel, *Adic spaces (lecture notes)*, version of April 22, 2019. <https://web.math.princeton.edu/~smorel/adic_notes.pdf>
- **KL15**: Kiran S. Kedlaya, Ruochuan Liu, *Relative p-adic Hodge theory: Foundations*, arXiv:1301.0792v5 (9 May 2015). <https://arxiv.org/abs/1301.0792>
- **Conrad-AWS**: Brian Conrad, *Several approaches to non-archimedean geometry*, Arizona Winter School 2007 lecture notes. <https://math.stanford.edu/~conrad/papers/aws.pdf>
- **Zavyalov24**: Bogdan Zavyalov, *Some foundational results in adic geometry*, arXiv:2409.15516v2 (17 Jul 2025). <https://arxiv.org/abs/2409.15516>
- **Berkeley**: Peter Scholze, Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, Annals of Mathematics Studies 207 (2020); PDF from the author's page. <https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf>
- **EGA I**: A. Grothendieck, J. Dieudonné, *Éléments de géométrie algébrique I*, Publ. Math. IHÉS 4 (1960). <http://www.numdam.org/item/PMIHES_1960__4__5_0/>
- **HK**: David Hansen, Kiran S. Kedlaya, *Sheafiness criteria for Huber rings*, version dated August 6, 2026. <https://kskedlaya.org/papers/criteria.pdf>
- **Huber93**: Roland Huber, *Continuous valuations*, Math. Z. 212 (1993) 455–477; GDZ OCR (PPN266833020_0212, LOG_0061),. <https://gdz.sub.uni-goettingen.de/id/PPN266833020_0212>
- **EGA III₁**: A. Grothendieck, J. Dieudonné, *Éléments de géométrie algébrique III (première partie)*, Publ. Math. IHÉS 11 (1961); Numdam PDF with its text layer. <http://www.numdam.org/item/PMIHES_1961__11__5_0/>
- **Stacks**: The Stacks Project Authors, *The Stacks Project*, The Stacks project, tag pages. <https://stacks.math.columbia.edu>
- **CHJ**: Przemyslaw Chojecki, David Hansen, Christian Johansson, *Overconvergent modular forms and perfectoid Shimura curves*, arXiv:1507.04875v2 (22 Aug 2016), published in Documenta Math. 22 (2017); printed page numbers of the arXiv PDF. <https://arxiv.org/abs/1507.04875>
- **Zavyalov-Q**: Bogdan Zavyalov, *Quotients of admissible formal schemes and adic spaces by finite groups*, arXiv:2102.02762v2 (7 June 2023); published in Algebra & Number Theory 18(3) (2024) 409–475. <https://arxiv.org/abs/2102.02762>
- **Scholze13**: Peter Scholze, *p-adic Hodge theory for rigid-analytic varieties*, arXiv:1205.3463v2 (3 Nov 2012) (Forum Math. Pi 1 (2013)). <https://arxiv.org/abs/1205.3463>
- **FK**: Kazuhiro Fujiwara, Fumiharu Kato, *Foundations of Rigid Geometry I*, arXiv:1308.4734v5 (28 Feb 2017). <https://arxiv.org/abs/1308.4734>
- **BHW**: Christopher Birkbeck, Ben Heuer, Chris Williams, *Perfectoid Hilbert modular forms and overconvergent Hilbert modular forms*, Annales de l'Institut Fourier 2023. <https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf>
- **dJvdP**: Johan de Jong, Marius van der Put, *Étale cohomology of rigid analytic spaces*, Documenta Mathematica 1 (1996), 1–56; EMS Press PDF,. <https://ems.press/content/serial-article-files/25781>
- **DLLZ-A**: Hansheng Diao, Kai-Wen Lan, Ruochuan Liu, Xinwen Zhu, *Logarithmic adic spaces: some foundational results*, arXiv:1912.09836v2 (30 Oct 2022); PDF page = printed page. <https://arxiv.org/abs/1912.09836>
- **Conrad-IC**: Brian Conrad, *Irreducible components of rigid spaces*, Ann. Inst. Fourier 49 (1999); author PDF irredpaper.pdf,. <https://math.stanford.edu/~conrad/papers/irredpaper.pdf>
- **Conrad-RA**: Brian Conrad, *Relative ampleness in rigid geometry*, Ann. Inst. Fourier 56 (2006) 1049–1126; author PDF amplepaperfinal.pdf (45 pp.),. <https://math.stanford.edu/~conrad/papers/amplepaperfinal.pdf>
- **Conrad-MR**: Brian Conrad, *Modular curves and rigid-analytic spaces*, Pure Appl. Math. Q. 2 (2006); author PDF genpaper.pdf. <https://math.stanford.edu/~conrad/papers/genpaper.pdf>
- **Conrad-Adic**: Brian Conrad, *A brief introduction to adic spaces*, author notes Adicnotes.pdf (22 pp.),. <https://math.stanford.edu/~conrad/papers/Adicnotes.pdf>
- **BL I**: Siegfried Bosch, Werner Lütkebohmert, *Formal and rigid geometry I. Rigid spaces*, Math. Ann. 295 (1993) 291–317; Göttingen Digitisation Centre scan with its OCR text; printed pages 291–312. <https://gdz.sub.uni-goettingen.de/id/PPN235181684_0295>
- **GK00**: Elmar Grosse-Klönne, *Rigid analytic spaces with overconvergent structure sheaf*, arXiv:1408.3329v1 (14 Aug 2014), author's version of J. reine angew. Math. 519 (2000) 73–95, with a footnote to Lemma 4.7 correcting the published hypotheses. <https://arxiv.org/abs/1408.3329>
- **Kedlaya06**: Kiran S. Kedlaya, *Finiteness of rigid cohomology with coefficients*, arXiv:math/0208027v6 (Duke Math. J. 134 (2006) 15–97), with the author's errata file https://kskedlaya.org/papers/finiteness-errata.txt (. <https://arxiv.org/abs/math/0208027>
- **BL II**: Siegfried Bosch, Werner Lütkebohmert, *Formal and rigid geometry II. Flattening techniques*, Math. Ann. 296 (1993) 403–429; Göttingen Digitisation Centre scan with its OCR text. <https://gdz.sub.uni-goettingen.de/id/PPN235181684_0296>
- **GK02**: Elmar Grosse-Klönne, *Finiteness of de Rham cohomology in rigid analysis*, arXiv:1408.3327v1 (author's version of Duke Math. J. 113 (2002)). <https://arxiv.org/abs/1408.3327>
- **TT**: Fucheng Tan, Jilong Tong, *Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case*, arXiv:1510.05543v2,. <https://arxiv.org/abs/1510.05543v2>
- **Scholze15**: Peter Scholze, *On torsion in the cohomology of locally symmetric varieties*, arXiv:1306.2070v2,; published Ann. of Math. 182 (2015) 945–1066. <https://arxiv.org/abs/1306.2070v2>
- **RG**: Michel Raynaud, Laurent Gruson, *Critères de platitude et de projectivité. Techniques de « platification » d'un module*, Invent. Math. 13 (1971) 1–89; GDZ full-text OCR of PPN356556735_0013, physical pages 00000007–00000095 (printed pp. 1–89), accessed 2026-09-26. <https://gdz.sub.uni-goettingen.de/id/PPN356556735_0013>
- **Kiehl-AB**: Reinhardt Kiehl, *Theorem A und Theorem B in der nichtarchimedischen Funktionentheorie*, Invent. Math. 2 (1967) 256–273; Göttingen Digitisation Centre scan with its OCR text. <https://gdz.sub.uni-goettingen.de/id/PPN356556735_0002>
- **Kiehl-E**: Reinhardt Kiehl, *Der Endlichkeitssatz für eigentliche Abbildungen in der nichtarchimedischen Funktionentheorie*, Invent. Math. 2 (1967) 191–214; Göttingen Digitisation Centre scan with its OCR text. <https://gdz.sub.uni-goettingen.de/id/PPN356556735_0002>
- **KL16**: Kiran S. Kedlaya, Ruochuan Liu, *Relative p-adic Hodge theory, II: Imperfect period rings*, arXiv:1602.06899v3 (21 Oct 2019); locators give the printed page numbers of the arXiv PDF. <https://arxiv.org/abs/1602.06899>
- **Scholze-Err**: Peter Scholze, *Erratum to 'p-adic Hodge theory for rigid-analytic varieties'*, three-page author erratum,. <https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf>
- **DLLZ-RH**: Hansheng Diao, Kai-Wen Lan, Ruochuan Liu, Xinwen Zhu, *Logarithmic Riemann-Hilbert correspondences for rigid varieties*, arXiv:1803.05786v4 (30 Oct 2022), J. Amer. Math. Soc. 36 (2023); PDF page = printed page. <https://arxiv.org/abs/1803.05786>
- **ECD**: Peter Scholze, *Étale cohomology of diamonds*, arXiv:1709.07343v4 (14 Apr 2026); locators give the printed page numbers of the arXiv PDF. <https://arxiv.org/abs/1709.07343>
- **GK05**: Elmar Grosse-Klönne, *Frobenius and monodromy operators in rigid analysis, and Drinfel'd's symmetric space*, arXiv:1408.3346v1 (J. Algebraic Geom. 14 (2005) 391–437); formula-heavy passages of the text layer are garbled, so prose passages are quoted. <https://arxiv.org/abs/1408.3346>
- **Vezzani**: Alberto Vezzani, *The Monsky–Washnitzer and the overconvergent realizations*, arXiv:1509.01718v2 (Int. Math. Res. Not. IMRN 2018). <https://arxiv.org/abs/1509.01718>
- **Kedlaya01**: Kiran S. Kedlaya, *Counting points on hyperelliptic curves using Monsky–Washnitzer cohomology*, arXiv:math/0105031v2 (J. Ramanujan Math. Soc. 16 (2001) 323–338). <https://arxiv.org/abs/math/0105031>
- **vdP**: Marius van der Put, *The cohomology of Monsky and Washnitzer*, Mém. Soc. Math. France (N.S.) 23 (1986) 33–59; Numdam scan with its OCR text. <http://www.numdam.org/item/MSMF_1986_2_23__33_0/>
- **Berkovich**: V. G. Berkovich, *Spectral theory and analytic geometry over non-Archimedean fields*, Math. Surveys Monogr. 33, AMS 1990.
- **EGA II**: A. Grothendieck, J. Dieudonné, *Éléments de géométrie algébrique II*, Publ. Math. IHÉS 8 (1961).
- **Deligne–Rapoport**: P. Deligne, M. Rapoport, *Les schémas de modules de courbes elliptiques*, LNM 349 (1973).
- **de Jong**: A. J. de Jong, *Smoothness, semi-stability and alterations*, Publ. Math. IHÉS 83 (1996), 51–93.
- **Scholze–Weinstein 2013**: P. Scholze, J. Weinstein, *Moduli of p-divisible groups*, Camb. J. Math. 1 (2013), 145–237.
