# Roadmap: arithmetic Galois representations and conductors

This roadmap builds the representation theory of absolute Galois groups that every modularity
statement in the Caraiani–Newton programme consumes: continuous representations of `G_F` on
finitely generated projective modules over topological coefficient rings, their integral models
and residual representations, their restrictions to decomposition groups with the attached
Weil–Deligne representations, their Artin and Swan conductors, the classification of residual
images in rank two, the recognition of a semisimple representation from the characteristic
polynomials of Frobenius elements, the Tate modules of elliptic curves and abelian varieties, and
the dimension-general calculus of powers, adjoints, polarisations and residual-image conditions
used by automorphy lifting. The output is always an actual continuous homomorphism

```text
ρ : G_F → GL(M)
```

with its topology, never a list of Frobenius traces of unspecified realisability. It is built on
Mathlib's `Field.absoluteGaloisGroup` with its Krull topology, on Mathlib's `Representation` and
`ContRepresentation`, on Tau Ceti's finite-group representation theory, Haar probability and
abelian-variety carrier, and on the Tau Ceti roadmaps for local fields, class field theory,
Chebotarev density and elliptic curves. Its end theorems are the recognition theorem for
semisimple representations by Frobenius characteristic polynomials (Layer 5), the comparison
between the Artin conductor of the Tate module of an elliptic curve and the conductor computed by
Tate's algorithm, with Ogg's formula (Layers 3 and 6), and the residual-image criteria (absolute
irreducibility of odd representations, adequacy, enormous image) in the exact form the
Taylor–Wiles method needs (Layers 4 and 7).

## Scope and ownership

The roadmap owns:

- the carrier `ContinuousRep Γ A M` (jointly continuous, finite projective, module topology) with its
  determinant, frames, coefficient extension and twisting, duals, tensor products, Tate twists and
  continuous induction; stable lattices and integral models, semisimplification, Brauer–Nesbitt,
  reduction and the residual semisimplification, Teichmüller lifts, and descent to a finite
  coefficient field (Layer 1);
- restriction to decomposition groups and its independence of the embedding, unramified
  representations and the ramification set, Frobenius characteristic polynomials, Dirichlet
  characters as Galois characters, the fundamental characters, Grothendieck's quasi-unipotence
  theorem, Weil–Deligne representations with arithmetic Frobenius, their Frobenius
  semisimplification, local Euler factors and local constants (Layer 2);
- Artin and Swan conductors through the upper-numbering filtration, with integrality, induction and
  twist formulas, the conductor of a Weil–Deligne representation, the prime-to-`p` conductor `N(ρ̄)`,
  the comparison of a representation with its reduction, and the comparison with the conductor of
  an elliptic curve (Tate's algorithm, Ogg's formula, the dyadic and triadic bounds) (Layer 3);
- the finite subgroups of `GL₂` and `PGL₂` over finite fields as residual images, oddness, the
  absolute irreducibility of odd irreducible representations in odd characteristic, the
  characteristic-two exceptions and bad-dihedral representations (Layer 4);
- Chebotarev recognition by Frobenius characteristic polynomials in a common coefficient field,
  Haar-measure forms of the density theorem, Frobenius density in the image, and descent to a
  subfield with its Brauer obstruction (Layer 5);
- the ℓ-adic Tate module of an abelian variety as a continuous representation, its residual
  representation, determinant through the Weil pairing, oddness, good-reduction Frobenius
  polynomial, isogeny compatibility, the comparison with the elliptic Tate module, and the local
  Euler-factor interface (Layer 6);
- continuous powers, tensor induction and restriction of scalars, the adjoint and trace-zero adjoint
  with the trace pairing, polarised representations over CM fields with their sign and oddness in
  every dimension, similitude groups and the Clozel–Harris–Taylor group, Zariski closures of images,
  adequate and enormous subgroups with their verification lemmas, the rank-two and `GSp₄`
  residual-image conditions, and the lifting of projective representations (Layer 7).

It leaves to named suppliers, and never rebuilds: the Krull topology, the separable closure and
the Galois correspondence (Mathlib); finite-group representation theory, induction and
restriction, Clifford theory, Brauer induction, projective representations and the Schur
multiplier (`TauCetiRoadmap.RepresentationTheory`); Artin–Wedderburn and Brauer groups
(`TauCetiRoadmap.RepresentationTheory/SemisimpleAlgebras` and Tau Ceti's `BrauerGroup`);
the lower and upper ramification filtrations, Herbrand's theorem and Hasse–Arf for
nonarchimedean local fields, the inertia and wild inertia subgroups and the tame quotient
(`TauCetiRoadmap.LocalFieldsRamification`); the local Weil group, its degree map, the local Artin
map and the conductor exponent of a character of `K^×` (`TauCetiRoadmap.ClassFieldTheory`);
Frobenius elements, completions and the decomposition-group embedding of a number field
(`TauCetiRoadmap.NumberFieldArithmetic`); the Chebotarev density theorem for finite Galois
extensions (`TauCetiRoadmap.Chebotarev`, `TauCetiRoadmap.ArithmeticDirichletSeries`); continuous
cohomology of profinite groups and the Evens norm (`TauCetiRoadmap.ProfiniteCohomology`);
torsion, the Weil pairing at finite level, Tate's algorithm, the Tate curve, twists and
Néron–Ogg–Shafarevich for Weierstrass curves (`TauCetiRoadmap.EllipticCurves`); minimal regular
models and intersection theory on arithmetic surfaces (`TauCetiRoadmap.StableReduction`); abelian
varieties at field level, duals and polarisations (`TauCetiRoadmap.JacobianChallenge` and
`AbelianSchemesAndArithmeticModuli` A1–A3); algebraic groups, the adjoint representation and the
reductive classification (`TauCetiRoadmap.ReductiveGroups`, `ReductiveGroupsPartII`); determinant
laws, Cayley–Hamilton algebras and Chenevier's reconstruction theorem
(`IntegralHeckeAndGaloisDeterminants`); the étale fundamental group of a curve over a finite field
(`InverseGaloisAndArithmeticFundamentalGroups`). The scheme-theoretic comparison of torsion with
finite flat group schemes, crystalline and finite-flat conditions on Tate modules, Hodge–Tate and
Sen theory in general, Néron models, and automorphic ε-factors are not objects of this roadmap;
the few facts of those theories that a statement here needs are stated here as targets with
their own hypotheses, in the layer that uses them.

Already in Tau Ceti, hence cited and not rebuilt: `ℤ_ℓ(1)` with its Galois action (`PadicTateTwist`),
the local inertia and wild inertia subgroups and arithmetic Frobenius lifts (`inertiaSubgroup`,
`wildInertiaSubgroup`, `IsArithFrobeniusLift`), the ℓ-adic cyclotomic character and its local form
(Mathlib `cyclotomicCharacter`, `localCyclotomicCharacter`), the ℓ-adic tame character
(`inertiaPadicTameCharacter`), the ramification filtration with Herbrand functions
(`lowerRamificationGroup`, `herbrand`, `upperRamificationGroup`), the Tate module of an elliptic
Weierstrass curve with its continuous Galois representation, Weil pairing and determinant
(`TateModule`, `tateModuleGaloisRepresentation`, `tateModuleWeilPairing`,
`det_tateModuleGaloisRepresentation`), and symmetric, exterior and tensor powers and tensor induction of
abstract representations (`Representation.symmetricPower`, `exteriorPower`, `tensorInducedRepresentation`).
Already stated by `IntegralHeckeAndGaloisDeterminants`, hence cited: Ribet's lemma (`ribet_lattice`),
integral models for split reductive groups (`reductive_integral_model`), determinant laws and
Chenevier's reconstruction. The variants kept here differ in one clause each: the Tate module targets are
for abelian varieties of every dimension with a comparison in dimension one; the power and
tensor-induction targets add the module topology, joint continuity, finite projectivity and rank.

Local Galois groups of `p`-adic fields as abstract groups, their cyclotomic orientation, the Tate
module of a tame layer and the generator ranks are `TauCetiRoadmap.LocalGaloisGroups`; the
roadmap uses nothing from it and introduces no second local cyclotomic character: the global
ℓ-adic cyclotomic character here is Mathlib's `cyclotomicCharacter`, and its local restriction is
compared with the local one where both occur.

## Conventions

- `F` is a field, `G_F = Field.absoluteGaloisGroup F` with its Krull topology; compactness,
  Hausdorffness and total disconnectedness are transported from `Gal(F^sep/F)` along Tau Ceti's
  `absoluteGaloisGroupRestrictEquiv`. Over an imperfect field the Galois correspondence is that
  of the separable closure. `Γ` denotes an arbitrary profinite group when no field is involved.
- `A` is a commutative topological ring with continuous ring operations. The standard coefficient
  tiers are a finite extension `E` of `ℚ_ℓ` with its valuation topology; a finite field or
  `F̄_p = AlgebraicClosure (ZMod p)` with the discrete topology; a complete Noetherian local ring
  with finite residue field and its maximal-adic topology; `ℚ̄_ℓ = PadicAlgCl ℓ` with the topology
  of its absolute value; and `ℂ` with its usual topology.
- A continuous representation is a finitely generated projective `A`-module `M` with the module
  topology (`IsModuleTopology A M`) and an `A`-linear action of `Γ` such that the action map
  `Γ × M → M` is jointly continuous. Joint continuity is strictly stronger than continuity of each
  operator; Mathlib's `ContRepresentation` asks only for the latter, and every `ContinuousRep`
  yields a `ContRepresentation` by forgetting joint continuity; the converse fails (the character
  `a ↦ (1+ℓ)^a` of `ℤ_ℓ` on `ℚ_ℓ` with the discrete topology is a `ContRepresentation` whose kernel
  `{0}` is not open, so it is not jointly continuous). Determinants of representations on
  projective modules are defined through the top exterior power, never through `LinearMap.det`,
  which is `1` on a module without a finite basis; on the zero module the determinant is the
  trivial character, and on `ℤ_ℓ(1)` it is `χ_ℓ`.
- Frobenius is **arithmetic** unless the name says `Geom`. A Frobenius lift at a finite place `v`
  is any element of the decomposition group inducing `x ↦ x^{q_v}` on the residue field; its
  conjugacy class modulo inertia is `Frob_v`. The Frobenius characteristic polynomial at an
  unramified place is `P_v(ρ, X) = det(X − ρ(Frob_v))`; the local Euler factor is
  `det(1 − ρ(Frob_v^{-1}) q_v^{-s} | V^{I_v})^{-1}`, written with the geometric Frobenius
  `Frob_v^{-1}` so that it agrees with the usual `L`-function. Witness: for `F = ℚ` and
  `ρ = ℤ_ℓ(1)`, `χ_ℓ(Frob_p) = p`, so `P_p(ℤ_ℓ(1), X) = X − p` (with a geometric lift it would be
  `X − p^{-1}`), and the Euler factor is `(1 − p^{-1-s})^{-1}`, so `L(ℚ_ℓ(1), s) = ζ(s + 1)`.
- The Weil–Deligne relation is `r(w) N r(w)^{-1} = q^{deg w} N` for `w` in the Weil group, where
  the degree of an arithmetic Frobenius lift is `1` (`TauCetiRoadmap.ClassFieldTheory` layer 9
  normalisation); equivalently the tame character satisfies `t_ℓ(g σ g^{-1}) = χ_ℓ(g) t_ℓ(σ)`.
  Witness: the special representation `Sp(2)` has a basis `e₀, e₁` with `N e₁ = e₀`, `N e₀ = 0`,
  `r(Φ) e₀ = q e₀` and `r(Φ) e₁ = e₁` for an arithmetic Frobenius lift `Φ`; then
  `r(Φ) N r(Φ)^{-1} e₁ = r(Φ) e₀ = q e₀ = q N e₁`, which is the stated relation and not its
  inverse. The relation with a geometric lift has `q^{-deg w}`; no statement copies the
  geometric form unchanged.
- The ℓ-adic cyclotomic character `χ_ℓ : G_F → ℤ_ℓ^×` is Mathlib's `cyclotomicCharacter` for
  `char F ≠ ℓ` (for `char F = ℓ` Mathlib's character is trivial, so the hypothesis is never
  dropped); `ℤ_ℓ(1)` is the Tate module of the roots of unity with this action, `M(n)` is the
  twist by `χ_ℓ^n`, so `M(1)^∨ ≅ M^∨(−1)`, and `χ_ℓ` has Hodge–Tate weight `+1`, so `ℚ_ℓ(−1)` has
  weight `−1` and `H^1` of an elliptic curve has weights `0` and `1`. The Weil pairing on the Tate
  module of an abelian variety is alternating with `e(gx, gy) = χ_ℓ(g) e(x, y)`, so the
  determinant of `T_ℓ A` is `χ_ℓ^g`, not `χ_ℓ^{-g}`.
- Conductors are defined for representations whose coefficient characteristic differs from the
  residue characteristic `p` and whose wild inertia image is finite; the Artin conductor is the
  sum of the tame term `codim V^{I}` and the Swan conductor, the Swan conductor is additive on
  exact sequences and the Artin conductor is superadditive; the conductor of a Weil–Deligne
  representation adds the monodromy term `dim V^{I} − dim (ker N)^{I}`, where `V^{I}` is the
  invariants of `r` restricted to inertia. Witnesses: the quadratic character of `ℚ_p(√p)/ℚ_p`
  for odd `p` has `χ(G^0) ≠ 1` and `χ(G^u) = 1` for `u > 0`, so its Artin conductor is `1`
  (tame term `1`, Swan `0`); the Weil–Deligne representation `Sp(2)` of the Tate curve has `r`
  trivial on inertia, `V^{I} = V` of dimension `2`, `ker N = ⟨e₀⟩` of dimension `1`, hence
  conductor `0 + 0 + (2 − 1) = 1`, the conductor exponent of multiplicative reduction. The
  ramification filtration is used for nonarchimedean local fields (finite residue field);
  statements for a complete discretely valued field with perfect infinite residue field are
  stated separately and only where a target needs them.
- For an elliptic curve, the number `m` in Ogg's formula counts the geometric irreducible
  components of the special fibre of the minimal proper regular model without multiplicity
  (`m = 5` for type `I₀^*`); the exponent `f` is the Artin conductor exponent of `V_ℓ E`, and
  the comparison with Tate's algorithm includes the wild contributions at `2` and `3`. Witness
  of `v(Δ) = f + m − 1`: a curve of type `I₀^*` over `ℚ_p`, `p ≥ 5`, has `v(Δ) = 6`, additive
  reduction with `f = 2`, hence `m = 5`; type `I_n` has `v(Δ) = n`, `f = 1`, `m = n`; good
  reduction has `f = 0`, `m = 1`.
- Oddness of a rank-two representation of `G_F`, `F` a number field, is `det ρ(c_v) = −1` for the
  complex conjugation `c_v` at every real place `v` (`ℤ_ℓ(1) ⊕ ℤ_ℓ` is odd since `χ_ℓ(c) = −1`;
  the trivial rank-two representation is even); oddness of a polarised representation in
  dimension `n` is a sign condition at each real place and is not reduced to the rank-two test.
  Over `F_2` the condition `det ρ̄(c) = −1 = 1` holds for every `ρ̄`, so oddness is stated for
  coefficient rings in which `−1 ≠ 1`, or as the sign condition of Layer 7 which is not vacuous
  over a non-reduced ring of characteristic two.
- Adequacy, enormousness and the `GSp₄` "vast" and "tidy" conditions are distinct predicates
  with separate verification lemmas; the trace-zero adjoint `ad⁰` and the quotient `ad/scalars`
  are distinct carriers, and when `p ∣ n` the statements that need the splitting
  `ad = ad⁰ ⊕ scalars` carry that hypothesis explicitly.
- Universe conventions: coefficient rings and modules live in one universe `u`; groups in a
  possibly different universe; the abelian-variety carrier is Tau Ceti's
  `TauCeti.AlgebraicGeometry.AbelianVariety K`.
- Names: `ContinuousRep`, `GaloisRep` (restriction, Frobenius, local objects), `GaloisLattice`
  (integral models), `WeilDeligneRep`, `Conductor`, `ResidualImage`, `PolarizedRep`; theorem
  names follow Mathlib's conventions.

## Exact supplier contracts

### From Mathlib

`Field.absoluteGaloisGroup` (with `map`, `mapOfAlgebra`), `Representation` and `ContRepresentation`
with their induction, coinduction, dual, tensor, internal-Hom and invariants API, `IsModuleTopology`,
`Module.Projective`/`Finite`/`Invertible`/`rankAtStalk`, exterior and tensor powers, `LinearMap.det`,
`charpoly`, `trace`, `cyclotomicCharacter`, `PadicAlgCl`, `PadicInt`, `IsNonarchimedeanLocalField`,
`IsArithFrobAt`, `Ideal.inertia`, adic completions, infinite places and CM fields, Dirichlet density,
`IsCyclotomicExtension.Rat.galEquivZMod`, `DirichletCharacter`, the matrix groups `GL`, `SL`, `PGL`,
`PSL` (with `rank_two_simple`), `symplecticGroup`, `card_GL_field`, `IsNilpotent.exp`, semisimple
endomorphisms, `MonoidHom.transfer`, `Subgroup.goursat`, `DihedralGroup`, Haar measures, `BaireSpace`,
profinite completion, `BrauerGroup`, Artin–Wedderburn, `Algebra.Etale`, `Rep` adjunctions,
`FDRep.char_orthonormal`, and `WeierstrassCurve` with its points, local polynomial and reduction. Each
layer names the exact declaration at the claim that uses it; where a Mathlib result is stated only for
free modules or only for Galois extensions, the layer says how the projective or inseparable case is
reduced to it.

### From Tau Ceti

`absoluteGaloisGroupRestrictEquiv` (`G_F ≃ₜ* Gal(F^sep/F)`); `Representation.conjSubrep`,
`iSup_conjSubrep_eq_top`, `isSemisimpleRepresentation_comp_subtype`,
`isIrreducible_of_asAlgebraHom_surjective`; `jordanHolderMultiplicity` with its exactness and
composition lemmas; `exists_linearEquiv_directSum_isIndecomposableModule`; `haarProb`, `haarProb_apply`,
`eq_haarProb_of_isHaarMeasure_of_isProbabilityMeasure`; `teichmuller`, `teichmuller_injective`,
`teichmuller_pow`, `residue_teichmuller`, `eq_teichmuller`, `rootsOfUnityEquivResidueFieldUnits`;
`traceBilinForm` with symmetry and nondegeneracy; `ContCohomology.cochainsCor1` with `_d0`, `_res`;
the `GL₂` material `GL2Borel.*`, `GL2NonSplitTorus.*`, `GL2WeylElement`, `diagonalTorus`, `diagGL`,
`centralizer_diagGL`, `conjClassesGLFinTwoEquiv`, `exists_isConj_normalForm`,
`isConj_iff_of_notMem_range_scalar`, `natCard_GL_fin_two`, `Matrix.SpecialLinearGroup.not_isSolvable_fin_two`;
`Algebra.index`, `Algebra.deg`, `Algebra.IsSplittingField`, `Algebra.index_dvd_deg`, `BrauerGroup.mk`,
`BrauerGroup.baseChange`, `BrauerGroup.mk_eq_one_iff_isSplittingField`, `subsingleton_brauerGroup_of_finite`,
`IsSimpleRing.exists_algEquiv_matrix_centralDivisionRing`, `CSA.of`, `Quaternion.mk_ne_one`;
`Multiquadratic.galoisGroupEquiv`; `character_indFDRep_eq_zero_of_notMem_of_index_two`,
`simple_indFDRep_ofLinearCharacter_iff`; `CommHopfAlgCat.hopfIdealOrderIsoClosedSubgroup`,
`FiniteTypeCommHopfAlgCat.identityComponent`, `ConstantForm.groupScheme`, `Symplectic.groupScheme`,
`Orthogonal.groupScheme`; `AlgebraicGeometry.AbelianVariety` with `baseChange`, `prod`, `mulBy`, `End`,
`IsIsogeny`; `Isogeny` with `degree`, `card_ker_mulByIntIsogeny`, `frobeniusIsogeny`,
`oneSubFrobeniusIsogeny`, `degree_oneSubFrobeniusIsogeny_eq_pointCount`; and the objects named in
Scope and ownership as already present (`PadicTateTwist`, `inertiaSubgroup`, `wildInertiaSubgroup`,
`IsArithFrobeniusLift`, `localCyclotomicCharacter`, `inertiaPadicTameCharacter`, `TateModule`,
`tateModuleGaloisRepresentation`, `tateModuleWeilPairing`, `det_tateModuleGaloisRepresentation`,
`Representation.symmetricPower`, `Representation.exteriorPower`, `tensorInducedRepresentation`). All are
consumed as `TauCeti.*`; `Suggested.lean` imports the abelian-variety modules it names.

### From `TauCetiRoadmap.LocalFieldsRamification`

Layer 0: finite extensions of local fields and Krasner's lemma (`F̄_v = F_v · ι(F̄)`). Layer 2:
the predicate `IsUnramified`, the maximal unramified extension with `Gal(K^ur/K) ≅ Ẑ` sending
arithmetic Frobenius to `1`, the unramified extension of each degree, and `I_{K'} = I_K` for
`K'/K` unramified. Layer 3: lower and upper numbering for finite Galois extensions of a
nonarchimedean local field, Herbrand's quotient theorem `upperRamificationGroup_quotient`, the
Herbrand functions `φ_{L/K}`, `ψ_{L/K}`, and Hasse–Arf. Layer 4: `I_K` and `P_K` as closed normal
subgroups of `G_K` with images `G_0`, `G_1` in finite quotients, `P_K` pro-`p`, the tame quotient
`I_K/P_K ≅ ∏_{ℓ ≠ p} ℤ_ℓ(1)` with its `G_K`-equivariance and Kummer description, arithmetic
Frobenius lifts as a coset of `I_K`, and `I_L = I_K ∩ G_L`, `P_L = P_K ∩ G_L` for finite
separable `L/K`. The absolute upper filtration `G_K^u` and the formula
`G_K^u ∩ G_L = G_L^{ψ_{L/K}(u)}` for finite separable `L/K` are not in that roadmap and are targets
of Layer 3 here.

### From `TauCetiRoadmap.ClassFieldTheory`

Layer 7: `artinMap` with its normalisation (a uniformiser maps to arithmetic Frobenius),
`normResidue_uniformizer`, and `characterConductorExp` of a character of `K^×`; the comparison
`artinMap(U_K^n)` dense in the image of `G_K^n` in `G_K^{ab}`, which equates the Artin conductor
of a character with its class-field-theoretic conductor, is a target of Layer 3 here. Layer 9: the
Weil group `W_K` with its topology, `I_K ⊆ W_K` open, `weilDegree : W_K → ℤ` with an arithmetic
Frobenius lift of degree `1`, `weilTransfer` with `weilDegree_weilTransfer`, and
`localWeilArtinEquiv` for `K/ℚ_p` finite. Layer 13: `kroneckerWeber`.

### From `TauCetiRoadmap.NumberFieldArithmetic`

Layer 2: existence, uniqueness modulo inertia and conjugation of `IsArithFrobAt` elements in
finite Galois extensions, and `Frob_p` acting as `ζ ↦ ζ^p` on `ℚ(ζ_N)`. Layer 5: completions
`F_v` as nonarchimedean local fields, `completionAlgHom`, and `decompositionHom` with its
bijectivity onto the decomposition group and its compatibility with Frobenius and conjugation.
Layer 6: `v_𝔭(𝔡_{F'/F}) = Σ_{w ∣ v} δ(F'_w/F_v)` for the relative different.

### From `TauCetiRoadmap.Chebotarev` and `TauCetiRoadmap.ArithmeticDirichletSeries`

Chebotarev layer 10: `hasDirichletDensity_frobeniusPrimeSet` (for a finite Galois extension `L/K`
of number fields and a conjugacy class `C`, the primes with `Frob_𝔭 ∈ C` have Dirichlet density
`#C/#Gal(L/K)`), with the infinitude of each class and its invariance under finite changes.
Layer 14: `hasNaturalDensity_frobeniusPrimeSet` with the same value. ArithmeticDirichletSeries
layer 7: `HasDirichletDensity`, the upper and lower density bounds, and the calculus of densities
(finite symmetric differences, unions, bounds).

### From `TauCetiRoadmap.RepresentationTheory`

InductionRestriction layer 5 (Clifford theory: a `G`-stable irreducible character of a normal
subgroup `N` extends to `G` when `G/N` is cyclic), layer 6 (Brauer's induction theorem: every
virtual character is a `ℤ`-combination of characters induced from one-dimensional characters of
elementary subgroups) and layer 7 (projective representations, factor sets, the obstruction
class in `H²`, and `H²(C, ℂ^×) = 0` for `C` cyclic). SemisimpleAlgebras layer 2: the Wedderburn
presentation `B ≅ ∏ M_{m_j}(D_j)` with its uniqueness and dimension count. `TauCetiRoadmap.
RepresentationTheory/CompactGroups` is the natural home of a jointly continuous variant of
`ContRepresentation`; the carrier of Layer 1 is designed so that it can be replaced by such a
predicate when it exists.

### From `TauCetiRoadmap.EllipticCurves`, `StableReduction`, `JacobianChallenge`

EllipticCurves layer 1: isogenies with their point maps, base change, composition and degree;
the quotient `W → W/Φ` by a finite Galois-stable subgroup (Vélu). Layer 2:
`E[N] ≃ (ℤ/N)²` over a separably closed field, the Weil pairing `e_N` (alternating, nondegenerate,
Galois-equivariant, compatible with multiplication maps), and the ℓ-adic Tate module with its
continuous `G_K`-action (through the comparison of Layer 6 here). Layer 3: `frobeniusTrace`,
`pointCount`, the Frobenius isogeny acting as `(x, y) ↦ (x^q, y^q)`, and
`tr(α ∣ V_ℓ) = 1 + deg α − deg(1 − α)`. Layer 4: Tate's algorithm with its `ReductionSymbol`,
component count, independence of the minimal equation and invariance under unramified base change;
the Tate curve `E_q` with `E[ℓ^n]` as an extension of `ℤ/ℓ^n` by `μ_{ℓ^n}`; and
Néron–Ogg–Shafarevich in both directions. Layer 5: quadratic twists and the classification of twists
by `j`. StableReduction layers 4 and 5: intersection theory and blow-ups on regular arithmetic
surfaces; existence and uniqueness of the minimal proper regular model with the components and
multiplicities of its special fibre, and its formation under base change to the completed strict
henselisation. JacobianChallenge layer E: the dimension of an abelian variety, `[n]` an isogeny for
`n ≠ 0`, the dual abelian variety and dual homomorphisms, polarisations.

### From `TauCetiRoadmap.ProfiniteCohomology` and `TauCetiRoadmap.ReductiveGroups`

ProfiniteCohomology layer 10: `H²` of a profinite group with discrete torsion coefficients as the
obstruction group for lifting through a central extension with finite kernel, compatibly with
direct limits of coefficients. Layer 13: for an open subgroup `U` of index `l`, the permutation
wreath product `U^l ⋊ S_l` and the transversal-dependent continuous monomial homomorphism
`G → U^l ⋊ S_l` with its change-of-transversal cocycle. ReductiveGroups layer 0 (affine group
schemes over `ℤ` as representable functors), layer 2 (`Lie(G)` and `Ad` for `GL_n`, `GSp`, `GO`,
`PGL₂` with the matrix descriptions, functoriality of `Ad`), layer 3 (closed subgroup schemes,
identity component and component group, finiteness of `π₀`), layer 6 (in characteristic zero a
smooth affine group with a faithful semisimple representation has reductive identity component;
connected reductive subgroups of `GL₂` acting irreducibly are `SL₂` or `GL₂`; the derived group).

### From the lower-tier roadmaps of this programme

`IntegralHeckeAndGaloisDeterminants` IHG.0 and IHG.1: determinant laws of degree `d` on a group
algebra, Cayley–Hamilton algebras, Chenevier's reconstruction (over an algebraically closed field a
continuous `d`-dimensional determinant is `det ∘ ρ` for a continuous semisimple `ρ`, unique up to
isomorphism; over a complete local Noetherian ring with finite residue field and absolutely
irreducible residual determinant it is `det ∘ ρ` for a unique `ρ`), and the rank-two trace and
determinant form. `AbelianSchemesAndArithmeticModuli` A1 (the abelian variety of dimension one
attached to an elliptic Weierstrass curve with its group isomorphism on points), A2 (the dual
abelian variety and polarisations as schemes, the scheme-level Weil pairing) and A3 (`[n]` finite
locally free of rank `n^{2g}` and étale over `S[1/n]`, kernels of isogenies, quotient isogenies,
specialisation of torsion). `InverseGaloisAndArithmeticFundamentalGroups` IG.1 (the étale
fundamental group of a normal connected `F_q`-scheme with its Frobenius classes and lisse sheaves as
its continuous representations). `ReductiveGroupsPartII` RG2.2 (the action of `Ĝ(E)` on its
building, fixed points of compact subgroups, maximal compact subgroups as stabilisers).

## How to read the build

Layer 1 is the carrier and its integral theory and is used by every later layer. Layer 2 adds the
local objects (decomposition groups, Frobenius, tame and cyclotomic characters, Weil–Deligne
representations) and depends on Layer 1 only. Layer 3 defines conductors from the ramification
filtration and the Weil–Deligne representations of Layer 2 and ends with the elliptic-curve
comparison, which also consumes the Tate module of Layer 6 as an input to its last subsection;
that subsection is built after Layer 6. Layer 4 (residual images in rank two) uses Layers 1 and 2.
Layer 5 (recognition by Frobenius polynomials) uses Layers 1 and 2 and the determinant theory of
`IntegralHeckeAndGaloisDeterminants`. Layer 6 (Tate modules) uses Layers 1 and 2 and the
abelian-variety suppliers. Layer 7 (dimension-general API) uses Layers 1, 2, 4 and 5. Within a
layer the subsections are in build order. `Suggested.lean` records representative signatures and
the unit tests as `example`s; it is not exhaustive, and the Layer 6 signatures that need supplier
objects absent from the pinned Tau Ceti are stated in this document only.

## Layer 1: continuous representations and integral models

This layer fixes the carrier of the roadmap, continuous representations of profinite groups on finite projective modules, and the ℓ-adic bookkeeping later layers rely on: integral models, semisimplification, Brauer–Nesbitt and residual representations.

Standing hypotheses. Γ is profinite; A is a commutative ring with continuous ring operations. A coefficient field E is a finite extension of Q_ℓ (ring O_E, uniformiser ϖ, residue field k_E); Q̄_ℓ := `PadicAlgCl ℓ`; finite fields and F̄_p := `AlgebraicClosure (ZMod p)` are discrete. Frobenius is arithmetic; χ_ℓ has Hodge–Tate weight +1. Unprefixed names under *Needs* are Mathlib's. Sources: DDT = Darmon–Diamond–Taylor 2007, BHKT = Böckle–Harris–Khare–Thorne 2019, NT = Newton–Thorne 2026, DS = Deligne–Serre 1974, CG = Calegari–Geraghty 2020, Chenevier = Chenevier, arXiv:0809.0415v2.

### 1.1 Continuous representations

Define `ContinuousRep Γ A M`: (M, ρ): M finitely generated projective over A with the module topology, ρ a `Representation A Γ M`, Γ × M → M jointly continuous (stronger than each ρ(g) continuous). For a field F, Γ = G_F := `Field.absoluteGaloisGroup F` (Krull topology), profinite via `TauCeti.absoluteGaloisGroupRestrictEquiv` to Gal(F^sep/F), whose Galois correspondence is used (fixed fields in F^sep for imperfect F). Morphisms: A-linear equivariant maps (automatically continuous). Coefficient cases: E; a finite field or F̄_p; a complete Noetherian local ring with finite residue field, m_A-adic (M then free); Q̄_ℓ; ℂ. For M of constant rank r, det ρ : Γ →* A^× is the action on the invertible ⋀^r_A M; continuous; `LinearMap.det ∘ ρ` for free M. API: `ContinuousRep`, `ContinuousRep.mk'`, `continuous_action`, `toContRepresentation`, `Hom`, `Hom.continuous`, `ext`, `continuous_iff_matrixCoeff`, `ofCharacter`, `det`, `det_eq_linearMap_det`, `trivial`, `continuous_iff_orbit`, `absoluteGaloisGroup_profinite`. (DDT, §2.1, p. 52; NT, §1.2, p. 7; BHKT, §2, p. 5.) *Needs:* `Representation`, `ContRepresentation`, `IsModuleTopology`; `TauCeti.absoluteGaloisGroupRestrictEquiv`.

**Checks.**
- `not_of_discrete_padic_character`: Z_ℓ on discrete Q_ℓ by (1+ℓ)^a: `ContRepresentation`, not `ContinuousRep`.
- `det_cyclotomic`: F = Q, det Z_ℓ(χ_ℓ) = χ_ℓ, −1 at complex conjugation.
- `zero`: M = 0, rank 0, det = 1.
- `toContRepresentation_injective`; `continuous_iff_matrixCoeff` on A^n.

Prove `exteriorPower.baseChangeEquiv`: for A commutative, M an A-module, r ∈ ℕ and B a commutative A-algebra, a natural B-linear B ⊗_A ⋀^r_A M ≅ ⋀^r_B(B ⊗_A M), b ⊗ ∧m_i ↦ b·∧(1⊗m_i), compatible with maps. Prove `exteriorPower.projective`: ⋀^r_A M is finitely generated projective when M is. Prove `exteriorPower.rankAtStalk_eq_choose`: M finite projective of constant rank n ⇒ ⋀^r M has constant rank binom(n, r) (one for r = n, zero for r > n). Prove `Module.invertible_of_rankAtStalk_eq_one`: L finitely generated projective of constant rank one is `Module.Invertible A L`, so A ≅ End_A(L) and Aut(L) = A^× (fails for A × A). Prove `LinearMap.detProj`: for M finite projective with a finite free complement M ⊕ N, det_M(u) := `LinearMap.det`(u ⊕ id_N) is independent of N and basis, multiplicative, commutes with base change, is a unit iff u is bijective, equals the scalar of ⋀^r u on ⋀^r M (constant rank r), `LinearMap.det u` (M free), and det(e∘u∘s + 1 − e∘s) for a splitting s∘e = id_M, e : M → A^n. (DDT, §2.1, p. 52.) *Needs:* `exteriorPower.alternatingMapLinearEquiv`, `Module.rankAtStalk_eq_finrank_tensorProduct`.

### 1.2 Frames, coefficient extension, operations, Tate twists

Define a framed representation: a continuous homomorphism ρ : Γ → GL_n(A) = `Matrix.GeneralLinearGroup (Fin n) A`, n ≥ 0, with the units topology; continuity into GL_n(A) ⇔ into M_n(A). Isomorphism classes of `ContinuousRep`s on A^n = GL_n(A)-conjugacy classes (conjugacy over B ⊃ A is coarser). API: `ofFramed`, `frame`, `frame_basis_change`, `ofFramed_iso_iff`, `Framed.map` (map_id, map_comp), `Framed.continuous_iff_coe`, `det_ofFramed`. (DDT, §2.1, p. 52; Ribet 1976, §2, p. 154.) *Needs:* `Matrix.GeneralLinearGroup`.

**Checks.**
- `Framed.conj_not_integral`: (1 a; 0 1), (1 ℓa; 0 1) on Z_ℓ: GL_2(Q_ℓ)- not GL_2(Z_ℓ)-conjugate.
- `Framed.rank_one`: characters; ofFramed χ = ofCharacter χ.
- `Framed.rank_zero`: n = 0: one, the zero representation.
- `Framed.continuous_iff_coe`.

Define `baseChange f M` for continuous f : A → B: B ⊗_A M, g ↦ id ⊗ ρ(g); m ↦ 1 ⊗ m is continuous, equivariant, f-semilinear. For any field extension E ⊂ E′ (algebraic, any monoid) Hom_Γ(V, W) ⊗_E E′ ≅ Hom_Γ(V_{E′}, W_{E′}) and (V_{E′})^Γ = V^Γ ⊗ E′. API: `baseChange_apply_tmul`, `baseChangeComp`, `baseChangeId`, `det_baseChange`, `charpoly_baseChange`, `invariants_baseChange`, `baseChange_toRepresentation` (= `TauCeti.Representation.baseChange`). (BHKT, §2, p. 5; NT, §1.2, p. 7.) *Needs:* `TauCeti.Representation.baseChange`, `TauCeti.Representation.finrank_intertwiningMap_baseChange`.

**Checks.**
- `baseChange_cyclotomic`: Z_ℓ(1) along Z_ℓ → Q_ℓ is ofCharacter χ_ℓ.
- `baseChange_id`: ≅ M.
- `baseChange_discontinuous`: id to discrete Q_ℓ: Q_ℓ(1) (F = Q) is no `ContinuousRep`.
- `finrank_hom_baseChange`.

Define the operations: `res φ M` = (M, ρ∘φ) for continuous φ : Γ′ → Γ (a subgroup, or `Field.absoluteGaloisGroup.mapOfAlgebra` G_L → G_K); `directSum`; `tensor` (diagonal); `dual` ((gλ)(m) = λ(g⁻¹m), so evaluation is invariant); `hom` (g·f = ρ_N(g)∘f∘ρ_M(g)⁻¹); `twist` (M(χ) = M ⊗ A(χ), χ continuous); each a `ContinuousRep`. API: `res_id`, `res_comp`, `tensor_apply_tmul`, `dual_dual`, `homEquivDualTensor`, `twist_twist` (M(χ)(ψ) ≅ M(χψ); M(1) ≅ M), `directSum`, `det_tensor` ((det M)^n(det N)^m, ranks m, n), `det_twist` (det M·χ^m), `det_dual`, `det_res`, det(M ⊕ N) = det M·det N, `invariants_hom` (Hom^Γ = Hom_Γ; evaluation, coevaluation are morphisms), `res_baseChange` (all commute with res and baseChange). (DDT, §2.1, pp. 52–53; NT, display (1.1), p. 3.) *Needs:* `Field.absoluteGaloisGroup.mapOfAlgebra`; `TauCeti.ContRepresentation.linHom`, `TauCeti.ContRepresentation.continuous_linHom`, `TauCeti.ContRepresentation.conj_linHom`.

**Checks.**
- `det_dual`: dual Z_ℓ(1) ≅ ofCharacter χ_ℓ⁻¹.
- `twist_one`: M(1) ≅ M; Hom_A(0, N) = 0.
- `dual_action_inverse_transpose`: ρ(g)^T is an anti-homomorphism for GL_2(F_2) on F_2².
- `invariants_hom`; `linHom_compat`: agreement with `TauCeti.ContRepresentation.linHom` (complete E).

The module Z_ℓ(1) with its G_F-action is Tau Ceti's `TauCeti.PadicTateTwist` with `TauCeti.PadicTateTwist.galoisRepresentation` (for a field F with ℓ ≠ char F, the inverse limit of μ_{ℓ^n}(F̄) on which σ acts by ζ ↦ ζ^{χ_ℓ(σ)}, χ_ℓ = Mathlib's `cyclotomicCharacter`). Prove `TateTwist.zlOne_eq_padicTateTwist`: `ofCharacter χ_ℓ` is isomorphic, as a `ContinuousRep` of G_F over Z_ℓ, to that Tau Ceti module with the module topology. Define the twists: Z_ℓ(n) := Z_ℓ(1)^{⊗n} (n ≥ 0), Z_ℓ(−n)^∨ (n < 0), ≅ ofCharacter χ_ℓ^n; for M over a topological Z_ℓ-algebra with continuous structure map, `tateTwist` M(n) := M ⊗_{Z_ℓ} Z_ℓ(n). χ_ℓ(Frob_v) = q_v (v ∤ ℓ) is Layer 2's. API: `tateTwist_add` (M(m)(n) ≅ M(m+n)), `tateTwist_zero`, `res_tateTwist` (via `res_zlOne`), `dual_tateTwist` (M(n)^∨ ≅ M^∨(−n)), `det_tateTwist`. (DDT, §2.1, p. 50; Khare–Wintenberger 2009 (I), §1.5, p. 4.) *Needs:* `TauCeti.PadicTateTwist`, `TauCeti.PadicTateTwist.galoisRepresentation`, `cyclotomicCharacter`, `cyclotomicCharacter.continuous`.

**Checks.**
- `TateTwist.complexConj`: F = Q, complex conjugation acts on Z_ℓ(1) by −1 and on M(1) by −ρ(c).
- `TateTwist.zero`: M(0) ≅ M; `TateTwist.one_dual`: Z_ℓ(1)^∨ ≅ Z_ℓ(−1) = ofCharacter χ_ℓ^{−1}, not Z_ℓ(1).
- `TateTwist.charEll_excluded`: char F = ℓ: Mathlib's character is trivial and μ_{ℓ^n}(F̄) = 1, so Z_ℓ(1) = 0 ≠ ofCharacter 1; ℓ ≠ char F is needed on both sides.
- `TateTwist.mod_pow_iso_rootsOfUnity`: Z_ℓ(1)/ℓ^n ≅ `rootsOfUnity (ℓ^n) F̄` equivariantly; `TateTwist.det`: det M(n) = det M·χ_ℓ^{n·rank M} (χ_ℓ² for M = Z_ℓ(1), n = 1).

### 1.3 Induction from open subgroups

Define `ind H U` for open H ≤ Γ (index m) and (U, σ) over A: functions f : Γ → U with f(hx) = σ(h)f(x), (g·f)(x) = f(xg); a choice-free `ContinuousRep` of rank m·rank U, ≅ U^m via f ↦ (f(g_i)) for a right transversal (others: block-monomial matrices over σ(H)). API: `ind_apply`, `indEquivPi`, `indResEquiv` (Frobenius reciprocity), `invariantsIndEquiv` ((Ind U)^Γ ≅ U^H), `indInd`, `ind_map`, `ind_map_comp`, `indTensorRes` (projection formula), `ind_dual`, `ind_baseChange`, `ind_toContRepresentation` (= `ContRepresentation.coind`). (BHKT, §10, Lemma 10.5, pp. 55–56; Boxer–Calegari–Gee–Pilloni 2025, Lemma 10.2.3, p. 212.) *Needs:* `ContRepresentation.coind`, `Rep.indCoindIso`.

**Checks.**
- `Ind.rank`: [Γ:H]·rank U; Ind 1 = permutation representation on H\Γ.
- `Ind.self`: Ind_Γ^Γ U ≅ U.
- `Ind.closed_infinite_index`: H = {0} ≤ Z_ℓ, U ≠ 0: not finitely generated.
- `Ind.invariants`; `Ind.compat_coind`.

Prove `Ind.continuous_of_equivariant`: Γ compact, H open, (U, σ) over A, finite right transversal (g_i)_{i∈I}: every f : Γ → U with f(hx) = σ(h)f(x) is continuous. Prove `Ind.evalTransversalHomeomorph`: on C_H(Γ, U) with the compact-open topology, f ↦ (f(g_i)) is an A-linear homeomorphism onto U^I. Prove `Ind.coindEquiv`: that topology is the module topology, and the identity identifies `ind H U` with `ContRepresentation.coind`. (BHKT, §10, Lemma 10.5, p. 56.) *Needs:* `ContinuousEvalConst`.

Prove `Ind.mackeyDecomposition`: H open, D closed, U over H: H\Γ/D is finite, and with D_s := D ∩ s⁻¹Hs (open in D) and U^s the representation y ↦ σ(sys⁻¹) of s⁻¹Hs, for any representatives s, Res_D Ind_H^Γ U ≅ ⊕_{HsD} Ind_{D_s}^D Res_{D_s} U^s as `ContinuousRep`s of D (summand at s: functions on HsD, d ↦ f(sd); changing s gives a canonical isomorphism); `TauCeti.Rep.mackeyDecomposition` gives the abstract isomorphism. (NT, proof of Lemma 3.7(3), p. 19.) *Needs:* `DoubleCoset.Quotient`; `TauCeti.Rep.mackeyDecomposition`.

Prove `Ind.det_ind`: H open of index m, U of constant rank r, sgn_{Γ/H} : Γ → {±1} ⊂ A^× the sign of the permutation action on H\Γ, Ver = `MonoidHom.transfer` to A^×: det(Ind_H^Γ U) = sgn_{Γ/H}^r·(det U ∘ Ver) as continuous characters; det Ind 1 = sgn_{Γ/H}. (Deligne 1973, §1, Prop. 1.2, p. 508.) *Needs:* `MonoidHom.transfer`, `Equiv.Perm.sign`.

### 1.4 Discrete coefficients and finite image

Prove `continuous_iff_isOpen_ker`: for A discrete and M finite projective, joint continuity iff all vector stabilisers are open iff ker ρ is open iff ρ factors through Γ/N, N open normal; the image is then finite. Prove `exists_finite_galois_factorisation`: for Γ = G_F, A discrete: joint continuity iff factorisation through Gal(L/F), L/F finite Galois inside F^sep. (DDT, §2.1, p. 53; Chenevier, Example 2.34, p. 39.) *Needs:* `TauCeti.Representation.isOpen_ker_of_finite`, `TauCeti.Field.absoluteGaloisGroup.exists_finiteDimensional_normal_fixingSubgroup_le`, `TauCeti.Field.absoluteGaloisGroup.finite_quotient_of_isOpen`.

Prove `TauCeti.eq_one_of_norm_sub_one_lt`: R a normed ring and normed ℝ-algebra, G ≤ R^× with sup_{g∈G}‖g − 1‖ < 1 ⇒ G = {1}; false p-adically. Hence `finite_range_of_complex`: a continuous homomorphism Γ → GL_n(ℂ) has open kernel and finite image. (DDT, §2.1, p. 53.) *Needs:* `NormedAlgebra`.

Prove `exists_finite_subfield_descent`: for continuous ρ : Γ → GL_n(F̄_p), n ≥ 1, ρ(Γ) is finite and the subfield k generated by its matrix entries is finite with ρ(Γ) ⊂ GL_n(k); so every n-dimensional V over F̄_p is V_k ⊗ F̄_p (any finite k′ ⊃ k works). (Serre 1987, 1.1, p. 180; DDT, §2.1, p. 53.) *Needs:* `IntermediateField.finiteDimensional_adjoin`.

### 1.5 Descent from Q̄_ℓ

Prove `PadicAlgCl.countable_coefficientFields`: the finite-degree intermediate fields Q_ℓ ⊂ E ⊂ Q̄_ℓ are countably many, each Q_ℓ(β) with β algebraic over Q, each closed in Q̄_ℓ, with union Q̄_ℓ. Prove `exists_coefficientField_descent`: for Γ compact Hausdorff, every continuous ρ : Γ → GL_n(Q̄_ℓ) has entries in a coefficient field E, containing any prescribed finite K/Q_ℓ. Prove `descent_qlbar`: every finite-dimensional V over Q̄_ℓ is V_E ⊗_E Q̄_ℓ; finitely many objects and maps descend to one E, descended maps equal over Q̄_ℓ agree over an enlargement, so the category over Q̄_ℓ is the filtered 2-colimit of those over coefficient fields. (BHKT, proof of Thm 4.8, p. 17; CG, §6.2, proof of Prop. 6.8, p. 839.) *Needs:* `nonempty_interior_of_iUnion_of_closed`.

### 1.6 Lattices and integral models

V is a finite-dimensional E-space with its module topology; a lattice is a finitely generated O_E-submodule spanning V. Prove `GaloisLattice.isCompact_isOpen_lattice`: every lattice is compact open, with compact open stabiliser GL(Λ) ≤ GL(V), equal to GL_n(O_E) in a lattice basis. Prove `GaloisLattice.exists_stable_lattice_iff_isCompact_closure`: K ≤ GL(V) stabilises a lattice iff its closure is compact; then Σ_{k∈K} kΛ is a finite sum of translates and a K-stable lattice. Prove `GaloisLattice.exists_stable_lattice`: a `ContinuousRep` of Γ on V has a stable lattice, in whose basis ρ is a continuous Γ → GL_n(O_E). (DDT, §2.1, p. 54; Ribet 1976, §2, p. 154; BHKT, Thm 4.8(ii), p. 16.) *Needs:* `IsNonarchimedeanLocalField.isCompact_closedBall`.

Define `GaloisLattice.IntegralModel` of V (dimension n): a Γ-stable lattice Λ; free of rank n, (Λ, ρ|_Λ) a `ContinuousRep` over O_E (ϖ-adic = subspace topology), E ⊗ Λ ≅ V. Homothety classes = ρ(Γ)-fixed vertices of the Bruhat–Tits building (ReductiveGroupsPartII RG2.2; comparison only). API: `toContinuousRep`, `genericFibreEquiv`, `smul` (cΛ, c ∈ E^×), `smul_smul`, `one_smul`, `instLattice` (sums, intersections), `exists`, `saturation` (W ∩ Λ), `dual` ({λ ∈ V^∨ : λ(Λ) ⊂ O_E}), `dual_dual`, `exists_pow_le` (ϖ^aΛ ≤ Λ′ ≤ ϖ^{−a}Λ). (DS, 6.12, p. 523; Ribet 1976, §2, p. 153.) *Needs:* `IsNonarchimedeanLocalField`.

**Checks.**
- `IntegralModel.rank_one_unique`: models of Q_ℓ(1) are ℓ^kZ_ℓ(1), k unique.
- `IntegralModel.zero`: V = 0 has only 0.
- `IntegralModel.not_unique`: (1 a; 0 1) on Q_ℓ²: Z_ℓ² and Z_ℓe₁ ⊕ ℓZ_ℓe₂ are non-homothetic.
- `IntegralModel.generic_fibre`; `IntegralModel.not_lattice_E`: V ≠ 0 is not a model.

### 1.7 Semisimplification and absolute irreducibility

Define `semisimplification` for V over a topological field k: Γ-stable subspaces (subspace = module topology) and quotients are `ContinuousRep`s; V has a composition series with irreducible (`Representation.IsIrreducible`) quotients, and V^ss := ⊕ V_i/V_{i−1} is semisimple with class independent of the series (Jordan–Hölder). Everything holds for the underlying `Representation` of any monoid over any field. API: `subrep`, `compositionFactors` (= `TauCeti.jordanHolderMultiplicity`), `ss_iso_self_iff` (`IsSemisimpleRepresentation`; (V^ss)^ss ≅ V^ss), `ss_exact` (W^ss ⊕ (V/W)^ss), `charpoly_ss`, `det_ss`, `ss_baseChange` ((V ⊗ k′)^ss ≅ (V^ss ⊗ k′)^ss; k perfect ⇒ V^ss ⊗ k′ semisimple). (DDT, §2.1, p. 54; DS, 6.12, p. 523.) *Needs:* `CompositionSeries.jordan_holder`; `TauCeti.jordanHolderMultiplicity`, `TauCeti.compositionMultiplicity_eq_of_head_eq_of_last_eq`, `TauCeti.jordanHolderMultiplicity_eq_add_of_exact`.

**Checks.**
- `ss_unipotent`: Z_p on F_p² by (1 a; 0 1): V^ss ≅ 1 ⊕ 1 ≇ V.
- `ss_irreducible`: V irreducible ⇒ V^ss ≅ V; 0^ss = 0.
- `ss_not_socle_sum`: 3-dimensional Jordan block of Z_p over F_p (p ≥ 3): soc(V) ⊕ V/soc(V) not semisimple.
- `charpoly_ss`; `ss_exact`.

Prove `Representation.isSemisimple_baseChange_of_perfectField`: k perfect, k′/k any extension, Γ a monoid, V finite-dimensional semisimple ⇒ V ⊗_k k′ semisimple (equivalently B ⊗_k k′ semisimple for finite-dimensional semisimple B); false for imperfect k. (NT, §1.2, p. 7.) *Needs:* `IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`.

Define `IsAbsolutelyIrreducible` for V ≠ 0 over a field k: V ⊗_k AlgebraicClosure k irreducible (no topology on k̄); equivalently V ⊗ k′ irreducible for all k′/k, or the k-span of ρ(Γ) is End_k(V) (Burnside), or V irreducible with End_Γ(V) = k. Valid for any monoid, no topology. API: `isAbsolutelyIrreducible_iff_span`, `isAbsolutelyIrreducible_baseChange_iff` (invariant under every k ⊂ k′), `IsAbsolutelyIrreducible.isIrreducible`, `IsAbsolutelyIrreducible.end_eq_scalars`, `isAbsolutelyIrreducible_of_finrank_one`. (Serre 1987, 1.1, p. 180; CG, §4, p. 812.) *Needs:* `jacobson_density`; `TauCeti.Representation.asAlgebraHom_surjective_of_isIrreducible`, `TauCeti.Representation.isIrreducible_of_asAlgebraHom_surjective`.

**Checks.**
- `absIrr_rank_one`: dimension one.
- `not_absIrr_zero`: 0 is neither.
- `rotation_not_absIrr`: Z/4 rotating Q²; F_{p²}^× on F_p²: irreducible, not absolutely.
- `absIrr_baseChange_iff`; `absIrr_iff_span`.

### 1.8 Brauer–Nesbitt

For k algebraically closed, Γ a monoid, finite-dimensional representations: prove `Representation.surjective_pi_end_of_simple` (k[Γ] → ∏ End_k(T_j) surjective for pairwise non-isomorphic simple T_j); `Representation.jordanHolderMultiplicity_cast_eq_of_trace_eq` (semisimple ρ₁, ρ₂ with equal traces have multiplicities a_T, b_T of each simple T with (a_T : k) = (b_T : k): equal in characteristic 0, congruent mod p in characteristic p); `Representation.iso_of_charpoly_eq_of_isAlgClosed` (semisimple with equal characteristic polynomials at every g ⇒ isomorphic, any characteristic). Prove `Representation.ss_iso_of_ss_baseChange_iso`: k any field, k′ ⊇ k any extension, V, W finite-dimensional: (V ⊗ k′)^ss ≅ (W ⊗ k′)^ss ⇒ V^ss ≅ W^ss. (DDT, proof of Prop. 2.6, p. 54; Chenevier, end of proof of Thm 2.12, p. 31; NT, §1.2, p. 7; DS, proof of Lemme 6.13, p. 523.) *Needs:* `Matrix.trace_eq_neg_charpoly_coeff`.

Prove `brauerNesbitt`: k any field, Γ any group or monoid, V, W finite-dimensional with charpoly ρ_V(g) = charpoly ρ_W(g) for every g ∈ Γ (not only generators) ⇒ V^ss ≅ W^ss; semisimple V, W are isomorphic, continuously for `ContinuousRep`s. Prove `Representation.brauerNesbitt_trace`: d! invertible in k, V, W semisimple of dimension d with equal traces ⇒ V ≅ W (in general V^ss ≅ W^ss), continuously. Prove `Representation.brauerNesbitt_trace_two_F2`: Γ a group, k = F₂, d = 2: equal traces still give V ≅ W. (DDT, Prop. 2.6, pp. 53–54; Ribet 1976, §2, p. 154; DS, proof of Lemme 6.13, p. 523.) *Needs:* `LinearMap.charpoly_baseChange`.

### 1.9 Reduction and the residual representation

With O = {‖x‖ ≤ 1}, 𝔪 = {‖x‖ < 1} in Q̄_ℓ, κ = O/𝔪: prove `PadicAlgCl.residueField_isAlgClosed` (κ is an algebraic closure of F_ℓ, ≅ `AlgebraicClosure (ZMod ℓ)` noncanonically); `PadicAlgCl.rootsOfUnityReductionEquiv` (m prime to ℓ: μ_m(Q̄_ℓ) ≅ μ_m(κ)); `PadicAlgCl.residueField_coefficientFields_cover` (k_E ↪ κ for each E, images covering κ; the q-element subfield lies in k_E for E = Q_ℓ(μ_{q−1})). (NT, §1.2, p. 7.) *Needs:* `PadicAlgCl.isNonarchimedean`.

Define `reduceLocal`: for (M, ρ) over a topological local ring A with open maximal ideal (k_A discrete), M ⊗_A k_A over k_A, charpoly and det reduced mod m_A. Define `IntegralModel.reduction`: ρ̄_Λ := Λ/ϖΛ over k_E, of finite image, ρ mod ϖ in a lattice basis; `IntegralModel.residualSS` := ρ̄_Λ^ss; for V over Q̄_ℓ, `ContinuousRep.residual V` := (ρ̄_Λ ⊗_{k_E} F̄_ℓ)^ss over F̄_ℓ = κ, after a descent (1.5) and a model. API: `charpoly_reduction`, `reduction_baseChange`, `reduction_tensor` (commutes with ⊕, ⊗, ∨, twists, res), `finite_image_reduction`. (DS, 6.12, p. 523; Ribet 1976, §2, p. 154; BHKT, Def. 4.9, p. 17.) *Needs:* `IsLocalRing`.

**Checks.**
- `GaloisLattice.reduction_cyclotomic`: Z_ℓ(1) ↦ the mod ℓ cyclotomic character.
- `GaloisLattice.reduction_zero`: 0 ↦ 0; trivial O_E^n ↦ trivial.
- `GaloisLattice.reduction_depends_on_lattice`: (1 a; 0 1) on Q_ℓ²: Z_ℓ² and Z_ℓe₁ ⊕ ℓZ_ℓe₂ reduce non-isomorphically.
- `GaloisLattice.charpoly_reduction`; `det_reduction`: det ρ mod ϖ.

Prove `GaloisLattice.residualSS_independent_of_lattice`: for two models Λ, Λ′ of V over E, (Λ/ϖΛ)^ss ≅ (Λ′/ϖΛ′)^ss over k_E. Prove `GaloisLattice.residual_well_defined`: for V over Q̄_ℓ the class of ((Λ/ϖΛ) ⊗_{k_E} κ)^ss is independent of E, of the descent and of Λ. Prove `GaloisLattice.residual_properties`: the residual representation is continuous, semisimple, of finite image, defined over a finite field; its characteristic polynomial at each g is the reduction of V's, and its class is determined by these (1.8). (DS, 6.12, p. 523; DDT, §2.1, p. 54; Ribet 1976, §2, p. 154; NT, §1.2, p. 7; Serre 1987, 1.1, p. 180.) *Needs:* `TauCeti.jordanHolderMultiplicity_eq_add_of_exact`.

### 1.10 Coefficient twists and Teichmüller lifts

Define `coeffTwist σ ρ` := baseChange σ ρ for a continuous ring automorphism σ of A (framed: σ entrywise). For A = F̄_p or finite and σ = `frobeniusEquiv`, ρ̄^{(p)} := ρ̄^{Frob_p}, equal to ρ̄ over F_p. For γ ∈ G_{Q_ℓ} and V over Q̄_ℓ with descent V_E and model Λ, γ(Λ) is a model of V^γ over O_{γE} and residual(V^γ) ≅ residual(V)^{γ̄} for γ̄ the image of γ in Gal(F̄_ℓ/F_ℓ): inertia I_{Q_ℓ} fixes the residual class and any arithmetic Frobenius lift sends it to ρ̄^{(ℓ)}. This twists coefficients, not the base field. API: `coeffTwist_apply`, `coeffTwist_comp`, `coeffTwist_id`, `charpoly_coeffTwist` (charpoly, det by σ; commutes with all operations), `frobTwist`, `residual_coeffTwist`, `residual_coeffTwist_of_mem_inertia`, `residual_coeffTwist_frobeniusLift`. (NT, display (1.1), p. 3, and proof of Lemma 5.8, p. 43; DS, proof of Lemme 6.13, p. 523.) *Needs:* `frobeniusEquiv`; `TauCetiRoadmap.LocalFieldsRamification` layers 2 and 4 (I_{Q_ℓ}, Frobenius lifts).

**Checks.**
- `frobTwist_order`: χ̄ : Γ → F_{p²}^× of order p² − 1 twists to χ̄^p ≠ χ̄.
- `frobTwist_Fp`: over F_p, ρ̄^{(p)} = ρ̄; coeffTwist id ρ = ρ.
- `frobTwist_ne_conj`: for such χ̄ on G_Q via (Z/N)^×, Frobenius conjugation fixes χ̄ but the twist gives χ̄^p.
- `charpoly_coeffTwist`; `residual_coeffTwist_inertia`.

Define `Teichmuller.lift ψ̄` := `TauCeti.teichmuller E` ∘ ψ̄ for continuous ψ̄ : Γ → k_E^× (|k_E| = q): a continuous character Γ → O_E^× of the same finite order (dividing q − 1), reducing to ψ̄, the unique lift valued in μ_{q−1}(O_E) (equivalently of finite order prime to ℓ); for ψ̄ : Γ → F̄_ℓ^×, defined through any finite subfield containing the image (1.4), valued in Q̄_ℓ^×. Example: ω := [χ_p mod p]; for p odd, χ_p = ω·⟨χ_p⟩ with ⟨χ_p⟩ valued in 1 + pZ_p. API: `residue_lift`, `lift_mul`, `lift_one`, `lift_inv`, `eq_lift` (uniqueness), `lift_baseChange` (independent of E), `orderOf_lift`. (Khare–Wintenberger 2009 (I), §1.5, p. 4; Dieulefait–Pacetti, arXiv:2108.07577v2, §1, Remark 2, p. 5.) *Needs:* `TauCeti.teichmuller`, `TauCeti.residue_teichmuller`, `TauCeti.teichmuller_pow`, `TauCeti.eq_teichmuller`, `TauCeti.teichmuller_injective`.

**Checks.**
- `Teichmuller.cyclotomic`: [χ_p mod p] on G_Q has order p − 1, reduces to χ_p mod p.
- `Teichmuller.trivial`: [1] = 1.
- `Teichmuller.not_cyclotomic_itself`: χ_p lifts χ_p mod p but has infinite order.
- `Teichmuller.baseChange`; `Teichmuller.unique`.

### 1.11 Uniqueness of lattices and symplectic models

Ribet's lemma, that a two-dimensional representation over a coefficient field E which is irreducible over E, stabilises a lattice and has reducible residual semisimplification φ₁ ⊕ φ₂ admits a stable lattice whose reduction is a nonsplit extension of φ₂ by φ₁ (and one with the roles exchanged), is IntegralHeckeAndGaloisDeterminants `ribet_lattice` (Ribet 1976, Prop. 2.1, pp. 154–155) and is not restated.

Prove `GaloisLattice.integralModel_unique_of_irreducible_residual`: V over E with irreducible residual representation over k_E ⇒ all models are ϖ^jΛ₀. Prove `GaloisLattice.exists_selfDual_integralModel`: same hypothesis, a perfect symmetric or alternating E-pairing with ⟨ρ(g)x, ρ(g)y⟩ = μ(g)⟨x, y⟩, μ : Γ → E^× continuous ⇒ μ is O_E^×-valued and some model is self-dual for c⟨,⟩, c ∈ {1, ϖ}. Prove `GaloisLattice.exists_integral_symplectic_model`: E/Q_ℓ finite, B nondegenerate alternating with continuous multiplier μ, irreducible residual representation ⇒ dim V = 2g, after scaling B by an element of E^× the self-dual model has an O_E-symplectic basis, so in a B-symplectic frame ρ is GSp_{2g}(E)-conjugate to a continuous GSp_{2g}(O_E)-valued representation with multiplier μ. (CG, §6.2, proof of Prop. 6.8, p. 839; §6.3, proof of Thm 6.13, p. 843.) *Needs:* `Submodule.le_of_le_smul_of_le_jacobson_bot`; Layer 7 (GSp_{2g}).

### 1.12 Restriction and induction

Let k be a field, H ≤ Γ open with open normal core N, all representations finite-dimensional `ContinuousRep`s over k. Prove `isSemisimple_res_of_normal` (H normal, V semisimple ⇒ Res_H V semisimple, any characteristic); `clifford_isotypic` (H normal, V irreducible ⇒ Res_H V ≅ (W₁ ⊕ ⋯ ⊕ W_t)^{⊕e}, the W_i the distinct Γ-conjugates of any simple constituent, equal multiplicities, t the index of the open class stabiliser); `isSemisimple_of_isSemisimple_res` ([Γ:H] invertible in k, Res_H V semisimple ⇒ V semisimple); `isSemisimple_res_of_index_invertible` ([H:N] invertible in k, V semisimple ⇒ Res_H V semisimple); `isSemisimple_ind` ([Γ:N] invertible in k, U semisimple over H ⇒ Ind_H^Γ U semisimple). (Clozel–Harris–Taylor 2008, §2.4.4, p. 41; Boxer–Calegari–Gee–Pilloni 2025, Lemma 10.2.3, p. 212; DDT, §2.1, p. 53.) *Needs:* `TauCeti.Representation.isSemisimpleRepresentation_comp_subtype`.

### Dependencies

Mathlib; Tau Ceti; `TauCetiRoadmap.LocalFieldsRamification` layers 2 and 4; ReductiveGroupsPartII RG2.2; IntegralHeckeAndGaloisDeterminants IHG.1; Layer 7 (GSp_{2g}). Integral models and the Ĝ-completely reducible residual representation of a continuous ρ : Γ → Ĝ(Q̄_ℓ), Ĝ split reductive (GL_n case: 1.9), are IntegralHeckeAndGaloisDeterminants `reductive_integral_model`, not restated here.

## Layer 2: decomposition groups, inertia and Weil–Deligne representations

F is a number field, G_F = `Field.absoluteGaloisGroup F`, v a finite place, F_v its completion, k_v its residue field, q_v = #k_v, p = char k_v; K a nonarchimedean local field with G_K ⊃ I_K ⊃ P_K (Tau Ceti's `inertiaSubgroup`, `wildInertiaSubgroup`, not redefined) and Weil group W_K with `weilDegree` (kernel I_K; an ARITHMETIC Frobenius lift Φ, Tau Ceti's `IsArithFrobeniusLift`, has degree 1; F = Φ^-1 is geometric); l ≠ p. Representations are those of Layer 1 (finite projective carrier, module topology, joint continuity). WD = Weil-Deligne; LFR, CFT, NFA = `TauCetiRoadmap.LocalFieldsRamification`, `TauCetiRoadmap.ClassFieldTheory`, `TauCetiRoadmap.NumberFieldArithmetic`.

### 2.1 Decomposition groups

Prove `adjoin_globalClosure_eq_top`: for ι : F̄ → F̄_v over F → F_v, F̄_v = F_v·ι(F̄); so an F_v-automorphism fixing ι(F̄) is 1 and each finite extension of F_v in F̄_v is F_v(ι(β)), β ∈ F̄. (Deligne 1973, 3.12, p. 533.) *Needs:* Mathlib `IsKrasner.krasner`.

Define, for a maximal ideal w of O_{F̄} above v, `decompositionGroup` D_w = `MulAction.stabilizer` G_F w, `inertiaGroup` I_w = `Ideal.inertia` G_F w, `wildInertiaGroup` P_w (largest closed normal pro-p subgroup of I_w), `instMulSemiringActionAbsoluteGaloisGroup`, `localEmbeddingMap` ι* = `Field.absoluteGaloisGroup.mapOfAlgebra` along ι : F̄ → F̄_v (τ ↦ ι^-1τι), a closed embedding onto D_{w(ι)} carrying I_K, P_K, Frobenius lifts to I_w, P_w, lifts at w, with (ι∘σ)* = σ^-1ι*σ, (τ_0∘ι)* = ι*∘conj τ_0^-1, D_{σw} = σD_wσ^-1, D_w/I_w ≃ Gal(k̄_v/k_v); lifts `IsArithFrobAt O_F σ w` form one I_w-coset. API: `range_localEmbeddingMap`, `map_inertia_localEmbeddingMap`, `localEmbeddingMap_comp`, `decompositionGroup_smul`, `exists_isArithFrobAt`, `decompositionGroup_quotient_inertia`, `restrict_decompositionGroup` (`decompositionHom`), `complexConjugation` (real place: order 2, c_{ι∘σ} = σ^-1c_ισ). (Deligne 1973, 3.12, p. 533; Calegari-Geraghty 2018, p. 306.) *Needs:* Mathlib `ValuationSubring.inertiaSubgroup`; LFR layer 4; NFA layers 2, 5.

**Checks.**
- `{decompositionGroup, inertiaGroup}_gaussian`: Q(i): D_w trivial iff p ≡ 1 (4); I_w ≠ 1 iff p = 2.
- `decompositionGroup_not_normal`: p = 5, Q(∛2, ζ_3): order-2 image in S_3.
- `localEmbeddingMap_eq_map`: `Field.absoluteGaloisGroup.map` for `IsAlgClosed.lift`.
- `isArithFrobAt_mul_inv_mem_inertiaGroup`: lifts differ by I_w; geometric ≠ arithmetic.

Define `localRestriction` ρ_ι = ρ∘ι* (real place: D = {1, c_ι}); ρ(σ) : ρ_{ι∘σ} ≅ ρ_ι and ρ_ι(τ_0) : ρ_{τ_0∘ι} ≅ ρ_ι, so ρ_ι ≅ ρ_{ι'} by ρ(ι^-1ι'), not the identity. API: `localRestrictionIsoOf{Conj, Local}`, `nonempty_localRestriction_iso`, `localRestriction_{tensor, restrict, induced, kernelField}` (Mackey over w | v; finite image: Gal(K_{ρ,𝔭}/F_v) ↪ Aut M, inertia onto ρ(I_w), ρ(P_w)). (Deligne 1973, 3.12, p. 533.) *Needs:* Layer 1.

**Checks.**
- `localRestriction_{cyclotomic, trivial}`: (χ_l)_ι(Frob) = p; trivial.
- `localRestriction_induced_gaussian`: Ind from Q(i): 1 ⊕ 1 (p ≡ 1 (4)); 1 ⊕ η (2 invertible) or Ind_{Q_{p^2}}1.
- `localRestriction_{iso_not_canonical, depends_on_embedding}`: ρ(c) swaps summands though ρ_ι = ρ_{ι∘c}; S_3, p = 5: ρ_{ι∘σ} ≠ ρ_ι.

### 2.2 Ramification and Frobenius

Define `IsUnramified` (ρ(I_K) = 1; `isUnramified_iff_inertia_le_ker`), `IsTamelyRamified` (ρ(P_K) = 1), `IsUnramifiedAt` v (ρ(I_w) = 1 for one/every w | v; `isUnramifiedAt_iff_{forall, exists}`), `ramificationSet` (`ramificationSetAway` p), `IsUnramifiedOutside` S (closed ker ρ: factors through G_{F,S}). API: `finite_ramificationSet_of_finite_image` (open kernel: `NumberField.Chebotarev.ramifiedPrimes`), `ramificationSet_{tensor, restrict_induced}`, `isUnramifiedAt_reduction` (not conversely). (Deligne 1973, 2.3, p. 523; Calegari-Geraghty 2020, §4, p. 813.) *Needs:* `TauCeti.Ideal.isUnramifiedAt_iff_inertia_eq_bot`; CFT layer 9.

**Checks.**
- `ramificationSet_{cyclotomic, dirichlet, trivial}`: {l}; {2} (ε mod 4); ∅.
- `isUnramifiedAt_not_of_reduction`: Tate curve, l | v(q): ρ̄ unramified, ρ not.
- `isUnramifiedAt_iff_kernelField`: agrees with `Ideal.isUnramifiedAt_iff_inertia_eq_bot`.

Define `frobCharpoly` P_v(ρ, X) = `LinearMap.charpoly` ρ(Frob_w) (M free of rank n, ρ unramified at v, Frob_w any ARITHMETIC lift at any w | v); P_v(ρ^∨) is the geometric polynomial. API: `frobCharpoly_{eq_charpoly, monic, dual, directSum, twist, map, restrict}` (twist: χ(Frob_v)^n P_v(ρ, χ(Frob_v)^-1X); over L: ρ(Frob_w)^f), `localEulerFactor_eq_reverse_frobCharpoly_dual`. (Calegari-Geraghty 2018, p. 306; Deligne 1973, 2.2.3, p. 522.)

**Checks.**
- `frobCharpoly_{cyclotomic, dirichlet, trivial}`: X - p; X - ε(p); (X - 1)^n.
- `frobCharpoly_cyclotomic_not_geometric`: geometric Frobenius gives X - p^-1.
- `frobCharpoly_semisimplification`: P_v(ρ) = P_v(ρ^ss).

Define `unramifiedCharacter` λ(α) : G_K → R^× (R Hausdorff, α ∈ R^×): trivial on I_K, Frob ↦ α, when it exists, i.e. when n ↦ α^n extends continuously to Ẑ (α ∈ O_E^× for E/Q_l; a root of unity for C; not for Z_l ∩ Q̄, α = 1 + l). API: `unramifiedCharacter_{frob, unique, mul, map, restrict}`, `exists_unramifiedCharacter_iff`, `unramifiedCharacterGeom` (λ(γ^-1)), `weilUnramifiedCharacter` (α^{weilDegree w} on W_K, always). (Calegari-Geraghty 2018, pp. 7-8; Calegari-Geraghty 2020, §2, p. 807.) *Needs:* Mathlib `ProfiniteGrp.ProfiniteCompletion.lift`; LFR layer 2.

**Checks.**
- `unramifiedCharacter_q_eq_cyclotomic`: λ(q) = χ_l|_{G_K}; `unramifiedCharacterGeom_frob`: λ^geom(q)(Φ) = q^-1.
- `unramifiedCharacter_{one, reduction}`: λ(1) = 1; λ(α) mod l = λ(α mod l).
- `not_exists_unramifiedCharacter_ell`: no continuous λ(l) into Q_l^×.

### 2.3 Characters of inertia

χ_l : G_F → Z_l^× (char F ≠ l) is Mathlib's `cyclotomicCharacter`, locally Tau Ceti's `localCyclotomicCharacter` (not redefined); χ_l(Φ) = q, so χ_l|_{G_K} = λ(q). Define `dirichletCharacterToGalois` ε_Gal = ε∘`galEquivZMod`∘(G_Q → Gal(Q(ζ_N)/Q)), with ε_Gal(Frob_p) = ε(p), ε_Gal(c) = ε(-1). API: `cyclotomicCharacter_{spec, frob, restrict}`, `dirichletCharacterToGalois_{frob, complexConjugation, changeLevel}`, `exists_dirichletCharacter_of_finite_order` (open kernel ⇒ ε_Gal, ε primitive unique; automatic for R a domain, not F_2[[t]][η]/(η^2)), `cyclotomicCharacter_eq_teichmuller_mul` (χ_p = ω_p⟨χ_p⟩, mod 4 if p = 2). (Deligne 1973, 2.3, p. 523; Calegari-Geraghty 2020 arXiv v1, §2, p. 5.) *Needs:* `TauCeti.teichmuller`; Layer 1 (Teichmüller lift); CFT layer 13.

**Checks.**
- `cyclotomicCharacter_frob_rat`: χ_l(Frob_p) = p; `dirichletCharacterToGalois_{chi4, one}`: Frob_5 ↦ 1, Frob_3 ↦ -1, c ↦ -1; trivial.
- `cyclotomicCharacter_ramified_at_ell`: χ_l(I_l) = Z_l^×.
- `cyclotomicCharacter_eq_galEquivZMod`: mod l^n it is `galEquivZMod`.

`tameCharacter` t_l : I_K → Z_l(1), the l-component of I_K/P_K ≅ Ẑ^{(p')}(1), is Tau Ceti's `inertiaPadicTameCharacter` (`inertiaTameCharacter`, `quotientWildInertiaSubgroupEquiv`; not redefined): t_l mod l^n = σ(π^{1/l^n})/π^{1/l^n}, t_l(wσw^-1) = χ_l(w)t_lσ (witness: α = π^{1/l^n}, w^-1α = ζα, σα = ζ_σα give wσw^-1α = ζ_σ^{χ_l(w)}α; Φ scales by q). Prove `tameCharacter_{surjective, apply_uniformizer, conj, factor_of_proEll, restrict, eq_tame}` (open J ≤ I_K → pro-l factors through t_l; e·t_{l,L}); define `tameCharacterTriv` (T∘t_l; `tameCharacterTriv_smul`). (Deligne 1973, 2.2.2(b), pp. 521-522; Fresán-Sabbah-Yu 2022, §5.3.1, p. 54.)

**Checks.**
- `tameCharacter_{mod_ell_Qp, wild, restrict_ramified}`: σ(p^{1/l})/p^{1/l}; 0 on P_K; K(π^{1/e}), p ∤ e.
- `tameCharacter_not_extend`: no extension to G_K (Frobenius multiplies by q ≠ 1).
- `unique_quotient_order_ell`: every I_K → Z/l is a unit multiple of t_l mod l.

Define `fundamentalCharacter` θ_{p^n-1} : I_t → F_{p^n}^× (I_t = I_K/P_K; Kummer character of π^{1/(p^n-1)}, reduced), `IsFundamentalOfLevel` n, `level` (`level_dvd_iff_factors`), `teichmullerFundamentalCharacter`; θ(sus^-1) = θ(u)^{#k} for s arithmetic, θ_{p-1}^e = χ̄_p|_{I_K} (witness over Q_p: ζ_p - 1 ≡ α := (-p)^{1/(p-1)} to first order, so σα/α ≡ χ_p(σ) mod 𝔪: χ̄_p, not its inverse), ω_2ω_2^p = ω (θ_{p²-1}^{(p²-1)/(p-1)} = θ_{p-1}, exponent p+1). API: `fundamentalCharacter_{indep, norm, conj, one_eq_cyclotomic, two_mul_pow, restrict}`. (Serre 1987, 2.1, p. 183; Serre 1972, 1.3 Prop. 2, p. 264, 1.7, p. 267, 1.8 Prop. 8, p. 269; Khare-Wintenberger 2009 I, 1.5, p. 4.) *Needs:* `TauCeti.rootsOfUnityEquivResidueFieldUnits`, `TauCeti.residue_teichmuller`.

**Checks.**
- `fundamentalCharacter_{two_mul_conj, one_Qp}`: ω_2^{p+1} = ω; θ_{p-1} = χ̄_p|_I; `level_trivial`: 1.
- `fundamentalCharacter_two_not_extend`: ω_2 extends to G_{Q_{p^2}}, not to G_{Q_p}.
- `fundamentalCharacter_teichmuller`: the lift reduces to θ.

Prove `wildInertia_trivial_of_semisimple`, `level_two_iff_irreducible`: k_1 a discrete field of characteristic p, ρ̄ : G_K → GL(V) continuous, V finite-dimensional: semisimple ρ̄ kills P_K, and I_K acts on V^ss through I_t by a #k-power-stable multiset of products of fundamental characters; for K = Q_p, dim 2, k_1 = F̄_p the inertia characters have level 1 or 2 (then conjugate, φ' = φ^p), level 2 iff irreducible, and for χ : G_{Q_{p^2}} → F̄_p^× with χ|_I = ω_2^j, Ind χ has inertia characters ω_2^j, ω_2^{pj}, is irreducible iff (p+1) ∤ j (every irreducible ρ̄ arises so), and for (p+1) | j is χ̃ ⊕ χ̃η (p odd) or a non-split self-extension of χ̃ (p = 2). (Serre 1972, 1.6 Prop. 4, p. 265; Serre 1987, 2.1 Prop. 1, 2.2, p. 183.)

### 2.4 Weil-Deligne representations

Prove `IsUnipotent.{log_exp, exp_log}`: in a Q-algebra, `IsNilpotent.exp` and log u = Σ(-1)^{i+1}(u-1)^i/i are inverse bijections nilpotent ↔ unipotent, natural for ring maps; exp(mN) = exp(N)^m; exp(m^-1log u) is the unique unipotent m-th root; continuous h : Z_l → GL(V) with h(1) unipotent is x ↦ exp(x log h(1)). (Deligne 1973, Thm 8.2, p. 566.)

Prove `grothendieck_monodromy`: ρ : W_K → GL(V) continuous (Weil and l-adic topologies), V finite-dimensional over E/Q_l finite, k = F_q: unique nilpotent N ∈ Hom(Z_l(1), End V) and open J ⊂ I_K with ρ(σ) = exp(N(t_lσ)) on J; ρ(w)N(x)ρ(w)^-1 = N(χ_l(w)x), so N' = N(T^-1 1) has ρ(Φ)N'ρ(Φ)^-1 = qN'. ρ(I_K) finite iff N = 0; N_L = e·N_K. (Deligne 1973, 8.1, Thm 8.2, p. 566; Fresán-Sabbah-Yu 2022, §5.3.1, p. 54.) *Needs:* Layer 1 (lattices, Baire descent).

Define `WeilDeligneRep` over a field Ω (any field in Lean; char 0 is a hypothesis of `iso_smul_monodromy`, `ofEllAdic`; perfect for 2.5's Jordan decomposition): (V, r, N), V finite-dimensional, r : W_K → GL(V) with open kernel on I_K, N nilpotent, r(w)Nr(w)^-1 = q^{weilDegree w}N (so r(Φ)Nr(Φ)^-1 = qN); tensor monodromy N⊗1 + 1⊗N', dual -N^∨, det (det r, 0), induced N_Ind(g⊗v) = q^{-deg g}g⊗Nv, ω(w) = q^{weilDegree w} (Deligne's ‖·‖), Sp(n): r e_i = ω^i e_i, N e_i = e_{i+1} (witness: r(Φ)Nr(Φ)^-1 e_i = q^{-i}q^{i+1}e_{i+1} = qNe_i); (V, r, N) ≅ (V, r, aN) for a ∈ Ω^× when char Ω = 0, q ≥ 2 and r(I_K) is finite. API: `Hom`, `conj_monodromy_{arith, geom}`, `tensor`, `dual`, `twist`, `omega`, `special`, `restrict`, `induced`, `iso_smul_monodromy`, `inertialType`, `baseChange`. (Deligne 1973, 8.4.1, p. 568; proof of 8.4.3, p. 569; 2.2.4, p. 522.) *Needs:* Mathlib `Representation`.

**Checks.**
- `special_two_relation`: Sp(2) obeys qN; `geometric_copy_fails`: (ω ⊕ 1, Ne_0 = e_1) obeys q^-1N.
- `monodromy_zero`: N = 0 ↔ Weil representation; `iso_smul_monodromy_special`: N ≅ 2N on Sp(2).
- `iso_smul_monodromy_not_q_one`: q = 1, r(F) = 1 + N, N ≠ 0: nothing commuting with r rescales N.
- `dual_special_two`: Sp(2)^∨ ≅ Sp(2) ⊗ ω^-1, det = ω.

Define `ofEllAdic` WD_{F,T}(ρ) = (V, ρ', T(N)), ρ'(F^nσ) = ρ(F^nσ)exp(-t_l(σ)N), F geometric, T : Q_l(1) ≅ Q_l; F ↦ Fτ conjugates by exp((q-1)^-1t_l(τ)N) (τF: (1-q^-1)^-1; q - 1 ≠ 0 as q ≥ 2 is part of `IsTameCharacter`, which also encodes l ≠ p), T ↦ aT gives N'/a (a ∈ Z_l^× in Lean, Q_l^× in the roadmap); V^{ρ(I)} = (ker N')^{ρ'(I)}; N' = 0 iff ρ(I_K) finite; exact, faithful, bijective on classes (G_K ↔ unit Frobenius eigenvalues). API: `ofEllAdic_{monodromy, iso_frobenius, iso_triv, tensor, restrict, induced, invariants, monodromy_eq_zero_iff, semisimple, bijective}`. Inverse `toEllAdic`: ρ(F^nσ) = r(F^nσ)exp(T(t_lσ)N'), the unique continuous representation with monodromy T^-1N' and ρ' = r; maps commute with ρ iff with r and N'. (Deligne 1973, 8.4.2, 8.4.3, p. 569; 8.3.7, p. 568.)

**Checks.**
- `ofEllAdic_{cyclotomic, unramified, finite_image}`: (ω, 0); N = 0, ρ' = ρ.
- `ofEllAdic_tateCurve`: Sp(2); Sp(2) ⊗ η for the non-split twist.
- `ofEllAdic_not_semisimplification`: WD(V_lE_q) ≠ (1 ⊕ ω, 0).
- `ofEllAdic_not_ell_eq_p`: l = p, ρ = χ_p on G_{Q_p}: χ_p(J) is infinite, not unipotent, for every open J ⊂ I: no N (`grothendieck_monodromy` needs l ≠ p).

### 2.5 Local factors

Define `frobeniusSemisimplification` (V, r^F-ss, N), r^F-ss(F^nσ) = r(F^nσ)u^-n, r(F) = su the Jordan decomposition (Ω perfect; independent of F when r(I_K) is finite, automatic for W_K; N kept); `IsFrobeniusSemisimple`; `semisimplification` (V^ss, r^ss, 0). API: `frobeniusSemisimplification_{indep, frob, monodromy, idem, tensor}`, `charpoly_frobeniusSemisimplification`, `indecomposable_iso_tensor_special` (Ω algebraically closed, q ≥ 2: an F-SEMISIMPLE indecomposable is r_0 ⊗ Sp(n), r_0 irreducible, unique). (Deligne 1973, 8.5, 8.6, p. 570.) *Needs:* `TauCeti.LinearMap.GeneralLinearGroup.jordanDecomposition`.

**Checks.**
- `frobeniusSemisimplification_{jordan, eq_jordanDecomposition}`: r(F) = [[1,1],[0,1]] ↦ 1^2; = `semisimplePart`.
- `frobeniusSemisimplification_special`: Sp(n) fixed; `special_not_semisimple`: Sp(2) ≇ (1 ⊕ ω, 0).
- `three_objects_differ`: Sp(2) ⊕ Jordan block: three distinct objects.
- `indecomposable_not_of_jordan`: (r(F) = [[1,1],[0,1]], N = 0) is indecomposable and not r_0 ⊗ Sp(n); `frobeniusSemisimplification_not_imperfect`: Ω = F_p(t), minimal polynomial (X^p - t)^2: no Jordan decomposition.

Define `localFactor` L(V, X) = det(1 - X r(Φ^-1) | (ker N)^{r(I_K)}) (GEOMETRIC Frobenius), `GaloisRep.localEulerFactor` on V^{ρ(I_K)}, L_v(ρ, X) = L(ρ|_{G_{F_v}}, X) for v ∤ l; L_v(V_lA^∨, X) = det(1 - X Frob_v | (V_lA)_{I_v}); L(V ⊗ λ_W(α), X) = L(V, α^-1X); multiplicative in exact sequences only for N = 0. API: `localFactor_{indep, directSum, iso, unramified_twist, exact_monodromy_zero}`, `localEulerFactor_{eq_localFactor, unramified}`. (Deligne 1973, 3.5.1, p. 528; 8.12, p. 572.)

**Checks.**
- `localFactor_{omega, special_two, zero}`: 1 - q^-1X; 1 - q^-1X, dual 1 - X; L(0) = 1, L(1) = 1 - X.
- `localFactor_special_not_invariants`: V^I or arithmetic Frobenius is wrong.
- `localFactor_not_exact`: L(Sp(2)) ≠ L(ω)L(1).

Prove `det_one_sub_cyclicBlock`: A commutative, V finite free, φ ∈ End V: the cyclic block φ_n on V^n has det(1 - Xφ_n) = det(1 - X^nφ) (Deligne 1973, 3.9, p. 531); `induced_inertiaInvariants_equiv`: L/K finite separable of residue degree f, V a W_L-representation over any field: (Ind V)^{I_K} ≅ (V^{I_L})^f via φ ↦ (φ(F_K^{f-1}), …, φ(1)), carrying F_K to the cyclic block of F_L; ker N_Ind = Ind(ker N) (Deligne 1973, proof of 3.8(ii), p. 530); `localFactor_induced`, `localEulerFactor_induced`: L(Ind(V, r, N), X) = L(V, X^f), WD(Ind ρ) ≅ Ind WD(ρ); for L/F finite, ρ of G_L over a characteristic-0 field, v ∤ l: L_v(Ind ρ, X) = ∏_{w|v}L_w(ρ, X^{f(w|v)}), and P_v likewise if L/F and ρ are unramified at v and above (Deligne 1973, 3.8(ii), p. 530).

### 2.6 Monodromy filtration and purity

`MonodromyFiltration.ofNilpotent` N (V finite-dimensional over a field) is LPV.1 supplier data, not defined here: M_a = Σ_{i-j=a}(ker N^{i+1} ∩ im N^j); `monodromyFiltration` is M(N) for (V, r, N). Prove `monodromyFiltration_{unique, conj, smul, stable}`: the only finite increasing filtration with NM_a ⊂ M_{a-2} and N^a : gr_a ≅ gr_{-a}; M(gNg^-1) = gM(N); M(cN) = M(N), c ≠ 0; r(w)Nr(w)^-1 = c(w)N, c(w) ≠ 0 gives r(w)M_a = M_a. (Fresán-Sabbah-Yu 2022, §5.3.2, p. 57.)

**Checks.**
- `monodromyFiltration_special`: Sp(n): gr_a of dimension 1 for a = -n+1, …, n-1 step 2.
- `monodromyFiltration_zero`: N = 0: M_{-1} = 0, M_0 = V.
- `monodromyFiltration_not_kernel`: Sp(2): M_{-1} = ker N, M_{-2} = 0.

Define `IsWeilNumber` (algebraic; |τα| = q^{m/2} for all τ : Q(α) → C; q ≥ 2 for the weight to be determined), `IsPure` w (eigenvalues of geometric r(F) on gr_a are q-Weil of weight w + a; mixed: sub-object filtration with pure graded), `GaloisRep.IsPureAt`. API: `isPure_{frobeniusSemisimplification, tensor, restrict}` (w + w', dual -w, ⊗ω: -2). (Fresán-Sabbah-Yu 2022, §5.3.2, p. 57.)

**Checks.**
- `isPure_{special_two, omega, trivial}`: weights -1; -2; 0.
- `not_isPure_split`: (1 ⊕ ω, 0) is not pure (q ≥ 2); `isPure_not_unique_q_one`: q = 1: (1, 0) is pure of every weight.

Prove `rank_pow_eq_of_pure_graded`, `isPure_of_pure_graded`: Ω of characteristic 0, q ≥ 2, N nilpotent, φ ∈ GL(V), Nφ = qφN, a filtration stable under N, φ with pure graded (V̄, φ̄, N̄) of weight w: rank N^k = rank N̄^k, (V, φ, N) is pure of weight w, ker N induces ker N̄. Prove `isPure_of_filtration_pure_graded`, `{localFactor, epsilon}_eq_of_pure_graded`: K/Q_p finite, r : G_K → GL(V) continuous with G_K-stable 0 = V_0 ⊂ … ⊂ V_c = V and WD(r̄) pure of weight w: WD(r) pure of weight w, L(r, X) = L(r̄, X), ε(WD r, ψ, dx) = ε(WD r̄, ψ, dx) after ι : Q̄_l ≅ C. (Fresán-Sabbah-Yu 2022, 5.40 and proof, p. 58.)

### 2.7 Local constants

K/Q_p finite, ψ : K → C^× nontrivial, dx a Haar measure, Art_K : K^× ≅ W_K^ab with uniformisers ↦ GEOMETRIC lifts (Art_K(x) = `artinMap`(x)^-1). Prove `tateLocalConstant_explicit` (Lean: `tateLocalConstant_ramified`): ω a character of K^×, s ∈ C, ν = n(ψ), dx_ψ self-dual (vol O = q^{-ν/2}): ε(ωω_s, ψ, dx_ψ) = ω(ϖ^ν)q^{(1/2-s)ν} (ω unramified), = ω(ϖ^{ν+c})q^{(1/2-s)(ν+c)}𝔤(ω, ψ), 𝔤 = q^{(ν+c)/2}∫_{O^×}ω^-1(y)ψ(ϖ^{-ν-c}y)dy_ψ (conductor exponent c ≥ 1); and `hecke_functional_equation`: Hecke L-functions of Grössencharacters of number fields satisfy their functional equation, hence Artin L-functions by Brauer induction. (Deligne 1973, 3.4, p. 528; 3.12 (A)-(C), p. 533; 4.12, p. 544; 5.5.3-5.7.1, p. 549.)

Define `epsilonWeil` ε(V, ψ, dx) ∈ C^× for complex W_K-representations with open inertia kernel: the unique function multiplicative in exact sequences, scaling by a^{dim V}, inductive in degree 0 (ε(Ind V_L, ψ) = ε(V_L, ψ∘Tr)), Tate's constant in dimension 1; API `epsilonWeil_{exact, smul_measure, induced, character, character_explicit, unique}`. Define `epsilon` ε((V, r, N), ψ, dx) = ε(r, ψ, dx)det(-r(F) | V^I/(ker N)^I) and ε(ρ) = ε(ιWD ρ); ε(V⊗ω_s) = q^{-(a(V)+n(ψ)dim V)s}ε(V), a(V) the Layer 3 Artin conductor; ε(V, ψ, dx)ε(V^∨⊗ω, ψ(-x), dx') = 1. API: `epsilon_{frobeniusSemisimplification, unramified_twist, dual}`. (Deligne 1973, 4.1, p. 535; 8.12, p. 572; 2.3, p. 523; Fresán-Sabbah-Yu 2022, (5.33), p. 54.) *Needs:* CFT layers 7, 9; LFR layer 0; `TauCetiRoadmap.RepresentationTheory/InductionRestriction` layer 6.

**Checks.**
- `epsilon_{unramified_character, special_two, zero}`: 1 (n(ψ) = 0, vol O = 1); -1; 1.
- `epsilon_not_weil_part`: ε(Sp(2)) ≠ ε(1 ⊕ ω).
- `epsilon_eq_tate`: ramified ω gives the Gauss-sum formula.

### Examples

K/Q_p finite: WD(Q_l(1)) = (ω, 0), P = X - q, L = 1 - q^-1X, weight -2; α ∈ O_E^×: WD(λ(α)) = (λ_W(α), 0), L = 1 - α^-1X; Tate curve E_{q_E}: 0 → Q_l(1) → V_lE → Q_l → 0, ρ(I_K) infinite, WD(V_lE) ≅ Sp(2) (N = v(q_E) times a generator, up to rescaling), F-semisimple not semisimple, L(V_lE) = 1 - q^-1X, L(V_lE^∨) = 1 - X, weight -1, η-twist L(V^∨) = 1 + X; l | v(q_E): E[l] unramified, V_lE not. (Deligne 1973, 2.3, p. 523; 8.4.1, p. 568.) *Needs:* `TauCetiRoadmap.EllipticCurves` layer 4; Layer 6 (Tate modules).

### Dependencies

Layer 1; the roadmap layers and declarations cited above; Layer 3 for the Artin conductor.

## Layer 3: Artin and Swan conductors

This layer defines breaks, Swan and Artin conductors of local Galois representations, the conductor of a Weil–Deligne representation, global conductors and N(ρ̄); proves Hasse–Arf integrality, functoriality and reduction modulo ℓ; and computes elliptic conductors with the Ogg–Saito formula and Serre's bounds. Layers 4–6 and later level statements consume them. Lean names lie in `TauCeti.Conductor`; roadmaps `TauCetiRoadmap.<Name>` are cited as Name layer n.

**Conductor setting (standing).** K is complete for a discrete valuation v_K with v_K(K^×) = ℤ, ring of integers O_K and PERFECT residue field k of characteristic p > 0, char K ∈ {0, p}; for finite k, K is a nonarchimedean local field (`IsNonarchimedeanLocalField`). G_K = `Field.absoluteGaloisGroup K` is identified with Gal(K^sep/K) by `TauCeti.absoluteGaloisGroupRestrictEquiv`; I_K ⊇ P_K are inertia and wild inertia, P_K pro-p, with images G_0, G_1 in finite Galois quotients (LocalFieldsRamification layer 4); the ramification filtration, Herbrand φ, ψ and Hasse–Arf for finite Galois L/K are those of LocalFieldsRamification layer 3 (supplied for finite k; for infinite perfect k the same filtration is a standing hypothesis). F is a Hausdorff topological field of characteristic ≠ p: a finite field or F̄_ℓ (discrete), ℂ, or E/ℚ_ℓ finite or ℚ̄_ℓ (ℓ ≠ p, ℓ-adic); V is a finite-dimensional F-space with continuous ρ: G_K → GL_F(V) (Layer 1 continuous representations) and ρ(P_K) finite. "V of the setting" means this; ℓ = p is excluded.

### 3.1 Finite wild image, breaks and the Swan conductor

Prove `wildImage_finite`: for ρ continuous on finite-dimensional V, ρ(P_K) is a finite p-group if (a) F is discrete or (b) F = ℂ (even ρ(G_K) is finite), (c) F = E finite over ℚ_ℓ or (d) F = ℚ̄_ℓ, with ℓ ≠ p; in case (c) ρ(P_K) → GL(Λ/m_EΛ) is injective for every stable O_E-lattice Λ; for ℓ = p (c) fails. (Ulmer 2016, §5, PDF p. 4.) *Needs:* Layer 1 (stable lattices, descent of ℚ̄_ℓ-representations to a coefficient field).

For V of the setting prove `exists_finiteGalois_wild_factor`: some finite Galois L/K in K^sep has Gal(K^sep/L) ∩ P_K ⊆ ker ρ; `wild_factor_equivariant`: for such L the wild action factors uniquely through Gal(L/K)_1 with image ρ(P_K), conjugation by Gal(L/K) intertwined with conjugation by any lift in G_K; `wild_factor_enlarge`: every finite Galois L′ ⊇ L still kills the wild kernel, with Gal(L′/K)_1 acting through restriction to L; `exists_finiteGalois_inertia_factor`: if ρ(I_K) is finite, L can be chosen with inertia acting through Gal(L/K)_0. (Ulmer 2016, §4, PDF p. 3.) *Needs:* Mathlib `ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one`; `TauCeti.Field.absoluteGaloisGroup.exists_finiteDimensional_normal_fixingSubgroup_le`.

Define `absUpperRamificationGroup`: for real u ≥ −1, G_K^u is the closed normal subgroup of σ whose restriction to every finite Galois L/K lies in Gal(L/K)^u, G_K^{u+} the closure of ⋃_{w>u} G_K^w; G_K^{−1} = G_K, G_K^0 = I_K, G_K^{0+} = P_K, ⋂_u G_K^u = 1. For V of the setting define `breakDecomposition`: the unique G_K-stable V = ⊕_{λ∈ℚ≥0} V(λ), almost all zero, with V(0) = V^{ρ(P_K)} and, for λ > 0, V(λ)^{G_K^λ} = 0, V(λ)^{G_K^{λ+}} = V(λ); `breaks` is the finite set of λ with V(λ) ≠ 0, `highestBreak` its maximum (0 for V = 0); `swanConductor` is

```text
Sw(V) = Σ_λ λ·dim_F V(λ) = ∫_0^∞ codim_V V^{ρ(G_K^u)} du = Σ_{i≥1} (|G_i|/|G_0|)·codim_V V^{G_i} ∈ ℚ≥0,
```

the last sum over the lower groups of any finite Galois L/K with Gal(K^sep/L) ∩ P_K ⊆ ker ρ, G_i (i ≥ 1) acting through lifts in P_K. API: `map_absUpperRamificationGroup` (G_K^u ↠ Gal(L/K)^u = `upperRamificationGroup`), `absUpperRamificationGroup_zero` (G_K^0 = I_K, closure of ⋃_{u>0} G_K^u = P_K), `swanConductor_eq_integral`, `swanConductor_eq_lowerSum` (every admissible L), `swanConductor_eq_zero_iff` (iff ρ(P_K) = 1), `swanConductor_congr` (isomorphic restrictions to P_K), `swanConductor_extendScalars`, `swanConductor_le` (Sw ≤ highestBreak·dim V, equality iff one break), `lowerRamificationGroup_completion` (bridge to `TauCeti.Place.ramificationGroup`, AlgebraicCurves layer 8). (Ulmer 2016, §4, (4.1), PDF pp. 3–4.) *Needs:* Mathlib `Representation.invariants`, `PerfectField`; LocalFieldsRamification layers 3–4; the lemmas above.

**Checks.**
- `swanConductor_trivial`: any V with ρ(P_K) = 1 has Sw = 0, V = V(0).
- `swanConductor_chiMinusFour`: over ℚ_2 the character of ℚ_2(√−1) has single break 1, Sw = 1; that of ℚ_2(√2): break 2, Sw = 2.
- `swanConductor_unweighted_fails`: χ_8 over ℚ_2(ζ_8): |G_0| = 4, G_i (i ≥ 1) of orders 4, 2, 2, codimension 1 each; weighted sum 2, unweighted 3.
- `swanConductor_eq_lowerSum_any`: for χ_8 the weighted sums over ℚ_2(√2) and ℚ_2(ζ_8) both equal 2.
- `absUpperRamificationGroup_zero`: G_K^0, G_K^{0+} match I_K, P_K of LocalFieldsRamification layer 4.

### 3.2 The Artin conductor and its integrality

Define `artinConductor`, for V of the setting, a(V) := codim_V V^{ρ(I_K)} + Sw(V) ∈ ℚ≥0, with `tameConductor` ε(V) := dim V − dim V^{ρ(I_K)}; `artinConductorNat` is its ℕ-form after `hasseArf_integral`. The tame part uses the ACTUAL inertia image (for ℓ-adic ρ this includes the monodromy term; for residual ρ̄ its own action, never a lift's). API: `artinConductor_eq_tame_add_swan`; `artinConductor_eq_lowerSum` (finite inertia image: a(V) = Σ_{i≥0} (|G_i|/|G_0|)·codim V^{G_i} over any admissible L); `artinConductor_congr` (depends only on ρ|_{I_K} up to isomorphism); `artinConductor_extendScalars`; `invariants_inertia_eq_ker_monodromy` (ℓ-adic ρ, WD(ρ) = (r, N): V^{ρ(I_K)} = (ker N)^{r(I_K)}); `artinConductor_eq_characterConductorExp` (K/ℚ_p finite, χ of finite order: a(χ) = `ClassFieldTheory.characterConductorExp`(χ ∘ artinMap), from ClassFieldTheory layer 7's density of Art_K(U_K^n) in the image of G_K^n). (Serre 1987, §1.2, (1.2.1)–(1.2.2), pp. 180–181.) *Needs:* `swanConductor`; Layer 2 (the Weil–Deligne representation of an ℓ-adic representation); ClassFieldTheory layer 7; Mathlib `Module.finrank`.

**Checks.**
- `artinConductor_unramified`: ρ(I_K) = 1 or V = 0 gives a = 0.
- `artinConductor_tateCurve`: the Tate curve E_q, ℓ ≠ p: a(V_ℓ E_q) = 1.
- `artinConductor_dyadicQuadratic`: over ℚ_2, a(χ_{−4}) = 2, a(χ_8) = 3.
- `artinConductor_lift_fails`: ℓ-adic Steinberg ρ has a = 1, but the lattice O_E e_1 ⊕ ℓO_E e_2 (N e_2 = e_1) reduces to an unramified ρ̄ with a = 0.
- `artinConductor_tameOnly_fails`: the i = 0 term alone gives 1 for χ_8, not 3.

Let M/K_0 be finite totally ramified Galois in the setting, with G_0 ⊇ G_1 and lower groups G_i, and F algebraically closed of characteristic ≠ p. Prove `wildCharacter_lift`: every simple F[G_1]-module θ has a characteristic-zero lift θ̃ with equal invariant dimensions for every subgroup of G_1; θ, θ̃ have the same G_0-stabiliser T, and θ̃ extends to T since T/G_1 is cyclic (Brumer–Kramer 1994, §2, Lemma 2.7, p. 230). `swanConductor_orbit`: if θ̃_T extends θ̃ to T, Res_{G_1} Ind_T^{G_0} θ̃_T is the sum of the distinct conjugates once each and Sw(Ind_T^{G_0} θ̃_T) = [G_0 : T]·sw(θ) (same locator). `swanConductor_orbitFormula`: for V a continuous G_{K_0}-representation whose wild action factors through this G_1 compatibly with inertia conjugation (not for an arbitrary G_1-module), the multiplicities m_θ are constant on G_0-orbits and Sw(V) = Σ_O m_θ·Sw(Ind_T^{G_0} θ̃_T) (Serre 1987, (1.2.2), p. 181). *Needs:* Layer 1 (the Mackey decomposition); RepresentationTheory/InductionRestriction layers 5 and 7; `wild_factor_equivariant`.

For V of the setting prove `artinConductor_character`: a ramified character χ with finite wild image has an integer upper break u(χ), Sw(χ) = u(χ), a(χ) = 1 + u(χ); a tame ramified χ has break 0 (Serre 1970, §2.1, PDF p. 7). `artinConductor_finiteGroup_integral`: for finite Galois L/K and a characteristic-zero representation W of Gal(L/K), a(W), Sw(W) ∈ ℕ, by Brauer induction from the character case and `localInduction_conductor` (Serre 1961, n° 3.7, Thm 2, p. 138). `hasseArf_integral`: Sw(V), a(V) ∈ ℕ (Serre 1987, §1.2 (a), p. 181). `artinConductor_independent`: a and Sw are independent of the auxiliary L, the algebraic closure, the valuation extension and isomorphism (same locator). `artinConductor_eq_zero_iff`: a(V) = 0 iff I_K acts trivially; Sw(V) = 0 iff P_K acts trivially; a(V) = codim V^{I_K} iff V is tame (Serre 1987, §1.2 (a), p. 181). *Needs:* `localInduction_conductor` (3.5), `swanConductor_orbitFormula`, RepresentationTheory/InductionRestriction layer 6 (Brauer induction).

### 3.3 Weil–Deligne and global conductors

Define `wdConductor`: for K a nonarchimedean local field of residue cardinality q, W_K its Weil group (ClassFieldTheory layer 9) and (r, N) a Weil–Deligne representation on V over a field F of characteristic 0 (Layer 2 Weil–Deligne representations: r continuous, r(I_K) finite, N nilpotent, r(w)Nr(w)^{−1} = q^{v′(w)}N, v′ = 1 on an arithmetic Frobenius lift), a(r, N) := Sw(r) + dim V − dim (ker N)^{r(I_K)}, Sw(r) using only G_K^u ⊆ P_K ⊆ W_K, u > 0; the monodromy term is dim V^{r(I_K)} − dim (ker N)^{r(I_K)} ≥ 0, not dim V − dim ker N. API: `wdConductor_eq` (a(r, N) = a(r) + dim V^{r(I_K)} − dim (ker N)^{r(I_K)}), `wdConductor_zero` (a(r, 0) = a(r)), `artinConductor_eq_wdConductor` (ℓ ≠ p, WD(ρ) = (r, N): a(ρ) = a(r, N), for every Frobenius lift and t_ℓ), `wdConductor_frobeniusSemisimplification` (a(r^{F-ss}, N) = a(r, N)), `wdConductor_add`, `wdConductor_twist_unramified`, `wdConductor_sp` (a(sp(n) ⊗ χ) = n − 1 for χ unramified, n·a(χ) otherwise). (Ulmer 2016, §§6–8, PDF pp. 5–7.) *Needs:* `artinConductor`; Layer 2 (Frobenius semisimplification); ClassFieldTheory layer 9.

**Checks.**
- `wdConductor_steinberg`: V = F², r unramified, N ≠ 0: a = 1.
- `wdConductor_N_zero`: a(r, 0) = a(r); unramified r, N = 0 gives 0.
- `wdConductor_kerN_fails`: sp(2) ⊗ χ, χ tame: a = 2; with dim ker N instead: 2 + 0 − 1 = 1.
- `artinConductor_eq_wdConductor_tate`: for the Tate curve both sides give 1.

Define `globalConductor`: for a number field F, ρ: G_F → GL(V) continuous over C_ρ, unramified outside a finite set (Layer 2 unramified representations and the ramification set), and Σ a finite set of finite places containing every place of residue characteristic char C_ρ when positive and every place above ℓ when ρ is ℓ-adic (empty allowed for Artin ρ; `AdmissibleExcludedPlaces`), N^Σ(ρ) := ∏_{v∉Σ} 𝔭_v^{a_v(ρ)}, a_v(ρ) := a(ρ|_{G_{F_v}}) via an embedding ι_v (Layer 2 local restriction); N(ρ) := N^∅(ρ) for Artin ρ, N^{(ℓ)}(ρ) := N^{{v|ℓ}}(ρ) for ℓ-adic ρ; `primeToPConductor` N(ρ̄) := N^{{v|p}}(ρ̄) for ρ̄ over a finite field of characteristic p. Places in Σ are omitted, not given exponent 0. API: `globalConductor_eq_prod` (v_𝔭(N^Σ) = a_v off Σ, 0 on Σ), `globalConductor_eq_one_iff` (iff unramified at all finite v ∉ Σ), `primeToPConductor_coprime`, `globalConductor_congr` (isomorphism and choice of ι_v), `globalConductor_add` (multiplicative on ⊕; N^Σ(ρ)N^Σ(ρ′) | N^Σ(ρ″) for an extension ρ″ of ρ′ by ρ, with equality for finite inertia images of order invertible in C_ρ), `globalConductor_natCast` (positive generator over ℚ). (Serre 1987, §1.2, (1.2.3), p. 181.) *Needs:* 3.2; Layer 2 (decomposition groups at a place); NumberFieldArithmetic layer 5; Mathlib `IsDedekindDomain.HeightOneSpectrum`, `Ideal.absNorm`.

**Checks.**
- `globalConductor_trivial`: N^Σ = (1) for every Σ.
- `globalConductor_chiMinusFour`: the Dirichlet character of conductor 4, viewed in G_ℚ, has N = 4.
- `primeToPConductor_cyclotomic`: p odd: N(ω_p) = 1 though ω_p ramifies at p, so p must be excluded.
- `primeToPConductor_11a1`: E = 11a1: N(ρ̄_{E,5}) = 1, N(ρ̄_{E,3}) = 11.

### 3.4 Functoriality

For V of the setting prove `swanConductor_exact`: 0 → V′ → V → V″ → 0 exact gives Sw(V) = Sw(V′) + Sw(V″), so Sw(V) = Sw(V^{ss}) (Brumer–Kramer 1994, §2, Lemma 2.4, p. 229). `artinConductor_exact_le`: a(V) ≥ a(V′) + a(V″), equality iff V^{I_K} → V″^{I_K} is onto; a is additive on direct sums and a(V) ≥ a(V^{ss}) (same page, (2.1)). `artinConductor_dual`: Sw(V^∨) = Sw(V), a(V^∨) = a(V), also for infinite inertia image (same locator). `artinConductor_twist_tame`: an unramified character twist preserves a and Sw; a tame character twist preserves the positive breaks and Sw but may change ε (same locator). `artinConductor_twist_dominant`: if a continuous character χ has break u(χ) > 0 strictly larger than every break of V, every break of V ⊗ χ is u(χ), Sw(V ⊗ χ) = u(χ)·dim V, a(V ⊗ χ) = a(χ)·dim V (Ulmer 2016, §10, Prop. 1, PDF p. 8). `artinConductor_unramifiedBaseChange`: finite unramified extension of K, and passage to the completion of K^ur, preserve a and Sw (Serre 1970, §2.1, PDF p. 7). `swanConductor_tameBaseChange`: for finite tame L/K of ramification index e the positive breaks are multiplied by e and Sw_L(V|_{G_L}) = e·Sw_K(V) (same locator). `artinConductor_extendScalars'`: extension of the coefficient field preserves Sw and a (same page). *Needs:* Layer 1 (restriction, duals, tensor products and twists, semisimplification); Mathlib `Representation.dual`, `Representation.tprod`; LocalFieldsRamification layers 2–4; `upperNumbering_openSubgroup`.

### 3.5 Induction and the conductor–discriminant formula

Prove `upperNumbering_openSubgroup`: in the setting let L/K be finite separable in K^sep (not necessarily Galois) with e, f and different exponent d(L/K); for finite Galois M/K ⊇ L put ψ_{L/K} := φ_{M/L} ∘ ψ_{M/K} on [−1, ∞). Then (a) ψ_{L/K} is independent of M, is the Herbrand ψ for Galois L/K, is continuous, strictly increasing, piecewise linear, the identity on [−1, 0], and ψ_{M/K} = ψ_{M/L} ∘ ψ_{L/K}; (b) G_K^u ∩ G_L = G_L^{ψ_{L/K}(u)} for all u ≥ −1; (c) ψ_{L/K}(u) = (1/f)∫_0^u [G_K : G_K^t G_L] dt for u ≥ 0; (d) beyond every break ψ_{L/K}(u) = e·u − d(L/K) + e − 1, i.e. ∫_0^∞ ([L:K] − [G_K : G_K^t G_L]) dt = f(d(L/K) − e + 1) = δ(L/K) − [L:K] + f, δ(L/K) = f·d(L/K). (Serre 1961, n° 3.1, Prop. 4 and Remarque, p. 128.) *Needs:* `absUpperRamificationGroup`; LocalFieldsRamification layer 3.

Prove `invariants_ind`: for Γ profinite, H open, D closed normal and U a continuous finite-dimensional H-representation, dim (Ind_H^Γ U)^D = [Γ : HD]·dim U^{H∩D}; `invariants_ind_inertia`: for L/K finite separable of residue degree f, dim (Ind_{G_L}^{G_K} V)^{I_K} = f·dim V^{I_L}; `ind_wildImage_finite`: finite wild image on G_L gives finite wild image of Ind_{G_L}^{G_K} V. (Brumer–Kramer 1994, §6, p. 245.) *Needs:* Layer 1 (continuous induction, the Mackey decomposition).

Prove `localInduction_conductor`: in the setting, for L/K finite separable in K^sep with e, f, d(L/K), δ(L/K) = f·d(L/K), and V a continuous G_L-representation over F of characteristic ≠ p with finite image of P_L, Ind_{G_L}^{G_K} V has finite wild image and, in ℚ: (a) codim (Ind V)^{I_K} = ([L:K] − f)·dim V + f·codim V^{I_L}; (b) Sw_K(Ind V) = f·Sw_L(V) + (δ(L/K) − [L:K] + f)·dim V; (c) a_K(Ind V) = δ(L/K)·dim V + f·a_L(V). In particular a_K(Ind 1) = δ(L/K) (conductor–discriminant) and Sw_K(Ind 1) = f(d(L/K) − e + 1); V need not factor through a finite quotient. (Brumer–Kramer 1994, §2, (2.5), p. 230; Serre 1961, n° 3.7, (31), p. 138.) *Needs:* the lemmas above, Layer 1 continuous induction.

Prove `globalInduction_conductor`: for F′/F finite number fields, Σ admissible with Σ′ the places above it, and ρ a finite-dimensional representation of G_{F′} with conductor defined outside Σ′, N_F^Σ(Ind ρ) = (d_{F′/F})_Σ^{dim ρ}·Nm_{F′/F}(N_{F′}^{Σ′}(ρ)), d_{F′/F} the relative discriminant (Brumer–Kramer 1994, (2.5), p. 230). `quadraticInduction_conductor`: for F = ℚ, M quadratic, ψ of finite order, N(Ind ψ) = |d_M|·Nm_{M/ℚ}(f(ψ)), f(ψ) the Artin conductor ideal; for ℓ-adic ψ take prime-to-ℓ parts; identifying f(ψ) with a Hecke-character conductor rests on `artinConductor_eq_characterConductorExp` (same locators). *Needs:* `globalConductor`; NumberFieldArithmetic layers 5–6 (localised discriminant); Mathlib `differentIdeal`, `NumberField.discr`, `Representation.ind`.

### 3.6 Reduction modulo ℓ

In the setting let ℓ ≠ p, E/ℚ_ℓ finite, ρ continuous on an E-space V, Λ a stable O_E-lattice (Layer 1 integral models), ρ̄_Λ := Λ/m_EΛ. Prove `swanConductor_reduction`: Sw(ρ̄_Λ) = Sw(ρ) = Sw(ρ̄_Λ^{ss}) (Darmon–Diamond–Taylor 2007, Lemma 2.7, PDF pp. 54–55). `artinConductor_reduction_le`: a(ρ̄_Λ) = a(ρ) − (dim ρ̄_Λ^{I_K} − dim V^{I_K}) ≤ a(ρ), equality iff Λ^{I_K} ⊗ k_E → ρ̄_Λ^{I_K} is onto, in particular for finite inertia image of order prime to ℓ (same lemma). `artinConductor_residualSemisimplification`: a(ρ̄_Λ^{ss}) ≤ a(ρ̄_Λ) ≤ a(ρ), and a(ρ̄_Λ^{ss}) is independent of Λ (Ulmer 2016, §6, PDF p. 5). `globalConductor_reduction_dvd`: for global ℓ-adic ρ of finite ramification, N^{(ℓ)}(ρ̄_Λ) | N^{(ℓ)}(ρ) with quotient ∏_{v∤ℓ} 𝔭_v^{dim ρ̄_Λ^{I_v} − dim V^{I_v}}, and N^{(ℓ)}(ρ̄_Λ^{ss}) | N^{(ℓ)}(ρ) (same lemma). *Needs:* `wildImage_finite`, 3.4, Layer 1 (lattice independence of the residual semisimplification).

### 3.7 Computations and Artin–Schreier characters

For K a nonarchimedean local field of residue characteristic p and coefficients of characteristic ≠ p prove `wdConductor_steinberg'`: a rank-two Weil–Deligne representation with unramified r and N ≠ 0 has conductor 1, and for ℓ ≠ p so has the Tate module of a Tate curve (Darmon–Diamond–Taylor 2007, Prop. 2.12, PDF p. 57). `artinConductor_tame_two`: dim V = 2, P_K trivial and V^{I_K} = 0 give a(V) = 2, covering two nontrivial tame inertia characters and the induction of a tame character of the unramified quadratic extension nontrivial on inertia (irreducible for a non-norm character) (Serre 1987, §1.2 (c), p. 181). `artinConductor_dyadicQuadratic'`: the ramified quadratic characters of G_{ℚ_2} have conductor 2 for ℚ_2(√−1), ℚ_2(√3) and 3 for ℚ_2(√±2), ℚ_2(√±6) (same locator). `artinConductor_triadicCubic`: every ramified character of order 3 of G_{ℚ_3} has conductor 2 (same locator). *Needs:* 3.2, 3.3, `localInduction_conductor`, Layer 2 (tame inertia and the fundamental characters), EllipticCurves layer 4.

Let K have characteristic p > 0, complete discretely valued with perfect residue field, u ∈ K with v(u) = −m < 0, p ∤ m, and L = K(α), α^p − α = u. Prove `artinSchreier_break`: L/K is cyclic of degree p, totally ramified, with unique lower and upper break m (Serre 1961, n° 4.4, Lemme 4 (b), PDF p. 41). `artinSchreier_swanConductor`: every nontrivial F-valued character ψ of Gal(L/K) has Sw(ψ) = m, a(ψ) = m + 1, and the different exponent is (p − 1)(m + 1) (Deligne 1974, §8, Lemme (8.13), p. 306). `artinSchreier_twist`: for such ψ over coefficients of characteristic ≠ p and V of the setting with breaks < m, every break of V ⊗ ψ is m, Sw(V ⊗ ψ) = m·dim V, a(V ⊗ ψ) = (m + 1)·dim V (Ulmer 2016, §10, PDF pp. 7–8). `artinSchreier_atInfinity`: for finite k and y ∈ k[[x]] of valuation d prime to p, the character cut out by T^p − T = y^{−1} has conductor d + 1, so Deligne's sheaf ℱ_j has Swan conductor d at infinity (same, (8.12)–(8.13)). *Needs:* `artinConductor_character`, 3.4.

### 3.8 The conductor of an elliptic curve and the Ogg–Saito formula

Define `ellipticConductorExp`: for K of the setting, R = O_K, E/K given by a Weierstrass curve W with `W.IsElliptic`, and V_ℓ E = T_ℓ E ⊗ ℚ_ℓ with its continuous G_K-action (Layer 6 the comparison of the elliptic Tate module with the pointwise action), f(E) := a(V_{ℓ_0} E) with ℓ_0 the least prime ≠ p, `ellipticTameConductor` ε(E) := codim (V_{ℓ_0}E)^{I_K}, `ellipticSwanConductor` δ(E) := Sw(V_{ℓ_0}E); over a number field, `ellipticConductor` N_E := ∏_v 𝔭_v^{f(E_{F_v})}. Then (i) a(V_ℓ E) = f(E) for every ℓ ≠ p, ε and δ are independent of ℓ, δ(E) = Sw(E[ℓ]); (ii) ε(E) = 0, 1, 2 as `W.minimal R` (never a bare integral equation) has good, multiplicative or additive reduction (`WeierstrassCurve.HasGoodReduction`, `HasMultiplicativeReduction`, `HasAdditiveReduction`); (iii) δ(E) = 0 when p ≥ 5 and under good or multiplicative reduction; (iv) a((V_ℓ E)^∨) = a(H¹) = f(E). API: `ellipticConductorExp_eq_artinConductor`, `ellipticConductorExp_eq_zero_iff`, `ellipticConductorExp_eq_one_iff`, `ellipticConductorExp_baseChange_unramified`, `ellipticConductorExp_dual`. (Serre 1970, n° 2.4, cases b), c), PDF p. 10; Brumer–Kramer 1994, §6, (6.1), p. 243.) *Needs:* 3.2, 3.4, 3.6; Layer 6 (the Weil pairing on Tate modules); EllipticCurves layers 2–5; Mathlib `WeierstrassCurve.minimal`, `WeierstrassCurve.hasGoodReduction_or_hasMultiplicativeReduction_or_hasAdditiveReduction`.

**Checks.**
- `conductor_11a1`: y² + y = x³ − x² − 10x − 20 over ℚ: f_11 = 1, f_v = 0 otherwise, N_E = 11.
- `conductor_goodReduction`: good reduction of `W.minimal R`: f = 0.
- `conductor_y2_x3_minus_x`: y² = x³ − x over ℚ_2 has f = 5.
- `conductor_nonminimal_fails`: scaling a good minimal equation by π gives v(Δ) = 12; a bare-equation reading says additive, yet f = 0.
- `conductor_independent_ell`: a(V_ℓ E) = f(E) for all ℓ ≠ p; for p = 2, a(V_3 E) = a(V_5 E).

Let E/K be elliptic in the setting, Δ_min its minimal discriminant, X its minimal proper regular model (StableReduction layers 4–5) and m the number of geometric irreducible components of X_k, without multiplicities. Three targets: `minimalRegularModel_smoothLocus`: the smooth locus of X is the Néron model of E, so m is the component count of the Tate-algorithm symbol of `W.minimal R` (EllipticCurves layer 4) (Milne 2021, Ch. IV §10, p. 165). `kodaira_configuration`: over the completed strict henselisation the special fibre of X has the Kodaira configuration of its symbol, m = 1, n, 1, 2, 3, 5, n+5, 7, 8, 9 for I_0, I_n, II, III, IV, I_0*, I_n*, IV*, III*, II* (same locator). `kodaira_wild_comparison`: in residue characteristic 2 and 3 the symbol still determines the geometric configuration of X_k̄, hence m (Liu 1994, Introduction, p. 51). Prove `ogg_descent`: passage to the completed strict henselisation preserves v(Δ_min), f(E) and m (Milne, same locator). `ogg_formula_tame`: p ≥ 5 gives v(Δ_min) = f(E) + m − 1 (Darmon–Diamond–Taylor 2007, §2.2, Rem. 2.14, PDF p. 58). *Needs:* 3.4, Mathlib `WeierstrassCurve.IsMinimal`, `WeierstrassCurve.Δ`, `TauCeti.WeierstrassCurve.valuation_Δ_eq_of_isMinimal_smul`.

Prove `saito_conductorDiscriminant`: for R a complete DVR with perfect residue field of characteristic p, C/K smooth projective geometrically connected of genus ≥ 1, X/R its minimal regular model, Art(X/R) := χ(X_K̄) − χ(X_k̄) − Sw(H¹_ét(C_K̄, ℚ_ℓ)) (ℓ ≠ p) and Deligne's discriminant Δ_{X/R}: −Art(X/R) = ord Δ_{X/R} (Liu 1994, Introduction, p. 51; §2.1, pp. 58–59). `saito_genusOne`: for C = E, ord Δ_{X/R} = v(Δ_min), χ(X_k̄) = m − 1 + ε(E), χ(X_K̄) = 0, so −Art(X/R) = f(E) + m − 1 (same locators). `ogg_formula`: in every residue characteristic, including 2 and 3 in mixed and equal characteristic, v(Δ_min) = f(E) + m − 1 (Liu 1994, Introduction, p. 51). *Needs:* `swanConductor`, Layer 6 the Tate module of an abelian variety, StableReduction layers 4–5, the three targets.

### 3.9 Elliptic conductors: values, bounds, residual conductors

For K a nonarchimedean local field of residue characteristic p and E/K elliptic prove `ellipticConductorExp_values`: f(E) = 0, 1, 2 + δ(E) for good, multiplicative, additive reduction, the last equal to 2 when p ≥ 5 (Darmon–Diamond–Taylor 2007, Prop. 2.13, PDF p. 58). `ellipticConductorExp_potMult`: additive potentially multiplicative reduction with ramified quadratic twisting character χ gives f(E) = 2a(χ); over ℚ_2 the values are 4 and 6 (same locator; EllipticCurves layer 5). `ellipticConductorExp_le_three`: K/ℚ_3 finite gives f(E) ≤ 2 + 3v_K(3) (Serre 1987, §4.9 (a), p. 216). `ellipticConductorExp_le_two`: K/ℚ_2 finite gives f(E) ≤ 2 + 6v_K(2), so f_2 ≤ 8 over ℚ_2 (Serre 1987, §4.9 (b), p. 216; Brumer–Kramer 1994, Thm 6.2, p. 243). `ellipticConductorExp_isogeny`: K-isogenous curves have equal f, and equal N_E over a number field (same locator). `ellipticConductor_rat`: for E/ℚ, p | N_E iff bad reduction at p, v_p(N_E) = 1 iff multiplicative, and N_E | 2⁸·3⁵·∏_{p≥5, p|N_E} p² (same locators). *Needs:* 3.4, 3.6, 3.7, Layer 6 (functoriality of Tate modules under isogenies, the Weil pairing on Tate modules), `serre_wildBound`.

Prove `serre_wildBound`: for K of characteristic 0 in the setting, e_K = v_K(p), V of dimension N over F of characteristic ≠ p and ρ continuous with finite image G = Gal(L/K), lower groups of orders g_i, g_1 = p^c: Sw(V) ≤ N·e_K·(c + 1/(p − 1)) and a(V) ≤ N·(1 + e_K c + e_K/(p − 1)), via Hilbert's formula and Hensel's bound for the different; the strict form for non-cyclic G_1 is not asserted (Serre 1987, §4.9, Prop. 9 and (4.9.4), pp. 215–216). *Needs:* 3.1, 3.2.

For E/K elliptic over a nonarchimedean local field of residue characteristic p and ℓ ≠ p, E[ℓ] is the reduction of T_ℓ E (Layer 6 torsion and the residual representation) and Sw(E[ℓ]) = δ(E). Prove `residualConductor_good`: good reduction gives a(E[ℓ]) = 0; `residualConductor_mult`: multiplicative reduction gives a(E[ℓ]) = 0 if ℓ | v(Δ_min), 1 otherwise (Serre 1987, §4.1, (4.1.12), p. 201); `residualConductor_potMult`: additive potentially multiplicative reduction and odd ℓ give a(E[ℓ]) = f(E); `residualConductor_potGood`: additive potentially good reduction with ℓ not dividing the order of the ℓ-adic inertia image gives a(E[ℓ]) = f(E), which holds for ℓ ≥ 5 (Serre 1987, §4.6, Lemme 5, p. 207). `primeToPConductor_elliptic`: for E/ℚ and ℓ ≥ 5, E[ℓ] the actual residual representation (not semisimplified), N(E[ℓ]) = N_E^{(ℓ)} / ∏ q over q ∥ N_E, q ≠ ℓ, ℓ | v_q(Δ_min); hence N(E[ℓ]) | N_E, while for the semisimplification only N(E[ℓ]^{ss}) | N(E[ℓ]) is asserted (same locator; Bennett–Siksek 2020, §2, (3), p. 358). *Needs:* 3.6, `globalConductor`, `ellipticConductorExp_le_two`, EllipticCurves layers 4–5.

### Dependencies

Layers 1, 2, 6; LocalFieldsRamification 2–4; ClassFieldTheory 7, 9; NumberFieldArithmetic 5–6; RepresentationTheory/InductionRestriction 5–7; StableReduction 4–5; EllipticCurves 2–5; AlgebraicCurves 8; Mathlib as named.

## Layer 4: residual images and oddness

Rank-two residual Galois representations: oddness, GL_2 over finite fields, dihedral and bad dihedral images, restriction to subfields. F is a number field, G_F = `Field.absoluteGaloisGroup F`, k a field of characteristic p, k̄ = F̄_p, π : GL_2(k̄) → PGL_2(k̄); names live in `TauCeti.GaloisRep` or `TauCeti.GL2Subgroup` unless prefixed; "abs." = absolutely, "~" = conjugate, "char" = characteristic.

### 4.1 Complex conjugation and oddness

Define `complexConjugation`: for a real place v of F and ι : F̄ → ℂ above v, c_v := ι⁻¹ ∘ `Complex.conjAe` ∘ ι ∈ G_F, up to conjugacy. A continuous μ : G_F → A^× is `IsTotallyOddChar` if μ(c_v) = −1 at every real place; a continuous rank-two ρ over A (Layer 1) is `IsOddAt` v if det ρ(c_v) = −1 and odd if so at every real place; `IsNontrivialAt` v: ρ(c_v) ≠ 1. API: `complexConjugation_sq`, `isConj_complexConjugation`, `isOdd_tensor_character`, `isOdd_baseChange`, `isOdd_restrict`, `isOdd_iff_conj_diag`. (Serre 1987, (1.3.8), p. 182.)

**Checks.**
- `isOdd_cyclotomic_sum_one`, `isOdd_of_charTwo`: χ̄_p ⊕ 1 over F_p (p odd) is odd; so is the trivial representation over F_2.
- `not_isOdd_of_scalar_minus_one`: χ_{−3} ⊕ χ_{−4} over F_5: ρ(c) = −1, det 1, not odd, though "ρ(c) ≠ 1" accepts it.
- `isOdd_iff_trace_eq_zero`, `isOdd_reduction_iff`, `not_isOdd_of_isOddAt_one_place`, `isOdd_of_no_real_place`: Tr ρ(c_v) = 0; ρ odd iff ρ̄ odd (p ≠ 2); one odd place of ℚ(√2) is not enough; ℚ(i) has none.

`rational_lines_of_split_nonscalar`: a nonscalar element of ρ(Γ) ⊂ GL_2(k) with split characteristic polynomial makes every stable line over any extension k-rational, so irreducible ⇔ abs. irreducible. `isAbsolutelyIrreducible_of_isOdd`: F with a real place v, char k ≠ 2, ρ : G_F → GL_2(k) odd at v and irreducible ⇒ abs. irreducible (Serre 1987, 3.3, p. 198). `isAbsolutelyIrreducible_of_charTwo_nontrivialAt`: char k = 2, ρ(c_v) ≠ 1 at a real place, irreducible ⇒ abs. irreducible (Khare–Wintenberger 2009 I, Lemma 6.1, p. 10).

### 4.2 Borel and Cartan subgroups

`pSubgroup_fixes_unique_line`: char k = p > 0, P ⊂ GL_2(k) a nontrivial finite p-group: P is elementary abelian, conjugate into the upper unitriangular group, fixes exactly one line V^P of k̄², and normalises into that Borel; hence a subgroup with a nontrivial normal p-subgroup is reducible, GL_2(F_q) has q + 1 Sylow p-subgroups, the unipotent radicals, a finite G reducible over k̄ with p | |G| has a normal Sylow fixing the stable line, and such a subgroup of PGL_2(k̄) fixes a point (Serre 1972, §2.3, p. 280).

Define, in `TauCeti.GL2Cartan`, k finite with q elements, dim V = 2: `split` C_s(D_1, D_2), the stabiliser of lines D_1 ≠ D_2; `nonsplit` C_ns(k′) = k′^× for a subfield k′ ⊂ End_k(V) with q² elements; `IsCartan`; `halfSplit` (C_s acting trivially on D_2); the normaliser N(C). API: `normalizer_index` ([N(C) : C] = 2 for C non-split, or split with q ≥ 3); `mem_normalizer_split_iff`; `image_PGL` (π(C) cyclic of order q ∓ 1 with normaliser π(N(C)), dihedral); `conj`; `exists_unique_of_disc_ne_zero` (p ≠ 2, Tr² ≠ 4 det: a unique Cartan, split iff the discriminant is a square); `diagonal_model`; `eq_of_le_normalizer` (over F_ℓ, a Cartan, resp. split half-Cartan, C′ ⊂ N(C), ℓ ≥ 5 if C′ split, ℓ ≥ 3 otherwise ⇒ C′ = C, resp. C′ ⊂ C). (Serre 1972, §2.1–2.2, pp. 278–280.)

**Checks.**
- `card_nonsplit`: |C_ns| = q² − 1, |N| = 2(q² − 1).
- `split_trivial_q_two`, `trace_eq_zero_of_mem_normalizer_not_mem`: q = 2: C_s trivial, N = GL_2(F_2) ≅ S_3; otherwise N(C) ∖ C has trace 0 and scalar squares.
- `nonsplit_eq_GL2NonSplitTorus`, `split_ne_nonsplit`: C_ns(k′) = `GL2NonSplitTorus k k′ hE`; the two kinds are not conjugate.

`closure_transvections_eq_top`: ℓ prime, a, b ∈ F_ℓ^×: [[1, a], [0, 1]] and [[1, 0], [b, 1]] generate SL_2(F_ℓ); so G ⊂ GL(V) over F_ℓ with two elements of order ℓ with distinct fixed lines contains SL(V) (Serre 1972, Prop. 15, p. 280).

### 4.3 Sylow subgroups and PSL_2

`dickson_sylow`: s = p^n, H ⊂ PSL_2(F_s), p | |H|: the Sylow p-subgroups are the nontrivial H ∩ U_μ (U_μ unipotent fixing μ ∈ P¹(F_s)), of order p^m and number 1 + f p^m; f = 0 ⇒ H fixes a point; f ≥ 1 ⇒ m | n and, up to PGL_2(F_s)-conjugacy, exactly one of: p^m > 2, f = 1, H = PSL_2(F_{p^m}); p^m = 2, H dihedral of order 2(1 + 2f); p odd, n/m even, f = 1, H = PGL_2(F_{p^m}); p = 3, m = 1, n even, f = 3, H ≅ A_5 (Dickson 1901, §§251–254, p. 272). `finite_subgroup_PGL2_of_coprime_char`: K algebraically closed, H ⊂ PGL_2(K) finite of order Ω prime to char K: the count 1 − Σ(d_i − 1)/(f_i d_i) = 1/Ω over the r ≤ 3 classes of maximal cyclic subgroups (orders d_i, normaliser indices f_i ∈ {1, 2}) makes H cyclic, dihedral of order 2n (n ≥ 2), or A_4, S_4, A_5; likewise in PGL_2(k) for char k ∤ Ω (Dickson 1901, §256, pp. 280–282).

`PSL2_normal_subgroups_and_automorphisms`, k = F_q, q ≥ 4: SL_2(k) is perfect, PSL_2(k) simple; normal subgroups of GL_2(k) are central or contain SL_2(k); those of SL_2(k) are 1, {±1} ∩ SL_2, SL_2; PSL_2 is the only proper nontrivial normal subgroup of PGL_2 (q odd), PGL_2 = PSL_2 (q even); GL_2^ab ≅ k^×, PGL_2^ab ≅ k^×/k^{×2}; all false for q ≤ 3. Aut PSL_2 = Aut PGL_2 = PGL_2(F_q) ⋊ Gal(F_q/F_p), inner for q = p ≥ 5. Goursat for subgroups of S^r (S non-abelian simple); Aut(S^r) = Aut(S)^r ⋊ S_r. For ρ̄_1, ρ̄_2 : G_F → GL_2(k̄) with standard projective images over F_{q_i}, q_i ≥ 4, the projective kernel fields M_i have M_1 ∩ M_2 = F, or quadratic (two PGL_2 types, q_i odd), or M_1 = M_2, q_1 = q_2, equal types, conjugate up to Frobenius (Allen et al. 2023, Lemma 7.1.8, p. 1092; Newton–Thorne 2026, Lemma 5.7, p. 41).

### 4.4 Dickson's classification

`dickson_classification`: a finite H ⊂ PGL_2(k̄) fixes a point, or ~ PSL_2(F_q) or PGL_2(F_q), or is dihedral of order 2n, p ∤ n, n ≥ 2, or A_4, S_4, A_5 (Darmon–Diamond–Taylor 2007, Thm 2.47, p. 81). `isConj_standard_projective_image`: q ≥ 4: PSL_2(F_q), resp. PGL_2(F_q), is unique up to conjugacy; A_5 ~ PSL_2(F_4), PSL_2(F_5) in char 2, 5 (Dickson 1901, §260, p. 286). `projective_image_of_absolutelyIrreducible`: abs. irreducible G ⊂ GL_2(k), k finite ⇒ π(G) is noncyclic, fixes no point, and is dihedral, exceptional, or ~ PSL_2(F_0)/PGL_2(F_0) with F_0 = F_p(tr(g)²/det g : g ∈ G) (Khare–Wintenberger 2009 I, §6, p. 10). `commutator_eq_SL2_of_standard_projective_image`: finite G ⊂ GL_2(k̄), π(G) ~ PSL_2(F_0) or PGL_2(F_0), #F_0 ≥ 4 ⇒ up to conjugation [G, G] = SL_2(F_0), G ⊂ k̄^×·GL_2(F_0); conversely SL_2(F_1) ⊂ G, #F_1 ≥ 4 ⇒ π(G) standard over some F_0 ⊃ F_1 (Allen et al. 2023, Lemma 7.1.6, p. 1090). `dyadic_solvable_projective_image`, `dyadic_nonsolvable_projective_image`: p = 2, G ⊂ GL_2(k̄) finite irreducible: π(G) is dihedral of order 2n, n odd ≥ 3, if G is solvable, and ~ PSL_2(F_{2^r}), r ≥ 2, otherwise (Khare–Wintenberger 2009 I, Lemma 6.1, p. 10). `large_order_projective_image`: abs. irreducible G ⊂ GL_2(k̄) with an element of projective order > 5 is not exceptional, so is projectively dihedral if solvable, and contains a conjugate of SL_2(F_p) if in no torus normaliser (Clozel–Thorne 2017, Lemma 7.5, p. 48). `minimal_index_PSL2`: proper subgroups of PSL_2(F_q) (of SL_2(F_q) for q ≥ 4) have index ≥ q + 1 unless q ∈ {2, 3, 5, 7, 9, 11}, with least index 2, 3, 5, 7, 6, 11 (Dickson 1901, §262, p. 286).

### 4.5 Serre over a prime field

V a plane over F_ℓ, G ⊂ GL(V). `contains_SL_or_le_borel_of_dvd_card`: ℓ | #G ⇒ G ⊃ SL(V) or G in a Borel (Serre 1972, Prop. 15, p. 280). `projective_image_of_coprime_card`: ℓ ∤ #G ⇒ π(G) cyclic (G in a Cartan), dihedral (G in a Cartan normaliser), A_4, S_4 or A_5 (needs ℓ ≡ ±1 mod 5); for ℓ = 2, 3 only the first two occur (Serre 1972, Prop. 16, p. 281). `semisimple_subgroup_classification`: G semisimple on V ⇒ G ⊃ SL(V), or G in a Cartan or its normaliser, or π(G) ∈ {A_4, S_4, A_5}; reducible semisimple G lies in a split Cartan. `eq_top_or_le_borel_or_le_normalizer_of_cartan_le`: G ⊇ a Cartan or a split half-Cartan, ℓ ≠ 5 in the split cases ⇒ G = GL(V) or G lies in a Borel or a Cartan normaliser (Serre 1972, Prop. 17, p. 282). `eq_top_of_normal_of_cartan_le`: ℓ ≠ 2, G normal in GL(V) containing a Cartan or split half-Cartan ⇒ G = GL(V) (Serre 1972, Prop. 18, p. 283).

### 4.6 Dihedral and bad dihedral images

`projective_image_klein_of_irreducible_of_abelian`: k algebraically closed, G ⊂ GL_2(k) irreducible, π(G) abelian ⇒ char k ≠ 2, π(G) ≅ (ℤ/2)², nonscalar elements have trace 0 and scalar square; so π(G) is never cyclic (Dieulefait–Pacetti 2021, Lemma 1.13, p. 8).

`dihedral_iff_induced`, Γ profinite, k an algebraically closed topological field, ρ : Γ → GL_2(k) continuous with π∘ρ of open kernel and finite image: ρ is irreducible with π(ρ(Γ)) dihedral of order 2n, n ≥ 2, iff ρ ≅ Ind_Δ^Γ χ for an open Δ of index 2 and a continuous χ : Δ → k^× with χ ≠ χ^σ; then ρ|_Δ ≅ χ ⊕ χ^σ, π(ρ(Δ)) is cyclic of order n = ord(χ/χ^σ), char k ∤ n, trace 0 off Δ, det ρ = (χ ∘ Ver)·ε_Δ (ε_Δ trivial in char 2), Δ unique for n ≥ 3, three choices for n = 2. For char k ≠ 2, irreducible ρ is induced from Δ iff ρ ⊗ ε_Δ ≅ ρ. If irreducible ρ is reducible on an open normal Γ′ with Γ/Γ′ abelian, ρ(Γ′) is diagonalisable, with two eigencharacters (ρ induced from an eigenline stabiliser ⊃ Γ′) or scalar (char k ≠ 2, π(ρ(Γ)) ≅ (ℤ/2)²). In char 2, n is odd ≥ 3 and a finite-order det ρ has odd order (Serre 1972, §2.6, p. 282).

Define, for p odd, `cyclotomicSquareSubfield` F′ ⊂ F(ζ_p), the fixed field of the squares of Gal(F(ζ_p)/F) (F′ = F iff [F(ζ_p) : F] odd), and `IsBadDihedral` ρ̄, for continuous ρ̄ : G_F → GL_2(k), k finite of char p or k̄: ρ̄ abs. irreducible, ρ̄|_{G_{F′}} not. API: `cyclotomicSquareSubfield_rat` (F′ = ℚ(√p*), p* = (−1)^{(p−1)/2} p); `isBadDihedral_iff_cyclotomic` (same with F(ζ_p)); `isBadDihedral_tensor_character`, `isBadDihedral_baseChange`; `IsBadDihedral.projInertia_card_le_two` (order 2 for F = ℚ); `IsBadDihedral.isInduced`. (Dieulefait–Pacetti 2021, Def. 1.12, p. 7.)

**Checks.**
- `isBadDihedral_x3_minus_x_minus_1`, `isBadDihedral_requires_absolute`: the S_3-representation of x³ − x − 1 over F_23 is bad dihedral, though irreducible over F_23 on G_{ℚ(√−23)}.
- `not_isBadDihedral_of_SL2_le`, `badDihedral_p_three`, `isBadDihedral_iff_induced`: SL_2(F_p) ⊂ ρ̄(G_ℚ), p ≥ 5: not bad dihedral; ℚ(√−3) = ℚ(ζ_3); bad dihedral iff induced from G_{F′}, [F′ : F] = 2, χ ≠ χ^σ.
- `cyclotomicSquareSubfield_sqrt_five`, `not_isBadDihedral_of_odd_cyclotomic_degree`: F = ℚ(√5), p = 5: F(√p*) = F but F′ = ℚ(ζ_5); [F(ζ_p) : F] odd ⇒ nothing is bad dihedral.

`badDihedral_criterion`: for L/F finite cyclic Galois, F′ the fixed field of the squares of Gal(L/F), k algebraically closed and ρ : G_F → GL_2(k) with open kernel, ρ|_{G_{F′}} is irreducible iff ρ|_{G_L} is; hence for p odd, k finite of char p, m ≥ 1, abs. irreducibility of ρ̄ on G_{F′}, G_{F(ζ_p)}, G_{F(ζ_{p^m})} is equivalent. A bad dihedral ρ̄ has ρ̄ ⊗ k̄ ≅ Ind_{G_{F′}} χ, χ ≠ χ^σ, dihedral projective image of order 2n with p ∤ n, and |ρ̄(G_F)| prime to p; for F = ℚ, π(ρ̄(I_p)) has order 2, so for (ρ̄|_{I_p}) ⊗ k̄ ≅ ψ_1 ⊕ ψ_2 (Layer 2), ψ_1/ψ_2 = ω^a with (p − 1) | 2a in niveau 1, ψ_1 = ω_2^b, ψ_2 = ω_2^{pb} with (p + 1) | 2b in niveau 2 (Dieulefait–Pacetti 2021, Lemmas 1.13–1.14, p. 8).

### 4.7 Restriction and large image

`image_restrict`: ρ : G_F → GL_n(A) continuous, A discrete, K = (F^sep)^{ker ρ}, F′/F finite separable: ρ(G_{F′}) is the image of Gal(K/K ∩ F′), so ρ(G_{F′}) = ρ(G_F) when K ∩ F′ = F, and ρ(G_{F′(ζ_p)}) = ρ(G_{F(ζ_p)}) when F′ is linearly disjoint from K(μ_p), likewise for projective images with the projective kernel field M; a perfect H ⊂ ρ(G_F) survives soluble towers F′/F; abs. irreducibility and Dickson type pass to F′ in these cases, "not bad dihedral" only under disjointness from K(μ_p) (Allen et al. 2023, Lemma 7.1.6, p. 1090).

`image_restrict_cyclotomic`, ρ̄ : G_F → GL_2(k) continuous, k finite of char p, G = ρ̄(G_F), H = ρ̄(G_{F(ζ_p)}): (a) p odd: abs. irreducibility on G_{F(ζ_{p^m})}, G_{F(ζ_p)}, G_{F′} is equivalent; (b) ρ̄ irreducible, ρ̄|_{G_{F(ζ_p)}} not abs. irreducible ⇒ G in a Cartan normaliser of GL_2(k); (c) if also k = F_p, det ρ̄ = χ̄_p: up to conjugacy G = C_s^+(3) or G ⊂ C_ns(3) for p = 3, and G ⊂ C_ns^+(5) for p = 5 with [F(ζ_5) : F] = 4; (d) p ≥ 5, SL_2(F_p) ⊂ G ⊂ GL_2(F_p), det ρ̄ trivial on G_{F(ζ_p)} ⇒ H = SL_2(F_p); G ⊃ SL_2(F_q), q ≥ 4 ⇒ H ⊃ SL_2(F_q); (e) p > 3, ρ̄(G_{F̃}) ⊃ SL_2(F_p) (F̃ the normal closure), F′/F finite, linearly disjoint from F̄^{ker ρ̄}, p unramified in F′/ℚ ⇒ ζ_p ∉ F̄^{ker ad ρ̄}·F′; (f) ζ_5 ∉ F, G ⊂ GL_2(F_5), det ρ̄ = χ̄_5, π(H) ~ PSL_2(F_5) ⇒ the projective kernel field omits ζ_5; (g) l ≥ 3, Δ ⊴ GL_2(F_l), det Δ = F_l^× ⇒ Δ = GL_2(F_l); (h) p > 2, ρ̄|_{G_{F(ζ_p)}} abs. irreducible ⇒ H⁰(G_F, ad⁰ρ̄) = H⁰(G_F, ad⁰ρ̄(1)) = 0 (ad⁰: Layer 7 `ContinuousRep.adZero`) (Caraiani–Newton 2023, Lemmas 6.1.4, 7.1.1, pp. 88–92; Allen et al. 2023, Lemmas 7.1.6, 7.1.8, p. 1090; Khare–Wintenberger 2009 II, Lemma 4.3, p. 40).

`large_image_persistence`, p ≥ 5, finite G ⊂ GL_2(k̄) containing a conjugate of SL_2(F_{p^a}), p^a ≥ 5: for a ≥ 2 every H ⊂ G of index < 2p contains that conjugate; a perfect H ⊂ ρ̄(G_F) persists under soluble towers; a continuous ρ̄ : G_ℚ → GL_2(k̄) unramified outside p with ρ̄|_{G_{ℚ_p}} abs. irreducible and ρ̄|_{I_p} ≅ ω_2^a ⊕ ω_2^{pa}, gcd(a, p + 1) = 1, has image ⊇ a conjugate of SL_2(F_p) (Newton–Thorne 2026, Lemma 2.3, p. 11; Boxer–Calegari–Gee 2025, Thm 3.1, p. 516).

`charTwo_residual_image`, F finite of char 2, F_0 ⊂ F with |F_0| = 2^r, r ≥ 2, G_0 = SL_2(F_0) on Ad = M_2(F) by conjugation, Z = F·1 ⊂ Ad⁰ = {Tr = 0}, continuous abs. irreducible ρ̄ : G_K → GL_2(F) with non-solvable image, K a number field: π(ρ̄(G_K)) ~ PGL_2(F_0) = PSL_2(F_0) ≅ SL_2(F_0) for such an F_0; H⁰(G_0, Ad) = H⁰(G_0, Ad⁰) = Z, H⁰(G_0, Ad/Z) = H⁰(G_0, (Ad⁰)^*) = 0 = H¹(G_0, Ad); the G_0-submodules of Ad are 0, Z, Ad⁰, Ad; one-dimensional F[G_0]-modules are trivial, Ad⁰/Z is the Frobenius-twisted natural module (Khare–Wintenberger 2009 II, Lemma 4.3, p. 40).

### Dependencies

Layers 1, 2 and 7 as cited; Mathlib and the Tau Ceti GL_2 toolkit.

## Layer 5: recognition by Frobenius polynomials

Frobenius elements are dense in `G_K`, so a continuous representation is determined up to semisimplification by its Frobenius characteristic polynomials on a density-one set of places. It also delivers descent to the field of traces with its Brauer-class obstruction, Carayol's lemma, Haar-measure Chebotarev, `GSp₄` semisimplicity criteria and potentially abelian representations. Conventions: `K` is a number field, `G_K` its absolute Galois group with the Krull topology, Frobenius is ARITHMETIC Frobenius `Frob_w` at a place `w | v` (all `w | v` allowed), density is Dirichlet density unless natural density is named, `ρ^{ss}` is the Layer 1 semisimplification; namespace `TauCeti.GaloisRep`.

### 5.1 Density of Frobenius elements

Prove `hasDirichletDensity_frobeniusSet_openNormal`: for `Σ` a set of finite places of `K` of Dirichlet density one, `U` an open normal subgroup of `G_K` and `g ∈ G_K`, the set of `v ∈ Σ` unramified in `K̄^U` such that some `w | v` has every Frobenius lift in `gU` has Dirichlet density `#C/[G_K : U] > 0`, `C` the conjugacy class of `gU`. (Serre 1981, §2.1, Théorème 1, p. 131; Darmon–Diamond–Taylor 2007, Thm 2.3, p. 52.) *Needs:* `TauCetiRoadmap.Chebotarev` layer 10, `TauCetiRoadmap.ArithmeticDirichletSeries` layer 7, Mathlib `IsArithFrobAt`, `NumberField.Set.HasDirichletDensity`, `TauCeti.NumberField.Chebotarev.frobeniusPrimeSet`, `TauCeti.NumberField.isArithFrobAt_eq_of_isUnramifiedAt`, Layer 2.

Prove `dense_frobenius`: for `Σ` of density one, the set `Frob(Σ)` of all arithmetic Frobenius lifts above `v ∈ Σ` is dense in `G_K` (Deligne–Serre 1974, 6.12, p. 523). Prove `dense_map_frobenius` and `eq_on_of_eq_on_frobenius`: if `φ : G_K → H` is a continuous homomorphism to a Hausdorff group with `φ(I_w) = 1` above every `v ∈ Σ`, the well-defined `φ(Frob_w)` are dense in the compact subgroup `φ(G_K)`, and two continuous maps from `φ(G_K)` to a Hausdorff space agreeing on them agree everywhere (Darmon–Diamond–Taylor 2007, Thm 2.3, p. 52). *Needs:* Layer 2 (decomposition group at a place).

Prove `exists_frobenius_eq_of_finite_image`: for `H` finite discrete, `φ : G_K → H` continuous, `S` its finite ramification set and `T` any finite set of finite places, every `h ∈ φ(G_K)` equals `φ(Frob_w)` for some `w | v` on a set of `v ∉ S ∪ T` of Dirichlet density `#(class of h)/#φ(G_K) > 0`, hence infinite. Prove `forall_range_of_forall_frobenius`: a property holding at `φ(Frob_w)` for all `w` above all `v` outside a finite set holds on all of `φ(G_K)`. (Deligne–Serre 1974, 6.12, p. 523; Serre 1981, §2.1, Théorème 1, p. 131.) *Needs:* Layer 1 (finite coefficients and finite quotients), Mathlib `ConjClasses`.

### 5.2 Prescribed quadratic residue symbols

Prove `Multiquadratic.exists_aut_apply_sqrt_eq_iff` and `Multiquadratic.finrank_eq_card_span`: for nonzero integers `d₁,…,d_r`, signs `ε_i ∈ {±1}` and `M = ℚ(√d₁,…,√d_r)`, an automorphism `σ` of `M/ℚ` with `σ(√d_i) = ε_i√d_i` for all `i` exists iff `∏_{i∈J} ε_i = 1` for every `J` with `∏_{i∈J} d_i` a square in `ℚ`; and `[M : ℚ]` is the order of the subgroup of `ℚ^×/ℚ^{×2}` generated by the `d_i`. *Needs:* `TauCeti.Multiquadratic.galoisGroupEquiv`, `.galoisGroupEquiv_symm_apply_gen`, `.card_aut_adjoin_range`.

Prove `legendreSym_prescribed_tfae`: with the same data these are equivalent: (i) infinitely many odd primes `p ∤ d₁⋯d_r` have `legendreSym p d_i = ε_i` for all `i`; (ii) that set of primes has Dirichlet density `2^{-m} > 0`, where `2^m = [M : ℚ]`; (iii) the sign condition above. In particular two non-squares `d₁, d₂` (even if `d₁d₂` is a square) are both nonresidues at infinitely many primes, while three non-squares with `d₁d₂d₃` a square never are. (Darmon–Diamond–Taylor 2007, Thm 2.3, p. 52, and the remark after Thm 2.4.) *Needs:* `exists_frobenius_eq_of_finite_image`, Mathlib `legendreSym`, `TauCeti.NumberField.exists_isArithFrobAt_multiquadratic`, `TauCeti.NumberField.isArithFrobAt_apply_sqrt`.

### 5.3 Recognition on a dense subset

Here `Γ` is profinite, `E₁, E₂` topological fields with continuous embeddings into a common Hausdorff topological field `E`, `ρ_i : Γ → GL(V_i)` continuous `n`-dimensional over `E_i`, `W_i = V_i ⊗_{E_i} E`.

Prove `semisimplification_iso_of_charpoly_eq_on_dense`: if `det(X − ρ₁(γ)) = det(X − ρ₂(γ))` in `E[X]` for all `γ` in a dense `D ⊂ Γ`, then `W₁^{ss} ≅ W₂^{ss}`; if both `W_i` are semisimple, `W₁ ≅ W₂`. Prove `semisimplification_iso_of_frobeniusCharpoly_eq`: for `Γ = G_K`, if both representations are unramified at every `v` in a density-one set `Σ` and `det(X − ρ₁(Frob_w)) = det(X − ρ₂(Frob_w))` there, then `W₁^{ss} ≅ W₂^{ss}`; no finiteness of either ramification set is assumed. Prove `semisimplification_iso_of_trace_eq_on_dense`: if `n!` is invertible in `E` and `tr ρ₁ = tr ρ₂` on a dense `D ⊆ Γ`, then `W₁^{ss} ≅ W₂^{ss}`; for `G_K` take `D` the conjugates of the Frobenius elements over a density-one unramified set. (Darmon–Diamond–Taylor 2007, Prop. 2.6 with (b), pp. 53–54; Deligne–Serre 1974, Lemme 3.2 with proof and footnote (1), p. 513; Chenevier 2008, Ex. 2.31, p. 38.) *Needs:* Layer 1 (coefficient extension, semisimplification, Brauer–Nesbitt by polynomials and by traces), Layer 2 (Frobenius characteristic polynomial), `dense_map_frobenius`.

**Checks.**
- `semisimplification_iso_of_trace_eq_on_dense_not_char_two`: for `Γ = ℤ/3`, `E = F₄`, `n = 2` (so `2! = 0` in `E`), the representations `1 ⊕ 1` and `χ ⊕ χ` with `χ` a faithful character `ℤ/3 → F₄^×` have the same trace `0` everywhere but characteristic polynomials `(X − 1)²` and `(X − ω)²`, and non-isomorphic semisimplifications; the trace statement without `n!` invertible is false, while the polynomial statement applies.
- `semisimplification_iso_of_charpoly_eq_on_dense_zero_rank`: for `n = 0` both sides are the zero representation and the conclusion holds trivially.
- `semisimplification_iso_not_of_discontinuous_embedding`: for `E₁ = E₂ = ℚ_ℓ` embedded in `ℚ̄_ℓ` through a discontinuous field automorphism on one side, two characters of `G_ℚ` with equal Frobenius values at every unramified prime need not be isomorphic over `ℚ̄_ℓ`; continuity of the embeddings is used.

### 5.4 Rank two

For `A` a commutative ring, `Γ` a group and `ρ : Γ → GL₂(A)`, put `T = tr ∘ ρ`, `δ = det ∘ ρ`. Prove `rankTwo_trace_det_identities`: `δ : Γ → A^×` is a homomorphism, `T(1) = 2`, `T(gh) = T(hg)`, and `δ(g)T(g⁻¹h) − T(g)T(h) + T(gh) = 0` for all `g, h`. Prove `rankTwo_determinant_eq_iff`: `(T, δ)` corresponds to the determinant law `det ∘ ρ` on `A[Γ]` under the bijection of two-dimensional determinants with such pairs; for two rank-two representations, equality of all characteristic polynomials, of `(T, δ)`, and of the determinant laws on `A[Γ]` are equivalent. Witness of the identity: for `g = h = diag(a, b)` it reads `2ab − (a + b)² + (a² + b²) = 0`, and for `g = h = 1` it reads `2 − 4 + 2 = 0`; with `T(g⁻¹h)` replaced by `T(gh⁻¹)` it fails for non-commuting `g, h`. (Chenevier 2008, Lemma 1.9, p. 11.) *Needs:* Mathlib `Matrix.trace_mul_comm`, `Matrix.aeval_self_charpoly`, `Matrix.charpoly_fin_two`, IntegralHeckeAndGaloisDeterminants IHG.0 (dimension-two determinants).

Prove `rankTwo_charpoly_eq_of_eq_on_dense` and `rankTwo_semisimplification_iso`: if `A` is Hausdorff, `Γ` topological, and two continuous rank-two representations have equal trace and determinant on a dense subset, their characteristic polynomials and determinant laws agree everywhere; if `A` is a field their semisimplifications are isomorphic; over `G_K` a density-one unramified Frobenius set suffices, with no invertibility of `2`. (Dieulefait–Pacetti 2021, Remark 4, p. 7.) *Needs:* `dense_map_frobenius`, Layer 1.

### 5.5 Image algebra and Brauer class

Let `k` be a field with algebraic closure `k̄`, `Γ` a group (no topology) and `ρ : Γ → GL_n(k̄)` absolutely irreducible (Layer 1), so `n ≥ 1`; no condition on the characteristic. Define `traceField` as `k(ρ) = k(tr ρ(γ) : γ ∈ Γ) ⊂ k̄`; `imageAlgebra` as `B(ρ)`, the `k(ρ)`-span of `ρ(Γ)` in `M_n(k̄)`; `brauerClass` as the class `β(ρ) ∈ Br(k(ρ))` of `B(ρ)`; `schurIndex` as `s(ρ) = TauCeti.Algebra.index k(ρ) B(ρ)`. API: `imageAlgebra_isCentralSimple` (central simple over `k(ρ)` of dimension `n²`); `imageAlgebra_baseChange` (`B(ρ) ⊗_{k(ρ)} k̄ ≅ M_n(k̄)`); `brauerClass_congr` (`ρ ≅ ρ'` gives equal `k(ρ)` and `β(ρ)`); `brauerClass_eq_one_iff` (`β(ρ) = 1` iff `B(ρ) ≅ M_n(k(ρ))` iff `ρ` is conjugate into `GL_n(k(ρ))`); `brauerClass_baseChange` (for `k(ρ) ⊂ k' ⊂ k̄`, `β(ρ) ↦ [k' ⊗ B(ρ)]`, and `ρ` is realisable over `k'` iff `k'` splits `B(ρ)`); `brauerClass_finite` (`k(ρ)` finite forces `β(ρ) = 1`); `imageAlgebra_eq_quotient_ker` (if `k(ρ) = k` and `D` is the determinant of `ρ` descended to `k`, `B(ρ) ≅ k[Γ]/ker D`); `charpoly_mem_traceField` (`det(X − b) ∈ k(ρ)[X]` for `b ∈ B(ρ)`, the reduced characteristic polynomial, so the `det(X − ρ(γ))` generate `k(ρ)`); `schurIndex_spec` (`B(ρ) ≅ M_a(Δ)`, `Δ` a division algebra of dimension `s(ρ)²`, `n = a·s(ρ)`, in every such presentation); `schurIndex_dvd` (`s(ρ) ∣ n`); `schurIndex_eq_one_iff` (`s(ρ) = 1` iff `β(ρ) = 1`). (Barnet-Lamb–Gee–Geraghty–Taylor 2014, Lemma A.1.5, proof, p. 85; Chenevier 2008, Def.-Prop. 2.18(iii), p. 32; Deligne–Serre 1974, Lemme 6.13, proof, p. 523.) *Needs:* Mathlib `BrauerGroup`; `TauCeti.BrauerGroup.instCommGroup`, `.mk`, `.baseChange`, `.mk_eq_one_iff_isSplittingField`, `TauCeti.CSA.of`, `TauCeti.Algebra.index`, `.index_dvd_deg`, `.isSplittingField_self_iff_index_eq_one`, `TauCeti.IsSimpleRing.exists_algEquiv_matrix_centralDivisionRing`, `TauCeti.subsingleton_brauerGroup_of_finite`, `TauCeti.Quaternion.mk_ne_one`, IHG.0, `Matrix.algHom_eq_conj_of_isLocalRing`.

**Checks.**
- `brauerClass_quaternion_real`: for the two-dimensional irreducible `ρ : Q₈ → GL₂(ℂ)` and `k = ℝ`, `k(ρ) = ℝ`, `B(ρ) ≅ ℍ`, `β(ρ) ≠ 1`; a definition trivialising `β` for real traces would fail.
- `brauerClass_one_dim`: for a character, `B(ρ) = k(ρ)` and `β(ρ) = 1`.
- `brauerClass_finite_field`: for `k = 𝔽_q` and `ρ` absolutely irreducible with finite image, `k(ρ)` is finite and `β(ρ) = 1`, as `TauCeti.subsingleton_brauerGroup_of_finite` says.
- `imageAlgebra_not_field_span`: for faithful `χ : ℤ/3 → ℚ̄^×`, `k = ℚ`, the `ℚ`-span `ℚ(ζ₃)` has dimension `2 ≠ 1` and is not central over `ℚ`, so the `k`-span is wrong; the `k(ρ)`-span has dimension `1`.
- `schurIndex_quaternion_rational`: for the `Q₈` representation, `k(ρ) = k`, `s(ρ) = 2` for `k = ℚ, ℚ₂` and `s(ρ) = 1` for `k = ℚ_ℓ`, `ℓ` odd (`(−1,−1)_k` ramifies exactly at `2, ∞`).

Prove, for `k` a field and `ρ₁,…,ρ_r` pairwise nonisomorphic finite-dimensional absolutely irreducible `k`-representations of a group `Γ`: `surjective_toPiEnd` (`k[Γ] → ∏_i End_k(V_i)` is surjective, by Jacobson density); `linearIndependent_trace` (the `tr ρ_i : Γ → k` are linearly independent); `iso_of_trace_eq_of_absolutelyIrreducible` (equal traces give isomorphic absolutely irreducible representations, in any characteristic); `twist_iso_iff_trace_fixed` (for `k' ⊂ k`, `σ : k' → k` an embedding and `ρ` absolutely irreducible over `k'`, `ρ ⊗_σ k ≅ ρ ⊗ k` iff `σ` fixes the traces). (Chenevier 2008, Def.-Prop. 2.18, last sentence, p. 32.) *Needs:* Mathlib `jacobson_density`, `LinearMap.bijective_or_eq_zero`.

### 5.6 The descent obstruction

Let `k` be perfect, `W` a finite-dimensional simple `k[Γ]`-module with image algebra `B = M_a(Δ)`, `Z` the centre of `Δ`, `[Δ : Z] = s²`, `m = as`. Prove `simpleModule_baseChange_decomp`: `W ⊗ k̄ ≅ ⊕_{τ : Z → k̄} ρ_τ^{⊕s}` with the `ρ_τ` pairwise nonisomorphic absolutely irreducible of dimension `m`, so `dim_k W = m·s·[Z : k]`; `constituent_traceField_schurIndex`: each `ρ_τ` has trace field `τ(Z)`, image algebra `B ⊗_{Z,τ} τ(Z)` and Schur index `s`; `exists_unique_simpleModule_of_absolutelyIrreducible`: an absolutely irreducible `ρ` over `k̄` with trace field finite over `k` lies in the scalar extension of a unique simple `k[Γ]`-module `W_ρ`; simple modules correspond to `Gal(k̄/k)`-orbits of such `ρ`. (Chenevier 2008, Thm 2.16, p. 31; Barnet-Lamb–Gee–Geraghty–Taylor 2014, Lemma A.1.5, proof, p. 85.) *Needs:* 5.5, `TauCetiRoadmap.RepresentationTheory/SemisimpleAlgebras` layer 2.

Let `ρ` be a finite-dimensional semisimple representation over `k̄` whose irreducible constituents have trace fields finite over `k`. Prove `charpoly_mem_iff_galois_invariant`: all `det(X − ρ(γ))` lie in `k[X]` iff `Gal(k̄/k)` preserves the multiset of constituents with multiplicities. Prove `exists_form_iff_schurIndex_dvd`: if that multiset is Galois-invariant and, for each orbit `O`, `Z_O` is its trace field, `s_O` its Schur index and `m_O` its common multiplicity, then `ρ` has a `k`-form iff `s_O ∣ m_O` for every `O`. Prove `exists_form_iff_brauerClass_eq_one`: for `ρ` absolutely irreducible with trace field `k`, a `k`-form exists iff `β(ρ) = 1`, and for `k ⊂ L ⊂ k̄` an `L`-form exists iff `β(ρ)` dies in `Br(L)`. Prove `determinant_eq_prod_norm_nrd`: for a `k`-valued determinant `D` attached to `ρ`, `D = ∏_O N_{Z_O/k} ∘ Nrd_{S_O/Z_O}^{m_O}`, `S_O` the central simple image algebra of `O`; so the determinant descends even without a `k`-form. (Barnet-Lamb–Gee–Geraghty–Taylor 2014, Lemma A.1.5, proof, p. 85; Chenevier 2008, Thm 2.16, p. 31, and Def. 2.19, p. 33; Deligne–Serre 1974, Lemme 6.13, proof, p. 523.) *Needs:* Layer 1 (Brauer–Nesbitt, semisimplification), IHG.1.

### 5.7 Realisation over finite fields and trace fields

Prove `exists_continuous_form_of_charpoly_mem`: for finite fields `k ⊂ k'`, `Γ` profinite and `ρ : Γ → GL_n(k')` continuous semisimple with all characteristic polynomials in `k[X]`, there is a continuous `k`-form with the same kernel. Prove `residual_exists_form_over_frobeniusField`: for `ρ : G_K → GL_n(F̄_p)` continuous semisimple (discrete coefficients), the field `k` generated over `F_p` by the coefficients of the Frobenius polynomials at all unramified finite places is finite and `ρ` is the base change of a continuous `k`-representation. (Deligne–Serre 1974, Lemme 6.13 with proof, p. 523.) *Needs:* `exists_form_iff_schurIndex_dvd`, `forall_range_of_forall_frobenius`, Layer 1 (residual descent to a finite field, finite quotients), `TauCeti.subsingleton_brauerGroup_of_finite`.

Let `M` have characteristic zero, `M̄` its algebraic closure and `r : Γ → GL_n(M̄)` semisimple with all traces in `M`. Prove `imageAlgebra_semisimple_baseChange`: the `M`-span `B` of `r(Γ)` is a finite-dimensional semisimple `M`-algebra and `B ⊗_M M̄` maps isomorphically onto the `M̄`-span of `r(Γ)`. Prove `exists_form_of_distinct_eigenvalues`: if some `r(g₀)` has `n` distinct eigenvalues in `M`, then `r` has an `M`-form. Prove `continuous_form_of_distinct_eigenvalues`: if moreover `Γ` is profinite, `M` is a coefficient field and `r` is continuous, the `M`-form is continuous and admits a stable `O_M`-lattice. (Barnet-Lamb–Gee–Geraghty–Taylor 2014, Lemma A.1.5, p. 85, and Lemma 5.3.1, proof, p. 71.) *Needs:* 5.6, Layer 1 (framed representations, stable lattices).

### 5.8 Haar measure on open matrix groups

Let `A` be a compact Hausdorff topological ring with additive Haar probability `μ⁺`. Prove `haarProb_map_mul_unit`: left and right multiplication by a unit preserve `μ⁺`; `haarProb_eq_restrict_addHaar`: if `G ⊂ A^×` is compact with open image in `A`, `TauCeti.haarProb G` is the normalised restriction of `μ⁺`; `addHaar_GL_eq_prod`: for `A = M_n(O_E)` with residue field of size `q`, `μ⁺(GL_n(O_E)) = ∏_{i=1}^n (1 − q^{-i})`. (Serre 1981, Introduction, p. 124.) *Needs:* Mathlib `MeasureTheory.distribHaarChar_mul`, `MeasureTheory.Subgroup.index_mul_measure`, `Matrix.card_GL_field`; `TauCeti.haarProb`.

Prove `addHaar_zeroLocus_eq_zero`: for `A` a compact Hausdorff second-countable topological integral domain without isolated points and a nonzero polynomial in `N` variables over `A`, the zero set in `A^N` is closed and null for product Haar probability; `haarProb_zeroLocus_eq_zero`: for `G` open in `GL_n(O_E)` and a nonzero polynomial over `E`, the zero set on `G` is Haar-null, so a polynomial vanishing on a positive-measure subset of `G` is zero. (Serre 1981, §6.4, proof of Prop. 13, p. 168.) *Needs:* Mathlib `MeasureTheory.Measure.measure_prod_null`, `MvPolynomial.finSuccEquiv`, `Polynomial.rootSet_finite`.

**Checks.**
- `addHaar_zeroLocus_not_of_finite`: for `A = F_q` (discrete, every point isolated) the nonzero polynomial `X^q − X` vanishes on all of `A`, so its zero set has measure `1`; the hypothesis that `A` has no isolated points is needed.
- `addHaar_GL_eq_prod_rank_zero`, `addHaar_GL_eq_prod_padic`: for `n = 0` the product is empty and the measure is `1`; for `O_E = ℤ_p`, `n = 1`, `μ⁺(ℤ_p^×) = 1 − p^{-1}`.
- `haarProb_zeroLocus_not_of_zero_polynomial`: the zero polynomial has zero set `G` of measure `1`; "nonzero" is needed.

Prove `Matrix.algHom_eq_conj_of_isLocalRing`: for `R` a commutative local ring and `d ≥ 0`, every unital `R`-algebra homomorphism `φ : M_d(R) → M_d(R)` is `x ↦ gxg⁻¹` for some `g ∈ GL_d(R)` unique up to `R^×`, so `φ` is an automorphism. Locality (used only to make projective modules free) is necessary: over `ℤ[√−5]` with `I = (2, 1+√−5)`, `I ⊕ I ≅ R²` gives a non-inner automorphism of `M₂(R)`. (Chenevier 2008, Thm 2.22, proof of (i), p. 34.) *Needs:* Mathlib `Module.free_of_flat_of_isLocalRing`, `Matrix.mem_range_scalar_of_commute_single`.

### 5.9 Haar-measure Chebotarev

Let `ρ : G_K → G` be a continuous surjection onto a profinite group, unramified outside a finite set `S`, `μ = TauCeti.haarProb G`, and for conjugation-stable `C ⊂ G` put `Σ_C = {v ∉ S : ρ(Frob_v) ∈ C}`. Prove `hasDensity_frobeniusSet_of_isClopen`: if `C` is clopen, `Σ_C` has Dirichlet and natural density `μ(C)`; `upperDirichletDensity_le_haarProb_of_isClosed`: if `C` is closed, the upper Dirichlet density of `Σ_C` is at most `μ(C)`, so positive upper density forces `μ(C) > 0`; `hasDirichletDensity_of_frontier_null`: if `μ(∂C) = 0`, `Σ_C` has Dirichlet density `μ(C)`. (Calegari–Geraghty 2020, App. §A.4, proof of Lemma A.8, p. 890; Serre 1981, Introduction, p. 124, and §7.2, Théorème 15 with Cor. 1–2, pp. 174–175.) *Needs:* 5.1, `TauCetiRoadmap.Chebotarev` layers 10 and 14, `TauCetiRoadmap.ArithmeticDirichletSeries` layer 7, Mathlib `OpenNormalSubgroup`, `TauCeti.haarProb_apply`.

Prove `density_zero_of_polynomial_condition`: for `G` open in `GL_n(O_E)` and `f` a polynomial on `M_n(E)` that is conjugation-invariant and not identically zero on `G`, the places with `f(ρ(Frob_v)) = 0` have density zero; for non-invariant `f`, the closed null set `⋂_{h∈G} h{f = 0}h⁻¹` gives the same for whole conjugacy classes. (Serre 1981, Introduction, p. 124.) *Needs:* 5.8.

### 5.10 Carayol's lemma

Let `R` be a complete Noetherian local ring with finite residue field `k` and maximal ideal `m`, `Γ` profinite, and `r, r' : Γ → GL_d(R)` continuous lifts of the same absolutely irreducible `ρ̄ : Γ → GL_d(k)`. Prove `carayol_conj_of_eq_on_dense`: equality of traces, or of characteristic polynomials, on a dense subset of `Γ` gives `r' = g r g⁻¹` with `g ∈ ker(GL_d(R) → GL_d(k))`, unique up to a scalar in `1 + m`; no invertibility of `d!` is assumed. (Chenevier 2008, Thm 2.22(i), p. 34, and Thm B, p. 4; Calegari–Geraghty 2020, §6.3, proof of Thm 6.13, p. 842.) *Needs:* IHG.1 (Cayley–Hamilton), IHG.0 (continuous determinants, matrix representations), Layer 1, `Matrix.algHom_eq_conj_of_isLocalRing`, Mathlib `Matrix.aeval_self_charpoly`, `dense_map_frobenius`.

Prove `GSp.exists_lift`: for `A` a Noetherian local ring that is `I`-adically complete for an ideal `I ⊆ m` (in particular `A` complete local and `I` any ideal, or `I` nilpotent), `a ≥ 1` and the standard perfect alternating form `J` on `A^{2a}`, every `ḡ ∈ GSp_{2a}(A/I)` lifts to `GSp_{2a}(A)` with any prescribed unit multiplier lifting that of `ḡ`, and `ḡ ≡ 1 mod m/I` lifts to `g ≡ 1 mod m`; `2 ∈ A^×` is not needed (the group scheme `GSp_{2a}` is smooth over `ℤ`, and smoothness gives the lifting along `A → A/I` under the completeness hypothesis). Prove `carayol_conj_symplectic`: if `d = 2a ≥ 2`, the characteristic polynomials agree on a dense subset and `r, r'` take values in `GSp_{2a}(R)` for the same `J` and multiplier `ν`, the strict conjugator lies in `ker(GSp_{2a}(R) → GSp_{2a}(k))`. Prove `carayol_glue`: for decreasing open ideals `a_j ⊆ m` cofinal in the `m`-adic topology, monic `P_γ ∈ R[X]` of degree `d` on a dense subset, and continuous lifts `r_j : Γ → GL_d(R/a_j)` of `ρ̄` with characteristic polynomial `P_γ mod a_j` there, strict conjugations make the `r_j` compatible and they glue to a continuous lift over `R`, unique up to strict conjugacy; with one fixed form and one `ν : Γ → R^×` reduced at every level, the lift lies in `GSp_{2a}(R)`. (Calegari–Geraghty 2020, §6.3, proof of Thm 6.13, p. 842.) *Needs:* Layer 7 (similitude groups), Mathlib `IsLocalRing`, `Matrix.GeneralLinearGroup`.

### 5.11 Semisimplicity criteria for `GSp₄`

Let `p` be prime, `ρ : G_ℚ → GSp₄(ℚ̄_p)` and `s : G_ℚ → GL_n(ℚ̄_p)` continuous, `n ≥ 1`, with `P_ρ(Frob_l)(s(Frob_l)) = 0` for `l` in a density-one set of primes where both are unramified, `P_ρ(g) = det(X − ρ(g))`. Prove `charpoly_annihilates_of_frobenius`: `P_ρ(g)(s(g)) = 0` for every `g ∈ G_ℚ` and on the Zariski closure of `(ρ, s)(G_ℚ)`. Prove `iso_pow_of_sp4_monodromy`: if the Zariski closure of `ρ(G_ℚ)` contains `Sp₄`, then `s ≅ ρ^{⊕m}` for some `m ≥ 1`. (Boxer–Calegari–Gee–Pilloni 2025, §4.11 and Prop. 4.11.1, p. 109.) *Needs:* `dense_map_frobenius`, Layer 1 (Baire descent), Layer 7 (Zariski closures, monodromy groups).

Suppose instead the Zariski closure contains `SL₂ × SL₂` and `ρ` is absolutely irreducible but `ρ|_{G_E} = ϱ ⊕ ϱ^c` for an index-two `G_E`, with similitude character `ν`, so `det ϱ = ν|_{G_E}`. Prove `constituent_eq_of_induced`: every irreducible subquotient of `s|_{G_E}` is `ϱ` or `ϱ^c`; `no_self_extension_of_induced`: `s|_{G_E}` has no nonsplit self-extension of `ϱ` or `ϱ^c`; `asai_charpoly_off_subgroup`: for `g ∉ G_E` the characteristic polynomial of `g` on `A = Asai(ϱ) ⊗ ν⁻¹` is `(X² − 1)(X² − tX + 1)`, `t = tr ϱ(g²)/ν(g)`, eigenvalues `1, −1, λ, λ⁻¹` with multiplicity; `iso_pow_of_induced_monodromy`: `s ≅ ρ^{⊕m}`, `m ≥ 1`. (Boxer–Calegari–Gee–Pilloni 2025, Prop. 4.11.2, proof, p. 111, with the eigenvalue list corrected.) *Needs:* Layer 1 (Clifford theory, twists), Layer 7 (tensor induction).

### 5.12 Potentially abelian representations

Let `F` be a field, `E` algebraically closed of characteristic zero, `ρ : G_F → GL_n(E)` continuous irreducible and `L/F` finite Galois with `ρ(G_L)` abelian. Prove `restrict_potentiallyAbelian`: `ρ|_{G_L} ≅ ⊕_{i=1}^b χ_i^{⊕a}`, `ab = n`, the `χ_i` distinct continuous characters forming one `Gal(L/F)`-orbit under `χ^σ(h) = χ(σ̃hσ̃⁻¹)`. Prove `potentiallyAbelian_iso_induction`: if `K_i` is the fixed field of the stabiliser of `χ_i`, then `[K_i : F] = b` and the `χ_i`-isotypic space `V_i` is an irreducible continuous `G_{K_i}`-representation with `ρ ≅ Ind_{G_{K_i}}^{G_F} V_i`. Prove `potentiallyAbelian_scalar_iff`: `b = 1` iff `ρ(G_L)` is scalar, which implies finite projective image; conversely finite projective image gives `b = 1` for `L` the fixed field of its kernel. (Boxer–Calegari–Gee–Pilloni 2025, Lemma 10.2.3 with proof, pp. 212–213.) *Needs:* Layer 1 (Clifford theory, continuous induction, finite Galois factorisation).

### 5.13 Curves over finite fields

Prove `functionField_chebotarev`: for `U` a normal geometrically connected scheme of finite type over `𝔽_q` and `φ : π₁(U) → H` a continuous surjection onto a finite group, every conjugacy class `C ⊂ H` equals `φ(Frob_x)` for a set of closed points `x ∈ |U|` of Dirichlet density `#C/#H > 0`; so Frobenius classes are dense in `π₁(U)`. (Used at Kisin–Zhou 2025, proof of Prop. 5.3.5, p. 54.)

Prove `curve_semisimplification_iso_of_frobeniusCharpoly_eq`: for `𝔽_q` of characteristic `p`, `C` a smooth geometrically connected curve over `𝔽_q`, `U ⊂ C` a nonempty open, `ℓ ≠ p`, `E` a finite extension of `ℚ_ℓ` or `ℚ̄_ℓ`, and `V₁, V₂` lisse `E`-sheaves of rank `n` on `C` (representations of `π₁(C, c̄)`), if `det(1 − Frob_x t | V_{1,x̄}) = det(1 − Frob_x t | V_{2,x̄})` in `E[t]` for every closed point `x ∈ |U|` (geometric or arithmetic Frobenius, the same for both), then `V₁^{ss} ≅ V₂^{ss}`, and `V₁ ≅ V₂` when both are semisimple. (Kisin–Zhou 2025, proof of Prop. 5.3.5, p. 54.) *Needs:* `functionField_chebotarev`, 5.3, Layer 1, InverseGaloisAndArithmeticFundamentalGroups IG.1 (`π₁(U) → π₁(C)` surjective for `C` normal).

### Dependencies

Layers 1, 2 and 7; `TauCetiRoadmap.Chebotarev` layers 10, 14, `TauCetiRoadmap.ArithmeticDirichletSeries` layer 7, `TauCetiRoadmap.RepresentationTheory/SemisimpleAlgebras` layer 2; IntegralHeckeAndGaloisDeterminants IHG.0, IHG.1; InverseGaloisAndArithmeticFundamentalGroups IG.1; Tau Ceti and Mathlib declarations as named.

## Layer 6: Tate modules of elliptic curves and abelian varieties

Layer 1 representations from torsion. Carrier: `TauCeti.AlgebraicGeometry.AbelianVariety` and Mathlib's `WeierstrassCurve`. Standing hypotheses: K a field, K̄ = `AlgebraicClosure K` ⊇ K^sep, G_K = `Field.absoluteGaloisGroup K` (compact: `TauCeti.absoluteGaloisGroupRestrictEquiv`); A an abelian variety over K of dimension g; l a prime ≠ char K; G_K acts on A(K̄) coordinatewise; torsion is over K^sep, never K. A3 = AbelianSchemesAndArithmeticModuli A3 (finite-level torsion, pairings). Unqualified names: `AlgebraicGeometry.AbelianVariety`; DDT = Darmon–Diamond–Taylor 2007.

### 6.1 The Tate module

Define `torsionPoints` A[N](K^sep) = `Submodule.torsionBy ℤ (A(K^sep)) N` (N invertible in K), `tateModule` T_lA = lim_n A[l^n](K^sep) along `mulBy` l, a `PadicInt l`-module with the limit topology, `rationalTateModule` V_lA = T_lA ⊗ Q_l, `adelicTateModule` T̂A = ∏_l T_lA. API: `torsionPoints_card`, `tateModule_free` (rank 2g), `tateModule_isModuleTopology`, `tateModule.toTorsion`, `tateModule.modPowEquiv`, `tateModule.ext`, `tateModuleRep` (a `ContinuousRep G_K Z_l`), `tateModule.kernel_mod_pow`, `tateModule.map`, `tateModule.baseChange`. (Milne 2008, Ch. I, Rem. 7.3, p. 34.)

**Checks.**
- `tateModule_rank_eq`: y² = x³ − x over Q, l = 5: rank 2, 25 elements mod 5.
- `tateModule_of_dim_zero`: A = Spec K gives 0.
- `tateModule_ne_limit_rational_torsion`: lim E[l^n](Q) = 0 there.
- `tateModule_char_p_excluded`: y² = x³ + 1 over F̄_5 is supersingular, E[5^n](F̄_5) = 0, so T_5E = 0 and the rank formula 2g fails; l ≠ char K is needed (for ordinary curves the rank is g, never 2g).

Prove `tateModule_residual`: ρ̄_{A,l} = T_lA ⊗ F_l is A[l](K^sep), and (Λ/lΛ)^ss ≅ A[l](K^sep)^ss for every stable lattice Λ ⊂ V_lA; for E elliptic (`IsElliptic`), ρ̄_{E,l} is reducible iff E has a K-rational cyclic l-isogeny: the stable lines are the kernels, with characters ψ on the line and χ̄_lψ⁻¹ on the quotient, ψ trivial for l = 2 but not necessarily for odd l. (DDT, §2.2, Thm. 2.9, p. 56.) *Needs:* EllipticCurves layers 1–2.

Prove `tateModule_weierstrass_comparison`: W elliptic over K, E_W the abelian variety with E_W(L) = (W⁄L).Point (A1): T_l(E_W) ≅ `TateModule l W.toAffine.Point` with `tateModuleGaloisRepresentation` as Z_l[G_K]-modules; isogeny point maps correspond to T_l of homomorphisms; `tateModuleWeilPairing` is the 6.2 pairing of the principal polarization P ↦ [(O) − (P)], exactly; `det_tateModuleGaloisRepresentation` agrees with 6.2. `Isogeny.det_tateModule_eq_degree` (φ : `TauCeti.Isogeny W₁ W₂`): T_l[n] = n, e_2(T_lφx,T_lφy) = deg φ·e_1(x,y), and for W₁ = W₂, det T_lφ = `Isogeny.degree` φ and tr T_lφ = 1 + deg φ − deg(1 − φ) (1 − φ: point map P ↦ P − φ(P)). (Milne 2021, Ch. II, §6, Prop. 6.4, p. 71.)

Prove `tateModule_functoriality`: T_l is an additive functor with T_l(A × B) ≅ T_lA ⊕ T_lB (`prod`); an isogeny φ (`IsIsogeny`) of degree d gives T_lφ injective with coker ≅ (ker φ)(K^sep)[l^∞] of order the l-part of d, and ψφ = [m] ⇒ T_lψ∘T_lφ = m; base change to L/K restricts ρ_{A,l} to G_L; τ : K ≅ K′ transports ρ_{A,l} to ρ_{A^τ,l}. (Milne 2008, Ch. I, p. 52.)

### 6.2 Weil pairing and determinant

With A^∨, φ_L, polarizations (`TauCetiRoadmap` JacobianChallenge E) and Z_l(1) = lim `rootsOfUnity` (χ_l = `cyclotomicCharacter`), define `weilPairing` e_l : T_lA × T_lA^∨ → Z_l(1), the limit of A3's e_{l^n}, and `polarizationPairing` e^λ_l(x,y) = e_l(x, T_lλ y), λ : A → A^∨. API: `weilPairing_mod_pow`, `weilPairing_perfect`, `weilPairing_galois` (multiplier χ_l), `weilPairing_map_dual`, `polarizationPairing_alternating`, `polarizationPairing_perfect_iff` (perfect iff l ∤ deg λ; nondegenerate on V_lA), `polarizationPairing_rosati`, `polarizationPairing_prod`, `polarizationPairing_galois`, `image_le_GSp` (Layer 7). (Milne 2008, Ch. I, §13, pp. 57–58.) *Needs:* A2 (Rosati).

**Checks.**
- `polarizationPairing_elliptic_det`: e_l(P,Q) generates Z_l(1) for a basis of T_lE.
- `polarizationPairing_not_perfect`: λ = [l]∘λ_E gives l·e_l, not perfect.
- `weilPairing_target_twist`: e_l(cx,cy) = −e_l(x,y), c complex conjugation.

Prove `tateModule_det_odd`, via `Matrix.det_eq_pow_of_symplectic_similitude` (B nondegenerate alternating of rank 2g over a field, B(hx,hy) = μB(x,y) ⇒ det h = μ^g; matrix form over any commutative ring): det ρ_{A,l} = χ_l^g for any polarization of any degree; for E elliptic det ρ̄_{E,l} = `modularCyclotomicCharacter`; for the conjugation c of a real place and every l (2 included), the ±1-eigenspaces of c on V_lA are Lagrangian of dimension g, so tr = 0, det = (−1)^g, and the saturated rank-g eigenlattices T_lA^± span T_lA for odd l but only 2T_2A for l = 2; E is odd (Layer 4). (DDT, §2.2, Prop. 2.8(a), p. 56; Serre 1972, §5.2(iv), p. 304.) *Needs:* Layer 4; `Matrix.det_eq_of_transpose_mul_J_mul_eq_smul`.

### 6.3 Reduction and Euler factors

Prove `tateModule_goodReduction_frobenius`, with `tateModule_specialisation` (K nonarchimedean local of residue characteristic p, 𝒜/O_K an abelian scheme with fibres A, A_k, l ≠ p: reduction is a G_K-equivariant isomorphism A[l^n](K̄) ≅ A_k[l^n](k̄), so I_K acts trivially and r : T_lA ≅ T_lA_k): F a number field, v a finite place of residue field F_{q_v}, characteristic p, A with good reduction at v (𝒜/O_v with special fibre A_v), π_v the q_v-Frobenius endomorphism of A_v (`TauCeti.Isogeny.frobeniusIsogeny` if g = 1; a hypothesis if g > 1), l ≠ p: V_lA is unramified at v, arithmetic Frob_w acts as T_lπ_v via r, and P_v(V_lA,X) = det(X − V_lπ_v) depends only on v, with X^{2g}P_v(q_v/X) = q_v^gP_v(X); for g = 1 with `WeierstrassCurve.HasGoodReduction`, P_v = X² − a_vX + q_v, a_v = `WeierstrassCurve.frobeniusTrace` of the reduction, independent of l; target for every g: P_v ∈ Z[X] monic of degree 2g, independent of l ≠ p (Milne 2008, Ch. I, Prop. 10.20, p. 52). (Milne 2008, Ch. IV, Thm. 3.5, p. 141.) *Needs:* `TauCetiRoadmap` NumberFieldArithmetic 5, LocalFieldsRamification 2.

Prove `tateModule_tateCurve`: K finite over Q_p, q ∈ K^×, |q| < 1, E_q the Tate curve (EllipticCurves layer 4), any l: K̄^×/q^Z ≅ E_q(K̄) gives 0 → Z_l(1) → T_lE_q → Z_l → 0, with t = (q_n) lifting 1 and σt = t + κ(σ), κ the Kummer cocycle, so ρ(σ) = (χ_l(σ), κ(σ); 0, 1); for l ≠ p, κ = v(q)t_l on I_K (Layer 2 tame character), inertia nontrivially unipotent, (V_lE_q)^{I_K} = Q_l(1), and E_q[l^n] is unramified iff l^n | v(q). (DDT, §2.2, Prop. 2.12, pp. 57–58.)

Define `firstCohomologyRep` H¹_l(A) = V_lA^∨ for A over a nonarchimedean local field F_v with residue characteristic ≠ l, and `localEulerFactor` L_v(A,T) = det(1 − TΦ_v | H¹_l(A)^{I_v}) ∈ Q_l[T], Φ_v geometric. API: `localEulerFactor_eq_coinvariants`, `localEulerFactor_of_goodReduction` (= T^{2g}P_v(1/T)), `localEulerFactor_isogeny`, `localEulerFactor_prod`, `localEulerFactor_natDegree_le` (2g iff unramified), `localEulerFactor_eq_weilDeligne`. Partial L-function: ∏_{v∉S} L_v(A,q_v^{−s})⁻¹, S ⊇ bad places and l. (DDT, §1.7, p. 46.) *Needs:* Layer 2.

**Checks.**
- `localEulerFactor_goodReduction`: y² = x³ − x at 5: 1 + 2T + 5T², every l ≠ 5.
- `localEulerFactor_not_on_V`: on V_lA, 1 + (2/5)T + (1/5)T² ∉ Z[T].
- `localEulerFactor_tate_curve`: E_q over Q_p: 1 − T.

Prove `localEulerFactor_eq_localPolynomial`: F a number field, W elliptic over F, 𝔭 height-one, R = `adicCompletionIntegers`, q = #(O_F/𝔭), l ∤ q (minimal model over R): `WeierstrassCurve.localPolynomial` R W equals L_v(V_lE^∨,X): at good reduction its a is `frobeniusTrace` of the reduction; at split, resp. nonsplit, multiplicative reduction both are 1 − X, resp. 1 + X; at additive reduction (every type and residue characteristic) (V_lE)^{I_v} = 0 and both are 1; so `WeierstrassCurve.LFunction` has the factors of V_lE^∨ away from l. (DDT, §2.2, Prop. 2.12, pp. 57–58.) *Needs:* EllipticCurves layers 4–5.

### 6.4 Coefficients and images

E ⊆ End⁰_K(A) = `End` ⊗ Q a number field of degree d, O = E ∩ End_K(A). Define `tateModule.endAction` (commuting with G_K), `lambdaTateModule` V_λA = V_lA ⊗_{E⊗Q_l} E_λ, `integralLambdaTateModule` T_λA = T_lA ⊗ O_{E,λ} for O_E ⊆ End_K(A), `lambdaTorsion` A[λ] = {x ∈ A[l] : λx = 0}. API: `lambdaTateModule.decomposition`, `lambdaTateModule_finrank` (2g/d if V_lA is free over E⊗Q_l, a hypothesis: Milne 2008, Prop. 10.23), `integralLambdaTateModule_free`, `lambdaTorsion` ≅ T_λA/λ, `lambdaTateModule_det` (= χ_l for E totally real, Rosati-fixed, d = g), `lambdaTateModule_odd`, `lambdaTateModule_frobenius` (good v ∤ l: induced by π_v, assuming endomorphisms extend to 𝒜/O_v), `lambdaTateModule.coefficientExtension`. (Ribet 1992, §3, pp. 4–5.) *Needs:* A2.

**Checks.**
- `lambdaTateModule_cm_rank_one`: y² = x³ − x over Q(i), l = 5: two 1-dimensional summands.
- `lambdaTateModule_rationals`: E = Q: V_λA = V_lA.
- `lambdaTateModule_not_over_smaller_field`: over Q, c anticommutes with [i].

For k a number field, (A,λ) principally polarized, g ≥ 1, define `pAdicImage` ρ_{A,p}(G_k), closed in GSp(T_pA,e^λ_p), `IsPGaloisGeneric` (open there), `IsGaloisGeneric` (ρ̂_A(G_k) open in GSp_{2g}(Ẑ)). API: `isPGaloisGeneric_iff_finiteIndex`, `IsGaloisGeneric.isPGaloisGeneric`, `isPGaloisGeneric_baseChange_iff`, `isPGaloisGeneric_iff_framed`, `isPGaloisGeneric_polarization_indep`. (Masser–Zannier 2020, §5.1, p. 658.) *Needs:* Layer 7.

**Checks.**
- `isPGaloisGeneric_cm`: y² = x³ − x over Q: Cartan normaliser, infinite index.
- `not_open_in_Sp`: never inside Sp, as χ_p has infinite image.
- `isGaloisGeneric_baseChange`: invariant under finite k′/k.

Prove `tateModule_serre_independence`: K a number field: some finite L/K has ρ̂(G_L) = ∏_l U_l with every U_l Zariski connected in GL(V_lA). (Richard–Yafaev 2025, Thm. 4.9(1),(2), p. 17.) Prove `tateModule_noot_specialisation`: F of finite type over Q, S a normal absolutely irreducible F-variety with function field K, X/S an abelian scheme, σ a closed point, D_σ ⊆ G_K its decomposition group: X_η[n](K̄) ≅ X_σ[n](F̄) D_σ-equivariantly, so T_lX_η ≅ T_lX_σ and ρ_{X_η,l}(D_σ) = ρ_{X_σ,l}(G_{F(σ)}). (Noot 1995, §1.2, p. 163.)

### Examples

(1) T_pμ_{p^∞} = Z_p(1): χ_p(Frob_l) = l, χ_p(c) = −1, Hodge–Tate weight +1; = det T_pE for every E/Q. (2) Split Tate curve: ramified, (V_lE_q)^I = Q_l(1) with Frobenius X − q_K, L = 1 − T. (3) y² = x³ + 1 at p ∈ {5, 11, 17, 23}: a_p = 0, P_p = X² + p. (4) y² = x³ − x: abelian on G_{Q(i)}, V_lE ⊗ Q̄_l ≅ Ind ψ, a_p = 0 for p ≡ 3 mod 4 (Milne 2021, Ch. IV, §9, p. 158). (5) Over F_q, a = q + 1 − #E(F_q): arithmetic Frobenius on T_lE and geometric Frobenius on H¹ both have X² − aX + q; factor 1 − aT + qT² (DDT, §2.1, p. 50).

### Dependencies

Layers 1, 2, 4, 7; AbelianSchemesAndArithmeticModuli A1–A3; `TauCetiRoadmap` JacobianChallenge E, EllipticCurves 1–5, LocalFieldsRamification 2, NumberFieldArithmetic 5.

## Layer 7: dimension-general arithmetic API

Operations and image conditions on continuous representations of a profinite `Γ` over a topological commutative ring `A` (Layer 1 carrier). Conventions: Frobenius is arithmetic; `HT(χ_l)=+1`; `c_v` a complex conjugation at a real place `v`; `ε̄` the mod `p` cyclotomic character; finite-group cohomology is Mathlib's `groupCohomology`; a.i. = absolutely irreducible; u.a.e. = unramified at all but finitely many places; "field of `ρ`" = fixed field of `ker ρ`. Namespaces `TauCeti.ContinuousRep`, `.PolarizedRep`, `.GaloisRep`, `.ResidualImage`.
Sources: BCGNT25 = Boxer–Calegari–Gee–Newton–Thorne 2025; BCGP21 = Boxer–Calegari–Gee–Pilloni 2021; BCG25 = Boxer–Calegari–Gee 2025; BLGGT14 = Barnet-Lamb–Gee–Geraghty–Taylor 2014; BLGG13 = Barnet-Lamb–Gee–Geraghty 2013; CHT08 = Clozel–Harris–Taylor 2008; CGH19 = Calegari–Geraghty–Harris 2019; CG20 = Calegari–Geraghty 2020; CG18 = Calegari–Geraghty 2018; NT26 = Newton–Thorne 2026; NT23 = Newton–Thorne 2023; DDT07 = Darmon–Diamond–Taylor 2007; GHTT12 = Guralnick–Herzig–Taylor–Thorne 2012; GHT17 = Guralnick–Herzig–Tiep 2017; ACC+23 = Allen et al. 2023; GN22 = Gee–Newton 2022; Pat19 = Patrikis 2019; KT17 = Khare–Thorne 2017; Th12 = Thorne 2012; Th17 = Thorne 2017; Qia23 = Qian 2023.

### 7.1 Powers, tensor induction, restriction of scalars

Define `ContinuousRep.symPower`, `extPower`, `tensorPower`: `(M,ρ)` of rank `n`, `A:Type`, `d≥0`: representations on `Sym[A]^d M` (quotient symmetric power, `d!` not assumed invertible), `⋀[A]^d M`, `⨂^d M`, refining Tau Ceti's `Representation.symmetricPower`, `exteriorPower`, `tensorPower` (ranks `binom(n+d-1,d)`, `binom(n,d)`, `n^d` for `A≠0`; module topology; joint continuity); `∧^nρ≅det ρ`, `∧^dρ=0` for `d>n`, `∧^dρ≅(∧^{n-d}ρ)^∨⊗det ρ` (`d≤n`), `ρ⊗ρ≅Sym^2ρ⊕∧^2ρ` when `2∈A^×`. API: `symPower_rank`, `symPower_map`, `symPower_baseChange`, `charpoly_symPower`, `extPowerTopEquivDet`, `tensorSquareEquiv`, `extPowerPairing`, `tensorPower_toRepresentation`. (BCG25, proof of Thm 2.1, p. 513; NT26, Lemma 2.2, p. 10.) **Checks.** `symPower_zero`; `extPower_top`; `charpoly_symPower_two`; `symPower_toRepresentation`; `symPower_not_dual_char_p` (`GL_2(F_3)` on `V`: `Sym^3V≇Γ^3V=(Sym^3V)^∨⊗det^3`; `V⊂Sym^3V`, `Hom(Sym^3V,V)=0`); `tensorSquareEquiv_not_char_two` (`GL_2(F_2)` on `V`: `V⊗V≅V⊕P(1)` is projective, `Sym^2V⊕∧^2V≅V⊕1⊕1` is not).

Prove `charpoly_symPower_univ`, `charpoly_extPower_univ`: monic `S_{n,d},E_{n,d}∈Z[c_1..c_n][T]` of degrees `binom(n+d-1,d)`, `binom(n,d)` with `det(T-Sym^df)=S_{n,d}(c(f);T)`, `det(T-∧^df)=E_{n,d}(c(f);T)` for every commutative `R` (`R:Type` for `Sym`), free `M` of rank `n`, `f:M→M`, `c(f)` the coefficients of `det(T-f)`; roots the `d`-fold products of the `α_i` with, resp. without, repetition. `d=0`: `T-1`; `n=0<d`: `1`. (BCG25, proof of Thm 2.1, p. 513.)

Define `ContinuousRep.tensorInd`: `H≤Γ` open of index `m`, `(V,ρ)` of rank `n` over `H`, transversal `t`, `gt_i=t_{π_g(i)}h_i(g)`: `g` puts `ρ(h_i(g))v_i` in slot `π_g(i)`; refines `TauCeti.tensorInducedRepresentation` by rank `n^m` (`A≠0`), module topology, joint continuity (needs openness); trace `∏_j tr ρ(t_{i_j}^{-1}g^{l_j}t_{i_j})` over the cycles of `g` on `Γ/H`, characteristic polynomial universal in the cycle polynomials (`V` free). Asai: `K/F` quadratic, `As(ρ)=⊗-Ind_{G_K}^{G_F}ρ`; `As(ρ)⊗η_{K/F}` is the other extension of `ρ⊗ρ^σ` (the only other for `A` a field, `ρ⊗ρ^σ` a.i.); roots `α_iα'_j` for `g∈G_K`, and `∏_i(X-β_i)∏_{i<j}(X^2-β_iβ_j)` for `g∉G_K`, `β` the roots for `ρ(g^2)`. API: `tensorIndEquivOfTransversal`, `tensorInd_rank`, `tensorInd_tprod`, `tensorInd_restrict_normal`, `trace_tensorInd`, `tensorInd_trans`, `asai`, `tensorInd_apply_tprod`, `tensorInd_baseChange`, `charpoly_tensorInd`, `charpoly_asai`. (CG20, §4, proof of Ex. 4.11, p. 819; BCGP21, §7.5.16, p. 202.) **Checks.** `tensorInd_index_one`; `tensorInd_character` (`ψ∘Ver`, Mathlib's `MonoidHom.transfer`; index two, `g∉H`: `Ver(g)=g^2`, the rank-one case of `charpoly_asai`); `asai_restrict`; `tensorInd_ne_ind` (`Z/2` on `A^2` trivial, `2≠0`: trace 2, vs 0 for `Ind`); `charpoly_asai_outside_rank_two` (`X^2-aX+b↦(X^2-aX+b)(X^2-b)`).

Prove `tensorInd_indep_transversal`: any group, `H` of finite index, `ρ:H→GL_A(V)`, transversals `t`, `t'=tu` (`u_x∈H`): `h^t_x(g'g)=h^t_{gx}(g')h^t_x(g)`, so `Ind^⊗_tρ` is a representation; `T_{t,t'}=⨂_xρ(u_x)^{-1}` intertwines, `T_{t,t}=id`, `T_{t',t''}T_{t,t'}=T_{t,t''}`; `H` open, `ρ` continuous ⇒ continuous isomorphisms. (BCGP21, §7.5.16, p. 202.)

Prove `charpoly_cyclicTensor`: `R` commutative, `V_1..V_l` free of rank `n`, `A_i:V_i→V_{i+1}` (mod `l`), `T(v_1⊗…⊗v_l)=A_lv_l⊗A_1v_1⊗…`, `B=A_l∘…∘A_1`: `tr T=tr B`, `det(X-T)=C_{n,l}(c(B);X)` for a universal monic `C_{n,l}` of degree `n^l`, `C(e(β);X)=∏_O(X^{|O|}-β_{j_1}⋯β_{j_{|O|}})` over orbits `O ∋ (j_1,…,j_l)` of the cyclic shift on `{1..n}^l` (product over ONE period, not the whole tuple), so `C_{n,2}=∏(X-β_i)∏_{i<j}(X^2-β_iβ_j)`; equal `V_i`: `c∘(A_1⊗…⊗A_l)`; `tr(A⊗A')=tr A·tr A'`, `det(X-A⊗A')` universal with roots `α_iα'_j`.  (CG20 (arXiv v1), §4, proof of Ex. 4.11, p. 15.) **Checks.** `charpoly_cyclicTensor_not_full_product` (`n=1`, `l=2`, `A_1=a`, `A_2=b`: `T=B=ab=β`, `det(X-T)=X-β`, not `X-β^2`).

Define `ContinuousRep.resScalars`: continuous `A→B`, `B` finite projective of constant rank `r` over `A` with the `A`-module topology, `(M,ρ)` of rank `n` over `B`: `M` over `A`, rank `rn`; `det_A(X-ρ(g))=N_{B[X]/A[X]}det_B(X-ρ(g))` (free case, else after localisation); `(Res ρ)⊗_A A'≅⊕_σρ⊗_{B,σ}A'` for `B` étale split by `A'`. API: `resScalars_rank`, `charpoly_resScalars`, `resScalars_map`, `resScalarsBaseChangeEquiv`, `resScalars_trans`. (BCGP21, §2.2, p. 18.) **Checks.** `resScalars_self`; `charpoly_resScalars_quadratic` (`X^2-(ψ+ψ^σ)(g)X+ψψ^σ(g)`); `resScalars_baseChange_split`; `resScalars_ne_ind` (Lean: `E/K` quadratic fields, `char K≠2`, trivial `ρ`, vs `Ind`).

### 7.2 Adjoint, trace pairing, Schur, determinants

Define `ContinuousRep.ad`, `adZero`, `adQuot`, `endTrace`: rank `n≥1`; `ad ρ=End_A(M)` by conjugation (`Representation.linHom ρ ρ`); `endTrace=contractLeft∘(dualTensorHomEquiv A M M)^{-1}` (not `LinearMap.trace`, which is `0` on non-free `M`); `ad^0ρ=ker endTrace` and `ad ρ/A·1`, both rank `n^2-1`, kept distinct. The trace pairing is perfect and invariant, `ad^0ρ≅(ad ρ/A·1)^∨` over every `A`, and `ad^0→ad/A·1` (kernel `A[n]·1`, cokernel `A/nA`) is an isomorphism, with `ad=A·1⊕ad^0`, exactly when `n∈A^×`; `n=2`, any `A`: `ad/A·1≅Sym^2ρ⊗det^{-1}`, `ad^0≅(Sym^2ρ)^∨⊗det`. API: `adEquivTensorDual`, `tracePairing_perfect`, `adDecomp_of_invertible`, `one_mem_adZero_iff`, `adZero_to_adQuot_ker_coker`, `ad_baseChange`, `adQuot_equiv_symSq`, `WeilDeligneRep.ad`. (CHT08, §2.1, p. 7; ACC+23, after Def. 6.2.29, p. 1044.) **Checks.** `ad_rank_one`; `adZero_equiv_symSq`; `adZero_dual_adQuot`; `ad_eq_linHom`; `endTrace_eq_trace_of_free`; `scalar_mem_adZero_char_two` (`F_2`, `n=2`; complement or quotient definitions fail); `adDecomp_of_invertible_not_dvd` (`F_p`, `n=p`: `1∈ad^0∩A·1`, `tr(1·Y)=0` on `ad^0`, degenerate); `endTrace_ne_trace_of_not_free` (`Z[√-5]`, `M=(2,1+√-5)`).

Prove `traceBilinForm_isPerfPair`: any commutative `A`: `tr(XY)` on `M_n(A)` is a perfect pairing (`LinearMap.IsPerfPair`; stronger than nondegenerate: `2xy` on `Z`), dual basis `(E_{ji})`; likewise on `End_A(M)` for finite projective `M` with the contraction trace. (BCG25, proof of Thm 2.1, pp. 513–514.)

Prove `GaloisRep.schur_local`: `A` local, `ρ:Γ→GL_n(A)` with `ρ̄` a.i.: `ρ(Γ)` spans `M_n(A)`; centraliser `A` in `M_n(A)`, `A^×` in `GL_n(A)`; two intertwiners in `GL_n(A)` differ by `A^×`. No completeness, Noetherianity or continuity. (CHT08, Lemma 2.1.8, p. 13.)

Prove `ContinuousRep.ofDeterminant_compat`: a representation comes from an `n`-dimensional continuous determinant `D` on `A[Γ]` only via IntegralHeckeAndGaloisDeterminants IHG.1: (a) `A=k` algebraically closed (`F̄_p` discrete, `Q̄_l`): continuous semisimple `ρ`, `det∘ρ=D`, unique up to isomorphism; (b) `A` complete local Noetherian, finite residue field, `D̄` a.i.: continuous `ρ:Γ→GL_n(A)`, unique up to conjugacy. For every operation `Φ` of 7.1–7.2 (`n≥1`: `det(X-ad ρ(g))=(X-1)det(X-g|ad^0)=(X-1)det(X-g|ad/A·1)`; `n=0` gives `1`), `det∘Φ(ρ)` depends only on `D`. In (b), `2∈A^×` and `D^c=D^∨·μ|_{G_F}` give a polarisation of multiplier `μ` or `μδ_{F/F⁺}`, pairing unique up to `A^×`; for `2∉A^×` a covariant perfect pairing with `⟨y,x⟩=ε⟨x,y⟩`, `ε∈μ_2(A)`, gives a CHT triple of multiplier `μη`, `η(c_v)=-εμ(c_v)^{-1}`, and `μ_2(A) ⊋ {±1}` is possible. Nothing from a residually reducible `D`. (CHT08, Lemma 2.1.4, p. 9.)

### 7.3 Similitude groups and 𝒢_n

Define `SimilitudeGroup.groupScheme`: `R` commutative, `M` finite projective of constant positive rank, `B` perfect `ε`-symmetric (`ε=-1`: alternating; Lean: any Gram matrix `J`): `GAut(M,B)(R')={(g,ν):B(gx,gy)=νB(x,y)}`, closed in `GL(M)×G_m`, `ν` determined by `g`; `GSp_{2m}` for `J_{2m}=(0,1_m;-1_m,0)=-Matrix.J`, `GSp_4` for `J=antidiag(1,1,-1,-1)` of Boxer–Calegari–Gee–Pilloni and Calegari–Geraghty (the same group for `gJg^T=νJ` or `g^TJg=νJ`, as `J^{-1}=-J`; `P=diag(1_2,(0 1;1 0))` has `P^TJ_4P=J`), `GO_n` for `1_n`, `G_n=GSp_n`/`GO_n` for `n` even/odd; Lie algebras `gsp/go`, `sp/so=ker dν`, with `gsp=sp⊕R·1` (central scalars, trivial adjoint action, `dν(1)=2`) when `2∈R^×`, `det J∈R^×`; `det g=ν(g)^m` on `GSp_{2m}`, `(det g)^2=ν(g)^n` on `GO_n`. API: `multiplier`, `GSp`, `GO`, `mem_iff`, `lie`, `lieSplit`, `ofIsometry`, `GSp_points_eq`. (BLGGT14, §1.1, p. 11; BCGP21, §2.1.1, p. 15; CG20, §2.1, p. 807.) **Checks.** `gsp_two_eq_gl_two` (`ν=det`); `det_eq_nu_pow`; `sp_eq_symplecticGroup` (Mathlib's `Matrix.symplecticGroup`, whose `J` is `-J_{2m}`); `gsp_lie_split_fails_char_two` (`F_2`: `2J=0`, `1∈sp_4`); `gsp_empty_odd_rank`.

Define `CHTGroup`: `𝒢_n=(GL_n×GL_1)⋊{1,j}` over `Z`, `j(g,μ)j^{-1}=(μg^{-T},μ)`, `ν(g,μ)=μ`, `ν(j)=-1`, `ad(j)x=-x^T`. For `Δ≤Γ` of index two (open if topological), `γ_0∉Δ`, any ring `R`: `r:Γ→𝒢_n(R)` inducing `Γ/Δ≅𝒢_n/𝒢_n^0` ↔ CHT triples of 7.4(c) on `R^n`, via `μ=ν∘r`, `⟨x,y⟩=x^TA^{-1}y`, `r(γ_0)=(A,-μ(γ_0))j`, continuity preserved. Maps `⊗:(𝒢_n×𝒢_m)^+→𝒢_{nm}`, `𝒢_n→GSp_{2n}`, `G_n×{±1}→𝒢_n` with `(g,-1)↦(g,ν(g))(A_n^{-1},(-1)^{n+1})j`, so `ν=ν(g)(-1)^{n+1}(-1)=ν(g)s^n` (giving `r_ψ` for `F` imaginary quadratic); an a.i. `r` with `r^{γ_0}≅r^∨⊗μ` extends to `𝒢_n(k)` with multiplier `μ` or `μδ` by `sgn(r,μ)`; CHT induction from `Γ' ⊄ Δ` of finite index, independent of `γ_0`, multiplier `χ`. `gl_n^{𝒢_n}=0` only over `Z[1/2]`. API: `nu`, `equivTriple`, `ad`, `tensor`, `toGSp`, `ofSimilitude`, `extendOfAbsIrred`, `ind`. (CHT08, §2.1, Lemmas 2.1.1–2.1.2, pp. 7–9; BCG25, (2.1.2), p. 514; BLGGT14, §1.1, p. 13.) **Checks.** `nu_j`; `rankOne_forces_odd` (`n=1`, `γ_0^2=1`: `((a,μ_0)j)^2=(μ_0,μ_0^2)=1` forces `μ_0=1`, so `ν(r(γ_0))=-1` over every `R`); `ofSimilitude_nu`; `equivTriple_trivial` (`Z/2`: `A^T=-μA`; none for `Z/3`); `no_invariants_fails_char_two` (`F_2`: `-1^T=1`).

### 7.4 Polarised representations and oddness

Define `PolarizedRep`: (a) `Δ≤Γ` open of index `≤2` (Lean: any subgroup), `c^2=1`, `c∉Δ` if `Δ≠Γ`, `(M,ρ)` over `Δ`: continuous `μ:Γ→A^×`, perfect `⟨,⟩` with `⟨ρ(σ)x,ρ(cσc)y⟩=μ(σ)⟨x,y⟩`, `⟨x,y⟩=ε⟨y,x⟩` for a formal sign `ε∈{±1}` (data when `2=0`), and `ε=-μ(c)` in `A` when `c∉Δ` (CM sign condition); no alternation imposed. (b) `F` CM or totally real, `Γ=G_{F⁺}`, `Δ=G_F` (`G_{F⁺}∖G_F` restricts to `NumberField.IsCMField.complexConj`), `c=c_v`, `v` a real place of `F⁺`; `F` imaginary: `ε_v=-μ(c_v)`. (c) CHT triples: any `γ_0∉Δ`, `μ(δ)⟨x,y⟩=⟨ρ(δ)x,ρ(γ_0δγ_0^{-1})y⟩`, `⟨x,ρ(γ_0^2)y⟩=-μ(γ_0)⟨y,x⟩`; this is (a) when `-μ(c_v)` is a sign (domains; `2∈A^×` with `Spec A` connected; not over `k×k`, where `μ(c_v)=(1,-1)`). Rank one, `⟨x,y⟩=uxy`: `μ|_{G_F}=r·r^c`, `ε=1`, `μ(c_v)=-1`; `(1,δ_{F/F⁺})` is polarised, `(1,1)` is not. `F` totally real, `2∈A^×`, `Spec A` connected: polarised iff `ρ` factors through `GSp(M,B)` or `GO(M,B)` with `ν∘ρ=μ`, `B(x,y)=⟨x,ρ(c_v)y⟩`, `B(y,x)=ε_vμ(c_v)B(x,y)`, alternating iff `μ(c_v)=-ε_v`.  API: `pairing`, `multiplier`, `sign`, `IsPolarizable`, `essConjSelfDual`, `ext`, `toGSpOrGO`. (BLGGT14, §2.1, p. 31; CHT08, Lemma 2.1.1, p. 7.) **Checks.** `rank_one_imaginary` (Lean: domain, `2≠0`); `rank_one_multiplier_eq_mul_conj` (`ρ(σ)ρ(cσc)=μ(σ)`); `not_polarized_even_multiplier` (`n=1`, `2≠0`, `μ(c_v)=1`: conjugate self-dual, not polarised); `totallyReal_det` (`n=2`, `2∈A^×` connected: `det(x,ρ(c_v)y)`, `ε_v=-det ρ(c_v)`); `iff_cht_triple`.

Prove `PolarizedRep.changePlace`, `det_eq`, `even_of_alt`, `sign_unique`, `similitude_ambiguity`: (1) `⟨x,y⟩_{v'}=⟨x,ρ(c_vc_{v'})y⟩_v` polarises `(ρ,μ)` at `v'` with `ε_{v'}=μ(c_vc_{v'})ε_v=-μ(c_{v'})` whenever `μ(c_vc_{v'})∈{±1}` (domains; `2∈A^×`, `Spec A` connected); over `k×k` the place can matter. (2) `det ρ(c_vσc_v)det ρ(σ)=μ(σ)^n`; totally real: `(det ρ)^2=μ^n`, and `⟨x,ρ(c_v)y⟩` alternating ⇒ `n` even, `det ρ=μ^{n/2}`. (3) An alternating perfect pairing on a free module over a nonzero ring forces `n` even. (4) `k` a field, `ρ` a.i. with `ρ^c≅ρ^∨⊗μ`: a covariant pairing exists, unique up to `k^×`, with intrinsic sign `sgn(ρ,μ)` for `char k≠2`: polarised iff `sgn=1`, else `(ρ,μδ)` is; the extensions to `𝒢_n(k)` form a `k^×/k^{×2}`-torsor with multiplier in `{μ,μδ}`; in characteristic 2 always polarised (`μ(c)=1=-1`), not necessarily alternating. (5) `ρ:G_K→GL_4(Q̄_p)` irreducible with symplectic similitudes `ν`, `νψ`, `ψ≠1` ⇒ `ψ` of finite order and `ρ` reducible over a quadratic subfield of the field of `ψ`. (BCGP21, Lemma 8.3.1, p. 246.)

Define `PolarizedRep.dual`, `twist`, `tensor`, `extPower`, `symPower`, `sum`, `restrict`, `baseChange` (`F` imaginary CM, `δ=δ_{F/F⁺}`, inputs at the same `c_v`): `(ρ^∨,μ^{-1},ε)`, transported pairing; `(ρ⊗χ,μ·(χ∘Ver),ε)`, same pairing (`(χ∘Ver)|_{G_F}=χχ^c`, `(χ∘Ver)(c_v)=χ(c_v^2)=1`); `(ρ⊗ρ',μμ'δ,εε')`, product pairing; `(∧^kρ,μ^kδ^{k-1},ε^k)` with `det⟨x_i,y_j⟩`, any `A`; `(Sym^kρ,μ^kδ^{k-1},ε^k)` with the permanent pairing `(1/k!)Σ_s∏⟨x_i,y_{s(i)}⟩`, `k!∈A^×`; orthogonal sum for equal `μ,ε`; restriction to `L=L⁺F` at the place of `L⁺` where `c_v` is a conjugation; coefficient extension. All satisfy the CM sign condition. Totally real: `δ=1`, twist multiplier `μχ^2`, no sign condition; the type sign `ε_vμ(c_v)` is multiplicative under `⊗` and raised to the `k`-th power. In form (a) the multipliers are characters of `Γ` prescribed on `Δ` and at `c`, which exist for index two, not in general. API: `dual_multiplier`, `dual_pairing`, `twist_multiplier`, `twist_pairing`, `tensor_multiplier`, `tensor_pairing`, `extPower_multiplier`, `extPower_pairing`, `symPower_multiplier`, `restrict_pairing`, `sum_pairing`. (BLGGT14, §1.1, p. 12.) **Checks.** `tensor_sign`; `twist_trivial`; `tensor_without_delta_fails` (`2≠0`: multiplier `μμ'` breaks the sign condition); `extPower_top`.

Define `PolarizedRep.IsTotallyOdd`, `SimilitudeGroup.IsOdd`, `GaloisRep.IsBalancedAt`, `GaloisRep.complexConj`: (a) totally odd: `ε_v:=μ(c_{v_0}c_v)ε_{v_0}=1` in `A` at every real `v` of `F⁺` (`μ(c_{v_0}c_v)^2=1`: automatic over a reduced ring with `2=0`, not over `F_2[t]/t^2`, where `(1+t)^2=1≠1+t`); `F` imaginary: iff `μ(c_v)=-1` for all `v`. (b) `r:G_{F⁺}→𝒢_n(A)` with `r^{-1}(𝒢_n^0)=G_F`, or `GSp_{2m}`-valued: odd iff `ν(r(c_v))=-1`; `GO_n`-valued: `+1` (both `ε_v=1` for `B=⟨·,ρ(c_v)·⟩`). (c) A character of a totally real `K` is totally odd if `μ(c_v)=-1` (Layer 4 `IsTotallyOddChar`). (d) balanced at `v` (`2≠0`): the `±1`-eigenspaces of `ρ(c_v)` have dimensions `a,b` with `|a-b|≤1`; iff `Tr ρ(c_v)=a-b∈{-1,0,1}` in characteristic 0 or `l>n+1` (`n` even), `l>n` (`n` odd); `n≥1`, `2≠0`: `dim H^0(⟨c_v⟩,ad^0V)=a^2+b^2-1`, minimal iff balanced. (e) `n=2`: balanced iff `det ρ(c_v)=-1` (Layer 4 `IsOddAt`). API: `isTotallyOdd_iff_multiplier`, `isBalancedAt_iff_trace`, `dim_invariants_adZero_complexConj`. (BLGGT14, §2.1, p. 31; ACC+23, §1.2, p. 909; CG18, §8.4, pp. 80–81; CG20, §4, p. 812.) **Checks.** `IsTotallyOdd_cyclotomic`; `isOddBalanced_rank_two`; `not_odd_trace_char_three` (trivial `F_3^2`: trace `-1`, `a=2`, `b=0`; `l=n+1` is sharp); `isTotallyOdd_of_reduced_char_two`; `isTotallyOdd_not_nonreduced_char_two` (`F_2[t]/t^2`); `IsTotallyOdd_complex`.

Prove `PolarizedRep.symPowerForm`: `F:Type` a field, `2,d!∈F^×`, `n=d+1`, `V=F^2` with alternating perfect `h`, `r` with multiplier `det r`: `B_d(u_1⋯u_d,w_1⋯w_d)=(1/d!)Σ_s∏h(u_j,w_{s(j)})` is perfect on `Sym^dV`, covariant with multiplier `(det r)^d`, of symmetry `(-1)^d`, with `B_d(v_i,v_{d-i})=(-1)^i/binom(d,i)` on monomials `v_i=x^{d-i}y^i`; so `Sym^dr` lands in `GSp` (`d` odd) or `GO` (`d` even), identified with `G_n` by `P^TB_dP=J_n` (`n` even) or `P^TB_dP=c·1_n` (`n` odd, `F` finite of odd characteristic; otherwise an extra hypothesis). For `d!∉F^×` the `d!`-scaled form is degenerate (`d!B_d(v_0,v_d)=d!=0`); for `p=d=7` no invariant perfect form on `Sym^7` exists, for `d=2p-1` one does. (BCG25, proof of Thm 2.1, pp. 513–514.)

### 7.5 GSp_4-valued representations

Define `GSp4Rep` (`F` a number field; `2∈A^×` where used): continuous `r:G_F→GSp_4(A)` with `ν∘r`; odd iff `ν(r(c_v))=-1` at every real `v` (over a field with `2≠0`: `r(c_v) ~ diag(1,1,-1,-1)`, both eigenspaces Lagrangian, `dim H^0(⟨c_v⟩,ad^0r)=4`); `ad r=gsp_4` (rank 11), `ad^0r=sp_4=Lie PGSp_4` (rank 10), not the trace-zero `sl_4`; `2∈A^×`: `ad r=ad^0r⊕A` with trivial action on `A·1` (not `⊕ν`), `ad^0r≅Sym^2r⊗(ν∘r)^{-1}`, self-dual. Symplectic induction: `K/F` quadratic, `σ∉G_K`, `ρ:G_K→GL(V)` of rank 2 over a field, `det ρ=χ|_{G_K}`; on `W=V⊕σV`, `V ⊥ σV`, `⟨σv_1,σv_2⟩=±χ(σ)⟨v_1,v_2⟩`, the two signs give `ρ_1,ρ_2:G_F→GSp(W)` with similitudes `χ`, `χη_{K/F}`; `ad^0(Ind ρ)|_{G_K}≅(ρ⊗ρ^σ)χ^{-1}⊕ad^0ρ⊕ad^0ρ^σ`, `ad^0(Ind ρ)≅As(ρ)⊗ν^{-1}⊕Ind ad^0ρ`, `ν` the chosen similitude. API: `IsOdd`, `ad`, `adZero`, `adZeroEquivSymSq`, `symplecticInd`, `symplecticInd_toGL4`, `adZero_symplecticInd`, `changeJ`. (BCGP21, §2.2, pp. 17–18; CG20, §4, p. 813; CGH19, Thm 1.1.) **Checks.** `odd_complexConj_eigen`; `ad_eq_adZero_add_trivial`; `ad_not_adZero_add_nu`; `symplecticInd_similitudes`; `ofGL2_GSp2`.

Prove `GSp4Rep.conj_iff_gl4`: `L` algebraically closed, `char L≠2` (the source's hypothesis), `r,r'` semisimple: `GSp_4(L)`-conjugate iff isomorphic as `GL_4`-representations with `ν∘r=ν∘r'`. (BCGP21, Lemma 2.1.3, p. 17.)

### 7.6 Zariski closures, strong irreducibility, projective lifting

Define `AlgebraicGroup.zariskiClosure`, `GaloisRep.monodromyGroup`: `G` affine of finite type over a field `K`, `Σ ⊂ G(K)`: `Σ̄` the reduced closed subgroup scheme of the vanishing Hopf ideal; `K` Hausdorff topological, `ρ` continuous: `G_ρ` = closure of `ρ(Γ)` in `GL(V)` (Lean: an ideal in the coordinate ring of `M_n`), `G_ρ^0` its geometric identity component, `Γ^0=ρ^{-1}(G_ρ^0(K̄))` open normal of finite index, and for `G_F` the component field `F_ρ^0` with `Gal(F_ρ^0/F)≅π_0(G_ρ)(K̄)`. Over an algebraically closed field `closure(α(Σ))=α(Σ̄)` for subgroups and `closure[Σ,Σ]=D(Σ̄)`; closures commute with field extension; in characteristic 0 semisimple `ρ` has reductive `G_ρ^0`, a connected reductive subgroup of `GL_2` irreducible on `K̄^2` is `SL_2` or `GL_2`, and a closed `G ⊂ PGL_2×PGL_2` with surjective projections is everything or the graph of an automorphism, so `Ad∘pr_1≅Ad∘pr_2` on `sl_2`. API: `zariskiClosure_le_iff`, `monodromyIdentityComponent`, `componentField`, `zariskiClosure_map`, `zariskiClosure_commutator`, `monodromyGroup_baseChange`, `isReductive_identityComponent_of_semisimple`. (NT26, proof of Lemma 2.2, p. 10.) **Checks.** `monodromyGroup_finiteImage` (`Γ^0=ker ρ`); `monodromyGroup_cyclotomic` (`χ_l` over `Q_l`: infinite image, ideal `0`); `zariskiClosure_map`; `componentField_trivial`; `zariskiClosure_finite_field`.

Prove `PGL2.isSimpleGroup_of_isAlgClosed`: `Ω` algebraically closed: `SL_2(Ω)→PGL_2(Ω)` onto with kernel `±1`; `PGL_2(Ω)` simple (`PSL_2(K)` for `#K>3`; not `F_2`, `F_3`); a subgroup of `PGL_2(Ω)^2` with surjective projections is the product or the graph of an abstract automorphism. (NT26, proof of Lemma 2.2, p. 10.)

Define `GaloisRep.IsStronglyIrreducible`, `IsAbsStronglyIrreducible`: `ρ|_{Γ'}` irreducible for every open `Γ'≤Γ` (for `G_F`: every finite separable `L/F`); absolute: after `⊗K̄`; `K` Hausdorff of characteristic 0, `ρ` semisimple: absolutely strongly irreducible iff `G_ρ^0` acts irreducibly on `V⊗K̄`. API: `IsStronglyIrreducible.irreducible`, `isStronglyIrreducible_iff_finiteExt`, `IsStronglyIrreducible.baseChange_iff`, `isAbsStronglyIrreducible_iff_identityComponent`. (NT26, §2, p. 10.) **Checks.** `IsStronglyIrreducible.restrict`; `not_stronglyIrreducible_induced`; `stronglyIrreducible_dim_one`; `stronglyIrreducible_iff_identityComponent`.

Prove `hodgeTateWeights_tensor_symPower`, `hodgeTate_of_char`: `K/Q_p` finite, `τ:K→Q̄_p`, Hodge–Tate `ρ,ρ'` of `G_K` over `Q̄_p`, weights labelled by `τ`, `HT_τ(χ_p)=+1`: `HT_τ(ρ⊗ρ')={a+a'}`, `HT_τ(Sym^mρ)={a_{i_1}+…+a_{i_m}}` with multiplicity, `HT_τ(ρ⊗χ)=HT_τ(ρ)+HT_τ(χ)`; a Hodge–Tate character is de Rham; `F` totally real: a de Rham character `G_F→Q̄_l^×` has all Hodge–Tate–Sen weights equal, and characters with all Hodge–Tate–Sen weights `x/d` exist (Hodge–Tate only when `d|x`). (Pat19, Lemma 2.3.17, p. 32.)

Prove `GaloisRep.stronglyIrreducible_symPower_tensor_of_ne_weights`: `F` a number field, `ρ,ρ':G_F→GL_2(Q̄_p)` continuous strongly irreducible, `τ:F→Q̄_p` at `v|p` with both restrictions Hodge–Tate, `HT_τ(ρ)={a,b}`, `HT_τ(ρ')={a',b'}`, `a-b≠±(a'-b')` (sign-convention independent): `Proj ρ×Proj ρ'` has Zariski-dense image in `PGL_2×PGL_2`, and `(Sym^mρ⊗Sym^{m'}ρ')|_{G_{F(ζ_{p^∞})}}` is strongly irreducible for all `m,m'≥1`. (NT26, Lemma 2.2, p. 10.)

Prove `tate_h2_qz_eq_zero`: `H^2(G_F,Q/Z)=0` for `F` a number field (also `K/Q_p` finite, `R`, `C`: `H^2(G_K,Z/n)` is dual to `μ_n(K)`, so the limit is `0`). (Pat19, Thm 2.1.1, p. 15.)

Prove `GaloisRep.liftProjective`: `F` a number field: every continuous `P:G_F→PGL_n(Q̄_l)` lifts to a continuous `ρ:G_F→GL_n(Q̄_l)`, more generally through any surjection of linear algebraic groups over `Q̄_l` with central torus kernel; two lifts differ by a continuous character; lifts of a u.a.e. `P` are u.a.e. (proof of Lemma 2.7.4, p. 49.)

Prove `GaloisRep.exists_root_mul_finiteOrder`: `Γ` profinite, `χ:Γ→Q̄_l^×` continuous, `m≠0`: `χ=χ_1^mχ_0` with `χ_0` of finite order (`χ_1` needs the algebraic closure; `χ_0` cannot be dropped). (Pat19, Lemma 2.3.15, p. 31.) **Checks.** `exists_root_mul_finiteOrder_not_finiteOrder_dropped` (`Γ=Z/2`, `χ` the sign character, `m=2`: `χ_1(g)^2=χ_1(g^2)=1≠-1`).

Prove `GaloisRep.liftProjective_hodgeTate` (weights at `v|l` labelled by `τ:F_v→Q̄_l`, `HT(χ_l)=+1`): (1) `P:G_F→PGL_2(Q̄_l)` continuous, u.a.e., with `ad^0` of one (hence every) lift de Rham at all `v|l`: a lift with Hodge–Tate–Sen weights in `½Z` at every `v|l` and `τ` and `det` of finite order exists, and every such lift has `Sym^2ρ`, `det ρ` geometric; in general no lift is Hodge–Tate (elliptic curves: weights `{0,1}`, lift `±½`). Hypothesis: a character of `G_{F_v}` with zero Sen operator has finite inertia image. (2) `F` totally real, `F'/F` any quadratic extension, `s:G_{F'}→GL_2(Q̄_l)` u.a.e., de Rham at all `v|l` with weights `{-1,0}` at every `τ` (Boxer–Calegari–Gee–Pilloni write `{0,1}` with `HT(ε)=-1`), `Proj s` extending to `P` on `G_F`: `P` lifts to `r̃:G_F→GL_2(Q̄_l)` u.a.e., Hodge–Tate of weights `{-1,0}` at every `v|l` and `τ`, with `r̃|_{G_{F'}}=s⊗ψ`, `ψ` of finite order. (BCGP21, proof of Prop. 9.2.1, p. 254.)

### 7.7 Finite-group cohomology and descent

Prove `ResidualImage.h1_res_injective_of_index_unit`: `k` a commutative ring, `S≤G` of finite index `n∈k^×`, `A∈Rep k G`: a 1-cocycle that is a coboundary on `S` is one on `G`, so `H^1(G,A)→H^1(S,A)` is injective; hence `H^1(G,A)=0` for `#G∈k^×`, and in characteristic `p` restriction to a subgroup containing a Sylow `p`-subgroup is injective. (BLGG13, Rem. A.1.2, p. 29.)

Prove `ResidualImage.h0_h1_baseChange`: `k⊆k'` fields, `M` finite-dimensional, `M'=M⊗k'`: `(M')^G=M^G⊗k'`; `H^1(G,M')=0⇒H^1(G,M)=0`; `H^0=H^1=0` over `k` ⇒ `H^1(G,M')=0`; `G` finite: `H^1(G,M')≅H^1(G,M)⊗k'`. (ACC+23, proof of Lemma 6.2.30, p. 1044.) Prove `h1_le_hom_of_trivial_normal`: `U ⊴ B` of index in `k^×` acting trivially on `N`: restriction embeds `H^1(B,N)` into `Hom_B(U,N)`. (DDT07, proof of Lemma 2.48, p. 82.)

Prove `ResidualImage.h1_borel_symPower`: `F=F_q`, `q=p^r`, `T'≤` diagonal torus, `U` unipotent, `B=T'U`, `0≤k≤p-1`, `M=Sym^k(F̄_p^2)⊗det^j`, `diag(a,d)` scaling `x^{k-i}y^i` by `χ_i=a^{k-i+j}d^{i+j}`; a resonance is `(i,s)` with `χ_i=(a/d)^{p^s}` on `T'`. No resonance, or `T'` non-scalar with every resonance `s=0`, `i<k` ⇒ `H^1(B,M)=0`, hence `H^1(G,M)=0` for `B≤G≤GL_2(F)` with `p ∤ [G:B]`. `SL_2(F)`, `j=0`: resonances `k-2i ≡ 2p^s mod (q-1)`, so `p≥5` and (`r≥2` or `k≠p-3`) ⇒ `H^1(SL_2(F),Sym^k)=0` (`r=1`, `k=p-3`: `i=k`); `GL_2(F_p)`, `p≥5`, `k=2`, `j=-1`: only resonance `i=0`, so `H^1(GL_2(F_p),ad^0)=0`. (CHT08, proof of Cor. 2.5.4, p. 57.)

Prove `ResidualImage.h1_SL2_adZero`: `F` finite of odd characteristic: `#F≠5` ⇒ `H^1(SL_2(F),ad^0)=0=H^0`; `H^1(SL_2(F_5),ad^0)` is one-dimensional, `H^1(GL_2(F_5),ad^0)=0` and `H^1(GL_2(F_5),ad^0⊗det^2)` is one-dimensional, so `H^1(G,ad^0)=0` for projective image conjugate to `PGL_2(F_5)` and `≠0` for `PSL_2(F_5)`; `n≥2`, `p>2n+1` ⇒ `H^1(SL_2(F),Sym^{2i})=0` for `1≤i≤n-1` (`2i<p-3`; sharp at `p=2n+1`: `H^1(SL_2(F_p),Sym^{p-3})≠0`). (CHT08, proof of Cor. 2.5.4, p. 57.)

Prove `ResidualImage.galoisDescent_stable_subspace`: `k'/k` Galois (possibly infinite), `W'⊆V⊗k'` stable under `1⊗Gal`: `W'=(W'∩V)⊗k'`, `H`-stable and nonzero if `W'` is. (ACC+23, proof of Lemma 6.2.30, p. 1044.) Prove `not_dvd_finrank_of_coprime_card`: `char k=p ∤ #H`, `V` a.i. of dimension `n≥1` ⇒ `p ∤ n`. (BLGG13, Rem. A.1.2, p. 29.)

### 7.8 Clebsch–Gordan in characteristic p

Prove `ResidualImage.pieri_symPower`: `V` two-dimensional over a field, `r≥2` invertible: `V⊗Sym^{r-1}V≅Sym^rV⊕det⊗Sym^{r-2}V` naturally (multiplication split by `r^{-1}Δ`); fails for `F_2`, `r=2` (`tensorSquareEquiv_not_char_two`). Prove `symPower_tensor_symPower`: `a≥b`, `(a+b)!` invertible: `Sym^aV⊗Sym^bV≅⊕_{i≤b}det^i⊗Sym^{a+b-2i}V`, so `End(Sym^{n-1}V)≅⊕_{i<n}Sym^{2i}V⊗det^{-i}` for `(2n-2)!` invertible, for every `Γ`. (CHT08, proof of Lemma 2.5.2, p. 56.)

Prove `ResidualImage.clebschGordan_mod_p`: `k⊇F_p` perfect, `0<r<p`: `(Sym^{p+r-1}V)^{ss}≅(det^r⊗Sym^{p-r-1}V)^{ss}⊕(Frob V⊗Sym^{r-1}V)^{ss}`, `Frob V` the coefficient Frobenius twist, after semisimplification only (`r=1`: `Sym^pV` is a nonsplit extension of `det⊗Sym^{p-2}V` by `Frob V=⟨x^p,y^p⟩`); `(End Sym^{n-1}V)^{ss}≅⊕_{i<n}(Sym^{2i}V⊗det^{-i})^{ss}` for all `n`, genuinely for `char k=0` or `p>2n-2`. (BCG25, proof of Thm 2.1, pp. 513–514.)

Prove `ResidualImage.symPower_SL2_irreducible`, `adjoint_one_dim_constituents`: `Sym^a(F̄_p^2)` is a.i. for `SL_2(F)`, `0≤a≤p-1` (not `a=p`), so for `SL_2(F_p)⊆r̄(Γ)` and `1≤n≤p` every twist of `Sym^{n-1}r̄` is a.i.; `p≥5`: one-dimensional constituents of `Sym^{2i}`, `0≤i≤p-1`, have multiplicity `≤1` and occur only for `i=0`, `2i=p+1` (`F=F_p` only: `V⊗V⊇∧^2V`), `2i=2p-2`; `p>3`, `r̄:G_Q→GL_2(F̄_p)` with `SL_2(F_p)⊆r̄(G_Q)`, `ρ̄=Sym^{n-1}r̄⊗ψ`: every one-dimensional constituent `χ` of `(ad ρ̄)^{ss}` has `χ^2=1`, so `H^0(G_Q,M(1))=0` for every subquotient `M` of `ad ρ̄` or its dual, in particular for `(𝔤^0_n)^*`, `𝔤^0_n=sp_n,so_n`. (CHT08, proof of Lemma 2.5.2, p. 56.)

### 7.9 Adequate subgroups

Define `ResidualImage.IsWeaklyAdequate`, `IsAdequate`, `IsGHTAdequate`: `char k=p`, `H⊆GL_n(k)` (Lean: any subgroup), `ad=M_n(k)`, `ad^0` trace-zero, `ad_0=ad/k·1` (`≅ad^0` iff `p ∤ n`); `g` semisimple iff its minimal polynomial is separable; `e_{g,α}` the projection to the generalised `α`-eigenspace. Weakly adequate: semisimple elements span `M_n(k)`. Adequate: `H^1(H,k)=0`; `H^0(H,ad^0)=H^1(H,ad^0)=0`; every simple `k̄[H]`-submodule `W⊆ad^0⊗k̄` has `tr(e_{g,α}W)≠0` for some `g,α`. GHT-adequate: `H^1(H,k)=0`, `H^1(H,ad_0)=0`, the trace condition with semisimple `g` on simple submodules of `ad⊗k̄`. `p∤n` follows from `H^0(H,ad^0)=0` (`1∈ad^0` if `p|n`), and then adequate ⇔ GHT-adequate; spanning and trace forms agree without irreducibility (`e_{g,α}` is a polynomial in the semisimple `g^{p^N}∈H`); all depend only on the image in `PGL_n(k̄)`. API: `isWeaklyAdequate_iff_trace_condition`, `IsWeaklyAdequate.absolutelyIrreducible`, `IsAdequate.not_dvd`, `isAdequate_iff_isGHTAdequate`, `IsGHTAdequate.h1_ad`, `isAdequate_baseChange_iff`, `isAdequate_units_mul_iff`, `IsAdequate.map_conj`. (Th12, Def. 2.3, p. 7; GHT17, §1, pp. 2–3; Th17, Def. 2.20, p. 14; BLGG13, Def. A.1.1, pp. 28–29.) **Checks.** `isAdequate_SL2_ZMod7`; `isAdequate_GL2_ZMod5`; `not_isAdequate_SL2_ZMod5` (weakly adequate, `H^1≠0`); `not_isAdequate_SL2_ZMod3` (order-3 quotient); `isAdequate_of_rank_one`; `not_isAdequate_of_dvd` (`n≥1`); `isAdequate_not_trivial_group` (`H=1 ⊂ GL_2(k)`: `H^0(H,ad^0)=ad^0≠0`); `isAdequate_iff_isGHTAdequate_of_coprime`; `isGHTAdequate_SL2_GF4` (GHT-adequate, not adequate as `2|2`; `ad^0` for `ad_0` fails).

Prove `ResidualImage.isAdequate_of_large_char`: `H` irreducible on `k̄^n`, `H⁺` generated by `p`-power-order elements, `d` the largest dimension of an irreducible `H⁺`-submodule, `p≥2(d+1)` ⇒ adequate; so every a.i. `H` with `p≥2(n+1)`. (GHTT12, Thm 9, pp. 71–72; Th12, Lemma 2.4(ii), p. 7.) Prove `isAdequate_of_coprime_card` (`p ∤ #H`, a.i.; BLGG13, Rem. A.1.2, p. 29); `isAdequate_of_normal_coprime_index` (`N ⊴ H` adequate, `p ∤ [H:N]`; ibid., Lemma A.1.3, p. 29); `isGHTAdequate_of_sylow_le` (`H` irreducible, `S≤H` containing a Sylow `p`-subgroup GHT-adequate ⇒ `H` is, e.g. `S=H⁺`; GHT17, Rem. 6.1, p. 28); `isAdequate_tensor` (`r_1(Γ)` adequate, `r_2|_{ker r_1}` irreducible, `p ∤ #r_2(Γ)` ⇒ `(r_1⊗r_2)(Γ)` adequate; likewise for `H^1(k)=H^1(ad)=0` plus spanning; BLGG13, Lemma A.3.1, p. 35; BCG25, proof of Thm 3.1, p. 518); `isAdequate_rank_two` (`p>2`, `G⊆GL_2(F̄_p)` finite irreducible ⇒ adequate unless `p=3` with projective image `PSL_2(F_3)` or `p=5` with `PSL_2(F_5)`; `PGL_2(F_5)` is adequate; ibid., Prop. A.2.1, p. 30; GN22, Lemma 3.2.3, p. 15; GHT17, Cor. 9.5, p. 51); `isGHTAdequate_SL2_irreducible` (nontrivial a.i. `V` of `SL_2(F_{p^r})` is GHT-adequate unless `r=1`, `1<dim V=(p±1)/2`; or `p^r∈{2,3,4}`, `dim V=p^r`; or `p^r=9`, `dim V∈{3,6,9}`; ibid., Cor. 9.4, p. 50).

Prove `ResidualImage.isAdequate_symPower`: (1) `p>5`, `SL_2(F_p)⊆r̄(G_Q)`, `p-2≤n≤p` ⇒ `(Sym^{n-1}r̄)(G_{Q(ζ_p)})` GHT-adequate, adequate for `n=p-2,p-1`; (2) `p≥5`: some `a_0(p)≥3` such that for `a≥a_0` and finite `G⊆GL_2(F̄_p)` containing a conjugate of `SL_2(F_{p^a})`, for `0<r<p` the images of `Sym^{r-1}` and of `φ_pStd⊗Sym^{r-1}` (coefficient Frobenius on the first factor) are adequate, and every subgroup of index `<2p` contains a conjugate of `SL_2(F_{p^a})`; (3) finite image with `SL_2(F_p)⊆r̄(Γ')`, `p≥2n+2` ⇒ `(Sym^{n-1}r̄)(Γ')` adequate. (NT26, Lemma 2.3, p. 11.)

### 7.10 Enormous images

Define `ResidualImage.IsEnormous`, `IsRegularSemisimple`: `k/F_p` algebraic, `H⊆GL_n(k)` a.i.: (1) no nontrivial `p`-power quotient; (2) `H^0(H,ad^0)=H^1(H,ad^0)=0`; (3) every simple `k[H]`-submodule `W⊆ad^0` has `W^h≠0` for some `h∈H` with separable characteristic polynomial. (Lean: any field `k`, `p=ringChar k`; `k/F_p` algebraic where needed: `⟨t⟩⊂GL_1(F_p(t))` has quotient `Z/p`.) `p|n` excludes enormity (`1∈ad^0`); the notion depends only on the image in `PGL_n` and is invariant under algebraic `k'/k`; with all eigenvalues in `k` it is Khare–Thorne's form and implies adequacy for finite `H`; `n=2`, `p` odd, finite irreducible `H`: enormous ⇔ adequate. API: `isEnormous_iff_forall_submodule`, `IsEnormous.not_dvd`, `isEnormous_iff_of_image_PGL_eq`, `isEnormous_baseChange_iff`, `isEnormous_iff_KT`, `IsEnormous.isAdequate`, `isEnormous_iff_isAdequate_of_two`, `IsEnormous.eq_of_normal_pGroup_quotient`, `IsEnormous.map_conj`. (ACC+23, Def. 6.2.29, Lemma 6.2.30, Rem. 6.2.31, pp. 1044–1045; KT17, Def. 4.10, p. 22; GN22, Rem. 3.2.2, Lemma 3.2.3, p. 15.) **Checks.** `isEnormous_SL2_ZMod7`; `isEnormous_baseChange_iff`; `not_isEnormous_SL2_ZMod5` (`H^1≠0`, all else holds); `not_isEnormous_SL2_ZMod3` (order-3 quotient; omitting (1) fails); `not_isEnormous_of_dvd` (`n≥1`); `isEnormous_of_rank_one`; `not_isEnormous_Q8_tensor_Q8` (adequate, not enormous: eigenvalues `±1,±i`, never four distinct).

Define `ResidualImage.IsEnormousCharZero`: `E/Q_p` finite, `H⊆GL_n(O_E)`: every simple `E[H]`-submodule `V⊆M_n(E)` has `tr(e_{h,α}V)≠0` for some `h` with `n` distinct eigenvalues in `E` and eigenvalue `α`; no cohomological or `p`-quotient condition, all of `M_n(E)`. Enormous ⇒ a.i.; with split characteristic polynomials, enormous `H'≤H` ⇒ `H` enormous, and `H` is enormous if `G°` of its Zariski closure (or the derived group of `G°`) has regular semisimple elements and is a.i. API: `IsEnormousCharZero.absolutelyIrreducible`, `.mono`, `isEnormousCharZero_of_zariskiClosure`, `isEnormousCharZero_of_derived`, `.baseChange`. (NT23, Def. 2.23, Rem. 2.24, Lemmas 2.25, 2.28, pp. 20–23; NT26, Lemma 4.7, p. 33.) **Checks.** `isEnormousCharZero_SL2` (`h=diag(a,a^{-1})`, `a^2≠1`); `not_isEnormousCharZero_of_reducible` (diagonal torus); `IsEnormousCharZero.absolutelyIrreducible`; `isEnormousCharZero_rank_one`.

Prove `ResidualImage.isEnormous_symPower`: `n≥2`, `p>2n+1`, `k'⊆k` finite, `k^×·Sym^{n-1}GL_2(k')⊇H⊇Sym^{n-1}SL_2(k')` ⇒ enormous (the printed `l>2n-1` fails for `n=2`, `l=5`). (GN22, Lemma 3.2.5, p. 15; CHT08, Cor. 2.5.4, p. 57.) Prove `isEnormous_symPower_of_SL2_le` (`n≥2`, `l>2n+1`, finite `H⊆GL_2(F̄_l)` containing `SL_2(F_l)` ⇒ `Sym^{n-1}H⊆GL_n(F̄_l)` enormous; ACC+23, Lemma 7.1.4, p. 1089); `isEnormous_symPower_baseChange` (`F/Q` finite with normal closure `F̃`, `m≥1`, `l>2m+3`, `r̄(G_{F̃})⊇SL_2(F_l)`, `F'/F` linearly disjoint from the field of `r̄` ⇒ `(Sym^mr̄)(G_{F'(ζ_l)})` enormous; ibid., Lemma 7.1.6(2), p. 1090; Qia23, Lemma 2.6(1), p. 1251); `isEnormous_of_SLn_le` (`n>2`, `p>n`, `k^×·GL_n(k')⊇H⊇SL_n(k')`; GN22, Lemma 3.2.4, p. 15).

### 7.11 Big images for GSp_4

Define `ResidualImage.GSp4.IsEnormous`, `IsWeaklyEnormous`, `IsTidy`, `IsVast`: `k` finite of characteristic `p≥3`, `ad^0=sp_4⊗k`. `H⊆GSp_4(k)` enormous: (E1) `H^1(H,ad^0)=0`, (E2) a.i. on `k^4`, (E3) every simple `k̄[H]`-submodule `W⊆ad^0⊗k̄` has some `h∈H` with 4 distinct eigenvalues and eigenvalue 1 on `W`; weakly enormous: (E2), (E3); no `p`-quotient condition. Tidy: some `h` with `ν(h)≠1` and no two eigenvalues (with multiplicity) in ratio `ν(h)`. `ρ̄:G_F→GSp_4(k)` vast: `ρ̄(G_{F(ζ_{p^N})})` enormous for all large `N`, or weakly enormous for all large `N` with `ζ_p` outside the field of `ad^0ρ̄`. Enormity depends only on the image in `PGSp_4`; weak enormity and tidiness pass to overgroups; `ρ̄(G_{F(ζ_{p^N})})` is constant for `N≥1+δ` (`p≥5`), `N≥2+δ` (`p=3`), `δ=1` if `p` is unramified in `F`. API: `isEnormous_iff_of_projective_eq`, `IsWeaklyEnormous.mono`, `image_cyclotomic_stabilises`, `isVast_twist_iff`, `IsEnormous.toGL4`. (BCGP21, Def. 7.5.2, Lemma 7.5.3, Rem. 7.5.4, Lemma 7.5.5, Defs. 7.5.6, 7.5.11, pp. 198–201.) **Checks.** `isEnormous_Sp4_ZMod7`; `isWeaklyEnormous_not_isEnormous_wreath_ZMod5`; `isEnormous_SL2wr_ZMod3` (enormous despite an order-3 quotient); `isTidy_of_center` (central scalar `λ`, `λ^2≠1`: `ν=λ^2`); `not_isTidy_Sp4`.

Prove (all BCGP21) `GSp4.h1_adZero_twist_eq_zero` (`N≥1`, `L` the field of `ad^0ρ̄`, `ζ_p∉L` or `ρ̄(G_{F(ζ_{p^N})})` enormous ⇒ `H^1(Gal(L(ζ_{p^N})/F),ad^0ρ̄(1))=0`, so for all large `N` if vast; Lemma 7.5.9, p. 200); `image_cyclotomic_tower_SL2_wreath_three` (`G=SL_2(F_3)≀Z/2⊆Sp_4(F_3)`, `Γ⊆{(A,B)σ^e:det A=det B}`, `Γ∩Sp_4=G`, `ν(Γ)={±1}`, `N ⊴ Γ`, `N⊆G`, `G/N` a 3-group, `Γ/N` abelian ⇒ `N=G`; hence `ζ_3∉F`, image `Γ`, similitude `ε̄^{-1}`, `ρ̄(G_{F(ζ_3)})=G` ⇒ `ρ̄(G_{F(ζ_{3^M})})=G` for all `M`; proof of Lemma 7.5.22, p. 205); `isTidy_of_center_card_ge_three` (a.i., centre of order `≥3`; Lemma 7.5.12, p. 201); `isTidy_of_equalDet_blocks` (`p≥5`, `{(A,B):det A=det B}⊆H`; Lemma 7.5.13, p. 201); `e1_e2_of_char_ge_eleven` (`p≥11`, a.i. ⇒ (E1), (E2), via `isAdequate_of_large_char`; `p=3,5,7` by finite computation; Lemma 7.5.14, p. 201); `isEnormous_Sp4_isTidy_GSp4` (`p≥3`: `Sp_4(F_p)` enormous, `GSp_4(F_p)` tidy, surjective `ρ̄` with similitude `ε̄^{-1}` vast and tidy; Lemma 7.5.15, p. 201); `inducedBlock_decomposition` (`G⊆Sp_4(k)` a.i., `W|_H=V⊕V^σ` for `H` of index two with the form nondegenerate on `V` (Lagrangian case excluded), `χ` the quadratic character: `ad^0W=Sym^2W≅Ind ad^0V⊕As(V)`, `∧^2W≅k⊕k(χ)⊕As(V)⊗χ`, `W⊗W` the sum of all five; §7.5.16, pp. 201–202); `e3_of_outside_index_two` (`As(V)`, `Ind ad^0V` a.i., `G∖H` containing an element of order not dividing 4 and prime to `p` ⇒ (E3); Lemma 7.5.17, p. 202); `isEnormous_SL2_wreath` (`SL_2(k)≀Z/2⊆Sp_4(k)` weakly enormous, enormous iff `#k≠5`; Lemma 7.5.18, pp. 202–203); `isVast_induced_mod_five` (`H/F` quadratic, `r̄:G_H→GL_2(F_5)` onto with `det=ε̄^{-1}`, `ρ̄=Ind r̄`, `ρ̄(G_{F(ζ_5)})=SL_2(F_5)≀Z/2`, 5 unramified in `F` ⇒ weakly enormous for all `N`, `ζ_5` outside the field of `ad^0ρ̄`, vast; Lemma 7.5.19, pp. 203–204); `char_three_enumeration` (exactly 11 of the 162 conjugacy classes of subgroups of `Sp_4(F_3)` are enormous, of orders 40, 128, 160, 192, 240, 320, 384, 384, 1152, 1920, 51840; `GSp_4(F_3)`, the group of order 3840, `Δ⋊Z/2` of order 2304 with its two index-3 subgroups of order 768, and `Ã_5⋊⟨σ⟩` of order 480 are tidy with enormous intersection with `Sp_4(F_3)`; §7.5.20, Lemma 7.5.21, p. 204); `isVast_isTidy_SL2_wreath` (`p≥3`, `K/F` quadratic unramified at `p`, `r̄(G_{K(ζ_p)})=SL_2(k)`, `Proj r̄^σ≇Proj r̄` including `τ∘Proj r̄` for a field automorphism `τ`, `det r̄^σ=det r̄=ε̄^{-1}`, and for `p=3` linear disjointness over `K(ζ_3)` of the fields of the projective restrictions ⇒ `Ind r̄` vast and tidy; Lemma 7.5.22, pp. 204–205); `isEnormous_Q8_wreath` (`Q_8≀Z/2`, order 128, in `Sp_4(F_3)` is enormous; Rem. 7.5.23, p. 205).

Define `GSp4.HasBigImage`: `p>2`, `r̄:G_Q→GSp_4(k)`, `ad(r̄)=ad^0(r̄)⊕k` trivially on the centre: (H1) `ζ_p∉Q(ad^0r̄)`, i.e. `ker(ad^0r̄) ⊄ G_{Q(ζ_p)}`; (H2) for every `m≥1` some `σ∈G_{Q(ζ_{p^m})}` has four distinct eigenvalues and eigenvalue 1 on every irreducible constituent of `ad^0r̄⊗k̄`; (H3) neither `ad^0r̄(G_Q)` nor `ad^0r̄(1)(G_Q)` has a quotient of order `p`; the strong form (H3') asks this of `ad^0r̄(G_{Q(ζ_p)})` and implies (H3). Twist-invariant; with absolute irreducibility over every `Q(ζ_{p^N})` it implies vast. API: `adjointRep_eq_sp4_add_trivial`, `HasBigImage.h1`, `.exists_sigma`, `.isVast`, `hasBigImage_twist_iff`, `HasBigImage.of_h3_cyclotomic`. (CG20 (arXiv v1), Assumption 4.1, p. 10, published p. 813.) **Checks.** `hasBigImage_of_surjective` (`p≥5`); `not_hasBigImage_of_zeta_mem` (`p=3`, onto, similitude `ε̄^{-1}`: `ker(ad^0r̄)=r̄^{-1}(scalars)`, a scalar `λ` has `ν=λ^2=1` for `λ∈F_3^×={±1}`, so `ε̄=1` on the kernel and (H1) fails though `r̄` is vast; for `p≥5` the scalar `2` has `ν=4≠1`; vastness or the cyclotomic image alone cannot define it); `adjoint_split`; `hasBigImage_isVast`.

Prove `GSp4.hasBigImage_induced`, `hasBigImage_of_surjective`: `p≥5`; (1) `K/Q` imaginary quadratic, `K ⊄ Q(ζ_p)`, `ρ̄:G_K→GL_2(F_p)`, `det ρ̄=ε̄^{1-k}`, `(ρ̄,ρ̄^c)` mapping `G_{K(ζ_p)}` onto `SL_2(F_p)^2`: `r̄=Ind ρ̄` with either symplectic form (multipliers `ε̄^{1-k}`, `ε̄^{1-k}η_{K/Q}`) has `ad^0r̄|_{G_K}≅(ρ̄⊗ρ̄^c)ε̄^{k-1}⊕ad^0ρ̄⊕ad^0ρ̄^c`, `ad^0r̄≅As(ρ̄)ε̄^{k-1}⊕Ind ad^0ρ̄` up to a quadratic twist of `As`, `r̄(G_{Q(ζ_{p^m})})=SL_2(F_p)^2⋊Z/2` for all `m`, and big image; (2) `r̄(G_Q)=GSp_4(F_p)` ⇒ big image. Both satisfy (H3'). (CG20 (arXiv v1), Ex. 4.11 and proof, p. 14, published pp. 818–819.)

### 7.12 Taylor–Wiles image conditions

Define `ResidualImage.TaylorWilesImageConditions`, `EnormousTaylorWilesImageConditions`: `s̄:G_F→GL_n(F̄_p)` continuous (finite image in some `GL_n(k)`): (TW2) `s̄(G_{F(ζ_p)})` adequate, resp. enormous; (TW3) some `σ∈G_F∖G_{F(ζ_p)}` has `s̄(σ)` scalar, i.e. `ζ_p∉` the field of `ad s̄` (`F` of characteristic 0, `k` of characteristic `p`). Decomposed genericity is not part of this. Restriction to `G_H` preserves them when `H` is linearly disjoint over `F` from the field of `s̄` times `F(ζ_p)` (equal images alone fail: `F=Q`, `H=Q(ζ_p)`, `s̄` trivial). API: `tw3_iff_zeta_not_mem`, `TaylorWilesImageConditions.twist` (`k` finite), `EnormousTaylorWilesImageConditions.toTaylorWiles`, `TaylorWilesImageConditions.restrict`. (BCGNT25, Def. 5.2.1, pp. 50–51; ACC+23, Thm 6.1.1(3)–(4), p. 1029.) **Checks.** `twImageConditions_rank_one` (iff `ζ_p∉F`); `not_twImageConditions_of_zeta_mem` (testing the image group alone fails); `twImageConditions_elliptic` (`G_Q→GL_2(F_7)` onto, cyclotomic determinant: `SL_2(F_7)` adequate and enormous; the scalar `2·1` has `ε̄=det=4≠1`, so (TW3) holds); `tw3_iff_zeta_not_mem`.

Prove (BCGNT25 unless stated) `ResidualImage.twImageConditions_baseChange` (`F/Q` Galois, `H/F` finite with Galois closure over `Q` linearly disjoint over `F` from `F(ζ_p)` times the Galois closure of the field of `s̄` ⇒ equal images over `H`, `H(ζ_p)`, and the conditions hold for `s̄|_{G_H}`; Lemma 5.2.2, p. 51); `unitaryTensor_isAdequate`, `unitaryTensor_multiplier`, `unitaryTensor_tw3` (`F/Q` Galois, `r̄_A:G_F→GL_2(F_p)` with `r̄_A(G_{F(ζ_p)})=SL_2(F_p)`, `r̄_B:G_F→GU_m(F_{p^2})` with `r̄_B(G_{F(ζ_p)})=SU_m(F_{p^2})`, `s̄=Sym^{n-1}r̄_A⊗r̄_B`, `p>2mn+1`, and for `m=2` the Galois closures over `Q` of the projective fixed fields linearly disjoint over `F(ζ_p)` ⇒ `s̄(G_{F(ζ_p)})` adequate; `det r̄_A=ε̄^{-m}` and multiplier `ε̄^{1-m}` for `r̄_B` ⇒ `s̄` lands in `GU_{mn}(F_{p^2})` with multiplier `ε̄^{1-mn}`; moreover `ε̄(G_F)=F_p^×` ⇒ (TW3); Lemma 5.2.4, pp. 52–53); `cyclicInduced_frobenius_eigenvalues` (`E/Q` cyclic of degree `m`, `p ∤ m`, linearly disjoint from `F`, `L=EF`, `ψ:G_L→F_p^×`, `r̄_B=Ind ψ`, `q` split in `F`, unramified for `r̄_B`, `Frob_q` generating `Gal(E/Q)` ⇒ eigenvalues of `r̄_B(Frob_v)`, `v|q`, are `λ,ζλ,…,ζ^{m-1}λ` in `F̄_p`, `ζ` primitive; Lemma 5.2.5, pp. 53–54); `solvableInducedTensor_isAdequate`, `solvableInducedTensor_tw3` (`r̄_A` as above, `r̄_B≅Ind_{G_L}^{G_F}ψ:G_F→GL_m(F_p)` with `r̄_B|_{G_{F(ζ_p)}}` a.i., `s̄=Sym^{n-1}r̄_A⊗r̄_B`, `p>2mn+1` ⇒ adequate image over `F(ζ_p)`; (TW3) when `det r̄_A=ε̄^{-m}`, `det r̄_B=ε̄^{-m(m-1)/2}`, `ε̄(G_L)=F_p^×`; Lemma 5.2.6, pp. 54–55); `symPower_tw3` (under the hypotheses of `isEnormous_symPower_baseChange`, `l` unramified in `F'/Q` ⇒ `ζ_l∉` (field of `ad Sym^mr̄`)·`F'`, so `Sym^mr̄|_{G_{F'}}` satisfies the enormous conditions; ACC+23, proof of Lemma 7.1.6(1), p. 1090).

### Dependencies

Layers 1, 2, 4; Tau Ceti `Representation.symmetricPower`, `exteriorPower`, `tensorPower`, `tensorInducedRepresentation`, `Module.Basis.symmetricPower`, `SymmetricPower.finrank_eq`, `ContRepresentation.linHom`, `traceBilinForm_nondegenerate`, `ConstantForm.groupScheme`, `Symplectic.groupScheme`, `Orthogonal.groupScheme`, `CommHopfAlgCat.hopfIdealOrderIsoClosedSubgroup`, `FiniteTypeCommHopfAlgCat.identityComponent`, `ContCohomology.cochainsCor1`; `TauCetiRoadmap.ReductiveGroups` layers 0, 2, 3, 6; `TauCetiRoadmap.ProfiniteCohomology` layers 10, 13; `TauCetiRoadmap.RepresentationTheory/InductionRestriction` layer 7; IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1; Mathlib `SymmetricPower`, `ExteriorAlgebra.exteriorPower`, `PiTensorProduct`, `MonoidHom.transfer`, `LinearMap.charpoly`, `Representation.linHom`, `dualTensorHomEquiv`, `LinearMap.IsPerfPair`, `Matrix.symplecticGroup`, `NumberField.IsCMField`, `Subgroup.goursat`, `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple'`, `groupCohomology.H1`, `InfiniteGalois.mem_bot_iff_fixed`, `FDRep.char_orthonormal`, `Matrix.SL2.commutator_eq_top`.

## Downstream consumers

`AutomorphicGaloisRepresentations` (the carrier, integral models and local restrictions of Layers 1
and 2), `AutomorphicGaloisRepresentationsPartII` (polarised representations and the integral and
residual exports of Layers 1 and 7), `GlobalGaloisDeformations` and `LocalGaloisDeformationRings`
(the carrier over complete local rings, the adjoint and trace-zero adjoint, the polarised and
determinant-variable problems of Layer 7), `ArithmeticGaloisDuality` (topological coefficients of
Layer 1 and the Selmer comparisons of Layer 7), `PadicHodgeTheory` (the carrier of Layer 1 as the
input of the period functors), `GL2AutomorphicRepresentationsAndTransfer` (Layers 1 and 2),
`PotentialModularityAndCompatibleSystems` (Layers 5 and 7), `SmallRamificationAndAbelianVarietyBaseCases`
(Layer 2), `ClassicalSerreModularity`, `EllipticCurveModularity`, `ComplexMultiplicationAndExplicitReciprocity`,
`FaltingsFinitenessAndIsogenyTheorems`, `HeegnerPointEulerSystems` and `AbelianSchemesAndArithmeticModuli`
A6 (the Tate modules of Layer 6).

## References

- Allen, Calegari, Caraiani, Gee, Helm, L. Hung, Newton, Scholze, Taylor, Thorne, *Potential automorphy over CM fields*, Annals of Math. 197 (2023), 897–1113.
- T. Barnet-Lamb, T. Gee, D. Geraghty, *Serre weights for rank two unitary groups*, arXiv 1106.5586v1.
- T. Barnet-Lamb, T. Gee, D. Geraghty, R. Taylor, *Potential automorphy and change of weight*, arXiv:1010.2561v4 (Annals of Math. 179 (2014)).
- M. A. Bennett and S. Siksek, *A conjecture of Erdős, supersingular primes and short character sums*, Annals of Mathematics 191 (2020), no. 2, 355–392.
- G. Boxer, F. Calegari, T. Gee, *Cuspidal cohomology classes for GL_n(Z)*, J. Amer. Math. Soc. 38 (2025), 509–520.
- Boxer, Calegari, Gee, Newton, Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, arXiv:2309.15880v3.
- G. Boxer, F. Calegari, T. Gee, V. Pilloni, *Abelian surfaces over totally real fields are potentially modular*, arXiv:1812.09269v3Publ. Math. IHÉS 134 (2021) 153–501).
- G. Boxer, F. Calegari, T. Gee and V. Pilloni, *Modularity theorems for abelian surfaces*, arXiv:2502.20645v1.
- A. Brumer and K. Kramer, *The conductor of an abelian variety*, Compositio Math. 92 (1994), 227–248.
- Gebhard Böckle, M. Harris, C. Khare and J. A. Thorne, *Ĝ-local systems on smooth projective curves are potentially automorphic*, arXiv:1609.03491v2.
- F. Calegari, V. Dimitrov, Y. Tang, *The unbounded denominators conjecture*, arXiv 2109.09040v4.
- F. Calegari, D. Geraghty, *Modularity lifting beyond the Taylor–Wiles method*, arXiv:1207.4224v2 297–433);.
- F. Calegari and D. Geraghty, *Modularity lifting for non-regular symplectic representations (published title: Minimal modularity lifting for nonregular symplectic representations)*, Duke Math. J. 169 (2020), 801–896.
- F. Calegari, D. Geraghty, M. Harris, *Bloch–Kato conjectures for automorphic motives (appendix)*, arXiv:1907.08694v1.
- F. Calegari and D. Geraghty, *Modularity lifting for non-regular symplectic representations*, arXiv:1907.08691v1. J. 169 (2020) article listed as cg20.
- A. Caraiani, J. Newton, *On the modularity of elliptic curves over imaginary quadratic fields*, arXiv:2301.10509v3.
- Gaëtan Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings*, arXiv:0809.0415v2.
- L. Clozel, M. Harris and R. Taylor, *Automorphy for some l-adic lifts of automorphic mod l Galois representations*, Publ. Math. IHÉS 108 (2008), 1–181.
- L. Clozel, J. A. Thorne, *Level-raising and symmetric power functoriality, III*.pdf (Duke Math. J. 166 (2017)).
- H. Darmon, F. Diamond and R. Taylor, *Fermat's Last Theorem*, 2007 revised version from Darmon's McGill page.
- P. Deligne and Jean-P. Serre, *Formes modulaires de poids 1*, Ann. Sci. ENS (4) 7 (1974), 507–530.
- P. Deligne, *Les constantes des équations fonctionnelles des fonctions L*, LNM 349 (1973).
- P. Deligne, *La conjecture de Weil. I*, Publ. Math. IHÉS 43 (1974), 273–307.
- L. E. Dickson, *Linear groups with an exposition of the Galois field theory*, Teubner, Leipzig 1901.
- L. V. Dieulefait and Ariel Martín Pacetti, *A simplified proof of Serre's conjecture*, arXiv:2108.07577v2.
- Javier Fresán, C. Sabbah, Jeng-D. Yu, *Hodge theory of Kloosterman connections*, arXiv:1810.06454v5 (13 June 2022, labelled final published version; Duke Math. J. 171 (2022) 1649–1747);.
- T. Gee, J. Newton, *Patching and the completed homology of locally symmetric spaces*, arXiv 1609.06965v5 (18 Nov 2019). Inst. Math. Jussieu 21 (2022) 395–458.
- R. Guralnick, F. Herzig, P. H. Tiep, *Adequate subgroups and indecomposable modules*, arXiv 1405.0043v3 (6 Mar 2017). Eur. Math. Soc. 19 (2017).
- R. Guralnick, F. Herzig, R. Taylor, J. Thorne, *Appendix: adequate subgroups (to Thorne, On the automorphy of l-adic Galois representations with small residual image)*, Thorne's homepage copy appendix.pdf (running pages 60–74); its Theorem 9 is cited as Theorem A.9 of the published paper.
- C. Khare, J. A. Thorne, *Potential automorphy and the Leopoldt conjecture*, arXiv 1409.7007v2. J. Math. 139 (2017).
- C. Khare and Jean-P. Wintenberger, *Serre's modularity conjecture (I)*, Author's preprint results.pdf of Invent. Math. 178 (2009).
- C. Khare, Jean-P. Wintenberger, *Serre's modularity conjecture (II)*.pdf (, 30 May 2009) of Invent. Math. 178 (2009), 505–586.
- M. Kisin, R. Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*, arXiv:2103.09945v2 (, 7 October 2024).
- Q. Liu, *Conducteur et discriminant minimal de courbes de genre 2*, Compositio Math. 94 (1994), 51–79.
- D. Masser, U. Zannier, *Abelian varieties isogenous to no Jacobian*, Annals of Math. 191 (2020), 635–674.
- J. S. Milne, *Abelian Varieties (course notes)*, version 2.00, March 16, 2008.
- J. S. Milne, *Elliptic Curves*, Second edition, World Scientific 2021.
- J. Newton, J. A. Thorne, *Adjoint Selmer groups of automorphic Galois representations of unitary type*, arXiv 1912.11265v3 (30 Jun 2023). Eur. Math. Soc. 25 (2023) 1919–1967.
- J. Newton and J. A. Thorne, *Symmetric power functoriality for Hilbert modular forms*, arXiv:2212.03595v2 (19 February 2025).
- R. Noot, *Abelian varieties — Galois representation and properties of ordinary reduction*, Compositio Math. 97 (1995), 161–171.
- S. Patrikis, *Variations on a theorem of Tate*, arXiv:1207.6724v4 (Mem. Amer. Math. Soc. 258 (2019)).
- L. Qian, *Potential automorphy for GL_n*, arXiv 2104.09761v1.
- K. A. Ribet, *A modular construction of unramified p-extensions of Q(µ_p)*, Invent. Math. 34 (1976), 151–162.
- K. A. Ribet, *Abelian varieties over Q and modular forms*, author PDF of the 1992 KAIST lectures (Algebra and Topology 1992, Korea Adv. Inst. Sci. Tech.).
- R. Richard, A. Yafaev, *Generalised André–Pink–Zannier conjecture for Shimura varieties of abelian type*, .
- Jean-P. Serre, *Sur les corps locaux à corps résiduel algébriquement clos*, Bull. Soc. Math. France 89 (1961), 105–154.
- Jean-P. Serre, *Facteurs locaux des fonctions zêta des variétés algébriques (définitions et conjectures)*, Séminaire Delange–Pisot–Poitou 11 (1969/70), exp. 19.
- Jean-P. Serre, *Propriétés galoisiennes des points d'ordre fini des courbes elliptiques*, Invent. Math. 15 (1972), 259–331.
- Jean-P. Serre, *Quelques applications du théorème de densité de Chebotarev*, Publ. Math. IHÉS 54 (1981), 123–201.
- Jean-P. Serre, *Sur les représentations modulaires de degré 2 de Gal(Q̄/Q)*, Duke Math. J. 54 (1987), 179–230.
- J. Thorne, *On the automorphy of l-adic Galois representations with small residual image*, arXiv 1107.5989v1. Inst. Math. Jussieu 11 (2012) 855–920.
- J. A. Thorne, *A 2-adic automorphy lifting theorem for unitary groups over CM fields*.pdf dated 16 March 2016. Z. 285 (2017) 1–38.
- D. Ulmer, *Conductors of ℓ-adic representations*, arXiv:1307.4525v4 (7 Jul 2015), published Proc. Amer. Math. Soc. 144 (2016).
