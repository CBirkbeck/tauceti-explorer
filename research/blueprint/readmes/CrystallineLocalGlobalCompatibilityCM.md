# P-ordinary degree shifting, crystalline compatibility and Barsotti–Tate lifting

This roadmap extends PotentialAutomorphyInfrastructure along the direction accepted in the Caraiani–Newton split. Its first endpoint is the crystalline and semistable-ordinary local deformation condition on integral derived Hecke Galois representations, without a Fontaine–Laffaille bound on weights or a lower bound on the residue characteristic. Its second endpoint is potentially Barsotti–Tate automorphy lifting for two-dimensional representations over imaginary CM fields, with the source correction stated below. The elliptic-curve applications use the two-dimensional, p=3 and p=5 exports.

The development follows Caraiani–Newton, §§2–5. It imports the parent’s algebraic coefficient dictionary, CTG weights, ordinary tower and boundary infrastructure. The parent retains its existing Fontaine–Laffaille and Borel-ordinary results. Absolute Galois groups, deformation functors, local potentially semistable rings, automorphic Galois constructions, Igusa concentration and the general patching method retain their own owners. The sibling EllipticCurveModularityImaginaryQuadratic owns residual modularity for elliptic curves, modular-curve points and Jacquet–Langlands; none of that geometry is rebuilt here.

The packet is a complete **target-level planning pass**: each target and each key backward prerequisite is a declaration, a verified baseline citation, an exact imported node, or a precise supplier request with a gap. All ten stages have coverage **planned**, and none is closed. Every implementation status remains unchecked. The 84 extracted routed items are accounted for individually: the introduction’s Theorem 1.3 uses the full Theorem 4.2.15 node, and the generic tensor identity of Lemma 2.3.15 is requested from SmoothRepresentationsOfLocalGroups. The other 82 items are owned targets; 15 additional carriers separate objects needed by those targets. CN 5.3.2–4 are also recorded as exact imported local-ring inputs.

## Sources and conventions

The main source is Ana Caraiani and James Newton, [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3), arXiv:2301.10509v3, 27 March 2025. Statements and proofs in §§2.1–2.3, 3.1–3.3, 4.1–4.3 and 5.1–5.6, and the introduction’s routed endpoints, were read. All CN numbering in this document refers to that version. The TeX source was checked for residual bars and weight reversal. The PDF hash is 57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3; the source archive hash is ba97df92337a5b364ef21df65c31d2cce617099cbe48de27722f6f875388df19.

The secondary source is Patrick Allen, Chandrashekhar Khare and Jack Thorne, [Modularity of GL₂(F_p)-representations over CM fields](https://arxiv.org/pdf/1910.12986v2), arXiv:1910.12986v2, 2 September 2022, with title page dated 5 September. The invoked fixed-determinant presentation and finite-group/Taylor–Wiles statements A.4–A.6, lifting interface A.7, preparation proof A.14, PGL₂ definitions/comparison and rational range of Theorems 5.10–5.11 were read. The journal citation is Cambridge Journal of Mathematics 11 (2023), 1–124, DOI 10.4310/CJM.2023.v11.n1.a1. Journal collation remains a recorded gap; the exact statements here are attributed to the arXiv version. Public source access and correction checks were made on 7 October 2026.

The dependency design also reads the complete upstream LieGroups and ReductiveGroups documents, the parent’s complete packet, and the relevant target descriptions and exact nodes of PadicFamilies, ArithmeticLocallySymmetricSpaces, IntegralHeckeAndGaloisDeterminants, LocalGaloisDeformationRings, GlobalGaloisDeformations, ArithmeticGaloisRepresentations, IgusaVarietiesAndTorsionConcentration and ModularityAndLanglandsExtensions. A citation of an existing supplier plan is not a claim that its theorem is implemented, or that its entire secondary bibliography has been reread. The open supplier requests identify the statements whose sufficient export could not be established.

The following standing conventions apply to each declaration, with the explicit variations in the totally real endpoint and the rank-one/empty test cases.

1. F is an imaginary CM field, F⁺ its maximal totally real subfield, n≥2, p a prime; all places of F⁺ above p split in F when unitary parahorics are used. The coefficient field E/Q_p is finite and contains all relevant embeddings, O is its integer ring, k its residue field, and ϖ its uniformizer. Local uniformizers ϖ_v are distinct notation.
2. G=Res_{F/F⁺}GL_n; G̃ is the quasi-split U(n,n) with form J=(0,Ψ_n;−Ψ_n,0), P its Siegel parabolic, M≅G the lower-right Levi; fix split-place identifications ι_ṽ. The algebraic coefficient lattice is the integral dual Weyl lattice, not an arbitrary characteristic-zero lattice. Good level means a neat factorizable compact open, with the standard integral p-components; apply the explicit non-neat construction only in CL.8–CL.9.
3. Weights λ_{τ,1}≥⋯≥λ_{τ,n}; the unitary dictionary (2.1.4) is λ̃_τ=(−λ_{τ̃c,n},…,−λ_{τ̃c,1},λ_{τ̃,1},…,λ_{τ̃,n}). Thus the paper’s abbreviated (−λ_{τ̃c},λ_{τ̃}) always includes reversal in the first block. Hodge–Tate convention HT(ε_p^{-1})=+1; Art sends a uniformizer to geometric Frobenius.
4. For good v outside T, P_v(X)=Σ_{i=0}^n(−1)^i q_v^{i(i−1)/2}T_{v,i}X^{n−i}, T_{v,0}=1. For G̃ replace n by 2n and i by j, including X^{2n−j} in every term (corrected E11). d=n²[F⁺:Q] is the complex dimension of X̃; dim_R X_G=d−1.
5. Whenever the §2.1.20 Galois theorem is invoked: F contains an imaginary quadratic field; T⊇S_p, T=T^c; for each v∉T of residue characteristic ℓ, either T has no ℓ-adic places and ℓ is unramified in F, or ℓ splits in an imaginary quadratic subfield of F. A non-Eisenstein m means its associated residual n-dimensional representation is absolutely irreducible. Decomposed generic means some rational ℓ≠p splits completely in F, the residual representation is unramified at all v|ℓ, and no ratio of two Frobenius eigenvalues equals ℓ. The ambient 2n-dimensional Satake representation must separately satisfy this condition where specified.

The abbreviation (−λ_{τ̃c},λ_{τ̃}) always means the reversed conjugate first block (−w₀λ_{τ̃c},λ_{τ̃}). In a conjugated or dual comparison the block orientation changes explicitly. Coefficient reduction uses ϖ in O; geometric congruence depth uses the local ϖ_v. Distinguish the exponent m from a maximal ideal, written 𝔪 in prose. For the two-dimensional non-neat PGL₂ application, set n=2, retain p odd and use its specified central-character-one complex.

POrd localizes the single Siegel operator ũ_n at each selected place. QOrd requires unit eigenvalues for every rescaled partial block operator. The two conditions differ for a refined partition. Integral local Satake and induction are unnormalized; normalized complex Jacquet modules occur only in the characteristic-zero automorphic argument, through their supplier. Art sends a uniformizer to geometric Frobenius, and the inverse cyclotomic character has labelled Hodge–Tate weight +1.

## Why the degree-shifting path works

The integral coefficient evaluation is surjective, and its kernel is annihilated by a power of the rescaled Siegel operator modulo ϖ^m. Thus the ordinary completed object forgets the selected algebraic weight up to the prescribed Levi tensor. Compact Levi derived invariants recover every finite parahoric depth; interior and Borel–Serre boundary recovery use the same natural comparison.

Unnormalized parabolic induction has its Bruhat filtration. The open cell yields the block-exchanged Levi action; the identity cell yields a rank shift and the inverse determinant unit character. These are cohomological subquotients with actual Hecke action. The development does not replace the filtration by a direct sum of induced representations.

The localized Siegel boundary gives a Hecke-equivariant retract of completed unitary boundary cohomology. Ambient decomposed genericity supplies the integral-to-rational middle-degree injection and the boundary comparison. It is a condition on the 2n-dimensional Satake representation, distinct from irreducibility of its n-dimensional Levi constituent. The exact concentration input is IgusaVarietiesAndTorsionConcentration:IG.7/middle-degree-without-length-hypothesis.

At complementary p-places with zero weight, the Siegel radical is the abelian group O_L^{n²}. Its continuous cochains modulo ϖ^m become a direct sum of their cohomology after sufficiently deep Levi restriction. The cohomology is the continuous dual of exterior powers. Smooth perfect-complex dualizability, filtered colimits of morphisms and the compact abelian cochain/Koszul computation are explicit supplier needs; this step imposes no large-p assumption. It does not assert equivariant formality integrally or for every nonabelian unipotent group.

Let D=[F⁺:Q], d=n²D and R be the sum of the complementary local degrees. From 2R≥D and q≥floor(d/2), one has d−q≤ceil(d/2)≤n²ceil(D/2)≤n²R. This is the available degree in unipotent cohomology. The odd-degree case needs the floor and integer rounding. Artin–Rees controls discrepancies between integral filtration images after enlarging m to m′. Bounded ghost/annihilator exponents yield a nilpotent ideal whose exponent depends on n and D, with no dependence on m, weight or congruence level.

Characteristic-zero characters of the CTG middle-degree image come from cuspidal Q-ordinary unitary representations. Their local Galois representations have crystalline diagonal blocks and a specified determinant/Hodge–Tate dictionary. A prime-to-p separating twist identifies the desired residual n-dimensional constituent; the reconstruction is requested from IntegralHeckeAndGaloisDeterminants. Its existing exact node assumes a finite flat target, whereas the present Hecke target may have torsion; the arbitrary-target extension remains an explicit gap. Each local torsion system lifts through a finite-flat coefficient algebra at the chosen place. The theorem assembles the global representation over the nilpotent Hecke quotient; it does not assert a single global automorphic lift of every torsion class.

For two-dimensional lifting, the PGL₂ central character changes the rational range to [D,2D], so q₀=l₀=D. Non-neat perfectness needs localization, trivial residual coefficients and ζ_p∈F. Two families of perfect complexes with a fixed common residual identification are patched with finite derived Hecke images. The R-actions exist modulo nilpotent ideals; an honest R-module chain model is not assumed. Unique generic generalizations of special generic points and the derived length identity propagate automorphic support between components. Existing BT and semistable-ordinary local component nodes remain owned by LocalGaloisDeformationRings.

## Source corrections and the qualified endpoint

The inherited findings are attributed to PAPER-CARAIANI-NEWTON-23 and its independent review REV-PAPER-CARAIANI-NEWTON-23; this packet does not review itself. The computational check below independently verifies the finite-group obstruction. The small coefficient, index, base-ring and polynomial slips are applied in the statements. E11 concerns the missing power X^{2n−j} in the unitary Hecke polynomial; the q exponent remains j(j−1)/2. E8 evaluates the rescaling character at the acting element g and uses its inverse.

The substantial finding E12 is a false printed finite-group lemma. In characteristic seven take

\[
i=\begin{pmatrix}0&1\\-1&0\end{pmatrix},\qquad
j=\begin{pmatrix}2&3\\3&-2\end{pmatrix},\qquad
h=(-1+i+j+ij)/2.
\]

Then i²=j²=−1 and ij=−ji. The quaternion group Q₈ and h of order three generate 24 matrices Q₈⋊⟨h⟩. Twist the inclusion by the cubic character χ with χ(h)=2, χ(Q₈)=1. The determinant χ² has order three. Every element outside its kernel satisfies tr(ρ(g))²=(1+detρ(g))². Yet the determinant kernel acts absolutely irreducibly: an invariant line for i and j would give eigenvalues a,b with ab=−ab, impossible since i,j are invertible and the characteristic is odd. Group closure, all character values, all trace identities and these matrix relations were reproduced over F₇.

Consequently the final potentially BT theorem here assumes **[F(ζ_p):F]≠3 or projective residual image not A₄**, in addition to the printed hypotheses. The solvable preparation is required to preserve the full residual image and the cyclotomic degree. Recovering the unrestricted general-prime theorem requires another proof of the missing auxiliary-prime/preparation step. This finding does not show that theorem false. It does not affect p=3 or p=5, because the cyclotomic degree divides p−1 and cannot equal three.

E18 records a separate missing justification: §4.1.1 asserts exact nonvanishing for the unipotent coefficient object with arbitrary algebraic weights, citing a computation with trivial coefficients. The present plan exports the cohomological-dimension bound in general and exact nonvanishing for zero selected weights. The degree-shifting path uses that established zero-weight case.

## Verified library boundary

The pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Each following actual declaration was read with its typeclass assumptions at the recorded commit. The reviewed library audit was checked for the parent and suppliers; the new direction has no earlier audited layer. The baseline is useful algebraic infrastructure, rather than a claim that arithmetic cohomology already exists.

- [mathlib:DerivedCategory](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean#L87) — Derived category of an abelian category with a chosen localization; does not supply enhanced smooth sheaves or completed arithmetic cohomology.
- [mathlib:Representation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean#L49) — Algebraic monoid representations as monoid homomorphisms to linear endomorphisms; smoothness and continuity must be supplied separately.
- [mathlib:Fin.revPerm](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Fin/Rev.lean#L35) — Order-reversing involution of Fin n for the longest GL_n Weyl permutation.
- [mathlib:LinearMap.eventually_isCompl_ker_pow_range_pow](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Artinian/Module.lean#L317) — Fitting direct sum for an Artinian and Noetherian module; imports replace any new plan of this decomposition.
- [mathlib:AlgHom.range](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Subalgebra/Basic.lean#L545) — Image subalgebra of an algebra homomorphism, used for Hecke images once their action is constructed.
- [mathlib:AlgHom.mem_range](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Subalgebra/Basic.lean#L549) — Image membership iff existence of a preimage.
- [mathlib:Ideal.exists_pow_inf_eq_pow_smul](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Filtration.lean#L388) — Artin–Rees with a uniform filtration shift for a submodule of a finite module over a Noetherian ring.
- [tauceti:TauCeti.ArtinRees.exists_controlled_lift](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Ideal/ArtinRees.lean#L78) — One Artin–Rees shift serves all surjections onto the fixed submodule and all depths.
- [mathlib:finAddFlip](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Fin/Basic.lean#L307) — Existing equivalence Fin(m+n)≃Fin(n+m) exchanging the two blocks. CL.0 identifies this carrier with the relative Siegel Weyl element; it does not define a second block-permutation library.

DerivedCategory localizes cochain complexes in an abelian category with a chosen derived-category construction. It does not supply enhanced completed smooth sheaves. Representation is an algebraic monoid representation; it has no smoothness or continuity requirement. The Fitting result assumes both Artinian and Noetherian modules and is used through the finite ordinary projector supplier. AlgHom.range supplies a genuine image once the actual action exists. Artin–Rees supplies a uniform filtration shift, not an equality of torsion and integral Hecke images.

The pinned abstract group-cohomology carrier is a near miss for continuous compact invariants. Rank-one GL₂ Bruhat theory is a near miss for the general local-topological comparison. Keyword/namespace searches found no applicable crystalline/BT deformation or Borel–Serre arithmetic carrier at the Tau Ceti pin. These search results support the named supplier requests; they are not an exhaustive theorem of library absence.

The independent design review confirms all fourteen inherited source findings and adds E19 (the missing coefficient dual in the exterior-power formula) and E20 (the incoming spectral-sequence index). The author PDF was compared only for Lemma 5.6.5, whose printed conclusion remains unchanged; no complete author/journal collation is claimed. The exact read versions, hashes and scoped comparison are recorded in `sourceVersions`.

## Layers and declarations

Each declaration uses the standing conventions with its explicit local variations. Direct prerequisites and proof sketches are conditional on the named supplier exports and requests. API items and tests specify genuine objects; all implementation statuses remain unchecked.

## CL.0. Siegel parahorics and integral coefficient actions

Fix the lower-right GL_n Levi of split U(n,n), descending dual Weyl weights and geometric Frobenius. Construct Siegel block exchange using existing finite permutations; define P(b,c) by C≡0 mod ϖ_v^c and A,D≡1 mod ϖ_v^b, c≥b≥0,c≥1; define positive central block cocharacters and the resulting positive parahoric monoid. Prove positivity and the commutative monoid-Hecke isomorphism. Define separate unitary and Levi lowest-weight characters using their respective longest Weyl elements and the action α(g)^{-1}ρ(g), prove lattice stability and surjective Levi coefficient evaluation, and identify the U_v residual determinant eigenvalue.

Direct stage dependencies: ArithmeticLocallySymmetricSpaces:ALS.1; ArithmeticLocallySymmetricSpaces:ALS.3; IntegralHeckeAndGaloisDeterminants:IHG.3; IntegralHeckeAndGaloisDeterminants:IHG.5; PotentialAutomorphyInfrastructure:PA.0; PotentialAutomorphyInfrastructure:PA.1; PotentialAutomorphyInfrastructure:PA.2; SmoothRepresentationsOfLocalGroups:SR.0:abelian-category; SmoothRepresentationsOfLocalGroups:SR.4.

### Siegel block-exchange Weyl element

**Construction** · CrystallineLocalGlobalCompatibilityCM:CL.0/weyl-elements · proposed name CrystallineCM.WeylElements

The Siegel block-exchange element w₀^P of the split GL_{2n} Weyl group is w₀^G w₀^{G̃}, where the generic longest permutations are imported. On Fin(2n) it sends i<n to i+n and i≥n to i−n; its square is 1. It is the longest relative representative in ^PW^P. This node constructs the block exchange, not another generic Weyl group or longest-element library.

Direct prerequisites: mathlib:Fin.revPerm; PotentialAutomorphyInfrastructure:PA.1/kostant-shuffles; PotentialAutomorphyInfrastructure:PA.0/unitary-levi-weight-dictionary; mathlib:finAddFlip.

Proof/construction outline:

1. Use Fin.revPerm for the two longest GL_n block permutations and GL_{2n} reversal; multiply their permutation matrices in the fixed split-place identification.
2. Verify that their product swaps the n-blocks without reversing either block; compare with PA.1/kostant-shuffles.

Sources: CN25v3, §2.1.11, p.17.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-7: Conjugates the open-cell Levi action and the twisted Satake target by block exchange; involutivity prevents an extra transpose or inversion.
- CrystallineLocalGlobalCompatibilityCM:CL.6/ord-hecke-algebras-4-2: Conjugates the open-cell Levi action and the twisted Satake target by block exchange; involutivity prevents an extra transpose or inversion.
- CrystallineLocalGlobalCompatibilityCM:CL.0/lowest-weight-scaling-character: Conjugates the open-cell Levi action and the twisted Satake target by block exchange; involutivity prevents an extra transpose or inversion.

Planning API:

- **CrystallineCM.WeylElements_apply** (data): For the Siegel exchange e on Fin(2n), e(i)=i+n for i<n and i−n otherwise.
- **CrystallineCM.WeylElements_involutive** (simp): e∘e=id, so conjugation twice returns the original Levi action.
- **CrystallineCM.WeylElements_levi_conjugation** (compatibility): Conjugation by the exchange permutation matrix sends diag(A,D) to diag(D,A), without transpose or inversion.

Discriminating unit tests:

- **CrystallineCM.WeylElements_test_n_one** (computation): At n=1 the exchange swaps the two coordinates.
- **CrystallineCM.WeylElements_test_n_zero** (degenerate): At n=0 it is the unique permutation of the empty set.
- **CrystallineCM.WeylElements_test_not_reverse** (non-example): At n=2 the exchange sends (0,1,2,3) to (2,3,0,1), whereas the full longest element sends it to (3,2,1,0).

### Surjectivity of evaluation at the identity

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-12 · proposed name CrystallineCM.coefficient_evaluation_surjective · **Planet: Surjective coefficient evaluation**

Let P_{n,n} ⊂ GL_{2n} be the block upper-triangular parabolic with Levi GL_n × GL_n, so that V_{λ̃_τ} is the evaluation of (Ind_{P_{n,n}}^{GL_{2n}} V_{λ_τ̃} ⊗ V_{−w_{0,n}λ_{τ̃c}})_{/O}. The natural P_{n,n}(O)-equivariant morphism V_{λ̃_τ} → V_{λ_τ̃} ⊗ V_{−w_{0,n}λ_{τ̃c}} given by evaluation of functions at the identity is surjective.

Direct prerequisites: ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system; PotentialAutomorphyInfrastructure:PA.0/unitary-levi-weight-dictionary; PotentialAutomorphyInfrastructure:PA.0.

Proof/construction outline:

1. Use transitivity of algebraic induction and the Levi weight dictionary to identify the evaluation target.
2. Surjectivity after residue-field reduction follows from the cited algebraic dual Weyl/Schubert evaluation argument; Nakayama gives integral surjectivity. The missing integral representation-theory export is recorded separately.

Sources: CN25v3, Lemma 2.1.12, pp.17–18.

### Parahoric levels P_{v̄}(b,c), Q_{v̄}, the operators Ũ and the monoids Δ̃

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c) · proposed name CrystallineCM.ParahoricPVBC · **Planet: Siegel parahoric levels**

For c≥b≥0, c≥1, under ι_ṽ define P_{v̄}(b,c)⊂GL_{2n}(O_{F_ṽ}) by C≡0 mod ϖ_ṽ^c in g=(A B;C D), A≡D≡1_n mod ϖ_ṽ^b. P_{v̄}(0,1) is the Siegel parahoric. For Q⊂P standard, 𝒬 is the inverse image of Q(k_ṽ) under reduction; its Levi intersection is K_Q. These are integral compact-open subgroups, with b=0 imposing no diagonal congruence.

Direct prerequisites: PotentialAutomorphyInfrastructure:PA.2/unitary-ordinary-tower; SmoothRepresentationsOfLocalGroups:SR.0:abelian-category.

Proof/construction outline:

1. Construct the stated carrier from the explicitly listed supplier objects and the displayed formulas, retaining every group or Hecke action.
2. The API below specifies the defining projections, normalization and comparison needed at the recorded uses. Verify those identities without changing the coefficient category.

Sources: CN25v3, §2.1.13, p.19.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-15: Controls diagonal congruence quotient and contracting invariants while retaining the full upper unipotent block; the b=0 convention is used in level recovery.
- CrystallineLocalGlobalCompatibilityCM:CL.0/rescaled-actions: Controls diagonal congruence quotient and contracting invariants while retaining the full upper unipotent block; the b=0 convention is used in level recovery.
- CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-finite-level: Controls diagonal congruence quotient and contracting invariants while retaining the full upper unipotent block; the b=0 convention is used in level recovery.
- CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors: Controls diagonal congruence quotient and contracting invariants while retaining the full upper unipotent block; the b=0 convention is used in level recovery.
- CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-5: Controls diagonal congruence quotient and contracting invariants while retaining the full upper unipotent block; the b=0 convention is used in level recovery.
- CrystallineLocalGlobalCompatibilityCM:CL.0/positive-central-cocharacters: Controls diagonal congruence quotient and contracting invariants while retaining the full upper unipotent block; the b=0 convention is used in level recovery.
- CrystallineLocalGlobalCompatibilityCM:CL.1/unipotent-transfer-action: Controls diagonal congruence quotient and contracting invariants while retaining the full upper unipotent block; the b=0 convention is used in level recovery.
- CrystallineLocalGlobalCompatibilityCM:CL.6/deep-levi-level: Controls diagonal congruence quotient and contracting invariants while retaining the full upper unipotent block; the b=0 convention is used in level recovery.
- CrystallineLocalGlobalCompatibilityCM:CL.6/deep-unitary-level: Controls diagonal congruence quotient and contracting invariants while retaining the full upper unipotent block; the b=0 convention is used in level recovery.

Planning API:

- **CrystallineCM.ParahoricPVBC_mem_iff** (characterisation): g=(A B;C D) belongs iff C is divisible by ϖ_v^c and A−1,D−1 by ϖ_v^b.
- **CrystallineCM.ParahoricPVBC_antitone_depth** (relation): For b′≥b,c′≥c satisfying validity, P(b′,c′)⊂P(b,c).
- **CrystallineCM.ParahoricPVBC_levi_quotient** (projection): The block-diagonal reduction gives P(0,c)/P(b,c)≅GL_n(O_v/ϖ_v^b)×GL_n(O_v/ϖ_v^b), for c≥b.

Discriminating unit tests:

- **CrystallineCM.ParahoricPVBC_test_b_zero** (degenerate): P(0,1) allows arbitrary invertible diagonal blocks and arbitrary upper-right integral block.
- **CrystallineCM.ParahoricPVBC_test_n_one** (computation): For n=1,b=c=1, (1 1;0 1) belongs while (1 0;1 1) does not.
- **CrystallineCM.ParahoricPVBC_test_diagonal_not_unipotent** (non-example): For residue field F₃, diag(2,1) belongs to P(0,1) but not P(1,1).

### Positive central cocharacters

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.0/positive-central-cocharacters · proposed name CrystallineCM.PositiveCentralCocharacters

For Q with consecutive block sizes n₁,…,n_t refining (n,n), X_Q consists of central cocharacters constant on each block with integer exponents a₁≥⋯≥a_t. Evaluation at ϖ gives diag(ϖ^{a₁}1_{n₁},…,ϖ^{a_t}1_{n_t}); partial cocharacters have a₁=⋯=a_k=1 and the rest 0. Central overall shifts are allowed, including negative shifts.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c).

Proof/construction outline:

1. Apply the displayed formula using the named supplier carrier and its functorial action.
2. The API and discriminating tests below fix its normalization and distinguish it from the adjacent ordinary or dual construction.

Sources: CN25v3, §2.1.13, p.19.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.0/positive-parahoric-monoid: Specifies the contracting cone, its product law and partial block generators used in the coefficient character and ordinary Hecke operators.

Planning API:

- **CrystallineCM.PositiveCentralCocharacters_mem_iff** (characterisation): A block-central tuple belongs to X_Q iff a₁≥⋯≥a_t.
- **CrystallineCM.PositiveCentralCocharacters_add** (structure): X_Q is closed under addition, and evaluation sends addition to multiplication of diagonal matrices.
- **CrystallineCM.PositiveCentralCocharacters_partial** (constructor): The k-th tuple (1,…,1,0,…,0) belongs; k=t is the invertible scalar tuple.

Discriminating unit tests:

- **CrystallineCM.PositiveCentralCocharacters_test_two_blocks** (computation): For (n,n), exponent tuples (1,0) and (−1,−2) are positive; (0,1) is not.
- **CrystallineCM.PositiveCentralCocharacters_test_central_scalar** (degenerate): For any allowed Q⊂P, a scalar tuple (a,…,a), including a<0, belongs to X_Q; this does not require the out-of-scope Q=GL_{2n}.
- **CrystallineCM.PositiveCentralCocharacters_test_root_pairing** (compatibility): For the block boundary simple root a_k−a_{k+1} is the pairing, so the cone agrees with the reductive-group dominant cone.

### Positive parahoric monoid

**Construction** · CrystallineLocalGlobalCompatibilityCM:CL.0/positive-parahoric-monoid · proposed name CrystallineCM.PositiveParahoricMonoid

Δ̃^Q=⋃_{ν∈X_Q}𝒬ν(ϖ)𝒬⊂G̃(L); Δ^{Q,+}=Δ̃^Q∩G(L), and Δ^Q is obtained by adjoining the inverse of ũ_n to Δ^{Q,+}. The semidirect submonoid acting through P is Δ^{Q,+}⋉U₀. Δ^Q inverts ũ_n, not every positive partial block cocharacter.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/positive-central-cocharacters; CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c).

Proof/construction outline:

1. Define the union of compact double cosets using the positive block-central cone. Contracting root groups and the Iwahori decomposition show that products remain in the union; the proof of Lemma 2.1.15 exports this closure calculation and the Hecke comparison.
2. Intersect with the fixed Siegel Levi and centrally localize its positive monoid at ũ_n; verify the unique extension of actions for which that operator is invertible.

Sources: CN25v3, §2.1.13, pp.19–20.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors: Supplies the actual contracting monoid and its localization so finite-sum transfer and integral rescaled Hecke actions have their correct source and target.
- CrystallineLocalGlobalCompatibilityCM:CL.0/lowest-weight-scaling-character: Supplies the actual contracting monoid and its localization so finite-sum transfer and integral rescaled Hecke actions have their correct source and target.
- CrystallineLocalGlobalCompatibilityCM:CL.4/Q-ordinary-hecke: Supplies the actual contracting monoid and its localization so finite-sum transfer and integral rescaled Hecke actions have their correct source and target.
- CrystallineLocalGlobalCompatibilityCM:CL.1/parahoric-variant: Supplies the actual contracting monoid and its localization so finite-sum transfer and integral rescaled Hecke actions have their correct source and target.

Planning API:

- **CrystallineCM.PositiveParahoricMonoid_double_coset** (constructor): Each g∈𝒬ν(ϖ)𝒬 with ν∈X_Q maps to Δ̃^Q.
- **CrystallineCM.PositiveParahoricMonoid_levi_intersection** (compatibility): Its intersection with the embedded G(L) is exactly Δ^{Q,+}, with the same multiplication.
- **CrystallineCM.PositiveParahoricMonoid_localization** (universal-property): A Δ^{Q,+}-action with ũ_n invertible extends uniquely to Δ^Q.

Discriminating unit tests:

- **CrystallineCM.PositiveParahoricMonoid_test_identity** (degenerate): The zero cocharacter gives all of 𝒬, including the identity.
- **CrystallineCM.PositiveParahoricMonoid_test_negative_central** (computation): ϖ^{-1}1_{2n} belongs because its block-exponent differences are zero.
- **CrystallineCM.PositiveParahoricMonoid_test_partial_inverse** (non-example): For two blocks diag(1_n,ϖ1_n) is not positive although it is invertible in G̃(L); positivity is not the whole group.

### Positivity, monoid property and Hecke algebra isomorphism for Δ̃^Q

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-15 · proposed name CrystallineCM.positive_parahoric_hecke_iso

(1) For ν ∈ X_{Q_{v̄}}, ν(ϖ_{v̄}) is 𝒬_{v̄}-positive: ν(ϖ)(N_Q ∩ 𝒬)ν(ϖ)^{−1} ⊂ N_Q ∩ 𝒬 and ν(ϖ)^{−1}(N̄_Q ∩ 𝒬)ν(ϖ) ⊂ N̄_Q ∩ 𝒬. (2) Δ̃^{Q}_{v̄} is a monoid. (3) [(M_Q ∩ 𝒬)ν(ϖ)(M_Q ∩ 𝒬)] ↦ [𝒬 ν(ϖ) 𝒬] is a ring isomorphism H(M_Q ∩ Δ̃^Q, M_Q ∩ 𝒬) ≅ H(Δ̃^Q, 𝒬), factoring through an isomorphism to H(Δ^{Q,+}, G(F⁺_{v̄}) ∩ 𝒬); in particular H(Δ̃^Q, 𝒬) is commutative.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c); SmoothRepresentationsOfLocalGroups:SR.4; ArithmeticLocallySymmetricSpaces:ALS.3/hecke-composition; CrystallineLocalGlobalCompatibilityCM:CL.0/positive-parahoric-monoid; CrystallineLocalGlobalCompatibilityCM:CL.0/positive-central-cocharacters.

Proof/construction outline:

1. Compute conjugation of each root subgroup by ν(ϖ); dominant central block exponents contract N_Q and expand its opposite.
2. Use Iwahori decomposition and the double-coset product formula to show positivity is multiplicative. The Levi-to-parahoric Hecke map is bijective on the ν-basis and preserves convolution.

Sources: CN25v3, Lemma 2.1.15, p.20; Remark 2.1.16.

### Lowest-weight scaling character

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.0/lowest-weight-scaling-character · proposed name CrystallineCM.LowestWeightScalingCharacter

For the dual Weyl weight λ̃ and Q, define α̃_λ̃:Δ̃^Q→E×, trivial on 𝒬, by α̃_λ̃(ν(ϖ))=∏_τ τ(ϖ)^{⟨ν,w₀^{G̃}λ̃_τ⟩}. Separately define α_λ:Δ^Q→E×, trivial on K_Q, by α_λ(ν(ϖ))=∏_τ τ(ϖ)^{⟨ν,w₀^Gλ̃_τ⟩}, with ν in the actual lower-right/conjugate-dual Levi embedding and w₀^G reversing each n-block. Extend the latter to inverse powers of ũ_n. The two longest Weyl elements differ; equality of α̃ restricted to the Levi and α_λ is not asserted.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-15; CrystallineLocalGlobalCompatibilityCM:CL.0/weyl-elements; PotentialAutomorphyInfrastructure:PA.0/unitary-levi-weight-dictionary; CrystallineLocalGlobalCompatibilityCM:CL.0/positive-parahoric-monoid.

Proof/construction outline:

1. Use uniqueness of the positive compact-double-coset central exponent to define each character by its displayed weight pairing. Additivity of the pairing and the monoid multiplication give multiplicativity.
2. Use the separate longest Weyl elements w₀^{G̃} and w₀^G; compare only after the block exchange required by Proposition 2.2.15.

Sources: CN25v3, §2.1.13, p.20 (unitary character); CN25v3, §2.1.13, p.21 (Levi character).

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.0/rescaled-actions: Removes the lowest-weight uniformizer scalar to keep the integral lattice stable and the selected Levi ũ_n action trivial.

Planning API:

- **CrystallineCM.LowestWeightScalingCharacter_compact** (simp): α̃(q)=1 for q∈𝒬.
- **CrystallineCM.LowestWeightScalingCharacter_cocharacter** (data): α̃(ν(ϖ))=∏_τ τ(ϖ)^{⟨ν,w₀λ̃_τ⟩}.
- **CrystallineCM.LowestWeightScalingCharacter_mul** (functoriality): Each of α̃ and α_λ is multiplicative on its own monoid; the Levi character extends uniquely when ũ_n is inverted. Their relation in coefficient comparison uses the explicit w₀^P block exchange, rather than equality by restriction.

Discriminating unit tests:

- **CrystallineCM.LowestWeightScalingCharacter_test_zero_weight** (degenerate): For λ̃=0, α̃ is the trivial character.
- **CrystallineCM.LowestWeightScalingCharacter_test_rank_one** (computation): For GL₂, λ̃=(a,b) and ν=(1,0), α̃(ν(ϖ))=ϖ^b at the identity embedding.
- **CrystallineCM.LowestWeightScalingCharacter_test_compact_value** (compatibility): A compact parahoric element has α̃=1, agreeing with the original integral lattice action.
- **CrystallineCM.LowestWeightScalingCharacter_test_distinct_weyl** (non-example): For n=2, λ̃=(1,1,0,0) and ν=(1,1,0,0), α̃(ν(ϖ))=1 while α_λ(ν(ϖ))=ϖ² at one embedding. Equality by restriction would fail this allowed Siegel example.

### Rescaled actions of the monoids on coefficient lattices

**Construction** · CrystallineLocalGlobalCompatibilityCM:CL.0/rescaled-actions · proposed name CrystallineCM.RescaledActions · **Planet: Rescaled coefficient actions**

For an E-linear representation ρ of Δ̃^Q and its lowest-weight scaling character α̃, define ρ^{scaled}(g)=α̃(g)^{-1}ρ(g). The lattice and integral coefficient sheaf use its restriction provided Lemma 2.1.17 holds. The Levi action similarly uses α_λ^{-1}; rescaled ũ_n acts as identity on V_λ. This corrects E8; multiplying by α rather than its inverse gives the wrong integral action.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c); PotentialAutomorphyInfrastructure:PA.0/unitary-levi-weight-dictionary; mathlib:Representation; CrystallineLocalGlobalCompatibilityCM:CL.0/lowest-weight-scaling-character.

Proof/construction outline:

1. Construct the stated carrier from the explicitly listed supplier objects and the displayed formulas, retaining every group or Hecke action.
2. The API below specifies the defining projections, normalization and comparison needed at the recorded uses. Verify those identities without changing the coefficient category.

Sources: CN25v3, Lemma 2.1.17, p.20; Levi action (corrected E8), p.21.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-17: Makes the coefficient evaluation kernel nilpotent modulo ϖ^m and fixes the normalization of every weight-dependent partial Hecke operator.
- CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-finite-level: Makes the coefficient evaluation kernel nilpotent modulo ϖ^m and fixes the normalization of every weight-dependent partial Hecke operator.
- CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-16: Makes the coefficient evaluation kernel nilpotent modulo ϖ^m and fixes the normalization of every weight-dependent partial Hecke operator.
- CrystallineLocalGlobalCompatibilityCM:CL.4/Q-ordinary-hecke: Makes the coefficient evaluation kernel nilpotent modulo ϖ^m and fixes the normalization of every weight-dependent partial Hecke operator.

Planning API:

- **CrystallineCM.RescaledActions_apply** (data): ρ_scaled(g)x=α(g)^{-1}ρ(g)x.
- **CrystallineCM.RescaledActions_one_mul** (structure): ρ_scaled is a monoid representation: its identity is identity and products act by composed operators.
- **CrystallineCM.RescaledActions_intertwiner** (functoriality): An E-linear ρ-intertwiner for the same character α remains an intertwiner after rescaling.

Discriminating unit tests:

- **CrystallineCM.RescaledActions_test_trivial_character** (degenerate): If α=1, rescaling returns the original representation.
- **CrystallineCM.RescaledActions_test_scalar** (computation): On a one-dimensional Q-vector space with ρ(g)=2 and α(g)=2, the rescaled operator is identity.
- **CrystallineCM.RescaledActions_test_inverse_required** (non-example): In that scalar example multiplying by α gives 4, which fails the normalization.

### Stability of the lattice under the rescaled monoid action

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-17 · proposed name CrystallineCM.rescaled_lattice_stable

For v̄ ∈ S̄ and τ ∈ Hom(F⁺_{v̄},E), the lattice V_{λ̃_τ} is stable under the rescaled action (2.1.7) of O[Δ̃^{Q}_{v̄}].

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/rescaled-actions; CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-12; PotentialAutomorphyInfrastructure:PA.0.

Proof/construction outline:

1. Decompose the dual Weyl lattice into weight spaces; every weight differs from w₀λ̃ by nonnegative positive-root combinations.
2. Divide the algebraic action by the lowest-weight character; positivity makes each resulting power of τ(ϖ) integral. Compact parahoric factors preserve the lattice.

Sources: CN25v3, Lemma 2.1.17, p.20.

### The eigenvalue of U_v on localized cohomology

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-21 · proposed name CrystallineCM.residual_central_hecke_eigenvalue

Let m ⊂ T^T(K,λ) be as in thm-2-1-20 with k = k(m), and v a p-adic place of F. Then the Hecke operator U_v has a unique eigenvalue on H^*(X_K, V_λ/ϖ)_m, equal to ε̄_p^{n(n−1)/2}(Art_{F_v}(ϖ_v)) · det ρ̄_m(Art_{F_v}(ϖ_v)).

Direct prerequisites: IntegralHeckeAndGaloisDeterminants:IHG.5; IntegralHeckeAndGaloisDeterminants:IHG.3/gln-satake-coefficients; ArithmeticLocallySymmetricSpaces:ALS.3/hecke-operator-formula; ArithmeticLocallySymmetricSpaces:ALS.3.

Proof/construction outline:

1. Let ψ_m=ε̄_p^{n(n−1)/2}detρ̄_m∘Art_F be the global finite central character. Compare it with the rescaled adelic-centre action on localized finite cohomology; choose a central compact open K_Z inside the level through which both factor.
2. The finite ray-class quotient and Chebotarev produce w∉T such that ϖ_w and ϖ_v have the same ray class. A correcting archimedean central element makes their actions on X_K coincide; the centre acts trivially on the rescaled coefficient lattice.
3. F_∞× has no nontrivial finite quotient, so its cohomology action is trivial. At w the unique eigenvalue is T_{w,n} mod m by the good-prime determinant polynomial. Transport it through ψ_m to Art_{F_v}(ϖ_v). Do not use an unramified Frobenius formula at the ramified p-place.

Sources: CN25v3, Lemma 2.1.21, pp.22–23.

## CL.1. P-ordinary functors and completed level control

Construct P-ordinary finite-level cohomology using imported ordinary projectors. On smooth O/ϖ^m representations define finite-sum contracting transfer, exact monoid localization in ũ_n alone, and POrd=ord RΓ(U₀,−). Construct completed interior and boundary objects at fixed tame level. Prove that compact Levi derived invariants recover ordinary finite-level cohomology for c≥b≥0,c≥1; increasing c with b fixed is an isomorphism. Extend this control to Q⊂P parahorics without replacing POrd by full QOrd.

Direct stage dependencies: ArithmeticLocallySymmetricSpaces:ALS.1; ArithmeticLocallySymmetricSpaces:ALS.3; ArithmeticLocallySymmetricSpaces:ALS.4; ArithmeticLocallySymmetricSpaces:ALS.6; CrystallineLocalGlobalCompatibilityCM:CL.0; IntegralHeckeAndGaloisDeterminants:IHG.2; PadicFamilies:L0a; SmoothRepresentationsOfLocalGroups:SR.0:abelian-category; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees.

### P-ordinary part of finite-level cohomology

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-finite-level · proposed name CrystallineCM.POrdinaryFiniteLevel · **Planet: P-ordinary cohomology**

Fix S̄ ⊂ S̄_p and good K̃ with fixed tame level and K̃_{v̄} = P_{v̄}(b,c) (c ≥ b ≥ 0, c ≥ 1) for v̄ ∈ S̄, written K̃(b,c), P_{S̄}(b,c) := ∏_{v̄∈S̄} P_{v̄}(b,c). The P-ordinary part RΓ(X̃_{K̃(b,c)}, V_λ̃)^{ord} is the maximal direct summand of RΓ(X̃_{K̃(b,c)}, V_λ̃) on which all Ũ_{ṽ,n} (v̄ ∈ S̄) act invertibly; it is an object of D⁺(P_{S̄}(0,c)/P_{S̄}(b,c), O) with an action of T̃^T ⊗ (⊗_{v̄∈S̄} H(Δ̃_{v̄}, K̃_{v̄})[Ũ^{−1}_{ṽ,n}]); likewise for ∂X̃_{K̃(b,c)}.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c); CrystallineLocalGlobalCompatibilityCM:CL.0/rescaled-actions; CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-17; PadicFamilies:L0a/derived-ordinary-idempotent; PadicFamilies:L0a/ordinary-part-complexes; ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model.

Proof/construction outline:

1. Construct the stated carrier from the explicitly listed supplier objects and the displayed formulas, retaining every group or Hecke action.
2. The API below specifies the defining projections, normalization and comparison needed at the recorded uses. Verify those identities without changing the coefficient category.

Sources: CN25v3, §2.2.1, pp.25–26.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.1/prop-2-2-8: Selects the direct summand where the Siegel operators are invertible; it is recovered from compact Levi invariants of the completed ordinary object.
- CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-A: Selects the direct summand where the Siegel operators are invertible; it is recovered from compact Levi invariants of the completed ordinary object.

Planning API:

- **CrystallineCM.POrdinaryFiniteLevel_idempotent** (projection): The finite or adic ordinary projector on the arithmetic complex is idempotent and commutes with the tame Hecke and quotient-group actions.
- **CrystallineCM.POrdinaryFiniteLevel_cohomology** (compatibility): Its cohomology is the maximal summand of H^q on which every chosen Ũ_n acts bijectively.
- **CrystallineCM.POrdinaryFiniteLevel_pullback** (functoriality): Level pullback maps commuting with Ũ_n restrict to the ordinary summands; its inclusion is a natural split map.

Discriminating unit tests:

- **CrystallineCM.POrdinaryFiniteLevel_test_unit** (degenerate): For U=id the whole arithmetic coefficient complex is ordinary.
- **CrystallineCM.POrdinaryFiniteLevel_test_zero** (degenerate): For U=0 the ordinary summand is zero.
- **CrystallineCM.POrdinaryFiniteLevel_test_mixed** (computation): For diag(1,0) on F₃² in degree zero, the ordinary part is the first coordinate, in agreement with Mathlib Fitting range/ker.

### Unipotent transfer action

**Construction** · CrystallineLocalGlobalCompatibilityCM:CL.1/unipotent-transfer-action · proposed name CrystallineCM.UnipotentTransferAction

For contracting g∈Δ⁺ and π smooth on Δ⁺⋉U₀, act on Γ(U₀,π) by T_g(v)=Σ_{n∈U₀/gU₀g^{-1}}ngv. This is independent of coset representatives, is integral without averaging denominators, and is multiplicative in g. Derive the same action on RΓ(U₀,π).

Direct prerequisites: SmoothRepresentationsOfLocalGroups:SR.0:abelian-category; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees; CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c).

Proof/construction outline:

1. Apply the displayed formula using the named supplier carrier and its functorial action.
2. The API and discriminating tests below fix its normalization and distinguish it from the adjacent ordinary or dual construction.

Sources: CN25v3, §2.2.2, equation (2.2.1), p.26.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors: Defines the Hecke action on compact invariants and its derived functor; the finite-index factor is essential to the ordinary degree shift.

Planning API:

- **CrystallineCM.UnipotentTransferAction_independent** (extensionality): Replacing any representative n by an element of its same left coset does not change T_g on U₀-invariants.
- **CrystallineCM.UnipotentTransferAction_mul** (structure): T_{gh}=T_g∘T_h and T_1=id.
- **CrystallineCM.UnipotentTransferAction_compact** (compatibility): When g normalizes U₀, T_g is the usual g-action because the quotient has one element.

Discriminating unit tests:

- **CrystallineCM.UnipotentTransferAction_test_trivial_u** (degenerate): For U₀=1 the transfer action is the original g-action.
- **CrystallineCM.UnipotentTransferAction_test_index_p** (computation): For U₀=Z_p,g contracting by p and trivial F_p coefficients, T_g=p·id=0.
- **CrystallineCM.UnipotentTransferAction_test_not_raw** (non-example): In this index-p example raw g=id would incorrectly make it ordinary.

### Ordinary monoid localization

**Construction** · CrystallineLocalGlobalCompatibilityCM:CL.1/ordinary-monoid-localization · proposed name CrystallineCM.OrdinaryMonoidLocalization

For smooth Δ⁺-modules over R_m, ord is the filtered colimit under products of the commuting central operators ũ_n, regarded as a smooth Δ-module. It is exact and preserves the injectives needed to derive compact invariants. Do not replace it by a finite-projector formula for arbitrary smooth infinite modules.

Direct prerequisites: SmoothRepresentationsOfLocalGroups:SR.0:abelian-category; IntegralHeckeAndGaloisDeterminants:IHG.2/ordinary-localization-comparison.

Proof/construction outline:

1. Apply the displayed formula using the named supplier carrier and its functorial action.
2. The API and discriminating tests below fix its normalization and distinguish it from the adjacent ordinary or dual construction.

Sources: CN25v3, §2.2.2, p.26.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors: Makes ũ_n invertible before compact Levi derived invariants; exactness compares cohomology and ordinary localization, including infinite smooth modules.

Planning API:

- **CrystallineCM.OrdinaryMonoidLocalization_unit** (constructor): Every smooth π maps naturally to ord π by the filtered-colimit structure map.
- **CrystallineCM.OrdinaryMonoidLocalization_universal** (universal-property): Maps from π into a Δ-module extend uniquely through ord π.
- **CrystallineCM.OrdinaryMonoidLocalization_cohomology** (compatibility): Exact localization satisfies H^j(ord C)=ord H^j(C), with the same operator action.

Discriminating unit tests:

- **CrystallineCM.OrdinaryMonoidLocalization_test_id** (degenerate): Localization under U=id is π itself.
- **CrystallineCM.OrdinaryMonoidLocalization_test_nilpotent** (computation): If U^r=0, ord π=0 even when π is infinite-dimensional.
- **CrystallineCM.OrdinaryMonoidLocalization_test_finite** (compatibility): On a finite module it agrees with the imported finite ordinary projector; for diag(1,0) it is the first coordinate.

### Functors of P-ordinary parts of smooth representations

**Construction** · CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors · proposed name CrystallineCM.POrdinaryFunctors · **Planet: P-ordinary parts**

For π smooth over R_m=O/ϖ^m on Δ̃^{Q,+}, define POrd(π)=ord RΓ(U₀,π) in D⁺_sm(Δ,R_m), where U₀-invariants carry the finite-sum transfer action and ord localizes only the commuting ũ_n operators. Products over selected places give the global local functor. This is a derived functor with a Δ-action; its degree zero is ord Γ(U₀,π).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c); SmoothRepresentationsOfLocalGroups:SR.0:abelian-category; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees; IntegralHeckeAndGaloisDeterminants:IHG.2/ordinary-localization-comparison; CrystallineLocalGlobalCompatibilityCM:CL.1/unipotent-transfer-action; CrystallineLocalGlobalCompatibilityCM:CL.1/ordinary-monoid-localization; mathlib:DerivedCategory; CrystallineLocalGlobalCompatibilityCM:CL.0/positive-parahoric-monoid.

Proof/construction outline:

1. Construct the stated carrier from the explicitly listed supplier objects and the displayed formulas, retaining every group or Hecke action.
2. The API below specifies the defining projections, normalization and comparison needed at the recorded uses. Verify those identities without changing the coefficient category.

Sources: CN25v3, Definition 2.2.3, pp.26–27.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-4: Computes compact unipotent derived invariants with their transfer action, then localizes only the Siegel operators to obtain the level and induction comparisons.
- CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-5: Computes compact unipotent derived invariants with their transfer action, then localizes only the Siegel operators to obtain the level and induction comparisons.
- CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-completed: Computes compact unipotent derived invariants with their transfer action, then localizes only the Siegel operators to obtain the level and induction comparisons.
- CrystallineLocalGlobalCompatibilityCM:CL.1/parahoric-variant: Computes compact unipotent derived invariants with their transfer action, then localizes only the Siegel operators to obtain the level and induction comparisons.
- CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6: Computes compact unipotent derived invariants with their transfer action, then localizes only the Siegel operators to obtain the level and induction comparisons.
- CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-8: Computes compact unipotent derived invariants with their transfer action, then localizes only the Siegel operators to obtain the level and induction comparisons.

Planning API:

- **CrystallineCM.POrdinaryFunctors_degree_zero** (projection): H⁰(POrd π)=ord Γ(U₀,π) for π in degree zero.
- **CrystallineCM.POrdinaryFunctors_derived_action** (data): Each contracting element acts by derived restriction/finite-index transfer, not by its raw representation action.
- **CrystallineCM.POrdinaryFunctors_comparison** (compatibility): For U₀ trivial, POrd π is ordinary monoid localization of π, with no cohomological shift.

Discriminating unit tests:

- **CrystallineCM.POrdinaryFunctors_test_trivial_u** (compatibility): If U₀=1 it equals the ordinary localization with no shift.
- **CrystallineCM.POrdinaryFunctors_test_nilpotent** (non-example): A nonzero π with transfer U nilpotent has zero POrd; merely taking U₀-invariants gives the wrong functor.
- **CrystallineCM.POrdinaryFunctors_test_degree_zero** (characterisation): For π in degree zero H⁰ is ord Γ(U₀,π), while positive cohomology is retained when ordinary transfer permits it.

### Ordinary parts commute with K(b)-invariants

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-4 · proposed name CrystallineCM.ordinary_commutes_compact_invariants

There is a natural isomorphism ord_b ∘ Γ(K_{S̄}(b),−) ≅ Γ(K_{S̄}(b),−) ∘ ord of functors Mod_sm(Δ⁺_{S̄}, O/ϖ^m) → Mod(Δ_{S̄}/K_{S̄}(b), O/ϖ^m), extending to derived functors ord_b ∘ RΓ(K_{S̄}(b),−) ≅ RΓ(K_{S̄}(b),−) ∘ ord.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors; PadicFamilies:L0a/ordinary-projector-natural.

Proof/construction outline:

1. Ordinary localization is the filtered colimit under the commuting contracting operators; K(b) is normal and commutes with its finite-level quotient action.
2. Compare invariant transition maps; exact localization preserves injectives in the smooth monoid category, so the same identification derives.

Sources: CN25v3, Lemma 2.2.4, p.27.

### P-ordinary invariants at level P(b,c)

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-5 · proposed name CrystallineCM.ordinary_parahoric_invariants

For all c ≥ b ≥ 0 with c ≥ 1 there is a natural isomorphism ord_b ∘ Γ(U⁰_{S̄} ⋊ K_{S̄}(b), −) ≅ ord_b ∘ Γ(P_{S̄}(b,c), −) of functors Mod_sm(Δ̃_{S̄}, O/ϖ^m) → Mod(Δ_{S̄}/K_{S̄}(b), O/ϖ^m).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors; CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c).

Proof/construction outline:

1. Use P(b,c)=lower-congruence · K(b) · U₀ and sufficiently large conjugation by powers of ũ_n.
2. The two invariant functors become equal after ordinary localization because the additional lower-congruence restrictions are eventually absorbed.

Sources: CN25v3, Lemma 2.2.5, p.27.

### Derived comparison of P-ordinary parts at finite level

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-6 · proposed name CrystallineCM.derived_ordinary_level_comparison

For π ∈ D⁺_sm(Δ̃_{S̄}, O/ϖ^m) and c ≥ b ≥ 0, c ≥ 1, there is a natural isomorphism RΓ(K_{S̄}(b), ord RΓ(U⁰_{S̄}, π)) ≅ ord_b RΓ(P_{S̄}(b,c), π) in D⁺(Δ_{S̄}/K_{S̄}(b), O/ϖ^m).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-4; CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-5; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees; SmoothRepresentationsOfLocalGroups:SR.0:abelian-category.

Proof/construction outline:

1. Apply the underived invariants comparison and the fact that restriction/ordinary localization preserve the relevant injectives.
2. Use Hochschild–Serre for U₀⋊K(b) and the derived version of Lemma 2.2.4.

Sources: CN25v3, Lemma 2.2.6, p.28.

### P-ordinary completed cohomology

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-completed · proposed name CrystallineCM.POrdinaryCompleted · **Planet: P-ordinary completed cohomology**

π(K̃^{S̄}, λ̃, m) := RΓ(K̃^{S̄}, RΓ(𝔛̄_{G̃}, V_λ̃/ϖ^m)) ∈ D⁺_sm(Δ̃_{S̄}, O/ϖ^m) with T̃^T-action (using lem-2-1-8), satisfying RΓ(P_{S̄}(b,c), π(K̃^{S̄},λ̃,m)) ≅ RΓ(X̃_{K̃(b,c)}, V_λ̃/ϖ^m); π^{ord}(K̃^{S̄},λ̃,m) ∈ D⁺_sm(Δ_{S̄}, O/ϖ^m) is its P-ordinary part (Definition 2.2.3), and π^{ord}_∂ the boundary analogue.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors; ArithmeticLocallySymmetricSpaces:ALS.6; ArithmeticLocallySymmetricSpaces:ALS.3/discrete-topological-comparison.

Proof/construction outline:

1. Construct the stated carrier from the explicitly listed supplier objects and the displayed formulas, retaining every group or Hecke action.
2. The API below specifies the defining projections, normalization and comparison needed at the recorded uses. Verify those identities without changing the coefficient category.

Sources: CN25v3, §2.2.7, p.28.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.1/prop-2-2-8: Recovers finite-level ordinary interior and boundary cohomology by derived compact invariants, and allows weight removal before fixing the selected level.
- CrystallineLocalGlobalCompatibilityCM:CL.1/prop-2-2-10: Recovers finite-level ordinary interior and boundary cohomology by derived compact invariants, and allows weight removal before fixing the selected level.
- CrystallineLocalGlobalCompatibilityCM:CL.2/prop-2-2-15: Recovers finite-level ordinary interior and boundary cohomology by derived compact invariants, and allows weight removal before fixing the selected level.

Planning API:

- **CrystallineCM.POrdinaryCompleted_sections** (data): The underlying completed object is RΓ(K̃^{S̄},RΓ(𝔛̄_{G̃},V/ϖ^m)); its POrd is the object defined by the local functor.
- **CrystallineCM.POrdinaryCompleted_tame** (functoriality): Tame Hecke correspondences act and commute with the local ordinary operators.
- **CrystallineCM.POrdinaryCompleted_boundary** (compatibility): Restriction to boundary intertwines the two completed POrd objects and the finite-level recovery maps.

Discriminating unit tests:

- **CrystallineCM.POrdinaryCompleted_test_empty_places** (degenerate): With S̄=∅ no ordinary operators are imposed and the object is the completed tame-level coefficient complex.
- **CrystallineCM.POrdinaryCompleted_test_level_recovery** (compatibility): For b=0,c=1, compact Levi invariants recover Siegel-parahoric ordinary finite-level cohomology.
- **CrystallineCM.POrdinaryCompleted_test_boundary** (characterisation): Boundary restriction commutes with the same level-recovery square, rather than defining completed boundary cohomology as a quotient of interior cohomology.

### Finite-level P-ordinary cohomology from completed cohomology

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.1/prop-2-2-8 · proposed name CrystallineCM.completed_ordinary_finite_level · **Planet: P-ordinary level control**

For m ≥ 1 and c ≥ b ≥ 0, c ≥ 1, there is a natural T̃^T-equivariant isomorphism RΓ(K_{S̄}(b), π^{ord}(K̃^{S̄},λ̃,m)) ≅ RΓ(X̃_{K̃(b,c)}, V_λ̃/ϖ^m)^{ord} in D⁺(K_{S̄}/K_{S̄}(b), O/ϖ^m).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-6; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-completed; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-finite-level.

Proof/construction outline:

1. Recover finite-level cohomology from completed derived sections by the requested tower theorem.
2. Apply Lemma 2.2.6, keeping the finite quotient group and tame Hecke action.

Sources: CN25v3, Proposition 2.2.8, p.28.

### Independence of level for P-ordinary cohomology

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.1/cor-2-2-9 · proposed name CrystallineCM.ordinary_independence_level

For m ≥ 1 and c ≥ b ≥ 0, c ≥ 1, the natural T̃^T-equivariant morphism RΓ(X̃_{K̃(b,max{1,b})}, V_λ̃/ϖ^m)^{ord} → RΓ(X̃_{K̃(b,c)}, V_λ̃/ϖ^m)^{ord} is an isomorphism in D⁺(K_{S̄}/K_{S̄}(b), O/ϖ^m); the same holds for the Borel–Serre boundary.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/prop-2-2-8; ArithmeticLocallySymmetricSpaces:ALS.1/level-pullback.

Proof/construction outline:

1. Express both levels using the same K(b)-invariants of completed P-ordinary cohomology.
2. Check the pullback map corresponds to the identity through these isomorphisms; repeat for boundary sections.

Sources: CN25v3, Corollary 2.2.9, p.28.

### Boundary version of the P-ordinary comparison

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.1/prop-2-2-10 · proposed name CrystallineCM.completed_boundary_ordinary_finite_level

For m ≥ 1 and c ≥ b ≥ 0, c ≥ 1, RΓ(K_{S̄}(b), π^{ord}_∂(K̃^{S̄},λ̃,m)) ≅ RΓ(∂X̃_{K̃(b,c)}, V_λ̃/ϖ^m)^{ord}, T̃^T-equivariantly, in D⁺(K_{S̄}/K_{S̄}(b), O/ϖ^m).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-6; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-completed; ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle.

Proof/construction outline:

1. Apply the boundary version of compact-open recovery to π_∂.
2. The proof of Proposition 2.2.8 uses only equivariant derived sections and thus applies with the boundary restriction functor.

Sources: CN25v3, Proposition 2.2.10, p.29.

### P-ordinary parts at parahoric level Q

**Construction** · CrystallineLocalGlobalCompatibilityCM:CL.1/parahoric-variant · proposed name CrystallineCM.ParahoricVariant

For standard Q_{v̄}⊂P_{v̄}, with 𝒬_{v̄} its integral parahoric and K_{v̄}=𝒬_{v̄}∩G(F⁺_{v̄}), define the parahoric P-ordinary invariant functor π↦RΓ(K_{S̄},ord RΓ(U₀_{S̄},π)). It takes values in D⁺(K_{S̄}[ũ_n^{±1}]/K_{S̄},O/ϖ^m) with H(Δ^{Q_{S̄}},K_{S̄}) action. Here ord inverts ũ_n alone; it does not invert every Q-partial Hecke operator.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors; CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-15; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees; CrystallineLocalGlobalCompatibilityCM:CL.0/positive-parahoric-monoid.

Proof/construction outline:

1. Construct the stated carrier from the explicitly listed supplier objects and the displayed formulas, retaining every group or Hecke action.
2. The API below specifies the defining projections, normalization and comparison needed at the recorded uses. Verify those identities without changing the coefficient category.

Sources: CN25v3, §2.2.11, p.29.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-12: Compares Q-parahoric derived invariants with Siegel unipotent/Levi ordinary invariants while preserving partial-coset Hecke actions.
- CrystallineLocalGlobalCompatibilityCM:CL.2/dual-p-ordinary: Compares Q-parahoric derived invariants with Siegel unipotent/Levi ordinary invariants while preserving partial-coset Hecke actions.

Planning API:

- **CrystallineCM.ParahoricVariant_invariants** (data): Its value is RΓ(K_Q,ord RΓ(U₀,π)), with ord inverting ũ_n alone.
- **CrystallineCM.ParahoricVariant_hecke** (data): [K_QνK_Q] acts through finite correspondences even when K_Q is not normal in the monoid.
- **CrystallineCM.ParahoricVariant_siegel** (compatibility): For Q=P this specializes to the Siegel P-ordinary invariant functor and Lemma 2.2.6 level comparison.

Discriminating unit tests:

- **CrystallineCM.ParahoricVariant_test_siegel** (compatibility): For Q=P the value agrees with Siegel P-ordinary invariants.
- **CrystallineCM.ParahoricVariant_test_finite_level** (compatibility): At Q=P,b=0,c=1 its completed-tower value identifies with Siegel-parahoric finite-level ordinary cohomology by Proposition 2.2.8.
- **CrystallineCM.ParahoricVariant_test_not_full_qord** (non-example): In the partition (1,1,1,1), inverting Ũ² alone does not imply Ũ¹ and Ũ³ have unit eigenvalues.

### P-ordinary parts at parahoric level with their Hecke actions

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-12 · proposed name CrystallineCM.ordinary_parahoric_hecke_comparison

For π ∈ D⁺_sm(Δ̃^{Q_S̄}_{S̄}, O/ϖ^m) there is a natural isomorphism RΓ(K_{S̄}, ord RΓ(U⁰_{S̄}, π)) ≅ ord₀ RΓ(𝒬_{S̄}, π) in D⁺_sm(K_{S̄}[ũ^{±1}_{ṽ,n}]/K_{S̄}, O/ϖ^m), under which [K_{v̄} ν(ϖ_{v̄}) K_{v̄}] ∈ H(Δ^{Q_S̄}_{S̄}, K_{S̄}) matches [𝒬_{v̄} ν(ϖ_{v̄}) 𝒬_{v̄}].

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/parahoric-variant; CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-6; ArithmeticLocallySymmetricSpaces:ALS.3/hecke-action-on-invariants.

Proof/construction outline:

1. Apply the semidirect U₀ and parahoric invariant comparison, with ord inverting ũ_n alone.
2. Follow restriction/corestriction for ν(ϖ) to identify the two double-coset operators; this is a Hecke action, not a quotient group action when K is not normal.

Sources: CN25v3, Lemma 2.2.12, pp.29–30.

## CL.2. Weight independence and dual ordinary parts

Identify the GL_n coefficient tensor through the conjugate-dual Levi embedding. Prove ũ_n^m annihilates the evaluation kernel modulo ϖ^m, giving ordinary weight independence by removing selected weights and tensoring V_{w₀^Pλ}. Prove the boundary analogue. Construct dual ordinary parts using lower-congruence unipotents and ũ_n^{-1}, and establish the inverse-coset Hecke-equivariant level comparison.

Direct stage dependencies: ArithmeticLocallySymmetricSpaces:ALS.1; ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality; CrystallineLocalGlobalCompatibilityCM:CL.0; CrystallineLocalGlobalCompatibilityCM:CL.1; PotentialAutomorphyInfrastructure:PA.0; SmoothRepresentationsOfLocalGroups:SR.2.

### The Levi coefficient module as a tensor product over the two places

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-14 · proposed name CrystallineCM.levi_coefficient_tensor

Under the identification of K_{S̄} with the block-diagonal Levi of ∏_{v̄∈S̄} P_{n,n}(O_{F_ṽ}) (via (A_ṽ, A_{ṽc}) ↦ diag((Ψ_n ᵗA^{−1}_{ṽc} Ψ_n)^c, A_ṽ)), V_{λ_S̄} ≅ ⊗_{v̄∈S̄} ⊗_{τ∈Hom(F⁺_{v̄},E),O} V_{−w_{0,n}λ_{τ̃c}} ⊗ V_{λ_τ̃}, with both factors acted on through τ̃.

Direct prerequisites: PotentialAutomorphyInfrastructure:PA.0/unitary-levi-weight-dictionary; ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system.

Proof/construction outline:

1. Apply the inverse transpose/conjugate first-block embedding and Ψ_n to the dual Weyl lattice.
2. The highest weight of the first factor is −w_{0,n}λ_{τ̃c}; tensor across embeddings and selected places.

Sources: CN25v3, Lemma 2.2.14, p.30.

### The kernel of evaluation is killed by ũ^m

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-16 · proposed name CrystallineCM.evaluation_kernel_nilpotent

Let τ ∈ Hom(F⁺_{v̄},E) and K_{λ̃_τ} := ker(V_{λ̃_τ} → V_{λ_τ̃} ⊗ V_{−w_{0,n}λ_{τ̃c}}) be the kernel of evaluation at the identity. For every m ≥ 1, (ũ_{ṽ,n})^m (K_{λ̃_τ}/ϖ^m) = 0 (for the rescaled action).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-12; CrystallineLocalGlobalCompatibilityCM:CL.0/rescaled-actions; CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-17; PotentialAutomorphyInfrastructure:PA.0.

Proof/construction outline:

1. The weights in the evaluation kernel contain a positive coefficient of the omitted Siegel simple root.
2. Under the corrected rescaled ũ_n-action each weight space gains at least one local-uniformizer factor per iterate; m iterates vanish modulo the coefficient uniformizer ϖ^m.

Sources: CN25v3, Lemma 2.2.16, pp.31–32.

### Independence of weight for P-ordinary completed cohomology

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.2/prop-2-2-15 · proposed name CrystallineCM.ordinary_independence_weight · **Planet: Independence of weight**

Given dominant λ̃ for G̃ and S̄ ⊆ S̄_p, let λ̃^{S̄} be λ̃ with λ̃_τ replaced by 0 for τ inducing places of S̄, and identify λ̃ with λ via (2.1.4). For every m ≥ 1 there is a natural T̃^T-equivariant isomorphism π^{ord}(K̃^{S̄}, λ̃, m) ≅ π^{ord}(K̃^{S̄}, λ̃^{S̄}, m) ⊗ V_{w₀^P λ_S̄}/ϖ^m in D⁺_sm(Δ^{Q_S̄}_{S̄}, O/ϖ^m).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-12; CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-14; CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-16; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-completed; CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-12; SmoothRepresentationsOfLocalGroups:SR.2.

Proof/construction outline:

1. Tensor the finite free Levi coefficient through smooth induction and completed sections.
2. Use the evaluation exact sequence, Lemma 2.2.16 and exact ordinary localization to kill its kernel, then apply the parahoric invariant comparison.

Sources: CN25v3, Proposition 2.2.15, p.31.

### Independence of weight for boundary P-ordinary completed cohomology

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.2/prop-2-2-17 · proposed name CrystallineCM.boundary_ordinary_independence_weight

With λ̃^{S̄} as in prop-2-2-15, π^{ord}_∂(K̃^{S̄}, λ̃, m) ≅ π^{ord}_∂(K̃^{S̄}, λ̃^{S̄}, m) ⊗ V_{w₀^Pλ_S̄}/ϖ^m, T̃^T-equivariantly in D⁺_sm(Δ^{Q_S̄}_{S̄}, O/ϖ^m).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.2/prop-2-2-15; CrystallineLocalGlobalCompatibilityCM:CL.1/prop-2-2-10.

Proof/construction outline:

1. Repeat the evaluation-kernel argument for boundary derived sections.
2. Preserve the tame Hecke action and the w₀^P-twist exactly as in the interior comparison.

Sources: CN25v3, Proposition 2.2.17, p.32.

### P-ordinary parts for dual coefficients

**Construction** · CrystallineLocalGlobalCompatibilityCM:CL.2/dual-p-ordinary · proposed name CrystallineCM.DualPOrdinary · **Planet: Dual P-ordinary parts**

For v̄ ∈ S̄, ord^∨ and ord^∨₀ are defined using the Hecke action of ũ^{−1}_{ṽ,n} on invariants under Ū¹_{v̄} (the block strictly lower triangular part of the parahoric P_{v̄}) and 𝒬_{v̄}, for representations of the inverse monoid (Δ̃^{Q}_{v̄})^{−1} = ⊔_ν 𝒬 ν(ϖ)^{−1} 𝒬; an independence-of-weight statement for dual coefficients follows the proof of prop-2-2-15 using 0 → V^∨_{w₀^Pλ_S̄} → V^∨_{λ̃_S̄} → K^∨_{λ̃_S̄} → 0 and topological nilpotence of ũ^{−1}_{ṽ,n} on K^∨.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.1/parahoric-variant; CrystallineLocalGlobalCompatibilityCM:CL.2/prop-2-2-15; ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality.

Proof/construction outline:

1. Construct the stated carrier from the explicitly listed supplier objects and the displayed formulas, retaining every group or Hecke action.
2. The API below specifies the defining projections, normalization and comparison needed at the recorded uses. Verify those identities without changing the coefficient category.

Sources: CN25v3, §2.2.18, pp.32–33.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-19: Provides inverse-coset Hecke actions on lower-congruence invariants for the dual middle-degree and low-degree torsion comparisons.
- CrystallineLocalGlobalCompatibilityCM:CL.3/cor-2-3-12: Provides inverse-coset Hecke actions on lower-congruence invariants for the dual middle-degree and low-degree torsion comparisons.
- CrystallineLocalGlobalCompatibilityCM:CL.6/lem-4-2-3: Provides inverse-coset Hecke actions on lower-congruence invariants for the dual middle-degree and low-degree torsion comparisons.
- CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-dual: Provides inverse-coset Hecke actions on lower-congruence invariants for the dual middle-degree and low-degree torsion comparisons.

Planning API:

- **CrystallineCM.DualPOrdinary_inverse_operator** (data): The ordinary transition operator is the double coset ũ_n^{-1} acting on lower-congruence Ū¹-invariants.
- **CrystallineCM.DualPOrdinary_conjugation** (compatibility): Conjugation by ũ_n^{-1}w₀^P identifies the lower and upper invariants, retaining inverse monoids.
- **CrystallineCM.DualPOrdinary_dual_pairing** (compatibility): The finite-level coefficient evaluation pairing intertwines [KgK] with [Kg^{-1}K].

Discriminating unit tests:

- **CrystallineCM.DualPOrdinary_test_trivial_weight** (degenerate): At zero weight the inverse-monoid construction still uses Ū¹ and ũ_n^{-1}; it does not change to the upper ordinary functor automatically.
- **CrystallineCM.DualPOrdinary_test_lower_congruence** (computation): At n=1, Ū¹ consists of (1 0;c 1) with c divisible by the local uniformizer.
- **CrystallineCM.DualPOrdinary_test_adjoints** (compatibility): For an invertible double coset the dual pairing sends its adjoint to g^{-1}, as in the ALS Hecke-adjoint declaration.

### Dual P-ordinary parts at parahoric level

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-19 · proposed name CrystallineCM.dual_ordinary_parahoric_comparison

For π ∈ D⁺_sm((Δ̃^{Q}_{v̄})^{−1}, O/ϖ^m) there is a natural isomorphism RΓ(K_{v̄}, ord^∨ RΓ(Ū¹_{v̄}, π)) ≅ ord^∨₀ RΓ(𝒬_{v̄}, π) in D⁺_sm(K_{v̄}[ũ^{±1}_{ṽ,n}]/K_{v̄}, O/ϖ^m), matching [K ν(ϖ)^{−1} K] with [𝒬 ν(ϖ)^{−1} 𝒬].

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.2/dual-p-ordinary; CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-12.

Proof/construction outline:

1. Conjugate U₀ to the opposite lower congruence subgroup by ũ_n^{-1}w₀^P.
2. Apply Lemma 2.2.12 with inverse double cosets, and verify every Hecke operator is inverted rather than merely dualizing its scalar.

Sources: CN25v3, Lemma 2.2.19, p.32.

## CL.3. Bruhat induction and deep unipotent cohomology

Compare algebraic relative Bruhat closure with the local p-adic topology. Construct unnormalized induction on open length unions, individual strata and open cells, with exact extension/restriction filtration. Prove the cohomological short exact sequences and ordinary open/identity-cell subquotients, retaining the inverse determinant unit character χ and rank shift. In the abelian Siegel case split RΓ(U₀,O/ϖ^m) after sufficiently deep Levi restriction, at arbitrary p. Use the pinned Artin–Rees results to lift finite-module subquotients after increasing the coefficient exponent.

Direct stage dependencies: ArithmeticLocallySymmetricSpaces:ALS.3; ArithmeticLocallySymmetricSpaces:ALS.6; CrystallineLocalGlobalCompatibilityCM:CL.0; CrystallineLocalGlobalCompatibilityCM:CL.1; CrystallineLocalGlobalCompatibilityCM:CL.2; DeformationAndDerivedPatchingAlgebra:R03.3; PotentialAutomorphyInfrastructure:PA.0; PotentialAutomorphyInfrastructure:PA.2; SmoothRepresentationsOfLocalGroups:SR.0:abelian-category; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension; SmoothRepresentationsOfLocalGroups:SR.2; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees; tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory.

### Parabolic Bruhat decomposition and closure relations

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-2 · proposed name CrystallineCM.relative_bruhat_local_closure

Let L be a p-adic field and G/O_L split connected reductive with split maximal torus T ⊂ B ⊂ P = M ⋉ U; W^P ⊂ W the minimal length representatives of W_P\W and ^PW^P := W^P ∩ (W^P)^{−1}. Then G(L) = ⊔_{w∈^PW^P} P(L)wP(L); the closure of P(L)wP(L) (p-adic topology) is ⊔_{w′≤w} P(L)w′P(L) for the Bruhat order; and P(L)ΩP(L) is open for every upper subset Ω ⊂ ^PW^P.

Direct prerequisites: PotentialAutomorphyInfrastructure:PA.2/relative-bruhat-cells; SmoothRepresentationsOfLocalGroups:SR.2; tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory.

Proof/construction outline:

1. Import the parabolic Weyl double cosets and generic algebraic Bruhat closure from the reductive-group supplier.
2. Over L, identify the p-adic closure by the open root-cell charts; upper Bruhat unions are complements of the corresponding closed lower unions.

Sources: CN25v3, §2.3.1, Lemma 2.3.2, p.33.

### The Bruhat filtration functors on parabolic induction

**Construction** · CrystallineLocalGlobalCompatibilityCM:CL.3/induction-filtration-functors · proposed name CrystallineCM.InductionFiltrationFunctors · **Planet: Bruhat filtration**

For a smooth P(L)-module π, define I_{≥i}(π) as locally constant functions on G_{≥i}=⋃_{ℓ(w)≥i}P(L)wP(L), compactly supported modulo P(L), satisfying f(pg)=pf(g), with right P(L)-translation. This is unnormalized induction on the open Bruhat union. I_{≥0} is Res_P Ind_P^{G̃}. The individual stratum and open-cell functors are separate declarations.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-2; SmoothRepresentationsOfLocalGroups:SR.2; SmoothRepresentationsOfLocalGroups:SR.0:abelian-category.

Proof/construction outline:

1. Construct the stated carrier from the explicitly listed supplier objects and the displayed formulas, retaining every group or Hecke action.
2. The API below specifies the defining projections, normalization and comparison needed at the recorded uses. Verify those identities without changing the coefficient category.

Sources: CN25v3, §2.3.1, p.34.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-3: Filters unnormalized parabolic induction by open length unions, producing the exact stratum quotients from which ordinary cohomology subquotients are extracted.
- CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-5: Filters unnormalized parabolic induction by open length unions, producing the exact stratum quotients from which ordinary cohomology subquotients are extracted.
- CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6: Filters unnormalized parabolic induction by open length unions, producing the exact stratum quotients from which ordinary cohomology subquotients are extracted.
- CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-7: Filters unnormalized parabolic induction by open length unions, producing the exact stratum quotients from which ordinary cohomology subquotients are extracted.
- CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-stratum-induction: Filters unnormalized parabolic induction by open length unions, producing the exact stratum quotients from which ordinary cohomology subquotients are extracted.

Planning API:

- **CrystallineCM.InductionFiltrationFunctors_zero** (compatibility): I_{≥0}(π)=Res_P Ind_P^{G̃}(π) in unnormalized conventions.
- **CrystallineCM.InductionFiltrationFunctors_inclusion** (constructor): Extension by zero gives I_{≥i+1}(π)→I_{≥i}(π).
- **CrystallineCM.InductionFiltrationFunctors_restriction** (projection): Restriction to length-i strata gives I_{≥i}(π)→⊕_{ℓ(w)=i}I_w(π).

Discriminating unit tests:

- **CrystallineCM.InductionFiltrationFunctors_test_zero_index** (compatibility): I_{≥0} equals unnormalized parabolic induction restricted to P.
- **CrystallineCM.InductionFiltrationFunctors_test_above_length** (degenerate): If i exceeds the maximum relative Bruhat length, I_{≥i}=0.
- **CrystallineCM.InductionFiltrationFunctors_test_rank_one** (computation): For GL₂ with Borel P the two Bruhat cells give a nonempty open-cell stage and an identity-cell quotient; reversing ≥ to ≤ would reverse these.

### Bruhat stratum induction

**Construction** · CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-stratum-induction · proposed name CrystallineCM.BruhatStratumInduction

For w∈^PW^P, I_w(π) consists of locally constant functions f:P(L)wP(L)→π compactly supported modulo left P(L), with f(pg)=pf(g); right P(L) acts by translation. It is one summand of the length-ℓ(w) quotient I_{≥ℓ(w)}/I_{≥ℓ(w)+1}, whose full quotient is the sum over all strata of that length; it retains the local topology.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/induction-filtration-functors.

Proof/construction outline:

1. Apply the displayed formula using the named supplier carrier and its functorial action.
2. The API and discriminating tests below fix its normalization and distinguish it from the adjacent ordinary or dual construction.

Sources: CN25v3, §2.3.1, p.34.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-3: Retains each cell’s compact-mod-P support and right action in the length quotient, rather than splitting parabolic induction as a direct sum.
- CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6: Retains each cell’s compact-mod-P support and right action in the length quotient, rather than splitting parabolic induction as a direct sum.
- CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-7: Retains each cell’s compact-mod-P support and right action in the length quotient, rather than splitting parabolic induction as a direct sum.
- CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-open-cell-induction: Retains each cell’s compact-mod-P support and right action in the length quotient, rather than splitting parabolic induction as a direct sum.

Planning API:

- **CrystallineCM.BruhatStratumInduction_equivariance** (data): Each f satisfies f(pg)=pf(g) on its stratum.
- **CrystallineCM.BruhatStratumInduction_translation** (structure): Right translation gives the P(L)-action and is compatible with compact-mod-P support.
- **CrystallineCM.BruhatStratumInduction_restriction** (compatibility): The length-i quotient of I_{≥i} restricts to the direct sum of the I_w with ℓ(w)=i.

Discriminating unit tests:

- **CrystallineCM.BruhatStratumInduction_test_identity** (computation): For w=1 the stratum is P(L), and equivariant functions are determined by their value at 1.
- **CrystallineCM.BruhatStratumInduction_test_empty_support** (degenerate): A function with empty support is the zero element.
- **CrystallineCM.BruhatStratumInduction_test_unnormalized** (non-example): For a nontrivial modulus, inserting δ_P^{1/2} into f(pg)=pf(g) changes the object and fails the integral coefficient definition.

### Bruhat open-cell induction

**Construction** · CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-open-cell-induction · proposed name CrystallineCM.BruhatOpenCellInduction

I°_w(π) is the submodule of I_w(π) with support in S°_w=P(L)wM(L)U₀. It has the right-translation action of M(L)⁺⋉U₀ and extends by zero to I_w. For w=w₀^P its derived U₀-invariants evaluate to π^{w₀^P}.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-stratum-induction.

Proof/construction outline:

1. Apply the displayed formula using the named supplier carrier and its functorial action.
2. The API and discriminating tests below fix its normalization and distinguish it from the adjacent ordinary or dual construction.

Sources: CN25v3, §2.3.1, p.34; Lemma 2.3.6, pp.36–37.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-3: Computes the top-cell ordinary cohomology by extension from S°_w and evaluation, giving the block-conjugated Levi coefficient module.
- CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6: Computes the top-cell ordinary cohomology by extension from S°_w and evaluation, giving the block-conjugated Levi coefficient module.
- CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-7: Computes the top-cell ordinary cohomology by extension from S°_w and evaluation, giving the block-conjugated Levi coefficient module.

Planning API:

- **CrystallineCM.BruhatOpenCellInduction_extend_zero** (constructor): Extension by zero gives an injective M⁺⋉U₀-equivariant map I°_w→I_w.
- **CrystallineCM.BruhatOpenCellInduction_support** (characterisation): An I_w function lies in I°_w exactly when its support is contained in S°_w.
- **CrystallineCM.BruhatOpenCellInduction_evaluate** (projection): At w₀^P, evaluation on U₀-invariants gives the coefficient module with the w₀^P-conjugated Levi action.

Discriminating unit tests:

- **CrystallineCM.BruhatOpenCellInduction_test_identity** (computation): S°_1=P(L), so I°_1=I_1.
- **CrystallineCM.BruhatOpenCellInduction_test_w0_eval** (characterisation): At w₀^P the evaluated Levi action is conjugated by block exchange, rather than the original action.
- **CrystallineCM.BruhatOpenCellInduction_test_nonopen_support** (non-example): For nonzero trivial coefficients on the longest cell, a nonzero locally constant function with compact support in a compact-open neighborhood in left P(L)-quotient of S_w outside left P(L)-quotient of S°_w is not in I°_w. Single-point support is not assumed to be locally constant.

### Exactness of the Bruhat filtration of parabolic induction

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-3 · proposed name CrystallineCM.bruhat_filtration_exact

(1) I_{≥0} = Res^{G(L)}_{P(L)} ∘ Ind^{G(L)}_{P(L)}. (2) Each of I_{≥i}, I_w, I°_w is exact. (3) For i ≥ 0 and π ∈ Mod_sm(P(L), O/ϖ^m) there is a functorial exact sequence 0 → I_{≥i+1}(π) → I_{≥i}(π) → ⊕_{ℓ(w)=i} I_w(π) → 0, giving distinguished triangles (2.3.1) in D⁺_sm(P(L), O/ϖ^m).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/induction-filtration-functors; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-2; SmoothRepresentationsOfLocalGroups:SR.2; CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-stratum-induction; CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-open-cell-induction.

Proof/construction outline:

1. For each stratum, functions are locally constant and compact modulo P, with unnormalized equivariance.
2. Use clopen extensions locally on P\G and finite support to lift sections across a stratum; kernels are the next open union. Exact functors extend to derived categories and give the distinguished triangles.

Sources: CN25v3, Proposition 2.3.3, p.34.

### Clopen approximations of the Bruhat filtration

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-5 · proposed name CrystallineCM.bruhat_clopen_approximation

For each i ≥ 0 there are decompositions G_{≥i} = U^m₁ ⊔ U^m₂ into open and closed subsets, indexed by m ≥ 1, left P(L)-invariant and right P(O_L)-invariant, with G_{≥i+1} = ∪_{m≥1} U^m₁.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-2; CrystallineLocalGlobalCompatibilityCM:CL.3/induction-filtration-functors.

Proof/construction outline:

1. Use the compact Hausdorff quotient P(L)\G(L) and a decreasing clopen neighborhood basis of the closed lower-stratum union.
2. Pull back to obtain left P-invariant, right P(O_L)-invariant clopen decompositions; their increasing open parts exhaust G_{≥i+1}.

Sources: CN25v3, Lemma 2.3.5, pp.35–36.

### The Bruhat filtration stays exact after taking K ⋉ U₀-cohomology

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-4 · proposed name CrystallineCM.bruhat_cohomology_exact

Let π ∈ D⁺_sm(P(L), O/ϖ^m) and V a finite free O/ϖ^m-module with a smooth representation of an open submonoid Δ⁺ ⊂ M(L) containing an open subgroup K ⊂ M(O_L). For i ≥ 0 and j ∈ Z, 0 → R^jΓ(K ⋉ U₀, V ⊗ I_{≥i+1}(π)) → R^jΓ(K ⋉ U₀, V ⊗ I_{≥i}(π)) → ⊕_{ℓ(w)=i} R^jΓ(K ⋉ U₀, V ⊗ I_w(π)) → 0 is an exact sequence of H(Δ⁺, K)-modules.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-3; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-5; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees.

Proof/construction outline:

1. The clopen decompositions split the restriction exact sequences at each approximating support.
2. Pass to filtered colimits, which commute with compact-group continuous cochains here; apply finite-free tensor and derive, obtaining short exact sequences on every R^jΓ, not only long exact sequences.

Sources: CN25v3, Proposition 2.3.4, pp.34–35.

### The open cell computes the P-ordinary part of the top Bruhat stratum

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6 · proposed name CrystallineCM.ordinary_open_cell_comparison

For G = GL_{2n}/L, P the standard parabolic with Levi GL_n × GL_n, ũ_L = diag(ϖ_L,…,ϖ_L,1,…,1) and w₀^P the longest element of ^PW^P: (1) I°_{w₀^P} takes injectives to Γ(U₀,−)-acyclics; (2) for π ∈ D⁺_sm(P(L), O/ϖ^m) there is a natural isomorphism ord RΓ(U₀, I°_{w₀^P}(π)) ≅ ord RΓ(U₀, I_{w₀^P}(π)), ord inverting ũ_L.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/induction-filtration-functors; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors; CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-stratum-induction; CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-open-cell-induction; SmoothRepresentationsOfLocalGroups:SR.0:abelian-category; SmoothRepresentationsOfLocalGroups:SR.2; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees.

Proof/construction outline:

1. Embed the coefficient module π into an injective O/ϖ^m-module I, and embed π into smooth coinduction Ind₁^{P(L)}I. Use the supplier injective-test reduction of Emerton Lemma 2.1.10, cited in CN, to test I°_{w₀^P} on these objects.
2. Since w₀^P normalizes M(L), S°_{w₀^P}=P(L)w₀^P U₀. Evaluation F(x)=f(x)(1) identifies I°_{w₀^P}(Ind₁^{P(L)}I) with locally constant I-valued functions on P(L)w₀^P U₀, injective for smooth right U₀-translation by the requested coinduction interface. This proves Γ(U₀,−)-acyclicity on injectives.
3. Define the exact quotient functor J=I_{w₀^P}/I°_{w₀^P} and apply ord RΓ(U₀,−) to its triangle. Powers of ũ_L shrink support toward S°_{w₀^P}, so ũ_L acts locally nilpotently on J. The requested continuous-cohomology/localization interface, matching the Hauseux Lemma 3.3.1 argument cited in CN, gives ord H^j(U₀,J)=0; the triangle gives the comparison.

Sources: CN25v3, Lemma 2.3.6, pp.36–37.

### The open-cell summand is the w₀^P-twist

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-7 · proposed name CrystallineCM.open_cell_evaluation_twist

For π ∈ D⁺_sm(P(L), O/ϖ^m) there is a natural isomorphism RΓ(U₀, I°_{w₀^P}(π)) ≅ π^{w₀^P} in D⁺_sm(M(L)⁺, O/ϖ^m), where m ∈ M(L)⁺ acts on π^{w₀^P} through w₀^P m (w₀^P)^{−1}.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/induction-filtration-functors; CrystallineLocalGlobalCompatibilityCM:CL.0/weyl-elements; SmoothRepresentationsOfLocalGroups:SR.2; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees; CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-stratum-induction; CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-open-cell-induction; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6.

Proof/construction outline:

1. Evaluate an open-cell induced function at w₀^P; U₀-invariants recover the coefficient π.
2. Conjugating right Levi translation through w₀^P gives π^{w₀^P}; invariants-acyclicity upgrades the evaluation to a derived isomorphism.

Sources: CN25v3, Lemma 2.3.7, p.37.

### The modulus-type character χ of M(L)

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.3/chi-character · proposed name CrystallineCM.ChiCharacter · **Planet: Unipotent orientation character**

χ : M(L) → O^× is χ(m) = Nm_{L/Q_p} det_L(Ad(m)|_{Lie U(L)})^{−1} / |Nm_{L/Q_p} det_L(Ad(m)|_{Lie U(L)})|_p.

Direct prerequisites: PotentialAutomorphyInfrastructure:PA.2/bruhat-orientation-character; PotentialAutomorphyInfrastructure:PA.0/unipotent-exterior-cohomology.

Proof/construction outline:

1. Construct the stated carrier from the explicitly listed supplier objects and the displayed formulas, retaining every group or Hecke action.
2. The API below specifies the defining projections, normalization and comparison needed at the recorded uses. Verify those identities without changing the coefficient category.

Sources: CN25v3, §2.3.1, p.37.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-8: Twists top continuous unipotent cohomology by its inverse determinant unit character when the identity cell contributes the rank shift.

Planning API:

- **CrystallineCM.ChiCharacter_mul** (structure): χ(mm′)=χ(m)χ(m′) and χ(1)=1.
- **CrystallineCM.ChiCharacter_unit_value** (characterisation): The normalization has p-adic valuation zero and therefore lies in Z_p×⊂O×.
- **CrystallineCM.ChiCharacter_orientation** (compatibility): Its restriction to compact Levi is the inverse determinant on top continuous unipotent cohomology; on the torus it agrees with the appropriate PA.2 orientation character.

Discriminating unit tests:

- **CrystallineCM.ChiCharacter_test_identity** (degenerate): χ(1)=1.
- **CrystallineCM.ChiCharacter_test_rank_one_unit** (computation): For GL₂ and m=diag(a,d) with a/d∈Z_p×, χ(m)=d/a.
- **CrystallineCM.ChiCharacter_test_uniformizer** (computation): For L=Q_p and m=diag(p,1), χ(m)=1 because the determinant inverse and absolute-value denominator cancel.

### P-ordinary part of an inflation from the Levi

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-8 · proposed name CrystallineCM.ordinary_inflation_orientation_shift

In the abelian Siegel GL_{2n} setting, For π ∈ D⁺_sm(M(L), O/ϖ^m) there is a natural isomorphism ord RΓ(U₀, Inf^{M(L)⁺⋉U₀}_{M(L)⁺} π) ≅ O/ϖ^m(χ) ⊗ π[−rk_{Z_p}U₀] in D⁺_sm(M(L)⁺, O/ϖ^m). Corollary 2.3.10: for π ∈ D⁺_sm(M(L), O/ϖ^m), ord RΓ(U₀, I_id(Inf^{P(L)}_{M(L)} π)) ≅ O/ϖ^m(χ) ⊗ π[−rk_{Z_p}U₀] in D⁺_sm(M(L)⁺, O/ϖ^m), where I_id is the identity Bruhat stratum and I°_id its restriction to M(L)⁺ ⋉ U₀ (Remark 2.3.9).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/chi-character; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors; PotentialAutomorphyInfrastructure:PA.0/unipotent-exterior-cohomology; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees.

Proof/construction outline:

1. For the abelian Siegel U₀, use the supplier exterior description with continuous Hom, and compute transfer of ũ_n in each degree.
2. Positive powers are nilpotent below top degree modulo ϖ^m; the top transfer action is χ. Ordinary localization therefore leaves χ⊗π shifted by minus rank.

Sources: CN25v3, Lemma 2.3.8, pp.37–38; Remark 2.3.9 and Corollary 2.3.10, p.38.

### P-ordinary cohomology of a parabolic induction

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-11 · proposed name CrystallineCM.ordinary_induction_subquotients · **Planet: P-ordinary induction subquotients**

For v̄ ∈ S̄ and Q_{v̄} ⊂ P_{v̄} with K_{v̄} = 𝒬_{v̄} ∩ G(F⁺_{v̄}): let π ∈ D⁺_sm(G(F⁺_{v̄}), O/ϖ^m) and V a finite free O/ϖ^m-module with a smooth Δ^{Q,+}_{v̄}-action, ũ_{ṽ,n} acting trivially, inflated to Δ̃^{Q}_{v̄,P} = Δ^{Q,+}_{v̄} ⋉ U⁰_{v̄}. Then ord₀ R^jΓ(K_{v̄} ⋉ U⁰_{v̄}, Ind^{G̃(F⁺_{v̄})}_{P(F⁺_{v̄})} π ⊗ V) has R^jΓ(K_{v̄}, π^{w₀^P} ⊗ V) and R^{j−rk_{Z_p}U⁰_{v̄}}Γ(K_{v̄}, π ⊗ O/ϖ^m(χ) ⊗ V) as H(Δ^{Q}_{v̄}, K_{v̄})-module subquotients.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-4; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-7; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-8; CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-12.

Proof/construction outline:

1. Apply the exact cohomological Bruhat filtration to unnormalized Ind_P^{G̃}π and V.
2. The longest open cell gives the w₀^P-twisted unshifted term; the identity cell gives the χ-twisted top-degree term. Keep these as subquotients; other cells need not vanish or split.

Sources: CN25v3, Proposition 2.3.11, p.38.

### Dual version: ordinary part for the opposite parabolic

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.3/cor-2-3-12 · proposed name CrystallineCM.dual_ordinary_induction_subquotient

For π ∈ D⁺_sm(G(F⁺_{v̄}), O/ϖ^m) and V finite free with a smooth (Δ^{Q,+}_{v̄})^{−1}-action, ũ^{−1}_{ṽ,n} trivial, inflated to (Δ̃^{Q}_{v̄,P})^{−1}: ord^∨₀ R^jΓ(K_{v̄} ⋉ Ū¹_{v̄}, Ind^{G̃}_{P} π ⊗ V) has R^jΓ(K_{v̄}, π ⊗ V) as an H((Δ^{Q}_{v̄})^{−1}, K_{v̄})-module subquotient.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-11; CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-19; CrystallineLocalGlobalCompatibilityCM:CL.2/dual-p-ordinary.

Proof/construction outline:

1. Apply the inverse-monoid conjugation and the preceding subquotient result.
2. The w₀^P-twists cancel on the desired coefficient π, yielding the unshifted π⊗V subquotient with inverse Hecke operators.

Sources: CN25v3, Corollary 2.3.12, p.39.

### Cohomology of an induced space is the parabolic induction

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-14 · proposed name CrystallineCM.induced_space_cohomology

For G split reductive over O_L, K = G(O_L), K_P = K ∩ P(L), and X a compact Hausdorff space with a continuous P(L)-action on which K_P acts freely: X ×^P G (the quotient of X × G(L) by (x,g)·p = (xp, p^{−1}g)) is K-equivariantly homeomorphic to X ×^{K_P} K, and there is a natural isomorphism RΓ(X ×^P G, O/ϖ^m) ≅ Ind^{G(L)}_{P(L)} RΓ(X, O/ϖ^m) in D⁺_sm(G(L), O/ϖ^m).

Direct prerequisites: ArithmeticLocallySymmetricSpaces:ALS.6; SmoothRepresentationsOfLocalGroups:SR.2; ArithmeticLocallySymmetricSpaces:ALS.3/discrete-topological-comparison.

Proof/construction outline:

1. Use Iwasawa G(L)=P(L)K and the free K_P-action to compare the two contracted products.
2. Compute sections over clopen finite quotients and resolve equivariantly; exact integral unnormalized induction gives the displayed derived comparison.

Sources: CN25v3, §2.3.13, Lemma 2.3.14, pp.39–40.

### Splitting of the U₀-cohomology complex at deep level

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-17 · proposed name CrystallineCM.deep_unipotent_cohomology_split · **Planet: Deep unipotent formality**

For the Siegel parabolic of split GL_{2n}/O_L (so U₀≅O_L^{n²} is abelian), Let K = M(O_L) with congruence subgroups K_m = {k ≡ 1 mod ϖ^m_L}, acting on U₀ by conjugation. For every m ≥ 1 there is M = M(m) ≥ m such that RΓ(U₀, O/ϖ^m) ≅ ⊕_{i=0}^{rk_{Z_p}U₀} H^i(U₀, O/ϖ^m)[−i] in D⁺_sm(K_M, O/ϖ^m); each H^i(U₀, O/ϖ^m) is non-zero, with trivial K_M-action. Cohomology is Hom_cts(∧^i_{Z_p}U₀,O/ϖ^m), not ∧^i U₀. No condition p>n² is imposed. The source argument is not exported to arbitrary nonabelian unipotent radicals.

Direct prerequisites: PotentialAutomorphyInfrastructure:PA.0/unipotent-exterior-cohomology; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees; SmoothRepresentationsOfLocalGroups:SR.0:abelian-category; DeformationAndDerivedPatchingAlgebra:R03.3; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension.

Proof/construction outline:

1. In the Siegel case U₀≅O_L^{n²} is free of finite rank over Z_p. Compute H^i as Hom of exterior powers, never exterior powers of U₀ itself.
2. The requested general smooth-perfect comparison proves colim_M Hom(B_M,A_M)≅Hom(B,A). Lift the identity of the underlying zero-differential perfect complex at some deep level; conservativity of forgetting the smooth action makes it an isomorphism. Enlarge M to kill the finite mod-ϖ^m cohomology actions.

Sources: CN25v3, §2.3.16, pp.41–42 (Lemma 2.3.17 on p.42).

### Subquotients modulo p-powers (Artin–Rees)

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-18 · proposed name CrystallineCM.subquotient_mod_p_pow

Let N be a finitely generated Z_p-module and M a subquotient of N. For every m ≥ 1 there is m′ ≥ m such that M/p^mM is a subquotient of N/p^{m′}N.

Local hypotheses or variations:

- Here finite Z_p-module means finitely generated; M is a module quotient of a submodule of N, not a subquotient of underlying sets.

Direct prerequisites: mathlib:Ideal.exists_pow_inf_eq_pow_smul; tauceti:TauCeti.ArtinRees.exists_controlled_lift.

Proof/construction outline:

1. Present the subquotient as a quotient of a submodule L⊂N. Apply Artin–Rees to compare p-adic ambient and induced filtrations on L.
2. Choose m′ so L∩p^{m′}N⊂p^mL; then L/p^mL is a quotient of its image in N/p^{m′}N. Passing to the chosen quotient gives M/p^mM.

Sources: CN25v3, Lemma 2.3.18, p.43.

## CL.4. Q-ordinary automorphic representations and Galois blocks

Define rescaled partial Q-Hecke operators for partitions refining (n,n), their polynomial/Laurent algebra and the all-unit generalized-eigenvalue subspace. Define ι-Q-ordinary cuspidal representations by cohomological weight and a nonzero unit eigenvector. Prove Newton–Hodge partial-sum inequalities and the equality-induced Galois subrepresentation. Deduce crystalline diagonal blocks, increasing labelled Hodge–Tate weights, a one-dimensional ordinary line and partial determinant reciprocity formulas.

Direct stage dependencies: ArithmeticLocallySymmetricSpaces:ALS.5; AutomorphicGaloisRepresentationsPartII:AG2.2; AutomorphicGaloisRepresentationsPartII:AG2.5; CrystallineLocalGlobalCompatibilityCM:CL.0; PadicFamilies:L0a; PadicHodgeTheory:R06.2; PadicHodgeTheory:R06.3; SmoothRepresentationsOfLocalGroups:SR.2; SmoothRepresentationsOfLocalGroups:SR.4.

### Q-ordinary Hecke operators Ũ^k_v

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.4/Q-ordinary-hecke · proposed name CrystallineCM.QOrdinaryHecke

For a standard parabolic Q_{v̄} ⊂ P_{F⁺_{v̄}} corresponding under ι_v to P_{n₁,…,n_t} ⊂ GL_{2n} (a partition of 2n refining (n,n)), ν_k ∈ X_{Q_{v̄}} with ν_k(ϖ) = ι_v^{−1} diag(ϖ_v,…,ϖ_v,1,…,1) (n₁+…+n_k entries ϖ_v) and Ũ^k_v := [𝒬 ν_k(ϖ) 𝒬], so H(Δ̃^{Q}_{v̄}, 𝒬_{v̄}) ≅ Z[Ũ¹_v,…,Ũ^{t−1}_v, (Ũ^t_v)^{±1}]. For dominant λ̃ and a smooth Q̄_p-representation σ of G̃(F⁺_{v̄}), the λ̃-rescaled action on σ^{𝒬} multiplies [𝒬 g 𝒬] by α̃^{Q}(g)^{−1}.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-15; CrystallineLocalGlobalCompatibilityCM:CL.0/rescaled-actions; SmoothRepresentationsOfLocalGroups:SR.4; CrystallineLocalGlobalCompatibilityCM:CL.0/positive-parahoric-monoid.

Proof/construction outline:

1. Construct the stated carrier from the explicitly listed supplier objects and the displayed formulas, retaining every group or Hecke action.
2. The API below specifies the defining projections, normalization and comparison needed at the recorded uses. Verify those identities without changing the coefficient category.

Sources: CN25v3, §3.1, p.43.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.4/iota-Q-ordinary: Records every rescaled partial block operator and the central inverse, so ordinary unit-eigenvalue conditions recover the correct local Galois block determinants.
- CrystallineLocalGlobalCompatibilityCM:CL.4/q-ordinary-local-subspace: Records every rescaled partial block operator and the central inverse, so ordinary unit-eigenvalue conditions recover the correct local Galois block determinants.

Planning API:

- **CrystallineCM.QOrdinaryHecke_partial_operator** (constructor): For 1≤k≤t, Ũ^k is the double coset of the first n₁+⋯+n_k diagonal uniformizers.
- **CrystallineCM.QOrdinaryHecke_polynomial_algebra** (equivalence): The local Hecke algebra is Z[Ũ¹,…,Ũ^{t−1},(Ũ^t)^{±1}], with no inverses of the first t−1 generators before localization.
- **CrystallineCM.QOrdinaryHecke_rescale** (compatibility): On weight λ̃ coefficients [𝒬g𝒬] is scaled by α̃(g)^{-1}, as in the integral action.

Discriminating unit tests:

- **CrystallineCM.QOrdinaryHecke_test_siegel** (computation): For partition (n,n), Ũ¹=Ũ_n and Ũ²=Ũ_{2n}.
- **CrystallineCM.QOrdinaryHecke_test_borel** (compatibility): For partition (1,…,1), the generators match all standard Borel partial diagonal Hecke operators.
- **CrystallineCM.QOrdinaryHecke_test_central_inverse_only** (non-example): The unlocalized polynomial algebra contains (Ũ^t)^{-1} but not (Ũ¹)^{-1}; making every generator invertible changes it.

### Q-ordinary local subspace

**Construction** · CrystallineLocalGlobalCompatibilityCM:CL.4/q-ordinary-local-subspace · proposed name CrystallineCM.QOrdinaryLocalSubspace

For an admissible characteristic-zero parahoric invariant space with the λ̃-rescaled commuting Ũ^k operators, the Q-ordinary subspace is the simultaneous sum of generalized eigenspaces for which every Ũ^k-eigenvalue has p-adic valuation zero, after finite coefficient extension. This includes the central invertible Ũ^t operator; P-ordinary only inverts Ũ_n.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.4/Q-ordinary-hecke; PadicFamilies:L0a.

Proof/construction outline:

1. Admissibility makes parahoric invariants finite dimensional over a finite p-adic coefficient field. After a finite splitting extension, decompose for the finite commuting Hecke algebra into simultaneous generalized eigenspaces.
2. Select those summands for which every rescaled eigenvalue has valuation zero. Galois stability descends the selected subspace and proves coefficient-extension compatibility. Finite-set Fitting theory alone does not supply this characteristic-zero slope selection.

Sources: CN25v3, §3.1, after Definition 3.1.1, p.43.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.4/iota-Q-ordinary: Selects the simultaneous all-unit eigenspaces in parahoric invariants; its characteristic-zero line gives the partial determinant formulas.

Planning API:

- **CrystallineCM.QOrdinaryLocalSubspace_unit_eigenspaces** (characterisation): A simultaneous generalized eigenvector lies in the subspace iff all rescaled eigenvalues have valuation zero.
- **CrystallineCM.QOrdinaryLocalSubspace_scalar_extension** (functoriality): Formation commutes with finite coefficient extension preserving the p-adic valuation.
- **CrystallineCM.QOrdinaryLocalSubspace_p_comparison** (relation): QOrd is contained in POrd at the same invariant space, and equality is not imposed in a refined partition.

Discriminating unit tests:

- **CrystallineCM.QOrdinaryLocalSubspace_test_all_units** (computation): For commuting diagonal scalar operators with all eigenvalues 1, the whole invariant space is QOrd.
- **CrystallineCM.QOrdinaryLocalSubspace_test_nonunit** (non-example): For two scalar operators 1 and p on an E-line, POrd for the first is nonzero but QOrd is zero.
- **CrystallineCM.QOrdinaryLocalSubspace_test_zero_space** (degenerate): For zero parahoric invariants the QOrd subspace is zero.

### ι-Q_{v̄}-ordinary cuspidal representations

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.4/iota-Q-ordinary · proposed name CrystallineCM.IotaQOrdinary · **Planet: Q-ordinary automorphic representations**

A cuspidal automorphic representation π of G̃(𝔸_{F⁺}) is ι-Q_{v̄}-ordinary of weight λ̃ (λ̃ ∈ (Z^{2n}₊)^{Hom(F⁺,Q̄_p)} dominant, ι : Q̄_p ≅ C) if π is ιV^∨_λ̃-cohomological and the λ̃-rescaled operators {Ũ^k_v : 1 ≤ k ≤ t} have a simultaneous eigenvector with p-adic unit eigenvalues in ι^{−1}π^{𝒬}; the Q_{v̄}-ordinary subspace of ι^{−1}π^{𝒬_{v̄}}_{v̄} is the largest H(Δ̃^Q, 𝒬)-submodule on which the rescaled Ũ^k_v have only unit eigenvalues.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.4/Q-ordinary-hecke; ArithmeticLocallySymmetricSpaces:ALS.5/automorphic-comparison; CrystallineLocalGlobalCompatibilityCM:CL.4/q-ordinary-local-subspace.

Proof/construction outline:

1. Construct the stated carrier from the explicitly listed supplier objects and the displayed formulas, retaining every group or Hecke action.
2. The API below specifies the defining projections, normalization and comparison needed at the recorded uses. Verify those identities without changing the coefficient category.

Sources: CN25v3, Definition 3.1.1, p.43.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2: Combines the cohomological weight with a nonzero local all-unit eigenvector to deduce crystalline Galois blocks and realize ordinary Hecke characters.

Planning API:

- **CrystallineCM.IotaQOrdinary_witness** (characterisation): Q-ordinarity holds iff π is the specified cohomological representation and its parahoric invariants contain a nonzero vector with simultaneous unit rescaled eigenvalues.
- **CrystallineCM.IotaQOrdinary_isomorphism** (extensionality): An isomorphism of cuspidal automorphic representations preserving the local component and weight preserves Q-ordinarity.
- **CrystallineCM.IotaQOrdinary_p_specialization** (compatibility): For Q=P the condition uses the Siegel Ũ_n and central Ũ_{2n} operators; for Q=B it uses all Borel partial products.

Discriminating unit tests:

- **CrystallineCM.IotaQOrdinary_test_no_fixed_vectors** (non-example): A local component with π^{𝒬}=0 cannot be Q-ordinary regardless of its Galois slopes.
- **CrystallineCM.IotaQOrdinary_test_wrong_weight** (non-example): A unit eigenvector alone does not make π Q-ordinary of a weight for which it is not V^∨-cohomological.
- **CrystallineCM.IotaQOrdinary_test_refinement** (compatibility): At Q=B all partial-product unit conditions are imposed, recovering the parent’s Borel definition after the stated normalization.

### Newton above Hodge for semistable representations, and its equality case

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.4/lem-3-1-3 · proposed name CrystallineCM.newton_hodge_equality_subrepresentation · **Planet: Newton above Hodge**

Let r : G_{F_v} → GL_m(Q̄_p) be semistable, v₁ ≤ … ≤ v_m the valuations of the eigenvalues of geometric Frobenius on WD(r), and h_{τ,1} < … < h_{τ,m} the τ-Hodge–Tate weights. Then Σ_{i≤j} v_i ≥ (1/e_v) Σ_{i≤j} Σ_τ h_{τ,i} for 0 ≤ j ≤ m (e_v the ramification degree of F_v/Q_p). If Σ_{i≤j} v_{σ(i)} = (1/e_v) Σ_{i≤j} Σ_τ h_{τ,i} for some 1 ≤ j ≤ m − 1 and a permutation σ ∈ S_m, then r ≅ (r₁ ∗; 0 r₂) with r₁ of dimension j, τ-Hodge–Tate weights h_{τ,1} < … < h_{τ,j}, Frobenius slopes v₁ ≤ … ≤ v_j, and v_j < v_{j+1}.

Direct prerequisites: PadicHodgeTheory:R06.2; PadicHodgeTheory:R06.3.

Proof/construction outline:

1. Apply weak admissibility to the sum of the j smallest Frobenius-slope eigenspaces; compare every induced labelled Hodge filtration.
2. Equality forces this submodule to be weakly admissible and selects the lowest j weights. Weak admissibility implies admissibility gives r₁; strict labelled weights force v_j<v_{j+1}. The permutation belongs to S_m, correcting E3.

Sources: CN25v3, Lemma 3.1.3, pp.44–45.

### Galois representations of Q-ordinary automorphic representations

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2 · proposed name CrystallineCM.q_ordinary_crystalline_blocks · **Planet: Q-ordinary Galois blocks**

Let π be cuspidal on G̃(𝔸_{F⁺}), ι : Q̄_p ≅ C, v̄ a p-adic place of F⁺ with π ι-Q_{v̄}-ordinary of weight λ̃. Then: (1) r_ι(π)|_{G_{F_v}} is conjugate to a block upper-triangular representation with diagonal blocks r_j(π) : G_{F_v} → GL_{n_j}(Q̄_p) (j = 1,…,t), each crystalline (3.1.1); (2) the Q_{v̄}-ordinary subspace of ι^{−1}π^{𝒬}_{v̄} is one-dimensional; (3) the τ-Hodge–Tate weights of the r_j(π) are obtained by decomposing λ̃_{τ,2n} < λ̃_{τ,2n−1} + 1 < … < λ̃_{τ,1} + 2n − 1 according to (n₁,…,n_t); (4) ∏_{j=1}^k det r_j(π)(Art_{F_v}(u)) = ∏_{i=1}^{n₁+…+n_k} ∏_{τ:F_v↪Q̄_p} τ(u)^{−λ̃_{τ,2n−i+1}−i+1} for u ∈ O^×_{F_v}, and ∏_{j=1}^k det r_j(π)(Art_{F_v}(ϖ_v)) equals ε_p^{Σ_{i=1}^{n₁+…+n_k}(1−i)}(Art_{F_v}(ϖ_v)) times the eigenvalue of Ũ^k_v on the Q_{v̄}-ordinary subspace.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.4/iota-Q-ordinary; CrystallineLocalGlobalCompatibilityCM:CL.4/lem-3-1-3; AutomorphicGaloisRepresentationsPartII:AG2.2; AutomorphicGaloisRepresentationsPartII:AG2.5; SmoothRepresentationsOfLocalGroups:SR.2; SmoothRepresentationsOfLocalGroups:SR.4.

Proof/construction outline:

1. Use the requested unitary local–global compatibility and normalized Jacquet geometric lemma to compute possible rescaled U^k-eigenvalues. Unit eigenvalues force Newton/Hodge equality at the block endpoints; Lemma 3.1.3 supplies the filtration and strictly separated endpoints.
2. The order-preserving identity shuffle alone has all unit eigenvalues, giving a one-dimensional ordinary line. To kill monodromy inside a block, assume it is nonzero: Bernstein–Zelevinsky yields a Steinberg factor inside that block. The same valuation argument leaves only the identity geometric-lemma term; its maximal-compact Levi invariants vanish because of that Steinberg factor, a contradiction. Separation between blocks alone would not kill monodromy within a block.
3. Compute the determinant characters on units and geometric Frobenius from the normalized Jacquet scalars and the Hodge–Tate dictionary. The unitary supplier must provide the stated semistable/WD comparison in the actual arithmetic scope, retaining the conditions of Theorem 2.1.19 or supplying its base-change reduction.

Sources: CN25v3, Theorem 3.1.2, pp.43–44.

## CL.5. The localized completed Siegel boundary

Construct the equivariant unipotent coefficient object V_U=RΓ(U₀,V/ϖ^m) and its homotopy inverse limit; retain the vanishing bound and the exact nonzero range for trivial selected weights. Identify the localized completed Siegel boundary with induced Levi cohomology, using non-Eisenstein boundary-stratum elimination, topological induction and unipotent descent. Prove the Hecke-equivariant completed boundary summand and its integral coefficient-evaluation retract, with zero weights on the complementary p-places.

Direct stage dependencies: ArithmeticLocallySymmetricSpaces:ALS.1; ArithmeticLocallySymmetricSpaces:ALS.2; ArithmeticLocallySymmetricSpaces:ALS.4; ArithmeticLocallySymmetricSpaces:ALS.6; CrystallineLocalGlobalCompatibilityCM:CL.2; CrystallineLocalGlobalCompatibilityCM:CL.3; PotentialAutomorphyInfrastructure:PA.0; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension; SmoothRepresentationsOfLocalGroups:SR.2; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees.

### The coefficient object V_U(λ̃_S̄, m) on the Levi locally symmetric spaces

**Construction** · CrystallineLocalGlobalCompatibilityCM:CL.5/boundary-coefficient-object · proposed name CrystallineCM.BoundaryCoefficientObject · **Planet: Unipotent coefficient object**

For S̄⊆S̄_p, dominant λ̃, R_m=O/ϖ^m, put V_{λ̃_S̄}=⊗_{v̄∈S̄,τ}V_{λ̃_τ}. V_U(λ̃_S̄,m) is the equivariant locally constant derived coefficient object on the GL_n adelic tower corresponding to RΓ(U₀_{S̄},V_{λ̃_S̄}/ϖ^m), descended to good X_K through the genuine Levi conjugation action. Its cohomology sheaves vanish outside [0,r], r=n²Σ_{v̄∈S̄}[F⁺_{v̄}:Q_p]. If λ̃_S̄=0, every degree 0,…,r is nonzero and H^j=Hom_cts(∧^j_{Z_p}U₀_{S̄},R_m). Define V_U(λ̃_S̄)=holim_m V_U(λ̃_S̄,m). The printed exact nonvanishing claim for arbitrary λ̃ is not exported without the missing argument recorded in E18.

Direct prerequisites: tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees; ArithmeticLocallySymmetricSpaces:ALS.6; ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-17.

Proof/construction outline:

1. Construct the stated carrier from the explicitly listed supplier objects and the displayed formulas, retaining every group or Hecke action.
2. The API below specifies the defining projections, normalization and comparison needed at the recorded uses. Verify those identities without changing the coefficient category.

Sources: CN25v3, §4.1.1, p.53.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-7: Carries the actual unipotent cohomology and Levi action into the completed boundary retract; zero selected weights give the nonzero degrees needed for degree shifting.

Planning API:

- **CrystallineCM.BoundaryCoefficientObject_fiber** (projection): Its local derived coefficient fiber is RΓ(U₀,V_{λ̃_S̄}/ϖ^m), with the genuine Levi conjugation action.
- **CrystallineCM.BoundaryCoefficientObject_descent** (functoriality): Restriction to a good arithmetic level is compatible with the equivariant locally constant coefficient descent.
- **CrystallineCM.BoundaryCoefficientObject_amplitude** (data): Its cohomology sheaves vanish outside [0,n²Σ_{v̄∈S̄}[F⁺_{v̄}:Q_p]]; exact nonvanishing across this range is asserted here only for zero λ̃ on S̄.

Discriminating unit tests:

- **CrystallineCM.BoundaryCoefficientObject_test_empty_places** (degenerate): For S̄=∅, V_U is the original coefficient in degree zero with no unipotent shift.
- **CrystallineCM.BoundaryCoefficientObject_test_zero_weight_rank_one** (computation): For n=1,L=Q_p and zero coefficients, H⁰ and H¹ are R_m, all other groups vanish; the Levi action on H¹ is the inverse adjoint character.
- **CrystallineCM.BoundaryCoefficientObject_test_exterior_dual** (compatibility): For zero coefficients, the fibers agree with PA.0/unipotent-exterior-cohomology as continuous Hom of exterior powers, not the exterior power of U₀ itself.

### The Siegel boundary stratum and localization

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.5/prop-4-1-4 · proposed name CrystallineCM.localized_siegel_stratum

(1) There is a G̃(𝔸_{F⁺,f})-equivariant closed immersion (𝔛_P × G̃(𝔸_{F⁺,f}))/P(𝔸_{F⁺,f}) ↪ ∂𝔛_{G̃} whose complement is a disjoint union of locally closed (𝔛_Q × G̃(𝔸_{F⁺,f}))/Q(𝔸_{F⁺,f}) for standard parabolics Q ⊄ P. (2) Under the assumptions of thm-4-1-3, pullback gives a T̃^T-equivariant isomorphism RΓ(K̃^{S̄₂}, RΓ(∂𝔛_{G̃}, V_λ̃/ϖ^m))_{m̃} ≅ RΓ(K̃^{S̄₂}, RΓ((𝔛_P × G̃(𝔸_{F⁺,f}))/P(𝔸_{F⁺,f}), V_λ̃/ϖ^m))_{m̃}.

Direct prerequisites: PotentialAutomorphyInfrastructure:PA.0; ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification; ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-cohomology-formula; ArithmeticLocallySymmetricSpaces:ALS.6.

Proof/construction outline:

1. Use the Borel–Serre boundary strata and their finite-level/discrete-to-topological comparison.
2. The Satake-localized Hecke systems in non-Siegel strata are Eisenstein for the n-dimensional Levi residual representation; excision removes them. Do not impose irreducibility on the ambient 2n-dimensional sum.

Sources: CN25v3, Proposition 4.1.4, pp.54–55.

### The Siegel stratum as an induction at S̄₁

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-5 · proposed name CrystallineCM.siegel_stratum_induction

With λ̃ as in thm-4-1-3, RΓ((𝔛_P × G̃(𝔸_{F⁺,f}))/P(𝔸_{F⁺,f}), V_λ̃/ϖ^m) ≅ Ind^{G̃^{S̄₁}×G̃⁰_{S̄₁}}_{P^{S̄₁}×P⁰_{S̄₁}} RΓ(𝔛_P, V_λ̃/ϖ^m) in D⁺_sm(G̃^{S̄₁} × G̃⁰_{S̄₁}, O/ϖ^m), where G̃^{S̄₁} is the adelic group away from S̄₁ and G̃⁰_{S̄₁} = ∏_{v̄∈S̄₁} G̃(O_{F⁺_{v̄}}).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.5/prop-4-1-4; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-14; SmoothRepresentationsOfLocalGroups:SR.2.

Proof/construction outline:

1. Compute the closed Siegel stratum as a contracted product.
2. Apply Lemma 2.3.14 at selected compact p-components and smooth induction on the other components, retaining the tensor coefficient action.

Sources: CN25v3, Lemma 4.1.5, p.55.

### Completed cohomology of the Siegel parabolic is inflated from the Levi

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-6 · proposed name CrystallineCM.parabolic_cohomology_inflation

Pullback along 𝔛_P ↠ 𝔛_G gives a natural isomorphism Inf^{P(𝔸_{F⁺,f})}_{G(𝔸_{F⁺,f})} RΓ(𝔛_G, O/ϖ^m) ≅ RΓ(𝔛_P, O/ϖ^m) in D⁺_sm(P(𝔸_{F⁺,f}), O/ϖ^m).

Direct prerequisites: ArithmeticLocallySymmetricSpaces:ALS.6; ArithmeticLocallySymmetricSpaces:ALS.4/levi-hochschild-serre; ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration.

Proof/construction outline:

1. At finite neat parabolic level, the map to the Levi locally symmetric space has fiber the quotient of U(F_∞) by Γ_U, a real nilmanifold from the discrete arithmetic lattice Γ_U. Apply its Leray–Serre sequence (the ALS arithmetic-stratum interface).
2. Strong approximation identifies the shrinking-level lattice system. Positive-degree torsion fiber cohomology dies in the direct limit over those lattices, while degree zero is constant, as in the NT16 unipotent acyclicity argument.
3. Take the smooth completed colimit to recover the inflated Levi complex. Continuous compact U₀-cohomology by itself is not this discrete-lattice fiber computation.

Sources: CN25v3, Lemma 4.1.6, pp.55–56.

### Inflation comparison with the U-cohomology coefficient object

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-7 · proposed name CrystallineCM.unipotent_coefficient_inflation

With notation as in the proof of thm-4-1-3, Inf^{P^{T\S̄₂}}_{G^{T\S̄₂}} RΓ(K_{T\S̄₂}, RΓ(𝔛_G, V_U(λ̃_{S̄₁}, m))) ≅ RΓ(K_{P,T\S̄₂}, RΓ(𝔛_P, V_λ̃/ϖ^m)) in D⁺_sm(P^{T\S̄₂}, O/ϖ^m).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.5/boundary-coefficient-object; CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-6; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension.

Proof/construction outline:

1. Apply the smooth derived-invariants composition for the semidirect parabolic/Levi extension, the projection formula for the finite free coefficient lattice, and Lemma 4.1.6.
2. Identify the p-local derived U₀ coefficient object with V_U and retain its Levi and tame actions. Exactness at the remaining tame unipotent factors is used in Proposition 4.1.8, not substituted for this derived step.

Sources: CN25v3, Lemma 4.1.7, p.56.

### Completed P-cohomology through the Levi

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.5/prop-4-1-8 · proposed name CrystallineCM.completed_parabolic_levi_comparison

RΓ(K^{S̄₂}_P, RΓ(𝔛_P, V_λ̃/ϖ^m)) ≅ r^*_G ∘ Inf^{P_{S̄₂}}_{G_{S̄₂}} RΓ(K^{S̄₂}, RΓ(𝔛_G, V_U(λ̃_{S̄₁}, m))), T^T_P-equivariantly in D⁺_sm(P_{S̄₂}, O/ϖ^m).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-6; CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-7; ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps.

Proof/construction outline:

1. Combine the parabolic-to-Levi inflation and coefficient comparisons.
2. At the remaining prime-to-p unipotent compact factors, the pro-order is invertible on O/ϖ^m, so invariants are exact. This removes these tame factors without changing the p-derived coefficient object.
3. Identify the parabolic Hecke action with the Levi Satake pullback using the requested integral transform.

Sources: CN25v3, Proposition 4.1.8, pp.56–57.

### A direct summand of completed boundary cohomology

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.5/thm-4-1-3 · proposed name CrystallineCM.completed_siegel_boundary_summand · **Planet: Completed Siegel boundary summand**

Let K̃ ⊂ G̃(𝔸_{F⁺,f}) be good, decomposed with respect to P, with K̃_{U,v̄} = U⁰_{v̄} for v̄ ∈ S̄_p; m ⊂ T^T non-Eisenstein and m̃ := 𝒮^*(m). For a partition S̄_p = S̄₁ ⊔ S̄₂ and dominant λ̃ with λ̃_{v̄} = 0 for v̄ ∈ S̄₂: 𝒮^* ∘ Ind^{G̃_{S̄₂}}_{P_{S̄₂}} RΓ(K^{S̄₂}, RΓ(𝔛_G, V_U(λ̃_{S̄₁}, m)))_m is a T̃^T-equivariant direct summand of RΓ(K̃^{S̄₂}, RΓ(∂𝔛_{G̃}, V_λ̃/ϖ^m))_{m̃} in D⁺_sm(G̃_{S̄₂}, O/ϖ^m).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.5/prop-4-1-4; CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-5; CrystallineLocalGlobalCompatibilityCM:CL.5/prop-4-1-8; SmoothRepresentationsOfLocalGroups:SR.2.

Proof/construction outline:

1. Proposition 4.1.4 replaces completed boundary cohomology by the localized closed Siegel stratum; Lemma 4.1.5 writes its cohomology as smooth parabolic induction.
2. Take derived compact invariants away from S̄₂ using the Mackey decomposition into the relevant finite compact double cosets, and select the identity coset as a Hecke-equivariant direct summand.
3. Apply Proposition 4.1.8 to that summand to identify its coefficient complex with V_U and its Hecke action with Satake pullback. The coefficient retract used later in Corollary 4.1.9 is not a step of this theorem.

Sources: CN25v3, §4.1.2, Theorem 4.1.3, p.54.

### Levi cohomology with U-coefficients is a summand of completed boundary cohomology

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.5/cor-4-1-9 · proposed name CrystallineCM.integral_levi_boundary_retract · **Planet: Levi boundary retract**

Let K̃ be good, decomposed with respect to P, K̃_{U,v̄} = U⁰_{v̄} for v̄ ∈ S̄_p; m ⊂ T^T non-Eisenstein, m̃ = 𝒮^*(m); S̄_p = S̄₁ ⊔ S̄₂ ⊔ S̄₃; λ̃, λ dominant with λ̃_τ = (−λ_{τ̃c}, λ_τ̃) for τ inducing v̄ ∈ S̄₁ and λ̃_τ = 0 for v̄ ∈ S̄₂ ⊔ S̄₃. Then 𝒮^* ∘ Ind^{G̃_{S̄₃}}_{P_{S̄₃}} RΓ(K^{S̄₃}, RΓ(𝔛_G, V_{λ_{S̄₁}}/ϖ^m ⊗ V_U(λ̃_{S̄₂}, m)))_m is a T̃^T-equivariant direct summand of RΓ(K̃^{S̄₃}, RΓ(∂𝔛_{G̃}, V_λ̃/ϖ^m))_{m̃} in D⁺_sm(G̃_{S̄₃}, O/ϖ^m).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.5/thm-4-1-3; CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-14; PotentialAutomorphyInfrastructure:PA.0.

Proof/construction outline:

1. Apply Theorem 4.1.3 for S̄₁∪S̄₂ and split the induced coefficient evaluation with the PA.0 boundary retract.
2. Use the Levi tensor identification to retain V_{λ_{S̄₁}} and V_U at the second set, then induce over the third.

Sources: CN25v3, Corollary 4.1.9, p.57.

## CL.6. Degree shifting and nilpotent Hecke comparisons

Construct ordinary twisted/dual Satake diagrams and the integral, torsion and unitary middle-degree Hecke images; define the two deep congruence level families. Under ambient decomposed genericity compare middle-degree unitary and Levi derived-coefficient images and their duals. If the complementary local degree sum is at least half [F⁺:Q], prove d−q≤n² times that sum for q≥floor(d/2). Produce the torsion degree-shifting squares modulo nilpotent ideals J with J^N=0, N depending only on n,[F⁺:Q], while the depth and exponent m′ may increase.

Direct stage dependencies: ArithmeticLocallySymmetricSpaces:ALS.0; ArithmeticLocallySymmetricSpaces:ALS.4; ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality; ArithmeticLocallySymmetricSpaces:ALS.6; CrystallineLocalGlobalCompatibilityCM:CL.0; CrystallineLocalGlobalCompatibilityCM:CL.1; CrystallineLocalGlobalCompatibilityCM:CL.2; CrystallineLocalGlobalCompatibilityCM:CL.3; CrystallineLocalGlobalCompatibilityCM:CL.5; IgusaVarietiesAndTorsionConcentration:IG.7; IntegralHeckeAndGaloisDeterminants:IHG.2; PotentialAutomorphyInfrastructure:PA.0; PotentialAutomorphyInfrastructure:PA.2; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension; SmoothRepresentationsOfLocalGroups:SR.4; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees.

### Q-ordinary Hecke algebras, the twisted Satake map and duality involutions

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.6/ord-hecke-algebras-4-2 · proposed name CrystallineCM.OrdHeckeAlgebras42

T^{Q_S̄,S̄-ord} := T^T ⊗ (⊗_{v̄∈S̄} H(Δ^{Q_{v̄}}_{v̄}, K_{v̄})), T^{Q_S̄,S̄-ord}_{w₀^P} := T^T ⊗ (⊗ H((Δ^{Q}_{v̄})^{w₀^P}, K^{w₀^P}_{v̄})) and T̃^{Q_S̄,S̄-ord} := T̃^T ⊗ (⊗ H(Δ̃^{Q}_{v̄}, 𝒬_{v̄})[Ũ^{−1}_{ṽ,n}]); 𝒮^{w₀^P} : T̃^{Q_S̄,S̄-ord} → T^{Q_S̄,S̄-ord}_{w₀^P}, [𝒬 ν(ϖ) 𝒬] ↦ [K^{w₀^P} ν(ϖ)^{w₀^P} K^{w₀^P}], sending Ũ_{ṽ,n} ↦ U_ṽ and Ũ_{ṽ,2n} ↦ U_ṽ U^{−1}_{ṽc}; the duality involutions ι[KgK] = [Kg^{−1}K], ι̃[K̃gK̃] = [K̃g^{−1}K̃] [ACC+18, §2.2.19] with twisted algebras T^{…,ι}_{w₀^P}, T̃^{…,ι̃}, the untwisted T^{Q_S̄,S̄-ord,ι} and 𝒮^ι : [𝒬 ν(ϖ)^{−1} 𝒬] ↦ [K ν(ϖ)^{−1} K].

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-15; CrystallineLocalGlobalCompatibilityCM:CL.0/weyl-elements; PotentialAutomorphyInfrastructure:PA.2/ordinary-satake-homomorphism; ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality; SmoothRepresentationsOfLocalGroups:SR.4.

Proof/construction outline:

1. Construct the stated carrier from the explicitly listed supplier objects and the displayed formulas, retaining every group or Hecke action.
2. The API below specifies the defining projections, normalization and comparison needed at the recorded uses. Verify those identities without changing the coefficient category.

Sources: CN25v3, §4.2.1, p.58.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-2: Packages the twisted and dual local Satake maps with actual tame/local actions; the central ratio distinguishes the two conjugate p-adic places.
- CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-A: Packages the twisted and dual local Satake maps with actual tame/local actions; the central ratio distinguishes the two conjugate p-adic places.
- CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-dual: Packages the twisted and dual local Satake maps with actual tame/local actions; the central ratio distinguishes the two conjugate p-adic places.
- CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-9: Packages the twisted and dual local Satake maps with actual tame/local actions; the central ratio distinguishes the two conjugate p-adic places.

Planning API:

- **CrystallineCM.OrdHeckeAlgebras42_local_factor** (projection): The untwisted GL_n factor is H(Δ^Q,K_Q); the unitary factor localizes H(Δ̃^Q,𝒬) only at Ũ_n.
- **CrystallineCM.OrdHeckeAlgebras42_twisted_satake** (compatibility): S^{w₀^P} sends Ũ_n to U_ṽ and Ũ_{2n} to U_ṽ U_{ṽc}^{−1}.
- **CrystallineCM.OrdHeckeAlgebras42_dual_satake** (compatibility): S^ι sends inverse local cosets to inverse Levi cosets, with no additional w₀^P-conjugation in its untwisted target.

Discriminating unit tests:

- **CrystallineCM.OrdHeckeAlgebras42_test_empty** (degenerate): At S̄=∅ they reduce to the tame Hecke algebras and the untwisted Siegel Satake map.
- **CrystallineCM.OrdHeckeAlgebras42_test_central_ratio** (computation): Ũ_{2n} maps to U_ṽ/U_{ṽc}; replacing division by multiplication fails the determinant dictionary.
- **CrystallineCM.OrdHeckeAlgebras42_test_dual_inverse** (compatibility): S^ι(Ũ_n^{-1}) is the inverse appropriate Levi coset; its action agrees with the ALS adjoint involution.

### Degree shifting to middle-degree P-ordinary cohomology of G̃

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-2 · proposed name CrystallineCM.middle_degree_hecke_comparison · **Planet: Middle-degree Hecke comparison**

Let K̃ be good, decomposed with respect to P, K̃_{U,v̄} = U⁰_{v̄} for v̄ ∈ S̄_p; m ⊂ T^T non-Eisenstein, m̃ = 𝒮^*(m) with ρ̄_{m̃} decomposed generic; S̄_p = S̄₁ ⊔ S̄₂ ⊔ S̄₃ with standard parabolics Q_{v̄} ⊂ P_{v̄} for v̄ ∈ S̄₃; λ̃, λ dominant with (1) λ̃_τ = (−w_{0,n}λ_{τ̃c}, λ_τ̃) for τ inducing v̄ ∈ S̄₁, (2) λ̃_τ = 0 for v̄ ∈ S̄₂, (3) K̃_{v̄} = 𝒬_{v̄} and λ̃_τ = (−w_{0,n}λ_{τ̃c}, λ_τ̃) for v̄ ∈ S̄₃. Then 𝒮^{w₀^P} descends to a homomorphism T̃^{Q_{S̄₃},S̄₃-ord}(H^d(X̃_{K̃}, V_λ̃)^{ord}_{m̃}) → T^{Q_{S̄₃},S̄₃-ord}_{w₀^P}(H^d(X_{K^{S̄₃}K^{w₀^P}_{S̄₃}}, V_{λ_{S̄₁}} ⊗ V_U(λ̃_{S̄₂}) ⊗ V_{λ_{S̄₃}})_m) (H^d degree-d hypercohomology), and T̃^{…}(H^d(X̃_{K̃}, V_λ̃)^{ord}_{m̃}) ↪ T̃^{…}(H^d(X̃_{K̃}, V_λ̃[1/p])^{ord}_{m̃}).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.5/cor-4-1-9; CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-11; CrystallineLocalGlobalCompatibilityCM:CL.2/prop-2-2-15; CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-12; CrystallineLocalGlobalCompatibilityCM:CL.6/ord-hecke-algebras-4-2; IgusaVarietiesAndTorsionConcentration:IG.7/middle-degree-without-length-hypothesis.

Proof/construction outline:

1. Recover boundary cohomology from completed sections and apply the P-ordinary parabolic induction subquotient.
2. Apply middle-degree concentration with the ambient Satake residual representation decomposed generic: integral H^d injects into rational H^d and surjects onto localized boundary H^d. This carries the Hecke-image map through S^{w₀^P}.

Sources: CN25v3, Proposition 4.2.2, pp.58–60.

### The dual Levi coefficient module is a summand of the dual U-cohomology

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.6/lem-4-2-3 · proposed name CrystallineCM.dual_levi_coefficient_summand

Let S̄ ⊂ S̄_p and λ̃, λ dominant with λ̃_τ = (λ_τ̃, −w_{0,n}λ_{τ̃c}) for τ inducing v̄ ∈ S̄ (the w₀^P-conjugate of the standard identification). Then for every m ≥ 1, RΓ(U⁰_{S̄}, V^∨_{λ̃_S̄}/ϖ^m) has V^∨_{λ_S̄}/ϖ^m as a K_{S̄}-equivariant direct summand.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-12; CrystallineLocalGlobalCompatibilityCM:CL.2/dual-p-ordinary; tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees; PotentialAutomorphyInfrastructure:PA.0; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension.

Proof/construction outline:

1. Use the requested integral dual-Weyl Levi decomposition V_λ̃=V_λ⊕W (NT16 Proposition 2.10) at the block-exchanged weight; the chosen V_λ is fixed by the opposite unipotent.
2. Cab84 identifies W⊗E with (1−U)V_λ̃,E. Therefore W is P(O)-stable and quotienting gives a P(O)-equivariant surjection with a K-Levi-equivariant splitting. Mere surjectivity of evaluation would not supply that splitting.
3. Dualize this split coefficient comparison and apply the ACC+ Theorem 2.4.4 derived coefficient-retract interface to obtain the stated K-equivariant summand in RΓ(U₀,V_λ̃∨/ϖ^m).

Sources: CN25v3, Lemma 4.2.3, p.60.

### Degree shifting with dual coefficients

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-4 · proposed name CrystallineCM.dual_middle_degree_hecke_comparison

Assumptions as in prop-4-2-2 except: ρ̄_{𝒮^*(m^∨)} decomposed generic, and λ̃_τ = (λ_τ̃, −w_{0,n}λ_{τ̃c}) for τ inducing places of S̄₁ and S̄₃ (λ̃_τ = 0 on S̄₂, K̃_{v̄} = 𝒬_{v̄} on S̄₃). Then 𝒮^ι descends to T̃^{Q_{S̄₃},S̄₃-ord,ι̃}(H^d(X̃_{K̃}, V^∨_λ̃)^{ord∨}_{𝒮^*(m^∨)}) → T^{Q_{S̄₃},S̄₃-ord,ι}(H^d(X_K, V^∨_{λ_{S̄₁}} ⊗ V_U(λ̃_{S̄₂}) ⊗ V^∨_{λ_{S̄₃}})_{m^∨}); T̃^{…}(H^d(X̃,V^∨)^{ord∨}) ↪ T̃^{…}(H^d(X̃,V^∨[1/p])^{ord∨}), and by Poincaré duality the rational unitary algebra on the right of this injection is isomorphic to T̃^{Q_{S̄₃},S̄₃-ord}(H^d(X̃_{K̃}, V_λ̃[1/p])^{ord}_{ι̃^*𝒮^*(m^∨)}). Here ρ̄_{ι̃^*𝒮^*(m^∨)} = ρ̄_m(−n) ⊕ ρ̄_m^{∨,c}(1−n).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-2; CrystallineLocalGlobalCompatibilityCM:CL.6/lem-4-2-3; CrystallineLocalGlobalCompatibilityCM:CL.3/cor-2-3-12; ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality.

Proof/construction outline:

1. Repeat Proposition 4.2.2 with the opposite ordinary functor and the dual coefficient summand.
2. Use finite-level Verdier/Poincaré duality and inverse double-coset adjoints to identify the characteristic-zero source with the indicated ordinary middle-degree Hecke algebra.

Sources: CN25v3, Proposition 4.2.4, p.61.

### Hecke images A(K,λ,q), A(K,λ,q,m), Ã(K̃,λ̃,S̄) and deep levels

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-A · proposed name CrystallineCM.HeckeImagesA

A(K,λ,q)=T^{Q^{w₀^P},S̄-ord}_{w₀^P}(H^q(X_K,V_λ)_m), the image subalgebra of the displayed actual cohomological Hecke action. All source notations m, Q and the chosen ordinary localization are fixed; it is not the whole abstract Hecke algebra.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.6/ord-hecke-algebras-4-2; mathlib:AlgHom.range; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-finite-level.

Proof/construction outline:

1. Construct the stated carrier from the explicitly listed supplier objects and the displayed formulas, retaining every group or Hecke action.
2. The API below specifies the defining projections, normalization and comparison needed at the recorded uses. Verify those identities without changing the coefficient category.

Sources: CN25v3, §4.2.1, p.61.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-6: Uses the annihilator of actual localized integral cohomology to define the image algebra through which a comparison may factor; its torsion image is treated separately.
- CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-dual: Uses the annihilator of actual localized integral cohomology to define the image algebra through which a comparison may factor; its torsion image is treated separately.
- CrystallineLocalGlobalCompatibilityCM:CL.6/torsion-hecke-image: Uses the annihilator of actual localized integral cohomology to define the image algebra through which a comparison may factor; its torsion image is treated separately.
- CrystallineLocalGlobalCompatibilityCM:CL.6/unitary-middle-hecke-image: Uses the annihilator of actual localized integral cohomology to define the image algebra through which a comparison may factor; its torsion image is treated separately.

Planning API:

- **CrystallineCM.HeckeImagesA_mem** (characterisation): An endomorphism belongs to A(K,λ,q) iff it is the action of some element of the specified abstract ordinary Hecke algebra.
- **CrystallineCM.HeckeImagesA_factor** (universal-property): A map out of the abstract algebra factors through A iff it kills the annihilator of the displayed localized cohomology.
- **CrystallineCM.HeckeImagesA_integral_to_rational** (compatibility): The map to its rational cohomology image is induced by tensoring the actual coefficient complex; injectivity requires the specified middle-degree input and is not unconditional for GL_n.

Discriminating unit tests:

- **CrystallineCM.HeckeImagesA_test_zero_cohomology** (degenerate): For H^q_m=0, A is the zero endomorphism algebra; it is not the nonzero abstract Hecke algebra.
- **CrystallineCM.HeckeImagesA_test_scalar_image** (computation): If a polynomial Hecke algebra acts by evaluating T at a∈O on an O-line, its image is O and kernel is (T−a).
- **CrystallineCM.HeckeImagesA_test_range** (compatibility): For an available module action, A is exactly AlgHom.range, including its image membership statement.

### Numerical degree bound

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.6/lem-4-2-5 · proposed name CrystallineCM.degree_shift_bound

If S̄ ⊂ S̄_p satisfies Σ_{v̄∉S̄}[F⁺_{v̄} : Q_p] ≥ ½[F⁺ : Q] and q ∈ [⌊d/2⌋, d − 1] (d = n²[F⁺ : Q]), then d − q ≤ Σ_{v̄∉S̄} n²[F⁺_{v̄} : Q_p].

Direct prerequisites: .

Proof/construction outline:

1. Write D=[F⁺:Q] and R the integer sum of the complementary local degrees. Then 2R≥D implies R≥ceil(D/2).
2. For q≥floor(n²D/2), n²D−q≤ceil(n²D/2)≤n²ceil(D/2)≤n²R. The complementary sum is used, correcting E10; no unramifiedness hypothesis enters.

Sources: CN25v3, Lemma 4.2.5, p.62.

### Torsion Hecke image

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.6/torsion-hecke-image · proposed name CrystallineCM.TorsionHeckeImage

A(K,λ,q,m)=image of T^{Q^{w₀^P},S̄-ord}_{w₀^P} in End_O(H^q(X_K,V_λ/ϖ^m)_m). Integral and torsion Hecke operators agree on the image of integral cohomology in torsion cohomology. A map A(K,λ,q)/ϖ^m→A(K,λ,q,m) requires an additional annihilator containment; neither that map nor equality is automatic.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-A; mathlib:AlgHom.range.

Proof/construction outline:

1. Apply the displayed formula using the named supplier carrier and its functorial action.
2. The API and discriminating tests below fix its normalization and distinguish it from the adjacent ordinary or dual construction.

Sources: CN25v3, §4.2.1, p.61.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-6: Provides the exact finite torsion-cohomology endomorphism image receiving the nilpotent degree-shifting map, including classes not lifted from integral H^q.

Planning API:

- **CrystallineCM.TorsionHeckeImage_mem** (characterisation): b belongs iff b is the specified ordinary Hecke action on H^q(X_K,V_λ/ϖ^m)_m.
- **CrystallineCM.TorsionHeckeImage_faithful** (data): Its tautological action on this module is injective as a map of algebras.
- **CrystallineCM.TorsionHeckeImage_image_reduction** (compatibility): An integral Hecke operator and its induced torsion operator agree on the image of H^q(V_λ)→H^q(V_λ/ϖ^m).

Discriminating unit tests:

- **CrystallineCM.TorsionHeckeImage_test_zero** (degenerate): Zero torsion cohomology gives the zero image algebra.
- **CrystallineCM.TorsionHeckeImage_test_scalar_mod** (computation): For a scalar O-action on R_m, its torsion image is R_m.
- **CrystallineCM.TorsionHeckeImage_test_new_torsion** (non-example): Torsion H^{q+1}(V) may contribute to H^q(V/ϖ^m); the definition cannot identify the latter image with A(K,λ,q)/ϖ^m without extra hypotheses.

### Unitary middle-degree Hecke image

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.6/unitary-middle-hecke-image · proposed name CrystallineCM.UnitaryMiddleHeckeImage

Ã(K̃,λ̃,S̄)=image of T̃^{Q^{w₀^P},S̄-ord} in End_O(H^d(X̃_{K̃},V_λ̃)^{P-ord}_{m̃}). Under the generic middle-degree injection this is a finite torsion-free O-algebra inside its rational image. Q-unit eigensystems are selected by the maximal ideal, not by redefining POrd.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-A; CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-2; mathlib:AlgHom.range.

Proof/construction outline:

1. Apply the displayed formula using the named supplier carrier and its functorial action.
2. The API and discriminating tests below fix its normalization and distinguish it from the adjacent ordinary or dual construction.

Sources: CN25v3, §4.2.1, p.61.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-6: Embeds the generic integral degree-d image into its rational image so CTG characters yield cuspidal Q-ordinary characteristic-zero systems.

Planning API:

- **CrystallineCM.UnitaryMiddleHeckeImage_mem** (characterisation): b∈Ã iff it is an ordinary abstract Hecke action on the indicated integral unitary H^d.
- **CrystallineCM.UnitaryMiddleHeckeImage_rational_injective** (compatibility): Under the decomposed-generic middle-degree injection, the natural map Ã→Ã[1/p] is injective.
- **CrystallineCM.UnitaryMiddleHeckeImage_character** (projection): A characteristic-zero algebra character is evaluated on all rescaled partial operators, not only Ũ_n.

Discriminating unit tests:

- **CrystallineCM.UnitaryMiddleHeckeImage_test_zero** (degenerate): Vanishing ordinary H^d gives the zero image.
- **CrystallineCM.UnitaryMiddleHeckeImage_test_torsion_free** (characterisation): Under ambient genericity, a nonzero ϖ-torsion Hecke endomorphism is impossible because its action embeds in rational H^d.
- **CrystallineCM.UnitaryMiddleHeckeImage_test_characters** (compatibility): Its characteristic-zero characters match the cuspidal Q-ordinary eigensystems in Proposition 4.2.11 when CTG and all-unit hypotheses hold.

### Deep Levi congruence level

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.6/deep-levi-level · proposed name CrystallineCM.DeepLeviLevel

For e≥1 and S̄⊂S̄_p, K(e,S̄)_v=K_v∩ker(GL_n(O_{F_v})→GL_n(O_{F_v}/ϖ_v^e)) for v above S̄, and K_v elsewhere. The same depth is imposed at both conjugate places. K(e′,S̄)⊂K(e,S̄) for e′≥e.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c); ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups.

Proof/construction outline:

1. Apply the displayed formula using the named supplier carrier and its functorial action.
2. The API and discriminating tests below fix its normalization and distinguish it from the adjacent ordinary or dual construction.

Sources: CN25v3, §4.2.1, p.61.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-6: Restricts coefficient actions to congruence depth e at both conjugate places so the unipotent-cohomology splitting becomes equivariant.

Planning API:

- **CrystallineCM.DeepLeviLevel_mem** (characterisation): g∈K(e,S̄) iff g∈K and every selected p-component is identity modulo its local ϖ_v^e.
- **CrystallineCM.DeepLeviLevel_antitone** (relation): e′≥e implies K(e′,S̄)⊂K(e,S̄).
- **CrystallineCM.DeepLeviLevel_empty** (simp): K(e,∅)=K.

Discriminating unit tests:

- **CrystallineCM.DeepLeviLevel_test_empty** (degenerate): S̄=∅ leaves K unchanged.
- **CrystallineCM.DeepLeviLevel_test_scalar** (computation): For GL₁ over Z_p with K=Z_p×, K(e,{v̄})=1+p^e Z_p at each conjugate place.
- **CrystallineCM.DeepLeviLevel_test_local_uniformizer** (non-example): At ramified F_v/Q_p, congruence modulo ϖ_v^e differs from congruence modulo p^e; the local uniformizer is required.

### Deep unitary congruence level

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.6/deep-unitary-level · proposed name CrystallineCM.DeepUnitaryLevel

K̃(e,S̄)_{v̄}=K̃_{v̄}∩P_{v̄}(e,e) for v̄∈S̄ and K̃_{v̄} elsewhere; equivalently the reduction modulo ϖ_ṽ^e is block unipotent (1_n *;0 1_n), so U₀ remains present. This is deeper than diagonal-level control while retaining the unipotent fiber.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c).

Proof/construction outline:

1. Apply the displayed formula using the named supplier carrier and its functorial action.
2. The API and discriminating tests below fix its normalization and distinguish it from the adjacent ordinary or dual construction.

Sources: CN25v3, §4.2.1, p.61.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-6: Raises diagonal/lower-left depth while retaining U₀, permitting deep complementary coefficient comparison inside the unitary ordinary tower.

Planning API:

- **CrystallineCM.DeepUnitaryLevel_mem** (characterisation): A selected component lies in K̃(e,S̄) iff it lies in the original K̃ and its diagonal blocks reduce to identity and its lower-left block to zero modulo ϖ_ṽ^e.
- **CrystallineCM.DeepUnitaryLevel_unipotent** (compatibility): U(O_{F⁺_{v̄}})⊂K̃(e,S̄) whenever it was contained in K̃.
- **CrystallineCM.DeepUnitaryLevel_empty** (simp): K̃(e,∅)=K̃.

Discriminating unit tests:

- **CrystallineCM.DeepUnitaryLevel_test_empty** (degenerate): S̄=∅ leaves K̃ unchanged.
- **CrystallineCM.DeepUnitaryLevel_test_upper_unipotent** (computation): For n=1, (1 1;0 1) belongs at every depth when in K̃.
- **CrystallineCM.DeepUnitaryLevel_test_not_principal** (non-example): The same upper-unipotent matrix need not be identity modulo ϖ^e, so replacing this level by a principal congruence subgroup destroys U₀.

### Degree shifting for torsion coefficients at deep auxiliary level

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-6 · proposed name CrystallineCM.torsion_degree_shifting · **Planet: Torsion degree shifting**

Let v̄ ≠ v̄′ ∈ S̄_p, S̄₁ = {v̄′}, S̄₃ = {v̄}, S̄₂ the rest; λ ∈ (Zⁿ₊)^{Hom(F,E)}, m ≥ 1, K̃ good. Assume (1) Σ_{v̄″≠v̄,v̄′}[F⁺_{v̄″} : Q_p] ≥ ½[F⁺ : Q]; (2) for each p-adic v̄″ ≠ v̄ (including v̄′), U(O_{F⁺_{v̄″}}) ⊂ K̃_{v̄″} = K̃(m, S̄₁ ∪ S̄₂)_{v̄″}, and K̃_{v̄} = 𝒬^{w₀^P}_{v̄} for the standard parabolic with Levi Q^{w₀^P}_{v̄} ∩ G(F⁺_{v̄}); (3) −λ_{τc,1} − λ_{τ,1} ≥ 0 for τ inducing v̄ or v̄′; (4) m ⊂ T non-Eisenstein with ρ̄_{m̃} decomposed generic. Put λ̃_τ = 0 for τ not inducing v̄, v̄′ and λ̃_τ = (−λ_{τ̃c}, λ_τ̃) otherwise, and K = (K̃^{v̄} ∩ G(𝔸^{v̄}_{F⁺,f})) · (𝒬_{v̄} ∩ G(F⁺_{v̄})). For q ∈ [⌊d/2⌋, d − 1] there are m′ ≥ m (allowed to depend on the input) and N ≥ 1 depending only on n and [F⁺ : Q], an ideal J ⊂ A(K,λ,q,m) with J^N = 0 and a commutative square T̃^{Q^{w₀^P}_{v̄},{v̄}-ord} → Ã(K̃(m′, S̄₂), λ̃, v̄) over 𝒮^{w₀^P} : T̃^{…} → T^{…}_{w₀^P} → A(K,λ,q,m)/J.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-2; CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-4; CrystallineLocalGlobalCompatibilityCM:CL.6/lem-4-2-5; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-17; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-18; CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-A; IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-nilpotence; ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre; ArithmeticLocallySymmetricSpaces:ALS.4/gln-boundary-eisenstein; CrystallineLocalGlobalCompatibilityCM:CL.6/torsion-hecke-image; CrystallineLocalGlobalCompatibilityCM:CL.6/unitary-middle-hecke-image; CrystallineLocalGlobalCompatibilityCM:CL.6/deep-levi-level; CrystallineLocalGlobalCompatibilityCM:CL.6/deep-unitary-level.

Proof/construction outline:

1. At deep complementary p-level use the splitting of U₀-cohomology to realize degree-q torsion terms as subquotients of degree-d hypercohomology; the numerical bound supplies the needed degree.
2. Use the integral and dual comparisons to control annihilators. In the Hochschild–Serre filtration F_r, bound the discrepancies between integral filtration images by Artin–Rees. Descending degree induction absorbs these cokernels after increasing m′.
3. In the integral hypercohomology filtration, incoming d_r at (q,d−q) comes from (q−r,d−q+r−1), and outgoing d_r lands at (q+r,d−q−r+1). Compare its images with the split torsion spectral sequence and control the image/filtration discrepancies by Artin–Rees (corrected source E20).

Sources: CN25v3, Proposition 4.2.6, pp.62–65.

### Dual Hecke images A^∨ and Ã^∨

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-dual · proposed name CrystallineCM.HeckeImagesDual

For S̄_p = S̄₁ ∪ S̄₂ ∪ S̄₃: A^∨(K,λ,q) := T^{Q_{S̄₃},S̄₃-ord,ι}(H^q(X_K, V^∨_λ)_{m^∨}), A^∨(K,λ,q,m) the same with V^∨_λ/ϖ^m, Ã^∨(K̃,λ̃,S̄₃) := T̃^{Q_{S̄₃},S̄₃-ord,ι̃}(H^d(X̃_{K̃}, V^∨_λ̃)^{ord∨}_{𝒮^*m^∨}).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-A; CrystallineLocalGlobalCompatibilityCM:CL.2/dual-p-ordinary; CrystallineLocalGlobalCompatibilityCM:CL.6/ord-hecke-algebras-4-2.

Proof/construction outline:

1. Construct the stated carrier from the explicitly listed supplier objects and the displayed formulas, retaining every group or Hecke action.
2. The API below specifies the defining projections, normalization and comparison needed at the recorded uses. Verify those identities without changing the coefficient category.

Sources: CN25v3, §4.2.1, p.65.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-8: Uses inverse-coset adjoints and dual coefficient pairings in the comparison reaching degrees below floor(d/2).

Planning API:

- **CrystallineCM.HeckeImagesDual_coefficient** (data): A^∨ uses the inverse-coset action on H^q(X_K,V_λ^∨)_{m^∨}, with the integral and mod-ϖ^m variants distinguished.
- **CrystallineCM.HeckeImagesDual_adjoint** (compatibility): Poincaré pairing identifies dual Hecke operators with the involution g↦g^{-1}.
- **CrystallineCM.HeckeImagesDual_unitary** (projection): Ã^∨ is the image on unitary middle-degree dual POrd, localized at S^*(m^∨).

Discriminating unit tests:

- **CrystallineCM.HeckeImagesDual_test_zero_cohomology** (degenerate): All dual Hecke images vanish on the zero module.
- **CrystallineCM.HeckeImagesDual_test_scalar_inverse** (computation): A double-coset operator acting by a unit a on a perfect dual pair acts adjointly through its inverse coset, so the relevant scalar is a^{-1} when the group action is one-dimensional.
- **CrystallineCM.HeckeImagesDual_test_involution** (compatibility): Applying the coefficient dual and Hecke inversion twice recovers the original action and maximal ideal.

### Dual degree shifting for torsion coefficients

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-8 · proposed name CrystallineCM.dual_torsion_degree_shifting · **Planet: Dual torsion degree shifting**

As prop-4-2-6 with: K̃_{v̄} = 𝒬_{v̄} for the standard parabolic Q_{v̄} ⊂ P_{F⁺_{v̄}}; condition (3) replaced by λ_{τc,n} + λ_{τ,n} ≥ 0 for τ inducing v̄ or v̄′; ρ̄_{𝒮^*(m^∨)} decomposed generic; λ̃_τ = (λ_τ̃, −λ_{τ̃c}) for τ inducing v̄, v̄′; K = K̃ ∩ G(𝔸_{F⁺,f}). Then for q ∈ [⌊d/2⌋, d − 1] there are m′ ≥ m, N (depending only on n, [F⁺ : Q]), J ⊂ A^∨(K,λ,q,m) with J^N = 0 and a commutative square T̃^{Q_{v̄},{v̄}-ord,ι̃} → Ã^∨(K̃(m′,S̄₂), λ̃, v̄) over 𝒮^ι : T̃ → T^{Q_{v̄},{v̄}-ord,ι} → A^∨(K,λ,q,m)/J.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-6; CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-dual; CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-4.

Proof/construction outline:

1. Apply the same filtration-image argument with inverse ordinary operators and the dual degree-d comparison.
2. Use lower-end weight dominance λ_{τc,n}+λ_{τ,n}≥0 and S^ι without a w₀^P-twist on the target.

Sources: CN25v3, Proposition 4.2.8, pp.65–66.

## CL.7. Crystalline local–global compatibility

For all-unit Q-localized non-Eisenstein torsion Hecke systems, produce local finite-flat characteristic-zero lifts with crystalline blocks, labelled weights and determinant characters. Use CTG perturbation and a separating character twist, then import compatible local reconstruction. Assemble a global Hecke-valued representation modulo a uniformly nilpotent ideal factoring through crystalline/semistable-ordinary local deformation rings in the three specified partitions. Export fixed-determinant compatibility for p∤n and crystallinity of unramified characteristic-zero GL_n representations under residual irreducibility and decomposed genericity. Reconstruction over torsion Hecke targets requires the explicit IHG.1 extension; its flat-target export alone is insufficient. In the char-zero endpoint, choose a cyclic CM extension where the selected p-places split completely, so their local fields are unchanged.

Direct stage dependencies: ArithmeticLocallySymmetricSpaces:ALS.3; ArithmeticLocallySymmetricSpaces:ALS.5; AutomorphicGaloisRepresentationsPartII:AG2.2; CrystallineLocalGlobalCompatibilityCM:CL.0; CrystallineLocalGlobalCompatibilityCM:CL.4; CrystallineLocalGlobalCompatibilityCM:CL.6; IntegralHeckeAndGaloisDeterminants:IHG.1; IntegralHeckeAndGaloisDeterminants:IHG.2; IntegralHeckeAndGaloisDeterminants:IHG.5; LocalGaloisDeformationRings:L7; LocalGaloisDeformationRings:R08.3; ModularityAndLanglandsExtensions:ML.5; PadicHodgeTheory:R06.2; PotentialAutomorphyInfrastructure:PA.1; PotentialAutomorphyInfrastructure:PA.5; PotentialModularityAndCompatibleSystems:R23.5; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence.

### Residual determinants of the blocks of a Q-ordinary Galois representation

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-9 · proposed name CrystallineCM.residual_block_determinants

Let v̄ be p-adic, m ⊂ T^{Q^{w₀^P}_{v̄},v̄-ord}_{w₀^P} non-Eisenstein in the support of some H^*(X_K, V_λ), m̃ := (𝒮^{w₀^P})^*(m), v | v̄ with Ũ^k_v ∉ m̃ (1 ≤ k ≤ t). Let π be cuspidal on G̃(𝔸_{F⁺}), ι-Q^{w₀^P}_{v̄}-ordinary of weight λ̃, whose Hecke eigenvalues on (ι^{−1}π^∞)^{K̃, Q^{w₀^P}-ord} come from f : T̃^{Q^{w₀^P}_{v̄}-ord}_{m̃} → Q̄_p; with r_ι(π)|_{G_{F_ṽ}} ≅ (r₁(π) ∗; 0 r₂(π)) as in thm-3-1-2 and r̄_i(π) the semisimplified reductions: det r̄₁(π)(Art_{F_v}(ϖ_v)) = det ρ̄_m(Art_{F_v}(ϖ_v)) and det r̄₂(π)(Art_{F_v}(ϖ_v)) = det(ρ̄_m^{∨,c}(1−2n))(Art_{F_v}(ϖ_v)).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2; CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-21; CrystallineLocalGlobalCompatibilityCM:CL.6/ord-hecke-algebras-4-2.

Proof/construction outline:

1. Compute determinants of the first n and remaining n Galois blocks from Theorem 3.1.2.
2. Use the twisted Satake images of Ũ_n and Ũ_{2n}, and Lemma 2.1.21, to identify reductions with detρ̄_m and det(ρ̄_m^{∨,c}(1−2n)).

Sources: CN25v3, Proposition 4.2.9, pp.66–67.

### Semisimplicity and automorphy of Q-ordinary middle-degree cohomology

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-11 · proposed name CrystallineCM.q_ordinary_automorphic_characters

Let m ⊂ T^T be non-Eisenstein, v̄ ∈ S̄_p, Q_{v̄} ⊂ P_{v̄}, m̃ a maximal ideal of T̃^{Q_{v̄},{v̄}-ord} extending 𝒮^*(m), K̃ good with m̃ in the support of H^*(X̃_{K̃}, V_λ̃)^{ord} for a CTG weight λ̃, and Ũ^k_v ∉ m̃ for 1 ≤ k ≤ t; d = n²[F⁺ : Q]. Then H^d(X̃_{K̃}, V_λ̃)^{ord}_{m̃}[1/p] is a semisimple T̃^{Q_{v̄},{v̄}-ord}[1/p]-module, and for every f : T̃^{Q_{v̄},{v̄}-ord}(H^d(X̃_{K̃}, V_λ̃)^{ord}_{m̃}) → Q̄_p and ι there is a cuspidal π of G̃(𝔸_{F⁺}), ι-Q_{v̄}-ordinary of weight λ̃, whose eigenvalues on (ι^{−1}π^∞)^{K̃,Q_{v̄}-ord} give f.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2; PotentialAutomorphyInfrastructure:PA.1/ctg-weight; ArithmeticLocallySymmetricSpaces:ALS.5/automorphic-comparison.

Proof/construction outline:

1. The CTG weight excludes induced boundary eigensystems in characteristic zero.
2. The automorphic comparison decomposes degree-d cohomology into cuspidal constituents; the one-dimensional Q-ordinary local line makes the commuting Hecke action semisimple and realizes every character.

Sources: CN25v3, Proposition 4.2.11, p.67.

### A twisting character separating local constituents

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.7/sub-lemma-1-twist · proposed name CrystallineCM.local_constituent_separating_twist

In the proof of prop-4-2-13, possibly after enlarging O, there is a continuous character ψ̄ : G_F → k^×, unramified at S_p and with ρ̄_{m̃(ψ)} decomposed generic, such that (1) the irreducible constituents of ρ̄_{m(ψ)}|_{G_{F_ṽ}} are disjoint from those of ρ̄^{∨,c}_{m(ψ)}(1−2n)|_{G_{F_ṽ}}; (2) for every factor i of Ã(ψ)[1/p] = ∏_{i=1}^{r} E (p.69; this r is not the r of n = n₁ + ⋯ + n_r) the irreducible constituents of r̄^i_{1,ψ} coincide with those of ρ̄_{m(ψ)}|_{G_{F_ṽ}}.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-9; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence; ArithmeticLocallySymmetricSpaces:ALS.3/character-twist; PotentialAutomorphyInfrastructure:PA.1/genericity-making-character-twist.

Proof/construction outline:

1. Use the character-extension supplier to choose ψ̄ unramified at S_p, locally trivial at a fixed generic prime, with two uniformizer values of orders >n, coprime to each other and to all finitely many constituent-determinant ratios.
2. A mixed constituent allocation contradicts the partial determinant equality from Proposition 4.2.9. Thus the desired local constituent multiset is disjoint from the conjugate dual and occurs in the prescribed first block.

Sources: CN25v3, Sub-lemma 1, pp.70–71.

### Torsion local–global compatibility at a Q-ordinary place

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-13 · proposed name CrystallineCM.torsion_local_crystalline_block_lift · **Planet: Torsion crystalline blocks**

Assume p splits in an imaginary quadratic subfield of F; K ⊂ GL_n(𝔸_{F,f}) good; v̄ ≠ v̄′ ∈ S̄_p; λ dominant for G; m ≥ 1; Q_{v̄} ⊂ P_{v̄} standard with K_{v̄} = 𝒬_{v̄} ∩ G(F⁺_{v̄}), identified via ι_ṽ with the block parabolic of a partition (n₁,…,n_t) of 2n with n = n₁ + … + n_r; m ⊂ T^{Q_{v̄},{v̄}-ord} maximal in the support of H^*(X_K, V_λ/ϖ^m). Assume (1) Σ_{v̄″≠v̄,v̄′}[F⁺_{v̄″} : Q_p] ≥ ½[F⁺ : Q]; (2) m non-Eisenstein with ρ̄_m decomposed generic; (3) the condition on T of thm-2-1-20; (4) [K_{v̄} ν(ϖ) K_{v̄}] ∉ m for all ν ∈ X_{Q_{v̄}}. Then for each q ∈ [0, d − 1] there are N depending only on n and [F⁺ : Q], J ⊂ T^{Q_{v̄},{v̄}-ord}(H^q(X_K, V_λ/ϖ^m)_m) with J^N = 0, and ρ_m : G_{F,T} → GL_n(T^{…}(H^q(X_K, V_λ/ϖ^m)_m)/J) such that: (1) char ρ_m(Frob_v) = P_v(X) for v ∉ T; (2) for v | v̄, ρ_m|_{G_{F_v}} lifts to ρ̃_v : G_{F_v} → GL_n(Ã) for a finite flat local O-algebra Ã with f : Ã → T^{…}/J; (3) ρ̃_v[1/p] is semistable with labelled Hodge–Tate weights (λ_{τ,n} < … < λ_{τ,1} + n − 1); (4) ρ̃_ṽ[1/p] ≅ upper triangular with diagonal blocks ρ̃_{ṽ,r+1},…,ρ̃_{ṽ,t} and ρ̃_{ṽc}[1/p] ≅ upper triangular with diagonal blocks ρ̃_{ṽc,r},…,ρ̃_{ṽc,1}, each ρ̃_{v,j} : G_{F_v} → GL_{n_j}(Ã[1/p]) crystalline with labelled Hodge–Tate weights increasing from top left to bottom right; (5) for j = r+1,…,t, det ρ̃_{ṽ,j} is Ã-valued with image ψ_j under f, where ∏_{j=r+1}^k ψ_j(Art(u)) = ∏_{i=1}^{n_{r+1}+…+n_k} ∏_τ τ(u)^{−λ_{τ,n−i+1}−i+1} for u ∈ O^×_{F_ṽ} and ∏_{j=r+1}^k ψ_j(Art(ϖ_ṽ)) = ε_p^{Σ_i(1−i)}(Art(ϖ_ṽ)) Ũ^{k−r}_v. The ordered Hodge–Tate list is h_{τ,i}=λ_{τ,n−i+1}+i−1 for 1≤i≤n. The local finite-flat algebra and lift may depend on v, q and m; the nilpotence exponent does not. No globally automorphic lift of the torsion representation is claimed.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-6; CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-8; CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-9; CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-11; CrystallineLocalGlobalCompatibilityCM:CL.7/sub-lemma-1-twist; PotentialAutomorphyInfrastructure:PA.1/ctg-one-embedding-perturbation; IntegralHeckeAndGaloisDeterminants:IHG.1; IntegralHeckeAndGaloisDeterminants:IHG.5; LocalGaloisDeformationRings:L7/semistable-ordinary-quotient.

Proof/construction outline:

1. Apply the two torsion degree-shifting maps, increasing the coefficient exponent and using CTG weight perturbation at an auxiliary place. Every characteristic-zero source character is cuspidal and Q-ordinary.
2. Use the separating twist and the requested torsion-target extension of IHG compatible-local-reconstruction to transfer the selected n-dimensional local constituent from finite-flat characteristic-zero lifts to the torsion Hecke quotient.
3. Read crystalline block shapes, weights and determinant characters from Theorem 3.1.2, then untwist. The finite-flat lift is local to v, not a common global characteristic-zero lift.

Sources: CN25v3, Proposition 4.2.13, pp.67–71.

### Local–global compatibility at p via deformation rings

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-2-15 · proposed name CrystallineCM.integral_local_global_deformation_factorization · **Planet: Crystalline local–global compatibility**

Let F be an imaginary CM field containing an imaginary quadratic field, p a prime split in an imaginary quadratic subfield of F, T ⊇ S_p finite with T = T^c and the condition of thm-2-1-20; K ⊂ GL_n(𝔸_{F,f}) good with K_v = GL_n(O_{F_v}) for v ∉ T; v̄ ≠ v̄′ ∈ S̄_p; λ dominant for G; Q_{v̄} ⊂ P_{v̄} in one of the cases (cr-ord) ι_ṽ(Q_{v̄}) the parabolic of the partition (n,1,…,1) of 2n; (ord) ι_ṽ(Q_{v̄}) = B_{2n}; (cr) Q_{v̄} = P_{v̄}; K_{v̄} = 𝒬_{v̄} ∩ G(F⁺_{v̄}); m ⊂ T^{Q_{v̄},{v̄}-ord} maximal in the support of H^*(X_K, V_λ). Assume (1) Σ_{v̄″≠v̄,v̄′}[F⁺_{v̄″} : Q_p] ≥ ½[F⁺ : Q]; (2) m non-Eisenstein with ρ̄_m decomposed generic; (3) [K_{v̄} ν(ϖ) K_{v̄}] ∉ m for ν ∈ X_{Q_{v̄}}. Then there are N ≥ 1 depending only on n and [F⁺ : Q], J ⊂ T^{Q_{v̄},{v̄}-ord}(RΓ(X_K, V_λ)_m) with J^N = 0 and ρ_m : G_{F,T} → GL_n(T^{…}(RΓ(X_K, V_λ)_m)/J), unramified with char ρ_m(Frob_v) = P_v(X) for v ∉ T, such that the induced t_{ρ_m} : R^□_{ρ̄_m} → T^{…}/J satisfies: (cr-ord) its restriction to R^□_{ρ̄_m|G_{F_ṽ}} factors through R^{△,λ_ṽ} and to R^□_{ρ̄_m|G_{F_{ṽc}}} through R^{cris,λ_{ṽc}}; (ord) for v | v̄ it factors through R^{△,λ_v}; (cr) for v | v̄ it factors through R^{cris,λ_v}.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-13; IntegralHeckeAndGaloisDeterminants:IHG.5; IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-nilpotence; LocalGaloisDeformationRings:L7/semistable-ordinary-quotient.

Proof/construction outline:

1. Reduce the derived Hecke image to degreewise images and mod-ϖ^m coefficients using uniform ghost nilpotence and the IHG tower/descent interface.
2. Apply Proposition 4.2.13 for the three partitions; characterize the crystalline and semistable-ordinary quotient rings by their finite E-algebra points. Carayol reconstruction supplies the global Hecke-valued representation.
3. Assemble the maps with uniform nilpotence bounds; no equality of the integral Hecke algebra with a deformation ring is asserted.

Sources: CN25v3, Theorem 4.2.15, pp.71–72.

### Fixed-determinant refinement

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.7/cor-4-2-16 · proposed name CrystallineCM.fixed_determinant_factorization · **Planet: Fixed-determinant compatibility**

In the setting of thm-4-2-15, assume p ∤ n and f : T^{Q_{v̄},{v̄}-ord}(RΓ(X_K, V_λ)_m)/J → A with det(f_*(ρ_m)) = ψ for a character ψ : G_{F,T} → O^× crystalline at all places of S_p with τ-labelled Hodge–Tate weights Σ_{i=1}^n λ_{τ,i} + (n − i). Then for v | v̄ the induced map R^{△,λ_v}_{ρ̄_m|G_{F_v}} → A or R^{cris,λ_v}_{ρ̄_m|G_{F_v}} → A factors through the corresponding fixed-determinant ψ lifting ring.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-2-15; LocalGaloisDeformationRings:R08.3/fixed-determinant-pst-rings.

Proof/construction outline:

1. Apply the universal property of the fixed-determinant quotients to the representation f_*ρ_m.
2. For p∤n, remove determinant deformation variables via n-th roots in the pro-p character group, using the stated crystalline determinant ψ.

Sources: CN25v3, Corollary 4.2.16, p.72.

### Crystallinity at p of automorphic Galois representations over CM and totally real fields

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-3-1 · proposed name CrystallineCM.unramified_automorphic_crystallinity · **Planet: Crystallinity of automorphic representations**

Let F be totally real or CM, π a cuspidal automorphic representation of GL_n(𝔸_F), regular algebraic of weight λ, v | p with π^{GL_n(O_{F_v})} ≠ 0 and π^{GL_n(O_{F_{v^c}})} ≠ 0 (v = v^c allowed), ι : Q̄_p ≅ C, and r_ι(π) : G_F → GL_n(Q̄_p) the representation of [HLTT16]. If the semisimplified residual reduction r̄_ι(π) is irreducible and decomposed generic, then r_ι(π)|_{G_{F_v}} and r_ι(π)|_{G_{F_{v^c}}} are crystalline with τ-labelled Hodge–Tate weights λ_{ιτ,n} < … < λ_{ιτ,1} + n − 1 for τ inducing v or v^c respectively.

Local hypotheses or variations:

- For this characteristic-zero theorem F is totally real or CM (the imaginary-quadratic subfield condition is dropped); F⁺ is F in the totally real case, n≥2, p a prime; all places of F⁺ above p split in F when unitary parahorics are used. The coefficient field E/Q_p is finite and contains all relevant embeddings, O is its integer ring, k its residue field, and ϖ its uniformizer. Local uniformizers ϖ_v are distinct notation.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-2-15; AutomorphicGaloisRepresentationsPartII:AG2.2; PadicHodgeTheory:R06.2; ModularityAndLanglandsExtensions:ML.5; PotentialModularityAndCompatibleSystems:R23.5; PotentialAutomorphyInfrastructure:PA.5/genericity-normal-closure-restriction.

Proof/construction outline:

1. Choose a cyclic CM extension F′/F disjoint from the residual field, containing an imaginary quadratic field, with every p-place of (F′)⁺ split, the decomposed-generic rational prime split completely, and v,v^c split completely. Choose relative totally-real degree at least four and split v̄ completely to obtain the complementary degree bound. This is the precise requested field-preparation export.
2. Cyclic automorphic base change and residual-image preservation allow Theorem 4.2.15 at places above v and v^c. Their local completions equal the original F_v and F_{v^c}, because these places split completely.
3. The Galois base-change dictionary therefore gives crystallinity and the original labelled weights directly over the same local fields. In the totally real case choose the CM extension with the same local splitting; no descent of crystallinity through a ramified extension is used.

Sources: CN25v3, §4.3, Theorem 4.3.1, p.73.

## CL.8. Two-component patching and PGL₂ cohomology

Package common-residual perfect complexes, finite derived Hecke images modulo nilpotents, equidimensional local rings and unique generic generalizations. Prove two-system automorphic component propagation and pointwise augmentation support. Import exact BT and semistable-ordinary local component results from LocalGaloisDeformationRings. Construct non-neat PGL₂ equivariant cohomology by homotopy limits, identify it with the AKT complex, and obtain its finite Hecke Galois representation; under p odd, ζ_p∈F and trivial residual coefficients, prove localized vanishing and perfectness.

Direct stage dependencies: ArithmeticLocallySymmetricSpaces:ALS.3; ArithmeticLocallySymmetricSpaces:ALS.6; DeformationAndDerivedPatchingAlgebra:P8; DeformationAndDerivedPatchingAlgebra:P9; GlobalGaloisDeformations:R04.2; IntegralHeckeAndGaloisDeterminants:IHG.5; PotentialAutomorphyInfrastructure:PA.3.

### Cohomology of PGL₂ locally symmetric spaces at non-neat level

**Construction** · CrystallineLocalGlobalCompatibilityCM:CL.8/pgl2-cohomology · proposed name CrystallineCM.Pgl2Cohomology · **Planet: PGL₂ cohomology**

For F imaginary CM, G = PGL_{2,F}, K = ∏K_v ⊂ PGL₂(Ô_F) (not necessarily neat), S ⊇ S_p with K_v = PGL₂(O_{F_v}) for v ∉ S, R = O or O/ϖ^m and V an R[K_S]-module finite free over R with V/ϖ^r smooth: C•(K,V) := holim_r RΓ(K, RΓ(𝔛_G, V/ϖ^r)) ∈ D⁺(R) and C•(K/K′,V) ∈ D⁺(R[K/K′]) for open normal K′ with K′^S = K^S, with H(G^S,K^S)-actions (T_{v,i} images of GL₂ operators, T_{v,2} = 1, P_v(X)); RΓ(K/K′, C•(K/K′,V)) = C•(K,V); cohomology finitely generated, Hecke algebras T^S_G(C•(K/K′,V)) O-finite, localizations cut out by idempotents e_m.

Direct prerequisites: ArithmeticLocallySymmetricSpaces:ALS.6; ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent; ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action.

Proof/construction outline:

1. Construct the stated carrier from the explicitly listed supplier objects and the displayed formulas, retaining every group or Hecke action.
2. The API below specifies the defining projections, normalization and comparison needed at the recorded uses. Verify those identities without changing the coefficient category.

Sources: CN25v3, §5.5, pp.79–80.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.8/lem-5-5-1: Provides quotient-group descent and central-character-one Hecke actions at non-neat levels; localization supplies perfect complexes for patching.
- CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-2: Provides quotient-group descent and central-character-one Hecke actions at non-neat levels; localization supplies perfect complexes for patching.
- CrystallineLocalGlobalCompatibilityCM:CL.9/setup-5-6: Provides quotient-group descent and central-character-one Hecke actions at non-neat levels; localization supplies perfect complexes for patching.
- EllipticCurveModularityImaginaryQuadratic design brief; CN §§6–7: Provides quotient-group descent and central-character-one Hecke actions at non-neat levels; localization supplies perfect complexes for patching.

Planning API:

- **CrystallineCM.Pgl2Cohomology_quotient_descent** (compatibility): For K′⊴K with unchanged tame level, RΓ(K/K′,C•(K/K′,V))≅C•(K,V).
- **CrystallineCM.Pgl2Cohomology_coefficient** (functoriality): Finite-free coefficient maps induce morphisms compatible with derived reduction and the Hecke action.
- **CrystallineCM.Pgl2Cohomology_central_operator** (simp): T_{v,2}=1 and P_v(X)=X²−T_{v,1}X+q_v on this PGL₂ complex.

Discriminating unit tests:

- **CrystallineCM.Pgl2Cohomology_test_trivial_quotient** (degenerate): When K′=K, the equivariant complex reduces to the ordinary non-neat coefficient complex.
- **CrystallineCM.Pgl2Cohomology_test_central_scalar** (computation): The scalar GL₂ double coset maps to identity in PGL₂, giving T_{v,2}=1.
- **CrystallineCM.Pgl2Cohomology_test_nonneat** (non-example): A finite p-stabilizer can have unbounded mod-p group cohomology before localization; the definition cannot declare the non-neat complex perfect unconditionally.

### Comparison with the Allen–Khare–Thorne complexes

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.8/lem-5-5-1 · proposed name CrystallineCM.pgl2_akt_complex_comparison

There are natural Hecke-equivariant quasi-isomorphisms A(K/K′, V) ≅ C•(K/K′, V), where A(K/K′, V) are the complexes of [AKT23, §5.1] built from singular chains of 𝔛̄^{dis}_G.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.8/pgl2-cohomology; ArithmeticLocallySymmetricSpaces:ALS.3/discrete-topological-comparison.

Proof/construction outline:

1. Use the ALS discrete/topological comparison for the singular-chain AKT complex.
2. Apply derived invariants under K′ and inverse limits over the coefficient exponent; check both Hecke correspondences and quotient-group actions agree.

Sources: CN25v3, Lemma 5.5.1, p.80.

### Galois representations for PGL₂ over CM fields

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-2 · proposed name CrystallineCM.pgl2_hecke_galois_representation · **Planet: PGL₂ Hecke Galois representations**

Suppose p is odd, S = S^c, F contains an imaginary quadratic field and every finite v ∉ S of residue characteristic l has: S contains no l-adic place and l unramified in F, or l splits in an imaginary quadratic subfield of F. Then for every maximal m ⊂ T^S_G(C•(K/K′,V)) there is a continuous semisimple ρ̄_m : G_{F,S} → GL₂(T^S_G(C•(K/K′,V))/m) with det(X − ρ̄_m(Frob_v)) = P_v(X) mod m for v ∉ S; if ρ̄_m is absolutely irreducible there are N depending only on [F : Q], J with J^N = 0 and ρ_m : G_{F,S} → GL₂(T^S_G(C•(K/K′,V))/J) with det(X − ρ_m(Frob_v)) = P_v(X) mod J for v ∉ S; in particular det ρ_m = ε^{−1}_p.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.8/pgl2-cohomology; CrystallineLocalGlobalCompatibilityCM:CL.8/lem-5-5-1; IntegralHeckeAndGaloisDeterminants:IHG.5; GlobalGaloisDeformations:R04.2/carayol-trace-theorem.

Proof/construction outline:

1. Pull the PGL₂ Hecke systems back through GL₂ and use central character one, so T_{v,2}=1.
2. Apply the IHG nilpotent Galois export with the CM/tame conditions. Descent from the GL₂ carrier gives determinant ε_p^{-1}; residual absolute irreducibility yields a representation over the finite Hecke quotient.

Sources: CN25v3, Proposition 5.5.2, pp.80–81.

### Vanishing above the real dimension and perfectness

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-3 · proposed name CrystallineCM.nonneat_localized_perfectness · **Planet: Non-neat localized perfectness**

Let m ⊂ T^S_G(C•(K,V)) be maximal with residue field k; assume V ⊗ k ≅ k with trivial K_S-action, p odd with ρ̄_m absolutely irreducible, and ζ_p ∈ F. Then H^i(C•(K,V))_m = 0 for i > dim_R X_G; in particular C•(K,V)_m is a perfect complex of R-modules.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-2; CrystallineLocalGlobalCompatibilityCM:CL.8/lem-5-5-1; ArithmeticLocallySymmetricSpaces:ALS.6.

Proof/construction outline:

1. Apply AKT Theorem 5.11 with odd p, ζ_p∈F, absolutely irreducible residual representation and trivial residual coefficient action. It gives the non-neat localized vanishing.
2. Perfectness uses the theorem’s bounded derived residue-coefficient reduction, finite cohomology, and the minimal-complex criterion of AKT Lemma 3.2. Bounded cohomology alone over an arbitrary R, including O/ϖ^m, would not imply perfectness.
3. For a finite abelian p-group cover retain AKT 5.11’s equivariant perfect model over R[K/K′], including derived augmentation; this is the supplier input to Lemma 5.6.4.

Sources: CN25v3, Proposition 5.5.3, p.81.

### Two-system patching data

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.8/two-system-patching-data · proposed name CrystallineCM.TwoSystemPatchingData · **Planet: Two-system patching data**

Let S∞=O[[X₁,…,X_r]] with augmentation a∞=(X₁,…,X_r), C∞ and C′∞ perfect S∞-complexes, and fix an isomorphism C∞⊗ᴸS∞/ϖ≅C′∞⊗ᴸS∞/ϖ. Let T∞⊂End_D(S∞)(C∞) and T′∞⊂End_D(S∞)(C′∞) be finite S∞-algebras whose images coincide in the endomorphism algebra of that residual complex. Let R∞,R′∞ be complete Noetherian local S∞-algebras surjecting onto T∞/I∞,T′∞/I′∞ for nilpotent ideals, and identify R∞/ϖ≅R′∞/ϖ compatibly with S∞ and the actions on the common residual cohomology modulo Ī∞+Ī′∞. Choose q₀∈Z,l₀≥0. Assume dim R∞=dim R′∞=dim S∞−l₀, dim(R∞/ϖ)=dim(R′∞/ϖ)=dim S∞−l₀−1; both R-spectra are equidimensional with characteristic-zero generic points; each special generic point has a unique generic generalization in each R-spectrum. The augmentation fiber C∞⊗ᴸS∞/a∞ has nonzero rational cohomology concentrated in [q₀,q₀+l₀]. Fix a characteristic-zero prime x of T∞/a∞T∞. Support is defined through the finite Hecke action modulo nilpotents; no honest R∞-module chain model is postulated.

Direct prerequisites: mathlib:DerivedCategory; DeformationAndDerivedPatchingAlgebra:P9; DeformationAndDerivedPatchingAlgebra:P8.

Proof/construction outline:

1. Apply the displayed formula using the named supplier carrier and its functorial action.
2. The API and discriminating tests below fix its normalization and distinguish it from the adjacent ordinary or dual construction.

Sources: CN25v3, §5.4, Assumption 5.4.1, pp.77–78.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-4-2: Identifies the residual complexes and nilpotent Hecke supports across the two local rings; unique special generic generalizations permit derived-length support propagation.
- EllipticCurveModularityImaginaryQuadratic design brief; CN §§6–7: Identifies the residual complexes and nilpotent Hecke supports across the two local rings; unique special generic generalizations permit derived-length support propagation.

Planning API:

- **CrystallineCM.TwoSystemPatchingData_residual_identification** (data): The chosen isomorphism of residual perfect complexes identifies the two finite derived Hecke images and the cohomology actions modulo Ī∞+Ī′∞.
- **CrystallineCM.TwoSystemPatchingData_support** (characterisation): Support over R∞ is the closed subset induced from the finite T∞ action modulo nilpotents, independent of the chosen nilpotent exponent.
- **CrystallineCM.TwoSystemPatchingData_specialization_relation** (data): A pair of components C,C_a is related when chosen special generic points have the same unique generic generalization in Spec R′∞ under the fixed residual ring isomorphism.

Discriminating unit tests:

- **CrystallineCM.TwoSystemPatchingData_test_same_system** (degenerate): If both systems and residual identifications coincide, the relation pairs a component with itself and propagation preserves its existing support.
- **CrystallineCM.TwoSystemPatchingData_test_crossing_reject** (non-example): For R=O[[x,y]]/(xy−ϖ²), the special generic points are (ϖ,x) and (ϖ,y), while (ϖ,x,y) is a closed intersection point. The latter cannot be used as a special generic point in the specialization relation, even though it lies on both special components.
- **CrystallineCM.TwoSystemPatchingData_test_nilpotents** (compatibility): Replacing an action by a larger nilpotent quotient does not change its closed support, matching the IHG ghost/maximal-ideal interface.

### Automorphic components propagate through the special fibre

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-4-2 · proposed name CrystallineCM.two_system_automorphic_component_propagation · **Planet: Automorphic component propagation**

Under Assumption 5.4.1, with Supp_{R_∞}(H^*(C_∞)) = Spec T_∞: (1) there is an irreducible component C_a ⊂ Spec R_∞ containing the automorphic point x with C_a ⊂ Spec T_∞; (2) if C_a ⊂ Spec T_∞ is an irreducible component of Spec R_∞ which contains x and C ⊂ Spec R_∞ is an irreducible component such that C ∩ Spec(R_∞/ϖ) and C_a ∩ Spec(R_∞/ϖ) contain generic points x_C, x_a generalizing to the same generic point x′ of Spec R′_∞, then C ⊂ Spec T_∞.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.8/two-system-patching-data; DeformationAndDerivedPatchingAlgebra:P9; PotentialAutomorphyInfrastructure:PA.3/arithmetic-derived-support-contract.

Proof/construction outline:

1. At the augmentation prime use the P9 amplitude/depth inequality to get a nonzero Cohen–Macaulay top cohomology module of the required codimension. This forces a full-dimensional automorphic component through x.
2. Its derived generic Euler length is nonzero. Apply the P9 length identity successively from C_a to its special generic point, across the common mod-ϖ action to R′, to x′, and back through the special generic point of C.
3. Unique generalization and the dimension hypotheses prevent loss to another generic component; nonzero length puts the generic point of C in the Hecke support.

Sources: CN25v3, §5.4, Proposition 5.4.2, pp.78–79.

### Support of patched cohomology at points of automorphic components

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.8/cor-5-4-3 · proposed name CrystallineCM.augmented_automorphic_support · **Planet: Automorphic support at points**

Let C be an irreducible component of Spec R_∞ satisfying the hypothesis of prop-5-4-2(2) for some automorphic C_a, x ∈ C and y its contraction to S_∞. Then the support of H^*(C_∞ ⊗^L S_∞/y)_y over Spec R_∞ contains x; if y is one-dimensional of characteristic 0, x lies in the support of H^*(C_∞ ⊗^L S_∞/y)[1/p].

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-4-2; DeformationAndDerivedPatchingAlgebra:P9.

Proof/construction outline:

1. Localize the derived action at the contraction y and apply derived Nakayama/length to the supported component.
2. For one-dimensional characteristic-zero y, invert p in the localized fiber without losing the nonzero length at x.

Sources: CN25v3, Corollary 5.4.3, p.79.

## CL.9. Barsotti–Tate automorphy lifting and solvable descent

State the fifteen prepared CM lifting hypotheses, define fixed-determinant χ-type and Taylor–Wiles deformation problems, and construct deformation-to-derived-Hecke surjections and diamond-compatible perfect complexes. Use AKT small-image Taylor–Wiles prime selection with its p=5 exception, check q₀=l₀=[F⁺:Q] and patch the two coefficient systems to prove prepared BT lifting. Prove solvable preparation and descent preserving the full residual/cyclotomic field. Export potentially BT automorphy under the original hypotheses plus d_cyc≠3 or projective residual image not A₄; record the unrestricted exceptional case as a source proof gap. Construct the prepared PGL₂ level with pro-v Iwahori auxiliary components, choose the three unitary parabolic branches and the residual ordinary Hecke ideal. The non-enormous AKT Selmer-detection and CM relative generator-count exports remain explicit requests.

Direct stage dependencies: ArithmeticGaloisRepresentations:R01.4; ArithmeticLocallySymmetricSpaces:ALS.0; ArithmeticLocallySymmetricSpaces:ALS.3; ArithmeticLocallySymmetricSpaces:ALS.5; ArithmeticLocallySymmetricSpaces:ALS.6; AutomorphicGaloisRepresentationsPartII:AG2.5; CrystallineLocalGlobalCompatibilityCM:CL.4; CrystallineLocalGlobalCompatibilityCM:CL.7; CrystallineLocalGlobalCompatibilityCM:CL.8; DeformationAndDerivedPatchingAlgebra:P8; GlobalGaloisDeformations:R04.2; GlobalGaloisDeformations:R04.3; GlobalGaloisDeformations:R04.5; LocalGaloisDeformationRings:L7; LocalGaloisDeformationRings:R08.3; LocalGaloisDeformationRings:R08.4; ModularityAndLanglandsExtensions:ML.5; PadicHodgeTheory:R06.3; PotentialAutomorphyInfrastructure:PA.5; PotentialModularityAndCompatibleSystems:R23.5.

### The data and hypotheses (1)–(15) of the special case of Theorem 5.2

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.9/setup-5-6 · proposed name CrystallineCM.Setup56

Data: F imaginary CM, p odd, ι : Q̄_p ≅ C; S ⊇ S_p finite; R ⊂ S prime to p and S_p = S^cr_p ⊔ S^st_p; π cuspidal on PGL₂(𝔸_F), regular algebraic of weight 0. Hypotheses: (5) every prime below S or ramified in F splits in an imaginary quadratic subfield of F (so S is split over F⁺ and F/F⁺ unramified); (6) for v ∈ S_p there is a p-adic v′ ≠ v̄ of F⁺ with Σ_{v″≠v̄,v′}[F⁺_{v″} : Q_p] > ½[F⁺ : Q], and the residue field of v̄ is bigger than F_p; (7) π_v unramified for v ∉ R ∪ S^st_p; (8) π^{Iw_v}_v ≠ 0 for v ∈ R ∪ S^st_p; (9) for v ∈ S^st_p, π is ι-ordinary of weight 0 at v and r_ι(π)|_{G_{F_v}} is non-crystalline ordinary; (10) ζ_p ∈ F if S = S_p ∪ R; (11) otherwise S − (S_p ∪ R) contains two places of distinct residue characteristics; (12) v ∉ R^c and H²(F_v, ad⁰r̄) = 0 for v ∈ S − (R ∪ S_p); (13) r̄_{π,ι} decomposed generic with r̄|_{G_{F(ζ_p)}} irreducible; (14) r̄_{π,ι}|_{G_{F_v}} trivial for v ∈ S_p ∪ R; (15) if p=5 and the projective image of r̄_{π,ι}(G_{F(ζ₅)}) is conjugate to PSL₂(F₅), the extension of F cut out by the projective image of r̄_{π,ι} does not contain ζ₅.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-2-15; CrystallineLocalGlobalCompatibilityCM:CL.8/pgl2-cohomology; LocalGaloisDeformationRings:R08.4/bt-ring-unique-generalisation; LocalGaloisDeformationRings:L7/snowden-ordinary-ring-trivial-residual.

Proof/construction outline:

1. Construct the stated carrier from the explicitly listed supplier objects and the displayed formulas, retaining every group or Hecke action.
2. The API below specifies the defining projections, normalization and comparison needed at the recorded uses. Verify those identities without changing the coefficient category.

Sources: CN25v3, §5.6, pp.81–82.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-1: Keeps every local branch, strict degree bound, auxiliary-place and finite-image hypothesis visible when applying prepared Barsotti–Tate lifting.
- CrystallineLocalGlobalCompatibilityCM:CL.9/deformation-problems-S-chi: Keeps every local branch, strict degree bound, auxiliary-place and finite-image hypothesis visible when applying prepared Barsotti–Tate lifting.
- EllipticCurveModularityImaginaryQuadratic design brief; CN §§6–7: Keeps every local branch, strict degree bound, auxiliary-place and finite-image hypothesis visible when applying prepared Barsotti–Tate lifting.

Planning API:

- **CrystallineCM.Setup56_local_branch** (projection): The data remembers the partition S_p^{cr} ⊔ S_p^{st}. PreparedPGL2Level chooses the unitary split-place orientation and its corresponding parabolics.
- **CrystallineCM.Setup56_auxiliary** (projection): It remembers either ζ_p∈F with S=S_p∪R, or two auxiliary places of distinct residue characteristics satisfying H²(ad⁰r̄)=0.
- **CrystallineCM.Setup56_residual** (projection): The residual representation is decomposed generic, irreducible on G_{F(ζ_p)}, locally trivial at S_p∪R, with the exact p=5 exceptional-field condition.

Discriminating unit tests:

- **CrystallineCM.Setup56_test_weak_degree** (non-example): A complementary degree sum equal to half violates the strict >½ condition in this prepared setup, although it suffices for Theorem 4.2.15.
- **CrystallineCM.Setup56_test_two_auxiliary** (non-example): Two auxiliary places of the same residue characteristic violate condition (11).
- **CrystallineCM.Setup56_test_small_residue** (non-example): A p-place with residue field F_p violates condition (6), even if the residual representation there is trivial.

### Prepared PGL₂ level and unitary parabolic branches

**Construction** · CrystallineLocalGlobalCompatibilityCM:CL.9/prepared-pgl2-level · proposed name CrystallineCM.PreparedPGL2Level · **Planet: Prepared PGL₂ level and unitary parabolic branches**

Under Setup56, define K=∏_v K_v⊂PGL₂(Ô_F): K_v=PGL₂(O_{F_v}) for v∉S or v∈S_p^{cr}, K_v=Iw_v for v∈R∪S_p^{st}, and K_v=Iw_{v,1}, the pro-v Iwahori, for v∈S−(S_p∪R). In the auxiliary-place case K is neat; otherwise ζ_p∈F and localized perfectness uses Proposition 5.5.3. Put T=S∪S^c. For every v̄|p choose ṽ|v̄ in S_p^{st} whenever that set meets {ṽ,ṽ^c}. The unitary parabolic Q_{v̄} has partition (2,1,1) if ṽ is st and ṽ^c is cr, (1,1,1,1) if both are st, and (2,2) if both are cr. Choose the maximal ideal 𝔪 of the corresponding Q-ordinary derived Hecke algebra from π; U_v∉𝔪 for v∈S_p^{st}. Enlarge E so k=k(𝔪) contains every eigenvalue of the residual representation. The selected characteristic-zero representation has dimension two (corrected E15).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.9/setup-5-6; CrystallineLocalGlobalCompatibilityCM:CL.8/pgl2-cohomology; CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-3; CrystallineLocalGlobalCompatibilityCM:CL.4/Q-ordinary-hecke; ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups; ArithmeticLocallySymmetricSpaces:ALS.3; ArithmeticLocallySymmetricSpaces:ALS.5; ArithmeticLocallySymmetricSpaces:ALS.0/neatness-iwahori-criterion.

Proof/construction outline:

1. Use standard maximal, Iwahori and pro-v Iwahori subgroups; the two auxiliary residue characteristics exclude common nontrivial roots of unity in the projective eigenvalue ratios, giving neatness as in ACC+ Lemma 6.5.2. In the non-neat case apply the requested Proposition 5.5.3 export with ζ_p∈F and residual trivial coefficients.
2. Choose the st orientation before forming the three partitions, all refining (2,2). The ordinary π eigencharacter and AKT Theorem 5.10 select 𝔪, and its st unit eigenvalues give U_v∉𝔪. A finite coefficient extension contains the finite residual eigenvalue set.

Sources: CN25v3, Proof of Proposition 5.6.1, pp.82–83; CN25v3, Unitary parabolic cases and residual Hecke ideal, p.83.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.9/deformation-problems-S-chi: Supplies the actual level, unitary parabolic branches, residual Hecke ideal and finite coefficient choices used in the deformation-to-Hecke and patching constructions.
- CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-2: Supplies the actual level, unitary parabolic branches, residual Hecke ideal and finite coefficient choices used in the deformation-to-Hecke and patching constructions.
- CrystallineLocalGlobalCompatibilityCM:CL.9/lem-5-6-4: Supplies the actual level, unitary parabolic branches, residual Hecke ideal and finite coefficient choices used in the deformation-to-Hecke and patching constructions.
- CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-1: Supplies the actual level, unitary parabolic branches, residual Hecke ideal and finite coefficient choices used in the deformation-to-Hecke and patching constructions.

Planning API:

- **CrystallineCM.PreparedPGL2Level_level_components** (projection): Membership is componentwise membership in the specified maximal, Iwahori or pro-v Iwahori subgroup; the auxiliary level is preserved.
- **CrystallineCM.PreparedPGL2Level_unitary_partitions** (projection): The chosen lift ṽ and the cr/st flags determine exactly the displayed three partitions; a lone st branch is placed second in the split Levi dictionary.
- **CrystallineCM.PreparedPGL2Level_residual_hecke_ideal** (compatibility): The π eigencharacter selects 𝔪; U_v is a unit after localization at every st place, and k contains the residual eigenvalues.
- **CrystallineCM.PreparedPGL2Level_localized_perfectness** (compatibility): The localized coefficient complex is perfect at this K, using neatness in the auxiliary case and Proposition 5.5.3 with ζ_p∈F otherwise.

Discriminating unit tests:

- **CrystallineCM.PreparedPGL2Level_test_auxiliary_level** (non-example): At v∈S−(S_p∪R), the selected level is pro-v Iwahori; replacing it by maximal compact loses the specified neatness construction.
- **CrystallineCM.PreparedPGL2Level_test_mixed_orientation** (compatibility): With exactly one st place over v̄, choose it as ṽ; the partition is (2,1,1), with the ordinary branch in the lower-right block.
- **CrystallineCM.PreparedPGL2Level_test_three_branches** (normalisation): Both st gives the Borel (1,1,1,1); both cr gives Siegel (2,2); exactly one st gives (2,1,1).
- **CrystallineCM.PreparedPGL2Level_test_non_neat** (degenerate): For S=S_p∪R there is no auxiliary neatness argument. The ζ_p∈F hypothesis and localized perfectness input are required.

### The global deformation problem 𝒮_χ and its coefficient line

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.9/deformation-problems-S-chi · proposed name CrystallineCM.DeformationProblemsSChi

For χ = ∏_{v∈R} χ_v, with χ_v:k_v×→O× trivial mod ϖ and inflated to O^×_{F_v}: 𝒮_χ = (ρ̄, ε^{−1}_p, S, {R^{ε^{−1},BT}_v}_{v∈S^cr_p} ∪ {R^△_v}_{v∈S^st_p} ∪ {R^{ε^{−1},χ_v}_v}_{v∈R} ∪ {R^{ε^{−1}}_v}_{v∈S−(S_p∪R)}), with the O[K_S]-module O(χ^{−1}) via Iw_v → O^×, (a b; c d) ↦ χ_v(a/d). The coefficient O(χ^{-1}) uses χ_v(a/d)^{-1} at Iwahori v∈R, trivial outside R; each χ_v factors through the residue field k_v× and is trivial modulo ϖ; a/d is reduced to k_v×.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.9/setup-5-6; GlobalGaloisDeformations:R04.3/global-deformation-type; GlobalGaloisDeformations:R04.3/global-framed-ring; LocalGaloisDeformationRings:R08.3/fixed-determinant-pst-rings; LocalGaloisDeformationRings:L7/snowden-ordinary-ring-trivial-residual; CrystallineLocalGlobalCompatibilityCM:CL.9/prepared-pgl2-level; LocalGaloisDeformationRings:R08.4/bt-ring-unique-generalisation.

Proof/construction outline:

1. Construct the stated carrier from the explicitly listed supplier objects and the displayed formulas, retaining every group or Hecke action.
2. The API below specifies the defining projections, normalization and comparison needed at the recorded uses. Verify those identities without changing the coefficient category.

Sources: CN25v3, §5.6, pp.83–84.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-2: Matches p-local BT/ordinary rings and tame χ-types to O(χ^{-1}) Hecke cohomology, whose residual identification enables the two-system patch.
- CrystallineLocalGlobalCompatibilityCM:CL.9/taylor-wiles-deformation-problem: Matches p-local BT/ordinary rings and tame χ-types to O(χ^{-1}) Hecke cohomology, whose residual identification enables the two-system patch.

Planning API:

- **CrystallineCM.DeformationProblemsSChi_p_local** (projection): The p-place ring is fixed-determinant BT for S_p^{cr} and semistable-ordinary for S_p^{st}.
- **CrystallineCM.DeformationProblemsSChi_tame_local** (projection): At v∈R choose the fixed-determinant χ_v local type; at the auxiliary smooth places choose the unrestricted fixed-determinant ring.
- **CrystallineCM.DeformationProblemsSChi_residual_character** (compatibility): Since each χ_v≡1 modϖ, the χ and trivial-character coefficient modules and residual local problems coincide modulo ϖ.

Discriminating unit tests:

- **CrystallineCM.DeformationProblemsSChi_test_chi_one** (degenerate): For χ_v=1 at every v∈R, the coefficient line is the trivial O-module with its trivial Iwahori character.
- **CrystallineCM.DeformationProblemsSChi_test_chi_inverse** (computation): If χ_v(a/d)=u, then O(χ^{-1}) acts by u^{-1}, not u.
- **CrystallineCM.DeformationProblemsSChi_test_mod_p** (compatibility): For χ_v≡1 modϖ, O(χ^{-1})/ϖ is the trivial coefficient line, giving the common residual patching complex.

### Hecke-valued Galois representations satisfy the deformation problem 𝒮_χ

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-2 · proposed name CrystallineCM.deformation_to_hecke_surjection

There are N depending only on [F : Q], J ⊂ T^{S,Q_{S̄_p},S̄_p-ord}_G(C•(K, O(χ^{−1}))_m) with J^N = 0 and a continuous surjection f_{𝒮_χ} : R_{𝒮_χ} → T^{S,Q_{S̄_p},S̄_p-ord}_G(C•(K, O(χ^{−1}))_m)/J with char(f_{𝒮_χ} ∘ ρ^{univ}_{𝒮_χ}(Frob_v)) the image of P_v(X) for v ∉ S.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.9/deformation-problems-S-chi; CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-2; CrystallineLocalGlobalCompatibilityCM:CL.7/cor-4-2-16; AutomorphicGaloisRepresentationsPartII:AG2.5; GlobalGaloisDeformations:R04.2/carayol-trace-theorem; CrystallineLocalGlobalCompatibilityCM:CL.9/prepared-pgl2-level.

Proof/construction outline:

1. Use PGL₂ Galois representations and fixed-determinant crystalline/ordinary local–global compatibility at every p-adic place.
2. At R and the auxiliary smooth places apply the ramified local comparison and universal local deformation quotients. Carayol trace generation gives the continuous surjection from R_{Sχ}.

Sources: CN25v3, Proposition 5.6.2, pp.83–84.

### Taylor–Wiles deformation problem

**Definition** · CrystallineLocalGlobalCompatibilityCM:CL.9/taylor-wiles-deformation-problem · proposed name CrystallineCM.TaylorWilesDeformationProblem

S_{χ,Q} is the fixed-determinant problem obtained from S_χ by adjoining the Taylor–Wiles places Q and the unrestricted fixed-determinant local rings R_v^ψ, with ψ=ε_p^{-1}. Fix the ordered distinct residual Frobenius eigenvalues. The corresponding universal unframed global deformation ring R_{S_{χ,Q}} (framing at T gives the separate ring R^T_{S_{χ,Q}}) has the O[Δ_Q]-structure from inertia on the selected lifted eigenline, Δ_Q=∏_{v∈Q}k_v×(p). This follows the unrestricted-ring definition in CN Definition 5.3.5; the selected eigenline specifies the diamond action, rather than replacing the local problem by the unramified quotient.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.9/deformation-problems-S-chi; GlobalGaloisDeformations:R04.5/taylor-wiles-datum; GlobalGaloisDeformations:R04.5/taylor-wiles-inertia-action.

Proof/construction outline:

1. Apply the displayed formula using the named supplier carrier and its functorial action.
2. The API and discriminating tests below fix its normalization and distinguish it from the adjacent ordinary or dual construction.

Sources: CN25v3, §5.6, p.84.

Uses:

- CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-3: Matches the chosen Frobenius eigenline and inertia/diamond action with O[Δ_Q]-linear deformation-to-Hecke maps and derived augmentation.

Planning API:

- **CrystallineCM.TaylorWilesDeformationProblem_forget** (functoriality): Away from Q the local conditions agree with S_χ. Killing the Δ_Q augmentation ideal enforces unramifiedness at Q and gives a quotient R_{S_{χ,Q}}→R_{S_χ}; allowing Q-ramification does not define an unrestricted forgetting map of deformation functors.
- **CrystallineCM.TaylorWilesDeformationProblem_diamond** (data): The O[Δ_Q]-action is the universal inertia character on the selected residual Frobenius eigenline.
- **CrystallineCM.TaylorWilesDeformationProblem_augmentation** (compatibility): Augmenting Δ_Q kills that inertia character and recovers the unramified chosen-eigenline quotient.

Discriminating unit tests:

- **CrystallineCM.TaylorWilesDeformationProblem_test_empty_q** (degenerate): For Q=∅, Δ_Q=1 and the problem reduces to S_χ.
- **CrystallineCM.TaylorWilesDeformationProblem_test_two_eigenvalues** (non-example): Equal residual Frobenius eigenvalues do not give the chosen-eigenline Taylor–Wiles datum.
- **CrystallineCM.TaylorWilesDeformationProblem_test_augmentation** (compatibility): After Δ_Q-augmentation the selected inertia character is trivial, matching the finite-cover augmentation in Lemma 5.6.4.

### The same at Taylor–Wiles level

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-3 · proposed name CrystallineCM.taylor_wiles_deformation_to_hecke_surjection

There are N depending only on [F : Q], J ⊂ T_{χ,Q} with J^N = 0 and a continuous surjective O[Δ_Q]-algebra homomorphism f_{𝒮_{χ,Q}} : R_{𝒮_{χ,Q}} → T_{χ,Q}/J with char(f ∘ ρ^{univ}(Frob_v)) = P_v(X) for v ∉ S ∪ Q, where T_{χ,Q} is the image of T^{S∪Q,…}_G ⊗ O[Δ_Q] in End_{D(O[Δ_Q])}(C•(K₀(Q)/K₁(Q), O(χ^{−1}))_{n_Q}).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-2; GlobalGaloisDeformations:R04.5/taylor-wiles-inertia-action; ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent; CrystallineLocalGlobalCompatibilityCM:CL.9/taylor-wiles-deformation-problem.

Proof/construction outline:

1. Repeat the deformation-to-Hecke map at the two Taylor–Wiles levels.
2. Verify that the inertia character is the diamond operator on the chosen residual Frobenius eigenline, hence the map is O[Δ_Q]-linear.

Sources: CN25v3, Proposition 5.6.3, p.84.

### Patching complexes of homology

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.9/lem-5-6-4 · proposed name CrystallineCM.taylor_wiles_perfect_dual_augmentation

C_{χ,Q} := RHom_{O[Δ_Q]}(C•(K₀(Q)/K₁(Q), O(χ^{−1}))_{n_Q}, O[Δ_Q]) is a perfect complex of O[Δ_Q]-modules with a canonical isomorphism C_{χ,Q} ⊗^L_{O[Δ_Q]} O ≅ C_χ := RHom_O(C•(K, O(χ^{−1}))_m, O) in D(O).

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-3; ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent; DeformationAndDerivedPatchingAlgebra:P8; CrystallineLocalGlobalCompatibilityCM:CL.9/prepared-pgl2-level.

Proof/construction outline:

1. Use the localized finite-cover perfect model over O[Δ_Q] and take its derived module dual.
2. Derived augmentation O[Δ_Q]→O is compatible with the cover comparison and dualization, giving C_{χ,Q}⊗ᴸO≅C_χ.

Sources: CN25v3, Lemma 5.6.4, pp.84–85.

### Taylor–Wiles data for GL₂ over CM fields without enormous image (Allen–Khare–Thorne)

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.9/akt-tw-primes · proposed name CrystallineCM.small_image_taylor_wiles_prime_selection · **Planet: Small-image Taylor–Wiles primes**

Let F be an imaginary CM field, p odd, and ρ̄ : G_F → GL₂(k) continuous with ρ̄|_{G_{F(ζ_p)}} absolutely irreducible and, if p = 5 and the projective image of ρ̄(G_{F(ζ₅)}) is PSL₂(F₅), the field cut out by the projective image of ρ̄ not containing ζ₅. Then for every N ≥ 1 there is a Taylor–Wiles datum (Q_N, (α_v)_{v∈Q_N}) of level N (Definition 5.3.5) of size q independent of N, killing the relevant dual Selmer group ([AKT23, Prop. A.6]), used with [ACC+18, §6.4] as in the proof of [AKT23, Thm. A.7]. Fix T=S, choose q≥dim_k H¹_{S⊥,S}(ad⁰ρ̄(1)) with g=q−3[F⁺:Q]−1+|S|≥0; then there is a surjection A_S^S[[X₁,…,X_g]]→R_{S_{Q_N}}^S, and the places can have degree one over Q with underlying rational primes split in the chosen imaginary quadratic subfield. The local deformation datum is that of AKT Appendix A.2. The standing local deformation datum is AKT A.2: determinant lifting detρ̄, specified local deformation quotients R_v over Λ_v, Λ=completed tensor of Λ_v, nonempty S⊇S_p, and the finite coefficient field large enough for all residual eigenvalues. Choose F₀ as the CM subfield appearing in A.6 and require F=F⁺F₀.

Direct prerequisites: GlobalGaloisDeformations:R04.5/taylor-wiles-datum; GlobalGaloisDeformations:R04.5/chebotarev-selmer-selection; ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement; GlobalGaloisDeformations:R04.3/global-framed-ring.

Proof/construction outline:

1. Use the requested AKT Lemma A.5 export, including its finite-image group-cohomology argument in the small-image p=3,5 cases. Dickson classification alone does not prove nonzero Selmer evaluation. For every nonzero dual-Selmer cocycle choose a cyclotomic-kernel element with distinct residual eigenvalues and nonzero local evaluation; then apply Chebotarev with the prescribed split-prime conditions.
2. Chebotarev yields degree-one places split in F(ζ_{p^N}); choose q fixed and kill the dual Selmer group.
3. Apply AKT Proposition A.4 with T=S: g=q−3[F⁺:Q]−1+|S| relative generators over the framed local deformation base; no enormous-image assumption is introduced.

Sources: AKT22v2, Proposition A.6, p.87; Lemma A.5 and Proposition A.4, p.86; CN25v3, Proof of Proposition 5.6.1, p.85.

### Automorphy lifting in the special case

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-1 · proposed name CrystallineCM.prepared_barsotti_tate_lifting · **Planet: Prepared Barsotti–Tate lifting**

With the data and hypotheses (1)–(15), let ρ : G_F → GL₂(Q̄_p) be continuous with (1) ρ̄ ≅ r̄_{π,ι} and det ρ = ε^{−1}_p; (2) ρ|_{G_{F_v}} Barsotti–Tate for v ∈ S^cr_p; (3) r_ι(π)|_{G_{F_v}} ordinary iff ρ|_{G_{F_v}} ordinary, for v ∈ S^cr_p; (4) ρ|_{G_{F_v}} a non-crystalline extension of ε^{−1}_p by the trivial character for v ∈ S^st_p; (5) ρ unramified at v ∉ S; (6) ρ|_{G_{F_v}} unipotently ramified for v ∈ R. Then ρ ≅ r_ι(Π) for a cuspidal Π of PGL₂(𝔸_F) of weight 0.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.9/setup-5-6; CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-2; CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-3; CrystallineLocalGlobalCompatibilityCM:CL.9/lem-5-6-4; CrystallineLocalGlobalCompatibilityCM:CL.9/akt-tw-primes; CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-4-2; CrystallineLocalGlobalCompatibilityCM:CL.8/cor-5-4-3; LocalGaloisDeformationRings:R08.4/bt-ring-unique-generalisation; LocalGaloisDeformationRings:L7/snowden-ordinary-ring-trivial-residual; ArithmeticLocallySymmetricSpaces:ALS.5; DeformationAndDerivedPatchingAlgebra:P8; CrystallineLocalGlobalCompatibilityCM:CL.9/prepared-pgl2-level.

Proof/construction outline:

1. Choose Taylor–Wiles sets by the AKT non-enormous-image theorem and patch the χ=1 and χ≠1 systems with the common residual complex.
2. For χ_v≠1 at each v∈R, the local χ-ring has a single relevant generic component; BT and semistable-ordinary components have unique special generic generalizations, supplied by LocalGaloisDeformationRings.
3. Check q₀=l₀=[F⁺:Q], dimensions, generic cohomological concentration, perfectness and common residual action. Apply Proposition 5.4.2 and Corollary 5.4.3 to propagate the automorphic component to ρ, then specialize and read the PGL₂ automorphic character.

Sources: CN25v3, Proposition 5.6.1, p.82.

### A reducibility criterion for mod-p representations (variant of DDT 4.11)

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.9/lem-5-6-5 · proposed name CrystallineCM.determinant_kernel_reducible_except_tetrahedral

Corrected statement (source issue E12): let G be finite, p odd, ρ : G → GL₂(F̄_p) with det ρ of order d > 1, and suppose (tr ρ(g))² = (1 + det ρ(g))² whenever det ρ(g) ≠ 1. Then ρ|_{ker(det ρ)} is reducible, unless d = 3 and the projective image of ρ is A₄; in that case ρ|_{ker(det ρ)} has projective image Z/2 × Z/2 and is absolutely irreducible. (Printed: the conclusion without the exception.)

Direct prerequisites: ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement.

Proof/construction outline:

1. For an element outside ker det with eigenvalues a,b, the trace identity factors as (a−1)(b−1)(a+1)(b+1)=0. Its projective order equals the order of det(g). A scalar zI with determinant≠1 would satisfy (z²−1)²=0, impossible, so all scalars are in ker det and determinant descends to the projective image.
2. Apply Dickson without assuming irreducibility. A Borel image fixes a line. In a dihedral image the nontrivial cyclic determinant image has order two, and every element outside its kernel must be an involution: except for the Klein-four small case this forces the kernel into the rotation torus. In both cases the determinant kernel is reducible.
3. A₅ and PSL₂(F_q), q≥4, are perfect, so admit no nontrivial determinant character. S₄ admits only a quadratic character but its odd 4-cycles violate the projective-order condition. PGL₂(F_q), q odd, has a quadratic character and a nonsplit-torus generator outside its kernel of order q+1>2, so is excluded; handle q=3 as S₄.
4. The only remaining non-Borel case is A₄ with cyclic determinant image of order three. Its kernel has projective image Klein four; in odd characteristic a noncyclic prime-to-p subgroup of a Borel cannot be Klein four, so it fixes no line and is absolutely irreducible. For p=3 a determinant of order three is impossible.
5. The explicit F₇ cubic twist of Q₈⋊C₃ verifies all 16 trace identities outside the kernel and the irreducibility of the Q₈ kernel. This proves the qualified statement and disproves the unqualified printed lemma; it does not disprove the automorphy theorem.

Sources: CN25v3, Lemma 5.6.5, pp.85–86.

### Reduction of Theorem 5.2 to Proposition 5.6.1 by solvable base change

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.9/proof-thm-5-2 · proposed name CrystallineCM.solvable_preparation_and_descent_qualified · **Planet: Solvable preparation and descent**

Under the hypotheses of the qualified CL.9/thm-5-2, including d_cyc≠3 or projective image not A₄, Theorem 5.2 follows from prop-5-6-1: choose a finite set V of auxiliary places as in the proof of [AKT23, Thm. A.14]; a solvable Galois CM extension F₀/F in which V splits, π_{F₀} has Iwahori-fixed vectors everywhere, bad places become unipotent with q_w ≡ 1 mod p and trivial ρ̄, every p-adic place of F₀⁺ splits with residue field bigger than F_p and the degree condition holds, potentially crystalline places become crystalline with π unramified (and r_ι(π) crystalline by thm-4-3-1, ordinary iff ρ is), and non-potentially-crystalline places become non-crystalline extensions of ε^{−1}_p by 1; a further composite F₁ with three imaginary quadratic fields; if ζ_p ∉ F, two auxiliary degree-one places v₀, v₀′ from lem-5-6-5 and Chebotarev; then solvable descent [ACC+18, Prop. 6.5.13]. Choose the preparation linearly disjoint from the full residual-plus-cyclotomic field, so both the projective image and d_cyc are preserved and the corrected finite-image criterion applies.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-1; CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-3-1; CrystallineLocalGlobalCompatibilityCM:CL.9/lem-5-6-5; PotentialModularityAndCompatibleSystems:R23.5; ModularityAndLanglandsExtensions:ML.5; PotentialAutomorphyInfrastructure:PA.5/genericity-normal-closure-restriction.

Proof/construction outline:

1. Choose V with at least one detecting place for every proper residual-plus-cyclotomic subextension and all q-adic places for a fixed unramified q; splitting V preserves the full finite image and cyclotomic degree.
2. Apply the requested solvable-field preparation to make p-local representations semistable of the prescribed crystalline/ordinary branch, enlarge residue fields and local degree sums, and trivialize residual representations at ramified places. Adjoin the prescribed three imaginary quadratic fields.
3. If ζ_p is absent, the corrected finite-image lemma under the explicit cubic-tetrahedral exclusion gives an element with det≠1 and eigenvalue ratio≠det^{±1}. Chebotarev supplies two auxiliary places of distinct residue characteristics with H²(ad⁰ρ̄)=0.
4. Check all fifteen special-case hypotheses, apply Proposition 5.6.1, and use solvable descent. The unrestricted d=3,A₄ case remains a gap.

Sources: CN25v3, End of the proof of Theorem 5.2, pp.85–87.

### Potentially Barsotti–Tate automorphy lifting over imaginary CM fields

**Theorem** · CrystallineLocalGlobalCompatibilityCM:CL.9/thm-5-2 · proposed name CrystallineCM.potentially_barsotti_tate_lifting_qualified · **Planet: Potentially Barsotti–Tate lifting**

Let F be an imaginary CM field, p an odd prime and ρ : G_F → GL₂(Q̄_p) continuous with: (1) ρ unramified almost everywhere and det ρ = ε_p^{−1}; (2) for each v | p, ρ|_{G_{F_v}} potentially semistable with all labelled Hodge–Tate weights (0,1); (3) ρ̄ decomposed generic and ρ̄|_{G_{F(ζ_p)}} irreducible; (4) if p = 5 and the projective image of ρ̄(G_{F(ζ₅)}) is conjugate to PSL₂(F₅), the extension of F cut out by the projective image of ρ̄ does not contain ζ₅; (5) there are a cuspidal π of PGL₂(𝔸_F) and ι : Q̄_p ≅ C with (a) π regular algebraic of weight 0, (b) for v | p with ρ|_{G_{F_v}} potentially crystalline: r_ι(π)|_{G_{F_v}} is potentially ordinary of weight 0 ([Ger19, §5.2]) iff ρ|_{G_{F_v}} is, and rec_{F_v}(π_v) has monodromy 0, (c) for v | p with ρ|_{G_{F_v}} not potentially crystalline: π is ι-ordinary of weight 0 at v and r_ι(π)|_{G_{F_v}} is not potentially crystalline, (d) ρ̄ ≅ r̄_ι(π). Assume in addition d_cyc=[F(ζ_p):F]≠3 or the projective image of ρ̄(G_F) is not A₄ (the E12 correction required by the supplied proof). Then ρ is automorphic: ρ ≅ r_ι(Π) for a cuspidal Π of PGL₂(𝔸_F), regular algebraic of weight 0.

Direct prerequisites: CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-1; CrystallineLocalGlobalCompatibilityCM:CL.9/proof-thm-5-2; CrystallineLocalGlobalCompatibilityCM:CL.9/lem-5-6-5; ModularityAndLanglandsExtensions:ML.5.

Proof/construction outline:

1. Apply the solvable preparation and image-preservation theorem under the explicit cubic-tetrahedral exclusion.
2. Invoke the prepared lifting theorem on the resulting CM field, then use the PGL₂ solvable-descent supplier to recover the given representation over F.

Sources: CN25v3, §5.1, Theorem 5.2, pp.73–74.

## Supplier requests and mathematical ownership

### REQ-SMOOTH

Supplier: SmoothRepresentationsOfLocalGroups:SR.0:abelian-category. Status: requested.

The abelian category of smooth representations of the locally profinite groups and open monoids Δ̃, Δ⁺, Δ used here, over O/ϖ^m; continuous compact-open invariants, enough injectives, restriction preserving injectives in the cases of CN §2.2.2, and their bounded-below derived functors. Algebraic Representation is only a carrier. Include the coefficient-injective embedding into smooth coinduction Ind₁^{P(L)}I and the acyclicity test on these objects used via Emerton Lemma 2.1.10 in CN Lemma 2.3.6.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c); CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-6; CrystallineLocalGlobalCompatibilityCM:CL.1/ordinary-monoid-localization; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors; CrystallineLocalGlobalCompatibilityCM:CL.1/unipotent-transfer-action; CrystallineLocalGlobalCompatibilityCM:CL.3/induction-filtration-functors; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-17; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6.

Consuming sources: CN25v3, §2.1.13, p.19; CN25v3, Lemma 2.3.6, pp.36–37.

### REQ-INDUCTION

Supplier: SmoothRepresentationsOfLocalGroups:SR.2. Status: requested.

Integral unnormalized smooth induction for P(L)\G(L) compact, functions compact modulo P, restriction and tensor identity over O/ϖ^m; exactness in precisely these compact quotient cases. Do not use characteristic-zero Jacquet exactness for p-torsion coefficients. The separately normalized complex Jacquet/geometric lemma is needed in CN Theorem 3.1.2. Include smooth coinduction from the trivial subgroup of P(L): for coefficient-injective I, locally constant I-valued functions on the free right U₀-space P(L)w₀^P U₀ are injective smooth U₀-modules, with evaluation F(x)=f(x)(1) identifying them with I°_{w₀^P}(Ind₁^{P(L)}I). This is the precise CN Lemma 2.3.6 input; it is not Borel N(O)-acyclicity. For Theorem 4.1.3, export the derived Mackey decomposition for restriction of this induction to (K₁⋉U₁); the identity double-coset term is a natural Hecke-equivariant summand. For Theorem 3.1.2, include Bernstein–Zelevinsky classification and the identity-only normalized geometric-lemma calculation for strictly ordered block slopes: a nonzero monodromy block has a positive-length Steinberg factor whose maximal-compact invariants vanish. These are separate characteristic-zero statements, not consequences of integral induction exactness.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.2/prop-2-2-15; CrystallineLocalGlobalCompatibilityCM:CL.3/induction-filtration-functors; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-14; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-2; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-7; CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-3; CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2; CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-5; CrystallineLocalGlobalCompatibilityCM:CL.5/thm-4-1-3.

Consuming sources: CN25v3, Proposition 2.2.15, p.31; CN25v3, Lemma 2.3.6, pp.36–37.

### REQ-CONTINUOUS

Supplier: tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees. Status: requested.

Continuous cochains with finite torsion coefficients, finite-index transfer, and comparison to smooth compact invariants (layer 10), together with the torsion-free abelian Z_p^r cohomological-dimension and coefficient-dual exterior-power computation (layer 11). For U₀≅Z_p^r, H^i_cont(U₀,R_m)=Hom_cont,Z_p(∧^i_Z_p U₀,R_m), with the contragredient conjugation action and rank r; H⁰=R_m. The general Koszul carrier is requested from its algebraic owner. Hochschild–Serre/derived composition and ordinary open-cell vanishing are separately requested from SmoothRepresentationsOfLocalGroups; ProfiniteCohomology explicitly excludes the former.

Why requested: Read the upstream roadmap: layer 10 owns continuous cochains and layer 11 dimension/exterior computations, while Hochschild–Serre is expressly out of scope. These precise exports and the smooth comparison remain requested.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-6; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors; CrystallineLocalGlobalCompatibilityCM:CL.1/parahoric-variant; CrystallineLocalGlobalCompatibilityCM:CL.1/unipotent-transfer-action; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-17; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-7; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-8; CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-4; CrystallineLocalGlobalCompatibilityCM:CL.5/boundary-coefficient-object.

Consuming sources: CN25v3, Definition 2.2.3, pp.26–27; CN25v3, Lemma 2.3.17, p.42.

### REQ-TOWER

Supplier: ArithmeticLocallySymmetricSpaces:ALS.6. Status: requested.

CN §§2.1.3–2.1.10 topological adelic compactification towers: equivariant sheaf derived sections, smooth completed cohomology, recovery by compact-open derived invariants, discrete/topological comparison, homotopy inverse limits in m and finite-level coefficient descent, interior and Borel–Serre boundary. Extend the existing finite-cover exports, without assuming completion is ordinary inverse limit. For Lemma 4.1.6, use the ALS.2 arithmetic nilmanifold fibration, Leray–Serre and strong approximation for the unipotent group to show its positive torsion cohomology dies in the full congruence-level direct limit. The finite characteristic-zero Lie-algebra formula alone does not supply this integral tower conclusion.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-completed; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-14; CrystallineLocalGlobalCompatibilityCM:CL.5/boundary-coefficient-object; CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-6; CrystallineLocalGlobalCompatibilityCM:CL.5/prop-4-1-4; CrystallineLocalGlobalCompatibilityCM:CL.8/pgl2-cohomology; CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-3.

Consuming sources: CN25v3, §2.2.7, p.28.

### REQ-SATAKE

Supplier: SmoothRepresentationsOfLocalGroups:SR.4. Status: requested.

Integral unnormalized local Satake map for GL_n and split U(n,n), in geometric Frobenius conventions; characteristic polynomials use q^{i(i−1)/2}. Supply its Siegel transform and relation with the Levi embedding, with rescaling and conjugation handled by our CL.0/CL.6 application.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-15; CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-21; CrystallineLocalGlobalCompatibilityCM:CL.4/Q-ordinary-hecke; CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2; CrystallineLocalGlobalCompatibilityCM:CL.6/ord-hecke-algebras-4-2.

Consuming sources: CN25v3, Lemma 2.1.15, p.20; Remark 2.1.16.

### REQ-ADMISSIBILITY

Supplier: PadicHodgeTheory:R06.2. Status: requested.

Filtered (φ,N)-modules for finite extensions L/Q_p with E-coefficients, geometric Frobenius slopes v_p normalized v_p(p)=1, t_N=t_H and subobject inequalities, weak admissibility implies admissibility, functorial crystalline/semistable subrepresentations and finite coefficient base change; inverse cyclotomic Hodge–Tate weight +1.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.4/lem-3-1-3; CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2; CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-3-1.

Consuming sources: CN25v3, Theorem 3.1.2, pp.43–44.

### REQ-PADIC-WD

Supplier: PadicHodgeTheory:R06.3. Status: requested.

Semistable Weil–Deligne parameters at p compatible with geometric Frobenius, coefficient extension and determinant, and crystalline iff semistable with N=0 (in the stated unramified descent setting).

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.4/lem-3-1-3; CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2; CrystallineLocalGlobalCompatibilityCM:CL.9/proof-thm-5-2.

Consuming sources: CN25v3, Theorem 3.1.2, pp.43–44.

### REQ-AUTOMORPHIC-GALOIS

Supplier: AutomorphicGaloisRepresentationsPartII:AG2.2. Status: requested.

The 2n-dimensional representation r_ι(π) for a cohomological cuspidal representation of quasi-split U(n,n) via stable base change to GL_{2n}(A_F), with the exact λ̃-Hodge–Tate dictionary and determinant normalizations. Supply HLTT representations for unpolarized regular algebraic GL_n over CM or totally real F. State explicitly the field hypotheses of the char-zero local–global export: CN Theorem 2.1.19(3) has imaginary-quadratic and p-splitting hypotheses. An extension/base-change argument giving the full CM scope of Theorem 3.1.2 is required; the restricted export alone does not establish it.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2; CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-3-1.

Consuming sources: CN25v3, Theorem 3.1.2, pp.43–44.

### REQ-RAMIFIED-LL

Supplier: AutomorphicGaloisRepresentationsPartII:AG2.5. Status: requested.

Nonselfdual local–global comparison at p at Iwahori level sufficient to give semistability and the Frobenius slopes used in CN Theorem 3.1.2. Also away-p monodromy/type bounds for the χ_v and unipotent deformation conditions in CN Propositions 5.6.2–3; retain N rather than assert full local Langlands equality from unramified traces.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2; CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-2.

Consuming sources: CN25v3, Theorem 3.1.2, pp.43–44.

### REQ-SIEGEL-RETRACT

Supplier: PotentialAutomorphyInfrastructure:PA.0. Status: requested.

The non-Eisenstein Siegel-boundary localization of ACC+ Theorem 3.4.2 and Newton–Thorne Corollary 2.11 as a Hecke-equivariant derived retract with the dual Weyl coefficient evaluation map. The residual 2n representation is ρ̄_m⊕ρ̄_m^{c,∨}(1−2n); irreducibility is imposed on its n-dimensional Levi constituent, not on this sum. Include the integral coefficient retract used in CN Corollary 4.1.9, without a Fontaine–Laffaille restriction. Also the separate ACC+ Corollary 2.4.4 integral coefficient retract after the NT16 Lemma 2.10 Levi splitting and Cab84 P-stability argument, as used in Lemma 4.2.3. Do not identify these two retracts.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.5/cor-4-1-9; CrystallineLocalGlobalCompatibilityCM:CL.5/prop-4-1-4; CrystallineLocalGlobalCompatibilityCM:CL.6/lem-4-2-3.

Consuming sources: CN25v3, Corollary 4.1.9, p.57; CN25v3, Lemma 4.2.3, p.60.

### REQ-NILPOTENT-GALOIS

Supplier: IntegralHeckeAndGaloisDeterminants:IHG.5. Status: requested.

CN Theorem 2.1.20 (residual), Theorem 2.1.24 (integral uniform nilpotent exponent), and Proposition 5.5.2 uniform-exponent Galois representations for integral derived Hecke images and O/ϖ^m cohomology. N depends only on n,[F:Q], not m, weights or levels. Include finite-level idempotent localization and inverse-limit/degree assembly preserving Frobenius characteristic coefficients; arithmetic/geometric Frobenius conversion is explicit. Existing IHG tower algebra alone does not assert this arithmetic export.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-21; CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-13; CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-2-15; CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-2.

Consuming sources: CN25v3, Theorem 2.1.24, p.23; CN25v3, Proposition 5.5.2, pp.80–81.

### REQ-DERIVED-LENGTH

Supplier: DeformationAndDerivedPatchingAlgebra:P9. Status: requested.

ACC+ Lemma 6.3.7 localization and derived Euler-length identity for perfect S∞-complexes with finite derived Hecke action modulo nilpotents, along ϖ and one-dimensional points, plus CG Lemma 6.2 amplitude/depth inequality. No strict T∞-module model is assumed. Need the nonzero-length propagation under common special-fibre actions used in CN Proposition 5.4.2.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.8/cor-5-4-3; CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-4-2; CrystallineLocalGlobalCompatibilityCM:CL.8/two-system-patching-data.

Consuming sources: CN25v3, §5.4, Proposition 5.4.2, pp.78–79.

### REQ-COMPLEX-PATCHING

Supplier: DeformationAndDerivedPatchingAlgebra:P8. Status: requested.

Patch the two families C_{χ,Q_N}, C_{1,Q_N} with fixed residual identification, uniformly bounded perfect O[Δ_Q]-models, framing variables, O[[Δ∞]] action, finite Hecke images, local tensor rings, augmentation recovery and compatibility modulo ϖ. The resulting rings have dimension dim S∞−l₀, l₀=[F⁺:Q], q₀=[F⁺:Q] in the GL₂ CM application; proving these arithmetic hypotheses is our CL.9 application.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.8/two-system-patching-data; CrystallineLocalGlobalCompatibilityCM:CL.9/lem-5-6-4; CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-1.

Consuming sources: CN25v3, Proposition 5.6.1, p.82.

### REQ-CHARACTER

Supplier: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence. Status: requested.

Prime-to-p finite characters with prescribed local unramified values at the two selected p-adic places and trivial restriction at a fixed decomposed-generic split prime, allowing coefficient extension. Supply the precise Grunwald–Wang/character extension result used by the CN sub-lemma, with its obstruction and the allowed prime-to-p choices proved to avoid it.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.7/sub-lemma-1-twist.

Consuming sources: CN25v3, Sub-lemma 1, pp.70–71.

### REQ-SOLVABLE-DESCENT

Supplier: ModularityAndLanglandsExtensions:ML.5. Status: requested.

Solvable CM base change/descent for PGL₂ with trivial central character and regular algebraic weight 0; if ρ|G_{F′} is irreducible and realized by a cuspidal Π, descend to ρ over F. Also cyclic GL_n base change (iterating prime-degree base change where needed) for the crystalline theorem, with irreducibility preserving cuspidality, as in ACC+ Proposition 6.5.13 and CN Theorem 4.3.1.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-3-1; CrystallineLocalGlobalCompatibilityCM:CL.9/proof-thm-5-2; CrystallineLocalGlobalCompatibilityCM:CL.9/thm-5-2.

Consuming sources: CN25v3, §4.3, Theorem 4.3.1, p.73.

### REQ-PREP-FIELDS

Supplier: PotentialModularityAndCompatibleSystems:R23.5. Status: requested.

Solvable Galois CM extensions with prescribed local splitting/trivialization/semistability, degree distribution and disjointness from any fixed finite residual-plus-cyclotomic field; the V-set argument and imaginary-quadratic composita of CN §5.6/AKT Theorem A.14. Supply preparation preserving the full residual image and cyclotomic degree, not only irreducibility. For Theorem 4.3.1, also supply the cyclic CM extension F₁/F (allowing F totally real) with [(F₁)⁺:F⁺]≥4, taking F⁺=F in the totally real case, disjoint from the residual field, containing an imaginary quadratic field, with all p-adic F₁⁺ places split in F₁ and the selected v and v^c split completely in F₁. Thus the local fields at these places are unchanged; crystallinity is obtained directly, without ramified descent.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-3-1; CrystallineLocalGlobalCompatibilityCM:CL.9/proof-thm-5-2.

Consuming sources: CN25v3, §4.3, Theorem 4.3.1, p.73.

### REQ-BRUHAT

Supplier: tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory. Status: requested.

Generic parabolic double Bruhat decomposition and algebraic closure order for split connected reductive groups; the new node only compares it with the p-adic topology. The pinned GL₂ Bruhat declaration is a rank-one sanity check, not this general supplier.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-2.

Consuming sources: CN25v3, §2.3.1, Lemma 2.3.2, p.33.

### REQ-INTEGRAL-WEYL

Supplier: PotentialAutomorphyInfrastructure:PA.0. Status: requested.

Integral algebraic induction/dual Weyl modules with coefficient extension and reduction, Levi evaluation onto V_{λ_τ̃}⊗V_{−w₀λ_{τ̃c}}, Schubert evaluation surjectivity after reduction and the positive-root weight description of its kernel. Generic highest-weight theory is owned by the representation-theory roadmap, not this application. Export the integral Levi-equivariant splitting V_{λ̃}=V_λ⊕W (NT16 Lemma 2.10); identify W⊗E=(1−U) V_{λ̃,E} (Cab84 proof of Proposition 2) to prove P(O)-stability before invoking the dual coefficient retract.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-12; CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-17; CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-14; CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-16; CrystallineLocalGlobalCompatibilityCM:CL.5/cor-4-1-9; CrystallineLocalGlobalCompatibilityCM:CL.6/lem-4-2-3.

Consuming sources: CN25v3, Lemma 2.1.12, pp.17–18.

### REQ-KOSZUL

Supplier: DeformationAndDerivedPatchingAlgebra:R03.3. Status: requested.

General finite Koszul complexes of commuting endomorphisms, with the exterior-power carrier, zero-differential comparison, coefficient base change and regular-sequence resolution. Export the compact Z_p^r continuous-cochain computation via the ProfiniteCohomology owner; do not create a second generic Koszul complex here or inside an arithmetic lifting theorem.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-17.

Consuming sources: CN25v3, §2.3.16, pp.41–42; Lemma 2.3.17 on p.42.

### REQ-DEEP-PERFECT

Supplier: SmoothRepresentationsOfLocalGroups:SR.0:derived-extension. Status: requested.

For a profinite K with cofinal congruence K_M, perfect underlying R-complexes in D⁺_sm(K,R) become isomorphic, after sufficiently deep restriction, to the constant action on the underlying complex. Prove colim_M Hom(B_M,A_M)≅Hom(B,A) using dualizability, derived tensor/invariants adjunction and smoothness. This is the general categorical step of CN Lemma 2.3.17, not a blanket formality statement for all U.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-17.

Consuming sources: CN25v3, §2.3.16, pp.41–42; Lemma 2.3.17 on p.42.

### REQ-PGL2-VANISHING

Supplier: ArithmeticLocallySymmetricSpaces:ALS.6. Status: requested.

AKT Theorem 5.11 / CN Proposition 5.5.3: at non-neat PGL₂ levels with p odd, ζ_p∈F, trivial mod-residue coefficients and absolutely irreducible residual Galois representation, cohomology above the real dimension vanishes and the localized complex is perfect over O or O/ϖ^m; explain finite stabilizer cohomology. The existing lowest-degree-descent node does not imply this. Perfectness requires bounded derived residue reduction and finite cohomology via the AKT Lemma 3.2 minimal-complex criterion; bounded cohomology alone over O/ϖ^m is insufficient. Include perfect O[Δ]-models at the finite abelian p-covers used in Lemma 5.6.4 and their derived augmentation identification with the base complex.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.8/pgl2-cohomology; CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-3; CrystallineLocalGlobalCompatibilityCM:CL.9/prepared-pgl2-level; CrystallineLocalGlobalCompatibilityCM:CL.9/lem-5-6-4; CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-1.

Consuming sources: CN25v3, Proposition 5.5.3, p.81; AKT22v2, Theorem 5.11, p.46; proof completed on pp.47–48.

### REQ-PGL2-RANGE

Supplier: ArithmeticLocallySymmetricSpaces:ALS.5. Status: requested.

AKT Theorem 5.10 for PGL₂ over a CM field: a Galois-type non-Eisenstein maximal ideal has rational cohomology only in [D,2D], D=[F⁺:Q], and each characteristic-zero Hecke character is realized by a cuspidal regular-algebraic PGL₂ representation. Retain the weight/central-character descent and tame-level fixed-vector hypotheses. This supplies q₀=l₀=D, not the GL₂ range with l₀=2D−1.

Why requested: The supplier owns this general input. Its existing target-level description was read; no exact sufficient node is available in the current packets.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-1.

Consuming sources: AKT22v2, Theorem 5.10(2–3), p.45.

### REQ-DERIVED-INVARIANTS

Supplier: SmoothRepresentationsOfLocalGroups:SR.0:derived-extension. Status: requested.

Derived invariants for smooth semidirect products compose: RΓ(K⋉U,−)≅RΓ(K,RΓ(U,−)) with the precise restriction/injectivity and inflation/projection-formula hypotheses, giving the Hecke-equivariant comparison of CN Lemma 4.1.7 and Lemma 4.2.3. Also export the ordinary open-cell quotient vanishing from the contracting, locally nilpotent ũ-action used in Lemma 2.3.6 (Hauseux Lemma 3.3.1 argument), including its higher derived cohomology; it does not follow merely from H⁰-localization. Preserve the compact determinant-unit orientation in Lemma 2.3.8.

Why requested: The smooth derived extension owns these missing functors; upstream ProfiniteCohomology expressly excludes Hochschild–Serre. Read the existing statement; a derived category carrier alone does not supply the comparison.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-6; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-8; CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-7; CrystallineLocalGlobalCompatibilityCM:CL.6/lem-4-2-3.

Consuming sources: CN25v3, Lemma 4.1.7, p.56; CN25v3, Lemma 2.3.6, pp.36–37.

### REQ-CENTRAL-HECKE

Supplier: ArithmeticLocallySymmetricSpaces:ALS.3. Status: requested.

The adelic center acts on the localized arithmetic cohomology; ray-class congruence and archimedean connectedness compare the central operator at a p-adic uniformizer with a good-place central Hecke operator. With global class-field reciprocity and Chebotarev, the unique generalized eigenvalue is ψ(Art_{F_v}(ϖ_v)), where ψ=ε̄_p^{n(n−1)/2}detρ̄. Respect the good-place q^{n(n−1)/2}T_{w,n} normalization and the fact that v itself may be ramified.

Why requested: The read Hecke-action supplier does not state this global-central comparison. It is a precise extension request, using ClassFieldTheory rather than planning a new reciprocity theorem here.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-21.

Consuming sources: CN25v3, Lemma 2.1.21 and its proof, pp.22–23.

### REQ-Q-ORDINARY-LINEAR-ALGEBRA

Supplier: PadicFamilies:L0a. Status: requested.

For commuting operators on a finite-dimensional p-adic E-vector space, decompose into simultaneous generalized eigenspaces after finite splitting-field extension and descend the sum of the pieces where every rescaled eigenvalue has valuation zero. Prove independence of the splitting field, functoriality and equality with the largest stable subspace whose operator eigenvalues are all units. Fitting over an Artinian and Noetherian module detects nonzero eigenvalues, not valuation-zero eigenvalues over E.

Why requested: Read the finite Fitting supplier; its integer/torsion projector does not directly prove this characteristic-zero unit-slope decomposition.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.4/q-ordinary-local-subspace.

Consuming sources: CN25v3, §3.1, p.43.

### REQ-COMPATIBLE-LOCAL-RECONSTRUCTION

Supplier: IntegralHeckeAndGaloisDeterminants:IHG.1. Status: requested.

Extend compatible-local-reconstruction from a finite flat target A to the complete Noetherian local O-algebras/finite torsion quotients A used in Proposition 4.2.13. A is allowed to have ϖ-torsion. Only the auxiliary characteristic-zero lift algebra Ã is finite flat. With disjoint residual local constituent sets, use the same GMA idempotent/corner reconstruction to descend the chosen n-dimensional constituent and compare its characteristic polynomial to the local finite-flat lifts, preserving quotient/base-change compatibility.

Why requested: Read the exact IHG.1/compatible-local-reconstruction statement: it requires A finite flat, which fails for the torsion target. Its genuine corner/reconstruction extension is requested, not asserted available.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-13.

Consuming sources: CN25v3, Proposition 4.2.13 proof, pp.69–71.

### REQ-AKT-TAYLOR-WILES

Supplier: GlobalGaloisDeformations:R04.5. Status: requested.

AKT Appendix A.2–A.6 with no enormous-image assumption: for p odd and ρ̄|G_{F(ζ_p)} absolutely irreducible, with the stated p=5 PSL₂ exception excluded, prove Lemma A.5 finite-image detection of every nonzero dual-Selmer cocycle by a cyclotomic-kernel element with distinct eigenvalues, including the small p=3,5 cases. Apply Chebotarev to choose fixed-size degree-one Taylor–Wiles sets of level N, avoiding fixed bad places and satisfying the A.6 imaginary-quadratic split conditions. Export A.4 relative framed presentation for this exact CM fixed-determinant local datum: with T=S the number of generators is g=q−3[F⁺:Q]−1+|S|, and the selection kills the relevant dual Selmer group.

Why requested: Read the existing general generator-count and Chebotarev nodes. Their different datum and the classification supplier do not supply this non-enormous Selmer-detection theorem or this CM generator formula. Extend the existing owner, using its R04.3 presentation infrastructure.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.9/akt-tw-primes.

Consuming sources: AKT22v2, Propositions A.4, A.6 and Lemma A.5, pp.86–87.

## Open gaps and prototype boundary

**GAP-SMOOTH** (supplier). SmoothRepresentationsOfLocalGroups:SR.0:abelian-category: The abelian category of smooth representations of the locally profinite groups and open monoids Δ̃, Δ⁺, Δ used here, over O/ϖ^m; continuous compact-open invariants, enough injectives, restriction preserving injectives in the cases of CN §2.2.2, and their bounded-below derived functors. Algebraic Representation is only a carrier. Include the coefficient-injective embedding into smooth coinduction Ind₁^{P(L)}I and the acyclicity test on these objects used via Emerton Lemma 2.1.10 in CN Lemma 2.3.6.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c); CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-6; CrystallineLocalGlobalCompatibilityCM:CL.1/ordinary-monoid-localization; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors; CrystallineLocalGlobalCompatibilityCM:CL.1/unipotent-transfer-action; CrystallineLocalGlobalCompatibilityCM:CL.3/induction-filtration-functors; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-17; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6.

**GAP-INDUCTION** (supplier). SmoothRepresentationsOfLocalGroups:SR.2: Integral unnormalized smooth induction for P(L)\G(L) compact, functions compact modulo P, restriction and tensor identity over O/ϖ^m; exactness in precisely these compact quotient cases. Do not use characteristic-zero Jacquet exactness for p-torsion coefficients. The separately normalized complex Jacquet/geometric lemma is needed in CN Theorem 3.1.2. Include smooth coinduction from the trivial subgroup of P(L): for coefficient-injective I, locally constant I-valued functions on the free right U₀-space P(L)w₀^P U₀ are injective smooth U₀-modules, with evaluation F(x)=f(x)(1) identifying them with I°_{w₀^P}(Ind₁^{P(L)}I). This is the precise CN Lemma 2.3.6 input; it is not Borel N(O)-acyclicity. For Theorem 4.1.3, export the derived Mackey decomposition for restriction of this induction to (K₁⋉U₁); the identity double-coset term is a natural Hecke-equivariant summand. For Theorem 3.1.2, include Bernstein–Zelevinsky classification and the identity-only normalized geometric-lemma calculation for strictly ordered block slopes: a nonzero monodromy block has a positive-length Steinberg factor whose maximal-compact invariants vanish. These are separate characteristic-zero statements, not consequences of integral induction exactness.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.2/prop-2-2-15; CrystallineLocalGlobalCompatibilityCM:CL.3/induction-filtration-functors; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-14; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-2; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-7; CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-3; CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2; CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-5; CrystallineLocalGlobalCompatibilityCM:CL.5/thm-4-1-3.

**GAP-CONTINUOUS** (supplier). tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees: Continuous cochains with finite torsion coefficients, finite-index transfer, and comparison to smooth compact invariants (layer 10), together with the torsion-free abelian Z_p^r cohomological-dimension and coefficient-dual exterior-power computation (layer 11). For U₀≅Z_p^r, H^i_cont(U₀,R_m)=Hom_cont,Z_p(∧^i_Z_p U₀,R_m), with the contragredient conjugation action and rank r; H⁰=R_m. The general Koszul carrier is requested from its algebraic owner. Hochschild–Serre/derived composition and ordinary open-cell vanishing are separately requested from SmoothRepresentationsOfLocalGroups; ProfiniteCohomology explicitly excludes the former.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-6; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors; CrystallineLocalGlobalCompatibilityCM:CL.1/parahoric-variant; CrystallineLocalGlobalCompatibilityCM:CL.1/unipotent-transfer-action; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-17; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-7; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-8; CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-4; CrystallineLocalGlobalCompatibilityCM:CL.5/boundary-coefficient-object.

**GAP-TOWER** (supplier). ArithmeticLocallySymmetricSpaces:ALS.6: CN §§2.1.3–2.1.10 topological adelic compactification towers: equivariant sheaf derived sections, smooth completed cohomology, recovery by compact-open derived invariants, discrete/topological comparison, homotopy inverse limits in m and finite-level coefficient descent, interior and Borel–Serre boundary. Extend the existing finite-cover exports, without assuming completion is ordinary inverse limit. For Lemma 4.1.6, use the ALS.2 arithmetic nilmanifold fibration, Leray–Serre and strong approximation for the unipotent group to show its positive torsion cohomology dies in the full congruence-level direct limit. The finite characteristic-zero Lie-algebra formula alone does not supply this integral tower conclusion.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-completed; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-14; CrystallineLocalGlobalCompatibilityCM:CL.5/boundary-coefficient-object; CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-6; CrystallineLocalGlobalCompatibilityCM:CL.5/prop-4-1-4; CrystallineLocalGlobalCompatibilityCM:CL.8/pgl2-cohomology; CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-3.

**GAP-SATAKE** (supplier). SmoothRepresentationsOfLocalGroups:SR.4: Integral unnormalized local Satake map for GL_n and split U(n,n), in geometric Frobenius conventions; characteristic polynomials use q^{i(i−1)/2}. Supply its Siegel transform and relation with the Levi embedding, with rescaling and conjugation handled by our CL.0/CL.6 application.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-15; CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-21; CrystallineLocalGlobalCompatibilityCM:CL.4/Q-ordinary-hecke; CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2; CrystallineLocalGlobalCompatibilityCM:CL.6/ord-hecke-algebras-4-2.

**GAP-ADMISSIBILITY** (supplier). PadicHodgeTheory:R06.2: Filtered (φ,N)-modules for finite extensions L/Q_p with E-coefficients, geometric Frobenius slopes v_p normalized v_p(p)=1, t_N=t_H and subobject inequalities, weak admissibility implies admissibility, functorial crystalline/semistable subrepresentations and finite coefficient base change; inverse cyclotomic Hodge–Tate weight +1.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.4/lem-3-1-3; CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2; CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-3-1.

**GAP-PADIC-WD** (supplier). PadicHodgeTheory:R06.3: Semistable Weil–Deligne parameters at p compatible with geometric Frobenius, coefficient extension and determinant, and crystalline iff semistable with N=0 (in the stated unramified descent setting).

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.4/lem-3-1-3; CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2; CrystallineLocalGlobalCompatibilityCM:CL.9/proof-thm-5-2.

**GAP-AUTOMORPHIC-GALOIS** (supplier). AutomorphicGaloisRepresentationsPartII:AG2.2: The 2n-dimensional representation r_ι(π) for a cohomological cuspidal representation of quasi-split U(n,n) via stable base change to GL_{2n}(A_F), with the exact λ̃-Hodge–Tate dictionary and determinant normalizations. Supply HLTT representations for unpolarized regular algebraic GL_n over CM or totally real F. State explicitly the field hypotheses of the char-zero local–global export: CN Theorem 2.1.19(3) has imaginary-quadratic and p-splitting hypotheses. An extension/base-change argument giving the full CM scope of Theorem 3.1.2 is required; the restricted export alone does not establish it.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2; CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-3-1.

**GAP-RAMIFIED-LL** (supplier). AutomorphicGaloisRepresentationsPartII:AG2.5: Nonselfdual local–global comparison at p at Iwahori level sufficient to give semistability and the Frobenius slopes used in CN Theorem 3.1.2. Also away-p monodromy/type bounds for the χ_v and unipotent deformation conditions in CN Propositions 5.6.2–3; retain N rather than assert full local Langlands equality from unramified traces.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2; CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-2.

**GAP-SIEGEL-RETRACT** (supplier). PotentialAutomorphyInfrastructure:PA.0: The non-Eisenstein Siegel-boundary localization of ACC+ Theorem 3.4.2 and Newton–Thorne Corollary 2.11 as a Hecke-equivariant derived retract with the dual Weyl coefficient evaluation map. The residual 2n representation is ρ̄_m⊕ρ̄_m^{c,∨}(1−2n); irreducibility is imposed on its n-dimensional Levi constituent, not on this sum. Include the integral coefficient retract used in CN Corollary 4.1.9, without a Fontaine–Laffaille restriction. Also the separate ACC+ Corollary 2.4.4 integral coefficient retract after the NT16 Lemma 2.10 Levi splitting and Cab84 P-stability argument, as used in Lemma 4.2.3. Do not identify these two retracts.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.5/cor-4-1-9; CrystallineLocalGlobalCompatibilityCM:CL.5/prop-4-1-4; CrystallineLocalGlobalCompatibilityCM:CL.6/lem-4-2-3.

**GAP-NILPOTENT-GALOIS** (supplier). IntegralHeckeAndGaloisDeterminants:IHG.5: CN Theorem 2.1.20 (residual), Theorem 2.1.24 (integral uniform nilpotent exponent), and Proposition 5.5.2 uniform-exponent Galois representations for integral derived Hecke images and O/ϖ^m cohomology. N depends only on n,[F:Q], not m, weights or levels. Include finite-level idempotent localization and inverse-limit/degree assembly preserving Frobenius characteristic coefficients; arithmetic/geometric Frobenius conversion is explicit. Existing IHG tower algebra alone does not assert this arithmetic export.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-21; CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-13; CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-2-15; CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-2.

**GAP-DERIVED-LENGTH** (supplier). DeformationAndDerivedPatchingAlgebra:P9: ACC+ Lemma 6.3.7 localization and derived Euler-length identity for perfect S∞-complexes with finite derived Hecke action modulo nilpotents, along ϖ and one-dimensional points, plus CG Lemma 6.2 amplitude/depth inequality. No strict T∞-module model is assumed. Need the nonzero-length propagation under common special-fibre actions used in CN Proposition 5.4.2.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.8/cor-5-4-3; CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-4-2; CrystallineLocalGlobalCompatibilityCM:CL.8/two-system-patching-data.

**GAP-COMPLEX-PATCHING** (supplier). DeformationAndDerivedPatchingAlgebra:P8: Patch the two families C_{χ,Q_N}, C_{1,Q_N} with fixed residual identification, uniformly bounded perfect O[Δ_Q]-models, framing variables, O[[Δ∞]] action, finite Hecke images, local tensor rings, augmentation recovery and compatibility modulo ϖ. The resulting rings have dimension dim S∞−l₀, l₀=[F⁺:Q], q₀=[F⁺:Q] in the GL₂ CM application; proving these arithmetic hypotheses is our CL.9 application.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.8/two-system-patching-data; CrystallineLocalGlobalCompatibilityCM:CL.9/lem-5-6-4; CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-1.

**GAP-CHARACTER** (supplier). tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence: Prime-to-p finite characters with prescribed local unramified values at the two selected p-adic places and trivial restriction at a fixed decomposed-generic split prime, allowing coefficient extension. Supply the precise Grunwald–Wang/character extension result used by the CN sub-lemma, with its obstruction and the allowed prime-to-p choices proved to avoid it.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.7/sub-lemma-1-twist.

**GAP-SOLVABLE-DESCENT** (supplier). ModularityAndLanglandsExtensions:ML.5: Solvable CM base change/descent for PGL₂ with trivial central character and regular algebraic weight 0; if ρ|G_{F′} is irreducible and realized by a cuspidal Π, descend to ρ over F. Also cyclic GL_n base change (iterating prime-degree base change where needed) for the crystalline theorem, with irreducibility preserving cuspidality, as in ACC+ Proposition 6.5.13 and CN Theorem 4.3.1.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-3-1; CrystallineLocalGlobalCompatibilityCM:CL.9/proof-thm-5-2; CrystallineLocalGlobalCompatibilityCM:CL.9/thm-5-2.

**GAP-PREP-FIELDS** (supplier). PotentialModularityAndCompatibleSystems:R23.5: Solvable Galois CM extensions with prescribed local splitting/trivialization/semistability, degree distribution and disjointness from any fixed finite residual-plus-cyclotomic field; the V-set argument and imaginary-quadratic composita of CN §5.6/AKT Theorem A.14. Supply preparation preserving the full residual image and cyclotomic degree, not only irreducibility. For Theorem 4.3.1, also supply the cyclic CM extension F₁/F (allowing F totally real) with [(F₁)⁺:F⁺]≥4, taking F⁺=F in the totally real case, disjoint from the residual field, containing an imaginary quadratic field, with all p-adic F₁⁺ places split in F₁ and the selected v and v^c split completely in F₁. Thus the local fields at these places are unchanged; crystallinity is obtained directly, without ramified descent.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-3-1; CrystallineLocalGlobalCompatibilityCM:CL.9/proof-thm-5-2.

**GAP-BRUHAT** (supplier). tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory: Generic parabolic double Bruhat decomposition and algebraic closure order for split connected reductive groups; the new node only compares it with the p-adic topology. The pinned GL₂ Bruhat declaration is a rank-one sanity check, not this general supplier.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-2.

**GAP-INTEGRAL-WEYL** (supplier). PotentialAutomorphyInfrastructure:PA.0: Integral algebraic induction/dual Weyl modules with coefficient extension and reduction, Levi evaluation onto V_{λ_τ̃}⊗V_{−w₀λ_{τ̃c}}, Schubert evaluation surjectivity after reduction and the positive-root weight description of its kernel. Generic highest-weight theory is owned by the representation-theory roadmap, not this application. Export the integral Levi-equivariant splitting V_{λ̃}=V_λ⊕W (NT16 Lemma 2.10); identify W⊗E=(1−U) V_{λ̃,E} (Cab84 proof of Proposition 2) to prove P(O)-stability before invoking the dual coefficient retract.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-12; CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-17; CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-14; CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-16; CrystallineLocalGlobalCompatibilityCM:CL.5/cor-4-1-9; CrystallineLocalGlobalCompatibilityCM:CL.6/lem-4-2-3.

**GAP-KOSZUL** (supplier). DeformationAndDerivedPatchingAlgebra:R03.3: General finite Koszul complexes of commuting endomorphisms, with the exterior-power carrier, zero-differential comparison, coefficient base change and regular-sequence resolution. Export the compact Z_p^r continuous-cochain computation via the ProfiniteCohomology owner; do not create a second generic Koszul complex here or inside an arithmetic lifting theorem.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-17.

**GAP-DEEP-PERFECT** (supplier). SmoothRepresentationsOfLocalGroups:SR.0:derived-extension: For a profinite K with cofinal congruence K_M, perfect underlying R-complexes in D⁺_sm(K,R) become isomorphic, after sufficiently deep restriction, to the constant action on the underlying complex. Prove colim_M Hom(B_M,A_M)≅Hom(B,A) using dualizability, derived tensor/invariants adjunction and smoothness. This is the general categorical step of CN Lemma 2.3.17, not a blanket formality statement for all U.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-17.

**GAP-PGL2-VANISHING** (supplier). ArithmeticLocallySymmetricSpaces:ALS.6: AKT Theorem 5.11 / CN Proposition 5.5.3: at non-neat PGL₂ levels with p odd, ζ_p∈F, trivial mod-residue coefficients and absolutely irreducible residual Galois representation, cohomology above the real dimension vanishes and the localized complex is perfect over O or O/ϖ^m; explain finite stabilizer cohomology. The existing lowest-degree-descent node does not imply this. Perfectness requires bounded derived residue reduction and finite cohomology via the AKT Lemma 3.2 minimal-complex criterion; bounded cohomology alone over O/ϖ^m is insufficient. Include perfect O[Δ]-models at the finite abelian p-covers used in Lemma 5.6.4 and their derived augmentation identification with the base complex.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.8/pgl2-cohomology; CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-3; CrystallineLocalGlobalCompatibilityCM:CL.9/prepared-pgl2-level; CrystallineLocalGlobalCompatibilityCM:CL.9/lem-5-6-4; CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-1.

**GAP-PGL2-RANGE** (supplier). ArithmeticLocallySymmetricSpaces:ALS.5: AKT Theorem 5.10 for PGL₂ over a CM field: a Galois-type non-Eisenstein maximal ideal has rational cohomology only in [D,2D], D=[F⁺:Q], and each characteristic-zero Hecke character is realized by a cuspidal regular-algebraic PGL₂ representation. Retain the weight/central-character descent and tame-level fixed-vector hypotheses. This supplies q₀=l₀=D, not the GL₂ range with l₀=2D−1.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-1.

**GAP-DERIVED-INVARIANTS** (supplier). SmoothRepresentationsOfLocalGroups:SR.0:derived-extension: Derived invariants for smooth semidirect products compose: RΓ(K⋉U,−)≅RΓ(K,RΓ(U,−)) with the precise restriction/injectivity and inflation/projection-formula hypotheses, giving the Hecke-equivariant comparison of CN Lemma 4.1.7 and Lemma 4.2.3. Also export the ordinary open-cell quotient vanishing from the contracting, locally nilpotent ũ-action used in Lemma 2.3.6 (Hauseux Lemma 3.3.1 argument), including its higher derived cohomology; it does not follow merely from H⁰-localization. Preserve the compact determinant-unit orientation in Lemma 2.3.8.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-6; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-8; CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-7; CrystallineLocalGlobalCompatibilityCM:CL.6/lem-4-2-3.

**GAP-CENTRAL-HECKE** (supplier). ArithmeticLocallySymmetricSpaces:ALS.3: The adelic center acts on the localized arithmetic cohomology; ray-class congruence and archimedean connectedness compare the central operator at a p-adic uniformizer with a good-place central Hecke operator. With global class-field reciprocity and Chebotarev, the unique generalized eigenvalue is ψ(Art_{F_v}(ϖ_v)), where ψ=ε̄_p^{n(n−1)/2}detρ̄. Respect the good-place q^{n(n−1)/2}T_{w,n} normalization and the fact that v itself may be ramified.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-21.

**GAP-Q-ORDINARY-LINEAR-ALGEBRA** (supplier). PadicFamilies:L0a: For commuting operators on a finite-dimensional p-adic E-vector space, decompose into simultaneous generalized eigenspaces after finite splitting-field extension and descend the sum of the pieces where every rescaled eigenvalue has valuation zero. Prove independence of the splitting field, functoriality and equality with the largest stable subspace whose operator eigenvalues are all units. Fitting over an Artinian and Noetherian module detects nonzero eigenvalues, not valuation-zero eigenvalues over E.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.4/q-ordinary-local-subspace.

**GAP-COMPATIBLE-LOCAL-RECONSTRUCTION** (supplier). IntegralHeckeAndGaloisDeterminants:IHG.1: Extend compatible-local-reconstruction from a finite flat target A to the complete Noetherian local O-algebras/finite torsion quotients A used in Proposition 4.2.13. A is allowed to have ϖ-torsion. Only the auxiliary characteristic-zero lift algebra Ã is finite flat. With disjoint residual local constituent sets, use the same GMA idempotent/corner reconstruction to descend the chosen n-dimensional constituent and compare its characteristic polynomial to the local finite-flat lifts, preserving quotient/base-change compatibility.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-13.

**GAP-AKT-TAYLOR-WILES** (supplier). GlobalGaloisDeformations:R04.5: AKT Appendix A.2–A.6 with no enormous-image assumption: for p odd and ρ̄|G_{F(ζ_p)} absolutely irreducible, with the stated p=5 PSL₂ exception excluded, prove Lemma A.5 finite-image detection of every nonzero dual-Selmer cocycle by a cyclotomic-kernel element with distinct eigenvalues, including the small p=3,5 cases. Apply Chebotarev to choose fixed-size degree-one Taylor–Wiles sets of level N, avoiding fixed bad places and satisfying the A.6 imaginary-quadratic split conditions. Export A.4 relative framed presentation for this exact CM fixed-determinant local datum: with T=S the number of generators is g=q−3[F⁺:Q]−1+|S|, and the selection kills the relevant dual Selmer group.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.9/akt-tw-primes.

**GAP-CUBIC-TETRAHEDRAL** (source). Source E12: no argument replacing CN Lemma 5.6.5 in d_cyc=3 and projective residual image A₄ has been established. The qualified theorem in this packet excludes that case. Supply a new auxiliary-prime or preparation argument to recover the printed unrestricted target; p=3,5 are unaffected.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.9/thm-5-2; CrystallineLocalGlobalCompatibilityCM:CL.9/proof-thm-5-2; CrystallineLocalGlobalCompatibilityCM:CL.9/lem-5-6-5.

**GAP-GENERAL-COEFFICIENT-NONVANISHING** (source). Source E18: verify nonzero H^j(U₀,V_{λ̃}/ϖ^m) in every j≤rank U₀ for general λ̃, or correct the printed assertion. The current carrier exports the vanishing bound and the exact trivial-weight case only.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.5/boundary-coefficient-object.

**GAP-JOURNAL-COLLATION** (source). The read AKT source is arXiv:1910.12986v2 (2 September 2022, title-page 5 September). Cambridge Journal of Mathematics 11 (2023), 1–124, DOI 10.4310/CJM.2023.v11.n1.a1 is bibliographic. Collate the invoked A.5/A.6/A.7/A.14 and 5.10/5.11 against that published text before attributing these exact statements to the journal.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.9/akt-tw-primes; CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-1; CrystallineLocalGlobalCompatibilityCM:CL.9/proof-thm-5-2.

**GAP-PROTOTYPE-CL-0** (prototype). The suggested file indexes these declarations, API items and tests under their proposed names, but omits signatures whose genuine types are absent at the pins. Required carriers: integral dual Weyl lattices, reductive parahoric monoids, continuous p-adic coefficient characters and arithmetic residual Hecke eigensystems. Each omitted entry names its exact node and source. Once these supplier types exist, replace the indexed omissions by that node’s full typed signature, API lemmas and examples; a propositional package with assumed conclusions is not an acceptable substitute. The elaborated block-permutation, positive exponent cone, integral block subgroup and scalar rescaling cores do not supply their missing arithmetic specialization or integral-weight lattice.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-12; CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-15; CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-17; CrystallineLocalGlobalCompatibilityCM:CL.0/lem-2-1-21; CrystallineLocalGlobalCompatibilityCM:CL.0/lowest-weight-scaling-character; CrystallineLocalGlobalCompatibilityCM:CL.0/parahoric-P-v(b,c); CrystallineLocalGlobalCompatibilityCM:CL.0/positive-central-cocharacters; CrystallineLocalGlobalCompatibilityCM:CL.0/positive-parahoric-monoid; CrystallineLocalGlobalCompatibilityCM:CL.0/rescaled-actions; CrystallineLocalGlobalCompatibilityCM:CL.0/weyl-elements.

**GAP-PROTOTYPE-CL-1** (prototype). The suggested file indexes these declarations, API items and tests under their proposed names, but omits signatures whose genuine types are absent at the pins. Required carriers: smooth derived representations of open monoids, derived compact invariants and equivariant completed arithmetic towers. Each omitted entry names its exact node and source. Once these supplier types exist, replace the indexed omissions by that node’s full typed signature, API lemmas and examples; a propositional package with assumed conclusions is not an acceptable substitute.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-finite-level; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-functors; CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-4; CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-5; CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-6; CrystallineLocalGlobalCompatibilityCM:CL.1/p-ordinary-completed; CrystallineLocalGlobalCompatibilityCM:CL.1/prop-2-2-8; CrystallineLocalGlobalCompatibilityCM:CL.1/cor-2-2-9; CrystallineLocalGlobalCompatibilityCM:CL.1/prop-2-2-10; CrystallineLocalGlobalCompatibilityCM:CL.1/parahoric-variant; CrystallineLocalGlobalCompatibilityCM:CL.1/lem-2-2-12; CrystallineLocalGlobalCompatibilityCM:CL.1/unipotent-transfer-action; CrystallineLocalGlobalCompatibilityCM:CL.1/ordinary-monoid-localization.

**GAP-PROTOTYPE-CL-2** (prototype). The suggested file indexes these declarations, API items and tests under their proposed names, but omits signatures whose genuine types are absent at the pins. Required carriers: integral algebraic weight modules, inverse smooth monoids and derived coefficient pairings. Each omitted entry names its exact node and source. Once these supplier types exist, replace the indexed omissions by that node’s full typed signature, API lemmas and examples; a propositional package with assumed conclusions is not an acceptable substitute.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-14; CrystallineLocalGlobalCompatibilityCM:CL.2/prop-2-2-15; CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-16; CrystallineLocalGlobalCompatibilityCM:CL.2/prop-2-2-17; CrystallineLocalGlobalCompatibilityCM:CL.2/dual-p-ordinary; CrystallineLocalGlobalCompatibilityCM:CL.2/lem-2-2-19.

**GAP-PROTOTYPE-CL-3** (prototype). The suggested file indexes these declarations, API items and tests under their proposed names, but omits signatures whose genuine types are absent at the pins. Required carriers: smooth locally constant compact-mod-parabolic induction on Bruhat strata, p-adic unit/norm characters and continuous cochains. Each omitted entry names its exact node and source. Once these supplier types exist, replace the indexed omissions by that node’s full typed signature, API lemmas and examples; a propositional package with assumed conclusions is not an acceptable substitute.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-2; CrystallineLocalGlobalCompatibilityCM:CL.3/induction-filtration-functors; CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-3; CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-4; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-5; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-6; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-7; CrystallineLocalGlobalCompatibilityCM:CL.3/chi-character; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-8; CrystallineLocalGlobalCompatibilityCM:CL.3/prop-2-3-11; CrystallineLocalGlobalCompatibilityCM:CL.3/cor-2-3-12; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-14; CrystallineLocalGlobalCompatibilityCM:CL.3/lem-2-3-17; CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-stratum-induction; CrystallineLocalGlobalCompatibilityCM:CL.3/bruhat-open-cell-induction.

**GAP-PROTOTYPE-CL-4** (prototype). The suggested file indexes these declarations, API items and tests under their proposed names, but omits signatures whose genuine types are absent at the pins. Required carriers: cuspidal unitary automorphic representations with cohomological weights, local Hecke algebra, filtered (φ,N)-modules, Galois and Weil–Deligne representations. Each omitted entry names its exact node and source. Once these supplier types exist, replace the indexed omissions by that node’s full typed signature, API lemmas and examples; a propositional package with assumed conclusions is not an acceptable substitute.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.4/Q-ordinary-hecke; CrystallineLocalGlobalCompatibilityCM:CL.4/iota-Q-ordinary; CrystallineLocalGlobalCompatibilityCM:CL.4/thm-3-1-2; CrystallineLocalGlobalCompatibilityCM:CL.4/lem-3-1-3; CrystallineLocalGlobalCompatibilityCM:CL.4/q-ordinary-local-subspace.

**GAP-PROTOTYPE-CL-5** (prototype). The suggested file indexes these declarations, API items and tests under their proposed names, but omits signatures whose genuine types are absent at the pins. Required carriers: equivariant locally constant derived sheaves on adelic/Borel–Serre towers, unipotent derived coefficients and Hecke-equivariant retracts. Each omitted entry names its exact node and source. Once these supplier types exist, replace the indexed omissions by that node’s full typed signature, API lemmas and examples; a propositional package with assumed conclusions is not an acceptable substitute.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.5/boundary-coefficient-object; CrystallineLocalGlobalCompatibilityCM:CL.5/thm-4-1-3; CrystallineLocalGlobalCompatibilityCM:CL.5/prop-4-1-4; CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-5; CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-6; CrystallineLocalGlobalCompatibilityCM:CL.5/lem-4-1-7; CrystallineLocalGlobalCompatibilityCM:CL.5/prop-4-1-8; CrystallineLocalGlobalCompatibilityCM:CL.5/cor-4-1-9.

**GAP-PROTOTYPE-CL-6** (prototype). The suggested file indexes these declarations, API items and tests under their proposed names, but omits signatures whose genuine types are absent at the pins. Required carriers: actual localized arithmetic cohomology and derived Hecke actions, integral/dual Satake diagrams, local-field congruence level families and completed coefficient fibers. Each omitted entry names its exact node and source. Once these supplier types exist, replace the indexed omissions by that node’s full typed signature, API lemmas and examples; a propositional package with assumed conclusions is not an acceptable substitute.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.6/ord-hecke-algebras-4-2; CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-2; CrystallineLocalGlobalCompatibilityCM:CL.6/lem-4-2-3; CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-4; CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-A; CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-6; CrystallineLocalGlobalCompatibilityCM:CL.6/hecke-images-dual; CrystallineLocalGlobalCompatibilityCM:CL.6/prop-4-2-8; CrystallineLocalGlobalCompatibilityCM:CL.6/torsion-hecke-image; CrystallineLocalGlobalCompatibilityCM:CL.6/unitary-middle-hecke-image; CrystallineLocalGlobalCompatibilityCM:CL.6/deep-levi-level; CrystallineLocalGlobalCompatibilityCM:CL.6/deep-unitary-level.

**GAP-PROTOTYPE-CL-7** (prototype). The suggested file indexes these declarations, API items and tests under their proposed names, but omits signatures whose genuine types are absent at the pins. Required carriers: continuous absolute-Galois representations, crystalline and semistable-ordinary deformation quotient rings and characteristic-zero automorphic Hecke systems. Each omitted entry names its exact node and source. Once these supplier types exist, replace the indexed omissions by that node’s full typed signature, API lemmas and examples; a propositional package with assumed conclusions is not an acceptable substitute.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-9; CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-11; CrystallineLocalGlobalCompatibilityCM:CL.7/prop-4-2-13; CrystallineLocalGlobalCompatibilityCM:CL.7/sub-lemma-1-twist; CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-2-15; CrystallineLocalGlobalCompatibilityCM:CL.7/cor-4-2-16; CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-3-1.

**GAP-PROTOTYPE-CL-8** (prototype). The suggested file indexes these declarations, API items and tests under their proposed names, but omits signatures whose genuine types are absent at the pins. Required carriers: non-neat PGL₂ towers, finite derived Hecke images, enhanced perfect complexes with residual comparison, nilpotent supports and scheme generic-point relations. Each omitted entry names its exact node and source. Once these supplier types exist, replace the indexed omissions by that node’s full typed signature, API lemmas and examples; a propositional package with assumed conclusions is not an acceptable substitute.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-4-2; CrystallineLocalGlobalCompatibilityCM:CL.8/cor-5-4-3; CrystallineLocalGlobalCompatibilityCM:CL.8/pgl2-cohomology; CrystallineLocalGlobalCompatibilityCM:CL.8/lem-5-5-1; CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-2; CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-5-3; CrystallineLocalGlobalCompatibilityCM:CL.8/two-system-patching-data.

**GAP-PROTOTYPE-CL-9** (prototype). The suggested file indexes these declarations, API items and tests under their proposed names, but omits signatures whose genuine types are absent at the pins. Required carriers: global fixed-determinant deformation problems, actual local BT/ordinary/type conditions, Taylor–Wiles covers, Selmer spaces and automorphic base change/descent. Each omitted entry names its exact node and source. Once these supplier types exist, replace the indexed omissions by that node’s full typed signature, API lemmas and examples; a propositional package with assumed conclusions is not an acceptable substitute.

Needed by: CrystallineLocalGlobalCompatibilityCM:CL.9/thm-5-2; CrystallineLocalGlobalCompatibilityCM:CL.9/setup-5-6; CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-1; CrystallineLocalGlobalCompatibilityCM:CL.9/deformation-problems-S-chi; CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-2; CrystallineLocalGlobalCompatibilityCM:CL.9/prop-5-6-3; CrystallineLocalGlobalCompatibilityCM:CL.9/lem-5-6-4; CrystallineLocalGlobalCompatibilityCM:CL.9/lem-5-6-5; CrystallineLocalGlobalCompatibilityCM:CL.9/proof-thm-5-2; CrystallineLocalGlobalCompatibilityCM:CL.9/akt-tw-primes; CrystallineLocalGlobalCompatibilityCM:CL.9/taylor-wiles-deformation-problem; CrystallineLocalGlobalCompatibilityCM:CL.9/prepared-pgl2-level.

## Source finding register

### E1: misprint

Theorem 3.3.3 (1), (3) and (5), p.52, in arXiv:2301.10509v3 (27 March 2025); page image checked

Printed: an O-algebra map ζ : R^□_{ρ̄_v} → B factors through R^{st,λ_v}_{ρ̄_v} if and only ρ^{univ}_v ⊗_{R^{st,λ_v}_{ρ̄_v},ζ} B is semistable with p-adic Hodge type v_{λ_v} (and the same subscript in parts (3) and (5))

Correction: ρ^{univ}_v ⊗_{R^□_{ρ̄_v},ζ} B

Reason: ζ is a map from R^□_{ρ̄_v}, the ring over which ρ^{univ}_v is defined; the tensor product must be taken along ζ over R^□. (Also 'if and only' for 'if and only if'.)

Reach: nothing. Status: Recorded by PAPER-CARAIANI-NEWTON-23 / REV-PAPER-CARAIANI-NEWTON-23; no published correction located in the checked public versions. This packet applies the attributed finding.

Independent review: **confirmed** by REV-DESIGN-CrystallineLocalGlobalCompatibilityCM. In Theorem 3.3.3 on p.52, ζ has source R^□. The universal representation is defined over R^□, so the tensor product must use that source ring before the asserted factorization.

### E2: misprint

§3.3.5, p.52, in arXiv:2301.10509v3 (27 March 2025); page image checked

Printed: R^{△,λ_v,ψ}_{ρ̄_v} = R^{cris,λ_v}_{ρ̄_v} ⊗_{R^□_{ρ̄_v}} R^{□,ψ}_{ρ̄_v}

Correction: R^{△,λ_v,ψ}_{ρ̄_v} = R^{△,λ_v}_{ρ̄_v} ⊗_{R^□_{ρ̄_v}} R^{□,ψ}_{ρ̄_v}

Reason: As printed the two fixed-determinant rings coincide; Lemma 3.3.6 and §5.3.1 use R^{△,λ_v,ψ} as the fixed-determinant quotient of the semistable-ordinary ring.

Reach: nothing. Status: Recorded by PAPER-CARAIANI-NEWTON-23 / REV-PAPER-CARAIANI-NEWTON-23; no published correction located in the checked public versions. This packet applies the attributed finding.

Independent review: **confirmed** by REV-DESIGN-CrystallineLocalGlobalCompatibilityCM. Lemma 3.3.5 on p.52 characterizes ordinary finite-B points; its printed condition (2) uses the crystalline quotient where the ordinary R^△ quotient is required by its condition (1).

### E3: misprint

Lemma 3.1.3, second part, p.44, in arXiv:2301.10509v3 (27 March 2025); page image checked

Printed: for some 1 ≤ j ≤ m − 1 and permutation σ ∈ S_n

Correction: σ ∈ S_m

Reason: r is m-dimensional and σ permutes the m Frobenius slopes v₁,…,v_m.

Reach: nothing. Status: Recorded by PAPER-CARAIANI-NEWTON-23 / REV-PAPER-CARAIANI-NEWTON-23; no published correction located in the checked public versions. This packet applies the attributed finding.

Independent review: **confirmed** by REV-DESIGN-CrystallineLocalGlobalCompatibilityCM. Lemma 3.1.3 on p.44 splits off the first m ordered eigenvalues. Their permutation is S_m; S_n cannot index an m-term slope vector.

### E6: misprint

Lemma 2.2.16, statement, p.31, in arXiv:2301.10509v3 (27 March 2025); page image checked

Printed: K_{λ̃_τ} := ker(V_{λ̃_τ} → V_{λ_τ̃} ⊗ V_{λ−w_{0,n}λ_{τ̃c}})

Correction: V_{λ_τ̃} ⊗ V_{−w_{0,n}λ_{τ̃c}}

Reason: The target of evaluation at the identity is V_{λ_τ̃} ⊗ V_{−w_{0,n}λ_{τ̃c}} (Lemma 2.1.12); the extra λ in the subscript is a slip.

Reach: nothing. Status: Recorded by PAPER-CARAIANI-NEWTON-23 / REV-PAPER-CARAIANI-NEWTON-23; no published correction located in the checked public versions. This packet applies the attributed finding.

Independent review: **confirmed** by REV-DESIGN-CrystallineLocalGlobalCompatibilityCM. Lemma 2.2.16 on p.31 has an extraneous coefficient subscript after scalar extension/reduction. The evaluation-kernel type identifies the intended integral dual Weyl module.

### E7: misprint

Proposition 2.1.14, pp.18–19, in arXiv:2301.10509v3 (27 March 2025); page image checked

Printed: S : H(G̃(F⁺_v), G̃(O_{F⁺_v})) → H(G(F⁺_v), G(O_{F⁺_v})) denote the homomorphism defined at the end of §2.1.1

Correction: defined at the end of §2.1.2

Reason: The unnormalised Satake transform 𝒮 = r_M ∘ r_P is defined on p.15, at the end of §2.1.2, just before §2.1.11; §2.1.1 is about locally symmetric spaces.

Reach: nothing. Status: Recorded by PAPER-CARAIANI-NEWTON-23 / REV-PAPER-CARAIANI-NEWTON-23; no published correction located in the checked public versions. This packet applies the attributed finding.

Independent review: **confirmed** by REV-DESIGN-CrystallineLocalGlobalCompatibilityCM. Proposition 2.1.14 on pp.18–19 refers to the unramified spherical operators defined by (2.1.2), not the preceding weight convention (2.1.1).

### E8: misprint

§2.1.13, p.21, rescaled action for G, in arXiv:2301.10509v3 (27 March 2025); page image checked

Printed: a rescaled action of Δ^{Q_v̄} on V_λ by g ·_λ x = α^{Q_v̄}_λ(x)^{−1} g · x

Correction: g ·_λ x = α^{Q_v̄}_λ(g)^{−1} g · x

Reason: α_λ is a character of the monoid, evaluated at g, as in (2.1.7) for G̃.

Reach: nothing. Status: Recorded by PAPER-CARAIANI-NEWTON-23 / REV-PAPER-CARAIANI-NEWTON-23; no published correction located in the checked public versions. This packet applies the attributed finding.

Independent review: **confirmed** by REV-DESIGN-CrystallineLocalGlobalCompatibilityCM. The displayed action on p.21 evaluates α at x although x is a module vector. The character takes group elements, so the rescaling is α(g)^{-1}ρ(g)x; TeX confirms the printed slip.

### E10: misprint

Proof of Lemma 4.2.5, even case, p.62, in arXiv:2301.10509v3 (27 March 2025); page image checked

Printed: If d is even, then d − q ≤ d/2 ≤ Σ_{v̄∉S̄} n²[F⁺_{v̄″} : Q_p]

Correction: Σ_{v̄∉S̄} n²[F⁺_{v̄} : Q_p]

Reason: The summation index is v̄; v̄″ is a leftover from the notation of Proposition 4.2.6.

Reach: nothing. Status: Recorded by PAPER-CARAIANI-NEWTON-23 / REV-PAPER-CARAIANI-NEWTON-23; no published correction located in the checked public versions. This packet applies the attributed finding.

Independent review: **confirmed** by REV-DESIGN-CrystallineLocalGlobalCompatibilityCM. The even-case sum in Lemma 4.2.5 on p.62 is indexed by v̄∉S̄. Its local degree must use that v̄, replacing the printed leftover v̄″. The rounding argument then yields the required bound, including odd D.

### E11: misprint

(2.1.6), p.18, in arXiv:2301.10509v3 (27 March 2025); page image checked

Printed: P̃_v(X) = X^{2n} − T̃_{v,1}X^{2n−1} + ⋯ + (−1)^j q_v^{j(j−1)/2} T̃_{v,j} + …

Correction: (−1)^j q_v^{j(j−1)/2} T̃_{v,j} X^{2n−j}

Reason: The general term of a polynomial of degree 2n needs the power X^{2n−j}, as in (2.1.5).

Reach: nothing. Status: Recorded by PAPER-CARAIANI-NEWTON-23 / REV-PAPER-CARAIANI-NEWTON-23; no published correction located in the checked public versions. This packet applies the attributed finding.

Independent review: **confirmed** by REV-DESIGN-CrystallineLocalGlobalCompatibilityCM. The unitary Hecke characteristic polynomial on p.18 lacks X^{2n−j}. With that factor it has degree 2n and constant term q^{n(2n−1)}T_{v,2n}; the q exponent remains j(j−1)/2.

### E12: error

Lemma 5.6.5 and its proof, pp.85–86, in arXiv:2301.10509v3 (27 March 2025); page image checked

Printed: Then ρ̄|_{ker(det ρ̄)} is reducible. … Dickson’s classification implies that ρ̄ is reducible or G′ ≅ A₄. In the latter case, set G₁ = ker(det ρ̄). We have ρ̄(G₁)/ρ̄(Z) ≅ Z/2 × Z/2, and it follows that ρ̄|_{ker(det ρ̄)} is reducible.

Correction: The conclusion holds except when d = 3 and the projective image is A₄; then ρ̄|_{ker(det ρ̄)} has projective image Z/2 × Z/2 and is absolutely irreducible. The end of the proof of Theorem 5.2 (p.87), which uses the lemma to find g ∈ ρ̄(G_{F₁}) with det g ≠ 1 and eigenvalue ratio ≠ (det g)^{±1}, needs another argument in that case.

Reason: For p odd, a Klein four subgroup of PGL₂(F̄_p) does not fix a line (it would embed in the cyclic group F̄_p^× of a Borel modulo scalars), so its preimage acts irreducibly. Counterexample for every p ≥ 5: let G = 2T ≅ SL₂(F₃) ⊂ SL₂(F̄_p), χ : G → C₃ → F̄_p^× its cubic character (kernel Q₈), and ρ̄ = incl ⊗ χ. Then det ρ̄ = χ² has order 3. An element g ∉ Q₈ has order 3 or 6, with eigenvalues χ(g)ω, χ(g)ω² or −χ(g)ω, −χ(g)ω² (ω a primitive cube root of 1), so one eigenvalue is ±1, which is equivalent to (5.6.1). But ker det ρ̄ = Q₈ acts irreducibly (i and j anticommute). Checked by hand and by a brute-force computation over F₇. The hypotheses of Theorem 5.2 allow this residual image when p ≡ 1 mod 3 (for instance p = 7 and F ⊇ Q(√−7), so that [F(ζ₇):F] = 3); there no unramified place has H²(F_v, ad⁰ρ̄) = 0. The cases d ≠ 3 ([DDT97, Lemma 4.11]) and hence p = 3, 5, which is all §§6–7 use, are unaffected.

Reach: a stated result. Status: Recorded by PAPER-CARAIANI-NEWTON-23 / REV-PAPER-CARAIANI-NEWTON-23; no published correction located in the checked public versions. This packet applies the attributed finding.

Independent review: **confirmed** by REV-DESIGN-CrystallineLocalGlobalCompatibilityCM. The last Klein-four implication in Lemma 5.6.5, pp.85–86, is false. Independently generated all 24 twisted Q₈⋊C₃ matrices over F₇: determinant order three, all 16 outside-kernel trace identities, and irreducible Q₈ kernel. The author copy retains the same conclusion. The qualified Dickson case proof isolates exactly d=3/projective A₄.

### E13: misprint

Proof of Lemma 3.3.2, p.51, in arXiv:2301.10509v3 (27 March 2025); page image checked

Printed: each F^i_B is weakly admissible and F^i_B/F^{i+1}_B = D_st(χ_{i,B}) for a crystalline character χ_{i,B} : G_{F_v} → E^×

Correction: F^i_B/F^{i−1}_B = D_st(χ_{i,B}) (with F^0_B = 0) for a crystalline character χ_{i,B} : G_{F_v} → B^×

Reason: The filtration is increasing: F^i_B is spanned by the generalized eigenspaces with slope ≤ v_i, so F^i_B ⊂ F^{i+1}_B and the graded pieces are F^i_B/F^{i−1}_B; the weights (λ_{τ,n+1−i} + i − 1) attached to v_i fit this. The characters take values in B^×, since D_st(ρ_B) is a B-module.

Reach: nothing. Status: Recorded by PAPER-CARAIANI-NEWTON-23 / REV-PAPER-CARAIANI-NEWTON-23; no published correction located in the checked public versions. This packet applies the attributed finding.

Independent review: **confirmed** by REV-DESIGN-CrystallineLocalGlobalCompatibilityCM. Lemma 3.3.2 on p.51 uses an ascending filtration; the quotient is F^i/F^{i−1}. An ordinary finite B-valued deformation uses a character into B×, not E×.

### E14: misprint

Proof of Lemma 3.2.2, third claim, p.48, in arXiv:2301.10509v3 (27 March 2025); page image checked

Printed: We apply Prop. 3.2.1 with S = Ã

Correction: We apply Lemma 3.2.1 with S = Ã

Reason: The idempotent-lifting statement over a Henselian base is Lemma 3.2.1 (p.47); there is no Proposition 3.2.1.

Reach: nothing. Status: Recorded by PAPER-CARAIANI-NEWTON-23 / REV-PAPER-CARAIANI-NEWTON-23; no published correction located in the checked public versions. This packet applies the attributed finding.

Independent review: **confirmed** by REV-DESIGN-CrystallineLocalGlobalCompatibilityCM. The proof of Lemma 3.2.2 on p.48 refers to Proposition 3.2.1, but the immediately preceding labelled result is Lemma 3.2.1.

### E15: misprint

§5.6, before Proposition 5.6.2, p.83, in arXiv:2301.10509v3 (27 March 2025); page image checked

Printed: a maximal ideal m ⊂ T^{Q_{S̄_p},S̄_p−ord}_{G}(C•(K,O)) such that ρ̄_m : G_{F,T} → GL_n(Q̄_p) satisfies ρ̄_m ≅ r̄_ι(π)

Correction: ρ̄_m : G_{F,T} → GL₂(k)

Reason: ρ̄_m is the residual representation of a maximal ideal of a PGL₂ Hecke algebra (n = 2), with values in the residue field, as the next paragraph ('the residue field of m is equal to k') uses.

Reach: nothing. Status: Recorded by PAPER-CARAIANI-NEWTON-23 / REV-PAPER-CARAIANI-NEWTON-23; no published correction located in the checked public versions. This packet applies the attributed finding.

Independent review: **confirmed** by REV-DESIGN-CrystallineLocalGlobalCompatibilityCM. The residual representation on p.83 is two-dimensional over the finite residue field k. The printed GL_n(Q̄_p) target conflates n-dimensional unitary/Levi notation and the characteristic-zero realization.

### E16: misprint

End of the proof of Theorem 5.2, choice of V, p.86, in arXiv:2301.10509v3 (27 March 2025); page image checked

Printed: There is a rational prime q ≠ p such that ρ̄ is decomposed generic for q and V contains all q-adic places of K.

Correction: V contains all q-adic places of F

Reason: V is a set of finite places of F, and no field K is in play at this point of the proof.

Reach: nothing. Status: Recorded by PAPER-CARAIANI-NEWTON-23 / REV-PAPER-CARAIANI-NEWTON-23; no published correction located in the checked public versions. This packet applies the attributed finding.

Independent review: **confirmed** by REV-DESIGN-CrystallineLocalGlobalCompatibilityCM. The V set in the preparation argument on p.86 is a set of p-adic places of F, the ambient CM field; K denotes the chosen level, not that field.

### E18: gap

CN arXiv:2301.10509v3, §4.1.1, p.53, paragraph defining V_U

Printed: these are non-zero precisely when j ranges from 0 to n² Σ_{v̄∈S̄}[F⁺_{v̄}:Q_p], by the Künneth formula for group cohomology and by Lemma 2.3.17.

Correction: Export the cohomological-dimension bound for general coefficients and the exact range only for λ̃_S̄=0. An argument for general coefficients is still needed.

Reason: Lemma 2.3.17 computes trivial R_m coefficients, whereas V_U is introduced for arbitrary algebraic λ̃. This citation and Künneth alone do not justify exact nonvanishing for that coefficient action. All degree-shifting coefficient places use λ̃=0, so the main path uses the established case.

Reach: the proof. Status: new observation in this design; no public correction located in the checked version

Independent review: **confirmed** by REV-DESIGN-CrystallineLocalGlobalCompatibilityCM. The assertion in §4.1.1 on p.53 concerns arbitrary algebraic coefficients, but its cited Lemma 2.3.8 computes trivial-coefficient U cohomology. Künneth alone does not provide the missing general-coefficient nonvanishing proof. This confirms a justification gap, not a counterexample; the zero-weight computation suffices for the present degree-shifting path.

### E19: misprint

Proof of Lemma 2.3.17, p.42 in arXiv:2301.10509v3 (27 March 2025)

Printed: H^i(U₀,O/ϖ^m)=∧^i_Z_p U₀

Correction: H^i_cont(U₀,O/ϖ^m)=Hom_cont,Z_p(∧^i_Z_p U₀,O/ϖ^m), with the contragredient Levi action.

Reason: The printed formula has neither the coefficient ring nor the coefficient dual. Already i=0 has left side O/ϖ^m and right side Z_p. For torsion-free abelian U₀ the cochain/Koszul computation gives the displayed continuous dual; the corrected finite modules become trivial after deep restriction.

Reach: nothing. Status: Found independently in this review; no linked correction located in the public pages checked. This is a local notation correction, not a claim of a new theorem.

Independent review: **confirmed** by REV-DESIGN-CrystallineLocalGlobalCompatibilityCM. The printed formula has neither the coefficient ring nor the coefficient dual. Already i=0 has left side O/ϖ^m and right side Z_p. For torsion-free abelian U₀ the cochain/Koszul computation gives the displayed continuous dual; the corrected finite modules become trivial after deep restriction.

### E20: misprint

Proof of Proposition 4.2.6, differential after (4.2.3), p.64 in arXiv:2301.10509v3 (27 March 2025)

Printed: d_r:E_r^{q−r,d−q+1−r}→E_r^{q,d−q}

Correction: d_r:E_r^{q−r,d−q+r−1}→E_r^{q,d−q}

Reason: For a cohomological spectral sequence d_r has bidegree (r,1−r). The incoming bidegree is therefore (q−r,d−q+r−1); the printed exponent is wrong for r≥2. The outgoing term and nilpotent-annihilator strategy are unchanged.

Reach: nothing. Status: Found independently in this review; no linked correction located in the public pages checked. This is a local notation correction, not a claim of a new theorem.

Independent review: **confirmed** by REV-DESIGN-CrystallineLocalGlobalCompatibilityCM. For a cohomological spectral sequence d_r has bidegree (r,1−r). The incoming bidegree is therefore (q−r,d−q+r−1); the printed exponent is wrong for r≥2. The outgoing term and nilpotent-annihilator strategy are unchanged.

## Review and follow-up contract

The independent design review accepts this corrected target-level pass: 97 individually checked nodes, nine confirmed baseline declarations, sixteen confirmed source findings, 27 supplier requests and 40 open gaps. All ten stages are planned and none is closed. The added prepared-level construction does not change the roadmap’s ownership. Review details and reproducible finite-group evidence are in [REV-DESIGN-CrystallineLocalGlobalCompatibilityCM](../reviews/REV-DESIGN-CrystallineLocalGlobalCompatibilityCM.md). Follow-up work resolves the precise stage remaining lists, supplies genuine carrier types, and replaces the indexed omissions by typed Lean signatures. The unrestricted cubic-tetrahedral endpoint and general-coefficient nonvanishing remain recorded gaps.
