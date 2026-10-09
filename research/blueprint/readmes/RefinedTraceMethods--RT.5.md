# Refined localizing invariants and the BMS2 trace interfaces

This is the definitive planning document for RefinedTraceMethods RT.5 and RT.6. It accompanies the part RT.5 packet. Both stages are **planned**, with their targets traced to precise library declarations, supplier nodes, requested owner stages or recorded gaps. The packet is **complete** as a target-level planning pass. Neither stage is closed, and every declaration remains implementation-unchecked. The open proof refinements are part of the plan, not mathematical axioms.

The purpose of RT.5 is to preserve the information in a localizing invariant when its ordinary realization forgets trace-class presentations. A dualizable presentable category is an object of the coherent category of presentable stable categories; a trace-class arrow between its objects is classified by a tensor with a predual. These are different uses of duality. Continuous extensions of the concrete nonconnective K-spectrum lead to relative localizing motives. Efimov’s nuclear resolution and enriched duality criterion prove their rigidity. A monoidal invariant out of this rigid source factors into a rigidification of its target, producing the refined invariant and its ordinary realization map.

The arithmetic endpoint is Meyer–Wagner’s Theorem 3.14. For ku the answer is a nuclear ind graded algebra over Z[β][[t]], with |β|=2, |t|=−2 and q−1=βt. For KU it is a nuclear ind algebra over Z[[q−1]] with β inverted. Both retain the extension by the indicated ind-colimit of graded derived Ext¹ groups. The answer is neither ordinary rationalized p-completed THH nor an ordinary ring colimit. The completion occurs in the specified derived t- or (q−1)-complete category, and the periodic case requires its own reconstruction argument. The source’s additional analytic interpretation in its §4 is not required to prove this algebraic coefficient computation; expected refined Habiro descent is not asserted as an established theorem.

RT.6 exports actual maps and filtrations. It constructs the BMS2 even computations on quasiregular semiperfectoid covers, their quasisyntomic unfolding, the complete exhaustive motivic filtrations, and the coherent maps can and cyclotomic Frobenius. It proves the characteristic-p crystalline and smooth O_C/AΩ comparisons needed to recognize the trace object as the Nygaard completion of the independently constructed prismatical object. It also records the trace twist, Adams operations, relative THH over the sphere polynomial ring, the filtered inputs of the AMMN bridge, and the announced Bhatt–Mathew finite K-sheaf comparison with its exact outstanding proof obligation.

## Conventions and construction order

Fix a prime p when taking p-completions. Spectrum homotopy is homological: π_n corresponds to cohomology H^(−n) of an imported complex. A shift [r] therefore corresponds to suspension by r. Motivic weight i has shift [2i]. The double shearing in Meyer–Wagner carries even graded degree i to homotopical degree 2i. The ind/pro indexing, including the reversal in the dual Ext colimit, is retained as written in the coefficient theorems below.

Completion is derived unless a statement explicitly concerns an ordinary ring or a completed free module. Nygaard completion is completion of a filtration and is separate from derived p-completion, (p,ξ)-completion, and Hodge completion. C_A denotes the intrinsic Nygaard-completed trace complex constructed by unfolding π₀TC⁻. C^nc_(A/R) is its noncompleted left Kan extension relative to a chosen perfectoid base R. AΩ^nc is the animated extension of the imported geometric AΩ. On general nonsmooth inputs, these noncompleted objects are not identified with C_A before Nygaard completion.

The quasisyntomic category has p-complete rings with bounded p-power torsion and p-complete cotangent Tor-amplitude [−1,0]. QRSP denotes its quasiregular semiperfectoid basis. AMMN’s qSyn_(Z_p) is the relative category, in particular p-completely flat over Z_p; this hypothesis ensures that R/p remains in the required category. Bhatt–Mathew’s p-quasisyntomic schemes use their stated affine cotangent condition and their syntomic-to-étale map of sites. Those sites are not identified by a change of terminology.

For a perfectoid R, θ:Ainf(R)→R and θ̃=θφ⁻¹ are distinct Fontaine maps. When a generator ξ of ker θ is chosen, the perfectoid coefficient relation is uv=ξ. The canonical map sends u to ξσ and v to σ⁻¹. Frobenius is φ-semilinear, sending u to σ and v to φ(ξ)σ⁻¹. Twists are invertible filtered lines with descent cocycles; choosing a generator does not give a global canonical untwisted object. The relative DVR calculation instead has the Frobenius-twisted scalar algebra frakS^(−1).

Universe and cardinal data belong to the objects. E₁ bases retain left/right preduals and the opposite-monoidal base in the motive duality. Catdual_E has dualizable E-modules and strongly continuous E-linear maps, which are left adjoints whose right adjoints preserve colimits. Compactly generated categories form a particular model inside it; replacing all dualizable categories by that model loses the continuous extension. Motloc_(E,κ) is accessible with its specified κ-filtered colimits. The finitary monoidal motive category in the rigidity theorem is κ=ω. Its construction must include the concrete K-spectrum comparison, not a definition of K by a universal property.

The working order is:

1. Import coherent stable categories, spectra, animation, derived completion and concrete K from their owners. Construct the RT.5 continuous extension, relative motives, nuclear resolution and rigidity.
2. Import the supplied multiplicative Moore tower and RT.4 finite q-Hodge/Bott comparisons. Construct refined relative THH and TC⁻ and calculate the rational ku/KU coefficients by the localization cofiber.
3. Import generic Ainf/Lη, de Rham and prismatic objects. Construct the QRSP trace coefficients and motivic filtrations. Prove the characteristic-p and AΩ trace comparisons, then the trace-to-prismatic equivalence and its twisted divided-Frobenius graded maps.
4. Export the trace instances to the qualified Habiro interface, the independently defined PR.4 syntomic complexes and RT.3b’s AMMN theorem. AI.7, PR.7 and HQ.8 are downstream consumers.

PR.3’s current BMS2 comparison node supplies independent prismatic recognition and Nygaard-completion results; RT.6 constructs the trace comparison. Similarly PR.4 constructs the syntomic fiber independently, and RT.6 identifies the graded TC fiber with it. Generic prisms, Nygaard objects, de Rham–Witt, AΩ and almost categories are imported rather than duplicated.

## Baseline and suggested file

The baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. The reviewed AUDIT-30 entries classify both scoped layers as not built. RT.6 records Fontaine’s existing θ map and overlaps with DD.5, AI.7 and PR.3; their site, geometric and prismatic constructions are imported from those owners, while RT.6 constructs the trace instances. Searches and statement reads at these commits found exact elementary ingredients for prime factorization, two-variable polynomial quotients, Laurent monomials and ordinary chain-map compatibility; the declarations and pinned source links are listed below. They do not supply the coherent motive or cyclotomic theories.

Mathlib’s SSet.Quasicategory supplies inner-horn filling. Its ordinary DerivedCategory is a localization of ordinary complexes of an abelian category under HasDerivedCategory. Neither is credited as a presentable stable infinity-category, PrL tensor, cyclotomic spectrum or animated complete filtered category. Those types and their coherence are explicit owner requests.

The suggested file uses actual baseline types for HighPowered, the underlying quotient P(A,ξ), its can and semilinear Frobenius ring maps, and the degreewise mixed-complex comparison. It records every other declaration, API name and test as a mathematical contract. Protocol §13 requires leaving out a condition that cannot yet be stated; no unspecified proposition field substitutes for a missing coherent construction. Compilation checks the expressible signatures, not the mathematical proofs or omitted higher contracts. The homotopical grading and spectral realization of P(A,ξ) remain separate obligations.

## Sources read

The packet preserves the source-read receipts from the planning pass and independent review, accessed 8 October 2026, including versioned URLs and SHA256 fingerprints. This revision fetched matching public PDFs and rechecked MW Lemma 2.2, Theorem 2.4/Remark 2.5, Lemmas 2.16/2.18, Corollary 2.19 and Lemma 3.2; Efimov §1.2/Proposition 1.1 and §1.5; BMS2 Corollary 7.10, Theorem 9.6 and Proposition 9.10; and Wagner 4.18/4.18a, Theorem 4.27/Remark 4.28, 5.43(A2), Theorem 5.63 and Corollary 6.15.

- **mw**: Samuel Meyer and Ferdinand Wagner, [q-Hodge complexes and refined TC⁻](https://arxiv.org/pdf/2410.23115v4), arXiv:2410.23115v4, 8 October 2025. Read coverage recorded in the packet: Construction 1.3; Construction 1.7; Definition 2.1 and Lemma 2.2; Definition 2.3, Theorem 2.4 and Remark 2.5; Constructions 2.6–2.14 and Lemmas 2.15–2.19; Theorem 2.21 and its Lemmas 2.22–2.26; Burklund/Moore inputs 2.27–2.30; Convention 3.1, Lemma 3.2 and finite-coefficient calculation through Theorem 3.14 and proof.
- **efimov**: Alexander I. Efimov, [Rigidity of the category of localizing motives](https://arxiv.org/pdf/2510.17010v1), arXiv:2510.17010v1, 19 October 2025. Read coverage recorded in the packet: Rigidity and trace-class conventions in §§1.2–1.5; Definition 1.2 and continuous-extension discussion in §1.6; Theorem 2.1 and proof; Theorem 3.1, Definition 3.2, Proposition 3.6, Proposition 3.13 and proof of Theorem 3.1.
- **bms**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, [Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Published version, Publ. Math. IHÉS 129 (2019), 199–310, DOI 10.1007/s10240-019-00106-9. Read coverage recorded in the packet: Theorems 1.8, 1.12 and 1.17; Corollary 3.4/Remark 3.5; QRSP unfolding interface in §4.6; Proposition 5.8 and Corollary 5.10; Lemma 5.14/Proposition 5.15; relevant perfectoid, cotangent and Nygaard computations and proofs in §§6–7; Theorem 8.17/Corollary 8.18 and TC-sheaf part of 8.19–8.20; almost/AΩ/Adams constructions and proofs in §9; relative trace computations in §11.1–11.2 through relevant parts of Corollary 11.12.
- **bm**: Bhargav Bhatt and Akhil Mathew, [Syntomic complexes and p-adic étale Tate twists](https://arxiv.org/pdf/2202.04818v2), arXiv:2202.04818v2, 1 December 2022; Forum Math. Pi 11 (2023), e1. Read coverage recorded in the packet: Example 1.6 and the introductory finite syntomic/K-sheaf conventions.
- **bgt**: Andrew J. Blumberg, David Gepner and Gonçalo Tabuada, [A universal characterization of higher algebraic K-theory](https://arxiv.org/pdf/1001.2282v4), arXiv:1001.2282v4, 5 February 2013. Read coverage recorded in the packet: Definition 8.1; Proposition 8.6, Theorem 8.7 and its localization proof; statement of Theorem 9.8 and its initial proof reduction.
- **wagner**: Ferdinand Wagner, [q-de Rham cohomology and topological Hochschild homology over ku](https://arxiv.org/pdf/2510.06057v1), arXiv:2510.06057v1, 7 October 2025. Read coverage recorded in the packet: 4.18(A),(R), 4.18a(R2), Theorem 4.27 and Remark 4.28; 5.43(A2); Theorem 5.63 and proof, pp.79–80; Corollary 6.15 and proof, p.86.
- **scholze**: Peter Scholze, [Berkovich Motives](https://arxiv.org/pdf/2412.03382v3), arXiv:2412.03382v3, 22 January 2026; J. Amer. Math. Soc. 39 (2026), 697–764. Read coverage recorded in the packet: §8 almost-module/continuous-K paragraph before Proposition 8.7, pp.46–47.
- **continuous**: Alexander I. Efimov, [K-theory and localizing invariants of large categories](https://arxiv.org/pdf/2405.12169v4), arXiv:2405.12169v4, 5 October 2026. Read coverage recorded in the packet: Definition 2.58; Propositions 2.59 and 2.61, pp.50–51; Definition 8.5, Propositions 8.6–8.8 and Theorem 8.10 with proofs, pp.105–107.
- **bs**: Bhargav Bhatt and Peter Scholze, [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4), arXiv:1905.08229v4, 12 January 2022. Read coverage recorded in the packet: Theorem 13.1 and Lemma 13.2 with proofs, pp.94–96; Proposition 15.7 and proof, p.105.
- **ammn**: Benjamin Antieau, Akhil Mathew, Matthew Morrow and Thomas Nikolaus, [On the Beilinson fiber square](https://arxiv.org/pdf/2003.12541v2), arXiv:2003.12541v2, 29 September 2021. Read coverage recorded in the packet: Construction 6.16 and Theorem 6.17 with proof, pp.44–45.

## Verified baseline ingredients

- [mathlib:Nat.factorization](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Factorization/Defs.lean#L50): The finitely supported prime-exponent function; its actual zero/nonprime convention is retained, with m>0 imposed separately.

- [mathlib:Nat.factorization_pow](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Factorization/Defs.lean#L184): For n,k∈N, factorization(n^k)=k•factorization(n), supplying the fourth-power cofinal specialization.

- [mathlib:MvPolynomial](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Basic.lean#L82): The existing polynomial ring with arbitrary variable index; Fin 2 supplies u,v.

- [mathlib:Ideal.Quotient.mk](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/Defs.lean#L83): The ring quotient map R→R/I for a commutative ring and an ideal.

- [mathlib:Ideal.Quotient.lift](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/Defs.lean#L144): Descend a ring homomorphism annihilating the ideal to R/I; this supplies the coefficient maps after checking uv−ξ.

- [mathlib:LaurentPolynomial](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Laurent.lean#L84): The abbreviation AddMonoidAlgebra R Z with its existing ring structure.

- [mathlib:LaurentPolynomial.C](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Laurent.lean#L131): The constant coefficient ring homomorphism into Laurent polynomials.

- [mathlib:LaurentPolynomial.T](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Laurent.lean#L155): The monomial single n 1 for integer n; σ and σ⁻¹ are T(1) and T(−1).

- [mathlib:ChainComplex](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/HomologicalComplex.lean#L151): Ordinary chain complexes in a category with zero morphisms and the down complex shape; used only for the chain-level compatibility prototype.

- [mathlib:HomologicalComplex.Hom.comm](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/HomologicalComplex.lean#L222): Every complex morphism commutes with its differentials at every pair of indices.

## Targets and acceptance examples

| Stage target | Declaration chain |
|---|---|
| RT.5 continuous extension and duality | ContinuousCalkin → ContinuousExtension → LocalizingMotives → MotivesRigidity |
| RT.5 refined functors and maps | Rigidification → RefinedInvariantUniversality → RefinedTraces; SmoothProperCategory → RefinedBaseChange |
| RT.5 rational ku/KU coefficients | HighPowered → TorsionQhodge → ProQhodgeIdempotence and GradedTraceClass → RefinedKuComputation and RefinedKuPeriodicComputation |
| RT.6 coherent Habiro instance | RT.4 supplied comparison → HabiroTraceInterface, preserving finite-group actions and Bott maps |
| RT.6 BMS2 coefficients and filtrations | PerfectoidThh → QrspEvenThh/QrspTcNygaard → TraceNygaardComplex/MotivicFiltrations |
| RT.6 completed prismatic and graded syntomic comparison | CrystallineTraceComparison and AomegaComparison → TracePrismaticComparison → GradedMotivicComparison/SyntomicGradedTc |
| RT.6 AMMN filtered refinement | CyclicDerhamComparison, MotivicFiltrations and SyntomicGradedTc → AmmnFilteredInterface, with RT.3b owning the pullback |
| RT.6 added BM source statement | SyntomicKSheaf, with the exact announced-proof gap |

**Polynomial HKR.** For R[x] over a perfectoid base, the dx odd class and exterior multiplication agree through the chain/mixed comparison. Suppliers: RefinedTraceMethods:RT.1, RefinedTraceMethods:RT.6/quasismooth-thh-filtration, RefinedTraceMethods:RT.6/mixed-complex-map-compatibility.

**Square-zero relative trace.** Use the sibling’s nilpotent/square-zero finite-coefficient K/TC comparison with its exact hypotheses; do not rebuild the relative trace theorem in RT.6. Suppliers: RefinedTraceMethods:RT.3.

**Finite-field THH.** For F_p the trace algebra is polynomial F_p[u] and can(u)=pσ whereas φ(u)=σ. Suppliers: KTheoryFiniteLocalFields:L.5, RefinedTraceMethods:RT.6/perfectoid-thh, RefinedTraceMethods:RT.6/perfectoid-tc-maps.

**Bott localization ku→KU.** Compare coefficient maps and finite q-Hodge shifts before β inversion; use the periodic reconstruction proof. Suppliers: RefinedTraceMethods:RT.4:topological, RefinedTraceMethods:RT.5/refined-ku-periodic-computation, RefinedTraceMethods:RT.6/habiro-trace-interface.

**Rational refined input.** Retain the ind-colimit Ext¹ extension and its derived completion. Ordinary p-completed THH rational vanishing does not replace the refined localization cofiber. Suppliers: RefinedTraceMethods:RT.5/refined-ku-computation, RefinedTraceMethods:RT.5/refined-ku-periodic-computation.

## RT.5: refined localizing invariants

Atlas planets: Rigidity of localizing motives; Refined localizing invariants; Refined TC⁻ of rational ku; Dualizable categories; Continuous localizing invariants; Localizing motives.

### Rigidity of relative localizing motives

**MotivesRigidity** · theorem · RefinedTraceMethods:RT.5/motives-rigidity

If E is a rigid presentable E₁-monoidal stable category, Motloc_E is dualizable in PrL_st with dual Motloc_(E^mop) and pairing (D,C) ↦ Kcont(D ⊗_E C). If E is E₂-monoidal, Motloc_E is rigid E₁-monoidal. In the symmetric monoidal case the rigidity is symmetric monoidal. These are finitary accessible motives with the specified universe, not the assertion that every motive is a dualizable object.

Source: [Alexander I. Efimov](https://arxiv.org/pdf/2510.17010v1), Theorem 3.1, p. 29; proof of Theorem 3.1, pp. 43–44.

Direct prerequisites: RefinedTraceMethods:RT.5/localizing-motives; RefinedTraceMethods:RT.5/nuclear-module-resolution; RefinedTraceMethods:RT.5/enriched-duality; RefinedTraceMethods:RT.5/continuous-extension; RefinedTraceMethods:RT.5/rigidity-criterion.

Proof or construction outline:

1. Use the corepresentability of concrete nonconnective K-theory to make the motive of E compact.
2. Resolve small E-enriched categories by the nuclear length-one resolution. Their motives generate under colimits and are sequential colimits of trace-class maps.
3. Apply Efimov Theorem 2.1 to the left and right composition categories to obtain the stated duality; for E₂ multiplication the right adjoint is bilinear, giving rigidity.

Acceptance:

- E = Sp gives rigid absolute localizing motives.
- For merely E₁ base the dual is indexed by E^mop; do not claim a symmetric monoidal structure.

### The refined localizing invariant

**RefinedInvariantUniversality** · theorem · RefinedTraceMethods:RT.5/refined-invariant-universality

Let E be rigid symmetric monoidal, and T: Motloc_E → D a colimit-preserving symmetric monoidal functor to a presentable symmetric monoidal stable D. The canonical rigidification D^rig ⊂ Ind_κ(D), defined by trace-class systems, admits a unique colimit-preserving symmetric monoidal factor Tref: Motloc_E → D^rig, up to contractible choice; realization gives T. If D is locally rigid with ω₁-compact unit, D^rig is the category of nuclear ind-objects with sequential presentations.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Construction 1.3, pp. 2–3; Lemmas 2.15–2.17, pp. 16–17.

Direct prerequisites: RefinedTraceMethods:RT.5/motives-rigidity; RefinedTraceMethods:RT.5/rigidification; RefinedTraceMethods:RT.5/trace-class-functoriality; RefinedTraceMethods:RT.5/rigidity-criterion.

Proof or construction outline:

1. A symmetric monoidal functor preserves trace-class maps.
2. Present objects of the rigid source by basic nuclear systems; apply T to those systems.
3. The trace-class comparison of preduals identifies their colimits, making the factor functorial, monoidal and independent of presentation.

Acceptance:

- The ordinary comparison is a realization map, not an equivalence for arbitrary rational inputs.
- A compact dualizable target value is represented by its constant ind-object.

### Refined TC⁻ of rational ku

**RefinedKuComputation** · theorem · RefinedTraceMethods:RT.5/refined-ku-computation

TC−,ref((ku ⊗ Q)/ku) is even. Its even graded homotopy is the idempotent nuclear ind-graded B = Z[β][[t]]-algebra A*ku obtained by killing the idempotent pro-algebra F_m = Fil*qHdg(derived qdR(Z/m)/Z), indexed by high-powered m under divisibility; |β|=2, |t|=−2 and q−1=βt. There is a natural exact sequence 0 → B → A*ku → ind-colim_(m∈N^op) Ext¹_B(F_m,B) → 0. Ext and duals are in the graded derived t-complete category; no canonical splitting is asserted. The exact sequence comes from the cofiber of the duals of the unit maps in TC⁻.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Theorem 3.14(a) and proof, pp. 36–37; Convention 3.1, p. 28.

Direct prerequisites: RefinedTraceMethods:RT.5/refined-traces; RefinedTraceMethods:RT.5/high-powered; RefinedTraceMethods:RT.5/torsion-qhodge; RefinedTraceMethods:RT.5/even-derived-hom; RefinedTraceMethods:RT.5/torsion-duality; RefinedTraceMethods:RT.5/pro-qhodge-idempotence; RefinedTraceMethods:RT.5/graded-trace-class; RefinedTraceMethods:RT.5/algebra-killing; RefinedTraceMethods:RT.5/nuclear-closure.

Proof or construction outline:

1. Use the trace-class pro-algebra TC⁻((ku/m)/ku) and the localization cofiber from the refined invariant.
2. The double-speed Whitehead filtration and derived Hom calculation identify the dual unit cofiber with graded Ext¹.
3. The torsion duals occupy odd degrees; their cofibers with the even base are even. Idempotence and nuclearity pass through the source’s bounded-amplitude comparison.

Acceptance:

- Odd homotopy groups vanish in the ind-category.
- The unit B → A*ku is the left arrow of the displayed exact sequence.
- Apply p-completion in the source’s ind-complete category, not rationalization of ordinary THH.

### Refined TC⁻ of rational KU

**RefinedKuPeriodicComputation** · theorem · RefinedTraceMethods:RT.5/refined-ku-periodic-computation

TC−,ref((KU ⊗ Q)/KU) is even with π2* = A_KU[β,β⁻¹], |β|=2. A_KU is the idempotent nuclear ind Z[[q−1]]-algebra obtained by killing pro qHdg(derived qdR(Z/m)/Z), and 0 → Z[[q−1]] → A_KU → ind-colim_(m∈N^op) Ext¹_(Z[[q−1]])(qHdg(derived qdR(Z/m)/Z),Z[[q−1]]) → 0. Duals and Ext use the derived (q−1)-complete category. This is the periodic computation with its own convergence proof, not an application of a bounded-below formula to KU.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Theorem 3.14(b) and proof, pp. 36–37; Corollary 3.8, p. 32; Lemma 3.11, pp. 34–35.

Direct prerequisites: RefinedTraceMethods:RT.5/refined-ku-computation; RefinedTraceMethods:RT.5/even-completed-tensor; RefinedTraceMethods:RT.4:topological/homotopy-of-ku; RefinedTraceMethods:RT.4:topological/bott-localisation; RefinedTraceMethods:RT.4:topological/relative-thh-ku; RefinedTraceMethods:RT.4:topological/ku-circle-actions; RefinedTraceMethods:RT.4:q-Hodge/q-hodge-global; RefinedTraceMethods:RT.4:q-Hodge/p-complete-comparison-odd; RefinedTraceMethods:RT.4:q-Hodge/p-complete-comparison-two; RefinedTraceMethods:RT.4:q-Hodge/compatible-spherical-lifts; RefinedTraceMethods:RT.4:q-Hodge/cyclonic-even-filtrations; RefinedTraceMethods:RT.4:Habiro-comparison/twisted-q-hodge-comparison; RefinedTraceMethods:RT.4:Habiro-comparison/habiro-comparison-theorem.

Proof or construction outline:

1. Repeat the localization cofiber and derived Hom argument over KU^hS¹.
2. Use Bott-periodic even-filtration comparison from RT.4 and the periodic qHdg identification.
3. Identify the resulting idempotent algebra over Z[[q−1]] and keep the ind-colimit rather than replacing it by an ordinary ring colimit.

Acceptance:

- The β grading is periodic and the scalar relation q−1=βt agrees after Bott localization.
- Both the ordinary-to-refined map and the finite-coefficient maps occur at spectrum level.

### Dualizable presentable stable categories

**DualizableCategories** · definition · RefinedTraceMethods:RT.5/dualizable-categories

Catdual_E has presentable stable left E-modules C that are dualizable as objects of PrL_E. Morphisms are E-linear colimit-preserving functors whose right adjoints preserve colimits (strongly continuous functors). For E=Sp this is Catdual_st. Object dualizability means specified evaluation and coevaluation with coherent triangle identities; it does not mean every object of C is dualizable or C is compactly generated.

Source: [Alexander I. Efimov](https://arxiv.org/pdf/2510.17010v1), §1.5, pp. 18–20.

Direct prerequisites: EnhancedDerivedSheaves:E5:abstract/stable-infinity-category; EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category; EnhancedDerivedSheaves:E5:presentability/presentable-categories; EnhancedDerivedSheaves:E5:presentability.

Proof or construction outline:

1. Form the E-linear tensor product in PrL using the imported coherent category interface.
2. Select dualizable objects and strongly continuous E-linear morphisms.
3. Construct the dual and adjunctions with their coherent triangle identities as in Efimov §1.5.

Uses deriving the API:

- RefinedTraceMethods:RT.5/continuous-extension: Strongly continuous arrows and the left Yoneda adjoint make the continuous Calkin construction functorial.
- RefinedTraceMethods:RT.5/relative-nuclear-module: The tensor and internal Hom over E classify nuclear module objects.

API:

| Name | Role | Statement |
|---|---|---|
| DualizableCategories.ofInd | constructor | For small idempotent-complete stable A, Ind(A) is an object of Catdual_st (E=Sp). An E-linear version additionally requires the compatible E-action supplied by the rigid-base module interface. |
| DualizableCategories.dual | data | Return the object dual C∨ with evaluation C∨⊗_E C → E and coevaluation E → C⊗_E C∨ satisfying coherent triangles. |
| DualizableCategories.hom | characterisation | Morphisms C → D are E-linear left adjoints with colimit-preserving right adjoint. |
| DualizableCategories.tensor | structure | For symmetric monoidal rigid E, tensor over E and its unit give Catdual_E a symmetric monoidal structure. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| DualizableCategories.indPerf | compatibility | For A=Perf(R), the supplied spectrum-module comparison identifies Ind(A) with Mod_R. |
| DualizableCategories.zero | degenerate | The zero presentable stable category is dualizable, with zero evaluation and coevaluation. |
| DualizableCategories.rightAdjointRequired | non-example | A left adjoint whose right adjoint fails to preserve colimits is not a morphism of Catdual_st. |

Acceptance:

- Ind(A) is dualizable for small idempotent-complete stable A.
- A colimit-preserving functor with non-colimit-preserving right adjoint is excluded.

### Trace-class morphisms

**TraceClass** · definition · RefinedTraceMethods:RT.5/trace-class

In a presentable symmetric monoidal stable C, with tensor preserving colimits separately, write X∨=internal Hom(X,1), without assuming X dualizable. A map f:X → Y is trace-class when there is η:1 → X∨⊗Y such that f equals X≃X⊗1 → X⊗X∨⊗Y → Y by evaluation. The E₁ variant uses distinct left/right preduals and the corresponding tensor orders.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Definition 2.1 and Lemma 2.2, pp. 11–12.

Direct prerequisites: EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category; EnhancedDerivedSheaves:E5:presentability/presentable-categories; EnhancedDerivedSheaves:E5:presentability.

Proof or construction outline:

1. Construct internal Hom as the right adjoint of tensor.
2. Evaluate the classifier to a map X → Y, and impose equality in the mapping space.
3. Use left/right internal Homs for the noncommutative enriched duality theorem.

Uses deriving the API:

- RefinedTraceMethods:RT.5/rigidification: The classifier and composition ideal generate the Q-indexed rigidification systems.
- RefinedTraceMethods:RT.5/localization-tower-formula: Dualizable transition bimodules produce trace-class transitions, permitting the localization cofiber.

API:

| Name | Role | Statement |
|---|---|---|
| TraceClass.ofClassifier | constructor | An η:1 → X∨⊗Y gives a trace-class map by the evaluation formula. |
| TraceClass.iff_factorization | characterisation | Trace-class means that the adjoint of f:1 → Hom(X,Y) factors through X∨⊗Y. |
| TraceClass.map | functoriality | A symmetric monoidal functor takes a trace-class f to a trace-class map through F(X∨) → F(X)∨. Supplied by RefinedTraceMethods:RT.5/trace-class-functoriality. |
| TraceClass.predual | compatibility | If f:X → Y is trace-class then Y∨ → X∨ is trace-class; for such transitions the comparison F(Y)∨ → F(X∨) supplies the diagonal needed for ind-predual colimits. Supplied by RefinedTraceMethods:RT.5/trace-class-functoriality. |
| TraceClass.comp | relation | Precomposition and postcomposition preserve trace-class maps: transport the classifier by the predual map on the source and the ordinary map on the target. |
| TraceClass.tensor | relation | The tensor of two trace-class maps is trace-class, classified by the tensor of their classifiers and the canonical predual comparison. |
| TraceClass.identity_iff_dualizable | characterisation | The identity on X is trace-class exactly when X is dualizable; the classifier of the identity supplies coevaluation. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| TraceClass.unitIdentity | computation | The identity on the tensor unit is trace-class, classified by its unit constraints. |
| TraceClass.zeroMap | degenerate | The zero X → Y is trace-class, classified by the zero map 1 → X∨⊗Y. |
| TraceClass.infiniteVectorSpace | non-example | The identity on the countably infinite direct-sum k-vector space in D(k) is not trace-class, whereas every finite-rank degree-zero map is. |

Acceptance:

- Identity is trace-class exactly for dualizable objects.
- In D(k), maps between degree-zero vector spaces are trace-class exactly when finite rank.

### Functoriality and preduals of trace-class maps

**TraceClassFunctoriality** · theorem · RefinedTraceMethods:RT.5/trace-class-functoriality

Let F:C → D be symmetric monoidal between presentable symmetric monoidal categories. There is a natural comparison F(X∨) → F(X)∨. A trace-class f:X → Y has trace-class predual Y∨ → X∨ and trace-class image F(f). For its chosen classifier, the naturality square on preduals has a diagonal F(Y)∨ → F(X∨) whose two triangles commute. This diagonal gives the predual comparison needed on trace-class ind-systems; it does not assert that F preserves arbitrary internal Homs.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Lemma 2.2(a)–(c) and proof, pp. 11–12.

Direct prerequisites: RefinedTraceMethods:RT.5/trace-class; EnhancedDerivedSheaves:E5:presentability.

Proof or construction outline:

1. Construct the comparison by applying F to evaluation and taking its adjoint.
2. Apply F to the classifier and compose with that comparison; dualize the classifier for the predual map.
3. Tensor the image classifier with F(Y)∨ and evaluate F(Y); the resulting diagonal satisfies both triangle identities.

Acceptance:

- Retain the stated hypotheses and coherent comparison maps.

### Rigid monoidal categories

**RigidCategory** · definition · RefinedTraceMethods:RT.5/rigid-category

A presentable stable E₁-monoidal E is rigid when the unit is compact and multiplication μ:E⊗E → E is strongly continuous with E–E-bilinear right adjoint. Equivalently its unit is compact and it is generated under colimits by sequential colimits of maps that are both left and right trace-class. In the symmetric monoidal case the two trace-class conditions coincide. The equivalence is a theorem of Efimov Proposition 1.1; compact generation is not an extra defining hypothesis.

Source: [Alexander I. Efimov](https://arxiv.org/pdf/2510.17010v1), §1.2 and Proposition 1.1, pp. 15–16.

Direct prerequisites: RefinedTraceMethods:RT.5/dualizable-categories; RefinedTraceMethods:RT.5/trace-class; EnhancedDerivedSheaves:E5:presentability/compact-objects.

Proof or construction outline:

1. Use the monoidal multiplication adjunction to define rigidity.
2. Apply the trace-class sequential-generation criterion of Efimov Proposition 1.1.
3. For compactly generated E identify it with Ind of a small rigid monoidal category; do not extend that presentation to all rigid E.

Uses deriving the API:

- RefinedTraceMethods:RT.5/motives-rigidity: A bilinear right adjoint to multiplication and a compact unit are the rigidity conclusion.
- RefinedTraceMethods:RT.5/refined-invariant-universality: A rigid source presents every object by trace-class systems.

API:

| Name | Role | Statement |
|---|---|---|
| RigidCategory.multiplicationRightAdjoint | projection | Return μ^R preserving colimits and compatible with the left and right E actions. |
| RigidCategory.unitCompact | projection | The tensor unit is compact. |
| RigidCategory.iff_traceClassGenerators | characterisation | Rigidity is equivalent to compact unit and generation by sequential systems whose maps are both left and right trace-class. Supplied by RefinedTraceMethods:RT.5/rigidity-criterion. |
| RigidCategory.compact_iff_dualizable | compatibility | For a rigid E, an object is compact exactly when it is left and right dualizable; this does not make all objects compact. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| RigidCategory.spectra | computation | Sp is rigid and its compact objects are finite spectra. |
| RigidCategory.indRigid | compatibility | Ind(A) is rigid when small stable idempotent-complete monoidal A has every object dualizable. |
| RigidCategory.unitNotCompact | non-example | A presentable monoidal stable category with noncompact unit fails the definition even if multiplication has a continuous right adjoint. |

Acceptance:

- Sp is rigid with compact sphere unit.
- A rigid category can fail to be compactly generated.

### Trace-class generation criterion for rigidity

**RigidityCriterion** · theorem · RefinedTraceMethods:RT.5/rigidity-criterion

For a presentable stable E₁-monoidal category E, rigidity is equivalent to compactness of its unit together with generation under colimits by sequential colimits whose transitions are both left and right trace-class. In the symmetric monoidal case the two trace-class conditions coincide. Compactness of the unit is a separate hypothesis in both directions.

Source: [Alexander I. Efimov](https://arxiv.org/pdf/2510.17010v1), §1.2 and Proposition 1.1, pp. 15–16.

Direct prerequisites: RefinedTraceMethods:RT.5/rigid-category; RefinedTraceMethods:RT.5/trace-class; EnhancedDerivedSheaves:E5:presentability.

Proof or construction outline:

1. Use the left and right trace-class classifier definitions in Efimov §1.2.
2. Apply Proposition 1.1 with both its compact-unit and sequential-generation hypotheses; retain left/right order in the E₁ case.

Acceptance:

- Retain the stated hypotheses and coherent comparison maps.

### Nuclear objects

**NuclearObject** · definition · RefinedTraceMethods:RT.5/nuclear-objects

For compactly generated presentable symmetric monoidal stable C with compact unit, X is nuclear if every map P → X from compact P is trace-class. X is basic nuclear if it has a sequential presentation X≃colim_n X_n with all transitions trace-class. The full subcategory Nuc(C) is stable and closed under colimits and tensor; its ω₁-compact objects are precisely the basic nuclear objects.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Definition 2.3, Theorem 2.4 and Remark 2.5, p. 12.

Direct prerequisites: RefinedTraceMethods:RT.5/trace-class; EnhancedDerivedSheaves:E5:presentability/compact-objects; EnhancedDerivedSheaves:E5:presentability/ind-completion.

Proof or construction outline:

1. Define the test over all compact P using the mapping spaces.
2. Define sequential basic nuclear presentations and apply MW Theorem 2.4.
3. For a large C use κ-compact factorization of trace-class maps before taking the Indω₁ envelope of the essentially small basic nuclear category.

Uses deriving the API:

- RefinedTraceMethods:RT.5/rigidification: Basic nuclear sequences and their ω₁-compact presentations generate the rigid target.
- RefinedTraceMethods:RT.5/algebra-killing: The dual pro-system gives the nuclear ind-idempotent algebra.

API:

| Name | Role | Statement |
|---|---|---|
| NuclearObject.ofBasic | constructor | A sequential trace-class presentation gives a nuclear object. |
| NuclearObject.mapFromCompact | characterisation | Every map P → X from compact P has a trace-class classifier. |
| NuclearObject.colimit | structure | Nuclear objects are stable and closed under arbitrary colimits and tensor products. Supplied by RefinedTraceMethods:RT.5/nuclear-closure. |
| NuclearObject.map | functoriality | Symmetric monoidal colimit-preserving F preserves basic nuclear objects and hence nuclear objects under the source’s generation hypotheses. Supplied by RefinedTraceMethods:RT.5/nuclear-closure. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| NuclearObject.zero | degenerate | The zero object is basic nuclear via the constant zero system. |
| NuclearObject.finiteDimensional | computation | In D(k), a finite-dimensional degree-zero vector space is basic nuclear via its constant identity system. |
| NuclearObject.countableVsUncountable | non-example | In D(k), a countably generated degree-zero vector space is basic nuclear, while an uncountable-dimensional degree-zero space is nuclear but not ω₁-compact and hence not basic nuclear. |

Acceptance:

- In Ind(Perf(k)), every object is nuclear but the basic nuclear size bound is countable.
- Testing only maps from the tensor unit is insufficient unless a generator theorem is supplied.

### Closure and generation of nuclear objects

**NuclearClosure** · theorem · RefinedTraceMethods:RT.5/nuclear-closure

Let C be compactly generated presentable stable symmetric monoidal with compact unit. Nuc(C) is stable and closed under all colimits and tensor products; it is ω₁-compactly generated and its ω₁-compact objects are exactly the basic nuclear objects. A symmetric monoidal colimit-preserving functor preserves basic nuclear objects and nuclear objects as in MW Theorem 2.4(c). For the size-controlled nuclear ind-envelope, a sufficiently large regular κ bounds trace-class factorizations and makes basic nuclear systems essentially small.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Theorem 2.4 and Remark 2.5, p. 12.

Direct prerequisites: RefinedTraceMethods:RT.5/nuclear-objects; RefinedTraceMethods:RT.5/trace-class-functoriality; EnhancedDerivedSheaves:E5:presentability/compact-objects; EnhancedDerivedSheaves:E5:presentability/ind-completion.

Proof or construction outline:

1. Use MW Theorem 2.4(a),(b) for the stable tensor closure and ω₁-generation.
2. Preserve sequential classifiers by trace-class functoriality and extend over the nuclear colimit envelope.
3. Apply Remark 2.5’s κ-compact factorization to construct the essentially small basic ind-object category before its Indω₁ envelope.

Acceptance:

- Retain the stated hypotheses and coherent comparison maps.

### The continuous Calkin category

**ContinuousCalkin** · construction · RefinedTraceMethods:RT.5/continuous-calkin

For dualizable presentable stable C and an uncountable regular cardinal κ, the strongly continuous fully faithful left adjoint Yoneda functor Ŷ:C → Ind(C^κ) has quotient equivalent to ker(colim:Ind(C^κ) → C). Define Calkcont_κ(C) as the compact objects of that quotient. It is small stable idempotent-complete and gives an exact sequence 0 → C → Ind(C^κ) → Ind(Calkcont_κ(C)) → 0 in Catdual_st. Functoriality is for strongly continuous functors.

Source: [Alexander I. Efimov](https://arxiv.org/pdf/2405.12169v4), Definition 2.58, pp. 50–51; Propositions 2.59 and 2.61, p. 51.

Direct prerequisites: RefinedTraceMethods:RT.5/dualizable-categories; EnhancedDerivedSheaves:E5:presentability/ind-completion; EnhancedDerivedSheaves:E5:presentability.

Proof or construction outline:

1. Use ω₁-presentability and the left adjoint Yoneda embedding of a dualizable category (Efimov §2).
2. Construct the stable accessible quotient; identify it with the kernel of colim.
3. Take compact objects and induced quotient maps. For compactly generated C compare with (Ind(C^ω)^κ/C^ω)^Kar.

Uses deriving the API:

- RefinedTraceMethods:RT.5/continuous-extension: The compact continuous quotient is evaluated by F and looped.

API:

| Name | Role | Statement |
|---|---|---|
| ContinuousCalkin.quotient | data | The canonical functor Ind(C^κ) → Ind(Calkcont_κ(C)) has kernel Ŷ(C). |
| ContinuousCalkin.map | functoriality | Strongly continuous C → D induces an exact Calkcont_κ(C) → Calkcont_κ(D), with coherent identity and composition laws. |
| ContinuousCalkin.compactlyGenerated | equivalence | If C=Ind(A), Calkcont_κ(C) ≃ (Ind(A)^κ/A)^Kar. |
| ContinuousCalkin.exactSequence | compatibility | The defining sequence is exact in Catdual_st and is functorial in C. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| ContinuousCalkin.zero | degenerate | Calkcont_κ(0) is the zero small stable category. |
| ContinuousCalkin.perfRing | compatibility | For C=Mod_R, Calkcont_κ(C) is the idempotent completion of (Mod_R)^κ/Perf(R). |
| ContinuousCalkin.swindle | characterisation | For compactly generated C, the exact sequence C^ω → C^ω₁ → Calkcont_ω₁(C) produces the loop equivalence after an accessible localizing invariant; C^ω₁ has vanishing invariant by the countable swindle. |

Acceptance:

- For compactly generated C it agrees with the classical κ-Calkin of C^ω.
- For a general C it is not defined as the naive quotient C^κ/C^ω.

### Accessible localizing invariants

**LocalizingInvariant** · definition · RefinedTraceMethods:RT.5/localizing-invariant

An accessible localizing invariant F:Catperf → T, with T accessible stable, sends the zero category to zero and exact sequences A → B → C (fully faithful first map and idempotent-complete Verdier quotient C) to fiber/cofiber sequences, and commutes with κ-filtered colimits for a specified regular κ. The relative Catdual_E version uses exact sequences and strongly continuous E-linear maps. A finitary invariant has κ=ω.

Source: [Alexander I. Efimov](https://arxiv.org/pdf/2510.17010v1), §1.6 and Definition 1.2, pp. 20–21.

Direct prerequisites: EnhancedDerivedSheaves:E5:abstract/stable-infinity-category; EnhancedDerivedSheaves:E5:presentability/ind-completion; RefinedTraceMethods:RT.5/dualizable-categories.

Proof or construction outline:

1. Use the enhanced exact sequence and idempotent completion supplied by E5.
2. Specify accessibility and the actual κ-filtered colimits admitted by T.
3. Distinguish the functor’s construction from its localizing property: concrete nonconnective K-theory is imported from GeneralAlgebraicKTheory.

Uses deriving the API:

- RefinedTraceMethods:RT.5/localizing-motives: Exact and colimit relations are the presheaf localization relations.
- RefinedTraceMethods:RT.5/continuous-extension-uniqueness: These relations establish the universal continuous extension.

API:

| Name | Role | Statement |
|---|---|---|
| LocalizingInvariant.exactSequence | projection | F(A) → F(B) → F(C) is a cofiber sequence for each exact sequence. |
| LocalizingInvariant.map | functoriality | Exact functors give maps in T with coherent identity and composition. |
| LocalizingInvariant.filteredColimit | projection | F commutes with the specified κ-filtered colimits. |
| LocalizingInvariant.ofKTheory | compatibility | The imported concrete nonconnective K-theory functor satisfies this interface; the universal property is a property, not its definition. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| LocalizingInvariant.zero | degenerate | F(0) ≃ 0. |
| LocalizingInvariant.split | computation | F(A⊕B) ≃ F(A)⊕F(B) with the two inclusions and projections. |
| LocalizingInvariant.connectiveKNotEnough | non-example | Connective K-theory without additional hypotheses is not substituted for nonconnective K-theory in the arbitrary localization fiber sequence. |

Acceptance:

- A split exact sequence yields a direct sum in T.
- An additive invariant that is not exact-localizing does not satisfy this definition.

### Continuous extensions of localizing invariants

**ContinuousExtension** · construction · RefinedTraceMethods:RT.5/continuous-extension

For accessible localizing F:Catperf → T define Fcont(C)=Ω F(Calkcont_ω₁(C)) on Catdual_st. It is accessible localizing, commutes with the same κ-filtered colimits as F, and Fcont(Ind(A))≃F(A). Kcont denotes this construction applied to the concrete nonconnective K-theory functor. This extends a supplied functor rather than postulating a new universal K spectrum.

Source: [Alexander I. Efimov](https://arxiv.org/pdf/2405.12169v4), Definition 8.5 and Propositions 8.6–8.8, pp. 105–106; Theorem 8.10, pp. 106–107.

Direct prerequisites: RefinedTraceMethods:RT.5/localizing-invariant; RefinedTraceMethods:RT.5/continuous-calkin; GeneralAlgebraicKTheory:K.6; GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance.

Proof or construction outline:

1. Apply F to the functorial Calkin exact sequence.
2. Use exactness of Calkcont, the countable Eilenberg swindle on C^ω₁ in the compactly generated case, and Proposition 8.8 for κ-filtered colimits.
3. Construct the comparison for Ind(A) and the resulting unique extension.

Uses deriving the API:

- RefinedTraceMethods:RT.5/motives-rigidity: Concrete Kcont(D⊗_E C) is the duality pairing.
- RefinedTraceMethods:RT.5/almost-module-k: The exact dualizable sequence of firm almost modules gives the K-fiber.

API:

| Name | Role | Statement |
|---|---|---|
| ContinuousExtension.obj | data | Fcont(C) is ΩF(Calkcont_ω₁(C)). |
| ContinuousExtension.map | functoriality | Strongly continuous C → D induces Fcont(C) → Fcont(D). |
| ContinuousExtension.ofInd | equivalence | Fcont(Ind(A)) ≃ F(A) naturally in small idempotent-complete stable A. |
| ContinuousExtension.exact | compatibility | Fcont takes exact sequences in Catdual_st to cofiber sequences and preserves the specified κ-filtered colimits. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| ContinuousExtension.zero | degenerate | Fcont(0)≃0. |
| ContinuousExtension.moduleK | compatibility | Kcont(Mod_R)≃the supplied K(Perf(R)) with its scalar-extension map. |
| ContinuousExtension.semiorthogonal | computation | For a strongly continuous semiorthogonal decomposition C=⟨C₁,C₂⟩, Fcont(C)≃Fcont(C₁)⊕Fcont(C₂). |

Acceptance:

- For Mod_R, Kcont(Mod_R)≃K(Perf(R)).
- Morphisms use strong continuity; bare continuous functors are outside the asserted functoriality.

### Uniqueness of continuous extension

**ContinuousExtensionUniqueness** · theorem · RefinedTraceMethods:RT.5/continuous-extension-uniqueness

For regular κ and accessible stable T admitting κ-filtered colimits, precomposition with Ind gives an equivalence between accessible κ-finitary localizing functors Catdual_st → T and Catperf → T. Its inverse is F ↦ Fcont. The relative E-linear version has the analogous statement for relatively compactly generated E-modules and dualizable E-modules with strong-continuity morphisms.

Source: [Alexander I. Efimov](https://arxiv.org/pdf/2405.12169v4), Theorem 8.10, pp. 106–107; relative version in Efimov rigidity §1.6, pp. 20–21.

Direct prerequisites: RefinedTraceMethods:RT.5/continuous-extension; RefinedTraceMethods:RT.5/dualizable-categories.

Proof or construction outline:

1. The Calkin exact sequence expresses every dualizable C using an Ind-category and its continuous Calkin.
2. Both any G and the continuous extension of G∘Ind recover Ω applied to the Calkin term; the middle term vanishes by the swindle.
3. Use Proposition 8.8 for the κ-finitary restriction and Efimov rigidity §1.6 for the relative version.

Acceptance:

- The equivalence is between categories of functors and natural transformations, not only objectwise equalities.

### The category of relative localizing motives

**LocalizingMotives** · construction · RefinedTraceMethods:RT.5/localizing-motives

For rigid E₁-monoidal E and regular κ, construct accessible stable Motloc_(E,κ) with κ-filtered colimits and Uloc,κ:Catdual_E → Motloc_(E,κ) such that precomposition identifies exact κ-continuous functors out of Motloc_(E,κ) with accessible κ-finitary localizing invariants. Use the small relatively compactly generated model, stabilized spectral presheaves, and localization at zero, Morita, exact-sequence and κ-colimit relations, then continuous extension. For symmetric monoidal E, tensor of E-modules descends to the finitary Motloc_E (κ=ω); for E₂ it supplies the E₁ structure used in the rigidity theorem.

Source: [Alexander I. Efimov](https://arxiv.org/pdf/2510.17010v1), Definition 1.2 and §1.6, pp. 20–21; [Andrew J. Blumberg, David Gepner and Gonçalo Tabuada](https://arxiv.org/pdf/1001.2282v4), Proposition 8.6 and Theorem 8.7, pp. 54–56; Theorem 9.8, p. 58.

Direct prerequisites: RefinedTraceMethods:RT.5/localizing-invariant; RefinedTraceMethods:RT.5/continuous-extension-uniqueness; RefinedTraceMethods:RT.5/rigid-category; EnhancedDerivedSheaves:E5:presentability; GeneralAlgebraicKTheory:K.6; GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance.

Proof or construction outline:

1. Choose a universe-small generating category at an explicit accessibility cardinal, and form spectral presheaves.
2. Impose the localization relations; tensor preserves those relations in each argument, so its Day-type product descends.
3. Compare with the small stable-category construction of BGT and extend from relatively compactly generated E-modules using continuous invariants. The relative multiplicative construction is a recorded proof input pending a complete source-to-E5 tensor audit.

Uses deriving the API:

- RefinedTraceMethods:RT.5/motives-rigidity: Unit corepresentability and nuclear motive generators give duality and rigidity.
- RefinedTraceMethods:RT.5/refined-invariant-universality: The motive-to-invariant colimit-preserving monoidal functor factors through rigidification.

API:

| Name | Role | Statement |
|---|---|---|
| LocalizingMotives.universal | constructor | Uloc sends an E-linear category to its motive and an exact sequence to a cofiber sequence. |
| LocalizingMotives.lift | universal-property | Every κ-finitary localizing invariant has an exact κ-continuous factor uniquely up to contractible choice. |
| LocalizingMotives.tensor | structure | For symmetric monoidal rigid E, Uloc(C⊗_E D)≃Uloc(C)⊗Uloc(D) with coherent associativity, units and symmetry. |
| LocalizingMotives.concreteK | compatibility | Map(Uloc(E),Uloc(C))≃Kcont(C) in the source’s finitary setting. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| LocalizingMotives.zero | degenerate | Uloc(0)≃0. |
| LocalizingMotives.baseSpectra | compatibility | For E=Sp, its compactly generated restriction and universal property agree with BGT Motloc. |
| LocalizingMotives.split | computation | Uloc(C⊕D)≃Uloc(C)⊕Uloc(D), compatibly with the inclusion maps. |

Acceptance:

- Motloc_Sp agrees with BGT’s localizing motives through the universal functor equivalence.
- The unit motive corepresents the supplied concrete nonconnective K-theory, not a new axiom-defined K functor.

### Nuclear E-modules

**RelativeNuclearModule** · definition · RefinedTraceMethods:RT.5/relative-nuclear-module

For rigid E₁-monoidal E, a strongly continuous E-linear morphism C → D of dualizable left E-modules is right trace-class over E if represented by a compact object of Homdual_E(C,E)⊗_E D under the canonical functor to FunLL_E(C,D). A relatively compactly generated C is nuclear over E if every compact morphism from an ω₁-compact relatively compactly generated D to C is right trace-class over E; basic nuclear means a sequential colimit of these right trace-class maps. The trace-class definition has dualizable-module generality; the nuclear subcategory here has relatively compactly generated objects. This categorical notion is distinct from nuclear objects in a monoidal category.

Source: [Alexander I. Efimov](https://arxiv.org/pdf/2510.17010v1), Definition 3.2, pp. 29–30; Proposition 3.6, p. 32.

Direct prerequisites: RefinedTraceMethods:RT.5/dualizable-categories; RefinedTraceMethods:RT.5/trace-class; RefinedTraceMethods:RT.5/rigid-category; EnhancedDerivedSheaves:E5:presentability.

Proof or construction outline:

1. Use the dualizable internal Hom of E-modules, with its canonical map to strongly continuous functors.
2. Specify the compact witness before defining nuclear and basic nuclear modules.
3. Use the equivalence with sequential trace-class presentations from Efimov Proposition 3.6 in the proof of motives rigidity.

Uses deriving the API:

- RefinedTraceMethods:RT.5/nuclear-module-resolution: The h_(x,n) Hom identifications show both resolution terms are basic nuclear.

API:

| Name | Role | Statement |
|---|---|---|
| RelativeNuclearModule.traceClassWitness | constructor | A compact object of Homdual_E(C,E)⊗_E D determines a relatively trace-class map C → D. |
| RelativeNuclearModule.ofBasic | compatibility | A sequential colimit of relatively trace-class maps is nuclear; ω₁-compact nuclear modules are basic nuclear. |
| RelativeNuclearModule.test | characterisation | Every compact map from an ω₁-compact relatively compactly generated E-module is relatively trace-class. |
| RelativeNuclearModule.motive | compatibility | Uloc carries these transitions to the left/right trace-class transitions used in Motloc_E rigidity. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| RelativeNuclearModule.base | computation | E as a left E-module is nuclear over itself. |
| RelativeNuclearModule.zero | degenerate | The zero E-module is basic nuclear. |
| RelativeNuclearModule.orderedResolution | compatibility | For the directed repetition category B of Proposition 3.13 with countable objects and ω₁-compact Homs, Fun(B^op,E) and the transition-fiber kernel are basic nuclear. |

Acceptance:

- The nuclear length-one resolution produces nuclear E-modules.
- The witness is compact in the tensor/internal-Hom category, not necessarily a compact object in the ordinary functor category.

### The nuclear resolution of length one

**NuclearModuleResolution** · construction · RefinedTraceMethods:RT.5/nuclear-module-resolution

For a small E-enriched A, define B with objects (x,n)∈Ob(A)×N and Hom_B((x,n),(y,m))=Hom_A(x,y) for n<m, 1_E for n=m and x=y, and 0 otherwise. Composition uses A’s composition and units. The strongly continuous functor Φ:Fun(B^op,E) → Fun(A^op,E) sends h_(x,n) to h_x. Its kernel C is generated as an E-localizing subcategory by fibers h_(x,n) → h_(x,n+1). Both C and Fun(B^op,E) are nuclear. If Ob(A) is countable and its Homs are ω₁-compact, both are ω₁-compact and basic nuclear.

Source: [Alexander I. Efimov](https://arxiv.org/pdf/2510.17010v1), Proposition 3.13 and proof, pp. 41–43.

Direct prerequisites: RefinedTraceMethods:RT.5/relative-nuclear-module; EnhancedDerivedSheaves:E5:presentability.

Proof or construction outline:

1. Construct B by the strict order on N and verify enriched composition.
2. The right adjoint to Φ is evaluation M(x,n)=M(x), identified on h_x with colim_n h_(x,n), so the counit is an equivalence.
3. Identify the kernel by the filtered fibers of transitions. The ordered semiorthogonal decomposition proves nuclearity; countable compact generators give the ω₁ bound.

Uses deriving the API:

- RefinedTraceMethods:RT.5/motives-rigidity: The length-one nuclear resolution produces enough trace-class generators for motives.

API:

| Name | Role | Statement |
|---|---|---|
| NuclearModuleResolution.repetition | constructor | Build B with the three stated Hom cases and enriched composition. |
| NuclearModuleResolution.quotient | projection | Φ sends h_(x,n) to h_x and admits fully faithful colimit-preserving right adjoint M(x,n)=M(x). |
| NuclearModuleResolution.kernel | characterisation | ker Φ is generated by the transition fibers. |
| NuclearModuleResolution.basicNuclear | compatibility | Countable Ob(A) and ω₁-compact Homs give an exact resolution by basic nuclear E-modules. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| NuclearModuleResolution.empty | degenerate | For A empty, B and both module categories are zero. |
| NuclearModuleResolution.oneObject | computation | For A with one object and endomorphism 1_E, B has Hom(n,m)=1_E for n≤m and 0 for n>m; Φ(h_n)=1_E. |
| NuclearModuleResolution.nonzeroKernel | non-example | For the one-object case the fiber h_0 → h_1 is nonzero, although its image under Φ is zero; Φ is a quotient, not an equivalence. |

Acceptance:

- Every ω₁-compact E₁-algebra has its module category as a quotient of this length-one basic nuclear resolution.

### Enriched trace-class duality

**EnrichedDuality** · theorem · RefinedTraceMethods:RT.5/enriched-duality

Let A be enriched over PrL_st and X,Y∈A. Assume 1_X is compact in A(X,X), A(X,Y) is generated by sequential colimits of right trace-class 2-morphisms, and A(Y,X) by sequential colimits of left trace-class 2-morphisms. Then A(X,Y) and A(Y,X) are dualizable, composition A(X,Y)⊗A(Y,X) → A(Y,Y) is strongly continuous, and A(Y,X)∨≃A(X,Y). Evaluation is composition to A(X,X) followed by Map(1_X,−); coevaluation is 1_Y followed by the right adjoint to composition.

Source: [Alexander I. Efimov](https://arxiv.org/pdf/2510.17010v1), Theorem 2.1, p. 25; proof, pp. 27–29.

Direct prerequisites: RefinedTraceMethods:RT.5/trace-class; RefinedTraceMethods:RT.5/dualizable-categories; EnhancedDerivedSheaves:E5:presentability.

Proof or construction outline:

1. Use the trace-class generation to identify the compact-morphism criteria for the composition right adjoint.
2. Construct evaluation using compact 1_X and coevaluation using the strongly continuous composition right adjoint.
3. Check both triangle identities on the sequential trace-class generators, then extend by colimits; these are the hypotheses used in Efimov Theorem 2.1.

Acceptance:

- Both left and right generation hypotheses are required; one-sided generation alone is not the theorem.

### Rigidification of the target

**Rigidification** · construction · RefinedTraceMethods:RT.5/rigidification

For presentable symmetric monoidal stable D with colimit-preserving tensor, form D^rig as the full subcategory of a size-controlled Ind_κ(D) generated under colimits by Q-indexed ind-objects whose transitions x_i → x_j, i<j, are trace-class. Choose a regular κ that bounds trace-class factorizations and generators. Realization is induced by colimit. If D is locally rigid and the unit is ω₁-compact, D^rig≃Nuc Ind(D), constructed from the essentially small sequential basic nuclear objects. The use of Q rather than N is essential without those extra hypotheses.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Construction 1.3, pp. 2–3; Remark 2.5, p. 12 (Ramzi Construction 4.75 and Efimov Theorem 4.2 are the recorded external proof input).

Direct prerequisites: RefinedTraceMethods:RT.5/trace-class; RefinedTraceMethods:RT.5/nuclear-objects; RefinedTraceMethods:RT.5/rigid-category; EnhancedDerivedSheaves:E5:presentability/ind-completion; EnhancedDerivedSheaves:E5:presentability; RefinedTraceMethods:RT.5/trace-class-functoriality; RefinedTraceMethods:RT.5/nuclear-closure.

Proof or construction outline:

1. Choose κ and the essentially small category of trace-class systems.
2. Take its colimit envelope within Ind_κ(D); extend the monoidal product and realization.
3. Use the locally rigid, ω₁-compact-unit theorem to replace Q-indexing by sequential nuclear presentations only in that case. The general rigidification proof is recorded as a precise external-source gap.

Uses deriving the API:

- RefinedTraceMethods:RT.5/refined-invariant-universality: Its universal mapping property defines the refined functor and realization comparison.

API:

| Name | Role | Statement |
|---|---|---|
| Rigidification.ofSystem | constructor | A Q-indexed system with trace-class transitions gives an object in D^rig. |
| Rigidification.realize | projection | Realization D^rig → D sends a system to its colimit and is symmetric monoidal. |
| Rigidification.map | functoriality | Symmetric monoidal colimit-preserving functors induce the rigidification comparison by preservation of trace-class maps. |
| Rigidification.sequential | equivalence | For locally rigid D with ω₁-compact unit, the Q-system envelope is equivalent to the sequential nuclear ind-object category. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| Rigidification.zero | degenerate | The zero trace-class system gives the zero object of D^rig. |
| Rigidification.constantDualizable | compatibility | The constant system on a dualizable X belongs to D^rig and realizes to X. |
| Rigidification.rationalCoefficients | non-example | The source’s rational-input refined TC⁻ remains the nuclear ind-object A*ku; its ordinary realization does not justify replacing it by ordinary p-completed TC⁻ of the rational input. |

Acceptance:

- The realized value of a constant dualizable object is the original object.
- A nuclear ind-object is not silently identified with its realized colimit.

### Killing an idempotent pro-algebra

**KillProAlgebra** · construction · RefinedTraceMethods:RT.5/algebra-killing

In a presentable symmetric monoidal stable C, a κ-small pro-object A=pro-lim_i A_i with left-unital multiplication and unit defines the full subcategory Ind(C)^A of M with extended internal Hom(A,M)=ind-colim_(i,k) Hom_C(A_i,M_k)=0. It has a reflector j*. If A is idempotent and eventually trace-class, the dual ind-object ind-colim_i A_i∨ is nuclear and idempotent and there is a cofiber ind-colim_i A_i∨ → 1 → j*(1). The reflector is then symmetric monoidal, j*(1) an idempotent E∞ algebra, and j*(M)≃M⊗j*(1). The ordinary-object version uses Hom_C(A,−)=0 and requires stabilization or sequential-Hom commutation for its iterative formula.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Constructions 2.6, 2.9 and 2.11, pp. 12–15; Proposition 2.14, pp. 15–16.

Direct prerequisites: RefinedTraceMethods:RT.5/trace-class; RefinedTraceMethods:RT.5/nuclear-objects; EnhancedDerivedSheaves:E5:presentability/ind-completion; EnhancedDerivedSheaves:E5:presentability; RefinedTraceMethods:RT.5/trace-class-functoriality; RefinedTraceMethods:RT.5/nuclear-closure.

Proof or construction outline:

1. Apply the reflective localization to the extended Hom-orthogonal subcategory.
2. For pro A iterate Hom(fib(1 → A),−); extended Hom commutes with filtered colimits in Ind.
3. For idempotent A the iteration stabilizes and gives the dual cofiber. Trace-class comparison of preduals makes this construction preserved by symmetric monoidal functors; general pro-algebras lack this asserted multiplicativity.

Uses deriving the API:

- RefinedTraceMethods:RT.5/refined-ku-computation: Killing the torsion q-Hodge pro-algebra gives the nuclear ind coefficient algebra and unit cofiber.

API:

| Name | Role | Statement |
|---|---|---|
| KillProAlgebra.unit | projection | The localization unit 1 → kill(A)=j*(1) fits into the stated cofiber. |
| KillProAlgebra.orthogonal | characterisation | Local objects are exactly those with extended internal Hom(A,M)=0. |
| KillProAlgebra.lift | universal-property | Maps from j*(M) to a local U identify with maps from M to U. |
| KillProAlgebra.tensor | structure | For idempotent eventually trace-class pro A, j*(M)≃M⊗kill(A), kill(A)⊗kill(A)≃kill(A). |
| KillProAlgebra.map | functoriality | Symmetric monoidal functors preserve the killing construction in the eventual trace-class idempotent setting. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| KillProAlgebra.killZero | degenerate | kill(0)≃1 and j* is the identity. |
| KillProAlgebra.killUnit | computation | kill(1)≃0 and the local subcategory is zero. |
| KillProAlgebra.ordinaryLocalization | compatibility | For C=D(Z), killing the constant dualizable algebra Z/p yields the ordinary derived p-inverted unit Z[1/p]; the iterative construction and map Z → Z[1/p] agree with derived scalar localization. |

Acceptance:

- Killing A=0 preserves the unit; killing A=1 gives zero.
- The symmetric monoidal claim has the idempotence hypothesis.

### Smooth and proper E-linear categories

**SmoothProperCategory** · definition · RefinedTraceMethods:RT.5/smooth-proper-category

Let E be rigid symmetric monoidal and X a dualizable E-module with relative dual X∨. Smoothness means the relative coevaluation E → X∨⊗_E X is strongly continuous; equivalently the absolute coevaluation takes the sphere to a compact object. Properness means the relative evaluation X⊗_E X∨ → E is strongly continuous. Both together say that X is dualizable in the monoidal category Catdual_E with strongly continuous morphisms. For an algebra model Mod_A over a compactly generated rigid base, smoothness is compactness of the diagonal A-bimodule and properness is compactness of A as an E-object. Preservation of compact objects alone is not used as a criterion for an arbitrary dualizable category.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Lemma 2.18, p. 18; Corollary 2.19, pp. 18–19; [Alexander I. Efimov](https://arxiv.org/pdf/2510.17010v1), §1.5, p. 19.

Direct prerequisites: RefinedTraceMethods:RT.5/dualizable-categories; RefinedTraceMethods:RT.5/rigid-category; EnhancedDerivedSheaves:E5:presentability/compact-objects; EnhancedDerivedSheaves:E5:presentability.

Proof or construction outline:

1. Use the relative evaluation and coevaluation from the dualizable-module interface.
2. Apply Efimov §1.5: strong continuity is the defining condition; for coevaluation it can be tested on the compact tensor unit of rigid E.
3. In compactly generated algebra models, test evaluation on the compact diagonal generators and identify the smooth/proper algebra criteria.

Uses deriving the API:

- RefinedTraceMethods:RT.5/refined-base-change: Smooth properness ensures restriction preserves trace-class maps and yields the base-change square.

API:

| Name | Role | Statement |
|---|---|---|
| SmoothProperCategory.evaluation | data | The relative evaluation is strongly continuous exactly under properness. |
| SmoothProperCategory.coevaluation | data | The relative coevaluation is strongly continuous exactly under smoothness. |
| SmoothProperCategory.algebraCriterion | characterisation | For an algebra model, smoothness is compactness of the diagonal as an A-bimodule and properness is compactness of A over E. |
| SmoothProperCategory.refinedValue | compatibility | For smooth proper X, Tref(X)≃constant T(X). Supplied by RefinedTraceMethods:RT.5/smooth-proper-normalization. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| SmoothProperCategory.unit | degenerate | The E-linear unit category E is smooth and proper over E. |
| SmoothProperCategory.field | computation | Perf(k) after Ind is smooth and proper over Mod_k with its diagonal k. |
| SmoothProperCategory.polynomialNotProper | non-example | Mod_(k[x]) is smooth over Mod_k but is not proper, since k[x] is not compact as a k-module. |

Acceptance:

- The unit category E is smooth and proper; Mod_(k[x]) is smooth but not proper over Mod_k.

### Refined invariants of smooth proper categories

**SmoothProperNormalization** · theorem · RefinedTraceMethods:RT.5/smooth-proper-normalization

For rigid symmetric monoidal E and a dualizable E-module X with strongly continuous relative evaluation and coevaluation, X is dualizable in Catdual_E. For the refined symmetric monoidal invariant Tref attached to T:Motloc_E → D, its value on X is the constant ind-object T(X). If a rigid symmetric monoidal X is smooth and proper over E, forgetting X-linearity preserves trace-class morphisms.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Lemmas 2.16 and 2.18, Corollary 2.19, pp. 17–19.

Direct prerequisites: RefinedTraceMethods:RT.5/smooth-proper-category; RefinedTraceMethods:RT.5/refined-invariant-universality; RefinedTraceMethods:RT.5/trace-class-functoriality.

Proof or construction outline:

1. The relative evaluation and coevaluation are morphisms of Catdual_E by the smooth/proper conditions; the PrL_E triangle identities hold there.
2. The identity on this dualizable object is trace-class, so its constant system gives the refined value (MW Lemma 2.16).
3. For restriction of scalars, use dualizability of X in Catdual_E to transport the trace-class classifier as in Corollary 2.19.

Acceptance:

- Retain the stated hypotheses and coherent comparison maps.

### Base change in the refined construction

**RefinedBaseChange** · theorem · RefinedTraceMethods:RT.5/refined-base-change

Let E → X be strongly continuous symmetric monoidal with E and X rigid and X smooth and proper over E. Forgetting X-linearity in Catdual preserves trace-class morphisms, so the refined functors computed over X and over E have their comparison induced by this map. For an additional symmetric monoidal colimit-preserving X → X′ and a dualizable algebra V₀ in X, the kernel V of X → X^{V₀} satisfies V⊗_X X′≃V′. The pro-algebra killing comparison is preserved after applying a symmetric monoidal functor when its transitions are eventually trace-class.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Corollary 2.19, pp. 18–19; Lemma 2.26, pp. 22–23; Remark 1.4, p. 3.

Direct prerequisites: RefinedTraceMethods:RT.5/smooth-proper-category; RefinedTraceMethods:RT.5/algebra-killing; RefinedTraceMethods:RT.5/trace-class; RefinedTraceMethods:RT.5/trace-class-functoriality; RefinedTraceMethods:RT.5/smooth-proper-normalization.

Proof or construction outline:

1. Use dualizability of X in Catdual_E to make its forgetful functor preserve the trace-class classifier.
2. Identify V as the tensor ideal generated by V₀ and use compactly generated reduction Ind(X^ω) → X.
3. Base-change the kernel adjunction; apply the preserved dual-ind cofiber for the multiplicative comparison.

Acceptance:

- The forgetful Motloc_(O_C) → Motloc does not in general preserve trace-class maps; no base-independent refinement is asserted.

### The refined localization cofiber

**LocalizationTowerFormula** · theorem · RefinedTraceMethods:RT.5/localization-tower-formula

Let E → X be as in the smooth proper base-change theorem, and T:Motloc_E → D symmetric monoidal colimit-preserving with D locally rigid and ω₁-compact unit. Let V₀ ← V₁ ← … be E₁-algebras in X, each dualizable and in thick⊗(V₀), such that V_(r+1)⊗V_r → V_r⊗V_r factors through multiplication V_(r+1)⊗V_r → V_r as a V_(r+1)–V_r bimodule map. For U={M | Hom_X(V₀,M)=0}, pro T(RMod_(V_r)(X)) is idempotent and eventually trace-class and Tref(U)≃kill(pro T(RMod_(V_r)(X))) as a T(X)-algebra. Thus ind-colim_r T(RMod_(V_r)(X))∨ → T(X) → Tref(U) is a cofiber in Nuc Ind(D).

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Theorem 2.21 and Lemmas 2.22–2.26, pp. 19–23; Corollary 2.30, p. 25.

Direct prerequisites: RefinedTraceMethods:RT.5/refined-invariant-universality; RefinedTraceMethods:RT.5/refined-base-change; RefinedTraceMethods:RT.5/algebra-killing; RefinedTraceMethods:RT.5/smooth-proper-category; EnhancedDerivedSheaves:E5:presentability; RefinedTraceMethods:RT.5/trace-class-functoriality.

Proof or construction outline:

1. Identify the localization kernel with colim_r Ind(LMod_(V_r)(X^ω))⊗_(Ind X^ω) X using the transition factorization.
2. In the bimodule category the factorization makes V_r a retract of V_r⊗V_r; that proves the required compactness and trace-class transition, not compactness of V_r merely over V_(r+1).
3. Apply T and the predual colimit comparison, then idempotent pro-algebra killing.

Acceptance:

- A Burklund tower for a dualizable v:I → 1 with right-unital quotient meets the factorization after passing to sufficiently separated exponents.
- The cofiber is in nuclear ind-objects with algebra structure, not merely a homotopy-group exact sequence.

### Circle fixed points and oriented completion

**CircleCompletionEquivalence** · theorem · RefinedTraceMethods:RT.5/circle-completion-equivalence

Let k be a complex orientable E∞ ring spectrum with trivial S¹ action, and choose t∈π_(−2)(k^hS¹) representing an orientation. Homotopy S¹ fixed points give a symmetric monoidal equivalence from coherent circle k-modules to derived t-complete k^hS¹-modules, whose tensor is t-completed. The left adjoint has underlying module reduction modulo t; no bounded-below hypothesis is imposed.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Lemma 3.2 and proof, pp. 29–30.

Direct prerequisites: RefinedTraceMethods:RT.2/spectra-with-action; RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points; RefinedTraceMethods:RT.2/circle-tate; DerivedDeRhamCohomology:DD.1/derived-completion; EnhancedDerivedSheaves:E5:presentability.

Proof or construction outline:

1. Construct the constant-action and scalar-extension left adjoint; its underlying module is reduction modulo t.
2. Check the tensor comparison and adjunction counit modulo t using the oriented circle cofiber identification.
3. Use conservativity of reduction modulo t on derived t-complete modules; full faithfulness and the conservative left adjoint give the equivalence.

Acceptance:

- Retain the stated hypotheses and coherent comparison maps.

### Refined THH and TC⁻

**RefinedTraces** · construction · RefinedTraceMethods:RT.5/refined-traces

For an E∞ ring k, refine the symmetric monoidal localizing relative THH functor Motloc_k → Mod_k(Sp)^BS¹, keeping its coherent circle action. The ordinary comparison is realization in that target. For complex orientable k and a chosen orientation t∈π_(−2)k^hS¹, refine TC⁻ into nuclear ind-objects of derived t-complete k^hS¹-modules with t-completed tensor. MW Lemma 3.2 identifies coherent circle k-modules with this completed module category. Finite-coefficient and rational-input computations use the induced maps between motives, units and localization cofibers.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Construction 1.7, p. 4; Convention 3.1, p. 28; Lemma 3.2, pp. 29–30.

Direct prerequisites: RefinedTraceMethods:RT.5/refined-invariant-universality; RefinedTraceMethods:RT.5/localization-tower-formula; RefinedTraceMethods:RT.2/relative-thh; RefinedTraceMethods:RT.2/thh-spectral-categories; RefinedTraceMethods:RT.2/thh-symmetric-monoidal; RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points; RefinedTraceMethods:RT.2/tc-minus-and-tp; EnhancedDerivedSheaves:E5:presentability; RefinedTraceMethods:RT.5/smooth-proper-normalization; RefinedTraceMethods:RT.5/circle-completion-equivalence.

Proof or construction outline:

1. Use RT.2’s actual relative THH with its circle action and multiplicative structure as the localizing invariant.
2. Construct the refined functor by target rigidification and its realization natural transformation.
3. For oriented k use the homotopy-fixed-point/completion equivalence; prove monoidality and equivalence modulo t via Nakayama and the adjunction, as in Lemma 3.2.

Uses deriving the API:

- RefinedTraceMethods:RT.5/refined-ku-computation: The relative refined TC⁻ invariant carries the unit, finite-coefficient localization and derived t-completion.
- RefinedTraceMethods:RT.6/habiro-trace-interface: Its ordinary realization and multiplicative trace maps are exported with the qualified finite-C_m data.

API:

| Name | Role | Statement |
|---|---|---|
| RefinedTraces.thh | constructor | THHref takes k-linear motives to the rigidification of coherent S¹ k-modules. |
| RefinedTraces.tcMinus | constructor | For oriented k, TC−,ref is the corresponding nuclear derived t-complete module object. |
| RefinedTraces.ordinary | projection | Realization gives natural multiplicative maps from refined values to ordinary THH/TC⁻. |
| RefinedTraces.map | functoriality | Maps of k-linear motives induce coherent circle maps and the completed TC⁻ maps, with identity and composition. |
| RefinedTraces.fixedPointComparison | equivalence | Homotopy S¹ fixed points are symmetric monoidal between coherent k-modules and t-complete k^hS¹-modules under the complex-orientation hypothesis. Supplied by RefinedTraceMethods:RT.5/circle-completion-equivalence. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| RefinedTraces.zeroMotive | degenerate | Both refined invariants of the zero motive are zero. |
| RefinedTraces.unitMotive | computation | For the smooth proper unit Mod_k, THHref is constant k with trivial circle action and TC−,ref is constant k^hS¹ in its complete module target. |
| RefinedTraces.rationalKu | non-example | TC−,ref((ku⊗Q)/ku) has the nonzero source coefficient ind-algebra A*ku; ordinary p-completed rational THH does not determine it. |

Acceptance:

- The ordinary p-completed THH of a rational input can vanish while the refined nuclear ind-object retains p-complete information.
- The target tensor is t-completed; the ordinary module tensor is not substituted.

### High-powered positive integers

**HighPowered** · definition · RefinedTraceMethods:RT.5/high-powered

HighPowered(m) means m>0, every odd prime p has m.factorization(p)=0 or at least 2, and m.factorization(2)=0 or an even integer at least 4. These m form the divisibility poset N used for the compatible E₁ Moore tower. For every positive d, d⁴ is high-powered and d divides d⁴, so restriction to N is coinitial in the inverse divisibility diagram.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), §3.1, paragraph 3.3, p. 30.

Direct prerequisites: mathlib:Nat.factorization; mathlib:Nat.factorization_pow.

Proof or construction outline:

1. Use Mathlib’s prime factorization at the pinned commit, imposing positivity separately since factorization(0)=0.
2. Multiply all prime exponents by four to show the fourth-power coinitiality witness.
3. Import multiplicative Moore structures from H.6; the arithmetic predicate itself supplies no E₁ structure.

Uses deriving the API:

- RefinedTraceMethods:RT.5/pro-qhodge-idempotence: The cofinal high-powered m³→m² tower supports compatible Moore multiplications.
- RefinedTraceMethods:RT.5/graded-trace-class: The m³→m transition supplies bounded-amplitude trace-class maps.

API:

| Name | Role | Statement |
|---|---|---|
| HighPowered.pos | projection | HighPowered(m) implies m>0. |
| HighPowered.twoExponent | projection | The exponent at 2 is zero or is even and at least four. |
| HighPowered.oddExponent | projection | At each odd prime p, the exponent is zero or at least two. |
| HighPowered.fourthPower | constructor | For every d>0, d⁴ is high-powered and d divides d⁴. |
| HighPowered.factorizationCriterion | characterisation | The arithmetic predicate is exactly the given conditions on Mathlib Nat.factorization. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| HighPowered.one | degenerate | HighPowered(1). |
| HighPowered.nineAndSixteen | computation | HighPowered(9) and HighPowered(16). |
| HighPowered.excludeZeroEightThirtyTwo | non-example | Neither 0 nor 8 nor 32 is high-powered; the last fails the even-exponent condition, though the exponent is ≥4. |

Acceptance:

- 1,9,16,64 satisfy the predicate; 0,3,8,32 do not.

### Finite-coefficient TC⁻ and q-Hodge complexes

**TorsionQhodge** · comparison · RefinedTraceMethods:RT.5/torsion-qhodge

Choose the compatible E₁ quotient spectra S/m for high-powered m. Then TC⁻((ku⊗S/m)/ku) and TC⁻((KU⊗S/m)/KU) are even; their even homotopy identifies with respectively Fil*qHdg(derived qdR(Z/m)/Z) over Z[β][[t]], and qHdg(derived qdR(Z/m)/Z)[β±¹] over Z[[q−1]]. Both carry the chosen even filtration, the specified E₁-induced multiplicative data, and quotient transition maps. Any p=2 application requires RT.4’s separate E₁ even-resolution input; Wagner’s general theorem with 2 invertible and a connective spherical E₂ lift alone does not supply it.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Corollary 3.8, p. 32; finite-coefficient calculation, pp. 30–32.

Direct prerequisites: RefinedTraceMethods:RT.5/high-powered; StableHomotopyKTheory:H.6; RefinedTraceMethods:RT.4:topological/homotopy-of-ku; RefinedTraceMethods:RT.4:topological/bott-localisation; RefinedTraceMethods:RT.4:topological/relative-thh-ku; RefinedTraceMethods:RT.4:topological/ku-circle-actions; RefinedTraceMethods:RT.4:q-Hodge/q-hodge-global; RefinedTraceMethods:RT.4:q-Hodge/p-complete-comparison-odd; RefinedTraceMethods:RT.4:q-Hodge/p-complete-comparison-two; RefinedTraceMethods:RT.4:q-Hodge/compatible-spherical-lifts; RefinedTraceMethods:RT.4:q-Hodge/cyclonic-even-filtrations; RefinedTraceMethods:RT.4:Habiro-comparison/twisted-q-hodge-comparison; RefinedTraceMethods:RT.4:Habiro-comparison/habiro-comparison-theorem; HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations; HabiroCohomologyFoundations:HQ.3/the-q-hodge-complex; HabiroCohomologyFoundations:HQ.3.

Proof or construction outline:

1. Use the compatible H.6 Moore-algebra tower, not the bare cofiber definition.
2. Apply the source-qualified q-Hodge comparison and the derived Hodge deformation for Z/m.
3. Use the periodic comparison theorem for KU, preserving completion and coherent quotient maps. The p=2 supplier refinement is an explicit request.

Acceptance:

- For odd p and exponent ≥2, the derived deformation reduces modulo q−1 to the Hodge filtration of derived dR(Z/p^a).
- Do not replace this chosen filtration by an asserted universal section on animated algebras.

### Filtered derived Hom of even spectra

**EvenDerivedHom** · theorem · RefinedTraceMethods:RT.5/even-derived-hom

For an even E₁ ring k and even k-modules M,N, RHom_k(M,N) has the source’s complete exhaustive decreasing filtration with gr^n ≃ Σ^(2n) RHom_(π2*k)(π2*M,π2*N)(−n) in graded derived modules. Use the double-speed Whitehead filtrations, derived rather than ordinary Hom, and the source’s connectivity bounds to prove completeness/exhaustiveness; no degeneration is asserted without the subsequent Ext-amplitude calculation.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Lemma 3.9 and proof, p. 33.

Direct prerequisites: StableHomotopyKTheory:H.6; StableHomotopyKTheory:H.5:spectra; EnhancedDerivedSheaves:E5:presentability.

Proof or construction outline:

1. Apply filtered internal Hom to the double-speed Whitehead filtrations.
2. Compute the associated graded by the graded-module comparison and shearing.
3. The connective/coconnective bounds in MW Lemma 3.9 show vanishing at the complete end and stable values at the exhaustive end.

Acceptance:

- For the even free rank-one module M=k, this agrees with N and its Whitehead filtration.

### The dual finite-coefficient TC⁻ spectra

**TorsionDuality** · theorem · RefinedTraceMethods:RT.5/torsion-duality

For high-powered m, the k^hS¹-linear duals of TC⁻((k/m)/k), k=ku or KU, have only odd homotopy and are computed by Ext¹ of the corresponding even graded q-Hodge module over the derived-complete graded coefficient ring; all other Ext groups contributing to the filtration vanish in this calculation. The ku coefficient ring is Z[β][[t]] and the KU coefficient ring Z[[q−1]][β±¹].

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Corollary 3.10 and proof, pp. 33–34.

Direct prerequisites: RefinedTraceMethods:RT.5/torsion-qhodge; RefinedTraceMethods:RT.5/even-derived-hom.

Proof or construction outline:

1. For ku reduce the RHom computation through the regular parameters β and t to RHom_Z(Z/m,Z), which has its torsion contribution in Ext¹.
2. For KU use the ascending qHdg filtration with Z/m graded pieces and its complete Hom product.
3. Apply Lemma 3.9 and the Ext-amplitude calculation to obtain the odd-degree dual and its transition maps.

Acceptance:

- The dual of Z/m in D(Z) contributes Ext¹=Z/m, not ordinary Hom_Z(Z/m,Z)=0.

### The completed tensor filtration

**EvenCompletedTensor** · theorem · RefinedTraceMethods:RT.5/even-completed-tensor

Let k be an even E∞ ring spectrum and t∈π_(2*)k a homogeneous element. For even k-modules M,N, the t-completed tensor M⊗̂_k N admits a complete exhaustive double-speed Whitehead filtration whose graded pieces are the double shearing of the derived t-completed graded tensor of π_(2*)M and π_(2*)N over π_(2*)k. The construction is functorial and compatible with products under its source hypotheses. The proof tracks connectivity and the at-most-one-degree loss in coconnectivity under derived completion; tensor is not assumed t-exact or underived.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Lemma 3.11 and proof, pp. 34–35.

Direct prerequisites: RefinedTraceMethods:RT.5/even-derived-hom; StableHomotopyKTheory:H.5:spectra; EnhancedDerivedSheaves:E5:presentability; StableHomotopyKTheory:H.6.

Proof or construction outline:

1. Construct the filtered tensor on Whitehead filtrations.
2. Identify associated graded and apply derived t-completion with its connectivity estimate.
3. Use those estimates for both ends of the filtration before using the comparison on bounded-amplitude torsion inputs.

Acceptance:

- Derived tensor of Z/m with itself has Tor₁; the comparison retains that extra degree.

### Pro-idempotence of the finite-coefficient q-Hodge system

**ProQhodgeIdempotence** · theorem · RefinedTraceMethods:RT.5/pro-qhodge-idempotence

The inverse systems of even graded TC⁻ coefficients in the ku and KU finite-coefficient calculations are idempotent pro-algebras. Idempotence follows by factoring m³ → m² coefficient transition products through multiplication as bimodule maps using the compatible Moore-algebra tower. In the derived graded completed setting the resulting tensor comparison has amplitude [0,1] and its identification with spectrum homotopy is justified by the even Whitehead filtration.

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Corollary 3.12 and proof, p. 35; Corollary 2.30, p. 25.

Direct prerequisites: RefinedTraceMethods:RT.5/torsion-qhodge; RefinedTraceMethods:RT.5/even-completed-tensor; StableHomotopyKTheory:H.6.

Proof or construction outline:

1. Import the factorization of the multiplicative Moore transitions.
2. Apply TC⁻ and the complete filtered tensor comparison.
3. Use the bounded-amplitude double Whitehead identification to transfer the factorization to graded homotopy, then check both unit maps into the pro tensor.

Acceptance:

- The result holds as a pro-algebra equivalence; it is not termwise idempotence of each finite coefficient algebra.

### Trace-class finite-coefficient transitions

**GradedTraceClass** · theorem · RefinedTraceMethods:RT.5/graded-trace-class

For high-powered m the map from the m³ finite-coefficient graded q-Hodge algebra to the m algebra is trace-class over Z[β][[t]] (ku) or Z[[q−1]] (KU), in the derived-complete category. The corresponding spectrum classifier passes to the graded classifier because its dual-tensor has amplitude [−1,0].

Source: [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), Corollary 3.13 and proof, p. 36.

Direct prerequisites: RefinedTraceMethods:RT.5/torsion-duality; RefinedTraceMethods:RT.5/even-completed-tensor; RefinedTraceMethods:RT.5/pro-qhodge-idempotence; RefinedTraceMethods:RT.5/trace-class; StableHomotopyKTheory:H.6.

Proof or construction outline:

1. Use the trace-class witness for the category-level quotient transition in the localization recipe.
2. Calculate the dual-tensor amplitude and identify the classifier through double Whitehead filtration.
3. Check that evaluation of the resulting graded classifier equals the quotient transition.

Acceptance:

- The transition is m³ → m; termwise identities are not claimed trace-class.

### Continuous K-theory of almost modules

**AlmostModuleKTheory** · application · RefinedTraceMethods:RT.5/almost-module-k

Let A be a commutative Banach ring with topologically nilpotent unit T and compatible n-th roots for an unbounded increasing sequence n_i. Put I=A_<1. For any commutative unitization B in which I is an ideal, I is flat and idempotent over B (hence Tor-unital), D(B) → D(B/I) is a strongly continuous Verdier localization, and its kernel is the dualizable stable category D(B^a) of almost B-modules relative to I. Kcont(D(B^a))≃fib(K(B) → K(B/I)), independently of B, because this kernel identifies with the derived category of firm I-modules M with M⊗^L_I I≃M. K denotes the imported concrete nonconnective theory.

Source: [Peter Scholze](https://arxiv.org/pdf/2412.03382v3), §8, almost-module paragraph before Proposition 8.7, pp. 46–47.

Direct prerequisites: RefinedTraceMethods:RT.5/continuous-extension; RefinedTraceMethods:RT.5/dualizable-categories; GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation; GeneralAlgebraicKTheory:K.6; GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance.

Proof or construction outline:

1. The roots of T identify I with a filtered colimit of copies of B with transitions T^(1/n_i−1/n_(i+1)), proving flatness and idempotence.
2. Thus B/I is an idempotent derived B-algebra and the localization kernel is dualizable; identify it with firm I-modules using the same colimit.
3. Apply the continuous localizing invariant to the strongly continuous exact sequence. This gives both the fiber and unitization independence without redefining K.

Acceptance:

- For I=0 the kernel and Kcont are zero.
- The theorem requires the specified root and unit hypotheses; a general Banach-ring maximal ideal need not be flat idempotent.
- The fiber is a spectrum equivalence with the inclusion and quotient maps.

## RT.6: Habiro interfaces and verification

Atlas planets: THH of perfectoid rings; Quasiregular semiperfectoid THH; Trace Nygaard complex; Motivic filtrations; Crystalline trace comparison; Trace-to-AΩ comparison.

### Trace-to-prismatic Nygaard completion

**TracePrismaticComparison** · comparison · RefinedTraceMethods:RT.6/trace-prismatic-comparison

For quasisyntomic A, the trace complex C_A constructed by unfolding π₀TC⁻ on QRSP covers is naturally equivalent, as a multiplicative filtered complex with Frobenius, to the Nygaard completion of the imported prismatic Δ_A. On QRSP S, π₀TC⁻(S;Z_p) = π₀TP(S;Z_p) has its canonical δ-structure and Δ_S → C_S identifies C_S with the Nygaard completion, compatibly with the divided Frobenius maps. This is not a definition of Δ and does not identify Δ with its completion in general.

Source: [Bhargav Bhatt and Peter Scholze](https://arxiv.org/pdf/1905.08229v4), Theorem 13.1 and proof, pp. 94–96.

Direct prerequisites: RefinedTraceMethods:RT.6/trace-nygaard-complex; RefinedTraceMethods:RT.6/trace-noncompleted-extension; RefinedTraceMethods:RT.6/aomega-comparison; RefinedTraceMethods:RT.6/segal-oc; RefinedTraceMethods:RT.6/crystalline-trace-comparison; PrismaticCohomology:PR.2/qrsp-prism; PrismaticCohomology:PR.3/nygaard-completion; PrismaticCohomology:PR.3/bms2-comparison.

Proof or construction outline:

1. Use BS Theorem 13.1’s prismatic recognition input from PR.3, not a TC-defined prism.
2. After André cover and left Kan extension, compare noncompleted trace cohomology with Δ on regular semiperfectoid quotients.
3. Use the characteristic-p crystalline computation for the reduction, then derived Nakayama along Ainf → Acrys → Ainf/(p,d). Complete the Nygaard filtration and unfold by quasisyntomic descent.

Acceptance:

- A perfectoid ring yields Ainf with its Nygaard filtration.
- Maps can and divided Frobenius commute with the comparison.

### The graded BMS2 trace comparison

**GradedMotivicComparison** · comparison · RefinedTraceMethods:RT.6/graded-motivic-comparison

For quasisyntomic A, gr^iTHH(A;Z_p) ≃ N^i(C_A){i}[2i], gr^iTC⁻(A;Z_p) ≃ N^{≥i}(C_A){i}[2i], and gr^iTP(A;Z_p) ≃ C_A{i}[2i]. Here N^i is the cofiber of N^{≥i+1} → N^{≥i}, twists are completed filtered Breuil–Kisin modules, and C_A is identified with the imported completed prismatic object. The equivalences preserve products, can and Frobenius. N^i(C_A){i} ≃ N^i(C_A) has the source’s canonical specialization, not a global chosen basis for every twist.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Theorem 1.12(4), pp. 210–211; Proposition 7.13, pp. 259–260.

Direct prerequisites: RefinedTraceMethods:RT.6/motivic-filtrations; RefinedTraceMethods:RT.6/trace-breuil-kisin-twist; RefinedTraceMethods:RT.6/trace-prismatic-comparison.

Proof or construction outline:

1. Compute on QRSP where even Postnikov graded pieces equal the even homotopy sheaves.
2. Use the complete Nygaard filtration and its graded THH calculation.
3. Unfold the multiplicative comparison and twist identifications to all quasisyntomic rings.

Acceptance:

- For perfectoid R, gr^iTHH is R{i}[2i] for i≥0 and zero for i<0.
- For a smooth algebra the cohomological graded pieces may give odd THH homotopy; the theorem does not assert global evenness.

### Syntomic complexes as graded TC

**SyntomicGradedTc** · comparison · RefinedTraceMethods:RT.6/syntomic-graded-tc

For quasisyntomic A and i≥0, gr^iTC(A;Z_p) ≃ Z_p(i)(A)[2i], where Z_p(i) is the independently constructed PR.4 syntomic fiber of divided Frobenius minus can from N^{≥i} completed Δ_A{i} to completed Δ_A{i}. The filtered TC construction is fib(φ−can: Fil^iTC⁻ → Fil^iTP); its graded map identifies with the imported syntomic map. Finite coefficients are derived tensor with Z/p^n.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Theorem 1.12(5), p. 211; §7.4, p. 261, corrected weight index.

Direct prerequisites: RefinedTraceMethods:RT.6/graded-motivic-comparison; RefinedTraceMethods:RT.6/filtered-frobenius; PrismaticCohomology:PR.4/syntomic-complex.

Proof or construction outline:

1. Take the filtered fiber of the two maps to TP.
2. In the stable complete filtered category, taking graded pieces commutes with finite limits.
3. Use the Frobenius-compatible trace/prismatic comparison and the imported syntomic definition; the weight equals i in both the shift and the filtration.

Acceptance:

- Weight zero is the fiber of φ−1 on the trace complex.
- Products land in weight i+j through the lax monoidal fiber construction, not by subtracting two algebra maps in commutative algebras.

### The coherent trace interface for Habiro cohomology

**HabiroTraceInterface** · comparison · RefinedTraceMethods:RT.6/habiro-trace-interface

For the supplied RT.4 q-Hodge and Habiro inputs satisfying Wagner 4.18(A),(R), 4.18a(R2), and, in Theorem 5.63, 2∈R× and 5.43(A2), export the coherent S¹ and genuine finite-C_m cyclonic maps, complete even filtration and graded q-Hodge module comparison diagrams. Retain Σ^(−2i) shearing, Bott inversion, and completion. Theorem 4.27 has an E_(n−1) multiplicative enhancement only under Remark 4.28’s chosen E_n lift hypotheses (2≤n≤∞); an enhancement of the Habiro comparison must be supplied separately by RT.4 and is not inferred from the module equivalence of Theorem 5.63. For R=O_F[1/Δ], require 6|Δ, disc(F)|Δ and the specified spherical étale lift. This is the trace input for HQ/HR descent, with the periodic reconstruction proof; it does not assert Habiro descent for the refined rational TC⁻ ind-algebras.

Source: [Ferdinand Wagner](https://arxiv.org/pdf/2510.06057v1), Theorem 4.27 and Remark 4.28, p. 50; 4.18(A),(R), p. 46; 4.18a(R2), p. 49; 5.43(A2), p. 70; Theorem 5.63, pp. 79–80; Corollary 6.15, p. 86.

Direct prerequisites: RefinedTraceMethods:RT.5/refined-traces; RefinedTraceMethods:RT.4:q-Hodge/q-hodge-global; RefinedTraceMethods:RT.4:q-Hodge/q-hodge-multiplicativity; RefinedTraceMethods:RT.4:q-Hodge/cyclonic-ku; RefinedTraceMethods:RT.4:q-Hodge/cyclonic-base-coherence; RefinedTraceMethods:RT.4:q-Hodge/compatible-spherical-lifts; RefinedTraceMethods:RT.4:Habiro-comparison/twisted-q-hodge-comparison; RefinedTraceMethods:RT.4:Habiro-comparison/habiro-comparison-theorem; RefinedTraceMethods:RT.4:Habiro-comparison/etale-einfty-lift; RefinedTraceMethods:RT.4:Habiro-comparison/number-field-habiro; HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations; HabiroCohomologyFoundations:HQ.3/the-q-hodge-complex; HabiroCohomologyFoundations:HQ.4/the-arithmetic-fracture-squares-and-cyclotomic-descent; HabiroCohomologyFoundations:HQ.4/no-automatic-multiplicative-upgrade; HabiroRings:HR.2/habiro-complete-modules; HabiroRings:HR.2/the-monoidal-structure; HabiroRings:HR.2/habiro-complete-solid-spectra; HabiroRings:HR.5/the-relative-habiro-ring; HabiroRings:HR.5/completed-base-change.

Proof or construction outline:

1. Take the coherent finite-C_m comparison from RT.4, with genuine fixed points before residual-circle homotopy fixed points.
2. Apply the chosen q-Hodge modification and the Habiro-complete descent functor to the module comparison. Retain only the multiplicative structure separately established under the specified lift hypotheses.
3. Check the Bott localization square and Σ^(−2i) shearing before identifying the arithmetic coefficient ring.

Acceptance:

- A periodic nonconnective KU input uses the imported periodic reconstruction proof.
- At primes 2 or 3 the stated number-field comparison is not applied without the required localization.
- The module comparison of Theorem 5.63 alone supplies no E∞ upgrade.

### Flat and quasisyntomic descent for trace spectra

**TraceFlatDescent** · theorem · RefinedTraceMethods:RT.6/trace-flat-descent

HH(−/R), HC⁻(−/R), HH(−/R)_hS¹ and HP(−/R) on commutative R-algebras, and THH, TC⁻, THH_hS¹ and TP on commutative rings, are fpqc sheaves in spectra. Their derived p-complete variants have descent for p-completely faithfully flat covers in QSyn; QRSP basis unfolding recovers them. THH(−)^tC_p has the same Čech descent by the finite-group norm sequence. The argument proves this descent with its weak Postnikov towers; it does not assert arbitrary fpqc hyperdescent for every cotangent complex.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Corollary 3.4 and Remark 3.5, pp. 218–219; §4.6, pp. 228–230.

Direct prerequisites: RefinedTraceMethods:RT.1/hochschild-homology; RefinedTraceMethods:RT.1/cyclic-homology; RefinedTraceMethods:RT.1/hkr-filtration; RefinedTraceMethods:RT.2/thh-e1-ring; RefinedTraceMethods:RT.2/thh-over-thhz; RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points; RefinedTraceMethods:RT.2/norm-map-tate; RefinedTraceMethods:RT.2/circle-tate; RefinedTraceMethods:RT.2/tc-minus-and-tp; DerivedDeRhamCohomology:DD.0/cotangent-complex; DerivedDeRhamCohomology:DD.5/completed-cotangent-descent; DerivedDeRhamCohomology:DD.5/quasisyntomic-site; DerivedDeRhamCohomology:DD.1/derived-completion.

Proof or construction outline:

1. Apply the imported cotangent-exterior-power descent to the complete HKR filtration.
2. For homotopy orbits use the weak Postnikov-tower connectivity lemma and perfect finite truncations of the circle chain complex. Homotopy fixed points preserve limits; the norm cofiber then handles periodic/Tate constructions.
3. Reduce THH to HH through THH(Z) → Z and the finite/pseudocoherent Postnikov truncations supplied by RT.2. Derived p-completion and the QRSP basis comparison supply p-complete descent.

Acceptance:

- For a faithfully flat polynomial Čech cover the augmentation is an equivalence of trace spectra.
- TP descent is proved through the norm sequence, not by assuming Tate preserves arbitrary limits.

### Even Hochschild homology on quasiregular covers

**QrspHochschild** · theorem · RefinedTraceMethods:RT.6/qrsp-hochschild

For S∈qrsPerfd_R, or for a QRSP algebra over a perfectoid R or over Z_p as in Lemma 5.14, let M=(L_(S/R)[−1])^∧p. M is p-completely flat, HH(S/R;Z_p) is even, and π_(2i)HH(S/R;Z_p)≃(Γ^i_S M)^∧p for i≥0. The HKR filtration has these terms; divided powers are over S, not over the perfectoid base R.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Lemma 5.14, p. 241; use in Theorem 7.1, pp. 254–255.

Direct prerequisites: DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings; DerivedDeRhamCohomology:DD.0/cotangent-complex; DerivedDeRhamCohomology:DD.0/derived-divided-powers; RefinedTraceMethods:RT.1/hochschild-homology; RefinedTraceMethods:RT.1/hkr-filtration.

Proof or construction outline:

1. The QRSP cotangent complex has p-complete Tor amplitude in degree −1.
2. The imported integral derived HKR filtration has exterior-power terms; wedge powers of the shifted flat module give divided powers in homotopical degree 2i.
3. Connectivity and p-complete flatness identify the filtration pieces without odd groups.

Acceptance:

- For S=R, only π₀HH(S/R) survives.
- The divided-power coefficient ring is S, as corrected in the proof of Theorem 7.1.

### Negative and periodic cyclic homology from derived de Rham

**CyclicDerhamComparison** · comparison · RefinedTraceMethods:RT.6/cyclic-derham-comparison

For quasisyntomic A over a fixed base R in BMS2 §5.2, the unfolded even Postnikov filtrations on p-complete HC⁻ and HP are complete exhaustive multiplicative Z-indexed filtrations, with gr^iHC⁻(A/R;Z_p)≃Hodge^{≥i}(Hodge-completed derived dR(A/R))^∧p[2i] and gr^iHP≃(Hodge-completed derived dR(A/R))^∧p[2i]. On QRSP covers π₀HC⁻ with its abutment filtration identifies with the Hodge-and-p-completed derived dR algebra, including the de Rham differential. This compares existing cyclic objects and existing derived dR, rather than defining a new dR.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Proposition 5.15; Theorem 1.17 and proof, pp. 241–242.

Direct prerequisites: RefinedTraceMethods:RT.6/qrsp-hochschild; RefinedTraceMethods:RT.6/trace-flat-descent; DerivedDeRhamCohomology:DD.2/hodge-completed-derham; DerivedDeRhamCohomology:DD.1/filtered-completion; RefinedTraceMethods:RT.1/mixed-complex; RefinedTraceMethods:RT.1/cyclic-homology; RefinedTraceMethods:RT.1/hkr-filtration.

Proof or construction outline:

1. Use the degenerate even HH fixed-point spectral sequence on QRSP rings.
2. Identify its Beilinson-heart differential through the polynomial one-variable calculation and left Kan extension.
3. Unfold, compare graded pieces and use completeness/conservativity; exhaustiveness follows from eventual stabilization in each homotopy degree.

Acceptance:

- For R[x], the differential x ↦ dx agrees with Connes B through the imported HKR map.
- The HP graded piece uses all Hodge-completed dR, not a Hodge truncation.

### The perfectoid trace coefficient presentation

**TracePresentation** · construction · RefinedTraceMethods:RT.6/uv-presentation

For a commutative ring A and ξ∈A form P(A,ξ)=A[u,v]/(uv−ξ), with assigned homotopical degrees |u|=2, |v|=−2 and coefficients in degree 0. Its underlying ring is Mathlib’s quotient of MvPolynomial(Fin 2,A) by the principal ideal (X₀X₁−Cξ). There are maps can:P(A,ξ) → A[σ±¹] sending u↦ξσ,v↦σ⁻¹, and, for φ:A → A a ring endomorphism, frobenius sending coefficients through φ, u↦σ,v↦φ(ξ)σ⁻¹. The latter is φ-semilinear. These concrete maps are the algebraic signatures of the perfectoid TC⁻/TP calculation; their spectral realization is a distinct theorem.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Proposition 6.2 and diagram (1), pp. 245–247.

Direct prerequisites: mathlib:MvPolynomial; mathlib:Ideal.Quotient.mk; mathlib:Ideal.Quotient.lift; mathlib:LaurentPolynomial; mathlib:LaurentPolynomial.C; mathlib:LaurentPolynomial.T.

Proof or construction outline:

1. Form the quotient by the displayed homogeneous relation using the existing polynomial and ideal quotient constructions.
2. Descend the two evaluation ring maps to Laurent polynomials because uv maps respectively to ξ and φ(ξ).
3. Assign the source/target grades and compare them with the spectral coefficient degrees in Proposition 6.2. The suggested file prototypes the underlying rings and maps; grading and spectrum comparison have separate gaps.

Uses deriving the API:

- RefinedTraceMethods:RT.6/perfectoid-tc-maps: The uv relation and two scalar-normalized maps give the perfectoid coefficient square.
- RefinedTraceMethods:RT.6/relative-dvr-coefficients: The same quotient API is used with the Frobenius-twisted frakS base and Eisenstein parameter.

API:

| Name | Role | Statement |
|---|---|---|
| TracePresentation.coeff | constructor | The scalar map A → P(A,ξ). |
| TracePresentation.u | data | The class of X₀ has degree 2. |
| TracePresentation.v | data | The class of X₁ has degree −2. |
| TracePresentation.uv | relation | u·v equals the scalar class of ξ. |
| TracePresentation.lift | universal-property | For a ring map f:A → B and a,b∈B with ab=f(ξ), there is a unique ring map P(A,ξ) → B with coefficients f and u↦a,v↦b. |
| TracePresentation.ext | extensionality | Ring maps out of P(A,ξ) agree if they agree on all scalars and on u,v. |
| TracePresentation.can | constructor | The A-linear ring map to LaurentPolynomial(A) takes u to C(ξ)T(1) and v to T(−1). |
| TracePresentation.frobenius | constructor | For φ:A → A, the φ-semilinear map to LaurentPolynomial(A) takes scalars a to C(φ(a)), u to T(1), v to C(φ(ξ))T(−1). |
| TracePresentation.map | functoriality | For f:A → B and f(ξ)=η, the universal lift gives P(A,ξ) → P(B,η), mapping coefficients by f and preserving u,v. Its identity and composition laws follow from generator extensionality. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| TracePresentation.canGenerators | computation | can(u)=C(ξ)T(1), can(v)=T(−1). |
| TracePresentation.frobeniusScalars | characterisation | frobenius(φ,coeff(a))=C(φ(a)); its u and v images have product C(φ(ξ)). |
| TracePresentation.zeroParameter | degenerate | In P(A,0), u·v=0. |
| TracePresentation.unitParameter | compatibility | P(A,1) is isomorphic to LaurentPolynomial(A), taking u to T(1),v to T(−1), and can is that isomorphism. |

Acceptance:

- The Frobenius map must apply φ to scalar ξ in the relation.
- Setting ξ=0 gives uv=0, not the polynomial ring in independent u,v.

### THH of a perfectoid ring

**PerfectoidThh** · theorem · RefinedTraceMethods:RT.6/perfectoid-thh

For perfectoid R, THH(R;Z_p) is even and π_*≃R[u], |u|=2, with π₂ canonically ker θ/(ker θ)². For a perfectoid map R → R′ the scalar-extension map π_*THH(R;Z_p)⊗_R R′ → π_*THH(R′;Z_p) is an isomorphism. A choice of generator ξ of ker θ determines u up to the specified unit change; the canonical line precedes any chosen basis.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Theorem 6.1 and proof, pp. 243–244.

Direct prerequisites: AInfCohomology:AI.0; KTheoryFiniteLocalFields:L.5; RefinedTraceMethods:RT.2/thh-e1-ring; RefinedTraceMethods:RT.2/thh-symmetric-monoidal; DerivedDeRhamCohomology:DD.0/cotangent-complex; DerivedDeRhamCohomology:DD.1/derived-completion.

Proof or construction outline:

1. Use Bökstedt’s THH(F_p)=F_p[u] and the finite/pseudocoherent THH(Z) Postnikov comparison.
2. Compute after the characteristic-p perfectoid reduction by derived Nakayama; exclude spurious divided-power multiplication using rational HH rank and the generator map.
3. Identify π₂ from the cotangent/conormal line and use functoriality for perfectoid base change.

Acceptance:

- R=F_p gives Bökstedt polynomial multiplication, not a divided-power algebra.

### Perfectoid TC⁻ and TP with can and Frobenius

**PerfectoidTcMaps** · theorem · RefinedTraceMethods:RT.6/perfectoid-tc-maps

For perfectoid R let A=Ainf(R), θ:A → R, ξ generate ker θ, and θ̃=θ∘φ⁻¹. With compatible generators, π_*TC⁻(R;Z_p)=P(A,ξ), π_*TP=A[σ±¹], and π_*THH(R;Z_p)^tC_p=R[σ±¹]. The canonical map TC⁻ → TP is A-linear and u↦ξσ,v↦σ⁻¹; the cyclotomic Frobenius is φ-semilinear and u↦σ,v↦φ(ξ)σ⁻¹. The vertical maps to THH and THH^tC_p use θ and θ̃ respectively. π₀TC⁻≃Ainf is canonical and Frobenius-compatible, although chosen generators depend on ξ.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Propositions 6.2–6.3, pp. 245–247.

Direct prerequisites: RefinedTraceMethods:RT.6/perfectoid-thh; RefinedTraceMethods:RT.6/uv-presentation; AInfCohomology:AI.0; KTheoryFiniteLocalFields:L.5; RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh; RefinedTraceMethods:RT.2/tc-minus-and-tp; RefinedTraceMethods:RT.2/tc-fibre-sequence.

Proof or construction outline:

1. Use the degenerate homotopy-fixed-point and Tate spectral sequences with their filtrations.
2. Resolve the extension uv=ξ, normalizing a generator by a unit.
3. Use the finite-field Frobenius and the Fontaine maps to identify can, φ and both vertical specializations in the commutative square.

Acceptance:

- At a perfect characteristic-p R, ξ=p; can(u)=pσ and φ(u)=σ remain different maps.
- θ and θ̃ are not silently conflated.

### TC⁻/v and TP/φ(ξ)

**PerfectoidQuotientComparison** · comparison · RefinedTraceMethods:RT.6/perfectoid-quotient-comparison

For any connective E∞ R-algebra A over a perfectoid R, the derived quotients TC⁻(A;Z_p)/v ≃ THH(A;Z_p) and TP(A;Z_p)/φ(ξ) ≃ THH(A;Z_p)^tC_p are equivalences as modules with their induced maps. Quotient by v means the cofiber of its degree −2 multiplication map, not an ordinary ideal quotient on homotopy groups.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Proposition 6.4 and proof, pp. 247–248.

Direct prerequisites: RefinedTraceMethods:RT.6/perfectoid-tc-maps; RefinedTraceMethods:RT.2/relative-thh; RefinedTraceMethods:RT.2/tate-multiplicativity; RefinedTraceMethods:RT.2/tc-minus-and-tp.

Proof or construction outline:

1. Use the relative THH(R)-module structure.
2. The homotopy-fixed-point/Tate filtrations and the perfectoid coefficient relations identify the cofibers with the underlying and finite-Tate spectra.
3. Use the weak Postnikov comparison to pass from the base to all connective R-algebras.

Acceptance:

- For R itself, the first quotient yields R[u] by θ and v=0, while the second uses θ̃ and φ(ξ)=0.

### THH as a deformation of Hochschild homology

**ThhHochschildDeformation** · theorem · RefinedTraceMethods:RT.6/thh-hochschild-deformation

For ordinary R-algebra A with R perfectoid, the class u∈π₂TC⁻(R;Z_p) induces coherent S¹-equivariant cofiber sequences THH(A;Z_p)[2] →^u THH(A;Z_p) → HH(A/R;Z_p), TC⁻(A;Z_p)[2] →^u TC⁻(A;Z_p) → HC⁻(A/R;Z_p), and TP(A;Z_p)[2] →^(ξσ) TP(A;Z_p) → HP(A/R;Z_p). These are maps and cofibers before passing to homotopy groups.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Theorem 6.7, pp. 251–252.

Direct prerequisites: RefinedTraceMethods:RT.6/perfectoid-tc-maps; RefinedTraceMethods:RT.1/hochschild-homology; RefinedTraceMethods:RT.1/mixed-complex; RefinedTraceMethods:RT.1/cyclic-homology; RefinedTraceMethods:RT.2/relative-thh; RefinedTraceMethods:RT.2/thh-over-thhz; RefinedTraceMethods:RT.2/mixed-complexes-are-circle-modules; RefinedTraceMethods:RT.2/norm-sequence-hc; RefinedTraceMethods:RT.2/tc-minus-and-tp.

Proof or construction outline:

1. Compute the THH(R)-module cofiber for the base and tensor with THH(A).
2. The u lift in TC⁻ constructs the equivariance.
3. Apply homotopy fixed points and the Tate construction, using the base coefficient maps to identify the multiplication ξσ.

Acceptance:

- For A=R the Hochschild cofiber is R in degree zero.

### Antisymmetrization into THH

**Antisymmetrization** · construction · RefinedTraceMethods:RT.6/antisymmetrization

For ordinary perfectoid R-algebra A, define the natural graded R-algebra map H⁰((Ω*_(A/R))^∧p) → π_*THH(A;Z_p), with Ω^i placed in degree i. It extends the degree-one Hochschild comparison and multiplies differential classes by the exterior product. Derived p-completion is applied termwise before H⁰; arbitrary ordinary p-completion of Ω does not replace it.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Construction 6.8, pp. 252–253.

Direct prerequisites: RefinedTraceMethods:RT.6/thh-hochschild-deformation; RefinedTraceMethods:RT.1/hkr-map; RefinedTraceMethods:RT.1/external-products; DerivedDeRhamCohomology:DD.0/cotangent-complex; DerivedDeRhamCohomology:DD.1/derived-completion.

Proof or construction outline:

1. Use the low-degree THH → HH comparison to obtain degree-one differential classes.
2. Use odd-square vanishing from the low-degree τ≤2 comparison to make exterior multiplication well-defined, including at p=2.
3. Pass from absolute to relative forms through the p-divisible perfectoid-base differentials and termwise derived p-completion.

Uses deriving the API:

- RefinedTraceMethods:RT.6/quasismooth-thh-filtration: Exterior products of differential classes identify the quasismooth THH graded algebra.

API:

| Name | Role | Statement |
|---|---|---|
| Antisymmetrization.differential | constructor | For a∈A, the completed relative da has its degree-one THH image. |
| Antisymmetrization.wedge | relation | The image of ω∧η is the product of their images in THH, with graded signs and odd squares zero. |
| Antisymmetrization.map | functoriality | For R-algebra maps A → B, the differential and THH maps commute. |
| Antisymmetrization.unit | simp | The degree-zero map is the canonical A → π₀THH(A;Z_p). |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| Antisymmetrization.polynomialDx | computation | For A=R[x], dx maps to the degree-one generator identified by τ≤2THH → τ≤2HH. |
| Antisymmetrization.baseRing | degenerate | For A=R all positive relative forms and their images are zero. |
| Antisymmetrization.oddSquare | characterisation | For A=R[x], the image of dx squares to zero, including for p=2. |

Acceptance:

- The class dx for a polynomial variable maps to its standard Hochschild/THH degree-one class.

### The cotangent filtration of THH

**QuasismoothThhFiltration** · theorem · RefinedTraceMethods:RT.6/quasismooth-thh-filtration

For a p-completely quasismooth R-algebra A, antisymmetrization induces (Ω*_(A/R))^∧p⊗_R π_*THH(R;Z_p) ≃ π_*THH(A;Z_p). For every p-complete R-algebra A, left Kan extension gives the complete decreasing cotangent filtration of Corollary 6.10, with n-th graded term the sum of (derived ∧^j_A L_(A/R))^∧p[n] for 0≤j≤n and j≡n mod 2. Its n-th filtration term is n-connective.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Corollaries 6.9–6.10, pp. 253–254.

Direct prerequisites: RefinedTraceMethods:RT.6/antisymmetrization; RefinedTraceMethods:RT.6/perfectoid-thh; DerivedDeRhamCohomology:DD.0/cotangent-complex; EnhancedDerivedSheaves:E5:animation/animated-commutative-rings; EnhancedDerivedSheaves:E5:animation/universal-property-of-animation.

Proof or construction outline:

1. On quasismooth algebras split the THH/HH deformation using differential classes.
2. Extend the complete connective filtration from p-completed polynomial algebras in p-complete spectra.
3. Use the derived exterior-power description and increasing connectivity to prove completeness.

Acceptance:

- For R[x] the exterior degree-one class occurs alongside the even u powers.

### Even THH on quasiregular semiperfectoid covers

**QrspEvenThh** · theorem · RefinedTraceMethods:RT.6/qrsp-even-thh

For S∈QRSPerfd with perfectoid R → S and M=(L_(S/R)[−1])^∧p, THH(S;Z_p) is even and multiplication by u injects π_(2i−2) into π_(2i). Each π_(2i) is p-completely flat and has a finite increasing filtration with graded (Γ^j_S M)^∧p for 0≤j≤i. Equivalently the quotient by u identifies its top graded term with even HH(S/R). This evenness is a statement on QRSP covers, not on all quasisyntomic A.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Theorem 7.1, pp. 254–255.

Direct prerequisites: RefinedTraceMethods:RT.6/quasismooth-thh-filtration; RefinedTraceMethods:RT.6/qrsp-hochschild; RefinedTraceMethods:RT.6/thh-hochschild-deformation; DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings.

Proof or construction outline:

1. The cotangent filtration has only even graded terms on QRSP rings.
2. The u cofiber is even HH, giving odd vanishing and injectivity by induction.
3. Use the short exact sequences with Γ^i_S M to identify the finite filtrations and p-complete flatness.

Acceptance:

- For S=R, π_(2i)=R·u^i.
- The divided-power term in Theorem 7.1 is over S, correcting PAPER-BMS19/E3.

### TC⁻, TP and the trace Nygaard filtration on covers

**QrspTcNygaard** · theorem · RefinedTraceMethods:RT.6/qrsp-tc-nygaard

For S as in the preceding QRSP theorem, TC⁻ and TP are even and can:π_*TC⁻ → π_*TP is injective, an isomorphism in degrees ≤0. Their π₀ coincide as a (p,ξ)-complete ring C_S with complete descending multiplicative N-indexed filtration N^{≥i}C_S = image(v^i·π_(2i)TC⁻ → π₀TP). N^iC_S≃π_(2i)THH; Frobenius carries N^{≥i} into φ(ξ)^i C_S, defining divided maps. ξ is regular on C_S and C_S/ξ≃Hodge-and-p-completed derived dR(S/R).

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Theorem 7.2 and Remark 7.3, pp. 255–256.

Direct prerequisites: RefinedTraceMethods:RT.6/qrsp-even-thh; RefinedTraceMethods:RT.6/perfectoid-tc-maps; RefinedTraceMethods:RT.6/cyclic-derham-comparison; DerivedDeRhamCohomology:DD.1/filtered-completion.

Proof or construction outline:

1. Degenerate the even fixed-point and Tate spectral sequences.
2. Identify can and its filtration by the coefficient generators v,σ; construct the Frobenius divisibility maps.
3. Apply the deformation cofibers to identify the specialization and prove ξ-regularity.

Acceptance:

- For perfectoid S, C_S=Ainf(S) and N^{≥i}=(ker θ_S)^i.
- The filtration comes from the spectral sequences for S, correcting PAPER-BMS19/E4.

### The trace Nygaard complex

**TraceNygaardComplex** · construction · RefinedTraceMethods:RT.6/trace-nygaard-complex

For quasisyntomic A over perfectoid R, let C_A be the symmetric monoidal QRSP-basis unfolding of S ↦ π₀TC⁻(S;Z_p) with its abutment Nygaard filtration. It is an E∞ Ainf(R)-algebra in the complete filtered derived category, (p,ξ)-complete, with φ-semilinear Frobenius and complete descending multiplicative N-filtration. N^i C_A is an A-complex with increasing graded (∧^j_A L_(A/R))^∧p[−j], 0≤j≤i, and C_A/ξ≃Hodge-completed derived dR(A/R)^∧p. Global QSyn construction uses the same intrinsic basis sheaf and the trace twists; prismatic identification is a separate comparison theorem.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Construction 7.7 and Propositions 7.8–7.9, pp. 256–257.

Direct prerequisites: RefinedTraceMethods:RT.6/qrsp-tc-nygaard; RefinedTraceMethods:RT.6/trace-flat-descent; DerivedDeRhamCohomology:DD.5/quasisyntomic-site; DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings; DerivedDeRhamCohomology:DD.1/filtered-completion; DerivedDeRhamCohomology:DD.2/hodge-completed-derham; AInfCohomology:AI.0.

Proof or construction outline:

1. Use DD.5’s equivalence of sheaves on QSyn and its QRSP basis.
2. Unfold the multiplicative filtered π₀TC⁻ sheaf and its Frobenius, retaining all coherent maps.
3. The graded cotangent and specialization computations descend by the same basis equivalence.

Uses deriving the API:

- RefinedTraceMethods:RT.6/aomega-comparison: The unfolded Frobenius complex supplies the primitive comparison and its Lη factorization.
- RefinedTraceMethods:RT.6/trace-prismatic-comparison: The trace object is recognized as the Nygaard completion of an independent prism.

API:

| Name | Role | Statement |
|---|---|---|
| TraceNygaardComplex.basisValue | simp | For QRSP S, evaluation recovers π₀TC⁻(S;Z_p) with its Nygaard submodules. |
| TraceNygaardComplex.map | functoriality | Quasisyntomic algebra maps give filtered E∞ maps with coherent identity and composition. |
| TraceNygaardComplex.frobenius | data | Frobenius is φ-semilinear and N^{≥i} maps into φ(ξ)^i C_A over a perfectoid base. |
| TraceNygaardComplex.specialize | equivalence | C_A⊗^L_(Ainf,θ) R≃Hodge-completed derived dR(A/R)^∧p. |
| TraceNygaardComplex.graded | compatibility | N^i C_A≃gr^iTHH(A;Z_p)[−2i] with the finite cotangent filtration. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| TraceNygaardComplex.perfectoid | computation | For A=R, C_A=Ainf(R) with its Witt Frobenius and ideal-power Nygaard filtration. |
| TraceNygaardComplex.baseRelativeDerham | degenerate | For A=R, specialization by θ is R, since relative derived dR(R/R)=R. |
| TraceNygaardComplex.thetaNotThetaTilde | non-example | The de Rham specialization uses θ and ξ; replacing ξ by φ(ξ) without the corresponding Frobenius twist does not give the stated map. |

Acceptance:

- For perfectoid F over R, C_F=Ainf(F), N^{≥i}=(ker θ_F)^i and Frobenius is Witt Frobenius.

### Frobenius factorization for smooth trace complexes

**SmoothTraceFrobenius** · theorem · RefinedTraceMethods:RT.6/smooth-trace-frobenius

For A the p-adic completion of a smooth perfectoid R-algebra of relative dimension d, N^i C_A lies in D^[0,max(i,d)] and N^{≥i} C_A in D^[0,d] for i≥0. H⁰(C_A) has no φ^r(ξ)-torsion for r∈Z. Frobenius linearization factors naturally C_A → Lη_ξ φ_* C_A, and iteration gives C_A → Lη_(ξ_r) φ_*^r C_A, where ξ_r=ξ·φ⁻¹(ξ)···φ^(−r+1)(ξ). This factorization is not asserted to be an equivalence until the smooth O_C comparison.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Corollary 7.10 and Remark 7.11, p. 258.

Direct prerequisites: RefinedTraceMethods:RT.6/trace-nygaard-complex; AInfCohomology:AI.1/derived-decalage; AInfCohomology:AI.1/decalage-products; AInfCohomology:AI.1/bockstein-reduction; AInfCohomology:AI.0; AInfCohomology:AI.1/filtered-beilinson-description.

Proof or construction outline:

1. Use the finite cotangent filtration and smooth exterior-power bounds.
2. Embed H⁰ after a perfectoid cover formed by extracting roots of torus coordinates to prove torsion-freeness.
3. Apply the imported Beilinson/filter-Lη comparison to the filtered Frobenius divisibility; iterate using Lη_f Lη_g≃Lη_(fg).

Acceptance:

- The twist φ_* uses restriction of scalars, and ξ_r contains inverse Frobenius translates.

### The non-Nygaard-completed trace extension

**TraceNoncompletedExtension** · construction · RefinedTraceMethods:RT.6/trace-noncompleted-extension

For p-completed smooth R-algebras, start from C_A and left Kan extend in (p,ξ)-complete Ainf(R)-complexes to all p-complete animated commutative R-algebras, using E5’s polynomial/sifted resolution. Write Cnc_(A/R) for the resulting E∞ functor. Its θ-specialization is p-completed derived dR(A/R) without Hodge completion; it is a quasisyntomic sheaf, discrete on QRSP algebras. Its dependence on the chosen perfectoid R is retained until the trace-to-prismatic comparison. Cnc is not a second generic prismatic Δ.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Construction 7.12, pp. 258–259; BS Theorem 13.1 proof, pp. 94–96.

Direct prerequisites: RefinedTraceMethods:RT.6/trace-nygaard-complex; RefinedTraceMethods:RT.6/smooth-trace-frobenius; EnhancedDerivedSheaves:E5:animation/animated-commutative-rings; EnhancedDerivedSheaves:E5:animation/universal-property-of-animation; DerivedDeRhamCohomology:DD.1/derived-completion; DerivedDeRhamCohomology:DD.5/quasisyntomic-site; DerivedDeRhamCohomology:DD.2/hodge-completed-derham.

Proof or construction outline:

1. For smooth A the combined Hodge/p completion agrees with the p-completed de Rham complex.
2. Apply sifted left Kan extension in the stated complete E∞ derived category.
3. Use the specialization and the (p,ξ)-complete Nakayama/sheaf criterion to get descent and the QRSP discreteness.

Uses deriving the API:

- RefinedTraceMethods:RT.6/trace-prismatic-comparison: Its uncompleted de Rham specialization enters prismatic recognition.
- RefinedTraceMethods:RT.6/aomega-comparison: The smooth comparison extends to the projective QRSP basis before Nygaard completion.

API:

| Name | Role | Statement |
|---|---|---|
| TraceNoncompletedExtension.ofSmooth | compatibility | For p-completed smooth R-algebra A, Cnc_(A/R)≃C_A. |
| TraceNoncompletedExtension.extend | universal-property | It is the sifted left Kan extension from the smooth/polynomial presentation in (p,ξ)-complete E∞ complexes. |
| TraceNoncompletedExtension.map | functoriality | Animated R-algebra maps give E∞ maps, coherently. |
| TraceNoncompletedExtension.specialize | equivalence | Cnc_(A/R)/ξ≃derived p-completed dR(A/R) without Hodge completion. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| TraceNoncompletedExtension.base | degenerate | Cnc_(R/R)≃Ainf(R) and its θ-specialization is R. |
| TraceNoncompletedExtension.smoothPolynomial | compatibility | For the p-completed polynomial algebra R[x], Cnc agrees with C_A and has the ordinary p-completed de Rham specialization. |
| TraceNoncompletedExtension.qrspDiscreteness | characterisation | For QRSP S over R, Cnc_(S/R) is concentrated in cohomological degree zero; this does not identify it with C_S before Nygaard completion. |

Acceptance:

- For A=R, Cnc=Ainf(R).
- Nygaard completion is a separate functor and may change the result on nonsmooth A.

### The BMS2 motivic filtrations

**MotivicFiltration** · construction · RefinedTraceMethods:RT.6/motivic-filtrations

For X=THH,TC⁻,TP and quasisyntomic A, define Fil^nX(A;Z_p) by QRSP-basis unfolding of τ_(≥2n)X(−;Z_p), for n∈Z, and define Fil^nTC as the fiber of φ−can on the filtered TC⁻ and TP spectra. These are functorial complete exhaustive decreasing multiplicative filtrations in spectra; Frobenius/can retain their coherent source maps. The underlying realization is the p-completed trace spectrum by descent. THH is locally even on covers but its unfolded graded complexes have nonzero cohomological degrees.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Construction 7.4 and Proposition 7.5, pp. 256–257; Proposition 7.13, pp. 259–260; Theorem 1.12, pp. 210–211.

Direct prerequisites: RefinedTraceMethods:RT.6/qrsp-even-thh; RefinedTraceMethods:RT.6/qrsp-tc-nygaard; RefinedTraceMethods:RT.6/trace-flat-descent; DerivedDeRhamCohomology:DD.5/quasisyntomic-site; DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings; DerivedDeRhamCohomology:DD.1/filtered-completion; RefinedTraceMethods:RT.2/thh-e1-ring; RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh; RefinedTraceMethods:RT.2/tc-minus-and-tp; RefinedTraceMethods:RT.2/tc-fibre-sequence.

Proof or construction outline:

1. Use evenness to show τ_(≥2n) is a QRSP sheaf.
2. Unfold in the complete filtered category, preserving products and the maps can,φ.
3. Increasing positive connectivity gives completeness; homotopy stabilization at the negative end gives exhaustiveness as proved in Proposition 7.13. Filtered TC is the stable fiber; finite limits commute with its complete/exhaustive realization.

Uses deriving the API:

- RefinedTraceMethods:RT.6/graded-motivic-comparison: Graded pieces are computed on even covers then unfolded.
- RefinedTraceMethods:RT.6/ammn-filtered-interface: The filtered truncation maps identify weight-i terms of the Beilinson bridge.

API:

| Name | Role | Statement |
|---|---|---|
| MotivicFiltration.piece | data | Fil^nX(A) is QRSP unfolding of τ_(≥2n)X with its maps Fil^(n+1) → Fil^n. |
| MotivicFiltration.realize | equivalence | colim_(n→−∞)Fil^nX(A)≃X(A;Z_p). |
| MotivicFiltration.complete | characterisation | lim_(n→+∞)Fil^nX(A)=0. |
| MotivicFiltration.product | structure | Fil^iX⊗Fil^jX → Fil^(i+j)X is coherently associative and unital. |
| MotivicFiltration.map | functoriality | Algebra maps induce filtered maps that commute with products, can and Frobenius. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| MotivicFiltration.perfectoidPostnikov | computation | For perfectoid R, Fil^nTHH(R)=τ_(≥2n)THH(R); for n≤0 it is all THH(R). |
| MotivicFiltration.qrsp | compatibility | For QRSP S, Fil^nTC⁻(S) and Fil^nTP(S) agree with double-speed Postnikov truncation. |
| MotivicFiltration.polynomialOdd | non-example | For a smooth one-variable perfectoid-base algebra the differential class has odd homotopical degree; local evenness does not remove it. |

Acceptance:

- On QRSP S the filtration is double-speed Postnikov.
- For smooth R[x], odd differential classes persist after unfolding, preventing a false global evenness conclusion.

### Invertibility in the complete filtered category

**FilteredInvertibility** · theorem · RefinedTraceMethods:RT.6/filtered-invertibility

Let A be a complete N-filtered E∞ algebra in the complete filtered derived category, and M,N complete N-filtered A-modules. Assume the natural maps gr⁰M⊗_(gr⁰A)gr*A → gr*M and gr⁰N⊗_(gr⁰A)gr*A → gr*N are equivalences. If a filtered pairing η:M⊗̂_A N → A induces an equivalence gr⁰M⊗_(gr⁰A)gr⁰N → gr⁰A, then η is an equivalence and M,N are inverse invertible modules in the complete filtered category. The tensor is the completed filtered tensor; the base-change equivalences are essential hypotheses.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Lemma 7.14, pp. 260–261.

Direct prerequisites: DerivedDeRhamCohomology:DD.1/filtered-completion; EnhancedDerivedSheaves:E5:presentability.

Proof or construction outline:

1. Use the two natural graded base-change equivalences to identify gr*(M⊗̂_A N) with (gr⁰M⊗_(gr⁰A)gr⁰N)⊗_(gr⁰A)gr*A.
2. The degree-zero pairing equivalence now makes gr*(η) an equivalence.
3. Apply the conservative symmetric monoidal associated-graded functor on complete N-filtered modules; the pairing gives inverse invertible modules.

Acceptance:

- The filtered TP twist and its inverse satisfy the natural base-change equivalences by local periodicity and descend to an invertible filtered pair without choosing a global basis.
- Mere generation of gr*M from gr⁰M is insufficient: the actual base-change map must be an equivalence before applying the lemma.

### The trace Breuil–Kisin twist

**TraceBreuilKisinTwist** · construction · RefinedTraceMethods:RT.6/trace-breuil-kisin-twist

Let C_A=gr⁰TP(A;Z_p). Define the trace line C_A{1}=gr¹TP(A;Z_p)[−2] with its unfolded Nygaard filtration; multiplication and the inverse-degree TP line make it invertible in the completed filtered category. Tensor powers define C_A{i} for i∈Z. Under trace-to-prismatic comparison it identifies with the imported PR.3 Breuil–Kisin twist. On a perfectoid base, π₂TP is an invertible Ainf module and its θ̃-specialization is ker θ/(ker θ)²; its θ-specialization is canonically R. A choice of periodic generator trivializes it, rather than producing a global canonical untwisted object.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Theorem 1.12(3), p. 210; Proposition 6.5, pp. 248–250; Lemma 7.14, pp. 260–261.

Direct prerequisites: RefinedTraceMethods:RT.6/motivic-filtrations; RefinedTraceMethods:RT.6/filtered-invertibility; RefinedTraceMethods:RT.6/perfectoid-tc-maps; PrismaticCohomology:PR.3/breuil-kisin-twist; AInfCohomology:AI.0.

Proof or construction outline:

1. Use TP multiplication to construct positive and negative filtered line pairings.
2. Apply Lemma 7.14 on complete filtered modules; each finite Nygaard quotient is an invertible ordinary quotient-module.
3. Compute on perfectoid covers and glue the transition units, then identify with the imported prismatical twist through the multiplicative comparison.

Uses deriving the API:

- RefinedTraceMethods:RT.6/syntomic-graded-tc: The i-th twist normalizes divided Frobenius and the syntomic graded fiber.
- RefinedTraceMethods:RT.6/adams-operations: The conormal comparison calculates the scalar weight action.

API:

| Name | Role | Statement |
|---|---|---|
| TraceBreuilKisinTwist.line | constructor | The filtered invertible C_A-module gr¹TP(A)[−2]. |
| TraceBreuilKisinTwist.power | structure | Tensor powers and duals yield C_A{i} with coherent C_A{i}⊗C_A{j}≃C_A{i+j}. |
| TraceBreuilKisinTwist.specialize | equivalence | Over perfectoid R, the θ specialization of the line is R and θ̃ specialization is ker θ/(ker θ)². |
| TraceBreuilKisinTwist.prismatic | compatibility | Through the filtered trace/prismatic equivalence, the trace line agrees with the supplied PR.3 Breuil–Kisin twist. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| TraceBreuilKisinTwist.weightZero | degenerate | C_A{0}≃C_A as a filtered module. |
| TraceBreuilKisinTwist.perfectoidLine | computation | For R perfectoid, C_R{1} has underlying line π₂TP(R), and θ̃ gives the conormal line. |
| TraceBreuilKisinTwist.noGlobalBasis | non-example | The definition contains the filtered invertible line and descent cocycle, not a freely chosen equality C_A{1}=C_A for every quasisyntomic A. |

Acceptance:

- Over a ring receiving a perfectoid map the twist can be trivialized, but the trivialization depends on generator data.

### Agreement with the BMS1 twist

**Bms1TwistComparison** · comparison · RefinedTraceMethods:RT.6/bms1-twist-comparison

For p-torsion-free perfectoid R, the trace line Ainf(R){1}=π₂TP(R;Z_p) agrees with BMS1’s Breuil–Kisin–Fargues twist. The finite θ̃_r specialization is ker θ̃_r/(ker θ̃_r)², and the natural transition on the conormal side corresponds to p times the transition on the twist side. The inverse-limit comparison uses the canonical Ainf≃lim_F W_r(R), retaining Frobenius and finite TR maps.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Remark 6.6, pp. 250–251.

Direct prerequisites: RefinedTraceMethods:RT.6/trace-breuil-kisin-twist; AInfCohomology:AI.0; AInfCohomology:AI.4; RefinedTraceMethods:RT.2/tr-and-genuine-tc; RefinedTraceMethods:RT.2/genuine-tc-agrees; RefinedTraceMethods:RT.2/tc-minus-and-tp.

Proof or construction outline:

1. Use the classical TR connective-cover comparison and its Witt π₀ calculation supplied by RT.2.
2. Identify the conormal modules of θ̃_r and their transitions with the trace periodic line.
3. Pass to the inverse limit using p-torsion-freeness and the BMS1 twist construction.

Acceptance:

- The transition is p times the twist transition, not the identity.

### Filtered can, Frobenius and the TC fiber

**FilteredFrobenius** · construction · RefinedTraceMethods:RT.6/filtered-frobenius

The cyclotomic Frobenius and canonical comparison of RT.2 induce multiplicative filtered maps φ,can:TC⁻(A;Z_p) → TP(A;Z_p) on quasisyntomic A. Under the completed prismatic comparison their i-th graded maps are respectively the supplied divided Frobenius and canonical Nygaard inclusion on C_A{i}[2i]. Define the filtered TC spectrum by the fiber of φ−can in spectra. Its multiplication is the coherent equalizer/fiber multiplication, not subtraction in the category of E∞ algebras.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Theorem 1.12(5), p. 211; §7.4, pp. 261–262; Theorem 7.2, pp. 255–256.

Direct prerequisites: RefinedTraceMethods:RT.6/motivic-filtrations; RefinedTraceMethods:RT.6/trace-breuil-kisin-twist; RefinedTraceMethods:RT.6/qrsp-tc-nygaard; PrismaticCohomology:PR.3/divided-frobenius; RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh; RefinedTraceMethods:RT.2/tc-minus-and-tp; RefinedTraceMethods:RT.2/tc-fibre-sequence.

Proof or construction outline:

1. Construct both maps as unfolded maps of complete filtered trace spectra.
2. Normalize their graded Frobenius by the Breuil–Kisin line, so it agrees with the divided Frobenius map.
3. Form the stable fiber and use the multiplicative cyclotomic equalizer construction for its products.

Uses deriving the API:

- RefinedTraceMethods:RT.6/syntomic-graded-tc: The stable graded fiber is the independent syntomic complex.
- RefinedTraceMethods:RT.6/ammn-filtered-interface: The source-normalized Frobenius square is supplied to RT.3b.

API:

| Name | Role | Statement |
|---|---|---|
| FilteredFrobenius.can | data | The filtered canonical TC⁻ → TP map induces Nygaard inclusion on graded pieces. |
| FilteredFrobenius.frobenius | data | The filtered cyclotomic map induces divided Frobenius after twisting. |
| FilteredFrobenius.fiber | constructor | TC filtered pieces are fib(φ−can) in spectra. |
| FilteredFrobenius.product | structure | The coherent multiplicative equalizer supplies products of weights i,j in weight i+j. |
| FilteredFrobenius.map | functoriality | These filtered maps and fibers are natural in quasisyntomic A. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| FilteredFrobenius.weightZero | degenerate | On perfectoid weight zero, φ−can=φ−id on Ainf. |
| FilteredFrobenius.differentMaps | non-example | For R=F_p, can(u)=pσ while φ(u)=σ; the maps cannot be identified. |
| FilteredFrobenius.syntomicSquare | compatibility | The i-th graded fiber map agrees with PR.4’s syntomic fiber, including its divided Frobenius and twist. |

Acceptance:

- At weight zero over a perfectoid base, can=id and φ is Witt Frobenius.

### Derived convergence of the trace spectral sequences

**MotivicConvergence** · theorem · RefinedTraceMethods:RT.6/motivic-convergence

The complete exhaustive filtered spectra give the BMS2 derived convergent spectral sequences E₂^(a,b)=H^(a−b)(N^(−b)C_A) ⇒ π_(−a−b)THH, E₂^(a,b)=H^(a−b)(N^{≥−b}C_A{−b}) ⇒ π_(−a−b)TC⁻, E₂^(a,b)=H^(a−b)(C_A{−b}) ⇒ π_(−a−b)TP, and E₂^(a,b)=H^(a−b)(Z_p(−b)(A)) ⇒ π_(−a−b)TC in their defined weight range. The unbounded cases mean convergence to the supplied derived complete filtration; no unconditional strong convergence after forgetting derived limits is claimed. On p-completed smooth finite-dimensional perfectoid-base algebras, the stated cohomological bounds give degreewise control of the inverse-limit terms.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Theorem 1.12(4)–(5), pp. 210–211; Proposition 7.13, pp. 259–260.

Direct prerequisites: RefinedTraceMethods:RT.6/graded-motivic-comparison; RefinedTraceMethods:RT.6/syntomic-graded-tc; RefinedTraceMethods:RT.6/smooth-trace-frobenius; StableHomotopyKTheory:H.6.

Proof or construction outline:

1. Build the exact couple from the filtered spectrum rather than postulating an E₂ page.
2. Use the complete and exhaustive identifications for the derived abutment.
3. Apply smooth cohomological bounds for the explicit degreewise convergence specialization; retain limit corrections outside that class.

Acceptance:

- The signs of weight −b, cohomological degree a−b and homotopical abutment −a−b agree.

### The TC-internal negative-degree calculation

**TcNegativeDegrees** · theorem · RefinedTraceMethods:RT.6/tc-negative-degrees

For a connective ring spectrum A, π_iTC(A;Z_p)=0 for i<−1 by the classical TR connective comparison. For ordinary A, π_(−1)TC(A;Z_p)=coker(F−1:W(A) → W(A)). On the QRSP site this cokernel vanishes locally by the iterated Artin–Schreier covers, so the weight-zero TC fiber is locally in degree zero and negative motivic weights vanish. Identifying the resulting weight-zero sheaf with constant Z_p by K₀ is owned downstream and is not used here.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), TC-internal part of proof of Proposition 7.16, p. 262.

Direct prerequisites: RefinedTraceMethods:RT.2/tr-and-genuine-tc; RefinedTraceMethods:RT.2/genuine-tc-agrees; RefinedTraceMethods:RT.2/tc-fibre-sequence; RefinedTraceMethods:RT.6/syntomic-graded-tc; DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings; DerivedDeRhamCohomology:DD.5/quasisyntomic-site.

Proof or construction outline:

1. Use the classical formulation and connectivity of all TR^r from RT.2.
2. Compute π₀TR^r=W_r(A), then the F−1 cokernel for π_(−1)TC.
3. Extract the iterated Artin–Schreier covers within the QRSP basis. Stop before the K-theoretic rank comparison in Proposition 7.16.

Acceptance:

- For A=F_p pointwise F−1 on Z_p is zero, so π_(−1)TC(F_p)=Z_p; local vanishing must not be mistaken for pointwise vanishing.

### The crystalline trace comparison

**CrystallineTraceComparison** · theorem · RefinedTraceMethods:RT.6/crystalline-trace-comparison

For a quasiregular semiperfect F_p-algebra S, C_S≃Nygaard-completed Acrys(S)≃Nygaard-completed derived de Rham–Witt LWΩ_S as filtered Frobenius E∞ algebras. The cyclotomic and algebra Frobenius agree; modulo p this is x↦x^p. The comparison uses the independent PD/derived de Rham–Witt constructions imported from DD.4. On a smooth algebra over a perfect field k, unfolding identifies C_A with the derived de Rham–Witt object and its Nygaard completion; completeness must be retained.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Theorem 8.17 and proof, pp. 276–279.

Direct prerequisites: RefinedTraceMethods:RT.6/group-algebra-trace-test; RefinedTraceMethods:RT.6/cyclic-derham-comparison; RefinedTraceMethods:RT.6/qrsp-tc-nygaard; DerivedDeRhamCohomology:DD.4/derived-de-rham-witt; DerivedDeRhamCohomology:DD.4/acrys-structure; DerivedDeRhamCohomology:DD.4/qrsp-pd-derham; PrismaticCohomology:PR.3/nygaard-completion.

Proof or construction outline:

1. Prove the group-algebra calculation and compatibility with both filtrations.
2. Extend along tensor products, filtered colimits and the root-quotient presentation S^flat[X_i^(1/p∞)]/(X_i).
3. Construct Acrys(S) → C_S using the PD ideal in the trace ring; check the graded and mod-p comparisons on the presentation, then use Nygaard completeness.
4. Identify the two Frobenius maps on the dense Witt subring and pass to completion.

Acceptance:

- For S=F_p, C_S=Z_p and the Frobenius is the identity.
- For semiperfect nonreduced S, an ordinary uncompleted PD envelope is not the claimed output.

### The root group algebra trace calculation

**GroupAlgebraTraceTest** · theorem · RefinedTraceMethods:RT.6/group-algebra-trace-test

Let S=F_p[Q_p/Z_p]=F_p[T^(±1/p∞)]/(T−1). The coherent circle-equivariant equivalence THH(S)≃HH(Z[Q_p/Z_p])⊗_Z THH(F_p) induces TP(S)≃HP(Z[Q_p/Z_p];Z_p) as E∞ ring spectra. Consequently π₀TP(S)≃Nygaard-completed Acrys(S), compatibly with the Hodge/Nygaard filtrations, mod-p reduction and Frobenius. For connective circle-equivariant M∈D(Z), (M⊗_Z THH(F_p))^tS¹ is the p-completion of M^tS¹.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Proof of Theorem 8.17, the key case, pp. 277–278.

Direct prerequisites: RefinedTraceMethods:RT.6/cyclic-derham-comparison; DerivedDeRhamCohomology:DD.4/derived-de-rham-witt; DerivedDeRhamCohomology:DD.4/acrys-structure; DerivedDeRhamCohomology:DD.4/qrsp-pd-derham; KTheoryFiniteLocalFields:L.5; RefinedTraceMethods:RT.1/hochschild-homology; RefinedTraceMethods:RT.1/cyclic-homology; RefinedTraceMethods:RT.2/thh-spherical-group-rings; RefinedTraceMethods:RT.2/thh-over-thhz; RefinedTraceMethods:RT.2/hz-module-circle-tate; RefinedTraceMethods:RT.2/tc-minus-and-tp.

Proof or construction outline:

1. Use the integral circle-equivariant Z → THH(F_p) and the cyclic bar construction of the group algebra.
2. For the Tate-completion assertion, use weak Postnikov towers and the finite-C_p Tate comparison supplied by L.5; reduce to M=Z and F_p.
3. Compute HP using the Hodge-completed derived de Rham description and the natural Frobenius lift on the integral group algebra.
4. Compare the induced filtration modulo p and the Frobenius on the dense Witt subring.

Acceptance:

- The index group is Q_p/Z_p, not the perfect polynomial algebra without the relation T−1.

### The Segal comparison in characteristic p

**SegalCharP** · theorem · RefinedTraceMethods:RT.6/segal-char-p

For a smooth k-algebra A of dimension d over a perfect field k of characteristic p, gr^iTHH(A;Z_p)≃τ^{≤i}Ω*_A/k[2i] and gr^iTHH(A;Z_p)^tC_p≃Ω*_A/k[2i]. Cyclotomic Frobenius is the natural truncation inclusion on these graded pieces, and THH(A;Z_p) → THH(A;Z_p)^tC_p induces isomorphisms on π_n for n≥d. The finite-Tate filtration is obtained by quasisyntomic unfolding.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Corollary 8.18, pp. 279–280.

Direct prerequisites: RefinedTraceMethods:RT.6/crystalline-trace-comparison; RefinedTraceMethods:RT.6/perfectoid-quotient-comparison; DerivedDeRhamCohomology:DD.3/smooth-cartier.

Proof or construction outline:

1. Identify THH^tC_p with TP/p using the perfectoid quotient comparison.
2. Use the crystalline Nygaard/Lη comparison and Cartier to identify its graded map with truncation.
3. Bound the cohomological degrees of differential forms by d to obtain the high-degree equivalence.

Acceptance:

- For A=k and d=0, Frobenius gives the nonnegative-degree equivalence.

### The root ideals controlling almost comparison

**AlmostRootIdeals** · theorem · RefinedTraceMethods:RT.6/almost-root-ideals

In Notation 9.1, let C/Q_p be a perfectoid field containing all p-power roots of unity, choose ε and set μ=[ε]−1 in Ainf=W(O_C^flat). For d≥1 set J_d=union_(r≥0)(φ^(−r)(μ)^d). Then J_d⊂J_1⊂W(m_C^flat), p is a nonzerodivisor on Ainf/J_d, and the p-adic completion of every J_d is W(m_C^flat). The almost category is the symmetric monoidal quotient by complexes whose cohomology is annihilated by W(m_C^flat), imported from AI.0.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Notation 9.1 and Lemma 9.2, pp. 283–284.

Direct prerequisites: AInfCohomology:AI.0; AInfCohomology:AI.1/derived-decalage; AInfCohomology:AI.1/decalage-products; AInfCohomology:AI.1/bockstein-reduction.

Proof or construction outline:

1. Use the divisibility φ^(−r−1)(μ) | φ^(−r)(μ) to form the filtered union.
2. Frobenius-twist to μ and use the regular sequence (p,μ^d) to prove p-torsion-freeness.
3. Modulo p all J_d give the same residue-field quotient; uniqueness of the p-complete p-torsion-free lift W(k) gives the completion statement.

Acceptance:

- A bounded root ideal is not itself substituted for the completed almost ideal.

### The almost décalage limit comparison

**AlmostDecalageLimit** · theorem · RefinedTraceMethods:RT.6/almost-decalage-limit

For p-complete K∈D^{≥0}(Ainf) with H⁰(K) torsion-free, and ξ_r=μ/φ^(−r)(μ), every cohomology group of cofib(Lη_μK → Rlim_r Lη_(ξ_r)K) is killed by W(m_C^flat). The map is an equivalence in the imported almost category; an honest equivalence is not asserted.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Lemma 9.3, pp. 284–285.

Direct prerequisites: RefinedTraceMethods:RT.6/almost-root-ideals; AInfCohomology:AI.0; AInfCohomology:AI.1/derived-decalage; AInfCohomology:AI.1/preservation-derived-completeness.

Proof or construction outline:

1. Truncate to bounded amplitude [0,d], retaining torsion-free H⁰, using the amplitude preservation of Lη and the one-degree limit bound.
2. The chain relation μ=φ^(−r)(μ)ξ_r makes multiplication by φ^(−r)(μ)^d on the two complexes factor through the comparison.
3. Thus J_d annihilates the cofiber groups; p-completeness and the preceding lemma upgrade this to annihilation by W(m_C^flat).

Acceptance:

- K=Ainf in degree zero satisfies the hypotheses; the argument must also handle bounded positive cohomological degree.

### Almost elements of a completed free module

**AlmostFreeElements** · theorem · RefinedTraceMethods:RT.6/almost-free-elements

If M is the (p,ξ)-completion of a free Ainf-module, M → Hom_Ainf(W(m_C^flat),M) is an isomorphism. Moreover RHom_Ainf(W(m_C^flat),−) kills all almost-zero complexes and defines the right adjoint to the almost quotient. This is a statement about this completed-free class, not about every Ainf-module.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Lemma 9.4 and paragraph after its proof, p. 285.

Direct prerequisites: AInfCohomology:AI.0; DerivedDeRhamCohomology:DD.1/derived-completion; RefinedTraceMethods:RT.6/almost-root-ideals.

Proof or construction outline:

1. Reduce modulo ξ using completeness and ξ-torsion-freeness.
2. Describe M/ξ as the restricted product of copies of O_C. A sequence representing an almost element is restricted because multiplication by p supplies the decay condition.
3. Use W(m_C^flat)⊗^L Ainf/W(m_C^flat)=0 for the derived almost-zero assertion.

Acceptance:

- Infinite completed free modules require the restricted-product decay condition; replacing them by unrestricted products changes the proof.

### The animated extension of imported AΩ

**AnimatedAomegaExtension** · construction · RefinedTraceMethods:RT.6/animated-aomega-extension

Starting from the AI.4 geometric E∞ Ainf-algebra AΩ_A=Lη_μRΓ(Spf(A)_C,Ainf) on p-adic completions of smooth O_C-algebras, define AΩ^nc on all p-complete animated O_C-algebras by sifted left Kan extension in (p,ξ)-complete E∞ complexes. It has AΩ^nc_A/ξ≃derived p-completed dR(A/O_C) without Hodge completion, is a quasisyntomic sheaf, and is discrete on QRSP O_C-algebras. The geometric AΩ and Lη constructions are imported, not defined anew.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Construction 9.5, p. 286.

Direct prerequisites: AInfCohomology:AI.0; AInfCohomology:AI.4; RefinedTraceMethods:RT.6/trace-noncompleted-extension; DerivedDeRhamCohomology:DD.5/quasisyntomic-site; DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings; EnhancedDerivedSheaves:E5:presentability/ind-completion; EnhancedDerivedSheaves:E5:animation/animated-commutative-rings; EnhancedDerivedSheaves:E5:animation/universal-property-of-animation.

Proof or construction outline:

1. Use the imported AΩ on smooth objects and its ξ-specialization.
2. Left Kan extend in the complete target category, as in Construction 7.12.
3. Apply the specialization and complete Nakayama criterion for descent and QRSP discreteness.

Uses deriving the API:

- RefinedTraceMethods:RT.6/projective-qrsp-aomega: The ξ-specialization and animated descent identify completed-free values.
- RefinedTraceMethods:RT.6/aomega-comparison: Projective QRSP extraction turns the almost comparison into an honest map.

API:

| Name | Role | Statement |
|---|---|---|
| AnimatedAomegaExtension.ofSmooth | compatibility | On p-completed smooth O_C-algebras the value is the imported geometric AΩ. |
| AnimatedAomegaExtension.extend | universal-property | The functor is the sifted left Kan extension in the (p,ξ)-complete E∞ target. |
| AnimatedAomegaExtension.specialize | equivalence | Modulo ξ the functor is derived p-completed de Rham cohomology without Hodge completion. |
| AnimatedAomegaExtension.map | functoriality | Animated O_C-algebra maps induce coherent E∞ maps. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| AnimatedAomegaExtension.base | degenerate | The base O_C gives Ainf. |
| AnimatedAomegaExtension.polynomial | compatibility | On O_C⟨x⟩ the value agrees with the imported geometric AΩ and its ξ-specialization is the p-completed polynomial de Rham complex. |
| AnimatedAomegaExtension.qrsp | characterisation | The value on a QRSP O_C-algebra is discrete, while no discreteness is asserted for every animated algebra. |

Acceptance:

- For O_C itself the value is Ainf and its ξ-specialization is O_C.

### The almost comparison map to AΩ

**AomegaAlmostComparison** · construction · RefinedTraceMethods:RT.6/aomega-almost-map

For p-adically completed smooth O_C-algebra A, the primitive Frobenius-compatible trace map C_A → RΓ(Spf(A)_C,Ainf) obtained from perfectoid pro-étale values factors naturally through AΩ_A in the almost category of W(m_C^flat). The factorization uses the Frobenius factorization map C_A → Lη_ξφ_*C_A and its iterates; compatibility under varying r gives the map to Rlim Lη_(ξ_r) of the pro-étale complex.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Theorem 9.6 proof, primitive and almost comparison steps, pp. 286–288.

Direct prerequisites: RefinedTraceMethods:RT.6/trace-nygaard-complex; RefinedTraceMethods:RT.6/smooth-trace-frobenius; RefinedTraceMethods:RT.6/almost-decalage-limit; AInfCohomology:AI.4; AInfCohomology:AI.0.

Proof or construction outline:

1. Construct the primitive map by restriction to perfectoid pro-étale sections and sheaf limits.
2. Iterate the factorization map C_A → F(C_A), F=Lη_ξφ_*. Frobenius is invertible on the pro-étale Ainf target, so the primitive map induces compatible C_A → F^r(RΓ(Ainf))≃Lη_(ξ_r)φ_*^r RΓ(Ainf) maps. No equivalence on C_A is assumed.
3. Apply Lemma 9.3 to replace the limit with Lη_μ in the almost category.

Uses deriving the API:

- RefinedTraceMethods:RT.6/aomega-comparison: The primitive and root-factor maps are extended and extracted through completed-free covers.

API:

| Name | Role | Statement |
|---|---|---|
| AomegaAlmostComparison.primitive | constructor | The map C_A → RΓ of the pro-étale Ainf complex is Frobenius-compatible. |
| AomegaAlmostComparison.rootFactor | data | For each r it has a compatible factorization through Lη_(ξ_r). |
| AomegaAlmostComparison.almostFactor | constructor | In the almost quotient, the root-limit comparison gives C_A → AΩ_A. |
| AomegaAlmostComparison.map | functoriality | Smooth O_C-algebra maps commute with the almost comparison. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| AomegaAlmostComparison.base | compatibility | On A=O_C the almost map agrees with the identity of Ainf in the almost quotient. |
| AomegaAlmostComparison.frobenius | characterisation | Its composite with Frobenius agrees with Frobenius followed by the map. |
| AomegaAlmostComparison.honestRequiresExtraction | non-example | An arbitrary almost equivalence is not declared an honest Ainf equivalence; the completed-free extraction theorem is required. |

Acceptance:

- The output at this step is almost; the next step is needed for an honest comparison.

### Completed freeness on projective QRSP covers

**ProjectiveQrspAomega** · theorem · RefinedTraceMethods:RT.6/projective-qrsp-aomega

If S∈QRSPerfd_(O_C) is projective in the sense of the imported projective quasisyntomic basis, AΩ^nc_S is the (p,ξ)-completion of a free Ainf-module. Consequently AΩ^nc_S → RHom_Ainf(W(m_C^flat),AΩ^nc_S) is an equivalence. Here the special projective basis includes S/p free over O_C/p and (L_(S/O_C)[−1])^∧p projective, not merely an arbitrary QRSP S.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Lemma 9.8, p. 289.

Direct prerequisites: RefinedTraceMethods:RT.6/animated-aomega-extension; RefinedTraceMethods:RT.6/almost-free-elements; DerivedDeRhamCohomology:DD.5/proj-quasisyntomic-site; DerivedDeRhamCohomology:DD.0/cotangent-complex.

Proof or construction outline:

1. Use the derived Cartier description modulo (p,ξ) and the projectivity conditions to obtain a free module.
2. Lift a basis successively using (p,ξ)-completeness and derived Nakayama.
3. Apply the completed-free almost-elements calculation.

Acceptance:

- The special projectivity hypothesis cannot be dropped by QRSP discreteness alone.

### Cartier and Bockstein recognition of the comparison

**CartierComparisonTest** · theorem · RefinedTraceMethods:RT.6/cartier-comparison-test

Let A be the p-adic completion of a smooth O_C-algebra and η an E∞ O_C-algebra endomorphism of its p-completed de Rham complex. If H⁰ of its mod-p reduction is the identity, all cohomology maps of its mod-p reduction are the identity; hence η is an integral equivalence by derived p-completeness. The assertion is not that the integral endomorphism itself is the identity. Cartier and the Bockstein on differential generators give this recognition criterion for the AΩ comparison.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Lemma 9.9, pp. 289–290.

Direct prerequisites: DerivedDeRhamCohomology:DD.3/smooth-cartier; DerivedDeRhamCohomology:DD.3/derived-cartier-graded-pieces; RefinedTraceMethods:RT.6/animated-aomega-extension; AInfCohomology:AI.1/derived-decalage; AInfCohomology:AI.1/decalage-products; AInfCohomology:AI.1/bockstein-reduction.

Proof or construction outline:

1. Apply Cartier to express H* of the mod-p de Rham complex in terms of Frobenius-twisted differential forms.
2. Use the Bockstein to recover differential generators functorially from H⁰.
3. Multiplicativity fixes the mod-p exterior algebra; derived p-completeness then proves that the integral map is an equivalence.

Acceptance:

- A map preserving only the abstract dimensions of the graded pieces is not the required identity on H⁰.

### The honest trace-to-AΩ comparison

**AomegaComparison** · theorem · RefinedTraceMethods:RT.6/aomega-comparison

If C is complete algebraically closed over Q_p and A is the p-adic completion of a smooth O_C-algebra, there is a natural Frobenius-compatible equivalence C_A≃AΩ_A of E∞ Ainf-algebras. Its map is obtained by the almost comparison, left Kan extension to projective QRSP covers and completed-free extraction. It agrees modulo ξ with the identity on the p-completed de Rham complex. For arbitrary quasisyntomic A over O_C, comparison with AΩ^nc is made after the indicated Nygaard completion; AΩ^nc_A=C_A is not asserted before completion.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Theorem 9.6 and proof, pp. 286–290; Theorem 1.8.

Direct prerequisites: RefinedTraceMethods:RT.6/aomega-almost-map; RefinedTraceMethods:RT.6/projective-qrsp-aomega; RefinedTraceMethods:RT.6/cartier-comparison-test; RefinedTraceMethods:RT.6/trace-noncompleted-extension; RefinedTraceMethods:RT.6/animated-aomega-extension; DerivedDeRhamCohomology:DD.5/proj-quasisyntomic-site.

Proof or construction outline:

1. Extend the almost map to the animated functors, then use projective QRSP completed freeness to lift it to an honest map.
2. Unfold from that basis, retaining Frobenius.
3. Modulo ξ verify H⁰ modulo p is the identity, use the Cartier/Bockstein criterion, and finish with (p,ξ)-complete Nakayama.

Acceptance:

- On O_C the comparison is the canonical Ainf identification.
- On smooth A the comparison respects Frobenius and the ξ-specialization to p-completed de Rham cohomology.

### Nygaard agrees with the AΩ décalage filtration

**AomegaNygaardDecalage** · comparison · RefinedTraceMethods:RT.6/aomega-nygaard-decalage

For p-completed smooth O_C-algebra A, the Frobenius factorization C_A≃Lη_ξφ_*C_A identifies the Nygaard filtration with the Lη_ξ filtration on φ_*AΩ_A through the honest comparison. The graded description is the source’s truncation of the Hodge–Tate complex, using the AI.4 BMS1 Theorems 8.3 and 9.4(i) inputs; this is not a new definition of the generic Lη functor.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Proposition 9.10 and Remark 9.11, p. 290.

Direct prerequisites: RefinedTraceMethods:RT.6/aomega-comparison; RefinedTraceMethods:RT.6/smooth-trace-frobenius; AInfCohomology:AI.4; AInfCohomology:AI.1/derived-decalage; AInfCohomology:AI.1/filtered-beilinson-description.

Proof or construction outline:

1. Use the graded computation from Theorem 7.2 and the imported Hodge–Tate specialization.
2. Identify both filtrations on the Frobenius-twisted AΩ through their truncation description.
3. Use completeness and the filtered comparison to recover the full filtration.

Acceptance:

- The Frobenius pullback and ξ are retained in the filtration identity.

### The Segal comparison over O_C

**SegalOc** · theorem · RefinedTraceMethods:RT.6/segal-oc

For a smooth O_C-algebra A of relative dimension d, p-completed if necessary, gr^iTHH(A;Z_p)≃τ^{≤i}Ω̃_A{i}[2i] and gr^iTHH(A;Z_p)^tC_p≃Ω̃_A{i}[2i], where Ω̃_A is the imported Hodge–Tate complex. On graded pieces cyclotomic Frobenius is the truncation inclusion, and it is an isomorphism on π_n for n≥d.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Corollary 9.12, pp. 290–291.

Direct prerequisites: RefinedTraceMethods:RT.6/aomega-nygaard-decalage; RefinedTraceMethods:RT.6/perfectoid-quotient-comparison; AInfCohomology:AI.4.

Proof or construction outline:

1. Use the quotient TP/φ(ξ) to identify the finite-Tate graded pieces with Hodge–Tate specialization.
2. Apply the Nygaard/Lη comparison to identify the Frobenius map with truncation.
3. The relative dimension bound implies the high-degree equivalence.

Acceptance:

- The statement uses the Hodge–Tate complex over O_C, not ordinary untwisted de Rham forms.

### The p-adic Adams operations on traces

**AdamsOperations** · construction · RefinedTraceMethods:RT.6/adams-operations

The action of Z_p^× on the p-completed circle K(Z_p,1) gives functorial coherent E∞ cyclotomic Adams operations on THH(A;Z_p), and hence on the filtered THH, TC⁻, TP and TC. On C_A and each Nygaard step the action is trivial; on C_A{1} it is scalar multiplication, so γ acts by γ^i on each i-th graded piece, for i∈Z in its defined range.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Construction 9.13 and Proposition 9.14, pp. 291–292.

Direct prerequisites: RefinedTraceMethods:RT.6/aomega-comparison; RefinedTraceMethods:RT.6/trace-breuil-kisin-twist; RefinedTraceMethods:RT.6/bms1-twist-comparison; EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category; EnhancedDerivedSheaves:E5:presentability/coherent-group-actions; RefinedTraceMethods:RT.2/cyclic-realisation; RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh; RefinedTraceMethods:RT.2/cyclotomic-spectrum; RefinedTraceMethods:RT.2/tc-minus-and-tp; RefinedTraceMethods:RT.2/tc-fibre-sequence.

Proof or construction outline:

1. Identify p-completed THH with the p-completion of the E∞ tensor by K(Z_p,1).
2. Transport the automorphism action through the cyclotomic structure and complete filtered functors.
3. Use universality of Ainf, finite conormal/twist identifications and the equivariant AΩ comparison to compute the action; extend by QRSP descent and left Kan extension.

Uses deriving the API:

- RefinedTraceMethods:RT.6/graded-motivic-comparison: The γ^i formula verifies the twist and graded weight normalization.

API:

| Name | Role | Statement |
|---|---|---|
| AdamsOperations.action | structure | There is a coherent Z_p^× action on the p-completed trace functors. |
| AdamsOperations.map | functoriality | Ring maps commute with every operation ψ_γ. |
| AdamsOperations.coefficient | simp | ψ_γ acts trivially on C_A and its Nygaard ideals. |
| AdamsOperations.twist | simp | On C_A{i}, ψ_γ is multiplication by γ^i. |
| AdamsOperations.filtered | compatibility | The operations preserve motivic filtrations and commute with can and cyclotomic Frobenius. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| AdamsOperations.identity | degenerate | ψ_1 is the identity operation. |
| AdamsOperations.weightOne | computation | On gr¹TP the operation ψ_γ is multiplication by γ. |
| AdamsOperations.weightMinusOne | characterisation | On gr^(−1)TP the operation is γ^(−1), excluding the wrong uniform γ action. |

Acceptance:

- γ acts trivially in weight zero and by γ in weight one.

### THH of the sphere polynomial ring

**SpherePolynomialThh** · theorem · RefinedTraceMethods:RT.6/sphere-polynomial-thh

For S[z]=S[N], THH(S[z])≃S[Bcy N] as coherent S¹-equivariant E∞ ring spectra. Bcy N={0}∪(S¹×N_{>0}); t∈S¹ acts on (s,n) by (t^n s,n). The augmentation sends (s,n)↦n, and cyclotomic Frobenius is induced by (s,n)↦(s^p,pn) into C_p homotopy fixed points. The resulting augmentation square commutes with z↦z^p on S[z].

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Proposition 11.3, pp. 299–300.

Direct prerequisites: EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category; RefinedTraceMethods:RT.2/thh-spherical-group-rings; RefinedTraceMethods:RT.2/thh-symmetric-monoidal; RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh; StableHomotopyKTheory:H.5:spectra/operadic-algebras; StableHomotopyKTheory:H.5:spectra/ring-spectrum.

Proof or construction outline:

1. Apply THH’s cyclic bar construction to the free commutative monoid N.
2. Identify cyclic bar components with circle components and their degree-n action.
3. Apply the cyclotomic diagonal and augmentation to get the explicit Frobenius square.

Acceptance:

- The n=0 component is a point with trivial circle action; positive components have degree-n action.

### Relative cyclotomic THH over S[z]

**RelativeSphereThh** · construction · RefinedTraceMethods:RT.6/relative-sphere-thh

For a connective E∞ S[z]-algebra A, define THH(A/S[z])=THH(A)⊗_(THH(S[z]))S[z] with its coherent circle action. Its cyclotomic Frobenius is the composite formed from the absolute Frobenius, the z↦z^p augmentation square and the lax symmetric monoidal finite-Tate functor. It is semilinear over the cyclotomic base S[z] with trivial circle action and Frobenius z↦z^p. Define relative TC⁻ and TP by circle homotopy fixed points and Tate, respectively, with the p-completion convention of the source.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §11.1 definition and Construction 11.5, pp. 299–300.

Direct prerequisites: RefinedTraceMethods:RT.6/sphere-polynomial-thh; RefinedTraceMethods:RT.2/relative-thh; RefinedTraceMethods:RT.2/tate-multiplicativity; RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh; RefinedTraceMethods:RT.2/tc-minus-and-tp; EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category.

Proof or construction outline:

1. Form the relative E∞ tensor product and descend the circle action.
2. Construct the Frobenius via the commuting augmentation square and lax monoidal Tate map.
3. Keep its semilinear base action and residual S¹/C_p identification; apply homotopy fixed points and Tate.

Uses deriving the API:

- RefinedTraceMethods:RT.6/relative-thh-base-change: The relative tensor formula and semilinear Frobenius supply both base changes.
- RefinedTraceMethods:RT.6/relative-qrsp-evenness: Relative TC⁻/TP unfold to the Frobenius-twisted Breuil–Kisin trace complex.

API:

| Name | Role | Statement |
|---|---|---|
| RelativeSphereThh.tensor | constructor | Relative THH is the indicated tensor product of E∞ ring spectra. |
| RelativeSphereThh.circle | structure | Its coherent circle action is induced before homotopy fixed points. |
| RelativeSphereThh.frobenius | data | Its C_p-Tate Frobenius is semilinear for z↦z^p. |
| RelativeSphereThh.map | functoriality | S[z]-algebra maps induce cyclotomic relative trace maps. |
| RelativeSphereThh.tcMinus | constructor | Relative TC⁻ is p-completed homotopy fixed points and TP is p-completed circle Tate. |

Unit tests:

| Name | Kind | Statement |
|---|---|---|
| RelativeSphereThh.base | degenerate | THH(S[z]/S[z])≃S[z] with trivial circle action and Frobenius z↦z^p. |
| RelativeSphereThh.specializeZero | compatibility | For O_K-algebra A with z↦π, specialization z↦0 gives absolute THH(A⊗^L_(O_K)k). |
| RelativeSphereThh.perfectRootBase | compatibility | After adjoining all p-power roots of z and p-completing, relative THH agrees with absolute THH on the corresponding base-changed algebra. |

Acceptance:

- This is relative THH; the base S[z] itself has relative THH equal to S[z] with trivial circle action.

### The two base changes of relative THH

**RelativeThhBaseChange** · theorem · RefinedTraceMethods:RT.6/relative-thh-base-change

Let O_K be a complete mixed-characteristic DVR with perfect residue field k, π a uniformizer and O_K∞ the p-adic completion after adjoining all p-power roots of π. For an O_K-algebra A viewed over S[z] by z↦π, THH(A/S[z])⊗_(S[z])S≃THH(A⊗^L_(O_K)k), compatibly with circle and Frobenius. The p-completion of THH(S[z^(1/p∞)])→S[z^(1/p∞)] is an equivalence, and after this base extension the p-completed relative THH of A equals THH(A⊗^L_(O_K)O_K∞;Z_p).

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Lemma 11.6; Proposition 11.7; Corollary 11.8, p. 301.

Direct prerequisites: RefinedTraceMethods:RT.6/relative-sphere-thh; DerivedDeRhamCohomology:DD.0/cotangent-complex; RefinedTraceMethods:RT.1/base-change; RefinedTraceMethods:RT.2/relative-thh; RefinedTraceMethods:RT.2/thh-symmetric-monoidal; RefinedTraceMethods:RT.2/thh-over-thhz; RefinedTraceMethods:RT.2/cyclotomic-frobenius-thh; AInfCohomology:AI.0.

Proof or construction outline:

1. Use the regular-uniformizer base-change squares of E∞ rings for z=0.
2. The p-completed cotangent complex of Z[z^(1/p∞)] vanishes; the imported integral HKR and THH-to-HH comparisons give the perfect-root-base equivalence.
3. Apply relative THH tensor base change and the perfect-root-base equivalence to obtain the second comparison, including Frobenius.

Acceptance:

- All base changes are derived; ordinary tensor is used only when its flatness hypothesis has been supplied.

### The relative DVR coefficient calculation

**RelativeDvrCoefficients** · theorem · RefinedTraceMethods:RT.6/relative-dvr-coefficients

In the preceding setup put frakS=W(k)[[z]], φ(z)=z^p, and frakS^(−1)=frakS with its frakS-algebra structure through φ. Let E be the Eisenstein polynomial of π. Then π_*THH(O_K/S[z];Z_p)=O_K[u], π_*TC⁻=P(frakS^(−1),E), π_*TP=frakS^(−1)[σ±¹], and π_*THH^tC_p=O_K[π^(1/p)][σ±¹]. Here |u|=|σ|=2 and |v|=−2. can sends u↦Eσ,v↦σ⁻¹; Frobenius acts on coefficients by φ and sends u↦σ,v↦φ(E)σ⁻¹. The vertical specializations use θ^(−1):z↦π and θ̃^(−1):z↦π^(1/p).

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Proposition 11.10 and its preceding notation, pp. 302–303.

Direct prerequisites: RefinedTraceMethods:RT.6/uv-presentation; RefinedTraceMethods:RT.6/relative-thh-base-change; RefinedTraceMethods:RT.6/perfectoid-tc-maps; AInfCohomology:AI.0.

Proof or construction outline:

1. Use the Frobenius-twisted embedding frakS^(−1)→Ainf(O_K∞), z↦[π^flat].
2. Apply the perfectoid coefficient computation and the two relative base changes.
3. Retain the two Fontaine specializations and the Frobenius-twisted scalar ring in the comparison square.

Acceptance:

- The coefficient ring is frakS^(−1), not an untwisted identification of frakS-algebras.

### Relative evenness and acyclicity on QRSP covers

**RelativeQrspEvenness** · theorem · RefinedTraceMethods:RT.6/relative-qrsp-evenness

For S∈QRSPerfd_(O_K), the p-completed relative THH(S/S[z]), TC⁻ and TP are even, and their even homotopy groups are sheaves on the relative QRSP basis with vanishing higher cohomology on every S in that basis. The unfolded gr⁰TC⁻≃gr⁰TP is an E∞ frakS^(−1)-algebra with semilinear Frobenius, (p,z)-complete. Through BS Proposition 15.7 this trace complex is the Nygaard completion of φ^*Δ_(A/frakS), where the relative prism and generic Nygaard completion are supplied by PR.2–3.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Proposition 11.11 and Corollary 11.12, pp. 303–305; [Bhargav Bhatt and Peter Scholze](https://arxiv.org/pdf/1905.08229v4), Proposition 15.7 and proof, p. 105.

Direct prerequisites: RefinedTraceMethods:RT.6/relative-dvr-coefficients; RefinedTraceMethods:RT.6/relative-thh-base-change; RefinedTraceMethods:RT.6/qrsp-tc-nygaard; RefinedTraceMethods:RT.6/trace-prismatic-comparison; DerivedDeRhamCohomology:DD.5/quasisyntomic-site; DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings; PrismaticCohomology:PR.2/derived-prismatic-cohomology; PrismaticCohomology:PR.2/regular-quotient-prismatic-envelope; PrismaticCohomology:PR.3/nygaard-completion.

Proof or construction outline:

1. Base change to O_K∞, apply perfectoid-base evenness and descent, and descend using the relative coefficient calculation.
2. Unfold π₀ in the complete target category.
3. Compare with the Frobenius pullback of the independent relative prism by BS Proposition 15.7: extend z^(1/p∞), use Theorem 13.1, then recognize the divided-power filtration and apply derived (p,z)-Nakayama.

Acceptance:

- The relative trace complex corresponds to φ^*Δ before completing; omitting φ^* changes the statement.

### The even TC sheaf in characteristic p

**CharacteristicPTcSheaf** · theorem · RefinedTraceMethods:RT.6/characteristic-p-tc-sheaf

On QRSPerfd_(F_p), for i≥0 there is an exact sequence of sheaves 0 → π_(2i)TC(−;Z_p) → π_(2i)TC⁻(−;Z_p) →^(φ−can) π_(2i)TP(−;Z_p) → 0. For i>0 the corresponding divided-Frobenius-minus-one operator on a QRSP ring is pointwise surjective; in weight zero surjectivity is sheaf-local by Artin–Schreier covers. Thus TC is locally even on this site. This stops before identifying its even K-groups, which is downstream GeneralAlgebraicKTheory Part II.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Lemma 8.19 and TC-sheaf part of Proposition 8.20, pp. 280–281.

Direct prerequisites: RefinedTraceMethods:RT.6/crystalline-trace-comparison; RefinedTraceMethods:RT.6/tc-negative-degrees; RefinedTraceMethods:RT.6/syntomic-graded-tc; DerivedDeRhamCohomology:DD.5/quasisyntomic-site; DerivedDeRhamCohomology:DD.5/quasiregular-semiperfectoid-rings.

Proof or construction outline:

1. Use Nygaard p-divisibility to prove pointwise surjectivity in positive weights modulo p and then lift p-adically.
2. Use Artin–Schreier covers in weight zero.
3. Apply the long exact homotopy sequence of the TC fiber as a sequence of sheaves.

Acceptance:

- TC(F_p;Z_p) still has π_(−1)=Z_p at the point; the sheaf statement does not erase this pointwise group.

### Syntomic complexes from sheafified even K-groups

**SyntomicKSheaf** · comparison · RefinedTraceMethods:RT.6/syntomic-k-sheaf

For a p-quasisyntomic scheme X, n≥1 and i≥0, the finite syntomic complex Z/p^n(i)_X in D(X_et,Z/p^n) is the derived pushforward from the syntomic site of X to its étale site of the sheafification of the presheaf K_(2i)(−;Z/p^n). Here p-quasisyntomic means bounded p-power torsion and L_(R/Z)⊗^L_R R/p of Tor-amplitude [−1,0] on affine opens. This is Bhatt–Mathew’s announced Example 1.6, not an identification of the un-sheafified K-group presheaf or of the two sites.

Source: [Bhargav Bhatt and Akhil Mathew](https://arxiv.org/pdf/2202.04818v2), Example 1.6, p. 2.

Direct prerequisites: RefinedTraceMethods:RT.6/syntomic-graded-tc; RefinedTraceMethods:RT.6/characteristic-p-tc-sheaf; RefinedTraceMethods:RT.3/cyclotomic-trace; RefinedTraceMethods:RT.3/dgm-theorem; RefinedTraceMethods:RT.3/kinv-truncating; GeneralAlgebraicKTheory:K.4; PrismaticCohomology:PR.4; DerivedDeRhamCohomology:DD.5/quasisyntomic-site; GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring; PrismaticCohomology:PR.4/syntomic-complex.

Proof or construction outline:

1. Supply the cyclotomic-trace rigidity comparison from RT.3 and the finite-coefficient K-spectrum from K.4.
2. Identify even TC sheaves and the independently supplied finite syntomic complexes in their stated site.
3. Prove the passage from the quasisyntomic computation to the syntomic-to-étale derived pushforward and its descent. Bhatt–Mathew states this result without proof; the exact site-comparison input is a recorded gap.

Acceptance:

- The sheafification precedes derived pushforward; replacing it by pointwise K_(2i) gives a different statement.
- Weights i=0 and i=1 must agree with the imported constant and Kummer syntomic sheaves.

### The filtered trace interface for the Beilinson bridge

**AmmnFilteredInterface** · comparison · RefinedTraceMethods:RT.6/ammn-filtered-interface

For R∈qSyn_(Z_p), in particular p-completely flat over Z_p with the quasisyntomic bounds, the RT.6 motivic filtrations, the cyclic Hodge filtration and the trace maps provide the graded natural comparison used by RT.3b in AMMN Theorem 6.17. On relative QRSP covers, τ_[2i−1,2i] of the rational-after-p-completion TC/HC⁻/HP square is its weight-i square. Unfolding and left Kan extension from p-completed polynomial algebras factor the Hodge-completed comparison through uncompleted LΩ_R and LΩ_R^{≥i}. The pullback theorem and its integral range i≤p−2 are imported from RT.3b; RT.6 supplies its filtration and map-level compatibility, not a second Beilinson theorem.

Source: [Benjamin Antieau, Akhil Mathew, Matthew Morrow and Thomas Nikolaus](https://arxiv.org/pdf/2003.12541v2), Theorem 6.17 and proof, pp. 44–45.

Direct prerequisites: RefinedTraceMethods:RT.6/cyclic-derham-comparison; RefinedTraceMethods:RT.6/syntomic-graded-tc; RefinedTraceMethods:RT.6/motivic-filtrations; RefinedTraceMethods:RT.6/characteristic-p-tc-sheaf; RefinedTraceMethods:RT.3b/qp-coefficients; RefinedTraceMethods:RT.3b/beilinson-fibre-sequence; RefinedTraceMethods:RT.3b/graded-beilinson-square; DerivedDeRhamCohomology:DD.2/p-completed-derham; DerivedDeRhamCohomology:DD.2/hodge-completed-derham; DerivedDeRhamCohomology:DD.2/hodge-graded-pieces.

Proof or construction outline:

1. Use QRSP evenness of HC⁻ and HP to identify the two-degree truncation with the stated graded terms, after p-completion and then inverting p.
2. Use quasisyntomic unfolding and the finite-filtration map compatibility.
3. Use the source’s left Kan extension of Z_p(i) from p-completed polynomial algebras to remove Hodge completion in the target; provide this natural factorization to RT.3b.

Acceptance:

- No square for arbitrary rings with uncontrolled p-torsion is asserted.
- The bridge is independent of PR.7 and feeds its F-crystal application.

### The mixed-complex comparison compatibility

**MixedComplexMapCompatibility** · theorem · RefinedTraceMethods:RT.6/mixed-complex-map-compatibility

For R-linear homological mixed complexes (C,b_C,B_C),(D,b_D,B_D) with |b|=−1 and |B|=1, let f be a chain map commuting with B. For every n and c∈C_n, (f_(n−1)(b_Cc),f_(n+1)(B_Cc))=(b_D(f_nc),B_D(f_nc)). Therefore coefficientwise f commutes with b+uB on the direct-sum, product and Laurent totalizations supplied by RT.1, with |u|=−2. The suggested signature prototypes the actual chain map and degree-one maps in Mathlib; the higher circle-equivariant comparison requires RT.1–2.

Source: [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Corollary 3.4 proof, pp. 218–219; Proposition 5.15 proof, pp. 241–242; ordinary chain-level compatibility from the pinned Hom.comm statement.

Direct prerequisites: mathlib:ChainComplex; mathlib:HomologicalComplex.Hom.comm; RefinedTraceMethods:RT.1/mixed-complex; RefinedTraceMethods:RT.1/cyclic-homology; RefinedTraceMethods:RT.1/derived-mixed-complex.

Proof or construction outline:

1. Use the existing chain-map commutation equality for b.
2. Use the supplied B-commutation for the second component.
3. Apply the equalities coefficientwise in the mixed-complex totalizations, retaining products for negative cyclic homology.

Acceptance:

- Identity maps satisfy the compatibility.
- Setting B=0 gives the ordinary chain-map compatibility.
- A chain map failing to commute with B does not induce this negative-cyclic comparison.

## Mandatory added-source coverage

Every BMS item assigned to RT.6 by this issue has an explicit destination. Supporting generic objects are imported in those nodes.

| Extracted BMS item | RT.6 declaration |
|---|---|
| PAPER-BHATT-MORROW-SCHOLZE-19/004 | PerfectoidTcMaps |
| PAPER-BHATT-MORROW-SCHOLZE-19/006 | AomegaComparison |
| PAPER-BHATT-MORROW-SCHOLZE-19/007 | CrystallineTraceComparison |
| PAPER-BHATT-MORROW-SCHOLZE-19/008 | TraceNygaardComplex |
| PAPER-BHATT-MORROW-SCHOLZE-19/009 | MotivicFiltration |
| PAPER-BHATT-MORROW-SCHOLZE-19/010 | TraceBreuilKisinTwist |
| PAPER-BHATT-MORROW-SCHOLZE-19/011 | GradedMotivicComparison |
| PAPER-BHATT-MORROW-SCHOLZE-19/012 | SyntomicGradedTc |
| PAPER-BHATT-MORROW-SCHOLZE-19/015 | CyclicDerhamComparison |
| PAPER-BHATT-MORROW-SCHOLZE-19/027 | TraceFlatDescent |
| PAPER-BHATT-MORROW-SCHOLZE-19/044 | QrspHochschild |
| PAPER-BHATT-MORROW-SCHOLZE-19/045 | CyclicDerhamComparison |
| PAPER-BHATT-MORROW-SCHOLZE-19/046 | PerfectoidThh |
| PAPER-BHATT-MORROW-SCHOLZE-19/047 | PerfectoidTcMaps |
| PAPER-BHATT-MORROW-SCHOLZE-19/048 | PerfectoidQuotientComparison |
| PAPER-BHATT-MORROW-SCHOLZE-19/049 | TraceBreuilKisinTwist |
| PAPER-BHATT-MORROW-SCHOLZE-19/050 | Bms1TwistComparison |
| PAPER-BHATT-MORROW-SCHOLZE-19/052 | ThhHochschildDeformation |
| PAPER-BHATT-MORROW-SCHOLZE-19/053 | Antisymmetrization |
| PAPER-BHATT-MORROW-SCHOLZE-19/054 | QuasismoothThhFiltration |
| PAPER-BHATT-MORROW-SCHOLZE-19/055 | QrspEvenThh |
| PAPER-BHATT-MORROW-SCHOLZE-19/056 | QrspTcNygaard |
| PAPER-BHATT-MORROW-SCHOLZE-19/057 | MotivicFiltration |
| PAPER-BHATT-MORROW-SCHOLZE-19/058 | TraceNygaardComplex |
| PAPER-BHATT-MORROW-SCHOLZE-19/059 | SmoothTraceFrobenius |
| PAPER-BHATT-MORROW-SCHOLZE-19/060 | TraceNoncompletedExtension |
| PAPER-BHATT-MORROW-SCHOLZE-19/061 | MotivicFiltration |
| PAPER-BHATT-MORROW-SCHOLZE-19/062 | FilteredInvertibility |
| PAPER-BHATT-MORROW-SCHOLZE-19/065 | TcNegativeDegrees |
| PAPER-BHATT-MORROW-SCHOLZE-19/084 | CrystallineTraceComparison |
| PAPER-BHATT-MORROW-SCHOLZE-19/085 | GroupAlgebraTraceTest |
| PAPER-BHATT-MORROW-SCHOLZE-19/086 | SegalCharP |
| PAPER-BHATT-MORROW-SCHOLZE-19/091 | AlmostRootIdeals |
| PAPER-BHATT-MORROW-SCHOLZE-19/092 | AlmostDecalageLimit |
| PAPER-BHATT-MORROW-SCHOLZE-19/093 | AlmostFreeElements |
| PAPER-BHATT-MORROW-SCHOLZE-19/094 | AnimatedAomegaExtension |
| PAPER-BHATT-MORROW-SCHOLZE-19/095 | AomegaAlmostComparison |
| PAPER-BHATT-MORROW-SCHOLZE-19/096 | ProjectiveQrspAomega |
| PAPER-BHATT-MORROW-SCHOLZE-19/097 | AomegaNygaardDecalage |
| PAPER-BHATT-MORROW-SCHOLZE-19/099 | SegalOc |
| PAPER-BHATT-MORROW-SCHOLZE-19/100 | AdamsOperations |
| PAPER-BHATT-MORROW-SCHOLZE-19/106 | SpherePolynomialThh |
| PAPER-BHATT-MORROW-SCHOLZE-19/107 | RelativeSphereThh |
| PAPER-BHATT-MORROW-SCHOLZE-19/108 | RelativeThhBaseChange |
| PAPER-BHATT-MORROW-SCHOLZE-19/109 | RelativeDvrCoefficients |
| PAPER-BHATT-MORROW-SCHOLZE-19/110 | RelativeQrspEvenness |
| PAPER-BHATT-MORROW-SCHOLZE-19/116 | CharacteristicPTcSheaf |

PAPER-SCHOLZE-26/38 is AlmostModuleKTheory. PAPER-BHATT-MATHEW-23/008 is SyntomicKSheaf, with the announced-proof gap retained. Added-paper items explicitly assigned to RT.1–3 remain inputs from those sibling stages. The TC-internal negative-degree calculation stops before the downstream K-rank and even-K-sheaf identifications.

| Added source item | Declaration |
|---|---|
| PAPER-BHATT-MATHEW-23/008 | SyntomicKSheaf |
| PAPER-SCHOLZE-26/38 | AlmostModuleKTheory |
| Construction 1.3; Theorem 3.14(a) | RefinedInvariantUniversality, RefinedKuComputation |
| Theorem 3.14(b) | RefinedKuPeriodicComputation |
| Theorem 6.17 filtered proof interface | AmmnFilteredInterface |

The MW rows cover the scoped algebraic coefficient computation; its analytic interpretation and expected refined Habiro descent are not asserted. AMMN’s pullback theorem belongs to RT.3b; RT.6 supplies its filtered trace input. Generic cotangent/HKR and de Rham–Witt constructions are imported from RT.1/DD. The BMS geometric descent and concrete K-identifications belong to their downstream owners.

## Owner requests

### EnhancedDerivedSheaves:E5:presentability

Construct PrL_st and E-linear presentable stable modules with coherent tensor, internal Hom, left/right duals, strongly continuous adjoints, and the left-adjoint Yoneda embedding for dualizable categories. Supply ω₁/cardinal presentations, enriched small-category and spectral-presheaf interfaces, functor categories and mapping spectra, compatible Day convolution/localization, and the complete filtered/ind/pro module targets. Existing Ind/presentability nodes are imported separately; ordinary one-categories or a monoidal homotopy category do not supply these coherence and size data.

Consumers: RefinedTraceMethods:RT.5/dualizable-categories; RefinedTraceMethods:RT.5/trace-class; RefinedTraceMethods:RT.5/continuous-calkin; RefinedTraceMethods:RT.5/localizing-motives; RefinedTraceMethods:RT.5/relative-nuclear-module; RefinedTraceMethods:RT.5/nuclear-module-resolution; RefinedTraceMethods:RT.5/enriched-duality; RefinedTraceMethods:RT.5/rigidification; RefinedTraceMethods:RT.5/algebra-killing; RefinedTraceMethods:RT.5/smooth-proper-category; RefinedTraceMethods:RT.5/localization-tower-formula; RefinedTraceMethods:RT.5/refined-traces; RefinedTraceMethods:RT.5/even-derived-hom; RefinedTraceMethods:RT.5/even-completed-tensor; RefinedTraceMethods:RT.6/filtered-invertibility; RefinedTraceMethods:RT.5/trace-class-functoriality; RefinedTraceMethods:RT.5/rigidity-criterion; RefinedTraceMethods:RT.5/circle-completion-equivalence.

### GeneralAlgebraicKTheory:K.6

Extend the concrete flasque-enlargement/suspension nonconnective spectrum to enhanced idempotent-complete small stable categories and E-linear categories. Prove its agreement with the existing Frobenius-pair model, Morita invariance, all-degree localization and filtered-colimit laws, plus relative/nonunital agreement for the almost-module application. RT.5 uses this concrete spectrum and proves motive corepresentability; it does not define K by universality.

Consumers: RefinedTraceMethods:RT.5/continuous-extension; RefinedTraceMethods:RT.5/localizing-motives; RefinedTraceMethods:RT.5/almost-module-k.

### StableHomotopyKTheory:H.6

Supply the multiplicative Moore-spectrum input identified in RT-AREA-ktheory-2/29: Burklund Theorem 1.5, with E_n structures on S/p^(n+1) at odd p and the specified S/8 and S/32 cases at p=2. Supply the compatible E₁/E₂ high-powered Moore/quotient towers and uniqueness hypotheses actually used by MW Proposition 2.27, Corollary 2.30 and Lemma 3.12; a bare mapping cofiber does not suffice. Also supply a coherent complete filtered-spectrum exact-couple interface with derived-limit convergence, extending the existing homotopy-category spectral sequence.

Consumers: RefinedTraceMethods:RT.5/torsion-qhodge; RefinedTraceMethods:RT.5/even-derived-hom; RefinedTraceMethods:RT.5/pro-qhodge-idempotence; RefinedTraceMethods:RT.5/graded-trace-class; RefinedTraceMethods:RT.6/motivic-convergence.

### HabiroCohomologyFoundations:HQ.3

Supply the chosen finite-torsion q-Hodge filtrations and qHdg objects on derived qdR(Z/m)/Z used in MW Corollary 3.8 and Theorem 3.14, with m varying along the compatible high-powered Moore tower. State the separate p=2 choice/input if the general supplied spherical E₂ lift assumes 2 invertible. Supply transition maps, graded shearing, derived t/(q−1)-completion and compatibility with the general HQ.3/q-hodge-filtrations and /the-q-hodge-complex nodes; no universal functorial choice for all animated rings is presumed.

Consumers: RefinedTraceMethods:RT.5/torsion-qhodge.

### AInfCohomology:AI.0

Supply the perfectoid ring/tilt and Ainf=W(R^flat) interface, θ, ξ, θ̃=θφ⁻¹, μ=[ε]−1 and ξ_r=μ/φ^(−r)(μ), their regularity and p-completion identities. Supply the symmetric monoidal almost quotient for W(m_C^flat), its annihilation criterion and derived almost-elements adjoint, plus the BMS1 conormal/twist and finite θ̃_r maps used in Remark 6.6. The completed-free and root-limit special theorems are proved here; the generic almost category is imported.

Consumers: RefinedTraceMethods:RT.6/perfectoid-thh; RefinedTraceMethods:RT.6/perfectoid-tc-maps; RefinedTraceMethods:RT.6/trace-nygaard-complex; RefinedTraceMethods:RT.6/smooth-trace-frobenius; RefinedTraceMethods:RT.6/trace-breuil-kisin-twist; RefinedTraceMethods:RT.6/bms1-twist-comparison; RefinedTraceMethods:RT.6/almost-root-ideals; RefinedTraceMethods:RT.6/almost-decalage-limit; RefinedTraceMethods:RT.6/almost-free-elements; RefinedTraceMethods:RT.6/animated-aomega-extension; RefinedTraceMethods:RT.6/aomega-almost-map; RefinedTraceMethods:RT.6/relative-thh-base-change; RefinedTraceMethods:RT.6/relative-dvr-coefficients.

### AInfCohomology:AI.4

Supply the geometric AΩ=Lη_μRΓ(pro-étale Ainf) E∞ functor on p-completed smooth O_C-algebras, Frobenius and its (p,ξ)-completeness; its ξ/de Rham and ξ̃/Hodge–Tate comparisons including BMS1 Theorems 8.3 and 9.4(i). Supply the BMS1 Breuil–Kisin–Fargues twist and its finite-TR/conormal dictionary. RT.6 owns the trace-to-AΩ comparison and its animated extension and does not route these proofs back through the late AI.7 application.

Consumers: RefinedTraceMethods:RT.6/bms1-twist-comparison; RefinedTraceMethods:RT.6/animated-aomega-extension; RefinedTraceMethods:RT.6/aomega-almost-map; RefinedTraceMethods:RT.6/aomega-nygaard-decalage; RefinedTraceMethods:RT.6/segal-oc.

### KTheoryFiniteLocalFields:L.5

Supply Bökstedt THH(F_p)=F_p[u], and the coherent finite-field Frobenius and finite-Tate inputs of NS18 Corollary IV.4.8, Proposition IV.4.9, Corollary IV.4.10, Lemma IV.4.12 and Corollary IV.4.13, with the integral S¹-equivariant Z→THH(F_p) map and the weak-Postnikov convergence conditions. RT.6 uses these to compute perfectoid coefficients and the Q_p/Z_p group-algebra test; it does not redevelop local-field K-theory.

Consumers: RefinedTraceMethods:RT.6/perfectoid-thh; RefinedTraceMethods:RT.6/perfectoid-tc-maps; RefinedTraceMethods:RT.6/group-algebra-trace-test.

### GeneralAlgebraicKTheory:K.4

Supply a functorial finite-coefficient K-spectrum on unital rings/syntomic local rings with K(R;Z/p^n)=K(R)⊗^L Z/p^n and its even homotopy presheaves, proving agreement with the existing K.2 ring space in the connective range. Include cyclotomic trace compatibility through RT.3. BM Example 1.6 requires finite-coefficient groups, not tensoring the integral even groups with Z/p^n.

Consumers: RefinedTraceMethods:RT.6/syntomic-k-sheaf.

### PrismaticCohomology:PR.4

Extend the existing independent quasisyntomic syntomic-complex node to the finite syntomic complex sheaves on the étale site of p-quasisyntomic schemes used in BM Example 1.6, including the site functor and Kummer/constant base cases. Supply the change-of-site comparison from the quasisyntomic construction to the syntomic-to-étale derived pushforward without defining the complexes by K or TC. RT.6 compares with this independent construction; the PR.4→RT.6 link is the corrected acyclic direction.

Consumers: RefinedTraceMethods:RT.6/syntomic-k-sheaf.

### RefinedTraceMethods:RT.1

Supply mixed-complex HH/HC⁻/HP totalizations with maps, the integral derived HKR filtration by left Kan extension, its p-completely quasismooth form, and coherent THH-to-HH comparison compatibility; negative cyclic homology uses product totalization.

Consumers: RefinedTraceMethods:RT.6/trace-flat-descent; RefinedTraceMethods:RT.6/qrsp-hochschild; RefinedTraceMethods:RT.6/cyclic-derham-comparison; RefinedTraceMethods:RT.6/thh-hochschild-deformation; RefinedTraceMethods:RT.6/antisymmetrization; RefinedTraceMethods:RT.6/group-algebra-trace-test; RefinedTraceMethods:RT.6/relative-thh-base-change; RefinedTraceMethods:RT.6/mixed-complex-map-compatibility.

### RefinedTraceMethods:RT.2

Supply the enhanced cyclotomic THH/TC⁻/TP/TC functors with coherent circle/finite-C_m Frobenius, weak-Postnikov/Tate comparison, classical TR/TC equivalence and Witt π₀TR. Include relative base-change and lax monoidal Tate maps; an ordinary circle action on homotopy groups is insufficient.

Consumers: RefinedTraceMethods:RT.5/refined-traces; RefinedTraceMethods:RT.6/trace-flat-descent; RefinedTraceMethods:RT.6/perfectoid-thh; RefinedTraceMethods:RT.6/perfectoid-tc-maps; RefinedTraceMethods:RT.6/perfectoid-quotient-comparison; RefinedTraceMethods:RT.6/thh-hochschild-deformation; RefinedTraceMethods:RT.6/motivic-filtrations; RefinedTraceMethods:RT.6/bms1-twist-comparison; RefinedTraceMethods:RT.6/filtered-frobenius; RefinedTraceMethods:RT.6/tc-negative-degrees; RefinedTraceMethods:RT.6/group-algebra-trace-test; RefinedTraceMethods:RT.6/adams-operations; RefinedTraceMethods:RT.6/sphere-polynomial-thh; RefinedTraceMethods:RT.6/relative-sphere-thh; RefinedTraceMethods:RT.6/relative-thh-base-change; RefinedTraceMethods:RT.5/circle-completion-equivalence.

### RefinedTraceMethods:RT.3

Supply the finite-coefficient trace, nilpotent relative K/TC comparison and truncating invariant through RT.3/cyclotomic-trace, RT.3/dgm-theorem and RT.3/kinv-truncating. The henselian-pair rigidity needed for BM Example 1.6 is not supplied by these nodes: route it to the proposed RefinedTraceMethodsPartIIHenselianPairs, then specify the syntomic-to-etale site comparison separately. Keep this request open until that owner and exact supplier node are established; downstream even K-sheaf identifications are not an input to their own construction.

Consumers: RefinedTraceMethods:RT.6/syntomic-k-sheaf.

### RefinedTraceMethods:RT.3b

Supply the AMMN Beilinson pullback theorem, its maps χ_i to uncompleted p-derived dR, the rational-after-p-completion convention, uniform isogeny bounds and the integral range i≤p−2, under R∈qSyn_Zp. RT.6 supplies the filtered even-trace input. PR.7 is a consumer and is not required to construct this bridge.

Consumers: RefinedTraceMethods:RT.6/ammn-filtered-interface.

### RefinedTraceMethods:RT.4:topological

Supply ku and KU as coherent oriented even bases, Bott localization, their circle-homotopy-fixed-point coefficient rings and the even-filtered periodic convergence proof.

Consumers: RefinedTraceMethods:RT.5/refined-ku-periodic-computation; RefinedTraceMethods:RT.5/torsion-qhodge.

### RefinedTraceMethods:RT.4:q-Hodge

Supply Wagner Theorem 4.27 with 4.18(A),(R) and 4.18a(R2), and its E_(n−1) enhancement precisely under Remark 4.28’s E_n lift hypotheses (2≤n≤∞). Supply Theorem 5.63 with 2∈R× and 5.43(A2), as a Z[β±1]-linear graded module equivalence, and separately justify any multiplicative enhancement used. Retain Σ^(−2i), completion and Bott localization. For MW finite Moore/Z/m inputs, prove the separate torsion and p=2 extension with compatible transitions; these inputs are not covered automatically by the 2-invertible theorem.

Consumers: RefinedTraceMethods:RT.5/refined-ku-periodic-computation; RefinedTraceMethods:RT.6/habiro-trace-interface; RefinedTraceMethods:RT.5/torsion-qhodge.

### RefinedTraceMethods:RT.4:Habiro-comparison

Supply the genuine finite-C_m cyclonic comparison, residual-circle fixed points and periodic Habiro reconstruction under Wagner 4.18, 2∈R× and 5.43(A2). For R=O_F[1/Δ] require 6|Δ and disc(F)|Δ, and use the spherical étale lift of Corollary 6.15. Supply coherent transition maps and prove any multiplicative enhancement separately; neither a graded module equivalence nor HR.2’s bounded-below solid embedding provides it for periodic KU.

Consumers: RefinedTraceMethods:RT.5/refined-ku-periodic-computation; RefinedTraceMethods:RT.6/habiro-trace-interface; RefinedTraceMethods:RT.5/torsion-qhodge.

### StableHomotopyKTheory:H.5:spectra

Supply coherent modules over even E1/E-infinity ring spectra, graded homotopy modules, double-speed Whitehead filtrations and their filtered derived internal Hom/tensor with shearing. Combine E5 complete filtered derived categories with H.6 connectivity, coconnectivity and derived-completion estimates from MW Lemmas 3.9 and 3.11 (pp. 33–35). Existing model-category and Postnikov nodes do not by themselves supply this entire interface; these general types belong to H.5/E5/H.6, not to the RT.2 trace functors.

Consumers: RefinedTraceMethods:RT.5/even-derived-hom; RefinedTraceMethods:RT.5/even-completed-tensor.

## Gaps and coverage refinements

The target-level planning pass covers every scoped target. These refinements remain explicit prerequisites for closing the stages; the higher suggested declarations are mathematical contracts.

**Coherent foundation and suggested signatures.** The pinned baseline has no PrL_st, coherent spectral/animated/complete-filtered target library. All higher definition and theorem signatures are therefore omitted as code under protocol §13; the suggested file records their exact names and mathematical contracts in comments. E5 and SHKTh provide the types and coherence before these can become genuine signatures. The arithmetic, coefficient-ring and chain-map signatures are stated against actual baseline types.

Needed by: RefinedTraceMethods:RT.5/motives-rigidity; RefinedTraceMethods:RT.5/refined-invariant-universality; RefinedTraceMethods:RT.5/refined-ku-computation; RefinedTraceMethods:RT.5/refined-ku-periodic-computation; RefinedTraceMethods:RT.6/trace-prismatic-comparison; RefinedTraceMethods:RT.6/graded-motivic-comparison; RefinedTraceMethods:RT.6/syntomic-graded-tc; RefinedTraceMethods:RT.6/habiro-trace-interface; RefinedTraceMethods:RT.5/dualizable-categories; RefinedTraceMethods:RT.5/trace-class; RefinedTraceMethods:RT.5/rigid-category; RefinedTraceMethods:RT.5/nuclear-objects; RefinedTraceMethods:RT.5/continuous-calkin; RefinedTraceMethods:RT.5/localizing-invariant; RefinedTraceMethods:RT.5/continuous-extension; RefinedTraceMethods:RT.5/continuous-extension-uniqueness; RefinedTraceMethods:RT.5/localizing-motives; RefinedTraceMethods:RT.5/relative-nuclear-module; RefinedTraceMethods:RT.5/nuclear-module-resolution; RefinedTraceMethods:RT.5/enriched-duality; RefinedTraceMethods:RT.5/rigidification; RefinedTraceMethods:RT.5/algebra-killing; RefinedTraceMethods:RT.5/smooth-proper-category; RefinedTraceMethods:RT.5/refined-base-change; RefinedTraceMethods:RT.5/localization-tower-formula; RefinedTraceMethods:RT.5/refined-traces; RefinedTraceMethods:RT.5/torsion-qhodge; RefinedTraceMethods:RT.5/even-derived-hom; RefinedTraceMethods:RT.5/torsion-duality; RefinedTraceMethods:RT.5/even-completed-tensor; RefinedTraceMethods:RT.5/pro-qhodge-idempotence; RefinedTraceMethods:RT.5/graded-trace-class; RefinedTraceMethods:RT.5/almost-module-k; RefinedTraceMethods:RT.6/trace-flat-descent; RefinedTraceMethods:RT.6/qrsp-hochschild; RefinedTraceMethods:RT.6/cyclic-derham-comparison; RefinedTraceMethods:RT.6/perfectoid-thh; RefinedTraceMethods:RT.6/perfectoid-tc-maps; RefinedTraceMethods:RT.6/perfectoid-quotient-comparison; RefinedTraceMethods:RT.6/thh-hochschild-deformation; RefinedTraceMethods:RT.6/antisymmetrization; RefinedTraceMethods:RT.6/quasismooth-thh-filtration; RefinedTraceMethods:RT.6/qrsp-even-thh; RefinedTraceMethods:RT.6/qrsp-tc-nygaard; RefinedTraceMethods:RT.6/trace-nygaard-complex; RefinedTraceMethods:RT.6/smooth-trace-frobenius; RefinedTraceMethods:RT.6/trace-noncompleted-extension; RefinedTraceMethods:RT.6/motivic-filtrations; RefinedTraceMethods:RT.6/filtered-invertibility; RefinedTraceMethods:RT.6/trace-breuil-kisin-twist; RefinedTraceMethods:RT.6/bms1-twist-comparison; RefinedTraceMethods:RT.6/filtered-frobenius; RefinedTraceMethods:RT.6/motivic-convergence; RefinedTraceMethods:RT.6/tc-negative-degrees; RefinedTraceMethods:RT.6/crystalline-trace-comparison; RefinedTraceMethods:RT.6/group-algebra-trace-test; RefinedTraceMethods:RT.6/segal-char-p; RefinedTraceMethods:RT.6/almost-root-ideals; RefinedTraceMethods:RT.6/almost-decalage-limit; RefinedTraceMethods:RT.6/almost-free-elements; RefinedTraceMethods:RT.6/animated-aomega-extension; RefinedTraceMethods:RT.6/aomega-almost-map; RefinedTraceMethods:RT.6/projective-qrsp-aomega; RefinedTraceMethods:RT.6/cartier-comparison-test; RefinedTraceMethods:RT.6/aomega-comparison; RefinedTraceMethods:RT.6/aomega-nygaard-decalage; RefinedTraceMethods:RT.6/segal-oc; RefinedTraceMethods:RT.6/adams-operations; RefinedTraceMethods:RT.6/sphere-polynomial-thh; RefinedTraceMethods:RT.6/relative-sphere-thh; RefinedTraceMethods:RT.6/relative-thh-base-change; RefinedTraceMethods:RT.6/relative-dvr-coefficients; RefinedTraceMethods:RT.6/relative-qrsp-evenness; RefinedTraceMethods:RT.6/characteristic-p-tc-sheaf; RefinedTraceMethods:RT.6/syntomic-k-sheaf; RefinedTraceMethods:RT.6/ammn-filtered-interface; RefinedTraceMethods:RT.5/trace-class-functoriality; RefinedTraceMethods:RT.5/rigidity-criterion; RefinedTraceMethods:RT.5/nuclear-closure; RefinedTraceMethods:RT.5/smooth-proper-normalization; RefinedTraceMethods:RT.5/circle-completion-equivalence.

**General rigidification construction.** For a general presentable symmetric monoidal stable target, expand the κ/universe and Q-indexed rigidification proof behind MW Construction 1.3, which cites Ramzi Construction 4.75. The source statement is located and the sequential nuclear special case is planned, but the full external proof and independence of the large κ choice have not been audited here; supply this proof before treating the universality node as closed.

Needed by: RefinedTraceMethods:RT.5/rigidification; RefinedTraceMethods:RT.5/refined-invariant-universality.

**Multiplicative relative motive localization.** Audit the Day-convolution localization in the E-linear accessible enriched-category setting, including tensor compatibility of exact/Morita/cardinal relations and compactness of the motive of E. Efimov’s result and BGT’s absolute localization/corepresentability are read, but the complete relative enriched multiplicative proof needs the requested E5 interfaces and an explicit comparison of the cardinal conventions.

Needed by: RefinedTraceMethods:RT.5/localizing-motives; RefinedTraceMethods:RT.5/motives-rigidity.

**Compatible Moore and finite q-Hodge choices.** The required Burklund multiplicative Moore tower is not supplied by the existing cofiber-only H.6 node. RT.4 and HQ.3 must verify the separate finite-torsion/p=2 extension of the q-Hodge comparison and its chosen transitions; the 2-invertible spherical-lift theorem alone does not justify every high-powered m. Keep these requests open for MW’s ku/KU computation. Exact RT.4:q-Hodge and RT.4:Habiro-comparison references identify the qualified comparison contracts only; they do not discharge the residual finite-torsion or p=2 hypotheses.

Needed by: RefinedTraceMethods:RT.5/torsion-qhodge; RefinedTraceMethods:RT.5/pro-qhodge-idempotence; RefinedTraceMethods:RT.5/graded-trace-class; RefinedTraceMethods:RT.5/refined-ku-computation; RefinedTraceMethods:RT.5/refined-ku-periodic-computation.

**BM announced K-sheaf comparison proof.** Example 1.6 states without proof that the finite syntomic complex is the syntomic-to-étale derived pushforward of sheafified even K-groups. Supply the precise change-of-site/descent argument, the rigidity comparison in this site and finite-coefficient normalization from the requested owners. Neither BMS’s QRSP even TC computation nor abstract rigidity alone identifies these two sites. RT.3 proves the nilpotent comparison, not the required full henselian-pair rigidity. The latter is routed to the proposed henselian-pair Part II; the exact new supplier and site-level proof remain open.

Needed by: RefinedTraceMethods:RT.6/syntomic-k-sheaf.

**Habiro multiplicativity and periodic reconstruction.** The general q-Hodge and Habiro module/coefficient objects have exact existing supplier nodes, but the coherent finite-C_m cyclonic comparison, chosen spherical étale lift, and periodic unbounded reconstruction are RT.4 proof obligations. The HR.2 bounded-below solid comparison cannot by itself justify periodic KU; the supplied RT.4 periodic proof is required. MW’s expected refined Habiro descent is not a proved theorem and is excluded from the asserted interface. Wagner Theorem 5.63 states a graded module equivalence. Its multiplicative enhancement is a separate requested proof; Remark 4.28 concerns Theorem 4.27 under specified E_n lifts.

Needed by: RefinedTraceMethods:RT.6/habiro-trace-interface; RefinedTraceMethods:RT.5/refined-ku-periodic-computation.

**Grading and spectrum realization of the coefficient presentation.** The suggested ring quotient and can/Frobenius maps have actual baseline types. Their ℤ-homotopical grading, E∞ spectral realization and equivalence to the perfectoid/relative TC⁻ spectra require the supplied spectral library and remain contracts. An underlying ungraded quotient is not a formalization of TC⁻.

Needed by: RefinedTraceMethods:RT.6/uv-presentation; RefinedTraceMethods:RT.6/perfectoid-tc-maps; RefinedTraceMethods:RT.6/relative-dvr-coefficients.

**Unbounded derived convergence implementation.** The motivic filtration and the source’s bounded smooth specializations are planned with complete/exhaustive derived abutments. A coherent exact-couple and derived-limit implementation, including the precise obstruction to strong convergence when no boundedness is available, must come from H.6; no unconditional ordinary strong-convergence claim is used. For RT.5/even-derived-hom and RT.5/even-completed-tensor, also supply the coherent filtered module categories, shearing and double-speed Whitehead operations requested from H.5/E5; no exact existing supplier covers that package.

Needed by: RefinedTraceMethods:RT.6/motivic-convergence; RefinedTraceMethods:RT.6/motivic-filtrations; RefinedTraceMethods:RT.5/even-derived-hom; RefinedTraceMethods:RT.5/even-completed-tensor.

**RefinedTraceMethods:RT.5: planned.** Remaining:

- Audit the general Q-indexed rigidification and its κ/universe independence.
- Expand the relative enriched multiplicative motive-localization proof and concrete K model comparison.
- Resolve E5/GeneralK/H.6 interfaces and the chosen finite-torsion/p=2 q-Hodge comparison before closing the rational ku/KU computation.

**RefinedTraceMethods:RT.6: planned.** Remaining:

- Resolve the Ainf, AΩ and finite-field Tate proof interfaces and complete coherent spectral/filtered signatures.
- Supply the announced BM Example 1.6 site-change and rigidity proof.
- Resolve the qualified Habiro periodic reconstruction and map-level descent contracts.
- Implement the grading/spectral realization of the elementary coefficient prototype and the unbounded derived convergence interface.

## Source corrections and routing notes

The packet retains seven confirmed source findings. The descriptions here give the correction and reason in our own words, with source locators and attribution to the earlier findings.

**RefinedTraceMethods/E1 — [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Proof of Theorem 7.1, p. 255.** Correction: (Γ^i_S M)^∧_p Reason: M = π_1(L_{S/R})^∧_p is an S-module and the identification just before uses Γ^i_S M (Lemma 5.14); the statement of Theorem 7.1(3) and the next paragraph also use Γ^i_S. Status: Already recorded and confirmed in PAPER-BHATT-MORROW-SCHOLZE-19/E3; correction retained in this packet. Independent review: confirmed (REV-RefinedTraceMethods--RT.5).

**RefinedTraceMethods/E2 — [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Theorem 7.2(2), p. 255.** Correction: Use the homotopy fixed point and Tate spectral sequences of S to filter C_S; replace the base-ring label R by S in both trace arguments. Reason: The filtration on π_0 of TC^-(S; Z_p) and TP(S; Z_p) comes from their own spectral sequences, whose degeneration is part (1); the spectral sequences for the perfectoid base R filter π_0TC^-(R; Z_p) = A_inf(R), not Δ̂_S. Status: Already recorded and confirmed in PAPER-BHATT-MORROW-SCHOLZE-19/E4; correction retained in this packet. Independent review: confirmed (REV-RefinedTraceMethods--RT.5).

**RefinedTraceMethods/E3 — [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §7.4, first paragraph, p. 261.** Correction: Z_p(i)(A) := gr^i TC(A; Z_p)[−2i] Reason: The weight must match the shift [−2i] and the right-hand side; Theorem 1.12(5) defines Z_p(n) = gr^n TC[−2n]. Status: Already recorded and confirmed in PAPER-BHATT-MORROW-SCHOLZE-19/E5; correction retained in this packet. Independent review: confirmed (REV-RefinedTraceMethods--RT.5).

**RefinedTraceMethods/E4 — [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Proof of Theorem 9.6, 'Lifting the almost comparison map', p. 288.** Correction: an honest map d_S : Δ_S → AΩ_S Reason: The map is indexed by S ∈ qrsPerfd^proj_{O_C}, and the next sentence and the unfolding d_A call it d_S; no R occurs in this step. Status: Already recorded and confirmed in PAPER-BHATT-MORROW-SCHOLZE-19/E9; correction retained in this packet. Independent review: confirmed (REV-RefinedTraceMethods--RT.5).

**RefinedTraceMethods/E5 — [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §11.2, paragraph before Proposition 11.10, p. 302.** Correction: the inclusion 𝔖 ↪ A_inf(O_{K_∞}) fixed earlier Reason: Notation 11.1 embeds 𝔖 in A_inf(O_{K_∞}) (or A_inf); O_K is not perfectoid, and A_inf(O_K) is not the ring used anywhere in §11. Status: Already recorded and confirmed in PAPER-BHATT-MORROW-SCHOLZE-19/E11; correction retained in this packet. Independent review: confirmed (REV-RefinedTraceMethods--RT.5).

**RefinedTraceMethods/E6 — [Bhargav Bhatt, Matthew Morrow and Peter Scholze](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), Published DOI PDF, proof of Lemma 9.4, p. 285; text and page image checked 8 October 2026.** Correction: The sequences lie in ∏_(i∈I) O_C. Reason: The preceding line defines N=∏ O_C and M/ξ is a completed free O_C-module. The mixed-characteristic valuative argument uses p in O_C. The page image of the published DOI PDF still prints the flat superscript. Status: The slip was recorded as PAPER-BHATT-MORROW-SCHOLZE-19/E8. Its assertion that the published PDF corrects it disagrees with the published DOI PDF inspected here; the mathematical correction itself is the same. Independent review: confirmed (REV-RefinedTraceMethods--RT.5).

**RefinedTraceMethods/E7 — [Samuel Meyer and Ferdinand Wagner](https://arxiv.org/pdf/2410.23115v4), arXiv:2410.23115v4, Definition 1.1(b), p. 2.** Correction: The classifier is 1 → X_n^∨ ⊗ X_(n+1). The forward transition has source X_n and target X_(n+1). Reason: Evaluation of the printed classifier induces X_(n+1) → X_n, the reverse direction. Definition 2.1 in the same paper gives the correctly ordered classifier for f:X→Y. This packet uses that body definition. Status: No correction located in the v4 introduction/body comparison; recorded for independent source review. Independent review: confirmed (REV-RefinedTraceMethods--RT.5).

RT-AREA-ktheory-2/28–29: RT.5 imports RT.4:q-Hodge and RT.4:Habiro-comparison for Meyer–Wagner Theorem 3.14; their hypotheses and finite-torsion extensions are explicit supplier obligations. H.6 must supply the multiplicative Moore tower with the Burklund structures and compatible transitions; its additive cofiber alone is insufficient.

RT-AREA-ktheory-2/36: PR.4 independently constructs syntomic fibers and supplies RT.6, which proves the graded TC comparison. PR.3/bms2-comparison supplies independent prismatic recognition and Nygaard completion; RT.6 constructs the trace-to-prismatic comparison.

The BMS extraction’s AI.0, AI.4, L.5 and DD.4 inputs are represented by exact nodes or precise requests. The filtered décalage description comes directly from AI.1. PR.6’s very-small qΩ→AΩ comparison is a separate geometric construction and is not an input to the trace-to-AΩ proof. AI.7 and PR.7 consume the trace results. The AMMN filtered interface imports RT.3b’s theorem and supplies its trace inputs to PR.7.

The edition discrepancy in PAPER-BHATT-MORROW-SCHOLZE-19/E8 remains a maintainer note: the independently reviewed published DOI page 285 retains the flat superscript, despite the extraction’s correction metadata. E6 retains both the mathematical correction and that discrepancy.
