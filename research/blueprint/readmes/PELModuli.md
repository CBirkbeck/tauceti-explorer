# Siegel and PEL moduli problems

This roadmap constructs PEL moduli problems from integral and rational linear algebra, proves their representability and smoothness at good primes, compares their generic fibres with complex Shimura varieties and canonical models on the correct components, builds normalized integral models at higher p-level, works out the Siegel, genus-one and unitary examples, and exports the arithmetic moduli (stacks at arbitrary level, coarse spaces, the descent obstruction and the Hodge line) to heights and finiteness. PEL is an example class inside the general theory of Shimura varieties, not a restriction on its foundational definitions: ShimuraData and ShimuraVarieties own Shimura data and canonical models, AbelianSchemesAndArithmeticModuli owns abelian schemes, duals, polarizations and their deformation theory, AlgebraicModuliForArithmeticGeometry owns algebraic spaces, stacks, Artin's criterion and coarse spaces, and ShimuraCompactifications owns compactifications and the integral quasi-projectivity of these moduli spaces.

The planning pass covers M0–M6 at target level with 91 declarations. Every stage is **planned**; none is closed, because the packet records 5 gaps and 37 supplier requests. The packet status is **complete**, and every declaration keeps implementation status **unchecked**. The suggested Lean file gives signatures, API lemmas and unit tests with proofs omitted; whether it elaborated is stated in the handoff note.

## Purpose, scope and ownership

The binding restructuring decisions are RS-23 (one PEL engine with Hilbert and quaternionic specializations; M5 and M6 narrowed), RS-27 (M1 owns the stack property of PEL moduli; M2 owns the verification of Artin's criterion and rigidification by auxiliary prime-to-p level; M6 owns their coarse spaces), RS-14 (M5 owns the unitary example with signatures, polarization and good-prime and reflex-field checks) and RS-06 (M6 owns the consumer-facing universal family with its Hodge line and the rational-family/coarse-point descent interface). All four are accepted. Accordingly this roadmap never constructs a second abelian-scheme theory, a second Shimura datum, a second canonical-model theory, a compactification, or Artin's criterion: each is imported through a prerequisite on its owner, with a request entry stating the exact statement used.

What is not claimed: smoothness of PEL moduli at bad primes or at higher p-level; a single Shimura variety as generic fibre in general (ker¹ can be nontrivial); passage to the identity component in type D without a separate comparison; scheme representability or quasi-projectivity over the integral base before ShimuraCompactifications C5; a rational family from a rational coarse point.

## Conventions

- ℤ(1) = ker(exp : ℂ → ℂ^×) = 2π√−1·ℤ; pairings of PEL lattices take values in ℤ(1) (Lan). A choice of √−1 identifies ℤ(1) with ℤ; no statement depends on it.
- Hodge types follow Deligne 1979 and ShimuraData: V^{p,q} carries z^{−p} z̄^{−q}. For a PEL datum, V₀ := {v ∈ V ⊗ ℂ : h(z)v = zv} = V^{−1,0} (Kottwitz's V₁), and Lie(A) ≅ V₀ for complex points. Kottwitz writes the same Shimura variety as (G, h⁻¹).
- □ is a set of good primes; ℤ_(□) inverts integers prime to □, Ẑ^□ = ∏_{ℓ ∉ □} ℤ_ℓ, 𝔸^{∞,□} its rationalization; S₀ = Spec O_{F₀,(□)}. A prime is bad at level n iff it divides n·I_bad·Disc·[L^#:L].
- Level structures carry their multiplier ν (an isomorphism of ℤ/n(1) or Ẑ^□(1) with μ_n or T^□G_m); the group G(𝔸^{∞,□}) acts on the right by α̂ ↦ α̂ ∘ g, so Hecke maps use H ∩ gHg⁻¹.
- H₁ and H^dR_1 are homological (as in Liu–Tian–Xiao–Zhang–Zhu, Hodge sequence 0 → ω_{A^∨} → H^dR_1 → Lie_A → 0); the Hodge bundle ω_A = e^*Ω¹_A is the dual of Lie_A and the Hodge line is det ω_A.
- Discriminants of orders use the reduced trace (Lan §1.1.1); positivity of involutions may use either trace.

## Layer overview

| Layer | Declarations | Planets | Coverage |
| --- | ---: | ---: | --- |
| [M0 — Linear algebra and reflex field](#m0) | 26 | 6 | planned |
| [M1 — The moduli functors and descent](#m1) | 14 | 4 | planned |
| [M2 — Representability and smoothness at good level](#m2) | 14 | 5 | planned |
| [M3 — Complex and generic-fibre comparison](#m3) | 8 | 5 | planned |
| [M4 — Canonical models and integral level changes](#m4) | 9 | 4 | planned |
| [M5 — Required examples](#m5) | 7 | 4 | planned |
| [M6 — Arithmetic moduli and source R10.3/R10.6](#m6) | 13 | 6 | planned |

## Sources read and baseline

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Each baseline declaration below was located in the declaration index at these commits and its statement read in the source tree (Tau Ceti through `git show` at the pinned commit). The reviewed library audit (AUDIT-10) marks all seven layers not built; the declarations cited are the ingredients it lists.

- [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) — Kai-Wen Lan; Thesis version of May 2008 (numbering of Chapters 1–2 agrees with the 2013 book for the results cited). Read: Chapter 1: §§1.1.1–1.1.2 (orders, discriminant, determinantal conditions), §1.2.1, §1.2.5 (signatures, reflex field), §§1.3.1–1.3.7 statements (quasi-isogenies, polarizations, O-structures, Lie algebra condition, Tate modules, level structures), §§1.4.1–1.4.4 in full; Chapter 2: statements of Theorems 2.2.3.10, 2.2.4.16, Proposition 2.3.2.1, §2.3.3 (proof of representability), Proposition 2.3.4.2; Read 2026-10-06 (the author's page, www-users.cse.umn.edu/~kwlan, refused scripted access; this mirror of the same thesis PDF was read). SHA-256 c3086d5140bab887e31a508cf4bf8804f092326a35882fc003a3422c4ab65bdd.
- [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) — Robert E. Kottwitz; Journal of the American Mathematical Society 5 (1992), no. 2, 373–444. Read: Introduction pp. 373–375; §4 Hermitian symmetric spaces of PEL type (Lemmas 4.1–4.3); §5 Moduli spaces of PEL type; §6 Hecke correspondences; §7 Structure of the groups G and G_1 (Lemmas 7.1–7.4, Corollary 7.3); §8 Complex points of moduli spaces of PEL type; Read 2026-10-06. SHA-256 a13bffe17fbe578542fd3dfdbc7c93c228d40581e072908d9dc3c8cd84314978.
- [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) — James S. Milne; Revised version of September 16, 2017 (numbering as in the 2005 Clay Mathematics Proceedings 4 publication). Read: §6 The Siegel modular variety (Propositions 6.3–6.5, Theorems 6.7–6.11); §8 PEL Shimura varieties (Propositions 8.1–8.19, Lemmas 8.20–8.21, Theorem 8.17); §12 Definition 12.2 and Example 12.4 (reflex field); §14 statements 14.1–14.17; Read 2026-10-06. SHA-256 f637e61735ff9cf9730c43d978d8f05185685a37d5e1920fc3347061c83d7c7e.
- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) — Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu; arXiv:1912.11942v3 read in full for §§3.1, 3.3–3.5; the published version (Inventiones mathematicae 228 (2022), 107–375) is quoted through the reviewed extraction PAPER-LIU-ETAL-22, which records the changes between them. Read: §3.1 Definitions 3.1.7 and 3.1.11; §3.3 Definitions 3.3.1–3.3.4, Remark 3.3.3, Notation 3.3.6; §3.4 Notation 3.4.1 – Lemma 3.4.12 with proof; §3.5 Definitions 3.5.1–3.5.8 and Remark 3.5.2; Read 2026-10-06. SHA-256 84dc7c8369298314bd4e7ece5a45e5e096f39bd376f08c4c489950873c46fe86.
- [Classicité de formes modulaires surconvergentes](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf) — Stéphane Bijakowski, Vincent Pilloni, Benoît Stroh; Annals of Mathematics 183 (2016), no. 3, 975–1014 (published version). Read: §1.1 Données de type PEL (Hypothèse 1.1.1, Remarques 1.1.2–1.1.3, Lemme 1.1.4), pp. 979–981; §1.5 and Remarque 1.5.1, pp. 987–988; Read 2026-10-06. SHA-256 13c159cde16c09c98de6b29ed1cf0e293ae78e5dc250399a1ee9203b3601d92c.
- [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf) — Jacob Tsimerman; Annals of Mathematics 187 (2018), no. 2, 379–390 (published version). Read: §1 introduction and footnote p. 380; §4 Lemma 4.1 and its proof, p. 384; §6.1, p. 387; Read 2026-10-06. SHA-256 43259ca3cfedfb574bf1fe2f80e1023cb736ea299a76588536fd816340722abc.
- [How large is A_g(F_q)?](https://arxiv.org/pdf/1511.02212v1) — Michael Lipnowski, Jacob Tsimerman; arXiv:1511.02212v1 (published in Duke Mathematical Journal 167 (2018), 3403–3453); Tate's finiteness statement is cited from Tate, Endomorphisms of abelian varieties over finite fields, Invent. Math. 2 (1966), §2, through the reviewed extraction PAPER-LIPNOWSKI-TSIMERMAN-18. Read: §2 (Lemma 2.1, Corollary 2.2); §4.1 (Mumford's construction, Remark 4.2, Definition 4.3); Read 2026-10-06. SHA-256 5ceed8168ce37b75da67699189e7e8730527c31f3339dce979a1a1901243f81a.
- [The Stacks Project](https://stacks.math.columbia.edu) — The Stacks Project Authors; Online, tags 035S, 03GR, 0539 read 2026-10-06. Read: Tag 035S (Lemma 29.55.11: normalization of a Nagata scheme is finite); Tag 03GR (Lemma 29.54.15: normalization of a Nagata scheme in a reduced finite-type scheme is finite); Tag 0539 (Lemma 15.22.10: over a valuation ring flat = torsion free).

Baseline declarations:

- `mathlib:Algebra.FormallySmooth` (class, Mathlib/RingTheory/Smooth/Basic.lean): Formally smooth algebras, with the infinitesimal lifting property.
- `mathlib:Algebra.IsSeparable` (class, Mathlib/FieldTheory/Separable.lean): Separable algebraic field extensions.
- `mathlib:Algebra.discr` (def, Mathlib/RingTheory/Discriminant.lean): Discriminant det(Tr(b_i b_j)) of a family in a commutative algebra.
- `mathlib:Algebra.trace` (def, Mathlib/RingTheory/Trace/Defs.lean): The trace of left multiplication of a finite free algebra.
- `mathlib:AlgebraicGeometry.Etale` (class, Mathlib/AlgebraicGeometry/Morphisms/Etale.lean): Étale morphisms of schemes.
- `mathlib:AlgebraicGeometry.Flat` (class, Mathlib/AlgebraicGeometry/Morphisms/Flat.lean): Flat morphisms.
- `mathlib:AlgebraicGeometry.IsFinite` (class, Mathlib/AlgebraicGeometry/Morphisms/Finite.lean): Finite morphisms.
- `mathlib:AlgebraicGeometry.IsSeparated` (class, Mathlib/AlgebraicGeometry/Morphisms/Separated.lean): Separated morphisms.
- `mathlib:AlgebraicGeometry.Scheme` (structure, Mathlib/AlgebraicGeometry/Scheme.lean): Schemes.
- `mathlib:AlgebraicGeometry.Scheme.Hom.normalization` (def, Mathlib/AlgebraicGeometry/Normalization.lean): Relative normalization of a quasi-compact quasi-separated morphism of schemes.
- `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationDesc` (def, Mathlib/AlgebraicGeometry/Normalization.lean): Universal property of the relative normalization.
- `mathlib:AlgebraicGeometry.Scheme.etaleTopology` (abbrev, Mathlib/AlgebraicGeometry/Sites/Etale.lean): The étale topology on schemes.
- `mathlib:AlgebraicGeometry.Scheme.fppfTopology` (abbrev, Mathlib/AlgebraicGeometry/Sites/Fpqc.lean): The fppf topology on schemes.
- `mathlib:AlgebraicGeometry.Smooth` (class, Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean): Smooth morphisms of schemes.
- `mathlib:CategoryTheory.Functor.IsFibered` (class, Mathlib/CategoryTheory/FiberedCategory/Fibered.lean): Fibered categories.
- `mathlib:CategoryTheory.PresheafOfGroups.H1` (def, Mathlib/CategoryTheory/Sites/NonabelianCohomology/H1.lean): Nonabelian H¹ of a presheaf of groups relative to a family of objects (Čech-type cocycles).
- `mathlib:CategoryTheory.Pseudofunctor.IsStack` (class, Mathlib/CategoryTheory/Sites/Descent/IsStack.lean): The stack condition (effective descent) for a pseudofunctor to categories.
- `mathlib:IntermediateField.fixedField` (def, Mathlib/FieldTheory/Galois/Basic.lean): Fixed field of a subgroup of the Galois group.
- `mathlib:IntermediateField.normalClosure` (def, Mathlib/FieldTheory/Normal/Closure.lean): Normal (Galois) closure.
- `mathlib:IsDedekindDomain.FiniteAdeleRing` (def, Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean): The finite adele ring of a Dedekind domain as a restricted product of completions.
- `mathlib:IsSemisimpleRing` (abbrev, Mathlib/RingTheory/SimpleModule/Basic.lean): Semisimple rings.
- `mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing` (theorem, Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean): Wedderburn–Artin: a semisimple algebra is a finite product of matrix algebras over division algebras.
- `mathlib:LinearMap.BilinForm.IsAlt` (def, Mathlib/LinearAlgebra/BilinearForm/Properties.lean): Alternating bilinear forms: B x x = 0.
- `mathlib:LinearMap.BilinForm.Nondegenerate` (abbrev, Mathlib/LinearAlgebra/BilinearForm/Properties.lean): Nondegenerate bilinear forms (separating on both sides).
- `mathlib:LinearMap.BilinForm.dualSubmodule` (def, Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean): The dual lattice {x | ∀ y ∈ N, B x y ∈ R} of a submodule with respect to a bilinear form.
- `mathlib:LinearMap.IsAdjointPair` (def, Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean): Adjoint pairs of maps for a pair of bilinear/sesquilinear forms: B'(f x) y = B x (g y).
- `mathlib:LinearMap.charpoly` (def, Mathlib/LinearAlgebra/Charpoly/Basic.lean): Characteristic polynomial of an endomorphism of a finite free module.
- `mathlib:LinearMap.charpoly_baseChange` (lemma, Mathlib/LinearAlgebra/Charpoly/BaseChange.lean): The characteristic polynomial commutes with base change.
- `mathlib:LinearMap.polyCharpoly` (def, Mathlib/Algebra/Module/LinearMap/Polynomial.lean): The generic characteristic polynomial of a linear family φ : L → End M in the coordinates of a basis of L.
- `mathlib:LinearMap.polyCharpoly_baseChange` (lemma, Mathlib/Algebra/Module/LinearMap/Polynomial.lean): The generic characteristic polynomial commutes with base change.
- `mathlib:LinearMap.polyCharpoly_map_eq_charpoly` (lemma, Mathlib/Algebra/Module/LinearMap/Polynomial.lean): Evaluating the generic characteristic polynomial at the coordinates of x gives charpoly (φ x).
- `mathlib:Matrix.J` (def, Mathlib/LinearAlgebra/SymplecticGroup.lean): The standard symplectic block matrix.
- `mathlib:Matrix.unitaryGroup` (abbrev, Mathlib/LinearAlgebra/UnitaryGroup.lean): Unitary matrices for a star ring.
- `mathlib:NumberField.ComplexEmbedding.conjugate` (abbrev, Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean): The complex conjugate of a complex embedding.
- `mathlib:NumberField.IsCMField` (class, Mathlib/NumberTheory/NumberField/CMField.lean): CM fields: totally complex quadratic extensions of their maximal real subfield.
- `mathlib:NumberField.IsCMField.complexConj` (def, Mathlib/NumberTheory/NumberField/CMField.lean): Complex conjugation of a CM field as an automorphism over its maximal real subfield.
- `mathlib:NumberField.IsTotallyReal` (class, Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean): Totally real number fields.
- `mathlib:NumberField.discr` (abbrev, Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean): Discriminant of a number field.
- `mathlib:NumberField.maximalRealSubfield` (def, Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean): The maximal totally real subfield of a number field.
- `mathlib:StarRing` (class, Mathlib/Algebra/Star/Basic.lean): Rings with an involutive anti-multiplicative additive star.
- `mathlib:Submodule.IsLattice` (class, Mathlib/Algebra/Module/Lattice.lean): Finitely generated spanning submodules (lattices).
- `mathlib:UpperHalfPlane` (structure, Mathlib/Analysis/Complex/UpperHalfPlane/Basic.lean): The upper half plane.
- `mathlib:WeierstrassCurve.ofJ` (def, Mathlib/AlgebraicGeometry/EllipticCurve/ModelsWithJ.lean): A Weierstrass curve over a field with prescribed j-invariant.
- `mathlib:WeierstrassCurve.ofJ_j` (lemma, Mathlib/AlgebraicGeometry/EllipticCurve/ModelsWithJ.lean): The curve ofJ j has j-invariant j.
- `tauceti:LinearMap.BilinForm.dualSubmodule_dualSubmodule_flip` (theorem, TauCeti/LinearAlgebra/BilinearForm/DualLattice.lean): Double duality of lattices for a nondegenerate (not necessarily symmetric) bilinear form.
- `tauceti:Matrix.exists_smith_normal_form_of_det_ne_zero` (theorem, TauCeti/LinearAlgebra/Matrix/SmithNormalForm.lean): Smith normal form with divisibility chain of a nonsingular integer matrix.
- `tauceti:Matrix.transpose_mul_J_mul_eq_det_smul` (theorem, TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean): Rank-two multiplier identity Aᵀ J A = det(A) J.
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety` (structure, TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean): Abelian varieties over a field K: a proper, geometrically integral group object over Spec K.
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End` (def, TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean): The endomorphism ring End A of an abelian variety over a field (multiplication = reversed composition).
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny` (abbrev, TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean): Isogenies of abelian varieties over a field: finite surjective homomorphisms.
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.mulBy` (def, TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean): Multiplication by an integer n on an abelian variety over a field.
- `tauceti:TauCeti.AlmostComplexStructure` (structure, TauCeti/Geometry/Symplectic/AlmostComplex.lean): A real-linear J on a real vector space with J∘J = −1.
- `tauceti:TauCeti.AlmostComplexStructure.hodgeStructure` (def, TauCeti/Geometry/Hodge/WeightOne/Basic.lean): The weight-one Hodge structure on ℂ ⊗ V attached to a complex structure J (no integral lattice).
- `tauceti:TauCeti.ConstantForm.groupScheme` (abbrev, TauCeti/Algebra/AlgebraicGroup/ConstantForm/Basic.lean): The closed subgroup scheme of GL_n over a commutative ring preserving a constant form C (points M with M C Mᵀ = C); isometries, multiplier one.
- `tauceti:TauCeti.ContCohomology.H1` (abbrev, TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean): Continuous H¹ of a topological group with abelian coefficients.
- `tauceti:TauCeti.GeneralLinear.groupScheme` (def, TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Scheme.lean): The general linear group scheme GL_n over a commutative ring.
- `tauceti:TauCeti.Hodge.HodgeStructureOn` (structure, TauCeti/Geometry/Hodge/Structure.lean): Pure Hodge structures of weight n given by an opposed Hodge filtration on a complex space with conjugation.
- `tauceti:TauCeti.Hodge.IsPolarization` (structure, TauCeti/Geometry/Hodge/Polarization.lean): Polarizations of integral Hodge structures: (-1)^n-symmetry, nondegeneracy, orthogonality, positivity.
- `tauceti:TauCeti.Hodge.isPolarization_of_weilOperator_invariant_on_realPoints_of_pos` (theorem, TauCeti/Geometry/Hodge/WeightOne/Polarization.lean): Riemann relations: an effective weight-one integral Hodge structure with a skew nondegenerate form invariant under the Weil operator and positive on real points is polarized.
- `tauceti:TauCeti.Orthogonal.groupScheme` (abbrev, TauCeti/Algebra/AlgebraicGroup/Orthogonal/Basic.lean): The orthogonal group scheme of the standard form.
- `tauceti:TauCeti.RootsOfUnityGroup.groupScheme` (abbrev, TauCeti/Algebra/AlgebraicGroup/RootsOfUnity/Scheme.lean): The group scheme μ_n of n-th roots of unity over a commutative ring, with points rootsOfUnity n A.
- `tauceti:TauCeti.Symplectic.groupScheme` (abbrev, TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean): The symplectic group scheme Sp_{2m} over a commutative ring, for the standard antidiagonal form.
- `tauceti:TauCeti.SymplecticForm` (structure, TauCeti/Geometry/Symplectic/AlmostComplex.lean): A nondegenerate alternating real bilinear form.
- `tauceti:TauCeti.SymplecticForm.Compatible` (structure, TauCeti/Geometry/Symplectic/AlmostComplex.lean): Compatibility of J with ω: ω(Jx,Jy)=ω(x,y) and the associated symmetric form ω(x,Jy) is positive definite.
- `tauceti:TauCeti.SymplecticForm.exists_compatible` (theorem, TauCeti/Geometry/Symplectic/ExistsCompatible.lean): Every real symplectic form on a finite-dimensional space admits a compatible J.
- `tauceti:WeierstrassCurve.j_quadraticTwist` (theorem, TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean): A quadratic twist has the same j-invariant.
- `tauceti:WeierstrassCurve.not_exists_smul_quadraticTwist_eq` (theorem, TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean): For j ≠ 0,1728 the quadratic twist by a nontrivial quadratic extension is not isomorphic to the curve over the base.

<a id="m0"></a>

## M0. Linear algebra and reflex field

M0 owns the generic PEL linear algebra (RS-23 owner record): positive involutions and the Albert types A, C, D; orders, discriminants and unramified primes; symplectic O-lattices with their dual lattices and polarization types; integral, rational and p-integral PEL data with their restriction and rationalization maps; the similitude group G, its multiplier, its structure (connected with simply connected derived group in Cases A and C, 2^{[F₀:ℚ]} components in Case D) and the good-prime set p ∤ n·I_bad·Disc·[L^#:L]. The positivity condition of a datum is the polarization of a weight −1 Hodge structure of type {(−1,0),(0,−1)} with V^{−1,0} = V₀; the datum yields a Shimura datum of Hodge type when G is connected and h is nontrivial on every ℚ-simple adjoint factor (a totally definite unitary datum is a PEL datum but not a Shimura datum). The determinant condition is the full polynomial identity Det_{O|M} = Det_{O|V₀} of Kottwitz: traces classify modules only in characteristic zero, and the unit tests exhibit the characteristic-3 failure. The reflex field F₀ is the field of definition of V₀ and agrees with E(G, X) of ShimuraData D3. M0 also carries the unitary and CM linear algebra of Liu–Tian–Xiao–Zhang–Zhu routed here: hermitian spaces and V_♯, rational skew-hermitian spaces, GU(W) and the torus T₀, generalized CM types and their reflex fields, the reflexive closure, and τ-parts at unramified primes; and Bijakowski–Pilloni–Stroh's constancy of signatures above a prime of F₀.

Planets: Albert types A, C, D; Integral PEL datum; Similitude group; Polarized Hodge structure of a PEL datum; Reflex field; Kottwitz determinant condition.

### Positive involution of a semisimple ℚ-algebra

Declaration: **TauCeti.PEL.PositiveInvolution**. Node: PELModuli:M0/positive-involution. Kind: definition.

Let B be a finite-dimensional semisimple ℚ-algebra. An involution of B is a ℚ-linear map b ↦ b* with (ab)* = b*a* and b** = b. It is positive if Trd_{B/ℚ}(x x*) > 0 for every nonzero x ∈ B, where Trd_{B/ℚ} is the reduced trace (the sum over the simple factors B_i, with centre F_i, of Tr_{F_i/ℚ} composed with the reduced trace of B_i over F_i). Since Tr_{B/ℚ}(left multiplication) is a positive multiple of Trd on each simple factor, the condition is equivalent to Tr_{B/ℚ}(x x*) > 0 for x ≠ 0 and to positivity of the ℝ-linear extension on B ⊗ ℝ. A *-order is a ℤ-order O ⊂ B (a subring that is a finitely generated ℤ-module spanning B) with O* = O.

Hypotheses: B is a finite-dimensional semisimple ℚ-algebra.

Proof or construction:

1. Define the involution as a ℚ-algebra anti-automorphism of order dividing 2, recorded as a StarRing structure on B compatible with the ℚ-algebra structure.
2. Define Trd_{B/ℚ} factorwise from Wedderburn–Artin (mathlib IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing) and the field trace of each centre.
3. Prove the equivalence of the three positivity formulations factorwise (Milne ISV Proposition 8.10 (a)⇔(c) for B ⊗ ℝ).

API:

- `PositiveInvolution` (constructor): From a StarRing structure on the ℚ-algebra B and the inequality Trd_{B/ℚ}(x x*) > 0 for x ≠ 0, build the positive involution.
- `PositiveInvolution.trd_mul_star_pos` (characterisation): For x ≠ 0 in B, Trd_{B/ℚ}(x x*) > 0.
- `PositiveInvolution.iff_trace_pos` (characterisation): Positivity holds for Trd_{B/ℚ} iff it holds for the unreduced trace Tr_{B/ℚ} of left multiplication.
- `PositiveInvolution.iff_real` (equivalence): * is positive on B iff its ℝ-linear extension is positive on B ⊗_ℚ ℝ.
- `PositiveInvolution.center_stable` (relation): * preserves the centre F of B and every simple factor of B; F₀ := F^{*=1} is a product of totally real fields and F is a product of totally real fields and CM fields.
- `StarOrder` (structure): A ℤ-order O ⊂ B with star O = O; it inherits the involution.
- `PositiveInvolution.ofStarRing` (coercion): A positive involution is in particular a StarRing structure on B with star (q·x) = q·star x for q ∈ ℚ.

Unit tests:

- `positiveInvolution_rat` (degenerate): On B = ℚ with the identity involution, Trd(x·x) = x² > 0 for x ≠ 0, so id is positive.
- `positiveInvolution_transpose` (computation): On B = M_n(ℚ) with x* = xᵀ, Trd(x xᵀ) = Σ_{i,j} x_{ij}² > 0 for x ≠ 0.
- `not_positiveInvolution_adjugate` (non-example): On B = M_2(ℚ) with the canonical involution x* = adj(x), x x* = det(x)·1 and Trd(x x*) = 2 det x = −2 for x = diag(1, −1); the involution is not positive.
- `not_positiveInvolution_id_imaginary` (non-example): On B = ℚ(i) the identity involution is not positive (Trd(i·i) = −2), while complex conjugation is positive (Trd(x x̄) = 2|x|²).

Uses: Kottwitz 1992, §5, p. 389: the PEL data start from a simple ℚ-algebra B with a positive involution preserving an order O_B. PELModuli:M1/pel-abelian-scheme: Rosati compatibility i(b)^∨ ∘ λ = λ ∘ i(b*) uses the involution. AbelianSchemesAndArithmeticModuli:A6/rosati-positivity: the Rosati involution of a polarization is the source example of a positive involution on End⁰(A). PELModuli:M0/albert-types: the classification of simple factors is a classification of positive involutions.

Acceptance: (ℚ, id) and (M_n(ℚ), transpose) are positive; (M_2(ℚ), adjugate) and (ℚ(i), id) are not. Positivity on B is equivalent to positivity on B ⊗ ℝ.

Direct prerequisites: Other roadmaps and libraries: mathlib:StarRing; mathlib:IsSemisimpleRing; mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing; mathlib:Algebra.trace.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), §1.2.1, p. 45: “Let B be a finite-dimensional semisimple algebra over Q with positive involution ⋆ and center F. Here positivity of ⋆ means Tr_{B/Q}(xx⋆) > 0 for any x ≠ 0 in B.” (definition of positivity). [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) (James S. Milne), Proposition 8.10 and Definition 8.11, pp. 84–85: “(c) Tr_{C/R}(c* c) > 0 for all nonzero c ∈ C.” (equivalent real formulations). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 389: “Let * be a positive involution on B over Q (recall that this means that * induces a positive involution on B_R)” (positivity via B ⊗ ℝ).

### Types A, C and D of simple factors with positive involution

Declaration: **TauCeti.PEL.albertTypes**. Node: PELModuli:M0/albert-types. Kind: theorem.

Let (B, *) be a finite-dimensional semisimple ℚ-algebra with positive involution, with centre F and F₀ = F^{*=1}. Then * preserves each simple factor B_[τ] of B. For each embedding τ of the centre, the real algebra with involution B ⊗_{F,τ} ℝ (for τ real) or B ⊗_{F,τ} ℂ (for τ complex with c∘τ ≠ τ) is isomorphic, compatibly with the involutions, to exactly one of: M_k(ℝ) with x ↦ xᵀ (type C); M_k(ℍ) with x ↦ x̄ᵀ (type D); M_k(ℂ) with x ↦ x̄ᵀ (type A, involution of the second kind on that factor). The type is constant on each simple factor B_[τ]. Put I_bad := 2 if some factor has type D and I_bad := 1 otherwise. When B is simple, * is of the second kind iff the type is A, and the simple factors of G^ad_ℂ for the similitude group of a PEL datum over (B, *) all have that type (A, C or D respectively).

Hypotheses: (B, *) is a finite-dimensional semisimple ℚ-algebra with a positive involution.

Proof or construction:

1. Reduce to B simple by Wedderburn–Artin and stability of simple factors under * (Lan Lemma 1.2.1.11).
2. F₀ is totally real because the restriction of * to the centre is positive; F is F₀ or a CM quadratic extension of F₀ (Kottwitz §5 p. 391).
3. Classify real and complex semisimple algebras with positive involution: by Milne Proposition 8.10 a positive involution is the adjoint of a positive-definite hermitian form, and the three real division algebras give types C, D, A (Lan Propositions 1.2.1.13–1.2.1.14, Albert).
4. Constancy along a factor: the Galois orbit [τ] determines the factor, and the type is read off from the real factor algebra.
5. The identification with the Dynkin types of G^ad_ℂ follows from the structure of G₁ over ℂ: GL_n (A), Sp_{2n} (C), O_{2n} (D) (Kottwitz §5 p. 391; Lan Remark 1.2.1.16).

Acceptance: B = ℚ: type C. B = K imaginary quadratic with complex conjugation: type A. B a definite quaternion algebra over ℚ with its canonical involution: type D (B ⊗ ℝ ≅ ℍ). B an indefinite quaternion algebra with a positive involution x ↦ t⁻¹ x̄ t: type C. I_bad = 2 exactly for data involving a type D factor.

Direct prerequisites: Within this roadmap: M0/positive-involution. Other roadmaps and libraries: mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing; mathlib:NumberField.IsTotallyReal; mathlib:NumberField.IsCMField.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.2.1.15, pp. 53–54: “We say that B involves simple factors of type C if, for some morphism τ : F → R, we have an isomorphism B ⊗_{F,τ} R ≅ M_k(R) for some integer k ≥ 1 respecting their positive involutions.” (type C; types D and A are the next two clauses). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.2.1.17, p. 54: “If B involves simple factors of type D (defined as in Definition 1.2.1.15), then we set I_bad := 2. Otherwise we set simply I_bad := 1.” (I_bad). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 391: “If * is of the second kind, then G_0 is an inner form of the quasi-split unitary group over F_0 obtained from the quadratic extension F; we refer to this as Case A” (case division).

### Orders, discriminant and unramified primes of (B, O)

Declaration: **TauCeti.PEL.Order.disc**. Node: PELModuli:M0/order-discriminant. Kind: definition.

Let B be a finite-dimensional semisimple ℚ-algebra and O ⊂ B a ℤ-order. The discriminant Disc = Disc_{O/ℤ} is the ideal of ℤ generated by det(Trd_{B/ℚ}(x_i x_j))_{1≤i,j≤m} for all m-tuples x_1, …, x_m in O, m = dim_ℚ B; it is generated by det(Trd(e_i e_j)) for any ℤ-basis (e_i) of O. The inverse different is Diff⁻¹ = {x ∈ B : Trd(xO) ⊂ ℤ}. If a prime p does not divide Disc then O ⊗ ℤ_(p) is a maximal order, O ⊗ ℤ_p is a product of matrix algebras over the rings of integers of unramified extensions of ℚ_p, and p is unramified in B and in its centre F.

Hypotheses: B finite-dimensional semisimple over ℚ; O a ℤ-order in B.

Proof or construction:

1. Define Disc through the reduced trace form; independence of the basis is the change-of-basis determinant formula.
2. Prove Disc = [Diff⁻¹ : O] (Lan Proposition 1.1.1.12).
3. If p ∤ Disc then O ⊗ ℤ_(p) = Diff⁻¹ ⊗ ℤ_(p), which forces maximality, and a maximal order over a complete DVR in an unramified algebra is a product of matrix algebras (Lan Proposition 1.1.1.17, citing Reiner's Maximal Orders).

API:

- `Order.disc` (data): The discriminant ideal Disc_{O/ℤ} computed with the reduced trace form.
- `Order.disc_eq_det_basis` (characterisation): For a ℤ-basis (e_i) of O, Disc is generated by det(Trd(e_i e_j)).
- `Order.disc_eq_index_diffInv` (relation): Disc = [Diff⁻¹_{O/ℤ} : O].
- `Order.isMaximalAt_of_not_dvd_disc` (other): If p ∤ Disc, O ⊗ ℤ_(p) is a maximal order.
- `Order.matrixAlgebra_of_not_dvd_disc` (other): If p ∤ Disc, O ⊗ ℤ_p ≅ ∏ M_{n_i}(O_{F_i} ⊗ ℤ_p) with p unramified in each F_i.
- `Order.disc_numberField` (compatibility): For O = O_F in a number field F, Disc_{O/ℤ} = (NumberField.discr F).
- `Order.map_star` (other): If O is a *-order, Diff⁻¹ is *-stable.

Unit tests:

- `Order.disc_numberField_quadratic` (compatibility): For F = ℚ(√−1) and O = ℤ[i], Disc = 4ℤ = (NumberField.discr F).
- `Order.disc_matrix` (degenerate): For O = M_2(ℤ) ⊂ M_2(ℚ), Disc = ℤ (the reduced trace form is unimodular).
- `Order.disc_nonmaximal` (non-example): For the non-maximal order ℤ[2i] ⊂ ℚ(i), Disc = 16ℤ: 2 divides Disc and ℤ[2i] ⊗ ℤ_(2) is not maximal, so p ∤ Disc is genuinely stronger than p unramified in F.

Uses: Lan 2008, Definition 1.4.1.1: good primes are those not dividing n·I_bad·Disc·[L^#:L]. Kottwitz 1992, §5: the p-integral data require B_{ℚ_p} a product of matrix algebras over unramified extensions and O_B maximal at p. PELModuli:M0/good-primes: the bad-prime set contains the primes dividing Disc.

Acceptance: For B = F a number field and O = O_F, Disc = disc(F)ℤ (agreement with Mathlib's NumberField.discr). For B = M_n(ℚ), O = M_n(ℤ): Disc = ℤ, every prime is unramified. For B the definite quaternion algebra of discriminant 2 and O a maximal order: Disc = 4ℤ (reduced discriminant 2 squared) and 2 is ramified.

Direct prerequisites: Other roadmaps and libraries: mathlib:Algebra.discr; mathlib:NumberField.discr; mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.1.1.6, p. 4: “The discriminant Disc = Disc_{O/R} is the ideal of R generated by the set of elements {Det_{Frac(R)}(Tr_{A/Frac(R)} x_i x_j)_{1≤i,j≤m} : x_1, …, x_m any m elements in O}.” (definition (traces are reduced, p. 4)). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Proposition 1.1.1.17, p. 6: “Suppose p is a nonzero prime ideal of R such that p ∤ Disc_{O/R}. Then: 1. O is maximal at p.” (consequences of p ∤ Disc).

### Symplectic O-lattice and its dual lattice

Declaration: **TauCeti.PEL.SymplecticOLattice**. Node: PELModuli:M0/symplectic-o-lattice. Kind: definition.

Let (B, *) be as above and O a *-order. A symplectic O-lattice is a pair (L, ⟨·,·⟩) where L is a left O-module, finitely generated and torsion-free over ℤ, and ⟨·,·⟩ : L × L → ℤ(1) is a ℤ-bilinear alternating pairing with values in ℤ(1) = ker(exp: ℂ → ℂ^×), nondegenerate after ⊗ℚ, such that ⟨bx, y⟩ = ⟨x, b*y⟩ for b ∈ O, x, y ∈ L. Its dual is L^# := {x ∈ L ⊗ ℚ : ⟨x, L⟩ ⊂ ℤ(1)}, an O-lattice containing L with finite index [L^# : L]; L is self-dual at p if L ⊗ ℤ_p = L^# ⊗ ℤ_p. The multi-rank (m_[τ]) of L records the multiplicity of each simple B-module in L ⊗ ℚ. Choosing √−1 identifies ℤ(1) with ℤ; the definition does not depend on the choice.

Hypotheses: O a *-order in a semisimple ℚ-algebra with positive involution.

Proof or construction:

1. Record ⟨·,·⟩ as a ℤ(1)-valued alternating form (mathlib LinearMap.BilinForm.IsAlt after the √−1 identification) with b and b* an adjoint pair (mathlib LinearMap.IsAdjointPair).
2. Define L^# with mathlib LinearMap.BilinForm.dualSubmodule on L ⊗ ℚ; it is O-stable because the adjoint of b is b*.
3. Finiteness of [L^# : L] and L^## = L follow from nondegeneracy over ℚ (Tau Ceti LinearMap.BilinForm.dualSubmodule_dualSubmodule_flip, no symmetry needed).
4. The elementary divisors of the Gram matrix (Tau Ceti Matrix.exists_smith_normal_form_of_det_ne_zero) give the polarization type when O = ℤ.

API:

- `SymplecticOLattice` (structure): An O-module L, finite free over ℤ, with an alternating ℤ(1)-valued form, nondegenerate over ℚ, for which b and b* are adjoint.
- `SymplecticOLattice.adjoint` (relation): ⟨b x, y⟩ = ⟨x, b* y⟩ for all b ∈ O.
- `SymplecticOLattice.dual` (data): L^# ⊂ L ⊗ ℚ, the dual lattice; an O-submodule.
- `SymplecticOLattice.le_dual` (other): L ⊆ L^# and [L^# : L] is finite.
- `SymplecticOLattice.dual_dual` (simp): (L^#)^# = L.
- `SymplecticOLattice.IsSelfDualAt` (data): L ⊗ ℤ_p = L^# ⊗ ℤ_p; holds for all p ∤ [L^# : L].
- `SymplecticOLattice.multiRank` (data): The multi-rank (m_[τ]) of L ⊗ ℚ as a B-module.
- `SymplecticOLattice.polarizationType` (other): For O = ℤ, the elementary divisors d_1 | … | d_g with L ≅ ⊕ (ℤ e_i ⊕ ℤ f_i), ⟨e_i, f_i⟩ = d_i; [L^# : L] = (d_1⋯d_g)².
- `SymplecticOLattice.baseChange` (functoriality): Extension of scalars to any ℤ-algebra R gives (L ⊗ R, ⟨·,·⟩) with R(1)-valued form; nondegeneracy is not preserved for non-flat R.

Unit tests:

- `SymplecticOLattice.dual_standard` (computation): For L = ℤ^{2g} with the standard symplectic Gram matrix J, L^# = L and [L^# : L] = 1.
- `SymplecticOLattice.index_type` (computation): For L = ℤ^4 with Gram matrix diag-blocks (0 1; −1 0) and (0 d; −d 0), [L^# : L] = d² and the type is (1 | d).
- `SymplecticOLattice.zero` (degenerate): L = 0 is a symplectic O-lattice with L^# = 0 and empty multi-rank.
- `SymplecticOLattice.not_symmetric` (non-example): The symmetric form ⟨x, y⟩ = xy on ℤ is not alternating, so (ℤ, xy) is not a symplectic ℤ-lattice; double duality nevertheless holds there, so it is alternation that must be checked.

Uses: Lan 2008, Definition 1.2.1.3: a PEL-type O-lattice is a symplectic O-lattice satisfying Condition 1.2.1.2. Kottwitz 1992, §5: a lattice Λ₀ in V_{ℚ_p} self-dual for (·,·) and preserved by O_B is part of the p-integral data. PELModuli:M1/principal-level-structure: level structures are symplectic isomorphisms (L/nL)_S ≅ A[n]. PELModuli:M5/siegel-pel-datum: polarization types (d_1 | … | d_g) are the elementary divisors of L.

Acceptance: L = ℤ^{2g} with the standard form: L^# = L. L = ℤ^4 with ⟨e_1,f_1⟩ = 1, ⟨e_2,f_2⟩ = d: [L^# : L] = d².

Direct prerequisites: Within this roadmap: M0/positive-involution. Other roadmaps and libraries: mathlib:LinearMap.BilinForm.IsAlt; mathlib:LinearMap.IsAdjointPair; mathlib:LinearMap.BilinForm.Nondegenerate; mathlib:LinearMap.BilinForm.dualSubmodule; tauceti:LinearMap.BilinForm.dualSubmodule_dualSubmodule_flip; tauceti:Matrix.exists_smith_normal_form_of_det_ne_zero; mathlib:Submodule.IsLattice.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), §1.2.1, p. 46: “Let (L, ⟨·,·⟩, Z(1)) be a symplectic O-pairing (defined as in Definition 1.1.4.9) valued in Z(1).” (the pairing is ℤ(1)-valued). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.4.1.1, p. 148: “We say that a prime number p is bad if p | n I_bad Disc [L^# : L].” (the index [L^#:L] enters the bad primes). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §1, p. 374: “a nondegenerate Q-valued alternating form (·,·) such that (bv, w) = (v, b*w) for all v, w ∈ V and all b ∈ B” (skew-Hermitian B-module).

### Integral PEL datum (PEL-type O-lattice)

Declaration: **TauCeti.PEL.IntegralPELDatum**. Node: PELModuli:M0/integral-pel-datum. Kind: definition.

An integral PEL datum is a tuple (O, *, L, ⟨·,·⟩, h) where O is a *-order in a finite-dimensional semisimple ℚ-algebra B with positive involution *, (L, ⟨·,·⟩) is a symplectic O-lattice, and h : ℂ → End_{O⊗ℝ}(L ⊗ ℝ) is an ℝ-algebra homomorphism such that (1) ⟨h(z)x, y⟩ = ⟨x, h(z̄)y⟩ for z ∈ ℂ and x, y ∈ L ⊗ ℝ, and (2) for either choice of √−1 the ℝ-bilinear form (x, y) ↦ (1/√−1)⟨x, h(√−1)y⟩ on L ⊗ ℝ is symmetric and positive definite (Lan's Condition 1.2.1.2). Only the existence of h is part of the datum in the moduli problems; any two choices are G(ℝ)-conjugate (M0/hodge-structure-of-datum). Connectedness of the similitude group and the Shimura axioms are not part of the definition.

Hypotheses: (B, *) semisimple with positive involution; O a *-order; (L, ⟨·,·⟩) a symplectic O-lattice.

Proof or construction:

1. Bundle the data; record Condition 1.2.1.2 with the real-symmetric positive-definite form h-paired with ⟨·,·⟩ (compare Tau Ceti SymplecticForm.Compatible for J = h(√−1)).
2. Record that condition (2) forces nondegeneracy of ⟨·,·⟩ over ℝ (Lan, Condition 1.2.1.2 (2)).

API:

- `IntegralPELDatum` (structure): Fields: the *-order O, the symplectic O-lattice L with ℤ(1)-valued form, and an ℝ-algebra map h : ℂ → End_{O⊗ℝ}(L⊗ℝ) satisfying adjointness and positivity.
- `IntegralPELDatum.h_adjoint` (relation): ⟨h(z)x, y⟩ = ⟨x, h(z̄)y⟩.
- `IntegralPELDatum.pos` (characterisation): (x, y) ↦ (1/√−1)⟨x, h(√−1)y⟩ is symmetric positive definite on L ⊗ ℝ.
- `IntegralPELDatum.compatible` (compatibility): With ω = (1/√−1)⟨·,·⟩ and J = h(√−1), Tau Ceti SymplecticForm.Compatible ω J holds; conversely a compatible J commuting with O ⊗ ℝ defines h(a + b√−1) = a + bJ.
- `IntegralPELDatum.rationalize` (functoriality): The rational PEL datum (B, *, L ⊗ ℚ, ⟨·,·⟩, h) (M0/rational-pel-datum).
- `IntegralPELDatum.nondegenerate_real` (other): Condition (2) implies ⟨·,·⟩ is nondegenerate on L ⊗ ℝ.
- `IntegralPELDatum.ofSubOrder` (functoriality): Restricting to a *-stable suborder O' ⊂ O gives an integral PEL datum (used for the change of order in M1/change-of-lattice-and-primes).

Unit tests:

- `IntegralPELDatum.siegel` (computation): For O = ℤ, L = ℤ^{2g}, ψ(x, y) = xᵀ J y with Mathlib's Matrix.J (identifying ℤ(1) with ℤ by 1/√−1) and h(√−1) = −J: ψ(x, h(√−1)y) = xᵀ y, the standard dot product, so Condition (2) holds.
- `IntegralPELDatum.zero` (degenerate): L = 0 with h the unique map is an integral PEL datum; its similitude group is G_m (M0/similitude-group).
- `IntegralPELDatum.wrong_sign` (non-example): For the same L and ψ but h(√−1) = J, ψ(x, h(√−1)y) = −xᵀ y is negative definite, so (ℤ, id, ℤ^{2g}, ψ, h) with this h is not a PEL datum.
- `IntegralPELDatum.compatible_iff` (compatibility): Condition (2) for (L ⊗ ℝ, ⟨·,·⟩, h) is equivalent to Tau Ceti SymplecticForm.Compatible (−√−1⟨·,·⟩) (h(√−1)).

Uses: Lan 2008, Definition 1.4.1.4: the moduli problem M_H is attached to a PEL-type O-lattice. HilbertModularVarietiesAndShimuraCurves:H1: the trace-pairing polarization-module datum is an instance (RS-23 owner record). PELModuli:M5/unitary-pel-datum: unitary examples are integral PEL data over CM fields. IgusaVarietiesAndTorsionConcentration:IG.0: instantiates the PEL objects for its split unitary datum.

Acceptance: (ℤ, id, ℤ^{2g}, standard form, h(i) = J) is an integral PEL datum (Siegel case, M5/siegel-pel-datum). A definite hermitian space of signature (n, 0) at every place of a CM field gives an integral PEL datum (with h central); it does not give a Shimura datum satisfying SV3 (M0/pel-shimura-datum).

Direct prerequisites: Within this roadmap: M0/symplectic-o-lattice; M0/positive-involution. Other roadmaps and libraries: tauceti:TauCeti.SymplecticForm.Compatible; tauceti:TauCeti.SymplecticForm; tauceti:TauCeti.AlmostComplexStructure.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Condition 1.2.1.2, pp. 46–47: “There exists an R-algebra homomorphism h : C → End_{O⊗R}(L ⊗ R) such that ... ⟨h(z)x, y⟩ = ⟨x, h(z^c)y⟩ ... is symmetric and positive-definite.” (Condition 1.2.1.2). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.2.1.3, p. 47: “A PEL-type O-lattice (L, ⟨·,·⟩) is a symplectic O-lattice (L, ⟨·,·⟩) such that (L ⊗_Z R, ⟨·,·⟩) satisfies Condition 1.2.1.2.” (definition). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.2.1.4, p. 47: “What we have in mind is that the datum (O, ⋆, L, ⟨·,·⟩, h) is an integral version of (B, ⋆, V, ⟨·,·⟩, h) in [79] and related works.” (relation to Kottwitz's rational data).

### Rational and p-integral PEL data

Declaration: **TauCeti.PEL.RationalPELDatum**. Node: PELModuli:M0/rational-pel-datum. Kind: definition.

A rational PEL datum is (B, *, V, ⟨·,·⟩, h): B a finite-dimensional semisimple ℚ-algebra with positive involution, V a finitely generated faithful left B-module, ⟨·,·⟩ a nondegenerate ℚ-valued (equivalently ℚ(1)-valued) alternating form with ⟨bv, w⟩ = ⟨v, b*w⟩, and h : ℂ → End_B(V ⊗ ℝ) as in Condition 1.2.1.2. For a prime p, a p-integral PEL datum (Kottwitz §5) is a rational datum together with a ℤ_(p)-order O_B ⊂ B stable under *, maximal at p, such that B ⊗ ℚ_p is a product of matrix algebras over unramified extensions of ℚ_p, and an O_B ⊗ ℤ_p-stable lattice Λ₀ ⊂ V ⊗ ℚ_p self-dual for ⟨·,·⟩. The rationalization map sends an integral datum (O, *, L, ⟨·,·⟩, h) to (O ⊗ ℚ, *, L ⊗ ℚ, ⟨·,·⟩, h); for p ∤ I_bad·Disc·[L^#:L] the restriction (O ⊗ ℤ_(p), L ⊗ ℤ_p) is a p-integral datum.

Hypotheses: B semisimple with positive involution.

Proof or construction:

1. Define both structures; the p-integral conditions are those of Kottwitz §5 (for B simple) extended factorwise.
2. Construct the rationalization map; it forgets the lattice but retains the adelic lattice class L ⊗ Ẑ used by the moduli problems (Lan Remark 1.2.1.9).
3. Prove that p ∤ Disc gives the order conditions (M0/order-discriminant) and p ∤ [L^#:L] gives self-duality of Λ₀ = L ⊗ ℤ_p.

API:

- `RationalPELDatum` (structure): (B, *, V, ⟨·,·⟩, h) with V faithful, ⟨·,·⟩ nondegenerate alternating with b, b* adjoint, and h satisfying Condition 1.2.1.2 over ℝ.
- `PIntegralPELDatum` (structure): A rational datum with a *-stable ℤ_(p)-order maximal at p, B_{ℚ_p} a product of matrix algebras over unramified extensions, and a self-dual O_B ⊗ ℤ_p-lattice Λ₀.
- `IntegralPELDatum.toRational` (functoriality): Rationalization of an integral datum.
- `IntegralPELDatum.toPIntegral` (functoriality): For p ∤ I_bad·Disc·[L^#:L], the restriction to a p-integral datum with Λ₀ = L ⊗ ℤ_p.
- `RationalPELDatum.adelicLattice` (data): For an integral datum, the Ẑ-lattice L ⊗ Ẑ in V ⊗ 𝔸_f; only its class matters for the rational moduli problem (Lan Remark 1.4.2.7).
- `RationalPELDatum.centralizer` (data): C := End_B(V) with the adjoint involution of ⟨·,·⟩; h takes values in C ⊗ ℝ (Kottwitz §5).

Unit tests:

- `RationalPELDatum.siegel_pIntegral` (computation): The Siegel rational datum (ℚ, id, ℚ^{2g}, J, h) with Λ₀ = ℤ_p^{2g} is p-integral for every prime p.
- `IntegralPELDatum.toPIntegral_type` (non-example): For the Siegel datum of type (1 | p) (Gram blocks with d = p), L ⊗ ℤ_p is not self-dual, so toPIntegral is not available at p although it is at every ℓ ≠ p.
- `RationalPELDatum.zero` (degenerate): V = 0 is excluded (faithfulness fails for B ≠ 0), but B = 0, V = 0 is allowed and gives G = G_m.
- `IntegralPELDatum.toRational_injective_fails` (non-example): The lattices ℤ² and 2ℤ ⊕ ℤ (with the standard form restricted) have the same rationalization; the rational datum forgets the lattice.

Uses: Kottwitz 1992, §5: the p-integral data define the moduli problem S_{K^p} over O_E ⊗ ℤ_(p). Milne ISV, Theorem 8.17: the characteristic-zero moduli description uses the rational datum only. PELModuli:M1/char-zero-adelic-moduli: the all-primes adelic moduli problem over the reflex field uses the rational datum. PELModuli:M1/rational-moduli-problem: the prime-to-□ quasi-isogeny moduli problem depends on (V ⊗ 𝔸^{∞,□}, L ⊗ Ẑ^□ class).

Acceptance: The Siegel datum restricts to a p-integral datum for every p. Two integral data with isomorphic L ⊗ Ẑ and isomorphic rational data have the same p-integral restrictions at all good p (used by M1/change-of-lattice-and-primes).

Direct prerequisites: Within this roadmap: M0/integral-pel-datum; M0/order-discriminant. 

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 389: “Let O_B be a Z_(p)-order in B whose p-adic completion is a maximal order in B_{Q_p}.” (p-integral order). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 389: “Assume that there exists a lattice Λ₀ in V_{Q_p} that is self-dual for (·,·) and is preserved by O_B.” (self-dual lattice at p). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.2.1.4, p. 47: “the datum (O, ⋆, L, ⟨·,·⟩, h) is an integral version of (B, ⋆, V, ⟨·,·⟩, h) in [79]” (rationalization).

### The similitude group G of a PEL datum

Declaration: **TauCeti.PEL.PELDatum.similitudeGroup**. Node: PELModuli:M0/similitude-group. Kind: construction.

For an integral PEL datum and a commutative ℤ-algebra R put G(R) := {(g, r) ∈ GL_{O⊗R}(L ⊗ R) × G_m(R) : ⟨gx, gy⟩ = r⟨x, y⟩ for all x, y ∈ L}. This is an affine group scheme over ℤ, a closed subgroup scheme of GL(L) × G_m, with similitude character ν(g, r) = r and kernel G₁ = ker ν. Over ℚ it is the linear algebraic group of B-linear symplectic similitudes of V = L ⊗ ℚ; G(ℤ/nℤ), G(Ẑ^□), U^□(n) = ker(G(Ẑ^□) → G(ℤ/nℤ)) and G(𝔸^{∞,□}) are defined from it. When L ≠ 0 the multiplier r is determined by g; when L = 0, G = G_m. Over a non-flat ℤ-algebra the pairing may degenerate, and G need not be smooth over ℤ.

Hypotheses: an integral PEL datum (O, *, L, ⟨·,·⟩, h).

Proof or construction:

1. Present G as the closed subscheme of GL(L) × G_m cut out by the B-linearity and multiplier equations; for O = ℤ and the standard form this is the closed subgroup scheme of Tau Ceti ConstantForm.groupScheme type with an extra multiplier coordinate.
2. Construct ν and G₁ = ker ν; G₁ is the B-linear isometry group, which for O = ℤ, L standard is Tau Ceti Symplectic.groupScheme.
3. Construct the rational group G_ℚ and its points in ℚ_p, 𝔸_f, ℝ.
4. Record the representation G → GL(L) and the Siegel embedding G ↪ GSp(L, ⟨·,·⟩) (forgetting B).

API:

- `PELDatum.similitudeGroup` (constructor): The affine group scheme G over ℤ with G(R) the pairs (g, r) as in Lan Definition 1.2.1.5.
- `PELDatum.multiplier` (data): The similitude character ν : G → G_m.
- `PELDatum.isometryGroup` (data): G₁ := ker ν.
- `PELDatum.similitudeGroup.points_iff` (characterisation): (g, r) ∈ G(R) iff g is O ⊗ R-linear and ⟨gx, gy⟩ = r⟨x, y⟩.
- `PELDatum.similitudeGroup.multiplier_unique` (other): If L ≠ 0, r is determined by g.
- `PELDatum.similitudeGroup.siegelEmbedding` (functoriality): The closed immersion G ↪ GSp(L, ⟨·,·⟩) forgetting O.
- `PELDatum.similitudeGroup.principalCongruence` (data): U^□(n) := ker(G(Ẑ^□) → G(ℤ/nℤ)) for n prime to □.
- `PELDatum.similitudeGroup.isometry_siegel` (compatibility): For the Siegel datum, G₁ agrees with Tau Ceti Symplectic.groupScheme ℤ g, and G(A) ≅ {M : Mᵀ J M = r J} for the standard J (Mathlib Matrix.J convention).
- `PELDatum.similitudeGroup.ofZero` (example): L = 0 gives G ≅ G_m.

Unit tests:

- `similitudeGroup_siegel_one` (computation): For g = 1, G(ℤ) = GL_2(ℤ) with ν = det (Tau Ceti Matrix.transpose_mul_J_mul_eq_det_smul: Aᵀ J A = det(A) J).
- `similitudeGroup_zero` (degenerate): For L = 0, G(R) = R^× for every R.
- `isometryGroup_siegel` (compatibility): For the Siegel datum, G₁ = TauCeti.Symplectic.groupScheme ℤ g as closed subgroup schemes of GL_{2g}.
- `similitudeGroup_not_isometry` (non-example): For g = 1, diag(2, 1) ∈ G(ℚ) with ν = 2 but diag(2,1) ∉ G₁(ℚ): the similitude group is strictly larger than the isometry group.

Uses: Lan 2008, Definition 1.4.1.4: levels are open compact subgroups H ⊂ G(Ẑ^□). Kottwitz 1992, §§7–8: the complex points are indexed by ker¹(ℚ, G) and described by G(ℚ)\X × G(𝔸_f)/K. ShimuraData:D4/shimura-datum: the PEL Shimura datum has group G_ℚ. PELModuli:M3/complex-points: the double coset description uses G(ℚ), G(𝔸_f) and the G(ℝ)-orbit of h.

Acceptance: For the Siegel datum G = GSp_{2g} over ℤ, and G₁ = Sp_{2g} (Tau Ceti Symplectic.groupScheme). For B = K imaginary quadratic and a hermitian space of dimension n, G_ℚ = GU(V) with G₁ = U(V). L = 0 gives G = G_m (Lan p. 48).

Direct prerequisites: Within this roadmap: M0/integral-pel-datum. Other roadmaps and libraries: tauceti:TauCeti.ConstantForm.groupScheme; tauceti:TauCeti.GeneralLinear.groupScheme; tauceti:TauCeti.Symplectic.groupScheme; tauceti:Matrix.transpose_mul_J_mul_eq_det_smul.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.2.1.5, p. 47: “G(R) := {(g, r) ∈ GL_{O⊗R}(L ⊗ R) × G_m(R) : ⟨gx, gy⟩ = r⟨x, y⟩, ∀x, y ∈ L}.” (definition). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.2.1.6, p. 48: “For a general non-flat Z-algebra R, the pairing induced by ⟨·,·⟩ on L ⊗ R is not necessarily nondegenerate. This suggests that G is not necessarily a smooth functor over the whole base Z.” (no smoothness over ℤ claimed). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 389: “Let G be the algebraic group over Q whose points in any Q-algebra R are given by {x ∈ C ⊗_Q R | xx* ∈ R^×}” (rational group via C = End_B(V)).

### Structure of G: connectedness, derived group and type D components

Declaration: **TauCeti.PEL.similitudeGroupStructure**. Node: PELModuli:M0/similitude-group-structure. Kind: theorem.

Let (B, *, V, ⟨·,·⟩, h) be a rational PEL datum with B simple, and G, G₁ its similitude and isometry groups over ℚ. In Cases A and C, G is connected reductive and its derived group is simply connected; in Case D, G is reductive with 2^{[F₀:ℚ]} connected components. In Cases A and C the quotient D := G/G^der is the torus G_m (Case C) or the subtorus {(x, t) ∈ F^× × ℚ^× : N_{F/F₀}(x) = t^n} (Case A, n the hermitian dimension). Two elements x, y ∈ G(K) (K algebraically closed of characteristic 0) are conjugate iff ν(x) = ν(y) and their images in (End_B V)^× are conjugate.

Hypotheses: B simple (the semisimple case is the fibre product over G_m of the factor groups); rational PEL datum.

Proof or construction:

1. Over ℚ̄, G₁ decomposes as a product over embeddings of F₀ of GL_n (A), Sp_{2n} (C) or O_{2n} (D) (Kottwitz §5, p. 391; Milne Proposition 8.7 and Remark 8.9).
2. Connectedness and simple connectivity of the derived group in Cases A and C follow from those of GL_n/SL_n and Sp_{2n}; O_{2n} has two components, giving 2^{[F₀:ℚ]} components for G₁ and G in Case D.
3. Compute G/G^der from the norm and multiplier (Kottwitz §7, p. 393).
4. The conjugacy criterion is Kottwitz Lemma 7.1, proved factorwise for GL_n ⊂ GL_n × GL_n, Sp_{2n} ⊂ GL_{2n}, O_{2n} ⊂ GL_{2n}.

Acceptance: Siegel: G = GSp_{2g} connected with G^der = Sp_{2g} simply connected and D = G_m. Definite quaternion algebra over ℚ with V = B² (Case D): G has 2 components.

Direct prerequisites: Within this roadmap: M0/similitude-group; M0/albert-types. Other roadmaps and libraries: tauceti:TauCeti.Symplectic.groupScheme; tauceti:TauCeti.Orthogonal.groupScheme.

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §7, p. 393: “In Cases A and C the group G is connected and reductive, while in Case D it is reductive with 2^[F_0:Q] connected components. Moreover in Cases A and C the derived group of G is simply connected.” (statement). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), Lemma 7.1, p. 395: “Two elements x, y of G(K) are conjugate if and only if c(x) = c(y) and i(x), i(y) are conjugate in H(K).” (conjugacy criterion). [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) (James S. Milne), Remark 8.9, p. 84: “In case (D), the groups G and G1 have 2^[F:k] connected components, and their identity components are reductive.” (type D components).

### Bad primes and the good-prime base

Declaration: **TauCeti.PEL.PELDatum.badPrimeInteger**. Node: PELModuli:M0/good-primes. Kind: definition.

For an integral PEL datum and an integer n ≥ 1, a prime p is bad if p | n·I_bad·Disc·[L^# : L], and good otherwise; a set □ of primes is a set of good primes if it contains no bad prime. The good-prime base is S₀ := Spec O_{F₀,(□)}, the localization of the ring of integers of the reflex field F₀ at the primes above □ (for □ = ∅, S₀ = Spec F₀). For p ∈ □: p ∤ Disc (O maximal at p, B unramified at p), p ≠ 2 if B has a type D factor, L ⊗ ℤ_p is self-dual, and p ∤ n, so a level H ⊂ G(Ẑ^□) has no component at p. These hypotheses are not implied by 'p large': each is a separate condition.

Hypotheses: an integral PEL datum; n ≥ 1.

Proof or construction:

1. Define the bad-prime integer N_bad = n·I_bad·Disc·[L^#:L] and the predicate on sets of primes.
2. Show p good ⇒ (O ⊗ ℤ_(p), L ⊗ ℤ_p) is a p-integral datum (M0/rational-pel-datum).
3. p good ⇒ p unramified in F₀ (Lan Corollary 1.2.5.7 via p ∤ Disc ⇒ p unramified in F).

API:

- `PELDatum.badPrimeInteger` (data): N_bad(n) = n · I_bad · Disc · [L^# : L].
- `PELDatum.IsGoodPrime` (data): p ∤ N_bad(n).
- `PELDatum.IsGoodSet` (data): A set □ of primes with no bad element.
- `PELDatum.goodBase` (constructor): S₀ = Spec O_{F₀,(□)}.
- `PELDatum.IsGoodPrime.toPIntegral` (other): A good prime gives a p-integral datum.
- `PELDatum.IsGoodPrime.not_two_of_typeD` (other): If B has a type D factor, 2 is bad.
- `PELDatum.IsGoodPrime.unramified_reflex` (other): A good prime is unramified in F and in F₀.

Unit tests:

- `goodPrime_siegel` (computation): For the principally polarized Siegel datum and n = 3, the bad primes are {3}.
- `goodPrime_type` (computation): For the Siegel datum of type (1 | 6) and n = 1, the bad primes are {2, 3}.
- `goodPrime_typeD_two` (non-example): For B the definite quaternion algebra over ℚ ramified at {3, ∞} with its canonical (type D) involution, I_bad = 2: if a datum over B has 2 ∤ n·Disc·[L^#:L], 2 is nevertheless bad.
- `goodBase_empty` (degenerate): For □ = ∅, S₀ = Spec F₀ and every datum is good.

Uses: Lan 2008, §1.4.1: the moduli problems M_H are defined over S₀ = Spec O_{F₀,(□)} for □ a set of good primes. ShimuraCompactifications:C5: keeps the good-prime assumptions on the input PEL datum. PELModuli:M2/representability: smoothness over S₀ uses every clause of goodness.

Acceptance: Siegel datum with principal polarization: the bad primes are exactly those dividing n. Definite quaternion datum (type D): 2 is always bad. Siegel type (1 | d): primes dividing d are bad.

Direct prerequisites: Within this roadmap: M0/order-discriminant; M0/symplectic-o-lattice; M0/albert-types; M0/rational-pel-datum. 

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.4.1.1, p. 148: “We say that a prime number p is bad if p|n I_bad Disc[L^# : L]. We say a prime number p is good if it is not bad. We say that □ is a set of good primes if it does not contain any bad primes.” (definition). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 391: “Now assume that p ≠ 2 if we are in Case D.” (type D exclusion at 2).

### Positivity and the polarized Hodge structure of a PEL datum

Declaration: **TauCeti.PEL.hodgeStructureOfDatum**. Node: PELModuli:M0/hodge-structure-of-datum. Kind: theorem.

Let (B, *, V, ⟨·,·⟩) be a rational datum. For an ℝ-algebra homomorphism h : ℂ → End_B(V ⊗ ℝ) with ⟨h(z)x, y⟩ = ⟨x, h(z̄)y⟩, the following are equivalent: (a) (x, y) ↦ (1/√−1)⟨x, h(√−1)y⟩ is symmetric positive definite; (b) the Hodge structure on V of type {(−1, 0), (0, −1)} with V^{−1,0} = V₀ := {v ∈ V ⊗ ℂ : h(z)v = zv} is polarized by 2π√−1·⟨·,·⟩ (Deligne's sign conventions), and B acts by endomorphisms of Hodge structures. Moreover V ⊗ ℂ = V₀ ⊕ V₀ᶜ with V₀ and V₀ᶜ totally isotropic B ⊗ ℂ-submodules; for (B, *) of type A or C such an h exists (Milne Proposition 8.14, after Zink); whenever h exists, any two such h are conjugate under G₁(ℝ) (Kottwitz Lemma 4.3), so the G(ℝ)-conjugacy class X of h is determined by the datum.

Hypotheses: (B, *, V, ⟨·,·⟩) rational datum; h : ℂ → End_B(V ⊗ ℝ) an ℝ-algebra homomorphism with h(z)* = h(z̄).

Proof or construction:

1. (a)⇔(b): compare with the Riemann relations of weight one (Tau Ceti TauCeti.Hodge.isPolarization_of_weilOperator_invariant_on_realPoints_of_pos, Weil operator h(√−1)); the bridge from Tau Ceti AlmostComplexStructure.hodgeStructure (no lattice) to the lattice-based IsPolarization is supplied here.
2. Isotropy of V₀, V₀ᶜ: ⟨h(z)x, h(z)y⟩ = |z|²⟨x, y⟩ forces ⟨V₀, V₀⟩ = 0 (Lan §1.3.4, p. 124).
3. Existence of h for types A and C: Milne Proposition 8.12 and 8.14 (Zink); uniqueness up to G₁(ℝ)-conjugacy: Kottwitz Lemma 4.3 by the signature argument for the hermitian form ⟨v, √−1 w⟩ + √−1⟨v, w⟩.

Acceptance: For the Siegel datum, V₀ is the +√−1-eigenspace of J and the polarization is the standard Riemann form. For a CM field K with signature (r_τ, s_τ), dim_ℂ (V₀)_τ = r_τ (M0/signatures).

Direct prerequisites: Within this roadmap: M0/integral-pel-datum; M0/rational-pel-datum; M0/similitude-group. Other roadmaps and libraries: tauceti:TauCeti.AlmostComplexStructure.hodgeStructure; tauceti:TauCeti.Hodge.HodgeStructureOn; tauceti:TauCeti.Hodge.IsPolarization; tauceti:TauCeti.Hodge.isPolarization_of_weilOperator_invariant_on_realPoints_of_pos; tauceti:TauCeti.SymplecticForm.exists_compatible; tauceti:TauCeti.SymplecticForm.Compatible.

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), Lemma 4.3, p. 388: “Suppose that B, *, V, (·,·), h are as before and that h′: C → C is another *-homomorphism such that (v, h′(i)w) is positive definite. Then h′ and h are conjugate under G_1(R).” (uniqueness). [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) (James S. Milne), Proposition 8.14, p. 86: “There exists a homomorphism h: S → G_R such that (V, h) has type {(−1,0),(0,−1)}” (existence (Zink) with polarization). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), §1.3.4, p. 125: “where h(z) acts by 1 ⊗ z on V_0, and by 1 ⊗ z^c on V_0^c. Moreover, both V_0 and V_0^c are totally isotropic under the pairing ⟨·,·⟩.” (decomposition and isotropy).

### The Shimura datum (G, X) of a PEL datum

Declaration: **TauCeti.PEL.RationalPELDatum.domain**. Node: PELModuli:M0/pel-shimura-datum. Kind: construction.

For a rational PEL datum put X := the G(ℝ)-conjugacy class of h, viewed via the Deligne torus as homomorphisms h : S → G_ℝ (Deligne's convention, (V, h) of type {(−1,0),(0,−1)}). (G, h) satisfies: h(ℝ^×) is central; the cocharacter μ_h acts on Lie G_ℂ with weights in {−1, 0, 1}; Int h(√−1) is a Cartan involution of G₁/(centre) (Kottwitz Lemma 4.1). When G is connected (no type D factor) and h is nontrivial on every ℚ-simple factor of G^ad, (G, X) is a Shimura datum in the sense of ShimuraData:D4/shimura-datum, and the Siegel embedding G ↪ GSp(V) gives a morphism of Shimura data into a Siegel datum, so (G, X) is of Hodge type. Kottwitz writes the same object as (G, h⁻¹) under the opposite sign convention; the conversion is recorded.

Hypotheses: a rational PEL datum.

Proof or construction:

1. Define X as the G(ℝ)-orbit of h|_{S} and record the sign dictionary with ShimuraData (type (p, q) ↔ character z^{−p} z̄^{−q}).
2. Prove Kottwitz Lemma 4.1 (1)–(3) for (G, h) (central weight, weights of the adjoint action, Cartan involution via a positive involution on C ⊗ ℂ).
3. Under connectedness and nontriviality on Q-simple factors, conclude the Shimura axioms (Milne §8: SV1, SV2, SV4 from the Siegel embedding; SV3 from nontriviality).
4. Construct the datum morphism (G, X) → (GSp(V), Siegel half spaces) of ShimuraData:D5/siegel-datum.

API:

- `RationalPELDatum.domain` (data): X := G(ℝ)-conjugacy class of h as homomorphisms S → G_ℝ.
- `RationalPELDatum.domain_indep` (characterisation): X does not depend on the choice of h satisfying Condition 1.2.1.2 (M0/hodge-structure-of-datum).
- `RationalPELDatum.kottwitz_axioms` (relation): Kottwitz Lemma 4.1 (1)–(3) hold for (G, h).
- `RationalPELDatum.toShimuraDatum` (constructor): If G is connected and h is nontrivial on each ℚ-simple factor of G^ad, the ShimuraData:D4 datum (G, X).
- `RationalPELDatum.siegelMorphism` (functoriality): The morphism of data (G, X) → (GSp(V), X(ψ)) induced by forgetting B; injective on groups, so (G, X) is of Hodge type.
- `RationalPELDatum.signConvention` (compatibility): Kottwitz's (G, h⁻¹) and the Deligne-convention (G, h) define the same Shimura variety; the map z ↦ z̄ exchanges the two.

Unit tests:

- `pelShimuraDatum_siegel` (compatibility): For the Siegel PEL datum, toShimuraDatum is ShimuraData:D5/siegel-datum with X the union of the Siegel upper and lower half spaces.
- `pelShimuraDatum_definite` (non-example): For K imaginary quadratic and a hermitian space of signature (2, 0), h(z) is central in G_ℝ; X is a point and SV3 fails, so toShimuraDatum is not available.
- `pelShimuraDatum_typeD` (non-example): For a type D datum G is disconnected and toShimuraDatum is not available; the moduli problem must be compared with G° separately (M3/type-d-comparison).
- `pelShimuraDatum_gl2` (computation): For g = 1 the Siegel PEL datum gives the GL₂ datum (GL₂, ℍ^±) of ShimuraData:D5/gl2-datum.

Uses: ShimuraVarieties:V5: the Siegel canonical model is constructed from the PEL Siegel datum. PELModuli:M3/complex-points: the complex points are G(ℚ)\(X × G(𝔸_f)/K) for each class in ker¹. PELModuli:M0/reflex-field-comparison: E(G, X) is compared with the field of definition F₀ of V₀.

Acceptance: The Siegel PEL datum gives ShimuraData:D5/siegel-datum. A totally definite unitary datum (signature (n,0) everywhere) has h central: SV3 fails and (G, X) is not a Shimura datum, although the moduli problem is defined (non-example).

Direct prerequisites: Within this roadmap: M0/hodge-structure-of-datum; M0/similitude-group-structure. Other roadmaps and libraries: ShimuraData:D4/shimura-datum; ShimuraData:D4/datum-morphism; ShimuraData:D4/hodge-type; ShimuraData:D5/siegel-datum.

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), Lemma 4.1, p. 386: “Lemma 4.1. The pair (G, h) satisfies the following three conditions. (1) The image under h of R^× is central in G.” (axioms). [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) (James S. Milne), §8, p. 87: “The action of G on V defines a homomorphism G ↪ G(ψ) which sends X into X(ψ), and so (G, X) satisfies the conditions SV1–4. When G is connected, we call (G, X) a PEL Shimura datum.” (Shimura datum when G connected). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §8, p. 400: “each one is a canonical model for the Shimura variety obtained from the data (G, h⁻¹, K^p)” (Kottwitz's sign convention h⁻¹).

### Signatures of a PEL datum

Declaration: **TauCeti.PEL.RationalPELDatum.signature**. Node: PELModuli:M0/signatures. Kind: definition.

Let (B, *, V, ⟨·,·⟩, h) be a rational PEL datum, F the centre of B and, for each embedding τ : F → ℂ, W_τ the unique irreducible B ⊗_{F,τ} ℂ-module. Write V₀ ≅ ⊕_τ W_τ^{p_τ} and V₀ᶜ ≅ ⊕_τ W_τ^{q_τ}. The pairs (p_τ, q_τ) are the signatures of the datum; they satisfy p_τ + q_τ = m_[τ] (the multi-rank) and p_τ = q_{τ̄} with τ̄ = c∘τ. For B = K a CM field and V = K^n with hermitian form H, (p_τ, q_τ) is the signature of τ(H) at the CM embedding τ, and Σ_τ p_τ τ is a generalized CM type of rank n (M0/generalized-cm-type).

Hypotheses: a rational PEL datum.

Proof or construction:

1. Decompose V₀ and V₀ᶜ as B ⊗ ℂ-modules (Lan Corollary 1.1.2.5).
2. Prove p_τ + q_τ = m_[τ] and p_τ = q_{τ̄} from V ⊗ ℂ = V₀ ⊕ V₀ᶜ and complex conjugation (Lan §1.2.5, p. 90).
3. Unitary case: the hermitian form ⟨v, √−1 w⟩ + √−1⟨v, w⟩ has signature (p_τ, q_τ) at τ (Kottwitz Lemma 4.3 proof).

API:

- `RationalPELDatum.signature` (data): τ ↦ (p_τ, q_τ) for embeddings τ : F → ℂ.
- `RationalPELDatum.signature_add` (relation): p_τ + q_τ = m_[τ].
- `RationalPELDatum.signature_conj` (relation): p_{c∘τ} = q_τ.
- `RationalPELDatum.signature_unitary` (compatibility): For B = K CM and V hermitian, (p_τ, q_τ) = signature of τ(H).
- `RationalPELDatum.signatureType` (coercion): For B = K a CM field, Σ_τ p_τ τ ∈ ℕ[Σ_∞] is a generalized CM type of rank dim_K V.

Unit tests:

- `signature_siegel` (computation): For the Siegel datum of genus g, F = ℚ, W = ℚ and (p, q) = (g, g).
- `signature_picard` (computation): For K = ℚ(√−3) and H of signature (2, 1), (p_τ, q_τ) = (2, 1) and (p_τ̄, q_τ̄) = (1, 2).
- `signature_zero` (degenerate): For V = 0 all signatures are (0, 0).
- `signature_not_free` (non-example): The pair (p_τ, q_τ) = (2, 0) with (p_τ̄, q_τ̄) = (2, 0) violates p_τ̄ = q_τ and is not the signature of any datum.

Uses: Liu–Tian–Xiao–Zhang–Zhu, Definition 3.4.3: the signature type Ψ of a unitary abelian scheme is the generalized CM type Σ r_τ τ. Bijakowski–Pilloni–Stroh, §1.1: the signatures (a_τ, b_τ) govern the ordinary locus and the weight space. PELModuli:M2/kodaira-spencer-dimension: the relative dimension is Σ_{τ ∈ Φ} p_τ q_τ in the unitary case.

Acceptance: Siegel: p = q = g. U(n−1, 1) over an imaginary quadratic K: (p_τ, q_τ) = (n−1, 1) and (1, n−1) at τ̄.

Direct prerequisites: Within this roadmap: M0/hodge-structure-of-datum; M0/symplectic-o-lattice. 

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.2.5.1, p. 90: “We shall say that the numbers (p_τ) and (q_τ) are respectively the signatures of V_0 and V_0^c, and we shall say that the pairs of numbers (p_τ, q_τ) are the signatures of (L ⊗_Z R, ⟨·,·⟩).” (definition). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), §1.2.5, p. 90: “In particular, we must have p_τ + q_τ = p_τ + p_{τ∘c} = m_[τ] for any τ.” (relations). [Classicité de formes modulaires surconvergentes](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf) (Stéphane Bijakowski, Vincent Pilloni, Benoît Stroh), §1.1, p. 979: “où U(a_τi, b_τi) est le groupe des isomorphismes unitaire relatives à la forme hermitienne de signature (a_τi, b_τi).” (unitary signatures (a_τ, b_τ)).

### The determinant polynomial Det_{O|M}

Declaration: **TauCeti.PEL.detPoly**. Node: PELModuli:M0/determinant-polynomial. Kind: construction.

Let R₀ be a noetherian domain, O an R₀-order with free underlying module and basis α₁, …, α_t, and M a locally free O_S-module of finite rank with an O-action over an R₀-scheme S. Define Det_{O|M}(X₁, …, X_t) := det_{O_S}(X₁α₁ + … + X_tα_t | M) ∈ O_S[X₁, …, X_t], equivalently an element of O_S[O^∨] = Sym(O^∨) ⊗ O_S independent of the basis. It is homogeneous of degree rank M, multiplicative in short exact sequences, compatible with base change, and its value at x ∈ O is det(x | M). In Mathlib terms, for φ : O → End(M), Det_{O|M} is the constant-term-up-to-sign coefficient of LinearMap.polyCharpoly φ b: Det(X) = (−1)^{rank M} polyCharpoly(φ, b)(0) evaluated generically.

Hypotheses: O free of finite rank over R₀; M locally free of finite rank with an O-action.

Proof or construction:

1. Define locally on S using a trivialization of M and descend; basis independence by the linear substitution formula (Lan Definition 1.1.2.17).
2. Relate to mathlib LinearMap.polyCharpoly: the characteristic polynomial of the generic element evaluated at T = 0 equals (−1)^r Det; base change from mathlib LinearMap.polyCharpoly_baseChange; specialization from LinearMap.polyCharpoly_map_eq_charpoly.
3. Multiplicativity for 0 → M' → M → M'' → 0 by block-triangular determinants.

API:

- `detPoly` (constructor): Det_{O|M} ∈ O_S[O^∨] for a locally free O_S-module M with O-action.
- `detPoly_basis_indep` (characterisation): Det_{O|M} is independent of the R₀-basis of O.
- `detPoly_eval` (simp): Evaluating Det_{O|M} at x ∈ O ⊗ O_S gives det(x | M).
- `detPoly_baseChange` (functoriality): Det_{O|f*M} = f*Det_{O|M} for S' → S.
- `detPoly_exact` (relation): Det_{O|M} = Det_{O|M'}·Det_{O|M''} for short exact sequences of O-modules.
- `detPoly_homogeneous` (other): Det_{O|M} is homogeneous of degree rank_{O_S} M.
- `detPoly_eq_polyCharpoly` (compatibility): Det_{O|M} = (−1)^{rank M}·(coefficient of T⁰ in LinearMap.polyCharpoly (O → End M) b), via mathlib's generic characteristic polynomial.

Unit tests:

- `detPoly_int` (degenerate): For O = ℤ with basis 1 and M free of rank r, Det_{ℤ|M} = X^r.
- `detPoly_gaussian` (computation): For O = ℤ[i], basis (1, i), M = ℂ with i ↦ √−1: Det = X₁ + √−1 X₂; for M = ℂ with i ↦ −√−1: Det = X₁ − √−1 X₂.
- `detPoly_eval_charpoly` (compatibility): For x ∈ O, (−1)^r Det_{O|M}(−coords x) agrees with (LinearMap.charpoly (φ x)).eval 0 computed by Mathlib.
- `detPoly_not_trace` (non-example): For O = ℤ[i] with basis (1, i), k = 𝔽_9 and τ : ℤ[i] → 𝔽_9 a homomorphism, let M = k³ with i acting by τ(i) and M' = k³ with i acting by −τ(i). Then Tr(x | M) = 3τ(x) = 0 = Tr(x | M') for all x, but Det_{O|M} = (X₁ + τ(i)X₂)³ ≠ (X₁ − τ(i)X₂)³ = Det_{O|M'}.

Uses: Kottwitz 1992, §5: the determinant condition is the equality g = f of the polynomials for Lie(A) and V₁. Lan 2008, Definition 1.3.4.2: the determinantal condition compares Det_{O|Lie_{A/S}} with the image of Det_{O|V₀}. PELModuli:M0/determinant-condition: defining polynomial identity over the base.

Acceptance: For O = ℤ, Det_{ℤ|M}(X) = X^{rank M}. For O = ℤ[i] and M = ℂ with i acting by √−1: Det(X₁ + X₂ i) = X₁ + √−1 X₂.

Direct prerequisites: Other roadmaps and libraries: mathlib:LinearMap.polyCharpoly; mathlib:LinearMap.polyCharpoly_baseChange; mathlib:LinearMap.polyCharpoly_map_eq_charpoly; mathlib:LinearMap.charpoly; mathlib:LinearMap.charpoly_baseChange.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.1.2.17, p. 19: “Define a polynomial function Det^{α1,...,αt}_{O|M} ∈ O_S[X1, ..., Xt] by Det^{α1,...,αt}_{O|M}(X1, ..., Xt) := Det_{O_S}(X1α1 + ... + Xtαt|M)” (definition). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 389: “f(X_1, ..., X_t) := det(X_1α_1 + ... + X_tα_t; V_1) is a homogeneous polynomial of degree dim_C(V_1)” (Kottwitz's f).

### The determinant polynomial classifies modules in every characteristic

Declaration: **TauCeti.PEL.determinantClassifies**. Node: PELModuli:M0/determinant-classifies. Kind: theorem.

Let k be a field, C a finite-dimensional semisimple k-algebra whose centre E is separable over k, and K ⊃ k a field. Two finite C ⊗_k K-modules M₁, M₂ are isomorphic iff Det_{C|M₁} = Det_{C|M₂} in K[C^∨]. If char k = 0, they are isomorphic iff Tr_K(x | M₁) = Tr_K(x | M₂) for all x ∈ C; this trace criterion fails in positive characteristic (pM has zero trace map).

Hypotheses: C semisimple over k with separable centre.

Proof or construction:

1. Decompose M_i = ⊕ W_[τ]^{m_[τ],i} (Lan Corollary 1.1.2.5).
2. Det_{C|M_i} = ∏ Det_{C|W_[τ]}^{m_[τ],i} and distinct Det_{C|W_[τ]} have no common irreducible factor over K^sep (Lan Lemma 1.1.2.15: the linear forms Σ X_j τ'(α_j) are distinct for distinct embeddings).
3. Unique factorization in K^sep[X] gives equality of multiplicities.
4. In characteristic 0 the trace maps of the W_[τ] are linearly independent (Dedekind's lemma; Lan Lemma 1.1.2.9), giving the trace criterion; Milne Remark 8.2 gives the failure in characteristic p.

Acceptance: Over 𝔽_p with C = 𝔽_p and modules 𝔽_p^p and 0: equal traces, different determinants.

Direct prerequisites: Within this roadmap: M0/determinant-polynomial. Other roadmaps and libraries: mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing; mathlib:Algebra.IsSeparable.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Proposition 1.1.2.16, p. 18: “Two C ⊗_k K-modules M1 and M2 are isomorphic if and only if Det_{C|M1} = Det_{C|M2}.” (statement). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.1.2.11, p. 14: “The fact that char(k) = 0 is used in an essential way. We cannot expect the trace comparison to work in any characteristic.” (trace only in characteristic 0). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 390: “This explains why we use the determinant rather than the trace, since the analogous assertion regarding the trace is false when the characteristic of k is finite.” (rationale).

### The reflex field F₀ of a PEL datum

Declaration: **TauCeti.PEL.RationalPELDatum.reflexField**. Node: PELModuli:M0/reflex-field. Kind: definition.

The reflex field F₀ ⊂ ℂ of a rational PEL datum is the field of definition of the isomorphism class of the complex representation V₀ of B: the fixed field of {σ ∈ Aut(ℂ/ℚ) : V₀ ⊗_{ℂ,σ} ℂ ≅ V₀ as B ⊗ ℂ-modules}. Equivalently F₀ = ℚ(Tr_ℂ(b | V₀) : b ∈ B) = ℚ(Tr_ℂ(b | V₀) : b ∈ O). F₀ is a number field contained in the Galois closure of F; a prime unramified in F is unramified in F₀; and Det_{O|V₀} has coefficients in O_{F₀}, so it defines an element of O_{F₀}[O^∨] (Kottwitz: in O_E ⊗ ℤ_(p) for p-integral data).

Hypotheses: a rational PEL datum (with an order O for the integrality statement).

Proof or construction:

1. Define F₀ as a fixed field (mathlib IntermediateField.fixedField after restricting to ℚ̄).
2. Trace description: in characteristic 0 isomorphism classes are detected by traces (M0/determinant-classifies), so σ fixes the class iff it fixes all traces (Lan Corollary 1.1.2.12).
3. F₀ ⊂ F^Gal because each trace is a sum of conjugates τ'(Trd) (Lan Corollary 1.1.2.8); unramifiedness transfer (Lan Corollary 1.2.5.7).
4. Integrality: L₀ := O ⊗ O_{F₀}-span of the image of L in V₀ is an O_{F₀}-lattice with Det_{O|L₀} = Det_{O|V₀} (Lan Lemma 1.2.5.10, Corollary 1.2.5.12).

API:

- `RationalPELDatum.reflexField` (constructor): F₀ as an intermediate field of ℂ/ℚ (fixed field of the stabilizer of the class of V₀).
- `RationalPELDatum.reflexField_eq_traces` (characterisation): F₀ = ℚ(Tr(b | V₀) : b ∈ O).
- `RationalPELDatum.reflexField_le_galoisClosure` (other): F₀ ⊂ the Galois closure of F.
- `RationalPELDatum.reflexField_finite` (instance): F₀ is a number field.
- `RationalPELDatum.unramified_reflex` (other): p unramified in F ⇒ p unramified in F₀.
- `RationalPELDatum.detPoly_integral` (other): Det_{O|V₀} ∈ O_{F₀}[O^∨].
- `RationalPELDatum.reflexField_siegel` (example): For the Siegel datum F₀ = ℚ.

Unit tests:

- `reflexField_siegel` (computation): For the Siegel datum, all traces Tr(b | V₀) = g·b ∈ ℚ, so F₀ = ℚ.
- `reflexField_picard` (computation): For K = ℚ(√−3) with signature (2, 1): Tr(a | V₀) = 2τ(a) + τ̄(a) ∉ ℚ for a = √−3, so F₀ = K.
- `reflexField_U11` (computation): For signature (1, 1): Tr(a | V₀) = τ(a) + τ̄(a) = Tr_{K/ℚ}(a) ∈ ℚ, so F₀ = ℚ.
- `reflexField_not_center` (non-example): For B = F totally real Hilbert data, F₀ = ℚ although the centre is F: the reflex field is not the centre.

Uses: Kottwitz 1992, §5: the moduli problem is defined over O_E ⊗ ℤ_(p). Lan 2008, §1.4.1: the base is S₀ = Spec O_{F₀,(□)}. PELModuli:M0/reflex-field-comparison: identified with E(G, X). Bijakowski–Pilloni–Stroh, Hypothèse 1.1.1 (v): p totally split in the reflex field E is the ordinary-density condition.

Acceptance: Siegel: F₀ = ℚ. U(n−1, 1) over imaginary quadratic K with n ≥ 3: F₀ = K; U(1, 1): F₀ = ℚ.

Direct prerequisites: Within this roadmap: M0/hodge-structure-of-datum; M0/determinant-polynomial; M0/determinant-classifies. Other roadmaps and libraries: mathlib:IntermediateField.fixedField; mathlib:IntermediateField.normalClosure.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.2.5.4, pp. 90–91: “The reflex field F_0 of (L ⊗_Z R, ⟨·,·⟩) is the field of definition of V_0 as a complex representation of B = O ⊗_Z Q.” (definition). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Corollary 1.2.5.6, p. 91: “F_0 = Q(Tr_C(b|V_0) : b ∈ B) = Q(Tr_C(b|V_0) : b ∈ O).” (trace description). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Corollary 1.2.5.7, p. 91: “If a rational prime number p is unramified in F, then it is unramified in F_0.” (unramifiedness). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 389: “Let E ⊂ C be the field of definition of the isomorphism class of the complex representation V_1 of B; the number field E is called the reflex field.” (Kottwitz's E).

### The PEL reflex field equals the Shimura reflex field

Declaration: **TauCeti.PEL.reflexFieldComparison**. Node: PELModuli:M0/reflex-field-comparison. Kind: theorem.

Let (B, *, V, ⟨·,·⟩, h) be a rational PEL datum whose (G, X) is a Shimura datum (M0/pel-shimura-datum). Then the reflex field E(G, X) of ShimuraData:D3/reflex-field, the field of definition of the G(ℂ)-conjugacy class of μ_h, equals the field of definition F₀ of the isomorphism class of the B ⊗ ℂ-module V₀ = V^{−1,0}.

Hypotheses: (G, X) is a Shimura datum (G connected).

Proof or construction:

1. The conjugacy class c(X) of μ_h determines V^{−1,0} up to B ⊗ ℂ-isomorphism (eigenspace of weight −1 in V ⊗ ℂ).
2. Conversely, the B ⊗ ℂ-module V₀ determines the G(ℂ)-conjugacy class of μ_h: two cocharacters with isomorphic weight decompositions are conjugate under the B-linear similitudes (Kottwitz Lemma 4.2 and Lemma 7.1; Milne Proposition 8.13(a), the trace map t determines X).
3. Hence σ ∈ Aut(ℂ/ℚ) fixes c(X) iff it fixes the class of V₀; take fixed fields (Milne Definition 12.2).

Acceptance: Siegel: E(G, X) = ℚ = F₀. Unitary signature (n−1, 1), n ≥ 3, over imaginary quadratic K: both equal K.

Direct prerequisites: Within this roadmap: M0/reflex-field; M0/pel-shimura-datum; M0/similitude-group-structure. Other roadmaps and libraries: ShimuraData:D3/reflex-field; ShimuraData:D3/cocharacter-class.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) (James S. Milne), Definition 12.2, p. 112: “The reflex (or dual) field E(G,X) is the field of definition of c(X) in Q^al” (Shimura reflex field). [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) (James S. Milne), Proposition 8.13, p. 86: “(a) the G′(R) conjugacy class of h is uniquely determined by the map t: B → C” (trace map determines X). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.2.5.4, p. 91: “Equivalently, F_0 is the fixed field of C by the elements σ in Aut(C/Q) such that V_0 and V_0 ⊗_{C,σ} C are isomorphic as B ⊗_Q C-modules.” (PEL reflex field).

### The Kottwitz determinant condition

Declaration: **TauCeti.PEL.SatisfiesDetCondition**. Node: PELModuli:M0/determinant-condition. Kind: definition.

Fix a rational PEL datum with order O and its reflex field F₀, and a set □ of primes. Let S be a locally noetherian scheme over O_{F₀,(□)} and M a locally free O_S-module of finite rank with an O ⊗ ℤ_(□)-action. M satisfies the determinant condition (given by (L ⊗ ℝ, ⟨·,·⟩)) if Det_{O|M} equals the image of Det_{O|V₀} ∈ O_{F₀}[O^∨] under O_{F₀,(□)} → Γ(S, O_S); equivalently, for every x ∈ O ⊗ O_S, det(x | M) equals the image of det(x | V₀). The condition is the full polynomial identity over the base; a trace identity alone does not imply it in positive characteristic.

Hypotheses: S a locally noetherian O_{F₀,(□)}-scheme.

Proof or construction:

1. Use M0/determinant-polynomial for M and M0/reflex-field (integrality) for V₀; compare in O_S[O^∨].
2. Show stability under base change and descent along fpqc covers (equality of sections of O_S[O^∨]).

API:

- `SatisfiesDetCondition` (constructor): The predicate Det_{O|M} = image of Det_{O|V₀} for M over an O_{F₀,(□)}-scheme.
- `SatisfiesDetCondition.baseChange` (functoriality): Stable under pullback along any morphism of O_{F₀,(□)}-schemes.
- `SatisfiesDetCondition.descent` (other): Satisfied iff satisfied after an fpqc cover (equality of sections).
- `SatisfiesDetCondition.rank` (other): The condition implies rank M = dim_ℂ V₀.
- `SatisfiesDetCondition.iff_eval` (characterisation): Equivalent to det(x | M) = det(x | V₀) for all x ∈ O ⊗ O_S (after base change to the polynomial ring).
- `SatisfiesDetCondition.unitary` (compatibility): For B = F CM, O = O_F with p unramified in F and S over ℤ_p^◇, equivalent to rank Lie_τ = r_τ for all τ (signature type Ψ, M1/unitary-of-abelian-scheme).

Unit tests:

- `detCondition_siegel` (computation): For the Siegel datum of genus g, M satisfies the condition iff M is locally free of rank g.
- `detCondition_char3_signature` (non-example): For K = ℚ(i), a unitary datum of signature (3, 0) at τ (so F₀ = K) and S = Spec 𝔽_9 over O_{K,(3)}: M = 𝔽_9³ with i acting by −τ(i) has the same trace map as V₀ ⊗ 𝔽_9 (both zero) but fails the determinant condition.
- `detCondition_zero` (degenerate): For V₀ = 0 (L = 0) the condition says M = 0.
- `detCondition_baseChange_C` (compatibility): Over S = Spec ℂ (via F₀ ⊂ ℂ), M satisfies the condition iff M ≅ V₀ as O ⊗ ℂ-modules (M0/determinant-classifies).

Uses: Lan 2008, Definition 1.4.1.4 (4): objects of M_H satisfy the determinantal condition on Lie_{A/S}. Kottwitz 1992, §5: the moduli quadruples satisfy g = f. HilbertModularVarietiesAndShimuraCurves:H1: verifies the full determinant condition for the Hilbert instance (RS-23). PELModuli:M2/formal-smoothness: the deformation calculation uses the condition at closed points.

Acceptance: For the Siegel datum the condition says rank Lie = g (Det = X^g), which every g-dimensional abelian scheme satisfies. For a Picard datum (2, 1) it fixes the decomposition Lie = Lie_τ ⊕ Lie_τ̄ with ranks (2, 1) over O_K ⊗ O_S.

Direct prerequisites: Within this roadmap: M0/determinant-polynomial; M0/reflex-field. 

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.3.4.2, p. 126: “The (Kottwitz) determinantal condition on Lie_{A/S} (given by (L ⊗_Z R, ⟨·,·⟩)) is that Det_{O|Lie_{A/S}} agrees with the image of Det_{O|V_0} under the morphism from O_{F_0,(□)} to O_S.” (definition). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 390: “it makes sense to require that g(X_1, ..., X_t) be equal to the polynomial f(X_1, ..., X_t) constructed earlier; this equality g = f is what we mean by the determinant condition.” (Kottwitz's formulation).

### Determinant condition versus the representation over a splitting field

Declaration: **TauCeti.PEL.determinantConditionSplitting**. Node: PELModuli:M0/determinant-condition-splitting. Kind: theorem.

Let □ be a set of primes with p ∤ Disc for p ∈ □, k an algebraically closed field over O_{F₀,(□)} and M a finite-dimensional O ⊗ k-module. Then M satisfies the determinant condition iff M ≅ L₀ ⊗_{O_{F₀}} k as O ⊗ k-modules, where L₀ is the O ⊗ O_{F₀}-lattice spanned by the image of L in V₀ (equivalently, M is the reduction of V₀ over the splitting field). Over a connected locally noetherian base the condition holds iff it holds at one point of each connected component; if p | Disc the representation-theoretic reformulation can fail.

Hypotheses: p ∤ Disc for the residue characteristic p of k (vacuous in characteristic 0).

Proof or construction:

1. For p ∤ Disc, O ⊗ k is a product of matrix algebras over k (M0/order-discriminant), so O ⊗ k-modules are classified by multiplicities and Det detects them (M0/determinant-classifies).
2. Det_{O|L₀ ⊗ k} is the reduction of Det_{O|V₀} (Lan Corollary 1.2.5.12, Lemma 1.2.5.13).
3. Local constancy: Det_{O|M} is a locally constant section with coefficients in the image of O_{F₀,(□)}, and a polynomial identity is checked at points of a connected reduced base; for nonreduced bases the polynomial identity is kept (Lan proof of Proposition 2.2.2.9).

Acceptance: Siegel: both conditions say dim M = g. Picard (2, 1) at a prime split in K: M ≅ k² ⊕ k (with O_K acting through the two embeddings).

Direct prerequisites: Within this roadmap: M0/determinant-condition; M0/determinant-classifies; M0/order-discriminant. 

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Lemma 1.2.5.10, p. 92: “The O ⊗_Z O_{F_0}-span of the image of L under the surjection (1.2.5.9) gives an O_{F_0}-lattice L_0 in V_{0,F_0}” (the lattice L₀). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), §1.3.4, p. 126: “We shall see in the proof of Proposition 2.2.2.9 that this is indeed the case if we assume that □ does not divide Disc.” (validity over fields of positive characteristic needs p ∤ Disc).

### Uniqueness of self-dual lattices at good primes

Declaration: **TauCeti.PEL.selfDualLatticeClassification**. Node: PELModuli:M0/self-dual-lattice-classification. Kind: theorem.

Let p be a prime with p ∤ I_bad·Disc, so B ⊗ ℚ_p is a product of matrix algebras over unramified extensions and O ⊗ ℤ_p is maximal. (1) Two self-dual symplectic O ⊗ ℤ_p-lattices of the same multi-rank are isomorphic as symplectic modules (up to the scalar choice of ℤ_p(1) ≅ ℤ_p). (2) (Kottwitz Lemma 7.2) If (V', ⟨·,·⟩') is a nondegenerate skew-Hermitian B ⊗ ℚ_p-module isomorphic to V as a B-module and Λ' ⊂ V' is self-dual, then, in Case D assuming p ≠ 2 and that the class of V' in H¹(ℚ_p, G) maps trivially to H¹(ℚ_p, G/G°), there is an isomorphism φ : V ≅ V' of skew-Hermitian modules with φ(Λ) = Λ'. (3) Consequently G(ℚ_p) acts transitively on the O_B-lattices in V ⊗ ℚ_p that are self-dual up to a scalar in ℚ_p^×.

Hypotheses: p ∤ I_bad·Disc.

Proof or construction:

1. Reduce mod p: in Cases A and C any two nondegenerate skew-Hermitian forms on Λ/pΛ are equivalent by Lang's theorem (connectedness of G over 𝔽_p).
2. Lift an isomorphism mod p to mod p^k by solving (ρ − 1)/p ≡ ψ + ψ* (mod p) in C₀ = End(Λ), with separate arguments for p = 2 in Cases A and C (Kottwitz Lemma 7.2 proof).
3. Case D: use the extra hypothesis to place the difference class in H¹(𝔽_p, G°), trivial by Lang.
4. Lan's version over complete local rings: Lan Proposition 1.2.3.7 and Corollary 1.2.3.10.

Acceptance: Siegel: any two self-dual symplectic ℤ_p-lattices in ℚ_p^{2g} are GSp_{2g}(ℚ_p)-conjugate.

Direct prerequisites: Within this roadmap: M0/similitude-group-structure; M0/order-discriminant; M0/symplectic-o-lattice. 

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), Lemma 7.2, p. 395: “Suppose that Λ′ is a self-dual O_B-lattice in V′. In Case D assume further that p ≠ 2 and that under the map H¹(Q_p, G) → H¹(Q_p, G/G°) the element ... is sent to the trivial element” (statement (abridged)). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), Corollary 7.3, p. 396: “In Case D assume that p ≠ 2. Then G(Q_p) acts transitively on the set of O_B-lattices Λ′ in V that are self-dual up to a scalar in Q_p^×.” (transitivity). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.4.4.2, p. 168: “this is the case except when the semisimple algebra B involves simple factors of type D” (uniqueness of self-dual classes per multi-rank).

### Signatures are constant above each prime of F₀ under Hypothesis 1.1.1

Declaration: **TauCeti.PEL.bpsSignatureConstancy**. Node: PELModuli:M0/bps-signature-constancy. Kind: theorem.

Let (B, *, V, ⟨·,·⟩, h) be a datum of type A or C as in Bijakowski–Pilloni–Stroh §1.1 with centre F, F₀ = F^{*=1} of degree d, and p a prime satisfying their Hypothesis 1.1.1: (i) p unramified in F₀ and, in type A, every place of F₀ above p splits in F; (ii) B ⊗ ℚ_p is a product of matrix algebras over unramified extensions; (iii) O_B maximal at p; (iv) the pairing perfect at p; (v) p totally split in the reflex field E. Fix ℂ ≅ ℂ_p and, for τ : F₀ → ℝ, order the two embeddings σ, σ̄ of F above τ so that σ lies above π_i^+ (Remark 1.1.3). Then (a_τ, b_τ) = (a_τ', b_τ') whenever τ, τ' lie above the same prime π_i of F₀; in type C, a_τ = dim_ℚ U_ℚ /(2nd) for all τ. The ordering convention matters: the other choice exchanges (a_τ, b_τ).

Hypotheses: type A or C; Hypothesis 1.1.1 (i)–(v) at p.

Proof or construction:

1. Write U^{1,0} ≅ ⊕_j (ℂ_p^n)^{a_τj} ⊕ (ℂ_p^n)^{b_τj} with O_B ⊗ ℤ_p ≅ M_n(O_F ⊗ ℤ_p) acting through σ_j, σ̄_j (BPS proof of Lemme 1.1.4).
2. Evaluate the determinant polynomial on diag(x, 1, …, 1) + Id above π_i for x ∈ O_{F,π_i^+}: it equals ∏_{τ_j ∈ Σ_i} σ_j(x)^{a_τj}.
3. Hypothesis (v) (via det_{U^{1,0}} taking values in ℤ_p on O_B ⊗ ℤ_p) forces this product to lie in ℤ_p for all x; since Σ_i is the Galois group of O_{F,π_i^+}, this holds iff a_τj is constant on Σ_i.

Acceptance: For F₀ = ℚ (imaginary quadratic F) the statement is vacuous. For F₀ real quadratic with p inert in F₀, the two signatures above p coincide.

Direct prerequisites: Within this roadmap: M0/signatures; M0/determinant-polynomial; M0/reflex-field; M0/good-primes. 

Source evidence: [Classicité de formes modulaires surconvergentes](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf) (Stéphane Bijakowski, Vincent Pilloni, Benoît Stroh), Hypothèse 1.1.1, p. 980: “(v) p est totalement décomposé dans E.” (hypothesis (v)). [Classicité de formes modulaires surconvergentes](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf) (Stéphane Bijakowski, Vincent Pilloni, Benoît Stroh), Lemme 1.1.4, p. 981: “Lemme 1.1.4. On a (a_τ, b_τ) = (a_τ′, b_τ′) si τ et τ′ sont au dessus d’un même idéal premier π_i de F_0.” (statement). [Classicité de formes modulaires surconvergentes](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf) (Stéphane Bijakowski, Vincent Pilloni, Benoît Stroh), Remarque 1.1.3, p. 981: “on ordonne σ et σ̄ les plongements de F au-dessus de τ de manière à ce que σ soit au-dessus de π_i^+ et σ̄ au-dessus de π_i^−.” (ordering convention).

### Hermitian spaces over O_F ⊗ R and the space V_♯

Declaration: **TauCeti.PEL.HermitianSpace**. Node: PELModuli:M0/hermitian-space. Kind: definition.

Let F be a CM field with maximal totally real subfield F⁺ and complex conjugation c, Σ⁺_bad a finite set of places of F⁺ containing those ramified in F, and R an O_{F⁺}[(Σ⁺_bad)⁻¹]-algebra. A hermitian space over O_F ⊗_{O_{F⁺}} R of rank N is a projective O_F ⊗ R-module V of rank N with a perfect pairing (·,·)_V : V × V → O_F ⊗ R, linear in the first variable, (c ⊗ id)-semilinear in the second, with (x, y)_V = (y, x)_V^c. U(V) is the reductive group over R of O_F ⊗ R-linear isometries. V_♯ := V ⊕ (O_F ⊗ R)·1 with (1, 1) = 1 (orthogonal sum), and an isometry f : V → V' induces f_♯ = f ⊕ id : V_♯ → V'_♯; U(V) ⊂ U(V_♯) via f ↦ f_♯. Dictionary with PEL data: for a totally imaginary δ ∈ F^× the form ⟨x, y⟩ := Tr_{F/ℚ}(δ (x, y)_V) is a skew-Hermitian F-module structure (M0/skew-hermitian-space), with the same unitary group G₁.

Hypotheses: F a CM field; R an O_{F⁺}[(Σ⁺_bad)⁻¹]-algebra.

Proof or construction:

1. Define the structure and the isometry group; reductivity over R uses that O_F ⊗ R is étale over R away from Σ⁺_bad.
2. Define V_♯ and f_♯ and check f_♯ is an isometry; record the embedding U(V) ↪ U(V_♯).
3. Construct the trace dictionary with a totally imaginary δ and verify adjointness ⟨ax, y⟩ = ⟨x, a^c y⟩.

API:

- `HermitianSpace` (structure): A projective O_F ⊗ R-module of rank N with a perfect c-sesquilinear hermitian pairing.
- `HermitianSpace.unitaryGroup` (data): U(V), the group scheme of O_F ⊗ R-linear isometries; reductive over R.
- `HermitianSpace.sharp` (constructor): V_♯ = V ⊕ (O_F ⊗ R)·1 with (1, 1) = 1.
- `HermitianSpace.Isometry.sharp` (functoriality): f ↦ f_♯ with (f ∘ g)_♯ = f_♯ ∘ g_♯ and id_♯ = id.
- `HermitianSpace.unitaryGroup_le_sharp` (other): U(V) ↪ U(V_♯), g ↦ g_♯.
- `HermitianSpace.toSkewHermitian` (equivalence): For totally imaginary δ, ⟨x, y⟩ = Tr(δ (x, y)) defines a rational skew-hermitian space with the same isometry group.
- `HermitianSpace.unitaryGroup_matrix` (compatibility): For V = (O_F ⊗ R)^N with standard form, U(V)(R') = Matrix.unitaryGroup for the star given by c.

Unit tests:

- `hermitianSpace_sharp_rank` (computation): rank V_♯ = rank V + 1, and for V = 0, V_♯ is the rank-one space with (1, 1) = 1.
- `hermitianSpace_unitary_matrix` (compatibility): For V = F^N with Σ x_i ȳ_i, U(V)(F⁺) = Matrix.unitaryGroup (Fin N) F with star = complex conjugation.
- `hermitianSpace_not_symmetric` (non-example): The F-bilinear symmetric form Σ x_i y_i is not hermitian (it is linear in both variables), so it does not define a hermitian space.
- `hermitianSpace_trace_dictionary` (characterisation): For δ = √−1 ∈ ℚ(i) and V = ℚ(i) with (x, y) = x ȳ, ⟨x, y⟩ = Tr(√−1 x ȳ) is alternating and ⟨ax, y⟩ = ⟨x, ā y⟩.

Uses: Liu–Tian–Xiao–Zhang–Zhu, §3.1 and §§4–5: the unitary groups U(V), U(V_♯) of the Gan–Gross–Prasad pair and their moduli. PELModuli:M3/hermitian-hom-space: the hermitian space Hom^{λ₀,λ} compares moduli with Sh(V, K). PELModuli:M5/unitary-pel-datum: unitary PEL data are built from hermitian spaces.

Acceptance: For R = F⁺ and V = F^N with the standard form Σ x_i ȳ_i, U(V) is the definite unitary group of rank N. rank V_♯ = rank V + 1.

Direct prerequisites: Within this roadmap: M0/positive-involution. Other roadmaps and libraries: mathlib:NumberField.IsCMField; mathlib:NumberField.IsCMField.complexConj; mathlib:NumberField.maximalRealSubfield; mathlib:Matrix.unitaryGroup; mathlib:Algebra.trace.

Source evidence: [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Definition 3.1.7, p. 24 (arXiv v3); p. 140 (published): “A hermitian space over O_F ⊗_{O_{F+}} R of rank N is a projective O_F ⊗_{O_{F+}} R-module V of rank N, together with a perfect pairing” (definition (abridged at the citation)). [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Definition 3.1.7, second paragraph: “we denote by V_♯ the hermitian space V ⊕ O_F ⊗_{O_{F+}} R · 1 where 1 has norm 1” (the space V_♯).

### Rational skew-hermitian spaces, similitudes, GU(W) and T₀

Declaration: **TauCeti.PEL.SkewHermitianSpace**. Node: PELModuli:M0/skew-hermitian-space. Kind: definition.

Let F be a CM field and R a ℤ[(disc F)⁻¹]-algebra. A rational skew-hermitian space over O_F ⊗ R of rank N is a free O_F ⊗ R-module W of rank N with an R-bilinear skew-symmetric perfect pairing ⟨·,·⟩_W : W × W → R with ⟨ax, y⟩_W = ⟨x, a^c y⟩_W. A similitude f : W → W' is an O_F ⊗ R-linear isomorphism with ⟨f x, f y⟩ = c(f)⟨x, y⟩ for some c(f) ∈ R^×; W, W' are similar if a similitude exists; GU(W) is the reductive group of self-similitudes. T₀ ⊂ Res_{O_F/ℤ} G_m ⊗ ℤ[(disc F)⁻¹] is the torus with T₀(R) = {a ∈ O_F ⊗ R : N_{F/F⁺}(a) ∈ R^×}. For a CM type Φ, a rank-one W₀ over O_F ⊗ ℤ_(p) has type Φ if ⟨ax, x⟩_{W₀} ≥ 0 for all x and all totally imaginary a with Im τ(a) > 0 for τ ∈ Φ. These are the PEL data with B = F, O = O_F (M0/integral-pel-datum) and GU(W) is their similitude group.

Hypotheses: F a CM field; R a ℤ[(disc F)⁻¹]-algebra.

Proof or construction:

1. Define the structure, similitudes and GU(W); GU(W) is the similitude group M0/similitude-group of the datum (O_F, c, W, ⟨·,·⟩).
2. Define T₀ and show T₀ = GU(W₀) for rank one W₀ (multiplication by a has multiplier a a^c).
3. Type Φ: compare with the positivity of Condition 1.2.1.2 for h attached to Φ (the Riemann form of a CM abelian variety of type Φ).

API:

- `SkewHermitianSpace` (structure): A free O_F ⊗ R-module with a perfect skew-symmetric R-valued pairing for which a and a^c are adjoint.
- `SkewHermitianSpace.Similitude` (structure): O_F ⊗ R-linear isomorphisms scaling the pairing by a unit c(f).
- `SkewHermitianSpace.Similar` (data): The similarity relation; an equivalence relation.
- `SkewHermitianSpace.GU` (data): GU(W), the group scheme of self-similitudes; equal to the similitude group of the PEL datum (O_F, c, W, ⟨·,·⟩).
- `cmTorus` (constructor): T₀ with T₀(R) = {a : N_{F/F⁺}(a) ∈ R^×}.
- `SkewHermitianSpace.gu_rankOne` (equivalence): For rank one W₀, GU(W₀) ≅ T₀ ⊗ ℤ_(p), a ↦ multiplication by a.
- `SkewHermitianSpace.HasType` (data): The positivity condition of type Φ for rank one spaces.
- `SkewHermitianSpace.toPELDatum` (coercion): The integral PEL datum (O_F, c, W, ⟨·,·⟩, h_Φ) when W has type Φ.

Unit tests:

- `cmTorus_points_imagQuad` (computation): For F = ℚ(i) and R = ℚ, T₀(ℚ) = ℚ(i)^× (every nonzero a has N(a) ∈ ℚ^×), while T₀(ℤ[1/2]) = {a ∈ ℤ[1/2][i] : a ā ∈ ℤ[1/2]^×}.
- `gu_rankOne_multiplier` (characterisation): For rank one W₀, multiplication by a ∈ T₀(R) is a similitude with c = a a^c.
- `skewHermitian_type_flip` (non-example): If W₀ has type Φ, then (W₀, −⟨·,·⟩) has type cΦ and not type Φ (for a with Im τ(a) > 0 on Φ, −⟨ax, x⟩ ≤ 0).
- `skewHermitian_zero` (degenerate): W = 0 is a rational skew-hermitian space of rank 0 with GU(0) = G_m.

Uses: Liu–Tian–Xiao–Zhang–Zhu, Definition 3.5.4: level structures of the CM moduli T¹_p are similitudes of rational skew-hermitian spaces. PELModuli:M0/rank-one-skew-hermitian-classification: similarity classes are counted by ker¹(T₀). PELModuli:M4/cm-moduli-scheme: the auxiliary CM moduli scheme T_p(W₀, K^p₀).

Acceptance: For rank one, GU(W₀) ≅ T₀ ⊗ ℤ_(p) canonically. Type Φ and type Φ̄ := cΦ differ by the sign of ⟨·,·⟩.

Direct prerequisites: Within this roadmap: M0/hermitian-space; M0/similitude-group; M0/integral-pel-datum. Other roadmaps and libraries: mathlib:NumberField.IsCMField.

Source evidence: [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Definition 3.5.1, p. 34 (arXiv v3): “A rational skew-hermitian space over O_F ⊗ R of rank N is a free O_F ⊗ R-module W of rank N together with an R-bilinear skew-symmetric perfect pairing” (definition). [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), §3.5, p. 34 (arXiv v3): “We define a subtorus T_0 ⊆ (Res_{O_F/Z} G_m) ⊗ Z[(disc F)^{−1}] such that for every Z[(disc F)^{−1}]-ring R, we have T_0(R) = {a ∈ O_F ⊗ R | Nm_{F/F+} a ∈ R^×}.” (the torus T₀). [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Definition 3.5.3, p. 34 (arXiv v3): “We say that a rational skew-hermitian space W_0 over O_F ⊗ Z_(p) of rank 1 has type Φ if for every x ∈ W_0 and every totally imaginary element a ∈ F^× satisfying Im τ(a) > 0 for all τ ∈ Φ, we have ⟨ax, x⟩_{W_0} ⩾ 0.” (type Φ).

### Rank-one skew-hermitian spaces and ker¹(T₀)

Declaration: **TauCeti.PEL.rankOneSkewHermitianClassification**. Node: PELModuli:M0/rank-one-skew-hermitian-classification. Kind: theorem.

Let F be a CM field, p a prime unramified in F and W₀ a rational skew-hermitian space over O_F ⊗ ℤ_(p) of rank 1. Then GU(W₀) ≅ T₀ ⊗_{ℤ[(disc F)⁻¹]} ℤ_(p) canonically, and the set of similarity classes of rank-one W₀' with W₀' ⊗ 𝔸 similar to W₀ ⊗ 𝔸 is in canonical bijection with ker¹(T₀) := ker(H¹(ℚ, T₀) → ∏_{v ≤ ∞} H¹(ℚ_v, T₀)), a finite abelian group.

Hypotheses: p unramified in F.

Proof or construction:

1. GU(W₀) ≅ T₀: M0/skew-hermitian-space.
2. Forms of W₀ that are everywhere locally similar are classified by ker¹(ℚ, GU(W₀)) = ker¹(T₀) (twisting by cocycles; integrality at p is harmless because T₀ is smooth over ℤ_(p) and H¹(ℤ_p, T₀) = 0 by Lang).
3. Finiteness of ker¹ of a torus (classical; for T₀ via Tate–Nakayama duality ker¹(T₀) ≅ ker¹(X*(T₀))^∨).

Acceptance: If F/F⁺ is such that F⁺^× ∩ N(𝔸_F^×) = N(F^×) (Hasse norm theorem, F/F⁺ cyclic) then ker¹ of the norm-one torus vanishes; ker¹(T₀) can still be nontrivial.

Direct prerequisites: Within this roadmap: M0/skew-hermitian-space. Other roadmaps and libraries: tauceti:TauCeti.ContCohomology.H1; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields.

Source evidence: [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Remark 3.5.2, p. 34 (arXiv v3): “the set of similarity classes of rational skew-hermitian spaces W′_0 over O_F ⊗ Z_(p) of rank 1 such that W′_0 ⊗_{Z_(p)} A is similar to W_0 ⊗_{Z_(p)} A is canonically isomorphic to ker¹(T_0)” (statement). [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Remark 3.5.2, p. 34 (arXiv v3): “which is a finite abelian group.” (finiteness).

### Generalized CM types and their reflex fields

Declaration: **TauCeti.PEL.GeneralizedCMType**. Node: PELModuli:M0/generalized-cm-type. Kind: definition.

Let F be a CM field and Σ_∞ its set of complex embeddings, with Aut(ℂ/ℚ) acting on Σ_∞ and on the free commutative monoid ℕ[Σ_∞]. A generalized CM type of rank N is Ψ = Σ_τ r_τ τ ∈ ℕ[Σ_∞] with r_τ + r_{τ^c} = N for all τ. Its reflex field F_Ψ ⊂ ℂ is the fixed field of the stabilizer of Ψ in Aut(ℂ/ℚ). A CM type is a generalized CM type of rank 1. For a unitary PEL datum over F with signatures (p_τ, q_τ), Ψ = Σ p_τ τ is a generalized CM type of rank N = dim_F V, and F_Ψ equals the PEL reflex field F₀.

Hypotheses: F a CM field.

Proof or construction:

1. Define ℕ[Σ_∞] as finitely supported functions Σ_∞ → ℕ (mathlib Finsupp) with the induced Galois action.
2. Reflex field as a fixed field (mathlib IntermediateField.fixedField after descending to a finite Galois extension containing all τ(F)).
3. Comparison with M0/reflex-field: Tr(a | V₀) = Σ_τ p_τ τ(a) for a ∈ F, and σ fixes these traces iff σ fixes Ψ (Dedekind independence of characters).

API:

- `GeneralizedCMType` (structure): Ψ : Σ_∞ →₀ ℕ with Ψ(τ) + Ψ(c∘τ) = N.
- `GeneralizedCMType.reflexField` (data): F_Ψ, the fixed field of Stab(Ψ) ⊂ Aut(ℂ/ℚ).
- `GeneralizedCMType.IsCMType` (data): N = 1.
- `GeneralizedCMType.galois_smul` (functoriality): σ·Ψ = Σ r_τ (σ∘τ); F_{σΨ} = σ(F_Ψ).
- `GeneralizedCMType.reflexField_eq_pel` (compatibility): For a unitary PEL datum of signature Ψ, F_Ψ = RationalPELDatum.reflexField.
- `GeneralizedCMType.nPhi_sub` (example): Ψ = NΦ − τ_∞ + τ_∞^c (LTXZZ Lemma 4.2.1 signature) is a generalized CM type of rank N.

Unit tests:

- `gcmType_reflex_imagQuad` (computation): For F = ℚ(i) and Ψ = 2τ + τ̄ (rank 3), the stabilizer is trivial on F so F_Ψ = ℚ(i); for Ψ = τ + τ̄ (rank 2), F_Ψ = ℚ.
- `gcmType_cm_rank1` (degenerate): For N = 1, Ψ is a CM type Φ and F_Φ is the classical reflex field; for F = ℚ(i), Φ = {τ}, F_Φ = ℚ(i).
- `gcmType_not` (non-example): For a quartic CM field with embeddings τ₁, τ̄₁, τ₂, τ̄₂, Ψ = τ₁ + τ̄₁ + 2τ₂ + τ̄₂ is not a generalized CM type: r_{τ₁} + r_{τ̄₁} = 2 but r_{τ₂} + r_{τ̄₂} = 3.

Uses: Liu–Tian–Xiao–Zhang–Zhu, Definition 3.4.3: the signature type of an O_F-abelian scheme. Liu–Tian–Xiao–Zhang–Zhu, Notation 3.3.6(4): ℚ_p^Ψ is the composite of ℚ_p, F and F_Ψ. PELModuli:M1/unitary-of-abelian-scheme: signature type Ψ condition on Lie.

Acceptance: For F imaginary quadratic and Ψ = (n−1)τ + τ̄, F_Ψ = F when n ≠ 2 and F_Ψ = ℚ when n = 2. For a CM type Φ of a CM field of degree 4 that is primitive, F_Φ is the reflex CM field.

Direct prerequisites: Within this roadmap: M0/signatures; M0/reflex-field. Other roadmaps and libraries: mathlib:NumberField.IsCMField; mathlib:IntermediateField.fixedField; mathlib:NumberField.ComplexEmbedding.conjugate.

Source evidence: [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Definition 3.3.1, p. 28 (arXiv v3): “A generalized CM type of rank N is an element Ψ = Σ_{τ∈Σ∞} r_τ τ ∈ N[Σ∞] satisfying r_τ + r_{τ^c} = N for every τ ∈ Σ∞. For such Ψ, we define its reflex field F_Ψ ⊆ C to be the fixed subfield of the stabilizer of Ψ in Aut(C/Q).” (definition).

### The reflexive closure F_rflx of a CM field

Declaration: **TauCeti.PEL.CMField.reflexiveClosure**. Node: PELModuli:M0/reflexive-closure. Kind: definition.

For a CM field F, the reflexive closure F_rflx ⊂ ℂ is the subfield generated by F and ⋂_Φ F_Φ over all CM types Φ of F (published definition; arXiv versions v1–v3 used the composite of F and all F_Φ, which is the Galois closure of F). Put F⁺_rflx := (F_rflx)^{c=1}. Then F_rflx is a CM field, finite Galois over F, F⁺_rflx is its maximal totally real subfield and is finite Galois over F⁺, and F_rflx = F when F is Galois over ℚ or contains an imaginary quadratic field.

Hypotheses: F a CM field.

Proof or construction:

1. ⋂_Φ F_Φ is Galois over ℚ because the set of CM types is Aut(ℂ/ℚ)-stable, and it is CM or totally real.
2. Hence F_rflx = F·(⋂ F_Φ) is CM and Galois over F; c commutes with the Galois action, giving the statements on F⁺_rflx.
3. If F is Galois, every F_Φ ⊂ F; if F ⊃ K imaginary quadratic, the CM type induced from K has reflex field K ⊂ F.

API:

- `CMField.reflexiveClosure` (constructor): F_rflx = F · ⋂_Φ F_Φ (published definition).
- `CMField.reflexiveClosure_isCM` (instance): F_rflx is a CM field.
- `CMField.reflexiveClosure_galois` (other): F_rflx/F and F⁺_rflx/F⁺ are finite Galois.
- `CMField.reflexiveClosure_eq_of_galois` (simp): F Galois over ℚ ⇒ F_rflx = F.
- `CMField.reflexiveClosure_eq_of_imagQuad` (simp): F ⊃ K imaginary quadratic ⇒ F_rflx = F.
- `CMField.reflexiveClosure_le_galoisClosure` (compatibility): F_rflx ⊂ the Galois closure of F (mathlib IntermediateField.normalClosure).

Unit tests:

- `reflexiveClosure_imagQuad` (computation): For F = ℚ(√−5), F_rflx = F.
- `reflexiveClosure_galois` (computation): For F = ℚ(ζ_5), Galois over ℚ, F_rflx = F.
- `reflexiveClosure_not_intersection_alone` (non-example): For F = ℚ(√2, i), the CM types are induced from ℚ(i) or ℚ(√−2), so their reflex fields are ℚ(i) and ℚ(√−2) and ⋂_Φ F_Φ = ℚ, while F_rflx = F: omitting F from the definition gives the wrong field.

Uses: Liu–Tian–Xiao–Zhang–Zhu, Definition 3.3.4: very special inert primes are defined through primes of F⁺_rflx. Liu–Tian–Xiao–Zhang–Zhu, §8: (L5-2) of Definition 8.1.1 and Lemma 8.1.4.

Acceptance: F imaginary quadratic: F_rflx = F. F Galois CM: F_rflx = F.

Direct prerequisites: Within this roadmap: M0/generalized-cm-type. Other roadmaps and libraries: mathlib:IntermediateField.normalClosure.

Source evidence: [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Definition 3.3.2, p. 28 (arXiv v3): “We define the reflexive closure of F, denoted by F_rflx, to be the subfield of C generated by F and F_Φ for every CM type Φ of F.” (arXiv v3 wording; the published version uses the intersection of the F_Φ (recorded in PAPER-LIU-ETAL-22)). [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Remark 3.3.3, p. 28 (arXiv v3): “In many cases, we have F_rflx = F and hence F+_rflx = F+, for example, when F is Galois or contains an imaginary quadratic field.” (properties).

### τ-parts at an unramified prime and the field ℚ_p^Ψ

Declaration: **TauCeti.PEL.tauField**. Node: PELModuli:M0/unramified-tau-decomposition. Kind: construction.

Let F be a CM field, p a prime unramified in F, and ι_p : ℂ ≅ ℚ̄_p fixed, so Σ_∞ is also the set of p-adic embeddings of F. For τ ∈ Σ_∞ let ℚ_p^τ be the composite of τ(F) and ℚ_p (unramified), ℤ_p^τ its ring of integers, 𝔽_p^τ its residue field; ℚ_p^◇ the composite of all ℚ_p^τ, with Σ_∞ = Hom(O_F, ℤ_p^◇) = Hom(O_F, 𝔽_p^◇) carrying the p-Frobenius σ; and for a generalized CM type Ψ, ℚ_p^Ψ the composite of ℚ_p, F and F_Ψ (⊂ ℚ_p^◇). For an O_S-module ℱ with O_F-action over S ∈ Sch/ℤ_p^τ, ℱ_τ is the maximal submodule on which O_F acts through τ. Over S ∈ Sch/ℤ_p^◇, ℱ = ⊕_τ ℱ_τ for every O_F ⊗ O_S-module ℱ.

Hypotheses: p unramified in F.

Proof or construction:

1. O_F ⊗ ℤ_p^◇ ≅ ∏_{τ} ℤ_p^◇ since p is unramified; the idempotents give the decomposition ℱ = ⊕ ℱ_τ.
2. σ acts on Σ_∞ by composition with Frobenius of 𝔽_p^◇; (ℱ_τ)^{(p)} = (ℱ^{(p)})_{στ} for Frobenius twists.

API:

- `tauField` (data): ℚ_p^τ and ℤ_p^τ, 𝔽_p^τ for τ ∈ Σ_∞ (unramified).
- `diamondField` (data): ℚ_p^◇ := composite of all ℚ_p^τ.
- `psiField` (data): ℚ_p^Ψ := ℚ_p · F · F_Ψ ⊂ ℚ_p^◇.
- `tauPart` (constructor): ℱ_τ ⊂ ℱ for an O_F-module ℱ over a ℤ_p^τ-scheme.
- `tauPart_decomp` (characterisation): Over ℤ_p^◇-schemes, ℱ = ⊕_τ ℱ_τ.
- `frobeniusOnEmbeddings` (data): The action of σ on Σ_∞ = Hom(O_F, 𝔽_p^◇).
- `tauPart_frobeniusTwist` (relation): (ℱ_τ)^{(p)} = (ℱ^{(p)})_{στ}.

Unit tests:

- `tauField_split` (computation): For F = ℚ(i) and p = 5, ℚ_5^τ = ℚ_5 for both embeddings, ℚ_5^◇ = ℚ_5.
- `tauField_inert` (computation): For F = ℚ(i) and p = 3, ℚ_3^τ = ℚ_9 and σ(τ) = τ̄.
- `tauPart_ramified` (non-example): For p = 2 ramified in ℚ(i), O_F ⊗ ℤ_2 is not a product of copies of an unramified ring and ℱ ≠ ⊕ ℱ_τ in general (ℤ_2[i] acting on itself has no τ-eigen-decomposition over any unramified extension).
- `tauPart_zero` (degenerate): For ℱ = 0 every τ-part is 0.

Uses: Liu–Tian–Xiao–Zhang–Zhu, Remark 3.4.6: the Hodge sequence splits into τ-parts of ranks N − r_τ, N, r_τ. PELModuli:M2/unitary-deformation: deformations are controlled by the τ_∞, τ_∞^c parts.

Acceptance: For F = ℚ(i) and p ≡ 1 mod 4, ℚ_p^τ = ℚ_p and σ fixes each τ; for p ≡ 3 mod 4, ℚ_p^τ = ℚ_{p²} and σ swaps τ, τ̄.

Direct prerequisites: Within this roadmap: M0/generalized-cm-type. 

Source evidence: [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Notation 3.3.6(2), p. 29 (arXiv v3): “For every τ ∈ Σ∞, we denote by Q^τ_p ⊆ C the composition of τ(F) and Q_p, which is unramified over Q_p.” (τ-parts). [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Remark 3.4.6, p. 30 (arXiv v3): “If S belongs to Sch/Z♦_p, then we have decompositions H^dR_1(A/S) = ⊕_{τ∈Σ∞} H^dR_1(A/S)_τ” (decomposition over ℤ_p^◇).

Dependencies of M0: ShimuraData:D3, ShimuraData:D4, ShimuraData:D5, tauceti:TauCetiRoadmap.

Coverage of M0: **planned**. Remaining refinements: Refine M0/albert-types into the Albert classification of positive involutions on simple algebras (Lan Propositions 1.2.1.13–1.2.1.14) as separate lemma nodes when the roadmap moves to lemma level. M0/rank-one-skew-hermitian-classification rests on the unowned Galois-cohomology input recorded in gap 'Nonabelian Galois cohomology, ker¹ and the Hasse principle'. Split M0/self-dual-lattice-classification into Lan Proposition 1.2.3.7/Corollary 1.2.3.10 (complete local rings) and Kottwitz Lemma 7.2 (ℚ_p, with the p = 2 Case C argument) at lemma level.

Acceptance tests for M0: (Positive involution of a semisimple ℚ-algebra) (ℚ, id) and (M_n(ℚ), transpose) are positive; (M_2(ℚ), adjugate) and (ℚ(i), id) are not. (Types A, C and D of simple factors with positive involution) B = ℚ: type C. B = K imaginary quadratic with complex conjugation: type A. B a definite quaternion algebra over ℚ with its canonical involution: type D (B ⊗ ℝ ≅ ℍ). B an indefinite quaternion algebra with a positive involution x ↦ t⁻¹ x̄ t: type C. (Orders, discriminant and unramified primes of (B, O)) For B = F a number field and O = O_F, Disc = disc(F)ℤ (agreement with Mathlib's NumberField.discr). (Symplectic O-lattice and its dual lattice) L = ℤ^{2g} with the standard form: L^# = L. (Integral PEL datum (PEL-type O-lattice)) (ℤ, id, ℤ^{2g}, standard form, h(i) = J) is an integral PEL datum (Siegel case, M5/siegel-pel-datum). (Rational and p-integral PEL data) The Siegel datum restricts to a p-integral datum for every p. (The similitude group G of a PEL datum) For the Siegel datum G = GSp_{2g} over ℤ, and G₁ = Sp_{2g} (Tau Ceti Symplectic.groupScheme). (Structure of G: connectedness, derived group and type D components) Siegel: G = GSp_{2g} connected with G^der = Sp_{2g} simply connected and D = G_m. (Bad primes and the good-prime base) Siegel datum with principal polarization: the bad primes are exactly those dividing n. (Positivity and the polarized Hodge structure of a PEL datum) For the Siegel datum, V₀ is the +√−1-eigenspace of J and the polarization is the standard Riemann form. (The Shimura datum (G, X) of a PEL datum) The Siegel PEL datum gives ShimuraData:D5/siegel-datum. (Signatures of a PEL datum) Siegel: p = q = g. (The determinant polynomial Det_{O|M}) For O = ℤ, Det_{ℤ|M}(X) = X^{rank M}. (The determinant polynomial classifies modules in every characteristic) Over 𝔽_p with C = 𝔽_p and modules 𝔽_p^p and 0: equal traces, different determinants. (The reflex field F₀ of a PEL datum) Siegel: F₀ = ℚ. (The PEL reflex field equals the Shimura reflex field) Siegel: E(G, X) = ℚ = F₀. (The Kottwitz determinant condition) For the Siegel datum the condition says rank Lie = g (Det = X^g), which every g-dimensional abelian scheme satisfies. (Determinant condition versus the representation over a splitting field) Siegel: both conditions say dim M = g. (Uniqueness of self-dual lattices at good primes) Siegel: any two self-dual symplectic ℤ_p-lattices in ℚ_p^{2g} are GSp_{2g}(ℚ_p)-conjugate. (Signatures are constant above each prime of F₀ under Hypothesis 1.1.1) For F₀ = ℚ (imaginary quadratic F) the statement is vacuous. (Hermitian spaces over O_F ⊗ R and the space V_♯) For R = F⁺ and V = F^N with the standard form Σ x_i ȳ_i, U(V) is the definite unitary group of rank N. (Rational skew-hermitian spaces, similitudes, GU(W) and T₀) For rank one, GU(W₀) ≅ T₀ ⊗ ℤ_(p) canonically. (Rank-one skew-hermitian spaces and ker¹(T₀)) If F/F⁺ is such that F⁺^× ∩ N(𝔸_F^×) = N(F^×) (Hasse norm theorem, F/F⁺ cyclic) then ker¹ of the norm-one torus vanishes; ker¹(T₀) can still be nontrivial. (Generalized CM types and their reflex fields) For F imaginary quadratic and Ψ = (n−1)τ + τ̄, F_Ψ = F when n ≠ 2 and F_Ψ = ℚ when n = 2. (The reflexive closure F_rflx of a CM field) F imaginary quadratic: F_rflx = F. (τ-parts at an unramified prime and the field ℚ_p^Ψ) For F = ℚ(i) and p ≡ 1 mod 4, ℚ_p^τ = ℚ_p and σ fixes each τ; for p ≡ 3 mod 4, ℚ_p^τ = ℚ_{p²} and σ swaps τ, τ̄.

<a id="m1"></a>

## M1. The moduli functors and descent

M1 defines the fibred categories (RS-23 and RS-27 owner records: the generic fibred moduli, level and descent functors and the stack property). A PEL triple (A, λ, i) over a locally noetherian S₀-scheme is an abelian scheme with a ℤ_(□)^×-polarization and an O-structure satisfying the Rosati condition and the determinant condition on Lie. Level structures are built from the étale sheaf of O-linear symplectic similitudes L ⊗ Ẑ^□ ≅ T^□A with their multipliers: principal level-n structures (α_n, ν_n) are liftable symplectic isomorphisms, and the multiplier ν_n is kept as data; general level-H structures are compatible orbits, with rational level structures as π₁-invariant H-orbits of similitudes on rational Tate modules. Three distinct problems are defined: M_H (isomorphism classes, integral level), M^rat_H (prime-to-□ quasi-isogeny classes, rational level) and, over the reflex field, the all-primes adelic problem M^ad_K; M_H ≅ M^rat_H is a theorem, as are the changes of order, lattice and good primes (with the type D failure recorded). M_H is an fppf stack because polarizations give relatively ample sheaves; the presheaf of isomorphism classes is not a sheaf (quadratic twists). Hecke translations act on the right, and morphisms of PEL data, in particular forgetting i, act by functoriality.

Planets: PEL-type abelian scheme; Principal level structure; PEL moduli problem M_H; Stack property of PEL moduli.

### Prime-to-□ quasi-isogenies and ℤ_(□)^×-polarizations

Declaration: **TauCeti.PEL.QuasiIsogeny**. Node: PELModuli:M1/prime-to-box-quasi-isogeny. Kind: definition.

Let □ be a set of primes and S a scheme over ℤ_(□). A quasi-isogeny A ⇢ A' of abelian schemes over S is an equivalence class of spans A ← B → A' of isogenies (Lan Definition 1.3.1.14), equivalently an element f ∈ Hom_S(A, A') ⊗ ℚ such that Nf is an isogeny for some integer N ≥ 1. It is prime-to-□ (a ℤ_(□)^×-isogeny) if it is represented by a span of isogenies whose kernels have rank prime to every p ∈ □. A ℤ_(□)^×-isogeny λ : A ⇢ A^∨ is positive if [N] ∘ λ is a polarization for some N ≥ 1, and a ℤ_(□)^×-polarization is a positive ℤ_(□)^×-isogeny A ⇢ A^∨. For □ = {p} (P = ℤ_(p), as in Liu–Tian–Xiao–Zhang–Zhu): a quasi-p-homomorphism (resp. quasi-p-isogeny) φ is one with cφ a homomorphism (resp. isogeny) for some c ∈ ℤ_(p)^×; φ is prime-to-p if φ and φ⁻¹ are quasi-p-isogenies; a quasi-polarization is p-principal if it is a prime-to-p quasi-isogeny.

Hypotheses: S a scheme over ℤ_(□): integers prime to every p ∈ □ are invertible on S.

Proof or construction:

1. Define the category of abelian schemes up to prime-to-□ isogeny by inverting prime-to-□ isogenies; Lan Lemma 1.3.1.16 identifies it with Hom ⊗ ℤ_(□).
2. Dualize quasi-isogenies through spans (Lan Definition 1.3.2.24), using the dual abelian scheme and dual isogenies of AbelianSchemesAndArithmeticModuli A2–A3.
3. Positivity: f^∨ ∘ λ ∘ f is positive for a prime-to-□ f and λ⁻¹ is positive (Lan Corollary 1.3.2.25), via pullback of relatively ample sheaves along isogenies.
4. LTXZZ Definition 3.4.5 is the case P = ℤ_(p) of the same notions.

API:

- `QuasiIsogeny` (structure): Elements of Hom_S(A, A') ⊗ ℚ some integer multiple of which is an isogeny.
- `QuasiIsogeny.IsPrimeTo` (data): Representable by a span of isogenies of degree prime to □.
- `QuasiIsogeny.dual` (functoriality): f ↦ f^∨ : A'^∨ ⇢ A^∨ with (f ∘ g)^∨ = g^∨ ∘ f^∨ and id^∨ = id.
- `QuasiIsogeny.comp` (structure): Composition; the prime-to-□ quasi-isogenies form a groupoid.
- `BoxPolarization` (structure): A positive prime-to-□ quasi-isogeny λ : A ⇢ A^∨.
- `BoxPolarization.pullback` (functoriality): f^∨ ∘ λ ∘ f is a ℤ_(□)^×-polarization for prime-to-□ f.
- `BoxPolarization.inv_pos` (other): λ⁻¹ : A^∨ ⇢ A is positive.
- `QuasiIsogeny.IsQuasiP` (data): LTXZZ: cφ is a homomorphism/isogeny for some c ∈ ℤ_(p)^×; IsPrimeToP; IsPPrincipal for quasi-polarizations.
- `QuasiIsogeny.ofIsogeny` (coercion): Every isogeny (Tau Ceti AbelianVariety.IsIsogeny over a field) is a quasi-isogeny.

Unit tests:

- `quasiIsogeny_mulBy` (computation): For an abelian variety A over a field and n ≥ 1, [n] (Tau Ceti AbelianVariety.mulBy A n) is a prime-to-□ isogeny iff n is prime to every p ∈ □, and its inverse (1/n)·id is a quasi-isogeny.
- `quasiIsogeny_id` (degenerate): id_A is a prime-to-□ quasi-isogeny for every □; for □ = ∅ every quasi-isogeny is prime-to-□.
- `quasiIsogeny_frobenius_not_primeTo` (non-example): For an elliptic curve E over 𝔽_p, the relative Frobenius E → E^{(p)} has degree p and is not a prime-to-□ quasi-isogeny when p ∈ □.
- `boxPolarization_neg` (non-example): −λ for a polarization λ is a ℤ_(□)^×-isogeny that is not positive, hence not a ℤ_(□)^×-polarization.

Uses: Lan 2008, Definition 1.4.2.4: isomorphisms of M^rat_H are ℤ_(□)^×-isogenies. Kottwitz 1992, §5: A is an abelian scheme up to prime-to-p isogeny and λ a prime-to-p polarization. Liu–Tian–Xiao–Zhang–Zhu, Definition 3.5.4 and Lemma 3.4.12: prime-to-p quasi-isogenies define equivalence of CM triples; quasi-p-isogenies α, β with βα = ϖ. IgusaVarietiesAndTorsionConcentration:IG.0: isomorphism-versus-isogeny distinctions for central leaves.

Acceptance: [n] is a prime-to-□ isogeny iff n is prime to □. For an elliptic curve E, every quasi-isogeny E ⇢ E^∨ is a rational multiple of the canonical principal polarization.

Direct prerequisites: Other roadmaps and libraries: AbelianSchemesAndArithmeticModuli:A2; AbelianSchemesAndArithmeticModuli:A3; tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.3.1.15, p. 110: “A quasi-isogeny f : A → A′ of abelian schemes over S is prime-to-□ if it can be represented by a triple (B, g, h) as in Definition 1.3.1.14 such that g and h are both prime-to-□ isogenies.” (prime-to-□ quasi-isogeny). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.3.2.27, p. 121: “A Z×_(□)-polarization λ of A is a positive Z×_(□)-isogeny from A to A∨.” (ℤ_(□)^×-polarization). [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Definition 3.4.5, p. 30 (arXiv v3): “A quasi-isogeny ϕ is prime-to-p if both ϕ and ϕ^{−1} are quasi-p-isogenies. We say that a quasi-polarization λ of A is p-principal if λ is a prime-to-p quasi-isogeny.” (LTXZZ variant).

### Polarized abelian scheme with O-structure satisfying the Kottwitz condition

Declaration: **TauCeti.PEL.PELTriple**. Node: PELModuli:M1/pel-abelian-scheme. Kind: definition.

Fix an integral PEL datum, a set □ of good primes and S a locally noetherian scheme over S₀ = Spec O_{F₀,(□)}. A PEL triple over S is (A, λ, i): A an abelian scheme over S; λ : A ⇢ A^∨ a ℤ_(□)^×-polarization; i : O → End_S(A) (or O ⊗ ℤ_(□) → End_S(A) ⊗ ℤ_(□)) a ring homomorphism satisfying the Rosati condition i(b)^∨ ∘ λ = λ ∘ i(b*) for b ∈ O; and Lie_{A/S}, with its O ⊗ ℤ_(□)-action through i, satisfying the determinant condition (M0/determinant-condition). Morphisms (A, λ, i) → (A', λ', i') are isomorphisms f : A → A' with λ = f^∨ ∘ λ' ∘ f and f ∘ i(b) = i'(b) ∘ f.

Hypotheses: integral PEL datum; □ a set of good primes; S locally noetherian over S₀.

Proof or construction:

1. Import abelian schemes, duals, polarizations, Rosati involutions and Lie algebras from AbelianSchemesAndArithmeticModuli A1–A2 (A2/rosati-involution) and A4.
2. The Rosati condition says that the λ-Rosati involution on End_S(A) ⊗ ℤ_(□) restricts to * on the image of O (Lan Definition 1.3.3.1).
3. Impose the determinant condition on Lie_{A/S} with the action induced by i (Lan Definition 1.4.1.4 (4)).

API:

- `PELTriple` (structure): (A, λ, i) over S with Rosati compatibility and the determinant condition.
- `PELTriple.rosati` (relation): i(b)^∨ ∘ λ = λ ∘ i(b*) for all b ∈ O.
- `PELTriple.detCondition` (characterisation): Lie_{A/S} satisfies M0/determinant-condition.
- `PELTriple.Hom` (structure): Isomorphisms f with λ = f^∨ λ' f and f i(b) = i'(b) f; a groupoid.
- `PELTriple.pullback` (functoriality): Base change along T → S gives a PEL triple over T, with (g ∘ f)^* ≅ f^* g^* coherently.
- `PELTriple.relDim` (other): rel. dim A = dim_ℂ V₀ (from the determinant condition).
- `PELTriple.siegel` (compatibility): For the Siegel datum, PEL triples are exactly ℤ_(□)^×-polarized abelian schemes of relative dimension g with i the canonical ℤ-action.
- `PELTriple.toAbelianVariety` (coercion): Over S = Spec k, A is a Tau Ceti AbelianVariety k with i : O → AbelianVariety.End A.

Unit tests:

- `pelTriple_siegel` (compatibility): For the Siegel datum of genus 1 over S = Spec k, a PEL triple is an elliptic curve with a ℤ_(□)^×-multiple of its canonical principal polarization.
- `pelTriple_rosati_fails` (non-example): For E/ℂ with CM by ℤ[i] and its principal polarization λ, the λ-Rosati involution on ℤ[i] ⊂ End E is complex conjugation; so the inclusion is an O-structure for (ℚ(i), complex conjugation) but not for (ℚ(i), id).
- `pelTriple_zero` (degenerate): For L = 0, the only PEL triple is (0, 0, 0) over every S.
- `pelTriple_det_picard` (computation): For a Picard datum of signature (2, 1) over K = ℚ(√−3), a PEL triple over ℂ has dim Lie_τ = 2 and dim Lie_τ̄ = 1.

Uses: Lan 2008, Definition 1.4.1.4: objects of M_H(S) are PEL triples with a level-H structure. ShimuraCompactifications:C4: degenerations of polarized abelian schemes extend the endomorphism structure of PEL triples. ArakelovGeometryAndAbelianHeights:R35.5: imports the polarized moduli objects and their family. PELModuli:M2/formal-smoothness: deformations of (A₀, λ₀, i₀).

Acceptance: For the Siegel datum a PEL triple is a ℤ_(□)^×-polarized abelian scheme of relative dimension g (i is the structure map ℤ → End). Over ℂ a PEL triple gives a polarized Hodge structure H₁(A, ℚ) with B-action whose V^{−1,0} ≅ Lie A ≅ V₀ (Kottwitz §8).

Direct prerequisites: Within this roadmap: M0/determinant-condition; M0/integral-pel-datum; M1/prime-to-box-quasi-isogeny. Other roadmaps and libraries: AbelianSchemesAndArithmeticModuli:A1; AbelianSchemesAndArithmeticModuli:A2; AbelianSchemesAndArithmeticModuli:A2/rosati-involution; AbelianSchemesAndArithmeticModuli:A4; tauceti:TauCeti.AlgebraicGeometry.AbelianVariety; tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.3.3.1, p. 122: “satisfying the Rosati condition that the restriction of the λ-Rosati involution of End_S(A) ⊗ R on the image of O ⊗ R agrees with the one induced by the involution ⋆ of O.” (Rosati condition). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.4.1.4, pp. 149–150: “LieA/S with its O ⊗ Z(□)-module structure given naturally by i satisfies the determinantal condition in Definition 1.3.4.2 given by (L ⊗ R, ⟨·,·⟩).” (determinant condition on Lie). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 390: “i: O_B → End(A) is a *-homomorphism for * on O_B and the Rosati involution on the Z_(p)-algebra End(A) obtained from the polarization λ” (Kottwitz's triples).

### O_F-abelian schemes, unitary O_F-abelian schemes and signature type

Declaration: **TauCeti.PEL.OFAbelianScheme**. Node: PELModuli:M1/unitary-of-abelian-scheme. Kind: definition.

Let F be a CM field, P ⊂ ℚ a subring and S a P-scheme. An O_F-abelian scheme is (A, i) with i : O_F → End_S(A) ⊗ P a unital ring homomorphism; a unitary O_F-abelian scheme is (A, i, λ) with λ : A → A^∨ a quasi-polarization satisfying i(a^c)^∨ ∘ λ = λ ∘ i(a) for a ∈ O_F and cλ a polarization for some c ∈ P^×. For a generalized CM type Ψ = Σ r_τ τ of rank N and S over O_{F_Ψ} ⊗ P, (A, i) has signature type Ψ if for every a ∈ O_F the characteristic polynomial of i(a) on Lie_{A/S} is ∏_τ (T − τ(a))^{r_τ} ∈ O_S[T]. Then dim A = N[F⁺ : ℚ]; over S ∈ Sch/ℤ_p^τ (p unramified in F) the Hodge sequence 0 → ω_{A^∨/S,τ} → H^dR_1(A/S)_τ → Lie_{A/S,τ} → 0 is exact with locally free terms of ranks N − r_τ, N, r_τ; and λ induces a pairing ⟨·,·⟩_{λ,τ} : H^dR_1(A/S)_τ × H^dR_1(A/S)_{τ^c} → O_S, perfect if λ is p-principal. These are the PEL triples of the datum (O_F, c, W, ⟨·,·⟩) with signature Ψ (M1/pel-abelian-scheme).

Hypotheses: F CM; p unramified in F for the τ-part statements.

Proof or construction:

1. Define the structures (LTXZZ Definition 3.4.2, 3.4.3) as specializations of PEL triples with B = F, O = O_F, * = c.
2. Prove: signature type Ψ ⇔ Kottwitz determinant condition for the unitary datum of signature Ψ when p is unramified in F (characteristic polynomials of all a ∈ O_F determine the O_F ⊗ O_S-module Lie up to the determinant polynomial; M0/determinant-classifies).
3. Ranks of τ-parts from H^dR_1 locally free over O_F ⊗ O_S of rank N (M0/unramified-tau-decomposition; H^dR_1 and the Hodge sequence from AbelianSchemesAndArithmeticModuli A4).
4. The pairing from the polarization: ⟨x, y⟩_λ = ⟨x, λ_* y⟩ restricted to τ and τ^c parts; perfect for p-principal λ.

API:

- `OFAbelianScheme` (structure): (A, i : O_F → End_S(A) ⊗ P).
- `UnitaryOFAbelianScheme` (structure): (A, i, λ) with i(a^c)^∨ λ = λ i(a) and cλ a polarization for some c ∈ P^×.
- `OFAbelianScheme.HasSignatureType` (data): charpoly(i(a) | Lie) = ∏ (T − τ(a))^{r_τ} for all a ∈ O_F.
- `HasSignatureType.iff_detCondition` (equivalence): For p unramified in F, signature type Ψ ⇔ the Kottwitz condition for the unitary datum of signature Ψ.
- `HasSignatureType.dim` (other): dim A = N [F⁺ : ℚ].
- `HasSignatureType.hodge_tau` (other): The τ-part of the Hodge sequence is exact with ranks N − r_τ, N, r_τ (Remark 3.4.6).
- `UnitaryOFAbelianScheme.pairingTau` (data): ⟨·,·⟩_{λ,τ} : H^dR_1(A/S)_τ × H^dR_1(A/S)_{τ^c} → O_S.
- `UnitaryOFAbelianScheme.pairingTau_perfect` (other): ⟨·,·⟩_{λ,τ} is perfect if λ is p-principal (the converse fails over bases where p is invertible).
- `UnitaryOFAbelianScheme.toPELTriple` (coercion): A unitary O_F-abelian scheme of signature type Ψ with P = ℤ_(□) is a PEL triple for the unitary datum of signature Ψ.

Unit tests:

- `signatureType_cm_elliptic` (computation): For E/ℂ with CM by O_K (K imaginary quadratic) via the normalized action, (E, i) has signature type τ (r_τ = 1, r_τ̄ = 0): i(a) acts on Lie E by τ(a).
- `signatureType_conj` (non-example): The same E with i composed with complex conjugation has signature type τ̄, not τ: signature type is not invariant under i ↦ i ∘ c.
- `signatureType_iff_det` (compatibility): For p unramified in F and S over ℤ_p^◇, HasSignatureType Ψ ⇔ rank Lie_τ = r_τ for all τ ⇔ SatisfiesDetCondition (M0) for the datum of signature Ψ.
- `unitary_zero` (degenerate): (0, 0, 0) is a unitary O_F-abelian scheme of signature type the zero generalized CM type of rank 0.

Uses: Liu–Tian–Xiao–Zhang–Zhu, §§3.4–3.5, 4–5: moduli of unitary O_F-abelian schemes of signature type NΦ − τ_∞ + τ_∞^c and the CM moduli T_p. PELModuli:M2/unitary-deformation: deformation groupoids Def(S, Ŝ; A, λ). PELModuli:M2/isogeny-kernel-ranks: kernel ranks of O_F-linear quasi-p-isogenies.

Acceptance: Signature type Φ (a CM type) for an elliptic curve with CM by O_K, K imaginary quadratic: Lie = Lie_τ of rank 1.

Direct prerequisites: Within this roadmap: M1/pel-abelian-scheme; M0/generalized-cm-type; M0/unramified-tau-decomposition; M0/skew-hermitian-space. Other roadmaps and libraries: AbelianSchemesAndArithmeticModuli:A4.

Source evidence: [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Definition 3.4.2 (2), p. 29 (arXiv v3): “A unitary O_F-abelian scheme over S is a triple (A, i, λ) in which (A, i) is an O_F-abelian scheme over S, and λ : A → A∨ is a quasi-polarization such that i(a^c)∨ ◦ λ = λ ◦ i(a) for every a ∈ O_F, and there exists c ∈ P× making cλ a polarization.” (definition). [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Definition 3.4.3, p. 29 (arXiv v3): “We say that an O_F-abelian scheme (A, i) over S has signature type Ψ if for every a ∈ O_F, the characteristic polynomial of i(a) on Lie_{A/S} is given by ∏_{τ∈Σ∞} (T − τ(a))^{r_τ} ∈ O_S[T].” (signature type). [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Remark 3.4.6, p. 30 (arXiv v3): “0 → ω_{A∨/S,τ} → H^dR_1(A/S)_τ → Lie_{A/S,τ} → 0 of locally free O_S-modules of ranks N − r_τ, N, and r_τ, respectively.” (ranks).

### The étale sheaf of symplectic trivializations of the prime-to-□ Tate module

Declaration: **TauCeti.PEL.symplecticIsomSheaf**. Node: PELModuli:M1/symplectic-isom-sheaf. Kind: construction.

Let (A, λ, i) be a PEL triple over a connected locally noetherian S₀-scheme S, with prime-to-□ Tate module T^□A (a lisse Ẑ^□-sheaf on S_ét) and the λ-Weil pairing e^λ : T^□A × T^□A → T^□G_m. Isom_{O,sympl}(L ⊗ Ẑ^□, T^□A) is the étale sheaf of pairs (α̂, ν(α̂)) with α̂ : L ⊗ Ẑ^□ ≅ T^□A an O-linear isomorphism and ν(α̂) : Ẑ^□(1) ≅ T^□G_m such that e^λ(α̂x, α̂y) = ν(α̂)(⟨x, y⟩). G(Ẑ^□) acts on the right by α̂ ↦ α̂ ∘ g with ν(α̂ ∘ g) = ν(α̂)·ν(g); when nonempty at a geometric point s̄ the fibre is a G(Ẑ^□)-torsor, and π₁(S, s̄) acts on it on the left. The rational variant Isom(V ⊗ 𝔸^{∞,□}, V^□A) uses the rational Tate module V^□A = T^□A ⊗ ℚ and G(𝔸^{∞,□}).

Hypotheses: (A, λ, i) a PEL triple; S connected locally noetherian.

Proof or construction:

1. Import the Tate module local system and the Weil pairing of a polarization from AbelianSchemesAndArithmeticModuli A3–A4 (Weil pairing with its Tate twist; étale Tate module for ℓ invertible).
2. Define the sheaf of O-linear symplectic similitudes as a closed subsheaf of Isom(L ⊗ Ẑ^□, T^□A) × Isom(Ẑ^□(1), T^□G_m) (limit over n prime to □ of finite étale schemes Isom((L/nL)_S, A[n])).
3. Torsor property at geometric points: two O-symplectic isomorphisms differ by an element of G(Ẑ^□) (Lan Definition 1.1.4.11 and §1.3.5).

API:

- `symplecticIsomSheaf` (constructor): The étale sheaf of O-linear symplectic similitudes (α̂, ν(α̂)) : L ⊗ Ẑ^□ ≅ T^□A.
- `symplecticIsomSheaf.act` (structure): Right action of G(Ẑ^□); ν(α̂ g) = ν(α̂) ν(g).
- `symplecticIsomSheaf.torsor` (characterisation): At a geometric point where it is nonempty, the fibre is a G(Ẑ^□)-torsor.
- `symplecticIsomSheaf.galois` (functoriality): π₁(S, s̄) acts on the fibre at s̄, commuting with G(Ẑ^□).
- `symplecticIsomSheaf.reduce` (projection): Reduction mod n: (α̂, ν) ↦ (α̂ mod n, ν mod n) to O-linear symplectic isomorphisms (L/nL)_S ≅ A[n].
- `symplecticIsomSheaf.rational` (functoriality): The rational variant with V ⊗ 𝔸^{∞,□}, V^□A and G(𝔸^{∞,□}).
- `symplecticIsomSheaf.baseChange` (functoriality): Compatible with pullback along S' → S.

Unit tests:

- `symplecticIsom_siegel_points` (computation): For A = E × E over ℂ with the product principal polarization and L = ℤ⁴ standard, the fibre is the set of symplectic bases of H₁(A, Ẑ) with their multiplier, a GSp₄(Ẑ)-torsor.
- `symplecticIsom_multiplier` (characterisation): For g ∈ G(Ẑ^□), ν(α̂ ∘ g) = ν(α̂)·ν(g); in particular for the Siegel datum and g = m·1 with m ∈ (Ẑ^□)^×, ν(α̂ ∘ g) = m²·ν(α̂).
- `symplecticIsom_empty` (non-example): If the λ-Weil pairing on T^□A has a different elementary-divisor type from L ⊗ Ẑ^□ (e.g. λ principal but L of type (1 | ℓ) with ℓ ∉ □), the sheaf is empty.
- `symplecticIsom_zero` (degenerate): For L = 0 and A = 0 the sheaf is Isom(Ẑ^□(1), T^□G_m), a Ẑ^{□×}-torsor.

Uses: Lan 2008, Definitions 1.3.6.1 and 1.3.7.8: level structures are orbits of (liftable) symplectic isomorphisms. Kottwitz 1992, §5: a level structure of type K^p is a π₁-invariant K^p-orbit of isomorphisms of skew-Hermitian B-modules. HilbertModularVarietiesAndShimuraCurves:H4: generic prime-to-p full-level functors (RS-23 link M1 → H4).

Acceptance: For the Siegel datum and S = Spec k, the fibre is the set of symplectic bases of T^□A up to the multiplier, a GSp_{2g}(Ẑ^□)-torsor if nonempty.

Direct prerequisites: Within this roadmap: M1/pel-abelian-scheme; M0/similitude-group. Other roadmaps and libraries: AbelianSchemesAndArithmeticModuli:A3; AbelianSchemesAndArithmeticModuli:A4; tauceti:TauCeti.RootsOfUnityGroup.groupScheme; mathlib:AlgebraicGeometry.Scheme.etaleTopology.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.3.6.1, pp. 132–133: “an O-equivariant symplectic isomorphism α̂ : L ⊗ Ẑ□ → T□A_s̄ (defined as in Definition 1.1.4.11) is an isomorphism of the underlying modules together with an isomorphism ν(α̂) : Ẑ□(1) → T□G_m,s̄” (symplectic isomorphism with multiplier). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 390: “The Tate A_f^p-module of A is a smooth A_f^p-sheaf on S.” (Tate module sheaf).

### Principal level-n structures with multiplier

Declaration: **TauCeti.PEL.PrincipalLevel**. Node: PELModuli:M1/principal-level-structure. Kind: definition.

Let n ≥ 1 be prime to □, (A, λ, i) a PEL triple over S with λ a prime-to-□ polarization and i : O → End_S(A). An integral principal level-n structure of type (L ⊗ Ẑ^□, ⟨·,·⟩) is a pair (α_n, ν(α_n)) of an O-linear isomorphism α_n : (L/nL)_S ≅ A[n] and an isomorphism ν(α_n) : ((ℤ/nℤ)(1))_S ≅ μ_{n,S}, such that for every geometric point s̄ of S there exists an O-equivariant symplectic isomorphism (α̂, ν(α̂)) : L ⊗ Ẑ^□ ≅ T^□A_s̄ (M1/symplectic-isom-sheaf) reducing to (α_{n,s̄}, ν(α_n)_s̄) mod n (liftability). The multiplier ν(α_n) is part of the datum: the mod-n pairing condition alone does not determine it at levels where L is not self-dual (e.g. L = ℓ·L_std, n = ℓ); it is pinned only through liftability. Liftability at n = 1 forces ker λ ≅ (L^# ⊗ Ẑ^□)/(L ⊗ Ẑ^□).

Hypotheses: n prime to □; (A, λ, i) PEL triple with λ prime-to-□.

Proof or construction:

1. Define α_n as an isomorphism of finite étale group schemes with O-action (A[n] finite étale since n is invertible on S, AbelianSchemesAndArithmeticModuli A3) and ν(α_n) with values in μ_n (Tau Ceti RootsOfUnityGroup.groupScheme).
2. Liftability is checked at one geometric point per connected component (Lan Corollary 1.3.6.7) because the lifts form a π₁-stable set.
3. Record the consequence ker λ ≅ (L^#/L) ⊗ Ẑ^□ (Lan Remark 1.3.6.2).

API:

- `PrincipalLevel` (structure): (α_n, ν_n) with α_n : (L/nL)_S ≅ A[n] O-linear and ν_n : (ℤ/n)(1)_S ≅ μ_n, liftable at all geometric points.
- `PrincipalLevel.symplectic` (relation): e^λ_n(α_n x, α_n y) = ν_n(⟨x, y⟩ mod n).
- `PrincipalLevel.liftable` (characterisation): Existence of an O-symplectic lift (α̂, ν(α̂)) at each geometric point; equivalent to existence at one point per connected component.
- `PrincipalLevel.ker_polarization` (other): Liftability forces ker λ ≅ (L^#/L) ⊗ Ẑ^□.
- `PrincipalLevel.pullback` (functoriality): Base change along T → S.
- `PrincipalLevel.reduce` (functoriality): For m | n, reduction to a level-m structure.
- `PrincipalLevel.act` (structure): G(ℤ/nℤ)-action (α_n, ν_n) ↦ (α_n ∘ g, ν_n ∘ ν(g)), preserving liftability for g in the image of G(Ẑ^□).
- `PrincipalLevel.multiplier_data` (other): ν_n is retained as data; it is determined by α_n via liftability but not by the mod-n symplectic equation when ⟨L, L⟩ ⊗ ℤ/n is degenerate.

Unit tests:

- `principalLevel_siegel_symplectic` (computation): For the Siegel datum g = 1, n = 3, a principal level structure on E/S is a basis (P, Q) of E[3] with e₃(P, Q) = ν₃(ζ) where ζ is the class of 1 ∈ (ℤ/3)(1).
- `principalLevel_multiplier_scaled` (non-example): For L = ℓ·ℤ² (pairing scaled by ℓ) and n = ℓ, the mod-ℓ pairing on L/ℓL vanishes, so the symplectic equation holds for every ν_ℓ; discarding ν_ℓ loses data.
- `principalLevel_n_one` (degenerate): For n = 1, α₁ and ν₁ are unique, and the structure exists iff ker λ ≅ (L^#/L) ⊗ Ẑ^□ with a liftable symplectic identification.
- `principalLevel_zero` (degenerate): For L = 0 a level-n structure is just ν_n : (ℤ/n)(1) ≅ μ_n, a μ_n-trivialization (a (ℤ/n)^×-torsor of choices).

Uses: Lan 2008, Definition 1.4.1.2: the moduli problem M_n of tuples (A, λ, i, α_n). StableReductionPartII:MC.4: full symplectic level N with μ_N trivialization over ℤ[1/N] (request to M6). PELModuli:M2/rigidity: full level n ≥ 3 rigidifies. PELModuli:M5/genus-one-comparison: matches the Katz–Mazur full level with Weil pairing.

Acceptance: For the principally polarized Siegel datum (L self-dual), α_n is a symplectic basis of A[n] relative to the Weil pairing and ν(α_n) is determined by α_n. For g = 1 this is a full level-n structure with the Weil-pairing value fixed by ν (M5/genus-one-comparison).

Direct prerequisites: Within this roadmap: M1/symplectic-isom-sheaf; M1/pel-abelian-scheme. Other roadmaps and libraries: tauceti:TauCeti.RootsOfUnityGroup.groupScheme; AbelianSchemesAndArithmeticModuli:A3.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.3.6.1, p. 133: “An (integral) principal level-n structure of (A, λ, i) of type (L ⊗ Ẑ□, ⟨·,·⟩) is an O-equivariant symplectic-liftable isomorphism αn : (L/nL)_S → A[n]” (definition). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.3.6.1, p. 134: “If L ≠ {0}, then ν(α̂) is uniquely determined by α̂, and ν(αn) is uniquely determined by αn. If L = {0}, then ν(αn) is the essential nontrivial information.” (role of the multiplier). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.3.6.2, p. 134: “Note that even when n = 1, the condition is still nontrivial. Moreover, it forces the kernel of the prime-to-□ polarization λ to be isomorphic to (L# ⊗ Ẑ□)/(L ⊗ Ẑ□).” (consequence at n = 1).

### Integral and rational level-H structures

Declaration: **TauCeti.PEL.IntegralLevel**. Node: PELModuli:M1/level-structure. Kind: definition.

Let H ⊂ G(Ẑ^□) be open compact. An integral level-H structure of (A, λ, i) is a compatible collection α_H = {α_{H_n}} over n prime to □ with U^□(n) ⊂ H, where α_{H_n} is an H_n = H/U^□(n)-orbit of étale-locally defined principal level-n structures, represented as a closed subscheme of Isom_S((L/nL)_S, A[n]) × Isom_S((ℤ/n)(1)_S, μ_n). For H ⊂ G(𝔸^{∞,□}) open compact, a rational level-H structure is, on each connected component with geometric point s̄, a π₁(S, s̄)-invariant H-orbit [α̂]_H of O-linear symplectic similitudes α̂ : V ⊗ 𝔸^{∞,□} ≅ V^□A_s̄, independent of s̄ via the canonical bijections of Lan Corollary 1.3.7.13. Every integral level-H structure gives a rational one (Construction 1.3.7.10); a rational one comes from a unique integral one iff some (equivalently every) α̂ in the orbit maps L ⊗ Ẑ^□ onto T^□A_s̄ with ν(α̂)(Ẑ^□(1)) = T^□G_m.

Hypotheses: H open compact.

Proof or construction:

1. Define α_{H_n} as an orbit of étale-local level structures and show the collection is determined by one member (Lan Remark 1.3.7.9, Corollary 1.3.7.7).
2. Construct the rational orbit [α̂]_H by lifting a representative after a finite étale cover trivializing α_{H_n} (Construction 1.3.7.10).
3. Prove the integrality criterion (Lan Corollary 1.3.7.11) and independence of the base point (Corollary 1.3.7.13).
4. For H = U^□(n) recover principal level-n structures (Lan Remark 1.4.1.6).

API:

- `IntegralLevel` (structure): Compatible orbits α_{H_n} for U^□(n) ⊂ H.
- `RationalLevel` (structure): π₁-invariant H-orbits [α̂]_H of O-symplectic similitudes V ⊗ 𝔸^{∞,□} ≅ V^□A_s̄.
- `IntegralLevel.toRational` (functoriality): Construction 1.3.7.10.
- `RationalLevel.integral_iff` (characterisation): A rational structure comes from a unique integral one iff its members map L ⊗ Ẑ^□ onto T^□A_s̄ with ν(Ẑ^□(1)) = T^□G_m.
- `RationalLevel.basepointIndep` (other): Canonical bijections between rational level structures based at two geometric points of a connected S.
- `IntegralLevel.ofPrincipal` (equivalence): For H = U^□(n), integral level-H structures are principal level-n structures.
- `RationalLevel.changeLevel` (functoriality): For H' ⊂ H, [α̂]_{H'} ↦ [α̂]_H; for g ∈ G(𝔸^{∞,□}), [α̂]_H ↦ [α̂ ∘ g]_{g⁻¹Hg}.
- `IntegralLevel.pullback` (functoriality): Compatible with base change.

Unit tests:

- `level_full_unique` (degenerate): For H = G(Ẑ^□) and a liftable triple, the level-H structure is unique.
- `level_principal_eq` (compatibility): IntegralLevel for H = U^□(n) is equivalent to PrincipalLevel n.
- `rationalLevel_not_integral` (non-example): For the Siegel datum, H = GSp_{2g}(Ẑ^□) and A with a polarization of degree ℓ² (ℓ ∉ □), the rational level structure [α̂] exists but no member sends L ⊗ Ẑ^□ onto T^□A: rational structures do not all come from integral ones.
- `rationalLevel_change_compose` (characterisation): changeLevel along H'' ⊂ H' ⊂ H equals changeLevel along H'' ⊂ H.

Uses: Lan 2008, Definitions 1.4.1.4 and 1.4.2.4: objects of M_H and M^rat_H. PELModuli:M1/hecke-action: Hecke translation of rational level structures. HilbertModularVarietiesAndShimuraCurves:H4: imports the generic prime-to-p level functors.

Acceptance: H = U^□(n): integral level-H = principal level-n. H = G(Ẑ^□): a level-H structure exists iff (A, λ, i) is everywhere locally liftable, and is then unique.

Direct prerequisites: Within this roadmap: M1/principal-level-structure; M1/symplectic-isom-sheaf; M0/similitude-group. Other roadmaps and libraries: mathlib:IsDedekindDomain.FiniteAdeleRing.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.3.7.8, p. 143: “a collection αH = {αHn} labeled by integers n ≥ 1 such that □ ∤ n and U□(n) ⊂ H, with elements αHn described as follows” (integral level-H). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Corollary 1.3.7.11, p. 144: “Then a rational level-H structure [α̂]H of (A, λ, i) based at s̄ comes from a (necessarily unique) integral level-H structure αH as in Construction 1.3.7.10 if and only if the following condition is satisfied” (integral versus rational). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, pp. 390–391: “A level structure of type K^p on A is a K^p-orbit η̄ of isomorphisms η : V_{A_f^p} → H_1(A_s̄, A_f^p) of skew-Hermitian B-modules such that η̄ is fixed by π_1(S, s̄).” (Kottwitz's rational level).

### The PEL moduli problem M_H (isomorphism classes)

Declaration: **TauCeti.PEL.PELModuli.moduliProblem**. Node: PELModuli:M1/moduli-problem. Kind: definition.

Fix an integral PEL datum, a set □ of good primes, S₀ = Spec O_{F₀,(□)} and an open compact H ⊂ G(Ẑ^□). M_H is the category fibred in groupoids over the category of locally noetherian S₀-schemes whose fibre over S has objects (A, λ, i, α_H): A an abelian scheme over S, λ a ℤ_(□)^×-polarization, i : O → End_S(A) an O-structure (Rosati condition), Lie_{A/S} satisfying the determinant condition, and α_H an integral level-H structure; morphisms are isomorphisms f : A → A' with λ = f^∨ λ' f, f i(b) = i'(b) f, and α_{H_n} = (f|_{A[n]} × id)^*α'_{H_n} for one (equivalently all) n. M_n := M_{U^□(n)}. The functor of isomorphism classes S ↦ M_H(S)/≅ is a different object, used only when automorphisms are trivial.

Hypotheses: □ a set of good primes; H ⊂ G(Ẑ^□) open compact.

Proof or construction:

1. Assemble the fibred category from PEL triples and integral level structures, with pullbacks giving a cleavage (mathlib CategoryTheory.Functor.IsFibered for the projection to schemes).
2. Check the morphism condition on level structures needs only one n (Lan Definition 1.4.1.4, isomorphism condition 3).
3. Record M_n = M_{U^□(n)} (Lan Remark 1.4.1.6) and the iso-class presheaf as a separate functor.

API:

- `PELModuli.moduliProblem` (constructor): M_H as a category fibred in groupoids over LNSch/S₀.
- `PELModuli.moduliProblem.obj` (characterisation): Objects over S are (A, λ, i, α_H) as in Lan Definition 1.4.1.4.
- `PELModuli.moduliProblem.isFibered` (instance): The projection to schemes is fibered in groupoids (mathlib Functor.IsFibered).
- `PELModuli.moduliProblem.principal` (simp): M_n = M_{U^□(n)}.
- `PELModuli.moduliProblem.isoClasses` (projection): The presheaf S ↦ M_H(S)/≅ (not a sheaf in general).
- `PELModuli.moduliProblem.changeLevel` (functoriality): For H' ⊂ H, the forgetful morphism M_{H'} → M_H.
- `PELModuli.moduliProblem.siegel` (compatibility): For the Siegel datum, M_n is the fibred category of principally polarized abelian schemes with symplectic level n and μ_n-trivialization.
- `PELModuli.moduliProblem.aut` (data): Aut(A, λ, i, α_H) as a group-valued sheaf; trivial at neat level (M2/no-automorphisms-at-neat-level).

Unit tests:

- `moduliProblem_siegel_g1` (compatibility): For the Siegel datum with g = 1 and n ≥ 3, M_n(S) is equivalent to the groupoid of elliptic curves over S with a full level-n structure (P, Q) and ν_n with e_n(P, Q) = ν_n(ζ) (ModularCurves layer 3C/5B).
- `moduliProblem_isoClasses_not_sheaf` (non-example): For the Siegel datum with g = 1 and H = GL₂(Ẑ^□), the iso-class presheaf is not an étale sheaf: an elliptic curve E over ℚ with j ≠ 0, 1728 and its quadratic twist E^d become isomorphic over ℚ(√d) (Tau Ceti WeierstrassCurve.j_quadraticTwist) but are not isomorphic over ℚ (WeierstrassCurve.not_exists_smul_quadraticTwist_eq), so two distinct classes glue to the same descent datum.
- `moduliProblem_zero` (degenerate): For L = 0, M_H(S) is the groupoid of trivializations ν of μ modulo H acting through ν(H) ⊂ Ẑ^{□×}.
- `moduliProblem_det_matters` (non-example): For a unitary datum of signature (2, 1), triples of signature (1, 2) are not objects: dropping the determinant condition adds the conjugate moduli problem.

Uses: Lan 2008, Theorem 1.4.1.12: M_H is representable by a smooth separated algebraic stack of finite type. HilbertModularVarietiesAndShimuraCurves:H1: imports the generic fibred moduli (RS-23 link M1 → H1). FaltingsFinitenessAndIsogenyTheorems:R28.1: moduli and level functors for converting moduli points into isomorphism classes (RS-23 link M1 → R28.1). ArakelovGeometryAndAbelianHeights:R35.5: polarization and rigidifying-level object (RS-23 link M1 → R35.5).

Acceptance: Siegel datum, □ = primes not dividing n: M_n is the moduli of principally polarized abelian schemes of dimension g with full symplectic level n and μ_n-trivialization over ℤ[1/n].

Direct prerequisites: Within this roadmap: M1/pel-abelian-scheme; M1/level-structure; M0/good-primes. Other roadmaps and libraries: mathlib:CategoryTheory.Functor.IsFibered; mathlib:AlgebraicGeometry.Scheme.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.4.1.4, pp. 149–150: “The moduli problem MH is defined by the category fibred in groupoids over (LNSch/S0) whose fiber over each S is the groupoid MH(S) described as follows” (definition). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.4.1.7, p. 151: “This gives essentially the same information when the objects of MH(S) have no nontrivial automorphism.” (iso-class functor only for trivial automorphisms).

### The prime-to-□ quasi-isogeny moduli problem M^rat_H

Declaration: **TauCeti.PEL.PELModuli.ratModuliProblem**. Node: PELModuli:M1/rational-moduli-problem. Kind: definition.

For H ⊂ G(𝔸^{∞,□}) open compact, M^rat_H is the category fibred in groupoids over locally noetherian S₀-schemes whose objects over S are (A, λ, i, [α̂]_H): A an abelian scheme, λ a ℤ_(□)^×-polarization, i : O ⊗ ℤ_(□) → End_S(A) ⊗ ℤ_(□) an O ⊗ ℤ_(□)-structure, Lie_{A/S} satisfying the determinant condition (for (V ⊗ ℝ, ⟨·,·⟩)), and [α̂]_H a rational level-H structure; morphisms are ℤ_(□)^×-isogenies f with λ = r f^∨ λ' f for some r ∈ ℤ_(□),>0^×, f i(b) = i'(b) f, and (α̂')⁻¹ ∘ V^□(f) ∘ α̂ in the H-orbit of the identity with ν(α̂')⁻¹ν(α̂) in the ν(H)-orbit of r. Kottwitz's functor S_{K^p} (abelian schemes up to prime-to-p isogeny with K^p-level) is the case □ = {p} at level K^p.

Hypotheses: □ good; H ⊂ G(𝔸^{∞,□}) open compact.

Proof or construction:

1. Define objects and ℤ_(□)^×-isogeny morphisms (Lan Definition 1.4.2.4), using M1/prime-to-box-quasi-isogeny and rational level structures.
2. Observe the definition uses only (V ⊗ 𝔸^{∞,□}, ⟨·,·⟩), O ⊗ ℤ_(□) and the existence of L (Lan Remark 1.4.2.7, Remark 1.4.3.13).

API:

- `PELModuli.ratModuliProblem` (constructor): M^rat_H over LNSch/S₀.
- `PELModuli.ratModuliProblem.hom` (characterisation): Morphisms are ℤ_(□)^×-isogenies respecting λ up to ℤ_(□),>0^×, i and [α̂]_H as in Lan Definition 1.4.2.4.
- `PELModuli.ratModuliProblem.dependsOnlyOn` (other): Depends only on (V ⊗ 𝔸^{∞,□}, ⟨·,·⟩), O ⊗ ℤ_(□) and the h-class; not on L.
- `PELModuli.ratModuliProblem.kottwitz` (compatibility): For □ = {p}, the iso-class functor is Kottwitz's S_{K^p}.
- `PELModuli.ratModuliProblem.changeLevel` (functoriality): Level change and Hecke translation [α̂]_{H'} ↦ [α̂ g]_H for H' ⊂ H ∩ gHg⁻¹.

Unit tests:

- `ratModuli_scalar_iso` (characterisation): For m a positive integer prime to □, [m] : A → A is an isomorphism (A, λ, i, [α̂]_H) ≅ (A, λ, i, [m α̂]_H) in M^rat_H with r = m⁻² in Lan's condition (1): scalar translation of the level structure is trivial on isomorphism classes.
- `ratModuli_siegel_kottwitz` (compatibility): For the Siegel datum with □ = {p}, iso classes of M^rat_{K^p}(k) are Kottwitz's quadruples (A up to prime-to-p isogeny, λ prime-to-p, η̄).
- `ratModuli_lattice_indep` (non-example): Two lattices L₁ ≠ L₂ in V with L₁ ⊗ ℤ_(□) = L₂ ⊗ ℤ_(□) give different M_H but the same M^rat_H: the rational problem does not see L away from □.

Uses: Lan 2008, Proposition 1.4.3.3: M_H ≅ M^rat_H. Kottwitz 1992, §§5–8: points over finite fields and complex points are described with the quasi-isogeny moduli. Liu–Tian–Xiao–Zhang–Zhu, Definition 3.5.4: the CM moduli T¹_p is a quasi-isogeny moduli problem.

Acceptance: For H = U^□(n) this is M^rat_n (Lan Remark 1.4.2.6). Kottwitz §5's set-valued functor is the iso-class functor of M^rat_{K^p} for □ = {p}.

Direct prerequisites: Within this roadmap: M1/prime-to-box-quasi-isogeny; M1/pel-abelian-scheme; M1/level-structure; M0/rational-pel-datum. 

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.4.2.4, pp. 156–157: “The isomorphisms (A, λ, i, [α̂]H) ∼Z(□)-isog. (A′, λ′, i′, [α̂′]H) of Mrat_H(S) are given by Z×(□)-isogenies f : A → A′” (isogeny morphisms). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 390: “Two quadruples (A, λ, i, η̄) and (A′, λ′, i′, η̄′) are said to be isomorphic if there is a prime-to-p isogeny from A to A′, commuting with the action of O_B, carrying η̄ into η̄′, and carrying λ into a scalar multiple of λ′” (Kottwitz's equivalence).

### The characteristic-zero adelic moduli problem

Declaration: **TauCeti.PEL.PELModuli.adelicModuli**. Node: PELModuli:M1/char-zero-adelic-moduli. Kind: definition.

For K ⊂ G(𝔸_f) open compact and an F₀-scheme S (characteristic zero), M^ad_K(S) is the groupoid of quadruples (A, λ, i, η̄): A an abelian scheme over S, λ a polarization up to ℚ_{>0}^× (a ℚ^×-polarization), i : B → End_S(A) ⊗ ℚ satisfying the Rosati condition, Lie_{A/S} satisfying the determinant condition, and η̄ a π₁-invariant K-orbit of B ⊗ 𝔸_f-linear isomorphisms η : V ⊗ 𝔸_f ≅ V_f(A) sending ⟨·,·⟩ to an 𝔸_f^×-multiple of the λ-Weil pairing; morphisms are quasi-isogenies preserving these data. This is the all-primes variant: full level at every prime, including those dividing n·Disc·[L^#:L], is allowed only in characteristic zero. Over ℂ its points are Milne's quadruples in Theorem 8.17 (without the condition (**)).

Hypotheses: S an F₀-scheme; K ⊂ G(𝔸_f) open compact.

Proof or construction:

1. Define as M1/rational-moduli-problem with □ = ∅ (all primes), over the generic fibre where all Tate modules are lisse.
2. Compare with Milne ISV Theorem 8.17: over ℂ condition (**) selects the components attached to V itself (M3/complex-points).

API:

- `PELModuli.adelicModuli` (constructor): M^ad_K over F₀-schemes with full adelic level K ⊂ G(𝔸_f).
- `PELModuli.adelicModuli.ofRational` (compatibility): For K = H × ∏_{p ∈ □} K_p with K_p the stabilizer of L ⊗ ℤ_p, the generic fibre of M^rat_H maps to M^ad_K (fully faithfully; essentially surjective by M1/change-of-lattice-and-primes).
- `PELModuli.adelicModuli.hecke` (functoriality): Right action of G(𝔸_f) on the tower {M^ad_K}.
- `PELModuli.adelicModuli.complexPoints` (characterisation): M^ad_K(ℂ) is the set of Milne's quadruples ((A, i), s, ηK) with Lie condition.

Unit tests:

- `adelicModuli_full_level_p` (characterisation): For the Siegel datum, K = K(p^m)·GSp_{2g}(Ẑ^p) (full level p^m) is allowed in M^ad_K over ℚ.
- `adelicModuli_not_integral` (non-example): There is no object of M_H over 𝔽_p carrying a full level-p trivialization (L/pL)_{𝔽_p} ≅ A[p] for ordinary A: A[p] is not étale, so full p-level is a characteristic-zero notion.
- `adelicModuli_zero` (degenerate): For L = 0 (G = G_m) and K ⊂ Ẑ^×, M^ad_K(ℂ) = ℚ_{>0}^× \ 𝔸_f^× / K ≅ Ẑ^×/K, a finite set.

Uses: Milne ISV, Theorem 8.17: complex points of PEL Shimura varieties. PELModuli:M3/complex-points: the complex uniformization is stated for M^ad_K. HilbertModularVarietiesAndShimuraCurves:H4: characteristic-zero full p-level trivializations (RS-23: not transported to characteristic p).

Acceptance: For the Siegel datum and K = K(N), M^ad_K over ℚ is the moduli of principally polarized abelian schemes with full level N up to isogeny, equivalently (by M1/iso-isogeny-comparison) up to isomorphism with L = ℤ^{2g}.

Direct prerequisites: Within this roadmap: M1/rational-moduli-problem; M0/rational-pel-datum. Other roadmaps and libraries: mathlib:IsDedekindDomain.FiniteAdeleRing.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) (James S. Milne), Theorem 8.17, p. 88: “Then Sh_K(G,X)(C) classifies the isomorphism classes of quadruples ((A, i), s, ηK), where A is a complex abelian variety” (char-zero moduli description). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §8, p. 398: “We consider the set of complex points S_{K^p}(C) of S_{K^p} relative to the map O_E ⊗ Z_(p) → C induced by the inclusion E ⊂ C.” (complex points of the p-integral problem).

### M_H ≅ M^rat_H

Declaration: **TauCeti.PEL.isoIsogenyComparison**. Node: PELModuli:M1/iso-isogeny-comparison. Kind: theorem.

For H ⊂ G(Ẑ^□) open compact, the canonical morphism M_H → M^rat_H, (A, λ, i, α_H) ↦ (A, λ, i, [α̂]_H) (Construction 1.4.3.1), is an isomorphism of fibred categories: for every S it is an equivalence M_H(S) → M^rat_H(S).

Hypotheses: □ good; H ⊂ G(Ẑ^□).

Proof or construction:

1. Reduce to S connected with a geometric point s̄ (decompose into components).
2. Full faithfulness: a ℤ_(□)^×-isogeny respecting the integral level structures preserves T^□ and hence is an isomorphism (rank of kernel prime to □ and trivial on Tate modules).
3. Essential surjectivity: given (A, λ, i, [α̂]_H), find a ℤ_(□)^×-isogeny f with V^□(f) ∘ α̂ (L ⊗ Ẑ^□) = T^□A₁ (Lan Corollary 1.3.5.4), then rescale λ by r ∈ ℤ_(□),>0^× to make it a polarization with the right multiplier; the rational structure then comes from an integral one (M1/level-structure integrality criterion).

Acceptance: Siegel g = 1: every elliptic curve with rational level structure up to prime-to-□ isogeny has a unique representative with integral level structure.

Direct prerequisites: Within this roadmap: M1/moduli-problem; M1/rational-moduli-problem; M1/level-structure; M1/prime-to-box-quasi-isogeny. 

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Proposition 1.4.3.3, p. 159: “The map (1.4.3.2) is an isomorphism.” (statement). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.4.3.4, p. 159: “this only requires the map (1.4.3.2) to induce equivalences of categories MH(S) → Mrat_H(S) for each S.” (meaning).

### Changes of order, lattice, polarization type and good primes

Declaration: **TauCeti.PEL.changeOfLatticeAndPrimes**. Node: PELModuli:M1/change-of-lattice-and-primes. Kind: theorem.

(1) If O, O' are *-orders and L, L' PEL-type lattices with O ⊗ ℤ_(□) ≅ O' ⊗ ℤ_(□) and (L ⊗ ℤ_(□), ⟨·,·⟩) ≅ (L' ⊗ ℤ_(□), ⟨·,·⟩') compatibly, so that □ is good for both, then M_H ≅ M'_H over S₀; in particular O may be replaced by a maximal order containing it and L by its O-span (Lan Corollary 1.4.3.7, Remark 1.4.3.8). (2) For sets □₁, □₂ of good primes with □ = □₁ ∩ □₂ and H = H_i × ∏_{p ∈ □_i ∖ □} G(ℤ_p), if for every p ∈ □₁ ∪ □₂ there is a unique isomorphism class of self-dual O ⊗ ℤ_p-modules of each multi-rank, then M_H ≅ M_{H_i} ×_{S_i} S₀ (Lan Proposition 1.4.4.1); the hypothesis holds unless B has a type D factor (M0/self-dual-lattice-classification), and for type D the comparison with a smaller set of primes can fail (Lan Remark 1.4.4.3). (3) Over F₀, the generic fibre of M^rat_H is identified with the characteristic-zero problem M^ad_K for K = H × ∏_{p ∈ □} Stab(L ⊗ ℤ_p) (same uniqueness hypothesis).

Hypotheses: □, □₁, □₂ sets of good primes; uniqueness of self-dual classes per multi-rank at the primes involved for (2), (3).

Proof or construction:

1. (1) follows from M1/iso-isogeny-comparison and the dependence of M^rat_H only on the ℤ_(□)-data (Lan Remark 1.4.2.7).
2. (2) At p ∈ □₁ ∖ □ the λ-Weil pairing on T_pA gives a self-dual O ⊗ ℤ_p-lattice of the same multi-rank as L ⊗ ℤ_p, hence symplectically isomorphic to it; so the extra liftability condition is automatic (Lan proof of Proposition 1.4.4.1).
3. (3) Same argument at all p ∈ □ in characteristic zero (Kottwitz §8 treatment of the place p via Lemma 7.2).

Acceptance: For the Siegel datum (type C, no type D factor) the change of good primes in (2) holds unconditionally.

Direct prerequisites: Within this roadmap: M1/iso-isogeny-comparison; M1/char-zero-adelic-moduli; M0/self-dual-lattice-classification; M0/good-primes. 

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Corollary 1.4.3.7, p. 163: “Then the two moduli problems MH and M′H over S = Spec(O_{F0,(□)}) defined respectively by them are isomorphic to each other.” (change of order and lattice). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Proposition 1.4.4.1, p. 166: “Suppose there is a unique isomorphism class of self-dual O ⊗ Zp-modules of each multi-rank for any p ∈ □1 ∪ □2. Then the two canonical morphisms MH → MH1 ×S1 S0 and MH → MH2 ×S2 S0 are canonical isomorphisms.” (change of good primes). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.4.4.3, p. 168: “or equivalently that MH → MH1 ×_{Spec(Z(p))} Spec(Q), might not necessarily be true!” (type D failure).

### M_H is an fppf stack

Declaration: **TauCeti.PEL.effectiveDescent**. Node: PELModuli:M1/effective-descent. Kind: theorem.

For every S₀-scheme S and fppf covering {S_j → S}, the fibred category M_H satisfies effective descent: (a) for objects x, y over S, the presheaf Isom(x, y) on S-schemes is an fppf sheaf; (b) every descent datum of objects relative to the covering is effective. The same holds for M^rat_H. The presheaf of isomorphism classes is not assumed (and in general fails) to be a sheaf.

Hypotheses: S₀-schemes with the fppf topology.

Proof or construction:

1. Morphisms: homomorphisms of abelian schemes are morphisms of schemes, which descend (fppf subcanonicity; mathlib AlgebraicGeometry.Scheme.fppfTopology), and the conditions on λ, i, α are equalities of morphisms.
2. Objects: λ gives the relatively ample invertible sheaf L_λ = (1, λ)^*P_A (Poincaré sheaf, A2), which carries a descent datum; effective descent of quasi-projective schemes with ample descent data (Tau Ceti ModularCurves layer 0E, R09.3 fpqc descent of quasi-coherent modules) descends A, and the group law, λ, i and α_H descend as morphisms.
3. Package as mathlib CategoryTheory.Pseudofunctor.IsStack for the associated pseudofunctor (stacks on D0's carrier per RS-27: R09.4 imports D0 stacks).

Acceptance: For the Siegel datum with g = 1 this recovers descent of elliptic curves with level structure (ModularCurves 0E/1E).

Direct prerequisites: Within this roadmap: M1/moduli-problem; M1/rational-moduli-problem. Other roadmaps and libraries: mathlib:AlgebraicGeometry.Scheme.fppfTopology; mathlib:CategoryTheory.Pseudofunctor.IsStack; AlgebraicModuliForArithmeticGeometry:R09.3; AlgebraicModuliForArithmeticGeometry:R09.4; tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out; AbelianSchemesAndArithmeticModuli:A2.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Appendix A.5 and §1.4.1 (Remark 1.4.1.7), p. 151: “For readers not familiar with the language of category fibred in groupoids, they can pretend that the moduli problem Mn is given by the association S ↦ MH(S) := {tuples (A, λ, i, αH)}/∼isom.” (iso classes versus fibred category). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 391: “For any projective abelian scheme A over a locally noetherian scheme S the functor T ↦ End(A_T) on the category of locally noetherian S-schemes T is representable” (polarized abelian schemes are projective, enabling descent and Hom schemes).

### Level change and Hecke action on the PEL tower

Declaration: **TauCeti.PEL.PELModuli.forgetLevel**. Node: PELModuli:M1/hecke-action. Kind: construction.

For open compact H' ⊂ H in G(𝔸^{∞,□}) there is a forgetful morphism M^rat_{H'} → M^rat_H, [α̂]_{H'} ↦ [α̂]_H, and for g ∈ G(𝔸^{∞,□}) with H' ⊂ H ∩ gHg⁻¹ a morphism [g] : M^rat_{H'} → M^rat_H, (A, λ, i, [α̂]_{H'}) ↦ (A, λ, i, [α̂ ∘ g]_H). These define a right action of G(𝔸^{∞,□}) on the tower M^□ = lim_H M^rat_H and Hecke correspondences M^rat_H ← M^rat_{H ∩ gHg⁻¹} → M^rat_H. Through M1/iso-isogeny-comparison they act on {M_H}.

Hypotheses: H, H' open compact in G(𝔸^{∞,□}).

Proof or construction:

1. Define the morphisms on objects and check compatibility with ℤ_(□)^×-isogenies (Lan Remark 1.4.3.10).
2. Composition law [g][g'] = [g'g] in the right-action convention (H ∩ gHg⁻¹ rather than g⁻¹Hg, Lan Remark 1.4.3.10).
3. Hecke correspondence: the two maps from M^rat_{H ∩ gHg⁻¹} (Kottwitz §6); finiteness and étaleness are proved after representability (M6/level-forgetting-maps).

API:

- `PELModuli.forgetLevel` (constructor): M^rat_{H'} → M^rat_H for H' ⊂ H.
- `PELModuli.heckeTranslate` (constructor): [g] : M^rat_{H'} → M^rat_H for H' ⊂ H ∩ gHg⁻¹.
- `PELModuli.heckeTranslate_comp` (functoriality): [g] ∘ [g'] = [g'g] (right action), [1] = forgetLevel.
- `PELModuli.heckeTranslate_central` (simp): For g in the centre of G(𝔸^{∞,□}) with g ∈ H, [g] equals forgetLevel up to canonical isomorphism.
- `PELModuli.heckeCorrespondence` (constructor): The span M^rat_H ← M^rat_{H ∩ gHg⁻¹} → M^rat_H.
- `PELModuli.heckeTranslate_integral` (compatibility): Under M_H ≅ M^rat_H the action preserves integral level structures for g ∈ G(Ẑ^□).

Unit tests:

- `heckeTranslate_id` (degenerate): [1] : M^rat_H → M^rat_H is the identity.
- `heckeTranslate_siegel_scalar` (computation): For the Siegel datum and g = ℓ·1 (ℓ ∉ □), [g] sends (A, λ, [α̂]) to (A, λ, [ℓα̂]) ≅ (A, λ, [α̂]) via the isogeny [ℓ] with r = ℓ⁻².
- `heckeTranslate_not_left` (non-example): With a left-action convention (α̂ ↦ g ∘ α̂) the map is not defined (g ∈ G(𝔸^{∞,□}) does not act on V^□A); only precomposition α̂ ∘ g is meaningful.

Uses: Kottwitz 1992, §6: Hecke correspondences on S_{K^p} and λ-adic sheaves. AutomorphicGaloisRepresentationsPartII:AG2.1a: commuting Galois and Hecke actions on the étale cohomology of PEL varieties. PELModuli:M4/canonical-model-identification: compatibility of canonical models with Hecke translations.

Acceptance: g central in H acts trivially on M^rat_H. For the Siegel datum and g = diag(1, …, 1, ℓ, …, ℓ) the correspondence parametrizes ℓ-isogenies of a fixed type.

Direct prerequisites: Within this roadmap: M1/rational-moduli-problem; M1/level-structure. 

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.4.3.10, p. 164: “there is a natural right action of elements g ∈ G(A∞,□) on M□ defined by sending a representative (A, λ, i, α̂) to (A, λ, i, α̂ ◦ g).” (action). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §6, p. 392: “For g ∈ G(A_f^p) there is an isomorphism S_{K^p} → S_{g^{−1}K^p g} sending (A, λ, i, η̄) to (A, λ, i, η̄g).” (Kottwitz's Hecke isomorphisms).

### Morphisms of PEL data and the forgetful morphism to Siegel moduli

Declaration: **TauCeti.PEL.PELDatum.Hom**. Node: PELModuli:M1/functoriality-in-data. Kind: construction.

A morphism of integral PEL data (O, L) → (O', L') consists of a *-homomorphism O' → O (or an inclusion of orders) and an isometric O'-linear identification L ≅ L' compatible with h; it induces a morphism of moduli problems. In particular forgetting i defines the Siegel morphism M_H → A_{g, D, H^S} to the Siegel moduli problem of the underlying symplectic lattice (L, ⟨·,·⟩) of type D, with H^S ⊂ GSp(L ⊗ Ẑ^□) containing the image of H; it is relatively representable by finite unramified morphisms after representability of End-schemes. Products of data give products of moduli problems over the compositum of reflex fields.

Hypotheses: integral PEL data and compatible levels.

Proof or construction:

1. Define the induced functor on objects (A, λ, i, α) ↦ (A, λ, i ∘ φ, α) and on morphisms.
2. Relative representability of forgetting i: Hom_S(A, A) for projective A is representable by a disjoint union of projective schemes (Kottwitz §5), and the O-structure is a closed condition inside a finite product of copies (M2/isom-scheme).

API:

- `PELDatum.Hom` (structure): Morphisms of integral PEL data.
- `PELModuli.mapOfDatum` (functoriality): The induced morphism of moduli problems, with map_id and map_comp.
- `PELModuli.toSiegel` (constructor): Forgetful morphism M_H → A_{g,D,H^S}.
- `PELModuli.toSiegel_fiber` (characterisation): The fibre over (A, λ, α) is the sheaf of O-structures i compatible with λ, α and the Lie condition.
- `PELModuli.prod` (constructor): M_{H₁}(data₁) ×_{S₀} M_{H₂}(data₂) ≅ M_{H₁ ×_{G_m} H₂}(data₁ ⊕ data₂) when multipliers are matched.

Unit tests:

- `mapOfDatum_id` (degenerate): The identity morphism of data induces the identity of M_H.
- `toSiegel_g1` (computation): For B = K imaginary quadratic, V = K with signature (1, 0), toSiegel lands in the genus-one Siegel problem and its image is the CM locus of curves with CM by O_K (finitely many j).
- `toSiegel_not_injective_on_objects` (non-example): toSiegel is not injective on isomorphism classes in general: for O = ℤ[i] acting on E × E with CM, the two O-structures i and i ∘ c can give non-isomorphic objects with the same image.

Uses: Kottwitz 1992, §5: representability is reduced to Mumford's moduli via the forgetful map. ShimuraCompactifications:C5: quasi-projectivity of the open PEL moduli via the Siegel case. PELModuli:M4/canonical-model-identification: compatibility of canonical models with morphisms of PEL data.

Acceptance: The PEL datum of a CM field K with V = K (rank 1) maps to the Siegel datum of dimension [K⁺ : ℚ]. Forgetting i on a Picard datum gives a map to the genus-3 Siegel moduli problem.

Direct prerequisites: Within this roadmap: M1/moduli-problem; M0/similitude-group. 

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 391: “By forgetting the homomorphism i: O_B → End(A) we get a morphism from our moduli problem to one considered by Mumford, and therefore it is enough to show that our moduli problem is relatively representable over his.” (forgetful morphism).

Dependencies of M1: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A2, AbelianSchemesAndArithmeticModuli:A3, AbelianSchemesAndArithmeticModuli:A4, AlgebraicModuliForArithmeticGeometry:R09.3, AlgebraicModuliForArithmeticGeometry:R09.4, PELModuli:M0, tauceti:TauCetiRoadmap.

Coverage of M1: **planned**. Remaining refinements: Lan's Corollary 1.3.5.4 (prime-to-□ isogeny making a rational level structure integral) and Corollary 1.3.6.7 (liftability at one point) are proof steps of M1/iso-isogeny-comparison and M1/principal-level-structure; promote them to lemma nodes at lemma level.

Acceptance tests for M1: (Prime-to-□ quasi-isogenies and ℤ_(□)^×-polarizations) [n] is a prime-to-□ isogeny iff n is prime to □. (Polarized abelian scheme with O-structure satisfying the Kottwitz condition) For the Siegel datum a PEL triple is a ℤ_(□)^×-polarized abelian scheme of relative dimension g (i is the structure map ℤ → End). (O_F-abelian schemes, unitary O_F-abelian schemes and signature type) Signature type Φ (a CM type) for an elliptic curve with CM by O_K, K imaginary quadratic: Lie = Lie_τ of rank 1. (The étale sheaf of symplectic trivializations of the prime-to-□ Tate module) For the Siegel datum and S = Spec k, the fibre is the set of symplectic bases of T^□A up to the multiplier, a GSp_{2g}(Ẑ^□)-torsor if nonempty. (Principal level-n structures with multiplier) For the principally polarized Siegel datum (L self-dual), α_n is a symplectic basis of A[n] relative to the Weil pairing and ν(α_n) is determined by α_n. (Integral and rational level-H structures) H = U^□(n): integral level-H = principal level-n. (The PEL moduli problem M_H (isomorphism classes)) Siegel datum, □ = primes not dividing n: M_n is the moduli of principally polarized abelian schemes of dimension g with full symplectic level n and μ_n-trivialization over ℤ[1/n]. (The prime-to-□ quasi-isogeny moduli problem M^rat_H) For H = U^□(n) this is M^rat_n (Lan Remark 1.4.2.6). (The characteristic-zero adelic moduli problem) For the Siegel datum and K = K(N), M^ad_K over ℚ is the moduli of principally polarized abelian schemes with full level N up to isogeny, equivalently (by M1/iso-isogeny-comparison) up to isomorphism with L = ℤ^{2g}. (M_H ≅ M^rat_H) Siegel g = 1: every elliptic curve with rational level structure up to prime-to-□ isogeny has a unique representative with integral level structure. (Changes of order, lattice, polarization type and good primes) For the Siegel datum (type C, no type D factor) the change of good primes in (2) holds unconditionally. (M_H is an fppf stack) For the Siegel datum with g = 1 this recovers descent of elliptic curves with level structure (ModularCurves 0E/1E). (Level change and Hecke action on the PEL tower) g central in H acts trivially on M^rat_H. (Morphisms of PEL data and the forgetful morphism to Siegel moduli) The PEL datum of a CM field K with V = K (rank 1) maps to the Siegel datum of dimension [K⁺ : ℚ].

<a id="m2"></a>

## M2. Representability and smoothness at good level

M2 verifies the hypotheses of Artin's criterion for M_H (RS-27: the criterion itself is owned by AlgebraicModuliForArithmeticGeometry A0-extension; its PEL verification is owned here): the stack property from M1, finite presentation, finiteness and unramifiedness of Isom (Hilbert schemes, Mumford–Serre rigidity and Néron models), prorepresentability of local deformations (Schlessinger), and effectivity (Grothendieck existence). At good primes the deformation functors are formally smooth by Grothendieck–Messing and the flag-variety description; each clause of goodness is used separately (unramified order, invertible discriminant and polarization defect, p ≠ 2 for type D, no level at p). The result is a smooth separated algebraic stack of finite type over S₀, an algebraic space at neat level with its universal abelian family (RS-23 owner record for the family construction), with the Kodaira–Spencer isomorphism and relative dimension formula. Scheme representability and quasi-projectivity are not claimed here; they are ShimuraCompactifications C5. M2 also proves properness when End_B(V) is a division algebra (Kottwitz), the LTXZZ deformation and kernel-rank lemmas for unitary O_F-abelian schemes, and records Wedhorn's ordinariness criterion used by Bijakowski–Pilloni–Stroh.

Planets: Serre–Mumford rigidity; Formal smoothness at good primes; Representability of PEL moduli; Universal PEL abelian scheme; Kodaira–Spencer isomorphism.

### Rigidity of polarized automorphisms (Mumford–Serre)

Declaration: **TauCeti.PEL.rigidity**. Node: PELModuli:M2/rigidity. Kind: theorem.

Let A be an abelian scheme over a scheme S, λ : A → A^∨ a polarization and n ≥ 3 an integer invertible on S. Then the restriction homomorphism Aut_S(A, λ) := {f ∈ Aut_S(A) : f^∨ ∘ λ ∘ f = λ} → Aut_S(A[n]) is injective, and the image of any f acts on the Tate modules through a subgroup of the roots of unity. In particular an automorphism of (A, λ) acting trivially on A[n] is the identity (for S = Spec k with char k ∤ n this is Serre's rigidity).

Hypotheses: λ a polarization; n ≥ 3 invertible on S.

Proof or construction:

1. Reduce to S the spectrum of an algebraically closed field: an endomorphism of an abelian scheme that vanishes at all geometric fibres vanishes (rigidity, AbelianSchemesAndArithmeticModuli A1).
2. Over a field, Aut(A, λ) is finite (AbelianSchemesAndArithmeticModuli:A6/automorphisms-of-polarized-abelian-varieties), so f has finite order and its eigenvalues on T_ℓA are roots of unity.
3. If f ≡ 1 mod n with n ≥ 3, each eigenvalue ζ satisfies ζ ≡ 1 mod n in an algebraic integer ring; Serre's lemma forces ζ = 1, and since f is semisimple of finite order, f = 1 (Mumford, Abelian Varieties §21 Theorem 5, as quoted by Lan Lemma 1.4.1.10).

Acceptance: n = 2 fails: [−1] is a nontrivial automorphism of (A, λ) acting trivially on A[2]. For an elliptic curve with j = 1728 over ℂ, [i] acts on E[3] nontrivially.

Direct prerequisites: Other roadmaps and libraries: AbelianSchemesAndArithmeticModuli:A6/automorphisms-of-polarized-abelian-varieties; AbelianSchemesAndArithmeticModuli:A1; tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.mulBy.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Lemma 1.4.1.10, p. 152: “For any n ≥ 3, and any polarization λ : A → A∨ on A, the restriction homomorphism AutS(A, λ) := {f ∈ AutS(A) : f∨ ◦ λ ◦ f = λ} → AutS(A[n]) is injective, and its image acts via a subgroup of the roots of unity.” (statement (citing Mumford §21 Thm 5)). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.4.1.9, p. 152: “the usual Serre’s lemma that no nontrivial root of unity can be congruent to 1 mod n if n ≥ 3” (Serre's lemma).

### Neat open compact subgroups of G(Ẑ^□)

Declaration: **TauCeti.PEL.IsNeatElement**. Node: PELModuli:M2/neat-level. Kind: definition.

Embed G(Ẑ^□) ⊂ GL(L ⊗ Ẑ^□) × G_m(Ẑ^□) (or use any faithful representation). For g = (g_p)_{p ∉ □} let Γ_p ⊂ ℚ̄_p^× be the subgroup generated by the eigenvalues of g_p; fixing ℚ̄ ↪ ℚ̄_p, (ℚ̄^× ∩ Γ_p)_tors is independent of the embedding. g is neat if ⋂_{p ∉ □} (ℚ̄^× ∩ Γ_p)_tors = {1}, and an open compact H ⊂ G(Ẑ^□) is neat if all its elements are. For □ = ∅ this is Pink's neatness of ShimuraData:D5/neat-level; for unitary groups U(V)(𝔸^{∞,□}_{F⁺}) the same definition with places of F⁺ (LTXZZ Definition 3.1.11(1)). U^□(n) is neat for n ≥ 3 prime to □.

Hypotheses: H ⊂ G(Ẑ^□) open compact.

Proof or construction:

1. Define the eigenvalue groups factorwise and show independence of the faithful representation and of ℚ̄ ↪ ℚ̄_p (Pink 0.6, as in Lan §1.4.1).
2. U^□(n), n ≥ 3: an element ≡ 1 mod n has eigenvalues ≡ 1 mod n; Serre's lemma excludes nontrivial torsion (Lan Remark 1.4.1.9).
3. Compare with ShimuraData:D5/neat-level when □ = ∅ and G is connected.

API:

- `IsNeatElement` (data): The eigenvalue-torsion condition on g ∈ G(Ẑ^□).
- `IsNeat` (data): Every element of H is neat.
- `IsNeat.mono` (other): Open compact subgroups of neat groups are neat.
- `IsNeat.conj` (other): gHg⁻¹ is neat iff H is (for g ∈ G(𝔸^{∞,□})).
- `isNeat_principalCongruence` (example): U^□(n) is neat for n ≥ 3 prime to □.
- `IsNeat.repr_indep` (characterisation): Independent of the faithful representation used.
- `IsNeat.shimuraData` (compatibility): For □ = ∅ and G connected, agrees with ShimuraData:D5/neat-level.

Unit tests:

- `isNeat_U3` (computation): For the Siegel datum with □ ∌ 3, U^□(3) is neat.
- `not_isNeat_minus_one` (non-example): Any H containing −1 (e.g. G(Ẑ^□) itself, or U^□(2) for the Siegel datum) is not neat: −1 has eigenvalue −1, a nontrivial torsion element of ℚ̄^×.
- `isNeat_mono` (degenerate): Every open compact subgroup of a neat subgroup is neat; in particular U^□(nm) ⊂ U^□(n) is neat for n ≥ 3 and m ≥ 1 prime to □.

Uses: Lan 2008, Corollary 1.4.1.11: objects of M_H have no nontrivial automorphisms when H is neat. Liu–Tian–Xiao–Zhang–Zhu, Definition 3.5.4: T¹_p(W₀, K^p₀) is represented by a finite étale scheme when K^p₀ is neat. PELModuli:M6/arbitrary-level-stack: presentations M_H ≅ [M_{H'}/(H/H')] with H' neat normal.

Acceptance: U^□(3) is neat; GL₂(Ẑ) is not (it contains −1).

Direct prerequisites: Within this roadmap: M0/similitude-group. Other roadmaps and libraries: ShimuraData:D5/neat; ShimuraData:D5/neat-level.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.4.1.8, p. 152: “We say that g = (gp) is neat if ∩_{p∉□} (Q̄× ∩ Γp)tors = {1}. We say that an open compact subgroup H of G(Ẑ□) is neat if all its elements are neat.” (definition). [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Definition 3.1.11 (1), p. 25 (arXiv v3): “For a nonarchimedean place v of F+ and an element gv ∈ U(V)(F+_v), let Γ(gv) be the subgroup of (F̄+_v)× generated by the eigenvalues of gv (regarded as an element in GL(V)(Fv)), whose torsion subgroup Γ(gv)tors lies in Q̄×.” (unitary-group variant).

### Objects of M_H have no automorphisms at neat level

Declaration: **TauCeti.PEL.noAutomorphismsAtNeatLevel**. Node: PELModuli:M2/no-automorphisms-at-neat-level. Kind: theorem.

If H ⊂ G(Ẑ^□) is neat, every object (A, λ, i, α_H) of M_H(S), for any S₀-scheme S, has trivial automorphism group; hence M_H(S) is equivalent to a set and the iso-class functor of M_H is the functor represented by the stack.

Hypotheses: H neat.

Proof or construction:

1. Reduce to geometric points s̄ (an automorphism trivial on all geometric fibres is trivial, rigidity A1).
2. By M2/rigidity, Aut(A_s̄, λ_s̄, i_s̄) injects into Aut_{O ⊗ Ẑ^□}(T^□A_s̄) with image acting through roots of unity.
3. An automorphism preserving α_H lies in a conjugate of H; its eigenvalues are roots of unity in every Γ_p, so neatness forces it to be 1 (Lan proof of Corollary 1.4.1.11).

Acceptance: For the Siegel datum and n ≥ 3, M_n(S) is a set for every S.

Direct prerequisites: Within this roadmap: M2/rigidity; M2/neat-level; M1/moduli-problem. 

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Corollary 1.4.1.11, p. 152: “Then (A, λ, i, αH) has no nontrivial automorphism if H is neat (defined as in Definition 1.4.1.8).” (statement).

### Isom schemes of PEL objects are finite and unramified

Declaration: **TauCeti.PEL.isomScheme**. Node: PELModuli:M2/isom-scheme. Kind: theorem.

Let ξ, η be objects of M_H over a locally noetherian S₀-scheme U. The sheaf Isom_U(ξ, η) on U-schemes is representable by a scheme finite and unramified over U. Consequently the diagonal M_H → M_H ×_{S₀} M_H is representable, finite and unramified, and M_H is separated once algebraic. Similarly Hom_U(A, A') for polarized (hence projective) abelian schemes is representable by a disjoint union of projective U-schemes.

Hypotheses: U locally noetherian over S₀.

Proof or construction:

1. Representability of Hom_U(A, A') through Hilbert schemes of graphs, using that polarized abelian schemes are projective locally on U (L_λ = (1, λ)^*P relatively ample) (AlgebraicModuliForArithmeticGeometry R09.2; Kottwitz §5).
2. The conditions on λ, i, α_H cut out closed subschemes; Isom is quasi-finite by M2/rigidity applied after adjoining level (Lan §2.3.3, condition 3).
3. Properness by the valuative criterion over discrete valuation rings, extending isomorphisms of abelian schemes over the generic point (Néron models, NeronModelsAndSemistableAbelianVarieties R11.1); proper + quasi-finite = finite.
4. Unramified: an automorphism deforming the identity infinitesimally is trivial (rigidity of homomorphisms of abelian schemes).

Acceptance: For neat H, Isom_U(ξ, ξ) = U. For the Siegel datum with H = GSp_{2g}(Ẑ), Isom(ξ, ξ) over a field contains [±1].

Direct prerequisites: Within this roadmap: M2/rigidity; M1/moduli-problem. Other roadmaps and libraries: AlgebraicModuliForArithmeticGeometry:R09.2; NeronModelsAndSemistableAbelianVarieties:R11.1; AbelianSchemesAndArithmeticModuli:A2.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), §2.3.3, p. 265: “the functor IsomU(ξ, η) is representable by an algebraic space by the general theory of Hilbert schemes and by [9, Cor. 6.2]. Moreover, it is quasi-finite by Lemma 1.4.1.10.” (representability and quasi-finiteness). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 2.3.3.2, p. 266: “Note that we have actually shown that the diagonal map ∆ : MH → MH ×S0 MH is finite. Hence MH is separated” (finite diagonal).

### Local deformation functors are prorepresentable

Declaration: **TauCeti.PEL.deformationProrepresentable**. Node: PELModuli:M2/deformation-prorepresentable. Kind: theorem.

Let k be a field over S₀ (perfect, or more generally as in Lan §2.2), ξ₀ = (A₀, λ₀, i₀, α_{H,0}) an object of M_H(k), and Def_{ξ₀} the functor on complete local noetherian W(k)-type O_{S₀}-algebras with residue field k sending R to the set of deformations of ξ₀ over R. Def_{A₀}, Def_{(A₀,λ₀)}, Def_{(A₀,λ₀,i₀)} and Def_{ξ₀} are prorepresentable, and the forgetful morphisms are relatively representable by closed immersions (for λ and i) and isomorphisms (for prime-to-□ level).

Hypotheses: ξ₀ ∈ M_H(k).

Proof or construction:

1. Schlessinger's criterion (Lan Theorem 2.2.1.4) for Def_{A₀}: tangent space H¹(A₀, T_{A₀}) finite and the gluing conditions from the obstruction theory of smooth schemes (Lan §2.1.2).
2. Rigidity of structures (Lan §2.2.2): deformations of λ and i are unique if they exist, and their existence is a closed condition (Proposition 2.2.2.5); prime-to-□ level structures deform uniquely because A[n] is étale.
3. Assemble: Def_{ξ₀} ⊂ Def_{(A₀,λ₀,i₀)} ⊂ Def_{(A₀,λ₀)} ⊂ Def_{A₀} (Lan Propositions 2.2.3.4, 2.2.3.7, 2.2.3.9, Theorem 2.2.3.10).

Acceptance: For an elliptic curve E₀ over k, Def_{E₀} = Def_{(E₀,λ₀)} is prorepresented by W(k)[[t]] (ModularCurves 7D).

Direct prerequisites: Within this roadmap: M1/moduli-problem. Other roadmaps and libraries: AbelianSchemesAndArithmeticModuli:A4; AlgebraicModuliForArithmeticGeometry:R09.6; tauceti:TauCetiRoadmap/ModularCurves#7d-universal-deformations-of-elliptic-curves.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Theorem 2.2.3.10, p. 244: “The functor Def ξ0 = Def (A0,λ0,i0,αH,0) is prorepresentable.” (statement). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Theorem 2.2.1.4, p. 226: “A covariant functor F : C → (Sets) is prorepresentable” (Schlessinger's criterion).

### Formal smoothness of PEL deformations at good primes

Declaration: **TauCeti.PEL.formalSmoothness**. Node: PELModuli:M2/formal-smoothness. Kind: theorem.

Let □ be a set of good primes (p ∤ I_bad·Disc·[L^#:L] for p ∈ □, no level at p) and ξ₀ ∈ M_H(k) for a field k over S₀. Then Def_{ξ₀} is formally smooth: for every small surjection R̃ → R of artinian local O_{S₀}-algebras with residue field k, every deformation over R lifts to R̃. The tangent space is the space of O ⊗ k-compatible symmetric maps, of dimension equal to the relative dimension of M2/kodaira-spencer-dimension. The hypotheses are used separately: p ∤ Disc for the projectivity of O ⊗ k-modules and the determinant condition over nonreduced bases, p ≠ 2 in type D for the symmetric-form lifting, self-duality for the perfectness of the pairing on H^dR_1.

Hypotheses: □ a set of good primes; H ⊂ G(Ẑ^□).

Proof or construction:

1. By Grothendieck–Messing (AbelianSchemesAndArithmeticModuli A4, importing FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6) and Serre–Tate, deformations of (A, λ, i) over a PD thickening correspond to O-stable, λ-isotropic lifts of the Hodge filtration ω_{A^∨} ⊂ H^dR_1 satisfying the determinant condition.
2. The determinant condition at good primes identifies the space of such lifts with points of the flag variety G/P₀, formally smooth over the base (Lan Proposition 1.2.5.20, Corollary 1.2.5.23), using the classification of self-dual O ⊗ R-modules (M0/self-dual-lattice-classification) and I_bad for p = 2 (Lan Remark 1.2.2.3).
3. Polarizations: Def_{(A₀,λ₀)} is formally smooth (Lan Proposition 2.2.4.4); adding i (Proposition 2.2.4.11) and étale level (Theorem 2.2.4.16).

Acceptance: For the Siegel datum, Def_{(A₀,λ₀)} ≅ Spf W(k)[[t_{ij} : 1 ≤ i ≤ j ≤ g]] for principal λ₀. For a type D datum at p = 2 the argument fails (Lan Remark 1.2.2.3).

Direct prerequisites: Within this roadmap: M2/deformation-prorepresentable; M0/good-primes; M0/self-dual-lattice-classification; M0/determinant-condition-splitting. Other roadmaps and libraries: AbelianSchemesAndArithmeticModuli:A4; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6; mathlib:Algebra.FormallySmooth.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Theorem 2.2.4.16, p. 259: “The functor Def ξ0 = Def (A0,λ0,i0,αH,0) is formally smooth.” (statement). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.2.2.3, p. 60: “Let us explain why the case p = 2|Ibad has to be excluded” (type D at 2). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 391: “Then for sufficiently small K^p the scheme S_{K^p} is smooth over O_E ⊗ Z_(p). This can be proved using the deformation theory of Grothendieck-Messing” (smoothness via Grothendieck–Messing).

### Effectivity: formal PEL deformations algebraize

Declaration: **TauCeti.PEL.effectivity**. Node: PELModuli:M2/effectivity. Kind: theorem.

Let R be a complete local noetherian O_{S₀}-algebra with maximal ideal m, and {(A_i, λ_i, i_i, α_{H,i})} a compatible system of objects of M_H over R/m^{i+1}. Then there is a unique object (A, λ, i, α_H) over R inducing it. Hence the deformation functors of M2/deformation-prorepresentable are effectively prorepresentable.

Hypotheses: R complete local noetherian.

Proof or construction:

1. The sheaves L_i = (1, λ_i)^*P_{A_i} are relatively ample, so {(A_i, L_i)} algebraizes by Grothendieck's existence theorem (EGA III 5.4.5; Lan Theorem 2.3.1.2).
2. Morphisms between algebraizable formal schemes algebraize uniquely (EGA III 5.4.1; Lan Theorem 2.3.1.4), giving λ, i and the level structure; λ is a polarization because ampleness is detected on the closed fibre (Lan Proposition 2.3.2.1).

Acceptance: The universal formal deformation of an elliptic curve algebraizes to an elliptic curve over W(k)[[t]].

Direct prerequisites: Within this roadmap: M2/deformation-prorepresentable. Other roadmaps and libraries: AlgebraicModuliForArithmeticGeometry:A0-extension; AbelianSchemesAndArithmeticModuli:A2.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Proposition 2.3.2.1, p. 263: “All the three functors Def(A0,λ0), Def(A0,λ0,i0), and Def ξ = Def(A0,λ0,i0,αH,0) are effectively prorepresentable.” (statement). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), proof of Proposition 2.3.2.1, pp. 263–264: “Over each of the Ai, we may take Li = (IdAi, λi)∗PAi, which is relatively ample by definition of polarizations.” (use of the polarization).

### Representability and smoothness of PEL moduli at good primes

Declaration: **TauCeti.PEL.representability**. Node: PELModuli:M2/representability. Kind: theorem.

Let □ be a set of good primes, S₀ = Spec O_{F₀,(□)} and H ⊂ G(Ẑ^□) open compact. Then M_H is an algebraic stack over S₀ which is smooth, separated (finite diagonal) and of finite type; it is representable by an algebraic space (Deligne–Mumford with trivial inertia) when H is neat, and more generally whenever objects have no nontrivial automorphisms. The same holds for M^rat_H (M1/iso-isogeny-comparison). Scheme representability and quasi-projectivity over S₀ are not part of this theorem (ShimuraCompactifications C5; in characteristic zero M3/algebraization-of-components).

Hypotheses: □ good; H ⊂ G(Ẑ^□) open compact.

Proof or construction:

1. Verify Artin's criterion as packaged by AlgebraicModuliForArithmeticGeometry A0-extension (RS-27: the verification for PEL moduli is owned here): (1) M_H is an étale (indeed fppf) stack (M1/effective-descent); (2) M_H is limit-preserving / locally of finite presentation (objects are finitely presented); (3) Isom is representable, finite and unramified (M2/isom-scheme); (4) deformation functors are effectively prorepresentable (M2/deformation-prorepresentable, M2/effectivity); openness of versality and the remaining conditions by Lan Appendix B.3 (Theorems B.3.8, B.3.10, B.3.12) over the excellent Dedekind base S₀.
2. Smoothness from M2/formal-smoothness at closed points of finite type.
3. Finite type: quasi-compactness follows by bounding the Hilbert polynomial of (A, L_λ^{⊗3}) (Lan §1.4.1 statement; Kottwitz §5 uses Mumford's quasi-projective Siegel moduli and relative representability, M1/functoriality-in-data).
4. Algebraic space at neat level by M2/no-automorphisms-at-neat-level (trivial inertia).

Acceptance: Siegel datum, H = U(n), n ≥ 3: M_n is a smooth separated algebraic space of finite type over ℤ[1/n] of relative dimension g(g+1)/2. Siegel datum, H = GSp_{2g}(Ẑ): M_H is a smooth separated Deligne–Mumford stack over ℤ, not an algebraic space ([−1] is an automorphism).

Direct prerequisites: Within this roadmap: M1/effective-descent; M2/isom-scheme; M2/deformation-prorepresentable; M2/effectivity; M2/formal-smoothness; M2/no-automorphisms-at-neat-level; M1/iso-isogeny-comparison. Other roadmaps and libraries: AlgebraicModuliForArithmeticGeometry:A0-extension; AlgebraicModuliForArithmeticGeometry:R09.4; SchemeAndStackFoundations:SF.1/algebraic-space; mathlib:AlgebraicGeometry.Smooth; mathlib:AlgebraicGeometry.IsSeparated.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Theorem 1.4.1.12, p. 153: “The moduli problem MH is representable by a smooth separated algebraic stack of finite type over S0. It is representable by an algebraic space if the objects it parameterizes have no nontrivial automorphism, which is in particular the case when H is neat” (statement). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), §2.3.3, p. 265: “it suffices to verify the following conditions: 1. MH is a stack for the étale topology. 2. MH is locally of finite presentation.” (Artin criterion conditions). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.4.1.14, p. 154: “the MH is actually a quasi-projective scheme when H is neat. Therefore it is not necessary to argue that it is a scheme at this moment.” (quasi-projectivity is later (C5)).

### The universal PEL abelian scheme at neat level

Declaration: **TauCeti.PEL.PELModuli.universal**. Node: PELModuli:M2/universal-family. Kind: construction.

For H neat, let M_H be the representing algebraic space (M2/representability). The identity of M_H corresponds to the universal object (A^univ, λ^univ, i^univ, α_H^univ) over M_H: an abelian algebraic space A^univ → M_H (an abelian scheme after the scheme representability of C5, or étale-locally on M_H), with a ℤ_(□)^×-polarization, O-structure and level-H structure, such that every object over an S₀-scheme S is the pullback of the universal object along a unique morphism S → M_H. At non-neat H the universal object lives on the stack M_H.

Hypotheses: H neat (for the algebraic-space statement).

Proof or construction:

1. Yoneda: an algebraic space representing a fibred category in sets carries a universal object, obtained from the étale atlas and descent of the objects over it (M1/effective-descent).
2. Abelian scheme property: over an étale atlas U → M_H the pulled-back object is an abelian scheme; A^univ is the descended abelian algebraic space over M_H.
3. Base change: for S₀' → S₀, M_H ×_{S₀} S₀' represents the restricted problem and carries the pulled-back universal object.

API:

- `PELModuli.universal` (constructor): The universal object (A^univ, λ^univ, i^univ, α^univ) over M_H for neat H.
- `PELModuli.classify` (universal-property): For an object ξ over S, the unique morphism c_ξ : S → M_H with c_ξ^*(universal) ≅ ξ.
- `PELModuli.classify_pullback` (functoriality): c_{f^*ξ} = c_ξ ∘ f.
- `PELModuli.universal_baseChange` (functoriality): Compatible with base change S₀' → S₀.
- `PELModuli.universal_relDim` (other): A^univ has relative dimension dim_ℂ V₀ over M_H.
- `PELModuli.universal_lie` (other): Lie_{A^univ/M_H} satisfies the determinant condition.
- `PELModuli.universal_hecke` (functoriality): Hecke translates pull back universal objects to ℤ_(□)^×-isogenous universal objects.
- `PELModuli.universal_siegel` (compatibility): For the Siegel datum and g = 1, the universal object is the universal elliptic curve with full level of ModularCurves layer 5B.

Unit tests:

- `universal_g1` (compatibility): For the Siegel datum, g = 1, n ≥ 3, the universal object is the universal elliptic curve over Y(n) with its full level-n structure and Weil-pairing multiplier.
- `universal_classify_self` (characterisation): classify(universal) = id_{M_H}.
- `universal_nonneat` (non-example): For H = GSp_{2g}(Ẑ), there is no universal object over an algebraic space representing M_H: [−1] obstructs (the universal object exists only on the stack).
- `universal_zero` (degenerate): For L = 0 the universal abelian scheme is the zero scheme over M_H.

Uses: RS-23 owner record: M2 owns the construction of the universal abelian family on the fine moduli object. ArakelovGeometryAndAbelianHeights:R35.2: the Hodge bundle of the universal family (via M6's export). ShimuraCompactifications:C4: degenerations extend the universal family to the boundary. AutomorphicGaloisRepresentationsPartII:AG2.1a: local systems from the universal abelian scheme and its Kuga–Sato powers. AbelianVarietiesIsogenousToNoJacobian:C0: fine-level moduli with its universal polarized family (request to M2).

Acceptance: For the Siegel datum and g = 1, n ≥ 3, A^univ is the universal elliptic curve with full level n over Y(n) (ModularCurves layer 5B).

Direct prerequisites: Within this roadmap: M2/representability; M1/effective-descent. Other roadmaps and libraries: SchemeAndStackFoundations:SF.1/algebraic-space.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Proposition 2.3.4.2, p. 269: “Let S → MH be any morphism over S0, and let (A, λ, i, αH) be the tuple over S associated to the morphism by the universal property of MH.” (universal property). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 391: “For sufficiently small K^p this moduli problem is representable by a quasi-projective scheme S_{K^p} over O_E ⊗_Z Z_(p).” (representing object (quasi-projectivity proved later here)).

### Kodaira–Spencer isomorphism and the relative dimension formula

Declaration: **TauCeti.PEL.kodairaSpencerDimension**. Node: PELModuli:M2/kodaira-spencer-dimension. Kind: theorem.

Let (A, λ, i, α_H) be the object over S associated with S → M_H, with Ω¹_{S/S₀} locally free. The Kodaira–Spencer map KS : Lie^∨_{A/S} ⊗ Lie^∨_{A^∨/S} → Ω¹_{S/S₀} satisfies KS(λ^*(y) ⊗ z) = KS(λ^*(z) ⊗ y) and KS(i(b)^*(x) ⊗ y) = KS(x ⊗ (i(b)^∨)^*(y)), hence factors through the quotient KS_{(A,λ)/S} by these relations; S → M_H is étale iff it is flat and KS_{(A,λ)/S} ≅ Ω¹_{S/S₀}. Consequently M_H is smooth over S₀ of relative dimension rank KS_{(A,λ)}, which equals dim_ℂ (Sym-type quotient of V₀^∨ ⊗ V₀ᶜ^∨ by the O-relations): g(g+1)/2 for the Siegel datum of genus g, Σ_{τ ∈ Φ} p_τ q_τ for a unitary datum over a CM field with CM type Φ, and [F : ℚ] for the Hilbert datum.

Hypotheses: □ good.

Proof or construction:

1. Define KS from the Gauss–Manin connection on H^dR_1 (AbelianSchemesAndArithmeticModuli A4) and its Hodge filtration (Lan Definition 2.1.7.8).
2. The symmetry and O-relations come from lifting λ and i(b) to the first infinitesimal neighbourhood of the diagonal (Lan proof of Proposition 2.3.4.2, Proposition 2.1.3.2).
3. At closed points, KS is identified with the tangent space of the formally smooth deformation functor (Lan Corollaries 2.2.2.10, 2.2.4.13), giving the étaleness criterion.
4. Compute the rank from V₀ = ⊕ W_τ^{p_τ}: Siegel: Sym² of a g-dimensional space; unitary: ⊕_{τ∈Φ} Hom(V_τ⁺, V_τ⁻) of dimension p_τ q_τ.

Acceptance: Siegel g = 1: KS : ω^{⊗2} ≅ Ω¹_{Y(n)/ℤ[1/n]} (the classical Kodaira–Spencer isomorphism). Picard (2, 1): relative dimension 2.

Direct prerequisites: Within this roadmap: M2/representability; M2/formal-smoothness; M0/signatures. Other roadmaps and libraries: AbelianSchemesAndArithmeticModuli:A4.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Proposition 2.3.4.2, p. 269: “the Kodaira-Spencer map (defined as in Definition 2.1.7.8) KS = KS_{A/S/S0} : Lie∨_{A/S} ⊗_{OS} Lie∨_{A∨/S} → Ω1_{S/S0} satisfies KS(λ∗(y) ⊗ z) = KS(λ∗(z) ⊗ y)” (relations). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Proposition 2.3.4.2, p. 270: “Moreover, the morphism S → MH is étale if and only if it is flat and KS induces an isomorphism KS : KS(A,λ)/S → Ω1_{S/S0}.” (étaleness criterion).

### Properness when End_B(V) is a division algebra

Declaration: **TauCeti.PEL.propernessWhenDivision**. Node: PELModuli:M2/properness-when-division. Kind: theorem.

Let (B, *, V, ⟨·,·⟩, h) be a rational PEL datum with B simple such that C = End_B(V) is a division algebra (equivalently V is a simple B-module), □ a set of good primes and H neat. Then M_H is proper over S₀. In particular, for the rank-one unitary datum of a CM field F with signature a CM type Φ (C = F), M_H is finite étale over S₀ (relative dimension Σ p_τ q_τ = 0).

Hypotheses: End_B(V) a division algebra; □ good; H neat.

Proof or construction:

1. Valuative criterion over a DVR R with fraction field K: after a finite extension of K, A_K has semistable reduction; the torus part T of the special fibre of the Néron model has X^*(T) ⊗ ℚ a B-module of ℚ-dimension at most dim V/2 (NeronModelsAndSemistableAbelianVarieties R11.1–R11.3).
2. Since V is a simple B-module, T = 0, so the Néron model is an abelian scheme; λ and i extend (Hom of Néron models), λ remains a polarization (index of a nondegenerate line bundle; Kottwitz §5 citing Mumford §16), the level structure extends since A[n] is étale, and the determinant condition holds over R as an identity of polynomials true over K.
3. Finite étale case: smooth of relative dimension 0 and proper with quasi-finite fibres (M2/kodaira-spencer-dimension).

Acceptance: Siegel datum (C = M_{2g}(ℚ) not division): not proper (A_g has cusps). Rank-one CM datum: finite étale over O_{F_Φ,(□)}.

Direct prerequisites: Within this roadmap: M2/representability; M2/kodaira-spencer-dimension. Other roadmaps and libraries: NeronModelsAndSemistableAbelianVarieties:R11.1; NeronModelsAndSemistableAbelianVarieties:R11.3.

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 392: “Suppose that C = End_B(V) is a division algebra. In this case we will show that S_{K^p} is projective over O_E ⊗_Z Z_(p), using the valuative criterion of properness.” (statement). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 392: “Since the hypothesis that End_B(V) be a division algebra is equivalent to the hypothesis that V be a simple B-module, it follows that T is trivial” (key step).

### Deformations of unitary O_F-abelian schemes (Grothendieck–Messing form)

Declaration: **TauCeti.PEL.unitaryDeformation**. Node: PELModuli:M2/unitary-deformation. Kind: theorem.

Let F be a CM field, p unramified in F, Ψ a generalized CM type of rank N with min(r_τ, r_{τ^c}) = 0 for every τ not above the distinguished place τ_∞ of F⁺, S ↪ Ŝ a closed immersion of ℤ_p^Ψ-schemes on which p is locally nilpotent with a (locally nilpotent) PD structure on its ideal, and (A, λ) a unitary O_F-abelian scheme of signature type Ψ over S. Let H^cris_1(A/Ŝ) be the value of the crystalline homology at Ŝ (a locally free O_Ŝ ⊗ O_F-module) with the pairing ⟨·,·⟩^cris_{λ,τ_∞} on its τ_∞ and τ_∞^c parts. Then Def(S, Ŝ; A, λ) → Def'(S, Ŝ; A, λ), (Â, λ̂) ↦ (ω_{Â^∨/Ŝ,τ_∞}, ω_{Â^∨/Ŝ,τ_∞^c}), is an equivalence onto the groupoid of pairs of subbundles lifting ω_{A^∨/S,τ} that are mutually orthogonal for ⟨·,·⟩^cris_{λ,τ_∞}.

Hypotheses: p unramified in F; PD thickening with p locally nilpotent; min(r_τ, r_{τ^c}) = 0 for τ not above τ_∞.

Proof or construction:

1. Étale-locally replace S ↪ Ŝ by its base change to ℤ_p^◇, where H^cris_1 = ⊕_τ H^cris_1(A/Ŝ)_τ (M0/unramified-tau-decomposition).
2. For τ ∉ {τ_∞, τ_∞^c}, ω_{A^∨/S,τ} has rank 0 or N, so it has a unique lift (zero or everything), automatically isotropic.
3. Apply Serre–Tate and Grothendieck–Messing with O_F-action and polarization (AbelianSchemesAndArithmeticModuli A4, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6) to the remaining two parts (LTXZZ proof of Proposition 3.4.8).

Acceptance: For Ψ = NΦ − τ_∞ + τ_∞^c the deformation space at a point is the space of isotropic pairs (lines/hyperplanes) of dimension N − 1.

Direct prerequisites: Within this roadmap: M1/unitary-of-abelian-scheme; M0/unramified-tau-decomposition. Other roadmaps and libraries: AbelianSchemesAndArithmeticModuli:A4; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6.

Source evidence: [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Proposition 3.4.8, p. 31 (arXiv v3): “The functor from Def(S, Ŝ; A, λ) to Def′(S, Ŝ; A, λ) sending (Â, λ̂) to (ω_{Â∨/Ŝ,τ∞}, ω_{Â∨/Ŝ,τ∞^c}) is a natural equivalence.” (statement). [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), proof of Proposition 3.4.8, p. 31 (arXiv v3): “Note that for τ ∉ {τ∞, τ∞^c}, the subbundle ω_{A∨/S,τ} has a unique lifting to either zero or the entire H^cris_1(A/Ŝ)_τ.” (key step).

### Kernel ranks of O_F-linear quasi-p-isogenies with βα = ϖ

Declaration: **TauCeti.PEL.isogenyKernelRanks**. Node: PELModuli:M2/isogeny-kernel-ranks. Kind: theorem.

Let F⁺ ⊂ ℚ_p via τ_∞ with induced prime 𝔭 of F⁺ inert in F, ϖ ∈ O_{F⁺} with val_𝔭(ϖ) = 1, A and B O_F-abelian schemes over S ∈ Sch/𝔽_{p²}, and α : A → B, β : B → A O_F-linear quasi-p-isogenies with β ∘ α = ϖ·id_A. Then: (1) for τ ∈ {τ_∞, τ_∞^c}, ker α_{*,τ} = im β_{*,τ} and ker β_{*,τ} = im α_{*,τ} on H^dR_1, and these are locally free; (2) rank Lie_{B,τ_∞} − rank Lie_{A,τ_∞} = rank ker α_{*,τ_∞} − rank ker α_{*,τ_∞^c}; (3) if λ_A, λ_B make A, B unitary of dimension N[F⁺:ℚ] with α^∨ λ_B α = ϖ λ_A, then ρ := rank ker α_{*,τ_∞} + rank ker α_{*,τ_∞^c} equals N if both are p-principal, N − 1 if λ_A is p-principal and ker λ_B[𝔭^∞] has rank p², N + 1 in the reverse case, and N if both kernels have rank p²; (4) if instead α^∨ λ_B α = λ_A, ker λ_A[𝔭^∞] has rank p² and λ_B is p-principal, then ρ = 1. (Tacitly 𝔭 is inert in F, as in every application; (2) fails if 𝔭 splits.)

Hypotheses: 𝔭 inert in F (special inert); S over 𝔽_{p²}.

Proof or construction:

1. (1): reduce to 𝔭-parts; with A[𝔭] of degree p^{2d} and ker α[𝔭] of degree p^r, show coker α_* is locally free of rank r using the covariant Dieudonné crystals 𝔻(A[𝔭^∞]) ⊂ 𝔻(B[𝔭^∞]) and the exact sequences (3.4), (3.5) of LTXZZ, with 𝔻(B)/ϖ𝔻(B) locally free of rank 2d (Berthelot–Breen–Messing Proposition 4.3.1, imported from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2), following de Jong's Lemma 2.3.
2. (2): over a perfect field, s − r = dim V𝔻(B)_{τ_∞}/p𝔻(B)_{τ_∞^c} − dim V𝔻(A)_{τ_∞}/p𝔻(A)_{τ_∞^c}, compared by lengths of 𝔻(B)/𝔻(A) in the τ_∞ and τ_∞^c parts (needs σ⁻¹τ_∞^c = τ_∞, i.e. 𝔭 inert).
3. (3), (4): over an algebraically closed field, 2ρ + log_p deg λ_B[𝔭^∞] = 2N + log_p deg λ_A[𝔭^∞] by comparing degrees of (α^∨λ_Bα)[𝔭^∞] and (ϖλ_A)[𝔭^∞].

Acceptance: (3a) with N = 1: ρ = 1, i.e. α kills exactly a line in the τ_∞ ⊕ τ_∞^c parts.

Direct prerequisites: Within this roadmap: M1/unitary-of-abelian-scheme; M1/prime-to-box-quasi-isogeny; M0/unramified-tau-decomposition. Other roadmaps and libraries: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2; AbelianSchemesAndArithmeticModuli:A4.

Source evidence: [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Lemma 3.4.12 (1), p. 32 (arXiv v3): “For τ ∈ {τ∞, τ∞^c}, the induced maps α∗,τ : H^dR_1(A/S)τ → H^dR_1(B/S)τ, β∗,τ : H^dR_1(B/S)τ → H^dR_1(A/S)τ satisfy the relations ker α∗,τ = im β∗,τ and ker β∗,τ = im α∗,τ” (part (1)). [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Lemma 3.4.12 (3)(a), p. 32 (arXiv v3): “If both λA and λB are p-principal, then we have rankOS(ker α∗,τ∞) + rankOS(ker α∗,τ∞^c) = N.” (part (3a)). [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), proof of Lemma 3.4.12, p. 33 (arXiv v3): “By [BBM82, Proposition 4.3.1], D(B[p∞])/ϖD(B[p∞]) is a locally free O^cris_S/pO^cris_S-module of rank 2d.” (BBM input).

### Wedhorn's ordinariness criterion

Declaration: **TauCeti.PEL.wedhornOrdinaryDensity**. Node: PELModuli:M2/wedhorn-ordinary-density. Kind: theorem.

Let (B, *, V, ⟨·,·⟩, h) be a PEL datum of type A or C with a prime p satisfying the good-reduction hypotheses (Bijakowski–Pilloni–Stroh Hypothèse 1.1.1 (i)–(iv), equivalently p good with no level at p), E the reflex field, 𝔭 | p a prime of E, and X the smooth integral model over O_{E,𝔭} at a neat prime-to-p level. Then the ordinary locus (abelian varieties whose p-divisible group is ordinary, i.e. an extension of an étale group by a multiplicative one) is dense in the special fibre X ⊗ O/𝔭 iff p splits completely in E.

Hypotheses: type A or C; p good, no level at p.

Proof or construction:

1. Construct the Newton (or Ekedahl–Oort) stratification of the special fibre with the μ-ordinary stratum as the unique open stratum (Wedhorn 1999 §§1–2; Moonen's classification of Dieudonné modules with PEL structure).
2. The μ-ordinary Newton polygon is ordinary iff the cocharacter μ is defined over ℚ_p up to conjugacy with integral slopes, iff 𝔭 has residue degree 1 over p for all 𝔭, i.e. p splits completely in E (Wedhorn 1999, 1.6.3).
3. Density of the μ-ordinary locus in each connected component (Wedhorn's main theorem).

Acceptance: Siegel: E = ℚ, the ordinary locus of A_g ⊗ 𝔽_p is dense. Picard over K imaginary quadratic with p inert in K: the ordinary locus is empty (μ-ordinary ≠ ordinary).

Direct prerequisites: Within this roadmap: M2/representability; M0/reflex-field; M0/good-primes. Other roadmaps and libraries: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2.

Source evidence: [Classicité de formes modulaires surconvergentes](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf) (Stéphane Bijakowski, Vincent Pilloni, Benoît Stroh), Remarque 1.5.1, p. 988: “Le théorème de Wedhorn montre en fait que p est totalement décomposé dans E si et seulement si le lieu ordinaire est dense dans X × Spec(O/π).” (statement as used). [Classicité de formes modulaires surconvergentes](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf) (Stéphane Bijakowski, Vincent Pilloni, Benoît Stroh), §1.5, p. 987: “Il est non vide d’après [Wed99, 1.6.3] car on a supposé que p est totalement décomposé dans le corps réflexe E.” (citation of Wedhorn 1999, 1.6.3).

Dependencies of M2: AbelianSchemesAndArithmeticModuli:A1, AbelianSchemesAndArithmeticModuli:A2, AbelianSchemesAndArithmeticModuli:A4, AbelianSchemesAndArithmeticModuli:A6, AlgebraicModuliForArithmeticGeometry:A0-extension, AlgebraicModuliForArithmeticGeometry:R09.2, AlgebraicModuliForArithmeticGeometry:R09.4, AlgebraicModuliForArithmeticGeometry:R09.6, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6, NeronModelsAndSemistableAbelianVarieties:R11.1, NeronModelsAndSemistableAbelianVarieties:R11.3, PELModuli:M0, PELModuli:M1, SchemeAndStackFoundations:SF.1, ShimuraData:D5, tauceti:TauCetiRoadmap.

Coverage of M2: **planned**. Remaining refinements: M2/wedhorn-ordinary-density cites Wedhorn 1999 Theorem 1.6.3 through Bijakowski–Pilloni–Stroh; the source was not obtained (gap 'Wedhorn's ordinariness theorem'). The openness-of-versality and limit conditions of Artin's criterion are verified in Lan Appendix B.3, read only at the level of statements; refine M2/representability against AlgebraicModuliForArithmeticGeometry A0-extension's exact hypotheses once that layer's Artin-criterion node exists. Iwahori-level clauses of Bijakowski–Pilloni–Stroh Remark 1.5.1 stay with the Part II recorded in their extraction (item 43), not here.

Acceptance tests for M2: (Rigidity of polarized automorphisms (Mumford–Serre)) n = 2 fails: [−1] is a nontrivial automorphism of (A, λ) acting trivially on A[2]. (Neat open compact subgroups of G(Ẑ^□)) U^□(3) is neat; GL₂(Ẑ) is not (it contains −1). (Objects of M_H have no automorphisms at neat level) For the Siegel datum and n ≥ 3, M_n(S) is a set for every S. (Isom schemes of PEL objects are finite and unramified) For neat H, Isom_U(ξ, ξ) = U. (Local deformation functors are prorepresentable) For an elliptic curve E₀ over k, Def_{E₀} = Def_{(E₀,λ₀)} is prorepresented by W(k)[[t]] (ModularCurves 7D). (Formal smoothness of PEL deformations at good primes) For the Siegel datum, Def_{(A₀,λ₀)} ≅ Spf W(k)[[t_{ij} : 1 ≤ i ≤ j ≤ g]] for principal λ₀. (Effectivity: formal PEL deformations algebraize) The universal formal deformation of an elliptic curve algebraizes to an elliptic curve over W(k)[[t]]. (Representability and smoothness of PEL moduli at good primes) Siegel datum, H = U(n), n ≥ 3: M_n is a smooth separated algebraic space of finite type over ℤ[1/n] of relative dimension g(g+1)/2. (The universal PEL abelian scheme at neat level) For the Siegel datum and g = 1, n ≥ 3, A^univ is the universal elliptic curve with full level n over Y(n) (ModularCurves layer 5B). (Kodaira–Spencer isomorphism and the relative dimension formula) Siegel g = 1: KS : ω^{⊗2} ≅ Ω¹_{Y(n)/ℤ[1/n]} (the classical Kodaira–Spencer isomorphism). (Properness when End_B(V) is a division algebra) Siegel datum (C = M_{2g}(ℚ) not division): not proper (A_g has cusps). (Deformations of unitary O_F-abelian schemes (Grothendieck–Messing form)) For Ψ = NΦ − τ_∞ + τ_∞^c the deformation space at a point is the space of isotropic pairs (lines/hyperplanes) of dimension N − 1. (Kernel ranks of O_F-linear quasi-p-isogenies with βα = ϖ) (3a) with N = 1: ρ = 1, i.e. α kills exactly a line in the τ_∞ ⊕ τ_∞^c parts. (Wedhorn's ordinariness criterion) Siegel: E = ℚ, the ordinary locus of A_g ⊗ 𝔽_p is dense.

<a id="m3"></a>

## M3. Complex and generic-fibre comparison

M3 compares the characteristic-zero moduli with complex Shimura varieties without asserting that the moduli space is a single Sh_K(G, X). Complex points are indexed by the classes of skew-Hermitian B-modules everywhere locally isomorphic to V, i.e. by ker¹(ℚ, G); the Hasse principle holds in Cases C and A with even hermitian dimension and fails in general in Case A_odd and Case D. For each class the analytic family of polarized complex tori over X × G(𝔸_f)/K descends to the uniformization morphism into the analytification of the moduli space; Borel's algebraicity theorem on the charts of an étale atlas algebraizes it, so the generic fibre is a quasi-projective scheme and a disjoint union of Shimura varieties of the inner forms G^{(i)}, without the integral compactification. Type D, where G is disconnected, is kept as a separate comparison with a recorded gap. The analytic-space carrier has no planned owner yet: the confirmed finding RT-AREA-algebraicgeometry/3 asks for one, this packet requests it from ComplexComparisonPartII C0, and the gap ‘Analytic spaces and analytification carrier’ records it until BP-ComplexComparisonPartII settles the owner. LTXZZ's hermitian space Hom^{λ₀,λ}(H₁(A₀), H₁(A)) is constructed here for the unitary comparisons.

Planets: ker¹ indexing of PEL classes; Hasse principle for PEL groups; Complex points of PEL moduli; Complex uniformization morphism; Algebraization of the complex comparison.

### Everywhere locally isomorphic skew-Hermitian modules and ker¹(ℚ, G)

Declaration: **TauCeti.PEL.ker1Classification**. Node: PELModuli:M3/ker1-classification. Kind: theorem.

Let (B, *, V, ⟨·,·⟩) be a rational PEL datum with similitude group G. Isomorphism classes of nondegenerate skew-Hermitian B-modules (V', ⟨·,·⟩') of the same dimension as V, with isomorphisms allowed to scale the form by ℚ^×, are classified by H¹(ℚ, G); those with (V' ⊗ ℚ_v, ⟨·,·⟩') ≅ (V ⊗ ℚ_v, ⟨·,·⟩) (up to ℚ_v^×) for every place v are classified by ker¹(ℚ, G) := ker(H¹(ℚ, G) → ∏_v H¹(ℚ_v, G)), a finite pointed set. Choosing representatives V^{(1)} = V, …, V^{(m)} and local isomorphisms V^{(i)} ⊗ ℚ_v ≅ V ⊗ ℚ_v gives inner forms G^{(i)} of G with identifications G^{(i)}(ℚ_v) ≅ G(ℚ_v) for all v.

Hypotheses: rational PEL datum.

Proof or construction:

1. Twisting: forms of (V, ⟨·,·⟩ up to scalars, B-action) are classified by nonabelian H¹(ℚ, Aut) = H¹(ℚ, G) (Kottwitz §8, p. 399), with classes realized as G-torsors (AdelicAlgebraicGroups:AA.4/group-torsor); the B-module structure has no forms because H¹ of the B-linear GL is trivial (Hilbert 90 for the semisimple algebra C).
2. Restrict to the locally trivial classes; finiteness of ker¹ for linear algebraic groups over number fields (Borel–Serre, cited by Kottwitz as [BS]).
3. Inner forms G^{(i)} and local identifications by transport of structure.

Acceptance: Siegel: ker¹(ℚ, GSp_{2g}) = 1, so m = 1. Unitary similitude groups in an odd number of variables can have ker¹ ≠ 1 (Kottwitz §7).

Direct prerequisites: Within this roadmap: M0/similitude-group-structure; M0/rational-pel-datum. Other roadmaps and libraries: AdelicAlgebraicGroups:AA.4/group-torsor.

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §8, p. 399: “Isomorphism classes of skew-Hermitian B-modules of the same dimension as V are classified by H¹(Q, G), and therefore by [BS] there are finitely many isomorphism classes of skew-Hermitian B-modules (V′, (·,·)′) such that V′_{Q_v} and V_{Q_v} are isomorphic for all places v of Q” (statement). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §7, p. 393: “We write ker¹(Q, G) for the locally trivial elements in H¹(Q, G).” (definition of ker¹).

### When the Hasse principle holds for the PEL group

Declaration: **TauCeti.PEL.hassePrincipleCases**. Node: PELModuli:M3/hasse-principle-cases. Kind: theorem.

Let the rational PEL datum have B simple. (C) In Case C, G/G^der = G_m and ker¹(ℚ, G) = 1. (A) In Case A with hermitian dimension n even, ker¹(ℚ, G) = 1; with n odd, G may fail the Hasse principle, but the map ker¹(ℚ, Z) → ker¹(ℚ, G) from the centre Z of G is a bijection. (D) In Case D the Hasse principle fails in general and the group is disconnected; no single-variety statement is made without a separate computation. Hence in Cases C and A_even the characteristic-zero PEL moduli space at level K is a single Shimura variety Sh_K(G, X) (M3/complex-points), while in Case A_odd it is a disjoint union of |ker¹(ℚ, G)| copies.

Hypotheses: B simple; Cases A or C for the positive statements.

Proof or construction:

1. In Cases A and C, G^der is simply connected (M0/similitude-group-structure), so ker¹(ℚ, G) = ker¹(ℚ, D) for D = G/G^der (Kottwitz, citing his Lemma 4.3.1 of 'Stable trace formula: elliptic singular terms'; Milne Lemma 8.20 using H¹(ℚ_ℓ, G^der) = 0 (Kneser, AdelicAlgebraicGroups:AA.4/kneser-local-torsor) and the Hasse principle for G^der (AdelicAlgebraicGroups:AA.4/hasse-principle-simply-connected)).
2. Case C: D = G_m and H¹(ℚ, G_m) = 0 (Hilbert 90).
3. Case A, n = 2k even: D ≅ D₁ × G_m with D₁ the norm-one torus of F/F₀; ker¹ of D₁ vanishes because F/F₀ is cyclic (Hasse norm theorem, Tau Ceti ClassFieldTheory layer 13; Milne Lemma 8.21).
4. Case A, n odd: ker¹(ℚ, Z) → ker¹(ℚ, D) is a bijection by the diagram chase of Kottwitz §7 (using that H¹(ℚ_v, D₁) is killed by 2 and n odd, and ker²(ℚ, Z₀) = 1 by Tate–Nakayama duality).

Acceptance: Siegel and Hilbert (Case C): single Shimura variety. U(2,1) (n = 3 odd): ker¹(ℚ, G) ≅ ker¹(ℚ, Z), possibly nontrivial.

Direct prerequisites: Within this roadmap: M3/ker1-classification; M0/similitude-group-structure; M0/albert-types. Other roadmaps and libraries: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields; AdelicAlgebraicGroups:AA.4/kneser-local-torsor; AdelicAlgebraicGroups:AA.4/hasse-principle-simply-connected.

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §7, p. 393: “In Case C the torus D is isomorphic to G_m, and therefore G satisfies the Hasse principle.” (Case C). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §7, p. 394: “Since the tori D_1 and G_m both satisfy the Hasse principle, the group G satisfies the Hasse principle in Case A if n is even.” (Case A even). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §7, p. 394: “In fact we will show that the canonical map ker¹(Q, Z) → ker¹(Q, G) is a bijection.” (Case A odd). [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) (James S. Milne), Lemma 8.21, p. 89: “Let (G, X) be a simple PEL Shimura datum of type (A_even) or (C), and let T = G/G^der. Then H¹(Q, T) → ∏_{l≤∞} H¹(Q_l, T) is injective.” (Milne's version).

### Complex points of PEL moduli spaces

Declaration: **TauCeti.PEL.complexPoints**. Node: PELModuli:M3/complex-points. Kind: theorem.

Let (B, *, V, ⟨·,·⟩, h) be a rational PEL datum, X the G(ℝ)-class of h, K ⊂ G(𝔸_f) open compact, and assume Case A or C (for Case D see M3/type-d-comparison). Let V^{(1)} = V, …, V^{(m)} represent ker¹(ℚ, G) with inner forms G^{(i)}. Then M^ad_K(ℂ) (M1/char-zero-adelic-moduli) is the disjoint union over i of the subsets M^ad_K(ℂ)^{(i)} of quadruples whose H₁(A, ℚ) is isomorphic to V^{(i)} as skew-Hermitian B-modules, and there are bijections M^ad_K(ℂ)^{(i)} ≅ G^{(i)}(ℚ)\(X × G(𝔸_f)/K), sending (A, λ, i, η̄) to the class of (h_A, a ∘ η) for a choice of B-isomorphism a : H₁(A, ℚ) ≅ V^{(i)}. Each piece is nonempty. In particular M^ad_K(ℂ) = Sh_K(G, X)(ℂ) when ker¹(ℚ, G) = 1 (Cases C, A_even). For the p-integral problem the same holds for M^rat_H(ℂ) with K = H·K_p, K_p the stabilizer of a self-dual lattice (Kottwitz §8), using M0/self-dual-lattice-classification at p.

Hypotheses: Case A or C (G connected); K ⊂ G(𝔸_f) open compact.

Proof or construction:

1. For a complex point, H := H₁(A, ℚ) with B-action and λ-Weil form is a skew-Hermitian B-module isomorphic to V at every finite place (via η) and at ∞ (determinant condition ⇒ H^{−1,0} ≅ V₀ as B ⊗ ℂ-modules, then Kottwitz Lemma 4.2), so its class lies in ker¹ (M3/ker1-classification).
2. Choose a : H ≅ V^{(i)}; then a ∘ h_A ∘ a⁻¹ ∈ X (Kottwitz Lemma 4.2, Milne Proposition 8.13(a)), and a ∘ η defines an element of G(𝔸_f)/K; changing a changes the pair by G^{(i)}(ℚ).
3. Bijectivity: the theory of complex abelian varieties (Riemann's theorem: AbelianSchemesAndArithmeticModuli A5) builds a polarized abelian variety with B-action from (h', g) ∈ X × G(𝔸_f) with lattice g·(L ⊗ Ẑ) ∩ V^{(i)}.
4. Nonemptiness: V^{(i)} carries a lattice and an h (local isomorphism at ∞), giving a complex point (Lan Remark 1.4.3.13).

Acceptance: Siegel, K = K(n): A_{g,n}(ℂ) ≅ GSp_{2g}(ℚ)\(ℍ_g^± × GSp_{2g}(𝔸_f)/K(n)) ≅ ⊔_{(ℤ/n)^×} Γ(n)\ℍ_g.

Direct prerequisites: Within this roadmap: M3/ker1-classification; M1/char-zero-adelic-moduli; M0/pel-shimura-datum; M0/hodge-structure-of-datum; M0/self-dual-lattice-classification. Other roadmaps and libraries: AbelianSchemesAndArithmeticModuli:A5.

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §8, p. 400: “Then our choice of isomorphism between H and V has given us a well-defined element of (G(A_f)/K) × X_∞.” (construction of the bijection). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §8, p. 400: “The theory of abelian varieties over C shows that this construction yields a bijection from S_{K^p}(C)^(1) to G(Q)\((G(A_f)/K) × X_∞).” (bijection). [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) (James S. Milne), Theorem 8.17, p. 88: “(**) there exists a B-linear isomorphism a: H1(A,Q) → V sending s to a Q×-multiple of ψ, and for such an isomorphism a ∘ hA ∘ a⁻¹ ∈ X.” (condition selecting the component of V).

### The complex uniformization morphism with family and level

Declaration: **TauCeti.PEL.PELModuli.analyticFamily**. Node: PELModuli:M3/uniformization-morphism. Kind: construction.

Let K be neat and i a class in ker¹(ℚ, G). On X × G(𝔸_f)/K there is an analytic family of polarized complex abelian varieties with B-action and level: over (h', g) the torus A_{h',g} = V_ℝ^{(i)}/L_g with complex structure h'(√−1), L_g := V^{(i)} ∩ g(L ⊗ Ẑ), polarization ⟨·,·⟩, B-action, and level structure induced by g. It is G^{(i)}(ℚ)-equivariant and descends to Sh_K(G^{(i)}, X)^an := G^{(i)}(ℚ)\(X × G(𝔸_f)/K) (a complex manifold, ShimuraVarieties V1). By the universal property of the analytification of M^ad_K ⊗ ℂ, it defines a morphism of complex analytic spaces u^{(i)} : Sh_K(G^{(i)}, X)^an → (M^ad_K ⊗_{F₀} ℂ)^an, and ⊔_i u^{(i)} is an isomorphism of analytic spaces onto the analytification, each u^{(i)} an open and closed immersion.

Hypotheses: K neat; Case A or C.

Proof or construction:

1. Construct the family on X × G(𝔸_f) from the relative Riemann theorem for analytic families (AbelianSchemesAndArithmeticModuli A5, Siegel universal analytic family and its monodromy) and descend through the free action of the neat arithmetic groups (ShimuraVarieties V0–V1).
2. Analytification of the algebraic space M^ad_K ⊗ ℂ via an étale presentation and its universal property for analytic families (AlgebraicModuliForArithmeticGeometry A0-extension: analytification on étale presentations; carrier ComplexComparisonPartII C0).
3. Bijectivity on points is M3/complex-points; local isomorphism compares tangent spaces through the Kodaira–Spencer map (M2/kodaira-spencer-dimension) with the tangent space of X (Hodge filtration variation).

API:

- `PELModuli.analyticFamily` (constructor): The family A_{h',g} = V_ℝ^{(i)}/L_g over X × G(𝔸_f)/K with polarization, B-action and level.
- `PELModuli.analyticFamily_equivariant` (relation): G^{(i)}(ℚ)-equivariance: γ acts by A_{h',g} ≅ A_{γh'γ⁻¹, γg} via γ : V_ℝ → V_ℝ.
- `PELModuli.uniformization` (constructor): u^{(i)} : Sh_K(G^{(i)}, X)^an → (M^ad_K ⊗ ℂ)^an.
- `PELModuli.uniformization_openClosed` (other): Each u^{(i)} is an open and closed immersion; ⊔ u^{(i)} is an isomorphism.
- `PELModuli.uniformization_hecke` (functoriality): u^{(i)} commutes with level change and Hecke translation by g ∈ G(𝔸_f).
- `PELModuli.uniformization_universal` (compatibility): u^{(i)*}(A^univ)^an ≅ the descended analytic family, compatibly with λ, i and level.
- `PELModuli.uniformization_siegel` (example): For the Siegel datum and g = 1, u is τ ↦ (ℂ/(ℤ + ℤτ), level from (1/n, τ/n)) on Γ(n)\ℍ (Mathlib UpperHalfPlane).

Unit tests:

- `uniformization_g1` (computation): For the Siegel datum with g = 1, n ≥ 3, u sends τ ∈ ℍ in the component indexed by ζ to (ℂ/(ℤ + ℤτ), P = 1/n, Q = τ/n) with e_n(P, Q) = e^{2πi/n} under the chosen orientation.
- `uniformization_bijective_points` (characterisation): u is bijective on ℂ-points by M3/complex-points.
- `uniformization_not_single` (non-example): For a unitary datum with ker¹(ℚ, G) of order 2, the image of u^{(1)} alone is a proper open and closed subspace: M^ad_K ⊗ ℂ is not Sh_K(G, X).
- `uniformization_zero` (degenerate): For L = 0, both sides are the finite set ℚ_{>0}^×\𝔸_f^×/K and u is the identity.

Uses: ShimuraVarieties:V5: uses M3 to algebraize polarized weight-one variations and to identify the Siegel moduli with Sh(GSp, ℍ^±). ShimuraCompactifications:C4: complex comparison of degenerations at the boundary. HilbertModularVarietiesAndShimuraCurves:H1: complex fibres of the Hilbert–Blumenthal problem compared with the adelic descriptions. Tsimerman 2018, §6.1: π : ℍ_g → A_g(ℂ) for counting CM points.

Acceptance: g = 1: the morphism ⊔_{(ℤ/n)^×} Γ(n)\ℍ → Y(n)(ℂ)^an, τ ↦ (ℂ/(ℤ + ℤτ), (1/n, τ/n)).

Direct prerequisites: Within this roadmap: M3/complex-points; M2/universal-family; M2/kodaira-spencer-dimension. Other roadmaps and libraries: AbelianSchemesAndArithmeticModuli:A5; ShimuraVarieties:V0; ShimuraVarieties:V1; AlgebraicModuliForArithmeticGeometry:A0-extension; ComplexComparisonPartII:C0/repair-analytification; ComplexComparisonPartII:C0; mathlib:UpperHalfPlane.

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §8, p. 400: “Replacing V by V^(i), we get a bijection from S_{K^p}(C)^(i) to G^(i)(Q)\((G(A_f)/K) × X_∞)” (each class). [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) (James S. Milne), Proposition 6.3, p. 59: “The set Sh_K(C) classifies the elements of H_K modulo isomorphism.” (Siegel case of the uniformization). [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf) (Jacob Tsimerman), §6.1, p. 387: “Ag has a uniformization by the Siegel upper half plane Hg of symmetric g × g matrices whose imaginary part is positive definite. Namely, there is a covering map π : Hg → Ag” (Siegel uniformization data (item PAPER-TSIMERMAN-18/siegel-uniformization)).

### Algebraization: the generic fibre is quasi-projective and a union of Shimura varieties

Declaration: **TauCeti.PEL.algebraizationOfComponents**. Node: PELModuli:M3/algebraization-of-components. Kind: theorem.

Let K be neat, Case A or C. The algebraic space M^ad_K ⊗_{F₀} ℂ is a quasi-projective scheme, and the analytic isomorphism ⊔_i u^{(i)} of M3/uniformization-morphism is the analytification of a unique isomorphism of ℂ-schemes ⊔_{i ∈ ker¹(ℚ,G)} Sh_K(G^{(i)}, X)_ℂ ≅ M^ad_K ⊗ ℂ, where Sh_K(G^{(i)}, X)_ℂ is the quasi-projective algebraization of ShimuraVarieties V2–V3. Each piece is open and closed; the identification is compatible with level change, Hecke operators and the universal families. This uses neither the integral compactification of ShimuraCompactifications C5 nor a blanket statement that M^ad_K is one Sh_K(G, X).

Hypotheses: K neat; Case A or C.

Proof or construction:

1. Choose an étale atlas U → M^ad_K ⊗ ℂ by a scheme with quasi-projective affine pieces; the composite U^an → ⊔ Sh_K^an is holomorphic between quasi-projective varieties of which the target is the Baily–Borel quasi-projective variety (ShimuraVarieties V2).
2. Borel's algebraicity theorem (ShimuraVarieties V3) makes each U^an → Sh_K^an algebraic; the maps agree on overlaps U ×_M U, so they descend to an algebraic morphism M^ad_K ⊗ ℂ → ⊔ Sh_K(G^{(i)}, X)_ℂ (AlgebraicModuliForArithmeticGeometry A0-extension: descent of local-isomorphism comparisons along étale presentations).
3. It is a bijective local isomorphism of algebraic spaces (analytic local isomorphism + GAGA comparison of étaleness), hence an isomorphism; the target being a quasi-projective scheme, so is the source (ComplexComparisonPartII C3–C4 for comparison of morphisms).

Acceptance: Siegel, n ≥ 3: A_{g,n} ⊗ ℂ is quasi-projective, isomorphic to ⊔_{(ℤ/n)^×} Γ(n)\ℍ_g with its Baily–Borel algebraic structure.

Direct prerequisites: Within this roadmap: M3/uniformization-morphism; M2/representability. Other roadmaps and libraries: ShimuraVarieties:V2; ShimuraVarieties:V3; AlgebraicModuliForArithmeticGeometry:A0-extension; ComplexComparisonPartII:C3; ComplexComparisonPartII:C4.

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §8, p. 401: “Therefore our moduli space over E is just a disjoint union of |ker¹(Q, G)| copies of the canonical model” (disjoint union statement (Case A odd)). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.4.3.11, pp. 164–165: “In some cases there does exist such a pair, and therefore we obtain more than one Shimura varieties in the components of the characteristic zero fiber of MH.” (several Shimura varieties in the generic fibre).

### Type D: disconnected similitude groups and the moduli problem

Declaration: **TauCeti.PEL.typeDComparison**. Node: PELModuli:M3/type-d-comparison. Kind: theorem.

Let the rational PEL datum have a simple factor of type D, so G is disconnected with 2^{[F₀:ℚ]} components (per simple factor) and the Hasse principle may fail. Then the complex points of M^ad_K are still described by M3/complex-points with G replaced by G and X by the G(ℝ)-class of h, for those classes in ker¹(ℚ, G) whose image in H¹(ℚ_p, G/G°) is trivial at the relevant p (Kottwitz Lemma 7.2 hypothesis); passing to the Shimura datum of G° requires an explicit comparison: Sh_K(G, X) is a quotient of finitely many copies of Sh_{K°}(G°, X°) by the component group, and this comparison is a separate theorem, not an identification.

Hypotheses: B has a type D factor; p ≠ 2 where integral statements are made.

Proof or construction:

1. Kottwitz §8 Case D check: the image of the class of H₁(A, ℚ) in H¹(ℚ, G/G°) = H¹(F₀, {±1}) is locally trivial away from p, hence trivial by weak approximation for the ideles of F₀; this verifies the hypothesis of Lemma 7.2 at p.
2. Describe G(ℚ)\(X × G(𝔸_f)/K) in terms of G°: G(ℝ) permutes the components of X; X × G(𝔸_f)/K is a finite union of G°(ℝ)-orbits.
3. The precise comparison of the moduli problem with Sh(G°, X°) and the indexing set (involving ker¹(ℚ, G) and π₀(G)) is recorded as a gap: no source read here proves it (Kottwitz excludes Case D from §14 on; Lan Remark 1.4.4.3 only warns).

Acceptance: For a definite quaternion type D datum the comparison is not a single Sh(G°, X°).

Direct prerequisites: Within this roadmap: M3/complex-points; M0/similitude-group-structure; M0/self-dual-lattice-classification. 

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §8, p. 399: “But by Shapiro's lemma H¹(Q, G/G°) is equal to H¹(F_0, {±1}), and the latter group is just the group of characters on the idele class group of F_0 with values in {±1}.” (Case D component obstruction). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §8, p. 400: “In Case D the situation is complicated in two ways: the group G has 2^[F_0:Q] connected components and does not satisfy the Hasse principle.” (Case D caveat). [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) (James S. Milne), §8, footnote 54, p. 88: “Of course, one can replace G with its identity component, but then the theorem fails.” (no silent passage to G°).

### The hermitian space Hom^{λ₀,λ}(H₁^ét(A₀), H₁^ét(A))

Declaration: **TauCeti.PEL.hermitianHom**. Node: PELModuli:M3/hermitian-hom-space. Kind: construction.

Let K be an algebraically closed field over O_{F_Ψ} ⊗ P, (A₀, i₀, λ₀) a unitary O_F-abelian scheme over K of signature type Φ (a CM type) and (A, i, λ) one of signature type Ψ. For a set □ of places of ℚ containing ∞ and char K (if nonzero), Hom_{F ⊗ 𝔸^□}(H₁^ét(A₀, 𝔸^□), H₁^ét(A, 𝔸^□)) with the pairing (x, y) := i₀⁻¹((λ_{0*})⁻¹ ∘ y^∨ ∘ λ_* ∘ x) ∈ i₀⁻¹End(H₁^ét(A₀, 𝔸^□)) = F ⊗ 𝔸^□ is a hermitian space over F ⊗_ℚ 𝔸^□ (M0/hermitian-space). Over ℂ with H₁ in place of H₁^ét it gives a hermitian space over F of signature determined by Ψ and Φ, used to compare the unitary moduli spaces with Sh(U(V), K).

Hypotheses: K algebraically closed; A₀ of CM signature type Φ.

Proof or construction:

1. H₁^ét(A₀, 𝔸^□) is free of rank 1 over F ⊗ 𝔸^□, so End_{F⊗𝔸^□}(H₁^ét(A₀)) = F ⊗ 𝔸^□.
2. Linearity in x and c-semilinearity in y from λ₀ i₀(a) = i₀(a^c)^∨ λ₀; hermitian symmetry from the symmetry of polarizations.
3. Perfectness from nondegeneracy of the Weil pairings.

API:

- `hermitianHom` (constructor): The F ⊗ 𝔸^□-module Hom(H₁^ét(A₀), H₁^ét(A)) with (x, y) = i₀⁻¹((λ_{0*})⁻¹ y^∨ λ_* x).
- `hermitianHom_isHermitian` (characterisation): (x, y) is F ⊗ 𝔸^□-linear in x, c-semilinear in y, hermitian and perfect.
- `hermitianHom_rank` (other): rank = N for Ψ of rank N.
- `hermitianHom_functorial` (functoriality): O_F-linear quasi-isogenies of A (resp. A₀) preserving λ up to scalars act by similitudes.
- `hermitianHom_complex` (compatibility): Over ℂ the analogous Hom(H₁(A₀, ℚ), H₁(A, ℚ)) is a hermitian space over F whose localizations are the étale ones (comparison of Betti and étale homology).

Unit tests:

- `hermitianHom_rank_one` (computation): For A = A₀ (Ψ = Φ, N = 1), Hom = F ⊗ 𝔸^□ with (x, y) = x·ȳ up to the unit given by λ, λ₀.
- `hermitianHom_scaling` (characterisation): Replacing λ by cλ (c ∈ ℚ_{>0}) multiplies the pairing by c.
- `hermitianHom_not_symmetric_bilinear` (non-example): The pairing is not 𝔸^□-bilinear symmetric in the F-linear sense: (ax, y) = a(x, y) but (x, ay) = a^c(x, y).
- `hermitianHom_zero` (degenerate): For A = 0 (N = 0) the space is 0.

Uses: Liu–Tian–Xiao–Zhang–Zhu, §§4–5: compare the moduli spaces M(V, K) × T with Sh(V, K). PELModuli:M4/cm-moduli-scheme: A₀ is a point of the CM moduli T_p.

Acceptance: For A = A₀^N with the product structure the space is (F ⊗ 𝔸^□)^N with the standard hermitian form.

Direct prerequisites: Within this roadmap: M1/unitary-of-abelian-scheme; M0/hermitian-space; M1/symplectic-isom-sheaf. 

Source evidence: [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Construction 3.4.4, p. 30 (arXiv v3): “we construct a hermitian space Hom^{λ0,λ}_{F⊗Q A□}(H^ét_1(A0, A□), H^ét_1(A, A□)) over F ⊗Q A□” (construction).

### Siegel moduli at full level n over ℂ

Declaration: **TauCeti.PEL.siegelFineUniformization**. Node: PELModuli:M3/siegel-fine-uniformization. Kind: application.

For the Siegel datum of genus g and n ≥ 3, the complex fibre of A_{g,n} := M_{U(n)} (over ℤ[1/n]) satisfies A_{g,n}(ℂ) ≅ ⊔_{ζ ∈ μ_n^prim} Γ(n)\ℍ_g, where ℍ_g is the Siegel upper half space of symmetric complex g × g matrices with positive definite imaginary part and Γ(n) = ker(Sp_{2g}(ℤ) → Sp_{2g}(ℤ/n)), the component indexed by ζ consisting of points whose level structure has ν_n(1) = ζ. For g = 1 this is ⊔ Γ(n)\ℍ with ℍ the Mathlib upper half plane.

Hypotheses: Siegel datum; n ≥ 3.

Proof or construction:

1. Apply M3/complex-points with ker¹ = 1 (Case C).
2. Strong approximation for Sp_{2g} and ν(K(n)) = Ẑ^× ∩ (1 + nẐ) identify G(ℚ)\(ℍ_g^± × G(𝔸_f)/K(n)) with ⊔_{(ℤ/n)^×} Γ(n)\ℍ_g (Milne §6; ShimuraVarieties V0).

Acceptance: g = 1, n = 3: (ℤ/3)^× has 2 elements, so A_{1,3}(ℂ) has 2 connected components, each isomorphic to Γ(3)\ℍ.

Direct prerequisites: Within this roadmap: M3/complex-points; M3/uniformization-morphism. Other roadmaps and libraries: ShimuraVarieties:V0; mathlib:UpperHalfPlane.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) (James S. Milne), Theorem 6.11, p. 63: “The set Sh_K(C) classifies the elements (A, s, ηK) of M_K modulo isomorphism.” (Siegel complex points). [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf) (Jacob Tsimerman), §6.1, p. 387: “Ag has a uniformization by the Siegel upper half plane Hg of symmetric g × g matrices whose imaginary part is positive definite. Namely, there is a covering map π : Hg → Ag” (Siegel space).

Dependencies of M3: AbelianSchemesAndArithmeticModuli:A5, AdelicAlgebraicGroups:AA.4, AlgebraicModuliForArithmeticGeometry:A0-extension, ComplexComparisonPartII:C0, ComplexComparisonPartII:C3, ComplexComparisonPartII:C4, PELModuli:M0, PELModuli:M1, PELModuli:M2, ShimuraVarieties:V0, ShimuraVarieties:V1, ShimuraVarieties:V2, ShimuraVarieties:V3, tauceti:TauCetiRoadmap.

Coverage of M3: **planned**. Remaining refinements: M3/ker1-classification and M3/hasse-principle-cases rest on gap 'Nonabelian Galois cohomology, ker¹ and the Hasse principle'; their simply connected inputs (torsors, Kneser, the Hasse principle for G^der) are imported from AdelicAlgebraicGroups AA.4. M3/type-d-comparison records gap 'Type D comparison with the identity component'. The analytic-space carrier for M3/uniformization-morphism is the RT-AREA-algebraicgeometry/3 owner (gap 'Analytic spaces and analytification carrier').

Acceptance tests for M3: (Everywhere locally isomorphic skew-Hermitian modules and ker¹(ℚ, G)) Siegel: ker¹(ℚ, GSp_{2g}) = 1, so m = 1. (When the Hasse principle holds for the PEL group) Siegel and Hilbert (Case C): single Shimura variety. (Complex points of PEL moduli spaces) Siegel, K = K(n): A_{g,n}(ℂ) ≅ GSp_{2g}(ℚ)\(ℍ_g^± × GSp_{2g}(𝔸_f)/K(n)) ≅ ⊔_{(ℤ/n)^×} Γ(n)\ℍ_g. (The complex uniformization morphism with family and level) g = 1: the morphism ⊔_{(ℤ/n)^×} Γ(n)\ℍ → Y(n)(ℂ)^an, τ ↦ (ℂ/(ℤ + ℤτ), (1/n, τ/n)). (Algebraization: the generic fibre is quasi-projective and a union of Shimura varieties) Siegel, n ≥ 3: A_{g,n} ⊗ ℂ is quasi-projective, isomorphic to ⊔_{(ℤ/n)^×} Γ(n)\ℍ_g with its Baily–Borel algebraic structure. (Type D: disconnected similitude groups and the moduli problem) For a definite quaternion type D datum the comparison is not a single Sh(G°, X°). (The hermitian space Hom^{λ₀,λ}(H₁^ét(A₀), H₁^ét(A))) For A = A₀^N with the product structure the space is (F ⊗ 𝔸^□)^N with the standard hermitian form. (Siegel moduli at full level n over ℂ) g = 1, n = 3: (ℤ/3)^× has 2 elements, so A_{1,3}(ℂ) has 2 connected components, each isomorphic to Γ(3)\ℍ.

<a id="m4"></a>

## M4. Canonical models and integral level changes

M4 identifies the generic-fibre pieces with canonical models: the Galois action of the moduli problem on CM points is Shimura's reciprocity law (main theorem of complex multiplication from ShimuraVarieties V5), so each ker¹-piece is the canonical model over E(G, X) = F₀; in Case A_odd Kottwitz's twisting automorphisms permute the pieces. The identifications are compatible with level change, Hecke maps and morphisms of PEL data (Hodge-type inheritance from V6). At higher p-level the normal integral model is the relative normalization of the smooth good-level model in the generic-fibre cover; it is finite, normal and flat over O_{F₀,v} (Nagata finiteness and torsion-freeness), and nothing more: no smoothness, fine moduli interpretation or universal p-level structure is asserted (RS-23 owner record for this package). LTXZZ's auxiliary CM moduli scheme T_p(W₀, K^p₀) is the rank-one unitary PEL problem of signature a CM type; it is finite étale over O_{F_Φ} ⊗ ℤ_(p) by M2, Galois with group T₀(𝔸^{∞,p})/T₀(ℤ_(p))K^p₀, and carries the 𝔗-invariant cohomology and 𝔗-trace.

Planets: CM reciprocity on PEL moduli; Canonical model comparison; Normal integral models at higher level; CM moduli scheme T_p.

### The moduli Galois action on CM points is Shimura reciprocity

Declaration: **TauCeti.PEL.cmPointsReciprocity**. Node: PELModuli:M4/cm-points-reciprocity. Kind: theorem.

Let K be neat, (T, h) a special pair of (G, X) (ShimuraData:D4/special-pair) with reflex field E(T, h) ⊃ F₀, and x = [h, g] ∈ Sh_K(G^{(i)}, X)(ℂ) ⊂ M^ad_K(ℂ) a special point (the abelian variety A_x has CM by a CM algebra containing the image of T). For σ ∈ Aut(ℂ/E(T, h)) and s ∈ 𝔸^×_{E(T,h),f} with art(s) = σ|_{E(T,h)^ab} (in the normalization of ShimuraVarieties V4), the point σ(x) defined by the F₀-structure of the moduli problem (σ acting on (A, λ, i, η̄) by base change) equals [h, r_{(T,h)}(s)·g], where r_{(T,h)} is the reflex-norm reciprocity map. Hence the F₀-structure on M^ad_K satisfies the canonical-model condition of V4 on special points.

Hypotheses: K neat; Case A or C.

Proof or construction:

1. A special point gives a CM abelian variety A_x with B-action and T ⊂ Aut; its Galois conjugate is described by the main theorem of complex multiplication (Shimura–Taniyama; ShimuraVarieties V5), applied to (A_x, λ, i, η) with the polarization and level structure.
2. Translate the main theorem's description of σ(A_x, λ, i, η) (lattice change by the reflex norm of s, Tate-module identification by s) into the adelic coordinates [h, g] of M3/complex-points, checking the sign convention of V4 (Kottwitz's (G, h⁻¹) versus Deligne's (G, h)).
3. Compatibility with the B-action and the determinant condition: i is defined over the field of definition of A_x and is preserved by σ.

Acceptance: Siegel g = 1: for E with CM by O_K, σ ∈ Aut(ℂ/K) acts on the j-invariant through the Artin symbol of the class group (classical CM).

Direct prerequisites: Within this roadmap: M3/algebraization-of-components; M3/complex-points. Other roadmaps and libraries: ShimuraVarieties:V4; ShimuraVarieties:V5; ShimuraData:D4/special-pair; ShimuraData:D4/special-point.

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §8, p. 400: “The subvarieties S^(1), ..., S^(m) of the E-variety S_{K^p} are defined over E; in fact each one is a canonical model for the Shimura variety obtained from the data (G, h⁻¹, K^p).” (canonical models). [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) (James S. Milne), Proposition 14.12, p. 136: “Suppose that Sh_K has a model M_K over Q for which the map” (strategy: a moduli model satisfying reciprocity on special points is canonical).

### PEL generic fibres are canonical models

Declaration: **TauCeti.PEL.canonicalModelIdentification**. Node: PELModuli:M4/canonical-model-identification. Kind: theorem.

Let K be neat, Case A or C. The F₀-scheme M^ad_K (the generic fibre of the PEL moduli problem; for p-integral data M_{K^p} ⊗ F₀ with K = K^p·K_p, K_p hyperspecial) decomposes as ⊔_{i ∈ ker¹(ℚ,G)} S^{(i)} with each S^{(i)} open and closed and defined over F₀, and S^{(i)} is the canonical model of Sh_K(G^{(i)}, X) over E(G, X) = F₀ (ShimuraVarieties V4 definition). The identification of M3/algebraization-of-components is defined over F₀. When ker¹(ℚ, G) = 1, M^ad_K is the canonical model of Sh_K(G, X).

Hypotheses: K neat; Case A or C.

Proof or construction:

1. Each S^{(i)} is stable under Aut(ℂ/F₀): the class of H₁(A, ℚ) in ker¹(ℚ, G) is Galois invariant (it is detected by local invariants: Tate modules and the determinant condition, both σ-stable).
2. The F₀-model S^{(i)} satisfies the reciprocity law at special points (M4/cm-points-reciprocity); special points are Zariski dense, so S^{(i)} is a canonical model (uniqueness: ShimuraVarieties V4; Milne Proposition 14.12).
3. E(G, X) = F₀ by M0/reflex-field-comparison.

Acceptance: Siegel: A_{g,n} ⊗ ℚ is the canonical model of Sh_{K(n)}(GSp_{2g}, ℍ_g^±) (ShimuraVarieties V5). Picard (2,1) over K: M ⊗ K is a union of |ker¹| canonical models over K.

Direct prerequisites: Within this roadmap: M4/cm-points-reciprocity; M3/algebraization-of-components; M3/hasse-principle-cases; M0/reflex-field-comparison. Other roadmaps and libraries: ShimuraVarieties:V4; ShimuraVarieties:V6.

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §8, p. 400: “The subvarieties S^(1), ..., S^(m) of the E-variety S_{K^p} are defined over E; in fact each one is a canonical model” (statement). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.4.3.11, p. 165: “As explained by Kottwitz in [79, §8], the canonical models of Shimura varieties appearing in the characteristic zero fiber of Mrat_H are all isomorphic to each other (even as canonical models).” (isomorphic pieces).

### Twisting automorphisms permuting the ker¹ pieces (Case A, n odd)

Declaration: **TauCeti.PEL.PELModuli.twist**. Node: PELModuli:M4/twisting-automorphisms. Kind: construction.

In Case A with n odd, let z ∈ ker¹(ℚ, Z) ≅ ker¹(ℚ, G), represented by a totally positive a ∈ F₀^× which is a unit at the places above p, together with β = (β_ℓ) ∈ (𝔸_f^p ⊗ F)^× with a·N_{F/F₀}(β_ℓ) ∈ ℚ_ℓ^× for every ℓ ≠ p. The map (A, λ, i, η̄) ↦ (A, λ ∘ i(a), i, βη̄) defines an automorphism of the tower {S_{K^p}} over F₀ commuting with the G(𝔸_f^p)-action and the λ-adic sheaves; the automorphism attached to z_i maps S^{(1)} isomorphically onto S^{(i)}. Hence all pieces S^{(i)} are isomorphic canonical models.

Hypotheses: Case A; n odd.

Proof or construction:

1. H¹(ℚ, Z) = F₀^×/ℚ^× N_{F/F₀}(F^×) and H¹(ℚ, Z(𝔸)) = 𝔸_{F₀}^×/𝔸^× N(𝔸_F^×) (Kottwitz §8); choose a and β as stated.
2. λ ∘ i(a) is a polarization because a is totally positive and in the centre; the Rosati involution is unchanged since a* = a; the multiplier changes by a, compensated by β on level structures.
3. Equivariance and compatibility with sheaves are formal; the image of S^{(1)} is S^{(i)} because H₁ changes by the twist of the form by a (class z_i).

API:

- `PELModuli.twist` (constructor): For (a, β) as above, the automorphism (A, λ, i, η̄) ↦ (A, λ ∘ i(a), i, βη̄) of the tower.
- `PELModuli.twist_hecke` (functoriality): twist commutes with the G(𝔸_f^p)-action and level change.
- `PELModuli.twist_maps_piece` (other): twist(a, β) maps S^{(1)} isomorphically to the piece indexed by the class of a in ker¹(ℚ, Z) ≅ ker¹(ℚ, G).
- `PELModuli.twist_mul` (structure): twist(a, β) ∘ twist(a', β') = twist(aa', ββ') up to the choices.
- `PELModuli.twist_trivial` (simp): For a ∈ ℚ_{>0}^× N(F^×) the twist is isomorphic to the identity on each piece.

Unit tests:

- `twist_identity` (degenerate): For a = 1, β = 1, twist is the identity.
- `twist_polarization_positive` (characterisation): For totally positive central a, λ ∘ i(a) is again a polarization and its Rosati involution restricts to * on B.
- `twist_needs_positivity` (non-example): For a ∈ F₀^× not totally positive, λ ∘ i(a) is not a polarization (it is not positive at some real place), so the map does not land in the moduli problem.

Uses: Kottwitz 1992, §8: reduces the moduli space to copies of one canonical model, for the zeta function computation. AutomorphicGaloisRepresentationsPartII:AG2.1a: étale cohomology of unitary PEL varieties is a sum over ker¹ of isomorphic pieces.

Acceptance: If ker¹(ℚ, G) = 1 the construction gives automorphisms of S^{(1)} only.

Direct prerequisites: Within this roadmap: M4/canonical-model-identification; M3/hasse-principle-cases; M1/hecke-action. 

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §8, p. 400: “Define an automorphism of S_{K^p} by sending an S-valued point (A, λ, i, η̄) to the point (A, λ ∘ i(a), i, βη̄)” (construction). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §8, p. 401: “Therefore our moduli space over E is just a disjoint union of |ker¹(Q, G)| copies of the canonical model S^(1)_{K^p} for (G, h⁻¹, K^p).” (conclusion).

### Canonical models are compatible with level change, Hecke maps and morphisms of PEL data

Declaration: **TauCeti.PEL.canonicalModelFunctoriality**. Node: PELModuli:M4/canonical-model-functoriality. Kind: theorem.

The identifications of M4/canonical-model-identification commute with: (a) the level-change maps M^ad_{K'} → M^ad_K and Sh_{K'} → Sh_K for K' ⊂ K; (b) Hecke translations [g] for g ∈ G(𝔸_f) (and the corresponding maps on canonical models); (c) morphisms of PEL data (M1/functoriality-in-data), in particular the Siegel morphism M^ad_K → A_{g,D,K^S} and the morphism of Shimura data (G, X) → (GSp(V), X(ψ)) of Hodge type, whose canonical models are compared by ShimuraVarieties V6; (d) prime-to-□ isogenies of PEL data changing L within L ⊗ ℚ.

Hypotheses: neat levels.

Proof or construction:

1. All maps are defined on the moduli side over F₀ and on the Shimura side by the adelic formulas; they agree on ℂ-points by M3/complex-points.
2. A morphism between canonical models agreeing on ℂ-points with a morphism of F₀-schemes is that morphism (canonical models are reduced, points dense).
3. For (c) use the Hodge-type inheritance theorem of ShimuraVarieties V6 for the canonical model of (G, X) ⊂ (GSp, X(ψ)).

Acceptance: The Siegel morphism from a unitary PEL variety to A_{g} is defined over F₀ and agrees with the morphism of canonical models.

Direct prerequisites: Within this roadmap: M4/canonical-model-identification; M1/hecke-action; M1/functoriality-in-data. Other roadmaps and libraries: ShimuraVarieties:V6.

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §6, p. 392: “For g ∈ G(A_f^p) there is an isomorphism S_{K^p} → S_{g^{−1}K^p g} sending (A, λ, i, η̄) to (A, λ, i, η̄g).” (Hecke on the moduli side). [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) (James S. Milne), Proposition 14.14, p. 138: “Let (G, X) ↪ (G′, X′) be an inclusion of Shimura data.” (inheritance for subdata).

### Normal integral models at higher p-level

Declaration: **TauCeti.PEL.PELModuli.normalizedModel**. Node: PELModuli:M4/higher-level-normalization. Kind: construction.

Let p be a good prime, v | p a prime of F₀, K^p ⊂ G(𝔸_f^p) neat, K_p^0 = G(ℤ_p) the stabilizer of L ⊗ ℤ_p and K_p ⊂ K_p^0 open compact. Let 𝔐 := M_{K^p} ⊗ O_{F₀,v} be the smooth good-level model (M2/representability) and π : M^ad_{K_pK^p} ⊗ F₀,v → M^ad_{K_p^0K^p} ⊗ F₀,v = 𝔐_{F₀,v} the finite étale level-change map of the generic fibre. Define 𝔐_{K_pK^p} := the relative normalization of 𝔐 in M^ad_{K_pK^p} ⊗ F₀,v along 𝔐_{F₀,v} ↪ 𝔐 ∘ π, constructed étale-locally on 𝔐 (mathlib AlgebraicGeometry.Scheme.Hom.normalization over each scheme in an étale atlas, glued by compatibility of normalization with étale base change). It comes with a finite morphism 𝔐_{K_pK^p} → 𝔐 and a canonical identification of its generic fibre with M^ad_{K_pK^p} ⊗ F₀,v. No smoothness, fine moduli interpretation or universal p-level structure is asserted for 𝔐_{K_pK^p}; the universal abelian scheme pulled back from 𝔐 carries no level-K_p structure over the special fibre.

Hypotheses: p good, v | p; K^p neat; K_p ⊂ G(ℤ_p) open.

Proof or construction:

1. Construct π from the level-change maps of M1/hecke-action on generic fibres; it is finite étale because the level-K_p structures of an abelian scheme over a characteristic-zero base form a finite étale torsor under K_p^0/K_p (quotient by the effective kernel).
2. Relative normalization over each étale chart U → 𝔐 (mathlib Scheme.Hom.normalization with its universal property normalizationDesc) and gluing (normalization commutes with étale base change).
3. Compatibility with K_p' ⊂ K_p: the universal property gives finite maps 𝔐_{K_p'K^p} → 𝔐_{K_pK^p}; and with prime-to-p Hecke operators.

API:

- `PELModuli.normalizedModel` (constructor): 𝔐_{K_pK^p} := normalization of 𝔐 in the generic-fibre cover at level K_pK^p.
- `PELModuli.normalizedModel_toGood` (projection): The finite morphism 𝔐_{K_pK^p} → 𝔐 = 𝔐_{K_p^0K^p}.
- `PELModuli.normalizedModel_generic` (characterisation): Its generic fibre is canonically M^ad_{K_pK^p} ⊗ F₀,v.
- `PELModuli.normalizedModel_universal` (universal-property): Any normal flat 𝔐-algebraic space Y with Y_{F₀,v} → M^ad_{K_pK^p} over 𝔐 factors uniquely through 𝔐_{K_pK^p} (normalizationDesc).
- `PELModuli.normalizedModel_level` (functoriality): Finite maps 𝔐_{K_p'K^p} → 𝔐_{K_pK^p} for K_p' ⊂ K_p, compatible in towers.
- `PELModuli.normalizedModel_hecke` (functoriality): Prime-to-p Hecke correspondences extend.
- `PELModuli.normalizedModel_good` (simp): 𝔐_{K_p^0K^p} = 𝔐.

Unit tests:

- `normalizedModel_good_level` (degenerate): For K_p = G(ℤ_p), the normalized model is the smooth model 𝔐 itself.
- `normalizedModel_gamma0p_not_smooth` (non-example): For the Siegel datum with g = 1 and K_p = Γ₀(p)-level, 𝔐_{K_pK^p} ⊗ 𝔽_p is the union of two copies of the special fibre of the good model crossing at the supersingular points; it is not smooth (Deligne–Rapoport), so smoothness is not inherited.
- `normalizedModel_generic_g1` (computation): For g = 1 and K_p = Γ(p)-level, the generic fibre is Y(pN) ⊗ ℚ_p(ζ_p)-components over Y(N) ⊗ ℚ_p as in ModularCurves; the normalization recovers the Katz–Mazur [Γ(pN)] regular model up to normalization.

Uses: PerfectoidShimuraVarieties:S1: finite-level models of the anticanonical tower at higher p-level. ShimuraCompactifications:C5: chart and finiteness properties of higher p-level normalizations. HilbertModularVarietiesAndShimuraCurves:H2: normalizations from M4 on the verified overlap (RS-23 owner record).

Acceptance: For K_p = K_p^0, 𝔐_{K_p^0K^p} = 𝔐 (𝔐 is normal, being smooth).

Direct prerequisites: Within this roadmap: M2/representability; M1/hecke-action; M3/algebraization-of-components. Other roadmaps and libraries: mathlib:AlgebraicGeometry.Scheme.Hom.normalization; mathlib:AlgebraicGeometry.Scheme.Hom.normalizationDesc; mathlib:AlgebraicGeometry.Etale.

Source evidence: [The Stacks Project](https://stacks.math.columbia.edu) (The Stacks Project Authors), Tag 03GR (Lemma 29.54.15): “Let f : X → S be a morphism. Assume that 1. S is a Nagata scheme, 2. f is of finite type, 3. X is reduced. Then the normalization ν : S′ → S of S in X is finite.” (finiteness of relative normalization). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.4.1.14, p. 154: “the MH is actually a quasi-projective scheme when H is neat.” (the good-level base is a scheme after C5; étale-local construction avoids that input).

### Finiteness, normality and flatness of the normalized models

Declaration: **TauCeti.PEL.normalizationFiniteNormalFlat**. Node: PELModuli:M4/normalization-finite-normal-flat. Kind: theorem.

In the setting of M4/higher-level-normalization: 𝔐_{K_pK^p} is finite over 𝔐, normal, and flat over O_{F₀,v}; its special fibre need not be reduced, smooth or equidimensional beyond what flatness gives (it is equidimensional of the same dimension as the generic fibre).

Hypotheses: as in M4/higher-level-normalization.

Proof or construction:

1. Finiteness: 𝔐 is of finite type over O_{F₀,v}, hence excellent and Nagata (SchemeAndStackFoundations key/excellent-schemes); the normalization of a Nagata scheme in a reduced finite-type scheme is finite (Stacks Tag 03GR), applied on an étale atlas (AlgebraicModuliForArithmeticGeometry A0-extension: finiteness of normalisation under excellence).
2. Normality: by construction (the integral closure of a normal ring in a reduced algebra whose total ring of fractions is a product of fields is normal).
3. Flatness over O_{F₀,v}: 𝔐_{K_pK^p} is reduced with every irreducible component dominating Spec O_{F₀,v} (the structure sheaf is contained in the pushforward from the generic fibre), so its local rings are torsion-free over the DVR O_{F₀,v}, hence flat (Stacks Tag 0539).

Acceptance: The Γ₀(p) model of the modular curve is flat with reduced special fibre.

Direct prerequisites: Within this roadmap: M4/higher-level-normalization. Other roadmaps and libraries: SchemeAndStackFoundations:key/excellent-schemes; AlgebraicModuliForArithmeticGeometry:A0-extension; mathlib:AlgebraicGeometry.Flat; mathlib:AlgebraicGeometry.IsFinite.

Source evidence: [The Stacks Project](https://stacks.math.columbia.edu) (The Stacks Project Authors), Tag 0539 (Lemma 15.22.10): “Let A be a valuation ring. An A-module M is flat over A if and only if M is torsion free.” (flatness over the DVR). [The Stacks Project](https://stacks.math.columbia.edu) (The Stacks Project Authors), Tag 035S (Lemma 29.55.11): “Let X be a Nagata scheme. The normalization ν : X^ν → X is a finite morphism.” (Nagata finiteness).

### The CM moduli scheme T_p(W₀, K^p₀)

Declaration: **TauCeti.PEL.cmModuli1**. Node: PELModuli:M4/cm-moduli-scheme. Kind: construction.

Let F be a CM field, p unramified in F, Φ a CM type, W₀ a rational skew-hermitian space over O_F ⊗ ℤ_(p) of rank 1 and type Φ (M0/skew-hermitian-space), and K^p₀ ⊂ T₀(𝔸^{∞,p}) open compact. T¹_p(W₀, K^p₀) is the presheaf on locally noetherian O_{F_Φ} ⊗ ℤ_(p)-schemes sending S to equivalence classes of (A₀, λ₀, η₀^p): (A₀, λ₀) a unitary O_F-abelian scheme of signature type Φ with λ₀ p-principal and η₀^p a K^p₀-level structure (a π₁-invariant K^p₀-orbit of similitudes W₀ ⊗ 𝔸^{∞,p} ≅ H₁^ét(A₀s, 𝔸^{∞,p})), modulo prime-to-p O_F-linear quasi-isogenies carrying (λ₀, η₀^p) to (cλ₀', η₀^{p'}) for some c ∈ ℤ_(p)^×. For K^p₀ neat it is represented by a scheme finite étale over O_{F_Φ} ⊗ ℤ_(p). The map w : T¹_p(ℂ) → ker¹(T₀) sends a point to the similarity class of H₁(A₀(ℂ), ℤ_(p)); T_p(W₀, K^p₀) is the minimal open and closed subscheme containing w⁻¹(class of W₀). T₀(𝔸^{∞,p}) acts by a·(A₀, λ₀, η₀^p) = (A₀, λ₀, η₀^p ∘ a) with stabilizer T₀(ℤ_(p))K^p₀.

Hypotheses: p unramified in F; K^p₀ neat for representability.

Proof or construction:

1. T¹_p is the rational moduli problem M^rat_{K^p₀} (M1/rational-moduli-problem with □ = {p}) for the rank-one unitary PEL datum of signature Φ, with reflex field F_Φ (M0/generalized-cm-type).
2. Representability by a finite étale scheme: M2/representability (smooth of relative dimension Σ p_τ q_τ = 0, so étale) and M2/properness-when-division (End_F(W₀) = F is a field, so proper); a proper étale algebraic space with quasi-finite fibres is a finite étale scheme. LTXZZ states this as known without proof; this supplies it.
3. The map w and T_p: M0/rank-one-skew-hermitian-classification identifies similarity classes with ker¹(T₀); the fibre w⁻¹(W₀) is a union of components.
4. The T₀(𝔸^{∞,p})-action by changing η₀^p, with stabilizer computed from M2/no-automorphisms-at-neat-level.

API:

- `cmModuli1` (constructor): The presheaf T¹_p(W₀, K^p₀).
- `cmModuli1_represented` (other): For neat K^p₀, represented by a finite étale O_{F_Φ} ⊗ ℤ_(p)-scheme.
- `cmModuli1_w` (data): w : T¹_p(ℂ) → ker¹(T₀), the similarity class of H₁(A₀(ℂ), ℤ_(p)).
- `cmModuli` (constructor): T_p(W₀, K^p₀) ⊂ T¹_p, minimal open-closed containing w⁻¹(W₀).
- `cmModuli_act` (structure): Action of T₀(𝔸^{∞,p}) by η₀^p ↦ η₀^p ∘ a, with stabilizer T₀(ℤ_(p))K^p₀.
- `cmModuli_eq_pel` (compatibility): T¹_p = M^rat_{K^p₀} for the rank-one unitary PEL datum of signature Φ.
- `torusGroupoid` (data): 𝔗: one object with automorphism group T₀(𝔸^{∞,p})/T₀(ℤ_(p))K^p₀; T_p is a functor 𝔗 → Sch/O_{F_Φ}⊗ℤ_(p), and ℭ × 𝔗 → Sch through the projection.

Unit tests:

- `cmModuli_imagQuad_points` (computation): For F = ℚ(i), Φ = {τ}, p ≡ 1 mod 4 and K^p₀ = (1 + NẐ^p[i])^× ∩ T₀ neat, T_p(ℂ) is a torsor under the finite group T₀(𝔸^{∞,p})/T₀(ℤ_(p))K^p₀.
- `cmModuli_relDim_zero` (characterisation): The rank-one datum of signature Φ has Σ_{τ∈Φ} p_τ q_τ = 0, so T¹_p is étale over O_{F_Φ} ⊗ ℤ_(p).
- `cmModuli_not_principal` (non-example): Dropping p-principality of λ₀ changes the problem: polarizations with kernel of p-power order give points not in T¹_p.
- `cmModuli_empty_type` (non-example): If W₀ has type cΦ rather than Φ, w⁻¹(W₀) is empty in T¹_p for signature type Φ (signs at ∞ differ).

Uses: Liu–Tian–Xiao–Zhang–Zhu, §§4–5: the auxiliary CM factor of the product moduli spaces M(V, K^p) ×T_p. PELModuli:M4/torus-groupoid-trace: 𝔗-invariant cohomology and the 𝔗-trace.

Acceptance: F imaginary quadratic: T_p(W₀, K^p₀) is a finite étale O_F ⊗ ℤ_(p)-scheme whose ℂ-points are CM elliptic curves with level structure.

Direct prerequisites: Within this roadmap: M2/representability; M2/properness-when-division; M1/rational-moduli-problem; M1/unitary-of-abelian-scheme; M0/rank-one-skew-hermitian-classification; M0/generalized-cm-type. 

Source evidence: [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Definition 3.5.4, p. 35 (arXiv v3): “we define a presheaf T¹_p(W0, K^p_0) on Sch′/O_{FΦ}⊗Z(p) as follows” (definition). [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), §3.5, p. 35 (arXiv v3): “It is known that when K^p_0 is neat, T¹_p(W0, K^p_0) is represented by a scheme finite and étale over O_{FΦ} ⊗ Z(p).” (representability stated without proof). [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), §3.5, p. 35 (arXiv v3): “We define Tp(W0, K^p_0) to be the minimal open and closed subscheme of T¹_p(W0, K^p_0) containing w^{−1}(W0).” (T_p).

### Galois structure of T_p(W₀, K^p₀)

Declaration: **TauCeti.PEL.cmModuliGalois**. Node: PELModuli:M4/cm-moduli-galois. Kind: theorem.

In the setting of M4/cm-moduli-scheme with K^p₀ neat, the morphism T_p(W₀, K^p₀) → Spec(O_{F_Φ} ⊗ ℤ_(p)) is a Galois (finite étale torsor) cover with Galois group T₀(𝔸^{∞,p})/T₀(ℤ_(p))K^p₀ acting as in M4/cm-moduli-scheme; this group is finite.

Hypotheses: K^p₀ neat.

Proof or construction:

1. Finiteness of T₀(𝔸^{∞,p})/T₀(ℤ_(p))K^p₀: it injects into T₀(ℚ)\T₀(𝔸^∞)/T₀(ℤ_p)K^p₀, finite (class-group finiteness for tori).
2. On ℂ-points, T_p(ℂ) is a torsor under this group (M3/complex-points for the torus datum: one G(ℚ)-orbit after fixing the similarity class).
3. The Galois action on ℂ-points commutes with T₀(𝔸^{∞,p}) and is given by reciprocity (M4/cm-points-reciprocity), so the cover is Galois with the stated group acting by deck transformations.

Acceptance: For F imaginary quadratic and K^p₀ maximal away from a neat auxiliary level, the cover is a ring class field extension of F (classical CM).

Direct prerequisites: Within this roadmap: M4/cm-moduli-scheme; M4/cm-points-reciprocity; M3/complex-points. 

Source evidence: [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), §3.5, p. 35 (arXiv v3): “In fact, T0(A∞,p)/T0(Z(p))K^p_0 is the Galois group of the Galois morphism Tp(W0, K^p_0) → Spec(O_{FΦ} ⊗ Z(p)).” (statement).

### 𝔗-invariant cohomology and the 𝔗-trace map

Declaration: **TauCeti.PEL.torusInvariantCohomology**. Node: PELModuli:M4/torus-groupoid-trace. Kind: construction.

Let 𝔗 be the groupoid of the finite group Γ := T₀(𝔸^{∞,p})/T₀(ℤ_(p))K^p₀ and X : 𝔗 → Sch a functor (a scheme X(∗) with Γ-action), L a coefficient ring. H^i_𝔗(X, L(j)) ⊂ H^i_ét(X(∗), L(j)) and H^i_{𝔗,c}(X, L(j)) ⊂ H^i_{ét,c}(X(∗), L(j)) are the maximal submodules on which Γ acts trivially (invariants, not coinvariants). If κ is algebraically closed of characteristic p, L is p-coprime, X(∗) is smooth of finite type of dimension d over κ and Γ acts freely on π₀(X(∗)), the 𝔗-trace ∫^𝔗_X : H^{2d}_{𝔗,c}(X(∗), L(d)) → L is the composite of the inclusion into H^{2d}_c(X(∗), L(d)), the projection to ⊕_Y H^{2d}_c(Y, L(d)) over a set {Y} of representatives of Γ-orbits on components, and Σ tr_Y; it is independent of the representatives.

Hypotheses: Γ finite acting freely on components for the trace.

Proof or construction:

1. Define invariant submodules functorially in X (functor on ℭ × 𝔗 composed with the projection).
2. Trace: on a Γ-invariant class, the traces on Y and on gY agree (tr is compatible with the isomorphism g : Y → gY), so the sum over representatives does not depend on choices; no division by |Γ| occurs.
3. Étale cohomology with compact support and the trace map tr_Y for smooth connected Y of dimension d are imported (SchemeAndStackFoundations SF.2).

API:

- `torusInvariantCohomology` (constructor): H^i_𝔗(X, L(j)) := H^i_ét(X(∗), L(j))^Γ, and the compactly supported variant.
- `torusInvariantCohomology_functorial` (functoriality): Functorial in Γ-equivariant morphisms X → X'.
- `torusTrace` (constructor): ∫^𝔗_X : H^{2d}_{𝔗,c}(X(∗), L(d)) → L via orbit representatives.
- `torusTrace_indep` (characterisation): Independent of the representatives of Γ-orbits on π₀(X(∗)).
- `torusTrace_trivial` (simp): For trivial Γ and connected X(∗), ∫^𝔗 = tr.

Unit tests:

- `torusTrace_trivial_group` (degenerate): For Γ trivial and X(∗) connected, ∫^𝔗_X = tr_{X(∗)}.
- `torusTrace_two_orbits` (computation): For Γ = ℤ/2 acting freely on X(∗) = Y ⊔ Y', H^{2d}_{𝔗,c} ≅ L (diagonal classes) and ∫^𝔗 sends the class (c, c) to tr_Y(c).
- `torusTrace_not_average` (non-example): ∫^𝔗 is not (1/|Γ|)·tr_{X(∗)}: on the diagonal class (c, c) above, tr_{X(∗)} gives 2·tr_Y(c) while ∫^𝔗 gives tr_Y(c), and no division by 2 is needed in L.

Uses: Liu–Tian–Xiao–Zhang–Zhu, §§4–5: the auxiliary CM factor is removed from the cohomology of product moduli spaces by taking 𝔗-invariants and 𝔗-traces.

Acceptance: If Γ acts trivially on a connected X(∗), ∫^𝔗 = tr.

Direct prerequisites: Within this roadmap: M4/cm-moduli-scheme. Other roadmaps and libraries: SchemeAndStackFoundations:SF.2.

Source evidence: [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Notation 3.5.7, p. 35 (arXiv v3): “For a functor X : T → Sch and a coefficient ring L, we denote H^i_T(X, L(j)) ⊆ H^i_ét(X(∗), L(j)), H^i_{T,c}(X, L(j)) ⊆ H^i_{ét,c}(X(∗), L(j)) the maximal L-submodules, respectively, on which T0(A∞,p)/T0(Z(p))K^p_0 acts trivially.” (invariant cohomology). [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Definition 3.5.8, pp. 35–36 (arXiv v3): “where {Y} is a set of representatives of T-orbits on the connected components of X(∗), and the second map is the natural projection. It is clear that the above composite map does not depend on the choice of {Y}.” (trace map).

Dependencies of M4: AlgebraicModuliForArithmeticGeometry:A0-extension, PELModuli:M0, PELModuli:M1, PELModuli:M2, PELModuli:M3, SchemeAndStackFoundations:SF.2, SchemeAndStackFoundations:key, ShimuraData:D4, ShimuraVarieties:V4, ShimuraVarieties:V5, ShimuraVarieties:V6.

Coverage of M4: **planned**. Remaining refinements: M4/cm-points-reciprocity uses the main theorem of complex multiplication with polarizations and level from ShimuraVarieties V5 (request); its translation into Kottwitz's sign convention is stated in the node and must be checked against V4's normalization when V4/V5 are blueprinted.

Acceptance tests for M4: (The moduli Galois action on CM points is Shimura reciprocity) Siegel g = 1: for E with CM by O_K, σ ∈ Aut(ℂ/K) acts on the j-invariant through the Artin symbol of the class group (classical CM). (PEL generic fibres are canonical models) Siegel: A_{g,n} ⊗ ℚ is the canonical model of Sh_{K(n)}(GSp_{2g}, ℍ_g^±) (ShimuraVarieties V5). (Twisting automorphisms permuting the ker¹ pieces (Case A, n odd)) If ker¹(ℚ, G) = 1 the construction gives automorphisms of S^{(1)} only. (Canonical models are compatible with level change, Hecke maps and morphisms of PEL data) The Siegel morphism from a unitary PEL variety to A_{g} is defined over F₀ and agrees with the morphism of canonical models. (Normal integral models at higher p-level) For K_p = K_p^0, 𝔐_{K_p^0K^p} = 𝔐 (𝔐 is normal, being smooth). (Finiteness, normality and flatness of the normalized models) The Γ₀(p) model of the modular curve is flat with reduced special fibre. (The CM moduli scheme T_p(W₀, K^p₀)) F imaginary quadratic: T_p(W₀, K^p₀) is a finite étale O_F ⊗ ℤ_(p)-scheme whose ℂ-points are CM elliptic curves with level structure. (Galois structure of T_p(W₀, K^p₀)) For F imaginary quadratic and K^p₀ maximal away from a neat auxiliary level, the cover is a ring class field extension of F (classical CM). (𝔗-invariant cohomology and the 𝔗-trace map) If Γ acts trivially on a connected X(∗), ∫^𝔗 = tr.

<a id="m5"></a>

## M5. Required examples

M5 is narrowed by RS-23: it keeps the Siegel examples in every genus and polarization type with the genus-one comparison with the modular curves of #81 (including the Weil-pairing convention), the unitary examples with signatures, positivity, reflex field, dimension and good primes (RS-14 owner record; consumed by AutomorphicCongruences L1 and AutomorphicPadicLFunctions L4, L4e, L5), and a nonprincipal polarization type. The Hilbert example is imported from ShimuraData D5 and HilbertModularVarietiesAndShimuraCurves H0/H1 and only checked here as an acceptance test; it is not handed back to H1 or H2.

Planets: Siegel PEL datum; Siegel moduli A_{g,D,n}; Genus-one comparison; Unitary PEL datum.

### Siegel PEL data of every genus and polarization type

Declaration: **TauCeti.PEL.siegelDatum**. Node: PELModuli:M5/siegel-pel-datum. Kind: construction.

For g ≥ 1 and positive integers d₁ | d₂ | … | d_g (the type D), the Siegel PEL datum of genus g and type D is (ℤ, id, L_D, ⟨·,·⟩_D, h): L_D = ℤ^{2g} with basis e₁, …, e_g, f₁, …, f_g and ⟨e_i, f_j⟩_D = d_i δ_{ij}·2π√−1, ⟨e_i, e_j⟩ = ⟨f_i, f_j⟩ = 0 (values in ℤ(1)), and h(√−1) = J_D with J_D e_i = f_i, J_D f_i = −e_i, so that (1/2π√−1)⟨x, J_D y⟩ = Σ_i d_i (x_{e_i} y_{e_i} + x_{f_i} y_{f_i}) is positive definite (for D = (1, …, 1) and Mathlib's Matrix.J, whose form has ψ(e_i, f_i) = −1, the same structure is h(√−1) = −J). Its similitude group is G = GSp(L_D) (≅ GSp_{2g} over ℚ), Case C, I_bad = 1, Disc = 1, [L_D^# : L_D] = (d₁⋯d_g)², reflex field ℚ, signatures (g, g), and the bad primes for level n are those dividing n·d_g. Its Shimura datum is ShimuraData:D5/siegel-datum.

Hypotheses: g ≥ 1; d₁ | … | d_g positive integers.

Proof or construction:

1. Write down L_D, ⟨·,·⟩_D and h; check Condition 1.2.1.2 by computing the real form (block-diagonal positive definite).
2. Compute L_D^# = ⊕ (ℤ e_i ⊕ d_i⁻¹ℤ f_i) and the index; type is recovered by the Smith normal form of the Gram matrix (Tau Ceti Matrix.exists_smith_normal_form_of_det_ne_zero).
3. Identify G₁ with Sp(L_D) (for D = 1, Tau Ceti Symplectic.groupScheme) and the Shimura datum with D5's Siegel datum; reflex field ℚ because V₀ is determined by its dimension g (M0/reflex-field).

API:

- `siegelDatum` (constructor): The integral PEL datum (ℤ, id, L_D, ⟨·,·⟩_D, h) of genus g and type D.
- `siegelDatum_group` (characterisation): Its similitude group is GSp(L_D), with G₁ = Sp(L_D).
- `siegelDatum_reflex` (simp): Reflex field ℚ.
- `siegelDatum_badPrimes` (characterisation): p is bad at level n iff p | n·d_g.
- `siegelDatum_dualIndex` (simp): [L_D^# : L_D] = (d₁⋯d_g)².
- `siegelDatum_signature` (simp): Signatures (g, g); V₀ has dimension g.
- `siegelDatum_shimura` (compatibility): toShimuraDatum (siegelDatum D) = ShimuraData:D5/siegel-datum for every D (the rational datum does not depend on D).
- `siegelDatum_type` (other): The polarization type of L_D (elementary divisors of the Gram matrix) is D.

Unit tests:

- `siegelDatum_index_12` (computation): For g = 2 and D = (1, 2): [L_D^# : L_D] = 4 and the bad primes at level n = 3 are {2, 3}.
- `siegelDatum_principal_good` (degenerate): For D = (1, …, 1) and n = 1 there are no bad primes: the datum is good over Spec ℤ.
- `siegelDatum_shimura_indep` (compatibility): The rational Shimura data of types (1, 1) and (1, 2) coincide (both GSp₄ with Siegel half spaces); only the integral moduli problems differ.
- `siegelDatum_not_type_unordered` (non-example): The Gram data (2, 1) (not in divisibility order) define the same lattice as type (1, 2): types are normalized by d₁ | d₂ (Smith normal form uniqueness).

Uses: ShimuraVarieties:V5: the Siegel canonical model. AbelianSchemesAndArithmeticModuliPartII:B0: fine polarization-type D level ℓ moduli (request to M5). AbelianVarietiesIsogenousToNoJacobian:A0: the common Siegel A_g moduli realization (request to M5). PELModuli:M6/siegel-stack-over-z: the principally polarized Siegel stack over ℤ.

Acceptance: D = (1): principally polarized Siegel datum, good at every p ∤ n. g = 1, D = (1): the GL₂ datum (ShimuraData:D5/gl2-datum).

Direct prerequisites: Within this roadmap: M0/integral-pel-datum; M0/similitude-group; M0/good-primes; M0/reflex-field; M0/pel-shimura-datum. Other roadmaps and libraries: ShimuraData:D5/siegel-datum; tauceti:Matrix.exists_smith_normal_form_of_det_ne_zero; tauceti:TauCeti.Symplectic.groupScheme; mathlib:Matrix.J.

Source evidence: [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) (James S. Milne), §6, Proposition 6.3, p. 59: “The set Sh_K(C) classifies the elements of H_K modulo isomorphism.” (Siegel moduli as the basic PEL example). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.4.1.1, p. 148: “We say that a prime number p is bad if p|n I_bad Disc[L^# : L].” (bad primes of the Siegel datum of type D: p | n d_g).

### Siegel moduli A_{g,D,n} for every genus

Declaration: **TauCeti.PEL.siegelModuli**. Node: PELModuli:M5/siegel-moduli. Kind: theorem.

For the Siegel datum of genus g and type D and n ≥ 1, A_{g,D,n} := M_{U(n)} over ℤ[1/(n d_g)] is the moduli problem of abelian schemes A/S of relative dimension g with a polarization λ whose kernel is étale-locally ≅ (⊕_i ℤ/d_i)², and a symplectic level-n structure (α_n, ν_n) of type L_D. It is a smooth separated algebraic stack of finite type of relative dimension g(g+1)/2 over ℤ[1/(n d_g)], an algebraic space for n ≥ 3, with universal abelian scheme for n ≥ 3, and its complex fibre is ⊔_{(ℤ/n)^×} Γ_D(n)\ℍ_g. In characteristic zero it is a quasi-projective scheme whose components are canonical models.

Hypotheses: n ≥ 3 for the algebraic-space and universal-family statements.

Proof or construction:

1. Instantiate M1/moduli-problem for the Siegel datum: the O-structure is trivial and the determinant condition says rank Lie = g, automatic.
2. Apply M2/representability, M2/universal-family, M2/kodaira-spencer-dimension (Sym² of a rank-g space).
3. Apply M3/siegel-fine-uniformization and M4/canonical-model-identification (ker¹ = 1 in Case C).

Acceptance: g = 1, D = (1), n ≥ 3: Y(n) over ℤ[1/n] (M5/genus-one-comparison). Relative dimension of A_{2,D,n} is 3.

Direct prerequisites: Within this roadmap: M5/siegel-pel-datum; M1/moduli-problem; M2/representability; M2/universal-family; M2/kodaira-spencer-dimension; M3/siegel-fine-uniformization; M4/canonical-model-identification. 

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Corollary 1.4.1.13, p. 153: “The moduli problem Mn is representable by a smooth separated algebraic stack of finite type over S0. It is representable by an algebraic space if n ≥ 3.” (representability for M_n). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 391: “For B = Q this was proved by Mumford [M1] using geometric invariant theory.” (Siegel case via GIT).

### Genus one: PEL Siegel moduli versus the modular curves of #81

Declaration: **TauCeti.PEL.genusOneComparison**. Node: PELModuli:M5/genus-one-comparison. Kind: theorem.

For g = 1, D = (1) and n ≥ 3, there is an isomorphism over ℤ[1/n] between A_{1,1,n} = M_{U(n)} and the fine moduli scheme Y(n) of elliptic curves with full level-n structure of the Tau Ceti ModularCurves roadmap (#81), sending (A, λ, α_n, ν_n) to (A with its unique principal polarization, (P, Q) = (α_n(e₁), α_n(f₁))) with the Weil-pairing convention e_n(P, Q) = ν_n(⟨e₁, f₁⟩ mod n), where ⟨e₁, f₁⟩ = 2π√−1 generates ℤ(1); over ℤ[1/n, ζ_n], the fibre ν_n(1) = ζ is Y(n, ζ) of ModularCurves layer 5B (full ordered bases with fixed pairing). One-dimensional abelian schemes are elliptic curves (AbelianSchemesAndArithmeticModuli A1, via the Weierstrass presentation of #81), and the comparison respects universal objects and the Hecke action of GL₂(ℤ/n) (row-versus-column conventions pinned as in ShimuraVarieties V8).

Hypotheses: n ≥ 3.

Proof or construction:

1. Elliptic curves over S = abelian schemes of relative dimension 1 (AbelianSchemesAndArithmeticModuli A1); every such has a unique principal polarization (the canonical one), so λ is determined and D = (1) forces it.
2. A symplectic level-n structure for the standard pairing is an ordered basis (P, Q) of E[n] with e_n(P, Q) = ν_n(ζ_n^{univ}); liftability is automatic for principal polarizations (L self-dual).
3. Match with the Katz–Mazur [Γ(n)] moduli problem and Y(n, ζ) (ModularCurves layers 3C, 4A, 5B) and the Cartier–Nishi Weil pairing (layer 2E); the sign convention e_n(P, Q) versus e_n(Q, P) is fixed by ⟨e₁, f₁⟩ = +1.
4. Universal objects correspond by the universal properties; the GL₂(ℤ/n)-actions agree after the transpose convention of ShimuraVarieties V8.

Acceptance: Over ℂ, the point τ ∈ ℍ maps to (ℂ/(ℤ + ℤτ), 1/n, τ/n) with e_n = e^{2π√−1/n} in the chosen orientation.

Direct prerequisites: Within this roadmap: M5/siegel-moduli; M1/principal-level-structure. Other roadmaps and libraries: AbelianSchemesAndArithmeticModuli:A1; tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing; tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing; tauceti:TauCetiRoadmap/ModularCurves#3c-the-four-level-structures.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition 1.3.6.1, p. 133: “An (integral) principal level-n structure of (A, λ, i) of type (L ⊗ Ẑ□, ⟨·,·⟩) is an O-equivariant symplectic-liftable isomorphism αn : (L/nL)_S → A[n]” (level structure matched with full level). [Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) (James S. Milne), Proposition 6.4, p. 60: “Let M = C^n/Λ. There is a canonical isomorphism” (complex tori and lattices (genus-one case of the uniformization)).

### The Hilbert example satisfies the M0–M4 contracts

Declaration: **TauCeti.PEL.hilbertExampleAcceptance**. Node: PELModuli:M5/hilbert-example-acceptance. Kind: application.

Let F be a totally real field of degree d, D5's rational Hilbert data, H0's integral trace-lattice refinement and H1's polarization-module PEL instance (B = F, * = id, O = O_F, L = O_F ⊕ 𝔠^∨-type lattice with the trace pairing; owned by HilbertModularVarietiesAndShimuraCurves H1 per RS-23). Then: the datum is of Case C (G = G* ⊂ Res_{F/ℚ}GL₂ with rational multiplier); I_bad = 1; Disc = disc(F)^2-power with good primes p ∤ n·disc(F)·[L^#:L]; signatures (1, 1) at each real embedding; reflex field ℚ; ker¹(ℚ, G) = 1; relative dimension d (M2/kodaira-spencer-dimension); at good p the determinant condition is the Rapoport condition (Lie_{A/S} locally free of rank one over O_F ⊗ O_S). The verification is an acceptance test of the imported construction, not a second construction and not an input to H1/H2.

Hypotheses: F totally real; H1's polarization-module datum.

Proof or construction:

1. Import the rational datum from ShimuraData D5 (D5/hilbert-star-datum, D5/hilbert-trace-embedding) and the integral/polarization-module instance from H0/H1.
2. Compute the Albert type (C), bad primes, signature and reflex field from M0 (traces Tr(a | V₀) = Tr_{F/ℚ}(a) ∈ ℚ).
3. Hasse principle from M3/hasse-principle-cases (Case C); dimension from M2/kodaira-spencer-dimension; determinant condition at unramified p equals the Rapoport condition by M0/determinant-condition-splitting.

Acceptance: F = ℚ recovers the genus-one Siegel case. F real quadratic: Hilbert modular surfaces of dimension 2 with reflex field ℚ.

Direct prerequisites: Within this roadmap: M0/reflex-field; M0/albert-types; M0/good-primes; M0/determinant-condition-splitting; M2/kodaira-spencer-dimension; M3/hasse-principle-cases. Other roadmaps and libraries: ShimuraData:D5/hilbert-star-datum; ShimuraData:D5/hilbert-trace-embedding; HilbertModularVarietiesAndShimuraCurves:H0; HilbertModularVarietiesAndShimuraCurves:H1.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Corollary 1.2.5.6, p. 91: “F_0 = Q(Tr_C(b|V_0) : b ∈ B) = Q(Tr_C(b|V_0) : b ∈ O).” (reflex field via traces (equal to ℚ for the Hilbert datum)). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §7, p. 393: “In Case C the torus D is isomorphic to G_m, and therefore G satisfies the Hasse principle.” (single Shimura variety).

### Unitary PEL data over CM fields with prescribed signatures

Declaration: **TauCeti.PEL.unitaryDatum**. Node: PELModuli:M5/unitary-pel-datum. Kind: construction.

Let K be a CM field with maximal totally real subfield K⁺, Φ a CM type, (V, H) a hermitian space over K of dimension n with signature (r_τ, s_τ) at each τ ∈ Φ (r_τ + s_τ = n), and δ ∈ K^× with δ̄ = −δ and Im τ(δ) > 0 for τ ∈ Φ. The unitary PEL datum is (O_K, c, L, ⟨·,·⟩, h): ⟨x, y⟩ := Tr_{K/ℚ}(δ H(x, y))·2π√−1 on an O_K-lattice L ⊂ V with ⟨L, L⟩ ⊂ ℤ(1), and h(√−1) acting on V ⊗_{K,τ} ℂ ≅ ℂ^n by diag(√−1·1_{r_τ}, −√−1·1_{s_τ}) in an H-orthogonal basis (with the sign fixed by the positivity of (1/√−1)⟨x, h(√−1)y⟩). Its similitude group is GU(V) (Case A), I_bad = 1, its signatures are (p_τ, q_τ) = (r_τ, s_τ) with Ψ = Σ_{τ∈Φ} (r_τ τ + s_τ τ̄), its reflex field is F_Ψ, its relative dimension is Σ_{τ∈Φ} r_τ s_τ, and its good primes at level n are those not dividing n·disc(K)·[L^# : L].

Hypotheses: K CM, (V, H) hermitian of dimension n; δ totally imaginary with Im τ(δ) > 0 on Φ.

Proof or construction:

1. Check alternation and adjointness: ⟨x, x⟩ = Tr(δ H(x, x)) = 0 since δ H(x, x) is totally imaginary; ⟨ax, y⟩ = ⟨x, āy⟩ (M0/hermitian-space dictionary).
2. Check Condition 1.2.1.2: on V ⊗_{K,τ} ℂ the real form is 2 Im τ(δ)·(±Re H) with signs matching the signature, positive definite by the choice of h (Kottwitz Lemma 4.3 signature argument).
3. Compute signatures, reflex field (M0/generalized-cm-type: F_Ψ), relative dimension (M2/kodaira-spencer-dimension) and bad primes (Disc(O_K) = disc(K)·(…) by M0/order-discriminant).

API:

- `unitaryDatum` (constructor): The integral PEL datum (O_K, c, L, Tr(δ H), h) of signature (r_τ, s_τ)_{τ∈Φ}.
- `unitaryDatum_group` (characterisation): Similitude group GU(V); Case A.
- `unitaryDatum_signature` (simp): Signatures (r_τ, s_τ) at τ ∈ Φ and (s_τ, r_τ) at τ̄.
- `unitaryDatum_reflex` (simp): Reflex field F_Ψ for Ψ = Σ_{τ∈Φ}(r_τ τ + s_τ τ̄).
- `unitaryDatum_relDim` (simp): Relative dimension Σ_{τ∈Φ} r_τ s_τ.
- `unitaryDatum_badPrimes` (characterisation): Bad primes divide n·Disc(O_K)·[L^#:L]; 2 may be good.
- `unitaryDatum_shimura` (compatibility): If some r_τ s_τ ≠ 0 the Shimura datum (GU(V), X) satisfies SV3; if all r_τ s_τ = 0 it is definite and SV3 fails.
- `unitaryDatum_ker1` (other): ker¹(ℚ, GU(V)) = 1 if n is even; ≅ ker¹(ℚ, Z) if n is odd (M3/hasse-principle-cases).

Unit tests:

- `unitaryDatum_picard_reflex` (computation): K = ℚ(√−3), n = 3, signature (2, 1): reflex field K and relative dimension 2.
- `unitaryDatum_U11` (computation): K imaginary quadratic, signature (1, 1): reflex field ℚ, relative dimension 1.
- `unitaryDatum_definite` (degenerate): Signature (n, 0): relative dimension 0; the moduli problem is finite over its base (M2/properness-when-division when End_K(V) is a division algebra, e.g. n = 1).
- `unitaryDatum_wrong_delta` (non-example): With δ replaced by −δ (Im τ(δ) < 0 on Φ) and the same h, Condition 1.2.1.2 fails: the real form becomes negative definite.

Uses: RS-14 owner record: M5 owns the unitary PEL example with specified signatures, polarization and good-prime/reflex-field checks. AutomorphicPadicLFunctions:L4: EHLS's unitary PEL varieties (RS-14 link M5 → L4, L4e, L5). AutomorphicCongruences:L1: the U(2,2) Shimura varieties of Skinner–Urban (RS-14 link M5 → L1). IgusaVarietiesAndTorsionConcentration:IG.0: the split unitary datum of CSnc.

Acceptance: K imaginary quadratic, n = 3, signature (2, 1): Picard datum, reflex field K, dimension 2. K imaginary quadratic, signature (1, 1): reflex field ℚ, dimension 1.

Direct prerequisites: Within this roadmap: M0/hermitian-space; M0/skew-hermitian-space; M0/generalized-cm-type; M0/signatures; M0/integral-pel-datum; M0/good-primes; M2/kodaira-spencer-dimension. Other roadmaps and libraries: mathlib:NumberField.IsCMField.

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), Lemma 4.3 proof, pp. 388–389: “It is enough to show that (p, q) is the signature of (·,·)′.” (signature of the hermitian form attached to (⟨·,·⟩, h)). [Classicité de formes modulaires surconvergentes](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf) (Stéphane Bijakowski, Vincent Pilloni, Benoît Stroh), §1.1, p. 980: “Le B ⊗_Q R-module U^{1,0} est isomorphe à ∏_{i=1}^d (C^n)^{a_τi} ⊕ (C̄^n)^{b_τi}” (unitary signatures in BPS). [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Definition 3.3.1, p. 28 (arXiv v3): “For such Ψ, we define its reflex field F_Ψ ⊆ C to be the fixed subfield of the stabilizer of Ψ in Aut(C/Q).” (reflex field of the signature).

### Unitary examples: positivity, reflex field, dimension and good primes

Declaration: **TauCeti.PEL.unitaryExamples**. Node: PELModuli:M5/unitary-examples. Kind: application.

(a) Picard: K = ℚ(√−d) imaginary quadratic, V = K³ with H = diag(1, 1, −1), L = O_K³ with ⟨x, y⟩ = Tr_{K/ℚ}(δ H(x, y)) for δ = 1/√d_K (a generator of the inverse different, so L is self-dual), signature (2, 1): reflex field K, relative dimension 2, good primes p ∤ n·d_K, ker¹(ℚ, G) ≅ ker¹(ℚ, Z) possibly nontrivial (n = 3 odd). (b) U(1, 1): K imaginary quadratic, H = diag(1, −1): reflex ℚ, dimension 1, ker¹ = 1. (c) U(2, 2) (Skinner–Urban): K imaginary quadratic, n = 4, signature (2, 2): reflex ℚ, dimension 4, ker¹ = 1. (d) General signature (a_τ, b_τ) over a CM field K with p satisfying Bijakowski–Pilloni–Stroh Hypothèse 1.1.1: the signatures are constant above each prime of K⁺ (M0/bps-signature-constancy).

Hypotheses: as stated in each case.

Proof or construction:

1. Instantiate M5/unitary-pel-datum and compute signature, reflex field via M0/generalized-cm-type, relative dimension via M2/kodaira-spencer-dimension, bad primes via M0/good-primes, ker¹ via M3/hasse-principle-cases.
2. Verify positivity of h for the chosen δ (sign of Im τ(δ)).

Acceptance: (a) dimension 2, (b) 1, (c) 4. (a) reflex field K; (b), (c) reflex field ℚ.

Direct prerequisites: Within this roadmap: M5/unitary-pel-datum; M3/hasse-principle-cases; M0/bps-signature-constancy; M2/kodaira-spencer-dimension. 

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §7, p. 394: “If n is odd, say n = 2k + 1, then D is isomorphic to the subtorus of F^× consisting of elements whose norm down to F_0 belongs to Q^×” (odd n: ker¹ via the centre). [Classicité de formes modulaires surconvergentes](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf) (Stéphane Bijakowski, Vincent Pilloni, Benoît Stroh), Lemme 1.1.4, p. 981: “On a (a_τ, b_τ) = (a_τ′, b_τ′) si τ et τ′ sont au dessus d’un même idéal premier π_i de F_0.” (signature constancy).

### A nonprincipal polarization type

Declaration: **TauCeti.PEL.nonprincipalTypeExample**. Node: PELModuli:M5/nonprincipal-type-example. Kind: application.

For g = 2 and D = (1, p) with p prime, the Siegel datum L_D (⟨e₁, f₁⟩ = 1, ⟨e₂, f₂⟩ = p) has [L_D^# : L_D] = p², so p is bad for every level; the moduli problem A_{2,(1,p),n} is defined and smooth over ℤ[1/(np)] of relative dimension 3 (abelian surfaces with a polarization of type (1, p) and level n), while its behaviour at p is not covered by M2 (the polarization has kernel of order p², a non-étale group scheme over 𝔽_p in the supersingular case). Similarly the unitary datum with L = O_K ⊕ O_K ⊕ 𝔭O_K (non-self-dual at a prime 𝔭 | p) has p bad.

Hypotheses: p prime.

Proof or construction:

1. Compute L_D^# and the bad primes (M5/siegel-pel-datum).
2. Apply M5/siegel-moduli away from p; record that no smoothness at p is claimed.
3. Smith normal form recovers the type (1, p) from the Gram matrix.

Acceptance: The product E₁ × E₂ with λ = λ_{E₁} × pλ_{E₂} is an object of type (1, p).

Direct prerequisites: Within this roadmap: M5/siegel-pel-datum; M5/siegel-moduli; M5/unitary-pel-datum. Other roadmaps and libraries: tauceti:Matrix.exists_smith_normal_form_of_det_ne_zero.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.3.6.2, p. 134: “it forces the kernel of the prime-to-□ polarization λ to be isomorphic to (L# ⊗ Ẑ□)/(L ⊗ Ẑ□).” (the type of λ is the type of L away from □).

Dependencies of M5: AbelianSchemesAndArithmeticModuli:A1, HilbertModularVarietiesAndShimuraCurves:H0, HilbertModularVarietiesAndShimuraCurves:H1, PELModuli:M0, PELModuli:M1, PELModuli:M2, PELModuli:M3, PELModuli:M4, ShimuraData:D5, tauceti:TauCetiRoadmap.

Coverage of M5: **planned**. Remaining refinements: Narrowed by RS-23: the Hilbert example is imported from ShimuraData D5 and HilbertModularVarietiesAndShimuraCurves H0/H1 and only accepted here (M5/hilbert-example-acceptance).

Acceptance tests for M5: (Siegel PEL data of every genus and polarization type) D = (1): principally polarized Siegel datum, good at every p ∤ n. (Siegel moduli A_{g,D,n} for every genus) g = 1, D = (1), n ≥ 3: Y(n) over ℤ[1/n] (M5/genus-one-comparison). (Genus one: PEL Siegel moduli versus the modular curves of #81) Over ℂ, the point τ ∈ ℍ maps to (ℂ/(ℤ + ℤτ), 1/n, τ/n) with e_n = e^{2π√−1/n} in the chosen orientation. (The Hilbert example satisfies the M0–M4 contracts) F = ℚ recovers the genus-one Siegel case. (Unitary PEL data over CM fields with prescribed signatures) K imaginary quadratic, n = 3, signature (2, 1): Picard datum, reflex field K, dimension 2. (Unitary examples: positivity, reflex field, dimension and good primes) (a) dimension 2, (b) 1, (c) 4. (A nonprincipal polarization type) The product E₁ × E₂ with λ = λ_{E₁} × pλ_{E₂} is an object of type (1, p).

<a id="m6"></a>

## M6. Arithmetic moduli and source R10.3/R10.6

M6 is narrowed by RS-23 and is the consumer-facing owner recorded by RS-06. It imports M1's fibred category and M2's rigidified spaces, and constructs: the moduli stack at arbitrary level by finite quotient presentations [M_{H'}/(H/H')]; the Siegel stack 𝔄_g over ℤ by gluing level-3 and level-4 presentations; the finite-type stack 𝔄_{g,d} of degree-d² polarizations (including p | d); coarse spaces by the finite-inertia theorem (RS-27 owner record); fields of moduli and the descent obstruction separating a rational coarse point from a rational family (residual gerbes; forms classified by H¹(Gal, Aut)); Tsimerman's level-three bound on fields of definition; the Hodge bundle and Hodge line of the universal family; the export interface to ArakelovGeometryAndAbelianHeights R35.2–R35.6 and FaltingsFinitenessAndIsogenyTheorems R28.1–R28.2; finite-field finiteness at fixed polarization degree (Lipnowski–Tsimerman, Tate); and explicit nonempty Siegel and unitary examples with nonprincipal polarization built on the M1/M2 carriers. Scheme and quasi-projective realizations over the integral base are the ShimuraCompactifications C5 suffix. No M5 → M6 dependency is introduced.

Planets: Moduli stack at arbitrary level; Coarse moduli space; Field of moduli; Coarse points versus rational families; Hodge line bundle; Finite-field finiteness.

### Level-forgetting and Hecke maps are finite étale

Declaration: **TauCeti.PEL.levelForgettingMaps**. Node: PELModuli:M6/level-forgetting-maps. Kind: theorem.

For open compact H' ⊂ H ⊂ G(Ẑ^□), the forgetful morphism M_{H'} → M_H (M1/hecke-action) is representable, finite and étale. If H is neat and H' ⊲ H, it is a Galois cover of algebraic spaces with group H/H' acting freely by Hecke translation. For g ∈ G(𝔸^{∞,□}), the two maps of the Hecke correspondence M_H ← M_{H ∩ gHg⁻¹} → M_H are finite étale.

Hypotheses: □ good; H' ⊂ H open compact.

Proof or construction:

1. Étale-locally on S, an integral level-H structure lifts to an H'-structure, and the set of lifts is a torsor under H_n/H'_n for n with U^□(n) ⊂ H' (Lan Definition 1.3.7.8): the fibre is a finite étale scheme.
2. Representability by schemes: the fibre over an object is the finite étale scheme of H'-orbits refining α_H.
3. Neat case: H/H' acts on M_{H'} over M_H, freely because objects have no automorphisms (M2/no-automorphisms-at-neat-level), with quotient M_H.

Acceptance: Siegel g = 1: Y(nm) → Y(n) is finite étale Galois with group the kernel of GL₂(ℤ/nm) → GL₂(ℤ/n) (modulo ±1 at non-neat level).

Direct prerequisites: Within this roadmap: M1/hecke-action; M1/level-structure; M2/representability; M2/no-automorphisms-at-neat-level. Other roadmaps and libraries: mathlib:AlgebraicGeometry.Etale; mathlib:AlgebraicGeometry.IsFinite.

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §6, p. 392: “For any compact open subgroup K^p_1 of K^p there is an etale covering S_{K^p_1} → S_{K^p}, sending (A, λ, i, (η̄)_1) to (A, λ, i, η̄), where (η̄)_1 denotes the K^p_1-orbit of η, and this covering map is Galois with Galois group K^p/K^p_1 if K^p_1 is normal in K^p.” (statement (neat levels)). [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.4.3.10, p. 164: “by sending (A, λ, i, [α̂]H0) at level H0 to (A, λ, i, [α̂ ◦ g]H) at level H, if H0 ⊂ H ∩ (gHg−1)” (Hecke maps).

### The PEL moduli stack at arbitrary level and its presentations

Declaration: **TauCeti.PEL.arbitraryLevelStack**. Node: PELModuli:M6/arbitrary-level-stack. Kind: theorem.

Let H ⊂ G(Ẑ^□) be any open compact subgroup (not necessarily neat) and H' ⊲ H a neat open normal subgroup. Then the action of the finite group H/H' on the algebraic space M_{H'} (by Hecke translation) gives an isomorphism of stacks [M_{H'}/(H/H')] ≅ M_H. Consequently M_H is a separated Deligne–Mumford stack, smooth of finite type over S₀, with finite inertia; the presentation is independent of H' up to canonical equivalence. The universal object of M_{H'} descends to the universal object of the stack M_H.

Hypotheses: H open compact; H' ⊲ H neat.

Proof or construction:

1. Quotient stack [M_{H'}/(H/H')] of an algebraic space by a finite group is a DM stack (AlgebraicModuliForArithmeticGeometry R09.4: quotient stacks; RS-27 leaves the PEL instance to this layer).
2. Construct M_{H'} → M_H as an H/H'-torsor of fibred categories (M6/level-forgetting-maps: the fibre is the set of H'-refinements of α_H, an H/H'-torsor), hence [M_{H'}/(H/H')] ≅ M_H.
3. Inertia: Aut of an object is a subgroup of the stabilizer in H/H' (finite); separatedness from M2/isom-scheme.
4. Independence of H': for H'' ⊂ H' both neat normal, the presentations are compatible via M_{H''} → M_{H'}.

Acceptance: Siegel g = 1, H = GL₂(ℤ̂^□) (no level): M_H = [Y(n)/GL₂(ℤ/n)] over ℤ[1/n] for n ≥ 3, the moduli stack of elliptic curves.

Direct prerequisites: Within this roadmap: M6/level-forgetting-maps; M2/representability; M2/isom-scheme; M1/moduli-problem. Other roadmaps and libraries: AlgebraicModuliForArithmeticGeometry:R09.4.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Theorem 1.4.1.12, p. 153: “The moduli problem MH is representable by a smooth separated algebraic stack of finite type over S0.” (stack at arbitrary level (proved there by Artin's criterion directly)). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §6, p. 392: “this covering map is Galois with Galois group K^p/K^p_1 if K^p_1 is normal in K^p” (Galois covers between levels).

### The stack 𝔄_g of principally polarized abelian schemes over ℤ

Declaration: **TauCeti.PEL.siegelStackOverZ**. Node: PELModuli:M6/siegel-stack-over-z. Kind: theorem.

Let 𝔄_g be the fibred category over Sch/ℤ of principally polarized abelian schemes (A, λ) of relative dimension g. Then 𝔄_g is a smooth separated Deligne–Mumford stack of finite type over Spec ℤ of relative dimension g(g+1)/2, with universal abelian scheme A^univ → 𝔄_g. Over ℤ[1/n] (n ≥ 3), 𝔄_g ⊗ ℤ[1/n] ≅ [A_{g,1,n}/GSp_{2g}(ℤ/n)] (M5/siegel-moduli with the Hecke action of G(ℤ/n) = G(Ẑ^□)/U^□(n)), and 𝔄_g is glued from the presentations over ℤ[1/3] and ℤ[1/4].

Hypotheses: g ≥ 1.

Proof or construction:

1. For a principal polarization, the liftability condition at level H = G(Ẑ^□) is automatic (L self-dual), so 𝔄_g ⊗ ℤ[1/n] is M_{G(Ẑ^□)} for the Siegel datum with □ = {p ∤ n}; apply M6/arbitrary-level-stack with H' = U^□(n), n ≥ 3.
2. The open substacks over ℤ[1/3] and ℤ[1/4] cover 𝔄_g and agree on the overlap ℤ[1/12] (both are 𝔄_g ⊗ ℤ[1/12]); the stack property is local on the base (M1/effective-descent).
3. Smoothness and relative dimension from M2/representability and M2/kodaira-spencer-dimension; universal family from M2/universal-family descended (M6/arbitrary-level-stack).

Acceptance: g = 1: 𝔄_1 is the moduli stack of elliptic curves over ℤ.

Direct prerequisites: Within this roadmap: M6/arbitrary-level-stack; M5/siegel-moduli; M1/effective-descent; M2/kodaira-spencer-dimension. 

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Corollary 1.4.1.13, p. 153: “The moduli problem Mn is representable by a smooth separated algebraic stack of finite type over S0. It is representable by an algebraic space if n ≥ 3.” (level-n presentations).

### Finite type of the stack of polarized abelian schemes of degree d² over ℤ

Declaration: **TauCeti.PEL.polarizedStackFiniteType**. Node: PELModuli:M6/polarized-stack-finite-type. Kind: theorem.

For g, d ≥ 1 let 𝔄_{g,d} be the fibred category over Sch/ℤ of abelian schemes of relative dimension g with a polarization of degree d² (no restriction relating d to the residue characteristics). Then 𝔄_{g,d} is an algebraic stack of finite type over Spec ℤ with finite unramified diagonal (a separated Deligne–Mumford stack); over ℤ[1/n], n ≥ 3, its rigidification by full symplectic level-n structure of each type D with d₁⋯d_g = d is an algebraic space of finite type. For p | d the stack is not claimed to be smooth over ℤ_(p).

Hypotheses: g, d ≥ 1.

Proof or construction:

1. Stack and diagonal: M1/effective-descent and M2/isom-scheme apply verbatim (they do not use goodness of primes).
2. Finite type via a bounded projective presentation: étale-locally λ = φ_L for an ample symmetric L with χ(L) = d, L^{⊗3} is very ample with h⁰ = 3^g d, giving embeddings into ℙ^{3^g d − 1} with fixed Hilbert polynomial; the embedded abelian schemes form a locally closed subscheme of a Hilbert scheme (AlgebraicModuliForArithmeticGeometry R09.2) with a PGL-action, and 𝔄_{g,d} is its quotient (R09.4 quotient stacks) — Mumford's geometric-invariant-theory construction as cited by Kottwitz §5.
3. Rigidified level: as in M6/level-forgetting-maps.

Acceptance: d = 1: 𝔄_{g,1} = 𝔄_g (M6/siegel-stack-over-z). For p | d, 𝔄_{g,d} ⊗ 𝔽_p is of finite type but in general not smooth.

Direct prerequisites: Within this roadmap: M1/effective-descent; M2/isom-scheme. Other roadmaps and libraries: AlgebraicModuliForArithmeticGeometry:R09.2; AlgebraicModuliForArithmeticGeometry:R09.4; AbelianSchemesAndArithmeticModuli:A2.

Source evidence: [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 391: “For B = Q this was proved by Mumford [M1] using geometric invariant theory. By forgetting the homomorphism i: O_B → End(A) we get a morphism from our moduli problem to one considered by Mumford” (Mumford's quasi-projective Siegel moduli). [How large is A_g(F_q)?](https://arxiv.org/pdf/1511.02212v1) (Michael Lipnowski, Jacob Tsimerman), §4.1, Remark 4.2, p. 17: “the obstruction to expressing a symmetric homomorphism f as φL for some L → A/k lies in H¹(k, A∨). In particular, if k is a finite field, the vanishing of H¹(k, A∨) implies that f = φL for some line bundle defined over k.” (polarizations come from line bundles over finite fields).

### Coarse moduli spaces of PEL stacks

Declaration: **TauCeti.PEL.coarseModuliSpace**. Node: PELModuli:M6/coarse-moduli-space. Kind: theorem.

For any open compact H, the stack M_H (finite inertia, M6/arbitrary-level-stack) has a coarse moduli space π : M_H → M_H^c: a separated algebraic space of finite type over S₀, universal for morphisms to algebraic spaces, with π bijective on geometric points; π is an isomorphism when H is neat; the formation of M_H^c commutes with flat base change S₀' → S₀ (and with arbitrary base change in the tame case where |H/H'| is invertible). Locally, M_H^c ≅ M_{H'}/(H/H') for a neat normal H'. The same holds for 𝔄_g and 𝔄_{g,d} over ℤ: the coarse space A_g of 𝔄_g satisfies A_g(K̄) = {principally polarized abelian varieties over K̄}/≅ for every algebraically closed field K̄, and a principally polarized A over a field K has a moduli point x_A ∈ A_g(K).

Hypotheses: finite inertia.

Proof or construction:

1. Apply the finite-inertia coarse-space theorem of AlgebraicModuliForArithmeticGeometry R09.5 (RS-27 owner record: PEL coarse spaces are owned here, by R09.5's theorem).
2. For the quotient presentation, M_H^c = M_{H'}/(H/H') (quotient of an algebraic space by a finite group).
3. Base change statements as available in R09.5 (flat; tame); points over algebraically closed fields by bijectivity.

Acceptance: g = 1: the coarse space of 𝔄_1 is the j-line 𝔸¹_ℤ (ModularCurves layer 9E). Neat H: M_H^c = M_H.

Direct prerequisites: Within this roadmap: M6/arbitrary-level-stack; M6/siegel-stack-over-z; M6/polarized-stack-finite-type. Other roadmaps and libraries: AlgebraicModuliForArithmeticGeometry:R09.5; tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Definition A.6.4.1, p. 980: “A coarse moduli space of X is an algebraic space [X] over S, with a S-morphism π : X → [X] such that: 1. Any S-morphism from X to an algebraic space Z over S factors through π” (definition of coarse moduli spaces). [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf) (Jacob Tsimerman), §1, footnote 1, p. 380: “By “field of moduli” here we mean the intersection of all number fields over which the polarized abelian variety A has a model, or alternatively the field over which the point A is defined in the moduli space.” (moduli point of a polarized abelian variety).

### Scheme and quasi-projective realizations over the integral base

Declaration: **TauCeti.PEL.quasiProjectiveRealization**. Node: PELModuli:M6/quasi-projective-realization. Kind: application.

For neat H, the algebraic space M_H over S₀ = Spec O_{F₀,(□)} is a quasi-projective scheme over S₀, and for arbitrary H the coarse space M_H^c is a quasi-projective scheme; the Hodge line bundle (M6/hodge-line-bundle) is ample on the minimal compactification. This suffix consumes ShimuraCompactifications C5 (Lan Corollary 7.2.3.10); the descent obstruction, coarse spaces and level comparisons of this layer are constructed on algebraic spaces and do not depend on it.

Hypotheses: H neat (scheme statement).

Proof or construction:

1. Import quasi-projectivity of M_H from ShimuraCompactifications C5 (integral minimal compactification is projective with ample Hodge line).
2. Coarse space: the quotient of a quasi-projective scheme by a finite group is a quasi-projective scheme.

Acceptance: Siegel: A_{g,1,n} is a quasi-projective scheme over ℤ[1/n] for n ≥ 3 (Mumford).

Direct prerequisites: Within this roadmap: M6/coarse-moduli-space; M6/hodge-line-bundle. Other roadmaps and libraries: ShimuraCompactifications:C5.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.4.1.14, p. 154: “We shall see in Corollary 7.2.3.10, which is a byproduct of an intermediate construction in the proof of Theorem 7.2.4.1, that the MH is actually a quasi-projective scheme when H is neat.” (quasi-projectivity via compactification).

### Field of moduli of a polarized abelian variety with PEL structure

Declaration: **TauCeti.PEL.fieldOfModuli**. Node: PELModuli:M6/field-of-moduli. Kind: definition.

Let k be a field with separable closure k^s and ξ = (A, λ, i, α) an object of M_H (or of 𝔄_g, 𝔄_{g,d}) over k^s. Its field of moduli k(ξ) is the fixed field of the subgroup {σ ∈ Gal(k^s/k) : σ^*ξ ≅ ξ}. Equivalently, k(ξ) is the residue field of the image point of ξ in the coarse space M_H^c (at a point with residue field separable over k). If ξ has a model over a subextension k₁, then k(ξ) ⊂ k₁; a k(ξ)-rational coarse point does not by itself give a model over k(ξ) (M6/forms-and-descent-obstruction).

Hypotheses: k a field.

Proof or construction:

1. Define the stabilizer of the isomorphism class; it is open (ξ is defined over a finite extension).
2. Identify with the residue field of the coarse point: σ fixes the coarse point iff σ^*ξ ≅ ξ (bijectivity of M_H → M_H^c on geometric points).
3. Models give inclusions: if ξ ≅ (ξ₁)_{k^s} with ξ₁ over k₁, then Gal(k^s/k₁) fixes the class.

API:

- `fieldOfModuli` (constructor): k(ξ) := fixed field of Stab(ξ) = {σ : σ^*ξ ≅ ξ}.
- `fieldOfModuli_eq_residue` (characterisation): k(ξ) is the residue field of the coarse point of ξ.
- `fieldOfModuli_le_of_model` (other): A model over k₁ gives k(ξ) ⊂ k₁.
- `fieldOfModuli_galois` (functoriality): k(σ^*ξ) = σ(k(ξ)).
- `fieldOfModuli_fine` (compatibility): If ξ has no automorphisms (neat level), ξ has a model over k(ξ) (M6/forms-and-descent-obstruction).

Unit tests:

- `fieldOfModuli_elliptic` (computation): For E/ℚ̄ an elliptic curve with principal polarization, k(E) = ℚ(j(E)); e.g. j = 1728 gives ℚ.
- `fieldOfModuli_le` (characterisation): If ξ comes from ξ₁ over k₁, then Gal(k^s/k₁) ⊂ Stab(ξ), so k(ξ) ⊂ k₁.
- `fieldOfModuli_twist` (non-example): The field of moduli does not distinguish a curve from its quadratic twist: E and E^d over ℚ (j ≠ 0, 1728) have the same field of moduli ℚ and are non-isomorphic over ℚ (Tau Ceti WeierstrassCurve.j_quadraticTwist, WeierstrassCurve.not_exists_smul_quadraticTwist_eq); a coarse point does not determine a family over the base.
- `fieldOfModuli_base` (degenerate): If ξ is defined over k, k(ξ) = k.

Uses: Tsimerman 2018, §1 and Lemma 4.1: Galois orbits of CM points are bounded below through the field of moduli. PELModuli:M6/bounded-field-of-definition: models over a bounded extension of the field of moduli. FaltingsFinitenessAndIsogenyTheorems:R28.1: moduli points of polarized abelian varieties over number fields.

Acceptance: Elliptic curves over ℚ̄: the field of moduli is ℚ(j).

Direct prerequisites: Within this roadmap: M6/coarse-moduli-space. 

Source evidence: [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf) (Jacob Tsimerman), §1, footnote 1, p. 380: “By “field of moduli” here we mean the intersection of all number fields over which the polarized abelian variety A has a model, or alternatively the field over which the point A is defined in the moduli space.” (definition used by Tsimerman).

### Rational coarse points versus rational families: forms and the descent obstruction

Declaration: **TauCeti.PEL.formsAndDescentObstruction**. Node: PELModuli:M6/forms-and-descent-obstruction. Kind: theorem.

(a) Let ξ be an object of M_H (or 𝔄_g) over a field K and K'/K finite Galois. The K-forms of ξ split by K' (objects ξ' over K with ξ'_{K'} ≅ ξ_{K'}, up to K-isomorphism) are in bijection with the pointed set H¹(Gal(K'/K), Aut_{K'}(ξ_{K'})). (b) For a point x ∈ M_H^c(k), the objects over k mapping to x form the sections of the residual gerbe 𝒢_x → Spec k, a gerbe banded by the finite étale group Aut_{k^s}(ξ_x); x lifts to an object over k iff 𝒢_x is neutral. If objects have no automorphisms (neat H), every k-point of M_H^c = M_H lifts uniquely. (c) Hence, for a level-free stack such as 𝔄_g, a K-rational coarse point is not by itself a polarized abelian variety over K; consumers (R28.1, R35.5) must use objects, or a rigidifying level with its field extension.

Hypotheses: finite inertia (M6/arbitrary-level-stack).

Proof or construction:

1. (a) Galois descent for quasi-projective schemes with ample descent data (M1/effective-descent): a descent datum on ξ_{K'} is a 1-cocycle in Aut_{K'}(ξ); twisting identifies forms with H¹ (standard nonabelian cohomology of a finite group).
2. (b) The residual gerbe of a point of a DM stack with finite inertia (AlgebraicModuliForArithmeticGeometry R09.4 gerbes and residual gerbes; R09.5 coarse spaces); neutral iff it has a section.
3. Neat case: trivial band, so the gerbe is trivial.

Acceptance: For 𝔄_1 over a field of characteristic ≠ 2, 3 every point lifts (WeierstrassCurve.ofJ), and its forms are the quadratic (and, for j = 0, 1728, quartic/sextic) twists, classified by H¹(Gal, Aut(E)).

Direct prerequisites: Within this roadmap: M6/coarse-moduli-space; M6/arbitrary-level-stack; M1/effective-descent. Other roadmaps and libraries: AlgebraicModuliForArithmeticGeometry:R09.4; AlgebraicModuliForArithmeticGeometry:R09.5; mathlib:WeierstrassCurve.ofJ; mathlib:WeierstrassCurve.ofJ_j; tauceti:WeierstrassCurve.j_quadraticTwist; tauceti:WeierstrassCurve.not_exists_smul_quadraticTwist_eq; mathlib:CategoryTheory.PresheafOfGroups.H1.

Source evidence: [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf) (Jacob Tsimerman), Lemma 4.1 proof, p. 384: “Since A equipped with a basis of A[3] is rigid, A is definable over Q(A)′.” (rigid objects descend to their field of moduli). [How large is A_g(F_q)?](https://arxiv.org/pdf/1511.02212v1) (Michael Lipnowski, Jacob Tsimerman), Definition 4.3, p. 17: “An isomorphism of symmetric homomorphisms (f : A → A∨) → (g : B → B∨) is an isomorphism α : A → B for which f = α∗(g) := α∨gα : A → A∨.” (isomorphisms of polarized objects used in counting forms).

### Models over a bounded extension of the field of moduli (level three)

Declaration: **TauCeti.PEL.boundedFieldOfDefinition**. Node: PELModuli:M6/bounded-field-of-definition. Kind: theorem.

Let (A, λ) be a polarized abelian variety of dimension g over ℚ̄ with field of moduli F = ℚ(A, λ) (M6/field-of-moduli). Let F' be the compositum of ℚ(e^{2πi/3}) and the field of moduli of (A, λ) together with a basis of A[3]. Then (A, λ) has a model over F' (rigidity of level 3), all endomorphisms and polarizations of A are defined over F', and [F' : F] ≤ 2·3^{4g²}. The rigidity used is that of the polarized pair with full level 3 (M2/rigidity), not of A alone.

Hypotheses: g ≥ 1; characteristic 0.

Proof or construction:

1. The pair (A, λ) with a full level-3 structure has no automorphisms (M2/rigidity), so its field of moduli is a field of definition (M6/forms-and-descent-obstruction (b) with trivial band).
2. Degree bound: the field of moduli with a basis of A[3] has degree at most |GL_{2g}(𝔽₃)| ≤ 3^{4g²} over F, and adjoining ζ₃ contributes a factor 2.
3. B[3] ≅ Hom(A[3], μ₃) for the dual B is then F'-rational; endomorphisms and polarizations are defined over a field over which A[3] and B[3] are rational (Silverberg's theorem for n ≥ 3, cited by Tsimerman as [19, Prop. 2.3]; requested from AbelianSchemesAndArithmeticModuli A6).

Acceptance: g = 1: F' ⊂ the 3-division field of an elliptic curve over ℚ(j) adjoined ζ₃, degree ≤ 2·|GL₂(𝔽₃)| = 96 ≤ 2·3⁴.

Direct prerequisites: Within this roadmap: M6/field-of-moduli; M6/forms-and-descent-obstruction; M2/rigidity. Other roadmaps and libraries: AbelianSchemesAndArithmeticModuli:A6.

Source evidence: [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf) (Jacob Tsimerman), Lemma 4.1, p. 384: “Then there exists a field Q(A)′ such that all the endomorphisms and polarizations of A are defined over Q(A)′ and [Q(A)′ : Q(A)] ≤ 2 · 3^{4g²}.” (statement). [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf) (Jacob Tsimerman), Lemma 4.1 proof, p. 384: “Let Q(A)′ be the compositum of Q(e^{2πi/3}) and the field of moduli of A equipped with a basis for A[3].” (construction).

### The Hodge bundle and the Hodge line of the universal family

Declaration: **TauCeti.PEL.hodgeBundle**. Node: PELModuli:M6/hodge-line-bundle. Kind: construction.

For an abelian scheme f : A → S with zero section e, ω_{A/S} := e^*Ω¹_{A/S} = f_*Ω¹_{A/S} is locally free of rank g (dual to Lie_{A/S}) and the Hodge line is ω̄_{A/S} := det ω_{A/S} = ∧^g ω_{A/S}. On the stack M_H (or 𝔄_g, 𝔄_{g,d}) the Hodge bundle ω and Hodge line ω̄ of the universal object are vector bundles on the stack, pulled back along classifying maps; on the fine space M_H (H neat) they are bundles on an algebraic space; ω is the Hodge filtration piece of H^1_dR of the universal family (AbelianSchemesAndArithmeticModuli A4). For the Siegel case the Kodaira–Spencer isomorphism gives Sym² ω ≅ Ω¹_{M/S₀} and ω̄^{⊗(g+1)} ≅ Ω^{g(g+1)/2}_{M/S₀}.

Hypotheses: f : A → S an abelian scheme.

Proof or construction:

1. Construct ω_{A/S} and ω̄_{A/S}; base change ω_{A_T/T} ≅ g^*ω_{A/S} for g : T → S because e^*Ω¹ commutes with base change (AbelianSchemesAndArithmeticModuli A4).
2. Descend to the stack via the universal object of M6/arbitrary-level-stack (pullbacks along the presentation are compatible).
3. Kodaira–Spencer for the Siegel datum from M2/kodaira-spencer-dimension; determinant of Sym² of a rank-g bundle is ω̄^{⊗(g+1)}.

API:

- `hodgeBundle` (constructor): ω_{A/S} := e^*Ω¹_{A/S}, locally free of rank g.
- `hodgeLine` (constructor): ω̄_{A/S} := det ω_{A/S}.
- `hodgeBundle_baseChange` (functoriality): ω_{A_T/T} ≅ g^*ω_{A/S} for g : T → S, compatible with composition.
- `hodgeBundle_dual_lie` (characterisation): ω_{A/S} ≅ Lie_{A/S}^∨.
- `hodgeBundle_isogeny` (functoriality): An isogeny φ : A → B induces φ^* : ω_{B/S} → ω_{A/S}, an isomorphism iff φ is étale.
- `hodgeBundle_universal` (data): ω and ω̄ on M_H (stack) and on M_H for neat H, with classify^*ω = ω_{A/S}.
- `hodgeBundle_hodgeFiltration` (compatibility): ω_{A/S} is the Hodge filtration Fil¹ ⊂ H¹_dR(A/S) (cohomological normalization of AbelianSchemesAndArithmeticModuli A4); in the homological normalization 0 → ω_{A^∨/S} → H^dR_1(A/S) → Lie_{A/S} → 0 of Liu–Tian–Xiao–Zhang–Zhu it is the dual of Lie_{A/S}.
- `hodgeLine_ks_siegel` (relation): For the Siegel datum, Sym² ω ≅ Ω¹ and ω̄^{⊗(g+1)} ≅ Ω^{top}.
- `hodgeLine_product` (relation): ω̄_{A×B} ≅ ω̄_A ⊗ ω̄_B.

Unit tests:

- `hodgeLine_g1` (computation): For an elliptic curve E/S, ω̄_{E/S} = ω_{E/S} = e^*Ω¹, and for a Weierstrass curve the class of dx/(2y + a₁x + a₃) trivializes it.
- `hodgeLine_product_test` (characterisation): For A = E₁ × E₂, ω̄_A ≅ ω_{E₁} ⊗ ω_{E₂}.
- `hodgeBundle_frobenius_not_iso` (non-example): For E over 𝔽_p, the relative Frobenius F : E → E^{(p)} induces F^* = 0 on ω: an isogeny need not induce an isomorphism of Hodge bundles.
- `hodgeBundle_zero` (degenerate): For A = 0, ω = 0 and ω̄ = O_S.

Uses: RS-06 owner record: M6 owns the consumer-facing universal family with its Hodge line. ArakelovGeometryAndAbelianHeights:R35.2: the Hodge line is metrized by integration (RS-06 link M6 → R35.2). ArakelovGeometryAndAbelianHeights:R35.5: the modular height is compared with the Faltings height through the Hodge line (RS-06 link M6 → R35.5). ShimuraCompactifications:C5: positivity of the Hodge line gives the minimal compactification.

Acceptance: g = 1: ω̄ = ω and ω^{⊗2} ≅ Ω¹_{Y(n)/ℤ[1/n]}; sections of ω^{⊗k} are weight-k modular forms.

Direct prerequisites: Within this roadmap: M6/arbitrary-level-stack; M2/universal-family; M2/kodaira-spencer-dimension. Other roadmaps and libraries: AbelianSchemesAndArithmeticModuli:A4.

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Proposition 2.3.4.2, p. 269: “KS = KS_{A/S/S0} : Lie∨_{A/S} ⊗_{OS} Lie∨_{A∨/S} → Ω1_{S/S0}” (Kodaira–Spencer in terms of the Hodge bundles). [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3) (Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu), Notation 3.4.1, p. 29 (arXiv v3): “We have the following Hodge exact sequence 0 → ω_{A∨/S} → H^dR_1(A/S) → Lie_{A/S} → 0” (Hodge sequence (homological)).

### The arithmetic moduli interface exported to heights and finiteness

Declaration: **TauCeti.PEL.PELModuli.classifyingMap**. Node: PELModuli:M6/universal-family-export. Kind: construction.

The interface consists of: (1) the stacks M_H, 𝔄_g, 𝔄_{g,d} with their universal objects (A^univ, λ^univ, i^univ, α^univ) and Hodge bundles; (2) for every object ξ over S, the classifying morphism c_ξ : S → M_H with c_ξ^*(A^univ, ω̄) ≅ (A_ξ, ω̄_{A_ξ}); (3) for a polarized A over a field K, its moduli point x_A ∈ M^c(K); (4) for a neat rigidifying level H' ⊂ H and an object over K, the finite extension K' over which a level-H' structure exists and the K'-point of the fine space M_{H'}; (5) the descent comparison of M6/forms-and-descent-obstruction. Consumers receive objects over K, not merely K-points of coarse spaces.

Hypotheses: as in the constituent nodes.

Proof or construction:

1. Assemble the outputs of M6/arbitrary-level-stack, M6/coarse-moduli-space, M6/hodge-line-bundle and M6/forms-and-descent-obstruction.
2. Rigidifying extension: the level-H' structures on A_K form a finite étale K-scheme (M6/level-forgetting-maps); a K'-point gives the fine-space point.

API:

- `PELModuli.classifyingMap` (universal-property): c_ξ : S → M_H with c_ξ^*(universal) ≅ ξ (2-categorical uniqueness).
- `PELModuli.moduliPoint` (projection): x_A ∈ M^c(K) for an object over a field K.
- `PELModuli.rigidifyingExtension` (data): K' = field of definition of a level-H' structure on A_K; [K' : K] ≤ [H : H'].
- `PELModuli.hodgeLine_classify` (compatibility): c_ξ^* ω̄^univ ≅ ω̄_{A_ξ}.
- `PELModuli.export_obstruction` (relation): A K-point of M^c lifts to an object over K iff the residual gerbe is neutral (M6/forms-and-descent-obstruction).
- `PELModuli.export_siegel` (example): For 𝔄_g over ℤ: the universal principally polarized abelian scheme, its Hodge line and the coarse space A_g.

Unit tests:

- `export_classify_universal` (characterisation): c_{universal} = id_{M_H}.
- `export_g1_point` (computation): For E: y² = x³ − x over ℚ (j = 1728), x_E = 1728 ∈ A_1(ℚ) = 𝔸¹(ℚ).
- `export_not_family` (non-example): A morphism Spec K → A_g (coarse) does not determine an object over K: for g = 1 the quadratic twists of E give the same K-point (Tau Ceti WeierstrassCurve.j_quadraticTwist).
- `export_trivial_level` (degenerate): For H = H' neat, K' = K and the moduli point is the fine point.

Uses: FaltingsFinitenessAndIsogenyTheorems:R28.1: the stack 𝔄_g over ℤ, its universal family, Hodge line, coarse space and the descent comparison (request (i)–(ii)). FaltingsFinitenessAndIsogenyTheorems:R28.2: RS-06 link M6 → R28.2. ArakelovGeometryAndAbelianHeights:R35.3: RS-06 link M6 → R35.3. ArakelovGeometryAndAbelianHeights:R35.6: RS-06 link M6 → R35.6. StableReductionPartII:MC.6: fine principally polarized level-N moduli with universal family over ℤ[1/N, ζ_N] (request).

Acceptance: For an elliptic curve E over a number field K and n = 3, K' = K(E[3]) and the K'-point of Y(3).

Direct prerequisites: Within this roadmap: M6/arbitrary-level-stack; M6/coarse-moduli-space; M6/hodge-line-bundle; M6/forms-and-descent-obstruction; M6/level-forgetting-maps; M6/siegel-stack-over-z; M6/polarized-stack-finite-type. 

Source evidence: [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf) (Jacob Tsimerman), Lemma 4.1 proof, p. 384: “Let Q(A)′ be the compositum of Q(e^{2πi/3}) and the field of moduli of A equipped with a basis for A[3].” (rigidifying extension in practice). [Points on some Shimura varieties over finite fields](https://www.ams.org/journals/jams/1992-05-02/S0894-0347-1992-1124982-1/S0894-0347-1992-1124982-1.pdf) (Robert E. Kottwitz), §5, p. 391: “For sufficiently small K^p this moduli problem is representable by a quasi-projective scheme S_{K^p} over O_E ⊗_Z Z_(p).” (fine moduli at small level).

### Finiteness over a finite field at fixed dimension and polarization degree

Declaration: **TauCeti.PEL.finiteFieldFiniteness**. Node: PELModuli:M6/finite-field-finiteness. Kind: theorem.

For a finite field k, and integers g, d ≥ 1, there are only finitely many k-isomorphism classes of abelian varieties B over k of dimension g that admit a polarization of degree d² defined over k (including when char k divides d). Finiteness after forgetting the degree constraint is not asserted here.

Hypotheses: k finite.

Proof or construction:

1. (B, λ) gives a k-point of the coarse space of 𝔄_{g,d} ⊗ 𝔽_p, a separated algebraic space of finite type (M6/polarized-stack-finite-type, M6/coarse-moduli-space), which has finitely many k-points.
2. Each coarse point has finitely many k-forms: they are classified by H¹(Gal(k̄/k), Aut_{k̄}(B, λ)) (M6/forms-and-descent-obstruction (a)), finite because Aut(B, λ) is finite (AbelianSchemesAndArithmeticModuli:A6/automorphisms-of-polarized-abelian-varieties) and H¹(Ẑ, finite group) is a set of twisted conjugacy classes.
3. Forgetting λ maps finitely many (B, λ) onto the set of B in question.

Acceptance: g = 1, d = 1, char k ≥ 5: finitely many elliptic curves over 𝔽_q (at most 2q + 6 classes).

Direct prerequisites: Within this roadmap: M6/polarized-stack-finite-type; M6/coarse-moduli-space; M6/forms-and-descent-obstruction. Other roadmaps and libraries: AbelianSchemesAndArithmeticModuli:A6/automorphisms-of-polarized-abelian-varieties.

Source evidence: [How large is A_g(F_q)?](https://arxiv.org/pdf/1511.02212v1) (Michael Lipnowski, Jacob Tsimerman), Remark 4.2, p. 17: “In particular, if k is a finite field, the vanishing of H¹(k, A∨) implies that f = φL for some line bundle defined over k.” (polarizations over finite fields). [How large is A_g(F_q)?](https://arxiv.org/pdf/1511.02212v1) (Michael Lipnowski, Jacob Tsimerman), Corollary 2.2, p. 5: “There are at most (2g)^g q^{(1/4)g(g+1)} isogeny classes of abelian varieties over Fq.” (context: counting starts from finiteness statements).

### Explicit nonempty Siegel and unitary arithmetic moduli with nonprincipal polarization

Declaration: **TauCeti.PEL.nonemptyExamples**. Node: PELModuli:M6/nonempty-examples. Kind: application.

(a) Let L_{(1,d)} = ℤ⁴ with ⟨e₁, f₁⟩ = 1, ⟨e₂, f₂⟩ = d (an integral PEL datum with O = ℤ, M0/integral-pel-datum; its calculations are not repeated from M5). For elliptic curves E₁, E₂ over ℚ and d ≥ 1, (E₁ × E₂, λ_{E₁} × dλ_{E₂}) is a polarized abelian surface of type (1, d) over ℚ, giving a ℚ-point of 𝔄_{2,d} (an object, not only a coarse point) and, after the finite extension ℚ(E₁[n], E₂[n], ζ_n), a point of A_{2,(1,d),n}. (b) For K imaginary quadratic of class number one, E an elliptic curve over ℚ with CM by O_K (with its O_K-action defined over K), and a prime p unramified in K, the object (E × Ē', λ_E × pλ_{Ē'}) with O_K acting through the CM on E and through the conjugate action on a second copy Ē' gives a K-point of the unitary moduli problem of signature (1, 1) and lattice O_K ⊕ pO_K (nonprincipal at p).

Hypotheses: as stated.

Proof or construction:

1. Check the PEL conditions directly on the M1 carriers (RS-23: these examples test the arithmetic comparison and do not import M5): polarization type via kernels, Rosati condition (complex conjugation on O_K), determinant condition (signature from the two actions).
2. Level structures exist over the stated finite extensions (M6/universal-family-export (4)).

Acceptance: The points are objects over the stated fields, so M6/forms-and-descent-obstruction is not needed to produce them.

Direct prerequisites: Within this roadmap: M0/integral-pel-datum; M0/hermitian-space; M0/skew-hermitian-space; M1/pel-abelian-scheme; M1/moduli-problem; M6/universal-family-export; M6/polarized-stack-finite-type. 

Source evidence: [Arithmetic compactifications of PEL-type Shimura varieties (Harvard PhD thesis, May 2008); revised and published as London Mathematical Society Monographs 36, Princeton University Press, 2013](https://mail.marktomforde.com/academic/miscellaneous/images/Lan-thesis.pdf) (Kai-Wen Lan), Remark 1.4.3.13, pp. 165–166: “Conversely, if we have some PEL-type O-lattice (L, ⟨·,·⟩), then we can define a complex abelian variety by taking the real torus (L ⊗ R)/L with complex structure given by any map h” (nonemptiness from the lattice).

Dependencies of M6: AbelianSchemesAndArithmeticModuli:A2, AbelianSchemesAndArithmeticModuli:A4, AbelianSchemesAndArithmeticModuli:A6, AlgebraicModuliForArithmeticGeometry:R09.2, AlgebraicModuliForArithmeticGeometry:R09.4, AlgebraicModuliForArithmeticGeometry:R09.5, PELModuli:M0, PELModuli:M1, PELModuli:M2, PELModuli:M5, ShimuraCompactifications:C5, tauceti:TauCetiRoadmap.

Coverage of M6: **planned**. Remaining refinements: M6/polarized-stack-finite-type rests on gap 'Finite type of the stack of polarized abelian schemes including p | d' (Mumford's GIT construction not read) and on the request to AbelianSchemesAndArithmeticModuli A2 for very ampleness of L^{⊗3}. M6/bounded-field-of-definition rests on the request to AbelianSchemesAndArithmeticModuli A6 for Silverberg's field-of-definition theorem. M6/quasi-projective-realization is the C5 suffix (RS-23); it is planned here only as an import.

Acceptance tests for M6: (Level-forgetting and Hecke maps are finite étale) Siegel g = 1: Y(nm) → Y(n) is finite étale Galois with group the kernel of GL₂(ℤ/nm) → GL₂(ℤ/n) (modulo ±1 at non-neat level). (The PEL moduli stack at arbitrary level and its presentations) Siegel g = 1, H = GL₂(ℤ̂^□) (no level): M_H = [Y(n)/GL₂(ℤ/n)] over ℤ[1/n] for n ≥ 3, the moduli stack of elliptic curves. (The stack 𝔄_g of principally polarized abelian schemes over ℤ) g = 1: 𝔄_1 is the moduli stack of elliptic curves over ℤ. (Finite type of the stack of polarized abelian schemes of degree d² over ℤ) d = 1: 𝔄_{g,1} = 𝔄_g (M6/siegel-stack-over-z). (Coarse moduli spaces of PEL stacks) g = 1: the coarse space of 𝔄_1 is the j-line 𝔸¹_ℤ (ModularCurves layer 9E). (Scheme and quasi-projective realizations over the integral base) Siegel: A_{g,1,n} is a quasi-projective scheme over ℤ[1/n] for n ≥ 3 (Mumford). (Field of moduli of a polarized abelian variety with PEL structure) Elliptic curves over ℚ̄: the field of moduli is ℚ(j). (Rational coarse points versus rational families: forms and the descent obstruction) For 𝔄_1 over a field of characteristic ≠ 2, 3 every point lifts (WeierstrassCurve.ofJ), and its forms are the quadratic (and, for j = 0, 1728, quartic/sextic) twists, classified by H¹(Gal, Aut(E)). (Models over a bounded extension of the field of moduli (level three)) g = 1: F' ⊂ the 3-division field of an elliptic curve over ℚ(j) adjoined ζ₃, degree ≤ 2·|GL₂(𝔽₃)| = 96 ≤ 2·3⁴. (The Hodge bundle and the Hodge line of the universal family) g = 1: ω̄ = ω and ω^{⊗2} ≅ Ω¹_{Y(n)/ℤ[1/n]}; sections of ω^{⊗k} are weight-k modular forms. (The arithmetic moduli interface exported to heights and finiteness) For an elliptic curve E over a number field K and n = 3, K' = K(E[3]) and the K'-point of Y(3). (Finiteness over a finite field at fixed dimension and polarization degree) g = 1, d = 1, char k ≥ 5: finitely many elliptic curves over 𝔽_q (at most 2q + 6 classes). (Explicit nonempty Siegel and unitary arithmetic moduli with nonprincipal polarization) The points are objects over the stated fields, so M6/forms-and-descent-obstruction is not needed to produce them.

## Gaps

- **Nonabelian Galois cohomology, ker¹ and the Hasse principle** (needed by M3/ker1-classification, M3/hasse-principle-cases, M0/rank-one-skew-hermitian-classification, M3/type-d-comparison): AdelicAlgebraicGroups AA.4 (merged 2026-10-06) plans G-torsors over a field, Kneser's vanishing H¹(F_v, G) = 1 and the Hasse principle for semisimple simply connected G (its own gap records their proofs); M3/hasse-principle-cases imports those nodes. No atlas layer owns the rest of the Galois cohomology of linear algebraic groups that this roadmap uses: the twisting classification of forms of a skew-Hermitian B-module by H¹(ℚ, G) for connected reductive (not simply connected) G, ker¹(ℚ, G) as a pointed set and its finiteness (Borel–Serre, cited by Kottwitz as [BS]), Kottwitz's ker¹(ℚ, G) = ker¹(ℚ, G/G^der) for G with simply connected derived group, and Tate–Nakayama duality for ker¹ and ker² of tori. Mathlib's CategoryTheory.PresheafOfGroups.H1 is a Čech-type nonabelian H¹ (a near miss) and Tau Ceti's ContCohomology.H1 has abelian coefficients only. EndoscopicTransferAndUnitaryTraceComparison ET.0/ET.5 and LTXZZ Remark 3.5.2 need the same inputs. A restructure entry proposes an owner.
- **Type D comparison with the identity component** (needed by M3/type-d-comparison): For PEL data with a type D factor the similitude group is disconnected and the Hasse principle fails; the comparison of the moduli problem with Shimura varieties of G° (indexing by ker¹(ℚ, G) and π₀(G), and the action of the component group) is not proved in any source read here: Kottwitz excludes Case D from §14 on, Lan Remark 1.4.4.3 only warns, Milne §8 footnote 54 states the naive replacement fails. A source such as Lan's 'Example-based introduction to Shimura varieties' §5.1.3 (not obtained: the author's site refused access) is needed.
- **Wedhorn's ordinariness theorem** (needed by M2/wedhorn-ordinary-density): Wedhorn, Ordinariness in good reductions of Shimura varieties of PEL type, Ann. Sci. ÉNS 32 (1999), Theorem 1.6.3 is cited through Bijakowski–Pilloni–Stroh Remark 1.5.1; the paper was not obtained (numdam returned a landing page). Its proof needs the μ-ordinary Newton/Ekedahl–Oort stratum and Moonen's classification of Dieudonné modules with PEL structure, whose owners (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2, IgusaVarietiesAndTorsionConcentration IG.0) are downstream or partial; the node records the statement and route only.
- **Finite type of the stack of polarized abelian schemes including p | d** (needed by M6/polarized-stack-finite-type, M6/finite-field-finiteness): The finite-type statement over ℤ for polarizations of degree d² (needed by Lipnowski–Tsimerman with p | d allowed) is Mumford's geometric-invariant-theory construction, cited by Kottwitz §5; GIT was not read. The planned route (Hilbert scheme of abelian schemes embedded by L^{⊗3} and its PGL-quotient) needs very ampleness of L^{⊗3} with h⁰ = 3^g d (requested from AbelianSchemesAndArithmeticModuli A2) and Hilbert schemes of AlgebraicModuliForArithmeticGeometry R09.2.
- **Analytic spaces and analytification carrier** (needed by M3/uniformization-morphism, M3/algebraization-of-components): RT-AREA-algebraicgeometry/3 (confirmed): complex analytic spaces with nilpotents, their morphisms and fibre products, and the analytification functor have no planned owner. This packet uses ComplexComparisonPartII:C0/repair-analytification (pending review) and the 'analytification on étale presentations' clause of AlgebraicModuliForArithmeticGeometry A0-extension, and requests the carrier from ComplexComparisonPartII C0 (option (i) of the finding: a first layer before C0).

## Requests to other roadmaps

- AbelianSchemesAndArithmeticModuli:A1: Abelian schemes over a base with rigidity (an endomorphism trivial on all geometric fibres is trivial), homomorphisms, products and base change; one-dimensional abelian schemes are the elliptic curves of #81 compatibly with group laws. (for M1/pel-abelian-scheme, M2/rigidity, M5/genus-one-comparison)
- AbelianSchemesAndArithmeticModuli:A2: Dual abelian schemes, the Poincaré sheaf and φ_L; polarizations with positivity and the relatively ample sheaf (1, λ)^*P; symmetric homomorphisms and Rosati involutions (A2/rosati-involution); for an ample symmetric L with χ(L) = d, L^{⊗3} very ample with h⁰ = 3^g·d. (for M1/prime-to-box-quasi-isogeny, M1/pel-abelian-scheme, M1/effective-descent, M2/isom-scheme, M2/effectivity, M6/polarized-stack-finite-type)
- AbelianSchemesAndArithmeticModuli:A3: Isogenies and dual isogenies; [n] finite locally free of rank n^{2g}, étale when n is invertible; the Weil pairing e^λ on A[n] and on Tate modules with values in μ_n and T G_m (Tate twist kept). (for M1/prime-to-box-quasi-isogeny, M1/symplectic-isom-sheaf, M1/principal-level-structure)
- AbelianSchemesAndArithmeticModuli:A4: Relative H¹_dR (and homological H^dR_1) with the Hodge exact sequence, Gauss–Manin connection and Kodaira–Spencer map; the étale Tate-module local system for ℓ invertible; Serre–Tate and Grothendieck–Messing deformation theory with endomorphism and polarization structures. (for M1/pel-abelian-scheme, M1/unitary-of-abelian-scheme, M1/symplectic-isom-sheaf, M2/deformation-prorepresentable, M2/formal-smoothness, M2/kodaira-spencer-dimension, M2/unitary-deformation, M2/isogeny-kernel-ranks, M6/hodge-line-bundle)
- AbelianSchemesAndArithmeticModuli:A5: Riemann's theorem: polarizable integral Hodge structures of type {(−1,0),(0,−1)} ↔ complex abelian varieties with polarization, its relative version for analytic families, and the Siegel universal analytic family with level. (for M3/complex-points, M3/uniformization-morphism)
- AbelianSchemesAndArithmeticModuli:A6: Silverberg's theorem: for n ≥ 3 all endomorphisms (and polarizations) of an abelian variety over a field of characteristic 0 are defined over the field of definition of A[n] (and of the dual A^∨[n]); used in Tsimerman's Lemma 4.1 as [19, Prop. 2.3]. (for M6/bounded-field-of-definition)
- AlgebraicModuliForArithmeticGeometry:A0-extension: Artin's representability criterion for categories fibred in groupoids over locally noetherian schemes over an excellent Dedekind base, as a conditional theorem with all hypotheses (stack, limit preservation, representable Isom, effective prorepresentability, openness of versality); Grothendieck existence for formal schemes with ample sheaves; analytification on étale presentations with descent of local-isomorphism comparisons; finiteness of normalization under excellence. (for M2/representability, M2/effectivity, M3/uniformization-morphism, M3/algebraization-of-components, M4/normalization-finite-normal-flat)
- AlgebraicModuliForArithmeticGeometry:R09.2: Hilbert schemes of projective schemes with fixed Hilbert polynomial and Hom/Isom schemes of projective schemes via graphs; End_S(A) representable by a disjoint union of projective schemes for projective abelian schemes. (for M2/isom-scheme, M6/polarized-stack-finite-type)
- AlgebraicModuliForArithmeticGeometry:R09.3: Effective fpqc descent of quasi-coherent modules and of quasi-projective schemes with ample descent data. (for M1/effective-descent)
- AlgebraicModuliForArithmeticGeometry:R09.4: Algebraic and Deligne–Mumford stacks on the D0 carrier, quotient stacks [X/Γ] of algebraic spaces by finite groups, and residual gerbes of points of DM stacks with finite inertia. (for M1/effective-descent, M2/representability, M6/arbitrary-level-stack, M6/polarized-stack-finite-type, M6/forms-and-descent-obstruction)
- AlgebraicModuliForArithmeticGeometry:R09.5: Coarse moduli spaces of algebraic stacks with finite inertia (Keel–Mori), with flat (and tame) base change, bijective on geometric points. (for M6/coarse-moduli-space, M6/forms-and-descent-obstruction)
- AlgebraicModuliForArithmeticGeometry:R09.6: Comparison of the deformation functor at a point of an algebraic stack with the completed local ring (versality), used with Schlessinger's criterion. (for M2/deformation-prorepresentable)
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2: Covariant Dieudonné crystals of p-divisible groups with Frobenius and Verschiebung on H^dR_1 (LTXZZ Notations 3.4.9–3.4.11), local freeness of 𝔻(G)/ϖ𝔻(G) of rank equal to the height (Berthelot–Breen–Messing Proposition 4.3.1), Dieudonné modules over perfect fields with the polarization pairing; Newton slopes for the μ-ordinary analysis. (for M2/isogeny-kernel-ranks, M2/wedhorn-ordinary-density)
- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6: Grothendieck–Messing deformation theory over nilpotent PD thickenings in the form 'deformations ↔ lifts of the Hodge filtration', compatible with endomorphisms and polarizations. (for M2/formal-smoothness, M2/unitary-deformation)
- NeronModelsAndSemistableAbelianVarieties:R11.1: Néron models over DVRs and extension of homomorphisms/isomorphisms of abelian varieties with good reduction. (for M2/isom-scheme, M2/properness-when-division)
- NeronModelsAndSemistableAbelianVarieties:R11.3: Semistable reduction after a finite extension and the toric part of the special fibre of the Néron model with its character group as an End-module. (for M2/properness-when-division)
- ShimuraVarieties:V0: Neat arithmetic groups, strong approximation and the component decomposition G(ℚ)\(X × G(𝔸_f)/K) = ⊔ Γ_g\X⁺. (for M3/uniformization-morphism, M3/siegel-fine-uniformization)
- ShimuraVarieties:V1: The complex-manifold structure on G(ℚ)\(X × G(𝔸_f)/K) at neat level with level maps and Hecke translations. (for M3/uniformization-morphism)
- ShimuraVarieties:V2: The Baily–Borel quasi-projective algebraic structure on Sh_K(G, X)_ℂ. (for M3/algebraization-of-components)
- ShimuraVarieties:V3: Borel's algebraicity theorem for holomorphic maps from smooth quasi-projective varieties to arithmetic quotients at neat level. (for M3/algebraization-of-components)
- ShimuraVarieties:V4: The canonical-model condition with the reflex-norm reciprocity on special points and its uniqueness, with the Artin normalization recorded. (for M4/cm-points-reciprocity, M4/canonical-model-identification)
- ShimuraVarieties:V5: The main theorem of complex multiplication for CM abelian varieties with polarization and level structure, in the normalization of V4. (for M4/cm-points-reciprocity)
- ShimuraVarieties:V6: Canonical models of Hodge-type Shimura data and their compatibility with the Siegel embedding. (for M4/canonical-model-identification, M4/canonical-model-functoriality)
- ComplexComparisonPartII:C0: The carrier of complex analytic spaces with nilpotents, open and closed subspaces, gluing and fibre products, and the analytification functor representing Hom(−, X) for finite-type ℂ-schemes (RT-AREA-algebraicgeometry/3, option (i)). (for M3/uniformization-morphism)
- ComplexComparisonPartII:C3: Proper coherent GAGA and its extension to algebraic spaces of finite presentation, used for comparison of étaleness and of morphisms. (for M3/algebraization-of-components)
- ComplexComparisonPartII:C4: Algebraicity of holomorphic maps from proper schemes and Chow's theorem. (for M3/algebraization-of-components)
- ShimuraCompactifications:C5: Quasi-projectivity of the integral PEL moduli at neat level (Lan Corollary 7.2.3.10) and ampleness of the Hodge line on the minimal compactification. (for M6/quasi-projective-realization)
- HilbertModularVarietiesAndShimuraCurves:H0: The integral trace-lattice and different refinement of D5's rational Hilbert data. (for M5/hilbert-example-acceptance)
- HilbertModularVarietiesAndShimuraCurves:H1: The polarization-module trace-pairing PEL instance and Hilbert–Blumenthal moduli functor. (for M5/hilbert-example-acceptance)
- SchemeAndStackFoundations:SF.2: Étale cohomology with compact supports and the trace map H^{2d}_c(Y, L(d)) → L for smooth connected Y of dimension d over an algebraically closed field, L prime to the characteristic. (for M4/torus-groupoid-trace)
- tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields: The cyclic Hasse norm theorem (cyclicHasseNorm) for CM extensions F/F₀, used for ker¹ of norm tori. (for M3/hasse-principle-cases, M0/rank-one-skew-hermitian-classification)
- tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out: Effective descent for polarized (projective) schemes with ample descent data. (for M1/effective-descent)
- tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing: The scheme-theoretic Weil pairing on E[n] with its sign convention. (for M5/genus-one-comparison)
- tauceti:TauCetiRoadmap/ModularCurves#3c-the-four-level-structures: Full level-n (Drinfeld/[Γ(n)]) structures on elliptic curves. (for M5/genus-one-comparison)
- tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing: The fine moduli scheme Y(n, ζ) of full ordered bases with fixed Weil pairing over ℤ[1/n, ζ_n]. (for M5/genus-one-comparison)
- tauceti:TauCetiRoadmap/ModularCurves#7d-universal-deformations-of-elliptic-curves: Universal deformations of elliptic curves over W(k)[[t]]. (for M2/deformation-prorepresentable)
- tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n: The coarse j-line as coarse space of the elliptic moduli stack. (for M6/coarse-moduli-space)

## Proposed restructuring

- rescope (AdelicAlgebraicGroups, ArithmeticGaloisDuality, PELModuli, EndoscopicTransferAndUnitaryTraceComparison): AdelicAlgebraicGroups AA.4 now plans G-torsors, Kneser's local vanishing and the Hasse principle for simply connected groups. The remaining Galois cohomology of linear algebraic groups (nonabelian H¹(k, G) for connected reductive G over local and global fields, ker¹ and its finiteness, ker¹(ℚ, G) = ker¹(ℚ, G/G^der) when G^der is simply connected, Tate–Nakayama for ker¹ and ker² of tori) is used by PELModuli M0/M3, EndoscopicTransferAndUnitaryTraceComparison ET.0/ET.5 and LTXZZ Remark 3.5.2, but owned by no layer (gap recorded in this packet). Proposal: Extend AdelicAlgebraicGroups AA.4, next to its torsor, Kneser and simply connected Hasse-principle nodes, by these statements for connected reductive groups and tori over number fields and their completions; PELModuli M0 and M3 and ET.0 import them. If AA.4 is to stay with approximation and level maps, add the same content as a layer of ArithmeticGaloisDuality after R02.4 (continuous cochains and Poitou–Tate).
- rescope (PELModuli): M0 contains both the generic PEL linear algebra (Kottwitz/Lan) and the unitary/CM hermitian data routed from Liu–Tian–Xiao–Zhang–Zhu; the atlas would read better with two sub-layers. Proposal: Sub-layer M0a 'PEL data, determinant condition and reflex field' with nodes positive-involution, albert-types, order-discriminant, symplectic-o-lattice, integral-pel-datum, rational-pel-datum, similitude-group, similitude-group-structure, good-primes, hodge-structure-of-datum, pel-shimura-datum, signatures, determinant-polynomial, determinant-classifies, reflex-field, reflex-field-comparison, determinant-condition, determinant-condition-splitting, self-dual-lattice-classification, bps-signature-constancy; sub-layer M0b 'Hermitian and CM linear algebra' with hermitian-space, skew-hermitian-space, rank-one-skew-hermitian-classification, generalized-cm-type, reflexive-closure, unramified-tau-decomposition.
- rescope (PELModuli, AdelicAlgebraicGroups, ComplexComparisonPartII, AlgebraicModuliForArithmeticGeometry, NeronModelsAndSemistableAbelianVarieties, ShimuraVarieties, ShimuraCompactifications, SchemeAndStackFoundations): The packet's prerequisites imply stage links not yet in the atlas; all were checked acyclic against data/atlas.json stage edges plus accepted restructuring links (2026-10-06). Proposal: Add links: AdelicAlgebraicGroups AA.4 → PELModuli M3; ComplexComparisonPartII C0 → PELModuli M3, conditional on a separately owned analytic carrier before C0 (RT-AREA-algebraicgeometry/3); its local faithful flatness interface supplies étaleness comparison; AlgebraicModuliForArithmeticGeometry A0-extension → M2, M3, M4; R09.2 → M6; R09.3, R09.4 → M1; R09.4 → M2, M6; R09.5 → M6; R09.6 → M2; NeronModelsAndSemistableAbelianVarieties R11.1, R11.3 → M2; ShimuraVarieties V0, V1, V2 → M3 and V4, V5 → M4; ShimuraCompactifications C5 → M6 (the quasi-projective suffix only, RS-23); SchemeAndStackFoundations SF.2 → M4; AbelianSchemesAndArithmeticModuli A1, A2, A3, A4 → M1, A1, A2, A6 → M2, A2, A4 → M6, A1 → M5. No M5 → M6 link is introduced (RS-23).

## Mistakes found in the sources

- PELModuli/E1 (gap, milne-isv, §8, 'PEL data' and 'PEL Shimura varieties', pp. 87–88 (2017 revision)): printed “As h is nontrivial, SV3 follows from the fact that G^ad is simple. [...] The pair (G, X) satisfies the conditions SV1–4.” Correction: SV3 holds only when the projection of h to every ℚ-simple factor of G^ad is nontrivial. For a simple PEL datum of type (A) whose hermitian form is definite at every real place (signature (n, 0) everywhere), h(ℂ^×) is central, its projection to the ℚ-simple group G^ad = PU is trivial and G^ad(ℝ) is compact, so SV3 fails and (G, X) is not a Shimura datum (X is a point). Reason: For signature (n, 0) at every τ, h(z) acts on V ⊗_{K,τ} ℂ by z and on the conjugate part by z̄, i.e. through the centre K ⊗ ℝ = ∏ ℂ of End_B(V ⊗ ℝ); so ad ∘ h is trivial, while Milne's axiom SV3 (§5) reads 'G^ad has no ℚ-factor on which the projection of h is trivial'. 'h nontrivial' as a map to G does not imply nontrivial in G^ad. Affects: a stated result; known: new.

## Red-team finding handled

RT-AREA-algebraicgeometry/3 (high, missing): the carrier of complex analytic spaces and the analytification functor has no planned owner. M3 imports analytification only through ComplexComparisonPartII:C0/repair-analytification and the étale-presentation analytification clause of AlgebraicModuliForArithmeticGeometry A0-extension, requests the carrier from ComplexComparisonPartII C0 (the finding's option (i)), records the gap 'Analytic spaces and analytification carrier', and proposes the link C0 → M3; the link is acyclic against the current graph.

