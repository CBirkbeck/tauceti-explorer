# Roadmap: completed cohomology and p-adic local–global compatibility over Q

**Summary.** Build the arithmetic comparison maps and multiplicity theory of completed modular and quaternionic cohomology, starting with completed-tower and local-representation APIs. The end results are Emerton’s Banach and refined local–global compatibility, its mod-p and homology forms, the definite quaternionic and Pan comparisons, and the patched-module support theorems used in modularity lifting. The final layer distinguishes consequences assuming residual modularity from consequences using Serre’s theorem.

## Scope and ownership

The work here concerns arithmetic specialisations and comparison theorems. Existing completed-tower carriers, abstract patching, local deformation representability and local Langlands constructions retain their suppliers’ definitions. An arithmetic comparison below adds the named geometric tower, coefficient system, Hecke operators or integral normalisation; it does not introduce a replacement generic carrier.

| Mathematics | Owner |
|---|---|
| Generic completed towers, coefficient limits, duality, admissibility, descent, supports, the CC.8 modular/Hilbert/quaternionic realisation, the completed Hecke algebra as an inverse limit and its residual localisation | CompletedCohomologyPartII CC.0–CC.8  |
| Finite-level modular curves, cohomology with coefficients, boundary, Hecke correspondences, bad fibres | ModularCurvesPartII R13–R14 |
| Finite-level quaternionic forms and Shimura-curve cohomology, Jacquet–Langlands at finite level | HilbertModularVarietiesAndShimuraCurves R18.3–R18.4, GL2AutomorphicRepresentationsAndTransfer R17.3 |
| Galois representations of eigenforms and finite-level Hecke determinants | AutomorphicGaloisRepresentations R19.1–R19.6, IntegralHeckeAndGaloisDeterminants |
| Global and local deformation rings, Taylor–Wiles primes, abstract patching and support | GlobalGaloisDeformations, LocalGaloisDeformationRings, DeformationAndDerivedPatchingAlgebra |
| Definite unitary groups and their algebraic modular forms (for the CEGGPS globalisation) | PotentialAutomorphyInfrastructurePartII PL.2 |
| Colmez's functor, B(V), Kisin's equivalence, Paškūnas's blocks and projective envelopes, Berger–Breuil, purely local Breuil–Mézard ingredients | PadicLocalLanglandsForGL2Qp R30.2–R30.5  |
| Local Langlands in families away from p (co-Whittaker families W and their smooth duals Π) | SmoothRepresentationsOfLocalGroups SR.5 (Tau Ceti) |
| Scholze's functor S^i | ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, layers SZ.0–SZ.1 only |
| The patched eigenvariety and Ding's definite-unitary multiplicity input | CompletedCohomologyAndLocalGlobalCompatibilityPartII |
| The lifting theorems and their own dependency audit | GL2ModularityLifting R22, R32 (consumers) |

Three pieces of mathematics move down into this roadmap from its consumers: Pan's pro-modular primes and the nice-prime conditions of his Theorem 4.1.7 (from GL2ModularityLifting R32.4), and the potentially crystalline, non-crystabelline case of Emerton's Theorem 3.3.22 on locally algebraic vectors, whose proof is global and cannot sit in PadicLocalLanglandsForGL2Qp without a stage cycle.


Mathlib already supplies continuous maps, intertwining maps, tensor products, ideal kernels and zero loci. In particular, algebraic multiplicities use `Representation.IntertwiningMap`; their continuous variant uses `ContIntertwiningMap`. The notation `V(Ann_R M)` uses `PrimeSpectrum.zeroLocus` and `Module.annihilator` directly, while `Module.support` is reserved for localisation support; the two need an explicit finiteness argument before identification. Generic completion/reduction maps, topological algebra closure and Mahler approximation are imported. Only their arithmetic comparison maps are targets here.

The ProfiniteArithmetic and LocalGaloisGroups roadmaps supply profinite arithmetic and local absolute Galois structure. They do not supply completed automorphic towers, coadmissible cancellation or the Pan Iwasawa-dimension comparison. OperatorTheory does not replace the integral complete-local-coefficient representation categories used here. SmoothRepresentationsOfLocalGroups SR.5 supplies co-Whittaker families, the rank-one derivative and arbitrary-coefficient endomorphisms; the integral smooth-dual comparison below is extra.

## Conventions

- E is a finite extension of Q\_p with ring of integers O, uniformiser ϖ and residue field k; G = GL₂(Q\_p); for a finite set Σ₀ of primes not containing p, Σ = Σ₀ ∪ {p}, G\_{Σ₀} = ∏\_{ℓ∈Σ₀} GL₂(Q\_ℓ) and K₀^Σ = ∏\_{ℓ∉Σ} GL₂(Z\_ℓ).
- Completed cohomology at tame level K^p is the ϖ-adic completion of the p-level colimit of étale cohomology of the modular curves Y(K\_pK^p); the colimit over tame levels is taken afterwards, with the locally convex (O-linear) inductive-limit topology. Ordinary, compactly supported and interior cohomology are kept distinct; localisation at a residual Hecke ideal is taken on the completed object through CompletedCohomologyPartII's residual projectors.
- The G- and GL₂(A\_f)-actions follow Emerton (lg §2): the actions of Carayol's papers twisted by g ↦ (g^{-1})^t. Hecke operators T\_ℓ and S\_ℓ are the double cosets of diag(ℓ, 1) and diag(ℓ, ℓ); in the modular-curve convention Frobenius elements are geometric, and a Galois representation attached to a Hecke eigensystem has characteristic polynomial X² − T\_ℓX + ℓS\_ℓ at Frob\_ℓ.
- V_f denotes the cohomological Galois factor of an eigenform, with geometric Frobenius polynomial X² − a_ℓ(f)X + χ(ℓ)ℓ^{k−1}. Its dual is the usual arithmetic-Frobenius representation with the same polynomial. Pan’s quaternionic determinant ψε^{-1} and Tung’s ψ_Tε are kept in their own conventions; identifying their characters and reciprocal Hecke operators is the normalisation comparison specified below.
- B denotes the p-adic local Langlands correspondence for GL₂(Q\_p) in Kisin's deformation-theoretic formulation; π\_ℓ(V) for ℓ ≠ p is Emerton's modified local Langlands representation (the generic one in the Tate normalisation).
- A residual representation ρ̄ is p-distinguished if ρ̄|G\_{Q\_p} is not, after semisimplification, the sum of two copies of one character; Assumption 3.3.1 excludes ρ̄|G\_{Q\_p} ≅ χ ⊗ (1 ∗; 0 ε̄).
- Every theorem keeps its source's hypotheses, including small primes: Emerton's main results need ρ̄ absolutely irreducible and the exclusions above, his mod p theorem needs p > 2, Tung treats all odd p and p = 2 separately, and Pan assumes p odd and excludes a block at p = 3.


For a left action on X, translation on functions is `(g·f)(x)=f(g⁻¹x)`. Thus `(g·f)(gx)=f(x)` and `(gh)·f=g·(h·f)`. The definite arithmetic right action is turned into this left action by inversion. With `f(zx)=ψ(z)f(x)`, inverse translation acts centrally by `ψ(z)⁻¹`; this distinction is retained when matching Pan’s right translation. A weight W is paired with W* with its contragredient action, never W with itself unless a duality is specified. For example, on a scalar weight t, the dual scalar is t⁻¹, and evaluation of a functional at a weight vector has scalar t⁻¹t=1.

Coefficient completion always uses ϖ, not p. If O is ramified of ramification index e, p is a unit times ϖ^e: O/p and O/ϖ coincide only when e=1. All rational comparisons invert p (equivalently ϖ), whereas reduction statements specify their exact exponent. Integral results are not asserted for arbitrary equal-characteristic complete DVRs.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. The declarations below fix the vocabulary; their existence alone does not supply arithmetic descent or local–global compatibility.

- `mathlib:AdicCompletion` (Mathlib/RingTheory/AdicCompletion/Basic.lean): The I-adic completion of a module as compatible sequences in the quotients M/I^nM.
- `mathlib:CompactSpace` (Mathlib/Topology/Defs/Filter.lean): Compactness of a topological space; this class does not assert Hausdorffness, total disconnectedness or profiniteness of a raw arithmetic quotient.
- `mathlib:ContinuousLinearMap` (Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean): Continuous semilinear maps between topological modules, used for the continuous multiplicity Hom spaces.
- `mathlib:ContinuousMap` (Mathlib/Topology/ContinuousMap/Defs.lean): Continuous maps C(X, Y); the carrier of C(X(U^p), M) for the definite quaternionic tower.
- `mathlib:CuspForm` (Mathlib/NumberTheory/ModularForms/Basic.lean): Cusp forms of weight k for a subgroup Γ, the classical objects compared with completed cohomology.
- `mathlib:Field.absoluteGaloisGroup` (Mathlib/FieldTheory/AbsoluteGaloisGroup.lean): The absolute Galois group of a field as a topological group (G\_Q, G\_{Q\_p}).
- `mathlib:IsDedekindDomain.FiniteAdeleRing` (Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean): The finite adele ring of a Dedekind domain’s fraction field, as a restricted product of completions.
- `mathlib:IsLocalRing` (Mathlib/RingTheory/LocalRing/Defs.lean): Local rings (the local factors of completed Hecke algebras).
- `mathlib:IsNilpotent` (Mathlib/Algebra/GroupWithZero/Basic.lean): Nilpotent elements; used for nilpotent kernels of pseudo-deformation-to-Hecke maps.
- `mathlib:IsNoetherianRing` (Mathlib/RingTheory/Noetherian/Defs.lean): Noetherian rings (T\_{ρ̄,Σ}, A).
- `mathlib:IsReduced` (Mathlib/Algebra/GroupWithZero/Basic.lean): Reduced rings (completed Hecke algebras are reduced).
- `mathlib:LocallyConstant` (Mathlib/Topology/LocallyConstant/Basic.lean): Locally constant functions; smooth quaternionic forms at finite level.
- `mathlib:Matrix.GeneralLinearGroup` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): GL\_n(R) as the units of n × n matrices.
- `mathlib:ModularForm` (Mathlib/NumberTheory/ModularForms/Basic.lean): Modular forms of weight k for a subgroup Γ.
- `mathlib:Module.Finite` (Mathlib/RingTheory/Finiteness/Defs.lean): Finitely generated modules.
- `mathlib:Module.Flat` (Mathlib/RingTheory/Flat/Basic.lean): Flat modules (O-flatness of Hecke algebras and multiplicity modules).
- `mathlib:Module.Free` (Mathlib/LinearAlgebra/FreeModule/Basic.lean): Free modules (type-specialised modules at small level).
- `mathlib:Module.Projective` (Mathlib/Algebra/Module/Projective.lean): Projective modules (injectivity/projectivity of localised completed (co)homology).
- `mathlib:Module.annihilator` (Mathlib/RingTheory/Ideal/Maps.lean): The annihilator ideal of a module, defining support of patched modules.
- `mathlib:Module.support` (Mathlib/RingTheory/Support.lean): The support of a module in Spec R, via localisations.
- `mathlib:MvPowerSeries` (Mathlib/RingTheory/MvPowerSeries/Basic.lean): Multivariable formal power series, the patching rings R\_∞ and S\_∞.
- `mathlib:PrimeSpectrum.zeroLocus` (Mathlib/RingTheory/Spectrum/Prime/Basic.lean): Zero loci V(s) in Spec R (pro-modular primes, supports).
- `mathlib:QuaternionAlgebra` (Mathlib/Algebra/Quaternion.lean): Quaternion algebras over a commutative ring with parameters a, b, c.
- `mathlib:RingCat.sectionsSubring` (Mathlib/Algebra/Category/Ring/Limits.lean): Compatible sections of a functor to rings as a subring of the product; the inverse-limit Hecke algebra.
- `mathlib:RingHom.ker` (Mathlib/RingTheory/Ideal/Maps.lean): Kernel ideal of a ring homomorphism.
- `mathlib:Subalgebra.topologicalClosure` (Mathlib/Topology/Algebra/Algebra.lean): Topological closure of a subalgebra (weak closure of the Hecke image).
- `mathlib:TensorProduct` (Mathlib/LinearAlgebra/TensorProduct/Defs.lean): Tensor products of modules.
- `mathlib:ringKrullDim` (Mathlib/RingTheory/KrullDimension/Basic.lean): Krull dimension of a commutative ring (dimension bounds for Hecke algebras).
- `mathlib:PadicInt.dense_span_mahler` (Mathlib/NumberTheory/Padics/MahlerBasis.lean): For prime p and a complete ultrametric normed coefficient algebra R with bounded Z\_p scalar action, the R-linear span of Mahler polynomial functions is dense in C(Z\_p,R). Apply with a finite extension E of Q\_p; the finite-product/clopen-subset approximation in R31.2 is a routine extension.
- `mathlib:AdicCompletion.eval_surjective` (Mathlib/RingTheory/AdicCompletion/Basic.lean): Surjectivity of each completion evaluation map, for every module.
- `mathlib:AdicCompletion.pow_smul_top_eq_ker_eval` (Mathlib/RingTheory/AdicCompletion/Completeness.lean): For a finitely generated ideal I, the kernel of the nth evaluation is I^n times the completion; together with evaluation surjectivity this gives the coefficient-quotient comparison.


`Representation.IntertwiningMap` (Mathlib/RepresentationTheory/Intertwining.lean) is the algebraic equivariant Hom carrier. `ContIntertwiningMap` (Mathlib/RepresentationTheory/Continuous/Basic.lean) supplies the continuous equivariant Hom when the representation carriers are present. The full-support implication for a reduced ring is `PrimeSpectrum.zeroLocus_eq_univ_iff`, combined with the reduced nilradical criterion; it is not a second support construction. For the continuous Galois actions, use the topological absolute Galois groups with the normalisations of LocalGaloisGroups and ClassFieldTheory.

### From completed arithmetic towers

CompletedCohomologyPartII CC.0–CC.2 supplies coefficient towers, fixed-exponent smooth colimits and coefficient-limit completions; CC.3 supplies continuous duals, mixed tensor carriers and orthonormalisable/profree modules; CC.5 supplies admissibility after the finite-cell and compact p-adic analytic hypotheses are verified; CC.6–CC.7 supplies coefficient comparison and completed Borel–Moore duality. CC.8 supplies arithmetic modular/Shimura realisation, transported actions, central quotients and completed Hecke localisation. ArithmeticLocallySymmetricSpaces ALS.6 supplies tame and p-power tower geometry. The comparison maps below use these carriers literally.

The following are exact extensions of supplier interfaces. They are prerequisites to the indicated arithmetic results, with their stated prime and residual restrictions. The extension is mathematical work to prove; no stronger supplier theorem is presumed.

### Arithmetic and representation-theoretic supplier specifications

- **PadicLocalLanglandsForGL2Qp R30.2.** For G = GL\_2(Q\_p): (i) the categories of admissible G-representations on orthonormalizable modules over a complete local noetherian O-algebra A (Emerton lg §3.1, Definition 3.1.1), with the facts used for completed tensor products: Emerton lg Proposition 3.1.3 (a continuous equivariant map between admissible continuous representations has closed image), Lemmas 3.1.6, 3.1.16 (ϖ-adic separatedness of Π ⊗̂\_A M for M^\* finitely generated) and 3.1.17 (𝔭-parts of Π ⊗̂\_A M), and Lemma B.6; (ii) Emerton’s ordinary-parts functor Ord\_B on admissible representations with its adjunction Hom\_G(Ind\_B^G U, V) ≅ Hom\_T(U, Ord\_B V) (Emerton, Ordinary parts I, Theorem 4.4.6) and its compatibility with completed cohomology as used in lg Proposition 6.2.2 and Corollary 5.6.13; (iii) Emerton’s locally analytic Jacquet functor J\_B with left exactness, as used in lg §7.2. Needed by: §4.5, §6.1.
- **PadicLocalLanglandsForGL2Qp R30.3.** Colmez’s Montréal functor MF (and Paškūnas’s normalisation V̌) on admissible finite-length G-representations, exact and compatible with central characters; for ρ̄: G\_{Q\_p} → GL\_2(k) not a twist of (1 ∗; 0 ε̄), Colmez’s π̄ with MF(π̄) ≅ ρ̄, central character det(ρ̄)ε̄, no finite-dimensional subobject or quotient (Emerton lg Theorem 3.3.2); the explicit mod p correspondence for irreducible ρ̄ (supersingular π̄ attached to Ind ω\_2^{r+1}, used in DLB Lemme 5.6 and in the socle description of Serre weights). Needed by: §4.1, §4.6, §5.3, §5.4, §5.6, §6.4.
- **PadicLocalLanglandsForGL2Qp R30.4.** (i) Topological irreducibility of B(V) for absolutely irreducible V (Emerton lg Proposition 3.3.24; Colmez Theorem 0.17(ii)); (ii) Colmez’s non-vanishing of locally algebraic vectors for de Rham V with distinct Hodge–Tate weights (Theorem VI.6.18) and the description B(V)\_{l.alg} ≅ Sym^{a−b−1} ⊗ det^{b+1} ⊗ π\_p(V) in the crystabelline and semistable cases (Theorem VI.6.50) and its dependence only on π\_p(V) and the weights (Theorem VI.6.42); (iii) Berger–Breuil: for crystalline absolutely irreducible V with π\_p(V) unramified, B(V) is the universal unitary completion of its correctly normalised locally algebraic factor, giving the extension property for maps from that factor for unitary Banach Π; (iv) Colmez’s locally algebraic vectors for potentially semistable V in the form used by Tung (Corollary 4.3). The potentially crystalline, non-crystabelline case of Emerton lg Theorem 3.3.22 is the global argument of §6.3. Use R30.4’s locally algebraic vectors, Berger–Breuil completion and Henniart types in their precise local ranges. Keep the a,b convention, including the normalisation bridge below. Dyadic applications require the all-p Berger–Breuil theorem. Needed by: §4.5, §4.4, §4.9, §4.11, §5.4, §6.1, §6.3.
- **PadicLocalLanglandsForGL2Qp R30.5.** (i) Kisin’s theorem (Emerton lg Theorem 3.3.13): Def^\*(π̄) → Def(ρ̄) fully faithful, restricting to an equivalence Def^{crys}(π̄) ≅ Def^{crys}(ρ̄) (and Def^{crys} = Def under Assumption 3.3.1, Emerton Remark 3.3.14); (ii) the universal deformation π\_p of π̄\_p over R\_p when End(ρ̄\_p) = k, and for absolutely irreducible ρ̄\_p the orthonormalizable admissible family Π^{univ} with Π^{univ} ⊗ k(𝔭) ≅ Π(𝔭) (DLB §13); (iii) Paškūnas’s blocks of the category of compact O[[GL\_2(Z\_p)]]-modules with G-action and central character, the projective envelope P\_B of the sum of the block simples, with E\_B = End(P\_B) finite over the image of the central pseudo-deformation map (Pan Theorems 3.4.5–3.4.6, Corollary 3.4.12); no general integral centre isomorphism is assumed, the finite generation of Hom(P\_B, M) over E\_B for admissible duals (Paškūnas, Image of Colmez’s functor, Proposition 4.17), Theorem 1.10 of that paper (irreducible subquotients of a specialisation at an absolutely irreducible point are isomorphic), and the projective envelope P̃ of the dual of the socle of π̄\_p with R\_p ≅ End(P̃) and π\_p^\* ≅ P̃ (Nakamura Proposition B.26); (iv) the 2-adic versions used by Tung. Use /kisin-deformation-comparison for (i) and /dual-of-universal-deformation for Nakamura’s projective-envelope identification under p ≥ 5 and its two residual exclusions. Use /local-r-equals-t for a finite central map at small p, with its stated p-torsion qualifications; Pan Corollary 3.4.12 only supplies a finite central map for a product block, not an integral centre isomorphism. Match these precise ranges, including dyadic comparison, before claiming a supplier covers a use. Specifically extend the dual-envelope and removal-of-envelope statements from the p ≥ 5 range to Nakamura’s p = 3 hypotheses before using them there. Needed by: §4.1, §4.4, §4.7, §4.8, §4.9, §4.10, §4.11, §5.4, §5.6.
- **SmoothRepresentationsOfLocalGroups SR.5.** Import SR.5’s co-Whittaker family W, free rank-one top derivative and arbitrary-coefficient endomorphism statement (Helm–Moss 2018), and form its smooth O-dual Π. Also require the exact p > 2 mod-ϖ m-torsion comparison for Π in EM11 Theorem 6.1.2, pp. 66–67, including its integral lattice and cohomological local-Langlands normalisation; prove it for the integral lattice, without commuting a smooth dual with arbitrary reduction. The p = 2 weaker statement is retained separately. Import minimal supercuspidal types from R30.4/henniart-types. Needed by: §4.1, §4.4, §4.7, §5.2, §6.3.
- **ModularCurvesPartII R14.6.** At a prime ℓ ≠ p where the level has Iwahori (Γ\_0(ℓ)) structure and the curve has the semistable model of R13.5: (i) the Hecke algebra generated by T\_q, S\_q for q prime to the level acts on the component group Φ of the Néron model of the Jacobian through an Eisenstein quotient, so Φ\_m = 0 for a non-Eisenstein m (Ribet, Invent. Math. 100 (1990), Corollary on p. 140, under the neatness of the level away from ℓ); (ii) geometric Frobenius at ℓ acts on the character group (torus) part of the special fibre by ℓ^{-1}U\_ℓ (Ribet, Proposition 3.8). The component-group and toric Frobenius assertions are required in addition to R14.6’s character-group sequences and good-reduction Eichler–Shimura relation. Needed by: §4.2.
- **CompletedCohomologyPartII CC.8.** Extend CC.8/definite-unitary-degree-zero (stated for LLHLM §5.3’s definite outer form of GL\_3) to the definite unitary groups G̃ of rank n over a totally real F̃^+ used by CEGGPS §2.3 (Clozel–Harris–Taylor/Thorne type, quasi-split at finite places, compact at infinity): the completed degree-zero object lim\_s colim\_{U\_p} S\_{ξ,τ}(U\_pU^p, O/ϖ^s) with its tame Hecke and GL\_n(F̃^+\_p)-actions is the CC.2 completed object of the finite discrete tower, with the same stabiliser caveat. Needed by: §5.1.
- **PadicLocalLanglandsForGL2Qp R30.3.** Supply the local Serre-weight Hecke module and its identification with Hom\_K(V,π̄) in EM11 §3.5, Definitions 3.5.2–3.5.4 and Lemma 3.5.5, pp. 31–32. H(V) ≅ k[T,Z,Z^{-1}]; the explicit geometric-Frobenius action for reducible ρ̄\_p and T = 0 for absolutely irreducible ρ̄\_p must use the same cohomological weight convention as R15. R30’s Montréal/supersingular definitions alone do not state this Hecke-module comparison. Needed by: §2.4, §4.4.
- **ModularCurvesPartII R14.4.** Extend the enhanced-Ihara kernel bound to the precise non-Eisenstein mod-p tower assertion used by EM11 Theorem 5.7.7(3) and p. 89: no finite-dimensional GL\_2(Q\_ℓ)-subobjects for each ℓ ∈ Σ\_0, with the required Serre-weight coefficient functor. Supply the good-weight mod-p Hecke-socle multiplicity-one and Whittaker-derivative statement of Theorem 5.7.7(2), including its classical U\_ℓ = 0 input, or identify its exact other owner. No injectivity assertion is inferred from the ordinary congruence-kernel estimate alone. Needed by: §2.4, §4.4, §4.6.
- **AutomorphicGaloisRepresentations R19.6.** The small-weight input in EM11 Theorem 5.7.7(1), proof p. 65, cites Edixhoven, The weight in Serre’s conjectures on modular forms, for the reduction at p of a characteristic-zero eigenform of weight 2 through p+1 and its T\_p-eigenvalue. Supply the local-weight inclusion and Hecke eigenvalue constraint in the cohomological convention of EM11 §3.5. This is stronger than a statement determining the minimal weight. Require this precise local-weight and eigenvalue assertion; R20’s minimal-weight statement alone is insufficient. Needed by: §2.4.
- **CompletedCohomologyPartII CC.3.** Extend the existing orthonormalizable/profree and mixed-tensor targets to EM11 Appendix C’s cofinitely generated and coadmissible smooth modules, saturation and closure, the maximal cotorsion-free submodule, Proposition C.36 and the evaluation criteria C.45–C.52, pp. 103–116. Tensor cancellation C.51 requires nonzero orthonormalizable V. C.52 also requires the composite to be injective with saturated image (with both hypotheses essential). Apply with V = ρ^m ⊗ θ ≠ 0. Include the coadmissible smooth dual comparison used by NAK Lemma B.16. Do not treat the existing mixed-tensor carrier as this entire theory. Needed by: §4.3, §4.4, §4.7.
- **LocalGaloisDeformationRings R08.1.** Supply irreducibility and reducedness of the unrestricted framed two-dimensional deformation ring for G\_{Q\_p} at every odd p, including the exceptional nonsmooth cases in Tung-P3 Proposition 3.9, p. 12 (Paškūnas Corollary B.5 and Böckle Theorems 4.2, 5.2). The existing local-lifting-ring node supplies representability only; the Fontaine–Laffaille or weight-two constrained ring is a different ring. Retain the auxiliary irreducible-factor choices needed to pass from local to patched full support. Needed by: §5.3, §5.4.
- **DeformationAndDerivedPatchingAlgebra R03.6.** Add the general canonical/Gelfand–Kirillov dimension machinery for finite compact Iwasawa modules over products of GL\_2(Z\_p) and central complete-local coefficient rings, in the form of Pan §3.6, Lemma 3.6.4 and Lemmas 3.6.9–3.6.11 and Proposition 3.6.12, Corollary 3.6.14, pp. 34–37. The arithmetic application is §4.11(6); finite commutative-module support and cycle criteria do not imply this Iwasawa dimension comparison. Needed by: §3.7, §4.11, §5.7.
- **OrdinaryAutomorphicFormsAndModularityLifting R21.1.** The odd-p quaternionic nearly ordinary Hecke theorem does not supply a dyadic theorem. Supply the p = 2 ordinary component/lift theorem of Tung-2 Theorem 7.3.1, p. 37, with Propositions 7.1.6, 7.2.1 and Corollaries 7.2.2–7.2.3: residual non-solvable automorphic representation, the indicated ordinary seed at P, matching determinants, special conditions at Σ and fixed potentially semistable components at the remaining places. Include the finite solvable base change used to attain even degree and appropriate dyadic local degrees. The ordinary seed and component conditions must not be dropped. Needed by: §5.6.
- **HilbertModularVarietiesAndShimuraCurves R18.3.** Extend the present even-degree central class-set/parallel-weight statement to the definite quaternionic finite double-coset spaces and small stabiliser-mod-centre decomposition used by Pan §3.1, pp. 17–18, for every totally real F with p split completely and D definite split above p; include compatible locally algebraic weights and arbitrary finite ramification away from p. Retain the closure of rational units in the central-quotient comparison of CC.8. This does not assert that the raw infinite-level quotient is a profinite manifold over a general F. Needed by: §1.6, §1.7, §2.7.
- **ModularCurvesPartII R14.3.** Extend /boundary-non-eisenstein to residue characteristic 2 with the exact cusp and coefficient-system Eisenstein calculation used in EM11 §5.3, pp. 49–54. The present at-least-3 node is not sufficient for the all-p non-Eisenstein injectivity and finite-level comparison targets. Needed by: §1.4.


### Further comparison inputs

1. **Scholze’s functor.** Import `ScholzeFunctorAndModpCohomologyOfTheLubinTateTower` SZ.0 (equivariant sites and the Gross–Hopkins torsor) and SZ.1 (the sheaf, Sⁱ and admissible finiteness). Only those geometric layers enter §4.12. Its SZ.4–SZ.6 arithmetic applications consume this roadmap’s comparison and are not prerequisites here. The exact arithmetic target is CDN Propositions 4.11–4.12, p. 51, with exchanged quaternion invariants.
2. **Shimura H⁰.** In CC.8’s Shimura adapter and HilbertModularVarietiesAndShimuraCurves R18.4, prove `shimuraH0_nonEisenstein`: H⁰ with O/ϖⁿ coefficients vanishes at an absolutely irreducible residual Hecke ideal. The Hochschild–Serre edge comparison in §1.5 then has zero Hⁱ(K,H⁰) error terms. Smallness removes stabilisers, but is not this vanishing (CDN §4.1.3, pp. 48–49).
3. **General definite arithmetic adapter.** Extend HilbertModularVarietiesAndShimuraCurves R18.3’s centre-quotiented finite class sets and coefficient forms to Pan §3.1–§3.2, pp. 17–20: F totally real with p split, definite D split above p and allowed finite ramification, compatible central character and nonparallel algebraic weights. Use the closure of rational central units in CC.8’s central quotient. Never infer discreteness of those units in the finite adeles. This supplies §§1.6–1.7 and §§2.7–2.8.
4. **Dyadic cusp boundary.** Extend ModularCurvesPartII R14.3’s Eisenstein Hecke action on cusp cohomology to p=2, with the coefficient systems used for injectivity. Localisation at an absolutely irreducible residual ideal kills that boundary, giving the p=2 part of §1.4 (EM11 §5.3, pp. 49–54).
5. **Ordinary Eisenstein seed.** OrdinaryAutomorphicFormsAndModularityLifting R21 must supply the ordinary Hilbert Eisenstein maximal ideal with Pan Proposition 5.6.1, p. 86, in particular the positive ϖ-adic valuation of the specified p-adic L-value L_p(F,−1,χ̃ω). This is the seed needed in §3.8, not a consequence of merely writing the Eisenstein ideal generators.
6. **Iwasawa dimension.** For §4.11, prove the Pan §3.6 comparison with Λ=k[[Kₙ/Zₙ]], uniform of dimension 3[F:Q]. Its associated graded ring is a polynomial ring in that many variables (Lemma 3.6.4, p. 34); Lemmas 3.6.9–3.6.11 and Proposition 3.6.12 and Corollary 3.6.14, pp. 35–37, compare canonical/Gelfand–Kirillov dimensions of completed modules and block multiplicities and bound the special fibre. The resulting Theorem 3.6.1 gives characteristic-zero components of dimension ≥1+2[F:Q]. Finite commutative support lemmas from R03 alone do not give this comparison.
7. **Small-weight and good-weight inputs.** For §§2.3–2.4, combine the R19.6 small-weight reduction with R30.3’s local compact-Hecke module and R14.4’s coefficient/tower Ihara and good-weight multiplicity-one statements specified above. The local Hecke module is k[T,Z,Z⁻¹]; the global Whittaker derivative and absence of finite-dimensional away-from-p subobjects must use the same coefficient convention (EM11 Theorem 5.7.7, pp. 63–66). The evaluation argument in §4.4 also requires absence of one-dimensional G-subobjects (EM11 pp. 88–89).
8. **Auxiliary CM weight occurrence.** For §6.3, obtain occurrence of every chosen predicted Serre weight W of the auxiliary CM-induced residual representation, not merely a theorem computing its minimal weight (EM11 Remark 5.7.4, p. 63, and §7.4, p. 97). Obtain the CM Hecke character from GL2AutomorphicRepresentationsAndTransfer R17.5’s prescribed local induction, including its S-unit character-extension theorem. Require infinity type z⁻¹, the chosen inert-p residual Galois character, and a regular inert-ℓ component for §6.4 (DLB Lemma 5.6, pp. 26–27).
9. **Globalisation hypotheses.** The definite-unitary construction uses the automorphic adequate globalisation of Emerton–Gee Proposition A.2/Corollary A.7, as invoked by CEGGPS Lemma 2.2, pp. 15–17. The dyadic construction uses the precise potential-realisation and residual-modularity theorems of Calegari Proposition 3.2, Snowden Proposition 8.2.1 and its supporting propositions, Khare–Wintenberger II Theorem 6.1/Lemma 3.5 and Paškūnas Lemma 3.29, as invoked by Tung-2 Lemmas 4.3.3–4.3.4, p. 21. The reducible-locus component theorem requires the potentially automorphic residual seed in BLGG Theorem A.4.1 (Tung-P3 Proposition 4.4, p. 14). Treat these as the stated hypotheses in §6.5’s independence comparison; do not replace any by Serre’s full theorem.
10. **Deformation density.** Supply Böckle Corollary 3.8 for reducible local restriction, and its irreducible-local extension using Diamond–Flach–Guo Theorem 3.6 and Corollary 2.3 for twists of Fontaine–Laffaille weight k with 2≤k≤p. The weight-two finite-flat argument alone does not cover this range. These are the deformation-theoretic inputs to §6.2. Use the exact R=T formulation of Nakamura Theorem 2.1, p. 17, and its proof citing Böckle Corollary 3.8 and EM11 §7.3, pp. 95–96. No density-to-injectivity step may omit reducedness.
11. **Normalisation bridges.** Prove the Pan/Tung Galois-dual, determinant and reciprocal-Hecke dictionary of §3.2(c) before transferring either statement to the other convention. Before exporting §6.3’s precise locally algebraic formula, prove `globalAlgebraicNormalization`, comparing EM11 Theorem 3.3.22, p. 28, with §7.4, pp. 97–98: det^(b+1) and det^b are different algebraic characters. This bridge specifies the necessary cohomological/dual identification; no equality of those characters is assumed.

## How to read the build

Layer 1 specialises the completed-tower interfaces to arithmetic objects and proves their degree, support and injectivity comparisons. Layer 2 identifies classical and mod-p coefficient pieces. Layer 3 matches Hecke and Galois actions. Layer 4 constructs arithmetic multiplicity modules and proves the various local–global comparison maps. Layer 5 applies those comparisons to patched modules and distinguishes each support conclusion. Layer 6 gives the global consequences with their hypotheses and dependence on residual modularity explicit. Within a layer, the prerequisites below determine the order; a cited input is used only in the range of its exact supplier contract.

## Layer 1: towers and completed cohomology


This layer fixes the carriers. For the modular curves it takes CompletedCohomologyPartII's coefficient-limit object of the modular tower, through CC.8's realisation of the actual canonical-model tower, and records Emerton's normalisations: the p-level colimit is taken at each finite coefficient level before completing, and the tame colimit afterwards. It then proves what is special to GL₂: the explicit degree-zero object, the vanishing of completed H² with compact supports, surjectivity of forgetting supports, and the non-Eisenstein results of Emerton §5.3 — after localising at an absolutely irreducible residual representation the boundary disappears, finite-level cohomology is recovered as invariants, and the mod ϖ^s cohomology is an injective smooth K\_p-module, so that the localised completed cohomology is C(K\_p, O)^r for pro-p K\_p.

The same layer constructs the two quaternionic carriers the later layers need: the completed cohomology of Shimura curves for a quaternion algebra over a totally real field ramified at one place above p (used with Scholze's functor), and the completed module of a definite quaternion algebra split above p — continuous functions on the raw quotient over Q, and the finite-level coefficient-limit module with Pan’s central quotient over general totally real F — which is the zero-dimensional case of all the constructions and the setting of Dospinescu–Le Bras, Pan and Tung.
For the Shimura-curve finite-level invariant comparison, smallness alone is insufficient: the Hochschild–Serre edge map also needs the localised H⁰ vanishing recorded below. Discrete stabilisers and raw p-adic manifold assertions are restricted to the Q case.

### 1.1 Completed cohomology of the modular tower


Let E/Q\_p be finite with integers O, uniformizer ϖ and residue field k, and let G = GL\_2(Q\_p). For a compact open K\_f ⊂ GL\_2(A\_f) let Y(K\_f) be the modular curve GL\_2(Q)∖((C∖R) × GL\_2(A\_f)/K\_f) with its canonical model over Q. For A ∈ {O, O/ϖ^s, E} and a tame level K^p ⊂ GL\_2(A\_f^p) put H^1(K^p)\_A = colim\_{K\_p} H^1\_ét(Y(K\_pK^p)\_{Q̄}, A), the colimit over compact open K\_p ⊂ G, and likewise H^1\_c(K^p)\_A with compact supports and H^0(K^p)\_A. The completed cohomology at tame level K^p is the ϖ-adic completion Ĥ^1(K^p)\_O = lim\_s H^1(K^p)\_O/ϖ^s, and Ĥ^1(K^p)\_E = E ⊗\_O Ĥ^1(K^p)\_O, an E-Banach space with unit ball Ĥ^1(K^p)\_O; the same recipe gives Ĥ^1\_c(K^p) and Ĥ^0(K^p). Taking the locally convex (O-linear) inductive limit over tame levels gives Ĥ^1\_A = colim\_{K^p} Ĥ^1(K^p)\_A for A = O, E. For a finite set Σ\_0 of primes not containing p, Σ = Σ\_0 ∪ {p} and an open K\_{Σ\_0} ⊂ G\_{Σ\_0} = ∏\_{ℓ∈Σ\_0} GL\_2(Q\_ℓ), put Ĥ^1(K\_{Σ\_0})\_A = Ĥ^1(K\_{Σ\_0}K\_0^Σ)\_A with K\_0^Σ = ∏\_{ℓ∉Σ} GL\_2(Z\_ℓ), and Ĥ^1\_{A,Σ} = colim\_{K\_{Σ\_0}} Ĥ^1(K\_{Σ\_0})\_A. These carry commuting continuous actions of G\_Q, of G, of the tame group (GL\_2(A\_f^p), resp. G\_{Σ\_0}) and of the Hecke operators T\_ℓ, S\_ℓ for ℓ ∉ Σ(K^p). The carrier is the CompletedCohomologyPartII coefficient-limit object H̃^1(K^p, O) of the modular tower transported along CC.8's modular realisation; no second completed-cohomology carrier is defined. The object of Emerton’s Conjecture 1.1.1 is the multiplicity space Hom\_{E[G\_Q]}(V, Ĥ^1\_E) of a two-dimensional E-representation V of G\_Q, with its GL\_2(A\_f)-action.

E/Q\_p finite, O its integers, ϖ a uniformizer, k = O/ϖ. Group actions follow Emerton lg §2: the G- and GL\_2(A\_f)-actions are those of Carayol twisted by g ↦ (g^{-1})^t (lg p. 45, footnote 11); this convention is fixed for the whole roadmap. Ĥ^1\_E is a colimit of Banach spaces with the locally convex inductive-limit topology; it is not itself ϖ-adically complete, and the tame colimit is taken after completion.

Use the following named interfaces:

- `TauCeti.ModularCompletedCohomology.atTameLevel` (constructor): Ĥ^1(K^p)\_O as the CC.2 coefficient limit of the modular tower at tame level K^p, with its Banach rationalisation Ĥ^1(K^p)\_E.
- `TauCeti.ModularCompletedCohomology.reductionEquiv` (characterisation): For each s ≥ 1, Ĥ^1(K^p)\_O/ϖ^s ≅ colim\_{K\_p} H^1(Y(K\_pK^p), O/ϖ^s), G\_Q × G × Hecke-equivariantly.
- `TauCeti.ModularCompletedCohomology.tameColimit` (constructor): Ĥ^1\_A = colim\_{K^p} Ĥ^1(K^p)\_A with the O-linear inductive-limit topology, for A = O, E.
- `TauCeti.ModularCompletedCohomology.atSigma` (constructor): Ĥ^1(K\_{Σ\_0})\_A and Ĥ^1\_{A,Σ} = colim\_{K\_{Σ\_0}} Ĥ^1(K\_{Σ\_0})\_A with the action of G\_Q × G × G\_{Σ\_0}.
- `TauCeti.ModularCompletedCohomology.compactSupport` (constructor): The compactly supported variant Ĥ^1\_c and the forget-supports map Ĥ^1\_c → Ĥ^1.
- `TauCeti.ModularCompletedCohomology.galoisAction` (instance): The continuous G\_Q-action, unramified outside Σ(K^p) at tame level K^p, commuting with G and the Hecke operators.
- `TauCeti.ModularCompletedCohomology.heckeOperator` (data): T\_ℓ and S\_ℓ for ℓ ∉ Σ(K^p), acting continuously and commuting with G\_Q × G.
- `TauCeti.ModularCompletedCohomology.tameRestriction_isClosedEmbedding` (functoriality): For K^{p′} ⊂ K^p the pullback on Ĥ^1(−)\_E is a closed G-equivariant embedding, compatible with the Hecke operators at primes unramified in both.
- `TauCeti.ModularCompletedCohomology.multiplicitySpace` (constructor): For a continuous representation V of G\_Q on a finite-dimensional E-space, Hom\_{E[G\_Q]}(V, Ĥ^1\_E) with its induced GL\_2(A\_f)-action; the Lean prototype is the submodule of equivariant linear maps between two representations.
- `TauCeti.ModularCompletedCohomology.multiplicityEvaluation` (constructor): The evaluation map V ⊗ Hom\_{E[G\_Q]}(V, Ĥ^1\_E) → Ĥ^1\_E, v ⊗ f ↦ f(v), equivariant for the residual actions.
- `TauCeti.ModularCompletedCohomology.multiplicityEvaluation_injective` (relation): For V finite-dimensional, irreducible and with only scalar equivariant endomorphisms, the evaluation map is injective.
- `TauCeti.ModularCompletedCohomology.equivCC` (compatibility): The canonical identification with CompletedCohomologyPartII CC.2 (coefficient limit completion) for the modular tower of CC.8.

**Checks.**

- `TauCeti.ModularCompletedCohomology.degreeZero_computation` (computation): Ĥ^0\_E is isomorphic to the space of functions on Q\_{>0}∖A\_f^× that are continuous in the p-adic variable and smooth away from p, with G\_Q acting through class field theory and GL\_2(A\_f) through det (EM-PAMQ (60)); a wrong definition that completes before taking π\_0 of the tower fails this.
- `TauCeti.ModularCompletedCohomology.invariants_compatibility` (compatibility): The K^p-invariants of Ĥ^1\_E equal Ĥ^1(K^p)\_E as G-representations, with T\_ℓ matching the double coset of diag(ℓ, 1) (EM-PAMQ Lemma 7.2.8).
- `TauCeti.ModularCompletedCohomology.reduction_mod_varpi` (characterisation): Ĥ^1(K^p)\_O/ϖ is the smooth G-representation colim\_{K\_p} H^1(Y(K\_pK^p), k); a definition that completes the rational colimit without the integral lattice fails this.
- `TauCeti.ModularCompletedCohomology.no_one_dimensional_subrep` (non-example): Ĥ^1\_E contains no one-dimensional G-subrepresentation (EM11 Lemma 5.1.3); the space of smooth vectors H^1(K^p)\_E alone would not be a Banach space, and completing H^1 of a single curve gives no G-action.

EM11, Conjecture 1.1.1 and Theorem 1.2.1: The multiplicity space Hom\_{E[G\_Q]}(V, Ĥ^1\_E) is the target of the local–global maps. EM11, §5.3, Definition 5.3.2: Localising at a residual maximal ideal gives the ρ̄-part Ĥ^1\_{O,ρ̄,Σ}, a direct summand. NAK, §2.3: Its Pontryagin–Schikhof dual is completed Borel–Moore homology, the source of the zeta morphisms. LocallyAnalyticCompletedCohomology LA.2: Pan identifies H̃^1(K^p, Z\_p) with perfectoid cohomology; use this carrier with its admissible actions. GL2ModularityLifting R32.2 (through R31.6): Odd-prime lifting through local–global compatibility uses this carrier.

A proof proceeds as follows.

1. Identify the finite-level étale cohomology groups with the CC.0/CC.1 modular tower through CompletedCohomologyPartII CC.8 (arithmetic tower realisation) (modular family, with ModularCurvesPartII R14.3 supplying the finite étale/Betti comparison); the p-level colimit at fixed s is CC.1's fixed-exponent object and the s-limit is CC.2's coefficient-limit completion.
2. Emerton’s isomorphism (5.1.1), H^1(K^p)\_O/ϖ^s ≅ H^1(K^p)\_{O/ϖ^s}, is torsion-freeness of H^1(K^p)\_O plus vanishing of the ϖ-torsion of the degree-two groups in the colimit (EM-PAMQ Lemma 7.2.1); it identifies Ĥ^1(K^p)\_O with lim\_s colim\_{K\_p} H^1(Y(K\_pK^p), O/ϖ^s), which is CC.2's object (EM-PAMQ Corollary 7.2.4).
3. Transport the G\_Q- and Hecke actions with CompletedCohomologyPartII CC.8 (transported arithmetic actions); the G-action is CC.1's smooth action through conjugated levels, extended by continuity.
4. Form the tame colimit with CompletedCohomologyPartII CC.1 (tame level variation); the transition maps are closed embeddings (EM06 Proposition 2.2.13), so the O-linear inductive-limit topology of lg p. 45, footnote 10, is Hausdorff.

**Checks.**

- Ĥ^1(K^p)\_O/ϖ ≅ colim\_{K\_p} H^1(Y(K\_pK^p), k), G\_Q × G-equivariantly (EM11 (5.1.2) with s = 1).
- For K^{p′} ⊂ K^p the pullback Ĥ^1(K^p)\_E → Ĥ^1(K^{p′})\_E is a closed G-equivariant embedding, and the K^p-invariants of Ĥ^1\_E are Ĥ^1(K^p)\_E (the theorem §1.2).

*Needs:* CompletedCohomologyPartII CC.8 (arithmetic tower realisation); CompletedCohomologyPartII CC.8 (transported arithmetic actions); CompletedCohomologyPartII CC.2 (coefficient limit completion); CompletedCohomologyPartII CC.1 (tame level variation); CompletedCohomologyPartII CC.2 (rational unitary banach tower); ModularCurvesPartII R14.3 (integral comparison); mathlib:AdicCompletion; mathlib:Field.absoluteGaloisGroup; mathlib:Matrix.GeneralLinearGroup; mathlib:AdicCompletion.eval\_surjective; mathlib:AdicCompletion.pow\_smul\_top\_eq\_ker\_eval.

EM11, §5.1, pp. 44–45: Defines H^1(K^p)\_A as the p-level colimit of étale cohomology of the modular curves, Ĥ^1(K^p)\_O as its ϖ-adic completion with the reduction isomorphisms (5.1.1)–(5.1.2), the Banach space Ĥ^1(K^p)\_E, the tame colimit Ĥ^1\_A with its inductive-limit topology, the fixed-away-from-Σ variants Ĥ^1(K\_{Σ\_0}) and Ĥ^1\_{A,Σ}, and the compactly supported and degree-zero analogues.

EM11, Conjecture 1.1.1 and Remark 1.1.2, p. 2: The local–global conjecture is a statement about the multiplicity space of V in Ĥ^1\_E; Remark 1.1.2 records the case (V|G\_{Q\_p} a twist of an extension of the cyclotomic character by the trivial character) in which it is expected to fail as stated.

EM-PAMQ, §7.2, Lemma 7.2.1, Definition 7.2.2, Lemma 7.2.3, Corollary 7.2.4, pp. 62–63: Torsion-freeness and separatedness of H^1\_\*(K^p)\_O, the Banach completion Ĥ^1\_\*(K^p)\_E, and its identification with lim\_s colim\_{K\_p} of the mod ϖ^s cohomology, for ordinary and compact supports.

NAK, §2.1.1, pp. 14–16: Nakamura recalls the same objects Ĥ^i(K^p), Ĥ^1(K\_{Σ\_0}) and Ĥ^1\_Σ with the inductive-limit topology, which his zeta morphisms consume.

CE, §1.1, pp. 2–4: For a fixed tower the survey defines Ĥ as the p-adic completion of the direct limit and H̃ as lim\_s lim\_r H(X\_r, Z/p^s); for the modular tower in degree one these agree at each tame level by (5.1.1) of EM11.

### 1.2 Admissibility, tame-level control and the arithmetic actions


For every tame level K^p: (a) Ĥ^1(K^p)\_E with the G-action is an admissible unitary E-Banach representation of G = GL\_2(Q\_p), and Ĥ^1(K^p)\_O is ϖ-adically admissible: Ĥ^1(K^p)\_O/ϖ is an admissible smooth k-representation of G; the same holds for compact supports. (b) The natural map Ĥ^1(K^p)\_E → (Ĥ^1\_E)^{K^p} is a G-equivariant isomorphism, under which T\_ℓ (resp. S\_ℓ) corresponds to the double coset K^p diag(ℓ,1) K^p (resp. K^p diag(ℓ,ℓ) K^p) for ℓ ≠ p unramified in K^p. (c) For K^{p′} ⊂ K^p the pullback Ĥ^1(K^p)\_E → Ĥ^1(K^{p′})\_E is a closed embedding, equivariant for G and for the Hecke operators at primes unramified in both levels. (d) The G\_Q-action on Ĥ^1(K^p)\_O is continuous, unramified outside Σ(K^p) = {p} ∪ {ℓ : K^p ramified at ℓ}, and commutes with G and the Hecke operators; on Ĥ^1\_E the G\_Q-action commutes with GL\_2(A\_f).

Tame levels are compact open subgroups of GL\_2(A\_f^p); (b) is stated for the E-Banach spaces; the integral analogue needs neatness or the localisation of §1.4. Admissibility is in the sense of Schneider–Teitelbaum: the Schikhof dual of a G-stable unit ball is finitely generated over O[[H]] for one, hence every, compact open H ⊂ G.

A proof proceeds as follows.

1. Each modular curve Y(K\_f) is homotopic to a finite one-dimensional simplicial complex; this verifies the finite-cell hypothesis of CompletedCohomologyPartII CC.5 (banach admissibility), and the local group is the compact p-adic analytic GL\_2(Z\_p), so CC.5 gives (a) (EM06 Theorem 2.2.11, EM-PAMQ Lemma 7.2.5).
2. (b) is the averaging argument over K^{p′} ⊂ K^p normal, made integral by the transfer of CC.1 and passing to completions; it is EM06 Theorem 2.2.16(ii); the Hecke statement is EM-PAMQ Lemma 7.2.8 (which cites a proposition of the published version of EM06 whose number differs from that of the specified 2006 author draft).
3. (c) is EM06 Proposition 2.2.13: the pullback is split, after inverting p, by the normalised trace, so its image is closed.
4. (d) is the transport of §1.1’s G\_Q-action; unramifiedness outside Σ(K^p) follows from good reduction of Y(K\_pK^p) at ℓ ∉ Σ(K^p) for K\_p fixed and is preserved by the colimit and completion (EM-PAMQ 7.2.9).

**Checks.**

- The proof of (a) applies CC.5 only after the finite-cell and compact p-adic analytic hypotheses are verified for the modular tower.
- Concrete instance: for K^p = K\_1(N)^p and a weight-two newform f of level N prime to p, the f-isotypic part of H^1(Y\_1(N), E) embeds in (Ĥ^1\_E)^{K^p} by (b).

*Needs:* §1.1; CompletedCohomologyPartII CC.5 (banach admissibility); CompletedCohomologyPartII CC.5 (finite generation over the iwasawa algebra and the canonical topology); CompletedCohomologyPartII CC.1 (tame level variation); CompletedCohomologyPartII CC.8 (transported arithmetic actions); ModularCurvesPartII R14.3 (integral comparison).

EM06, Theorem 2.2.11, p. 31; Proposition 2.2.13, p. 32; Theorem 2.2.16, p. 33: Admissibility of the completed cohomology of arithmetic quotients as Banach G-representations, closedness of the tame-level pullbacks, and recovery of a fixed tame level as invariants.

EM-PAMQ, Lemma 7.2.5, (55), Lemma 7.2.8 and 7.2.9, pp. 63–64: The modular-curve statements: admissible unitary Banach representation, closed tame-level embeddings, invariants and Hecke double cosets, and the G\_Q-action commuting with G and Hecke.

EM11, §5.1, p. 44 (admissibility cited to [36]): Emerton records that the G-action makes Ĥ^1(K^p)\_O ϖ-adically admissible in the sense of his Definition 3.1.1.

### 1.3 Degree zero, vanishing in degree two and compact supports


For the modular tower: (a) Ĥ^0\_E ≅ C(Q\_{>0}∖A\_f^×, E), the space of functions continuous in the p-adic variable and locally constant away from p, with G\_Q acting through G\_Q^{ab} ≅ Q\_{>0}∖A\_f^× (class field theory) and GL\_2(A\_f) through det; at tame level K^p, Ĥ^0(K^p) restricted to a small compact open H ⊂ Z(Q\_p) is a direct sum of copies of C(Z\_p^×, E). (b) Ĥ^2\_c = 0, and Ĥ^n = Ĥ^n\_c = 0 for n ≥ 3; the p-adically completed H^2 (without supports) vanishes as well, because each Y(K\_f) is a non-compact curve. (c) The forget-supports maps Ĥ^1\_c(K^p)\_O → Ĥ^1(K^p)\_O and Ĥ^1\_{c,E} → Ĥ^1\_E are surjective. (d) Cup product defines continuous pairings Ĥ^0\_E ⊗ Ĥ^1\_{\*,E} → Ĥ^1\_{\*,E} for \* ∈ {∅, c}, and cupping with the class of a continuous character ψ of Q\_{>0}∖A\_f^× twists T\_ℓ to ψ(ℓ)T\_ℓ and S\_ℓ to ψ(ℓ)^2 S\_ℓ.

The degree-zero description uses the determinant π\_0(Y(K\_f)) ≅ Q\_{>0}∖A\_f^×/det K\_f; continuity is in the p-adic variable only. (b) and (c) are statements about the completed objects; finite-level H^2\_c is nonzero.

A proof proceeds as follows.

1. (a): H^0 of each Y(K\_f) is the space of functions on π\_0(Y(K\_f)) = Q\_{>0}∖A\_f^×/det K\_f; the colimit over K\_p and ϖ-adic completion give continuous functions in the p-adic direction (EM-PAMQ (60)); the restriction to a small H ⊂ Z(Q\_p) follows since H acts through det on the components (EM06 proof of Proposition 4.3.1).
2. (b): for K\_p fixed choose K\_p′ ⊂ K\_p with [K\_p ∩ SL\_2(Q\_p) : K\_p′ ∩ SL\_2(Q\_p)] divisible by p^r; the pullback on H^2\_c multiplies by a multiple of p^r on each component, so colim\_{K\_p} H^2\_c is p-divisible and its p-adic completion vanishes (EM06 Proposition 4.3.6). Non-compact curves have no H^2 and no cohomology above degree 2.
3. (c): compare H^1\_c with parabolic cohomology H^1(X(K\_f)) of the compactified curves and show that the cokernel of H^1\_c → H^1, the boundary cohomology, becomes p-divisible in the colimit for the same index reason (EM06 Proposition 4.3.9; EM-PAMQ 7.2.10); the boundary sequence is CompletedCohomologyPartII CC.7 (boundary long exact sequences and the borel serre tower) applied to the modular tower.
4. (d): CompletedCohomologyPartII cup products on the tower, with the twisting formula of EM-PAMQ Lemma 7.3.19.

**Checks.**

- Ĥ^2\_c = 0 although H^2\_c(Y(K\_f), O) ≅ O^{π\_0(Y(K\_f))} is nonzero at every finite level.
- The twist by the cyclotomic character ψ = ε: cupping with c\_ε carries the eigensystem (T\_ℓ, S\_ℓ) of a form f to (ℓT\_ℓ, ℓ^2S\_ℓ).

*Needs:* §1.1; CompletedCohomologyPartII CC.7 (boundary long exact sequences and the borel serre tower); CompletedCohomologyPartII CC.7 (derived completed support triangle); ModularCurvesPartII R14.3 (boundary exact sequence); mathlib:ContinuousMap; mathlib:LocallyConstant.

EM06, Proposition 4.3.1 and its proof, p. 52; Proposition 4.3.6, p. 53; Proposition 4.3.9, p. 54: Ĥ^0 restricted to a small central subgroup is a sum of C(Z\_p^×, E); Ĥ^2\_c vanishes by the p-divisibility of the colimit of H^2\_c; Ĥ^1\_c → Ĥ^1 is surjective.

EM-PAMQ, 7.2.10 and 7.2.11, (56)–(60), pp. 64–65; Lemma 7.3.19, p. 69: Surjectivity of forgetting supports, the explicit description of Ĥ^0\_E, the cup product with Ĥ^0, and the twist of Hecke operators by cupping with a character.

NAK, Proof of Lemma 2.4, p. 22: Nakamura uses the vanishing of Ĥ^2\_c to identify completed Borel–Moore homology with the dual of Ĥ^1\_c.

### 1.4 Non-Eisenstein localisation: boundary, injectivity and freeness


Let ρ̄: G\_Q → GL\_2(k) be continuous and absolutely irreducible, unramified outside Σ = Σ\_0 ∪ {p}, and let m be a residual maximal ideal of the completed Hecke algebra of the modular tower (CompletedCohomologyPartII CC.8 (completed hecke algebra) at tame level K\_{Σ\_0}K\_0^Σ) with T\_ℓ ≡ tr ρ̄(Frob\_ℓ), ℓS\_ℓ ≡ det ρ̄(Frob\_ℓ) for ℓ ∉ Σ. Write M\_m for the closed summand cut out by the residual projector of CC.8. Then: (a) Ĥ^1\_c(K\_{Σ\_0})\_{O,m} → Ĥ^1(K\_{Σ\_0})\_{O,m} is an isomorphism, and replacing the open curves by their compactifications does not change the m-parts. (b) If K\_p is compact open and K\_f = K\_pK\_{Σ\_0}K\_0^Σ is neat, then H^1(K\_f)\_{O,m} → (Ĥ^1(K\_{Σ\_0})\_{O,m})^{K\_p} and H^1(K\_f)\_{O/ϖ^s,m} → (H^1\_{O/ϖ^s,m,Σ})^{K\_pK\_{Σ\_0}} are isomorphisms; for non-neat K\_f the same holds unless ρ̄ is induced from a character of G\_{Q(√−1)} or G\_{Q(√−3)}. (c) For K\_f neat and each s, H^1(K\_{Σ\_0})\_{O/ϖ^s,m} is an injective smooth K\_p-representation over O/ϖ^s; equivalently Hom\_{K\_p}(−, H^1(K\_{Σ\_0})\_{O/ϖ^s,m}) is exact. (d) If moreover K\_p is pro-p, there is r ≥ 0 with Ĥ^1(K\_{Σ\_0})\_{O,m} ≅ C(K\_p, O)^r as ϖ-adically admissible K\_p-representations; dually its Schikhof dual is free of rank r over O[[K\_p]].

ρ̄ is absolutely irreducible; this is what makes H^0 terms vanish after localisation and makes the boundary Eisenstein-free (an absolutely irreducible ρ̄ has a non-Eisenstein eigensystem by Chebotarev and Brauer–Nesbitt, which is the eigenvalue form of non-Eisenstein used by ModularCurvesPartII R14.3). ModularCurvesPartII R14.3 (boundary non eisenstein) is stated in weight two and residue characteristic at least 3; for p = 2 the Eisenstein property of the Hecke action on the cusp boundary (Hecke operators act on H^0 of the cusps through T\_ℓ ↦ 1 + ℓ up to characters) is the same computation and is the dyadic cusp-boundary supplier contract above. Neatness of K\_f (no fixed points of GL\_2(Q) on (C∖R) × GL\_2(A\_f)/K\_f) is required in (b)–(d); Carayol’s lemma replaces it in (b) for ρ̄ not induced from Q(√−1) or Q(√−3). The localisation is CC.8's residual summand; its identification with Emerton’s T(K\_{Σ\_0})\_ρ̄ ⊗ (−) is made in §3.1 and is not used here. At p = 2 use the dyadic cusp-boundary contract above; its characteristic-2 assertion is essential.

A proof proceeds as follows.

1. (a): the Hecke action on the boundary cohomology of the modular curves is Eisenstein (ModularCurvesPartII R14.3 (boundary non eisenstein)), so the boundary terms of the CC.7 support triangle vanish after applying the residual projector, which commutes with the triangle by CompletedCohomologyPartII CC.8 (localisation limit support dual compatibility).
2. (b): for normal K\_p′ ⊂ K\_p and K\_{Σ\_0}′ ⊂ K\_{Σ\_0} the Hochschild–Serre sequence for the free action of K\_f/K\_f′ on Y(K\_f′) has its H^1(K\_f/K\_f′, H^0) term killed by localising at m, giving H^1(K\_f)\_{O/ϖ^s,m} ≅ (H^1(K\_f′)\_{O/ϖ^s,m})^{K\_f}; pass to the limits (EM11 Lemma 5.3.8 and (5.3.9)). The non-neat case is Carayol’s lemma (EM11 Remark 5.3.10).
3. (c): for a finitely generated smooth K\_p-module M, Hom\_{K\_p}(M, H^1(K\_{Σ\_0})\_{O/ϖ^s}) is identified, after localising at m, with H^1 of the local system M^∨ on Y(K\_f) (EM11 (5.3.16)–(5.3.17)); a short exact sequence of such M gives a long exact sequence of cohomology whose H^0 terms vanish at m, so the Hom functor is exact on the right (EM11 Proposition 5.3.15; the method of Remark 5.3.18).
4. (d): (O/ϖ^s)[[K\_p]] is local for K\_p pro-p, so an injective admissible smooth K\_p-module is C(K\_p, O/ϖ^s)^r with r independent of s; pass to the limit in s (EM11 Corollary 5.3.19).

**Checks.**

- For ρ̄ the reduction of the Galois representation of the weight-two newform of level 11 at p = 3 (absolutely irreducible: its Frobenius-2 polynomial modulo 3 is X²−X+2, irreducible over F₃, while oddness rules out a conjugate-character splitting over F₉), (a) gives Ĥ^1\_{c,m} = Ĥ^1\_m at tame level K\_0(11)^p.
- Non-example: for an Eisenstein maximal ideal (ρ̄ = 1 ⊕ ε̄) the boundary contributes and (a) fails; the hypothesis cannot be dropped.

*Needs:* §1.3; §1.2; CompletedCohomologyPartII CC.8 (completed hecke algebra); CompletedCohomologyPartII CC.8 (completed residual localisation); CompletedCohomologyPartII CC.8 (localisation limit support dual compatibility); CompletedCohomologyPartII CC.6 (hochschild serre descent to finite level); ModularCurvesPartII R14.3 (boundary non eisenstein); ModularCurvesPartII R14.3 (localized freeness); mathlib:Module.Projective; mathlib:IsLocalRing.

EM11, Definition 5.3.7, Lemma 5.3.8 with (5.3.9), Remark 5.3.10, pp. 50–51: Neat levels; recovery of finite-level ρ̄-localised cohomology as K\_p- and K\_{Σ\_0}-invariants of the completed objects; Carayol’s replacement of neatness.

EM11, Proposition 5.3.15 with (5.3.16)–(5.3.17), Remark 5.3.18, Corollary 5.3.19, pp. 52–54: Exactness of H^1 after localising at a non-Eisenstein ideal, expressed as injectivity of the localised mod ϖ^s cohomology as a smooth K\_p-representation, and the resulting isomorphism with C(K\_p, O)^r for pro-p K\_p.

NAK, §2.1.4, p. 19: For absolutely irreducible ρ̄ the compactly supported and ordinary completed cohomology agree after localisation (Ĥ^1\_{c,ρ̄,Σ} ≅ Ĥ^1\_{ρ̄,Σ}).

### 1.5 Completed cohomology of quaternionic Shimura curves


Let E\_0 be a totally real field in which p splits completely, 𝔭 | p a place (so E\_{0,𝔭} = Q\_p) and ∞\_0 a real place; let D be a quaternion algebra over E\_0 split at ∞\_0, ramified at the other real places and at 𝔭 (D\_𝔭 the quaternion division algebra over Q\_p), and D\_0 the definite algebra obtained by exchanging the invariants at 𝔭 and ∞\_0. For a tame level U^p ⊂ (D ⊗ A\_f^p)^× and open V in the 𝔭-part of the level, let Sh\_{VU^p} be the Shimura curve over E\_0. For a continuous character ψ of A\_f^×/E\_0^× and a continuous representation λ of the level at the places above p other than 𝔭 on a finite free O-module, define Ĥ^1(U^p, O/ϖ^n) = colim\_V H^1\_ét(Sh\_{VU^p, Ē\_0}, O/ϖ^n), its ψ-isotypic part Ĥ^1\_ψ, the λ-typical part Ĥ^1\_{ψ,λ}(U^p, O/ϖ^n) = Hom(λ, Ĥ^1\_ψ(U^p, O/ϖ^n)), and, after localising at a residual maximal ideal m of the abstract Hecke algebra T\_S^{univ} = O[T\_v, S\_v]\_{v∉S}, Ĥ^1\_{ψ,λ,m} = colim\_n Ĥ^1\_{ψ,λ}(U^p, O/ϖ^n)\_m and Ĥ^1\_{ψ,λ}(U^p, O)\_m = lim\_n Ĥ^1\_{ψ,λ}(U^p, O/ϖ^n)\_m with the p-adic topology. They carry commuting actions of G\_{E\_0,S}, T\_S^{univ} and D\_𝔭^× (and of A\_f^×). This is CompletedCohomologyPartII’s completed cohomology of the quaternionic Shimura-curve tower (CC.8 Hilbert/quaternionic adapter), with the 𝔭-level colimit taken over D\_𝔭^×-levels.

D is split at exactly one real place and at all finite places above p other than 𝔭; D\_𝔭 is division. The tower is in the 𝔭-direction of D\_𝔭^×, a compact-mod-centre group, so finite-level H^1 of the tower is not admissible over GL\_2(Q\_p). ψ is the central character on A\_f^×; λ has central character compatible with ψ on the intersection with A\_f^×. The CDN special case has D\_0 unramified at every finite place and [E\_0:Q] even. Over Q a tower of this kind is possible if D\_0 has suitable finite ramification; the parity restriction is not a restriction on all quaternionic Shimura curves. The torsion coefficient colimit uses O/ϖ^n → O/ϖ^{n+1}, a ↦ ϖa.

Use the following named interfaces:

- `TauCeti.ShimuraCurveCompleted.torsion` (constructor): Ĥ^1(U^p, O/ϖ^n) = colim\_V H^1\_ét(Sh\_{VU^p, Ē\_0}, O/ϖ^n) with its G\_{E\_0,S} × T\_S^{univ} × D\_𝔭^× × A\_f^×-action.
- `TauCeti.ShimuraCurveCompleted.isotypic` (constructor): The ψ-isotypic and λ-typical parts Ĥ^1\_{ψ,λ}(U^p, O/ϖ^n) = Hom(λ, Ĥ^1\_ψ(U^p, O/ϖ^n)).
- `TauCeti.ShimuraCurveCompleted.localized` (constructor): Ĥ^1\_{ψ,λ,m} = colim\_n Ĥ^1\_{ψ,λ}(U^p, O/ϖ^n)\_m and its integral version lim\_n.
- `TauCeti.ShimuraCurveCompleted.dualEquiv` (equivalence): (Ĥ^1\_{ψ,λ,m})^∨ ≅ Hom^cont\_O(Ĥ^1\_{ψ,λ}(U^p, O)\_m, O) as compact T\_S^{univ}[G\_{Q\_p} × D\_𝔭^×]-modules.
- `TauCeti.ShimuraCurveCompleted.invariants` (characterisation): For sufficiently small VU^p, apply the CC.6 Hochschild–Serre spectral sequence. If H^0 of the torsion tower localised at m is zero, the edge map H^1\_ét(Sh\_{VU^p,Ē\_0},O/ϖ^n)\_m → (Ĥ^1(U^p,O/ϖ^n)\_m)^V is an isomorphism. Without that vanishing, its kernel and cokernel are controlled by H^1\_cts(V,Ĥ^0\_m) and H^2\_cts(V,Ĥ^0\_m).
- `TauCeti.ShimuraCurveCompleted.equivCC` (compatibility): Identification with the CC.2 completed cohomology of the quaternionic Shimura-curve tower of CC.8.

**Checks.**

- `TauCeti.ShimuraCurveCompleted.invariants_finite_level` (compatibility): Under the stated H^0\_m = 0 hypothesis, the Hochschild–Serre edge map is an isomorphism. A definition asserting finite-level descent from smallness alone fails to account for H^1\_cts(V,Ĥ^0) and H^2\_cts(V,Ĥ^0).
- `TauCeti.ShimuraCurveCompleted.trivial_lambda` (degenerate): For λ the trivial one-dimensional representation, Ĥ^1\_{ψ,λ} is the space of vectors of Ĥ^1\_ψ invariant under the level at the places above p other than 𝔭.
- `TauCeti.ShimuraCurveCompleted.not_GL2_admissible` (non-example): Ĥ^1\_{ψ,λ,m} is a D\_𝔭^×-module, not a GL\_2(Q\_p)-module: a definition that takes the colimit over GL\_2(Q\_p)-levels would describe the modular-curve object of §1.1 instead.

CDN, Proposition 4.11: Its m-part is identified with Scholze’s functor applied to the definite quaternionic module S\_{ψ,λ,m}. CDN, Proposition 4.12: It factors as ρ\_m ⊗ N with ρ\_m the Hecke-valued Galois representation. §4.12: The comparison theorem is stated on this carrier.

A proof proceeds as follows.

1. Take the canonical-model tower and finite étale–Betti comparison from CompletedCohomologyPartII CC.8 (hilbert finite local system input) and CC.8/arithmetic-tower-realisation (Hilbert/quaternionic family, quaternion algebras split at exactly one real place).
2. Retain the central-quotient comparison of CompletedCohomologyPartII CC.8 (arithmetic shimura central quotient) when passing from the arithmetic quotient to Sh\_{VU^p}.
3. Isotypic and λ-typical parts are taken at each finite n before the limits; localisation at m uses the finite-level Hecke images (HilbertModularVarietiesAndShimuraCurves R18.4 (finite cohomology)) and CC.8's residual projectors, which commute with colim\_n and lim\_n by CC.8/localisation-limit-support-dual-compatibility.
4. The Pontryagin dual (Ĥ^1\_{ψ,λ,m})^∨ is identified with the Schikhof dual of Ĥ^1\_{ψ,λ}(U^p, O)\_m (CDN after Proposition 4.11).
5. Finite-level descent uses CC.6 with H^0\_m = 0, using the Shimura H⁰ supplier contract above. No unconditional invariants identity is used.

**Checks.**

- If D\_0 is unramified at every finite place, its definiteness forces [E\_0:Q] even. If D\_0 is allowed finite ramification, this argument does not exclude E\_0 = Q.
- The torsion object is smooth for D\_𝔭^×. At an open V, its V-invariants identify with finite-level H^1 after localisation only when the H^0 terms in Hochschild–Serre vanish; smallness alone does not imply this.

*Needs:* CompletedCohomologyPartII CC.8 (hilbert finite local system input); CompletedCohomologyPartII CC.8 (arithmetic tower realisation); CompletedCohomologyPartII CC.8 (arithmetic shimura central quotient); CompletedCohomologyPartII CC.8 (localisation limit support dual compatibility); CompletedCohomologyPartII CC.3 (continuous dual conventions); HilbertModularVarietiesAndShimuraCurves R18.4 (finite cohomology); CompletedCohomologyPartII CC.6 (hochschild serre descent to finite level).

CDN, §4.1.2, pp. 47–48; §4.1.4, pp. 50–51: The quaternionic data D\_0 (definite, split at all finite places) and D (invariants exchanged at 𝔭 and ∞\_0), the Shimura curves Sh\_{VU^p}, and the completed cohomology Ĥ^1\_{ψ,λ,m} with its integral version and duality.

CDN, Proposition 4.5, p. 47: The globalisation setting: E\_0 totally real of even degree in which p splits completely, with a cuspidal automorphic π whose residual representation restricts to a given r̄ at every place above p.

### 1.6 Completed module of a definite quaternion algebra


Let F be a totally real field in which p splits completely and D a quaternion algebra over F ramified at every infinite place and unramified at every place above p, with fixed isomorphisms D ⊗\_F F\_v ≅ M\_2(F\_v) at the places where D is unramified; put K\_p = ∏\_{v|p} GL\_2(O\_{F\_v}) ⊂ D\_p^× = ∏\_{v|p} GL\_2(F\_v). For a tame level U^p ⊂ (D ⊗\_F A\_F^{∞,p})^× let X\_raw(U^p) = D^×∖(D ⊗\_F A\_F^∞)^×/U^p with its quotient topology, X(U^pU\_p) = D^×∖(D ⊗\_F A\_F^∞)^×/U^pU\_p (a finite set), and X̂(U^p) = lim\_{U\_p} X(U^pU\_p), a profinite space. For general F no Hausdorff or manifold assertion is made about X\_raw(U^p): global units can accumulate in the finite adeles. In the continuous-function notation below X(U^p) means the actual adelic quotient X\_raw(U^p); the completed degree-zero carrier is defined by its torsion finite-level colimit and coefficient limit. For F = Q, DLB Lemme 4.4 identifies X\_raw(U^p) with X̂(U^p). For a topological O-module M the space C(X(U^p), M) of continuous functions carries the right-translation action of D\_p^× and of the centre (A\_F^∞)^×; for a continuous character ψ: (A\_F^∞)^×/F^×\_{≫0} → O^× trivial on U^p ∩ (A\_F^∞)^×, S\_ψ(U^p, M) ⊂ C(X(U^p), M) is the closed subspace of ψ-equivariant functions f(gz) = ψ(z)f(g). The nonzero arithmetic applications require ψ to be trivial on rational central scalars F^×; more generally the definition permits zero spaces when the character is incompatible. Put S\_ψ(U^p, A) = colim\_{U\_p} S\_ψ(U^pU\_p, A) for a discrete torsion O-module A (locally constant functions), the completed cohomology S\_ψ(U^p) = Hom\_O(E/O, S\_ψ(U^p, E/O)) ≅ lim\_n S\_ψ(U^p, O/ϖ^n) with the p-adic topology, S\_ψ(U^p)\_E = E ⊗\_O S\_ψ(U^p), and the completed homology M\_ψ(U^p) = S\_ψ(U^p, E/O)^∨ (Pontryagin dual, compact-open topology); then S\_ψ(U^p) ≅ Hom^cont\_O(M\_ψ(U^p), O). For F = Q and no central character fixed, C^0(X) = C(X(K^p), L) is Dospinescu–Le Bras’s space of p-adic automorphic forms on B̄^\*.

D is definite (ramified at all infinite places) and split at every place above p; p splits completely in F so that each F\_v = Q\_p. The quaternionic tower is degree-zero: its cohomology is functions on finite sets; nonzero higher stabiliser cohomology at non-neat levels is not claimed to vanish. Pan’s §3.7 variant with a smooth character ξ of U^p (functions with f(guz) = ψ(z)ξ(u^p)f(g)) is the same construction applied to the kernel of ξ, followed by the ξ-isotypic part.

Use the following named interfaces:

- `TauCeti.DefiniteQuaternionCompleted.space` (constructor): The raw adelic quotient X\_raw(U^p) with its quotient topology and right D\_p^×-action, its finite level quotients X(U^pU\_p), and the separate profinite inverse limit X̂(U^p). For F = Q the raw quotient equals this inverse limit (DLB Lemme 4.4).
- `TauCeti.DefiniteQuaternionCompleted.functions` (constructor): C(X(U^p), M) with the right-translation action of D\_p^× × (A\_F^∞)^×, for a topological O-module M.
- `TauCeti.DefiniteQuaternionCompleted.withCentralCharacter` (constructor): S\_ψ(U^p, M) ⊂ C(X(U^p), M), the closed subspace of ψ-equivariant functions.
- `TauCeti.DefiniteQuaternionCompleted.completedCohomology` (constructor): S\_ψ(U^p) = lim\_n S\_ψ(U^p, O/ϖ^n) with the p-adic topology, and S\_ψ(U^p)\_E = E ⊗ S\_ψ(U^p).
- `TauCeti.DefiniteQuaternionCompleted.completedHomology` (constructor): M\_ψ(U^p) = S\_ψ(U^p, E/O)^∨ as a compact O[[K\_p]]-module with central character ψ^{-1}.
- `TauCeti.DefiniteQuaternionCompleted.invariants` (characterisation): S\_ψ(U^p, A)^{U\_p} = S\_ψ(U^pU\_p, A) for U\_p ⊂ K\_p open.
- `TauCeti.DefiniteQuaternionCompleted.schikhofDual` (equivalence): S\_ψ(U^p) ≅ Hom^cont\_O(M\_ψ(U^p), O) and M\_ψ(U^p) ≅ Hom\_O(S\_ψ(U^p), O).
- `TauCeti.DefiniteQuaternionCompleted.twist` (relation): For a continuous character θ of (A\_F^∞)^×/N(U^p)F^×\_{≫0}, f ↦ (θ∘N\_{D/F})·f is an isomorphism S\_ψ(U^p) ≅ S\_{ψθ^2}(U^p) intertwining T\_v with θ(Frob\_v)T\_v.
- `TauCeti.DefiniteQuaternionCompleted.equivCC` (compatibility): Identification with the CC.2 completed degree-zero object of the finite double-coset tower.

**Checks.**

- `TauCeti.DefiniteQuaternionCompleted.finiteLevel_computation` (computation): If U^pU\_p is sufficiently small and ψ is trivial on its intersection with the centre, S\_ψ(U^pU\_p, A) ≅ ⊕\_{i∈I} A over the finite set I = D^×∖(D ⊗ A\_F^∞)^×/U^pU\_p(A\_F^∞)^× (Pan (3)); for a coarse level the summand at t\_i is the invariants of the finite stabiliser.
- `TauCeti.DefiniteQuaternionCompleted.trivial_coefficients_degenerate` (degenerate): For M = 0 the space C(X(U^p), M) is zero; for M = O and ψ trivial the constant functions are D\_p^×-invariant, and for a continuous character χ of the norm group the functions χ∘N\_{D/F} span a line on which D\_p^× acts through χ∘N\_{D/F}; on the empty set (no double cosets) every function space is zero.
- `TauCeti.DefiniteQuaternionCompleted.invariants_compatibility` (compatibility): The U\_p-invariants of S\_ψ(U^p, O/ϖ^n) are the finite-level quaternionic forms S\_ψ(U^pU\_p, O/ϖ^n) of HilbertModularVarietiesAndShimuraCurves R18.3.
- `TauCeti.DefiniteQuaternionCompleted.not_locally_constant` (non-example): For trivial (more generally smooth compatible) ψ, continuous O-valued functions are the completion of locally constant ψ-functions; for an infinite-image restriction of ψ to every open subgroup of the p-adic centre, all smooth ψ-vectors vanish. Thus the integral object must be defined by lim\_n of torsion-level functions, rather than by asserting density of integral smooth ψ-functions for every continuous ψ.

PAN, Definition 3.5.2 and Theorem 3.5.5: M\_ψ(U^p)\_m is the global object whose block component is compared with Paškūnas’s projective envelope. DLB, Théorème 5.4 and §13: C^0(X)[𝔭] ≅ Π(𝔭)^{⊕r} is the zero-dimensional local–global compatibility. TUNG-2, §4.6: M\_ψ(U^p)\_m is patched into M̃\_∞. CDN, Proposition 4.11: Scholze’s functor is applied to S\_{ψ,λ,m}. GL2ModularityLifting R32.3–R32.4 (through R31.4–R31.5): Tung’s dyadic and Pan’s residually reducible arguments work on this module.

A proof proceeds as follows.

1. The finite double coset sets X(U^pU\_p) and their stabilisers are HilbertModularVarietiesAndShimuraCurves R18.3 (definite class set); X̂(U^p) = lim\_{U\_p} X(U^pU\_p) is profinite. For general F this does not prove that the raw quotient is Hausdorff; the finite-level construction avoids that assertion.
2. S\_ψ(U^p, A) for discrete torsion A is the CC.1 fixed-exponent colimit of the degree-zero tower; S\_ψ(U^p) is its CC.2 coefficient limit; these are the CompletedCohomologyPartII carriers of the finite discrete arithmetic tower, as for the definite unitary groups in CC.8/definite-unitary-degree-zero.
3. The identifications S\_ψ(U^p) ≅ lim\_n S\_ψ(U^p, O/ϖ^n) ≅ Hom^cont(M\_ψ(U^p), O) and M\_ψ(U^p) ≅ Hom\_O(S\_ψ(U^p), O) are Pontryagin and Schikhof duality (CompletedCohomologyPartII CC.3 (continuous dual conventions), Pan Remark 3.2.3). HilbertModularVarietiesAndShimuraCurves R18.3 (definite class set) states the finite class set in Khare–Wintenberger’s setting (F of even degree, D split at the finite places considered, quotient by the centre); the same finiteness for Pan’s D (any definite D split above p, no central quotient) is the compactness of D^×∖(D ⊗ A\_F^∞)^× modulo the centre for an anisotropic group, with the centre handled by the finiteness of F^×∖(A\_F^∞)^×/(U ∩ (A\_F^∞)^×) times its connected component.
4. The ψ-isotypic part is a closed subspace since (A\_F^∞)^× acts continuously; twisting by θ∘N\_{D/F} gives S\_ψ(U^p) ≅ S\_{ψθ^2}(U^p) (Pan 3.2.7).

**Checks.**

- For D = B̄ over Q and K^p = ∏\_{ℓ≠p} K\_ℓ with one K\_{ℓ\_0} torsion-free, the right G-action on X has finitely many GL\_2(Z\_p)-orbits (§1.7).
- The U\_p-invariants of S\_ψ(U^p, A) are S\_ψ(U^pU\_p, A) (Pan Remark 3.2.3).

*Needs:* HilbertModularVarietiesAndShimuraCurves R18.3 (definite class set); CompletedCohomologyPartII CC.1 (fixed exponent smooth colimit); CompletedCohomologyPartII CC.2 (coefficient limit completion); CompletedCohomologyPartII CC.3 (continuous dual conventions); mathlib:ContinuousMap; mathlib:LocallyConstant; mathlib:QuaternionAlgebra; mathlib:IsDedekindDomain.FiniteAdeleRing.

PAN, §3 (setting), p. 17; §3.1.1, pp. 17–18; Definition 3.2.2, Remark 3.2.3, 3.2.7, pp. 19–20: The definite quaternion algebra over a totally real field in which p splits completely, the spaces S\_{τ,ψ}(U, A) of continuous functions with central character, the completed cohomology S\_ψ(U^p) and completed homology M\_ψ(U^p) with their dualities, and twisting by characters of the reduced norm.

PAN, §3.7.1–3.7.2, p. 37: The variant S\_{ψ,ξ} with a smooth character ξ of the tame level, deduced from the untwisted case through the kernel of ξ.

DLB, §4.1, Définition 4.3, p. 20: For B̄ over Q split at p and ramified at ∞: X = B̄^\*(Q)∖B̄^\*(A\_f)/K^p is the projective limit of the finite sets X(K\_p), with a right action of G = GL\_2(Q\_p), and C^0(X) is the space of p-adic automorphic forms.

TUNG-2, §4.1, Lemma 4.1.1, p. 18: Tung uses the same S\_ψ(U^p, E/O) and M\_ψ(U^p) for a definite quaternion algebra over a totally real field in which 2 splits completely.

The representative `DefiniteQuaternion.translate` works for any commutative topological ring O, topological O-module M, space X and group with continuous translations on X. It sends f to x ↦ f(g⁻¹x), as an O-linear map. Prove `translate_one`, `translate_mul`, and `translate_apply_smul`. The representative `DefiniteQuaternion.withCentralCharacter` uses a homomorphism ι:Z→D and ψ:Z→Oˣ and is the submodule defined by f(ι(z)x)=ψ(z)f(x). It needs no commutation assumption merely to define that submodule; preservation by D-translation additionally requires the image of ι to be central. Prove `withCentralCharacter_mem`, linear closure and, with this centrality hypothesis, translation stability.

**Checks.**

- For X=D with left multiplication, `(translate g f)(gx)=f(x)`; using f(gx) instead reverses multiplication when g and h do not commute.
- For a two-point regular action of a cyclic group of order two, translation of the indicator of one point is the indicator of the other; a constant translation operator fails this test.
- If z∈F^× is a rational central scalar, left D^×-invariance gives f(gz)=f(g). Thus ψ(z)≠1 forces all E-valued forms to vanish. Nonzero finite-level rank formulas require this rational-centre compatibility as well as the stated compatibility on U∩centre.
- For ψ=1, the central-character submodule is precisely the centre-invariant functions. For a point fixed by z with ψ(z)−1 invertible in E, the value is zero; the nonzero constant function is excluded. Under inverse translation, such functions have central eigenvalue ψ⁻¹.

### 1.7 Structure of the definite quaternionic tower


In the setting of §1.6: (a) the finite-level double-coset set X(U^pU\_p) is finite for each compact open U\_p. For F = Q, writing the finitely many D^×-orbits away from p with stabilisers Γ\_i ⊂ GL\_2(Q\_p), these Γ\_i are discrete cocompact and X\_raw(U^p) ≅ ⊔\_i Γ\_i∖GL\_2(Q\_p) is a compact p-adic analytic manifold with locally analytic action (DLB Lemme 4.4). This raw-quotient manifold statement is restricted to F = Q. (b) For F = Q and a tame component K\_{ℓ\_0} torsion-free, GL\_2(Z\_p) acts freely with finitely many orbits; hence C(X,M) ≅ C(GL\_2(Z\_p),M)^{⊕s}. (c) For general F, under Pan’s central-character compatibility, with U^pK_p sufficiently small in the sense of (3.1.2) and ψ trivial on N_{D/F}(U^p), S\_ψ(U^p,E/O) is injective among smooth K\_p-representations with the prescribed central character; its Pontryagin dual is finitely generated over O[[K\_p]] and projective in the corresponding compact category. S\_ψ(U^p)\_E is a topological direct summand of C\_ψ(K\_p,E)^{⊕d}. (d) The torsion module is admissible for D\_p^×; its localised summands remain admissible and injective on K\_p under the same smallness hypotheses.

For the Pan branch assume p odd; the dyadic projectivity branch uses Tung-2 Corollary 4.2.2 with its separate hypotheses. The general-F finite class set is required in the form used by Pan §3.1, not just the narrower even-degree supplier. The central-quotient adapter of CC.8 retains the closure of rational units. Neither discreteness of D^× in finite adeles nor a free K\_p-action is inferred over a general totally real field. (b) needs a torsion-free tame component. (c) needs all groups (t\_i^{-1}D^×t\_i ∩ U(A\_F^∞)^×)/F^× trivial, the central-character compatibility of Pan §3.1, and ψ|N_{D/F}(U^p)=1 as required by Proposition 3.2.4. Shrink U^p to meet both the smallness and norm-character conditions. The localisation assertion retains these conditions. Finiteness of X(U^p)/K\_p uses strong approximation for the reduced-norm-one group and finiteness of the class set; no claim is made for an indefinite quaternion algebra.

A proof proceeds as follows.

1. (a): use the definite finite class set for the finite-level assertion. Over Q, DLB Lemme 4.4 proves the discrete-cocompact stabiliser description. Over general F, use Pan 3.1.2–3.1.3 for the quotient by the centre; global units prevent the Q argument from establishing discreteness of the raw stabilisers.
2. (b): a nontrivial stabiliser of a point of X in GL\_2(Z\_p) would be a finite-order element of D^× lying in a conjugate of K\_{ℓ\_0}, which is torsion-free; finitely many orbits by (a); choose a section on each orbit (DLB Lemma 13.1).
3. (c): assume U^pK_p sufficiently small and ψ|N_{D/F}(U^p)=1. For a finite torsion smooth K\_p-module M, S\_{M,ψ}(U^pK\_p, O) ≅ Hom\_{O[K\_p]}(M^∨, S\_ψ(U^p, E/O)) (Pan Lemma 3.2.5); the left side is exact in M at sufficiently small level by Pan Corollary 3.1.3, giving injectivity on finite modules, and Mittag-Leffler gives it in general (Pan Proposition 3.2.4); dualise and use admissibility for finite generation and the direct-summand statement (Pan Corollary 3.2.6; Tung-2 Corollary 4.2.2).
4. (d): (S\_ψ(U^p, E/O))^{U\_p} = S\_ψ(U^pU\_p, E/O) is cofinitely generated, giving admissibility; localisation is a direct summand, and injectivity passes to summands (CDN Proposition 4.7(a), citing Paškūnas).

**Checks.**

- For F = Q, B̄ of discriminant 2 and p = 3, (b) holds with K^p maximal away from 2 and principal-congruence and torsion-free at an auxiliary prime ℓ\_0 ≥ 5.
- Non-example: without a torsion-free component the GL\_2(Z\_p)-action on X can have nontrivial finite stabilisers, and C(X, M) is then only a sum of induced modules from those stabilisers.

*Needs:* §1.6; HilbertModularVarietiesAndShimuraCurves R18.3 (definite class set); HilbertModularVarietiesAndShimuraCurves R18.3 (neatness base change); CompletedCohomologyPartII CC.5 (smooth dual admissibility); mathlib:Module.Projective; mathlib:CompactSpace; CompletedCohomologyPartII CC.8 (arithmetic shimura central quotient).

DLB, Lemme 4.4, p. 21; Lemme 13.1, p. 69: X is a finite disjoint union of Γ\_i∖G with Γ\_i discrete cocompact, a compact p-adic analytic manifold; GL\_2(Z\_p) acts freely with finitely many orbits, so C^0(X, M) ≅ C^0(GL\_2(Z\_p), M)^{⊕s}.

PAN, Corollary 3.1.3, p. 18; Proposition 3.2.4, Lemma 3.2.5, p. 19; Corollary 3.2.6, p. 20: Exactness of quaternionic forms at sufficiently small level, injectivity of S\_ψ(U^p, E/O) among smooth K\_p-modules with central character, projectivity and finite generation of M\_ψ(U^p), and the direct-summand embedding of S\_ψ(U^p)\_E into C\_ψ(K\_p, E)^{⊕d}.

TUNG-2, Lemma 4.1.1, p. 18; Corollary 4.2.2, p. 19: Local admissibility of S\_ψ(U^p, E/O) and projectivity of M\_ψ(U^p) in the category of pseudo-compact modules, for the 2-adic setting.

CDN, Proposition 4.7, p. 49: S\_ψ(U^p, L/O)\_m is nonzero, admissible and injective in the smooth K\_p-representations with central character ψ\_p.

### Examples

For a neat modular tower and an irreducible residual ideal, the boundary term vanishes and mod-ϖ K_p-invariants recover the finite-level localised cohomology. Without localisation, the degree-zero determinant representation and Eisenstein cusp terms remain; the vanishing statement cannot be extended to the entire tower. On the definite Q quaternionic tower with a torsion-free tame component, each compact-group orbit is a copy of K_p, so its continuous functions give one regular representation. The empty orbit set gives zero summands.

### Dependencies

CompletedCohomologyPartII CC.0–CC.8 and ArithmeticLocallySymmetricSpaces ALS.6 supply the towers, limits, duality and descent. ModularCurvesPartII R13–R14 supplies modular curves, boundary and coefficient comparisons, including the dyadic boundary extension. HilbertModularVarietiesAndShimuraCurves R18.3–R18.4 supplies the general definite finite class-set adapter and Shimura H⁰ vanishing. Use Mathlib’s continuous maps, absolute Galois groups and quaternion algebras.

## Layer 2: classical specialisations and locally algebraic vectors


Classical cohomology with algebraic coefficients is recovered from completed cohomology in degree one, and only there: the Hochschild–Serre spectral sequence of CompletedCohomologyPartII CC.6, fed with Emerton's computation of the Lie-algebra Ext groups of the explicit Ĥ⁰ and the vanishing of Ĥ², identifies H¹ with coefficients in V\_W with the W̌-equivariant locally analytic vectors, and summing over W gives Emerton's description of the locally algebraic vectors. Density of algebraic vectors (Mahler) then shows that classical eigensystems are dense. The newform comparison fixes the Hecke normalisation against Mathlib's cusp forms through ModularCurvesPartII's weight-two Shimura isomorphism, and the required example — the newform of level 11 — is given below. Nakamura's Lemmas 2.9–2.11 give the dual statement for completed Borel–Moore homology, which KatoEulerSystems consumes. For the definite quaternion algebra the comparison is elementary (functions on finite sets), and the type-specialised modules σ° ⊗ M\_ψ(U^p) are the finite-level modules of Tung's Lemma 5.3.2.
The global Serre-weight set and good-weight predicate are defined separately from the local predicted weights. The weight upper bound, good-weight derivative and away-from-p genericity theorem retain their small-weight, multiplicity-one and Ihara supplier inputs.

### 2.1 Locally algebraic vectors of completed cohomology


For \* ∈ {∅, c} there is a natural G\_Q × GL\_2(A\_f)-equivariant isomorphism ⊕\_{k≥2, n∈Z} H^1\_\*(V\_k)\_E ⊗\_E (Sym^{k−2}E^2)^∨ ⊗\_E E(n) ≅ (Ĥ^1\_{\*,E})\_{l.alg}, where (Ĥ^1\_{\*,E})\_{l.alg} is the subspace of locally GL\_2(Q\_p)-algebraic vectors, H^1\_\*(V\_k)\_E = colim\_{K\_f} H^1\_\*(Y(K\_f), V\_k) is the cohomology of the tower with coefficients in the local system V\_k attached to Sym^{k−2} of the standard representation, E(1) is the line on which G\_Q × GL\_2(A\_f) acts by ε ⊗ (ε∘det), and GL\_2(A\_f) acts on (Sym^{k−2}E^2)^∨ through GL\_2(Q\_p). Its isotypic pieces come from the following degree statements, for an irreducible algebraic representation W of GL\_2(Q\_p) with dual W̌: (i) Ext^i\_{gl\_2}(W̌, Ĥ^0\_{la}) vanishes except for i ∈ {0, 3}, and both survivors vanish unless W is one-dimensional; (ii) H^0(V\_W) ≅ Hom\_{gl\_2}(W̌, Ĥ^0\_{la}) and H^1(V\_W) ≅ Hom\_{gl\_2}(W̌, Ĥ^1\_{la}), and Ext^1\_{gl\_2}(W̌, Ĥ^1\_{la}) ≅ Ext^3\_{gl\_2}(W̌, Ĥ^0\_{la}); (iii) for compact supports H^1\_c(V\_W) ≅ Hom\_{gl\_2}(W̌, Ĥ^1\_{c,la}) and H^2\_c(V\_W) ≅ Ext^1\_{gl\_2}(W̌, Ĥ^1\_{c,la}). Consequently, for a cuspidal newform f of weight k defined over E, V\_f ⊗\_E π(V\_f) ⊗\_E (Sym^{k−2}E^2)^∨ embeds G\_Q × GL\_2(A\_f)-equivariantly into Ĥ^1\_{\*,E}.

The comparison holds only in cohomological degree one; it uses the explicit Ĥ^0, the vanishing Ĥ^n = 0 for n ≥ 2 and Ĥ^2\_c = 0 (§1.3). A formal interchange of invariants and inverse limits is not used. Locally algebraic means: the orbit map of the vector is locally a polynomial in the matrix entries and det^{−1} on a compact open subgroup of GL\_2(Q\_p); this is stronger than locally analytic. (Sym^{k−2}E^2 ⊗ det^n)\_{k≥2,n∈Z} is a complete set of irreducible algebraic representations of GL\_2 over E.

A proof proceeds as follows.

1. CompletedCohomologyPartII CC.6 (hochschild serre descent to finite level) gives the continuous Hochschild–Serre spectral sequence H^i\_cts(U, Ĥ^j ⊗ W) ⇒ H^{i+j}(Y\_U, V\_W); passing to locally analytic vectors and Lie-algebra cohomology turns it into Ext^i\_{gl\_2}(W̌, Ĥ^j\_{la}) ⇒ H^{i+j}(V\_W) (EM06 Corollary 2.2.18). CC.6/analytic-classical-comparison warns that the underived locally analytic vectors need justification: here the Ĥ^j are admissible Banach representations, on which the functor of locally analytic vectors is exact and has no higher derived functors (Schneider–Teitelbaum; Emerton’s locally analytic vectors memoir), so the underived and derived forms agree in this case.
2. Proposition 4.3.1 of EM06: Ĥ^0 restricted to Z(Q\_p) × SL\_2(Q\_p) is the tensor product of its restriction to the centre with the trivial SL\_2-representation; a Künneth argument and vanishing of positive z-Ext for C(Z\_p^×, E) give Ext^i\_{gl\_2}(W̌, Ĥ^0\_{la}) ≅ Hom\_z(E(χ^{-1}), Ĥ^0\_{la}) ⊗ H^i(sl\_2, W); Whitehead’s lemmas give (i) (EM06 Corollary 4.3.2).
3. Feed (i) and the vanishing of H^n(V\_W) for n > 1 into the spectral sequence to get (ii) (EM06 (4.3.3)–(4.3.5)); Ĥ^2\_c = 0 gives (iii) (EM06 (4.3.7)–(4.3.8)).
4. Sum (ii)/(iii) over the irreducible W = Sym^{k−2} ⊗ det^n and identify Hom\_{gl\_2}(W̌, −) ⊗ W̌ with the W̌-isotypic locally algebraic vectors; the Tate twist E(n) records det^n (EM-PAMQ Theorem 7.4.2).
5. For a newform f, H^1\_\*(V\_k)\_E contains V\_f ⊗ π(V\_f) G\_Q × GL\_2(A\_f)-equivariantly (EM-PAMQ Theorem 2.5.1): the Galois factor is the rank-two realisation of AutomorphicGaloisRepresentations R19.1 (newform rank two realisation) and the GL\_2(A\_f)-factor is identified with π(V\_f) by local–global compatibility away from p (R19.4) and at p (Saito, R19.5); R14.3/relative-coefficient-system supplies V\_k on the neat cofinal levels Y\_1(N), N ≥ 5, which suffice for the tower. The Manin–Drinfeld splitting of H^1\_c → H^1\_par allows either support (EM-PAMQ Corollary 7.4.3).

**Checks.**

- Weight two: the K\_p-invariant locally algebraic vectors of algebraic weight W = 1 recover H^1(Y(K\_pK^p), E), the cohomology carrying weight-two forms.
- For W one-dimensional, Ext^1\_{gl\_2}(W̌, Ĥ^1\_{la}) ≅ Ext^3\_{gl\_2}(W̌, Ĥ^0\_{la}) can be nonzero, so the degree-one comparison is exact only in the Hom term; the theorem does not claim vanishing of higher Ext for trivial W.

*Needs:* §1.1; §1.3; CompletedCohomologyPartII CC.6 (hochschild serre descent to finite level); CompletedCohomologyPartII CC.6 (analytic classical comparison); CompletedCohomologyPartII CC.6 (algebraic coefficient untwisting); CompletedCohomologyPartII CC.6 (classical evaluation map); ModularCurvesPartII R14.3 (relative coefficient system); AutomorphicGaloisRepresentations R19.1 (newform rank two realisation); AutomorphicGaloisRepresentations R19.1 (parabolic realisation premotive); AutomorphicGaloisRepresentations R19.4 (hecke versus langlands normalization and local global compatibility); AutomorphicGaloisRepresentations R19.5 (potential semistability and compatibility at the coefficient prime).

EM06, Proposition 4.3.1 and Corollary 4.3.2, pp. 52–53; (4.3.3)–(4.3.5), (4.3.7)–(4.3.8), p. 53: Ext groups of algebraic representations with values in the locally analytic vectors of Ĥ^0 are computed by Lie-algebra cohomology of sl\_2, which kills all but degrees 0 and 3; the Hochschild–Serre spectral sequence then identifies H^1 with coefficients in V\_W with the W̌-equivariant locally analytic vectors in degree one, and similarly with compact supports.

EM-PAMQ, Definition 7.4.1, Theorem 7.4.2, Corollary 7.4.3, pp. 69–70: The locally algebraic vectors of Ĥ^1\_{\*,E} are the direct sum over k ≥ 2 and n of H^1\_\*(V\_k)\_E ⊗ (Sym^{k−2})^∨ ⊗ E(n); a cuspidal newform contributes V\_f ⊗ π(V\_f) ⊗ (Sym^{k−2})^∨.

EM11, Proof of Proposition 5.3.13, p. 51; proof of Corollary 5.4.5, p. 55: Emerton’s local–global paper uses [38, Thm. 7.4.2] (= EM-PAMQ Theorem 7.4.2) to describe the locally algebraic vectors at classical points.

### 2.2 Density of algebraic and classical vectors


(a) The GL\_2(Z\_p)-algebraic vectors of Ĥ^1(K^p)\_E are dense, as are those of any closed G-stable topological direct summand. (b) In the non-Eisenstein summand, the E[G]-span of these fixed-GL\_2(Z\_p)-algebraic vectors is the sum of the locally algebraic parts at crystalline classical points (classical cuspidal forms of conductor prime to p). Consequently that sum is dense. This does not identify the span with the contributions of all classical forms ramified at p; their smooth local factors need not have GL\_2(Z\_p)-fixed vectors. (c) For F = Q, GL\_2(Z\_p)-algebraic vectors are dense in a topological direct summand of C(X,E). In Pan’s general-F setting, assume ψ is algebraic on O\_{F\_v}^× at a selected v | p and locally algebraic at the other p-adic places. Vectors algebraic on GL\_2(O\_{F\_v}) and locally algebraic at the remaining places are dense in S\_ψ(U^p)\_E.

Density is for the Banach topology of Ĥ^1(K^p)\_E (resp. of C^0(X), S\_ψ(U^p)\_E). Part (b) is stated after non-Eisenstein localisation and uses crystalline classical points. For (c), the central character must admit the indicated algebraic weights at every place above p, not just at v.

A proof proceeds as follows.

1. Reduce to a neat level: averaging over K^p/K^{p′} projects Ĥ^1(K^{p′})\_E onto Ĥ^1(K^p)\_E (EM11 Remark 5.4.2).
2. Since Y(GL\_2(Z\_p)K^p) is homotopic to a finite one-dimensional complex, Ĥ^1(K^p)\_E is a quotient of C(GL\_2(Z\_p), E)^s compatibly with algebraic vectors (EM06 Theorem 2.1.5); in the localised case §1.4(d) makes it a direct summand of C(GL\_2(Z\_p), E)^s directly (EM11 Proposition 5.4.1).
3. Use mathlib:PadicInt.dense\_span\_mahler on Z\_p with coefficients in E. Coordinatewise approximation on finite residue grids gives density of multivariable polynomials on Z\_p^4; extend continuous functions from the clopen subset GL\_2(Z\_p) by zero and restrict the approximations. Polynomial matrix coefficients are algebraic vectors, and density passes through the equivariant quotients or summands used above.
4. (b): EM11 Corollary 5.4.5 decomposes the G-span of the fixed-compact algebraic vectors over crystalline classical points, using the classical comparison and semisimplicity. The distinction between fixed-compact algebraic and locally algebraic vectors retains the prime-to-p conductor restriction.
5. (c) is the same argument with §1.7(b) in place of the topology of the modular curve (DLB Lemme 13.2), and in Pan’s generality through the isomorphism S\_{(k,w),ψ}(U^pU\_p, E) ≅ Hom\_{U\_p}(W^\*\_{(k,w)}, S\_ψ(U^p)\_E) (Pan Proposition 3.2.9).

**Checks.**

- Katz’s density of classical modular forms in p-adic modular forms is the analogue (EM11 Remark 5.4.3).
- Smooth weight-two classes over all p-power levels are already dense by the completion definition. The stronger assertion tested here is density of vectors algebraic for one fixed GL\_2(Z\_p); its G-span uses crystalline classical points, rather than all classical eigensystems.

*Needs:* §1.1; §1.4; §1.7; §2.1; mathlib:ContinuousMap; mathlib:Subalgebra.topologicalClosure; mathlib:PadicInt.dense\_span\_mahler.

EM11, Proposition 5.4.1 and Remark 5.4.2, pp. 54–55: GL\_2(Z\_p)-algebraic vectors are dense in Ĥ^1(K\_{Σ\_0})\_{E,ρ̄}, and even without localising, by Mahler expansions and the realisation of Ĥ^1 as a quotient (or summand) of a finite sum of C(GL\_2(Z\_p), E).

EM11, Corollary 5.4.5 and its proof, p. 55: The G-span of fixed-GL\_2(Z\_p)-algebraic vectors decomposes over the crystalline classical points and is dense in the non-Eisenstein summand.

DLB, Lemme 13.2, p. 69: GL\_2(Z\_p)-algebraic vectors are dense in any topological direct factor of C^0(X), by Lemme 13.1 and Mahler’s theorem.

PAN, 3.2.8, Proposition 3.2.9 and its proof, pp. 20–21: The general-F density statement uses ψ algebraic at the chosen place and locally algebraic at all other places above p.

EM06, Theorem 2.1.5, p. 22: The completed cohomology of a tower of finite complexes is computed by a finite complex of C(H, E)-modules.

### 2.3 Global Serre weights and good weights


For a modular absolutely irreducible residual representation ρ̄ and K = GL\_2(Z\_p), W\_gl(ρ̄) is the set of Serre weights V for which Hom\_K(V,H^1\_{k,ρ̄,Σ}) is nonzero. This is equivalent to nonzero Hom\_K(V,H^1\_{k,ρ̄,Σ}[m]). Write a Serre weight as (Sym^r k²)^dual ⊗ det^s, with 0 ≤ r ≤ p−1 and 0 ≤ s ≤ p−2. An occurring weight is good if r < p−1, or if r = p−1 and det^s does not belong to W\_gl(ρ̄). The local weight set and compact-Hecke algebra are imported from R15/R30; only global occurrence and its good-weight predicate are defined here.

The cohomology is the non-Eisenstein mod-ϖ tower with its smooth K-action; m is the residual maximal ideal of T\_{ρ̄,Σ}. The representation ρ̄ is absolutely irreducible and modular. These definitions require neither local non-scalarity nor a weight-part converse.

Use the following named interfaces:

- `TauCeti.ModularCompletedCohomology.globalSerreWeights` (constructor): The set W\_gl(ρ̄) defined by nonzero K-equivariant maps into H^1\_{k,ρ̄,Σ}.
- `TauCeti.ModularCompletedCohomology.mem_globalSerreWeights_iff_m_torsion` (characterisation): V ∈ W\_gl(ρ̄) if and only if Hom\_K(V,H^1\_{k,ρ̄,Σ}[m]) ≠ 0.
- `TauCeti.ModularCompletedCohomology.isGoodWeight` (constructor): For V ∈ W\_gl(ρ̄), the predicate r < p−1 or (r = p−1 and det^s ∉ W\_gl(ρ̄)).

**Checks.**

- `TauCeti.ModularCompletedCohomology.goodWeight_interior` (computation): Every occurring weight with r < p−1 is good, regardless of whether det^s occurs.
- `TauCeti.ModularCompletedCohomology.goodWeight_boundary` (non-example): An occurring weight with r = p−1 is not good when det^s also occurs; the boundary condition cannot be omitted.
- `TauCeti.ModularCompletedCohomology.globalWeight_m_torsion` (compatibility): Testing occurrence in the whole m-power-torsion tower or in its m-torsion gives the same weight set, rather than requiring the whole Hom space to be killed by m.

§2.4: Separates genericity for every occurring weight from the derivative formula, which needs a good weight. §6.3: Distinguishes actual global occurrence from membership in the predicted local weight set.

A proof proceeds as follows.

1. Define occurrence using the imported Serre-weight carrier and the mod-ϖ arithmetic tower.
2. Every vector of the relevant Hom module is killed by a power of m; a nonzero such module has nonzero m-socle, giving the equivalent occurrence test (EM11 Remark 5.7.2, p. 63).
3. Define goodness by the two explicit cases of EM11 Definition 5.7.5, p. 64. No assertion of W\_gl = W(ρ̄\_p) enters the definition.

**Checks.**

- A predicted local Serre weight with no global occurrence is not in W\_gl by definition; only a separate weight-part theorem supplies the converse inclusion.

*Needs:* §1.4; AlgebraicModularFormsAndSerreWeights R15.4 (recipe well definedness and twisting).

EM11, Definitions 5.7.1 and 5.7.5, Remark 5.7.2, pp. 63–64: Global occurrence, its equivalent m-torsion test and the good-weight predicate.

### 2.4 Serre-weight bounds and genericity in mod-p cohomology


For an absolutely irreducible modular ρ̄ unramified outside Σ, use W\_gl(ρ̄) and good weights as defined in §2.3. Write V = (Sym^r k^2)^dual ⊗ det^s, 0 ≤ r ≤ p−1 and 0 ≤ s ≤ p−2. Call V good if r < p−1, or r = p−1 and det^s does not also occur globally. Then (1) W\_gl(ρ̄) ⊂ W(ρ̄\_p). If ρ̄\_p is non-scalar, (2) for every good V in W\_gl, the away-from-p top derivative of the Hecke-socle part of Hom\_K(V,H^1\_{k,ρ̄,Σ}[m]) is ρ̄ ⊗ soc\_H(V) m(V,ρ̄\_p), in EM11’s Hecke-module notation; (3) for every V in W\_gl, Hom\_K(V,H^1\_{k,ρ̄,Σ}[m]) is generic as a G\_{Σ\_0}-representation. These are the three assertions of EM11 Theorem 5.7.7. Their precise small-weight reduction and multiplicity-one/Ihara inputs are the small-weight and good-weight supplier specifications above; neither the upper bound (1) nor the good-weight qualification can be replaced by a full weight-part converse.

K = GL\_2(Z\_p); W(ρ̄\_p) and the Hecke module m(V,ρ̄\_p) use EM11 §5.7’s conventions. The non-scalar condition is needed for (2)–(3), not for the inclusion (1). The good-weight condition removes an overlapping determinant weight at r = p−1. Import the local Serre-weight Hecke algebra H(V) = End\_G(c-Ind\_K^G V) ≅ k[T,Z,Z^{-1}] and the module m(V,ρ̄\_p) with the cohomological convention of EM11 Definitions 3.5.2–3.5.4: for absolutely irreducible ρ̄\_p it is one-dimensional with T = 0 and Z = det(ρ̄\_p)(p); for reducible ρ̄\_p and V = (Sym^r k²)^dual ⊗ det^s it is Hom\_{I\_p}(ε̄^s,ρ̄\_p), T acts by geometric Frobenius and Z by det(ρ̄\_p)(p). Here evaluation at p uses local reciprocity, not a choice of an element named p in the Galois group. This exact compact-Hecke module is a supplier specification for the local/Serre-weight owners, not a new general Hecke algebra construction here.

A proof proceeds as follows.

1. Lift a global Serre-weight occurrence to characteristic zero using localised K-injectivity; the classical comparison and a Hecke-eigenvalue lift produce a form of weight at most p+1. Its small-weight mod-p local description gives (1) and the Hecke eigensystem constraint. This exact small-weight theorem is not supplied merely by a minimal-weight assertion in R20.
2. For a good weight, the classical mod-p multiplicity-one theorem identifies the relevant Hecke socle and Whittaker derivative, giving (2). This is the specified coefficient multiplicity-one input, not a routine finite-dimensional computation.
3. For (3), the Ihara argument rules out finite-dimensional GL\_2(Q\_ℓ)-subobjects at each ℓ ∈ Σ\_0 after non-Eisenstein localisation, forcing genericity. Use R14.4 with the coefficient/tower Ihara extension specified above.

**Checks.**

- At r = p−1, occurrence of det^s makes the corresponding weight non-good; dropping this condition incorrectly applies the multiplicity formula to the overlapping weight.
- The upper-bound statement permits a missing predicted weight. Its converse requires the full weight-part input separately used by the globalisation argument.
- Genericity is required for every occurring V under non-scalarity, while the explicit derivative formula is only asserted for good V.

*Needs:* §1.4; §2.1; AlgebraicModularFormsAndSerreWeights R15.4 (recipe well definedness and twisting); ModularCurvesPartII R14.4 (enhanced ihara); PadicLocalLanglandsForGL2Qp R30.3; §2.3.

EM11, §3.5, Definitions 3.5.1–3.5.4 and Lemma 3.5.5, pp. 31–32; §5.7, Definitions 5.7.1 and 5.7.5, Remarks 5.7.2–5.7.6, Theorem 5.7.7 and proof, pp. 63–66: Global weight occurrence, good weights, the local-weight upper bound, good-weight Hecke-socle derivative, and genericity of the away-from-p representation.

### 2.5 Classical eigensystems and newforms in completed cohomology


Let T(Σ) = O[T\_ℓ, S\_ℓ]\_{ℓ∉Σ} be the abstract spherical Hecke algebra and λ: T(Σ) → E′ a system of Hecke eigenvalues over a finite extension E′/E. Then: (a) the λ-part of (Ĥ^1(K^p)\_{E′})\_{l.alg} is nonzero if and only if λ, up to the cyclotomic twist of §2.1, is the eigensystem of a classical eigenform of weight k ≥ 2 and tame level K^p (cuspidal or Eisenstein); (b) for a cuspidal newform f of weight k and conductor N prime to p, with λ\_f its eigensystem, Ĥ^1(K\_1(N)^p)\_{E′}[λ\_f]\_{l.alg} ≅ V\_f ⊗ Sym^{k−2}(E′^2)^∨ ⊗ π\_p(V\_f) as G\_Q × GL\_2(Q\_p)-representations, where π\_p(V\_f) is the local component at p of the automorphic representation of f; (c) under the identification of weight-two cusp forms with H^1 of the modular curve (ModularCurvesPartII R14.3 (weight two shimura isomorphism)), the Hecke operator T\_ℓ on Ĥ^1 restricts to the classical T\_ℓ on Mathlib’s CuspForm space at level Γ\_1(N), with the normalisation of R14 (T\_ℓ the double coset of diag(ℓ, 1) after Emerton’s transpose-inverse convention); (d) every eigensystem λ with Ĥ^1(K^p)\_{E′}[λ] ≠ 0 is promodular in the sense of EM-PAMQ Definition 7.3.15, and attached to it is a two-dimensional odd continuous G\_Q-representation over E′ unramified outside Σ, unique up to semisimplification.

The Hecke normalisation is that of R14 and Emerton lg §2 (the actions of [16] twisted by g ↦ (g^{-1})^t); geometric Frobenius at ℓ has characteristic polynomial X^2 − T\_ℓX + ℓS\_ℓ on the Galois factor. In (b), π\_p(V\_f) is the generic smooth representation of GL\_2(Q\_p) attached to f; p ∤ N is used only to identify the K\_p-type.

A proof proceeds as follows.

1. (a) and (b) are §2.1 combined with the decomposition of H^1\_\*(V\_k)\_E into Hecke eigenspaces, and multiplicity one for newforms with Eichler–Shimura (EM-PAMQ Corollary 7.4.3, Remark 7.3.14; EM11 proof of Theorem 3.3.22 in §7.4).
2. (c) is the weight-two Shimura isomorphism of ModularCurvesPartII R14.3 (weight two shimura isomorphism) and the Hecke compatibility of R14.1/analytic-comparison-of-correspondences, transported to the completed tower by §1.2(b).
3. (d): Remark 7.3.14 of EM-PAMQ shows eigensystems occurring in Ĥ^1 are promodular; Proposition 7.3.17 constructs the Galois representation from the pseudo-representation on the product of the T(K^p)/I\_f, using that ∩\_f I\_f = 0 by density of H^1 in Ĥ^1; oddness follows from oddness of each V\_f.

**Checks.**

- Worked example: for the weight-two newform f of level 11 and p = 5 (good ordinary), Ĥ^1(K\_1(11)^p)\_E[λ\_f]\_{l.alg} ≅ V\_f ⊗ π\_p(V\_f) with π\_p(V\_f) the unramified principal series whose Satake parameters are the roots of X^2 − a\_5(f)X + 5, a\_5(f) = 1, and the Hecke operator T\_ℓ acts on it by a\_ℓ(f) for ℓ ∤ 55 in R14’s normalisation.
- Non-example: an eigensystem of a weight-one form does not occur in the locally algebraic vectors, although it occurs in Ĥ^1 as a promodular eigensystem (EM-PAMQ Remark 7.3.14).

*Needs:* §1.1; §1.2; §2.1; ModularCurvesPartII R14.3 (weight two shimura isomorphism); ModularCurvesPartII R14.1 (analytic comparison of correspondences); AutomorphicGaloisRepresentations R19.1 (lambda adic representation of a weight k eigenform); AutomorphicGaloisRepresentations R19.4 (hecke versus langlands normalization and local global compatibility); IntegralHeckeAndGaloisDeterminants IHG.3 (rank two modular normalization); mathlib:CuspForm; mathlib:ModularForm.

EM-PAMQ, Definitions 7.3.1–7.3.5, Remark 7.3.14, Definition 7.3.15, Proposition 7.3.17, Remark 7.3.18, pp. 65–69: Systems of Hecke eigenvalues, Eisenstein systems, promodularity, and the existence and oddness of the Galois representation attached to a promodular eigensystem.

EM-PAMQ, Corollary 7.4.3, p. 70: A cuspidal newform contributes V\_f ⊗ π(V\_f) ⊗ (Sym^{k−2})^∨ to Ĥ^1.

EM11, §7.4, pp. 97–98: At a classical point of conductor N, Ĥ^1(K\_1^p(N))[𝔭]\_{l.alg} ≅ ρ(𝔭) ⊗ Sym^{a−b−1} ⊗ det^b ⊗ π\_p(V), by [38, Thm. 7.4.2].

### 2.6 Completed homology with coefficients recovers classical cohomology


Let H̃^{BM}\_1(K^p) = lim\_{K\_p} H\_1(Y(K\_pK^p)(C), {cusps}, O) be completed Borel–Moore homology at tame level K^p, a compact O[[GL\_2(Z\_p)]]-module with Hecke operators T′\_ℓ, S′\_ℓ. (a) For every compact O[[GL\_2(Z\_p)]]-module M there is a canonical Hecke-equivariant isomorphism M ⊗̂\_O H̃^{BM}\_1(K^p) ≅ H̃^{BM}\_1(K^p, 𝒱\_M) of compact O[[GL\_2(Z\_p)]]-modules, where 𝒱\_M is the induced pro-local system. (b) For an algebraic representation W of GL\_2/Q\_p over E, regarded as a right O[[K\_p]]-module through v·g = g^{-1}v, and any open K\_p ⊂ GL\_2(Z\_p), there is a canonical E-linear isomorphism W ⊗\_{O[[K\_p]]} H̃^{BM}\_1(K^p) ≅ H^1(K^pK\_p, 𝒱\_W)(1), compatible with Hecke operators, change of K\_p, coefficient change W → W′ and the trace maps. (c) For a smooth representation τ of GL\_2(Z\_p) on a finite free O-module and W as above, (τ ⊗ W) ⊗\_{O[[K\_p]]} H̃^{BM}\_1(K^p) ≅ H^1(K^pK\_p, 𝒱\_{τ⊗W})(1) for every open K\_p, by Hochschild–Serre after choosing a smaller open normal subgroup acting trivially on τ. No integral isomorphism and no integral self-duality of symmetric powers is asserted.

(b) and (c) are rational statements (after inverting p); the integral map exists but is not claimed to be an isomorphism. Borel–Moore homology is relative to the cusps; H̃^{BM}\_1(K^p) is dual to Ĥ^1\_c(K^p) by §1.3 and Poincaré duality (Nakamura Lemma 2.4).

A proof proceeds as follows.

1. (a): write M = lim M\_i with M\_i of finite length; for K\_p acting trivially on M\_i, M\_i ⊗ H\_1(K^pK\_p) ≅ H\_1(K^pK\_p, 𝒱\_{M\_i}) using the vanishing of ordinary H² of the non-compact curve with these coefficients; pass to limits (NAK Lemma 2.9).
2. (b): apply (a) to a K_p-stable lattice W₀. Dualise the compact-support coefficient comparison with W₀*, obtaining the closed K_p-coinvariants of completed homology as the O-dual of the K_p-invariants of completed compact-support cohomology. After inverting p, §2.1 identifies those invariants with H¹_c(K^pK_p,𝒱_{W*}); Poincaré duality gives H¹(K^pK_p,𝒱_W)(1). This is Nakamura Lemma 2.10, pp. 29–30. No vanishing of finite-level Borel–Moore H₂ is used.
3. (c): tensor with τ and use Hochschild–Serre for the finite quotient through which GL\_2(Z\_p) acts on τ (NAK Lemma 2.11).

**Checks.**

- For W trivial and K\_p = GL\_2(Z\_p), (b) gives O-coinvariants of H̃^{BM}\_1(K^p) ⊗ E ≅ H^1(Y(GL\_2(Z\_p)K^p), E)(1).
- KatoEulerSystems L2 consumes (b) with W = Sym^{k−2}(Z\_p^2)^\* in the form Sym^{k−2}(Z\_p^2)^\* ⊗\_{Z\_p[[K\_m]]} H̃^{BM}\_1(K^p(N\_0))(1) → H^1(Y(N), V^\*\_k)(2).

*Needs:* §1.1; §1.3; CompletedCohomologyPartII CC.3 (completed homology and borel moore); CompletedCohomologyPartII CC.3 (duality between completed homology and completed cohomology); CompletedCohomologyPartII CC.6 (homological hyper)Tor-descent; ModularCurvesPartII R14.3 (parabolic duality); ModularCurvesPartII R14.3 (relative coefficient system).

NAK, Lemma 2.4, p. 22; Lemmas 2.9–2.11, pp. 28–30: Completed Borel–Moore homology is the dual of compactly supported completed cohomology; its completed tensor product with a compact O[[GL\_2(Z\_p)]]-module is homology with coefficients; with an algebraic representation W over E it recovers H^1(K^pK\_p, 𝒱\_W)(1), and with τ ⊗ W by Hochschild–Serre.

EM06, (4.3.7), p. 53: The compactly supported comparison H^1\_c(V\_W) ≅ Hom\_{gl\_2}(W̌, Ĥ^1\_{c,la}), dual to Nakamura’s Lemma 2.10.

### 2.7 Classical and p-adic quaternionic forms


In the setting of §1.6, let W be an irreducible algebraic representation of D\_p^× = ∏\_{v|p}GL\_2(F\_v) over E (a tensor product of Sym^{k\_v−2} ⊗ det^{w\_v} through the embeddings) and U\_p ⊂ K\_p open. (a) Hom\_{U\_p}(W^\*, C(X(U^p), E)) ≅ A\_{U\_p}(W) := {f: X(U^p) → W continuous with f(xu) = u^{-1}f(x)}, the space of p-adic automorphic forms of weight W and level U^pU\_p, by sending φ to the unique function f satisfying ℓ(f(x)) = φ(ℓ)(x) for every ℓ ∈ W*, with inverse f ↦ (ℓ ↦ (x ↦ ℓ(f(x)))); with central character ψ algebraic of the matching weight the same holds for S\_ψ, giving S\_{W,ψ}(U^pU\_p, E) ≅ Hom\_{U\_p}(W^\*, S\_ψ(U^p)\_E) Hecke-equivariantly. (b) For F = Q and a fixed ι: Q̄\_p ≅ C, A\_{K\_p}(W) ⊗\_{E,ι} C ≅ Hom\_{B̄^\*(R)}(W\_∞^\*, Aut(K^pK\_p)), where Aut(K^pK\_p) is the space of smooth functions on B̄^\*(Q)∖B̄^\*(A)/K^pK\_p and W\_∞ = W ⊗\_ι C viewed as a representation of B̄^\*(R). (c) Consequently Hom\_{K\_p}(W, C^0(X)) ⊗\_{E,ι} C ≅ ⊕\_π π\_f^{K^pK\_p}, the sum over automorphic representations π = π\_∞ ⊗ π\_f of B̄^\*(A) with π\_∞ ≅ W\_∞, and G-equivariantly C^0(X)\_{l.alg} ⊗\_{E,ι} C ≅ ⊕\_{W} ⊕\_{π\_∞ ≅ W\_∞} W\_∞ ⊗ π\_f^{K^p}; the infinite-dimensional π correspond by global Jacquet–Langlands to cuspidal representations of GL\_2(A) discrete series at the ramified places of B̄.

(b)–(c) are stated for F = Q, where DLB work; for general F the same holds with the archimedean comparison of HilbertModularVarietiesAndShimuraCurves R18.3 (definite jl), which is stated in Khare–Wintenberger’s even-degree, parallel-weight setting; R18.3/quaternion-weight likewise covers parallel weights W\_k = ⊗ Sym^{k−2}. Non-parallel weights ⊗\_v Sym^{k\_v−2} ⊗ det^{w\_v} and B̄ over Q ramified at a finite prime use the same constructions; use the general definite arithmetic adapter above for that extension. Sign and dual conventions: W versus W^\* follows DLB (their Lemme 4.7 is obtained from 4.5–4.6 by replacing W with W^\*). The last display of DLB Lemme 4.7 prints π\_f^{K\_p} where π\_f^{K^pK\_p} (in the K\_p-algebraic form) or π\_f^{K^p} (in the G-equivariant form) is meant; retain the tame level in both formulas.

A proof proceeds as follows.

1. (a): Hom\_{U\_p}(W^\*, C(X, E)) ≅ (W ⊗ C(X, E))^{U\_p} ≅ C(X, W)^{U\_p}, and U\_p-invariance of a W-valued function is f(xu) = u^{-1}f(x) (DLB Lemme 4.5); the central-character version is Pan’s isomorphism 3.2.10.
2. (b): send f ∈ A\_{K\_p}(W) to φ\_f(ℓ)(g) = ℓ(g\_∞^{-1}·(g\_p·f(g^∞) ⊗ 1)); DLB give the map f ↦ φ\_f explicitly and leave its bijectivity as a standard exercise: the inverse evaluates φ at adelic points with trivial archimedean component, and left B̄^\*(Q)-invariance on both sides matches because B̄^\*(Q) acts on W through B̄^\*(Q\_p) and on W\_∞ through B̄^\*(R) compatibly with ι (DLB Lemme 4.6, following Taylor §1).
3. (c): replace W by W^\* in (a)–(b) and decompose Aut(K^pK\_p) under B̄^\*(A) (DLB Lemme 4.7); Jacquet–Langlands is GL2AutomorphicRepresentationsAndTransfer R17.3 (global jl).

**Checks.**

- For W trivial and π a weight-two quaternionic automorphic representation, π\_f^{K^pK\_p} occurs in the K\_p-invariants of C^0(X)\_{l.alg} ⊗ C.
- Non-example: one-dimensional automorphic representations χ∘N\_{B̄/Q} of B̄^\*(A) occur in C^0(X) (constant functions on fibres of the norm) but have no Jacquet–Langlands partner; they are Eisenstein for the Hecke algebra.

*Needs:* §1.6; HilbertModularVarietiesAndShimuraCurves R18.3 (quaternion weight); HilbertModularVarietiesAndShimuraCurves R18.3 (definite jl); GL2AutomorphicRepresentationsAndTransfer R17.3 (global jl); GL2AutomorphicRepresentationsAndTransfer R17.3 (definite infinity).

DLB, Lemmes 4.5, 4.6, 4.7, pp. 21–22: p-adic automorphic forms of weight W are the K\_p-homomorphisms from W^\* into C^0(X); after ι they are classical automorphic forms of weight W\_∞; the K\_p-algebraic vectors decompose over automorphic representations with π\_∞ ≅ W\_∞.

PAN, 3.2.10, p. 22 (used in the proof of Theorem 3.5.5, pp. 29–30): For a definite quaternion algebra over a totally real field, S\_{(k,w),ψ}(U^pU\_p, E) ≅ Hom\_{U\_p}(W^\*\_{(k,w)}, S\_ψ(U^p)\_E), Hecke-equivariantly.

For the representative interfaces, allow any complete nontrivially normed field E, any space X with a group K acting by continuous translations, and a finite-dimensional Hausdorff topological E-representation W. Define `DefiniteQuaternion.weightedForms` by f(kx)=ρ(k)f(x). Define `DefiniteQuaternion.equivariantDualMaps` as the submodule of linear maps φ:W*→C(X,E) satisfying φ(ℓ∘ρ(k⁻¹))=translate(k)(φ(ℓ)). These match (a) after turning its right action into a left action by inversion. Prove the membership, evaluation and weight-change lemmas, and `weightedForms_equiv` by the pairing ℓ(f(x))=φ(ℓ)(x). Finite-dimensionality gives the continuity of the reconstructed W-valued function; an algebraic infinite-dimensional dual is not a substitute.

**Checks.**

- For the trivial one-dimensional weight, `weightedForms` is C(X,E)^K, not all of C(X,E). On a transitive two-point K-set only constant functions satisfy the condition.
- If k fixes x and its action on W has no fixed vector, f(x)=0. In a one-dimensional nontrivial scalar weight a nonzero constant function therefore fails the definition.
- For a scalar weight t, the dual action is t⁻¹. The equivariant map satisfies φ(ℓ∘ρ(k⁻¹))(kx)=φ(ℓ)(x); using ρ(k) instead gives a factor t² and fails for t²≠1.
- For X=K, the weighted function f(x)=ρ(x)w and φ(ℓ)(x)=ℓ(ρ(x)w) correspond. Evaluation at the identity recovers w; the zero map corresponds exactly to the zero form.

### 2.8 Type-specialised quaternionic modules


In the setting of §1.6, let σ be a continuous representation of K\_p on a finite free O-module σ° (a locally algebraic type: σ ⊗ E = ⊗\_{v|p} σ\_v with each σ\_v ≅ σ(λ\_v, τ\_v) or σ^{cr}(λ\_v, τ\_v), an algebraic representation of highest weight λ\_v tensored with a smooth K\_v-type attached to an inertial type τ\_v) on which (A\_F^∞)^× ∩ K\_p acts through ψ. Put S\_{ψ,σ}(U, A) = Hom\_{U\_p}(σ, S\_ψ(U^p, A)) and, for a maximal ideal m of the Hecke algebra, the type-specialised module M(σ°) = σ° ⊗\_{O[[K\_p]]} M\_ψ(U^p)\_m. Then (Schikhof duality and Frobenius reciprocity) M(σ°)^d ≅ Hom^cont\_{O[[K\_p]]}(σ°, M\_ψ(U^p)\_m^d) ≅ S\_{ψ,σ°}(U^pK\_p, O)\_m; when U^pK\_p is sufficiently small M(σ°) is finite free over O, its formation is exact in σ°, and M(σ°)[1/p] is dual to the space of classical quaternionic forms of weight and type σ. The Hecke algebra T^S\_{ψ,σ}(U^pK\_p) acting faithfully on S\_{ψ,σ}(U^pK\_p, O)\_m is a finite reduced O-algebra, a quotient of the big Hecke algebra of §3.7 and of the global deformation ring R^S\_ψ(σ) with local conditions σ at the places above p.

U^pK\_p sufficiently small (Pan Corollary 3.1.3), with compatible rational central character, for the exactness and freeness assertions. The proof through injectivity additionally retains ψ|N_{D/F}(U^p)=1 from §1.7(c); alternatively use the finite-coset decomposition directly. An incompatible central character can give a zero space and does not satisfy the stated nonzero rank formula. The identification of R^S\_ψ(σ) → T^S\_{ψ,σ} requires local–global compatibility at v | p at finite level (classical, through the Bernstein centre), recorded in §5.2 for the patched version.

Use the following named interfaces:

- `TauCeti.DefiniteQuaternionCompleted.typed` (constructor): S\_{ψ,σ}(U, A) = Hom\_{U\_p}(σ, S\_ψ(U^p, A)) for a K\_p-type σ with compatible central character.
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised` (constructor): M(σ°) = σ° ⊗\_{O[[K\_p]]} M\_ψ(U^p)\_m.
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_dual` (equivalence): M(σ°)^d ≅ S\_{ψ,σ°}(U^pK\_p, O)\_m, Hecke-equivariantly (Schikhof duality and Frobenius reciprocity).
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_exact` (functoriality): σ° ↦ M(σ°) is exact on finite free K\_p-types at sufficiently small tame level.
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_free` (characterisation): M(σ°) is finite free over O when U^pK\_p is sufficiently small.
- `TauCeti.DefiniteQuaternionCompleted.typeHeckeAlgebra` (data): T^S\_{ψ,σ}(U^pK\_p)\_m, finite reduced over O, the image of the Hecke algebra in End(S\_{ψ,σ°}(U^pK\_p, O)\_m), with the surjection from R^S\_ψ(σ).

**Checks.**

- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_trivial` (degenerate): For σ° = O with trivial action and ψ trivial on the central subgroup of K_p, M(σ°) = M\_ψ(U^p)\_m ⊗\_{O[[K\_p]]} O is the K\_p-coinvariants, dual to S\_ψ(U^pK\_p, O)\_m.
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_rank` (computation): At sufficiently small level, rank\_O M(σ°) = (number of double cosets in D^×∖(D ⊗ A\_F^∞)^×/U^pK\_p(A\_F^∞)^×) · rank\_O σ° before localisation, with the rational-centre and type-character compatibility of §1.6.
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_compatibility` (compatibility): For σ = W an algebraic representation, M(σ°)[1/p]^\* is the space S\_{W,ψ}(U^pK\_p, E) of §2.7(a).
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_not_patched` (non-example): M(σ°) is a finite O-module at a fixed tame level; it is not the patched module M\_∞(σ°) of Layer 5, which is finite over R\_∞(σ) but of positive relative dimension over O.

TUNG-2, Lemma 5.3.2: Condition (3), finiteness of R^S\_ψ(σ) and faithfulness of M(σ)[1/p], is equivalent to the full-support condition (1). GL2ModularityLifting R32.3 (typed component specialisation): The typed component argument identifies the nonzero fibre with the finite-level algebraic σ-space (input CC1). PAN, §4.4: Completed homology with auxiliary levels is specialised to types at Taylor–Wiles levels.

A proof proceeds as follows.

1. M(σ°)^d ≅ Hom^cont\_{O[[K\_p]]}(σ°, M^d) by Schikhof duality and ≅ Hom\_{G\_p}(c-Ind σ°, M^d) by Frobenius reciprocity (TUNG-2 §5.2.1, CEGGPS Lemma 4.14); M\_ψ(U^p)^d = S\_ψ(U^p), so M(σ°)^d = Hom\_{K\_p}(σ°, S\_ψ(U^p)) = S\_{ψ,σ°}(U^pK\_p, O).
2. Exactness and freeness: S\_ψ(U^p, E/O) is injective among smooth K\_p-modules with central character (§1.7(c)), so Hom\_{K\_p}(−, S\_ψ(U^p, E/O)) is exact; finite level is a finite sum of copies of σ°'s invariants under trivial stabilisers.
3. Classicality after inverting p is §2.7(a) applied to the algebraic part of σ together with the smooth type.
4. The Hecke algebra T^S\_{ψ,σ} is finite free over O and reduced since S\_{ψ,σ}(U, E) is semisimple for the Hecke action; it is a quotient of the completed Hecke algebra by restriction (§3.7).

**Checks.**

- For σ the trivial type and m non-Eisenstein, M(σ°)[1/p] is dual to the weight-two quaternionic forms of level U^pK\_p localised at m.
- CC1 (GL2ModularityLifting supplier contract): the faithful algebraic quaternionic module consumed by Tung’s Lemma 5.3.2(3) is M(σ°)[1/p] with its R^S\_ψ(σ)-action.

*Needs:* §1.6; §1.7; §2.7; HilbertModularVarietiesAndShimuraCurves R18.3 (quaternion weight); LocalGaloisDeformationRings R08.3 (hodge and galois types); CompletedCohomologyPartII CC.3 (coefficient module duality); mathlib:TensorProduct; mathlib:Module.Free.

TUNG-2, §4.1, definition of S\_{ψ,σ}(U, A), p. 18; §5.2.1–5.2.2, pp. 26–27; Lemma 5.3.2(3), p. 28: Type-specialised spaces S\_{ψ,σ}(U, A) = Hom\_{U\_p}(σ, S\_ψ(U^p, A)), the module σ° ⊗\_{O[[K\_p]]} M with its Hecke action via Schikhof duality and Frobenius reciprocity, and condition (3): R^S\_ψ(σ) finite over O with M(σ)[1/p] faithful.

CEGGPS, Lemma 4.14 and Remark 4.16, pp. 60–61: For the patched module, M\_∞(σ°) ≅ lim\_n Hom^cont\_{O[[K]]}(M\_∞, (σ°/ϖ^n)^∨)^∨, the type-specialised module, and its comparison with finite-level automorphic forms of type σ.

PAN, Corollary 3.1.3, p. 18: At sufficiently small level the functor of quaternionic forms with coefficients is exact.

### Examples

At weight two the algebraic factor is trivial and the comparison recovers classical H¹. In weight three it is the dual of the standard two-dimensional representation; replacing it by the standard representation changes a scalar t to t⁻¹. At p=5 the level-11 form has polynomial X²−X+5 as computed below. In characteristic p, the upper bound on global Serre weights is weaker than a full weight-part converse, and the r=p−1 overlap must be removed to apply the good-weight multiplicity formula.

### Dependencies

Layer 1 gives the localised injectivity and vanishing needed for descent. CompletedCohomologyPartII CC.3, CC.6–CC.7 supplies duality and coefficient comparisons; ModularCurvesPartII R14.1, R14.3–R14.4 supplies correspondences, coefficient local systems and the precise Ihara/multiplicity-one input. AutomorphicGaloisRepresentations R19.1, R19.4–R19.6 supplies classical Galois factors and small-weight reduction; AlgebraicModularFormsAndSerreWeights R15.4 and PadicLocalLanglandsForGL2Qp R30.3 supply the local weight conventions. HilbertModularVarietiesAndShimuraCurves R18.3 and GL2AutomorphicRepresentationsAndTransfer R17.3 supply the weighted quaternionic comparison.

## Layer 3: hecke and deformation actions


The completed Hecke algebra of the modular tower is CompletedCohomologyPartII CC.8's inverse limit of finite Hecke images, identified here with Emerton's T(K^p) and localised at an allowable ρ̄ to the complete local noetherian T\_{ρ̄,Σ}. The Galois determinant over T(K^p) is the limit of the finite-level geometric determinants of AutomorphicGaloisRepresentations R19.6, and for absolutely irreducible ρ̄ it comes from a representation ρ^m\_Σ (Carayol). The universal deformation ring surjects onto T\_{ρ̄,Σ}; Eichler–Shimura in families factors the Galois action out of completed cohomology, Ĥ¹\_{O,ρ̄,Σ} ≅ ρ^m\_Σ ⊗ U\_Σ; crystalline classical points are Zariski dense. The commuting action of G on everything is T\_{ρ̄,Σ}-linear and ϖ-adically admissible. For the definite quaternion algebra the big Hecke algebra T\_ψ(U^p) carries only a pseudo-representation in general, and in Pan's residually reducible setting the pseudo-deformation ring surjects onto its Eisenstein localisation; pro-modular primes are those containing the kernel.
### 3.1 Completed Hecke algebra of the modular tower


Fix a tame level K^p and let T(K\_pK^p) be the O-subalgebra of End\_{G\_Q}(H^1(K\_pK^p)\_E) generated by T\_ℓ, S\_ℓ for ℓ ≠ p unramified in K^p; for K\_p′ ⊂ K\_p restriction gives surjections T(K\_p′K^p) → T(K\_pK^p). Put T(K^p) = lim\_{K\_p} T(K\_pK^p) with the projective-limit topology (each T(K\_pK^p) with its ϖ-adic topology). It is the modular-tower instance of CompletedCohomologyPartII CC.8 (completed hecke algebra) (the inverse limit of the finite Hecke images, through CC.8’s derived-to-cohomological residual comparison), and: it is topologically generated by T\_ℓ, S\_ℓ; it acts faithfully on Ĥ^1(K^p)\_O and Ĥ^1(K^p)\_E; it is reduced, commutative, compact, and the product of finitely many complete local O-algebras T(K^p)\_m, in bijection with the Galois-conjugacy classes of mod-ϖ eigensystems of modular forms of tame level K^p, its topology being the product of the m-adic topologies; for K^{p′} ⊂ K^p there is a continuous map T(K^{p′}) → T(K^p) compatible with the closed embedding Ĥ^1(K^p)\_E → Ĥ^1(K^{p′})\_E. For ρ̄: G\_Q → GL\_2(k) absolutely irreducible, modular and unramified outside Σ = Σ\_0 ∪ {p}, a compact open K\_{Σ\_0} ⊂ G\_{Σ\_0} is allowable if T(K\_{Σ\_0}) = T(K\_{Σ\_0}K\_0^Σ) has a maximal ideal m with residue field k and T\_ℓ ≡ tr ρ̄(Frob\_ℓ), ℓS\_ℓ ≡ det ρ̄(Frob\_ℓ) mod m (ℓ ∉ Σ); T(K\_{Σ\_0})\_ρ̄ = T(K\_{Σ\_0})\_m is a direct factor; for allowable K′ ⊂ K the map T(K′)\_ρ̄ → T(K)\_ρ̄ is a surjection of complete local noetherian O-algebras, an isomorphism for K sufficiently small; and T\_{ρ̄,Σ} = lim\_{K\_{Σ\_0}} T(K\_{Σ\_0})\_ρ̄ is a complete local noetherian O-algebra with residue field k, topologically generated by the T\_ℓ.

The full G-action belongs to the p-level tower, not to an individual finite-level H¹. The Hecke algebra is generated by the operators at primes ℓ ≠ p unramified in K^p; U\_ℓ at bad primes is adjoined only where a statement says so (Emerton’s T(K\_{Σ\_0})^\*\_ρ̄ in the proof of Theorem 6.2.4). Emerton states that any sufficiently small K\_{Σ\_0} is allowable for modular ρ̄; with ρ̄ assumed modular this uses only that ρ̄ arises at some level divisible by primes in Σ, which for p > 2 is the weak-to-strong Serre theorem (EM11 Remark 5.2.3); the dependence on Serre’s conjecture enters only if ‘modular’ is replaced by ‘odd’.

Use the following named interfaces:

- `TauCeti.ModularCompletedCohomology.heckeAlgebra` (constructor): T(K^p) = lim\_{K\_p} T(K\_pK^p) as the CC.8 compatible-sections ring of the finite Hecke images.
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_faithful` (characterisation): T(K^p) acts faithfully on Ĥ^1(K^p)\_O and Ĥ^1(K^p)\_E.
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_productLocal` (structure): T(K^p) ≅ ∏\_m T(K^p)\_m over its finitely many maximal ideals, each factor complete local; T(K^p) is reduced and compact.
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_dense` (characterisation): The O-subalgebra generated by the T\_ℓ, S\_ℓ is dense in T(K^p).
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_tameMap` (functoriality): For K^{p′} ⊂ K^p, a continuous map T(K^{p′}) → T(K^p) sending T\_ℓ, S\_ℓ to T\_ℓ, S\_ℓ and compatible with the closed embedding of Ĥ^1(K^p)\_E.
- `TauCeti.ModularCompletedCohomology.IsAllowableLevel` (other): A level K\_{Σ\_0} is allowable for ρ̄ if T(K\_{Σ\_0}) has a maximal ideal with residue field k matching tr ρ̄ and det ρ̄ at Frob\_ℓ, ℓ ∉ Σ.
- `TauCeti.ModularCompletedCohomology.residualHeckeAlgebra` (constructor): T\_{ρ̄,Σ} = lim over allowable K\_{Σ\_0} of T(K\_{Σ\_0})\_ρ̄.
- `TauCeti.ModularCompletedCohomology.residualHeckeAlgebra_localNoetherian` (instance): T\_{ρ̄,Σ} is a complete local noetherian O-algebra with residue field k.
- `TauCeti.ModularCompletedCohomology.residualHeckeAlgebra_eventuallyConst` (relation): For allowable K′ ⊂ K, T(K′)\_ρ̄ → T(K)\_ρ̄ is surjective, and an isomorphism once K is contained in the congruence subgroup of level N\_{Σ\_0}.

**Checks.**

- `TauCeti.ModularCompletedCohomology.heckeAlgebra_weightTwo` (computation): At tame level K\_0(11)^p with p = 3 and m the non-Eisenstein ideal of the newform of level 11, the image of T(K^p)\_m in End(H^1(Y\_0(11)(C), Z\_3)\_m) is Z\_3 with T\_ℓ ↦ a\_ℓ(f).
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_compatibility` (compatibility): T(K^p) is the CompletedCohomologyPartII CC.8 (completed hecke algebra) of the modular tower at tame level K^p, as topological rings.
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_noMaximal_degenerate` (degenerate): If ρ̄ does not occur at any level K\_{Σ\_0}, no level is allowable and the limit defining T\_{ρ̄,Σ} is over the empty system; Emerton’s definition presupposes ρ̄ modular.
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_not_finite` (non-example): T\_{ρ̄,Σ} is not finite over O: classical points of infinitely many distinct weights occur in Spec T\_{ρ̄,Σ}[1/p] and are Zariski dense (§3.6), so T\_{ρ̄,Σ}[1/p] has infinitely many maximal ideals, unlike each finite-level T(K\_pK\_{Σ\_0})\_ρ̄.

EM11, §5.2–5.3 and §6: T\_{ρ̄,Σ} is the coefficient ring of ρ^m\_Σ, π^m\_Σ and the multiplicity module X(θ). LocallyAnalyticCompletedCohomology LA.5 and LA.12: Pan’s big Hecke algebra T(K^p) with its Galois determinant. NAK, §2.1.2: Nakamura’s zeta morphisms are T\_{ρ̄,Σ}-linear. GL2ModularityLifting R32.4 (through R31.3): Pan’s completed Hecke quotient (input CC2).

A proof proceeds as follows.

1. Identify Emerton’s T(K^p) with CC.8’s completed Hecke algebra for the modular tower at tame level K^p: CC.8 forms the inverse limit of finite derived images on CC.4 perfect complexes; CompletedCohomologyPartII CC.8 (derived cohomological residual comparison) shows the derived and cohomological images have the same residual labels and differ by a nilpotent kernel, and in degree one for the modular tower the cohomology image is Emerton’s T(K\_pK^p) (EM11 Definition 5.2.1, footnote 12 for the weak-closure description).
2. Semilocality and the product decomposition are CompletedCohomologyPartII CC.8 (completed semilocal product), which gives the finite-image inverse-limit topology; that this is the product of the m-adic topologies follows because each T(K^p)\_m is noetherian — a quotient of a universal deformation ring (absolutely irreducible residual case, §3.3) or of a pseudo-deformation ring (in general) — and a compact noetherian local ring with this profinite topology carries its m-adic topology. Reducedness: each T(K\_pK^p) is generated by operators that are normal for the Petersson product on H^1(K\_pK^p)\_C (ModularCurvesPartII R14.3 (hecke twisted self adjoint), R14.3/cup-product-petersson), so it acts semisimply on H^1(K\_pK^p)\_E; its integral version is ModularCurvesPartII R14.2 (integral hecke algebra).
3. Lemma 5.2.4 of EM11: surjectivity because the image is closed and contains the topological generators T\_ℓ; eventual isomorphism because the prime-to-p conductor of every modular lift of ρ̄ unramified outside Σ divides a fixed N\_{Σ\_0} (Carayol, Livné), so both algebras are the same quotient of R\_{ρ̄,Σ} (see §3.3).
4. T\_{ρ̄,Σ} is complete local noetherian since the transition maps are surjective and eventually isomorphisms (EM11 Definition 5.2.5).

**Checks.**

- For K^p = K\_1(N)^p and m attached to a residually irreducible newform of level N and weight 2, T(K^p)\_m surjects onto the weight-two Hecke algebra T(K\_1(N))\_m acting on H^1(Y\_1(N), O)\_m.
- For ρ̄ the mod 3 representation of the newform of level 11, the level K\_0(11) away from {3, 11} is allowable.

*Needs:* CompletedCohomologyPartII CC.8 (completed hecke algebra); CompletedCohomologyPartII CC.8 (completed semilocal product); CompletedCohomologyPartII CC.8 (residual hecke projector); CompletedCohomologyPartII CC.8 (derived cohomological residual comparison); §1.1; §1.2; ModularCurvesPartII R14.2 (integral hecke algebra); ModularCurvesPartII R14.3 (hecke twisted self adjoint); ModularCurvesPartII R14.3 (cup product petersson); IntegralHeckeAndGaloisDeterminants IHG.2 (finite hecke local factors); IntegralHeckeAndGaloisDeterminants IHG.1 (universal reductive pseudocharacter ring); mathlib:RingCat.sectionsSubring; mathlib:IsLocalRing; mathlib:IsNoetherianRing.

EM11, §5.2, Definition 5.2.1 and footnote 12, p. 46; Definitions 5.2.2, 5.2.5, Remark 5.2.3, Lemma 5.2.4, pp. 47–48: The completed Hecke algebra T(K^p) and its properties (faithful, reduced, compact, a finite product of complete local algebras); allowable levels for ρ̄, the local factors T(K\_{Σ\_0})\_ρ̄ and their limit T\_{ρ̄,Σ}, a complete local noetherian O-algebra.

NAK, §2.1.2, pp. 16–17: Nakamura’s T(K\_{Σ\_0}), allowable levels and T\_{ρ̄,Σ}, as consumed by the zeta morphisms.

PAN, Proposition 3.3.6 and Corollary 3.3.7, p. 24: For a pro-p level the completed Hecke algebra has the same maximal ideals as the finite-level one (Gee–Newton Lemma 2.1.14), hence is semilocal and a product of its localisations.

### 3.2 Hecke-valued Galois determinant and representation


(a) For every tame level K^p there is a unique continuous two-dimensional determinant D\_{K^p}: O[G\_{Q,Σ(K^p)}] → T(K^p) (in the sense of Chenevier) with characteristic polynomial X^2 − T\_ℓX + ℓS\_ℓ at Frob\_ℓ for ℓ ∉ Σ(K^p) (geometric Frobenius), compatible with T(K^{p′}) → T(K^p); its specialisation at λ: T(K^p) → Q̄\_p is the determinant of a semisimple odd ρ\_λ: G\_{Q,Σ} → GL\_2(Q̄\_p) with det ρ\_λ(Frob\_ℓ) = ℓλ(S\_ℓ) and tr ρ\_λ(Frob\_ℓ) = λ(T\_ℓ). (b) If ρ̄ is absolutely irreducible and K\_{Σ\_0} is allowable, there is a unique deformation ρ(K\_{Σ\_0}): G\_Q → GL\_2(T(K\_{Σ\_0})\_ρ̄) of ρ̄, unramified outside Σ, with tr ρ(K\_{Σ\_0})(Frob\_ℓ) = T\_ℓ and det ρ(K\_{Σ\_0})(Frob\_ℓ) = ℓS\_ℓ; passing to the limit gives ρ^m\_Σ: G\_Q → GL\_2(T\_{ρ̄,Σ}), which equals ρ(K\_{Σ\_0}) for K\_{Σ\_0} small. For 𝔭 ∈ Spec T\_{ρ̄,Σ}, ρ(𝔭)° = ρ^m\_Σ/𝔭ρ^m\_Σ is a G\_Q-stable lattice, free of rank two over T\_{ρ̄,Σ}/𝔭, and ρ(𝔭) = κ(𝔭) ⊗ ρ^m\_Σ. (c) The analogous objects exist for the definite quaternionic Hecke algebra (§3.7): a pseudo-representation T\_ψ: G\_{F,S} → T\_ψ(U^p) with determinant ψε^{-1}, and for absolutely irreducible residual trace a lifting of that same pseudo-representation with the same determinant ψε^{-1}. Separately, in Tung’s convention a central character ψ\_T gives a Hecke representation with determinant ψ\_T ε. These conventions are kept separate until a duality and Hecke/reciprocity dictionary is supplied; merely changing Frobenius does not identify the two representations.

Absolute irreducibility of ρ̄ is required in (b) and in the lifting of (c); for residually reducible ρ̄ only the determinant (pseudo-representation) exists over T, and §3.8 treats it. At modular classical points, V\_f is the geometric/cohomological representation of R19.6, so the geometric Frobenius polynomial is X^2 − a\_ℓX + χ(ℓ)ℓ^{k−1}. Its dual gives R19’s arithmetic representation. In this convention the determinant is ℓS_ℓ, as also fixed by the residual condition of EM11 Definition 5.2.2 and Nakamura §2.1.2, p. 17. For quaternionic representations distinguish Pan’s determinant ψε^{-1} from Tung’s determinant ψ\_T ε, including the Colmez twist of Pan Remark 3.5.3.

Use the following named interfaces:

- `TauCeti.ModularCompletedCohomology.heckeDeterminant` (constructor): The continuous two-dimensional determinant D\_{K^p} on O[G\_{Q,Σ(K^p)}] valued in T(K^p).
- `TauCeti.ModularCompletedCohomology.heckeDeterminant_charpoly` (simp): The characteristic polynomial of D\_{K^p} at Frob\_ℓ is X^2 − T\_ℓX + ℓS\_ℓ for ℓ ∉ Σ(K^p).
- `TauCeti.ModularCompletedCohomology.heckeDeterminant_tame` (functoriality): D\_{K^{p′}} pushed along T(K^{p′}) → T(K^p) is D\_{K^p} restricted to G\_{Q,Σ(K^p)}.
- `TauCeti.ModularCompletedCohomology.heckeRepresentation` (constructor): ρ^m\_Σ: G\_Q → GL\_2(T\_{ρ̄,Σ}) for absolutely irreducible ρ̄, unique up to conjugation.
- `TauCeti.ModularCompletedCohomology.heckeRepresentation_trace` (simp): tr ρ^m\_Σ(Frob\_ℓ) = T\_ℓ and det ρ^m\_Σ(Frob\_ℓ) = ℓS\_ℓ for ℓ ∉ Σ.
- `TauCeti.ModularCompletedCohomology.heckeRepresentation_reduction` (compatibility): ρ^m\_Σ mod m\_{T} ≅ ρ̄.
- `TauCeti.ModularCompletedCohomology.specialisation` (constructor): ρ(𝔭)° = ρ^m\_Σ/𝔭 and ρ(𝔭) = κ(𝔭) ⊗ ρ^m\_Σ for 𝔭 ∈ Spec T\_{ρ̄,Σ}.
- `TauCeti.ModularCompletedCohomology.specialisation_classical` (compatibility): At a classical point attached to a newform f, ρ(𝔭) ≅ V\_f.

**Checks.**

- `TauCeti.ModularCompletedCohomology.heckeRepresentation_det` (computation): At a weight-two point f with nebentypus χ, det V\_f(Frob\_ℓ) = ℓχ(ℓ), and in weight k it is χ(ℓ)ℓ^{k−1}. Thus neither the missing factor ℓ nor a weight-independent cyclotomic-times-finite-order formula for the universal determinant passes specialisation.
- `TauCeti.ModularCompletedCohomology.heckeRepresentation_compatibility` (compatibility): Composing ρ^m\_Σ with T\_{ρ̄,Σ} → T(K\_pK\_{Σ\_0})\_ρ̄ gives Carayol’s finite-level representation (R19.6/hecke-algebra-representation-classical in weight two).
- `TauCeti.ModularCompletedCohomology.heckeDeterminant_degenerate` (degenerate): On the trivial tame level component where T(K^p) = 0 (no eigensystems) the determinant is the zero-ring determinant.
- `TauCeti.ModularCompletedCohomology.heckeRepresentation_reducible_nonexample` (non-example): For a residually reducible maximal ideal the trace D(Frob\_ℓ) = T\_ℓ need not come from a representation over T\_m; requiring one would exclude Pan’s Eisenstein case.

EM11, §6.1: ρ^m\_Σ|G\_{Q\_p} determines the deformation π^m\_Σ of π̄ through Kisin’s equivalence, and ρ^m\_Σ|G\_{Q\_ℓ} the family π\_{Σ\_0}(ρ^m\_Σ). EM11, Proposition 5.5.3: Ĥ^1\_{O,ρ̄,Σ} ≅ ρ^m\_Σ ⊗ U\_Σ. LocallyAnalyticCompletedCohomology LA.5 and LA.12: The determinant D\_S over T(K^p) and the representations ρ\_λ at its points. GL2ModularityLifting R32.3 (through R31.3): Tung’s Hecke-valued representation with determinant ψ\_T ε (input CC2), kept separate from Pan’s ψε^{-1} normalisation.

A proof proceeds as follows.

1. (a): at each finite level T(K\_pK^p) acts on H^1 and the geometric Hecke determinant of AutomorphicGaloisRepresentations R19.6 (geometric hecke determinant) gives a determinant over T(K\_pK^p) with the stated characteristic polynomials; these are compatible under restriction, so they define a determinant on the inverse limit by IntegralHeckeAndGaloisDeterminants IHG.0 (continuous determinant) (a determinant is determined by its values on a dense set of Frobenii, IHG.0/continuous-determinant-dense).
2. Specialisation: a determinant over a field is the determinant of a unique semisimple representation (IHG.1/algebraically-closed-reconstruction); oddness from the classical points (EM-PAMQ Proposition 7.3.17).
3. (b): over the local ring T(K\_pK\_{Σ\_0})\_ρ̄ with absolutely irreducible residual determinant, the determinant comes from a unique representation (Carayol; IHG.1/henselian-irreducible and GlobalGaloisDeformations R04.2 (carayol trace theorem)); pass to the limit (EM11 discussion before Lemma 5.2.4 and Definition 5.2.7; AutomorphicGaloisRepresentations R19.6 (determinants and representability over a hecke algebra)).
4. (c): Pan 3.3.5 constructs a pseudo-representation with determinant ψε^{-1}. The irreducible-residual reconstruction of IHG.1 gives a representation with that same determinant. Tung-2 Proposition 4.2.5 separately constructs the ψ\_T ε-normalised representation. Their actions cannot be identified without a character, dual and Hecke-operator dictionary; prove `panTungGaloisNormalization` before transporting either action.

**Checks.**

- At a classical point 𝔭 attached to a newform f, ρ(𝔭) ≅ V\_f in the normalisation of §2.5.
- Non-example: for ρ̄ = 1 ⊕ ε̄ there is no GL\_2(T\_m)-valued representation with the given traces in general; only the determinant exists.

*Needs:* §3.1; AutomorphicGaloisRepresentations R19.6 (geometric hecke determinant); AutomorphicGaloisRepresentations R19.6 (determinants and representability over a hecke algebra); AutomorphicGaloisRepresentations R19.6 (hecke algebra representation quaternionic); IntegralHeckeAndGaloisDeterminants IHG.0 (continuous determinant); IntegralHeckeAndGaloisDeterminants IHG.0 (continuous determinant dense); IntegralHeckeAndGaloisDeterminants IHG.1 (henselian irreducible); IntegralHeckeAndGaloisDeterminants IHG.1 (algebraically closed reconstruction); GlobalGaloisDeformations R04.2 (carayol trace theorem); mathlib:Matrix.GeneralLinearGroup; mathlib:Field.absoluteGaloisGroup.

EM11, §5.2 before Lemma 5.2.4, p. 47; Definitions 5.2.7 and 5.2.9, pp. 48–49: Construction of the deformation ρ(K\_{Σ\_0}) of ρ̄ over T(K\_{Σ\_0})\_ρ̄ as a limit of Carayol’s finite-level deformations, the representation ρ^m\_Σ over T\_{ρ̄,Σ}, and the specialisations ρ(𝔭)°, ρ(𝔭).

PAN, 3.3.5, p. 24: A two-dimensional pseudo-representation of G\_{F,S} valued in the definite quaternionic big Hecke algebra, with determinant ψε^{-1}.

TUNG-2, Lemma 4.2.4 and Proposition 4.2.5, pp. 19–20: Semilocality of the quaternionic big Hecke algebra and the lifting ρ\_m to GL\_2(T^S\_ψ(U^p)\_m) for non-Eisenstein m, of the prescribed type with determinant ψε.

DLB, Définition 5.2 and §5.1 after Définition 5.3, pp. 25–26: Representations associated with a Hecke morphism, modular residual representations, and r^m = lim r^m(K\_p) over the localised quaternionic Hecke algebra A by Carayol’s theorem.

CDN, Before Proposition 4.12, p. 51: ρ̄ deforms to ρ\_m over T(U^p)\_m with characteristic polynomial X^2 − T\_vX + N(v)S\_v at Frob\_v (Scholze, Proposition 5.7).

### 3.3 The deformation-to-Hecke surjection


(a) Let ρ̄ be absolutely irreducible and modular, unramified outside Σ, and R\_{ρ̄,Σ} the universal deformation ring of ρ̄ for deformations unramified outside Σ (and ∞). There is a unique local surjection φ\_Σ: R\_{ρ̄,Σ} → T\_{ρ̄,Σ} with φ\_Σ(tr ρ^u(Frob\_ℓ)) = T\_ℓ and φ\_Σ(ℓ^{-1} det ρ^u(Frob\_ℓ)) = S\_ℓ for ℓ ∉ Σ; it is the limit of compatible surjections φ(K\_{Σ\_0}): R\_{ρ̄,Σ} → T(K\_{Σ\_0})\_ρ̄, and ρ^m\_Σ is the pushforward of ρ^u. (b) For a residual pseudo-representation t̄ = 1 + χ̄ of G\_{F,S} (F totally real, Pan §4.1) let R^{ps} be the universal two-dimensional pseudo-deformation ring of t̄ with determinant χ; the pseudo-representation T\_m of §3.2(c) induces a surjection R^{ps} → T\_m, which factors through the quotient R^{ps,{ξ\_v}} imposing T\_m|\_{I\_{F\_v}} = ξ\_v + ξ\_v^{-1} at v ∈ S∖Σ\_p.

R\_{ρ̄,Σ} parametrises deformations over complete local noetherian O-algebras with residue field k; it exists since ρ̄ is absolutely irreducible. In (b) the factorisation through R^{ps,{ξ\_v}} uses classical local–global compatibility at v ∉ Σ\_p at finite levels, after twisting to a finite-order central character.

A proof proceeds as follows.

1. (a): the deformation ρ(K\_{Σ\_0}) induces φ(K\_{Σ\_0}) by universality (GlobalGaloisDeformations R04.2 (universal deformation ring)); its image is closed and contains the T\_ℓ, and also the S\_ℓ, so it is surjective; the R\_{ρ̄,Σ}-images are compatible (EM11 diagram (5.2.6)); take the limit.
2. (b): universality of R^{ps} (IntegralHeckeAndGaloisDeterminants IHG.1 (universal reductive pseudocharacter ring) for GL\_2) gives R^{ps} → T\_m; it is surjective because T\_m is topologically generated by the T\_v, v ∉ S (Pan 4.1.3).
3. The factorisation through R^{ps,{ξ\_v}} is classical local–global compatibility at v ∈ S∖Σ\_p for quaternionic forms at finite level (AutomorphicGaloisRepresentations R19.4 (all hilbert local global compatibility)), passed to the limit, after twisting ψ to finite order (Pan 4.1.3, referring to 3.3.3).

**Checks.**

- Under Böckle’s hypotheses φ\_Σ is an isomorphism (§6.2).
- At a classical point 𝔭 of T\_{ρ̄,Σ} the composite R\_{ρ̄,Σ} → κ(𝔭) classifies ρ(𝔭).

*Needs:* §3.2; §3.1; GlobalGaloisDeformations R04.2 (universal deformation ring); GlobalGaloisDeformations R04.2 (universal continuous lift); IntegralHeckeAndGaloisDeterminants IHG.1 (universal reductive pseudocharacter ring); AutomorphicGaloisRepresentations R19.4 (all hilbert local global compatibility).

EM11, §5.2 after Remark 5.2.3, p. 47; (5.2.6) and the paragraph after Definition 5.2.5, p. 48: The universal deformation ring R\_{ρ̄,Σ} is topologically generated by traces of Frobenius; φ(K\_{Σ\_0}) is surjective; passing to the limit gives φ\_Σ: R\_{ρ̄,Σ} → T\_{ρ̄,Σ}.

NAK, §2.1.2, p. 17: Nakamura records the surjection φ\_Σ: R\_{ρ̄,Σ} → T\_{ρ̄,Σ}.

PAN, 4.1.3, p. 38: The natural pseudo-representation over T\_m with determinant χ, the universal pseudo-deformation ring R^{ps}, the surjection R^{ps} → T\_m and its factorisation through R^{ps,{ξ\_v}} by classical local–global compatibility at v ∈ S∖Σ\_p.

### 3.4 The ρ̄-part of completed cohomology and its commuting actions


Let ρ̄ be absolutely irreducible and modular and, for A ∈ {O, E} and allowable K\_{Σ\_0}, Ĥ^1(K\_{Σ\_0})\_{A,ρ̄} = T(K\_{Σ\_0})\_ρ̄ ⊗\_{T(K\_{Σ\_0})} Ĥ^1(K\_{Σ\_0})\_A (a direct summand, equal to the m-adic completion for A = O) and Ĥ^1\_{A,ρ̄,Σ} = colim\_{K\_{Σ\_0}} Ĥ^1(K\_{Σ\_0})\_{A,ρ̄}, a G\_Q × G × G\_{Σ\_0}-stable direct summand of Ĥ^1\_{A,Σ} on which these actions are T\_{ρ̄,Σ}-linear and commute. Then: (a) Ĥ^1(K\_{Σ\_0})\_{O,ρ̄}/ϖ^s ≅ H^1(K\_{Σ\_0})\_{O/ϖ^s,ρ̄} and Ĥ^1\_{O,ρ̄,Σ}/ϖ^s ≅ H^1\_{O/ϖ^s,ρ̄,Σ}; (b) Ĥ^1(K\_{Σ\_0})\_{O,ρ̄} is a ϖ-adically admissible G-representation over T\_{ρ̄,Σ} (every element of Ĥ^1\_{O,ρ̄,Σ}/ϖ^i is killed by a power of the maximal ideal); (c) Ĥ^1(K\_{Σ\_0})\_{A,ρ̄} ≅ (Ĥ^1\_{A,ρ̄,Σ})^{K\_{Σ\_0}}, and for K\_p compact open with K\_pK\_{Σ\_0}K\_0^Σ neat (or ρ̄ not induced from Q(√−1), Q(√−3)), H^1(K\_pK\_{Σ\_0}K\_0^Σ)\_{A,ρ̄} ≅ (Ĥ^1(K\_{Σ\_0})\_{A,ρ̄})^{K\_p}; (d) H^1\_{O/ϖ^s,ρ̄,Σ} is an admissible smooth G × G\_{Σ\_0}-representation over O/ϖ^s; (e) (Ĥ^1\_{E,ρ̄,Σ})^{K\_p} is finitely generated over E[G\_{Σ\_0}] and (H^1\_{k,ρ̄,Σ})^{K\_p} over k[G\_{Σ\_0}].

ρ̄ absolutely irreducible and modular; Σ ∋ p contains the primes where ρ̄ ramifies. (e) uses that the prime-to-p conductors of modular lifts unramified outside Σ are bounded (Carayol, Livné) and that the p-part of the conductor is bounded by K\_p.

A proof proceeds as follows.

1. The ρ̄-part is the residual summand of CompletedCohomologyPartII CC.8 (completed residual localisation) at the label m, identified with Emerton’s T(K\_{Σ\_0})\_ρ̄ ⊗ (−) by §3.1; localisation commutes with the limits (CC.8/localisation-limit-support-dual-compatibility), giving (a) from (5.1.2) (EM11 (5.3.3)–(5.3.4)).
2. (b): a direct summand of a ϖ-adically admissible representation is admissible, and the m-power torsion statement follows from (a) (EM11 Lemma 5.3.5).
3. (c): rational part from EM06 Proposition 2.2.13 and (4.3.4) (EM11 Lemma 5.3.6); integral part is §1.4(b) (EM11 Lemma 5.3.8, Remark 5.3.10).
4. (d) from (c) and finiteness at fixed level (EM11 Proposition 5.3.11); (e) from boundedness of conductors, finiteness of classical lifts of bounded conductor in weight two, and §2.1 (EM11 Proposition 5.3.13, Corollary 5.3.14).

**Checks.**

- The G\_Q × G × G\_{Σ\_0}-actions on Ĥ^1\_{O,ρ̄,Σ} commute with each other and with T\_{ρ̄,Σ}.
- For K\_p = GL\_2(Z\_p), (c) recovers H^1(GL\_2(Z\_p)K\_{Σ\_0}K\_0^Σ)\_{O,ρ̄}, the weight-two level-prime-to-p cohomology localised at ρ̄.

*Needs:* §3.1; §1.4; §2.1; CompletedCohomologyPartII CC.8 (completed residual localisation); CompletedCohomologyPartII CC.8 (localisation limit support dual compatibility); mathlib:Module.Finite.

EM11, Definitions 5.3.1–5.3.2 and (5.3.3)–(5.3.4), p. 49; Lemmas 5.3.5–5.3.6, pp. 49–50; Proposition 5.3.11, Proposition 5.3.13, Corollary 5.3.14, pp. 51–52: The ρ̄-part of completed cohomology at allowable levels and in the limit, its reduction mod ϖ^s, ϖ-adic admissibility over T\_{ρ̄,Σ}, recovery of finite levels as invariants, admissibility of the torsion objects, and finite generation over the group ring of G\_{Σ\_0}.

### 3.5 Galois factorisation of completed cohomology


Let ρ̄ be absolutely irreducible and modular, U\_Σ = Hom\_{T\_{ρ̄,Σ}[G\_Q]}(ρ^m\_Σ, Ĥ^1\_{O,ρ̄,Σ}) with its G × G\_{Σ\_0}-action. (a) The evaluation map ρ^m\_Σ ⊗\_{T\_{ρ̄,Σ}} U\_Σ → Ĥ^1\_{O,ρ̄,Σ} is a T\_{ρ̄,Σ}[G\_Q × G × G\_{Σ\_0}]-linear isomorphism, and reducing mod ϖ and taking m-torsion gives ρ̄ ⊗\_k (U\_Σ/ϖ)[m] ≅ H^1\_{k,ρ̄,Σ}[m]. (b) (Eichler–Shimura in families) Let ρ: G\_Q → GL\_2(E) be continuous, absolutely irreducible, unramified outside Σ, K\_{Σ\_0} ⊂ G\_{Σ\_0} compact open and 𝔭 the ideal of T(K\_{Σ\_0})[1/p] generated by T\_ℓ − tr ρ(Frob\_ℓ), ℓ ∉ Σ. Then Hom\_{E[G\_Q]}(ρ, Ĥ^1(K\_{Σ\_0})\_E[𝔭]) = Hom\_{E[G\_Q]}(ρ, Ĥ^1(K\_{Σ\_0})\_E); in particular if Hom\_{E[G\_Q]}(ρ, Ĥ^1\_{E,Σ}) ≠ 0 then ρ is promodular, and for every closed point 𝔭 ∈ Spec T\_{ρ̄,Σ}[1/p] the inclusions Hom(ρ(𝔭), Ĥ^1\_{E,ρ̄,Σ}[𝔭]) ⊂ Hom(ρ(𝔭), Ĥ^1\_{E,ρ̄,Σ}) ⊂ Hom(ρ(𝔭), Ĥ^1\_{E,Σ}) are equalities. (c) In Pan’s formulation: for λ: T(K^p) → Q̄\_p with ρ\_λ irreducible, Ĥ^1(K^p, Q̄\_p)[𝔭\_λ] ≅ ρ\_λ(−1) ⊗ Hom\_{G\_Q}(ρ\_λ(−1), Ĥ^1(K^p, Q̄\_p)), where the twist matches Pan’s normalisation of the determinant.

(a) needs ρ̄ absolutely irreducible; (b) needs ρ absolutely irreducible but no residual hypothesis. The twist (−1) in (c) is the conversion between Emerton’s and Pan’s normalisations of the Galois action on H^1 (Pan II §7.1.4); no new statement is made.

A proof proceeds as follows.

1. (a): the invariants of both sides at an allowable K\_{Σ\_0} are the finite-level spaces (§3.4(c)); after inverting p the map has dense image because at classical points the locally algebraic vectors are sums of copies of ρ(𝔭) (§2.1) and these are dense (§2.2); both sides are admissible, so the image is closed (Schneider–Teitelbaum), hence surjective; injectivity mod ϖ on m-torsion holds since ρ̄ ⊗ Hom(ρ̄, −) → (−) is injective for absolutely irreducible ρ̄; conclude by EM11 Lemma 3.1.6 (EM11 Proposition 5.5.3, Corollary 5.5.9; the finite-level analogue is Carayol’s Theorem 4).
2. (b): Frob\_ℓ ↦ ℓS\_ℓ extends to a continuous character of G\_{Q,Σ}; the Eichler–Shimura relation on H^1 gives ρ(Frob\_ℓ)(v) ⊗ (T\_ℓ − tr ρ(Frob\_ℓ))u + v ⊗ (ℓS\_ℓ − det ρ(Frob\_ℓ))u = 0 on ρ ⊗ U; at non-scalar ρ(Frob\_ℓ) both factors vanish, Chebotarev extends to all ℓ ∉ Σ (EM11 Proposition 6.1.12, Remark 6.1.15, Corollary 6.1.16).
3. (c) is (b) rewritten with Pan’s twist (LocallyAnalyticCompletedCohomology request, citing Pan I §6.1.1 and Pan II §7.1.4).

**Checks.**

- For ρ = V\_f attached to a newform f of tame level K\_{Σ\_0}, Hom(V\_f, Ĥ^1(K\_{Σ\_0})\_E) is the 𝔭\_f-part and is nonzero.
- Non-example: for reducible ρ = ψ\_1 ⊕ ψ\_2 the Eichler–Shimura argument gives no equality, since ρ(Frob\_ℓ) acts on the span of an eigenvector by a scalar.

*Needs:* §3.4; §3.2; §2.1; §2.2; CompletedCohomologyPartII CC.5 (banach admissibility); AutomorphicGaloisRepresentations R19.1 (geometric construction and the eichler congruence relation).

EM11, §5.5, (5.5.1)–(5.5.2), Proposition 5.5.3, Corollary 5.5.9, Remarks 5.5.10–5.5.11, pp. 56–58: The Galois action factors out of the ρ̄-part: Ĥ^1\_{O,ρ̄,Σ} ≅ ρ^m\_Σ ⊗ U\_Σ, proved by density at classical points, closedness of images of admissible maps, and injectivity mod ϖ on m-torsion.

EM11, Proposition 6.1.12 and its proof, p. 68; Remark 6.1.15 and Corollary 6.1.16, p. 69: For absolutely irreducible ρ, every G\_Q-map from ρ into Ĥ^1(K\_{Σ\_0})\_E lands in the 𝔭-eigenspace (Eichler–Shimura relations); nonvanishing forces promodularity.

### 3.6 Classical points and their Zariski density


Let ρ̄ be absolutely irreducible and modular. A closed point 𝔭 ∈ Spec T\_{ρ̄,Σ}[1/p] is classical if its eigensystem is that of a classical cuspform of weight k ≥ 2; C ⊂ Spec T\_{ρ̄,Σ}[1/p] is the set of classical points whose Galois representations are crystalline at p, and C(K\_{Σ\_0}) its analogue at level K\_{Σ\_0}. A closed point is allowable if it is classical and ρ(𝔭)|G\_{Q\_p} is crystabelline, absolutely irreducible and not exceptional (not a twist of a crystalline representation with non-semisimple Frobenius on its Dieudonné module). Then: (a) ⊕\_{𝔭∈C(K\_{Σ\_0})} Ĥ^1(K\_{Σ\_0})\_{E,ρ̄}[𝔭]\_{l.alg} is dense in Ĥ^1(K\_{Σ\_0})\_{E,ρ̄}, and ⊕\_{𝔭∈C} Ĥ^1\_{E,ρ̄,Σ}[𝔭]\_{l.alg} is dense in Ĥ^1\_{E,ρ̄,Σ}; (b) C is Zariski dense in Spec T\_{ρ̄,Σ}; (c) the allowable points are Zariski dense in Spec T(K\_{Σ\_0})\_ρ̄ and in Spec T\_{ρ̄,Σ}; (d) for each compact open K\_p, T\_{ρ̄,Σ} → T(K\_pK\_{Σ\_0}K\_0^Σ)\_ρ̄ is surjective and the classical points of weight two and level K\_p are the closed points of Spec T(K\_pK\_{Σ\_0})\_ρ̄[1/p].

Absolutely irreducible modular ρ̄. (c) uses the eigencurve to deform a non-allowable classical point to allowable ones; the identification of classical points with prime-to-p conductor and crystalline points is Saito’s theorem.

A proof proceeds as follows.

1. (a): by §2.2 the GL\_2(Z\_p)-algebraic vectors are dense; their E[G]-span is the sum of the locally algebraic parts at classical points of prime-to-p conductor, which by Saito’s theorem are exactly C(K\_{Σ\_0}) (EM11 Corollary 5.4.5).
2. (b): an element t ∈ ∩\_{𝔭∈C} 𝔭 kills a dense subspace, hence Ĥ^1\_{E,ρ̄,Σ}, and T\_{ρ̄,Σ} acts faithfully, so t = 0 (EM11 Corollary 5.4.6).
3. (c): every point of C(K\_{Σ\_0}) is a limit of allowable points along the eigencurve; combine with (b) and the eventual isomorphism T(K\_{Σ\_0})\_ρ̄ ≅ T\_{ρ̄,Σ} (EM11 Definition 5.4.7, Lemma 5.4.9).
4. (d) is the surjectivity of §3.1 onto each finite level and §2.5.

**Checks.**

- The point of the weight-two newform of level 11 at p = 3 is classical and crystalline (good reduction at 3), hence in C.
- Non-example: a classical point of weight 2 with Steinberg local component at p is classical but not in C.

*Needs:* §2.2; §2.5; §3.4; §3.1; AutomorphicGaloisRepresentations R19.5 (potential semistability and compatibility at the coefficient prime); mathlib:PrimeSpectrum.zeroLocus.

EM11, Definitions 5.2.8, 5.4.4, 5.4.7; Corollaries 5.4.5–5.4.6; Remark 5.4.8; Lemma 5.4.9, pp. 48, 55–56: Classical, crystalline and allowable closed points of Spec T\_{ρ̄,Σ}[1/p]; density of the locally algebraic eigenspaces at crystalline classical points; Zariski density of C and of the allowable points.

EM11, Definition 3.3.18, p. 27: A representation is exceptional if it is a twist of a crystalline representation whose Frobenius on the Dieudonné module has a double root.

### 3.7 Hecke algebra of the definite quaternionic tower


In the setting of §1.6, fix a finite set S of places containing those above p, the infinite places and those where U^p or D ramify, and let T\_S^{univ} = O[T\_v, S\_v]\_{v∉S} (T\_v, S\_v the double cosets of diag(ϖ\_v, 1) and diag(ϖ\_v, ϖ\_v)). The big Hecke algebra is T\_ψ(U^p) = lim\_{(n,U\_p)} T\_ψ(U^pU\_p, O/ϖ^n), the limit over pairs with ψ ≡ 1 mod ϖ^n on U\_p ∩ O\_{F,p}^×, of the images of T\_S^{univ} in End(S\_ψ(U^pU\_p, O/ϖ^n)); equivalently, for F = Q without central character, T̃\_Σ = lim\_{K\_p} T̃\_Σ(K\_p) is the weak closure of the image of T\_S^{univ} in End^cont\_O(C^0(X, O)), each T̃\_Σ(K\_p) being finite free over O. It acts faithfully on S\_ψ(U^p) and M\_ψ(U^p), commuting with D\_p^×; it is independent of S; for U\_p pro-p the map T\_ψ(U^p) → T\_ψ(U^pU\_p, k) is a bijection on maximal ideals, so T\_ψ(U^p) ≅ ∏\_{i=1}^r T\_ψ(U^p)\_{m\_i} with each factor m\_i-adically complete and separated, and S\_ψ(U^p) ≅ ⊕\_i S\_ψ(U^p)\_{m\_i}. A continuous r: G\_{Q,Σ} → GL\_2(R) is associated with a continuous φ: T̃\_Σ → R if det(X − r(Frob\_ℓ)) = X^2 − φ(T\_ℓ)X + ℓφ(S\_ℓ) for all ℓ ∉ Σ, and r̄: G\_{Q,Σ} → GL\_2(k) is modular of tame level K^p if it is associated with T̃\_Σ → T̃\_Σ/m for a maximal ideal m with residue field k (DLB Définition 5.2). For m with residual representation absolutely irreducible on G\_{Q\_p} (DLB’s hypothesis), A = T̃\_{Σ,m} is a flat local noetherian reduced O-algebra with residue field k, a direct factor of T̃\_Σ, and for a T̃\_Σ-module M, M\_m = A ⊗\_{T̃\_Σ} M is a direct factor of M (DLB Définition 5.3).

D definite, split above p; p splits completely in F. DLB assert the properties of A (flat, local, noetherian, reduced) without proof; noetherianity is used in R31.4 and follows from the surjection of a universal (pseudo)deformation ring onto A (§3.3 in the quaternionic form).

Use the following named interfaces:

- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra` (constructor): T\_ψ(U^p) = lim\_{(n,U\_p)} T\_ψ(U^pU\_p, O/ϖ^n), acting faithfully on S\_ψ(U^p).
- `TauCeti.DefiniteQuaternionCompleted.heckeClosure` (constructor): The topological closure of the subalgebra generated by a set of operators in a topological algebra of operators.
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_weakClosure` (characterisation): For F = Q and no central character, T̃\_Σ is the weak closure of the image of T\_S^{univ} in End^cont\_O(C^0(X, O)).
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_semilocal` (structure): T\_ψ(U^p) ≅ ∏\_i T\_ψ(U^p)\_{m\_i}, and S\_ψ(U^p) ≅ ⊕\_i S\_ψ(U^p)\_{m\_i}.
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_maxIdeal_bijection` (characterisation): For U\_p pro-p, T\_ψ(U^p) → T\_ψ(U^pU\_p, k) is a bijection on maximal ideals.
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_independent` (relation): T\_ψ(U^p) does not depend on the finite set S.
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_commutes` (compatibility): T\_ψ(U^p) commutes with the D\_p^×-action.
- `TauCeti.DefiniteQuaternionCompleted.localHeckeAlgebra` (constructor): A = T̃\_{Σ,m}, a direct factor of T̃\_Σ, flat local noetherian reduced with residue field k, when ρ̄\_m|G\_{Q\_p} is absolutely irreducible.

**Checks.**

- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_finiteLevel` (computation): T̃\_Σ(K\_p) is finite free over O of rank at most the O-rank of C(X(K\_p), O) = number of points of X(K\_p).
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_eisenstein` (characterisation): On the functions factoring through the reduced norm, T\_v acts by 1 + N(v) times the norm character; the corresponding maximal ideal is Eisenstein (residual 1 ⊕ ε̄ up to twist).
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_compatibility` (compatibility): T\_ψ(U^p) is the CompletedCohomologyPartII CC.8 (completed hecke algebra) of the degree-zero quaternionic tower.
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_not_finite_level` (non-example): T\_ψ(U^p)\_m is not a finite O-algebra in general (its components have dimension at least 1 + 2[F : Q], Pan Theorem 3.6.1), while each T\_ψ(U^pU\_p, O)\_m is.

PAN, Theorem 3.5.5 and Corollary 3.5.10: T\_ψ(U^p)\_m acts on the block multiplicity module m and is finite over the local pseudo-deformation ring. DLB, Théorème 5.4 and §13: A acts on C^0(X)\_m, and Π(𝔭) is attached to r(𝔭)|G\_{Q\_p} for 𝔭 ∈ MaxSpec A[1/p]. TUNG-2, §4.2–4.6: T^S\_ψ(U^p)\_m receives the global deformation ring and is patched. GL2ModularityLifting R32.4 (nice prime): Pan’s nice primes are primes of T\_m (input CC2).

A proof proceeds as follows.

1. The big Hecke algebra is the CompletedCohomologyPartII CC.8 (completed hecke algebra) of the finite discrete tower of §1.6; the finite images are commutative finite O-algebras (R18.3).
2. Semilocality: a maximal ideal of the Artinian ring T\_ψ(U^pU\_p′, O/ϖ^n) has a nonzero eigenspace on which the p-group U\_p/U\_p′ has a fixed vector, so it is a maximal ideal at level U\_p mod ϖ; Artinian rings are products of their localisations; pass to the limit (Pan Proposition 3.3.6, Corollary 3.3.7; Gee–Newton Lemma 2.1.14; CC.8/completed-semilocal-product). The m\_i-adic completeness and separatedness of each factor is Pan’s Corollary 3.3.7(1), proved from the Artinian decomposition at each finite level; CC.8 alone asserts only the finite-image topology.
3. Independence of S: twisting by a character reduces to finite-order ψ, where the pseudo-representation over T\_ψ(U, O/ϖ^n) is classical (Pan 3.3.3).
4. For DLB’s A: reducedness from semisimplicity of the finite-level Hecke action on S(U, E), flatness since A ⊂ End(C^0(X, O)\_m) is torsion-free, noetherianity from the surjection of the deformation ring of r̄ (absolutely irreducible) onto A.

**Checks.**

- For F = Q, B̄ of discriminant 2 and p = 3, T̃\_Σ(GL\_2(Z\_3)) is the Hecke algebra of weight-two forms on B̄^\*, isomorphic under Jacquet–Langlands to the 2-new quotient of the weight-two Hecke algebra of level Γ\_0(2·N).
- Non-example: without the closure, the image of T\_S^{univ} in End(C^0(X, O)) is not complete and does not contain the idempotents of its maximal ideals.

*Needs:* §1.6; CompletedCohomologyPartII CC.8 (completed hecke algebra); CompletedCohomologyPartII CC.8 (completed semilocal product); HilbertModularVarietiesAndShimuraCurves R18.3 (residual hecke ideal); HilbertModularVarietiesAndShimuraCurves R18.3 (split hecke normalisation); GlobalGaloisDeformations R04.2 (universal deformation ring); mathlib:Subalgebra.topologicalClosure; mathlib:IsReduced.

PAN, Definition 3.3.4, 3.3.5, Proposition 3.3.6, Corollary 3.3.7, p. 24: The definite quaternionic big Hecke algebra T\_ψ(U^p) as a limit of finite-level Hecke algebras, faithful on S\_ψ(U^p), with a pseudo-representation, semilocal with product decomposition.

DLB, §5.1, p. 25; Définition 5.3, p. 25: The spherical Hecke algebras at ℓ ∉ Σ, T\_Σ, T̃\_Σ(K\_p) free of finite type over O, T̃\_Σ the weak closure in End^cont(C^0(X, O)), compact reduced commutative; A the m-adic completion, flat local noetherian reduced, a direct factor.

TUNG-2, Lemma 4.2.4, p. 19: T^S\_ψ(U^p) is profinite with finitely many maximal ideals, J-adically complete, and the product of its localisations.

### 3.8 Eisenstein localisation and pro-modular primes


Fix Pan’s §4.1 data: p odd; F totally real of even degree in which p splits completely; S ⊇ Σ\_p finite with N(v) ≡ 1 mod p for v ∈ S∖Σ\_p; χ: G\_{F,S} → O^× totally odd, unramified outside p, with χ(Frob\_v) ≡ 1 mod ϖ for v ∈ S∖Σ\_p; characters ξ\_v of p-power order of the tame inertia at v ∈ S∖Σ\_p; ψ, U^p and a character ξ of U^p as in Pan §3.7 (the variant with p-power tame characters). Assume (Pan’s Assumption in §4.1) that T\_v − (1 + χ(Frob\_v)) for v ∉ S and ϖ generate a maximal ideal m of the variant Hecke algebra T = T\_{ψ,ξ}(U^p) (the Eisenstein maximal ideal), and write T\_m for the localisation. Then: (a) there is a natural two-dimensional pseudo-representation T\_m: G\_{F,S} → T\_m lifting 1 + χ̄ with determinant χ and Frob\_v ↦ T\_v (v ∉ S); (b) the universal map R^{ps} → T\_m from the universal pseudo-deformation ring of 1 + χ̄ with determinant χ is surjective and factors through R^{ps,{ξ\_v}}; (c) a prime q ∈ Spec R^{ps,{ξ\_v}} is pro-modular if it is the contraction of a prime of T\_m, equivalently if ker(R^{ps,{ξ\_v}} → T\_m) ⊆ q; the pro-modular primes form the closed subset V(ker) of Spec R^{ps,{ξ\_v}}, so they are closed under specialisation; (d) for q ∈ Spec T\_m, ρ(q): G\_{F,S} → GL\_2(k(q)) denotes the semisimple representation with trace T\_m mod q; (e) T\_m ≠ 0, i.e. m is a proper maximal ideal, whenever the Eisenstein maximal ideal exists for the ordinary quotient (the ordinary Eisenstein seed contract, Pan Proposition 5.6.1). This is a different carrier from the ordinary pro-modular primes of OrdinaryAutomorphicFormsAndModularityLifting R21.4.

Pan’s §4.1 standing assumptions; p = 3 needs the additional local exclusion χ̄|G\_{F\_v} ≠ ω^{±1} wherever Theorem 4.1.7 is used. The definite quaternion algebra is split at all finite places when [F : Q] is even, which Pan arranges by base change. Use the ordinary Eisenstein seed contract (Pan Proposition 5.6.1, from Skinner–Wiles Proposition 3.18 and Eisenstein congruences under ord\_ϖ L\_p(F, −1, χ̃ω) > 0). The generators need not define a proper ideal without this input.

Use the following named interfaces:

- `TauCeti.DefiniteQuaternionCompleted.eisensteinIdeal` (constructor): The ideal of T\_{ψ,ξ}(U^p) generated by ϖ and T\_v − (1 + χ(Frob\_v)), v ∉ S.
- `TauCeti.DefiniteQuaternionCompleted.eisensteinPseudoRep` (constructor): The pseudo-representation T\_m: G\_{F,S} → T\_m with determinant χ lifting 1 + χ̄.
- `TauCeti.DefiniteQuaternionCompleted.psToHecke` (data): The surjection R^{ps,{ξ\_v}} → T\_m.
- `TauCeti.DefiniteQuaternionCompleted.IsProModular` (other): q ∈ Spec R^{ps,{ξ\_v}} is pro-modular iff ker(R^{ps,{ξ\_v}} → T\_m) ⊆ q.
- `TauCeti.DefiniteQuaternionCompleted.IsProModular.of_le` (relation): Pro-modularity passes to larger primes (closure under specialisation).
- `TauCeti.DefiniteQuaternionCompleted.isProModular_iff_comap` (characterisation): q is pro-modular iff q is the contraction of a prime of T\_m.
- `TauCeti.DefiniteQuaternionCompleted.semisimpleAtPrime` (constructor): ρ(q): G\_{F,S} → GL\_2(k(q)), the semisimple representation with trace T\_m mod q.

**Checks.**

- `TauCeti.DefiniteQuaternionCompleted.IsProModular_maximal` (computation): The maximal ideal of R^{ps,{ξ\_v}} is pro-modular when T\_m ≠ 0 (it contracts from m).
- `TauCeti.DefiniteQuaternionCompleted.IsProModular_kernel` (computation): A prime equal to the kernel of R^{ps,{ξ\_v}} → T\_m is pro-modular; it is the generic point of the closed image.
- `TauCeti.DefiniteQuaternionCompleted.IsProModular_zero_hecke` (degenerate): If T\_m = 0 the kernel is the unit ideal and no prime is pro-modular.
- `TauCeti.DefiniteQuaternionCompleted.IsProModular_compatibility` (compatibility): q is pro-modular iff q lies in the image of Spec T\_m → Spec R^{ps,{ξ\_v}} (Mathlib’s comap of the surjection).
- `TauCeti.DefiniteQuaternionCompleted.IsProModular_not_ordinary` (non-example): The ordinary pro-modular primes of OrdinaryAutomorphicFormsAndModularityLifting R21.4 (pro modular prime) live on a different ring (an ordinary representation deformation ring) and are not identified with these.

PAN, Theorem 4.1.7 and Corollary 4.1.8: The nilpotence of the kernel at a nice prime shows the component through it is pro-modular. GL2ModularityLifting R32.4 (nice prime) and R32.4/nice-prime-component-bridge: Pan’s pro-modular primes as containment of the kernel, closed under specialisation (input CC2). GL2ModularityLifting R32.4 (potentially nice base change): After solvable base change the determinant-fixed problem has a nonzero completed Hecke quotient.

A proof proceeds as follows.

1. (a) is §3.2(c) for the variant algebra T\_{ψ,ξ}(U^p) (Pan 3.7.2 deduces the variant from the untwisted case through the kernel of ξ).
2. (b) is §3.3(b).
3. (c) is the definition of pro-modularity (Pan 4.1.3, last paragraph) recast as membership in the closed set V(ker(R^{ps,{ξ\_v}} → T\_m)); closure under specialisation is closedness.
4. (d): over a field, a pseudo-representation is the trace of a unique semisimple representation (IntegralHeckeAndGaloisDeterminants IHG.1 (algebraically closed reconstruction)).

**Checks.**

- Pro-modularity is stable under specialisation: if q is pro-modular and q ⊆ q′ then q′ is pro-modular.
- Non-example: a prime of R^{ps} not containing the kernel, e.g. a characteristic-zero point whose pseudo-representation is not congruent to an automorphic one at the level, is not pro-modular even if its residual pseudo-representation is 1 + χ̄.

*Needs:* §3.7; §3.3; §3.2; IntegralHeckeAndGaloisDeterminants IHG.1 (universal reductive pseudocharacter ring); IntegralHeckeAndGaloisDeterminants IHG.1 (algebraically closed reconstruction); IntegralHeckeAndGaloisDeterminants IHG.1 (reducibility ideal); mathlib:PrimeSpectrum.zeroLocus; mathlib:RingHom.ker.

PAN, §4.1, Assumption and 4.1.3, pp. 37–38: Pan’s setup for the residually reducible case: the Eisenstein maximal ideal of the variant Hecke algebra, the pseudo-representation T\_m with determinant χ, the surjection R^{ps} → T\_m factoring through R^{ps,{ξ\_v}}, and the definition of pro-modular primes.

PAN, §3.7.1–3.7.2, p. 37: The variant completed homology M\_{ψ,ξ}(U^p) and Hecke algebra T\_{ψ,ξ}(U^p) with p-power tame characters, needed for Taylor’s Ihara avoidance.

PAN, Proposition 5.6.1 and Remark 5.6.2, p. 86: Existence of the Eisenstein maximal ideal of the ordinary Hecke algebra under a p-adic L-value condition, generalising Skinner–Wiles Proposition 3.18.

The representative `eisensteinIdeal` is the ideal generated by the image of ϖ and the elements T_v−(1+χ_v); it is meaningful for arbitrary commutative O-algebras T, independently of properness. Prove containment of every generator and its universal kernel criterion. The representative `IsProModular(φ,q)` is `ker φ ≤ q`. Prove `IsProModular.of_le` and `isProModular_iff_comap`; the latter requires φ surjective. Both use Mathlib’s ideals and prime spectrum directly.

**Checks.**

- In T=k with ϖ=0 and T_v=1+χ_v, the Eisenstein ideal is zero. If one trace differs from 1+χ_v by a unit it is the unit ideal, so no Eisenstein maximal ideal exists.
- If the set of v is empty the ideal is (ϖ), not zero in O. Thus the coefficient generator cannot be omitted.
- For φ:R↠R/I the pro-modular primes are exactly V(I). For I=R there are none; for I=0 every prime is pro-modular.
- Surjectivity matters for the image interpretation: ℤ→ℚ has zero kernel, so (2) contains it, but no prime of ℚ contracts to (2). Specialisation closure is valid for the kernel-containment predicate even without surjectivity.

### Examples

At a weight-two point with trivial nebentypus, S_ℓ=1 but det(Frob_ℓ)=ℓ; omitting ℓ already fails at ℓ=2. For a zero Hecke quotient there are no pro-modular primes. For a nonzero quotient R/I they form V(I) and are closed under specialisation. These ring-theoretic facts do not prove that an Eisenstein seed exists.

### Dependencies

Layers 1–2 give the arithmetic carriers and classical points. CompletedCohomologyPartII CC.8 supplies the completed Hecke algebra and residual projector. IntegralHeckeAndGaloisDeterminants IHG.0–IHG.3, AutomorphicGaloisRepresentations R19.6 and GlobalGaloisDeformations R04.2 supply determinants and irreducible reconstruction. OrdinaryAutomorphicFormsAndModularityLifting R21 supplies the exact ordinary Eisenstein seed contract. The Pan Iwasawa-dimension input is used only through its specification above.

## Layer 4: p-adic local–global compatibility


Kisin’s deformation comparison supplies the local family at p in its stated range. Away from p the co-Whittaker family W and its smooth O-dual Π are different objects: derivative and arbitrary-coefficient endomorphism statements apply to W. The coadmissible multiplicity module X(θ) uses Π. Its cotorsion-free part is a submodule.

The canonical refined isomorphism uses scalar local residual endomorphisms. For split distinct characters the checked proof gives the weaker θ-family isomorphism. This suffices for the corresponding branch of Theorem 1.2.1, but does not identify θ with the canonical family. The evaluation proof uses the explicit mod-p weight/genericity input and tensor cancellation with a nonzero factor and an injective saturated composite. Use the coadmissibility and integral mod-p family contracts above for these steps.

Dospinescu–Le Bras give the definite quaternionic comparison over Q using dense classical crystalline points and an evaluation map. Pan’s general totally real comparison uses block multiplicity modules and a finite central pseudo-deformation map, with no general integral centre isomorphism asserted. The Scholze-functor comparison remains conditional on its designated owner. The Banach comparisons are separate from the locally algebraic comparisons.

### 4.1 Local Langlands families over the completed Hecke algebra


Let ρ̄ be absolutely irreducible and modular and let ρ̄\_p satisfy EM11 Assumption 3.3.1. Write T = T\_{ρ̄,Σ}. (a) Kisin’s fully faithful functor gives the admissible orthonormalizable T-family π^m\_Σ deforming Colmez’s π̄ with MF(π^m\_Σ) ≅ ρ^m\_Σ|G\_{Q\_p} and central character det(ρ^m\_Σ|G\_{Q\_p})ε. Its closed characteristic-zero fibres are B(ρ(𝔭)|G\_{Q\_p}). (b) For ℓ ∈ Σ\_0, denote the torsion-free smooth co-Whittaker T-family by W\_ℓ; its minimal-prime fibres are the generic contragredient local Langlands representations. Put W\_{Σ\_0} = (⊗\_{ℓ∈Σ\_0} W\_ℓ)\_{T-torsion-free} and Π\_{Σ\_0} = W\_{Σ\_0}^{smooth O-dual}. Thus W is Nakamura’s π^m\_{Σ\_0}, while Π is Nakamura’s π̃^m\_{Σ\_0} and Emerton’s π\_{Σ\_0}(ρ^m\_Σ), a coadmissible module. The modern family construction is imported from SmoothRepresentationsOfLocalGroups SR.5. Prove the additional integral smooth-dual mod-ϖ m-torsion compatibility specified above; it does not follow by dualising arbitrary base change. Subject to that exact compatibility, for p > 2, (Π\_{Σ\_0}/ϖ)[m] ≅ ⊗\_ℓ π(ρ̄|G\_{Q\_ℓ}); the p = 2 statement retains Remark 6.1.3’s weaker formulation. (c) Φ\_{Σ\_0}(W\_{Σ\_0}) ≅ T and End\_{T[G\_{Σ\_0}]}(M ⊗\_T W\_{Σ\_0}) ≅ End\_T(M) for every T-module M. These assertions concern W, not Π.

Assumption 3.3.1 on ρ̄\_p is needed for Colmez’s π̄ and Kisin’s equivalence; when End(ρ̄\_p) ≠ k, Def(π̄) is not representable and π^m\_Σ is defined through the subfunctor Def^\*(π̄) ↪ Def(ρ̄\_p). In (b) the residue characteristic of the coefficients is p ≠ ℓ; the p = 2 mod-p statement is weaker (EM11 Remark 6.1.3: an embedding, an isomorphism when ρ̄|G\_{Q\_ℓ} is non-scalar). ρ^m\_Σ|G\_{Q\_p} lies in Def^{crys}(ρ̄\_p) because crystalline points are Zariski dense (§3.6); this is what makes Kisin’s equivalence applicable.

Use the following named interfaces:

- `TauCeti.LocalGlobalCompatibility.colmezResidual` (data): π̄, the admissible smooth k[G]-representation with MF(π̄) ≅ ρ̄\_p (imported from R30.3).
- `TauCeti.LocalGlobalCompatibility.localFamilyAtP` (constructor): π^m\_Σ, the deformation of π̄ over T\_{ρ̄,Σ} with MF(π^m\_Σ) ≅ ρ^m\_Σ|G\_{Q\_p} and central character det(ρ^m\_Σ|G\_{Q\_p})ε.
- `TauCeti.LocalGlobalCompatibility.localFamilyAtP_fibre` (compatibility): κ(𝔭) ⊗ π^m\_Σ ≅ B(ρ(𝔭)|G\_{Q\_p}) at closed points 𝔭 of Spec T\_{ρ̄,Σ}[1/p].
- `TauCeti.LocalGlobalCompatibility.localFamilyAtP_unique` (extensionality): π^m\_Σ is unique up to isomorphism among deformations of π̄ with the given MF and central character.
- `TauCeti.LocalGlobalCompatibility.localFamilyAway` (constructor): W\_ℓ, W\_{Σ\_0} = (⊗ W\_ℓ)\_{T-torsion-free}, and Π\_{Σ\_0} = W\_{Σ\_0}^{smooth O-dual}; the latter is Emerton’s coadmissible π\_{Σ\_0}(ρ^m\_Σ).
- `TauCeti.LocalGlobalCompatibility.localFamilyAway_minimalPrime` (characterisation): At a minimal prime a, κ(a) ⊗\_T W\_ℓ is the generic contragredient local Langlands representation of ρ^m\_Σ|G\_{Q\_ℓ} ⊗ κ(a).
- `TauCeti.LocalGlobalCompatibility.localFamilyAway_modp` (compatibility): Under the integral smooth-dual comparison specified above, for p > 2, (Π\_{Σ\_0}/ϖ)[m] ≅ ⊗\_ℓ π(ρ̄|G\_{Q\_ℓ}).
- `TauCeti.LocalGlobalCompatibility.localFamilyAway_endomorphisms` (relation): For the co-Whittaker module W\_{Σ\_0}, End\_{T[G\_{Σ\_0}]}(M ⊗\_T W\_{Σ\_0}) ≅ End\_T(M).

**Checks.**

- `TauCeti.LocalGlobalCompatibility.localFamilyAway_empty` (degenerate): For Σ\_0 = ∅, W\_{Σ\_0} = T with trivial group action, whereas Π\_{Σ\_0} is the continuous O-dual T′ = Hom\_{O-cont}(T,O), with T given its maximal-ideal-adic topology. A definition identifying both families with T fails this test.
- `TauCeti.LocalGlobalCompatibility.localFamilyAtP_residue` (computation): π^m\_Σ/m\_T ≅ π̄; for ρ̄\_p absolutely irreducible, π̄ is a supersingular irreducible representation and π^m\_Σ is topologically irreducible at every closed point with ρ(𝔭)|G\_{Q\_p} irreducible.
- `TauCeti.LocalGlobalCompatibility.localFamilyAway_compatibility` (compatibility): W\_ℓ is the torsion-free co-Whittaker family supplied by SR.5; Π\_ℓ is its smooth O-dual. Their derivative and base-change APIs are applied on the W side.
- `TauCeti.LocalGlobalCompatibility.localFamilyAtP_not_classical` (non-example): π(𝔭) is a Banach representation, not the smooth local Langlands representation π\_p(ρ(𝔭)); its locally algebraic vectors recover the latter only for de Rham ρ(𝔭) with distinct weights.

EM11, Conjecture 6.1.6 and Theorem 6.2.13: ρ^m\_Σ ⊗ π^m\_Σ ⊗̃ π\_{Σ\_0}(ρ^m\_Σ) is the source of the refined local–global isomorphism. NAK, Theorem 2.2 and Corollary 2.5: The same three families give the dual description of completed Borel–Moore homology. §4.3: θ ranges over deformations of π̄ such as π^m\_Σ.

A proof proceeds as follows.

1. (a): apply PadicLocalLanglandsForGL2Qp R30.5 (kisin deformation comparison) to ρ^m\_Σ|G\_{Q\_p}. Its fully faithful crystalline deformation comparison under Assumption 3.3.1 is the precise supplier; crystalline density places the Hecke representation in that subfunctor. The general complete-local coefficient category is imported from CC.3.
2. π(𝔭) = B(ρ(𝔭)|G\_{Q\_p}) at closed points is the definition of B in the deformation-theoretic correspondence (EM11 Definition 6.1.1, Remark 3.3.19).
3. (b): apply SR.5’s unconditional Helm–Moss family construction to each ρ^m\_Σ|G\_{Q\_ℓ}; tensor and take the torsion-free quotient to obtain W, then form its smooth O-dual Π. EM11 Theorem 4.4.1 characterises Π. For the mod-p formula use only the additional integral smooth-dual compatibility for Theorem 6.1.2; an arbitrary dual base change does not supply this compatibility.
4. (c): the free rank-one derivative and arbitrary-coefficient endomorphism theorem for W come from SR.5; these are the co-Whittaker results used by NAK Lemma B.10. No such formula is asserted for M ⊗ Π.

**Checks.**

- At a closed point 𝔭 attached to a newform f with ρ(𝔭)|G\_{Q\_p} crystalline and absolutely irreducible, π(𝔭) is the universal unitary completion of π\_p(f) ⊗ Sym^{k−2} (Berger–Breuil).
- Non-example: for ρ̄\_p a twist of a non-split extension of ε̄ by 1 (excluded by Assumption 3.3.1), the expected B(V) is longer than the Colmez correspondence predicts (EM11 Remark 6.1.23), so the family in (a) is not defined.

*Needs:* §3.2; §3.6; SmoothRepresentationsOfLocalGroups SR.5; CompletedCohomologyPartII CC.3 (orthonormalizable and profree modules); mathlib:Module.Flat; PadicLocalLanglandsForGL2Qp R30.3 (montreal functor); PadicLocalLanglandsForGL2Qp R30.3 (montreal on irreducibles); PadicLocalLanglandsForGL2Qp R30.5 (kisin deformation comparison).

EM11, Assumption 3.3.1, Theorem 3.3.2, p. 24; Theorem 3.3.13, p. 26; Remark 3.3.19, p. 27: Colmez’s π̄ attached to ρ̄\_p, Kisin’s deformation-theoretic equivalence between crystalline deformations of π̄ and of ρ̄\_p, and the compatibility of B with the explicit correspondence.

EM11, §6.1 opening paragraphs, Definition 6.1.1, Theorem 6.1.2 and Remark 6.1.3, pp. 66–67: The deformation π^m\_Σ of π̄ over T\_{ρ̄,Σ} with MF(π^m\_Σ) ≅ ρ^m\_Σ|G\_{Q\_p}, its fibres π(𝔭), the family π\_{Σ\_0}(ρ^m\_Σ) and its mod ϖ m-torsion for p > 2.

EM11, Theorem 4.4.1, Definition 4.4.2, Proposition 4.4.3, pp. 42–44: Uniqueness and properties of the coadmissible family π\_{Σ\_0}(ρ) attached to a Galois representation over a reduced complete local ring (Emerton–Helm).

NAK, §2.2, pp. 19–20: Under ρ̄\_p ≇ χ ⊗ (1 ∗; 0 ε), p ≥ 3 and End(ρ̄\_p) = F: the deformation π^m\_p of π̄\_p with MF(π^m\_p) ≅ ρ^m|G\_{Q\_p}, the co-Whittaker π^m\_ℓ, π^m\_{Σ\_0} as maximal torsion-free quotient, and Φ\_{Σ\_0}(π^m\_{Σ\_0}) ≅ T\_{ρ̄,Σ}.

### 4.2 Fibres of the away-from-p family (Mazur’s principle in families)


Under the hypotheses of §4.1, for every closed point 𝔭 ∈ Spec T\_{ρ̄,Σ}[1/p] there is an isomorphism π\_{Σ\_0}(ρ^m\_Σ)[𝔭] ≅ π\_{Σ\_0}(ρ(𝔭)°), hence E ⊗\_O π\_{Σ\_0}(ρ^m\_Σ)[𝔭] ≅ ⊗\_{ℓ∈Σ\_0} π\_ℓ(ρ(𝔭)|G\_{Q\_ℓ}) (Emerton’s Conjecture 6.1.4, proved as his Theorem 6.2.4). Equivalently: if Σ\_0^{ng} ⊂ Σ\_0 is the set of ℓ at which ρ(𝔭) is a non-generic principal series and χ makes χ ⊗ ρ(𝔭) unramified on Σ\_0^{ng}, then χ ⊗ ρ(𝔭) is promodular of tame level divisible only by primes in Σ\_0 ∖ Σ\_0^{ng}.

The proof removes one prime ℓ ∈ Σ\_0^{ng} at a time and uses that ρ(𝔭)(Frob\_ℓ) has eigenvalue ratio ℓ^{±1}, so is not scalar. It uses the semistable model of X(K\_pK\_{Σ\_0}K\_0^Σ) at ℓ, the Néron model of its Jacobian, and the Eisenstein property of the component group (Ribet), after localising at the non-Eisenstein m.

A proof proceeds as follows.

1. Reduce to removing one ℓ with ρ(𝔭) unramified non-generic principal series at ℓ, at Iwahori level J\_ℓ (EM11 Remark 6.1.5 and proof of Theorem 6.2.4).
2. Adjoin U\_ℓ to get T(K\_{Σ\_0})^\*\_ρ̄ (finite over T(K\_{Σ\_0})\_ρ̄); refine the embedding ρ(𝔭) ↪ Ĥ^1(K\_{Σ\_0})\_{E,ρ̄}[𝔭] (from §4.3, Emerton Remark 6.4.3) to a prime 𝔭^\* over 𝔭, landing in the inertia invariants.
3. Construct the ℓ-new/ℓ-old exact sequence of the inertia invariants, with Frob\_ℓ acting by U\_ℓ on the new part and the old part ≅ two copies of the level-without-ℓ cohomology, from the Néron model sequences (6.2.9)–(6.2.11): the component group Φ is Eisenstein (Ribet), so localising at m kills it, and Frob\_ℓ acts on the torus part by ℓ^{-1}U\_ℓ (EM11 (6.2.7)–(6.2.11)); the semistable model at ℓ is ModularCurvesPartII R13.5 and the Néron-model and character-group sequences are R14.6; the Eisenstein property of the Hecke action on Φ (Ribet 1990, Corollary on p. 140) and the action of Frob\_ℓ by ℓ^{-1}U\_ℓ on the torus (Ribet, Proposition 3.8) are supplied by ModularCurvesPartII R14.6, with the Eisenstein component-group and bad-reduction torus identities required in addition to the sequences and the good-reduction Eichler–Shimura relation.
4. Since ρ(𝔭)(Frob\_ℓ) is not scalar, the embedding does not factor through the new part, so the old part at 𝔭^\* is nonzero, giving promodularity at level prime to ℓ (Mazur’s principle, EM11 Remark 6.2.12).

**Checks.**

- For ρ(𝔭) unramified at every ℓ ∈ Σ\_0 with ρ(𝔭)(Frob\_ℓ) of eigenvalue ratio ≠ ℓ^{±1}, Σ\_0^{ng} = ∅ and the statement reduces to the existence of the family.
- Under p > 2, ρ̄|G\_{Q(ζ\_p)} absolutely irreducible and ρ̄ p-distinguished, the theorem also follows from Theorem 1.2.3 (EM11 Remark 6.2.12), but that route uses Serre’s conjecture; the Mazur-principle proof does not.

*Needs:* §4.1; §4.3; §3.5; ModularCurvesPartII R14.6 (modular monodromy); ModularCurvesPartII R14.6 (character degeneracy sequences); ModularCurvesPartII R14.6 (special fibre eichler shimura); ModularCurvesPartII R13.5 (one factor mixed level model).

EM11, Conjecture 6.1.4 and Remark 6.1.5, p. 67; Theorem 6.2.4 and its proof with (6.2.5)–(6.2.11), pp. 72–75; Remark 6.2.12, p. 75: The fibres of π\_{Σ\_0}(ρ^m\_Σ) at closed points are the expected local representations; the proof is a p-adic form of Mazur’s principle using the Néron model of the Jacobian at a semistable prime and the Eisenstein component group.

### 4.3 The multiplicity module X(θ)


Under the hypotheses of §4.1, let θ be a deformation of π̄ over T\_{ρ̄,Σ} (an admissible G-representation on an orthonormalizable T\_{ρ̄,Σ}-module) such that θ(𝔭) ≅ π(𝔭) at every allowable closed point (Emerton’s Assumption 6.3.1; θ = π^m\_Σ qualifies, and θ ≅ π^m\_Σ when End\_G(π̄) = k). Define X(θ) = Hom\_{T\_{ρ̄,Σ}[G\_Q×G]-cont}(ρ^m\_Σ ⊗\_{T\_{ρ̄,Σ}} θ, Ĥ^1\_{O,ρ̄,Σ}), continuity for the m-adic topology on the source and the inductive-limit topology on the target, with the T\_{ρ̄,Σ}-linear action of G\_{Σ\_0} induced from Ĥ^1\_{O,ρ̄,Σ}. For a coadmissible T\_{ρ̄,Σ}[G\_{Σ\_0}]-submodule Y ⊂ X(θ) the evaluation map ev\_Y: ρ^m\_Σ ⊗ θ ⊗̃ Y → Ĥ^1\_{O,ρ̄,Σ} uses Emerton’s completed tensor product ⊗̃ (Definition C.43: ⊗̃ = colim\_H of ϖ-adically completed tensor products with the H-invariants, H ⊂ G\_{Σ\_0} open). Then X(θ) is a smooth, cofinitely generated and coadmissible representation of G\_{Σ\_0} over T\_{ρ̄,Σ} (Definitions C.23, C.32); X(θ)\_{ctf} denotes its maximal cotorsion-free submodule (Definition C.37) and closures and saturations are in the sense of Definitions C.6 and C.28. For 𝔭 closed, E ⊗ X(θ)[𝔭] ≠ 0, giving a nonzero G\_Q × G-map ρ(𝔭) ⊗ π(𝔭) → Ĥ^1\_{E,ρ̄,Σ}[𝔭] (Emerton’s Remark 6.4.3).

θ must satisfy Assumption 6.3.1 (fibres π(𝔭) at allowable points); then θ(𝔭)^{ss} ≅ π(𝔭)^{ss} at every closed point (Emerton Lemma 6.3.3). Coadmissibility is Emerton’s notion for smooth representations of G\_{Σ\_0} over the complete local ring T\_{ρ̄,Σ} (Appendix C); it is not the Schneider–Teitelbaum notion for locally analytic representations.

Use the following named interfaces:

- `TauCeti.LocalGlobalCompatibility.multiplicityModule` (constructor): X(θ) = Hom\_{T[G\_Q×G]-cont}(ρ^m\_Σ ⊗\_T θ, Ĥ^1\_{O,ρ̄,Σ}) with its smooth G\_{Σ\_0}-action.
- `TauCeti.LocalGlobalCompatibility.multiplicityModule_coadmissible` (characterisation): X(θ) is a cofinitely generated coadmissible smooth T\_{ρ̄,Σ}[G\_{Σ\_0}]-module.
- `TauCeti.LocalGlobalCompatibility.multiplicityModule_invariants` (simp): X(θ)^{K\_{Σ\_0}} = Hom\_{T[G\_Q×G]-cont}(ρ^m ⊗ θ, Ĥ^1(K\_{Σ\_0})\_{O,ρ̄}) for allowable K\_{Σ\_0}.
- `TauCeti.LocalGlobalCompatibility.evaluation` (data): ev\_Y: ρ^m\_Σ ⊗ θ ⊗̃ Y → Ĥ^1\_{O,ρ̄,Σ} for a coadmissible submodule Y.
- `TauCeti.LocalGlobalCompatibility.cotorsionFreeSubmodule` (constructor): X(θ)\_{ctf}, the maximal cotorsion-free submodule.
- `TauCeti.LocalGlobalCompatibility.multiplicityModule_fibre` (compatibility): E ⊗ X(θ)[𝔭] ≅ Hom\_{G\_Q×G}(ρ(𝔭) ⊗ π(𝔭), Ĥ^1\_{E,ρ̄,Σ}[𝔭]) and is nonzero for closed 𝔭.
- `TauCeti.LocalGlobalCompatibility.completedTensor` (constructor): Emerton’s ⊗̃ of an orthonormalizable admissible G-representation over T with a coadmissible G\_{Σ\_0}-representation.

**Checks.**

- `TauCeti.LocalGlobalCompatibility.multiplicityModule_nonzero` (computation): For every closed point 𝔭 of Spec T\_{ρ̄,Σ}[1/p], X(π^m\_Σ)[𝔭] ⊗ E ≠ 0.
- `TauCeti.LocalGlobalCompatibility.multiplicityModule_zero_target` (degenerate): If Ĥ^1\_{O,ρ̄,Σ} were replaced by 0, X(θ) = 0 and ev is the zero map; the definition is additive in the target.
- `TauCeti.LocalGlobalCompatibility.multiplicityModule_compatibility` (compatibility): Under §3.5, X(θ) ≅ Hom\_{T[G]-cont}(θ, U\_Σ).

EM11, Theorems 6.4.9, 6.4.16, 6.4.20 and Corollary 6.4.13: The refined local–global compatibility is the statement that ev\_{X(θ)\_{ctf}} is an isomorphism with X(θ)\_{ctf} ≅ π\_{Σ\_0}(ρ^m\_Σ). EM11, Theorem 6.2.1 and Remark 7.4.2: The nonzero map ρ(𝔭) ⊗ π(𝔭) → Ĥ^1[𝔭] at every closed point is the input of Theorem 1.2.1(1) and of the global proof of Theorem 3.3.22. §4.2: The embedding of ρ(𝔭) into Ĥ^1(K\_{Σ\_0})\_{E,ρ̄}[𝔭] starts Mazur’s principle.

A proof proceeds as follows.

1. Smoothness: every continuous map factors through Ĥ^1(K\_{Σ\_0})\_{O,ρ̄} for some allowable K\_{Σ\_0}, using Ĥ^1(K\_{Σ\_0})\_{O,ρ̄} = Ĥ^1(K\_{Σ\_0})\_{E,ρ̄} ∩ Ĥ^1\_{O,ρ̄,Σ} and admissibility (EM11 proof of Theorem 6.3.12, from §3.4).
2. Cofinite generation and coadmissibility: the K\_{Σ\_0}-invariants X(θ)^{K\_{Σ\_0}} = Hom(ρ^m ⊗ θ, Ĥ^1(K\_{Σ\_0})\_{O,ρ̄}) are cofinitely generated over T\_{ρ̄,Σ} because Ĥ^1(K\_{Σ\_0})\_{O,ρ̄} is ϖ-adically admissible over T\_{ρ̄,Σ} and θ is admissible (EM11 Theorem 6.3.12, (6.3.7)).
3. Nonvanishing at closed points: X(θ) satisfies condition 4 of Emerton’s Proposition 6.4.2; Proposition C.36 gives E ⊗ X(θ)[𝔭] ≠ 0 (EM11 Remark 6.4.3).
4. The completed tensor product, closure, saturation and cotorsion-free notions are those of EM11 Appendix C, whose algebraic background (orthonormalizable and pro-free modules, Appendix B) is CompletedCohomologyPartII CC.3 (orthonormalizable coefficient modules and mixed completed tensor products).

**Checks.**

- For Σ\_0 = ∅, the predicted cotorsion-free multiplicity submodule is T′ = Hom\_{O-cont}(T,O), the coadmissible dual of W\_∅ = T, rather than T itself.
- At a closed point 𝔭, X(θ)[𝔭] ⊗ E ≅ Hom\_{G\_Q×G}(ρ(𝔭) ⊗ π(𝔭), Ĥ^1\_{E,ρ̄,Σ}[𝔭]) (EM11 (6.3.10)).

*Needs:* §4.1; §3.4; §3.5; CompletedCohomologyPartII CC.3 (orthonormalizable and profree modules); CompletedCohomologyPartII CC.3 (mixed completed tensor); CompletedCohomologyPartII CC.3 (mixed tensor dual comparison); mathlib:ContinuousLinearMap; §2.4.

EM11, Assumption 6.3.1, Remark 6.3.2, Lemma 6.3.3, Definition 6.3.4, Theorem 6.3.12 and its proof, pp. 76–78: The multiplicity module X(θ) of continuous T\_{ρ̄,Σ}[G\_Q × G]-maps from ρ^m\_Σ ⊗ θ into Ĥ^1\_{O,ρ̄,Σ}, its smoothness and coadmissibility as a G\_{Σ\_0}-representation over T\_{ρ̄,Σ}.

EM11, Proposition 6.4.2, Remark 6.4.3, Definitions 6.4.1 and 6.4.4, pp. 81–83: Evaluation maps from coadmissible submodules, X(θ)\_{ctf}, and the nonzero map ρ(𝔭) ⊗ π(𝔭) → Ĥ^1\_{E,ρ̄,Σ}[𝔭] at every closed point.

EM11, Appendix C, Definitions C.6, C.23, C.28, C.32, C.37, C.43, Proposition C.36, pp. 103–115: Saturation, coadmissible and cofinitely generated smooth representations over a complete local ring, closures, cotorsion-free submodules and the completed tensor product ⊗̃.

The representative `multiplicityEvaluation` uses `Representation.IntertwiningMap` directly and sends v⊗f to f(v), for any field E and two E-linear representations of a group G. Its theorem `multiplicityEvaluation_injective` assumes finite-dimensional V, irreducibility (no nonzero proper invariant submodule) and End_G(V)=E. The arithmetic setting has continuous actions and its separate complete-local tensor comparison; the algebraic statement does not supply that topology.

**Checks.**

- For H=V and f=id, evaluation of v⊗id is v. For H=0 or V=0 the map is the unique injection from zero, without a nonvanishing claim.
- With trivial G and V=E², evaluation is not injective: for independent basis vectors e₁,e₂ and the coordinate forms ℓ₁,ℓ₂ in Hom(V,E), the nonzero tensor e₁⊗ℓ₂ maps to zero. Thus irreducibility cannot be omitted.
- Nonzero tensor cancellation is essential: with A=O, V=0, Y=O and X=0, the tensor of Y→X is an isomorphism, but Y→X is not. For saturation, take V=O, Y=ϖO⊂X=O and W=0. The composite has saturated zero image, but X/Y has ϖ-torsion; the composite must also be injective.

### 4.4 Emerton’s refined local–global compatibility


Let ρ̄ be modular and absolutely irreducible, with ρ̄\_p satisfying Assumption 3.3.1 and p-distinguished. Prove the following two conclusions: (i) if End(ρ̄\_p) = k, there is a T-linear G\_Q × G × G\_{Σ\_0}-equivariant isomorphism ρ^m\_Σ ⊗\_T π^m\_Σ ⊗̃\_T Π\_{Σ\_0} ≅ Ĥ^1\_{O,ρ̄,Σ}, with X(π^m\_Σ)\_{ctf} ≅ Π\_{Σ\_0} (EM11 Theorem 6.4.16 and Corollary 6.4.13); (ii) if ρ̄\_p is a sum of distinct characters, Theorem 6.4.20 constructs some deformation θ with the required closed fibres and proves ρ^m\_Σ ⊗\_T θ ⊗̃\_T Π\_{Σ\_0} ≅ Ĥ^1\_{O,ρ̄,Σ}, with X(θ)\_{ctf} ≅ Π\_{Σ\_0}. Part (ii), Conjecture 6.1.9, suffices for Theorem 1.2.1(2); it does not identify θ with the canonical π^m\_Σ. The canonical conclusion in case (ii) is conditional on an additional isomorphism θ ≅ π^m_Σ compatible with the local deformation. In Nakamura’s p ≥ 3, End(ρ̄\_p) = k setting, part (i) reads ρ^m ⊗ π^m\_p ⊗̃ π̃^m\_{Σ\_0} ≅ Ĥ^1\_{ρ̄,Σ}, where π̃^m\_{Σ\_0} = Π\_{Σ\_0}.

Assumption 3.3.1 and p-distinguishedness are retained. Scalar endomorphisms give the canonical family in (i). For split distinct characters, only the θ-family form (ii) is used; no representability argument identifies it with π^m\_Σ. The converse direction of Corollary 6.4.13 (ev an isomorphism ⇒ (6.4.14)) needs ρ̄\_p non-scalar (Assumption 5.7.3), which p-distinguishedness implies. This theorem uses no globalisation by Serre’s conjecture beyond the hypothesis that ρ̄ is modular.

A proof proceeds as follows.

1. Use the evaluation criterion of Theorem 6.4.9: faithfulness of a coadmissible Y and mod-ϖ m-torsion injectivity of ev\_Y imply ev\_Y is an isomorphism and Y = X(θ)\_{ctf}. Density of allowable fibres supplies surjectivity (Theorem 6.4.7). The tensor lemmas are used with nonzero ρ^m\_Σ ⊗ θ; C.52 additionally requires the composite embedding to be injective with saturated image. The zero tensor factor and a non-injective composite do not satisfy these hypotheses.
2. For End(ρ̄\_p) = k, Theorem 6.4.16 reduces injectivity to the maps out of π̄ using Lemma 6.4.15. An irreducible socle alone does not prove every nonzero map injective: the Serre-weight upper bound and genericity in Theorem 5.7.7 exclude the possible quotient images, as in the proof on p. 88. These are explicit inputs of the new §2.4 node.
3. Distinct characters (Theorem 6.4.20, §6.5): at allowable points with κ(𝔭) = E, ρ(𝔭)° ⊗ π(𝔭)° ≅ F\_{Σ\_0}(M(𝔭)\_O) (Proposition 6.5.2), built into a deformation θ of π̄ by gluing over allowable ideals (Definitions 6.4.4, 6.5.6; Propositions 6.5.11, 6.5.13); conclude Conjecture 6.1.9.
4. Corollary 6.4.13 identifies X(θ)\_{ctf} with Π\_{Σ\_0} under non-scalarity. Remark 6.1.11 identifies θ with π^m\_Σ only when the deformation functor is representable, in particular in the scalar-endomorphism case. For split distinct characters retain θ unless an identification with the canonical deformation is supplied.
5. Nakamura’s form is the same statement with π\_{Σ\_0}(ρ^m\_Σ) written as the contragredient of the maximal torsion-free quotient of ⊗ π̃^m\_ℓ (NAK Theorem 2.2).

**Checks.**

- For ρ̄\_p absolutely irreducible (so End(ρ̄\_p) = k and ρ̄ p-distinguished), Ĥ^1\_{O,ρ̄,Σ} ≅ ρ^m ⊗ π^m ⊗̃ π\_{Σ\_0}(ρ^m), and at every closed point 𝔭, Ĥ^1\_{E,ρ̄,Σ}[𝔭] ≅ ρ(𝔭) ⊗ B(ρ(𝔭)|G\_{Q\_p}) ⊗ π\_{Σ\_0}(ρ(𝔭)).
- Non-example: for ρ̄\_p ≅ χ ⊗ χ (scalar) the theorem is not proved; Emerton expects a mod p multiplicity two phenomenon there (Remark 6.1.22).

*Needs:* §4.3; §4.1; §4.2; §3.6; §3.5; PadicLocalLanglandsForGL2Qp R30.4; PadicLocalLanglandsForGL2Qp R30.5 (kisin deformation comparison); SmoothRepresentationsOfLocalGroups SR.5; §2.4.

EM11, Conjectures 6.1.6 and 6.1.9, Remark 6.1.11, p. 67–68; Theorem 6.2.13, p. 75: The two refined conjectures differ by canonical π^m versus an unspecified θ. Use the θ conclusion of Theorem 6.4.20 for split distinct characters; the canonical conclusion additionally requires an identification with the canonical deformation.

EM11, Theorems 6.4.7, 6.4.9, 6.4.11, Corollary 6.4.13, Lemma 6.4.15, Theorems 6.4.16 and 6.4.20, pp. 84–89; §6.5, Proposition 6.5.2, pp. 89–94: The evaluation-map criterion, the identification of X(θ)\_{ctf}, and the proofs in the trivial-endomorphism and distinct-character cases.

NAK, Theorem 2.2, p. 20: Emerton’s refined local–global compatibility in the form ρ^m ⊗ π^m\_p ⊗̃ π̃^m\_{Σ\_0} ≅ Ĥ^1\_{ρ̄,Σ}, under (a) ρ̄\_p ≇ χ ⊗ (1 ∗; 0 ε), (b) p ≥ 3, (c) End(ρ̄\_p) = F.

### 4.5 Emerton’s local–global compatibility theorem


Let V be a continuous, irreducible, promodular two-dimensional representation of G\_Q over E, unramified outside a finite set of primes, with residual representation V̄. Assume (a) V̄ is absolutely irreducible and (b) V̄|G\_{Q\_p} ≇ χ ⊗ (1 ∗; 0 ε̄) for every k-valued character χ of G\_{Q\_p} (∗ zero or not). Then: (1) for some finite set Σ of primes containing p and the primes where V ramifies, there is a nonzero GL\_2(Q\_p) × GL\_2(A\_f^Σ)-equivariant map B(V|G\_{Q\_p}) ⊗ (⊗′\_{ℓ∉Σ} π\_ℓ(V)) → Hom\_{E[G\_Q]}(V, Ĥ^1\_E), and if V|G\_{Q\_p} is neither the direct sum of two characters nor an extension of a character by itself, every such map is an embedding; (2) if V̄ is p-distinguished (V̄|G\_{Q\_p} ≇ χ ⊗ (1 ∗; 0 1)), there is a GL\_2(A\_f)-equivariant isomorphism B(V|G\_{Q\_p}) ⊗ (⊗′\_{ℓ≠p} π\_ℓ(V)) ≅ Hom\_{E[G\_Q]}(V, Ĥ^1\_E). Here π\_ℓ(V) is the modified local Langlands representation (Tate normalisation, replaced by its generic constituent ordering when the classical representation is not generic) and B is the p-adic local Langlands correspondence. In the situation of (2) the structure of the summand of Ĥ^1\_E (and of its unit ball) localised at V̄ is given by §4.4.

V must be promodular; the theorem itself does not invoke Serre’s conjecture. The two residual hypotheses are distinct: (b) for (1), the stronger p-distinguishedness for (2); the embedding clause of (1) has its own hypothesis on V (not V̄). (1) is only GL\_2(Q\_p) × GL\_2(A\_f^Σ)-equivariant, for an unspecified finite Σ; only (2) gives full GL\_2(A\_f)-equivariance. Emerton’s Remark 1.1.2: the unrestricted conjecture is expected to fail when V|G\_{Q\_p} is a twist of an extension of the cyclotomic character by the trivial character (B must then be longer, Remark 6.1.23); hypothesis (b) excludes the residual shape of that case.

A proof proceeds as follows.

1. V corresponds to a closed point 𝔭 ∈ Spec T\_{ρ̄,Σ}[1/p] with ρ̄ = V̄ (promodularity and Σ large).
2. Nonzero map: Remark 6.4.3 (§4.3) gives ρ(𝔭) ⊗ π(𝔭) → Ĥ^1\_{E,ρ̄,Σ}[𝔭] nonzero, and π(𝔭) = B(V|G\_{Q\_p}) (EM11 Theorem 6.2.1).
3. Embedding: if V|G\_{Q\_p} is irreducible, B is topologically irreducible (Proposition 3.3.24, from R30.4); otherwise V|G\_{Q\_p} is a non-split extension of distinct characters and B is a non-split extension described in Propositions 3.4.2/3.4.5; a non-injective map factors through its parabolic-induction quotient (using §1.1’s absence of one-dimensional subrepresentations (EM11 Lemma 5.1.3): Ĥ^1\_E has no one-dimensional G-subrepresentations), and the adjunction between Ind\_B and Emerton’s ordinary parts plus the abelian Galois action on Ord\_B(Ĥ^1)/Ord\_B(Ĥ^1)^{ab,S} (Corollary 5.6.13) shows such maps vanish (EM11 Proposition 6.2.2; the ordinary-parts functor and its adjunction are supplied by PadicLocalLanglandsForGL2Qp R30.2).
4. Pass from Hom(V, Ĥ^1\_{E,ρ̄,Σ}[𝔭]) to Hom(V, Ĥ^1\_E) by §3.5(b) and add the unramified places by the argument of EM-PAMQ Proposition 7.8.7 (EM11 proof of Theorem 1.2.1, pp. 75–76).
5. (2): Theorem 6.2.4 (§4.2) and Theorem 6.2.13 (§4.4) give Conjectures 6.1.4 and 6.1.9, and Proposition 6.1.17 with Lemma 6.1.19 deduces Conjecture 1.1.1 for V.

**Checks.**

- For V = V\_f attached to a newform of weight k ≥ 2 and level prime to p with V̄ absolutely irreducible and V̄|G\_{Q\_p} absolutely irreducible, (2) gives Hom(V\_f, Ĥ^1\_E) ≅ B(V\_f|G\_{Q\_p}) ⊗ ⊗′\_{ℓ≠p} π\_ℓ(V\_f).
- Non-example: if V|G\_{Q\_p} = χ ⊕ χ′ is a sum of two characters, (1) only gives a nonzero map; injectivity can fail because B is then a sum of two principal series whose map may kill one summand.

*Needs:* §4.4; §4.2; §4.3; §3.5; §1.1; PadicLocalLanglandsForGL2Qp R30.2; PadicLocalLanglandsForGL2Qp R30.4.

EM11, Theorem 1.2.1, pp. 3–4: The main theorem with its two residual hypotheses, the nonzero (resp. injective) map in (1) and the isomorphism in (2) under p-distinguishedness.

EM11, Theorem 6.2.1, Proposition 6.2.2, pp. 71–72; proof of Theorem 1.2.1, pp. 75–76; Proposition 6.1.17 and Lemma 6.1.19, pp. 69–70: Nonzero map from Remark 6.4.3, the closed-embedding criterion via ordinary parts and Lemma 5.1.3, and the deduction of Conjecture 1.1.1 from Conjectures 6.1.4 and 6.1.9.

EM11, Remark 1.1.2, p. 2; Remark 6.1.23, pp. 70–71: The expected failure of the conjecture as stated when V|G\_{Q\_p} is a twist of an extension of ε by 1.

### 4.6 Mod p local–global compatibility and Serre’s adelic reformulation


Let H^1\_k = colim\_{K\_f} H^1\_ét(Y(K\_f)\_{Q̄}, k) with its G\_Q × GL\_2(A\_f)-action, and let ρ̄: G\_Q → GL\_2(k) be absolutely irreducible and modular. Suppose p > 2 and ρ̄|G\_{Q\_p} ≇ χ ⊗ (1 ∗; 0 1) and ≇ χ ⊗ (1 ∗; 0 ε̄) for every k-valued χ. Then there is a k-linear GL\_2(A\_f)-equivariant isomorphism π̄ ⊗\_k (⊗′\_{ℓ≠p} π(ρ̄|G\_{Q\_ℓ})) ≅ Hom\_{k[G\_Q]}(ρ̄, H^1\_k), where π̄ is attached to ρ̄|G\_{Q\_p} by the mod p local Langlands correspondence and π(ρ̄|G\_{Q\_ℓ}) by the mod p local Langlands correspondence for GL\_2(Q\_ℓ) in families (Emerton–Helm); equivalently ρ̄ ⊗ π̄ ⊗ ⊗′\_{ℓ≠p} π(ρ̄|G\_{Q\_ℓ}) ≅ H^1\_{k,ρ̄}[m]. Taking invariants under compact open subgroups recovers classical mod p multiplicity one results; the GL\_2(Z\_p)-socle of π̄ recovers Serre’s weights and the conductor of the away-from-p factor Serre’s level, answering Serre’s question 3.4(2) for these ρ̄.

p > 2 is required: the p = 2 statement is expected but unproved because the mod 2 local Langlands correspondence in families at ℓ ≠ 2 is incompletely understood (Emerton Remarks 1.2.7, 6.1.3, 6.1.21). The two excluded local shapes are those of Theorem 1.2.3(c); Emerton conjectures the first removable for p > 3 (Remark 1.2.9). The hypothesis ‘modular’ is used as stated; its replacement by ‘odd’ uses the full Serre conjecture (Khare–Wintenberger, Kisin), a globalisation dependence recorded in §6.5.

A proof proceeds as follows.

1. Theorem 6.2.13 (§4.4) gives Conjecture 6.1.9 for every Σ\_0 (p-distinguishedness is the first exclusion).
2. Reduce (6.1.10) mod ϖ, take m-torsion, use Lemma C.45 and the mod p fibre of π\_{Σ\_0}(ρ^m\_Σ) for p > 2 (§4.1(b)) to get ρ̄ ⊗ π̄ ⊗ π\_{Σ\_0}(ρ̄) ≅ H^1\_{k,ρ̄,Σ}[m]; pass to the limit over Σ\_0 (EM11 Proposition 6.1.20, proof of Theorem 1.2.6).
3. The proof uses only the more straightforward classical multiplicity one theorems, not level lowering at p, companion forms, or the harder part of Wiles’s Theorem 2.1(ii) (EM11 Remarks 1.2.8, 6.2.15).

**Checks.**

- For ρ̄|G\_{Q\_p} absolutely irreducible, π̄ is supersingular and its GL\_2(Z\_p)-socle is the set of Serre weights W(ρ̄), so taking GL\_2(Z\_p)K^p-invariants twisted by a Serre weight σ shows Hom\_{GL\_2(Z\_p)}(σ, H^1\_{k,ρ̄}[m]) ≠ 0 exactly for σ ∈ W(ρ̄).
- For ρ̄|G\_{Q\_p} scalar (excluded) Emerton predicts multiplicity two (Remark 6.1.22).

*Needs:* §4.4; §4.1; PadicLocalLanglandsForGL2Qp R30.3; AlgebraicModularFormsAndSerreWeights R15.4 (recipe well definedness and twisting); §2.4.

EM11, Theorem 1.2.6 and Remarks 1.2.7–1.2.10, pp. 5–6: The mod p local–global isomorphism for H^1\_k, its expected p = 2 analogue, its relation to classical multiplicity one, and the recovery of Serre’s weight and level.

EM11, Proposition 6.1.20, Remarks 6.1.21–6.1.22, p. 70; proof of Theorem 1.2.6 and Remark 6.2.15, p. 76: Derivation from Conjecture 6.1.9 by reduction mod ϖ, and the list of classical results not used.

SERRE87, §3.4, question (2), p. 198: Serre asks whether his conjecture admits a reformulation in terms of mod p representations of the adelic GL\_2; the theorem answers this for the ρ̄ it covers.

### 4.7 Dual local–global compatibility for completed homology


Assume (a) ρ̄\_p ≇ χ ⊗ (1 ∗; 0 ε), (b) p ≥ 3, (c) End\_k(ρ̄\_p) = k, ρ̄ odd absolutely irreducible unramified outside Σ ∪ {∞}. Let H̃^{BM}\_{1,ρ̄,Σ} be the ρ̄-part of completed Borel–Moore homology at levels K\_{Σ\_0} (the Pontryagin–Schikhof dual of Ĥ^1\_{c,ρ̄,Σ} ≅ Ĥ^1\_{ρ̄,Σ}). Then: (1) there is a T\_{ρ̄,Σ}[G\_Q × G\_Σ]-linear topological isomorphism H̃^{BM}\_{1,ρ̄,Σ} ≅ (π^m\_p)^\* ⊗\_{T} (ρ^m)^\* ⊗\_T π^m\_{Σ\_0}; (2) for A complete local noetherian, deformations ρ of ρ̄\_p and π of π̄\_p over A and a co-Whittaker A[G\_{Σ\_0}]-module V, End^cont\_{A[G\_{Q\_p}×G\_Σ]}(π^\* ⊗\_A ρ^\* ⊗\_A V) = A; hence End^cont\_{T[G\_Q×G\_Σ]}(H̃^{BM}\_{1,ρ̄,Σ}) = End^cont\_{T[G\_{Q\_p}×G\_Σ]}(H̃^{BM}\_{1,ρ̄,Σ}) = T\_{ρ̄,Σ} and the isomorphism of (1) is unique up to T\_{ρ̄,Σ}^×; (3) under the stronger (a)′ ρ̄\_p ≇ χ ⊗ (1 ∗; 0 ε^{±1}), (b)′ p ≥ 5 and (c), with R\_p the universal deformation ring of ρ̄\_p and P̃ the projective envelope of the dual of the socle of π̄\_p (R\_p ≅ End(P̃)), H̃^{BM}\_{1,ρ̄,Σ} ≅ (P̃ ⊗̂\_{R\_p} (ρ^m)^\*) ⊗\_T π^m\_{Σ\_0}.

Nakamura’s hypotheses (a)–(c), resp. (a)′–(b)′–(c); End(ρ̄\_p) = k makes Def(π̄\_p) representable and π^m\_p the pullback of the universal deformation. The duals are continuous T-linear duals; coadmissible modules (Nakamura Appendix B.2.4) are used for π^m\_{Σ\_0}.

A proof proceeds as follows.

1. (1): dualise §4.4 in Nakamura’s form, using the identification H̃^{BM}\_{1,ρ̄,Σ} ≅ (Ĥ^1\_{c,ρ̄,Σ})^d ≅ (Ĥ^1\_{ρ̄,Σ})^d (NAK Lemma 2.4 and §2.1.4) and Nakamura’s Lemma B.16 on duals of completed tensor products with coadmissible modules (NAK Corollary 2.5); the tame-level duality is CompletedCohomologyPartII CC.3 (tame level borel moore duality).
2. (2): by Lemma B.10 (endomorphisms of co-Whittaker modules after coefficient tensoring, SmoothRepresentationsOfLocalGroups SR.5) reduce to End(π^\* ⊗ ρ^\*) = A, which follows from End(ρ̄\_p) = k, End(π̄\_p) = k (Emerton Remark 3.3.14) and Schikhof duality (NAK Lemma 2.6, Corollary 2.7).
3. (3): π^m\_p = π\_p ⊗\_{R\_p} T with π\_p universal, so (π^m\_p)^\* ≅ π\_p^\* ⊗̂\_{R\_p} T, and π\_p^\* ≅ P̃ by Nakamura’s Proposition B.26 (Paškūnas’s theory, supplied by PadicLocalLanglandsForGL2Qp R30.5) (NAK Corollary 2.8).

**Checks.**

- Nakamura’s zeta morphisms are T\_{ρ̄,Σ}[G\_Q × G\_Σ]-linear maps out of H̃^{BM}\_{1,ρ̄,Σ}; by (2) they are determined by their values after composing with the isomorphism of (1).
- Non-example: for ρ̄\_p with End(ρ̄\_p) ≠ k (e.g. ρ̄\_p split with distinct characters), (2) fails: End(π^\* ⊗ ρ^\*) contains the idempotents of the two summands.

*Needs:* §4.4; §2.6; §1.4; CompletedCohomologyPartII CC.3 (tame level borel moore duality); CompletedCohomologyPartII CC.3 (tame level completed modules); SmoothRepresentationsOfLocalGroups SR.5; PadicLocalLanglandsForGL2Qp R30.5; PadicLocalLanglandsForGL2Qp R30.5 (dual of universal deformation); PadicLocalLanglandsForGL2Qp R30.5 (removing projective envelope).

NAK, Corollary 2.5, Lemma 2.6, p. 25; Corollary 2.7, Corollary 2.8 and its proof, p. 26: The dual local–global isomorphism for completed Borel–Moore homology, the computation of its endomorphisms as T\_{ρ̄,Σ} (so the isomorphism is unique up to units), and its description through Paškūnas’s projective envelope P̃ under the stronger hypotheses.

### 4.8 The multiplicity module of the definite quaternionic tower


In the setting of §1.6 for F = Q and B̄ split at p, let r̄: G\_{Q,Σ} → GL\_2(k) be modular of tame level K^p with r̄|G\_{Q\_p} absolutely irreducible, m ⊂ T̃\_Σ the corresponding maximal ideal and A = T̃\_{Σ,m} (§3.7). Let Π^{univ} be the orthonormalizable admissible A[G]-module with continuous G-action such that Π^{univ} ⊗\_A k(𝔭) ≅ Π(𝔭) for every 𝔭 ∈ MaxSpec A[1/p] (local Langlands in families for absolutely irreducible r̄\_p), and π̄ = Π^{univ}/mΠ^{univ}, a smooth irreducible k-representation. Define M = Hom^cont\_{A[G]}(Π^{univ}, C^0(X, O)\_m), with the m-adic topology on Π^{univ} and the subspace topology on C^0(X, O)\_m, and its Schikhof dual M^\* = Hom\_O(M, O) with the topology of pointwise convergence. Then M is O-flat, separated and complete for the p-adic topology, M = Hom^cont\_O(M^\*, O); M^\* is a finitely generated A-module; for 𝔭 ∈ MaxSpec A[1/p], M[𝔭][1/p] = k(𝔭) ⊗\_{A/𝔭} M[𝔭] ≅ Hom^cont\_G(Π(𝔭), C^0(X)[𝔭]) ≅ Hom^cont\_{A[G]}(Π(𝔭), C^0(X)\_m) is finite-dimensional, dual to M^\* ⊗\_A k(𝔭), and nonzero iff 𝔭 ∈ Supp M^\*[1/p].

r̄|G\_{Q\_p} absolutely irreducible (DLB’s Hypothèse); this makes π̄ irreducible and Π^{univ} exist as stated. Π^{univ} is a local object supplied by PadicLocalLanglandsForGL2Qp R30.5 (the deformation of π̄ over the universal deformation ring of r̄\_p, base-changed to A).

Use the following named interfaces:

- `TauCeti.DefiniteQuaternionCompleted.multiplicityModule` (constructor): M = Hom^cont\_{A[G]}(Π^{univ}, C^0(X, O)\_m).
- `TauCeti.DefiniteQuaternionCompleted.multiplicityDual` (constructor): M^\* = Hom\_O(M, O) with the topology of pointwise convergence; M = Hom^cont\_O(M^\*, O).
- `TauCeti.DefiniteQuaternionCompleted.multiplicityDual_finite` (characterisation): M^\* is a finitely generated A-module.
- `TauCeti.DefiniteQuaternionCompleted.multiplicityModule_fibre` (simp): M[𝔭][1/p] ≅ Hom^cont\_G(Π(𝔭), C^0(X)[𝔭]) for 𝔭 ∈ MaxSpec A[1/p].
- `TauCeti.DefiniteQuaternionCompleted.multiplicityModule_support` (characterisation): M[𝔭][1/p] ≠ 0 iff 𝔭 ∈ Supp M^\*[1/p].
- `TauCeti.DefiniteQuaternionCompleted.multiplicityEvaluation` (data): The evaluation map Π^{univ} ⊗̂\_A M → C^0(X, O)\_m.

**Checks.**

- `TauCeti.DefiniteQuaternionCompleted.multiplicityModule_flat` (characterisation): M is O-torsion-free and p-adically separated and complete.
- `TauCeti.DefiniteQuaternionCompleted.multiplicityDual_mod_m` (computation): dim\_k M^\*/mM^\* = dim\_k (M/ϖM)[m] ≤ dim\_k LC(X(K\_p), k) for K\_p fixing a vector of π̄.
- `TauCeti.DefiniteQuaternionCompleted.multiplicityModule_zero_degenerate` (degenerate): If C^0(X, O)\_m = 0 then M = M^\* = 0 and Supp M^\* is empty.
- `TauCeti.DefiniteQuaternionCompleted.multiplicityModule_compatibility` (compatibility): M is the quaternionic analogue of Emerton’s X(θ): Hom of the universal family into the localised completed module, with T replaced by A.

DLB, Théorème 5.4 and its proof: The evaluation map (Π^{univ} ⊗̂\_A M)[1/p] → C^0(X)\_m is shown to be an isomorphism. DLB, Proposition 13.5: Nonvanishing of M[𝔭][1/p] at every closed point is the weak local–global statement.

A proof proceeds as follows.

1. M is O-flat and p-adically complete since C^0(X, O)\_m is (closed subspace of continuous O-valued functions); Schikhof duality gives M = Hom^cont(M^\*, O) (DLB Définition 13.3).
2. Fibres: Π^{univ} ⊗\_A k(𝔭) ≅ Π(𝔭) gives Remark 13.4 directly.
3. Finite generation: M^\* is compact, so by topological Nakayama it suffices that M^\*/mM^\* is finite-dimensional; its dual (M/ϖM)[m] embeds in Hom\_{k[G]}(π̄, LC(X, k)\_m) ⊂ LC(X(K\_p), k) for K\_p fixing a nonzero vector of π̄, a finite-dimensional space since X(K\_p) is finite (DLB Lemme 13.6).
4. Finite-dimensionality and the support criterion follow from finite generation and Nakayama (DLB Lemme 13.7).

**Checks.**

- At a classical crystalline point 𝔭 (Lemma 13.9), M[𝔭] ⊗ k(𝔭) ≠ 0.
- M^\* is finitely generated over A but not in general free; its support in Spec A[1/p] is closed.

*Needs:* §1.6; §3.7; §1.7; PadicLocalLanglandsForGL2Qp R30.5; PadicLocalLanglandsForGL2Qp R30.5 (projective envelope); PadicLocalLanglandsForGL2Qp R30.5 (paskunas endomorphism rings); CompletedCohomologyPartII CC.3 (orthonormalizable and profree modules); CompletedCohomologyPartII CC.3 (coefficient module duality); mathlib:Module.support; mathlib:Module.Finite.

DLB, §13, paragraph before Définition 13.3, Définition 13.3, Remarque 13.4, p. 69; Lemmes 13.6–13.7, p. 70: The family Π^{univ} over A, π̄ = Π^{univ}/m irreducible, the module M of continuous A[G]-maps from Π^{univ} into C^0(X, O)\_m with its Schikhof dual M^\*, the fibre isomorphisms, finite generation of M^\* and the support criterion.

### 4.9 Local–global compatibility for a definite quaternion algebra


In the setting of §4.8 (F = Q, B̄ definite and split at p, r̄ modular with r̄|G\_{Q\_p} absolutely irreducible): (1) for every maximal ideal 𝔭 of A[1/p], Hom^cont\_G(Π(𝔭), C^0(X)[𝔭]) ≠ 0 (weak local–global compatibility, DLB Proposition 13.5); (2) the evaluation map (Π^{univ} ⊗̂\_A M)[1/p] → C^0(X)\_m (ϖ-adically completed tensor product) is an isomorphism; (3) for every maximal ideal 𝔭 of A[1/p], C^0(X)[𝔭] ≅ Π(𝔭)^{⊕r} as G-representations, for some integer r > 0 (Emerton’s local–global compatibility for B̄, DLB Theorem 5.4). The proof passes through the family C of classical crystalline points: σ automorphic on B̄^\*(A), unramified outside Σ, with σ\_f^{K^p} ≠ 0, σ\_p^{GL\_2(Z\_p)} ≠ 0 and r̄\_σ = r̄, giving 𝔭\_σ; C is Zariski dense in Spec A[1/p], and for 𝔭 ∈ C the locally algebraic vectors LP(X)[𝔭] lie in the image of Π(𝔭) ⊗ Hom^cont\_G(Π(𝔭), C^0(X)[𝔭]).

r̄|G\_{Q\_p} absolutely irreducible; the argument is Emerton’s, simplified by this hypothesis (DLB §5.1). The local inputs are Berger–Breuil (for crystalline absolutely irreducible ρ with Hodge–Tate weights a < b, Π(𝔭) is the universal unitary completion of σ\_p ⊗ Sym^{b−a−1} ⊗ det^a) and the existence of Π^{univ}; both are supplied by PadicLocalLanglandsForGL2Qp (R30.4, R30.5). Emerton’s functional-analytic lemmas on completed tensor products with admissible orthonormalizable A[G]-modules are used as DLB use them (separatedness, closed image, m-torsion of reductions, 𝔭-parts).

A proof proceeds as follows.

1. (1): by Lemma 13.7 it suffices that Supp M^\*[1/p] is Zariski dense; C is Zariski dense (A[1/p] acts faithfully on C^0(X)\_m, GL\_2(Z\_p)-algebraic vectors are dense (§2.2(c)) and lie in Σ\_{𝔭∈C} C^0(X)\_m[𝔭] by §2.7) (DLB Lemme 13.8); for 𝔭 ∈ C Berger–Breuil gives Hom^cont\_G(Π(𝔭), C^0(X)[𝔭]) = Hom\_G(σ\_p ⊗ W, LP(X)[𝔭]) ≠ 0 and the image statement (DLB Lemme 13.9).
2. (2) injectivity: Π^{univ} ⊗̂ M is ϖ-adically separated (Emerton [33] Lemma 3.1.16), so test mod ϖ; on m-torsion, Emerton’s Lemma B.6 identifies the source with (M/ϖ)[m] ⊗ π̄, which embeds in π̄ ⊗ Hom(π̄, LC(X, k)[m]) → LC(X, k)[m], injective as π̄ is smooth irreducible; every element of the reduction is killed by a power of m (DLB proof of Théorème 5.4).
3. (2) surjectivity: M^\* finitely generated and Π^{univ} admissible orthonormalizable give a closed image (Emerton Proposition 3.1.3 with Lemma 3.1.16); the image contains LP(X)[𝔭] for 𝔭 ∈ C, whose sum is dense.
4. (3): take 𝔭-parts of (2) with Emerton’s Lemma 3.1.17: C^0(X)[𝔭] ≅ Hom\_A(A/𝔭, M) ⊗̂ Π^{univ}[1/p] ≅ Π(𝔭) ⊗ M[𝔭][1/p], and r = dim M[𝔭][1/p] > 0 by (1).

**Checks.**

- For 𝔭 = 𝔭\_σ ∈ C with σ\_p unramified principal series and r(𝔭)|G\_{Q\_p} crystalline irreducible, r ≥ dim σ\_f^{K^p}.
- Non-example: without r̄|G\_{Q\_p} absolutely irreducible, Π^{univ} as stated need not exist and C^0(X)[𝔭] can have constituents not isomorphic to Π(𝔭).

*Needs:* §4.8; §2.2; §2.7; §3.7; PadicLocalLanglandsForGL2Qp R30.4; PadicLocalLanglandsForGL2Qp R30.5; PadicLocalLanglandsForGL2Qp R30.5 (projective envelope); CompletedCohomologyPartII CC.3 (mixed completed tensor); CompletedCohomologyPartII CC.3 (mixed tensor dual comparison); GL2AutomorphicRepresentationsAndTransfer R17.3 (global jl).

DLB, §5.1, Théorème 5.4, p. 26; §13, Proposition 13.5, Lemmes 13.8–13.9, pp. 70–71; proof of Théorème 5.4, pp. 72–73: Emerton’s local–global compatibility for the definite quaternion algebra B̄ split at p: C^0(X)[𝔭] ≅ Π(𝔭)^{⊕r}, proved through the weak statement at a Zariski-dense set of classical crystalline points, Berger–Breuil, and the evaluation isomorphism (Π^{univ} ⊗̂ M)[1/p] ≅ C^0(X)\_m.

EM11, Proposition 3.1.3, Lemmas 3.1.16–3.1.17, pp. 14–18; Lemma B.6, p. 100: The functional-analytic facts on admissible orthonormalizable A[G]-modules that DLB cite as [33].

### 4.10 The block multiplicity module


In Pan’s §3 setting (p odd, F totally real, p splitting completely, D definite and split above p, so D\_p^× = ∏\_{v|p}GL\_2(Q\_p)), let m be a maximal ideal of T\_ψ(U^p) with residual pseudo-representation ρ̄\_m, and B\_m = ⊗\_{v|p} B\_{m,v} the block of the category C\_{D\_p^×,ψ}(O) of compact O[[K\_p]]-modules with compatible D\_p^×-action and central character ψ attached to (ρ̄\_m|G\_{F\_v})\_{v|p} (with the cyclotomic twist of Remark 3.5.3). Let P\_{B\_m} be the projective envelope of the direct sum of the irreducible objects of the block (a projective generator of its compact block category), E\_{B\_m} = End(P\_{B\_m}) and R\_p^{ps,ψε^{-1}} = ⊗̂\_{v|p} R\_v^{ps,ψε^{-1}} the completed tensor product of the universal two-dimensional pseudo-deformation rings with determinant ψε^{-1}. Define m := Hom\_{C\_{D\_p^×,ψ}(O)}(P\_{B\_m}, M\_ψ(U^p)\_m). It carries two actions of R\_p^{ps,ψε^{-1}}: τ\_Gal, through T\_ψ(U^p)\_m acting on M\_ψ(U^p)\_m and the restrictions of the Hecke pseudo-representation to the decomposition groups at v | p; and τ\_Aut, through the finite central homomorphism R\_p^{ps,ψε^{-1}} → E\_{B\_m} of Pan Corollary 3.4.12, with the ε^{-1} twist in 3.5.4 acting on P\_{B\_m}. When M\_ψ(U^p)\_m lies in the block B\_m, M\_ψ(U^p)\_m ≅ m ⊗̂\_{E\_{B\_m}} P\_{B\_m}.

Blocks and projective envelopes are Paškūnas’s theory for GL\_2(Q\_p) (Pan §3.4), supplied by PadicLocalLanglandsForGL2Qp R30.5; p = 3 has a block (containing δ∘det) excluded in Theorem 3.5.5. The normalisation of Colmez’s functor in Paškūnas’s papers introduces the cyclotomic twist between ρ̄\_m|G\_{F\_v} and the block (Pan Remark 3.5.3).

Use the following named interfaces:

- `TauCeti.DefiniteQuaternionCompleted.block` (data): B\_m = ⊗\_{v|p} B\_{m,v}, the block of C\_{D\_p^×,ψ}(O) attached to (ρ̄\_m|G\_{F\_v})\_v with Pan’s cyclotomic twist.
- `TauCeti.DefiniteQuaternionCompleted.blockMultiplicity` (constructor): m = Hom\_{C\_{D\_p^×,ψ}(O)}(P\_{B\_m}, M\_ψ(U^p)\_m).
- `TauCeti.DefiniteQuaternionCompleted.galoisAction` (data): τ\_Gal: R\_p^{ps,ψε^{-1}} → End(m) through T\_ψ(U^p)\_m.
- `TauCeti.DefiniteQuaternionCompleted.automorphicAction` (data): τ\_Aut: R\_p^{ps,ψε^{-1}} → End(m) through the centre of E\_{B\_m}.
- `TauCeti.DefiniteQuaternionCompleted.blockMultiplicity_reconstruct` (characterisation): If M\_ψ(U^p)\_m lies in B\_m, m ⊗̂\_{E\_{B\_m}} P\_{B\_m} ≅ M\_ψ(U^p)\_m.

**Checks.**

- `TauCeti.DefiniteQuaternionCompleted.blockMultiplicity_zero` (degenerate): If M\_ψ(U^p)\_m has no constituent in B\_m then m = 0.
- `TauCeti.DefiniteQuaternionCompleted.blockMultiplicity_supersingular` (computation): If each ρ̄\_m|G\_{F\_v} is absolutely irreducible, E\_{B\_m} = R\_p^{ps} and τ\_Aut is the structure map of m as an E\_{B\_m}-module.
- `TauCeti.DefiniteQuaternionCompleted.blockMultiplicity_compatibility` (compatibility): On the block component, evaluation from Hom(P\_{B\_m},M) ⊗̂\_{E\_{B\_m}} P\_{B\_m} recovers M. If M belongs to a disjoint block, the Hom module is zero. This tests the choice of a projective generator of the whole block rather than one arbitrary projective object.
- `TauCeti.DefiniteQuaternionCompleted.blockMultiplicity_not_hecke` (non-example): τ\_Gal and τ\_Aut are a priori different maps; equating them is the content of Pan’s Theorem 3.5.5, not part of the definition.

PAN, Theorem 3.5.5: Local–global compatibility is the equality τ\_Gal = τ\_Aut on m. PAN, Corollary 3.5.10 and §4.7: m is finite faithful over T\_ψ(U^p)\_m and is the module patched at a one-dimensional prime. GL2ModularityLifting R32.4 (through R31.4): The block multiplicity module, finite and faithful over the completed Hecke algebra (input CC3).

A proof proceeds as follows.

1. Import each local block’s projective generator and its central pseudo-deformation map from R30.5. Pan Lemmas 3.4.10–3.4.11 and Corollary 3.4.12 construct the product-block projective generator and show the completed tensor product of pseudo-deformation rings maps finitely into its centre. They do not assert that this product map is an isomorphism; Remark 3.4.13 explicitly leaves an integral centre identification open in one case.
2. M\_ψ(U^p)\_m is a compact O[[K\_p]]-module with central character ψ^{-1} (§1.7(c)) and a compatible D\_p^×-action, so it is an object of C\_{D\_p^×,ψ}(O); Hom from P\_{B\_m} is exact on the B\_m-component.
3. τ\_Gal: T\_ψ(U^p)\_m acts on M\_ψ(U^p)\_m commuting with D\_p^×, hence on m; the Hecke pseudo-representation restricted to G\_{F\_v} gives R\_v^{ps} → T\_ψ(U^p)\_m (Pan 3.3 last paragraph). τ\_Aut: the centre of E\_{B\_m} acts on P\_{B\_m}, hence on m (Pan 3.5.4).

**Checks.**

- For ρ̄\_m|G\_{F\_v} absolutely irreducible at every v | p, each B\_{m,v} contains a single supersingular representation and E\_{B\_m} is commutative, equal to R\_p^{ps}.
- m/mm is finite-dimensional over k (Pan Corollary 3.5.11 proof).

*Needs:* §1.6; §1.7; §3.7; §3.2; PadicLocalLanglandsForGL2Qp R30.5 (blocks); PadicLocalLanglandsForGL2Qp R30.5 (local r equals t); IntegralHeckeAndGaloisDeterminants IHG.1 (universal reductive pseudocharacter ring).

PAN, §3.4, Theorems 3.4.5–3.4.6, Lemmas 3.4.10–3.4.11, Corollary 3.4.12, pp. 26–28: Paškūnas’s blocks, projective envelopes and their endomorphism rings for GL\_2(Q\_p), and the product version for D\_p^× = ∏ GL\_2(Q\_p) with a finite central map from R\_p^{ps}; no general integral centre isomorphism is asserted.

PAN, 3.5.1, Definition 3.5.2, Remark 3.5.3, 3.5.4, p. 29: The block B\_m attached to m, the module m = Hom(P\_{B\_m}, M\_ψ(U^p)\_m), and the two actions τ\_Gal and τ\_Aut of R\_p^{ps}.

### 4.11 Pan’s semisimple local–global compatibility


In the setting of §4.10 with p odd, if p = 3 assume δ∘det ∉ B\_{m,v} for every v | p. Then: (1) M\_ψ(U^p)\_m lies in the block B\_m; (2) the two actions τ\_Gal and τ\_Aut of R\_p^{ps,ψε^{-1}} on m coincide (Pan’s Theorem 3.5.5); (3) m is a faithful, finitely generated T\_ψ(U^p)\_m-module and T\_ψ(U^p)\_m is a finite R\_p^{ps,ψε^{-1}}-algebra (Corollary 3.5.10); (4) S\_ψ(U^p, k)[m] is a D\_p^×-representation of finite length (Corollary 3.5.11); (5) if 𝔭 is a maximal ideal of T\_ψ(U^p)\_m[1/p] such that for every v | p, ρ(𝔭)|G\_{F\_v} is absolutely irreducible and de Rham with distinct Hodge–Tate weights (ρ(𝔭) the semisimple representation with trace the Hecke pseudo-representation mod 𝔭), then 𝔭 is the pullback of a maximal ideal of a classical Hecke algebra T\_{(k,w),ψ}(U^pU\_p)[1/p] for some weight (k, w) and U\_p ⊂ K\_p, i.e. comes from a classical automorphic representation of (D ⊗ A\_F^∞)^× and, by Jacquet–Langlands, from a regular algebraic cuspidal automorphic representation of GL\_2(A\_F) (Corollary 3.5.12); (6) every irreducible component of T\_ψ(U^p)\_m has characteristic zero and dimension at least 1 + 2[F : Q] (Theorem 3.6.1).

Pan’s §3 hypotheses; the p = 3 exclusion concerns the block containing δ∘det. The proof relies on the semisimplicity of the Hecke action at finite levels and compares the two actions only on classical crystalline points; it does not need ρ̄\_m irreducible (it covers the residually reducible case). (5) uses the absolute irreducibility of ρ(𝔭) at every place above p; Paškūnas’s Theorem 1.10 (all irreducible subquotients of the specialisation are isomorphic) is the local input.

A proof proceeds as follows.

1. (1)–(2) follow Emerton: by the density result (§2.2(c), Pan Proposition 3.2.9) it suffices to compare the actions at classical crystalline points, where Berger–Breuil and classical local–global compatibility at p identify them (Pan proof of Theorem 3.5.5, Lemmas 3.5.6–3.5.9; local inputs from PadicLocalLanglandsForGL2Qp R30.4–R30.5).
2. (3): faithfulness from (1); finite generation over E\_{B\_m} by Paškūnas’s Proposition 4.17 (S\_ψ(U^p, E/O) is admissible), E\_{B\_m} finite over R\_p^{ps}, and τ\_Gal = τ\_Aut factors through T\_ψ(U^p)\_m (Pan Corollary 3.5.10).
3. (4): m/mm is finite-dimensional, hence of finite length over E\_{B\_m} (Pan Corollary 3.5.11).
4. (5): for 𝔭\_v the pullback to R\_v^{ps}, all irreducible subquotients of Hom^cont(P\_{B\_m,v}/𝔭\_vP\_{B\_m,v}, E) are isomorphic to one Π\_v (Paškūnas), whose locally algebraic vectors are nonzero for de Rham with distinct weights (Colmez); a nonzero map into S\_ψ(U^p)\_E[𝔭] produces locally algebraic vectors, which are classical by §2.7 (Pan proof of Corollary 3.5.12); Jacquet–Langlands is GL2AutomorphicRepresentationsAndTransfer R17.3 (global jl).
5. For (6), use Pan’s Gelfand–Kirillov dimension argument: Lemma 3.6.4 identifies the associated graded Iwasawa algebra with a polynomial ring in 3[F:Q] variables; Lemmas 3.6.9–3.6.11 control Artin–Rees, exact sequences and a central non-zero-divisor; Proposition 3.6.12 bounds the dimension of the block tensor product, and Corollary 3.6.14 bounds the special fibre. This uses the Iwasawa-dimension supplier contract above; finite commutative support lemmas do not supply it.

**Checks.**

- For F = Q (where Pan’s even-degree assumption is dropped in §3) and m non-Eisenstein with ρ̄\_m|G\_{Q\_p} absolutely irreducible, (2) recovers the R\_p-linearity of DLB’s local–global compatibility (§4.9).
- Part (5) does not apply when a local Galois representation is reducible. Some such points are classical; reducibility alone is not a counterexample to classicality.

*Needs:* §4.10; §2.2; §2.7; §2.8; PadicLocalLanglandsForGL2Qp R30.4; PadicLocalLanglandsForGL2Qp R30.5 (blocks); PadicLocalLanglandsForGL2Qp R30.5 (local r equals t); GL2AutomorphicRepresentationsAndTransfer R17.3 (global jl); AutomorphicGaloisRepresentations R19.5 (skinner full hilbert coefficient prime); mathlib:ringKrullDim.

PAN, Theorem 3.5.5 and its proof, Lemmas 3.5.6–3.5.9, pp. 29–32; Corollaries 3.5.10–3.5.12, pp. 32–33: Local–global compatibility for the definite quaternionic completed homology: it lies in the block and the Galois and automorphic actions of R\_p^{ps} agree; finiteness and faithfulness of m; finite length of the m-torsion; classicality of de Rham points absolutely irreducible at every place above p.

PAN, Theorem 3.6.1, Proposition 3.6.12, pp. 34–36: Lower bound 1 + 2[F : Q] for the dimension of every irreducible component of the localised big Hecke algebra.

### 4.12 Scholze’s functor and the completed cohomology of Shimura curves


In the setting of §1.5 (E\_0 totally real of even degree with p split, D\_0 definite split at all finite places, D with invariants exchanged at 𝔭 and ∞\_0, a globalising π as in CDN Proposition 4.5), let S\_{ψ,λ,m} = Hom\_{U^p\_𝔭}(λ, S\_ψ(U^p, L/O))\_m be the λ-typical, m-localised definite quaternionic module of D\_0 (§1.6), an admissible injective GL\_2(Q\_p)-representation in the block of r̄^{ss} (CDN Propositions 4.7–4.8). (1) There is a natural isomorphism of T\_S^{univ}[G\_{Q\_p} × D\_𝔭^×]-modules S^1(S\_{ψ,λ,m}) ≅ Ĥ^1\_{ψ,λ,m}, where S^1 is Scholze’s functor from smooth admissible GL\_2(Q\_p)-representations to D\_𝔭^× × G\_{Q\_p}-representations (the degree-one cohomology of the Lubin–Tate tower’s pro-étale torsor over P^1, with coefficients in the sheaf attached to the representation) (Paškūnas, Lemma 6.2, from Scholze). (2) ρ̄ deforms to ρ\_m: G\_{E\_0,S} → GL\_2(T(U^p)\_m) with characteristic polynomial X^2 − T\_vX + N(v)S\_v at Frob\_v (v ∉ S), and with N = Hom\_{T(U^p)\_m[G\_{E\_0,S}]}(ρ\_m, Ĥ^1\_{ψ,λ}(U^p, O)\_m) the evaluation map ρ\_m ⊗\_{T(U^p)\_m} N → Ĥ^1\_{ψ,λ}(U^p, O)\_m is an isomorphism (Carayol–Scholze isotypy). Together these turn a local question on S^1(π) into a question on completed cohomology.

Scholze’s functor S^i and its finiteness come from ScholzeFunctorAndModpCohomologyOfTheLubinTateTower SZ.0–SZ.1. Its arithmetic applications depend on this comparison, so they are not imported here. The Shimura curve here is attached to D, ramified at 𝔭; the definite algebra D\_0 is split at 𝔭, and the two are related by the exchange of invariants at 𝔭 and ∞\_0 (fixed isomorphism (4.6) away from p∞\_0). ρ̄ absolutely irreducible (SL\_2(k) ⊂ Im ρ̄\_π ⊂ GL\_2(k) by the globalisation of CDN Proposition 4.5).

A proof proceeds as follows.

1. (1) is Scholze’s comparison of the completed cohomology of the Shimura curve for D with S^1 applied to the completed degree-zero module of D\_0 in Paškūnas’s λ-typical, ψ-isotypic, m-localised form (CDN Proposition 4.11, citing [55, Lemma 6.2]); the definite-side module is §1.6 with §1.7(d).
2. (2): the deformation ρ\_m is §3.2(c) for the Shimura-curve Hecke algebra; isotypy combines Scholze’s Propositions 5.3, 5.4 and 5.8 (CDN Proposition 4.12), with the finite-level Eichler–Shimura relation for Shimura curves, which is Carayol’s construction of the Galois representations on their cohomology (AutomorphicGaloisRepresentations R19.2 (carayol sigma lambda construction)), the eigenspace decomposition being HilbertModularVarietiesAndShimuraCurves R18.4 (cohomological eigenspaces).
3. The duality (Ĥ^1\_{ψ,λ,m})^∨ ≅ Ĥ^1\_{ψ,λ}(U^p, O)\_m^d of §1.5 transports (1) to the integral completed cohomology.

**Checks.**

- CDN use (1)–(2) to show that S^1(π) for a supersingular π has G\_{Q\_p}-action through ρ̄-isotypic pieces (their §4.1.5).
- Non-example: replacing S\_{ψ,λ,m} by the modular-curve object of §1.1 is wrong: Scholze’s functor relates the definite algebra split at p to the Shimura curve ramified at p, not the modular curve to itself.

*Needs:* §1.5; §1.6; §1.7; §3.2; HilbertModularVarietiesAndShimuraCurves R18.4 (cohomological eigenspaces); AutomorphicGaloisRepresentations R19.2 (carayol sigma lambda construction); AutomorphicGaloisRepresentations R19.4 (all hilbert local global compatibility).

CDN, Propositions 4.7–4.8 and Remark 4.9, p. 49; Proposition 4.11, Proposition 4.12, p. 51: S\_{ψ,λ,m} is admissible and injective in the block of r̄^{ss}; Paškūnas’s Lemma 6.2 (after Scholze) gives S^1(S\_{ψ,λ,m}) ≅ Ĥ^1\_{ψ,λ,m}; ρ̄ deforms to ρ\_m over T(U^p)\_m and Ĥ^1\_{ψ,λ}(U^p, O)\_m ≅ ρ\_m ⊗ N.

CDN, §3.1, Théorème 3.1, pp. 40–41: Recollection of Scholze’s functor S^i and his finiteness theorem.

### Examples

When End(ρ̄_p)=k, the refined tensor comparison uses the canonical local family. A split sum of two distinct characters has a two-dimensional diagonal endomorphism algebra, so representability cannot identify the θ-family by the same argument. For Σ₀ empty the away factor is T′ on the dual side. In the Scholze comparison, the definite algebra is split at p and the Shimura-curve algebra is ramified there; using the same algebra on both sides fails the exchange-of-invariants construction.

### Dependencies

Layers 1–3 supply the completed towers, classical density, Hecke representation and Galois factorisation. PadicLocalLanglandsForGL2Qp R30.2–R30.5 supplies the exact admissible-category, ordinary-parts, Berger–Breuil, Kisin and block inputs, including their small-prime extensions. SmoothRepresentationsOfLocalGroups SR.5 supplies W, with the additional integral smooth-dual comparison specified above. CompletedCohomologyPartII CC.3 supplies corrected coadmissible tensor cancellation; ModularCurvesPartII R14.6 supplies the component-group and toric Frobenius assertions. ScholzeFunctorAndModpCohomologyOfTheLubinTateTower SZ.0–SZ.1 supplies the geometric functor. The globalisation and normalisation supplier specifications retain their stated ranges.

## Layer 5: patched completed modules and support


The patched module M\_∞ of Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin is constructed once, for GL\_n(F) with p ∤ 2n, from a definite unitary globalisation; it is finite projective over S\_∞[[K]], carries a GL\_n(F)-action commuting with the patched deformation ring, recovers completed cohomology modulo the augmentation ideal, and yields admissible Banach representations V(r) = Π\_∞[𝔪\_y]. Type-specialised patched modules are Cohen–Macaulay of rank one on the generic fibre and supported on unions of components, with Hecke algebras of types acting through the Bernstein centre. Emerton–Paškūnas show the support of M\_∞ is a union of components — not, in general, full support — and Tung proves full support on every component for GL₂(Q\_p) at odd p and at p = 2, via the p-adic local Langlands correspondence on non-ordinary components and an ordinary R = T theorem on ordinary ones; the Breuil–Mézard identities follow. On the quaternionic side completed homology itself is patched (Tung, Pan), and Pan's patching at a one-dimensional nice prime proves that the pseudo-deformation-to-Hecke map has nilpotent kernel there.
Full projected support over the local framed ring is distinct from full support over the patched ring. The latter retains auxiliary-component coverage; faithfulness also retains reducedness. The dyadic ordinary-component input requires an extension of the present odd-p supplier.

### 5.1 The patched module M∞


Let F/Q\_p be finite, n ≥ 1 with p ∤ 2n, and r̄: G\_F → GL\_n(k) continuous admitting a potentially crystalline, potentially diagonalisable lift of regular weight (automatic after extending scalars if n = 2 or r̄ is semisimple). Choose a suitable globalisation (F̃/F̃^+ CM with each place v | p of F̃^+ split and F̃^+\_v ≅ F, ρ̄: G\_{F̃^+} → 𝒢\_n(k) automorphic, irreducible on G\_{F̃}, with adequate image on G\_{F̃(ζ\_p)}, restricting to r̄ at chosen ṽ | p), a definite unitary group G̃ over F̃^+, a tame level U^p, the localised completed cohomology S̃\_{ξ,τ}(U^p, O)\_m of G̃ with fixed types ξ, τ away from p, and Taylor–Wiles data Q\_N. With R^loc = R^□\_{r̄} ⊗̂ ⊗̂\_{v ∈ S∖{p}} R^{ξ,τ}\_{ṽ} (the framed local ring at p unrestricted), R\_∞ = R^loc[[x\_1, …, x\_{q−[F̃^+:Q]n(n−1)/2}]], S\_∞ = O[[z\_1, …, z\_{n^2#T}, y\_1, …, y\_q]], K = GL\_n(O\_F) and G = GL\_n(F), the patching construction produces a compact O-module M\_∞ with commuting actions of R\_∞ and G (and of S\_∞ through a map S\_∞ → R\_∞), such that: (1) M\_∞ is finitely generated and projective over S\_∞[[K]], hence finitely generated over R\_∞[[K]]; (2) with a = (z\_i, y\_j) ⊂ S\_∞, there is a G-equivariant isomorphism M\_∞/aM\_∞ ≅ S̃\_{ξ,τ}(U^p, O)^d\_m compatible with the R^loc-action; (3) M\_∞ is projective in the category of pseudo-compact Λ[[K]]-modules (Λ the completed group ring of the centre at the determinant), and M\_∞ ⊗̂\_{Λ\_Z,x} O is a nonzero projective object of the category C(O) of pseudo-compact O[[K]]-modules with the prescribed central character and extended ZK-action. Put Π\_∞ = Hom^cont\_O(M\_∞, E) with the maximum norm, a unitary Banach representation of G with an R\_∞-action; for y: R\_∞ → O extending a point x of R^□\_{r̄}, V(r\_x) = (M\_∞ ⊗\_{R\_∞,y} O)^d[1/p] = Π\_∞[𝔪\_y] is an admissible unitary Banach representation of G. For n = 2 and F = Q\_p this is the patched module of Tung’s odd-p work and of Emerton–Paškūnas.

p ∤ 2n; r̄ has a potentially diagonalisable regular-weight potentially crystalline lift (CEGGPS §2.1, Lemma 2.2). M\_∞ depends on the global choices (globalisation, U^p, Q\_N, ultrafilter or diagonal subsequence); V(r) is not known to be independent of them or nonzero in general (CEGGPS Remark 2.14). The globalisation uses Emerton–Gee Corollary A.7 and potential automorphy (BLGGT); these are globalisation inputs audited in §6.5.

Use the following named interfaces:

- `TauCeti.PatchedCompletedModule.patchedModule` (constructor): M\_∞, a compact O-module with commuting actions of R\_∞ and G = GL\_n(F), and an S\_∞[[K]]-module structure through S\_∞ → R\_∞.
- `TauCeti.PatchedCompletedModule.patchedModule_projective` (characterisation): M\_∞ is finitely generated projective over S\_∞[[K]], hence finitely generated over R\_∞[[K]].
- `TauCeti.PatchedCompletedModule.patchedModule_augmentation` (compatibility): M\_∞/aM\_∞ ≅ S̃\_{ξ,τ}(U^p, O)^d\_m, G-equivariantly and compatibly with the R^loc-action.
- `TauCeti.PatchedCompletedModule.patchedModule_pseudocompactProjective` (characterisation): M\_∞ is projective among pseudo-compact Λ[[K]]-modules; M\_∞ ⊗̂\_{Λ\_Z,x} O is a nonzero projective object of C(O).
- `TauCeti.PatchedCompletedModule.patchedBanach` (constructor): Π\_∞ = Hom^cont\_O(M\_∞, E) with its R\_∞-action and unitary G-action.
- `TauCeti.PatchedCompletedModule.fibreBanach` (constructor): V(r\_x) = Π\_∞[𝔪\_y] = (M\_∞ ⊗\_{R\_∞,y} O)^d[1/p] for y: R\_∞ → O over x.
- `TauCeti.PatchedCompletedModule.fibreBanach_admissible` (characterisation): V(r\_x) is an admissible unitary Banach representation of G.

**Checks.**

- `TauCeti.PatchedCompletedModule.patchedModule_zero_dual` (degenerate): The continuous O-dual of the zero compact module is the zero Banach representation. A claimed nonzero V(r\_x) requires the support argument, not merely this dual construction.
- `TauCeti.PatchedCompletedModule.patchedModule_augmentation_compatibility` (compatibility): Reducing M\_∞ modulo a recovers the Pontryagin–Schikhof dual of the localised completed cohomology of the definite unitary group (CEGGPS Corollary 2.11).
- `TauCeti.PatchedCompletedModule.patchedModule_mod_varpi` (computation): M\_∞/(ϖ, 𝔪\_{R\_∞}) is a finitely generated k[[K]]-module whose Pontryagin dual is an admissible smooth G-representation over k.
- `TauCeti.PatchedCompletedModule.patchedModule_not_completed_cohomology` (non-example): Only M\_∞/aM\_∞ is identified with the completed cohomology dual. The construction retains the commuting S\_∞[[K]] and R\_∞ actions before quotienting; finite generation over R\_∞[[K]] does not assert an R\_∞-rank or an identification with that quotient.

TUNG-P3, §§3–4: The support of M\_∞(σ) meets every component of the potentially semistable ring, giving Breuil–Mézard for odd p (input CC4). EP, §6: Support of M\_∞ in Spec R\_∞ is a union of irreducible components. DING, §4.1: Π\_∞ and the patched eigenvariety built from J\_B(Π\_∞^{R\_∞-an}) (the eigenvariety itself is assigned to the Part II design). GL2ModularityLifting R22.1 and R32.2 (through R31.5): Tung’s odd-prime Breuil–Mézard input and the de Rham lifting theorem (input CC4).

A proof proceeds as follows.

1. Globalise r̄ (EG14 Corollary A.7) and set up the definite unitary group, its algebraic modular forms and Hecke algebras (PotentialAutomorphyInfrastructurePartII PL.2 (definite unitary group), PL.2/unitary-algebraic-modular-forms, PL.2/unitary-hecke-algebra) and the polarized global deformation problem with its universal ring R^{univ}\_S and Taylor–Wiles primes (GlobalGaloisDeformations G7 (polarized deformation problem), G7/polarized-representability, G7/enormous-taylor-wiles-primes); the local framed rings are LocalGaloisDeformationRings R08.1 (local lifting ring) (CEGGPS §§2.1–2.6).
2. Define M\_{1,Q\_N} as the Pontryagin dual of the projected localised forms at level U\_1(Q\_N)\_{2N} with O/ϖ^N coefficients; each is a finite projective (O/ϖ^N)[Δ\_{Q\_N}][Γ\_{2N}]-module with partial G-actions α\_N: M\_{1,Q\_N} → Ind^{G\_N}\_{KZ}((M\_{1,Q\_N})\_{K\_N}) (CEGGPS §2.8, Remark 2.9).
3. Patch by the Taylor–Wiles–Kisin method (DeformationAndDerivedPatchingAlgebra R03.5 (patched module), R03.5/patched-ring-action, R03.5/patching-extraction): pass to the limit along a compatible subsystem to get M\_∞ with R\_∞- and S\_∞[[K]]-actions and α\_∞: M\_∞ → Ind^G\_{KZ} M\_∞; Proposition 2.10 shows M\_∞ is finite projective over S\_∞[[K]] (splitting a surjection from S\_∞[[K]]^r using projectivity at each finite level), α\_∞ is injective with G-stable image, giving the G-action.
4. (2) is the limit of the level-N isomorphisms ψ (CEGGPS Corollary 2.11), whose G-equivariance uses the analogue of Proposition 2.10 for completed cohomology (the degree-zero identification of CompletedCohomologyPartII CC.8 (definite unitary degree zero), stated there for LLHLM’s definite GL\_3; its extension to the rank-n definite unitary groups of CHT/Thorne type is supplied by CC.8); (3) is Proposition 4.23 (pro-free over Λ[[P]] for a pro-p Sylow P) and Corollary 4.26.
5. Admissibility of V(r): (M\_∞ ⊗\_{R\_∞,y} F)^{K\_N} is finite-dimensional because M\_∞ is finite over S\_∞[[K]] and ker y induces an open ideal of S\_∞ (CEGGPS Proposition 2.13).

**Checks.**

- The augmentation quotient recovers the global completed cohomology dual. Even for n = 1, the global choices can introduce multiplicity; no free rank-one R\_∞-module assertion follows from the construction.
- For n = 2, F = Q\_p and r\_x absolutely irreducible, the local–global compatibility of §5.4 identifies V̌(Π\_y) with r\_x^{⊕n\_y}.

*Needs:* PotentialAutomorphyInfrastructurePartII PL.2 (definite unitary group); PotentialAutomorphyInfrastructurePartII PL.2 (unitary algebraic modular forms); PotentialAutomorphyInfrastructurePartII PL.2 (unitary hecke algebra); GlobalGaloisDeformations G7 (polarized deformation problem); GlobalGaloisDeformations G7 (polarized representability); GlobalGaloisDeformations G7 (enormous taylor wiles primes); LocalGaloisDeformationRings R08.1 (local lifting ring); DeformationAndDerivedPatchingAlgebra R03.5 (patched module); DeformationAndDerivedPatchingAlgebra R03.5 (patched ring action); DeformationAndDerivedPatchingAlgebra R03.5 (patching extraction); CompletedCohomologyPartII CC.8 (definite unitary degree zero); CompletedCohomologyPartII CC.3 (definite degree zero dual interface); mathlib:Module.Projective; mathlib:MvPowerSeries.

CEGGPS, §2.1, Lemma 2.2, pp. 15–17; §2.8 and Remark 2.9, pp. 24–26; definitions of R\_∞ and S\_∞, p. 27: The globalisation of r̄, the finite-level modules M\_{1,Q\_N} with partial G-actions, and the patching rings R\_∞ = R^loc[[x]] and S\_∞ = O[[z, y]].

CEGGPS, Proposition 2.10, p. 30; Corollary 2.11, p. 33; §2.12 and Proposition 2.13, Remark 2.14, pp. 33–34: M\_∞ is finitely generated projective over S\_∞[[K]] with a G-action; M\_∞/aM\_∞ recovers the dual of localised completed cohomology; V(r) is admissible unitary.

CEGGPS, Proposition 4.23 and Corollary 4.26, pp. 68–70: M\_∞ is projective among pseudo-compact Λ[[K]]-modules, and its specialisation at a central character is a nonzero projective object of C(O).

DING, §4.1, p. 63: Π\_∞ := Hom^cont(M\_∞, E) with the maximum norm is a unitary Banach representation of GL\_n(K) with an action of R\_∞ ≅ R^□\_ρ̄ ⊗̂ R^℘\_∞.

TUNG-P3, §3, Definition 3.2 and the definition of Π\_∞, Π\_y, pp. 9–10: For n = 2, F = Q\_p: Π\_y = Π\_∞[𝔪\_y] is admissible unitary (CEGGPS Proposition 2.13); the support of M\_∞(σ) defines the automorphic components.

### 5.2 Type-specialised patched modules and their support


In the setting of §5.1, for a K-stable O-lattice σ° in a locally algebraic type σ = σ^{(cr)}(λ, τ) (algebraic of highest weight λ tensored with the K-type attached to an inertial type τ by the inertial local Langlands correspondence), put M\_∞(σ°) = (Hom^cont\_{O[[K]]}(M\_∞, (σ°)^d))^d ≅ lim\_n Hom^cont\_{O[[K]]}(M\_∞, (σ°/ϖ^n)^∨)^∨. Let R\_∞(σ)′ = R\_∞ ⊗\_{R^□\_{r̄}} R^□\_{r̄}(σ) (potentially crystalline ring of type σ) and R\_∞(σ) the quotient acting faithfully on M\_∞(σ°). Then: (1) R\_∞(σ) is a reduced O-torsion-free quotient of R\_∞(σ)′; (2) M\_∞(σ°) is finitely generated over R\_∞(σ) and Cohen–Macaulay, M\_∞(σ°)[1/p] is locally free of rank one over R\_∞(σ)[1/p] (in the potentially crystalline case; over the regular locus of the support in Tung’s potentially semistable variant), and the topology is the m-adic one; (3) the support of M\_∞(σ°) in Spec R\_∞(σ)′ is a union of irreducible components (its automorphic components); (4) the Hecke algebra H(σ) = End\_G(c-Ind^G\_K σ) acts on M\_∞(σ°)[1/p] through the map H(σ) → R^□\_{r̄}(σ)[1/p] interpolating the Bernstein-centre local Langlands correspondence (local–global compatibility at p); (5) if x is a closed point of Spec R\_∞(σ)[1/p] with π\_sm(r\_x) generic, then V(r\_x)\_{l.alg} ≅ π\_sm(r\_x) ⊗ π\_alg(r\_x), the Breuil–Schneider representation.

σ potentially crystalline (σ^{cr}) in CEGGPS; Tung’s and Pyvovarov’s potentially semistable variants σ(λ, τ) give the same statements with ‘regular locus of the support’ in (2). Genericity of π\_sm(r\_x) is needed in (5).

A proof proceeds as follows.

1. M\_∞(σ°) is finite projective (free) over S\_∞, being a direct summand of Hom(S\_∞[[K]]^r, (σ°)^d)^d (CEGGPS proof of Lemma 4.18); the comparison with completed homology modulo a is §2.8’ unitary analogue (CEGGPS Lemma 4.14, Remark 4.16).
2. (1)–(3): classical local–global compatibility at ṽ | p at finite auxiliary levels shows the R\_∞-action factors through R\_∞(σ)′; Cohen–Macaulayness from freeness over S\_∞ and dim R\_∞(σ) = dim S\_∞; support a union of components by depth (DeformationAndDerivedPatchingAlgebra R03.6 (supported on components); CEGGPS Lemmas 4.17–4.18).
3. (4) is CEGGPS Theorem 4.1 and Theorem 4.19 (the map η: H(σ) → R^□(σ)[1/p] of Theorem 4.1, with its integrality Lemma 4.17(2)), using Bernstein-centre local Langlands (CEGGPS §3, SmoothRepresentationsOfLocalGroups SR.5 integral Bernstein blocks).
4. (5): x is a smooth point of Spec R\_∞(σ), so M\_∞(σ°) is locally free of rank one there; Propositions 4.33–4.34 compute V(r\_x)\_{l.alg} ≅ π ⊗ π\_alg(r\_x) with π in the Bernstein component Ω and identify π with π\_sm(r\_x) when generic (CEGGPS Theorem 4.35).

**Checks.**

- For σ = the trivial type of weight λ = (1, 0) (Barsotti–Tate, τ trivial), R^□(σ) is the crystalline Barsotti–Tate ring and M\_∞(σ°) is the classical patched module of Kisin’s method.
- Non-example: support on a union of components is not full support; Cohen–Macaulayness alone does not give support on every component (DeformationAndDerivedPatchingAlgebra R03.6).

*Needs:* §5.1; §2.8; LocalGaloisDeformationRings R08.3 (pst deformation ring); LocalGaloisDeformationRings R08.3 (pcris generic smooth); LocalGaloisDeformationRings R08.3 (hodge and galois types); DeformationAndDerivedPatchingAlgebra R03.6 (supported on components); DeformationAndDerivedPatchingAlgebra R03.3 (free of maximal depth regular local); DeformationAndDerivedPatchingAlgebra R03.3 (degree indexed multiplicity); SmoothRepresentationsOfLocalGroups SR.5.

CEGGPS, Theorem 4.1, p. 51; Lemma 4.14, Remark 4.16, Lemma 4.17, Lemma 4.18, Theorem 4.19, pp. 60–66: The patched modules M\_∞(σ°), the reduced quotient R\_∞(σ), Cohen–Macaulayness and rank-one local freeness, support a union of irreducible components, and compatibility of the Hecke algebra H(σ) with the Bernstein-centre map to the potentially crystalline ring.

CEGGPS, Propositions 4.33–4.34 and Theorem 4.35, pp. 72–74: Locally algebraic vectors of V(r\_x) are π\_sm(r\_x) ⊗ π\_alg(r\_x) for generic π\_sm(r\_x).

TUNG-2, Proposition 5.2.2, p. 27: The same statements for the quaternionic patched module in Tung’s 2-adic setting, with potentially semistable types.

### 5.3 Support of the patched module (Emerton–Paškūnas)


In the CEGGPS setting: (1) define the R\_∞ support of M\_∞ to be V(Ann\_{R\_∞} M\_∞); EP Lemma 6.2 justifies this support convention for modules finite over R\_∞[[K]], and EP Theorem 6.3 makes it a union of irreducible components of Spec R\_∞. (2) The closure of crystalline points in its rigid support is a union of components (EP Theorem 6.5). (3) If the unrestricted local framed ring R^□\_{r̄} is irreducible, the image of that support in Spec R^□\_{r̄} is everything (EP Remark 6.4, Corollary 5.5). Full support over R\_∞ additionally requires that every auxiliary component is met; irreducibility of R^□\_{r̄} alone does not imply it. If R\_∞ itself is irreducible and M\_∞ is nonzero, (1) gives full R\_∞ support. Full support means the annihilator is nil; for a Noetherian ring it is nilpotent, and for a reduced ring it is zero. (4) For n = 2, F = Q\_p and every odd p, Tung Proposition 3.9 proves faithfulness of R\_∞^ψ on V̌(M\_∞^ψ). Its proof uses irreducibility and reducedness of the unrestricted local framed ring (including the exceptional nonsmooth cases) and the chosen irreducible auxiliary factors. No residual exclusions are imposed on Proposition 3.9 itself.

For a finitely generated A[[K]]-module, Supp\_A is V(annihilator); generators over A[[K]] generate an A-submodule with the same support (EP Lemma 6.2). For (4), keep the all-odd-p irreducibility and reducedness input of Tung Proposition 3.9. Formal smoothness is only a sufficient special case. Auxiliary local components must be chosen as in that construction; the EP union-of-components theorem alone does not prove faithfulness.

The representative `annihilator_span_eq` in Suggested.lean states the algebra used for the finite span: for a commutative ring R acting on M, a ring B acting R-linearly, and a subset S with B-span equal to M, Ann_R(span_R S)=Ann_R(M). The actions must commute; without that hypothesis, an element killing S need not kill its B-span. The case M=0 is allowed. Checks are the regular module with S={1}, a quotient R/I with S={1 mod I} giving annihilator I, and the empty generating set for the zero module giving the unit ideal.

A proof proceeds as follows.

1. (1): algebraic representations of K capture every projective object (EP Proposition 3.1), so the support of M\_∞ is the closure of the union of supports of the M\_∞(ξ) for algebraic ξ; each is reduced (CEGGPS Lemma 4.17), and by (2) the support of M\_∞[1/p] is a union of components; p-torsion-freeness passes this to Spec R\_∞ (EP Theorem 6.3).
2. (2) follows the infinite-fern approach of Chenevier and Nakamura, with Breuil–Hellmann–Schraen’s patched Jacquet module to make the argument sensitive to the support of M\_∞ (EP Theorem 6.5).
3. (3): EP Remark 6.4 concludes full projected support over R^□\_{r̄}. To conclude full R\_∞ support, supply irreducibility of the entire patched ring or coverage of each auxiliary component. Then V(Ann M\_∞) = Spec R\_∞ implies Ann M\_∞ is nil, Noetherianity makes it nilpotent, and reducedness implies Ann M\_∞ = 0. The finite-module support criterion is applied only to the finite span of Iwasawa generators (EP Lemma 6.2) or to typed modules.
4. (4): Tung Proposition 3.9 combines EP support, irreducibility and reducedness of R^□\_{r̄} for every odd p, and the chosen auxiliary factors. Split off the central determinant variables R\_∞ ≅ R\_∞^ψ ⊗̂ Λ\_Z; Theorem 3.7 and Corollary 3.8 identify the Colmez Cayley–Hamilton action and preserve faithfulness.

**Checks.**

- If p ≥ 5, r̄ is absolutely irreducible and its framed ring is formally smooth, the projected support in Spec R^□\_{r̄} is full. Full support of the patched ring still retains the auxiliary-component condition; reducedness is needed to deduce faithfulness from it.
- Theorem 6.3 gives support on a union of components, so Tung’s Proposition 3.9 keeps its irreducibility, reducedness and density inputs.

*Needs:* §5.1; §5.2; LocalGaloisDeformationRings R08.1 (local lifting ring); DeformationAndDerivedPatchingAlgebra R03.6 (supported on components); PadicLocalLanglandsForGL2Qp R30.3 (montreal functor); mathlib:Module.annihilator; mathlib:PrimeSpectrum.zeroLocus.

EP, Definition 6.1, Lemma 6.2, Theorem 6.3, Remark 6.4, Theorem 6.5, pp. 25–26; Theorem 1.8, p. 3: The support of M\_∞ in Spec R\_∞ is a union of irreducible components, via density of crystalline points in the support; full support follows when the framed ring is irreducible.

TUNG-P3, Propositions 3.4–3.5, Theorem 3.7, Corollary 3.8, Proposition 3.9, pp. 10–12: For GL\_2(Q\_p): M\_∞^ψ carries an arithmetic action, V̌(M\_∞^ψ) is finitely generated over R\_∞^ψ, and R\_∞^ψ acts faithfully on V̌(M\_∞^ψ) when Spec R^□\_{r̄} is irreducible and reduced.

### 5.4 Full support of patched modules for GL₂(Q_p), p odd (Tung)


Let p > 2, F = Q\_p, n = 2 in §5.1, and fix a determinant ψ. (1) For every closed point y ∈ Spec R\_∞[1/p] whose Galois representation r\_x is absolutely irreducible, V̌(Π\_y) ≅ r\_x^{⊕n\_y} for some n\_y ≥ 1, where V̌ is Colmez’s functor in Paškūnas’s normalisation and Π\_y = Π\_∞[𝔪\_y] ; separately Corollary 3.10 gives Π_y ≠ 0 for every closed characteristic-zero y, including reducible r_x. Hence M\_∞(σ°)[1/p] is supported on every component of R\_∞(σ)[1/p] that is non-ordinary at p, for every locally algebraic type σ (Tung Theorem 4.1). (2) If moreover r\_x is potentially semistable with π\_sm(r\_x) generic, then V̌(Π\_y) ≅ r\_x, so n\_y = 1 on an open dense set of closed points (Corollary 4.3). (3) For σ = σ(λ, τ) or σ^{cr}(λ, τ), every irreducible component of R^□\_{r̄}(σ)[1/p] is automorphic (meets the support of M\_∞(σ°)), except possibly the semistable non-crystalline component when r̄ ≅ (ω ∗; 0 1) ⊗ χ, λ = (a + 1, a) and τ = η ⊕ η (Proposition 4.4). (4) Breuil–Mézard: for each smooth irreducible k-representation σ̄ of GL\_2(Z\_p) there is a four-dimensional cycle C\_σ̄(r̄) of R^{□,ψ}\_{r̄}, independent of λ and τ, with Z(R^{□,ψ}\_{r̄}(λ, τ)/ϖ) = Σ\_σ̄ m\_σ̄(λ, τ) C\_σ̄(r̄) and the analogous identity for the potentially crystalline rings (Theorem 1.2); consequently every component of R^□\_{r̄}(σ)[1/p] is automorphic, the exception of (3) included (Corollary 4.6, through Emerton–Gee’s Theorem 5.5.2). (5) Global consequence (Theorem 4.7): for F a totally real field in which p splits completely and ρ: G\_{F,S} → GL\_2(O) continuous with ρ̄ modular, ρ̄|G\_{F(ζ\_p)} absolutely irreducible and ρ|G\_{F\_v} potentially semistable with distinct Hodge–Tate weights for each v | p, ρ comes up to twist from a Hilbert modular form.

p > 2. (5) assumes ρ̄ modular (residual modularity); the globalisations inside the proofs (Tung Lemmas 4.3.3–4.3.4 in the dyadic paper, CEGGPS’s potential automorphy, Barnet-Lamb–Gee–Geraghty Theorem A.4.1 on the reducible locus) are audited for independence from Serre’s conjecture in §6.5. Barnet-Lamb–Gee–Geraghty’s Theorem A.4.1 assumes a potentially automorphic residual seed (retained in §6.5). The local consequence (4) is a statement about local deformation rings proved through global patching; consumers cite it from this node (it stays downstream of the local inputs in R30.6).

A proof proceeds as follows.

1. (1): V̌(M\_∞) is finitely generated over R\_∞ (Tung Corollary 3.8) and R\_∞ acts faithfully (§5.3(4)); for absolutely irreducible r\_x the action of R\_∞[[G\_{Q\_p}]] ⊗ κ(y) on V̌(Π\_y) factors through the Cayley–Hamilton quotient g^2 − tr r\_x(g) g + det r\_x(g) (Theorem 3.7), so V̌(Π\_y) ≅ r\_x^{⊕n\_y} by Boston–Lenstra–Ribet, and n\_y ≥ 1 since V̌(Π\_y) ≠ 0 (Corollary 3.10) (TUNG-P3 Theorem 4.1); Colmez’s functor and Paškūnas’s theory are supplied by PadicLocalLanglandsForGL2Qp R30.3 and R30.5.
2. (2): an absolutely irreducible subrepresentation Π of Π\_y has no SL\_2(Q\_p)-invariants (Lemma 4.2), so V̌(Π) ≅ r\_x, and a multiplicity computation through Paškūnas’s category gives V̌(Π\_y) ≅ r\_x (TUNG-P3 Corollary 4.3).
3. (3): by (1) only the components in the reducible locus remain; their points are extensions of de Rham characters, treated through Barnet-Lamb–Gee–Geraghty Theorem A.4.1 except in the stated semistable case (TUNG-P3 Proposition 4.4).
4. (4): from (3) and the Paškūnas/Emerton–Gee equivalence between automorphy of all components and the cycle identities, applied type by type (TUNG-P3 Theorem 1.2), then Emerton–Gee’s Theorem 5.5.2 for the remaining component (Corollary 4.6).
5. (5): the Taylor–Wiles–Kisin argument of Kisin’s Theorem 2.2.18 and Hu–Tan’s Theorem 6.3 with all components automorphic (TUNG-P3 Theorem 4.7).

**Checks.**

- For r̄ absolutely irreducible and σ crystalline of weight (k−1, 0) with 2 ≤ k ≤ p, (3) recovers the automorphy of every component of the crystalline ring; formal smoothness is an additional local property only in the range of the relevant Fontaine–Laffaille smoothness theorem.
- Non-example: (3) does not follow from a union-of-components support statement alone; it uses the p-adic local Langlands input of (1).

*Needs:* §5.3; §5.2; §5.1; PadicLocalLanglandsForGL2Qp R30.3 (montreal functor); PadicLocalLanglandsForGL2Qp R30.3 (cdp correspondence); PadicLocalLanglandsForGL2Qp R30.4; PadicLocalLanglandsForGL2Qp R30.5; PadicLocalLanglandsForGL2Qp R30.5 (projective envelope); LocalGaloisDeformationRings R08.3 (pst deformation ring); LocalGaloisDeformationRings R08.3 (pst generic fibre); DeformationAndDerivedPatchingAlgebra R03.6 (nearly faithful and component support conclusions); DeformationAndDerivedPatchingAlgebra R03.6 (cycle specialization multiplicity).

TUNG-P3, Theorem 1.2, p. 4; Corollary 3.8, Corollary 3.10, pp. 11–12; Theorem 4.1, Lemma 4.2, Corollary 4.3, pp. 12–13; Proposition 4.4, Corollary 4.6, Theorem 4.7, pp. 14–16: For p > 2: V̌(Π\_y) ≅ r\_x^{⊕n\_y} at absolutely irreducible points (n\_y = 1 at generic potentially semistable points); automorphy of every component of the potentially semistable rings except one semistable case, then of all of them after the Breuil–Mézard identities; and the totally real automorphy theorem under residual modularity.

### 5.5 Patched completed homology of a definite quaternion algebra


In the setting of §1.6 (F totally real, p split, D definite and split above p) with a non-Eisenstein maximal ideal m of T^S\_ψ(U^p), a global deformation problem S for ρ̄\_m (local conditions D\_{v,ψ} at v | p, odd conditions at real places, Steinberg conditions at Σ, an auxiliary place v\_1) and Taylor–Wiles data (Q\_N, {α\_v}), the patching of the completed homology modules M\_ψ(U^p\_{Q\_N})\_m produces: a pseudo-compact O\_∞[[K\_p]]-module M̃\_∞ with compatible G\_p = ∏\_{v|p}GL\_2(F\_v)-action, a patched deformation ring R̃\_∞ (a power series ring over R^loc = ⊗̂\_{v∈S} R\_v) acting on it, and an ideal a ⊂ O\_∞ = O[[y\_1, …, y\_q]] (with framing variables) such that M̃\_∞/aM̃\_∞ ≅ M\_ψ(U^p)\_m G\_p- and R^S\_ψ-equivariantly. For an open ideal J and U\_p ⊂ K\_p the specialisations O\_∞/J ⊗ M̃\_∞ recover patched finite-level modules; M̃\_∞ is projective in the category of pseudo-compact O\_∞[[K\_p]]-modules with central character. Pan’s variant at a one-dimensional prime patches the localisation at a prime q of the pseudo-deformation ring instead (patched completed homology, Pan Definition 4.5.6).

Tung’s 2-adic setting: 2 splits completely in F, v\_1 chosen so that U^pU\_p is sufficiently small; Pan’s residually irreducible §8: p > 2, F with p completely split. This is the quaternionic analogue of §5.1 (definite quaternion algebra instead of definite unitary group); the general patching formalism is DeformationAndDerivedPatchingAlgebra R03.5.

Use the following named interfaces:

- `TauCeti.PatchedCompletedModule.quaternionicPatched` (constructor): M̃\_∞, a pseudo-compact O\_∞[[K\_p]]-module with compatible G\_p-action and an R̃\_∞-action.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_augmentation` (compatibility): M̃\_∞/aM̃\_∞ ≅ M\_ψ(U^p)\_m, G\_p- and Hecke-equivariantly.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_projective` (characterisation): M̃\_∞ is projective among pseudo-compact O\_∞[[K\_p]]-modules with the fixed central character.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_finiteLevel` (simp): O\_∞/J ⊗\_{O\_∞[[U\_p]]} M̃\_∞ recovers the patched finite-level module at level U\_p and open ideal J.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_typed` (constructor): M̃\_∞(σ°) = σ° ⊗\_{O[[K\_p]]} M̃\_∞ for a locally algebraic type σ.

**Checks.**

- `TauCeti.PatchedCompletedModule.quaternionicPatched_augmentation_test` (compatibility): Setting all patching variables to zero recovers M\_ψ(U^p)\_m.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_trivial_type` (computation): If the central character is trivial on the centre of K\_p and the finite level is sufficiently small, the trivial-type augmentation M̃\_∞(1)/a is the dual of S\_ψ(U^pK\_p,O)\_m, finite free over O. A trivial type incompatible with the fixed central character does not give this assertion.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_no_TW_degenerate` (degenerate): Setting q = 0 removes Taylor–Wiles variables but may leave framing variables: O\_∞ need not be O. Only if all framing and patching variables are absent is a = 0 and the augmentation identity identifies M̃\_∞ with the unpatched completed homology.

TUNG-2, §§5–8: The support of M̃\_∞(σ°) meets every component of R̃\_∞(σ), giving Breuil–Mézard at p = 2 and Theorem 8.0.1. PAN, §4.6–4.8 and §8.4: Full support of the patched completed homology at a nice prime, resp. in the residually irreducible case. GL2ModularityLifting R32.3 (typed component specialisation): Tung’s dyadic patched modules (input CC4).

A proof proceeds as follows.

1. Completed homology at auxiliary levels: M\_ψ(U^p\_{Q\_N}) is flat over O[Δ\_{Q\_N}] and its Δ\_{Q\_N}-coinvariants recover M\_ψ(U^p) (Pan Lemma 4.4.2, Corollary 4.4.3; Tung-2 §4.5).
2. Taylor–Wiles primes for the quaternionic problem (Tung-2 Lemma 4.4.1; Pan §4.3 at a one-dimensional prime) from GlobalGaloisDeformations R04.5.
3. Patch by ultraproducts or compatible subsequences (DeformationAndDerivedPatchingAlgebra R03.5 (patched module), R03.5/patched-ring-action) to get M̃\_∞, R̃\_∞ and a with M̃\_∞/aM̃\_∞ ≅ M\_ψ(U^p)\_m (Tung-2 Propositions 4.6.5–4.6.6; Pan Definition 4.5.6, Proposition 4.5.8; Pan §8.3).
4. Projectivity: each finite-level module is projective over O/ϖ^n[Δ][K\_p/U\_p] by §1.7(c), and projectivity passes to the patched limit (Tung-2 Corollary 4.2.2 and §4.6).

**Checks.**

- Specialising M̃\_∞ at the augmentation ideal and at a locally algebraic type σ gives the type-specialised module of §2.8.
- Gee–Newton’s patched complex (CompletedCohomologyPartII CC.4 (patched perfect model import)) is the higher-degree analogue; in degree zero the complex is the module M̃\_∞.

*Needs:* §1.6; §1.7; §3.7; §3.2; GlobalGaloisDeformations R04.5 (taylor wiles datum); GlobalGaloisDeformations R04.5 (odd taylor wiles primes); GlobalGaloisDeformations R04.5 (dyadic taylor wiles primes); GlobalGaloisDeformations R04.3 (global framed ring); GlobalGaloisDeformations R04.3 (local to global presentation); LocalGaloisDeformationRings R08.1 (local lifting ring); DeformationAndDerivedPatchingAlgebra R03.5 (patched module); DeformationAndDerivedPatchingAlgebra R03.5 (patched ring action); CompletedCohomologyPartII CC.4 (patched perfect model import).

TUNG-2, §4.2, Definition 4.2.1, Corollary 4.2.2, Lemma 4.2.4, Proposition 4.2.5, pp. 18–20; Lemma 4.4.1, p. 21; Propositions 4.6.5–4.6.6, pp. 25–26: Completed homology M\_ψ(U^p) of the definite quaternionic tower, its projectivity, the big Hecke algebra and ρ\_m, Taylor–Wiles data, and the patched module M̃\_∞ with M̃\_∞/a ≅ M\_ψ(U^p)\_m.

PAN, §4.4, Lemma 4.4.2, Corollary 4.4.3; §4.5, Definition 4.5.6, Proposition 4.5.8, pp. 52–59; §8.2–8.3, pp. 126–129: Completed homology with auxiliary levels, patched completed homology at a one-dimensional prime, and patching of completed homology in the residually irreducible case.

### 5.6 Full support at p = 2 (Tung)


In the setting of §5.5 with p = 2 splitting completely in F (F\_v ≅ Q\_2 for v | 2), ρ̄ modular with non-solvable image, totally odd fixed determinant ψε, odd deformation conditions at the real places, Steinberg conditions at Σ and the auxiliary place v\_1: (1) (Lemma 5.3.2) for a locally algebraic type σ the following are equivalent: (a) the support of the unpatched module M(σ°)[1/2] meets every irreducible component of Spec R^loc(σ)[1/2]; (b) M̃\_∞(σ°)[1/2] is a faithful R̃\_∞(σ)[1/2]-module, locally free of rank one over the regular locus of its support; (c) R^S\_ψ(σ) is a finite O-algebra and M(σ)[1/2] is a faithful R^S\_ψ(σ)[1/2]-module (M(σ) the type-specialised finite-level module of §2.8); (d)–(e) the Hilbert–Samuel multiplicity, resp. cycle, of R̃\_∞^{inv}(σ)/ϖ equals Σ\_a m\_a μ′\_a(ρ̄), resp. Σ\_a m\_a Z′\_a(ρ̄), over Serre weights a with multiplicities m\_a in σ̄; (2) (Theorem 6.3.7) for y with r\_x absolutely irreducible, V̌(Π\_y) ≅ r\_x^{⊕n\_y}, so M̃\_∞(σ°)[1/2] is supported on every non-ordinary component of R̃\_∞(σ)[1/2]; (3) (Theorem 7.3.1) ordinary components are reached by an ordinary R = T theorem constructing automorphic ordinary lifts; (4) (Theorem 8.0.1) for every locally algebraic type σ, the support of M̃\_∞(σ°)[1/2] meets every irreducible component of R̃\_∞(σ)[1/2]; consequently the 2-adic Breuil–Mézard conjecture holds for every ρ̄: G\_{Q\_2} → GL\_2(k) (Corollary 8.0.2, the local consequence owned by PadicLocalLanglandsForGL2Qp R30.6), new when ρ̄ ≅ (χ ∗; 0 χ).

p = 2 splits completely in F; ρ̄ automorphic with non-solvable image; the conditions at real places are the odd deformation conditions; the globalisation of a given local ρ̄ (Tung-2 Lemma 4.3.3) cites Calegari Proposition 3.2, Snowden Proposition 8.2.1 and the dyadic construction of Khare–Wintenberger II Theorem 6.1, and Lemma 4.3.4 cites Paškūnas Lemma 3.29 and KW II Lemma 3.5 — audited in §6.5. The equivalences in (1) are analogues of Paškūnas’s Proposition 3.17 and Emerton–Gee’s Lemma 5.5.1; (d)–(e) use the Hilbert–Samuel and cycle formalism of DeformationAndDerivedPatchingAlgebra R03.3/R03.6. The ordinary-component part (3) is conditional on the dyadic ordinary R = T extension specified above; its exact source is Tung-2 §7, not R21’s odd-p statement.

A proof proceeds as follows.

1. (1): standard comparison of support, faithfulness and multiplicities for Cohen–Macaulay patched modules of rank one (TUNG-2 Lemma 5.3.2, after Kisin Lemma 2.2.11, Gee–Kisin Lemma 4.3.9, Emerton–Gee Lemma 5.5.1, Paškūnas Proposition 3.17; DeformationAndDerivedPatchingAlgebra R03.6 (cycle specialization multiplicity)).
2. (2): same argument as §5.4(1) using the 2-adic Colmez functor and Paškūnas’s 2-adic blocks (TUNG-2 Theorem 6.3.7, Corollary 6.3.6), local inputs supplied by PadicLocalLanglandsForGL2Qp R30.3, R30.5.
3. (3): Tung Theorem 7.3.1 supplies the ordinary dyadic component argument, using Propositions 7.1.6, 7.2.1 and Corollaries 7.2.2–7.2.3. R21’s odd-p quaternionic nearly ordinary Hecke theorem does not supply this p = 2 input. Apply the exact ordinary dyadic supplier specification above.
4. (4): for each component C pick, place by place, a point of C reached by (2) or (3) (TUNG-2 Theorem 8.0.1); (1) and Theorem 5.3.3 give the cycle identity (Corollary 8.0.2).

**Checks.**

- For ρ̄|G\_{Q\_2} ≅ (χ ∗; 0 χ), Corollary 8.0.2 is new (not covered by Paškūnas 2016).
- Non-example: (2) alone gives only the non-ordinary components; ordinary components need (3).

*Needs:* §5.5; §2.8; §5.2; PadicLocalLanglandsForGL2Qp R30.3 (montreal functor); PadicLocalLanglandsForGL2Qp R30.3 (cdp correspondence); PadicLocalLanglandsForGL2Qp R30.5; PadicLocalLanglandsForGL2Qp R30.5 (local r equals t); DeformationAndDerivedPatchingAlgebra R03.6 (cycle specialization multiplicity); DeformationAndDerivedPatchingAlgebra R03.3 (free of maximal depth regular local); DeformationAndDerivedPatchingAlgebra R03.3 (degree indexed multiplicity); LocalGaloisDeformationRings R08.3 (pst deformation ring); OrdinaryAutomorphicFormsAndModularityLifting R21.1 (quaternionic nearly ordinary hecke algebra); OrdinaryAutomorphicFormsAndModularityLifting R21.3 (integral hecke galois representation).

TUNG-2, Lemma 5.3.2, p. 28; Theorem 5.3.3, p. 29; Proposition 5.4.1, p. 29; Corollary 6.3.6, Theorem 6.3.7, p. 33; Theorem 7.3.1, p. 37; Theorem 8.0.1, Corollary 8.0.2, p. 38: Equivalent forms of full support, the non-ordinary components through 2-adic local Langlands, ordinary components through an ordinary R = T theorem, and full support on every component for p = 2, giving Breuil–Mézard for G\_{Q\_2}.

### 5.7 Pan’s patching at a nice prime


In the setting of §3.8 (p odd, F of even degree with p split, residual pseudo-representation 1 + χ̄ with χ totally odd, the Eisenstein maximal ideal m of the variant Hecke algebra T\_m), call a prime q ⊂ T\_m nice if (i) p ∈ q and dim T\_m/q = 1; (ii) with A the normalisation of T\_m/q in k(q), there is a lattice ρ(q)°: G\_{F,S} → GL\_2(A) with ρ(q)° ⊗ k(q) ≅ ρ(q) irreducible; (iii) its reduction mod m\_A is a non-split extension (∗ ∗; 0 ∗) of the two residual characters; (iv) if ρ(q) is induced from a character of G\_L for a quadratic L/F then L ∩ F(ζ\_p) = F; (v) for every v ∈ S∖Σ\_p, ρ(q)°|G\_{F\_v} is the constant lift of its reduction. If p = 3 assume χ̄|G\_{F\_v} ≠ ω^{±1} for v | p. Then for a nice q with q^{ps} = q ∩ R^{ps,{ξ\_v}}, the surjection (R^{ps,{ξ\_v}})\_{q^{ps}} → T\_q has nilpotent kernel (Pan’s Theorem 4.1.7). Consequently (Corollary 4.1.8): if 𝔭 is a maximal ideal of R^{ps,{ξ\_v}}[1/p] with ρ(𝔭)|G\_{F\_v} irreducible and de Rham with distinct Hodge–Tate weights for every v | p, and some irreducible component of R^{ps,{ξ\_v}} contains both 𝔭 and a nice prime, then ρ(𝔭) arises from a regular algebraic cuspidal automorphic representation of GL\_2(A\_F).

The nice-prime conditions are stated inline here; GL2ModularityLifting R32.4 (nice prime) restates the same definition for its consumers, and should import this statement. p = 3 needs χ̄|G\_{F\_v} ≠ ω^{±1}; the ordinary/residual analysis that produces nice primes on a component (Pan §§5–7) belongs to the consumer GL2ModularityLifting R32.4.

A proof proceeds as follows.

1. Local and global framed deformation rings at q (Pan §4.2: completions at the constant lift at v ∈ S∖Σ\_p are the usual local deformation rings, by condition (v)), Taylor–Wiles primes at a one-dimensional prime (Pan §4.3, Proposition 4.3.2, Lemmas 4.3.4–4.3.11, using condition (iv) and the irreducible lattice ρ(q)°; GlobalGaloisDeformations R04.5 treats an absolutely irreducible residual representation and does not cover this case, so the construction is part of this node’s proof), completed homology with auxiliary levels (§4.4).
2. Patch the completed homology and the deformation rings at q (Pan §§4.5–4.6, §5.5 in Pan’s variant; patched pseudo-deformation and representation rings, Definition 4.6.3, Proposition 4.6.16).
3. Apply Paškūnas’s theory and the local–global compatibility of §4.11 to the patched block multiplicity module m\_∞ (Pan §4.7, Proposition 4.7.7): it is finitely generated over the localised patched ring and of the expected dimension, by the dimension bound Theorem 3.6.1.
4. Full support first uses the case of nontrivial tame characters ξ\_v: Proposition 4.2.4 and Lemma 4.2.6 make the relevant completed local patched ring irreducible, and Lemma 4.8.2 gives the dimension needed for full support of m\_∞; Lemma 4.8.5 descends to T. For arbitrary ξ\_v, choose nontrivial ξ′\_v congruent modulo ϖ and use the compatibility of patched reductions with the characteristic-zero minimal-prime transfer in Corollary 4.8.4. This character-changing argument (Pan pp. 69–70) is essential; equidimensionality and a dimension bound alone give only some components.
5. Corollary 4.1.8 combines the theorem (the component through q lies in the closed image of Spec T\_m, so 𝔭 is pro-modular) with classicality, §4.11(5).

**Checks.**

- Corollary 4.1.8 is the input of GL2ModularityLifting R32.4 (nice prime component bridge) (input CC4).
- Non-example: for a one-dimensional prime with ρ(q)° residually split (condition (iii) fails), Pan’s local analysis at the constant lift does not apply.

*Needs:* §3.8; §4.11; §4.10; §5.5; LocalGaloisDeformationRings R08.6 (ordinary pcris lifts reducible); DeformationAndDerivedPatchingAlgebra R03.6 (nearly faithful and component support conclusions); IntegralHeckeAndGaloisDeterminants IHG.1 (reducibility ideal); mathlib:IsNilpotent; mathlib:RingHom.ker.

PAN, Definition 4.1.4, Remarks 4.1.5–4.1.6, Theorem 4.1.7, Corollary 4.1.8, p. 39: Nice primes of T\_m, nilpotence of the kernel of (R^{ps,{ξ\_v}})\_{q^{ps}} → T\_q at a nice prime, and automorphy of de Rham points on a component through a nice prime.

PAN, §§4.2–4.8, Proposition 4.2.4, Definition 4.5.6, Proposition 4.6.16, Proposition 4.7.7, Lemmas 4.8.2–4.8.5, pp. 40–70: Patching at a one-dimensional prime: local and global deformation rings, Taylor–Wiles primes, patched completed homology, patched rings, the application of Paškūnas’s theory and the full-support argument.

### 5.8 Pan’s patching in the residually irreducible case


Let p > 2, F totally real with p split completely, and ρ: G\_F → GL\_2(O) continuous irreducible with (1) finitely many ramified places, (2) ρ̄|G\_{F(ζ\_p)} absolutely irreducible, (3) ρ|G\_{F\_v} absolutely irreducible and de Rham with distinct Hodge–Tate weights for every v | p, and if p = 3, ρ̄|G\_{F\_v} not of the form (η ∗; 0 ηω) or (ηω ∗; 0 η), (4) det ρ(c) = −1 for every complex conjugation c, (5) ρ̄ arises from a regular algebraic cuspidal automorphic representation π\_0 of GL\_2(A\_F). Then ρ arises from a regular algebraic cuspidal automorphic representation of GL\_2(A\_F) (Pan’s Theorem 8.0.1). The proof shows that the patched completed homology m\_∞ has full support on Spec R^v\_∞ (Proposition 8.4.9) and hence the kernel of R^{(ξ\_v)} → T\_m is nilpotent (Corollary 8.4.10). When F = Q, hypothesis (5) follows from Serre’s conjecture (Khare–Wintenberger), which gives Pan’s unconditional Theorem 1.0.4 (Remark 8.0.4); that route is a full-Serre consequence and is excluded from any independent proof of Serre’s conjecture.

Hypothesis (5), residual modularity, is retained; replacing it by Serre’s conjecture for F = Q (Remark 8.0.4) uses the full Serre theorem. Tung’s thesis removes Pan’s extra p = 3 restriction (Pan Remark 8.0.2); retain Pan’s stated restriction here.

A proof proceeds as follows.

1. Standard reductions by solvable base change: unipotent inertia away from p, N(v) ≡ 1 mod p at ramified v ∤ p with ρ̄ trivial there, [F : Q] even, π\_0 unramified outside p (Pan 8.0.5).
2. Galois deformation rings and completed homology with auxiliary levels (Pan §§8.1–8.2), patching (§8.3, §5.5).
3. Apply Paškūnas’s theory and local–global compatibility (§4.11) to the patched block module: full support (Proposition 8.4.9) and nilpotent kernel (Corollary 8.4.10) (Pan §8.4).
4. Conclude with classicality of points absolutely irreducible and de Rham at every v | p (§4.11(5)) and Jacquet–Langlands.

**Checks.**

- Applied with F = Q and ρ̄ residually modular by hypothesis, the theorem is the residually irreducible Fontaine–Mazur theorem in the form GL2ModularityLifting R32.4 (pan residually irreducible fontaine mazur) consumes (input CC4).
- Non-example: dropping (5) and invoking Theorem 1.0.4 instead is not admissible in an independent proof of Serre’s conjecture.

*Needs:* §5.5; §4.11; §4.10; GlobalGaloisDeformations R04.3 (global framed ring); GlobalGaloisDeformations R04.3 (local to global presentation); GlobalGaloisDeformations R04.4 (restriction ring map); GlobalGaloisDeformations R04.4 (enlarging ramification); GL2AutomorphicRepresentationsAndTransfer R17.3 (global jl); DeformationAndDerivedPatchingAlgebra R03.6 (nearly faithful iff support eq univ).

PAN, Theorem 8.0.1, p. 124; Remarks 8.0.2–8.0.4 and 8.0.5, p. 125; Proposition 8.4.9, Corollary 8.4.10, p. 132: Fontaine–Mazur in the residually irreducible case under residual modularity, via full support of patched completed homology; Remark 8.0.4 records that for F = Q residual modularity follows from Khare–Wintenberger.

PAN, Theorem 1.0.4, p. 5: The unconditional consequence for F = Q obtained through Serre’s conjecture.

### Examples

Over R=k[x,y]/(xy), M=R/(x) has support V(x), one irreducible component, and annihilator (x)≠0. Thus a union of components is not full support. Over R=k[ε]/(ε²), M=R/(ε) has full support but annihilator (ε)≠0; reducedness is essential for faithfulness. At a wrong inertial type a finite-level typed space is zero and cannot be a faithful module for a nonzero deformation ring. These examples distinguish the support, type and coefficient hypotheses in the patching theorems.

### Dependencies

Layers 1–4 supply the finite-level modules and arithmetic compatibility. DeformationAndDerivedPatchingAlgebra R03.3, R03.5–R03.6 supplies abstract patching, cycles and component support; GlobalGaloisDeformations R04.5 supplies the irreducible-residual Taylor–Wiles construction. LocalGaloisDeformationRings R08.1, R08.3 supplies unrestricted and typed local rings with the irreducibility/reducedness assumptions stated here. PotentialAutomorphyInfrastructurePartII PL.2 and CompletedCohomologyPartII CC.8 supply the rank-n definite unitary globalisation and degree-zero adapter. PadicLocalLanglandsForGL2Qp R30.3–R30.5 supplies the all-odd-prime and dyadic local inputs. The ordinary p=2 component theorem is the precise extension of OrdinaryAutomorphicFormsAndModularityLifting R21 above. Nice-prime Taylor–Wiles data with residually reducible trace are constructed in §5.7 rather than inferred from the irreducible-residual contract.

## Layer 6: exports and source independence


This layer states the global consequences and the contracts. Promodularity (Theorem 1.2.3) and its Fontaine–Mazur and Kisin consequences are recorded with their dependence on Serre's conjecture made explicit; Böckle's R = T identifies the completed Hecke algebra with the deformation ring under his hypotheses; the potentially crystalline non-crystabelline case of Emerton's Theorem 3.3.22 is proved by realising the local representation in completed cohomology; Dospinescu–Le Bras globalise a supercuspidal representation on a definite quaternion algebra through a CM form. The dependency statements below distinguish the globalisations needed by each result and the exact comparisons consumed by the lifting theorems.
The global locally algebraic formula requires the full auxiliary CM weight-occurrence input and the determinant-exponent comparison of §6.3. Both CM branches require the prescribed Hecke-character existence theorem of their transfer supplier. Independence from Serre’s theorem is asserted only relative to the explicitly stated globalisation hypotheses in §6.5.

### 6.1 Promodularity and the Fontaine–Mazur and Kisin consequences


(Corollary 1.2.2) Let V be promodular, continuous, irreducible, two-dimensional over E, unramified outside finitely many primes, with V̄ absolutely irreducible and V̄|G\_{Q\_p} ≇ χ ⊗ (1 ∗; 0 ε̄). (1) If V|G\_{Q\_p} is trianguline, V is a twist of the Galois representation of an overconvergent p-adic cuspidal eigenform of finite slope. (2) If V|G\_{Q\_p} is de Rham with distinct Hodge–Tate weights and is not the direct sum of two characters with isomorphic reductions, V is a twist of the Galois representation of a classical cuspidal eigenform of weight k ≥ 2. (Theorem 1.2.3, Böckle, Diamond–Flach–Guo, Khare–Wintenberger, Kisin) If V is continuous, irreducible, odd, two-dimensional over E, unramified outside a finite Σ, and (a) p > 2, (b) V̄|G\_{Q(ζ\_p)} is absolutely irreducible, (c) V̄|G\_{Q\_p} ≇ χ ⊗ (1 ∗; 0 1) and ≇ χ ⊗ (1 ∗; 0 ε̄) for every k-valued χ, then V is promodular of tame level divisible only by the primes in Σ∖{p}. (Theorem 1.2.4) Under (a)–(c), the conclusions of Corollary 1.2.2 hold without assuming promodularity: Kisin’s conjecture in the trianguline case and the Fontaine–Mazur conjecture in the de Rham case.

Corollary 1.2.2 uses the promodularity hypothesis; Theorem 1.2.3 supplies it, but its proof uses Serre’s conjecture (Khare–Wintenberger, Kisin) to know that V̄ is modular (EM11 §7.3), so Theorem 1.2.4 inherits that dependence (§6.5). Corollary 1.2.2(2) has an extra hypothesis absent from Theorem 1.2.4; under (c) a sum of two characters with isomorphic reductions has V̄|G\_{Q\_p} a twist of 1 ⊕ 1, which (c) excludes (a deduction, not stated in the source). Kisin’s parallel result replaces (c) by V̄|G\_{Q\_p} ≇ χ ⊗ (ε̄ ∗; 0 1) (Emerton Remark 1.2.5); the two are different statements. Conclusions are up to twist; (1) relies on the proof of EM-PAMQ Theorem 7.5.8, which is only sketched there, and Emerton replaces it by an equidimensionality argument (EM11 §7.2).

A proof proceeds as follows.

1. Corollary 1.2.2(2) (EM11 Theorem 7.1.1): Theorem 1.2.1(1) embeds B(V|G\_{Q\_p}) into Hom(V, Ĥ^1\_E); by Colmez (EM11 Theorem 3.3.21, supplied by PadicLocalLanglandsForGL2Qp R30.4) B(V|G\_{Q\_p})\_{l.alg} ≠ 0, so Hom(V, (Ĥ^1\_E)\_{l.alg}) ≠ 0 and §2.1 gives a classical form.
2. Corollary 1.2.2(1) (EM11 Theorem 7.2.1): pass to locally analytic Jacquet modules J\_B; for trianguline V each Jordan–Hölder factor of B(V)^{an} has nonzero Jacquet module, so the eigensystem of V appears in Spec A(K^p)\_ρ̄, which is equidimensional of dimension two by §1.4(d) and Emerton’s Jacquet-module dimension result; hence V is a twist of a finite-slope overconvergent eigenform (the Jacquet functor is supplied by PadicLocalLanglandsForGL2Qp R30.2).
3. Theorem 1.2.3 (EM11 §7.3): Serre’s conjecture gives V̄ modular; Böckle’s Corollary 3.8 handles V̄|G\_{Q\_p} absolutely reducible and the finite flat case; Diamond–Flach–Guo’s extensions of Wiles–Taylor–Wiles–Diamond and Ramakrishna to arbitrary absolutely irreducible V̄|G\_{Q\_p} give the rest; the p-adic Langlands correspondence plays no role.
4. Theorem 1.2.4 combines Theorem 1.2.3 with Corollary 1.2.2.

**Checks.**

- For V = V\_f ⊗ ψ with f classical and ψ a finite-order character, all hypotheses can be checked and the conclusion recovers f up to twist.
- Non-example: for p = 2 Theorem 1.2.3 is not available, so Theorem 1.2.4 gives nothing at p = 2.

*Needs:* §4.5; §2.1; §1.4; §6.2; PadicLocalLanglandsForGL2Qp R30.2; PadicLocalLanglandsForGL2Qp R30.4.

EM11, Corollary 1.2.2, Theorems 1.2.3–1.2.4, Remark 1.2.5, pp. 4–5: The Fontaine–Mazur and Kisin consequences for promodular V, the promodularity theorem with hypotheses (a)–(c), and their combination.

EM11, Theorems 7.1.1 and 7.2.1 with proofs, pp. 94–95; §7.3, pp. 95–96: Proofs of the two parts of Corollary 1.2.2 from Theorem 1.2.1, Colmez’s non-vanishing of locally algebraic vectors and Jacquet modules; the proof of Theorem 1.2.3 from Serre’s conjecture, Böckle and Diamond–Flach–Guo.

### 6.2 Böckle’s R = T for the completed Hecke algebra


Let ρ̄: G\_Q → GL\_2(k) be absolutely irreducible, odd and modular, unramified outside Σ = Σ\_0 ∪ {p}. Assume (1) p ≥ 3, (2) ρ̄|G\_{Q(ζ\_p)} absolutely irreducible, (3) ρ̄|G\_{Q\_p} is neither χ ⊗ (1 ∗; 0 1) nor χ ⊗ (1 ∗; 0 ε̄) for any k-valued χ. Then the surjection φ\_Σ: R\_{ρ̄,Σ} → T\_{ρ̄,Σ} of §3.3 is an isomorphism. In particular every deformation of ρ̄ unramified outside Σ is promodular, and T\_{ρ̄,Σ} is a complete intersection of relative dimension three over O when R\_{ρ̄,Σ} is unobstructed.

ρ̄ modular is a hypothesis; replacing it by ρ̄ odd uses Serre’s conjecture (Khare–Wintenberger, Kisin). The relative-dimension remark holds only in the unobstructed case (H^2(G\_{Q,Σ}, ad ρ̄) = 0); it is not used elsewhere.

A proof proceeds as follows.

1. Use Böckle’s Corollary 3.8 when ρ̄|G_{Q_p} is reducible. For irreducible local restriction which is finite flat up to twist, the argument combines finite-flat global R=T (Wiles, Taylor–Wiles and Diamond) with Ramakrishna’s formal smoothness of the fixed-determinant finite-flat local ring of relative dimension one. For arbitrary irreducible local restriction, choose a twist with Fontaine–Laffaille indices 0,k−1, where 2≤k≤p, and use Diamond–Flach–Guo Theorem 3.6 and Corollary 2.3 in place of those two ingredients (EM11 §7.3, pp. 95–96). The density input concerns the corresponding classical points across these weights, rather than only weight-two finite-flat points. The resulting reduced deformation ring and density theorem are the exact supplier input of Nakamura Theorem 2.1.
2. Since φ\_Σ is surjective (§3.3) and both rings have the same reduced quotient with dense classical points (§3.6), the identification of the classical points on both sides gives injectivity once R\_{ρ̄,Σ} is reduced, which is part of Böckle’s result.

**Checks.**

- Nakamura uses this to transfer his zeta morphisms from T\_{ρ̄,Σ} to R\_{ρ̄,Σ} (his Theorem 1.1).
- Non-example: for ρ̄|G\_{Q\_p} ≅ χ ⊗ (1 ∗; 0 ε̄) the theorem is not asserted; this is the case excluded by Emerton’s Remark 1.1.2 and Assumption 3.3.1.

*Needs:* §3.3; §3.6; GlobalGaloisDeformations R04.2 (universal deformation ring); GlobalGaloisDeformations R04.3 (global framed ring); GlobalGaloisDeformations R04.3 (local to global presentation); LocalGaloisDeformationRings R08.6 (export fontaine laffaille irreducible).

NAK, Theorem 2.1 and its proof, p. 17: Under p ≥ 3, ρ̄|G\_{Q(ζ\_p)} absolutely irreducible and the two local exclusions, φ\_Σ: R\_{ρ̄,Σ} → T\_{ρ̄,Σ} is an isomorphism (Böckle Corollary 3.8 and the proof of Emerton’s Theorem 1.2.3).

EM11, §7.3, pp. 95–96: The proof of Theorem 1.2.3 through Böckle’s deformation-theoretic method and Diamond–Flach–Guo.

### 6.3 Locally algebraic vectors of B(V) by a global argument


Let V\_E be a continuous two-dimensional representation of G\_{Q\_p} over E, de Rham with distinct Hodge–Tate weights a > b. After establishing the normalisation comparison specified below, the target is B(V\_E)\_{l.alg} ≅ Sym^{a−b−1}E^2 ⊗ det^{b+1} ⊗ π\_p(V\_E), G-equivariantly, where π\_p(V\_E) is the smooth representation attached by classical local Langlands to the Weil–Deligne representation of V\_E (Emerton’s Theorem 3.3.22). For V\_E crystabelline or a twist of semistable this is Colmez’s Theorem VI.6.50; for V\_E potentially crystalline but not crystabelline Emerton’s proof is global: realise a representation V′_E with the same Weil–Deligne representation and Hodge–Tate weights (up to unramified twist and extension of scalars) as a classical eigenform’s local component at p, with the prescribed type σ, and compare the locally algebraic vectors of Ĥ^1(K\_1^p(N))\_{E,ρ̄,Σ}[𝔭] computed by EM-PAMQ Theorem 7.4.2 with those of ρ(𝔭) ⊗ B(ρ(𝔭)|G\_{Q\_p}) given by Theorem 1.2.1. Only a nonzero G\_Q × G-map ρ(𝔭) ⊗ B(ρ(𝔭)|G\_{Q\_p}) → Ĥ^1[𝔭] is needed (Emerton’s Remark 7.4.2).

The global proof is placed here, downstream of R31.4, and is exported to consumers of Kisin’s Hypothesis (1.2.6) (input LL3 of GL2ModularityLifting); the local owner PadicLocalLanglandsForGL2Qp R30.4 states Colmez’s cases and must not import this node, or the stages R30 and R31 would form a cycle. Colmez’s non-vanishing B(V\_E)\_{l.alg} ≠ 0 (Theorem VI.6.18) and the irreducibility of B for irreducible V\_E (Emerton Proposition 3.3.24) are local inputs (R30.4). The global realisation uses an auxiliary modular ρ̄ with ρ̄|G\_{Q\_p} irreducible (the reduction of the induction of a Grössencharacter of an imaginary quadratic field in which p is inert) having a chosen Serre weight W, and the weight part of Serre’s conjecture for that ρ̄ (Emerton Remark 5.7.4 notes this is its only use in the paper); it does not invoke Khare–Wintenberger for the representation under study. The displayed locally algebraic formula follows EM11 Theorem 3.3.22, p. 28. Its §7.4 proof on pp. 97–98 uses det^b with the same weight letters, whereas the theorem has det^{b+1}. Prove `globalAlgebraicNormalization` before identifying the global comparison with this displayed twist. The auxiliary CM-induced residual representation requires R17.5’s prescribed Hecke-character existence theorem, with its S-unit character-extension hypotheses.

A proof proceeds as follows.

1. By Colmez (Theorem VI.6.42) B(V\_E)\_{l.alg} depends only on π\_p(V\_E) and the weights, so it suffices to treat one V′\_E with the same π\_p and weights; π\_p(V\_E) is cuspidal since V\_E is potentially crystalline and not crystabelline (EM11 §7.4, p. 97).
2. Choose a minimal type σ of π\_p(V\_E) and a lattice τ\_0 in the algebraic-type tensor product used in §7.4; choose a constituent Serre weight W of τ\_0/ϖ. The auxiliary CM-induced modular ρ̄ has irreducible local restriction and W in its Serre-weight set. The full weight-part input used in EM11 Remark 5.7.4 and p. 97 then gives occurrence of W in the localised cohomology. Lift using R31.1’s injectivity and choose a characteristic-zero Hecke point where Hom\_K(τ,Ĥ^1\_E)[𝔭] is nonzero. Use the full auxiliary CM weight-occurrence contract above; a minimal-weight theorem alone does not assert this occurrence.
3. The nonzero τ-type vectors make 𝔭 classical; PadicLocalLanglandsForGL2Qp R30.4 (henniart types) identifies its smooth local factor up to unramified twist. This uses the existing minimal-type owner, rather than asking SR.5 to construct minimal types again.
4. The classical comparison computes the locally algebraic cohomology at that point. The nonzero map of Remark 6.4.3 is injective because B is topologically irreducible; local nonvanishing then identifies its locally algebraic factor with the classical one. To export the exact formula in the statement, first resolve the det^b versus det^{b+1} normalisation comparison using the fixed dual, Hodge–Tate and local-Langlands conventions.

**Checks.**

- For V\_E = V\_f|G\_{Q\_p} with f of weight k and level prime to p, B(V\_E)\_{l.alg} ≅ Sym^{k−2} ⊗ π\_p(f) up to the determinant twist, the Breuil–Schneider representation.
- Non-example: for V\_E de Rham with equal Hodge–Tate weights, B(V\_E)\_{l.alg} = 0 (Colmez’s converse); the theorem needs distinct weights.

*Needs:* §4.3; §2.5; §2.1; §3.6; §1.4; PadicLocalLanglandsForGL2Qp R30.4 (locally algebraic vectors); PadicLocalLanglandsForGL2Qp R30.4 (henniart types).

EM11, Theorems 3.3.21–3.3.22 and Remark 3.3.23, pp. 27–28; §7.4 with (7.4.1) and Remark 7.4.2, pp. 96–98: B(V\_E)\_{l.alg} ≅ Sym^{a−b−1} ⊗ det^{b+1} ⊗ π\_p(V\_E) for de Rham V\_E with distinct weights; Colmez proves the crystabelline and semistable cases and Emerton the remaining potentially crystalline case by the global comparison.

### 6.4 Globalising a supercuspidal π on a definite quaternion algebra


Let π be an irreducible supercuspidal smooth representation of GL\_2(Q\_p) over L (with trivial central character on a fixed uniformiser up to twist), B̄ the definite quaternion algebra over Q of discriminant ℓ (ℓ ≠ p, ramified at ℓ and ∞), and Σ, K^p as in §1.6. Then there is a quaternionic modular form f of weight 2 for B̄^\* such that, with π(f) its automorphic representation, π(f)\_p ≅ π ⊗ (ξ∘det) for an unramified character ξ, and r̄\_f: G\_Q → GL\_2(F̄\_p) is absolutely irreducible on G\_{Q\_p} (Dospinescu–Le Bras Theorem 5.5). The proof uses: (Lemma 5.6) for a minimal GL\_2(Z\_p)-type σ of π, a GL\_2(Z\_p)-stable lattice σ\_0 and a Serre weight W in the socle of σ̄\_0, there is a quaternionic form g whose residual r̄\_p is absolutely irreducible with W in the GL\_2(Z\_p)-socle of the mod p local Langlands π̄ of r̄\_p, obtained as the Jacquet–Langlands transfer of the weight-two CM form attached to a Hecke character of an imaginary quadratic F in which p and ℓ are inert; and (Hecke) the automorphic induction of a Hecke character χ of F with χ\_∞(z) = z^{-1}, not factoring through the norm, is a weight-two cusp form whose component at an inert prime is the local automorphic induction and whose p-adic Galois representation is the induction of the Galois character of χ.

The CM form is constructed from a Hecke character with prescribed reduction at p and supercuspidal local induction at ℓ; this globalisation uses class field theory and automorphic induction only, not Serre’s conjecture. DLB’s proof of Lemma 5.6 prints η̄\_p where the condition is on the Galois character attached to χ (the Galois-character convention); the node uses the corrected condition. Require the local–global character-extension theorem of R17.5/prescribed-local-induction with the infinity type, residual inert-p character and regular inert-ℓ character specified here.

A proof proceeds as follows.

1. Reduce to W = Sym^r F\_p^2 (0 ≤ r ≤ p − 1); by the explicit mod p local Langlands correspondence it suffices that r̄\_p ≅ Ind\_{Q\_{p^2}}^{Q\_p} ω\_2^{r+1} up to unramified twist (supplied by PadicLocalLanglandsForGL2Qp R30.3).
2. Choose F imaginary quadratic with p and ℓ inert and a Hecke character χ with χ\_∞(z) = z^{-1}, Galois character reducing to ω\_2^{r+1} at p up to unramified twist, and χ\_ℓ with supercuspidal local induction; its automorphic induction is a weight-two cusp form (GL2AutomorphicRepresentationsAndTransfer R17.5 (prescribed local induction), applied over Q with the prescribed place p, L\_p = Q\_{p^2}, and with v = ℓ where L/Q is not split and ξ\_ℓ does not factor through the norm, so the component at ℓ is supercuspidal), discrete series at ℓ, which transfers to B̄^\* by global Jacquet–Langlands (R17.3/global-jl) (DLB Lemme 5.6).
3. From g, use §4.9 (or its weak form Proposition 13.5), exactness of Hom\_{GL\_2(Z\_p)}(−, C^0(X(K^p), O/ϖ^n)\_m) (§1.7(b)) and Henniart’s unicity of types to produce f with π(f)\_p ≅ π ⊗ ξ∘det (DLB Théorème 5.5 and its proof, after Emerton and Breuil–Emerton Theorem 5.1).
4. GL2AutomorphicRepresentationsAndTransfer R17.3 (supercuspidal globalization) concerns a different CDN setting and is not used. The Q weight-two CM route instead uses /prescribed-local-induction with the specified character-extension hypotheses.

**Checks.**

- For π the supercuspidal of conductor p^2 attached to a regular character of Q\_{p^2}^×, a tame inert-p character with the chosen residual Serre weight provides the local datum for Lemma 5.6; a global χ still requires the prescribed character-extension hypotheses. The auxiliary CM form need not already have π as its p-component.
- Non-example: for π a principal series the theorem is not needed; a global form with given principal series at p exists by Hida/eigencurve arguments and has reducible r̄\_p in general.

*Needs:* §4.9; §1.7; §2.7; GL2AutomorphicRepresentationsAndTransfer R17.5 (prescribed local induction); GL2AutomorphicRepresentationsAndTransfer R17.3 (global jl); PadicLocalLanglandsForGL2Qp R30.3 (montreal on irreducibles).

DLB, Théorème 5.5 and its proof with Lemme 5.6, pp. 26–27: A weight-two quaternionic form with p-component π up to unramified twist and residual representation absolutely irreducible at p, built from a CM form with a prescribed Serre weight and Emerton’s local–global compatibility for B̄.

### 6.5 Audit of globalisation inputs and dependence on Serre’s conjecture


Record, for each result of this roadmap consumed by the lifting theorems, which globalisations it uses and whether any invokes the full Serre conjecture (Khare–Wintenberger, Kisin): (i) Theorem 1.2.1 and Corollary 1.2.2 (§4.5, §6.1) assume V promodular and ρ̄ modular; they invoke no globalisation beyond that hypothesis, and Theorem 6.2.4 is proved by Mazur’s principle, not by Theorem 1.2.3; (ii) Emerton’s Remark 5.2.3 (allowable levels at the Artin conductor) cites the proof of Serre’s conjecture but, for p > 2, only needs the earlier weak-to-strong Serre theorem; (iii) Theorem 1.2.3 (promodularity) and hence Theorem 1.2.4 use Serre’s conjecture explicitly (EM11 §7.3) — excluded from any independent proof of Serre; (iv) Theorem 1.2.6’s hypothesis ‘modular (equivalently odd)’ — the equivalence is Serre’s conjecture; with ‘modular’ as hypothesis it is independent; (v) Emerton’s §7.4 (§6.3) uses an auxiliary CM-induced modular ρ̄ and the weight part of Serre’s conjecture for it (EM11 p. 97, Remark 5.7.4), not Khare–Wintenberger for the representation studied; (vi) Dospinescu–Le Bras Theorem 5.5 uses CM forms and Jacquet–Langlands only; (vii) CEGGPS’s patched module, also used in Tung’s odd-p paper, cites Emerton–Gee Corollary A.7 and Proposition A.2 (potential-automorphy globalisation). Independence from Serre’s theorem is relative to the automorphic-adequate globalisation hypothesis specified above; (viii) Tung’s 2-adic paper: Lemma 4.3.3 globalises r̄ through Calegari Proposition 3.2 (Moret-Bailly), Snowden Proposition 8.2.1 and, at p = 2, Khare–Wintenberger II Theorem 6.1’s construction (dyadic Hilbert–Blumenthal abelian varieties); Lemma 4.3.4 cites Paškūnas Lemma 3.29 (which keeps a given-automorphic hypothesis) and KW II Lemma 3.5; (ix) Barnet-Lamb–Gee–Geraghty Theorem A.4.1 (reducible locus) assumes a potentially automorphic residual seed in addition to adequacy and potentially diagonalisable regular local lifts; (x) Emerton–Paškūnas Theorem 6.3 gives support on a union of components, not full support, so Tung’s Proposition 3.9 keeps its irreducibility, reducedness and density inputs; (xi) Pan’s Theorem 8.0.1 keeps residual modularity as hypothesis (5), while his Theorem 1.0.4 (via Remark 8.0.4) and Emerton’s §7.3 are full-Serre consequences and are excluded; (xii) Pan’s residually reducible Theorem 4.1.7 needs no residual modularity. The CEGGPS and dyadic branches use their exact globalisation supplier specifications above. To deduce a theorem independently of Serre’s theorem, establish those specifications without invoking Serre; no such independence follows merely from their conclusions. The CM branches also require R17.5’s prescribed Hecke-character existence theorem.

The audit is a record of dependencies, not a claim that they are unavoidable; promodularity and residual modularity are hypotheses that can be verified independently.

A proof proceeds as follows.

1. Read each consumed theorem’s proof for its global inputs (leaves listed in the hypotheses) and classify each input as hypothesis, independent globalisation, or full-Serre consequence.
2. Emerton: §7.3 opens by invoking Serre’s conjecture for V̄; §6.2’s proofs use only the modular-ρ̄ hypothesis and Mazur’s principle; §7.4 uses completed cohomology at an allowable level.
3. Tung/CEGGPS/BLGG/EP/Pan: use the globalisation theorems and residual automorphy hypotheses enumerated in the statement. Their independence from a proposed application is an additional hypothesis of that application.
4. Supply this record to GL2ModularityLifting R32.6 (globalisation dependency audit) (the existing owner of the lifting-side audit), not a second audit there.

**Checks.**

- Applied to an argument claiming to reprove Serre’s conjecture: it may use §4.5’s Theorem 1.2.1 and §6.1’s Corollary 1.2.2 with independently established promodularity, Pan’s Theorem 4.1.7, Tung’s full support (relative to independent proofs of its stated globalisation hypotheses), but not Theorem 1.2.3, Theorem 1.2.4, the ‘odd’ form of Theorem 1.2.6, Pan’s Theorem 1.0.4, or Emerton’s §7.3.
- The audit is consumed by GL2ModularityLifting R32.6 (globalisation dependency audit) (inputs CC5).

*Needs:* §4.5; §4.2; §4.6; §6.1; §6.3; §6.4; §5.1; §5.4; §5.6; §5.3; §5.7; §5.8.

EM11, Theorems 1.2.1, 1.2.3, 1.2.6 and Remark 5.2.3, pp. 3–5, 47; §7.3, pp. 95–96; §7.4, pp. 96–98: Which results assume promodularity or modularity of ρ̄, and where Serre’s conjecture is invoked (§7.3 for promodularity; the ‘equivalently odd’ form of Theorem 1.2.6).

TUNG-2, Lemmas 4.3.3–4.3.4, p. 21: The suitable globalisation of a local residual representation through Calegari, Snowden and KW II at p = 2, and the automorphy of the globalisation through Paškūnas Lemma 3.29 and KW II Lemma 3.5.

CEGGPS, §2.1 and Lemma 2.2, pp. 15–17: The globalisation of r̄ via Emerton–Gee Corollary A.7, with automorphic, adequate, unramified-away-from-p properties.

EP, Theorem 6.3 and Remark 6.4, p. 26: Support on a union of irreducible components, with full support only when the framed ring is irreducible.

PAN, Theorem 8.0.1 and Remarks 8.0.2–8.0.4, pp. 124–125: Residual modularity as hypothesis (5), and its replacement by Khare–Wintenberger for F = Q.

DLB, Proof of Théorème 5.5 and Lemme 5.6, pp. 26–27: The globalisation through a CM form and Jacquet–Langlands.

### 6.6 Exports to the GL₂ lifting theorems and other consumers


The exact statements this roadmap exports, by consumer branch: (CC1) type-specialised quaternionic modules and their faithful algebraic module (§2.8), with Pan’s classicality (§4.11(5)); (CC2) Pan’s completed Hecke quotient, determinant-fixed pseudo-character with p-power tame characters, pro-modular primes as kernel containment closed under specialisation (§3.8), Tung’s Hecke-valued representation with determinant ψε (§3.2(c)); (CC3) Pan’s Theorem 3.5.5, Corollaries 3.5.10 and 3.5.12 (§4.11); (CC4) the CEGGPS patched module with projectivity (§5.1), Emerton–Paškūnas support and faithfulness (§5.3), Tung’s full support at odd p (§5.4) and at p = 2 with Lemma 5.3.2’s equivalences and Theorem 8.0.1 (§5.6), Pan’s Theorem 4.1.7 with §§4.2–4.8 (§5.7) and §8 with its residual-modularity hypothesis (§5.8); the globalisation audit (§6.5). Branches of GL2ModularityLifting R32: odd-prime residually modular de Rham lifting (Kisin/Emerton, then Paškūnas p ≥ 5 with End ρ̄\_p = k, Hu–Tan for split non-scalar ρ̄\_p, Tung for all odd p including p = 3) uses CC4–CC5 with the purely local Paškūnas/Hu–Tan statements from R30.6; the Tung cycle statements proved here are consumed directly from R31.5; the dyadic branch (Kisin’s 2-adic BT, Paškūnas 2016, Tung p = 2) uses CC1, CC4, CC5; Pan’s p ≥ 5 residually reducible branch uses CC2–CC4; Pan’s residually irreducible branch uses CC3–CC5. Other consumers: KatoEulerSystems L2 (§2.6, Lemma 2.10 form); LocallyAnalyticCompletedCohomology LA.2/LA.5/LA.12 (§1.1 with §1.3; §3.1, §3.2, §3.5; §4.5 and §3.6 for the dense classical vectors with semisimple Hecke action; §6.1 for Emerton’s Theorem 1.2.3); AutomorphicCongruences L3 and TorsionCohomologyInfrastructure TC.2 (through CompletedCohomologyPartII CC.8, not through this roadmap).

Every export keeps the hypotheses of its source theorem; no unqualified ‘p-adic local–global compatibility theorem’ is exported. Local Paškūnas/Hu–Tan statements may be imported by downstream consumers from R30.6. Tung’s Breuil–Mézard identities obtained by global patching are exported directly from R31.5, and this comparison has no R30.6 prerequisite. The global proof of the locally algebraic formula requires the specified weight-occurrence and normalisation comparisons.

A proof proceeds as follows.

1. Compose each comparison with the maps needed by GL2ModularityLifting R22.1, R32.3, R32.6, KatoEulerSystems and LocallyAnalyticCompletedCohomology, preserving the displayed prime, coefficient, determinant and residual hypotheses.
2. Check that no exported statement drops a hypothesis of its source (p = 3 exclusions, residual modularity, local irreducibility, End ρ̄\_p = k).

**Checks.**

- For GL2ModularityLifting’s inputs CC1–CC5, the comparisons below specify precisely which hypotheses must be checked.
- KatoEulerSystems uses §2.6(b) after inverting p; no integral isomorphism is required.

*Needs:* §2.8; §3.8; §4.11; §5.1; §5.3; §5.4; §5.6; §5.7; §5.8; §6.5; §2.6; §4.5; §6.3.

EM11, §1.2, pp. 3–6: The hypothesis tables of Emerton’s main results, which the export table preserves.

TUNG-P3, Theorem 1.2 and Theorem 4.7, pp. 4, 16: The odd-prime Breuil–Mézard and automorphy statements and their hypotheses.

TUNG-2, Theorem 8.0.1, Corollary 8.0.2, Theorem 8.0.3, p. 38: The dyadic statements and their hypotheses.

PAN, Theorems 1.0.2, 4.1.7, 8.0.1, pp. 3, 39, 124: Pan’s residually reducible and irreducible statements and their hypotheses.


### Examples

Starting with a residual representation known to be modular, the Banach embedding and classicality implications can be used with independently proved promodularity. Replacing modularity by oddness over Q uses Serre’s theorem. Pan’s residually reducible nice-prime statement does not require a residual-modularity hypothesis, whereas Pan’s residually irreducible automorphy theorem keeps it. These distinctions persist when all the local rings and types are otherwise identical.

### Dependencies

Layers 1–5 supply the comparison and support statements. The exact deformation-density contract is Böckle’s Corollary 3.8 with the Diamond–Flach–Guo extension, as used by Nakamura Theorem 2.1 and Emerton §7.3. GL2AutomorphicRepresentationsAndTransfer R17.5 supplies prescribed local CM induction and its Hecke-character existence theorem. The full auxiliary CM weight-occurrence input and `globalAlgebraicNormalization` are required for §6.3’s displayed twist. Local nonvanishing, Jacquet modules and types come from PadicLocalLanglandsForGL2Qp R30.2–R30.4. The globalisations listed in §6.5 retain their residual automorphy and independence hypotheses; downstream lifting theorems are consumers, not prerequisites.

## Worked examples

For the unique weight-two newform of level 11, the elliptic curve y²+y=x³−x²−10x−20 has five points over F₅, so a₅=5+1−5=1. At p=5 the spherical polynomial is X²−X+5. Its roots have valuations 0 and 1, so the form is ordinary. The locally algebraic factor in §2.5 is V_f⊗π_p(V_f), with no symmetric power because k−2=0. This checks the finite-level, completed and locally algebraic Hecke normalisations. It makes no assertion of residual irreducibility at 5; the curve has rational 5-torsion, so this is not an example for an irreducible-residual Banach theorem.

For a weight-k point with nebentypus χ, the determinant at geometric Frobenius is χ(ℓ)ℓ^{k−1}; in weight two it is χ(ℓ)ℓ. At ℓ=2 for the level-11 form, a₂=−2 and χ=1, giving X²+2X+2. The reciprocal arithmetic-Frobenius action on the same representation has polynomial X²+X+1/2; the dual representation restores X²+2X+2 at arithmetic Frobenius. This distinguishes changing Frobenius from dualising the Galois representation.

For Σ₀ empty, the tensor product of co-Whittaker families is T, while its coadmissible smooth O-dual is T′=Hom_O^cont(T,O), not T unless a specified perfect duality identifies them. The nonzero-map, injective-map and isomorphism branches in §4.5 retain their separate residual assumptions even in this case.

For Pan’s and Tung’s determinants at one place, ψε⁻¹ and ψ_Tε can only agree as fixed determinants if ψ_T=ψε⁻² under a specified reciprocity identification. This equality of determinant characters does not by itself identify the representations or their T_v operators. Likewise the algebraic characters det^b and det^(b+1) differ on diag(u,1) by u: for u=2 in Q_pˣ the ratio is 2, also when p=2. The normalisation bridge of §6.3 must account for that factor.

## Downstream consumers

GL2ModularityLifting uses the typed finite-level comparison of §2.8, the Hecke and pseudo-deformation maps of Layer 3, Pan’s block comparison in §4.11, and the odd-prime, dyadic and nice-prime support statements of Layer 5. Its proof must check each result’s prime, determinant, residual modularity and local irreducibility hypotheses and the globalisation dependence of §6.5. KatoEulerSystems uses the rational coefficient comparison of §2.6, with the indicated extra Tate twist; it needs no integral isomorphism. LocallyAnalyticCompletedCohomology uses the actual completed modular tower of Layer 1, the Hecke determinant and Galois factorisation of Layer 3, the crystalline density statement and the applicable branches of Layer 4; its use of §6.1’s promodularity theorem retains dependence on Serre’s theorem. ScholzeFunctorAndModpCohomologyOfTheLubinTateTower uses §4.12 for its arithmetic applications.

## References

- M. Emerton, *Local-global compatibility in the p-adic Langlands programme for GL\_{2/Q}*, unpublished manuscript, draft of 23 March 2011 (author's page, lg.pdf) — cited as EM11; the backbone of R31.1–R31.4 and R31.6. [Specified version](https://math.uchicago.edu/~emerton/pdffiles/lg.pdf).
- M. Emerton, *A local-global compatibility conjecture in the p-adic Langlands programme for GL\_{2/Q}*, Pure Appl. Math. Q. 2 (2006); author draft of 19 August 2009 — cited as EM-PAMQ, §7.2–7.4. [Specified version](https://math.uchicago.edu/~emerton/pdffiles/coates.pdf).
- M. Emerton, *On the interpolation of systems of eigenvalues attached to automorphic Hecke eigenforms*, Invent. Math. 164 (2006); author draft — cited as EM06, §§2.1–2.2 and 4.3. [Specified version](https://math.uchicago.edu/~emerton/pdffiles/interpolate.pdf).
- F. Calegari and M. Emerton, *Completed cohomology — a survey* (2012), §1.1. [Specified version](https://math.uchicago.edu/~emerton/pdffiles/survey.pdf).
- K. Nakamura, *Zeta morphisms for rank two universal deformations*, Invent. Math. 234 (2023); arXiv:2006.13647v2, §2. [Specified version](https://arxiv.org/abs/2006.13647v2).
- G. Dospinescu and A.-C. Le Bras, *Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique*, Ann. of Math. 186 (2017); arXiv:1509.00606v2, §§4.1, 5.1, 13. [Specified version](https://arxiv.org/abs/1509.00606v2).
- P. Colmez, G. Dospinescu and W. Nizioł, *Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*, Forum Math. Pi 11 (2023); arXiv:2204.11214v2, §4.1. [Specified version](https://arxiv.org/abs/2204.11214v2).
- Y. Ding, *p-adic Hodge parameters in the crystabelline representations of GL\_n*, Publ. Math. IHÉS 142 (2025); arXiv:2407.21237v2, §4.1. [Specified version](https://arxiv.org/abs/2407.21237v2).
- A. Caraiani, M. Emerton, T. Gee, D. Geraghty, V. Paškūnas and S. W. Shin, *Patching and the p-adic local Langlands correspondence*, Camb. J. Math. 4 (2016); arXiv:1310.0831v5, §§2, 4. [Specified version](https://arxiv.org/abs/1310.0831v5).
- M. Emerton and V. Paškūnas, *On the density of supercuspidal points of fixed regular weight in local deformation rings and global Hecke algebras*, J. Éc. polytech. Math. 7 (2020); arXiv:1809.06598v3, §6. [Specified version](https://arxiv.org/abs/1809.06598v3).
- L. Pan, *The Fontaine–Mazur conjecture in the residually reducible case*, J. Amer. Math. Soc. 35 (2022); arXiv:1901.07166v2, §§3–4, 8. [Specified version](https://arxiv.org/abs/1901.07166v2).
- S.-N. Tung, *On the automorphy of 2-dimensional potentially semi-stable deformation rings of G\_{Q\_p}*, Algebra Number Theory 15 (2021); arXiv:1803.07451v4. [Specified version](https://arxiv.org/abs/1803.07451v4).
- S.-N. Tung, *On the modularity of 2-adic potentially semi-stable deformation rings*, Math. Z. 298 (2021); arXiv:1908.06174v3. [Specified version](https://arxiv.org/abs/1908.06174v3).
- J.-P. Serre, *Sur les représentations modulaires de degré 2 de Gal(Q̄/Q)*, Duke Math. J. 54 (1987), §3.4. [Specified version](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf).


Page numbers refer to the versions specified here. All theorem formulations above use these normalisations, with comparison targets explicitly stated where the source drafts use differing conventions.
