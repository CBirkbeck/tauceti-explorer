# Lefschetz pencils, nearby cycles and vanishing cycles — LPV.0–6

This roadmap builds actual trait nearby cycles, their inertia and monodromy calculus, algebraic Picard–Lefschetz theory, sufficiently ample Lefschetz pencils and their middle cohomology, followed by geometric open monodromy and perverse comparison interfaces. LPV.7 owns the general invariant-cycle and semistable-family exports. The local two-component calculation required by Picard–Lefschetz is in LPV.1.

The specification below is definitive; the associated suggested file is a signature aid with explicitly omitted supplier conditions, not an implementation. Each definition and construction has a reusable API, concrete tests, uses and direct dependencies. All declarations have implementation status unchecked.

## Boundaries and conventions

The accepted RS-17 division imports arithmetic inertia and Weil–Deligne carriers into LPV.1, general blowup/projective-bundle cohomology into LPV.4, and the perverse category into LPV.6. Generic étale sheaves, derived complexes, six-operation and base-change infrastructure come from the existing PR196 roadmaps through their atlas integration owner `SchemeAndStackFoundations:SF.2`; projective, Grassmannian, tangent and Veronese geometry come through `SchemeAndStackFoundations:SF.0`. These are integration contracts, not competing plans.

Fix a henselian trait S with geometric generic and closed points, and ℓ invertible on S. Finite coefficients precede derived adic realization and rationalization. RΨ uses the geometric generic immersion. The triangle is i*K → RΨK → RΦK. Tate twists are retained; geometric Frobenius gives NF=qFN after a Tate basis is chosen. Monodromy filtrations are increasing and centered at the specified integer.

A quadratic form has polar form Q(x+y)−Q(x)−Q(y). A Lefschetz fibre has dimension n=2m or 2m+1; δ lies in H^n(X_η̄,Q_ℓ)(m). In dimension classes 0,1,2,3 modulo 4, the Picard–Lefschetz coefficient is −,−,+,+ and the self-pairing is 2,0,−2,0. The pairing is cup product followed by trace. Mathlib's orthogonal convention is a right orthogonal; the symmetric or alternating condition identifies the required side.

For a pencil, U=D−S is the open smooth parameter locus and E is the span of all transported cycles. The quotient V=E/(E∩E⊥) carries the odd-dimensional symplectic form. A zero V is a separate case. Openness is over the fixed Q_ℓ model. The conditional orthogonal/ADE branch has additional nondegeneracy and integrality inputs.

## The library baseline

Use Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed audit does not contain any complete LPV target. The following declarations supply the stated pieces, with their actual conventions.

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
- [tauceti:TauCeti.exp_smul_eq_sum_smul_dividedPower](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Nilpotent/Exp.lean) — For x^k=0 in a Q-algebra, exp(r x)=Σ_(i<k)r^i x^i/i!. The scalar exponential is existing work, not a new LPV construction.

The pinned quadratic tensor base-change API requires 2 invertible. The ordinary-form API constructs scalar extension in local bases and descends it without polarization in characteristic two.

## LPV.0 — Nearby and vanishing cycles on actual sites

Work on the actual small étale sites of the total space and its geometric fibres. The henselian-trait gluing category carries both the special part and the geometric generic part, joined by specialization. For sheaves on the trait the image of specialization lies in inertia invariants, but the nearby object itself retains the full inertia action. Derived nearby cycles use ī*Rj̄*; replacing the geometric open immersion by j loses that action.

The specialization triangle has direction i*K → RΨK → RΦK. Constructibility is the excellent finite-type finiteness theorem with invertible coefficients, not a stalkwise dimension assertion. Proper, smooth, exceptional, coefficient and trait exchange maps have separate hypotheses. Compatible finite-level constructions give the adic realization; the scheme/adic comparison has its own admissible domain and must commute with specialization and every inertia automorphism.

**Stage:** `LefschetzPencilsAndVanishingCycles:LPV.0`.

**Planets:** Nearby and vanishing cycles; Constructibility of nearby cycles.

### Definition. Henselian trait and geometric fibre diagram

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`.

A henselian trait is S = Spec R for a henselian discrete valuation ring R. Fix a separable geometric generic point and the uniquely extended valuation, with geometric closed point, normalization S̄, open generic inclusion j̄ and closed inclusion ī. Inertia is the kernel of generic-to-residue Galois specialization. The generic Galois-sheaf equivalence is imported from ConstructibleEtale:3, not constructed here.

**Hypotheses.**

- R a discrete valuation ring and henselian; the normalization in the chosen separable closure has the uniquely extended valuation
- The residue field of S̄ can be a purely inseparable extension of the selected separable residue closure

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

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.inertia_eq_top_of_strictlyHenselian` (degenerate) — If V is strictly henselian then Gal(s̄/s) = 1 and I = Gal(η̄/η).
- `TauCeti.AlgebraicGeometry.VanishingCycles.inertia_puiseux` (value) — For V the henselisation of k[t] at (t), k algebraically closed of characteristic 0, I = Gal(η̄/η) ≅ Ẑ(1), acting on t^{1/n} through μ_n.
- `TauCeti.AlgebraicGeometry.VanishingCycles.inertia_eq_valuation_inertia` (comparison) — I coincides with Mathlib's ValuationSubring.inertiaSubgroup for the valuation subring of k(η̄) over V, as a subgroup of the decomposition group, which here is all of Gal(η̄/η).
- `TauCeti.AlgebraicGeometry.VanishingCycles.wild_inertia_ne_bot` (non-example) — For V = the henselisation of 𝔽̄_p[t] at (t), I is not procyclic: the Artin–Schreier extensions x^p − x = t^{-a} (p ∤ a) give infinitely many independent ℤ/p quotients.

**Construction or proof.**

1. Use the pinned generic and special fibre pullback constructors for the scheme diagram.
2. Import valuation decomposition/inertia and the henselian specialization exact sequence from R01.2.
3. Import Galois descent for sheaves from ConstructibleEtale:3.

**Direct dependencies:** `tauceti:TauCeti.genericFiber`, `tauceti:TauCeti.specialFiber`, `mathlib:HenselianLocalRing`, `mathlib:ValuationSubring.inertiaSubgroup`, `ArithmeticGaloisRepresentations:R01.2`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- For Y = Spec k the equivalence recovers Gal(k̄/k)-sets.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, Rappel 1.1.3, p. 7. The galoisian description used throughout (OCR cleaned).
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, 0.2.5, p. 5. Conventions on S̄ and geometric points.

### Construction. The specialization morphism sp: S -> s and the 2-fibre-product topos Y ×_s S with its galoisian description (XIII 1.2)

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`.

1.2.1: for S local henselian with closed point i: s -> S, S' ↦ S' ×_S s is an equivalence between finite étale S-schemes and finite étale s-schemes; the inverse defines a morphism of sites sp: S -> s (SGA 4 VIII 7) with sp_*F = i^*F (1.2.1.1) and, for F on an open U (or on η), sp_*F = i^*j_*F (1.2.1.2). 1.2.2: for a henselian trait S, sheaves on S are triples (F_s, F_η, φ: F_s -> i^*j_*F_η) (SGA 4 IV 9.5.4); via 1.1, i^*j_* is the functor of I-invariants, so sheaves on S are triples (a Gal(s̄/s)-set F_s̄, a Gal(η̄/η)-set F_η̄, an equivariant φ: F_s̄ -> F_η̄^I); the functors sp^*, sp_*, j^*, j_*, i^*, i_* are written out in these terms (1.2.2(c)). 1.2.3-1.2.4: for Y a scheme over s, the 2-fibre product Y ×_s S of the étale topoi of Y and S over that of s exists (Giraud) and is described by triples (F_s a sheaf on Y, i.e. a sheaf on Ȳ with continuous Gal(s̄/s)-action; F_η a sheaf on Ȳ with continuous Gal(η̄/η)-action compatible via 1.1.1; φ: F_s -> F_η equivariant); Y ×_s S is the union of the open Y ×_s η and the closed complement Y, with the same formulas for sp = pr_1, j, i; 1.2.4.2 independence of the choice of k(η̄); 1.2.5-1.2.6: points of Y ×_s η and Y ×_s S, conservative families, Point(Y ×_s S) ≅ Point(Y) ×_{Point(s)} Point(S); 1.2.7: functoriality in Y (f_*, f^* formulas 1.2.7.1-2 for quasi-compact f) and in S (surjective morphisms of henselian traits, f^* formula 1.2.7.3, f_* as induced representation for finite f); 1.2.8-1.2.9: f_! (extension by zero for locally closed immersions; direct image with proper support formula 1.2.8.1 for f locally of finite type and separated) and its right adjoint f^! for locally closed immersions, extended to quasi-finite f for abelian sheaves (SGA 4 XVIII 3.1.8), with f^! = f^* for étale f.

**Hypotheses.**

- S a henselian trait; Y a scheme over s; the 2-fibre product is taken for the étale topoi (Giraud); readers may take the galoisian description 1.2.4 as the definition
- For non-separably-closed residue field the 2-product must be fibred over Spec(k)_et (introduction, item c))

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos` (constructor) — For Y over s, the category of triples (F_s, F_η, φ): F_s a sheaf on Y (a Gal(s̄/s)-sheaf on Ȳ), F_η a continuous Gal(η̄/η)-sheaf on Ȳ, φ : F_s → F_η equivariant (XIII 1.2.4).
- `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos.sp_pullback` (constructor) — sp^* : sheaves on Y → sheaves on Y ×_s S, F ↦ (F, F, id).
- `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos.etaPart` (constructor) — The restriction to Y ×_s η, (F_s, F_η, φ) ↦ F_η.
- `TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos.equivSheavesOnTrait` (equivalence) — For Y = s, sheaves on S ≌ triples (F_s̄, F_η̄, φ : F_s̄ → F_η̄^I) (XIII 1.2.2).

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities` — Ψ(F) is a triple (F_s, Ψ_η(F_η), φ)
- `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism` — complexes written as triples with φ injective
- `LefschetzPencilsAndVanishingCycles:LPV.2/direct-images-at-a-lefschetz-degeneration` — R^i f_*ℚ_ℓ on a trait read as the triple (H^i(X_s), H^i(X_η̄), sp)

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_constant` (value) — The constant sheaf Λ on S is the triple (Λ, Λ, id) with I acting trivially.
- `TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_jPushforward` (value) — j_*G for a Gal(η̄/η)-module G is the triple (G^I, G, inclusion).
- `TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_degenerate` (degenerate) — For Y = ∅ the category is the terminal one.
- `TauCeti.AlgebraicGeometry.VanishingCycles.not_triple_of_noninvariant` (non-example) — For Y = s, a pair (F_s̄, F_η̄) with an equivariant map φ whose image is not in F_η̄^I is not a sheaf on S: the description 1.2.2 forces φ to land in the inertia invariants.

**Construction or proof.**

1. Equivalence of finite étale covers of S and s (henselian), giving sp.
2. Description of sheaves on S by triples (SGA 4 IV 9.5.4) and identification of i^*j_* with I-invariants.
3. Galoisian description of Y ×_s S; verification of independence (1.2.4.2) by functoriality in the separable closure.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`.

**Acceptance.**

- A sheaf on Y ×_s S restricted to the closed Y is F_s and to the open Y ×_s η is F_η; sp^*(F_s) = (F_s, F_s, id).
- Points (x, s̄) and (x, η̄) form conservative families (1.2.5).

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, Construction 1.2.4, p. 10. The galoisian description of the topos (OCR cleaned).
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, 1.2.2(b), p. 9. Identification of i^*j_* with inertia invariants.

### Construction. The left exact functor Ψ: (sheaves on X) -> (sheaves on X_s ×_s S), its η-part Ψ_η = ī^* j̄_*, and its functorialities (XIII 1.3)

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities`.

1.3.1-1.3.2: for p: X -> S over a henselian trait, with X̄ = X ×_S S̄, the cartesian diagram X_s̄ -> X̄ <- X_η̄ over s̄ -> S̄ <- η̄; for F a sheaf on X_η with pullback F_η̄ on X_η̄ put Ψ_η(F) = ī^* j̄_* F_η̄ (1.3.2.2), a sheaf on X_s̄ with continuous Gal(η̄/η)-action compatible with the action on X_s̄, i.e. a sheaf on X_s ×_s η; Ψ_η is left exact (1.3.2.3). 1.3.3: for F on X with restrictions F_η, F_s, put Ψ(F)_η = Ψ_η(F_η), Ψ(F)_s = F_s, and φ induced by the adjunction F -> j_*j^*F; Ψ(F) = (F_s, Ψ_η(F_η), φ) is a sheaf on X_s ×_s S and Ψ is left exact (1.3.3.3); 1.3.4 notations. 1.3.5-1.3.10 (functorialities, useful mainly in derived form): for f: X -> X' over S, base change gives Ψ f_* -> f_* Ψ (1.3.6.1), an isomorphism for f proper (SGA 4 XII 5.1(i)), whose essential case X' = S is Γ(X_η̄, F) -> Γ(X_s̄ ×_s η̄, Ψ_η F) (1.3.6.3); f^*Ψ -> Ψ f^* (1.3.7.1); for f quasi-finite, f_!Ψ -> Ψ f_! (1.3.8.1), inverse of 1.3.6.1 for f finite; Ψ f^! -> f^! Ψ (1.3.9.1), inverse of 1.3.7.1 for f étale; base change of traits S' -> S: f^*Ψ -> Ψ f^* (1.3.10.1).

**Hypotheses.**

- S a henselian trait; X any S-scheme; sheaves of sets (pointed sets for f_!)
- Ψ is not in general the direct image of a morphism of topoi (1.3.1)

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta` (constructor) — Ψ_η(F) = ī^* j̄_* F_η̄, a continuous Gal(η̄/η)-sheaf on X_s̄ (XIII 1.3.2.2).
- `TauCeti.AlgebraicGeometry.VanishingCycles.psi` (constructor) — Ψ(F) = (F_s, Ψ_η(F_η), φ) on X_s ×_s S, φ from F → j_*j^*F (XIII 1.3.3).
- `TauCeti.AlgebraicGeometry.VanishingCycles.psi_leftExact` (characterisation) — Ψ and Ψ_η are left exact.
- `TauCeti.AlgebraicGeometry.VanishingCycles.psi_pushforward` (compatibility) — The base-change map Ψ f_* → f_* Ψ, an isomorphism for f proper (XIII 1.3.6).

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle` — RΨ is the right derived functor of Ψ
- `ClassicalAdicEtaleCohomology:H1/trait-nearby-cycles-agree` — the underived functor compared with the analytic construction
- `ClassicalAdicEtaleCohomology:H1/nearby-versus-vanishing-cycles` — Ψ versus Φ at the underived level

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_trait` (value) — For X = S, Ψ_η(F) is F_η̄ with its Gal(η̄/η)-action.
- `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_ne_invariants` (non-example) — For X = S, Ψ_η(F) = F_η̄ differs from i^*j_*F = F_η̄^I whenever I acts nontrivially: using j_* in place of j̄_* loses the inertia action.
- `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_smooth_constant` (value) — For X smooth over S and Λ constant, Ψ_η(Λ) = Λ, since the strict henselisations of X̄ at points of X_s̄ are normal domains.
- `TauCeti.AlgebraicGeometry.VanishingCycles.psi_proper_pushforward_id` (degenerate) — For f = id the base-change map is the identity.

**Construction or proof.**

1. Define Ψ_η by pullback to η̄, direct image to X̄ and restriction to X_s̄; check the Galois action.
2. Assemble the triple with the adjunction map; derive the functorialities from base change maps.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`, `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- For X = S, Ψ_η(F) is the Gal(η̄/η)-set F_η̄ viewed over s̄ and Ψ(F)_s = F_s with φ: F_s -> F_η̄^I.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, 1.3.1, p. 13. Nature of Ψ.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, 1.3.6, p. 15. Proper compatibility at the underived level (OCR cleaned).

### Construction. The variation Var(σ): Φ(K)_η -> K_η for a complex K on Y ×_s S and σ in the inertia group (XIII 1.4)

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.variation`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`.

1.4.1-1.4.2: for K a complex of A-modules on Y ×_s S, i.e. a triple (K_s, K_η, φ) with K_s̄, K_η̄ complexes on Ȳ with continuous Gal(s̄/s), resp. Gal(η̄/η), actions and φ equivariant, K is homotopic to a triple K' with φ' injective and the sequence 0 -> K'_s -> K'_η -> coker(φ') -> 0 (1.4.2.1) split degreewise (take K'_η the sum of K_η and the cone of sp^*K_s); Φ(K) := coker(φ') gives a distinguished triangle sp^*K_s -> K_η -> Φ(K) -> in K(Y ×_s η, A) depending only on K (1.4.2.2), passing to the derived category and yielding the long exact sequence ... -> H^i(V, K_s) -> H^i(V, K_η) -> H^i(V, Φ(K)_η) -> ...; 1.4.3: the inertia group I acts trivially on K'_s, so for σ ∈ I the endomorphism σ − 1 of K'_η factors through Var(σ): coker(φ') -> K'_η; in the derived category this defines the variation Var(σ): Φ(K)_η -> K_η (1.4.3.1) with σ = 1 + Var(σ)q on K_η (1.4.3.2), σ = 1 + q Var(σ) on Φ(K)_η (1.4.3.3), q: K_η -> Φ(K)_η the natural map, and Var(στ) = Var(σ) q Var(τ) + Var(σ) + Var(τ) (1.4.3.4).

**Hypotheses.**

- A a ring (or a sheaf of rings on Y); K ∈ D(Y ×_s S, A)
- I acts trivially on the s-part

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.variation` (constructor) — Var(σ) : Φ(K)_η → K_η for σ ∈ I and K a complex on Y ×_s S, defined on a representative with φ' injective (XIII 1.4.3).
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_left` (characterisation) — σ = 1 + Var(σ) ∘ q on K_η.
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_right` (characterisation) — σ = 1 + q ∘ Var(σ) on Φ(K)_η.
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_mul` (compatibility) — Var(στ) = Var(σ) q Var(τ) + Var(σ) + Var(τ).
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_wellDefined` (compatibility) — Var(σ) depends only on K in the derived category, not on the representative K'.

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2` — the variation formula at an ordinary quadratic point, n even
- `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3` — the variation formula at an ordinary quadratic point, n odd
- `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula` — the monodromy on H^n(X_η̄) through σ = 1 + Var(σ) q
- `ClassicalAdicEtaleCohomology:H1/variation-on-analytic-cohomology` — transport of Var to analytic cohomology

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_one` (degenerate) — Var(1) = 0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_of_phi_zero` (value) — If Φ(K) = 0 then Var(σ) = 0 and I acts trivially on K_η, by σ = 1 + Var(σ) q.
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_picardLefschetz` (value) — At an ordinary quadratic point in odd relative dimension n = 2m + 1, Var(σ)(a) = (−1)^{m+1} t_ℓ(σ)(a, δ)δ, which is nonzero when t_ℓ(σ) ≠ 0 and δ ≠ 0 (XV 3.3).
- `TauCeti.AlgebraicGeometry.VanishingCycles.variation_ne_sub_one` (non-example) — Var(σ) is not σ − 1: it goes from Φ(K)_η to K_η, and σ − 1 on K_η is Var(σ) ∘ q, which vanishes on the image of K_s.

**Construction or proof.**

1. Replace K by a homotopic triple with injective, degreewise split φ'; define Φ as the cokernel; factor σ − 1 through Φ.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`, `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`.

**Acceptance.**

- The variation determines the inertia action on K_η through 1.4.3.2; the cocycle rule 1.4.3.4 is the algebraic analogue of the classical variation.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, 1.4.3, p. 17. Definition of the variation (OCR cleaned).
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, (1.4.3.2)-(1.4.3.4), p. 17. The identities satisfied by Var.

### Construction. RΨ, RΨ_η, RΦ, the vanishing triangle, the stalk formula and local acyclicity (XIII 2.1.1-2.1.5)

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.RPsi`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`.

2.1.1: S a henselian trait, A a torsion ring prime to the residue characteristic p (more generally a torsion sheaf of rings prime to the residue characteristics; the main case A = Z/ℓ^n, ℓ invertible on S). 2.1.2: RΨ: D^+(X, A) -> D^+(X_s ×_s S, A) and RΨ_η: D^+(X_η, A) -> D^+(X_s ×_s η, A) are the derived functors of Ψ, Ψ_η; since restriction of an injective to the open X_η stays injective and pullback to X_η̄ is acyclic, (2.1.2.1) RΨ(K)_s = i^*K, (2.1.2.2) RΨ(K)_η = RΨ_η(K_η), (2.1.2.3) RΨ_η(K)_η̄ = ī^* R j̄_* K_η̄ (displays partly lost in OCR); with RΨ_η(K) := (RΨ(K))_η, RΦ(K) := Φ(RΨ(K)) the triangle 1.4.2.2 becomes the distinguished triangle sp^* i^*K -> RΨ_η(K_η) -> RΦ(K) -> (2.1.2.4) on X_s ×_s η, with the variation Var(σ): RΦ(K)_η -> RΨ_η(K) (2.1.2.5); the R^iΨ(A) (or R^iΨ(K)) are the sheaves of vanishing cycles (Deligne's terminology for the nearby-cycle sheaves). 2.1.3-2.1.4 (stalk formula): for a geometric point x̄ of X_s̄ and the strict henselization X_(x̄), a scheme over the strict henselization S^nr with geometric generic point η̄^nr, (RΨ(K))_(x̄, η̄) = RΓ(X_(x̄) ×_{S^nr} η̄, K), in particular R^iΨ(K)_(x̄,η̄) = H^i(X_(x̄) ×_{S^nr} η̄, K) — the cohomology of the strict-local geometric Milnor fibre. 2.1.5 (local acyclicity, from SGA 4 XV 2.1): if f is smooth and F locally constant then RΦ(F) = 0; more generally RΦ(K) = 0 where f is smooth and the H^i(K) are locally constant.

**Hypotheses.**

- A torsion, prime to the residue characteristic (0.2.7); K ∈ D^+
- The stalk formula uses the strict henselization at x̄ and the strict henselization S^nr of the trait
- Local acyclicity of smooth morphisms is imported from SGA 4 XV 2.1

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

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_smooth` (value) — For X → S smooth and K = Λ: RΦ(Λ) = 0 and RΨ_η(Λ) = Λ.
- `TauCeti.AlgebraicGeometry.VanishingCycles.RPsi_trait` (degenerate) — For X = S: RΨ_η(K) = K_η̄ with its Gal(η̄/η)-action.
- `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_node` (value) — For X = Spec V[x, y]/(xy − π), π a uniformiser and S strictly henselian: R^iΦ(Λ) = 0 for i ≠ 1, and R^1Φ(Λ) is supported at the origin, free of rank 1 (XV 3.1.2 with n = 1).
- `TauCeti.AlgebraicGeometry.VanishingCycles.specialization_direction` (non-example) — For f proper the triangle gives H^i(X_s, K) → H^i(X_η̄, K) → H^i(X_s, RΦ K) → H^{i+1}(X_s, K): specialisation runs from the special to the generic fibre, and the reversed arrow is not a morphism of the triangle.

**Construction or proof.**

1. Derive Ψ using injectives; verify (2.1.2.1)-(2.1.2.3).
2. Apply Φ to obtain the triangle and Var.
3. Stalk: compute (RΨ_η K)_(x̄,η̄) via the strict localization and (2.1.2.3).
4. Local acyclicity: SGA 4 XV 2.1.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities`, `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- For a smooth family with locally constant coefficients RΦ = 0 and sp^*i^*K ≅ RΨ_η(K_η).
- For a disjoint union, RΨ is computed componentwise (functoriality in X); for a nodal curve over a trait the stalk formula at the node gives the cohomology of the Milnor fibre (an annulus), to be checked against XV §2.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, 2.1.1, p. 17. Coefficient hypothesis.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, Proposition 2.1.4, p. 19. Stalk formula (OCR cleaned).
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, Reformulation 2.1.5, p. 19. Local acyclicity.

### Theorem. Derived functorialities of RΨ (proper and smooth base change, f_!, f^!, change of trait) and the specialization sequence with inertia/variation diagrams (XIII 2.1.6-2.1.8)

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.derivedFunctorialitiesAndSpecializationSequence`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`.

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

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`.

**Acceptance.**

- Direction: specialization goes from H^i(X_s̄, K) to H^i(X_η̄, K) (through RΨ), and RΦ sits in degree shift 0 in the triangle sp^*i^*K -> RΨ_η -> RΦ -> (no shift), so the connecting map raises the degree by one.
- Inertia and Galois equivariance are built into the topos X_s ×_s S (all maps are equivariant).

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, 2.1.7.1-2, p. 20. Proper and smooth compatibilities (OCR cleaned).
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XIII, 2.1.8.9, p. 22. The specialization sequence and its use (OCR cleaned).

### Theorem. Geometric fibre maps on the small étale sites

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.geometricFibreSiteMaps`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.0/geometric-fibre-site-morphisms`.

The chosen geometric fibre square X_η̄→X_S̄←X_s̄ induces the small-étale inverse-image and direct-image adjunctions. The inclusions are the base changes of the open generic and closed special inclusions, and inertia acts on the geometric generic side, with natural descent action on ī*Rj̄*. The sites are Scheme.smallEtaleTopology, not the Zariski sites.

**Hypotheses.**

- Henselian trait; finite-type X→S; chosen compatible geometric points

**Construction or proof.**

1. Use the pinned generic/special fibre pullback constructors.
2. Import the scheme-to-small-étale-topos morphisms from ConstructibleEtale and identify their fibre squares.
3. Transport the generic Galois action through these morphisms; record coherence for identity and composition.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`.

**Acceptance.**

- For X=S, the geometric nearby stalk is the generic representation, rather than its inertia invariants.
- The open map is j̄ over the geometric normalization; replacing it by j changes the answer.

**Sources.**

- [Luc Illusie, Vanishing cycles over general bases](https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf), §1.1, classical trait diagram. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Comparison. Oriented product and the classical trait description

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.orientedProductTraitComparison`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.0/oriented-product-comparison`.

The oriented product X_s←×_Sη has points consisting of a geometric x, geometric generic point and specialization path. Its derived nearby-cycle stalk is RΓ(X_(x)×_{S_(f(x))}η̄,K). For a trait the oriented product identifies with the classical generic part of X_s×_sS, carrying the same specialization and inertia action. The full gluing topos has special and generic parts; it is not identified with the generic part alone.

**Hypotheses.**

- Trait base and compatible geometric points; torsion derived sheaves
- For a general higher-dimensional base this statement does not assert arbitrary base-change or constructibility

**Construction or proof.**

1. Use the oriented-product site of triples U→V←W and its covering families from Illusie §2.1.
2. Describe its points by specialization paths and identify the strict-local tube.
3. Restrict to the trait and compare the universal gluing maps with XIII 1.2–1.3.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`, `LefschetzPencilsAndVanishingCycles:LPV.0/geometric-fibre-site-morphisms`, `SchemeAndStackFoundations:key/henselization`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `EnhancedDerivedSheaves:E1`.

**Acceptance.**

- The specialization arrow points from the special stalk to the generic nearby stalk.
- The identity map over a field has vanishing cycles zero.

**Sources.**

- [Luc Illusie, Vanishing cycles over general bases](https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf), §2.1–2.4, especially 2.2.3 and 2.3.4. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Constructibility and bounded nearby cycles

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyCyclesConstructible`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude`.

For X of finite type over an excellent henselian trait and a bounded constructible torsion complex K with coefficients invertible on S, RΨK and RΦK have bounded constructible cohomology. Finite Tor-amplitude is retained under the finite-coefficient hypotheses of the finiteness theorem. A mere collection of finite stalks is not used as the constructibility criterion.

**Hypotheses.**

- Excellent henselian trait; finite-type morphism
- Bounded constructible finite torsion coefficients invertible on S; finite Tor-amplitude for the Tor conclusion

**Construction or proof.**

1. Apply the trait finiteness theorem recalled in Illusie §1.1 and supplied by EtaleBaseChange:6.
2. Use the strict-local stalk calculation for the finite cohomological amplitude.
3. Apply the specialization triangle to RΦ and the constructible/finite-Tor supplier criteria.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:key/henselization`.

**Acceptance.**

- For an ordinary node only the single middle vanishing sheaf survives.
- The general-base oriented functor is not asserted constructible without a modification theorem.

**Sources.**

- [Luc Illusie, Vanishing cycles over general bases](https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf), §1.1, finiteness theorem and change of trait. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Coefficient change and inertia restriction

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyCyclesCoefficientTraitChange`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.0/coefficient-and-trait-change`.

Nearby and vanishing cycles commute with derived extension of finite coefficient rings in the invertible finite-Tor setting, and with dominant change of henselian traits. These isomorphisms preserve specialization, the cone triangle and inertia after restriction. For adic coefficient systems the statement is applied compatibly at every finite level before derived completion; underived tensor is not substituted for derived tensor.

**Hypotheses.**

- Finite coefficient homomorphism and constructible finite-Tor complexes; ℓ invertible
- Dominant trait morphism with transported geometric points

**Construction or proof.**

1. Use XIII 2.1.13 universal coefficient comparison, retaining derived tensor and Tor terms.
2. Use XIII 2.1.7.5 for change of traits, with the restriction map on inertia.
3. Check the unit/counit construction of specialization and the enhanced cone commute with both comparisons.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude`, `EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`, `EnhancedDerivedSheaves:E4`, `ArithmeticGaloisRepresentations:R01.2`.

**Acceptance.**

- Reduction Z/ℓ²→Z/ℓ has the derived Tor correction when the stalk is not flat.
- A ramification-index e extension replaces t_l by e times the normalized new tame character.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), XIII 2.1.7.5 and 2.1.13, pp. 18, 24–25. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Comparison. Adic realization of trait nearby cycles

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.adicNearbyCycleRealization`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization`.

A compatible system of bounded constructible Z/ℓ^r-complexes defines the integral adic nearby/vanishing complex by the imported derived adic realization. Tensoring with Q_l gives the rational functors and their inertia-equivariant specialization triangle. This is the realization of the finite-level LPV carrier, not a separate nearby-cycle definition.

**Hypotheses.**

- ℓ invertible; finite-level constructibility and uniform amplitude; derived-complete compatible systems

**Construction or proof.**

1. Apply finite-level coefficient comparison to the transition maps.
2. Import the adic completion/realization equivalence and the required derived inverse-limit control.
3. Rationalize the triangle and its Galois action; keep integral Tor and inverse-limit issues visible.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/coefficient-and-trait-change`, `EnhancedDerivedSheaves:E4`, `EtaleDualityAndPerverseSheaves:EDC.6`, `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`.

**Acceptance.**

- The nodal vanishing stalk realizes to Z_l(−1) in degree one.
- A non-flat finite-level system is not realized by an unqualified ordinary inverse limit.

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), §4.4, extension to adic coefficients. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Comparison. Scheme and adic nearby cycles over a trait

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.schemeAdicNearbyComparison`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.0/scheme-adic-trait-comparison`.

For the finite-type trait situation admitting Huber’s formal-completion comparison, compare the scheme functor ī*Rj̄* with the adic generic-fibre nearby-cycle functor at finite torsion level, then at derived adic and rational levels. The comparison must commute with specialization and the action of each inertia element. The identification is an input to ClassicalAdicEtaleCohomology H1 and R19.2; it does not assert a comparison for arbitrary analytic spaces.

**Hypotheses.**

- Huber finite-type/formal-completion hypotheses; ℓ invertible; compatible geometric generic points
- The precise admissibility and inertia-equivariance proof is supplier request and gap G-adic-comparison

**Construction or proof.**

1. Factor the comparison through formal completion and Huber’s generic-fibre morphism of étale sites.
2. Identify both functors on strict-local geometric tubes.
3. Check the action induced by the same geometric automorphism before passing to inverse limits; this coherence remains an explicit proof obligation.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/geometric-fibre-site-morphisms`, `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization`, `EtaleDualityAndPerverseSheaves:EDC.6`.

**Acceptance.**

- The algebraic nodal tube and its admissible adic counterpart have the same rank-one vanishing stalk and Tate twist.
- The comparison square intertwines σ for every inertia element, not only its underlying nonequivariant cohomology.

**Sources.**

- [Ana Caraiani and Peter Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://people.mpim-bonn.mpg.de/scholze/Noncompact.pdf), §4.6, p. 63, Huber comparison used in finite-level semiperversity. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

## LPV.1 — Inertia, variation and the monodromy operator

Build variation from the specialization cone and obtain the canonical twisted monodromy operator after proving unipotence on an open inertia subgroup. The finite logarithm is a polynomial in T−1; the arithmetic tame character and Galois/Weil–Deligne carriers are imported. Fix the lower-weight primitive convention: P_i is the kernel of N:Gr_i→Gr_(i−2), with i≤0 at center zero. N is strict for its monodromy filtration. A general map commuting with N need not be strict. Relative filtrations are unique when they exist; their weight-dependent existence belongs to DeligneWeightsAndPurity.

The two-component semistable calculation belongs to this prefix. For D₁∪D₂ meeting along C, its three graded objects are Λ_C[−1](−1), Λ_D₁⊕Λ_D₂ and Λ_C[−1]. The monodromy between the outer grades is the identity with its Tate twist and N²=0. The filtered total complex resolves the geometric nearby complex K; it is not the inertia-cohomology complex L. This calculation supplies the algebraic Picard–Lefschetz proof without using LPV.7.

Maximal nilpotence means a single nonzero Jordan block, including the dimension-one zero operator and excluding the zero space. Semisimple trace is an alternating Frobenius trace on finite-inertia graded invariants, independent of an admissible refinement. It can differ from the trace on the invariants of the ungraded unipotent representation.

**Stage:** `LefschetzPencilsAndVanishingCycles:LPV.1`.

**Planets:** Monodromy logarithm; Geometric local monodromy; Monodromy filtration; Relative monodromy filtration; Maximal unipotence; Two-component monodromy complex.

### Theorem. Canonical and normalized variation maps

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.normalizedCanVar`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.1/normalized-can-var`.

For the geometric nearby/vanishing triangle, can:RΨK→RΦK and Var(σ):RΦK→RΨK satisfy Var(σ)can=σ−1 and can Var(σ)=σ−1 on their respective objects. For the unipotent part with rational ℓ-adic coefficients, normalized var:RΦK→RΨK(−1) and N:RΨK→RΨK(−1) satisfy var can=N and can(−1)var=N_Φ. The same normalization is used after choosing a generator of Z_l(1); it is independent of that choice as a twisted map.

**Hypotheses.**

- Derived geometric functors; unipotent part for normalized var; rational coefficients
- A finite logarithm is taken only after unipotence is proved

**Construction or proof.**

1. Use the two XIII 1.4 composition identities for Var(σ).
2. On a unipotent action form log(T), and multiply Var by the finite polynomial log(T)/(T−1), whose constant coefficient is one.
3. Undo the trivialization of Z_l(1) to obtain the twisted maps and both compositions.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`, `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization`, `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm`, `ArithmeticGaloisRepresentations:R01.2`, `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`.

**Acceptance.**

- For T=1+U and U²=0, var agrees with Var divided by the chosen tame parameter.
- Both compositions are checked; interchanging Ψ and Φ gives a wrong source/target.

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), §§1.2 and 3.5–3.6, normalized monodromy and variation. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Construction. Finite logarithm of unipotent monodromy

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm`.

For a unipotent automorphism T of a finite-dimensional characteristic-zero vector space and (T−1)^d=0, log T is the finite sum Σ_{1≤j<d}(-1)^(j+1)(T−1)^j/j. It is independent of the chosen valid d, nilpotent, and inverse to the pinned nilpotent exponential. For an inertia action factoring through t_l on an open subgroup, these logarithms give the canonical twisted N:V→V(−1).

**Hypotheses.**

- Characteristic-zero coefficient field; finite dimension
- Unipotence is an input, not deduced from an arbitrary inertia action

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog` (constructor) — The explicit finite polynomial log(1+U) in Module.End.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_bound_independent` (compatibility) — If U^d=U^e=0, the sums using d and e are equal.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_nilpotent` (structure) — The finite logarithm is nilpotent.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_exp` (relation) — exp(log T)=T, using IsNilpotent.exp.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_twisted` (compatibility) — log ρ(σ)=t_l(σ)N; changing the Tate generator changes the scalar matrix but not N:V→V(−1).

**Uses.**

- `LPV.1 can/var and monodromy filtration` — Turns tame unipotent inertia into a canonical nilpotent twisted operator.
- `LPV.5 compact-image proof` — Identifies the actual rank-one logarithms inside the ℓ-adic analytic Lie algebra.

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_zero` (degenerate) — log 1=0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_square_zero` (computation) — If U²=0 then log(1+U)=U.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_three_block` (computation) — For U=E₀₁+E₁₂ on Q³, log(1+U)=U−U²/2.
- `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_not_reflection` (non-example) — The involution −1 on Q is not unipotent, so the finite nilpotent logarithm hypothesis fails.

**Construction or proof.**

1. Define the finite polynomial using the actual Module.End algebra.
2. Use formal polynomial identities modulo X^d for bound independence, nilpotence and the log/exp inverse.
3. Use the imported tame character and unipotence to identify log ρ(σ)=t_l(σ)N.

**Direct dependencies:** `tauceti:LinearMap.GeneralLinearGroup.IsUnipotent`, `mathlib:IsNilpotent.exp`, `tauceti:TauCeti.exp_smul_eq_sum_smul_dividedPower`, `ArithmeticGaloisRepresentations:R01.2`, `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`.

**Acceptance.**

- For a square-zero rank-one U, log(1+U)=U.
- For a three-step Jordan block, log(1+U)=U−U²/2.
- No logarithm is defined by this polynomial for an automorphism with eigenvalue −1.

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), §1.2, pp. 11–13, formula (1.2.1). The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Geometric local monodromy theorem

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.geometricQuasiUnipotence`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.1/geometric-quasi-unipotence`.

For ℓ different from the residue characteristic and a finite-type family over a henselian discretely valued field in the geometric local-monodromy setting, inertia acts quasi-unipotently on its finite-dimensional rational ℓ-adic geometric cohomology with constant Q_l coefficients (with compact supports as well). After a finite extension the action is unipotent and factors through the ℓ-primary tame character. An arbitrary continuous representation of the inertia of an algebraically closed-residue field is not asserted quasi-unipotent by a formal group-theoretic argument.

**Hypotheses.**

- Geometric cohomology of a finite-type family; finite-dimensional Q_l realization; ℓ invertible
- The hypotheses of the geometric theorem in Illusie 1.4; excellent trait in the nearby-cycle realization
- An arbitrary inertia representation needs the distinct arithmetic residue-field hypothesis of the representation-theoretic theorem

**Construction or proof.**

1. Apply the geometric local monodromy theorem recalled in Illusie 1.4, whose proof is requested from the arithmetic/local-monodromy supplier.
2. Pass to a finite extension killing the finite semisimple inertia part.
3. Use the structure of tame inertia and the vanishing of a finite-order unipotent action in characteristic zero to remove wild inertia.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude`, `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization`, `ArithmeticGaloisRepresentations:R01.2`.

**Acceptance.**

- A quadratic reflection becomes unipotent after the quadratic extension, with N=0.
- A character of tame inertia with infinite semisimple image is not used as a geometric counterexample to the theorem.

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), §§1.2–1.4, geometric theorem (1.4). The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Monodromy after a ramified extension

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyRamificationRescaling`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.1/finite-extension-and-logarithm-rescaling`.

For a finite extension of henselian discretely valued fields of ramification index e, restrict the inertia representation and transport Tate twists. On a common unipotent open subgroup the normalized monodromy satisfies N′=eN relative to the respective uniformizer-normalized tame characters. Thus log nilpotency index, monodromy filtration and primitive dimensions are unchanged for e≠0 in the rational coefficient field.

**Hypotheses.**

- Finite extension; rational characteristic-zero coefficients; common unipotent subgroup
- Integral assertions do not cancel e when e is divisible by ℓ

**Construction or proof.**

1. Use the Kummer formula t_l|I′=e t_l′ from R01.2.
2. Compare exp(t_l N) and exp(t_l′N′), then apply the finite logarithm.
3. Use nonzero scalar invariance of the monodromy filtration and its primitive kernels.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm`, `LefschetzPencilsAndVanishingCycles:LPV.0/coefficient-and-trait-change`, `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration`, `ArithmeticGaloisRepresentations:R01.2`.

**Acceptance.**

- For a nodal curve under t=u^e the rank-one logarithm is multiplied by e.
- For a killed reflection N=N′=0.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 1.6.14 and 1.7.2, pp. 169–172. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Construction. Monodromy filtration centered at an integer

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration`.

For nilpotent N on a finite-dimensional vector space, define the unique finite increasing filtration M centered at c with N M_i⊂M_(i−2) and N^r:Gr_(c+r)^M V≅Gr_(c−r)^M V (with twist −r when N is a twisted map). One concrete center-zero formula is M_k=Σ_{a,b≥0,a−b=k}(ker N^(a+1)∩im N^b). For N=0, M_(c−1)=0 and M_c=V. Primitive parts use Deligne’s lower-weight convention P_i=ker(N:Gr_i→Gr_(i−2)), zero for i>c.

**Hypotheses.**

- Finite-dimensional field module; nilpotent N; integer center c
- For equivariant twisted N, all graded powers retain their Tate twists

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration` (constructor) — The finite increasing kernel-image filtration M indexed by Z and centered at c.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_mono` (structure) — M_i≤M_j for i≤j, with a finite lower and upper bound.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_lowering` (relation) — N(M_i)⊂M_(i−2).
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyGradedPower` (data) — The induced map N^r from Gr_(c+r) to Gr_(c−r), with twist −r.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyGradedPower_bijective` (characterisation) — Each opposite graded-power map is bijective.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_scalar` (compatibility) — M(aN,c)=M(N,c) for a≠0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.primitivePart` (projection) — P_i is the kernel of the induced graded N, using the lower-weight convention.

**Uses.**

- `LPV.1 primitive and relative-filtration interfaces` — Provides the center, graded powers and generator-independent filtration.
- `LPV.7 semistable curves and Liu et al. §5.9` — Supplies linear monodromy conventions; no weight spectral sequence is planned here.
- `Kisin–Pappas §4.7.1` — Makes inertia finite on graded pieces for semisimple traces.

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_zero` (degenerate) — For N=0 the filtration is 0 below c and V at and above c.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_two_block` (computation) — For N(e₁)=e₀ on Q² centered at zero, M_−2=0, M_−1=M_0=Qe₀ and M_1=V.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_three_block` (computation) — For N(e₂)=e₁, N(e₁)=e₀, the weights are −2,0,2 and Gr_−1=Gr_1=0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_not_kernel_filtration` (non-example) — For a two-block, ker N is M_−1, and M_0 is still ker N, whereas ker N² is V.

**Construction or proof.**

1. Construct by induction on a nilpotence bound, using ker N^d/im N^d, or the displayed kernel-image formula.
2. Check N lowers by two and induces the opposite graded isomorphisms.
3. Prove uniqueness by the same extreme graded pieces and induction; use scalar invariance to remove a Tate generator choice.

**Direct dependencies:** `mathlib:Submodule.span`, `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm`, `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`.

**Acceptance.**

- A size-three Jordan block has weights c−2,c,c+2.
- A size-two block has weights c−1,c+1, so the filtration is not the kernel-power filtration.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 1.6.1–7 and 1.6.14, pp. 165–170. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Primitive decomposition and strictness of N

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.primitiveDecomposition`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.1/primitive-decomposition-and-strictness`.

For the center-zero monodromy filtration, N:(V,M)→(V,M shifted by two) is strict: N(M_(i+2))=im N∩M_i. Consequently Gr_i(ker N)≅P_i. Every Gr_i V is the direct sum of the lower primitive pieces P_−j with j≥|i| and j≡i mod 2, via the appropriate powers of N; on a length-(d+1) Jordan block the successive weights are d,d−2,…,−d. In characteristic zero the associated graded has the canonical SL₂ action whose lowering operator is N.

**Hypotheses.**

- Nilpotent N and finite-dimensional vector space; characteristic zero only for SL₂
- Strictness here is for N and for isomorphisms commuting with N; arbitrary commuting morphisms are not asserted strict

**Construction or proof.**

1. Apply the opposite-graded isomorphisms to split a graded piece into its primitive kernel and the next N image.
2. Iterate to obtain the decomposition and deduce strictness by graded surjectivity/injectivity.
3. Use Jordan blocks for the explicit weights.
4. Import Jacobson–Morozov and characteristic-zero SL₂ semisimplicity for the SL₂ interpretation, rather than re-plan them.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`.

**Acceptance.**

- A size-three block contributes a one-dimensional P_−2 and no other primitive part.
- For a commuting map from a trivial one-dimensional module into ker N of a two-block, strictness fails at index −1; the theorem does not assert it.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 1.6.3–8 and 1.6.10–11, pp. 165–168. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Tensor, dual and symmetric monodromy filtrations

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyTensorDual`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.1/tensor-dual-and-symmetric-monodromy`.

In characteristic zero, for N=N₁⊗1+1⊗N₂, the monodromy filtration is the convolution M_i=Σ_(a+b=i)M_a(V₁)⊗M_b(V₂), with centers added. For the dual operator −Nᵗ, M_i(V*)=ann M_(−i−1)(V) at center zero. The associated graded and primitive decomposition commute with these operations, with the Tate twists attached to powers of N. Sym^d of the standard two-block is the length-(d+1) block with weights −d,−d+2,…,d.

**Hypotheses.**

- Finite dimension; characteristic zero for tensor and symmetric-power assertions
- Dual uses −Nᵗ and the reflected filtration indices

**Construction or proof.**

1. Use the SL₂ weight decomposition and the tensor/dual rules of the supplier.
2. Apply uniqueness of the monodromy filtration.
3. Use Clebsch–Gordan to identify primitive multiplicities and symmetric-power blocks.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.1/primitive-decomposition-and-strictness`, `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`.

**Acceptance.**

- Two size-two blocks tensor to a size-three block plus a size-one block.
- The dual of a size-two block has the same weights −1,1 with operator −Nᵗ.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 1.6.9–12 and 1.6.14, pp. 167–170. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Relative monodromy filtration: uniqueness

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.relativeMonodromyUnique`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.1/relative-monodromy-uniqueness`.

Given a finite increasing filtration W and nilpotent N preserving W, at most one finite increasing M satisfies N M_i⊂M_(i−2) and N^r:Gr_(w+r)^M Gr_w^W V≅Gr_(w−r)^M Gr_w^W V for every w and r≥0. Existence is an additional hypothesis; scaling N by a nonzero scalar does not change M. The corresponding graded maps have twist −r for twisted monodromy.

**Hypotheses.**

- Finite filtrations; nilpotent N preserving W
- No unconditional existence conclusion

**Construction or proof.**

1. Induct on the length of W using the source’s three identities determining M from W’s last graded quotient and the previous subobject.
2. Apply the center-w uniqueness theorem on each Gr_w^W.
3. Check the defining conditions are invariant under nonzero scaling.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration`, `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`.

**Acceptance.**

- For W pure of weight w the relative filtration is the ordinary filtration centered at w.
- For N(e₁)=e₀, W_0=Qe₀ and W_1=Q², no relative M exists: the prescribed graded centers force N M_1⊂M_−1=0, contradicting N≠0.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 1.6.13–14, pp. 168–170. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Tame restriction along a normal-crossings divisor

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.normalCrossingsTameRestriction`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.1/normal-crossings-tame-restriction`.

For a regular scheme with strict normal-crossings divisor D=∪D_a and a lisse rational ℓ-adic sheaf on its complement, tame unipotent local inertia gives commuting twisted residues N_a on the tame restriction to each stratum. The restriction is constructed using compatible Kummer covers and is independent of their cofinal choice. Relative filtrations along a stratum are unique when they exist. Existence and purity under mixedness are requested from DeligneWeightsAndPurity; they are not consequences of the linear algebra alone.

**Hypotheses.**

- Strict normal crossings; ℓ invertible; tame and unipotent local monodromy after the specified cover
- The relative-filtration existence result needs the weight hypotheses of Weil II 1.9.1

**Construction or proof.**

1. Import Kummer tame covers/Abhyankar and take the compatible restriction system.
2. Identify the commuting tame factors and apply finite logarithms to obtain N_a.
3. Apply relative uniqueness to compare orders of restrictions whenever the required filtrations exist.
4. Route Weil II 1.9’s mixedness/purity argument to the weight supplier.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm`, `LefschetzPencilsAndVanishingCycles:LPV.1/relative-monodromy-uniqueness`, `ArithmeticGaloisRepresentations:R01.2`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `DeligneWeightsAndPurity:DWP.1`.

**Acceptance.**

- On a two-component coordinate divisor the two residues commute.
- A wild local system is not assigned a tame Kummer restriction by this theorem.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 1.9.1–6, pp. 176–178. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Definition. Maximal unipotence and maximal nilpotence

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.IsMaximallyNilpotent`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.1/maximal-unipotence`.

On a nonzero n-dimensional characteristic-zero vector space, T is maximally unipotent when its minimal polynomial is (X−1)^n, and N is maximally nilpotent when its minimal polynomial is X^n. For N=log T these are equivalent to a single size-n Jordan block and dim ker N^j=min(j,n). The zero-dimensional case is excluded from the adjective; it is not silently a size-zero Jordan block.

**Hypotheses.**

- Finite-dimensional characteristic-zero vector space; n>0
- T unipotent for the equivalence with log

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.IsMaximallyNilpotent` (characterisation) — For dim V=n>0, N^n=0 and N^(n−1)≠0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.IsMaximallyUnipotent` (characterisation) — T is unipotent and T−1 is maximally nilpotent; equivalent to minpoly T=(X−1)^n.
- `TauCeti.AlgebraicGeometry.VanishingCycles.maximalLog_iff` (equivalence) — Maximal unipotence of T is equivalent to maximal nilpotence of log T.
- `TauCeti.AlgebraicGeometry.VanishingCycles.maximalNilpotent_kernel_rank` (relation) — dim ker N^j=min(j,n).

**Uses.**

- `Qian, published Definition 3.6` — Exports the minimal-polynomial and kernel-rank tests without the unrelated automorphy proof.
- `LPV.1 monodromy filtration` — Recognizes the single primitive block and its extremal weights.

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_three_block` (computation) — The size-three Jordan block is maximally nilpotent.
- `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_not_two_plus_one` (non-example) — A size-two Jordan block plus a trivial line in dimension three is not maximally nilpotent.
- `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_one_dimension` (degenerate) — The zero endomorphism of a one-dimensional space is maximally nilpotent; the identity is maximally unipotent.
- `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_zero_dimension_excluded` (non-example) — The zero-dimensional vector space does not satisfy the nonzero-dimension definition.

**Construction or proof.**

1. Use the existing unipotent predicate and minimal-polynomial API; define the maximal nilpotency-index condition.
2. Use Jordan block decomposition to identify the minimal polynomial and kernel dimensions.
3. Compare log(1+U)=U times a polynomial with invertible constant coefficient, so all kernel powers have the same dimensions.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm`, `tauceti:LinearMap.GeneralLinearGroup.IsUnipotent`, `LefschetzPencilsAndVanishingCycles:LPV.1/primitive-decomposition-and-strictness`.

**Acceptance.**

- A three-block is maximal, while a direct sum of a two-block and a trivial line is not.

**Sources.**

- [Lie Qian, Potential automorphy for GL_n](https://par.nsf.gov/servlets/purl/10388233), Published Definition 3.6. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Construction. Semisimple trace on finite-inertia graded pieces

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.1/semisimple-nearby-trace`.

For a bounded finite-dimensional Weil complex with quasi-unipotent inertia, choose an inertia-stable finite filtration with finite inertia image on each graded piece. Its semisimple Frobenius trace is Σ_i,j(-1)^i Tr(Frob;(Gr_j H^i)^I). It is independent of the finite-inertia filtration, additive in equivariant distinguished triangles, and unchanged by the allowed choice of Frobenius lift. It generally differs from the trace on H^i(K)^I, since taking invariants before removing unipotent extensions is not exact.

**Hypotheses.**

- Finite-dimensional rational ℓ-adic Weil modules; inertia finite on graded pieces
- The Frobenius endomorphism normalizes inertia; finite-group averaging uses characteristic zero

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace` (constructor) — Alternating sum of Frobenius traces on the inertia invariants of finite-inertia graded cohomology.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_refinement` (compatibility) — The trace is unchanged under a finite common refinement.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_additive` (relation) — For an equivariant distinguished triangle, trace B=trace A+trace C.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_frobeniusLift` (compatibility) — Changing Frobenius by an inertia element leaves the semisimple trace unchanged.

**Uses.**

- `Kisin–Pappas §4.7.1` — Supplies the semisimple trace of the already-defined nearby-cycle stalk; the local-model trace formula remains with its owner.
- `IgusaVarietiesAndTorsionConcentration IG.5` — Provides the rational trace interface without asserting that torsion invariants are exact.

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_trivial` (computation) — For a degree-zero trivial inertia line with Frobenius a, the semisimple trace is a.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_unipotent_block` (non-example) — For a two-block with compatible graded Frobenius eigenvalues a and qa, the semisimple trace is a+qa, while the trace on inertia invariants is only the eigenvalue of ker N.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_quadratic` (computation) — For a nontrivial quadratic finite inertia line, the semisimple trace is 0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_shift` (compatibility) — Shifting a complex by one negates its semisimple trace.

**Construction or proof.**

1. Use geometric quasi-unipotence and the monodromy filtration to obtain finite inertia on graded pieces.
2. Compute each invariant graded trace using the projector averaging over its finite inertia image.
3. Prove filtration independence by a common refinement and exactness of finite-group invariants.
4. Apply finite-dimensional trace additivity to triangle cohomology; import the generic trace and adic realization suppliers.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.1/geometric-quasi-unipotence`, `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration`, `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`, `ArithmeticGaloisRepresentations:R01.2`.

**Acceptance.**

- A trivial one-dimensional inertia module gives its ordinary Frobenius trace.
- For a nontrivial two-dimensional unipotent inertia block with compatible Frobenius eigenvalues a and qa on the two finite-inertia grades, the semisimple trace is a+qa; the trace on inertia invariants is just the eigenvalue on ker N. The Frobenius normalization fixes the direction of q-rescaling.
- A finite quadratic character has invariant trace zero.

**Sources.**

- [Mark Kisin and George Pappas, Integral models of Shimura varieties with parahoric level structure](https://www.numdam.org/article/PMIHES_2018__128__121_0.pdf), §4.7.1, p. 212, semisimple trace of RΨ. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Construction. Two-component semistable nearby-cycle complex

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.1/two-component-semistable-nearby-complex`.

Let a regular strictly semistable scheme over a strictly henselian trait have special fibre D₁∪D₂, with smooth transverse components and intersection C. The early filtered Rapoport–Zink nearby-cycle complex has graded objects gr₁=Λ_C[−1](−1), gr₀=Λ_D₁⊕Λ_D₂, gr_−1=Λ_C[−1], and other grades zero; the boundary maps are alternating restrictions and Gysin maps. N:gr₁→gr_−1(−1) is the identity on Λ_C[−1](−1), and N²=0 in the filtered derived calculation. The corrected simple complex resolves K=RΨΛ, not the inertia-cohomology cone L. Its inertia action can be trivial on cohomology sheaves while N on the derived object is nonzero.

**Hypotheses.**

- Strictly semistable regular total space over a strictly henselian trait; precisely two transverse components
- Λ finite with ℓ invertible, or rational ℓ-adic after realization
- Only this filtered two-component calculation is claimed here; the general weight spectral sequence belongs to LPV.7

**API.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex` (constructor) — The filtered nearby complex on D₁∪D₂, with actual restriction/Gysin differentials.
- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex_grades` (data) — The three graded objects are Λ_C[−1](−1), Λ_D₁⊕Λ_D₂ and Λ_C[−1].
- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex_monodromy` (relation) — N on the outer grades is the identity after the Tate twist, and N²=0.
- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex_resolves` (compatibility) — The corrected total complex is quasi-isomorphic to the geometric nearby complex K, not to L=RΓ(I,K).

**Uses.**

- `LPV.2 algebraic Picard–Lefschetz` — Provides the semistable N calculation before LPV.2, removing the cycle through LPV.7.
- `RT-AREA-etale/18 and Illusie 2002 erratum` — Fixes the proof route and the corrected local concentration range.

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_node` (computation) — For xy=π, the degree-one nearby stalk is Λ(−1).
- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_disjoint` (degenerate) — If C is empty then N=0 and only the center-zero grade remains.
- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_not_sheaf_split` (non-example) — For the nodal local model the cohomology-sheaf inertia action is trivial, but the derived N map on the two outer grades is an isomorphism.
- `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_N_square` (characterisation) — The filtered two-component operator has N²=0 and gr₁N equal to identity onto gr_−1(−1).

**Construction or proof.**

1. Import the coherent filtered-derived construction and absolute purity for regular trait pairs.
2. Build the two-row restriction/Gysin double complex from the intersections, with the 1994 erratum’s 1−T upper differential.
3. Use the corrected filtered quasi-isomorphism sA≅K and compute the three nonzero grades.
4. Read N as the identity shift of the double complex; its second iterate is zero because there are only two components.
5. For rational coefficients identify inertia with exp(t_l N); finite coefficients in this two-step case use T−1 directly, without denominators.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `EnhancedDerivedSheaves:E0`, `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`, `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`, `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`, `ArithmeticGaloisRepresentations:R01.2`, `EtaleDualityAndPerverseSheaves:EDC.3`.

**Acceptance.**

- For xy=π the intersection term is a point, R¹Ψ=Λ(−1), and the sheaf-level inertia action is trivial.
- With C empty all off-center grades vanish and N=0.
- A nonzero derived N in the nodal case prevents replacing the filtered complex by the direct sum of its cohomology sheaves.

**Sources.**

- [Luc Illusie, Grothendieck and vanishing cycles](https://www.numdam.org/article/AFST_2021_6_30_1_83_0.pdf), §6.3, pp. 104–105, formulas (6.2)–(6.4). The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Twisted monodromy and Frobenius equivariance

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.twistedMonodromyEquivariance`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.1/twisted-monodromy-equivariance`.

The canonical N:V→V(−1) is equivariant for the trait Galois action. After trivializing the Tate line and using geometric Frobenius over F_q, this reads NF=qFN. For σ in the chosen unipotent inertia subgroup, ρ(σ)=exp(t_l(σ)N). Changing a Tate generator by a unit rescales the displayed scalar N inversely and leaves the twisted map unchanged.

**Hypotheses.**

- Finite-dimensional rational ℓ-adic geometric representation; a unipotent open inertia subgroup
- Geometric Frobenius convention; Frob acts by q on Q_l(−1)

**Construction or proof.**

1. Use finite log/exp and the tame character conjugation rule from R01.2.
2. Interpret the scalar logarithm as a map into the inverse Tate line.
3. Apply Galois equivariance to geometric Frobenius and write the resulting q relation.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm`, `LefschetzPencilsAndVanishingCycles:LPV.1/geometric-quasi-unipotence`, `ArithmeticGaloisRepresentations:R01.2`, `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`.

**Acceptance.**

- For a two-block with F eigenvalues a on ker N and qa on the quotient, NF=qFN.
- Arithmetic Frobenius would invert q; the convention is fixed explicitly.

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), §1.2, formula (1.2.1) and Frobenius relation. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

## LPV.2 — Ordinary quadratic singularities and Picard–Lefschetz

Ordinarity is a geometric property of the quadratic hypersurface. In characteristic two and odd vector-space rank, the polar kernel is a line on which Q is nonzero; polar nondegeneracy would discard the ordinary double point. The even Clifford centre supplies the separable discriminant cover and the quadratic inertia character. Distinguish generatrix classes, their primitive difference, the primitive quotient, and the compact-support generator.

The local route runs through henselian quadratic normal forms, cone and punctured-cone cohomology, restriction/Gysin signs and the standard quadratic degeneration. General Artin/Elkik approximation is imported; these nodes are its quadratic applications. The odd formula uses the root of the actual parameter b, with ε_b=v(b)t_ℓ rationally. The early two-component complex gives its algebraic route in positive characteristic. Complex comparison verifies the cup/trace and orientation conventions. For even dimension in characteristic two retain the possibly wild separable quadratic character rather than substituting a tame one.

For the isolated nonordinary characteristic-two quadratic singularities in the Fresán–Sabbah–Yu application, middle-degree concentration is a distinct theorem. It does not imply a rank-one stalk or an ordinary reflection formula. The n=0 nearby stalk has rank two while its vanishing stalk has rank one.

**Stage:** `LefschetzPencilsAndVanishingCycles:LPV.2`.

**Planets:** Picard–Lefschetz formula; Ordinary quadratic form; Smooth quadric; Cohomology of quadrics; Vanishing cycle of the affine quadric; Ordinary quadratic singularity.

### Theorem. Concentration and rank of the nearby cycles at ordinary quadratic singular points (XV 3.1.1-3.1.2)

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.ordinaryQuadraticPointNearbyCycles312`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2`.

For f:X→S flat of finite type and pure relative dimension n over a henselian trait, assume the special fibre is smooth away from finitely many ordinary quadratic points. Let Σ be those points and E⊂Σ the points near which the generic fibre is smooth. With finite coefficients Λ invertible on S, R^iΦΛ=0 for i≠n and R^nΦΛ is supported exactly on E, where its stalks are free of rank one. The local nearby-cycle stalk and costalk pairing is perfect; at n=0 the nearby-cycle degree-zero stalk has rank two, while the vanishing-cycle stalk has rank one.

**Hypotheses.**

- f flat of finite type, pure relative dimension n; special-fibre singularities ordinary quadratic
- Λ finite torsion invertible on S
- E is the smooth-generic subset of the singular locus; persistent cone singularities are excluded from its support

**Construction or proof.**

1. Apply the henselian local equation and the standard degeneration calculation.
2. Smooth local acyclicity removes the smooth locus; the persistent-cone case removes Σ−E.
3. Apply the affine-quadric compact-support duality calculation, keeping Ψ distinct from Φ in degree zero.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point`, `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics`, `LefschetzPencilsAndVanishingCycles:LPV.2/standard-quadratic-degeneration`, `LefschetzPencilsAndVanishingCycles:LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration`.

**Acceptance.**

- Outside E (points where the generic fibre is not smooth nearby) the vanishing cycles vanish (2.2.4).
- For n = 0 the rank is 2 (two points degenerating to one).

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Proposition 3.1.2, p. 24. The full printed statement, read from a 300 dpi rendering of the page image (the OCR of this scan renders 'nul' as 'seul' and loses the Phi/psi distinction). Note that the source's Sigma is this packet's E, and that part (iii) is about psi, not Phi. (part 1 of 2 of the passage)
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Proposition 3.1.2, p. 24. The full printed statement, read from a 300 dpi rendering of the page image (the OCR of this scan renders 'nul' as 'seul' and loses the Phi/psi distinction). Note that the source's Sigma is this packet's E, and that part (iii) is about psi, not Phi. (part 2 of 2 of the passage)
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, proof of 3.1.2, p. 24. Reduction to the standard model.

### Theorem. Even relative dimension n = 2m: the natural generator ±δ of H^n_{x}(R^nΦ(A(m))), the quadratic character ε_x of inertia and Var(σ)(a) = (−1)^m (ε_x(σ) − 1)/2 · (a,δ)δ (XV 3.2.1-3.2.3)

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.evenRelativeDimensionVariation32`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2`.

Notation of 3.1 with n = 2m, S strictly henselian (general case by descent). Proposition 3.2.1: (i) for x ∈ E the group H^n_{x}(R^n Psi_eta(A(m))) (the source writes psi_eta here, not Phi) has a natural generator δ, well defined up to sign, characterised by naturality in A and (δ,δ) = (−1)^m·2 (for n = 0 add Tr(δ) = 0); (ii) for a suitable character ε_x: I -> {±1} of the inertia group (independent of A), Var(σ)(a) = (−1)^m ((ε_x(σ) − 1)/2)(a δ) δ for a ∈ R^n Φ_η(A(m)), whence σ(δ) = ε_x(σ) δ. Proof: pass to the universal case A = Z_ℓ; up to sign only one δ satisfies (i); reduce as in 3.1.2 to 2.2.5 and apply 2.2.5 (D). Complément 3.2.2: if the henselization of X at x is that of the projective quadric Σ a_ij X_i X_j = 0 at x_0, ε_x is defined by the separable quadratic extension of the fraction field given by the centre of the even Clifford algebra Z(C^+(Q)). 3.2.3: in residue characteristic ≠ 2, I has a unique nontrivial character ε of order 2 (σ(√t) = ε(σ)√t for a uniformizer t); X_(x) is the henselization at 0 of Σ a_ij x_i x_j = b with b in the maximal ideal and Q nondegenerate; the centre of the Clifford algebra is k(η)(√((−1)^{m+1}·2b·det(a_ij))) (Bourbaki Alg. ch. 9 §9 no. 4), so ε_x = ε^{v(b)}: the variation vanishes if v(b) is even and ε_x = ε otherwise.

**Hypotheses.**

- n = 2m even; S strictly henselian; x ∈ E
- 3.2.3 requires residue characteristic ≠ 2 and uses the Clifford-algebra description; the characteristic-2 case is only covered by 3.2.2's Clifford-centre description
- NOTATION as in the 3.1.2 node: the source's Sigma is this packet's E. Part (i) of 3.2.1 is about R^n psi_eta and part (ii) about R^n Phi_eta; the two are genuinely different functors and the source uses both on the same page.

**Construction or proof.**

1. Universal case A = Z_ℓ and uniqueness of δ up to sign.
2. Reduction to the standard quadric and 2.2.5(D).
3. Clifford-algebra computation of ε_x.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2`, `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`, `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics`, `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric`, `LefschetzPencilsAndVanishingCycles:LPV.2/variation-in-a-standard-quadratic-degeneration`.

**Acceptance.**

- For v(b) even the local monodromy is trivial in even relative dimension; for v(b) odd it is the reflection σ(δ) = −δ (when ε_x(σ) = −1).
- Sign convention: (δ,δ) = (−1)^m·2 fixes δ up to sign; the n mod 4 sign table of the stage must be checked against this normalisation.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Proposition 3.2.1, pp. 24-25. The full printed statement, read from 300 dpi and 200 dpi renderings of printed pages 24-25. Part (i) uses psi_eta and part (ii) uses Phi_eta; the source's 'x in Sigma' is this packet's 'x in E'. (part 1 of 2 of the passage)
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Proposition 3.2.1, pp. 24-25. The full printed statement, read from 300 dpi and 200 dpi renderings of printed pages 24-25. Part (i) uses psi_eta and part (ii) uses Phi_eta; the source's 'x in Sigma' is this packet's 'x in E'. (part 2 of 2 of the passage)
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 3.2.3, pp. 25-26. Explicit character in residue characteristic ≠ 2.

### Theorem. Odd relative dimension n = 2m+1: the character c_b, the vanishing cycle ±δ_x from the primitive quotient of the tangent quadric, and the Picard-Lefschetz formulas Var(σ)(a) = (−1)^{m+1} c_{b(x)}(σ)(aδ)δ and σ(a) = a + (−1)^{m+1} c_{b(x)}(σ)(aδ_x)δ_x (XV 3.3.1-3.3.6)

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.oddRelativeDimensionPicardLefschetz33`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3`.

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

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.1/two-component-semistable-nearby-complex`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point`, `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-description-of-the-vanishing-cycle`, `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `ArithmeticGaloisRepresentations:R01.2`, `EtaleDualityAndPerverseSheaves:EDC.3`.

**Acceptance.**

- The formula has the sign (−1)^{m+1} and the twist A(m); the quadratic character is replaced by the Kummer character c_b of −b.
- The 'δ = 0' case of the stage (exceptional skyscraper in degree n+1) is not in the read part; 3.1.2(ii) shows R^nΦ vanishes outside E.

**Sources.**

- [Luc Illusie, Grothendieck and vanishing cycles](https://www.numdam.org/article/AFST_2021_6_30_1_83_0.pdf), §6.1, pp. 103–104; §6.3, pp. 104–105. The author describes the algebraic proof through the two-component Rapoport–Zink calculation; original proof interior is not claimed read.
- [Luc Illusie, Erratum to Sur la formule de Picard–Lefschetz](https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrPL.pdf), p. 251 line 18 of the 2002 paper. Corrected concentration bound used in the local calculation.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), XV 3.3.2–6, pp. 26–30. The original formula, coefficient character and quadric normalization; its transcendental proof is not used as the algebraic proof.

### Theorem. The specialisation sequence of a proper family with one ordinary quadratic point

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.lefschetzDegenerationSpecializationSequence`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence`.

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

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2`, `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2`, `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`, `LefschetzPencilsAndVanishingCycles:LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration`, `LefschetzPencilsAndVanishingCycles:LPV.2/variation-in-a-standard-quadratic-degeneration`.

**Acceptance.**

- n = 1, a curve of genus g acquiring one node: if the node is nonseparating, δ ≠ 0, the middle map is onto, dim H^1(X_s) = 2g − 1 and H^2(X_s) ≅ H^2(X_η̄); if it separates, δ = 0, H^1(X_s) ≅ H^1(X_η̄) and dim H^2(X_s) = 2.
- n = 0, X = Spec A[y]/(y² − π) with p ≠ 2: X_η̄ is two points, δ = e₁ − e₂ and the sequence is 0 → ℚ_ℓ → ℚ_ℓ² → ℚ_ℓ → 0.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4, (4.2), p. 288. The algebraic setting: a proper family over a henselian trait with one ordinary quadratic point.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4, (4.3), (4.3.1)–(4.3.3), p. 288. The vanishing cycle δ ∈ H^n(X_η̄, ℚ_ℓ)(m), the isomorphisms (4.3.2) and the exact sequence (4.3.3), whose middle map x ↦ Tr(x ∪ δ) was read on the page image.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.13) B), p. 294. The proofs are in SGA 7 XIII–XV.

### Theorem. The Picard–Lefschetz formula for a proper family

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.localPicardLefschetzFormula`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`.

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

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2`, `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3`, `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`, `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`, `ArithmeticGaloisRepresentations:R01.2`, `LefschetzPencilsAndVanishingCycles:LPV.2/variation-in-a-standard-quadratic-degeneration`.

**Acceptance.**

- n = 0, X = Spec A[y]/(y² − π), p ≠ 2: σ with ε(σ) = −1 swaps the two points, and x − (x, δ)δ with δ = e₁ − e₂ sends e₁ to e₂.
- Sign table for n = 0, 1, 2, 3: signs −, −, +, +; (δ, δ) = 2, 0, −2, 0; σδ = −δ for n even when ε(σ) = −1 and σδ = δ for n odd.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4, (4.3) A), p. 288. t_ℓ : I → ℤ_ℓ(1) and σx = x ± t_ℓ(σ)(x, δ)δ for n odd.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4, (4.3) B), p. 289. The even case with the quadratic character ε, p ≠ 2.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4, (4.3), p. 289. The signs are those of the complex table (4.1).
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4, (4.1), p. 287. The complex table of signs, (δ, δ) and Tδ by n mod 4, read on the page image.

### Theorem. The sheaves R^i f_*ℚ_ℓ at a Lefschetz degeneration, including the case δ = 0

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.directImagesAtALefschetzDegeneration`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/direct-images-at-a-lefschetz-degeneration`.

Let S be the spectrum of a henselian discrete valuation ring A with algebraically closed residue field of characteristic p, with generic point η, closed point s and geometric generic point η̄, and let ℓ ≠ p be prime. Let f : X → S be proper with X regular, purely of dimension n + 1, and f smooth except at one ordinary quadratic point x of the special fibre X_s. Write n = 2m or n = 2m + 1. Let j : η → S be the inclusion. (a) If δ ≠ 0: R^i f_*ℚ_ℓ is constant for i ≠ n, and R^n f_*ℚ_ℓ = j_*j^*R^n f_*ℚ_ℓ. (b) If δ = 0, which can happen only for n odd since (δ, δ) = ±2 for n even: R^i f_*ℚ_ℓ is constant for i ≠ n + 1, and there is an exact sequence 0 → ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → j_*j^*R^{n+1} f_*ℚ_ℓ → 0 with j_*j^*R^{n+1} f_*ℚ_ℓ constant, where ℚ_ℓ(m − n)_s is ℚ_ℓ(m − n) on {s} extended by zero.

**Hypotheses.**

- As in the specialisation sequence, with p ≠ 2 when n is even.

**Construction or proof.**

1. A sheaf on S is a triple (G_s̄, G_η̄, φ : G_s̄ → G_η̄^I) (XIII 1.2.2); for R^i f_*ℚ_ℓ it is (H^i(X_s), H^i(X_η̄), sp) by proper base change. It is constant if and only if I acts trivially and sp is an isomorphism, and it equals j_*j^* of itself if and only if sp is an isomorphism onto the invariants.
2. For i ∉ {n, n + 1} both hold by the specialisation sequence and the Picard–Lefschetz formula.
3. δ ≠ 0: by Poincaré duality on X_η̄ some x has (x, δ) ≠ 0, so the middle map of (4.3.3) is onto; hence H^{n+1}(X_s) ≅ H^{n+1}(X_η̄), and I acts trivially there. In degree n, sp is injective with image δ^⊥, and δ^⊥ = H^n(X_η̄)^I because the fixed space of x ↦ x + c(x, δ)δ with c ≠ 0 is δ^⊥ (Mathlib's LinearEquiv.mem_fixedSubmodule_transvection_iff, with t_ℓ onto ℤ_ℓ(1), or ε nontrivial).
4. δ = 0: I acts trivially in every degree, sp is an isomorphism in degree n, and (4.3.3) becomes 0 → ℚ_ℓ(m − n) → H^{n+1}(X_s) → H^{n+1}(X_η̄) → 0, which is the stalk at s̄ of the stated sequence of sheaves.
5. (δ, δ) = (−1)^m·2 ≠ 0 for n even, so δ ≠ 0 there.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`, `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S`, `mathlib:LinearEquiv.mem_fixedSubmodule_transvection_iff`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`.

**Acceptance.**

- δ = 0 is realised by a genus-g curve acquiring a separating node (n = 1): R² f_*ℚ_ℓ has stalk ℚ_ℓ(−1)² at s and ℚ_ℓ(−1) at η̄.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4, (4.4) a), p. 289. Case δ ≠ 0: constancy for i ≠ n and R^n f_* = j_*j^*R^n f_*.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4, (4.4) b), p. 289. Case δ = 0, only for n odd, with the skyscraper sequence in degree n + 1 (read on the page image).

### Definition. Ordinary quadratic forms

**Declaration:** `TauCeti.AlgebraicGeometry.Quadric.IsOrdinary`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`.

Let S = Spec A, V a locally free A-module of rank r and Q a quadratic form on V, with polar form Φ(x, y) = Q(x + y) − Q(x) − Q(y). Q is nowhere zero if the values Q(v) generate the unit ideal; then Q = 0 defines a subscheme of P(V*) (EGA convention), flat and purely of relative dimension r − 2 over S, the quadric of Q. Q is ordinary if it is nowhere zero and its quadric is smooth over S; this can be checked after base change to fields. Over a field: (a) if r is even or the characteristic is not 2, Q is ordinary if and only if Φ is nondegenerate; (b) if r is odd and the characteristic is 2, Q is ordinary if and only if the kernel N of the alternating form Φ has dimension one and Q does not vanish on N. For V ≠ 0 over a field, ordinary is Mathlib's QuadraticMap.Nondegenerate (radical zero and polar kernel of rank at most one), which follows Elman–Karpenko–Merkurjev.

**Hypotheses.**

- The case r = 0 is excluded: the zero form on the zero module is not nowhere zero.
- Condition (b) is for characteristic 2; the source prints card(A) = 2 (source issue E1).

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

**Unit tests.**

- `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_xy_add_sq_char_two` (value) — Characteristic 2, r = 3, Q = xy + z²: ker Φ = k·e_z and Q(e_z) = 1, so Q is ordinary (the conic xy = z² is smooth).
- `TauCeti.AlgebraicGeometry.Quadric.not_isOrdinary_sum_sq_char_two` (non-example) — Characteristic 2, r = 2, Q = x² + y² = (x + y)²: Φ = 0 and the quadric is a double point, so Q is not ordinary.
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_rank_one` (degenerate) — r = 1, Q = ax² with a a unit: the quadric is empty and Q is ordinary in every characteristic.
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_iff_nondegenerate_test` (comparison) — Over a field and for V ≠ 0, IsOrdinary Q agrees with Mathlib's QuadraticMap.Nondegenerate Q: in characteristic 2 the alternating Φ has kernel of dimension ≡ r mod 2, so rank ≤ 1 forces 0 or 1 according to the parity of r.

**Construction or proof.**

1. Smoothness of the quadric is the Jacobian criterion: the quadric is singular at [v] exactly when Q(v) = 0 and Φ(v, ·) = 0, that is, when v is a nonzero vector of the radical.
2. Hence over a field, ordinary means that no nonzero v has Q(v) = 0 and Φ(v, ·) = 0. If 2 ≠ 0 then Q(v) = Φ(v, v)/2, so this is nondegeneracy of Φ.
3. In characteristic 2, Φ is alternating, so dim ker Φ ≡ r mod 2. For r even the condition forces ker Φ = 0; for r odd it forces dim ker Φ = 1 with Q nonzero on it. This is the Mathlib condition (radical ⊥, rank ker Φ ≤ 1).
4. Construct quadratic scalar extension coefficientwise in a local basis and prove basis independence and descent. The pinned quadratic tensor base-change API requires 2 invertible; characteristic two uses this coefficient construction rather than polarization.

**Direct dependencies:** `mathlib:QuadraticMap.Nondegenerate`, `mathlib:QuadraticMap.polarBilin`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:key/henselization`.

**Acceptance.**

- xy + z² in characteristic 2 is ordinary; x² + y² in characteristic 2 is not; ax² is ordinary.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, 1.1, p. 2. The definition. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, 1.1 a), p. 2. The criterion for even rank or characteristic not 2 (XII writes n for the rank). Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, 1.1 b), p. 2. The criterion in characteristic 2 and odd rank. Transcribed from the page image.

### Theorem. Étale-local normal form of an ordinary quadratic form

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.normalFormOfOrdinaryQuadraticForms`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/normal-form-of-ordinary-quadratic-forms`.

Let Q be an ordinary quadratic form on a locally free A-module V of rank r = 2m (resp. r = 2m + 1). Étale locally on Spec A, V has a basis e₁, …, e_r with Q(Σ xᵢeᵢ) = Σ_{i=1}^{m} x_i x_{i+m} (resp. Σ_{i=1}^{m} x_i x_{i+m} + λx²_{2m+1} with λ invertible).

**Hypotheses.**

- The source prints the upper summation limit m − 1 (source issue E2).

**Construction or proof.**

1. Induction on m; m = 0 is clear (r = 1 gives Q = λx², λ a unit because Q is nowhere zero).
2. For m > 0 the quadric is smooth with nonempty geometric fibres, so it has sections étale locally: an e ∈ V nowhere zero with Q(e) = 0.
3. e is nowhere in the kernel of Φ (the quadric is smooth at [e]), so locally there is f′ with Φ(e, f′) = 1; put f = −Q(f′)e + f′, so that Q(e) = Q(f) = 0 and Φ(e, f) = 1.
4. V = V₁ ⊕ V₂ with V₁ = Ae + Af hyperbolic and V₂ = V₁^⊥, on which Q is ordinary of rank r − 2; apply the induction hypothesis to V₂.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:key/henselization`.

**Acceptance.**

- r = 2: Q = x₁x₂; r = 3: Q = x₁x₂ + λx₃², which over a separably closed field of characteristic not 2 is equivalent to x² + y² + z².

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, Proposition 1.2, p. 2. The statement; the formulas are on p. 3. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, proof of 1.2, p. 3. The inductive proof by splitting off a hyperbolic plane. Transcribed from the page image.

### Construction. The discriminant double cover of an even-dimensional quadric

**Declaration:** `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric`.

Let Q be nondegenerate on V locally free of rank 2m > 0 over A. The centre Z(Q) of the even Clifford algebra C⁺(Q) is a finite étale A-algebra of rank 2, and C⁺(Q) is an Azumaya algebra over Z(Q) (XII 1.5); C⁺(Q) depends only on the quadric Q = 0 in P(V*) (XII 1.3). A totally isotropic direct summand W of rank m defines an idempotent e(W) ∈ Z(Q) (XII 1.6–1.7), and over a field e(W₁) = e(W₂) if and only if dim(W₁/W₁ ∩ W₂) is even (XII 1.12). For a smooth quadric X/S of dimension n = 2m > 0 this gives an étale double cover Z(X) → S (Z(X) = X for n = 0), and the generatrices (linear subspaces of dimension m of P(X) inside X) form a smooth projective S-scheme Gén(X) whose Stein factorisation is e : Gén(X) → Z(X) (XII 2.7–2.8).

**Hypotheses.**

- Even rank; for rank 2 in characteristic not 2, Z(Q) is the discriminant algebra.

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

**Unit tests.**

- `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_hyperbolic` (value) — V = Ae ⊕ Af with Q(xe + yf) = xy: C⁺(Q) = Z(Q) ≅ A × A, and the isotropic lines Ae and Af give the two idempotents fe and ef = 1 − fe (XII 1.12, proof).
- `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_discriminant` (value) — Over a field of characteristic not 2, Q = x² − dy²: C⁺(Q) = k ⊕ k·e₁e₂ with (e₁e₂)² = d, so Z(Q) ≅ k[t]/(t² − d), split if and only if d is a square.
- `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_eq_mathlib` (comparison) — C⁺(Q) is Mathlib's CliffordAlgebra.even Q.
- `TauCeti.AlgebraicGeometry.Quadric.lagrangianIdempotent_sum` (characterisation) — For an orthogonal sum, e(W₁ ⊕ W₂) = e(W₁)e(W₂) + (1 − e(W₁))(1 − e(W₂)) (XII 1.10.1): the sections add as ℤ/2-torsors, not as idempotents.

**Construction or proof.**

1. Étale locally Q is split (normal form); for a split decomposition V = W₁ ⊕ W₂ into totally isotropic summands, C(Q) ≅ End(ΛW₁) as ℤ/2-graded algebras, and C⁺(Q) ≅ End(ΛW₁)⁺ × End(ΛW₁)⁻ has centre A × A (XII 1.4).
2. Descent gives Z(Q) étale of rank 2 and C⁺(Q) Azumaya over it (XII 1.5).
3. The idempotent e(W₁, W₂) depends only on W₁ by a connectedness argument on the affine space of complements (XII 1.6), giving e(W).
4. 1.12 reduces by the addition formula (1.10.1) to dim V = 2, where it is the computation e(Ae) = fe, e(Af) = ef.
5. For a smooth quadric, C⁺ of the ambient form descends to C⁺(X) (XII 2.6); its centre is Z(X). Gén(X) is covered by affine spaces of generatrices disjoint from a given one, hence smooth, and its geometric fibres over Z(X) are connected by reduction to P¹ × P¹ (XII 2.8).

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`, `LefschetzPencilsAndVanishingCycles:LPV.2/normal-form-of-ordinary-quadratic-forms`, `mathlib:CliffordAlgebra.even`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:key/henselization`.

**Acceptance.**

- n = 2: X ≅ P¹ × P¹, Gén(X) is two copies of P¹ (the two rulings) and Z(X) is two points.
- n = 0: Z(X) = X, a double cover.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, Proposition 1.5, p. 5. The centre of the even Clifford algebra. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, Proposition 1.12, p. 8. The parity criterion for the two families. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, Proposition 2.8, p. 13. The generatrices and their Stein factorisation through Z(X). Transcribed from the page image.

### Definition. Smooth quadrics over a base

**Declaration:** `TauCeti.AlgebraicGeometry.Quadric.IsSmoothQuadric`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/smooth-quadric`.

Over an algebraically closed field k, a smooth quadric of dimension n is a k-scheme isomorphic to the subscheme Q = 0 of P(V*), dim V = n + 2, for Q an ordinary quadratic form. Over a scheme S, a smooth quadric of dimension n is a proper smooth S-scheme whose geometric fibres are smooth quadrics. For n = 0 it is an étale double cover of S, for n = 1 a Severi–Brauer scheme of relative dimension 1, and for n = 2 its geometric fibres are P¹ × P¹. Étale locally on S it is the quadric of an ordinary form in a projective space P(X) that depends only on X/S; Ω^n_{X/S} ≅ O(−n) has ample inverse.

**Hypotheses.**

- The ambient Severi–Brauer scheme P(X) is canonical (XII 2.6), so no embedding is part of the data.

**API.**

- `TauCeti.AlgebraicGeometry.Quadric.IsSmoothQuadric` (data) — IsSmoothQuadric (f : X ⟶ S) (n : ℕ) : Prop — proper, smooth, geometric fibres smooth quadrics of dimension n.
- `TauCeti.AlgebraicGeometry.Quadric.isSmoothQuadric_of_isOrdinary` (constructor) — The quadric of an ordinary form of rank n + 2 is a smooth quadric of dimension n.
- `TauCeti.AlgebraicGeometry.Quadric.ambientProjective` (constructor) — P(X), a Severi–Brauer S-scheme with X ⊂ P(X) a relative divisor of degree 2.
- `TauCeti.AlgebraicGeometry.Quadric.isSmoothQuadric_zero_iff` (characterisation) — A smooth quadric of dimension 0 is the same as an étale double cover.
- `TauCeti.AlgebraicGeometry.Quadric.canonical_iso` (characterisation) — Ω^n_{X/S} ≅ O_X(−n).

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-smooth-quadrics` — the cohomology of smooth quadrics
- `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics` — affine quadrics X − (X ∩ H)
- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2` — the projectivised tangent cone at an ordinary quadratic point

**Unit tests.**

- `TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_dim_zero` (degenerate) — n = 0 over an algebraically closed field: X ≅ Spec k ⊔ Spec k.
- `TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_dim_two` (value) — n = 2: xy = zw in P³ is P¹ × P¹ (Segre).
- `TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_real_conic` (value) — n = 1 over ℝ: x² + y² + z² = 0 is a smooth conic without real points, a nontrivial Severi–Brauer curve.
- `TauCeti.AlgebraicGeometry.Quadric.not_smoothQuadric_cone` (non-example) — The cone xy = z² in P³ (a form of rank 3 in 4 variables) is singular at (0:0:0:1); the form is not ordinary.

**Construction or proof.**

1. Over k algebraically closed, Remark 2.2 identifies n = 0, 1, 2 and Lemma 2.3 computes Ω^n ≅ O(−n), Pic and the vanishing of H^i(O) and H^1(O(1)).
2. Over S, Pic_{X/S} is étale locally constant (H¹(O) = H²(O) = 0), so étale locally there is L with L^{⊗n} matching Ω^n; p_*L is locally free of rank n + 2 and X ⊂ P(p_*L) is the quadric of an ordinary form, unique up to a unit (XII 2.5).
3. P(p_*L) does not depend on L (XII 2.6), and descends to the Severi–Brauer scheme P(X).

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:key/henselization`.

**Acceptance.**

- The three low-dimensional cases of Remark 2.2 and the real conic.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, 2.1, p. 9. Smooth quadrics over an algebraically closed field. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, Définition 2.4, p. 10. The relative definition. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, 2.4, p. 10. The case n = 0. Transcribed from the page image.

### Theorem. The ℓ-adic cohomology of a smooth quadric

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfSmoothQuadrics`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-smooth-quadrics`.

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

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/smooth-quadric`, `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`, `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`, `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`, `EtaleDualityAndPerverseSheaves:EDC.4`.

**Acceptance.**

- n = 2, X = P¹ × P¹: the two rulings have square 0 and product 1 (m = 1 odd); #X(𝔽_q) = (1 + q)² when split and 1 + q² for the nonsplit form (Weil restriction of P¹ from 𝔽_{q²}).
- n = 0: two points, Tr(cℓ(α)²) = 1 (m = 0 even), #X(𝔽_q) = 1 + ε ∈ {0, 2}.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, Théorème 3.3, p. 14. The theorem; (ii)–(iii) are on p. 15. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, Théorème 3.3 (iii)(b), p. 15. The intersection form on the two generatrix classes, m odd. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, Vérification 3.4, p. 17. The point count over 𝔽_q. Transcribed from the page image.

### Theorem. Cohomology of affine quadrics and the vanishing class δ

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfAffineQuadrics`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics`.

Let X be the smooth quadric over S of an ordinary form Q on V of rank n + 2, H a hyperplane of P(V*) meeting X transversally, Y = X ∩ H (a smooth quadric of dimension n − 1), X° = X − Y and f : X° → S. For n = 2m the primitive part of R^n p_*ℤ_ℓ(m) is the orthogonal of η^m, generated by cℓ(α) − cℓ(β), and the primitive quotient is R^n p_*ℤ_ℓ(m)/ℤ_ℓη^m. The cohomology of X° is torsion-free, with nonzero Betti numbers b₀ = b_n = 1, and with compact support b_{2n} = b_n = 1 (b₀ = 2 for n = 0). For n = 2m > 0, R^n f_!ℤ_ℓ(m) is the primitive part and R^n f_*ℤ_ℓ(m) the primitive quotient of R^{2m}p_*ℤ_ℓ(m); for n = 2m + 1, R^n f_!ℤ_ℓ(m) is the primitive quotient and R^n f_*ℤ_ℓ(m + 1) the primitive part of R^{2m}q_*ℤ_ℓ(m). Locally these have natural generators defined up to sign, δ with compact support and δ′ without. The forget-supports map φ : R^n f_!ℤ_ℓ → R^n f_*ℤ_ℓ is 0 for n odd and sends ±δ to ±2δ′ for n even > 0; Tr(δδ′) = ±1, and Tr(δ²) = 0 for n = 2m + 1 and (−1)^m·2 for n = 2m.

**Hypotheses.**

- n > 0 for the exact sequences; n = 0 gives Y = ∅ and X° = X.

**Construction or proof.**

1. The localisation sequence … → R^i f_!ℤ_ℓ → R^i p_*ℤ_ℓ → R^i q_*ℤ_ℓ → … and its dual Gysin sequence … → R^{i−2}q_*ℤ_ℓ(−1) → R^i p_*ℤ_ℓ → R^i f_*ℤ_ℓ → … (XII 3.6.2–3.6.3).
2. By Theorem 3.3 the restriction r_i is an isomorphism for i ≠ n, 2n (n even) and i ≠ n − 1 (n odd). For n = 2m, r_n(cℓ(α)) = ½η^m, so r_n is onto with kernel the primitive part; for n = 2m + 1, r_{2m}(η^m) = η^m, so r_{2m} is injective with cokernel the primitive quotient.
3. Hence R^i f_!ℤ_ℓ = 0 for i ≠ n, 2n and is a twisted constant sheaf of rank 1 in degrees n and 2n; dually R^i f_*ℤ_ℓ = 0 for i ≠ 0, n, f_*ℤ_ℓ = ℤ_ℓ and R^n f_*ℤ_ℓ has rank 1.
4. n = 2m: δ maps to ±(cℓ(α) − cℓ(β)), so Tr(δ²) = cℓ(α)² − 2cℓ(α)cℓ(β) + cℓ(β)², which is 1 + 1 − 0 = 2 for m even and 0 + 0 − 2 = −2 for m odd (Theorem 3.3 (iii)(b)); ±φ(δ) is twice ±δ′.
5. n = 2m + 1: δ = ∂cℓ(α) and δ² = ∂(cℓ(α)·∂cℓ(α)) = 0, so φ(δ) = 0; δ′ maps to ±(cℓ(α) − cℓ(β)) in R^{2m}q_*ℤ_ℓ(m) and Tr(δδ′) = ±1.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-smooth-quadrics`, `LefschetzPencilsAndVanishingCycles:LPV.2/smooth-quadric`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`, `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`, `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`.

**Acceptance.**

- n = 1: X° = P¹ minus two points ≅ 𝔾_m, H¹_c and H¹ of rank 1, φ = 0, Tr(δ²) = 0.
- n = 2: Tr(δ²) = −2, the self-intersection of the vanishing sphere of a surface node; over ℂ, Σ z_i² = 1 is diffeomorphic to the tangent bundle of a sphere (XII 3.8).

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, 3.5, p. 17. The primitive part and quotient. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, 3.6, p. 18. The restriction maps in the localisation sequence. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XII, Table 3.7, p. 20. The generators δ, δ′; the table's values of Tr(δδ′) and Tr(δ²) were read on the page image. Transcribed from the page image.

### Definition. Ordinary and non-degenerate quadratic points

**Declaration:** `TauCeti.AlgebraicGeometry.Quadric.IsOrdinaryQuadraticPoint`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`.

Let y be a closed point of a scheme Y of finite type over a field k of characteristic p, and n = dim_y Y. For k algebraically closed, y is an ordinary quadratic point of Y if Ô_{Y,y} ≅ k[[x₁, …, x_{n+1}]]/(f) with f = Q(x) + (terms of order > 2) and Q an ordinary quadratic form in n + 1 variables. For general k, y is an ordinary quadratic point if the points of Y ⊗_k k̄ over y are. Replacing ordinary by nondegenerate gives a non-degenerate quadratic point; y is non-degenerate if and only if it is ordinary and p ≠ 2 or n is odd. An ordinary quadratic point with p = 2 and n even is called degenerate.

**Hypotheses.**

- The quadratic part Q is well defined up to linear change of variables because f has no linear term.

**API.**

- `TauCeti.AlgebraicGeometry.Quadric.IsOrdinaryQuadraticPoint` (data) — IsOrdinaryQuadraticPoint (Y : Scheme) (y : Y) : Prop, for Y locally of finite type over a field.
- `TauCeti.AlgebraicGeometry.Quadric.IsNondegenerateQuadraticPoint` (data) — The same with the leading form nondegenerate.
- `TauCeti.AlgebraicGeometry.Quadric.isNondegenerate_iff` (characterisation) — IsNondegenerateQuadraticPoint Y y ↔ IsOrdinaryQuadraticPoint Y y ∧ (p ≠ 2 ∨ Odd n).
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinaryQuadraticPoint_baseChange` (compatibility) — The notion is geometric: it holds at y if and only if it holds at the points over y after any field extension.
- `TauCeti.AlgebraicGeometry.Quadric.isOrdinaryQuadraticPoint_cone` (example) — The vertex of the affine cone of an ordinary form in n + 1 variables is an ordinary quadratic point (XV 1.2.3–1.2.4).

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2` — the hypothesis of SGA 7 XV 3.1.1
- `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence` — the singular point of a Lefschetz degeneration
- `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil` — condition (C) of a Lefschetz pencil
- `LefschetzPencilsAndVanishingCycles:LPV.2/canonical-form-of-an-ordinary-quadratic-point` — the canonical forms 1.2.3–1.2.4

**Unit tests.**

- `TauCeti.AlgebraicGeometry.Quadric.node_isOrdinary` (value) — The node xy = 0 in 𝔸² (n = 1): Q = xy is ordinary and nondegenerate in every characteristic.
- `TauCeti.AlgebraicGeometry.Quadric.doublePoint_char_two` (value) — n = 0, Y = Spec k[x]/(x²): Q = x² is ordinary in every characteristic, so the origin is ordinary; it is non-degenerate if and only if p ≠ 2, and for p = 2 it is degenerate.
- `TauCeti.AlgebraicGeometry.Quadric.cusp_not_ordinary` (non-example) — The cusp y² = x³ (n = 1): the quadratic part y² in two variables is not ordinary (its quadric is a double point of P¹), so the cusp is not an ordinary quadratic point.
- `TauCeti.AlgebraicGeometry.Quadric.smooth_point_not_quadratic` (degenerate) — A smooth point is not an ordinary quadratic point: its Zariski tangent space has dimension n, not n + 1.

**Construction or proof.**

1. The quadratic part of f is determined up to linear change of coordinates and multiplication by a unit, and ordinary is invariant under both.
2. The criterion for non-degeneracy is XII 1.1 applied to the form in n + 1 variables: ordinary and nondegenerate agree unless p = 2 and n + 1 is odd.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:key/henselization`.

**Acceptance.**

- The node, the double point in both characteristics, the cusp and a smooth point.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Définition 1.2.1, p. 4. The definition over an algebraically closed field. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 1.2.2, pp. 4–5. Non-degenerate quadratic points. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Exemple 1.2.4, p. 5. The degenerate model (x₀² − a) + Σ a_ij x_i x_j in characteristic 2. Transcribed from the page image.

### Lemma. The Tjurina module of an ordinary quadratic point

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.tjurinaModuleOfAnOrdinaryQuadraticPoint`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/tjurina-module-of-an-ordinary-quadratic-point`.

Let y be an ordinary quadratic point of Y/k with k(y) purely inseparable over k, and T¹_{Y/k} = O_Y/J the quotient by the Jacobian ideal (XV 1.1.1). Near y, T¹_{Y/k} is monogenic and concentrated at y, of rank 1 over k if y is non-degenerate (so k(y) = k), and of rank 2 if y is degenerate (p = 2, n = 2m), in which case k(y) = k or k(y) ≅ k(√a) with a ∈ k − k².

**Hypotheses.**

- k(y) purely inseparable over k; the general case reduces to it through the largest separable subextension of k(y).

**Construction or proof.**

1. Both assertions can be checked over k̄ after completion at y.
2. Non-degenerate: with f = Q + (order > 2), the ∂f/∂x_i generate the maximal ideal by Nakayama, so k[[x]]/(f, ∂f/∂x_i) = k.
3. Degenerate: in suitable coordinates f = x₀² + Σ_{i=1}^{m} x_i x_{i+m} + R with R of order ≥ 3. The ideal (f, ∂f/∂x_i) equals (x₀², x_i (i ≠ 0)) by Nakayama, because ∂f/∂x_i ≡ x_{i+m} and ∂f/∂x_{i+m} ≡ x_i modulo q·n + (x₀²); so the quotient is k[x₀]/(x₀²), of dimension 2.
4. A radicial subscheme of rank 2 of affine space lies on a unique line (XV 1.2.9–1.2.10), which gives k(y) = k or k(√a).

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`.

**Acceptance.**

- n = 0, Y = Spec k[x]/(x²): T¹ = k[x]/(x², 2x) has dimension 1 for p ≠ 2 and 2 for p = 2.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Lemme 1.2.7, p. 6. The non-degenerate case (the source writes J^n_{Y/k} here). Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Lemme 1.2.8, p. 7. The degenerate case p = 2, n even. Transcribed from the page image.

### Theorem. Henselian quadratic coordinate approximation

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.tougeronArtinImplicitFunctionTheorem`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/tougeron-artin-implicit-function-theorem`.

In the ordinary quadratic local equation, a formal coordinate change tangent to the identity can be approximated to a prescribed finite order by a henselian coordinate change, under the finite-presentation/Jacobian-ideal hypotheses of Artin’s lemma cited in XV 1.1.2. This is the application of general henselian approximation to the quadratic germ, not a second general approximation theorem.

**Hypotheses.**

- Excellent henselian local base in the approximation application; finite-presentation hypersurface
- The Jacobian-square divisibility condition of XV 1.1.2; the exact general statement is requested from SchemeAndStackFoundations, Part II

**Construction or proof.**

1. Present the coordinate-change equations as a finite-type scheme of solutions.
2. Apply the supplier’s Artin approximation/Jacobian-square lifting statement; keep the prescribed finite jet.
3. Check that the linear part remains invertible and the quadratic leading term is preserved.

**Direct dependencies:** `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:SF.0`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`.

**Acceptance.**

- p = 1, X : g(x) = 0 in 𝔸¹_S with g′(s) a unit (δ′ = (g′)): a root modulo I lifts to a root in A, which is Hensel's lemma.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Théorème 1.1.2 (Tougeron-Artin), p. 2. The statement, continued on p. 3. Transcribed from the page image.

### Theorem. Henselian versal deformation of a quadratic germ

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.elkikVersalHenselianDeformations`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/elkik-versal-henselian-deformations`.

For an isolated ordinary quadratic germ over a field, the versal henselian deformation has the one-parameter nondegenerate model Q−b, or the two-parameter characteristic-two even-dimensional model x₀²+bx₀+c+Q′. A chosen special-fibre identification extends after the coefficient lifts are prescribed. Versality and comparison with the formal deformation are imported from the general Elkik approximation/deformation supplier.

**Hypotheses.**

- Isolated ordinary quadratic germ; finite presentation over a henselian noetherian local base
- Nondegenerate polar form in the first branch; characteristic two with even fibre dimension in the second

**Construction or proof.**

1. Use the Tjurina rank calculation to identify one or two deformation parameters.
2. Apply the supplier’s henselian/formal versality comparison and algebraization.
3. Verify the explicit parameter families by the Jacobian calculation in XV 1.3.1–3.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/tjurina-module-of-an-ordinary-quadratic-point`, `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:SF.0`.

**Acceptance.**

- The ordinary quadratic point has a one-parameter versal deformation Q − b = 0 (non-degenerate case) and a two-parameter one in the degenerate case, matching the ranks 1 and 2 of T¹ in the Tjurina-module lemma.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Théorème 1.1.4 (R. Elkik), p. 4. The existence and uniqueness statement. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 1.1.4, p. 4. The proof is not in SGA 7. Transcribed from the page image.

### Theorem. Canonical form of an ordinary quadratic point up to henselisation

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.canonicalFormOfAnOrdinaryQuadraticPoint`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/canonical-form-of-an-ordinary-quadratic-point`.

Let y be an ordinary quadratic point of a k-scheme Y and k′ the largest separable subextension of k(y). There are a k′-scheme Y₀ ⊂ 𝔸^{n+1}_{k′}, either the cone Q = 0 of a nondegenerate form with y₀ the origin (1.2.3), or, for p = 2 and n = 2m, the scheme (x₀² − a) + Σ_{0<i≤j≤2m} a_ij x_i x_j = 0 with the 2m-variable form nondegenerate and y₀ = (√a, 0, …, 0) (1.2.4), and a k-isomorphism between the henselisations Y_(y) and Y₀(y₀). The same holds for the affine quadric of a non-homogeneous quadratic form with an ordinary singular point, by an affine change of variables (XV 1.2.12).

**Hypotheses.**

- When a ∉ k², k(y₀) = k(√a) is purely inseparable of degree 2 over k.

**Construction or proof.**

1. Pass to an étale neighbourhood of y that is a k′-scheme, reducing to k(y) purely inseparable over k.
2. dim (Ω¹_{Y/k})_y = n + 1 (check over k̄ after completion), so near y, Y is cut out by one equation f in a smooth k-scheme Z of dimension n + 1.
3. Non-degenerate case: then k(y) = k (Tjurina-module lemma); choose étale coordinates x_i at y with f = Q(x) + (order > 2), so Q(x_i) ∈ m³ on Y. The ideal generated by the ∂Q/∂X_i pulls back to m, and the implicit function theorem (a = m, δ′ = J) gives x′_i ≡ x_i mod m² on Y_(y) with Q(x′_i) = 0, which is the isomorphism.
4. Degenerate case: k(y) = k(√a); the radicial rank-2 subscheme defined by J lies on a line (XV 1.2.9–1.2.10), giving coordinates in which f = (x₀² − a) + Σ a_ij x_i x_j + R; one checks Q(x_i) ≡ 0 mod δ²q on Y (XV 1.2.11.1) and concludes by the implicit function theorem.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`, `LefschetzPencilsAndVanishingCycles:LPV.2/tjurina-module-of-an-ordinary-quadratic-point`, `LefschetzPencilsAndVanishingCycles:LPV.2/tougeron-artin-implicit-function-theorem`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`.

**Acceptance.**

- The node xy = 0 is the cone of x₁x₂; y² = x² + x³ at the origin (p ≠ 2) is étale locally the node.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Théorème 1.2.6, p. 5. The canonical form. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, proof of 1.2.6, p. 7. The non-degenerate case through the implicit function theorem. Transcribed from the page image.

### Theorem. Local equation of a flat family at an ordinary quadratic point

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.localEquationOfAFamilyAtAnOrdinaryQuadraticPoint`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point`.

Let S = Spec A be henselian local with closed point s, f : X → S flat of finite presentation, and x a closed point of X_s at which X_s has an ordinary quadratic singularity, with k(x) purely inseparable over k(s) and X_s of dimension n. (i) If x is non-degenerate, there are a nondegenerate quadratic form Q in n + 1 variables over A and b in the maximal ideal such that the henselisation of X at x is isomorphic to the henselisation at the origin of Q − b = 0 in 𝔸^{n+1}_S. (ii) If x is degenerate (n = 2m, char k(s) = 2), there is Q(x) = x₀² + bx₀ + c + Σ_{1≤i≤j≤2m} a_ij x_i x_j over A with b in the maximal ideal and the 2m-variable form nondegenerate, such that the henselisation of X at x is isomorphic to that of Q = 0 at (√c, 0, …, 0). The isomorphism can be chosen to extend a given one on the special fibre, lifting its coefficients (XV 1.3.3).

**Hypotheses.**

- The source prints x₀ for x₀² in the formula of (ii) (source issue E7).

**Construction or proof.**

1. By the canonical-form theorem, the special fibre at x is the model 1.2.3 or 1.2.4.
2. By XV 1.3.1, the versal henselian deformation of that model over S is Σ a_ij x_i x_j − b = 0 over A{b} (non-degenerate) or (x₀² − a) + Σ a_ij x_i x_j + bx₀ + c = 0 over A{b, c} (degenerate), a consequence of Elkik's theorem and explicit computations (SGA 7 VI 6).
3. X/S is pulled back from the versal deformation along a local morphism S → T, which specialises b (and c) to elements of A.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/canonical-form-of-an-ordinary-quadratic-point`, `LefschetzPencilsAndVanishingCycles:LPV.2/elkik-versal-henselian-deformations`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`.

**Acceptance.**

- A family of curves acquiring a node: xy = b with b ∈ m_A; for a regular total space b is a uniformiser, which is the b(x) of XV 3.3.1.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Corollaire 1.3.2 (i), p. 11. The non-degenerate case. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Remarque 1.3.3, p. 12. The degenerate case with the square present, and the choice extending a given special-fibre isomorphism. Transcribed from the page image.

### Theorem. Non-smooth points near an ordinary quadratic point are ordinary quadratic

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.nonSmoothPointsNearAnOrdinaryQuadraticPoint`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/non-smooth-points-near-an-ordinary-quadratic-point`.

In the situation of the local-equation theorem, there is a neighbourhood U of x in X such that every point of U at which f is not smooth is an ordinary quadratic point of its fibre.

**Hypotheses.**

- f flat of finite presentation; x an ordinary quadratic point of X_s with k(x) purely inseparable over k(s).

**Construction or proof.**

1. Work on the local model Q − b = 0 (resp. x₀² + bx₀ + c + Σ a_ij x_i x_j = 0).
2. Non-degenerate case: f fails to be smooth exactly where all ∂Q/∂x_i vanish and Q = b, that is, at the origin over V(b); the fibre there is the cone Q = 0, an ordinary quadratic point.
3. Degenerate case: the singular locus is the section x_i = 0 (i ≥ 1), x₀ with x₀² + bx₀ + c = 0 and b = 0 there; each such point is of type 1.2.4 in its fibre.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`.

**Acceptance.**

- In a Lefschetz pencil the singular points of the fibres near x_s are x_s itself, as condition (B) requires.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Corollaire 1.3.4, p. 12. The statement. Transcribed from the page image.

### Lemma. Homotopy invariance of étale cohomology

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.homotopyInvarianceOfEtaleCohomology`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/homotopy-invariance-of-etale-cohomology`.

Let k be algebraically closed, Λ a torsion ring prime to char k, U and V k-schemes, K ∈ D⁺(U, Λ) and L ∈ D⁺(V, Λ). A morphism (U, K) → (V, L) is a pair (f : U → V, φ : f*L → K); it induces f* : H*(V, L) → H*(U, K). Two morphisms f₀, f₁ are homotopic if there are a connected k-scheme T of finite type, points 0, 1 ∈ T(k) and a morphism (U × T, pr₁*K) → (V, L) whose fibres at 0 and 1 are f₀ and f₁. Homotopic morphisms induce the same map on cohomology.

**Hypotheses.**

- k algebraically closed; T connected of finite type.

**Construction or proof.**

1. Join 0 and 1 by a chain of points x₀ = 0, …, x_n = 1 and smooth connected curves Γ_i → T with x_i, x_{i+1} in the image of Γ_i (normalise one-dimensional subschemes through consecutive points). This reduces to T a smooth connected curve.
2. Smooth base change for t : T → Spec k gives t*Rf_*K ≅ Rpr_{2*}(pr₁*K), so R^n pr_{2*}(pr₁*K) is the constant sheaf t*H^n(U, K).
3. f_i* factors as H^n(V, L) → H^n(U × T, pr₁*K) → H⁰(T, t*H^n(U, K)) → H^n(U, K), the last map being the fibre at i; for a constant sheaf on a connected T this does not depend on i.

**Direct dependencies:** `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- The homotheties (x, t) ↦ tx, t ∈ 𝔸¹, make the identity of an affine cone homotopic to the constant map to its vertex.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Lemme 2.1.3, p. 14. The homotopy lemma and its proof by smooth base change. Transcribed from the page image.

### Theorem. Cohomology of a cone and of its henselisation at the vertex

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfACone`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-cone`.

Let Y ⊂ P^r be projective over an algebraically closed field k, X ⊂ 𝔸^{r+1} its affine cone with vertex 0, X_(0) the henselisation at 0, X* = X − {0}, X*_(0) = X_(0) − {0}, X₁ ⊂ P^{r+1} the projective cone (X = X₁ − Y), and F a torsion group prime to char k. Then (i) H^i(X, F) ≅ H^i({0}, F), which is F for i = 0 and 0 for i > 0; (ii) H^i_{0}(X, F) ≅ H^i_c(X, F); and H^i(X*, F) ≅ H^i(X*_(0), F) (Corollary 2.1.4).

**Hypotheses.**

- F torsion prime to the characteristic; all cohomology with coefficients in F.

**Construction or proof.**

1. (i): the identity of X is homotopic, through the homotheties, to the constant map with value 0 (homotopy lemma).
2. (ii): homotheties of ratio tending to infinity make Y a deformation retract of X₁ − {0}; the five lemma on the long exact sequences of H_{0}(X) → H(X₁) → H(X₁ − {0}) and H_c(X) → H(X₁) → H(Y) gives (ii).
3. Corollary 2.1.4: the five lemma on the sequences for supports in {0} in X and in X_(0), with (i) and H^i(X_(0)) = H^i({0}) (X_(0) is henselian local).

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/homotopy-invariance-of-etale-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- Y = P⁰ (X = 𝔸¹): H^i(𝔸¹) = F for i = 0 and 0 otherwise, and H^i_{0}(𝔸¹) = H^i_c(𝔸¹) = F(−1) for i = 2.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Proposition 2.1.2, p. 13. The proposition (displays (i) and (ii) read on the page image) and its proof. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Corollaire 2.1.4, p. 15. The comparison of the punctured cone with its henselisation. Transcribed from the page image.

### Theorem. The Gysin sequence of a punctured cone and its local analogue

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfAPuncturedCone`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-punctured-cone`.

In the notation of the cone theorem, let X̃, X̃_(0), X̃₁ be the blow-ups of X, X_(0), X₁ at 0, Y₀ the exceptional divisor, h : X̃₁ → Y the projection, and y₀, y_∞ : Y → X̃₁ the sections with images Y₀ and Y. Restriction gives isomorphisms H^i(X̃₁ − Y₀) ≅ H^i(Y) and H^i(X̃) ≅ H^i(Y₀) = H^i(Y), through which the long exact sequences of the pairs (X̃₁ − Y₀, Y) and (X̃₁ − Y, Y₀) become the rows of a commutative diagram (2.1.5.1): … → H^{i−1}(X*) → H^{i−2}(Y)(−1) → H^i(Y) → H^i(X*) → …, the middle arrows being cup product with the class η of a hyperplane section in one row and −η in the other (Lemma 2.1.6). Locally, H^i(X̃_(0)) ≅ H^i(Y₀) by proper base change, and the sequence of (X̃_(0), Y₀) maps to the second row of (2.1.5.1) (diagram (2.1.7.1)).

**Hypotheses.**

- Coefficients F torsion prime to char k.

**Construction or proof.**

1. The Leray spectral sequences of h on X̃₁ − Y₀ and X̃₁ − Y (line bundles over Y) give the restriction isomorphisms.
2. η (resp. −η) is the restriction to Y (resp. Y₀ ≅ Y) of the class of O(Y) (resp. O(Y₀)) on X̃₁ − Y₀ (resp. X̃₁ − Y).
3. Commutativity: both rows come from applying H(Y, ·) to the distinguished triangles y_∞*Ry_∞^!F → R(h|X̃₁ − Y₀)_*F → R(h|X*)_*F → and y₀*Ry₀^!F → R(h|X̃₁ − Y)_*F → R(h|X*)_*F →, whose cohomology sheaves are in degrees 0, 1 and 2 only; this reduces to Y a point, which is checked directly.
4. Local analogue: X̃_(0) → X_(0) is proper, so proper base change gives H^i(X̃_(0)) ≅ H^i(Y₀), and the punctured-cone corollary identifies H^i(X*_(0)) with H^i(X*).

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-cone`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`, `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`.

**Acceptance.**

- Y = P^{r−1} (X = 𝔸^r, X* = 𝔸^r − {0}): the sequence recovers H^i(𝔸^r − {0}) = F for i = 0, 2r − 1 and 0 otherwise, because cup with η is an isomorphism H^{i−2}(P^{r−1})(−1) → H^i(P^{r−1}) for 2 ≤ i ≤ 2r − 2.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Lemme 2.1.6, p. 16. The Gysin maps in (2.1.5.1). Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 2.1.7, p. 16. The local sequence of (X̃_(0), Y₀). Transcribed from the page image.

### Lemma. An anticommutative boundary diagram for a cone

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.boundaryAnticommutativityForACone`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/boundary-anticommutativity-for-a-cone`.

In the notation of the punctured-cone theorem, the composite H^{n−1}(Y₀) ≅ H^{n−1}(X̃) → H^{n−1}(X*) → H^n_{0}(X) → H^n_c(X) is the negative of the boundary map ∂ : H^{n−1}(Y) → H^n_c(X) of the pair (X₁, Y), under Y₀ ≅ Y.

**Hypotheses.**

- The source numbers this lemma 2.7.8; it is Lemma 2.1.8, as its application in 2.2.7 says (source issue E9).

**Construction or proof.**

1. By the local analogue (2.1.7.1) it is equivalent to prove that H^{n−1}(X₁ − {0}) → H^n_{0}(X₁) = H^n_{0}(X) → H^n_c(X) agrees with the restriction to Y followed by ∂ : H^{n−1}(Y) → H^n_c(X).
2. This is a compatibility of boundary maps for the closed subsets {0} and Y of X₁ with complement X ∩ (X₁ − {0}) = X*, a general property of the long exact sequences of supports; the sign comes from the orientation reversal of the identification Y₀ ≅ Y (−η versus η).

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-punctured-cone`.

**Acceptance.**

- It is the step that turns the local generator of XV 2.2.7 into the global class δ of the affine quadric (XII 3.6–3.7).

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Lemme 2.7.8 (= 2.1.8), p. 17. The anticommutative diagram (displayed on the page) and the proof by reduction through 2.1.7. Transcribed from the page image.

### Definition. Standard quadratic degenerations

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/standard-quadratic-degeneration`.

Let S be a henselian trait with s, η, s̄, η̄ as in SGA 7 XIII 0.2.5, and Λ = ℤ/k with k invertible on S. A standard quadratic degeneration of relative dimension n is the closed subscheme X ⊂ 𝔸^{n+1}_S defined by Q(x) = Σ_{i≤j} a_ij x_i x_j + Σ b_i x_i + c, nonzero modulo the uniformiser, such that, with X₁ ⊂ P^{n+1}_S the quadric Σ a_ij x_i x_j + Σ b_i x_i z + cz² = 0 and Y = X₁ ∩ H (H the hyperplane at infinity, X = X₁ − Y): (a) Y is a smooth quadric over S, that is, Σ a_ij x_i x_j is ordinary; (b) X_s̄ is a quadratic cone. Its vertex x₀ is the singular point of X_s. The subscheme A of X_s cut out by the ∂Q/∂x_i is concentrated at x₀; it has degree one, so x₀ is rational, except when char k(s) = 2 and n is even, where A has rank 2 and k(x₀) is k(s) or a purely inseparable quadratic extension of k(s). If x₀ = 0, the b_i and c lie in the maximal ideal.

**Hypotheses.**

- The source says 'n + 1 est pair' for the exceptional case; it is n + 1 odd, that is, n even (source issue E12).
- Condition (*) of XV 2.2.5, that the generic fibre is smooth, is a further hypothesis, not part of the definition.

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

**Unit tests.**

- `TauCeti.AlgebraicGeometry.VanishingCycles.standard_node` (value) — n = 1, Q = xy − π with π a uniformiser: Y = {xy = 0, z = 0} is two points (a smooth quadric of dimension 0), X_s is the cone xy = 0, and the generic fibre is smooth.
- `TauCeti.AlgebraicGeometry.VanishingCycles.standard_double_point` (degenerate) — n = 0, Q = x² − π with p ≠ 2: Y = ∅, X_s = Spec k(s)[x]/(x²) is a cone, and the geometric generic fibre is two points.
- `TauCeti.AlgebraicGeometry.VanishingCycles.not_standard_char_two` (non-example) — char k(s) = 2, n = 1, Q = x² + y² − π: the leading form (x + y)² is not ordinary, so (a) fails.
- `TauCeti.AlgebraicGeometry.VanishingCycles.standard_trivial_family` (non-example) — Q = xy (c = 0): X_η̄ is again a cone, so (*) fails and all R^iΦ vanish (Corollary 2.2.4).

**Construction or proof.**

1. The projective closure is a flat family of quadrics; (a) says its hyperplane section at infinity is smooth.
2. On X_s the ∂Q/∂x_i define the singular locus of the cone, concentrated at the vertex; its degree over k(s) is computed after passing to k(s̄), as in the Tjurina-module lemma.
3. If x₀ is rational, translate it to the origin; since x₀ ∈ X_s is singular, Q and its first derivatives vanish there modulo the maximal ideal, so the b_i and c lie in it.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`, `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point`.

**Acceptance.**

- The node xy = π and the double point x² = π are standard; x² + y² − π in characteristic 2 is not.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 2.2.1, p. 17. The setting; the equation and its projective closure (2.2.1.1) are on p. 18. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 2.2.1 (a)–(b), p. 18. Hypothesis (a); hypothesis (b) says X_s̄ is a quadratic cone. Transcribed from the page image.

### Theorem. Nearby cycles of a standard quadratic degeneration

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyCyclesOfAStandardQuadraticDegeneration`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration`.

Let S be a henselian trait (s, η, s̄, η̄ as in SGA 7 XIII 0.2.5), Λ = ℤ/k with k invertible on S, and X ⊂ 𝔸^{n+1}_S a standard quadratic degeneration: Q = Σ_{i≤j} a_ij x_i x_j + Σ b_i x_i + c, with Y smooth over S and X_s̄ a quadratic cone with vertex x₀. (Proposition 2.2.3) H^i(X_η̄, Λ) ≅ H^i(X_s̄, RΨ_η̄Λ) ≅ R^iΨ_η̄(Λ)_{x₀} and H^i_c(X_η̄, Λ) ≅ H^i_c(X_s̄, RΨ_η̄Λ) ≅ H^i_{x₀}(X_s̄, RΨ_η̄Λ). (Corollary 2.2.4) If X_η̄ is singular, a quadratic cone again, all R^iΦ(Λ) vanish. (2.2.5) If X_η is smooth and S is strictly henselian: (A) R^iΨ_η̄(Λ) = 0 for i ≠ 0, n; for n ≠ 0, Ψ_η̄(Λ) = Λ and R^nΨ_η̄(Λ) is (non-canonically) Λ at x₀ extended by 0; for all n, R^iΦ(Λ) = 0 for i ≠ n and R^nΦ(Λ) is Λ at x₀ extended by 0. (B) H^i_{x₀}(X_s, RΨ_η̄Λ) = 0 for i ≠ n, 2n; the trace H^{2n}_{x₀}(X_s, RΨ_η̄Λ(n)) → Λ is an isomorphism for n ≠ 0, and H^n_{x₀}(X_s, RΨ_η̄Λ(n)) ≅ Λ. (C) (a, b) = Tr(a ∧ b) puts the free Λ-modules R^nΨ_η̄(Λ)_{x₀} and H^n_{x₀}(X_s, RΨ_η̄Λ(n)) in perfect duality.

**Hypotheses.**

- (*) X_η smooth for (A)–(C); S strictly henselian for simplicity.

**Construction or proof.**

1. The left isomorphisms of 2.2.3 are XIII 2.1.8.6 and 2.1.10.5 (proper base change for X₁ and supports).
2. The right ones follow from the cone theorem: in the triangle (Λ on X_s̄)[0] → RΨ_η̄(Λ) → RΦ(Λ) →, the cone theorem applies to Λ on X_s̄ and RΦ(Λ) is supported at x₀.
3. Corollary 2.2.4: if X_η̄ is a cone, H⁰(X_s̄, Λ) = Λ = H⁰(X_η̄, Λ) and all higher groups vanish on both sides, so the long exact sequence XIII 2.1.8.9 gives RΦ = 0.
4. (A)–(B): X_η̄ = X₁,η̄ − Y_η̄ is an affine quadric, so XII 3.7 computes H^i(X_η̄) and H^i_c(X_η̄); pass from ℓ-adic to Λ = ℤ/k coefficients by the universal coefficient formula (XIII 2.1.13).
5. (C): Poincaré duality on X_η̄ and the isomorphisms 2.2.3.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/standard-quadratic-degeneration`, `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-cone`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`.

**Acceptance.**

- n = 1, xy = π: R¹Φ(Λ) is Λ at the origin, and H¹_c(X_η̄) ≅ Λ with X_η̄ ≅ 𝔾_m.
- n = 0, x² = π: R⁰Φ(Λ) has rank 1 at x₀, the kernel of Λ² → Λ from the two points to the special point.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Proposition 2.2.3, p. 18. The isomorphisms (displayed on p. 19) and their proof. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Corollaire 2.2.4, p. 19. If the geometric generic fibre is singular, the vanishing cycles are 0. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 2.2.5 C, p. 20. The duality (a, b) = Tr(a ∧ b). Transcribed from the page image.

### Theorem. The variation in a standard quadratic degeneration

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.variationInAStandardQuadraticDegeneration`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/variation-in-a-standard-quadratic-degeneration`.

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

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration`, `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics`, `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric`, `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism`, `ArithmeticGaloisRepresentations:R01.2`.

**Acceptance.**

- n = 0, x² = π, p ≠ 2: ε is the character of k(η)(√π), and Var(σ)(a) = −(a, δ)δ when ε(σ) = −1, the swap of the two points.
- n = 1, xy = π: Var(σ)(a) = λ_X t_ℓ(σ)(a, δ)δ with λ_X = −1 (Weil I (4.1): x − (x, δ)δ for n ≡ 1 mod 4).

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 2.2.5 D, (2.2.5.3)–(2.2.5.6), p. 21. The character ε and the variation formula (2.2.5.6), read on the page image. Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 2.2.5 F, p. 21. The odd case: trivial action on the cohomology of X_η̄ and (2.2.5.9)–(2.2.5.10) on pp. 21–22. Transcribed from the page image.

### Theorem. Local description of the vanishing cycle

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.localDescriptionOfTheVanishingCycle`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/local-description-of-the-vanishing-cycle`.

Let S be a henselian trait (s, η, s̄, η̄ as in SGA 7 XIII 0.2.5), Λ = ℤ/k with k invertible on S, and X ⊂ 𝔸^{n+1}_S a standard quadratic degeneration: Q = Σ_{i≤j} a_ij x_i x_j + Σ b_i x_i + c, with Y smooth over S and X_s̄ a quadratic cone with vertex x₀. Assume X_η smooth and S strictly henselian. (n even) ±δ is determined by (2.2.5.3)–(2.2.5.4), which for k a power of an odd prime amounts to (δ, δ) = (−1)^m·2; in general ±δ is the image of any class δ̃ with coefficients in ℤ/2^a k (a large) satisfying (δ̃, δ̃) = (−1)^m·2 and compatible with the reductions to the prime-power factors. (n = 2m + 1 odd, so x₀ is rational) Let X_{s(0)} be the henselisation of X_s at x₀, X̃_{s(0)} its blow-up at x₀, Y₀ the exceptional divisor (a smooth quadric of dimension 2m) and X*_{s(0)} = X_{s(0)} − {x₀}. The composite (2.2.6.2) H^{n−1}(Y₀, Λ(m)) ≅ H^{n−1}(X̃_{s(0)}, Λ(m)) → H^{n−1}(X*_{s(0)}, Λ(m)) → H^n_{x₀}(X_s, Λ(m)) → H^n_{x₀}(X_s, RΨ_η̄Λ(m)) identifies the last group with the primitive quotient of H^{2m}(Y₀, Λ(m)), and ±δ is the image of the natural generators of that primitive quotient.

**Hypotheses.**

- The source asserts the characterisation by (δ, δ) = (−1)^m·2 whenever 2 ∤ k; for k with two distinct odd prime factors it fails (source issue E11).

**Construction or proof.**

1. n even: if δ₁ is another generator with (δ₁, δ₁) = (δ, δ), then δ₁ = uδ with u² = 1 in ℤ/k; u = ±1 exactly when ℤ/k has no other square roots of 1, that is, when k is a power of one odd prime. In general one fixes δ through the ℓ-adic or ℤ/2^a k classes of XII 3.7.
2. n odd: ±δ is determined by its image in H^n_c(X_η̄, Λ(m)); by (2.1.7.1) it suffices that H^{n−1}(Y₀) ≅ H^{n−1}(X̃_s) → H^{n−1}(X*_s) → H^n_{x₀}(X_s) → H^n_c(X_s) → H^n_c(X_η̄) (the last map sp) sends the distinguished generators of the primitive quotient to those of the target.
3. By the anticommutativity lemma, this composite is, up to sign, the boundary ∂ : H^{n−1}(Y_s) → H^n_c(X_s) followed by specialisation, that is, the boundary H^{n−1}(Y_η̄) → H^n_c(X_η̄) of XII 3.6, which maps the generators of the primitive quotient to ±δ (XII 3.7).

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/variation-in-a-standard-quadratic-degeneration`, `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-punctured-cone`, `LefschetzPencilsAndVanishingCycles:LPV.2/boundary-anticommutativity-for-a-cone`, `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics`, `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-smooth-quadrics`.

**Acceptance.**

- n = 1, xy = π: Y₀ is the two tangent directions at the node, H⁰(Y₀) = Λ², its primitive quotient is Λ, and δ generates H¹_c(X_η̄) = H¹_c(𝔾_m).
- k = 15, m even: u = 4 satisfies u² ≡ 1, so 4δ also has (4δ, 4δ) = 2, and the characterisation by (δ, δ) alone does not single out ±δ.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, 2.2.6, p. 22. The local description, including (2.2.6.1). Transcribed from the page image.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), Exposé XV, Lemme 2.2.7, pp. 22–23. The identification through (2.2.6.2), proved on p. 23 by applying 2.1.8. Transcribed from the page image.

### Comparison. Complex comparison and the Picard–Lefschetz sign table

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.complexPicardLefschetzComparison`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/complex-picard-lefschetz-comparison`.

For an algebraic ordinary quadratic degeneration over C, compare the finite-coefficient étale specialization triangle, inertia and the primitive-quadric vanishing generator with the classical Milnor-fibre triangle and positively oriented small loop. Cup products, trace and Tate orientation are part of the comparison. For n modulo 4 equal to 0,1,2,3, the Picard–Lefschetz coefficient is respectively −,−,+,+ and the vanishing self-pairing is 2,0,−2,0. The complex comparison is a verification of conventions, not the algebraic proof in positive characteristic.

**Hypotheses.**

- Algebraic finite-type complex family with a single ordinary quadratic critical point; properness for the global sequence
- Finite coefficients, then adic realization; compatible loop and Tate orientations

**Construction or proof.**

1. Import the PR196 ComplexComparison relative comparison, cup-product and trace compatibility, and Riemann-existence path identification.
2. Use the ordinary local normal form to identify the algebraic primitive quadric generator with the Milnor vanishing sphere up to sign.
3. Compare the specialization exact sequences and their monodromy operators.
4. Check the four coefficient/self-pairing entries from Weil I 4.1; changing δ to −δ leaves the operator unchanged.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-description-of-the-vanishing-cycle`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.6`.

**Acceptance.**

- The n=0 model z²=t exchanges the two points and δ=(1,−1) has square 2.
- The n=1 nodal Milnor fibre gives a transvection with coefficient − and δ²=0.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4.1, pp. 287–288. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Wild quadratic-character branch

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.wildQuadraticPicardLefschetz`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/quadratic-character-in-characteristic-two`.

In even fibre dimension and residue characteristic two, the ordinary quadratic vanishing stalk is still rank one, but the inertia character is the separable quadratic character of the even Clifford center of the generic quadratic model. It can be wildly ramified, so it is not replaced by the unique tame quadratic character used when p≠2. The rational local monodromy formula is x↦x+(-1)^m((ε_x(σ)−1)/2)(x,δ)δ, with δ²=(-1)^m·2; the finite even-coefficient formula is defined by lifting before dividing by two.

**Hypotheses.**

- Ordinary quadratic point; even relative dimension; smooth generic fibre
- Rational ℓ-adic coefficients with ℓ≠2, or the finite-level lift convention
- The character may be trivial; a nontrivial reflection is asserted only where ε_x(σ)=−1

**Construction or proof.**

1. Apply the general even variation theorem and identify the Clifford-center separable extension.
2. In characteristic two retain the linear x₀ term of the local model; its discriminant extension is not tame Kummer of a uniformizer.
3. Use the rational pairing normalization to obtain the reflection, keeping the finite-level lifting convention for the division by two.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2`, `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point`, `ArithmeticGaloisRepresentations:R01.2`.

**Acceptance.**

- For a characteristic-two zero-dimensional separable quadratic family the two generic points are exchanged by the wild quadratic character.
- Tame-generation conclusions of LPV.5 are not applied to this wild branch without their additional hypotheses.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 4.2.1–3, pp. 220–221. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Isolated nonordinary quadratic concentration

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.nonordinaryQuadraticConcentration`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/isolated-nonordinary-quadratic-concentration`.

For the isolated quadratic hypersurface singularities in residue characteristic two covered by Illusie’s 2003 Corollary 2.10, including the nonordinary singularities used by Fresán–Sabbah–Yu §5.1.3, R^iΦ Q_l is zero outside the middle degree n. This gives injective specialization H^n(X_s̄)→H^n(X_η̄) in the proper setting. No rank-one, reflection, or ordinary-quadric generator assertion is made for these nonordinary stalks.

**Hypotheses.**

- Isolated quadratic hypersurface singularity in the precise 2003 corollary’s class; ℓ≠2
- The original corollary’s complete hypotheses remain source gap G-nonordinary; FSY supplies the verified application
- Properness for the stated global injection

**Construction or proof.**

1. Use FSY’s explicit characteristic-two isolated quadratic local equation to identify the application.
2. Import the middle-concentration result from Illusie 2003 Corollary 2.10, retaining its unresolved original-source hypothesis check.
3. Apply the proper specialization triangle; vanishing below n makes the middle specialization injective.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`.

**Acceptance.**

- The characteristic-two FSY boundary singularity is routed here, rather than to the ordinary rank-one theorem.
- The exact sequence retains the actual middle vanishing-stalk dimension as a parameter.

**Sources.**

- [Javier Fresán, Claude Sabbah and Jeng-Daw Yu, Hodge theory of Kloosterman connections](https://arxiv.org/pdf/1810.06454), §5.1.3, pp. 43–44; citation [25, Corollary 2.10]. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Application. Fresán–Sabbah–Yu quadratic discriminant example

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.fsyDiscriminantExample`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.2/fsy-discriminant-example`.

In the odd-prime ordinary quadratic models of FSY §5.1.3 with k=2m+1, the orthogonal vanishing line has square (-1)^m·2, Tate twist −m, and the quadratic Galois character of the explicitly computed Hessian determinant. The paper identifies its field by adjoining a square root of (-1)^((1+ap)/2)·2ap. This is a worked check of the even-dimensional Picard–Lefschetz discriminant interface; the motives’ weight and Hodge conclusions remain with their owners.

**Hypotheses.**

- The FSY §5.1.3 ordinary points and odd prime p; the paper’s a,p indexing
- Even fibre dimension k−1=2m

**Construction or proof.**

1. Compute the ordinary tangent quadratic form in the paper’s local coordinates.
2. Apply the Clifford/discriminant character theorem and the self-pairing normalization.
3. Compare with the determinant and quadratic field displayed by FSY, retaining its Tate twist.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2`, `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics`, `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric`, `ArithmeticGaloisRepresentations:R01.2`.

**Acceptance.**

- The displayed square-class, twist −m and self-pairing are all checked together.
- The characteristic-two example is governed by the separate nonordinary-concentration node.

**Sources.**

- [Javier Fresán, Claude Sabbah and Jeng-Daw Yu, Hodge theory of Kloosterman connections](https://arxiv.org/pdf/1810.06454), §5.1.3, pp. 41–43, determinant and vanishing-line character. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

## LPV.3 — Existence of sufficiently ample Lefschetz pencils

A Lefschetz pencil is a geometric incidence family with transverse axis, smooth total space and a unique ordinary quadratic point in each singular fibre. The incidence family is identified with the blowup along the axis intersection using the general blowup owner. The dual variety is the reduced conormal image. It includes hyperplanes containing X even when their sections are smooth of excess dimension; projective space has empty dual, and a proper linear subspace has a dual of codimension at least two.

After a Veronese re-embedding of degree at least two, the ordinary-axis locus is a nonempty open. The degree-two jet argument has a defect and a separate linear-variety quadratic branch: it does not assert arbitrary independent two-point one-jet interpolation. Characteristic-two Gauss inseparability and the low-dimensional cases are explicit. A nonempty finite-type axis open over a finite field has a closed point over a finite extension, yielding a descended good pencil. An original embedding such as a Hermitian curve need not admit an ordinary tangent pencil.

**Stage:** `LefschetzPencilsAndVanishingCycles:LPV.3`.

**Planets:** Lefschetz pencil; Existence of Lefschetz pencils; Finite-field pencil descent.

### Definition. Lefschetz pencil of hyperplane sections

**Declaration:** `TauCeti.AlgebraicGeometry.LefschetzPencil.IsLefschetzPencil`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil`.

Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. For a linear subspace A ⊂ P of codimension 2 (the axis), let D ⊂ P̌ be the dual line of hyperplanes containing A, X_t = X ∩ H_t for t ∈ D, X̃ = {(x, t) ∈ X × D : x ∈ H_t} with projections π : X̃ → X and f : X̃ → D, so that f^{-1}(t) = X_t. The family (X_t)_{t∈D} is a Lefschetz pencil if: (A) A is transverse to X, so that π : X̃ → X is the blow-up of X along A ∩ X and X̃ is smooth; (B) there are a finite subset S ⊂ D and points x_s ∈ X_s (s ∈ S) such that f is smooth outside {x_s : s ∈ S}; (C) each x_s is an ordinary quadratic singular point of X_s. Then, for each s ∈ S, the local theory applies to the henselisation D_s of D at s and X̃ ×_D D_s.

**Hypotheses.**

- Transversality of A means A ∩ X is smooth of codimension 2 in X, or empty.
- Ordinary quadratic singular points are those of the LPV.2 node ordinary-quadratic-point (SGA 7 XV 1.2.1).

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

**Unit tests.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.line_in_plane` (degenerate) — X a line in P², A a point not on X: every line through A meets X transversally in one point, so S = ∅ and f : X̃ = X → D is an isomorphism. This is a Lefschetz pencil with no singular fibre.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.quadric_surface` (value) — X a smooth quadric surface in P³, p ≠ 2, A a general line: S has two points, each X_s is a pair of lines meeting in one point, and X̃ is X blown up in the two points of A ∩ X; χ(X̃) = 6 = 2·2 + 2·1.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.cubic_surface` (value) — X a smooth cubic surface in P³, p = 0, A a general line: |S| = 12, the degree 3·2² of the dual surface, each X_s a plane cubic with one node; χ(X̃) = 9 + 3 = 12 = 2·0 + 12·1.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.hermitian_curve_not_lefschetz` (non-example) — p odd, q = p^e, X = {x^{q+1} + y^{q+1} + z^{q+1} = 0} ⊂ P²: along the tangent direction (u, v) at an affine point (a, b), with a^q u + b^q v = 0, one has F(a + tu, b + tv) = t^q(a u^q + b v^q) + t^{q+1}(u^{q+1} + v^{q+1}). So every tangent line meets X with multiplicity ≥ q ≥ 3 at its point of tangency, condition (C) fails, and no pencil of lines is Lefschetz in this embedding.

**Construction or proof.**

1. Define X̃ as the closed subscheme of X × D cut out by the incidence x ∈ H_t, a bilinear equation in the coordinates of P and D.
2. Under (A), identify X̃ with the blow-up of X along A ∩ X: A ∩ X is cut out by the two linear forms defining D, and X̃ is their graph closure (EDC.4's blow-up along a smooth centre of codimension 2).
3. Condition (B) makes S finite with f smooth elsewhere; condition (C) is LPV.2's local condition at x_s.

**Direct dependencies:** `EtaleDualityAndPerverseSheaves:EDC.4`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`, `LefschetzPencilsAndVanishingCycles:LPV.2/non-smooth-points-near-an-ordinary-quadratic-point`.

**Acceptance.**

- A line in P² (no singular fibre), the quadric surface (two nodal fibres, δ = 0), the cubic surface (twelve nodal fibres), and the Hermitian curve, where condition (C) fails in the original embedding.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.1), p. 289. The pencil of hyperplanes containing the axis A and the diagram X ← X̃ → D (5.1.1).
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.6), p. 291. The definition, with conditions A)–C) over an algebraically closed field.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.6), p. 292. The local theory of §4 applies at each s ∈ S.

### Definition. The dual variety and the incidence family

**Declaration:** `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`.

Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. Let Y = {(x, t) ∈ X × P̌ : x ∈ H_t} with g : Y → P̌, whose fibre over t is X_t = X ∩ H_t. The dual variety X̌ ⊂ P̌ is the set of t such that H_t is tangent to X, that is, X_t is singular or X ⊂ H_t. It is closed and irreducible, and g is smooth outside g^{-1}(X̌). For a Lefschetz pencil with parameter line D, S = D ∩ X̌.

**Hypotheses.**

- X smooth, connected and projective; irreducibility of X̌ comes from its description as the image of the conormal variety, a projective bundle over X.

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

**Unit tests.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_projectiveSpace` (degenerate) — X = P: every H_t ∩ P = H_t is smooth and P ⊄ H_t, so X̌ = ∅.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_linear` (value) — X a linear subspace of dimension d, 1 ≤ d < N: X ∩ H_t is always smooth, so X̌ = {t : X ⊂ H_t}, a linear subspace of codimension d + 1 ≥ 2, not a hypersurface.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_conic` (value) — X the conic xz = y² in P², p ≠ 2: X̌ is the conic of lines (a : b : c) with b² = 4ac.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_conic_char_two` (non-example) — p = 2, X the conic xz = y²: the tangent line at (s² : st : t²) is t²x + s²z = 0, which passes through the nucleus (0 : 1 : 0). So X̌ is a line in P̌² and X → X̌ is purely inseparable of degree 2, not the dual conic.

**Construction or proof.**

1. The conormal variety C = {(x, t) : x ∈ X, T_xX ⊂ H_t}, T_xX the projective tangent space, is a projective bundle over X with fibres P^{N−n−2} (empty when N = n + 1), hence irreducible; X̌ is its image in P̌, closed and irreducible.
2. t ∉ X̌ exactly when X ∩ H_t is smooth of dimension n (the Jacobian criterion at each x ∈ X ∩ H_t), which is the smoothness of g at the points of g^{-1}(t).
3. For a pencil, t ∈ D lies in S exactly when X_t is singular, that is, t ∈ X̌ (X ⊂ H_t cannot happen for t ∈ D: A ∩ X has codimension 2 in X).

**Direct dependencies:** `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:key/henselization`.

**Acceptance.**

- X = P gives X̌ = ∅; a smooth plane conic has the dual conic for p ≠ 2 and a line for p = 2.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, proof of (5.4), p. 290. The dual variety X̌: the t such that H_t is tangent to X (X_t singular or X ⊂ H_t); it is irreducible (p. 291).

### Theorem. Existence of Lefschetz pencils after a Veronese re-embedding

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.existenceOfLefschetzPencils`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`.

Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. For r ≥ 1 let i_r : P → P^{C(N+r, N) − 1} be the Veronese embedding by the monomials of degree r, whose hyperplane sections are the degree-r hypersurfaces of P. If r ≥ 2 and X is embedded by i_r ∘ i_1, then every sufficiently general pencil of hyperplane sections is a Lefschetz pencil: the axes A for which (X_t)_{t∈D} is a Lefschetz pencil contain a nonempty open subset of the Grassmannian of codimension-2 linear subspaces. Equivalently, a sufficiently general pencil of degree-r hypersurface sections of X is Lefschetz. For r = 1 and p ≠ 0 there may be no Lefschetz pencil of hyperplane sections at all.

**Hypotheses.**

- k algebraically closed.
- r ≥ 2 in the positive statement; the r = 1 failure needs p ≠ 0.

**Construction or proof.**

1. Use the Veronese ordinary-axis open and its degree-two-aware jet estimate from XVII §§3–4.
2. Choose an axis in that nonempty open, with the curve/empty-center branch included.
3. Use the incidence blowup to obtain the smooth projective total space and hyperplane fibres.
4. The ordinary one-point conditions give finitely many critical fibres; no universally étale Gauss map is assumed.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.3/ordinary-axis-open-and-jet-separation`, `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`, `SchemeAndStackFoundations:SF.0`.

**Acceptance.**

- The Hermitian curve of degree q + 1 in characteristic p odd has no Lefschetz pencil of lines, while a general pencil of conics (r = 2) is Lefschetz.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.7), p. 292. For p ≠ 0 the given embedding may admit no Lefschetz pencil.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.7), p. 292. For r ≥ 2 a sufficiently general pencil of degree-r hypersurface sections is Lefschetz; the dimension of the Veronese space, C(N+r, N) − 1, was read on the page image.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.13) C), p. 294. The proof is SGA 7 XVII.

### Theorem. Ordinary axis open and Veronese jet estimates

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.ordinaryAxisOpen`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.3/ordinary-axis-open-and-jet-separation`.

For a smooth projective connected X of positive dimension, after a Veronese embedding of degree r≥2 the hyperplanes whose section has exactly one ordinary quadratic singularity form a dense open in the relevant dual locus, and the locus of bad hyperplanes has codimension at least two in the dual projective space. Together with transversality of the base axis this gives a nonempty open of good pencil axes. Degree two requires the separate two-point jet estimate: the common mixed coefficient can reduce the number of independent conditions by one when the joining line lies in both tangent spaces; the linear-X case is treated by an explicit quadratic pencil.

**Hypotheses.**

- Smooth connected projective X; dim X≥1; algebraically closed base; r≥2
- The good-axis conditions concern ordinary singularities, not separability of the Gauss map in all characteristics

**Construction or proof.**

1. Use the degree-r one-jet map and prescribe a nondegenerate quadratic two-jet at one point.
2. Bound sections with nonordinary singularity using the quadratic-form open.
3. Estimate the two-singular-point incidence, separating r≥3 from r=2 and its common-coefficient defect; handle linear X explicitly.
4. Combine these codimension bounds with the open transversality condition on the axis.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`, `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:key/henselization`.

**Acceptance.**

- A degree-two embedding of a linear variety is covered by the explicit quadratic-pencil branch.
- The degree-two proof does not assert surjectivity onto two arbitrary independent one-jet spaces.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), XVII 2.5, 3.2–7 and 4.1–2. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Incidence pencil and its blowup description

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.incidencePencilBlowup`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.3/incidence-pencil-blowup`.

Let X⊂P be smooth projective and A a codimension-two axis meeting X transversely. The incidence family X̃={(x,H):x∈X∩H, H⊃A} over the dual line D is canonically Bl_(A∩X)X, with the actual hyperplane fibres. The center is smooth of codimension two when nonempty, X̃ is smooth, and f:X̃→D is projective. For a curve the general axis misses X, the center is empty and the blowup is X.

**Hypotheses.**

- Smooth projective X; transverse axis; dim X≥1
- Empty center allowed in dimension one

**Construction or proof.**

1. Write the incidence equation s₀u₁−s₁u₀=0 using the two sections cutting out the axis.
2. Use the Rees-algebra universal property and regular-sequence condition to identify it with the blowup.
3. Verify smoothness in its two coordinate charts and projectivity of the pencil map.
4. Treat the empty-center case using the universal property.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:SF.1`.

**Acceptance.**

- A quadric-surface pencil blows up the two points of its axis intersection.
- A line in P² with a disjoint point axis has total space X and no critical fibre.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), XVIII §§2–3; XVII 2.2. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Finite-extension descent of good axes

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.finiteFieldPencilDescent`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.3/finite-field-pencil-descent`.

A nonempty good-axis open defined over F_q has a point over some finite extension F_(q^r). The resulting axis, finite singular set and ordinary local models descend at finite presentation to that finite extension. After this base extension arithmetic Frobenius is Frob_q^r on the original cohomology, and the pencil can be supplied to the DWP.4 dimension induction. The open need not have an F_q-rational point.

**Hypotheses.**

- Smooth projective variety over F_q; Veronese degree≥2; geometrically nonempty good-axis open
- Finite-presentation descent; ℓ≠p

**Construction or proof.**

1. Construct the Galois-stable good-axis open using the jet/codimension proof.
2. Use the residue field of a closed point of this finite-type F_q open to obtain a finite extension.
3. Descend the incidence equation and all finite-presentation local conditions.
4. Transport the ℓ-adic realization and identify Frob_(q^r)=Frob_q^r before the weight-roadmap application.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.3/ordinary-axis-open-and-jet-separation`, `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`, `ArithmeticGaloisRepresentations:R01.2`, `FiniteFieldsAndCharacterSums:FF.0`.

**Acceptance.**

- The descent theorem supplies a finite extension rather than claiming a rational axis over every small finite field.
- A Frobenius eigenvalue α becomes α^r after extension; the supplier’s weight descent uses this power relation.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §7.1, p. 299, choice of pencil after finite extension. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Comparison. Inseparable Gauss map and low-dimensional pencil cases

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.inseparableGaussPencilCases`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.3/inseparable-gauss-and-low-dimension`.

In characteristic two and even fibre dimension n, the ordinary hyperplane locus can have an inseparable Gauss map; a Lefschetz axis is not required to meet the reduced dual transversely as if that map were étale. For a linear X the dual has codimension at least two and a general pencil can have no singular fibres; for X=P the dual is empty. A curve has an empty general base axis. Connected-fibre cohomology arguments are applied only in dimensions where the weak Lefschetz connectedness hypotheses hold, with n=0 handled by finite fibres.

**Hypotheses.**

- The all-characteristic ordinary-pencil definition of XVII 2.2
- Separate n=0, empty-dual and dual-defective cases

**Construction or proof.**

1. Use the Hessian/Gauss differential criterion of XVII 3.3–5.
2. Separate the characteristic-two parity where ordinary does not imply nondegenerate polar Hessian.
3. Apply the codimension-two bad-locus existence criterion directly, without an invalid reduced-dual transversality requirement.
4. Check the linear and curve models and the dimension hypotheses for connected fibres.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`, `LefschetzPencilsAndVanishingCycles:LPV.3/ordinary-axis-open-and-jet-separation`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`, `EtaleDualityAndPerverseSheaves:EDC.4`.

**Acceptance.**

- The characteristic-two conic has a line as reduced dual and purely inseparable degree-two Gauss map.
- The line-in-plane pencil has finite singleton fibres and no singular locus.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 4.2.1–3 and 4.2.7, pp. 220–222. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

## LPV.4 — Global vanishing cycles and middle-degree reduction

Transport each local generator along every étale path and take the stable span E. The individual vector depends on its path, while E does not. Local transvections have common fixed space E⊥. Equality with global invariants uses the tame generation/conjugacy input, which is kept distinct from the linear fixed-space calculation.

The reusable symplectic representation lives on V=E/(E∩E⊥), with its nondegenerate descended pairing. E itself can be degenerate. General projective-bundle, blowup, weak-Lefschetz and purity formulas are imported. This stage owns their pencil specialization, the restriction/Gysin maps, the exceptional sign and the Leray middle-degree subquotient. The reduction does not assume hard Lefschetz or an unproved E₂ splitting. The zero vanishing space of the quadric-surface pencil and hypersurface cohomology outside the middle degree are explicit acceptance cases.

**Stage:** `LefschetzPencilsAndVanishingCycles:LPV.4`.

**Planets:** Vanishing subspace; Pencil restriction and Gysin; Middle-degree reduction.

### Theorem. The cohomology sheaves of a Lefschetz pencil

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.cohomologySheavesOfALefschetzPencil`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. R^n f_*ℚ_ℓ is lisse on U and tamely ramified at each s ∈ S. (a) If the vanishing cycles are nonzero: R^i f_*ℚ_ℓ is constant on D for i ≠ n, and R^n f_*ℚ_ℓ = j_*j^*R^n f_*ℚ_ℓ. (b) If they are zero (possible only for n = 2m + 1 odd): R^i f_*ℚ_ℓ is constant for i ≠ n + 1, there is an exact sequence 0 → ⊕_{s∈S} ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → ℱ → 0 with ℱ constant, and E = 0. If one vanishing cycle is zero, all are.

**Hypotheses.**

- The vanishing cycle δ_s is the one of the local theory at s, transported to X_u; being zero does not depend on the transport.

**Construction or proof.**

1. f is smooth and proper over U, so each R^i f_*ℚ_ℓ is lisse on U (smooth and proper base change).
2. At s ∈ S apply the local theory to X̃ ×_D D_s: the inertia at s acts through t_ℓ (n odd) or ε (n even, p ≠ 2), so R^i f_*ℚ_ℓ is tamely ramified at s, and the local description of the Lefschetz-degeneration node holds at s.
3. If δ_s ≠ 0 for all s: for i ≠ n, R^i f_*ℚ_ℓ is lisse near every s, hence lisse on D = P¹; a lisse sheaf on P¹_k is constant because π₁(P¹_k) = 1. In degree n the local statement R^n = j_*j^*R^n at every s gives it globally.
4. If δ_s = 0 for all s: the same argument in degrees i ≠ n + 1; in degree n + 1 the local sequences at the points of S glue to the stated sequence, with ℱ = j_*j^*R^{n+1} f_*ℚ_ℓ lisse on D, hence constant. E is spanned by the δ_s, so E = 0.
5. All δ_s are conjugate up to sign under π₁(U, u) (conjugacy theorem), so one is zero if and only if all are.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.2/direct-images-at-a-lefschetz-degeneration`, `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Acceptance.**

- The quadric-surface pencil (n = 1, |S| = 2) is in case (b): R² f_*ℚ_ℓ has an extra ℚ_ℓ(−1) at each of the two singular fibres.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.8), p. 292. The exclusion of p = 2 with n even, and tame ramification of R^n f_*ℚ_ℓ at each s ∈ S.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.8) a) 1)–2), p. 292. Constancy for i ≠ n and R^n f_* = j_*j^*R^n f_*.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.8) b), p. 293. The exceptional case, with the sequence 0 → ⊕_{s∈S} ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → ℱ → 0, read on the page image.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.13) D), p. 294. The proof of (5.8) is SGA 7 XVIII.

### Construction. The vanishing subspace E of the middle cohomology

**Declaration:** `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. For s ∈ S, an étale path from u to a geometric generic point of D_s transports the local vanishing cycle to δ_s ∈ H^n(X_u, ℚ_ℓ)(m), well defined up to sign once the path is fixed; changing the path changes δ_s by an element of π₁(U, u). Identify ℚ_ℓ(m) with ℚ_ℓ by a generator of ℤ_ℓ(1) (k is algebraically closed). The vanishing subspace E ⊂ H^n(X_u, ℚ_ℓ) is the span of all transports gδ_s (g ∈ π₁(U, u), s ∈ S). It does not depend on the paths and is π₁(U, u)-stable. For suitable paths (tame generators), E is already spanned by the δ_s, s ∈ S (monodromy-generation theorem).

**Hypotheses.**

- Only E is independent of the paths, not the individual oriented vectors δ_s.

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

**Unit tests.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_eq_bot_of_no_singular_fibre` (degenerate) — If S = ∅ (a line in P²) then E = 0.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_quadric_surface` (value) — Quadric-surface pencil: |S| = 2 but each δ_s lies in H^1 of a conic, which is 0, so E = 0 (case (b)).
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_conic` (value) — n = 0, X a smooth conic in P², p ≠ 2, A a general point: X_u is two points, |S| = 2 (the tangents from A), δ_s = ±(e₁ − e₂) for both s, E = ℚ_ℓ(e₁ − e₂) and E^⊥ = ℚ_ℓ(e₁ + e₂).
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle_depends_on_path` (non-example) — n odd, s ≠ s′ with (δ_s, δ_{s′}) ≠ 0: transporting δ_s around s′ gives δ_s ± t(δ_s, δ_{s′})δ_{s′} ≠ ±δ_s, so the individual vanishing cycles depend on the path while E does not.

**Construction or proof.**

1. Transport: the local vanishing cycle lives in H^n of the geometric generic fibre of X̃ ×_D D_s; a path identifies that fibre functor with the one at u.
2. Path independence and stability: a change of path is an element of π₁(U, u), so the set of all transports is π₁-stable and its span E is π₁-stable and path-free.
3. Local monodromy: the Picard–Lefschetz formula, transported along the path.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Acceptance.**

- E = 0 for the quadric-surface pencil and E = ℚ_ℓ(e₁ − e₂) for the conic pencil.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.2), p. 290. E is the span of the vanishing cycles (the complex case).
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.8) a) 3), p. 292. E ⊂ H^n(X_u, ℚ_ℓ) in the ℓ-adic setting, stable under π₁(U, u).

### Lemma. The common fixed space of the local transvections is E^⊥

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.fixedSpaceOfTheLocalTransvections`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.4/fixed-space-of-the-local-transvections`.

Let V be a finite-dimensional vector space over a field K with a symmetric or alternating bilinear form ( , ), (δ_s)_{s∈S} a finite family in V, E = span(δ_s), and T_s(x) = x + c_s(x, δ_s)δ_s with c_s ∈ K^× (Mathlib's LinearMap.transvection; a transvection when (δ_s, δ_s) = 0 and a reflection when c_s(δ_s, δ_s) = −2). Then ⋂_s Fix(T_s) = E^⊥ = {x : (x, δ_s) = 0 for all s}.

**Hypotheses.**

- c_s ≠ 0 for every s. If δ_s = 0 then T_s = id and δ_s contributes nothing to E.

**Construction or proof.**

1. T_s x = x if and only if c_s(x, δ_s)δ_s = 0 (LinearEquiv.mem_fixedSubmodule_transvection_iff when (δ_s, δ_s) = 0; the same computation for a reflection).
2. For δ_s ≠ 0 and c_s ≠ 0 this says (x, δ_s) = 0; for δ_s = 0 it is automatic.
3. Intersecting over s gives {x : (x, δ_s) = 0 ∀ s} = E^⊥ (LinearMap.BilinForm.orthogonal of the span).

**Direct dependencies:** `mathlib:LinearEquiv.transvection`, `mathlib:LinearEquiv.mem_fixedSubmodule_transvection_iff`, `mathlib:LinearMap.BilinForm.orthogonal`.

**Acceptance.**

- V a symplectic plane and one δ ≠ 0: Fix(T) = ℚ_ℓδ = δ^⊥; for δ = 0, T = id and Fix(T) = V = E^⊥.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, Proposition (5.3), p. 290. E^⊥ is the monodromy invariants: clear from the local formula (5.2.1), since the γ_s generate.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.3), p. 290. The statement E^⊥ = invariants.

### Construction. The radical quotient E/(E ∩ E^⊥) and its nondegenerate pairing

**Declaration:** `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. With ( , ) = Tr(x ∪ y) the cup-product pairing H^n(X_u) ⊗ H^n(X_u) → ℚ_ℓ(−n), the subspace E ∩ E^⊥ is the kernel of the restriction of ( , ) to E, so ( , ) induces a nondegenerate form ψ : E/(E ∩ E^⊥) ⊗ E/(E ∩ E^⊥) → ℚ_ℓ(−n), alternating for n odd and symmetric for n even. Monodromy respects ψ; for n odd it gives ρ : π₁(U, u) → Sp(E/(E ∩ E^⊥), ψ).

**Hypotheses.**

- The pairing on H^n(X_u) is perfect by Poincaré duality, but its restriction to E can be degenerate: E ∩ E^⊥ may be nonzero, and irreducibility and open image concern the quotient, not E.

**API.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient` (constructor) — E ⧸ (E ⊓ E^⊥), a finite-dimensional ℚ_ℓ-space with a π₁(U, u)-action.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm` (constructor) — ψ, the form induced by Tr(x ∪ y), with values in ℚ_ℓ(−n).
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_nondegenerate` (characterisation) — ψ is nondegenerate.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_isAlt` (characterisation) — ψ is alternating for n odd (LinearMap.BilinForm.IsAlt) and symmetric for n even.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.monodromyRep` (constructor) — ρ : π₁(U, u) →* Sp(vanishingQuotient, ψ) for n odd, continuous.

**Uses.**

- `LefschetzPencilsAndVanishingCycles:LPV.5/absolute-irreducibility-of-the-vanishing-quotient` — the representation whose absolute irreducibility is proved
- `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image` — the target Sp(E/(E ∩ E^⊥), ψ) of the open-image theorem
- `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system` — ℱ₀ = ℰ₀/(ℰ₀ ∩ ℰ₀^⊥) with its perfect alternating pairing
- `DeligneWeightsAndPurity:DWP.3/open-image-in-the-symplectic-similitude-group` — the symplectic target of the geometric monodromy

**Unit tests.**

- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_zero` (degenerate) — If E = 0 (the quadric-surface pencil) the quotient is 0 and ρ is trivial.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_radical` (value) — Linear algebra: in V = ℚ_ℓ⁴ with ω(e₁, f₁) = ω(e₂, f₂) = 1, E = span(e₁, f₁, e₂) has radical E ∩ E^⊥ = ℚ_ℓe₂, and ψ on the 2-dimensional quotient is nondegenerate; for E = span(e₁, e₂), E ∩ E^⊥ = E and the quotient is 0.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_conic` (value) — n = 0 conic pencil: E = ℚ_ℓ(e₁ − e₂), E ∩ E^⊥ = 0 and ψ(δ, δ) = 2 is a symmetric nondegenerate form on a line.
- `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_on_E_degenerate` (non-example) — The restriction of Tr(x ∪ y) to E itself can be degenerate (the radical example), so ρ does not in general land in Sp(E); the target must be the quotient.

**Construction or proof.**

1. The kernel of ( , )|_E is {x ∈ E : (x, y) = 0 ∀ y ∈ E} = E ∩ E^⊥ by definition, so the induced form on the quotient is nondegenerate.
2. Tr(x ∪ y) = (−1)^{n²} Tr(y ∪ x) and x ∪ x = 0 for n odd (graded commutativity), so ψ is alternating for n odd and symmetric for n even.
3. π₁(U, u) acts on H^n(X_u) preserving the cup product and the trace (the trace is π₁-invariant because R^{2n} f_*ℚ_ℓ(n) ≅ ℚ_ℓ on U), and it preserves E, hence E^⊥ and the quotient.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`, `mathlib:LinearMap.BilinForm.orthogonal`, `mathlib:LinearMap.BilinForm.IsAlt`.

**Acceptance.**

- A nontrivial radical, a zero quotient and a nonzero quotient, as in the unit tests.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.9), p. 293. E ∩ E^⊥ is the kernel of the form restricted to E.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.9), p. 293. The induced nondegenerate form ψ with values in ℚ_ℓ(−n).
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.9), p. 293. Parity, and ρ : π₁(U, u) → Sp(E/(E ∩ E^⊥), ψ) for n odd.

### Theorem. Pencil restriction and Gysin formulas

**Declaration:** `TauCeti.AlgebraicGeometry.LefschetzPencil.pencilRestrictionGysin`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-restriction-and-gysin`.

For the transverse-axis pencil with center Z=A∩X and incidence blowup π:X̃→X, the imported codimension-two blowup formula identifies H^i(X̃)=H^i(X)⊕H^(i−2)(Z)(−1) by π* plus exceptional Gysin. The inverse has the exceptional minus sign. For a smooth pencil fibre Y, restriction sends (a,b) to m*a+h*b, while fibre Gysin sends y to (m*y,−h*y), where m:Y→X and h:Z→Y. These formulas identify the lower-dimensional contributions used in DWP.4.

**Hypotheses.**

- Smooth projective X and transverse smooth codimension-two center; Q_l coefficients
- The empty-center curve case has no exceptional summand

**Construction or proof.**

1. Import the general blowup cohomology theorem from EDC.4, rather than proving it here.
2. Compute restriction and fibre Gysin using the exceptional divisor normal bundle.
3. Use EDC.3 self-intersection and projection formulas to check both minus signs.
4. Apply weak Lefschetz below the middle degree to identify the ambient and axis images.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.3/incidence-pencil-blowup`, `EtaleDualityAndPerverseSheaves:EDC.4`, `EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`, `EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`.

**Acceptance.**

- For an empty center the formula reduces to ordinary restriction/Gysin on X.
- For a blown-up surface the exceptional class has square −1, detecting the inverse-sign convention.

**Sources.**

- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf), XVIII §§2–4 and 5.1. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Leray filtration and middle-degree reduction

**Declaration:** `TauCeti.AlgebraicGeometry.LefschetzPencil.pencilMiddleReduction`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-leray-and-middle-reduction`.

For a Lefschetz pencil f:X̃→P¹ with U the smooth locus, the actual Leray spectral sequence and edge maps relate H*(X̃) to H^a(P¹,R^b f*Q_l), with a=0,1,2 only. The known constant direct images outside the middle degree and the possible degree-(n+1) skyscraper terms identify the lower-dimensional pieces. The middle contribution uses H¹(P¹,j*R^n f*Q_l), with the relevant kernel/quotient or filtration specified by the edge maps. No general degeneration at E₂ or hard-Lefschetz-dependent decomposition is assumed.

**Hypotheses.**

- Proper pencil; rational coefficients; tame branch for the local direct-image description
- Any assertion of a split filtration needs the supplier’s extra hypotheses and is not part of this target

**Construction or proof.**

1. Import the actual Rf* Leray spectral sequence and cohomological dimension of P¹ from PR196.
2. Insert the constant/sheaf/skyscraper descriptions of the local-to-global direct images.
3. Compute the edge-map image using the pencil restriction/Gysin formulas.
4. Present middle reduction as the resulting filtration and subquotient, retaining any differential rather than setting it to zero without proof.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-restriction-and-gysin`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.4`.

**Acceptance.**

- The δ=0 case retains the degree-(n+1) skyscraper contribution.
- The dimension induction imports estimates for both X’s axis and the pencil fibres, rather than discarding the blowup summand.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §§6–7, pp. 294–300, pencil reduction. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Comparison. Local fixed space and global invariant interface

**Declaration:** `TauCeti.AlgebraicGeometry.LefschetzPencil.localGlobalFixedComparison`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.4/global-fixed-and-local-fixed-interface`.

The common fixed space of the nontrivial local transvections/reflections is E⊥ by the elementary linear-algebra lemma. It equals the full π₁(U,u)-invariant space only after the algebraic monodromy-generation theorem of LPV.5 is applied. E is the span of all transported local cycles, and E∩E⊥ is the radical of its restricted pairing. These identities do not require hard Lefschetz or nondegeneracy of E itself.

**Hypotheses.**

- Tame pencil branch; Q_l coefficients; all transported cycles included
- For local zero cycles the corresponding operator is identity

**Construction or proof.**

1. Apply the fixed-space lemma to each local operator.
2. Use π₁ stability of the full transported span to identify the common local fixed space.
3. Invoke LPV.5 generation only for the final global-invariant equality.
4. Pass to the radical quotient to obtain the nondegenerate pairing.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.4/fixed-space-of-the-local-transvections`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`, `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections`.

**Acceptance.**

- A three-dimensional subspace of a four-dimensional symplectic space can have a one-dimensional radical.
- The local-to-global equality is not used to prove its own monodromy-generation prerequisite.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5.3 and 5.8–9, pp. 289–292. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Application. Hypersurface cohomology outside the middle degree

**Declaration:** `TauCeti.AlgebraicGeometry.LefschetzPencil.hypersurfaceOutsideMiddle`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.4/hypersurface-outside-middle`.

For a smooth projective hypersurface Y of dimension n over an algebraically closed field, rational ℓ-adic cohomology outside degree n agrees with the projective-space even Tate classes in degrees 0,2,…,2n and vanishes in the other odd degrees, with the dual generators above the middle degree. In a sufficiently ample pencil of hypersurface sections this identifies the constant direct-image pieces and isolates the middle vanishing quotient used by the odd-dimensional Weil-I induction.

**Hypotheses.**

- Smooth hypersurface; ℓ invertible; rational coefficients
- Weak Lefschetz below n and Poincaré duality above n; the middle cohomology is not asserted to be Tate

**Construction or proof.**

1. Import weak Lefschetz and projective-space cohomology.
2. Apply smooth proper duality to identify the degrees above the middle.
3. Insert the result into the direct-image and middle-reduction nodes.
4. Route the tensor-power/weight conclusion of Weil I 5.12 to DWP.4.

**Direct dependencies:** `EtaleDualityAndPerverseSheaves:EDC.4`, `EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-leray-and-middle-reduction`.

**Acceptance.**

- A smooth cubic surface has b₀=b₄=1 and b₁=b₃=0; its b₂ is a middle-degree contribution.
- An odd-dimensional smooth hypersurface has its only possible non-Tate/odd contribution in degree n.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Remark 5.12, p. 294. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

## LPV.5 — Irreducibility and open symplectic monodromy

Bertini is used for the monodromy image of the fixed local system, with finite congruence/Frattini control. A single universal axis open for all finite covers is not asserted. Tame local generators, conjugacy up to sign and the invariant pairing imply absolute irreducibility of the nonzero radical quotient. Handle the zero representation separately.

Rank-one logarithms N(δ):x↦ψ(x,δ)δ generate the symplectic Lie algebra under the stated simple-module hypothesis. A compact subgroup of the fixed Q_ℓ symplectic group is open when its analytic Lie algebra is full. This step uses p-adic exp/log charts and a p-adic closed-subgroup theorem; real Lie theory and openness after an arbitrary coefficient extension do not supply it.

The even orthogonal branch is conditional on nondegeneracy of E and the source's conjugacy/generation hypotheses. Its finite alternative becomes ADE only after rationality, cross-ℓ comparison and the integral positive-definite cycle lattice are supplied. Hard Lefschetz, weight arguments and arithmetic character/gcd consequences retain their external owners. The integral polarization kernel records the failure of rational fixed/vanishing separation.

**Stage:** `LefschetzPencilsAndVanishingCycles:LPV.5`.

**Planets:** Conjugacy of vanishing cycles; Irreducibility of the vanishing quotient; Kazhdan–Margulis theorem; Orthogonal monodromy alternative.

### Theorem. Bertini: a general line sees the whole monodromy of P̌ − X̌

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.bertiniSurjectivityOnFundamentalGroups`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`.

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

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`, `LefschetzPencilsAndVanishingCycles:LPV.3/ordinary-axis-open-and-jet-separation`, `SchemeAndStackFoundations:SF.2`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `SchemeAndStackFoundations:SF.0`, `ArithmeticGaloisRepresentations:R01.2`.

**Acceptance.**

- Over ℂ, for X a smooth conic in P² the dual X̌ is a conic, π₁(P̌² − X̌) = ℤ/2, and a general line D meets X̌ in two points with π₁(D − S) = ℤ mapping onto ℤ/2.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, proof of (5.4), p. 291. Over ℂ: π₁(D − S) → π₁(P̌ − X̌) is surjective for D general.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.8), p. 292. In the algebraic setting Lefschetz's π₁ theorem becomes Bertini's theorem.

### Theorem. The vanishing cycles are conjugate up to sign

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.vanishingCyclesAreConjugate`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. The vanishing cycles ±δ_s (s ∈ S), taken up to sign, are conjugate under π₁(U, u): for s, s′ ∈ S there is g ∈ π₁(U, u) with gδ_s = ±δ_{s′}.

**Hypotheses.**

- The pencil is sufficiently general for the surjectivity onto π₁(P̌ − X̌).

**Construction or proof.**

1. Use the nonempty irreducible dual divisor and its smooth ordinary locus to identify its generic local inertia conjugacy class.
2. Apply the tame Bertini image-surjectivity theorem for the fixed cohomological representation.
3. Transport the primitive vanishing generator along the local inertia conjugacies, obtaining ±gδ.
4. Treat the empty singular set separately; the characteristic-two even branch uses its own transverse-pencil node.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`, `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`, `SchemeAndStackFoundations:SF.2`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Acceptance.**

- The conic pencil (n = 0, p ≠ 2): both vanishing cycles are ±(e₁ − e₂).
- The quadric-surface pencil: both vanishing cycles are 0, consistent with the rule that one zero vanishing cycle forces all to vanish.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, Théorème (5.4), p. 290. The statement over ℂ.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, proof of (5.4), p. 291. Connectedness of the smooth locus of the irreducible X̌ makes the loops γ_x conjugate.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.8), p. 292. In the algebraic proof, Abhyankar's lemma controls the ramification of R^•g_*ℚ_ℓ along the smooth codimension-one locus of X̌.

### Theorem. Monodromy is generated by the local transvections, and E^⊥ is the invariant subspace

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyGeneratedByLocalTransvections`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections`.

Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. For a suitable choice of paths, the image of π₁(U, u) in GL(H^n(X_u, ℚ_ℓ)) is topologically generated by the local monodromies T_s (s ∈ S), with T_s x = x ± (x, δ_s)δ_s for a generator of the inertia at s. Consequently E = span(δ_s : s ∈ S), E^⊥ = H^n(X_u, ℚ_ℓ)^{π₁(U, u)}, and the image of π₁(U, u) in GL(E/(E ∩ E^⊥)) is topologically generated by the maps induced by the T_s.

**Hypotheses.**

- The sign ± is the one fixed by the Picard–Lefschetz formula; for n odd the generator of the inertia is one with t_ℓ(γ_s) a chosen generator of ℤ_ℓ(1).

**Construction or proof.**

1. Use SGA 1 XIII’s algebraic tame presentation of P¹ minus the finite critical set, and identify its local inertia images.
2. Apply the local Picard–Lefschetz formulas to those images; for an odd-dimensional pencil they are transvections.
3. Use continuity and compactness to take the closed subgroup generated by the local images, not merely the abstract subgroup.
4. Combine with the local fixed-space lemma to obtain E⊥=V^π₁. The characteristic-two even wild branch is not inferred from this tame presentation.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`, `LefschetzPencilsAndVanishingCycles:LPV.4/fixed-space-of-the-local-transvections`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- Conic pencil: the image is ℤ/2, generated by the swap of the two points, and the invariants are ℚ_ℓ(e₁ + e₂) = E^⊥.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.8), p. 292. The tame fundamental group of U and the transfer of Lefschetz's arguments.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.8) a) 3), p. 292. The image of π₁ in GL(E/(E ∩ E^⊥)) is topologically generated by the x ↦ x ± (x, δ_s)δ_s, and E^⊥ is the invariant subspace (read on the page image).
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, Proposition (5.3), p. 290. Over ℂ: E is stable and E^⊥ is the invariants because the γ_s generate π₁.

### Theorem. Absolute irreducibility of the vanishing quotient

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.absoluteIrreducibilityOfTheVanishingQuotient`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.5/absolute-irreducibility-of-the-vanishing-quotient`.

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

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate`, `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`.

**Acceptance.**

- The quadric-surface pencil has E/(E ∩ E^⊥) = 0; the conic pencil has a one-dimensional quotient.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, Corollaire (5.5), p. 291. The action of π₁(U, u) on E/(E ∩ E^⊥) is absolutely irreducible.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, proof of (5.5), p. 291. The argument through a vector x with (x, δ_s) ≠ 0 and conjugacy.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.13) D), p. 294. SGA 7 XVIII proves irreducibility of E only when E ∩ E^⊥ = 0; the radical quotient is the general case.

### Lemma. A simple symplectic Lie algebra generated by the x ↦ ψ(x, δ)δ is all of sp (Weil I 5.11)

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.symplecticLieAlgebraGeneratedByTransvections`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.5/symplectic-lie-algebra-generated-by-transvections`.

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

**Direct dependencies:** `mathlib:skewAdjointLieSubalgebra`, `mathlib:LieModule.IsIrreducible`, `mathlib:LinearMap.BilinForm.IsAlt`, `mathlib:IsNilpotent.exp`.

**Acceptance.**

- dim V = 2 with ψ(e₁, e₂) = 1: N(e₁) = −E₁₂ and N(e₂) = E₂₁ generate sl₂ = sp(V, ψ), since their bracket is −H.
- Hypothesis (i) is needed: the Lie algebra spanned by N(e₁) alone is one-dimensional, and V is not a simple module for it.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, Lemme (5.11), p. 293. Hypothesis (i); the statement and hypothesis (ii) read on the page image.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, proof of (5.11), p. 294. The final step: sp(V, ψ) is generated by the N(δ), δ ∈ V.

### Lemma. Compact subgroups of Sp(V)(ℚ_ℓ) with full Lie algebra are open

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.lieAlgebraOfACompactLAdicSubgroup`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.5/lie-algebra-of-a-compact-l-adic-subgroup`.

Let V be a finite-dimensional ℚ_ℓ-vector space with a nondegenerate alternating form ψ and H ⊂ Sp(V, ψ)(ℚ_ℓ) a compact subgroup. Let 𝔏 = {X ∈ gl(V) : exp(tX) ∈ H for all t in some neighbourhood of 0 in ℚ_ℓ}. Then 𝔏 is a ℚ_ℓ-Lie subalgebra of sp(V, ψ); if h ∈ H is unipotent, h = exp(N) with N nilpotent, then N ∈ 𝔏; and if 𝔏 = sp(V, ψ) then H is open in Sp(V, ψ)(ℚ_ℓ).

**Hypotheses.**

- H closed (compact) is essential: the group generated by the local monodromies is dense in the image of π₁, and only its closure is compact.

**Construction or proof.**

1. Fix a lattice V_{ℤ_ℓ} and K = 1 + ℓ^r End(V_{ℤ_ℓ}) with r ≥ 2 (r ≥ 1 for ℓ odd); log and exp are inverse homeomorphisms between K and ℓ^r End(V_{ℤ_ℓ}).
2. H is a closed subgroup of GL(V)(ℚ_ℓ), hence an ℓ-adic Lie group, and H ∩ K contains an open uniform pro-ℓ subgroup H₀ (Lazard). log maps H₀ bijectively onto a ℤ_ℓ-Lie lattice Λ, and 𝔏 = ℚ_ℓΛ is a ℚ_ℓ-Lie subalgebra; it lies in sp(V, ψ) because exp(tX) ∈ Sp for all small t forces X ∈ sp.
3. For h = exp(N) ∈ H unipotent, h^a = exp(aN) ∈ H for a ∈ ℤ_ℓ (H is closed), so ℓ^k N ∈ Λ for k large and N ∈ 𝔏.
4. If 𝔏 = sp(V, ψ), Λ is a lattice of full rank in sp(V, ψ), so H₀ = exp Λ contains exp(ℓ^s sp(V_{ℤ_ℓ}, ψ)) for s large, an open neighbourhood of 1 in Sp(V, ψ)(ℚ_ℓ). So H is open.

**Direct dependencies:** `mathlib:skewAdjointLieSubalgebra`.

**Acceptance.**

- H = Sp(V)(ℤ_ℓ) is compact and open with 𝔏 = sp(V, ψ); H = {1} has 𝔏 = 0; the closure of the group generated by one unipotent exp(N), N ≠ 0, is exp(ℤ_ℓN) with 𝔏 = ℚ_ℓN.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, proof of (5.10), p. 293. The image of ρ is compact, hence an ℓ-adic analytic subgroup, and openness reduces to its Lie algebra being sp.

### Theorem. The Kazhdan–Margulis theorem: the monodromy image is open in Sp

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.kazhdanMargulisOpenImage`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image`.

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

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`, `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections`, `LefschetzPencilsAndVanishingCycles:LPV.5/absolute-irreducibility-of-the-vanishing-quotient`, `LefschetzPencilsAndVanishingCycles:LPV.5/symplectic-lie-algebra-generated-by-transvections`, `LefschetzPencilsAndVanishingCycles:LPV.5/lie-algebra-of-a-compact-l-adic-subgroup`, `ArithmeticGaloisRepresentations:R01.2`.

**Acceptance.**

- V = 0 for the quadric-surface pencil, where the statement is trivial.
- A Lefschetz pencil of plane cubics (X = P² with r = 3): X̃ is P² blown up in 9 points, H^1(X̃) = 0 and f has a section, so the monodromy invariants vanish, E = H^1(X_u) is 2-dimensional with E ∩ E^⊥ = 0, and the image is open in Sp₂(ℚ_ℓ) = SL₂(ℚ_ℓ).

**Sources.**

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, Théorème (5.10), p. 293. The theorem, attributed to Kazhdan and Margulis: the image of ρ is open.
- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, proof of (5.10), p. 293. Reduction to the Lie algebra being sp(E/(E ∩ E^⊥), ψ), then Lemma 5.11.

### Theorem. Characteristic-two transverse-pencil monodromy

**Declaration:** `TauCeti.AlgebraicGeometry.LefschetzPencil.charTwoTransverseMonodromy`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.5/characteristic-two-transverse-monodromy`.

For the characteristic-two even-dimensional branch of Weil II 4.2, retain the actual quadratic inertia characters. For transverse pencils satisfying the specified generic-axis hypotheses, the local cycles at the ordinary critical fibres are conjugate up to sign and their stable span is independent of the chosen generic pencil after the prescribed transports. The existence of the generic-axis open is part of 4.2.7; a blanket tame-generation theorem is not asserted for every characteristic-two pencil.

**Hypotheses.**

- Characteristic two, even fibre dimension; the transverse/generic-axis hypotheses of Weil II 4.2.3–8
- Rational ℓ-adic coefficients ℓ≠2

**Construction or proof.**

1. Use the characteristic-two local formula with its actual quadratic character.
2. Apply the family-of-axes comparison and the good generic-axis open of 4.2.7.
3. Use the conjugacy argument of 4.2.6–8 to compare transported local cycles.
4. Keep this branch separate from the tame P¹ inertia-generator proof.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.2/quadratic-character-in-characteristic-two`, `LefschetzPencilsAndVanishingCycles:LPV.3/ordinary-axis-open-and-jet-separation`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- A wild quadratic local character is retained in the generic-pencil comparison.
- The tame genus-zero presentation is not cited to dispose of wild inertia.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 4.2.3–8, pp. 221–222. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Orthogonal monodromy: open or finite

**Declaration:** `TauCeti.AlgebraicGeometry.LefschetzPencil.orthogonalOpenOrFinite`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.5/conditional-orthogonal-open-or-finite`.

For a pencil in the even-dimensional branch of Weil II 4.4, assume its vanishing space E has already been proved nondegenerate over the fixed Q_l field and the source’s conjugacy and generation hypotheses hold. Its compact geometric monodromy image in O(E) is open or finite. The nondegeneracy of E is an explicit input; in the source it is obtained from hard Lefschetz, so this branch is not used to prove the DWP hard Lefschetz theorem. The odd-dimensional open-Sp theorem instead uses the radical quotient V.

**Hypotheses.**

- Even fibre dimension; nondegenerate E; source 4.4.1 hypotheses
- Compact geometric image over the fixed Q_l coefficient field; zero space handled separately

**Construction or proof.**

1. Use the local reflections and conjugacy on E.
2. Apply the orthogonal-group/Lie alternatives in Weil II 4.4.1–4.
3. Use compact ℓ-adic Lie theory for the positive-dimensional open case.
4. Keep the hard-Lefschetz proof of the nondegeneracy input with DWP.5; do not create a dependency back from the odd core.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate`, `LefschetzPencilsAndVanishingCycles:LPV.5/lie-algebra-of-a-compact-l-adic-subgroup`, `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2`, `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation`.

**Acceptance.**

- For the conic pencil the one-dimensional orthogonal image is finite of order two.
- An isotropic or degenerate E does not satisfy the theorem’s nondegeneracy hypothesis.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 4.4.1–4, pp. 225–227. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Finite orthogonal monodromy and ADE lattices

**Declaration:** `TauCeti.AlgebraicGeometry.LefschetzPencil.finiteOrthogonalADE`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.5/finite-orthogonal-ade`.

In the nonzero finite-monodromy case of the preceding even-dimensional theorem, and with the integral/rationality inputs of Weil II 4.4.5–9, the integer lattice generated by all vanishing cycles has an integral positive-definite root pairing after the source’s sign normalization. It is a simply-laced irreducible ADE root lattice, and monodromy is its Weyl group. The rationality and cross-ℓ character arguments are supplied externally; they are not inferred from compactness alone.

**Hypotheses.**

- Even dimension; nonzero nondegenerate E; finite monodromy
- Integral vanishing lattice and the character/integrality hypotheses of Weil II 4.4.5–9

**Construction or proof.**

1. Use the externally supplied rational character comparison and integrality to descend the cycle span to a rational lattice.
2. Normalize the sign of the pairing so each vanishing root has square two.
3. Use conjugacy and local reflections to identify the irreducible root system and its Weyl group.
4. Import the ADE classification from RootSystems. The unread interior 4.4.5–7 remains gap G-orthogonal-integrality.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.5/conditional-orthogonal-open-or-finite`, `DeligneWeightsAndPurity:DWP.4`, `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-4-the-arithmetic-of-character-values`, `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-5-dynkin-diagrams-and-the-cartan-killing-classification`.

**Acceptance.**

- The conic-pencil root δ=(1,−1) gives A₁ and its order-two Weyl group.
- The integral lattice is not replaced by an arbitrary Q_l lattice without the source’s rationality hypotheses.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 4.4.8–9, pp. 229–230. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Application. Integral failure and arithmetic consequence routing

**Declaration:** `TauCeti.AlgebraicGeometry.LefschetzPencil.integralVanishingFailure`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.5/integral-failure-and-arithmetic-routing`.

Weil II 4.3.10 identifies the integral intersection of vanishing cycles and fixed classes with the kernel of the polarization map; torsion can make it nonzero. Thus a rational nondegeneracy conclusion cannot be exported integrally without its extra hypotheses. The character/rationality consequences and divisor-degree gcd estimates of 4.5.1–2 are consumers of the monodromy theorem plus DWP and trace/character suppliers, not new proofs of weights in LPV.

**Hypotheses.**

- Integral Z_l cohomology for the failure example; rational coefficients for the monodromy consequence
- The 4.5 gcd application retains its source’s geometric and rationality hypotheses

**Construction or proof.**

1. Record the exact integral polarization-kernel obstruction in 4.3.10.
2. Check the rational radical-quotient construction remains valid without asserting integral splitting.
3. Route the character/gcd conclusions to DWP.4 and the upstream trace/character owners with their precise input contracts.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`, `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image`, `DeligneWeightsAndPurity:DWP.4`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- A polarization divisible by ℓ can leave an integral torsion kernel, so the rational statement is not copied with Z_l coefficients.
- The gcd theorem is not used as an input to the geometric local monodromy proof.

**Sources.**

- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), 4.3.10 and 4.5.1–2, pp. 224–225, 231–234. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

## LPV.6 — Perverse nearby cycles and comparison interfaces

Use the perverse t-structure supplied by EtaleDualityAndPerverseSheaves, with its trait dimension function and finite/integral/rational coefficient conventions. The exact functors are RΨ[−1] and RΦ[−1]. Verdier duality, inertia and the twist must agree. Intermediate extension is the image of !→*: its exchange is asserted only when both ! and * comparison maps are invertible in the specified square.

The Igusa consumer is IgusaVarietiesAndTorsionConcentration:IG.4. Its finite-level formal models and transition maps are external geometry. Their uniformly bounded semiperverse complexes pass to the enlarged étale derived category, which must permit nonconstructible filtered colimits. Stalk/costalk commutation uses finite cohomological dimension and the qualified support hypotheses; constructibility of the colimit is not asserted. These support and comparison interfaces require neither a decomposition theorem nor a weight theorem.

**Stage:** `LefschetzPencilsAndVanishingCycles:LPV.6`.

**Planets:** Perverse nearby cycles; Perverse vanishing cycles; Nearby-cycle duality; Intermediate-extension exchange; Filtered-colimit support criterion.

### Theorem. Perverse exactness of nearby cycles

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyPerverseExact`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness`.

For a finite-type scheme over a henselian trait, rational ℓ-adic geometric nearby cycles take perverse sheaves on the geometric generic fibre to perverse sheaves on the geometric special fibre, and the induced functor on perverse hearts is exact. With the rectified perversity on the total trait space, this is the ψ[−1] convention: the generic-fibre restriction is shifted by −1 before applying the fibrewise functor. No weight or decomposition theorem is required.

**Hypotheses.**

- Early middle/rectified perverse structures imported from EDC.5; finite type; ℓ invertible
- Rational coefficients, or the finite-coefficient perversity specified by the supplier; p and p+ are not identified integrally

**Construction or proof.**

1. Import the support/cosupport definition and the trait dimension convention from EDC.5.
2. Use the group-cohomology two-term calculation and the strict-local nearby stalks to establish the required perverse bounds.
3. Combine the two bounds to obtain t-exactness and hence exactness on the hearts.
4. Check the generic-fibre dimension shift accounts for ψ[−1] on the total space.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `EtaleDualityAndPerverseSheaves:EDC.5`.

**Acceptance.**

- For a smooth relative-d curve, Q_l[d] on each fibre is preserved with no extra fibrewise shift.
- For Q_l[d+1] on the smooth total trait space, ψ[−1] gives Q_l[d] on the special fibre.

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), 4.5–4.6, pp. 47–49. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Perverse exactness of shifted vanishing cycles

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.vanishingPerverseExact`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.6/vanishing-perverse-exactness`.

For a perverse complex K on the total trait space with rectified perversity, RΦK[−1] is perverse on the special fibre. Its can/var maps match the shifted nearby triangle. This is different from asserting that arbitrary i*K or i*K[−1] is perverse: the restriction has the two adjacent perverse degrees appearing in the gluing argument.

**Hypotheses.**

- Finite type; early EDC.5 rectified perversity; finite or rational coefficients with the supplier’s duality convention

**Construction or proof.**

1. Use the total-space gluing bounds for j*K[−1] and i*K[−1].
2. Apply fibrewise nearby t-exactness to the generic restriction.
3. Use the specialization triangle and its two perverse bounds to show the shifted cone is perverse.
4. Retain the total/fibre dimension shifts and normalized can/var twists.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness`, `LefschetzPencilsAndVanishingCycles:LPV.1/normalized-can-var`, `EtaleDualityAndPerverseSheaves:EDC.5`.

**Acceptance.**

- At a nodal curve, RΦQ_l[2][−1] is the point skyscraper Q_l(−1) in perverse degree zero.
- For a smooth total family the shifted vanishing object is zero.

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), 4.6, pp. 48–49. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Nearby-cycle Verdier duality

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyVerdierDuality`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-verdier-duality`.

Gabber’s comparison RΨ(D_ηK)≅D_s(RΨK) is natural and inertia-equivariant, with the dualizing complexes and Tate twists provided by the six-operation supplier. The induced shifted vanishing-cycle duality is compatible with can/var and the specialization pairing. Rational adic passage is compatible with the comparison; for integral coefficients the two dual perverse conventions are kept distinct.

**Hypotheses.**

- Finite type over a trait; constructible bounded complexes; torsion prime to residue characteristic or derived adic realization
- Dualizing objects and their normalizations supplied by EDC.1–2

**Construction or proof.**

1. Construct the tensor/trace comparison of Illusie 4.3 using the actual geometric functors.
2. Apply Gabber’s duality theorem and dévissage as in 4.2–4.3.
3. Check naturality with the geometric inertia automorphisms.
4. Pass compatibly to adic coefficients and identify the cone-duality shifts.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `EtaleDualityAndPerverseSheaves:EDC.5`.

**Acceptance.**

- The rank-one nodal stalk/costalk pairing reproduces the twist −1.
- No unqualified self-dual p-perversity statement is made over Z_l with torsion.

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), 4.2–4.4, pp. 44–47. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Qualified intermediate-extension exchange

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.nearbyIntermediateExtension`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.6/intermediate-extension-exchange`.

Let j_η and j_s be compatible open immersions in a trait family. Suppose nearby cycles are t-exact for the specified perverse structures and both exchange maps RΨ j_η!≅j_s! RΨ and RΨ Rj_η*≅Rj_s* RΨ are isomorphisms on the complexes in question, including the coherence of the !→* map. Then RΨ(j_η!*P)≅j_s!*(RΨP), by exact preservation of the image in the perverse heart. These exchange hypotheses must be verified for the chosen pair, for example a constant product family with a fixed smooth boundary; they are not a universal assertion for moving boundaries.

**Hypotheses.**

- The displayed ! and * exchange isomorphisms and their common map coherence
- Perverse t-exactness; constructible perverse P; specified coefficient convention

**Construction or proof.**

1. Use the supplier definition j!*P=im(pH⁰j!P→pH⁰Rj*P).
2. Apply exactness of RΨ on perverse hearts and the two exchange isomorphisms.
3. Check that their map corresponds to the same !→* morphism.
4. Verify the exchange hypotheses by smooth/product base change in the constant pair; leave other cases as explicit conditions.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `EtaleDualityAndPerverseSheaves:EDC.5`.

**Acceptance.**

- A constant smooth pair U⊂Y times the trait satisfies the exchange and yields the constant intermediate extension.
- An arbitrary moving open boundary is not covered merely by writing j!*.

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), 4.5–4.6 (exactness); image argument using the EDC.5 definition. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Comparison. Perverse coefficients and comparison conventions

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.perverseCoefficientComparison`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.6/perverse-coefficients-and-comparison`.

The finite-level nearby-cycle functor, its derived adic realization and its rational form are compared in the early perverse framework. Integral duality exchanges the supplier’s p and p+ conventions where torsion requires it. The scheme/adic and scheme/complex comparison maps are used only for their stated finite-type admissible domains and must preserve dimension shifts, specialization and inertia. No perverse diamond or arbitrary analytic comparison is manufactured inside LPV.

**Hypotheses.**

- Finite-type and coefficient hypotheses of the supplier comparisons
- Derived adic limits with uniform amplitude; p/p+ conventions explicit

**Construction or proof.**

1. Use the finite-level coefficient-change theorem and the EDC.6 integral/rational comparison.
2. Track support/cosupport bounds under the derived adic realization.
3. Check the comparison of ψ[−1] and φ[−1] using the same trait dimension function.
4. Import analytic/adic/diamond comparisons at their precise domain, retaining gap G-adic-comparison.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.0/coefficient-and-trait-change`, `LefschetzPencilsAndVanishingCycles:LPV.0/scheme-adic-trait-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness`, `LefschetzPencilsAndVanishingCycles:LPV.6/vanishing-perverse-exactness`, `EtaleDualityAndPerverseSheaves:EDC.6`.

**Acceptance.**

- Rationalization removes the integral torsion distinction but does not change the fibrewise shift convention.
- The ordinary node compares to the complex Milnor fibre with the same specialization direction.

**Sources.**

- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/), 4.4–4.6, pp. 47–49. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Theorem. Filtered-colimit support and cosupport criterion

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.filteredColimitSupportCriterion`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.6/filtered-colimit-support-criterion`.

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

**Direct dependencies:** `EtaleDualityAndPerverseSheaves:EDC.5`, `EnhancedDerivedSheaves:E1`, `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness`, `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`.

**Acceptance.**

- An increasing union of arbitrarily many point-supported perverse sheaves can retain the bound while failing constructibility.
- A system with bounds tending to −∞ is not covered by the uniform-bound assertion.

**Sources.**

- [Ana Caraiani and Peter Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://people.mpim-bonn.mpg.de/scholze/Noncompact.pdf), §4.6, pp. 60–63, finite-level lower bounds and cofinal models. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

### Application. Igusa finite-level semiperversity interface

**Declaration:** `TauCeti.AlgebraicGeometry.VanishingCycles.igusaSemiperversityInterface`. **Node:** `LefschetzPencilsAndVanishingCycles:LPV.6/igusa-semiperversity-interface`.

For the cofinal finite-level formal models in Caraiani–Scholze §4.6, the scheme/adic nearby comparison and the preceding support criterion transport the finite-level lower perverse bound to the filtered-colimit object consumed by IgusaVarietiesAndTorsionConcentration:IG.4. The Igusa/Hodge–Tate tower geometry, affineness and vanishing of boundary terms under transition maps remain with IG.2–4. LPV exports only the nearby-cycle exactness, shift conventions, comparison and support criterion.

**Hypotheses.**

- The actual cofinal formal-model and finite-cohomological-dimension hypotheses of CS §4.6
- Finite-level semiperversity and boundary transition vanishing supplied by IG.4

**Construction or proof.**

1. Identify the finite-level scheme nearby functor with the admissible adic functor using the supplier comparison.
2. Apply the fixed dimension shift and uniform lower perverse bound.
3. Use the costalk-colimit criterion in the enlarged category.
4. Return the resulting bound to IG.4 without constructing a second tower or nearby carrier.

**Direct dependencies:** `LefschetzPencilsAndVanishingCycles:LPV.6/filtered-colimit-support-criterion`, `LefschetzPencilsAndVanishingCycles:LPV.0/scheme-adic-trait-comparison`, `IgusaVarietiesAndTorsionConcentration:IG.4`, `EtaleDualityAndPerverseSheaves:EDC.6`.

**Acceptance.**

- The target is IG.4 of the Igusa roadmap, not the distinct InverseGalois roadmap with the same local stage letters.
- No constructibility claim is added for the infinite-level colimit.

**Sources.**

- [Ana Caraiani and Peter Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://people.mpim-bonn.mpg.de/scholze/Noncompact.pdf), §4.6, Theorem 4.6.1 and its finite-level comparison proof. The cited passage supplies the stated object or result; hypotheses and ownership are made explicit here.

## External contracts

Every chain ends at a cited declaration, an exact supplier node, one of these stage contracts, or the source/proof qualifications below. General constructions stay with the named owner.

### `ArithmeticGaloisRepresentations:R01.2`

The henselian Galois specialization exact sequence and the valuation inertia comparison; tame/wild inertia and t_l:I→Z_l(1), its Kummer reductions, uniformizer independence, conjugation and ramification-index restriction. Supply the geometric local-monodromy theorem for constant Q_l cohomology of finite-type families (also compact supports), with its exact hypotheses, and the distinct representation-theoretic residue-field hypotheses. Finite inertia averaging and Frobenius-normalization contracts are used without duplicating the inertia carrier.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`, `LefschetzPencilsAndVanishingCycles:LPV.0/coefficient-and-trait-change`, `LefschetzPencilsAndVanishingCycles:LPV.1/normalized-can-var`, `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm`, `LefschetzPencilsAndVanishingCycles:LPV.1/geometric-quasi-unipotence`, `LefschetzPencilsAndVanishingCycles:LPV.1/finite-extension-and-logarithm-rescaling`, `LefschetzPencilsAndVanishingCycles:LPV.1/normal-crossings-tame-restriction`, `LefschetzPencilsAndVanishingCycles:LPV.1/semisimple-nearby-trace`, `LefschetzPencilsAndVanishingCycles:LPV.1/two-component-semistable-nearby-complex`, `LefschetzPencilsAndVanishingCycles:LPV.1/twisted-monodromy-equivariance`, `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3`, `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula`, `LefschetzPencilsAndVanishingCycles:LPV.2/variation-in-a-standard-quadratic-degeneration`, `LefschetzPencilsAndVanishingCycles:LPV.2/quadratic-character-in-characteristic-two`, `LefschetzPencilsAndVanishingCycles:LPV.2/fsy-discriminant-example`, `LefschetzPencilsAndVanishingCycles:LPV.3/finite-field-pencil-descent`, `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`, `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image`.

### `DeligneWeightsAndPurity:DWP.1`

The weight-dependent existence of the relative monodromy filtrations in Weil II 1.9.1 and its mixedness/purity hypotheses, beyond LPV’s uniqueness and tame commuting-residue calculation. This is a downstream existence consequence, not an input to the finite logarithm or algebraic Picard–Lefschetz prefix.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.1/normal-crossings-tame-restriction`.

### `DeligneWeightsAndPurity:DWP.4`

Weil-I finite-field descent and dimension/tensor-power induction; the rational-character and cross-ℓ comparison inputs to Weil II 4.4.5–9 and the character/gcd applications 4.5.1–2. The odd geometric open-Sp theorem does not import a weight theorem.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.5/finite-orthogonal-ade`, `LefschetzPencilsAndVanishingCycles:LPV.5/integral-failure-and-arithmetic-routing`.

### `EnhancedDerivedSheaves:E0`

A coherent filtered derived category of actual étale module sheaves, functorial cones, total complexes and filtered quasi-isomorphisms; enough coherence to compare the can/var triangle and the two-component Rapoport–Zink double complex without choosing nonfunctorial cones.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.1/two-component-semistable-nearby-complex`.

### `EnhancedDerivedSheaves:E1`

The enlarged derived étale category and filtered colimits with uniform finite cohomological amplitude; actual geometric stalk and qualified costalk colimit comparisons for the support criterion. This category must permit nonconstructible colimits.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.0/oriented-product-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.6/filtered-colimit-support-criterion`.

### `EnhancedDerivedSheaves:E4`

Derived adic completion/realization of compatible Z/ℓ^r complexes with uniform amplitude, derived inverse-limit control and rationalization; no underived inverse-limit substitute.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.0/coefficient-and-trait-change`, `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization`.

### `EtaleDualityAndPerverseSheaves:EDC.1:biduality`

The constructible Verdier dualizing objects, biduality and tensor/trace coherence on the geometric fibres, with finite and rational coefficient conventions; Gabber’s nearby duality is the LPV target built on them.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-verdier-duality`.

### `EtaleDualityAndPerverseSheaves:EDC.3`

EtaleDualityAndPerverseSheaves, Part II: absolute purity and coherent restriction/Gysin/trace diagrams for regular pairs over an excellent henselian trait, with invertible torsion coefficients. The existing EDC.3 smooth-pair statements over a field supply stratum maps but not this trait extension. Supply the regular semistable total-space comparison used by the early two-component nearby complex and its algebraic Picard–Lefschetz application, without perverse, weight or hard-Lefschetz inputs.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.1/two-component-semistable-nearby-complex`, `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3`.

### `EtaleDualityAndPerverseSheaves:EDC.4`

General codimension-two smooth blowup cohomology, with maps π* plus exceptional Gysin and the inverse exceptional minus sign; weak Lefschetz/connectedness and smooth complete-intersection cohomology in the required finite and rational coefficient ranges. LPV owns the pencil incidence identification and restriction/Gysin calculation, not this general theorem.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-smooth-quadrics`, `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.3/inseparable-gauss-and-low-dimension`, `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-restriction-and-gysin`, `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-leray-and-middle-reduction`, `LefschetzPencilsAndVanishingCycles:LPV.4/hypersurface-outside-middle`.

### `EtaleDualityAndPerverseSheaves:EDC.5`

Early perverse t-structures on finite-type schemes over fields and the rectified trait dimension function, the p/p+ integral conventions, support/cosupport criteria, gluing and intermediate extension as the image of !→*. Supply their enlarged nonconstructible extension and the precise finite-cohomological-dimension hypotheses under which geometric stalks/costalks commute with filtered colimits. No purity or decomposition theorem is required.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness`, `LefschetzPencilsAndVanishingCycles:LPV.6/vanishing-perverse-exactness`, `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-verdier-duality`, `LefschetzPencilsAndVanishingCycles:LPV.6/intermediate-extension-exchange`, `LefschetzPencilsAndVanishingCycles:LPV.6/filtered-colimit-support-criterion`.

### `EtaleDualityAndPerverseSheaves:EDC.6`

Finite/derived-adic/rational realization with perverse shift and duality conventions; Huber’s admissible finite-type scheme/formal-completion/adic nearby comparison, including specialization and inertia equivariance. The analytic comparisons are imported on their stated domain, not extended to all analytic spaces.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization`, `LefschetzPencilsAndVanishingCycles:LPV.0/scheme-adic-trait-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.2/complex-picard-lefschetz-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.6/perverse-coefficients-and-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.6/igusa-semiperversity-interface`.

### `FiniteFieldsAndCharacterSums:FF.0`

Closed points of a nonempty finite-type F_q-scheme have finite residue extensions, and arithmetic Frob_(q^r) is Frob_q^r; combine with finite-presentation descent to obtain a good pencil axis after a finite extension.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.3/finite-field-pencil-descent`.

### `IgusaVarietiesAndTorsionConcentration:IG.4`

The actual cofinal finite-level formal models, tower/boundary transition maps and common semiperverse lower bound of Caraiani–Scholze §4.6, with its finite-cohomological-dimension hypotheses. LPV returns the nearby and colimit-support interface, not the Igusa tower geometry.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.6/igusa-semiperversity-interface`.

### `InverseGaloisAndArithmeticFundamentalGroups:IG.1`

Algebraic tame inertia conjugacy, Abhyankar and SGA 1 XIII specialization; the tame presentation of P¹ minus a finite set by local generators with product relation, and π₁(P¹)=1 over an algebraically closed field. Do not replace these by the topological complex presentation in positive characteristic.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.1/normal-crossings-tame-restriction`, `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`, `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`, `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate`, `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections`, `LefschetzPencilsAndVanishingCycles:LPV.5/characteristic-two-transverse-monodromy`.

### `SchemeAndStackFoundations:SF.0`

Import existing projective spaces, dual projective spaces, Grassmannians, projective tangent spaces and Veronese morphisms from the upstream ProjectiveSchemesAndSmoothMorphisms roadmap. Supply excellent local-ring and completion interfaces and Severi–Brauer ambient quadrics. General Artin Jacobian-square approximation and Elkik henselian/formal versality/algebraization, beyond the existing carrier, are SchemeAndStackFoundations, Part II; LPV plans only their quadratic applications.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form`, `LefschetzPencilsAndVanishingCycles:LPV.2/normal-form-of-ordinary-quadratic-forms`, `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric`, `LefschetzPencilsAndVanishingCycles:LPV.2/smooth-quadric`, `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point`, `LefschetzPencilsAndVanishingCycles:LPV.2/tougeron-artin-implicit-function-theorem`, `LefschetzPencilsAndVanishingCycles:LPV.2/elkik-versal-henselian-deformations`, `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`, `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`, `LefschetzPencilsAndVanishingCycles:LPV.3/ordinary-axis-open-and-jet-separation`, `LefschetzPencilsAndVanishingCycles:LPV.3/incidence-pencil-blowup`, `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`.

### `SchemeAndStackFoundations:SF.1`

The Rees-algebra blowup universal property and affine charts for a regular two-generated ideal, with the empty-center identity case. The incidence equation is specialized to a pencil inside LPV.3; general blowup geometry remains with its owner.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.3/incidence-pencil-blowup`.

### `SchemeAndStackFoundations:SF.2`

Integration contract, not a second plan: re-export the existing PR196 ConstructibleEtale layers 0–3 (small-étale morphisms, stalks, Galois descent, lisse representations and paths), 7–9 (derived complexes), EtaleBaseChange layers 2–8 (Rf*, Leray, coherent exchange maps, smooth/proper base change with their distinct hypotheses, excellent finite-type constructibility, local acyclicity and lissity), EllAdicRealization derived compatible systems and TraceFormula finite-dimensional trace/additivity. Read PR196 head 4bd72379658126cbe9be935656396f0c9dac4de0. ComplexComparison layers 8–12 must supply Riemann existence, relative comparison and cup/trace orientation compatibility for the algebraic ordinary degeneration. General carriers remain owned upstream; SF.2 is the atlas external entry’s integration_owner.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves`, `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.0/geometric-fibre-site-morphisms`, `LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude`, `LefschetzPencilsAndVanishingCycles:LPV.1/semisimple-nearby-trace`, `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.2/homotopy-invariance-of-etale-cohomology`, `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-cone`, `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-punctured-cone`, `LefschetzPencilsAndVanishingCycles:LPV.2/complex-picard-lefschetz-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.3/finite-field-pencil-descent`, `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`, `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-leray-and-middle-reduction`, `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`, `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate`, `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections`, `LefschetzPencilsAndVanishingCycles:LPV.5/characteristic-two-transverse-monodromy`, `LefschetzPencilsAndVanishingCycles:LPV.5/integral-failure-and-arithmetic-routing`.

### `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-4-the-arithmetic-of-character-values`

Rational/integral character values and descent for the finite reflection-group representation, as needed by Weil II 4.4.5–9; finite Q_l image by itself does not supply an integral rational root lattice.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.5/finite-orthogonal-ade`.

### `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-0-the-classical-groups-and-the-standard-representation`

The algebraic symplectic/orthogonal groups, their Lie algebras and the source’s orthogonal irreducibility alternatives for the even-dimensional conditional branch. Use the existing classical-group carriers.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.5/conditional-orthogonal-open-or-finite`.

### `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`

Import the characteristic-zero SL₂ module classification, symmetric powers and Clebsch–Gordan rule from the existing upstream engine; the specific nilpotent Jordan-block SL₂ realization needed for Deligne 1.6.8 is an extension in that direction, LieHighestWeight, Part II, rather than a second general Jacobson–Morozov plan.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.1/primitive-decomposition-and-strictness`, `LefschetzPencilsAndVanishingCycles:LPV.1/tensor-dual-and-symmetric-monodromy`.

### `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-5-dynkin-diagrams-and-the-cartan-killing-classification`

Classification of irreducible simply-laced integral positive-definite root systems as A,D,E and identification of the reflection group with the Weyl group, after LPV’s lattice hypotheses have been proved.

**Consumers:** `LefschetzPencilsAndVanishingCycles:LPV.5/finite-orthogonal-ade`.

## Extensions of existing directions

- **Regular-trait purity extension.** EtaleDualityAndPerverseSheaves, Part II: absolute purity and coherent restriction/Gysin diagrams for regular trait pairs; keep the general carrier with EDC. The existing EDC.3 smooth-pair-purity statement is over a field and does not supply the regular trait pairs used by the algebraic Picard–Lefschetz prefix.
- **Henselian approximation extension.** SchemeAndStackFoundations, Part II: general approximation and henselian/formal versality, imported by LPV’s quadratic applications. Ordinary quadratic applications require general Artin/Elkik approximation beyond the existing henselization carrier.
- **P-adic Lie extension.** LieGroups, Part II: p-adic exp/log charts, closed subgroup theorem and full-Lie-algebra openness; this avoids re-planning the real LieGroups results. The existing LieGroups roadmap is real/complex; compact Q_l subgroup arguments need their own scalar-field hypotheses.
- **SL₂ nilpotent realization extension.** LieHighestWeight, Part II: nilpotent-endomorphism SL₂ realization/Jacobson–Morozov interface needed by Deligne 1.6.8, without a second SL₂ carrier. The existing SL₂ engine provides representation theory; the required nilpotent Jordan-block realization should build on it.

## Source and proof qualifications

The target pass includes every stage target. The seven qualifications below prevent closure of the affected proofs; the exact statement and dependency contract, rather than a stronger unsupported conclusion, governs each target.

- **G-algebraic-PL — Original algebraic Picard–Lefschetz proof interior.** Illusie, Sur la formule de Picard–Lefschetz, Adv. Stud. Pure Math. 36 (2002), 249–268, DOI 10.2969/aspm/03610249: publisher PDF was blocked. The author’s 2021 §6.1 and §6.3 and ErrPL.pdf were read and give the algebraic two-component route and corrected concentration range. The original blowup/base-change calculation determining the odd sign still needs its primary proof read and checked. It is not replaced by SGA 7’s transcendental proof or by LPV.7.
- **G-nonordinary — Original nonordinary concentration hypotheses.** FSY §5.1.3 was read and verifies the characteristic-two application and middle concentration it cites. Illusie, Perversité et variation, Manuscripta Math. (2003), Corollary 2.10, DOI 10.1007/s00229-003-0407-z, was not obtained; its exact general class of isolated quadratic singularities and proof need checking before widening the FSY application.
- **G-approximation — General henselian approximation and versality sources.** The SGA 7 XV cited application and quadratic models were read. Artin’s original Lemma 5.10 and Elkik’s original versality proof were not read. Their general results are requested as SchemeAndStackFoundations, Part II; the LPV nodes contain only their quadratic applications.
- **G-adic-comparison — Inertia-equivariant scheme/adic nearby comparison.** Caraiani–Scholze §4.6 uses Huber’s finite-level comparison, but its full admissibility hypotheses and the coherence with each inertia automorphism have not been checked in Huber’s primary proof. EDC.6 must supply the exact comparison domain and equivariant square; no general analytic identification is asserted.
- **G-padic-Lie — Compact Q_l subgroup Lie theory.** Weil I 5.10–11 were read, but the p-adic closed-subgroup theorem and exp/log charts needed to pass from equality of Lie algebras to openness have not been read in their primary proof. Real LieGroups’ Cartan theorem is insufficient. The specific compact-matrix-group lemma remains here with this gap and a LieGroups, Part II proposal.
- **G-orthogonal-integrality — Orthogonal rationality/integrality proof interior.** Weil II 4.4.8–9 was read. The proof interior 4.4.5–7 constructing the rational integral cycle lattice was not freshly read; its exact character and cross-ℓ comparison contracts are requested from DWP.4 and CharacterTheory. ADE is conditional on these inputs, not inferred from a finite Q_l image alone.
- **G-finiteness-source — Excellent-trait finiteness proof.** Illusie’s classical-trait finiteness statement and PR196 EtaleBaseChange’s precise finite-type constructibility contract were read. The original SGA 4½ finiteness proof is not freshly read here; it belongs to that upstream supplier. The LPV hypotheses retain excellence and finite-type/finite-Tor restrictions.

## Source corrections and delimitations

Statements above use these corrections. Formula conventions, genuinely conditional results and warnings against overgeneralization are distinguished in the packet’s source-issue records.

- **LefschetzPencilsAndVanishingCycles/E1** (misprint), Exposé XII, 1.1 b), p. 2. Printed: “b) pour n impair et card(A) = 2 : Q est ordinaire si et seulement si …”. Correction: b) pour n impair et car(A) = 2 : … Case a) is 'n pair ou car(A) ≠ 2', so b) is its complement, characteristic 2; with card(A) = 2 the dichotomy would cover only the field with two elements.
- **LefschetzPencilsAndVanishingCycles/E2** (misprint), Exposé XII, Proposition 1.2, p. 3. Printed: “Q(Σ_1^n x_i e_i) = Σ_1^{m−1} x_i x_{i+m} (resp. Σ_1^{m−1} x_i x_{i+m} + λx²_{2m+1})”. Correction: Σ_{i=1}^{m} x_i x_{i+m} (resp. Σ_{i=1}^{m} x_i x_{i+m} + λx²_{2m+1}), or equivalently sums from 0 to m − 1 with the basis indexed from 0 With the basis e₁, …, e_n and i from 1 to m − 1, the variables x_m and x_{2m} do not occur and the displayed form is degenerate, contradicting ordinarity; the inductive proof splits off m hyperbolic planes.
- **LefschetzPencilsAndVanishingCycles/E3** (misprint), Exposé XII, 3.1, p. 14. Printed: “η ∈ H⁰(S, R¹p_*ℤ_ℓ(1))”. Correction: η ∈ H⁰(S, R²p_*ℤ_ℓ(1)) η is the image of c₁(O(1)) ∈ H²(X, ℤ_ℓ(1)), as the next sentence of 3.1 says ('l'image dans H⁰(S, R²p_*ℤ_ℓ(1))').
- **LefschetzPencilsAndVanishingCycles/E4** (misprint), Exposé XII, proof of 3.3, formula (a), p. 15. Printed: “la quadrique d'équation Σ_0^m x_i x_{i+m+1} = 0 dans P^{m+1}(k)”. Correction: dans P^{2m+1}(k) The quadric has dimension n = 2m and the equation uses the variables x₀, …, x_{2m+1}.
- **LefschetzPencilsAndVanishingCycles/E5** (misprint), Exposé XII, 3.6, p. 18. Printed: “Pour r = 2m + 1, r_{2m}(η^m) = η^m”. Correction: Pour n = 2m + 1 The paragraph treats n even and then n odd; r denotes the restriction maps r_i.
- **LefschetzPencilsAndVanishingCycles/E6** (misprint), Exposé XII, 3.6, p. 18. Printed: “Par dualité, ou à l'aide de 3.5.3, on montre de même …”. Correction: à l'aide de (3.6.3) Exposé XII has no 3.5.3; the dual Gysin sequence (3.6.3) is the one that computes R^i f_*ℤ_ℓ.
- **LefschetzPencilsAndVanishingCycles/E7** (misprint), Exposé XV, Corollaire 1.3.2 (ii), display (4.14.2), p. 11. Printed: “Q(X) = x₀ + bx₀ + c + Σ_{1≤i≤j≤2m} a_ij x_i x_j”. Correction: Q(X) = x₀² + bx₀ + c + Σ_{1≤i≤j≤2m} a_ij x_i x_j Without the square the equation is smooth at every point; the versal deformation of 1.3.1 (ii) and Remarque 1.3.3 both have x₀².
- **LefschetzPencilsAndVanishingCycles/E8** (misprint), Exposé XV, 1.2.1 and proof of 1.2.6, pp. 4 and 6. Printed: “(4.2.1) f(X) = Q(X) = + termes d'ordre > 2; 'Soit Y₀ défini par Q comme en 4.3.'”. Correction: f(X) = Q(X) + termes d'ordre > 2, and 'comme en 1.2.3' The stray '=' breaks the formula, and the references numbered 4.x (also the label (4.14.2) in 1.3.2) point to a numbering of the exposé that no longer exists; 1.2.3 is the cone Q = 0 used in the proof.
- **LefschetzPencilsAndVanishingCycles/E9** (misprint), Exposé XV, 2.1.3 and Lemme 2.7.8, pp. 14–17. Printed: “'Lemme 2.1.3' and the paragraph '2.1.3. Prouvons 2.1.2' share a number, and the lemma after 2.1.7 is numbered 'Lemme 2.7.8'”. Correction: number the paragraph 2.1.3 bis (or renumber), and read 'Lemme 2.1.8' The proof of 2.2.7 says 'Appliquons 2.1.8', and the lemma sits between 2.1.7 and 2.2.
- **LefschetzPencilsAndVanishingCycles/E10** (misprint), Exposé XV, (2.2.5.9), p. 21. Printed: “D(σ)(δ') = λ(σ).δ”. Correction: Var(σ)(δ') = λ(σ).δ The next display (2.2.5.10) rewrites it as a formula for Var(σ), and D is not defined in XV.
- **LefschetzPencilsAndVanishingCycles/E11** (error), Exposé XV, 2.2.6, p. 22. Printed: “si 2∤k (Λ = ℤ/k), ±δ est caractérisé par (2.2.5.3) (2.2.5.4), ie. par (2.2.6.1) (δ,δ) = (−1)^m.2”. Correction: ±δ is characterised by (δ, δ) = (−1)^m·2 when k is a power of a single odd prime; for general odd k one must also use naturality in Λ prime by prime, or the classes of XII 3.7 (uδ, uδ) = u²(δ, δ), and ℤ/k has square roots of 1 other than ±1 when k has two distinct odd prime factors: for k = 15, u = 4 gives u² = 16 ≡ 1, so 4δ ≠ ±δ also satisfies (2.2.6.1).
- **LefschetzPencilsAndVanishingCycles/E12** (misprint), Exposé XV, 2.2.2, p. 18. Printed: “Sauf dans le cas exceptionnel où k(s) est de caractéristique 2 et où n+1 est pair”. Correction: où n+1 est impair (n pair) The degenerate case is characteristic 2 with n even (XV 1.2.2 and 1.2.8: an odd number n + 1 of variables), and 2.2.6 says 'Supposons n impair; x₀ est alors un point rationnel (2.2.2)'.
- **LefschetzPencilsAndVanishingCycles/E13** (misprint), p. 22 line −4, p. 24 lines 6–7, p. 38 line −11. Printed: “t_|”. Correction: Use the vertical tame parameter t_vert and σ_vert consistently. The author’s ErrTML sheet identifies the vertical parameter used in the double-complex construction.
- **LefschetzPencilsAndVanishingCycles/E14** (misprint), p. 35 line 7. Printed: “R^(q+1)”. Correction: Replace R^(q+1)a_q! by R^(2q)a_q!. Purity in codimension q has cohomological degree 2q.
- **LefschetzPencilsAndVanishingCycles/E15** (misprint), p. 37 line −5. Printed: “T−1”. Correction: Use 1−T in the upper row of the diagram. The author corrects the sign used to compare the boundary maps in the filtered nearby complex.
- **LefschetzPencilsAndVanishingCycles/E16** (misprint), p. 38 line −5, (3.6.8). Printed: “L”. Correction: Replace L by K in the filtered quasi-isomorphism. The simple Rapoport–Zink complex resolves nearby K, not its inertia-cohomology cone L.
- **LefschetzPencilsAndVanishingCycles/E17** (misprint), p. 39 line 7, second row. Printed: “a_(d+1)*”. Correction: The row is a_d*Λ followed by a_(d+1)*Λ(−1). The author’s erratum reverses the printed component order, needed for the graded monodromy map.
- **LefschetzPencilsAndVanishingCycles/E18** (misprint), p. 41 line −3. Printed: “W_(·−n)”. Correction: M_·=W_·, without the shift −n. The author’s erratum fixes the monodromy-filtration indexing.
- **LefschetzPencilsAndVanishingCycles/E19** (misprint), p. 41 line −2. Printed: “poids i”. Correction: The weight is i+n, not i. The pure weight includes the dimension shift; this weight result is routed to DWP, not proved here.
- **LefschetzPencilsAndVanishingCycles/E20** (misprint), p. 43 line −1 and p. 44 lines 1–2. Printed: “parenthèses”. Correction: Delete the parenthetical proposed correction to the quoted text. The author’s erratum explicitly retracts that proposed correction; LPV does not perpetuate it.
- **LefschetzPencilsAndVanishingCycles/E21** (misprint), p. 44 line −12. Printed: “g”. Correction: Replace g by α. The duality-comparison map is the α of the preceding construction.
- **LefschetzPencilsAndVanishingCycles/E22** (misprint), p. 48 line 3. Printed: “pour X”. Correction: Read pour K. The perverse argument applies to the complex K, not to the scheme X.
- **LefschetzPencilsAndVanishingCycles/E23** (misprint), ErrPL.pdf, correcting p. 251 line 18 of the 2002 paper. Printed: “|i|>−1”. Correction: Replace the original 2002 bound by |i|>1. ErrPL.pdf gives the corrected local concentration bound in Sur la formule de Picard–Lefschetz; the original source is not claimed read.

## Source editions and reading boundaries

- [Pierre Deligne, La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf). Publ. Math. IHÉS 43 (1974), 273–307; Numdam scan with OCR, 36 PDF pages (printed page = PDF page + 271); locators give printed pages Relevant passages: §§4–5, pp. 287–294: inherited page-image reading, independently audited against the text and required targets; §§6–7 consulted for arithmetic ownership; their weight arguments are supplied by DeligneWeightsAndPurity.
- [Pierre Deligne, Nicholas Katz (directors); Exposés XIII and XV by P. Deligne, Groupes de monodromie en géométrie algébrique (SGA 7 II), Lecture Notes in Mathematics 340](https://publications.ias.edu/sites/default/files/Number12.pdf). Springer 1973; IAS author-archive scan with OCR (the OCR is poor: symbols ~, @, 4 replace accents and Greek letters; statements were reconstructed from the surrounding French text and the numbered cross-references) Relevant passages: XII §§1–3 and XV §§1–2: inherited page-image reading and transcriptions, 2026-09-29; their statements retained and audited; XIII 2.1.9–13 and 2.2–2.4; XVII §§1–4; XVIII §§1–4, 5.1, 6.1, 6.3–6.4, 6.6–6.7; portions needed for the algebraic generation and pencil restriction/Gysin formulas.
- [Pierre Deligne, La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf). Publ. Math. IHÉS 52 (1980), 137–252 Relevant passages: 1.6–1.7 and 1.9, pp. 165–178; 4.2.1–8, 4.3.9–10, 4.4.1–4, 4.4.8–9 and 4.5.1–2, pp. 220–234; proof interiors 4.4.5–7 not freshly read.
- [Luc Illusie, Autour du théorème de monodromie locale](https://www.numdam.org/item/AST_1994__223__9_0/). Astérisque 223 (1994), 9–57 Relevant passages: 1.1–1.5; 3.5–3.8 (filtered nearby-cycle calculation); 4.1–4.6 (duality and perversity); beginning of 4.7.
- [Luc Illusie, Errata to Autour du théorème de monodromie locale](https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrTML.pdf). Author errata sheet, 2 pages Relevant passages: Entire errata sheet.
- [Luc Illusie, Grothendieck and vanishing cycles](https://www.numdam.org/article/AFST_2021_6_30_1_83_0.pdf). Ann. Fac. Sci. Toulouse 30 (2021), 83–115 Relevant passages: 6.1–6.3, pp. 103–105; algebraic Picard–Lefschetz route through the two-component calculation.
- [Luc Illusie, Erratum to Sur la formule de Picard–Lefschetz](https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrPL.pdf). Author erratum to Adv. Stud. Pure Math. 36 (2002), 249–268 Relevant passages: Entire sheet; p. 251 line 18 correction.
- [Luc Illusie, Vanishing cycles over general bases](https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf). Author lecture text, December 2006 Relevant passages: 1.1 and 2.1–2.4 (oriented products and their points).
- [Lie Qian, Potential automorphy for GL_n](https://par.nsf.gov/servlets/purl/10388233). Invent. Math. 231 (2023), published text Relevant passages: Definition 3.6: maximally unipotent and maximally nilpotent.
- [Javier Fresán, Claude Sabbah and Jeng-Daw Yu, Hodge theory of Kloosterman connections](https://arxiv.org/pdf/1810.06454). arXiv:1810.06454 public text of Duke Math. J. article Relevant passages: 5.1.3, pp. 41–44, ordinary quadratic points and the characteristic-two nonordinary branch.
- [Mark Kisin and George Pappas, Integral models of Shimura varieties with parahoric level structure](https://www.numdam.org/article/PMIHES_2018__128__121_0.pdf). Publ. Math. IHÉS 128 (2018), 121–218 Relevant passages: 4.7.1 and 4.7.3, pp. 212–213; definitions and use of nearby-cycle semisimple trace.
- [Ana Caraiani and Peter Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://people.mpim-bonn.mpg.de/scholze/Noncompact.pdf). Author public manuscript, Noncompact.pdf Relevant passages: 4.6, pp. 60–63, finite-level semiperversity and the cofinal-model interface.

The packet records source hashes and edition/access evidence. The original 2002 algebraic proof and 2003 nonordinary concentration proof retain their explicit qualifications; the author survey, published errata and the primary applications supply only the passages stated above.
