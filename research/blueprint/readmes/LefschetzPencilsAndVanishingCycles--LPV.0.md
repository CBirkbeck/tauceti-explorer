# Lefschetz pencils, nearby cycles and vanishing cycles — LPV.0–6

This roadmap constructs trait nearby and vanishing cycles, their inertia and monodromy calculus, algebraic Picard–Lefschetz theory, sufficiently ample pencils and their middle cohomology, geometric open monodromy, and the perverse comparison interfaces used by the Igusa programme. LPV.7 owns the general invariant-cycle and semistable-family exports. The early two-component calculation required by the algebraic local formula belongs to LPV.1.

This is revision 2 of the target-level plan. Every original target and all 89 node ids are retained. All seven stages are planned, with precise source and supplier-form gaps; none is closed. The inherited independent review remains unchanged and the revision awaits a new review. The document is definitive. The suggested file distinguishes actual algebraic specializations from omitted geometric signatures; a documented name is not an elaborated API or successful unit test. All implementation statuses are unchecked.

## Conventions and ownership

Fix a henselian discrete valuation trait with geometric generic and closed points, and a prime ℓ invertible on it. Work first with finite coefficients of invertible order, then with compatible systems using derived adic realization and rationalization under uniform amplitude and inverse-limit hypotheses. RΨ uses the geometric generic immersion; the specialization triangle is i*K→RΨK→RΦK. An algebraic comma category of triples is only a degree-zero model: continuous inertia and residue-Galois descent are part of the actual sheaf/gluing equivalence.

Keep Tate lines until a basis is explicitly chosen. With geometric Frobenius the resulting matrix convention is NF=qFN. A finite logarithm is taken only after unipotence has been proved. The monodromy filtration is increasing with the specified centre c. Primitive parts use Deligne’s lower-weight kernel convention; reconstruction uses inverse opposite-graded powers before further lowering. Normal-crossings residues commute because their tame Kummer action commutes. Coordinate independence of a cofinal tower does not identify restrictions for different divisor equations; the intrinsic object lives on the normal-bundle torsor.

The quadratic polar form is Q(x+y)−Q(x)−Q(y). Ordinary forms have positive locally free rank and a smooth projective quadric; the characteristic-two odd-rank case permits a one-dimensional polar kernel on which Q is nonzero. Over a field this agrees with Mathlib’s quadratic nondegeneracy on a nonzero module, rather than with polar nondegeneracy in every characteristic. Ordinary completed local germs use a k-algebra isomorphism with Q plus terms of order at least three. Identifying an arbitrary germ with its pure quadratic cone requires the source’s extra normal-form hypotheses.

A fibre has dimension n. A vanishing generator lies in Hⁿ(m), with n=2m or 2m+1. For n modulo four equal to 0,1,2,3 the local Picard–Lefschetz coefficient is −,−,+,+ and its square is 2,0,−2,0. Cup product followed by trace has target Q_l(−n). In dimension zero the nearby and costalk objects have rank two and the vanishing line is coker(Λ→Λ²); replacing it by the traceless kernel requires two invertible. Fix an integral orientation before simultaneous coefficient reduction: norm alone modulo a composite modulus does not select one global sign.

For the pencil U=P¹−S, E is the span of all transported local cycles, not of untransported arbitrary vectors. The odd symplectic representation is on E/(E∩E⊥), with its zero case separate. Mathlib’s right orthogonal is reconciled with the cup-product convention by symmetry or alternation. Openness refers to the canonical topology over the fixed Q_l form. The even orthogonal branch assumes E nondegenerate and never supplies the hard Lefschetz input used to establish that hypothesis.

Generic étale sheaves, derived categories, six operations and projective/Grassmann/Veronese geometry stay with their existing owners. SF.2 is the atlas integration owner for the exact PR196 contracts, and SF.0 for projective geometry. General regular-trait purity, approximation, enlarged perverse structures and p-adic Lie theory are requested as Part II extensions. The current OrthogonalSpinGroups roadmap already owns the general-field orthogonal carrier, reflection API and Q_l topology; the current IntegralLattices roadmap already owns the lattice carrier. No duplicate construction is planned here.

## Baseline and current upstream

The elaboration baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current read-only TauCetiRoadmap main `dea8191cc6047d6142a65872ebce6eeeb841a29b` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were also inspected to avoid planning newer upstream work. ClassicalGroups and OrthogonalGeometry were read as complete style/scope references; OrthogonalSpinGroups Layers 0/2 and the corresponding suggested declarations, IntegralLattices’ carrier and Chebotarev Layer 9 supply the precise imports used below.

- [mathlib:LinearEquiv.transvection](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Transvection/Basic.lean) — For f : Dual R V and v : V with f v = 0, the linear equivalence x ↦ x + f x • v.
- [mathlib:LinearEquiv.mem_fixedSubmodule_transvection_iff](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Transvection/Basic.lean) — x is fixed by the transvection x ↦ x + f x • v if and only if f x • v = 0.
- [mathlib:LinearMap.BilinForm.orthogonal](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean) — The orthogonal B.orthogonal N of a submodule N for a bilinear form B.
- [mathlib:LinearMap.BilinForm.IsAlt](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/BilinearForm/Properties.lean) — A bilinear form is alternating: B x x = 0 for all x.
- [mathlib:skewAdjointLieSubalgebra](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/SkewAdjoint.lean) — The Lie subalgebra of Module.End R M of endomorphisms skew-adjoint for a bilinear form B; for B alternating and nondegenerate this is sp(M, B).
- [mathlib:LieModule.IsIrreducible](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Semisimple/Defs.lean) — A nontrivial Lie module whose only Lie submodules are ⊥ and ⊤.
- [mathlib:IsNilpotent.exp](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Nilpotent/Exp.lean) — The finite exponential ∑ aⁱ/i! of a nilpotent element of a ℚ-algebra; for N² = 0 it is 1 + N.
- [mathlib:ValuationSubring.inertiaSubgroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/RamificationGroup.lean) — The inertia subgroup of the decomposition group of a valuation subring: the kernel of the action on its residue field.
- [mathlib:QuadraticMap.Nondegenerate](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/QuadraticForm/Radical.lean) — A quadratic map is nondegenerate if its radical is 0 and the kernel of its polar form has rank ≤ 1 (Elman–Karpenko–Merkurjev II §7).
- [mathlib:QuadraticMap.polarBilin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/QuadraticForm/Basic.lean) — The polar bilinear map (x, y) ↦ Q(x + y) − Q(x) − Q(y).
- [mathlib:CliffordAlgebra.even](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/CliffordAlgebra/Even.lean) — The even subalgebra C⁺(Q) of the Clifford algebra of a quadratic form.
- [mathlib:HenselianLocalRing](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Henselian.lean) — A local ring in which simple roots of monic polynomials modulo the maximal ideal lift.
- [tauceti:TauCeti.genericFiber](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/Fibers.lean) — For a scheme over Spec R and a fraction field K, the actual pullback generic fibre as an object over Spec K.
- [tauceti:TauCeti.specialFiber](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/Fibers.lean) — For a scheme over Spec R, the actual residue-field pullback special fibre.
- [mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Etale.lean) — The Grothendieck topology on X.Etale induced from the big étale topology.
- [mathlib:DerivedCategory](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean) — The localization of cochain complexes at quasi-isomorphisms, for an abelian category with HasDerivedCategory.
- [mathlib:Submodule.span](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Span/Defs.lean) — The smallest submodule containing a set, defined by the infimum of all containing submodules.
- [tauceti:LinearMap.GeneralLinearGroup.IsUnipotent](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/GeneralLinearGroup/Unipotent.lean) — A general linear automorphism g is unipotent exactly when its underlying endomorphism minus 1 is nilpotent.
- [tauceti:TauCeti.exp_smul_eq_sum_smul_dividedPower](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Nilpotent/Exp.lean) — For x^k=0 in a Q-algebra and r : ℚ, exp(r • x)=Σ_(i<k)r^i • dividedPower(i,x), with divided powers x^i/i!. Extension to arbitrary characteristic-zero scalar parameters is a routine algebra calculation, not the literal Tau Ceti statement.

## LPV.0

Construct the actual oriented fibre product and geometric specialization functors before using their derived versions. The finite-coefficient triangle and strict-local stalk formula precede finiteness, derived adic realization and comparison. Huber’s completion comparison is imported from exact H1 nodes on its noetherian/principal-type-(S) domain, with strict rank-one trait hypotheses for the nearby corollary; it compares RΨ, not RΦ.

Coverage: **planned**. All original stage targets have nodes whose prerequisite chains terminate in checked baseline declarations, exact independent supplier nodes, requested owner stages or explicit source/prototype gaps. Planned at target level; not closed or independently accepted.

### Henselian trait and geometric fibre diagram

Target `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves` · definition · `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait`.

A henselian trait is S = Spec R for a henselian discrete valuation ring R. Fix a separable geometric generic point and the uniquely extended valuation, with geometric closed point, normalization S̄, open generic inclusion j̄ and closed inclusion ī. Inertia is the kernel of generic-to-residue Galois specialization. The generic Galois-sheaf equivalence is imported from ConstructibleEtale:3, not constructed here.

**Hypotheses.**

- R a discrete valuation ring and henselian; the normalization in the chosen separable closure has the uniquely extended valuation
- The residue field of S̄ can be a purely inseparable extension of the selected separable residue closure

**Construction or proof.**

1. Use the pinned generic and special fibre pullback constructors for the scheme diagram.
2. Import valuation decomposition/inertia and the henselian specialization exact sequence from R01.2.
3. Import Galois descent for sheaves from ConstructibleEtale:3.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait` (structure) — A henselian trait S = Spec V with closed point s, generic point η, a geometric generic point η̄, the geometric closed point s̄ and S̄ = Spec of the normalisation of V in k(η̄).
- `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.inertia` (constructor) — I = ker(Gal(η̄/η) → Gal(s̄/s)), a closed normal subgroup.
- `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.inertia_exact` (characterisation) — 1 → I → Gal(η̄/η) → Gal(s̄/s) → 1 is exact; surjectivity uses that V is henselian.
- `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.genericFiber` (compatibility) — The trait-indexed generic fibre is TauCeti.genericFiber, with its canonical pullback projection.
- `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.specialFiber` (compatibility) — The trait-indexed closed fibre is TauCeti.specialFiber over the residue field.

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S` — the galoisian triples describing sheaves on Y ×_s S
- `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities` — Ψ_η takes values in continuous Gal(η̄/η)-sheaves on X_s̄
- `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula` — the inertia group I through which monodromy acts
- `ClassicalAdicEtaleCohomology:H1/trait-nearby-cycles-agree` — the trait conventions the analytic comparison matches

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.inertia_eq_top_of_strictlyHenselian` (degenerate) — If V is strictly henselian then Gal(s̄/s) = 1 and I = Gal(η̄/η).
- `TauCeti.AlgebraicGeometry.VanishingCycles.inertia_puiseux` (value) — For V the henselisation of k[t] at (t), k algebraically closed of characteristic 0, I = Gal(η̄/η) ≅ Ẑ(1), acting on t^{1/n} through μ_n.
- `TauCeti.AlgebraicGeometry.VanishingCycles.inertia_eq_valuation_inertia` (comparison) — I coincides with Mathlib's ValuationSubring.inertiaSubgroup for the valuation subring of k(η̄) over V, as a subgroup of the decomposition group, which here is all of Gal(η̄/η).
- `TauCeti.AlgebraicGeometry.VanishingCycles.wild_inertia_ne_bot` (non-example) — For V = the henselisation of 𝔽̄_p[t] at (t), I is not procyclic: the Artin–Schreier extensions x^p − x = t^{-a} (p ∤ a) give infinitely many independent ℤ/p quotients.

**Acceptance.**

- For Y = Spec k the equivalence recovers Gal(k̄/k)-sets.

**Direct prerequisites.**

- `tauceti:TauCeti.genericFiber`
- `tauceti:TauCeti.specialFiber`
- `mathlib:HenselianLocalRing`
- `mathlib:ValuationSubring.inertiaSubgroup`
- `ArithmeticGaloisRepresentations:R01.2`
- `SchemeAndStackFoundations:SF.2`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, Rappel 1.1.3, p. 7. The galoisian description used throughout (OCR cleaned).
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, 0.2.5, p. 5. Conventions on S̄ and geometric points.

**Suggested forms: partial.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Actual declarations or explicitly labelled specializations: `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait`, `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.inertia`, `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.genericFiber`, `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.specialFiber`.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait`, `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.inertia`, `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.inertia_exact`, `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.genericFiber`, `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.specialFiber`, `TauCeti.AlgebraicGeometry.VanishingCycles.inertia_eq_top_of_strictlyHenselian`, `TauCeti.AlgebraicGeometry.VanishingCycles.inertia_puiseux`, `TauCeti.AlgebraicGeometry.VanishingCycles.inertia_eq_valuation_inertia`, `TauCeti.AlgebraicGeometry.VanishingCycles.wild_inertia_ne_bot`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### The specialization morphism sp: S -> s and the 2-fibre-product topos Y ×_s S with its galoisian description (XIII 1.2)

Target `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S` · construction · `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos`.

For a henselian trait S with closed point s and Y over s, construct the 2-fibre product of étale topoi T=Y_et×_(s_et)S_et. On the geometric closed fibre Ȳ, an object consists of a continuous Gal(s̄/s)-sheaf F_s, a continuous Gal(η̄/η)-sheaf F_η, and a Gal(η̄/η)-equivariant map F_s→F_η, where the action on F_s is inflated along specialization. The generic part is the open subtopos Y_et×_(s_et)η_et and the closed complement is Y_et. Projection to Y sends a sheaf F by inverse image to (F,F,id); the generic restriction selects F_η. For Y=s this gluing category is equivalent to S_et, with gluing map into the inertia invariants of the generic sheaf. Henselian specialization identifies finite étale covers of S and s and gives sp_*F=i*F and sp_*j_*G=i*j_*G. The construction is independent, up to its canonical equivalence, of the chosen separable closure and has conservative geometric point families lying over pairs of compatible points of Y and S. Pullback and direct image are functorial for quasi-compact maps in Y and surjective trait maps; for a finite trait extension, direct image is induction on the generic Galois action. Extension by zero for locally closed immersions and proper-support pushforward for separated locally finite-type maps have their usual gluing descriptions. For abelian sheaves the right adjoint f^! to f_! extends to quasi-finite maps and agrees with f^* when f is étale.

**Hypotheses.**

- S a henselian trait; Y a scheme over s; the 2-fibre product is taken for the étale topoi (Giraud); readers may take the galoisian description 1.2.4 as the definition
- For non-separably-closed residue field the 2-product must be fibred over Spec(k)_et (introduction, item c))

**Construction or proof.**

1. Use the henselian equivalence of finite étale covers to obtain specialization and its Galois quotient.
2. Apply open/closed recollement on the trait: the map from the closed sheaf lands in inertia invariants. Base change this gluing construction along Y_et→s_et.
3. Check changes of separable closure by conjugate Galois descent, and check the stated restriction, projection, point and support functors on triples.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos` (constructor) — For Y over s, the category of triples (F_s, F_η, φ): F_s a sheaf on Y (a Gal(s̄/s)-sheaf on Ȳ), F_η a continuous Gal(η̄/η)-sheaf on Ȳ, φ : F_s → F_η equivariant (XIII 1.2.4).
- `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos.sp_pullback` (constructor) — sp^* : sheaves on Y → sheaves on Y ×_s S, F ↦ (F, F, id).
- `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos.etaPart` (constructor) — The restriction to Y ×_s η, (F_s, F_η, φ) ↦ F_η.
- `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos.equivSheavesOnTrait` (equivalence) — For Y = s, sheaves on S ≌ triples (F_s̄, F_η̄, φ : F_s̄ → F_η̄^I) (XIII 1.2.2).

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities` — Ψ(F) is a triple (F_s, Ψ_η(F_η), φ)
- `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism` — complexes written as triples with φ injective
- `LefschetzPencilsAndVanishingCycles:LPV.2/direct-images-at-a-lefschetz-degeneration` — R^i f_*ℚ_ℓ on a trait read as the triple (H^i(X_s), H^i(X_η̄), sp)

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_constant` (value) — The constant sheaf Λ on S is the triple (Λ, Λ, id) with I acting trivially.
- `TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_jPushforward` (value) — j_*G for a Gal(η̄/η)-module G is the triple (G^I, G, inclusion).
- `TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_degenerate` (degenerate) — For Y = ∅ the category is the terminal one.
- `TauCeti.AlgebraicGeometry.VanishingCycles.not_triple_of_noninvariant` (non-example) — For Y = s, a pair (F_s̄, F_η̄) with an equivariant map φ whose image is not in F_η̄^I is not a sheaf on S: the description 1.2.2 forces φ to land in the inertia invariants.

**Acceptance.**

- A sheaf on Y ×_s S restricted to the closed Y is F_s and to the open Y ×_s η is F_η; sp^*(F_s) = (F_s, F_s, id).
- Points (x, s̄) and (x, η̄) form conservative families (1.2.5).

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, Construction 1.2.4, p. 10. The galoisian description of the topos (OCR cleaned).
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, 1.2.2(b), p. 9. Identification of i^*j_* with inertia invariants.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos`, `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos.sp_pullback`, `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos.etaPart`, `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos.equivSheavesOnTrait`, `TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_constant`, `TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_jPushforward`, `TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_degenerate`, `TauCeti.AlgebraicGeometry.VanishingCycles.not_triple_of_noninvariant`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### The left exact functor Ψ: (sheaves on X) -> (sheaves on X_s ×_s S), its η-part Ψ_η = ī^* j̄_*, and its functorialities (XIII 1.3)

Target `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities` · construction · `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta`.

Fix X→S, a henselian trait, its geometric normalization S̄, and the inclusions j̄:X_η̄→X̄ and ī:X_s̄→X̄. For a sheaf G on X_η define ψEta(G)=ī* j̄_*G_η̄, with its continuous generic Galois action compatible with the action on X_s̄. For a sheaf F on X, assemble ψ(F)=(F_s,ψEta(F_η),sp_F) in the gluing topos, where sp_F is induced by the adjunction unit F→j_*j*F. Both functors are left exact. For an S-map f, actual base-change morphisms give ψ f_*→f_*ψ and f*ψ→ψ f*. The first is an isomorphism when f is proper; over X′=S it identifies geometric generic sections with sections of the nearby sheaf. For quasi-finite f there are f_!ψ→ψ f_! and ψ f^!→f^!ψ, respectively inverse to the direct-image map for finite f and to the inverse-image map for étale f. A map of henselian traits also has its natural inverse-image comparison. These are constructions on the actual sites; ψ is not identified with the direct image of an arbitrary topos morphism.

**Hypotheses.**

- S a henselian trait; X any S-scheme; sheaves of sets (pointed sets for f_!)
- Ψ is not in general the direct image of a morphism of topoi (1.3.1)

**Construction or proof.**

1. Define Ψ_η by pullback to η̄, direct image to X̄ and restriction to X_s̄; check the Galois action.
2. Assemble the triple with the adjunction map; derive the functorialities from base change maps.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta` (constructor) — Ψ_η(F) = ī^* j̄_* F_η̄, a continuous Gal(η̄/η)-sheaf on X_s̄ (XIII 1.3.2.2).
- `TauCeti.AlgebraicGeometry.VanishingCycles.psi` (constructor) — Ψ(F) = (F_s, Ψ_η(F_η), φ) on X_s ×_s S, φ from F → j_*j^*F (XIII 1.3.3).
- `TauCeti.AlgebraicGeometry.VanishingCycles.psi_leftExact` (characterisation) — Ψ and Ψ_η are left exact.
- `TauCeti.AlgebraicGeometry.VanishingCycles.psi_pushforward` (compatibility) — The base-change map Ψ f_* → f_* Ψ, an isomorphism for f proper (XIII 1.3.6).

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle` — RΨ is the right derived functor of Ψ
- `ClassicalAdicEtaleCohomology:H1/trait-nearby-cycles-agree` — the underived functor compared with the analytic construction
- `ClassicalAdicEtaleCohomology:H1/nearby-versus-vanishing-cycles` — Ψ versus Φ at the underived level

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_trait` (value) — For X = S, Ψ_η(F) is F_η̄ with its Gal(η̄/η)-action.
- `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_ne_invariants` (non-example) — For X = S, Ψ_η(F) = F_η̄ differs from i^*j_*F = F_η̄^I whenever I acts nontrivially: using j_* in place of j̄_* loses the inertia action.
- `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_smooth_constant` (value) — For X smooth over S and Λ constant, Ψ_η(Λ) = Λ, since the strict henselisations of X̄ at points of X_s̄ are normal domains.
- `TauCeti.AlgebraicGeometry.VanishingCycles.psi_proper_pushforward_id` (degenerate) — For f = id the base-change map is the identity.

**Acceptance.**

- For X = S, Ψ_η(F) is the Gal(η̄/η)-set F_η̄ viewed over s̄ and Ψ(F)_s = F_s with φ: F_s -> F_η̄^I.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`
- `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`
- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `SchemeAndStackFoundations:SF.2`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, 1.3.1, p. 13. Nature of Ψ.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, 1.3.6, p. 15. Proper compatibility at the underived level (OCR cleaned).

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta`, `TauCeti.AlgebraicGeometry.VanishingCycles.psi`, `TauCeti.AlgebraicGeometry.VanishingCycles.psi_leftExact`, `TauCeti.AlgebraicGeometry.VanishingCycles.psi_pushforward`, `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_trait`, `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_ne_invariants`, `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_smooth_constant`, `TauCeti.AlgebraicGeometry.VanishingCycles.psi_proper_pushforward_id`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### The variation Var(σ): Φ(K)_η -> K_η for a complex K on Y ×_s S and σ in the inertia group (XIII 1.4)

Target `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism` · construction · `TauCeti.AlgebraicGeometry.VanishingCycles.variation`.

Let K be a derived complex of A-modules in the gluing topos Y_et×_(s_et)S_et. Its closed and generic complexes have an equivariant specialization map φ. Choose a homotopy-equivalent representative whose specialization map φ′ is injective and split in each degree, and define Φ(K) by its cokernel. This gives the representative-independent distinguished triangle sp*K_s→K_η→Φ(K)→ and its cohomology sequence. Inertia acts trivially on the image of the closed part, so σ−1 on K′_η factors through the quotient q:K′_η→Φ(K). The resulting derived variation Var(σ):Φ(K)→K_η satisfies Var(σ)∘q=σ−1 on K_η, q∘Var(σ)=σ−1 on Φ(K), and Var(στ)=Var(σ)∘q∘Var(τ)+Var(σ)+Var(τ). The derived construction and its representative independence are part of the contract; uniqueness of a degree-zero cokernel factor alone does not establish them.

**Hypotheses.**

- A a ring (or a sheaf of rings on Y); K ∈ D(Y ×_s S, A)
- I acts trivially on the s-part

**Construction or proof.**

1. Add the mapping-cone replacement to obtain an injective degreewise split specialization representative. Its quotient realizes the cone and hence the distinguished triangle.
2. The trivial inertia action on the closed image makes σ−1 vanish there. Factor it through the quotient and compute the two compositions and the product law.
3. Use homotopy-compatible replacements and localization to obtain the derived map independently of the representative.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.variation` (constructor) — Var(σ) : Φ(K)_η → K_η for σ ∈ I and K a complex on Y ×_s S, defined on a representative with φ' injective (XIII 1.4.3).
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_left` (characterisation) — σ = 1 + Var(σ) ∘ q on K_η.
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_right` (characterisation) — σ = 1 + q ∘ Var(σ) on Φ(K)_η.
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_mul` (compatibility) — Var(στ) = Var(σ) q Var(τ) + Var(σ) + Var(τ).
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_wellDefined` (compatibility) — Var(σ) depends only on K in the derived category, not on the representative K'.
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_unique` (universal-property) — The degree-zero cokernel factor is uniquely characterized by composition with its quotient map giving σ−1. Derived representative independence remains a distinct form.

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2` — the variation formula at an ordinary quadratic point, n even
- `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3` — the variation formula at an ordinary quadratic point, n odd
- `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula` — the monodromy on H^n(X_η̄) through σ = 1 + Var(σ) q
- `ClassicalAdicEtaleCohomology:H1/variation-on-analytic-cohomology` — transport of Var to analytic cohomology

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_one` (degenerate) — Var(1) = 0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_of_phi_zero` (value) — If Φ(K) = 0 then Var(σ) = 0 and I acts trivially on K_η, by σ = 1 + Var(σ) q.
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_picardLefschetz` (value) — At an ordinary quadratic point in odd relative dimension n = 2m + 1, Var(σ)(a) = (−1)^{m+1} t_ℓ(σ)(a, δ)δ, which over rational coefficients is nonzero when t_ℓ(σ) ≠ 0, (a, δ) ≠ 0 and δ ≠ 0 (XV 3.3).
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_ne_sub_one` (non-example) — Var(σ) is not σ − 1: it goes from Φ(K)_η to K_η, and σ − 1 on K_η is Var(σ) ∘ q, which vanishes on the image of K_s.

**Acceptance.**

- The variation determines the inertia action on K_η through 1.4.3.2; the cocycle rule 1.4.3.4 is the algebraic analogue of the classical variation.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`
- `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`
- `EnhancedDerivedSheaves:E0`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, 1.4.3, p. 17. Definition of the variation (OCR cleaned).
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, (1.4.3.2)-(1.4.3.4), p. 17. The identities satisfied by Var.

**Suggested forms: partial.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Actual declarations or explicitly labelled specializations: `TauCeti.AlgebraicGeometry.VanishingCycles.variation`, `TauCeti.AlgebraicGeometry.VanishingCycles.variation_left`, `TauCeti.AlgebraicGeometry.VanishingCycles.variation_right`, `TauCeti.AlgebraicGeometry.VanishingCycles.variation_mul`, `TauCeti.AlgebraicGeometry.VanishingCycles.variation_wellDefined`, `TauCeti.AlgebraicGeometry.VanishingCycles.variation_unique`.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.variation`, `TauCeti.AlgebraicGeometry.VanishingCycles.variation_left`, `TauCeti.AlgebraicGeometry.VanishingCycles.variation_right`, `TauCeti.AlgebraicGeometry.VanishingCycles.variation_mul`, `TauCeti.AlgebraicGeometry.VanishingCycles.variation_wellDefined`, `TauCeti.AlgebraicGeometry.VanishingCycles.variation_unique`, `TauCeti.AlgebraicGeometry.VanishingCycles.variation_one`, `TauCeti.AlgebraicGeometry.VanishingCycles.variation_of_phi_zero`, `TauCeti.AlgebraicGeometry.VanishingCycles.variation_picardLefschetz`, `TauCeti.AlgebraicGeometry.VanishingCycles.variation_ne_sub_one`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### RΨ, RΨ_η, RΦ, the vanishing triangle, the stalk formula and local acyclicity (XIII 2.1.1-2.1.5)

Target `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle` · construction · `TauCeti.AlgebraicGeometry.VanishingCycles.RPsi`.

For X over a henselian trait S and a torsion coefficient ring A whose torsion is prime to the residue characteristic, derive the actual left-exact nearby functors on bounded-below complexes. The resulting Rψ:D⁺(X,A)→D⁺(X_s_et×_(s_et)S_et,A) has closed part i*K and generic part RψEta(K_η); on the geometric closed fibre its generic part is ī* Rj̄_*K_η̄. Define Rφ(K)=Φ(Rψ(K)). Its specialization triangle is sp*i*K→RψEta(K_η)→Rφ(K)→, and the variation map returns from Rφ to nearby cycles. At a geometric closed point x̄, the nearby stalk is RΓ(X_(x̄)×_(S^nr)η̄,K), where X_(x̄) and S^nr are the corresponding strict localizations. Thus the stalks of the cohomology sheaves are the cohomology groups of this geometric Milnor fibre. Local acyclicity over S is equivalent to vanishing of Rφ; in particular it holds on a smooth locus where the cohomology sheaves of K are locally constant. The ring may be replaced by a prime-to-residue-characteristic torsion sheaf of rings, with the same bounded-below domain.

**Hypotheses.**

- A torsion, prime to the residue characteristic (0.2.7); K ∈ D^+
- The stalk formula uses the strict henselization at x̄ and the strict henselization S^nr of the trait
- Local acyclicity of smooth morphisms is imported from SGA 4 XV 2.1

**Construction or proof.**

1. Derive the nearby functors on injective resolutions; open restriction preserves injectivity and geometric pullback has the needed acyclicity, giving their actual closed and generic parts.
2. Apply the representative-independent cone/variation construction to Rψ.
3. Compute a geometric stalk by strict localization and the actual direct-image stalk theorem.
4. Use the imported local-acyclicity criterion, and smooth local acyclicity for locally constant coefficients.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.RPsi` (constructor) — RΨ : D⁺(X, A) → D⁺(X_s ×_s S, A), the right derived functor of Ψ, with RΨ(K)_s = i^*K and RΨ(K)_η = RΨ_η(K_η) (XIII 2.1.2).
- `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi` (constructor) — RΦ(K) = Φ(RΨ(K)), in D⁺(X_s ×_s η, A).
- `TauCeti.AlgebraicGeometry.VanishingCycles.vanishingTriangle` (constructor) — The distinguished triangle sp^* i^*K → RΨ_η(K_η) → RΦ(K) → (XIII 2.1.2.4).
- `TauCeti.AlgebraicGeometry.VanishingCycles.RPsi_stalk` (characterisation) — R^iΨ(K)_(x̄, η̄) = H^i(X_(x̄) ×_{S^nr} η̄, K), the cohomology of the geometric Milnor fibre (XIII 2.1.4).
- `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_eq_zero_iff_locallyAcyclic` (characterisation) — (X, K) is locally acyclic over S if and only if RΦ(K) = 0 (XIII 2.1.5); for f smooth and K constant it holds.

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2` — concentration of RΦ at an ordinary quadratic point
- `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence` — the long exact sequence of the triangle on a proper family
- `ClassicalAdicEtaleCohomology:H1/lpv-trait-comparison` — the scheme-side nearby-cycle object
- `AutomorphicGaloisRepresentations:R19.2/carayol-vanishing-cycle-filtration` — the vanishing-cycle sequence of a proper curve

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_smooth` (value) — For X → S smooth and K = Λ: RΦ(Λ) = 0 and RΨ_η(Λ) = Λ.
- `TauCeti.AlgebraicGeometry.VanishingCycles.RPsi_trait` (degenerate) — For X = S: RΨ_η(K) = K_η̄ with its Gal(η̄/η)-action.
- `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_node` (value) — For X = Spec V[x, y]/(xy − π), π a uniformiser and S strictly henselian: R^iΦ(Λ) = 0 for i ≠ 1, and R^1Φ(Λ) is supported at the origin, free of rank 1 (XV 3.1.2 with n = 1).
- `TauCeti.AlgebraicGeometry.VanishingCycles.specialization_direction` (non-example) — For f proper the triangle gives H^i(X_s, K) → H^i(X_η̄, K) → H^i(X_s, RΦ K) → H^{i+1}(X_s, K): specialisation runs from the special to the generic fibre, and the reversed arrow is not a morphism of the triangle.

**Acceptance.**

- For a smooth family with locally constant coefficients RΦ = 0 and sp^*i^*K ≅ RΨ_η(K_η).
- For a disjoint union, RΨ is computed componentwise (functoriality in X); for a nodal curve over a trait the stalk formula at the node gives the cohomology of the Milnor fibre (an annulus), to be checked against XV §2.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities`
- `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`
- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `SchemeAndStackFoundations:SF.2`
- `EnhancedDerivedSheaves:E0`
- `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, 2.1.1, p. 17. Coefficient hypothesis.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, Proposition 2.1.4, p. 19. Stalk formula (OCR cleaned).
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, Reformulation 2.1.5, p. 19. Local acyclicity.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.RPsi`, `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi`, `TauCeti.AlgebraicGeometry.VanishingCycles.vanishingTriangle`, `TauCeti.AlgebraicGeometry.VanishingCycles.RPsi_stalk`, `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_eq_zero_iff_locallyAcyclic`, `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_smooth`, `TauCeti.AlgebraicGeometry.VanishingCycles.RPsi_trait`, `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_node`, `TauCeti.AlgebraicGeometry.VanishingCycles.specialization_direction`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Nearby and vanishing cycles**.

### Derived functorialities of RΨ (proper and smooth base change, f_!, f^!, change of trait) and the specialization sequence with inertia/variation diagrams (XIII 2.1.6-2.1.8)

Target `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.derivedFunctorialitiesAndSpecializationSequence`.

For a separated finite-type morphism g of finite-type schemes over a henselian trait, there are natural nearby-cycle exchange maps with g*, Rg*, Rg! and Rg!. The Rg* map is an isomorphism for proper g, the pullback map for smooth g (hence for open or étale g), and the exceptional inverse-image map for étale g. A dominant change of henselian traits gives an isomorphism after the chosen geometric points and inertia restriction are transported. For proper f:X→S, the specialization triangle yields the inertia-equivariant long exact sequence H^i(X_s̄,K)→H^i(X_η̄,K)→H^i(X_s̄,RΦK)→H^{i+1}(X_s̄,K). Compact supports have their own comparison arrow, from special-fibre nearby cycles to generic-fibre cohomology; an isomorphism is asserted here only with properness.

**Hypotheses.**

- Finite-type noetherian schemes; torsion coefficients invertible on the trait; bounded-below complexes
- Properness, smoothness or étaleness exactly as attached to each exchange map; no arbitrary base-change isomorphism
- Dominant change of traits, with compatible geometric points

**Construction or proof.**

1. Construct exchange maps from the adjunction units and the actual geometric fibre square.
2. Apply the corresponding smooth or proper base-change theorem of EtaleBaseChange; retain the comparison map without an invertibility assertion in the other cases.
3. Use XIII 2.1.7.5 for dominant trait change, distinct from arbitrary base change over higher-dimensional bases.
4. Apply RΓ to the specialization distinguished triangle and proper base change; use naturality to retain inertia equivariance.

**Acceptance.**

- Direction: specialization goes from H^i(X_s̄, K) to H^i(X_η̄, K) (through RΨ), and RΦ sits in degree shift 0 in the triangle sp^*i^*K -> RΨ_η -> RΦ -> (no shift), so the connecting map raises the degree by one.
- Inertia and Galois equivariance are built into the topos X_s ×_s S (all maps are equivariant).

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`
- `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities`
- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `SchemeAndStackFoundations:SF.2`
- `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, 2.1.7.1-2, p. 20. Proper and smooth compatibilities (OCR cleaned).
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, 2.1.8.9, p. 22. The specialization sequence and its use (OCR cleaned).

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.derivedFunctorialitiesAndSpecializationSequence`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Geometric fibre maps on the small étale sites

Target `LefschetzPencilsAndVanishingCycles:LPV.0/geometric-fibre-site-morphisms` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.geometricFibreSiteMaps`.

The chosen geometric fibre square X_η̄→X_S̄←X_s̄ induces the small-étale inverse-image and direct-image adjunctions. The inclusions are the base changes of the open generic and closed special inclusions, and inertia acts on the geometric generic side, with natural descent action on ī*Rj̄*. The sites are Scheme.smallEtaleTopology, not the Zariski sites.

**Hypotheses.**

- Henselian trait; finite-type X→S; chosen compatible geometric points

**Construction or proof.**

1. Use the pinned generic/special fibre pullback constructors.
2. Import the scheme-to-small-étale-topos morphisms from ConstructibleEtale and identify their fibre squares.
3. Transport the generic Galois action through these morphisms; record coherence for identity and composition.

**Acceptance.**

- For X=S, the geometric nearby stalk is the generic representation, rather than its inertia invariants.
- The open map is j̄ over the geometric normalization; replacing it by j changes the answer.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`
- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `SchemeAndStackFoundations:SF.2`
- `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`

**Sources.**

- [Luc Illusie, Vanishing cycles over general bases](https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf), §1.1, classical trait diagram. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.geometricFibreSiteMaps`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Oriented product and the classical trait description

Target `LefschetzPencilsAndVanishingCycles:LPV.0/oriented-product-comparison` · comparison · `TauCeti.AlgebraicGeometry.VanishingCycles.orientedProductTraitComparison`.

The oriented product X_s←×_Sη has points consisting of a geometric x, geometric generic point and specialization path. Its derived nearby-cycle stalk is RΓ(X_(x)×_{S_(f(x))}η̄,K). For a trait the oriented product identifies with the classical generic part of X_s×_sS, carrying the same specialization and inertia action. The full gluing topos has special and generic parts; it is not identified with the generic part alone.

**Hypotheses.**

- Trait base and compatible geometric points; torsion derived sheaves
- For a general higher-dimensional base this statement does not assert arbitrary base-change or constructibility

**Construction or proof.**

1. Use the oriented-product site of triples U→V←W and its covering families from Illusie §2.1.
2. Describe its points by specialization paths and identify the strict-local tube.
3. Restrict to the trait and compare the universal gluing maps with XIII 1.2–1.3.

**Acceptance.**

- The specialization arrow points from the special stalk to the generic nearby stalk.
- The identity map over a field has vanishing cycles zero.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`
- `LefschetzPencilsAndVanishingCycles:LPV.0/geometric-fibre-site-morphisms`
- `SchemeAndStackFoundations:key/henselization`
- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `EnhancedDerivedSheaves:E1`

**Sources.**

- [Luc Illusie, Vanishing cycles over general bases](https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf), §2.1–2.4, especially 2.2.3 and 2.3.4. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.orientedProductTraitComparison`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Constructibility and bounded nearby cycles

Target `LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyCyclesConstructible`.

For X of finite type over an excellent henselian trait and a bounded constructible torsion complex K with coefficients invertible on S, RΨK and RΦK have bounded constructible cohomology. Finite Tor-amplitude is retained under the finite-coefficient hypotheses of the finiteness theorem. A mere collection of finite stalks is not used as the constructibility criterion.

**Hypotheses.**

- Excellent henselian trait; finite-type morphism
- Bounded constructible finite torsion coefficients invertible on S; finite Tor-amplitude for the Tor conclusion

**Construction or proof.**

1. Apply the trait finiteness theorem recalled in Illusie §1.1 and supplied by EtaleBaseChange:6.
2. Use the strict-local stalk calculation for the finite cohomological amplitude.
3. Apply the specialization triangle to RΦ and the constructible/finite-Tor supplier criteria.

**Acceptance.**

- For an ordinary node only the single middle vanishing sheaf survives.
- The general-base oriented functor is not asserted constructible without a modification theorem.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`
- `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`
- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `SchemeAndStackFoundations:SF.2`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:key/henselization`
- `SchemeAndStackFoundations:key/excellent-schemes`

**Sources.**

- [Luc Illusie, Vanishing cycles over general bases](https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf), §1.1, finiteness theorem and change of trait. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyCyclesConstructible`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Constructibility of nearby cycles**.

### Coefficient change and inertia restriction

Target `LefschetzPencilsAndVanishingCycles:LPV.0/coefficient-and-trait-change` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyCyclesCoefficientTraitChange`.

Nearby and vanishing cycles commute with derived extension of finite coefficient rings in the invertible finite-Tor setting, and with dominant change of henselian traits. These isomorphisms preserve specialization, the cone triangle and inertia after restriction. For adic coefficient systems the statement is applied compatibly at every finite level before derived completion; underived tensor is not substituted for derived tensor.

**Hypotheses.**

- Finite coefficient homomorphism and constructible finite-Tor complexes; ℓ invertible
- Dominant trait morphism with transported geometric points

**Construction or proof.**

1. Use XIII 2.1.13 universal coefficient comparison, retaining derived tensor and Tor terms.
2. Use XIII 2.1.7.5 for change of traits, with the restriction map on inertia.
3. Check the unit/counit construction of specialization and the enhanced cone commute with both comparisons.

**Acceptance.**

- Reduction Z/ℓ²→Z/ℓ has the derived Tor correction when the stalk is not flat.
- A ramification-index e extension replaces t_l by e times the normalized new tame character.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`
- `LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude`
- `EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`
- `EnhancedDerivedSheaves:E4`
- `ArithmeticGaloisRepresentations:R01.2`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), XIII 2.1.7.5 and 2.1.13, pp. 18, 24–25. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyCyclesCoefficientTraitChange`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Adic realization of trait nearby cycles

Target `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization` · comparison · `TauCeti.AlgebraicGeometry.VanishingCycles.adicNearbyCycleRealization`.

A compatible system of bounded constructible Z/ℓ^r-complexes defines the integral adic nearby/vanishing complex by the imported derived adic realization. Tensoring with Q_l gives the rational functors and their inertia-equivariant specialization triangle. This is the realization of the finite-level LPV carrier, not a separate nearby-cycle definition.

**Hypotheses.**

- ℓ invertible; finite-level constructibility and uniform amplitude; derived-complete compatible systems

**Construction or proof.**

1. Apply finite-level coefficient comparison to the transition maps.
2. Import the adic completion/realization equivalence and the required derived inverse-limit control.
3. Rationalize the triangle and its Galois action; keep integral Tor and inverse-limit issues visible.

**Acceptance.**

- The nodal vanishing stalk realizes to Z_l(−1) in degree one.
- A non-flat finite-level system is not realized by an unqualified ordinary inverse limit.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/coefficient-and-trait-change`
- `EnhancedDerivedSheaves:E4`
- `EtaleDualityAndPerverseSheaves:EDC.6`
- `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), §4.4, extension to adic coefficients. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.adicNearbyCycleRealization`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Scheme and adic nearby cycles over a trait

Target `LefschetzPencilsAndVanishingCycles:LPV.0/scheme-adic-trait-comparison` · comparison · `TauCeti.AlgebraicGeometry.VanishingCycles.schemeAdicNearbyComparison`.

For a scheme X and a closed subscheme Y defined by a finite-type ideal I, let U=X−Y and let d(X̂) be the adic generic complement of the I-adic completion. Assume X locally noetherian, or the principal-I/type-(S) completion alternative of Huber 3.5.12. For a torsion coefficient ring E and K∈D⁺(U,E), the canonical map i*Rj_*K→Rb_*a*K is an isomorphism (3.5.13). For the nearby-cycle specialization assume a strictly henselian rank-one discrete valuation trait, X locally of finite type, and completion/base change to the integral closure in an algebraic closure and its completed fraction field as in 3.5.16–17. Then the actual scheme RΨ and formal/adic Rλ_*c* complexes agree. This is RΨ, not the cone RΦ. Specialization and inertia actions agree by naturality in every automorphism of the completion/base-change diagram.

**Hypotheses.**

- The precise noetherian or principal/type-(S) completion alternatives of Huber 3.5.12; torsion E and bounded-below K.
- For the nearby corollary, strictly henselian rank-one DVR and locally finite-type X, actual geometric completion and generic fibre; prime-to-residue-characteristic finite coefficients when used by the LPV geometric finiteness/perverse targets.
- Adic/rational passage requires the uniform amplitude and derived-limit hypotheses of E4; no comparison for arbitrary analytic spaces.

**Construction or proof.**

1. Import the exact scheme-completion comparison node from ClassicalAdicEtaleCohomology:H1, whose proof identifies geometric stalks via the henselian completion comparison.
2. Import its formal-nearby comparison node after the LPV nearby-cycle definition; completion and geometric base change produce the actual Rλ_*c* object.
3. Use functoriality under each inertia automorphism to identify the two actions, then specialization naturality; continuity is transferred from the scheme action.
4. Pass to derived adic systems and rational coefficients only on the E4 realization domain.

**Acceptance.**

- The algebraic nodal tube and its admissible adic counterpart have the same rank-one vanishing stalk and Tate twist.
- The comparison square intertwines σ for every inertia element, not only its underlying nonequivariant cohomology.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/geometric-fibre-site-morphisms`
- `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization`
- `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13`
- `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycles-comparison`

**Sources.**

- [Ana Caraiani and Peter Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://people.mpim-bonn.mpg.de/scholze/Noncompact.pdf), §4.6, p. 63, Huber comparison used in finite-level semiperversity. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.
- [Roland Huber, Étale cohomology of rigid analytic varieties and adic spaces](https://doi.org/10.1007/978-3-663-09991-8), §3.5, Theorem 3.5.13, p. 207 and proof pp. 208–209; Corollaries 3.5.16–17, p. 210. Full comparison domain and proof checked in the cleared reference, including completion/base-change dependence.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.schemeAdicNearbyComparison`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

**Stage remaining work.**

- Elaborate the exact geometric/derived API and test forms itemized under G-prototype-LPV-0 after their supplier interfaces are available.
- G-finiteness-source: Illusie’s classical-trait finiteness statement and PR196 EtaleBaseChange’s precise finite-type constructibility contract were read. The original SGA 4½ finiteness proof is not freshly read here; it belongs to that upstream supplier. The LPV hypotheses retain excellence and finite-type/finite-Tor restrictions.

## LPV.1

Normalize can/var on the actual unipotent geometric summand, retain the Tate line and derive finite logarithm identities. The linear kernel-image filtration and relative uniqueness require actual induced graded maps. Semisimple trace uses admissible filtrations of the same representation, with a primary common-refinement proof in Haines–Ngô §3.1. The regular-trait two-component total complex precedes the algebraic local formula and retains its restriction/Gysin maps, signs and vertical tame parameter.

Coverage: **planned**. All original stage targets have nodes whose prerequisite chains terminate in checked baseline declarations, exact independent supplier nodes, requested owner stages or explicit source/prototype gaps. Planned at target level; not closed or independently accepted.

### Canonical and normalized variation maps

Target `LefschetzPencilsAndVanishingCycles:LPV.1/normalized-can-var` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.normalizedCanVar`.

For the geometric nearby/vanishing triangle, can:RΨK→RΦK and Var(σ):RΦK→RΨK satisfy Var(σ)can=σ−1 and can Var(σ)=σ−1 on their respective objects. For the unipotent part with rational ℓ-adic coefficients, normalized var:RΦK→RΨK(−1) and N:RΨK→RΨK(−1) satisfy var can=N and can(−1)var=N_Φ. The same normalization is used after choosing a generator of Z_l(1); it is independent of that choice as a twisted map.

**Hypotheses.**

- Derived geometric functors; unipotent part for normalized var; rational coefficients
- A finite logarithm is taken only after unipotence is proved

**Construction or proof.**

1. Use the two XIII 1.4 composition identities for Var(σ).
2. On a unipotent action form log(T), and multiply Var by the finite polynomial log(T)/(T−1), whose constant coefficient is one.
3. Undo the trivialization of Z_l(1) to obtain the twisted maps and both compositions.

**Acceptance.**

- For T=1+U and U²=0, var agrees with Var divided by the chosen tame parameter.
- Both compositions are checked; interchanging Ψ and Φ gives a wrong source/target.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`
- `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization`
- `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm`
- `ArithmeticGaloisRepresentations:R01.2`
- `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, (1.4.3.2)–(1.4.3.4), p. 17. The two unnormalized composition identities; normalized var is obtained by the explicitly stated finite-polynomial argument, not asserted in this passage.
- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), §1.5, pp. 12–13, (1.5.1)–(1.5.4). The nilpotent logarithm and twisted monodromy; combined with XIII 1.4.3 and the finite polynomial log(T)/(T−1).

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.normalizedCanVar`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Finite logarithm of unipotent monodromy

Target `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm` · construction · `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog`.

For a unipotent automorphism T of a finite-dimensional characteristic-zero vector space and (T−1)^d=0, log T is the finite sum Σ_{1≤j<d}(-1)^(j+1)(T−1)^j/j. It is independent of the chosen valid d, nilpotent, and inverse to the pinned nilpotent exponential. For an inertia action factoring through t_l on an open subgroup, these logarithms give the canonical twisted N:V→V(−1).

**Hypotheses.**

- Characteristic-zero coefficient field; finite dimension
- Unipotence is an input, not deduced from an arbitrary inertia action

**Construction or proof.**

1. Define the finite polynomial using the actual Module.End algebra.
2. Use formal polynomial identities modulo X^d for bound independence, nilpotence and the log/exp inverse.
3. Use the imported tame character and unipotence to identify log ρ(σ)=t_l(σ)N.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog` (constructor) — The explicit finite polynomial log(1+U) in Module.End.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_bound_independent` (compatibility) — If U^d=U^e=0, the sums using d and e are equal.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_nilpotent` (structure) — The finite logarithm is nilpotent.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_exp` (relation) — exp(log T)=T, using IsNilpotent.exp.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_twisted` (compatibility) — log ρ(σ)=t_l(σ)N; changing the Tate generator changes the scalar matrix but not N:V→V(−1).
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_conj` (functoriality) — Conjugating U by a linear equivalence conjugates finiteLog(U,d), for every d.

**Uses.**

- `LPV.1 can/var and monodromy filtration` — Turns tame unipotent inertia into a canonical nilpotent twisted operator.
- `LPV.5 compact-image proof` — Identifies the actual rank-one logarithms inside the ℓ-adic analytic Lie algebra.

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_zero` (degenerate) — log 1=0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_square_zero` (computation) — If U²=0 then log(1+U)=U.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_three_block` (computation) — For U=E₀₁+E₁₂ on Q³, log(1+U)=U−U²/2.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_not_reflection` (non-example) — The involution −1 on Q is not unipotent, so the finite nilpotent logarithm hypothesis fails.

**Acceptance.**

- For a square-zero rank-one U, log(1+U)=U.
- For a three-step Jordan block, log(1+U)=U−U²/2.
- No logarithm is defined by this polynomial for an automorphism with eigenvalue −1.

**Direct prerequisites.**

- `tauceti:LinearMap.GeneralLinearGroup.IsUnipotent`
- `mathlib:IsNilpotent.exp`
- `tauceti:TauCeti.exp_smul_eq_sum_smul_dividedPower`
- `ArithmeticGaloisRepresentations:R01.2`
- `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), §1.5, pp. 12–13, (1.5.1)–(1.5.2). Definition of the logarithm on an open unipotent inertia subgroup and its canonical twisted form.

**Suggested forms: partial.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Actual declarations or explicitly labelled specializations: `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog`, `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_bound_independent`, `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_nilpotent`, `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_exp`, `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_conj`, `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_zero`, `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_square_zero`, `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_three_block`, `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_not_reflection`.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog`, `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_twisted`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Monodromy logarithm**.

### Geometric local monodromy theorem

Target `LefschetzPencilsAndVanishingCycles:LPV.1/geometric-quasi-unipotence` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.geometricQuasiUnipotence`.

For ℓ different from the residue characteristic and a finite-type family over a henselian discretely valued field in the geometric local-monodromy setting, inertia acts quasi-unipotently on its finite-dimensional rational ℓ-adic geometric cohomology with constant Q_l coefficients (with compact supports as well). After a finite extension the action is unipotent and factors through the ℓ-primary tame character. An arbitrary continuous representation of the inertia of an algebraically closed-residue field is not asserted quasi-unipotent by a formal group-theoretic argument.

**Hypotheses.**

- Geometric cohomology of a finite-type family; finite-dimensional Q_l realization; ℓ invertible
- The hypotheses of the geometric theorem in Illusie 1.4; excellent trait in the nearby-cycle realization
- An arbitrary inertia representation needs the distinct arithmetic residue-field hypothesis of the representation-theoretic theorem

**Construction or proof.**

1. Apply the geometric local monodromy theorem recalled in Illusie 1.4, whose proof is requested from the arithmetic/local-monodromy supplier.
2. Pass to a finite extension killing the finite semisimple inertia part.
3. Use the structure of tame inertia and the vanishing of a finite-order unipotent action in characteristic zero to remove wild inertia.

**Acceptance.**

- A quadratic reflection becomes unipotent after the quadratic extension, with N=0.
- A character of tame inertia with infinite semisimple image is not used as a geometric counterexample to the theorem.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude`
- `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization`
- `ArithmeticGaloisRepresentations:R01.2`
- `SchemeAndStackFoundations:key/excellent-schemes`

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), §§1.2–1.4, geometric theorem (1.4). The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.geometricQuasiUnipotence`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Geometric local monodromy**.

### Monodromy after a ramified extension

Target `LefschetzPencilsAndVanishingCycles:LPV.1/finite-extension-and-logarithm-rescaling` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyRamificationRescaling`.

For a finite extension of henselian discretely valued fields of ramification index e, restrict the inertia representation and transport Tate twists. On a common unipotent open subgroup the normalized monodromy satisfies N′=eN relative to the respective uniformizer-normalized tame characters. Thus log nilpotency index, monodromy filtration and primitive dimensions are unchanged for e≠0 in the rational coefficient field.

**Hypotheses.**

- Finite extension; rational characteristic-zero coefficients; common unipotent subgroup
- Integral assertions do not cancel e when e is divisible by ℓ

**Construction or proof.**

1. Use the Kummer formula t_l|I′=e t_l′ from R01.2.
2. Compare exp(t_l N) and exp(t_l′N′), then apply the finite logarithm.
3. Use nonzero scalar invariance of the monodromy filtration and its primitive kernels.

**Acceptance.**

- For a nodal curve under t=u^e the rank-one logarithm is multiplied by e.
- For a killed reflection N=N′=0.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm`
- `LefschetzPencilsAndVanishingCycles:LPV.0/coefficient-and-trait-change`
- `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration`
- `ArithmeticGaloisRepresentations:R01.2`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 1.6.14 and 1.7.2, pp. 169–172. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: partial.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Actual declarations or explicitly labelled specializations: `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyRamificationRescaling`.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyRamificationRescaling`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Monodromy filtration centered at an integer

Target `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration` · construction · `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration`.

For nilpotent N on a finite-dimensional vector space, define the unique finite increasing filtration M centered at c with N M_i⊂M_(i−2) and N^r:Gr_(c+r)^M V≅Gr_(c−r)^M V (with twist −r when N is a twisted map). One concrete center-zero formula is M_k=Σ_{a,b≥0,a−b=k}(ker N^(a+1)∩im N^b). For N=0, M_(c−1)=0 and M_c=V. Primitive parts use Deligne’s lower-weight convention P_i=ker(N:Gr_i→Gr_(i−2)), zero for i>c.

**Hypotheses.**

- Finite-dimensional field module; nilpotent N; integer center c
- For equivariant twisted N, all graded powers retain their Tate twists

**Construction or proof.**

1. Construct by induction on a nilpotence bound, using ker N^d/im N^d, or the displayed kernel-image formula.
2. Check N lowers by two and induces the opposite graded isomorphisms.
3. Prove uniqueness by the same extreme graded pieces and induction; use scalar invariance to remove a Tate generator choice.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration` (constructor) — The finite increasing kernel-image filtration M indexed by Z and centered at c.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_mono` (structure) — M_i≤M_j for i≤j, with a finite lower and upper bound.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_lowering` (relation) — N(M_i)⊂M_(i−2).
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyGradedPower` (data) — The induced map N^r from Gr_(c+r) to Gr_(c−r), with twist −r.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyGradedPower_bijective` (characterisation) — Each opposite graded-power map is bijective.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_scalar` (compatibility) — M(aN,c)=M(N,c) for a≠0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.primitivePart` (projection) — P_i is the kernel of the induced graded N, using the lower-weight convention.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_conj` (functoriality) — Conjugation by a linear equivalence maps each filtration submodule to the corresponding submodule of the conjugate operator.
- `TauCeti.AlgebraicGeometry.VanishingCycles.gradedN` (constructor) — The map on the actual associated graded induced by N, lowering the index by two.
- `TauCeti.AlgebraicGeometry.VanishingCycles.gradedN_mk` (compatibility) — On a class represented by x, the induced graded map returns the class represented by Nx.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyGradedPower_mk` (compatibility) — The opposite graded-power map returns the class of N^r x, fixing its relation to the input operator.

**Uses.**

- `LPV.1 primitive and relative-filtration interfaces` — Provides the center, graded powers and generator-independent filtration.
- `LPV.7 semistable curves and Liu et al. §5.9` — Supplies linear monodromy conventions; no weight spectral sequence is planned here.
- `Kisin–Pappas §4.7.1` — Makes inertia finite on graded pieces for semisimple traces.

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_zero` (degenerate) — For N=0 the filtration is 0 below c and V at and above c.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_two_block` (computation) — For N(e₁)=e₀ on Q² centered at zero, M_−2=0, M_−1=M_0=Qe₀ and M_1=V.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_three_block` (computation) — For N(e₂)=e₁, N(e₁)=e₀, the weights are −2,0,2 and Gr_−1=Gr_1=0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_not_kernel_filtration` (non-example) — For a two-block, ker N is M_−1, and M_0 is still ker N, whereas ker N² is V.

**Acceptance.**

- A size-three Jordan block has weights c−2,c,c+2.
- A size-two block has weights c−1,c+1, so the filtration is not the kernel-power filtration.

**Direct prerequisites.**

- `mathlib:Submodule.span`
- `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm`
- `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 1.6.1–7 and 1.6.14, pp. 165–170. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: partial.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Actual declarations or explicitly labelled specializations: `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration`, `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_mono`, `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_lowering`, `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyGradedPower`, `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyGradedPower_bijective`, `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_scalar`, `TauCeti.AlgebraicGeometry.VanishingCycles.primitivePart`, `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_conj`, `TauCeti.AlgebraicGeometry.VanishingCycles.gradedN`, `TauCeti.AlgebraicGeometry.VanishingCycles.gradedN_mk`, `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyGradedPower_mk`, `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_zero`, `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_two_block`, `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_three_block`, `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_not_kernel_filtration`.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration`, `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyGradedPower`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Monodromy filtration**.

### Primitive decomposition and strictness of N

Target `LefschetzPencilsAndVanishingCycles:LPV.1/primitive-decomposition-and-strictness` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.primitiveDecomposition`.

For the center-zero monodromy filtration, N:(V,M)→(V,M shifted by two) is strict: N(M_(i+2))=im N∩M_i. Consequently Gr_i(ker N)≅P_i. Every Gr_i V is the direct sum of the lower primitive pieces P_−j with j≥|i| and j≡i mod 2, using the inverses of the opposite-graded isomorphisms N^j followed by powers of N (equivalently, in characteristic zero, the canonical SL₂ raising operator); on a length-(d+1) Jordan block the successive weights are d,d−2,…,−d. In characteristic zero the associated graded has the canonical SL₂ action whose lowering operator is N.

**Hypotheses.**

- Nilpotent N and finite-dimensional vector space; characteristic zero only for SL₂
- Strictness here is for N and for isomorphisms commuting with N; arbitrary commuting morphisms are not asserted strict

**Construction or proof.**

1. Apply the opposite-graded isomorphisms to split a graded piece into its primitive kernel and the next N image.
2. Iterate to obtain the decomposition and deduce strictness by graded surjectivity/injectivity.
3. Use Jordan blocks for the explicit weights.
4. Construct the characteristic-zero SL₂ realization on each nilpotent Jordan block, using the specifically requested LieHighestWeight, Part II extension and the existing SL₂ classification. No general Jacobson–Morozov theorem is asserted to be supplied by Layer 0.

**Acceptance.**

- A size-three block contributes a one-dimensional P_−2 and no other primitive part.
- For a commuting map from a trivial one-dimensional module into ker N of a two-block, strictness fails at index −1; the theorem does not assert it.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration`
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 1.6.3–8 and 1.6.10–11, pp. 165–168. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: partial.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Actual declarations or explicitly labelled specializations: `TauCeti.AlgebraicGeometry.VanishingCycles.primitiveDecomposition`.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.primitiveDecomposition`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Tensor, dual and symmetric monodromy filtrations

Target `LefschetzPencilsAndVanishingCycles:LPV.1/tensor-dual-and-symmetric-monodromy` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyTensorDual`.

In characteristic zero, for N=N₁⊗1+1⊗N₂, the monodromy filtration is the convolution M_i=Σ_(a+b=i)M_a(V₁)⊗M_b(V₂), with centers added. For the dual operator −Nᵗ, M_i(V*)=ann M_(−i−1)(V) at center zero. The associated graded and primitive decomposition commute with these operations, with the Tate twists attached to powers of N. Sym^d of the standard two-block is the length-(d+1) block with weights −d,−d+2,…,d.

**Hypotheses.**

- Finite dimension; characteristic zero for tensor and symmetric-power assertions
- Dual uses −Nᵗ and the reflected filtration indices

**Construction or proof.**

1. Use the SL₂ weight decomposition and the tensor/dual rules of the supplier.
2. Apply uniqueness of the monodromy filtration.
3. Use Clebsch–Gordan to identify primitive multiplicities and symmetric-power blocks.

**Acceptance.**

- Two size-two blocks tensor to a size-three block plus a size-one block.
- The dual of a size-two block has the same weights −1,1 with operator −Nᵗ.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.1/primitive-decomposition-and-strictness`
- `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration`
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 1.6.9–12 and 1.6.14, pp. 167–170. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: partial.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Actual declarations or explicitly labelled specializations: `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyTensorDual`.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyTensorDual`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Relative monodromy filtration: uniqueness

Target `LefschetzPencilsAndVanishingCycles:LPV.1/relative-monodromy-uniqueness` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.relativeMonodromyUnique`.

Given a finite increasing filtration W and nilpotent N preserving W, at most one finite increasing M satisfies N M_i⊂M_(i−2) and N^r:Gr_(w+r)^M Gr_w^W V≅Gr_(w−r)^M Gr_w^W V for every w and r≥0. Existence is an additional hypothesis; scaling N by a nonzero scalar does not change M. The corresponding graded maps have twist −r for twisted monodromy.

**Hypotheses.**

- Finite filtrations; nilpotent N preserving W
- No unconditional existence conclusion

**Construction or proof.**

1. Induct on the length of W using the source’s three identities determining M from W’s last graded quotient and the previous subobject.
2. Apply the center-w uniqueness theorem on each Gr_w^W.
3. Check the defining conditions are invariant under nonzero scaling.

**Acceptance.**

- For W pure of weight w the relative filtration is the ordinary filtration centered at w.
- For N(e₁)=e₀, W_0=Qe₀ and W_1=Q², no relative M exists: the prescribed graded centers force N M_1⊂M_−1=0, contradicting N≠0.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration`
- `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 1.6.13–14, pp. 168–170. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: partial.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Actual declarations or explicitly labelled specializations: `TauCeti.AlgebraicGeometry.VanishingCycles.relativeMonodromyUnique`.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.relativeMonodromyUnique`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Relative monodromy filtration**.

### Tame restriction along a normal-crossings divisor

Target `LefschetzPencilsAndVanishingCycles:LPV.1/normal-crossings-tame-restriction` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.normalCrossingsTameRestriction`.

For a regular scheme with strict normal-crossings divisor D=∪D_a and a lisse rational ℓ-adic sheaf on its complement, tame unipotent local inertia gives commuting twisted residues N_a on the tame restriction to each stratum. The restriction is constructed using compatible Kummer covers and is independent of their cofinal choice. Relative filtrations along a stratum are unique when they exist. Existence and purity under mixedness are requested from DeligneWeightsAndPurity; they are not consequences of the linear algebra alone.

**Hypotheses.**

- Strict normal crossings; ℓ invertible; tame and unipotent local monodromy after the specified cover
- The relative-filtration existence result needs the weight hypotheses of Weil II 1.9.1
- Local Kummer coordinates are fixed for the restriction on E; independence of the cofinal tower does not assert independence of defining equations. The intrinsic version uses the normal-bundle torsor (1.7.10).

**Construction or proof.**

1. Import Kummer tame covers/Abhyankar and take the compatible restriction system.
2. Identify the commuting tame factors and apply finite logarithms to obtain N_a.
3. Apply relative uniqueness to compare orders of restrictions whenever the required filtrations exist.
4. Route Weil II 1.9’s mixedness/purity argument to the weight supplier.

**Acceptance.**

- On a two-component coordinate divisor the two residues commute.
- A wild local system is not assigned a tame Kummer restriction by this theorem.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm`
- `LefschetzPencilsAndVanishingCycles:LPV.1/relative-monodromy-uniqueness`
- `ArithmeticGaloisRepresentations:R01.2`
- `InverseGaloisAndArithmeticFundamentalGroups:IG.1`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 1.7.8–10, pp. 172–174. Kummer tame restriction, its dependence on local defining equations, and the intrinsic normal-bundle formulation; commuting logarithms follow from commuting tame factors.
- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 1.9.1–6, pp. 179–181. Weight-dependent relative-filtration existence; an outgoing weight application, not an input to LPV’s linear uniqueness.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.normalCrossingsTameRestriction`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Maximal unipotence and maximal nilpotence

Target `LefschetzPencilsAndVanishingCycles:LPV.1/maximal-unipotence` · definition · `TauCeti.AlgebraicGeometry.VanishingCycles.IsMaximallyNilpotent`.

On a nonzero n-dimensional characteristic-zero vector space, T is maximally unipotent when its minimal polynomial is (X−1)^n, and N is maximally nilpotent when its minimal polynomial is X^n. For N=log T these are equivalent to a single size-n Jordan block and dim ker N^j=min(j,n). The zero-dimensional case is excluded from the adjective; it is not silently a size-zero Jordan block.

**Hypotheses.**

- Finite-dimensional characteristic-zero vector space; n>0
- T unipotent for the equivalence with log

**Construction or proof.**

1. Use the existing unipotent predicate and minimal-polynomial API; define the maximal nilpotency-index condition.
2. Use Jordan block decomposition to identify the minimal polynomial and kernel dimensions.
3. Compare log(1+U)=U times a polynomial with invertible constant coefficient, so all kernel powers have the same dimensions.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.IsMaximallyNilpotent` (characterisation) — For dim V=n>0, N^n=0 and N^(n−1)≠0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.IsMaximallyUnipotent` (characterisation) — T is unipotent and T−1 is maximally nilpotent; equivalent to minpoly T=(X−1)^n.
- `TauCeti.AlgebraicGeometry.VanishingCycles.maximalLog_iff` (equivalence) — Maximal unipotence of T is equivalent to maximal nilpotence of log T.
- `TauCeti.AlgebraicGeometry.VanishingCycles.maximalNilpotent_kernel_rank` (relation) — dim ker N^j=min(j,n).
- `TauCeti.AlgebraicGeometry.VanishingCycles.maximalNilpotent_conj` (compatibility) — Maximal nilpotence is invariant under conjugation by a linear equivalence.

**Uses.**

- `Qian, published Definition 3.6` — Exports the minimal-polynomial and kernel-rank tests without the unrelated automorphy proof.
- `LPV.1 monodromy filtration` — Recognizes the single primitive block and its extremal weights.

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_three_block` (computation) — The size-three Jordan block is maximally nilpotent.
- `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_not_two_plus_one` (non-example) — A size-two Jordan block plus a trivial line in dimension three is not maximally nilpotent.
- `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_one_dimension` (degenerate) — The zero endomorphism of a one-dimensional space is maximally nilpotent; the identity is maximally unipotent.
- `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_zero_dimension_excluded` (non-example) — The zero-dimensional vector space does not satisfy the nonzero-dimension definition.

**Acceptance.**

- A three-block is maximal, while a direct sum of a two-block and a trivial line is not.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm`
- `tauceti:LinearMap.GeneralLinearGroup.IsUnipotent`
- `LefschetzPencilsAndVanishingCycles:LPV.1/primitive-decomposition-and-strictness`

**Sources.**

- [Lie Qian, Potential automorphy for GL_n](https://par.nsf.gov/servlets/purl/10388233), Published Definition 3.6. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: complete.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Actual declarations or explicitly labelled specializations: `TauCeti.AlgebraicGeometry.VanishingCycles.IsMaximallyNilpotent`, `TauCeti.AlgebraicGeometry.VanishingCycles.IsMaximallyUnipotent`, `TauCeti.AlgebraicGeometry.VanishingCycles.maximalLog_iff`, `TauCeti.AlgebraicGeometry.VanishingCycles.maximalNilpotent_kernel_rank`, `TauCeti.AlgebraicGeometry.VanishingCycles.maximalNilpotent_conj`, `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_three_block`, `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_not_two_plus_one`, `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_one_dimension`, `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_zero_dimension_excluded`.

Planet: **Maximal unipotence**.

### Semisimple trace on finite-inertia graded pieces

Target `LefschetzPencilsAndVanishingCycles:LPV.1/semisimple-nearby-trace` · construction · `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace`.

Let K be a bounded finite-dimensional continuous Weil complex over a characteristic-zero coefficient field with quasi-unipotent inertia. For each actual cohomology representation choose a finite increasing filtration 0=W₀⊂…⊂W_r=V, stable under inertia and the specified Frobenius F, with finite inertia image on every associated graded. F normalizes inertia through its actual automorphism α. Define the degree-zero trace as the sum of traces of F on the inertia invariants of those graded pieces and the complex trace as the alternating sum over cohomological degrees. Any two such filtrations of the same representation and F give the same value, Frobenius-lift changes preserve it, and equivariant distinguished triangles give additivity. An arbitrary list of unrelated linear maps is not an admissible filtration.

**Hypotheses.**

- Characteristic-zero field, continuous finite-dimensional Weil representations; bounded finite-dimensional cohomology.
- W finite increasing, endpoint zero and whole V, stable under ρ and F; finite Set.range of each induced graded inertia representation.
- Fρ(g)=ρ(α(g))F for the actual normalizing inertia automorphism α.
- All refinements filter this same V,ρ,F. Distinguished triangles and exact sequences are equivariant for both inertia and F.

**Construction or proof.**

1. For a quasi-unipotent representation take a finite-index unipotent-inertia subgroup; the kernel filtration of its logarithm gives finite inertia on the actual associated graded.
2. Refine two filtrations by their intersections. Every refinement quotient is an equivariant subquotient of an original finite-inertia piece, hence has finite image.
3. Average over the finite inertia quotient in characteristic zero. Invariants are exact, and equivariant Frobenius trace is additive on each short exact refinement. This proves filtration independence (Haines–Ngô §3.1, Lemma 8).
4. Choose compatible filtrations on an equivariant short exact sequence and apply the same exactness. Factor the degree-zero invariant through the Grothendieck group, then use the cohomology exact sequence of a bounded equivariant distinguished triangle (Corollary 9).
5. On graded inertia invariants an inertia multiplier acts as the identity, proving independence of the Frobenius lift. Take the actual cohomological alternating sum, so shift by one changes sign.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace` (constructor) — Alternating sum of Frobenius traces on the inertia invariants of finite-inertia graded cohomology.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_refinement` (compatibility) — The trace is unchanged under a finite common refinement.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_additive` (relation) — For an equivariant distinguished triangle, trace B=trace A+trace C.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_frobeniusLift` (compatibility) — Changing Frobenius by an inertia element leaves the semisimple trace unchanged.
- `TauCeti.AlgebraicGeometry.VanishingCycles.AdmissibleInertiaFiltration` (data) — Length, monotone submodules with endpoints 0,V, actual action/F stability and finite inertia image on each grade.
- `TauCeti.AlgebraicGeometry.VanishingCycles.filtrationRepresentation` (constructor) — The inertia action induced by ρ on W_(i+1)/W_i.
- `TauCeti.AlgebraicGeometry.VanishingCycles.filtrationRepresentation_mk` (relation) — Applying g to the class of x gives the class of ρ(g)x.
- `TauCeti.AlgebraicGeometry.VanishingCycles.filtrationFrobenius` (constructor) — The map induced by F on the same actual associated graded.
- `TauCeti.AlgebraicGeometry.VanishingCycles.filtrationFrobenius_mk` (relation) — Applying graded Frobenius to the class of x gives the class of Fx.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_finiteImage` (compatibility) — When the original inertia image is finite, the admissible trace equals the ordinary trace on its invariants.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_shortExact` (relation) — The three actual representations in a short exact sequence have equivariant injection and surjection, range equals kernel, and intertwining F; their admissible degree-zero traces are additive.

**Uses.**

- `Kisin–Pappas §4.7.1` — Supplies the semisimple trace of the already-defined nearby-cycle stalk; the local-model trace formula remains with its owner.
- `IgusaVarietiesAndTorsionConcentration IG.5` — Provides the rational trace interface without asserting that torsion invariants are exact.

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_trivial` (computation) — For a degree-zero trivial inertia line with Frobenius a, the semisimple trace is a.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_unipotent_block` (non-example) — For ρ(g)(x,y)=(x+gy,y) on Q², g∈Z, and F=identity (the q=1 algebraic specialization), the actual two-step admissible filtration gives semisimple trace two, while trace on invariants is one. The arithmetic q≠1 test requires the genuine Weil action and is recorded as a missing form.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_quadratic` (computation) — For a nontrivial quadratic finite inertia line, the semisimple trace is 0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_shift` (compatibility) — Shifting a complex by one negates its semisimple trace.

**Acceptance.**

- A trivial one-dimensional inertia module gives its ordinary Frobenius trace.
- For a nontrivial two-dimensional unipotent inertia block with compatible Frobenius eigenvalues a and qa on the two finite-inertia grades, the semisimple trace is a+qa; the trace on inertia invariants is just the eigenvalue on ker N. The Frobenius normalization fixes the direction of q-rescaling.
- A finite quadratic character has invariant trace zero.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.1/geometric-quasi-unipotence`
- `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration`
- `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization`
- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `SchemeAndStackFoundations:SF.2`
- `ArithmeticGaloisRepresentations:R01.2`

**Sources.**

- [Mark Kisin and George Pappas, Integral models of Shimura varieties with parahoric level structure](https://www.numdam.org/article/PMIHES_2018__128__121_0.pdf), §4.7.1, p. 212, semisimple trace of RΨ. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.
- [Thomas Haines and Bao Châu Ngô, Nearby cycles for local models of some Shimura varieties](https://math.uchicago.edu/~ngo/nearby-cycle.pdf), §3.1, Lemma 8 and Corollary 9, pp. 127–128. Primary construction and proof of admissible-filtration independence and additivity, rather than the later application’s reference.

**Suggested forms: partial.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Actual declarations or explicitly labelled specializations: `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace`, `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_refinement`, `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_frobeniusLift`, `TauCeti.AlgebraicGeometry.VanishingCycles.AdmissibleInertiaFiltration`, `TauCeti.AlgebraicGeometry.VanishingCycles.filtrationRepresentation`, `TauCeti.AlgebraicGeometry.VanishingCycles.filtrationRepresentation_mk`, `TauCeti.AlgebraicGeometry.VanishingCycles.filtrationFrobenius`, `TauCeti.AlgebraicGeometry.VanishingCycles.filtrationFrobenius_mk`, `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_finiteImage`, `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_shortExact`.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace`, `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_refinement`, `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_additive`, `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_frobeniusLift`, `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_trivial`, `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_unipotent_block`, `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_quadratic`, `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_shift`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Two-component semistable nearby-cycle complex

Target `LefschetzPencilsAndVanishingCycles:LPV.1/two-component-semistable-nearby-complex` · construction · `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex`.

Let a regular strictly semistable scheme over an excellent strictly henselian trait have special fibre D₁∪D₂, with smooth transverse components and intersection C. The early filtered Rapoport–Zink nearby-cycle complex has graded objects gr₁=Λ_C[−1](−1), gr₀=Λ_D₁⊕Λ_D₂, gr_−1=Λ_C[−1], and other grades zero; the boundary maps are alternating restrictions and Gysin maps. N:gr₁→gr_−1(−1) is the identity on Λ_C[−1](−1), and N²=0 in the filtered derived calculation. The corrected simple complex resolves K=RΨΛ, not the inertia-cohomology cone L. Its inertia action can be trivial on cohomology sheaves while N on the derived object is nonzero.

**Hypotheses.**

- Strictly semistable regular total space over a excellent strictly henselian trait; precisely two transverse components
- Λ finite with ℓ invertible, or rational ℓ-adic after realization
- Only this filtered two-component calculation is claimed here; the general weight spectral sequence belongs to LPV.7

**Construction or proof.**

1. Import the coherent filtered-derived construction and absolute purity for regular trait pairs.
2. Build the two-row restriction/Gysin double complex from the intersections, with the 1994 erratum’s 1−T upper differential.
3. Use the corrected filtered quasi-isomorphism sA≅K and compute the three nonzero grades.
4. Read N as the identity shift of the double complex; its second iterate is zero because there are only two components.
5. For rational coefficients identify inertia with exp(t_l N); finite coefficients in this two-step case use T−1 directly, without denominators.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex` (constructor) — The filtered nearby complex on D₁∪D₂, with actual restriction/Gysin differentials.
- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex_grades` (data) — The three graded objects are Λ_C[−1](−1), Λ_D₁⊕Λ_D₂ and Λ_C[−1].
- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex_monodromy` (relation) — N on the outer grades is the identity after the Tate twist, and N²=0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex_resolves` (compatibility) — The corrected total complex is quasi-isomorphic to the geometric nearby complex K, not to L=RΓ(I,K).

**Uses.**

- `LPV.2 algebraic Picard–Lefschetz` — Provides the semistable N calculation before LPV.2, removing the cycle through LPV.7.
- `RT-AREA-etale/18 and Illusie 2002 erratum` — Fixes the proof route and the corrected local concentration range.

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_node` (computation) — For xy=π, the degree-one nearby stalk is Λ(−1).
- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_disjoint` (degenerate) — If C is empty then N=0 and only the center-zero grade remains.
- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_not_sheaf_split` (non-example) — For the nodal local model the cohomology-sheaf inertia action is trivial, but the derived N map on the two outer grades is an isomorphism.
- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_N_square` (characterisation) — The filtered two-component operator has N²=0 and gr₁N equal to identity onto gr_−1(−1).

**Acceptance.**

- For xy=π the intersection term is a point, R¹Ψ=Λ(−1), and the sheaf-level inertia action is trivial.
- With C empty all off-center grades vanish and N=0.
- A nonzero derived N in the nodal case prevents replacing the filtered complex by the direct sum of its cohomology sheaves.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`
- `EnhancedDerivedSheaves:E0`
- `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`
- `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`
- `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`
- `ArithmeticGaloisRepresentations:R01.2`
- `EtaleDualityAndPerverseSheaves:EDC.3`
- `SchemeAndStackFoundations:key/excellent-schemes`

**Sources.**

- [Luc Illusie, Grothendieck and vanishing cycles](https://www.numdam.org/article/AFST_2021_6_30_1_83_0.pdf), §6.3, pp. 104–105, formulas (6.2)–(6.4). The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex`, `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex_grades`, `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex_monodromy`, `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex_resolves`, `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_node`, `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_disjoint`, `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_not_sheaf_split`, `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_N_square`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Two-component monodromy complex**.

### Twisted monodromy and Frobenius equivariance

Target `LefschetzPencilsAndVanishingCycles:LPV.1/twisted-monodromy-equivariance` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.twistedMonodromyEquivariance`.

The canonical N:V→V(−1) is equivariant for the trait Galois action. After trivializing the Tate line and using geometric Frobenius over F_q, this reads NF=qFN. For σ in the chosen unipotent inertia subgroup, ρ(σ)=exp(t_l(σ)N). Changing a Tate generator by a unit rescales the displayed scalar N inversely and leaves the twisted map unchanged.

**Hypotheses.**

- Finite-dimensional rational ℓ-adic geometric representation; a unipotent open inertia subgroup
- Geometric Frobenius convention; Frob acts by q on Q_l(−1)

**Construction or proof.**

1. Use finite log/exp and the tame character conjugation rule from R01.2.
2. Interpret the scalar logarithm as a map into the inverse Tate line.
3. Apply Galois equivariance to geometric Frobenius and write the resulting q relation.

**Acceptance.**

- For a two-block with F eigenvalues a on ker N and qa on the quotient, NF=qFN.
- Arithmetic Frobenius would invert q; the convention is fixed explicitly.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm`
- `LefschetzPencilsAndVanishingCycles:LPV.1/geometric-quasi-unipotence`
- `ArithmeticGaloisRepresentations:R01.2`
- `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), §1.5, p. 13, (1.5.3)–(1.5.4). Canonical twisted N and the displayed geometric-Frobenius relation NF=qFN.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.twistedMonodromyEquivariance`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

**Stage remaining work.**

- Elaborate the exact geometric/derived API and test forms itemized under G-prototype-LPV-1 after their supplier interfaces are available.

## LPV.2

Develop ordinary forms and germs in every characteristic, then the projective/affine/cone calculations and standard degeneration. Canonical ambient quadrics for n>0 use the source’s Ωⁿ≅O(−n) construction; n=0 is the degree-two cover itself. The local formula distinguishes odd and even dimension, the characteristic-two quadratic character and the restricted nonordinary application. General Artin/Elkik results are imported from their owner rather than proved by a quadratic placeholder.

Coverage: **planned**. All original stage targets have nodes whose prerequisite chains terminate in checked baseline declarations, exact independent supplier nodes, requested owner stages or explicit source/prototype gaps. Planned at target level; not closed or independently accepted.

### Concentration and rank of the nearby cycles at ordinary quadratic singular points (XV 3.1.1-3.1.2)

Target `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.ordinaryQuadraticPointNearbyCycles312`.

For f:X→S flat of finite type and pure relative dimension n over a henselian trait, assume the special fibre is smooth away from finitely many ordinary quadratic points. Let Σ be those points and E⊂Σ the points near which the generic fibre is smooth. With finite coefficients Λ invertible on S, R^iΦΛ=0 for i≠n and R^nΦΛ is supported exactly on E, where its stalks are free of rank one. The local nearby-cycle stalk and costalk pairing is perfect; at n=0 the nearby-cycle degree-zero stalk has rank two, while the vanishing-cycle stalk has rank one.

**Hypotheses.**

- f flat of finite type, pure relative dimension n; special-fibre singularities ordinary quadratic
- Λ finite torsion invertible on S
- E is the smooth-generic subset of the singular locus; persistent cone singularities are excluded from its support

**Construction or proof.**

1. Apply the henselian local equation and the standard degeneration calculation.
2. Smooth local acyclicity removes the smooth locus; the persistent-cone case removes Σ−E.
3. Apply the affine-quadric compact-support duality calculation, keeping Ψ distinct from Φ in degree zero.

**Acceptance.**

- Outside E (points where the generic fibre is not smooth nearby) the vanishing cycles vanish (2.2.4).
- For n = 0 the rank is 2 (two points degenerating to one).

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`
- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`
- `LefschetzPencilsAndVanishingCycles:LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point`
- `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics`
- `LefschetzPencilsAndVanishingCycles:LPV.2/standard-quadratic-degeneration`
- `LefschetzPencilsAndVanishingCycles:LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Proposition 3.1.2, p. 24. The full printed statement, read from a 300 dpi rendering of the page image (the OCR of this scan renders 'nul' as 'seul' and loses the Phi/psi distinction). Note that the source's Sigma is this packet's E, and that part (iii) is about psi, not Phi. (part 1 of 2 of the passage)
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Proposition 3.1.2, p. 24. The full printed statement, read from a 300 dpi rendering of the page image (the OCR of this scan renders 'nul' as 'seul' and loses the Phi/psi distinction). Note that the source's Sigma is this packet's E, and that part (iii) is about psi, not Phi. (part 2 of 2 of the passage)
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, proof of 3.1.2, p. 24. Reduction to the standard model.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.ordinaryQuadraticPointNearbyCycles312`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Even relative dimension n = 2m: the natural generator ±δ of H^n_{x}(R^nΦ(A(m))), the quadratic character ε_x of inertia and Var(σ)(a) = (−1)^m (ε_x(σ) − 1)/2 · (a,δ)δ (XV 3.2.1-3.2.3)

Target `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.evenRelativeDimensionVariation32`.

Notation of 3.1 with n = 2m, S strictly henselian (general case by descent). Proposition 3.2.1: (i) for x ∈ E the group H^n_{x}(R^n Psi_eta(A(m))) (the source writes psi_eta here, not Phi) has a natural generator δ, well defined up to sign, characterised by naturality in A and (δ,δ) = (−1)^m·2 (for n = 0 add Tr(δ) = 0); (ii) for a suitable character ε_x: I -> {±1} of the inertia group (independent of A), Var(σ)(a) = (−1)^m ((ε_x(σ) − 1)/2)(a δ) δ for a ∈ R^n Φ_η(A(m)), whence σ(δ) = ε_x(σ) δ. Proof: pass to the universal case A = Z_ℓ; up to sign only one δ satisfies (i); reduce as in 3.1.2 to 2.2.5 and apply 2.2.5 (D). Complément 3.2.2: if the henselization of X at x is that of the projective quadric Σ a_ij X_i X_j = 0 at x_0, ε_x is defined by the separable quadratic extension of the fraction field given by the centre of the even Clifford algebra Z(C^+(Q)). 3.2.3: in residue characteristic ≠ 2, I has a unique nontrivial character ε of order 2 (σ(√t) = ε(σ)√t for a uniformizer t); X_(x) is the henselization at 0 of Σ a_ij x_i x_j = b with b in the maximal ideal and Q nondegenerate; the centre of the Clifford algebra is k(η)(√((−1)^{m+1}·2b·det(a_ij))) (Bourbaki Alg. ch. 9 §9 no. 4), so ε_x = ε^{v(b)}: the variation vanishes if v(b) is even and ε_x = ε otherwise.

**Hypotheses.**

- n = 2m even; S strictly henselian; x ∈ E
- 3.2.3 requires residue characteristic ≠ 2 and uses the Clifford-algebra description; the characteristic-2 case is only covered by 3.2.2's Clifford-centre description
- NOTATION as in the 3.1.2 node: the source's Sigma is this packet's E. Part (i) of 3.2.1 is about R^n psi_eta and part (ii) about R^n Phi_eta; the two are genuinely different functors and the source uses both on the same page.

**Construction or proof.**

1. Universal case A = Z_ℓ and uniqueness of δ up to sign.
2. Reduction to the standard quadric and 2.2.5(D).
3. Clifford-algebra computation of ε_x.

**Acceptance.**

- For v(b) even the local monodromy is trivial in even relative dimension; for v(b) odd it is the reflection σ(δ) = −δ (when ε_x(σ) = −1).
- Sign convention: (δ,δ) = (−1)^m·2 fixes δ up to sign; the n mod 4 sign table of the stage must be checked against this normalisation.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2`
- `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`
- `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics`
- `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric`
- `LefschetzPencilsAndVanishingCycles:LPV.2/variation-in-a-standard-quadratic-degeneration`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Proposition 3.2.1, pp. 24-25. The full printed statement, read from 300 dpi and 200 dpi renderings of printed pages 24-25. Part (i) uses psi_eta and part (ii) uses Phi_eta; the source's 'x in Sigma' is this packet's 'x in E'. (part 1 of 2 of the passage)
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Proposition 3.2.1, pp. 24-25. The full printed statement, read from 300 dpi and 200 dpi renderings of printed pages 24-25. Part (i) uses psi_eta and part (ii) uses Phi_eta; the source's 'x in Sigma' is this packet's 'x in E'. (part 2 of 2 of the passage)
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 3.2.3, pp. 25-26. Explicit character in residue characteristic ≠ 2.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.evenRelativeDimensionVariation32`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Odd relative dimension n = 2m+1: the character c_b, the vanishing cycle ±δ_x from the primitive quotient of the tangent quadric, and the Picard-Lefschetz formulas Var(σ)(a) = (−1)^{m+1} c_{b(x)}(σ)(aδ)δ and σ(a) = a + (−1)^{m+1} c_{b(x)}(σ)(aδ_x)δ_x (XV 3.3.1-3.3.6)

Target `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.oddRelativeDimensionPicardLefschetz33`.

Let X→S have an ordinary nondegenerate quadratic singularity of relative dimension n=2m+1, with smooth generic fibre, local equation Q−b=0 and b≠0 in the maximal ideal of the henselian trait. The primitive quotient of the exceptional quadric determines ±δ. For finite coefficients prime to the residue characteristic, Var(σ)(a)=(-1)^(m+1) ε_b(σ)(a,δ)δ, where ε_b(σ)=σ(b^(1/r))/b^(1/r) in μ_r=Λ(1); the root is of b. For a proper family this gives σ(a)=a+(-1)^(m+1)ε_b(σ)(a,δ)δ on middle cohomology. For Q_l coefficients ε_b=v(b)t_l. The algebraic proof uses the LPV.1 two-component filtered nearby-cycle calculation, its restriction/Gysin boundary signs and quadric cohomology, before LPV.2.

**Hypotheses.**

- n=2m+1; ordinary nondegenerate point; smooth generic fibre
- S henselian trait; b≠0; ℓ invertible; properness for the global cohomology formula
- Geometric δ is normalized by the primitive quadric classes; twists make ε_b(a,δ)δ untwisted

**Construction or proof.**

1. Use the local equation and the primitive quotient of the tangent quadric to define ±δ.
2. Pass through the semistable two-component model and apply its filtered nearby-cycle N map; it has been planned in LPV.1 without LPV.7 or a weight theorem.
3. Compute restriction/Gysin on the exceptional quadric and its primitive classes to determine the coefficient (-1)^(m+1). The original calculation requires the source gap G-algebraic-PL to be resolved.
4. Transfer back by the dominant-trait exchange map and naturality of can/var; use the author erratum |i|>1, not |i|>−1.
5. For a regular proper degeneration b is a parameter, so ε_b=t_l.

**Acceptance.**

- The formula has the sign (−1)^{m+1} and the twist A(m); the quadratic character is replaced by the Kummer character c_b of b.
- The global formula requires properness; the δ=0 branch is supplied separately by the specialization sequence and direct-image node.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.1/two-component-semistable-nearby-complex`
- `LefschetzPencilsAndVanishingCycles:LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point`
- `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics`
- `LefschetzPencilsAndVanishingCycles:LPV.2/local-description-of-the-vanishing-cycle`
- `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`
- `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`
- `ArithmeticGaloisRepresentations:R01.2`
- `EtaleDualityAndPerverseSheaves:EDC.3`

**Sources.**

- [Luc Illusie, Grothendieck and vanishing cycles](https://www.numdam.org/article/AFST_2021_6_30_1_83_0.pdf), §6.1, pp. 103–104; §6.3, pp. 104–105. The author describes the algebraic proof through the two-component Rapoport–Zink calculation; original proof interior is not claimed read.
- [Luc Illusie, Erratum to Sur la formule de Picard–Lefschetz](https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrPL.pdf), p. 251 line 18 of the 2002 paper. Corrected concentration bound used in the local calculation.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), XV 3.3.2–6, pp. 26–30. The original formula, coefficient character and quadric normalization; its transcendental proof is not used as the algebraic proof.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.oddRelativeDimensionPicardLefschetz33`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### The specialisation sequence of a proper family with one ordinary quadratic point

Target `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.lefschetzDegenerationSpecializationSequence`.

Let S be the spectrum of a henselian discrete valuation ring A with algebraically closed residue field of characteristic p, with generic point η, closed point s and geometric generic point η̄, and let ℓ ≠ p be prime. Let f : X → S be proper with X regular, purely of dimension n + 1, and f smooth except at one ordinary quadratic point x of the special fibre X_s. Write n = 2m or n = 2m + 1. Then: (i) there is a vanishing cycle δ ∈ H^n(X_η̄, ℚ_ℓ)(m), well defined up to sign; (ii) sp : H^i(X_s, ℚ_ℓ) ≅ H^i(X, ℚ_ℓ) → H^i(X_η̄, ℚ_ℓ) is an isomorphism for i ≠ n, n + 1; (iii) there is an exact sequence 0 → H^n(X_s, ℚ_ℓ) → H^n(X_η̄, ℚ_ℓ) → ℚ_ℓ(m − n) → H^{n+1}(X_s, ℚ_ℓ) → H^{n+1}(X_η̄, ℚ_ℓ) → 0 whose middle map is x ↦ Tr(x ∪ δ) and whose other maps are sp.

**Hypotheses.**

- The residue field is algebraically closed; the general case is reached by passing to the strict henselisation.
- ℓ is different from the residue characteristic p.
- X is regular and x is the only point where f fails to be smooth; the generic fibre X_η is then smooth and proper.

**Construction or proof.**

1. Proper base change: H^i(X_s, ℚ_ℓ) = H^i(X, ℚ_ℓ) because S is henselian and f proper, and H^i(X_η̄, ℚ_ℓ) = H^i(X_s̄, RΨ_η ℚ_ℓ) by XIII 2.1.7.1 (finite coefficients ℤ/ℓ^k, then the limit).
2. The vanishing triangle sp^* i^*ℚ_ℓ → RΨ_η ℚ_ℓ → RΦ ℚ_ℓ → gives the long exact sequence … → H^i(X_s) → H^i(X_η̄) → H^i(X_s, RΦ) → H^{i+1}(X_s) → ….
3. By XV 3.1.2, applied with E = {x} (the generic fibre is smooth near x), RΦ(ℚ_ℓ) is concentrated in degree n and supported at x, of rank 1. So H^i(X_s, RΦ) = 0 for i ≠ n, which gives (ii), and H^n(X_s, RΦ) = R^nΦ(ℚ_ℓ)_x is a line.
4. The generator δ of XV 3.2.1 (n even) or of XV 3.3 (n odd) and the duality (a, b) of XV 3.1.2(iii) identify R^nΦ(ℚ_ℓ)_x with ℚ_ℓ(m − n) and the map H^n(X_η̄) → R^nΦ_x with x ↦ Tr(x ∪ δ), δ being the image of the local generator in H^n(X_η̄)(m). This uses XV 2.2.5 (the nearby-cycle and variation nodes of the standard quadratic degeneration) and XV 3.3.4.
5. The sequence of step 2 in degrees n − 1, …, n + 2, with the vanishing of step 3, is (iii); δ is determined up to sign because the local generator is.

**Acceptance.**

- n = 1, a curve of genus g acquiring one node: if the node is nonseparating, δ ≠ 0, the middle map is onto, dim H^1(X_s) = 2g − 1 and H^2(X_s) ≅ H^2(X_η̄); if it separates, δ = 0, H^1(X_s) ≅ H^1(X_η̄) and dim H^2(X_s) = 2.
- n = 0, X = Spec A[y]/(y² − π) with p ≠ 2: X_η̄ is two points, δ = e₁ − e₂ and the sequence is 0 → ℚ_ℓ → ℚ_ℓ² → ℚ_ℓ → 0.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`
- `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`
- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2`
- `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2`
- `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`
- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `SchemeAndStackFoundations:SF.2`
- `LefschetzPencilsAndVanishingCycles:LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration`
- `LefschetzPencilsAndVanishingCycles:LPV.2/variation-in-a-standard-quadratic-degeneration`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4, (4.2), p. 288. The algebraic setting: a proper family over a henselian trait with one ordinary quadratic point.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4, (4.3), (4.3.1)–(4.3.3), p. 288. The vanishing cycle δ ∈ H^n(X_η̄, ℚ_ℓ)(m), the isomorphisms (4.3.2) and the exact sequence (4.3.3), whose middle map x ↦ Tr(x ∪ δ) was read on the page image.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.13) B), p. 294. The proofs are in SGA 7 XIII–XV.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.lefschetzDegenerationSpecializationSequence`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### The Picard–Lefschetz formula for a proper family

Target `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.localPicardLefschetzFormula`.

Let S be the spectrum of a henselian discrete valuation ring A with algebraically closed residue field of characteristic p, with generic point η, closed point s and geometric generic point η̄, and let ℓ ≠ p be prime. Let f : X → S be proper with X regular, purely of dimension n + 1, and f smooth except at one ordinary quadratic point x of the special fibre X_s. Write n = 2m or n = 2m + 1. Let I = Gal(η̄/η) (the inertia group, as the residue field is algebraically closed) act on H^i(X_η̄, ℚ_ℓ) by transport of structure, and write (x, δ) = Tr(x ∪ δ). Then I acts trivially on H^i(X_η̄, ℚ_ℓ) for i ≠ n. On H^n: (A) if n = 2m + 1 is odd, σx = x + (−1)^{m+1} t_ℓ(σ)(x, δ)δ, where t_ℓ : I → ℤ_ℓ(1) is the tame character; (B) if n = 2m is even and p ≠ 2, let ε : I → {±1} be the unique character of order 2; then σx = x when ε(σ) = 1 and σx = x + (−1)^{m+1}(x, δ)δ when ε(σ) = −1, and (δ, δ) = (−1)^m·2. Equivalently, in Deligne's table (4.1), the sign in σx = x ± … is − for n ≡ 0, 1 and + for n ≡ 2, 3 mod 4, and (δ, δ) = 2, 0, −2, 0.

**Hypotheses.**

- p ≠ 2 in case (B).
- ℓ ≠ p.
- The twists are as in the specialisation sequence: δ ∈ H^n(X_η̄)(m), (x, δ) ∈ ℚ_ℓ(m − n), so t_ℓ(σ)(x, δ)δ lies in H^n(X_η̄)(2m + 1 − n) = H^n(X_η̄) for n odd.

**Construction or proof.**

1. Proper base change identifies the I-module H^n(X_η̄) with H^n(X_s̄, RΨ_η ℚ_ℓ), and σ = 1 + Var(σ) ∘ q on it (XIII 1.4.3), q being the map to H^n(X_s̄, RΦ) = R^nΦ_x.
2. For i ≠ n, R^iΦ = 0, so q = 0 in degree i and σ acts trivially.
3. Case n odd: XV 3.3 gives Var(σ)(a) = (−1)^{m+1} ε_b(σ)(a, δ)δ with b a generator of the ideal (b) of 3.3.1. As X is regular, b is a uniformiser, and ε_b is the Kummer character, whose ℓ-adic limit is t_ℓ.
4. Case n even, p ≠ 2: XV 3.2.1 gives Var(σ)(a) = (−1)^m((ε_x(σ) − 1)/2)(a, δ)δ and (δ, δ) = (−1)^m·2. Regularity of X makes ε_x nontrivial, and the tame quotient of I has a unique character of order 2 when p ≠ 2.
5. Substituting into σ = 1 + Var(σ) q gives (A) and (B). Evaluating at n = 0, 1, 2, 3 gives Deligne's table, which is checked against the complex Picard–Lefschetz table of (4.1).

**Acceptance.**

- n = 0, X = Spec A[y]/(y² − π), p ≠ 2: σ with ε(σ) = −1 swaps the two points, and x − (x, δ)δ with δ = e₁ − e₂ sends e₁ to e₂.
- Sign table for n = 0, 1, 2, 3: signs −, −, +, +; (δ, δ) = 2, 0, −2, 0; σδ = −δ for n even when ε(σ) = −1 and σδ = δ for n odd.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence`
- `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2`
- `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3`
- `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`
- `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`
- `ArithmeticGaloisRepresentations:R01.2`
- `LefschetzPencilsAndVanishingCycles:LPV.2/variation-in-a-standard-quadratic-degeneration`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4, (4.3) A), p. 288. t_ℓ : I → ℤ_ℓ(1) and σx = x ± t_ℓ(σ)(x, δ)δ for n odd.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4, (4.3) B), p. 289. The even case with the quadratic character ε, p ≠ 2.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4, (4.3), p. 289. The signs are those of the complex table (4.1).
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4, (4.1), p. 287. The complex table of signs, (δ, δ) and Tδ by n mod 4, read on the page image.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.localPicardLefschetzFormula`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Picard–Lefschetz formula**.

### The sheaves R^i f_*ℚ_ℓ at a Lefschetz degeneration, including the case δ = 0

Target `LefschetzPencilsAndVanishingCycles:LPV.2/direct-images-at-a-lefschetz-degeneration` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.directImagesAtALefschetzDegeneration`.

Let S be the spectrum of a henselian discrete valuation ring A with algebraically closed residue field of characteristic p, with generic point η, closed point s and geometric generic point η̄, and let ℓ ≠ p be prime. Let f : X → S be proper with X regular, purely of dimension n + 1, and f smooth except at one ordinary quadratic point x of the special fibre X_s. Write n = 2m or n = 2m + 1. Let j : η → S be the inclusion. (a) If δ ≠ 0: R^i f_*ℚ_ℓ is constant for i ≠ n, and R^n f_*ℚ_ℓ = j_*j^*R^n f_*ℚ_ℓ. (b) If δ = 0, which can happen only for n odd since (δ, δ) = ±2 for n even: R^i f_*ℚ_ℓ is constant for i ≠ n + 1, and there is an exact sequence 0 → ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → j_*j^*R^{n+1} f_*ℚ_ℓ → 0 with j_*j^*R^{n+1} f_*ℚ_ℓ constant, where ℚ_ℓ(m − n)_s is ℚ_ℓ(m − n) on {s} extended by zero.

**Hypotheses.**

- As in the specialisation sequence, with p ≠ 2 when n is even.

**Construction or proof.**

1. A sheaf on S is a triple (G_s̄, G_η̄, φ : G_s̄ → G_η̄^I) (XIII 1.2.2); for R^i f_*ℚ_ℓ it is (H^i(X_s), H^i(X_η̄), sp) by proper base change. It is constant if and only if I acts trivially and sp is an isomorphism, and it equals j_*j^* of itself if and only if sp is an isomorphism onto the invariants.
2. For i ∉ {n, n + 1} both hold by the specialisation sequence and the Picard–Lefschetz formula.
3. δ ≠ 0: by Poincaré duality on X_η̄ some x has (x, δ) ≠ 0, so the middle map of (4.3.3) is onto; hence H^{n+1}(X_s) ≅ H^{n+1}(X_η̄), and I acts trivially there. In degree n, sp is injective with image δ^⊥, and δ^⊥ = H^n(X_η̄)^I because the fixed space of x ↦ x + c(x, δ)δ with c ≠ 0 is δ^⊥ (use LinearEquiv.mem_fixedSubmodule_transvection_iff only in the odd alternating branch, where the functional vanishes on δ; for the even reflection compute c(x,δ)δ=0 directly, with ε nontrivial).
4. δ = 0: I acts trivially in every degree, sp is an isomorphism in degree n, and (4.3.3) becomes 0 → ℚ_ℓ(m − n) → H^{n+1}(X_s) → H^{n+1}(X_η̄) → 0, which is the stalk at s̄ of the stated sequence of sheaves.
5. (δ, δ) = (−1)^m·2 ≠ 0 for n even, so δ ≠ 0 there.

**Acceptance.**

- δ = 0 is realised by a genus-g curve acquiring a separating node (n = 1): R² f_*ℚ_ℓ has stalk ℚ_ℓ(−1)² at s and ℚ_ℓ(−1) at η̄.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence`
- `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`
- `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`
- `mathlib:LinearEquiv.mem_fixedSubmodule_transvection_iff`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4, (4.4) a), p. 289. Case δ ≠ 0: constancy for i ≠ n and R^n f_* = j_*j^*R^n f_*.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4, (4.4) b), p. 289. Case δ = 0, only for n odd, with the skyscraper sequence in degree n + 1 (read on the page image).

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.directImagesAtALefschetzDegeneration`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Ordinary quadratic forms

Target `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form` · definition · `TauCeti.AlgebraicGeometry.Quadric.IsOrdinary`.

Let S = Spec A, V a locally free A-module of rank r and Q a quadratic form on V, with polar form Φ(x, y) = Q(x + y) − Q(x) − Q(y). Q is nowhere zero if the values Q(v) generate the unit ideal; then Q = 0 defines a subscheme of P(V*) (EGA convention), flat and purely of relative dimension r − 2 over S, the quadric of Q. Q is ordinary if it is nowhere zero and its quadric is smooth over S; this can be checked after base change to fields. Over a field: (a) if r is even or the characteristic is not 2, Q is ordinary if and only if Φ is nondegenerate; (b) if r is odd and the characteristic is 2, Q is ordinary if and only if the kernel N of the alternating form Φ has dimension one and Q does not vanish on N. For V ≠ 0 over a field, ordinary is Mathlib's QuadraticMap.Nondegenerate (radical zero and polar kernel of rank at most one), which follows Elman–Karpenko–Merkurjev. Require positive locally free rank. Over a field, the finite-dimensional prototype requires finrank V>0, so rank zero is excluded; no invertibility-of-two assumption is imposed on the characteristic-two branch.

**Hypotheses.**

- The case r = 0 is excluded: the zero form on the zero module is not nowhere zero.
- Condition (b) is for characteristic 2; the source prints card(A) = 2 (source issue E1).

**Construction or proof.**

1. Apply the Jacobian criterion after algebraic closure: the projective quadric is singular at a geometric nonzero v exactly when Q(v)=0 and its polar functional is zero. Smoothness and the rank conditions descend back to k; checking only rational vectors over an imperfect field would be insufficient.
2. Hence over a field, ordinary means that no nonzero v has Q(v) = 0 and Φ(v, ·) = 0. If 2 ≠ 0 then Q(v) = Φ(v, v)/2, so this is nondegeneracy of Φ.
3. In characteristic two the polar form is alternating. Its kernel has the parity of r; geometric smoothness forces kernel dimension zero for even r, and one for odd r with Q nonzero on that line. For a nonzero field module this is exactly Mathlib’s radical-zero and polar-kernel-rank-at-most-one condition.
4. Construct quadratic scalar extension coefficientwise in a local basis and prove basis independence and descent. The pinned quadratic tensor base-change API requires 2 invertible; characteristic two uses this coefficient construction rather than polarization.

**API.**

- `TauCeti.AlgebraicGeometry.Quadric.IsOrdinary` (data) — IsOrdinary Q : Prop — Q nowhere zero with smooth quadric.
- `TauCeti.AlgebraicGeometry.Quadric.IsOrdinary.baseChange` (compatibility) — Ordinary is stable under base change and can be checked on the fibres at points of S.
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_iff_polar_nondegenerate` (characterisation) — Over a field with r even or 2 ≠ 0: IsOrdinary Q ↔ (polarBilin Q).Nondegenerate.
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_iff_of_char_two` (characterisation) — Over a field of characteristic 2 with r odd: IsOrdinary Q ↔ finrank (ker Φ) = 1 ∧ Q ≠ 0 on ker Φ.
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_iff_nondegenerate` (equivalence) — Over a field with V ≠ 0: IsOrdinary Q ↔ QuadraticMap.Nondegenerate Q.

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/smooth-quadric` — a smooth quadric is locally the quadric of an ordinary form
- `LefschetzPencilsAndVanishingCycles:LPV.2/normal-form-of-ordinary-quadratic-forms` — the étale-local normal form
- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point` — the leading term of an ordinary quadratic point
- `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil` — condition (C) of a Lefschetz pencil, through ordinary quadratic points

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_xy_add_sq_char_two` (value) — Characteristic 2, r = 3, Q = xy + z²: ker Φ = k·e_z and Q(e_z) = 1, so Q is ordinary (the conic xy = z² is smooth).
- `TauCeti.AlgebraicGeometry.Quadric.not_isOrdinary_sum_sq_char_two` (non-example) — Characteristic 2, r = 2, Q = x² + y² = (x + y)²: Φ = 0 and the quadric is a double point, so Q is not ordinary.
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_rank_one` (degenerate) — r = 1, Q = ax² with a a unit: the quadric is empty and Q is ordinary in every characteristic.
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_iff_nondegenerate_test` (comparison) — Over a field and for V ≠ 0, IsOrdinary Q agrees with Mathlib's QuadraticMap.Nondegenerate Q: in characteristic 2 the alternating Φ has kernel of dimension ≡ r mod 2, so rank ≤ 1 forces 0 or 1 according to the parity of r.
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_zero_rank_excluded` (degenerate) — The zero form on Q⁰ is not ordinary: rank zero is excluded explicitly.

**Acceptance.**

- xy + z² in characteristic 2 is ordinary; x² + y² in characteristic 2 is not; ax² is ordinary.

**Direct prerequisites.**

- `mathlib:QuadraticMap.Nondegenerate`
- `mathlib:QuadraticMap.polarBilin`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:key/henselization`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, 1.1, p. 2. The definition. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, 1.1 a), p. 2. The criterion for even rank or characteristic not 2 (XII writes n for the rank). Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, 1.1 b), p. 2. The criterion in characteristic 2 and odd rank. Statement independently checked on the page image; described here in our own words.

**Suggested forms: partial.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Actual declarations or explicitly labelled specializations: `TauCeti.AlgebraicGeometry.Quadric.IsOrdinary`, `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_iff_polar_nondegenerate`, `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_iff_of_char_two`, `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_iff_nondegenerate`, `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_xy_add_sq_char_two`, `TauCeti.AlgebraicGeometry.Quadric.not_isOrdinary_sum_sq_char_two`, `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_rank_one`, `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_iff_nondegenerate_test`, `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_zero_rank_excluded`.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.Quadric.IsOrdinary`, `TauCeti.AlgebraicGeometry.Quadric.IsOrdinary.baseChange`, `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_xy_add_sq_char_two`, `TauCeti.AlgebraicGeometry.Quadric.not_isOrdinary_sum_sq_char_two`, `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_rank_one`, `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_iff_nondegenerate_test`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Ordinary quadratic form**.

### Étale-local normal form of an ordinary quadratic form

Target `LefschetzPencilsAndVanishingCycles:LPV.2/normal-form-of-ordinary-quadratic-forms` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.normalFormOfOrdinaryQuadraticForms`.

Let Q be an ordinary quadratic form on a locally free A-module V of rank r = 2m (resp. r = 2m + 1). Étale locally on Spec A, V has a basis e₁, …, e_r with Q(Σ xᵢeᵢ) = Σ_{i=1}^{m} x_i x_{i+m} (resp. Σ_{i=1}^{m} x_i x_{i+m} + λx²_{2m+1} with λ invertible).

**Hypotheses.**

- The source prints the upper summation limit m − 1 (source issue E2).

**Construction or proof.**

1. Induction on m; m = 0 is clear (r = 1 gives Q = λx², λ a unit because Q is nowhere zero).
2. For m > 0 the quadric is smooth with nonempty geometric fibres, so it has sections étale locally: an e ∈ V nowhere zero with Q(e) = 0.
3. e is nowhere in the kernel of Φ (the quadric is smooth at [e]), so locally there is f′ with Φ(e, f′) = 1; put f = −Q(f′)e + f′, so that Q(e) = Q(f) = 0 and Φ(e, f) = 1.
4. V = V₁ ⊕ V₂ with V₁ = Ae + Af hyperbolic and V₂ = V₁^⊥, on which Q is ordinary of rank r − 2; apply the induction hypothesis to V₂.

**Acceptance.**

- r = 2: Q = x₁x₂; r = 3: Q = x₁x₂ + λx₃², which over a separably closed field of characteristic not 2 is equivalent to x² + y² + z².

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:key/henselization`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, Proposition 1.2, p. 2. The statement; the formulas are on p. 3. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, proof of 1.2, p. 3. The inductive proof by splitting off a hyperbolic plane. Statement independently checked on the page image; described here in our own words.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.normalFormOfOrdinaryQuadraticForms`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### The discriminant double cover of an even-dimensional quadric

Target `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric` · construction · `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre`.

Let Q be nondegenerate on V locally free of rank 2m > 0 over A. The centre Z(Q) of the even Clifford algebra C⁺(Q) is a finite étale A-algebra of rank 2, and C⁺(Q) is an Azumaya algebra over Z(Q) (XII 1.5); C⁺(Q) depends only on the quadric Q = 0 in P(V*) (XII 1.3). A totally isotropic direct summand W of rank m defines an idempotent e(W) ∈ Z(Q) (XII 1.6–1.7), and over a field e(W₁) = e(W₂) if and only if dim(W₁/W₁ ∩ W₂) is even (XII 1.12). For a smooth quadric X/S of dimension n = 2m > 0 this gives an étale double cover Z(X) → S (Z(X) = X for n = 0), and the generatrices (linear subspaces of dimension m of P(X) inside X) form a smooth projective S-scheme Gén(X) whose Stein factorisation is e : Gén(X) → Z(X) (XII 2.7–2.8).

**Hypotheses.**

- Even rank; for rank 2 in characteristic not 2, Z(Q) is the discriminant algebra.

**Construction or proof.**

1. Étale locally Q is split (normal form); for a split decomposition V = W₁ ⊕ W₂ into totally isotropic summands, C(Q) ≅ End(ΛW₁) as ℤ/2-graded algebras, and C⁺(Q) ≅ End(ΛW₁)⁺ × End(ΛW₁)⁻ has centre A × A (XII 1.4).
2. Descent gives Z(Q) étale of rank 2 and C⁺(Q) Azumaya over it (XII 1.5).
3. The idempotent e(W₁, W₂) depends only on W₁ by a connectedness argument on the affine space of complements (XII 1.6), giving e(W).
4. 1.12 reduces by the addition formula (1.10.1) to dim V = 2, where it is the computation e(Ae) = fe, e(Af) = ef.
5. For a smooth quadric, C⁺ of the ambient form descends to C⁺(X) (XII 2.6); its centre is Z(X). Gén(X) is covered by affine spaces of generatrices disjoint from a given one, hence smooth, and its geometric fibres over Z(X) are connected by reduction to P¹ × P¹ (XII 2.8).

**API.**

- `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre` (constructor) — Z(Q), the centre of CliffordAlgebra.even Q.
- `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_isEtale` (characterisation) — Z(Q) is finite étale of rank 2 over A, and C⁺(Q) is Azumaya over Z(Q).
- `TauCeti.AlgebraicGeometry.Quadric.lagrangianIdempotent` (constructor) — e(W) ∈ Z(Q) for W totally isotropic of rank m.
- `TauCeti.AlgebraicGeometry.Quadric.lagrangianIdempotent_eq_iff` (characterisation) — Over a field, e(W₁) = e(W₂) ↔ Even (finrank (W₁ ⧸ W₁ ⊓ W₂)).
- `TauCeti.AlgebraicGeometry.Quadric.discriminantCover` (constructor) — Z(X) → S for a smooth quadric of even dimension, with e : Gén(X) → Z(X) the Stein factorisation.

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-smooth-quadrics` — the cycle-class map cℓ : ℤ_ℓ^{Z(X)} → R^n p_*ℤ_ℓ(m)
- `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2` — the quadratic character ε_x of the even case is the monodromy on Z(X)
- `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula` — the character ε of case (B)

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_hyperbolic` (value) — V = Ae ⊕ Af with Q(xe + yf) = xy: C⁺(Q) = Z(Q) ≅ A × A, and the isotropic lines Ae and Af give the two idempotents fe and ef = 1 − fe (XII 1.12, proof).
- `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_discriminant` (value) — Over a field of characteristic not 2, Q = x² − dy²: C⁺(Q) = k ⊕ k·e₁e₂ with (e₁e₂)² = d, so Z(Q) ≅ k[t]/(t² − d), split if and only if d is a square.
- `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_eq_mathlib` (comparison) — C⁺(Q) is Mathlib's CliffordAlgebra.even Q.
- `TauCeti.AlgebraicGeometry.Quadric.lagrangianIdempotent_sum` (characterisation) — For an orthogonal sum, e(W₁ ⊕ W₂) = e(W₁)e(W₂) + (1 − e(W₁))(1 − e(W₂)) (XII 1.10.1): the sections add as ℤ/2-torsors, not as idempotents.

**Acceptance.**

- n = 2: X ≅ P¹ × P¹, Gén(X) is two copies of P¹ (the two rulings) and Z(X) is two points.
- n = 0: Z(X) = X, a double cover.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`
- `LefschetzPencilsAndVanishingCycles:LPV.2/normal-form-of-ordinary-quadratic-forms`
- `mathlib:CliffordAlgebra.even`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:key/henselization`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, Proposition 1.5, p. 5. The centre of the even Clifford algebra. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, Proposition 1.12, p. 8. The parity criterion for the two families. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, Proposition 2.8, p. 13. The generatrices and their Stein factorisation through Z(X). Statement independently checked on the page image; described here in our own words.

**Suggested forms: partial.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Actual declarations or explicitly labelled specializations: `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre`.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre`, `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_isEtale`, `TauCeti.AlgebraicGeometry.Quadric.lagrangianIdempotent`, `TauCeti.AlgebraicGeometry.Quadric.lagrangianIdempotent_eq_iff`, `TauCeti.AlgebraicGeometry.Quadric.discriminantCover`, `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_hyperbolic`, `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_discriminant`, `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_eq_mathlib`, `TauCeti.AlgebraicGeometry.Quadric.lagrangianIdempotent_sum`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Smooth quadrics over a base

Target `LefschetzPencilsAndVanishingCycles:LPV.2/smooth-quadric` · definition · `TauCeti.AlgebraicGeometry.Quadric.IsSmoothQuadric`.

Over an algebraically closed field k, a smooth quadric of dimension n is a k-scheme isomorphic to the subscheme Q = 0 of P(V*), dim V = n + 2, for Q an ordinary quadratic form. Over a scheme S, a smooth quadric of dimension n is a proper smooth S-scheme whose geometric fibres are smooth quadrics. For n = 0 it is an étale double cover of S, for n = 1 a Severi–Brauer scheme of relative dimension 1, and for n = 2 its geometric fibres are P¹ × P¹. Étale locally on S it is the quadric of an ordinary form in a projective space; for n>0 its ambient Severi–Brauer scheme P(X) depends only on X/S; Ω^n_{X/S} ≅ O(−n) has ample inverse.

**Hypotheses.**

- For n>0 the ambient Severi–Brauer scheme P(X) is canonical (XII 2.6). The n=0 case is the étale double-cover statement, with no canonical ambient asserted by that proposition.

**Construction or proof.**

1. Over k algebraically closed, Remark 2.2 identifies n = 0, 1, 2 and Lemma 2.3 computes Ω^n ≅ O(−n), Pic and the vanishing of H^i(O) and H^1(O(1)).
2. Over S, Pic_{X/S} is étale locally constant (H¹(O) = H²(O) = 0), so étale locally for n>0 there is the positive hyperplane bundle L with L^{⊗(−n)} matching Ω^n; p_*L is locally free of rank n + 2 and X ⊂ P(p_*L) is the quadric of an ordinary form, unique up to a unit (XII 2.5).
3. For n>0, P(p_*L) does not depend on the local positive hyperplane bundle L (XII 2.6), and descends to P(X). For n=0 use the étale double-cover description separately.

**API.**

- `TauCeti.AlgebraicGeometry.Quadric.IsSmoothQuadric` (data) — IsSmoothQuadric (f : X ⟶ S) (n : ℕ) : Prop — proper, smooth, geometric fibres smooth quadrics of dimension n.
- `TauCeti.AlgebraicGeometry.Quadric.isSmoothQuadric_of_isOrdinary` (constructor) — The quadric of an ordinary form of rank n + 2 is a smooth quadric of dimension n.
- `TauCeti.AlgebraicGeometry.Quadric.ambientProjective` (constructor) — For a smooth quadric X/S of relative dimension n>0, the canonical ambient Severi–Brauer S-scheme P(X) with X a relative divisor of degree 2.
- `TauCeti.AlgebraicGeometry.Quadric.isSmoothQuadric_zero_iff` (characterisation) — A smooth quadric of dimension 0 is the same as an étale double cover.
- `TauCeti.AlgebraicGeometry.Quadric.canonical_iso` (characterisation) — Ω^n_{X/S} ≅ O_X(−n).

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-smooth-quadrics` — the cohomology of smooth quadrics
- `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics` — affine quadrics X − (X ∩ H)
- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2` — the projectivised tangent cone at an ordinary quadratic point

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_dim_zero` (degenerate) — n = 0 over an algebraically closed field: X ≅ Spec k ⊔ Spec k.
- `TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_dim_two` (value) — n = 2: xy = zw in P³ is P¹ × P¹ (Segre).
- `TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_real_conic` (value) — n = 1 over ℝ: x² + y² + z² = 0 is a smooth conic without real points, a nontrivial Severi–Brauer curve.
- `TauCeti.AlgebraicGeometry.Quadric.not_smoothQuadric_cone` (non-example) — The cone xy = z² in P³ (a form of rank 3 in 4 variables) is singular at (0:0:0:1); the form is not ordinary.

**Acceptance.**

- The three low-dimensional cases of Remark 2.2 and the real conic.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:key/henselization`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, 2.1, p. 9. Smooth quadrics over an algebraically closed field. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, Définition 2.4, p. 10. The relative definition. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, 2.4, p. 10. The case n = 0. Statement independently checked on the page image; described here in our own words.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.Quadric.IsSmoothQuadric`, `TauCeti.AlgebraicGeometry.Quadric.isSmoothQuadric_of_isOrdinary`, `TauCeti.AlgebraicGeometry.Quadric.ambientProjective`, `TauCeti.AlgebraicGeometry.Quadric.isSmoothQuadric_zero_iff`, `TauCeti.AlgebraicGeometry.Quadric.canonical_iso`, `TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_dim_zero`, `TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_dim_two`, `TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_real_conic`, `TauCeti.AlgebraicGeometry.Quadric.not_smoothQuadric_cone`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Smooth quadric**.

### The ℓ-adic cohomology of a smooth quadric

Target `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-smooth-quadrics` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfSmoothQuadrics`.

Let p : X → S be a smooth quadric of dimension n and ℓ a prime invertible on S, with hyperplane class η ∈ H⁰(S, R²p_*ℤ_ℓ(1)). (i) R^{2i+1}p_*ℤ_ℓ = 0. (ii) For 0 ≤ 2i < n (resp. n < 2i ≤ 2n), R^{2i}p_*ℤ_ℓ(i) is canonically the constant sheaf ℤ_ℓ, generated by η^i (resp. η^i/2). (iii) For n = 2m, the cycle-class map cℓ : ℤ_ℓ^{Z(X)} → R^n p_*ℤ_ℓ(m) of the generatrices is an isomorphism, and for disjoint sections α, β of Z(X): (a) η^m = cℓ(α) + cℓ(β); (b) for m even, Tr(cℓ(α)²) = Tr(cℓ(β)²) = 1 and cℓ(α)cℓ(β) = 0, and for m odd, cℓ(α)² = cℓ(β)² = 0 and Tr(cℓ(α)cℓ(β)) = 1; (c) η·(cℓ(α) − cℓ(β)) = 0. Consequently, over 𝔽_q, #X(𝔽_q) = Σ_{i=0}^{n} q^i for n odd and Σ_{i=0}^{n} q^i + εq^m for n = 2m, with ε = 1 if X has a rational generatrix and ε = −1 otherwise.

**Hypotheses.**

- The source writes η ∈ H⁰(S, R¹p_*ℤ_ℓ(1)) in 3.1 (source issue E3); η lives in degree 2.

**Construction or proof.**

1. (i) and (ii) are the cohomology of smooth complete intersections (SGA 7 XI 1.6, 2.6): weak Lefschetz and Poincaré duality, with η^i/2 in the upper half because a hyperplane section of a quadric has degree 2.
2. (iii) is étale local, so reduce to S = Spec k, k algebraically closed, and X : Σ_{i=0}^{m} x_i x_{i+m+1} = 0 in P^{2m+1}.
3. (a): η^m is the class of the linear section x_i = 0 (0 ≤ i < m), which is the union of the generatrices D₁ : x_i = 0 (0 ≤ i ≤ m) and D₂ : x_i = 0 (0 ≤ i < m), x_{2m+1} = 0; dim D₁/(D₁ ∩ D₂) = 1 is odd, so e(D₁) ≠ e(D₂) by XII 1.12.
4. (b): disjoint generatrices have product 0 and generatrices meeting transversally in a point have Tr = 1; XII 1.12 decides, according to the parity of m, whether such pairs lie in the same family.
5. (c): by (ii) it suffices that Tr(η^m(cℓ(α) − cℓ(β))) = Tr(cℓ(α)² − cℓ(β)²) = 0.
6. cℓ is an isomorphism because the Gram matrices [[1, 0], [0, 1]] and [[0, 1], [1, 0]] have determinant ±1 and R^n p_*ℤ_ℓ(m) has rank 2.
7. The point count is the Lefschetz trace formula with these eigenvalues; Frobenius swaps α and β exactly when X has no rational generatrix.

**Acceptance.**

- n = 2, X = P¹ × P¹: the two rulings have square 0 and product 1 (m = 1 odd); #X(𝔽_q) = (1 + q)² when split and 1 + q² for the nonsplit form (Weil restriction of P¹ from 𝔽_{q²}).
- n = 0: two points, Tr(cℓ(α)²) = 1 (m = 0 even), #X(𝔽_q) = 1 + ε ∈ {0, 2}.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/smooth-quadric`
- `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`
- `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`
- `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`
- `EtaleDualityAndPerverseSheaves:EDC.4`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, Théorème 3.3, p. 14. The theorem; (ii)–(iii) are on p. 15. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, Théorème 3.3 (iii)(b), p. 15. The intersection form on the two generatrix classes, m odd. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, Vérification 3.4, p. 17. The point count over 𝔽_q. Statement independently checked on the page image; described here in our own words.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfSmoothQuadrics`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Cohomology of quadrics**.

### Cohomology of affine quadrics and the vanishing class δ

Target `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfAffineQuadrics`.

Let X be the smooth quadric over S of an ordinary form Q on V of rank n + 2, H a hyperplane of P(V*) meeting X transversally, Y = X ∩ H (a smooth quadric of dimension n − 1), X° = X − Y and f : X° → S. For n = 2m the primitive part of R^n p_*ℤ_ℓ(m) is the orthogonal of η^m, generated by cℓ(α) − cℓ(β), and the primitive quotient is R^n p_*ℤ_ℓ(m)/ℤ_ℓη^m. The cohomology of X° is torsion-free, with nonzero Betti numbers b₀ = b_n = 1, and with compact support b_{2n} = b_n = 1 (b₀ = 2 for n = 0). For n = 2m > 0, R^n f_!ℤ_ℓ(m) is the primitive part and R^n f_*ℤ_ℓ(m) the primitive quotient of R^{2m}p_*ℤ_ℓ(m); for n = 2m + 1, R^n f_!ℤ_ℓ(m) is the primitive quotient and R^n f_*ℤ_ℓ(m + 1) the primitive part of R^{2m}q_*ℤ_ℓ(m). Locally these have natural generators defined up to sign, δ with compact support and δ′ without. The forget-supports map φ : R^n f_!ℤ_ℓ → R^n f_*ℤ_ℓ is 0 for n odd and sends ±δ to ±2δ′ for n even > 0; Tr(δδ′) = ±1, and Tr(δ²) = 0 for n = 2m + 1 and (−1)^m·2 for n = 2m.

**Hypotheses.**

- n > 0 for the exact sequences; n = 0 gives Y = ∅ and X° = X.

**Construction or proof.**

1. The localisation sequence … → R^i f_!ℤ_ℓ → R^i p_*ℤ_ℓ → R^i q_*ℤ_ℓ → … and its dual Gysin sequence … → R^{i−2}q_*ℤ_ℓ(−1) → R^i p_*ℤ_ℓ → R^i f_*ℤ_ℓ → … (XII 3.6.2–3.6.3).
2. By Theorem 3.3 the restriction r_i is an isomorphism for i ≠ n, 2n (n even) and i ≠ n − 1 (n odd). For n = 2m, r_n(cℓ(α)) = ½η^m, so r_n is onto with kernel the primitive part; for n = 2m + 1, r_{2m}(η^m) = η^m, so r_{2m} is injective with cokernel the primitive quotient.
3. Hence R^i f_!ℤ_ℓ = 0 for i ≠ n, 2n and is a twisted constant sheaf of rank 1 in degrees n and 2n; dually R^i f_*ℤ_ℓ = 0 for i ≠ 0, n, f_*ℤ_ℓ = ℤ_ℓ and R^n f_*ℤ_ℓ has rank 1.
4. n = 2m: δ maps to ±(cℓ(α) − cℓ(β)), so Tr(δ²) = cℓ(α)² − 2cℓ(α)cℓ(β) + cℓ(β)², which is 1 + 1 − 0 = 2 for m even and 0 + 0 − 2 = −2 for m odd (Theorem 3.3 (iii)(b)); ±φ(δ) is twice ±δ′.
5. n = 2m + 1: δ = ∂cℓ(α) and δ² = ∂(cℓ(α)·∂cℓ(α)) = 0, so φ(δ) = 0; δ′ maps to ±(cℓ(α) − cℓ(β)) in R^{2m}q_*ℤ_ℓ(m) and Tr(δδ′) = ±1.

**Acceptance.**

- n = 1: X° = P¹ minus two points ≅ 𝔾_m, H¹_c and H¹ of rank 1, φ = 0, Tr(δ²) = 0.
- n = 2: Tr(δ²) = −2, the self-intersection of the vanishing sphere of a surface node; over ℂ, Σ z_i² = 1 is diffeomorphic to the tangent bundle of a sphere (XII 3.8).

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-smooth-quadrics`
- `LefschetzPencilsAndVanishingCycles:LPV.2/smooth-quadric`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`
- `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`
- `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, 3.5, p. 17. The primitive part and quotient. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, 3.6, p. 18. The restriction maps in the localisation sequence. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, Table 3.7, p. 20. The generators δ, δ′; the table's values of Tr(δδ′) and Tr(δ²) were read on the page image. Statement independently checked on the page image; described here in our own words.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfAffineQuadrics`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Vanishing cycle of the affine quadric**.

### Ordinary and non-degenerate quadratic points

Target `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point` · definition · `TauCeti.AlgebraicGeometry.Quadric.IsOrdinaryQuadraticPoint`.

Let y be a closed point of a scheme Y of finite type over a field k of characteristic p, and n = dim_y Y. For k algebraically closed, y is an ordinary quadratic point of Y if Ô_{Y,y} ≅ k[[x₁, …, x_{n+1}]]/(f) with f = Q(x) + (terms of order > 2) and Q an ordinary quadratic form in n + 1 variables. For general k, y is an ordinary quadratic point if the points of Y ⊗_k k̄ over y are. Replacing ordinary by nondegenerate gives a non-degenerate quadratic point; y is non-degenerate if and only if it is ordinary and p ≠ 2 or n is odd. An ordinary quadratic point with p = 2 and n even is called degenerate. The completed-local isomorphism is an isomorphism of k-algebras. With r=n+1, the field prototype uses an actual multivariate series Q+R, where every coefficient of R in total degree below three vanishes. It does not replace an arbitrary ordinary germ by its pure quadratic cone. General-field geometric descent and identification with the scheme’s completed local algebra are separate supplier forms.

**Hypotheses.**

- The quadratic part Q is well defined up to linear change of variables because f has no linear term.
- r=n+1>0; A is the completed local k-algebra with its actual scalar map.
- Nondegenerate means polar nondegenerate: ordinary AND (p≠2 OR n odd).

**Construction or proof.**

1. The quadratic part of f is determined up to linear change of coordinates and multiplication by a unit, and ordinary is invariant under both.
2. The criterion for non-degeneracy is XII 1.1 applied to the form in n + 1 variables: ordinary and nondegenerate agree unless p = 2 and n + 1 is odd.

**API.**

- `TauCeti.AlgebraicGeometry.Quadric.IsOrdinaryQuadraticPoint` (data) — Geometric predicate on (Y/k,y), tested after algebraic closure. Its field formal-germ specialization takes a k-algebra A and r=n+1>0 and requires A≅k[[x₁,…,x_r]]/(quadraticSeries(Q)+R) as k-algebras, with Q ordinary and R of order at least three.
- `TauCeti.AlgebraicGeometry.Quadric.IsNondegenerateQuadraticPoint` (data) — The same with the leading form nondegenerate.
- `TauCeti.AlgebraicGeometry.Quadric.isNondegenerate_iff` (characterisation) — IsNondegenerateQuadraticPoint Y y ↔ IsOrdinaryQuadraticPoint Y y ∧ (p ≠ 2 ∨ Odd n).
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinaryQuadraticPoint_baseChange` (compatibility) — The notion is geometric: it holds at y if and only if it holds at the points over y after any field extension.
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinaryQuadraticPoint_cone` (example) — For r>0 and ordinary Q, the actual formal quotient by quadraticSeries Q is an ordinary germ; the geometric cone-vertex identification is imported from SF.0.
- `TauCeti.AlgebraicGeometry.Quadric.quadraticSeries` (constructor) — The coordinate expansion of Q in multivariate formal power series; its diagonal coefficients are Q(e_i), and its mixed coefficients are Q(e_i+e_j)−Q(e_i)−Q(e_j), with no division by two.
- `TauCeti.AlgebraicGeometry.Quadric.quadraticSeries_proj` (compatibility) — For Q=proj_i·proj_j the constructor returns X_i X_j, including i=j.
- `TauCeti.AlgebraicGeometry.Quadric.OrderAtLeastThree` (data) — Every coefficient at a multi-index of total degree below three is zero.

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2` — the hypothesis of SGA 7 XV 3.1.1
- `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence` — the singular point of a Lefschetz degeneration
- `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil` — condition (C) of a Lefschetz pencil
- `LefschetzPencilsAndVanishingCycles:LPV.2/canonical-form-of-an-ordinary-quadratic-point` — the canonical forms 1.2.3–1.2.4

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.Quadric.node_isOrdinary` (value) — The node xy = 0 in 𝔸² (n = 1): Q = xy is ordinary and nondegenerate in every characteristic.
- `TauCeti.AlgebraicGeometry.Quadric.doublePoint_char_two` (value) — n = 0, Y = Spec k[x]/(x²): Q = x² is ordinary in every characteristic, so the origin is ordinary; it is non-degenerate if and only if p ≠ 2, and for p = 2 it is degenerate.
- `TauCeti.AlgebraicGeometry.Quadric.cusp_not_ordinary` (non-example) — The cusp y² = x³ (n = 1): the quadratic part y² in two variables is not ordinary (its quadric is a double point of P¹), so the cusp is not an ordinary quadratic point.
- `TauCeti.AlgebraicGeometry.Quadric.smooth_point_not_quadratic` (degenerate) — A smooth point is not an ordinary quadratic point: its Zariski tangent space has dimension n, not n + 1.

**Acceptance.**

- The node, the double point in both characteristics, the cusp and a smooth point.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:key/henselization`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Définition 1.2.1, p. 4. The definition over an algebraically closed field. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 1.2.2, pp. 4–5. Non-degenerate quadratic points. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Exemple 1.2.4, p. 5. The degenerate model (x₀² − a) + Σ a_ij x_i x_j in characteristic 2. Statement independently checked on the page image; described here in our own words.

**Suggested forms: partial.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Actual declarations or explicitly labelled specializations: `TauCeti.AlgebraicGeometry.Quadric.IsOrdinaryQuadraticPoint`, `TauCeti.AlgebraicGeometry.Quadric.IsNondegenerateQuadraticPoint`, `TauCeti.AlgebraicGeometry.Quadric.isNondegenerate_iff`, `TauCeti.AlgebraicGeometry.Quadric.isOrdinaryQuadraticPoint_cone`, `TauCeti.AlgebraicGeometry.Quadric.quadraticSeries`, `TauCeti.AlgebraicGeometry.Quadric.quadraticSeries_proj`, `TauCeti.AlgebraicGeometry.Quadric.OrderAtLeastThree`, `TauCeti.AlgebraicGeometry.Quadric.node_isOrdinary`, `TauCeti.AlgebraicGeometry.Quadric.doublePoint_char_two`, `TauCeti.AlgebraicGeometry.Quadric.cusp_not_ordinary`, `TauCeti.AlgebraicGeometry.Quadric.smooth_point_not_quadratic`.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.Quadric.IsOrdinaryQuadraticPoint`, `TauCeti.AlgebraicGeometry.Quadric.IsNondegenerateQuadraticPoint`, `TauCeti.AlgebraicGeometry.Quadric.isNondegenerate_iff`, `TauCeti.AlgebraicGeometry.Quadric.isOrdinaryQuadraticPoint_baseChange`, `TauCeti.AlgebraicGeometry.Quadric.isOrdinaryQuadraticPoint_cone`, `TauCeti.AlgebraicGeometry.Quadric.node_isOrdinary`, `TauCeti.AlgebraicGeometry.Quadric.doublePoint_char_two`, `TauCeti.AlgebraicGeometry.Quadric.cusp_not_ordinary`, `TauCeti.AlgebraicGeometry.Quadric.smooth_point_not_quadratic`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Ordinary quadratic singularity**.

### The Tjurina module of an ordinary quadratic point

Target `LefschetzPencilsAndVanishingCycles:LPV.2/tjurina-module-of-an-ordinary-quadratic-point` · lemma · `TauCeti.AlgebraicGeometry.VanishingCycles.tjurinaModuleOfAnOrdinaryQuadraticPoint`.

Let y be an ordinary quadratic point of Y/k with k(y) purely inseparable over k, and T¹_{Y/k} = O_Y/J the quotient by the Jacobian ideal (XV 1.1.1). Near y, T¹_{Y/k} is monogenic and concentrated at y, of rank 1 over k if y is non-degenerate (so k(y) = k), and of rank 2 if y is degenerate (p = 2, n = 2m), in which case k(y) = k or k(y) ≅ k(√a) with a ∈ k − k².

**Hypotheses.**

- k(y) purely inseparable over k; the general case reduces to it through the largest separable subextension of k(y).

**Construction or proof.**

1. Both assertions can be checked over k̄ after completion at y.
2. Non-degenerate: with f = Q + (order > 2), the ∂f/∂x_i generate the maximal ideal by Nakayama, so k[[x]]/(f, ∂f/∂x_i) = k.
3. Degenerate: in suitable coordinates f = x₀² + Σ_{i=1}^{m} x_i x_{i+m} + R with R of order ≥ 3. The ideal (f, ∂f/∂x_i) equals (x₀², x_i (i ≠ 0)) by Nakayama, because ∂f/∂x_i ≡ x_{i+m} and ∂f/∂x_{i+m} ≡ x_i modulo q·n + (x₀²); so the quotient is k[x₀]/(x₀²), of dimension 2.
4. A radicial subscheme of rank 2 of affine space lies on a unique line (XV 1.2.9–1.2.10), which gives k(y) = k or k(√a).

**Acceptance.**

- n = 0, Y = Spec k[x]/(x²): T¹ = k[x]/(x², 2x) has dimension 1 for p ≠ 2 and 2 for p = 2.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Lemme 1.2.7, p. 6. The non-degenerate case (the source writes J^n_{Y/k} here). Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Lemme 1.2.8, p. 7. The degenerate case p = 2, n even. Statement independently checked on the page image; described here in our own words.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.tjurinaModuleOfAnOrdinaryQuadraticPoint`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Henselian quadratic coordinate approximation

Target `LefschetzPencilsAndVanishingCycles:LPV.2/tougeron-artin-implicit-function-theorem` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.tougeronArtinImplicitFunctionTheorem`.

In the ordinary quadratic local equation, a formal coordinate change tangent to the identity can be approximated to a prescribed finite order by a henselian coordinate change, under the finite-presentation/Jacobian-ideal hypotheses of Artin’s lemma cited in XV 1.1.2. This is the application of general henselian approximation to the quadratic germ, not a second general approximation theorem.

**Hypotheses.**

- Excellent henselian local base in the approximation application; finite-presentation hypersurface
- The Jacobian-square divisibility condition of XV 1.1.2; the exact general statement is requested from SchemeAndStackFoundations, Part II

**Construction or proof.**

1. Present the coordinate-change equations as a finite-type scheme of solutions.
2. Apply the supplier’s Artin approximation/Jacobian-square lifting statement; keep the prescribed finite jet.
3. Check that the linear part remains invertible and the quadratic leading term is preserved.

**Acceptance.**

- p = 1, X : g(x) = 0 in 𝔸¹_S with g′(s) a unit (δ′ = (g′)): a root modulo I lifts to a root in A, which is Hensel's lemma.

**Direct prerequisites.**

- `SchemeAndStackFoundations:key/henselization`
- `SchemeAndStackFoundations:SF.0`
- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`
- `SchemeAndStackFoundations:key/excellent-schemes`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Théorème 1.1.2 (Tougeron-Artin), p. 2. The statement, continued on p. 3. Statement independently checked on the page image; described here in our own words.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.tougeronArtinImplicitFunctionTheorem`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Henselian versal deformation of a quadratic germ

Target `LefschetzPencilsAndVanishingCycles:LPV.2/elkik-versal-henselian-deformations` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.elkikVersalHenselianDeformations`.

For an isolated ordinary quadratic germ over a field, the versal henselian deformation has the one-parameter nondegenerate model Q−b, or the two-parameter characteristic-two even-dimensional model x₀²+bx₀+c+Q′. A chosen special-fibre identification extends after the coefficient lifts are prescribed. Versality and comparison with the formal deformation are imported from the general Elkik approximation/deformation supplier.

**Hypotheses.**

- Isolated ordinary quadratic germ; finite presentation over a henselian noetherian local base
- Nondegenerate polar form in the first branch; characteristic two with even fibre dimension in the second

**Construction or proof.**

1. Use the Tjurina rank calculation to identify one or two deformation parameters.
2. Apply the supplier’s henselian/formal versality comparison and algebraization.
3. Verify the explicit parameter families by the Jacobian calculation in XV 1.3.1–3.

**Acceptance.**

- The ordinary quadratic point has a one-parameter versal deformation Q − b = 0 (non-degenerate case) and a two-parameter one in the degenerate case, matching the ranks 1 and 2 of T¹ in the Tjurina-module lemma.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/tjurina-module-of-an-ordinary-quadratic-point`
- `SchemeAndStackFoundations:key/henselization`
- `SchemeAndStackFoundations:SF.0`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Théorème 1.1.4 (R. Elkik), p. 4. The existence and uniqueness statement. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 1.1.4, p. 4. The proof is not in SGA 7. Statement independently checked on the page image; described here in our own words.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.elkikVersalHenselianDeformations`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Canonical form of an ordinary quadratic point up to henselisation

Target `LefschetzPencilsAndVanishingCycles:LPV.2/canonical-form-of-an-ordinary-quadratic-point` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.canonicalFormOfAnOrdinaryQuadraticPoint`.

Let y be an ordinary quadratic point of a k-scheme Y and k′ the largest separable subextension of k(y). There are a k′-scheme Y₀ ⊂ 𝔸^{n+1}_{k′}, either the cone Q = 0 of a nondegenerate form with y₀ the origin (1.2.3), or, for p = 2 and n = 2m, the scheme (x₀² − a) + Σ_{0<i≤j≤2m} a_ij x_i x_j = 0 with the 2m-variable form nondegenerate and y₀ = (√a, 0, …, 0) (1.2.4), and a k-isomorphism between the henselisations Y_(y) and Y₀(y₀). The same holds for the affine quadric of a non-homogeneous quadratic form with an ordinary singular point, by an affine change of variables (XV 1.2.12).

**Hypotheses.**

- When a ∉ k², k(y₀) = k(√a) is purely inseparable of degree 2 over k.

**Construction or proof.**

1. Pass to an étale neighbourhood of y that is a k′-scheme, reducing to k(y) purely inseparable over k.
2. dim (Ω¹_{Y/k})_y = n + 1 (check over k̄ after completion), so near y, Y is cut out by one equation f in a smooth k-scheme Z of dimension n + 1.
3. Non-degenerate case: then k(y) = k (Tjurina-module lemma); choose étale coordinates x_i at y with f = Q(x) + (order > 2), so Q(x_i) ∈ m³ on Y. The ideal generated by the ∂Q/∂X_i pulls back to m, and the implicit function theorem (a = m, δ′ = J) gives x′_i ≡ x_i mod m² on Y_(y) with Q(x′_i) = 0, which is the isomorphism.
4. Degenerate case: k(y) = k(√a); the radicial rank-2 subscheme defined by J lies on a line (XV 1.2.9–1.2.10), giving coordinates in which f = (x₀² − a) + Σ a_ij x_i x_j + R; one checks Q(x_i) ≡ 0 mod δ²q on Y (XV 1.2.11.1) and concludes by the implicit function theorem.

**Acceptance.**

- The node xy = 0 is the cone of x₁x₂; y² = x² + x³ at the origin (p ≠ 2) is étale locally the node.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`
- `LefschetzPencilsAndVanishingCycles:LPV.2/tjurina-module-of-an-ordinary-quadratic-point`
- `LefschetzPencilsAndVanishingCycles:LPV.2/tougeron-artin-implicit-function-theorem`
- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Théorème 1.2.6, p. 5. The canonical form. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, proof of 1.2.6, p. 7. The non-degenerate case through the implicit function theorem. Statement independently checked on the page image; described here in our own words.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.canonicalFormOfAnOrdinaryQuadraticPoint`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Local equation of a flat family at an ordinary quadratic point

Target `LefschetzPencilsAndVanishingCycles:LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.localEquationOfAFamilyAtAnOrdinaryQuadraticPoint`.

Let S = Spec A be henselian local with closed point s, f : X → S flat of finite presentation, and x a closed point of X_s at which X_s has an ordinary quadratic singularity, with k(x) purely inseparable over k(s) and X_s of dimension n. (i) If x is non-degenerate, there are a nondegenerate quadratic form Q in n + 1 variables over A and b in the maximal ideal such that the henselisation of X at x is isomorphic to the henselisation at the origin of Q − b = 0 in 𝔸^{n+1}_S. (ii) If x is degenerate (n = 2m, char k(s) = 2), there is Q(x) = x₀² + bx₀ + c + Σ_{1≤i≤j≤2m} a_ij x_i x_j over A with b in the maximal ideal and the 2m-variable form nondegenerate, such that the henselisation of X at x is isomorphic to that of Q = 0 at (√c, 0, …, 0). The isomorphism can be chosen to extend a given one on the special fibre, lifting its coefficients (XV 1.3.3).

**Hypotheses.**

- The source prints x₀ for x₀² in the formula of (ii) (source issue E7).

**Construction or proof.**

1. By the canonical-form theorem, the special fibre at x is the model 1.2.3 or 1.2.4.
2. By XV 1.3.1, the versal henselian deformation of that model over S is Σ a_ij x_i x_j − b = 0 over A{b} (non-degenerate) or (x₀² − a) + Σ a_ij x_i x_j + bx₀ + c = 0 over A{b, c} (degenerate), a consequence of Elkik's theorem and explicit computations (SGA 7 VI 6).
3. X/S is pulled back from the versal deformation along a local morphism S → T, which specialises b (and c) to elements of A.

**Acceptance.**

- A family of curves acquiring a node: xy = b with b ∈ m_A; for a regular total space b is a uniformiser, which is the b(x) of XV 3.3.1.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/canonical-form-of-an-ordinary-quadratic-point`
- `LefschetzPencilsAndVanishingCycles:LPV.2/elkik-versal-henselian-deformations`
- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Corollaire 1.3.2 (i), p. 11. The non-degenerate case. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Remarque 1.3.3, p. 12. The degenerate case with the square present, and the choice extending a given special-fibre isomorphism. Statement independently checked on the page image; described here in our own words.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.localEquationOfAFamilyAtAnOrdinaryQuadraticPoint`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Non-smooth points near an ordinary quadratic point are ordinary quadratic

Target `LefschetzPencilsAndVanishingCycles:LPV.2/non-smooth-points-near-an-ordinary-quadratic-point` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.nonSmoothPointsNearAnOrdinaryQuadraticPoint`.

In the situation of the local-equation theorem, there is a neighbourhood U of x in X such that every point of U at which f is not smooth is an ordinary quadratic point of its fibre.

**Hypotheses.**

- f flat of finite presentation; x an ordinary quadratic point of X_s with k(x) purely inseparable over k(s).

**Construction or proof.**

1. Work on the local model Q − b = 0 (resp. x₀² + bx₀ + c + Σ a_ij x_i x_j = 0).
2. Non-degenerate case: f fails to be smooth exactly where all ∂Q/∂x_i vanish and Q = b, that is, at the origin over V(b); the fibre there is the cone Q = 0, an ordinary quadratic point.
3. Degenerate case: the singular locus is the section x_i = 0 (i ≥ 1), x₀ with x₀² + bx₀ + c = 0 and b = 0 there; each such point is of type 1.2.4 in its fibre.

**Acceptance.**

- In a Lefschetz pencil the singular points of the fibres near x_s are x_s itself, as condition (B) requires.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point`
- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Corollaire 1.3.4, p. 12. The statement. Statement independently checked on the page image; described here in our own words.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.nonSmoothPointsNearAnOrdinaryQuadraticPoint`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Homotopy invariance of étale cohomology

Target `LefschetzPencilsAndVanishingCycles:LPV.2/homotopy-invariance-of-etale-cohomology` · lemma · `TauCeti.AlgebraicGeometry.VanishingCycles.homotopyInvarianceOfEtaleCohomology`.

Let k be algebraically closed, Λ a torsion ring prime to char k, U and V k-schemes, K ∈ D⁺(U, Λ) and L ∈ D⁺(V, Λ). A morphism (U, K) → (V, L) is a pair (f : U → V, φ : f*L → K); it induces f* : H*(V, L) → H*(U, K). Two morphisms f₀, f₁ are homotopic if there are a connected k-scheme T of finite type, points 0, 1 ∈ T(k) and a morphism (U × T, pr₁*K) → (V, L) whose fibres at 0 and 1 are f₀ and f₁. Homotopic morphisms induce the same map on cohomology.

**Hypotheses.**

- k algebraically closed; T connected of finite type.

**Construction or proof.**

1. Join 0 and 1 by a chain of points x₀ = 0, …, x_n = 1 and smooth connected curves Γ_i → T with x_i, x_{i+1} in the image of Γ_i (normalise one-dimensional subschemes through consecutive points). This reduces to T a smooth connected curve.
2. Smooth base change for t : T → Spec k gives t*Rf_*K ≅ Rpr_{2*}(pr₁*K), so R^n pr_{2*}(pr₁*K) is the constant sheaf t*H^n(U, K).
3. f_i* factors as H^n(V, L) → H^n(U × T, pr₁*K) → H⁰(T, t*H^n(U, K)) → H^n(U, K), the last map being the fibre at i; for a constant sheaf on a connected T this does not depend on i.

**Acceptance.**

- The homotheties (x, t) ↦ tx, t ∈ 𝔸¹, make the identity of an affine cone homotopic to the constant map to its vertex.

**Direct prerequisites.**

- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `SchemeAndStackFoundations:SF.2`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Lemme 2.1.3, p. 14. The homotopy lemma and its proof by smooth base change. Statement independently checked on the page image; described here in our own words.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.homotopyInvarianceOfEtaleCohomology`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Cohomology of a cone and of its henselisation at the vertex

Target `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-cone` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfACone`.

Let Y ⊂ P^r be projective over an algebraically closed field k, X ⊂ 𝔸^{r+1} its affine cone with vertex 0, X_(0) the henselisation at 0, X* = X − {0}, X*_(0) = X_(0) − {0}, X₁ ⊂ P^{r+1} the projective cone (X = X₁ − Y), and F a torsion group prime to char k. Then (i) H^i(X, F) ≅ H^i({0}, F), which is F for i = 0 and 0 for i > 0; (ii) H^i_{0}(X, F) ≅ H^i_c(X, F); and H^i(X*, F) ≅ H^i(X*_(0), F) (Corollary 2.1.4).

**Hypotheses.**

- F torsion prime to the characteristic; all cohomology with coefficients in F.

**Construction or proof.**

1. (i): the identity of X is homotopic, through the homotheties, to the constant map with value 0 (homotopy lemma).
2. (ii): homotheties of ratio tending to infinity make Y a deformation retract of X₁ − {0}; the five lemma on the long exact sequences of H_{0}(X) → H(X₁) → H(X₁ − {0}) and H_c(X) → H(X₁) → H(Y) gives (ii).
3. Corollary 2.1.4: the five lemma on the sequences for supports in {0} in X and in X_(0), with (i) and H^i(X_(0)) = H^i({0}) (X_(0) is henselian local).

**Acceptance.**

- Y = P⁰ (X = 𝔸¹): H^i(𝔸¹) = F for i = 0 and 0 otherwise, and H^i_{0}(𝔸¹) = H^i_c(𝔸¹) = F(−1) for i = 2.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/homotopy-invariance-of-etale-cohomology`
- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `SchemeAndStackFoundations:SF.2`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Proposition 2.1.2, p. 13. The proposition (displays (i) and (ii) read on the page image) and its proof. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Corollaire 2.1.4, p. 15. The comparison of the punctured cone with its henselisation. Statement independently checked on the page image; described here in our own words.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfACone`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### The Gysin sequence of a punctured cone and its local analogue

Target `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-punctured-cone` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfAPuncturedCone`.

In the notation of the cone theorem, let X̃, X̃_(0), X̃₁ be the blow-ups of X, X_(0), X₁ at 0, Y₀ the exceptional divisor, h : X̃₁ → Y the projection, and y₀, y_∞ : Y → X̃₁ the sections with images Y₀ and Y. Restriction gives isomorphisms H^i(X̃₁ − Y₀) ≅ H^i(Y) and H^i(X̃) ≅ H^i(Y₀) = H^i(Y), through which the long exact sequences of the pairs (X̃₁ − Y₀, Y) and (X̃₁ − Y, Y₀) become the rows of a commutative diagram (2.1.5.1): … → H^{i−1}(X*) → H^{i−2}(Y)(−1) → H^i(Y) → H^i(X*) → …, the middle arrows being cup product with the class η of a hyperplane section in one row and −η in the other (Lemma 2.1.6). Locally, H^i(X̃_(0)) ≅ H^i(Y₀) by proper base change, and the sequence of (X̃_(0), Y₀) maps to the second row of (2.1.5.1) (diagram (2.1.7.1)).

**Hypotheses.**

- Coefficients F torsion prime to char k.

**Construction or proof.**

1. The Leray spectral sequences of h on X̃₁ − Y₀ and X̃₁ − Y (line bundles over Y) give the restriction isomorphisms.
2. η (resp. −η) is the restriction to Y (resp. Y₀ ≅ Y) of the class of O(Y) (resp. O(Y₀)) on X̃₁ − Y₀ (resp. X̃₁ − Y).
3. Commutativity: both rows come from applying H(Y, ·) to the distinguished triangles y_∞*Ry_∞^!F → R(h|X̃₁ − Y₀)_*F → R(h|X*)_*F → and y₀*Ry₀^!F → R(h|X̃₁ − Y)_*F → R(h|X*)_*F →, whose cohomology sheaves are in degrees 0, 1 and 2 only; this reduces to Y a point, which is checked directly.
4. Local analogue: X̃_(0) → X_(0) is proper, so proper base change gives H^i(X̃_(0)) ≅ H^i(Y₀), and the punctured-cone corollary identifies H^i(X*_(0)) with H^i(X*).

**Acceptance.**

- Y = P^{r−1} (X = 𝔸^r, X* = 𝔸^r − {0}): the sequence recovers H^i(𝔸^r − {0}) = F for i = 0, 2r − 1 and 0 otherwise, because cup with η is an isomorphism H^{i−2}(P^{r−1})(−1) → H^i(P^{r−1}) for 2 ≤ i ≤ 2r − 2.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-cone`
- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `SchemeAndStackFoundations:SF.2`
- `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`
- `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Lemme 2.1.6, p. 16. The Gysin maps in (2.1.5.1). Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 2.1.7, p. 16. The local sequence of (X̃_(0), Y₀). Statement independently checked on the page image; described here in our own words.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfAPuncturedCone`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### An anticommutative boundary diagram for a cone

Target `LefschetzPencilsAndVanishingCycles:LPV.2/boundary-anticommutativity-for-a-cone` · lemma · `TauCeti.AlgebraicGeometry.VanishingCycles.boundaryAnticommutativityForACone`.

In the notation of the punctured-cone theorem, the composite H^{n−1}(Y₀) ≅ H^{n−1}(X̃) → H^{n−1}(X*) → H^n_{0}(X) → H^n_c(X) is the negative of the boundary map ∂ : H^{n−1}(Y) → H^n_c(X) of the pair (X₁, Y), under Y₀ ≅ Y.

**Hypotheses.**

- The source numbers this lemma 2.7.8; it is Lemma 2.1.8, as its application in 2.2.7 says (source issue E9).

**Construction or proof.**

1. By the local analogue (2.1.7.1) it is equivalent to prove that H^{n−1}(X₁ − {0}) → H^n_{0}(X₁) = H^n_{0}(X) → H^n_c(X) agrees with the restriction to Y followed by ∂ : H^{n−1}(Y) → H^n_c(X).
2. This is a compatibility of boundary maps for the closed subsets {0} and Y of X₁ with complement X ∩ (X₁ − {0}) = X*, a general property of the long exact sequences of supports; the sign comes from the orientation reversal of the identification Y₀ ≅ Y (−η versus η).

**Acceptance.**

- It is the step that turns the local generator of XV 2.2.7 into the global class δ of the affine quadric (XII 3.6–3.7).

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-punctured-cone`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Lemme 2.7.8 (= 2.1.8), p. 17. The anticommutative diagram (displayed on the page) and the proof by reduction through 2.1.7. Statement independently checked on the page image; described here in our own words.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.boundaryAnticommutativityForACone`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Standard quadratic degenerations

Target `LefschetzPencilsAndVanishingCycles:LPV.2/standard-quadratic-degeneration` · definition · `TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration`.

Let S be a henselian trait with s, η, s̄, η̄ as in SGA 7 XIII 0.2.5, and Λ = ℤ/k with k invertible on S. A standard quadratic degeneration of relative dimension n is the closed subscheme X ⊂ 𝔸^{n+1}_S defined by Q(x) = Σ_{i≤j} a_ij x_i x_j + Σ b_i x_i + c, nonzero modulo the uniformiser, such that, with X₁ ⊂ P^{n+1}_S the quadric Σ a_ij x_i x_j + Σ b_i x_i z + cz² = 0 and Y = X₁ ∩ H (H the hyperplane at infinity, X = X₁ − Y): (a) Y is a smooth quadric over S, that is, Σ a_ij x_i x_j is ordinary; (b) X_s̄ is a quadratic cone. Its vertex x₀ is the singular point of X_s. The subscheme A of X_s cut out by the ∂Q/∂x_i is concentrated at x₀; it has degree one, so x₀ is rational, except when char k(s) = 2 and n is even, where A has rank 2 and k(x₀) is k(s) or a purely inseparable quadratic extension of k(s). If x₀ = 0, the b_i and c lie in the maximal ideal.

**Hypotheses.**

- The source says 'n + 1 est pair' for the exceptional case; it is n + 1 odd, that is, n even (source issue E12).
- Condition (*) of XV 2.2.5, that the generic fibre is smooth, is a further hypothesis, not part of the definition.

**Construction or proof.**

1. The projective closure is a flat family of quadrics; (a) says its hyperplane section at infinity is smooth.
2. On X_s the ∂Q/∂x_i define the singular locus of the cone, concentrated at the vertex; its degree over k(s) is computed after passing to k(s̄), as in the Tjurina-module lemma.
3. If x₀ is rational, translate it to the origin; since x₀ ∈ X_s is singular, Q and its first derivatives vanish there modulo the maximal ideal, so the b_i and c lie in it.

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration` (structure) — The data (S, Λ, Q) with the ordinarity of the leading form (a) and the cone condition (b).
- `TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration.vertex` (projection) — The singular point x₀ of X_s, rational unless char k(s) = 2 and n is even.
- `TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration.projectiveClosure` (constructor) — X₁ ⊂ P^{n+1}_S with X = X₁ − Y and Y = X₁ ∩ H a smooth quadric over S.
- `TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration.discriminantCharacter` (constructor) — For n even, the character ε : I → {±1} of the separable quadratic extension of k(η) given by the centre of the even Clifford algebra of (2.2.1.1).
- `TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration.ofLocalEquation` (constructor) — The local model Q − b = 0 of a family at a non-degenerate ordinary quadratic point (XV 1.3.2) is a standard degeneration.

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration` — the nearby cycles computed on the standard model
- `LefschetzPencilsAndVanishingCycles:LPV.2/variation-in-a-standard-quadratic-degeneration` — the variation and the character ε
- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2` — XV 3.1.2 is reduced to the standard model through 1.3.2

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.standard_node` (value) — n = 1, Q = xy − π with π a uniformiser: Y = {xy = 0, z = 0} is two points (a smooth quadric of dimension 0), X_s is the cone xy = 0, and the generic fibre is smooth.
- `TauCeti.AlgebraicGeometry.VanishingCycles.standard_double_point` (degenerate) — n = 0, Q = x² − π with p ≠ 2: Y = ∅, X_s = Spec k(s)[x]/(x²) is a cone, and the geometric generic fibre is two points.
- `TauCeti.AlgebraicGeometry.VanishingCycles.not_standard_char_two` (non-example) — char k(s) = 2, n = 1, Q = x² + y² − π: the leading form (x + y)² is not ordinary, so (a) fails.
- `TauCeti.AlgebraicGeometry.VanishingCycles.standard_trivial_family` (non-example) — Q = xy (c = 0): X_η̄ is again a cone, so (*) fails and all R^iΦ vanish (Corollary 2.2.4).

**Acceptance.**

- The node xy = π and the double point x² = π are standard; x² + y² − π in characteristic 2 is not.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`
- `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric`
- `LefschetzPencilsAndVanishingCycles:LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 2.2.1, p. 17. The setting; the equation and its projective closure (2.2.1.1) are on p. 18. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 2.2.1 (a)–(b), p. 18. Hypothesis (a); hypothesis (b) says X_s̄ is a quadratic cone. Statement independently checked on the page image; described here in our own words.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration`, `TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration.vertex`, `TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration.projectiveClosure`, `TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration.discriminantCharacter`, `TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration.ofLocalEquation`, `TauCeti.AlgebraicGeometry.VanishingCycles.standard_node`, `TauCeti.AlgebraicGeometry.VanishingCycles.standard_double_point`, `TauCeti.AlgebraicGeometry.VanishingCycles.not_standard_char_two`, `TauCeti.AlgebraicGeometry.VanishingCycles.standard_trivial_family`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Nearby cycles of a standard quadratic degeneration

Target `LefschetzPencilsAndVanishingCycles:LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyCyclesOfAStandardQuadraticDegeneration`.

Let S be a henselian trait (s, η, s̄, η̄ as in SGA 7 XIII 0.2.5), Λ = ℤ/k with k invertible on S, and X ⊂ 𝔸^{n+1}_S a standard quadratic degeneration: Q = Σ_{i≤j} a_ij x_i x_j + Σ b_i x_i + c, with Y smooth over S and X_s̄ a quadratic cone with vertex x₀. (Proposition 2.2.3) H^i(X_η̄, Λ) ≅ H^i(X_s̄, RΨ_η̄Λ) ≅ R^iΨ_η̄(Λ)_{x₀} and H^i_c(X_η̄, Λ) ≅ H^i_c(X_s̄, RΨ_η̄Λ) ≅ H^i_{x₀}(X_s̄, RΨ_η̄Λ). (Corollary 2.2.4) If X_η̄ is singular, a quadratic cone again, all R^iΦ(Λ) vanish. (2.2.5) If X_η is smooth and S is strictly henselian: (A) R^iΨ_η̄(Λ) = 0 for i ≠ 0, n; for n ≠ 0, Ψ_η̄(Λ) = Λ and R^nΨ_η̄(Λ) is (non-canonically) Λ at x₀ extended by 0; for all n, R^iΦ(Λ) = 0 for i ≠ n and R^nΦ(Λ) is Λ at x₀ extended by 0. (B) H^i_{x₀}(X_s, RΨ_η̄Λ) = 0 for i ≠ n, 2n; the trace H^{2n}_{x₀}(X_s, RΨ_η̄Λ(n)) → Λ is an isomorphism for n ≠ 0, and for n>0, H^n_{x₀}(X_s, RΨ_η̄Λ(n)) ≅ Λ. For n=0, R⁰Ψ_η̄(Λ)_{x₀} and H⁰_{x₀}(X_s,RΨ_η̄Λ) are both Λ²; R⁰Φ is the rank-one cokernel of the diagonal specialization Λ→Λ². (C) (a, b) = Tr(a ∧ b) puts the free Λ-modules R^nΨ_η̄(Λ)_{x₀} and H^n_{x₀}(X_s, RΨ_η̄Λ(n)) in perfect duality.

**Hypotheses.**

- (*) X_η smooth for (A)–(C); S strictly henselian for simplicity.

**Construction or proof.**

1. The left isomorphisms of 2.2.3 are XIII 2.1.8.6 and 2.1.10.5 (proper base change for X₁ and supports).
2. The right ones follow from the cone theorem: in the triangle (Λ on X_s̄)[0] → RΨ_η̄(Λ) → RΦ(Λ) →, the cone theorem applies to Λ on X_s̄ and RΦ(Λ) is supported at x₀.
3. Corollary 2.2.4: if X_η̄ is a cone, H⁰(X_s̄, Λ) = Λ = H⁰(X_η̄, Λ) and all higher groups vanish on both sides, so the long exact sequence XIII 2.1.8.9 gives RΦ = 0.
4. (A)–(B): X_η̄ = X₁,η̄ − Y_η̄ is an affine quadric, so XII 3.7 computes H^i(X_η̄) and H^i_c(X_η̄); pass from ℓ-adic to Λ = ℤ/k coefficients by the universal coefficient formula (XIII 2.1.13).
5. (C): Poincaré duality on X_η̄ and the isomorphisms 2.2.3.

**Acceptance.**

- n = 1, xy = π: R¹Φ(Λ) is Λ at the origin, and H¹_c(X_η̄) ≅ Λ with X_η̄ ≅ 𝔾_m.
- n=0, x²=π with residue characteristic ≠2: R⁰Ψ and degree-zero nearby costalk have rank 2, while R⁰Φ=coker(Λ→Λ²) for the diagonal specialization has rank 1. The trace-zero kernel of Λ²→Λ belongs to the dual support description, not the definition of R⁰Φ.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/standard-quadratic-degeneration`
- `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-cone`
- `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`
- `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`
- `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Proposition 2.2.3, p. 18. The isomorphisms (displayed on p. 19) and their proof. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Corollaire 2.2.4, p. 19. If the geometric generic fibre is singular, the vanishing cycles are 0. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 2.2.5 C, p. 20. The duality (a, b) = Tr(a ∧ b). Statement independently checked on the page image; described here in our own words.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyCyclesOfAStandardQuadraticDegeneration`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### The variation in a standard quadratic degeneration

Target `LefschetzPencilsAndVanishingCycles:LPV.2/variation-in-a-standard-quadratic-degeneration` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.variationInAStandardQuadraticDegeneration`.

Let S be a henselian trait (s, η, s̄, η̄ as in SGA 7 XIII 0.2.5), Λ = ℤ/k with k invertible on S, and X ⊂ 𝔸^{n+1}_S a standard quadratic degeneration: Q = Σ_{i≤j} a_ij x_i x_j + Σ b_i x_i + c, with Y smooth over S and X_s̄ a quadratic cone with vertex x₀. Assume X_η smooth and S strictly henselian. (D) n = 2m > 0: H^n_{x₀}(X_s, RΨ_η̄Λ(m)) and R^nΨ_η̄(Λ(m))_{x₀} have natural generators δ, δ′ defined up to sign (from XII 3.7), which can be normalised so that (δ′, δ) = 1; then φ(δ) = (−1)^m·2·δ′ for the natural map φ from the first to the second. With Z the separable quadratic extension of k(η) given by the centre of the even Clifford algebra of (2.2.1.1) and ε : I → {±1} its character, σδ = ε(σ)δ and σδ′ = ε(σ)δ′, and Var(σ)(a) = ((ε(σ) − 1)/2)(−1)^m (a, δ)δ. (E) n = 2m + 1: H^n_{x₀}(X_s, RΨ_η̄Λ(m)) and R^nΨ_η̄(Λ(m + 1))_{x₀} have natural generators δ, δ′ with (δ′, δ) = 1, and φ(δ) = 0. (F) n = 2m + 1: I acts trivially on the cohomology of X_η̄; Var(σ)(δ′) = λ(σ)δ for a homomorphism λ : I → Λ(1), so λ = λ_X·ε with ε : I → Λ(1) = μ_k the Kummer character σ(t^{1/k}) = ε(σ)t^{1/k} of a uniformiser t and λ_X ∈ Λ depending on X/S; that is, Var(σ)(a) = λ_X ε(σ)(a, δ)δ.

**Hypotheses.**

- (D) is derived in ℤ/2k-coefficients, where (ε(σ) − 1)/2 makes sense, and then reduced.
- λ_X is determined in XV §3; for the local model with b a uniformiser it is (−1)^{m+1} (the carried odd-dimensional node).
- The source writes D(σ) for Var(σ) in (2.2.5.9) (source issue E10).

**Construction or proof.**

1. (D): XII 3.7 gives δ, δ′ on X_η̄ = affine quadric, and φ(δ) = ±2δ′; the normalisation (δ′, δ) = 1 and Tr(δ²) = (−1)^m·2 give φ(δ) = (−1)^m·2δ′.
2. I acts on the two generatrix families of the quadric X₁,η̄ through Z, hence on δ = cℓ(α) − cℓ(β) and on δ′ by ε.
3. Var(σ) maps the rank-one vanishing group to the rank-one group generated by δ, so Var(σ)(a) = c(σ)(a, δ)δ. The identity σ = 1 + q∘Var(σ) (XIII 1.4.3.3), with q(δ) = φ(δ) = (−1)^m·2δ′ and (δ′, δ) = 1, gives ε(σ)δ′ = (1 + 2c(σ)(−1)^m)δ′; computing in ℤ/2k-coefficients, c(σ) = ((ε(σ) − 1)/2)(−1)^m.
4. (E): as in (D) with XII 3.7 for n odd; φ(δ) = 0 because δ² = 0.
5. (F): I acts trivially on H*(X_η̄) by XII 3.7 and because Y is proper and smooth over S. Var(σ)(δ′) is a multiple λ(σ)δ, λ is additive by XIII 1.4.3.4, and every homomorphism from the tame inertia to Λ(1) is a multiple of the Kummer character.

**Acceptance.**

- n = 0, x² = π, p ≠ 2: ε is the character of k(η)(√π), and Var(σ)(a) = −(a, δ)δ when ε(σ) = −1, the swap of the two points.
- n = 1, xy = π: Var(σ)(a) = λ_X t_ℓ(σ)(a, δ)δ with λ_X = −1 (Weil I (4.1): x − (x, δ)δ for n ≡ 1 mod 4).

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration`
- `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics`
- `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric`
- `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`
- `ArithmeticGaloisRepresentations:R01.2`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 2.2.5 D, (2.2.5.3)–(2.2.5.6), p. 21. The character ε and the variation formula (2.2.5.6), read on the page image. Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 2.2.5 F, p. 21. The odd case: trivial action on the cohomology of X_η̄ and (2.2.5.9)–(2.2.5.10) on pp. 21–22. Statement independently checked on the page image; described here in our own words.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.variationInAStandardQuadraticDegeneration`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Local description of the vanishing cycle

Target `LefschetzPencilsAndVanishingCycles:LPV.2/local-description-of-the-vanishing-cycle` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.localDescriptionOfTheVanishingCycle`.

Let S be a henselian trait (s, η, s̄, η̄ as in SGA 7 XIII 0.2.5), Λ = ℤ/k with k invertible on S, and X ⊂ 𝔸^{n+1}_S a standard quadratic degeneration: Q = Σ_{i≤j} a_ij x_i x_j + Σ b_i x_i + c, with Y smooth over S and X_s̄ a quadratic cone with vertex x₀. Assume X_η smooth and S strictly henselian. (n even) ±δ is determined by (2.2.5.3)–(2.2.5.4), which for k a power of an odd prime amounts to (δ, δ) = (−1)^m·2; in general the unordered pair ±δ is obtained from the distinguished geometric classes of XII 3.7 by coefficient reduction with one common geometric sign. Choosing norm-normalized generators independently at each prime factor, even after a ℤ/2^a k lift, does not characterize this pair. (n = 2m + 1 odd, so x₀ is rational) Let X_{s(0)} be the henselisation of X_s at x₀, X̃_{s(0)} its blow-up at x₀, Y₀ the exceptional divisor (a smooth quadric of dimension 2m) and X*_{s(0)} = X_{s(0)} − {x₀}. The composite (2.2.6.2) H^{n−1}(Y₀, Λ(m)) ≅ H^{n−1}(X̃_{s(0)}, Λ(m)) → H^{n−1}(X*_{s(0)}, Λ(m)) → H^n_{x₀}(X_s, Λ(m)) → H^n_{x₀}(X_s, RΨ_η̄Λ(m)) identifies the last group with the primitive quotient of H^{2m}(Y₀, Λ(m)), and ±δ is the image of the natural generators of that primitive quotient.

**Hypotheses.**

- The source asserts the characterisation by (δ, δ) = (−1)^m·2 whenever 2 ∤ k; for k with two distinct odd prime factors it fails (source issue E11).

**Construction or proof.**

1. n even: if δ₁ is another generator with (δ₁, δ₁) = (δ, δ), then δ₁ = uδ with u² = 1 in ℤ/k; u = ±1 exactly when ℤ/k has no other square roots of 1, that is, when k is a power of one odd prime. In general reduce the distinguished geometric classes of XII 3.7 with a single common sign. Mere norm equality, primary-factor reductions or a larger modulus cannot synchronize independent primary signs.
2. n odd: ±δ is determined by its image in H^n_c(X_η̄, Λ(m)); by (2.1.7.1) it suffices that H^{n−1}(Y₀) ≅ H^{n−1}(X̃_s) → H^{n−1}(X*_s) → H^n_{x₀}(X_s) → H^n_c(X_s) → H^n_c(X_η̄) (the last map sp) sends the distinguished generators of the primitive quotient to those of the target.
3. By the anticommutativity lemma, this composite is, up to sign, the boundary ∂ : H^{n−1}(Y_s) → H^n_c(X_s) followed by specialisation, that is, the boundary H^{n−1}(Y_η̄) → H^n_c(X_η̄) of XII 3.6, which maps the generators of the primitive quotient to ±δ (XII 3.7).

**Acceptance.**

- n = 1, xy = π: Y₀ is the two tangent directions at the node, H⁰(Y₀) = Λ², its primitive quotient is Λ, and δ generates H¹_c(X_η̄) = H¹_c(𝔾_m).
- k = 15, m even: u = 4 satisfies u² ≡ 1, so 4δ also has (4δ, 4δ) = 2, and the characterisation by (δ, δ) alone does not single out ±δ.
- The ambiguity persists after a 2-primary lift: 19²=1 in ℤ/60 and 19 reduces to 4 in ℤ/15; this is not the reduction of either globally signed geometric generator.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/variation-in-a-standard-quadratic-degeneration`
- `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-punctured-cone`
- `LefschetzPencilsAndVanishingCycles:LPV.2/boundary-anticommutativity-for-a-cone`
- `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics`
- `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-smooth-quadrics`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 2.2.6, p. 22. The local description, including (2.2.6.1). Statement independently checked on the page image; described here in our own words.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Lemme 2.2.7, pp. 22–23. The identification through (2.2.6.2), proved on p. 23 by applying 2.1.8. Statement independently checked on the page image; described here in our own words.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.localDescriptionOfTheVanishingCycle`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Complex comparison and the Picard–Lefschetz sign table

Target `LefschetzPencilsAndVanishingCycles:LPV.2/complex-picard-lefschetz-comparison` · comparison · `TauCeti.AlgebraicGeometry.VanishingCycles.complexPicardLefschetzComparison`.

For an algebraic ordinary quadratic degeneration over C, compare the finite-coefficient étale specialization triangle, inertia and the primitive-quadric vanishing generator with the classical Milnor-fibre triangle and positively oriented small loop. Cup products, trace and Tate orientation are part of the comparison. For n modulo 4 equal to 0,1,2,3, the Picard–Lefschetz coefficient is respectively −,−,+,+ and the vanishing self-pairing is 2,0,−2,0. The complex comparison is a verification of conventions, not the algebraic proof in positive characteristic.

**Hypotheses.**

- Algebraic finite-type complex family with a single ordinary quadratic critical point; properness for the global sequence
- Finite coefficients, then adic realization; compatible loop and Tate orientations

**Construction or proof.**

1. Import the PR196 ComplexComparison relative comparison, cup-product and trace compatibility, and Riemann-existence path identification.
2. Use the ordinary local normal form to identify the algebraic primitive quadric generator with the Milnor vanishing sphere up to sign.
3. Compare the specialization exact sequences and their monodromy operators.
4. Check the four coefficient/self-pairing entries from Weil I 4.1; changing δ to −δ leaves the operator unchanged.

**Acceptance.**

- The n=0 model z²=t exchanges the two points and δ=(1,−1) has square 2.
- The n=1 nodal Milnor fibre gives a transvection with coefficient − and δ²=0.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`
- `LefschetzPencilsAndVanishingCycles:LPV.2/local-description-of-the-vanishing-cycle`
- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `SchemeAndStackFoundations:SF.2`
- `EtaleDualityAndPerverseSheaves:EDC.6`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4.1, pp. 287–288. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.complexPicardLefschetzComparison`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Wild quadratic-character branch

Target `LefschetzPencilsAndVanishingCycles:LPV.2/quadratic-character-in-characteristic-two` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.wildQuadraticPicardLefschetz`.

In even fibre dimension and residue characteristic two, the ordinary quadratic vanishing stalk is still rank one, but the inertia character is the separable quadratic character of the even Clifford center of the generic quadratic model. It can be wildly ramified, so it is not replaced by the unique tame quadratic character used when p≠2. The rational local monodromy formula is x↦x+(-1)^m((ε_x(σ)−1)/2)(x,δ)δ, with δ²=(-1)^m·2; the finite even-coefficient formula is defined by lifting before dividing by two.

**Hypotheses.**

- Ordinary quadratic point; even relative dimension; smooth generic fibre
- Rational ℓ-adic coefficients with ℓ≠2, or the finite-level lift convention
- The character may be trivial; a nontrivial reflection is asserted only where ε_x(σ)=−1

**Construction or proof.**

1. Apply the general even variation theorem and identify the Clifford-center separable extension.
2. In characteristic two retain the linear x₀ term of the local model; its discriminant extension is not tame Kummer of a uniformizer.
3. Use the rational pairing normalization to obtain the reflection, keeping the finite-level lifting convention for the division by two.

**Acceptance.**

- For a characteristic-two zero-dimensional separable quadratic family the two generic points are exchanged by the wild quadratic character.
- Tame-generation conclusions of LPV.5 are not applied to this wild branch without their additional hypotheses.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2`
- `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric`
- `LefschetzPencilsAndVanishingCycles:LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point`
- `ArithmeticGaloisRepresentations:R01.2`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 4.2.1–3, pp. 220–221. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.wildQuadraticPicardLefschetz`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Isolated nonordinary quadratic concentration

Target `LefschetzPencilsAndVanishingCycles:LPV.2/isolated-nonordinary-quadratic-concentration` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.nonordinaryQuadraticConcentration`.

For the isolated quadratic hypersurface singularities in residue characteristic two covered by Illusie’s 2003 Corollary 2.10, including the nonordinary singularities used by Fresán–Sabbah–Yu §5.1.3, R^iΦ Q_l is zero outside the middle degree n. This gives injective specialization H^n(X_s̄)→H^n(X_η̄) in the proper setting. No rank-one, reflection, or ordinary-quadric generator assertion is made for these nonordinary stalks.

**Hypotheses.**

- Isolated quadratic hypersurface singularity in the precise 2003 corollary’s class; ℓ≠2
- The original corollary’s complete hypotheses remain source gap G-nonordinary; FSY supplies the verified application
- Properness for the stated global injection

**Construction or proof.**

1. Use FSY’s explicit characteristic-two isolated quadratic local equation to identify the application.
2. Import the middle-concentration result from Illusie 2003 Corollary 2.10, retaining its unresolved original-source hypothesis check.
3. Apply the proper specialization triangle; vanishing below n makes the middle specialization injective.

**Acceptance.**

- The characteristic-two FSY boundary singularity is routed here, rather than to the ordinary rank-one theorem.
- The exact sequence retains the actual middle vanishing-stalk dimension as a parameter.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`
- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`

**Sources.**

- [Javier Fresán, Claude Sabbah and Jeng-Daw Yu, Hodge theory of Kloosterman connections](https://arxiv.org/pdf/1810.06454), §5.1.3, pp. 43–44; citation [30, Corollary 2.10] in the downloaded arXiv text. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.nonordinaryQuadraticConcentration`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Fresán–Sabbah–Yu quadratic discriminant example

Target `LefschetzPencilsAndVanishingCycles:LPV.2/fsy-discriminant-example` · application · `TauCeti.AlgebraicGeometry.VanishingCycles.fsyDiscriminantExample`.

In the odd-prime ordinary quadratic models of FSY §5.1.3 with k=2m+1, the orthogonal vanishing line has square (-1)^m·2, Tate twist −m, and the quadratic Galois character of the explicitly computed Hessian determinant. The paper identifies its field by adjoining a square root of (-1)^((1+ap)/2)·2ap. This is a worked check of the even-dimensional Picard–Lefschetz discriminant interface; the motives’ weight and Hodge conclusions remain with their owners.

**Hypotheses.**

- The FSY §5.1.3 ordinary points and odd prime p; the paper’s a,p indexing
- Even fibre dimension k−1=2m

**Construction or proof.**

1. Compute the ordinary tangent quadratic form in the paper’s local coordinates.
2. Apply the Clifford/discriminant character theorem and the self-pairing normalization.
3. Compare with the determinant and quadratic field displayed by FSY, retaining its Tate twist.

**Acceptance.**

- The displayed square-class, twist −m and self-pairing are all checked together.
- The characteristic-two example is governed by the separate nonordinary-concentration node.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2`
- `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics`
- `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric`
- `ArithmeticGaloisRepresentations:R01.2`

**Sources.**

- [Javier Fresán, Claude Sabbah and Jeng-Daw Yu, Hodge theory of Kloosterman connections](https://arxiv.org/pdf/1810.06454), §5.1.3, pp. 41–44, including determinant calculation on p. 44. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.fsyDiscriminantExample`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

**Stage remaining work.**

- Elaborate the exact geometric/derived API and test forms itemized under G-prototype-LPV-2 after their supplier interfaces are available.
- G-algebraic-PL: Illusie, Sur la formule de Picard–Lefschetz, Adv. Stud. Pure Math. 36 (2002), 249–268, DOI 10.2969/aspm/03610249: publisher PDF was blocked. The author’s 2021 §6.1 and §6.3 and ErrPL.pdf were read and give the algebraic two-component route and corrected concentration range. The original blowup/base-change calculation determining the odd sign still needs its primary proof read and checked. It is not replaced by SGA 7’s transcendental proof or by LPV.7.
- G-nonordinary: FSY §5.1.3 was read and verifies the characteristic-two application and middle concentration it cites. Illusie, Perversité et variation, Manuscripta Math. (2003), Corollary 2.10, DOI 10.1007/s00229-003-0407-z, was not obtained; its exact general class of isolated quadratic singularities and proof need checking before widening the FSY application.
- G-approximation: The SGA 7 XV cited application and quadratic models were read. Artin’s original Lemma 5.10 and Elkik’s original versality proof were not read. Their general results are requested as SchemeAndStackFoundations, Part II; the LPV nodes contain only their quadratic applications.

## LPV.3

An actual axis defines its dual parameter line and incidence family. Transversality, a smooth total space, finitely many exceptional points and an ordinary quadratic germ on each exceptional fibre all enter the pencil predicate. Existence uses the conormal/dual geometry and the degree-two two-point jet estimate; finite-field descent uses a closed point of the good-axis open and then finite-field arithmetic. The line, quadric, cubic and Hermitian examples fix geometric models and axes.

Coverage: **planned**. All original stage targets have nodes whose prerequisite chains terminate in checked baseline declarations, exact independent supplier nodes, requested owner stages or explicit source/prototype gaps. Planned at target level; not closed or independently accepted.

### Lefschetz pencil of hyperplane sections

Target `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil` · definition · `TauCeti.AlgebraicGeometry.LefschetzPencil.IsLefschetzPencil`.

Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. For a linear subspace A ⊂ P of codimension 2 (the axis), let D ⊂ P̌ be the dual line of hyperplanes containing A, X_t = X ∩ H_t for t ∈ D, X̃ = {(x, t) ∈ X × D : x ∈ H_t} with projections π : X̃ → X and f : X̃ → D, so that f^{-1}(t) = X_t. The family (X_t)_{t∈D} is a Lefschetz pencil if: (A) A is transverse to X, so that π : X̃ → X is the blow-up of X along A ∩ X and X̃ is smooth; (B) there are a finite subset S ⊂ D and points x_s ∈ X_s (s ∈ S) such that f is smooth outside {x_s : s ∈ S}; (C) each x_s is an ordinary quadratic singular point of X_s. Then, for each s ∈ S, the local theory applies to the henselisation D_s of D at s and X̃ ×_D D_s.

**Hypotheses.**

- Transversality of A means A ∩ X is smooth of codimension 2 in X, or empty.
- Ordinary quadratic singular points are those of the LPV.2 node ordinary-quadratic-point (SGA 7 XV 1.2.1).

**Construction or proof.**

1. Define X̃ as the closed subscheme of X × D cut out by the incidence x ∈ H_t, a bilinear equation in the coordinates of P and D.
2. Under (A), identify X̃ with the blow-up of X along A ∩ X: A ∩ X is cut out by the two linear forms defining D, and X̃ is their graph closure (EDC.4's blow-up along a smooth centre of codimension 2).
3. Condition (B) makes S finite with f smooth elsewhere; condition (C) is LPV.2's local condition at x_s.

**API.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.IsLefschetzPencil` (data) — IsLefschetzPencil X A : Prop, conditions (A)–(C) for the axis A.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.totalSpace` (constructor) — X̃ ⊂ X × D with π and f, and f^{-1}(t) = X ∩ H_t.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.totalSpace_iso_blowup` (characterisation) — Under (A), π : X̃ ≅ Bl_{A∩X} X and X̃ is smooth over k.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.singularSet` (constructor) — The finite set S ⊂ D with its points x_s, and f smooth on X̃ − {x_s}.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.localModel` (compatibility) — X̃ ×_D D_s → D_s is proper, X̃ ×_D D_s is regular of dimension n + 1, and it is smooth except at the ordinary quadratic point x_s.

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils` — the existence theorem after a Veronese re-embedding
- `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil` — the cohomology sheaves R^i f_*ℚ_ℓ of the pencil
- `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace` — the vanishing cycles δ_s, s ∈ S
- `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system` — the pencil over 𝔽_q in Deligne's proof
- `WeightsInEtaleCohomology:R34.4` — geometric reduction to a pencil

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.line_in_plane` (degenerate) — X a line in P², A a point not on X: every line through A meets X transversally in one point, so S = ∅ and f : X̃ = X → D is an isomorphism. This is a Lefschetz pencil with no singular fibre.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.quadric_surface` (value) — X a smooth quadric surface in P³, p ≠ 2, A a general line: S has two points, each X_s is a pair of lines meeting in one point, and X̃ is X blown up in the two points of A ∩ X; χ(X̃) = 6 = 2·2 + 2·1.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.cubic_surface` (value) — X a smooth cubic surface in P³, p = 0, A a general line: |S| = 12, the degree 3·2² of the dual surface, each X_s a plane cubic with one node; χ(X̃) = 9 + 3 = 12 = 2·0 + 12·1.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.hermitian_curve_not_lefschetz` (non-example) — p odd, q = p^e, X = {x^{q+1} + y^{q+1} + z^{q+1} = 0} ⊂ P²: along the tangent direction (u, v) at an affine point (a, b), with a^q u + b^q v = 0, one has F(a + tu, b + tv) = t^q(a u^q + b v^q) + t^{q+1}(u^{q+1} + v^{q+1}). So every tangent line meets X with multiplicity ≥ q ≥ 3 at its point of tangency, condition (C) fails, and no pencil of lines is Lefschetz in this embedding.

**Acceptance.**

- A line in P² (no singular fibre), the quadric surface (two nodal fibres, δ = 0), the cubic surface (twelve nodal fibres), and the Hermitian curve, where condition (C) fails in the original embedding.

**Direct prerequisites.**

- `EtaleDualityAndPerverseSheaves:EDC.4`
- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`
- `LefschetzPencilsAndVanishingCycles:LPV.2/non-smooth-points-near-an-ordinary-quadratic-point`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.1), p. 289. The pencil of hyperplanes containing the axis A and the diagram X ← X̃ → D (5.1.1).
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.6), p. 291. The definition, with conditions A)–C) over an algebraically closed field.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.6), p. 292. The local theory of §4 applies at each s ∈ S.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.LefschetzPencil.IsLefschetzPencil`, `TauCeti.AlgebraicGeometry.LefschetzPencil.totalSpace`, `TauCeti.AlgebraicGeometry.LefschetzPencil.totalSpace_iso_blowup`, `TauCeti.AlgebraicGeometry.LefschetzPencil.singularSet`, `TauCeti.AlgebraicGeometry.LefschetzPencil.localModel`, `TauCeti.AlgebraicGeometry.LefschetzPencil.line_in_plane`, `TauCeti.AlgebraicGeometry.LefschetzPencil.quadric_surface`, `TauCeti.AlgebraicGeometry.LefschetzPencil.cubic_surface`, `TauCeti.AlgebraicGeometry.LefschetzPencil.hermitian_curve_not_lefschetz`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Lefschetz pencil**.

### The dual variety and the incidence family

Target `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety` · definition · `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety`.

Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. Let Y = {(x, t) ∈ X × P̌ : x ∈ H_t} with g : Y → P̌, whose fibre over t is X_t = X ∩ H_t. The dual variety X̌ ⊂ P̌ is the set of t such that H_t is tangent to X, that is, X_t is singular or X ⊂ H_t. It is closed and, when nonempty, irreducible, and g is smooth outside g^{-1}(X̌). For a Lefschetz pencil with parameter line D, S = D ∩ X̌.

**Hypotheses.**

- X smooth, connected and projective; irreducibility of X̌ comes from its description as the image of the conormal variety, a projective bundle over X.

**Construction or proof.**

1. The conormal variety C = {(x, t) : x ∈ X, T_xX ⊂ H_t}, T_xX the projective tangent space, is a projective bundle over X with fibres P^{N−n−2} (empty when N = n + 1), hence irreducible when nonempty; X̌ is its closed image and is irreducible when nonempty. When X=P the conormal incidence and dual are empty.
2. t ∉ X̌ exactly when X ∩ H_t is smooth of dimension n (the Jacobian criterion at each x ∈ X ∩ H_t), which is the smoothness of g at the points of g^{-1}(t).
3. For a pencil, t ∈ D lies in S exactly when X_t is singular, that is, t ∈ X̌ (X ⊂ H_t cannot happen for t ∈ D: A ∩ X has codimension 2 in X).

**API.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety` (constructor) — X̌ ⊂ P̌, the reduced closed image of the conormal variety {(x, t) : T_xX ⊂ H_t}.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.mem_dualVariety_iff` (characterisation) — t ∈ X̌ if and only if X ∩ H_t is singular or X ⊂ H_t.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_isIrreducible` (characterisation) — If X is smooth, connected, projective and its dual is nonempty, the reduced dual is irreducible. For X equal to the ambient projective space the dual is empty.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.incidence_smooth_off_dual` (characterisation) — g : Y → P̌ is smooth over P̌ − X̌.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.singularSet_eq_inter_dual` (compatibility) — For a Lefschetz pencil, S = D ∩ X̌.

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups` — π₁ of the complement P̌ − X̌
- `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate` — irreducibility of X̌ and connectedness of its smooth locus
- `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils` — general lines D meet X̌ transversally in its good locus

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_projectiveSpace` (degenerate) — X = P: every H_t ∩ P = H_t is smooth and P ⊄ H_t, so X̌ = ∅.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_linear` (value) — X a linear subspace of dimension d, 1 ≤ d < N: X ∩ H_t is always smooth, so X̌ = {t : X ⊂ H_t}, a linear subspace of codimension d + 1 ≥ 2, not a hypersurface.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_conic` (value) — X the conic xz = y² in P², p ≠ 2: X̌ is the conic of lines (a : b : c) with b² = 4ac.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_conic_char_two` (non-example) — p = 2, X the conic xz = y²: the tangent line at (s² : st : t²) is t²x + s²z = 0, which passes through the nucleus (0 : 1 : 0). So X̌ is a line in P̌² and X → X̌ is purely inseparable of degree 2, not the dual conic.

**Acceptance.**

- X = P gives X̌ = ∅; a smooth plane conic has the dual conic for p ≠ 2 and a line for p = 2.

**Direct prerequisites.**

- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:key/henselization`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, proof of (5.4), p. 290. The dual variety X̌: the t such that H_t is tangent to X (X_t singular or X ⊂ H_t); it is irreducible (p. 291).

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety`, `TauCeti.AlgebraicGeometry.LefschetzPencil.mem_dualVariety_iff`, `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_isIrreducible`, `TauCeti.AlgebraicGeometry.LefschetzPencil.incidence_smooth_off_dual`, `TauCeti.AlgebraicGeometry.LefschetzPencil.singularSet_eq_inter_dual`, `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_projectiveSpace`, `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_linear`, `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_conic`, `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_conic_char_two`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Existence of Lefschetz pencils after a Veronese re-embedding

Target `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.existenceOfLefschetzPencils`.

Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. For r ≥ 1 let i_r : P → P^{C(N+r, N) − 1} be the Veronese embedding by the monomials of degree r, whose hyperplane sections are the degree-r hypersurfaces of P. If r ≥ 2 and X is embedded by i_r ∘ i_1, then every sufficiently general pencil of hyperplane sections is a Lefschetz pencil: the axes A for which (X_t)_{t∈D} is a Lefschetz pencil contain a nonempty open subset of the Grassmannian of codimension-2 linear subspaces. Equivalently, a sufficiently general pencil of degree-r hypersurface sections of X is Lefschetz. For r = 1 and p ≠ 0 there may be no Lefschetz pencil of hyperplane sections at all.

**Hypotheses.**

- k algebraically closed.
- r ≥ 2 in the positive statement; the r = 1 failure needs p ≠ 0.

**Construction or proof.**

1. Use the Veronese ordinary-axis open and its degree-two-aware jet estimate from XVII §§3–4.
2. Choose an axis in that nonempty open, with the curve/empty-center branch included.
3. Use the incidence blowup to obtain the smooth projective total space and hyperplane fibres.
4. The ordinary one-point conditions give finitely many critical fibres; no universally étale Gauss map is assumed.

**Acceptance.**

- The Hermitian curve of degree q + 1 in characteristic p odd has no Lefschetz pencil of lines, while a general pencil of conics (r = 2) is Lefschetz.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.3/ordinary-axis-open-and-jet-separation`
- `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil`
- `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`
- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`
- `SchemeAndStackFoundations:SF.0`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.7), p. 292. For p ≠ 0 the given embedding may admit no Lefschetz pencil.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.7), p. 292. For r ≥ 2 a sufficiently general pencil of degree-r hypersurface sections is Lefschetz; the dimension of the Veronese space, C(N+r, N) − 1, was read on the page image.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.13) C), p. 294. The proof is SGA 7 XVII.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.existenceOfLefschetzPencils`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Existence of Lefschetz pencils**.

### Ordinary axis open and Veronese jet estimates

Target `LefschetzPencilsAndVanishingCycles:LPV.3/ordinary-axis-open-and-jet-separation` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.ordinaryAxisOpen`.

For a smooth projective connected X of positive dimension, after a Veronese embedding of degree r≥2 the hyperplanes whose section has exactly one ordinary quadratic singularity form a dense open in the relevant dual locus, and the locus of bad hyperplanes has codimension at least two in the dual projective space. Together with transversality of the base axis this gives a nonempty open of good pencil axes. Degree two requires the separate two-point jet estimate: the common mixed coefficient can reduce the number of independent conditions by one when the joining line lies in both tangent spaces; the linear-X case is treated by an explicit quadratic pencil.

**Hypotheses.**

- Smooth connected projective X; dim X≥1; algebraically closed base; r≥2
- The good-axis conditions concern ordinary singularities, not separability of the Gauss map in all characteristics

**Construction or proof.**

1. Use the degree-r one-jet map and prescribe a nondegenerate quadratic two-jet at one point.
2. Bound sections with nonordinary singularity using the quadratic-form open.
3. Estimate the two-singular-point incidence, separating r≥3 from r=2 and its common-coefficient defect; handle linear X explicitly.
4. Combine these codimension bounds with the open transversality condition on the axis.

**Acceptance.**

- A degree-two embedding of a linear variety is covered by the explicit quadratic-pencil branch.
- The degree-two proof does not assert surjectivity onto two arbitrary independent one-jet spaces.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`
- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`
- `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:key/henselization`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XVII, 2.5, 3.2–7 and 4.1–3; Proposition 4.3 for the degree-two two-point jet bound. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.ordinaryAxisOpen`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Incidence pencil and its blowup description

Target `LefschetzPencilsAndVanishingCycles:LPV.3/incidence-pencil-blowup` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.incidencePencilBlowup`.

Let X⊂P be smooth projective and A a codimension-two axis meeting X transversely. The incidence family X̃={(x,H):x∈X∩H, H⊃A} over the dual line D is canonically Bl_(A∩X)X, with the actual hyperplane fibres. The center is smooth of codimension two when nonempty, X̃ is smooth, and f:X̃→D is projective. For a curve the general axis misses X, the center is empty and the blowup is X.

**Hypotheses.**

- Smooth projective X; transverse axis; dim X≥1
- Empty center allowed in dimension one

**Construction or proof.**

1. Write the incidence equation s₀u₁−s₁u₀=0 using the two sections cutting out the axis.
2. Use the Rees-algebra universal property and regular-sequence condition to identify it with the blowup.
3. Verify smoothness in its two coordinate charts and projectivity of the pencil map.
4. Treat the empty-center case using the universal property.

**Acceptance.**

- A quadric-surface pencil blows up the two points of its axis intersection.
- A line in P² with a disjoint point axis has total space X and no critical fibre.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:key/henselization`
- `SchemeAndStackFoundations:SF.4`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), XVIII §§2–3; XVII 2.2. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.incidencePencilBlowup`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Finite-extension descent of good axes

Target `LefschetzPencilsAndVanishingCycles:LPV.3/finite-field-pencil-descent` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.finiteFieldPencilDescent`.

A nonempty good-axis open defined over F_q has a point over some finite extension F_(q^r). The resulting axis, finite singular set and ordinary local models descend at finite presentation to that finite extension. After this base extension arithmetic Frobenius is Frob_q^r on the original cohomology, and the pencil can be supplied to the DWP.4 dimension induction. The open need not have an F_q-rational point.

**Hypotheses.**

- Smooth projective variety over F_q; Veronese degree≥2; geometrically nonempty good-axis open
- Finite-presentation descent; ℓ≠p

**Construction or proof.**

1. Construct the Galois-stable good-axis open using the jet/codimension proof.
2. Use the residue field of a closed point of this finite-type F_q open to obtain a finite extension.
3. Descend the incidence equation and all finite-presentation local conditions.
4. Transport the ℓ-adic realization and identify Frob_(q^r)=Frob_q^r before the weight-roadmap application.

**Acceptance.**

- The descent theorem supplies a finite extension rather than claiming a rational axis over every small finite field.
- A Frobenius eigenvalue α becomes α^r after extension; the supplier’s weight descent uses this power relation.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.3/ordinary-axis-open-and-jet-separation`
- `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`
- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `SchemeAndStackFoundations:SF.2`
- `ArithmeticGaloisRepresentations:R01.2`
- `FiniteFieldsAndCharacterSums:FF.0`
- `SchemeAndStackFoundations:SF.0`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §7.1, p. 299, choice of pencil after finite extension. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.finiteFieldPencilDescent`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Finite-field pencil descent**.

### Inseparable Gauss map and low-dimensional pencil cases

Target `LefschetzPencilsAndVanishingCycles:LPV.3/inseparable-gauss-and-low-dimension` · comparison · `TauCeti.AlgebraicGeometry.VanishingCycles.inseparableGaussPencilCases`.

In characteristic two and even fibre dimension n, the ordinary hyperplane locus can have an inseparable Gauss map; a Lefschetz axis is not required to meet the reduced dual transversely as if that map were étale. For a linear X the dual has codimension at least two and a general pencil can have no singular fibres; for X=P the dual is empty. A curve has an empty general base axis. Connected-fibre cohomology arguments are applied only in dimensions where the weak Lefschetz connectedness hypotheses hold, with n=0 handled by finite fibres.

**Hypotheses.**

- The all-characteristic ordinary-pencil definition of XVII 2.2
- Separate n=0, empty-dual and dual-defective cases

**Construction or proof.**

1. Use the Hessian/Gauss differential criterion of XVII 3.3–5.
2. Separate the characteristic-two parity where ordinary does not imply nondegenerate polar Hessian.
3. Apply the codimension-two bad-locus existence criterion directly, without an invalid reduced-dual transversality requirement.
4. Check the linear and curve models and the dimension hypotheses for connected fibres.

**Acceptance.**

- The characteristic-two conic has a line as reduced dual and purely inseparable degree-two Gauss map.
- The line-in-plane pencil has finite singleton fibres and no singular locus.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`
- `LefschetzPencilsAndVanishingCycles:LPV.3/ordinary-axis-open-and-jet-separation`
- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`
- `EtaleDualityAndPerverseSheaves:EDC.4`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 4.2.1–3 and 4.2.7, pp. 219–221. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.inseparableGaussPencilCases`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

**Stage remaining work.**

- Elaborate the exact geometric/derived API and test forms itemized under G-prototype-LPV-3 after their supplier interfaces are available.

## LPV.4

Globalize transported cycles, identify the fixed orthogonal and descend the pairing to the radical quotient. Compute pencil-specific restriction/Gysin maps using imported blowup cohomology. The middle reduction lists both nonradical and totally isotropic exact sheaf chains, the zero-cycle case and the surviving Leray subquotients. It retains d₂ and extension classes. The proposed local-line twist correction in E24 is separate from the previously confirmed sign corrections.

Coverage: **planned**. All original stage targets have nodes whose prerequisite chains terminate in checked baseline declarations, exact independent supplier nodes, requested owner stages or explicit source/prototype gaps. Planned at target level; not closed or independently accepted.

### The cohomology sheaves of a Lefschetz pencil

Target `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologySheavesOfALefschetzPencil`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. R^n f_*ℚ_ℓ is lisse on U and tamely ramified at each s ∈ S. (a) If the vanishing cycles are nonzero: R^i f_*ℚ_ℓ is constant on D for i ≠ n, and R^n f_*ℚ_ℓ = j_*j^*R^n f_*ℚ_ℓ. (b) If they are zero (possible only for n = 2m + 1 odd): R^i f_*ℚ_ℓ is constant for i ≠ n + 1, there is an exact sequence 0 → ⊕_{s∈S} ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → ℱ → 0 with ℱ constant, and E = 0. If one vanishing cycle is zero, all are.

**Hypotheses.**

- The vanishing cycle δ_s is the one of the local theory at s, transported to X_u; being zero does not depend on the transport.

**Construction or proof.**

1. f is smooth and proper over U, so each R^i f_*ℚ_ℓ is lisse on U (smooth and proper base change).
2. At s ∈ S apply the local theory to X̃ ×_D D_s: the inertia at s acts through t_ℓ (n odd) or ε (n even, p ≠ 2), so R^i f_*ℚ_ℓ is tamely ramified at s, and the local description of the Lefschetz-degeneration node holds at s.
3. If δ_s ≠ 0 for all s: for i ≠ n, R^i f_*ℚ_ℓ is lisse near every s, hence lisse on D = P¹; a lisse sheaf on P¹_k is constant because π₁(P¹_k) = 1. In degree n the local statement R^n = j_*j^*R^n at every s gives it globally.
4. If δ_s = 0 for all s: the same argument in degrees i ≠ n + 1; in degree n + 1 the local sequences at the points of S glue to the stated sequence, with ℱ = j_*j^*R^{n+1} f_*ℚ_ℓ lisse on D, hence constant. E is spanned by the δ_s, so E = 0.
5. All δ_s are conjugate up to sign under π₁(U, u) (conjugacy theorem), so one is zero if and only if all are.

**Acceptance.**

- The quadric-surface pencil (n = 1, |S| = 2) is in case (b): R² f_*ℚ_ℓ has an extra ℚ_ℓ(−1) at each of the two singular fibres.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil`
- `LefschetzPencilsAndVanishingCycles:LPV.2/direct-images-at-a-lefschetz-degeneration`
- `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate`
- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `SchemeAndStackFoundations:SF.2`
- `InverseGaloisAndArithmeticFundamentalGroups:IG.1`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.8), p. 292. The exclusion of p = 2 with n even, and tame ramification of R^n f_*ℚ_ℓ at each s ∈ S.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.8) a) 1)–2), p. 292. Constancy for i ≠ n and R^n f_* = j_*j^*R^n f_*.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.8) b), p. 293. The exceptional case, with the sequence 0 → ⊕_{s∈S} ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → ℱ → 0, read on the page image.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.13) D), p. 294. The proof of (5.8) is SGA 7 XVIII.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologySheavesOfALefschetzPencil`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### The vanishing subspace E of the middle cohomology

Target `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace` · construction · `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. For s ∈ S, an étale path from u to a geometric generic point of D_s transports the local vanishing cycle to δ_s ∈ H^n(X_u, ℚ_ℓ)(m), well defined up to sign once the path is fixed; changing the path changes δ_s by an element of π₁(U, u). Identify ℚ_ℓ(m) with ℚ_ℓ by a generator of ℤ_ℓ(1) (k is algebraically closed). The vanishing subspace E ⊂ H^n(X_u, ℚ_ℓ) is the span of all transports gδ_s (g ∈ π₁(U, u), s ∈ S). It does not depend on the paths and is π₁(U, u)-stable. For suitable paths (tame generators), E is already spanned by the δ_s, s ∈ S (monodromy-generation theorem).

**Hypotheses.**

- Only E is independent of the paths, not the individual oriented vectors δ_s.

**Construction or proof.**

1. Transport: the local vanishing cycle lives in H^n of the geometric generic fibre of X̃ ×_D D_s; a path identifies that fibre functor with the one at u.
2. Path independence and stability: a change of path is an element of π₁(U, u), so the set of all transports is π₁-stable and its span E is π₁-stable and path-free.
3. Local monodromy: the Picard–Lefschetz formula, transported along the path.

**API.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle` (constructor) — vanishingCycle (s : S) (γ : path u ⇝ η̄_s) : H^n(X_u, ℚ_ℓ)(m), up to sign.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle_changePath` (compatibility) — vanishingCycle s (g · γ) = ± g • vanishingCycle s γ for g ∈ π₁(U, u).
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace` (constructor) — E : Submodule ℚ_ℓ (H^n(X_u, ℚ_ℓ)), the span of all vanishing cycles for all paths.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_stable` (characterisation) — g • E = E for every g ∈ π₁(U, u).
- `TauCeti.AlgebraicGeometry.LefschetzPencil.localMonodromy_vanishingCycle` (characterisation) — σ in the inertia at s acts on H^n(X_u) by x ↦ x + (−1)^{m+1} t_ℓ(σ)(x, δ_s)δ_s (n odd), and by the reflection in δ_s when ε(σ) = −1 (n even).

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.4/fixed-space-of-the-local-transvections` — E^⊥ as the common fixed space of the local transvections
- `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing` — the radical quotient E/(E ∩ E^⊥) and its form
- `LefschetzPencilsAndVanishingCycles:LPV.5/absolute-irreducibility-of-the-vanishing-quotient` — absolute irreducibility of E/(E ∩ E^⊥)
- `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system` — the lisse subsheaf ℰ₀ with fibre E over 𝔽_q

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_eq_bot_of_no_singular_fibre` (degenerate) — If S = ∅ (a line in P²) then E = 0.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_quadric_surface` (value) — Quadric-surface pencil: |S| = 2 but each δ_s lies in H^1 of a conic, which is 0, so E = 0 (case (b)).
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_conic` (value) — n = 0, X a smooth conic in P², p ≠ 2, A a general point: X_u is two points, |S| = 2 (the tangents from A), δ_s = ±(e₁ − e₂) for both s, E = ℚ_ℓ(e₁ − e₂) and E^⊥ = ℚ_ℓ(e₁ + e₂).
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle_depends_on_path` (non-example) — For the concrete rational shear action ρ(g)(x,y)=(x+gy,y), δ=(0,1) and g=1, transport gives (1,1), which is neither δ nor −δ. The geometric local generator/path identification remains part of the source-specific construction.

**Acceptance.**

- E = 0 for the quadric-surface pencil and E = ℚ_ℓ(e₁ − e₂) for the conic pencil.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil`
- `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence`
- `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`
- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `SchemeAndStackFoundations:SF.2`
- `InverseGaloisAndArithmeticFundamentalGroups:IG.1`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.2), p. 290. E is the span of the vanishing cycles (the complex case).
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.8) a) 3), p. 292. E ⊂ H^n(X_u, ℚ_ℓ) in the ℓ-adic setting, stable under π₁(U, u).

**Suggested forms: partial.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Actual declarations or explicitly labelled specializations: `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle_changePath`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_stable`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle_depends_on_path`.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle_changePath`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_stable`, `TauCeti.AlgebraicGeometry.LefschetzPencil.localMonodromy_vanishingCycle`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_eq_bot_of_no_singular_fibre`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_quadric_surface`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_conic`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle_depends_on_path`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Vanishing subspace**.

### The common fixed space of the local transvections is E^⊥

Target `LefschetzPencilsAndVanishingCycles:LPV.4/fixed-space-of-the-local-transvections` · lemma · `TauCeti.AlgebraicGeometry.VanishingCycles.fixedSpaceOfTheLocalTransvections`.

Let V be a finite-dimensional vector space over a field K with a symmetric or alternating bilinear form ( , ), (δ_s)_{s∈S} a finite family in V, E = span(δ_s), and T_s(x) = x + c_s(x, δ_s)δ_s with c_s ∈ K^× (Mathlib's LinearMap.transvection; a transvection when (δ_s, δ_s) = 0 and a reflection when c_s(δ_s, δ_s) = −2). Then ⋂_s Fix(T_s) = E^⊥ = {x : (x, δ_s) = 0 for all s}.

**Hypotheses.**

- c_s ≠ 0 for every s. If δ_s = 0 then T_s = id and δ_s contributes nothing to E.

**Construction or proof.**

1. T_s x = x if and only if c_s(x, δ_s)δ_s = 0 (LinearEquiv.mem_fixedSubmodule_transvection_iff when (δ_s, δ_s) = 0; the same computation for a reflection).
2. For δ_s ≠ 0 and c_s ≠ 0 this says (x, δ_s) = 0; for δ_s = 0 it is automatic.
3. Intersecting over s gives {x : (x, δ_s) = 0 ∀ s} = E^⊥ (LinearMap.BilinForm.orthogonal of the span).

**Acceptance.**

- V a symplectic plane and one δ ≠ 0: Fix(T) = ℚ_ℓδ = δ^⊥; for δ = 0, T = id and Fix(T) = V = E^⊥.

**Direct prerequisites.**

- `mathlib:LinearEquiv.transvection`
- `mathlib:LinearEquiv.mem_fixedSubmodule_transvection_iff`
- `mathlib:LinearMap.BilinForm.orthogonal`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, Proposition (5.3), p. 290. E^⊥ is the monodromy invariants: clear from the local formula (5.2.1), since the γ_s generate.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.3), p. 290. The statement E^⊥ = invariants.

**Suggested forms: complete.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Actual declarations or explicitly labelled specializations: `TauCeti.AlgebraicGeometry.VanishingCycles.fixedSpaceOfTheLocalTransvections`.

### The radical quotient E/(E ∩ E^⊥) and its nondegenerate pairing

Target `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing` · construction · `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. With ( , ) = Tr(x ∪ y) the cup-product pairing H^n(X_u) ⊗ H^n(X_u) → ℚ_ℓ(−n), the subspace E ∩ E^⊥ is the kernel of the restriction of ( , ) to E, so ( , ) induces a nondegenerate form ψ : E/(E ∩ E^⊥) ⊗ E/(E ∩ E^⊥) → ℚ_ℓ(−n), alternating for n odd and symmetric for n even. Monodromy respects ψ; for n odd it gives ρ : π₁(U, u) → Sp(E/(E ∩ E^⊥), ψ).

**Hypotheses.**

- The pairing on H^n(X_u) is perfect by Poincaré duality, but its restriction to E can be degenerate: E ∩ E^⊥ may be nonzero, and irreducibility and open image concern the quotient, not E.

**Construction or proof.**

1. The kernel of ( , )|_E is {x ∈ E : (x, y) = 0 ∀ y ∈ E} = E ∩ E^⊥ by definition, so the induced form on the quotient is nondegenerate.
2. Tr(x ∪ y) = (−1)^{n²} Tr(y ∪ x) and x ∪ x = 0 for n odd (graded commutativity), so ψ is alternating for n odd and symmetric for n even.
3. π₁(U, u) acts on H^n(X_u) preserving the cup product and the trace (the trace is π₁-invariant because R^{2n} f_*ℚ_ℓ(n) ≅ ℚ_ℓ on U), and it preserves E, hence E^⊥ and the quotient.

**API.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient` (constructor) — E ⧸ (E ⊓ E^⊥), a finite-dimensional ℚ_ℓ-space with a π₁(U, u)-action.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm` (constructor) — ψ, the form induced by Tr(x ∪ y), with values in ℚ_ℓ(−n).
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_nondegenerate` (characterisation) — ψ is nondegenerate.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_isAlt` (characterisation) — ψ is alternating for n odd (LinearMap.BilinForm.IsAlt) and symmetric for n even.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.monodromyRep` (constructor) — ρ : π₁(U, u) →* Sp(vanishingQuotient, ψ) for n odd, continuous.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingProjection` (projection) — The actual quotient linear map E→E/(E∩E⊥).
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_mk` (compatibility) — The pairing on classes represented by x,y is B(x,y); in the geometric form retain Q_l(−n).
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_lift` (universal-property) — Any linear functional on E killing E∩E⊥ uniquely descends through the quotient.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_lift_comp` (relation) — Composition of the descended map with the quotient projection is the original map.

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.5/absolute-irreducibility-of-the-vanishing-quotient` — the representation whose absolute irreducibility is proved
- `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image` — the target Sp(E/(E ∩ E^⊥), ψ) of the open-image theorem
- `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system` — ℱ₀ = ℰ₀/(ℰ₀ ∩ ℰ₀^⊥) with its perfect alternating pairing
- `DeligneWeightsAndPurity:DWP.3/open-image-in-the-symplectic-similitude-group` — the symplectic target of the geometric monodromy

**Unit-test specifications.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_zero` (degenerate) — In the concrete rational four-dimensional symplectic model, E=0 has quotient dimension zero. Identifying this model with a quadric-surface pencil is a separate geometric test.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_radical` (value) — Over Q with basis e₀,e₁,e₂,e₃ and B(e₀,e₁)=B(e₂,e₃)=1, E=span(e₀,e₁,e₂) has radical Qe₂ and quotient dimension two; span(e₀,e₂) has quotient dimension zero.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_conic` (value) — For the rational dot-product form on Q² and E=Q(1,−1), the radical is zero, the quotient has dimension one and the generator has square two. The geometric degree-zero conic comparison retains the Tate/coefficient conventions.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_on_E_degenerate` (non-example) — The actual restriction of the standard symplectic form to span(e₀,e₁,e₂) is degenerate, whereas its descended quotient form is nondegenerate.

**Acceptance.**

- A nontrivial radical, a zero quotient and a nonzero quotient, as in the unit tests.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`
- `mathlib:LinearMap.BilinForm.orthogonal`
- `mathlib:LinearMap.BilinForm.IsAlt`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.9), p. 293. E ∩ E^⊥ is the kernel of the form restricted to E.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.9), p. 293. The induced nondegenerate form ψ with values in ℚ_ℓ(−n).
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.9), p. 293. Parity, and ρ : π₁(U, u) → Sp(E/(E ∩ E^⊥), ψ) for n odd.

**Suggested forms: partial.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Actual declarations or explicitly labelled specializations: `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_nondegenerate`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_isAlt`, `TauCeti.AlgebraicGeometry.LefschetzPencil.monodromyRep`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingProjection`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_mk`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_lift`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_lift_comp`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_zero`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_radical`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_conic`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_on_E_degenerate`.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_nondegenerate`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_isAlt`, `TauCeti.AlgebraicGeometry.LefschetzPencil.monodromyRep`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_mk`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_zero`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_radical`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_conic`, `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_on_E_degenerate`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Pencil restriction and Gysin formulas

Target `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-restriction-and-gysin` · theorem · `TauCeti.AlgebraicGeometry.LefschetzPencil.pencilRestrictionGysin`.

For the transverse-axis pencil with center Z=A∩X and incidence blowup π:X̃→X, the imported codimension-two blowup formula identifies H^i(X̃)=H^i(X)⊕H^(i−2)(Z)(−1) by π* plus exceptional Gysin. The inverse has the exceptional minus sign. For a smooth pencil fibre Y, restriction sends (a,b) to m*a+h*b, while fibre Gysin sends y to (m*y,−h*y), where m:Y→X and h:Z→Y. These formulas identify the lower-dimensional contributions used in DWP.4.

**Hypotheses.**

- Smooth projective X and transverse smooth codimension-two center; Q_l coefficients
- The empty-center curve case has no exceptional summand

**Construction or proof.**

1. Import the general blowup cohomology theorem from EDC.4, rather than proving it here.
2. Compute restriction and fibre Gysin using the exceptional divisor normal bundle.
3. Use EDC.3 self-intersection and projection formulas to check both minus signs.
4. Apply weak Lefschetz below the middle degree to identify the ambient and axis images.

**Acceptance.**

- For an empty center the formula reduces to ordinary restriction/Gysin on X.
- For a blown-up surface the exceptional class has square −1, detecting the inverse-sign convention.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.3/incidence-pencil-blowup`
- `EtaleDualityAndPerverseSheaves:EDC.4`
- `EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`
- `EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), XVIII §§2–4 and 5.1. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.LefschetzPencil.pencilRestrictionGysin`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Pencil restriction and Gysin**.

### Leray filtration and middle-degree reduction

Target `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-leray-and-middle-reduction` · theorem · `TauCeti.AlgebraicGeometry.LefschetzPencil.pencilMiddleReduction`.

Let f:X̃→D=P¹ be the proper incidence pencil, U=D−S its smooth locus, j:U→D, and n=2m+1 the fibre dimension in the odd tame branch of Weil I §7.1. Put V=(Rⁿf_*Q_l)|_U, E its actual vanishing local subsystem, R=E∩E⊥ and A=Rⁿf_*Q_l=j_*V. The Leray filtration on H^(n+1)(X̃) has graded terms E∞^(2,n−1), E∞^(1,n), E∞^(0,n+1), each the actual subquotient of its E₂ term. The only possible differentials on a curve are d₂^(0,b):H⁰(D,R^bf_*)→H²(D,R^(b−1)f_*); retain the incoming and outgoing ones on the two corner terms. E∞^(1,n)=H¹(D,A). If δ is nonradical, exact sequences 0→j_*E→A→C→0 and 0→j_*R→j_*E→j_*(E/R)→0 have C and j_*R constant. Hence H¹(j_*E)→H¹(A) is surjective, and H¹(j_*E)→H¹(j_*(E/R)) is injective. If δ is radical and E⊂E⊥, define F=coker(j_*E⊥→A). Then 0→constant j_*E⊥→A→F→0 and 0→F→constant j_*j*F→⊕_s i_(s*)L_s→0 yield H¹(A)↪H¹(F) and ⊕_s H⁰(L_s)↠H¹(F). L_s is the actual evaluation/vanishing line Q_l(m−n) with its orientation character, after finite-field descent making the critical points and characters rational. This corrects the opposite printed twist in (7.1.5), recorded as E24 for independent verification. If E=0, A is constant and H¹(A)=0; the upper-corner skyscraper contribution in degree n+1 remains.

**Hypotheses.**

- Actual proper Lefschetz pencil over P¹ and rational ℓ-adic coefficients; n=2m+1 for these §7.1 branches.
- Conjugacy of the local generators makes the nonradical, totally isotropic and zero cases uniform. E⊥ is the global fixed subsystem in this geometric situation, so its direct image is constant.
- Cohomology and all quotient/connecting/edge maps come from these sheaf sequences and the actual Rf* Leray sequence.
- For arithmetic twists pass to a finite residue-field extension rationalizing critical points and orientation characters. No hard Lefschetz, E₂ degeneration or split filtration is used.

**Construction or proof.**

1. Import the actual Rf* Leray spectral sequence and the cohomological dimension two of P¹. List all three total-degree n+1 E₂ terms and their surviving subquotients.
2. Use the nonmiddle constant direct images: the lower corner is H^(n−1)(X_u)(−1), controlled by weak Lefschetz on the axis; the upper constant quotient is controlled by the surjective Gysin map H^(n−1)(A∩X)(−1)→H^(n+1)(X_u). Preserve the additional degree-(n+1) skyscrapers when E=0.
3. For the nonradical case take the inclusion j_*E→A, quotient A→C and the radical projection j_*E→j_*(E/R). Their long exact sequences and H¹(P¹,constant)=0 give precisely the stated surjection and injection, identifying H¹(A) as a quotient of a subspace of H¹(j_*(E/R)).
4. For the totally isotropic case form F from j_*E⊥, not j_*E. The local defect map evaluates against δ via the cup product. The two long exact sequences give the injection into H¹(F) and the surjective boundary from the skyscraper sections.
5. Normalize the Tate line using δ∈Hⁿ(m) and cup product valued in Q_l(−n), hence Q_l(m−n); keep E24 distinct from the already verified local-sign corrections.
6. Transport these middle maps through the incidence blowup restriction/Gysin maps without suppressing a Leray differential or splitting an extension.

**Acceptance.**

- The δ=0 case retains the degree-(n+1) skyscraper contribution.
- The dimension induction imports estimates for both X’s axis and the pencil fibres, rather than discarding the blowup summand.
- Nonradical: H¹(j_*E) surjects onto H¹(A) and injects into H¹(j_*(E/R)); totally isotropic: A injects on H¹ into H¹(F), and the skyscraper boundary surjects onto H¹(F).
- For n=1,m=0 the cup-product evaluation line is Q_l(−1). E24 must be checked independently against the printed opposite twist.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`
- `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-restriction-and-gysin`
- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `SchemeAndStackFoundations:SF.2`
- `EtaleDualityAndPerverseSheaves:EDC.4`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §7.1, pp. 299–300, (7.1.2)–(7.1.5) and their cohomology sequences; §5.8, pp. 292–293. Both radical cases and arrow directions checked on the printed page; proposed local-line twist correction is E24.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.LefschetzPencil.pencilMiddleReduction`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Middle-degree reduction**.

### Local fixed space and global invariant interface

Target `LefschetzPencilsAndVanishingCycles:LPV.4/global-fixed-and-local-fixed-interface` · comparison · `TauCeti.AlgebraicGeometry.LefschetzPencil.localGlobalFixedComparison`.

The common fixed space of the nontrivial local transvections/reflections is E⊥ by the elementary linear-algebra lemma. It equals the full π₁(U,u)-invariant space only after the algebraic monodromy-generation theorem of LPV.5 is applied. E is the span of all transported local cycles, and E∩E⊥ is the radical of its restricted pairing. These identities do not require hard Lefschetz or nondegeneracy of E itself.

**Hypotheses.**

- Tame pencil branch; Q_l coefficients; all transported cycles included
- For local zero cycles the corresponding operator is identity

**Construction or proof.**

1. Apply the fixed-space lemma to each local operator.
2. Use π₁ stability of the full transported span to identify the common local fixed space.
3. Invoke LPV.5 generation only for the final global-invariant equality.
4. Pass to the radical quotient to obtain the nondegenerate pairing.

**Acceptance.**

- A three-dimensional subspace of a four-dimensional symplectic space can have a one-dimensional radical.
- The local-to-global equality is not used to prove its own monodromy-generation prerequisite.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.4/fixed-space-of-the-local-transvections`
- `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`
- `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`
- `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5.3 and 5.8–9, pp. 289–292. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.LefschetzPencil.localGlobalFixedComparison`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Hypersurface cohomology outside the middle degree

Target `LefschetzPencilsAndVanishingCycles:LPV.4/hypersurface-outside-middle` · application · `TauCeti.AlgebraicGeometry.LefschetzPencil.hypersurfaceOutsideMiddle`.

For a smooth projective hypersurface Y of dimension n over an algebraically closed field, rational ℓ-adic cohomology outside degree n agrees with the projective-space even Tate classes in degrees 0,2,…,2n and vanishes in the other odd degrees, with the dual generators above the middle degree. In a sufficiently ample pencil of hypersurface sections this identifies the constant direct-image pieces and isolates the middle vanishing quotient used by the odd-dimensional Weil-I induction.

**Hypotheses.**

- Smooth hypersurface; ℓ invertible; rational coefficients
- Weak Lefschetz below n and Poincaré duality above n; the middle cohomology is not asserted to be Tate

**Construction or proof.**

1. Import weak Lefschetz and projective-space cohomology.
2. Apply smooth proper duality to identify the degrees above the middle.
3. Insert the result into the direct-image and middle-reduction nodes.
4. Route the tensor-power/weight conclusion of Weil I 5.12 to DWP.4.

**Acceptance.**

- A smooth cubic surface has b₀=b₄=1 and b₁=b₃=0; its b₂ is a middle-degree contribution.
- An odd-dimensional smooth hypersurface has its only possible non-Tate/odd contribution in degree n.

**Direct prerequisites.**

- `EtaleDualityAndPerverseSheaves:EDC.4`
- `EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`
- `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-leray-and-middle-reduction`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Remark 5.12, p. 294. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.LefschetzPencil.hypersurfaceOutsideMiddle`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

**Stage remaining work.**

- Elaborate the exact geometric/derived API and test forms itemized under G-prototype-LPV-4 after their supplier interfaces are available.

## LPV.5

The geometric tame fundamental group supplies local generation and conjugacy; the nonzero radical quotient is absolutely irreducible. The linear Lie lemma plus the p-adic closed-subgroup/open-image interface proves odd open symplectic monodromy. Even orthogonal alternatives retain their nondegeneracy hypotheses. Finite monodromy rationality and ADE use independent compatible traces, finite-cover Chebotarev, arithmetic character theory and the existing lattice/root-system carriers, with no reverse DWP.4 input.

Coverage: **planned**. All original stage targets have nodes whose prerequisite chains terminate in checked baseline declarations, exact independent supplier nodes, requested owner stages or explicit source/prototype gaps. Planned at target level; not closed or independently accepted.

### Bertini: a general line sees the whole monodromy of P̌ − X̌

Target `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.bertiniSurjectivityOnFundamentalGroups`.

For a connected smooth projective variety and the incidence family over the complement of its nonempty irreducible dual divisor, a sufficiently general line satisfying the source’s transversality conditions has the same monodromy image as the base on the given finite-dimensional Q_l local system. The proof uses irreducibility of the pullback along a general line for each relevant finite cover, specialization and a finite congruence/Frattini control of the fixed representation. It does not claim that one universal open works simultaneously for every finite cover or every representation.

**Hypotheses.**

- The dual is a nonempty divisor; its smooth ordinary locus and the chosen generic line meet the source’s transversality conditions
- A fixed finite-dimensional continuous Q_l representation with compact image; tame branch for the specialization argument
- Linear/empty-dual cases are treated separately

**Construction or proof.**

1. Apply the geometric Bertini irreducibility theorem to the finite cover controlling the fixed compact image.
2. Use the finite congruence/Frattini quotient to reduce image surjectivity to this finite cover.
3. Apply SGA 1 tame specialization and Abhyankar as in XVIII 6.1 to return to the line complement.
4. Record exact image surjectivity and the base-point transports, rather than asserting a stronger all-cover simultaneous open.

**Acceptance.**

- Over ℂ, for X a smooth conic in P² the dual X̌ is a conic, π₁(P̌² − X̌) = ℤ/2, and a general line D meets X̌ in two points with π₁(D − S) = ℤ mapping onto ℤ/2.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`
- `LefschetzPencilsAndVanishingCycles:LPV.3/ordinary-axis-open-and-jet-separation`
- `SchemeAndStackFoundations:SF.2`
- `InverseGaloisAndArithmeticFundamentalGroups:IG.1`
- `SchemeAndStackFoundations:SF.0`
- `ArithmeticGaloisRepresentations:R01.2`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, proof of (5.4), p. 291. Over ℂ: π₁(D − S) → π₁(P̌ − X̌) is surjective for D general.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.8), p. 292. In the algebraic setting Lefschetz's π₁ theorem becomes Bertini's theorem.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.bertiniSurjectivityOnFundamentalGroups`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### The vanishing cycles are conjugate up to sign

Target `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.vanishingCyclesAreConjugate`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. The vanishing cycles ±δ_s (s ∈ S), taken up to sign, are conjugate under π₁(U, u): for s, s′ ∈ S there is g ∈ π₁(U, u) with gδ_s = ±δ_{s′}.

**Hypotheses.**

- The pencil is sufficiently general for the surjectivity onto π₁(P̌ − X̌).

**Construction or proof.**

1. Use the nonempty irreducible dual divisor and its smooth ordinary locus to identify its generic local inertia conjugacy class.
2. Apply the tame Bertini image-surjectivity theorem for the fixed cohomological representation.
3. Transport the primitive vanishing generator along the local inertia conjugacies, obtaining ±gδ.
4. Treat the empty singular set separately; the characteristic-two even branch uses its own transverse-pencil node.

**Acceptance.**

- The conic pencil (n = 0, p ≠ 2): both vanishing cycles are ±(e₁ − e₂).
- The quadric-surface pencil: both vanishing cycles are 0, consistent with the rule that one zero vanishing cycle forces all to vanish.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`
- `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`
- `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`
- `SchemeAndStackFoundations:SF.2`
- `InverseGaloisAndArithmeticFundamentalGroups:IG.1`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, Théorème (5.4), p. 290. The statement over ℂ.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, proof of (5.4), p. 291. Connectedness of the smooth locus of the irreducible X̌ makes the loops γ_x conjugate.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.8), p. 292. In the algebraic proof, Abhyankar's lemma controls the ramification of R^•g_*ℚ_ℓ along the smooth codimension-one locus of X̌.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.vanishingCyclesAreConjugate`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Conjugacy of vanishing cycles**.

### Monodromy is generated by the local transvections, and E^⊥ is the invariant subspace

Target `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyGeneratedByLocalTransvections`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. For a suitable choice of paths, the image of π₁(U, u) in GL(H^n(X_u, ℚ_ℓ)) is topologically generated by the local monodromies T_s (s ∈ S), with T_s x = x ± (x, δ_s)δ_s for a generator of the inertia at s. Consequently E = span(δ_s : s ∈ S), E^⊥ = H^n(X_u, ℚ_ℓ)^{π₁(U, u)}, and the image of π₁(U, u) in GL(E/(E ∩ E^⊥)) is topologically generated by the maps induced by the T_s.

**Hypotheses.**

- The sign ± is the one fixed by the Picard–Lefschetz formula; for n odd the generator of the inertia is one with t_ℓ(γ_s) a chosen generator of ℤ_ℓ(1).

**Construction or proof.**

1. Use SGA 1 XIII’s algebraic tame presentation of P¹ minus the finite critical set, and identify its local inertia images.
2. Apply the local Picard–Lefschetz formulas to those images; for an odd-dimensional pencil they are transvections.
3. Use continuity and compactness to take the closed subgroup generated by the local images, not merely the abstract subgroup.
4. Combine with the local fixed-space lemma to obtain E⊥=V^π₁. The characteristic-two even wild branch is not inferred from this tame presentation.

**Acceptance.**

- Conic pencil: the image is ℤ/2, generated by the swap of the two points, and the invariants are ℚ_ℓ(e₁ + e₂) = E^⊥.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`
- `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`
- `LefschetzPencilsAndVanishingCycles:LPV.4/fixed-space-of-the-local-transvections`
- `InverseGaloisAndArithmeticFundamentalGroups:IG.1`
- `SchemeAndStackFoundations:SF.2`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.8), p. 292. The tame fundamental group of U and the transfer of Lefschetz's arguments.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.8) a) 3), p. 292. The image of π₁ in GL(E/(E ∩ E^⊥)) is topologically generated by the x ↦ x ± (x, δ_s)δ_s, and E^⊥ is the invariant subspace (read on the page image).
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, Proposition (5.3), p. 290. Over ℂ: E is stable and E^⊥ is the invariants because the γ_s generate π₁.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyGeneratedByLocalTransvections`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Absolute irreducibility of the vanishing quotient

Target `LefschetzPencilsAndVanishingCycles:LPV.5/absolute-irreducibility-of-the-vanishing-quotient` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.absoluteIrreducibilityOfTheVanishingQuotient`.

For the tame Lefschetz pencil branch (odd fibre dimension, or residue characteristic different from 2), the nonzero representation V=E/(E∩E⊥) of π₁(U,u) is absolutely irreducible. If V=0 the representation is zero and is handled as a separate branch, not called irreducible.

**Hypotheses.**

- V≠0 for the irreducibility assertion
- Coefficient field Q_l, with scalar extension to any finite extension or algebraic closure; local operators and conjugacy persist
- The pencil is in the tame branch

**Construction or proof.**

1. For a stable nonzero subspace W after scalar extension, nondegeneracy supplies a vanishing cycle δ with (W,δ)≠0.
2. A local transvection or reflection then puts δ in W.
3. Conjugacy puts all transported cycles in W, so W=V.
4. If every pairing vanishes then W is in the radical, hence zero in V. Treat V=0 separately.

**Acceptance.**

- The quadric-surface pencil has E/(E ∩ E^⊥) = 0; the conic pencil has a one-dimensional quotient.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate`
- `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections`
- `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, Corollaire (5.5), p. 291. The action of π₁(U, u) on E/(E ∩ E^⊥) is absolutely irreducible.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, proof of (5.5), p. 291. The argument through a vector x with (x, δ_s) ≠ 0 and conjugacy.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.13) D), p. 294. SGA 7 XVIII proves irreducibility of E only when E ∩ E^⊥ = 0; the radical quotient is the general case.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.absoluteIrreducibilityOfTheVanishingQuotient`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Irreducibility of the vanishing quotient**.

### A simple symplectic Lie algebra generated by the x ↦ ψ(x, δ)δ is all of sp (Weil I 5.11)

Target `LefschetzPencilsAndVanishingCycles:LPV.5/symplectic-lie-algebra-generated-by-transvections` · lemma · `TauCeti.AlgebraicGeometry.VanishingCycles.symplecticLieAlgebraGeneratedByTransvections`.

Let V be a finite-dimensional vector space over a field k of characteristic 0, ψ a nondegenerate alternating form on V, and 𝔏 ⊂ sp(V, ψ) a Lie subalgebra. For δ ∈ V let N(δ) : x ↦ ψ(x, δ)δ. If (i) V is a simple 𝔏-module and (ii) 𝔏 is generated as a Lie algebra by a family of endomorphisms N(δ_i), then 𝔏 = sp(V, ψ).

**Hypotheses.**

- sp(V, ψ) is Mathlib's skewAdjointLieSubalgebra ψ.
- Characteristic 0 (char ≠ 2 would suffice for the final spanning step).

**Construction or proof.**

1. N(δ) is skew-adjoint: ψ(N(δ)x, y) = ψ(x, δ)ψ(δ, y) = −ψ(x, N(δ)y); and N(δ)² = 0 since ψ(δ, δ) = 0. Assume V ≠ 0. Then 𝔏 ≠ 0: otherwise simplicity gives dim V = 1, impossible for a nondegenerate alternating form.
2. Let W = {δ ∈ V : N(δ) ∈ 𝔏}. W is stable under scalars (N(λδ) = λ²N(δ)) and Zariski closed (the preimage of the subspace 𝔏 under the quadratic map N).
3. For δ ∈ W, exp(λN(δ)) = 1 + λN(δ) lies in Sp(V, ψ) and normalises 𝔏 (Ad exp = exp ad, with ad N(δ) nilpotent and preserving 𝔏); since gN(δ″)g^{-1} = N(gδ″) for g ∈ Sp, it maps W to W. So δ″ + λψ(δ″, δ′)δ′ ∈ W for δ′, δ″ ∈ W, and if ψ(δ′, δ″) ≠ 0 the span of δ′ and δ″ lies in W.
4. If L ⊂ W is a linear subspace and δ ∈ W with ψ(δ, L) ≠ 0 then L + kδ ⊂ W: the w ∈ L with ψ(w, δ) ≠ 0 form a dense open subset of L on which w + kδ ⊂ W by step 3, and W is closed. Hence W is the union of pairwise orthogonal maximal linear subspaces W_α (the spans of the classes of the relation ψ(δ, δ′) ≠ 0).
5. Each W_α is stable under every N(δ), δ ∈ W: N(δ)w = ψ(w, δ)δ is 0 for δ ∈ W_β, β ≠ α, and lies in W_α for δ ∈ W_α. By (ii) W_α is 𝔏-stable. Some generator δ_i is nonzero, and its W_α is nonzero, so W_α = V by (i): N(δ) ∈ 𝔏 for all δ ∈ V.
6. sp(V, ψ) is spanned by the N(δ): polarisation gives N(δ + δ′) − N(δ) − N(δ′) = x ↦ ψ(x, δ)δ′ + ψ(x, δ′)δ, and these span sp(V, ψ) ≅ Sym²V (char ≠ 2). So 𝔏 = sp(V, ψ).

**Acceptance.**

- dim V = 2 with ψ(e₁, e₂) = 1: N(e₁) = −E₁₂ and N(e₂) = E₂₁ generate sl₂ = sp(V, ψ), since their bracket is −H.
- Hypothesis (i) is needed: the Lie algebra spanned by N(e₁) alone is one-dimensional, and V is not a simple module for it.

**Direct prerequisites.**

- `mathlib:skewAdjointLieSubalgebra`
- `mathlib:LieModule.IsIrreducible`
- `mathlib:LinearMap.BilinForm.IsAlt`
- `mathlib:IsNilpotent.exp`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, Lemme (5.11), p. 293. Hypothesis (i); the statement and hypothesis (ii) read on the page image.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, proof of (5.11), p. 294. The final step: sp(V, ψ) is generated by the N(δ), δ ∈ V.

**Suggested forms: complete.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Actual declarations or explicitly labelled specializations: `TauCeti.AlgebraicGeometry.VanishingCycles.symplecticLieAlgebraGeneratedByTransvections`.

### Compact subgroups of Sp(V)(ℚ_ℓ) with full Lie algebra are open

Target `LefschetzPencilsAndVanishingCycles:LPV.5/lie-algebra-of-a-compact-l-adic-subgroup` · lemma · `TauCeti.AlgebraicGeometry.VanishingCycles.lieAlgebraOfACompactLAdicSubgroup`.

Let V be a finite-dimensional ℚ_ℓ-vector space with a nondegenerate alternating form ψ and H ⊂ Sp(V, ψ)(ℚ_ℓ) a compact subgroup. Let 𝔏 = {X ∈ gl(V) : exp(tX) ∈ H for all t in some neighbourhood of 0 in ℚ_ℓ}. Then 𝔏 is a ℚ_ℓ-Lie subalgebra of sp(V, ψ); if h ∈ H is unipotent, h = exp(N) with N nilpotent, then N ∈ 𝔏; and if 𝔏 = sp(V, ψ) then H is open in Sp(V, ψ)(ℚ_ℓ).

**Hypotheses.**

- H closed (compact) is essential: the group generated by the local monodromies is dense in the image of π₁, and only its closure is compact.
- ℓ prime; canonical module topology on V, End(V) and the subgroup topology induced by (g,g⁻¹).
- The Sp carrier and its ℓ-adic analytic structure use the classical-group extension; closed-subgroup analytic charts come from LieGroups, Part II.

**Construction or proof.**

1. Import Schneider’s exponential chart over Q_l (§18.10–19), a compact open saturated p-valued subgroup G₀ (Theorem 27.1), and the p-valuation inherited by the closed H∩G₀ (Exercise 26.2). The graded subgroup is a submodule of the finite free F_l[P]-module gr(G₀), so it has finite rank; compactness supplies completeness.
2. Use ordered-basis coordinate charts (Theorem 29.2, Corollaries 29.4–6) and the resulting analytic inclusion to identify Lie(H) as the tangent subalgebra in sp(V). The ambient group topology is the canonical module/subgroup topology, not an arbitrary supplied topology.
3. If exp(N) is in H, its integer powers exp(aN) remain in H; closedness extends a to Z_l. Differentiate this actual analytic one-parameter subgroup near zero, so N belongs to Lie(H).
4. Full Lie algebra gives equal dimensions and an invertible derivative for the analytic inclusion. The local inverse-function theorem gives an open neighbourhood in H, hence openness. No blanket real Cartan theorem or unproved equality log(H₀)=an arbitrary chosen lattice is substituted.

**Acceptance.**

- H = Sp(V)(ℤ_ℓ) is compact and open with 𝔏 = sp(V, ψ); H = {1} has 𝔏 = 0; the closure of the group generated by one unipotent exp(N), N ≠ 0, is exp(ℤ_ℓN) with 𝔏 = ℚ_ℓN.

**Direct prerequisites.**

- `mathlib:skewAdjointLieSubalgebra`
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, proof of (5.10), p. 293. The image of ρ is compact, hence an ℓ-adic analytic subgroup, and openness reduces to its Lie algebra being sp.
- [Peter Schneider, p-Adic Lie Groups](https://doi.org/10.1007/978-3-642-21147-8), §18.10–19, pp. 144–153; Exercise 26.2, pp. 181–182; Theorem 27.1, pp. 192–194; Theorem 29.2 and Corollaries 29.4–6, pp. 203–205. Primary p-adic charts and finite-rank closed-subgroup route freshly checked; general analytic infrastructure remains owned by LieGroups, Part II.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.lieAlgebraOfACompactLAdicSubgroup`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### The Kazhdan–Margulis theorem: the monodromy image is open in Sp

Target `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.kazhdanMargulisOpenImage`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. Let n be odd. The image of ρ : π₁(U, u) → Sp(E/(E ∩ E^⊥), ψ)(ℚ_ℓ) is open. The statement is for the fixed ℚ_ℓ-model; openness in Sp(V ⊗ E′)(E′) for a larger coefficient field E′ is not asserted.

**Hypotheses.**

- n odd, so ψ is alternating.
- V = E/(E ∩ E^⊥) = 0 is allowed: Sp(0) is trivial and the image is open.

**Construction or proof.**

1. H = ρ(π₁(U, u)) is compact (continuous image of a profinite group) in Sp(V, ψ)(ℚ_ℓ); let 𝔏 be its Lie algebra.
2. For s ∈ S, the inertia at s maps onto {exp(aN_s) : a ∈ ℤ_ℓ}, N_s = ±N(δ_s) (t_ℓ is onto ℤ_ℓ(1)), so N_s ∈ 𝔏. Let 𝔤_S ⊂ 𝔏 be the Lie subalgebra generated by the N_s.
3. V is a simple 𝔤_S-module: a 𝔤_S-stable subspace is stable under each N_s, hence under T_s = exp(±N_s), hence under the closed group they generate, which is H (monodromy generation), and by absolute irreducibility it is 0 or V.
4. By Lemma 5.11 with k = ℚ_ℓ, 𝔤_S = sp(V, ψ). So 𝔏 = sp(V, ψ), and H is open by the compact-subgroup lemma.
5. Weil I states that 𝔏 itself is generated by the N_s; step 3 avoids needing this, and it follows a posteriori from 𝔤_S ⊂ 𝔏 ⊂ sp.

**Acceptance.**

- V = 0 for the quadric-surface pencil, where the statement is trivial.
- A Lefschetz pencil of plane cubics (X = P² with r = 3): X̃ is P² blown up in 9 points, H^1(X̃) = 0 and f has a section, so the monodromy invariants vanish, E = H^1(X_u) is 2-dimensional with E ∩ E^⊥ = 0, and the image is open in Sp₂(ℚ_ℓ) = SL₂(ℚ_ℓ).

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`
- `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections`
- `LefschetzPencilsAndVanishingCycles:LPV.5/absolute-irreducibility-of-the-vanishing-quotient`
- `LefschetzPencilsAndVanishingCycles:LPV.5/symplectic-lie-algebra-generated-by-transvections`
- `LefschetzPencilsAndVanishingCycles:LPV.5/lie-algebra-of-a-compact-l-adic-subgroup`
- `ArithmeticGaloisRepresentations:R01.2`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, Théorème (5.10), p. 293. The theorem, attributed to Kazhdan and Margulis: the image of ρ is open.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, proof of (5.10), p. 293. Reduction to the Lie algebra being sp(E/(E ∩ E^⊥), ψ), then Lemma 5.11.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.kazhdanMargulisOpenImage`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Kazhdan–Margulis theorem**.

### Characteristic-two transverse-pencil monodromy

Target `LefschetzPencilsAndVanishingCycles:LPV.5/characteristic-two-transverse-monodromy` · theorem · `TauCeti.AlgebraicGeometry.LefschetzPencil.charTwoTransverseMonodromy`.

For the characteristic-two even-dimensional branch of Weil II 4.2, retain the actual quadratic inertia characters. For transverse pencils satisfying the specified generic-axis hypotheses, the local cycles at the ordinary critical fibres are conjugate up to sign and their stable span is independent of the chosen generic pencil after the prescribed transports. The existence of the generic-axis open is part of 4.2.7; a blanket tame-generation theorem is not asserted for every characteristic-two pencil.

**Hypotheses.**

- Characteristic two, even fibre dimension; the transverse/generic-axis hypotheses of Weil II 4.2.3–8
- Rational ℓ-adic coefficients ℓ≠2

**Construction or proof.**

1. Use the characteristic-two local formula with its actual quadratic character.
2. Apply the family-of-axes comparison and the good generic-axis open of 4.2.7.
3. Use the conjugacy argument of 4.2.6–8 to compare transported local cycles.
4. Keep this branch separate from the tame P¹ inertia-generator proof.

**Acceptance.**

- A wild quadratic local character is retained in the generic-pencil comparison.
- The tame genus-zero presentation is not cited to dispose of wild inertia.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/quadratic-character-in-characteristic-two`
- `LefschetzPencilsAndVanishingCycles:LPV.3/ordinary-axis-open-and-jet-separation`
- `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`
- `InverseGaloisAndArithmeticFundamentalGroups:IG.1`
- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `SchemeAndStackFoundations:SF.2`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 4.2.3–8, pp. 220–221. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.LefschetzPencil.charTwoTransverseMonodromy`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Orthogonal monodromy: open or finite

Target `LefschetzPencilsAndVanishingCycles:LPV.5/conditional-orthogonal-open-or-finite` · theorem · `TauCeti.AlgebraicGeometry.LefschetzPencil.orthogonalOpenOrFinite`.

For a pencil in the even-dimensional branch of Weil II 4.4, assume its vanishing space E has already been proved nondegenerate over the fixed Q_l field and the source’s conjugacy and generation hypotheses hold. Its compact geometric monodromy image in O(E) is open or finite. The nondegeneracy of E is an explicit input; in the source it is obtained from hard Lefschetz, so this branch is not used to prove the DWP hard Lefschetz theorem. The odd-dimensional open-Sp theorem instead uses the radical quotient V.

**Hypotheses.**

- Even fibre dimension; nondegenerate E; source 4.4.1 hypotheses
- Compact geometric image over the fixed Q_l coefficient field; zero space handled separately

**Construction or proof.**

1. Use the local reflections and conjugacy on E.
2. Apply the orthogonal-group/Lie alternatives in Weil II 4.4.1–4.
3. Use compact ℓ-adic Lie theory for the positive-dimensional open case.
4. Keep the hard-Lefschetz proof of the nondegeneracy input with DWP.5; do not create a dependency back from the odd core.

**Acceptance.**

- For the conic pencil the one-dimensional orthogonal image is finite of order two.
- An isotropic or degenerate E does not satisfy the theorem’s nondegeneracy hypothesis.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate`
- `LefschetzPencilsAndVanishingCycles:LPV.5/lie-algebra-of-a-compact-l-adic-subgroup`
- `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2`
- `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 4.4.1–4, pp. 227–229. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.LefschetzPencil.orthogonalOpenOrFinite`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Orthogonal monodromy alternative**.

### Finite orthogonal monodromy and ADE lattices

Target `LefschetzPencilsAndVanishingCycles:LPV.5/finite-orthogonal-ade` · theorem · `TauCeti.AlgebraicGeometry.LefschetzPencil.finiteOrthogonalADE`.

Let a nonzero even-dimensional geometric vanishing space E be nondegenerate and have finite orthogonal monodromy, with conjugate local reflections as in the preceding pencil theorem. Weil II 4.4.5–9 proves that the finite reflection representation has a rational integral vanishing lattice L: after changing the form by (−1)^(n/2), each vanishing root has square two and their pairings are integral. The form on L⊗R is positive definite, L is generated by these roots, and the root system is irreducible simply laced. Thus it has type A,D or E, and monodromy is its Weyl group. Rationality is proved by the explicit trace and cross-ℓ comparison below, not assumed from finite Q_l image or imported from the downstream weight induction.

**Hypotheses.**

- A genuine geometric even-dimensional pencil with E nonzero and nondegenerate; finite monodromy, conjugate vanishing cycles and local reflection formulas.
- Compatible ℓ-adic cohomology of the same family for all invertible primes; finite-cover Chebotarev, trace formula for all Frobenius powers and the finite-character descent interface.
- The source-specific nondegeneracy assumption remains conditional; hard Lefschetz is not imported into the earlier geometric open-Sp theorem.

**Construction or proof.**

1. For a finite-monodromy quotient, use the finite étale cover and compatible trace formula for all Frobenius powers to compare its characters at each ℓ. Lemma 4.4.6 uses finite-cover Chebotarev and a central positive-degree Vandermonde argument; Lemma 4.4.7 separates valuations, twists to continuous arithmetic representations and applies Chebotarev density. Removing trivial constituents recovers the same rational integral finite reflection character at every ℓ≠p; no weight induction is used.
2. Use the sign-adjusted pairing B with B(δ,δ)=2 and local reflection s_δ(x)=x−B(x,δ)δ. Compute a=Tr(s_δ s_(δ′))−dim E+2=B(δ,δ′)². The finite-group character makes a an integer, and a has a square root in Q_ℓ for every ℓ≠p. If a were not an integer square, Q(√a) would be a nontrivial quadratic number field. Existing abelian Chebotarev gives inert primes outside the finite exceptional set {p}∪{primes dividing 2a}, contradicting the local square roots. Thus a is an integer square and each pairing B(δ,δ′) is an integer.
3. Choose finitely many independent vanishing cycles and their Gram matrix to descend E to a rational span, and let L be their finite monodromy orbit’s integer span. Nondegeneracy identifies coordinates through the rational Gram matrix; integral pairings give an actual full lattice.
4. Average a positive definite real form over the finite group. Absolute irreducibility makes the invariant symmetric form unique up to scalar; norm two fixes its positive sign. The vanishing roots, closed under their reflections, are consequently a finite reduced simply-laced irreducible root system.
5. Import the existing IntegralLattices carrier and RootSystems ADE classification/Weyl-group identification. No orthogonal group, lattice, or classification is re-planned here.

**Acceptance.**

- The conic-pencil root δ=(1,−1) gives A₁ and its order-two Weyl group.
- The integral lattice is not replaced by an arbitrary Q_l lattice without the source’s rationality hypotheses.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.5/conditional-orthogonal-open-or-finite`
- `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-4-the-arithmetic-of-character-values`
- `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-5-dynkin-diagrams-and-the-cartan-killing-classification`
- `FunctionFieldArithmetic:FA.5`
- `tauceti:Completed/IntegralLattices#layer-1-lattices-with-forms`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-9-abelian-chebotarev`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 4.4.5–9, pp. 229–231, including Lemma 4.4.7. The entire rationality, integrality and positivity proof freshly read; source-specific finite character extraction belongs to this node, general trace/Chebotarev and character descent are imported.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.LefschetzPencil.finiteOrthogonalADE`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Integral failure and arithmetic consequence routing

Target `LefschetzPencilsAndVanishingCycles:LPV.5/integral-failure-and-arithmetic-routing` · application · `TauCeti.AlgebraicGeometry.LefschetzPencil.integralVanishingFailure`.

Weil II 4.3.10 identifies the integral intersection of vanishing cycles and fixed classes with the kernel of the polarization map; torsion can make it nonzero. Thus a rational nondegeneracy conclusion cannot be exported integrally without its extra hypotheses. The character/rationality consequences and divisor-degree gcd estimates of 4.5.1–2 are consumers of the monodromy theorem plus DWP and trace/character suppliers, not new proofs of weights in LPV.

**Hypotheses.**

- Integral Z_l cohomology for the failure example; rational coefficients for the monodromy consequence
- The 4.5 gcd application retains its source’s geometric and rationality hypotheses

**Construction or proof.**

1. Record the exact integral polarization-kernel obstruction in 4.3.10.
2. Check the rational radical-quotient construction remains valid without asserting integral splitting.
3. Route the character/gcd conclusions to DWP.4 and the upstream trace/character owners with their precise input contracts.

**Acceptance.**

- A polarization divisible by ℓ can leave an integral torsion kernel, so the rational statement is not copied with Z_l coefficients.
- The gcd theorem is not used as an input to the geometric local monodromy proof.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`
- `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image`
- `FunctionFieldArithmetic:FA.5`
- `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`
- `SchemeAndStackFoundations:SF.2`

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 4.3.10, p. 226, and 4.5.1–2 with proof, pp. 231–233. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.LefschetzPencil.integralVanishingFailure`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

**Stage remaining work.**

- Elaborate the exact geometric/derived API and test forms itemized under G-prototype-LPV-5 after their supplier interfaces are available.

## LPV.6

Use the actual early perverse categories, rectified trait dimension function and specified p/p+ integral convention. Nearby/vanishing exactness, duality and intermediate extension exchanges have their own compatibility hypotheses. Enlarged filtered colimits require uniform bounds and qualified costalk commutation. The Igusa application imports only independent formal-model and boundary-transition nodes, derives its finite-level bound from affine/integral geometry, and returns semiperversity to its consumer.

Coverage: **planned**. All original stage targets have nodes whose prerequisite chains terminate in checked baseline declarations, exact independent supplier nodes, requested owner stages or explicit source/prototype gaps. Planned at target level; not closed or independently accepted.

### Perverse exactness of nearby cycles

Target `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyPerverseExact`.

For a finite-type scheme over a henselian trait, rational ℓ-adic geometric nearby cycles take perverse sheaves on the geometric generic fibre to perverse sheaves on the geometric special fibre, and the induced functor on perverse hearts is exact. With the rectified perversity on the total trait space, this is the ψ[−1] convention: the generic-fibre restriction is shifted by −1 before applying the fibrewise functor. No weight or decomposition theorem is required.

**Hypotheses.**

- Early middle/rectified perverse structures imported from EDC.5; finite type; ℓ invertible
- Rational coefficients, or the finite-coefficient perversity specified by the supplier; p and p+ are not identified integrally

**Construction or proof.**

1. Import the support/cosupport definition and the trait dimension convention from EDC.5.
2. Use the group-cohomology two-term calculation and the strict-local nearby stalks to establish the required perverse bounds.
3. Combine the two bounds to obtain t-exactness and hence exactness on the hearts.
4. Check the generic-fibre dimension shift accounts for ψ[−1] on the total space.

**Acceptance.**

- For a smooth relative-d curve, Q_l[d] on each fibre is preserved with no extra fibrewise shift.
- For Q_l[d+1] on the smooth total trait space, ψ[−1] gives Q_l[d] on the special fibre.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude`
- `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`
- `EtaleDualityAndPerverseSheaves:EDC.5`

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), 4.5–4.6, pp. 47–49. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyPerverseExact`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Perverse nearby cycles**.

### Perverse exactness of shifted vanishing cycles

Target `LefschetzPencilsAndVanishingCycles:LPV.6/vanishing-perverse-exactness` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.vanishingPerverseExact`.

For a perverse complex K on the total trait space with rectified perversity, RΦK[−1] is perverse on the special fibre. Its can/var maps match the shifted nearby triangle. This is different from asserting that arbitrary i*K or i*K[−1] is perverse: the restriction has the two adjacent perverse degrees appearing in the gluing argument.

**Hypotheses.**

- Finite type; early EDC.5 rectified perversity; finite or rational coefficients with the supplier’s duality convention

**Construction or proof.**

1. Use the total-space gluing bounds for j*K[−1] and i*K[−1].
2. Apply fibrewise nearby t-exactness to the generic restriction.
3. Use the specialization triangle and its two perverse bounds to show the shifted cone is perverse.
4. Retain the total/fibre dimension shifts and normalized can/var twists.

**Acceptance.**

- At a nodal curve, RΦQ_l[2][−1] is the point skyscraper Q_l(−1) in perverse degree zero.
- For a smooth total family the shifted vanishing object is zero.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness`
- `LefschetzPencilsAndVanishingCycles:LPV.1/normalized-can-var`
- `EtaleDualityAndPerverseSheaves:EDC.5`

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), 4.6, pp. 48–49. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.vanishingPerverseExact`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Perverse vanishing cycles**.

### Nearby-cycle Verdier duality

Target `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-verdier-duality` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyVerdierDuality`.

Gabber’s comparison RΨ(D_ηK)≅D_s(RΨK) is natural and inertia-equivariant, with the dualizing complexes and Tate twists provided by the six-operation supplier. The induced shifted vanishing-cycle duality is compatible with can/var and the specialization pairing. Rational adic passage is compatible with the comparison; for integral coefficients the two dual perverse conventions are kept distinct.

**Hypotheses.**

- Finite type over a trait; constructible bounded complexes; torsion prime to residue characteristic or derived adic realization
- Dualizing objects and their normalizations supplied by EDC.1–2

**Construction or proof.**

1. Construct the tensor/trace comparison of Illusie 4.3 using the actual geometric functors.
2. Apply Gabber’s duality theorem and dévissage as in 4.2–4.3.
3. Check naturality with the geometric inertia automorphisms.
4. Pass compatibly to adic coefficients and identify the cone-duality shifts.

**Acceptance.**

- The rank-one nodal stalk/costalk pairing reproduces the twist −1.
- No unqualified self-dual p-perversity statement is made over Z_l with torsion.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`
- `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization`
- `EtaleDualityAndPerverseSheaves:EDC.1:biduality`
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`
- `EtaleDualityAndPerverseSheaves:EDC.5`

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), 4.2–4.4, pp. 44–47. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyVerdierDuality`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Nearby-cycle duality**.

### Qualified intermediate-extension exchange

Target `LefschetzPencilsAndVanishingCycles:LPV.6/intermediate-extension-exchange` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyIntermediateExtension`.

Let j_η and j_s be compatible open immersions in a trait family. Suppose nearby cycles are t-exact for the specified perverse structures and both exchange maps RΨ j_η!≅j_s! RΨ and RΨ Rj_η*≅Rj_s* RΨ are isomorphisms on the complexes in question, including the coherence of the !→* map. Then RΨ(j_η!*P)≅j_s!*(RΨP), by exact preservation of the image in the perverse heart. These exchange hypotheses must be verified for the chosen pair, for example a constant product family with a fixed smooth boundary; they are not a universal assertion for moving boundaries.

**Hypotheses.**

- The displayed ! and * exchange isomorphisms and their common map coherence
- Perverse t-exactness; constructible perverse P; specified coefficient convention

**Construction or proof.**

1. Use the supplier definition j!*P=im(pH⁰j!P→pH⁰Rj*P).
2. Apply exactness of RΨ on perverse hearts and the two exchange isomorphisms.
3. Check that their map corresponds to the same !→* morphism.
4. Verify the exchange hypotheses by smooth/product base change in the constant pair; leave other cases as explicit conditions.

**Acceptance.**

- A constant smooth pair U⊂Y times the trait satisfies the exchange and yields the constant intermediate extension.
- An arbitrary moving open boundary is not covered merely by writing j!*.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness`
- `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`
- `EtaleDualityAndPerverseSheaves:EDC.5`

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), 4.5–4.6 (exactness); image argument using the EDC.5 definition. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyIntermediateExtension`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Intermediate-extension exchange**.

### Perverse coefficients and comparison conventions

Target `LefschetzPencilsAndVanishingCycles:LPV.6/perverse-coefficients-and-comparison` · comparison · `TauCeti.AlgebraicGeometry.VanishingCycles.perverseCoefficientComparison`.

The finite-level nearby-cycle functor, its derived adic realization and its rational form are compared in the early perverse framework. Integral duality exchanges the supplier’s p and p+ conventions where torsion requires it. The scheme/adic and scheme/complex comparison maps are used only for their stated finite-type admissible domains and must preserve dimension shifts, specialization and inertia. No perverse diamond or arbitrary analytic comparison is manufactured inside LPV.

**Hypotheses.**

- Finite-type and coefficient hypotheses of the supplier comparisons
- Derived adic limits with uniform amplitude; p/p+ conventions explicit

**Construction or proof.**

1. Use the finite-level coefficient-change theorem and the EDC.6 integral/rational comparison.
2. Track support/cosupport bounds under the derived adic realization.
3. Check the comparison of ψ[−1] and φ[−1] using the same trait dimension function.
4. Import analytic/adic/diamond comparisons at their precise domain, retaining gap G-adic-comparison.

**Acceptance.**

- Rationalization removes the integral torsion distinction but does not change the fibrewise shift convention.
- The ordinary node compares to the complex Milnor fibre with the same specialization direction.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/coefficient-and-trait-change`
- `LefschetzPencilsAndVanishingCycles:LPV.0/scheme-adic-trait-comparison`
- `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness`
- `LefschetzPencilsAndVanishingCycles:LPV.6/vanishing-perverse-exactness`
- `EtaleDualityAndPerverseSheaves:EDC.6`

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), 4.4–4.6, pp. 47–49. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.perverseCoefficientComparison`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

### Filtered-colimit support and cosupport criterion

Target `LefschetzPencilsAndVanishingCycles:LPV.6/filtered-colimit-support-criterion` · theorem · `TauCeti.AlgebraicGeometry.VanishingCycles.filteredColimitSupportCriterion`.

In the enlarged derived étale category supplied by EDC.5/E1, let K=colim K_a be a filtered colimit of finite-level constructible complexes with a common perverse lower bound relative to a fixed dimension function. Assume geometric costalks commute with this colimit in the stated finite-cohomological-dimension setting; then K has the same lower bound, because cohomology commutes with filtered colimits of coefficient modules. The analogous upper-bound assertion uses stalks. The colimit need not be constructible, so the conclusion is a support/cosupport bound in the enlarged category, not membership in the constructible perverse heart.

**Hypotheses.**

- Filtered system; uniform finite-level bound; fixed dimension function
- The required stalk or costalk/filtered-colimit commutation proved by the supplier under finite cohomological dimension
- The enlarged category permits nonconstructible objects

**Construction or proof.**

1. Express the lower perverse bound by vanishing of costalk cohomology below the dimension threshold.
2. Use the supplier’s actual costalk-colimit comparison; do not assume Ri! commutes with every colimit.
3. Use exact filtered colimits of modules to retain the bound.
4. Apply the same argument with stalks for the upper bound, without a constructibility conclusion.

**Acceptance.**

- An increasing union of arbitrarily many point-supported perverse sheaves can retain the bound while failing constructibility.
- A system with bounds tending to −∞ is not covered by the uniform-bound assertion.

**Direct prerequisites.**

- `EtaleDualityAndPerverseSheaves:EDC.5`
- `EnhancedDerivedSheaves:E1`
- `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness`
- `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`

**Sources.**

- [Ana Caraiani and Peter Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://people.mpim-bonn.mpg.de/scholze/Noncompact.pdf), §4.6, pp. 60–63, finite-level lower bounds and cofinal models. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.filteredColimitSupportCriterion`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

Planet: **Filtered-colimit support criterion**.

### Igusa finite-level semiperversity interface

Target `LefschetzPencilsAndVanishingCycles:LPV.6/igusa-semiperversity-interface` · application · `TauCeti.AlgebraicGeometry.VanishingCycles.igusaSemiperversityInterface`.

For the cofinal finite-level formal models in Caraiani–Scholze §4.6, the scheme/adic nearby comparison and the preceding support criterion transport the finite-level lower perverse bound to the filtered-colimit object consumed by IgusaVarietiesAndTorsionConcentration:IG.4. The Igusa/Hodge–Tate tower geometry, affineness and vanishing of boundary terms under transition maps remain with IG.2–4. LPV exports only the nearby-cycle exactness, shift conventions, comparison and support criterion.

**Hypotheses.**

- Cofinal finite-level formal models and transition diagrams from IG.4/finite-level-formal-models, independent of the LPV.6 bound.
- Boundary-killing maps from IG.4/ell-power-boundary-killing; affine finite-level residue-scheme maps, integral-pushforward continuity and uniform cohomological dimension as in CS §4.6.
- Common dimension shift d and the enlarged EDC.5/E1 category; the semiperverse conclusion of IG.4 is not an input.

**Construction or proof.**

1. Import the two independent IG.4 geometry-prefix nodes. Distinguish the integral map on the raw mod-l formal model from its finite-type residue reduction; do not assert the raw model is finite type.
2. Use the EDC affine finite-level perverse bound and continuity for integral pushforward to obtain the uniform lower bound with the common shift d from the geometry, rather than assume the Igusa semiperversity theorem.
3. Identify the finite-level scheme nearby functor with the admissible adic one via the actual H1 completion comparison.
4. Apply LPV.6’s enlarged-category costalk/filtered-colimit criterion and the independent boundary-killing transition maps; return the bound to IG.4/semiperversity.

**Acceptance.**

- The target is IG.4 of the Igusa roadmap, not the distinct InverseGalois roadmap with the same local stage letters.
- No constructibility claim is added for the infinite-level colimit.

**Direct prerequisites.**

- `LefschetzPencilsAndVanishingCycles:LPV.6/filtered-colimit-support-criterion`
- `LefschetzPencilsAndVanishingCycles:LPV.0/scheme-adic-trait-comparison`
- `EtaleDualityAndPerverseSheaves:EDC.6`
- `IgusaVarietiesAndTorsionConcentration:IG.4/finite-level-formal-models`
- `IgusaVarietiesAndTorsionConcentration:IG.4/ell-power-boundary-killing`
- `EtaleDualityAndPerverseSheaves:EDC.5`

**Sources.**

- [Ana Caraiani and Peter Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://people.mpim-bonn.mpg.de/scholze/Noncompact.pdf), §4.6, Theorem 4.6.1 and its finite-level comparison proof. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

**Suggested forms: missing.** Names in missingForms are documented forms, not elaborated declarations. Successful specializations do not establish their geometric realization. Implementation remains unchecked.

Full forms omitted from elaboration: `TauCeti.AlgebraicGeometry.VanishingCycles.igusaSemiperversityInterface`. Their exact statements are the API/test/target specifications above; the packet and suggested-file missing-form ledger attach the hypotheses and supplier to each name.

**Stage remaining work.**

- Elaborate the exact geometric/derived API and test forms itemized under G-prototype-LPV-6 after their supplier interfaces are available.

## Supplier contracts and acyclic prefixes

Every external dependency below imports the owner’s stated mathematics. A request for an extension does not claim the existing layer already supplies it. Three node-level sequences must remain visible when the atlas installs stage links: nearby definition → H1 formal comparison → LPV scheme/adic comparison; Igusa formal-model/boundary geometry → LPV.6 interface → Igusa semiperversity; LPV geometric monodromy → DWP.4. Finite orthogonal rationality instead consumes FA.5 and the two existing arithmetic/classification interfaces specified below.

### ArithmeticGaloisRepresentations:R01.2

The henselian Galois specialization exact sequence and the valuation inertia comparison; tame/wild inertia and t_l:I→Z_l(1), its Kummer reductions, uniformizer independence, conjugation and ramification-index restriction. Supply the geometric local-monodromy theorem for constant Q_l cohomology of finite-type families (also compact supports), with its exact hypotheses, and the distinct representation-theoretic residue-field hypotheses. Finite inertia averaging and Frobenius-normalization contracts are used without duplicating the inertia carrier.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`, `LefschetzPencilsAndVanishingCycles:LPV.0/coefficient-and-trait-change`, `LefschetzPencilsAndVanishingCycles:LPV.1/normalized-can-var`, `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm`, `LefschetzPencilsAndVanishingCycles:LPV.1/geometric-quasi-unipotence`, `LefschetzPencilsAndVanishingCycles:LPV.1/finite-extension-and-logarithm-rescaling`, `LefschetzPencilsAndVanishingCycles:LPV.1/normal-crossings-tame-restriction`, `LefschetzPencilsAndVanishingCycles:LPV.1/semisimple-nearby-trace`, `LefschetzPencilsAndVanishingCycles:LPV.1/two-component-semistable-nearby-complex`, `LefschetzPencilsAndVanishingCycles:LPV.1/twisted-monodromy-equivariance`, `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`, `LefschetzPencilsAndVanishingCycles:LPV.2/variation-in-a-standard-quadratic-degeneration`, `LefschetzPencilsAndVanishingCycles:LPV.2/quadratic-character-in-characteristic-two`, `LefschetzPencilsAndVanishingCycles:LPV.2/fsy-discriminant-example`, `LefschetzPencilsAndVanishingCycles:LPV.3/finite-field-pencil-descent`, `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`, `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image`.

### FunctionFieldArithmetic:FA.5

Finite étale covers of smooth curves over finite fields, finite-quotient Chebotarev and comparison of traces of all Frobenius powers using the compatible cohomological trace formula. These inputs identify the finite reflection character in Weil II 4.4.5–7 and do not use the DWP.4 weight induction, which consumes LPV.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.5/finite-orthogonal-ade`, `LefschetzPencilsAndVanishingCycles:LPV.5/integral-failure-and-arithmetic-routing`.

### EnhancedDerivedSheaves:E0

A coherent filtered derived category of actual étale module sheaves, functorial cones, total complexes and filtered quasi-isomorphisms; enough coherence to compare the can/var triangle and the two-component Rapoport–Zink double complex without choosing nonfunctorial cones.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.1/two-component-semistable-nearby-complex`, `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`.

### EnhancedDerivedSheaves:E1

The enlarged derived étale category and filtered colimits with uniform finite cohomological amplitude; actual geometric stalk and qualified costalk colimit comparisons for the support criterion. This category must permit nonconstructible colimits.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.0/oriented-product-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.6/filtered-colimit-support-criterion`.

### EnhancedDerivedSheaves:E4

Derived adic completion/realization of compatible Z/ℓ^r complexes with uniform amplitude, derived inverse-limit control and rationalization; no underived inverse-limit substitute.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.0/coefficient-and-trait-change`, `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization`.

### EtaleDualityAndPerverseSheaves:EDC.1:biduality

The constructible Verdier dualizing objects, biduality and tensor/trace coherence on the geometric fibres, with finite and rational coefficient conventions; Gabber’s nearby duality is the LPV target built on them.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-verdier-duality`.

### EtaleDualityAndPerverseSheaves:EDC.3

EtaleDualityAndPerverseSheaves, Part II: absolute purity and coherent restriction/Gysin/trace diagrams for regular pairs over an excellent henselian trait, with invertible torsion coefficients. The existing EDC.3 smooth-pair statements over a field supply stratum maps but not this trait extension. Supply the regular semistable total-space comparison used by the early two-component nearby complex and its algebraic Picard–Lefschetz application, without perverse, weight or hard-Lefschetz inputs.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.1/two-component-semistable-nearby-complex`, `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3`.

### EtaleDualityAndPerverseSheaves:EDC.4

General codimension-two smooth blowup cohomology, with maps π* plus exceptional Gysin and the inverse exceptional minus sign; weak Lefschetz/connectedness and smooth complete-intersection cohomology in the required finite and rational coefficient ranges. LPV owns the pencil incidence identification and restriction/Gysin calculation, not this general theorem.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-smooth-quadrics`, `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.3/inseparable-gauss-and-low-dimension`, `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-restriction-and-gysin`, `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-leray-and-middle-reduction`, `LefschetzPencilsAndVanishingCycles:LPV.4/hypersurface-outside-middle`.

### EtaleDualityAndPerverseSheaves:EDC.5

EtaleDualityAndPerverseSheaves, Part II: Early perverse t-structures on finite-type schemes over fields and the rectified trait dimension function, the p/p+ integral conventions, support/cosupport criteria, gluing and intermediate extension as the image of !→*. Supply their enlarged nonconstructible extension and the precise finite-cohomological-dimension hypotheses under which geometric stalks/costalks commute with filtered colimits. No purity or decomposition theorem is required. These trait/integral/enlarged extensions are requested; the existing finite-field constructible scope does not already provide them.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness`, `LefschetzPencilsAndVanishingCycles:LPV.6/vanishing-perverse-exactness`, `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-verdier-duality`, `LefschetzPencilsAndVanishingCycles:LPV.6/intermediate-extension-exchange`, `LefschetzPencilsAndVanishingCycles:LPV.6/filtered-colimit-support-criterion`.

### EtaleDualityAndPerverseSheaves:EDC.6

Finite/derived-adic/rational realization with perverse shift and duality conventions; Huber’s admissible finite-type scheme/formal-completion/adic nearby comparison, including specialization and inertia equivariance. The analytic comparisons are imported on their stated domain, not extended to all analytic spaces.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization`, `LefschetzPencilsAndVanishingCycles:LPV.0/scheme-adic-trait-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.2/complex-picard-lefschetz-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.6/perverse-coefficients-and-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.6/igusa-semiperversity-interface`.

### FiniteFieldsAndCharacterSums:FF.0

Finite-field extension arithmetic and Frob_(q^r)=Frob_q^r. The scheme-theoretic finite residue field of a closed point of the good-axis open comes from SchemeAndStackFoundations:SF.0, not from this field-arithmetic stage.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.3/finite-field-pencil-descent`.

### InverseGaloisAndArithmeticFundamentalGroups:IG.1

Algebraic tame inertia conjugacy, Abhyankar and SGA 1 XIII specialization; the tame presentation of P¹ minus a finite set by local generators with product relation, and π₁(P¹)=1 over an algebraically closed field. Do not replace these by the topological complex presentation in positive characteristic.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.1/normal-crossings-tame-restriction`, `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`, `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`, `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate`, `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections`, `LefschetzPencilsAndVanishingCycles:LPV.5/characteristic-two-transverse-monodromy`.

### SchemeAndStackFoundations:SF.0

Import existing projective spaces, dual projective spaces, Grassmannians, projective tangent spaces and Veronese morphisms from the upstream ProjectiveSchemesAndSmoothMorphisms roadmap. Supply excellent local-ring and completion interfaces and Severi–Brauer ambient quadrics. General Artin Jacobian-square approximation and Elkik henselian/formal versality/algebraization, beyond the existing carrier, are SchemeAndStackFoundations, Part II; LPV plans only their quadratic applications. Also supply the finite-type closed-point residue-field theorem (Zariski lemma) for finite-field good-axis descent.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`, `LefschetzPencilsAndVanishingCycles:LPV.2/normal-form-of-ordinary-quadratic-forms`, `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric`, `LefschetzPencilsAndVanishingCycles:LPV.2/smooth-quadric`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`, `LefschetzPencilsAndVanishingCycles:LPV.2/tougeron-artin-implicit-function-theorem`, `LefschetzPencilsAndVanishingCycles:LPV.2/elkik-versal-henselian-deformations`, `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`, `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`, `LefschetzPencilsAndVanishingCycles:LPV.3/ordinary-axis-open-and-jet-separation`, `LefschetzPencilsAndVanishingCycles:LPV.3/incidence-pencil-blowup`, `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`, `LefschetzPencilsAndVanishingCycles:LPV.3/finite-field-pencil-descent`.

### SchemeAndStackFoundations:SF.4

SchemeAndStackFoundations, Part II, in the birational-geometry direction: The Rees-algebra blowup universal property and affine charts for a regular two-generated ideal, with the empty-center identity case. The incidence equation is specialized to a pencil inside LPV.3; general blowup geometry remains with its owner. SF.1 is the descent/stacks stage, not an existing Rees-algebra blowup theorem; this precise extension is requested from SF.4.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.3/incidence-pencil-blowup`.

### SchemeAndStackFoundations:SF.2

Integration contract, not a second plan: re-export the existing PR196 ConstructibleEtale layers 0–3 (small-étale morphisms, stalks, Galois descent, lisse representations and paths), 7–9 (derived complexes), EtaleBaseChange layers 2–8 (Rf*, Leray, coherent exchange maps, smooth/proper base change with their distinct hypotheses, proper-direct-image constructibility and finite-type cohomological-dimension bounds; the nonproper excellent-trait nearby-cycle finiteness theorem is still G-finiteness-source, local acyclicity and lissity), EllAdicRealization derived compatible systems and TraceFormula finite-dimensional trace/additivity. Read PR196 head 4bd72379658126cbe9be935656396f0c9dac4de0. ComplexComparison layers 8–12 must supply Riemann existence, relative comparison and cup/trace orientation compatibility for the algebraic ordinary degeneration. General carriers remain owned upstream; SF.2 is the atlas external entry’s integration_owner.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`, `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.0/geometric-fibre-site-morphisms`, `LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude`, `LefschetzPencilsAndVanishingCycles:LPV.1/semisimple-nearby-trace`, `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.2/homotopy-invariance-of-etale-cohomology`, `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-cone`, `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-punctured-cone`, `LefschetzPencilsAndVanishingCycles:LPV.2/complex-picard-lefschetz-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.3/finite-field-pencil-descent`, `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`, `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-leray-and-middle-reduction`, `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`, `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate`, `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections`, `LefschetzPencilsAndVanishingCycles:LPV.5/characteristic-two-transverse-monodromy`, `LefschetzPencilsAndVanishingCycles:LPV.5/integral-failure-and-arithmetic-routing`.

### tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-4-the-arithmetic-of-character-values

Rational/integral character values and descent for the finite reflection-group representation, as needed by Weil II 4.4.5–9; finite Q_l image by itself does not supply an integral rational root lattice.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.5/finite-orthogonal-ade`.

### tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation

Import the current TauCetiRoadmap OrthogonalSpinGroups Layers 0 and 2 general-field O(Q), bilinear dictionary, reflections and canonical Q_l module/subgroup topology; the atlas snapshot lacks that roadmap, so this stage is integration bookkeeping only. ClassicalGroups, Part II supplies the remaining Q_l symplectic group and analytic Lie-group interface, beyond its existing complex Layer 0. LPV owns only the source-specific geometric monodromy alternatives.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.5/conditional-orthogonal-open-or-finite`.

### tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine

Import the characteristic-zero SL₂ module classification, symmetric powers and Clebsch–Gordan rule from the existing upstream engine; the specific nilpotent Jordan-block SL₂ realization needed for Deligne 1.6.8 is an extension in that direction, LieHighestWeight, Part II, rather than a second general Jacobson–Morozov plan.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.1/primitive-decomposition-and-strictness`, `LefschetzPencilsAndVanishingCycles:LPV.1/tensor-dual-and-symmetric-monodromy`.

### tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-5-dynkin-diagrams-and-the-cartan-killing-classification

Classification of irreducible simply-laced integral positive-definite root systems as A,D,E and identification of the reflection group with the Weyl group, after LPV’s lattice hypotheses have been proved.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.5/finite-orthogonal-ade`.

### SchemeAndStackFoundations:key/excellent-schemes

Import the reserved excellent-schemes predicate and its excellent affine/local-ring interfaces (G-ring, J-2, universal catenarity) from SchemeAndStackFoundations. Reuse this carrier for finite-type nearby-cycle finiteness and the excellent regular-trait purity/approximation applications; no excellence definition is planned in LPV.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude`, `LefschetzPencilsAndVanishingCycles:LPV.1/geometric-quasi-unipotence`, `LefschetzPencilsAndVanishingCycles:LPV.1/two-component-semistable-nearby-complex`, `LefschetzPencilsAndVanishingCycles:LPV.2/tougeron-artin-implicit-function-theorem`.

### tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem

LieGroups, Part II over Q_l: exponential/local-inverse charts, compact closed matrix subgroup analytic inclusion via finite-rank p-valuations and ordered-basis charts, injective tangent map, and openness from an invertible differential. Schneider §§18,26–29 supplies this direction; the existing real/complex Cartan theorem is not its scalar extension.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.5/lie-algebra-of-a-compact-l-adic-subgroup`, `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image`.

### tauceti:TauCetiRoadmap/Chebotarev#layer-9-abelian-chebotarev

Import hasDirichletDensity_abelianFrobenius for Q(√a)/Q and positivity of density outside finite exceptional prime sets. This proves the elementary consequence used at Weil II p. 231: an integer square in every Q_l with l≠p is an integer square. The current Layer 9 contract and Suggested.lean were read; do not assume integrality at the excluded prime from ℓ-adic cohomology.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.5/finite-orthogonal-ade`.

### tauceti:Completed/IntegralLattices#layer-1-lattices-with-forms

Use the existing current IntegralLattices actual finite free Z-module with integral bilinear pairing and its rational extension, plus the positive-definite root-lattice interface. LPV constructs only the geometric cycle lattice inside that carrier.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.5/finite-orthogonal-ade`.

### ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13

Import Huber 3.5.13 with the actual completion-site maps and torsion bounded-below coefficient domain, as already specified by the H1 node.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.0/scheme-adic-trait-comparison`.

### ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycles-comparison

Import the actual RΨ≅Rλ_*c* comparison for the strict rank-one trait and geometric formal completion; naturality under inertia automorphisms is required. Its LPV dependency is only the nearby-cycle definition, preceding this comparison consumer.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.0/scheme-adic-trait-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.6/perverse-coefficients-and-comparison`.

### IgusaVarietiesAndTorsionConcentration:IG.4/finite-level-formal-models

Import only this checked independent IG.4 geometry-prefix contract. It does not depend on IG.4/semiperversity or compact-perversity, which consume LPV.6. CS §4.6 supplies the affine/integral finite-level maps and boundary transitions; no perverse conclusion is imported.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.6/igusa-semiperversity-interface`.

### IgusaVarietiesAndTorsionConcentration:IG.4/ell-power-boundary-killing

Import only this checked independent IG.4 geometry-prefix contract. It does not depend on IG.4/semiperversity or compact-perversity, which consume LPV.6. CS §4.6 supplies the affine/integral finite-level maps and boundary transitions; no perverse conclusion is imported.

Consumers: `LefschetzPencilsAndVanishingCycles:LPV.6/igusa-semiperversity-interface`.

## Exact open gaps

### G-algebraic-PL — Original algebraic Picard–Lefschetz proof interior

Illusie, Sur la formule de Picard–Lefschetz, Adv. Stud. Pure Math. 36 (2002), 249–268, DOI 10.2969/aspm/03610249: publisher PDF was blocked. The author’s 2021 §6.1 and §6.3 and ErrPL.pdf were read and give the algebraic two-component route and corrected concentration range. The original blowup/base-change calculation determining the odd sign still needs its primary proof read and checked. It is not replaced by SGA 7’s transcendental proof or by LPV.7.

Targets: `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3`.

### G-nonordinary — Original nonordinary concentration hypotheses

FSY §5.1.3 was read and verifies the characteristic-two application and middle concentration it cites. Illusie, Perversité et variation, Manuscripta Math. (2003), Corollary 2.10, DOI 10.1007/s00229-003-0407-z, was not obtained; its exact general class of isolated quadratic singularities and proof need checking before widening the FSY application.

Targets: `LefschetzPencilsAndVanishingCycles:LPV.2/isolated-nonordinary-quadratic-concentration`.

### G-approximation — General henselian approximation and versality sources

The SGA 7 XV cited application and quadratic models were read. Artin’s original Lemma 5.10 and Elkik’s original versality proof were not read. Their general results are requested as SchemeAndStackFoundations, Part II; the LPV nodes contain only their quadratic applications.

Targets: `LefschetzPencilsAndVanishingCycles:LPV.2/tougeron-artin-implicit-function-theorem`, `LefschetzPencilsAndVanishingCycles:LPV.2/elkik-versal-henselian-deformations`.

### G-finiteness-source — Excellent-trait finiteness proof

Illusie’s classical-trait finiteness statement and PR196 EtaleBaseChange’s precise finite-type constructibility contract were read. The original SGA 4½ finiteness proof is not freshly read here; it belongs to that upstream supplier. The LPV hypotheses retain excellence and finite-type/finite-Tor restrictions.

Targets: `LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude`.

### G-prototype-LPV-0 — LPV.0 exact unavailable supplier forms

The prototype.missingForms ledger on each named node gives every omitted definition/theorem/API/test name, exact statement, hypotheses, prerequisites and supplier. ArithmeticGaloisRepresentations:R01.2; SchemeAndStackFoundations:SF.2 (ConstructibleEtale/EtaleBaseChange); EnhancedDerivedSheaves:E0/E1/E4; ClassicalAdicEtaleCohomology:H1. No omitted form is a successful Lean prototype; filling these forms requires the actual suppliers, not arbitrary functors, maps, representations or t-structures.

Targets: `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`, `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`, `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities`, `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.0/geometric-fibre-site-morphisms`, `LefschetzPencilsAndVanishingCycles:LPV.0/oriented-product-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude`, `LefschetzPencilsAndVanishingCycles:LPV.0/coefficient-and-trait-change`, `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization`, `LefschetzPencilsAndVanishingCycles:LPV.0/scheme-adic-trait-comparison`.

### G-prototype-LPV-1 — LPV.1 exact unavailable supplier forms

The prototype.missingForms ledger on each named node gives every omitted definition/theorem/API/test name, exact statement, hypotheses, prerequisites and supplier. ArithmeticGaloisRepresentations:R01.2; EnhancedDerivedSheaves:E0/E4; EDC.3 trait-purity Part II; LieHighestWeight Part II for the SL₂ realization. No omitted form is a successful Lean prototype; filling these forms requires the actual suppliers, not arbitrary functors, maps, representations or t-structures.

Targets: `LefschetzPencilsAndVanishingCycles:LPV.1/normalized-can-var`, `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm`, `LefschetzPencilsAndVanishingCycles:LPV.1/geometric-quasi-unipotence`, `LefschetzPencilsAndVanishingCycles:LPV.1/finite-extension-and-logarithm-rescaling`, `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration`, `LefschetzPencilsAndVanishingCycles:LPV.1/primitive-decomposition-and-strictness`, `LefschetzPencilsAndVanishingCycles:LPV.1/tensor-dual-and-symmetric-monodromy`, `LefschetzPencilsAndVanishingCycles:LPV.1/relative-monodromy-uniqueness`, `LefschetzPencilsAndVanishingCycles:LPV.1/normal-crossings-tame-restriction`, `LefschetzPencilsAndVanishingCycles:LPV.1/semisimple-nearby-trace`, `LefschetzPencilsAndVanishingCycles:LPV.1/two-component-semistable-nearby-complex`, `LefschetzPencilsAndVanishingCycles:LPV.1/twisted-monodromy-equivariance`.

### G-prototype-LPV-2 — LPV.2 exact unavailable supplier forms

The prototype.missingForms ledger on each named node gives every omitted definition/theorem/API/test name, exact statement, hypotheses, prerequisites and supplier. SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line. No omitted form is a successful Lean prototype; filling these forms requires the actual suppliers, not arbitrary functors, maps, representations or t-structures.

Targets: `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2`, `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2`, `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3`, `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`, `LefschetzPencilsAndVanishingCycles:LPV.2/direct-images-at-a-lefschetz-degeneration`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`, `LefschetzPencilsAndVanishingCycles:LPV.2/normal-form-of-ordinary-quadratic-forms`, `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric`, `LefschetzPencilsAndVanishingCycles:LPV.2/smooth-quadric`, `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-smooth-quadrics`, `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`, `LefschetzPencilsAndVanishingCycles:LPV.2/tjurina-module-of-an-ordinary-quadratic-point`, `LefschetzPencilsAndVanishingCycles:LPV.2/tougeron-artin-implicit-function-theorem`, `LefschetzPencilsAndVanishingCycles:LPV.2/elkik-versal-henselian-deformations`, `LefschetzPencilsAndVanishingCycles:LPV.2/canonical-form-of-an-ordinary-quadratic-point`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point`, `LefschetzPencilsAndVanishingCycles:LPV.2/non-smooth-points-near-an-ordinary-quadratic-point`, `LefschetzPencilsAndVanishingCycles:LPV.2/homotopy-invariance-of-etale-cohomology`, `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-cone`, `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-punctured-cone`, `LefschetzPencilsAndVanishingCycles:LPV.2/boundary-anticommutativity-for-a-cone`, `LefschetzPencilsAndVanishingCycles:LPV.2/standard-quadratic-degeneration`, `LefschetzPencilsAndVanishingCycles:LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration`, `LefschetzPencilsAndVanishingCycles:LPV.2/variation-in-a-standard-quadratic-degeneration`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-description-of-the-vanishing-cycle`, `LefschetzPencilsAndVanishingCycles:LPV.2/complex-picard-lefschetz-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.2/quadratic-character-in-characteristic-two`, `LefschetzPencilsAndVanishingCycles:LPV.2/isolated-nonordinary-quadratic-concentration`, `LefschetzPencilsAndVanishingCycles:LPV.2/fsy-discriminant-example`.

### G-prototype-LPV-3 — LPV.3 exact unavailable supplier forms

The prototype.missingForms ledger on each named node gives every omitted definition/theorem/API/test name, exact statement, hypotheses, prerequisites and supplier. SchemeAndStackFoundations:SF.0 projective/jet/completed-local geometry and SF.4 Rees blowup; actual LPV.2 ordinary germs. No omitted form is a successful Lean prototype; filling these forms requires the actual suppliers, not arbitrary functors, maps, representations or t-structures.

Targets: `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`, `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`, `LefschetzPencilsAndVanishingCycles:LPV.3/ordinary-axis-open-and-jet-separation`, `LefschetzPencilsAndVanishingCycles:LPV.3/incidence-pencil-blowup`, `LefschetzPencilsAndVanishingCycles:LPV.3/finite-field-pencil-descent`, `LefschetzPencilsAndVanishingCycles:LPV.3/inseparable-gauss-and-low-dimension`.

### G-prototype-LPV-4 — LPV.4 exact unavailable supplier forms

The prototype.missingForms ledger on each named node gives every omitted definition/theorem/API/test name, exact statement, hypotheses, prerequisites and supplier. SchemeAndStackFoundations:SF.2 actual cohomology/Leray maps; EDC.4 weak Lefschetz and blowup maps; actual LPV.2/LPV.3 geometric data. No omitted form is a successful Lean prototype; filling these forms requires the actual suppliers, not arbitrary functors, maps, representations or t-structures.

Targets: `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`, `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-restriction-and-gysin`, `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-leray-and-middle-reduction`, `LefschetzPencilsAndVanishingCycles:LPV.4/global-fixed-and-local-fixed-interface`, `LefschetzPencilsAndVanishingCycles:LPV.4/hypersurface-outside-middle`.

### G-prototype-LPV-5 — LPV.5 exact unavailable supplier forms

The prototype.missingForms ledger on each named node gives every omitted definition/theorem/API/test name, exact statement, hypotheses, prerequisites and supplier. Actual LPV pencil cohomology representation; current OrthogonalSpinGroups Layers 0/2, ClassicalGroups Part II and LieGroups Part II; FA.5, CharacterTheory and IntegralLattices for rationality. No omitted form is a successful Lean prototype; filling these forms requires the actual suppliers, not arbitrary functors, maps, representations or t-structures.

Targets: `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`, `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate`, `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections`, `LefschetzPencilsAndVanishingCycles:LPV.5/absolute-irreducibility-of-the-vanishing-quotient`, `LefschetzPencilsAndVanishingCycles:LPV.5/lie-algebra-of-a-compact-l-adic-subgroup`, `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image`, `LefschetzPencilsAndVanishingCycles:LPV.5/characteristic-two-transverse-monodromy`, `LefschetzPencilsAndVanishingCycles:LPV.5/conditional-orthogonal-open-or-finite`, `LefschetzPencilsAndVanishingCycles:LPV.5/finite-orthogonal-ade`, `LefschetzPencilsAndVanishingCycles:LPV.5/integral-failure-and-arithmetic-routing`.

### G-prototype-LPV-6 — LPV.6 exact unavailable supplier forms

The prototype.missingForms ledger on each named node gives every omitted definition/theorem/API/test name, exact statement, hypotheses, prerequisites and supplier. EDC.5 rectified-trait/integral/enlarged perverse structures and qualified costalk colimits; E1/E4; H1 exact comparison; independent IG.4 geometry prefix. No omitted form is a successful Lean prototype; filling these forms requires the actual suppliers, not arbitrary functors, maps, representations or t-structures.

Targets: `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness`, `LefschetzPencilsAndVanishingCycles:LPV.6/vanishing-perverse-exactness`, `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-verdier-duality`, `LefschetzPencilsAndVanishingCycles:LPV.6/intermediate-extension-exchange`, `LefschetzPencilsAndVanishingCycles:LPV.6/perverse-coefficients-and-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.6/filtered-colimit-support-criterion`, `LefschetzPencilsAndVanishingCycles:LPV.6/igusa-semiperversity-interface`.

## Source corrections and reading provenance

Results are stated in our own words. There are no source excerpts or source-by-source narrative summaries. The packet records the 23 inherited confirmed findings, with their review verdicts unchanged, and one new proposed Tate-twist correction E24. The first 23 corrections remain in force; E24 awaits independent verification.

### E1 — misprint

Exposé XII, 1.1 b), p. 2.

Defect: The cardinality parameter is used where the residue characteristic is needed.

Correction: Use the residue characteristic p in this hypothesis.

Check: Case a) is 'n pair ou car(A) ≠ 2', so b) is its complement, characteristic 2; with card(A) = 2 the dichotomy would cover only the field with two elements.

Known correction: new. Reach: nothing.

### E2 — misprint

Exposé XII, Proposition 1.2, p. 3.

Defect: The summation includes an extra index at the upper endpoint.

Correction: End the sum at m−1.

Check: With the basis e₁, …, e_n and i from 1 to m − 1, the variables x_m and x_{2m} do not occur and the displayed form is degenerate, contradicting ordinarity; the inductive proof splits off m hyperbolic planes.

Known correction: new. Reach: a stated result.

### E3 — misprint

Exposé XII, 3.1, p. 14.

Defect: The direct-image degree is printed as one rather than two.

Correction: Use R² for the relevant direct image.

Check: η is the image of c₁(O(1)) ∈ H²(X, ℤ_ℓ(1)), as the next sentence of 3.1 says ('l'image dans H⁰(S, R²p_*ℤ_ℓ(1))').

Known correction: new. Reach: nothing.

### E4 — misprint

Exposé XII, proof of 3.3, formula (a), p. 15.

Defect: The projective ambient exponent is too small in the even-dimensional case.

Correction: Use the ambient projective space P^(2m+1).

Check: The quadric has dimension n = 2m and the equation uses the variables x₀, …, x_{2m+1}.

Known correction: new. Reach: nothing.

### E5 — misprint

Exposé XII, 3.6, p. 18.

Defect: The wrong rank/dimension symbol occurs in the formula.

Correction: Use the fibre dimension n at this occurrence.

Check: The paragraph treats n even and then n odd; r denotes the restriction maps r_i.

Known correction: new. Reach: nothing.

### E6 — misprint

Exposé XII, 3.6, p. 18.

Defect: The internal reference points to 3.5.3.

Correction: Change the internal reference to 3.6.3.

Check: Exposé XII has no 3.5.3; the dual Gysin sequence (3.6.3) is the one that computes R^i f_*ℤ_ℓ.

Known correction: new. Reach: nothing.

### E7 — misprint

Exposé XV, Corollaire 1.3.2 (ii), display (4.14.2), p. 11.

Defect: The quadratic coordinate has lost its exponent two.

Correction: Use the quadratic term x₀².

Check: Without the square the equation is smooth at every point; the versal deformation of 1.3.1 (ii) and Remarque 1.3.3 both have x₀².

Known correction: new. Reach: a stated result.

### E8 — misprint

Exposé XV, 1.2.1 and proof of 1.2.6, pp. 4 and 6.

Defect: An extra equality sign interrupts the local quadratic expansion, and the accompanying cone reference uses an obsolete paragraph number.

Correction: Use f=Q plus terms of order above two, with no second equality sign; refer to the cone of 1.2.3.

Check: The stray '=' breaks the formula, and the references numbered 4.x (also the label (4.14.2) in 1.3.2) point to a numbering of the exposé that no longer exists; 1.2.3 is the cone Q = 0 used in the proof.

Known correction: new. Reach: nothing.

### E9 — misprint

Exposé XV, 2.1.3 and Lemme 2.7.8, pp. 14–17.

Defect: A paragraph number is duplicated and the subsequent reference points to the wrong paragraph.

Correction: Disambiguate the duplicated 2.1.3 label and change 2.7.8 to 2.1.8.

Check: The proof of 2.2.7 says 'Appliquons 2.1.8', and the lemma sits between 2.1.7 and 2.2.

Known correction: new. Reach: nothing.

### E10 — misprint

Exposé XV, (2.2.5.9), p. 21.

Defect: The displayed map is labelled as a difference operator instead of the variation map.

Correction: Use Var(σ) for the variation morphism.

Check: The next display (2.2.5.10) rewrites it as a formula for Var(σ), and D is not defined in XV.

Known correction: new. Reach: nothing.

### E11 — error

Exposé XV, 2.2.6, p. 22.

Defect: The coefficient normalization treats all square roots of one as a common sign.

Correction: A norm formula modulo a composite coefficient modulus does not determine one global sign. For instance u=4 modulo 15 and u=19 modulo 60 square to one without being ±1. Fix one integral generator/orientation and reduce it compatibly at every modulus; retain the proved weaker bound when no synchronized generator is given.

Check: (uδ, uδ) = u²(δ, δ), and ℤ/k has square roots of 1 other than ±1 when k has two distinct odd prime factors: for k = 15, u = 4 gives u² = 16 ≡ 1, so 4δ ≠ ±δ also satisfies (2.2.6.1).

Known correction: new. Reach: nothing.

### E12 — misprint

Exposé XV, 2.2.2, p. 18.

Defect: The characteristic-two parity clause selects the wrong variable-rank parity.

Correction: Use odd variable rank n+1 for the degenerate characteristic-two ordinary branch.

Check: The degenerate case is characteristic 2 with n even (XV 1.2.2 and 1.2.8: an odd number n + 1 of variables), and 2.2.6 says 'Supposons n impair; x₀ est alors un point rationnel (2.2.2)'.

Known correction: new. Reach: nothing.

### E13 — misprint

p. 22 lines −4 and −2, p. 24 lines 6–7, p. 38 line −11.

Defect: The displayed diagram labels the vertical morphism with the wrong symbol.

Correction: Use the vertical tame parameter t_vert and inertia element σ_vert consistently, including p. 22 line −2.

Check: The author’s ErrTML sheet identifies the vertical parameter used in the double-complex construction.

Known correction: Author ErrTML.pdf. Reach: the proof.

### E14 — misprint

p. 35 line 7.

Defect: The direct-image superscript uses a successor instead of twice the index.

Correction: Use R^(2q) at this occurrence.

Check: Purity in codimension q has cohomological degree 2q.

Known correction: Author ErrTML.pdf. Reach: the proof.

### E15 — misprint

p. 37 line −5.

Defect: The normalization uses the opposite sign for the difference of the inertia operator and the identity.

Correction: Use the fixed 1−T convention at this occurrence; transfer formulas only after checking its relation to the packet’s T−1 convention.

Check: The author corrects the sign used to compare the boundary maps in the filtered nearby complex.

Known correction: Author ErrTML.pdf. Reach: the proof.

### E16 — misprint

p. 38 line −5, (3.6.8).

Defect: The complex is labelled with the wrong letter.

Correction: Use K for the coefficient complex.

Check: The simple Rapoport–Zink complex resolves nearby K, not its inertia-cohomology cone L.

Known correction: Author ErrTML.pdf. Reach: the proof.

### E17 — misprint

p. 39 line 7, second row.

Defect: The strata/twist expression skips the untwisted degree-d term.

Correction: Keep the degree-d untwisted term a_dΛ and the degree-(d+1) term a_(d+1)Λ(−1) distinct.

Check: The author’s erratum reverses the printed component order, needed for the graded monodromy map.

Known correction: Author ErrTML.pdf. Reach: the proof.

### E18 — misprint

p. 41 line −3.

Defect: The monodromy and weight filtrations are related by an erroneous extra shift.

Correction: Use M=W in the cited normalization, with no extra −n shift.

Check: The author’s erratum fixes the monodromy-filtration indexing.

Known correction: Author ErrTML.pdf. Reach: the proof.

### E19 — misprint

p. 41 line −2.

Defect: The weight index lacks the relative-dimension shift.

Correction: Use the weight i+n in the stated relative-dimension convention.

Check: The pure weight includes the dimension shift; this weight result is routed to DWP, not proved here.

Known correction: Author ErrTML.pdf. Reach: the proof.

### E20 — misprint

p. 43 line −1 and p. 44 lines 1–2.

Defect: The source proposes a parenthetical correction to the cited text which the author subsequently withdraws.

Correction: Delete the parenthetical proposed correction to the cited text, as directed by the author’s errata.

Check: The author’s erratum explicitly retracts that proposed correction; LPV does not perpetuate it.

Known correction: Author ErrTML.pdf. Reach: the proof.

### E21 — misprint

p. 44 line −12.

Defect: A diagram uses the generic map symbol instead of the specified morphism.

Correction: Use α for the designated morphism.

Check: The duality-comparison map is the α of the preceding construction.

Known correction: Author ErrTML.pdf. Reach: the proof.

### E22 — misprint

p. 48 line 3.

Defect: The ambient scheme is used where the coefficient complex is intended.

Correction: Use K for the coefficient complex.

Check: The perverse argument applies to the complex K, not to the scheme X.

Known correction: Author ErrTML.pdf. Reach: the proof.

### E23 — misprint

ErrPL.pdf, correcting p. 251 line 18 of the 2002 paper.

Defect: The concentration inequality has the wrong sign at its endpoint.

Correction: Use the author-corrected concentration range |i|>1; the original 2002 proof has not been obtained.

Check: ErrPL.pdf gives the corrected local concentration bound in Sur la formule de Picard–Lefschetz; the original source is not claimed read.

Known correction: Author ErrPL.pdf. Reach: the proof.

### E24 — misprint

Deligne, Weil I, published 1974 Numdam scan, §7.1, (7.1.5), (7.1.5′) and final Frobenius sentence, printed p. 300; image rechecked 2026-10-10.

Defect: The totally isotropic branch labels the local skyscraper line by the twist n−m and consequently gives geometric Frobenius the inverse of the expected middle-degree eigenvalue.

Correction: With n=2m+1 and δ in Hⁿ(X_u,Q_l(m)), the local quotient line obtained by evaluation against δ is Q_l(m−n), with geometric Frobenius q^(n−m)=q^((n+1)/2) after rationalizing the orientation character. Use this twist in both the sheaf quotient and its boundary map.

Check: Cup product has target Q_l(−n). Pairing an untwisted x with δ twisted by m therefore has target Q_l(m−n). In the totally isotropic case its kernel is E⊥, and the local defect of extension by j* is this evaluation line. The same twist occurs in the local specialization sequence and in the δ=0 upper-corner calculation immediately above on p. 300. For n=1,m=0 the quotient is Q_l(−1), not Q_l(1). This correction preserves the upper bound used by the argument; it does not assert E₂ degeneration or hard Lefschetz.

Known correction: new; no published correction located in this run. Independent verification of the proposed correction is required.. Reach: the proof.

## Restructuring and upstream integration notes

**Regular-trait purity extension.** The existing EDC.3 smooth-pair-purity statement is over a field and does not supply the regular trait pairs used by the algebraic Picard–Lefschetz prefix. EtaleDualityAndPerverseSheaves, Part II: absolute purity and coherent restriction/Gysin diagrams for regular trait pairs; keep the general carrier with EDC.

**Henselian approximation extension.** Ordinary quadratic applications require general Artin/Elkik approximation beyond the existing henselization carrier. SchemeAndStackFoundations, Part II: general approximation and henselian/formal versality, imported by LPV’s quadratic applications.

**P-adic Lie extension.** The existing LieGroups roadmap is real/complex; compact Q_l subgroup arguments need their own scalar-field hypotheses. LieGroups, Part II: p-adic exp/log charts, closed subgroup theorem and full-Lie-algebra openness; this avoids re-planning the real LieGroups results.

**SL₂ nilpotent realization extension.** The existing SL₂ engine provides representation theory; the required nilpotent Jordan-block realization should build on it. LieHighestWeight, Part II: nilpotent-endomorphism SL₂ realization/Jacobson–Morozov interface needed by Deligne 1.6.8, without a second SL₂ carrier.

**Igusa geometry and semiperversity prefixes.** The full IG.4 stage consumes LPV.6; the geometry inputs of CS §4.6 are independent of that conclusion. Split IG.4 into a geometry/formal-model and boundary-transition prefix containing finite-level-formal-models and ell-power-boundary-killing, followed by the LPV.6 consumer and then IG semiperversity/compact-perversity. Keep both geometry nodes with Igusa; move no carrier to LPV.

**Formal comparison after nearby definition.** The H1 formal-nearby comparison uses the LPV nearby-cycle definition, while LPV’s comparison target uses the H1 theorem. Expose LPV.0’s definition prefix before H1/formal-nearby-cycles-comparison, and its scheme-adic comparison consumer after it. Keep the comparison theorem with H1 and the original seven LPV stage ids unchanged until integration.

**ClassicalGroups, Part II: Q_l symplectic interfaces.** The merged complex ClassicalGroups roadmap has no Q_l symplectic analytic interface; current OrthogonalSpinGroups already supplies the orthogonal side. Extend ClassicalGroups only by the missing Q_l Sp carrier/analytic Lie group interfaces, importing existing OrthogonalSpinGroups topology and LieGroups, Part II. LPV retains geometric generation and open-image arguments, not general group carriers.

**SchemeAndStackFoundations:SF.2.** The atlas stores PR196 as external entries with SF.2 as integration_owner, rather than checker-resolvable stages. Accordingly prerequisites use SF.2 only as that integration contract, with exact PR196 layers and immutable source head in requests. No generic étale/Galois/base-change carrier is re-planned in LPV.

**SchemeAndStackFoundations:SF.0.** ProjectiveSchemesAndSmoothMorphisms is the upstream owner of projective/Grassmann/Veronese/tangent geometry. SF.0 is the atlas integration owner; the request imports it and separates the missing approximation Part II.

**DeligneWeightsAndPurity:DWP.5.** Weil II 1.9’s weight-dependent relative-filtration existence is a downstream use of LPV.1 and belongs to DWP.5/local-weight-corollaries, not DWP.1 (curve and abelian-variety Weil estimates). Do not add a reverse DWP.5→LPV.1 dependency for the tame commuting-residue and uniqueness targets.

**OrthogonalSpinGroups.** Current read-only TauCetiRoadmap main, head dea8191, already owns general-field orthogonal carriers, reflection API (Layer 0) and Q_l canonical topology (Layer 2). Read both layers and their Suggested.lean; replace atlas-era complex-ClassicalGroups assumptions by these imports. No new orthogonal carrier or topology plan belongs to LPV. Only the remaining symplectic/analytic extension is ClassicalGroups, Part II.

**IgusaVarietiesAndTorsionConcentration:IG.4.** Checked exact independent nodes finite-level-formal-models and ell-power-boundary-killing. Node graph: IG geometry prefix → LPV.6 interface → IG semiperversity/compact-perversity. The atlas whole-stage edge would still be cyclic; install the proposed prefix split before publishing a whole-stage link. No other packet is edited.

**DeligneWeightsAndPurity:DWP.4.** Remove the reverse DWP.4 prerequisite: finite orthogonal rationality uses FA.5 finite-cover Chebotarev, compatible trace formulas and CharacterTheory, not DWP weight induction. DWP.4 remains a downstream consumer of the geometric LPV.0–5 prefix.

**ClassicalAdicEtaleCohomology:H1.** Import scheme-completion-comparison-3-5-13 and formal-nearby-cycles-comparison exactly. The latter uses the LPV.0 nearby definition, not LPV.0 scheme-adic comparison: nearby definition → H1 comparison → LPV comparison consumer. Split this prefix if a whole-stage H1↔LPV.0 edge is installed.

## Sources read and unavailable originals

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf) — Publ. Math. IHÉS 43 (1974), 273–307; Numdam scan with OCR, 36 PDF pages (printed page = PDF page + 271); locators give printed pages. Read 2026-10-06; revision checked 2026-10-10. §§4–5, pp. 287–294: inherited page-image reading, independently audited against the text and required targets; §§6–7 consulted for arithmetic ownership; their weight arguments are supplied by DeligneWeightsAndPurity; Revision 2: §§4–5, pp. 287–294; §7.1, pp. 299–300, including all five displayed sheaf sequences and their cohomology maps; printed page images checked..
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf) — Springer 1973; IAS author-archive scan with OCR (the OCR is poor: symbols ~, @, 4 replace accents and Greek letters; statements were reconstructed from the surrounding French text and the numbered cross-references). Read 2026-10-06; revision checked 2026-10-10. XII §§1–3 and XV §§1–2: inherited page-image reading and transcriptions, 2026-09-29; their statements retained and audited; XIII 2.1.9–13 and 2.2–2.4; XVII §§1–4; XVIII §§1–4, 5.1, 6.1, 6.3–6.4, 6.6–6.7; portions needed for the algebraic generation and pencil restriction/Gysin formulas; Revision 2: XII ordinary forms and XV 1.2.1–8 (printed pp. 168–171), XIII finite log 1.5, XVII 4.3 and XVIII pencil restriction/Gysin loci rechecked; local exposé pagination distinguished from printed volume pagination..
- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf) — Publ. Math. IHÉS 52 (1980), 137–252. Read 2026-10-06; revision checked 2026-10-10. 1.6–1.7 and 1.9, pp. 165–178; 4.2.1–8, 4.3.9–10, 4.4.1–4, 4.4.8–9 and 4.5.1–2, pp. 220–234; proof interiors 4.4.5–7 not freshly read; Revision 2: complete 4.4.5–9, pp. 229–231; rational finite-monodromy character, integrality, positivity and ADE proof interiors freshly read..
- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/) — Astérisque 223 (1994), 9–57. Read 2026-10-06; revision checked 2026-10-10. 1.1–1.5; 3.5–3.8 (filtered nearby-cycle calculation); 4.1–4.6 (duality and perversity); beginning of 4.7; Revision 2: semistable two-component and early perverse/duality hypotheses rechecked in §§3.5–3.8 and 4.1–4.6..
- [Luc Illusie, Errata to Autour du théorème de monodromie locale](https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrTML.pdf) — Author errata sheet, 1 page. Read 2026-10-06; revision checked 2026-10-10. Entire errata sheet.
- [Luc Illusie, Grothendieck and vanishing cycles](https://www.numdam.org/article/AFST_2021_6_30_1_83_0.pdf) — Ann. Fac. Sci. Toulouse 30 (2021), 83–115. Read 2026-10-06; revision checked 2026-10-10. 6.1–6.3, pp. 103–105; algebraic Picard–Lefschetz route through the two-component calculation.
- [Luc Illusie, Erratum to Sur la formule de Picard–Lefschetz](https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrPL.pdf) — Author erratum to Adv. Stud. Pure Math. 36 (2002), 249–268. Read 2026-10-06; revision checked 2026-10-10. Entire sheet; p. 251 line 18 correction.
- [Luc Illusie, Vanishing cycles over general bases](https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf) — Author lecture text, December 2006. Read 2026-10-06; revision checked 2026-10-10. 1.1 and 2.1–2.4 (oriented products and their points).
- [Lie Qian, Potential automorphy for GL_n](https://par.nsf.gov/servlets/purl/10388233) — Invent. Math. 231 (2023), published text. Read 2026-10-06; revision checked 2026-10-10. Definition 3.6: maximally unipotent and maximally nilpotent.
- [Javier Fresán, Claude Sabbah and Jeng-Daw Yu, Hodge theory of Kloosterman connections](https://arxiv.org/pdf/1810.06454) — arXiv:1810.06454 downloaded public manuscript, 74 PDF pages; cited locators refer to this SHA-256 text, not independently to the published Duke Math. J. pagination. Read 2026-10-06; revision checked 2026-10-10. 5.1.3, pp. 41–44, ordinary quadratic points and the characteristic-two nonordinary branch.
- [Mark Kisin and George Pappas, Integral models of Shimura varieties with parahoric level structure](https://www.numdam.org/article/PMIHES_2018__128__121_0.pdf) — Publ. Math. IHÉS 128 (2018), 121–218. Read 2026-10-06; revision checked 2026-10-10. 4.7.1 and 4.7.3, pp. 212–213; definitions and use of nearby-cycle semisimple trace.
- [Ana Caraiani and Peter Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://people.mpim-bonn.mpg.de/scholze/Noncompact.pdf) — Author public manuscript, Noncompact.pdf. Read 2026-10-06; revision checked 2026-10-10. 4.6, pp. 60–63, finite-level semiperversity and the cofinal-model interface; Revision 2: §4.6 proof and finite-level affine integral-pushforward argument, pp. 60–63, rechecked against the exact IG.4 geometry-prefix nodes..
- [Thomas Haines and Bao Châu Ngô, Nearby cycles for local models of some Shimura varieties](https://math.uchicago.edu/~ngo/nearby-cycle.pdf) — Compositio Mathematica 133 (2002), 117–150; published author-hosted PDF. Read 2026-10-10. §3.1, pp. 127–128: admissible filtrations, common refinement, Lemma 8 and Corollary 9, including proofs.
- [Roland Huber, Étale cohomology of rigid analytic varieties and adic spaces](https://doi.org/10.1007/978-3-663-09991-8) — Aspects of Mathematics E30 (1996); maintainer-cleared reference read in place. Read 2026-10-10. §3.5, Theorem 3.5.13, p. 207, proof pp. 208–209; Corollaries 3.5.14–17, pp. 209–210; formal completion and strictly henselian rank-one nearby comparison.
- [Peter Schneider, p-Adic Lie Groups](https://doi.org/10.1007/978-3-642-21147-8) — Grundlehren der mathematischen Wissenschaften 344 (2011); maintainer-cleared reference read in place. Read 2026-10-10. §18.10–19, pp. 144–153: exponential charts and local homomorphisms; Exercise 26.2, pp. 181–182; Theorem 27.1, pp. 192–194; Theorem 29.2 and Corollaries 29.4–6, pp. 203–205, with proofs.

Illusie’s original 2002 algebraic proof and 2003 general concentration proof were not obtained. Their surveyed route, application and author erratum do not replace those proof interiors. The general Artin/Elkik and SGA 4½ finiteness proofs remain precise owner/source requests. Huber and Schneider were read in the maintainer-cleared references, in place; no book file or passage is included here. Public versions remain fixed by the packet’s hashes and version records.
