# Roadmap: (φ,Γ)-modules, Herr complexes and local Iwasawa cohomology

**Summary.** This roadmap builds the integral, relative and analytic interfaces that turn cyclotomic Frobenius modules into usable cohomology. Starting from period rings and the field-valued realization theorems, it constructs ψ on modules, compares the signed φ- and ψ-Herr complexes, proves integral and affinoid comparison theorems, and identifies local Iwasawa cohomology with a two-term ψ complex. Its second end theorem is the construction, after a proper modification, of a coherent triangulation of a densely strictly trianguline family. Specialized Wach-module coordinates and the de Rham exponential-image criterion connect these constructions to explicit arithmetic applications.

The roadmap is this README. `Suggested.lean` gives representative signatures on existing carriers, light definitions and computed checks; arithmetic period modules, analytic completions and comparison functors specified here remain targets for formalization. Names in this document specify the intended API, including the targets that cannot yet be stated in Lean without first constructing their carriers.

## Scope and ownership

This roadmap owns Frobenius-module algebra needed for descent, finite Witt-vector descent, integral overconvergent lattices, arbitrary-module radius models and cyclotomic equivariant decompletion. It owns module ψ, the explicit signed comparison and its homotopy, integral and affinoid Herr comparison, analytic Γ coefficient rings, relative finiteness and derived base change, the comparison with independently defined Iwasawa cohomology, specialized Wach coordinates, and relative character classification and triangulation.

Several larger theories have other owners. **PadicHodgeTheory** §§4.1 and 4.3 supply the cyclotomic norm field, period rings, Fontaine equivalences for representations and lattices, rational overconvergence and representation-valued radius models. Its §4.4 supplies the Wach module itself, its uniqueness, height, reconstruction, tensor and twist operations and filtered crystalline comparison. Its §4.5 supplies the field-valued Herr/Galois comparison, generator independence, cup products, Euler characteristic, duality and the derived B-pair comparison. Its §§7.5–7.6 supply relative period sheaves, local-system equivalences and the all-module Frobenius/bundle/B-pair comparison. These results are inputs. The extra integral, arbitrary affinoid or cyclotomic equivariant assertions below specify their additional content.

**LocalGaloisDeformationRings** §0.4 supplies the ordinary finite local Artinian coefficient category, its étale representation equivalence, saturated triangulations, Herr/Ext comparison and perfectness. The localized Artinian construction below allows inversion of t and requires an underlying stable lattice; it is different from that ordinary category. **VectorBundlesAndIsocrystals** VB4 owns pure local systems and their sheaf equivalence. The pure comparison below is the global-ring statement with a global pure lattice. **FiniteFlatGroupsAndIntegralPadicHodgeTheory** R07.4 supplies the Cohen-ring torsion equivalence and its coefficient variants; this roadmap adds the cyclotomic Γ compatibility.

The bounded measure algebra, its Iwasawa coordinates and characteristic-ideal theory belong to **PadicMeasuresIwasawaAlgebras**. Locally analytic distributions and the scalar Mellin transform belong to **LocallyAnalyticDistributions**. Here one constructs their relative affinoid coefficient extensions and the Robba-type Γ rings needed for ψ-zero modules. **SelmerIwasawaCohomology** supplies Iwasawa cohomology as a derived inverse limit, without using ψ in its definition. **ArithmeticGaloisDuality** supplies finite/compact continuous derived cochains and duality. Period-ring acyclicity with Banach coefficients, needed to compare those cochains with Herr complexes, is proved here.

The only Bloch–Kato construction made here is the local exponential and its image H¹_e needed for the analytic application. General regulators, Perrin–Riou maps, Coleman maps, Selmer structures and main conjectures belong to their respective roadmaps. No GL₂ representation, involution or sheaf on the projective line is constructed here. The geometric modification below supplies the particular Fitting-ideal flattening required by triangulations; it assumes no unprovided general rigid flattening theorem.

## Conventions

Fix a prime p, a finite extension K/ℚ_p, a separable closure, K_∞ = K(μ_{p^∞}), H_K = Gal(K̄/K_∞), and Γ_K = Gal(K_∞/K). Finite coefficient fields E/ℚ_p and their valuation rings O_E are distinguished from a possibly nonreduced ℚ_p-affinoid algebra A. When embeddings of K are used, E contains their images. Tensor products of analytic coefficient spaces are separated completed projective tensor products; algebraic tensor products are written without a hat. Finite projective modules need not be free or have the same rank on distinct connected components.

Write R_K for the Robba ring and R_{A,K} for its relative version. Superscripts [s,r] and r denote closed annulus and outer-radius models in the radius convention of KPX. Frobenius maps the annulus [s,r] to [s/p,r/p]. In the unramified coordinate π, φ(π) = (1+π)^p−1 and γ(π) = (1+π)^{χ(γ)}−1. For ramified K the coefficient field F′_K of the norm-field construction is not silently identified with K₀. Frobenius on its coefficients is the Witt Frobenius. A φ-module has an invertible linearization, not necessarily a bijective semilinear operator on its underlying module.

All complexes are cohomological. The signed Herr complex is

```text
Cφ,γ(M): M → M ⊕ M → M,
d⁰(x) = ((φ−1)x,(γ−1)x),
d¹(a,b) = (γ−1)a − (φ−1)b,             degrees 0,1,2.
Cψ,γ(M) has φ replaced by ψ.
Cψ(M): M --(ψ−1)--> M,                degrees 1,2.
```

Finite torsion invariants are understood before forming the rational Herr complex. Unless explicitly changed, Δ_K is the **p-primary** torsion subgroup of Γ_K, as in KPX, and γ_K generates Γ_K/Δ_K topologically. Thus Δ_K is trivial for odd p; the procyclic quotient can still have prime-to-p torsion. A convention using all finite torsion is compared explicitly below. At p=2, integral statements use finite-group derived invariants, never division by two.

Local reciprocity sends a uniformizer to geometric Frobenius when it is used to label rank-one characters. The cohomological invariant is normalized by the arithmetic unramified character: χ_ur ∪ κ(p) has invariant +1 over ℚ_p, and reversing the two degree-one classes changes the sign. The Tate basis of R_K(r) satisfies φ(e)=e and γ(e)=χ(γ)^r e; its crystalline basis t^{−r}e has φ-eigenvalue p^{−r}. This distinguishes the character x|x| from the character x of ℚ_p^×. Hodge–Tate weights use the convention in which ℚ_p(1) has weight −1; algebraic character exponents below have the opposite Sen-label convention when appropriate.

## Exact supplier contracts

### From Mathlib and Tau Ceti

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, use `TensorProduct.lift` and `TensorProduct.ext'` in `LinearAlgebra.TensorProduct.Basic`, including their semilinear variants. `ModuleCat.ofHom` wraps actual linear maps, and `CochainComplex.of` and `CochainComplex.ofHom` construct native complexes and maps. `Homotopy` has the equation f=dH+Hd+g; `HomotopyEquiv.toHomologyIso` gives the induced isomorphism. `CategoryTheory.ShortComplex.moduleCatCyclesIso` and `moduleCatHomologyIso` identify cycles and homology with the actual kernel and kernel/image quotient, including their inclusion and quotient maps. For faithfully flat module descent use `comonadicExtendScalars` in `Algebra.Category.ModuleCat.Descent`, with its faithfully-flat hypothesis; the fixed-basis cocycle is transported to that comonad. The restriction to finite projectives needed for the basis-torsor descent is proved in §0.4. Use native modules, tensor products, Witt vectors, submodules, quotients, derived categories and finite projectivity throughout.

Mathlib's `cyclotomicCharacter` and `cyclotomicCharacter.continuous` in `NumberTheory.Cyclotomic.CyclotomicCharacter` already provide the character and continuity on the absolute Galois group; no new character or continuity theorem is required. At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, `TauCeti.ContCohomology.explicitCup11` in `RepresentationTheory.Homological.ContCohomology.Cup.Product` works with continuous topological coefficients and a continuous additive equivariant pairing. `TauCeti.ContCohomology.explicitCor1` in `ContCohomology.Corestriction` supplies the open finite-index degree-one transfer, independent of its transversal. Those are not restricted to discrete coefficients. The additional period acyclicity theorem is needed to identify their values with Herr classes.

The current Tau Ceti library also provides `TauCeti.completedGroupAlgebra`, `completedGroupAlgebra.proj`, `of`, `ext`, `proj_surjective` and `continuous_of` in `Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Basic`, together with product, power-series and character-division modules in that directory. Use that inverse-limit carrier for Λ, including the dyadic finite factor. Its current `TauCeti.fittingIdeal` in `RingTheory.FittingIdeal` supplies presentation-independent minors, arbitrary base change, free-summand shifts and the fiber-rank criterion. These current interfaces are supplier contracts for the README; `Suggested.lean` uses only Mathlib interfaces available at the pinned build.

### From the period and cohomology roadmaps

PadicHodgeTheory §4.1 supplies continuous annulus actions, finite étale norm-field extensions, their trace maps and topologies. §4.3 supplies exact tensor realization, duals, finite coefficient change and field extension. §4.4 supplies N(T), N(V), φ*N, their positive-ring embeddings, and D_cris(V) ≅ N(V)/πN(V) with the filtration defined by φ and q=φ(π)/π. In particular φ on N need only land in the appropriate localization; a positive-height Wach module is not being assumed to have invertible φ-linearization over the positive ring. §4.5 supplies a fixed native field Herr/Galois roof and its cup-compatible invariant. §§7.5–7.6 supply the exact relative period-sheaf functors, Frobenius cohomology roofs constructed by positive Koszul twists and formal patching, and compatibility with tensor, cups, restriction and descent. §5.1 supplies `deRhamDiffEq` and its rank, localization, uniqueness, φ, Γ, connection and twist API: this is N_dR(V)=N_rig(V), localized into the unfiltered de Rham lattice.

PadicDifferentialEquationsAndRigidCohomology §§RD.2.6–RD.2.7 supply pure descent and the field Robba slope filtration for the cyclotomic Frobenius lift and finite coefficient fields. The standard Frobenius, unramified-coefficient specialization is FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.7–R07.4.8; these are existing slope theories. For the field ψ-finiteness induction use KPX’s slope sign, opposite to the valuation-positive convention: tR has slope −1. FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4, including §R07.4.39 `etalePhiModulesWithCoefficients`, supplies finite coefficient algebras and torsion modules over the Cohen ring. VectorBundlesAndIsocrystals VB4 supplies isogeny (c,d)-local systems: d>0 and a semilinear coefficient Frobenius τ with p^cτ^d=1, invariant under replacing (c,d) by a common positive multiple. LocalGaloisDeformationRings §0.4 is the ordinary, unlocalized Artinian supplier described above.

ArithmeticGaloisDuality D7 supplies continuous derived complexes for finite and compact coefficients, continuous Hochschild–Serre for a closed normal subgroup, derived tensor and Tor spectral sequences, and normalized local duality. Its finite/compact scope is retained. SelmerIwasawaCohomology Layer 3 supplies Rlim_n RΓ(K_n,T) with corestriction, its Shapiro comparison, finite-level descent and rationalization after taking the limit.

ClassFieldTheory Layers 7–9 supply the continuous local Artin map, its geometric normalization by inversion and topological Weil reciprocity. LocalFieldsRamification Layer 2 supplies finite unramified extensions and their Frobenius maps. AdicSpaces Layer 6 supplies the underlying adic Fargues–Fontaine curve for coefficient field ℚ_p. The chartwise bundle realization and comparison with the schematic realization needed here are supplied by PadicHodgeTheory §7.5. The character normalization, Wach base-change square and cyclotomic equivariant descent here use those existing constructions.

### From analytic and geometric roadmaps

ColemanPowerSeries Layer 1 supplies the integral zeroth Frobenius coordinate ψ on ℤ_p[[π]], its trace identity pψ=φ^{−1}Tr and trace divisibility before reduction. PadicMeasuresIwasawaAlgebras §2.2 identifies this ψ with the measure operator and ψ-zero with support on units. Its §3a.1 supplies the universal character and the components of weight space for ℤ_p^×, including {±1}×(1+4ℤ₂), through PadicFunctionalAnalysis §§5.1–5.3. For K^× use the compact-unit character space from the distribution supplier and the multiplicative parameter for a uniformizer; no new character-space carrier is defined here. LocallyAnalyticDistributions §3.3 supplies D(G,E) ≅ O(W_G) for compact abelian G with an open ℤ_p^d subgroup, generator change and finite field coefficient extension. Its topological foundation supplies strict completed tensor products and coadmissible inverse systems. Neither scalar Mellin nor finite coefficient change alone supplies arbitrary affinoid coefficients: that extension is a target below.

RigidAnalyticGeometry §§1.1–1.4 supply affinoid algebras, finite modules, completed tensors and rational charts; §§6.1–6.3 and 7.3 supply the admissible site, properness tests, coherent sheaves and their affinoid equivalence. §8.1 supplies relative analytification of schemes locally of finite type over an affinoid base, and §8.4 proper GAGA. Analytic blowups and flattening are not assumed from these contracts. The needed finite-type Rees charts and their analytic gluing are specified in Layer 7.

## How to read the build

Layer 0 isolates finite Frobenius descent, including the corrected Artin–Schreier–Witt and small-group arguments. Layer 1 adds the integral, relative and equivariant realization variants. Layer 2 constructs ψ and its one-variable complex. Layer 3 fixes the signed homotopy and arithmetic descent, including the elementary rank-one field calculations used in the finiteness proof. Layer 4 constructs analytic coefficient rings, the residue pairing and its field finiteness input before proving uniform relative finiteness, perfectness and derived base change. Layer 5 compares the ψ complex with independently defined Iwasawa cohomology, specializes its pairing and verifies the nontrianguline generation criterion. Layer 6 supplies the remaining Wach coordinate interfaces. Layer 7 gives the general character family, rank-one classification and global triangulation. Dependencies always refer to an earlier layer or an exact contract above.

## Layer 0: Frobenius algebra and finite descent

### 0.1 Linearized Frobenius modules

For a commutative ring S and a unital endomorphism σ, define `PhiModule S σ` as an S-module M with an S-linear isomorphism L:S⊗_{S,σ}M ≅ M. Its semilinear map is F(m)=L(1⊗m). Define `PhiModule.Hom` by the square commuting with L, and finite, finite-projective and finite-free full subcategories by the underlying module property. Construct tensor, unit and dual for finite projectives. The API includes `linearization_tmul`, `map_smul`, `hom_ext`, `tensor_phi`, `dual_eval_phi` and change of Frobenius-ring scalars. No inverse to σ is required. Source: KL-I Convention 1.5.1, p.24. *Needs:* native tensor products and finite projectivity.

**Checks.**

- For σ=id on a field, the datum is exactly an invertible linear operator, and the identity module is the tensor unit.
- For S=𝔽_p[U], σ(U)=U^p, the standard module has invertible linearization although F is not surjective on S: U is not in its image.
- A zero semilinear operator on a nonzero module fails the linearization condition; the zero module itself is allowed and is finite projective of rank zero.

### 0.2 Free covers and Frobenius cohomology

For every finitely generated φ-module M, construct `phiFreeCover`: a φ-equivariant surjection P→M with P finite free. If M is finite projective, its kernel N is finite projective and 0→N→P→M→0 splits on underlying S-modules. In KL-I Lemma 1.5.2 and Corollary 1.5.3, p.24, the matrix correction must clear the top-left block as corrected in KL-II Appendix A, p.189; an arbitrary complementary matrix does not define an invertible Frobenius on the cover. The API supplies the projection, exactness, underlying splitting and compatibility of its φ square. A φ-equivariant splitting is not asserted.

Define `phiCohomologyComplex M` as [M --(F−1)→ M] in degrees 0,1, over the fixed scalar ring S^{σ=1}. Prove `phiH0_eq_fixed` and `phiH1_eq_coker`, vanishing outside 0,1, and the Ext interpretation using the skew ring S{F}, with Fa=σ(a)F. The unit module has the length-one skew resolution whose map is right multiplication by F−1 on left modules. It is this orientation that gives the displayed differential. Source: KL-I Definition 1.5.4 and Remarks 1.5.5–1.5.6, pp.24–25. The differential is generally not S-linear. `frobenius_fixedScalar` in the suggested file records the scalar restriction.

**Checks.**

- An already free M admits the identity cover with zero kernel; the zero module admits a rank-zero cover.
- For σ=id and F=id, the complex has H⁰=M and H¹=M, not just the fixed part in degree zero.
- On 𝔽_p[U] with Frobenius, (F−1)(U)=U^p−U, whereas U(F−1)(1)=0; this disproves S-linearity.
- A nonsplit extension of φ-modules must not acquire a φ splitting merely because its underlying projective-module sequence splits.

### 0.3 Idempotents and finite Witt bases

For a perfect 𝔽_p-algebra R, construct `frobeniusFixedIdempotents`: the unique orthogonal idempotents (e_i)_{i∈𝔽_p} summing to one with x=Σ i e_i for every x with x^p=x. This describes the fixed ring on disconnected bases as locally constant 𝔽_p-valued functions, not as the diagonal copy of 𝔽_p. Source: KL-I Lemmas 3.1.3–3.1.4, pp.65–66. API: `fixed_iff_idempotentExpansion`, `idempotent_unique`, restriction to clopens and functoriality in R.

For n,a≥1 and a finite-projective W_n(R)-module with invertible φ^a-linearization, construct the finite étale **basis torsor** of φ^a-fixed bases. Work on constant-rank clopens and impose determinant invertibility on tuples of solutions. Its faithfully finite étale coordinate algebra trivializes the module. Source: KL-I Lemma 3.2.6, pp.73–74, with the projective-basis correction in KL-II Appendix A, p.189. The API `aswBasisTorsor`, `fixedBasis_after_etale`, `basisTorsor_baseChange` and `basisTorsor_truncate` records faithfulness, base change and Witt truncation. Prove `fixedBasis_liftTruncation`: for 1≤m≤n, a selected φ^a-fixed basis modulo p^m lifts to such a basis modulo p^n after a further faithfully finite étale cover, with reduction equal to that selected basis.

**Checks.**

- On a connected nonzero perfect R, x^p=x gives exactly p scalar choices. On R=𝔽_p×𝔽_p it gives p² choices.
- For x=(0,1), its two nonzero idempotents are (1,0) and (0,1); diagonal scalar replacement fails.
- A standard rank-one φ-module is trivialized by its standard fixed basis; the zero vector solves the fixed equation but is excluded from the basis torsor.
- Over 𝔽_p×𝔽_p, a module of ranks one and two is handled by separate clopens, not a single square determinant of an assumed global rank.
- Lifting a chosen fixed basis from W₁ to W₂ must recover that tuple modulo p; existence of an unrelated fixed basis does not test the truncation assertion.

### 0.4 Finite local-system descent and projectivity

For n≥1 and perfect R over 𝔽_p, prove `aswEquivalence`: finite locally free ℤ/p^nℤ sheaves on the étale site of Spec R correspond to finite-projective W_n(R) φ-modules. For a≥1 the φ^a version with constant ℤ_{p^a}/p^n coefficients requires R to be an 𝔽_{p^a}-algebra; use the same fixed-basis descent with that coefficient ring. Without this extra base structure the φ^a-fixed coefficient sheaf need not be constant. Construct the inverse by fixed sections after the basis torsor and faithfully flat descent. Transport its cocycle to the native module-descent comonad. Prove `aswDescent_finiteProjective` for this faithfully finite étale cover: descend the inverse-transpose cocycle on the dual, together with evaluation and coevaluation. Their triangle identities descend by faithful flatness; the finite sum representing coevaluation gives a finite dual basis for the descended module, proving finite projectivity. This restriction, together with tensor and dual compatibility, is part of the equivalence target. When a finite Galois cover trivializes the object, descend the tensor product by the diagonal group action, including its action on the Witt coefficients. Source: KL-I Proposition 3.2.7, p.74, and its KL-II Appendix A correction. API: unit/counit, sections on a trivializing cover, tensor, dual, restriction and truncation.

Prove the projectivity criterion for a finitely presented W_n(R)-module which is flat over ℤ/p^nℤ and has invertible Frobenius linearization. The ideal step uses finite generation and φ(J)=J, not φ(J)⊆J: such an ideal over perfect R is generated by an idempotent. Source: KL-I Lemma 3.2.12 and Proposition 3.2.13, pp.75–76. API: `frobeniusStableIdeal_idempotent`, `wittProjective_of_flat_phi` and locality under finite étale base change.

**Checks.**

- The constant rank-d local system yields W_n(R)^d with coordinate Frobenius; its fixed sections recover the coefficient module. For a>1 over R=𝔽_p the φ^a-fixed coefficient sheaf has a nontrivial arithmetic descent action, so it cannot be replaced by a constant coefficient ring without the stated base extension.
- For R=𝔽_p×𝔽_p and the action swapping components, diagonal invariants recover one copy; taking coefficient invariants without the tensor action loses the intended descent datum.
- The W₂(R)-module W₂(R)/p has a Frobenius map but is not ℤ/p²-flat, so the projectivity criterion does not apply.
- In the perfect closure of 𝔽_p[T], J=(T) has φ(J)⊆J but not equality and is not an idempotent ideal. The weakened ideal criterion is false.

### 0.5 Small lattice groups and Lang descent

Let g⊆M_d(ℚ_p) be a finite-dimensional algebraic Lie subalgebra, g_n=g∩p^nM_d(ℤ_p). For n≥2 (or n≥1 when p is odd), construct the convergent matrix exponential/logarithm comparison between g_n and its BCH group. For m≥1, construct the smooth connected unipotent Greenberg group over 𝔽_p representing the corresponding quotient of Witt-valued small lattices, denoted `smallLatticeGreenberg g n m`. Its central filtration has additive vector-group quotients. Construct `smallGroupLangTorsor` for Frobenius conjugacy b↦a^{−1}bφ(a): solve successively along that filtration, using Artin–Schreier–Witt covers, and pass to the complete lattice with the norm estimates for exp/log. Source: KL-I Proposition 3.2.9 and proof, pp.74–75. API: exp/log inverses, multiplication/BCH compatibility, truncation in m, central quotient compatibility and finite étale Lang solution covers. The real Banach-Lie theory is not a substitute for this p-adic construction.

For perfect R, prove `smallGroupLang_classification`: φ-conjugacy classes in G_{n,m}(R) are naturally in bijection with the pointed set H¹_ét(Spec R,G_{n,m}(𝔽_p)), where the coefficient group is finite and constant. For b, the finite étale sheaf of solutions φ(h)=hb is a left torsor under G_{n,m}(𝔽_p); replacing h by ha changes b to a⁻¹bφ(a). Use inversion to express it as a right torsor if that is the descent convention. The additive central filtration gives H¹_ét(Spec R,G_{n,m})=1 on the affine base; hence extending a constant-group torsor to G_{n,m} trivializes it and produces a representative b. Prove that changing this trivialization changes only its φ-conjugacy class. API: naturality in R and truncation, pointed-class compatibility, and equality of torsor classes exactly for φ-conjugate representatives. This is the classification assertion of KL-I Proposition 3.2.9, not merely existence of a solution cover.

**Checks.**

- A class is trivial exactly when b=h⁻¹φ(h) for some h over R itself; étale local solvability alone does not make its class trivial.
- In the strictly upper triangular 2×2 case X²=0, exp(X)=1+X and BCH is addition; Lang reduces to the additive Witt equation.
- At p=2 the chosen n=2 bound is valid, while exp on all 2M_d(ℤ₂) is not justified by the odd-prime convergence argument.
- For g=0 the group and its Lang torsor are trivial. For nonzero g the torsor parametrizes solutions of the Frobenius equation, rather than declaring every b equal to one before base change.

### Examples

The non-surjective Frobenius on 𝔽_p[U] separates linearization from an inverse operator. The disconnected example separates a fixed scalar from a locally constant fixed section. Together they prevent two tempting simplifications that would invalidate finite descent. Small upper triangular matrices give a direct bridge from an Artin–Schreier equation to the group construction.

### Dependencies

Mathlib tensor and module categories, Witt vectors, and faithfully flat module descent through the stated comonadic contract; the fixed-scalar and free-cover arguments precede the Witt constructions. The only Lie-group construction used later is the explicit small p-adic matrix construction of §0.5.

## Layer 1: integral, relative and equivariant realization

### 1.1 Components and affinoid annuli

Construct `cyclotomicComponents K` by retaining all factors of K⊗_{ℚ_p}ℚ_p(μ_{p^∞}) and their compatible norm-field coefficient rings. The induced Γ_K module on one component is identified with the all-component object using finite induction and its coset action; it is not an identification of a product ring with one factor. Source: KL-I Definitions 9.5.1–9.5.3, pp.200–201. API: component idempotents, restriction and induction adjunction, the Γ permutation formula, and compatibility with finite extension K′/K.

For an arbitrary affinoid A, construct `relativeAnnulus A K s r` and `relativeRobba A K` using completed tensor products of the field annuli with A, restriction and their LF limit. Prove finite projectivity of the annulus extension for a finite field extension K′/K, and the Frobenius basis theorem in the correct direction: the target annulus ring is finite free over the image of the source under φ. For K=ℚ_p the basis is (1+π)^i, 0≤i<p. At a finite extension K′/K, rescale radii by the norm-field ramification index and record both the coefficient rank and the Γ coset index; their product is [K′:K]. Sources: KPX §2.2, especially Definitions 2.2.1–2.2.2, pp.15–16; KL-I §9.5, pp.200–202. API: restriction, φ/Γ action, completed coefficient change, finite-extension trace, coordinate extraction and uniqueness.

**Checks.**

- With A=E, the relative annulus is the coefficient-field annulus, with the same topology and Frobenius basis.
- A split tensor product has its distinct orthogonal component idempotents; projection to one factor followed by induction recovers the Γ action on all factors.
- In the ℚ_p coordinate, ψ will extract the coefficient of 1 from Σ_{i=0}^{p−1}(1+π)^iφ(f_i); reversing the finite-free direction would not supply these coordinates.
- A ramified K must retain F′_K and the radius rescaling; replacing both by K₀ and an unchanged radius does not satisfy the extension trace formula.

### 1.2 Relative categories and finite-radius models

Define `RelativePhiGammaModule A K` as a finite-projective R_{A,K}-module with invertible Frobenius linearization and commuting continuous semilinear Γ action. Specify the topology through finite-projective annulus models, not an arbitrary choice of a basis of the whole module. Morphisms commute with both actions; tensor, dual, determinant and t-localization retain their native module constructions, with induced actions and coefficient-change comparisons. Define `RadiusModel M r` already for a finite-projective φ-module without Γ, and equivalence after common restriction; prove existence of a sufficiently small model, extension uniqueness, and descent of any finite diagram of morphisms after a common shrink. For a continuous (φ,Γ) module the compact Γ action descends to a common sufficiently small model, with the same commuting actions. Finite projective models are not replaced by free models. Source: KPX §§2.2.6–2.2.9, pp.17–19. API: `toRadius`, `baseChangeRadius`, `hom_descends`, `tensorRadius`, `dualRadius`, and the identity/composition comparisons between models.

Construct `relativeDrig V` for a finite-projective A-module V with continuous G_K action, as an exact fully faithful functor with tensor, dual, affinoid coefficient change and field extension comparisons. Prove `relativeDrig_hom`: G_K-equivariant A-linear maps V→W correspond bijectively to (φ,Γ_K)-maps between their realizations. Supply effectivity, not just a family of field-valued objects: on small affinoid charts choose a stable integral model and small action matrices, use the Tate–Sen projections and successive matrix corrections to descend a finite-projective annulus model, and descend the transition maps. Source: KPX Theorem 2.2.17, p.20, and its original input KL-families Theorem 3.11 and Definition 3.12, pp.955–956, with Definition 6.7, p.961. No assertion that every pointwise étale family arises from one global A-representation follows. API: `relativeDrig_exact`, `relativeDrig_hom`, `relativeDrig_baseChange`, `relativeDrig_tensor`, `relativeDrig_dual`, `relativeDrig_field`.

**Checks.**

- The trivial rank-d representation gives the standard relative module; rank zero remains rank zero under all restrictions.
- A morphism initially available at radius r must compose with a second one only after both have been restricted to a common allowed radius.
- For A=E[ε]/ε², a representation with nonzero infinitesimal action must retain ε in its realization; reduction to closed points is not effectivity. Multiplication by ε on the trivial A representation remains a nonzero map after realization, testing faithfulness beyond residual fibers.
- A nonfree finite-projective coefficient module keeps its projective descent datum; a global basis is not part of the category definition.

### 1.3 Integral overconvergent and extended variants

Define `IntegralEtalePhiGammaModule` over A_K and A_K^† and `ExtendedEtalePhiGammaModule` over the corresponding tilde rings by finite projectivity and an invertible integral linearization. On rational extended rings require an integral étale model. Continuity and Γ stability of the model are extra data where used; an arbitrary chosen φ-lattice need not be Γ stable. Construct the tensor, dual and coefficient-change API and the Γ adapter for finite torsion Cohen-ring modules. On finite coefficient modules it agrees with the supplied torsion equivalence, on lattices with reduction mod p^n, and after inverting p with rational realization. Sources: KL-I Theorems 9.5.4 and 9.5.6, pp.201–202; the torsion input specified in the supplier contracts.

For a G_K-stable finite O_E lattice T, construct `integralOverconvergent T` by
D^†(T)=D(T)∩D^†(T[1/p]), equivalently (A^†⊗T)^{H_K}, and prove A_K⊗_{A_K^†}D^†(T) ≅ D(T). Give finite radius models, rationalization and reduction comparisons. The proof uses the bounded normalized traces R_m and their complements: the estimates in CC-1998 §III.2 give a strictly contracting correction on a sufficiently small annulus; §III.4 successively conjugates the Frobenius and small Γ matrices into the overconvergent ring, with errors tending p-adically to zero; §III.5 identifies the resulting lattice with the displayed intersection. Source: CC-1998 Propositions III.2.4, III.2.6–III.2.7 and Corollary III.2.8, pp.17–19, Lemma III.4.4 and Corollary III.4.5, p.22, and Proposition III.5.1 and Corollary III.5.2, p.23. These are integral additions to the rational supplier. API: `integralOverconvergent_baseChange`, `integralOverconvergent_intersection`, `integralOverconvergent_reduce`, `integralOverconvergent_rationalize`.

**Checks.**

- For the trivial O_E lattice, the construction returns the integral coefficient ring and base extension returns A_K⊗O_E.
- Reduction of an integral ψ or Frobenius matrix is performed before any division by p; a formula in a rational period ring does not define the reduction by itself.
- Replacing T by pT changes the embedded lattice by p, although its rational realization is unchanged.
- A φ-stable lattice in a rational module without Γ stability is not an object of the Γ-stable lattice category.

### 1.4 Extended descent and arbitrary-module decompletion

Prove equivalences between the integral overconvergent and completed extended étale categories, and between the rational extended étale categories, with the Γ action retained. Source: KL-I Theorems 9.5.4(c,e), 9.5.6(e–g), pp.201–202. Construct descent by the bounded trace decomposition, full faithfulness through invariance estimates, and essential surjectivity by successive near-identity matrix corrections. API: `extendedEtaleEquivalence`, its unit/counit, tensor/dual, lattice and coefficient compatibility. This does not assert an arbitrary φ-only decompletion equivalence.

For arbitrary, possibly non-étale finite-projective (φ,Γ_K)-modules, construct `cyclotomicDecompletionEquivalence` between the ordinary and extended Robba categories. Use the cyclotomic decompleting tower and its Γ estimates: first descend a small Γ action on a radius model; then use the contracting complement to descend Frobenius and the gluing maps; uniqueness follows by applying the same estimates to Hom. Source: KL-I Theorem 9.5.8, p.202, using §§8.6 and 9.5; FF Theorem 11.5.1, pp.383–384. The small-group step is §0.5. API: extension/decompletion inverse comparisons, exactness, tensor, dual, Γ restriction and finite-extension induction.

**Checks.**

- An étale object agrees with the integral/rational extended equivalences, so forgetting a lattice commutes with the comparison.
- A rank-one nonzero-slope module is included in the arbitrary-module comparison; restricting it to slope zero would miss this target.
- Removing Γ from the input does not supply the decompletion estimate and is outside the arbitrary-module theorem.
- Extension and decompletion of a morphism compose to the original morphism, rather than merely giving isomorphic objects without a unit/counit square.

### 1.5 Global pure modules

For a perfect uniform adic Banach algebra (R,R⁺) over 𝔽_{p^d}, d>0, and c∈ℤ, prove `globalPureEquivalence`: isogeny (c,d)-local systems over Spec R correspond to globally (c,d)-pure φ-modules over W(R)[1/p], the bounded extended Robba ring and the extended Robba ring. Compare also Spec R₀ for a complete subring whose completed direct perfection is R, and the characteristic-zero untilt in KL-I Theorems 8.5.6–8.5.8, pp.171–172. This is the global-ring assertion: a global pure model is part of the hypothesis. The local-system notion itself and its sheaf version are supplied by VB4. Construct the equivalence by an integral lattice up to isogeny and §0.4, then use full faithfulness of the three scalar extensions. API: `globalPure_baseChange`, `globalPure_slopeZero`, `globalPure_changePresentation`, and compatibility with the supplied sheaf functor.

**Checks.**

- For c=0,d=1, a constant ℚ_p-local system gives a globally étale module with its constant integral lattice.
- Replacing (c,d) by (ec,ed), e>0, gives the supplied equivalent local-system category and the same slope c/d.
- A pointwise pure sheaf without a global pure model is not silently placed in the global-ring category; local and global étaleness have different hypotheses.

### 1.6 Cyclotomic equivariant sheaves and operations

Construct `cyclotomicEquivariantPeriodEquivalence`: the ordinary (φ,Γ_K)-module is sent, through extended Robba realization, to the Γ_K-equivariant bundle over the curve of the completed cyclotomic tower, then by completed Galois descent to the G_K-equivariant curve object over C_p and to the corresponding period-sheaf/B-pair object over Spa K. Include all component factors. Sources: KL-I Theorem 8.6.2, p.175, Lemma 8.6.3, Theorem 8.6.4 and Remark 8.6.5, p.176, the curve comparison Theorem 8.7.7, p.178, and Theorem 9.5.8 with Remark 9.5.9, p.202; FF Theorem 11.5.1, pp.383–384. The additional content is equivariance and the descent cocycle, over the supplied nonequivariant equivalences. Prove that the two routes to a B-pair agree by their localization maps, not by choosing an unrelated categorical equivalence.

The API includes rank, tensor, dual, short exact sequence, finite coefficient change, restriction and finite induction comparisons for this functor and the constructions of §§1.2–1.4. A finite extension uses the coefficient trace and coset trace together. *Needs:* the supplied nonequivariant roofs, §1.1 and §1.4.

**Checks.**

- The trivial rank-one object gives the trivial equivariant line and its standard descent cocycle, rather than an arbitrary character twist.
- A Tate twist has the same χ^r action on the curve route and the B-pair route.
- For K′/K, restriction followed by trace on the unit object is multiplication by [K′:K]; ignoring one component index gives a wrong factor.
- A nontrivial equivariance character remains nontrivial after forgetting and then restoring the descent cocycle.

### Examples

The integral intersection for T and pT demonstrates why a lattice cannot be recovered merely by naming the rational object. A rank-one module of nonzero slope demonstrates why arbitrary-module decompletion needs Γ estimates beyond étale descent. A first-order affinoid coefficient example demonstrates why closed-point realization is insufficient.

### Dependencies

Layer 0; period, torsion and pure-local-system contracts; affinoid completed tensors. The equivariant comparison uses the supplied nonequivariant roofs only after the arbitrary-module decompletion is constructed.

## Layer 2: ψ on modules and its one-variable complex

### 2.1 Balanced tensor contraction

Let R→S be a homomorphism of commutative rings and let r:S→ₗ[R]R be a specified linear map. For any R-module M define `psiTensor r : S⊗_R M→ₗ[R]M` by s⊗m↦r(s)m. Balancedness uses both scalar actions, and the construction is `TensorProduct.lift`, not a new tensor carrier. Prove the pure-tensor formula, uniqueness by `TensorProduct.ext'`, functoriality in M and compatibility with scalar change when r changes compatibly. This is the elementary construction used in KPX §2.2, p.18, and in the period trace formula; it is also a separate algebraic target valid without any period ring. These definitions and their milestone statements appear in `Suggested.lean`.

**Checks.**

- For R=S=ℚ and r=id, 2⊗3 maps to 6; a map that forgets the first tensor factor fails.
- For r=0 every tensor maps to zero, including 1⊗m; no normalization r(1)=1 is assumed here.
- For S=ℚ×ℚ with diagonal R action and r the first projection, (0,1)⊗7 maps to zero and (1,0)⊗7 maps to 7.

### 2.2 Module ψ from a linearization

Given an S-module N and an S-linear isomorphism L:S⊗_R M≅N, define `psiOfLinearization r L = psiTensor r ∘ L⁻¹`, as an R-linear map N→M. Its characterization is ψ(L(s⊗m))=r(s)m; this characterization uniquely determines ψ. For a Frobenius linearization write φ_M(m)=L(1⊗m). If r(1)=1, prove ψφ_M=id. For a compatible morphism h, prove hψ=ψh; prove ψ(a·n)=a·ψ(n) for a in the source scalar ring, and ψ(φ(a)n)=aψ(n) in the usual period notation. There is no S-linearity assertion for arbitrary s∈S. Source: KPX §2.2, pp.17–18, and KL-I §9.5, pp.200–202. API: `psiOfLinearization_spec`, `psiOfLinearization_unique`, `psiOfLinearization_leftInverse`, `psiOfLinearization_natural`, `psiOfLinearization_semilinear`.

For a finite index set, fixed b_i∈S and continuous coordinate functions c_i:N→M with x=Σ_iL(b_i⊗c_i(x)), prove ψ(x)=Σ_ir(b_i)c_i(x). Hence ψ is continuous when M is a topological additive group and its fixed R-scalar multiplications are continuous. This is exactly the conditional statement `psiOfLinearization_continuous` in the suggested file; it does not assume any period-ring estimate. In the arithmetic application the finite Frobenius basis and its continuous projections supply these coordinates; §2.5 proves their estimates.

**Checks.**

- Over ℚ with L multiplication by 2 and r=id, ψ(6)=3 and ψφ=id. Taking ψ=id would violate the characterization.
- With r(1)=0, ψφ=0 on a nonzero M, so the normalization is necessary for the left-inverse conclusion.
- Reducing an already constructed integral standard module mod 5 gives ψ(1)=1, even though pψ=Tr reduces to 0=0 and cannot recover ψ.
- The product-ring projection example of §2.1 still distinguishes the scalar action used in L from a diagonal action on its output.

### 2.3 Rank-one formula and basis change

For a commutative period ring with scalar ψ satisfying ψ(φ(b)f)=bψ(f), and a rank-one module φ(e)=ae with a a unit, define `rankOnePsi ψ a` by ψ(fe)=ψ(a⁻¹f)e. Under e′=be for b a unit, the new coefficient is a′=φ(b)ab⁻¹ and f′=b⁻¹f; prove ψ(a′⁻¹f′)=b⁻¹ψ(a⁻¹f). The projection formula is an explicit hypothesis in the algebraic statement. Source: the module construction in KPX §2.2, p.18. API: `rankOnePsi_apply`, `rankOnePsi_leftInverse`, `rankOnePsi_basisChange`, direct sums and scalar extension. The suggested file records the additive map and basis-change theorem.

**Checks.**

- Over ℚ, φ=ψ=id, a=2 gives ψ(6e)=3e; a=−1 gives ψ(7e)=−7e.
- For zero f, the answer is zero for every a; a=0 is excluded because the linearization would not be invertible.
- On ℚ×ℚ with φ=ψ the coordinate swap and a=(2,3), ψ(a⁻¹)=(1/3,1/2). Replacing the answer by a⁻¹ψ(1) gives (1/2,1/3), so a⁻¹ cannot be moved outside ψ.

### 2.4 The ψ-zero projector and fixed spaces

For additive operators φ,ψ on M with ψφ=id, define `psiProjection = 1−φψ`. Prove P²=P, ψP=0 and P|kerψ=id, giving the canonical decomposition M=φ(M)⊕kerψ. Define `psiFixed = ker(ψ−1)` and the common fixed submodule. The map `oneSubPhiOnPsiOne` sends x to (1−φ)x in kerψ for x∈psiFixed; its kernel is the common φ=ψ=1 submodule. Its surjectivity is not an algebraic consequence of ψφ=id. Source: KPX §2.2 and §4.2, pp.18,36–39. API: `psiProjection_idempotent`, `psiProjection_range`, `psiProjection_uniqueSplit`, `oneSubPhiOnPsiOne_kernel`. The suggested signatures retain the actual ambient maps and membership statements.

**Checks.**

- If φψ=id as well, then P=0 and kerψ=0.
- On ℚ[U], let φ(U)=U³ and let ψ select coefficients whose exponent is divisible by 3, dividing their exponent by 3. Then P(U)=U and P(U³)=0.
- In that polynomial example, ψ-fixed elements are constants, so (1−φ)psiFixed=0 while U∈kerψ. This disproves unconditional surjectivity.
- With φ=ψ=id, psiFixed=M and the common fixed kernel is all of M, rather than zero.

### 2.5 Period coordinates, integrality and continuity

Construct `periodPsi` on A_K, A_K^†, B_K, R_K and the relative annuli by the zeroth coordinate of the finite-free Frobenius expansion. On the positive ℚ_p ring it agrees with the supplied Coleman operator. On rational rings prove ψ=p⁻¹φ⁻¹Tr_{R/φ(R)}; on integral rings first construct the coordinate map, prove Tr=pφψ, and only then reduce modulo p^n. Trace divisibility alone in characteristic p does not specify ψ. Sources: CC-1998 §III.2, pp.16–19; KPX §2.2, pp.16–18; the Coleman contract.

Prove continuity in the actual integral weak topology and each admissible annulus topology. In the standard basis extract each coordinate as a trace against a dual basis; the annular trace bounds give constants C_{s,r} with ‖ψ(f)‖_{[s,r]}≤C_{s,r}‖f‖_{[s/p,r/p]} on the compatible source/target models. Obtain the weak integral statements from the finite-free coordinate homeomorphism on the fixed H_K ring, and finite étale field change from the trace square. Do not extend the normalized R_m maps of CC to arbitrary universal tilde rings with the weak topology: CC-1998 Remark III.2.5, p.18, explicitly distinguishes those topologies. API: `periodPsi_coordinates`, `periodPsi_trace`, `periodPsi_integral`, `periodPsi_continuous`, `periodPsi_annulusBound`, `periodPsi_fieldTrace`, `periodPsi_coefficients`.

Apply §2.2 to obtain `periodModulePsi` for finite-projective radius models. Prove independence of a projective presentation and of the radius, continuity, Γ commutation, naturality, integral-lattice compatibility and affinoid base change. Γ-stable étale lattices inherit ψ. A Wach height condition alone is not used to assert ψ stability of an arbitrary positive lattice.

**Checks.**

- In Σ_{i=0}^{p−1}(1+π)^iφ(f_i), ψ returns f₀; in particular ψ(1)=1 and ψ((1+π)^i)=0 for 0<i<p.
- At p=2, the two coordinates remain integral and ψ(1)=1 mod 2; division by 2 in the residue ring is not part of the construction.
- On a rank-one module the period definition gives exactly ψ(a⁻¹f), including nonconstant a.
- For finite K′/K, coefficient trace commutes with ψ after the radius rescaling; omitting the field-change coordinate map breaks this square.

### 2.6 The native ψ complex

Define `psiComplex M` on `CochainComplex (ModuleCat C) ℤ`, over any scalar ring C on which ψ is linear, with M in degrees 1,2 and differential ψ−1, and zero terms elsewhere. Define `psiComplex.map h` for a linear h commuting with ψ, with h in both degrees. Use the native short-complex cycles and homology comparisons to identify
H¹(CψM)=ker(ψ−1), H²(CψM)=coker(ψ−1), and all other H^i=0. The H¹ map sends a cycle to its actual element of M; the H² map is the actual quotient. API: `psiComplex_map_id`, `psiComplex_map_comp`, `psiComplex_h1`, `psiComplex_h2`, naturality of their inclusions and projections. Source: KPX Definition 4.2.2, pp.36–37, with this explicit cohomological degree convention.

**Checks.**

- For ψ=id on a nonzero M, H¹=M and H²=M, while H⁰=0; a degree-0,1 complex has the wrong shift.
- For ψ=0, the differential is −id, so both cohomology groups vanish.
- If h is multiplication by 2 and k by 3, the induced map in each degree and each homology group is multiplication by 6 for k∘h.

### Examples

The coefficient-extraction polynomial example proves both the projector formula and the failure of unconditional generation by ψ-fixed vectors. The mod-p example explains why integral ψ must precede the trace quotient. The identity-operator ψ complex fixes the shift used by every Iwasawa comparison below.

### Dependencies

Layer 1 supplies the actual annuli, Frobenius linearizations and their coordinate topologies. The abstract tensor construction uses only the native library. Coleman and measure ψ are inputs only through the exact supplier contracts.

## Layer 3: signed Herr comparison and arithmetic descent

### 3.1 Native Herr complexes and functoriality

Let M be a C-module and φ,ψ,γ commuting C-linear operators, except that no φψ=ψφ condition is imposed: require ψφ=id and that γ commutes with each. Define `herrComplex φ γ` and `herrComplex ψ γ` by the displayed signed differentials. Frobenius and Γ semilinearity are handled by restricting to their common fixed coefficient ring C. Construct the complexes using `ModuleCat.ofHom` and `CochainComplex.of`; d¹d⁰=0 uses exactly γφ=φγ or γψ=ψγ. For an intertwining h, `herrComplex.map h` has components h,h⊕h,h. API: differential formulas, zero-composition, identity, composition, additive naturality and coefficient restriction. Sources: KPX Definition 2.3.3, p.21; BHS §3.3, pp.342–344, with the degree-two sign adapter below.

**Checks.**

- On ℚ with φ=2 and γ=3, d⁰(7)=(7,14) and d¹(5,11)=−1.
- Replacing the minus sign in d¹ by plus makes d¹d⁰(1)=4 in this example, so commutation alone would not prove it a complex.
- With φ=γ=id, both differentials vanish, giving H⁰=M, H¹=M² and H²=M.
- Intertwiners 2 and 3 compose to 6 in every term; a map only on the diagonal degree-one summand is wrong.

### 3.2 The signed comparison and its kernel

Construct `phiPsiHerrMap F : Cφ,γ(M)→Cψ,γ(M)` with components

```text
F⁰=id,  F¹(a,b)=(−ψa,b),  F²(c)=−ψc.
```

Prove both chain squares from ψ(φ−1)=1−ψ. Each degree map is surjective, with a graded section id, diag(−φ,id), −φ. The graded section is not asserted to be a chain map. Construct the kernel complex: degree zero is zero, degree one is kerψ in the first summand, degree two is kerψ, and its differential is γ−1. Thus it is acyclic exactly when γ−1 is bijective on kerψ. Sources: KPX Proposition 2.3.6, p.22, and the ψ comparison used in §4.2. API: `phiPsiHerrMap_comm`, `phiPsiHerrMap_surjective`, `phiPsiHerrKernelIso`, `phiPsiHerrKernel_acyclic` under the stated inverse hypothesis.

**Checks.**

- With φ=ψ=id, F¹(a,b)=(−a,b) and F²=−id. The comparison is not the identity in degree one.
- In the polynomial example φ(U)=U³, ψ(U³)=U, one has F²(U³)=−U and F²(U)=0.
- If γ=id and kerψ≠0, the kernel differential is zero and the comparison is not a quasi-isomorphism. Surjectivity alone cannot prove the Herr theorem.

### 3.3 Resolvent, corrected section and homotopy

Assume B=(γ−1)|kerψ is an isomorphism. Define `psiZeroResolvent q = inclusion ∘ B⁻¹ ∘ P`, with P=1−φψ. Prove Bq=qB=P as ambient maps, qφ=0 and ψq=0. Define the corrected chain section

```text
S⁰=id,  S¹(a,b)=(−φa−qb,b),  S²(c)=−φc.
```

Prove FS=id. Define H²(c)=(qc,0), H¹=0 and all other components zero. Then id−SF=dH+Hd on Cφ,γ. Package these maps and this equation as native `Homotopy` and `HomotopyEquiv`, obtaining `phiPsiHerrHomotopyEquiv` and its canonical native homology isomorphisms. Source: the kernel proof of KPX Proposition 2.3.6, p.22, expanded to an explicit contracting homotopy. The formula is an algebraic consequence of the inverse on kerψ, not an independent period-theoretic assertion. API: `psiZeroResolvent_identities`, `herrCorrectedSection_comm`, `herrCorrectedSection_rightInverse`, `herrComparison_homotopy`. Representative component identities occur in the suggested file.

**Checks.**

- If ψφ=φψ=id, then P=q=0 and S¹=diag(−φ,id), the elementary inverse of F.
- In the polynomial example take γ=2id, so B=id and q=P. Then S¹(0,U)=(−U,U), S²(U)=−U³, H²(U)=(U,0), while H²(U³)=0.
- For that example the uncorrected section sends (0,U) to (0,U); its chain-square error is P(U)=U. The −q term cancels exactly that error.
- For γ=id on a nonzero kerψ there is no q with Bq=P; this excluded case cannot be hidden in an abstract choice of inverse.

### 3.4 Generator change and finite torsion conventions

For a commuting operator G and integer n≥0, define `herrGeneratorSum G n = Σ_{i=0}^{n−1}G^i`. The chain map from γ to γ^n has components id, diag(id,Q_n), Q_n, since γ^n−1=(γ−1)Q_n. This is a chain map for every n, not an isomorphism for every n. On a principal ℤ_p subgroup, for generators related by u∈ℤ_p^× construct `herrGeneratorEquiv` using the continuous completed-group-algebra unit (γ^u−1)/(γ−1), and prove cocycle and inverse formulas. For the full procyclic Γ_K/Δ_K with prime-to-p torsion of order m, a generator exponent lies in (lim_n ℤ/(mp^n)ℤ)^×, with both its finite and ℤ_p components specified. Define the ratio on the trivial torsion component by the ℤ_p power series and on the other components by the invertible γ−1 operator; descend the component calculation after a splitting coefficient extension. A bare ℤ_p exponent does not specify the finite component. Source: KPX §2.3, pp.20–22; the group-algebra and Mellin supplier contracts. API: finite sum identity, generator composition, intertwiner naturality and homology compatibility with the supplied field comparison.

Also construct `herrGammaAction_homotopy`: the diagonal action of γ^n on the Herr complex is homotopic to the identity, with H¹(a,b)=Q_n b and H²(c)=(Q_n c,0). Direct substitution gives γ^n−1=dH+Hd in all three degrees. Extend this formula to continuous powers on a principal subgroup using the completed geometric-sum operator. The n=0 homotopy is zero and n=1 uses H¹(a,b)=b, H²(c)=(c,0). These homotopies identify lift changes in derived finite-quotient descent; their coherent composition is obtained from the canonical bar-resolution action, not by assuming arbitrary chosen homotopies compose strictly.

Construct `arithmeticHerrComplex` on M^{Δ_K} with the p-primary convention. On rational coefficients averaging over Δ_K is exact, even at p=2. Compare with the all-finite-torsion convention by decomposing prime-to-p torsion characters; nontrivial torsion-character summands have an invertible γ−1 and are contractible. Integrally require the group order to be invertible whenever averaging is used. Source: KPX Definitions 2.3.3–2.3.4, pp.20–21.

**Checks.**

- Q₀=0 and Q₁=id. For G=2id over ℚ, Q₃=7id; these computed values fix the summation bounds.
- For G=id over 𝔽₃, Q₃=0, so γ↦γ³ is not an isomorphism without the generator/unit hypothesis.
- At p=2 the full unit group is {±1}×(1+4ℤ₂); 5 generates the principal factor, not the full group. At odd p a ℤ_p-unit power on the principal factor alone does not specify the exponent modulo p−1 on the finite factor.
- Over ℚ₂, (1+s)/2 is the projector for s²=1. Over ℤ₂ that formula is undefined; §3.7 supplies derived descent instead.

### 3.5 Invertibility on ψ-zero and field character calculations

For a finite-projective relative Robba (φ,Γ_K)-module M over an arbitrary affinoid A, prove that γ_K−1 is invertible on (M^{Δ_K})^{ψ=0}. More precisely, on sufficiently small compatible annuli it has a continuous inverse satisfying annulus bounds, compatible with restriction, coefficient change and finite extension. The proof chooses a small Γ subgroup, controls (γ−1) on finite Frobenius coordinates and obtains an inverse by a convergent geometric series on the complement; finite generation over the analytic Γ annulus gives the full generator statement. Source: KPX Theorem 3.1.1 and its proof, pp.25–28. This is a rational Robba statement, not an integral assertion on every lattice. API: `gammaSubOnePsiZeroEquiv`, its inverse bound, naturality and the resulting arithmetic `phiPsiHerrHomotopyEquiv`.

For use in the later finiteness induction, construct the ℚ_p character line `qpadicCharacterModule δ` for continuous δ:ℚ_p^×→E^× with φ(e)=δ(p)e and γ(e)=δ(χ(γ))e. Prove its tensor/dual laws and the field calculations: H⁰ is one-dimensional exactly for δ=x^k with k≤0; H² is one-dimensional exactly for δ=|x|x^k with k≥1; otherwise each is zero; dim H¹=1+h⁰+h². Source: KPX Proposition 6.2.8 and Theorem 2.3.11, pp.24,58–59. A proof can use the supplied field Herr theorem and the elementary slope/monomial calculation; it does not use relative finiteness. This limited field calculation precedes the relative proof deliberately. Also prove the field-valued rank-one classification over ℚ_p here: after a finite coefficient extension if needed, twist the slope by an unramified character to obtain an étale line, use the field representation equivalence and local class field theory, then undo the twist. Uniqueness descends the character and its rank-one realization to E; the classification is over the original coefficient field. This yields `qpadicRankOneClassification`. For a nonzero equivariant map from a character line into a finite-projective field Robba module, construct `rankOneSaturation`: its saturation is finite projective of rank one and has finite-projective quotient. On a radius annulus use the Bézout elementary-divisor calculation on the coordinate tuple, remove its common factor and propagate this construction across smaller radii by Frobenius; Γ stability follows from uniqueness of saturation. The invertible linearization then restricts to the saturated line and quotient. This supplies the saturated rank-one identification needed in §5.6 without using family classification. Source: the field case in the proof of KPX Lemma 6.2.13, p.61.

**Checks.**

- For δ=1, h⁰=1,h²=0,h¹=2.
- For δ=x|x|, φ(e)=e, γ(e)=χ(γ)e, and h⁰=0,h²=1,h¹=2. For δ=x, φ(e)=pe, so this is a different character line.
- A nonexceptional unramified character with δ(p) outside the exceptional values has h⁰=h²=0 and h¹=1.
- The zero module has a unique inverse on its zero ψ kernel. A general abstract module with γ=id and nonzero kerψ fails the arithmetic inverse theorem's period hypotheses.

### 3.6 Integral and affinoid Galois comparison

Construct `integralHerrComparison T` for a finite p-primary G_K module or a finite O_E lattice, and `affinoidHerrComparison V` for a finite-projective A representation. These are natural roofs from native continuous derived Galois cochains to the arithmetic Herr complexes of the realizations, compatible with the supplied field roof, restriction, transfer and coefficient pairing. For finite coefficients use the Artin–Schreier–Witt exact sequence on the norm-field separable closure and cd_p(H_K)=1, then the Γ resolution. For lattices pass through the mod p^n system: finite-level compactness and the surjective coefficient systems control the derived limit and its possible R¹lim term. For rational Banach coefficients use the Tate–Sen normalized trace decomposition, its strict continuous contracting complement and the small-action matrix descent of §1.2; verify completed tensor exactness before extending from a finite coefficient field to A. Sources: CC-1998 §III.5, pp.23–24; Pottharst Theorem 2.8 and Lemma 2.9, pp.1598–1599; KPX Proposition 2.3.7, p.22.

State `periodResolution_acyclic` through two precise quasi-isomorphisms. If B̃_r denotes the universal extended overconvergent period ring on a compatible Frobenius radius model, prove A ≃ fib[A⊗̂B̃_r --(φ−1)→ A⊗̂B̃_{r/p}] and A⊗̂(B̃_r^{H_K}) ≃ RΓ_cont(H_K,A⊗̂B̃_r), with the prescribed period topologies and the first map the constant augmentation. The field case uses the Frobenius exact sequence and the normalized-trace continuous resolution; extend it to affinoid A through potentially orthonormalizable Banach presentations and strict completed tensor exactness, as in Pottharst Lemma 2.9, p.1598. Identify the cochain comparison and its contraction on the trace-zero summand, convergence and strictness before applying continuous Hochschild–Serre. These are linear continuous-cochain assertions, not nonabelian H¹(H_K,GL_d(B))=1; treating Banach modules as discrete does not prove them. API: comparison after reduction, rationalization, finite flat coefficients, restriction, corestriction and tensor cups.

**Checks.**

- For a finite trivial module, the comparison is the Artin–Schreier–Witt comparison on H_K and the actual Γ resolution, with H⁰ equal to its fixed elements.
- For a lattice T, reduction to T/p^n must commute with the comparison; inverting p before taking the coefficient inverse limit is not the construction.
- For a continuous A representation with nonzero infinitesimal action, the comparison preserves the nilpotent action and its extension class.
- The dyadic integral trivial representation is routed through §3.7; using ordinary invariants under its C₂ quotient fails the finite-coefficient test there.

### 3.7 Dyadic derived descent

For p=2 put K′=K(μ₄), Q=Gal(K′/K), of order one or two. Construct `dyadicHerrDescent T` as the total complex of the finite-group bar resolution acting coherently on the torsion-free-subtower Herr complex. Transport the canonical homotopy-coherent Q action from the norm-field continuous bar resolution through the torsion-free Herr roof. Conjugation and choices of lifts act by the chain maps of §3.4; its explicit homotopies for Γ actions account for lift changes, while the bar resolution supplies their higher cocycle coherences. Compare this totalization with RΓ(Q,RΓ(K′,T)) and hence RΓ(K,T) by compact continuous Hochschild–Serre. The construction may be unbounded before the Galois comparison truncates it. It is not a two-term averaging construction. Prove compatibility with the cofinal K′ cyclotomic tower and corestriction. Sources: the continuous Hochschild–Serre supplier, CC-1999 §II.1–§II.3, pp.11–15, and KPX's torsion convention in §2.3, pp.20–21. API: `dyadicHerrDescent_compare`, `dyadicHerrDescent_restrict`, `dyadicHerrDescent_corestrict`, and rational comparison with the invariant Herr complex.

**Checks.**

- If K already contains μ₄, Q=1 and totalization is the torsion-free-subtower complex.
- For Q=C₂ acting trivially on 𝔽₂, H¹(Q,𝔽₂)=𝔽₂, whereas ordinary invariants placed in degree zero have no such H¹.
- Over ℚ₂ the higher finite-group cohomology vanishes by averaging; rationalization gives the rational invariant convention.
- Corestriction across a degree-two tower step is the norm map; replacing it by an invariants inclusion gives a wrong degree factor.

### 3.8 Cups, residue normalization and field maps

Construct the additional integral/affinoid `herrCup` compatible with the supplied continuous cup. For degree-one cycles x=(x₁,x₂), y=(y₁,y₂), fix
x∪y=x₂⊗γ(y₁)−x₁⊗φ(y₂), with the other degrees obtained from the signed total-complex convention. Prove the Leibniz rule, associativity on cohomology and the Galois comparison square. Source: KPX Definition 2.3.10, p.23, and the pairing conventions surrounding Theorem 2.3.11, pp.24–25.

For K=ℚ_p define `herrResidueGamma` on H²(R_E(1)) by Res(f dπ/(1+π))/logχ(γ). The logarithm is nonzero because γ is a genuine infinite-order generator after the finite factor is removed. Carry the nonzero scalar C_p determined by `herrResidueGamma = C_p · TateInvariant`. KPX Remark 2.3.12, p.24, does not establish the reported numerical value; no such value is assumed here. Prove independence under generator change, and use the same C_p in every specialization below. Define no unsupported single-coordinate residue formula for arbitrary K. API: residue kills boundaries, factors through H², `herrResidueGamma_eq_scalar_tate`, `herrResidueGamma_generator`.

Construct `herrRestriction`, `herrCorestriction` and `herrShapiro` using finite field induction, coefficient trace and coset trace. Prove transitivity, projection formula, comparison with existing continuous transfer, and cor∘res=[K′:K]. Source: KPX Lemma 2.3.5 and Proposition 2.3.7, p.22. These are the integral/affinoid adapters to the supplied field maps.

**Checks.**

- For trivial scalar actions, (1,0)∪(0,1)=−1 and (0,1)∪(1,0)=+1. This fixes the degree-two sign.
- χ_ur∪κ(p) has Tate invariant +1, so its Herr residue is C_p, not an assumed 1.
- If γ is replaced by γ^u, numerator and log denominator acquire the same generator factor on H².
- On a trivial coefficient class, restriction followed by corestriction multiplies it by the full field degree, including both the norm-field and coset indices.

### 3.9 Localized Artinian coefficients and equivariant cohomology

Let A be a finite local E-algebra and let M be finite free over R_{A,K}[1/t], with a stable finite-projective underlying R_K lattice D whose localization is M. Define `localizedArtinianHerr M` as colim_n Cφ,γ(t^{−n}D), independently of D. Construct the localized Ext¹ comparison and coefficient compatibility. Do not infer that an R_A-stable lattice exists from the given underlying lattice. Source: BHS §3.3, Remark 3.3.1 and complex (3.10), p.342, and formulas (3.11)–(3.13), p.343. Lemma 3.3.5, pp.344–345, supplies the localized de Rham realization. BHS uses all finite torsion invariants and the opposite degree-one-to-two sign; first use the rational torsion-convention comparison of §3.4, then multiply degree two by −1. API: `localizedHerr_latticeIndependent`, `localizedHerr_extOne`, `localizedHerr_baseChange` on the specified category.

Construct `cyclotomicEquivariantCohomologyComparison` by applying derived Γ descent to the equivariant functor of §1.6 and the supplied Frobenius period-sheaf roof. Its routes through B-pair cohomology and through arithmetic Herr cohomology agree, including tensor cups, field restriction and trace. Sources: KL-I §9.5, pp.200–202, combined with its §§8.6.2–8.6.5, pp.175–176; the additional assertion is the Γ descent triangle. No second nonequivariant period roof is constructed.

**Checks.**

- Replacing D by t^mD gives the same filtered colimit by a cofinal reindexing.
- A non-étale rank-one object after inverting t is included when its stable underlying lattice is supplied; étale realization alone does not define this category.
- With trivial rank-one coefficients, the period-sheaf route and the Herr route induce the same H⁰ section and the same cup in degree two.
- The degree-two −1 adapter converts the BHS differential into the displayed signed differential; omitting it reverses the preceding cup witness.

### Examples

The φ=2,γ=3 example checks d²=0 and the cup convention. The polynomial example computes the entire correction term of the homotopy. The C₂/𝔽₂ example is the obstruction to every integral averaging shortcut. These tests apply before arithmetic finiteness is used.

### Dependencies

Layers 0–2, native complexes and homotopies, continuous cochains and Hochschild–Serre; the supplied field comparison fixes normalization. The Banach period acyclicity and integral limit argument are new comparison inputs. The field character calculation is independent of Layer 4 and is available for its induction.

## Layer 4: analytic group rings and uniform finiteness

### 4.1 Relative analytic Γ rings

For a compact abelian Γ_K with an open principal ℤ_p subgroup, define `analyticGammaRing A K = R_A^∞(Γ_K)` by A-completed scalar extension of D(Γ_K,ℚ_p), equivalently functions on A×W_{Γ_K}. Construct it as the inverse limit of the closed weight-disc affinoids A⊗̂Λ_n, retaining every finite torsion component. Define `gammaAnnulusRing A K s r`, `gammaOuterRing A K r` and the Robba-type `robbaGammaRing A K` by the analogous Laurent/annulus coordinate rings and their limits. The latter permits boundary annulus coordinates; it is larger than the ring of functions on the entire open weight disc. A generator change is transported by the Mellin coordinate isomorphism, not by relabeling an indeterminate without its convergence domain. Sources: KPX §2.1, pp.7–15, and Theorem 3.1.1, pp.25–28; LAD §3.3 for the scalar transform.

Construct the A-coefficient Mellin comparison on each disc: use the bounded coordinate expansions and the strict completed tensor exactness of the analytic supplier, then prove compatibility of the disc restrictions and take the inverse limit. Prove noetherianity of the Banach stages, flat transition maps, strictness of finite presentations, exactness for coadmissible systems and the vanishing of R¹lim for the relevant dense transition systems. These targets are `relativeMellin`, `gammaStage_flat`, `gammaCoadmissible_exact`, `gammaBanachLimit_acyclic`. Prove the uniform presentation criterion: a compatible coherent system with uniform bounds on generators and relations is the system of a finitely presented global module; if the system is locally free with uniform rank bounds, its global module is finite projective. Source: KPX Lemmas 2.1.4–2.1.8 and Propositions 2.1.13–2.1.15, pp.8–14. Bounds are required uniformly across the exhaustion.

**Checks.**

- For A=E the construction is the scalar distribution/Mellin ring, with its original Fréchet topology.
- At p=2 both sign components are retained; evaluation at the sign character and evaluation at the trivial character differ on [−1].
- On the principal component, [γ]−1 is the disc coordinate. Its inverse is not a function on the whole disc containing the trivial character, although it is defined on an annulus avoiding zero.
- A coherent system whose number of generators grows without bound on the exhaustion does not satisfy the global finite-presentation criterion.

### 4.2 ψ cokernels and the t-torsion step

For M over R_{A,K}, prove `psiCokernel_finite`: M/(ψ−1) is finite over A. Prove `psi_eventuallySurjective`: ψ−1 is surjective on t^{−n}M for all sufficiently large integers n. Reduce to K=ℚ_p by finite induction, choose a projective radius presentation, compare the small- and large-exponent pieces with annular norm estimates, and iterate the contracting part. Source: KPX Proposition 3.3.2 and proof, pp.31–34. The integer n depends on M; n=0 is not asserted.

Construct `tQuotientHerrComplex` for M/tM. Prove that its Herr cohomology is finite over A and vanishes outside degrees 0,1 (KPX Proposition 3.2.4, p.29). Prove ψ−1 surjective on M/tM and construct a resolution 0→P→Q→(M/tM)^{ψ=1}→0 with P,Q finite projective over R_A^∞(Γ) (Proposition 3.2.5, pp.29–31). Use a sufficiently small Γ subgroup whose action is close to the identity and compare with the free analytic action. API: the quotient triangle for tM→M, finite resolutions and coefficient base change.

**Checks.**

- For M=0 the ψ cokernel and all quotient complexes vanish and every n works.
- For M with nonzero ψ cokernel, the eventual statement cannot be applied at n=0 without its threshold.
- Multiplication by t gives the specified map into M, and the triangle has M/tM as its cone, rather than a second copy of M in degree zero.
- Over E[ε]/ε² the quotient and finite presentation retain ε; fiberwise finiteness alone does not prove finiteness over this coefficient algebra.

### 4.3 Residue pairing and uniform finiteness on the weight exhaustion

Before the finiteness argument, construct `psiFiniteCoefficientChange` for a finite affinoid A-algebra B. A strict bounded-above resolution by finite free A-modules (possibly unbounded to the left), the A-flat annulus coefficients and finite-projective radius models give Cψ(M)⊗ᴸ_{R_A^∞(Γ_K)}R_B^∞(Γ_K)≃Cψ(M_B), without assuming the desired finite presentation. This is the preliminary finite-coefficient comparison of KPX Lemma 5.1.4, p.47; arbitrary affinoid base change is proved only in §4.5. Construct `psiCharacterFiberComparison` at a closed weight point (z,η): first use that finite coefficient comparison for κ(z), then resolve character evaluation on Γ by γ−η(γ), keeping its finite torsion idempotent. Its total complex is the twisted ψ-Herr complex, hence the φ-Herr complex by §3.3. This gives the Tor spectral sequence used below. Sources: KPX §4.2, pp.36–39, and Lemma 5.2.2, p.48. No universal cyclotomic-deformation comparison from Layer 5 is assumed here.

For K=ℚ_p and a relative module M, construct the analytic Γ-valued pairing on M^{ψ=1}×(M*)^{ψ=1}, linear in the first variable and ι-linear in the second. Define it from the ψ-zero residue pairing by
`iwasawaPairing(x,y) = psiZeroPairing((φ−1)x,(φ−1)y)`.
Its characterization is, for every analytic Γ scalar r in the allowed annulus model,

```text
Res_Γ(r · iwasawaPairing(x,y) · ω_logχ)
  = periodResiduePairing(r(φ−1)x,(φ−1)y).
```

Here ω_logχ is the logarithmic differential transported by the Mellin coordinate, with the chosen γ and χ normalization, and the second action is inverted. Prove existence and independence of the radius. The ψ-zero pairing is perfect over the stated Robba-type Γ ring; the uniform proof below starts with this pairing and its fiber comparison, before relative perfectness of ψ-fixed modules is known. The field finiteness and double-vanishing case are established next and is an input to the relative proof. Sources: KPX Definition 4.2.8 and Proposition 4.2.9, pp.38–39, with the ψ-zero pairing of §4.2, pp.36–38.

State the specialization square with its constants. The map from ψ-fixed x to degree-one ψ-Herr cohomology is `logχ(γ) · [(0,x)]`; transfer the first variable to φ-Herr by the section of §3.3, while the second variable uses the γ⁻¹ generator adapter. Under these two maps and the residue evaluation, the pairing specializes to the signed Herr cup invariant of §3.8. The arithmetic comparison with the independent Iwasawa tower is made in §5.5. This Herr square, the residue characterization for every r, and the explicit maps specify normalization together; no numerical value of C_p is suppressed. API: `iwasawaPairing_sesquilinear`, `iwasawaPairing_residue`, `iwasawaPairing_specialize`, `iwasawaPairing_fieldTrace`.

For a finite extension E/ℚ_p, prove `fieldPsiPerfect`: Cψ(M) is bounded perfect over R_E^∞(Γ_K), and (φ−1)M^{ψ=1} is finite free of rank [K:ℚ_p]rank(M) on each analytic Γ component. Reduce K to ℚ_p by finite induction. The slope filtration and t-quotient resolution reduce this to pure slopes and then, by induction on the numerator of the slope, to the étale case. For the induction construct a pure rank-d slope −1/d module as an extension of d−1 unit lines by tR; tensoring lowers the numerator, and the long exact ψ sequence after replacing M by t^{−n}M for sufficiently large n gives finite generation and coadmissibility. This auxiliary extension is the one constructed in Liu Lemma 4.2, manuscript p.22, using the nonzero H¹ of the preceding extension and excluding a destabilizing subobject by its map to the unit quotient. Liu labels its slope +1/d in his valuation-positive convention; the same extension has slope −1/d in KPX’s convention, without dualizing it. In the étale case use the bounded ψ-fixed image and its analytic scalar extension: Colmez-GL2 Theorem I.5.2, p.319, and Proposition V.1.18, pp.397–398. The φ-fixed kernel is finite-dimensional by residue duality and `psiCokernel_finite`. The Bézout property of the field analytic Γ components then gives finite projective resolutions. This is KPX Proposition 4.3.6 and Corollary 4.3.7, pp.40–41, and uses neither relative finiteness nor the independent Iwasawa-tower comparison. The underlying field Robba slope filtration and descent of pure modules are the existing PadicDifferentialEquationsAndRigidCohomology §§RD.2.6–RD.2.7, as recorded in the supplier contract; Γ-stability follows from uniqueness. All the field steps precede the relative argument.

Now take A=E with E/ℚ_p finite and K=ℚ_p. Let M* = M^∨(1), and assume **both** M/(ψ−1)=0 and M*/(ψ−1)=0. Prove `psiFixed_generation`: φ−1 is injective on both fixed spaces, the Iwasawa pairing is perfect between finite free R_E^∞(Γ) modules, and for sufficiently small r₀,

```text
((φ−1)M^{ψ=1}) ⊗_{R_E^∞(Γ)} R_E^{r₀}(Γ) ≅ (M^{r₀})^{ψ=0}.
```

The scalar extension to the Robba-type Γ annulus is part of the assertion. Generation over the entire-disc distribution algebra alone is not asserted. Source: KPX Hypothesis 4.3.1, p.39, and Proposition 4.3.8, pp.41–42. Prove injectivity by field Tate duality and character specialization; using the field finiteness just established, perfectness on all character fibers and annular ψ-zero duality give the remaining assertions. API: `psiFixed_generation`, `psiFixed_pairingPerfect`, `oneSubPhi_injective_of_doubleVanishing` and compatibility on smaller r₀.

Prove `relativePsiUniformPresentation`, the finite presentation of Cψ(M) in D⁻_perf(R_A^∞(Γ_K)), before deducing relative Herr finiteness. Use the preliminary finite-coefficient and character-fiber comparisons and the field theorem just proved. The relative proof has three separately verifiable stages. First reduce by induction in K, nilpotent coefficient devissage and t-twists to a reduced coefficient algebra over ℚ_p. Second, under vanishing of both M/(ψ−1) and M*/(ψ−1), construct dual local H¹ bases, lift them, and use their pairing matrix to obtain local generators on the weight annuli. Inverting its determinant and using all closed fibers detects generation; compact affinoid covers supply finitely many choices. The small-radius ψ-zero presentation and its dual give uniform bounds on the number of generators **and relations**, so §4.1 makes the global fixed module finite projective in this case. Third, for the general case use the elementary rank-one field calculation of §3.5 to choose a generic character with nonexceptional value and nonintegral weight, and construct extensions whose connecting maps strictly reduce the finite ψ cokernel. Noetherian induction and positive t-twists complete the devissage. Sources: KPX §§5.1–5.3, pp.47–53, especially Hypothesis 5.2.1, Proposition 5.2.6, Corollary 5.2.8, Proposition 5.2.10, Lemma 5.2.11 and Theorem 5.2.12, pp.48–50, and Lemmas 5.3.4–5.3.6, pp.51–53.

The named intermediate targets are `psiDoubleVanishing_uniformGenerators`, `psiDoubleVanishing_uniformRelations`, `psiDoubleVanishing_projective` and `psiExtension_reduceCokernel`. This proof requires the actual determinant cover and uniform bounds; neither pointwise finite dimensionality nor an abstract appeal to coadmissibility replaces them.

**Checks.**

- The zero module has a presentation with zero generators and relations, compatible with the rank-zero result.
- In the double-vanishing case, a pairing matrix with nonunit determinant only gives generation on its invertibility locus; it cannot be used as a global basis.
- A family of finite fiber modules with unbounded presentation sizes is rejected by the uniform-relation step.
- A nilpotent coefficient ideal is handled by devissage, not by replacing A with A_red and claiming the same modules.
- For the constant analytic function f=1, logχ(γ)·Res_Γ(−f·ω_logχ/(γ⁻¹−1))=1. The pole is taken in the Robba-type ring, not in the entire-disc ring. Omitting the inverse generator or logarithm fails this computed specialization.
- The pairing is zero on a zero argument, is linear in its first variable and sends [γ] in its second variable to [γ⁻¹]. A character η with η²≠1 distinguishes the two actions.
- At a trivial weight fiber, ψ-fixed classes map by logχ(γ)[(0,x)]. Replacing this by [(0,x)] fails the residue comparison.
- Over B=A/I finite, the preliminary derived comparison retains Tor; it does not identify ordinary fixed modules after a nonflat quotient.
- For d=1 the auxiliary extension is tR with φ(t)=pt: its KPX slope is −1 and its valuation-positive slope is +1. Reversing the convention without reversing the induction gives the wrong slope change.

### 4.4 Perfectness, Euler characteristic and duality

For every finite-projective relative M prove `relativeHerrPerfect`: Cφ,γ(M) is perfect over A of amplitude [0,2], with Euler characteristic −[K:ℚ_p]rank(M) on each connected component. Construct the cup-induced quasi-isomorphism
Cφ,γ(M*) ≃ RHom_A(Cφ,γ(M),A)[−2], where M*=M^∨(1). Sources: KPX Theorems 4.4.2 and 4.4.5, pp.42–44, after the uniform theorem. Finite projective resolutions and closed-point detection apply only after the uniform finite-presentation theorem has been proved.

Prove `relativePsiPerfect`: Cψ(M) is perfect over R_A^∞(Γ_K) of amplitude [0,2], H⁰=0, H¹ is finitely presented of generic rank [K:ℚ_p]rank(M), and H² is A-finite and analytic Γ-torsion. Its Euler characteristic is the same negative rank. **Do not shorten the perfect amplitude to [1,2]**: the terms of the native complex occur in those degrees, but H¹ may have torsion. Source: KPX Theorem 4.4.6, pp.44–45. API: perfect representatives, coherent restriction, componentwise Euler formula, Tate-dual naturality, compatibility with the supplied field duality and the same residue scalar C_p.

**Checks.**

- For the trivial rank-one field module over K, h⁰=1,h²=0,h¹=[K:ℚ_p]+1, giving Euler characteristic −[K:ℚ_p].
- For the Tate line h⁰=0,h²=1,h¹=[K:ℚ_p]+1, giving the same Euler characteristic and the prescribed degree-two pairing.
- For rank zero, both perfect complexes and both Euler characteristics are zero.
- A ψ-fixed module with torsion in H¹ is consistent with amplitude [0,2]; the statement does not declare H¹ flat or free over an arbitrary affinoid algebra.

### 4.5 Derived coefficient change

For any affinoid homomorphism A→B, prove the canonical derived comparison maps

```text
Cφ,γ(M) ⊗ᴸ_A B ≃ Cφ,γ(M ⊗̂_A B),
Cψ(M) ⊗ᴸ_{R_A^∞(Γ_K)} R_B^∞(Γ_K) ≃ Cψ(M ⊗̂_A B).
```

Prove compatibility with composition, cups, duality and finite field operations. Identify the induced Tor spectral sequences, with E₂^{−i,j}=Tor_i(H^j,B) and total degree j−i. Ordinary homology base change is a corollary under flatness or the particular vanishing of the relevant Tor terms; it is not the general assertion. Source: KPX Theorem 4.4.3, pp.42–43. API: `herrDerivedBaseChange`, `psiDerivedBaseChange`, `baseChange_trans`, `baseChange_flat`, and the edge maps with the actual cycle/quotient maps.

**Checks.**

- Let A=E⟨X⟩ and C=[A --X→ A] in degrees 0,1. H⁰(C)=0 and H¹(C)=A/(X); at B=A/(X), H⁰(C⊗ᴸB)=B, supplied by Tor₁(H¹(C),B). Ordinary H⁰ base change would give zero.
- For a flat extension A→B the higher Tor terms vanish and the usual cohomology tensor formula follows.
- Identity coefficient change induces the identity comparison; A→B→C gives the same map as A→C.
- The suggested file's ℤ --2→ ℤ and mod-2 kernel example records the same nonflat obstruction on existing carriers.

### Examples

The nonflat two-term complex separates derived base change from a false statement about individual cohomology modules. The trivial and Tate lines fix the Euler sign independently of the ψ description. The uniform determinant cover explains which geometric data are needed between fieldwise duality and a finite global presentation.

### Dependencies

Layers 1–3; the scalar analytic and geometric contracts; uniform coadmissible presentation precedes perfectness and derived base change. There is no use of the later global triangulation theorem in this proof.

## Layer 5: local Iwasawa cohomology and specialization

### 5.1 Integral comparison with the independent tower

Let T be a finite p-primary G_K module or a G_K-stable finite free O_E lattice. Write K_n=K(μ_{p^n}), allowing a cofinal subsequence and repeated initial fields. Construct `integralIwasawaComparison T` between the independently supplied Rlim_n RΓ(K_n,T), whose transition maps are **corestrictions**, and Cψ(D(T)). In particular H¹_Iw(K,T) ≅ D(T)^{ψ=1} and H²_Iw(K,T) ≅ D(T)/(ψ−1), with no additional degree shift. For rational V take a stable lattice, form the inverse limit first and invert p afterwards; prove lattice independence. Sources: CC-1999 Theorem II.1.3, p.12, its proof in §§II.2–II.3, pp.12–15, and Remark II.3.2, p.15, for degree two.

Construct the comparison on the tower. For y∈D(T)^{ψ=1}, (φ−1)y is ψ-zero; the rational finite-level representative has Herr pair ((γ_n−1)⁻¹(φ−1)y,y), with the CC normalization ℓ_{K_n}(γ_n). Integrally define its class by the finite torsion/period exact sequence and pass to lattices; an integral inverse on every ψ-zero lattice is not assumed. The corestriction map from γ_n^p to γ_n has degree maps Q_p, diag(Q_p,id), id, with Q_p=Σ_{i=0}^{p−1}γ_n^i. Prove these squares and the normalization identity, so the second coordinate is compatible with corestriction.

Prove the limit assertions in the proof: the compact ψ-fixed module is recovered from its cyclotomic coinvariants; the ψ cokernel is finitely generated over ℤ_p, so its increasing submodules fixed by the small Γ groups stabilize; on that stabilized submodule the norm transition is multiplication by p, and its inverse limit is zero because a finitely generated ℤ_p module has no nonzero infinitely p-divisible subgroup; degree two recovers the ψ cokernel itself; the norm maps kill the persistent degree-zero inverse limit. Verify the derived-limit terms with compact finite-level systems and the induced Mittag–Leffler arguments, not by declaring every transition surjective. For p=2 use the cofinal K(μ₄) tower and §3.7 to compare with the original tower.

API: `iwasawaCompare_h1`, `iwasawaCompare_h2`, `iwasawaCompare_corestriction`, `iwasawaCompare_latticeIndependent`, and the native derived comparison whose cohomology maps are these prescribed maps.

**Checks.**

- For T=0 the tower and ψ complex vanish, including the derived-limit terms.
- The ψ=id toy complex has H¹=M,H²=M and H⁰=0; placing it in degrees 0,1 would contradict the comparison's indexing.
- For a fixed class in a degree-p trivial-action norm system, corestriction is multiplication by p; it is not the identity transition.
- At p=2, passing to the μ₄ cofinal tower agrees with the original derived descent, retaining the C₂ cohomology before rationalization.

### 5.2 Functoriality and finite characters

Prove `iwasawaCompare_natural` for maps of T, finite flat coefficient changes, finite extensions of K and compatible changes of lattice. On ψ complexes, restriction and corestriction use the period field maps of §3.8; on the tower they use existing continuous cochain maps. Prove transitivity, projection formula and norm identities. Source: CC-1999 §§II.1–II.3, pp.11–15; KPX Corollary 4.4.11, p.46, for analytic compatibility. Construct `iwasawaCharacterSpecialization η` as a derived tensor specialization along the character of Λ(Γ_K), for a finite-order character η and any allowed finite coefficient extension. It identifies the resulting complex with RΓ(K,T(η⁻¹)) in the inverse universal-character convention. At a finite level use the character's kernel and the supplied descent comparison. Torsion components and Tor contributions remain part of the construction.

**Checks.**

- The trivial character specializes to the ordinary local Galois complex, which may have H⁰; this H⁰ can arise as Tor from the ψ complex with no degree-zero term.
- Replacing η by η⁻¹ changes the twist; at a character of order greater than two these are not interchangeable.
- For K′/K the specialization of cor∘res multiplies by [K′:K], as does the independently defined tower map.
- At p=2 the sign character evaluates [−1] to −1; it cannot be represented by specializing only the principal coordinate [5]−1.

### 5.3 The cyclotomic deformation

Let Λ_n=R^{[1/p^n,∞]}(Γ_K) be the closed affinoids exhausting W_{Γ_K}. Construct `cyclotomicDeformationStage M n` as M⊗̂R_{Λ_n,K}e with φ(e)=e and γ(e)=[γ]⁻¹e. Define `cyclotomicDeformation M` as their compatible inverse limit over the quasi-Stein exhaustion, with both its coefficient action and diagonal arithmetic Γ action specified. Its specialization at η is M(η⁻¹). Source: KPX Definition 4.4.7, p.45. API: stage restriction, tensor and coefficient compatibility, specialization, Γ-linearization and the actual quasi-Stein gluing maps.

Prove `cyclotomicDeformationComparison`:
Cψ,γ(Dfm(M)) ≃ Cψ(M), and transport along §3.3 to Cφ,γ(Dfm(M)). First prove the universal Γ resolution has no invariants and coinvariants canonically M, so [Dfm(M)^{Δ_K} --γ−1→ Dfm(M)^{Δ_K}] ≃ M[−1]. Take the mapping fiber of 1−ψ with the fixed signs. This supplies the comparison in degrees 1,2 without a guessed shift. Deduce
Cψ(M*) ≃ RHom_{R_A^∞(Γ_K)}(Cψ(M),R_A^∞(Γ_K))^ι[−2],
where ι([γ])=[γ⁻¹]. Source: KPX Theorem 4.4.8, pp.45–46. API: `cyclotomicDeformation_compare`, `cyclotomicDeformation_duality`, naturality and derived character specialization.

**Checks.**

- At η=1 the stage line has trivial specialized action; at η of order greater than two its γ action is η(γ)⁻¹, not η(γ).
- The universal resolution has invariants zero even though the trivial specialization can have invariants; invariants do not commute with this nonflat specialization.
- The map to coinvariants lands in M in degree one, fixing the [−1] convention.
- The involution sends [γ] to [γ⁻¹] and squares to one; omitting it gives a bilinear rather than the required sesquilinear Iwasawa duality.

### 5.4 Analytic Iwasawa comparison

For a finite-projective affinoid representation V, construct `analyticIwasawaComparison V` by the supplied independent Shapiro complex, the affinoid Galois comparison and §5.3. It identifies analytic extension of the independently defined Iwasawa cohomology with H^i(Cψ(D_rig(V))), compatibly with affinoid derived base change. When an integral Banach unit ball is used, specify it and rationalize after the inverse limit; independence of that norm follows by commensurability and the cohomological comparison. Source: KPX **Corollary** 4.4.11 and its proof, p.46. On complexes analytic scalar extension is derived completed extension; ordinary cohomology tensor formulas use the strict/coadmissible exactness proved in Layer 4 and the hypotheses in that corollary. API: comparison, lattice/norm independence, finite-level evaluation and coefficient naturality.

**Checks.**

- For a finite coefficient field this agrees with the integral comparison followed by analytic extension, not with a separately chosen vector-space isomorphism.
- Replacing a stable lattice by p times that lattice changes the integral embedding but gives the same rational analytic comparison.
- Specialization along a nonflat affinoid map uses the derived comparison of §4.5, including any extra Tor class.

### 5.5 The residue-normalized Iwasawa pairing

For K=ℚ_p, a finite coefficient field E and a finite-dimensional E-representation V, prove `iwasawaPairing_arithmeticSpecialize`: under the integral-first and analytic comparison maps of §§5.1–5.4, the analytic pairing constructed in §4.3 specializes at every finite-order character to the independently defined finite-level Galois Tate cup pairing, with the same residue normalization. The first variable specializes at η and the second at η⁻¹. Identify these specializations with the actual finite-layer integration maps, not just isomorphisms of vector spaces. The logχ(γ) and inverse-generator adapters are the ones already established in §4.3. Converting its Herr invariant into the Galois Tate invariant uses `herrResidueGamma = C_p·TateInvariant`; no numerical value is substituted for C_p. Sources: KPX Proposition 4.2.9, pp.38–39, Theorem 4.4.8, pp.45–46, and Corollary 4.4.11, p.46. The proof composes the Herr specialization square with the Galois comparison and independent Shapiro/integration square, preserving cup products. API: `iwasawaPairing_arithmeticSpecialize`, `iwasawaPairing_integration`, coefficient naturality and the field-trace projection formula.

**Checks.**

- The second-variable identity is ⟨x,[γ]y⟩=[γ⁻¹]⟨x,y⟩; replacing γ⁻¹ by γ fails at a character η with η²≠1.
- The degree-one map contains logχ(γ), which changes with the generator; using [(0,x)] alone violates the residue specialization square.
- On a pair whose Galois cup has invariant +1, the corresponding Herr-residue value is C_p with the prescribed log and generator factors.
- A zero vector pairs to zero, and the trace pairing after finite field extension satisfies the same projection formula as §3.8.

### 5.6 Generation by ψ-fixed vectors

Here A=E is a finite extension of ℚ_p and K=ℚ_p. Apply the field double-vanishing theorem `psiFixed_generation` proved in §4.3. Its two cokernel hypotheses, finite-field coefficients and Robba-type Γ scalar extension are retained. The additional target here is a criterion that verifies those hypotheses in the nontrianguline case.

For a rank-two ℚ_p module whose localization at t has no rank-one subobject, prove both vanishings before applying this theorem. Indeed a nonzero finite-dimensional continuous Γ-representation M/(ψ−1) has, after finite coefficient extension, a character quotient η. Extend η to ℚ_p^× by choosing its unramified value equal to one. The top-degree specialization of Cψ(M) at η gives a nonzero H² of the corresponding character twist of M. Field duality gives a nonzero H⁰ of its Tate dual. Saturate the resulting rank-one submodule over the Robba Bézout ring and apply `qpadicRankOneClassification`; localization gives a forbidden rank-one subobject of M*[1/t]. In rank two such a subobject also gives one in M[1/t], by dualizing the rank-one quotient. The same argument applies with M and M* interchanged. Both vanishings thus follow without any family classification or global triangulation theorem. This is `nontriangulineLocalized_psiCokernel_vanish`, deduced from §§3.5,4.2,4.5, not an extra hypothesis silently inferred from de Rham weights.

**Checks.**

- In the polynomial toy model of §2.4, ψ-fixed constants do not generate U; the arithmetic and double-vanishing hypotheses are indispensable.
- If one ψ cokernel is nonzero, the stated perfect duality conclusion cannot be invoked by checking only the other module.
- The annular ring admits denominators unavailable on the whole weight disc, so the tensor factor cannot be deleted.
- A rank-two trianguline module can have rank-one localized subobjects; the nontrianguline vanishing criterion does not apply to it.

### 5.7 The local exponential and the all-level image condition

For a de Rham E representation V define `blochKatoHe V = ker(H¹(K,V)→H¹(K,B_cris^{φ=1}⊗V))`. Construct `blochKatoExp V : D_dR(V)/Fil⁰→H¹(K,V)` as the connecting map of the supplied fundamental period exact sequence, and prove its image is H¹_e. This minimal local construction is needed here because a finite local condition H¹_f alone does not supply H¹_e. Sources: Berger-intro §II.3.4 and §V.2, p.35, and the original exponential comparison in Berger-exp-2003 §II, pp.11–18. API: naturality, finite-extension restriction/corestriction, the image equality and the period-lattice criterion. No equality H¹_e=H¹_f is imposed in general.

Now specialize to K=ℚ_p and the Dospinescu–Le Bras setting: π is a supercuspidal smooth GL₂(ℚ_p) representation with trivial central character, Π is an absolutely irreducible admissible unitary Banach completion with smooth part π, and V is its absolutely irreducible two-dimensional de Rham representation with weights (0,1) in their convention, hence (−1,0) in the standing Hodge–Tate convention, and determinant χ. For the generation consequence explicitly assume that D_rig(V) is nontrianguline; establishing this from a local Langlands correspondence belongs to its owner. Define `allLevelExponentialImage V` as the ψ-fixed classes whose integrations at every sufficiently deep cyclotomic level belong to H¹_e(K_n,V). Using N_rig(V) from the supplier, with its unfiltered de Rham lattice localization, prove that this condition is exactly membership in (tN_rig(V))^{ψ=1}. Applying 1−φ is injective here. Use the containment tN_rig(V)⊂D_rig(V) in these weights (DLB §6, inclusions following Definition 6.7, p.360) and identify D_rig(V)^{φ=1} with V^{H_{ℚ_p}} by the étale period comparison. Since H_{ℚ_p} is normal, that fixed subspace is a Galois subrepresentation. Absolute irreducibility makes it zero or V; the latter would make V an absolutely irreducible two-dimensional representation of the abelian group Γ_{ℚ_p}, which is impossible. This uses H_{ℚ_p}-invariants, not G_{ℚ_p}-invariants. It identifies its image with (1−φ)(tN_rig(V))^{ψ=1}. Sources: Colmez-GL2 Propositions VI.4.13 and VI.4.15 and Remark VI.4.14, printed pp.435–436, Lemma VI.4.16, p.437, and §VIII.2 with Lemma VIII.2.1 and Theorem VIII.2.2, pp.502–503, for the localization/exponential comparison; DLB Theorem 1.9, p.333, Theorem 8.3, pp.368–369, and §12.1, p.398. The proof compares the localized Iwasawa cocycle with the Bloch–Kato connecting map: the exponential-image condition kills the negative/constant obstruction in the de Rham localization, which is precisely the tN_dif^+ condition at all sufficiently deep levels. The differential-equation localization then recovers tN_rig.

For the generation consequence of §5.6 with M=tN_rig(V), verify both cokernels by its nontrianguline-localized criterion: M[1/t]=D_rig(V)[1/t]; a rank-one subobject would saturate to a triangulation of D_rig(V), excluded by that explicit nontriangulinity assumption. This supplies the annular generation statement with its scalar extension. It does not supply a GL₂ involution, its semilinearity or its radius estimates. API: `allLevelExp_iff_tNrig`, `allLevelExp_oneSubPhi_injective`, `tNrig_psiCokernels_vanish`, and `tNrig_annularGeneration`.

**Checks.**

- For V=0, both the exponential image and all-level condition vanish.
- For V=ℚ_p, D_dR/Fil⁰=0 and H¹_e=0, while H¹_f contains the unramified class; replacing H¹_e by H¹_f changes the condition.
- For V=ℚ_p(1), the exponential image is the unit/logarithmic local condition, not the class of a uniformizer.
- Omitting the factor t would allow a nonzero constant de Rham obstruction; the all-level localization test excludes it.
- A trianguline or arbitrary de Rham rank-two representation is not automatically in the specified supercuspidal setting.
- The Tate basis is φ-fixed and corresponds to a nonzero H_{ℚ_p}-fixed vector of ℚ_p(1), although ℚ_p(1) has no G_{ℚ_p}-fixed vector. Confusing these two groups gives a false injectivity proof; rank-two absolute irreducibility is essential in the stated argument.

### Examples

At the trivial character, a derived specialization of the ψ complex recovers degree-zero invariants through Tor. At a nonquadratic finite character, the inverse twist and the pairing involution can both be checked directly. The trivial representation distinguishes H¹_e from H¹_f, explaining why the analytic image condition needs the exponential rather than just a finite local condition.

### Dependencies

Layers 1–4, independent Iwasawa and Shapiro contracts, the de Rham differential-equation and fundamental period exact-sequence contracts. The all-level application uses the original exponential-image argument and checks both ψ cokernels separately before its annular generation consequence.

## Layer 6: specialized Wach interfaces

### 6.1 Unramified base and coefficient change

Let F/ℚ_p be finite unramified, V crystalline over F with a G_F-stable finite O_E lattice T, and F′/F finite unramified. Construct `wachUnramifiedBaseChange` as the canonical comparison
A_{F′}^+⊗_{A_F^+}N_F(T) ≅ N_{F′}(T|G_{F′}), with the corresponding rational comparison. Prove its embedding into the period realization, Γ and φ compatibility, transitivity, tensor/twist compatibility and compatibility with filtered reduction modulo π. Finite base extension makes the displayed tensor complete; do not replace it by an arbitrary infinite unramified completed union. Source: Berger-Wach-2004 Proposition II.1.1, pp.11–13, and Proposition III.4.2, p.21, using uniqueness of the supplied Wach module. No ramified-base version is asserted. API: `wachUnramifiedBaseChange`, `wachUnramifiedBaseChange_trans`, `wachUnramifiedBaseChange_dcris`, `wachUnramifiedBaseChange_lattice`.

For a finite flat map C→C′ of integral coefficient rings in the supplied Wach category, construct `wachCoefficientBaseChange : C′⊗_C N(T) ≅ N(C′⊗_C T)`; in particular this includes O_E→O_{E′} for a finite coefficient field extension. Check freeness, trivial Γ reduction and the q-height conditions after flat scalar extension, then use uniqueness inside the period realization. After rationalization obtain the corresponding comparison for N(V), D_cris(V) and their filtered identification. Prove compatibility with unramified field extension through the commuting square of the two scalar changes, and with compositions and interval twists. These are consequences of the same Wach uniqueness theorem and the supplied finite coefficient comparison; an arbitrary nonflat map does not preserve the height and kernel conditions by this argument.

**Checks.**

- Extending coefficients and then extending F gives the same embedded Wach lattice and filtered reduction as performing the operations in the opposite order.
- For F′=F the map is the identity, not a choice of a new basis.
- For the trivial lattice the map is the scalar extension of A_F^+⊗O_E and reduces to the usual unramified D_cris scalar extension.
- An unramified tower F″/F′/F gives the same comparison by either route.
- A ramified extension is outside this theorem; uniqueness over the stated unramified positive rings does not prove its analogue.

### 6.2 Good bases and ψ-zero coordinates

Here p is **odd**, K=ℚ_p, and E/ℚ_p is finite. For any crystalline V and stable O_E lattice T, construct `wachGoodBasis_integral_exists`: there is a basis n_i of N(T) such that (1+π)φ(n_i) form a Λ_{O_E}(Γ)-basis of (φ*N(T))^{ψ=0}. The basis can be chosen congruent modulo π to any given basis of N(T); this does not assert that an arbitrary O_E basis of D_cris(V) lifts integrally. Source: LLZ-2010 Theorem 3.5 and proof, manuscript pp.10–12. Normalize the constant Frobenius matrix, lift a near-identity basis through the ψ-zero coordinate map, and use the small Γ operator estimates to prove generation and independence.

For the prescribed rational crystalline-basis version `wachGoodBasis_exists`, assume V is positive with weights −s_d≤⋯≤−s_1≤0. For any E-basis ν_i of D_cris(V), choose an E⊗B^+ basis n_i of N(V) lifting it such that (1+π)φ(n_i) form a Λ_E(Γ)-basis. After scalar extension the same vectors give a distribution-algebra basis of (φ*N_rig(V))^{ψ=0}. Sources: LLZ-2011 Proposition 2.11, Theorem 2.12 and Corollary 2.13, p.1115. Record separately the original twisted formulation in LLZ-2010 Lemma 3.15, manuscript pp.12–13: for positive weights −r_d≤⋯≤−r_1≤0 and m=Σr_i, lifts n_i can be chosen so that (1+π)φ(π^{−m}n_i⊗e_m) form a basis of (φ*N(V(m)))^{ψ=0}. Those vectors belong to the twisted module; they are not identified with coordinates for V. The global hypothesis p odd in both LLZ papers is retained.

Define `wachPsiZeroCoordinates` only from a chosen good basis, and prove inverse, coefficient extension, analytic extension and the matrix basis-change formula. If n′=Bn, the Frobenius vectors change by φ(B), so the coordinate map uses the inverse induced ψ-zero basis matrix. An arbitrary Wach basis is not asserted good; LLZ-2011 Remark 2.14, p.1116, records that stronger claim as conjectural. API: `wachGoodBasis_exists`, `wachGoodBasis_integral_exists`, `wachPsiZeroCoordinates`, `wachCoordinates_basisChange`, `wachCoordinates_analytic`.

**Checks.**

- For the trivial rank-one lattice the standard coordinate vector (1+π)φ(e) is the unit-supported ψ-zero generator.
- A scalar basis change n′=bn with constant b∈O_E^× changes the vector by b and its coordinate by b⁻¹.
- A nonconstant B changes Frobenius vectors by φ(B), not B; omitting φ gives a wrong coordinate matrix.
- At p=2 the odd-prime basis proof is not invoked; full Γ is not procyclic and its chosen generator argument needs a separate theorem.
- For a positive Tate twist, the source's twist normalization changes the lattice and crystalline basis; treating the same tuple as coordinates without that change fails the reduction comparison.

### 6.3 Wach vectors in integral Iwasawa cohomology

Let F/ℚ_p be finite unramified, V crystalline, T a stable finite O_E lattice. Use the weight convention of Berger-exp-2003 Appendix A: if its weights lie in [a,b], then D(V)^{ψ=1}⊆π^{a−1}N(V), and if V has no quotient ℚ_p(a), then D(V)^{ψ=1}⊆π^aN(V). State the lattice form with the same integral embedding. This is Berger-exp-2003 Theorem A.3 and proof, pp.26–27. The proof estimates ψ on pole terms π^{−m}, decreases the pole of a ψ-fixed vector, and identifies a surviving residue obstruction with the forbidden quotient. The no-quotient hypothesis is used precisely at that last step.

In the a=0 case with nonnegative weights in that convention and no trivial quotient, prove `wachIwasawaFixed`:
N(T)^{ψ=1}=D(T)^{ψ=1} ≅ H¹_Iw(F,T),
where ψ on N(T) is the restriction justified by the embedding and the source's integral result. Construct `wachIwasawaOneSubPhi` into (φ*N(T))^{ψ=0}, using N(T)⊆φ*N(T) in this convention and ψ(1−φ)x=0. The last identification is §5.1, not a definition of H¹_Iw. Source: Berger-exp-2003 Theorem A.3, pp.26–27; LLZ-2011 §3A, p.1116, for the ℚ_p coordinate interface. When good-basis coordinates of §6.2 are used, retain p odd and its normalization; the containment theorem itself has its stated unramified scope. API: `wachPsiFixed_containment`, `wachIwasawaFixed`, `wachIwasawaOneSubPhi`, lattice/rational and unramified base-change comparisons.

**Checks.**

- With a=0 and no trivial quotient, the improved containment lands in N(T), rather than merely π⁻¹N(T).
- A trivial quotient is excluded from the improved theorem; the general π^{a−1} bound remains the assertion available without it.
- Scaling T by p scales N(T) and its embedded ψ-fixed vectors by p; the integral equality remembers the lattice.
- On a ψ-fixed vector x, ψ((1−φ)x)=x−x=0. The sign agrees with the image in §5.7, while the generation theorem's φ−1 differs by the unit −1.

### Examples

Constant basis change gives a computed inverse coordinate factor. A nonconstant basis change explains why φ(B) appears. The two pole bounds show where the no-trivial-quotient condition enters the Iwasawa interface, independently of the existence of a Wach module.

### Dependencies

Layers 1,2 and 5; the supplied Wach and crystalline comparisons. Good-basis coordinates have the odd-prime restriction of their original sources; no dyadic extension is inferred from rational averaging.

## Layer 7: characters, weights and global triangulations

### 7.1 Character lines over K

Let A be an affinoid E-algebra with E containing all embeddings Σ=Hom(K,E). For a continuous δ:K^×→A^× construct `characterModule K A δ`, a rank-one R_{A,K} (φ,Γ_K)-module. Locally split δ into its unit-valued factor and an unramified factor. Realize the first through local reciprocity and `relativeDrig`; realize the second by the cyclic Frobenius module D_{f,a}, where f=[K₀:ℚ_p] and a is its uniformizer value, then tensor the two. Prove independence of the chosen uniformizer. Embeddingwise algebraic characters are special cases of this construction. It is not defined by the ℚ_p coordinate formula at every ramified K. Prove tensor, unit, dual and coefficient/field-change laws, compatibility with §3.5 when K=ℚ_p and with rank-one representations when δ corresponds to one. Sources: KPX Construction 6.2.4, Definition 6.2.5, Example 6.2.6 and Notation 6.2.7, pp.56–58; Ding §2.1, p.9. API: `characterModule_mul`, `characterModule_inv`, `characterModule_baseChange`, `characterModule_reciprocity`.

For x_σ:K^×→E^× the embedding character, construct the principal ideals (t_σ) as submodules `embeddingPeriodIdeal σ = R(x_σ)` with their canonical equivariant inclusions. Prove the ideals for distinct σ are comaximal and their product is (t); the generators themselves are chosen only up to units. Set ε=N_{K/ℚ_p}|N_{K/ℚ_p}|, so the Tate line is R(ε). API: `embeddingPeriodIdeal_comaximal`, `embeddingPeriodIdeal_prod`, `characterModule_algebraic`, and the Tate-line comparison. Source: KPX Example 6.2.6, pp.57–58, and Ding §2.1, p.9.

For these individual σ-factor quotients, prove `embeddingPeriodQuotientPerfect`: the Herr complex of M/t_σM is perfect of amplitude [0,2], compatible with derived affinoid coefficient change. Use the t-quotient calculation of §4.2, the relative perfectness and base-change theorems of §§4.4–4.5, and the just-constructed embedding ideals. Source: KPX Corollary 6.3.3, p.66. Do not assign these factors the sharper single-t vanishing of §4.2 without a separate proof.

**Checks.**

- Over ℚ_p, δ=x|x| gives φ(e)=e and γ(e)=χ(γ)e, whereas δ=x gives φ(e)=pe.
- An unramified character with δ(p)=a gives φ(e)=ae and trivial Γ action in the ℚ_p case.
- δ₁δ₂ corresponds to the tensor product and δ⁻¹ to the ordinary dual; the Tate dual includes the extra ε factor.
- With a single embedding, (t_σ)=(t). With two distinct embeddings, their ideals are comaximal and their product, not their sum, is (t).
- δ=1 gives the unit line, while the ideal tR⊂R is a proper nonsaturated submodule in the Robba category before inverting t.

### 7.2 Field cohomology and rank-one submodules

For a finite coefficient field E, prove `characterModule_cohomology`: H⁰(R(δ)) has dimension one exactly if δ=∏_σx_σ^{k_σ} with all k_σ≤0; H² has dimension one exactly if δ=|N|∏_σx_σ^{k_σ} with all k_σ≥1; otherwise the corresponding group vanishes. In all cases dim H¹=[K:ℚ_p]+h⁰+h². Prove that every nonzero (φ,Γ_K)-submodule of R(δ) is ∏_σt_σ^{m_σ}R(δ) for unique m_σ≥0, with the corresponding character shifted by those algebraic exponents. Sources: KPX Proposition 6.2.8 and Corollary 6.2.9, pp.58–59. API: invariant generator, exceptional-character criteria, `rankOneSubmodule_exponents`, uniqueness and saturation criterion.

The field-valued rank-one classification used here precedes family classification: after a finite coefficient extension if needed to realize the required unramified slope, twisting makes a rank-one object étale, the field representation equivalence and class field theory supply its character, and undoing the twist gives R(δ). Uniqueness of the parameter and of the invariant coefficient line descends the presentation to E, as in §3.5 for ℚ_p, where it is used in §5.6. Source: the field case of KPX Lemma 6.2.13, p.61, preceding Theorem 6.2.14; no global family theorem is required for that argument.

**Checks.**

- For δ=1, h⁰=1,h²=0,h¹=[K:ℚ_p]+1; for δ=ε the exceptional H² has dimension one instead.
- If a vector of algebraic exponents has one positive and one negative entry, neither exceptional criterion holds unless it separately satisfies its full sign condition; checking only the sum is wrong.
- The submodule ∏t_σ^{m_σ}R(δ) equals the whole module exactly when every m_σ=0.
- Multiplication by t is injective but its quotient is t-torsion, so tR is not saturated in R; inverting t destroys that distinction.

### 7.3 Weights over Artinian coefficients

For a finite local Artinian E-algebra A and a continuous character δ:K^×→A^×, define `CharacterWeights δ : Σ→A` by the derivative on a sufficiently small unit subgroup:
d logδ = Σ_σ wt_σ(δ) dσ.
Prove existence and uniqueness using the decomposition of K⊗_{ℚ_p}E, additivity under products, negation under inverse and compatibility with coefficient reduction. Define `IsConstantCharacter` by factorization of δ through E^×→A^×. This concerns variation in coefficients, independently of local constancy on K^×. Its API includes closure under product and inverse and preservation by E-algebra coefficient maps; a nonfaithful map may turn a nonconstant character into a constant one. Define `IsAlgebraicCharacter` by δ=∏x_σ^{k_σ} with integers k_σ, `IsSmoothCharacter` by open kernel on units, and `IsLocallyAlgebraicCharacter` as their product. Prove local algebraicity exactly when every wt_σ is the image of an integer in A; equality only after passing to A/𝔪 is insufficient. For the converse, divide by the indicated algebraic character, use the logarithm on a sufficiently small unit subgroup, and note that a zero derivative makes the remaining logarithm zero; the exponential is injective on that small neighborhood, giving an open kernel. This works in the full finite-dimensional E-algebra A, including its nilpotents. Sources: BHS Notation, p.308, for affinoid coefficient-valued weights; KPX Lemma 6.2.12, p.60, for the Sen comparison; Ding §2.1, PDF pp.9–10, for reciprocity and algebraic-character conventions. API: `characterWeight_mul`, `characterWeight_algebraic`, `characterWeight_smooth`, `locallyAlgebraic_iff_integralWeights`, and `characterWeight_sen`. The Sen comparison states explicitly that the Hodge–Tate sign convention assigns the opposite sign to the exponent labeling of the Tate character.

**Checks.**

- δ=x_σ^k has weight k at σ and zero at the other embeddings.
- A finite-order E-valued character pulled back to A is both constant and smooth, with every weight zero even when its finite part is nontrivial. The E-valued character x_σ pulled back to A is constant but is not smooth.
- The infinitesimal character below is nonconstant; reduction modulo ε makes it constant, so constancy is not reflected by arbitrary coefficient reduction.
- For A=E[ε]/ε² and δ(u)=1+ε log(u) on small ℚ_p units, the weight is ε. Its residual character is trivial but it is not locally algebraic.
- The character x|x| has derivative weight +1 over ℚ_p; its associated Tate representation has Hodge–Tate weight −1 in the standing convention.

### 7.4 Classification of rank-one families

For any rigid E-analytic X, including nonreduced X, and a rank-one R_{X,K} module M, prove `rankOneFamilyClassification`: there is a unique continuous δ:K^×→Γ(X,O_X)^× and a line bundle L on X, unique up to isomorphism, with M≅R_{X,K}(δ)⊗L and trivial φ,Γ action on L. The intrinsic L is H⁰(M(δ⁻¹)); evaluation gives the isomorphism. Source: KPX Theorem 6.2.14, pp.61–62, with Definition 6.2.15 and §§6.2.16–6.2.20, pp.62–64. Over a finite local Artinian algebra L is free, but a global trivialization is not canonical.

For a coefficient field E, prove `characterModule_deRham_iff_locallyAlgebraic`: R_{E,K}(δ) is de Rham exactly when δ is locally algebraic. Use the actual de Rham period functor and its full-rank dimension criterion, transported along the supplied B-pair comparison, rather than defining de Rham by integral weights. The labelled field character criterion is supplied by PadicHodgeTheory §§3.3,3.6 (its R06.2 rank-one de Rham/crystalline classification). To apply it to a possibly non-étale Robba line, separate an unramified slope factor: this factor has a trivial de Rham realization, while the remaining unit-valued parameter extends by reciprocity to a Galois character. Locally the algebraic factors have periods t_σ to the corresponding integer powers; after dividing by those factors a de Rham character has finite inertia image, which gives the smooth factor. Sources: Ding §2.1, PDF p.9; BHS Lemma 3.3.6, pp.345–346, for the de Rham realization and its weight operator. The criterion is for field coefficients; the nilpotent-sensitive family statements still require the full weight and graph arguments above. API: the criterion, labelled filtration jumps, coefficient field extension and compatibility with products and duals.

Construct `rankOneParameterGraph` inside X×W_{K^×} as the intersection of the cohomological supports of the two Tate-dual H² modules controlling the parameters of M and M^∨. Derived base change and field duality identify its points with the unique field parameter. Artinian devissage identifies the formal fibers and their tangent directions. Prove the projection is locally an isomorphism and **quasicompact** before concluding it is an isomorphism: on an affinoid X bound the uniformizer value and the logarithmic parameter; use the Sen polynomial and a p^m power on a small unit subgroup to bound the remaining finite-order ambiguity. A bijection on rigid points by itself is insufficient. The graph proof is KPX §§6.2.15–6.2.20, pp.62–64; Example 6.2.21, p.65, is the negative control for removing the quasicompactness step. API: `rankOneParameter_unique`, `rankOneLineBundle`, `rankOneEvaluation_iso`, `rankOneParameter_baseChange`, `rankOneGraph_quasicompact` and gluing.

**Checks.**

- For field coefficients an algebraic character, a ramified finite-order character and any unramified slope character give de Rham lines; crystallinity does not follow for the ramified finite-order example. A small-unit character with nonintegral derivative weight gives a line that is not de Rham.
- R(δ) has parameter δ and coefficient line O_X, with the displayed evaluation map.
- R(δ)⊗L for a nontrivial line bundle L has the same parameter but is not asserted globally free.
- Over E[ε]/ε² the infinitesimal character of §7.3 is recovered, not just its residual parameter.
- A locally isomorphic parameter graph with infinitely many escaping weight components does not satisfy the required quasicompactness proof.

### 7.5 Saturated and strict triangulations

Define `Triangulation M` of a rank-d relative module as a φ,Γ-stable filtration 0=Fil₀⊂Fil₁⊂⋯⊂Fil_d=M by finite-projective submodules with finite-projective quotients and rank-one graded pieces R(δ_i)⊗L_i. Saturation is the condition on the quotient in this category, not just injectivity. At a field point define `StrictTriangulation` by the uniqueness of the successive enlargement with the ordered parameter, equivalently dim H⁰((M/Fil_i)(δ_{i+1}^{−1}))=1 at every step. Define `DenselyStrictlyTrianguline` using global ordered δ_i and a subset Z of closed points which is dense on some admissible affinoid cover. This density is stronger data than an unspecified closure assertion but does not assert density in every affinoid subdomain. Sources: KPX Definitions 6.3.1–6.3.2, pp.65–66. API: filtration restriction and coefficient pullback when saturation is preserved, graded parameters/line bundles, strict uniqueness, and the good-locus specialization maps.

**Checks.**

- A rank-one module has its single-step triangulation and is strict.
- A split rank-two module with repeated parameter can have multiple flags and H⁰ of dimension greater than one; a supplied split flag need not be strict.
- tR⊂R fails the quotient projectivity condition, although it is a φ,Γ-stable injective map.
- The rank-zero filtration is empty. A global dense subset need not remain dense in every affinoid subdomain, so the specified admissible cover is retained.

### 7.6 Fitting blowups and perfect-complex flattening

For a reduced rigid X and a coherent ideal I which is nonzero on every irreducible component, construct `analyticFittingBlowup X I`. On an affinoid Sp A with generators f₀,…,f_n, form the finite-type Rees algebra ⊕_{m≥0}I^m and its projective charts, using the degree-zero parts after homogeneous localization. Equivalently each chart is the subalgebra A[I/f_i] of A[1/f_i], so the f_i-torsion is removed; simply imposing f_iy_j=f_j without that saturation is not the chart. Analytify these finite-type charts over A, including their needed affinoid covers, using the supplied relative analytification, and glue by the localized transition isomorphisms. Prove properness by the projective embedding, birationality off V(I), the invertible transform I·O_Y, and the universal property for morphisms on which I becomes invertible. Ordinary base-change compatibility is asserted for flat morphisms. For a morphism of reduced spaces which sends every component dominantly onto a component of X, define the **dominant transform** of the fiber product as the closure of its inverse image over X∖V(I), discarding ideal-power torsion on the Rees charts. This transform, rather than the full fiber product, is the blowup of the extended ideal: both are the closure of the identical open chart in the localization by f_i. Source: the construction used in KPX Corollary 6.3.6, pp.67–68, with this qualification on its base-change language; the Rees-chart proof and its universal property supply the geometric carrier needed there.

For φ:C→D between locally free coherent sheaves, assume its cokernel has constant generic rank r on X. Blow up Fitt_r(cokerφ). Prove that the pullback map has locally free image. Under a further morphism g:Z→Y, retain this conclusion when the local non-zero-divisor generator of the blown-up Fitting ideal remains a non-zero-divisor on Z. This includes flat g, and morphisms between reduced spaces sending every irreducible component dominantly onto a component: the generator remains nonzero at each generic point. Under this condition the pulled-back maximal-minor columns remain an independent generating set for the image. Arbitrary pullback of the image as an abstract locally free sheaf is always locally free, but need not be the image of the pulled-back map. The algebraic step is KPX Lemma 6.3.5(3), pp.66–67: Fitt_{r−1}=0 and an invertible non-zero-divisor generator of Fitt_r force the image to be free, by the adjugate identity for a maximal nonzero minor. The unrestricted further-pullback assertion in KPX Corollary 6.3.6(1), p.67, requires this qualification, as the dual-number example below shows. The generic-rank criterion and free-summand shift use the native Fitting ideal API; no new Fitting-ideal carrier is defined.

For a bounded-above locally free complex with constant generic ranks of its cohomology and cokernels, construct the descending sequence of these blowups on its differentials. Prove dependence only on the quasi-isomorphism class, ordinary compatibility with flat base change and gluing on affinoids. For componentwise dominant base change use successive dominant transforms, as just defined. Source: KPX Corollary 6.3.6(1–2), pp.67–68, with its dominant-base-change assertion interpreted through those transforms; an unrestricted ordinary fiber-product assertion is false. Every step is a modification of reduced spaces, componentwise dominant over the preceding step; hence the non-zero-divisor condition just established preserves the flat images already obtained. In the bounded [0,2] situation the finite sequence makes H⁰ locally free and H¹,H² of Tor dimension at most one. Include the corresponding M/t_σ complexes from §7.1. API: `analyticFittingBlowup_universal`, `fittingBlowup_flatImage`, `perfectFlattening`, `perfectFlattening_quasiIso`, `perfectFlattening_flatBaseChange` and `perfectFlattening_dominantTransform`.

**Checks.**

- Blowing up the unit ideal is the identity. Blowing up an invertible nonzero ideal is also the identity; an already locally free image needs no modification.
- For A=E⟨X,Y⟩, the chart with f_i=X is the algebra A[Y/X] inside A[1/X]; retaining an extra X-torsion component from a naive equation gives a wrong blowup.
- For the map A --X→ A, the cokernel has generic rank zero and Fitt₀=(X); its invertible-ideal blowup is the identity and its image (X) is locally free, although the cokernel A/(X) is not flat.
- Pulling A --X→ A back along A=E⟨X⟩→B=E[ε]/ε², X↦ε, gives image (ε). This B-module has length one, so cannot be free over the local length-two ring B; being finite, it is not flat. Thus even after the identity blowup of the principal ideal (X), arbitrary further pullback need not have flat image. The same obstruction appears over ℤ→ℤ/4ℤ for multiplication by 2, as recorded in the suggested file.
- A zero divisor generating the relevant Fitting ideal does not meet the adjugate criterion's non-zero-divisor hypothesis.
- For A=E⟨X,Y⟩ and the dominant map to B=E⟨X,T⟩ with Y↦XT, the ideal (X,Y) extends to (X), whose blowup is the identity. The ordinary pullback of the X-chart has equation X(U−T)=0 and an extra component X=0. Its dominant transform has U=T and agrees with the identity blowup. This disproves ordinary compatibility with all dominant nonflat maps.
- Pullback to a closed non-dominant fiber can change generic rank; it need not even satisfy the componentwise dominant-transform hypothesis.

### 7.7 A global rank-one quotient

Let X be reduced and M a rank-d relative module, δ a global continuous parameter. Suppose a subset Z dense on an admissible affinoid cover consists of points z where H⁰(M_z^∨(δ_z)) is one-dimensional and every basis vector induces a saturated inclusion R(δ_z^{-1})→M_z^∨. Construct `globalRankOneQuotient`: a proper birational f:X′→X of reduced spaces, a coefficient line L and a canonical map, up to its scalar automorphisms,
λ:f*M→R_{X′,K}(δ)⊗L.
Its kernel is finite projective of rank d−1. Its cokernel is locally killed by a power of t and supported on a closed bad locus disjoint from f⁻¹Z; on the complement λ is a surjection and its dual spans the required H⁰. For a smooth rigid curve X one can take X′=X. Source: KPX Theorem 6.3.9, pp.68–70.

The construction first normalizes and treats connected normal components, so generic ranks are constant. Apply §7.6 to M^∨(δ) and its t_σ quotients: H⁰ becomes a line bundle, H¹,H² have Tor dimension at most one, and the fiber H⁰ injection has cokernel Tor₁(H¹,κ(z)). Its Fitting support, together with the vanishing loci of maps to H⁰ modulo t_σ, gives the closed bad locus. Dualize evaluation to obtain λ. The field rank-one submodule classification bounds the cokernel by a power of t locally on an annulus; Frobenius propagates a uniform local bound through the radii. Finally flatten its presentation so the kernel is projective of rank d−1. This last modification is necessary; a pointwise rank count alone does not construct a subbundle. API: `globalRankOneQuotient_kernel`, `globalRankOneQuotient_badLocus`, `globalRankOneQuotient_tPower`, `globalRankOneQuotient_curve` and compatibility of the canonical construction with dominant flat pullback (KPX Remark 6.3.11, p.72).

**Checks.**

- For an everywhere strict rank-one object, λ is its identity character-line presentation, with zero kernel and no bad locus.
- At a bad point, a t-power cokernel is allowed; calling λ a surjection on every fiber would strengthen the theorem falsely.
- For a smooth curve, the Fitting ideals involved are invertible on the relevant rank loci and the modification can be the identity, while special-fiber defects can still remain.
- A nonreduced X fails the hypothesis: residue-field tests cannot detect its infinitesimal obstruction.

### 7.8 Coherent triangulations and special fibers

Let X be reduced with irreducible connected components, and let M be densely pointwise strictly trianguline of rank d with global ordered parameters δ₁,…,δ_d as in §7.5. Construct `globalCoherentTriangulation`: a proper birational f:X′→X with X′ reduced and a unique coherent φ,Γ-stable flag whose graded pieces embed in R(δ_i)⊗L_i, with locally t-power-torsion cokernel. The first graded piece is isomorphic to its character line. There is a closed bad locus disjoint from the inverse image of the dense strict set; outside it the flag is a saturated strict triangulation with exactly the prescribed parameters. For a smooth curve take X′=X. Source: KPX Corollary 6.3.10, pp.71–72. Construct this flag by repeated application of §7.7 to the relevant dual quotient, recording the finite-projective kernel at each step. Uniqueness is uniqueness of the coherent subobjects/flag with these properties, not of a basis or of all possible subsequent modifications.

Separately, for any rigid E-analytic X, including nonreduced X and without the component hypothesis of the preceding global-flag theorem, let M satisfy the dense strictness and global-parameter hypotheses of §7.5. Prove `globalTriangulation_specialFiber`: every closed fiber is trianguline after saturation, with parameters δ_{i,z} multiplied by embeddingwise integral algebraic characters. For the reduced global-flag setting above, the exponents are zero on its good locus. To obtain the general fiber statement, pass to the reduction and a normalization component through the point, apply the flag theorem there, and descend the saturated field triangulation along the residue-field extension: the candidate character Hom spaces commute with finite field extension, nonzero Hom spaces are reflected by faithful flatness, and the field submodule classification identifies their saturations. Apply this argument successively to the quotients. At bad points the exponents measure the zeros of the embedding-period ideals in the coherent graded pieces; the prescribed global parameters need not remain the saturated parameters there. Source: KPX Theorem 6.3.13, p.72. API: `globalFlag_unique`, `globalFlag_goodLocus`, `globalFlag_firstGrade`, `globalFlag_curve`, `fiberSaturation_parameters` and compatibility with rank-one submodule exponents. Do not infer a globally saturated flag on all of X′.

**Checks.**

- Rank one recovers §7.4 with its coefficient line bundle; the unique flag has one graded piece.
- An everywhere strict split family with distinct generic parameters has an empty defect locus when its chosen flag is already saturated.
- A coherent graded piece t_σ^mR(δ) has character δx_σ^m; its saturation in R(δ) has character δ. Saturation removes that factor, so preserving the unsaturated label gives wrong special-fiber weights.
- Repeated parameters can destroy strictness, so an arbitrary pointwise trianguline dense set does not meet the theorem's strictness hypothesis.
- The empty rank-zero filtration needs no modification and has no parameter list.

### Examples

The nilpotent character 1+εlog distinguishes relative weight classification from a closed-point calculation. A line bundle twist distinguishes parameter uniqueness from a global basis. The map A --X→ A distinguishes flattening the image from flattening the cokernel. Finally tR⊂R exhibits exactly the defect which the coherent global flag permits and the saturated good-locus flag excludes.

### Dependencies

Layers 1–5 for relative complexes, finite presentations, duality and derived fibers; the character-space and coherent rigid-geometry contracts. The local rank-one field calculation used earlier requires only field slope theory and class field theory. The geometric flattening construction precedes its use in the global quotient and flag.

## Downstream consumers

Selmer and Iwasawa constructions use the native ψ complex and its independent tower comparison, with derived character specialization. Regulator and explicit reciprocity constructions use the residue-normalized pairing and the Wach coordinates with their stated lattice and prime restrictions. Trianguline deformation and eigenvariety arguments use character lines, nilpotent-sensitive weights, coefficient line bundles, the proper modification and the distinction between a coherent global flag and saturated special fibers. Analytic GL₂ applications may consume the all-level exponential criterion and annular generation, but must construct their own involution and prove its semilinearity and radius control.

## References

Page numbers refer to the printed pages of the linked versions, except KPX, KL-I, KL-II, Berger's preprints and LLZ-2010, where they are the numbered manuscript pages. No numerical residue constant is inferred from a reported claim.

- **Liu** — Ruochuan Liu, *Cohomology and duality for (φ,Γ)-modules over the Robba ring*, [arXiv:0711.4346v2](https://arxiv.org/abs/0711.4346v2), especially Lemma 4.2, manuscript p.22 (the auxiliary pure extension used in the field ψ-finiteness induction).
- **KPX** — Kiran S. Kedlaya, Jonathan Pottharst and Liang Xiao, *Cohomology of arithmetic families of (φ,Γ)-modules*, [arXiv:1203.5718v3](https://arxiv.org/abs/1203.5718v3), 79 pages. This version fixes the target numbering used here, including Theorems 4.4.3–4.4.8 and §6.3.
- **KL-I** — Kiran S. Kedlaya and Ruochuan Liu, *Relative p-adic Hodge theory: Foundations*, [arXiv:1301.0792](https://arxiv.org/abs/1301.0792), the cleared manuscript with §§1.5, 3.2, 8.5–8.6 and 9.5. The corrected ASW and free-cover arguments use KL-II Appendix A.
- **KL-II** — Kedlaya and Liu, *Relative p-adic Hodge theory, II: Imperfect period rings*, [arXiv:1602.06899](https://arxiv.org/abs/1602.06899), Appendix A, manuscript p.189.
- **KL-families** — Kedlaya and Liu, *On families of φ,Γ-modules*, Algebra & Number Theory 4 (2010), 943–967, [publisher PDF](https://msp.org/ant/2010/4-7/ant-v4-n7-p06-s.pdf), especially §§3–5. The original relative realization is distinguished from a converse effectivity statement with smallness hypotheses.
- **CC-1998** — Frédéric Cherbonnier and Pierre Colmez, *Représentations p-adiques surconvergentes*, Inventiones Mathematicae 133 (1998), 581–611, [author manuscript](https://webusers.imj-prg.fr/~pierre.colmez/CCinv.pdf), §§III.2–III.5, numbered manuscript pp.16–24.
- **CC-1999** — Cherbonnier and Colmez, *Théorie d'Iwasawa des représentations p-adiques d'un corps local*, Journal of the AMS 12 (1999), 241–268, [author manuscript](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf), §§II.1–II.3, manuscript pp.11–15.
- **Berger-intro** — Laurent Berger, *An introduction to the theory of p-adic representations*, [arXiv:math/0210184](https://arxiv.org/abs/math/0210184), for period and exponential conventions.
- **Berger-exp-2003** — Berger, *Bloch and Kato's exponential map: three explicit formulas*, Documenta Mathematica, Extra Volume Kato (2003), 99–129, [author manuscript](https://perso.ens-lyon.fr/laurent.berger/articles/article03.pdf), especially the exponential comparison and Appendix A, Theorem A.3, manuscript pp.26–27.
- **Berger-Wach-2004** — Berger, *Limites de représentations cristallines*, Compositio Mathematica 140 (2004), 1473–1498, [author manuscript](https://perso.ens-lyon.fr/laurent.berger/articles/article06.pdf), Proposition II.1.1 and §III.4. Read with the author's [errata](https://perso.ens-lyon.fr/laurent.berger/articles/errata.pdf): the rational Wach module becomes étale after the correct B_F scalar extension, not an incorrect overconvergent one.
- **LLZ-2010** — Antonio Lei, David Loeffler and Sarah Livia Zerbes, *Wach modules and Iwasawa theory for modular forms*, Asian Journal of Mathematics 14 (2010), 475–528, [institutional manuscript](https://wrap.warwick.ac.uk/id/eprint/38052/1/WRAP_Loeffler_modularforms.pdf), Theorem 3.5 and Lemma 3.15. The paper assumes p odd.
- **LLZ-2011** — Lei, Loeffler and Zerbes, *Coleman maps and the p-adic regulator*, Algebra & Number Theory 5 (2011), 1095–1131, [publisher PDF](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf), §§2C–3A, especially pp.1114–1116. The paper assumes p odd.
- **Pottharst** — Jonathan Pottharst, *Analytic families of finite-slope Selmer groups*, Algebra & Number Theory 7 (2013), 1571–1612, [publisher PDF](https://msp.org/ant/2013/7-7/ant-v7-n7-p02-p.pdf), Theorem 2.8 and Lemma 2.9, pp.1598–1599.
- **Liu-triangulation** — Ruochuan Liu, *Triangulation of refined families*, [arXiv:1202.2188v3](https://arxiv.org/abs/1202.2188v3), for the global triangulation context; the exact general flattening and specialization targets here use KPX §6.3.
- **FF** — Laurent Fargues and Jean-Marc Fontaine, *Courbes et fibrés vectoriels en théorie de Hodge p-adique*, Astérisque 406 (2018), [author PDF](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Theorem 11.5.1, pp.383–384.
- **BHS** — Christophe Breuil, Eugen Hellmann and Benjamin Schraen, *A local model for the trianguline variety and applications*, Publications Mathématiques de l'IHÉS 130 (2019), 299–412, [publisher/Numdam PDF](https://numdam.org/item/10.1007/s10240-019-00111-y.pdf), §3.3, pp.342–346.
- **Ding** — Yiwen Ding, *p-adic Hodge parameters in the crystabelline representations of GL_n*, Publications Mathématiques de l'IHÉS (2025), [publisher PDF](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf), §2.1, pp.9–10 of the article PDF, for coefficient-valued weights and rank-one conventions.
- **Colmez-GL2** — Pierre Colmez, *Représentations de GL₂(ℚ_p) et (φ,Γ)-modules*, Astérisque 330 (2010), 281–509, [Numdam PDF](https://www.numdam.org/article/AST_2010__330__281_0.pdf), Propositions VI.4.13 and VI.4.15, Remark VI.4.14 and Lemma VI.4.16, pp.435–437; §VIII.2, pp.502–503.
- **DLB** — Gabriel Dospinescu and Arthur-César Le Bras, *Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique*, Annals of Mathematics 186 (2017), 321–411, [publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n2-p01-p.pdf), Theorem 1.9, p.333, Theorem 8.3, pp.368–369, and §12.1, p.398.
