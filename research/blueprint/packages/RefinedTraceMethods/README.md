# Roadmap: refined trace methods

**Summary.** Build cyclic and cyclotomic enhancements of Hochschild homology, the cyclotomic trace and its nilpotent comparison, and the arithmetic filtrations of THH, TC⁻ and TP. The second strand constructs coherent stable Adams operations and relative Hochschild coefficients, even filtrations and q-Hodge comparisons over ku, then refines localizing invariants into nuclear ind-objects. The end comparisons identify trace filtrations with prismatic and syntomic complexes, identify the trace filtration of every framed smooth algebra with its coordinate q-Hodge filtration, recover the Habiro–Hodge complex from cyclonic KU coefficients, and give the rational p-adic Beilinson square.

## Scope and ownership

This roadmap owns cyclic and mixed enhancements, actions of topological groups with their parametrized Tate constructions, cyclotomic spectra with their genuine and Cartier descriptions, THH of E₁-rings and of stable categories with its Frobenius, TC and the trace comparison theorems. It also owns the Snaith comparison, coherent stable Adams lifts and relative Hochschild structures for the q-Hodge constructions, the spectral extension of the solid even filtration, continuous localizing motives and refined trace invariants. It owns the framed smooth comparison (§6.10): for every étale-framed smooth algebra over every base of §6.1 and in every relative dimension, the graded pieces of the even filtration on TC⁻ over ku form the coordinate q-Hodge filtration; it also owns the q-divided powers of the diagonal and the framed Čech resolution that prove this, the framed trace pair and its E∞-structure. The arithmetic layers add to the imported perfectoid, quasisyntomic and prismatic trace comparisons the descent, cotangent-filtration, décalage, Segal, convergence and Adams-operation statements, the characteristic-p and K-theoretic syntomic sheaves, and the Beilinson square for associative rings. The roadmap also owns the free E₁ form of Bökstedt periodicity (§2.7), the Witt-vector description of π₀TR and representation-graded TR (§2.14), connective and nonconnective K-theory of small stable infinity categories (§4.9), rigidity of the trace for henselian pairs with finite coefficients together with Gabber's rigidity (§4.17), and the K(1)-local sphere with its Adams fixed-point description (§6.8).

[BordismFormalGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/BordismFormalGroups/README.md) §F6.5 owns the Borel model of spectra with an action of a finite group: homotopy orbits and fixed points, the norm and its Tate cofiber, the induced-object tensor ideal, the lax symmetric monoidal Tate functor with `can`, restriction, transfer and residual quotient actions. Its §F6.1 owns Bousfield localization at a spectrum. §2.1 here extends the Borel model to topological groups, and §6.8 applies Bousfield localization at KU/p. [AInfCohomology](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1044) §AI.7.2 owns the circle Tate construction and its p-complete comparison with residual finite Tate constructions, the Tate orbit lemma, the spectral Tate diagonal, THH of connective E∞-rings with its cyclotomic Frobenius, TC⁻ and TP, the Bökstedt spectral sequence and Bökstedt periodicity for 𝔽_p and perfectoid rings, the perfectoid and relative Breuil–Kisin trace coefficients over 𝕊[z], quasisyntomic unfolding with its Nygaard filtration, and the crystalline and AΩ trace comparisons. [PrismaticCohomologyPartIII](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1070) §7.0 owns the absolute trace–prismatic comparison with gr^nTC⁻, gr^nTP and gr^nTC≃ℤ_p(n)[2n], the p-completed linear cyclic theory with gr^nHC⁻ and gr^nHP, the rational Beilinson square for commutative rings and the prismatic Beilinson square of AMMN Theorem 6.17 with its map χ_n; [CohomologyComparisons](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1064) §3.7 records that square. Those constructions are imported, not planned again here. NoncommutativeGeometry N1 owns cyclic cochains and cyclic cohomology of complex and locally convex algebras with Connes' B and the SBI sequence; Layer 1 here is the chain-level and derived theory over an arbitrary commutative ground ring.

DGAInfinity Layers 6, 8 and 9 supply ordinary DG derived Morita theory, ordinary Hochschild chains and cochains with normalization, and the degree-zero Hochschild Chern character. Those constructions and their ordinary Morita theorem are not targets here. The cyclic bar, precyclic cone, mixed Morita comparison, graded cyclic HKR and the circle-equivariant universal property below add structures or comparisons to those supplied objects. AlgebraicVectorBundles Layers 0–2 supply algebraic vector bundles. [TopologicalKTheory](https://github.com/TauCetiProject/TauCetiRoadmap/pull/894) T1–T5 owns finite-rank topological bundles, their K-rings and relative groups, space-level representability, complex Bott periodicity, splitting, exterior powers and degree-zero Adams operations. [CharacteristicClasses](https://github.com/TauCetiProject/TauCetiRoadmap/pull/896) C3, C5 and C6 owns topological Chern classes, the cohomology of BU and the rational Chern character. Consume those constructions with the same tautological-line convention β=[H]−1 and x=c₁(H). [GeneralizedCohomology G5.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GeneralizedCohomology/README.md) owns the commutative spectral rings ku and KU, their connective-cover and Bott-localization comparisons, and their coefficients and agreement with the bundle theory. Layer 5 adds the Snaith E∞ comparison and coherent localized Adams lifts; these are additional comparisons and operations on those supplied spectra. OrthogonalSpinGroups and SpinRepresentations supply their algebraic Clifford results. OperatorTheory's analytic nuclear operators are different from trace-class maps in a presentable monoidal category.

StableHomotopyKTheory supplies spectra, smash products, operadic ring and module objects, Postnikov towers and completion. EnhancedDerivedSheaves supplies coherent higher categories, stable and presentable categories, Ind constructions and animation. In particular E5:presentability.4 already owns absolute dualizable presentable categories, compact morphisms, symmetric trace-class maps and symmetric rigid categories. Layer 4 uses these objects and extends them to relative E-modules, ordered E₁ duality and continuous localizing motives; their absolute definitions are not reconstructed. GeneralAlgebraicKTheory supplies concrete connective and nonconnective K on rings and on exact, Waldhausen, Frobenius and DG models, with relative K-theory and products; its §13.6 confines derived invariance to those enhanced models. §4.9 here constructs K-theory of arbitrary small stable infinity categories by the stable S-construction and the suspension delooping, and compares it with those models; no universal property defines a replacement for the concrete K spectrum. KTheoryLowDegrees supplies abstract special λ-rings, their Adams polynomials and the identification of classical K₂ with π₂K. K2SymbolsBrauer Layer 13 supplies Dennis–Stein symbols and van der Kallen's relative K₂ of dual numbers. CrystallineCohomology owns de Rham–Witt complexes.

DerivedDeRhamCohomology, AInfCohomology and PrismaticCohomology own their respective cohomology objects and intrinsic filtrations. HabiroRings supplies perfectly covered Λ-rings, Habiro-complete modules and solid spectra with their completed tensor product, relative Habiro rings with completed base change, the étaleness of 𝒪_F[1/Δ] over ℤ for disc(F) | Δ and the identification of its relative Habiro ring with the Habiro ring of the number field (its HR.1, HR.2 and HR.5, the last two statements in §§5.8–5.9). HabiroCohomologyFoundations supplies the global q-de Rham complex with its framed Koszul models (Layer 1), the derived q-de Rham complex (Layer 2), the q-de Rham–Witt and twisted q-de Rham complexes with their fracture squares and Nygaard filtrations (Layer 3), and the category of q-Hodge pairs, the q-Hodge complex, the framed coordinate pair, Habiro descent and the identification of the Habiro–Hodge complex of an étale algebra with its relative Habiro ring (Layer 4, §§4.1, 4.4, 4.8 and 4.17–4.23), exported together in its §4.28; its §5.26 supplies the finite-coefficient q-Hodge pairs. The trace comparisons consume those objects without defining a second copy, and no construction here uses a trace statement of HabiroCohomologyFoundations. The applications that need both sides, namely trace q-Hodge pairs as a functor on spherical inputs, their Habiro descent, the comparison of trace pairs with the canonical algebraic pairs and the number-field exports, belong to HabiroCohomologyFoundationsPartII, which builds on this roadmap (see Downstream consumers).

The henselian extension of the nilpotent comparison is §4.17, with its consequences continuity of K modulo p (§4.18) and the K-theoretic Beilinson square (§9.4). Real topological K-theory enters only through the 2-complete fixed points (KU₂)^{hC₂} of §6.8. Equivariant topological K-theory, Atiyah–Segal completion and a general theory of p-adic stable Adams operations are outside the complex coefficient construction. Genuine finite-family circle spectra needed for the cyclonic coefficient calculation are constructed explicitly below.

The atlas roadmaps named as suppliers below precede this one: none of the cited sections of HabiroRings, HabiroCohomologyFoundations Layers 1–5, K2SymbolsBrauer, KTheoryLowDegrees, GeneralAlgebraicKTheory or StableHomotopyKTheory uses this roadmap. AInfCohomology, PrismaticCohomology (Parts I–III) and CohomologyComparisons also precede this one; their trace sections are imported in Layers 2, 8 and 9. KTheoryFiniteLocalFields, GeneralAlgebraicKTheoryPartII and ChromaticHomotopyTheory build on Layers 1–5 here; the notions they share with this roadmap are the ones constructed in §§2.7, 2.14, 4.9, 4.17 and 6.8.

## Conventions

Work with coherent infinity categories and mapping spaces; an equality of maps in a higher category means a specified homotopy with its required coherences. Fix universes and regular cardinals before forming presheaf, Ind, pro or motive categories. A functor called accessible comes with a cardinal bound. “Compact” means preservation of all filtered colimits by its mapping spectrum. Strongly continuous functors preserve colimits and have colimit-preserving right adjoints.

Use homological grading for mixed complexes and spectra: b has degree −1, B has degree +1, and πₙ(ΣX)=πₙ₋₁X. Derived de Rham and syntomic complexes are also written cohomologically when customary, with Hⁱ(C)=π₋ᵢ(C); C[1] corresponds to suspension under this dictionary. Every tensor involving spectra or derived categories is derived. Ordinary algebraic formulas are identified as such. A mixed complex may be unbounded in both directions. The coefficient u in cyclic totalizations has degree −2; products, direct sums and the filtered Laurent completion are distinguished.

The cyclic rotation τₙ is unsigned and has order n+1. Only tₙ=(−1)ⁿτₙ enters the signed Connes formulas. For differential forms the integral antisymmetrization ε and projection π satisfy πε=n!; the strict rational mixed map is π/n!, not ε on raw chains. A cyclic shuffle correction is retained when a product must commute with B.

Write T for the topological circle. In a residual action identify T/Cₘ with T by z↦zᵐ; the corresponding identification for the Prüfer group is fixed similarly. Finite norms are unshifted; the circle norm is ΣXₕT→XʰT. Integral cyclotomic spectra have a T-action and one Frobenius for every prime. Distinguish the Cₚ∞-equivariant p-typical category from the T-equivariant single-prime category used for Cartier modules; their TC comparison is p-adic. The sphere's cyclotomic Frobenius is the canonical map through homotopy fixed points.

K is connective algebraic K-theory, IK is the concrete nonconnective theory, and Kinv=fib(IK→TC). KU and ku are complex topological K-theory spectra; β has degree 2. Use β=[H]−1 on S², x=c₁(H), and q−1=βt for the chosen complex orientation t of degree −2. Completions in rings such as Z[β][[t]] are graded completions: in any fixed total degree retain exactly the allowed infinite series, rather than an ungraded Laurent product.

For a prime p, F(R;Zₚ)=F(R)^∧ₚ and F(R;Qₚ)=F(R)^∧ₚ[1/p]. Complete before inverting p. All p-adic derived complexes use derived p-completion. The quasisyntomic site used for the BMS cover calculations has p-complete rings with bounded p-power torsion and p-completed cotangent amplitude [0,1] homologically. In §8.7, the larger p-quasisyntomic domain means bounded p-power torsion and L_(R/Z)⊗^L_R R/p of cohomological Tor-amplitude [−1,0], without p-completeness. For example Z belongs to the latter domain. Neither site is the site over one chosen prism. Nygaard completion and Hodge completion are distinct operations. An uncompleted derived de Rham object is not replaced by its Hodge completion in the graded Beilinson square.

A refined invariant takes values in a nuclear ind-category; its realization map is part of the construction. Do not identify an ind-object with its realized colimit. The locally rigid sequential construction and the general rationally indexed trace-class envelope have separate size hypotheses. Monoidal statements over an E₁ coefficient use ordered left/right modules; symmetry requires an explicit E₂ or commutative refinement.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use `CategoryTheory.SimplicialObject`, `AlgebraicTopology.alternatingFaceMapComplex` and `AlgebraicTopology.normalizedMooreComplex` for the underlying simplicial chain constructions. The normalized Moore complex is the kernel model; identify it naturally with the degeneracy quotient when using normalized cyclic chains. `ChainComplex`, `HomologicalComplex.Hom.comm`, `HomologicalComplex₂.total`, flatness, tensor products and Tor supply ordinary algebraic bookkeeping, with explicit choices of sum or product totalization for unbounded objects. `KaehlerDifferential`, `ExteriorAlgebra.exteriorPower`, `Algebra.Smooth`, `Algebra.Etale` and `DividedPowerAlgebra` supply ordinary algebraic carriers and tests; they do not supply derived HKR or mixed-complex equivalences.

Use `AddCommGroup`, additive homomorphisms and natural-number scalar multiplication for classical Cartier structures. Use `Nat.factorization` and `Nat.factorization_pow` for high-powered integers. `MvPolynomial`, `Ideal.Quotient.mk`, `Ideal.Quotient.lift`, `LaurentPolynomial.C` and `LaurentPolynomial.T` supply the ordinary uv quotient and its evaluation maps. `WittVector`, `WittVector.frobenius` and `WittVector.verschiebung` fix Witt conventions; the graded TR comparison remains a spectral theorem.

Mathlib's `tateCohomology` supplies algebraic Tate groups. Tau Ceti's `Rep.FiniteCyclicGroup.tateCohomologyIsoEven`, `tateCohomologyIsoOdd` and `periodicIso` supply the two parity calculations and their periodicity in `TauCeti.RepresentationTheory.Homological.TateCohomology.Periodic`. The Eilenberg–Mac Lane/Tate comparison is constructed here and uses all three, with πᵢ=Ĥ⁻ⁱ. Mathlib's light condensed abelian groups and modules supply abelian carriers, not light solid spectra or the spectral even site.

### From the foundational and neighboring roadmaps

The following are precise inputs, not assumptions that the indicated higher theories already exist in Mathlib.

- **EnhancedDerivedSheaves E0, E1, E3 and E5.** Supply coherent functors, limits, colimits, slices, restricted straightening, adjunctions and Kan extensions; enhanced derived categories and derived tensor; presentable stable monoidal infinity categories, algebra/module objects, compact and Ind objects, accessible monoidal localizations, animation and its polynomial left-Kan universal property. The specific accessible cyclotomic t-structure and its completeness are constructed in §3.4 from the connective lax equalizer; they are not an additional generic t-structure theorem assumed from E5. Supply stable Verdier quotients and their Ind mapping and monoidal universal properties before the finite-action specialization in §2.3. E5:spectra-comparison supplies the symmetric monoidal module equivalence Mod_(HR)(Sp)≃D(R); E5:animation.4 (`animatedToCAlg`) supplies the rational comparison of animated rings with connective commutative algebra objects. The latter is used only over Q, not to identify arbitrary positive-characteristic E∞ algebras with commutative dg algebras.
- **GeneralizedCohomology G2–G3 and G5.4; StableHomotopyKTheory Layers 5 and 7.** GeneralizedCohomology G2.1–G2.8 supplies pointed homotopy, native spectra, coherent ring/module objects, suspension and Eilenberg–Mac Lane comparisons; G3.8–G3.9 supplies spectral limits, Postnikov covers and completion. G5.4 supplies the commutative ku/KU models and their agreement with TopologicalKTheory. StableHomotopyKTheory Layer 5 supplies the concrete/abstract operadic comparisons; §§7.6–7.11 supplies Moore transitions, homotopy limits of towers and Milnor sequences, §§7.12–7.20 completion, §§7.21–7.23 rationalization and arithmetic fracture, and §§7.24–7.29 filtered spectra, their spectral sequences and convergence. Its §§7.31–7.34 supply products on mod-ℓ^ν homotopy and the compatible multiplicative Moore/Burklund quotient towers. The bimodule factorization of sufficiently separated transitions used in §7.8 is the separate source-specific factorization target there; it is not inferred merely from the existence of these towers. A quotient HZ/m or an underlying Moore spectrum without this multiplicative tower is insufficient.
- **[TopologicalKTheory T1.6, T2.1, T2.3, T2.5, T3, T4 and T5.1](https://github.com/TauCetiProject/TauCetiRoadmap/pull/894).** Supply the actual variable-rank bundle category and its existing `TauCeti.SplitK0` K-ring, pullbacks, relative and suspension groups with external products, the Z×BU comparison, Bott equivalences, flag injection, special λ-structure and integral degree-zero Adams operations. Its T2.5 includes ψᵏβ=kβ and ψᵏψˡ=ψᵏˡ; it does not supply a periodic integral spectrum endomorphism when k is not a unit. Use the GeneralizedCohomology G5.4 comparison to these groups and products; no second Grothendieck completion is constructed. **[CharacteristicClasses C3, C5 and C6.2–C6.3](https://github.com/TauCetiProject/TauCetiRoadmap/pull/896)** supplies the integral Chern classes and rational character, including the completed-even target for general compact bases and the rational isomorphism on finite CW pairs. Its oriented fundamental-class generator is distinguished from x=c₁(H); for H=O(−1) on CP¹, x is the negative of the positive complex generator.
- **DGAInfinity Layers 6, 8, 9.** Supply the ordinary DG Hochschild and Morita input described under scope, with tensor/Koszul conventions and the Hattori–Stallings degree-zero character. The mixed, cyclic and circle enhancements below compare back to these exact ordinary objects.
- **GeneralAlgebraicKTheory §§3.2, 3.12–3.14, Layers 5–8 and §§10.10–10.11, 11.15–11.16, 12.10, 13.1 and 13.6–13.7.** Supply functorial K of rings, the concrete S-construction, Bass/Frobenius nonconnective K, relative fibers, unitization, excision failures, model-based Morita invariance and products. The extension to arbitrary small stable infinity categories is constructed in §4.9 and compared with these models there. **KTheoryLowDegrees §§3.2–3.7** supplies pre-λ and special λ structures, Newton Adams operations, their ring property and composition; its §13.3 identifies classical K₂ with π₂ of the plus construction, hence of connective K through GeneralAlgebraicKTheory §§3.12–3.14, and §§13.2–13.4 compare the relative K₁ and K₂ boundaries for a surjection of rings. **K2SymbolsBrauer §§13.1, 13.7, 13.12 and 13.13** supply the Dennis–Stein symbols ⟨a,b⟩ for 1−ab a unit; classical relative K₂(A,I) with its exact sequence to K₂(A) and K₂(A/I); generation of K₂(A,I) by the symbols ⟨a,s⟩ with s∈I when I²=0 in a commutative ring A; and, for a commutative ring R with 2 invertible, van der Kallen's isomorphism ker(K₂(R[ε])→K₂(R))≅Ω¹_{R/ℤ}, D(aε,b)↦a db.
- **DerivedDeRhamCohomology Layers 0–5 and PD.** Supply cotangent complexes, smooth and regular-quotient formulas, derived exterior/divided powers and the quasisyntomic amplitude condition; filtered and derived completion, Koszul objects; ordinary, derived p-completed and Hodge-completed de Rham complexes with their distinct filtrations; Cartier, crystalline divided-power and A_crys comparisons; general/projective quasisyntomic sites, QRSP covers, completed-cotangent descent and their unfolding formulas. The trace side uses the supplied polynomial-extension and descent universal properties, including the uncompleted derived de Rham filtration where stated.
- **[BordismFormalGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/BordismFormalGroups/README.md) §§F6.1 and F6.5.** §F6.5 supplies, for every finite group G, the Borel category Sp^{BG}, homotopy orbits and fixed points, the norm Nm_G and the Tate cofiber −^{tG}, the stable tensor ideal generated by induced objects with the filtered-colimit formula for the Tate construction, the lax symmetric monoidal Tate functor with its compatible map can, restriction, transfer, and the residual functors −^{hH},−^{tH} to Sp^{B(G/H)} for H normal. §F6.1 supplies Bousfield localization L_E at a spectrum E, its universal property, the localized smash product and Bousfield classes.
- **[AInfCohomology](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1044) AI.0, AI.0:integral, AI.1, AI.3, AI.4 and §AI.7.2.** AI.0–AI.4 supply perfectoid rings, A_inf, θ and its principal kernel, the Breuil–Kisin twist of AI.0:integral; derived décalage Lη, its products, Bockstein recognition, preservation of derived completeness and filtered Beilinson description; the independently constructed AΩ in AI.3 and its Cartier comparison in AI.4. §AI.7.2 supplies, by these names: *Circle actions, homotopy fixed points and Tate constructions* (`AInf.Trace.tate`, with the finite Tate functor `AInf.Trace.tateFinite` for C_p⊂T and its residual action, `AInf.Trace.tateOrbit` and `AInf.Trace.completedTateComparison`, (X^{tT})^∧_p≃(X^{tC_p})^{h(T/C_p)} for bounded-below X); *Spectral Tate diagonal*; *Topological Hochschild homology as a cyclotomic spectrum* for connective E∞-rings, with TC⁻, TP, can and φ; *Relative cyclotomic traces over the sphere polynomial ring*; *Bökstedt spectral sequence*; *Dyer–Lashof operations and the dual Steenrod input*; *Bökstedt periodicity*, π_*THH(𝔽_p)=𝔽_p[u] and π_*THH(R;ℤ_p)=R[u] for perfectoid R; *Perfectoid trace coefficient calculation* (BMS2 Theorem 6.1, Propositions 6.2–6.4); *Quasisyntomic unfolding of the trace coefficient sheaf*, whose unfolded algebra with its Nygaard filtration is written C_A here (D̂_A there); *Absolute trace comparison with AΩ*; *Characteristic-p trace and crystalline comparison*, including the Segal comparison of BMS2 Corollary 8.18; *Relative trace specializations of the sphere polynomial base*; *Relative Breuil–Kisin trace coefficients*, with the unit α in φ(b)=ασ that a monic Eisenstein E requires; and *Relative quasiregular evenness and descent*. **CrystallineCohomology CR.4** supplies de Rham–Witt objects with F,V,R,d.
- **[PrismaticCohomology Layers 0 and 2](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1057), [PrismaticCohomologyPartII Layers 3–5](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1065), and [PrismaticCohomologyPartIII §§6.8–6.9, 6.28, 6.31 and 7.0](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1070).** Supply δ-rings, the δ-structure with δ(x_i) = 0 on polynomial rings and the unique δ-structures on p-completely étale algebras (PrismaticCohomology Layer 0, §0.59); q-PD pairs and the q-PD envelopes `QCrys.envelope` of completely regular sequences, with their flatness, base change and reduction to PD envelopes (PrismaticCohomologyPartII §§5.1–5.8; BS Lemma 16.10); derived prismatic cohomology and quasisyntomic descent, QRSP prisms and regular-quotient envelopes; intrinsic Nygaard completion, Breuil–Kisin twists and divided Frobenius; syntomic complexes with their connectivity and BMS comparison; and discreteness and p-torsion-freeness of the quasisyntomic sheaves Z_p(n) (§6.28, Bhatt–Scholze Theorem 14.1). The incoming BMS comparison contract is the intrinsic prismatic-side normalization on QRSP covers. PrismaticCohomologyPartIII §7.0 supplies the absolute trace–prismatic comparison (noncompleted and Nygaard-completed, with δ-structure, twists, can and divided Frobenius), the graded pieces gr^nTC⁻(R;ℤ_p)≃N^{≥n}Δ̂_R{n}[2n], gr^nTP≃Δ̂_R{n}[2n] and gr^nTC≃ℤ_p(n)(R)[2n] (`gradedTCMinus`, `gradedTP`, `gradedTC`, `gradedTC_can_phi`), the relative trace–prismatic Breuil–Kisin comparison, the p-completed linear cyclic theory HH(R/ℤ;ℤ_p), HC, HC⁻, HP with gr^nHC⁻≃Fil_H^nLΩ̂_R[2n] and gr^nHP≃LΩ̂_R[2n], the rational Beilinson square TC(R;ℚ_p)→TC(R/p;ℚ_p) over HC⁻(R;ℚ_p)→HP(R;ℚ_p) for commutative R with its bounded-denominator relative comparison (`Prismatic.Trace.rationalBeilinson`), and the prismatic Beilinson square with χ_n for p-torsion-free quasisyntomic R (`Prismatic.Beilinson.square`, recorded by CohomologyComparisons §3.7 as `gradedBeilinsonSquare`).
- **VStackSheavesAndLisseCategories VS2.** Supply the light condensed/solid abelian sheaf framework and its monoidal module operations. The spectral light solid extension and its needed duality are explicit targets in §6.2.
- **HabiroRings HR.1, HR.2 and HR.5.** HR.1 supplies perfectly covered Λ-rings (`LambdaRing.IsPerfectlyCovered`, with its faithful-flatness criteria); such rings are torsion free (§1.2). HR.2, with its sections on spherical coefficients and the solid comparison, supplies Habiro-complete modules and Habiro-complete solid spectra with their monoidal completion (`habiroComplete.symmetricMonoidal`, `SpectralHabiroCompletion.tensor`, `SolidHabiroCompletion.unit_idempotent`, `SolidHabiroCompletion.boundedBelow_monoidal`). HR.5 supplies the relative Habiro ring H_{R/A} of an étale A-algebra with completed base change (`HabiroRings.relativeHabiro.baseChangeEquiv`), the classical comparison, the étaleness of 𝒪_F[1/Δ] over ℤ for nonzero Δ with disc(F) | Δ (§5.8, `etale_localization_away_discr`) and the ℤ[q]-algebra isomorphism of H_{𝒪_F[1/Δ]/ℤ} with the Habiro ring of the number field of Garoufalidis–Scholze–Wheeler–Zagier (§5.9, `HabiroRings.relativeHabiro.numberFieldEquiv`). Neither ring statement needs 6 | Δ; the spectral number-field comparison of §6.14 retains that additional hypothesis of its source. HR.6, scalar extension of complete modules and the transported number-field lines, is not used.
- **HabiroCohomologyFoundations Layers 1–4 and §5.26.** Layer 1 supplies the global q-de Rham complex qΩ_{S/A} of a smooth algebra over a torsion-free Λ-ring, in particular over a perfectly covered one, its identification with the coordinate Koszul complex q-Ω^∗_{S/A,□} for an étale framing □ (§1.14), and the description of de Rham cohomology as the totalisation of the PD envelopes of a Čech nerve (§1.17). Layer 2 (§§2.4–2.7) supplies the derived q-de Rham complex by animation, its completed base change and the combined Hodge and (q−1)-adic filtration. Layer 3 (stage HQ.4) supplies q-de Rham–Witt complexes, the twisted q-de Rham complexes and their arithmetic fracture squares (§§3.12, 3.15–3.16) and the Nygaard filtrations (§§3.20–3.29). Layer 4 (stage HQ.3) supplies chosen q-Hodge filtrations, the category of pairs with its four comparison clauses and `QHodgeFiltration.ofUnderived` (§4.1), the q-Hodge complex (§4.4), the coordinate pair (S,F_□) of an étale-framed smooth algebra, whose i-th step in form degree j is h^{max(i−j,0)}Ω^j_{S/A}[[h]] and which carries only an E₀-structure (§4.8), the p-adic and global twisted q-Hodge filtrations (§§4.9, 4.12), the Habiro–Hodge complex with its descent theorem as graded modules (§§4.17–4.20), the identification H(R,F) ≃ H_{R/A} of E∞-algebras for R étale over A (§4.21; W-Hab Corollary 3.13, p. 27), the identification of the completed derived q-de Rham complex of a smooth algebra with qΩ (§4.22) and finite-projective base change (§§4.25–4.27). Multiplicativity of the descent comparisons, with the Eₙ and derived commutative upgrades, is the separate §4.23. §4.28 exports these objects as one interface on pairs, with the completed q-de Rham complex, the β-periodic q-Hodge and Habiro–Hodge objects and the Habiro descent record. Layer 5 §5.26 supplies the finite-coefficient q-Hodge pairs for ℤ/m and higher-power quotients used in §7.6. No trace statement of HabiroCohomologyFoundations is used.

### Proof inputs that remain explicit construction targets

The genuine orthogonal/cyclotomic comparison uses the Barwick–Glasman model theorem cited by Nikolaus–Scholze Theorem II.3.7 (Acta p. 260). Its localization universal property, including higher coherences, must be supplied; it does not follow by replacing homotopy diagrams by strict commuting squares. The light solid spectral framework and its even-descent results require the constructions described in Wagner §§2.1–2.4 (pp. 11–23); the lecture-based spectral foundations, the meaning of solid homological evenness, and both-sided duality assumptions are made into targets below. General rigidification uses the cardinal-controlled rational-index envelope: Ramzi Construction 4.79 and Theorem 4.81 (v2, pp. 43–46). The sequential special case of Meyer–Wagner Construction 1.3 alone does not establish it. The proofs of the p=2 q-Hodge comparison, global Adams gluing and the twisted comparison must construct their coherent comparison maps, rather than assuming the maps as data with the desired conclusion. The K-theoretic description of syntomic complexes in §8.7 is stated where a complete published proof exists: on the quasisyntomic site of every p-complete quasisyntomic ring, in every weight i≥0 and with every coefficient ℤ/p^n, n≥1 (Bhatt–Scholze Theorem 14.1 with Clausen–Mathew–Morrow Corollary 6.9). The description on every p-quasisyntomic scheme, such as Spec ℤ, announced by Bhatt–Mathew (Example 1.6, p. 2) has no published proof and is not a target of this roadmap.

## How to read the build

Layers 1–3 construct the cyclic, parametrized Tate, cyclotomic, genuine and Cartier objects on top of the imported finite-group and circle Borel functors, with the free E₁ form of Bökstedt periodicity, the Witt description of π₀TR and representation-graded TR. Layer 4 constructs K-theory of small stable infinity categories, the motive foundations, the trace and its derivative, nilpotent and henselian comparisons. Within that layer construct the two concrete K-theory functors of §4.9 first: they depend only on the external stable-category and model K-theory suppliers. Then read §§4.1–4.8, the invariant predicates and examples in the remainder of §4.9, and §§4.10–4.20. The K-theory applications in §§4.4–4.8 use those already constructed functors; neither concrete K-theory construction uses motives or traces. Layer 5 constructs stable operations and relative topological coefficients, Layer 6 the even and q-Hodge comparisons, including the framed smooth comparison, and Layer 7 the refined finite-coefficient calculation. Layer 8 adds to the imported perfectoid, quasisyntomic, AΩ and prismatic trace comparisons the descent theorem, the cotangent filtration of THH, the décalage and Segal comparisons over O_C, convergence, trace Adams operations and the characteristic-p and K-theoretic syntomic sheaves. Layer 9 proves the ordinary-reduction Beilinson square for associative rings, its K-theoretic form for henselian rings and the integral refinements of the imported graded square. Named interfaces retain their exact hypotheses, residual actions and completion conventions. `Suggested.lean` records only the Cartier, diagonal q-divided-power, high-powered and ordinary coefficient statements that can already be typed on the available carriers; all spectral and higher-categorical constructions below are mathematical targets.

## Layer 1: Cyclic enhancements of Hochschild homology

Start with cyclic operators and mixed complexes over an arbitrary commutative ground ring. The first comparison theorem is integral smooth HKR; division by factorials is reserved for the characteristic-zero mixed comparison. Direct-sum and product totalizations remain distinct throughout.

### 1.1 Cyclic objects and the cyclic bar

**Connes' cyclic category and cyclic objects.** Connes' cyclic category Λ has objects [n] = {0,…,n} (n ≥ 0); it contains the simplex category Δ, has an automorphism τ_n of [n] of order n+1, and every morphism of Λ factors uniquely as an automorphism followed by a morphism of Δ, with the relations τ_n d_i = d_{i−1} τ_{n−1} (1 ≤ i ≤ n), τ_n d_0 = d_n, τ_n s_i = s_{i−1} τ_{n+1} (1 ≤ i ≤ n), τ_n s_0 = s_n τ_{n+1}², τ_n^{n+1} = id. The paracyclic category Λ_∞ drops τ_n^{n+1} = id. A cyclic object of a category C is a functor Λ^op → C: a simplicial object X with operators t_n : X_n → X_n satisfying the dual relations (d_i t_n = t_{n−1} d_{i−1} for 1 ≤ i ≤ n, d_0 t_n = d_n, s_i t_n = t_{n+1} s_{i−1} for 1 ≤ i ≤ n, s_0 t_n = t_{n+1}² s_n, t_n^{n+1} = id). Cyclic objects form the functor category Fun(Λ^op, C) and restrict along Δ ⊂ Λ to simplicial objects.

Throughout this statement, C an arbitrary category; for cyclic modules C = Mod_k with k a commutative ring.

([NS](#ns), Appendix B, definitions of Λ_∞, Λ_p, Λ (Acta pp. 380-381), Proposition B.1 (Acta p. 381), Theorem B.3 (Acta p. 382; proof pp. 382-383), Corollary B.4 (p. 383); [LQ](#lq), §1, p. 567; Lemma 1.1, p. 567.)

The construction proceeds as follows. Define Λ by generators (the coface, codegeneracy and cyclic maps) and the relations listed, following NS18 Appendix B, or as the category of nonempty finite cyclically ordered sets with degree-one maps. Prove the unique factorisation Λ([m],[n]) = Δ([m],[n]) × Aut_Λ([m]) with Aut_Λ([m]) = ℤ/(m+1); this gives the presentation of cyclic objects by (d_i, s_j, t_n). Define Λ_∞ with Aut([n]) = ℤ and the functor Λ_∞ → Λ; record Λ ≃ Λ^op (Connes' self-duality) as an API item, not used in the constructions.

Provide the following operations and identities.

- `CyclicCategory`: The category Λ with objects ℕ and morphisms the pairs (φ, g) of a Δ-morphism and a cyclic automorphism, with the composition law of NS18 Appendix B.
- `CyclicCategory.toSimplex`: The faithful wide inclusion Δ → Λ.
- `CyclicCategory.factor`: Every morphism of Λ is uniquely a cyclic automorphism followed by a morphism of Δ.
- `CyclicObject`: Cyclic objects of C: functors Λ^op ⥤ C; CyclicObject.toSimplicial restricts along Δ ⊂ Λ.
- `CyclicObject.mk`: A simplicial object with operators t_n satisfying the listed relations defines a cyclic object, and every cyclic object arises so.
- `CyclicObject.t_pow`: t_n^{n+1} = id on X_n.
- `CyclicObject.map`: Postcomposition with a functor C ⥤ D maps cyclic objects to cyclic objects, compatibly with identities and composition.

**Checks.**

- `CyclicCategory.aut_card`: Aut_Λ([n]) is cyclic of order n + 1; for n = 0 it is trivial.
- `CyclicObject.constant`: The constant simplicial object at an object c, with t_n = id, is a cyclic object.
- `CyclicObject.nonexample_sign`: Building B = (1 − τ)sN from the unsigned rotation τ instead of t = (−1)^nτ fails bB + Bb = 0 already for A = k[x] in degree 1 (2 ≠ 0 in k): the cyclic structure is τ, but B needs the signed operator.
- `CyclicObject.toSimplicial_alternatingFaceMap`: For C abelian, the alternating face map complex of the underlying simplicial object of a cyclic object is Mathlib's alternatingFaceMapComplex.

Also establish The restriction of a cyclic object to Δ^op is its underlying simplicial object, and Mathlib's alternating face map complex applies to it. In a cyclic object, t_n^{n+1} = id and d_0 t_n = d_n hold; for the cyclic bar construction of §1.1 (The cyclic bar construction of an algebra) these are the identities of the cyclic operator.

*Needs:* `CategoryTheory.SimplicialObject`.

**The cyclic bar construction of an algebra.** For a commutative ring k and an associative unital k-algebra A, the cyclic k-module C_•(A/k) has C_n = A^{⊗_k(n+1)}, faces d_i(a_0⊗…⊗a_n) = a_0⊗…⊗a_i a_{i+1}⊗…⊗a_n for 0 ≤ i < n and d_n(a_0⊗…⊗a_n) = a_n a_0⊗a_1⊗…⊗a_{n−1}, degeneracies s_j inserting 1 after position j, and cyclic operator τ_n(a_0⊗…⊗a_n) = a_n⊗a_0⊗…⊗a_{n−1} (the unsigned rotation, which satisfies the cyclic relations); the signed operator t_n := (−1)^n τ_n is the one entering b′, the norm N and Connes' B. Its alternating face map complex, with b = Σ_{i=0}^n (−1)^i d_i, is the Hochschild complex of A over k as constructed by DGAInfinity layer 8 for A viewed as a DG algebra concentrated in degree 0; its normalised complex is layer 8's normalised Hochschild complex. The construction is functorial in k-algebra maps.

Throughout this statement, k a commutative ring; A an associative unital k-algebra. No flatness is assumed for the construction; §1.1 (The cyclic enhancement of supplied derived Hochschild chains) uses it only for k-flat A or after flat resolution.

([LQ](#lq), §1 'Hochschild and cyclic homology', pp. 566-567; [LQ](#lq), §1, p. 567; Lemma 1.1, p. 567.)

The construction proceeds as follows. Import the Hochschild chain complex, its bar differential and its normalised version from DGAInfinity layer 8, specialised to an ungraded algebra; do not construct them again. Exhibit the simplicial k-module structure (d_i, s_j) and identify its alternating face map complex (Mathlib alternatingFaceMapComplex) with layer 8's complex termwise. Add the cyclic operator τ_n and verify the relations of §1.1 (Connes' cyclic category and cyclic objects) directly from the formulas; record the signed t_n = (−1)^nτ_n used by the operators of the complex. Check functoriality: an algebra map f : A → A' induces f^{⊗(n+1)} commuting with d_i, s_j, τ_n.

Provide the following operations and identities.

- `CyclicBar`: CyclicBar k A : CyclicObject (ModuleCat k) with (CyclicBar k A)_n = A^{⊗_k(n+1)}.
- `CyclicBar.face_apply`: The face formulas d_i(a_0⊗…⊗a_n) displayed in the statement, including d_n's wrap-around.
- `CyclicBar.cyclic_apply`: τ_n(a_0⊗…⊗a_n) = a_n⊗a_0⊗…⊗a_{n−1}; the signed operator t_n = (−1)^nτ_n is the one used in b′, N and B.
- `CyclicBar.map`: A k-algebra map A → A' induces a map of cyclic modules, with map_id and map_comp.
- `CyclicBar.alternatingFaceMapComplex_iso`: The alternating face map complex of the underlying simplicial module is DGAInfinity layer 8's Hochschild complex of A.
- `CyclicBar.b_comp_b`: b ∘ b = 0 (from the simplicial identities).

**Checks.**

- `CyclicBar.ground_ring`: For A = k, H_*(C_•(k/k), b) = k in degree 0 and 0 elsewhere.
- `CyclicBar.H0`: H_0(C_•(A/k), b) ≅ A/[A,A]; for A = M_2(k) this is k via the trace.
- `CyclicBar.polynomial_H1`: For A = k[x], H_1 ≅ k[x]·dx via a_0⊗a_1 ↦ a_0 da_1.
- `CyclicBar.nonexample_signed`: The signed rotation (−1)^nτ_n is not a cyclic structure: for A = k with 2 ≠ 0, d_0 ∘ (−τ_1) = −d_1 ≠ d_1 on A^{⊗2}, whereas the unsigned τ_1 satisfies d_0τ_1 = d_1.

Also establish For A = k, C_n = k with all faces the identity, so b alternates between 0 and the identity, and the homology is k in degree 0. b ∘ b = 0 follows from the simplicial identities; b(a_0⊗a_1) = a_0a_1 − a_1a_0, so H_0 = A/[A,A].

*Needs:* DGAInfinity Layer 8 (ordinary Hochschild chains and Morita comparison); §1.1 (Connes' cyclic category and cyclic objects); `AlgebraicTopology.alternatingFaceMapComplex`; `AlgebraicTopology.normalizedMooreComplex`.

**The cyclic enhancement of supplied derived Hochschild chains.** Equip the derived Hochschild object supplied by DGAInfinity Layer 8 with the mixed and coherent circle structures constructed here. Its underlying object is A ⊗^L_{A ⊗^L_k A^op} A, computed using a k-flat DG resolution P→A, or a polynomial simplicial resolution for commutative A. Identify the underlying b-complex with the supplied Hochschild complex; for k-flat A this is the ordinary cyclic bar complex. For I⊂A use the fiber of the enhanced map to A/I, compatibly with the supplied ordinary relative object. These are comparisons and enhancements of the fixed Hochschild functor, including functoriality in (k→A), not a second definition of ordinary Hochschild theory.

Throughout this statement, k commutative; A associative unital k-algebra. When A is not k-flat the derived definition differs from the homology of A^{⊗_k(•+1)} (example: k = ℤ, A = 𝔽_p).

([BMS-arXiv](#bms-arxiv), §2.2 'Hochschild homology', p. 13; [LQ](#lq), §1 'Hochschild and cyclic homology', pp. 566-567.)

The construction proceeds as follows. Take the ordinary derived Hochschild complex and its bar-resolution comparison from DGAInfinity Layer 8. Equip the cyclic resolution with the mixed and circle structures below, then prove that these descend along the supplied quasi-equivalence comparison. For commutative A, use the cyclic bar construction of a simplicial polynomial resolution and its animation universal property. Identify the underlying object with the supplied derived HH(A/k), compatibly with scalar maps and ordinary relative fibers. The formulas and computations below describe the forgetful image of this enhancement; their ordinary Hochschild counterparts remain the supplier’s constructions.

Provide the following operations and identities.

- `HochschildHomology`: The enhanced mixed/circle object with underlying object the supplied HH(A/k), functorial in the pair (k,A).
- `HochschildHomology.ofFlat`: For A flat over k, HH(A/k) ≅ (C_•(A/k), b) in D(k).
- `HochschildHomology.map`: A map of pairs (k → A) → (k' → A') induces HH(A/k) → HH(A'/k'), with map_id and map_comp.
- `HochschildHomology.relative`: HH(A, I) := fib(HH(A/k) → HH((A/I)/k)) with its long exact sequence of homology.
- `HochschildHomology.zeroth`: HH_0(A/k) ≅ A/[A,A] (derived HH_0 agrees with the underived one).
- `HochschildHomology.commutativeAlgebra`: For commutative A, HH(A/k) is an E_∞-k-algebra with the shuffle product, and HH_0(A/k) = A as rings.

**Checks.**

- `HochschildHomology.base`: HH(k/k) ≅ k in degree 0.
- `HochschildHomology.polynomial`: HH_*(k[x]/k) ≅ k[x] ⊕ k[x]dx, concentrated in degrees 0 and 1.
- `HochschildHomology.Fp_over_Z_degree2`: HH_2(𝔽_p/ℤ) ≅ 𝔽_p (the divided power generator), while HH_1(𝔽_p/ℤ) = 0.
- `HochschildHomology.dual_numbers_nonvanishing`: For nonzero k and A = k[x]/(x²) with 2 invertible, HH_n(A/k) ≠ 0 for every n ≥ 0, so HH is not Ω^*_{A/k} for non-smooth A.

Also establish HH(𝔽_p/ℤ) is computed by a ℤ-flat resolution; it is not ⊕ 𝔽_p^{⊗(n+1)} homology (which would be 𝔽_p in degree 0 only). For A k-flat, HH(A/k) is the homology of C_•(A/k).

*Needs:* §1.1 (The cyclic bar construction of an algebra); DGAInfinity Layer 8 (ordinary Hochschild chains and Morita comparison); EnhancedDerivedSheaves E1 — enhanced derived category; EnhancedDerivedSheaves E1 — presentability and derived tensor; EnhancedDerivedSheaves E5:animation — animated commutative rings; `Module.Flat`.

### 1.2 The Connes operator and mixed complexes

**Connes' operator B.** On a cyclic k-module X with cyclic operators τ_n, put t_n := (−1)^nτ_n, N_n := Σ_{i=0}^n t_n^i and let s be the extra degeneracy (for the cyclic bar construction s(a_0⊗…⊗a_n) = 1⊗a_0⊗…⊗a_n). Connes' operator is B := (1 − t_{n+1}) s N_n : X_n → X_{n+1}; it satisfies b² = 0, B² = 0 and bB + Bb = 0 already on unnormalised chains, and descends to the normalised complex N(X) (the quotient by degenerate elements), where on Hochschild chains B(a_0⊗…⊗a_n) = Σ_{i=0}^n (−1)^{ni} 1⊗a_i⊗…⊗a_n⊗a_0⊗…⊗a_{i−1}. So (X, b, B) and (N(X), b, B) are mixed complexes (§1.2 (Mixed complexes)), naturally in X and quasi-isomorphic.

Throughout this statement, X a cyclic object in k-modules; the explicit formula for B holds on normalised chains.

([H](#h), §2, p. 4.)

The construction proceeds as follows. Prove (1 − t)N = 0 = N(1 − t) and the identities b(1 − t) = (1 − t)b′, b′N = Nb, where b′ = Σ_{i<n}(−1)^i d_i (Connes; Ginzburg §2). B² = (1 − t)sN(1 − t)sN = 0 since N(1 − t) = 0; bB + Bb = 0 from b(1 − t) = (1 − t)b′, b′N = Nb and sb′ + b′s = id (Loday–Quillen §1; Hoyois §2). Naturality in maps of cyclic modules is immediate from the formula.

Provide the following operations and identities.

- `CyclicObject.connesB`: B : N(X)_n → N(X)_{n+1} for a cyclic k-module X.
- `CyclicObject.connesB_sq`: B ∘ B = 0.
- `CyclicObject.connesB_comm`: b ∘ B + B ∘ b = 0.
- `CyclicObject.connesB_natural`: B commutes with the maps induced by morphisms of cyclic modules.
- `CyclicBar.connesB_apply`: The explicit formula for B on normalised Hochschild chains.

**Checks.**

- `CyclicBar.connesB_unit`: B(1) = 0 in N_1(A) because 1⊗1 is degenerate.
- `CyclicBar.connesB_polynomial`: For A = k[x], B[x^m] = [1⊗x^m] = m[x^{m−1}⊗x] in HH_1(k[x]) = k[x]dx, i.e. m x^{m−1}dx.
- `CyclicBar.connesB_sq_unnormalised`: B ∘ B = 0 already on unnormalised chains, since N_{n+1}(1 − t_{n+1}) = 1 − t_{n+1}^{n+2} = 0; normalisation only simplifies the formula for B.

Also establish For A = k[x], B[x^m] = [1⊗x^m] = m[x^{m−1}⊗x] in HH_1(k[x]) (since 1⊗ab ≡ a⊗b + b⊗a modulo b-boundaries); under HKR this is d(x^m) = m x^{m−1}dx (§1.9 (Connes' operator is the de Rham differential under HKR)). B vanishes on HH_0(k/k) = k.

*Needs:* §1.1 (Connes' cyclic category and cyclic objects); §1.1 (The cyclic bar construction of an algebra); `AlgebraicTopology.normalizedMooreComplex`.

**Mixed complexes.** A mixed complex over k is a Z-graded k-module M with b:M_n→M_{n−1}, B:M_n→M_{n+1}, b²=B²=bB+Bb=0 in every integer degree. Its maps commute with both operators; weak equivalences are quasi-isomorphisms of the underlying b-complex. Equivalently it is an unbounded dg-module over Λ=k[ε]/ε², |ε|=1 homologically, with ε acting by B. A cyclic module gives a mixed complex by normalization and extension by zero into negative degrees. Tensor products use direct sums over all p+q=n with Koszul signs, not finite products. Derived tensor products use k-flat replacements.

Throughout this statement, k a commutative ring; all degrees are integers; b lowers degree, B raises degree.

([H](#h), §2, p. 5.)

The construction proceeds as follows. Form Z-graded modules with the two square-zero anticommuting operators. Identify these data with dg Λ-modules, including the Leibniz identity. Extend the normalized cyclic chain complex by zero into negative degrees; its degree-zero relation comes from that extension. Use direct-sum tensor products and k-flat replacements for derived products.

Provide the following operations and identities.

- `MixedComplex`: Z-graded k-module with b, B and their three relations in all degrees.
- `MixedComplex.Hom`: Morphisms commuting with b and B; identity and composition.
- `MixedComplex.ofCyclic`: The normalised mixed complex of a cyclic k-module, natural in the cyclic module.
- `MixedComplex.QuasiIso`: A morphism is a quasi-isomorphism iff it induces isomorphisms on b-homology; then it induces isomorphisms on HC, HC⁻ and HP (§1.4 (Cyclic, negative cyclic and periodic cyclic homology)).
- `MixedComplex.equivDGModule`: Mixed complexes are dg-modules over k[ε]/ε² with |ε| = 1.
- `MixedComplex.tensor`: (M⊗N)_n=⊕_{p∈Z} M_p⊗N_{n−p}, with Koszul differentials; derive using k-flat replacements.

**Checks.**

- `MixedComplex.trivial`: k in degree 0 with b = B = 0 is a mixed complex.
- `MixedComplex.ofCyclic_ground`: The mixed complex of k as a k-algebra is quasi-isomorphic to (k, 0, 0).
- `MixedComplex.nonexample`: For nonzero k, take M = k in degrees 0 and 1, with b : M_1 → M_0 and B : M_0 → M_1 both the identity. Then b² = 0 and B² = 0 but bB + Bb = id ≠ 0, so this is not a mixed complex.
- `MixedComplex.negative_degree`: The complex k in degree −1 with zero operators exists and has H_{−1}=k; extension by zero from N-graded complexes cannot model it.

Also establish (k, 0, 0) concentrated in degree 0 is a mixed complex; its HC is k[u^{−1}] (§1.4 (Cyclic, negative cyclic and periodic cyclic homology)). (N C_•(A/k), b, B) is a mixed complex by §1.2 (Connes' operator B).

*Needs:* §1.2 (Connes' operator B).

### 1.3 The coherent derived mixed category

**Derived category of mixed complexes.** D(Λ) is the localization of all unbounded dg Λ-modules at the maps inducing isomorphisms on b-homology. It is not the derived category of the abelian category of mixed complexes. The cyclic, negative and periodic totalization functors factor through this localization; its coherent enhancement is Mod_Λ(D(k)).

Throughout this statement, k commutative; Λ exterior with ε in homological degree 1.

([Ke](#ke), §2.2–2.4, pp. 6–7; [H](#h), §2, pp. 4–5.)

The construction proceeds as follows. Use the dg-module interpretation. Import coherent localization from EDS E5; invert underlying b-quasi-isomorphisms. Hoyois §2 identifies CC, CN and CP with tensor, derived Hom and their norm cofiber.

Provide the following operations and identities.

- `DerivedMixedComplex`: Localization at underlying b-quasi-isomorphisms.
- `DerivedMixedComplex.ofMixed`: Localization functor; sends each b-quasi-isomorphism to an equivalence.
- `DerivedMixedComplex.map`: Coherent functoriality and inverse for localized weak equivalences.

**Checks.**

- `DerivedMixedComplex.ground`: The degree-zero unit maps to the trivial Λ-module k.
- `DerivedMixedComplex.acyclic`: Every b-acyclic mixed complex is zero in D(Λ).
- `DerivedMixedComplex.not_abelian_derived`: A map with acyclic b-cone is inverted even if it is not a degreewise isomorphism.

*Needs:* §1.2 (Mixed complexes); EnhancedDerivedSheaves E5:abstract.

**Functorial precyclic mixed cone.** For a precyclic k-module C, form the modified mixed complex with degree n component C_n⊕C_{n−1}, b-matrix [[b,1−t],[0,−b′]], and B-matrix [[0,0],[N,0]]. It is functorial without degeneracies. When C is cyclic, its natural comparison to the usual mixed complex is a b-quasi-isomorphism. This allows nonunital algebra maps and matrix corners to be used through the modified model, rather than as maps preserving degeneracies.

Throughout this statement, k commutative; cyclic operators signed on Hochschild chains.

([Ke](#ke), §2.1–2.2, pp. 5–6.)

The construction proceeds as follows. Use the precyclic identities to verify the three mixed relations. Use the contracting extra degeneracy only for the unital comparison. Normalize after comparison; derive localization at b-quasi-isomorphisms.

Provide the following operations and identities.

- `PrecyclicModule`: Faces and cyclic operators satisfying the precyclic identities, without degeneracies.
- `PrecyclicMixedCone`: The cone model with its two operator matrices.
- `PrecyclicMixedCone.map`: Maps commuting with faces and cyclic operators induce mixed maps without assuming degeneracies.
- `PrecyclicMixedCone.compare`: For a cyclic module the comparison to C is a b-quasi-isomorphism.

**Checks.**

- `PrecyclicMixedCone.unital`: For the cyclic bar of k the comparison has b-homology k in degree zero.
- `PrecyclicMixedCone.zero`: The zero precyclic object has zero modified complex.
- `PrecyclicMixedCone.corner`: The nonunital corner A→M_r(A) induces a modified mixed map; for r>1 it does not preserve the unital cyclic degeneracy.

*Needs:* §1.1 (Connes' cyclic category and cyclic objects); §1.3 (Derived category of mixed complexes).

### 1.4 Three totalizations and periodicity

**Cyclic, negative cyclic and periodic cyclic homology.** For a mixed complex (M, b, B) let u be a formal variable of homological degree −2. Then CC⁻(M) := (M[[u]], b + uB) (product totalisation, Π_{i≥0} M_{n+2i} in degree n), CP(M) := (M((u)), b + uB) (colim_{r→∞} Π_{i≥−r} M_{n+2i} in degree n, Laurent series with a finite lower bound on the u-exponents), and CC(M) := (M ⊗ k[u^{−1}], b + uB) = (⊕_{i≥0} M_{n−2i} in degree n, direct-sum totalisation, u·u^0 = 0). HC_n(M) = H_n CC(M), HC⁻_n(M) = H_n CC⁻(M), HP_n(M) = H_n CP(M) (2-periodic). For an algebra, HC_n(A/k) := HC_n(C(A/k)) etc., computed from a k-flat resolution when A is not flat. Product and sum totalisations are kept distinct: for M concentrated in degree zero, both periodic totalisations give k in every even degree. For M_{2j}=k for all j≥0, M_{2j+1}=0 and b=B=0, their degree-zero homology is respectively Π_{j≥0}k and ⊕_{j≥0}k; the direct sum does not compute HP for this M.

Throughout this statement, (M, b, B) a mixed complex over a commutative ring k; u has degree −2 throughout this roadmap (NS18 and BMS2 convention).

([LQ](#lq), Definition, p. 568; Proposition 1.2, p. 568; Proposition 1.5, p. 569; [H](#h), §2, p. 4.)

The construction proceeds as follows. Define the three complexes and check (b + uB)² = b² + u(bB + Bb) + u²B² = 0. Show quasi-isomorphisms of mixed complexes induce isomorphisms on all three: for CC by the bounded-below column filtration; for CC⁻ and CP by the complete u-adic filtration and the Milnor sequence (the product totalisation is what makes this argument work). Compare with Connes' complex C^λ = C/(1 − t) when ℚ ⊂ k (classical, recorded as a comparison API item). For Mathlib's direct-sum total complex HomologicalComplex₂.total, record that it computes CC but not CC⁻ or CP; product totalisation is constructed here.

Provide the following operations and identities.

- `MixedComplex.cyclicComplex`: CC(M) with the direct-sum totalisation.
- `MixedComplex.negativeCyclicComplex`: CC⁻(M) = M[[u]] with b + uB (product totalisation).
- `MixedComplex.periodicCyclicComplex`: CP(M) = M((u)) with b + uB.
- `cyclicHomology`: HC_n(A/k), HC⁻_n(A/k), HP_n(A/k) for an algebra, via its mixed complex.
- `MixedComplex.cyclicComplex_quasiIso`: Quasi-isomorphisms of mixed complexes induce isomorphisms on HC, HC⁻ and HP.
- `periodicCyclicHomology.periodicity`: Multiplication by u gives HP_n ≅ HP_{n−2}.
- `cyclicHomology.connes_complex`: If ℚ ⊆ k, HC_n(A/k) ≅ H_n(C_•(A)/(1 − t)) (Connes' complex).

**Checks.**

- `cyclicHomology.ground`: HC_{2m}(k/k) = k and HC_{2m+1}(k/k) = 0 for m ≥ 0.
- `periodicCyclicHomology.ground`: HP_{2m}(k/k) = k for all m ∈ ℤ.
- `negativeCyclicHomology.ground`: HC⁻_n(k/k) = k for n ≤ 0 even and 0 otherwise.
- `negativeCyclicHomology.not_cyclic`: HC⁻_2(k/k) = 0 while HC_2(k/k) = k: defining HC⁻ with k[u^{−1}] (the cyclic convention) instead of k[[u]] gives the wrong groups.
- `periodicCyclicHomology.laurent_bound`: For M_n=k in every integer degree and b=B=0, a periodic degree-zero element (a_i) has a finite lower bound in its u-exponents. The family a_i=1 for every i∈Z is excluded.
- `cyclicHomology.sum_not_product`: For that same M, CC_0=⊕_{i≥0}k whereas CN_0=∏_{i≥0}k; the all-ones family belongs only to CN_0.

Also establish HC_*(k/k) = k[u^{−1}] (k in each even degree ≥ 0), HC⁻_*(k/k) = k[u] (k in even degrees ≤ 0), HP_*(k/k) = k[u^{±1}]. For A = k[x] over ℚ ⊂ k: HC_n(k[x]) = HC_n(k) for n ≥ 1 and HC_0 = k[x] (homotopy invariance in characteristic 0).

*Needs:* §1.2 (Mixed complexes); `HomologicalComplex₂.total`; §1.3 (Derived category of mixed complexes).

**Connes' SBI exact sequence.** For every mixed complex M over k there is a natural long exact sequence … → HH_n(M) →^{I} HC_n(M) →^{S} HC_{n−2}(M) →^{B} HH_{n−1}(M) → …, where HH_n(M) = H_n(M, b), I is induced by the inclusion M = u^0-column ⊂ CC(M), S is multiplication by u (removing the u^0 column) and B is induced by Connes' operator. In particular for an algebra A over k: … → HH_n(A/k) → HC_n(A/k) → HC_{n−2}(A/k) → HH_{n−1}(A/k) → …. Analogously HC⁻ and HP sit in … → HC⁻_{n+2} →^{u} HC⁻_n → HH_n → HC⁻_{n+1} → … .

Throughout this statement, M an arbitrary integer-graded mixed complex; all three long exact sequences are indexed by n ∈ ℤ. If M_n=0 for n<0, then HC_n(M)=0 for n<0, I_0 is an isomorphism and I_1 is surjective.

([LQ](#lq), Theorem 1.6 and its proof, p. 570; [H](#h), §2, pp. 4–5.)

The construction proceeds as follows. The short exact sequence of complexes 0 → M → CC(M) →^{u} CC(M)[2] → 0 (columns i = 0 and i ≥ 1). Take the long exact homology sequence; identify the connecting map with B. For HC⁻ use 0 → u CC⁻(M) → CC⁻(M) → M → 0.

Also establish For M = (k,0,0) the sequence splits into 0 → HC_{2m} →^S HC_{2m−2} → 0 for m ≥ 1 (HH_{2m}=0); at m=0, I : HH_0=k → HC_0=k is an isomorphism. For A smooth over a ℚ-algebra, S agrees under HKR with the projection Ω^n/dΩ^{n−1} ⊕ H^{n−2}_dR ⊕ … → H^{n−2}_dR ⊕ … (§1.10 (Cyclic homology of smooth algebras in characteristic zero)).

*Needs:* §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §1.2 (Mixed complexes).

### 1.5 Maps of mixed complexes and their totalizations

**The mixed-complex comparison compatibility.** For homological mixed complexes (C,b_C,B_C),(D,b_D,B_D), a map of underlying b-complexes that also satisfies f_(n+1)B_C=B_D f_n induces coefficientwise maps on CC, CC⁻ and CP. They commute with b+uB, |u|=−2, using sums, products and bounded-below Laurent series respectively. The b-commutation is the supplied HomologicalComplex.Hom.comm; the additional target is compatibility with B and with the coherent circle realization, so no ordinary chain-map theory is reconstructed.

([BMS](#bms), Corollary 3.4 proof, pp. 218–219; Proposition 5.15 proof, pp. 241–242; ordinary chain-level compatibility from the pinned Hom.comm statement.)

The construction proceeds as follows. Use the existing chain-map commutation equality for b. Use the supplied B-commutation for the second component. Apply the equalities coefficientwise in the mixed-complex totalizations, retaining products for negative cyclic homology.

Also establish Identity maps satisfy the compatibility. Setting B=0 gives the ordinary chain-map compatibility. A chain map failing to commute with B does not induce this negative-cyclic comparison.

*Needs:* `ChainComplex`; `HomologicalComplex.Hom.comm`; §1.2 (Mixed complexes); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §1.3 (Derived category of mixed complexes).

### 1.6 Cyclic Morita comparison and products

**Morita invariance of Hochschild and cyclic homology.** A derived Morita equivalence of k-flat dg algebras induces an equivalence of their objects in D(Λ), hence of HH, HC, HC⁻ and HP. More generally a perfect A–B bimodule X defines C(X):C(A)→C(B) in D(Λ), compatible with derived tensor composition and invariant under triangles in the bimodule variable. Keller constructs it as C(β_X)^{-1}C(α_X) through End_B(B⊕X), using the functorial precyclic mixed cone for the nonunital corners; the underlying Hochschild Morita theorem is imported from DGAInfinity 8–9. For ordinary Morita equivalences use k-flat replacements. For M_r(A), r≥1, the cyclic generalized matrix trace supplies the familiar comparison; its inverse exists in D(Λ), not as the naive unital cyclic corner.

Throughout this statement, A, B k-algebras, Morita equivalent over k; flatness over k or derived HH. Derived Morita equivalences of DG algebras are covered by DGAInfinity layer 8 for HH; the compatibility with B is added here.

([Ke](#ke), §2.1–2.4, pp. 5–7, Theorem 2.4(a),(b); [LQ](#lq), Corollary 1.7, p. 570; [G](#g), Proposition 5.2.1, p. 21.)

The construction proceeds as follows. Import normalized Hochschild chains and Morita invariance from DGAInfinity 8–9. For a perfect bimodule form the endomorphism algebra of B⊕X and the two corner maps using the modified precyclic model. Invert C(β_X) using its underlying Hochschild quasi-isomorphism. Keller Theorem 2.4 gives compatibility with identity and derived tensor composition. Apply the three derived cyclic functors; compare the matrix trace formula in the ordinary matrix case.

Also establish HC_*(M_2(k)/k) ≅ HC_*(k/k), with the isomorphism induced by the matrix trace in degree 0. For r≥1, HH_0(M_r(A)) = M_r(A)/[M_r(A), M_r(A)] ≅ A/[A,A] via the trace.

*Needs:* DGAInfinity Layer 8 (ordinary Hochschild chains and Morita comparison); DGAInfinity Layer 9 (ordinary Hochschild character); `MoritaEquivalence`; `Matrix.trace`; §1.2 (Mixed complexes); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §1.3 (Functorial precyclic mixed cone); §1.3 (Derived category of mixed complexes).

**Shuffle and external products.** For k-flat unital associative k-algebras A,B the Hochschild shuffle is a b-quasi-isomorphism C(A)⊗C(B)→C(A⊗B). It need not commute with Connes B. Its cyclic coextension sh+u sh′, together with the perturbed Alexander–Whitney inverse, gives the completed negative cyclic comparison and external products; the AW coextension may have higher u terms. Derived replacements give HH(A⊗^L B/k)≃HH(A/k)⊗^L HH(B/k). HC⁻ has external products; HC is a module over HC⁻. For commutative A the multiplication map yields the graded-commutative HH algebra and B is a derivation on homology.

Throughout this statement, k commutative; A, A′ k-flat associative k-algebras (else replace by flat resolutions).

([Ba](#ba), §I.1, pp. 2–3; §IV, Lemmas IV.1–IV.2 and Theorem IV.3, pp. 12–13; [AMMN](#ammn), Proof of Corollary 2.9, p. 9; [BMS-arXiv](#bms-arxiv), Remark 2.4 and footnote 7, p. 13.)

The construction proceeds as follows. Use the ordinary shuffle/AW homotopy equivalence on normalized Hochschild chains. Apply the cyclic perturbation: Bauval Lemmas IV.1–IV.2 and Theorem IV.3 give sh+u sh′ and AW∞. Use u-adic completion for the negative cyclic comparison; do not assert that the leading shuffle commutes with B. Derive tensor products, then compose with multiplication only for commutative algebras.

Provide the following operations and identities.

- `HochschildHomology.shuffle`: The shuffle map C(A)⊗C(A′) → C(A⊗A′).
- `HochschildHomology.shuffle_quasiIso`: The leading shuffle is a b-quasi-isomorphism. Its cyclic coextension is a map of completed negative cyclic complexes; a strict B-compatible leading shuffle is not asserted.
- `HochschildHomology.kunneth`: HH(A⊗_kA′/k) ≃ HH(A/k) ⊗^L_k HH(A′/k).
- `HochschildHomology.commRing`: For commutative A, HH_*(A/k) is a graded-commutative k-algebra with HH_0 = A.
- `HochschildHomology.B_derivation`: For commutative A, B is a graded derivation of HH_*(A/k).
- `negativeCyclicHomology.externalProduct`: External product on HC⁻ and the HC⁻-module structure on HC.
- `HochschildHomology.cyclicShuffle`: The negative cyclic coextension sh+u sh′; its leading term is shuffle and (b+uB)(sh+u sh′)=(sh+u sh′)(b+uB).
- `HochschildHomology.CyclicShuffleData`: Hochschild shuffle with degree-two cyclic correction and completed negative cyclic map, satisfying the differential relation and leading-term compatibility.

**Checks.**

- `HochschildHomology.kunneth_polynomial`: HH_2(k[x,y]/k) is free of rank one over k[x,y] on dx∧dy.
- `HochschildHomology.shuffle_unit`: On normalized chains NC(k/k)=k in degree zero. Under NC(A)⊗k=NC(A), the shuffle with the ground ring is the identity.
- `HochschildHomology.commRing_compat_Kaehler`: For commutative A, the degree-one part HH_1(A/k) ≅ Ω¹_{A/k} (Mathlib KaehlerDifferential) as A-modules, via a_0⊗a_1 ↦ a_0 da_1.
- `HochschildHomology.noncommutative_nonexample`: For noncommutative A (A = M_2(k)), the shuffle product does not give HH_*(A) a ring structure, since multiplication A⊗A → A is not an algebra map.
- `HochschildHomology.shuffle_not_B_map`: For general normalized unital inputs the uncorrected shuffle fails B-compatibility; the identity is restored by its u sh′ term.

Also establish HH_*(k[x,y]/k) ≅ HH_*(k[x]/k) ⊗ HH_*(k[y]/k) = Ω^*_{k[x,y]/k} (compatible with HKR). For A commutative, HH_1(A) ∧ HH_1(A) → HH_2(A) sends da∧db to the class of the shuffle 1⊗a⊗b − 1⊗b⊗a.

*Needs:* §1.2 (Mixed complexes); §1.1 (The cyclic enhancement of supplied derived Hochschild chains); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); `Module.Flat`.

### 1.7 The commutative circle-tensor property

**Hochschild homology of a commutative ring is its tensor with the circle.** For a map of commutative rings R → A, HH(A/R) with its circle action is the free T-equivariant E_∞-R-algebra on A: HH(A/R) ≃ A ⊗_{R} T := colim_{T} A in CAlg(D(R)) (tensoring the E_∞-R-algebra A with the space T = S¹), and for every E_∞-R-algebra B with T-action, maps HH(A/R) → B of T-equivariant E_∞-algebras correspond to maps A → B of E_∞-R-algebras. In particular HH(A/R) ≃ A ⊗^L_{A⊗^L_RA} A as E_∞-algebras.

Throughout this statement, R → A map of commutative rings (or animated rings); E_∞-algebras in D(R) from EnhancedDerivedSheaves E5:abstract.

([BMS-arXiv](#bms-arxiv), Remark 2.4 and footnote 7, p. 13.)

The construction proceeds as follows. T is the pushout ∗ ⊔_{∗⊔∗} ∗ (two arcs glued along their endpoints), so A ⊗ T ≃ A ⊗_{A⊗A} A (tensoring an E_∞-algebra with spaces turns colimits of spaces into colimits of E_∞-algebras). The cyclic bar construction is the simplicial model of T (the simplicial circle Δ¹/∂Δ¹ has n+1 simplices in degree n), so |C_•(A/R)| ≃ A ⊗ T compatibly with the T-action (NS18 Proposition B.5 type argument, or BMS2 Remark 2.4). The adjunction (A ↦ A ⊗ T) ⊣ (forget the T-action) gives the universal property.

Also establish HH(R/R) = R ⊗ T = R. HH(R[x]/R) = R[x] ⊗ T has π_* = R[x] ⊕ R[x]dx (consistent with HKR).

*Needs:* §1.1 (The cyclic enhancement of supplied derived Hochschild chains); EnhancedDerivedSheaves E5:abstract — algebra objects; EnhancedDerivedSheaves E5:animation — animated commutative rings.

### 1.8 Scalar extension and étale comparison

**Base change and flat base change for Hochschild homology.** For a commutative ground-ring map k→K and an associative derived k-algebra A, the derived cyclic bar gives C(A⊗^L_k K/K)≃C(A/k)⊗^L_k K as mixed objects. Consequently HH and HC commute with arbitrary derived ground-ring base change. HC⁻ and HP commute when K is dualizable (perfect) as a k-module, so tensoring by K preserves the products and limits involved. Tor-vanishing identifies A⊗^L_kK with the ordinary algebra A⊗_kK but does not by itself identify the plain un-derived bar with derived HH: for that use k-flat A. If also K is flat, taking homology commutes with tensor. A flat but nonperfect K is insufficient for CN or CP.

Throughout this statement, k→K commutative ground-ring map; derived tensor products throughout. For the plain cyclic bar formula assume A flat over k. For HC⁻ and HP base change assume K perfect over k; finite projective K suffices for degreewise product formulas.

([H](#h), §2, pp. 4–5; [Ke](#ke), §2.2–2.3, pp. 6–7; [NS](#ns), Appendix B, Proposition B.5, Acta pp. 383–384.)

The construction proceeds as follows. Resolve A by k-flat dg or simplicial algebras supplied by DGAInfinity. Base change each tensor power and every cyclic structural map; the symmetric monoidal left adjoint commutes with realization and CC sums. For CN and CP, dualizability makes tensoring by K preserve all products and limits; filtered colimits in CP are preserved too. Separate algebra Tor-vanishing from the flatness needed for the plain bar computation. For K=k[t], the sequence (t^i) witnesses failure of (∏k)⊗K→∏K to be surjective.

Also establish HH_*(ℚ[x]/ℚ) = HH_*(ℤ[x]/ℤ) ⊗ ℚ. HP(ℤ/ℤ) ⊗ ℚ = ℚ[u^{±1}] = HP(ℚ/ℚ), while HP of a nontrivial mixed complex need not commute with ⊗ℚ (product totalisation).

*Needs:* §1.1 (The cyclic enhancement of supplied derived Hochschild chains); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); `CategoryTheory.Tor`; `Module.Flat`.

**Étale base change (Weibel–Geller).** For commutative k-algebras and an étale map A→B, derived HH(B/k)≃B⊗^L_A HH(A/k). For k-flat A,B this gives HH_*(B/k)≅B⊗_A HH_*(A/k); in particular HH(B/A)≃B. The statement changes algebras over the fixed ground ring k. It is not ground-ring base change. Connes B is not generally A-linear, so this HH tensor comparison does not yield cyclic tensor comparisons over A. Nor does étale flatness alone justify commuting CN or CP with infinite products. No unqualified HC⁻/HP étale tensor or sheaf assertion is included here.

Throughout this statement, A → B étale (Mathlib Algebra.Etale); k-flatness of A and B, or derived HH.

([WG](#wg), Theorem 0.1, p. 368; Theorem 2.1, p. 374.)

The construction proceeds as follows. For an étale affine map the diagonal component of B⊗_A B splits off; the off-diagonal component contributes zero to Hochschild Tor with diagonal coefficients. Use Weibel–Geller Theorem 0.1, keeping k fixed; their Theorem 2.1 has B⊗_A B coefficients. Use derived flat replacements as required. Apply the HH comparison to smooth étale charts; keep the cyclic B/d comparison separate.

Also establish For B = A[1/f], HH_*(A[1/f]/k) = HH_*(A/k)[1/f]. For a finite separable field extension L/K of characteristic 0, HH_*(L/ℚ) = L ⊗_K HH_*(K/ℚ).

*Needs:* §1.1 (The cyclic enhancement of supplied derived Hochschild chains); §1.7 (Hochschild homology of a commutative ring is its tensor with the circle); §1.8 (Base change and flat base change for Hochschild homology); `Algebra.Etale`.

### 1.9 Antisymmetrization and the smooth HKR comparison

**The antisymmetrisation map and the HKR projection.** For a commutative k-algebra A, the antisymmetrisation map ε_n : Ω^n_{A/k} → HH_n(A/k), a_0 da_1∧…∧da_n ↦ class of Σ_{σ∈S_n} sgn(σ) a_0⊗a_{σ^{−1}(1)}⊗…⊗a_{σ^{−1}(n)}, is a well-defined natural map of graded-commutative k-algebras Ω^*_{A/k} → HH_*(A/k) (with the shuffle product), where Ω^n_{A/k} = ⋀^n_A Ω¹_{A/k} is built from Mathlib's Kähler differentials and exterior powers. The map π_n : C_n(A/k) → Ω^n_{A/k}, a_0⊗…⊗a_n ↦ a_0 da_1∧…∧da_n, is a chain map (Ω^* with zero differential) and π_n ∘ ε_n = n!·id.

Throughout this statement, k commutative, A commutative k-algebra (flat over k, or replace C_• by the derived HH and ε by its derived version).

([G](#g), §9.2, p. 45.)

The construction proceeds as follows. Check that the antisymmetrised chain is a b-cycle and that its class is A-multilinear, alternating and a derivation in each slot, so ε_n factors through ⋀^n Ω¹ (universal property of Kähler differentials). Check π ∘ b = 0, so π descends to HH_n; compute π_n ε_n = n! id. Multiplicativity: ε is compatible with the shuffle product (§1.6 (Shuffle and external products)).

Provide the following operations and identities.

- `HochschildHomology.hkrMap`: ε : Ω^*_{A/k} → HH_*(A/k), natural in k → A.
- `HochschildHomology.hkrMap_apply`: The antisymmetrisation formula on a_0 da_1∧…∧da_n.
- `HochschildHomology.hkrProj`: π : HH_*(A/k) → Ω^*_{A/k}, a_0⊗…⊗a_n ↦ a_0 da_1∧…∧da_n.
- `HochschildHomology.hkrProj_comp_hkrMap`: π_n ∘ ε_n = n! · id.
- `HochschildHomology.hkrMap_mul`: ε is a map of graded-commutative algebras.
- `HochschildHomology.hkrMap_one`: In degree one, ε_1 is an isomorphism with inverse π_1 (all commutative A), compatible with Mathlib's KaehlerDifferential.

**Checks.**

- `HochschildHomology.hkrMap_zero`: ε_0 : A → HH_0(A/k) = A is the identity.
- `HochschildHomology.hkrMap_polynomial_two`: For A = k[x,y], ε_2(dx∧dy) = class of 1⊗x⊗y − 1⊗y⊗x, a generator of HH_2.
- `HochschildHomology.hkrMap_not_surjective_singular`: For nonzero k and A = k[x]/(x²), ε_2 is not surjective: Ω²_{A/k} = 0 while HH_2(A/k) ≠ 0.

Also establish ε_1 : Ω¹_{A/k} → HH_1(A/k) is the inverse of a_0⊗a_1 ↦ a_0 da_1 (an isomorphism for every commutative A). π_n ε_n = n! shows ε_n is injective with a retraction whenever n! is invertible in k.

*Needs:* §1.1 (The cyclic enhancement of supplied derived Hochschild chains); §1.6 (Shuffle and external products); `KaehlerDifferential`; `ExteriorAlgebra.exteriorPower`.

**The Hochschild–Kostant–Rosenberg theorem.** Let k be a commutative ring and A a smooth commutative k-algebra (Mathlib Algebra.Smooth). Then the antisymmetrisation map ε : Ω^*_{A/k} → HH_*(A/k) is an isomorphism of graded-commutative A-algebras, so HH_n(A/k) ≅ Ω^n_{A/k} for every n; since π_n ∘ ε_n = n!·id, the inverse is (n!)^{-1}π_n when n! is invertible in k; π_n itself is generally not the inverse. For k a perfect field this is HKR's theorem for regular affine algebras.

Throughout this statement, A smooth over k (formally smooth and of finite presentation); in particular A is k-flat and Ω¹_{A/k} is finite projective.

([HKR](#hkr), Theorem 5.2, p. 395; [G](#g), Theorem 9.1.3 (HKR), p. 44; proof §9.3, p. 46; [LQ](#lq), §2, antisymmetrization and differential-forms comparison, pp. 572–574.)

The construction proceeds as follows. Use the stated smooth étale-chart comparison to reduce Zariski locally to A étale over k[x_1,…,x_d]; transfer the Koszul calculation by §1.8 (Étale base change (Weibel–Geller)). The cited Algebra.Smooth predicate alone does not prove this chart theorem. Compute HH of k[x_1,…,x_d] by the Koszul resolution of A over A^e = A⊗_kA (the diagonal ideal is generated by the regular sequence x_i⊗1 − 1⊗x_i), giving HH_n = ⋀^n A^d = Ω^n. Identify the resulting isomorphism with ε (both are algebra maps agreeing in degree one, and HH_*(k[x_i]) is generated by degree one); use DerivedDeRhamCohomology Layer 1/koszul-complex for the regular diagonal resolution. Do not use §1.11 (The derived HKR filtration) here, since its construction uses this theorem.

Also establish HH_*(k[x]/k) = k[x] ⊕ k[x]dx and HH_n(k[x]/k) = 0 for n ≥ 2. HH_*(k[t,t^{−1}]/k) = k[t^{±1}] ⊕ k[t^{±1}] dt/t. For nonzero k, fails for A = k[x]/(x²) (not smooth): HH_2 ≠ 0 = Ω².

*Needs:* §1.9 (The antisymmetrisation map and the HKR projection); §1.8 (Étale base change (Weibel–Geller)); `Algebra.Smooth`; DerivedDeRhamCohomology Layer 0 — smooth cotangent; DerivedDeRhamCohomology Layer 1 — koszul complex; DerivedDeRhamCohomology Layer 0.

**Connes' operator is the de Rham differential under HKR.** For a commutative k-algebra A, the antisymmetrisation map ε of §1.9 (The antisymmetrisation map and the HKR projection) satisfies B ∘ ε_n = ε_{n+1} ∘ d as maps Ω^n_{A/k} → HH_{n+1}(A/k) (on Hochschild homology) (Loday–Quillen, Proposition 2.2), where d is the de Rham differential of the algebraic de Rham complex Ω^•_{A/k} (imported from DerivedDeRhamCohomology Layer 2) and B is Connes' operator; dually π_{n+1} ∘ B = (n+1)·d ∘ π_n. If ℚ ⊆ k, μ_n := π_n/n! is a map of mixed complexes (C(A/k), b, B) → (Ω^•_{A/k}, 0, d); for A smooth over k it is a quasi-isomorphism of mixed complexes (with inverse ε on homology), so C(A/k) is formal as a mixed complex. This does not assert that antisymmetrisation is a strict mixed-complex chain map.

Throughout this statement, A commutative k-algebra; for the formality statement ℚ ⊆ k and A smooth over k.

([LQ](#lq), Proposition 2.2 and proof, pp. 572-573.)

The construction proceeds as follows. Apply the normalised formula for B to the shuffle product ε(a_0 da_1⋯da_n) = (a_0, a_1)·(1, a_2)⋯(1, a_n) (Loday–Quillen (2.3), Proposition 2.2). Import d with d² = 0 and the Leibniz rule from DerivedDeRhamCohomology Layer 2; check π_{n+1}B = (n+1)dπ_n on generators. For ℚ ⊆ k, μ = π/n! is a chain map (C, b) → (Ω, 0) intertwining B with d (Loday–Quillen (2.7)); with §1.9 (The Hochschild–Kostant–Rosenberg theorem) it is a quasi-isomorphism for smooth A.

Also establish For A = k[x] and n = 0: B(ε_0(x^m)) = [1⊗x^m] = m[x^{m−1}⊗x] = ε_1(d(x^m)) in HH_1(k[x]). For ℚ ⊆ k and A smooth, the SBI sequence becomes the de Rham sequence (§1.10 (Cyclic homology of smooth algebras in characteristic zero)).

*Needs:* §1.9 (The antisymmetrisation map and the HKR projection); §1.2 (Connes' operator B); §1.9 (The Hochschild–Kostant–Rosenberg theorem); DerivedDeRhamCohomology Layer 2 — ordinary de rham complex; DerivedDeRhamCohomology Layer 2 — ordinary differential.

### 1.10 Characteristic-zero cyclic calculations

**Cyclic homology of smooth algebras in characteristic zero.** Let k be a commutative ℚ-algebra and A a smooth commutative k-algebra. Then HC_n(A/k) ≅ Ω^n_{A/k}/dΩ^{n−1}_{A/k} ⊕ H^{n−2}_{dR}(A/k) ⊕ H^{n−4}_{dR}(A/k) ⊕ …, HC⁻_n(A/k) ≅ Z^n Ω_{A/k} × Π_{i≥1} H^{n+2i}_{dR}(A/k), and HP_n(A/k) ≅ Π_{i∈ℤ} H^{n+2i}_{dR}(A/k), naturally in A, where H^*_{dR} is the cohomology of the algebraic de Rham complex (DerivedDeRhamCohomology Layer 2) and Z^nΩ the closed forms. Under these isomorphisms S, I, B of the SBI sequence become the evident projections, inclusions and d.

Throughout this statement, ℚ ⊆ k; A smooth over k (for non-smooth A over a ℚ-algebra, HP is the derived/Hartshorne de Rham cohomology (Feigin–Tsygan) and is not recorded here).

([LQ](#lq), Theorem 2.9, pp. 574-575.)

The construction proceeds as follows. By §1.9 (Connes' operator is the de Rham differential under HKR) the mixed complex C(A/k) is quasi-isomorphic to (Ω^*, 0, d). Compute CC, CC⁻, CP of (Ω^*, 0, d) directly: CC(Ω, 0, d) in degree n is ⊕_{i≥0} Ω^{n−2i} with differential u·d, whose homology is as stated (truncation at i = 0 gives Ω^n/dΩ^{n−1}). Apply §1.4 (Cyclic, negative cyclic and periodic cyclic homology) (quasi-isomorphisms of mixed complexes preserve HC, HC⁻, HP).

Also establish HC_n(ℚ[x]/ℚ) = HC_n(ℚ/ℚ) for n ≥ 1, HC_0 = ℚ[x]; HP_*(ℚ[x]/ℚ) = HP_*(ℚ/ℚ) (homotopy invariance of de Rham cohomology). HP_0(ℚ[t^{±1}]/ℚ) = ℚ and HP_1 = ℚ (from H^1_dR spanned by dt/t).

*Needs:* §1.9 (Connes' operator is the de Rham differential under HKR); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §1.4 (Connes' SBI exact sequence); DerivedDeRhamCohomology Layer 2 — ordinary de rham complex.

### 1.11 Derived HKR, circle tensors and a nonflat example

**The derived HKR filtration.** Let R → A be a map of commutative rings. HH(A/R) carries a natural complete descending multiplicative HKR filtration Fil^n (n≥0), with Fil^0=HH(A/R), lim_n Fil^n=0 and gr^n=cofib(Fil^{n+1}→Fil^n)≃∧^n L_{A/R}[n]. It is T-equivariant and the action on graded pieces is trivial. It is left Kan extended from the connective Postnikov filtration τ_{≥n}HH(P/R) of polynomial R-algebras P. For A smooth over R it recovers the HKR graded pieces. For the p-complete version assume A has bounded p^∞-torsion and R→A is p-completely quasismooth in the sense of BMS2 Remark 4.14; then gr^n HH(A/R;ℤ_p)≃(Ω^n_{A/R})^∧_p[n].

Throughout this statement, R → A any map of commutative rings (derived HH); the p-complete statement needs p-complete quasismoothness as in BMS2 Remark 4.14.

([NS](#ns), Chapter IV, §IV.4, Proposition IV.4.1, Acta p. 356; [BMS-arXiv](#bms-arxiv), §2.2, p. 14.)

The construction proceeds as follows. On polynomial P, use τ_{≥n}HH(P/R) and §1.9 (The Hochschild–Kostant–Rosenberg theorem) to identify the graded pieces. Left Kan extend the filtration from polynomial algebras (EnhancedDerivedSheaves E5:animation); identify the derived exterior powers using DerivedDeRhamCohomology Layer 0. The n-connectivity of Fil^n gives completeness. Use multiplicativity of the connective Postnikov filtration and triviality of the action on the graded pieces. Apply BMS2 Remark 4.14 with its bounded p^∞-torsion and p-complete quasismooth hypotheses.

Also establish For A = 𝔽_p over R = ℤ: L_{𝔽_p/ℤ} ≃ 𝔽_p[1], so gr_n = ∧^n(𝔽_p[1])[n] ≃ Γ^n(𝔽_p)[2n] = 𝔽_p[2n] (used in §1.11 (Hochschild homology of 𝔽_p over ℤ)). For smooth A the filtration is the Postnikov filtration. Rationally the normalized HKR comparison gives a natural splitting; no general canonical functorial integral splitting is asserted. Coordinate-dependent polynomial splittings are allowed.

*Needs:* §1.9 (The Hochschild–Kostant–Rosenberg theorem); §1.1 (The cyclic enhancement of supplied derived Hochschild chains); DerivedDeRhamCohomology Layer 0 — cotangent complex; DerivedDeRhamCohomology Layer 0 — derived exterior powers; EnhancedDerivedSheaves E5:animation — animated commutative rings.

**Hochschild homology of 𝔽_p over ℤ.** HH_*(𝔽_p/ℤ) ≅ 𝔽_p⟨u⟩, the divided power algebra over 𝔽_p on a class u of degree 2 (Mathlib DividedPowerAlgebra of 𝔽_p in degree 2): HH_{2n}(𝔽_p/ℤ) = 𝔽_p·u^{[n]}, HH_{odd} = 0. NS18 Lemma IV.4.7 concerns a THH homotopy-fixed-point extension; it is not a statement about the first HKR quotient of HH(𝔽_p/ℤ).

Throughout this statement, Derived HH over ℤ (𝔽_p is not ℤ-flat).

([NS](#ns), Chapter IV, §IV.4, Proposition IV.4.3, Acta p. 357 (preceded on p. 356 by the computation of ∧^i L_{F_p/Z_p}); [NS](#ns), Chapter IV, §IV.4, Lemma IV.4.7, Acta p. 359 (proof p. 359; used in Proposition IV.4.6, p. 358).)

The construction proceeds as follows. L_{𝔽_p/ℤ} ≃ 𝔽_p[1] (𝔽_p = ℤ/p is a quotient by a nonzerodivisor; DerivedDeRhamCohomology Layer 0 regular quotients). §1.11 (The derived HKR filtration) gives gr_n ≃ ∧^n(𝔽_p[1])[n] ≃ Γ^n(𝔽_p)[2n] (décalage: ∧^n(M[1]) ≃ Γ^n(M)[n]); so HH_{2n} is one-dimensional and HH_odd = 0, and the spectral sequence degenerates for degree reasons. Identify the multiplicative structure with the divided power algebra: the shuffle product of u with itself is n!·u^{[n]} (NS18 Proposition IV.4.3).

Also establish HH_2(𝔽_p/ℤ) = 𝔽_p and u^p = 0 in HH_*(𝔽_p/ℤ) (divided powers, not a polynomial algebra). Rationally nothing survives: HH(𝔽_p/ℤ) ⊗ ℚ = 0.

*Needs:* §1.11 (The derived HKR filtration); §1.6 (Shuffle and external products); `DividedPowerAlgebra`; DerivedDeRhamCohomology Layer 0 — regular quotient cotangent.

### Examples

For A=Q[x], the unnormalized boundary sends (a₀,a₁) to a₀a₁−a₁a₀, and hence vanishes in degree one. The normalized Connes class of x² corresponds to d(x²)=2x dx. The sign in t₁=−τ₁ is necessary: using the unsigned rotation in the signed B formula gives, on (x,x), the nonzero boundary 4(x⊗x)−2(1⊗x²)−2(x²⊗1), whereas b(x,x)=0. Thus bB+Bb would fail. On the precyclic cone the differentials are the block matrices ((b,1−t),(0,−b′)) and ((0,0),(N,0)); their anticommutator vanishes by b′N=Nb and (1−t)N=0. This tests the minus sign on b′ independently of normalization.

For Q[x,y], ε(dx∧dy)=1⊗x⊗y−1⊗y⊗x and π ε(dx∧dy)=2dx∧dy. Over Z this is not an inverse HKR map; over Q use π/2 in this degree. For a complex with one copy of Z in every nonnegative even degree and zero differential, the negative cyclic completion admits the sequence (1,1,1,…) along the relevant diagonal, whereas the direct-sum totalization does not. This distinguishes the cyclic and negative cyclic constructions even before introducing B.

### Dependencies

Use the named Mathlib and Tau Ceti inputs under the supplier contracts; external contracts: DerivedDeRhamCohomology Layer 0; DerivedDeRhamCohomology Layer 1; DerivedDeRhamCohomology Layer 2; EnhancedDerivedSheaves E1; EnhancedDerivedSheaves E5:abstract; EnhancedDerivedSheaves E5:animation. The individual statements above identify the required comparison or functoriality, not merely a shared object name.

## Layer 2: Circle actions, Tate constructions and cyclotomic THH

The finite-group Borel norm and Tate functor (BordismFormalGroups §F6.5), and the circle Tate construction, the Tate orbit lemma, the spectral Tate diagonal and THH of connective E∞-rings (AInfCohomology §AI.7.2), are imported. This layer extends them to topological groups, parametrized Tate constructions, THH of E₁-rings and of stable categories, cyclotomic spectra, TC and the genuine models. The naive and genuine constructions of THH are compared only in the bounded-below range, while relative THH retains its circle action without an automatic cyclotomic structure. The free E₁ form of Bökstedt periodicity, the Witt description of π₀TR and representation-graded TR are proved here.

### 2.1 Coherent actions and their adjunctions

**Spectra with an action of a group.** For a finite group G this is BordismFormalGroups §F6.5's Borel category, used unchanged; this target extends it, and the finite-group action framework of EnhancedDerivedSheaves E5:presentability.3, to classifying animas of topological groups, with residual quotient actions. For a topological group (or E_1-group in spaces) G with classifying space BG, the ∞-category of spectra with G-action is Sp^{BG} := Fun(BG, Sp), where Sp is the presentably symmetric monoidal stable ∞-category of spectra (the underlying ∞-category of symmetric spectra with the smash product, GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5 compared with EnhancedDerivedSheaves E5 by E5:spectra-comparison). It is presentable, stable and symmetric monoidal pointwise. For a closed normal subgroup H ⊆ G, restriction gives Sp^{BG} → Sp^{BH}, and the functors −^{hH}, −_{hH} (§2.1 (Homotopy orbits and homotopy fixed points)) land in Sp^{B(G/H)}. For G = T = S¹ and H = C_n the identification T/C_n ≅ T by z ↦ z^n is fixed once and for all and used to regard residual actions as T-actions.

Throughout this statement, G a topological group; BG its classifying Kan complex; Sp the stable ∞-category of spectra.

([NS](#ns), Chapter I, §I.1, Definition I.1.13, Acta p. 218.)

The construction proceeds as follows. Form the functor ∞-category Fun(BG, Sp) (limits and colimits pointwise, EnhancedDerivedSheaves E0). For finite G compare with the supplied categorical fixed points of its trivial action on Sp (EnhancedDerivedSheaves E5:presentability.3); for general topological G use the classifying Kan complex and the general functor/limit universal properties, rather than a finite-quotient continuity formula. Stability and presentability are inherited. Construct restriction along H → G and the residual (G/H)-action on fixed points/orbits by right/left Kan extension along BG → B(G/H) (EnhancedDerivedSheaves E3).

Provide the following operations and identities.

- `Coherent.SpectraWithAction`: Sp^{BG} = Fun(BG, Sp) for a topological group G.
- `Coherent.SpectraWithAction.res`: Restriction along a group homomorphism H → G, with res_id and res_comp.
- `Coherent.SpectraWithAction.trivial`: The trivial action functor Sp → Sp^{BG}, right adjoint to −_{hG} and left adjoint to −^{hG}, i.e. −_{hG} ⊣ trivial ⊣ −^{hG}.
- `Coherent.SpectraWithAction.instStable`: Sp^{BG} is a presentable stable ∞-category; fibres and cofibres are computed underlying.
- `Coherent.SpectraWithAction.circleQuotient`: The identification T/C_n ≅ T, z ↦ z^n, inducing Sp^{B(T/C_n)} ≃ Sp^{BT}.

**Checks.**

- `SpectraWithAction.trivialGroup`: For G = 1, Sp^{BG} ≃ Sp.
- `SpectraWithAction.underlying_conservative`: A map in Sp^{BG} is an equivalence iff its underlying map of spectra is.
- `SpectraWithAction.discrete_vs_continuous`: For G = T, Sp^{BT} is not Sp^{BT^δ} for the discrete circle: T acts trivially up to homotopy on π_* of every object of Sp^{BT} since T is connected, whereas T^δ can act nontrivially.

Also establish For G trivial, Sp^{BG} = Sp. For a commutative ring k, D(k)^{BT} is computed by mixed complexes (§2.8 (Mixed complexes model complexes with circle action)). The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

*Needs:* GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; EnhancedDerivedSheaves E5:spectra-comparison; EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E5:presentability — presentable categories; EnhancedDerivedSheaves E5:presentability — coherent group actions; EnhancedDerivedSheaves E0 — limits colimits and slices; EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category; EnhancedDerivedSheaves E3; EnhancedDerivedSheaves E0; `SSet.Quasicategory`.

**Homotopy orbits and homotopy fixed points.** For finite G these are the functors of BordismFormalGroups §F6.5; the statement here is for every topological group G. For X ∈ Sp^{BG}, the homotopy orbits X_{hG} := colim_{BG} X and homotopy fixed points X^{hG} := lim_{BG} X; −_{hG} and −^{hG} are left and right adjoint to the trivial-action functor Sp → Sp^{BG}. For H ⊆ G normal they refine to functors Sp^{BG} → Sp^{B(G/H)}. They are exact, −_{hG} preserves colimits and −^{hG} limits; −^{hG} is lax symmetric monoidal. For an abelian group M with G-action, π_{−i}(HM^{hG}) = H^i(G, M) and π_i(HM_{hG}) = H_i(G, M). The group-homology and group-cohomology dictionary for Eilenberg–Mac Lane objects uses discrete G; for a topological group anima use (co)homology of BG with its local coefficient system.

Throughout this statement, G a topological group; X ∈ Sp^{BG}.

([NS](#ns), Chapter I, §I.1, Definition I.1.13, Acta p. 218.)

The construction proceeds as follows. Define by Kan extension along BG → ∗ (residual versions along BG → B(G/H)). Adjunctions and exactness are formal (EnhancedDerivedSheaves E0/E3); lax monoidality of the right adjoint of a symmetric monoidal functor. Identify homotopy groups for Eilenberg–Mac Lane spectra with group (co)homology via the bar resolution (Mathlib groupCohomology for discrete G).

Provide the following operations and identities.

- `Coherent.homotopyOrbits`: −_{hG} : Sp^{BG} → Sp (and residual Sp^{BG} → Sp^{B(G/H)}).
- `Coherent.homotopyFixedPoints`: −^{hG} : Sp^{BG} → Sp (and residual).
- `Coherent.homotopyOrbits.adj`: −_{hG} ⊣ triv ⊣ −^{hG}.
- `Coherent.homotopyFixedPoints.laxMonoidal`: −^{hG} is lax symmetric monoidal; X^{hG} is an E_∞-ring if X is an E_∞-ring with G-action.
- `Coherent.homotopyFixedPoints.trans`: (X^{hH})^{h(G/H)} ≃ X^{hG} for H normal (transitivity), and dually for orbits.
- `Coherent.homotopyFixedPoints.em`: π_{−i}(HM^{hG}) ≅ H^i(G, M) for a discrete group G and G-module M (Mathlib groupCohomology).

**Checks.**

- `homotopyFixedPoints.trivialGroup`: For G trivial, X^{hG} = X_{hG} = X.
- `homotopyFixedPoints.HZ_circle`: π_*((HZ)^{hT}) = ℤ[t] with |t| = −2.
- `homotopyFixedPoints.group_cohomology`: For Hℤ with trivial C₂-action, π_{−2}(Hℤ^{hC₂})≅ℤ/2 and π_{−1}=0. This distinguishes homotopy fixed points from taking the underlying fixed subgroup, without importing the Segal completion theorem.

Also establish (HZ)^{hT} has π_* = ℤ[t], |t| = −2; (HZ)_{hT} has π_{2i} = ℤ for i ≥ 0. (S)^{hC_2} and (S)_{hC_2} are the stable cohomotopy and homotopy of ℝP^∞_+. The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

*Needs:* §2.1 (Spectra with an action of a group); EnhancedDerivedSheaves E0 — limits colimits and slices; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5 — eilenberg maclane spectrum; EnhancedDerivedSheaves E3.

### 2.2 Algebraic Tate cohomology of Eilenberg–Mac Lane spectra

**Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology.** For a finite group G and a G-module M (an abelian group with G-action), π_i(HM^{tG}) ≅ Ĥ^{−i}(G, M) naturally in M, where Ĥ is Tate cohomology (Mathlib tateCohomology, built from the norm map). For G = C_n cyclic, Ĥ^* is 2-periodic (Tau Ceti Rep.FiniteCyclicGroup.tateCohomologyIsoEven) and π_*(HZ^{tC_n}) ≅ ℤ/n[t^{±1}], |t| = −2.

Throughout this statement, G finite; M a ℤ[G]-module.

([NS](#ns), Chapter I, §I.1, paragraph after Definition I.1.13, Acta p. 218.)

The construction proceeds as follows. Compute HM_{hG} and HM^{hG} by the bar resolution: group homology and cohomology. Identify the norm map on homotopy with the norm used to splice the complete resolution; the long exact sequence identifies π_*HM^{tG} with the homology of the Tate complex. Compare with Mathlib's Tate complex (built from the same norm) and Tau Ceti's periodicity for cyclic groups.

Also establish π_*(HZ^{tC_2}) = 𝔽_2[t^{±1}]: π_even = ℤ/2, π_odd = 0. π_0(HM^{tG}) = M^G/Nm(M) = Ĥ^0(G, M).

*Needs:* BordismFormalGroups §F6.5 (finite-group Borel norm and Tate cofiber); `tateCohomology`; `Rep.FiniteCyclicGroup.tateCohomologyIsoEven`; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5 — eilenberg maclane spectrum.

### 2.3 The finite-action Verdier quotient

**Tate endomorphisms in the finite-action Verdier quotient.** For a commutative ring spectrum R and a prime p, let Q=Fun(BC_p,Perf(R))/Perf(R[C_p]), where the latter is its full stable subcategory of induced perfect modules. The quotient has the tensor structure induced by tensoring over R, and its endomorphism ring of the trivial R-object is R^{tC_p}. Consequently there is an exact symmetric monoidal functor Perf(R^{tC_p})→Q. Its K-theoretic application is stated after constructing stable-category K-theory, in §4.10. General stable Verdier quotients, their Ind mapping formula and the symmetric monoidal quotient universal property are imports from EDS E5; this target is the finite-action/Tate specialization used in LMMT item 49. The commutative hypothesis supplies the symmetric monoidal conclusion; no such structure is asserted for an arbitrary E_1 coefficient ring.

Throughout this statement, R an E∞ ring spectrum; p prime; Perf(R[C_p]) means the full thick induced subcategory inside Fun(BC_p,Perf(R)).

([NS](#ns), arXiv:1707.01799v2, Theorem I.3.3(ii), pp. 19–20; Theorem I.3.6, p. 23; Lemma I.3.8(iii), pp. 24–25 (same numbered results in Acta version); [LMMT](#lmmt), Remark 3.9, pp. 15–16.)

The construction proceeds as follows. Induced perfect R[C_p]-modules form a thick tensor ideal because C_p is finite; identify that ideal with Perf(R[C_p]). Use EDS’s filtered-cofiber formula for mapping spectra in the quotient. The finite-action version of the NS induced-object calculation kills the orbit term and leaves the Tate term for End_Q(R). Apply the symmetric monoidal quotient universal property. The endomorphism ring of its tensor unit determines the exact tensor functor from its perfect modules.

Also establish For rational R, Tate vanishes and the induced ideal is all of Fun(BC_p,Perf(R)); the quotient is zero. For R=HF_p the tensor unit has a nonzero Tate endomorphism ring with homotopy F_p[t±1]⊗Λ(e) for odd p, |t|=−2, |e|=−1 (for p=2 it is F_2[e±1], |e|=−1). The quotient uses the thick induced ideal; replacing it by all objects perfect only over R would incorrectly kill its unit in characteristic p.

*Needs:* BordismFormalGroups §F6.5 and AInfCohomology §AI.7.2 (the lax symmetric monoidal Tate functor, with its residual C_p form); BordismFormalGroups §F6.5 (the induced-object tensor ideal and Tate vanishing); EnhancedDerivedSheaves E5:abstract.

### 2.4 Postnikov bounds and the Tate fixpoint lemma

**Tate constructions at C_p: convergence, vanishing and p-completeness.** For a finite group G and Y ∈ Sp^{BG}: (i) Y^{hG} → lim_n (τ_{≤n}Y)^{hG}, and likewise for −_{hG} and −^{tG}, are equivalences, and colim_n (τ_{≥−n}Y)^{tG} → Y^{tG} is an equivalence (and likewise for −^{hG}, −_{hG}); (ii) if p acts invertibly on π_*Y for Y ∈ Sp^{BC_p}, then Y^{tC_p} ≃ 0; (iii) if X ∈ Sp^{BC_p} is bounded below, X^{tC_p} is p-complete and X^{tC_p} ≃ (X^∧_p)^{tC_p}.

Throughout this statement, G finite; for (iii) X bounded below.

([NS](#ns), Chapter I, §I.2, Lemma I.2.6, Acta p. 222; part (i) includes Y^{tG} → lim_n(τ_{≤n}Y)^{tG}; [NS](#ns), Chapter I, §I.2, Lemma I.2.8, Acta p. 223; [NS](#ns), Chapter I, §I.2, Lemma I.2.9, Acta p. 224.)

The construction proceeds as follows. (i): NS18 Lemma I.2.6 — Postnikov towers converge and −^{hG}, −_{hG} commute with the relevant limits/colimits by connectivity of the homotopy-orbit spectral sequences. (ii): by (i) reduce to Eilenberg–Mac Lane spectra HM with p invertible on M; their Tate spectra have π_* = Ĥ^{−*}(C_p; M), which is killed by p and on which p is invertible, hence zero (NS18 Lemma I.2.8). (iii): reduce to Eilenberg–Mac Lane pieces using (i); each (HM)^{tC_p} is p-torsion by §2.2 (Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology) (NS18 Lemma I.2.9); p-completion via StableHomotopyKTheory Layer 7.

Also establish (HQ)^{tC_p} = 0 by (ii). S^{tC_p} ≃ S^∧_p (Segal conjecture for C_p; NS18 Example II.1.2(ii)), consistent with (iii).

*Needs:* BordismFormalGroups §F6.5 (finite-group Borel norm and Tate cofiber); §2.2 (Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology); GeneralizedCohomology G3.8; StableHomotopyKTheory §§7.14–7.18.

**The Tate fixpoint lemma.** Let X ∈ Sp^{BC_{p²}} be bounded above. Then (X^{hC_p})^{t(C_{p²}/C_p)} ≃ 0.

Throughout this statement, X bounded above.

([NS](#ns), Chapter I, §I.2, Lemma I.2.2 (Tate fixpoint lemma), Acta p. 219; proof on p. 224.)

The construction proceeds as follows. Dual to AInfCohomology §AI.7.2 (`AInf.Trace.tateOrbit`): reduce by Postnikov convergence (colimit form) to Eilenberg–Mac Lane spectra and use the vanishing for the coconnective two-stage pieces τ_{[−2i−1,−2i]} (NS18 Lemmas I.2.2, I.2.4).

Also establish For X = HF_p with trivial action: ((HF_p)^{hC_p})^{tC_p} = 0. The hypothesis is needed: for S with trivial action (S^{hC_p})^{t(C_{p²}/C_p)} ≃ S^∧_p ≠ 0 (NS18 Example I.2.3(i)).

*Needs:* §2.4 (Tate constructions at C_p: convergence, vanishing and p-completeness); §2.2 (Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology).

### 2.5 Parametrized Tate constructions

**The Tate construction for a Kan complex and the dualizing spectrum.** For a Kan complex S with p : S → ∗: (i) Sp^S is compactly generated by the s_!S; (ii) there is an initial functor p^T_* under p_* such that p_* → p^T_* vanishes on compact objects; (iii) it is unique such that fib(p_* → p^T_*) preserves colimits; (iv) fib(p_* → p^T_*) ≃ p_!(D_S ⊗ −) for a unique D_S ∈ Sp^S, the dualizing spectrum (Spivak–Klein), with fibre lim_{t∈S} Σ^∞_+ Map(s, t); (v) p_!(D_S ⊗ −) → p_* is the universal colimit-preserving approximation (assembly); (vi) if p^T_* vanishes on all s_!X, p^T_* has a unique lax symmetric monoidal structure making p_* → p^T_* lax symmetric monoidal. For S = BG with G finite this recovers Nm_G and −^{tG}, with D_{BG} = S with the trivial action.

Throughout this statement, S a Kan complex.

([NS](#ns), Chapter I, §I.4, Theorem I.4.1 and Definition I.4.2, Acta p. 235; proof pp. 237-238.)

The construction proceeds as follows. Compact generation and the universal property of colimit-preserving approximations (EnhancedDerivedSheaves E5:presentability). Define p^T_* as the cofibre of the assembly map; identify the assembly with p_!(D_S ⊗ −) by evaluating on generators s_!S. Multiplicativity as in BordismFormalGroups §F6.5 and AInfCohomology §AI.7.2 (the lax symmetric monoidal Tate functor, with its residual C_p form) (NS18 Theorem I.4.1).

Also establish For S = BG, G finite: D_{BG} ≃ S (trivial action) and p^T_* = −^{tG}. For S = BT the dualizing spectrum is a shift of the sphere (Klein), which gives the norm Σ(−_{hT}) → −^{hT} of AInfCohomology §AI.7.2 (Circle actions, homotopy fixed points and Tate constructions). The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

*Needs:* §2.1 (Spectra with an action of a group); BordismFormalGroups §F6.5 (finite-group Borel norm and Tate cofiber); EnhancedDerivedSheaves E5:presentability — compact objects; EnhancedDerivedSheaves E5:presentability — presentable categories; EnhancedDerivedSheaves E0; EnhancedDerivedSheaves E3.

### 2.6 Cyclic realization and subdivision

**Geometric realisation of cyclic objects and the circle action.** For a cyclic object X : Λ^op → C in an ∞-category C with geometric realisations, the realisation |X| := colim_{Δ^op} X|_{Δ^op} carries a natural T-action, i.e. |−| refines to a functor Fun(Λ^op, C) → Fun(BT, C); this comes from the cofinality of Δ^op → Λ_∞^op and the identification of the colimit over Λ_∞^op with a BT-indexed functor (Connes: the classifying space of Λ is BT; NS18 Appendix B). For cyclic sets the T-action is the classical one on the realisation of the cyclic set.

Throughout this statement, C an ∞-category with geometric realisations (colimits over Δ^op).

([NS](#ns), Appendix B, Proposition B.5 (Acta p. 384), Construction B.9 (Acta p. 387), Proposition B.13 (Acta p. 390), with Corollary B.14 (p. 391); [NS](#ns), Appendix B, definitions of Λ_∞, Λ_p, Λ (Acta pp. 380-381), Proposition B.1 (Acta p. 381), Theorem B.3 (Acta p. 382; proof pp. 382-383), Corollary B.4 (p. 383).)

The construction proceeds as follows. Define Λ_∞ and Λ_p (NS18 Appendix B) and prove Δ^op → Λ_∞^op cofinal (NS18 Theorem B.3). Λ_∞ has a free BZ-action with quotient Λ, whose classifying space realises BT; left Kan extend along Λ^op → BT to obtain the T-equivariant colimit (NS18 Proposition B.5). Compare with the point-set realisation of paracyclic spaces (NS18 Construction B.9, Proposition B.13).

Provide the following operations and identities.

- `CyclicObject.realize`: |X| ∈ Fun(BT, C) for X ∈ Fun(Λ^op, C).
- `CyclicObject.realize_underlying`: The underlying object of |X| is the simplicial colimit of X|_{Δ^op}.
- `CyclicObject.realize_map`: Naturality in maps of cyclic objects and in colimit-preserving functors C → D.
- `ParacyclicCategory.cofinal`: Δ^op → Λ_∞^op is cofinal (NS18 Theorem B.3).

**Checks.**

- `CyclicObject.realize_const`: The realisation of a constant cyclic object c is c with trivial T-action.
- `CyclicObject.realize_circle`: The representable cyclic set Λ(−, [0]) has underlying simplicial set the simplicial circle Δ¹/∂Δ¹ (n + 1 simplices in degree n) and realises to T with its translation action.
- `CyclicObject.realize_not_just_space`: The representable Λ(−,[0]) and the constant cyclic space T both have underlying realisation T, but the former has translation action and the latter trivial action. Their homotopy orbits are respectively contractible and T×BT, so retaining only the realised space loses data.

Also establish The cyclic set Λ^1 (the simplicial circle with its cyclic structure) realises to T with its translation action. For the cyclic bar construction of a discrete group G, |B^{cyc}G| ≃ LBG with the rotation action. The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

*Needs:* §1.1 (Connes' cyclic category and cyclic objects); EnhancedDerivedSheaves E0 — cocartesian fibrations and restricted straightening; EnhancedDerivedSheaves E0 — limits colimits and slices; EnhancedDerivedSheaves E3; EnhancedDerivedSheaves E0.

**Edgewise subdivision and Tate constructions of realisations.** For a cyclic object X in an ∞-category with colimits and r≥1, r-fold edgewise subdivision sd_r X is a Λ_r-object and |sd_r X|≃|X| T-equivariantly, realizing the C_r-action levelwise (NS18 Proposition B.19, with the circle action of the classifying-space comparison in Corollary B.5). NS18 Proposition B.20 supplies a natural T/C_p-equivariant comparison |(sd_p X)^{tC_p}|→|X|^{tC_p}, not an equivalence. No commutation of geometric realization with finite Tate is asserted, even for uniformly bounded-below levels.

Throughout this statement, C has colimits for subdivision and realization; C=Sp and p prime for the Tate comparison.

([NS](#ns), Appendix B, Propositions B.19–B.20, Acta pp. 394–396.)

The construction proceeds as follows. Precompose with the subdivision functor Λ_p→Λ, as in NS18 Appendix B. Identify the realizations using Proposition B.19. Use the universal cocone followed by finite Tate to obtain the comparison of Proposition B.20. This construction requires a comparison map, not preservation of the colimit.

Also establish For X the cyclic bar construction of an algebra, sd_p X in degree n is A^{⊗p(n+1)} with C_p permuting blocks: this is how the Tate diagonal enters the Frobenius.

*Needs:* §2.6 (Geometric realisation of cyclic objects and the circle action); §2.4 (Tate constructions at C_p: convergence, vanishing and p-completeness).

### 2.7 Absolute THH of E₁-rings

**Topological Hochschild homology of an E_1-ring.** For a connective E∞-ring this is AInfCohomology §AI.7.2's THH, with its E∞ structure; the target here is the construction for every E₁-ring spectrum, agreeing with that one on connective E∞-rings. For A ∈ Alg_{E_1}(Sp), THH(A) ∈ Sp^{BT} is the geometric realisation, with its circle action (§2.6 (Geometric realisation of cyclic objects and the circle action)), of the cyclic bar construction [n] ↦ A^{⊗(n+1)} in Sp (the cyclic object built from the E_1-structure, NS18 Definition III.2.3). It is functorial in E_1-maps, THH(S) ≃ S with trivial action, and for a discrete ring R, THH(R) := THH(HR). The relative version over an E_∞-ring k is §2.8 (THH relative to an E_∞-ring).

Throughout this statement, A an E_1-algebra in spectra (Alg_{E_1}(Sp) from EnhancedDerivedSheaves E5:abstract applied to Sp).

([NS](#ns), Chapter III, §III.2, Definition III.2.3 (Acta p. 293); construction of the Frobenius ϕ_p in §III.2, Acta pp. 294-296, completed by Corollary III.3.8 (pp. 302-303).)

The construction proceeds as follows. Construct the cyclic bar construction as a functor Λ^op → Sp using the operadic description of Ass^⊗_act and the cyclic category over it (NS18 Proposition B.1). Realise with the T-action (§2.6 (Geometric realisation of cyclic objects and the circle action)). Check THH(S) ≃ S (the cyclic bar construction of S is constant) and compare with HH for HZ-algebras (§2.8 (THH relative to THH(ℤ) is Hochschild homology)).

Provide the following operations and identities.

- `THH`: THH : Alg_{E_1}(Sp) → Sp^{BT}.
- `THH.map`: E_1-maps induce T-equivariant maps, with map_id and map_comp.
- `THH.unit`: The degree-zero cyclic-bar map A→forget_T THH(A) is natural on underlying spectra. It has no general T-equivariant refinement with trivial action on A.
- `THH.ofRing`: THH(R) := THH(HR) for a discrete ring R.
- `THH.pi0`: π_0 THH(R) ≅ R/[R,R] for a connective E_1-ring with π_0 = R.
- `THH.connective`: THH(A) is connective if A is.
- `THH.sphereUnit`: The unit S→THH(A) is T-equivariant when S has trivial circle action; it is distinct from the degree-zero map A→forget_T THH(A).

**Checks.**

- `THH.sphere`: THH(S) ≃ S with trivial T-action.
- `THH.Fp_pi2`: π_2 THH(𝔽_p) ≅ 𝔽_p (generated by Bökstedt's σ), while HH_2(𝔽_p/𝔽_p) = 0.
- `THH.not_HH`: THH(𝔽_p) ≠ HH(𝔽_p/𝔽_p) = 𝔽_p: π_2 differs, so THH of a discrete ring is not its Hochschild homology over itself.
- `THH.pi0_compat`: π_0 THH(R) ≅ HH_0(R/ℤ) = R/[R,R], compatible with §1.1 (The cyclic enhancement of supplied derived Hochschild chains).

Also establish π_0 THH(R) = R/[R,R] for a discrete ring R (= HH_0). THH(𝔽_p) has π_* = 𝔽_p[σ], |σ| = 2 (§2.7 (Bökstedt periodicity)).

*Needs:* §2.6 (Geometric realisation of cyclic objects and the circle action); §2.1 (Spectra with an action of a group); §1.1 (The cyclic bar construction of an algebra); EnhancedDerivedSheaves E5:abstract — algebra objects; EnhancedDerivedSheaves E5:abstract — infinity operad; GeneralizedCohomology G2.8; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5 — smash product.

**The cyclotomic Frobenius of THH.** This extends the Frobenius of AInfCohomology §AI.7.2 from connective E∞-rings to all E₁-rings and all primes simultaneously. For A ∈ Alg_{E_1}(Sp) and each prime p there is a natural T ≅ T/C_p-equivariant map φ_p : THH(A) → THH(A)^{tC_p}, obtained by applying the Tate diagonal A → (A^{⊗p})^{tC_p} levelwise to the p-fold edgewise subdivision of the cyclic bar construction and realising, using the canonical comparison from realization of levelwise Tate to Tate of the realization (NS18 §III.2). This makes THH(A) a cyclotomic spectrum (§2.9 (Cyclotomic spectra)), naturally in A.

Throughout this statement, A an E_1-ring; p prime. The Frobenius construction needs no realization/Tate commutation assumption.

([NS](#ns), Chapter III, §III.2, Definition III.2.3 (Acta p. 293); construction of the Frobenius ϕ_p in §III.2, Acta pp. 294-296, completed by Corollary III.3.8 (pp. 302-303).)

The construction proceeds as follows. Edgewise subdivide: sd_p of the cyclic bar construction has C_p acting on A^{⊗p(n+1)} by block permutation (§2.6 (Edgewise subdivision and Tate constructions of realisations)). Apply the Tate diagonal of A^{⊗(n+1)} levelwise to get A^{⊗(n+1)} → ((A^{⊗(n+1)})^{⊗p})^{tC_p} (AInfCohomology §AI.7.2 (Spectral Tate diagonal)). Realise, then compose with |(sd_p X)^{tC_p}|→|X|^{tC_p} from §2.6 (Edgewise subdivision and Tate constructions of realisations) (NS18 Proposition B.20 and §III.2). Check T ≅ T/C_p-equivariance through the Λ_p-structure.

Provide the following operations and identities.

- `THH.frobenius`: φ_p : THH(A) → THH(A)^{tC_p}, T ≅ T/C_p-equivariant, natural in A.
- `THH.toCyclotomic`: THH(A) with (φ_p)_p as an object of CycSp.
- `THH.frobenius_sphere`: φ_p for A = S is S → S^{tC_p}.
- `THH.frobenius_multiplicative`: For A an E_∞-ring, φ_p is a map of E_∞-rings (§2.9 (THH is symmetric monoidal; THH of E_∞-rings)).

**Checks.**

- `THH.frobenius_zero`: For A = 0, φ_p is the zero map 0 → 0.
- `THH.frobenius_sphere_pcomplete`: π_0(φ_p) for A = S is ℤ → ℤ_p, the p-completion.
- `THH.frobenius_not_equivalence`: φ_p is not an equivalence in general: for A = HF_p its target THH(𝔽_p)^{tC_p} has nonzero negative homotopy while THH(𝔽_p) is connective.

Also establish For A = S, φ_p : S → S^{tC_p} is the canonical map (a p-completion by the Segal conjecture). For A = HF_p, φ_p identifies THH(𝔽_p) with τ_{≥0}((HZ_p)^{tC_p}) as E_∞-cyclotomic spectra (NS18 Corollary IV.4.16), the cyclotomic form of §2.7 (Bökstedt periodicity).

*Needs:* §2.7 (Topological Hochschild homology of an E_1-ring); AInfCohomology §AI.7.2 (Spectral Tate diagonal); §2.6 (Edgewise subdivision and Tate constructions of realisations); BordismFormalGroups §F6.5 and AInfCohomology §AI.7.2 (the lax symmetric monoidal Tate functor, with its residual C_p form).

**Bökstedt periodicity.** AInfCohomology §AI.7.2 (Bökstedt periodicity) supplies the ring isomorphisms π_*THH(𝔽_p)≅𝔽_p[u], |u|=2, and π_*THH(R;ℤ_p)≅R[u] for perfectoid R. This target refines them to spectra. For every prime p, THH(𝔽_p) is the free E₁-𝔽_p-algebra on one class u of degree 2; equivalently THH(𝔽_p)≃𝔽_p[ΩS³] as E₁-𝔽_p-algebras, with u determined up to a unit of 𝔽_p. For a perfect 𝔽_p-algebra k the E₁-algebra map THH(𝔽_p)⊗_{𝔽_p}k→THH(k) is an equivalence. The cyclotomic Frobenius identifies THH(𝔽_p) with τ_{≥0}((HZ_p)^{tC_p}) as cyclotomic E∞-rings.

Throughout this statement, p a prime; THH over the sphere; k a perfect 𝔽_p-algebra. The free description is E₁, the Tate identification E∞.

([KN](#kn), §1, Theorem 1.1, p. 4, deduced there from Theorem 1.2 with Proposition 1.4 and Lemma 1.6, pp. 4–6; §2, Proposition 2.1, p. 6; [NS](#ns), Chapter IV, Corollary IV.4.16.)

The construction proceeds as follows. First show that 𝔽_p⊗_S𝔽_p is the free E₂-𝔽_p-algebra on one class of degree 1: compare the free E₂-algebra with the dual Steenrod algebra, using Milnor's ring structure and the Dyer–Lashof operations supplied by AInfCohomology §AI.7.2 (Dyer–Lashof operations and the dual Steenrod input), as in Krause–Nikolaus Proposition 1.4. Write THH(𝔽_p)=𝔽_p⊗_{𝔽_p⊗_S𝔽_p}𝔽_p; the bar construction of a free E₂-algebra on a degree-one class is free E₁ on its suspension. For perfect k, compare k⊗_Sk with k⊗_{𝔽_p}(𝔽_p⊗_S𝔽_p) through the relative Frobenius (Krause–Nikolaus Proposition 2.1). The cyclotomic form is Nikolaus–Scholze Corollary IV.4.16, deduced from the polynomial description through the Frobenius of §2.7 (The cyclotomic Frobenius of THH).

Provide the following operations and identities.

- `THH.bokstedt_free`: THH(𝔽_p) is the free E₁-𝔽_p-algebra on a class of degree 2.
- `THH.bokstedt_perfect`: THH(𝔽_p)⊗_{𝔽_p}k≃THH(k) as E₁-algebras for every perfect 𝔽_p-algebra k; on homotopy it is the supplied ring isomorphism.
- `THH.bokstedt_tate`: φ_p identifies THH(𝔽_p) with τ_{≥0}((HZ_p)^{tC_p}).

**Checks.**

- `THH.bokstedt_polynomial`: u^p≠0 in π_{2p}THH(𝔽_p). The ordinary relative Hochschild homology HH(𝔽_p/ℤ) has a divided-power generator a of degree 2 with a^p=p!γ_p(a)=0, so the two graded rings have the same additive groups and different products.
- `THH.bokstedt_imperfect`: For k=𝔽_p(t), π₁THH(k)≅HH₁(k/ℤ)≅Ω¹_{k/ℤ} contains dt≠0, whereas k[u] has nothing in odd degrees. Perfectness cannot be dropped from `THH.bokstedt_perfect`.
- `THH.bokstedt_vs_integers`: π_*THH(ℤ_p)^∧_p has π_{2p−1}=ℤ/p (§6.8), so THH of the mixed-characteristic ring ℤ_p is not even; Bökstedt's evenness is special to perfect rings of characteristic p.

*Needs:* AInfCohomology §AI.7.2 (Bökstedt periodicity); AInfCohomology §AI.7.2 (Dyer–Lashof operations and the dual Steenrod input); §2.7 (Topological Hochschild homology of an E_1-ring); §2.7 (The cyclotomic Frobenius of THH); §2.8 (THH relative to THH(ℤ) is Hochschild homology); EnhancedDerivedSheaves E5:abstract — algebra objects; StableHomotopyKTheory Layer 5.

### 2.8 Relative THH and mixed-complex realization

**THH relative to an E_∞-ring.** For an E_∞-ring k and an E_1-k-algebra A (an E_1-algebra in Mod_k), THH(A/k) ∈ Mod_k^{BT} is the realisation of the cyclic bar construction formed with ⊗_k; equivalently THH(A/k) ≃ THH(A) ⊗_{THH(k)} k, where k is a THH(k)-algebra through the T-equivariant augmentation THH(k) = k⊗T → k. For a commutative ring R and an R-algebra A, THH(HA/HR) ≃ HH(A/R) (the Eilenberg–Mac Lane spectrum of derived Hochschild homology, with its T-action). THH(A/k) carries no cyclotomic Frobenius in general (k ≠ S); relative versions with Frobenius require a Frobenius lift on k (S[z], in AInfCohomology §AI.7.2; ku with its ψ-operations, in Layer 6).

Throughout this statement, k an E_∞-ring; A an E_1-k-algebra.

([BMS-arXiv](#bms-arxiv), Lemma 2.5, p. 15; [NS](#ns), Chapter III, §III.2, Definition III.2.3 (Acta p. 293); construction of the Frobenius ϕ_p in §III.2, Acta pp. 294-296, completed by Corollary III.3.8 (pp. 302-303).)

The construction proceeds as follows. Construct the cyclic bar construction in Mod_k (symmetric monoidal) and realise (§2.6 (Geometric realisation of cyclic objects and the circle action)). THH(A/k) ≃ THH(A) ⊗_{THH(k)} k by comparing cyclic bar constructions (base change of cyclic objects). For k = HR, identify Mod_{HR} ≃ D(R) (EnhancedDerivedSheaves E5:spectra-comparison) and the cyclic bar construction with the Hochschild complex of a flat resolution (§1.1 (The cyclic enhancement of supplied derived Hochschild chains)).

Provide the following operations and identities.

- `THH.relative`: THH(A/k) ∈ Mod_k^{BT}.
- `THH.relative_baseChange`: THH(A/k) ≃ THH(A) ⊗_{THH(k)} k.
- `THH.relative_HZ`: THH(HA/HR) ≃ H(HH(A/R)) T-equivariantly (§1.1 (The cyclic enhancement of supplied derived Hochschild chains)).
- `THH.relative_map`: Functorial in maps of pairs (k → A).
- `THH.relative_baseChange_k`: For k → k′ of E_∞-rings, THH(A⊗_kk′/k′) ≃ THH(A/k)⊗_kk′.

**Checks.**

- `THH.relative_self`: THH(k/k) ≃ k.
- `THH.relative_polynomial`: π_*THH(HZ[x]/HZ) = ℤ[x] ⊕ ℤ[x]dx in degrees 0, 1.
- `THH.relative_vs_absolute`: THH(HF_p/HZ) = HH(𝔽_p/ℤ) has π_* a divided power algebra on a degree-2 class, while THH(HF_p) has polynomial π_* = 𝔽_p[σ]: relative and absolute THH differ.

Also establish THH(k/k) = k with trivial action. THH(HZ[x]/HZ) = HH(ℤ[x]/ℤ) with π_* = ℤ[x] ⊕ ℤ[x]dx.

*Needs:* §2.7 (Topological Hochschild homology of an E_1-ring); §1.1 (The cyclic enhancement of supplied derived Hochschild chains); EnhancedDerivedSheaves E5:abstract — module objects; EnhancedDerivedSheaves E5:spectra-comparison.

**Mixed complexes model complexes with circle action.** For a commutative ring k, D(k)^{BT} = Fun(BT, D(k)) is equivalent to the ∞-category of mixed complexes over k localised at quasi-isomorphisms (dg-modules over C_*(T; k) ≃ k[ε]/ε², |ε| = 1). Under this equivalence, for an algebra A the T-action on HH(A/k) (§2.8 (THH relative to an E_∞-ring), §1.1 (The cyclic enhancement of supplied derived Hochschild chains)) corresponds to the mixed complex (C(A/k), b, B), and HH(A/k)^{hT} ≃ CC⁻(A/k), HH(A/k)^{tT} ≃ CP(A/k), HH(A/k)_{hT} ≃ CC(A/k) (with the shift conventions of §1.4 (Cyclic, negative cyclic and periodic cyclic homology)), so that the norm sequence Σ HH_{hT} → HH^{hT} → HH^{tT} is ΣHC → HC⁻ → HP.

Throughout this statement, k commutative ring; product totalisations for −^{hT} and −^{tT}.

([H](#h), Theorem 2.1, p. 4.)

The construction proceeds as follows. C_*(T; k) is formal, equal to k[ε]/ε² with |ε| = 1 (T is an H-space with H_* = Λ[ε]); modules over it in D(k) are Fun(BT, D(k)) (Koszul/Schwede–Shipley; Hoyois). Identify homotopy fixed points with RHom_{k[ε]}(k, −), computed by the Koszul resolution: M[[u]] with b + uB (product totalisation). Identify the T-action on |C_•(A)| (§2.6 (Geometric realisation of cyclic objects and the circle action)) with B on the normalised complex (Hoyois's theorem).

Also establish k with trivial action ↦ (k, 0, 0); k^{hT} = k[u] = k[[u]] as graded ring (degreewise finite). HH(A/k)^{tT} for A smooth over a ℚ-algebra is 2-periodic de Rham cohomology (§1.10 (Cyclic homology of smooth algebras in characteristic zero)).

*Needs:* §1.2 (Mixed complexes); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §2.1 (Spectra with an action of a group); AInfCohomology §AI.7.2 (Circle actions, homotopy fixed points and Tate constructions); §2.6 (Geometric realisation of cyclic objects and the circle action); EnhancedDerivedSheaves E1 — enhanced derived category; §1.3 (Derived category of mixed complexes).

**THH relative to THH(ℤ) is Hochschild homology.** For every ring A (or HZ-algebra), the T-equivariant map THH(A) → HH(A/ℤ) induces an equivalence THH(A) ⊗_{THH(ℤ)} ℤ ≃ HH(A/ℤ), and π_iTHH(ℤ) is finite for i > 0 (π_{2k−1}THH(ℤ) ≅ ℤ/k for k ≥ 1, π_{even>0} = 0, Bökstedt). Consequently THH(A) → HH(A/ℤ) is an equivalence rationally and THH(A)/p → HH(A/ℤ)/p is controlled by THH(ℤ)/p.

Throughout this statement, A a ring (or connective HZ-algebra).

([BMS-arXiv](#bms-arxiv), Lemma 2.5, p. 15.)

The construction proceeds as follows. Apply §2.8 (THH relative to an E_∞-ring) with k = HZ: THH(A/HZ) = THH(A) ⊗_{THH(ℤ)} ℤ (BMS2 Lemma 2.5). Import π_*THH(ℤ) from Bökstedt's computation as recorded in BMS2 (finite in positive degrees).

Also establish THH(A) ⊗ ℚ ≃ HH(A⊗ℚ/ℚ). π_1THH(ℤ) = 0 and π_3THH(ℤ) = ℤ/2.

*Needs:* §2.8 (THH relative to an E_∞-ring); §1.1 (The cyclic enhancement of supplied derived Hochschild chains).

**The norm sequence for cyclic homology.** For every algebra A over a commutative ring k there is a natural fibre sequence ΣHC(A/k) → HC⁻(A/k) → HP(A/k) in D(k), the circle norm sequence of HH(A/k) ∈ D(k)^{BT}; on homotopy … → HC_{n−1} → HC⁻_n → HP_n → HC_{n−2} → …. The map HC⁻ → HP is the canonical map can : (−)^{hT} → (−)^{tT}.

Throughout this statement, k commutative; derived HH.

([H](#h), §2, p. 4.)

The construction proceeds as follows. Apply AInfCohomology §AI.7.2 (Circle actions, homotopy fixed points and Tate constructions) to X = HH(A/k) and translate by §2.8 (Mixed complexes model complexes with circle action). Check the shift: Σ(X_{hT}) with X_{hT} ≃ CC (direct-sum totalisation) by the convention u^{−1} of degree 2.

Also establish For A = k: π_*ΣHC(k/k) is k in each odd degree ≥ 1, HC⁻_*(k/k) = k[u] and HP_*(k/k) = k[u^{±1}]; for i > 0, HP_{2i} ≅ π_{2i−1}ΣHC = HC_{2i−2}. This is the bottom row's source of the shift dictionary used by §9.4 (The Beilinson fibre sequence and its shift dictionary).

*Needs:* AInfCohomology §AI.7.2 (Circle actions, homotopy fixed points and Tate constructions); §2.8 (Mixed complexes model complexes with circle action); §1.4 (Cyclic, negative cyclic and periodic cyclic homology).

**Circle and finite Tate constructions for HZ-module spectra.** For X ∈ D(ℤ)^{BT} (T-equivariant HZ-modules, equivalently mixed complexes over ℤ by §2.8 (Mixed complexes model complexes with circle action)), the natural maps X^{hT} ⊗_{ℤ^{hT}} ℤ → X, X^{hT} ⊗_{ℤ^{hT}} ℤ^{tT} → X^{tT} and X^{tT} ⊗_{ℤ^{tT}} ℤ^{tC_n} → X^{tC_n} (n ≥ 1), induced by the lax symmetric monoidal structures, are equivalences (NS18 Lemma IV.4.12). With π_*ℤ^{tT} = ℤ[t^{±1}] and π_*ℤ^{tC_n} = ℤ/n[t^{±1}] this computes finite Tate constructions from the circle one.

Throughout this statement, X ∈ Mod_{HZ}^{BT}; NS18 Lemma IV.4.12 imposes no boundedness or finiteness hypothesis.

([NS](#ns), Chapter IV, §IV.4, Lemma IV.4.12, Acta p. 362.)

The construction proceeds as follows. For X∈D(ℤ)^{BT}, compute the fibre of t : X^{hT}→X^{hT}[2] as X, using the free circle-module generator and adjunction; this gives X^{hT}⊗_{ℤ^{hT}}ℤ≃X. Invert t and identify the resulting cofiber with the circle Tate construction; compare the finite cyclic norm to obtain the third equivalence, as in the proof of NS18 Lemma IV.4.12. Do not assert that homotopy fixed points commute with arbitrary colimits. For trivial X=ℤ, recover ℤ[t^{±1}]/n.

Also establish For X = ℤ with trivial action: ℤ^{tC_p} ≃ ℤ^{tT} ⊗_{ℤ^{tT}} ℤ^{tC_p} with π_* = 𝔽_p[t^{±1}].

*Needs:* AInfCohomology §AI.7.2 (Circle actions, homotopy fixed points and Tate constructions); §2.8 (Mixed complexes model complexes with circle action); §2.2 (Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology).

### 2.9 Lax equalizers and the cyclotomic categories

**Lax equalizers of ∞-categories.** For coherent functors F,G:D→E of infinity categories, LEq(F,G)=D×_{E×E}Fun(Δ¹,E), pulling back endpoint evaluation along (F,G). Its objects are (x,α:Fx→Gx), and its mapping space from (x,α) to (y,β) is the homotopy equalizer of Map_D(x,y)⇉Map_E(Fx,Gy), with arrows h↦G(h)α and h↦βF(h). A morphism includes the path between these composites; equality in an ordinary category is only a shadow. For stable categories and exact functors it is stable and its projection is exact. For presentable D,E, accessible F,G, with F preserving colimits, it is presentable and the projection preserves colimits; limits preserved by G lift. Accessibility is part of the hypothesis.

Throughout this statement, D,E coherent infinity categories; presentability requires accessibility as well as all small colimits. For stability require exact F,G. For presentability require presentable D,E, accessible F,G and colimit-preserving F.

([NS](#ns), Chapter II, §II.1, Definition II.1.4 (Acta p. 241) and Proposition II.1.5 (Acta pp. 241-242; proof pp. 242-244).)

The construction proceeds as follows. Form the pullback in Cat_∞ (homotopy cartesian since ev is a categorical fibration). Compute mapping spaces from the pullback; stability and presentability by closure properties (NS18 Proposition II.1.5).

Provide the following operations and identities.

- `Coherent.LaxEqualizer`: Coherent arrow-category pullback D×_{E×E}Fun(Δ¹,E).
- `Coherent.LaxEqualizer.mapping`: Homotopy equalizer of the two mapping-space maps; includes a chosen path and its higher coherences.
- `Coherent.LaxEqualizer.instStable`: Stable when C, D are stable and F, G exact.
- `Coherent.LaxEqualizer.instPresentable`: With presentable D,E, accessible F,G and colimit-preserving F, LEq is presentable; projection preserves colimits.
- `Coherent.LaxEqualizer.conservative`: The projection LEq(F,G) → C is conservative.

**Checks.**

- `LaxEqualizer.identity`: LEq(id_C, id_C) has objects (c, f : c → c).
- `LaxEqualizer.mapping_point`: For C = D = Spaces and F = G = id, maps (∗, id) → (∗, id) form a contractible space.
- `LaxEqualizer.not_equalizer`: LEq(F, G) is not the equalizer {c : F c ≃ G c}: objects carry a map, not an equivalence; genuine cyclotomic spectra (equivalences Φ^{C_p}X ≃ X) form an equalizer instead.
- `Coherent.LaxEqualizer.constant_loop`: The homotopy equalizer of id,id on a Kan K has vertices (x,path from x to x); a strict equality equalizer erases these loop choices.
- `Coherent.LaxEqualizer.stability`: Exact functors between coherent stable inputs give a stable lax equalizer.
- `Coherent.LaxEqualizer.presentability`: The coherent presentability result consumes κ/Ind witnesses and accessibility, not merely a bicomplete ordinary model.

Also establish If F = G = id_C, LEq(id, id) is the ∞-category of endomorphisms (c, f : c → c). CycSp_p = LEq(id, −^{tC_p}) on Sp^{BC_{p^∞}}.

*Needs:* EnhancedDerivedSheaves E0 — limits colimits and slices; EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E5:presentability — presentable categories; EnhancedDerivedSheaves E0; EnhancedDerivedSheaves E5:abstract; `SSet.Quasicategory`.

**Cyclotomic spectra.** A cyclotomic spectrum is a spectrum X with T-action together with T ≅ T/C_p-equivariant maps φ_p : X → X^{tC_p} for every prime p (no compatibility between different primes). The ∞-category is CycSp := LEq(Sp^{BT} ⇉ ∏_p Sp^{BT}) for id and (−^{tC_p})_p, using Sp^{B(T/C_p)} ≃ Sp^{BT}. A p-cyclotomic spectrum is a spectrum with C_{p^∞}-action and a C_{p^∞} ≅ C_{p^∞}/C_p-equivariant φ_p : X → X^{tC_p}; CycSp_p := LEq(Sp^{BC_{p^∞}} ⇉ Sp^{BC_{p^∞}}). Both are presentable stable, and the forgetful functors to Sp are exact, conservative and preserve small colimits. The sphere S with trivial action and φ_p : S → S^{hC_p} → S^{tC_p} is the unit, equivalent to THH(S).

Throughout this statement, Primes p range over all primes; T/C_p identified with T by the p-th power map.

([NS](#ns), Chapter II, §II.1, Definition II.1.1 and Example II.1.2(ii), Acta p. 240; Definition II.1.6 and Corollary II.1.7, pp. 244–245.)

The construction proceeds as follows. Define as a lax equalizer (§2.9 (Lax equalizers of ∞-categories)) using BordismFormalGroups §F6.5 and AInfCohomology §AI.7.2 (the lax symmetric monoidal Tate functor, with its residual C_p form) for −^{tC_p}. Presentability/stability: Sp^{BT} presentable stable, −^{tC_p} exact and accessible (NS18 Corollary II.1.7). The cyclotomic sphere: trivial action plus canonical maps (NS18 Example II.1.2).

Provide the following operations and identities.

- `Coherent.CyclotomicSpectrum`: A T-spectrum X with maps φ_p : X → X^{tC_p}; CycSp = LEq(id, (−^{tC_p})_p).
- `Coherent.CyclotomicSpectrum.pTypical`: p-cyclotomic spectra CycSp_p with C_{p^∞}-action.
- `Coherent.CyclotomicSpectrum.forget`: CycSp → Sp^{BT} → Sp, exact, conservative, colimit-preserving.
- `Coherent.CyclotomicSpectrum.unit`: The cyclotomic sphere S.
- `Coherent.CyclotomicSpectrum.instStable`: CycSp is presentable stable.
- `Coherent.CyclotomicSpectrum.toPTypical`: Restriction CycSp → CycSp_p along C_{p^∞} ⊂ T.

**Checks.**

- `CyclotomicSpectrum.zero`: 0 with zero Frobenii is the zero object.
- `CyclotomicSpectrum.sphere_frobenius`: For the cyclotomic sphere, π_0 φ_p : ℤ → π_0S^{tC_p} = ℤ_p is the completion map.
- `CyclotomicSpectrum.trivial_HFp`: HF_p with trivial T-action and φ_p = 0 is a cyclotomic spectrum but is not THH(𝔽_p) (whose φ_p is nonzero and π_2 ≠ 0): a cyclotomic structure is extra data.

Also establish THH(A) is cyclotomic for every E_1-ring A (§2.7 (The cyclotomic Frobenius of THH)). The cyclotomic sphere has φ_p the p-completion map S → S^{tC_p}. The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

*Needs:* §2.9 (Lax equalizers of ∞-categories); BordismFormalGroups §F6.5 (finite-group Borel norm and Tate cofiber); §2.1 (Spectra with an action of a group); BordismFormalGroups §F6.5 and AInfCohomology §AI.7.2 (the lax symmetric monoidal Tate functor, with its residual C_p form); EnhancedDerivedSheaves E5:abstract.

**THH is symmetric monoidal; THH of E_∞-rings.** CycSp has a symmetric monoidal structure, with underlying T-spectrum the smash product and Frobenius the composite X⊗Y → X^{tC_p}⊗Y^{tC_p} → (X⊗Y)^{tC_p} (lax structure of −^{tC_p}), such that THH : Alg_{E_1}(Sp) → CycSp is symmetric monoidal. Hence for an E_∞-ring A, THH(A) is an E_∞-algebra in CycSp; its underlying E_∞-ring with T-action is A ⊗ T (the tensor of A with the space T in CAlg(Sp), McClure–Schwänzl–Vogt), and φ_p is the unique T-equivariant E_∞-map A⊗T → (A⊗T)^{tC_p} extending the Tate-valued Frobenius A → A^{tC_p} on A.

Throughout this statement, A an E_1- (resp. E_∞-) ring spectrum.

([NS](#ns), Chapter IV, §IV.2, Construction IV.2.1 (Acta pp. 341-342), Proposition IV.2.2 (Acta p. 342), Corollary IV.2.3 (Acta p. 343).)

The construction proceeds as follows. Construct the symmetric monoidal structure on the lax equalizer (NS18 Construction IV.2.1) from the lax monoidal −^{tC_p} (BordismFormalGroups §F6.5 and AInfCohomology §AI.7.2 (the lax symmetric monoidal Tate functor, with its residual C_p form)). THH commutes with ⊗ (realisation of cyclic bar constructions commutes with ⊗ since Δ^op is sifted). McClure–Schwänzl–Vogt: for E_∞ A the cyclic bar construction is the simplicial model of A ⊗ T (NS18 Proposition IV.2.2); Frobenius via the Tate-valued Frobenius (NS18 Corollary IV.2.3, Definition IV.1.1).

Also establish THH(A⊗B) ≃ THH(A)⊗THH(B) as cyclotomic spectra. For a discrete commutative ring R, π_*THH(R) is a graded-commutative ring and the Dennis trace lands in a ring (Layer 4).

*Needs:* §2.7 (The cyclotomic Frobenius of THH); §2.9 (Cyclotomic spectra); BordismFormalGroups §F6.5 and AInfCohomology §AI.7.2 (the lax symmetric monoidal Tate functor, with its residual C_p form); EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category; EnhancedDerivedSheaves E5:abstract — algebra objects.

### 2.10 TC, its fiber formula and arithmetic completion

**Negative topological cyclic and periodic topological cyclic homology.** For X ∈ Sp^{BT}: TC⁻(X) := X^{hT} and TP(X) := X^{tT}, with can : TC⁻(X) → TP(X) the canonical map and, for X cyclotomic and bounded below, φ := ∏_p φ_p^{hT} : TC⁻(X) → ∏_p (X^{tC_p})^{hT} ≃ TP(X)^∧ (profinite completion, AInfCohomology §AI.7.2 (`AInf.Trace.completedTateComparison`)). For an E_1-ring A, TC⁻(A) := THH(A)^{hT}, TP(A) := THH(A)^{tT}; for k-algebras HC⁻(A/k) = HH(A/k)^{hT} and HP(A/k) = HH(A/k)^{tT} (§2.8 (Mixed complexes model complexes with circle action)). Both are lax symmetric monoidal in X.

Throughout this statement, X ∈ Sp^{BT}; for φ, X cyclotomic and bounded below.

([NS](#ns), Chapter II, §II.1, Proposition II.1.9, Acta pp. 245–246; Corollary 1.5 and Remark 1.6, p. 209; Lemma II.4.2 and Remark II.4.3, p. 262.)

The construction proceeds as follows. Define by §2.1 (Homotopy orbits and homotopy fixed points) and AInfCohomology §AI.7.2 (Circle actions, homotopy fixed points and Tate constructions). Identify the target of φ_p^{hT} with TP^∧_p via AInfCohomology §AI.7.2 (`AInf.Trace.completedTateComparison`) (ii). Linearisation THH(A) → HH(A/ℤ) induces TC⁻(A) → HC⁻(A/ℤ), TP(A) → HP(A/ℤ).

Provide the following operations and identities.

- `TCminus`: TC⁻(X) = X^{hT}.
- `TP`: TP(X) = X^{tT}.
- `TCminus.can`: can : TC⁻ → TP.
- `TCminus.frobenius`: φ : TC⁻(X) → TP(X)^∧ for bounded below cyclotomic X.
- `TCminus.laxMonoidal`: TC⁻ and TP are lax symmetric monoidal; TC⁻(A), TP(A) are E_∞-rings for E_∞ A.
- `TCminus.toHC`: THH(A) → HH(A/ℤ) induces TC⁻(A) → HC⁻(A/ℤ) and TP(A) → HP(A/ℤ). Rational equivalence of underlying THH and HH does not justify rational equivalence after these infinite limits; only the natural comparison maps are asserted.

**Checks.**

- `TCminus.zero`: TC⁻(0) = TP(0) = 0.
- `TP.HZ_trivial`: For HZ with trivial T-action, π_*TP = ℤ[t^{±1}].
- `TP.not_HP`: TP(𝔽_p) ≠ HP(𝔽_p/𝔽_p): π_0TP(𝔽_p) = ℤ_p while HP_0(𝔽_p/𝔽_p) = 𝔽_p.

Also establish TC⁻(𝔽_p) and TP(𝔽_p): π_*TP(𝔽_p) = ℤ_p[σ^{±1}]. TC⁻(S) = S^{hT}, TP(S) = S^{tT}.

*Needs:* AInfCohomology §AI.7.2 (Circle actions, homotopy fixed points and Tate constructions); AInfCohomology §AI.7.2 (`AInf.Trace.completedTateComparison`); §2.9 (Cyclotomic spectra); §2.7 (Topological Hochschild homology of an E_1-ring).

**Topological cyclic homology.** For a cyclotomic spectrum X, TC(X) := map_{CycSp}(S, X) (mapping spectrum from the cyclotomic sphere); for a p-cyclotomic X, TC(X, p) := map_{CycSp_p}(S, X); for an E_1-ring A, TC(A) := TC(THH(A)) and TC(A, p) := TC(THH(A), p). TC is exact, lax symmetric monoidal, and TC(A) is an E_∞-ring for E_∞ A.

Throughout this statement, X ∈ CycSp (resp. CycSp_p).

([NS](#ns), Chapter II, §II.1, Definition II.1.8, Acta p. 245.)

The construction proceeds as follows. Mapping spectra exist since CycSp is stable (§2.9 (Cyclotomic spectra)). Compute by the equalizer formula of §2.9 (Lax equalizers of ∞-categories), giving §2.10 (The Nikolaus–Scholze formula for TC).

Provide the following operations and identities.

- `TC`: TC(X) = map_{CycSp}(S, X); TC(A) = TC(THH(A)).
- `TC.pTypical`: TC(X, p) = map_{CycSp_p}(S, X).
- `TC.exact`: TC : CycSp → Sp is exact . Integral TC is not asserted to preserve filtered colimits; CMM Theorem 2.7 gives colimit preservation for TC/p on connective cyclotomic spectra.
- `TC.laxMonoidal`: TC is lax symmetric monoidal.
- `TC.toTCminus`: TC(X) → TC⁻(X) = X^{hT}.

**Checks.**

- `TC.zero`: TC(0) = 0.
- `TC.Fp`: π_*TC(𝔽_p)^∧_p = ℤ_p in degrees 0 and −1.
- `TC.not_TCminus`: TC(𝔽_p) ≠ TC⁻(𝔽_p): π_{−2}TC⁻(𝔽_p) ≠ 0 while π_{−2}TC(𝔽_p) = 0.

Also establish TC(S) ≃ S ⊕ ΣCP^∞_{−1}-type answer after p-completion (Bökstedt–Hsiang–Madsen), not computed here. TC(𝔽_p)^∧_p ≃ HZ_p ⊕ Σ^{−1}HZ_p.

*Needs:* §2.9 (Cyclotomic spectra); §2.9 (Lax equalizers of ∞-categories); §2.7 (Topological Hochschild homology of an E_1-ring); §2.7 (The cyclotomic Frobenius of THH).

**The Nikolaus–Scholze formula for TC.** (i) For a cyclotomic spectrum X there is a functorial fibre sequence TC(X) → X^{hT} → ∏_p (X^{tC_p})^{hT}, the second map having p-th component φ_p^{hT} − can, where can : X^{hT} ≃ (X^{hC_p})^{h(T/C_p)} → (X^{tC_p})^{h(T/C_p)}. (ii) For a p-cyclotomic X: TC(X, p) → X^{hC_{p^∞}} → (X^{tC_p})^{hC_{p^∞}}. (iii) For X bounded below, ∏_p(X^{tC_p})^{hT} ≃ TP(X)^∧ and TC(X) ≃ fib(φ − can : TC⁻(X) → TP(X)^∧); for a connective E_1-ring A, TC(A) is the genuine (Bökstedt–Hsiang–Madsen–Goodwillie) TC (via §2.17 (Genuine and Nikolaus–Scholze TC agree on bounded below spectra)).

Throughout this statement, X cyclotomic; (iii) X bounded below.

([NS](#ns), Chapter II, §II.1, Proposition II.1.9, Acta pp. 245–246; Corollary 1.5 and Remark 1.6, p. 209; Lemma II.4.2 and Remark II.4.3, p. 262.)

The construction proceeds as follows. Mapping spectra in a lax equalizer are equalizers (§2.9 (Lax equalizers of ∞-categories)): map(S, X) = Eq(map_{Sp^{BT}}(S, X) ⇉ ∏_p map(S, X^{tC_p})) = fib(X^{hT} → ∏_p (X^{tC_p})^{hT}). Identify the two maps with can and φ_p^{hT} (NS18 Proposition II.1.9). For bounded below X apply AInfCohomology §AI.7.2 (`AInf.Trace.completedTateComparison`) (NS18 Corollary 1.5).

Also establish For X = THH(𝔽_p): TC(𝔽_p) = fib(φ − can : TC⁻(𝔽_p) → TP(𝔽_p)) with π_* = ℤ_p in degrees 0, −1 (p-complete). Fails for unbounded X: for X = KU-type periodic inputs the profinite-completion identification (iii) is not available.

*Needs:* §2.10 (Topological cyclic homology); §2.10 (Negative topological cyclic and periodic topological cyclic homology); AInfCohomology §AI.7.2 (`AInf.Trace.completedTateComparison`); §2.9 (Lax equalizers of ∞-categories).

**p-completion of TC.** For a bounded below cyclotomic spectrum X: TC(X)^∧_p ≃ TC(X|_{CycSp_p}, p)^∧_p, and TC(X) is the pullback of X^{hT} → ∏_p (X^∧_p)^{hT} ← ∏_p TC(X,p)^∧_p (in particular TC(X) ⊗ ℚ is the pullback of TC⁻(X)⊗ℚ and (∏_p TC(X,p)^∧_p)⊗ℚ over (∏_p TC⁻(X)^∧_p)⊗ℚ).

Throughout this statement, X bounded below.

([NS](#ns), Chapter II, §II.4, Definition II.4.4 (Acta p. 263; R and F recalled on p. 262) and the pullback square (1) with footnote 22 (Acta p. 266).)

The construction proceeds as follows. Compare the fibre sequences of §2.10 (The Nikolaus–Scholze formula for TC) (i) and (ii) after p-completion: (X^{tC_p})^{hT} ≃ (X^{tC_p})^{hC_{p^∞}}-type identifications for bounded below X (NS18 §II.4, after diagram (1), and §IV.3). Arithmetic fracture square (StableHomotopyKTheory §7.23).

Also establish For X = THH(A) with A connective, TC(A)^∧_p = TC(A, p)^∧_p.

*Needs:* §2.10 (The Nikolaus–Scholze formula for TC); AInfCohomology §AI.7.2 (`AInf.Trace.completedTateComparison`); StableHomotopyKTheory §§7.14–7.18; StableHomotopyKTheory §7.23.

**TC is right adjoint to the trivial cyclotomic structure; Frobenius on connective covers.** (i) The functor Sp → CycSp sending a spectrum Y to Y^{triv} (trivial T-action, Frobenius Y → Y^{hC_p} → Y^{tC_p}) is left adjoint to TC : CycSp → Sp (NS18 Proposition IV.4.14). (ii) For a connective cyclotomic X, sh_pX has underlying T-spectrum τ_{≥0}(X^{tC_p}) with residual action, φ_ℓ = 0 for ℓ ≠ p and φ_p = τ_{≥0}(φ_p^{tC_p}), with a natural map X → sh_pX (Construction IV.4.15); HZ_p^{triv} → THH(𝔽_p) induces THH(𝔽_p) ≃ sh_p(HZ_p^{triv}) as E_∞-cyclotomic spectra (Corollary IV.4.16). (iii) For an E_2-ring A with p = 0 in π_0A, THH(A) is a THH(𝔽_p)-module compatibly with the cyclotomic structure and TC(A) → THH(A)^{hT} → THH(A)^{tT} (can − φ_p^{hT}) is a fibre sequence even if A is not bounded below (final paragraph of NS18 §IV.4).

Throughout this statement, (i) all spectra; (ii) bounded below / connective p-cyclotomic spectra as in NS18 §IV.4.

([NS](#ns), Chapter IV, §IV.4, Proposition IV.4.14 and Construction IV.4.15 (Acta p. 363), Corollary IV.4.16 (Acta p. 364), and the final unnumbered paragraph of §IV.4 (Acta pp. 364-365).)

The construction proceeds as follows. (i) Map_{CycSp}(triv Y, X) = Eq(Map(Y, X^{hT}) ⇉ ∏ Map(Y, (X^{tC_p})^{hT})) = Map(Y, TC(X)) by §2.10 (The Nikolaus–Scholze formula for TC). (ii) connective-cover and characteristic-p statements: NS18 §IV.4, using AInfCohomology §AI.7.2 (`AInf.Trace.tateOrbit`) and §2.8 (Circle and finite Tate constructions for HZ-module spectra).

Also establish TC(triv Y) for Y = S is TC(S); the counit triv TC(X) → X is the universal map.

*Needs:* §2.10 (The Nikolaus–Scholze formula for TC); §2.9 (Cyclotomic spectra); AInfCohomology §AI.7.2 (`AInf.Trace.tateOrbit`); §2.8 (Circle and finite Tate constructions for HZ-module spectra).

### 2.11 Spherical group rings and categorical THH

**THH and TC of spherical group rings and loop spaces.** For an E_1-monoid M in spaces, THH(S[M]) = Σ^∞_+B^{cyc}M with its T-action, and the cyclotomic Frobenius φ_p is Σ^∞_+ψ_p followed by Σ^∞_+((B^{cyc}M)^{hC_p}) → (Σ^∞_+B^{cyc}M)^{hC_p} → (Σ^∞_+B^{cyc}M)^{tC_p}, where ψ_p : B^{cyc}M → (B^{cyc}M)^{hC_p} comes from the diagonal (NS18 Lemma IV.3.1). For M = ΩY with Y connected, B^{cyc}M ≃ LY = Map(S¹, Y) T-equivariantly and ψ_p is induced by the p-fold cover S¹ → S¹, so THH(S[ΩY]) ≃ Σ^∞_+LY (Proposition IV.3.2, Corollary IV.3.3). For a bounded-below p-complete p-cyclotomic X with a Frobenius lift φ̃_p : X → X^{hC_p}, TC(X) is the pullback of tr : ΣX_{hT} → X and id − φ̃_p (Proposition IV.3.4); hence after p-completion TC(S[ΩY]) is the Bökstedt–Hsiang–Madsen pullback of Σ(Σ^∞_+LY)_{hT} → Σ^∞_+LY and id − Σ^∞_+ψ_p (Theorem IV.3.6).

Throughout this statement, X a connected pointed space (Kan complex); p-completion for the TC statement.

([NS](#ns), Chapter IV, §IV.3, Lemma IV.3.1 (Acta pp. 345-346), Proposition IV.3.2 (Acta p. 347), Corollary IV.3.3 (p. 351), Proposition IV.3.4 (Acta p. 352), Theorem IV.3.6 (Acta p. 354).)

The construction proceeds as follows. Cyclic bar constructions of E_1-groups in spaces realise to free loop spaces (NS18 Lemma IV.3.1, Proposition IV.3.2). Frobenius from the unstable p-th power map and the Segal conjecture (NS18 Proposition IV.3.4). TC via the fibre sequence (§2.10 (The Nikolaus–Scholze formula for TC)) and the norm sequence for Σ^∞_+LX (NS18 Theorem IV.3.6).

Also establish X = ∗: THH(S) = S. X = BG for a discrete group G: THH(S[G]) ≃ Σ^∞_+ L BG = ⊕_{conj classes [g]} Σ^∞_+ BC_G(g).

*Needs:* §2.7 (Topological Hochschild homology of an E_1-ring); §2.7 (The cyclotomic Frobenius of THH); §2.10 (The Nikolaus–Scholze formula for TC); GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5 — suspension spectrum.

**THH of spectral and stable ∞-categories.** For a small spectral category (or small stable ∞-category) C, THH(C) ∈ Sp^{BT} is the realisation of the cyclic nerve [n] ↦ ⊕_{c_0,…,c_n} C(c_0,c_1)⊗C(c_1,c_2)⊗…⊗C(c_n,c_0) with its T-action, and it carries a cyclotomic structure. THH is Morita invariant: a functor inducing an equivalence of idempotent-completed module categories (Morita equivalence; in particular DK-equivalences and C → Idem(C)) induces an equivalence on THH; THH(Perf(A)) ≃ THH(A) for an E_1-ring A; THH sends exact sequences of small stable ∞-categories to fibre sequences (THH is a localizing invariant).

Throughout this statement, C small (a set of objects for the cyclic nerve); for stable ∞-categories, THH is defined via a spectral category model or directly (Blumberg–Gepner–Tabuada). Use derived smash products, or a pointwise cofibrant replacement, in the cyclic nerve. The point-set cyclic nerve without replacement is not asserted invariant for arbitrary spectral categories.

([BlM](#blm), §3, Definition 3.1, pp. 9-10; [BlM](#blm), Proposition 3.5, p. 11; Theorem 4.9, p. 19; Theorems 5.9, 5.11–5.12, pp. 23–24; Theorem 7.1, pp. 29–30.)

The construction proceeds as follows. Define the cyclic nerve as a cyclic spectrum and realise (§2.6 (Geometric realisation of cyclic objects and the circle action)) (Blumberg–Mandell §3). Morita invariance: reduce to DK-equivalences and to the inclusion of a full subcategory generating under retracts and finite colimits (Blumberg–Mandell's 'dennis-trace / agreement' argument). THH(Perf(A)) ≃ THH(A): A is a one-object full subcategory generating Perf(A). Localisation sequences (Blumberg–Mandell's localisation theorem) and cyclotomic structure (genuine model: Blumberg–Mandell; Borel model: by the Tate diagonal as for E_1-rings).

Provide the following operations and identities.

- `THH.ofCat`: THH(C) ∈ CycSp for a small stable ∞-category C.
- `THH.ofCat_perf`: THH(Perf(A)) ≃ THH(A) as cyclotomic spectra.
- `THH.ofCat_morita`: Morita equivalences induce equivalences on THH.
- `THH.ofCat_localizing`: THH sends Verdier sequences A → B → B/A of small stable ∞-categories to fibre sequences.
- `THH.ofCat_map`: Exact functors induce cyclotomic maps, with map_id and map_comp.

**Checks.**

- `THH.ofCat_zero`: THH of the zero category is 0.
- `THH.ofCat_matrix`: For n≥1, THH(Perf(M_n(R))) ≃ THH(R) via the Morita equivalence.
- `THH.ofCat_not_K`: THH is not K-theory: THH(Perf(𝔽_p)) has π_2 = 𝔽_p while K_2(𝔽_p) = 0.

Also establish THH(Perf(R)) ≃ THH(R) for a discrete ring R; for n≥1, THH(M_n(R)) ≃ THH(R). For a ℤ-linear category, THH is formed from the Eilenberg–Mac Lane spectra of its Hom-groups.

*Needs:* §2.7 (Topological Hochschild homology of an E_1-ring); §2.6 (Geometric realisation of cyclic objects and the circle action); EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E5:presentability — compact objects.

### 2.12 Orthogonal and genuine equivariant spectra

**Orthogonal spectra.** An orthogonal spectrum X is a sequence of pointed spaces X_n with continuous based O(n)-actions and structure maps σ_n : X_n ∧ S¹ → X_{n+1} whose iterates X_n ∧ S^m → X_{n+m} are O(n) × O(m)-equivariant; π_iX := colim_n π_{i+n}X_n; a map is a stable equivalence if it induces isomorphisms on all π_i. Orthogonal spectra form a closed symmetric monoidal category (smash product), and inverting stable equivalences gives the ∞-category Sp, compatibly with symmetric spectra (GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5) via the forgetful functor (Mandell–May–Schwede–Shipley).

Throughout this statement, Spaces are compactly generated weak Hausdorff; O(n) acts continuously.

([NS](#ns), Chapter II, §II.2, Definition II.2.1 (citing Schwede [85, Definition 1.1, §1]), Acta pp. 246-247.)

The construction proceeds as follows. Define as diagram spectra over the topological category of real inner product spaces (Mandell–May–Schwede–Shipley). Stable model structure and comparison with symmetric spectra: the forgetful functor from orthogonal to symmetric spectra (of spaces) is a right Quillen equivalence; compose with the symmetric-spectra model of GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5 and EnhancedDerivedSheaves E5:spectra-comparison.

Provide the following operations and identities.

- `OrthogonalSpectrum`: Sequences (X_n, O(n)-action, σ_n) with equivariant iterated structure maps.
- `OrthogonalSpectrum.homotopyGroup`: π_iX = colim_n π_{i+n}X_n.
- `OrthogonalSpectrum.smash`: Closed symmetric monoidal smash product with unit S.
- `OrthogonalSpectrum.toSymmetric`: The forgetful functor to symmetric spectra is a right Quillen equivalence; both present Sp.
- `OrthogonalSpectrum.StableEquiv`: Stable equivalences are the π_*-isomorphisms.

**Checks.**

- `OrthogonalSpectrum.sphere_pi0`: π_0 of the orthogonal sphere spectrum is ℤ.
- `OrthogonalSpectrum.zero`: The constant point spectrum is a zero object.
- `OrthogonalSpectrum.not_sequential`: On S¹∧S¹, the symmetric braiding acts by −1 on π₂(S²), so it differs from the identity. This checks the orthogonal symmetric smash structure and its suspension sign.

Also establish The orthogonal sphere spectrum has X_n = S^n with the standard O(n)-action; π_0 = ℤ. π_i of an orthogonal spectrum agrees with π_i of its underlying symmetric spectrum (naive homotopy groups).

*Needs:* GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5 — omega spectra and eilenberg maclane; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5 — naive homotopy groups; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5 — stable model structure; EnhancedDerivedSheaves E5:spectra-comparison.

**Genuine G-spectra, genuine and geometric fixed points.** For a finite group G, orthogonal G-spectra are Fun(BG, Sp^O) with smash product and diagonal action, extended to representations by X(V) = L(ℝ^n, V)_+ ∧_{O(n)} X_n for dim V = n. A map is an equivalence if Φ^H f is a stable equivalence for every subgroup H ⊆ G, where the geometric fixed points Φ^GX have n-th space X(ℝ^n ⊗ ρ_G)^G (ρ_G the regular representation). The ∞-category GSp of genuine G-spectra is N(GSp^O)[equivalences^{−1}], symmetric monoidal via the cofibrant smash; Φ^H : GSp → Sp is symmetric monoidal; the genuine fixed points −^H : GSp → Sp come from set-theoretic fixed points of orthogonal G-Ω-spectra, with a lax symmetric monoidal transformation −^H → −^{hH} through the forgetful functor GSp → Sp^{BG}.

Throughout this statement, G a finite group; spaces compactly generated.

([NS](#ns), Chapter II, §II.2, Definition II.2.2 (Acta p. 247), Definition II.2.3 and Proposition II.2.4 (Acta p. 248); [NS](#ns), Chapter II, §II.2, Definition II.2.5, Acta pp. 248-249.)

The construction proceeds as follows. Define orthogonal G-spectra and Φ^G (NS18 Definitions II.2.2–II.2.3); Φ^G is lax monoidal and strong on cofibrant objects (NS18 Proposition II.2.4). Localise at the Φ^H-equivalences to get GSp (NS18 Definition II.2.5); construct −^H via fibrant replacement (G-Ω-spectra). Construct the comparison −^H → −^{hH} from GSp → Sp^{BG}.

Provide the following operations and identities.

- `GenuineSpectrum`: GSp for a finite group G.
- `GenuineSpectrum.fixedPoints`: −^H : GSp → Sp, lax symmetric monoidal.
- `GenuineSpectrum.geometricFixedPoints`: Φ^H : GSp → Sp, symmetric monoidal.
- `GenuineSpectrum.toBorel`: The forgetful functor GSp → Sp^{BG} and the transformation −^H → −^{hH}.
- `GenuineSpectrum.equiv_iff`: A map is an equivalence iff all Φ^H are equivalences (H ⊆ G).
- `GenuineSpectrum.burnside`: π_0((S_G)^G) ≅ A(G), the Burnside ring.

**Checks.**

- `GenuineSpectrum.trivialGroup`: For G = 1, GSp ≃ Sp.
- `GenuineSpectrum.burnside_C2`: π_0(S_{C_2})^{C_2} ≅ ℤ², the Burnside ring of C_2.
- `GenuineSpectrum.not_borel`: GSp → Sp^{BG} is not an equivalence: the C_2-sphere and its Borel completion have different genuine fixed points (A(C_2) versus ℤ ⊕ ℤ_2^∧).

Also establish For G trivial, GSp = Sp and −^G = Φ^G = id. π_0 of the genuine fixed points of the G-sphere is the Burnside ring A(G) (tom Dieck), not ℤ.

*Needs:* §2.12 (Orthogonal spectra); §2.1 (Spectra with an action of a group); §2.1 (Homotopy orbits and homotopy fixed points); EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category.

**Geometric fixed points via complete universes.** For a finite group G with complete universe U (a countable sum of all irreducible representations) and H ⊆ G normal, Φ^H_U : GSp^O → (G/H)Sp^O has n-th space hocolim_{V ⊂ U, V^H = 0} X(ℝ^n ⊕ V)^H (Bousfield–Kan homotopy colimit), for H=G naturally zig-zag equivalent to the derived Φ^G functor on G-spectra; for normal H ⊆ H′ ⊆ G, Φ^{H′/H}_{U^H} Φ^H_U X ≃ Φ^{H′}_U X (geometric fixed points compose).

Throughout this statement, G finite; H ⊆ H′ normal subgroups; U a complete G-universe.

([NS](#ns), Chapter II, §II.2, Definition II.2.9 (Acta p. 251), Definition II.2.10 and Lemma II.2.11 (Acta p. 252), Proposition II.2.12 (Acta p. 253).)

The construction proceeds as follows. Define via the homotopy colimit over representations with V^H = 0 (NS18 Definitions II.2.9–II.2.10). Zig-zag with Φ^G. Composition (NS18 Proposition II.2.12).

Provide the following operations and identities.

- `geometricFixedPoints.universe`: Φ^H_U : GSp^O → (G/H)Sp^O.
- `geometricFixedPoints.zigzag`: Φ^G X ≃ Φ^G_U X naturally.
- `geometricFixedPoints.comp`: Φ^{H′/H}Φ^H ≃ Φ^{H′} for normal H ⊆ H′.
- `geometricFixedPoints.suspension`: Φ^G Σ^∞_G Y ≃ Σ^∞ Y^G.

**Checks.**

- `geometricFixedPoints.trivial`: Φ^{1} = id.
- `geometricFixedPoints.sphere`: Φ^{C_p} S_{C_p} = S (fixed points of spheres of representations with V^{C_p} = 0 are S^0).
- `geometricFixedPoints.not_fixed`: Φ^{C_p} ≠ −^{C_p}: for the C_p-sphere, π_0Φ^{C_p} = ℤ but π_0(S)^{C_p} = A(C_p) = ℤ².

Also establish Φ^G of a suspension spectrum Σ^∞_G Y is Σ^∞ Y^G. For H′ = H the composition statement is the identity.

*Needs:* §2.12 (Genuine G-spectra, genuine and geometric fixed points).

### 2.13 Borel completion, isotropy and geometric localization

**Borel-complete genuine spectra.** For a finite group G, the forgetful functor GSp → Sp^{BG} has a fully faithful right adjoint B_G whose essential image consists of the X with X^H → X^{hH} an equivalence for every H ⊆ G (Borel-complete genuine spectra); B_G is lax symmetric monoidal and the adjunction unit id_{GSp} → B_G ∘ forget is a lax symmetric monoidal transformation.

Throughout this statement, G finite.

([NS](#ns), Chapter II, §II.2, Theorem II.2.7 and Corollary II.2.8, Acta pp. 250–251.)

The construction proceeds as follows. Construct B_G by the adjoint functor theorem and compute (B_G Y)^H ≃ Y^{hH} using free G-cell objects (NS18 Theorem II.2.7, Corollary II.2.8).

Also establish (B_G Y)^G ≃ Y^{hG}. For Y = S with trivial action, B_G S has genuine fixed points S^{hG}.

*Needs:* §2.12 (Genuine G-spectra, genuine and geometric fixed points); §2.1 (Homotopy orbits and homotopy fixed points); EnhancedDerivedSheaves E3 — adjoint functor theorem and localisations.

**Geometric fixed points as a localisation.** For H ⊆ G normal, Φ^H : GSp → (G/H)Sp has a fully faithful right adjoint R_H whose essential image is GSp_{≥H}, the X with Φ^N X ≃ 0 (equivalently X^N ≃ 0) for every N not containing H; on GSp_{≥H} the map −^H → Φ^H is an equivalence. For the right adjoint R_{C_p} on genuine C_{p^∞}- or F-genuine T-spectra, (R_{C_p}X)^H ≃ X^{H/C_p} if C_p ⊆ H and 0 otherwise.

Throughout this statement, G finite (or C_{p^∞}, T with finite H as in §2.14 (Genuine C_{p^∞}-spectra and F-genuine T-spectra)).

([NS](#ns), Chapter II, §II.2, Proposition II.2.14 and Corollary II.2.16, Acta pp. 255–257.)

The construction proceeds as follows. Smashing localisation at ẼF[H] (NS18 Proposition II.2.14). Fixed points of R_{C_p} (NS18 Corollary II.2.16).

Also establish For G = C_p, H = C_p: GSp_{≥C_p} ≃ Sp via Φ^{C_p}.

*Needs:* §2.12 (Geometric fixed points via complete universes); §2.12 (Genuine G-spectra, genuine and geometric fixed points).

**Isotropy separation for cyclic p-groups.** For G cyclic of p-power order and X ∈ GSp there is a natural fibre sequence X_{hG} → X^G → (Φ^{C_p}X)^{G/C_p}; applied to X → B_G X it maps to the norm sequence X_{hG} → X^{hG} → X^{tG}, the right-hand square is lax symmetric monoidal, and this gives a lax symmetric monoidal structure on −^{tG} with −^{hG} → −^{tG} lax symmetric monoidal (agreeing with BordismFormalGroups §F6.5 and AInfCohomology §AI.7.2 (the lax symmetric monoidal Tate functor, with its residual C_p form)).

Throughout this statement, G = C_{p^n}, with p prime and n≥1.

([NS](#ns), Chapter II, §II.2, Proposition II.2.13 (attributed to Hesselholt–Madsen [47, Prop. 2.1]), Acta p. 254, with the following discussion pp. 254-255.)

The construction proceeds as follows. Isotropy separation cofibre sequence EG_+ ∧ X → X → ẼG ∧ X and identification of the fixed points of the terms (NS18 Proposition II.2.13).

Also establish For n = 1: X_{hC_p} → X^{C_p} → Φ^{C_p}X, the fundamental sequence used for TR.

*Needs:* §2.12 (Geometric fixed points via complete universes); §2.13 (Borel-complete genuine spectra); BordismFormalGroups §F6.5 (finite-group Borel norm and Tate cofiber).

### 2.14 Finite-family circle spectra, genuine cyclotomic objects and TR

**Genuine C_{p^∞}-spectra and F-genuine T-spectra.** C_{p^∞}Sp := lim_n C_{p^n}Sp along the forgetful (restriction) functors; TSp^O is orthogonal spectra with continuous T-action, an F-equivalence is a map inducing equivalences of orthogonal C_n-spectra for every finite C_n ⊂ T, and TSp_F is the localisation at F-equivalences. Genuine fixed points −^H and geometric fixed points Φ^H exist for finite H and satisfy §2.13 (Borel-complete genuine spectra) and §2.13 (Geometric fixed points as a localisation).

Throughout this statement, Only finite subgroups of T are used (F-genuine, not fully genuine).

([NS](#ns), Chapter II, §II.2, Definition II.2.15, Acta p. 256.)

The construction proceeds as follows. Form the limit of ∞-categories and the localisation (NS18 Definition II.2.15). Transfer −^H, Φ^H and the two theorems levelwise.

Provide the following operations and identities.

- `GenuineCircleSpectrum`: TSp_F, the F-genuine T-spectra.
- `GenuinePInftySpectrum`: C_{p^∞}Sp = lim_n C_{p^n}Sp.
- `GenuineCircleSpectrum.fixedPoints`: −^{C_n} : TSp_F → Sp^{B(T/C_n)} for finite C_n ⊂ T.
- `GenuineCircleSpectrum.geometricFixedPoints`: Φ^{C_n} : TSp_F → TSp_F via T/C_n ≅ T.
- `GenuineCircleSpectrum.toBorel`: Forget to Sp^{BT}.

**Checks.**

- `GenuineCircleSpectrum.zero`: The zero object has all fixed points 0.
- `GenuineCircleSpectrum.fixed_trivial`: −^{C_1} is the underlying spectrum.
- `GenuineCircleSpectrum.not_fully_genuine`: Let E_F be the universal T-space for the family of finite subgroups. In fully genuine T-spectra the cofibre of Σ∞E_F₊→S has geometric H-fixed points zero for every finite H, but geometric T-fixed points S. Its image in TSp_F is zero while it is nonzero fully genuinely.

Also establish Restriction TSp_F → C_{p^∞}Sp → C_{p^n}Sp is compatible with −^{C_{p^k}}, k ≤ n.

*Needs:* §2.12 (Genuine G-spectra, genuine and geometric fixed points); §2.13 (Borel-complete genuine spectra); §2.13 (Geometric fixed points as a localisation); EnhancedDerivedSheaves E0 — limits colimits and slices.

**Genuine cyclotomic spectra.** A genuine p-cyclotomic spectrum is X ∈ C_{p^∞}Sp with an equivalence Φ_p : Φ^{C_p}X ≃ X (via C_{p^∞}/C_p ≅ C_{p^∞}); CycSp_p^{gen} := Eq(C_{p^∞}Sp ⇉ C_{p^∞}Sp) of id and Φ^{C_p}. A genuine cyclotomic spectrum is X ∈ TSp_F with coherently commuting equivalences Φ_n : X ≃ Φ^{C_n}X, n ≥ 1: CycSp^{gen} := (TSp_F)^{hℕ_{>0}}. Composing Φ_p^{−1} with Φ^{C_p}X → Φ^{C_p}B(X) ≃ X^{tC_p} gives forgetful functors CycSp_p^{gen} → CycSp_p and CycSp^{gen} → CycSp (the latter constructed through coalgebras, NS18 §II.5–II.6).

Throughout this statement, Finite subgroups only (F-genuine).

([NS](#ns), Chapter II, §II.3, Definitions II.3.1 and II.3.3 and Propositions II.3.2 and II.3.4, Acta pp. 257–259.)

The construction proceeds as follows. Define as equalizers/homotopy fixed points of ∞-categories (NS18 Definitions II.3.1, II.3.3). Construct the forgetful functors via the Borel completion map Φ^{C_p}X → Φ^{C_p}B_{C_p}X = X^{tC_p} (§2.13 (Borel-complete genuine spectra); NS18 Proposition II.3.2 and §II.6).

Provide the following operations and identities.

- `GenuineCyclotomicSpectrum`: X ∈ TSp_F with coherent equivalences Φ_n : X ≃ Φ^{C_n}X.
- `GenuineCyclotomicSpectrum.pTypical`: CycSp_p^{gen} = Eq(id, Φ^{C_p}).
- `GenuineCyclotomicSpectrum.forget`: CycSp^{gen} → CycSp, CycSp_p^{gen} → CycSp_p.
- `GenuineCyclotomicSpectrum.restriction`: The restriction maps R : X^{C_{p^n}} → (Φ^{C_p}X)^{C_{p^{n−1}}} ≃ X^{C_{p^{n−1}}}.
- `GenuineCyclotomicSpectrum.instStable`: CycSp^{gen} is stable.

**Checks.**

- `GenuineCyclotomicSpectrum.sphere`: The genuine cyclotomic sphere has R : S^{C_p} → S equal to the projection A(C_p) → ℤ on π_0 onto the geometric part.
- `GenuineCyclotomicSpectrum.zero`: 0 is genuine cyclotomic.
- `GenuineCyclotomicSpectrum.borel_not_genuine`: The Borel completion B(Hℤ) of the trivial C_{p^∞}-spectrum is not genuine p-cyclotomic: its underlying spectrum is Hℤ, whereas its C_p geometric fixed points are (Hℤ)^{tC_p}, with nonzero negative even homotopy groups. The required geometric-fixed-point equivalence cannot be supplied.

Also establish THH(A) in the Bökstedt model is a genuine cyclotomic spectrum (§2.16 (The Bökstedt construction and classical THH)). The genuine cyclotomic sphere has Φ^{C_n}S = S. The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

*Needs:* §2.14 (Genuine C_{p^∞}-spectra and F-genuine T-spectra); §2.12 (Geometric fixed points via complete universes); §2.13 (Borel-complete genuine spectra); §2.9 (Cyclotomic spectra); EnhancedDerivedSheaves E5:abstract; §2.2 (Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology).

**Orthogonal cyclotomic spectra model genuine ones.** An orthogonal cyclotomic spectrum is X ∈ TSp^O with F-equivalences Φ_n : Φ^{C_n}_U X → X for all n ≥ 1 satisfying Φ_{mn} ∘ (Φ^{C_m}_U Φ^{C_n}_U X ≃ Φ^{C_{mn}}_U X) = Φ_n ∘ Φ^{C_n}_U(Φ_m); the functor N(CycSp^O) → CycSp^{gen} is the universal functor inverting the F-equivalences of orthogonal cyclotomic spectra (Barwick–Glasman).

Throughout this statement, Point-set model with a complete T-universe U.

([NS](#ns), Chapter II, §II.3, Definition II.3.6 (Acta p. 259) and Theorem II.3.7 (Acta p. 260).)

The construction proceeds as follows. Define CycSp^O (NS18 Definition II.3.6). Import the Barwick–Glasman comparison as stated in NS18 Theorem II.3.7 (cited theorem; its proof is outside NS18).

Also establish Bökstedt's THH of an orthogonal ring spectrum is an orthogonal cyclotomic spectrum (§2.16 (The Bökstedt construction and classical THH)).

*Needs:* §2.14 (Genuine cyclotomic spectra); §2.12 (Geometric fixed points via complete universes); §2.12 (Orthogonal spectra).

**TR and genuine TC.** For a genuine p-cyclotomic spectrum X with restriction R : X^{C_{p^n}} → (Φ^{C_p}X)^{C_{p^{n−1}}} ≃ X^{C_{p^{n−1}}} and inclusion of fixed points F : X^{C_{p^n}} → X^{C_{p^{n−1}}}: TR^{n+1}(X; p) := X^{C_{p^n}}, TR(X, p) := lim_R X^{C_{p^n}}, and TC^{gen}(X, p) := Eq(TR(X, p) ⇉ TR(X, p)) for (id, F) ≃ lim_n Eq(X^{C_{p^n}} ⇉ X^{C_{p^{n−1}}}) for (R, F). For a genuine cyclotomic X, TC^{gen}(X) is the pullback X^{hT} ×_{∏_p (X^∧_p)^{hT}} ∏_p TC^{gen}(X, p)^∧_p (NS18 diagram (1), Goodwillie's corrected definition). The Verschiebung V : X^{C_{p^{n−1}}} → X^{C_{p^n}} is the transfer; R, F, V satisfy FV is the residual C_p norm on π_* (equal to p when that residual action is trivial, in particular for circle-equivariant inputs), RF = FR, RV = VR, and for a commutative ring A there are natural ring isomorphisms W_n(A)≅π_0TR^n(A;p), compatible with R, F and V, and W(A)≅π_0TR(A;p). The extension to connective E₁-rings with commutative π₀ is stated with the Cartier heart in §3.4.

Throughout this statement, X a genuine (p-)cyclotomic spectrum; A a commutative ring for the Witt identification here.

([NS](#ns), Chapter II, §II.4, Definition II.4.4 (Acta p. 263; R and F recalled on p. 262) and the pullback square (1) with footnote 22 (Acta p. 266); [HM97](#hm97), §2, Theorem 2.3, p. 18; [AN](#an), §6.1, Theorem 6.1, p. 57.)

The construction proceeds as follows. Define TR and TC^gen as limits/equalizers in Sp (NS18 Definition II.4.4). Integral TC^gen by the pullback (1) (NS18 p. 266 and footnote 22). Define V as the transfer for C_{p^{n−1}} ⊂ C_{p^n} and record the relations (the finite-index restriction/transfer formula; the p∞-only prototype must retain the residual action). For the Witt identification, construct the ring maps W_n(A)→π_0TR^n(A;p) from the zero-skeleton of the cyclic bar construction and the Teichmüller-type map, and show by induction on n, using the restriction cofibre sequence with the homotopy orbits of the previous level, that they are isomorphisms with RI=IR, FI=IF and VI=IV (Hesselholt–Madsen Theorem 2.3). Pass to the limit along R.

Provide the following operations and identities.

- `TR`: TR^{n+1}(X; p) = X^{C_{p^n}} and TR(X, p) = lim_R TR^n.
- `TR.restriction`: R : TR^{n+1} → TR^n.
- `TR.frobenius`: F : TR^{n+1} → TR^n (inclusion of fixed points).
- `TR.verschiebung`: V : TR^n → TR^{n+1} (transfer).
- `TR.relations`: RF = FR and RV = VR. On π_* at each finite fixed-point level, FV(m)=Σ_{g∈C_p}g·m for the residual C_p action. This equals p·m when that action is trivial, in particular for a residual circle action; no equality of coherent spectrum maps with p·id is asserted from this homotopy-group computation.
- `TCgen`: TC^gen(X, p) = Eq(id, F on TR(X, p)) and integral TC^gen by the pullback (1).
- `TR.pi0_witt`: For THH(A), A commutative: π_0TR^n(A; p) ≅ W_n(A) as rings, with F, V, R matching Mathlib's WittVector.frobenius, WittVector.verschiebung and truncation.
- `TR.pi0_witt_limit`: For a commutative ring A, π_0TR(A; p) ≅ W(A) compatibly with F and V.

**Checks.**

- `TR.level_one`: TR^1(X; p) = X.
- `TR.residual_norm`: For the regular residual C_p-module M=Z[C_p] and its basis element e₁, FV(e₁)=Σ_g e_g, whereas p·e₁ has zero coefficient at every g≠1. Thus the residual-action hypothesis cannot be omitted from FV=p. A residual circle action induces the trivial action on homotopy groups because the circle is connected.
- `TR.Fp_pi0`: π_0TR^n(𝔽_p; p) = ℤ/p^n.
- `TR.not_TC`: TR(𝔽_p; p) ≠ TC(𝔽_p; p): π_0TR(𝔽_p; p) = ℤ_p but π_{−1}TR = 0 while π_{−1}TC(𝔽_p) = ℤ_p (TC needs the equalizer with F).
- `TR.pi0_witt_ZZ`: For A=ℤ and p=3, π_0TR²(ℤ;3)=W₂(ℤ) is not ℤ/9: its ghost map is injective with image the pairs (w₀,w₁) with w₀≡w₁ mod 3, so the group is torsion-free of rank two. A definition reading off W_n(𝔽_p)=ℤ/p^n for every A fails here.

Also establish TR^1(X; p) = X (underlying spectrum). π_0TR^n(𝔽_p; p) = W_n(𝔽_p) = ℤ/p^n.

*Needs:* §2.14 (Genuine cyclotomic spectra); §2.13 (Isotropy separation for cyclic p-groups); `WittVector`; `WittVector.frobenius`; `WittVector.verschiebung`.

**Representation spheres and representation-graded TR.** For a finite group G and a finite-dimensional real orthogonal G-representation V, the representation sphere S^V is the one-point compactification of V with its G-action; its suspension spectrum in GSp is ⊗-invertible, with S^V⊗S^W≃S^{V⊕W} naturally in isometries, S^{ℝ^n}=Σ^nS for the trivial representation, and Φ^H(S^V⊗X)≃S^{V^H}⊗Φ^H X for every subgroup H⊆G. For a finite-dimensional complex T-representation λ the spheres S^λ restricted to the finite subgroups C_n⊂T define an invertible object of TSp_F, compatibly with restriction to C_{p^∞}Sp. For a genuine p-cyclotomic spectrum X, n≥1 and q∈ℤ put TR^n_{q−λ}(X;p):=π_q((S^λ⊗X)^{C_{p^{n−1}}}), and write λ′:=ρ_p^*(λ^{C_p}) for the C_p-fixed subrepresentation regarded as a T-representation through the p-th root T≅T/C_p. For n≥2 there are a restriction R:TR^n_{q−λ}(X;p)→TR^{n−1}_{q−λ′}(X;p), a Frobenius F:TR^n_{q−λ}(X;p)→TR^{n−1}_{q−λ}(X;p) given by inclusion of fixed points, a Verschiebung V in the opposite direction given by the transfer, and a natural long exact sequence

```text
⋯ → π_q((S^λ⊗X)_{hC_{p^{n−1}}}) → TR^n_{q−λ}(X;p) →R TR^{n−1}_{q−λ′}(X;p) → π_{q−1}((S^λ⊗X)_{hC_{p^{n−1}}}) → ⋯
```

For λ=0 these are the groups and operators of the preceding target. For X=THH(A) they are the groups TR^n_{q−λ}(A;p)=[S^q∧(T/C_{p^{n−1}})_+, T(A)∧S^λ]_T of Hesselholt and Madsen.

Throughout this statement, G finite; V orthogonal and λ complex finite-dimensional; X a genuine p-cyclotomic spectrum; n≥1 for the groups and n≥2 for R, F, V and the long exact sequence; the residual action on λ^{C_p} is transported along T≅T/C_p, z↦z^p, as in the Conventions.

([H05](#h05), §3.2, (3.8), p. 78, and Proposition 1, p. 79, for orthogonal T-spectra indexed by T-representations; §3.10, p. 94, for TR^n_{q−λ}, λ′=ρ_p^*λ^{C_p}, the restriction map and the long exact sequence; §3.12, pp. 99–100, for the perfect-field values; [NS](#ns), Chapter II, §II.2, Definitions II.2.2–II.2.5, Acta pp. 247–249, for orthogonal G-spectra evaluated on representations.)

The construction proceeds as follows. Representation spheres are suspension spectra of finite based G-CW complexes, so they lie in GSp^O and pass to GSp; their inverses come from the orthogonal-spectrum evaluation at representations used in §2.12. Since (S^V)^H=S^{V^H}, the geometric fixed points of S^V⊗X follow from §2.12 (Geometric fixed points via complete universes) and the monoidality of Φ^H. For T use the finite subgroups only, as in TSp_F. For n≥2 apply §2.13 (Isotropy separation for cyclic p-groups) to S^λ⊗X with G=C_{p^{n−1}}: the third term is (Φ^{C_p}(S^λ⊗X))^{C_{p^{n−2}}}≃(S^{λ^{C_p}}⊗Φ^{C_p}X)^{C_{p^{n−2}}}, and the cyclotomic structure Φ^{C_p}X≃X, transported along ρ_p, identifies it with (S^{λ′}⊗X)^{C_{p^{n−2}}}. F is restriction of fixed points and V the transfer for C_{p^{n−2}}⊂C_{p^{n−1}}.

Provide the following operations and identities.

- `representationSphere`: S^V∈GSp for orthogonal G-representations, with S^V⊗S^W≃S^{V⊕W} and the inverse S^{−V}.
- `representationSphere.geometricFixedPoints`: Φ^H(S^V⊗X)≃S^{V^H}⊗Φ^H X.
- `representationSphere.circle`: S^λ∈TSp_F for complex T-representations, compatible with restriction to every C_n.
- `TR.representationGraded`: TR^n_{q−λ}(X;p) for n≥1, with R to the index λ′, F and V for n≥2.
- `TR.representationGraded.cofibre`: for n≥2, the long exact sequence with the homotopy-orbit term π_*((S^λ⊗X)_{hC_{p^{n−1}}}).

**Checks.**

- `TR.representationGraded.zero`: For λ=0, λ′=0 and TR^n_{q−0}(X;p)=TR^n_q(X;p) with the operators of the preceding target.
- `TR.representationGraded.underlying`: For n=1, TR^1_{q−λ}(X;p)=π_{q−2d}(X) with d=dim_ℂλ, because the underlying spectrum of S^λ⊗X is Σ^{2d}X. For X=THH(A) this is THH_{q−2d}(A), as on p. 99 of H05. At n=1 there is no restriction to a level TR⁰ and the displayed long exact sequence is not asserted.
- `TR.representationGraded.restrictionIndex`: For the standard representation λ=ℂ(1), C_p acts freely on the unit sphere and λ′=0; for λ=ℂ(p), C_p acts trivially and λ′=ℂ(1). Using λ itself at level n−1 would give the wrong target of R.
- `TR.representationGraded.perfectField`: For a perfect field k of characteristic p put ℓ_s=dim_ℂ(λ^{C_{p^s}}) for s≥0 and ℓ_s=∞ for s<0. Then TR^n_{q−λ}(k;p) is zero for q odd and W_r(k) for q=2m with ℓ_{n−r}≤m<ℓ_{n−1−r} (H05 §3.12, pp. 99–100). For λ=0 this gives W_n(k) in every even degree q≥0, the value of π_*TR^n(k;p). For λ=ℂ(1) and n=2 it gives k in degree 0 and W_2(k) in degrees 2m with m≥1.

Also establish For n≥2, q<dim_ℝλ and connective X the homotopy-orbit term vanishes, so R is an isomorphism for q<dim_ℝλ and surjective for q=dim_ℝλ (H05 p. 94).

*Needs:* §2.12 (Genuine G-spectra, genuine and geometric fixed points); §2.12 (Geometric fixed points via complete universes); §2.13 (Isotropy separation for cyclic p-groups); §2.14 (Genuine C_{p^∞}-spectra and F-genuine T-spectra); §2.14 (Genuine cyclotomic spectra); §2.14 (TR and genuine TC); BordismFormalGroups §F6.5 (finite-group Borel norm and Tate cofiber).

### 2.15 Coalgebras, coreflection and bounded-below equivalence

**Coalgebras and fixed points of endofunctors.** For an endofunctor F of an infinity category C, CoAlg_F(C)=LEq(id_C,F) has objects X→FX and Fix_F(C) is the full subcategory where this arrow is an equivalence. If C is presentable and F preserves colimits, the inclusion ι has a right adjoint R_ι. Let F̄ be the lifted endofunctor on coalgebras and R̄ its right adjoint. NS18 Proposition II.5.3 identifies ιR_ι as the coherent inverse limit of id←R̄←R̄²←…, in the coalgebra functor category. When F also preserves pullbacks and its right adjoint R is fully faithful, Lemma II.5.4 computes one iterate R̄(X,α) by the pullback X×_{RF X}RX, using η_X and Rα, with its induced coalgebra structure. The general limit formula and this special one-iterate pullback formula are distinct. Commuting families are treated one prime at a time.

Throughout this statement, C presentable and F colimit-preserving for NS18 Proposition II.5.3; for the explicit formula additionally require F to preserve pullbacks and its right adjoint to be fully faithful.

([NS](#ns), §II.5, Proposition II.5.3 and Lemma II.5.4, Acta pp. 269–271; arXiv v2 pp. 55–56.)

The construction proceeds as follows. Define via lax equalizers and equalizers (NS18 Definition II.5.1); construct the shifted coalgebra and its right adjoint (Construction II.5.2). Prove the coreflection (Proposition II.5.3) and the formula (Lemma II.5.4).

Provide the following operations and identities.

- `Coherent.Endofunctor.CoAlg`: CoAlg_F(C) = LEq(id, F).
- `Coherent.Endofunctor.Fix`: Fix_F(C) = Eq(id, F) ⊆ CoAlg_F(C).
- `Coherent.Endofunctor.coreflection`: The right adjoint R_F̄ to Fix_F → CoAlg_F for C presentable and F colimit-preserving.
- `Coherent.Endofunctor.coreflection_formula`: Identify ιR_ι with the pointwise coherent limit of the full inverse tower id←R̄←R̄²←…; the limit is in coalgebras, not an object sequence in C.
- `Coherent.Endofunctor.barRight`: Right adjoint to the lifted F on coalgebras, built from the coherent adjunction F⊣R.
- `Coherent.Endofunctor.barRight.pullback`: If F preserves pullbacks and R is fully faithful, compute R̄(X,α) by X×_{RFX}RX with its coalgebra structure.

**Checks.**

- `Endofunctor.Fix_id`: For F = id_C, CoAlg_F(C) has objects (c, f : c → c) and Fix_F(C) those with f an equivalence, i.e. Fun(Bℤ, C).
- `Endofunctor.CoAlg_zero`: For F = 0 (constant at the zero object), CoAlg_F(C) ≃ C and Fix_F(C) = {0}.
- `Endofunctor.fix_not_coalg`: For F=id on a nonzero stable category, (c,0:c→c) with c≠0 is a coalgebra but not a fixed point. This respects the colimit-preserving hypothesis.

Also establish For F = Φ^{C_p} on C_{p^∞}Sp, Fix_F = CycSp_p^{gen}. The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

*Needs:* §2.9 (Lax equalizers of ∞-categories); EnhancedDerivedSheaves E3 — adjoint functor theorem and localisations; EnhancedDerivedSheaves E5:presentability — presentable categories; EnhancedDerivedSheaves E0; EnhancedDerivedSheaves E5:abstract.

**Genuine cyclotomic spectra coreflect.** The inclusion of genuine p-cyclotomic spectra into coalgebras for Φ^{C_p} on C_{p^∞}Sp has a right adjoint (NS18 Theorem II.5.6); the counit of this coreflection is an equivalence after forgetting to the underlying nonequivariant spectrum, and likewise genuine cyclotomic spectra into coalgebras for the commuting family (Φ^{C_p})_p on TSp_F (NS18 Theorem II.5.13), using the lemmas on endofunctors with terminal composites, commuting endofunctors, one prime at a time, and the commutation of geometric fixed points with R_{C_q} (Lemmas II.5.8–II.5.12).

Throughout this statement, Presentability; the endofunctors are accessible.

([NS](#ns), Chapter II, §II.5, Theorem II.5.6, Acta pp. 271–272; Theorem II.5.13, pp. 277–278.)

The construction proceeds as follows. Apply §2.15 (Coalgebras and fixed points of endofunctors) to Φ^{C_p} (NS18 Theorem II.5.6). Handle all primes via commuting endofunctors and R_{C_q} (NS18 Lemmas II.5.8–II.5.12, Theorem II.5.13).

Also establish The coreflection of a genuine cyclotomic spectrum is itself. The supplying diagram is coherent: maps and universal properties are expressed in mapping spaces, not by strict commutative squares of ordinary morphisms.

*Needs:* §2.15 (Coalgebras and fixed points of endofunctors); §2.14 (Genuine cyclotomic spectra); §2.13 (Geometric fixed points as a localisation); EnhancedDerivedSheaves E0; EnhancedDerivedSheaves E5:abstract.

**Genuine and naive cyclotomic spectra agree on bounded below objects.** The forgetful functors CycSp_p^{gen} → CycSp_p and CycSp^{gen} → CycSp restrict to equivalences between the full subcategories of objects with bounded below underlying spectrum (NS18 Theorems II.6.3 and II.6.9).

Throughout this statement, Bounded below underlying spectra.

([NS](#ns), Chapter II, §II.6, Theorem II.6.3, Acta pp. 279–280; Theorem II.6.9, pp. 283–284.)

The construction proceeds as follows. Φ^{C_p} preserves Borel-completeness on bounded below objects (NS18 Lemma II.6.1, via the Tate orbit lemma) — AInfCohomology §AI.7.2 (`AInf.Trace.tateOrbit`). Construct the right adjoint on bounded below p-cyclotomic spectra and show unit and counit are equivalences (Lemma II.6.2, Theorem II.6.3). Integral version for F-genuine T-spectra (Lemmas II.6.6, II.6.8, Theorem II.6.9).

Also establish THH of a connective E_1-ring in the Bökstedt model and in the NS model correspond under the equivalence (§2.16 (The two THH agree as cyclotomic spectra)).

*Needs:* §2.15 (Genuine cyclotomic spectra coreflect); AInfCohomology §AI.7.2 (`AInf.Trace.tateOrbit`); §2.13 (Borel-complete genuine spectra); §2.9 (Cyclotomic spectra).

### 2.16 The Bökstedt model and its comparison

**The Bökstedt construction and classical THH.** Bökstedt's category I has objects the finite sets n = {1,…,n} (including ∅) and injections; for an orthogonal ring spectrum A, the Bökstedt construction is the cyclic orthogonal spectrum [k] ↦ hocolim_{(i_0,…,i_k) ∈ I^{k+1}} Map(S^{i_0} ∧ … ∧ S^{i_k}, A_{i_0} ∧ … ∧ A_{i_k} ∧ −) (with the approximation lemma for hocolims over I, NS18 Lemma III.4.2 and Definition III.4.3); it preserves stable equivalences of all inputs in the sense of NS18 Theorem III.4.4 (Shipley), models the smash product (NS18 Theorem III.4.5) and has geometric fixed points computed by NS18 Theorem III.4.7. Classical THH(A) is its realisation, an orthogonal cyclotomic spectrum (NS18 Definition III.5.1, Proposition III.5.4).

Throughout this statement, The Bökstedt functor of NS18 Theorem III.4.4 is homotopical without a convergence assumption. For classical geometric realization, use a levelwise well-pointed orthogonal ring spectrum whose unit in level zero is an h-cofibration, or first choose such a replacement.

([NS](#ns), Chapter III, §III.4: Lemma III.4.2 (Acta p. 303), Definition III.4.3 (Acta p. 304), Theorem III.4.4 (Acta p. 305), Theorem III.4.5 (Acta p. 306), Construction III.4.6 (p. 307), Theorem III.4.7 (Acta p. 308); [NS](#ns), Chapter III, §III.5, Definition III.5.1 (Acta p. 311), Lemma III.5.2 (p. 312), Proposition III.5.4 (Acta p. 314), with the construction of Φ_p on pp. 315-316.)

The construction proceeds as follows. Define I and prove the approximation lemma (NS18 Lemma III.4.2). Define B(X) and import Shipley's invariance (NS18 Theorem III.4.4); prove it models ⊗ (Theorem III.4.5) and compute Φ^{C_p} (Theorem III.4.7). Assemble the cyclic structure and the cyclotomic structure maps for classical THH (Definition III.5.1, Proposition III.5.4).

Provide the following operations and identities.

- `BokstedtCategory`: Bökstedt's I: finite sets and injections.
- `Bokstedt.construction`: B(X) for an orthogonal spectrum-valued I^{k+1}-diagram.
- `Bokstedt.preserves_equiv`: B preserves stable equivalences (Shipley).
- `Bokstedt.classicalTHH`: Classical THH(A) as an orthogonal cyclotomic spectrum.
- `Bokstedt.geometricFixedPoints`: Φ^{C_p} of the p-fold subdivided Bökstedt construction is the Bökstedt construction of the edgewise piece (NS18 Theorem III.4.7).

**Checks.**

- `Bokstedt.sphere`: Classical THH(S) ≃ S.
- `Bokstedt.pi0`: π_0 classical THH(HR) = R/[R,R] for a discrete ring R.
- `Bokstedt.index_automorphisms`: End_I([2]) has exactly two injections, identity and transposition. In particular I is not the linearly ordered poset ℕ; a poset-indexed substitute loses this automorphism.

Also establish For A = S (orthogonal sphere), classical THH(S) ≃ S as orthogonal cyclotomic spectra.

*Needs:* §2.12 (Orthogonal spectra); §2.14 (Orthogonal cyclotomic spectra model genuine ones); §2.12 (Geometric fixed points via complete universes); §2.6 (Geometric realisation of cyclic objects and the circle action).

**The two THH agree as cyclotomic spectra.** For a connective E_1-ring A (modelled by an orthogonal ring spectrum), the underlying T-spectrum of classical (Bökstedt) THH(A) is equivalent to THH(A) of §2.7 (Topological Hochschild homology of an E_1-ring) (NS18 Theorem III.6.1), and the Frobenius maps agree: under the equivalence of §2.15 (Genuine and naive cyclotomic spectra agree on bounded below objects), classical THH(A) ∈ CycSp^{gen} maps to THH(A) ∈ CycSp (NS18 Theorem III.6.7, Corollary III.6.8).

Throughout this statement, A connective (bounded below for the cyclotomic comparison). The point-set model is levelwise well-pointed and its level-zero unit is an h-cofibration (NS18 Corollary III.6.8). An arbitrary connective orthogonal ring must first be replaced.

([NS](#ns), Chapter III, §III.6, Theorem III.6.1 (Acta pp. 316-317), Theorem III.6.7 (Acta p. 322), Corollary III.6.8 (Acta p. 324).)

The construction proceeds as follows. Compare cyclic objects via §2.16 (The Bökstedt construction and classical THH) (models ⊗) (NS18 Theorem III.6.1). Models of geometric fixed points (NS18 Proposition III.6.6) and uniqueness of the comparison of Frobenii via the uniqueness of the Tate diagonal (NS18 Theorem III.6.7, AInfCohomology §AI.7.2 (Spectral Tate diagonal)). Point-set inputs from NS18 Appendix C: the reduced homotopy colimit of orthogonal spectra is homotopical and models the ∞-categorical colimit (Proposition C.11), and genuine fixed points of orthogonal G-spectra commute with geometric realisations and homotopy colimits (Lemmas C.12–C.13, Proposition C.14).

Also establish Applied to HF_p: Bökstedt's π_*THH(𝔽_p) = 𝔽_p[σ] is π_* of NS18's THH(𝔽_p).

*Needs:* §2.16 (The Bökstedt construction and classical THH); §2.7 (Topological Hochschild homology of an E_1-ring); §2.7 (The cyclotomic Frobenius of THH); AInfCohomology §AI.7.2 (Spectral Tate diagonal); §2.15 (Genuine and naive cyclotomic spectra agree on bounded below objects).

### 2.17 Restriction pullbacks and the genuine TC comparison

**The restriction pullback for genuine fixed points.** For a genuine C_{p^n}-spectrum X (n ≥ 1) there is a natural pullback square with top row X^{C_{p^n}} → (Φ^{C_p}X)^{C_{p^{n−1}}} and bottom row X^{hC_{p^n}} → X^{tC_{p^n}}; if X is bounded below the bottom right can be replaced by (X^{tC_p})^{hC_{p^{n−1}}}, and iterating gives X^{C_{p^n}} as an iterated pullback of X^{hC_{p^k}}'s over Tate terms.

Throughout this statement, X genuine C_{p^n}-spectrum; bounded below for the second statement.

([NS](#ns), Chapter II, §II.4, Lemma II.4.5, Proposition II.4.6 (Acta p. 263) and Corollary II.4.7 (Acta pp. 263-264).)

The construction proceeds as follows. Isotropy separation (§2.13 (Isotropy separation for cyclic p-groups)) mapped to the norm sequence (NS18 Lemma II.4.5). Replace X^{tC_{p^n}} by (X^{tC_p})^{hC_{p^{n−1}}} (AInfCohomology §AI.7.2 (`AInf.Trace.completedTateComparison`); NS18 Proposition II.4.6), iterate (Corollary II.4.7). Consequence used for the Segal-conjecture-type reductions (NS18 Corollary II.4.9): if X and its iterated geometric fixed points are bounded below and (Y^{C_p})^∧_p → (Y^{hC_p})^∧_p is an isomorphism on π_i for i ≥ k for each of them, then (X^{C_{p^n}})^∧_p → (X^{hC_{p^n}})^∧_p is an isomorphism on π_i for i ≥ k.

Also establish For n = 1: X^{C_p} = X^{hC_p} ×_{X^{tC_p}} Φ^{C_p}X.

*Needs:* §2.13 (Isotropy separation for cyclic p-groups); AInfCohomology §AI.7.2 (`AInf.Trace.completedTateComparison`); §2.13 (Borel-complete genuine spectra).

**Genuine and Nikolaus–Scholze TC agree on bounded below spectra.** (i) For a genuine p-cyclotomic X with bounded below underlying spectrum, TC^{gen}(X, p) ≃ TC(X, p), naturally. (ii) For a genuine cyclotomic X with bounded below underlying spectrum, TC^{gen}(X) ≃ TC(X). In particular for every connective E_1-ring A, the classical (Bökstedt–Hsiang–Madsen–Goodwillie) TC(A) agrees with TC(THH(A)) of §2.10 (Topological cyclic homology).

Throughout this statement, Bounded below underlying spectrum (connective A). For an explicit classical orthogonal-ring THH model, use the levelwise well-pointed/unit h-cofibration witness of §2.16 (The two THH agree as cyclotomic spectra); otherwise choose a replacement first.

([NS](#ns), Chapter II, §II.4, Theorems II.4.10–II.4.11, Acta pp. 265–267; Theorem II.3.8, pp. 260–261; Theorems II.6.3 and II.6.9, pp. 280 and 283–284.)

The construction proceeds as follows. Use §2.17 (The restriction pullback for genuine fixed points) to rewrite TR(X, p) as a limit of homotopy fixed points and Tate terms; the equalizer with F becomes the fibre of φ^{hT} − can (NS18 Theorem II.4.10). Integral version: the pullback (1) and §2.10 (p-completion of TC) (NS18 Theorem II.4.11). For THH of a connective E_1-ring compare the two THH (§2.16 (The two THH agree as cyclotomic spectra)).

Also establish For A = 𝔽_p both sides give π_* = ℤ_p in degrees 0 and −1 (p-adically). The bounded below hypothesis is needed: for unbounded X the two TC can differ (genuine TC of a periodic object is not computed by the formula).

*Needs:* §2.14 (TR and genuine TC); §2.17 (The restriction pullback for genuine fixed points); §2.10 (The Nikolaus–Scholze formula for TC); §2.10 (p-completion of TC); §2.16 (The two THH agree as cyclotomic spectra).

### 2.18 The graded de Rham–Witt comparison for TR

**Hesselholt’s de Rham–Witt comparison for TR.** For a smooth commutative F_p-algebra R and s≥1, the canonical Witt-complex map λ_s:W_sΩ_R^*→π_*TR^s(R;p) extends to a natural graded-ring isomorphism W_sΩ_R^*[σ_s]≅π_*TR^s(R;p), |σ_s|=2. Restriction acts on the forms by Witt restriction and sends σ_s to pσ_{s−1} after compatible choice of generator (in Hesselholt’s initial choices there is a unit factor). Taking the coherent restriction limit gives π_*TR(R;p)≅WΩ_R^*, compatibly with Frobenius and the circle differential. The finite-level and limit statements also hold for ind-smooth F_p-algebras, by the filtered-colimit argument of CMM. This is the full graded comparison requested by CMM item 033; the general de Rham–Witt construction belongs to CR.4 and the π_0 Witt-vector convention remains L.4.

Throughout this statement, p prime; R smooth over F_p, or ind-smooth for the stated extension; TR^s uses C_{p^{s−1}} fixed points.

([He](#he), Theorems B–C, PDF p. 2; Proposition 1.5.8, p. 14; §2.1–2.4, pp. 14–24; proof of Theorem B and Corollary 2.4.7, p. 24; [CMM](#cmm), Theorem 2.25, equations (10)–(11), pp. 15–16; proof of Proposition 2.26, p. 16; proof of Theorem 5.31, p. 48.)

The construction proceeds as follows. Use the Witt-complex operators on π_*TR^s and CR.4 initiality to construct λ_s, with R,F,V and circle differential compatibility (Hesselholt 1.5.8). For F_p-polynomial rings, decompose the cyclic bar by monomial weights; compute fixed points of the resulting circle pieces and compare their bases and products with basic Witt differentials (§2.1–2.3). Pass to perfect coefficient fields and étale polynomial charts by the finite-level étale comparison (2.4.2–2.4.5), then glue by the acyclic Witt localization cover of 2.4.6. In each total degree the positive-σ summands form a pro-zero tower under restriction; the forms tower is Mittag–Leffler. Apply the Milnor sequence to identify the coherent limit (2.4.7). For ind-smooth inputs, finite TR levels and finite Witt forms commute with filtered colimits; use CMM’s torsion/restriction argument when passing to the inverse limit, rather than commuting a general inverse limit with that colimit.

Also establish At s=1 the result is Ω_R^*[σ_1] with σ_1 in degree 2. For R=F_p it gives π_{2j}TR^s=Z/p^s and π_{odd}=0; restriction on degree 2 is multiplication by p (up to the chosen unit). The positive-degree Bott generators disappear in lim_R for R=F_p: TR has π_0=Z_p and no positive homotopy groups, although each finite level has them.

*Needs:* §2.14 (TR and genuine TC); §2.16 (The two THH agree as cyclotomic spectra); CrystallineCohomology CR.4; StableHomotopyKTheory Layer 7.

### Examples

Let Cₚ act trivially on HZ. The complete resolution alternates 0=g−1 and p=N, so π₂ᵣ((HZ)ᵗCₚ)=Z/p and π₂ᵣ₊₁=0 for every integer r. This agrees with πᵢ=Ĥ⁻ⁱ and fixes the parity of the imported algebraic Tate calculation. For the trivial group C₁ the norm is the identity, and its cofiber is zero; a formula assigning a periodic coefficient ring to C₁ would fail. For a circle action the norm source is suspended: ΣXₕT→XʰT→XᵗT. Its HZ-linear cyclic incarnation is ΣHC→HC⁻→HP, which fixes the shift in the SBI boundary.

The ordinary relative computation HH(Fₚ/Z) has divided-power generator a in degree 2, with aᵖ=p!γₚ(a)=0. Bökstedt's THH(Fₚ) has polynomial generator u in degree 2, with uᵖ≠0. Consequently the map to ordinary Hochschild homology cannot be a multiplicative equivalence. The trivial-group norm test and this characteristic-p test apply before any bounded-below comparison with genuine cyclotomic models.

### Dependencies

Earlier layers 1. Use the named Mathlib and Tau Ceti inputs under the supplier contracts; external contracts: CrystallineCohomology CR.4; EnhancedDerivedSheaves E0; EnhancedDerivedSheaves E1; EnhancedDerivedSheaves E3; EnhancedDerivedSheaves E5:abstract; EnhancedDerivedSheaves E5:presentability; EnhancedDerivedSheaves E5:spectra-comparison; GeneralAlgebraicKTheory Layers 5–6; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; StableHomotopyKTheory Layer 7. The individual statements above identify the required comparison or functoriality, not merely a shared object name.

## Layer 3: Cartier modules and cyclotomic quasi-isogenies

Use circle-equivariant p-typical cyclotomic spectra for the Cartier correspondence. Restriction to the Prüfer group compares TC after p-completion; the cyclotomic t-structure, rather than the underlying Postnikov t-structure, controls quasi-isogenies.

### 3.1 The circle-equivariant p-typical convention

**Circle-equivariant p-typical cyclotomic spectra.** Write CycSp_T,p = LEq(id,(−)^{tC_p}:Sp^{BT} ⇒ Sp^{BT}), using T/C_p ≃ T by the p-th power map. An object is a T-spectrum X and a T-equivariant Frobenius X → X^{tC_p}; a morphism includes the homotopy intertwining Frobenius. This is Antieau–Nikolaus’s CycSp_p and AMMN’s CycSp. Distinguish it from the C_{p^∞}-equivariant category of §2.9 (Cyclotomic spectra). Restricting the action defines a functor to that category. Put TC_T,p(X)=map_CycSp_T,p(S^triv,X). Its equalizer is X^{hT} ⇉ (X^{tC_p})^{hT}; restriction compares it with TC(X|C_{p^∞},p), the equalizer over X^{hC_{p^∞}}, by a p-adic equivalence; Antieau–Nikolaus state this for every X, through fib(1−F) on TR. The underlying-spectrum functor is exact, conservative and colimit preserving.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AN](#an), §2.1 and Example 2.2, p. 8; Remark 2.5, pp. 8–9; Warning 2.6, p. 9; [AMMN](#ammn), §3.1, p. 15, footnote 8.)

The construction proceeds as follows. Apply the existing lax-equalizer construction with the residual circle action; specify a single prime rather than forgetting the group acting on X. Compute mapping spectra from the trivial cyclotomic sphere by the mapping-space formula. Compare the T and C_{p^∞} homotopy fixed-point equalizers after p-completion, keeping the comparison map.

Provide the following operations and identities.

- `CirclePTypicalCyclotomic`: The coherent lax equalizer with underlying T-spectrum and a single prime-indexed Frobenius.
- `CirclePTypicalCyclotomic.restrict`: Restrict the circle action to C_{p^∞}, preserving the residual Frobenius and all its morphism homotopies.
- `CirclePTypicalCyclotomic.tc`: Mapping from S^triv is the homotopy equalizer of can and Frobenius on T-homotopy fixed points.
- `CirclePTypicalCyclotomic.tc_p_completion`: Restriction induces a p-adic equivalence with C_{p^∞}-equivariant TC, through fib(1−F:TR(X)→TR(X)) (AN Remark 2.5 and Warning 2.6).
- `CirclePTypicalCyclotomic.forget`: CycSp_T,p is stable and presentable; the underlying functor to Sp^{BT} is exact and conservative and preserves and detects colimits (NS Proposition II.1.5, as used in AN Lemma 2.10).
- `CirclePTypicalCyclotomic.trivial`: A spectrum X gives X^triv with trivial T-action and Frobenius X→X^{hC_p}→X^{tC_p}; S^triv is the unit of the symmetric monoidal structure and corepresents TC_T,p (AN Example 2.2 and Remark 2.5).

**Checks.**

- `CirclePTypicalCyclotomic.zero`: The zero T-spectrum has one Frobenius and zero TC.
- `CirclePTypicalCyclotomic.sphere`: The unit is the sphere with trivial T-action and Frobenius S → S^{hC_p} → S^{tC_p}, rather than an arbitrarily chosen zero Frobenius.
- `CirclePTypicalCyclotomic.tc_convention`: For X=Hℚ with trivial T-action and its unique Frobenius to the vanishing Tate spectrum, TC_T,p(X)=Hℚ^{hT}, whereas fib(1−F:TR(X)→TR(X))=Hℚ^{hC_{p^∞}}=Hℚ. The former has a nonzero π_−2; equality requires p-completion.

Also establish A consumer must specify whether its p-typical objects have T or C_{p^∞} actions; no uncompleted TC equivalence follows from restriction alone.

*Needs:* §2.9 (Lax equalizers of ∞-categories); §2.1 (Spectra with an action of a group); BordismFormalGroups §F6.5 (finite-group Borel norm and Tate cofiber); §2.9 (Cyclotomic spectra); AInfCohomology §AI.7.2 (`AInf.Trace.completedTateComparison`).

### 3.2 Classical and topological Cartier data

**Classical p-typical Cartier modules.** A p-typical Cartier module is an abelian group M with additive endomorphisms F,V satisfying F∘V=p·id_M. A morphism is an additive homomorphism commuting with both operators. Write Cart_p for this abelian category. Do not impose V∘F=p as a second axiom. Kernels and cokernels are those of abelian groups with their induced operators. A map f:M→N is an isogeny precisely when its underlying additive homomorphism is: if g:N→M satisfies gf=N₀id_M and fg=N₀id_N for N₀>0, then N₀g commutes with F,V and gives inverse composites N₀²id.

Throughout this statement, Fix a prime p (the definition makes sense for any natural number p). The objects are ordinary abelian groups with additive operators; no higher-categorical data enter.

([AN](#an), §3.1 and footnote 5, p. 15; Examples 3.2–3.3, p. 15; §3.4, pp. 27–28; [AMMN](#ammn), Proof of Proposition 3.1, p. 15.)

The construction proceeds as follows. Define the operator structures and their commuting additive maps. Kernels and cokernels inherit FV=p; the forgetful functor creates these constructions. The defects F_M g−g F_N and V_M g−g V_N land in ker f. Since N₀ kills ker f, N₀g commutes with both operators. This is the corrected lifting argument of AMMN, not the printed V/F mismatch.

Provide the following operations and identities.

- `CartierStructure`: For an abelian group M, store F,V:M→M additive and the relation FV=p.
- `CartierStructure.IsMorphism`: An additive map is a Cartier map exactly when it commutes with F and V.
- `CartierModule.kernel_cokernel`: The forgetful functor to abelian groups creates kernels and cokernels.
- `CartierModule.isogeny_iff_underlying`: A Cartier map is an isogeny iff the underlying additive map is; an inverse denominator N₀ can be replaced by N₀².

**Checks.**

- `CartierModule.zero`: The zero group has a unique Cartier structure and is both initial and terminal.
- `CartierModule.integer`: On ℤ, V=id and F=p define a Cartier structure; F=V=id does not when p>1.
- `CartierModule.no_vf_axiom`: On M=(ℤ/p)², let F(x,y)=(x,0) and V(x,y)=(0,x). Then FV=0=p·id, but VF(1,0)=(0,1)≠0=p·(1,0). A definition that also imposed VF=p would incorrectly exclude M.
- `CartierModule.morphism_checks_operators`: At p=2 on ℤ, the structures (F,V)=(2·id,id) and (id,2·id) both satisfy FV=2·id. The identity map commutes with FV but fails to commute with F, since 2≠1 on 1∈ℤ; it is not a Cartier morphism. Identity maps of a single structure and the zero map between any two structures are Cartier morphisms.

Also establish An additive approximate inverse need not commute with either operator until multiplied by its denominator.

*Needs:* `AddCommGroup`; `AddMonoidHom`.

**Topological Cartier modules.** A p-typical topological Cartier module is a T-spectrum M with T-equivariant maps V:M_{hC_p}→M and F:M→M^{hC_p}, together with a specified homotopy F∘V ≃ Nm_{C_p}. The category TCart_p is the pullback of the coherent two-simplex category along (M,Nm_M), as in AN Definition 3.6; retaining the homotopy is part of the object and of its mapping spaces. A classical Cartier module gives HM with these maps via truncations. On π_iM, the induced F,V satisfy FV=p. The cofiber M/V=cofib(V) has cyclotomic Frobenius obtained from the square with V, F and the norm, followed by M^{tC_p}→(M/V)^{tC_p}. This defines a functor TCart_p→CycSp_T,p.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AN](#an), Definitions 3.1 and 3.6; Examples 3.2–3.5; Proposition 3.8, pp. 15–19; Proposition 3.11, p. 21.)

The construction proceeds as follows. Use the arrow and two-simplex pullback of Definition 3.6, not an ordinary category of commuting maps. Proposition 3.8 computes its mapping spectra by a fiber sequence. Take vertical cofibers of the square MhC_p→MhC_p over M→M^{hC_p}; the chosen norm-factorization homotopy induces M/V→M^{tC_p}. Compose with the Tate image of the quotient map. For HM, the norm factors through multiplication by p on M, giving the classical case. The norm on general homotopy groups gives FV=p. Proposition 3.11 gives stability, presentability and preservation of limits and colimits by the forgetful functor; the defect map in the mapping-spectrum formula is gV_M−V_N g_{hC_p}.

Provide the following operations and identities.

- `TopologicalCartierModule`: The coherent pullback category of norm factorizations.
- `TopologicalCartierModule.homotopyCartier`: π_i carries a natural classical Cartier structure for every integer i.
- `TopologicalCartierModule.modV`: Taking cofibers defines the cyclotomic quotient M/V and acts on coherent morphisms.
- `TopologicalCartierModule.mapping_fiber`: Mapping spectra are the fiber described in AN Proposition 3.8, recording compatibility with V as well as with the Frobenius lift.
- `TopologicalCartierModule.ofCartier`: A classical Cartier module (M,F,V) gives the discrete object HM, with V and F factoring through the truncations M_{hC_p}→τ_{≤0}M_{hC_p}≃M and M≃τ_{≥0}M^{hC_p}; this identifies Cart_p with the discrete topological Cartier modules (AN Example 3.2).
- `TopologicalCartierModule.forget`: TCart_p is stable and presentable, and the underlying functor to Sp^{BT} preserves all limits and colimits (AN Proposition 3.11).

**Checks.**

- `TopologicalCartierModule.zero`: The zero T-spectrum gives the zero Cartier object and its quotient is zero.
- `TopologicalCartierModule.discrete`: Structures on HM for a discrete abelian group M are exactly Cartier structures with FV=p, through the canonical truncation maps.
- `TopologicalCartierModule.modV_is_derived`: For M=Hℤ_p with V=p and F=id, π_1(M/V)=0 and π_0(M/V)=ℤ/p, but for M=Hℤ/p with V=p=0 and F=id, π_1(M/V) contains ℤ/p. The second quotient cannot be replaced by the ordinary cokernel of V.

Also establish The datum includes a norm-factorization homotopy and does not reduce to equalities on π_* alone.

*Needs:* §3.2 (Classical p-typical Cartier modules); §3.1 (Circle-equivariant p-typical cyclotomic spectra); BordismFormalGroups §F6.5 (finite-group Borel norm and Tate cofiber); EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E0 — limits colimits universal properties; EnhancedDerivedSheaves E0 — coherent functors.

### 3.3 Derived Verschiebung completion

**Derived V-completeness.** A classical Cartier module M is derived V-complete when Rlim(…→^V M→^V M)=0 in D(ℤ), equivalently M≃Rlim_n cofib(V^n:M→M). A bounded-below topological Cartier module M is V-complete when lim_n M_{hC_{p^n}}=0 with the iterated V transition maps. Write V^n:M_{hC_{p^n}}→M for their composite and M/V^n for its cofiber. Its completion is lim_n M/V^n. For discrete HM the two completeness conditions agree. Ordinary separatedness or the ordinary inverse limit of cokernels is insufficient.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AN](#an), Definition 3.20 and Proposition 3.22, p. 26; Definition 3.24 and Lemma 3.25, pp. 27–28; Example 3.27, p. 28.)

The construction proceeds as follows. Define the two inverse towers, retaining derived limits and cofibers. For discrete M compare the diagonal homotopy-orbit tower to the double tower with the classical V transition. AN Lemma 2.11 commutes uniformly bounded-below orbits and limits; the Milnor lim/lim¹ description supplies the converse. The spectral completion universal property is supplied by tr-cartier-comparison, not assumed as part of the predicate.

Provide the following operations and identities.

- `CartierModule.IsDerivedVComplete`: The V-tower has zero derived inverse limit in D(ℤ).
- `TopologicalCartierModule.IsVComplete`: The iterated homotopy-orbit V-tower has zero inverse limit for bounded-below M.
- `TopologicalCartierModule.vCompletion`: The V-completion is lim_n M/V^n with its universal map; the existence and Cartier structure are the comparison theorem’s conclusion.
- `CartierModule.discrete_v_complete`: For discrete HM, spectral V-completeness iff algebraic derived V-completeness.

**Checks.**

- `CartierModule.v_p`: For V=p and F=id, derived V-completeness agrees with derived p-completeness; ℤ_p is complete and ℚ_p is not.
- `CartierModule.v_identity`: M=ℤ/p with V=id and F=0 is not derived V-complete, though it is p-complete; its V-tower has inverse limit M.
- `CartierModule.v_prufer`: For V=p and F=id on ℚ_p/ℤ_p, ordinary V-adic completion is zero while derived completion is ℤ_p[1]. Finite groups ℤ/p^n are complete, so their filtered colimit need not be complete.

Also establish A completeness API must retain both lim and lim¹; naive V-adic completion loses the heart test.

*Needs:* §3.2 (Topological Cartier modules); §3.2 (Classical p-typical Cartier modules); EnhancedDerivedSheaves E1 — enhanced derived category; EnhancedDerivedSheaves E0 — limits colimits universal properties.

### 3.4 The cyclotomic t-structure and TR

**The cyclotomic t-structure.** CycSp_T,p has an accessible left-complete t-structure whose connective objects have connective underlying spectra. It is compatible with the symmetric monoidal structure. The underlying-spectrum functor is right t-exact and conservative, but is not left t-exact. Its connective part is the lax equalizer of id and τ_{≥0}(−)^{tC_p} on connective T-spectra. Write π_i^cyc for its homotopy objects. Products of connective objects are connective. No compatibility with filtered colimits of the heart is asserted. TCart_p has the t-structure whose connective and coconnective parts are detected on underlying spectra; TR and the heart comparison below relate the two.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AN](#an), Theorem 2.1, Example 2.2 and the paragraph after Example 2.3, p. 8; Warning 2.9 and Lemma 2.10, p. 9; proof of Theorem 2.1 and Lemma 2.11, p. 10; Definition 3.14 and Proposition 3.15, pp. 22–23; Example 3.27, p. 28; Theorem 6.14, p. 60; [HA](#ha), Propositions 1.4.4.11(1), p. 160, and 1.2.1.19, pp. 45–46.)

The construction proceeds as follows. Construct the presentable connective lax equalizer of AN Lemma 2.10 and show that its inclusion is fully faithful and closed under extensions and colimits. For each object take the terminal object of the presentable connective slice; its universal mapping property constructs the connective truncation adjoint. This is the construction of Higher Algebra Proposition 1.4.4.11(1), p. 160, applied here, rather than an unprovided generic supplier theorem. Use AN Lemma 2.11 to commute finite-group Tate with products of uniformly bounded-below T-spectra. The connective part is product closed; left separatedness follows from the conservative forgetful functor, so Higher Algebra Proposition 1.2.1.19, pp. 45–46, applies after constructing countable products and proves left completeness. The sphere unit and tensor products are connective. Define the TCart t-structure and its truncations using the norm factorization as in AN Definition 3.14 and Proposition 3.15, before applying TR.

Provide the following operations and identities.

- `CyclotomicTStructure`: An accessible left-complete t-structure with connective part detected by the underlying spectrum.
- `CyclotomicTStructure.homotopy`: π_i^cyc(X) is a heart object, not the Eilenberg–Mac Lane spectrum of π_i of the underlying X.
- `CyclotomicTStructure.connective_products`: Products of connective cyclotomic objects stay connective, with the compatible norm/Tate diagram.
- `TopologicalCartierTStructure`: The underlying spectrum detects both halves of the TCart_p t-structure; its heart is Cart_p.
- `CyclotomicTStructure.forget_rightTExact`: The underlying functor to Sp^{BT} is right t-exact but not left t-exact: THH(F_p) lies in the heart while its underlying spectrum is unbounded above (AN p. 8).

**Checks.**

- `CyclotomicTStructure.thh_fp`: THH(ℤ/p) is in the cyclotomic heart, but its underlying π_2 is nonzero. This rejects the underlying-spectrum Postnikov tower as the cyclotomic tower.
- `CyclotomicTStructure.zero`: The zero object has all cyclotomic homotopy objects zero. Conversely a bounded-below X with π_i^cyc X=0 for every i is zero, by finite Postnikov induction and left separatedness; no such conclusion is asserted for unbounded X.
- `CyclotomicTStructure.truncation`: On the Cartier side, the heart has discrete underlying spectrum. Under the TR comparison cyclotomic π_i is the Cartier structure on π_iTR, rather than on π_iX.

Also establish For a perfect characteristic-p ring k, THH(k) lies in the cyclotomic heart despite its positive even underlying homotopy. Consequently underlying spectral truncation cannot define cyclotomic truncation. The heart is not closed under filtered colimits: the V=p, F=id Prüfer example has derived completion ℤ_p[1].

*Needs:* §3.1 (Circle-equivariant p-typical cyclotomic spectra); §3.2 (Topological Cartier modules); §2.4 (Tate constructions at C_p: convergence, vanishing and p-completeness); GeneralizedCohomology G3.8; EnhancedDerivedSheaves E5:abstract; EnhancedDerivedSheaves E5:presentability — presentable categories.

**TR as V-complete topological Cartier modules.** For X∈CycSp_T,p let TR^{n+1}(X) be the iterated pullback of X^{hC_{p^n}}, …, X^{hC_p}, X over (X^{tC_p})^{hC_{p^{n−1}}}, …, X^{tC_p}, using can and Frobenius. The restriction tower defines TR(X). It has a natural topological Cartier structure and is right adjoint to M↦M/V. On bounded-below objects the counit TR(X)/V→X is an equivalence, TR is fully faithful and t-exact, and its essential image consists exactly of V-complete bounded-below topological Cartier modules. For bounded-below M, TR(M/V)≃lim_n M/V^n is its V-completion. On genuine bounded-below models, TR agrees with §2.14 (TR and genuine TC), including R,F,V.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AN](#an), Remark 2.5, pp. 8–9; Proposition 3.17 and Construction 3.18, pp. 24–25; Lemma 3.19, p. 25; Theorem 3.21 and Proposition 3.22, p. 26.)

The construction proceeds as follows. Construct the TR norm factorization from the iterated pullback and its compatible projections (AN Construction 3.18). Prove the quotient adjunction by the mapping-fiber formula, Proposition 3.17. Apply the Tate orbit lemma to the TR^n restriction fibers and commute Tate with their uniformly bounded-below limit. This proves the counit for bounded-below X (Lemma 3.19). Identify TR(M/V) with lim_n M/V^n via the finite restriction fiber sequences; this gives completion and the essential image (Theorem 3.21, Proposition 3.22). Compare R,F,V with the genuine restriction pullbacks.

Also establish TR(X)/V recovers X for bounded-below X with its cyclotomic structure, not merely its underlying spectrum. The unbounded category is excluded from the essential-image and inverse-limit completion formulas.

*Needs:* §3.3 (Derived V-completeness); §3.4 (The cyclotomic t-structure); §2.17 (The restriction pullback for genuine fixed points); §2.14 (TR and genuine TC); AInfCohomology §AI.7.2 (`AInf.Trace.tateOrbit`); §2.15 (Genuine and naive cyclotomic spectra agree on bounded below objects); EnhancedDerivedSheaves E3 — kan extensions along functors.

**The derived V-complete Cartier heart.** TR identifies the heart of CycSp_T,p with the full subcategory of derived V-complete p-typical Cartier modules. For every bounded-below X and every integer i, the Cartier module corresponding to π_i^cycX is (π_iTR(X),F,V). A bounded-below topological Cartier module is V-complete iff every π_i is derived V-complete. The heart equivalence is an equivalence of abelian categories; it is not an identification of the underlying spectra of a heart object and its Cartier module. For every connective E₁-ring A with commutative π₀A, construct `TR.pi0_witt_connective`: π₀TR(A;p)≅W(π₀A) as Cartier modules, with the Witt Frobenius and Verschiebung. This extends the discrete comparison of §2.14 (Antieau–Nikolaus Theorem 6.1, p. 57).

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AN](#an), Introduction to §3, p. 15; Theorem 3.26, p. 28; Proposition 3.28, pp. 28–29; Theorem 1, p. 2, and the discussion after Theorem 2, p. 3; Theorem 6.14, p. 60.)

The construction proceeds as follows. Use t-exactness and full faithfulness of TR to embed the heart into discrete topological Cartier modules, identified with Cart_p. Apply the discrete completeness criterion and the essential-image theorem. For the degreewise completeness criterion, induct on finite Postnikov intervals and pass to the left-complete limit (AN Proposition 3.28). Take π_i of the t-exact TR functor to obtain the Cartier realization of cyclotomic homotopy. Right t-exactness of THH and the cyclotomic long exact sequence identify π₀^cycTHH(A) with π₀^cycTHH(π₀A); the discrete Witt comparison of §2.14 then gives `TR.pi0_witt_connective` (AN Theorem 6.1).

Also establish For a perfect F_p-algebra k, the Cartier realization of THH(k) is W(k) with its F,V (AN Theorem 6.14); higher underlying homotopy of THH(k) remains visible after forgetting the heart embedding.

*Needs:* §3.4 (TR as V-complete topological Cartier modules); §3.3 (Derived V-completeness); §3.4 (The cyclotomic t-structure); §2.14 (TR and genuine TC); §2.7 (THH of an E₁-ring); `WittVector`.

### 3.5 Detecting quasi-isogenies and null Frobenius

**TR detects cyclotomic quasi-isogenies.** For a map f:X→Y of bounded-below objects in CycSp_T,p, the following are equivalent: each π_i^cyc(f) is an isogeny in the heart; each bounded-above truncation τ_{≤n}^cyc(f) is an isogeny; and TR(f) is a quasi-isogeny of spectra. Isogeny denominators may depend on i or n. For a p-completed application, apply the statement in the p-complete setting with its preserved bounded-below hypotheses. TC_T,p followed by p-completion preserves these quasi-isogenies. Underlying spectral rational equivalence alone does not suffice.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AMMN](#ammn), Definition 2.18 and following paragraph, p. 12; Proposition 3.1 and introductory paragraph of §3.1, p. 15; [AN](#an), Remark 2.5, pp. 8–9; Warning 2.6, p. 9.)

The construction proceeds as follows. Use the heart equivalence to identify π_i^cyc(f) with π_iTR(f) carrying F,V. For each degree apply the Cartier approximate-inverse correction: multiplying g by its isogeny denominator makes both operator defects vanish. No uniform bound across all degrees is required. Left-complete truncation and finite extension arguments identify the homotopy-object and Postnikov definitions. After p-completion TC_T,p(X) identifies with fib(1−F:TR(X)→TR(X)) by AN Remark 2.5. Fibers preserve degreewise isogenies: a bound in each of two adjacent degrees suffices. On bounded-below spectra derived p-completion preserves degreewise quasi-isogenies, by finite Postnikov windows. This proves the TC assertion without a false lower connectivity bound for uncompleted circle-equivariant TC.

Also establish THH(F_p) has underlying spectrum quasi-isogenous to zero but is not quasi-isogenous to zero in the cyclotomic category: TC(F_p;ℤ_p) has π_0=π_−1=ℤ_p. Degreewise denominators are permitted; a single annihilator for all homotopy groups is not required.

*Needs:* §3.4 (The derived V-complete Cartier heart); §3.2 (Classical p-typical Cartier modules); §2.10 (Topological cyclic homology); §3.1 (Circle-equivariant p-typical cyclotomic spectra).

**TR with a null cyclotomic Frobenius.** If X∈CycSp_T,p is bounded below and a T-equivariant nullhomotopy of its Frobenius X→X^{tC_p} is given, the TR pullback tower splits to give TR(X)≃∏_{n≥0}X_{hC_{p^n}}, where C_{p^0} is trivial. If the underlying X is quasi-isogenous to zero, then X is quasi-isogenous to zero in CycSp_T,p. The product uses homotopy orbits, not homotopy fixed points. Nullhomotopy after forgetting T is not the stated hypothesis.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AMMN](#ammn), Proposition 3.2 and proof, p. 15; [AN](#an), Remark 2.5, pp. 8–9; Construction 3.18, pp. 24–25.)

The construction proceeds as follows. The specified equivariant nullhomotopy splits the iterated TR pullbacks. For bounded-below X the canonical map X^{hC_{p^n}}→(X^{tC_p})^{hC_{p^{n−1}}} is the map to X^{tC_{p^n}} (NS Corollary II.4.7, cited by AMMN), so each new factor is the homotopy-orbit fiber X_{hC_{p^n}} of the norm sequence. For a fixed homotopy degree j, bounded-below X permits a finite Postnikov range to compute π_j of every X_{hC_{p^n}}. The same annihilator for that range works for all n, since homotopy orbits preserve an annihilation map. This uniformity makes the product quasi-isogenous to zero. Apply TR detection; do not infer the claim merely by commuting rationalization with an infinite product.

Also establish A bounded-below spectrum with a single annihilation map has a uniform annihilator on all the product factors. Without a null Frobenius THH(F_p) is the counterexample, so spectral p-torsion cannot replace the equivariant nullhomotopy.

*Needs:* §3.4 (TR as V-complete topological Cartier modules); §3.5 (TR detects cyclotomic quasi-isogenies); §2.1 (Homotopy orbits and homotopy fixed points); AInfCohomology §AI.7.2 (`AInf.Trace.completedTateComparison`).

### 3.6 Positive weights and connective convergence

**Positively graded cyclotomic spectra.** A nonnegatively graded p-typical cyclotomic spectrum is a family of T-spectra (X_i)_{i≥0} with equivariant maps φ_i:X_i→(X_{pi})^{tC_p}. Morphisms and their homotopies intertwine these maps. The category is the coherent lax equalizer for the endofunctor (X_i)↦((X_{pi})^{tC_p}). Its underlying cyclotomic spectrum is ⊕_i X_i, using the canonical comparison from the sum of Tate terms to the Tate of the sum. Truncation X_{≤n} sets weights >n to zero and retains the induced Frobenius. For i>0, the fiber of X_{≤i}→X_{≤i−1} has null Frobenius because pi>i. The weight-zero fiber has no such conclusion.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AMMN](#ammn), §3.1, pp. 15–16, the definition before Proposition 3.3 and the truncations in its proof, p. 16; Appendix A, Corollary A.9 and Example A.10, p. 58, and Example A.16, p. 60.)

The construction proceeds as follows. Form Fun(ℕ_discrete,Sp) with graded tensor whose degree is the sum of input weights; encode the p-fold tensor-power diagonal by φ_i landing at weight pi. AMMN §3.1, p. 15 describe the Day convolution as using the multiplication on ℤ_{≥0}; the sum of weights is the structure that makes the Frobenius land in weight pi. Form the lax equalizer for its Frobenius endofunctor, then the underlying direct-sum functor with its canonical Tate comparison; equivalence of that comparison is unnecessary. The truncation maps are compatible because p increases positive weights. On a single positive-weight fiber the target pi is absent, giving the nullhomotopy.

Provide the following operations and identities.

- `GradedCyclotomicSpectrum`: A family with φ_i:X_i→(X_pi)^{tC_p} and coherent morphisms.
- `GradedCyclotomicSpectrum.toCyclotomic`: Sum the weights and assemble Frobenius via the canonical map into Tate of the sum.
- `GradedCyclotomicSpectrum.truncate`: Kill weights >n, producing a compatible inverse tower of cyclotomic objects.
- `GradedCyclotomicSpectrum.positive_fiber`: At i>0 the i-th truncation fiber has its specified null Frobenius, as pi>i.

**Checks.**

- `GradedCyclotomicSpectrum.weight_zero`: An arbitrary cyclotomic X placed in degree zero retains its original Frobenius. In particular THH(F_p) at weight zero is not forced to be cyclotomically torsion.
- `GradedCyclotomicSpectrum.positive_single`: A T-spectrum placed in weight 1 with all other weights zero has zero Frobenius, since its p-th weight is zero.
- `GradedCyclotomicSpectrum.zero`: The zero graded family has zero sum and every truncation zero.
- `GradedCyclotomicSpectrum.square_zero_weights`: In THH(A⊕M) for a split square-zero graded E₁-algebra with M in positive weight, the Frobenius sends weight i to pi. This agrees with the p-fold subdivision construction, not a weight-preserving map.

Also establish A Frobenius preserving each positive weight is a different structure and gives the wrong graded THH reduction.

*Needs:* §3.1 (Circle-equivariant p-typical cyclotomic spectra); §2.9 (Lax equalizers of ∞-categories); EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category.

**Graded cyclotomic torsion and connective convergence.** Let X be a nonnegatively graded cyclotomic spectrum. Suppose X_0=0, the connectivity of X_i tends to infinity as i→∞, and ⊕_iX_i is quasi-isogenous to zero as a spectrum. Then ⊕_iX_i is quasi-isogenous to zero in CycSp_T,p. In this situation, for every j the maps π_jTR(X)→π_jTR(X_{≤n}) are isomorphisms for all sufficiently large n. More generally a tower of bounded-below cyclotomic objects with fibers of X→X_n becoming arbitrarily connective has this TR convergence. No assertion of strong convergence for arbitrary unbounded filtrations is included.

Throughout this statement, Fix a prime p. Spectra, functor categories and all limits are coherent infinity-categorical objects.

([AMMN](#ammn), Proposition 3.3 and its proof, p. 16; Proposition 3.5, pp. 16–17; [AN](#an), Theorem 3.21, p. 26; Lemma 2.11, p. 10.)

The construction proceeds as follows. Use the increasing connectivity to identify X with the inverse limit of finite weight truncations. The error fibers become arbitrarily connective in the cyclotomic t-structure. The truncation has (X_{≤i})_j=X_j for j≤i and zero above; the proof of AMMN Proposition 3.3 prints X_i. TR is t-exact on bounded-below objects and preserves limits as a right adjoint. Consequently π_jTR stabilizes in the finite truncations, using the same connectivity estimates. Each positive-weight fiber is spectrally quasi-isogenous to zero and has null Frobenius. Apply the null-Frobenius theorem inductively to the finite tower; then stabilize in each degree and use TR detection.

Also establish The zero weight hypothesis is essential: THH(F_p) placed in weight zero violates the conclusion. The proof proves stabilization separately for each homotopy degree and never exchanges an arbitrary infinite product with rationalization.

*Needs:* §3.6 (Positively graded cyclotomic spectra); §3.5 (TR with a null cyclotomic Frobenius); §3.4 (The cyclotomic t-structure); §3.4 (TR as V-complete topological Cartier modules).

### Examples

For M=(Fₚ)² put F(x,y)=(x,0) and V(x,y)=(0,x). Then FV=0=p·id, but VF(1,0)=(0,1)≠0, including at p=2. The Cartier relation therefore does not imply VF=p. On Z, F=p and V=1 give a Cartier structure whose derived V-completion is zero: every cofiber of Vⁿ is zero. Its p-completion is Zₚ, so p-completion cannot replace V-completion. In contrast F=1,V=p on Z has derived V-completion Zₚ.

For the Prüfer group Qₚ/Zₚ with F=1,V=p, every Vⁿ is surjective but has kernel Z/pⁿ. The derived cofibers are (Z/pⁿ)[1], and their limit is Zₚ[1], although the ordinary quotients vanish. This detects the missing derived kernel. If a Cartier map f has additive inverse g up to the positive denominator n, the operator defects Fg−gF and Vg−gV land in ker(f), and n kills that kernel. Replacing g by ng makes both defects vanish, with denominator n². The same calculation works for each operator; changing the V defect to an expression involving only F would miss the second requirement.

### Dependencies

Earlier layers 2. Use the named Mathlib and Tau Ceti inputs under the supplier contracts; external contracts: EnhancedDerivedSheaves E0; EnhancedDerivedSheaves E1; EnhancedDerivedSheaves E3; EnhancedDerivedSheaves E5:abstract; EnhancedDerivedSheaves E5:presentability; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5. The individual statements above identify the required comparison or functoriality, not merely a shared object name.

## Layer 4: Continuous motives and the cyclotomic trace

First construct continuous extensions and relative motives, then use their small finitary restriction to construct the trace. Connective and nonconnective K-theory of small stable infinity categories are constructed in §4.9 before the trace. The derivative comparison is followed by the precise convergence hypotheses needed for nilpotent invariance, and nilpotent invariance by henselian rigidity with finite coefficients.

### 4.1 Dualizable presentable categories

**Relative dualizable presentable stable categories.** Extend the supplied absolute dualizable-category interface of EnhancedDerivedSheaves E5:presentability.4 to rigid-base modules and their strongly continuous E-linear maps. For rigid E₁-monoidal E, Catdual_E is the category of left E-modules in the supplied Catdual_st, with strongly continuous action and morphisms; its objects are dualizable in the relative module sense. No monoidal structure on the category of left modules over a merely E₁ base is presumed. Morphisms are E-linear colimit-preserving functors whose right adjoints preserve colimits (strongly continuous functors). For E=Sp this is Catdual_st. Relative dualizability means the evaluation and coevaluation specified below with coherent module-duality identities; it does not mean every object of C is dualizable or C is compactly generated.

([E-mot](#e-mot), §1.5, pp. 18–20.)

The construction proceeds as follows. Form left and right E-module categories in PrL_st and their right–left balanced tensor using the imported coherent category interface. Equip an absolute dualizable C with its strongly continuous left E-action, and construct its relative right-module dual and the unbalanced evaluation C⊗C∨→E. The balanced coevaluation has source Sp. Verify the two module-duality triangles as in Efimov §1.5; only after imposing symmetry on E form the symmetric monoidal category with tensor over E.

Provide the following operations and identities.

- `DualizableCategories.ofInd`: For small idempotent-complete stable A, Ind(A) is an object of Catdual_st (E=Sp). An E-linear version additionally requires the compatible E-action supplied by the rigid-base module interface.
- `DualizableCategories.dual`: Return the relative dual C∨, a right E-module, with E–E-linear evaluation C⊗C∨→E and coevaluation Sp→C∨⊗_E C, satisfying coherent module-duality triangles. For symmetric monoidal E also give the induced E-linear evaluation C∨⊗_E C→E and coevaluation E→C⊗_E C∨ in the symmetric module category.
- `DualizableCategories.hom`: Morphisms C → D are E-linear left adjoints with colimit-preserving right adjoint.
- `DualizableCategories.tensor`: For symmetric monoidal rigid E, tensor over E and its unit give Catdual_E a symmetric monoidal structure.

**Checks.**

- `DualizableCategories.indPerf`: For A=Perf(R), the supplied spectrum-module comparison identifies Ind(A) with Mod_R.
- `DualizableCategories.zero`: The zero presentable stable category is dualizable, with zero evaluation and coevaluation.
- `DualizableCategories.rightAdjointRequired`: For a field k and V=⊕_{i∈N}k, the colimit-preserving endofunctor V⊗_k− of D(k) has right adjoint Hom_k(V,−)=∏_{i∈N}(−). This right adjoint does not preserve ⊕_{j∈N}k: the identity matrix belongs to ∏_i⊕_j k but not to the image of ⊕_j∏_i k. Thus this functor is excluded from Catdual_st, although both source and target are dualizable.

Also establish Ind(A) is dualizable for small idempotent-complete stable A. A colimit-preserving functor with non-colimit-preserving right adjoint is excluded.

*Needs:* EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category; EnhancedDerivedSheaves E5:presentability — presentable categories; EnhancedDerivedSheaves E5:presentability.

### 4.2 Trace-class morphisms and their preduals

**Ordered trace-class morphisms and the symmetric comparison.** Extend EnhancedDerivedSheaves E5:presentability.4’s supplied symmetric trace-class predicate to the ordered E₁ setting, and compare its classifier and predual operations with the supplied predicate. In a presentable symmetric monoidal stable C, with tensor preserving colimits separately, write X∨=internal Hom(X,1), without assuming X dualizable. A map f:X → Y is trace-class when there is η:1 → X∨⊗Y such that f equals X≃X⊗1 → X⊗X∨⊗Y → Y by evaluation. The E₁ variant uses distinct left/right preduals and the corresponding tensor orders.

([MW](#mw), Definition 2.1 and Lemma 2.2, pp. 11–12.)

The construction proceeds as follows. Construct internal Hom as the right adjoint of tensor. Evaluate the classifier to a map X → Y, and impose equality in the mapping space. Use left/right internal Homs for the noncommutative enriched duality theorem.

Provide the following operations and identities.

- `TraceClass.ofClassifier`: An η:1 → X∨⊗Y gives a trace-class map by the evaluation formula.
- `TraceClass.iff_factorization`: Trace-class means that the adjoint of f:1 → Hom(X,Y) factors through X∨⊗Y.
- `TraceClass.map`: A symmetric monoidal functor takes a trace-class f to a trace-class map through F(X∨) → F(X)∨. Supplied by §4.2 (Functoriality and preduals of trace-class maps).
- `TraceClass.predual`: If f:X → Y is trace-class then Y∨ → X∨ is trace-class; for such transitions the comparison F(Y)∨ → F(X∨) supplies the diagonal needed for ind-predual colimits. Supplied by §4.2 (Functoriality and preduals of trace-class maps).
- `TraceClass.comp`: Precomposition and postcomposition preserve trace-class maps: transport the classifier by the predual map on the source and the ordinary map on the target.
- `TraceClass.tensor`: The tensor of two trace-class maps is trace-class, classified by the tensor of their classifiers and the canonical predual comparison.
- `TraceClass.identity_iff_dualizable`: The identity on X is trace-class exactly when X is dualizable; the classifier of the identity supplies coevaluation.

**Checks.**

- `TraceClass.unitIdentity`: The identity on the tensor unit is trace-class, classified by its unit constraints.
- `TraceClass.zeroMap`: The zero X → Y is trace-class, classified by the zero map 1 → X∨⊗Y.
- `TraceClass.infiniteVectorSpace`: The identity on the countably infinite direct-sum k-vector space in D(k) is not trace-class, whereas every finite-rank degree-zero map is.

Also establish Identity is trace-class exactly for dualizable objects. In D(k), maps between degree-zero vector spaces are trace-class exactly when finite rank.

*Needs:* EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category; EnhancedDerivedSheaves E5:presentability — presentable categories; EnhancedDerivedSheaves E5:presentability.

**Functoriality and preduals of trace-class maps.** Let F:C → D be symmetric monoidal between presentable symmetric monoidal categories. There is a natural comparison F(X∨) → F(X)∨. A trace-class f:X → Y has trace-class predual Y∨ → X∨ and trace-class image F(f). For its chosen classifier, the naturality square on preduals has a diagonal F(Y)∨ → F(X∨) whose two triangles commute. This diagonal gives the predual comparison needed on trace-class ind-systems; it does not assert that F preserves arbitrary internal Homs.

([MW](#mw), Lemma 2.2(a)–(c) and proof, pp. 11–12.)

The construction proceeds as follows. Construct the comparison by applying F to evaluation and taking its adjoint. Apply F to the classifier and compose with that comparison; dualize the classifier for the predual map. Tensor the image classifier with F(Y)∨ and evaluate F(Y); the resulting diagonal satisfies both triangle identities.

Also establish For C=D(k), F=id and f:k²→k² the projection diag(1,0), the classifier is e₁∨⊗e₁ and its predual is the same projection on (k²)∨. The induced diagonal is that finite-rank map. For f=0 the classifier and diagonal are zero; neither case asserts a duality comparison for every nondualizable object.

*Needs:* §4.2 (Ordered trace-class morphisms and the symmetric comparison); EnhancedDerivedSheaves E5:presentability.

### 4.3 Rigid categories and nuclear objects

**E₁ rigidity extending the supplied symmetric notion.** Extend EnhancedDerivedSheaves E5:presentability.4’s symmetric rigidity interface to the ordered left/right E₁ case. A presentable stable E₁-monoidal E is rigid when the unit is compact and multiplication μ:E⊗E → E is strongly continuous with E–E-bilinear right adjoint. Equivalently its unit is compact and it is generated under colimits by sequential colimits of maps that are both left and right trace-class. In the symmetric monoidal case the two trace-class conditions coincide. The equivalence is a theorem of Efimov Proposition 1.1; compact generation is not an extra defining hypothesis.

([E-mot](#e-mot), §1.2 and Proposition 1.1, pp. 15–16.)

The construction proceeds as follows. Use the monoidal multiplication adjunction to define rigidity. Apply the trace-class sequential-generation criterion of Efimov Proposition 1.1. For compactly generated E identify it with Ind of a small rigid monoidal category; do not extend that presentation to all rigid E.

Provide the following operations and identities.

- `RigidCategory.multiplicationRightAdjoint`: Return μ^R preserving colimits and compatible with the left and right E actions.
- `RigidCategory.unitCompact`: The tensor unit is compact.
- `RigidCategory.iff_traceClassGenerators`: Rigidity is equivalent to compact unit and generation by sequential systems whose maps are both left and right trace-class. Supplied by §4.3 (Trace-class generation criterion for rigidity).
- `RigidCategory.compact_iff_dualizable`: For a rigid E, an object is compact exactly when it is left and right dualizable; this does not make all objects compact.

**Checks.**

- `RigidCategory.spectra`: Sp is rigid and its compact objects are finite spectra.
- `RigidCategory.indRigid`: Ind(A) is rigid when small stable idempotent-complete monoidal A has every object dualizable.
- `RigidCategory.unitNotCompact`: In C=∏_{i∈ℕ}D(k) with pointwise tensor product, put e_i=k in coordinate i and zero elsewhere. Then ⊕_i e_i is the unit (k)_i, but ⊕_i Map(1,e_i)→Map(1,⊕_i e_i) induces ⊕_i k→∏_i k on π₀ and misses the all-ones element. The unit is not compact, so C fails the definition.

Also establish Sp is rigid with compact sphere unit. A rigid category can fail to be compactly generated.

*Needs:* §4.1 (Relative dualizable presentable stable categories); §4.2 (Ordered trace-class morphisms and the symmetric comparison); EnhancedDerivedSheaves E5:presentability — compact objects.

**Nuclear objects.** For compactly generated presentable symmetric monoidal stable C with compact unit, X is nuclear if every map P → X from compact P is trace-class. X is basic nuclear if it has a sequential presentation X≃colim_n X_n with all transitions trace-class. The full subcategory Nuc(C) is stable and closed under colimits and tensor; its ω₁-compact objects are precisely the basic nuclear objects.

([MW](#mw), Definition 2.3, Theorem 2.4 and Remark 2.5, p. 12.)

The construction proceeds as follows. Define the test over all compact P using the mapping spaces. Define sequential basic nuclear presentations and apply MW Theorem 2.4. For a large C use κ-compact factorization of trace-class maps before taking the Indω₁ envelope of the essentially small basic nuclear category.

Provide the following operations and identities.

- `NuclearObject.ofBasic`: A sequential trace-class presentation gives a nuclear object.
- `NuclearObject.mapFromCompact`: Every map P → X from compact P has a trace-class classifier.
- `NuclearObject.colimit`: Nuclear objects are stable and closed under arbitrary colimits and tensor products. Supplied by §4.3 (Closure and generation of nuclear objects).
- `NuclearObject.map`: Symmetric monoidal colimit-preserving F preserves basic nuclear objects and hence nuclear objects under the source’s generation hypotheses. Supplied by §4.3 (Closure and generation of nuclear objects).

**Checks.**

- `NuclearObject.zero`: The zero object is basic nuclear via the constant zero system.
- `NuclearObject.finiteDimensional`: In D(k), a finite-dimensional degree-zero vector space is basic nuclear via its constant identity system.
- `NuclearObject.countableVsUncountable`: In D(k), a countably generated degree-zero vector space is basic nuclear, while an uncountable-dimensional degree-zero space is nuclear but not ω₁-compact and hence not basic nuclear.

Also establish In Ind(Perf(k)), every object is nuclear but the basic nuclear size bound is countable. Testing only maps from the tensor unit is insufficient unless a generator theorem is supplied.

*Needs:* §4.2 (Ordered trace-class morphisms and the symmetric comparison); EnhancedDerivedSheaves E5:presentability — compact objects; EnhancedDerivedSheaves E5:presentability — ind completion.

**Trace-class generation criterion for rigidity.** For a presentable stable E₁-monoidal category E, rigidity is equivalent to compactness of its unit together with generation under colimits by sequential colimits whose transitions are both left and right trace-class. In the symmetric monoidal case the two trace-class conditions coincide. Compactness of the unit is a separate hypothesis in both directions.

([E-mot](#e-mot), §1.2 and Proposition 1.1, pp. 15–16.)

The construction proceeds as follows. Use the left and right trace-class classifier definitions in Efimov §1.2. Apply Proposition 1.1 with both its compact-unit and sequential-generation hypotheses; retain left/right order in the E₁ case.

Also establish In Sp the sphere identity is trace-class, every finite spectrum is dualizable, and the spheres generate under colimits, so the criterion gives rigidity. In D(k), the infinite direct-sum identity is not trace-class, but the sum is generated by the finite-rank inclusions of its finite partial sums. A noncompact unit fails the separate unit hypothesis.

*Needs:* §4.3 (E₁ rigidity extending the supplied symmetric notion); §4.2 (Ordered trace-class morphisms and the symmetric comparison); EnhancedDerivedSheaves E5:presentability.

**Closure and generation of nuclear objects.** Let C be compactly generated presentable stable symmetric monoidal with compact unit. Nuc(C) is stable and closed under all colimits and tensor products; it is ω₁-compactly generated and its ω₁-compact objects are exactly the basic nuclear objects. A symmetric monoidal colimit-preserving functor preserves basic nuclear objects and nuclear objects as in MW Theorem 2.4(c). For the size-controlled nuclear ind-envelope, a sufficiently large regular κ bounds trace-class factorizations and makes basic nuclear systems essentially small.

([MW](#mw), Theorem 2.4 and Remark 2.5, p. 12.)

The construction proceeds as follows. Use MW Theorem 2.4(a),(b) for the stable tensor closure and ω₁-generation. Preserve sequential classifiers by trace-class functoriality and extend over the nuclear colimit envelope. Apply Remark 2.5’s κ-compact factorization to construct the essentially small basic ind-object category before its Indω₁ envelope.

Also establish In D(k), every map from a perfect complex is trace-class; thus finite complexes and their arbitrary coproducts are nuclear. The countable sum of copies of k has a basic presentation by finite partial sums with trace-class transitions. Its identity is still not trace-class: nuclearity does not mean dualizability.

*Needs:* §4.3 (Nuclear objects); §4.2 (Functoriality and preduals of trace-class maps); EnhancedDerivedSheaves E5:presentability — compact objects; EnhancedDerivedSheaves E5:presentability — ind completion.

### 4.4 Continuous Calkin categories and accessible invariants

**The continuous Calkin category.** For dualizable presentable stable C and an uncountable regular cardinal κ, the strongly continuous fully faithful left adjoint Yoneda functor Ŷ:C → Ind(C^κ) has quotient equivalent to ker(colim:Ind(C^κ) → C). Define Calkcont_κ(C) as the compact objects of that quotient. It is small stable idempotent-complete and gives an exact sequence 0 → C → Ind(C^κ) → Ind(Calkcont_κ(C)) → 0 in Catdual_st. Functoriality is for strongly continuous functors.

([E-cont](#e-cont), Definition 2.58, pp. 50–51; Propositions 2.59 and 2.61, p. 51.)

The construction proceeds as follows. Use ω₁-presentability and the left adjoint Yoneda embedding of a dualizable category (Efimov §2). Construct the stable accessible quotient; identify it with the kernel of colim. Take compact objects and induced quotient maps. For compactly generated C compare with (Ind(C^ω)^κ/C^ω)^Kar.

Provide the following operations and identities.

- `ContinuousCalkin.quotient`: The canonical functor Ind(C^κ) → Ind(Calkcont_κ(C)) has kernel Ŷ(C).
- `ContinuousCalkin.map`: Strongly continuous C → D induces an exact Calkcont_κ(C) → Calkcont_κ(D), with coherent identity and composition laws.
- `ContinuousCalkin.compactlyGenerated`: If C=Ind(A), Calkcont_κ(C) ≃ (Ind(A)^κ/A)^Kar.
- `ContinuousCalkin.exactSequence`: The defining sequence is exact in Catdual_st and is functorial in C.

**Checks.**

- `ContinuousCalkin.zero`: Calkcont_κ(0) is the zero small stable category.
- `ContinuousCalkin.perfRing`: For C=Mod_R, Calkcont_κ(C) is the idempotent completion of (Mod_R)^κ/Perf(R).
- `ContinuousCalkin.swindle`: For compactly generated C, the exact sequence C^ω → C^ω₁ → Calkcont_ω₁(C) produces the loop equivalence after an accessible localizing invariant; C^ω₁ has vanishing invariant by the countable swindle.

Also establish For compactly generated C it agrees with the classical κ-Calkin of C^ω. For a general C it is not defined as the naive quotient C^κ/C^ω.

*Needs:* §4.1 (Relative dualizable presentable stable categories); EnhancedDerivedSheaves E5:presentability — ind completion; EnhancedDerivedSheaves E5:presentability.

**Accessible localizing invariants.** This is the accessible, cardinal-continuous specialization of the exact-sequence-preserving invariant used below. An accessible localizing invariant F:Catperf → T, with T accessible stable, sends the zero category to zero and exact sequences A → B → C (fully faithful first map and idempotent-complete Verdier quotient C) to fiber/cofiber sequences, and commutes with κ-filtered colimits for a specified regular κ. The relative Catdual_E version uses exact sequences and strongly continuous E-linear maps. A finitary invariant has κ=ω.

([E-mot](#e-mot), §1.6 and Definition 1.2, pp. 20–21.)

The construction proceeds as follows. Use the enhanced exact sequence and idempotent completion supplied by E5. Specify accessibility and the actual κ-filtered colimits admitted by T. Distinguish the functor’s construction from its localizing property: concrete nonconnective K-theory on small stable ∞-categories is constructed in §4.9 and compared there with the ring and model constructions of GeneralAlgebraicKTheory.

Provide the following operations and identities.

- `AccessibleLocalizingInvariant.exactSequence`: F(A) → F(B) → F(C) is a cofiber sequence for each exact sequence.
- `AccessibleLocalizingInvariant.map`: Exact functors give maps in T with coherent identity and composition.
- `AccessibleLocalizingInvariant.filteredColimit`: F commutes with the specified κ-filtered colimits.
- `AccessibleLocalizingInvariant.ofKTheory`: The concrete nonconnective K-theory functor of §4.9 satisfies this interface; the universal property is a property, not its definition.

**Checks.**

- `AccessibleLocalizingInvariant.zero`: F(0) ≃ 0.
- `AccessibleLocalizingInvariant.split`: F(A⊕B) ≃ F(A)⊕F(B) with the two inclusions and projections.
- `AccessibleLocalizingInvariant.connectiveKNotEnough`: Let k be a field and R=k[x,y]/(xy(1−x−y)). Then K_{−1}(R)=Z ([WeiK](#weik), III, Example 4.3.1, p. 31). For A=Perf(R), the suspension exact sequence A→FκA→ΣκA has K₀(FκA)=0 by the countable-sum swindle and K₀(ΣκA)=K_{−1}(R)=Z. Hence connective K cannot give a fiber sequence: its long exact sequence would require 0→Z to be surjective. Here Fκ and Σκ are the cone and idempotent-completed suspension categories of [BGT](#bgt), Definition 9.1 and Lemma 9.4, p. 57, and Definition 9.6, p. 58; their general stable-category K construction is supplied by §4.9 (Connective K-theory of small stable ∞-categories; Nonconnective K-theory by the suspension construction).

Also establish A split exact sequence yields a direct sum in T. An additive invariant that is not exact-localizing does not satisfy this definition.

*Needs:* EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E5:presentability — ind completion; §4.1 (Relative dualizable presentable stable categories).

### 4.5 Continuous extension and its uniqueness

**Continuous extensions of localizing invariants.** For accessible localizing F:Catperf → T define Fcont(C)=Ω F(Calkcont_ω₁(C)) on Catdual_st. It is accessible localizing, commutes with the same κ-filtered colimits as F, and Fcont(Ind(A))≃F(A). Kcont denotes this construction applied to the concrete nonconnective K-theory functor. This extends a supplied functor rather than postulating a new universal K spectrum.

([E-cont](#e-cont), Definition 8.5 and Propositions 8.6–8.8, pp. 105–106; Theorem 8.10, pp. 106–107.)

The construction proceeds as follows. Apply F to the functorial Calkin exact sequence. Use exactness of Calkcont, the countable Eilenberg swindle on C^ω₁ in the compactly generated case, and Proposition 8.8 for κ-filtered colimits. Construct the comparison for Ind(A) and the resulting unique extension.

Provide the following operations and identities.

- `ContinuousExtension.obj`: Fcont(C) is ΩF(Calkcont_ω₁(C)).
- `ContinuousExtension.map`: Strongly continuous C → D induces Fcont(C) → Fcont(D).
- `ContinuousExtension.ofInd`: Fcont(Ind(A)) ≃ F(A) naturally in small idempotent-complete stable A.
- `ContinuousExtension.exact`: Fcont takes exact sequences in Catdual_st to cofiber sequences and preserves the specified κ-filtered colimits.

**Checks.**

- `ContinuousExtension.zero`: Fcont(0)≃0.
- `ContinuousExtension.moduleK`: Kcont(Mod_R)≃the supplied K(Perf(R)) with its scalar-extension map.
- `ContinuousExtension.semiorthogonal`: For a strongly continuous semiorthogonal decomposition C=⟨C₁,C₂⟩, Fcont(C)≃Fcont(C₁)⊕Fcont(C₂).

Also establish For Mod_R, Kcont(Mod_R)≃K(Perf(R)). Morphisms use strong continuity; bare continuous functors are outside the asserted functoriality.

*Needs:* §4.4 (Accessible localizing invariants); §4.4 (The continuous Calkin category); GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6 — nonconnective spectrum and derived invariance.

**Uniqueness of continuous extension.** For regular κ and accessible stable T admitting κ-filtered colimits, precomposition with Ind gives an equivalence between accessible κ-finitary localizing functors Catdual_st → T and Catperf → T. Its inverse is F ↦ Fcont. The relative E-linear version has the analogous statement for relatively compactly generated E-modules and dualizable E-modules with strong-continuity morphisms.

([E-cont](#e-cont), Theorem 8.10, pp. 106–107; relative version in Efimov rigidity §1.6, pp. 20–21.)

The construction proceeds as follows. The Calkin exact sequence expresses every dualizable C using an Ind-category and its continuous Calkin. Both any G and the continuous extension of G∘Ind recover Ω applied to the Calkin term; the middle term vanishes by the swindle. Use Proposition 8.8 for the κ-finitary restriction and Efimov rigidity §1.6 for the relative version.

Also establish The equivalence is between categories of functors and natural transformations, not only objectwise equalities.

*Needs:* §4.5 (Continuous extensions of localizing invariants); §4.1 (Relative dualizable presentable stable categories).

### 4.6 Relative localizing motives

**The category of relative localizing motives.** For rigid E₁-monoidal E and regular κ, construct accessible stable Motloc_(E,κ) with κ-filtered colimits and Uloc,κ:Catdual_E → Motloc_(E,κ) such that precomposition identifies exact κ-continuous functors out of Motloc_(E,κ) with accessible κ-finitary localizing invariants. Use the small relatively compactly generated model, stabilized spectral presheaves, and localization at zero, Morita, exact-sequence and κ-colimit relations, then continuous extension. For symmetric monoidal E, tensor of E-modules descends to the finitary Motloc_E (κ=ω); for E₂ it supplies the E₁ structure used in the rigidity theorem.

([E-mot](#e-mot), Definition 1.2 and §1.6, pp. 20–21; [BGT](#bgt), Proposition 8.6 and Theorem 8.7, pp. 54–56; Theorem 9.8, p. 58.)

The construction proceeds as follows. Choose a universe-small generating category at an explicit accessibility cardinal, and form spectral presheaves. Impose the localization relations; tensor preserves those relations in each argument, so its Day-type product descends. Compare with the small stable-category construction of BGT and extend from relatively compactly generated E-modules using continuous invariants. The relative multiplicative construction is the monoidal localization construction with the universal property specified here.

Provide the following operations and identities.

- `LocalizingMotives.universal`: Uloc sends an E-linear category to its motive and an exact sequence to a cofiber sequence.
- `LocalizingMotives.lift`: Every κ-finitary localizing invariant has an exact κ-continuous factor uniquely up to contractible choice.
- `LocalizingMotives.tensor`: For symmetric monoidal rigid E, Uloc(C⊗_E D)≃Uloc(C)⊗Uloc(D) with coherent associativity, units and symmetry.
- `LocalizingMotives.concreteK`: Map(Uloc(E),Uloc(C))≃Kcont(C) in the source’s finitary setting.

**Checks.**

- `LocalizingMotives.zero`: Uloc(0)≃0.
- `LocalizingMotives.baseSpectra`: For E=Sp, its compactly generated restriction and universal property agree with BGT Motloc.
- `LocalizingMotives.split`: Uloc(C⊕D)≃Uloc(C)⊕Uloc(D), compatibly with the inclusion maps.

Also establish Motloc_Sp agrees with BGT’s localizing motives through the universal functor equivalence. The unit motive corepresents the concrete nonconnective K-theory of §4.9 (Nonconnective K-theory by the suspension construction), not a new axiom-defined K functor.

*Needs:* §4.4 (Accessible localizing invariants); §4.5 (Uniqueness of continuous extension); §4.3 (E₁ rigidity extending the supplied symmetric notion); EnhancedDerivedSheaves E5:presentability; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6 — nonconnective spectrum and derived invariance.

### 4.7 Relative nuclearity and the length-one resolution

**Nuclear E-modules.** For rigid E₁-monoidal E, a strongly continuous E-linear morphism C → D of dualizable left E-modules is right trace-class over E if represented by a compact object of Homdual_E(C,E)⊗_E D under the canonical functor to FunLL_E(C,D). A relatively compactly generated C is nuclear over E if every compact morphism from an ω₁-compact relatively compactly generated D to C is right trace-class over E; basic nuclear means a sequential colimit of these right trace-class maps. The trace-class definition has dualizable-module generality; the nuclear subcategory here has relatively compactly generated objects. This categorical notion is distinct from nuclear objects in a monoidal category.

([E-mot](#e-mot), Definition 3.2, pp. 29–30; Proposition 3.6, p. 32.)

The construction proceeds as follows. Use the dualizable internal Hom of E-modules, with its canonical map to strongly continuous functors. Specify the compact witness before defining nuclear and basic nuclear modules. Use the equivalence with sequential trace-class presentations from Efimov Proposition 3.6 in the proof of motives rigidity.

Provide the following operations and identities.

- `RelativeNuclearModule.traceClassWitness`: A compact object of Homdual_E(C,E)⊗_E D determines a relatively trace-class map C → D.
- `RelativeNuclearModule.ofBasic`: A sequential colimit of relatively trace-class maps is nuclear; ω₁-compact nuclear modules are basic nuclear.
- `RelativeNuclearModule.test`: Every compact map from an ω₁-compact relatively compactly generated E-module is relatively trace-class.
- `RelativeNuclearModule.motive`: Uloc carries these transitions to the left/right trace-class transitions used in Motloc_E rigidity.

**Checks.**

- `RelativeNuclearModule.base`: E as a left E-module is nuclear over itself.
- `RelativeNuclearModule.zero`: The zero E-module is basic nuclear.
- `RelativeNuclearModule.orderedResolution`: For the directed repetition category B of Proposition 3.13 with countable objects and ω₁-compact Homs, Fun(B^op,E) and the transition-fiber kernel are basic nuclear.

Also establish The nuclear length-one resolution produces nuclear E-modules. The witness is compact in the tensor/internal-Hom category, not necessarily a compact object in the ordinary functor category.

*Needs:* §4.1 (Relative dualizable presentable stable categories); §4.2 (Ordered trace-class morphisms and the symmetric comparison); §4.3 (E₁ rigidity extending the supplied symmetric notion); EnhancedDerivedSheaves E5:presentability.

**The nuclear resolution of length one.** For a small E-enriched A, define B with objects (x,n)∈Ob(A)×N and Hom_B((x,n),(y,m))=Hom_A(x,y) for n<m, 1_E for n=m and x=y, and 0 otherwise. Composition uses A’s composition and units. The strongly continuous functor Φ:Fun(B^op,E) → Fun(A^op,E) sends h_(x,n) to h_x. Its kernel C is generated as an E-localizing subcategory by fibers h_(x,n) → h_(x,n+1). Both C and Fun(B^op,E) are nuclear. If Ob(A) is countable and its Homs are ω₁-compact, both are ω₁-compact and basic nuclear.

([E-mot](#e-mot), Proposition 3.13 and proof, pp. 41–43.)

The construction proceeds as follows. Construct B by the strict order on N and verify enriched composition. The right adjoint to Φ is evaluation M(x,n)=M(x), identified on h_x with colim_n h_(x,n), so the counit is an equivalence. Identify the kernel by the filtered fibers of transitions. The ordered semiorthogonal decomposition proves nuclearity; countable compact generators give the ω₁ bound.

Provide the following operations and identities.

- `NuclearModuleResolution.repetition`: Build B with the three stated Hom cases and enriched composition.
- `NuclearModuleResolution.quotient`: Φ sends h_(x,n) to h_x and admits fully faithful colimit-preserving right adjoint M(x,n)=M(x).
- `NuclearModuleResolution.kernel`: ker Φ is generated by the transition fibers.
- `NuclearModuleResolution.basicNuclear`: Countable Ob(A) and ω₁-compact Homs give an exact resolution by basic nuclear E-modules.

**Checks.**

- `NuclearModuleResolution.empty`: For A empty, B and both module categories are zero.
- `NuclearModuleResolution.oneObject`: For A with one object and endomorphism 1_E, B has Hom(n,m)=1_E for n≤m and 0 for n>m; Φ(h_n)=1_E.
- `NuclearModuleResolution.nonzeroKernel`: For the one-object case the fiber h_0 → h_1 is nonzero, although its image under Φ is zero; Φ is a quotient, not an equivalence.

Also establish Every ω₁-compact E₁-algebra has its module category as a quotient of this length-one basic nuclear resolution.

*Needs:* §4.7 (Nuclear E-modules); EnhancedDerivedSheaves E5:presentability.

### 4.8 Enriched duality and rigidity of motives

**Enriched trace-class duality.** Let A be enriched over PrL_st and X,Y∈A. Assume 1_X is compact in A(X,X), A(X,Y) is generated by sequential colimits of right trace-class 2-morphisms, and A(Y,X) by sequential colimits of left trace-class 2-morphisms. Then A(X,Y) and A(Y,X) are dualizable, composition A(X,Y)⊗A(Y,X) → A(Y,Y) is strongly continuous, and A(Y,X)∨≃A(X,Y). Evaluation is composition to A(X,X) followed by Map(1_X,−); coevaluation is 1_Y followed by the right adjoint to composition.

([E-mot](#e-mot), Theorem 2.1, p. 25; proof, pp. 27–29.)

The construction proceeds as follows. Use the trace-class generation to identify the compact-morphism criteria for the composition right adjoint. Construct evaluation using compact 1_X and coevaluation using the strongly continuous composition right adjoint. Check both triangle identities on the sequential trace-class generators, then extend by colimits; these are the hypotheses used in Efimov Theorem 2.1.

Also establish Both left and right generation hypotheses are required; one-sided generation alone is not the theorem.

*Needs:* §4.2 (Ordered trace-class morphisms and the symmetric comparison); §4.1 (Relative dualizable presentable stable categories); EnhancedDerivedSheaves E5:presentability.

**Rigidity of relative localizing motives.** If E is a rigid presentable E₁-monoidal stable category, Motloc_E is dualizable in PrL_st with dual Motloc_(E^mop) and pairing (D,C) ↦ Kcont(D ⊗_E C). If E is E₂-monoidal, Motloc_E is rigid E₁-monoidal. In the symmetric monoidal case the rigidity is symmetric monoidal. These are finitary accessible motives with the specified universe, not the assertion that every motive is a dualizable object.

([E-mot](#e-mot), Theorem 3.1, p. 29; proof of Theorem 3.1, pp. 43–44.)

The construction proceeds as follows. Use the corepresentability of concrete nonconnective K-theory to make the motive of E compact. Resolve small E-enriched categories by the nuclear length-one resolution. Their motives generate under colimits and are sequential colimits of trace-class maps. Apply Efimov Theorem 2.1 to the left and right composition categories to obtain the stated duality; for E₂ multiplication the right adjoint is bilinear, giving rigidity.

Also establish E = Sp gives rigid absolute localizing motives. For merely E₁ base the dual is indexed by E^mop; do not claim a symmetric monoidal structure.

*Needs:* §4.6 (The category of relative localizing motives); §4.7 (The nuclear resolution of length one); §4.8 (Enriched trace-class duality); §4.5 (Continuous extensions of localizing invariants); §4.3 (Trace-class generation criterion for rigidity).

### 4.9 Localizing and truncating small-category invariants

**Connective K-theory of small stable ∞-categories.** For a small stable ∞-category C let S_n(C)=Gap([n],C) be the full subcategory of Fun(N(Ar[n]),C) of diagrams F with every F(i,i) a zero object and every square F(i,j)→F(i,k), F(j,j)→F(j,k) (i<j<k) a pushout. For n≥1, restricting to the row F(0,1)→…→F(0,n) is an equivalence Gap([n],C)≃Fun(Δ^{n−1},C), so each S_n(C) is stable and the simplicial structure maps are exact. Passing to maximal ∞-groupoids levelwise and iterating gives a connective spectrum K(C) with Ω^∞K(C)≃Ω|S_•(C)^≃|. K is functorial in exact functors, preserves filtered colimits, and sends split-exact sequences to split fibre sequences. On Cat^perf_∞ it is the connective K-theory used in this layer. For a small Waldhausen category with factorizations and DKHS-saturated weak equivalences, and for perfect modules over a small pretriangulated spectral category, it agrees with Waldhausen K-theory of the corresponding model; in particular K(Perf(A)) is the connective K-theory of a ring A supplied by GeneralAlgebraicKTheory. On a stable C that is not idempotent complete, K(C) is distinguished from K(Idem C).

Throughout this statement, C a small stable ∞-category and exact functors; universes fixed before forming Ind and κ-compact objects; filtered colimits computed in Cat^perf_∞.

([BGT](#bgt), §7.1, Definition 7.1, Lemma 7.3 and Remark 7.4, p. 44; Theorem 7.8, p. 47; Corollary 7.9 and Proposition 7.10, p. 48.)

The construction proceeds as follows. For n≥1, Lemma 7.3 identifies Gap([n],C) with the row category; S₀(C) is the contractible zero category. Thus every S_n(C) is stable and the face maps are exact. Realize the maximal groupoids levelwise; additivity of the S-construction gives split-exact sequences to fibre sequences (BGT Proposition 7.10). Gap([n],−), maximal groupoids and geometric realization commute with filtered colimits. Compare with Waldhausen's S-construction by BGT Theorem 7.8 under its simplicial model hypotheses, and by Corollary 7.9 for perfect modules over pretriangulated spectral categories. The DG and Frobenius comparisons of GeneralAlgebraicKTheory then identify the ring case.

Provide the following operations and identities.

- `stableK.sConstruction`: S_n(C)=Gap([n],C) with its face and degeneracy functors.
- `stableK.gap_row`: For n≥1, Gap([n],C)≃Fun(Δ^{n−1},C) by restriction to the row; S₀(C) is contractible.
- `stableK`: The connective spectrum K(C), functorial in exact functors.
- `stableK.additive`: Split-exact sequences go to split fibre sequences, and finite products to products.
- `stableK.filtered`: K preserves filtered colimits of small stable ∞-categories.
- `stableK.waldhausen`: Agreement with Waldhausen K-theory under the hypotheses of BGT Theorem 7.8, and K(Perf A) with ring K-theory.

**Checks.**

- `stableK.zero`: S_n(0) is contractible for every n, and K(0) is the zero spectrum.
- `stableK.first_stages`: S₀(C) is contractible and S₁(C)≃C. Keeping only the diagonal zero objects would make S₁(C) contractible for nonzero C.
- `stableK.idempotents`: For R=k×k with k a field, the stable category of bounded finite-free R-complexes has K₀=ℤ, mapping diagonally into K₀(Perf R)=ℤ². The summand (k,0) is missing before idempotent completion, so raw K is not invariant under Idem.
- `stableK.pi0`: For idempotent-complete C, K₀(C) is the Grothendieck group of the homotopy category with [Y]=[X]+[Z] for every cofibre sequence. For C=Perf(F), F a field, it is ℤ by Euler characteristic: [F[1]]=−[F], and the nonzero complex F⊕F[1] has class zero. Group completion using direct-sum relations alone would instead give ⊕_{j∈ℤ}ℤ, recording each cohomological degree separately; the cofibre relation is essential.

**Nonconnective K-theory by the suspension construction.** Fix an uncountable regular cardinal κ and a universe containing it. For a small stable C put F_κ(C)=(Ind_ω C)^κ, the κ-compact Ind-objects, and Σ_κ(C)=F_κ(C)/C, the idempotent-completed Verdier quotient. F_κ(C) has countable coproducts, so K(F_κC)=0 by the Eilenberg swindle. The exact sequences C→F_κC→Σ_κC give maps K(Σ_κ^{(n)}C)→ΩK(Σ_κ^{(n+1)}C), and IK(C)=colim_n Ω^nK(Σ_κ^{(n)}C). Then IK sends exact sequences of small stable ∞-categories to fibre sequences, is Morita invariant (IK(C)≃IK(Idem C)), and receives a natural map K→IK inducing K_i(C)≅IK_i(C) for i>0, and also for i=0 when C is idempotent complete. IK preserves κ-filtered colimits, and all filtered colimits. Its value is independent of κ. On Perf(A) it agrees with the Bass–Thomason–Trobaugh nonconnective K-theory supplied by GeneralAlgebraicKTheory, and on DHKS-saturated Waldhausen categories with factorization with the corresponding nonconnective model.

Throughout this statement, C a small stable ∞-category; κ uncountable regular; all comparisons natural in exact functors.

([BGT](#bgt), §9.1, Definition 9.1, Lemma 9.4 and Proposition 9.5, p. 57; Definition 9.6, the remark following it, Lemma 9.7 and Theorem 9.8, p. 58, with the end of the proof of Theorem 9.8, p. 63; Proposition 9.32 and Remark 9.33, p. 64.)

The construction proceeds as follows. Prove that F_κ and Σ_κ preserve exact sequences (BGT Proposition 9.5) and that K(F_κC)=0 (Lemma 9.4). The transition maps come from the connecting maps of the fibre sequences K(C)→K(F_κC)→K(Σ_κC) on connective covers. Localization for IK follows from Proposition 9.5 and the localization sequence for connective K in positive degrees. Lemma 9.7 gives κ-filtered continuity only. Preservation of arbitrary filtered colimits is the statement with which BGT conclude the proof of Theorem 9.8 (p. 63); they cite Schlichting's lemma on negative K-theory of derived categories (§7, Lemma 6) for it, and that argument is part of this target. Compare degrees by Proposition 9.32 and Remark 9.33. Independence of κ follows by comparing two cardinals through the larger one.

Provide the following operations and identities.

- `stableNonconnectiveK.cone`: F_κ(C) and Σ_κ(C) with the exact sequence C→F_κC→Σ_κC.
- `stableNonconnectiveK`: IK(C)=colim_n Ω^nK(Σ_κ^{(n)}C), functorial in exact functors.
- `stableNonconnectiveK.localizing`: Exact sequences go to fibre sequences.
- `stableNonconnectiveK.morita`: IK(C)≃IK(Idem C).
- `stableNonconnectiveK.connective_comparison`: K_i(C)≅IK_i(C) for i>0, and for i=0 when C is idempotent complete.
- `stableNonconnectiveK.filtered`: IK preserves filtered colimits.
- `stableNonconnectiveK.ring`: IK(Perf A) agrees with the supplied nonconnective K-theory of the ring A.

**Checks.**

- `stableNonconnectiveK.zero`: IK(0)=0.
- `stableNonconnectiveK.swindle_needs_uncountable`: For κ=ω, F_ω(C) is Idem C and K₀(F_ω Perf F)=ℤ for a field F, so the cone is not K-acyclic; the swindle uses the countable coproducts that only an uncountable κ provides.
- `stableNonconnectiveK.degree_zero`: For the category of bounded finite-free (k×k)-complexes in `stableK.idempotents`, IK₀=ℤ² while K₀=ℤ; degree-zero agreement needs idempotent completeness.
- `stableNonconnectiveK.cardinal`: For uncountable regular κ, the filtered poset ℕ is not κ-filtered, since its countable family of objects has no upper bound in ℕ. κ-filtered continuity alone does not give sequential continuity.
- `stableNonconnectiveK.regular`: For a regular noetherian ring A, IK_i(Perf A)=0 for i<0, and IK agrees with K.

*Needs:* EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E5:abstract — idempotent completion; EnhancedDerivedSheaves E5:presentability — compact objects; GeneralAlgebraicKTheory §§3.12–3.14; GeneralAlgebraicKTheory Layers 5–6; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6 — nonconnective spectrum and derived invariance; StableHomotopyKTheory Layer 5.

**Localizing and truncating invariants.** A sequence A → B → C of small idempotent-complete stable ∞-categories is exact if the composite is zero, A → B is fully faithful and Idem(B/A) → C is an equivalence. A localizing invariant with values in a stable ∞-category T is a functor E : Cat^{perf}_∞ → T sending exact sequences to fibre sequences (no filtered-colimit condition, following Land–Tamme; Blumberg–Gepner–Tabuada additionally require filtered colimits, and additive invariants only see split-exact sequences). E is truncating if E(A) → E(τ_{≤0}A) = E(π_0A) is an equivalence for every connective E_1-ring A (E evaluated on Perf). Nonconnective K-theory IK, THH, TC and the TC^n are localizing; connective K is additive but not localizing.

Throughout this statement, Small stable ∞-categories (EnhancedDerivedSheaves E5:abstract); for rings, E(A) := E(Perf(A)).

([BGT](#bgt), §8.3, Definition 8.1, p. 52; [LT](#lt), §3, Definition 3.1, p. 28.)

The construction proceeds as follows. Define exact (Verdier) sequences and localizing invariants as above (Land–Tamme Definition 1.2; BGT Definition 8.1). Record the examples: IK (§4.9 (Nonconnective K-theory by the suspension construction)), THH (§2.11 (THH of spectral and stable ∞-categories)), TC (exact functor of THH). Define truncating invariants (Land–Tamme Definition 3.1).

Provide the following operations and identities.

- `LocalizingInvariant`: A functor Cat^{perf}_∞ → T sending exact sequences to fibre sequences.
- `LocalizingInvariant.morita`: Localizing invariants invert Morita equivalences (A → B with Idem(A) ≃ Idem(B)).
- `LocalizingInvariant.ofRing`: E(A) := E(Perf(A)) for an E_1-ring A.
- `TruncatingInvariant`: A localizing invariant with E(A) ≃ E(π_0A) for connective A.
- `LocalizingInvariant.fib`: Fibres of natural transformations of localizing invariants are localizing.

**Checks.**

- `LocalizingInvariant.zero`: E(0) ≃ 0 for every localizing invariant.
- `LocalizingInvariant.THH_example`: THH is localizing: THH(Perf(A)) ≃ THH(A).
- `LocalizingInvariant.connective_K_nonexample`: Use the triangle ring R and suspension sequence of §4.4: K₀(FκPerf(R))=0 while K₀(ΣκPerf(R))=Z. Connective K fails the localization test because this map is not surjective. For regular rings such as Perf(ℤ)_{p-tors} → Perf(ℤ) → Perf(ℤ[1/p]) the sequence happens to be a fibre sequence, so that regular example alone cannot test the definition.

Also establish IK, THH, TC are localizing; K^{inv} = fib(IK → TC) is localizing (§4.18). HP(−⊗ℚ/ℚ) is truncating (Goodwillie; §4.17 (Goodwillie's rational theorem)).

*Needs:* §4.9 (Connective K-theory of small stable ∞-categories); §4.9 (Nonconnective K-theory by the suspension construction); EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E5:abstract — idempotent completion; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6 — nonconnective spectrum and derived invariance; §2.11 (THH of spectral and stable ∞-categories); §2.10 (Topological cyclic homology); GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6.

### 4.10 K-theory as tensor unit and the Dennis trace

**K-theory units of finitary invariants.** The ∞-categories of spectrum-valued finitary additive and finitary localizing invariants of Cat^perf_∞ admit presentably symmetric monoidal Day convolution structures. Their tensor units identify respectively with connective K and concrete nonconnective IK. Here finitary means preservation of all filtered colimits; additive means split-exact-sequence preservation and localizing means exact-sequence preservation. The inclusions into all functors are lax symmetric monoidal, so a multiplicative map in the invariant category gives a multiplicative natural transformation of the underlying functors. This unit identification is the trace-specific specialization of BGT Theorems 5.14–5.15; generic Day convolution and monoidal accessible localization belong to EnhancedDerivedSheaves.

Throughout this statement, Small idempotent-complete stable ∞-categories with their exact tensor product; spectrum-valued functors preserving filtered colimits.

([BGT-mult](#bgt-mult), Lemma 5.5 and Propositions 5.6–5.7, pp. 22–23; Theorems 5.14–5.15, pp. 24–25; [BGT](#bgt), Theorem 7.13, p. 49; Theorem 9.8, p. 58.)

The construction proceeds as follows. On a suitably small subcategory of κ-compact stable categories, use the spectral presheaf Day convolution and extend functors by filtered colimits (BGT Proposition 5.12 and Corollary 5.13, p. 24). Localize at zero objects and split-exact, respectively exact, sequences. Tensoring with an exact stable category preserves these relations (BGT Lemma 5.5 and Propositions 5.6–5.7, pp. 22–23), so the EDS monoidal localization criterion applies. This is a source proof plan, not an assertion that the EDS generic definition already includes that criterion. Identify the localized covariant representable at Perf(S) with K by BGT Theorem 7.13 (p. 49) and with IK using the finitary restriction of §4.6 (The category of relative localizing motives) and BGT Theorem 9.8 (p. 58). The unit comparison is Theorems 5.14–5.15, pp. 24–25. No relative κ-finitary tensor statement is imported from Layers 4 and 7.

Also establish The unit comparison uses K for split-exact invariants and IK for exact invariants, and is natural in small stable categories. TC is excluded from both finitary categories; THH and each finite TC^n belong to the localizing category. For the commutative ring spectrum R and finite-action quotient Q of §2.3, the exact tensor functor Perf(R^{tC_p})→Q induces a module structure on IK(Q) over IK(Perf(R^{tC_p})), hence over K(R^{tC_p}) via K→IK. This uses multiplicativity of the concrete K-theories, rather than an additional definition of K (LMMT Remark 3.9, pp. 15–16).

*Needs:* §4.9 (Connective K-theory of small stable ∞-categories; Nonconnective K-theory by the suspension construction); §2.3 (Tate endomorphisms in the finite-action Verdier quotient); §4.6 (The category of relative localizing motives); GeneralAlgebraicKTheory Layers 5–6; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6 — nonconnective spectrum and derived invariance; EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category; EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E5:presentability — presentable categories; EnhancedDerivedSheaves E5:presentability — compact objects.

**The Dennis trace.** The topological Dennis trace is the natural transformation of additive invariants K → THH on small stable ∞-categories corresponding to 1 ∈ π_0Nat(K, THH) ≅ π_0THH(S) = ℤ; on objects it sends x to id_x ∈ C(x,x), a 0-simplex of the cyclic nerve. Composed with linearisation THH(A) → HH(A/ℤ) it gives the classical Dennis trace K_n(A) → HH_n(A/ℤ); in degree 0 it is the Hattori–Stallings trace K_0(A) → A/[A,A], [P] ↦ trace of an idempotent representing P; in degree 1 the class of a unit u ∈ A^× ⊂ K_1(A) maps to the class of u^{−1} ⊗ u ∈ HH_1(A) in the convention where the degree-one Dennis comparison is positive (for commutative A, d log u ∈ Ω¹_A). Blumberg–Mandell §9 uses the opposite generator and writes −t^{−1}σt; transporting that comparison reverses the sign.

Throughout this statement, K connective K-theory of small stable ∞-categories (§4.9 (Connective K-theory of small stable ∞-categories); GeneralAlgebraicKTheory §§3.2 and 3.12–3.14 supplies the ring model).

([BGT](#bgt), §1.4, Corollary 1.13, p. 7 (proved in §10, Corollary 10.4 and Theorem 10.6); [BlM](#blm), §9 (cyclotomic trace from non-connective K), paragraph before the proof of Theorem 9.1, p. 41.)

The construction proceeds as follows. Nat(K, THH) ≃ THH(S) ≃ S (BGT Corollary 10.4, Yoneda for the corepresenting additive motive); take the class 1 (BGT Theorem 10.6). Describe it on S_•-constructions: an object goes to its identity endomorphism (BGT §10.3). Linearise via §2.8 (THH relative to THH(ℤ) is Hochschild homology) and compute degrees 0 and 1.

Provide the following operations and identities.

- `dennisTrace`: K → THH as a natural transformation of additive invariants.
- `dennisTrace.toHH`: K_n(A) → HH_n(A/ℤ) after linearisation.
- `dennisTrace.degree_zero`: On K_0: the Hattori–Stallings trace [P] ↦ tr(e).
- `dennisTrace.degree_one`: On a unit u ∈ K_1(A): u ↦ [u^{−1}⊗u] ∈ HH_1(A).
- `dennisTrace.natural`: Natural in exact functors of small stable ∞-categories.

**Checks.**

- `dennisTrace.free_module`: [A^n] ↦ n ∈ A/[A,A].
- `dennisTrace.zero_category`: On the zero category the trace is 0 → 0.
- `dennisTrace.not_iso`: The Dennis trace K_1(ℤ) = ℤ/2 → HH_1(ℤ) = 0 is not injective: it is not an isomorphism in general.

Also establish Degree 0: K_0(A) → HH_0(A) = A/[A,A] sends [A^n] ↦ n. Degree 1, A = ℤ[t^{±1}]: [t] ↦ t^{−1}dt (d log t). In degree 0 the Dennis trace of a perfect module agrees with the Chern character of DGAInfinity layer 9 in HH_0 (both are the Hattori–Stallings trace of an idempotent).

*Needs:* GeneralAlgebraicKTheory Layers 5–6; GeneralAlgebraicKTheory §§3.12–3.14; §2.11 (THH of spectral and stable ∞-categories); §2.8 (THH relative to THH(ℤ) is Hochschild homology); §4.9 (Localizing and truncating invariants); DGAInfinity Layer 9 (ordinary Hochschild character); §4.10 (K-theory units of finitary invariants).

### 4.11 The cyclotomic trace and multiplicativity

**The cyclotomic trace.** There is a natural transformation tr : IK → TC of exact-sequence-preserving invariants of small idempotent-complete stable ∞-categories. Use the small-category, filtered-colimit-preserving restriction of §4.6 (The category of relative localizing motives): Uloc : Cat^perf_∞ → Mloc and IK(C) ≃ map_Mloc(Uloc(Perf(S)), Uloc(C)). Cyclotomic THH is Morita invariant, localizing and filtered-colimit-preserving, so it extends to a colimit-preserving functor F : Mloc → CycSp. The induced map on mapping spectra, with F(Uloc(Perf(S))) ≃ S^triv, defines tr : IK(C) → map_CycSp(S^triv, THH(C)) = TC(C). The connective trace is K → IK → TC; its composite with TC → THH is the Dennis trace. TC need not preserve filtered colimits: the universal factorization is applied to cyclotomic THH, never to TC.

Throughout this statement, Small idempotent-complete stable ∞-categories; the BGT finitary restriction of the motives supplier, not its arbitrary κ-finitary or no-filtered-colimit variant. CycSp is stable and presentable, and its forgetful functor creates colimits and detects equivalences (§2.9 (Cyclotomic spectra)); THH takes values there.

([BGT](#bgt), Theorem 8.7, pp. 55–56; Theorem 9.8, p. 58; Theorem 10.6, p. 75; §10.3, Proposition 10.8 and Theorem 10.11, pp. 76–77; [HN](#hn), §1.1.2, pp. 9–11.)

The construction proceeds as follows. THH localization and Morita invariance are supplied by §2.11 (THH of spectral and stable ∞-categories). Its spectral bar preserves filtered colimits; because CycSp colimits are created on underlying circle spectra and equivalences are detected there, cyclotomic THH also preserves them. Specialize the existing §4.6 (The category of relative localizing motives) universal property to the finitary small-category construction over Sp. BGT Theorem 8.7 (pp. 55–56) gives the factorization F into CycSp, and Theorem 9.8 (p. 58) identifies the source mapping spectrum with the concrete nonconnective K-theory of §4.9 (Nonconnective K-theory by the suspension construction). No comparison to motives without a colimit axiom is needed. The THH unit identifies F(Uloc(Perf(S))) with the trivial cyclotomic sphere; applying F to mapping spectra defines the natural trace. Mapping out of the sphere is exact, so TC and the trace preserve exact sequences despite the absence of filtered-colimit preservation for TC. After restriction to connective K, identify the composite into THH by the sphere unit and the Dennis-trace classification (BGT Theorem 10.6). Hesselholt–Nikolaus §1.1.2, pp. 9–11, supplies the same mapping-spectrum construction and its S-construction interpretation.

Provide the following operations and identities.

- `cyclotomicTrace`: tr : IK → TC, natural transformation of localizing invariants.
- `cyclotomicTrace.ofRing`: tr : K(A) → TC(A) for an E_1-ring A.
- `cyclotomicTrace.lifts_dennis`: TC → THH composed with tr is the Dennis trace.
- `cyclotomicTrace.natural`: Natural in exact functors, with identities and composition.
- `cyclotomicTrace.relative`: Induces K(f) → TC(f) on fibres for every map f (§4.12 (Relative K-theory, relative TC and K^inv)).

**Checks.**

- `cyclotomicTrace.sphere_unit`: On π_0 for A = S: ℤ → π_0TC(S) = ℤ, 1 ↦ 1.
- `cyclotomicTrace.zero`: On the zero ring both sides vanish.
- `cyclotomicTrace.not_equivalence`: tr : K(𝔽_p) → TC(𝔽_p) is not an equivalence: π_{−1}TC(𝔽_p) ≅ ℤ_p (NS18 §IV.4) while K_{−1}(𝔽_p) = 0.

Also establish The composite S → K(S) → TC(S) → THH(S) = S is the identity. For A=𝔽_p, the trace induces the completion map ℤ→ℤ_p on π_0; it is an isomorphism after p-completion, not an integral isomorphism.

*Needs:* §4.10 (The Dennis trace); §4.9 (Localizing and truncating invariants); §2.10 (Topological cyclic homology); §2.11 (THH of spectral and stable ∞-categories); GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6 — nonconnective spectrum and derived invariance; GeneralAlgebraicKTheory §§5.1–5.11 — S construction; GeneralAlgebraicKTheory Layers 5–6; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6; §4.6 (The category of relative localizing motives); §2.9 (Cyclotomic spectra); §2.7 (Topological Hochschild homology of an E_1-ring); §2.10 (TC is right adjoint to the trivial cyclotomic structure; Frobenius on connective covers).

**Uniqueness and multiplicativity of the trace.** In the finitary additive invariant category of §4.10 (K-theory units of finitary invariants), THH is an E∞-algebra and the space of E∞-maps K → THH is contractible; the Dennis trace represents its distinguished homotopy class. For a fixed prime p and each finite stage TC^n(−;p), the multiplicative mapping space K → TC^n is also contractible. The coherent compatible finite-stage maps determine the unique homotopy class of multiplicative maps K → TC(−;p) arising from that tower (BGT Theorem 7.4). The same unit argument gives IK → THH in finitary localizing invariants. TC itself need not preserve filtered colimits and is not an E∞-algebra in that finitary invariant category; no contractibility assertion for IK → TC there is made. For a connective E∞-ring A, the connective trace K(A) → TC(A;p) is a map of E∞-rings, compatible with GeneralAlgebraicKTheory §§7.1–7.6 and 13.7 products.

Throughout this statement, Additive or localizing spectrum-valued invariants of small idempotent-complete stable ∞-categories, with preservation of all filtered colimits. For the TC tower, fix a prime p and use the genuine finite TC^n stages and their coherent restriction transitions. The comparison with modern p-typical TC is used for THH of connective rings in the proved range.

([BGT-mult](#bgt-mult), Corollary 3.8, p. 15; Corollaries 6.9 and 6.15, pp. 29, 31; Corollary 7.2 and Theorems 7.3–7.4, pp. 32–33 (introduction Theorems 1.11–1.12, p. 5); [BGT](#bgt), §10.3, Proposition 10.8, p. 76; Lemmas 10.9–10.10 and Theorem 10.11, p. 77.)

The construction proceeds as follows. Apply §4.10 (K-theory units of finitary invariants). Mapping from the tensor unit to an E∞-algebra is contractible (BGT Corollary 3.8, p. 15, and Corollary 7.2, p. 32). THH is a finitary localizing multiplicative invariant (BGT Corollary 6.9, p. 29). Finite TC^n are likewise multiplicative (Corollary 6.15, p. 31) and preserve filtered colimits by the TR induction in BGT 2013 Proposition 10.8, p. 76. Identify the Dennis trace by its sphere class. For TC use the homotopy limit of the coherent finite-stage mapping spaces and restriction maps, not a finitary factorization of TC. Theorem 7.4, p. 33, identifies the resulting unique homotopy class as the cyclotomic trace. Evaluate the lax symmetric monoidal transformation at the commutative algebra Perf(A), using the genuine/modern p-typical comparison for connective A. The result respects the GeneralAlgebraicKTheory §§7.1–7.6 and 13.7 products.

Also establish For commutative connective A, the trace K_*(A) → TC_*(A;p) is a ring homomorphism with the K.7 source products. Finite-stage contractibility gives the compatible limiting homotopy class. This argument does not place TC in the finitary Day category.

*Needs:* §4.11 (The cyclotomic trace); §4.10 (The Dennis trace); §2.9 (THH is symmetric monoidal; THH of E_∞-rings); GeneralAlgebraicKTheory §§7.1–7.6 — products from biexact functors; EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6; §4.10 (K-theory units of finitary invariants); §2.14 (TR and genuine TC); §2.17 (Genuine and Nikolaus–Scholze TC agree on bounded below spectra).

### 4.12 Relative trace fibers

**Relative K-theory, relative TC and K^inv.** For f:A→B of E₁-rings, form K(f)=fib(K(A)→K(B)) for connective K and IK(f)=fib(IK(A)→IK(B)) for nonconnective K, together with TC(f). The trace induces both relative maps. Define Fconn(A)=fib(K(A)→TC(A)) and Kinv(A)=fib(IK(A)→TC(A)). Then K(f)→TC(f) is an equivalence iff Fconn(A)→Fconn(B) is; IK(f)→TC(f) is an equivalence iff Kinv(A)→Kinv(B) is. Kinv is localizing; no localizing assertion is made for Fconn. Passing between the two relative criteria requires a comparison of connective and nonconnective relative K, such as the nilpotent case.

Throughout this statement, f a map of E_1-rings; K connective or nonconnective as stated.

([CMM](#cmm), §1.1, Theorem 1.2 and footnote 1, p. 2.)

The construction proceeds as follows. Take the two relative fibres of the natural trace transformations separately. Apply the stable 3×3 fibre lemma to K→TC and to IK→TC; use no comparison between connective and nonconnective K without its hypotheses.

Provide the following operations and identities.

- `relativeK`: K(f) = fib(K(A) → K(B)).
- `relativeTC`: TC(f) = fib(TC(A) → TC(B)).
- `relativeTrace`: K(f) → TC(f) induced by tr.
- `Kinv`: K^{inv} = fib(IK → TC), a localizing invariant.
- `Kinv.relative_iff`: IK(f) → TC(f) is an equivalence iff K^{inv}(A) → K^{inv}(B) is. For connective K use Fconn(A) → Fconn(B).

**Checks.**

- `relativeK.identity`: For f = id, K(f) = TC(f) = 0.
- `relativeTrace.dual_numbers_pi1`: For f : k[ε] → k (char k = 0), π_1K(f) = (1 + εk)^× ≅ k, and π_1TC(f) ≅ k compatibly (via §4.17 (The Dundas–Goodwillie–McCarthy theorem)).
- `relativeK.not_support`: For A=ℤ, s=2, fib(IK(ℤ)→IK(ℤ[1/2])) agrees with K-theory with support at 2 by localization. This localization is not a nilpotent quotient, so DGM nilpotent invariance cannot be applied to it.

Also establish For A → A/I with I nilpotent, K(f) ≃ TC(f) (§4.17 (The Dundas–Goodwillie–McCarthy theorem)). K^{inv}(𝔽_p) = fib(K(𝔽_p) → TC(𝔽_p)) has π_{−1} ≅ ℤ_p/ℤ and π_{−2} ≅ ℤ_p (from K_0 = ℤ, K_{<0} = 0, TC_0 = TC_{−1} = ℤ_p).

*Needs:* §4.11 (The cyclotomic trace); §4.9 (Localizing and truncating invariants); GeneralAlgebraicKTheory §8.1; GeneralAlgebraicKTheory Layers 5–6; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6.

### 4.13 Bimodule THH as a categorical trace

**THH with bimodule coefficients.** For an E₁-ring A and an A-bimodule M, THH(A;M) is the realization of the simplicial bar with n-simplices M⊗A^⊗n, endpoint faces given by the right and left module actions and inner faces by multiplication. It is functorial in bimodules and compatible algebra maps, and equivalent to M⊗^L_(A⊗A^op)A. §4.1 (Relative dualizable presentable stable categories) supplies duality for Mod_A ≃ Ind(Perf(A)) in Pr^L_st, with dual Mod_(A^op). The trace of the colimit-preserving endofunctor −⊗_A M of Mod_A is this same spectrum. If the endofunctor preserves perfect modules, it is the Ind extension of its restriction to Perf(A). This does not assert that Perf(A) itself is dualizable in Cat^perf_∞ for arbitrary A. M=A recovers THH(A) with its circle action; a general bimodule does not supply a cyclic structure.

Throughout this statement, Tensor products are spectral/derived; the Perf endofunctor comparison requires preservation of compact modules.

([R](#r), §1.10–1.12, Examples 1.12.1–1.12.2, p. 4; §4.3, p. 20.)

The construction proceeds as follows. Construct and realize the bimodule bar, keeping its two endpoint actions distinct. Identify the bar with the derived tensor over A⊗A^op using GeneralizedCohomology G2.8’s module tensor interface. Use §4.1 (Relative dualizable presentable stable categories) on Ind(Perf(A)). Its evaluation is the pairing of right and left A-modules by derived tensor, and its coevaluation is the diagonal bimodule A. Insert the bimodule endofunctor and evaluate; the result is M⊗^L_(A⊗A^op)A. This is Raskin §1.12, Examples 1.12.1–1.12.2, p. 4. If −⊗_A M preserves compacts, identify it with the Ind extension of its Perf restriction. Only for the regular bimodule does cyclic rotation supply the circle action.

Provide the following operations and identities.

- `CyclotomicTrace.THHcoeff`: Bimodule bar realization M↦THH(A;M).
- `CyclotomicTrace.THHcoeff.map`: Functoriality for compatible bimodule/ring maps.
- `CyclotomicTrace.THHcoeff.categoricalTrace`: Comparison THH(A;M) ≃ tr_Mod_A(−⊗_A M), with Mod_A ≃ Ind(Perf(A)); compact preservation identifies the endofunctor with the Ind extension of its Perf restriction.

**Checks.**

- `CyclotomicTrace.THHcoeff.zero`: THH(A;0)=0.
- `CyclotomicTrace.THHcoeff.sphere`: THH(S;M)≃M.
- `CyclotomicTrace.THHcoeff.regular`: THH(A;A)≃THH(A), with the cyclic regular-bimodule circle action.
- `CyclotomicTrace.THHcoeff.no_general_circle`: The two endpoints act through different bimodule structures; arbitrary M has no canonical cyclic rotation.

*Needs:* §2.7 (Topological Hochschild homology of an E_1-ring); GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; §4.1 (Relative dualizable presentable stable categories); EnhancedDerivedSheaves E5:presentability — ind completion; GeneralAlgebraicKTheory Layers 5–6.

### 4.14 Square-zero extensions and linearization

**Connective bimodules and square-zero extensions.** For a connective E₁-ring A, connective A-bimodules are the connective objects of Mod_{A⊗A^op}(Sp). The split square-zero algebra A⊕M has multiplication (a,m)(a′,m′)=(aa′,am′+ma′) and projection to A. More generally an extension datum is (A,I,δ), with I connective and δ:ker(A⊗A→A)→ΣI a bimodule map. Its algebra is the coherent pullback A×_{A⊕ΣI}A of the derivation map and zero section. Morphisms include the compatible bimodule/derivation square over a ring map. These form AlgSqZero_conn, the domain of infinitesimal sifted-colimit preservation.

Throughout this statement, A connective E₁, I connective bimodule; ker is the derived fiber of multiplication.

([R](#r), §5.3–5.4, pp. 31–32.)

The construction proceeds as follows. Import coherent E₁ module and derivation interfaces from GeneralizedCohomology G2.8. Construct the split algebra and its augmentation. Use the coherent pullback for arbitrary derivations; keep morphisms and their homotopies.

Provide the following operations and identities.

- `CyclotomicTrace.ConnBimod`: Connective A–A bimodules, with restriction/base change under ring maps.
- `CyclotomicTrace.sqZero`: Functor M↦A⊕M and its canonical projection to A.
- `CyclotomicTrace.AlgSqZero`: Coherent category of (A,I,δ) with compatible squares.
- `CyclotomicTrace.AlgSqZero.extension`: Pullback extension algebra and functorial projection.

**Checks.**

- `CyclotomicTrace.sqZero.zero`: A⊕0≃A with identity projection.
- `CyclotomicTrace.sqZero.dual_numbers`: For A=Hk and M=Hk, π₀(A⊕M)=k[ε]/ε².
- `CyclotomicTrace.sqZero.not_tensor`: The ideal M has zero product: the degree-two ε term of a free polynomial algebra is absent.
- `CyclotomicTrace.AlgSqZero.zero_derivation`: The pullback attached to δ=0 recovers the split square-zero extension.

*Needs:* GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; EnhancedDerivedSheaves E0.

**Goodwillie derivatives.** For a sifted-colimit-preserving functor ψ:C→D between cocomplete stable ∞-categories, its reduction ψ_red=fib(ψ→ψ(0)) has derivative ∂ψ=colim_n Ω^n ψ_red Σ^n, initial among continuous exact functors receiving a transformation from ψ (Raskin §2.3). For the connective half C_{≥0} of a t-structure compatible with filtered colimits use Variant 2.3.2 and the additional truncation colimit to extend to C. Without the sifted-colimit hypothesis, 1-excisiveness does not imply preservation of all colimits. Higher excisiveness and analyticity are Goodwillie notions; Raskin expressly avoids constructing the full Taylor tower (Remark 2.1.1).

Throughout this statement, C,D cocomplete presentable stable infinity categories (with universe/accessibility bounds); ψ preserves sifted colimits. In Variant 2.3.2 the source t-structure is compatible with filtered colimits. The stable universal property ranges over exact filtered-colimit-preserving L; the connective variant over all-colimit-preserving L.

([R](#r), §2.3, Remark 2.3.1 and Variant 2.3.2, p. 6.)

The construction proceeds as follows. Define ∂ψ by the sequential colimit under Raskin §2.3’s hypotheses; the connective extension uses Variant 2.3.2 and its truncation colimit. Use Raskin §2.3’s initial continuous-exact functor characterization. This requires the stated stable/sifted-colimit hypotheses, not just finite colimits or reduced excisiveness.

Provide the following operations and identities.

- `Coherent.GoodwillieDerivative`: ∂ψ = colim_n Ω^nψ_redΣ^n.
- `Coherent.GoodwillieDerivative.universal`: For ψ sifted-colimit preserving between presentable stable categories, ∂ψ is continuous exact and precomposition by ψ→∂ψ is an equivalence Map(∂ψ,L)→Map(ψ,L) for every continuous exact L. Continuous means filtered-colimit preserving.
- `Excisive`: n-excisive functors: strongly cocartesian (n+1)-cubes go to cartesian cubes.
- `Coherent.GoodwillieDerivative.exact`: If ψ is exact and reduced, ∂ψ ≃ ψ.
- `Coherent.GoodwillieDerivative.connective`: Variant 2.3.2 uses the filtered-compatible t-structure and the additional truncation colimit to extend a functor on C_{≥0}.
- `Coherent.GoodwillieDerivative.connectiveUniversal`: Initial among all-colimit-preserving functors on C receiving a transformation from ψ on C_{≥0}; mapping-space universal property.

**Checks.**

- `GoodwillieDerivative.const`: The derivative of a constant functor is 0.
- `GoodwillieDerivative.linear`: For ψ the identity on connective spectra, ∂ψ is the identity on spectra; its restriction is the inclusion of connective spectra.
- `GoodwillieDerivative.quadratic`: The quadratic functor M ↦ (M⊗M)_{hC_2} has zero derivative although it is not zero: derivatives see only the linear part.
- `Coherent.GoodwillieDerivative.zero`: The derivative of the zero functor is zero.
- `Coherent.GoodwillieDerivative.linear`: A sifted-colimit-preserving exact functor between presentable stable categories is its own derivative.
- `Coherent.GoodwillieDerivative.continuity`: The mapping-space universal property requires the continuous exact witness on L; finite excision alone does not supply it.

Also establish For ψ the identity on connective spectra, ∂ψ is its colimit-preserving extension, the identity on spectra. For ψ(M)=M⊗M on connective spectra, ∂ψ=0.

*Needs:* GeneralizedCohomology G3.7–G3.8; EnhancedDerivedSheaves E5:abstract — stable infinity category; EnhancedDerivedSheaves E0; EnhancedDerivedSheaves E5:presentability.

### 4.15 The two derivatives of the trace

**Stable K-theory is THH (Dundas–McCarthy).** For a connective E_1-ring A and the functor M ↦ K(A ⊕ M) on connective A-bimodules (A ⊕ M the split square-zero extension), the Goodwillie derivative is M ↦ Σ THH(A, M); i.e. stable K-theory K^s(A, M) := colim_n Ω^n fib(K(A ⊕ Σ^nM) → K(A)) ≃ Σ THH(A, M) (with THH(A, M) the topological Hochschild homology with coefficients). In particular for A = S, stable K-theory of S with coefficients in M is a shift of M.

Throughout this statement, A connective E_1-ring; M connective A-bimodule; connective K-theory.

([R](#r), §2.12, Theorem 2.12.1(2), p. 11 (proved in §3 via Theorem 3.10.1); [Du](#du), §0 Introduction, Theorem (unnumbered), journal p. 225 (PDF p. 3); [LMMT](#lmmt), §3, Remark 3.11, p. 16.)

The construction proceeds as follows. Categorical form: the derivative of T ↦ K(compact pairs (F, F → T F)) is the categorical trace tr_C(T) (Raskin Theorem 3.10.1), via a universal property among additive colimit-preserving functors. Specialise to C = Mod_A and T = M[1] ⊗_A − to get ΣTHH(A, M) (Raskin Theorem 2.12.1(2)); historically Dundas–McCarthy for simplicial rings and Dundas for ring spectra.

Also establish For A = ℤ discrete and M = ℤ: K^s(ℤ, ℤ) ≃ ΣTHH(ℤ, ℤ), whose π_1 = ℤ = HH_0(ℤ). LMMT Remark 3.11's shift convention: the derivative is ΣM for A = S (their printed ΩM is a shift misprint, sourceIssues).

*Needs:* §4.14 (Goodwillie derivatives); §2.7 (Topological Hochschild homology of an E_1-ring); §4.10 (The Dennis trace); GeneralAlgebraicKTheory §3.2; GeneralAlgebraicKTheory Layers 5–6; §4.14 (Connective bimodules and square-zero extensions); §4.13 (THH with bimodule coefficients).

**Stable TC is THH, compatibly with the trace.** For a connective E_1-ring A, the functor M ↦ TC(A ⊕ M) on connective A-bimodules has Goodwillie derivative M ↦ ΣTHH(A, M), and the cyclotomic trace K → TC induces on derivatives the identification of §4.15 (Stable K-theory is THH (Dundas–McCarthy)); so tr is an equivalence on derivatives.

Throughout this statement, A connective E_1-ring; connective bimodules.

([R](#r), §2.12, Theorem 2.12.2(3), p. 11 (proved in §4.11).)

The construction proceeds as follows. Compute TC(A ⊕ M) via the cyclotomic structure of THH(A ⊕ M), whose reduced part decomposes by weight (cyclic tensor powers M^{⊗n} with induced C_n-actions); weights n ≥ 2 contribute nonlinear terms, weight 1 gives ΣTHH(A, M) after the norm/Tate analysis (Raskin Theorem 2.12.2(3), credited to Hesselholt and Lindenstrauss–McCarthy). Compatibility with the trace: the Dennis trace sends (F, η) to tr(id) (Raskin §4.11).

Also establish For M = 0 both derivatives vanish.

*Needs:* §4.14 (Goodwillie derivatives); §4.15 (Stable K-theory is THH (Dundas–McCarthy)); §4.11 (The cyclotomic trace); §2.10 (The Nikolaus–Scholze formula for TC); AInfCohomology §AI.7.2 (`AInf.Trace.tateOrbit`); GeneralAlgebraicKTheory Layers 5–6; §4.14 (Connective bimodules and square-zero extensions); §4.13 (THH with bimodule coefficients).

### 4.16 Cross-effects and the convergence hypotheses

**Pseudo-extensible functors.** Let C,D be cocomplete stable infinity categories with t-structures compatible with filtered colimits. A functor ψ:C_{≥0}→D is pseudo-extensible if it is reduced, preserves sifted colimits, and every functor obtained by finitely iterating φ↦Ω B_φ(F,−), for connective F, takes connective inputs to connective outputs. Here B_φ(F,G)=cofib(φF⊕φG→φ(F⊕G)); for reduced φ it is equivalently the fiber of the split projection to φF⊕φG. This is the complete closure condition, not merely vanishing of a first derivative. Raskin uses cohomological D^{≤0}; the present convention is homological D_{≥0}.

Throughout this statement, C,D cocomplete stable; t-structures preserve filtered colimits.

([R](#r), §2.7, pp. 7–8; Definition 2.11.2, pp. 10–11.)

The construction proceeds as follows. Construct the cross-effect with the canonical splitting. Induct over finite lists of connective inputs. Require connectivity at every iterate, together with reducedness and sifted-colimit preservation.

Provide the following operations and identities.

- `CyclotomicTrace.crossEffect`: Cofiber of φF⊕φG→φ(F⊕G), equivalent to the split projection fiber.
- `CyclotomicTrace.pseudoIterate`: Finite iteration of ΩB(F,−), beginning with ψ.
- `CyclotomicTrace.IsPseudoExtensible`: Reduced, sifted-colimit preserving, and every finite iterate connective-valued.

**Checks.**

- `CyclotomicTrace.pseudoExtensible.zero`: The zero functor is pseudo-extensible.
- `CyclotomicTrace.pseudoExtensible.linear`: A connective-valued reduced linear colimit-preserving functor has zero cross-effect and is pseudo-extensible.
- `CyclotomicTrace.pseudoExtensible.quadratic`: Over HZ, ψ(X)=X⊗X on connective modules has B(HZ,HZ)≃HZ⊕HZ in degree zero; ΩB is not connective, so ψ is not pseudo-extensible.

*Needs:* §4.14 (Goodwillie derivatives); EnhancedDerivedSheaves E5:abstract; EnhancedDerivedSheaves E5:presentability.

**Postnikov-convergent algebra functors.** A coherent functor Ψ:Alg_E₁,conn→Sp is Postnikov convergent if for every connective A the canonical map Ψ(A)→lim_{n∈N}Ψ(τ_{≤n}A) is an equivalence. The limit is the coherent inverse Postnikov tower with its canonical transition maps, not a product of unrelated values.

Throughout this statement, A connective E₁; homological Postnikov truncation τ_{≤n}.

([R](#r), Definition 5.5.1, p. 32.)

The construction proceeds as follows. Import coherent Postnikov towers and their cones. Apply Ψ to the full tower, not just to its object sequence. Define convergence by invertibility of that specific comparison.

Provide the following operations and identities.

- `CyclotomicTrace.postnikovComparison`: Canonical map into the coherent Postnikov value tower.
- `CyclotomicTrace.IsPostnikovConvergent`: The comparison is an equivalence for every connective input.
- `CyclotomicTrace.postnikovConvergent.map`: Preserved by pointwise equivalence of coherent functors.

**Checks.**

- `CyclotomicTrace.postnikovConvergent.zero`: The zero functor is convergent.
- `CyclotomicTrace.postnikovConvergent.forget`: The underlying-spectrum functor is convergent because connective spectra are Postnikov complete.
- `CyclotomicTrace.postnikovConvergent.not_product`: For the constant HZ functor the tower limit is HZ, whereas the product of its values has π₀=∏_N Z.

*Needs:* GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; EnhancedDerivedSheaves E0; StableHomotopyKTheory Layer 7.

**Infinitesimal sifted-colimit preservation.** For Ψ:Alg_E₁,conn→Sp define its relative extension functor on AlgSqZero_conn by (B→A)↦fib(ΨB→ΨA). Ψ infinitesimally preserves sifted colimits when this relative functor preserves every small sifted colimit. This is a condition on the coherent category of derivation data (A,I,δ), including changing A, not on all arrows or only on a fixed bimodule category.

Throughout this statement, Connective extension algebras and ideals as in square-zero-extensions.

([R](#r), Definitions 5.5.2 and Proposition 5.5.3, pp. 32–33.)

The construction proceeds as follows. Use the full coherent extension category. Take functorial homotopy fibers. Form canonical comparison maps for each sifted extension diagram and require them to be equivalences.

Provide the following operations and identities.

- `CyclotomicTrace.relativeExtension`: (A,I,δ)↦fib(Ψ(extension)→ΨA).
- `CyclotomicTrace.IsInfinitesimallySifted`: All coherent sifted-colimit comparison maps of the relative functor are equivalences.
- `CyclotomicTrace.infinitesimallySifted.map`: Invariant under pointwise equivalence; not a global colimit assertion for Ψ.

**Checks.**

- `CyclotomicTrace.infinitesimallySifted.constant`: A constant functor has zero relative functor and satisfies the condition.
- `CyclotomicTrace.infinitesimallySifted.forget`: For the underlying-spectrum functor the relative extension value is I; compatible sifted extension colimits preserve it.
- `CyclotomicTrace.infinitesimallySifted.fixed_base_insufficient`: The nonsplit square-zero extension ℤ/4→𝔽₂ has relative underlying-spectrum value H𝔽₂. It cannot be identified with the split extension 𝔽₂[ε]/ε²→𝔽₂: the source of the former has characteristic 4 and that of the latter characteristic 2. A test restricted to split extensions would omit this input.

*Needs:* §4.14 (Connective bimodules and square-zero extensions); EnhancedDerivedSheaves E0.

**Convergence: from derivatives to nilpotent extensions.** Raskin Proposition 5.5.3: let Ψ:Alg^{conn}_{E_1}→Sp be Postnikov-convergent (Definition 5.5.1) and infinitesimally commute with sifted colimits (Definition 5.5.2: the relative-value functor on square-zero extensions has this property). If Ψ is constant on every split square-zero extension A⊕M→A with M connective, then Ψ is constant on every π_0-surjection with nilpotent kernel. For Ψ=cofib(K→TC), constancy on split extensions follows from Corollary 2.11.7 using pseudo-extensibility of the reduced bimodule functors (Definition 2.11.2) and agreement of derivatives; Theorem 5.6.1 supplies Postnikov convergence and infinitesimal sifted-colimit preservation for K and TC. Agreement of first derivatives plus an undefined “nil-convergent” condition is not asserted as a general theorem.

Throughout this statement, Ψ Postnikov-convergent and infinitesimally preserving sifted colimits, and constant on split square-zero extensions (Proposition 5.5.3). To deduce split-square-zero constancy from derivatives: use Corollary 2.11.7’s actual reduced-functor pseudo-extensibility and connectivity hypotheses.

([R](#r), §2.11, Definition 2.11.2 and Corollary 2.11.7, pp. 10–11; §5.5, Definitions 5.5.1–5.5.2 and Proposition 5.5.3, pp. 32–33; Theorem 5.6.1, p. 33.)

The construction proceeds as follows. Use Ψ=cofib(K→TC), as in Raskin §2.13, p. 12; prove the two convergence conditions separately. Do not substitute the desuspended fibre in the connective pseudo-extensibility step. Establish pseudo-extensibility of M↦Ψ(A⊕M), plus vanishing of derivatives of its translates, to apply Raskin Corollary 2.11.7. This gives constancy on every split square-zero extension. Proposition 5.5.3 extends it to all nilpotent π₀-surjections. For K→TC apply Theorems 2.12.1–2.12.2 and 5.6.1; no general Taylor-tower or first-derivative-only criterion is asserted. After cofiber constancy, desuspend its relative value to obtain the cartesian trace square and the relative fibre equivalence.

Also establish Applied with F = K, G = TC and the trace gives §4.17 (The Dundas–Goodwillie–McCarthy theorem).

*Needs:* §4.14 (Goodwillie derivatives); §4.15 (Stable TC is THH, compatibly with the trace); §4.15 (Stable K-theory is THH (Dundas–McCarthy)); GeneralizedCohomology G3.8; GeneralizedCohomology G3.8 and StableHomotopyKTheory §§7.9–7.10; §4.16 (Pseudo-extensible functors); §4.16 (Postnikov-convergent algebra functors); §4.16 (Infinitesimal sifted-colimit preservation).

### 4.17 Nilpotent invariance and the rational comparison

**The Dundas–Goodwillie–McCarthy theorem.** Let f : A → B be a map of connective E_1-ring spectra such that π_0A → π_0B is surjective with nilpotent kernel. Then the square K(A) → TC(A) over K(B) → TC(B) (cyclotomic trace, connective K, integral TC) is cartesian: K(f) ≃ TC(f). In particular (McCarthy) for a surjection of discrete rings with nilpotent kernel the relative trace K(f) → TC(f; p) is an equivalence after p-completion for every prime p, and (Dundas) the same for ring spectra after p-completion. Equivalently K^{inv}(A) ≃ K^{inv}(B).

Throughout this statement, A, B connective E_1-rings; π_0A → π_0B surjective with nilpotent kernel. No p-completion or rationalisation is needed integrally.

([R](#r), §1.1, Theorem 1.1.1, p. 1; [HN](#hn), Introduction, p. 2; [McC](#mcc), Introduction, Main Theorem, journal p. 198 (PDF p. 2); [Du](#du), §0, Main Theorem, journal p. 224 (PDF p. 2).)

The construction proceeds as follows. Apply §4.16 (Convergence: from derivatives to nilpotent extensions) to tr : K → TC, whose derivatives agree by §4.15 (Stable TC is THH, compatibly with the trace). Nonconnective variant: relative K_{≤0} vanishes for nilpotent extensions, so IK and K give the same relative term (Hesselholt–Nikolaus note). Deduce McCarthy's p-adic statement by p-completing and §2.10 (p-completion of TC).

Also establish For k[ε] → k (k a field of characteristic 0), relative K is relative TC; rationally this is Goodwillie's theorem (§4.17 (Goodwillie's rational theorem)). Fails without nilpotence: ℤ → ℤ/p is not nilpotent (kernel pℤ), and K(ℤ) → K(𝔽_p) relative is not TC-relative. The henselian extension, with finite coefficients, is §4.17 (Henselian rigidity of the trace with finite coefficients).

*Needs:* §4.16 (Convergence: from derivatives to nilpotent extensions); §4.11 (The cyclotomic trace); §4.12 (Relative K-theory, relative TC and K^inv); §2.10 (p-completion of TC); StableHomotopyKTheory §§7.14–7.18; GeneralAlgebraicKTheory Layers 5–6; §4.16 (Pseudo-extensible functors); §4.16 (Postnikov-convergent algebra functors); §4.16 (Infinitesimal sifted-colimit preservation).

**Henselian rigidity of the trace with finite coefficients.** Let (R,I) be a henselian pair of commutative rings and n≥1. With connective K and Fconn=fib(K→TC) as in §4.12, the map Fconn(R)/n→Fconn(R/I)/n is an equivalence; equivalently the relative trace K(R,I)/n→TC(R,I)/n is an equivalence. If n is invertible in R then TC(R)/n=0, and the statement is Gabber's rigidity K(R)/n≃K(R/I)/n. If R is a strictly henselian local ring of residue characteristic p, the trace K(R)/p^r→TC(R)/p^r is an equivalence for every r≥1. If R is henselian along (p) and R/p is semiperfect, K(R)/p^r→TC(R)/p^r is an equivalence in degrees ≥0. None of these holds integrally.

Throughout this statement, (R,I) a henselian pair, so I⊆Jac(R); n≥1 and r≥1; K connective and TC integral. No statement about negative K-groups is made.

([CMM](#cmm), §1, Definition 1.1, p. 2, Theorem 1.4 and Theorem A, p. 3; §4, Corollary 4.35, p. 35, Theorem 4.36 and Remark 4.37, p. 36; Remark 4.39, p. 37; §6, Theorem 6.1, p. 50, and Corollary 6.9, p. 53; [KB](#kb), Theorem IV.2.10, p. 283, for the statement of Gabber's theorem.)

The construction proceeds as follows. Reduce to the pairs (ℤ⋉I,I) for a nonunital henselian ring I, using the comparison of birelative terms along maps inducing an isomorphism on the ideal (CMM Proposition 4.34 and Corollary 4.35, pp. 35–36). Show that I↦K(ℤ⋉I) and I↦TC(ℤ⋉I)/p are projectively pseudocoherent functors on nonunital henselian rings (CMM Propositions 4.21 and 4.26). The second uses that TC/p commutes with all colimits of connective cyclotomic spectra and with sifted colimits of connective E₁-rings (CMM Theorem 2.7 and Corollary 2.15), which rests on §2.10 and §2.4. Then apply the axiomatic rigidity criterion (CMM Proposition 4.16): short exact sequences of ideals give fibre sequences, nilpotent ideals give zero by §4.17 (The Dundas–Goodwillie–McCarthy theorem), and it remains to treat the maximal ideal of the henselization of a polynomial ring over a prime field. Over 𝔽_p this is CMM Proposition 4.32, from the de Rham–Witt description of TC/p of ind-smooth 𝔽_p-algebras (CMM Theorem 4.29, using CrystallineCohomology CR.4). Over a prime field of characteristic different from p it is rigidity of K/p for henselizations of smooth algebras at rational points, the second half of Gabber's argument, also due to Gillet–Thomason (CMM Remark 4.37); that input is part of this target. Pass from p to p^r by the cofibre sequences of ·/p, ·/p^{r+1} and ·/p^r, and to general n through its prime-power factors. The strictly henselian case reduces by rigidity to a separably closed field and then to the surjectivity of 1−C^{−1} on differential forms (CMM Theorem 6.1). The semiperfect case reduces to a perfect ring modulo a locally nilpotent ideal (CMM Corollary 6.9).

Provide the following operations and identities.

- `henselianTraceRigidity`: Fconn(R)/n≃Fconn(R/I)/n for every henselian pair and n≥1.
- `henselianTraceRigidity.relative`: K(R,I)/n≃TC(R,I)/n.
- `gabberRigidity`: For n invertible in R, K(R)/n≃K(R/I)/n.
- `strictlyHenselianTrace`: For R strictly henselian local of residue characteristic p, K(R)/p^r≃TC(R)/p^r.
- `semiperfectTrace`: For R henselian along (p) with R/p semiperfect, K(R)/p^r→TC(R)/p^r is an equivalence in degrees ≥0.

**Checks.**

- `henselianTraceRigidity.zero_ideal`: For I=0 the map is the identity and both relative terms vanish. The unit ideal of a nonzero ring is excluded by I⊆Jac(R).
- `henselianTraceRigidity.non_nilpotent`: (ℤ_p,pℤ_p) is a henselian pair whose ideal is not nilpotent, so this case is not an instance of §4.17 (The Dundas–Goodwillie–McCarthy theorem).
- `strictlyHenselianTrace.strictness`: 𝔽₂ is henselian but not strictly henselian. K(𝔽₂)/2 is connective, while π_{−1}(TC(𝔽₂)/2)=𝔽₂ because π_{−1}TC(𝔽₂)=ℤ₂. A separably closed field of characteristic 2 satisfies the strict-local statement.
- `henselianTraceRigidity.integral_failure`: For R=(𝔽_p[[x]])^perf and I the kernel of R→𝔽_p, relative K₁ is a nonzero uniquely p-divisible group, while relative TC is derived p-complete (CMM Remark 4.39). Finite-coefficient rigidity is therefore not integral rigidity.
- `gabberRigidity.residue_characteristic`: n=p is outside Gabber's hypothesis for R=ℤ_p: K₁(ℤ_p;ℤ/p)⊇ℤ_p^×/p≠0 while K₁(𝔽_p;ℤ/p)=0. The trace term TC is what restores rigidity at p.

*Needs:* §4.17 (The Dundas–Goodwillie–McCarthy theorem); §4.12 (Relative K-theory, relative TC and K^inv); §4.11 (The cyclotomic trace); §2.10 (Topological cyclic homology); §2.4 (Tate constructions at C_p: convergence, vanishing and p-completeness); GeneralAlgebraicKTheory Layers 5–6; GeneralAlgebraicKTheory §8.1; CrystallineCohomology CR.4.

**Goodwillie's rational theorem.** For a ring R and a nilpotent two-sided ideal I ⊂ R, there are natural isomorphisms K_n(R, I) ⊗ ℚ ≅ HC_{n−1}(R ⊗ ℚ, I ⊗ ℚ) for all n (relative cyclic homology over ℚ, HC_*(A⊗ℚ) = HC_*(A) ⊗ ℚ), induced by the Goodwillie–Jones Chern character K(R, I) ⊗ ℚ → HC⁻(R⊗ℚ, I⊗ℚ), which is an isomorphism, together with HP(R⊗ℚ, I⊗ℚ) = 0 and the norm sequence. In Land–Tamme's form, KQinf := fib(K_ℚ → HN_ℚ) is truncating; the same holds for maps of simplicial rings (connective E_1-rings via −⊗HZ) that are π_0-surjective with nilpotent kernel.

Throughout this statement, I nilpotent (not merely locally nilpotent); rational coefficients.

([Co](#co), §0 Introduction, display (5), pp. 2-3; [LT](#lt), §3, p. 30 (definition of KQinf) and proof of Corollary 3.9, p. 31.)

The construction proceeds as follows. Import the relative rational Chern-character theorem as stated in Cortiñas (2006), Introduction (5)–(6), pp. 2–3, or Land–Tamme §3’s truncating KQinf result; this comparison theorem does not assert a new derivative proof. For a nilpotent ideal of a rational algebra, relative HP vanishes (Goodwillie nilinvariance). The norm sequence then identifies relative HC⁻_n with HC_{n−1}. Do not rationalize through an infinite fixed-point or Tate limit to identify absolute TC⁻ or TP with HC⁻ or HP; the relative theorem does not imply those individual equivalences.

Also establish K_1(ℚ[ε], (ε)) = 1 + εℚ ≅ ℚ = HC_0(ℚ[ε], (ε)). K_2(ℚ[ε], (ε)) ≅ HC_1(ℚ[ε], (ε)) = 0 (consistent with van der Kallen: K_2(k[ε], (ε)) ≅ Ω¹_{k/ℤ}, which vanishes for k = ℚ) and K_3(ℚ[ε], (ε)) ⊗ ℚ ≅ HC_2(ℚ[ε], (ε)) ≅ ℚ.

*Needs:* §4.17 (The Dundas–Goodwillie–McCarthy theorem); §2.8 (The norm sequence for cyclic homology); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §2.10 (Negative topological cyclic and periodic topological cyclic homology); StableHomotopyKTheory §7.21.

### 4.18 Truncating excision and formal towers

**K^inv is truncating.** K^{inv} = fib(IK → TC) is a truncating localizing invariant: for every connective E_1-ring A, K^{inv}(A) → K^{inv}(π_0A) is an equivalence. Equivalently (by §4.17 (The Dundas–Goodwillie–McCarthy theorem) applied to A → π_0A, whose π_0-map is the identity) the DGM theorem implies truncation.

Throughout this statement, Connective E_1-rings.

([LT](#lt), §3, proof of Corollary 3.6, p. 29; [CMM](#cmm), §5.2, 'Variant', p. 42.)

The construction proceeds as follows. A → π_0A = τ_{≤0}A is π_0-surjective with zero kernel; apply §4.17 (The Dundas–Goodwillie–McCarthy theorem) (Clausen–Mathew–Morrow §5.2 Variant; Land–Tamme Corollary 3.6).

Also establish K^{inv}(ℤ[x]/x² ⊗ S-type ring spectra) agrees with K^{inv} of their π_0.

*Needs:* §4.17 (The Dundas–Goodwillie–McCarthy theorem); §4.9 (Localizing and truncating invariants); §4.12 (Relative K-theory, relative TC and K^inv); GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6.

**The trace square for filtered towers.** Let R be a ring with a two-sided ideal I such that R ≅ lim_n R/I^n. The DGM squares for R/I^n → R/I assemble into a map of towers, and on limits K(R/I^∞) := lim_n K(R/I^n) and TC(R/I^∞) := lim_n TC(R/I^n) the square lim_n K(R/I^n) → lim_n TC(R/I^n) over K(R/I) → TC(R/I) is cartesian; on homotopy groups each limit sits in a Milnor sequence 0 → lim¹_n π_{i+1} → π_i lim → lim_n π_i → 0. Comparing K(R) itself with lim_n K(R/I^n) (continuity) is a separate input: CMM Theorem F gives a p-adic equivalence K(R)→lim_n K(R/I^n) when R is noetherian, I-adically complete and R/p is F-finite. The continuity theorem is the next target; it uses §4.17 and is not a consequence of this limit-square construction alone, whose conclusion is the limit square.

Throughout this statement, R I-adically complete; each R/I^n → R/I is a nilpotent extension.

([CMM](#cmm), §2.1, Remark 2.8, p. 9; [CMM](#cmm), §1.2, Theorem F, p. 4 (= Theorem 5.5, p. 39).)

The construction proceeds as follows. Apply §4.17 (The Dundas–Goodwillie–McCarthy theorem) to each R/I^n → R/I, naturally in n. Limits commute with pullbacks; Milnor sequences from StableHomotopyKTheory §§7.9–7.10.

Also establish For R = k[[t]], I = (t): the limit square for k[t]/(t^n) is the input to the calculation of K(k[[t]]) by TC.

*Needs:* §4.17 (The Dundas–Goodwillie–McCarthy theorem); GeneralizedCohomology G3.8 and StableHomotopyKTheory §§7.9–7.10; StableHomotopyKTheory §§7.9–7.10; EnhancedDerivedSheaves E0; GeneralAlgebraicKTheory Layers 5–6; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6; StableHomotopyKTheory Layer 7.

**Continuity of K-theory modulo p.** Let R be a noetherian ring complete along an ideal I, with R/pR F-finite. Then THH(R)→lim_s THH(R/I^s), TC(R)→lim_s TC(R/I^s) and K(R)→lim_s K(R/I^s) are equivalences modulo p, hence after p-completion. In derived form, for a connective E₁-algebra R in Mod_{HZ} with π₀R commutative and henselian along (p), K(R)→lim_i K(R⊗_{HZ}HZ/p^i) is an equivalence modulo p. K is connective; no integral or rational continuity is asserted.

Throughout this statement, p a prime; for the first part R noetherian, I-adically complete and R/p F-finite; for the derived part π₀R commutative and henselian along (p).

([CMM](#cmm), §1.2, Theorem F, p. 4; §5.1, Proposition 5.4, p. 38, Theorem 5.5 and Remark 5.6, p. 39; §5.2, Theorem 5.21, p. 44; §2.1, Remark 2.8, p. 9.)

The construction proceeds as follows. The pairs (R,I) and (R/I^s,I/I^s) are henselian, so §4.17 (Henselian rigidity of the trace with finite coefficients) gives K^inv(R)/p≃K^inv(R/I)/p≃K^inv(R/I^s)/p compatibly in s; continuity of K/p is therefore continuity of TC/p. Prove THH(R)/p→lim_s THH(R/I^s)/p is an equivalence from noetherianity and F-finiteness, extending the Dundas–Morrow argument as in CMM Proposition 5.4, and pass from THH/p to TC/p by the tower argument of CMM Remark 2.8. For the derived form use K^inv(R)≃K^inv(R⊗_{HZ}HZ/p^i) modulo p from §4.17 and the corresponding TC statement for this tower (CMM Theorem 5.20).

Also establish For R=ℤ_p and I=(p), K(ℤ_p)/p≃lim_s K(ℤ/p^s)/p. For R=k[[t]] with k perfect of characteristic p, the limit square of the preceding target together with this target computes K(k[[t]];ℤ_p) through the truncated polynomial rings k[t]/(t^s).

*Needs:* §4.17 (Henselian rigidity of the trace with finite coefficients); §4.18 (The trace square for filtered towers); §2.10 (Topological cyclic homology); §2.11 (THH of spectral and stable ∞-categories); GeneralizedCohomology G3.8 and StableHomotopyKTheory §§7.9–7.10; StableHomotopyKTheory Layer 7; GeneralAlgebraicKTheory Layers 5–6.

**Truncating invariants: nil-invariance and excision.** Every truncating invariant E is nil-invariant (E(A) ≃ E(A/I) for a nilpotent ideal I of a discrete ring) and satisfies excision: for a Milnor square of rings (a pullback A → B, A/I → B/I with A → B mapping I isomorphically onto an ideal of B), E sends it to a pullback square; more generally Land–Tamme's ⊙-ring formula holds. Applied to K^{inv}: K^{inv} satisfies excision (Cortiñas; Geisser–Hesselholt; Dundas–Kittang; Land–Tamme), so the obstruction to excision for K equals that for TC; rationally (Cortiñas, KABI conjecture) the obstruction to excision in K⊗ℚ equals that in HC⊗ℚ (shifted by one).

Throughout this statement, E truncating; Milnor squares of discrete rings (Land–Tamme allow general pullbacks with the ⊙-ring correction).

([LT](#lt), Introduction, Theorem B, p. 3 (= Theorem 3.3 + Corollary 3.5); [CMM](#cmm), §4.5, Theorem 4.33, p. 35; [Co](#co), §0, Main theorem 0.1, p. 1.)

The construction proceeds as follows. For a connective pullback A→B, A′→B′, Land–Tamme’s main theorem supplies the correction algebra A′⊙_A^{B′}B and a map from that algebra to B′. When π₀(A′⊗_A B)→π₀B′ is an isomorphism, the correction map is a π₀-isomorphism, so truncating E identifies its value with E(B′). It does not replace the A′ corner. For nil-invariance reduce the nilpotent ideal by finite induction to I²=0, then use Land–Tamme Corollary 3.5, p. 29, and its auxiliary correction-ring pullbacks. Truncation alone does not give a direct factorization A→A/I through rings with equal π₀. Apply this to Kinv using §4.18 (K^inv is truncating), and to the rational obstruction using §4.17 (Goodwillie's rational theorem).

Also establish GeneralAlgebraicKTheory Layers 8 and 13 records that K itself fails excision: the failure is detected by TC (and rationally by HC). For the Milnor square of k[x,y]/(xy) → k[x] × k[y] over k, the excision failure of K equals that of TC.

*Needs:* §4.18 (K^inv is truncating); §4.9 (Localizing and truncating invariants); §4.17 (Goodwillie's rational theorem); GeneralAlgebraicKTheory §8.10; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6.

### 4.19 Assembly and low-degree symbols

**The TC assembly map for C_p.** Let R be a connective E_1-ring spectrum and p a prime. Hesselholt–Nikolaus Theorem 1.4.1 gives a natural cofiber sequence TC(R;ℤ_p)⊗Σ^∞_+BC_p → TC(R[C_p];ℤ_p) → Σ(THH(R;ℤ_p)_{hT_p})⊗C_p, where C_p is pointed at 1 (noncanonically p−1 copies of the suspended homotopy-orbit term). Keep p-completed coefficients and the circle T_p of the source. The separate extension to arbitrary R used in LMMT Corollary 4.30 is a T(n)-localized statement for n≥2, not this integral connective formula.

Throughout this statement, R connective E_1; p prime; coefficients ℤ_p for the cofiber formula. The LMMT extension has its own T(n), n≥2 hypotheses.

([HN](#hn), §1.4 'Group rings', Theorem 1.4.1, p. 34; [LMMT](#lmmt), §3, Remark 3.9, p. 16 (uses Corollary 4.30, p. 24).)

The construction proceeds as follows. THH(R[C_p]) ≃ THH(R) ⊗ Σ^∞_+LBC_p as cyclotomic spectra (§2.11 (THH of spectral and stable ∞-categories), §2.11 (THH and TC of spherical group rings and loop spaces)), with LBC_p = ⊔_{g ∈ C_p} BC_p. Compute TC via §2.10 (The Nikolaus–Scholze formula for TC); the non-identity components and the Tate terms are modules over THH(R)^{tC_p}-type objects, Use the Tate orbit lemma with connective THH(R) for the residual circle comparison, together with induced Tate vanishing. The cyclotomic tensor decomposition uses symmetric monoidality of THH.

Also establish For R=S, the first arrow of the p-completed cofiber sequence is the assembly map TC(S;ℤ_p)⊗Σ^∞_+BC_p → TC(S[C_p];ℤ_p); the cofiber formula alone asserts no injectivity.

*Needs:* §2.11 (THH and TC of spherical group rings and loop spaces); §2.10 (The Nikolaus–Scholze formula for TC); BordismFormalGroups §F6.5 (the induced-object tensor ideal and Tate vanishing); AInfCohomology §AI.7.2 (`AInf.Trace.tateOrbit`); §2.9 (THH is symmetric monoidal; THH of E_∞-rings).

**Low-degree tests: dual numbers and truncated polynomials.** For a commutative ring k and the split square-zero extension k[ε] → k, the splitting identifies π_nK(k[ε],(ε)) with ker(K_n(k[ε])→K_n(k)) for every n≥0, and the connecting maps of the relative long exact sequence vanish. In degree 1, π_1K(k[ε],(ε)) ≅ (1 + εk)^× ≅ k. In degree 2, ker(K_2(k[ε]) → K_2(k)) is generated by the images of the Dennis–Stein symbols ⟨x,a⟩ with x ∈ εk and a ∈ k[ε], by the classical relative exact sequence and the square-zero generation of K2SymbolsBrauer §§13.7 and 13.12; when 2 ∈ k^×, van der Kallen's isomorphism K_2(k[ε],(ε)) ≅ Ω¹_{k/ℤ} sends D(aε,b) to a·db with the Dennis–Stein convention of the supplier (K2SymbolsBrauer §13.13). For ℚ ⊆ k this is compatible with K_2(k[ε],(ε)) ≅ HC_1(k[ε],(ε)) of §4.17 (Goodwillie's rational theorem) and with the Dennis trace to relative HH_2. For k[t]/(t^n) the relative K_1 is (1 + tk[t]/t^n)^×, whose image under the Dennis trace is d log.

Throughout this statement, k commutative; 2 ∈ k^× for van der Kallen's description; ℚ ⊆ k for the comparison with HC_1. Classical K_2 is π_2 of connective K by KTheoryLowDegrees §§13.2–13.4.

([LT](#lt), §3, Example 3.8, p. 30.)

The construction proceeds as follows. The section k → k[ε] splits every map K_n(k[ε]) → K_n(k), so the relative homotopy groups are the kernels and the connecting maps are zero. Compute relative K_1 directly (units). For relative K_2 use the supplied Dennis–Stein generation and van der Kallen's isomorphism through K_2 = π_2K. Apply the Dennis trace formulas (§4.10 (The Dennis trace)) and §4.17 (Goodwillie's rational theorem) over ℚ.

Also establish K_1(ℚ[ε], (ε)) ≅ ℚ ≅ HC_0(ℚ[ε], (ε)). For k = ℤ the hypothesis 2 ∈ k^× cannot be dropped: K_2(ℤ[ε],(ε)) = ℤ/2 while Ω¹_{ℤ/ℤ} = 0 (K2SymbolsBrauer §13.13). The full calculation of K_*(k[t]/t^n,(t)) is not a target here.

*Needs:* §4.10 (The Dennis trace); §4.17 (Goodwillie's rational theorem); K2SymbolsBrauer §13.1 — Dennis–Stein symbols; K2SymbolsBrauer §13.7 — relative Steinberg group and relative K₂; K2SymbolsBrauer §13.12 — square-zero generation; K2SymbolsBrauer §13.13 — dual numbers with two invertible; KTheoryLowDegrees §§13.2–13.4.

### 4.20 Continuous K-theory of almost modules

**Continuous K-theory of almost modules.** Let A be a commutative Banach ring with topologically nilpotent unit T and compatible n-th roots for an unbounded increasing sequence n_i. Put I=A_<1. For any commutative unitization B in which I is an ideal, I is flat and idempotent over B (hence Tor-unital), D(B) → D(B/I) is a strongly continuous Verdier localization, and its kernel is the dualizable stable category D(B^a) of almost B-modules relative to I. Kcont(D(B^a))≃fib(K(B) → K(B/I)), independently of B, because this kernel identifies with the derived category of firm I-modules M with M⊗^L_I I≃M. K denotes the imported concrete nonconnective theory.

([S-Ber](#s-ber), §8, almost-module paragraph before Proposition 8.7, pp. 46–47.)

The construction proceeds as follows. The roots of T identify I with a filtered colimit of copies of B with transitions T^(1/n_i−1/n_(i+1)), proving flatness and idempotence. Thus B/I is an idempotent derived B-algebra and the localization kernel is dualizable; identify it with firm I-modules using the same colimit. Apply the continuous localizing invariant to the strongly continuous exact sequence. This gives both the fiber and unitization independence without redefining K.

Also establish For I=0 the kernel and Kcont are zero. The theorem requires the specified root and unit hypotheses; a general Banach-ring maximal ideal need not be flat idempotent. The fiber is a spectrum equivalence with the inclusion and quotient maps.

*Needs:* §4.5 (Continuous extensions of localizing invariants); §4.1 (Relative dualizable presentable stable categories); GeneralAlgebraicKTheory §13.1 — nonunital rings and unitisation; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6 — nonconnective spectrum and derived invariance.

### Examples

In D(k), with tensor unit k compact, a map k→k is trace-class: its dual is the usual one-dimensional dual and evaluation is scalar multiplication. On the discrete countable sum ⊕ₙk, the identity is not finite-rank and cannot factor through a dualizable finite-dimensional object. This tests the trace-class factorization rather than treating all endomorphisms as trace-class. Dropping compactness of the unit is not licensed by the generation criterion.

For A=Hk and M=Hk in degree zero, the first-order relative K-theory functor on the square-zero extension A⊕M has linear term ΣTHH(A;M). Its first possible homotopy is in degree 1, whereas ΩTHH would put it in degree −1. This is the suspension witness for the derivative. For a characteristic-zero field k, a dual-number unit 1+aε maps under the relative Dennis trace to a dε. The ideal (ε) is nilpotent, so the DGM square applies; the ideal (p) in Zₚ is not nilpotent, and the same argument alone proves neither henselian rigidity nor continuity K(Zₚ)≃limₙK(Z/pⁿ). A limit of the finite nilpotent squares is the limit square specified above and retains its Milnor lim¹ terms.

### Dependencies

Earlier layers 1, 2. Use the named Mathlib and Tau Ceti inputs under the supplier contracts; external contracts: CrystallineCohomology CR.4; EnhancedDerivedSheaves E0; EnhancedDerivedSheaves E5:abstract; EnhancedDerivedSheaves E5:presentability; GeneralAlgebraicKTheory §3.2; GeneralAlgebraicKTheory §§3.12–3.14; GeneralAlgebraicKTheory Layers 5–6; GeneralAlgebraicKTheory §§5.1–5.11; GeneralAlgebraicKTheory Layers 8 and 13; GeneralAlgebraicKTheory §§10.10–10.11, 11.15–11.16 and 13.6; GeneralAlgebraicKTheory §§7.1–7.6; K2SymbolsBrauer §§13.1, 13.7, 13.12–13.13; KTheoryLowDegrees §§13.2–13.4; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; StableHomotopyKTheory Layer 7. The individual statements above identify the required comparison or functoriality, not merely a shared object name.

## Layer 5: Stable Adams operations and relative K-coefficients

Construct the Snaith comparison and coherent localized operations, then calculate oriented relative Hochschild coefficients. Adams operations on the periodic spectrum are localized at their index; rational graded HKR keeps the internal Bott degree.

### 5.1 Snaith localization and stable operations

**Snaith construction of stable Adams operations.** Equip CP∞=K(Z,2) with its E∞ tensor-product multiplication. Snaith gives an E∞ equivalence Σ∞_+CP∞[β^{-1}]≃KU. Multiplication by k on K(Z,2) induces an E∞ endomorphism sending β to kβ. After inverting k and β, the universal property of E∞ localization therefore gives ψ^k:KU[1/k]→KU[1/k]. It agrees with L↦L^k on line bundles and hence with the classical Adams operation by the splitting principle. The identity and composition homotopies come from multiplication maps of K(Z,2).

Throughout this statement, k a nonzero integer; ψ^k is periodic only after k is inverted. For k=−1 nothing needs to be inverted, since −β is a unit.

([EC2](#ec2), §6.5, Theorem 6.5.1 and proof, pp. 273–275.)

The construction proceeds as follows. Apply Σ∞_+ to the coherent multiplication map of K(Z,2). Its map on π₂ sends the Bott class to k times itself. Invert k, then invert β using the E∞ universal property. Check line bundles and use splitting to identify classical Adams operations.

Provide the following operations and identities.

- `ComplexKTheory.snaithModel`: Σ∞_+CP∞[β^{-1}]≃KU as E∞ rings.
- `ComplexKTheory.snaithPower`: The E∞ map induced by multiplication by k on K(Z,2).
- `ComplexKTheory.snaithAdams`: Localized E∞ endomorphism with β↦kβ and L↦L^k.
- `ComplexKTheory.snaithConjugation`: For k=−1, an integral E∞ involution ψ^{−1} of KU with β↦−β; the action of {±1} on K(Z,2) makes it an action of C₂ on the E∞-ring KU.

**Checks.**

- `ComplexKTheory.snaithAdams.one`: ψ¹ is the identity.
- `ComplexKTheory.snaithAdams.bott`: For k=2, β maps to 2β in KU[1/2].
- `ComplexKTheory.snaithAdams.integral_obstruction`: No integral unital periodic ring map can send invertible β to 2β, since 2β is not a unit.
- `ComplexKTheory.snaithConjugation.homotopy`: ψ^{−1} acts on π_{2i}KU by (−1)^i; it is not the identity, and its square is the identity.

*Needs:* GeneralizedCohomology G5.4; GeneralizedCohomology G5.4 and G2.8; TopologicalKTheory T5.1; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5.

**Coherent stable lifts of the supplied Adams operations.** Lift the degree-zero operations of TopologicalKTheory T2.5 to the localized E∞ coefficient spectra. Their space-level shadows are represented by H-maps ψ^k : ℤ × BU → ℤ × BU (unique up to homotopy since K^1 of finite skeleta of BU vanishes and lim¹ vanishes on the Grassmannian tower), with ψ^jψ^k ≃ ψ^{jk}, ψ^jψ^k ≃ ψ^kψ^j and ψ^k = k^i on π_{2i}(BU) ≅ K̃(S^{2i}). After inverting k they assemble to a map of E_∞-rings ψ^k : KU[1/k] → KU[1/k] with ψ^k(β) = kβ, and to an E_∞-map on ku[1/k] (stable Adams operations).

Throughout this statement, k ≥ 1; for the stable maps k is inverted.

([Ha](#hatcher), Ch. 2, §2.3, subsection 'Adams Operations', Theorem 2.20, p. 62 (proof p. 64); [GS](#gs), §1 'Introduction', §1.1 'Background and motivation', second paragraph, p. 1.)

The construction proceeds as follows. Use §5.1 (Snaith construction of stable Adams operations) and its localization universal property. Check ψ^k(β)=kβ; define the periodic operation on KU[1/k]. The operation on line bundles is L^k, so the splitting principle identifies the degree-zero classical operation. Multiplication maps of K(Z,2) provide coherent identity/composition; compare the BU H-map shadow.

Provide the following operations and identities.

- `BU.adams`: ψ^k : ℤ × BU → ℤ × BU, an H-map.
- `BU.adams_homotopy`: π_{2i}(ψ^k) = k^i.
- `BU.adams_comm`: ψ^jψ^k ≃ ψ^{jk} ≃ ψ^kψ^j.
- `KU.adams`: ψ^k : KU[1/k] → KU[1/k] as E_∞-maps with ψ^k(β) = kβ.

**Checks.**

- `BU.adams_one`: ψ^1 ≃ id.
- `KU.adams_bott`: ψ^2(β) = 2β in π_2KU[1/2].
- `KU.adams_not_integral`: ψ² does not extend to an E_∞-self-map of KU itself compatible with ψ²(β) = 2β and an inverse of β: on π_{−2}KU it would have to be multiplication by 1/2.

Also establish π_{2i}ψ^k = k^i on π_{2i}KU[1/k]. ψ^1 = id.

*Needs:* TopologicalKTheory T2.5; TopologicalKTheory T1.6, T2.1 and T4; GeneralizedCohomology G5.4; GeneralizedCohomology G5.4 and G3.8; §5.1 (Snaith construction of stable Adams operations).

### 5.2 Rational graded HKR and relative THH

**Graded polynomial and Laurent HKR for ku and KU.** For P=Q[β], |β|=2 and differential zero, the derived Hochschild mixed object is P⊗Λ(σβ), |σβ|=3, b=0, B(β^j)=jβ^{j−1}σβ for j≥0 and B(β^jσβ)=0. Its chain groups are Q in nonnegative even degrees and odd degrees at least 3, and zero otherwise. For A=Q[β,β^{-1}], localization gives A⊗Λ(δ), |δ|=1, δ=β^{-1}σβ, and B(β^j)=jβ^jδ for j∈ℤ. These are the rational ku and KU mixed models; both have Bβ≠0. Ordinary degree-zero smooth HKR is insufficient.

Throughout this statement, Characteristic zero; graded dg tensors and Koszul signs. Invert β only in the Laurent case.

([EC2](#ec2), Theorem 6.5.1, pp. 273–275, supplies the Snaith coefficient model; [Ke](#ke), §§2.1–2.3, pp. 5–7, supplies mixed DG formalism. The displayed graded HKR formula is the Koszul diagonal computation below.)

The construction proceeds as follows. Use the stated rational E∞/commutative-dg comparison to identify ku_Q with Q[β] and KU_Q with its Bott localization. Resolve the polynomial graded diagonal by the Koszul generator for β⊗1−1⊗β. The Hochschild suspension σβ has degree 3, giving the polynomial mixed model with b=0 and B=d. Localize the resolution at β and set δ=β^{-1}σβ of degree 1. The graded Leibniz rule gives Bβ^j=jβ^jδ also for negative j.

Also establish For Q[β], the Hochschild algebra is Q[β]⊗Λ(dβ), with |β|=2 and |dβ|=3 in total homological degree. For Q[β±¹] it is Q[β±¹]⊗Λ(dβ). In both, (dβ)²=0; treating dβ as another even polynomial generator fails already in degree 6.

*Needs:* §1.2 (Mixed complexes); §1.3 (Derived category of mixed complexes); DerivedDeRhamCohomology Layer 0; DerivedDeRhamCohomology Layer 1; DGAInfinity Layer 8 (ordinary Hochschild chains and Morita comparison); EnhancedDerivedSheaves E5:spectra-comparison.

**THH relative to ku and KU.** For an E_1-ring S_R (for instance a spherical lift, §6.1 (Spherical lifts and the base hypotheses)) the base-change equivalences of §2.8 (THH relative to an E_∞-ring) give THH(ku ⊗ S_R/ku) ≃ ku ⊗ THH(S_R) and THH(KU ⊗ S_R/KU) ≃ KU ⊗ THH(S_R), T-equivariantly with T acting trivially on ku and KU; in particular THH(ku/ku) ≃ ku and THH(KU/KU) ≃ KU with trivial action, so TC⁻(ku/ku) = ku^{hT} with π_* = ℤ[β][[t]] (§5.3 (ku and KU with circle and cyclic-group actions)). Absolute THH(ku) differs: it is not ku ⊗ THH(S) = ku, since rationally THH(ku) ⊗ ℚ ≃ HH(ℚ[β]/ℚ) has the class dβ in degree 3, so π_3THH(ku) ⊗ ℚ ≠ 0. Relative THH over ku carries no cyclotomic Frobenius unless the ku-structure is twisted (Wagner's cyclonic structure, §6.11 (Cyclonic ku and KU)).

Throughout this statement, S_R an E_1-ring; ku and KU with the E_∞-structures of GeneralizedCohomology G5.4 and its connective cover in GeneralizedCohomology G5.4 and G3.8.

([W](#w), §3.1 'Solid THH', p. 25.)

The construction proceeds as follows. Apply THH(A ⊗ k/k) ≃ THH(A) ⊗ k for an E_∞-ring k and an E_1-ring A (§2.8 (THH relative to an E_∞-ring), base change of cyclic bar constructions) with k = ku, KU (Wagner 1.12). THH(S) ≃ S gives THH(ku/ku) ≃ ku; the circle acts trivially on the base change factor. Use the graded polynomial half of §5.2 (Graded polynomial and Laurent HKR for ku and KU): ku_Q corresponds to Q[β], |β|=2; its Hochschild generator σβ has degree 3 and Bβ=σβ. Thus π₃THH(ku)_Q=Q. The ordinary degree-zero smooth theorem does not justify this graded calculation.

Also establish THH(ku ⊗ S[x]/ku) ≃ ku ⊗ Σ^∞_+B^{cyc}ℕ-type decomposition by weight (Raksit's example, §6.10 (The framed comparison (Raksit; Wagner Theorem 6.10)), Check `framedTrace.line`). THH(ku/ku) ≃ ku with trivial T-action.

*Needs:* §2.8 (THH relative to an E_∞-ring); §2.7 (Topological Hochschild homology of an E_1-ring); GeneralizedCohomology G5.4; GeneralizedCohomology G5.4 and G3.8; §5.2 (Graded polynomial and Laurent HKR for ku and KU); EnhancedDerivedSheaves E5:spectra-comparison.

### 5.3 Oriented circle and finite Tate coefficients

**ku and KU with circle and cyclic-group actions.** For ku with trivial T-action: π_*(ku^{hT}) ≅ ℤ[β][[t]] with |β| = 2, |t| = −2, where q ∈ π_0(ku^{hT}) ≅ ku^0(BT) is the class of the standard representation and t is the complex orientation with q − 1 = βt (q is strict: it comes from an E_∞-map S[q] → ku^{hT}); the formal group law of ku is x + y + βxy. Then π_*(ku^{tT}) ≅ ℤ[β]((t)), and p-adically π_*(ku^{tC_p}) ≅ π_*(ku^{tT})/[p]_q with [p]_q = (q^p − 1)/(q − 1), so π_0(ku_p^{tC_p}) ≅ ℤ_p[ζ_p] with q ↦ ζ_p; the Tate-valued Frobenius of ku_p with trivial cyclotomic structure sends β to (ζ_p − 1)u with u = t^{−1}. After inverting β, π_0(KU^{hT}) ≅ ℤ[[q − 1]]. The genuine C_m-fixed points of ku used for cyclonic spectra are in §6.11 (Cyclonic ku and KU).

Throughout this statement, Trivial T-action on ku, KU; complex orientation of ku from GeneralizedCohomology G5.4 (Snaith).

([W](#w), §1.3, Notation and conventions 1.16(e) 'Homotopy classes of ku^{hS^1}', p. 9; [W](#w), §4.2, proof of Theorem 4.16, pp. 43-44; [DR](#dr), §1.2, Proposition 1.2.5 (second part), p. 10.)

The construction proceeds as follows. Homotopy fixed point spectral sequence H^*(BT; π_*ku) ⇒ π_*ku^{hT} degenerates (even); t is the Euler class of the tautological line bundle, and the ku-Euler class of the C_m-representation is [m]_{1+βt}·t. Tate constructions: invert t (T) or kill the Euler class (C_m) (AInfCohomology §AI.7.2 (Circle actions, homotopy fixed points and Tate constructions), BordismFormalGroups §F6.5 (finite-group Borel norm and Tate cofiber)).

Also establish Setting β = 0 recovers π_*(HZ^{hT}) = ℤ[t] (ku → HZ). For m = 1, [1]_q = 1.

*Needs:* GeneralizedCohomology G5.4 (with TopologicalKTheory T4); GeneralizedCohomology G5.4 and G3.8; §2.1 (Homotopy orbits and homotopy fixed points); AInfCohomology §AI.7.2 (Circle actions, homotopy fixed points and Tate constructions); BordismFormalGroups §F6.5 (finite-group Borel norm and Tate cofiber).

### Examples

A unital periodic ψ² with β↦2β needs 1/2 because its value on β⁻¹ must be β⁻¹/2. The localized E∞ construction in §5.1 supplies that operation coherently.

For the rational absolute Hochschild object, Bβ=σβ is nonzero in degree 3. Relative THH(ku/ku) instead equals ku with trivial circle action. This separates the relative coefficient construction from the absolute one even before completion. In the oriented formula q−1=βt, the p=2 cyclotomic factor [2]q=q+1 specializes to 2 at q=1 and to zero at q=−1; its quotient is not formed by dividing by q−1 at q=1.

### Dependencies

Earlier layers 1, 2. Use the named Mathlib and Tau Ceti inputs under the supplier contracts; external contracts: TopologicalKTheory T1.6, T2–T5; CharacteristicClasses C3, C5, C6; DerivedDeRhamCohomology Layer 0; DerivedDeRhamCohomology Layer 1; EnhancedDerivedSheaves E5:spectra-comparison; GeneralizedCohomology G2.1; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; StableHomotopyKTheory Layer 7. The individual statements above identify the required comparison or functoriality, not merely a shared object name.

## Layer 6: Even filtrations, q-Hodge and Habiro comparisons

Build the ordinary and solid even sites before using descent. Bousfield localization and the K(1)-local sphere are constructed in §6.8 before the image-of-J comparisons. The q-Hodge comparison takes compatible spherical lifts as input, treats the prime two separately, and passes from connective cyclonic coefficients to KU by Bott localization. For framed smooth algebras it is computed explicitly by a Čech resolution in q-divided powers.

### 6.1 Spherical bases and compatible global lifts

**Spherical lifts and the base hypotheses.** Fix a prime p. (Base, Wagner 3.1) A is a p-complete, p-completely perfectly covered δ-ring with a p-complete connective E_∞-ring S_A, S_A ⊗_{S_p} ℤ_p ≃ A, whose Tate-valued Frobenius lifts φ on π_0 and carries an S¹-equivariant E_∞-structure (trivial action on S_A, residual S¹/C_p-action on S_A^{tC_p}), making S_A a p-cyclotomic base; ku_A := (ku ⊗ S_A)^∧_p. (Ring, Wagner 3.2) R is a p-complete A-algebra with bounded p^∞-torsion, p-quasi-lci over A (L_{R/A} of p-complete Tor-amplitude in homological degrees [0,1]), satisfying either (E_2): a p-complete connective E_2-algebra S_R in S_A-modules with S_R ⊗_{S_A} A ≃ R, or (E_1): R p-torsion free with a p-quasi-syntomic cover R → R_∞, R_∞/p relatively semiperfect over A, and an E_1-lift S_R → S_{R_∞}^• of the Čech nerve; ku_R := (ku ⊗ S_R)^∧_p. (Global, Wagner 4.18) A a perfectly covered Λ-ring with these lifts at every prime, R quasi-lci over A with bounded p^∞-torsion for all p, a per-prime choice of (E_2)/(E_1), and the addendum (R_2): R̂_2 satisfies (E_1) (automatic when 2 ∈ R^×); the lifts glue to S_A (E_∞) and S_R (E_1, or E_2 if (E_2) is chosen at every p) with S_R ⊗ ℤ ≃ R. For A = ℤ, Theorem 1.2's hypothesis is: R quasi-syntomic with 2 ∈ R^× and a connective E_2-ring S_R with S_R ⊗ ℤ ≃ R. A lift merely to an E_1- or E_2-ku-algebra is not a spherical lift.

Throughout this statement, p fixed for the p-complete conditions; the global condition quantifies over all primes.

([W](#w), §3 preamble, 3.1 'Assumptions on A', condition (tCp), p. 24; [W](#w), §4.4, 4.18 (after (A),(R)), p. 46; [W](#w), §1.1, Theorem 1.2 (see Theorem 4.27), p. 3.)

The construction proceeds as follows. Record the conditions as data: S_A ∈ CAlg(Sp^∧_p) with the stated Frobenius structure, S_R ∈ Alg_{E_2}(Mod_{S_A}) or the E_1-Čech-nerve datum. Glue the per-prime lifts with the rational lift by the arithmetic fracture square (Wagner 4.18; the gluing is asserted there without proof and is recorded as a step here). Examples: étale-framed smooth algebras have canonical E_∞-lifts (Wagner Example 6.7, via Lurie HA 7.5); Burklund's quotients S_{S,□}/(y_i^{α_i}) give E_2-lifts of S/(y^α) (Example 6.8).

Provide the following operations and identities.

- `SphericalLift`: S_R with an equivalence S_R ⊗ ℤ ≃ R (E_1 or E_2 recorded as a parameter).
- `CyclotomicBase`: (A, S_A) satisfying Wagner 3.1(tC_p).
- `SphericalLift.kuLift`: ku_R := ku ⊗ S_R, ku_A := ku ⊗ S_A (p-completed in the local case).
- `SphericalLift.ofEtale`: Étale (and étale-framed smooth) A-algebras have canonical E_∞-lifts.
- `SphericalLift.glue`: Per-prime lifts and the rational lift glue to a global S_R (E_1, or E_2 if (E_2) at every p).

**Checks.**

- `SphericalLift.polynomial`: S[x] is an E_∞-lift of ℤ[x].
- `SphericalLift.base`: S itself lifts ℤ (A = R = ℤ).
- `SphericalLift.ku_not_enough`: R = ℤ_p{x}_∞/x has an E_1-ku-algebra lift but the resulting filtration is not a q-deformation of the Hodge filtration (Wagner 1.11): a lift to ku is not a spherical lift.

Also establish R = ℤ[x] with S_R = S[x] satisfies (E_2) at every prime. R = 𝔽_p does not satisfy 3.2(E_1): it is not p-torsion free.

*Needs:* GeneralizedCohomology G2.8 and StableHomotopyKTheory Layer 5; DerivedDeRhamCohomology Layer 0 — quasisyntomic condition; HabiroRings HR.1 — perfectly covered; StableHomotopyKTheory §7.23; StableHomotopyKTheory §§7.14–7.18.

**Compatible local and global spherical lifts.** The global input consists of a perfectly covered Λ-ring A, a quasi-lci A-algebra R, bounded p-power torsion for each p, and for every prime compatible p-complete choices satisfying Wagner 3.1(tC_p) and either 3.2(E₂) or 3.2(E₁). An E₂ choice is a connective E₂ lift S_R over S_A reducing to R; an E₁ choice includes the p-torsion-free ring, the p-quasisyntomic semiperfect cover and the lifted coherent Čech diagram. The local diagrams carry reduction equivalences and rational identifications used in the arithmetic gluing. The global result is a connective E₁ lift, with E₂ refinement only when all local choices are E₂. The addendum R₂ is an E₁ choice at p=2; it is automatic when 2 is invertible. This is a family of compatible structured lifts, not a list of underlying spectra.

Throughout this statement, Wagner 4.18(A),(R); addendum 4.18a(R₂) when used.

([W](#w), 3.1–3.2, pp. 24–25; 4.18, p. 46; 4.18a, p. 48.)

The construction proceeds as follows. Construct each local branch and its Čech data. Keep rational identifications and reduction maps. Construct the arithmetic gluing equivalence, including the compatible rational identifications and Čech descent; these coherences are a separate obligation in this construction.

Provide the following operations and identities.

- `QHodgeTrace.CompatibleSphericalLifts`: Local tC_p bases, E₂/E₁ branches, coherent reductions and rational comparison data.
- `QHodgeTrace.CompatibleSphericalLifts.localChoices`: Project the complete local input for a prime.
- `QHodgeTrace.CompatibleSphericalLifts.glue`: Arithmetic-glued connective lift and its reduction equivalence.
- `QHodgeTrace.CompatibleSphericalLifts.e2`: E₂ refinement when every branch is E₂.

**Checks.**

- `QHodgeTrace.CompatibleSphericalLifts.invert_two`: A=R=Z[1/2] has the canonical localization lifts; the p=2 input is trivial.
- `QHodgeTrace.CompatibleSphericalLifts.polynomial`: Polynomial lifts over the toric spherical base satisfy the local reduction conditions.
- `QHodgeTrace.CompatibleSphericalLifts.not_arbitrary`: For R=ℤ_p{x}_∞/x, the E₁ ku-lift in [W](#w), Paragraph 1.11, p. 5, does not produce a q-deformation. Thus even an existing ku-lift cannot replace the spherical reductions and lifted cover required here.

*Needs:* §6.1 (Spherical lifts and the base hypotheses); HabiroRings HR.1 — perfectly covered; DerivedDeRhamCohomology Layer 0 — quasisyntomic condition; EnhancedDerivedSheaves E0; StableHomotopyKTheory §7.23.

### 6.2 Light solid spectra and module nuclearity

**Light condensed and solid spectra.** Light condensed spectra Cond(Sp) are sheaves of spectra on light profinite sets; the discrete embedding X ↦ X̲ is fully faithful and symmetric monoidal. With Null := cofib(S[{∞}] → S[ℕ ∪ {∞}]) and σ its shift, solid spectra Sp_■ ⊆ Cond(Sp) are the objects M for which 1 − σ* induces an equivalence on Hom(Null, M); Sp_■ is closed under limits and colimits, the inclusion has a left adjoint (−)^■, the solid tensor product is M ⊗^■ N := (M ⊗ N)^■, and Null^■ ≃ ∏_ℕ S is a compact generator. p-completion (−)^∧_p : Sp^∧_p → Sp_■ is fully faithful and symmetric monoidal on bounded-below objects. This extends VStackSheavesAndLisseCategories VS2's solid abelian groups (Clausen–Scholze) from modules to spectra in the light setting used by Wagner.

Throughout this statement, Light profinite sets are second-countable compact Hausdorff totally disconnected spaces. Wagner’s light solid spectral extension relies on Clausen–Scholze lectures rather than a published construction.

([W](#w), §2 preamble, paragraph 2.1 'Solid condensed recollections', p. 11; [W](#w), §2, paragraph 2.1, p. 11; [W](#w), §2, paragraph 2.2 'Solid condensed spectra and p-completions', p. 11.)

The construction proceeds as follows. Define Cond(Sp) as hypercomplete sheaves on light profinite sets with values in Sp; import solid abelian groups from VS2 and define Sp_■ by the Null-sequence condition. Construct the solidification left adjoint and solid tensor product; show Null^■ ≃ ∏_ℕ S generates. Prove the p-complete bounded-below comparison (Wagner 2.2).

Provide the following operations and identities.

- `SolidSpectrum`: Sp_■ ⊆ Cond(Sp).
- `SolidSpectrum.solidify`: (−)^■ : Cond(Sp) → Sp_■ left adjoint to the inclusion.
- `SolidSpectrum.tensor`: M ⊗^■ N := (M ⊗ N)^■, symmetric monoidal.
- `SolidSpectrum.generator`: Null^■ ≃ ∏_ℕ S is a compact generator.
- `SolidSpectrum.ofPComplete`: p-complete bounded-below spectra embed fully faithfully and monoidally.

**Checks.**

- `SolidSpectrum.discrete`: Discrete spectra are solid.
- `SolidSpectrum.product`: Null^■ ≃ ∏_ℕ S.
- `SolidSpectrum.not_all_condensed`: The condensed spectrum S[ℕ ∪ {∞}] is not solid (its solidification is S ⊕ ∏_ℕ S-type, not itself).

Also establish For discrete X, X̲ is solid. ∏_ℕ S is solid; ⊕_ℕ S is solid but Hom_S(Null_S, S) ≃ ⊕_ℕ S is not solid perfect even.

*Needs:* VStackSheavesAndLisseCategories VS2 — solid abelian groups; EnhancedDerivedSheaves E5:presentability — presentable categories; EnhancedDerivedSheaves E5:presentability — compact objects; StableHomotopyKTheory §§7.14–7.18; VStackSheavesAndLisseCategories VS2; `LightCondMod`; `LightCondAb`.

**Trace-class maps and nuclear modules.** For an E₁ solid ring R and a left R-module M, its dual Hom_R(M,R) is a right R-module. A trace-class map M→N is classified by a map 1_{Sp■}→Hom_R(M,R)⊗^■_R N; evaluation and the ambient symmetric braiding yield M→N. Left R-modules are not generally monoidal over R. A basic nuclear module is a sequential colimit with trace-class transitions; a nuclear module has every map from each compact left module trace-class. Wagner 2.11 identifies the resulting closure and its base-change properties. Compactness means preservation of all filtered colimits by the mapping spectrum, not merely sequential ones. The comparison Hom_R(P,R)⊗_R M→Hom_R(P,M) holds for nuclear M and compact P provided tensoring any compact left R-module with any compact ambient solid spectrum preserves compactness (Wagner 2.11(d)). For commutative R this specializes to the monoidal module formulation.

Throughout this statement, R an E₁ algebra in the presentably symmetric monoidal light solid spectra category; the tensor in the classifier pairs right and left modules. The ambient category is stable and compactly generated, with compact tensor unit, as required in Wagner 2.10–2.11. Internal Homs in this paragraph are ambient solid spectra. Module-monoidal formulations require an explicit E₂/commutative refinement. For the internal Hom comparison, every compact left R-module tensored with every compact ambient solid spectrum must remain compact as a left R-module (Wagner Theorem 2.11(d)).

([W](#w), §2.2, paragraphs 2.8–2.10 and Theorem 2.11, pp. 15–17; especially 2.11(d).)

The construction proceeds as follows. Use the right R action on the dual of a left module. Classify the map by the ambient-unit morphism into the right-left relative tensor and compose evaluation. Define nuclearity by all maps from compact modules; distinguish basic nuclear sequences. Apply Wagner 2.11 to base change and compact Hom comparison.

Provide the following operations and identities.

- `TraceClass`: φ factors through a classifier 1 → Hom(M, R) ⊗ N.
- `BasicNuclear`: Sequential colimits of trace-class maps.
- `Nuclear`: The subcategory generated under colimits by basic nuclear modules.
- `Nuclear.baseChange`: S ⊗_R − preserves nuclear modules.
- `Nuclear.homCompact`: Hom_R(P,R)⊗^■_R M ≃ Hom_R(P,M) for compact P and nuclear M, under the ambient hypothesis that compact left R-modules tensored with compact solid spectra remain compact.

**Checks.**

- `Nuclear.dualizable`: Dualizable objects, in particular the unit R, are nuclear: the identity of a dualizable object is trace-class.
- `TraceClass.zero`: For arbitrary solid left R-modules M,N, the zero map M→N is trace-class, classified by zero, even when M is not dualizable.
- `Nuclear.not_all`: Compactness does not make an identity trace-class: for nonzero discrete R the compact generator Null_R ≃ ∏_ℕ R is not dualizable (its dual Hom_R(Null_R, R) ≃ ⊕_ℕ R, Wagner 2.3), so 𝟙_{Null_R} is not trace-class.

Also establish Every dualizable object is nuclear, its identity being trace-class; compact objects need not be (§6.2 (Trace-class maps and nuclear modules) test Nuclear.not_all).

*Needs:* §6.2 (Light condensed and solid spectra); EnhancedDerivedSheaves E5:presentability — compact objects; VStackSheavesAndLisseCategories VS2; `CategoryTheory.Limits.PreservesFilteredColimits`.

### 6.3 Perfect-even sites and homological evenness

**Perfect even modules and the even site.** Perf_ev(R) is the smallest full coherent subcategory of left R-modules containing every Σ^{2n}R, n∈Z, and closed under equivalences, finite extensions and retracts. A morphism P→Q is an even epimorphism when its fiber is perfect even; singleton such morphisms generate the even topology. The spectral Yoneda sheaf Y_R(M)(P)=Map_R(P,M) takes values in spectra. Its truncations are taken in the sheaf category before evaluating at R. The solid site replaces the generators by Σ^{2n}Null_R, where Null_R=R⊗■Null■, and mapping spectra by solid mapping objects. Retracts are required in both sites.

Throughout this statement, R E₁; light solid spectral framework for the solid version.

([P](#p), Definitions 2.2 and 2.4; Lemma 2.5, pp. 7–8; [W](#w), §2, paragraphs 2.3–2.4, pp. 11–12.)

The construction proceeds as follows. Generate the full subcategory with the three closure operations. Prove base change of even epimorphisms gives the pretopology. Import coherent sheafification/truncation and define Yoneda mapping sheaves.

Provide the following operations and identities.

- `QHodgeTrace.IsPerfectEven`: Closure of even free shifts under equivalences, extensions and retracts.
- `QHodgeTrace.IsSolidPerfectEven`: The same closure on even Null_R shifts.
- `QHodgeTrace.EvenSite`: Coherent perfect-even site and its singleton even-epimorphism coverage.
- `QHodgeTrace.SolidEvenSite`: Solid variant of the site.
- `QHodgeTrace.evenYoneda`: Spectral/solid sheaf of mapping objects.

**Checks.**

- `QHodgeTrace.perfectEven.unit`: R and Σ^{2n}R belong to Perf_ev(R); Null_R and its even shifts belong to the solid variant.
- `QHodgeTrace.perfectEven.retract`: Every retract of a finite extension of even free shifts is perfect even.
- `QHodgeTrace.perfectEven.not_stable`: For R=HZ, ΣHZ is not perfect even; closure under all suspensions would change the site.
- `QHodgeTrace.perfectEven.zero_cover`: An identity cover has zero perfect-even fiber.

*Needs:* GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; EnhancedDerivedSheaves E0; §6.2 (Light condensed and solid spectra).

**Homological evenness and even homotopy sheaves.** For a left module M over R, let F_M(q) be the sheafification on the even site of P↦π_{2q}Map_R(P,M), q∈(1/2)Z. M is homologically even if F_M(q)=0 for every proper half-integer q. In the solid case use sheafification of the condensed homotopy groups of the solid mapping object on the solid even site. Homotopy-even means the odd homotopy groups (or odd condensed homotopy sheaves) of M itself vanish. It implies homological evenness but is a different condition. Neither evaluating at one point nor omitting sheafification defines solid homological evenness.

Throughout this statement, Use the appropriate coherent site and its abelian/condensed sheaf category.

([P](#p), Definitions 2.9 and 2.16; Lemma 2.18, pp. 10–11; Lemma 2.36, pp. 15–16; [W](#w), §2, paragraph 2.4, pp. 12–13.)

The construction proceeds as follows. Form mapping homotopy presheaves. Sheafify before testing odd vanishing. Keep homotopy-even and homologically-even predicates distinct.

Provide the following operations and identities.

- `QHodgeTrace.evenHomotopySheaf`: Sheafification of mapping π_j on the ordinary even site.
- `QHodgeTrace.solidEvenHomotopySheaf`: Sheafification of condensed mapping π_j on the solid even site.
- `QHodgeTrace.IsHomologicallyEven`: Vanishing for all odd j after sheafification.
- `QHodgeTrace.IsSolidHomologicallyEven`: Solid variant, with condensed sheaf vanishing.
- `QHodgeTrace.IsCondensedHomotopyEven`: Odd condensed homotopy sheaves of M itself vanish.

**Checks.**

- `QHodgeTrace.homologicalEven.unit`: Every perfect-even module, in particular R over itself, is homologically even.
- `QHodgeTrace.homologicalEven.zero`: All even homotopy sheaves of zero vanish.
- `QHodgeTrace.homologicalEven.not_pi_even`: R=S is homologically even as an S-module despite π₁S=Z/2; homological evenness does not force odd homotopy to vanish.
- `QHodgeTrace.homologicalEven.discrete_even`: A discrete spectral module with even homotopy is homologically even, as in Pstrągowski Lemma 2.36.

*Needs:* §6.3 (Perfect even modules and the even site); §6.2 (Light condensed and solid spectra); EnhancedDerivedSheaves E0; VStackSheavesAndLisseCategories VS2; `LightCondMod`; `LightCondAb`.

### 6.4 Even flatness, faithful descent and duality

**Even flat and solid even flat modules.** A discrete spectral left R-module is even flat when it is a filtered colimit of perfect even modules; equivalently E⊗_R M has even homotopy for every homotopy-even right R-module E. For solid modules keep two notions distinct: solid ind-perfect even means a filtered colimit of solid perfect evens, and solid even flat means that E⊗■_R M has even condensed homotopy sheaves for every right module with even condensed homotopy sheaves. Solid ind-perfect even implies solid even flat. The converse requires nuclearity and Assumption 2.13(R); it is not asserted unconditionally. Right variants are obtained over R^op.

Throughout this statement, R E₁; tensor pairs right and left modules; filtered diagrams are coherent.

([P](#p), Proposition 4.3, pp. 30–31; Definition 4.4, p. 31; Proposition 4.14 (Lazard theorem), pp. 33–34; [W](#w), §2, paragraph 2.6, p. 14; Lemma 2.15, pp. 19–20.)

The construction proceeds as follows. Use filtered perfect-even presentations. Invoke the ordinary tensor criterion. In the solid case define flatness by condensed-homotopy tensor tests, and retain the exact converse hypotheses.

Provide the following operations and identities.

- `QHodgeTrace.IsEvenFlat`: Filtered perfect-even presentation, equivalently the right-even tensor test.
- `QHodgeTrace.IsSolidIndPerfectEven`: Coherent filtered presentation by solid perfect evens.
- `QHodgeTrace.IsSolidEvenFlat`: Vanishing of odd condensed homotopy sheaves after tensoring with every even right module.
- `QHodgeTrace.solidIndPerfectEven_to_flat`: Ind-perfect even implies solid even flat.

**Checks.**

- `QHodgeTrace.evenFlat.unit`: The free rank-one module is even flat in the spectral setting.
- `QHodgeTrace.evenFlat.zero`: Zero has a perfect-even filtered presentation.
- `QHodgeTrace.evenFlat.torsion`: HZ/p is homologically even over HZ but not even flat: tensoring with HZ/p creates the odd Tor group.
- `QHodgeTrace.solidEvenFlat.no_unconditional_converse`: The solid converse is used only with nuclearity and Assumption 2.13(R); an ordinary even Lazard equivalence does not supply it.

*Needs:* §6.3 (Perfect even modules and the even site); §6.2 (Light condensed and solid spectra); EnhancedDerivedSheaves E0.

**Faithfully even flat ring maps.** For an E₁ ring map f:R→S, Pstrągowski left faithfully even flat means S and cofib(f) are even flat as right R-modules, and cofib(f) is homologically even as a left R-module (Definition 6.15). Its opposite gives the right notion. Wagner solid faithfully even flat requires S and cofib(f) solid even flat on both sides (Definition 2.18). For commutative E∞ rings the sides identify, but the general E₁ definitions retain them. Injectivity of π_* is a consequence in suitable even cases, not the definition.

Throughout this statement, E₁ map; spectral versus solid variants distinguished.

([P](#p), Definition 6.15, Remarks 6.16–6.18 and Proposition 6.19, p. 44; [W](#w), Definition 2.18 and Theorem 2.19, p. 22.)

The construction proceeds as follows. Form S and its ring-map cofiber as bimodules. Apply the correct side-specific flatness tests. Use the definition, not a substitute injectivity predicate, in the descent theorems.

Provide the following operations and identities.

- `QHodgeTrace.IsEvenFaithfullyFlat`: Right-flatness of S and cofiber, plus left homological evenness of the cofiber.
- `QHodgeTrace.IsSolidEvenFaithfullyFlat`: Solid tensor-even tests on S and cofiber on both sides.
- `QHodgeTrace.faithfullyEvenFlat.op`: Opposite map gives the right variant.

**Checks.**

- `QHodgeTrace.faithfullyEvenFlat.identity`: Identity maps are faithfully even flat.
- `QHodgeTrace.faithfullyEvenFlat.polynomial`: HZ→HZ[x] is faithfully even flat by the free polynomial basis and free cofiber.
- `QHodgeTrace.faithfullyEvenFlat.injection_insufficient`: HZ→HQ is injective on homotopy but its cofiber H(Q/Z) is not even flat over HZ, so injectivity alone fails.

*Needs:* §6.4 (Even flat and solid even flat modules); §6.3 (Homological evenness and even homotopy sheaves).

**Solid duality assumption R.** Wagner Assumption 2.13(R) requires Hom_R(Null_R,R), naturally an R-bimodule, to be nuclear and solid ind-perfect even both as a left and as a right R-module. This is witnessed by the four side-specific properties. For a discrete E₁ ring, and for its bounded-below p-completion, Wagner Lemma 2.14 establishes the required properties. In combination with nuclearity it gives the solid even-Lazard converse used by descent.

Throughout this statement, R E₁ solid; Null_R has its natural bimodule structure.

([W](#w), Assumption 2.13, p. 18; Lemmas 2.14–2.15, pp. 18–20.)

The construction proceeds as follows. Keep the dual as a bimodule with both structures. Require nuclearity and filtered perfect-even presentations on both sides. Use Lemma 2.14 for the stated discrete and completed inputs.

Provide the following operations and identities.

- `QHodgeTrace.AssumptionR`: Four witnesses on the left and right dual of Null_R.
- `QHodgeTrace.AssumptionR.discrete`: Discrete bounded-below ring inputs satisfy the assumption.
- `QHodgeTrace.AssumptionR.pComplete`: Bounded-below p-complete discrete ring inputs satisfy the assumption.

**Checks.**

- `QHodgeTrace.assumptionR.discrete_Z`: The discrete solid HZ satisfies the four conditions.
- `QHodgeTrace.assumptionR.pComplete_Z`: The solid p-completion HZ_p satisfies the four conditions.
- `QHodgeTrace.assumptionR.matrixRing`: For the discrete noncommutative E₁ ring R=H(M₂(Z)), Hom_R(Null_R,R)≃⊕_N R as a left module and as a right module. These modules are nuclear and solid ind-perfect even by [W](#w), Lemma 2.14(a), pp. 18–19. This checks both module orders and excludes a definition that silently restricts R to commutative rings.

*Needs:* §6.2 (Trace-class maps and nuclear modules); §6.4 (Even flat and solid even flat modules).

### 6.5 Ordinary and solid even filtrations

**Even filtrations (Hahn–Raksit–Wilson and Pstrągowski).** (HRW) For an E_∞-ring E, fil^⋆_{ev}E := lim_{E → B, B even} τ_{≥2⋆}B, the right Kan extension of the double-speed Postnikov filtration from even E_∞-rings (π_* concentrated in even degrees). (Pstrągowski) For an E_1-ring R and a left R-module M, the perfect even filtration fil^⋆_{P-ev/R}M is obtained from the sheaf Hom_R(−, M) on perfect even R-modules (generated under extensions and retracts by shifts Σ^{2n}R) with the even topology, by taking double-speed sheaf truncations and evaluating at R; it is exhaustive, satisfies even faithfully flat descent after completion, and for E_∞ inputs admitting a faithfully even flat map to an even E_∞-ring agrees with HRW's filtration after completion (Pstrągowski Theorem 1.5/7.5). For E with π_*E even, both are τ_{≥2⋆}E. For quasisyntomic rings, HRW recovers the BMS2 motivic filtration on THH, TC⁻, TP and TC.

Throughout this statement, R an E_1-ring (Pstrągowski); E an E_∞-ring (HRW).

([P](#p), §2.3, Definition 2.21, p. 12; [HRW](#hrw), §1.1, Definition 1.1.1, p. 2 (precise version: Construction 2.1.3, pp. 11-12); [W](#w), §1.1, paragraph 1.7 'Even filtrations', p. 4.)

The construction proceeds as follows. Define both filtrations (HRW Definition; Pstrągowski). Prove flat descent and the comparison (Pstrągowski). Record the comparison with BMS2 for quasisyntomic rings (HRW).

Provide the following operations and identities.

- `evenFiltration`: fil^⋆_ev E for E_∞-rings (HRW).
- `perfectEvenFiltration`: fil^⋆_{P-ev/R}M for an E_1-ring R and left R-module M.
- `perfectEvenFiltration.even`: If either R or M has homotopy concentrated in even degrees, the perfect even filtration of M is τ_{≥2⋆}M (Pstrągowski §§2.4–2.5); no flatness condition is required for this assertion.
- `perfectEvenFiltration.descent`: For a faithfully even flat map of E₁-rings R→S, compare the completed filtrations of the Čech terms S^{⊗_R(n+1)}⊗_R M as R-modules over the fixed base R (Theorem 6.26). Varying the base ring to S^n needs an E₂ structure and the algebra descent theorem 6.27.
- `perfectEvenFiltration.compare_HRW`: For an E_∞-ring admitting a faithfully even flat map to an even E_∞-ring, the perfect even and HRW filtrations agree after completion (Theorem 1.5/7.5).
- `perfectEvenFiltration.exhaustive`: Pstrągowski's filtration is always exhaustive.
- `perfectEvenFiltration.algebraDescent`: If R→S has the E₂ algebra structure required by Pstrągowski Theorem 6.27, completed fixed-base filtration can be compared with the varying-ring Čech filtration.

**Checks.**

- `evenFiltration.even_ring`: fil^⋆_ev ku = τ_{≥2⋆}ku, gr^n = Σ^{2n}H(π_{2n}ku).
- `evenFiltration.zero`: The even filtration of 0 is 0.
- `evenFiltration.not_postnikov`: For E = S the even filtration is not the double-speed Postnikov filtration: by MU-descent fil^⋆_ev S is the (décalé) Adams–Novikov filtration, whose associated graded is the Adams–Novikov E_2-page, not π_*S.

Also establish For E = ku (even), fil^⋆_{ev}ku = τ_{≥2⋆}ku. For E = HZ^{hT}, fil_ev^q=τ_{≥2q}(HZ^{hT}); this is not the t-adic filtration: τ_{≥0} retains π_0, whereas (t) removes its degree-zero generator.

*Needs:* GeneralizedCohomology G3.8; GeneralizedCohomology G2.8 and StableHomotopyKTheory Layer 5; §2.7 (Topological Hochschild homology of an E_1-ring); §6.3 (Perfect even modules and the even site); §6.4 (Even flat and solid even flat modules); §6.3 (Homological evenness and even homotopy sheaves); §6.4 (Faithfully even flat ring maps).

**The solid even filtration.** For an E_1-algebra R in solid spectra Sp_■ and a left R-module M, the solid even filtration fil^⋆_{ev/R}M is the value at R of the double-speed sheaf truncations of the Sp_■-valued sheaf Hom_R(−, M) on solid perfect even R-modules Perf_ev(R_■) (generated under extensions and retracts by Σ^{2n}Null_R, Null_R := R ⊗^■ Null^■), with covers the maps with solid perfect even fibre. It is lax monoidal (Wagner 2.5); the Whitehead-tower comparison holds when M has even condensed homotopy sheaves (Wagner 2.4); evenness only after evaluating the solid object on a point is not this condition; for discrete homologically even inputs it agrees with Pstrągowski's filtration (Wagner Corollary 2.17); and it satisfies solid faithfully even flat descent for nuclear S over R up to completion (Theorems 2.19, 2.20).

Throughout this statement, For the Whitehead comparison require even condensed homotopy sheaves of M. For solid descent require Assumption R, nuclear S over R, both-sided solid faithful even flatness, and nuclear solid homologically even M; compare completed filtrations. Any module tensor monoidal statement has an explicit E₂/commutative refinement; general E₁ duality uses right-left pairing.

([W](#w), §2.1, paragraph 2.4 'The solid even filtration', p. 12; [W](#w), §2.3, Corollary 2.17, p. 21; [W](#w), §2.4, Theorem 2.19, p. 22.)

The construction proceeds as follows. Define the site and sheaf (Wagner 2.3–2.4) and the monoidal structure (2.5). Compare with Pstrągowski (Corollary 2.17). Prove descent (Theorems 2.19–2.20) using §6.2 (Trace-class maps and nuclear modules).

Provide the following operations and identities.

- `solidEvenFiltration`: fil^⋆_{ev/R}M in filtered solid spectra.
- `solidEvenFiltration.laxMonoidal`: Lax monoidal in (R, M).
- `solidEvenFiltration.even`: When M has even condensed homotopy sheaves, its solid even filtration is its double-speed Whitehead tower.
- `solidEvenFiltration.compare_pstragowski`: Agrees with Pstrągowski's filtration on discrete homologically even modules.
- `solidEvenFiltration.descent`: Completed Čech descent under Assumption R, both-sided solid faithful even flatness, nuclear S and nuclear solid homologically even M. The Čech terms are filtered as modules over the fixed base R (Wagner Theorem 2.19); a varying-base algebra diagram requires its separate multiplicative refinement.

**Checks.**

- `solidEvenFiltration.even_ring`: fil^⋆_{ev}(ku^∧_p) = τ_{≥2⋆}ku^∧_p.
- `solidEvenFiltration.zero`: fil_ev(0) = 0.
- `solidEvenFiltration.not_perfect_dual`: Perf_ev(R_■) is not closed under duals: Hom_S(Null_S, S) ≃ ⊕_ℕ S is not solid perfect even (Wagner 2.3).

Also establish For R = ku^∧_p (even, p-complete), fil^⋆_{ev/R}R = τ_{≥2⋆}R.

*Needs:* §6.2 (Light condensed and solid spectra); §6.2 (Trace-class maps and nuclear modules); §6.5 (Even filtrations (Hahn–Raksit–Wilson and Pstrągowski)); §6.3 (Perfect even modules and the even site); §6.4 (Even flat and solid even flat modules); §6.3 (Homological evenness and even homotopy sheaves); §6.4 (Faithfully even flat ring maps); §6.4 (Solid duality assumption R).

### 6.6 Synthetic circle and finite cyclic operations

**Synthetic finite cyclic fixed points and Tate.** In SynSp=Mod_{S_ev}(Fil Sp), set T_ev=fil_ev S[S¹]. For n≥1 the circle power map gives ρ(n)^*T_ev. For a synthetic T_ev-module M define M_{C_n}=ρ(n)^*T_ev⊗_{T_ev}M and M^{C_n}=Map_{T_ev}(ρ(n)^*T_ev,M), with the residual circle action via ρ(n)^*T_ev≃T_ev as an algebra. Antieau–Riggenbach Construction 2.63 uses the relative duality of T_ev and the dual of the power map to define a finite cyclic norm M_{C_n}→M^{C_n}; its cofiber is M^{tC_n}. There is no extra suspension in this finite norm. Tate is lax monoidal and vanishes on the thick subcategory generated by induced T_ev-modules. The underlying orbits agree with ordinary orbits. For underlying fixed-point comparisons require the truncation hypotheses of Lemma 2.75(iv), or its even-base variant (v); completeness alone is insufficient.

Throughout this statement, n≥1; synthetic T_ev-module with coherent residual action. For 2.75(iv): every F^{≥i}M→M is i-truncated. For (v): M over B[S¹]_ev with even E∞ B and every such map 2i-truncated.

([AR](#ar), Definition 2.61 and Construction 2.63, pp. 16–17; Lemma 2.66 and Proposition 2.67, pp. 17–18; Lemma 2.75, pp. 20–21.)

The construction proceeds as follows. Construct the two adjoints to ρ(n)^* using relative tensor and mapping objects. Use relative duality and the dual power map to construct the finite norm. Define its cofiber and apply the induced-vanishing/lax-monoidality result. Keep the exact truncation bounds when passing to underlying spectra.

Provide the following operations and identities.

- `SyntheticFiniteCyclic.orbits`: ρ(n)^*T_ev⊗_{T_ev}M with residual action.
- `SyntheticFiniteCyclic.fixed`: Map_{T_ev}(ρ(n)^*T_ev,M) with residual action.
- `SyntheticFiniteCyclic.norm`: Duality norm with no circle suspension.
- `SyntheticFiniteCyclic.tate`: Cofiber of the finite norm.
- `SyntheticFiniteCyclic.residual`: Action of the power-pullback circle algebra.
- `SyntheticFiniteCyclic.laxMonoidal`: Coherent lax monoidal Tate structure.
- `SyntheticFiniteCyclic.induced_zero`: Tate vanishes on thick induced modules.
- `SyntheticFiniteCyclic.underlying`: Orbits always compare; fixed points compare under 2.75(iv)/(v) truncation bounds.

**Checks.**

- `SyntheticFiniteCyclic.one`: For n=1, norm is an equivalence and Tate is zero.
- `SyntheticFiniteCyclic.induced`: Tate of X⊗T_ev is zero.
- `SyntheticFiniteCyclic.no_shift`: Finite norms are unshifted, whereas the circle norm has the suspension in AInfCohomology §AI.7.2 (Circle actions, homotopy fixed points and Tate constructions).
- `SyntheticFiniteCyclic.whitehead`: Over an even base, a double-speed Whitehead filtration satisfies the underlying comparison range of 2.75(v); the finite Whitehead identification in (vi) also needs even M.

Also establish Finite norms are unshifted, whereas the circle norm has the suspension in AInfCohomology §AI.7.2 (Circle actions, homotopy fixed points and Tate constructions).

*Needs:* §6.5 (Even filtrations (Hahn–Raksit–Wilson and Pstrągowski)); BordismFormalGroups §F6.5 (finite-group Borel norm and Tate cofiber); EnhancedDerivedSheaves E0.

**Even-filtered circle fixed points and Tate.** With S_ev := fil^⋆_ev S and T_ev := fil^⋆_ev S[S¹] (even filtrations of the sphere and the spherical group ring of the circle), for an even-filtered T_ev-module X the filtered homotopy fixed points X^{hT_ev} := Hom^⋆_{T_ev}(S_ev, X) and Tate X^{tT_ev} (Antieau–Riggenbach §2.3, due to Raksit); define fil^⋆_{ev,hS¹}TC⁻ := (fil^⋆_ev THH)^{hT_ev} and fil^⋆_{ev,tS¹}TP := (fil^⋆_ev THH)^{tT_ev}. It does not matter whether HRW, Pstrągowski or solid even filtrations are used for S_ev and T_ev (the particular coefficient filtrations agree after completion as in Wagner §3; Pstrągowski's construction is exhaustive. General HRW exhaustiveness for connective E_∞-rings is attributed to unpublished Burklund–Krause work and is not asserted here).

Throughout this statement, Even filtrations as in §6.5 (Even filtrations (Hahn–Raksit–Wilson and Pstrągowski)). Underlying fixed points require AR24 Lemma 2.75(iv) or (v) truncation bounds, not just completeness/exhaustiveness. Double-speed Whitehead identification uses (vi), with even M additionally for finite C_n.

([W](#w), §1.1, paragraph 1.7 'Even filtrations', p. 4; [W](#w), §3.2, paragraph 3.8 'Even filtrations', p. 26; [AR](#ar), §2.3, Definition 2.55 and Construction 2.58, pp. 15–16; Lemma 2.75, pp. 20–21.)

The construction proceeds as follows. Construct T_ev as an E_∞-algebra in filtered spectra and S_ev as a T_ev-module (augmentation). Define Hom over T_ev and the norm/Tate construction in filtered spectra. Use AR Lemma 2.75(iv) or (v), with its stage/fiber truncation bounds, for the comparison with ordinary (−)^{hT}; use (vi) only with its additional evenness hypotheses.

Provide the following operations and identities.

- `evenCircleFixedPoints`: X ↦ X^{hT_ev} on even-filtered T_ev-modules.
- `evenCircleTate`: X ↦ X^{tT_ev}.
- `evenCircleFixedPoints.underlying`: Under the truncation bounds of AR Lemma 2.75(iv) or (v), the completed filtered fixed-point object is exhaustive for (underlying X)^{hT}. Completeness and exhaustiveness of X alone do not supply this comparison.
- `evenCircleFixedPoints.graded`: Σ^{−2∗}gr^∗ of ku_ev^{hT_ev} is ℤ[β][[t]] ≅ the Rees algebra of (q−1)^⋆ℤ[[q−1]].

**Checks.**

- `evenCircleFixedPoints.ku`: π_* of the underlying object for ku with trivial action is ℤ[β][[t]].
- `evenCircleFixedPoints.zero`: 0^{hT_ev} = 0.
- `evenCircleFixedPoints.not_naive`: (fil_ev X)^{hT} formed degreewise in Fun(ℤ^op, Sp) without T_ev is not the same: the circle action shifts filtration (σ in degree 1 of weight 1), so the naive construction gives the wrong graded pieces.

Also establish For THH(ku/ku) = ku with trivial action: fil_{ev,hS¹}TC⁻ = τ_{≥2⋆}(ku^{hS¹}) with π_* = ℤ[β][[t]] (Wagner 1.16(e)).

*Needs:* §6.5 (Even filtrations (Hahn–Raksit–Wilson and Pstrągowski)); §2.1 (Homotopy orbits and homotopy fixed points); AInfCohomology §AI.7.2 (Circle actions, homotopy fixed points and Tate constructions); DerivedDeRhamCohomology Layer 1 — filtered modules; §6.6 (Synthetic finite cyclic fixed points and Tate).

### 6.7 Filtered solid relative THH

**Even filtrations on solid relative THH.** Let k be a connective even E_∞-ring with π_{2∗}k p-torsion free (k = ku, ℤ, ku ⊗ ℚ, …), A and R as in §6.1 (Spherical lifts and the base hypotheses), k_A := k ⊗^■ S_A, k_R := k ⊗^■ S_R. Then (i) solid THH_■(k_R/k_A) is the p-completed relative THH (Wagner Lemma 3.7); (ii) fil^⋆_ev THH_■(k_R/k_A) (solid even filtration in case (E_2), lim_Δ τ_{≥2⋆} over the even resolution in case (E_1)) is given by a cosimplicial formula from a polynomial resolution (Proposition 3.11), is exhaustive and complete (Corollary 3.14), and carries a bifiltration with gr^s ≃ fil^{⋆−s}_{HKR}HH_■(R/A) ⊗ Σ^{2s+1}π_{2s}(k) for the positive filtration steps s≥1, with the solid tensor product and the completion prescribed by Corollary 3.15 (Corollary 3.15); (iii) it satisfies base change along k → l when l is also connective, even and p-torsion free in every homotopy degree (Corollary 3.17), with the specialized forms of Corollaries 3.18–3.19; (iv) for k = ℤ it agrees with HRW's filtration (hence HKR/BMS2) on HH, HC⁻, HP (Corollary 3.21), and in case (E_2) it is the p-completion of Pstrągowski's perfect even filtration (Corollary 3.24).

Throughout this statement, k connective even E_∞ with π_{2∗}k p-torsion free; A, R as in Wagner 3.1/3.2. For Lemma 3.7(i), both k and the spherical lift T of R are the p-completions of their underlying discrete condensed versions, k=(k°)^∧_p and T=(T°)^∧_p. The solid tensor is not asserted to be ordinary p-completed THH for arbitrary condensed inputs. For Corollary 3.17 base change, l is a connective even E_∞-ring and multiplication by p is injective on every homotopy group of l.

([W](#w), §3.1, Lemma 3.7, p. 25; [W](#w), §3.2, Proposition 3.11, p. 27; [W](#w), §3.3 'Base change', Corollary 3.17, p. 31; [W](#w), §3.4, Corollary 3.21, p. 33.)

The construction proceeds as follows. Lemma 3.7 via Burklund's E_2-structure on k/p^5. Resolve R by P = ℤ[x_i] ↠ R with S_P = S[x_i] (E_2 even cells, Lemma B.1); the Čech resolution is termwise even (Proposition 3.11). Deduce exhaustiveness/completeness and the bifiltration (Corollaries 3.14–3.15). Base change (Corollaries 3.17–3.19) and comparisons (Corollaries 3.21, 3.24).

Also establish For k = ℤ: fil_{ev,hS¹}HC⁻_■(R/A) recovers the BMS2/Antieau filtration, gr^i = Σ^{2i}(Hodge-filtered derived de Rham)^∧_p.

*Needs:* §6.5 (The solid even filtration); §6.1 (Spherical lifts and the base hypotheses); §6.6 (Even-filtered circle fixed points and Tate); §2.8 (THH relative to an E_∞-ring); §1.11 (The derived HKR filtration); §6.3 (Perfect even modules and the even site); §6.4 (Even flat and solid even flat modules); §6.3 (Homological evenness and even homotopy sheaves); §6.4 (Faithfully even flat ring maps).

### 6.8 Image of J and the local coefficient comparisons

**The K(1)-local sphere and its Adams fixed points.** For a prime p let L_{K(1)}:=L_{KU/p} be BordismFormalGroups §F6.1's Bousfield localization at the cofibre KU/p of p on KU; since KU/p is a sum of shifts of the height-one Morava K-theory, this is K(1)-localization, and L_{K(1)}X≃(L_{KU}X)^∧_p. The KU/p-local spectra form a presentably symmetric monoidal category with unit J_p:=L_{K(1)}S, which is an E∞-ring receiving an essentially unique E∞-map to every K(1)-local E∞-ring. For p odd fix an integer r≥2 that topologically generates Zₚ×, equivalently a primitive root modulo p², and let ℤ act on the E∞-ring KU_p through the operation ψ^r of §5.1, which is defined on KU_p because r is prime to p. Then (KU_p)^{hℤ} is a K(1)-local E∞-ring whose underlying spectrum is fib(ψ^r−1:KU_p→KU_p), and the unique E∞-map J_p→(KU_p)^{hℤ} is an equivalence. For p=2 let C₂ act on KU₂ by ψ^{−1} of §5.1 and put B₂=(KU₂)^{hC₂}. Its homotopy fixed point spectral sequence has E₂=ℤ₂[a,u^{±2}]/(2a) with a in filtration one and total degree 1. The only differential is d₃(u²)=a³, so π_*B₂ is 8-periodic with π₀=ℤ₂, π₁=ℤ/2 generated by the image of η, π₂=ℤ/2, π₃=0 and π₄=ℤ₂. Let ℤ act on B₂ through ψ³; then J₂≃B₂^{hℤ}, with underlying spectrum fib(ψ³−1:B₂→B₂). B₂ is 2-complete real K-theory (R-Gal Proposition 5.3.1); the coefficient calculation above uses only the spectral sequence.

Throughout this statement, p a prime; r an integer topological generator of Zₚ× for odd p; the actions are those of the discrete groups generated by the stated E∞ operations.

([R-Gal](#r-gal), Proposition 5.3.1 and its proof, p. 23; §5.5.1, p. 32, for L_{K(1)}=L_{KU/p}=(L_{KU}−)^∧_p; §5.5.2, pp. 32–33; [L20](#l20), Examples 5 and 7, p. 2.)

The construction proceeds as follows. Homotopy fixed points of a ℤ-action on an E∞-ring are its equalizer of the identity and the generator in E∞-rings, with underlying fibre of the generator minus one; limits of K(1)-local spectra are K(1)-local. On π_{2m}KU_p the operator ψ^r−1 is multiplication by r^m−1. This is a unit unless (p−1) divides m; for m=(p−1)k with k≠0 its valuation is 1+v_p(k), since r^{p−1}≡1 modulo p and not modulo p². So π_*(KU_p)^{hℤ} is ℤₚ in degrees 0 and −1 and ℤ/p^{1+v_p(k)} in degree 2(p−1)k−1 for k≠0. Compare with π_*J_p through the unit. The identification of J_p with these fixed points is attributed in R-Gal §5.5.2 to Mahowald and Miller, after Bousfield; its proof through Bousfield's computation of the KU-local sphere is part of this target. At p=2 compute the C₂ spectral sequence as in R-Gal Proposition 5.3.1: a detects the image of η and η⁴=0 in π₄S, so a⁴ must be hit, which forces d₃(u²)=a³. Then take the fibre of ψ³−1.

Provide the following operations and identities.

- `kOneLocalization`: L_{K(1)}:=L_{KU/p}, with L_{K(1)}X≃(L_{KU}X)^∧_p.
- `kOneLocalSphere`: J_p=L_{K(1)}S as an E∞-ring, initial among K(1)-local E∞-rings.
- `kOneLocalSphere.oddFixedPoints`: For p odd, J_p≃(KU_p)^{hℤ} with ℤ acting through ψ^r, as E∞-rings.
- `kOneLocalSphere.realFixedPoints`: B₂=(KU₂)^{hC₂} and its spectral sequence with the differential d₃(u²)=a³.
- `kOneLocalSphere.twoFixedPoints`: J₂≃B₂^{hℤ} with ℤ acting through ψ³, as E∞-rings.
- `kOneLocalSphere.homotopy`: π_*J_p for p odd as computed above.

**Checks.**

- `kOneLocalization.module`: Every KU/p-module spectrum is KU/p-local, since a map from an acyclic A factors through KU/p⊗A=0. KU_p, the p-completion of the KU-local spectrum KU, is K(1)-local although it is not a KU/p-module.
- `kOneLocalization.not_completion`: HF_p is p-complete but KU/p-acyclic, because KU⊗HF_p=0; hence L_{K(1)}HF_p=0, and K(1)-localization is not derived p-completion.
- `kOneLocalSphere.negative_degree`: For p odd, π_{−1}J_p=ℤₚ, while π_{−1}S^∧_p=0. The K(1)-local sphere is not the p-completed sphere.
- `kOneLocalSphere.generator`: For p=3 the integer r=2 is a primitive root modulo 9, but r=10 is not, since 10≡1 modulo 9. With r=10 the operator ψ^r−1 vanishes modulo 9 on π₄KU₃ and gives the wrong group in degree 3.
- `kOneLocalSphere.real_vs_complex`: fib(ψ³−1:KU₂→KU₂) has π₁≅ℤ/2, the cokernel of multiplication by 2 on π₂KU₂, since π₁KU₂=0. The fibre on B₂ has π₁ of order 4: ψ³ acts identically on π₂B₂=ℤ/2 and on π₁B₂=ℤ/2, so both contribute. Omitting the C₂ fixed points loses the class of η.
- `kOneLocalSphere.realFixedPoints.degree_three`: π₃B₂=0 although E₂ has a³ in total degree 3; the differential d₃(u²)=a³ is what removes it.

*Needs:* BordismFormalGroups §F6.1 (spectral Bousfield localization); §5.1 (Snaith construction of stable Adams operations); §5.1 (Coherent stable lifts of the supplied Adams operations); §2.1 (Homotopy orbits and homotopy fixed points); GeneralizedCohomology G5.4 and G3.8; StableHomotopyKTheory §§7.14–7.18.

**The connective image-of-J spectrum j.** For a prime p let j=τ_{≥0}J_p, with the E∞ structure of the connective cover of the E∞-ring J_p (§6.8 (The K(1)-local sphere and its Adams fixed points)). The unit S→KU is an E∞-map, so its K(1)-localization J_p→KU_p is one, and its connective cover is an E∞-map j→ku_p. At odd p, π₀j=Zₚ and π_{2(p−1)k−1}j=ℤ/p^{v_p(k)+1} for k≥1, with no other nonzero groups. At p=2, the fibre sequence J₂→B₂→B₂ of ψ³−1 has ψ³ acting identically on π₁B₂=ℤ/2 and on π₀B₂=ℤ₂; the long exact sequence therefore gives 0→ℤ/2→π₀J₂→ℤ₂→0, split by the unit of the 2-complete sphere. So π₀j=ℤ₂⊕ℤ/2 as an abelian group at 2, and the formula π₀j=Zₚ applies only at odd p. This all-prime connective-cover convention must be distinguished from a prime-two image-of-J convention with π₀=ℤ₂.

Separately, Devalapurkar's thesis uses j_{p,0}=τ_{≥0}(KU_p^{hΓ₀}), Γ₀=Z as in Lemma 6.2.1 and Notation 6.2.8. At odd p it omits the μ_(p−1) fixed points. Keep that variant and its specified action in the THH comparisons; neither ordinary p-completion nor a formula on coefficient groups identifies these E∞-rings.

Throughout this statement, p a prime; J_p and its fixed-point description are the preceding target, distinct from derived p-completion.

([R-Gal](#r-gal), §§5.5.1–5.5.2, pp. 32–33; [W](#w), §4.1, Theorem 4.12 (Devalapurkar–Raksit [DR25]), p. 40; [D-thesis](#d-thesis), §6.2, Notation 6.2.8, printed p. 225 (PDF p. 234); [DR](#dr), Notation 0.1.2 and Remark 0.1.3, p. 2.)

The construction proceeds as follows. Take connective covers of the E∞-ring J_p and of the unit map J_p→KU_p; τ_{≥0} is lax symmetric monoidal, so both stay E∞. Read off π_*j from the homotopy of J_p computed in the preceding target, discarding π_{−1}. At 2, use the long exact sequence of ψ³−1 on B₂ and the splitting by the sphere unit.

Provide the following operations and identities.

- `imageOfJ`: j = τ_{≥0}S_{K(1)} at p, an E_∞-ring.
- `imageOfJ.toKu`: The connective cover of the unit J_p→KU_p, giving an E∞-map j→ku_p.
- `imageOfJ.pi0_odd`: For p odd, π₀j≅Zₚ.
- `imageOfJ.pi0_two`: For p=2, π₀j≅Z₂⊕Z/2 as an abelian group, with the second summand the boundary of η∈π₁B₂.
- `imageOfJ.variant`: Devalapurkar's j_{p,0}, retaining Γ₀ and its action.

**Checks.**

- `imageOfJ.pi0_odd_test`: For p=3 and r=2, π₁KU₃=0, so the fibre sequence of ψ²−1 gives π₀j=Z₃; the group π_{−1}J₃=ℤ₃ is removed by the connective cover.
- `imageOfJ.pi0_two_test`: For p=2 the nonzero boundary of η contributes Z/2 to π₀j. In contrast fib(ψ³−1:KU₂→KU₂) has π₀=Z₂ since π₁KU₂=0; substituting KU₂ for B₂ loses this summand.
- `imageOfJ.connective`: π_n j = 0 for n < 0.
- `imageOfJ.positive_index`: At p=3 the formula gives π₃j=Z/3 and π₁₁j=Z/9 (k=1 and k=3). At k=0 the degree is −1 and the connective cover is zero, so that index is excluded.
- `imageOfJ.not_sphere`: j ≠ S^∧_p for p odd: the element β_1 ∈ π_{2p²−2p−2}S^∧_p of the cokernel of J maps to zero in π_*j.

Also establish π₀j=Zₚ for p odd and π_(2(p−1)k−1)j≅Z/p^(v_p(k)+1) for p odd and k≥1. These formulas concern j with the full finite-unit fixed points; they are not formulas for j_{p,0}.

*Needs:* §6.8 (The K(1)-local sphere and its Adams fixed points); BordismFormalGroups §F6.1 (spectral Bousfield localization); §5.1 (Coherent stable lifts of the supplied Adams operations); GeneralizedCohomology G5.4 and G3.8; StableHomotopyKTheory §§7.14–7.18; StableHomotopyKTheory Layer 7.

**Nikolaus's E_1 comparison at all primes.** For every prime p, including p = 2, there is an S¹-equivariant equivalence of E_1-rings THH(ℤ_p[ζ_p]/S_p[[q−1]])^∧_p ≃ τ_{≥0}(ku_p^{tC_p}) (only the E_1 refinement is asserted), proved from the fact that ℤ_p[ζ_p] is the free (q−1)-complete E_2-S_p[[q−1]]-algebra with [p]_q = 0 (Wagner Theorem 4.16, attributed to unpublished work of Nikolaus, with the argument explained by Devalapurkar).

Throughout this statement, Any prime p; only E_1-structures.

([W](#w), §4.2, Theorem 4.16 (Nikolaus, unpublished), p. 43.)

The construction proceeds as follows. Presentation of ℤ_p[ζ_p] as a free (q−1)-complete E_2-algebra with [p]_q = 0. Compute THH of such a free quotient and compare with ku_p^{tC_p} using π_*(ku_p^{tC_p}) = π_*(ku_p^{tS¹})/[p]_q (Wagner proof of Theorem 4.16).

Also establish At p = 2 this replaces §6.8 (Devalapurkar's comparison of THH(ℤ_p[ζ_p]) with ku) in case (E_1).

*Needs:* §5.3 (ku and KU with circle and cyclic-group actions); §2.8 (THH relative to an E_∞-ring); §6.1 (Spherical lifts and the base hypotheses).

**THH(ℤ_p) and the image of J (Devalapurkar–Raksit).** For p odd: THH(ℤ_p)^∧_p ≃ τ_{≥0}(j^{tC_p}) as S¹-equivariant (cyclotomic) E_∞-rings, compatible with j → THH(ℤ_p)^∧_p and ℤ_p → THH(𝔽_p) ≃ τ_{≥0}(ℤ_p^{tC_p}); the analogous statement is false at p = 2 (Nygaard versus divided-power completion). In Wagner it is used to show TP_■(R/S_A) ≃ HP_■(R/A) without a spherical lift and to identify ψ^{hS¹}_R (p > 2).

Throughout this statement, p odd.

([DR](#dr), §0.1, Theorem 0.1.4, p. 2; [W](#w), §4.1, Theorem 4.12 (Devalapurkar–Raksit [DR25]), p. 40.)

The construction proceeds as follows. Import Devalapurkar–Raksit's theorem (arXiv 2505.02218) as stated in Wagner Theorem 4.12; its proof (via K(1)-local and Tate-orbit arguments) follows their paper. Record the failure at p = 2 (Wagner §4.2).

Also establish π_*THH(ℤ_p)^∧_p in low degrees: π_0 = ℤ_p, π_{2p−1} = ℤ/p (first nonzero positive group), matching τ_{≥0}(j^{tC_p}).

*Needs:* §6.8 (The connective image-of-J spectrum j); §2.7 (Topological Hochschild homology of an E_1-ring); §2.7 (The cyclotomic Frobenius of THH); BordismFormalGroups §F6.5 (finite-group Borel norm and Tate cofiber).

**Devalapurkar's comparison of THH(ℤ_p[ζ_p]) with ku.** For p > 2 there is an equivalence THH(ℤ_p[ζ_p]/S_p[[q − 1]])^∧_p ≃ τ_{≥0}(ku_p^{tC_p}) of S¹ × ℤ_p^×-equivariant E_∞-S_p[[q − 1]]-algebras (ℤ_p[ζ_p] an S_p[[q−1]]-algebra via q ↦ ζ_p; S¹ acting on ku^{tC_p} through S¹ ≃ S¹/C_p; ℤ_p^× acting by Adams operations on ku_p), sending q ↦ q, compatibly with THH(𝔽_p) ≃ τ_{≥0}(ℤ_p^{tC_p}) (Wagner Theorem 4.1 = Devalapurkar's thesis Theorem 6.4.1, whose normalisation uses S[[q^{1/p} − 1]] with q^{1/p} ↦ ζ_p and states the identification with ku_p^{(−1)} = τ_{≥0}(ku_p^{tℤ/p})). Its inputs are the Devalapurkar–Raksit identification of THH(ℤ_p[ζ_p]) (thesis Theorem 6.1.4) and the E_∞-ring j_{p,0}. At p = 2 only Nikolaus's S¹-equivariant E_1-equivalence is available (§6.8 (Nikolaus's E_1 comparison at all primes)); the E_∞ statement is not known there.

Throughout this statement, p > 2.

([W](#w), §1.1, Theorem 1.6 (Devalapurkar [Dev25, Theorem 6.4.1]), p. 4; restated as Theorem 4.1, p. 36; [D-thesis](#d-thesis), Ch. 6, §6.4 'Application to q-de Rham cohomology', Theorem 6.4.1, printed p. 232 (PDF p. 241); also stated as Theorem 1.2.2, printed p. 15 (PDF p. 24); [D-thesis](#d-thesis), Ch. 6, §6.1, Theorem 6.1.4 (Joint with A. Raksit), printed p. 220 (PDF p. 229).)

The construction proceeds as follows. Thesis Lemma 6.4.11 and Theorem 6.1.4 identify the ku base change of THH(Z_p[ζ_p]) with ku_p^{(−1)} through the j_{p,0} comparison. Lemma 6.4.10 relates that base change to S⊗_{S[S¹]}triv THH. Proposition 6.4.20 factors the circle map through THH(S[q^{±1/p}]); Lemma 6.4.14 identifies the ensuing tensor with relative THH. Retain Z_p^×-equivariance through these comparisons; Remark 6.4.21 addresses it for the factorization step. Proposition 6.2.7 supplies the second part of Theorem 6.4.1. Transport the thesis q^{1/p} normalization to Wagner 4.1, retaining the S¹×Z_p^× action and the p>2 E∞ range. These proof steps use these identities within the proof.

Also establish On π_0: ℤ_p[ζ_p] ≅ π_0(τ_{≥0}ku_p^{tC_p}). An E_∞ refinement at p=2 is not known; this does not prove it false, which is why Wagner's Theorem 1.2 assumes 2 ∈ R^×.

*Needs:* §6.8 (THH(ℤ_p) and the image of J (Devalapurkar–Raksit)); §6.8 (The connective image-of-J spectrum j); §5.3 (ku and KU with circle and cyclic-group actions); §5.1 (Coherent stable lifts of the supplied Adams operations); §2.8 (THH relative to an E_∞-ring).

### 6.9 The q-Hodge pullback and local comparisons

**The comparison map ψ^0_R and the q-Hodge filtration.** For p, A, R as in §6.1 (Spherical lifts and the base hypotheses) (local case), the cyclotomic Frobenius of THH(S_R/S_A) and Devalapurkar's comparison (p > 2; Nikolaus's for p = 2 in case (E_1)) give an S¹-map ψ_R : THH(R^{(p)}[ζ_p]/S_A[[q−1]])[1/u] → THH(ku_R/ku_A)^{tC_p} and hence ψ^0_R : q-dR_{R/A} → gr^0_{ev,tS¹}TP_■ ≃ gr^0_{ev,hS¹}TC⁻_■(ku_R/ku_A), where q-dR_{R/A} is the (p-completed) derived q-de Rham complex (HabiroCohomologyFoundations HQ). The q-Hodge filtration is defined as the pullback fil^⋆_{q-Hdg}q-dR_{R/A} := q-dR_{R/A} ×_{gr^0} Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻_■(ku_R/ku_A) along ψ^0_R, using Σ^{−2∗}gr^∗(ku_ev^{hT_ev}) ≅ ℤ_p[β][[t]] ≅ the Rees algebra of (q−1)^⋆ℤ_p[[q−1]] (q − 1 = βt).

Throughout this statement, Local case at a prime p; Devalapurkar's comparison for p > 2, Nikolaus's in case (E_1) for p = 2.

([W](#w), §4.1, paragraph 4.7 'The q-Hodge filtration', p. 38; [W](#w), §4.1, Remark 4.3, p. 36.)

The construction proceeds as follows. Construct ψ_R (Wagner 4.4) from the cyclotomic Frobenius and §6.8 (Devalapurkar's comparison of THH(ℤ_p[ζ_p]) with ku). Pass to gr^0 of the even filtrations (Wagner 4.6–4.7) and define the pullback filtration (4.7). Identify the coefficient ring with the (q−1)-adic filtration (Remark 4.3).

Provide the following operations and identities.

- `qHodgeComparison`: ψ^0_R : q-dR_{R/A} → gr^0_{ev,hS¹}TC⁻_■(ku_R/ku_A).
- `qHodgeFiltration`: fil^⋆_{q-Hdg}q-dR_{R/A} as the pullback along ψ^0_R.
- `qHodgeComparison.mod_beta`: Modulo β it is the de Rham comparison for HC⁻ (Hodge filtration).
- `qHodgeComparison.coefficients`: Σ^{−2∗}gr^∗(ku^{hT}) ≅ ℤ_p[β][[t]] with q − 1 = βt.

**Checks.**

- `qHodgeFiltration.zero_degree`: fil^0_{q-Hdg} = q-dR_{R/A}.
- `qHodgeFiltration.polynomial`: For the p-completed polynomial algebra R=ℤ_p⟨x⟩ and i≥1, fil^i = ((q−1)^iR[[q−1]] → (q−1)^{i−1}R[[q−1]]dx) (Raksit's example, §6.10 (The framed comparison (Raksit; Wagner Theorem 6.10)), Check `framedTrace.line`).
- `qHodgeFiltration.not_qadic`: fil^⋆_{q-Hdg} is not the (q−1)-adic filtration (q−1)^⋆q-dR: on ℤ_p⟨x⟩ the degree-1 term contains dx in filtration i−1, not i.

Also establish Modulo β, ψ^0_R becomes the comparison dR_{R/A} → gr^0 HC⁻ of Antieau/HRW.

*Needs:* §6.8 (Devalapurkar's comparison of THH(ℤ_p[ζ_p]) with ku); §6.8 (Nikolaus's E_1 comparison at all primes); §6.7 (Even filtrations on solid relative THH); §6.6 (Even-filtered circle fixed points and Tate); §2.7 (The cyclotomic Frobenius of THH); HabiroCohomologyFoundations Layer 4 (HQ.3).

**The p-complete q-Hodge comparison for p > 2 (Wagner Theorem 4.8).** Let p > 2, A a p-complete p-completely perfectly covered δ-ring with a 3.1(tC_p)-lift S_A, and R a p-complete A-algebra with bounded p^∞-torsion, p-quasi-lci over A, satisfying 3.2(E_2) or 3.2(E_1). Then ψ^0_R identifies the completion of fil^⋆_{q-Hdg}q-dR_{R/A} with Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻_■(ku_R/ku_A) as graded ℤ_p[β][[t]]-modules; modulo β this is the Hodge filtration fil_{Hdg}dR_{R/A}, and after rationalisation the combined (Hodge, q−1)-filtration on dR_{R/A}[1/p][[q−1]]. For n≥2, with an E_n-lift the equivalences are E_{n−1}-monoidal (Remark 4.9).

Throughout this statement, p > 2; A, R as stated; all (q-)de Rham complexes relative to A are p-completed. The E_{n−1}-monoidal refinement requires n≥2 and the chosen E_n lift.

([W](#w), §4.1 'The p-complete comparison (case p > 2)', Theorem 4.8, p. 39; [W](#w), §4.1, Remark 4.9, p. 39.)

The construction proceeds as follows. Use the polynomial/Čech even resolution and comparison of Wagner Proposition 3.11 and Corollary 3.16, then the comparison square of Lemma 4.10. Theorem 4.12 supplies the Devalapurkar–Raksit coefficient calculation; it is not a quasi-syntomic descent theorem. Check the identification modulo β (Antieau/HRW: Hodge filtration via HC⁻) and the ℤ_p^×-equivariance (Lemma 4.13). Conclude by completeness of both filtrations (§6.7 (Even filtrations on solid relative THH)).

Also establish For A = R = ℤ_p: TC⁻(ku_p/ku_p) = ku_p^{hT} and q-dR = ℤ_p[[q−1]] with fil^i = (q−1)^i.

*Needs:* §6.9 (The comparison map ψ^0_R and the q-Hodge filtration); §6.7 (Even filtrations on solid relative THH); §6.8 (THH(ℤ_p) and the image of J (Devalapurkar–Raksit)); HabiroCohomologyFoundations Layer 4 (HQ.3); DerivedDeRhamCohomology Layer 2 — p completed derham.

**The p-complete q-Hodge comparison at p = 2 (Wagner Theorem 4.14).** For p = 2, A as in 3.1 and R a 2-complete, 2-torsion free A-algebra with bounded 2^∞-torsion, 2-quasi-lci over A, with a 2-quasi-syntomic cover R → R_∞ (R_∞/2 relatively semiperfect over A) and an E_1-lift S_R → S_{R_∞}^• of its Čech nerve (case 3.2(E_1)), the conclusions of Theorem 4.8 hold for the ad hoc filtration lim_Δ τ_{≥2⋆}TC⁻_■(ku_{R_∞^•}/ku_A). Case 3.2(E_2) at p = 2 remains open (it depends on an E_∞ form of Devalapurkar's theorem at p = 2 and on Theorem 4.12, false at p = 2). The resulting fil_{q-Hdg} is a priori a graded E_0-algebra, E_∞ a posteriori by §6.9 (q-Hodge filtrations of quasi-regular quotients (Wagner Theorem 4.17)).

Throughout this statement, p = 2; case (E_1) only.

([W](#w), §4.2 'The p-complete comparison (case p = 2)', Theorem 4.14, p. 43; [W](#w), §4.2, opening paragraph, p. 43.)

The construction proceeds as follows. Replace Devalapurkar's comparison by Nikolaus's E_1 equivalence (§6.8 (Nikolaus's E_1 comparison at all primes)) to construct ψ^0_R. Lemma 4.10 needs no quasi-syntomic descent here since R_∞^• is relatively semiperfect; the ℤ_p^×-equivariance argument is replaced by a check via A_crys^• after base change to perfect A (Wagner §4.2, a proof sketch).

Also establish This is the separate p = 2 target the roadmap keeps; it is not Theorem 4.8 with hypotheses removed.

*Needs:* §6.8 (Nikolaus's E_1 comparison at all primes); §6.9 (The comparison map ψ^0_R and the q-Hodge filtration); §6.7 (Even filtrations on solid relative THH).

**q-Hodge filtrations of quasi-regular quotients (Wagner Theorem 4.17).** Fix a prime p (p = 2 allowed), A as in 3.1, and R satisfying 3.2(E_1) for the identity cover: R p-complete, p-torsion free, bounded p^∞-torsion, p-quasi-lci over A, R/p relatively semiperfect over A, with a p-complete connective E_1-S_A-algebra lift S_R. Then q-dR_{R/A} and dR_{R/A} are static and fil^⋆_{q-Hdg}q-dR_{R/A} = q-dR_{R/A} ×_{dR_{R/A}[1/p][[q−1]]} fil^⋆_{(Hdg,q−1)}dR_{R/A}[1/p][[q−1]] (pullback of filtered (q−1)^⋆A[[q−1]]-modules in the 1-category); hence it is independent of the lift S_R and canonically a filtered E_∞-algebra.

Throughout this statement, As stated; p-torsion-freeness of R is required (the §4.3 preamble's reformulation omits it).

([W](#w), §4.3 'The case of quasi-regular quotients', Theorem 4.17, p. 45.)

The construction proceeds as follows. Staticness of q-dR and dR for such R. Apply Theorems 4.8/4.14 and identify the pullback using the rational comparison and p-torsion-freeness of Σ^{−n}∧^nL_{R/A}.

Also establish Lift independence: two E_1-lifts of the same R give the same filtration.

*Needs:* §6.9 (The p-complete q-Hodge comparison for p > 2 (Wagner Theorem 4.8)); §6.9 (The p-complete q-Hodge comparison at p = 2 (Wagner Theorem 4.14)); DerivedDeRhamCohomology Layer 2 — p completed derham.

### 6.10 Arithmetic gluing, the global comparison and framed smooth algebras

**Global even filtrations by profinite and rational gluing.** For A, R global (Wagner 4.18), fil^⋆_ev THH(ku_R/ku_A) is defined as the pullback of the profinite filtration fil^⋆_ev THH_■(ku_{R̂}/ku_{Â}) (product over primes, with (E_1)- and (E_2)-primes treated separately, 4.21) and the rational filtration fil^⋆_ev THH(ku_R ⊗ ℚ/ku_A ⊗ ℚ) ≃ fil^⋆_ev HH(R/A) ⊗ ℚ[β]_ev over fil^⋆_ev THH_■(ku_{R̂} ⊗^■ ℚ/ku_{Â} ⊗^■ ℚ) (4.23); then fil_{ev,hS¹}TC⁻ := (fil_ev THH)^{hT_ev}. The derived q-de Rham complex is glued likewise (4.25), and ψ^0_R is glued from the local comparisons, the rational Hodge-completion map and their compatibility (Lemma 4.29, a Ẑ^×-Adams-equivariance argument which uses (R_2)).

Throughout this statement, Global hypotheses of §6.1 (Spherical lifts and the base hypotheses).

([W](#w), §4.4, paragraph 4.23 'Global even filtrations', p. 48; [W](#w), §4.4, paragraph 4.21 'Profinite even filtrations' and Lemma 4.22, pp. 47-48; [W](#w), §4.4, paragraph 4.25 'The global comparison map', p. 49.)

The construction proceeds as follows. Profinite completion and solid tensor products of bounded-below profinite complete spectra (4.20). Profinite even filtrations (4.21, Lemma 4.22). Glue (4.23) and glue q-dR and ψ^0_R (4.25, Lemma 4.29).

Provide the following operations and identities.

- `globalEvenFiltration`: fil^⋆_ev THH(ku_R/ku_A) glued from profinite and rational pieces. The primary input is CompatibleSphericalLifts, including the lifted coherent Čech and arithmetic-gluing data.
- `globalEvenFiltration.profinite`: Restriction to the profinite filtration. The primary input is CompatibleSphericalLifts, including the lifted coherent Čech and arithmetic-gluing data.
- `globalEvenFiltration.rational`: Restriction to fil_ev HH(R/A) ⊗ ℚ[β]_ev. The primary input is CompatibleSphericalLifts, including the lifted coherent Čech and arithmetic-gluing data.
- `globalComparison`: The glued ψ^0_R : q-dR_{R/A} → gr^0_{ev,hS¹}TC⁻(ku_R/ku_A). The primary input is CompatibleSphericalLifts, including the lifted coherent Čech and arithmetic-gluing data.

**Checks.**

- `globalEvenFiltration.integers`: For A = R = ℤ: fil_{ev,hS¹}TC⁻(ku/ku) = τ_{≥2⋆}ku^{hS¹}.
- `globalEvenFiltration.rational_part`: After −⊗ℚ the filtration is fil_{HKR}HH(R/A) ⊗ ℚ[β]_ev.
- `globalEvenFiltration.identity_base`: For R=A and the identity spherical lift, relative THH(ku_A/ku_A) is ku_A with trivial circle action. Its compatible global filtration recovers the coefficient even filtration; this checks the identity base independently of rational projection.

Also establish If (E_2) holds at every prime, the glued filtration is intrinsic (a solid even filtration); otherwise it is the ad hoc gluing.

*Needs:* §6.7 (Even filtrations on solid relative THH); §6.9 (The comparison map ψ^0_R and the q-Hodge filtration); §6.1 (Spherical lifts and the base hypotheses); StableHomotopyKTheory §7.23; §6.1 (Compatible local and global spherical lifts).

**q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27).** Let A be a perfectly covered Λ-ring whose p-completions satisfy 3.1(tC_p) with lifts S_{Â_p}, and R a quasi-lci A-algebra with bounded p^∞-torsion for all p, each R̂_p satisfying 3.2(E_2) or 3.2(E_1), with the addendum (R_2) (true if 2 ∈ R^×); let S_A, S_R be the glued lifts and ku_A = ku ⊗ S_A, ku_R = ku ⊗ S_R. With the glued even filtration (§6.10 (Global even filtrations by profinite and rational gluing)) and fil_{q-Hdg} defined as the pullback along ψ^0_R, ψ^0_R identifies the completed q-Hodge filtration fil^⋆_{q-Hdg}q-dR^∧_{R/A} with Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻(ku_R/ku_A) as graded ℤ[β][[t]]-modules. Modulo β the uncompleted filtration becomes the Hodge filtration on dR_{R/A}; after rationalisation and (q−1)-completion it becomes the combined Hodge and (q−1)-adic filtration on (dR_{R/A} ⊗ ℚ)[[q−1]]; so (R, fil_{q-Hdg}q-dR_{R/A}) is an object of AniAlg^{q-Hdg}_A (HabiroCohomologyFoundations Layer 4 (HQ.3)). Theorem 1.2 is the case A = ℤ, R quasi-syntomic with 2 ∈ R^× and a connective E_2-lift S_R.

Throughout this statement, As stated; only the completion of fil_{q-Hdg} is identified (fil_{q-Hdg} itself is a pullback and need not be complete).

([W](#w), §4.4 'The global case', Theorem 4.27, p. 50; [W](#w), §1.1, Theorem 1.2 (see Theorem 4.27), p. 3; [W](#w), §4.4, Theorem 4.27 (second half), p. 50.)

The construction proceeds as follows. Combine the local theorems (§6.9 (The p-complete q-Hodge comparison for p > 2 (Wagner Theorem 4.8)) and §6.9 (The p-complete q-Hodge comparison at p = 2 (Wagner Theorem 4.14))) at each prime with the rational comparison TC⁻(ku_R⊗ℚ/ku_A⊗ℚ) ≃ HC⁻(R⊗ℚ[β]/A⊗ℚ[β]). Glue (§6.10 (Global even filtrations by profinite and rational gluing)) and check the identification on the pullback (Lemma 4.29). Mod-β and rational statements from the local ones; HQ.3's definition of q-Hodge-filtered animated rings.

Also establish For R = ℤ[x] with S_R = S[x], the filtration is Raksit's coordinate q-Hodge filtration (§6.10 (The framed comparison (Raksit; Wagner Theorem 6.10)), Check `framedTrace.line`; general framed smooth algebras are the framed comparison itself). β ↦ 0 recovers Antieau/HRW: fil_{Hdg}dR^∧_{R/ℤ} ≃ Σ^{−2∗}gr^∗_{ev,hS¹}HC⁻(R/ℤ).

*Needs:* §6.10 (Global even filtrations by profinite and rational gluing); §6.9 (The p-complete q-Hodge comparison for p > 2 (Wagner Theorem 4.8)); §6.9 (The p-complete q-Hodge comparison at p = 2 (Wagner Theorem 4.14)); §6.9 (q-Hodge filtrations of quasi-regular quotients (Wagner Theorem 4.17)); HabiroCohomologyFoundations Layer 4 (HQ.3); §6.1 (Compatible local and global spherical lifts).

**Completeness, multiplicativity and the graded comparison.** In the situation of §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)): (i) fil^⋆_ev THH(ku_R/ku_A) and fil^⋆_{ev,hS¹}TC⁻ are exhaustive and complete (Wagner Corollary 3.14 and its global form); (ii) if the lifts are E_n at every prime (n ≥ 2), the comparison equivalences are E_{n−1}-monoidal and (R, fil_{q-Hdg}) is an E_{n−1}-algebra in AniAlg^{q-Hdg}_A (Remark 4.28; with only an E_2-lift, E_1-monoidal); at primes with 3.2(E_1) the E_∞-structure comes a posteriori from Theorem 4.17; (iii) the graded comparison: Σ^{−2i}gr^i_{ev,hS¹}TC⁻ ≃ fil^i_{q-Hdg}q-dR^∧ for every i, compatibly with the derived q-de Rham complex and with HQ.3's q-Hodge complex q-Hdg_{R/A} := (colim(fil^0 →^{(q−1)} fil^1 → …))^∧_{(q−1)}, which is gr^0 of the S¹-even filtration on TC⁻(KU_R/KU_A) (the β-localisation).

Throughout this statement, As in §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)).

([W](#w), §4.4, Remark 4.28, p. 50; [W](#w), §5 introduction (unnumbered), p. 53; cf. §1.2, p. 6.)

The construction proceeds as follows. Completeness: Corollary 3.14 locally and gluing. Monoidality: Remarks 4.9 and 4.28 (E_n-lifts give E_{n−1}-monoidal comparisons). q-Hodge complex: invert β (GeneralizedCohomology G5.4 and G2.8) and compare with HQ.3's colimit (Wagner §5 introduction; the identification there is stated without proof and is recorded as a step).

Also establish For S_R = S[x] (E_∞-lift), fil_{q-Hdg} is a filtered E_∞-algebra.

*Needs:* §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)); §6.9 (q-Hodge filtrations of quasi-regular quotients (Wagner Theorem 4.17)); GeneralizedCohomology G5.4 and G2.8; HabiroCohomologyFoundations Layer 4 (HQ.3); §6.1 (Compatible local and global spherical lifts).

**Framed smooth inputs (Wagner Examples 6.7–6.8).** Let A be a base as in §6.1 (Compatible local and global spherical lifts): a perfectly covered Λ-ring whose p-completions carry spherical bases satisfying Wagner 3.1(tC_p), glued to a connective E∞-ring S_A. Such an A is torsion free (HabiroRings §1.2). Let S be a smooth A-algebra with an étale framing □ : P = A[x₁,…,x_d] → S, d ≥ 0, and put S_P = S_A[x₁,…,x_d]. The framing lifts to a unique étale map of E∞-rings S_P → S_{S,□} with S_{S,□} ⊗ ℤ ≃ S (§6.1 `SphericalLift.ofEtale`, by the lifting theorem recorded in §6.14), and ku_{S,□} := ku ⊗ S_{S,□}. Being E∞, the p-completion of S_{S,□} is an (E₂) choice for Ŝ_p at every prime. Since S is flat over the torsion-free ring A, every Ŝ_p is p-torsion free, and Ŝ_p also has an (E₁) choice: the cover Ŝ_p → Ŝ_{p,∞} := (Â_p⟨x₁^{1/p^∞},…,x_d^{1/p^∞}⟩ ⊗_{Â_p⟨x₁,…,x_d⟩} Ŝ_p)^∧_p, whose p-completed Čech nerve is lifted by base change along S_P → S_{S,□} of the Čech nerve of the E∞-map S_P → S_A[x₁^{1/p^∞},…,x_d^{1/p^∞}]. The input `ofFramed □` takes the (E₂) choice at every odd prime and this (E₁) choice at 2, so it satisfies 4.18(R) together with the addendum (R₂). The input `ofFramedE2 □` takes the (E₂) choice at every prime; its glued even filtration is the intrinsic one (Wagner Lemma 4.24), but its 2-adic branch is not an (E₁) choice.

Throughout this statement, A as in §6.1 (Compatible local and global spherical lifts); S smooth over A with an étale framing in d ≥ 0 coordinates. No prime is inverted, and no lift other than the canonical étale one is chosen.

([W](#w), §6.1, Examples 6.7 and 6.8, pp. 82–83; §4.4, 4.18, p. 46; 4.18a and Lemma 4.24, p. 49.)

The construction proceeds as follows. Lift the framing by the étale lifting theorem over the connective E∞-ring S_P. For the (E₁) choice, show that Ŝ_p → Ŝ_{p,∞} is a p-quasisyntomic cover, that Ŝ_{p,∞}/p is relatively semiperfect over Â_p (the adjoined p-power roots make the relative Frobenius surjective, and Ŝ_p is p-completely étale over Â_p⟨x₁,…,x_d⟩), and that the base-changed Čech nerve reduces to the p-completed Čech nerve of the cover. Glue by `QHodgeTrace.CompatibleSphericalLifts.glue`. An étale map of framed algebras compatible with the framings induces maps of all these data, by uniqueness of étale lifts.

Provide the following operations and identities.

- `QHodgeTrace.CompatibleSphericalLifts.ofFramed`: the input with the (E₂) choice S_{S,□} at odd primes and the perfectoid-cover (E₁) choice at 2; it satisfies 4.18a(R₂).
- `QHodgeTrace.CompatibleSphericalLifts.ofFramedE2`: the input with the (E₂) choice S_{S,□} at every prime.
- `QHodgeTrace.CompatibleSphericalLifts.ofFramed_map`: functoriality of both inputs in étale maps of framed algebras compatible with the framings.

**Checks.**

- `QHodgeTrace.CompatibleSphericalLifts.ofFramed.line`: for S = A[x] with □ the identity, S_{S,□} = S_A[x], and the cover at 2 is Â₂⟨x⟩ → Â₂⟨x^{1/2^∞}⟩; over A = ℤ this is §6.1 `SphericalLift.polynomial` with its perfectoid cover.
- `QHodgeTrace.CompatibleSphericalLifts.ofFramed.etale`: for d = 0 the algebra S is étale over A, S_{S,□} is its étale lift, and Ŝ_{p,∞} = Ŝ_p: the identity cover suffices, because the relative Frobenius of an étale algebra is an isomorphism.
- `QHodgeTrace.CompatibleSphericalLifts.ofFramed.not_etale`: the map ℤ[x] → ℤ[x], x ↦ x², is finite and flat but is not a framing. It sends dx to 2x dx, which is not an isomorphism of Kähler differentials, so it has no étale lift, and the coordinate q-connection of the source does not describe the target.
- `QHodgeTrace.CompatibleSphericalLifts.ofFramedE2.not_at_two`: for S = ℤ[x], the input `ofFramedE2` has the (E₂) choice at 2, where the 2-adic q-Hodge comparison is open (§6.9, Wagner Theorem 4.14). The glued comparison map of §6.10 (Global even filtrations by profinite and rational gluing) is therefore built from `ofFramed`, not from `ofFramedE2`.

*Needs:* §6.1 (Spherical lifts and the base hypotheses); §6.1 (Compatible local and global spherical lifts); §6.14 (Étale algebras lift uniquely to étale E_∞-algebras); §6.10 (Global even filtrations by profinite and rational gluing); HabiroRings HR.1 — perfectly covered bases are torsion free; `Algebra.Etale`; `Algebra.Smooth`; `MvPolynomial`.

**q-divided powers on the diagonal (Wagner Lemma 6.11).** For d ≥ 0 write N_d = ∏_{0≤i<d}(x − q^iy) ∈ ℤ[x,y,q], with the variables ordered x, y, q, and δ^{(d)}_q(x,y) = N_d/[d]_q!, where [d]_q! = [1]_q[2]_q⋯[d]_q. Thus δ^{(0)} = 1, δ^{(1)} = x − y, and δ^{(d)}_q(x,y) specialises to (x−y)^d/d! at q = 1. Two polynomial identities fix the normalisation: N_{d+1}(qx,y) − N_{d+1}(x,y) = (q^{d+1}−1)·x·N_d(x,y), because ∏_{i≤d}(qx − q^iy) = (qx − y)·q^d·N_d(x,y); and N_d(x,y) = (x−y)^d at q = 1. Fix a prime p, give ℤ_p[x,y,q] the δ-structure with δ(x) = δ(y) = δ(q) = 0, and let q-D = ℤ_p[x,y,q]{φ(x−y)/[p]_q}^∧_{(p,q−1)} be the q-PD envelope of (x−y) in the sense of BS Lemma 16.10. Then q-D is the (p,q−1)-completion of the subring of ℚ_p[x,y][[q−1]] generated by ℤ_p[x,y,q] and the elements δ^{(d)}_q(x,y), d ≥ 1. The q-derivatives ∇_{q,x}f = (f(qx,y) − f(x,y))/((q−1)x) and ∇_{q,y}f = (f(x,qy) − f(x,y))/((q−1)y) satisfy ∇_{q,x}δ^{(d)}_q(x,y) = δ^{(d−1)}_q(x,y) and ∇_{q,y}δ^{(d)}_q(x,y) = −δ^{(d−1)}_q(x,qy), so they preserve q-D. For the toric Λ-structure, with x, y and q of rank one, δ^{(d)}_q(x,y) = (q−1)^d λ^d((x−y)/(q−1)) after inverting h and the q-factorials.

Throughout this statement, p is any prime, p = 2 included; the δ- and Λ-structures are the toric ones; the q-PD envelope is (p,q−1)-completed.

([W](#w), §6.2, Lemma 6.11 and its proof, p. 84; [Pri](#pri), §1.1, Remark 1.2 and Lemma 1.3, p. 3; [BS](#bs), Lemma 16.10, pp. 110–111.)

The construction proceeds as follows. It suffices to put each (q−1)^dλ^d((x−y)/(q−1)) into q-D; generation and the description of q-D can then be checked modulo q−1, where q-D/(q−1) is the p-torsion-free PD envelope of (x−y) in ℤ_p[x,y]. That reduction makes (p, q−1) a regular sequence in q-D, hence also (p,(q;q)_d) for every d, since up to units (q;q)_d is a product of factors 1 − q^{p^a} ≡ (1−q)^{p^a} modulo p. The Adams operations ψ^ℓ, ℓ ≠ p, are δ-maps and extend to q-D by its universal property; the resulting Λ-structure extends to the localisation at all (q;q)_d, where λ^d((x−y)/(q−1)) = δ^{(d)}_q(x,y)/(q−1)^d (Pridham's Lemma 1.3, with x and y exchanged). Next, (q−1)ψ^n((x−y)/(q−1)) ∈ q-D: it suffices to take n = p^a and to show that [p^a]_q divides x^{p^a} − y^{p^a} in q-D. By flatness of q-D over ℤ_p[[q−1]] this is checked separately for each factor Φ_{p^i}(q), i ≤ a, and divisibility by Φ_{p^a}(q) is φ^{a−1} applied to φ(x−y)/[p]_q. The Newton relation ψ_t = −t (d/dt) log λ_{−t} then puts (q−1)^dλ^d((x−y)/(q−1)) into q-D[1/p], and regularity of (p,(q;q)_d) gives q-D[1/p] ∩ q-D[(q;q)_d^{−1}] = q-D.

Provide the following operations and identities.

- `diagonalNumerator`: N_d = ∏_{0≤i<d}(x − q^iy) in `MvPolynomial (Fin 3) ℤ`, with variables 0 = x, 1 = y and 2 = q.
- `diagonalNumerator_shift`: N_{d+1}(qx,y) − N_{d+1}(x,y) = (q^{d+1}−1)·x·N_d(x,y).
- `diagonalNumerator_one`: N_d(x,y) = (x−y)^d at q = 1.
- `qPDDiagonal`: the description of q-D by the elements δ^{(d)}_q(x,y), with the two q-derivative formulas and the λ-ring formula.

**Checks.**

- `diagonalNumerator.degree_two`: (qx−y)(qx−qy) − (x−y)(x−qy) = (q²−1)x(x−y), the case d = 1 of the shift identity. Dividing by (q−1)x[2]_q! gives ∇_{q,x}δ^{(2)}_q(x,y) = x − y for δ^{(2)}_q(x,y) = (x−y)(x−qy)/(1+q).
- `diagonalNumerator.classical_fails`: the classical numerator (x−y)^d has the same value at q = 1 but fails the shift identity already for d = 2: (qx−y)² − (x−y)² − (q²−1)x(x−y) = (q−1)²xy.
- `diagonalNumerator.small`: N_0 = 1 and N_1 = x − y.
- `qPDDiagonal.pochhammer_sign`: Wagner normalises by the q-Pochhammer symbol (q;q)_d = ∏_{k≤d}(1−q^k). Since (q−1)^d/(q;q)_d = (−1)^d/[d]_q!, his generators (q−1)^dN_d/(q;q)_d equal (−1)^dδ^{(d)}_q(x,y). They generate the same ring, but in that normalisation the λ-ring and x-derivative formulas he displays hold only up to the factors (−1)^d and −(q−1)^{−1}. At d = 1, λ¹((x−y)/(q−1)) = (x−y)/(q−1), not (x−y)/(1−q). At d = 2 the λ-ring formula is checked directly: for z = (x−y)/(q−1), (z² − ψ²(z))/2 = (x−y)(x−qy)/((q−1)²(1+q)).
- `qPDDiagonal.prime_level`: modulo [p]_q = Φ_p(q) one has N_p ≡ x^p − y^p = φ(x−y), and [p−1]_q! is a unit of ℤ_p[[q−1]]. So δ^{(p)}_q(x,y) lies in q-D exactly because φ(x−y)/[p]_q does, while δ^{(e)}_q(x,y) for e < p already lies in ℤ_p[x,y][[q−1]].

*Needs:* PrismaticCohomology Layer 0 (δ-rings; the δ-structure with δ(x_i) = 0); PrismaticCohomologyPartII §5.1 ([p]_q) and §§5.7–5.8 (q-PD envelopes of completely regular sequences, with flatness, base change and reduction to PD envelopes; BS Lemma 16.10); HabiroRings HR.1 (the toric Λ-structure and its Adams operations); `MvPolynomial`; `MvPolynomial.aeval`.

**The framed Čech resolution (Wagner 6.12 and Lemma 6.13).** Keep the framed input of §6.10 (Framed smooth inputs (Wagner Examples 6.7–6.8)). Let A → P^• and S_A → S_{P^•} be the Čech nerves of A → P and S_A → S_P, put ku_{P^•} = ku ⊗ S_{P^•}, and write x_k^{(r)} ∈ P^n = P^{⊗_A(n+1)} for the k-th coordinate in the r-th tensor factor. Let R_n = S^{⊗_A(n+1)}, let J_n = ker(R_n → S) be its diagonal ideal, and let R̂_n be the J_n-adic completion of R_n. Let q-D^n be the h-completion of the subring of (R̂_n ⊗ ℚ)[[h]] generated by R̂_n[[h]] and all δ^{(e)}_q(x_k^{(r)}, x_k^{(s)}) with e ≥ 1, 1 ≤ r, s ≤ n+1 and 1 ≤ k ≤ d. Filter it by the ideals generated by h in degree 1 and by δ^{(e)}_q(x_k^{(r)},x_k^{(s)}) in degree e, and let fil^⋆q-D̂^• be the completed cosimplicial filtered ring. The completion along J_n is needed. The differences x_k^{(r)} − x_k^{(s)} generate an ideal I_n with R_n/I_n = S^{⊗_P(n+1)}, and since P → S is étale this ring is S times a complementary factor; so J_n = I_n + (e) for an element e that is idempotent modulo I_n. After completion along J_n the complementary factor disappears and J_nR̂_n = I_nR̂_n. Wagner's 6.12 forms the subring inside (S^{⊗_A(n+1)} ⊗ ℚ)[[h]] itself. When S ⊗_P S = S, for instance for S = P or a localisation of P, its completed filtration agrees with fil^⋆q-D̂^•: the coordinate differences already generate J_n, and filtration completion includes completion along this ideal. For a general étale framing the coordinate differences leave extra diagonal components, so completion along the full J_n is essential even after filtration completion. Then there is a canonical isomorphism of cosimplicial graded ℤ[β][[t]]-modules π_{2∗}TC⁻(ku_{S,□}/ku_{P^•}) ≅ fil^⋆q-D̂^•.

Throughout this statement, the framed input as above; ℤ[β][[t]] is identified with the Rees ring of (q−1)^⋆ℤ[[q−1]] as in §6.9 (The comparison map ψ^0_R and the q-Hodge filtration).

([W](#w), §6.2, 6.12 and Lemma 6.13 with its proof, pp. 84–86; the completion along J_n is added here.)

The construction proceeds as follows. For each n apply §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)) to S as an algebra over the toric base P^n, with base lift S_{P^n} and the identity-cover (E₁) choice at every prime. S is p-torsion free; it is quasi-lci over P^n, being the quotient of the étale P^n-algebra S^{⊗_A(n+1)} by the regular ideal of the diagonal; S/p is relatively semiperfect over P^n, since the relative Frobenius of S^{⊗_A(n+1)} is an isomorphism and S is a quotient; and S_{S,□} is a connective E∞-S_{P^n}-algebra through the multiplication S_{P^n} → S_P. Wagner applies Theorem 4.27 without listing these inputs over P^n, so verifying them, including the base hypotheses 4.18(A) for P^n, is part of this target. The completed filtration then has an arithmetic fracture square whose four corners are static in every filtration degree. This is checked modulo β, where they are the Hodge-filtered derived de Rham complexes of the quasiregular quotient S of S^{⊗_A(n+1)}, their p-completions and their Hodge-completed rationalisation; so the square is a pullback of filtered abelian groups. At p, the δ-structure of P̂^n_p extends uniquely to (S^{⊗_A(n+1)})^∧_p (PrismaticCohomology §0.59). Wagner's proof identifies the p-completed derived q-de Rham complex of S over P^n with the q-PD envelope of the completely regular ideal Ĵ_p = ker((S^{⊗_A(n+1)})^∧_p → Ŝ_p); this identification is an obligation of the target, from HabiroCohomologyFoundations Layer 2 and PrismaticCohomologyPartII §§5.7–5.8. The envelope contains the elements δ^{(e)}_q(x_k^{(r)}, x_k^{(s)}) by `qPDDiagonal`, and they lie in filtration e by the identity-cover description (§6.9, Wagner Theorem 4.17). Rationally, P → S étale identifies the Hodge-completed de Rham complex of S over P^n with that of S over R_n, which is the (J_n⊗ℚ,h)-adic completion of (R_n⊗ℚ)[[h]]; it receives (R̂_n ⊗ ℚ)[[h]] and contains δ^{(e)}_q(x_k^{(r)}, x_k^{(s)}) in filtration e. The pullback gives a filtered map fil^⋆q-D̂^n → fil^⋆_{q-Hdg}q-dR^∧_{S/P^n}, which is an isomorphism modulo β.

Provide the following operations and identities.

- `framedCech`: the cosimplicial isomorphism π_{2∗}TC⁻(ku_{S,□}/ku_{P^•}) ≅ fil^⋆q-D̂^•.
- `framedCech.inputs`: the base and identity-cover inputs over each P^n required by §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)).
- `framedCech.static`: the four corners of the completed fracture square over P^n are static in every filtration degree.

**Checks.**

- `framedCech.degree_zero`: in cosimplicial degree 0, q-D^0 = S[[h]] with the h-adic filtration, since x_k^{(1)} − x_k^{(1)} = 0 and nothing is adjoined. This matches TC⁻(ku_{S,□}/ku_P) = ku_{S,□}^{hS¹} with trivial circle action, S being étale over P.
- `framedCech.line`: for S = A[x], q-D¹ reduces modulo h to the PD envelope of the diagonal ideal (x^{(1)} − x^{(2)}) of A[x] ⊗_A A[x], completed along its divided-power filtration, with δ^{(e)}_q(x^{(1)},x^{(2)}) reducing to the divided power (x^{(1)} − x^{(2)})^e/e! in Hodge filtration e.
- `framedCech.diagonal_completion`: for d = 0, A = ℤ[1/2] and S = ℤ[1/2][i], every TC⁻(ku_S/ku_{P^n}) is ku_S^{hS¹} and every q-D^n is S[[h]], because J_n is generated by an idempotent and completion along it is the quotient R_n/J_n = S. Without that completion the ring in cosimplicial degree 1 would be (S ⊗_ℤ[1/2] S)[[h]] ≅ (S × S)[[h]], and the totalisation would be ℤ[1/2][[h]] instead of S[[h]].
- `framedCech.not_classical`: for p = 2, the ring generated in ℚ₂[x,y][[h]] by ℤ₂[x,y][[h]] and the classical divided powers (x−y)^e/e! has the same reduction modulo h but is not stable under ∇_{q,x}. Indeed ∇_{q,x}((x−y)²/2) = (x−y) + hx/2, and substituting y = x maps that ring into ℤ₂[x][[h]] while sending hx/2 to itself. The proof of the framed comparison needs the q-divided powers.

*Needs:* §6.10 (Framed smooth inputs (Wagner Examples 6.7–6.8)); §6.10 (q-divided powers on the diagonal (Wagner Lemma 6.11)); §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)); §6.9 (q-Hodge filtrations of quasi-regular quotients (Wagner Theorem 4.17)); PrismaticCohomology §0.59; PrismaticCohomologyPartII §§5.7–5.8; HabiroCohomologyFoundations Layer 2 (HQ.2) — the derived q-de Rham complex; DerivedDeRhamCohomology Layer 2 — p completed derham; HabiroRings HR.1.

**The framed comparison (Raksit; Wagner Theorem 6.10).** For the framed input (S,□) over A in d coordinates, let q-Ω^∗_{S/A,□} = (S[[h]] → Ω¹_{S/A}[[h]] → ⋯ → Ω^d_{S/A}[[h]]) be the coordinate q-de Rham complex, in homotopical degrees [−d,0], with ∇_q = Σ_k ∇_{q,k}dx_k and ∇_{q,k}f = (γ_k f − f)/((q−1)x_k). Here γ_k is the A[[h]]-algebra automorphism of P[[h]] with γ_k(x_k) = qx_k and γ_k(x_l) = x_l for l ≠ k, extended to S[[h]] through the étale framing, which is possible because γ_k is the identity modulo h. Let fil^i_{q-Hdg,□} be the subcomplex with h^{max(i−j,0)}Ω^j_{S/A}[[h]] in form degree j. Then, for the intrinsic even filtration of `ofFramedE2 □`, there is an equivalence of graded ℤ[β][[t]]-modules Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻(ku_{S,□}/ku_A) ≃ fil^∗_{q-Hdg,□}q-Ω^∗_{S/A,□}, natural in étale maps of framed algebras compatible with the framings. This holds in every relative dimension d and over every base of §6.1 (Compatible local and global spherical lifts); modulo β it is the Antieau and Hahn–Raksit–Wilson description of the Hodge filtration, the stupid filtration Ω^{≥i}_{S/A}.

Throughout this statement, A as in §6.1 (Compatible local and global spherical lifts); S smooth over A with an étale framing in d ≥ 0 coordinates; the even filtration is the glued filtration of the (E₂) choice S_{S,□} at every prime, which is intrinsic.

([W](#w), §6.2, Theorem 6.10, p. 83, and its proof, p. 86; §1.1, Theorem 1.4, p. 3, for A = ℤ and S = ℤ[x]; [W-Hab](#w-hab), §3.2, Example 3.12, pp. 25–26, for the coordinate complex; [BS](#bs), proof of Theorem 16.22, p. 115; [Stacks](#stacks), Example 60.19.1, Tag 07L7.)

The construction proceeds as follows. Compute the even filtration through the Čech resolution in the base: each TC⁻(ku_{S,□}/ku_{P^n}) is homotopy even by `framedCech`, and the polynomial resolution S_A → S_{P^•} is solid faithfully even flat of the kind used in Wagner Proposition 3.11 (§6.4 (Faithfully even flat ring maps), §6.7 (Even filtrations on solid relative THH)), so fil^⋆_ev TC⁻(ku_{S,□}/ku_A) ≃ lim_Δ τ_{≥2⋆}TC⁻(ku_{S,□}/ku_{P^•}). By `framedCech` it remains to compare the totalisation of fil^⋆q-D̂^• with fil^⋆_{q-Hdg,□}q-Ω^∗_{S/A,□}. The q-derivatives extend to q-D̂^• by `qPDDiagonal`. Form the double complex whose (n,j) term is fil^{⋆−j}q-D̂^n ⊗_{P^n}Ω^j_{P^n/A}, with differential ∇_q in j. For fixed n, the column is quasi-isomorphic to the column n = 0; this is checked modulo h, where it is the Poincaré lemma for the completed Hodge-filtered de Rham complex of PD envelopes (HabiroCohomologyFoundations §1.17). For fixed j > 0 the row is acyclic. In form degree 1 it is a sum over k of the cosimplicial modules ⊕_r fil^{⋆−1}q-D̂^n·dx_k^{(r)}, which have the shape of Stacks Example 60.19.1, so their identity is homotopic to zero; the higher form degrees follow as in the proof of BS Theorem 16.22. Hence the column n = 0 is quasi-isomorphic to the totalisation of the row j = 0. That column is fil^⋆_{q-Hdg,□}q-Ω^∗_{S/A,□}, because q-D^0 = S[[h]] and Ω^j_{P/A} ⊗_P S = Ω^j_{S/A}.

Provide the following operations and identities.

- `framedTrace`: Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻(ku_{S,□}/ku_A) ≃ fil^∗_{q-Hdg,□}q-Ω^∗_{S/A,□} for `ofFramedE2 □`, natural in étale maps of framed algebras compatible with the framings.
- `framedTrace.resolution`: fil^⋆_ev TC⁻(ku_{S,□}/ku_A) ≃ lim_Δ τ_{≥2⋆}TC⁻(ku_{S,□}/ku_{P^•}).
- `framedTrace.modBeta`: reduction by β identifies both sides with the Hodge filtration Ω^{≥⋆}_{S/A}, compatibly with the identification for HC⁻ in §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)).
- `framedTrace.twoAdic`: at p = 2, the filtration lim_Δ τ_{≥2⋆}TC⁻_■(ku_{Ŝ_{2,∞}^•}/ku_{Â_2}) of the (E₁) choice of `ofFramed □` agrees with the 2-adic even filtration of the E∞-lift computed by the polynomial resolution of Wagner Proposition 3.11, compatibly with the gluing data. Hence the glued filtrations of `ofFramed □` and `ofFramedE2 □` agree, and `framedTrace` holds for `ofFramed □`. Wagner Remark 3.10 indicates that the perfectoid resolution can replace the polynomial one but gives no proof, so this comparison is part of the target: a proof shows that the perfectoid resolution is also solid faithfully even flat with homotopy-even terms (§6.4 (Faithfully even flat ring maps)), so that both resolutions compute the solid even filtration of the E∞-lift.

**Checks.**

- `framedTrace.line`: for S = A[x] with □ the identity, fil^i = ((q−1)^iA[x][[h]] → (q−1)^{i−1}A[x][[h]]dx) for i ≥ 1, and ∇_q(x^n) = [n]_qx^{n−1}dx. Over A = ℤ this is Raksit's theorem (Wagner Theorem 1.4). Independently, THH(S[x]) ≃ Σ^∞_+B^{cyc}ℕ (§2.11 (THH and TC of spherical group rings and loop spaces)) splits by weight, and in weight n the differential is multiplication by [n]_q.
- `framedTrace.etale`: for d = 0 the coordinate complex has no forms and fil^i = h^{max(i,0)}S[[h]]: for étale S, TC⁻(ku_{S,□}/ku_A) = ku_{S,□}^{hS¹} with trivial action, and its even filtration is the double-speed Whitehead filtration.
- `framedTrace.plane`: for S = ℤ[x,y] over A = ℤ with the identity framing, no prime is inverted. The i-th step is (q−1)^{max(i,0)}ℤ[x,y][[h]] in form degree 0, (q−1)^{max(i−1,0)}(ℤ[x,y][[h]]dx ⊕ ℤ[x,y][[h]]dy) in form degree 1, and (q−1)^{max(i−2,0)}ℤ[x,y][[h]]dx∧dy in form degree 2.
- `framedTrace.not_hAdic`: the filtered quotient (F/β)^i = cofib(h : F^{i−1} → F^i) of the coordinate filtration is Ω^{≥i}_{S/A}. For the h-adic filtration h^{max(i,0)}q-Ω^∗_{S/A,□} it would be 0 for every i ≥ 1, which fails the Hodge reduction as soon as d ≥ 1.

*Needs:* §6.10 (Framed smooth inputs (Wagner Examples 6.7–6.8)); §6.10 (The framed Čech resolution (Wagner 6.12 and Lemma 6.13)); §6.10 (q-divided powers on the diagonal (Wagner Lemma 6.11)); §6.10 (Global even filtrations by profinite and rational gluing); §6.4 (Faithfully even flat ring maps); §6.7 (Even filtrations on solid relative THH); §2.11 (THH and TC of spherical group rings and loop spaces); HabiroCohomologyFoundations §1.14 and §1.17; DerivedDeRhamCohomology Layer 2 — p completed derham.

**The framed trace pair and its E∞-structure (Wagner Remark 6.14).** Let (S, F_tr) be the q-Hodge pair produced from `ofFramed □` by §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)), and (S, F_□) the coordinate pair of HabiroCohomologyFoundations §4.8. Two objects are kept apart. The completed filtration F̂_tr ≃ Σ^{−2∗}gr^∗_{ev,hS¹}TC⁻(ku_{S,□}/ku_A) lives on the completed derived q-de Rham complex q-dR^∧_{S/A} ≃ qΩ_{S/A} (HabiroCohomologyFoundations §4.22), and qΩ_{S/A} ≃ q-Ω^∗_{S/A,□} (HabiroCohomologyFoundations §1.14). There `framedTrace` and `framedTrace.twoAdic` give F̂_tr ≃ fil^⋆_{q-Hdg,□}, and in filtration degrees ≤ 0 this equivalence is ψ^0_S followed by the two identifications. The uncompleted filtration F_tr is the pullback of F̂_tr along qdR_{S/A} → q-dR^∧_{S/A}, and F_□ is the pullback of fil^⋆_{q-Hdg,□} along qdR_{S/A} → qΩ_{S/A}. Hence (S,F_tr) ≃ (S,F_□) in the category of pairs of HabiroCohomologyFoundations §4.1, compatibly with the zeroth-step, mod-β, rational and p-adic rational clauses and the squares between them. Since S_{S,□} is E∞ and the choice at 2 is (E₁), Wagner Remark 4.28 with n = ∞ makes (S, F_tr) an E∞-algebra in pairs. Transported along the equivalence, the coordinate pair, which HabiroCohomologyFoundations §4.8 equips only with an E₀-structure, becomes an E∞-algebra in pairs, and its Habiro–Hodge complex H(S,F_□) an E∞-algebra in Habiro-complete A[q]-modules (HabiroCohomologyFoundations §4.23). The filtered complex fil^⋆_{q-Hdg,□}q-Ω^∗_{S/A,□} is moreover a filtered derived commutative algebra over (q−1)^⋆A[[q−1]] in Raksit's sense. The structure depends on the framing through S_{S,□}; no comparison of the structures for two framings is asserted.

Throughout this statement, the framed input as above; the clause data of the coordinate pair are those constructed in HabiroCohomologyFoundations §4.8.

([W](#w), §6.2, Remark 6.14, p. 86; §4.4, Theorem 4.27 and Remark 4.28, p. 50; [W-Hab](#w-hab), §3.2, Example 3.12, pp. 25–26, and §3.1, Remark 3.6, pp. 22–23.)

The construction proceeds as follows. Compare the completed filtrations on qΩ_{S/A} by `framedTrace` and `framedTrace.twoAdic`, and identify the map in filtration degree zero with ψ^0_S through the gluing of §6.10 (Global even filtrations by profinite and rational gluing). Check the clauses on the static cosimplicial models of `framedCech`: there each clause map is a map of cosimplicial filtered rings, determined by its underlying map because all transition maps are injective, so the squares between clauses commute strictly and pass to the totalisation. Pull back along qdR_{S/A} → qΩ_{S/A} by HabiroCohomologyFoundations §4.1 (`QHodgeFiltration.ofUnderived`). Transport the multiplicative structure of Remark 4.28 along the equivalence of pairs, and apply HabiroCohomologyFoundations §4.23 to the Habiro–Hodge complex. For the stronger derived commutative refinement, totalise the cosimplicial static filtered commutative rings of `framedCech` in filtered derived commutative algebras and transport across `framedTrace` (Remark 6.14). An E∞-algebra structure on the underlying complex alone is not a substitute for this refinement.

Provide the following operations and identities.

- `framedTrace_completed`: F̂_tr ≃ fil^⋆_{q-Hdg,□} on qΩ_{S/A} ≃ q-Ω^∗_{S/A,□}, given in filtration degrees ≤ 0 by ψ^0_S followed by the identifications of HabiroCohomologyFoundations §§4.22 and 1.14.
- `framedTrace_pair`: (S,F_tr) ≃ (S,F_□) in the category of pairs, with all four clause data and their squares.
- `framedTrace_einfty`: the E∞-algebra structure on (S,F_tr) and on the coordinate pair, the filtered derived commutative structure on fil^⋆_{q-Hdg,□}q-Ω^∗_{S/A,□}, and the E∞-structure on H(S,F_□).

**Checks.**

- `framedTrace_pair.uncompleted`: for A = ℚ and S = ℚ[x^{±1}] framed by ℚ[x] → ℚ[x^{±1}], qdR_{S/ℚ} ≃ ℚ[[h]], while qΩ_{S/ℚ} ≃ Ω^•_{S/ℚ}[[h]] has H¹ spanned by dx/x (HabiroCohomologyFoundations §4.28). The comparison is between completed filtrations on qΩ, pulled back to qdR; it does not identify qdR with qΩ.
- `framedTrace_pair.etale`: for d = 0, F_tr is the h-adic filtration h^{max(i,0)}qdR_{S/A}, and H(S,F_tr) = H_{S/A} (HabiroCohomologyFoundations §4.21).
- `framedTrace_einfty.level`: for S = ℤ[x] the pair is E∞, from the E∞-lift S[x] at odd primes and the (E₁) choice at 2. For an input whose lift at some odd prime is known only to be E₂, Remark 4.28 gives only E₁; a construction asserting E∞ from an E₂ lift would be wrong.
- `framedTrace_einfty.notNaiveProduct`: the multiplication is not the strict product of forms on q-Ω^∗_{S/A,□}, which is not a differential graded algebra for ∇_q. For S = A[x], ∇_q(x·x) = (1+q)x dx, whereas a derivation for the untwisted product would give 2x dx; the q-Leibniz rule ∇_q(fg) = ∇_q(f)γ(g) + f∇_q(g) gives qx dx + x dx. The E∞-structure comes from the lift, not from the formula for the complex.

*Needs:* §6.10 (The framed comparison (Raksit; Wagner Theorem 6.10)); §6.10 (The framed Čech resolution (Wagner 6.12 and Lemma 6.13)); §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)); §6.10 (Completeness, multiplicativity and the graded comparison); §6.10 (Global even filtrations by profinite and rational gluing); HabiroCohomologyFoundations §1.14, §4.1, §4.4, §4.8, §4.21, §4.22 and §4.23.

### 6.11 Cyclonic coefficients and the Adams coherence

**Cyclonic spectra.** Cyclonic spectra (Barwick–Glasman) are spectra with an S¹-action that is genuine for every finite cyclic subgroup C_m ⊆ S¹: the localising subcategory of genuine S¹-spectra generated by the cells S¹/C_m. The families {(−)^{C_m}} and {(−)^{ΦC_m}} are jointly conservative; the inclusion into genuine S¹-spectra has a colimit-preserving right adjoint inducing a symmetric monoidal structure. Bounded-below cyclonic spectra (all X^{C_m}, equivalently all X^{ΦC_m}, bounded below) are equivalent to naive cyclonic spectra (families (Y_m)_m with S¹/C_m-actions and Frobenius-type maps), and the genuine fixed points are X^{C_m} ≃ eq(∏_{d|m}(X^{ΦC_d})^{hC_{m/d}} ⇉ ∏_p ∏_{pd|m}((X^{ΦC_d})^{tC_p})^{hC_{m/pd}}) (can and φ). Unlike genuine cyclotomic spectra (§2.14 (Genuine cyclotomic spectra)), cyclonic spectra carry no identifications Φ^{C_p}X ≃ X so the cyclonic structure alone supplies no TR cyclotomic restriction maps. Ordinary subgroup restriction and inflation maps still exist.

Throughout this statement, Finite cyclic subgroups only (F-genuine S¹-spectra, §2.14 (Genuine C_{p^∞}-spectra and F-genuine T-spectra)).

([W](#w), §5.2, paragraph 5.20 'Cyclonic spectra', p. 60; [W](#w), §5.2, Lemma 5.28, p. 63.)

The construction proceeds as follows. Define as the localising subcategory generated by S¹/C_m-cells (Wagner 5.20). Joint conservativity and the monoidal structure (5.21–5.22). Bounded-below comparison with naive cyclonic spectra (Proposition 5.26, the cyclonic analogue of NS18 Theorem II.6.9) and the fixed-point formula (Lemma 5.28, generalising NS18 Corollary II.4.7).

Provide the following operations and identities.

- `CyclonicSpectrum`: The ∞-category of cyclonic spectra.
- `CyclonicSpectrum.fixedPoints`: X ↦ X^{C_m} with residual S¹/C_m-action.
- `CyclonicSpectrum.geometricFixedPoints`: X ↦ X^{ΦC_m}.
- `CyclonicSpectrum.conservative`: {(−)^{C_m}} (equivalently {(−)^{ΦC_m}}) are jointly conservative.
- `CyclonicSpectrum.boundedBelow_naive`: Bounded-below cyclonic spectra ≃ bounded-below naive cyclonic spectra.
- `CyclonicSpectrum.fixedPoints_formula`: X^{C_m} as the equalizer of can and φ over divisors of m.

**Checks.**

- `CyclonicSpectrum.trivial`: For m = 1, X^{C_1} is the underlying spectrum.
- `CyclonicSpectrum.ku_fixed`: π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1).
- `CyclonicSpectrum.no_restriction`: A cyclonic spectrum need not have TR-type restriction maps R : X^{C_{pm}} → X^{C_m}, which would come from an identification Φ^{C_p}X ≃ X: for cyclonic ku, Φ^{C_p}ku ≄ ku (q ∈ π_0(ku^{ΦC_p}) satisfies Φ_p(q) = 0). The inclusion-of-fixed-points maps F (restriction of representations, q ↦ q) and the inflations do exist.

Also establish THH(S_R) with its genuine cyclotomic structure restricts to a cyclonic spectrum. ku_{S¹} (genuine S¹-equivariant ku) restricts to cyclonic ku (§6.11 (Cyclonic ku and KU)).

*Needs:* §2.14 (Genuine C_{p^∞}-spectra and F-genuine T-spectra); §2.13 (Geometric fixed points as a localisation); §2.13 (Isotropy separation for cyclic p-groups); §2.17 (The restriction pullback for genuine fixed points); §2.15 (Genuine and naive cyclotomic spectra agree on bounded below objects).

**Cyclonic ku and KU.** Genuine S¹-equivariant connective K-theory ku_{S¹} restricts to a cyclonic E_∞-ring; KU_{S¹} := ku_{S¹}[β^{−1}] with the genuine Bott element (equivariant Snaith theorem). Its fixed points: π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1), π_*(KU^{C_m}) ≅ ℤ[β^{±1}, q]/(q^m − 1), ku^{C_m} ≃ τ_{≥0}(KU^{C_m}) (π_0 = RU(C_m)); geometric fixed points π_*(ku^{ΦC_m}) = the non-negative part of ℤ[β, t]/[m]_{ku}(t) with [d]_{ku}(t), d | m proper, inverted; inflations along z ↦ z^n give ku^{C_m} ⊗_{S[q], ψ^n} S[q] ≃ ku^{C_{mn}} with q ↦ q^n, β ↦ β; residual homotopy fixed points π_{2∗}((ku^{C_m})^{h(S¹/C_m)}) ≅ the (q^m − 1)-adic filtration of ℤ[q]^∧_{(q^m−1)}. Each ku^{ΦC_m} is bounded below, so the cyclonic fixed-point formula applies to ku and THH(ku_R/ku_A), but not to the KU versions, which are obtained by β-localisation.

Throughout this statement, Genuine equivariant K-theory of the circle (equivariant Bott periodicity, Segal's RU(C_m)).

([W](#w), §5.3, paragraph 5.32 'Cyclonic ku', p. 66; [W](#w), §5.3, paragraph 5.33 'Genuine fixed points of ku', p. 66; [W](#w), §5.3, Proposition 5.42, p. 69.)

The construction proceeds as follows. Construct ku_{S¹} (Wagner 5.32 and Appendix C, equivariant Snaith Lemma C.4). Compute fixed and geometric fixed points (5.33, Proposition 5.42; RU(C_m) = ℤ[q]/(q^m − 1)). Inflation maps (Corollary 5.35) and bounded-belowness (5.37).

Provide the following operations and identities.

- `cyclonicKu`: ku_{S¹} as a cyclonic E_∞-ring.
- `cyclonicKU`: KU_{S¹} = ku_{S¹}[β^{−1}].
- `cyclonicKu.fixedPoints`: π_*(ku^{C_m}) ≅ ℤ[β, q]/(q^m − 1).
- `cyclonicKu.inflation`: ku^{C_m} → ku^{C_{mn}}, q ↦ q^n, β ↦ β.
- `cyclonicKu.geometric_boundedBelow`: Each ku^{ΦC_m} is bounded below.

**Checks.**

- `cyclonicKu.m_one`: ku^{C_1} = ku.
- `cyclonicKu.pi0_C2`: π_0(ku^{C_2}) = ℤ[q]/(q² − 1) = RU(C_2).
- `cyclonicKU.not_bounded_below`: For m=1, KU^{ΦC_1}=KU has π_{−2j}=ℤ for every j≥1, by Bott periodicity. Thus the bounded-below cyclonic machinery cannot be applied to KU itself; KU-filtrations are defined by β-localisation.

Also establish m = 1: ku^{C_1} = ku, π_* = ℤ[β].

*Needs:* §6.11 (Cyclonic spectra); GeneralizedCohomology G5.4; GeneralizedCohomology G5.4 and G3.8; §5.3 (ku and KU with circle and cyclic-group actions); §2.12 (Genuine G-spectra, genuine and geometric fixed points).

**Cyclonic Adams lift coherence.** Wagner Assumption A₂ is a morphism S_A^cyct→S_A^triv of E∞ algebras in the coherent cyclonic category, whose underlying S¹-equivariant map is the identity. Geometric fixed points yield S¹-equivariant E∞ maps ψ^m:S_A→S_A for m≥1, together with compatible paths in the squares can_p ψ^{pm} ≃ (ψ^m)^{tC_p} φ_p for every prime p and m. The full morphism includes the higher coherences; these squares are not bare equalities of underlying maps. For commuting Frobenius lifts, ψ¹=id and ψ^{pm}=ψ^mψ^p, with coherent commutation yielding composition/divisibility compatibility. The corrected relative cyclonic THH is THH(S_R/S_A)^cyct⊗_{S_A^cyct}S_A^triv, tensored with cyclonic ku.

Throughout this statement, Global compatible lifts; 2 invertible in R for the 5.51/5.63 applications.

([W](#w), 5.43(A₂), Lemma 5.44, pp. 70–71; Remark 6.5, p. 82.)

The construction proceeds as follows. Use a morphism in the coherent cyclonic E∞ algebra category as the primary datum. Take geometric fixed points to obtain ψ^m and coherent Tate squares. For commuting Frobenius lifts construct multiplication-indexed operations with all composition coherences. Base change cyclonic THH through that morphism.

Provide the following operations and identities.

- `QHodgeTrace.CyclonicBaseCoherence`: Cyclonic E∞ morphism over the identity underlying circle algebra.
- `QHodgeTrace.CyclonicBaseCoherence.adams`: Geometric fixed-point ψ^m with reduction to Λ-ring Adams operations.
- `QHodgeTrace.CyclonicBaseCoherence.frobeniusSquare`: Compatible Tate-square paths for every p,m.
- `QHodgeTrace.CyclonicBaseCoherence.fromFrobenius`: Coherently commuting Frobenius lifts construct ψ^{pm}=ψ^mψ^p.
- `QHodgeTrace.CyclonicBaseCoherence.relativeTHH`: Base change along the A₂ morphism, then tensor cyclonic ku.

**Checks.**

- `QHodgeTrace.CyclonicBaseCoherence.one`: ψ¹ is the underlying identity in the commuting Frobenius construction.
- `QHodgeTrace.CyclonicBaseCoherence.toric`: For the toric lift S[x^{±1}], ψ^m(x)=x^m, and prime Tate squares are compatible.
- `QHodgeTrace.CyclonicBaseCoherence.list_insufficient`: A family of E∞ endomorphisms without the Tate-square paths and their coherences cannot supply A₂.
- `QHodgeTrace.CyclonicBaseCoherence.invert_two`: The canonical lift of A=Z[1/2] supplies the A₂ input used in the Habiro unit test.

*Needs:* §6.1 (Compatible local and global spherical lifts); §6.11 (Cyclonic spectra); §6.11 (Cyclonic ku and KU); EnhancedDerivedSheaves E0.

### 6.12 Higher fixed-point invariants and filtered Bott localization

**The invariants TC^{−(m)}.** For a cyclonic spectrum X and m ≥ 1, TC^{−(m)}(X) := (X^{C_m})^{h(S¹/C_m)}, genuine C_m-fixed points followed by homotopy fixed points of the residual circle S¹/C_m ≅ S¹. For A, R as in §6.1 (Spherical lifts and the base hypotheses) with the additional assumption (A_2) (compatible E_∞-lifts ψ^m of the Adams operations, Wagner 5.43), TC^{−(m)}(ku_R/ku_A) and TC^{−(m)}(KU_R/KU_A) are defined using the modified cyclonic structure THH(S_R/S_A)^{cyct} ⊗_{S_A^{cyct}} S_A^{triv} tensored with cyclonic ku (resp. KU) (Definition 5.45). The TC^{−(m)} for different m are related by maps for n | m (Remark 5.62) but there are no restriction maps as for TR.

Throughout this statement, X cyclonic; for THH(ku_R/ku_A): the hypotheses of §6.1 (Spherical lifts and the base hypotheses) and (A_2).

([W](#w), §5.4, Definition 5.45, p. 71.)

The construction proceeds as follows. Define via §6.11 (Cyclonic spectra) and §2.1 (Homotopy orbits and homotopy fixed points). Construct the modified cyclonic structure (Wagner 5.43, Lemma 5.44). Maps for n | m (Remark 5.62).

Provide the following operations and identities.

- `TCminusM`: TC^{−(m)}(X) = (X^{C_m})^{h(S¹/C_m)}.
- `TCminusM.one`: TC^{−(1)} = TC⁻.
- `TCminusM.divisor`: Maps TC^{−(m)} → TC^{−(n)}-type relations for n | m (Remark 5.62).
- `TCminusM.ku`: π_{2∗}TC^{−(m)}(ku/ku) ≅ (q^m − 1)^⋆ℤ[q]^∧_{(q^m−1)}.

**Checks.**

- `TCminusM.m_one`: TC^{−(1)}(X) = X^{hS¹}.
- `TCminusM.ku_pi0`: π_0TC^{−(m)}(ku/ku) = ℤ[q]^∧_{(q^m−1)}.
- `TCminusM.not_TR`: There are no TR-type restriction maps TC^{−(pm)} → TC^{−(m)}: they would need (ku^{ΦC_p})^{hS¹} ≃ TC^{−(1)}(ku), which fails; the limit in Layer 6 is along the maps of Wagner Remark 5.62.

Also establish TC^{−(1)}(X) = X^{hS¹} = TC⁻(X). For cyclonic ku: π_{2∗}((ku^{C_m})^{h(S¹/C_m)}) ≅ the (q^m − 1)-adic filtration of ℤ[q]^∧_{(q^m−1)} (Wagner 5.33, 5.50).

*Needs:* §6.11 (Cyclonic spectra); §6.11 (Cyclonic ku and KU); §6.1 (Spherical lifts and the base hypotheses); §2.10 (Negative topological cyclic and periodic topological cyclic homology); §2.8 (THH relative to an E_∞-ring); §6.6 (Synthetic finite cyclic fixed points and Tate); §6.1 (Compatible local and global spherical lifts); §6.11 (Cyclonic Adams lift coherence).

**Cyclonic even filtrations and the KU construction.** For bounded-below cyclonic T and M with every geometric fixed point T^{ΦC_m} complex orientable, and under the homological-evenness condition of 5.46: fil^⋆_ev M^{ΦC_m} := fil^⋆_{P-ev/T^{ΦC_m}}M^{ΦC_m} (Pstrągowski) and fil^⋆_{ev/T,C_m}M^{C_m} := eq(∏_{d|m}(fil^⋆_ev M^{ΦC_d})^{hC_{m/d},ev} ⇉ ∏_p∏_{pd|m}((fil^⋆_ev M^{ΦC_d})^{tC_p,ev})^{hC_{m/pd},ev}), requiring (M^{ΦC_m})^{hC_p} homologically even over (T^{ΦC_m})^{hC_p} (5.46). For THH(ku_R/ku_A) the geometric fixed point filtration is defined by base change along inflation (5.47). For KU: fil^⋆_{ev,C_m}THH(KU_R/KU_A)^{C_m} := fil^⋆_{ev,C_m}THH(ku_R/ku_A)^{C_m} ⊗_{ku_ev^{C_m}} KU_ev^{C_m} (localisation at β in homotopical degree 2 and filtration degree 1), and fil^⋆_{ev,S¹}TC^{−(m)}(KU_R/KU_A) := (fil^⋆_{ev,C_m}THH(KU_R/KU_A)^{C_m})^{h(T/C_m)_ev}; these are complete and exhaustive (Lemma 5.61). This is the bounded-below (ku) construction followed by Bott localisation; a connective fixed-point formula is never applied to the unbounded KU-objects directly.

Throughout this statement, T and M bounded-below cyclonic inputs; every T^{ΦC_m} complex orientable; (M^{ΦC_m})^{hC_p} homologically even over (T^{ΦC_m})^{hC_p}, as in Wagner paragraph 5.46. For the THH(ku_R/ku_A) application: compatible spherical lifts and Assumption (A_2), before Bott localization.

([W](#w), §5.4, paragraph 5.46 'Cyclonic even filtrations in general', p. 71; [W](#w), §5.4, paragraph 5.59 and Lemma 5.61, pp. 78–79; [W](#w), §5.2, Proposition 5.26, p. 62.)

The construction proceeds as follows. Define the ku filtrations (5.46–5.47) using §6.5 (Even filtrations (Hahn–Raksit–Wilson and Pstrągowski)) and filtered (−)^{hC, ev}, (−)^{tC_p, ev}. β-localise to get the KU filtrations (5.59). Completeness/exhaustiveness (Lemma 5.61).

Provide the following operations and identities.

- `cyclonicEvenFiltration`: fil^⋆_{ev,C_m}M^{C_m} for cyclonic modules. Use compatible G, the actual A₂ morphism C and CyclonicEvenHypotheses; require positive m, and 2 invertible for the arithmetic completeness/comparison application.
- `cyclonicEvenFiltration.KU`: The KU version by β-localisation. Use compatible G, the actual A₂ morphism C and CyclonicEvenHypotheses; require positive m, and 2 invertible for the arithmetic completeness/comparison application.
- `cyclonicEvenFiltration.complete`: Complete and exhaustive (Lemma 5.61). Use compatible G, the actual A₂ morphism C and CyclonicEvenHypotheses; require positive m, and 2 invertible for the arithmetic completeness/comparison application.
- `cyclonicEvenFiltration.m_one`: For m = 1 it is fil_{ev,hS¹}TC⁻. Use compatible G, the actual A₂ morphism C and CyclonicEvenHypotheses; require positive m, and 2 invertible for the arithmetic completeness/comparison application.

**Checks.**

- `cyclonicEvenFiltration.ku`: fil_{ev,S¹}TC^{−(m)}(ku/ku) ≃ τ_{≥2⋆}((ku^{C_m})^{h(S¹/C_m)}).
- `cyclonicEvenFiltration.zero`: The filtration of 0 is 0.
- `cyclonicEvenFiltration.no_direct_KU`: For m=1 and A=R=ℤ[1/2], THH(KU_R/KU_A)=KU[1/2] has π_{−2j}=ℤ[1/2] for every j≥1. It is not bounded below, so it fails the hypothesis of the direct formula; use β-localisation of the ku filtration.

Also establish For m = 1 this is the filtration of §6.6 (Even-filtered circle fixed points and Tate). The KU filtrations are 2-periodic (β^{±1} shifts weight by ±1).

*Needs:* §6.12 (The invariants TC^{−(m)}); §6.5 (Even filtrations (Hahn–Raksit–Wilson and Pstrągowski)); §6.6 (Even-filtered circle fixed points and Tate); §6.11 (Cyclonic ku and KU); GeneralizedCohomology G5.4 and G2.8; §6.6 (Synthetic finite cyclic fixed points and Tate); §6.1 (Compatible local and global spherical lifts); §6.11 (Cyclonic Adams lift coherence); §6.3 (Homological evenness and even homotopy sheaves); EnhancedDerivedSheaves E0.

### 6.13 Twisted q-Hodge and the Habiro–Hodge comparison

**TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51).** Under the hypotheses of §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)) plus 2 ∈ R^× and (A_2), for each m ≥ 1 the completed m-twisted q-Hodge filtration (Wagner 5.50, constructed from fil_{q-Hdg} of Theorem 4.27) is identified with Σ^{−2∗}gr^∗ of fil_{ev,S¹}TC^{−(m)}(ku_R/ku_A), as modules over π_{2∗}((ku^{C_m})^{h(S¹/C_m)}) ≅ ℤ[β, q][[t_m]]/(βt_m − (q^m − 1)) ≅ the (q^m − 1)-adic filtration of ℤ[q]^∧_{(q^m−1)}; and Σ^{−2∗}gr^∗_{ev,C_m}THH(ku_R/ku_A)^{C_m} ≃ q-W_m dR^∗_{R/A} (derived q-de Rham–Witt complexes, Corollary 5.58).

Throughout this statement, As in §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)), with 2 ∈ R^× and (A_2).

([W](#w), §5.4, Theorem 5.51, p. 73; [W](#w), Construction 5.50 and Theorem 5.51, pp. 73–74; Corollary 5.58, p. 78.)

The construction proceeds as follows. Compute fil_{ev,S¹}TC^{−(m)}(ku/ku) ≃ τ_{≥2⋆}((ku^{C_m})^{h(S¹/C_m)}) (stated in Wagner as not completely trivial; only sketched there). Use the fixed-point formula over divisors d | m and Theorem 4.27 applied to the Frobenius-twisted R^{(d)} (Wagner §5.4). Identify the finite C_m-fixed associated graded with q-de Rham–Witt using Corollary 5.58; do not replace these categorical fixed points by geometric fixed points. Use the separate HQ.3 request for the global twisted filtration and divisor-compatible completion.

Also establish m = 1 is §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)).

*Needs:* §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)); §6.12 (Cyclonic even filtrations and the KU construction); §6.12 (The invariants TC^{−(m)}); HabiroCohomologyFoundations Layer 4 (HQ.3); §6.1 (Compatible local and global spherical lifts); §6.11 (Cyclonic Adams lift coherence).

**The Habiro–Hodge complex from TC^{−(m)} over KU (Wagner Theorem 5.63).** Let A be a perfectly covered Λ-ring with p-adic (tC_p)-lifts, R a quasi-lci A-algebra with bounded p^∞-torsion and per-prime 3.2(E_2)/(E_1) choices, with 2 ∈ R^× and (A_2) (compatible E_∞-lifts ψ^m of the Adams operations on S_A); KU_A := KU ⊗ S_A, KU_R := KU ⊗ S_R with their cyclonic structures. Then the 2-periodified Habiro–Hodge complex q-ℋdg_{R/A}[β^{±1}] (Habiro descent of the q-Hodge complex of §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)), HabiroCohomologyFoundations Layer 4 (HQ.3) / HabiroRings HR.2–HR.5, Wagner [Wag25, Theorem 3.11]) is equivalent to lim_m Σ^{−2∗}gr^∗_{ev,S¹}TC^{−(m)}(KU_R/KU_A), the limit over m along the divisibility maps; the even grading enters through Σ^{−2i} on gr^i and the Bott inversion through KU = ku[β^{−1}]. The connective (ku) even-filtration comparison (§6.13 (TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51))) is performed before Bott inversion.

Throughout this statement, As stated; 2 ∈ R^× is needed here (stronger than (R_2)), and (A_2).

([W](#w), §5.4, Theorem 5.63, p. 79 (intro version: Theorem 1.14, p. 7).)

The construction proceeds as follows. Apply §6.13 (TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51)) for each m. β-localise (§6.12 (Cyclonic even filtrations and the KU construction), KU version) and pass to the limit over m. Identify lim_m of the twisted (q^m − 1)-completed pieces with the Habiro–Hodge complex via Habiro descent (HabiroCohomologyFoundations Layer 4 (HQ.3)'s construction; its Theorem 3.11 in [Wag25]).

Also establish For the in-scope unit example use R=A=ℤ[1/2] and the corresponding localized spherical lift: 2 is a unit. The integral R=A=ℤ calculation is outside the hypotheses of Theorem 5.63 and cannot serve as a test of this theorem.

*Needs:* §6.13 (TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51)); §6.12 (Cyclonic even filtrations and the KU construction); §6.10 (Completeness, multiplicativity and the graded comparison); HabiroCohomologyFoundations Layer 4 (HQ.3); HabiroCohomologyFoundations Layer 4 (HQ.3) — finite projective habiro hodge base change; HabiroRings HR.5 — the relative habiro ring; §6.1 (Compatible local and global spherical lifts); §6.11 (Cyclonic Adams lift coherence).

### 6.14 Étale spherical lifts and number fields

**Étale algebras lift uniquely to étale E_∞-algebras.** For a connective E_∞-ring A, the functor B ↦ π_0B from étale E_∞-A-algebras to étale π_0A-algebras is an equivalence of ∞-categories (Lurie, Higher Algebra Theorem 7.5.0.6). In particular every étale ℤ-algebra R has a unique (up to contractible choice) étale E_∞-S-algebra S_R with π_0S_R = R, S_R ⊗ ℤ ≃ R; for R = O_F[1/Δ] with disc(F) | Δ (étale over ℤ, HabiroRings §5.8, `etale_localization_away_discr`) this is the spherical lift used in Corollary 6.15.

Throughout this statement, A connective E_∞-ring; étale maps in Lurie's sense (flat with étale π_0-map).

([HA](#ha), §7.5 'Étale Morphisms' (introduction), Theorem 7.5.0.6, p. 1374; [W](#w), §6.1, Example 6.7, p. 82.)

The construction proceeds as follows. Import HA Theorem 7.5.0.6 (deformation theory of étale maps: the cotangent complex of an étale map vanishes, so lifts are unique and exist by obstruction theory). Apply to S → S[1/Δ] and the étale ℤ[1/Δ]-algebra O_F[1/Δ].

Also establish S_{ℤ[1/Δ]} = S[1/Δ]. O_F[1/Δ] lifts uniquely; this lift is E_∞, hence satisfies (E_2) at every prime.

*Needs:* GeneralizedCohomology G2.8 and StableHomotopyKTheory Layer 5; HabiroRings §5.8 (`etale_localization_away_discr`).

**The Habiro ring of a number field from KU (Wagner Corollary 6.15).** Let F be a number field, Δ an integer divisible by 6 and by disc(F), R = O_F[1/Δ] (étale over ℤ[1/Δ], 2 ∈ R^×), and S_R the unique étale E_∞-S-algebra lifting R (§6.14 (Étale algebras lift uniquely to étale E_∞-algebras)). Then the Habiro ring of the number field H_{O_F[1/Δ]} of Garoufalidis–Scholze–Wheeler–Zagier is isomorphic to π_0 lim_m TC^{−(m)}(KU ⊗ S_R/KU) = π_0 lim_m (THH(KU ⊗ S_R/KU)^{C_m})^{h(S¹/C_m)}. The comparison of π_0 is with the relative Habiro ring H_{R/ℤ} of HabiroRings HR.5 and its ℤ[q]-algebra isomorphism with the GSWZ ring (HabiroRings §5.9, `HabiroRings.relativeHabiro.numberFieldEquiv`), through HabiroCohomologyFoundations §4.21: for R étale over ℤ the Habiro–Hodge complex of its q-Hodge pair is H_{R/ℤ} as an E∞-algebra (W-Hab Corollary 3.13, p. 27, cited as 3.12 in Wagner's proof); no new definition of the ring is made here. The discriminant-only ring of HabiroRings §§5.8–5.9 is not replaced: the stronger hypothesis 6 | Δ enters only through 2 ∈ R^× (Theorem 5.63) and the source's choice.

Throughout this statement, F a number field; 6 | Δ and disc(F) | Δ separately; S_R the étale lift.

([W](#w), §6.3 'The Habiro ring of a number field, homotopically', Corollary 6.15, p. 86 (intro version: Corollary 1.15, p. 8); [W](#w), §6.3, proof of Corollary 6.15, p. 86; [W-Hab](#w-hab), §3.2 'The main result', Corollary 3.13, p. 27.)

The construction proceeds as follows. The q-Hodge pair produced from the étale lift by §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)) is a pair on the étale ℤ-algebra R, so its filtration is the h-adic one and its Habiro–Hodge complex is static and equal to H_{R/ℤ} (HabiroCohomologyFoundations §4.21, recorded as `HabiroHodgeDescent.etale` in its §4.28; this is also the case d = 0 of §6.10 (The framed trace pair and its E∞-structure (Wagner Remark 6.14))). Apply §6.13 (The Habiro–Hodge complex from TC^{−(m)} over KU (Wagner Theorem 5.63)) with A = ℤ (where (A_2) holds trivially): the limit filtration is the double-speed Whitehead filtration since the graded pieces are static, so π_0 of the limit is H_{R/ℤ}. Identify H_{R/ℤ} with GSWZ's ring (HabiroRings §5.9).

Also establish F = ℚ, Δ = 6: π_0 lim_m TC^{−(m)}(KU ⊗ S[1/6]/KU) ≅ H_{ℤ[1/6]}. Why 3 | Δ is required is not explained in the source; the hypothesis is kept as stated.

*Needs:* §6.13 (The Habiro–Hodge complex from TC^{−(m)} over KU (Wagner Theorem 5.63)); §6.14 (Étale algebras lift uniquely to étale E_∞-algebras); §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)); HabiroCohomologyFoundations §4.21 (étale Habiro–Hodge identification) and §4.28 (`HabiroHodgeDescent.etale`); HabiroRings §5.9 (`HabiroRings.relativeHabiro.numberFieldEquiv`); HabiroRings §5.8 (`etale_localization_away_discr`).

### Examples

At m=1 the finite norm is the identity and the synthetic Tate object is zero. Any finite-Cₘ coefficient formula must specialize accordingly. The ordinary tensor square H Fₚ⊗HZ H Fₚ has a Tor₁ class in degree 1, since the two-term resolution Z→ᵖZ becomes Fₚ→⁰Fₚ. Thus HZ/p is not a faithful even-flat cover of HZ; its derived tensor behavior is distinct from ordinary reduction.

The chosen orientation imposes q−1=βt. Setting β=0 forces q=1, while setting q=1 imposes only βt=0 and does not force β=0. This distinguishes the Hodge specialization from Bott inversion. For a smooth lift with R=A and the identity framing, the relative q-Hodge comparison reduces to the coefficient normalization; changing the framing must respect the stated coherent lift data. At p=2 the available q-Hodge comparison has E₁ multiplicativity under its specified lift, and does not automatically produce an E∞ map. The Habiro comparison retains its separate assumption that 2 is invertible, even where an earlier p=2 coefficient calculation exists.

For the framed comparison, ℤ[x,y] with the identity framing needs no prime inverted, and its trace filtration has (q−1)^{max(i−2,0)}dx∧dy in form degree 2. The diagonal q-divided powers are pinned by (qx−y)(qx−qy) − (x−y)(x−qy) = (q²−1)x(x−y); the classical square instead leaves the residue (q−1)²xy.

### Dependencies

Earlier layers 1, 2, 5. Use the named Mathlib and Tau Ceti inputs under the supplier contracts; external contracts: DerivedDeRhamCohomology Layer 0; DerivedDeRhamCohomology Layer 1; DerivedDeRhamCohomology Layer 2; EnhancedDerivedSheaves E0; EnhancedDerivedSheaves E5:presentability; HabiroCohomologyFoundations Layer 1 (§§1.14, 1.17); HabiroCohomologyFoundations Layer 2 (HQ.2); HabiroCohomologyFoundations Layer 4 (HQ.3), including §§4.1, 4.4, 4.8 and 4.21–4.23; HabiroRings HR.1; HabiroRings HR.5, including §§5.8–5.9; PrismaticCohomology Layer 0 (§0.59); PrismaticCohomologyPartII §§5.1–5.8; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; StableHomotopyKTheory Layer 7; VStackSheavesAndLisseCategories VS2. The individual statements above identify the required comparison or functoriality, not merely a shared object name.

## Layer 7: Refined invariants and finite-coefficient calculations

Rigidify the target using trace-class systems and compute the refined localization cofiber before passing to graded coefficients. The rational ku and KU outputs are nuclear ind-objects, with their realization maps retained.

### 7.1 Rigidification and its universal factor

**Rigidification of the target.** For presentable symmetric monoidal stable D with colimit-preserving tensor, choose an uncountable regular κ with D∈CAlg(PrL_st,κ): D is κ-compactly generated, its unit is κ-compact and tensor preserves κ-compact objects. Form D^rig inside Ind(D^κ), generated under colimits by Q≥0-indexed telescopes of Yoneda images with trace-class transitions in D. Realization is induced by colimit. If D is locally rigid and the unit is ω₁-compact, D^rig≃Nuc Ind(D), constructed from the essentially small sequential basic nuclear objects. The use of Q rather than N is essential without those extra hypotheses.

([MW](#mw), Construction 1.3, pp. 2–3; Remark 2.5, p. 12; [Ram](#ram), Construction 4.79, Observation 4.80 and Theorem 4.81, pp. 43–46, in v2.)

The construction proceeds as follows. Choose κ as above. The diagonal on Q≥0 makes the generated subcategory closed under tensor. Its unit is representable and compact. Rational interpolation gives trace-class factorizations that can be subdivided repeatedly; the Milnor sequence then detects nonzero objects and yields rigidity. For the universal property, lift functors from a rigid source to Ind(D^κ), factor transitions through representables, and insert those factorizations coherently using the lexicographic posets of Ramzi Lemmas 4.82–4.83 (pp. 45–46). The universal property makes the construction independent of sufficiently large κ. Use the sequential nuclear description only under its additional locally rigid and ω₁-compact-unit hypotheses.

Provide the following operations and identities.

- `Rigidification.ofSystem`: A Q-indexed system with trace-class transitions gives an object in D^rig.
- `Rigidification.realize`: Realization D^rig → D sends a system to its colimit and is symmetric monoidal.
- `Rigidification.map`: Symmetric monoidal colimit-preserving functors induce the rigidification comparison by preservation of trace-class maps.
- `Rigidification.sequential`: For locally rigid D with ω₁-compact unit, the Q-system envelope is equivalent to the sequential nuclear ind-object category.

**Checks.**

- `Rigidification.zero`: The zero trace-class system gives the zero object of D^rig.
- `Rigidification.constantDualizable`: The constant system on a dualizable X belongs to D^rig and realizes to X.
- `Rigidification.rationalCoefficients`: The source’s rational-input refined TC⁻ remains the nuclear ind-object A*ku; its ordinary realization does not justify replacing it by ordinary p-completed TC⁻ of the rational input.

Also establish The realized value of a constant dualizable object is the original object. A nuclear ind-object is not silently identified with its realized colimit.

*Needs:* §4.2 (Ordered trace-class morphisms and the symmetric comparison); §4.3 (Nuclear objects); §4.3 (E₁ rigidity extending the supplied symmetric notion); EnhancedDerivedSheaves E5:presentability — ind completion; EnhancedDerivedSheaves E5:presentability; §4.2 (Functoriality and preduals of trace-class maps); §4.3 (Closure and generation of nuclear objects).

**The refined localizing invariant.** Let E be rigid symmetric monoidal, and T: Motloc_E → D a colimit-preserving symmetric monoidal functor to a presentable symmetric monoidal stable D. The canonical rigidification D^rig ⊂ Ind(D^κ), defined by the rational trace-class systems above, admits a unique colimit-preserving symmetric monoidal factor Tref: Motloc_E → D^rig, up to contractible choice; realization gives T. If D is locally rigid with ω₁-compact unit, D^rig is the category of nuclear ind-objects with sequential presentations.

([MW](#mw), Construction 1.3, pp. 2–3; Lemmas 2.15–2.17, pp. 16–17.)

The construction proceeds as follows. A symmetric monoidal functor preserves trace-class maps. Present objects of the rigid source by basic nuclear systems; apply T to those systems. The trace-class comparison of preduals identifies their colimits, making the factor functorial, monoidal and independent of presentation.

Also establish The ordinary comparison is a realization map, not an equivalence for arbitrary rational inputs. A compact dualizable target value is represented by its constant ind-object.

*Needs:* §4.8 (Rigidity of relative localizing motives); §7.1 (Rigidification of the target); §4.2 (Functoriality and preduals of trace-class maps); §4.3 (Trace-class generation criterion for rigidity).

### 7.2 Killing pro-algebras

**Killing an idempotent pro-algebra.** In a presentable symmetric monoidal stable C, a κ-small pro-object A=pro-lim_i A_i with left-unital multiplication and unit defines the full subcategory Ind(C)^A of M with extended internal Hom(A,M)=ind-colim_(i,k) Hom_C(A_i,M_k)=0. It has a reflector j*. If A is idempotent and eventually trace-class, the dual ind-object ind-colim_i A_i∨ is nuclear and idempotent and there is a cofiber ind-colim_i A_i∨ → 1 → j*(1). The reflector is then symmetric monoidal, j*(1) an idempotent E∞ algebra, and j*(M)≃M⊗j*(1). The ordinary-object version uses Hom_C(A,−)=0 and requires stabilization or sequential-Hom commutation for its iterative formula.

([MW](#mw), Constructions 2.6, 2.9 and 2.11, pp. 12–15; Lemma 2.14, pp. 15–16.)

The construction proceeds as follows. Apply the reflective localization to the extended Hom-orthogonal subcategory. For pro A iterate Hom(fib(1 → A),−); extended Hom commutes with filtered colimits in Ind. For idempotent A the iteration stabilizes and gives the dual cofiber. Trace-class comparison of preduals makes this construction preserved by symmetric monoidal functors; general pro-algebras lack this asserted multiplicativity.

Provide the following operations and identities.

- `KillProAlgebra.unit`: The localization unit 1 → kill(A)=j*(1) fits into the stated cofiber.
- `KillProAlgebra.orthogonal`: Local objects are exactly those with extended internal Hom(A,M)=0.
- `KillProAlgebra.lift`: Maps from j*(M) to a local U identify with maps from M to U.
- `KillProAlgebra.tensor`: For idempotent eventually trace-class pro A, j*(M)≃M⊗kill(A), kill(A)⊗kill(A)≃kill(A).
- `KillProAlgebra.map`: Symmetric monoidal functors preserve the killing construction in the eventual trace-class idempotent setting.

**Checks.**

- `KillProAlgebra.killZero`: kill(0)≃1 and j* is the identity.
- `KillProAlgebra.killUnit`: kill(1)≃0 and the local subcategory is zero.
- `KillProAlgebra.ordinaryLocalization`: For C=D(Z), killing the constant dualizable algebra Z/p yields the ordinary derived p-inverted unit Z[1/p]; the iterative construction and map Z → Z[1/p] agree with derived scalar localization.

Also establish Killing A=0 preserves the unit; killing A=1 gives zero. The symmetric monoidal claim has the idempotence hypothesis.

*Needs:* §4.2 (Ordered trace-class morphisms and the symmetric comparison); §4.3 (Nuclear objects); EnhancedDerivedSheaves E5:presentability — ind completion; EnhancedDerivedSheaves E5:presentability; §4.2 (Functoriality and preduals of trace-class maps); §4.3 (Closure and generation of nuclear objects).

### 7.3 Smooth proper normalization and base change

**Smooth and proper E-linear categories.** Let E be rigid symmetric monoidal and X a dualizable E-module with relative dual X∨. Smoothness means the relative coevaluation E → X∨⊗_E X is strongly continuous; equivalently the absolute coevaluation takes the sphere to a compact object. Properness means the relative evaluation X⊗_E X∨ → E is strongly continuous. Both together say that X is dualizable in the monoidal category Catdual_E with strongly continuous morphisms. For an algebra model Mod_A over a compactly generated rigid base, smoothness is compactness of the diagonal A-bimodule and properness is compactness of A as an E-object. Preservation of compact objects alone is not used as a criterion for an arbitrary dualizable category.

([MW](#mw), Lemma 2.18, p. 18; Corollary 2.19, pp. 18–19; [E-mot](#e-mot), §1.5, p. 19.)

The construction proceeds as follows. Use the relative evaluation and coevaluation from the dualizable-module interface. Apply Efimov §1.5: strong continuity is the defining condition; for coevaluation it can be tested on the compact tensor unit of rigid E. In compactly generated algebra models, test evaluation on the compact diagonal generators and identify the smooth/proper algebra criteria.

Provide the following operations and identities.

- `SmoothProperCategory.evaluation`: The relative evaluation is strongly continuous exactly under properness.
- `SmoothProperCategory.coevaluation`: The relative coevaluation is strongly continuous exactly under smoothness.
- `SmoothProperCategory.algebraCriterion`: For an algebra model, smoothness is compactness of the diagonal as an A-bimodule and properness is compactness of A over E.
- `SmoothProperCategory.refinedValue`: For smooth proper X, Tref(X)≃constant T(X). Supplied by §7.3 (Refined invariants of smooth proper categories).

**Checks.**

- `SmoothProperCategory.unit`: The E-linear unit category E is smooth and proper over E.
- `SmoothProperCategory.field`: Perf(k) after Ind is smooth and proper over Mod_k with its diagonal k.
- `SmoothProperCategory.polynomialNotProper`: Mod_(k[x]) is smooth over Mod_k but is not proper, since k[x] is not compact as a k-module.

Also establish The unit category E is smooth and proper; Mod_(k[x]) is smooth but not proper over Mod_k.

*Needs:* §4.1 (Relative dualizable presentable stable categories); §4.3 (E₁ rigidity extending the supplied symmetric notion); EnhancedDerivedSheaves E5:presentability — compact objects; EnhancedDerivedSheaves E5:presentability.

**Refined invariants of smooth proper categories.** For rigid symmetric monoidal E and a dualizable E-module X with strongly continuous relative evaluation and coevaluation, X is dualizable in Catdual_E. For the refined symmetric monoidal invariant Tref attached to T:Motloc_E → D, its value on X is the constant ind-object T(X). If a rigid symmetric monoidal X is smooth and proper over E, forgetting X-linearity preserves trace-class morphisms.

([MW](#mw), Lemmas 2.16 and 2.18, Corollary 2.19, pp. 17–19.)

The construction proceeds as follows. The relative evaluation and coevaluation are morphisms of Catdual_E by the smooth/proper conditions; the PrL_E triangle identities hold there. The identity on this dualizable object is trace-class, so its constant system gives the refined value (MW Lemma 2.16). For restriction of scalars, use dualizability of X in Catdual_E to transport the trace-class classifier as in Corollary 2.19.

Also establish For the unit category E, evaluation and coevaluation are strongly continuous and Tref(E) is the constant object T(E). For Ind(Perf(k)) over Mod_k this is the same unit test. Mod_(k[x]) is smooth but not proper over Mod_k, so this theorem cannot identify its refinement with a constant merely from smoothness.

*Needs:* §7.3 (Smooth and proper E-linear categories); §7.1 (The refined localizing invariant); §4.2 (Functoriality and preduals of trace-class maps).

**Base change in the refined construction.** Let E → X be strongly continuous symmetric monoidal with E and X rigid and X smooth and proper over E. Forgetting X-linearity in Catdual preserves trace-class morphisms, so the refined functors computed over X and over E have their comparison induced by this map. For an additional symmetric monoidal colimit-preserving X → X′ with X′ rigid, and a dualizable algebra V₀ in X, the kernel V of X → X^{V₀} satisfies V⊗_X X′≃V′. The pro-algebra killing comparison is preserved after applying a symmetric monoidal functor when its transitions are eventually trace-class.

([MW](#mw), Corollary 2.19, pp. 18–19; Lemma 2.26, pp. 22–23; Remark 1.4, p. 3.)

The construction proceeds as follows. Use dualizability of X in Catdual_E to make its forgetful functor preserve the trace-class classifier. Identify V as the tensor ideal generated by V₀ and use compactly generated reduction Ind(X^ω) → X. Use rigidity of X′ to base-change the kernel adjunction as in Lemma 2.26; apply the preserved dual-ind cofiber for the multiplicative comparison.

Also establish The forgetful Motloc_(O_C) → Motloc does not in general preserve trace-class maps; no base-independent refinement is asserted.

*Needs:* §7.3 (Smooth and proper E-linear categories); §7.2 (Killing an idempotent pro-algebra); §4.2 (Ordered trace-class morphisms and the symmetric comparison); §4.2 (Functoriality and preduals of trace-class maps); §7.3 (Refined invariants of smooth proper categories).

### 7.4 The localization cofiber

**The refined localization cofiber.** Let E → X be as in the smooth proper base-change theorem, and T:Motloc_E → D symmetric monoidal colimit-preserving with D locally rigid and ω₁-compact unit. Let V₀ ← V₁ ← … be E₁-algebras in X, each dualizable and in thick⊗(V₀), such that V_(r+1)⊗V_r → V_r⊗V_r factors through multiplication V_(r+1)⊗V_r → V_r as a V_(r+1)–V_r bimodule map. For U={M | Hom_X(V₀,M)=0}, pro T(RMod_(V_r)(X)) is idempotent and eventually trace-class and Tref(U)≃kill(pro T(RMod_(V_r)(X))) as a T(X)-algebra. Thus ind-colim_r T(RMod_(V_r)(X))∨ → T(X) → Tref(U) is a cofiber in Nuc Ind(D).

([MW](#mw), Theorem 2.21 and Lemmas 2.22–2.26, pp. 19–23; Corollary 2.30, p. 25.)

The construction proceeds as follows. Identify the localization kernel with colim_r Ind(LMod_(V_r)(X^ω))⊗_(Ind X^ω) X using the transition factorization. In the bimodule category the factorization makes V_r a retract of V_r⊗V_r; that proves the required compactness and trace-class transition, not compactness of V_r merely over V_(r+1). Apply T and the predual colimit comparison, then idempotent pro-algebra killing.

Also establish A Burklund tower for a dualizable v:I → 1 with right-unital quotient meets the factorization after passing to sufficiently separated exponents. The cofiber is in nuclear ind-objects with algebra structure, not merely a homotopy-group exact sequence.

*Needs:* §7.1 (The refined localizing invariant); §7.3 (Base change in the refined construction); §7.2 (Killing an idempotent pro-algebra); §7.3 (Smooth and proper E-linear categories); EnhancedDerivedSheaves E5:presentability; §4.2 (Functoriality and preduals of trace-class maps).

### 7.5 Oriented completion and refined traces

**Circle fixed points and oriented completion.** Let k be a complex orientable E∞ ring spectrum with trivial S¹ action, and choose t∈π_(−2)(k^hS¹) representing an orientation. Homotopy S¹ fixed points give a symmetric monoidal equivalence from coherent circle k-modules to derived t-complete k^hS¹-modules, whose tensor is t-completed. The left adjoint has underlying module reduction modulo t; no bounded-below hypothesis is imposed.

([MW](#mw), Lemma 3.2 and proof, pp. 29–30.)

The construction proceeds as follows. Construct the constant-action and scalar-extension left adjoint; its underlying module is reduction modulo t. Check the tensor comparison and adjunction counit modulo t using the oriented circle cofiber identification. Use conservativity of reduction modulo t on derived t-complete modules; full faithfulness and the conservative left adjoint give the equivalence.

Also establish For the trivial circle k-module k, fixed points give k^hS¹ and reduction modulo t recovers k. The zero module maps to zero on both sides. A nonzero t-inverted k^hS¹-module has derived t-completion zero and is excluded from the complete target, rather than serving as a counterexample to conservativity there.

*Needs:* §2.1 (Spectra with an action of a group); §2.1 (Homotopy orbits and homotopy fixed points); AInfCohomology §AI.7.2 (Circle actions, homotopy fixed points and Tate constructions); DerivedDeRhamCohomology Layer 1 — derived completion; EnhancedDerivedSheaves E5:presentability.

**Refined THH and TC⁻.** For an E∞ ring k, refine the symmetric monoidal localizing relative THH functor Motloc_k → Mod_k(Sp)^BS¹, keeping its coherent circle action. The ordinary comparison is realization in that target. For complex orientable k and a chosen orientation t∈π_(−2)k^hS¹, refine TC⁻ into nuclear ind-objects of derived t-complete k^hS¹-modules with t-completed tensor. MW Lemma 3.2 identifies coherent circle k-modules with this completed module category. Finite-coefficient and rational-input computations use the induced maps between motives, units and localization cofibers.

([MW](#mw), Construction 1.7, p. 4; Convention 3.1, p. 29; Lemma 3.2, pp. 29–30.)

The construction proceeds as follows. Use Layers 2–3’s actual relative THH with its circle action and multiplicative structure as the localizing invariant. Construct the refined functor by target rigidification and its realization natural transformation. For oriented k use the homotopy-fixed-point/completion equivalence; prove monoidality and equivalence modulo t via Nakayama and the adjunction, as in Lemma 3.2.

Provide the following operations and identities.

- `RefinedTraces.thh`: THHref takes k-linear motives to the rigidification of coherent S¹ k-modules.
- `RefinedTraces.tcMinus`: For oriented k, TC−,ref is the corresponding nuclear derived t-complete module object.
- `RefinedTraces.ordinary`: Realization gives natural multiplicative maps from refined values to ordinary THH/TC⁻.
- `RefinedTraces.map`: Maps of k-linear motives induce coherent circle maps and the completed TC⁻ maps, with identity and composition.
- `RefinedTraces.fixedPointComparison`: Homotopy S¹ fixed points are symmetric monoidal between coherent k-modules and t-complete k^hS¹-modules under the complex-orientation hypothesis. Supplied by §7.5 (Circle fixed points and oriented completion).

**Checks.**

- `RefinedTraces.zeroMotive`: Both refined invariants of the zero motive are zero.
- `RefinedTraces.unitMotive`: For the smooth proper unit Mod_k, THHref is constant k with trivial circle action and TC−,ref is constant k^hS¹ in its complete module target.
- `RefinedTraces.rationalKu`: TC−,ref((ku⊗Q)/ku) has the nonzero source coefficient ind-algebra A*ku; ordinary p-completed rational THH does not determine it.

Also establish The ordinary p-completed THH of a rational input can vanish while the refined nuclear ind-object retains p-complete information. The target tensor is t-completed; the ordinary module tensor is not substituted.

*Needs:* §7.1 (The refined localizing invariant); §7.4 (The refined localization cofiber); §2.8 (THH relative to an E_∞-ring); §2.11 (THH of spectral and stable ∞-categories); §2.9 (THH is symmetric monoidal; THH of E_∞-rings); §2.1 (Homotopy orbits and homotopy fixed points); §2.10 (Negative topological cyclic and periodic topological cyclic homology); EnhancedDerivedSheaves E5:presentability; §7.3 (Refined invariants of smooth proper categories); §7.5 (Circle fixed points and oriented completion).

### 7.6 High-powered integers and finite coefficients

**High-powered positive integers.** HighPowered(m) means m>0, every odd prime p has m.factorization(p)=0 or at least 2, and m.factorization(2)=0 or an even integer at least 4. These m form the divisibility poset N used for the compatible E₁ Moore tower. For every positive d, d⁴ is high-powered and d divides d⁴, so restriction to N is coinitial in the inverse divisibility diagram.

([MW](#mw), §3.1, paragraph 3.3, p. 30.)

The construction proceeds as follows. Use Mathlib’s prime factorization at the pinned commit, imposing positivity separately since factorization(0)=0. Multiply all prime exponents by four to show the fourth-power coinitiality witness. Import compatible multiplicative Moore structures from StableHomotopyKTheory §§7.32–7.34; the arithmetic predicate itself supplies no E₁ structure.

Provide the following operations and identities.

- `HighPowered.pos`: HighPowered(m) implies m>0.
- `HighPowered.twoExponent`: The exponent at 2 is zero or is even and at least four.
- `HighPowered.oddExponent`: At each odd prime p, the exponent is zero or at least two.
- `HighPowered.fourthPower`: For every d>0, d⁴ is high-powered and d divides d⁴.
- `HighPowered.factorizationCriterion`: The arithmetic predicate is exactly the given conditions on Mathlib Nat.factorization.

**Checks.**

- `HighPowered.one`: HighPowered(1).
- `HighPowered.nineAndSixteen`: HighPowered(9) and HighPowered(16).
- `HighPowered.excludeZeroEightThirtyTwo`: Neither 0 nor 8 nor 32 is high-powered; the last fails the even-exponent condition, though the exponent is ≥4.

Also establish 1,9,16,64 satisfy the predicate; 0,3,8,32 do not.

*Needs:* `Nat.factorization`; `Nat.factorization_pow`.

**Finite-coefficient TC⁻ and q-Hodge complexes.** Choose the compatible E₁ quotient spectra S/m for high-powered m. Then TC⁻((ku⊗S/m)/ku) and TC⁻((KU⊗S/m)/KU) are even; their even homotopy identifies with respectively Fil*qHdg(Hodge-completed derived qdR(Z/m)/Z) over Z[β][[t]], and qHdg(derived qdR(Z/m)/Z)[β±¹] over Z[[q−1]]. Both carry the chosen even filtration, the specified E₁-induced multiplicative data, and quotient transition maps. Any p=2 application requires Layers 5–6’s separate E₁ even-resolution input; Wagner’s general theorem with 2 invertible and a connective spherical E₂ lift alone does not supply it.

([MW](#mw), Corollary 3.8, p. 32; finite-coefficient calculation, pp. 30–32.)

The construction proceeds as follows. Use the compatible StableHomotopyKTheory §§7.32–7.34 Moore-algebra tower, not the bare cofiber definition. Apply the source-qualified q-Hodge comparison and the derived Hodge deformation for Z/m. Use the periodic comparison theorem for KU, preserving completion and coherent quotient maps. The p=2 supplier refinement is an explicit request.

Also establish For odd p and exponent ≥2, the derived deformation reduces modulo q−1 to the Hodge filtration of derived dR(Z/p^a). Do not replace this chosen filtration by an asserted universal section on animated algebras.

*Needs:* §7.6 (High-powered positive integers); StableHomotopyKTheory Layer 7; GeneralizedCohomology G5.4 (with TopologicalKTheory T4); GeneralizedCohomology G5.4 and G2.8; §5.2 (THH relative to ku and KU); §5.3 (ku and KU with circle and cyclic-group actions); §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)); §6.9 (The p-complete q-Hodge comparison for p > 2 (Wagner Theorem 4.8)); §6.9 (The p-complete q-Hodge comparison at p = 2 (Wagner Theorem 4.14)); §6.1 (Compatible local and global spherical lifts); §6.12 (Cyclonic even filtrations and the KU construction); §6.13 (TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51)); §6.13 (The Habiro–Hodge complex from TC^{−(m)} over KU (Wagner Theorem 5.63)); HabiroCohomologyFoundations Layer 4 (HQ.3) — q hodge filtrations; HabiroCohomologyFoundations Layer 4 (HQ.3) — the q hodge complex; HabiroCohomologyFoundations Layer 4 (HQ.3); StableHomotopyKTheory §§7.32–7.34 — Burklund quotient tower; StableHomotopyKTheory §§7.32–7.34 — Burklund moore multiplicative; HabiroCohomologyFoundations §5.26 — finite-coefficient q-Hodge pairs; HabiroCohomologyFoundations §4.28 — exported q-Hodge interface.

### 7.7 Derived Hom, duality and completed tensor

**Filtered derived Hom of even spectra.** For an even E₁ ring k and even k-modules M,N, RHom_k(M,N) has the source’s complete exhaustive decreasing filtration with gr^n ≃ Σ^(2n) RHom_(π2*k)(π2*M,π2*N)(−n) in graded derived modules. Use the double-speed Whitehead filtrations, derived rather than ordinary Hom, and the source’s connectivity bounds to prove completeness/exhaustiveness; no degeneration is asserted without the subsequent Ext-amplitude calculation.

([MW](#mw), Lemma 3.9 and proof, p. 33.)

The construction proceeds as follows. Apply filtered internal Hom to the double-speed Whitehead filtrations. Compute the associated graded by the graded-module comparison and shearing. The connective/coconnective bounds in MW Lemma 3.9 show vanishing at the complete end and stable values at the exhaustive end.

Also establish For the even free rank-one module M=k, this agrees with N and its Whitehead filtration.

*Needs:* StableHomotopyKTheory Layer 7; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; EnhancedDerivedSheaves E5:presentability.

**The dual finite-coefficient TC⁻ spectra.** For high-powered m, the k^hS¹-linear duals of TC⁻((k/m)/k), k=ku or KU, have only odd homotopy and are computed by Ext¹ of the corresponding even graded q-Hodge module over the derived-complete graded coefficient ring; all other Ext groups contributing to the filtration vanish in this calculation. The ku coefficient ring is Z[β][[t]] and the KU coefficient ring Z[[q−1]][β±¹].

([MW](#mw), Corollary 3.10 and proof, pp. 33–34.)

The construction proceeds as follows. For ku reduce the RHom computation through the regular parameters β and t to RHom_Z(Z/m,Z), which has its torsion contribution in Ext¹. For KU use the ascending qHdg filtration with Z/m graded pieces and its complete Hom product. Apply Lemma 3.9 and the Ext-amplitude calculation to obtain the odd-degree dual and its transition maps.

Also establish The dual of Z/m in D(Z) contributes Ext¹=Z/m, not ordinary Hom_Z(Z/m,Z)=0.

*Needs:* §7.6 (Finite-coefficient TC⁻ and q-Hodge complexes); §7.7 (Filtered derived Hom of even spectra).

**The completed tensor filtration.** Let k be an even E∞ ring spectrum and t∈π_(2*)k a homogeneous element. For even k-modules M,N, the t-completed tensor M⊗̂_k N admits a complete exhaustive double-speed Whitehead filtration whose graded pieces are the double shearing of the derived t-completed graded tensor of π_(2*)M and π_(2*)N over π_(2*)k. The construction is functorial and compatible with products under its source hypotheses. The proof tracks connectivity and the at-most-one-degree loss in coconnectivity under derived completion; tensor is not assumed t-exact or underived.

([MW](#mw), Lemma 3.11 and proof, pp. 34–35.)

The construction proceeds as follows. Construct the filtered tensor on Whitehead filtrations. Identify associated graded and apply derived t-completion with its connectivity estimate. Use those estimates for both ends of the filtration before using the comparison on bounded-amplitude torsion inputs.

Also establish Derived tensor of Z/m with itself has Tor₁; the comparison retains that extra degree.

*Needs:* §7.7 (Filtered derived Hom of even spectra); GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; EnhancedDerivedSheaves E5:presentability; StableHomotopyKTheory Layer 7.

### 7.8 Pro-idempotence and trace-class transitions

**Pro-idempotence of the finite-coefficient q-Hodge system.** The inverse systems of even graded TC⁻ coefficients in the ku and KU finite-coefficient calculations are idempotent pro-algebras. Idempotence follows by factoring m³ → m² coefficient transition products through multiplication as bimodule maps using the compatible Moore-algebra tower. In the derived graded completed setting the resulting tensor comparison has amplitude [0,1] and its identification with spectrum homotopy is justified by the even Whitehead filtration.

([MW](#mw), Corollary 3.12 and proof, p. 35; Corollary 2.30, p. 25.)

The construction proceeds as follows. First prove the source-specific factorization of the supplied Moore tower: in a rigid presentable stable E₂-monoidal category, for dualizable I and a map v:I→1 with right-unital quotient, take the preferred Burklund structures and integers α₀≥3, α≥α₀+3 and α′≥α+α₀. The transition (1/v^α₀)⊗(1/v^α′)→(1/v^α₀)⊗(1/v^α) factors through 1/v^α₀ as an E₁-algebra map in its left-module category (MW Proposition 2.27 and Corollary 2.30, pp. 24–25). Construct the square-zero splitting there using the deformation category and the vanishing of the obstruction groups in degrees 0 and 1; an additive splitting alone gives no algebra factorization. The positive-exponent bounds can be met by a cofinal restriction of the high-powered indices. Apply the resulting transition factorizations to the ku and KU towers and TC⁻, as in the proof of MW Corollary 3.12. Then use the complete filtered tensor comparison and its amplitude [0,1] to transfer the factorization to graded homotopy, and check both unit maps into the pro tensor.

Also establish The result holds as a pro-algebra equivalence; it is not termwise idempotence of each finite coefficient algebra.

*Needs:* §7.6 (Finite-coefficient TC⁻ and q-Hodge complexes); §7.7 (The completed tensor filtration); StableHomotopyKTheory Layer 7; StableHomotopyKTheory §§7.32–7.34 — Burklund quotient tower.

**Trace-class finite-coefficient transitions.** For high-powered m the map from the m³ finite-coefficient graded q-Hodge algebra to the m algebra is trace-class over Z[β][[t]] (ku) or Z[[q−1]] (KU), in the derived-complete category. The corresponding spectrum classifier passes to the graded classifier because its dual-tensor has amplitude [−1,0].

([MW](#mw), Corollary 3.13 and proof, p. 36.)

The construction proceeds as follows. Use the trace-class witness for the category-level quotient transition in the localization recipe. Calculate the dual-tensor amplitude and identify the classifier through double Whitehead filtration. Check that evaluation of the resulting graded classifier equals the quotient transition.

Also establish The transition is m³ → m; termwise identities are not claimed trace-class.

*Needs:* §7.7 (The dual finite-coefficient TC⁻ spectra); §7.7 (The completed tensor filtration); §7.8 (Pro-idempotence of the finite-coefficient q-Hodge system); §4.2 (Ordered trace-class morphisms and the symmetric comparison); StableHomotopyKTheory Layer 7.

### 7.9 The rational ku and KU coefficient algebras

**Refined TC⁻ of rational ku.** TC−,ref((ku ⊗ Q)/ku) is even. Its even graded homotopy is the idempotent nuclear ind-graded B = Z[β][[t]]-algebra A*ku obtained by killing the idempotent pro-algebra F_m = Fil*qHdg(Hodge-completed derived qdR(Z/m)/Z), indexed by high-powered m under divisibility; |β|=2, |t|=−2 and q−1=βt. There is a natural exact sequence 0 → B → A*ku → ind-colim_(m∈N^op) Ext¹_B(F_m,B) → 0. Ext and duals are in the graded derived t-complete category; no canonical splitting is asserted. The exact sequence comes from the cofiber of the duals of the unit maps in TC⁻.

([MW](#mw), Theorem 3.14(a) and proof, pp. 36–37; Convention 3.1, p. 29.)

The construction proceeds as follows. Use the trace-class pro-algebra TC⁻((ku/m)/ku) and the localization cofiber from the refined invariant. The double-speed Whitehead filtration and derived Hom calculation identify the dual unit cofiber with graded Ext¹. The torsion duals occupy odd degrees; their cofibers with the even base are even. Idempotence and nuclearity pass through the source’s bounded-amplitude comparison.

Also establish Odd homotopy groups vanish in the ind-category. The unit B → A*ku is the left arrow of the displayed exact sequence. Apply p-completion in the source’s ind-complete category, not rationalization of ordinary THH.

*Needs:* §7.5 (Refined THH and TC⁻); §7.6 (High-powered positive integers); §7.6 (Finite-coefficient TC⁻ and q-Hodge complexes); §7.7 (Filtered derived Hom of even spectra); §7.7 (The dual finite-coefficient TC⁻ spectra); §7.8 (Pro-idempotence of the finite-coefficient q-Hodge system); §7.8 (Trace-class finite-coefficient transitions); §7.2 (Killing an idempotent pro-algebra); §4.3 (Closure and generation of nuclear objects).

**Refined TC⁻ of rational KU.** TC−,ref((KU ⊗ Q)/KU) is even with π2* = A_KU[β,β⁻¹], |β|=2. A_KU is the idempotent nuclear ind Z[[q−1]]-algebra obtained by killing pro qHdg(derived qdR(Z/m)/Z), and 0 → Z[[q−1]] → A_KU → ind-colim_(m∈N^op) Ext¹_(Z[[q−1]])(qHdg(derived qdR(Z/m)/Z),Z[[q−1]]) → 0. Duals and Ext use the derived (q−1)-complete category. This is the periodic computation with its own convergence proof, not an application of a bounded-below formula to KU.

([MW](#mw), Theorem 3.14(b) and proof, pp. 36–37; Corollary 3.8, p. 32; Lemma 3.11, pp. 34–35.)

The construction proceeds as follows. Repeat the localization cofiber and derived Hom argument over KU^hS¹. Use Bott-periodic even-filtration comparison from Layers 5–6 and the periodic qHdg identification. Identify the resulting idempotent algebra over Z[[q−1]] and keep the ind-colimit rather than replacing it by an ordinary ring colimit.

Also establish The β grading is periodic and the scalar relation q−1=βt agrees after Bott localization. Both the ordinary-to-refined map and the finite-coefficient maps occur at spectrum level.

*Needs:* §7.9 (Refined TC⁻ of rational ku); §7.7 (The completed tensor filtration); GeneralizedCohomology G5.4 (with TopologicalKTheory T4); GeneralizedCohomology G5.4 and G2.8; §5.2 (THH relative to ku and KU); §5.3 (ku and KU with circle and cyclic-group actions); §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)); §6.9 (The p-complete q-Hodge comparison for p > 2 (Wagner Theorem 4.8)); §6.9 (The p-complete q-Hodge comparison at p = 2 (Wagner Theorem 4.14)); §6.1 (Compatible local and global spherical lifts); §6.12 (Cyclonic even filtrations and the KU construction); §6.13 (TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51)); §6.13 (The Habiro–Hodge complex from TC^{−(m)} over KU (Wagner Theorem 5.63)).

### Examples

The high-powered indices include 1,9,16 and 64. They exclude 0,3,8 and 32: the 2-adic exponent 5 of 32 is odd, although it is at least four. Positivity is essential because the natural-number factorization of zero alone would satisfy the exponent tests. For any positive d, every nonzero prime exponent of d⁴ is a positive multiple of four; hence d⁴ is admissible and divisible by d. This gives the divisibility-cofinality used by the finite-coefficient tower.

Killing the zero algebra leaves the unit category unchanged, while killing the unit gives zero. For the constant algebra Z/p in D(Z), its self-tensor has an additional Tor₁=Z/p class, so it is not a derived tensor-idempotent algebra. Orthogonality to Z/p still detects Z[1/p]-modules, by the fiber of multiplication by p. The pro-idempotence assertion for the high-powered tower is therefore not termwise idempotence of these constant quotients. The coefficient calculation also distinguishes Ext¹_Z(Z/m,Z)=Z/m from Hom_Z(Z/m,Z)=0; replacing the ind-Ext¹ term by ordinary Hom would lose every finite coefficient. The rational ku extension need not admit a canonical splitting, and the KU calculation separately uses periodic convergence.

### Dependencies

Earlier layers 2, 4, 5, 6. Use the named Mathlib and Tau Ceti inputs under the supplier contracts; external contracts: DerivedDeRhamCohomology Layer 1; EnhancedDerivedSheaves E5:presentability; HabiroCohomologyFoundations Layer 4 (HQ.3); GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; StableHomotopyKTheory Layer 7. The individual statements above identify the required comparison or functoriality, not merely a shared object name.

## Layer 8: Arithmetic trace filtrations

The perfectoid and relative Breuil–Kisin trace coefficients, quasisyntomic unfolding, and the crystalline and AΩ comparisons are AInfCohomology §AI.7.2; the trace–prismatic comparison and the graded pieces of THH, TC⁻, TP and TC are PrismaticCohomologyPartIII §7.0. Throughout this layer, for a quasisyntomic A write C_A for the unfolded trace algebra of AInfCohomology §AI.7.2 (D̂_A there), with its Nygaard filtration N^{≥i}C_A, graded pieces N^iC_A and Breuil–Kisin twists C_A{i}=gr^iTP(A;ℤ_p)[−2i]; by PrismaticCohomologyPartIII §7.0 it is the Nygaard completion of prismatic cohomology, and gr^iTC(A;ℤ_p)≃ℤ_p(i)(A)[2i]. Over a perfectoid base the degree-two class of TC⁻ written u here is the class written b in AInfCohomology §AI.7.2; v and σ agree. This layer proves the descent theorem for trace spectra, the description of HC⁻ and HP by derived de Rham cohomology relative to an arbitrary quasisyntomic base, the cotangent filtration of THH over a perfectoid base, the décalage and Segal comparisons over O_C, derived convergence, trace Adams operations, the characteristic-p TC sheaf, the K-theoretic description of syntomic complexes and the Habiro trace interface. Derived convergence keeps all completion and lim¹ terms.

### 8.1 Descent and the cyclic de Rham comparison

**Flat and quasisyntomic descent for trace spectra.** HH(−/R), HC⁻(−/R), HH(−/R)_hS¹ and HP(−/R) on commutative R-algebras, and THH, TC⁻, THH_hS¹ and TP on commutative rings, are fpqc sheaves in spectra. Their derived p-complete variants have descent for p-completely faithfully flat covers in QSyn; QRSP basis unfolding recovers them. THH(−)^tC_p has the same Čech descent by the finite-group norm sequence. The argument proves this descent with its weak Postnikov towers; it does not assert arbitrary fpqc hyperdescent for every cotangent complex.

([BMS](#bms), Corollary 3.4 and Remark 3.5, pp. 218–219; §4.4, Lemmas 4.28–4.30 and Proposition 4.31, pp. 229–230.)

The construction proceeds as follows. Apply the imported cotangent-exterior-power descent to the complete HKR filtration. For homotopy orbits use the weak Postnikov-tower connectivity lemma and perfect finite truncations of the circle chain complex. Homotopy fixed points preserve limits; the norm cofiber then handles periodic/Tate constructions. Reduce THH to HH through THH(Z) → Z and the finite/pseudocoherent Postnikov truncations supplied by Layers 2–3. Derived p-completion and the QRSP basis comparison supply p-complete descent.

Also establish For a faithfully flat polynomial Čech cover the augmentation is an equivalence of trace spectra. TP descent is proved through the norm sequence, not by assuming Tate preserves arbitrary limits.

*Needs:* §1.1 (The cyclic enhancement of supplied derived Hochschild chains); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §1.11 (The derived HKR filtration); §2.7 (Topological Hochschild homology of an E_1-ring); §2.8 (THH relative to THH(ℤ) is Hochschild homology); §2.1 (Homotopy orbits and homotopy fixed points); BordismFormalGroups §F6.5 (finite-group Borel norm and Tate cofiber); AInfCohomology §AI.7.2 (Circle actions, homotopy fixed points and Tate constructions); §2.10 (Negative topological cyclic and periodic topological cyclic homology); DerivedDeRhamCohomology Layer 0 — cotangent complex; DerivedDeRhamCohomology Layer 5 — completed cotangent descent; DerivedDeRhamCohomology Layer 5 — quasisyntomic site; DerivedDeRhamCohomology Layer 1 — derived completion.

**Even Hochschild homology on quasiregular covers.** PrismaticCohomologyPartIII §7.0 uses the evenness of the p-completed cyclic theory of p-torsion-free QRSP rings over ℤ_p; this target is the relative statement with its divided-power description. For S∈qrsPerfd_R, or for a QRSP algebra over a perfectoid R or over Z_p as in Lemma 5.14, let M=(L_(S/R)[−1])^∧p. M is p-completely flat, HH(S/R;Z_p) is even, and π_(2i)HH(S/R;Z_p)≃(Γ^i_S M)^∧p for i≥0. The HKR filtration has these terms; divided powers are over S, not over the perfectoid base R.

([BMS](#bms), Lemma 5.14, p. 241; use in Theorem 7.1, pp. 254–255.)

The construction proceeds as follows. The QRSP cotangent complex has p-complete Tor amplitude in degree −1. The imported integral derived HKR filtration has exterior-power terms; wedge powers of the shifted flat module give divided powers in homotopical degree 2i. Connectivity and p-complete flatness identify the filtration pieces without odd groups.

Also establish For S=R, only π₀HH(S/R) survives. The divided-power coefficient ring is S, as corrected in the proof of Theorem 7.1.

*Needs:* DerivedDeRhamCohomology Layer 5 — quasiregular semiperfectoid rings; DerivedDeRhamCohomology Layer 0 — cotangent complex; DerivedDeRhamCohomology Layer 0 — derived divided powers; §1.1 (The cyclic enhancement of supplied derived Hochschild chains); §1.11 (The derived HKR filtration).

**Negative and periodic cyclic homology from derived de Rham.** PrismaticCohomologyPartIII §7.0 (Linear cyclic theory and the rational trace square) gives these graded pieces relative to ℤ; this target is the statement relative to an arbitrary quasisyntomic base R, as in BMS2 §5.2. For quasisyntomic A over a fixed base R in BMS2 §5.2, the unfolded even Postnikov filtrations on p-complete HC⁻ and HP are complete exhaustive multiplicative Z-indexed filtrations, with gr^iHC⁻(A/R;Z_p)≃Hodge^{≥i}(Hodge-completed derived dR(A/R))^∧p[2i] and gr^iHP≃(Hodge-completed derived dR(A/R))^∧p[2i]. On QRSP covers π₀HC⁻ with its abutment filtration identifies with the Hodge-and-p-completed derived dR algebra, including the de Rham differential. This compares existing cyclic objects and existing derived dR, rather than defining a new dR.

([BMS](#bms), Proposition 5.15; Theorem 1.17 and proof, pp. 241–242.)

The construction proceeds as follows. Use the degenerate even HH fixed-point spectral sequence on QRSP rings. Identify its Beilinson-heart differential through the polynomial one-variable calculation and left Kan extension. Unfold, compare graded pieces and use completeness/conservativity; exhaustiveness follows from eventual stabilization in each homotopy degree.

Also establish For R[x], the differential x ↦ dx agrees with Connes B through the imported HKR map. The HP graded piece uses all Hodge-completed dR, not a Hodge truncation.

*Needs:* §8.1 (Even Hochschild homology on quasiregular covers); §8.1 (Flat and quasisyntomic descent for trace spectra); DerivedDeRhamCohomology Layer 2 — hodge completed derham; DerivedDeRhamCohomology Layer 1 — filtered completion; §1.2 (Mixed complexes); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §1.11 (The derived HKR filtration).


### 8.2 The ordinary coefficient presentation

**The perfectoid trace coefficient presentation.** For a commutative ring A and ξ∈A form P(A,ξ)=A[u,v]/(uv−ξ), with assigned homotopical degrees |u|=2, |v|=−2 and coefficients in degree 0. Its underlying ring is Mathlib’s quotient of MvPolynomial(Fin 2,A) by the principal ideal (X₀X₁−Cξ). There are maps can:P(A,ξ) → A[σ±¹] sending u↦ξσ,v↦σ⁻¹, and, for φ:A → A a ring endomorphism, frobenius sending coefficients through φ, u↦σ,v↦φ(ξ)σ⁻¹. The latter is φ-semilinear. These concrete maps are the algebraic signatures of the perfectoid TC⁻/TP calculation of AInfCohomology §AI.7.2, whose generators are normalized so that φ(u)=σ; in the relative Breuil–Kisin calculation there the Frobenius carries an extra unit α, u↦ασ, v↦φ(ξ)α⁻¹σ⁻¹, and the displayed map is the case α=1.

([BMS](#bms), Proposition 6.2 and diagram (1), pp. 245–247.)

The construction proceeds as follows. Form the quotient by the displayed homogeneous relation using the existing polynomial and ideal quotient constructions. Descend the two evaluation ring maps to Laurent polynomials because uv maps respectively to ξ and φ(ξ). Assign the source/target grades and compare them with the spectral coefficient degrees in Proposition 6.2. The ordinary quotient and its evaluation maps supply the coefficient calculation; separately construct its grading and its comparison with the homotopy ring of the spectral algebra.

Provide the following operations and identities.

- `TracePresentation.coeff`: The scalar map A → P(A,ξ).
- `TracePresentation.u`: The class of X₀ has degree 2.
- `TracePresentation.v`: The class of X₁ has degree −2.
- `TracePresentation.uv`: u·v equals the scalar class of ξ.
- `TracePresentation.lift`: For a ring map f:A → B and a,b∈B with ab=f(ξ), there is a unique ring map P(A,ξ) → B with coefficients f and u↦a,v↦b.
- `TracePresentation.ext`: Ring maps out of P(A,ξ) agree if they agree on all scalars and on u,v.
- `TracePresentation.can`: The A-linear ring map to LaurentPolynomial(A) takes u to C(ξ)T(1) and v to T(−1).
- `TracePresentation.frobenius`: For φ:A → A, the φ-semilinear map to LaurentPolynomial(A) takes scalars a to C(φ(a)), u to T(1), v to C(φ(ξ))T(−1).
- `TracePresentation.map`: For f:A → B and f(ξ)=η, the universal lift gives P(A,ξ) → P(B,η), mapping coefficients by f and preserving u,v. Its identity and composition laws follow from generator extensionality.

**Checks.**

- `TracePresentation.canGenerators`: can(u)=C(ξ)T(1), can(v)=T(−1).
- `TracePresentation.frobeniusScalars`: frobenius(φ,coeff(a))=C(φ(a)); its u and v images have product C(φ(ξ)).
- `TracePresentation.zeroParameter`: In P(A,0), u·v=0.
- `TracePresentation.unitParameter`: P(A,1) is isomorphic to LaurentPolynomial(A), taking u to T(1),v to T(−1), and can is that isomorphism.

Also establish The Frobenius map must apply φ to scalar ξ in the relation. Setting ξ=0 gives uv=0, not the polynomial ring in independent u,v.

*Needs:* `MvPolynomial`; `Ideal.Quotient.mk`; `Ideal.Quotient.lift`; `LaurentPolynomial`; `LaurentPolynomial.C`; `LaurentPolynomial.T`.

The ordinary quotient universal property is `TracePresentation.lift`; `TracePresentation.can_and_frobenius` jointly states the two coefficient maps on this quotient. The latter statement is valid for every commutative coefficient ring A, every ξ∈A and every endomorphism φ, independently of the perfectoid hypotheses needed for the spectral computation.

### 8.3 Deformation, antisymmetrization and cotangent filtrations

**THH as a deformation of Hochschild homology.** For ordinary R-algebra A with R perfectoid, the class u∈π₂TC⁻(R;Z_p) induces coherent S¹-equivariant cofiber sequences THH(A;Z_p)[2] →^u THH(A;Z_p) → HH(A/R;Z_p), TC⁻(A;Z_p)[2] →^u TC⁻(A;Z_p) → HC⁻(A/R;Z_p), and TP(A;Z_p)[2] →^(ξσ) TP(A;Z_p) → HP(A/R;Z_p). These are maps and cofibers before passing to homotopy groups.

([BMS](#bms), Theorem 6.7, pp. 251–252.)

The construction proceeds as follows. Compute the THH(R)-module cofiber for the base and tensor with THH(A). The u lift in TC⁻ constructs the equivariance. Apply homotopy fixed points and the Tate construction, using the base coefficient maps to identify the multiplication ξσ.

Also establish For A=R the Hochschild cofiber is R in degree zero.

*Needs:* AInfCohomology §AI.7.2 (Perfectoid trace coefficient calculation); §1.1 (The cyclic enhancement of supplied derived Hochschild chains); §1.2 (Mixed complexes); §1.4 (Cyclic, negative cyclic and periodic cyclic homology); §2.8 (THH relative to an E_∞-ring); §2.8 (THH relative to THH(ℤ) is Hochschild homology); §2.8 (Mixed complexes model complexes with circle action); §2.8 (The norm sequence for cyclic homology); §2.10 (Negative topological cyclic and periodic topological cyclic homology).

**Antisymmetrization into THH.** For ordinary perfectoid R-algebra A, define the natural graded R-algebra map H⁰((Ω*_(A/R))^∧p) → π_*THH(A;Z_p), with Ω^i placed in degree i. It extends the degree-one Hochschild comparison and multiplies differential classes by the exterior product. Derived p-completion is applied termwise before H⁰; arbitrary ordinary p-completion of Ω does not replace it.

([BMS](#bms), Construction 6.8, pp. 252–253.)

The construction proceeds as follows. Use the low-degree THH → HH comparison to obtain degree-one differential classes. Use odd-square vanishing from the low-degree τ≤2 comparison to make exterior multiplication well-defined, including at p=2. Pass from absolute to relative forms through the p-divisible perfectoid-base differentials and termwise derived p-completion.

Provide the following operations and identities.

- `Antisymmetrization.differential`: For a∈A, the completed relative da has its degree-one THH image.
- `Antisymmetrization.wedge`: The image of ω∧η is the product of their images in THH, with graded signs and odd squares zero.
- `Antisymmetrization.map`: For R-algebra maps A → B, the differential and THH maps commute.
- `Antisymmetrization.unit`: The degree-zero map is the canonical A → π₀THH(A;Z_p).

**Checks.**

- `Antisymmetrization.polynomialDx`: For A=R[x], dx maps to the degree-one generator identified by τ≤2THH → τ≤2HH.
- `Antisymmetrization.baseRing`: For A=R all positive relative forms and their images are zero.
- `Antisymmetrization.oddSquare`: For A=R[x], the image of dx squares to zero, including for p=2.

Also establish The class dx for a polynomial variable maps to its standard Hochschild/THH degree-one class.

*Needs:* §8.3 (THH as a deformation of Hochschild homology); §1.9 (The antisymmetrisation map and the HKR projection); §1.6 (Shuffle and external products); DerivedDeRhamCohomology Layer 0 — cotangent complex; DerivedDeRhamCohomology Layer 1 — derived completion.

**The cotangent filtration of THH.** For a p-completely quasismooth R-algebra A, antisymmetrization induces (Ω*_(A/R))^∧p⊗_R π_*THH(R;Z_p) ≃ π_*THH(A;Z_p). For every p-complete R-algebra A, left Kan extension gives the complete decreasing cotangent filtration of Corollary 6.10, with n-th graded term the sum of (derived ∧^j_A L_(A/R))^∧p[n] for 0≤j≤n and j≡n mod 2. Its n-th filtration term is n-connective.

([BMS](#bms), Corollaries 6.9–6.10, pp. 253–254.)

The construction proceeds as follows. On quasismooth algebras split the THH/HH deformation using differential classes. Extend the complete connective filtration from p-completed polynomial algebras in p-complete spectra. Use the derived exterior-power description and increasing connectivity to prove completeness.

Also establish For R[x] the exterior degree-one class occurs alongside the even u powers.

*Needs:* §8.3 (Antisymmetrization into THH); AInfCohomology §AI.7.2 (Bökstedt periodicity, perfectoid clause); DerivedDeRhamCohomology Layer 0 — cotangent complex; EnhancedDerivedSheaves E5:animation — animated commutative rings; EnhancedDerivedSheaves E5:animation — universal property of animation.

### 8.4 Décalage and Segal comparisons over O_C

**Nygaard agrees with the AΩ décalage filtration.** For p-completed smooth O_C-algebra A, the Frobenius factorization C_A≃Lη_ξφ_*C_A identifies the Nygaard filtration with the Lη_ξ filtration on φ_*AΩ_A through the AΩ comparison of AInfCohomology §AI.7.2. The graded description is the source’s truncation of the Hodge–Tate complex, using the AI.4 BMS1 Theorems 8.3 and 9.4(i) inputs; this is not a new definition of the generic Lη functor.

([BMS](#bms), Proposition 9.10 and Remark 9.11, pp. 289–290.)

The construction proceeds as follows. Use the graded computation from Theorem 7.2 and the imported Hodge–Tate specialization. Identify both filtrations on the Frobenius-twisted AΩ through their truncation description. Use completeness and the filtered comparison to recover the full filtration.

Also establish The Frobenius pullback and ξ are retained in the filtration identity.

*Needs:* AInfCohomology §AI.7.2 (Absolute trace comparison with AΩ); AInfCohomology §AI.7.2 (Quasisyntomic unfolding of the trace coefficient sheaf); AInfCohomology AI.4; AInfCohomology AI.1 — derived decalage; AInfCohomology AI.1 — filtered beilinson description.

**The Segal comparison over O_C.** For a smooth O_C-algebra A of relative dimension d, p-completed if necessary, gr^iTHH(A;Z_p)≃τ^{≤i}Ω̃_A{i}[2i] and gr^iTHH(A;Z_p)^tC_p≃Ω̃_A{i}[2i], where Ω̃_A is the imported Hodge–Tate complex. On graded pieces cyclotomic Frobenius is the truncation inclusion, and it is an isomorphism on π_n for n≥d.

([BMS](#bms), Corollary 9.12, pp. 290–291.)

The construction proceeds as follows. Use the quotient TP/φ(ξ) to identify the finite-Tate graded pieces with Hodge–Tate specialization. Apply the Nygaard/Lη comparison to identify the Frobenius map with truncation. The relative dimension bound implies the high-degree equivalence.

Also establish The statement uses the Hodge–Tate complex over O_C, not ordinary untwisted de Rham forms.

*Needs:* §8.4 (Nygaard agrees with the AΩ décalage filtration); AInfCohomology §AI.7.2 (Perfectoid trace coefficient calculation); AInfCohomology AI.4.

### 8.5 Convergence and negative TC degrees

**Derived convergence of the trace spectral sequences.** The complete exhaustive filtered spectra give the BMS2 derived convergent spectral sequences E₂^(a,b)=H^(a−b)(N^(−b)C_A) ⇒ π_(−a−b)THH, E₂^(a,b)=H^(a−b)(N^{≥−b}C_A{−b}) ⇒ π_(−a−b)TC⁻, E₂^(a,b)=H^(a−b)(C_A{−b}) ⇒ π_(−a−b)TP, and E₂^(a,b)=H^(a−b)(Z_p(−b)(A)) ⇒ π_(−a−b)TC in their defined weight range. The unbounded cases mean convergence to the supplied derived complete filtration; no unconditional strong convergence after forgetting derived limits is claimed. On p-completed smooth finite-dimensional perfectoid-base algebras, the stated cohomological bounds give degreewise control of the inverse-limit terms.

([BMS](#bms), Theorem 1.12(4)–(5), p. 207; Proposition 7.13, pp. 259–260.)

The construction proceeds as follows. Build the exact couple from the filtered spectrum rather than postulating an E₂ page. Use the complete and exhaustive identifications for the derived abutment. Apply smooth cohomological bounds for the explicit degreewise convergence specialization; retain limit corrections outside that class.

Also establish The signs of weight −b, cohomological degree a−b and homotopical abutment −a−b agree.

*Needs:* PrismaticCohomologyPartIII §7.0 (graded TC⁻, TP and TC); AInfCohomology §AI.7.2 (Quasisyntomic unfolding of the trace coefficient sheaf); StableHomotopyKTheory Layer 7.

**The TC-internal negative-degree calculation.** For a connective ring spectrum A, π_iTC(A;Z_p)=0 for i<−1 by the classical TR connective comparison. For ordinary A, π_(−1)TC(A;Z_p)=coker(F−1:W(A) → W(A)). On the QRSP site this cokernel vanishes locally by the iterated Artin–Schreier covers, so the weight-zero TC fiber is locally in degree zero and negative motivic weights vanish. Identifying the resulting weight-zero sheaf with constant Z_p by K₀ is owned downstream and is not used here.

([BMS](#bms), TC-internal part of proof of Proposition 7.16, p. 262.)

The construction proceeds as follows. Use the classical formulation and connectivity of all TR^r from Layers 2–3. Compute π₀TR^r=W_r(A), then the F−1 cokernel for π_(−1)TC. Extract the iterated Artin–Schreier covers within the QRSP basis. Stop before the K-theoretic rank comparison in Proposition 7.16.

Also establish For A=F_p pointwise F−1 on Z_p is zero, so π_(−1)TC(F_p)=Z_p; local vanishing must not be mistaken for pointwise vanishing.

*Needs:* §2.14 (TR and genuine TC); §2.17 (Genuine and Nikolaus–Scholze TC agree on bounded below spectra); §2.10 (The Nikolaus–Scholze formula for TC); PrismaticCohomologyPartIII §7.0 (graded TC⁻, TP and TC); DerivedDeRhamCohomology Layer 5 — quasiregular semiperfectoid rings; DerivedDeRhamCohomology Layer 5 — quasisyntomic site.

### 8.6 Trace Adams operations

**The p-adic Adams operations on traces.** The action of Z_p^× on the p-completed circle K(Z_p,1) gives functorial coherent E∞ cyclotomic Adams operations on THH(A;Z_p), and hence on the filtered THH, TC⁻, TP and TC. On C_A and each Nygaard step the action is trivial; on C_A{1} it is scalar multiplication, so γ acts by γ^i on each i-th graded piece, for i∈Z in its defined range.

([BMS](#bms), Construction 9.13 and Proposition 9.14, pp. 291–292.)

The construction proceeds as follows. Identify p-completed THH with the p-completion of the E∞ tensor by K(Z_p,1). Transport the automorphism action through the cyclotomic structure and complete filtered functors. Use universality of Ainf, finite conormal/twist identifications and the equivariant AΩ comparison to compute the action; extend by QRSP descent and left Kan extension.

Provide the following operations and identities.

- `AdamsOperations.action`: There is a coherent Z_p^× action on the p-completed trace functors.
- `AdamsOperations.map`: Ring maps commute with every operation ψ_γ.
- `AdamsOperations.coefficient`: ψ_γ acts trivially on C_A and its Nygaard ideals.
- `AdamsOperations.twist`: On C_A{i}, ψ_γ is multiplication by γ^i.
- `AdamsOperations.filtered`: The operations preserve motivic filtrations and commute with can and cyclotomic Frobenius.

**Checks.**

- `AdamsOperations.identity`: ψ_1 is the identity operation.
- `AdamsOperations.weightOne`: On gr¹TP the operation ψ_γ is multiplication by γ.
- `AdamsOperations.weightMinusOne`: On gr^(−1)TP the operation is γ^(−1), excluding the wrong uniform γ action.

Also establish γ acts trivially in weight zero and by γ in weight one.

*Needs:* AInfCohomology §AI.7.2 (Absolute trace comparison with AΩ); PrismaticCohomologyPartIII §7.0 (twist compatibility of the trace–prismatic comparison); AInfCohomology Layer AI.0:integral (the Breuil–Kisin twist); EnhancedDerivedSheaves E5:abstract — symmetric monoidal infinity category; EnhancedDerivedSheaves E5:presentability — coherent group actions; §2.6 (Geometric realisation of cyclic objects and the circle action); §2.7 (The cyclotomic Frobenius of THH); §2.9 (Cyclotomic spectra); §2.10 (Negative topological cyclic and periodic topological cyclic homology); §2.10 (The Nikolaus–Scholze formula for TC).

### 8.7 Characteristic-p TC and syntomic K-sheaves

**The even TC sheaf in characteristic p.** On QRSPerfd_(F_p), for i≥0 there is an exact sequence of sheaves 0 → π_(2i)TC(−;Z_p) → π_(2i)TC⁻(−;Z_p) →^(φ−can) π_(2i)TP(−;Z_p) → 0. For i>0 the corresponding divided-Frobenius-minus-one operator on a QRSP ring is pointwise surjective; in weight zero surjectivity is sheaf-local by Artin–Schreier covers. Thus TC is locally even on this site. The identification with sheafified even K-groups is the next target.

([BMS](#bms), Lemma 8.19 and TC-sheaf part of Proposition 8.20, pp. 280–281.)

The construction proceeds as follows. Use Nygaard p-divisibility to prove pointwise surjectivity in positive weights modulo p and then lift p-adically. Use Artin–Schreier covers in weight zero. Apply the long exact homotopy sequence of the TC fiber as a sequence of sheaves.

Also establish TC(F_p;Z_p) still has π_(−1)=Z_p at the point; the sheaf statement does not erase this pointwise group.

*Needs:* AInfCohomology §AI.7.2 (Characteristic-p trace and crystalline comparison); §8.5 (The TC-internal negative-degree calculation); PrismaticCohomologyPartIII §7.0 (graded TC⁻, TP and TC); DerivedDeRhamCohomology Layer 5 — quasisyntomic site; DerivedDeRhamCohomology Layer 5 — quasiregular semiperfectoid rings.

**Syntomic complexes from sheafified even K-groups.** Let R be a p-complete quasisyntomic ring, i≥0 and n≥1, and let qSyn_R be its quasisyntomic site, whose quasiregular semiperfectoid objects form a basis. For S quasiregular semiperfectoid the trace identifies K(S;Z_p) with τ_{≥0}TC(S;Z_p), so H⁰(Z_p(i)(S))≅K_{2i}(S;Z_p) for i≥0 and H¹(Z_p(i)(S))≅K_{2i−1}(S;Z_p) for i≥1. Because Z_p(i) is discrete and p-torsion-free as a quasisyntomic sheaf, the sheafification a K_{2i}(−;Z_p) of S↦K_{2i}(S;Z_p) is Z_p(i), the sheafification of K_{2i−1}(−;Z_p) is zero for i≥1, and

```text
Z_p(i)(R) ≃ RΓ_qsyn(R, a K_{2i}(−;Z_p)),
Z/p^n(i)(R) ≃ RΓ_qsyn(R, a π_{2i}(K(−)/p^n)),
```

naturally in R. Here K is connective and K/p^n is the cofibre of multiplication by p^n, so π_{2i}(K/p^n) contains the Bockstein contribution K_{2i−1}[p^n] before sheafification. In weights 0 and 1 the sheaves are the constant sheaf Z_p and T_pG_m. For an 𝔽_p-algebra the groups are explicit: for S quasiregular semiperfect, K_{2i}(S;Z_p)≅A_crys(S)^{φ=p^i} and K_{2i−1}(S;Z_p)=0 already before sheafification; and for A smooth over a perfect field, Rλ_*(a K_{2i}(−;Z_p))≃WΩ^i_{A,log}[−i] for λ:qSyn_A→(Spec A)_proét.

Throughout this statement, R p-complete with bounded p-power torsion and p-completed cotangent complex of Tor-amplitude [−1,0], the BMS quasisyntomic convention of the Conventions; i≥0, n≥1; finite coefficients are taken before homotopy groups; sheafification is quasisyntomic.

([BMS-arXiv](#bms-arxiv), §7.4, Theorem 7.15 and Proposition 7.16, p. 50, Proposition 7.17, Conjecture 7.18 and Remark 7.19, p. 51; §8.4, Proposition 8.20 and Corollary 8.21, p. 66, and Corollary 8.23, p. 67; [BS](#bs), §14, Theorem 14.1 and Corollary 14.2, p. 97; [CMM](#cmm), Corollary 6.9, p. 53.)

The construction proceeds as follows. A quasiregular semiperfectoid S is p-complete, hence henselian along (p), and S/p is semiperfect, so `semiperfectTrace` of §4.17 gives K(S;Z_p)≃τ_{≥0}TC(S;Z_p). Identify π_{2i} and π_{2i−1} of TC(S;Z_p) with H⁰ and H¹ of Z_p(i)(S) through PrismaticCohomologyPartIII §7.0 (graded TC⁻, TP and TC). Discreteness and p-torsion-freeness of Z_p(i) (PrismaticCohomologyPartIII §6.28) kill the sheafified odd groups and identify the even ones; unfold along quasiregular semiperfectoid covers (DerivedDeRhamCohomology Layer 5). For finite coefficients use the universal coefficient sequence and exactness of sheafification; p-torsion-freeness of a K_{2i}(−;Z_p) gives a π_{2i}(K/p^n)≅(a K_{2i}(−;Z_p))/p^n. In characteristic p the preceding target supplies the explicit groups, and the smooth pushforward is BMS Corollary 8.21. In weights 0 and 1 use the rank function on w-local rings and units with p-power roots (BMS Propositions 7.16–7.17).

Provide the following operations and identities.

- `syntomicEvenKSheaf`: The quasisyntomic sheaves a K_{2i}(−;Z_p) and a π_{2i}(K(−)/p^n) on qSyn_R.
- `syntomicEvenKSheaf.comparison`: a K_{2i}(−;Z_p)≅Z_p(i) as sheaves on qSyn_R, compatibly with the trace and the motivic filtration of PrismaticCohomologyPartIII §7.0.
- `syntomicEvenKSheaf.odd`: a K_{2i−1}(−;Z_p)=0 for i≥1.
- `syntomicEvenKSheaf.cohomology`: Z_p(i)(R)≃RΓ_qsyn(R,a K_{2i}(−;Z_p)) and Z/p^n(i)(R)≃RΓ_qsyn(R,a π_{2i}(K/p^n)), naturally in R.
- `syntomicEvenKSheaf.coefficients`: Compatibility with reduction in n, the Bockstein maps and the coefficient exact sequences.
- `syntomicEvenKSheaf.charP`: For S quasiregular semiperfect over 𝔽_p, K_{2i}(S;Z_p)≅A_crys(S)^{φ=p^i} and odd groups vanish; for smooth A over a perfect field, Rλ_* of the sheaf is WΩ^i_{A,log}[−i].

**Checks.**

- `syntomicEvenKSheaf.weight_zero`: For i=0, a K₀(−;Z_p) is the constant sheaf Z_p, and RΓ_qsyn(R,Z_p)=Z_p(0)(R).
- `syntomicEvenKSheaf.perfect_field`: For S=𝔽_p, A_crys(𝔽_p)=Z_p with φ the identity, so A_crys(𝔽_p)^{φ=p^i} is Z_p for i=0 and zero for i>0. This matches K_{2i}(𝔽_p;Z_p)=0 for i>0. A normalization without the twist p^i would give Z_p in every even degree.
- `syntomicEvenKSheaf.odd_is_local`: For R=Z_p, with p odd, K₁(Z_p;Z_p) is the p-completion of Z_p^×, isomorphic to Z_p and nonzero. Odd vanishing holds only after quasisyntomic sheafification, not for every object.
- `syntomicEvenKSheaf.coefficient_boundary`: The universal coefficient sequence is 0→K_(2i)(U)/p^n→π_(2i)(K(U)/p^n)→K_(2i−1)(U)[p^n]→0. For p=2, n=i=1 and U=Spec Z₂, the last term contains −1∈K₁(Z₂)[2]. Replacing the middle term by its subgroup K₂(Z₂)/2 discards this class before sheafification. No splitting of the sequence is asserted.
- `syntomicEvenKSheaf.complete_domain`: Spec Z is p-quasisyntomic but not p-complete, and lies outside this target. Its syntomic complexes glue the p-adic part with étale cohomology of Z[1/p] (BM Examples 1.2 and 1.4, pp. 1–2). The K-theoretic description on all p-quasisyntomic schemes announced in BM Example 1.6, p. 2, is not claimed.

Also establish In weight one, the comparison agrees with the Kummer description of Z_p(1) as T_pG_m. The equality Z/p^n(i)(R)≃RΓ_qsyn(R,a π_{2i}(K/p^n)) uses sheafification before taking cohomology; pointwise K-groups give a different statement.

*Needs:* PrismaticCohomologyPartIII §7.0 (graded TC⁻, TP and TC); §8.7 (The even TC sheaf in characteristic p); §4.17 (Henselian rigidity of the trace with finite coefficients); §4.11 (The cyclotomic trace); §4.12 (Relative K-theory, relative TC and K^inv); GeneralAlgebraicKTheory Layers 5–6; PrismaticCohomologyPartIII §§6.8–6.9, 6.28 and 6.31; DerivedDeRhamCohomology Layer 5 — quasisyntomic site; DerivedDeRhamCohomology Layer 5 — quasiregular semiperfectoid rings.

### 8.8 The coherent Habiro trace interface

**The coherent trace interface for Habiro cohomology.** For the supplied Layers 5–6 q-Hodge and Habiro inputs satisfying Wagner 4.18(A),(R), 4.18a(R2), and, in Theorem 5.63, 2∈R× and 5.43(A2), export the coherent S¹ and genuine finite-C_m cyclonic maps, complete even filtration and graded q-Hodge module comparison diagrams. Retain Σ^(−2i) shearing, Bott inversion, and completion. Theorem 4.27 has an E_(n−1) multiplicative enhancement only under Remark 4.28’s chosen E_n lift hypotheses (2≤n≤∞); an enhancement of the Habiro comparison must be supplied separately by Layers 5–6 and is not inferred from the module equivalence of Theorem 5.63. For R=O_F[1/Δ], require 6|Δ, disc(F)|Δ and the specified spherical étale lift. It is the trace-side interface for the Habiro descent of trace pairs, which is constructed downstream (see Downstream consumers), together with the periodic reconstruction proof; it does not assert Habiro descent for the refined rational TC⁻ ind-algebras.

([W](#w), Theorem 4.27 and Remark 4.28, p. 50; 4.18(A),(R), p. 46; 4.18a(R2), p. 49; 5.43(A2), p. 70; Theorem 5.63, pp. 79–80; Corollary 6.15, p. 86.)

The construction proceeds as follows. Take the coherent finite-C_m comparison from Layers 5–6, with genuine fixed points before residual-circle homotopy fixed points. Apply the chosen q-Hodge modification and the Habiro-complete descent functor to the module comparison. Retain only the multiplicative structure separately established under the specified lift hypotheses. Check the Bott localization square and Σ^(−2i) shearing before identifying the arithmetic coefficient ring.

Also establish A periodic nonconnective KU input uses the imported periodic reconstruction proof. At primes 2 or 3 the stated number-field comparison is not applied without the required localization. The module comparison of Theorem 5.63 alone supplies no E∞ upgrade.

*Needs:* §7.5 (Refined THH and TC⁻); §6.10 (q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27)); §6.10 (Completeness, multiplicativity and the graded comparison); §6.11 (Cyclonic ku and KU); §6.11 (Cyclonic Adams lift coherence); §6.1 (Compatible local and global spherical lifts); §6.13 (TC^{−(m)} over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51)); §6.13 (The Habiro–Hodge complex from TC^{−(m)} over KU (Wagner Theorem 5.63)); §6.14 (Étale algebras lift uniquely to étale E_∞-algebras); §6.14 (The Habiro ring of a number field from KU (Wagner Corollary 6.15)); HabiroCohomologyFoundations Layer 4 (HQ.3) — q hodge filtrations; HabiroCohomologyFoundations Layer 4 (HQ.3) — the q hodge complex; HabiroCohomologyFoundations Layer 3 (HQ.4) — the arithmetic fracture squares and cyclotomic descent; HabiroCohomologyFoundations Layer 3 (HQ.4) — no automatic multiplicative upgrade; HabiroRings HR.2 — habiro complete modules; HabiroRings HR.2 — the monoidal structure; HabiroRings HR.2 — habiro complete solid spectra; HabiroRings HR.5 — the relative habiro ring; HabiroRings HR.5 — completed base change.

### Examples

For the ordinary presentation P(A,ξ)=A[u,v]/(uv−ξ), ξ=0 gives uv=0 and ξ=1 identifies v with u⁻¹. In the canonical map to A[σ±¹], u↦ξσ and v↦σ⁻¹ have product ξ. In the Frobenius map, coefficients go by φ and u↦σ, v↦φ(ξ)σ⁻¹ have product φ(ξ). Sending v instead to ξσ⁻¹ would fail whenever φ(ξ)≠ξ. These quotient computations verify the relation and the coefficient semilinearity; they do not construct a spectral realization.

For the perfect ring Fₚ, the crystalline coefficient complex is Zₚ, Frobenius is the identity, and N≥ⁱ=pⁱZₚ for i≥0. After identifying pⁱZₚ with Zₚ by division by pⁱ, φᵢ−can is multiplication by 1−pⁱ. For i>0 this is a unit, including i=1,p=2, and the syntomic fiber is zero. For i=0 the map is zero; its fiber has H⁰=Zₚ and H¹=Zₚ. This gives π₋₁TC(Fₚ;Zₚ)=Zₚ at the point. Artin–Schreier covers make the corresponding cokernel vanish as a sheaf; pointwise vanishing would contradict this calculation.

For the K-theoretic description of syntomic complexes, weight zero gives the constant sheaf Z_p and weight one the Tate module of G_m. For the perfect field 𝔽_p, A_crys(𝔽_p)^{φ=p^i} vanishes for i>0, matching Quillen's K_{2i}(𝔽_p;Z_p)=0. These are tests of quasisyntomic sheafification, not computations of the pointwise presheaf K₂ᵢ.

### Dependencies

Earlier layers 1, 2, 4, 6, 7. Use the named Mathlib and Tau Ceti inputs under the supplier contracts; external contracts: AInfCohomology AI.0; AInfCohomology AI.0:integral; AInfCohomology AI.1; AInfCohomology AI.4; AInfCohomology §AI.7.2; BordismFormalGroups §F6.5; DerivedDeRhamCohomology Layer 0; DerivedDeRhamCohomology Layer 1; DerivedDeRhamCohomology Layer 2; DerivedDeRhamCohomology Layer 3; DerivedDeRhamCohomology Layer 4; DerivedDeRhamCohomology Layer 5; EnhancedDerivedSheaves E5:abstract; EnhancedDerivedSheaves E5:animation; EnhancedDerivedSheaves E5:presentability; GeneralAlgebraicKTheory §3.2; GeneralAlgebraicKTheory Layers 5–6; HabiroCohomologyFoundations Layer 4 (HQ.3); HabiroCohomologyFoundations Layer 3 (HQ.4); HabiroRings HR.2; HabiroRings HR.5; PrismaticCohomology Layer 2; PrismaticCohomologyPartII Layer 3; PrismaticCohomologyPartIII §§6.8–6.9, 6.28, 6.31 and 7.0; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; StableHomotopyKTheory Layer 7. The individual statements above identify the required comparison or functoriality, not merely a shared object name.

## Layer 9: The rational p-adic Beilinson bridge

Finish with the TC square for ordinary reduction of an associative ring and its K-theoretic form for commutative rings henselian along (p). Its construction first uses spectral reduction, then cyclotomic quasi-isogenies. The graded refinement, with the uncompleted Hodge filtration on derived de Rham cohomology, is the prismatic Beilinson square of PrismaticCohomologyPartIII §7.0, imported.

### 9.1 Coefficient order and trivial cyclotomic integers

**ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p.** For a functor F to spectra and a prime p: F(R; ℤ_p) := F(R)^∧_p (p-completion, StableHomotopyKTheory Layer 7) and F(R; ℚ_p) := F(R; ℤ_p)[1/p] = F(R)^∧_p ⊗ ℚ. This is not F(R) ⊗ ℚ_p and not (F(R) ⊗ ℚ)^∧_p (the latter is 0). A map f is an isogeny if there are g and N > 0 with gf = N·id and fg = N·id; a map of bounded-below objects is a quasi-isogeny if each τ_{≤n}f is an isogeny (N may depend on n); quasi-isogenies become equivalences after −⊗ℚ, hence on (−; ℚ_p) of bounded-below p-complete objects degreewise.

Throughout this statement, Spectra; bounded below for quasi-isogenies (left-complete t-structure).

([AMMN](#ammn), Introduction, p. 3 (paragraph before Theorem A); [AMMN](#ammn), Definition 2.18, §2.3, p. 12.)

The construction proceeds as follows. Define via p-completion and rationalisation (StableHomotopyKTheory §§7.14–7.18, StableHomotopyKTheory §7.21). Define isogeny/quasi-isogeny (AMMN Definition 2.18) and record that quasi-isogenies are rational equivalences.

Provide the following operations and identities.

- `pAdicCoeff`: F(R; ℤ_p) := F(R)^∧_p.
- `rationalPAdicCoeff`: F(R; ℚ_p) := F(R)^∧_p[1/p].
- `Isogeny`: f with g, N such that gf = N and fg = N.
- `QuasiIsogeny`: Each τ_{≤n}f is an isogeny; quasi-isogenies are rational equivalences.
- `rationalPAdicCoeff.exact`: F ↦ F(−; ℚ_p) is exact.

**Checks.**

- `rationalPAdicCoeff.HZ`: π_0 HZ(−; ℚ_p) = ℚ_p.
- `rationalPAdicCoeff.HQ`: HQ(−; ℚ_p) = 0.
- `rationalPAdicCoeff.not_rationalise_first`: (HZ ⊗ ℚ)^∧_p = 0 ≠ HQ_p = HZ(−; ℚ_p): the order of completion and rationalisation matters.

Also establish HZ(−; ℚ_p) = HQ_p; HQ(−; ℚ_p) = 0. For F = HH(−/ℤ) and R = 𝔽_p: HH(𝔽_p; ℚ_p) = 0 although HH(𝔽_p) ≠ 0.

*Needs:* StableHomotopyKTheory §§7.14–7.18; StableHomotopyKTheory §7.21.

**THH(𝔽_p) versus ℤ with trivial cyclotomic structure.** There is a cofibre sequence of cyclotomic spectra ℤ_{hC_p} → ℤ^{triv} → THH(𝔽_p) (from Bökstedt's theorem THH(𝔽_p) ≃ τ_{≥0}(ℤ^{tC_p})); consequently, for every bounded-below cyclotomic X, X ⊗ ℤ^{triv} → X ⊗ THH(𝔽_p) is a p-adic TP-equivalence, and the square TC(X ⊗ ℤ^{triv}; ℤ_p) → TC(X ⊗ THH(𝔽_p); ℤ_p) over the corresponding TC⁻ terms is cartesian with fibre (Σ(X ⊗ ℤ_{hC_p})_{hT})^∧_p. For X = THH(R), THH(R) ⊗ THH(𝔽_p) ≃ THH(R ⊗_S 𝔽_p).

Throughout this statement, X bounded below cyclotomic; p fixed.

([AMMN](#ammn), Proposition 2.5, p. 8.)

The construction proceeds as follows. Bökstedt periodicity in the form THH(𝔽_p) ≃ τ_{≥0}ℤ^{tC_p} (NS18 §IV.4; AMMN Construction 2.6). ℤ_{hC_p} is a ℤ^{hC_p}-module and (ℤ^{hC_p})^{tT} vanishes p-adically by the Tate fixpoint lemma (§2.4 (The Tate fixpoint lemma)), giving the TP-equivalence (AMMN Lemma 2.7). Cyclotomic X with TP(X; ℤ_p) = 0 has TC = TC⁻ (AMMN Proposition 2.5); apply to the fibre (AMMN Proposition 2.8, Corollary 2.9).

Also establish For X = S: TC(ℤ^{triv}; ℤ_p) → TC(THH(𝔽_p); ℤ_p) = TC(𝔽_p; ℤ_p) has fibre (Σℤ_{hC_p,hT})^∧_p.

*Needs:* §2.4 (The Tate fixpoint lemma); §2.10 (The Nikolaus–Scholze formula for TC); §2.9 (THH is symmetric monoidal; THH of E_∞-rings); §2.10 (TC is right adjoint to the trivial cyclotomic structure; Frobenius on connective covers); §2.10 (Negative topological cyclic and periodic topological cyclic homology); §2.16 (The Bökstedt construction and classical THH).

### 9.2 Quasi-isogenies and the change of reduction

**From R ⊗_S 𝔽_p to R/p: a quasi-isogeny.** If f : A → A′ is a map of connective E_1-rings that is a quasi-isogeny of spectra and π_0-surjective with nilpotent kernel, then THH(f) is a quasi-isogeny of cyclotomic spectra and TC(f; ℤ_p) is a quasi-isogeny (AMMN Theorem 3.4 = Theorem C). Applied to the Postnikov truncation R ⊗_S 𝔽_p → π_0 = R/p (a quasi-isogeny of ring spectra, with (2p−2)-connective fibre when R is p-torsion-free): TC(R ⊗_S 𝔽_p; ℤ_p) → TC(R/p; ℤ_p) is a quasi-isogeny, hence TC(R ⊗_S 𝔽_p; ℚ_p) ≃ TC(R/p; ℚ_p).

Throughout this statement, A, A′ connective E_1-rings; for the application, R any associative ring.

([AMMN](#ammn), Definition 2.18, §2.3, p. 12; [AMMN](#ammn), §3.1–3.3, Propositions 3.1–3.3, p. 15–16; Theorem 3.4 and Propositions 3.5–3.7 with proof, pp. 16–17; application before Corollary 3.9, p. 18.)

The construction proceeds as follows. AMMN Definition 2.18 uses degreewise isogeny bounds. The spectral reduction R⊗_S𝔽_p→R/p has such bounds, with the stated improved connectivity when R is p-torsion-free. For the general theorem, AMMN Propositions 3.1–3.3 detect cyclotomic quasi-isogenies through TR. A null Frobenius gives a product of finite homotopy-orbit terms; a positive graded filtration with increasing connectivity reduces to those null-Frobenius pieces. Apply this to graded square-zero algebras (Proposition 3.5), then resolve a nonsplit square-zero extension by its Čech nerve (3.6). Truncated augmentation ideals are built by finitely many such extensions (3.7); pass up their Postnikov towers and use the Čech nerve of A→A′ to obtain Theorem 3.4. Taking TC preserves cyclotomic quasi-isogenies in this bounded-below setting, giving the application on p-completed TC and equivalence after inverting p (§3.3, p. 18). Use the cyclotomic t-structure, TR detection and convergent graded tower constructions of Layer 3; ordinary spectral Postnikov sections alone do not give these comparisons.

Also establish Rationally the spectral and ordinary reductions agree; integrally they do not (TC(𝔽_p ⊗_S 𝔽_p) ≠ TC(𝔽_p)).

*Needs:* §9.1 (ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p); §4.17 (The Dundas–Goodwillie–McCarthy theorem); §2.7 (Topological Hochschild homology of an E_1-ring); GeneralizedCohomology G3.8; §2.14 (TR and genuine TC); §4.14 (Connective bimodules and square-zero extensions); §2.15 (Genuine and naive cyclotomic spectra agree on bounded below objects); §3.5 (TR detects cyclotomic quasi-isogenies); §3.6 (Graded cyclotomic torsion and connective convergence).

### 9.3 The comparison map and spectral reduction

**The comparison map β : TC(R/p; ℚ_p) → HP(R; ℚ_p).** For an associative ring R, the right vertical map of the Beilinson square is β : TC(R ⊗_S 𝔽_p; ℤ_p) → HP(R; ℤ_p) (and, after the quasi-isogeny of §9.2 (From R ⊗_S 𝔽_p to R/p: a quasi-isogeny), TC(R/p; ℚ_p) → HP(R; ℚ_p)), built from ℤ^{triv} → THH(𝔽_p): TC(R⊗_S𝔽_p) = TC(THH(R) ⊗ THH(𝔽_p)) → TP(THH(R) ⊗ THH(𝔽_p)) ≃_{ℤ_p} TP(THH(R) ⊗ ℤ^{triv}) = TP(R ⊗ ℤ) → HP(R; ℤ_p) (inverse of the integral p-adic TP-equivalence of §9.1 (THH(𝔽_p) versus ℤ with trivial cyclotomic structure)). Composed with the cyclotomic trace it is AMMN's crystalline trace tr_crys = β ∘ tr : K(R/p; ℚ_p) → HP(R; ℚ_p) (AMMN Definition 2.14 prints tr ∘ β; the composite is β ∘ tr).

Throughout this statement, R associative ring; ℚ_p-coefficients as in §9.1 (ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p).

([AMMN](#ammn), Theorem 2.12, §2.2, p. 10, square (15); [AMMN](#ammn), Theorem A, Introduction, p. 3, eqs. (1)-(2).)

The construction proceeds as follows. Use the TP-equivalence X ⊗ ℤ^{triv} ≃_p X ⊗ THH(𝔽_p) (§9.1 (THH(𝔽_p) versus ℤ with trivial cyclotomic structure)). Compose TC → TP with its inverse and with linearisation TP(R ⊗ ℤ) → HP(R/ℤ; ℤ_p) (THH(R) ⊗_S ℤ → HH(R) is a rational equivalence, §2.8 (THH relative to THH(ℤ) is Hochschild homology)). Define tr_crys := β ∘ tr.

Provide the following operations and identities.

- `beilinsonBeta`: β : TC(R ⊗_S 𝔽_p; ℤ_p) → HP(R; ℤ_p) and its ℚ_p-version on TC(R/p; ℚ_p).
- `crystallineTrace`: tr_crys = β ∘ tr : K(R/p; ℚ_p) → HP(R; ℚ_p).
- `beilinsonBeta.natural`: Natural in ring maps R → R′.
- `beilinsonBeta.commutes`: β ∘ (TC(R) → TC(R ⊗_S 𝔽_p)) = can ∘ (TC(R) → HC⁻(R)) on ℤ_p-coefficients (the square of §9.3 (The Beilinson square with the spectral reduction (AMMN Theorem 2.12)) commutes).

**Checks.**

- `beilinsonBeta.zero`: For R = 0 both sides vanish.
- `beilinsonBeta.Zp_pi0`: For R = ℤ_p, π_0β : π_0TC(𝔽_p; ℚ_p) = ℚ_p → HP_0(ℤ_p; ℚ_p) = ℚ_p is an isomorphism.
- `beilinsonBeta.Zp_notEquivalence`: For R=Z_p, π_{−2}TC(F_p;Q_p)=0 whereas π_{−2}HP(Z_p;Q_p)=Q_p. The latter uses p-completed HP before inverting p, as stipulated above. Hence β is not an equivalence of the entire unfiltered spectra, despite its degree-zero isomorphism.
- `crystallineTrace.order`: tr ∘ β is not defined (β lands in HP, tr starts in K): the composite is β ∘ tr, correcting AMMN Definition 2.14's printed order.

Also establish For R=ℤ_p, the ordinary-reduction comparison uses ℚ_p coefficients: π_0β is an isomorphism ℚ_p → ℚ_p. For R with R/p perfect, β recovers the crystalline comparison A_crys(R/p) → (LΩ_R)[1/p]-type identification (PrismaticCohomologyPartIII §7.0 (Prismatic Beilinson square)).

*Needs:* §9.1 (THH(𝔽_p) versus ℤ with trivial cyclotomic structure); §9.1 (ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p); §2.8 (THH relative to THH(ℤ) is Hochschild homology); §2.10 (Negative topological cyclic and periodic topological cyclic homology); §4.11 (The cyclotomic trace); §9.2 (From R ⊗_S 𝔽_p to R/p: a quasi-isogeny).

**The Beilinson square with the spectral reduction (AMMN Theorem 2.12).** For an associative ring R (or a connective ℤ-linear E_1-algebra), there is a natural commutative square with top row TC(R; ℤ_p) → TC(R ⊗_S 𝔽_p) and bottom row HC⁻(R; ℤ_p) → HP(R; ℤ_p), left vertical map the canonical one and right vertical map β, which is cartesian after inverting p. Here R ⊗_S 𝔽_p is the E_1-ring spectrum (with π_0 = R/p and higher homotopy Tor^S-terms), not the ring R/p. τ_{≤2i} of the total cofibre is killed by p^i for i ≤ p − 1.

Throughout this statement, R associative (no commutativity, henselian or completeness assumption).

([AMMN](#ammn), Theorem 2.12, §2.2, p. 10, square (15); [AMMN](#ammn), Proposition 2.5, p. 8.)

The construction proceeds as follows. Use AMMN Corollary 2.10 for the upper square in the proof of Theorem 2.12, including the TP equivalence of §9.1 (THH(𝔽_p) versus ℤ with trivial cyclotomic structure). The natural S¹-equivariant map THH(R;ℤ_p)⊗_Sℤ→HH(R;ℤ_p) is a rational equivalence. On the horizontal fibres of the lower square it induces Σ(THH(R;ℤ_p)⊗_Sℤ)_{hS¹}→ΣHH(R;ℤ_p)_{hS¹}, which is a rational equivalence because homotopy orbits preserve it. Paste the two rationally cartesian squares. This does not require the individual vertical maps on TC⁻ and TP to be rational equivalences. Use Remark 2.13 for the effective bound.

Also establish For R = 𝔽_p-algebra, R ⊗_S 𝔽_p ≠ R/p = R: π_*(𝔽_p ⊗_S 𝔽_p) is the dual Steenrod algebra.

*Needs:* §9.1 (THH(𝔽_p) versus ℤ with trivial cyclotomic structure); §9.3 (The comparison map β : TC(R/p; ℚ_p) → HP(R; ℚ_p)); §2.8 (THH relative to THH(ℤ) is Hochschild homology); §2.8 (Mixed complexes model complexes with circle action); §1.4 (Cyclic, negative cyclic and periodic cyclic homology).

### 9.4 The ordinary-reduction square and its fiber

**The Beilinson fibre square (AMMN Corollary 3.9).** For every associative unital ring R there is a natural cartesian square of spectra with top row TC(R; ℚ_p) → TC(R/p; ℚ_p), bottom row HC⁻(R; ℚ_p) → HP(R; ℚ_p), left vertical map the canonical map TC → TC⁻ → HC⁻ and right vertical map β (§9.3 (The comparison map β : TC(R/p; ℚ_p) → HP(R; ℚ_p))). Here (−; ℚ_p) is p-completion followed by inverting p (§9.1 (ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p)) and HC⁻, HP are those of derived HH over ℤ. No henselian, commutativity or completeness hypothesis enters; the K-theoretic square K(R; ℚ_p) → K(R/p; ℚ_p) over HC⁻ → HP is cartesian when R is commutative and henselian along (p) (AMMN Theorem A), which is the next target. PrismaticCohomologyPartIII §7.0 states the TC square for commutative rings; this target is the statement for every associative unital ring.

Throughout this statement, R associative unital; p a prime.

([AMMN](#ammn), §3, Corollary 3.9, p. 18, display (19).)

The construction proceeds as follows. Invert p in §9.3 (The Beilinson square with the spectral reduction (AMMN Theorem 2.12)). Replace TC(R ⊗_S 𝔽_p; ℚ_p) by TC(R/p; ℚ_p) using §9.2 (From R ⊗_S 𝔽_p to R/p: a quasi-isogeny). Check that the replaced right vertical map is β and the square still commutes (naturality of β).

Also establish For R = ℤ_p: TC(ℤ_p; ℚ_p) → TC(𝔽_p; ℚ_p) over HC⁻(ℤ_p; ℚ_p) → HP(ℤ_p; ℚ_p) is cartesian; on π_{−1}: TC_{−1}(𝔽_p; ℚ_p) = ℚ_p and HP_{−1}(ℤ_p; ℚ_p) = 0. Henselian hypotheses are absent here: the square holds for R = ℤ (not henselian along p).

*Needs:* §9.3 (The Beilinson square with the spectral reduction (AMMN Theorem 2.12)); §9.2 (From R ⊗_S 𝔽_p to R/p: a quasi-isogeny); §9.3 (The comparison map β : TC(R/p; ℚ_p) → HP(R; ℚ_p)); §9.1 (ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p).

**The K-theoretic Beilinson square (AMMN Theorem A).** Let R be a commutative ring henselian along (p). The square with top row K(R;ℚ_p)→K(R/p;ℚ_p), bottom row HC⁻(R;ℚ_p)→HP(R;ℚ_p), left vertical map the Goodwillie–Jones trace K→TC→HC⁻ and right vertical map tr_crys=β∘tr of §9.3 (The comparison map β : TC(R/p; ℚ_p) → HP(R; ℚ_p)) is cartesian. Equivalently K(R,(p);ℚ_p)≃ΣHC(R;ℚ_p). K is connective. Without the henselian hypothesis only the TC square of the preceding target is asserted.

Throughout this statement, R commutative and henselian along (p); p a prime; coefficients as in §9.1 (ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p).

([AMMN](#ammn), Introduction, Theorem A, p. 3, and the paragraph following it; [CMM](#cmm), §1, Theorem A, p. 3.)

The construction proceeds as follows. The pair (R,(p)) is henselian, so §4.17 (Henselian rigidity of the trace with finite coefficients) gives K^inv(R)/p^n≃K^inv(R/p)/p^n for every n≥1. Hence the relative terms K(R,(p)) and TC(R,(p)) agree after p-completion, compatibly with the trace. Invert p and paste with §9.4 (The Beilinson fibre square (AMMN Corollary 3.9)); the right vertical maps agree because tr_crys=β∘tr.

Also establish For R=ℤ_p, π₁K(ℤ_p,(p);ℚ_p)=(1+pℤ_p)⊗ℚ≅ℚ_p=HC₀(ℤ_p;ℚ_p). For R=ℤ, which is not henselian along (p), π₁K(ℤ,(p);ℚ_p)=0, because K₂(𝔽_p)=0 and K₁(ℤ)=ℤ/2 is killed by p-completion followed by inverting p, whereas π₁ΣHC(ℤ;ℚ_p)=ℚ_p; the henselian hypothesis cannot be dropped, although the TC square holds for ℤ. If R is moreover p-torsion-free, then π_iK(R,(p);ℤ_p)≅HC_{i−1}(R,(p);ℤ_p) integrally for i≤2p−5 (AMMN Corollary B, p. 3, from the integral form of the preceding fibre sequence).

*Needs:* §9.4 (The Beilinson fibre square (AMMN Corollary 3.9)); §4.17 (Henselian rigidity of the trace with finite coefficients); §4.11 (The cyclotomic trace); §9.3 (The comparison map β : TC(R/p; ℚ_p) → HP(R; ℚ_p)); §9.1 (ℤ_p- and ℚ_p-coefficients: p-complete first, then invert p).

**The Beilinson fibre sequence and its shift dictionary.** For every associative ring R: fib(TC(R; ℚ_p) → TC(R/p; ℚ_p)) ≃ ΣHC(R; ℚ_p), and cofib(TC(R; ℚ_p) → TC(R/p; ℚ_p)) ≃ Σ²HC(R; ℚ_p), with HC = HH_{hT} (direct-sum convention of §1.4 (Cyclic, negative cyclic and periodic cyclic homology)) and Σ the homological shift; integrally, TC(R, (p); ℤ_p) := fib(TC(R; ℤ_p) → TC(R/p; ℤ_p)), ΣHC(R, (p); ℤ_p) and ΣHC(R; ℤ_p) are naturally quasi-isogenous, and for p-torsion-free R the first two agree after τ_{≤2p−5}, and after τ_{≤2p−4} when moreover π_{−1}TC(R;ℤ_p)=0 (AMMN Theorem 2.20(a),(b), p. 12). Dictionary: a source writing the Beilinson sequence as K(R, (p); ℚ_p) → HC(R; ℚ_p)[1]-type with cohomological shifts must be converted by [1] = Σ (homological) before use.

Throughout this statement, R associative; HC derived over ℤ and p-completed.

([AMMN](#ammn), Theorem 2.20, §2.3, p. 12.)

The construction proceeds as follows. Fibres of the horizontal maps in a cartesian square agree: fib(TC(R) → TC(R/p)) ≃ fib(HC⁻ → HP) (§9.4 (The Beilinson fibre square (AMMN Corollary 3.9))). fib(HC⁻ → HP) = ΣHC by the norm sequence ΣHC → HC⁻ → HP (§2.8 (The norm sequence for cyclic homology)). Integral version: AMMN Theorem 2.20 with Lemma 2.23.

Also establish For R = ℤ_p: π_1 fib = HC_0(ℤ_p; ℚ_p) = ℚ_p, matching K_1(ℤ_p, (p); ℚ_p) = (1 + pℤ_p) ⊗ ℚ ≅ ℚ_p via log.

*Needs:* §9.4 (The Beilinson fibre square (AMMN Corollary 3.9)); §2.8 (The norm sequence for cyclic homology); §1.4 (Cyclic, negative cyclic and periodic cyclic homology).

### 9.5 The integral comparison on graded pieces

**Integral refinement of the graded Beilinson square.** Let R be p-complete, p-torsion-free and quasisyntomic, and i≥0. PrismaticCohomologyPartIII §7.0 (Prismatic Beilinson square) supplies the rational cartesian square relating ℚ_p(i)(R)→ℚ_p(i)(R/p) to the Hodge-filtration inclusion of the p-completed uncompleted derived de Rham complex LΩ_R, with its map χ_i. Integrally: (a) cofib(ℤ_p(i)(R)→ℤ_p(i)(R/p)) and LΩ_R/LΩ_R^{≥i} are naturally isogenous, with denominators depending only on i; (b) for i≤p−2 there is a natural equivalence fib(ℤ_p(i)(R)→ℤ_p(i)(R/p))≃fib(LΩ_R/LΩ_R^{≥i}→LΩ_{R/p}/LΩ_{R/p}^{≥i})[−1] (cohomological shift).

Throughout this statement, R∈qSyn_{ℤ_p} as in AMMN Definition 5.5: p-complete, p-torsion-free and quasisyntomic; ℤ_p(i) is the syntomic complex of PrismaticCohomologyPartIII §§6.8–6.9; i≥0, and i≤p−2 in (b).

([AMMN](#ammn), §6.3, Theorem 6.17 with display (56), p. 44, and its proof, p. 45; §2.3, Theorem 2.20, p. 12.)

The construction proceeds as follows. For (a), take graded pieces of the integral quasi-isogeny between TC(R,(p);ℤ_p) and ΣHC(R,(p);ℤ_p) of §9.4 (The Beilinson fibre sequence and its shift dictionary), using the graded pieces of the motivic filtration from PrismaticCohomologyPartIII §7.0 and the Hodge filtration of HC by LΩ_R/LΩ_R^{≥n}; the uniform denominators of §9.2 (From R ⊗_S 𝔽_p to R/p: a quasi-isogeny) give the isogeny. For (b), unfold to w-strictly local quasiregular semiperfectoid R, where π_{−1}TC(R;ℤ_p)=0 by §8.5 (The TC-internal negative-degree calculation); the 2p−4 range of the fibre sequence then identifies τ_{[2i−1,2i]} of TC(R,(p);ℤ_p) and ΣHC(R,(p);ℤ_p) for i≤p−2, and TC(R/p;ℤ_p), HC(R;ℤ_p) and HC(R/p;ℤ_p) are even on this basis (§8.7 (The even TC sheaf in characteristic p) and PrismaticCohomologyPartIII §7.0).

Also establish At i=0 the de Rham quotients vanish and ℤ_p(0)(R)≃ℤ_p(0)(R/p) integrally for every p. For R=ℤ_p, i=1 and p≥3, ℤ_p(1)(𝔽_p)=0 and LΩ_{𝔽_p}/LΩ_{𝔽_p}^{≥1}=𝔽_p, so (b) gives ℤ_p(1)(ℤ_p)≃(pℤ_p)[−1]; its H¹ is pℤ_p≅1+pℤ_p by the logarithm, the p-completed units of ℤ_p. At p=2 the range i≤p−2 contains only i=0.

*Needs:* PrismaticCohomologyPartIII §7.0 (Prismatic Beilinson square); PrismaticCohomologyPartIII §§6.8–6.9 and 6.31 — syntomic complex; §9.4 (The Beilinson fibre sequence and its shift dictionary); §9.2 (From R ⊗_S 𝔽_p to R/p: a quasi-isogeny); §8.5 (The TC-internal negative-degree calculation); §8.7 (The even TC sheaf in characteristic p); DerivedDeRhamCohomology Layer 2 — p completed derham; DerivedDeRhamCohomology Layer 5 — quasisyntomic site.

### Examples

Applied to HZ, completion followed by inversion gives H Qₚ. Applied to the already rational spectrum H Qₚ, derived p-completion is zero. Thus reversing the order would destroy the intended coefficient theory. Likewise Fₚ⊗^L_S Fₚ has the nontrivial positive-degree dual-Steenrod homotopy and cannot be replaced by the ordinary ring Fₚ or by the cofiber of multiplication by p without a comparison.

For a discrete cyclic complex concentrated in degree zero with HC₀=k, the fiber in the ordinary Beilinson square is ΣHC and has its first class in π₁=k. The cofiber is Σ²HC and has the class in π₂=k. These distinguish fiber from cofiber and pin the shift. In the imported graded square, weight n=0 has zero de Rham quotient, while weight n=1 on the constant smooth coefficient Zₚ has (LΩ/F≥¹)⊗Qₚ≃Qₚ; the fiber is Qₚ[−1] in cohomological notation, with H¹=Qₚ, matching π₁ of the K-theoretic square for ℤ_p. For ℤ the TC square holds but the K-theoretic one fails in π₁, since ℤ is not henselian along (p).

### Dependencies

Earlier layers 1, 2, 3, 4. Use the named Mathlib and Tau Ceti inputs under the supplier contracts; external contracts: DerivedDeRhamCohomology Layer 0; DerivedDeRhamCohomology Layer 2; EnhancedDerivedSheaves E3; EnhancedDerivedSheaves E5:animation; PrismaticCohomology Layer 2; PrismaticCohomologyPartIII §§6.8–6.9, 6.31 and 7.0; AInfCohomology §AI.7.2; GeneralizedCohomology G2–G3 and StableHomotopyKTheory Layer 5; StableHomotopyKTheory Layer 7. The individual statements above identify the required comparison or functoriality, not merely a shared object name.

## Downstream consumers

KTheoryFiniteLocalFields uses graded and representation-graded TR, the cyclotomic trace, Bökstedt periodicity, the Witt description of π₀TR and henselian rigidity, including Gabber's rigidity; its full truncated-polynomial computation is its own. GeneralAlgebraicKTheoryPartII uses the K-theory of small stable infinity categories, the Tate constructions, the cyclotomic trace and localizing motives. ChromaticHomotopyTheory uses the parametrized Tate constructions of §2.5 and the K(1)-local sphere of §6.8.

HabiroCohomologyFoundationsPartII uses the spherical inputs of §6.1, the q-Hodge comparisons of §§6.9–6.10, including the framed comparison and the framed trace pair of §6.10 for its agreement with the canonical algebraic filtration, the cyclonic coefficient and Habiro–Hodge comparisons of §§6.11–6.13, the number-field realisation of §6.14, the finite-coefficient calculation of §7.6 and the interface of §8.8, with their stated lift, coherence and prime-two restrictions. The supplier layers HabiroCohomologyFoundations 1–5 and HabiroRings HR.1, HR.2 and HR.5 precede these trace constructions and use none of their statements. Applications to arithmetic K-theory use the nilpotent and henselian trace theorems, continuity modulo p, truncating excision, continuous invariants and the K-theoretic Beilinson square.

## References

Page references use the editions below. The published and arXiv BMS paginations are deliberately distinguished; Nikolaus–Scholze references use Acta pages. Mathematical statements and construction routes above are paraphrased.

<a id="ammn"></a>
**[AMMN]** Benjamin Antieau, Akhil Mathew, Matthew Morrow, Thomas Nikolaus, *[On the Beilinson fiber square](https://arxiv.org/pdf/2003.12541v2)*. arXiv:2003.12541v2 (29 Sep 2021).

<a id="an"></a>
**[AN]** Benjamin Antieau and Thomas Nikolaus, *[Cartier modules and cyclotomic spectra](https://arxiv.org/pdf/1809.01714v2)*. arXiv:1809.01714v2, 12 January 2020; final journal version JAMS 34 (2021), 1–78. Locators here use the arXiv v2 printed pages.

<a id="ar"></a>
**[AR]** Benjamin Antieau and Noah Riggenbach, *[Cyclotomic synthetic spectra](https://arxiv.org/pdf/2411.19929v1)*. arXiv:2411.19929v1 (29 November 2024).

<a id="bgt"></a>
**[BGT]** Andrew J. Blumberg, David Gepner, Gonçalo Tabuada, *[A universal characterization of higher algebraic K-theory](https://arxiv.org/abs/1001.2282v4)*. arXiv:1001.2282v4 (5 Feb 2013); published Geom. Topol. 17 (2013) 733–838.

<a id="bgt-mult"></a>
**[BGT-mult]** Andrew J. Blumberg, David Gepner, Gonçalo Tabuada, *[Uniqueness of the multiplicative cyclotomic trace](https://arxiv.org/abs/1103.3923v3)*. arXiv:1103.3923v3 (1 Jul 2015).

<a id="bm"></a>
**[BM]** Bhargav Bhatt and Akhil Mathew, *[Syntomic complexes and p-adic étale Tate twists](https://arxiv.org/pdf/2202.04818v2)*. arXiv:2202.04818v2, 1 December 2022; Forum Math. Pi 11 (2023), e1.

<a id="bms"></a>
**[BMS]** Bhargav Bhatt, Matthew Morrow and Peter Scholze, *[Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf)*. Published version, Publ. Math. IHÉS 129 (2019), 199–310, DOI 10.1007/s10240-019-00106-9.

<a id="bms-arxiv"></a>
**[BMS-arXiv]** Bhargav Bhatt, Matthew Morrow, Peter Scholze, *[Topological Hochschild homology and integral p-adic Hodge theory](https://arxiv.org/pdf/1802.03261v2)*. arXiv:1802.03261v2 (9 Apr 2019); published Publ. Math. IHÉS 129 (2019) 199–310; arXiv pagination used.

<a id="bs"></a>
**[BS]** Bhargav Bhatt and Peter Scholze, *[Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4)*. arXiv:1905.08229v4, 12 January 2022.

<a id="ba"></a>
**[Ba]** Anne Bauval, *[Théorème de Eilenberg–Zilber en homologie cyclique entière](https://arxiv.org/pdf/1611.08437v1)*. arXiv:1611.08437v1 (25 November 2016; 1998 manuscript).

<a id="blm"></a>
**[BlM]** Andrew J. Blumberg, Michael A. Mandell, *[Localization theorems in topological Hochschild homology and topological cyclic homology](https://arxiv.org/abs/0802.3938v4)*. arXiv:0802.3938v4 (24 May 2012); published Geom. Topol. 16 (2012) 1053–1120.

<a id="cmm"></a>
**[CMM]** Dustin Clausen, Akhil Mathew, Matthew Morrow, *[K-theory and topological cyclic homology of henselian pairs](https://arxiv.org/abs/1803.10897v2)*. arXiv:1803.10897v2 (20 Jul 2020); published J. Amer. Math. Soc. 34 (2021) 411–473.

<a id="co"></a>
**[Co]** Guillermo Cortiñas, *[The obstruction to excision in K-theory and in cyclic homology](https://arxiv.org/abs/math/0111096v5)*. arXiv:math/0111096v5 (3 Oct 2005); published Invent. Math. 164 (2006) 143–173.

<a id="d-thesis"></a>
**[D-thesis]** Sanath Devalapurkar, *[Spherochromatism in representation theory and arithmetic geometry (Ph.D. thesis, Harvard University, April 2025)](https://sanathdevalapurkar.github.io/files/thesis.pdf)*. PhD thesis, Harvard University (PDF from the author's page, version of 4 Sep 2026); printed page numbers.

<a id="dr"></a>
**[DR]** Sanath K. Devalapurkar, Arpon Raksit, *[THH(Z) and the image of J](https://arxiv.org/abs/2505.02218)*. arXiv:2505.02218v2 (20 Jul 2026).

<a id="du"></a>
**[Du]** Bjørn Ian Dundas, *[Relative K-theory and topological cyclic homology](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6553-11511_2006_Article_BF02392744.pdf)*. Acta Math. 179 (1997) 223–242 (published scan).

<a id="e-cont"></a>
**[E-cont]** Alexander I. Efimov, *[K-theory and localizing invariants of large categories](https://arxiv.org/pdf/2405.12169v4)*. arXiv:2405.12169v4, 5 October 2026.

<a id="e-mot"></a>
**[E-mot]** Alexander I. Efimov, *[Rigidity of the category of localizing motives](https://arxiv.org/pdf/2510.17010v1)*. arXiv:2510.17010v1, 19 October 2025.

<a id="ec2"></a>
**[EC2]** Jacob Lurie, *[Elliptic Cohomology II: Orientations](https://www.math.ias.edu/~lurie/papers/Elliptic-II.pdf)*. Version of 26 April 2018 (author's page).

<a id="g"></a>
**[G]** Victor Ginzburg, *[Lectures on noncommutative geometry](https://arxiv.org/pdf/math/0506603)*. arXiv:math/0506603v1 (29 Jun 2005).

<a id="gs"></a>
**[GS]** David Gepner, Victor Snaith, *[On the motivic spectra representing algebraic cobordism and algebraic K-theory](https://arxiv.org/pdf/0712.2817)*. arXiv:0712.2817v3 (27 May 2010); published Doc. Math. 14 (2009) 359–396.

<a id="h"></a>
**[H]** Marc Hoyois, *[The homotopy fixed points of the circle action on Hochschild homology](https://arxiv.org/pdf/1506.07123)*. arXiv:1506.07123v2 (21 Apr 2018).

<a id="ha"></a>
**[HA]** Jacob Lurie, *[Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf)*. Version of 18 September 2017 (author's page).

<a id="hkr"></a>
**[HKR]** G. Hochschild, Bertram Kostant, Alex Rosenberg, *[Differential forms on regular affine algebras](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HKR62.pdf)*. Trans. Amer. Math. Soc. 102 (1962) 383–408 (published scan).

<a id="h05"></a>
**[H05]** Lars Hesselholt, *[K-theory of truncated polynomial algebras](https://web.math.ku.dk/~larsh/papers/s01/handbook.pdf)*. Handbook of K-Theory, vol. 1, Springer (2005), 71–110; author PDF with the printed pages.

<a id="hm97"></a>
**[HM97]** Lars Hesselholt and Ib Madsen, *[On the K-theory of finite algebras over Witt vectors of perfect fields](https://www.math.nagoya-u.ac.jp/~larsh/papers/004/paper.pdf)*. Topology 36 (1997), 29–101; author PDF, printed pages.

<a id="hn"></a>
**[HN]** Lars Hesselholt, Thomas Nikolaus, *[Topological cyclic homology (chapter in Handbook of Homotopy Theory)](https://arxiv.org/abs/1905.08984v1)*. arXiv:1905.08984v1 (22 May 2019); Handbook of Homotopy Theory (2020).

<a id="hrw"></a>
**[HRW]** Jeremy Hahn, Arpon Raksit, Dylan Wilson, *[A motivic filtration on the topological cyclic homology of commutative ring spectra](https://arxiv.org/pdf/2206.11208v3)*. arXiv:2206.11208v3 (19 Oct 2025).

<a id="hatcher"></a>
**[Ha]** Allen Hatcher, *[Vector Bundles and K-Theory](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf)*. Version 2.2 (November 2017); printed page numbers.

<a id="he"></a>
**[He]** Lars Hesselholt, *[On the p-typical curves in Quillen’s K-theory](https://math.mit.edu/~larsh/papers/005/acta.pdf)*. Author’s manuscript, 23 February 1996; published Acta Math. 177 (1996), 1–53.

<a id="kb"></a>
**[KB]** Charles A. Weibel, *[The K-book: an introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)*. Graduate Studies in Mathematics 145, AMS, 2013; author PDF, printed pages (PDF page minus 8).

<a id="ke"></a>
**[Ke]** Bernhard Keller, *[Invariance and localization for cyclic homology of DG algebras](https://webusers.imj-prg.fr/~bernhard.keller/publ/ilc.pdf)*. Author manuscript dated 13 May 1996.

<a id="kn"></a>
**[KN]** Achim Krause and Thomas Nikolaus, *[Bökstedt periodicity and quotients of DVRs](https://arxiv.org/pdf/1907.03477v1)*. arXiv:1907.03477v1 (8 July 2019); printed pages.

<a id="l20"></a>
**[L20]** Jacob Lurie, *[Bousfield localization (Lecture 20)](https://www.math.ias.edu/~lurie/252xnotes/Lecture20.pdf)*. Chromatic homotopy theory (Math 252x) lecture notes, 27 April 2010.

<a id="lmmt"></a>
**[LMMT]** Markus Land, Akhil Mathew, Lennart Meier, Georg Tamme, *[Purity in chromatically localized algebraic K-theory](https://arxiv.org/abs/2001.10425v5)*. arXiv:2001.10425v5 (18 Dec 2023); published J. Amer. Math. Soc. (2024).

<a id="lq"></a>
**[LQ]** Jean-Louis Loday, Daniel Quillen, *[Cyclic homology and the Lie algebra homology of matrices](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0059/LOG_0035.pdf)*. Comment. Math. Helv. 59 (1984) 565–591 (published scan).

<a id="lt"></a>
**[LT]** Markus Land, Georg Tamme, *[On the K-theory of pullbacks](https://arxiv.org/abs/1808.05559v3)*. arXiv:1808.05559v3 (8 Nov 2019); published Ann. of Math. 190 (2019) 877–930.

<a id="mw"></a>
**[MW]** Samuel Meyer and Ferdinand Wagner, *[q-Hodge complexes and refined TC⁻](https://arxiv.org/pdf/2410.23115v4)*. arXiv:2410.23115v4, 8 October 2025.

<a id="may"></a>
**[May]** J. P. May, *[A Concise Course in Algebraic Topology](https://www.math.uchicago.edu/~may/CONCISE/ConciseRevised.pdf)*. Revised author's PDF of the 1999 University of Chicago Press edition.

<a id="mcc"></a>
**[McC]** Randy McCarthy, *[Relative algebraic K-theory and topological cyclic homology](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6552-11511_2006_Article_BF02392743.pdf)*. Acta Math. 179 (1997) 197–222 (published scan).

<a id="ns"></a>
**[NS]** Thomas Nikolaus, Peter Scholze, *[On topological cyclic homology](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf)*. Acta Math. 221 (2018) 203–409 (published version; printed pages), compared with arXiv:1707.01799v2.

<a id="p"></a>
**[P]** Piotr Pstrągowski, *[Perfect even modules and the even filtration](https://arxiv.org/pdf/2304.04685v2)*. arXiv:2304.04685v2 (24 Oct 2024).

<a id="r-gal"></a>
**[R-Gal]** John Rognes, *[Galois extensions of structured ring spectra](https://arxiv.org/pdf/math/0502183v2)*. arXiv:math/0502183v2 (6 December 2005), §§5.5.1–5.5.2, pp. 32–33.

<a id="r"></a>
**[R]** Sam Raskin, *[On the Dundas-Goodwillie-McCarthy theorem](https://arxiv.org/abs/1807.06709v1)*. arXiv:1807.06709v1 (17 Jul 2018).

<a id="pri"></a>
**[Pri]** J. P. Pridham, *[On q-de Rham cohomology via Λ-rings](https://arxiv.org/pdf/1608.07142v4)*. arXiv:1608.07142v4, 9 January 2019.

<a id="s-ber"></a>
**[S-Ber]** Peter Scholze, *[Berkovich Motives](https://arxiv.org/pdf/2412.03382v3)*. arXiv:2412.03382v3, 22 January 2026; J. Amer. Math. Soc. 39 (2026), 697–764.

<a id="stacks"></a>
**[Stacks]** The Stacks Project Authors, *[The Stacks Project](https://stacks.math.columbia.edu/tag/07L7)*. Chapter 60 (Crystalline Cohomology), Example 60.19.1, Tag 07L7; accessed 20 October 2026.

<a id="w"></a>
**[W]** Ferdinand Wagner, *[q-de Rham cohomology and topological Hochschild homology over ku](https://arxiv.org/pdf/2510.06057v1)*. arXiv:2510.06057v1, 7 October 2025.

<a id="w-hab"></a>
**[W-Hab]** Ferdinand Wagner, *[q-Hodge complexes over the Habiro ring](https://arxiv.org/abs/2510.04782)*. arXiv:2510.04782v2 (8 Oct 2025); Corollary 3.13 numbering identical in v1.

<a id="wg"></a>
**[WG]** Charles A. Weibel, Susan C. Geller, *[Étale descent for Hochschild and cyclic homology](https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0066/LOG_0026.pdf)*. Comment. Math. Helv. 66 (1991) 368–388 (published scan).

<a id="weik"></a>
**[WeiK]** Charles A. Weibel, *[The K-book, Chapter III: K₁ and K₂ of a ring](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf)*. Author's public chapter manuscript, printed chapter pagination; Example 4.3.1, p. 31.

<a id="ram"></a>
**[Ram]** Maxime Ramzi, *[Locally rigid infinity categories](https://arxiv.org/pdf/2410.21524v2)*, arXiv:2410.21524v2 (9 February 2026), manuscript pagination.
