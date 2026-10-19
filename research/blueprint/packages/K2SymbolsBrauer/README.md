# Roadmap: explicit K₂: symbols, residues and reciprocity

**Summary.** Build classical K₂ of an associative ring from the Steinberg group, prove that the stable Steinberg group is the universal central extension of the elementary group, and identify K₂ with the second homology of E(R) and with Quillen's K₂. Present K₂ of a field by Steinberg symbols (Matsumoto's theorem), develop Milnor K-theory and the graded map to Quillen K-theory. Construct tame symbols and higher Milnor residues, Milnor norms with Kato's independence theorem and Suslin's reciprocity law for curves over any field, and compare residues and norms with the localization boundary and Quillen transfers. Compute tame kernels of rings of S-integers, K₂(ℤ) ≅ ℤ/2 and K₂(ℚ). Develop Dennis–Stein symbols and relative K₂ of ideals contained in the Jacobson radical, and compare symbols with Hilbert symbols, cyclic algebras, local invariants and the Galois symbol.

The end theorems are: St(R) → E(R) is the universal central extension, so that K₂(R) ≅ H₂(E(R); ℤ) ≅ π₂(BGL(R)⁺) naturally in R (Layers 3–4); Matsumoto's theorem K₂ᴹ(F) ≅ K₂(F) for every field (Layer 7); the Bass–Tate sequence for F(t), Kato's theorem on Milnor norms and Suslin's reciprocity law (Layer 10); the localization theorem 0 → K₂(O_F) → K₂(F) → ⊕_𝔭 k(𝔭)^× → 0 with K₂(ℤ) = ℤ/2·{−1,−1} (Layers 11–12); the Dennis–Stein presentation of K₂ of a threefold stable ring (Layer 13); and the identification of symbols with Hilbert symbols and local invariants (Layer 14).

## Scope and ownership

This roadmap owns: universal central extensions of discrete groups, Hopf's formula and the recognition theorem (Layer 1, used also by StableHomotopyKTheory and K3BlochGroups); the finite-rank and stable Steinberg groups and classical K₂ of an associative unital ring; the comparison of classical K₂ with group homology and with π₂ of the plus construction; Steinberg symbols, Milnor K-theory of fields and Matsumoto's theorem; the graded map from Milnor to Quillen K-theory and its degree-two identification; tame symbols, higher Milnor residues and specialisation maps; Milnor norms, Kato's theorem, the norm–residue formula and Weil–Suslin reciprocity; the comparison of residues and norms with the K-theory localization boundary and transfers; tame kernels and the explicit groups K₂(𝔽_q), K₂(ℤ), K₂(ℚ); Dennis–Stein symbols, relative Steinberg groups and relative K₂ of ideals contained in the Jacobson radical, including square-zero ideals; and the comparisons of symbols with Hilbert symbols, cyclic algebras and the Galois symbol.

### Prerequisites and boundaries

The K-theory companions GeneralAlgebraicKTheory, StableHomotopyKTheory, KTheoryLowDegrees and MotivicEtaleKTheory are atlas packages, with the layer contracts below; they are not present in the current upstream roadmap checkout. Upstream submission requires an approved bundle or an order in which their supplying layers are already upstream. In particular the Layer 7/M.3 dependency cycle requires a bundle decision.

- **Stable linear groups and K₁.** GL(R), the elementary subgroup E(R), elementary matrices e_ij(a), the stabilisation maps, Whitehead's lemma, the triviality of the centralizer of E(R) in GL(R) and classical K₁(R) = GL(R)/E(R) are KTheoryLowDegrees Layers 6–8 (equivalently GeneralAlgebraicKTheory §§3.3–3.4). The commuting relation e_ij(a)e_kl(b) = e_kl(b)e_ij(a) for j ≠ k, i ≠ l over an associative ring is proved here (§2.2), since those layers state only the chaining identities.
- **Quillen K-theory.** The K-theory space of a ring, the plus = Q theorem, products, transfers with the projection formula, the localization theorem for a Serre subcategory, dévissage, resolution and relative K-theory are GeneralAlgebraicKTheory (companion atlas package), Layers 3, 4, 7 and 8.
- **Plus constructions.** Classifying spaces, homotopy fibres and their long exact sequences, the plus construction, its uniqueness and functoriality, π₂ of a plus construction and the block-sum H-space structure are StableHomotopyKTheory (companion atlas package), Layers 1–4. Hurewicz, Whitehead and covering spaces are TauCetiRoadmap AlgebraicTopology Stages 5 and 8.
- **Galois symbol and Tate's theorems.** The Tate twists μ_m^{⊗j}, the Galois symbol h_F : K₂(F)/m → H²(F, μ_m^{⊗2}) with its cohomological Steinberg relation, Tate's local, global and S-integer theorems, the étale localization sequence and the étale Chern classes belong to MotivicEtaleKTheory (M.1, M.3, M.8); Layer 14 uses them and proves the comparisons stated there. MotivicEtaleKTheory M.3 in turn uses Matsumoto's theorem (Layer 7): the two roadmaps depend on each other only through these layers.
- **Hilbert symbols and class field theory.** The degree-n norm-residue symbol of a local field, its value at a place of a number field, its Steinberg and skew-symmetry relations and Hilbert's product formula of degree n are TauCetiRoadmap ClassicalArithmeticCompletion Layer 1 (§§1.14, 1.15, 1.24, 1.25, 1.52). Local and global Artin maps, the Brauer group, the local invariant and the Brauer sequence are TauCetiRoadmap ClassFieldTheory Layers 4–6, 10 and 14; the quadratic Hilbert symbol and the Hasse invariant are QuadraticFormInvariants 6C, 6E and 7B; Kummer theory and low-degree cup products are ProfiniteCohomology Layers 6, 8 and 9.
- **Curves and valuations.** Places of function fields, their residue fields and the curve–function-field dictionary are TauCetiRoadmap AlgebraicCurves Layers 2 and 12 and the Tau Ceti `Place` API; the elliptic-curve Weil reciprocity f(div g) = g(div f) is EllipticCurves Layer 2; units and the filtration of a local field are LocalFieldsRamification Layer 1. Normalized extensions of complete discretely valued fields with arbitrary (possibly inseparable) residue field have no owner in those roadmaps and are stated here (§10.15–§10.18).
- **Groups.** Group homology with trivial coefficients, including the first-homology/abelianisation equivalence `groupHomology.H1AddEquivOfIsTrivial`, is Mathlib's `groupHomology`. Its naturality is already in current Tau Ceti, `RepresentationTheory/Homological/GroupHomology/Functoriality:TauCeti.groupHomology.H1AddEquivOfIsTrivial_map`; the integral trivial-coefficient case follows by tensoring with ℤ. Group extensions, factor sets and classification by H² for a fixed action are supplied by Mathlib's `GroupExtension` and Tau Ceti's `FactorSet`: `exists_cohomologyClass_eq` gives existence, and `TauCeti.GroupExtension.nonempty_equiv_iff_cohomologyClass_factorSet_eq` compares marked extensions inducing the same fixed action, using sections σ, σ′ with σ(1)=σ′(1)=1. Central extensions use the trivial action. These classification results are consumed, not reconstructed. Ordinary Bruhat decomposition, Weyl groups and BN-pairs are TauCetiRoadmap ReductiveGroups Layer 7, and the Coxeter word problem is RepresentationTheory/RootSystems Layer 3; the unique middle monomial factor of the Bruhat decomposition of SL_n over a field, with its root-coordinate formulas, is stated here (§6.15, §6.16, §7.4). Tau Ceti's quaternion splitting `ℍ[K, a, 1 − a] ≃ₐ M₂(K)` gives the Steinberg relation for quaternion symbols and is consistent with §14.4–§14.5.
- **Not here.** The Lie-theoretic Steinberg endomorphisms already in Tau Ceti are unrelated objects. Higher Milnor–Quillen comparisons beyond degree three, the Merkurjev–Suslin and norm-residue theorems, and certificates of explicit K₂ computations (ArithmeticKTheory) are owned elsewhere; computational input enters only as explicit hypotheses.

## Conventions

Rings are associative and unital, and ring maps preserve 1; commutativity is assumed only where stated. Fields are commutative. Matrices act on column vectors; e_ij(a) = 1 + aE_ij for i ≠ j. Commutators are [x, y] = xyx⁻¹y⁻¹. The Steinberg group St_n(R) is defined for n ≥ 3 with generators x_ij(r) (i ≠ j) and the relations x_ij(r)x_ij(s) = x_ij(r + s), [x_ij(r), x_kl(s)] = 1 for j ≠ k, i ≠ l, [x_ij(r), x_jl(s)] = x_il(rs) for i ≠ l, and [x_ij(r), x_ki(s)] = x_kj(−sr) for j ≠ k; nothing is imposed on opposite roots. Finite-rank and stable statements are kept apart: centrality of ker(St_n(R) → E_n(R)) is never deduced from the stable theorem.

Group homology H_n(G; ℤ) has trivial integral coefficients and groups live in `Type`, as Mathlib's `groupHomology` requires. Group-valued kernels are written additively through `Additive` when they enter additive statements.

Steinberg symbols are {r, s} = [h_ij(r), h_ik(s)] with w_ij(r) = x_ij(r)x_ji(−r⁻¹)x_ij(r) and h_ij(r) = w_ij(r)w_ij(−1); the Milnor symbol {a, b} ∈ K₂ᴹ(F) is the class of a ⊗ b, and Matsumoto's map sends {a, b} to {a, b}. Milnor K-groups have integral coefficients: {a, a} = {a, −1} is 2-torsion but is not zero in general.

For a discrete valuation v with uniformiser π and residue field k, the tame symbol is ∂_v{f, g} = (−1)^{v(f)v(g)} · (f^{v(g)}/g^{v(f)})‾, the bar applied to a unit, so ∂_v{u, π} = ū and ∂_v{π, u} = ū⁻¹; this is the inverse of the K-book's Lemma III.6.3 symbol. Higher residues are read with Π on the right, ∂_v{u₁, …, u_{n−1}, π} = {ū₁, …, ū_{n−1}}, and equal (−1)^{n−1} times the residue of Weibel's Theorem III.7.3. The localization boundary of K-theory is normalised by B₁[π] = 1 and the right module rule; in degree two det ∘ B ∘ (Matsumoto, product-normalized comparison θ₂♮) is the inverse of the tame symbol (§11.8), and every comparison square states which sign it uses.

Norm-residue symbols use the arithmetic Frobenius normalisation of ClassFieldTheory; a primitive m-th root of unity is fixed only when a twist μ_m^{⊗j} is identified with ℤ/m, and the change-of-root rule is a target (§14.2). Sources are cited by theorem number and printed page; "Weibel" is the K-book (2013), whose printed page is the PDF page minus eight.

## Exact supplier contracts

### From Mathlib

`PresentedGroup`, `FreeGroup`, `IsFreeGroup`, `commutatorElement`, `Subgroup.center`, `Group.IsPerfect`, `Abelianization`, `MonoidHom.eqLocus` and `DirectLimit` with its group structure (`DirectLimit.lift`, `DirectLimit.map`, `DirectLimit.exists_eq_mk₂`, `DirectLimit.setoid`) supply the presentations, centres and colimits of Layers 1–3; the group colimit is used as a carrier and its finite-representative equality is part of §2.5. `GroupExtension` with `inl_conjAct_comm` supplies extensions. `groupHomology`, `groupHomology.H1`, `groupHomology.H2`, `groupHomology.map`, `groupHomology.chainsMap`, `groupHomology.inhomogeneousChains`, `groupHomology.H1AddEquivOfIsTrivial`, `groupHomologyIso`, `CategoryTheory.ProjectiveResolution`, `ShortComplex.ShortExact.δ` with `homology_exact₁`–`homology_exact₃` and `HomologicalComplex.HomologySequence.δ_naturality` supply the homological algebra of Layer 1; `CharacterModule` supplies the Pontryagin-dual argument of §1.20. `groupCohomology.H2` is the cohomology of the classification statement.

`Matrix.GeneralLinearGroup.transvection`, `Matrix.det_permutation` and `Matrix.diag2_decompose` supply matrix identities over commutative rings. `TensorAlgebra` with `TensorAlgebra.gradedAlgebra`, `TensorAlgebra.equivDirectSum` and `TensorAlgebra.lift`, `TensorProduct.lift`, `Submodule.liftQ`, `TwoSidedIdeal`, `RingCon.mk'`, `RingQuot`, `PiTensorProduct.isEmptyEquiv`, `PiTensorProduct.subsingletonEquiv` and `TensorPower.mulEquiv` supply the presentations of Layer 5. `Valuation`, `ValuationSubring.unitGroup`, `ValuationSubring.unitGroupToResidueFieldUnits` (surjective, with kernel the principal units), `IsLocalRing.residue`, `IsLocalRing.ResidueField.map`, `IsDiscreteValuationRing`, `HenselianRing`, `IsDedekindDomain.HeightOneSpectrum` with `Support.finite`, `NumberField.RingOfIntegers`, `NumberField.InfinitePlace`, `Algebra.norm` with `Algebra.norm_norm`, `Ideal.sum_ramification_inertia_eq_finrank`, `Polynomial.modByMonic`, `Polynomial.resultant_eq_prod_eval`, `spectralNorm` with `spectralNorm_unique`, `KaehlerDifferential`, `DualNumber`, `TrivSqZeroExt`, `rootsOfUnity`, `IsPrimitiveRoot` and `modularCyclotomicCharacter` supply the valuation, number-field and coefficient carriers of Layers 9–14. `HomotopyGroup` represents π_n.

### From Tau Ceti

`TauCeti.transvectionUnit` with `transvectionUnit_add`, `commute_transvectionUnit`, `commutatorElement_transvectionUnit` and `commutatorElement_transvectionUnit_reverse`, `TauCeti.diagGL`, `TauCeti.permutationGL` with `permutationGL_mul_diagGL_mul_inv`, `TauCeti.det_diagGL`, `Matrix.SpecialLinearGroup.diag2nUnit_decompose`, `TauCeti.upperUnitriangularGroup` with `UpperUnitriangularGroup.ext` and `UpperTriangularGroup.mem_diagonalTorus_of_mem` supply the matrix calculus over commutative rings. `TauCeti.GroupExtension.InducesAction`, `TauCeti.GroupExtension.conjAct_eq_one_of_le_center`, `TauCeti.FactorSet` with `inl_range_le_center`, `groupExtension`, `exists_cohomologyClass_eq`, `nonempty_splitting_iff_cohomologyClass_eq_zero` and `TauCeti.GroupExtension.nonempty_equiv_iff_cohomologyClass_factorSet_eq` supply factor sets and the classification of extensions with a fixed action.

`Valuation.ord` with `ord_mul`, `ord_zpow`, `ord_add_eq_min_of_ord_ne`, `isUnit_iff_ord_eq_zero`, `mem_maximalIdeal_iff_ord_pos`, `mem_valuationSubring_iff_ord_nonneg`, `valuation_eq_exp_neg_ord`, `exists_eq_zpow_mul_unit_of_surjective`, `exists_isUniformizer_of_surjective`, `isUniformizer_iff_ord_eq_one_of_surjective` and `nontrivial_valueGroup_of_surjective` supply orders and unit parts; `TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem` supplies roots of principal units. `TauCeti.Place` with `degree`, `restrict`, `normResidue`, `residueUnit`, `ratFuncEquiv`, `heightOneSpectrumEquiv`, `adicOfIrreducibleResidueFieldEquiv`, `inftyResidueFieldEquiv`, `ord_infty`, `isUniformizer_infty`, `finite_setOf_ord_ne_zero` and `sum_ramificationIdx_mul_relativeDegree_eq_finrank_of_isSeparable`, together with `TauCeti.Divisor.principal`, `Divisor.eval` and `Divisor.eval_eq_prod_normResidue`, supply places of function fields and divisor evaluation; `IsDedekindDomain.integerHeightOneSpectrumEquiv` and `WeierstrassCurve.Affine.isFunctionField` supply the integer and elliptic cases. `TauCeti.KummerCoeff`, `TauCeti.kummerMap` with `ker_kummerMap`, `kummerMap_eq_one_iff` and `kummerMap_eq_kummerCocycleClass`, and `TauCeti.ContCohomology.explicitCup11` with `explicitCup11_eq_neg_flip` supply Kummer classes and their cup product. `HomotopyGroup.mapHom`, `HomotopyGroup.mulEquivOfHomotopyEquiv` and `TauCeti.homotopyGroupTransport_map` supply based maps on homotopy groups. In the current library, newer than the pin, `NumberTheory/LocalField/UnitsDecomposition` gives the splitting of the units of a local field and `RingTheory/Norm/Quotient` gives the reduction of determinant norms.

### From the companion package GeneralAlgebraicKTheory

§3.2 the functorial K-theory space K(R) of a unital ring, with filtered continuity; §3.12 the plus = Q theorem; §3.14 the degree-zero and degree-one comparisons; §4.6, §4.8, §4.14 resolution, dévissage and the localization theorem for a Serre subcategory; §7.4 the biexact product and §7.7 transfers with the projection formula (§7.8 finite-field base change); §8.1 relative K-theory as a homotopy fibre; §§8.11–8.13 the degree-one index, the DVR boundary as the normalised valuation and the transport of the right product action through the localization boundary.

### From the companion package StableHomotopyKTheory

§1.30 BG is a K(G, 1) and §1.32 the bar construction; §2.2, §2.7, §2.8 homotopy fibres, their connecting map and long exact sequence; §3.12 the plus construction is a homology isomorphism, §3.15 connected H-spaces are abelian, §3.27 and §3.28 uniqueness and functoriality of plus constructions, §3.30 π₂ of a plus construction and universal central extensions (`plusConstruction.pi2Equiv`), §3.31 its naturality, §3.32 BP⁺ is the universal cover of BG⁺; §4.14 the block-sum H-space structure on BGL(R)⁺.

### From KTheoryLowDegrees

§6.1 StableGL with finite-stage injectivity and equality after common stabilisation; §6.2 the finite and stable elementary groups, the two chaining commutator identities over an associative ring, perfectness and normality of E(R), E(R) = [GL(R), GL(R)] and the trivial centralizer of E(R) in GL(R); §7.1 K₁(R) = GL(R)/E(R); §8.1 the determinant splitting, units → K₁ and SK₁ of a field; §13.1 K₁(R) ≅ π₁(BGL(R)⁺); §§13.3–13.5 the congruence-loop and double comparisons in degrees zero and one; Layers 10–11 Mennicke symbols.

### From MotivicEtaleKTheory

M.1: finite Tate twists μ_m^{⊗j}, étale cohomology of a field and of S-integers as Galois cohomology, étale Kummer sequences, the étale localization sequence of a Dedekind scheme; M.2: the degree-two comparison of localization sequences; M.3: the Galois symbol h_F with its cohomological Steinberg relation and residue compatibility, and Tate's theorems for local fields, global fields and rings of S-integers; M.8: the finite étale Chern maps.

### From other TauCetiRoadmap roadmaps

ClassicalArithmeticCompletion Layer 1 (§1.1 units modulo 2^k, §1.14 and §1.15 local norm-residue symbols, §1.24 the symbol at a place, §1.25 its relations, §1.52 Hilbert's product formula of degree n); ClassFieldTheory Layers 4–6, 10 and 14 (`localSymbol`, `kummerCupPairing`, the local invariant, `h2MuToBr`, the Brauer sequence, `hilbertProductFormula`); QuadraticFormInvariants 6C, 6E, 7B; ProfiniteCohomology Layers 6, 8, 9; AlgebraicCurves Layers 2 and 12; EllipticCurves Layer 2; LocalFieldsRamification Layers 0 and 1; ReductiveGroups Layer 7; RepresentationTheory/RootSystems Layer 3; AlgebraicTopology Stages 5 and 8.

## How to read the build

Layer 1 is pure group theory: central extensions, Hopf's formula through a constructed five-term sequence, and the recognition theorem for universal central extensions. Layer 2 builds the Steinberg groups, classical K₂ and Steinberg's centre theorem; Layer 3 proves that St(R) is the universal central extension of E(R), so K₂(R) ≅ H₂(E(R)); Layer 4 identifies classical K₂ with π₂ of the plus construction and with Quillen's K₂. Layers 5–7 treat fields: Milnor K-theory and Steinberg pairings (Layer 5), Steinberg symbols and Milnor's monomial-kernel theorem, which gives generation by symbols and K₂(𝔽_q) = 0 (Layer 6), and the completeness half of Matsumoto's theorem by Matsumoto's permutation construction (Layer 7). Layer 8 compares Milnor symbols with Quillen products. Layers 9–11 develop residues: tame symbols and Serre's residue algebra (Layer 9), the Bass–Tate sequence, Milnor norms, Kato's theorem Suslin reciprocity and the high-degree global-field computations (Layer 10), and the comparison with the localization boundary and transfers (Layer 11). Layer 12 computes tame kernels and K₂(ℤ), K₂(ℚ). Layer 13 treats rings that are not fields through Dennis–Stein symbols and relative K₂. Layer 14 relates symbols to Hilbert symbols, cyclic algebras and the Galois symbol.

## Layer 1: central extensions, Hopf’s formula and the recognition theorem

Central extensions of discrete groups, the integral five-term sequence of a group quotient constructed from Mathlib's bar complexes, Hopf's formula with its naturality, and universal central extensions with the recognition theorem: for a perfect group G and a central extension p : X → G, p is universal if and only if X is perfect and all its central extensions split, if and only if X is superperfect, and the kernel of the universal central extension is H₂(G; ℤ). Everything here is group theory over Mathlib's `groupHomology` and Tau Ceti's factor sets; no ring appears.

### 1.1 Central extensions and their morphisms

A central extension of G by an abelian group A is a GroupExtension A G whose included kernel lies in the centre of the total group. It is split if it admits a section, equivalently if it is equivalent, with identity on A and G, to the product extension. Equivalence retains the kernel and quotient identifications. (Weibel, III.5.3, p. 218.)

`Suggested.lean` declares `IsCentralExtension` for a surjective homomorphism with central kernel.

G is a group; A is an abelian group.

Provide the following API.

- `IsCentralExtension`: The predicate that an extension is central.
- `CentralExtension.split`: Splitness.
- `CentralExtension.Equiv`: Equivalence of two extensions of G by A.
- `CentralExtension.product`: The inclusion A -> A x G and projection A x G -> G form a split central extension.
- `CentralExtension.section_equiv`: A homomorphic section gives an extension equivalence to A x G, with formula (a,g) -> inl(a)*section(g).

**Checks.**

- For A=C2 and G=C2, the product projection is central and split.
- For nontrivial G, the constant homomorphism G→G has central kernel only when G is abelian, and even then it is not a central extension: it is not surjective. In particular C2→C2 with constant value 1 fails the definition.
- The quotient C4 -> C2 modulo two is central but has no homomorphic section.
- For C9 -> C3 modulo three, kernel inclusions C3 -> C9 given by 1 -> 3 and 1 -> 6 give inequivalent extensions although both total groups are C9: a map over C3 has multiplier 1 mod 3, whereas preserving these marked kernels would require multiplier 2 mod 3.

*Needs:* Mathlib `GroupExtension`; Tau Ceti `TauCeti.FactorSet.inl_range_le_center`; Mathlib `Subgroup.center`.

**Morphisms of central extensions.** For central extensions p:X->G and q:Y->G define a morphism over G to be a homomorphism h:X->Y with q composed with h equal to p. Such morphisms do not require a fixed map of chosen kernel groups. (Weibel, III.5.3.1, p. 219.)

G is a group; A is an abelian group.

Provide the following API.

- `HomOver.mk`: A homomorphism and proof of the projection square give a morphism.
- `HomOver.ext`: Equality of underlying homomorphisms implies equality of morphisms.
- `HomOver.id_comp`: Identity and composition retain the projection square; unit and associativity laws hold.

*Checks.*

- The identity on A x G lies over the product projection.
- g -> (1,g) is a morphism from id:G->G to the split projection A x G->G.
- For nontrivial G, the constant homomorphism G->A x G is not over id:G->G.

**Centrality and a specified trivial coefficient action.** Let S be a marked extension 1 → A → E → G → 1, with A commutative. Fix a multiplicative distributive G-action on A and assume g • a = a for every g,a. Then the range of S.inl lies in the centre of E if and only if TauCeti.GroupExtension.InducesAction S holds. The additional assertion here is the converse from InducesAction with a specified trivial action to centrality; the central-to-trivial-action constructor is supplied by Tau Ceti. The criterion concerns the actual conjugation action of S. (Löh, Definition 1.5.6 and Remark 1.5.7, pp.32–33.)

G and E are groups and A is a commutative group. S is the actual GroupExtension A E G. The specified ambient G-action on A is trivial, for every g,a.

*Checks.*

- The product extension A × G → G satisfies the criterion for the trivial action.
- The nonsplit central extension C4 → C2 satisfies the criterion too; trivial induced action does not imply splitting.
- For C3 ↪ S3 → C2, conjugation inverts C3. With an ambient trivial action the extension fails InducesAction and fails centrality.

*Needs:* Mathlib `GroupExtension`; Mathlib `GroupExtension.inl_conjAct_comm`; Mathlib `Subgroup.mem_center_iff`; Tau Ceti `TauCeti.GroupExtension.InducesAction`; Tau Ceti `TauCeti.GroupExtension.conjAct_eq_one_of_le_center`.

### 1.2 Pulling a central extension back along a homomorphism

Let q : Y → G be a surjective homomorphism whose kernel lies in the centre of Y, and let f : H → G be any homomorphism. The pullback P = {(h, y) ∈ H × Y : f(h) = q(y)} is a subgroup of H × Y, and its first projection pr_H : P → H is a central extension of H: it is surjective, and its kernel {(1, y) : y ∈ ker q} is central in P and isomorphic to ker q. The second projection pr_Y : P → Y satisfies q ∘ pr_Y = f ∘ pr_H, and a pair of homomorphisms a : X → H, b : X → Y with f ∘ a = q ∘ b factors uniquely through P. (Weibel, III.5.4, equivalent conditions and proof, p. 220.)

G, H and Y are groups; q : Y → G is surjective and ker q is contained in the centre of Y; f : H → G is a homomorphism.

Provide the following API.

- `CentralExtension.pullback`: The subgroup P = {(h, y) : f(h) = q(y)} of H × Y, for q : Y → G central and surjective and f : H → G.
- `CentralExtension.pullbackFst`: pr_H : P → H; it is surjective and its kernel is central.
- `CentralExtension.pullbackSnd`: pr_Y : P → Y, with q ∘ pr_Y = f ∘ pr_H.
- `CentralExtension.pullbackLift`: For a : X → H and b : X → Y with f ∘ a = q ∘ b, the unique homomorphism X → P with pr_H ∘ lift = a and pr_Y ∘ lift = b.
- `CentralExtension.pullbackKerEquiv`: ker pr_H ≅ ker q, by y ↦ (1, y).
- `CentralExtension.pullbackId`: Along the identity of G the pullback is isomorphic to Y over G, by y ↦ (q(y), y).

**Checks.**

- For f = id_G, y ↦ (q(y), y) is an isomorphism from Y onto P commuting with the projections to G.
- For q : C_4 → C_2 reduction modulo two and f the inclusion of the trivial group, P ≅ C_2 and pr_H : C_2 → 1.
- The pullback of the product projection A × G → G along f : H → G is isomorphic over H to the product projection A × H → H.
- For q the sign map S_3 → C_2, whose kernel A_3 is not central, and f = id, the kernel of pr_H is not central in P ≅ S_3: the centrality hypothesis is used.

*Needs:* §1.1; Mathlib `MonoidHom.eqLocus`; Mathlib `MonoidHom.ker`; Mathlib `Subgroup.center`.

### 1.3 Composite of central extensions with perfect middle term

Let ρ : Y → X and π : X → G be surjective homomorphisms whose kernels are central in Y and in X. If X is perfect, then πρ : Y → G is surjective with central kernel. (Weibel, Exercise III.5.7, p. 229.)

ker ρ is contained in the centre of Y and ker π in the centre of X; ρ and π are surjective. X is perfect.

**Checks.**

- Non-example without perfectness: D_8 → D_8/Z(D_8) ≅ (Z/2)² and (Z/2)² → Z/2 are central extensions, but the composite has kernel {1, r², s, sr²}, which contains the non-central reflection s.
- With X a universal central extension (perfect by Lemma III.5.3.2) this is the first sentence of Exercise III.5.7 as the Recognition Theorem uses it.

*Needs:* §1.1; Mathlib `Subgroup.center`; Mathlib `Group.IsPerfect`.

### 1.4 Rigidity over a central quotient

If p:X->G is surjective and X is perfect, and q:Y->G has central kernel, any two homomorphisms h,k:X->Y with qh=p=qk are equal. (Weibel, III.5.3.3, p. 219.)

G is a group; X and Y are central extensions of G.

*Needs:* §1.1; Mathlib `Group.IsPerfect`.

### 1.5 The central extension from relators

For any group E and normal subgroup N, the projection E/[N,E]→E/N is a central extension with kernel N/[N,E]. The earlier free-presentation case is a specialization; freeness is not used in this construction. (Weibel, III.5.3.4, p. 219.)

E is an arbitrary discrete group and N normal in E; no freeness hypothesis.

Provide the following API.

- `relatorProjection`: The induced quotient projection E/[N,E]→E/N for any normal N in E.
- `relatorProjection_kernel`: Its kernel is canonically N/[N,E] and lies in the centre.
- `relatorProjection_map`: A map of presentations preserving relators induces a commuting map of extensions.

**Checks.**

- If S=1, the extension is the identity F->F and its kernel is trivial.
- If F=Z and S=mZ with m>=2, the extension is Z->Z/m with kernel mZ, which is nontrivial.
- For Free(a,b)->Z killing b, the relation kernel is nonzero, detected by the b-exponent sum.

*Needs:* §1.1.

### 1.6 Restricting the relator extension to commutators

The restriction [F,F]/[S,F] -> [G,G] is a central extension with kernel (S intersect [F,F])/[S,F]. If G is perfect its quotient is G. (Weibel, III.5.3.5, p. 219.)

G is a group presented as a quotient of a free group F by a normal subgroup S.

Provide the following API.

- `commutatorProjection`: The restricted quotient homomorphism onto [G,G].
- `commutatorProjection_kernel`: Its kernel is the intersection quotient.
- `commutatorProjection_perfect`: For perfect G the quotient [G,G] identifies with G, preserving the projection.

**Checks.**

- For S=1 the map [F,F]->[F,F] is the identity, with trivial kernel.
- For F=Z, S=mZ, its source and target commutator groups are trivial even though the larger relation kernel is mZ.
- For G=Z^2 presented by F(a,b) with S=[F,F], the quotient target is trivial and the kernel [F,F]/[[F,F],F] is nontrivial; detect [a,b] in the integral Heisenberg quotient.

*Needs:* §1.5; Mathlib `Group.IsPerfect`.

### 1.7 Perfectness through first homology

Prove H_1(G, ℤ) = 0 if and only if G is perfect, using the supplied first-homology equivalence and TensorProduct.rid. This criterion concerns vanishing, rather than constructing the existing equivalence or its naturality. (Löh, Corollary 1.4.6 (p. 23); Löh, Theorem 1.4.1 (p. 20).)

G is a group in Type; Z carries the trivial action (Rep.trivial ℤ G ℤ).

**Checks.**

- H_1(Z/2, Z) ≅ Z/2 ≠ 0, and Z/2 is not perfect.
- H_1(A_5, Z) = 0 because A_5 is perfect.
- The identification uses the trivial action: with a nontrivial coefficient module H_1 is not the abelianisation.

*Needs:* Mathlib `groupHomology.H1`; Mathlib `groupHomology.H1AddEquivOfIsTrivial`; Mathlib `groupHomology.map`; Mathlib `groupHomology.H1π_comp_map`; Mathlib `Rep.trivial`; Mathlib `TensorProduct.rid`; Mathlib `Abelianization`; Mathlib `Abelianization.map`; Mathlib `Group.IsPerfect`; Mathlib `Group.isPerfect_def`.

### 1.8 Superperfect groups

A group G in Type is superperfect if H_1(G, Z) = 0 and H_2(G, Z) = 0, where H_n(G, Z) = groupHomology (Rep.trivial ℤ G ℤ) n is Mathlib's integral group homology with trivial coefficients. Equivalently (§1.7), G is perfect and H_2(G, Z) = 0. This is condition (3) of the Recognition Theorem. (Weibel, III.5.4, equivalent conditions and proof, p. 220.)

`Suggested.lean` declares `IsSuperperfect` and states `IsSuperperfect.isPerfect`.

G is a group in Type: Mathlib's group homology over ℤ puts the group in the universe of ℤ.

Provide the following API.

- `IsSuperperfect`: The predicate H_1(G, Z) = 0 ∧ H_2(G, Z) = 0 for a group G in Type, with trivial integral coefficients.
- `isSuperperfect_iff`: IsSuperperfect G ↔ Group.IsPerfect G ∧ H_2(G, Z) = 0.
- `IsSuperperfect.isPerfect`: A superperfect group is perfect in Mathlib's sense (Group.IsPerfect).
- `IsSuperperfect.of_mulEquiv`: Superperfectness is invariant under group isomorphisms.
- `IsSuperperfect.of_subsingleton`: The trivial group is superperfect.

**Checks.**

- The trivial group is superperfect.
- Z/2 is not superperfect: H_1(Z/2, Z) ≅ Z/2.
- The free group on one generator is not superperfect although its H_2 vanishes (§1.9): a definition asking only for H_2 = 0 fails this test.
- A_5 is perfect but not superperfect (H_2(A_5, Z) ≅ Z/2): a definition asking only for perfectness fails this test.
- For every group G in Type, IsSuperperfect G ↔ Group.IsPerfect G ∧ H_2(G, Z) = 0.

*Needs:* §1.7; Mathlib `groupHomology`; Mathlib `Rep.trivial`; Mathlib `groupHomology.H1`; Mathlib `groupHomology.H2`; Mathlib `groupHomology.mapIso`; Mathlib `Group.IsPerfect`.

### 1.9 Integral homology of a free group vanishes above degree one

Let F be a free group in Type (IsFreeGroup F; for example FreeGroup S). Then H_k(F, Z) = 0 for every k ≥ 2, with trivial integral coefficients, and H_1(F, Z) is free abelian on a basis of F. (Löh, Corollary 1.6.23 with Proposition 1.6.21 (pp. 56-57).)

F is a group in Type with IsFreeGroup F.

**Checks.**

- H_2(Z, Z) = 0 for the free group of rank one.
- H_1 of the free group on two generators is Z².
- With Nielsen-Schreier (subgroupIsFreeOfIsFree) the lemma applies to every subgroup of a free group, as Hopf's formula needs for the relator subgroup.

*Needs:* Mathlib `groupHomology`; Mathlib `groupHomologyIso`; Mathlib `CategoryTheory.ProjectiveResolution`; Mathlib `Rep.trivial`; Mathlib `FreeGroup`; Mathlib `IsFreeGroup`; Mathlib `groupHomology.mapIso`.

### 1.10 The kernel complex of a surjective group map

For a surjection q:E→Q of discrete groups, let C_*(E) and C_*(Q) be the inhomogeneous bar complexes with trivial integral coefficients, and L(q)=ker(chainsMap(q,id)). It sits in a short exact sequence 0→L(q)→C_*(E)→C_*(Q)→0. In degree n, L(q) is the kernel of the free-abelian pushforward on E^n→Q^n, generated by [a]−[b] with q^n(a)=q^n(b). In degree0 the map is identity on Z, so L(q)_0=0. (Löh, Theorem 3.2.12, Proposition 3.2.13 and Remark 3.2.14, pp.123–125.)

Groups are in Type at the same universe as Z, as required by the groupHomology interface. Surjectivity of q is required for the degreewise short exactness. Coefficients are specifically trivial Z; no arbitrary-coefficient Hochschild–Serre statement is made here.

Provide the following API.

- `GroupQuotient.barKernel`: The kernel chain complex L(q), using trivial integral bar chains.
- `GroupQuotient.barKernelShortComplex`: The kernel/inclusion/pushforward short complex of chain complexes.
- `GroupQuotient.barKernelShortExact`: It is short exact when q is surjective.
- `GroupQuotient.barKernel_zero`: The degree-zero object is zero.
- `GroupQuotient.barKernel_pairGenerators`: Degree-n kernels are generated by differences of tuples with equal quotient images.
- `GroupQuotient.barKernel_map`: A commuting square of quotient maps induces the canonical kernel chain map.

**Checks.**

- For q=id_E the kernel complex is zero in every degree.
- For every surjective q, L(q)_0=0.
- [a]−[b] belongs to L(q)_n exactly when the two tuple images agree.
- For 1→C₂ the degree-one bar pushforward misses the nonidentity basis element.

*Needs:* Mathlib `groupHomology.inhomogeneousChains`; Mathlib `groupHomology.chainsMap`; Mathlib `groupHomology.chainsMap_f_map_epi`; Mathlib `groupHomology.chainsMap_f_single`; Mathlib `groupHomology.chainsMap_comp`; Mathlib `HomologicalComplex.eval_preservesLimit_of_hasKernel_f`; Mathlib `Rep.trivial`.

### 1.11 First homology of the quotient bar kernel

With N=ker(q), there is a canonical isomorphism H₁(L(q))≅N/[E,N], written additively. It sends the cycle [a]−[b] with q(a)=q(b) to the class of ab⁻¹. The inverse sends n to the homology class of [n]−[1]. Under this isomorphism the map H₁(L(q))→H₁(E,Z)=E_ab is the inclusion-induced map N/[E,N]→E_ab. (Löh, Theorem 3.2.12, Proposition 3.2.13 and Remark 3.2.14, pp.123–125.)

Use the unnormalised bar differential ∂[a|b]=[b]−[ab]+[a]; no silent normalized-bar replacement. The quotient N/[E,N] is the central abelian kernel of §1.5; trivial coefficients make ∂₁ zero.

**Checks.**

- The quotient is by mixed commutators [E,N], not only [N,N].
- The sign is fixed by [a]−[b]↦ab⁻¹ and the positive boundary ∂[a|b].
- For S₃→C₂, conjugation inverts N=C₃ and its mixed-commutator quotient is zero; abelianising N alone would incorrectly give C₃.

*Needs:* §1.5; §1.7; §1.10; Mathlib `groupHomology.d₂₁_single`; Mathlib `groupHomology.d₁₀_eq_zero_of_isTrivial`; Mathlib `groupHomology.H1AddEquivOfIsTrivial`; Mathlib `groupHomology.H1π_comp_map`.

### 1.12 The integral five-term sequence of a group quotient

For surjective q:E→Q with N=ker(q), construct the exact sequence H₂(E,Z)→H₂(Q,Z)→ N/[E,N]→E_ab→Q_ab→0. The outside homology maps are the groupHomology.map with identity integral coefficients; the middle map is the connecting map of the quotient-bar kernel short exact sequence followed by §1.11. This is the trivial-integral-coefficient low-degree Hochschild–Serre input, constructed before plus constructions or spectra. (Löh, Theorem 3.2.12, Proposition 3.2.13 and Remark 3.2.14, pp.123–125.)

Use the specified actual bar kernel and its fixed H₁ isomorphism; no arbitrary carrier isomorphism is substituted. No claim is made here to construct the full Hochschild–Serre spectral sequence or its arbitrary-coefficient version.

Provide the following API.

- `GroupQuotient.transgression`: The specified map H₂(Q,Z)→N/[E,N] from the bar-kernel connecting map.
- `GroupQuotient.transgression_lift`: On a 2-cycle it is the relative class of the positive boundary of any lift.
- `GroupQuotient.fiveTerm_exact`: Exactness at H₂(Q,Z), N/[E,N] and E_ab, and surjectivity onto Q_ab. No exactness at the first term H₂(E,Z) is asserted without a preceding term.
- `GroupQuotient.fiveTerm_maps`: The H₂ maps and abelianisation maps are the homology maps of q and inclusion.

**Checks.**

- For q=id the outside maps are identity and the middle quotient is zero.
- For C₄→C₂ the middle quotient C₂ maps to C₄ by the element2, and the final map is reductionmod2.
- For S₃→C₂, N/[E,N]=0 although N_ab=C₃.
- Let E be the upper-unitriangular 3-by-3 matrix group over F_3, written as triples with (x,y,z)(x′,y′,z′)=(x+x′,y+y′,z+z′+xy′), and let q:E→F_3² forget z. For a=(1,0,0), b=(0,1,0), the quotient bar cycle [q(a)|q(b)]−[q(b)|q(a)] has positive transgression 2 under the specified central-coordinate identification N/[E,N]≅F_3. Indeed the lifted boundary is [ba]−[ab], whose image ba(ab)⁻¹=(0,0,2). The opposite sign gives 1 and fails this test. 

*Needs:* §1.7; §1.10; §1.11; Mathlib `CategoryTheory.ShortComplex.ShortExact.δ`; Mathlib `CategoryTheory.ShortComplex.ShortExact.δ_apply`; Mathlib `CategoryTheory.ShortComplex.ShortExact.homology_exact₁`; Mathlib `CategoryTheory.ShortComplex.ShortExact.homology_exact₂`; Mathlib `CategoryTheory.ShortComplex.ShortExact.homology_exact₃`; Mathlib `groupHomology.map`.

### 1.13 Naturality of the integral quotient five-term sequence

A commuting square of surjections q:E→Q and q′:E′→Q′ with maps a:E→E′, b:Q→Q′ induces a commuting diagram of the integral five-term sequences. On H₂ it is groupHomology.map(a,id,2) and groupHomology.map(b,id,2); on N/[E,N] it sends class(n) to class(a(n)); every connecting square commutes with the fixed positive sign. (Löh, Theorem 3.2.12, Proposition 3.2.13 and Remark 3.2.14, pp.123–125.)

The kernel inclusion a(N)⊂N′ follows from q′a=bq. Use actual chain maps and the canonical quotient isomorphism; no choice of free lift enters b’s H₂ map.

**Checks.**

- For identity and composite quotient-square maps the induced sequence maps are identity and composite.
- Different middle lifts inducing the same b have the same H₂(Q) map and hence the same induced map of Hopf kernels.

*Needs:* §1.11; §1.12; Mathlib `groupHomology.chainsMap_comp`; Mathlib `groupHomology.map`; Mathlib `groupHomology.H1π_comp_map`; Mathlib `HomologicalComplex.HomologySequence.δ_naturality`.

### 1.14 Hopf's four-term exact sequence

Let F be a free group in Type, N a normal subgroup and G = F/N. There is an exact sequence 0 → H_2(G, Z) → N/[F, N] → F/[F, F] → G_ab → 0 of abelian groups, in which N/[F, N] → F/[F, F] is induced by the inclusion N ⊆ F and F/[F, F] → G_ab by the projection. (Löh, Theorem 3.2.18 (p. 129); Löh, Proof of Theorem 3.2.18 (pp. 130-131).)

F is a free group in Type; N is normal in F; G = F/N; homology has trivial integral coefficients.

**Checks.**

- For N = 1 the sequence reads 0 → H_2(F, Z) → 0 → F_ab → F_ab → 0, consistent with H_2(F, Z) = 0.
- For F free on a and N generated by a^m (G = Z/m): N/[F, N] = N ≅ mZ maps injectively to F_ab = Z, so H_2(Z/m, Z) = 0 and G_ab = Z/m.
- Exactness at N/[F, N] identifies H_2(G, Z) with (N ∩ [F, F])/[F, N], which is Hopf's formula.

*Needs:* §1.7; §1.9; §1.12; Mathlib `groupHomology.H1CoresCoinfOfTrivial_exact`; Mathlib `groupHomology.H1CoresCoinfOfTrivial_g_epi`; Mathlib `groupHomology.H2`; Mathlib `Rep.trivial`.

### 1.15 The Hopf formula and the two extensions attached to a presentation

For a presentation G = F/S with F free and S normal, H_2(G; Z) is isomorphic to (S ∩ [F, F])/[S, F], the kernel of the commutator extension [F, F]/[S, F] → [G, G]; its naturality in the presentation is §1.16. The coefficients are the trivial integral representation, and G is a group in Type. (Weibel, III.5.3.4 and III.5.3.5, p. 219; Löh, Theorem 3.2.18 (p. 129).)

G is a group presented as a quotient of a free group F by a normal subgroup S.

**Checks.**

- H_2 of a free group is zero, for any presentation.
- The larger relation-module kernel S/[S, F] need not vanish for a free quotient G. Example F = Free(a, b), G = Z, a ↦ 1 and b ↦ 0: the class of b survives, detected by the b-exponent sum.
- For perfect G the restricted commutator extension has quotient G, and its kernel is H_2(G; Z) (§1.23).

*Needs:* §1.1; §1.5; §1.6; §1.14; Mathlib `groupHomology.H2`; Mathlib `groupHomology`; Mathlib `Rep.trivial`.

### 1.16 Naturality of Hopf's formula

Let π : F → G and π' : F' → G' be surjections from free groups in Type with kernels R and R', f : G → G' a homomorphism and φ : F → F' a homomorphism with π' ∘ φ = f ∘ π. Then φ(R) ⊆ R', φ induces a homomorphism (R ∩ [F, F])/[R, F] → (R' ∩ [F', F'])/[R', F'], and under the Hopf isomorphisms of §1.15 this homomorphism is H_2(f; Z) = groupHomology.map f (id) 2. In particular it does not depend on φ, and for f = id the Hopf isomorphisms of two presentations of G agree. (Weibel, III.5.3.4, p. 219; Löh, Proof of Theorem 3.2.18 (p. 131).)

F, F' are free groups in Type; π, π' are surjective with kernels R, R'; π' ∘ φ = f ∘ π; homology has trivial integral coefficients.

**Checks.**

- For G' = G, F' = F and φ = id the induced map is the identity.
- Different lifts can differ on the larger relation module: for F free on a, b → Z (a ↦ 1, b ↦ 0) the lifts id and b ↦ b² of the identity differ on the class of b in R/[R, F] (b-exponent sums 1 and 2), but they agree on the Hopf quotient, which is zero here since H_2(Z, Z) = 0.
- It makes the kernel identification of §1.23 independent of the presentation.

*Needs:* §1.5; §1.6; §1.13; §1.14; §1.15; Mathlib `groupHomology.map`; Mathlib `Rep.trivial`.

### 1.17 Universal central extensions

A universal central extension of G is a central extension from which there is a unique homomorphism over G to every other central extension of G. It is unique up to isomorphism over G when it exists. (Weibel, III.5.3.1, p. 219.)

`Suggested.lean` declares `IsUniversalCentralExtension`.

G is a group.

Provide the following API.

- `IsUniversalCentralExtension`: The universal property.
- `uce_unique`: Uniqueness up to isomorphism over G.
- `uce_hom`: The unique homomorphism to any central extension.
- `uce_hom_unique`: Its uniqueness.
- `UCE.equiv_over`: Two universal central extensions of G have a unique equivalence commuting with their projections.

**Checks.**

- The identity extension of the trivial group is universal: its unique map to any group is over the trivial quotient.
- The identity C2 -> C2 is not universal; it has two different lifts to C2 x C2 -> C2, given by the zero and identity first coordinates.
- For a universal extension X -> G and abelian A, its map to A x G -> G is (1,p(x)); perfectness forces every map X -> A to be trivial.

*Needs:* §1.1.

### 1.18 A universal central extension forces perfectness, and rigidity of maps out of a perfect extension

If p:X->G is a universal central extension, both X and G are perfect. (Weibel, III.5.3.2, p. 219.)

`Suggested.lean` states the first assertion as `IsUniversalCentralExtension.isPerfect`.

G is a group; X and Y are central extensions of G.

**Checks.**

- The two statements are what make the Recognition Theorem's proof work and are used separately.
- A perfect group can still have several central extensions; uniqueness is of the map, not of the extension.
- The first statement is the obstruction: a non-perfect group has no universal central extension at all.

*Needs:* §1.17; Mathlib `Group.IsPerfect`.

### 1.19 Central extensions of a universal central extension split

If p : X → G is a universal central extension, then every central extension ρ : Y → X (ρ surjective with central kernel, Y in the universe of X) has a homomorphic section s : X → Y with ρ ∘ s = id_X. (Weibel, Exercise III.5.7, p. 229.)

p : X → G is a universal central extension. ρ : Y → X is surjective and ker ρ lies in the centre of Y.

**Checks.**

- For X = G trivial, every central extension A → 1 is split by the trivial homomorphism.
- Universality cannot be dropped: id : C_2 → C_2 is a central extension, and the central extension C_4 → C_2 of its source does not split.

*Needs:* §1.1; §1.3; §1.17; §1.18.

### 1.20 Split central extensions force vanishing Schur multiplier

Let G be a group in Type. If every central extension of G by the circle group T = Q/Z (AddCircle (1 : ℚ), written multiplicatively, with trivial G-action) splits, then H_2(G, Z) = 0, integral homology with trivial coefficients. More precisely, the evaluation map H²(G; T) → Hom(H_2(G, Z), T) is surjective, and H²(G; T) = 0 under the hypothesis. (Weibel, III.5.3, p. 219; Weibel, III.5.4, equivalent conditions and proof, p. 220.)

G is a group in Type (Mathlib's integral group homology and the Tau Ceti factor-set classification are stated there); T carries the trivial G-action.

**Checks.**

- For the standard Schur cover SL₂(𝔽₅) → A₅ with kernel C₂ = H₂(A₅, ℤ), push out the kernel along C₂ → ℚ/ℤ, 1 ↦ 1/2 mod ℤ. This is the central extension by ℚ/ℤ whose evaluation is the nonzero character and hence cannot split. The original C₂-extension itself does not have the coefficient group of this lemma.
- The lemma is Recognition (2) ⇒ (3) in degree two; it uses only extensions by Q/Z, not all central extensions.

*Needs:* §1.1; Mathlib `groupHomology.H2`; Mathlib `Rep.trivial`; Mathlib `groupCohomology.H2`; Mathlib `groupHomology.inhomogeneousChains`; Mathlib `groupHomology.d₃₂`; Mathlib `AddCircle`; Mathlib `CharacterModule`; Mathlib `CharacterModule.dual_surjective_of_injective`; Mathlib `CharacterModule.eq_zero_of_character_apply`; Tau Ceti `TauCeti.FactorSet.exists_cohomologyClass_eq`; Tau Ceti `TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero`; Tau Ceti `TauCeti.FactorSet.groupExtension`.

### 1.21 The Hopf extension of a perfect group is perfect

Let π : F → G be a surjective homomorphism with kernel R. If G is perfect, then F = [F, F]·R and [F, F] = [[F, F], [F, F]]·[R, F]; hence [F, F]/[R, F] is a perfect group. (Weibel, III.5.4, equivalent conditions and proof, p. 220.)

F is a group and π : F → G is surjective with kernel R (F need not be free). G is perfect.

**Checks.**

- For F free on one generator and R = F (G trivial), [F, F]/[R, F] is trivial, hence perfect.
- Perfectness of G is needed: for F free on a, b and R = [F, F] (G = Z²), [F, F]/[[F, F], F] is a nontrivial abelian group, detected by [a, b] in the integral Heisenberg quotient, so it is not perfect.

*Needs:* §1.6; Mathlib `Group.IsPerfect`; Mathlib `commutator`; Mathlib `Subgroup.map_commutator`.

### 1.22 Every perfect group has a universal central extension

Let G be a perfect group and π : F → G a surjection from a free group F = FreeGroup S, with kernel R. The restricted projection [F, F]/[R, F] → G (§1.6, whose target [G, G] is G) is a universal central extension of G. In particular every perfect group G has a universal central extension in its own universe, from the canonical presentation FreeGroup G → G. (Weibel, III.5.4, statement, p. 219; Weibel, III.5.4, equivalent conditions and proof, p. 220.)

`Suggested.lean` states the existence as `exists_isUniversalCentralExtension`.

G is perfect. π : FreeGroup S → G is surjective with kernel R.

**Checks.**

- For G trivial and S empty the universal central extension is the trivial group.
- Its kernel is the Hopf quotient (R ∩ [F, F])/[R, F], which §1.23 identifies with H_2(G, Z).
- Perfectness of G cannot be dropped: a group that is not perfect has no universal central extension (§1.18).

*Needs:* §1.4; §1.5; §1.6; §1.17; §1.21; Mathlib `FreeGroup`; Mathlib `FreeGroup.lift`; Mathlib `Group.IsPerfect`.

### 1.23 The kernel of a universal central extension is the second homology

Let G be a perfect group in Type and p : X → G a universal central extension with X in Type. Then ker p ≅ H_2(G, Z) as abelian groups (trivial integral coefficients): the unique isomorphism over G from X to the Hopf extension [F, F]/[R, F] of the canonical presentation F = FreeGroup G → G restricts to an isomorphism of kernels, and Hopf's formula identifies the Hopf kernel (R ∩ [F, F])/[R, F] with H_2(G, Z). That the identification does not depend on the presentation is §1.29. (Weibel, III.5.4, statement, p. 219; Weibel, Before Proposition IV.1.7, p. 264.)

`Suggested.lean` states this as `IsUniversalCentralExtension.nonempty_kerEquiv`.

G is a perfect group in Type; p : X → G is a universal central extension, X in Type (universality quantifies over central extensions in that universe, which contains the Hopf model FreeGroup G).

**Checks.**

- For G = E(R) and X = St(R) this is K_2(R) ≅ H_2(E(R), Z), which §3.4 consumes.
- For G trivial both sides are zero.
- The statement is about perfect groups: Z² has H_2 = Z but no universal central extension.

*Needs:* §1.6; §1.15; §1.17; §1.22; Mathlib `groupHomology.H2`; Mathlib `Rep.trivial`.

### 1.24 The source of a universal central extension is superperfect

Let p : X → G be a universal central extension of groups in Type. Then X is superperfect: H_1(X, Z) = 0 and H_2(X, Z) = 0. Only the universal property is used. This is Recognition (1) ⇒ (3). (Weibel, III.5.4, equivalent conditions and proof, p. 220; Weibel, Exercise IV.1.9, p. 274.)

p : X → G is a universal central extension; X and G are groups in Type.

**Checks.**

- For the Steinberg extension St(R) → E(R) (§3.3) it gives H_1(St(R), Z) = H_2(St(R), Z) = 0, the corollary K3BlochGroups V.1 draws.
- Universality, not merely a perfect source, is used: the identity of A_5 is a central extension with perfect source, but H_2(A_5, Z) ≠ 0.
- For X = G trivial both homology groups vanish.

*Needs:* §1.7; §1.8; §1.18; §1.19; §1.20.

### 1.25 A superperfect group is its own universal central extension

Let X be a superperfect group in Type. Then the identity X → X is a universal central extension of X, and every central extension ρ : Y → X (Y in Type) splits. This is Recognition (3) ⇒ (2). (Weibel, III.5.4, equivalent conditions and proof, p. 220.)

X is a superperfect group in Type.

**Checks.**

- For X trivial, every central extension A → 1 is split by the trivial homomorphism.
- Both vanishing conditions are needed: Z/2 has H_2 = 0 but H_1 ≠ 0, and C_4 → Z/2 does not split; A_5 is perfect with H_2 ≠ 0, and SL_2(F_5) → A_5 does not split.

*Needs:* §1.6; §1.7; §1.8; §1.15; §1.17; §1.22.

### 1.26 A perfect central extension whose central extensions split is universal

Let p : X → G be surjective with central kernel. If X is perfect and every central extension of X splits, then p is a universal central extension of G. This is Recognition (2) ⇒ (1); no homology enters and there is no universe restriction beyond the one in the definition of universality. (Weibel, III.5.4, equivalent conditions and proof, p. 220.)

p : X → G is surjective and ker p lies in the centre of X. X is perfect, and every central extension of X (in the universe over which universality quantifies) splits.

**Checks.**

- The Steinberg application: St(R) is perfect and every central extension of St(R) splits (glued from finite-rank splitting), so St(R) → E(R) is universal; §3.3 uses the lemma in this form.
- Perfectness of X is needed: every central extension of a nontrivial free group F splits, but the identity of F is not universal, since F is not perfect.

*Needs:* §1.1; §1.2; §1.4; §1.17; Mathlib `Group.IsPerfect`.

### 1.27 The Recognition Theorem

Let G be a perfect group and p : X → G a central extension (p surjective, ker p central), X in Type. The following are equivalent: (1) p is a universal central extension; (2) X is perfect and every central extension of X splits; (3) H_1(X; Z) = H_2(X; Z) = 0, that is, X is superperfect. Every perfect group has a universal central extension, the Hopf extension of any free presentation (§1.22), and its kernel is H_2(G; Z) (§1.23). (Weibel, III.5.4, statement, p. 219; Weibel, III.5.4, equivalent conditions and proof, p. 220.)

`Suggested.lean` states this as `recognition_theorem`.

G is a perfect group; p : X → G is surjective with ker p in the centre of X; X is a group in Type, as Mathlib's integral group homology requires.

**Checks.**

- For a free group the theorem is vacuous, since a free group is perfect only when trivial.
- Condition (3) is the one K3BlochGroups V.1 uses for the Steinberg group and StableHomotopyKTheory Layer 3 uses for π_1 of an acyclic homotopy fibre.
- Perfectness of a central-extension source alone does not imply universality; the recognition criterion also requires H_2 of that source to vanish.
- The hypotheses that p is surjective with central kernel are kept: universality is recognised on central extensions of a perfect group, not on arbitrary extensions.

*Needs:* §1.7; §1.8; §1.17; §1.18; §1.19; §1.20; §1.22; §1.23; §1.25; §1.26; Mathlib `groupHomology.H1`; Mathlib `groupHomology.H2`.

### 1.28 Lifting homomorphisms to universal central extensions

Let p : X → G and p' : X' → G' be universal central extensions (groups in one universe) and f : G → G' a homomorphism. There is a unique homomorphism f̃ : X → X' with p' ∘ f̃ = f ∘ p. The lift of the identity of G along p itself is the identity of X, the lift of a composite is the composite of the lifts, and f̃ maps ker p into ker p', giving a homomorphism of abelian groups ker p → ker p'. (Weibel, III.5.3.1, p. 219.)

p : X → G and p' : X' → G' are universal central extensions; f : G → G' is a homomorphism.

Provide the following API.

- `IsUniversalCentralExtension.lift`: The lift f̃ : X → X' of f : G → G' between universal central extensions p and p'.
- `IsUniversalCentralExtension.proj_comp_lift`: p' ∘ f̃ = f ∘ p.
- `IsUniversalCentralExtension.lift_unique`: Any homomorphism h : X → X' with p' ∘ h = f ∘ p equals f̃.
- `IsUniversalCentralExtension.lift_id`: The lift of id_G along p itself is id_X.
- `IsUniversalCentralExtension.lift_comp`: The lift of g ∘ f is the lift of g composed with the lift of f.
- `IsUniversalCentralExtension.kerMap`: The restriction of f̃ to kernels, a homomorphism of abelian groups ker p → ker p'.

**Checks.**

- For G' = G, p' = p and f = id_G, the lift is id_X.
- For the trivial homomorphism f : G → G', the lift is the trivial homomorphism X → X'.
- For a ring map φ : R → S, the lift of E(φ) along St(R) → E(R) and St(S) → E(S) sends x_ij(r) to x_ij(φ(r)).
- For the central extension id : C_2 → C_2, which is not universal, the identity of C_2 has two different lifts to the split extension C_2 × C_2 → C_2 (first coordinate trivial or the identity).

*Needs:* §1.1; §1.2; §1.17; §1.18.

### 1.29 Naturality of the kernel of the universal central extension

Let f : G → G' be a homomorphism of perfect groups in Type with universal central extensions p : X → G and p' : X' → G'. Under the isomorphisms ker p ≅ H_2(G, Z) and ker p' ≅ H_2(G', Z) of §1.23, the kernel map of the lift f̃ (§1.28) is H_2(f; Z) = groupHomology.map f (id) 2. Taking f = id_G shows that the isomorphism of §1.23 does not depend on the presentation used to build it. (Weibel, Theorem III.5.5, p. 220.)

G, G' are perfect groups in Type with universal central extensions p, p'; f : G → G' is a homomorphism.

**Checks.**

- For f = id_G the kernel map is the identity, whatever presentations are used.
- For a ring map R → S it gives the naturality of K_2(R) ≅ H_2(E(R), Z) that §3.4 asserts.

*Needs:* §1.16; §1.23; §1.28; Mathlib `FreeGroup.map`; Mathlib `groupHomology.map`.

### Examples

- The reduction C₄ → C₂ is central and non-split; the identity of C₂ is a central extension that is not universal, since C₂ is not perfect.
- SL₂(𝔽₅) → A₅ is the universal central extension of A₅, with kernel H₂(A₅; ℤ) ≅ ℤ/2; A₅ is perfect but not superperfect.
- For the upper unitriangular group over 𝔽₃ and its quotient 𝔽₃², the transgression of the cycle [q(a)|q(b)] − [q(b)|q(a)] is the central element (0, 0, 2); this pins the sign of the connecting map (§1.12).
- For F = Free(a, b) → ℤ killing b, the relation module R/[R, F] is nonzero (detected by the b-exponent sum) while the Hopf quotient (R ∩ [F, F])/[R, F] = H₂(ℤ; ℤ) vanishes.

### Dependencies

Mathlib group homology, presentations, extensions and character modules; Tau Ceti `FactorSet` and `GroupExtension.InducesAction`.

## Layer 2: Steinberg groups and classical K₂

The Steinberg group St_n(R) of an associative ring for n ≥ 3, its map onto the elementary group, stabilisation and the stable group St(R), classical K₂(R) = ker(St(R) → E(R)) with the exact sequence 1 → K₂ → St → GL → K₁ → 1, and Steinberg's theorem that K₂(R) is the centre of St(R). The column and row root subgroups are injective and normalised by lower-rank words; that is the input to the centre theorem. Finite-rank centrality is only stated under the explicit injectivity hypothesis of §2.12.

### 2.1 The Steinberg group of a ring in finite rank

For a ring R and an integer n at least three define St_n(R) by generators x_ij(r), indexed by a pair of distinct integers i and j between one and n and an element r of R, subject to the Steinberg relations: x_ij(r) x_ij(s) = x_ij(r + s), and the commutator of x_ij(r) with x_kl(s) is trivial when j is different from k and i is different from l, is x_il(rs) when j equals k and i is different from l, and is x_kj(minus s r) when j is different from k and i equals l. The distinct-index hypotheses are part of each relation and are never dropped. The same relators give an auxiliary presented group in ranks zero, one and two; ranks zero and one are trivial, and the raw rank-two presentation is not the auxiliary integer group S₂ of §12.6. Structural assertions about St_n carry their rank bounds. (Weibel, III.5.1, p. 217, for n≥3.)

`Suggested.lean` gives the presentation as `steinbergRels` on the generator type `StGen`, with `Steinberg n R` the presented group, proves `Steinberg.x_add`, and states the chaining relations as `Steinberg.commutator_chain` and `Steinberg.commutator_reverse`; the presentation is written for every n, is the Steinberg group only for n ≥ 3, and the theorems that need n ≥ 3 carry that hypothesis.

n is at least three. i and j are distinct indices between one and n.

Provide the following API.

- `Steinberg`: The group St_n(R) for n at least three.
- `Steinberg.x`: The generator x_ij(r), taking the distinctness of the indices as a hypothesis.
- `Steinberg.x_add`: x_ij(r) x_ij(s) = x_ij(r + s).
- `Steinberg.commutator`: The three commutator relations, each with its index hypothesis.
- `Steinberg.lift`: A family satisfying the relations induces a unique homomorphism out of St_n(R).
- `Steinberg.x_zero`: x_ij(0) is the identity.
- `Steinberg.hom_ext`: Two homomorphisms agreeing on every generator are equal.
- `Steinberg.map`: Ring maps act on parameters; identity and composition are proved on generators.

**Checks.**

- x_01(0)=1 in rank three.
- x_01(r)^-1=x_01(-r).
- [x_01(r),x_12(s)]=x_02(r*s).
- Over R=M_2(Z), [x_01(r),x_20(s)]=x_21(-(s*r)); choose noncommuting r=E12 and s=E21 to distinguish s*r from r*s.
- [x_01(r),x_02(s)]=1; the opposite-root case x_01,x_10 is not assigned this relation.
- In ranks zero and one there are no generators; in rank two the third-index perfectness proof is unavailable.

*Needs:* Mathlib `PresentedGroup`; Mathlib `commutatorElement`.

### 2.2 The elementary matrices satisfy the Steinberg relations

For an associative unital ring R and n >= 3, elementary transvections satisfy additivity, the nonchaining commutator relation and both chaining commutator relations, with all distinct-index hypotheses as in the Steinberg presentation. (Weibel, III.5.1.2, p. 217.)

R is an associative unital ring; n is at least three.

**Checks.**

- Forward chaining has coefficient r*s; reverse chaining has coefficient -(s*r).
- The nonchaining case requires both j != k and i != l.
- The opposite-root commutator is not asserted trivial.

*Needs:* §2.1; Mathlib `Matrix.GeneralLinearGroup.transvection`; Tau Ceti `TauCeti.transvectionUnit`; Tau Ceti `TauCeti.commutatorElement_transvectionUnit`; Tau Ceti `TauCeti.transvectionUnit_add`; Tau Ceti `TauCeti.commute_transvectionUnit`; Tau Ceti `TauCeti.commutatorElement_transvectionUnit_reverse`.

### 2.3 The Steinberg map onto the elementary subgroup

The generator assignment x_ij(r) -> e_ij(r) descends to a surjective homomorphism St_n(R) -> E_n(R), where E_n is the subgroup generated by elementary matrices of KTheoryLowDegrees §6.2. (Weibel, III.5.1.1, p. 217.)

`Suggested.lean` states the existence of the map as `Steinberg.exists_toGL`.

R is an associative unital ring; n is at least three.

Provide the following API.

- `toElementary`: The generator assignment x_ij(r) -> e_ij(r) descends to a surjective homomorphism St_n(R) -> E_n(R), where E_n is the subgroup generated by elementary matrices of KTheoryLowDegrees §6.2.
- `toElementary_x`: The image of x_ij(r) is e_ij(r).
- `toElementary_surjective`: Every element of the generated elementary subgroup has a preimage.
- `toElementary_map`: The square for a unital ring homomorphism commutes on each generator.

**Checks.**

- x_01(2) maps to I+2E_01 over Z.
- e_01(r)*e_12(s) is the image of x_01(r)*x_12(s).
- Over Q, diag(2,1,1) has determinant 2 and is outside the image; surjectivity concerns E_3, not GL_3.

*Needs:* §2.1; §2.2; KTheoryLowDegrees Layer 6.

### 2.4 Perfectness of the Steinberg group

For n >= 3, the finite-rank Steinberg group St_n(R) is perfect. (Weibel, III.5.1 relations and III.5.5, p. 217.)

`Suggested.lean` states this as `Steinberg.isPerfect`.

n is at least three. i and j are distinct indices between one and n. n >= 3.

*Needs:* §2.1; Mathlib `Group.IsPerfect`.

### 2.5 Stabilisation and the stable Steinberg group

Construct the rank-increasing maps between St_n(R) from the presentation and the stable group St(R) as their group colimit. The finite and stable elementary groups and their embeddings are those of KTheoryLowDegrees §§6.1–6.2; the compatible finite Steinberg maps induce St(R) -> E(R). (Weibel, III.5.1.2, p. 217.)

Provide the following API.

- `Steinberg.stabilise`: The map from rank n to rank n plus one.
- `StableSteinberg`: The colimit St(R).
- `StableSteinberg.phi`: The surjection onto the stable elementary group.
- `StableSteinberg.phi_surjective`: That surjection is onto.
- `StableSteinberg.map`: Functoriality in the ring.
- `StableSteinberg.lift`: Compatible finite-rank homomorphisms induce a unique homomorphism from St(R).
- `StableSteinberg.hom_ext`: Homomorphisms agreeing on every finite-stage generator are equal.

**Checks.**

- The rank-three generator x_01(2) maps to the stable generator with the same parameter.
- The image of [x_01(r),x_12(s)] is x_02(r*s) after any common stabilization.
- A stable elementary word represented at rank five is the image of the corresponding rank-five Steinberg word.

*Needs:* §2.1; §2.3; Mathlib `DirectLimit`; KTheoryLowDegrees Layer 6.

**The stable Steinberg map from the group colimit.** The compatible maps St_n(R) → E_n(R) induce a surjective homomorphism φ_R : St(R) → E(R), with φ_R(x_ij(a)) = e_ij(a). Every finite family in St(R) has representatives in one common finite rank. Equality of representatives means equality in some larger rank; no injectivity of St_n(R) → St(R) is assumed. (Weibel, III.5.1–5.2, p. 217.)

*Checks.*

- φ maps a stabilized generator to the identically indexed elementary matrix.
- The zero ring gives trivial St and E.
- The proof uses no claim that Steinberg transitions are monomorphisms.

*Needs:* §2.1; §2.3; KTheoryLowDegrees §6.2; §2.2; KTheoryLowDegrees §6.1; Mathlib `DirectLimit`; Mathlib `DirectLimit.setoid`; Mathlib `DirectLimit.exists_eq_mk`; Mathlib `DirectLimit.exists_eq_mk₂`; Mathlib `DirectLimit.eq_of_le`; Mathlib `DirectLimit.map`; Mathlib `DirectLimit.lift`; Mathlib `DirectLimit.lift_def`; Mathlib `DirectLimit.mul_def`; Mathlib `DirectLimit.lift_mul`; Mathlib `DirectLimit.lift_one`; Mathlib `DirectLimit.inv_def`.

### 2.6 Perfectness of the stable Steinberg group

The stable Steinberg group St(R) is perfect. (Weibel, III.5.1 relations and III.5.5, p. 217.)

*Needs:* §2.4; §2.5; Mathlib `Group.IsPerfect`.

### 2.7 A faithful column root subgroup

For n≥3 with indices 0,…,n−1 and last index c=n−1, define ρ^col_n : (R^(n−1),+) → St_n(R) by v ↦ ∏_{i<c} x_ic(v_i), in increasing index order. It is an injective homomorphism. Its composite with φ_n has matrix 1+∑_{i<c} E_ic(v_i). The same parameter map into stable St is injective, even when other finite-rank transition injectivity is unknown. (Weibel, Exercise III.5.2, and III.5.2.1, pp. 217, 228.)

n≥3; c is the last index.

Provide the following API.

- `Steinberg.columnRoot`: ρ^col_n is the homomorphism from the multiplicative type tag of the additive group R^(n−1).
- `Steinberg.columnRoot_zero`: ρ^col_n(0)=1.
- `Steinberg.columnRoot_add`: ρ^col_n(v+w)=ρ^col_n(v)ρ^col_n(w).
- `Steinberg.columnRoot_matrix`: φ_nρ^col_n(v)=1+∑ E_ic(v_i), as a matrix unit.
- `Steinberg.columnRoot_injective`: Both the finite column map and its stable composite are injective.
- `Steinberg.columnRoot_conjugate`: x_ij(a)ρ^col_n(v)x_ij(−a)=ρ^col_n(v with coordinate i replaced by v_i+a v_j), for distinct i,j<c.
- `Steinberg.columnRoot_map`: A unital ring map acts coordinatewise and commutes with the column map; zero padding under stabilization keeps the designated column index c, and reindexing transports it to its new position. It does not identify the old last column with a newly appended column.

**Checks.**

- In rank three, columnRoot(0,0)=1.
- Over Z in rank three, columnRoot(2,3) maps to the matrix with diagonal entries 1 and last column (2,3,1); therefore it is nonidentity.
- Over a commutative ring, the matrix unit equals the product of the TauCeti.transvectionUnit at (0,2) and (1,2).
- Over M₂(Z), conjugating columnRoot(0,E21) by x_01(E12) yields columnRoot(E11,E21); the incorrect right multiplication gives E22.
- A column word with one nonzero coordinate remains nonidentity in stable St.

*Needs:* §2.1; §2.5; KTheoryLowDegrees §6.2; KTheoryLowDegrees §6.1; Mathlib `DirectLimit.mk_injective`.

**Injective column and row normal forms in Steinberg groups.** For an associative unital ring R, n ≥ 3 and an index t, define rho_t from the additive group of vectors (v_i) indexed by i ≠ t to St_n(R) by the product of x_it(v_i). These roots commute, so the order is immaterial and rho_t is an injective additive-to-multiplicative homomorphism. Its matrix image is I + sum_i E_it(v_i). Its composite into St(R) is also injective. The row analogue eta_t(v) = product_i x_ti(v_i) has the same assertions. For a,b distinct and both different from t, conjugation by x_ab(c) replaces column coordinate v_a by v_a + c v_b, and row coordinate v_b by v_b − v_a c. These are left and right multiplications in the displayed order. (Weibel, Exercise III.5.2, proof of Theorem III.5.2.1, pp. 217, 228; Weibel, III.1.2, p. 180.)

R is an associative unital ring; neither commutativity nor nontriviality is assumed. n ≥ 3; vectors have exactly n−1 coordinates, omitting t. For the normalization formulas a ≠ b, a ≠ t and b ≠ t. Opposite roots are excluded.

Provide the following API.

- `Steinberg.column`: rho_t(v)=product over i≠t of x_it(v_i), with commuting factors and fixed finite index type.
- `Steinberg.row`: eta_t(v)=product over i≠t of x_ti(v_i), with commuting factors.
- `Steinberg.column_add`: rho_t(v+w)=rho_t(v)rho_t(w); the identical row law also holds.
- `Steinberg.column_basis`: rho_t of the vector supported at i with value r is x_it(r); row basis evaluates to x_ti(r).
- `Steinberg.phi_column`: The image under phi_n is I+sum_i E_it(v_i); row image is I+sum_i E_ti(v_i).
- `Steinberg.column_injective`: rho_t and eta_t are injective, and remain injective after mapping to stable St(R).
- `Steinberg.column_conj`: For a,b≠t and a≠b, x_ab(c)rho_t(v)x_ab(c) inverse equals rho_t(v with v_a increased by c v_b).
- `Steinberg.row_conj`: Under the same hypotheses conjugation increases row coordinate v_b by −v_a c.
- `Steinberg.column_map`: Ring maps act on every vector entry; index stabilization adds zero entries. Row maps satisfy the same laws.

*Checks.*

- For any n,t, rho_t(0)=1 and eta_t(0)=1; over the zero ring both image groups are trivial.
- In rank three over Z, with t=3 and vector (2,3), phi_3(rho_3(v))=I+2E13+3E23. Thus rho_3(v) is not identity.
- Over R=M2(Z), for the outer rank-three column t=3, take c=E12 and v_2=E21. Conjugation by x_12(c) adds E11 to v_1, not E22.
- Over R=M2(Z), take row t=3, c=E12 and v_1=E21. Conjugation by x_12(c) adds −E22 to v_2, not −E11.
- Over Z, the stable image of rho_3(1,0)=x_13(1) has matrix entry (1,3)=1 and is nonidentity.
- Over Z, conjugating e_13(1) by e_31(1) gives a matrix with a nonzero (3,1) entry and changed diagonal entries. It is not in the column subgroup; the normalizer formula cannot include a=t or b=t.

*Needs:* §2.1; §2.3; §2.5; KTheoryLowDegrees §6.2; §2.2; KTheoryLowDegrees §6.1.

### 2.8 A faithful row root subgroup

For n≥3, c=n−1, define ρ^row_n(v)=∏_{i<c} x_ci(v_i). This is an injective homomorphism R^(n−1)→St_n(R), with elementary image 1+∑ E_ci(v_i); its stable composite is injective. For distinct i,j<c, conjugation by x_ij(a) replaces v_j by v_j−v_i a and leaves every other coordinate fixed. (Weibel, III.5.2.1, Exercise III.5.2, pp. 217, 228.)

n≥3; c is the last index.

Provide the following API.

- `Steinberg.rowRoot`: ρ^row_n is the homomorphism on the multiplicative type tag of the additive parameter group.
- `Steinberg.rowRoot_add`: ρ^row_n(v+w)=ρ^row_n(v)ρ^row_n(w).
- `Steinberg.rowRoot_zero`: ρ^row_n(0)=1.
- `Steinberg.rowRoot_neg`: ρ^row_n(−v)=ρ^row_n(v)⁻¹.
- `Steinberg.rowRoot_matrix`: φ_nρ^row_n(v)=1+∑ E_ci(v_i).
- `Steinberg.rowRoot_injective`: The finite map and its stable composite are injective.
- `Steinberg.rowRoot_conjugate`: Conjugation by x_ij(a), i,j<c distinct, replaces v_j by v_j−v_i a.
- `Steinberg.rowRoot_map`: Ring maps act on each coordinate; stabilization keeps the designated row index and reindexing transports it; a newly appended last row is a different subgroup.

**Checks.**

- In rank three, rowRoot(0,0)=1.
- Over Z, rowRoot(2,3) has final row (2,3,1), while its last column above the diagonal is zero.
- Over a commutative ring, the image agrees with the product of TauCeti.transvectionUnit at (2,0) and (2,1).
- Over M₂(Z), conjugating rowRoot(E21,0) by x_01(E12) gives rowRoot(E21,−E22); −E11 is incorrect.

*Needs:* §2.1; §2.7; KTheoryLowDegrees §6.2; KTheoryLowDegrees §6.1.

### 2.9 Classical K_2 of a ring

Define classical K2(R) as ker(phi : St(R) -> E(R)). The inclusion into St(R) is injective and its image is the kernel; the stable Steinberg map is surjective. Ring maps induce maps on these kernels. (Weibel, III.5.2, p. 217.)

Provide the following API.

- `K2`: The group K_2(R).
- `K2.subtype`: Its inclusion into St(R).
- `K2.mem_iff`: An element lies in K_2(R) exactly when its image in E(R) is trivial.
- `K2.map`: Functoriality in the ring.
- `K2.ext`: Kernel elements are equal exactly when their values in St(R) are equal.

**Checks.**

- K_2 of the zero ring is trivial.
- K_2(Z) is cyclic of order two.
- K_2 of a finite field is trivial.
- Abelianness is a theorem, not part of the definition: a definition that assumes it assumes Steinberg's theorem.

*Needs:* §2.5.

### 2.10 The classical low-degree exact sequence

The sequence 1 -> K2(R) -> St(R) -> GL(R) -> K1(R) -> 1 is exact, using the inclusion E(R) <= GL(R) and the quotient GL(R)/E(R) of KTheoryLowDegrees Layers 6–7. (Weibel, III.5.2, p. 217.)

*Needs:* §2.9; KTheoryLowDegrees Layer 6; KTheoryLowDegrees §7.1.

### 2.11 Steinberg's theorem: K_2 is the centre of the Steinberg group

For every ring R the group K_2(R) is abelian; in fact it is precisely the centre of St(R). (Weibel, III.5.2.1, p. 217.)

**Checks.**

- K_2(R) is abelian, which is what makes the four-term sequence a sequence of abelian groups at that spot.
- The centre of E(R) is trivial, which is the first half of the argument and is needed separately.
- The theorem is about the stable group: the centre of St_n(R) is a different question, treated in the finite-rank caveat.

*Needs:* §2.5; §2.9; Mathlib `Subgroup.center`.

**Stable centrality from faithful fresh roots.** For every associative unital ring R, ker(φ_R)=Z(St(R)). In particular the kernel defining classical K₂(R) is abelian. This is a stable theorem and asserts no arbitrary finite-rank centrality. (Weibel, III.5.2.1, with Exercise III.5.2, pp. 217, 228.)

*Checks.*

- The proof separates centre⊆kernel from kernel⊆centre.
- Over the zero ring both sides are trivial.
- No statement about ker(St_n→E_n) follows merely by restricting this stable equality.

*Needs:* §2.1; §2.5; §2.7; §2.8; §2.9; KTheoryLowDegrees §6.2; KTheoryLowDegrees §6.1.

### 2.12 Conditional centrality in finite rank

If the map ker(St_n(R)->E_n(R)) -> ker(St(R)->E(R)) induced by stabilization is injective, then ker(St_n(R)->E_n(R)) is central in St_n(R). This hypothesis is not asserted for arbitrary n,R. (Weibel, III.5.2.1 and III.5.5.2, p. 218.)

R is an associative unital ring; n is at least three. The stabilization map restricted to the finite-rank kernel is injective.

**Checks.**

- The proof uses injectivity on the kernel, not injectivity of the entire stabilization map.
- Without the injectivity hypothesis the stable-centre theorem alone has no finite-rank conclusion.
- Together with n>=5 splitting and perfectness, this centrality hypothesis permits a finite-rank UCE conclusion.

*Needs:* §2.3; §2.11.

### Examples

- Over ℤ in rank three, [x₁₂(r), x₂₃(s)] = x₁₃(rs); over M₂(ℤ) the reverse relation [x₁₂(r), x₃₁(s)] = x₃₂(−sr) distinguishes sr from rs.
- diag(2, 1, 1) over ℚ is not in E₃(ℚ): the map St₃ → E₃ is onto E₃, not GL₃.
- K₂ of the zero ring is trivial; K₂(ℤ) ≅ ℤ/2 and K₂(𝔽_q) = 0 are computed in Layers 12 and 6–7.

### Dependencies

Layer 1; KTheoryLowDegrees §§6.1–6.2, 7.1; Mathlib `PresentedGroup` and `DirectLimit`; Tau Ceti transvection identities.

## Layer 3: the Steinberg group as universal central extension

For n ≥ 5 every central extension of St_n(R) splits by explicit normalised lifts of the generators; the finite sections glue along the stable colimit, so St(R) → E(R) is the universal central extension of E(R) and K₂(R) ≅ H₂(E(R); ℤ) naturally in R. No finite-rank universality is asserted without a separate centrality hypothesis.

### 3.1 Normalized lifts of Steinberg generators

Let n≥5 and q:Y→St_n(R) be a surjective homomorphism with central kernel. For i≠j and a∈R define y_ij(a)=[u,v], where q(u)=x_ik(1), q(v)=x_kj(a), and k differs from i,j. The resulting element is independent of u,v and of k, and q(y_ij(a))=x_ij(a). More generally, for i,k,j pairwise distinct, any lifts U,V of x_ik(a),x_kj(b) satisfy [U,V]=y_ij(ab). (Weibel, III.5.5.1, and Exercise III.5.3, pp. 220, 228.)

n≥5. q is surjective and ker q≤Z(Y); no centrality of St_n→E_n is assumed.

Provide the following API.

- `Steinberg.normalisedRootLift`: y_ij(a) is the commutator of any indicated two preimages under q.
- `Steinberg.normalisedRootLift_image`: q(y_ij(a))=x_ij(a).
- `Steinberg.normalisedRootLift_choice`: Changing either preimage or the intermediate index leaves y_ij(a) unchanged.
- `Steinberg.normalisedRootLift_zero`: y_ij(0)=1, since any lift of x_kj(0)=1 lies in the central kernel.
- `Steinberg.normalisedRootLift_product`: For arbitrary lifts of x_ik(a),x_kj(b), their commutator is y_ij(ab).
- `Steinberg.normalisedRootLift_extensionHom`: A homomorphism Y→Y′ over St_n carries normalized lifts to normalized lifts; q′ must again be a surjective central extension.

**Checks.**

- For q=id on St_n, y_ij(a)=x_ij(a).
- For every central extension, y_ij(0)=1 even when the arbitrary set section sends 1 to a nonidentity kernel element.
- Multiplying either chosen lift by any kernel element leaves the commutator unchanged.
- In rank five the choices k=2 and k=3 for i=0,j=1 give the same y_01(a).
- For R=M₂(Z), [lift x_02(E12),lift x_21(E21)]=y_01(E11). It is not y_01(E22), since the elementary image distinguishes those parameters.

*Needs:* §1.1; §2.1; Mathlib `commutatorElement`; Mathlib `commutatorElement_mul_right_eq_mul_conj`.

### 3.2 Every central extension of the finite-rank Steinberg group splits, for n at least five

For n at least five every central extension of St_n(R) splits. If the canonical surjection St_n(R) -> E_n(R) is separately known to have central kernel, then it is the universal central extension of E_n(R); centrality is not a consequence of splitting. (Weibel, III.5.5.1, p. 220.)

`Suggested.lean` states the splitting as `Steinberg.centralExtension_splits`.

R is an associative unital ring; n is at least five.

**Checks.**

- The bound n at least five is used in the first step and is recorded, not smoothed over.
- The splitting is by an explicit homomorphism, which is what makes the argument constructive.
- The statement does not say that the kernel of the finite-rank map is central, which is the separate caveat below.

*Needs:* §1.26; §2.1; §2.3; §2.4.

**The lifted relations give the unique finite section.** For n≥5 every surjective central extension q:Y→St_n(R) has a unique homomorphic section σ, with σ(x_ij(a))=y_ij(a). The normalized lifts satisfy all Steinberg relations, including additivity and reverse multiplication −ba. This implies finite-rank universality of St_n→E_n only under a separately supplied central-kernel hypothesis. (Weibel, III.5.5.1, p. 220.)

n≥5; q is a surjective central extension of St_n(R).

*Checks.*

- All four relations are checked with their index hypotheses; the opposite-root case stays unprescribed.
- The additive calculation works over M₂(Z).
- A claim of finite-rank universality without a centrality input fails the acceptance contract.

*Needs:* §1.4; §2.1; §2.4; §2.12; §3.1; Mathlib `commutatorElement_mul_right_eq_mul_conj`; Mathlib `commutatorElement_inv`.

### 3.3 The Steinberg group is the universal central extension of the elementary group

For every ring R the stable Steinberg group St(R) is the universal central extension of E(R). Consequently K_2(R) is isomorphic to the second integral homology of E(R). (Weibel, III.5.5, p. 220.)

**Checks.**

- The identification of K_2 with the second homology is the statement Layer 4 starts from.
- For the ring of integers both sides are cyclic of order two.
- No finite-rank UCE conclusion is drawn without a separate centrality hypothesis.

*Needs:* §1.4; §1.26; §1.27; §2.4; §2.6; §2.11; §3.2; KTheoryLowDegrees Layer 6.

**Compatible finite sections and the stable universal extension.** Every surjective central extension q:Y→St(R) has a unique section. Consequently the stable surjection φ_R:St(R)→E(R), already proved central, is the universal central extension of E(R). (Weibel, III.5.5 and III.5.5.1, p. 220.)

q is surjective with central kernel.

*Checks.*

- Compatibility is proved on the cofinal tail, rather than chosen independently in each rank.
- No inverse to a Steinberg transition is used.
- The resulting universal property quantifies over all surjective central extensions of E.

*Needs:* §1.2; §1.4; §1.26; §2.5; §2.6; §2.11; §3.2; KTheoryLowDegrees §6.2; Mathlib `DirectLimit.lift`; Mathlib `DirectLimit.lift_def`; Mathlib `DirectLimit.lift_mul`; Mathlib `DirectLimit.lift_one`.

### 3.4 K_2 is the second homology of the elementary group

For every ring R there is an isomorphism from K_2(R) to the second integral homology of E(R), natural in R. It is the identification of the kernel of the universal central extension with the kernel given by the Hopf formula. (Weibel, III.5.5, p. 220.)

**Checks.**

- For the ring of integers both sides are cyclic of order two.
- The isomorphism is natural, which is what the comparison with homotopy needs.
- The identification is of kernels, not merely an abstract isomorphism of abelian groups; the acceptance test is the compatibility with the two projections.

*Needs:* §1.15; §1.23; §1.28; §1.29; §2.9; §3.3; Mathlib `groupHomology.H2`.

### Examples

- In rank five the normalised lift y₀₁(a) does not depend on the auxiliary index (k = 2 or k = 3).
- For R = ℤ both K₂(ℤ) and H₂(E(ℤ); ℤ) are cyclic of order two.

### Dependencies

Layers 1–2; KTheoryLowDegrees §6.2 (E(R) perfect).

## Layer 4: classical K₂ as the second homotopy group

Classical K₂ is identified with π₂ of BGL(R)⁺ in two natural ways: the Hurewicz route β_R through H₂(E(R)) and the simply connected cover BE(R)⁺, and the fibre route χ_A through the connecting map of the plus-construction fibre, which is StableHomotopyKTheory's `plusConstruction.pi2Equiv`. Both are natural in unital ring maps and independent of the plus model; the fibre route is transported to π₂ of the Q-construction of finitely generated projective modules. The degree-two product comparison of Layer 8 fixes its sign relative to β.

### 4.1 K_2 is the second homotopy group of the K-theory space

For every ring R there is an isomorphism from K_2(R) to the second homotopy group of the plus construction on the classifying space of the stable general linear group, natural in R. It is obtained by combining the identification with the second homology of E(R) with the Hurewicz theorem applied to the simply connected space obtained from the plus construction. (Weibel, IV.1.7.1 and Exercise IV.1.8, p. 265.)

**Checks.**

- The composite isomorphism is natural in the ring.
- For a finite field both sides are trivial.
- The Hurewicz step needs simple connectivity, which is why the elementary group, and not the general linear group, appears.

*Needs:* §3.4; StableHomotopyKTheory Layer 3; GeneralAlgebraicKTheory Layer 3; Mathlib `HomotopyGroup`; KTheoryLowDegrees Layer 6.

**Chosen classical and homotopy K₂ comparisons.** For an associative unital ring R in Type, let α_R:K₂(R)≃H₂^grp(E(R);Z) be the kernel equivalence of the unique isomorphism over E(R) from St(R) to the canonical Hopf universal extension, followed by Hopf’s formula. Put B_R=BGL(R)⁺ with its canonical based vertex, j_R:BE(R)→BE(R)⁺ and p_R:BE(R)⁺→B_R the universal-cover model supplied by StableHomotopyKTheory Layer 3. Let γ_R:H₂^grp(E(R);Z)≃H₂^top(BE(R);Z) be the natural group/classifying-space comparison supplied by StableHomotopyKTheory §1.32, oriented from group homology to space homology. Define β_R=p_R,* ∘ hur_R⁻¹ ∘ H₂^top(j_R) ∘ γ_R ∘ α_R, where hur_R:π₂(BE(R)⁺)≃H₂^top(BE(R)⁺;Z) is absolute Hurewicz. Then β_R:K₂(R)≃π₂(B_R), and, under the early K-space zero-component equivalence, β_R identifies classical with homotopy K₂. Both maps are natural for unital ring homomorphisms; H₂ has trivial integral coefficients and group-valued carriers use the appropriate additive/multiplicative type tags. (Weibel, III.5.5, IV.1.7 and Corollary IV.1.7.1, Exercise IV.1.8, pp. 220, 264, 274.)

Groups are in Type, matching the integral group-homology API; larger universes use compatible universe lifts. GeneralAlgebraicKTheory Layer 3 supplies a based zero-component equivalence with B_R and its ring-map compatibility. Plus comparison homotopies are based; free-homotopy comparisons instead require the trivial action of target π₁ on π₂, supplied for the ring K-space by its H-space structure.

Provide the following API.

- `K2.classicalHomologyEquiv`: α_R is the kernel restriction of the unique Hopf universal-extension equivalence.
- `K2.classicalPlusEquiv`: β_R is the displayed cover/Hurewicz/integral-homology composite.
- `K2.classicalHomologyEquiv_natural`: α_S∘K₂(f)=H₂^grp(E(f);Z)∘α_R for any unital ring map f.
- `K2.classicalPlusEquiv_natural`: β_S∘K₂(f)=π₂(BGL(f)⁺)∘β_R, with the stated basepoint or trivial-action condition.
- `K2.classicalPlusEquiv_cover`: hur_R∘p_R,*⁻¹∘β_R=H₂^top(j_R)∘γ_R∘α_R.
- `K2.classicalPlusEquiv_transport`: Changing the plus/cover model by a based equivalence compatible under BE and BGL carries β to the new β; changing the Hopf presentation carries α by the canonical equivalence.
- `K2.classicalPlusEquiv_KSpace`: Transport β along the based equivalence between BGL⁺ and the zero component of the ring K-space of GeneralAlgebraicKTheory §3.2.

*Checks.*

- For the zero ring, St=E=1 and both comparisons are the unique maps between trivial groups.
- For z∈K₂(R), α_R⁻¹α_R(z)=z and β_R⁻¹β_R(z)=z; neither comparison is merely a map factoring through the trivial group.
- For identity and composable unital ring maps the two naturality squares compose to the identity and composite squares with the actual induced maps.
- For every z, hur_R(p_R,*⁻¹β_R(z))=H₂^top(j_R)(γ_R(α_R(z))); the intermediate value γ_R(α_R(z)) lies in space homology of BE, not group homology of E. This checks carrier alignment and the direction of Hurewicz.
- The square applies to the unital quotient map Z→Z/2; injectivity or invertibility of the ring map is not a hypothesis.

*Needs:* §1.23; §1.28; §1.29; §2.9; §3.3; KTheoryLowDegrees §6.2; StableHomotopyKTheory §3.32; StableHomotopyKTheory §3.12; StableHomotopyKTheory §3.30; StableHomotopyKTheory §3.31; StableHomotopyKTheory §1.32; AlgebraicTopology Stage 8; GeneralAlgebraicKTheory Layer 3.

### 4.2 The normalised classical-to-plus comparison

For an associative unital ring A in Type, write s_A : St(A) → E(A), C_A = ker(s_A), and i_A : BGL(A) → X_A = BGL(A)⁺ relative to E(A), based at the vertex and its image. Put F_A = F(i_A,x_A), with paths from i_A(z) to x_A, U_A = π₁(F_A), and ε_A : U_A → E(A) the factor of the fibre projection. Let δ_A : Additive(π₂(X_A,x_A)) ≃+ Additive(ker ε_A) be the positive loop-space connecting map of StableHomotopyKTheory §2.7, corestricted to the kernel. Let κ_A : Additive C_A ≃+ H₂(E(A);ℤ) and κ_F,A : Additive(ker ε_A) ≃+ H₂(E(A);ℤ) be the §1.23 kernel identifications, using the same Hopf transgression convention. Define ρ_A = κ_F,A ∘ δ_A and χ_A = ρ_A⁻¹ ∘ κ_A. Written additively, ρ_A is the equivalence TauCeti.plusConstruction.pi2Equiv of StableHomotopyKTheory §3.30 for G = GL(A), P = E(A): that construction builds it from this connecting map and §1.23 applied to the fibre extension, so ρ_A is consumed from StableHomotopyKTheory Layer 3 and not constructed a second time here. This specifies an additive equivalence Additive C_A ≃+ Additive(π₂(X_A,x_A)). It realises the existence-and-naturality statement of §4.1 by Weibel's fibre route (Proposition IV.1.7, Corollary IV.1.7.1), with an explicit normalisation; the Hurewicz composite β_R of §4.1 is a second natural equivalence with the same source and target, and no equality χ_A = β_A is asserted. Here H₂(E;ℤ) means the underlying additive group of groupHomology.H2 (Rep.trivial ℤ E ℤ). (Weibel, §III.5, Definition 5.3.1, Lemma 5.3.3, Example 5.3.4 and Theorem 5.5, pp. 219, 220; Weibel, §IV.1, Homotopy Fiber 1.2; Proposition 1.7 and Corollary 1.7.1, pp. 262, 264, 265.)

A is an associative ring with 1; commutativity, nontriviality, regularity and finiteness are not assumed. E(A) and St(A) are the stable groups, not fixed finite-rank groups. The stable Steinberg extension and ε_A are universal central extensions of the perfect group E(A). i_A is a plus construction in the local-coefficient/acyclic sense, not just an integral homology equivalence; all spaces have the CW models supplied by StableHomotopyKTheory Layers 1–3.

Provide the following API.

- `K2Comparison.fromHomology`: Given the established κ_A and ρ_A, χ_A is their composite κ_A followed by ρ_A⁻¹. A light general form accepts an actual group homomorphism s:S→E and equivalences Additive(ker s)≃+H₂(E;ℤ) and Additive(π₂X)≃+H₂(E;ℤ).
- `K2Comparison.fromHomology_normalise`: For every z, ρ_A(χ_A(z))=κ_A(z).
- `K2Comparison.fromHomology_symm`: For every v in Additive(π₂X_A), χ_A⁻¹(v)=κ_A⁻¹(ρ_A(v)).
- `K2Comparison.fromHomology_unique`: An additive homomorphism c:Additive C_A→Additive(π₂X_A) with ρ_A∘c=κ_A equals χ_A.
- `K2Comparison.fromHomology_fibre`: For the unique UCE isomorphism a_A:St(A)≃*U_A over E(A), δ_A∘χ_A is its restriction to the kernel, written additively.
- `K2Comparison.fromHomology_pi2Equiv`: For a ring A, ρ_A is the additive form of StableHomotopyKTheory's TauCeti.plusConstruction.pi2Equiv for G = GL(A), P = E(A), so χ_A is κ_A followed by the inverse of that equivalence. A user never needs the fibre-level definition of ρ_A beyond this identification and fromHomology_fibre.
- `K2Comparison.fromHomology_add`: χ_A(0)=0, χ_A(z+w)=χ_A(z)+χ_A(w), and χ_A(-z)=-χ_A(z); the inverse obeys the corresponding identities.

**Checks.**

- For z in Additive C_A, ρ_A(χ_A(z))=κ_A(z), using the fixed Hopf map of §1.15 rather than an unspecified automorphism of H₂.
- For v in Additive(π₂X_A), χ_A(κ_A⁻¹(ρ_A(v)))=v.
- For the zero ring, every stable Steinberg generator is x_ij(0)=1, so C_A and π₂X_A are trivial and χ_A is the unique equivalence between their additive groups.
- If κ_A(z)≠-κ_A(z), the map z↦-χ_A(z) fails the normalisation equation at z. In the light composition template with all three additive groups ℤ and both equivalences the identity, 1 maps to 1 and not to -1; this template test is not a computation of K₂(ℤ).

*Needs:* §1.23; §1.28; §1.29; §2.9; §3.3; §3.4; KTheoryLowDegrees §6.2; StableHomotopyKTheory §1.30; StableHomotopyKTheory §2.2; StableHomotopyKTheory §2.7; StableHomotopyKTheory §2.8; StableHomotopyKTheory §3.30; Mathlib `groupHomology.H2`; Mathlib `Rep.trivial`; Mathlib `HomotopyGroup`; Mathlib `MonoidHom.ker`; Mathlib `MulEquiv.toAdditive`; Tau Ceti `HomotopyGroup.mapHom`.

### 4.3 Naturality of the normalised comparison

For every unital ring homomorphism f:A→B, let C(f):C_A→C_B be the kernel map of §2.9 and f⁺:X_A→X_B a plus map with its comparison homotopy over BGL(f). Use a based square, or transport basepoints along the specified tracks and use the trivial π₁(X_B)-action supplied by the block-sum H-space structure of StableHomotopyKTheory §4.14. Then ρ_B ∘ π₂(f⁺) = H₂(E(f);ℤ) ∘ ρ_A and χ_B ∘ Additive(C(f)) = Additive(π₂(f⁺)) ∘ χ_A. In the first equality the π₂ groups are written additively. H₂(E(f);ℤ) is exactly groupHomology.map of E(f), with the identity morphism of trivial integral coefficients, in degree 2. These maps satisfy identity and composition on groups, although the chosen plus-space maps need only do so up to homotopy. (Weibel, §IV.1, Functoriality 1.1.2; Proposition 1.7 and Corollary 1.7.1, pp. 261, 264, 265.)

A and B are associative unital rings in Type; f preserves 1. For a free comparison homotopy the target X_B has trivial π₁-action on π₂; StableHomotopyKTheory §4.14 supplies the block-sum H-space structure on the ring plus model and the triviality of the π₁ = K₁(B) action on every π_n. The same abelianness is the hypothesis under which StableHomotopyKTheory Layer 3/plus-construction-functoriality produces f⁺.

**Checks.**

- For f=id_A both squares are identities, and for A→B→D the square for the composite equals the composite of the squares.
- A free homotopy without a specified track or a trivial target action is not used as equality of based homotopy-group maps.
- κ and ρ use the same H₂(E(f);ℤ), not H₂(GL(f);ℤ).

*Needs:* §1.29; §3.4; §4.2; StableHomotopyKTheory §3.31; StableHomotopyKTheory §3.28; StableHomotopyKTheory §3.15; StableHomotopyKTheory §4.14; Mathlib `groupHomology.map`; Mathlib `groupHomology.map_id`; Mathlib `groupHomology.map_comp`; Mathlib `MonoidHom.toAdditive`; Tau Ceti `TauCeti.homotopyGroupTransport_map`.

### 4.4 Independence of the plus model

Let i_A:BGL(A)→X_A and i′_A:BGL(A)→X′_A be two ring plus models, and let u:X_A→X′_A be a homotopy equivalence under BGL(A). For a based comparison homotopy, or with its basepoint track and the trivial π₁-action on π₂ of the target ring model, u_* χ_A=χ′_A and ρ′_A u_*=ρ_A. Consequently the transported comparison is independent of the representative u and of the homotopy used under BGL(A). For arbitrary choices of CW, fibre and Hopf-presentation models, the same statements hold through their specified comparison maps; no literal equality of elements in different carriers is asserted. (Weibel, §III.5, Definition 5.3.1 and Lemma 5.3.3, p. 219; Weibel, §IV.1, Definition 1.1; Theorem 1.5; Corollary 1.7.1, pp. 260, 263, 265.)

Both plus maps kill E(A) and preserve homology with all quotient local coefficients. u is under BGL(A), with the basepoint policy of the naturality theorem. Arbitrary self-equivalences of the bare target X_A are not allowed.

**Checks.**

- Taking X′_A=X_A and u homotopic to the identity under BGL(A) gives u_*χ_A=χ_A.
- A mere abstract isomorphism C_A≅π₂X_A does not determine the comparison; normalisation and the map under BGL(A) are retained.

*Needs:* §1.28; §1.29; §4.3; StableHomotopyKTheory §3.27; StableHomotopyKTheory §4.14; StableHomotopyKTheory §3.15; Tau Ceti `HomotopyGroup.mulEquivOfHomotopyEquiv`; Tau Ceti `TauCeti.homotopyGroupTransport_map`.

### 4.5 The comparison with the projective-module K-space

Let K_Q(A)=ΩBQ(Proj_fg(A)), based at the constant loop, and let K_Q(A)₀ be its path component of zero with inclusion j_A. Use the natural zero-component equivalence η_A:X_A≃K_Q(A)₀ supplied by GeneralAlgebraicKTheory Layer 3. Define Ξ_A=(j_A)_* ∘ (η_A)_* ∘ χ_A : Additive C_A ≃+ Additive(π₂(K_Q(A),0)), with any needed basepoint track retained. The inclusion of the path component induces an isomorphism on based π₂. The equivalence Ξ_A is natural in all unital ring maps, using scalar extension on finitely generated projectives, and is invariant under the compatible model comparisons above. No representatives of nonzero K₀-components are chosen. (Weibel, §IV.4, Theorem 4.11 and Corollary 4.11.1; §IV.7, Theorem 7.1 and Corollary 7.2 with proof; §IV.1, Functoriality 1.1.2, pp. 308, 309, 328, 261.)

A is an associative unital ring in Type. GeneralAlgebraicKTheory Layer 3 constructs Proj_fg(A), K_Q(A), its zero component, η_A and their compatibility with scalar extension and direct sum.

Provide the following API.

- `K2Comparison.toQuillen`: Ξ_A is χ_A followed by η_A on π₂ and the zero-component inclusion. The light template composes an actual kernel-to-π₂ equivalence with an actual homotopy equivalence; the component-inclusion step is supplied separately.
- `K2Comparison.toQuillen_apply`: For z, Ξ_A(z)=j_A*(η_A*(χ_A(z))).
- `K2Comparison.toQuillen_symm`: For v in π₂K_Q(A), Ξ_A⁻¹(v)=χ_A⁻¹(η_A*⁻¹(j_A*⁻¹(v))).
- `K2Comparison.toQuillen_natural`: For any unital f:A→B, Ξ_B C(f)=K_Q(f)_* Ξ_A; identities and composition hold on groups.
- `K2Comparison.toQuillen_model_independent`: Compatible changes of the Q/group-completion and plus models transport Ξ_A through the induced based π₂ equivalences; the zero-component comparison square must be retained.

**Checks.**

- For each z, j_A*(η_A*(χ_A(z)))=Ξ_A(z); the inverse transports back to z.
- For the zero ring the category of finitely generated projective modules is equivalent to the zero exact category, so π₂K_Q(A)=0 and Ξ_A is the unique equivalence from C_A=0.
- Scalar extension ℤ→ℤ/2ℤ, although not flat, gives K_Q(f)_* Ξ_ℤ=Ξ_(ℤ/2ℤ) C(f); the statement does not require a flatness instance.
- Ξ_A always lands at the zero basepoint. Changing a chosen representative of a nonzero K₀-class is not an input to Ξ_A and cannot change it; no natural K₀(A)×X_A splitting of infinite-loop spaces is inferred.

*Needs:* §4.2; §4.3; §4.4; GeneralAlgebraicKTheory Layer 3; Tau Ceti `HomotopyGroup.mulEquivOfHomotopyEquiv`; Mathlib `MulEquiv.toAdditive`.

### Examples

- For the zero ring every group involved is trivial and both comparisons are the unique maps.
- Scalar extension ℤ → ℤ/2, which is not flat, still gives the naturality square for the Quillen comparison.

### Dependencies

Layers 1–3; StableHomotopyKTheory Layers 1–4; GeneralAlgebraicKTheory Layer 3; KTheoryLowDegrees §6.2; AlgebraicTopology Stage 8.

## Layer 5: Steinberg pairings and Milnor K-theory

Steinberg pairings F^× × F^× → A, the universal degree-two presentation, Milnor K-theory K_*ᴹ(F) as the quotient of the tensor algebra of F^× by the two-sided ideal generated by a ⊗ (1 − a), its grading and functoriality, the integral sign rules ({a, b} = −{b, a}, {a, a} = {a, −1}), and the classical calculations: K_nᴹ(𝔽_q) = 0 for n ≥ 2, unique divisibility over algebraically closed fields, K_nᴹ(ℝ) = ℤ/2 ⊕ divisible. The arithmetic high-degree computations follow the norm construction in Layer 10.

### 5.1 Bilinear Steinberg pairings

For an abelian group A written additively, IsSteinbergPairing(c) for c:Fˣ×Fˣ→A means c(ab,d)=c(a,d)+c(b,d), c(a,bd)=c(a,b)+c(a,d), and c(a,b)=0 whenever a+b=1 in F. The last condition uses the field values of two units, so neither zero nor a fake totalised inverse enters the definition. (Matsumoto, §5, Lemma 5.6 and bilinear conditions (S°), pp. 27–28; Weibel, III.6.1, p. 231.)

`Suggested.lean` declares `IsSteinbergPairing` and checks that the constant pairing 1 is not one.

F is a field and A is an AddCommGroup.

Provide the following API.

- `IsSteinbergPairing`: The three equations in the statement.
- `pairing_postcompose`: For f:A→+B and a Steinberg pairing c, f∘c is a Steinberg pairing.
- `pairing_pullback`: For a field homomorphism f:F→E, c(f(a),f(b)) is a Steinberg pairing over F.
- `pairing_one_left`: Every Steinberg pairing satisfies c(1,b)=0.
- `pairing_one_right`: Every Steinberg pairing satisfies c(a,1)=0.

**Checks.**

- The constant zero map is a Steinberg pairing for every F and A.
- The constant function with value 1 in ℤ is not a Steinberg pairing, since its bilinearity at (1,1,1) would give 1=2.
- Over ℝ, the pairing to ℤ/2 with value 1 exactly when both arguments are negative has values c(-1,-1)=1, c(-1,1)=0 and c(2,-1)=0; it satisfies the three equations.

*Needs:* Mathlib `Additive`; Mathlib `Units`.

### 5.2 Universal degree-two symbol presentation

Put U=Additive Fˣ and P₂(F)=(U⊗ℤU)/R₂, where R₂ is the ℤ-submodule spanned by a⊗b for unit pairs with a+b=1. Let p(a,b) be the quotient class of a⊗b. For every abelian A, evaluation on p gives a bijection between additive maps P₂(F)→A and Steinberg pairings Fˣ×Fˣ→A. (Weibel, III.6.1 and III.7.1, pp. 231, 245.)

`Suggested.lean` declares `steinbergRelations`, `SymbolGroup` and `symbol`, with `symbol_swap`, `symbol_self`, `symbol_neg_one_neg_one_real`, `subsingleton_symbolGroup_of_finite` and `existsUnique_lift_of_isSteinbergPairing`.

Provide the following API.

- `SymbolGroup`: The quotient P₂(F) with its AddCommGroup and ℤ-module structures.
- `symbol`: The class p(a,b) of the pure tensor.
- `presentation_universal`: For every Steinberg pairing c to A, there is exactly one f:P₂(F)→+A satisfying f(p(a,b))=c(a,b).
- `presentation_hom_ext`: Maps P₂(F)→+A agreeing on every p(a,b) agree.
- `presentation_relations`: The pairing p is bilinear and p(a,b)=0 if a+b=1.

**Checks.**

- P₂(F₂)=0 because F₂ˣ is trivial, before using Matsumoto.
- p(1/2,1/2)=0 over ℚ because the entries sum to one.
- Over ℝ, p(-1,-1) is nonzero because the sign pairing descends and sends it to 1 in ℤ/2.

*Needs:* §5.1; Mathlib `TensorProduct.lift`; Mathlib `Submodule.liftQ`; Mathlib `Submodule.span`.

**The degree-two tensor realization.** Set T₂(F)=U⊗ℤU, R₂(F)=spanℤ{a⊗b : a,b∈F× and a+b=1 in F}, and Q₂(F)=T₂(F)/R₂(F). Let symbol(a,b) be the quotient class of a⊗b. For every abelian group A, evaluation on symbols identifies Homℤ(Q₂(F),A) with bilinear maps U×U→A annihilating these complementary-unit tensors. (Weibel, Definition III.7.1, Theorem III.6.1, pp. 245, 231.)

Provide the following API.

- `SymbolTensor`: T₂(F)=Additive Fˣ⊗ℤAdditive Fˣ.
- `steinbergRelations`: R₂(F) is the ℤ-span of a⊗b with a+b=1.
- `SymbolGroup`: Q₂(F)=T₂(F)/R₂(F).
- `symbol`: For units a,b, symbol(a,b) is their tensor class.
- `symbol_mul_left`: symbol(ab,c)=symbol(a,c)+symbol(b,c).
- `symbol_mul_right`: symbol(a,bc)=symbol(a,b)+symbol(a,c).
- `symbol_steinberg`: If a+b=1 in F then symbol(a,b)=0.
- `symbol_one_left`: symbol(1,a)=0.
- `symbol_one_right`: symbol(a,1)=0.
- `symbol_inv_left`: symbol(a⁻¹,b)=−symbol(a,b).
- `universal`: Every bilinear complementary-zero pairing factors through a unique linear map Q₂(F)→A.
- `hom_ext`: Two linear maps out of Q₂(F) agreeing on all symbols are equal.
- `map_exists`: A field map induces a unique linear map sending symbols to symbols of mapped units; the maps respect identity and composition.

*Checks.*

- symbol(1,a)=0 for any field and unit a.
- symbol(a,b)=0 when a+b=1, with both entries units.
- symbolℝ(−1,−1)≠0; the presentation is not the exterior square of ℝ×.
- There exists a linear map Q₂(ℝ)→ℤ/2 whose value on symbolℝ(−1,−1) is 1 and whose value on every complementary-unit symbol is 0. A zero or exterior-square presentation fails this check.
- Q₂(𝔽₃) is trivial.
- symbol𝔽₂(a,a)=0 for every unit a.

*Needs:* Mathlib `TensorProduct.lift`; Mathlib `Submodule.liftQ`; Mathlib `Additive`.

### 5.3 Integral symbol identities

Every Steinberg pairing satisfies c(a,-a)=0, c(a,b)=-c(b,a), c(a,a)=c(a,-1), and 2c(a,a)=0. In characteristic two c(a,a)=0. The assertion c(a,a)=0 is false for general integral coefficients. (Weibel, III.5.10.2–5.10.4; III.6.1, pp. 225, 231; Matsumoto, §5, Proposition 5.7(a),(c), pp. 28–29.)

**Checks.**

- No division by 1-a occurs in the a=1 branch.
- The real sign pairing has c(-1,-1)=1, disproving integral alternation.
- Characteristic-two diagonal vanishing is stated separately from skew-symmetry.

*Needs:* §5.1.

**Field-only proof of the symbol sign identities.** For any bilinear pairing c:F××F×→A into an abelian group with c(a,1−a)=0 for a≠0,1, one has c(a,−a)=0, c(a,b)=−c(b,a), c(a,a)=c(a,−1), and 2c(a,a)=0. In characteristic two c(a,a)=0. The statement applies to the classical symbol of §6.4 and to the tensor realization, without a general-ring localization theorem. (Weibel, Discussion following Theorem III.6.1, Definition III.7.1, pp. 231, 245.)

F is a commutative field; A is an abelian group; c is bilinear in multiplicative units and annihilates complementary units.

*Checks.*

- No assumption that 1−a is a unit is made when a=1; that case has its own normalization argument.
- Over ℝ the square c(−1,−1) need not vanish.
- The proof does not use Matsumoto injectivity or residues.

*Needs:* §5.2.

### 5.4 Milnor K-theory of a field

For a field F form the tensor algebra of the multiplicative group written additively, with the degree-one element attached to a nonzero x written l(x). Define the graded ring K^M of F as the quotient of that tensor algebra by the two-sided ideal generated by the homogeneous elements l(x) tensor l(one minus x) with x different from zero and one. The Milnor K-group in degree n is the degree-n part, presented by symbols that are multiplicative in each entry and vanish when two consecutive entries sum to one. Degree zero is the integers and degree one is the multiplicative group written additively. When an index n−1 occurs at n=0 in the residue algebra, K⁽ᴹ⁾_j(F)=0 for j<0. (Weibel, III.7.1, p. 245.)

`Suggested.lean` declares `milnorRel`, `MilnorK`, `MilnorK.ofUnit` and `MilnorK.symbol`, with `MilnorK.symbol_perm` and `MilnorK.symbol_eq_zero_of_finite`.

All tensor products are over the integers.

Provide the following API.

- `MilnorK`: The graded ring, and its degree-n part.
- `MilnorK.symbol`: The symbol of an n-tuple of nonzero elements.
- `MilnorK.symbol_mul`: Multiplicativity in each entry.
- `MilnorK.symbol_steinberg`: Vanishing when two consecutive entries sum to one.
- `MilnorK.zero`: Degree zero is the integers.
- `MilnorK.one`: Degree one is the unit group written additively.
- `MilnorK.map`: Functoriality in the field.
- `MilnorK.hom_ext`: Graded ring maps agreeing on degree-one units are equal, since products of these generate.
- `MilnorK.lift`: A homomorphism F× -> degree-one elements of a graded target that kills every Steinberg product extends uniquely to a graded ring map.
- `MilnorK.map_id_comp`: Field maps induce graded maps respecting identity and composition on every symbol.
- `MilnorK.symbol_product`: Concatenating two tuples gives the product of their symbols with degree addition.

**Checks.**

- Degree zero is the integers and degree one is the unit group.
- For a finite field every degree at least two vanishes.
- The quotient is graded, because the ideal is generated in a single degree.
- Permuting entries multiplies a symbol by the permutation sign, as a theorem derived from degree-two skew-symmetry. Repeated entries are retained: over ℝ, {−1,−1} is nonzero, so this is not an exterior-algebra quotient.

*Needs:* Mathlib `TensorAlgebra`; Mathlib `Additive`; Mathlib `RingQuot`; Mathlib `Units`.

### 5.5 Homogeneity of the two-sided Steinberg ideal

In the tensor-algebra construction of §5.4, let T=TensorAlgebra ℤ U, T_d its homogeneous pieces, and J the least two-sided ideal containing ι(a)ι(b) for a+b=1. Every homogeneous component of every z∈J lies in J. Moreover J∩T₀=J∩T₁=0, and J∩T₂ is exactly the ℤ-span of the Steinberg degree-two products. (Weibel, III.7.1, p. 245.)

**Checks.**

- Use the TensorAlgebra.gradedAlgebra instance, not a new tensor grading.
- Left and right multiplication by degree-one tensors preserve the ideal and raise the relation degree to three.
- Degree-zero and degree-one embeddings into T/J are injective.

*Needs:* §5.2; §5.4; Mathlib `TensorAlgebra.gradedAlgebra`; Mathlib `TwoSidedIdeal`; Mathlib `RingCon.mk'`; Mathlib `TensorAlgebra.equivDirectSum`; Mathlib `PiTensorProduct.isEmptyEquiv`.

**The homogeneous Steinberg quotient bridge.** In the tensor algebra of U with its grading, identify the degree-n module T_n with U⊗ℤ⋯⊗ℤU (n factors) using TensorAlgebra.equivDirectSum. For the ungraded Steinberg ring quotient of §5.4, its relation module R_n is the sum, over i+j=n−2, of images of T_i⊗R₂⊗T_j under concatenation; R₀=R₁=0. Construct canonical equivalences K⁽M⁾_n(F)≅T_n/R_n compatible with concatenation and field maps, including K⁽M⁾₂(F)≅Q₂(F). The natural map from the direct sum of these quotients to the ungraded ring quotient is an additive equivalence. (Weibel, Definition III.7.1, p. 245.)

n is a natural number; the generating relations have degree exactly two.

Provide the following API.

- `MilnorK.degreePresentation`: K⁽M⁾_n(F)≃ₗ[ℤ]T_n/R_n, sending a symbol to its pure tensor class.
- `MilnorK.degreeTwoEquiv`: K⁽M⁾₂(F)≃ₗ[ℤ]Q₂(F), with positive symbol normalization.
- `MilnorK.relationComponent`: I∩T_n=R_n.
- `MilnorK.gradedQuotientEquiv`: The direct sum of degree quotients is the underlying additive group of the tensor-algebra ring quotient.
- `MilnorK.concat_quotient`: Multiplication of pure symbol classes is concatenation, and R_iT_j+T_iR_j⊆R_{i+j}.
- `MilnorK.degreePresentation_natural`: Every field map commutes with the degree presentation and with the degree-two equivalence.

*Checks.*

- The degree-zero component and its multiplication are canonically ℤ; 1≠0.
- The degree-one symbol class identifies K⁽M⁾₁(F) with Additive Fˣ and sends the unit 1 to zero.
- degreeTwoEquiv({a,b})=symbol(a,b).
- For a free rank-two module with basis x,y, x⊗y−y⊗x≠0 before imposing relations; a commutative ideal quotient cannot supply this bridge.

*Needs:* §5.2; Mathlib `TensorAlgebra`; Mathlib `TensorAlgebra.gradedAlgebra`; Mathlib `TensorAlgebra.equivDirectSum`; Mathlib `RingQuot`.

### 5.6 Milnor quotient grading and symbol API

Refine the Milnor ring Kᴹ(F)=T/J by equipping it with the ℕ-grading whose degree-d piece is the image of T_d under the congruence quotient. The direct sum of these pieces maps isomorphically to Kᴹ(F). Define n-symbols as products of the degree-one unit classes; they generate degree n, are multilinear and vanish when consecutive entries sum to one. (Weibel, III.7.1, p. 245.)

Provide the following API.

- `milnor_gradedAlgebra`: The images of T_d form an ℕ-graded ℤ-algebra decomposition of the Milnor ring.
- `milnor_symbol_mem_degree`: The product {a₁,…,aₙ} lies in degree n; the empty symbol is 1 in degree zero.
- `milnor_symbol_mul`: Multiplying an i-symbol and a j-symbol concatenates their lists, in that order.
- `milnor_symbol_multilinear`: Multiplication of one unit entry becomes addition of two symbols.
- `milnor_hom_ext`: Ring homomorphisms out of Kᴹ(F) are determined by the degree-one unit classes.
- `milnor_low_degrees`: Degrees zero and one are ℤ and Additive Fˣ, with explicit maps and inverses.

**Checks.**

- For F₂ the constant 7 survives in degree zero and 1≠0 in Kᴹ(F₂).
- The one-entry symbol {1} is zero in degree one, whereas the empty symbol is the ring unit.
- For units a,b with a+b=1, the degree-four symbol {r,a,b,s} vanishes; imposing only a left-ideal relation would not justify the trailing s.
- {-1}²={-1,-1} is nonzero over ℝ, so the graded ring is not an exterior algebra.

*Needs:* §5.5; Mathlib `RingCon.mk'`; Mathlib `TensorAlgebra.gradedAlgebra`; Mathlib `TensorAlgebra.lift`; Mathlib `TensorAlgebra.equivDirectSum`; Mathlib `PiTensorProduct.isEmptyEquiv`; Mathlib `PiTensorProduct.subsingletonEquiv`.

### 5.7 Degree two equals the tensor-square presentation

There is a canonical additive equivalence Kᴹ₂(F)≃P₂(F) taking the two-entry Milnor symbol {a,b} to p(a,b). This is an equivalence of the two specified quotient constructions; it is independent of classical or Quillen K-theory. (Weibel, III.7.1 and III.6.1, pp. 245, 231.)

**Checks.**

- The equivalence sends {1/2,1/2} to zero over ℚ.
- Both maps are fixed on symbols; there is no arbitrary chosen isomorphism.

*Needs:* §5.2; §5.6; Mathlib `TensorAlgebra.equivDirectSum`; Mathlib `TensorPower.mulEquiv`; Mathlib `PiTensorProduct.subsingletonEquiv`.

### 5.8 Functorial maps on the Milnor presentation

For a field homomorphism f:F→E construct the graded ring map Kᴹ(f) induced by units a↦f(a). Its degree-two map corresponds under the tensor-square equivalences to p(a,b)↦p(f(a),f(b)); identity and composition are strict map equalities. (Weibel, III.7.1, p. 245; Matsumoto, §9, functorial observations (a),(b), p. 50.)

Provide the following API.

- `milnorFieldMap`: A graded ring homomorphism from the Milnor ring of F to that of E.
- `milnorFieldMap_symbol`: An n-symbol maps to the n-symbol of its images, with unchanged entry order.
- `milnorFieldMap_id`: The identity field map induces the identity ring map.
- `milnorFieldMap_comp`: For F→E→L the composite of induced maps equals the map of the composite.
- `milnorFieldMap_degreeTwo`: The degree-two square with the two tensor-square presentation maps commutes.

**Checks.**

- Under ℚ→ℝ, p(-1,-1) maps to p(-1,-1), detected by the real sign pairing.
- The identity of F₂ is the identity on degree zero ℤ, even though its degree-two group vanishes.
- The image of {a,b,c} is {f(a),f(b),f(c)}, not the reversed symbol, which would introduce a permutation sign.

*Needs:* §5.6; §5.7; Mathlib `TensorAlgebra.lift`.

### 5.9 A real symbol detecting the integral diagonal

Define ε:ℝˣ→ℤ/2 to be 1 on negative units and 0 on positive units. The function c∞(a,b)=ε(a)ε(b) is a Steinberg pairing. It descends to P₂(ℝ)→ℤ/2 and therefore detects the nonzero order-two class {-1,-1} in Milnor and classical K₂(ℝ). It also defines a graded map Kᴹ(ℝ)→(ℤ/2)[t] sending the degree-one class of a to ε(a)t. (Weibel, III.6.2.1; III.7.2(c), pp. 232, 245.)

F=ℝ and the coefficient target is ℤ/2.

Provide the following API.

- `realSignPairing`: The ℤ/2-valued function with value 1 exactly when both units are negative.
- `realSignPairing_isSteinberg`: The displayed function satisfies the pairing predicate.
- `realSignDetector`: The unique P₂(ℝ)→+ℤ/2 evaluating on symbols as realSignPairing.
- `realGradedSignDetector`: The map to (ℤ/2)[t] sends {a₁,…,aₙ} to (Π_i ε(a_i))t^n.

**Checks.**

- c∞(-1,-1)=1.
- c∞(2,-1)=0 and c∞(-1,1)=0.
- c∞(-1,2)=0 since the inputs sum to one.
- Its diagonal at -1 is nonzero, despite skew-symmetry in the additive group ℤ/2.

*Needs:* §5.1; §5.2; §5.3; §5.6; Mathlib `TensorAlgebra.lift`.

### 5.10 Skew-symmetry of Milnor symbols

Permuting Milnor-symbol entries multiplies by the permutation sign. Repeated-entry symbols are killed by 2 but can be nonzero integrally; in characteristic two a repeated adjacent pair vanishes because {a,a}={a,-1} and -1=1. (Weibel, III.7.1, p. 245; Weibel, III.6.3, p. 234.)

F is a field; the entries are nonzero.

**Checks.**

- A transposition changes the sign.
- A symbol with a repeated entry is two-torsion but not necessarily zero, which is the same caveat as in degree two.
- A square root of -1 is NOT sufficient for integral vanishing. In F=C(t), {t,t}={t,-1} has tame residue -1 at t=0 and is nonzero, although i belongs to F. In characteristic two it vanishes; modulo 2 it vanishes if -1 is a square.

*Needs:* §5.3; §5.4.

**Permutation signs without integral alternation.** In the Milnor ring, interchanging adjacent unit entries negates an n-symbol. A permutation π multiplies a symbol by sign(π). A consecutive repeated entry can be replaced by (a,-1); in characteristic two such a consecutive repeat vanishes. The sign rule alone does not make all repeated-entry symbols vanish integrally. (Weibel, III.7.1–7.2(c), p. 245.)

*Checks.*

- The degree-two equation is {a,a}={a,-1}, not zero.
- The ℝ symbol {-1,-1,-1} has a nonzero polynomial detector.

*Needs:* §5.3; §5.6; §5.7; §5.9.

### 5.11 Finite-field tensor-square vanishing

For a finite field F, P₂(F)=0 and Kᴹ₂(F)=0, independently of the classical comparison. Every Steinberg pairing from F to an abelian group is zero. (Weibel, III.6.1.1, p. 231.)

F is a finite field.

**Checks.**

- P₂(F₂)=P₂(F₃)=P₂(F₄)=0.
- No assertion that every skew pairing on a cyclic group is zero substitutes for the Steinberg relation.

*Needs:* §5.2; §5.3; §5.7; Mathlib `isCyclic_of_injective_ringHom`.

**The cyclic-unit symbol annihilator.** Suppose F× is cyclic with generator g and c:F××F×→A is a bilinear Steinberg pairing. If char F=2, or if there exist complementary units a,b whose exponents relative to g are both odd, then c(g,g)=0 and consequently c is identically zero. Every finite field satisfies one of these alternatives. (Weibel, Corollary III.6.1.1, Example III.7.2(a), pp. 231, 245.)

F a commutative field with cyclic units; c takes values in an abelian group and annihilates complementary units.

*Checks.*

- For q=3 take a=b=−1; the relation directly kills z.
- For q=2 normalization alone kills the symbol.
- This argument does not assert that all finite-field stable K₂ is symbol-generated without a proof.

*Needs:* §5.3; Mathlib `isCyclic_of_injective_ringHom`.

### 5.12 Milnor K-theory of finite fields

For a finite field Fq and n >= 2, K_n^M(Fq)=0. (Weibel, III.7.2(a), p. 245.)

Fq is a finite field. n >= 2.

**Checks.**

- K0^M(Fq)=Z is not covered.
- K1^M(Fq)=Fq× is not asserted zero.
- Degrees at least two vanish by generation from degree two.

*Needs:* §5.4; §5.11.

### 5.13 Divisibility and torsion in tensor quotients

Let p>0. If abelian groups U,V are p-divisible then multiplication by p on U⊗ℤV is bijective. If multiplication by p on an abelian group T is bijective and its subgroup R is p-divisible, then multiplication by p on T/R is bijective. These statements need no torsion-freeness assumption on U or V themselves. (Weibel, Proposition III.6.4.1, Exercise III.7.3, pp. 235, 257.)

p a positive integer; U,V,T abelian groups; R an additive subgroup or equivalently an ℤ-submodule of T.

**Checks.**

- Divisibility of a quotient alone does not rule out torsion.
- For p>1, Q/ℤ is a counterexample if the subgroup hypothesis is dropped from the quotient claim: ℤ is not p-divisible and Q/ℤ has nonzero p-torsion. For p=1 the multiplication map is always the identity.

*Needs:* Mathlib `TensorProduct.lift`; Mathlib `Submodule.liftQ`; Mathlib `rTensor_exact`.

### 5.14 Root factorization divides the homogeneous relation modules

For a prime p, assume every polynomial X^p−a with a∈F× splits into linear factors over F. Every relation module R_n from §5.5 is p-divisible. For n≥2, multiplication by p on T_n/R_n is bijective. Thus this proves the unique-divisibility statement for algebraically closed fields in exactly degrees n≥2. (Weibel, Proposition III.6.4.1, Exercise III.7.3, pp. 235, 257.)

F a field, p prime; every X^p−a for a nonzero splits over F; repeated roots are counted with multiplicity.

**Checks.**

- In characteristic p, use multiplicities, not a false assertion that there are p distinct roots.
- For algebraically closed F, the assertion is n≥2; it does not assert F× is uniquely divisible.

*Needs:* §5.5; §5.13.

**Milnor groups of algebraically closed fields.** For an algebraically closed field F and n >= 2, K_n^M(F) is uniquely divisible. In degree one F× is divisible but need not be uniquely divisible; degree zero is Z. (Weibel, III.7.2(b) and Exercise III.7.3, p. 245.)

F is algebraically closed. n >= 2.

*Needs:* §5.4.

### 5.15 The positive-entry subgroup over the real field

For n≥1 let D_n⊂K⁽M⁾_n(ℝ) be the ℤ-span of symbols with at least one strictly positive entry. Let e_n={−1,…,−1}. Then D_n is divisible, e_n has exact order two, and every class decomposes uniquely as εe_n+d with ε∈ℤ/2 and d∈D_n. The sign map sends a symbol to 1 in ℤ/2 exactly when all entries are negative, and its kernel equals D_n. For n=2 use the light realization realPositive⊂Q₂(ℝ). (Weibel, Example III.7.2(c), real symbol in Example III.6.2.1, pp. 245, 232.)

n≥1; the usual ordered field ℝ; entries are nonzero units.

Provide the following API.

- `MilnorK.realPositive`: D_n is the span of degree-n real symbols with a positive entry, n≥1.
- `MilnorK.realSign`: The additive sign map is 1 on all-negative symbols and 0 on all others.
- `MilnorK.realSign_kernel`: ker(realSign)=D_n.
- `MilnorK.realDecomposition`: K⁽M⁾_n(ℝ)≃+(ℤ/2)×D_n, sending e_n to (1,0).
- `MilnorK.realPositive_divisible`: For every integer m>0, multiplication by m on D_n is surjective.
- `realPositive`: The degree-two realization is the span in Q₂(ℝ) of symbol(a,b) with a>0 or b>0.
- `realPositive_divisible`: For m>0 multiplication by m on realPositive is surjective.
- `real_sign_exists`: The all-negative pairing descends to a linear sign map Q₂(ℝ)→ZMod 2 with kernel realPositive.
- `real_minus_one_nonzero`: symbolℝ(−1,−1)≠0.
- `real_decomposition`: Q₂(ℝ)≃ₗ[ℤ]ZMod 2×realPositive.
- `realPositive_contains`: A real symbol with a positive entry belongs to realPositive.
- `realPositive_excludes_minus_one`: symbolℝ(−1,−1)∉realPositive.

**Checks.**

- D₁ identifies with the positive real units; e₁ is the class of −1 and has order two.
- If a>0, then symbolℝ(a,b)∈realPositive for every b.
- symbolℝ(−1,−1)∉realPositive.
- Multiplication by two on realPositive is surjective.
- K⁽M⁾₀(ℝ)=ℤ is not (ℤ/2)⊕D₀; realDecomposition takes n≥1.

*Needs:* §5.3; §5.5.

**Milnor K-theory of the real field.** For n >= 1, K_n^M(R) is Z/2 generated by {-1,...,-1}, direct sum a divisible subgroup. As a graded ring, K_*^M(R)/2 is F2[epsilon], with epsilon of degree one. (Weibel, III.7.2(c), p. 245.)

n >= 1 for the group decomposition. The base field is R.

*Needs:* §5.4; §5.10.

### Examples

- {−1, −1} ≠ 0 in K₂ᴹ(ℝ): the sign pairing c(a, b) = 1 exactly when a, b < 0 detects it, so Milnor K-theory is not an exterior algebra.
- K₂ᴹ(𝔽₃) = 0 since {−1, −1} is killed by the Steinberg relation at a = b = −1; K₂ᴹ(𝔽₂) = 0 because 𝔽₂^× is trivial.
- In ℂ(t), {t, t} = {t, −1} has tame residue −1 at t = 0, so it is nonzero although −1 is a square.

### Dependencies

Mathlib tensor algebras, tensor products and quotients.

## Layer 6: Steinberg symbols and the monomial kernel

Steinberg symbols {r, s} = [h_ij(r), h_ik(s)] for commuting units of a ring, their bilinearity, skew-symmetry and the Steinberg identity, and Milnor's §9: the monomial subgroup W_n(A), its kernel C_n(A), generation of C_n(A) by finite-rank symbols for every commutative ring, and the theorem that for a field the whole kernel of St_n(F) → E_n(F) is monomial. Consequently K₂ of a field is generated by symbols and K₂(𝔽_q) = 0 without Matsumoto's theorem. The Bruhat cover St_n(F) = T·W·T and the unique ordered form of the upper unipotent subgroup are proved here for SL_n over a field.

### 6.1 The star product of commuting matrices

If two matrices of E(R) commute, lift them to St(R) and define their star product to be the commutator of the lifts, an element of K_2(R). The definition does not depend on the lifts, because two lifts differ by central elements. The star product is invariant under simultaneous conjugation by an element of GL(R), is skew-symmetric, and is bilinear. (Weibel, III.5 Steinberg symbols, p. 225.)

R is an associative unital ring; the two matrices lie in E(R) and commute.

Provide the following API.

- `starProduct`: The star product of two commuting elements of E(R).
- `starProduct_lift_indep`: It does not depend on the chosen lifts.
- `starProduct_conj`: Invariance under simultaneous conjugation by an element of GL(R).
- `starProduct_skew`: Skew-symmetry.
- `starProduct_mul_left`: For A1,A2,B in E(R), if each Ai commutes with B then (A1*A2) star B=(A1 star B)*(A2 star B). No mutual commutation of A1 and A2 is required.
- `starProduct_mul_right`: For A commuting with B1 and B2 in E(R), A star (B1*B2)=(A star B1)*(A star B2).

**Checks.**

- For A in E(R), A star A=1 using the same lift twice.
- Over Z in rank three, e_01(1) and e_12(1) do not commute; their lifted commutator maps to e_02(1), so it cannot be a K2-valued star input.
- Over Z, diag(-1,-1,1) star diag(-1,1,-1) is {-1,-1}, the nontrivial K2(Z) class once Layer 12 supplies that computation.
- For A1,A2 each commuting with B, the product rule holds; omit either commutation proof and the construction is ill-typed.

*Needs:* §2.9; §2.11; Mathlib `commutatorElement`; KTheoryLowDegrees Layer 6.

### 6.2 Weyl lift words

For i != j and a unit r, define w_ij(r)=x_ij(r)x_ji(-r^-1)x_ij(r). Its elementary image has block [[0,r],[-r^-1,0]] at coordinates i,j. (Weibel, III.5.10.1, p. 225.)

R is an associative unital ring; r and s are commuting units.

Provide the following API.

- `Steinberg.w`: The indexed word w_ij(r) for i != j.
- `Steinberg.w_toGL`: phi(w_ij(r)) has r,-r^-1 in the two off-diagonal positions.
- `Steinberg.w_map`: Unital ring homomorphisms preserve the indexed word and its elementary image.

**Checks.**

- w_01(1) has block [[0,1],[-1,0]].
- w_01(-1) has block [[0,-1],[1,0]].
- Over Q, w_12(2) has off-diagonal entries 2 and -1/2 in positions (1,2),(2,1), and entry 1 at (0,0).

*Needs:* §2.3; §2.5; Mathlib `Units`; Mathlib `Matrix.diag2_decompose`; Tau Ceti `Matrix.SpecialLinearGroup.diag2nUnit_decompose`.

### 6.3 Diagonal lift words

For i != j and a unit r, define h_ij(r)=w_ij(r)w_ij(-1). Its elementary image is diagonal with r,r^-1 in positions i,j. (Weibel, III.5.10.1, p. 225.)

R is an associative unital ring; r and s are commuting units.

Provide the following API.

- `Steinberg.hDiag`: For i != j and a unit r, define h_ij(r)=w_ij(r)w_ij(-1). Its elementary image is diagonal with r,r^-1 in positions i,j.
- `Steinberg.hDiag_toGL`: The image is diag(r,r^-1) on coordinates i,j.
- `Steinberg.hDiag_map`: Ring homomorphisms preserve h_ij(r), retaining the two indices.

**Checks.**

- h_01(1) has identity elementary image.
- Over Q, h_01(2) has diagonal image (2,1/2,1).
- Over Q, h_12(2) has diagonal image (1,2,1/2).

*Needs:* §6.2.

### 6.4 The Steinberg symbol

For commuting units r and s of a ring R define the Steinberg symbol as the star product of the diagonal matrix with r and r inverse at two coordinates with the diagonal matrix with s and s inverse at two coordinates chosen to overlap in exactly one index. Equivalently it is the commutator of the elements h_ij(r) and h_ik(s) of St(R), where w_ij(r) is the word x_ij(r) x_ji(minus r inverse) x_ij(r) and h_ij(r) is w_ij(r) w_ij(minus one). The symbol is skew-symmetric and bilinear. (Weibel, III.5.10 and III.5.10.1, p. 225.)

R is an associative unital ring; r and s are commuting units.

Provide the following API.

- `steinbergSymbol`: The symbol of two commuting units.
- `steinbergSymbol_eq_commutator`: It is the commutator of h_ij(r) and h_ik(s).
- `steinbergSymbol_one`: The symbol with a one entry is trivial.
- `steinbergSymbol_mul_left`: Bilinearity for a pairwise commuting triple r1,r2,s of units. Over a commutative ring the commuting hypotheses are automatic.
- `steinbergSymbol_skew`: Skew-symmetry.
- `steinbergSymbol_index_indep`: Independence of the chosen indices.
- `steinbergSymbol_map`: Unital ring homomorphisms preserve the commuting-unit symbol and its indexed commutator formula.

**Checks.**

- The symbol with a one entry is trivial.
- For the integers the symbol of minus one with itself is the nontrivial element of K_2(Z).
- The product rule holds for pairwise commuting units r1,r2,s; in a commutative field it has no extra condition.
- The symbol of a with itself is not trivial in general, which §6.9 computes.

*Needs:* §2.1; §2.5; §6.1; §6.2; §6.3; Mathlib `Matrix.diag2_decompose`; Tau Ceti `Matrix.SpecialLinearGroup.diag2nUnit_decompose`; Mathlib `Units`.

### 6.5 Field Weyl and diagonal lift calculus

Use the words w_ij(a)=x_ij(a)x_ji(-a⁻¹)x_ij(a) and h_ij(a)=w_ij(a)w_ij(-1). In St_n(F), n≥3, their conjugation on every root subgroup is the signed and rescaled matrix Weyl/torus action. In particular w_ij(a)⁻¹=w_ij(-a), h_ij(a)x_kl(t)h_ij(a)⁻¹=x_kl(d_k t d_l⁻¹), where d_i=a,d_j=a⁻¹ and all other d_k=1. (Steinberg, §6, Lemma 37(a)–(f), pp. 67–68; Weibel, Exercise III.5.8(a)–(e), p. 229.)

**Checks.**

- Rank two is excluded.
- At a=-1 the elementary image of h is diag(-1,-1); it is not the identity over ℚ.
- Disjoint root coordinates are fixed; adjacent parameters have the displayed scaling.

*Needs:* §2.1; §6.2; §6.3; Tau Ceti `TauCeti.transvectionUnit`; Tau Ceti `TauCeti.commutatorElement_transvectionUnit`; Tau Ceti `TauCeti.commutatorElement_transvectionUnit_reverse`.

**Weyl conjugation and commutator-symbol normalization.** For commutative F and pairwise distinct i,j,k in St_m(F), m≥3, w_ij(r)w_ij(−r)=1, w_ij(r)x_ij(s)w_ij(r)⁻¹=x_ji(−r⁻²s), and w_ij(r)x_ji(s)w_ij(r)⁻¹=x_ij(−r²s). After stabilization, or in a compatible central extension, the commutator convention of §6.4 gives {r,s}=h_ij(rs)h_ij(r)⁻¹h_ij(s)⁻¹=h_ij(r)h_ij(s)h_ij(rs)⁻¹. This fixes the positive normalization when comparing Matsumoto’s cocycle with the classical symbol. (Weibel, Exercises III.5.8–5.9, with the torus-factor order corrected, p. 229; Matsumoto, Lemma 5.4(c), p.26.)

r,s∈F× for torus expressions; the root parameter in conjugation can be any field element; m≥3.

*Checks.*

- The coefficient −r⁻²s is required in the opposite-root conjugation formula.
- The two inverse torus factors appear in order r then s; reversing them changes the result in general.
- No finite-rank kernel centrality is assumed from the stable centre theorem; the torus-defect equality is asserted stably or in an explicitly central extension.

*Needs:* §2.1; §6.2; §6.4.

### 6.6 Diagonal commutator equals the toral defect

In stable St(F), for distinct i,j,k and units a,b, the chosen classical symbol s(a,b)=[h_ij(a),h_ik(b)] equals c_ij(a,b)=h_ij(a)h_ij(b)h_ij(ab)⁻¹. The positive roots e_i-e_j and e_i-e_k have Cartan pairing +1. The corresponding simple adjacent roots instead have pairing -1; their toral commutator is c(a,b)⁻¹. (Matsumoto, §5, Lemma 5.4(a)–(d), p. 26; Weibel, III.5.10.1 and Exercise 5.9, p. 225.)

**Checks.**

- The normalization is the displayed commutator, not its inverse.
- The matrix image of c_ij is 1, but that fact alone is not used to conclude c_ij=1.
- The comparison agrees with Matsumoto’s cocycle for the +1 root overlap.

*Needs:* §2.11; §6.4; §6.5.

### 6.7 The Steinberg identity

If r and 1-r are units of an associative unital ring, the Steinberg symbol {r,1-r} is 1. (Weibel, III.5.10.2, III.5.10.3 and III.5.10.4, p. 225.)

R is an associative unital ring; r is a unit, and for the first statement one minus r is also a unit.

**Checks.**

- Both r and 1-r must be units.
- The two entries commute because (1-r)r=r(1-r).
- No symbol with a zero entry is constructed.

*Needs:* §2.1; §6.4.

### 6.8 The symbol of a unit and its negative

For every unit r of an associative unital ring R, {r,-r}=1, without requiring 1-r to be invertible. (Weibel, III.5.10.3-.4, p. 226.)

R is an associative unital ring; r is a unit, and for the first statement one minus r is also a unit.

*Needs:* §6.4; §6.7.

### 6.9 Skew-symmetry, and the correct value of the symbol of a unit with itself

The Steinberg symbols are skew-symmetric: the symbol of a with b times the symbol of b with a is trivial. The symbol of a with itself is the symbol of a with minus one, which is an element of order dividing two; it is not trivial in general. Asserting that the symbol of a with itself vanishes integrally is an error. (Weibel, III.6.1, p. 231.)

R is an associative unital ring; a and b are commuting units.

**Checks.**

- For the integers the symbol of minus one with itself is the nontrivial element of K_2(Z), so the symbol of a unit with itself is not always trivial.
- For a finite field of even order the symbol of a with itself is trivial, because minus one is one there.
- Skew-symmetry gives the permutation-sign law of Milnor K-theory; it does not force repeated-entry symbols to vanish integrally.

*Needs:* §6.4; §6.7; §6.8.

### 6.10 The explicit classical symbol is a pairing

The classical symbol s:Fˣ×Fˣ→Additive K₂(F) is a Steinberg pairing. It is independent of stabilizing coordinates and is natural under field homomorphisms. Over a field this needs no general-ring Whitehead conjugation argument. (Weibel, III.5.10.1–5.10.2, p. 225; Matsumoto, §5, Lemma 5.4 and Lemma 5.6, pp. 26–28.)

**Checks.**

- The Steinberg relation has two unit inputs and does not assert a symbol at zero.
- The case a=1 is addressed by §5.3, rather than a nonexistent unit 1-a.

*Needs:* §2.5; §5.1; §6.6.

### 6.11 The monomial subgroup W_n(A) of the Steinberg group and its kernel C_n(A)

Let A be a commutative ring and n ≥ 3, let St_n(A) be the finite-rank Steinberg group of §2.1 and φ_n : St_n(A) → E_n(A) ⊆ GL_n(A) its elementary map (§2.3). The monomial subgroup W_n(A) ⊆ St_n(A) is the subgroup generated by the Weyl lift words w_ij(u) = x_ij(u) x_ji(−u⁻¹) x_ij(u), for i ≠ j and u ∈ A^× (§6.2). It contains every diagonal lift h_ij(u) = w_ij(u) w_ij(−1) (§6.3). The monomial kernel is C_n(A) = W_n(A) ∩ ker φ_n. Its image is described by Milnor's Lemma 9.1: φ_n(W_n(A)) is exactly the group of monomial matrices of determinant one, the matrices P_π·diag(v_1, …, v_n) with π a permutation, P_π e_k = e_{π(k)}, every v_k ∈ A^× and sign(π)·v_1⋯v_n = 1. (Milnor, §9, opening definitions and Lemma 9.1, p. 71.)

A is a commutative ring: the determinant condition and the diagonal-lift calculus use commutativity. n ≥ 3, the range in which Layers 1–4 defines St_n(A); i, j are distinct indices in {1, …, n} and u ranges over A^×.

Provide the following API.

- `Steinberg.monomialSubgroup`: W_n(A): the subgroup of St_n(A) generated by all w_ij(u), i ≠ j, u ∈ A^×.
- `Steinberg.w_mem_monomialSubgroup`: w_ij(u) ∈ W_n(A).
- `Steinberg.h_mem_monomialSubgroup`: h_ij(u) ∈ W_n(A).
- `Steinberg.monomialKernel`: C_n(A) = W_n(A) ⊓ ker φ_n.
- `Steinberg.mem_monomialKernel_iff`: z ∈ C_n(A) ↔ z ∈ W_n(A) ∧ φ_n z = 1.
- `Steinberg.toElementary_monomialSubgroup`: Lemma 9.1: the image of W_n(A) in GL_n(A) is the set of permutationGL π · diagGL v with sign(π)·∏ v_k = 1.
- `Steinberg.monomialSubgroup_map`: For f : A →+* B, Steinberg.map f carries W_n(A) into W_n(B) and C_n(A) into C_n(B).
- `Steinberg.monomialSubgroup_stabilise`: Stabilisation carries W_n(A) into W_{n+1}(A) and C_n(A) into C_{n+1}(A).
- `Steinberg.monomialSubgroup_int`: For n ≥ 3, W_n(ℤ) is generated by the w_ij(1); it is IntegerSteinbergModel.monomialSubgroup of §12.6.

**Checks.**

- Over ℤ with n = 3, φ_3(w_12(1)) is the matrix with rows (0, 1, 0), (−1, 0, 0), (0, 0, 1). Its square is diag(−1, −1, 1) = φ_3(h_12(−1)) and its fourth power is 1.
- Over 𝔽₂ the only unit is 1 and −1 = 1, so φ_3(w_ij(1)) is the permutation matrix of the transposition (i j), and φ_3(W_3(𝔽₂)) is the group of the six 3 × 3 permutation matrices.
- Over 𝔽₅, h_12(2) ∈ W_3(𝔽₅) and φ_3(h_12(2)) = diag(2, 3, 1), which is not a signed permutation matrix. A definition that generates W by the w_ij(±1) alone, as the integer model does, is too small for a general ring.
- Over 𝔽₃, φ_3(W_3(𝔽₃)) has 3!·2² = 24 elements: the 3 × 3 monomial matrices of determinant one.
- For n ≥ 3, W_n(ℤ) equals the monomial subgroup of §12.6, generated by the w_ij(1).

*Needs:* §2.1; §2.3; §2.5; §6.2; §6.3; Mathlib `Subgroup.closure`; Mathlib `Matrix.det_permutation`; Tau Ceti `TauCeti.permutationGL`; Tau Ceti `TauCeti.diagGL`; Tau Ceti `TauCeti.det_diagGL`.

### 6.12 Conjugation by the monomial subgroup permutes the root generators (Milnor 9.2–9.5)

**Source gap.** Milnor’s full seven-case root-conjugation proof has not been read from an accessible cleared copy. The target below retains the required formulas and generality; its cited proof must be checked, rather than inferred from the field-only Bruhat calculation.

Let A be commutative and n ≥ 3. For w ∈ W_n(A) write φ_n(w) = P_π·diag(v_1, …, v_n) (§6.11). For i ≠ j, λ ∈ A and u ∈ A^×: (a) w x_ij(λ) w⁻¹ = x_{π(i)π(j)}(v_i λ v_j⁻¹); (b) w w_ij(u) w⁻¹ = w_{π(i)π(j)}(v_i u v_j⁻¹) and w h_ij(u) w⁻¹ = h_{π(i)π(j)}(v_i u v_j⁻¹)·h_{π(i)π(j)}(v_i v_j⁻¹)⁻¹; (c) w_ij(u)⁻¹ = w_ij(−u) and w_ij(u) = w_ji(−u⁻¹); (d) the subgroup H_n(A) generated by the h_ij(u) is normal in W_n(A); (e) C_n(A) lies in the centre of St_n(A). These are Milnor's Lemma 9.2, Corollaries 9.3 and 9.4 and Lemma 9.5. (Milnor, Lemma 9.2 with its seven-case proof, pp. 71–73; Milnor, Corollaries 9.3 and 9.4, pp. 71–72; Milnor, Lemma 9.5 and the example before it, p. 73.)

A is commutative and n ≥ 3; i ≠ j, λ ∈ A, u ∈ A^×. P_π e_k = e_{π(k)} and φ_n(w) = P_π D with D = diag(v_1, …, v_n); this factorisation exists by §6.11.

**Checks.**

- Over ℤ: w_12(1) x_12(λ) w_12(1)⁻¹ = x_21(−λ) and w_12(1) x_13(λ) w_12(1)⁻¹ = x_23(−λ).
- w_12(1)⁴ = h_12(−1)⁻² lies in C_n(ℤ), so it is central in St_n(ℤ).
- Over a field, the same-root and opposite-root cases agree with §6.5.

*Needs:* §2.1; §2.3; §6.2; §6.3; §6.11; Mathlib `Subgroup.center`; Mathlib `Subgroup.Normal`; Tau Ceti `TauCeti.transvectionUnit`; Tau Ceti `TauCeti.transvectionUnit_injective`; Tau Ceti `TauCeti.permutationGL_mul_diagGL_mul_inv`.

### 6.13 The finite-rank Steinberg symbol {u, v}_n in C_n(A)

Let A be commutative and n ≥ 3. For u, v ∈ A^× and pairwise distinct indices i, j, k put {u, v}_n = [h_ij(u), h_ik(v)] = h_ij(u) h_ik(v) h_ij(u)⁻¹ h_ik(v)⁻¹ ∈ St_n(A). Then: (a) {u, v}_n = h_ik(uv) h_ik(u)⁻¹ h_ik(v)⁻¹ (Lemma 9.6); (b) {u, v}_n ∈ C_n(A), so it is central; (c) it does not depend on the triple (i, j, k); (d) it is bimultiplicative and skew-symmetric, {v, u}_n = ({u, v}_n)⁻¹ (Lemma 9.7); (e) {u, 1 − u}_n = 1 when u and 1 − u are units, and {u, −u}_n = 1 (Lemma 9.8); (f) stabilisation sends {u, v}_n to {u, v}_{n+1}, and its image in the stable group St(A) is the Steinberg symbol {u, v} of §6.4; (g) a ring map f sends {u, v}_n to {f(u), f(v)}_n. Milnor calls this the sharper, finite-rank meaning of the symbol. (Milnor, Lemmas 9.6 and 9.7, pp. 73–74; Milnor, Lemma 9.8 and its proof, pp. 74–75; Milnor, Lemmas 8.1–8.2, pp. 63–64; Milnor, Theorem 10.1, p. 81.)

`Suggested.lean` declares `Steinberg.finiteRankSymbol` with `Steinberg.finiteRankSymbol_mul_left` and `Steinberg.finiteRankSymbol_one_sub`.

A is commutative and n ≥ 3; u, v ∈ A^×; i, j, k pairwise distinct. Commutators are [a, b] = aba⁻¹b⁻¹, the convention of §6.4 and of §6.5.

Provide the following API.

- `Steinberg.finiteRankSymbol`: {u, v}_n := [h_12(u), h_13(v)] at the standard triple (1, 2, 3).
- `Steinberg.commutator_h_eq_finiteRankSymbol`: For pairwise distinct i, j, k: [h_ij(u), h_ik(v)] = {u, v}_n.
- `Steinberg.finiteRankSymbol_eq_h`: For pairwise distinct i, j, k: {u, v}_n = h_ik(uv) h_ik(u)⁻¹ h_ik(v)⁻¹.
- `Steinberg.finiteRankSymbol_mem_monomialKernel`: {u, v}_n ∈ C_n(A); in particular it is central in St_n(A).
- `Steinberg.finiteRankSymbol_mul_left`: {uu′, v}_n = {u, v}_n {u′, v}_n.
- `Steinberg.finiteRankSymbol_mul_right`: {u, vv′}_n = {u, v}_n {u, v′}_n.
- `Steinberg.finiteRankSymbol_swap`: {v, u}_n = ({u, v}_n)⁻¹.
- `Steinberg.finiteRankSymbol_one_left`: {1, v}_n = 1 and {u, 1}_n = 1.
- `Steinberg.finiteRankSymbol_one_sub`: If u and 1 − u are units, {u, 1 − u}_n = 1.
- `Steinberg.finiteRankSymbol_neg`: {u, −u}_n = 1 for every unit u.
- `Steinberg.finiteRankSymbol_stabilise`: Stabilisation sends {u, v}_n to {u, v}_{n+1}; the image in St(A) is steinbergSymbol u v of §6.4.
- `Steinberg.finiteRankSymbol_map`: For f : A →+* B, Steinberg.map f {u, v}_n = {f u, f v}_n.
- `Steinberg.finiteRankSymbol_neg_one_neg_one_int`: Over ℤ, {−1, −1}_n = w_12(1)⁴.

**Checks.**

- Over ℤ, {−1, −1}_3 = h_13(−1)⁻² = w_12(1)⁴, the element (x_12 x_21⁻¹ x_12)⁴ of Milnor's Theorem 10.1.
- {1, v}_n = 1, because h_ij(1) = 1.
- The commutator [h_12(−1), h_12(−1)] is trivially 1, whereas {−1, −1}_3 ≠ 1 in St_3(ℤ), since its stable image is detected by the real sign symbol. A definition by a commutator with a repeated index pair is wrong.
- Under stabilisation, {u, v}_n is Layers 5–8's Steinberg symbol {u, v}. Over ℝ, {−1, −1}_3 maps to the class that §12.5 sends to −1.
- φ_n({u, v}_n) = 1, because the diagonal matrices diag(u, u⁻¹, 1) and diag(v, 1, v⁻¹) commute.

*Needs:* §2.1; §2.3; §2.5; §6.3; §6.4; §6.7; §6.11; §6.12; Mathlib `commutatorElement`; Mathlib `Subgroup.center`.

### 6.14 Steinberg's theorem: the monomial kernel C_n(A) is generated by symbols (Milnor 9.11)

**Source gap.** The full arbitrary-commutative-ring monomial-kernel proof in Milnor, Theorem 9.11, has not been obtained. Field symbol generation and semilocal generation do not supply this theorem for ℤ.

Let A be a commutative ring and n ≥ 3. The monomial kernel C_n(A) = W_n(A) ∩ ker φ_n is the subgroup generated by the finite-rank symbols {u, v}_n, u, v ∈ A^× (Milnor's Theorem 9.11, due to Steinberg). In particular C_n(A) is abelian and central in St_n(A), and the description is compatible with stabilisation and with ring maps. For A = ℤ, C_n(ℤ) is generated by {−1, −1}_n = w_12(1)⁴ and has at most two elements. (Milnor, Theorem 9.11 (statement p. 76, proof pp. 77–78); Milnor, Lemma 9.10, p. 76; Milnor, §9 opening sentence, p. 71.)

A is commutative and n ≥ 3. The theorem concerns W_n(A) ∩ ker φ_n only. That the whole kernel of φ_n lies in W_n is a separate statement: §6.17 proves it for fields, and §12.8 for ℤ.

**Checks.**

- Over ℤ, C_3(ℤ) ⊆ {1, w_12(1)⁴}. With §12.8 this bounds K₂(ℤ), which is its use in §12.9.
- Over a finite field, together with §6.13 (d), (e) and the cyclic-annihilator argument (§5.11), C_n(𝔽_q) = 1: Milnor's Corollary 9.9.
- The reduction modulo H uses only the permutation part of φ_n: for a nonzero ring A, W_n(A)/H_n(A) maps onto the symmetric group, and the word reduction shows that this map has trivial kernel.
- For the zero ring the Steinberg group is trivial; no permutation quotient is asserted in that case.

*Needs:* §2.1; §2.3; §2.5; §5.11; §6.3; §6.11; §6.12; §6.13; Mathlib `Subgroup.closure`; Mathlib `Subgroup.center`; Tau Ceti `TauCeti.diagGL`.

### 6.15 The upper unipotent subgroup T_n(A) maps isomorphically onto U_n(A) (Milnor 9.14)

Let A be a commutative ring and n ≥ 3, and let T_n(A) ⊆ St_n(A) be the subgroup generated by the x_ij(λ) with i < j. Every element of T_n(A) is a product ∏_{i<j} x_ij(λ_ij), with the factors in lexicographic order of (i, j) and uniquely determined λ_ij ∈ A. Consequently φ_n restricts to an isomorphism of T_n(A) onto the upper unitriangular group U_n(A) (Tau Ceti's upperUnitriangularGroup). Moreover, for each i < n the subgroup T′_i generated by the x_kl(μ), k < l, (k, l) ≠ (i, i + 1), is normal in T_n(A), and T_n(A) = x_{i,i+1}(A)·T′_i. (Milnor, Lemma 9.14, pp. 78–79.)

A is commutative and n ≥ 3; the order on pairs (i, j), i < j, is lexicographic.

Provide the following API.

- `Steinberg.upperUnipotent`: T_n(A) is the subgroup generated by x_ij(a) with i < j.
- `Steinberg.upperUnipotentComplement`: For i < n, T′_i is generated by all positive roots except (i, i+1); T′_i is normal in T_n(A).
- `Steinberg.orderedUpperProduct`: A family (a_ij) for i < j gives the lexicographically ordered product in T_n(A). Every element is obtained uniquely.
- `Steinberg.toElementary_upperUnipotent`: The restriction of φ_n is a group isomorphism T_n(A) ≃ U_n(A), with U_n(A) Tau Ceti’s upperUnitriangularGroup.
- `Steinberg.upperUnipotent_ext`: Elements of T_n(A) with equal elementary images are equal; their unique ordered coordinates agree.
- `Steinberg.upperUnipotent_map`: A ring map sends ordered coordinates to their images and carries T_n and T′_i into their counterparts. Identity and composition hold on generators.
- `Steinberg.upperUnipotent_simpleRoot_factor`: For fixed i, every t ∈ T_n(A) is x_{i,i+1}(a)t′ with unique a ∈ A and t′ ∈ T′_i; a is the (i,i+1) entry of φ_n(t).

**Checks.**

- Over ℤ, x_12(1)x_13(0)x_23(1) has (1,3) entry 1. Replacing ordered coordinates by raw matrix entries misses this cross term.
- Over ℤ, [x_12(1),x_23(1)] = x_13(1) ≠ 1; the positive-root subgroup is not a product with coordinatewise addition.
- For n=3 and i=1, T′_1 consists of x_13(b)x_23(c), with (1,2) entry zero. It contains x_13(1), and excludes x_12(1) over ℤ.
- For the zero ring both T_n(A) and U_n(A) are trivial, and the unique ordered parameter family is zero.

*Needs:* §2.1; §2.3; Tau Ceti `TauCeti.upperUnitriangularGroup`; Tau Ceti `TauCeti.UpperUnitriangularGroup.ext`; Tau Ceti `TauCeti.transvectionUnit`; Tau Ceti `TauCeti.commutatorElement_transvectionUnit`; Tau Ceti `TauCeti.commute_transvectionUnit`.

### 6.16 For a field, St_n(F) = T·W·T (Milnor 9.15)

Let F be a field and n ≥ 3. Every element of St_n(F) lies in T_n(F)·W_n(F)·T_n(F), where T_n(F) is the upper unipotent subgroup of §6.15 and W_n(F) the monomial subgroup. (Milnor, Lemma 9.15 and its proof, pp. 79–80.)

F is a commutative field and n ≥ 3. Milnor states the lemma for skew fields as well; it is used here for fields only.

**Checks.**

- The matrix shadow is the Bruhat decomposition SL_n(F) = ⋃ U·N·U, and the upper-triangular monomial matrices are diagonal (tauceti:TauCeti.UpperTriangularGroup.mem_diagonalTorus_of_mem, over fields with a unit other than 1).
- For n = 3 and F = 𝔽₂, every element of St_3(𝔽₂) is t₁ w t₂ with t₁, t₂ upper unipotent and w in the group generated by the w_ij(1).
- Only cases 1–3 occur, and case 2 needs λ invertible: the lemma is stated for fields.

*Needs:* §2.1; §6.2; §6.11; §6.12; §6.15.

### 6.17 For a field, the whole Steinberg kernel is monomial and generated by symbols (Milnor 9.12)

Let F be a field and n ≥ 3. The kernel of φ_n : St_n(F) → E_n(F) is contained in W_n(F), hence equals C_n(F). So it is central in St_n(F) and is generated by the finite-rank symbols {u, v}_n (§6.14): St_n(F) → E_n(F) is a central extension whose kernel is generated by symbols, for every n ≥ 3. Passing to the colimit, K₂(F) is generated by the stable Steinberg symbols {u, v} (Milnor's Theorem 9.12 and Corollary 9.13); this is the field clause of §6.19. (Milnor, Theorem 9.12 (statement p. 78, proof p. 80); Milnor, Corollary 9.13 and the remark after it, p. 78; Weibel, Theorem III.5.10.5 and the sentence before it, p. 226.)

F is a commutative field and n ≥ 3. For skew fields Milnor proves the containment of the kernel in W_n but not generation by symbols, which needs commutativity (§6.14). The field case is stated here; see the source issue K2SymbolsBrauer/E-T5-division-ring-attribution.

**Checks.**

- For F = 𝔽_q every finite-rank symbol is 1, by §6.13 (d), (e) and the cyclic-annihilator argument. So St_n(𝔽_q) → E_n(𝔽_q) is an isomorphism for n ≥ 3, and K₂(𝔽_q) = 1 (Milnor Corollaries 9.9 and 9.13), with no appeal to Matsumoto's theorem.
- For F = ℝ the kernel is nontrivial: {−1, −1}_3 is a nontrivial central element of St_3(ℝ), detected after stabilisation by the real sign symbol.
- Its stable consequence is the field clause of §6.19.

*Needs:* §2.3; §2.5; §5.11; §6.11; §6.12; §6.13; §6.14; §6.15; §6.16; Tau Ceti `TauCeti.UpperTriangularGroup.mem_diagonalTorus_of_mem`; Tau Ceti `TauCeti.upperUnitriangularGroup`.

### 6.18 Lifted Bruhat reduction and complete toral relations

For n≥3 and any field F, quotient St_n(F) by the normal closure of the defects h_ij(a)h_ij(b)h_ij(ab)⁻¹. The map from this quotient to SL_n(F) is an isomorphism. In the quotient, Bruhat words reduce to u·h·w·v, with ordered positive-root products u,v, simple-coroot diagonal word h, and a chosen signed permutation representative w. An element mapping to the identity reduces to the identity; no uniqueness of both outer unipotent factors is claimed. (Steinberg, §6, Lemmas 36–38 and Theorem 8(b), pp. 66–70; Matsumoto, §5, Lemma 5.3, pp. 24–25.)

**Checks.**

- The result includes n=3 over F₂ and F₃; it does not assert universal centrality in that rank.
- Injectivity is proved through the Bruhat reduction, not from faithfulness of an already defined matrix action.

*Needs:* §2.1; §6.5; ReductiveGroups Layer 7; RootSystems Layer 3.

### 6.19 Symbols generate the stable field kernel

The additive subgroup generated by s(a,b) is all of K₂(F), for every field F. This follows by stabilizing the kernel-generation argument for fields in finite rank of §§6.17–6.18. (Steinberg, §6, Theorem 8(b), pp. 66, 69–70; Weibel, III.5.10.5, p. 226.)

**Checks.**

- Every stable kernel element has a displayed finite sum of symbols.
- No claim about finite-rank universality follows from this stable result.

*Needs:* §2.5; §2.9; §2.11; §6.6; §6.18.

**Steinberg symbols generate K_2 of a semilocal ring.** Steinberg symbols generate K₂(R) for commutative fields and for commutative local or semilocal rings. This statement does not extend the commuting-unit symbols of §6.4 to a generating family for an arbitrary division ring: the division-ring statement retained in §6.17 is containment of the kernel in the monomial subgroup. The commutativity restriction is essential to the cited local and semilocal extension. (Dennis–Stein, Corollary 2.2, p.287, and Theorem 2.7 with proof, pp.292–293; Weibel, III.5.10.5, p.226.)

R is a commutative field or a commutative local or semilocal ring. No lower bound on residue-field cardinalities is imposed.

Use the surjection to the product of residue fields and Corollary 2.2 to reduce to the older relative kernel generated by P(a,q), q∈Jac(R). Modulo unit symbols the relations of Proposition 1.1 give additivity in a, P(a,q)=0 for a a unit, P(p,q)=0 for p∈Jac(R), and P(ab,q)=P(a,bq)+P(b,aq). Write R/Jac(R)=𝔽₂^k×S with S a product of fields different from 𝔽₂. Adding units reduces a to a lift of (x,0), whence 2a and a²+a lie in Jac(R). The relations give 2P(a,aq)=0 and P(a,q)=−2P(a,aq)=0. Thus the relative generators vanish modulo unit symbols. This uses the older kernel only as a generation argument for absolute K₂; it does not identify the homotopy-fibre relative K₂ of §13.8.

*Checks.*

- For a field the symbols generate, which Matsumoto's theorem then presents.
- For a general commutative ring generation is not asserted.
- The Dennis–Stein symbols of Layer 13 are introduced because symbols need not generate in general.

*Needs:* §2.9; §6.4.

### Examples

- Over ℤ, {−1, −1}₃ = w₁₂(1)⁴ = (x₁₂(1)x₂₁(−1)x₁₂(1))⁴, the generator of K₂(ℤ).
- Over 𝔽₅, h₁₂(2) maps to diag(2, 3, 1), which is not a signed permutation matrix: W_n(A) must be generated by all w_ij(u), not only by u = ±1.
- φ₃(W₃(𝔽₃)) has 3!·2² = 24 elements.

### Dependencies

Layers 2–3 and 5; Tau Ceti `diagGL`, `permutationGL`, `upperUnitriangularGroup`; KTheoryLowDegrees §6.2.

## Layer 7: Matsumoto’s theorem

Matsumoto's theorem: for every field F the map K₂ᴹ(F) → K₂(F), {a, b} ↦ {a, b}, is an isomorphism, natural in F. Surjectivity is Layer 6. Injectivity for infinite fields follows Matsumoto's construction: for a Steinberg pairing c with values in A, a central extension of SL_n(F) by A is built from a torus extension carrying c, its extension to the monomial group and a permutation action on a Bruhat fibre set; root lifts give St_n(F) → E_c, and taking c universal separates every relation. Finite fields are handled by K₂(𝔽_q) = K₂ᴹ(𝔽_q) = 0. The layer ends with the leading-coefficient splitting of K₂(F) → K₂(F(t)) and torsion of restriction kernels.

### 7.1 Torus extension carrying a prescribed symbol

Given a Steinberg pairing c:Fˣ×Fˣ→A and r=n-1≥2, let H₀=(Fˣ)^r with ordered simple coroots α_i=e_i-e_{i+1}. Put β(s,t)=Σ_i c(s_i,t_i)−Σ_{i>j, i=j+1} c(s_i,t_j). Give H_c=A×H₀ the product (a,s)(b,t)=(a+b+β(s,t),st). It is a central extension of the SL_n diagonal torus by A, with h_i(s)h_i(t)h_i(st)⁻¹=c(s,t) and [h_i(s),h_j(t)]=a_{ji}c(s,t), where a_{ii}=2, adjacent a_{ji}=-1 and all other entries are zero. (Matsumoto, §6, construction preceding Lemma 6.5, pp. 37–38.)

F is a field, A is an abelian group, c is a Steinberg pairing, n≥3 and r=n-1.

Provide the following API.

- `symbolTorusExtension`: The central extension on A×(Fˣ)^r with the displayed β product.
- `symbolTorus_inl_injective`: The coefficient inclusion a↦(a,1) is injective and identifies A with the projection kernel.
- `symbolTorus_defect`: h_i(s)h_i(t)h_i(st)⁻¹=inl(c(s,t)).
- `symbolTorus_commutator`: The toral commutator is the Cartan multiple a_{ji}c(s,t).
- `symbolTorus_map`: Postcomposing c by A→+B maps (a,t) to (f(a),t) and fixes the quotient torus.
- `symbolTorus_mul`: In the A×(Fˣ)^r coordinates, (a,s)(b,t)=(a+b+β(s,t),st), with the displayed ordered factor set β.
- `symbolTorus_project`: The homomorphism (a,s)↦s is surjective; the simple torus lift h_i(t) has coefficient zero and t in its ith coordinate.

**Checks.**

- For c=0, H_c is the direct product A×H₀ with the identity inclusions.
- For r=2, β(s,t)=c(s₁,t₁)+c(s₂,t₂)-c(s₂,t₁). The cross-term is present; for nonadjacent coordinates in r=3 it is zero.
- For the real sign pairing, h_i(-1)²=inl(1), although its diagonal matrix has square 1. A product torus would fail this test.

*Needs:* §1.1; §5.3.

**The type-A torus factor set for a prescribed symbol.** For infinite F, m≥3, an abelian A and bilinear Steinberg pairing c, index simple roots by 1,…,m−1, α_i=e_i−e_{i+1}. On H=(F×)^(m−1) define C(t,u)=Σ_i c(t_i,u_i)−Σ_{i=2}^{m−1}c(t_i,u_{i−1}). Use the normalized factor-set extension to form H~. Its ordered section is the product of h_i(t_i); the torus image in SL_m is ∏diag_i(t_i,t_i⁻¹), not the tuple interpreted as diagonal entries. (Matsumoto, §6, torus extension formulas (2)–(3), pp.37–38; Lemma 5.4(c), p.26.)

F infinite and commutative; m≥3; A an additive abelian group; c bilinear with the Steinberg relation.

Provide the following API.

- `FieldSymbolExtension.torusFactor`: The normalized factor set C on simple-coroot coordinates.
- `FieldSymbolExtension.torusSection_mul`: section(t)section(u)=inl(C(t,u))section(tu).
- `FieldSymbolExtension.torus_injective`: The coefficient map A→H~ is injective and central.
- `FieldSymbolExtension.simple_defect`: h_i(a)h_i(b)h_i(ab)⁻¹=inl(c(a,b)).
- `FieldSymbolExtension.torus_coordinates`: Projection of section(t) is diag(t₁,t₂/t₁,…,t_last⁻¹).

*Checks.*

- For m=3, C((a,b),(d,e))=c(a,d)+c(b,e)−c(b,d).
- C(1,t)=C(t,1)=0.
- For c=0, H~ identifies with Multiplicative A×H with the product group law.
- For adjacent i<j, [h_i(a),h_j(b)]=inl(−c(a,b)); a plus sign in the lower correction fails this check.

*Needs:* §5.3; Tau Ceti `TauCeti.FactorSet`; Tau Ceti `TauCeti.FactorSet.inl_range_le_center`.

### 7.2 Extended Weyl square-subgroup presentation

For the type-A chain with r=n-1≥2 let W̃ be generated by q_i with adjacent length-three braids, nonadjacent commutation, and q_i²q_jq_i⁻²=q_j^{(-1)^{a_{ji}}}. Its square subgroup D generated by d_i=q_i² has the presentation d_i⁻¹d_jd_i=d_j d_i^{1-(-1)^{a_{ji}}}. In particular q_i⁴ is a common nontrivial central element of order two, and W̃/D is S_n. These are square-subgroup relations, not the relation q_i⁴=1. (Matsumoto, §6, Theorem 6.3(a)–(c) and its proof, pp. 34–36.)

n≥3, r=n-1 and the Cartan entries are those of A_r. This theorem is independent of the field.

**Checks.**

- For r=2 the square subgroup has eight elements, with both generating squares equal to the nontrivial central coefficient.
- The proof is a lifted presentation calculation; ordinary Coxeter word invariance comes from RootSystems Layer 3.

*Needs:* RootSystems Layer 3.

### 7.3 Lifted monomial extension

Extend H_c to a central extension N_c of the determinant-one monomial matrix group N₀. Its simple Weyl lifts q_i project to w_{i,i+1}(-1), satisfy q_i²=h_i(-1), commute for nonadjacent i,j and satisfy q_iq_jq_i=q_jq_iq_j for adjacent i,j. Conjugation by q_i acts by θ_i; θ_i⁻¹ fixes A and sends h_j(t) to h_j(t)h_i(t^{-a_{ij}}). The map H_c→N_c is injective; N_c/H_c is the symmetric group S_n. (Matsumoto, §6, Theorem 6.3 and Lemmas 6.5–6.6, pp. 34–40.)

F is a field, A is abelian, c is a Steinberg pairing and n≥3.

Provide the following API.

- `symbolMonomialExtension`: The extension N_c with its injective torus map and projection to N₀.
- `symbolMonomial_torus`: H_c embeds, with the same coefficient inclusion A→N_c.
- `symbolMonomial_square`: q_i²=h_i(-1); its fourth power is inl(c(-1,-1)).
- `symbolMonomial_braid`: Adjacent q satisfy the length-three braid relation; nonadjacent q commute.
- `symbolMonomial_kernel`: The coefficient inclusion is an isomorphism A≃ker(N_c→N₀).
- `symbolMonomial_conjugation`: For Cartan entries a_ij, q_i⁻¹ h_j(t) q_i=h_j(t)h_i(t^(-a_ij)); this includes the central coefficients dictated by the fixed torus product.
- `symbolMonomial_hom_ext`: Group homomorphisms out of N_c agree if they agree on the embedded H_c and on every q_i.
- `symbolMonomial_lift`: A homomorphism H_c→G and elements Q_i of a group G extend uniquely to a homomorphism N_c→G if they satisfy the displayed torus conjugation, braid/commutation and Q_i²=image(h_i(-1)) relations. No Q_i⁴=1 relation is imposed.

**Checks.**

- For c=0, N_c is A×N₀ over N₀, with the signed matrix Weyl representatives.
- q_i projects to a determinant-one signed transposition whose square is diagonal -1 at two coordinates, not generally 1.
- For the real sign pairing, q_i⁴=inl(1)≠1 and q_i⁸=1. Replacing the lift by an involutive permutation loses the prescribed symbol.

*Needs:* §7.1; §7.2; RootSystems Layer 3.

**The symbol-dependent lift of the type-A normalizer.** Extend H~ to N~ over the monomial determinant-one normalizer N⊂SL_m(F), with simple lifts w_i=w_i(−1), root-torus lifts h_i(t), injected central A and kernel A. The action is θ_i⁻¹(h_j(t))=h_j(t)h_i(t^(−⟨α_i,α_j∨⟩)); θ_i fixes A. Its square is conjugation by h_i(−1), the w_i satisfy type-A braid relations, and w_i²=h_i(−1). (Matsumoto, Theorem 6.3, pp.34–36; Lemmas 6.5–6.6, pp.38–40.)

The input and conventions of §7.1, with the ordered type-A simple roots.

Provide the following API.

- `FieldSymbolExtension.normalizer`: N~ is the symbol-dependent extension of N, with maps A→N~→N.
- `FieldSymbolExtension.normalizer_exact`: The coefficient injection is injective, projection is surjective and kernel equals coefficient image.
- `FieldSymbolExtension.weyl_torus`: w_i⁻¹ h_j(t) w_i=h_j(t)h_i(t^(−⟨α_i,α_j∨⟩)); θ_i is conjugation by w_i.
- `FieldSymbolExtension.simple_square`: w_i²=h_i(−1).
- `FieldSymbolExtension.simple_braid`: Nonadjacent simple lifts commute; adjacent lifts satisfy w_iw_jw_i=w_jw_iw_j.

*Checks.*

- In characteristic different from two, the image of w_i² has −1 at its two coordinates and is not the identity.
- For adjacent i,j, θ_i⁻¹(h_j(t))=h_j(t)h_i(t).
- For A=0, projection N~→N is a group isomorphism.

*Needs:* §7.1; ReductiveGroups Layer 7; RootSystems Layer 3.

### 7.4 Matsumoto’s permutation construction

For an infinite field F and prescribed pairing c, let v:SL_n(F)→N₀ be the unique monomial middle component in U⁺NU⁺. Define S_c={(g,m)∈SL_n(F)×N_c | v(g)=p(m)}. Define E_c as the subgroup of permutations of S_c generated by left torus translations, positive-unipotent translations and simple Weyl transformations. The first coordinate of each generator is the corresponding left matrix translation. (Matsumoto, §5, Lemma 5.3 and §6, construction of S and E before Lemma 6.7, pp. 24–25, 40–41.)

F is an infinite field; A is an abelian group; c is a Steinberg pairing; n≥3.

The Bruhat coordinate v used here, the unique monomial middle factor of g in the double coset U⁺·v(g)·U⁺ of SL_n(F), with its equivariance under left multiplication by U⁺ and by the diagonal torus and its two-branch change under w_i(−1) (Matsumoto, Lemma 5.3), is part of this target: ReductiveGroups Layer 7 supplies the Bruhat decomposition but not this coordinate or its root-coordinate formulas.

Provide the following API.

- `symbolExtensionSpace`: The fiber set S_c over the unique ordinary Bruhat monomial map.
- `symbolExtensionAction`: The subgroup E_c of permutations generated by the displayed transformations.
- `symbolExtension_project`: The surjective homomorphism E_c→SL_n(F) induced by first coordinates.
- `symbolExtension_coeff`: A injects into the centre of E_c by second-coordinate translation.
- `symbolExtension_weyl_branch`: The two second-coordinate formulas use the actual unique nonzero root parameter only in the decreasing branch.

**Checks.**

- At (1,1), the simple Weyl transformation sends the pair to (w_i(-1),q_i).
- Applying the simple Weyl transformation twice equals torus translation by h_i(-1), including the second coordinate.
- For c=0 the fiber is SL_n(F)×A, and all root generators fix the A coordinate; coefficient elements translate it.
- For nonzero a∈A, coefficient translation sends (1,1) to (1,inl(a)); it is not the identity permutation.

*Needs:* §6.5; §7.3; ReductiveGroups Layer 7.

**The Bruhat fiber set and its lift action.** Let v:SL_m(F)→N be the unique normalizer coordinate in its upper-unipotent Bruhat double coset, as in Matsumoto Lemma 5.3. Define S={(g,n~):v(g)=q(n~)}. Each fiber is an A-torsor; the simple-lift branches test the sign of σ⁻¹α_i and then the simple root coordinate t. Construct permutations λ(h~) for h~∈H~, λ(u) for u∈U⁺, and λ(w_i) for the chosen simple lifts. Their first-coordinate actions are left multiplication by q(h~), u and the ordinary w_i, respectively. Let E_c be their generated subgroup of Perm(S). (Matsumoto, Lemma 5.3, pp.24–25; construction and Lemma 6.7, pp.40–41; §7, pp.44–45.)

F infinite; m≥3; the symbol-dependent normalizer and the ordinary Bruhat coordinate v are fixed.

Provide the following API.

- `FieldSymbolExtension.bruhatFiber`: The type S of pairs satisfying v(g)=q(n~); it is not equipped with a coordinatewise group law.
- `FieldSymbolExtension.left_unipotent`: Upper unipotents act by (g,n~)↦(ug,n~).
- `FieldSymbolExtension.left_torus`: Torus lifts act by (g,n~)↦(q(h~)g,h~n~).
- `FieldSymbolExtension.left_simple`: A simple Weyl lift acts with second coordinate w_i n~ if σ⁻¹α_i>0 or t=0, and h_i(t⁻¹)n~ if σ⁻¹α_i<0 and t≠0.
- `FieldSymbolExtension.fiber_translate`: Coefficients act by (g,n~)↦(g,inl(a)n~).
- `FieldSymbolExtension.fiber_ext`: Two points of S agree exactly when their first coordinates and normalizer lifts agree.
- `FieldSymbolExtension.fiber_torsor`: For two points over the same g there is a unique a∈A whose coefficient translation carries one to the other.
- `FieldSymbolExtension.left_simple_square`: λ(w_i)²=λ(h_i(−1)); hence λ(w_i)⁻¹=λ(h_i(−1))⁻¹λ(w_i).

*Checks.*

- Over the identity matrix, the fiber is the coefficient copy A.
- For u∈U⁺, λ(u)(1,1)=(u,1).
- If coefficient translation by a fixes (1,1), then a=0.
- The coordinatewise multiplication formula on SL_m×N~ does not define a group law on S: v is not a homomorphism.
- For t≠0, put g=x_i(t)w_i(−1) and choose n~=w_i. Then v(g)=w_i(−1), σ⁻¹α_i<0 and λ(w_i)(g,w_i)=(w_i(−1)g,h_i(t⁻¹)w_i). For t=0 its second coordinate is w_i²=h_i(−1). This detects an inverted sign test or a missing nonzero branch.

*Needs:* §7.3; ReductiveGroups Layer 7.

### 7.5 Rank-one and rank-two action relations

The left and right transformation groups on S_c commute and act transitively, so each acts freely. Each rank-one restriction has the prescribed toral cocycle c. The adjacent simple Weyl transformations satisfy the length-three braid relation, and transformations belonging to disconnected simple roots commute. These are the local action relations used to establish global exactness; the full type-A Steinberg relations are supplied after exactness by §7.7. (Matsumoto, §6, Lemmas 6.8–6.10, pp. 41–42; §7, Lemmas 7.1–7.2 and proof of Lemma 6.8, pp. 43–47.)

F is an infinite field; c is a Steinberg pairing to abelian A; n≥3.

**Checks.**

- The exceptional uv=1 branch is checked without an inverse of zero.
- The braid equation is proved as an equality of permutations on the entire fiber set.
- A condition asserting these action relations is not added to the input data.

*Needs:* §7.4; RootSystems Layer 3.

**Rank-one and rank-two verification of the lift action.** In each rank-one and rank-two subsystem construction, the left and opposite actions commute and are simply transitive. Faithful restriction to those subsystem fibers transfers their relations to the full type-A permutation group E_c. Its left lifts obey additive root relations, Weyl conjugation of roots, and all type-A rank-two commutator and braid relations. In particular [x_ij(r),x_jk(s)]=x_ik(rs) and [x_ij(r),x_ki(s)]=x_kj(−sr) for distinct i,j,k. These include the opposite-root conjugation identities used by Bruhat reduction. (Matsumoto, Lemmas 6.8–6.10, pp.41–42; proof in §7, pp.44–47.)

The infinite-field construction above; type-A root indices and the prescribed c with its complementary-unit relation.

*Checks.*

- The root coefficient order is rs forward and −sr in reverse chaining.
- The uv=1 branch is checked independently, not by substituting into a formula with (1−uv)⁻¹.
- Opposite-root conjugation is proved, rather than inferred solely from Weyl braid relations.
- The simply transitive argument is made in rank one and rank two before transferring relations to the full group.

*Needs:* §5.3; §6.5; §7.4; Tau Ceti `TauCeti.transvectionUnit_add`; Tau Ceti `TauCeti.commute_transvectionUnit`; Tau Ceti `TauCeti.commutatorElement_transvectionUnit`; Tau Ceti `TauCeti.commutatorElement_transvectionUnit_reverse`; RootSystems Layer 3.

### 7.6 Exact central extension realizing the pairing

The projection E_c→SL_n(F) has kernel exactly the embedded coefficient group A. Thus 1→A→E_c→SL_n(F)→1 is an exact central extension with A included injectively. Its embedded torus retains the defect h_i(s)h_i(t)h_i(st)⁻¹=inl(c(s,t)). Agreement of this torus with Steinberg root-word lifts is proved in §7.7. (Matsumoto, §6, Lemma 6.11(a)–(d), pp. 42–43; Theorem 5.10, pp. 30–31.)

F is an infinite field, A is abelian, c is a Steinberg pairing and n≥3.

**Checks.**

- At c=p with A=P₂(F), inl(p(-1,-1)) remains nonzero over ℝ.
- Exactness includes both containment directions and surjectivity.

*Needs:* §7.3; §7.4; §7.5.

**Faithful realization and Bruhat normal form for the symbol extension.** The generated permutation group E_c fits into an exact central extension 0→A→E_c→SL_m(F)→1. Every element admits a lifted Bruhat expression u h~ w_σ v, with v in the root-coordinate subgroup appropriate to σ. The only kernel elements are coefficient translations. A homomorphism St_m(F)→E_c takes elementary root generators to their lift permutations, and the symbol [h_ij(a),h_ik(b)] maps to inl(c(a,b)) for distinct i,j,k. (Matsumoto, Lemma 6.11, pp.42–43; Theorem 5.10 and Corollary 5.11, pp.30–31; Lemma 5.4(c), pp.26–27.)

F infinite and m≥3; the type-A ordinary root presentation and Bruhat form, plus the preceding verified lift action.

*Checks.*

- The coefficient class cannot disappear in the generated permutation group.
- Taking A=0 yields SL_m(F).
- The source h_α(a)=w_α(a)w_α(1)⁻¹ agrees with w_ij(a)w_ij(−1) of §6.3; verify the rank-one inverse word.

*Needs:* §2.1; §6.2; §6.4; §6.5; §7.5; ReductiveGroups Layer 7.

### 7.7 Steinberg root lifts of the detecting extension

For an infinite field F, a Steinberg pairing c:Fˣ×Fˣ→A to an abelian group and n≥3, the exact extension E_c admits lifts y_ij(t) of every elementary root x_ij(t). They are additive in t and satisfy the forward, reverse and disconnected type-A Steinberg commutator relations. Hence there is a homomorphism ρ_c:St_n(F)→E_c over SL_n(F). With w_ij(a)=y_ij(a)y_ji(-a⁻¹)y_ij(a) and h_ij(a)=w_ij(a)w_ij(-1), these lifts agree with the embedded simple torus words, and [h_12(a),h_13(b)]=inl(c(a,b)). (Steinberg, §7, Theorem 10 proof, steps (1)–(9), pp. 79–82; Corollary 1, p. 82; Matsumoto, §5, root lifts before Lemma 5.1, p. 23; §6, Lemma 6.10(a), p. 42, and Lemma 6.11(d), p. 43; §7, end of the proof of Lemma 6.8(a), p. 47.)

F is an infinite commutative field; A is an abelian group; c is a bilinear Steinberg pairing; n≥3.

**Checks.**

- The field-size choice is justified by infinity. This theorem is not applied to F₂, F₃ or F₄.
- The root lifts are obtained after exactness, and satisfy every defining relation of St_n, with all index inequalities.
- The generator equation detects the positive-overlap symbol and retains inl(c(-1,-1)) over ℝ. No finite-rank §1.17 theorem is an input.

*Needs:* §1.1; §2.1; §6.5; §7.1; §7.5; §7.6.

### 7.8 Zero-symbol splitting for finite type-A central extensions

Let F be infinite, m≥3, and E→SL_m(F) a central extension by A with compatible root lifts satisfying the ordinary root and Weyl-conjugation relations. If all its torus-defect cocycles h_i(a)h_i(b)h_i(ab)⁻¹ are trivial, the extension splits. The splitting carrying elementary matrices to these lifts is unique, since SL_m(F) is perfect. (Matsumoto, §5 ordinary presentation (R1)–(R3), p.23; paragraph preceding Theorem 5.10, p.30.)

F infinite and commutative, m≥3; the coefficient kernel is central; compatible root lifts are supplied as part of the hypothesis.

**Checks.**

- No arbitrary extension is asserted to split; the zero-cocycle hypothesis is essential.
- The result applies to restrictions of a central quotient of the stable Steinberg extension, whose root lifts come from St(F).

*Needs:* §1.4; §6.5; ReductiveGroups Layer 7.

### 7.9 Faithful symbols over infinite fields

For an infinite field F, the map P₂(F)→Additive K₂(F) induced by s is injective. A finite additive combination of symbols that is trivial in stable St already vanishes in P₂(F). (Matsumoto, §5, Theorem 5.10 and Corollary 5.11, pp. 30–31; §6, Lemma 6.11(d), p. 43; Steinberg, §6, Theorem 8, p. 66.)

F is an infinite field.

**Checks.**

- No stable UCE uniqueness theorem is needed to define the detecting map from St_n.
- The proof uses finite-representative equality, not an unsupported injectivity of all St_n→St_{n+1}.

*Needs:* §2.5; §5.2; §6.6; §7.7.

**Separation of symbol relations in a finite rank.** For infinite F, specialize the preceding construction to A=Q₂(F) and c=the tensor symbol. The canonical map Q₂(F)→K₂(F) is injective: every finite symbol relation that becomes trivial in the stable Steinberg group is already zero in Q₂(F). The lifted normal form also shows every stable kernel element is a finite product of symbols. Together these are the injectivity and generation inputs of Matsumoto's isomorphism (§7.12), not a second definition of it. (Matsumoto, Corollary 5.11, pp.30–31; Lemma 6.11, pp.42–43; Weibel, Theorem III.6.1, p. 231.)

F infinite; the stable Steinberg group and its finite-representative equality criterion are those of §2.5.

*Checks.*

- Injectivity is not justified by merely showing symbol relations hold in classical K₂.
- The proof works in a finite witness rank before taking the stable conclusion.
- Stabilization preserves the chosen symbol convention.

*Needs:* §2.5; §2.6; §2.11; §5.2; §7.6; §7.8.

### 7.10 Finite-field classical kernel vanishing

For a finite field F, every explicit classical symbol s(a,b) vanishes and the stable classical group K₂(F) is zero. The proof works over F₂, F₃ and F₄ and asserts no finite-rank §1.17 statement. (Weibel, III.6.1.1, p. 231; Steinberg, §6, Theorem 9 and SL_n example, p. 72.)

F is a finite field.

**Checks.**

- K₂(F₂)=K₂(F₃)=K₂(F₄)=0.
- Stable vanishing is established before invoking Matsumoto’s all-field equivalence.

*Needs:* §5.2; §5.11; §6.10; §6.19.

**K_2 of a finite field is trivial.** For every finite field the group K_2 is trivial. (Weibel, III.6.1.1, p. 231.)

F is a finite field with q elements.

*Checks.*

- The counting step is what makes the argument work and is recorded, not asserted.
- The two characteristics are treated separately.
- The conclusion feeds the Milnor K-theory examples: all higher Milnor K-groups of a finite field vanish.

*Needs:* §6.9; Mathlib `ZMod`.

### 7.11 The chosen Milnor-to-classical comparison map

Define φ_F:Kᴹ₂(F)→Additive K₂(F) as the unique map taking {a,b} to the explicit commutator symbol s(a,b). Construct it via Kᴹ₂(F)≃P₂(F) and the tensor-square universal property. It is surjective by stable symbol generation; its injectivity is proved separately. (Weibel, III.6.1 and III.7.1, pp. 231, 245.)

Provide the following API.

- `milnorToClassicalK2`: The map φ_F with the specified domain and additive target.
- `milnorToClassicalK2_symbol`: φ_F({a,b}) is [h_12(a),h_13(b)] in the stable kernel, written additively.
- `milnorToClassicalK2_unique`: Any additive map with that generator equation is φ_F.
- `milnorToClassicalK2_surjective`: Every element of the classical kernel is the image of an element of the actual Milnor degree-two group.

**Checks.**

- φ_ℚ({1/2,1/2})=0 by the explicit w-word Steinberg calculation.
- φ_F₂ is the unique map between zero groups after the two independent finite-field arguments.
- The coefficient detector built from the real sign pairing sends φ_ℝ({-1,-1}) to 1, so the map is not the zero map over all fields.

*Needs:* §5.2; §5.7; §6.10; §6.19.

### 7.12 Matsumoto’s isomorphism for the chosen symbol map

For every field F, the map φ_F:Kᴹ₂(F)→Additive K₂(F) is bijective and therefore defines a specified additive equivalence. Its inverse sends the classical commutator symbol s(a,b) to {a,b}. The inverse is independent of how a classical kernel element is written as a sum of symbols. (Weibel, III.6.1, p. 231; Matsumoto, §5, Corollary 5.11, pp. 30–31; Steinberg, §6, Theorem 9, p. 72.)

**Checks.**

- The inverse generator equation is explicit.
- All K₂ groups here are classical or Milnor; the identification with Quillen products is Layer 8.

*Needs:* §5.11; §7.9; §7.10; §7.11.

**Matsumoto's theorem.** For a field F the group K_2(F) is the abelian group generated by the Steinberg symbols of pairs of nonzero elements, subject only to bilinearity in each entry and the Steinberg identity that the symbol of x with one minus x is trivial for x different from zero and one. Equivalently, K_2(F) is the quotient of the tensor square of the multiplicative group by the subgroup generated by the elements x tensor one minus x. (Weibel, III.6.1, p. 231.)

*Checks.*

- The presentation gives K_2 of a finite field trivial, which is a genuine test of the presentation.
- The reformulation as a quotient of the tensor square is the degree-two case of Milnor K-theory.
- The theorem is a presentation, not merely a surjection: the normal-form argument is what distinguishes the two, and a proof that only checks the relations is incomplete.

*Needs:* §6.4; §6.7; §6.9; §6.19.

### 7.13 Naturality of the field presentation

For a field homomorphism f:F→E the square with φ_F,φ_E, Kᴹ₂(f) and the classical K₂(f) of §2.9 commutes. Both equivalences and their inverses are natural. Different choices of stabilizing coordinates give the same φ, because its generator equation uses the coordinate-independent stable symbol. (Weibel, III.6.1 and III.7.1, pp. 231, 245; Matsumoto, §9, functorial observations (a),(b), p. 50.)

**Checks.**

- The identity and composite field-map squares commute.
- Naturality is not promoted to injectivity under arbitrary field extensions.

*Needs:* §2.5; §5.8; §6.10; §7.12.

### 7.14 K_2 of a field is a direct summand of K_2 of a rational function field, and the torsion kernel

For a field F, K2(F) -> K2(F(t)) is a split injection. The retraction sends {f,g} to {lc(f),lc(g)}, where lc(p/q)=lc(p)/lc(q). (Weibel, III.6.1.2, p. 231.)

**Checks.**

- The map is a left inverse on constant symbols.
- The equal-degree cancellation case lc(f)=1 is handled separately.
- The conclusion is split injectivity for the specified rational function extension.

*Needs:* §6.8; §7.12.

### 7.15 Torsion in field-extension restriction kernels

For every field extension F <= L, the kernel of K2(F) -> K2(L) is torsion. (Weibel, III.6.1.3, p. 231.)

*Needs:* §7.14; GeneralAlgebraicKTheory §3.2; GeneralAlgebraicKTheory §7.7.

### Examples

- For the real sign pairing, the square of the torus lift h_i(−1) is the nonzero coefficient c(−1, −1): a product torus would lose the symbol.
- The fourth power of a simple Weyl lift is inl(c(−1, −1)); imposing q_i⁴ = 1 would erase {−1, −1} over ℝ.

### Dependencies

Layers 1–6; ReductiveGroups Layer 7 and RootSystems Layer 3 (ordinary Bruhat and Coxeter facts); GeneralAlgebraicKTheory §§3.2 and 7.7.

## Layer 8: products and the graded map to Quillen K-theory

The product θ₁[a]·θ₁[b] of two unit classes in Quillen K₂ is the Steinberg symbol {a, b} up to one sign ε fixed on the torus ℤ²; the graded ring map K_*ᴹ(F) → K_*(F) is built from products of unit classes, its degree-two component is Matsumoto's isomorphism followed by the sign-normalised comparison, and its degree-three component is handed to K3BlochGroups.

### 8.1 The product of two unit classes is the Steinberg symbol

Let R be a commutative ring and a, b ∈ Rˣ. The diagonal matrices D_a = diag(a, a⁻¹, 1) and D′_b = diag(b, 1, b⁻¹) are commuting elements of E₃(R), the images of h₁₂(a) and h₁₃(b), and the classical Steinberg symbol of §6.4 is the commutator {a,b} = [D̃_a, D̃′_b] ∈ K₂^cl(R) of any lifts to St(R). Let θ₁ : K₁^cl(R) ≅ π₁BGL(R)⁺ be the comparison of KTheoryLowDegrees §13.1, θ₂ : K₂^cl(R) ≅ π₂BGL(R)⁺ the Hurewicz-route realization β_R of §4.1 (the Hopf kernel equivalence α_R : K₂(R) ≅ H₂(E(R); ℤ), the plus-construction homology isomorphism, the inverse Hurewicz isomorphism of the simply connected cover BE(R)⁺ and the cover map), and x·y the degree-(1,1) product of Quillen K-theory of the commutative ring R (GeneralAlgebraicKTheory Layer 7's external product followed by the multiplication R ⊗ R → R). Fix the sign ε ∈ {+1, −1} by the torus convention: under the Hopf isomorphism of §1.15 for the presentation ℤ² = ⟨s, t | sts⁻¹t⁻¹⟩, the fundamental class of Bℤ² = S¹ × S¹, oriented so that the quotient S¹ × S¹ → S¹ ∧ S¹ ≅ S² used to multiply classes of π₁ has degree one, is the class of (sts⁻¹t⁻¹)^ε. Then θ₁[a]·θ₁[b] = θ₂({a,b}^ε), naturally in R. Equivalently the normalized comparison θ₂♮ = θ₂ ∘ (x ↦ x^ε) satisfies θ₁[a]·θ₁[b] = θ₂♮({a,b}); this is the normalization under which Weibel's Example IV.1.10.1 holds literally. In particular θ₁[a]·θ₁[1−a] = 0 whenever a and 1−a are units, whatever ε is. (Loday, §2.1.10, p.335; §2.2, Lemma 2.2.1, p.336; Proposition 2.2.3 with its proof and the following Remark, pp.337–338; Weibel, III.5.10–5.10.1, IV.1.7.1, IV.1.10–1.10.1, pp. 225, 265, 266.)

R is a commutative ring (a field, for the graded map); a and b are units of R. The product is the biexact product of GeneralAlgebraicKTheory §7.4; its identification in degree (1,1) with Loday's plus-construction product is part of this target. ε depends only on the orientation of the torus, the commutator convention xyx⁻¹y⁻¹ and the Hopf isomorphism fixed in Layers 1–4; it is computed once, on ℤ², and is never chosen to force the formula. **Proof gap:** a comparison of the supplier’s biexact product with Loday’s plus product in degree (1,1), and the numerical torus sign relative to the fixed Hopf/Hurewicz map β, are still required. Defining θ₂♮ does not prove that comparison or compute ε.

**Checks.**

- The same ε serves every commutative ring, every pair of units and every ring map; it is determined on ℤ² alone.
- Reversing the factors gives θ₁[b]·θ₁[a] = θ₂({b,a}^ε) = −θ₁[a]·θ₁[b] in additive K₂, consistent with GeneralAlgebraicKTheory Layer 7/graded-commutativity and the skew-symmetry of the classical symbol.
- Loday identifies π₂BE⁺ with the Steinberg kernel through the connecting map of the extension and finds the inverse commutator (Proposition 2.2.3); his Remark on p.338 gives the Schur-multiplier route used here. §4.2 normalizes the same comparison through that connecting map (χ_A), while §4.1 uses Hurewicz (β_R). The two are natural equivalences with the same source and target and are compared on the torus class before either is substituted for the other; ε is defined relative to β.
- For R = ℚ(t), a = 2 and b = t, (θ₂♮)⁻¹(θ₁[2]·θ₁[t]) = {2,t}, whose tame residue at t = 0 is 2 in the Layers 9–11 convention; the opposite normalization or the reversed product gives 1/2.

*Needs:* §1.15; §1.16; §1.29; §3.4; §4.1; §6.4; §6.7; GeneralAlgebraicKTheory Layer 7; GeneralAlgebraicKTheory §3.12; KTheoryLowDegrees §13.1; KTheoryLowDegrees §8.1; StableHomotopyKTheory §1.30; StableHomotopyKTheory §3.32; StableHomotopyKTheory §3.12; StableHomotopyKTheory §3.28; AlgebraicTopology Stage 5; AlgebraicTopology Stage 8.

### 8.2 The graded map from Milnor to Quillen K-theory

Construct the natural graded ring map from Milnor K-theory of a field to Quillen K-theory, determined by the products of degree-one classes. Its degree-two component is Matsumoto's isomorphism. No isomorphism is asserted in degree three or above. (Weibel, IV.1.10.1, III.7.1, pp. 245, 266; Weibel, VI.4.3.2, p. 482, and Remark VI.5.2.1, p. 488.)

Provide the following API.

- `milnorToQuillen`: The graded ring map.
- `milnorToQuillen_one`: Degree one is the identity on the unit group.
- `milnorToQuillen_two`: Under product-symbol compatibility and Matsumoto, the component K2^M(F)->Quillen K2(F) is an isomorphism.
- `milnorToQuillen_map`: Naturality in the field.
- `milnorToQuillen_graded`: It is a map of graded rings.
- `milnorToQuillen_symbol`: Each n-symbol maps to the ordered product of its n unit classes in Quillen K_n(F).
- `milnorToQuillen_unique`: A graded map with the same degree-one unit classes is equal by the Milnor universal property.

**Checks.**

- The degree-zero map Z->Quillen K0(F) sends 1 to the class of the one-dimensional vector space.
- For F=Q, the unit 2 maps to its K1 unit class, corresponding to 2 under determinant.
- {a,1-a} maps to zero, and {-1,-1} maps to the classical symbol under the K2 comparison.
- For F=Q the integral component is injective Z/2->Z/48 and is not onto; this computation (Weibel VI.5.2.1) is a test, not a target of this roadmap.

*Needs:* §5.4; §7.12; GeneralAlgebraicKTheory §7.4; GeneralAlgebraicKTheory Layer 3; KTheoryLowDegrees §8.1.

### 8.3 Degree-two identification with the classical Matsumoto map

Let F be a field. Write m_F : K₂^M(F) ≃ K₂^cl(F) for the symbol-preserving Matsumoto equivalence, {a,b} ↦ {a,b}, obtained from §7.12 through the degree-two presentation of the Milnor ring (§5.5); θ₂ : K₂^cl(F) ≃ K₂(F) for the natural comparison of §4.1 in its Hurewicz normalization β (§4.1), transported to the Quillen model; and θ₂♮ = θ₂ ∘ (x ↦ x^ε) for its normalization by the torus sign ε of §8.1. Then the degree-two component Φ₂ of the unital graded map of §8.2 equals θ₂♮ ∘ m_F. In particular Φ₂ is an isomorphism, natural in unital field homomorphisms. The identity uses the product-symbol theorem; it does not follow from bilinearity or from Matsumoto's theorem alone. (Weibel, III.6.1, III.7.1, IV.1.10–1.10.1, pp. 231, 245, 266; Loday, §2.2, Proposition 2.2.3 with proof, pp.337–338.)

F is a commutative field; every symbol entry is a unit. The degree-(1,1) comparison of the biexact product of GeneralAlgebraicKTheory §7.4 with Loday's plus product is the one made in §8.1. θ₂ is the Hurewicz normalization of §4.1.

**Checks.**

- The equality is on the actual degree-two homomorphism, not merely an abstract isomorphism of its source and target.
- At ℚ(t), the tame residue at t = 0 of (θ₂♮)⁻¹Φ₂{2,t} is 2 in Layers 9–11's convention; the reversed product or the opposite normalization gives 1/2.
- Only the Matsumoto presentation, θ₂ and the product-symbol theorem give invertibility; checking relations alone does not.
- For a finite field both sides vanish (Weibel III.6.1.1 and III.7.2(a)), so finite fields test nothing about the sign; the infinite fields carry the content.

*Needs:* §4.1; §5.4; §5.5; §7.12; §8.1; §8.2.

### 8.4 The degree-three component

The degree-three component K3^M(F)->Quillen K3(F) sends {a,b,c} to the ordered product of their unit classes. K3BlochGroups owns its injectivity theorem and the indecomposable cokernel; it uses this component, which is constructed without it. (Weibel, IV.1.10.1, p. 266, and VI.4.3.2, p. 482.)

**Checks.**

- The component sends a Milnor symbol of three units to the product of their classes.
- For a finite field the source vanishes.
- The injectivity theorem is not proved here; it is cited to the consuming layer.

*Needs:* §8.2.

### Examples

- For ℚ(t), (θ₂♮)⁻¹(θ₁[2]·θ₁[t]) = {2, t}, whose tame residue at t = 0 is 2; the opposite normalisation gives 1/2.
- For ℚ the degree-three component ℤ/2 = K₃ᴹ(ℚ) → K₃(ℚ) = ℤ/48 is injective and not onto (Weibel VI.5.2.1).

### Dependencies

Layers 4–7; GeneralAlgebraicKTheory Layer 7 and §3.12; KTheoryLowDegrees §§8.1 and 13.1; StableHomotopyKTheory Layer 3; AlgebraicTopology Stages 5 and 8.

## Layer 9: tame symbols and Milnor residues

For a discrete valuation v with uniformiser π and residue field k: unit parts, the tame symbol ∂_v{f, g} = (−1)^{v(f)v(g)}(f^{v(g)}/g^{v(f)})‾ with its independence of π, bilinearity, Steinberg relation and characterisation, its behaviour under ramified embeddings, Serre's residue algebra L(k) and the higher residues and specialisations K_nᴹ(F) → K_{n−1}ᴹ(k), K_nᴹ(k), their product formula, their dependence on π, a dictionary between the two normalisations in the literature, rigidity for complete fields and the ramification formula in every degree.

### 9.1 The unit part relative to a uniformizer

For a commutative field F, a valuation v:F→ℤᵐ⁰, and t∈Fˣ with ord_v(t)=1, define unitPart(v,t,f)=f·t^(−ord_v(f)) for every f∈Fˣ, as an element of the subgroup v.valuationSubring.unitGroup. It has order zero and f=t^ord_v(f)·unitPart(v,t,f); this property uniquely determines it. No residue is taken in this definition. (Weibel, Lemma III.6.3 and its proof, p. 234; current Tau Ceti `NumberTheory/LocalField/UnitsDecomposition`.)

F is a commutative field. v has integer multiplicative values; t is a field unit of order one. Surjectivity need not be supplied separately for this definition. f is a field unit, so the junk order at zero is never used.

Provide the following API.

- `TameSymbol.unitPart`: For t∈Fˣ with ord(t)=1 and f∈Fˣ, unitPart(v,t,f)=f·t^(−ord(f)), packaged in v.valuationSubring.unitGroup.
- `TameSymbol.coe_unitPart`: The underlying field unit of unitPart(v,t,f) is f·t^(−ord(f)).
- `TameSymbol.unitPart_decomposition`: f=t^ord(f)·unitPart(v,t,f) in Fˣ.
- `TameSymbol.unitPart_eq_iff`: For w in the valuation-subring unit subgroup, unitPart(v,t,f)=w iff f=t^ord(f)·w.
- `TameSymbol.unitPart_one`: unitPart(v,t,1)=1.
- `TameSymbol.unitPart_uniformizer`: unitPart(v,t,t)=1.
- `TameSymbol.unitPart_of_unit`: For w in the valuation-subring unit subgroup, unitPart(v,t,w)=w. In particular this holds after transporting an Rˣ element by unitGroupMulEquiv.symm.
- `TameSymbol.unitPart_mul`: unitPart(v,t,fg)=unitPart(v,t,f)·unitPart(v,t,g).
- `TameSymbol.unitPart_inv`: unitPart(v,t,f⁻¹)=unitPart(v,t,f)⁻¹.
- `TameSymbol.unitPart_zpow`: For every integer n, unitPart(v,t,f^n)=unitPart(v,t,f)^n, including negative n.
- `TameSymbol.unitPart_change`: If t′=tε for ε in the valuation-subring unit subgroup, then unitPart(v,t′,f)=unitPart(v,t,f)·ε^(−ord(f)).
- `TameSymbol.unitPart_localField`: For a nonarchimedean local field K with its ValuativeRel and topology, let v:K→ℤᵐ⁰ satisfy ord_v(x)=(TauCeti.normalizedValuation K x).toAdd for every x∈Kˣ. If t has normalized valuation ofAdd(1), identify its order-one witness by this equality. Then the underlying Kˣ element of unitPart(v,t,x) equals the underlying Kˣ element of (TauCeti.unitsEquivIntProd K t ht x).2. Consume the current local-field splitting and its second-coordinate formula; do not construct another local-field splitting or any topology.

**Checks.**

- For every allowed v,t, unitPart(v,t,1)=1.
- For w∈Rˣ, unitPart applied to the ambient field unit of unitGroupMulEquiv.symm(w) equals that same subgroup element. This rejects a separate residue-class or quotient carrier.
- unitPart(v,t,t^(−2))=1. Using the natural absolute value of the order gives t^(−4), which is not even a unit of the valuation ring.
- For ℚ at 5 with t=5, the unit parts of 2, 10, and 2/5 are all 2 as rational field units. A constant-one or reduction-only function fails these values.
- For ℚ at 5, t′=10 is another order-one parameter and unitPart(v,10,5)=1/2, whereas unitPart(v,5,5)=1.
- Under the local-field compatibility hypotheses of unitPart_localField, both unit components of x=t^(-2)·u, for u∈U(K,0), have underlying field unit u. Comparing underlying Kˣ values avoids an unjustified definitional identification of the two unit subgroups.

*Needs:* Tau Ceti `Valuation.ord`; Tau Ceti `Valuation.ord_mul`; Tau Ceti `Valuation.ord_zpow`; Tau Ceti `Valuation.valuation_eq_exp_neg_ord`; Mathlib `Valuation.mem_unitGroup_iff`; Mathlib `ValuationSubring.unitGroupMulEquiv`; LocalFieldsRamification Layer 1.

**Unit parts as units of the valuation ring.** For π∈Fˣ with ord_v(π)=1 and f∈Fˣ, define U_π(f)∈Rˣ to be the unique unit whose field value is f·π^(−ord_v(f)). Obtain its data by choosing the witness in Valuation.exists_eq_zpow_mul_unit_of_surjective after installing Valuation.nontrivial_valueGroup_of_surjective and translating ord_v(π)=1 to v.IsUniformizer(π). It realizes the unit decomposition of §9.1 with values in the units of the valuation ring, rather than a new valuation ring or symbol presentation. (Weibel, III.6.3, III.7.3, pp. 234, 246.)

Provide the following API.

- `TameSymbol.ringUnitPart`: U_π(f) is an actual unit of R, for π and f in Fˣ and ord_v(π)=1.
- `TameSymbol.ringUnitPart_coe`: The field value of U_π(f) is fπ^(−ord_v(f)); equivalently f=π^ord_v(f) U_π(f). This equation uniquely characterizes U_π(f).
- `TameSymbol.ringUnitPart_mul`: U_π(fg)=U_π(f)U_π(g). Together with unitPart_unit and unitPart_zpow this gives the group-homomorphism laws Fˣ→Rˣ.
- `TameSymbol.ringUnitPart_zpow`: U_π(f^m)=U_π(f)^m for f∈Fˣ and m∈ℤ.
- `TameSymbol.ringUnitPart_unit`: For u∈Rˣ, U_π(u)=u, where u is mapped to Fˣ by the subtype homomorphism.
- `TameSymbol.ringUnitPart_uniformizer_zpow`: U_π(π^m)=1 for every m∈ℤ.
- `TameSymbol.ringUnitPart_change_uniformizer`: For c∈Rˣ, U_(cπ)(f)=c^(−ord_v(f)) U_π(f).
- `TameSymbol.ringUnitPart_residue_bridge`: For z in R.unitGroup, the unitGroupToResidueFieldUnits(z) equals Units.map(residue)(R.unitGroupMulEquiv(z)); these are the same residue map.

*Checks.*

- For F=ℚ, ord=ord_5 and π=5, U_5(10)=2 and U_5(1/25)=1. A function returning f itself fails both, and a natural-power-only normalization fails the second.
- For π′=10 at ord_5, U_10(5)=1/2, whose residue in 𝔽_5 is 3; U_5(5)=1. The unit factor itself is not independent of π.
- U_π(u)=u for every u∈Rˣ, and U_π(π^(−2))=1. This distinguishes the ring unit from an arbitrary field-unit coercion.

*Needs:* Tau Ceti `Valuation.exists_eq_zpow_mul_unit_of_surjective`; Tau Ceti `Valuation.nontrivial_valueGroup_of_surjective`; Tau Ceti `Valuation.isUniformizer_iff_ord_eq_one_of_surjective`; Tau Ceti `Valuation.ord_mul`; Tau Ceti `Valuation.ord_zpow`; Mathlib `Units.map`.

### 9.2 The tame symbol of a discrete valuation

Let v be a discrete valuation on the field F, taken as a surjective valuation v : F → ℤᵐ⁰ with additive order ord_v (Tau Ceti's Valuation.ord, so a uniformiser has order one), valuation ring R, residue field k and residue map R^× → k^×, u ↦ ū. Fix a uniformiser t. Every f ∈ F^× is uniquely f = t^{ord_v f}·u_f with u_f ∈ R^×. For f, g ∈ F^× define ∂_v{f,g} = (−1)^{ord_v(f)·ord_v(g)} · ū_f^{ord_v(g)} · ū_g^{−ord_v(f)} ∈ k^×. Since f^{v(g)}/g^{v(f)} = u_f^{v(g)}·u_g^{−v(f)}, this is the roadmap's (−1)^{v(f)v(g)}·(f^{v(g)}/g^{v(f)})‾, and the residue map is applied only to the units u_f and u_g. With this convention ∂_v{u,t} = ū and ∂_v{t,u} = ū^{−1} for u ∈ R^×. The K-book's tame symbol (Lemma III.6.3), ∂_v({r,s}) = (−1)^{v(r)v(s)}·(s^{v(r)}/r^{v(s)})‾, equals ∂_v{s,r} = ∂_v{r,s}^{−1} in this notation: it is the inverse of this one. Independence of t is §9.3. (Weibel, Lemma III.6.3, p. 234.)

`Suggested.lean` records the unit part (−1)^{v(f)v(g)}f^{v(g)}g^{−v(f)} as `tameUnit`, with `tameUnit_mem_unitGroup`, `tameUnit_mul_left` and `tameUnit_steinberg`, and checks the normalisations ∂{u, π} = ū and ∂{π, u} = ū⁻¹.

v : F → ℤᵐ⁰ is a surjective (normalised) discrete valuation on the field F, with valuation ring R, residue field k and a chosen uniformiser t (ord_v t = 1). f and g are nonzero elements of F.

Provide the following API.

- `tameSymbol`: For a surjective v : F → ℤᵐ⁰ and f, g ∈ F^×, tameSymbol v f g := (−1)^{ord f·ord g}·res(u_f)^{ord g}·res(u_g)^{−ord f} ∈ k_v^×, with unit parts taken against a uniformiser fixed by choice.
- `tameSymbol_eq_residue`: tameSymbol v f g = (−1)^{ord f·ord g}·res(f^{ord g}·g^{−ord f}), the element f^{ord g}g^{−ord f} lying in R^× (§9.3).
- `tameSymbol_unit_uniformizer`: If ord u = 0 and ord t = 1 then tameSymbol v u t = res u.
- `tameSymbol_uniformizer_unit`: If ord u = 0 and ord t = 1 then tameSymbol v t u = (res u)^{−1}.
- `tameSymbol_of_ord_eq_zero`: If ord f = ord g = 0 then tameSymbol v f g = 1.
- `tameSymbol_swap`: tameSymbol v g f = (tameSymbol v f g)^{−1}.
- `tameSymbol_self`: tameSymbol v f f = (−1)^{ord f}.
- `tameSymbol_neg_self`: tameSymbol v f (−f) = 1.
- `tameSymbol_kbook`: The K-book's ∂_v({r,s}) of Lemma III.6.3 is tameSymbol v s r = (tameSymbol v r s)^{−1}.
- `tameSymbol_dvr`: For a DVR R with fraction field F and irreducible ϖ, writing f = u_f·ϖ^{n_f}, tameSymbol (the valuation of R) f g = (−1)^{n_f n_g}·ū_f^{n_g}·ū_g^{−n_f}.
- `tameSymbol_place`: For a place P of a function field, a uniformiser t at P and f with P.ord f = 0: tameSymbol P f t = Place.residueUnit P f.
- `TameSymbol.valuationSubringMap`: For a field embedding F → E and discrete valuations with ord_w(f(r)) = e·ord_v(r), e ∈ ℕ, the restricted ring map 𝒪_v →+* 𝒪_w is defined without a finiteness assumption.
- `TameSymbol.residueFieldMap`: For the same embedding, require he : 0 < e. The valuation-ring map is local, since ord_w(f(r)) > 0 iff ord_v(r) > 0 for r ≠ 0, and IsLocalRing.ResidueField.map yields k_v →+* k_w. No finite-dimensionality assumption is used.

**Checks.**

- On ℚ with the 5-adic valuation: tameSymbol 2 5 = 2 and tameSymbol 5 2 = 3 in F_5^×.
- On ℚ at 5: tameSymbol 5 5 = 4 = −1 and tameSymbol 10 5 = 3; a definition without the factor (−1)^{v(f)v(g)} gives 1 and 2.
- On ℚ at 5: tameSymbol 2 3 = 1, and tameSymbol f 1 = 1 for every f.
- On k(t) at the place t − b (b ∈ k): tameSymbol a (t − b) = a for a ∈ k^×, whereas the K-book's Weil reciprocity 6.5.3 (PDF p. 244) uses ∂_{t−b}(a, t − b) = a^{−1} in its normalisation.
- tameSymbol 5 2 = 3 ≠ 2 = ∂_5(5,2) of Lemma III.6.3: a silent use of the source's formula fails this.
- For e > 0 and a ∈ 𝒪_v, residueFieldMap v w e he hvw (res_v a) = res_w (valuationSubringMap v w e hvw a).
- For ℚ → ℚ(u) with w the u-adic valuation, ord_w is zero on every nonzero rational (e = 0). The 5-adic nonunit 5 maps to a unit of 𝒪_w, so the valuation-ring map is not local and no residue-field map F_5 → ℚ is asserted.

*Needs:* Tau Ceti `Valuation.ord`; Tau Ceti `Valuation.exists_isUniformizer_of_surjective`; Tau Ceti `Valuation.exists_eq_zpow_mul_unit_of_surjective`; Mathlib `ValuationSubring.unitGroupToResidueFieldUnits`; Mathlib `IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible`; Tau Ceti `TauCeti.Place.residueUnit`; Mathlib `Units`; Mathlib `IsLocalRing.ResidueField.map`.

### 9.3 Independence from the uniformiser

For f, g ∈ F^× the element f^{ord_v g}·g^{−ord_v f} has order zero, hence lies in R^×, and ∂_v{f,g} = (−1)^{ord_v(f)·ord_v(g)}·res(f^{ord_v g}·g^{−ord_v f}). The right-hand side involves no uniformiser, so ∂_v does not depend on the uniformiser t used to form the unit parts: this is the displayed formula, with the bar applied to a unit. (Weibel, Lemma III.6.3, proof, p. 234.)

v is a surjective discrete valuation on F with valuation ring R and residue field k; t and t′ are uniformisers. f and g are nonzero elements of F.

**Checks.**

- On ℚ at 5, computing with t = 5 (u_{10} = 2, u_5 = 1) and with t = 10 (u_{10} = 1, u_5 = 1/2) both give ∂{10,5} = 3.
- The sign (−1)^{ord f·ord g} depends only on the orders.
- The residue is taken of a unit of R, as the definition requires.

*Needs:* §9.2; Tau Ceti `Valuation.ord_mul`; Tau Ceti `Valuation.ord_zpow`; Tau Ceti `Valuation.isUnit_iff_ord_eq_zero`; Mathlib `ValuationSubring.unitGroupToResidueFieldUnits`.

### 9.4 The tame symbol is bilinear and satisfies the Steinberg relation

The pairing ∂_v is bimultiplicative, ∂_v{ff′,g} = ∂_v{f,g}·∂_v{f′,g} and ∂_v{f,gg′} = ∂_v{f,g}·∂_v{f,g′}, and satisfies the Steinberg relation ∂_v{r, 1 − r} = 1 for every r ∈ F \ {0,1}. (The induced homomorphism out of K^M_2(F) and K_2(F), and its surjectivity, are §9.5.) (Weibel, Lemma III.6.3, proof, p. 234.)

v is a surjective discrete valuation on F with valuation ring R, maximal ideal 𝔪 and residue field k. f, f′, g, g′ ∈ F^×; r ∈ F with r ≠ 0, 1.

**Checks.**

- The four cases are exhaustive because r ∈ R forces 1 − r ∈ R; all four are written out.
- On ℚ at 5, with r = 1/5 and 1 − r = 4/5 (both of order −1): ∂{1/5, 4/5} = (−1)^{1}·res((1/5)^{−1}·(4/5)^{1}) = −4 = 1 in F_5^×; the formula without the sign factor would give 4.
- The relation holds in both normalisations, each being the other's inverse.

*Needs:* §9.2; §9.3; Tau Ceti `Valuation.ord_mul`; Tau Ceti `Valuation.mem_maximalIdeal_iff_ord_pos`; Tau Ceti `Valuation.ord_add_eq_min_of_ord_ne`.

### 9.5 The tame symbol as a homomorphism out of K₂

The pairing ∂_v of §9.4 induces a group homomorphism ∂_v : K^M_2(F) → k^× (source written additively) with ∂_v{f,g} = tameSymbol v f g, and, through Matsumoto's isomorphism K^M_2(F) ≅ K_2(F), a homomorphism K_2(F) → k^× with the same value on Steinberg symbols. It is surjective: ∂_v{ũ, t} = u for any lift ũ ∈ R^× of u ∈ k^×. (Weibel, Lemma III.6.3, p. 234; Weibel, III.7.1, p. 245.)

v is a surjective discrete valuation on F with valuation ring R, residue field k and uniformiser t.

Provide the following API.

- `tameSymbolHom`: The homomorphism K^M_2(F) →+ Additive k^× induced by tameSymbol v.
- `tameSymbolHom_symbol`: tameSymbolHom v {f, g} = tameSymbol v f g.
- `tameSymbolHom_surjective`: tameSymbolHom v is surjective.
- `tameSymbolHomK2`: The homomorphism K_2(F) → k^× obtained through Matsumoto's isomorphism, with the same value on Steinberg symbols.
- `tameSymbolHom_symbol_units`: tameSymbolHom v {u, w} = 0 (the trivial unit) for u, w ∈ R^×.
- `tameSymbolHom_kbook`: The K-book's ∂_v on K_2(F) equals −tameSymbolHom v (additively).

**Checks.**

- On ℚ at 5: tameSymbolHom {5, 2} = 3 and tameSymbolHom {2, 5} = 2 in F_5^×.
- On ℚ at 5: tameSymbolHom {2, 3} = 0, the trivial unit.
- On ℚ at 5: tameSymbolHom {2, 5} = 2 generates F_5^×, so the map is onto.
- The unsigned formula res(f^{v(g)}g^{−v(f)}) sends the Steinberg element {1/5, 4/5} of K^M_2(ℚ) to 4 ≠ 1, so it does not descend; the signed one sends it to 1.
- {5,5} = {5,−1} in K^M_2(ℚ) and both go to −1 = 4 in F_5^×.

*Needs:* §5.4; §7.12; §9.4; Mathlib `ValuationSubring.surjective_unitGroupToResidueFieldUnits`.

### 9.6 Characterization of the normalized tame symbol

Let v be a surjective valuation F→ℤᵐ⁰, t∈Fˣ with ord_v(t)=1, R its valuation ring, k its residue field, and res:Rˣ→kˣ the unit residue. If c:Fˣ×Fˣ→kˣ is multiplicative in each variable, satisfies c(a,1−a)=1 for a≠0,1, is one on pairs of R-units, and satisfies c(u,t)=res(u) for every R-unit u, then c(f,g)=tameSymbol(v,f,g) for all field units f,g. Equivalently the descended Milnor homomorphism is uniquely determined by unit-unit vanishing and its values on {u,t}; the classical-K₂ version uses Matsumoto's isomorphism (§7.12). (Weibel, Discussion after Theorem III.6.1, Definition III.6.2, Lemma III.6.3 and proof, pp. 231, 232, 234.)

F is a commutative field and v is normalized and surjective. No completeness, finiteness of the residue field or characteristic restriction is imposed. c takes values in the actual residue-field unit group; complementary inputs are nonzero. Both the unit-unit and mixed-pair normalizations are required.

**Checks.**

- The constant-one pairing fails c(2,5)=2 over ℚ at 5.
- The inverse K-book pairing fails the same normalization since it sends (2,5) to 3.
- The unsigned formula satisfies the mixed values but fails the Steinberg hypothesis on (1/5,4/5), where it is 4 rather than 1 at 5.
- No claim that all of K₂ is generated solely by {u,t} is used: pairs of ring units are killed only after applying this homomorphism.

*Needs:* §5.2; §5.3; §9.1; §9.2; §9.4; §9.5.

### 9.7 Behaviour under a valued field embedding: the ramification formula

Let F → E be any field embedding, v and w normalised surjective discrete valuations with ord_w(f(r)) = e·ord_v(r) and e ≥ 1; the induced local map of valuation rings gives k_v → k_w. No finite-dimensionality assumption is needed. Then tameSymbol w r₁ r₂ = (tameSymbol v r₁ r₂)^e in k_w^× for r₁, r₂ ∈ F^×; equivalently ∂_w ∘ res_{E/F} = (·)^e ∘ ∂_v on K^M_2(F). For the finite-extension refinement only, if E/F is finite and w₁, …, w_n are the valuations of E over v (the primes of the integral closure S of R over 𝔪_v) and all e_i = 1, the diagonal k_v^× → ∏_i k_{w_i}^× carries ∂_v(x) to (∂_{w_i}(x))_i. The formula reads the same in the roadmap's and in the K-book's normalisation, both sides being inverted. (Weibel, Remark III.6.3.1, p. 234; Weibel, Remark III.6.3.1, continued, p. 235.)

F → E is a field embedding; v and w are normalised surjective discrete valuations with ord_w(f(r)) = e·ord_v(r), e ≥ 1. For the unramified refinement only: E/F is finite, w₁, …, w_n are all its valuations over v and each e_i = 1.

**Checks.**

- ℚ ⊂ ℚ(√5), v 5-adic, w over 5 with e = 2 and k_w = F_5: tameSymbol w 5 5 = 1 = (−1)² and tameSymbol w 2 5 = 4 = 2².
- ℚ ⊂ ℚ(i) at 5 (5 splits, e₁ = e₂ = 1, residue fields F_5): both w_i give tameSymbol 2 5 = 2, the diagonal image of 2.
- The sign transforms uniformly because e² ≡ e (mod 2); no case split on the parity of e is needed.
- The formula concerns classes from F; for classes of E the relevant statement is the norm–residue formula (§10.27).
- Infinite example: ℚ → ℚ(u), v the 5-adic valuation and w its Gauss extension (minimum coefficient order), e = 1, k_w = F_5(u): ∂_w{2,5} = 2. The map with w the u-adic valuation instead has trivial restriction and is not this positive-e case.

*Needs:* §5.4; §9.3; §9.5; Tau Ceti `Valuation.ord`.

### 9.8 The tame symbol through unit parts

Let f,g∈Fˣ, a=ord_v(f), b=ord_v(g), π∈Fˣ of order one, and write r:Rˣ→kˣ for Units.map(IsLocalRing.residue R). The expression T_π(f,g)=(−1)^(ab) r(U_π(f))^b r(U_π(g))^(−a) equals tameSymbol_v(f,g) of §9.2. If z∈Rˣ has field value f^b g^(−a), then T_π(f,g)=(−1)^(ab)r(z). Such z exists because its field value has order zero. Consequently the expression agrees with the uniformizer-free formula of §9.3 through R.unitGroupMulEquiv and is independent of π. This is an equality of pairings on Fˣ×Fˣ before any K-group quotient. (Weibel, III.6.3 and III.6.3.1, p. 234.)

**Checks.**

- At ord_5, T_5(2,5)=2, T_5(5,2)=3, T_5(5,5)=4 and T_5(10,5)=3 in 𝔽_5ˣ.
- For f=1/5 and g=4/5, the negative-order Steinberg test gives 1, including the sign.
- Under a field embedding with positive ramification index e and the induced residue embedding, the target tame value is the e-th power of the mapped source tame value. Finite-dimensionality is not assumed.

*Needs:* §9.1; §9.2; §9.3; §9.4; §9.7; Tau Ceti `Valuation.ord_mul`; Tau Ceti `Valuation.ord_zpow`; Tau Ceti `Valuation.isUnit_iff_ord_eq_zero`; Tau Ceti `Valuation.mem_valuationSubring_iff_ord_nonneg`; Mathlib `IsLocalRing.residue`; Mathlib `ValuationSubring.unitGroupMulEquiv`; Mathlib `ValuationSubring.unitGroupToResidueFieldUnits`.

### 9.9 Serre's algebra L(k) with the indeterminate Π

For a field k let L(k) be the graded abelian group with L(k)_n = K^M_n(k) ⊕ K^M_{n−1}(k), the second summand written b·Π, with multiplication (a + bΠ)(c + dΠ) = ac + (ad + (−1)^{|c|}bc + (−1)^{|d|}bd·{−1})Π for homogeneous a, b, c, d. It is an associative, unital, graded-commutative ring (xy = (−1)^{|x||y|}yx), containing K^M_*(k) as the subring b = 0, and Π = (0, 1) ∈ L(k)_1 satisfies Π·Π = {−1}·Π and Π·{c} = −{c}·Π. The maps a + bΠ ↦ a (the λ-part) and a + bΠ ↦ a + b{−1} (the ρ-part) are graded ring homomorphisms L(k) → K^M_*(k), and for c ∈ k^× the assignment Π ↦ Π − {c} extends to a graded ring automorphism σ_c of L(k) over K^M_*(k). This is the 'graded K^M_*(k_v)-algebra generated by an indeterminate Π in L1, with the relation {Π, Π} = {−1, Π}' of the source, made explicit. (Weibel, Theorem III.7.3, proof, p. 246.)

k is a field; K^M_*(k) is the graded ring of §5.4, graded-commutative by §5.10.

Provide the following API.

- `serreAlgebra`: The graded ring L(k) with L(k)_n = K^M_n(k) × K^M_{n−1}(k).
- `serreAlgebra.Π`: The element Π = (0, 1) of degree one.
- `serreAlgebra.of`: The graded ring embedding K^M_*(k) → L(k), a ↦ (a, 0).
- `serreAlgebra.mul_def`: (a + bΠ)(c + dΠ) = ac + (ad + (−1)^{|c|}bc + (−1)^{|d|}bd{−1})Π.
- `serreAlgebra.Π_mul_Π`: Π·Π = {−1}·Π.
- `serreAlgebra.Π_mul`: Π·x = (−1)^{|x|}·x·Π for x ∈ K^M_*(k).
- `serreAlgebra.gradedComm`: L(k) is graded-commutative.
- `serreAlgebra.decompose`: L(k)_{n+1} ≃ K^M_{n+1}(k) ⊕ K^M_n(k) for n ≥ 0, and L(k)_0 = K^M_0(k).
- `serreAlgebra.lambdaHom`: The graded ring homomorphism L(k) → K^M_*(k), a + bΠ ↦ a.
- `serreAlgebra.rhoHom`: The graded ring homomorphism L(k) → K^M_*(k), a + bΠ ↦ a + b·{−1}.
- `serreAlgebra.shift`: For c ∈ k^×, the graded ring automorphism with Π ↦ Π − {c}; shift c ∘ shift c′ = shift (cc′).
- `serreAlgebra.map`: A field homomorphism k → k′ induces L(k) → L(k′) fixing Π, with map_id and map_comp.

**Checks.**

- Over F_5: Π·Π = {4}·Π, and {4} ≠ 0 in K^M_1(F_5).
- Over F_2 (or any field of characteristic two): Π·Π = 0.
- Over F_5: Π·{2} = {3}·Π (as −{2} = {2^{−1}} = {3}), and Π·{2} ≠ {2}·Π.
- lambdaHom ∘ of = id on K^M_*(k) and lambdaHom Π = 0.
- With Π·Π = 0 instead, the map d of §9.10 would send {5, −5}, which is 0 in K^M_2(ℚ), to Π·({−1} + Π) = {−1}·Π ≠ 0 over F_5; in L(k) it goes to {−1}Π + {−1}Π = 0.

*Needs:* §5.4; §5.10.

### 9.10 Serre's map kills the Steinberg elements

For a surjective discrete valuation v on F with uniformiser t, the map d_t : F^× → L(k)_1, d_t(u·t^i) = {ū} + i·Π (u ∈ R^×, i ∈ ℤ), is a group homomorphism with d_t(r)·d_t(1 − r) = 0 in L(k)_2 for every r ∈ F \ {0, 1}. (Weibel, Theorem III.7.3, proof, p. 246.)

v is a surjective discrete valuation on F with valuation ring R, maximal ideal 𝔪, residue field k and uniformiser t.

**Checks.**

- The case analysis covers r ∈ R^×, ord r > 0 and r ∉ R, and reduces the last to d(x)d(−x) = 0.
- With Π² = 0 the last step fails: over F_5, d(5)d(−5) = {−1}Π ≠ 0 (§9.9, non-example).

*Needs:* §5.4; §5.10; §9.2; §9.9; Tau Ceti `Valuation.ord_mul`; Tau Ceti `Valuation.mem_maximalIdeal_iff_ord_pos`.

### 9.11 Higher tame symbols and specialisation maps

For a surjective discrete valuation v on F with uniformiser t and residue field k, the homomorphism d_t of §9.10 extends uniquely to a graded ring homomorphism d_t : K^M_*(F) → L(k). Writing d_t(x) = λ_t(x) + ∂_v(x)·Π with Π on the right defines the specialisation λ_t : K^M_n(F) → K^M_n(k), a graded ring homomorphism depending on t, and the higher residue ∂_v : K^M_n(F) → K^M_{n−1}(k). On symbols, λ_t{u_1t^{i_1}, …, u_nt^{i_n}} = {ū_1, …, ū_n}, ∂_v{u_1, …, u_{n−1}, t} = {ū_1, …, ū_{n−1}} and ∂_v{u_1, …, u_n} = 0; in degree one ∂_v{f} = ord_v f, and in degree two ∂_v = tameSymbolHom of §9.5, with no inversion. Both maps are surjective. Theorem III.7.3 reads off the coefficient with Π on the left, ∂^{Wb}{t, u_2, …, u_n} = {ū_2, …, ū_n}; since Π·y = (−1)^{n−1}y·Π for y ∈ K^M_{n−1}(k), ∂^{Wb} = (−1)^{n−1}·∂_v on K^M_n(F): the two agree in odd degree and differ by a sign in even degree, and in degree two ∂^{Wb} is the K-book's tame symbol, the inverse of Layers 9–11's. (Weibel, Theorem III.7.3, p. 246; Weibel, Theorem III.7.3, proof, p. 246.)

v is a surjective discrete valuation on F with valuation ring R, residue field k and a chosen uniformiser t.

Provide the following API.

- `serreMap`: The graded ring homomorphism d_t : K^M_*(F) → L(k) with d_t{f} = {ū_f} + ord(f)·Π.
- `milnorResidue`: ∂_v : K^M_n(F) → K^M_{n−1}(k), the Π-coefficient of d_t with Π on the right.
- `milnorSpecialisation`: λ_t : K^M_n(F) → K^M_n(k), the Π-free part of d_t.
- `milnorResidue_symbol_units_uniformizer`: ∂_v{u_1, …, u_{n−1}, t} = {ū_1, …, ū_{n−1}}.
- `milnorResidue_symbol_units`: ∂_v{u_1, …, u_n} = 0 for units u_i.
- `milnorSpecialisation_symbol`: λ_t{u_1t^{i_1}, …, u_nt^{i_n}} = {ū_1, …, ū_n}.
- `milnorSpecialisation_mul`: λ_t is a graded ring homomorphism.
- `milnorResidue_one`: In degree one ∂_v{f} = ord_v f.
- `milnorResidue_two`: In degree two ∂_v = tameSymbolHom v.
- `milnorResidue_kbook`: Theorem III.7.3's residue equals (−1)^{n−1}·∂_v on K^M_n(F).
- `milnorResidue_surjective`: ∂_v is onto.
- `milnorSpecialisation_surjective`: λ_t is onto.
- `milnorResidue_indep`: ∂_v does not depend on t (§9.15).
- `milnorResidue_mul`: The product formula (§9.14).

**Checks.**

- Over ℚ at 5 with t = 5: ∂_v{50} = 2 and λ_5{50} = 2 in F_5^×.
- Over ℚ at 5: ∂_v{5, 2} = 3 = tameSymbol 5 2 and ∂_v{2, 5} = 2.
- Over ℚ(t) with the t-adic valuation: ∂{t, 5, 2} = {5, 2} and ∂{5, t, 2} = −{5, 2} in K^M_2(ℚ); they differ, since the tame symbol at 5 sends {5, 2} to 3 and −{5, 2} to 2.
- ∂_v{u_1, …, u_n} = 0 for units u_i; for F = ℚ(t) with the t-adic valuation, ∂_t vanishes on the image of K^M_n(ℚ) and λ_t restricts to the identity there.
- Over ℚ at 5: λ_5{5} = 1 but λ_{10}{5} = 3 in F_5^×, while ∂_v{5} = 1 for both.
- With Π² = 0 in place of Π² = {−1}Π, d{5, −5} = {−1}Π ≠ 0 over F_5 although {5, −5} = 0 in K^M_2(ℚ): the construction does not descend without the relation.

*Needs:* §5.4; §9.5; §9.9; §9.10; Mathlib `ValuationSubring.surjective_unitGroupToResidueFieldUnits`.

### 9.12 The kernel of Serre's map

For every n ≥ 1 the kernel of d_t : K^M_n(F) → L(k)_n is U¹·K^M_{n−1}(F), the subgroup generated by the products {a}·y with a ∈ U¹ = 1 + 𝔪 (the principal units) and y ∈ K^M_{n−1}(F). (Weibel, Exercise III.7.2, p. 257.)

v is a surjective discrete valuation on F with valuation ring R, maximal ideal 𝔪, residue field k and uniformiser t; n ≥ 1.

**Checks.**

- n = 1: the kernel of f ↦ ({ū_f}, ord f) on F^× is U¹.
- The kernel does not depend on t, since U¹ does not.
- Consequently ker λ_t = U¹K^M_{n−1}(F) + {t}·K^M_{n−1}(F), the second statement of Ex. III.7.2.

*Needs:* §5.4; §5.10; §9.9; §9.11; Mathlib `ValuationSubring.ker_unitGroupToResidueFieldUnits`.

### 9.13 Finite support of the residues

Let V be a set of discrete valuations on F such that every f ∈ F^× has ord_v f ≠ 0 for only finitely many v ∈ V — for instance the places of a function field, or the height-one primes of a Dedekind domain with fraction field F. Then for x ∈ K^M_n(F) (n ≥ 1) written as a finite sum of symbols {f_{j,1}, …, f_{j,n}}, ∂_v(x) = 0 for every v ∈ V outside the finite union of the sets {v : ord_v f_{j,i} ≠ 0}. In degree two this is the statement for tameSymbolHom; in particular tameSymbol v f g = 1 whenever ord_v f = ord_v g = 0. (Weibel, Localization Theorem III.6.5, p. 236; Weibel, Theorem III.7.4, p. 247.)

V is a set of discrete valuations on F in which each nonzero element has nonzero order at only finitely many members. x ∈ K^M_n(F) is given as a finite sum of symbols.

**Checks.**

- The support of {f, g} lies in the union of the supports of f and g, and can contain points where only one of them has nonzero order ({2,5} at 5).
- The support of a finite sum of symbols lies in the union of the supports of the summands.
- For units of a Dedekind domain R (order zero everywhere) the symbols are trivial at every height-one prime.
- This is what makes the maps into the direct sums of Theorem III.6.5 and Theorem III.7.4 well defined.

*Needs:* §9.5; §9.11; Tau Ceti `TauCeti.Place.finite_setOf_ord_ne_zero`; Mathlib `IsDedekindDomain.HeightOneSpectrum.Support.finite`.

### 9.14 The product formula for the higher residue

For x ∈ K^M_i(F) and y ∈ K^M_j(F): ∂_v(x·y) = λ_t(x)·∂_v(y) + (−1)^j·∂_v(x)·ρ_t(y), where ρ_t : K^M_*(F) → K^M_*(k) is the graded ring homomorphism rhoHom ∘ d_t, characterised by ρ_t{u·t^m} = {(−1)^m ū}. In particular ∂_v(x·y) = x̄·∂_v(y) when x is a product of symbols of units, so ∂_v is a homomorphism of left modules over the image of K^M_*(R^×). This is Ex. III.7.10 as printed, which holds for the roadmap's normalisation; for Theorem III.7.3's normalisation the formula is ∂^{Wb}(x·y) = (−1)^i λ_t(x)·∂^{Wb}(y) + ∂^{Wb}(x)·ρ_t(y) (recorded as a source issue). (Weibel, Exercise III.7.10, p. 258.)

v is a surjective discrete valuation on F with uniformiser t and residue field k; x ∈ K^M_i(F), y ∈ K^M_j(F).

**Checks.**

- Over ℚ at 5, x = {5}, y = {2}: ∂{5, 2} = 0 − 1·{2} = −{2}, i.e. 3 in F_5^×, matching tameSymbol 5 2 = 3.
- x = {2}, y = {5}: ∂{2, 5} = {2}·1 − 0 = {2}, i.e. 2.
- Read with Theorem III.7.3's normalisation, the printed formula would give ∂^{Wb}{5, 2} = 3, contradicting ∂^{Wb}{5, 2} = 2 from Theorem III.7.3.

*Needs:* §9.9; §9.11.

### 9.15 The residue is independent of the uniformiser; the specialisation is not

Let t′ = c·t be a second uniformiser (c ∈ R^×). Then ∂_v computed with t′ equals ∂_v computed with t, and λ_{t′}(x) = λ_t(x) − ∂_v(x)·{c̄} for x ∈ K^M_n(F) (product in K^M_*(k)). In particular λ depends on the uniformiser: in degree one λ_{t′}{t} = −{c̄}, i.e. c̄^{−1}. This corrects Ex. III.7.1, which asserts that λ is independent of π; Weibel's errata make the same correction. (Weibel, Exercise III.7.1, p. 257.)

v is a surjective discrete valuation on F with valuation ring R and residue field k; t and t′ = c·t are uniformisers, c ∈ R^×.

**Checks.**

- Over ℚ at 5 with t = 5, t′ = 10 (c = 2): λ_5{5} = 1 and λ_{10}{5} = 3 = 2^{−1} in F_5^×; ∂{5} = 1 for both.
- ∂_v is independent of the uniformiser, confirming the first half of Ex. III.7.1.
- λ_t is unchanged when c̄ = 1, i.e. when t′ ≡ t modulo 𝔪².

*Needs:* §9.9; §9.11; Tau Ceti `Valuation.isUnit_iff_ord_eq_zero`.

### 9.16 Residue convention dictionary

For every n≥1, let ∂^last_v:K^M_n(F)→K^M_(n−1)(k) be the residue of §9.11, normalized by ∂^last{u₁,…,u_(n−1),π}={ū₁,…,ū_(n−1)} and zero on all-unit symbols. Let ∂^first be the residue of Weibel III.7.3, normalized with π first. As homomorphisms, ∂^first_v=(−1)^(n−1)∂^last_v. In degree one both are ord_v; in degree two, under K^M_1(k)=kˣ, ∂^last is tameSymbolHom and ∂^first is its inverse. If d_π(x)=λ_π(x)+∂^last_v(x)Π in the Serre algebra, Π is on the right. For homogeneous x of degree i and y of degree j, ∂^last(xy)=λ_π(x)∂^last(y)+(−1)^j∂^last(x)ρ_π(y), where ρ_π{uπ^m}={(−1)^mū}. In the first normalization the corresponding law is ∂^first(xy)=(−1)^iλ_π(x)∂^first(y)+∂^first(x)ρ_π(y). For π′=cπ, λ_π′(x)=λ_π(x)−∂^last(x){c̄}, while ∂^last does not change. (Weibel, III.7.3, Exercises III.7.1 and III.7.10, pp. 246, 257, 258.)

**Checks.**

- In degree three both residues send {u₁,u₂,π} to {ū₁,ū₂}; in degree two they take inverse values on {2,5} at ord_5.
- λ_5{5}=1 but λ_10{5}=3 in 𝔽_5ˣ. Independence of specialization would fail this test.
- For x={5}, y={2}, the last-normalization product law gives 3 and the first-normalization law gives 2 in 𝔽_5ˣ.

*Needs:* §5.4; §5.10; §9.5; §9.9; §9.11; §9.14; §9.15.

### 9.17 Rigidity for a complete discretely valued field

Let v be a discrete valuation on F with valuation ring R, uniformiser t and residue field k, and suppose F is complete with respect to v (R is 𝔪-adically complete). For every integer q ≥ 1 prime to char(k) (any q ≥ 1 if char k = 0) and every n ≥ 0, (λ_t, ∂_v) : K^M_n(F)/q → K^M_n(k)/q ⊕ K^M_{n−1}(k)/q is an isomorphism. (Weibel, Corollary III.7.3.1, p. 246; Weibel, Corollary III.7.3.1, proof, p. 247.)

F is complete with respect to the discrete valuation v, with residue field k. q is a positive integer prime to the characteristic of k.

**Checks.**

- The statement is modulo q, not integral: K^M_1(ℚ_p) = ℚ_p^× is not k^× ⊕ ℤ, U¹ being uncountable.
- n = 1: F^×/q ≅ k^×/q ⊕ ℤ/q.
- The hypothesis on q is needed: for F = ℚ_p (p odd), n = 1 and q = p, F^×/p ≅ (ℤ/p)² while F_p^×/p ⊕ ℤ/p ≅ ℤ/p.
- The proof uses only that R is Henselian; the source's completeness hypothesis is kept.

*Needs:* §9.9; §9.11; §9.12; Tau Ceti `TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem`; Mathlib `HenselianRing`.

### 9.18 Ramification and the higher residue

Let F → E be any field embedding and v, w normalised surjective discrete valuations satisfying ord_w(f(r)) = e·ord_v(r), e ≥ 1, with the induced residue-field embedding k_v → k_w. No finite-dimensionality hypothesis is imposed. For x ∈ K^M_n(F): ∂_w(res_{E/F} x) = e·res_{k_w/k_v}(∂_v x) in K^M_{n−1}(k_w). In degree two this is §9.7. The statement reads the same in both normalisations, each side changing by (−1)^{n−1}. The finite-extension special case is Exercise III.7.8; the same elementary uniformiser/unit proof gives the stated embedding generalisation, one of the elementary Milnor residue identities Kato's proof uses (with Exercises III.7.7 and III.7.9 and Corollary III.7.6.3); it is parented in Layer 10, before §10.24, and realises the ramification clause of Layer 11. (Weibel, Exercise III.7.8, p. 257.)

F → E is an arbitrary field embedding, v and w are normalised surjective discrete valuations, ord_w(f(r)) = e·ord_v(r), and e ≥ 1. A valuation on E trivial on F is a separate case, not a positive-e extension of v.

**Checks.**

- n = 1: ord_w(r) = e·ord_v(r).
- n = 2: the e-th power formula of §9.7.
- The residue fields enter only through res_{k_w/k_v}; the inertia degree does not appear.
- Infinite constant extension F(t) → F(u)(t): at the place t, e = 1 and k_v = F → F(u) = k_w; ∂_w{a,t} is the image of a for a ∈ F^×. For F = ℚ and a = 2 this is 2, not its inverse.
- Completion F → F̂_v has e = 1 and the same residue field, so the formula gives ∂_{v̂} ∘ res = ∂_v without requiring the completion to be finite over F.
- Trivial-restriction case: the place t−u of F(u)(t) is trivial on F(t), because every nonzero polynomial p(t) ∈ F[t] has p(u) ≠ 0. Every Milnor symbol from F therefore has zero residue there.
- Instantiate higher_ramification_formula at ℚ → ℚ(u), the 5-adic valuation and its e = 1 Gauss extension: the residues commute in every degree, with k_w = F_5(u).
- For any field embedding F → E and surjective discrete w trivial on F^×, the residue of every symbol from F {a_1,…,a_{n+1}} is 0. In particular this applies to F(t) → F(u)(t) at t−u, which has no positive ramification index over a nontrivial place of F(t).

*Needs:* §5.4; §9.7; §9.11; §9.12.

### Examples

- On ℚ at 5: ∂{2, 5} = 2, ∂{5, 2} = 3, ∂{5, 5} = 4 = −1, ∂{10, 5} = 3 in 𝔽₅^×; the unsigned formula sends the Steinberg element {1/5, 4/5} to 4 instead of 1.
- With uniformisers 5 and 10 at 5, λ₅{5} = 1 but λ₁₀{5} = 3: the residue is independent of the uniformiser, the specialisation is not (correcting Weibel Ex. III.7.1).
- Rigidity needs q prime to the residue characteristic: ℚ_p^×/p ≅ (ℤ/p)² while 𝔽_p^×/p ⊕ ℤ/p ≅ ℤ/p.

### Dependencies

Layers 5 and 7; Tau Ceti `Valuation.ord` API and `Place`; Mathlib valuation subrings and residue maps; LocalFieldsRamification Layer 1.

## Layer 10: rational function fields, Milnor norms and reciprocity

The Bass–Tate (Milnor) exact sequence 0 → K_nᴹ(F) → K_nᴹ(F(t)) → ⊕_π K_{n−1}ᴹ(F[t]/π) → 0 through the degree filtration, the simple Milnor transfer defined through the residue at infinity, its projection and degree formulas and Weil reciprocity on ℙ¹, Kato's theorem that the composite of simple transfers is independent of the generators, base change of norms with Artinian lengths, the norm–residue square for complete discretely valued fields and for finite normalisations, and Suslin's reciprocity law Σ_P N_{k(P)/F} ∂_P(x) = 0 for every function field of one variable over any field, with its tame-symbol and disjoint-support forms. The normalized extension of a complete discrete valuation to a finite extension, the integral closure and the norm identities, which no lower roadmap supplies for arbitrary residue fields, are targets here (§10.15 to §10.18). After norms, §§10.32–10.33 compute the high-degree Milnor groups of global fields.

### 10.1 Leading coefficients split K^M_n(F) off K^M_n F(t) (Example III.7.3.2)

Let F be a field and, for nonzero f ∈ F(t), let lead(f) be the quotient of the leading coefficients of its numerator and denominator. Let λ: K^M_n F(t) → K^M_n(F) be the specialisation map of §9.11 at the place at infinity (order −deg, residue field F) with respect to the uniformiser t^{−1}. Then λ{f_1, …, f_n} = {lead(f_1), …, lead(f_n)}, λ is the identity on the image of K^M_n(F), so K^M_n(F) → K^M_n F(t) is a split injection in every degree, and the residue ∂_∞ vanishes on that image. (Weibel, III.7.3.2, Example 7.3.2, p. 247.)

F is a field and n ≥ 0. The specialisation is taken with respect to the uniformiser t^{−1}; with another uniformiser it changes, so the uniformiser is part of the data.

**Checks.**

- In degree one λ is the homomorphism f ↦ lead(f) from F(t)^× to F^×.
- In degree two λ is the leading-coefficient map of Example III.6.1.2, which §7.14 treats for K_2; the author's errata list corrects that example's three-case check when lead(f) = 1, a case this route does not need.
- Non-example: over ℚ, with the uniformiser 2t^{−1} instead of t^{−1}, the specialisation sends {t} ∈ K^M_1 to 2 rather than 1, so the formula is tied to t^{−1} (compare the author's erratum to Exercise III.7.1: λ depends on the uniformiser).

*Needs:* §5.4; §9.11; Tau Ceti `TauCeti.Place.ord_infty`; Tau Ceti `TauCeti.Place.isUniformizer_infty`; Tau Ceti `TauCeti.Place.inftyResidueFieldEquiv`.

### 10.2 Degree reduction for symbols of polynomials (Exercise III.6.2, corrected)

Let F be a field, d ≥ 1, and L_d ⊂ K^M_n F(t) the subgroup generated by the symbols {f_1, …, f_n} whose entries are nonzero polynomials of degree at most d. (i) If e_1 ≠ e_2 are monic polynomials of degree d and h = e_1 − e_2 (nonzero, of degree < d), then {e_1, e_2} = {h, e_2} − {h, e_1} + {e_1, −1} in K^M_2 F(t). (ii) Consequently L_d is generated by L_{d−1} together with the symbols {π, a_2, …, a_n} with π monic irreducible of degree d and each a_i a nonzero polynomial of degree < d. The source's Exercise III.6.2, which allows only e_1 as an entry of degree d, is false as printed; (i) is what the source's proof of Lemma III.7.4.2 uses. (Weibel, Exercise III.6.2, p. 243; Weibel, III.6.1.4, Lemma 6.1.4 and its proof, p. 232; Weibel, III.7.4.2, proof of Lemma 7.4.2, p. 248.)

F is a field, t an indeterminate, d ≥ 1 and n ≥ 1; L_0 is the image of K^M_n(F).

**Checks.**

- Over ℚ(t), {t, t − 2} has residue 1/2 at the place t = 2 (K-book normalisation), while every symbol {t, c} or {c, c′} with c, c′ ∈ ℚ^× has trivial residue there; so {t, t − 2} is not a product of such symbols, as the printed exercise would require, but (i) writes it as {2, t − 2} − {2, t} + {t, −1}.
- For d = 1, (i) is Lemma III.6.1.4.
- (ii) is exactly the generation statement that the proof of Lemma III.7.4.2 cites from Exercise III.6.2.

*Needs:* §5.4; §5.10; §6.9.

**Generation of the degree filtration by monic irreducible entries.** For n≥1 and d≥1 let L_d be generated by n-symbols with nonzero polynomial entries of degree at most d. Then L_d/L_(d−1) is generated by symbols with exactly one monic irreducible degree-d entry and all other entries of degree <d. For distinct monic degree-d e₁,e₂, with h=e₁−e₂, {e₁,e₂}={h,e₂}−{h,e₁}+{e₁,−1}; for equal entries {e,e}={e,−1}. (Weibel, III.6.1.4, Exercise III.6.2, III.7.4.2, pp. 232, 243, 248.)

*Checks.*

- The repeated case is retained over ℝ(t); no exterior-algebra rule is assumed.
- For e₁=t,e₂=t−2 over ℚ, h=2; the identity gives the correct nontrivial residue 2 at t−2 in the uniformizer-last convention.
- For n=1 the assertion is polynomial factorization modulo constants; for d=1 the other entries are constants.

*Needs:* §5.4; §5.10; §6.9.

### 10.3 The section h_π on the degree filtration (Lemma III.7.4.1)

Let π ∈ F[t] be monic irreducible of degree d ≥ 1, k_π = F[t]/(π), and L_d as in §10.2. There is a unique homomorphism h_π : K^M_{n−1}(k_π) → L_d/L_{d−1} sending {ā_1, …, ā_{n−1}} to the class of {a_1, …, a_{n−1}, π}, where a_i ∈ F[t] is the unique representative of ā_i of degree < d. The source's h_π puts π first; the two differ by the sign (−1)^{n−1}, the same sign by which Theorem III.7.3's residue ∂^{Wb} differs from the residue ∂ of §9.11, so each is a section of its own residue. (Weibel, III.7.4.1, Lemma 7.4.1 and the paragraph before it, p. 247; Weibel, III.7.4.1, proof of Lemma 7.4.1, p. 247.)

F is a field, n ≥ 1 and π is monic irreducible of degree d; for n = 1 the source group is K^M_0(k_π) = ℤ and h_π(1) is the class of {π}.

**Checks.**

- For n = 1, h_π(1) is the class of {π} and ∂_π{π} = 1 in ℤ.
- For d = 1, π = t − b and k_π = F, h_π{c_1, …, c_{n−1}} is the class of {c_1, …, c_{n−1}, t − b}.
- Followed by the residue ∂_π it is the identity (§10.4), which pins its normalisation.

*Needs:* §5.4; §10.2; Mathlib `Polynomial.modByMonic`; Mathlib `Polynomial.degree_modByMonic_lt`.

### 10.4 The graded pieces of the degree filtration (Lemma III.7.4.2)

For d ≥ 1 the maps h_π of §10.3, over the monic irreducible π of degree d, induce an isomorphism ⊕_{deg π = d} K^M_{n−1}(k_π) ≅ L_d/L_{d−1} whose inverse is induced by the residues ∂_π: each ∂_π with deg π = d vanishes on L_{d−1}, ∂_π ∘ h_π is the identity, and ∂_{π′} ∘ h_π = 0 for π′ ≠ π of degree d. Residues are those of §9.11, ∂_π{u_1, …, u_{n−1}, π} = {ū_1, …, ū_{n−1}}, which in degree two is the roadmap's tame symbol; with Theorem III.7.3's ∂^{Wb} and the source's h_π (π first) the statement is the same. (Weibel, III.7.4.2, Lemma 7.4.2, p. 247; Weibel, III.7.4.2, proof of Lemma 7.4.2, p. 248.)

F is a field, n ≥ 1, d ≥ 1; the residue field of the place of π is identified with F[t]/(π) by the equivalence.

**Checks.**

- For d = 1 and F algebraically closed, L_1/L_0 ≅ ⊕_{b ∈ F} K^M_{n−1}(F), which in degree two is Example III.6.1.7.
- In degree one (n = 1) it says that the monic irreducible polynomials of degree d form a basis of the free abelian group L_d/L_{d−1}.
- ∂_π vanishes on L_{d−1} but not on L_d, which is what drives the induction on d.

*Needs:* §9.11; §10.2; §10.3; Tau Ceti `TauCeti.Place.adicOfIrreducibleResidueFieldEquiv`; Tau Ceti `TauCeti.Place.isUniformizer_adicOfIrreducible`.

### 10.5 The Bass–Tate (Milnor) exact sequence for a rational function field

For a field F and n ≥ 1 the sequence 0 → K^M_n(F) → K^M_n F(t) −∂→ ⊕_π K^M_{n−1}(F[t]/(π)) → 0, with π over the monic irreducible polynomials (the finite places of F(t)) and ∂ = (∂_π)_π the higher residues of §9.11, is exact, natural in F, and split by the leading-coefficient map λ of §10.1. The residue ∂_∞ at the place at infinity is not a component of ∂; since ∂_∞ vanishes on K^M_n(F), exactness makes it factor uniquely through ∂, which defines the transfers (§10.6) and gives the reciprocity formula for the projective line (§10.10). The K-book proves the sequence (Theorem III.7.4, attributed to Milnor); the roadmap calls it the Bass–Tate sequence. (Weibel, III.7.4, Theorem 7.4, p. 247; Weibel, III.7.4, proof of Theorem 7.4, p. 247; Weibel, III.6.5.2, Application 6.5.2, p. 236.)

F is a field, t an indeterminate and n ≥ 1; for n = 0 the sequence is 0 → ℤ → ℤ → 0 → 0. The sum is over the finite places of F(t); the place at infinity is not among them. Residues are those of §9.11; the sequence is the same for the K-book's ∂^{Wb} = (−1)^{n−1}∂, every residue in a given degree changing by the same sign.

**Checks.**

- In degree one it is 0 → F^× → F(t)^× → ⊕_π ℤ → 0, the divisor sequence of the affine line.
- In degree two it is the split exact sequence of Application III.6.5.2.
- Non-example: with ∂_∞ added the map is not onto; in degree one its image is the kernel of the degree map on divisors of ℙ¹, so the divisor of the single point ∞ is not in the image.

*Needs:* §5.4; §9.11; §9.13; §9.18; §10.1; §10.2; §10.4; Tau Ceti `TauCeti.Place.ratFuncEquiv`; Tau Ceti `TauCeti.Place.adicOfIrreducibleResidueFieldEquiv`; Tau Ceti `TauCeti.Place.finite_setOf_ord_ne_zero`.

**Bass–Tate exactness with the corrected filtration proof.** For every field F and n≥1, 0→Kᴹ_n(F)→Kᴹ_n(F(t))→⊕_(p monic irreducible)Kᴹ_(n−1)(F[t]/p)→0 is split exact. The last map uses uniformizer-last residues; its kernel is the constant image and leading-coefficient specialization retracts that image. Infinity is excluded from this direct sum. (Weibel, III.7.3.2–7.4.2, p. 247.)

*Checks.*

- For n=1 this is the divisor factorization F(t)ˣ/Fˣ≃⊕_pℤ.
- For a constant c and g=t, the finite tame residue is c and the omitted infinity residue is c⁻¹.
- h_p uses the unique nonzero polynomial representatives of degree <deg p; the Steinberg check is an equality in F[t], not an assertion that those representatives are constants.

*Needs:* §9.13; §10.1; §10.2; §10.3; §10.4.

### 10.6 The Milnor transfer of a simple extension (Definition III.7.5)

Let E = F(a) be a finite extension, π the minimal polynomial of a, and E ≅ F[t]/(π) by t ↦ a. Since ∂_∞ vanishes on K^M_{n+1}(F) and the residue sum is surjective with kernel K^M_{n+1}(F) (§10.5), there are unique homomorphisms N_p : K^M_n(F[t]/p) → K^M_n(F), p over the monic irreducible polynomials, with −∂_∞ = Σ_p N_p ∘ ∂_p on K^M_{n+1}F(t). The transfer N_{a/F} : K^M_n(E) → K^M_n(F) is N_π transported to E; equivalently N_{a/F}(x) = −∂_∞(y) for any y with ∂_π(y) = x and ∂_p(y) = 0 for p ≠ π. In degree zero it is multiplication by [E : F]. The projection formula and the degree formula N_{a/F} ∘ res = [E : F] are §10.8 and §10.9. Between the roadmap's normalisation of the residues and Theorem III.7.3's, every residue on K^M_{n+1}F(t) changes by the same sign (−1)^n, so N_{a/F} is the same in both. Independence of the generator a is Kato's theorem (§10.24), not part of this definition. (Weibel, III.7.5, paragraph before Definition 7.5, p. 248; Weibel, III.7.5, Definition 7.5, p. 248; Weibel, III.7.5, after Definition 7.5, p. 248; Weibel, III.7.5.2, Projection Formula 7.5.2, p. 248; Weibel, III.7.5.3, Corollary 7.5.3, p. 248.)

E/F is a finite field extension generated by a; residues are normalised as in §9.11.

Provide the following API.

- `milnorTransferSimple`: For a integral over F: N_{a/F} : K^M_n(F⟮a⟯) →+ K^M_n(F), defined through the residue at infinity.
- `milnorTransferSimple_eq_neg_residueInfty`: If ∂_π(y) = x and ∂_p(y) = 0 for every monic irreducible p ≠ π, then N_{a/F}(x) = −∂_∞(y).
- `residueInfty_eq_neg_sum_transfer`: For y ∈ K^M_{n+1}F(t), −∂_∞(y) = Σ_p N_p(∂_p y), a finite sum (Weil's formula III.7.5.1).
- `milnorTransferSimple_degree_zero`: In degree zero N_{a/F}(m) = [F⟮a⟯ : F]·m.
- `milnorTransferSimple_of_mem`: If a ∈ F then N_{a/F} is the identity of K^M_n(F).
- `milnorTransferSimple_mul_restrict`: Projection formula: N_{a/F}(res(x)·y) = x·N_{a/F}(y) for x ∈ K^M_*(F) and y ∈ K^M_*(F⟮a⟯). (§10.8)
- `milnorTransferSimple_restrict`: N_{a/F}(res x) = [F⟮a⟯ : F]·x for x ∈ K^M_n(F). (§10.9)
- `milnorTransferSimple_one_eq_norm`: In degree one N_{a/F} is Algebra.norm F on F⟮a⟯ˣ (proved in §10.7).
- `milnorTransferSimple_kbook`: N_{a/F} is the same whether the residues are normalised as in the roadmap or as in Theorem III.7.3.

**Checks.**

- For [F⟮a⟯ : F] = d, N_{a/F}(1) = d in K^M_0(F) = ℤ, from y = π: ∂_π(π) = 1, the other finite residues vanish, and ∂_∞(π) = −d.
- If a ∈ F (π = t − a) then N_{a/F} = id: for x ∈ K^M_n(F), y = {x, t − a} has ∂_{t−a}(y) = x, no other finite residue, and ∂_∞(y) = −x.
- In degree one N_{a/F} = Algebra.norm F on F⟮a⟯ˣ; for ℚ(i)/ℚ, N(1 + i) = 2.
- The sign is forced: the maps defined by +∂_∞ = Σ N_p ∂_p would give N_{a/F}(1) = −[F⟮a⟯ : F] in degree zero.
- For c ∈ F^× and d ∈ F, N_{a/F}{c, a − d} = {c, N(a − d)}, from the projection formula and the degree-one case (the formula of Corollary III.6.1.5 for a quadratic extension).

*Needs:* §9.11; §10.1; §10.5; Tau Ceti `TauCeti.Place.ratFuncEquiv`; Mathlib `IntermediateField.adjoinRootEquivAdjoin`.

### 10.7 The simple transfer in degree one is the field norm (Exercise III.7.5)

For a finite extension E = F(a), the transfer N_{a/F} : K^M_1(E) = E^× → K^M_1(F) = F^× of §10.6 is the field norm Algebra.norm F. (The degree-zero case, multiplication by [E : F], is part of §10.6.) (Weibel, Exercise III.7.5, p. 257; Weibel, III.7.5, after Definition 7.5, p. 248.)

E = F(a) is a finite extension; π is the minimal polynomial of a, of degree d.

**Checks.**

- For ℚ(i)/ℚ, N(1 + i) = 2.
- For ℚ(∛2)/ℚ and b = ∛2 (g = t, d = 3, e = 1), the factor at q = t is π(0) = −2 and the sign (−1)^{de} = −1 gives the norm 2; without the sign the answer would be wrong.
- For a constant c ∈ F^×, N_{a/F}(c) = c^{[E:F]}, which is also the projection formula applied to c and 1.

*Needs:* §9.11; §10.6; Mathlib `Algebra.norm`; Mathlib `Algebra.norm_eq_prod_roots`; Mathlib `Polynomial.resultant_eq_prod_eval`.

### 10.8 The projection formula for the transfer

For E = F(a), x ∈ K^M_*(F) and y ∈ K^M_*(E): N_{a/F}(res_{E/F}(x)·y) = x·N_{a/F}(y). By Definition III.7.6 and Kato's theorem the same holds for N_{E/F} for every finite E/F. (Weibel, Projection Formula III.7.5.2, p. 248; Weibel, Projection Formula III.7.5.2, proof, p. 248.)

E = F(a) is a finite extension; x ∈ K^M_i(F), y ∈ K^M_j(E).

**Checks.**

- y = 1 ∈ K^M_0(E) gives N_{a/F}(res x) = [E : F]·x (§10.9).
- Degree one with y = 1: N_{E/F}(x) = x^{[E:F]} for x ∈ F^×, the field-norm identity.
- The formula holds in both normalisations of the residue.

*Needs:* §9.14; §10.5; §10.6.

### 10.9 Restriction followed by transfer is multiplication by the degree

For E = F(a) of degree d, N_{a/F} ∘ res_{E/F} = d·id on K^M_*(F); hence the kernel of res_{E/F} : K^M_*(F) → K^M_*(E) is killed by d. By composition along a generating tower the same holds for N_{E/F} and every finite E/F, degrees multiplying. (Weibel, Corollary III.7.5.3, p. 248.)

E = F(a) is a finite extension of degree d.

**Checks.**

- Degree one: N_{E/F}(x) = x^d for x ∈ F^×.
- Degree zero: the composite ℤ → ℤ → ℤ is multiplication by d.

*Needs:* §10.6; §10.8.

### 10.10 Weil reciprocity on the projective line (III.7.5.1 and III.6.5.3)

For a field F and x ∈ K^M_{n+1}F(t): Σ_v N_v ∂_v(x) = 0 in K^M_n(F), the sum over all places v of F(t) trivial on F, where N_π = N_{t̄/F} is the simple transfer of F[t]/(π) = F(t̄) and N_∞ is the identity; only finitely many terms are nonzero. In degree two, for f, g ∈ F(t)^× and the roadmap's tame symbol, ∏_v N_{k(v)/F}(∂_v{f, g}) = 1 in F^× with N the field norm. (Weibel, III.7.5.1, Weil Reciprocity Formula 7.5.1, p. 248; Weibel, III.6.5.3, Weil Reciprocity Formula 6.5.3, p. 236; Weibel, III.6.5.3, proof of the Weil Reciprocity Formula, p. 236.)

F is a field; residues are normalised as in §9.11. In degree two either normalisation may be used, since inverting every factor does not change a product equal to 1.

**Checks.**

- For {a, t − b} the factor at ∞ is a and the factor at t − b is a^{−1} (K-book normalisation); all other factors are 1.
- The place at infinity is needed: over ℚ, {2, t} has factor 1/2 at the place t and 2 at ∞ (K-book normalisation), so the finite places alone do not give 1.
- In degree one (n = 0) it says that a principal divisor on the projective line has degree zero, Σ_v deg(v)·ord_v(f) = 0.
- Roadmap convention check at 5 over ℚ: both the degree-two higher residue and tameSymbol send {2,5} to 2 in F_5^×; its inverse is 3. Only the separately named K-book residue is inverse.

*Needs:* §9.11; §9.13; §10.5; §10.6; §10.7; Tau Ceti `TauCeti.Place.ratFuncEquiv`; Tau Ceti `TauCeti.Place.normResidue`.

### 10.11 Passing to a prime-to-p closure (Kato's key trick)

For a field F and a prime p there is an algebraic extension F′/F that is the union of its finite subextensions of degree prime to p and such that every finite extension of F′ has p-power degree. For such F′ and every n, every element of the kernel of K^M_n(F) → K^M_n(F′) is killed by an integer prime to p; in particular the kernel has no p-torsion. (Weibel, III.7.6.1, the paragraph after Theorem 7.6.1, p. 249.)

F is a field and p a prime.

**Checks.**

- If F is algebraically closed, F′ = F.
- For F = 𝔽_q, F′ is the union of the 𝔽_{q^m} with m prime to p.
- The kernel need not vanish: for p odd the prime-to-p closure of ℝ is ℂ, and {−1, −1} ∈ K^M_2(ℝ) dies in K^M_2(ℂ); it is killed by 2, which is prime to p.

*Needs:* §5.4; §10.6; §10.9; Mathlib `Sylow`.

**Prime-to-p detection on Milnor groups.** Fix a prime p and let F^(p)/F be a maximal algebraic extension whose finite subextensions all have degree prime to p; it exists by Zorn's lemma applied to the algebraic extensions of F inside an algebraic closure all of whose finite subextensions have prime-to-p degree, and its construction is part of this target. Every finite extension of F^(p) has p-power degree (a Sylow argument on a normal hull). Each element of ker(Kᴹ_n(F)→Kᴹ_n(F^(p))) is killed by an integer prime to p; in particular restriction is injective on p-primary torsion. (Weibel, III.7.6.1–7.6.2, p. 249.)

*Checks.*

- An element killed by p^a and by a prime-to-p integer is zero by Bézout.
- No normalized discrete valuation or completeness is asserted for the infinite field F^(p).

*Needs:* §5.4; §10.9.

### 10.12 Base change of the simple transfer (Exercise III.7.7)

Let E = F(a) be finite with minimal polynomial π, F′/F any field extension, π = ∏_i π_i^{e_i} in F′[t] with distinct monic irreducible π_i, and E_i = F′(a_i) with a_i a root of π_i. Then res_{F′/F} ∘ N_{a/F} = Σ_i e_i · N_{a_i/F′} ∘ res_i on K^M_n(E), where res_i is induced by the F-embedding E → E_i sending a to a_i. (Weibel, Exercise III.7.7, p. 257.)

F′/F is an arbitrary field extension (finite in the source); the multiplicities e_i are those of the factorisation of π over F′.

**Checks.**

- In degree zero it is deg π = Σ_i e_i·deg π_i.
- If π stays irreducible over F′, it says res ∘ N_{a/F} = N_{a/F′} ∘ res.
- For F′ = E and E/F normal it expresses res_{E/F} ∘ N_{a/F} as a sum over the conjugates of a, which is what Lemma III.7.6.2 uses.
- For F′ = F(u) transcendental and π = t²−2 over F = ℚ, π remains irreducible and the residue/transfer comparison is available without finite-dimensionality of F′(t)/F(t). The extra place t−u has trivial restriction and zero residue on classes from F.
- For F′ = F̂_v, use the e = 1 residue comparison for completion; F̂_v/F need not be finite. This preserves the completion input required by Exercise III.7.9 and sourceIssue E10.

*Needs:* §9.11; §9.18; §10.5; §10.6.

### 10.13 Generation by symbols with one entry outside the base (Exercise III.7.6)

If every finite extension of F has p-power degree and E/F has degree p, then for n ≥ 1 the group K^M_n(E) is generated by the symbols {y, x_2, …, x_n} with y ∈ E^× and x_2, …, x_n ∈ F^×. (Weibel, Exercise III.7.6, p. 257; Weibel, III.6.1.4, Lemma 6.1.4 and its proof, p. 232.)

Every finite extension of F has p-power degree; [E : F] = p; n ≥ 1.

**Checks.**

- For F = ℝ and E = ℂ (p = 2), K^M_2(ℂ) is generated by the {r, z} with r ∈ ℝ^× and z ∈ ℂ^×, as in Example III.6.1.6.
- In degree one the statement is trivial.
- The hypothesis on F is used in the first step: over ℚ, with E = ℚ(∛2), the element 1 + ∛2 + ∛4 is a quadratic polynomial in ∛2 that does not split over ℚ, so the argument does not apply.

*Needs:* §5.10; §10.2.

### 10.14 Independence of the generator for a normal extension of prime degree (Lemma III.7.6.2)

If E/F is normal of prime degree p and E = F(a) = F(b), then N_{a/F} = N_{b/F} : K^M_*(E) → K^M_*(F). (Weibel, III.7.6.2, Lemma 7.6.2, p. 249; Weibel, III.7.6.2, proof of Lemma 7.6.2, p. 249.)

E/F is normal (separable or purely inseparable) of prime degree p.

**Checks.**

- In degree one it is the independence of the field norm from the generator.
- In degree zero both transfers are multiplication by p.
- It is the base case of Kato's induction over maximal towers.

*Needs:* §10.6; §10.7; §10.8; §10.9; §10.11; §10.12; §10.13.

### 10.15 The normalized extension of a complete discrete valuation to a finite extension

For a field F with a surjective v:F→ℤᵐ⁰ and v-adically complete valuation ring R, and any finite E/F, construct the unique normalized discrete valuation w on E extending the valuation class of v. E is complete for w, and ord_w(x)=e ord_v(x) on F× for a positive integer e. No separability or residue-field finiteness hypothesis. (Gille–Szamuely, Proposition A.6.8(1), p. 313; Stacks, Definition 15.113.1 (Tag 09E4); Remark 15.116.1 (Tag 09EM).)

Provide the following API.

- `finiteExtensionValuation`: The normalized Valuation E ℤᵐ⁰, with surjectivity, positive restriction index and no preinstalled valuation on E.
- `adicComplete_iff_complete_norm`: The native π-adic completeness and completeness for 2^(−ord) agree; the norm and valuation topologies agree.
- `finiteExtensionValuation_unique`: Any surjective discrete valuation on E with positive restriction index is this valuation; compatibility is a named equality, not a second global instance.
- `finiteExtensionValuation_tower`: Restriction indices multiply in a finite tower; compatible embeddings preserve units and induce the native local residue map.
- `finiteExtensionValuation_localField`: Under IsNonarchimedeanLocalField F, identify this construction with the Layer 0 valuation class and normalized valuation.

**Checks.**

- E=F gives e=1, the original valuation and residue map, and the original topology.
- F=ℚ((t)), E=ℚ((s)), t=s²: ord_E(s)=1, ord_E(t)=2 and e=2. No IsNonarchimedeanLocalField instance is assumed.
- k=F₂(a), F=k((t)), E=F(α), α²+tα+a=0: E/F is separable, e=1, residue l=k(√a) has inseparable degree 2. Reject a separable-residue requirement.

*Needs:* LocalFieldsRamification Layer 0; Mathlib `spectralNorm.normedField`; Mathlib `spectralNorm_unique`; Mathlib `spectralNorm.completeSpace`.

### 10.16 The integral closure in a finite extension is a finite free complete DVR

For the preceding finite E/F, S=integralClosure R E is the valuation ring of w, a complete DVR and a finite free R-module of rank [E:F]=e[l:k], with l and k the native residue fields. Identify π_F S=𝔪_S^e, and the e successive quotients with l as k-vector spaces. Residue extensions may be inseparable. (Stacks, Lemma 10.119.7 (Tag 00PD); Lemma 10.153.4 (Tag 04GH); Lemma 10.162.8 (Tag 032W); Gille–Szamuely, Propositions A.6.7–A.6.8, p. 313; Lemma 7.3.10, pp. 200–201.)

Provide the following API.

- `valuationSubring_equiv_integralClosure`: A named R-algebra equivalence identifying the ring, its maximal ideal, residue field and units.
- `integralClosure_finite_free`: Module.Finite R S and Module.Free R S; finrank F E equals the R-module rank of S.
- `ramification_mul_residueDegree`: e>0, [l:k]>0 and [E:F]=e[l:k], including purely inseparable E/F.
- `extension_uniformizer_filtration`: Identify π_F S=𝔪_S^e and the e-step quotient S/π_F S. Reuse TauCeti.residueFieldEquivMaximalIdealGradedOfUniformizer for each piece; export the compatibility with the k-vector-space filtration, not a second graded-piece construction.
- `uniformizer_minpoly_eisenstein`: If e=[E:F] and l=k, every uniformizer π_E generates E/F and its minimal polynomial over F is Eisenstein over R.

**Checks.**

- For t=s² over ℚ, S=ℚ[[s]] is R-free on 1,s; S/tS has two residue layers, each ℚ.
- E=ℚ(i)((t)) over ℚ((t)) has e=1, [l:k]=2, basis 1,i; t remains a uniformizer.
- For α²+tα+a in characteristic 2, R[α] is free on 1,α, local with maximal ideal (t) and residue k(√a), hence a DVR and already the integral closure. It has e=1,f=2, not e=2,f=1.

*Needs:* §10.15; Tau Ceti `TauCeti.residueFieldEquivMaximalIdealGradedOfUniformizer`; Mathlib `Ideal.sum_ramification_inertia_eq_finrank`.

### 10.17 Norms of a finite extension: valuation and residue

For every finite extension E/F as in §10.15, ord_F(N_E/F y)=[l:k]ord_E(y) for y≠0. For u∈S×, N_E/F(u)∈R× and res_k(N_E/F u)=N_l/k(res_l u)^e. Here norms are the determinant norms, also for inseparable residue extensions. (Stacks, Lemma 10.121.8 (Tag 02MJ); Gille–Szamuely, Lemma 7.3.10, pp. 200–201; Proposition A.6.8(2), p. 313.)

Provide the following API.

- `ord_norm`: The valuation-of-norm identity for all nonzero elements, not just units.
- `residue_norm_unit`: The displayed exponent-e residue identity for S×→R×.
- `norm_integral_norm_unit`: Use the integral norm and Algebra.algebraMap_intNorm to restrict S→R, and restrict the homomorphism to units; do not define a second determinant norm.
- `norm_tower_and_localField`: Reuse Algebra.norm_norm for tower maps. Compare the new identities with LocalFieldsRamification Layer 3 norms through the uniqueness statement of §10.15.

**Checks.**

- For t=s² over ℚ, N(s)=−t and N(2)=4. Hence ord_F N(s)=1, and residue N(2)=2²: both the sign and exponent e=2 are visible.
- For ℚ(i)((t))/ℚ((t)), N(t)=t² and N(1+i)=2; the valuation factor is f=2, not e=1.
- For α²+tα+a, N(α)=a=N_l/k(√a), N(t)=t², e=1 and f=2. A norm defined as a product of distinct residue embeddings gives the wrong answer.

*Needs:* §10.16; Mathlib `Algebra.norm`.

### 10.18 Separable base change and residue component lengths

Let E/F be finite SEPARABLE and F′/F any finite extension of complete discretely valued fields. Let R,S,R′ be their valuation rings, k,l,k′ their residues, e=e(E/F), r=e(F′/F), E⊗F F′=∏E_i with valuation rings S_i and residues l_i. Write l⊗k k′=∏A_j, with L_j the residue of A_j and t_j=length_(A_j)(A_j). Put e_i=e(E_i/F′), e′_i=e(E_i/E). The natural residue maps assign each i to j and inject L_j into l_i. Then Σ_(i over j) e_i[l_i:L_j]=e t_j and Σ_(i over j) e′_i[l_i:L_j]=r t_j. No separability of l/k or equality l_i=L_j is assumed. (Stacks, Remark 15.116.1 (Tag 09EM); Gille–Szamuely, Proposition 7.4.1, p. 204, ; Lemma 7.3.6, p. 197.)

Provide the following API.

- `tensor_normalization_lattice`: The canonical inclusion B⊂∏S_i is finite, has the stated common fraction algebra, and has finite-length cokernel over R′.
- `residue_component_map`: The canonical A_j→l_i factors through an injective L_j→l_i, with complete assignment of factors and invariance under relabeling.
- `baseChange_component_length`: Both displayed componentwise identities, natural in finite towers and compatible with e e′_i=r e_i.
- `separable_scope`: Do not assert E⊗F F′ is reduced for inseparable E/F. Such E/F is handled by normal prime-degree towers in the K2 consumer; Artinian transfer lengths remain in the arbitrary-field base-change theorem.

**Checks.**

- E=ℚ((s)), s²=t, F′=E: r=e=2; two E_i=E, each e_i=e′_i=1; l⊗k k′=ℚ has t_j=1, so the sum is 2.
- E=ℚ((s)), s²=t and F′=ℚ((u)), u²=2t: one E_i=ℚ(√2)((u)), e_i=e′_i=1 and [l_i:L_j]=2 with L_j=ℚ, t_j=1. The length sum is 2; replacing l_i by the residue compositum gives 1 and fails.
- For α²+tα+a over F₂(a)((t)) and F′=E, the separable generic tensor is E×E but l⊗k l≅l[ε]/ε² has t_j=2. Here e=r=e_i=e′_i=1 and the two residue-degree terms are 1, giving 2=1·2. Using reduced residue factors with multiplicity 1 fails.

*Needs:* §10.16.

### 10.19 The four residue cases on a symbol with base-field entries

For complete discretely valued F, normal E/F of prime degree p and α={a′,a₂,…,a_n} with a′∈E× and a_i∈F× for i≥2, one has ∂_F N_E/F α=N_l/k ∂_E α. The residue fields may be inseparable. (Gille–Szamuely, Lemma 7.3.10, pp. 200–201; Appendix A.6.8(2), p. 313.)

n>0; F complete; [E:F]=p and E/F normal; all but the first entry come from F.

**Checks.**

- The both-uniformizers case retains the sign and unit correction; it is not covered by the units-only calculation.
- At n=2 the final residue is the roadmap tame symbol, obtained by negating the GS residue.

*Needs:* §9.14; §10.7; §10.8; §10.17.

### 10.20 Residues commute with the transfer over a complete field (Corollary III.7.6.3)

Let F be complete for a discrete valuation v with residue field k_v, E/F normal of prime degree p, and w the unique extension of v to E, with residue field k_w. Then ∂_v ∘ N_{E/F} = N_{k_w/k_v} ∘ ∂_w on K^M_n(E), where N_{E/F} is well defined by §10.14 and N_{k_w/k_v} is the identity if k_w = k_v and otherwise the transfer of the normal extension k_w/k_v of degree p. (Weibel, III.7.6.3, Corollary 7.6.3, p. 249; Weibel, III.7.6.3, proof of Corollary 7.6.3, p. 249; Gille–Szamuely, Proposition 7.3.9, pp. 199–202.)

F complete for v; E/F normal of prime degree p; residues normalised as in §9.11.

**Checks.**

- In degree one it is v(N_{E/F}(y)) = f·w(y), with f = [k_w : k_v].
- For E/F unramified and n = 2 it says that the tame symbol of a norm is the norm of the tame symbol.
- Completeness is used: for a field that is not complete there may be several places above v, and the formula becomes the sum of §10.21 or of §10.27.

*Needs:* §9.11; §9.14; §9.18; §10.7; §10.8; §10.9; §10.11; §10.12; §10.13; §10.14; §10.16; §10.19.

**Finite descent in the prime-degree complete residue square.** Let F be complete for a normalized discrete valuation, E/F normal of prime degree p, with residue extension l/k. The simple norm is generator-independent by the §10.14 lemma. For α∈Kᴹ_n(E), n≥1, δ=∂_F Nα−N_(l/k)∂_Eα is zero. This completes the §10.20 proof using finite complete extensions only. (Weibel, III.7.6.2–7.6.3, Exercise III.7.6–7.8, pp. 249, 257.)

*Checks.*

- The residue field may be infinite, imperfect, or inseparable over the base residue field.
- The argument keeps the inseparable self-tensor multiplicity p.
- Every valuation used after descent is on a finite extension; the infinite detector is used only for finite algebraic data.

*Needs:* §9.18; §10.9; §10.11; §10.12; §10.14; §10.17; §10.19.

### 10.21 The norm-residue formula for a constant extension of prime degree (Exercise III.7.9)

Let E/F be normal of prime degree p and v a place of F(t) trivial on F. Then ∂_v ∘ N_{E(t)/F(t)} = Σ_{w|v} N_{E(w)/F(v)} ∘ ∂_w on K^M_{n+1}E(t), the sum over the places w of E(t) above v; N_{E(t)/F(t)} and the residue-field transfers are well defined by §10.14, each extension involved being normal of degree 1 or p. (Weibel, Exercise III.7.9, p. 258.)

E/F normal of prime degree p; v a place of F(t) trivial on F.

**Checks.**

- In degree zero (n + 1 = 1) it is v(N_{E(t)/F(t)}(y)) = Σ_{w|v} f(w|v)·w(y).
- If v is inert (a single w with [E(w) : F(v)] = p) it is the complete formula without completion.
- For v = ∞ it gives ∂_∞ ∘ N_{E(t)/F(t)} = N_{E/F} ∘ ∂_∞, the identity used in Proposition III.7.6.4.

*Needs:* §9.11; §10.12; §10.14; §10.20; Tau Ceti `TauCeti.Place.restrict`; Tau Ceti `TauCeti.Place.finite_setOf_restrict_eq`.

**The normal constant-extension residue identity through finite normalization and completion.** For E/F normal of prime degree p and any place v of F(t)/F, ∂_v N_(E(t)/F(t))=Σ_(w|v)N_(κ(w)/κ(v))∂_w. This is the §10.21 target with its finite-normalization and completion supply made explicit before Kato transitivity. (Weibel, Exercise III.7.9, III.7.6.4, pp. 250, 258; Stacks, Lemma 10.153.4 (Tag 04GH); Remark 15.116.1 (Tag 09EM).)

*Checks.*

- Infinity uses the t⁻¹ chart and is included.
- At a split place the sum has p degree-one terms; at a nonsplit place it has one degree-p term.
- This proof does not cite the general norm–residue theorem that will follow Kato transitivity.

*Needs:* §9.18; §10.12; §10.20; AlgebraicCurves Layer 2.

### 10.22 Kato's commuting square (Proposition III.7.6.4)

Let E/F be normal of prime degree p, F′ = F(a) finite and E′ = E(a). Then N_{E/F} ∘ N_{a/E} = N_{a/F} ∘ N_{E′/F′} on K^M_*(E′), the norms N_{E/F} and N_{E′/F′} being well defined by §10.14. (Weibel, III.7.6.4, Proposition 7.6.4, p. 250; Weibel, III.7.6.4, proof of Proposition 7.6.4, p. 250.)

E/F normal of prime degree p; F′ = F(a) a finite simple extension.

**Checks.**

- In degree one both sides are the field norm N_{E′/F}.
- If a ∈ F both sides reduce to N_{E/F}.
- In degree zero both sides are multiplication by [E′ : F].

*Needs:* §10.6; §10.14; §10.21.

### 10.23 Splitting-field comparison of arbitrary transfer towers

Let E/F be finite, M/F a finite normal extension containing a normal hull of E, and N_τ any composite of simple Bass–Tate transfers along a generating tower τ of E/F. Then res_(M/F) N_τ=[E:F]_insep Σ_(σ:E↪_F M) σ_* on Kᴹ_n(E). Thus two towers differ by a map whose every value is killed by [M:F]. (Suslin, §1, Corollary 1.10, p.594.)

**Checks.**

- For a separable nonnormal cubic E/ℚ use its normal closure, not E as a splitting field.
- For a purely inseparable extension of degree p^a the sum has one embedding with multiplicity p^a.
- No general transfer base-change theorem or Kato transitivity is used in this pre-Kato argument.

*Needs:* §10.6; §10.9; §10.12.

### 10.24 Milnor norms of finite extensions and Kato's transitivity theorem

For a finite extension E = F(a_1, …, a_r), the composite N_{a_1/F} ∘ N_{a_2/F(a_1)} ∘ ⋯ ∘ N_{a_r/F(a_1, …, a_{r−1})} of the simple transfers of §10.6 (Definition III.7.6) does not depend on the choice of generators (Kato). Hence the Milnor norm N_{E/F} : K^M_*(E) → K^M_*(F) is well defined, N_{E/F} = N_{F′/F} ∘ N_{E/F′} for every intermediate field F′, it is multiplication by [E : F] in degree zero and Algebra.norm F in degree one, and for a simple extension N_{E/F} = N_{a/F} for every generator a. (Weibel, III.7.6, Definition 7.6, p. 249; Weibel, III.7.6.1, Theorem 7.6.1, p. 249; Weibel, III.7.6.1, proof of Theorem 7.6.1, p. 250.)

E/F is a finite field extension.

**Checks.**

- In degree one N_{E/F} is Algebra.norm F and transitivity is the Algebra.norm_norm.
- For a simple extension N_{E/F} = N_{a/F} for every generator a, which is not part of the definition of §10.6.
- Independence is a theorem: the reduction to towers of prime degree and the comparison of two towers are its substance.
- Kato's independence of the chain of generators is stated here, not assumed; MotivicEtaleKTheory M.4 uses the norm with this independence.

*Needs:* §10.6; §10.7; §10.11; §10.12; §10.14; §10.22; Mathlib `Algebra.norm_norm`.

**Generator independence through splitting-field towers.** For every finite E/F, every degree n≥0 and every generating tower τ, the composite N_τ is independent of τ and of the simple generators. It defines N_(E/F):Kᴹ_n(E)→Kᴹ_n(F), is transitive in every finite intermediate tower, satisfies the projection and degree formulas, is field norm in degree one, and is multiplication by [E:F] in degree zero. This supplies the norm target of this subsection. (Weibel, III.7.6.1–7.6.4, p. 249; Suslin, Corollary 1.10, p.594.)

*Checks.*

- A nonnormal cubic uses a normal hull in the annihilator argument.
- A degree p³ extension with distinct first degree-p subfields is compared through AB and the remaining degree-p extension above it.
- Purely inseparable towers and all integral torsion are retained; no rationalization occurs.

*Needs:* §10.6; §10.7; §10.11; §10.14; §10.21; §10.23; Mathlib `Algebra.norm_norm`.

### 10.25 General finite-transfer base change with Artinian lengths

Let E/F be finite, F′/F arbitrary, and E⊗_F F′≃∏_i A_i its decomposition into local Artinian algebras. Put E_i=A_i/𝔪_i and m_i=length_(A_i)(A_i). For every n≥0, res_(F′/F)N_(E/F)=Σ_i m_i N_(E_i/F′)res_(E_i/E). The norms are Kato’s generator-independent norms. (Weibel, Exercise III.7.7, III.7.6.1, pp. 249, 257.)

**Checks.**

- For E/F separable the tensor is reduced and every m_i=1.
- For E=𝔽_p(s^(1/p),t^(1/p)) over F=𝔽_p(s,t), base changing to E gives E[ε,η]/(ε^p,η^p): its length is p² and its maximal-ideal nilpotence index is 2p−1.
- In degree zero the formula is the vector-space identity [E:F]=Σ_i m_i[E_i:F′]; at p=2 the preceding example requires coefficient 4, not 3.

*Needs:* §10.9; §10.12; §10.24.

### 10.26 The all-degree norm–residue square for a complete discretely valued field

For a complete discretely valued field F and any finite E/F, with residue fields k and l, ∂_F N_E/F=N_l/k ∂_E on K_n^M(E), n>0, without separability or residue-field perfectness. (Gille–Szamuely, Proposition 7.4.1, p. 204; Proposition 7.3.9, pp. 200–202.)

F is complete for its normalized discrete valuation; E/F is finite; residues use the uniformizer-last convention. **Source/proof gap:** the full proof of Gille–Szamuely, Proposition 7.4.1, has not been read. Weibel III.7.6.3 proves the normal-prime-degree case used in §10.20; the Stacks references below supply valuation and normalization inputs only. Suslin, Lemma 2.1, p.595, proves a quotient-by-torsion version, so it cannot replace the integral all-degree target. A proof for all finite extensions, including inseparable residues, remains required here.

**Checks.**

- n=1 gives ord_F N(y)=[l:k] ord_E(y).
- Purely inseparable residue extensions use Kato’s finite-extension norm, not a separable trace.
- For ℚ((s))/ℚ((t)), t=s², in degree one: N(s)=−t and ∂_F N(s)=1=N_ℚ/ℚ(∂_E s). An extra transfer ramification coefficient would give 2.
- For ℚ(i)((t))/ℚ((t)), e=1,f=2: ∂_F N(t)=2=N_ℚ(i)/ℚ(1) in K₀^M(ℚ)=ℤ. The right factor is the residue degree.
- For k=F₂(a), E=k((t))(α), α²+tα+a=0, one has e=1, f=2 and ∂_F N(t)=2. This finite separable complete extension has inseparable residue; a separable-residue or finite-residue hypothesis would exclude a required case.

*Needs:* §9.18; §10.9; §10.11; §10.12; §10.16; §10.17; §10.18; §10.20; §10.24.

**The complete residue square for every finite extension.** For any complete discretely valued F, any finite E/F, n≥1 and residue fields l/k, ∂_F N_(E/F)=N_(l/k)∂_E on integral Kᴹ_n(E). The residue fields are arbitrary and may be inseparable. Use the complete-discrete-valuation inputs of §§10.15–10.18. (Weibel, III.7.6.3, p. 249; Stacks, Lemma 10.121.8 (Tag 02MJ), Lemma 10.162.8 (Tag 032W), Remark 15.116.1 (Tag 09EM).)

*Checks.*

- This does not silently assume finite or perfect residues.
- Even for separable E/F, the residue tensor can be nonreduced; its t_j must remain.
- Only finite stages carry discrete valuations. The same residue sign multiplies both sides by (−1)^(n−1) under a convention change.

*Needs:* §9.18; §10.9; §10.11; §10.18; §10.20; §10.24; §10.25.

### 10.27 The norm–residue formula for Milnor norms of a finite extension

Let E/F be a finite extension, v a discrete valuation on F with valuation ring R, and suppose the integral closure S of R in E is a finite R-module (equivalently Σ_{w|v} e_w f_w = [E : F]; automatic if E/F is separable or F is complete; for arbitrary K/F(t) it follows from AlgebraicCurves Layer 2’s finite-normalization milestone). Let w run over the valuations of E over v, with residue fields k_w ⊇ k_v (possibly inseparable over k_v). Then ∂_v ∘ N_{E/F} = Σ_{w|v} N_{k_w/k_v} ∘ ∂_w on K^M_n(E), with N_{E/F} and N_{k_w/k_v} the Milnor norms of §10.24 (Kato's norms, defined for every finite extension, separable or not). In degree one this is ord_v(N_{E/F} x) = Σ_w f_w·ord_w(x); residue degrees enter through N_{k_w/k_v}, and the ramification indices do not appear (they enter only the restriction formula §9.18). This norm/residue square is used by §10.29; its comparison with Quillen’s transfer and the localisation boundary is §11.7. (Weibel, Exercise III.7.9, p. 258; Weibel, Corollary III.7.6.3, p. 249; Gille–Szamuely, Corollary 7.4.3, p. 205; Corollary 7.3.11, p. 202; Appendix A.6.4.)

E/F is a finite field extension and v a discrete valuation on F. The integral closure of the valuation ring of v in E is a finite module over it (Σ_w e_w f_w = [E : F]). Without it the formula fails: in degree one, for x = π ∈ F, it would read [E : F] = Σ_w e_w f_w.

**Checks.**

- Degree one: ord_v(N_{E/F}x) = Σ_w f_w ord_w(x), e.g. ℚ(i)/ℚ at 5: N(2 + i) = 5 and the two places over 5 give 1 + 0.
- For classes from F the formula combines with §9.18 and §10.9 into [E : F] = Σ e_w f_w, the finiteness hypothesis.
- The formula is the same in both normalisations of the residue (each side changes by (−1)^{n−1}).

*Needs:* §9.11; §10.9; §10.12; §10.16; §10.17; §10.20; §10.24; §10.26; Mathlib `Ideal.sum_ramification_inertia_eq_finrank`; Mathlib `Ideal.relNorm_singleton`; Mathlib `Algebra.norm`; AlgebraicCurves Layer 2.

**The norm–residue formula under finite normalization.** Let E/F be finite, v a discrete valuation on F, and assume its valuation ring R has finite integral closure S in E. For n≥1, ∂_v N_(E/F)=Σ_(w|v)N_(κ(w)/κ(v))∂_w on Kᴹ_n(E). The hypothesis holds for separable E/F, for complete F, and for finite extensions of one-variable function fields over any constant field by the AlgebraicCurves finite-normalization contract. (Weibel, Exercise III.7.9, p. 258; Stacks, Remark 15.116.1 (Tag 09EM); Lemma 10.153.4 (Tag 04GH).)

*Checks.*

- Degree one reads ord_v N(x)=Σ_w[κ(w):κ(v)]ord_w(x); no additional e_w multiplies the right hand side.
- For E=ℚ(i), v=5 and x=2+i, N(x)=5; the two places contribute 1 and 0.
- For a base uniformizer the formula recovers [E:F]=Σ_w e_w f_w, explaining why finite normalization cannot simply be omitted.

*Needs:* §9.18; §10.16; §10.17; §10.25; §10.26; AlgebraicCurves Layer 2.

### 10.28 Closed points of the regular proper model against places: the AlgebraicCurves dictionary and tame symbols

Let K be a function field of one variable over F and X the proper regular integral curve with function field K (the normalisation of ℙ¹_F in K, AlgebraicCurves Layer 12B; any proper integral curve with function field K has X as its normalisation). AlgebraicCurves Layer 12 supplies: ord_x : K^× → ℤ at each regular closed point through the discrete valuation ring O_{X,x} (12A); the bijection x ↦ P_x between closed points of X and places of K/F, with Scheme.ord at x equal to the order at P_x and κ(x) ≃ₐ[F] k(P_x), degrees matching (12A–12B); and Weil divisors on X ≅ Divisor F K, matching degrees and principal divisors (12D). X is regular but need not be smooth over F when F is imperfect (Layer 12's 'regular, not smooth' convention, adopted here). What this target adds is the transport of the K_2 data: the roadmap's tame symbol at x, formed with ord_x and κ(x), is carried to the tame symbol at P_x, N_{κ(x)/F} = N_{k(P_x)/F}, and div f on X is Tau Ceti's Divisor.principal f; so the reciprocity product over X^{(1)} is the product over the places of K/F. (Weibel, V.6.12, Smooth Curves 6.12, p. 416; Weibel, III.6.3, p. 234.)

X is integral, proper (hence projective, Layer 12B), regular and of dimension one over F; no smoothness over F is assumed. The dictionary is AlgebraicCurves Layer 12's (12A, 12B, 12D), used as stated there.

**Checks.**

- For X = ℙ¹_F the places are those of the ratFuncEquiv, including ∞.
- On an affine chart Spec R the comparison is the correspondence between the places finite on R and the height-one primes of R.
- The comparison is of discrete valuations together with their residue maps: equality of orders alone would not identify the residues of the tame symbols.
- Regular, not smooth: over F = 𝔽_p(s), p odd, the curve y² = x^p − s is regular at the closed point y = 0, x^p = s (its maximal ideal is generated by y) but not smooth there (both partial derivatives vanish), and its residue field F(s^{1/p}) is purely inseparable over F.

*Needs:* §9.2; §9.3; Mathlib `AlgebraicGeometry.Scheme.ord`; Tau Ceti `TauCeti.Place.heightOneSpectrumEquiv`; Tau Ceti `TauCeti.Place.ratFuncEquiv`; Tau Ceti `TauCeti.Divisor.principal`; AlgebraicCurves Layer 12.

### 10.29 Suslin's reciprocity law: Weil reciprocity in every degree for a proper curve over any field

Let F be any field and K a function field of one variable over F (IsFunctionField F K), for instance the function field of a proper integral curve C over F. The places P of K/F are the closed points of the normalisation of C, which is the regular proper model of K/F (§10.28, importing AlgebraicCurves Layer 12); it is regular but need not be smooth over F when F is imperfect, and each residue field k(P) is a finite extension of F, possibly inseparable. For x ∈ K^M_{n+1}(K) the residue ∂_P(x) vanishes at all but finitely many places P, and Σ_P N_{k(P)/F} ∂_P(x) = 0 in K^M_n(F), where ∂_P is the higher residue of §9.11 and N_{k(P)/F} is Kato's Milnor norm (§10.24), defined for every finite extension, separable or not. This is Suslin's reciprocity law in all degrees; its degree-two form with the roadmap's tame symbol and field norms is §10.30. It is stated over places (equivalently over the closed points of the regular model), never over the points of a possibly singular C and never under a smoothness hypothesis. MotivicEtaleKTheory M.4 uses it, with the norms of this layer, for the Nesterenko–Suslin/Totaro comparison of Milnor K-theory with the diagonal higher Chow groups. (Weibel, V.6.12.1, Weil Reciprocity Formula 6.12.1, p. 416; Weibel, V.6.12, the paragraph before 6.12.1, p. 416; Weibel, III.7.5.1, Weil Reciprocity Formula 7.5.1, p. 248; Weibel, III.7.6.1, Theorem 7.6.1, p. 249; Gille–Szamuely, Corollary 7.4.3 and Proposition 7.4.4, pp. 205–206; Stacks, Tags 032N, 032L and 032O.)

F is a field, of any characteristic and not necessarily perfect, and K/F is a function field of one variable; residues are normalised as in §9.11. The sum is over the places of K/F, the closed points of the regular proper model (the normalisation of any proper model); no smoothness over F is assumed, and the residue extensions k(P)/F may be inseparable.

**Checks.**

- For K = F(t) it is §10.10.
- In degree one (n = 0) it says that a principal divisor has degree zero, Σ_P deg(P)·ord_P(f) = 0, the Tau Ceti product formula TauCeti.Divisor.degree_principal.
- Inseparable residue fields occur and need Kato's norm: for F = 𝔽_p(s) and K = F(s^{1/p})(t), every place of K/F has residue field containing F(s^{1/p}), purely inseparable of degree p over F, and in degree one N_{F(s^{1/p})/F}(α) = α^p.
- Only finitely many terms are nonzero.
- Consumers: EllipticKTheory E.2 and EllipticRegulators use the degree-two form to construct and descend regulator classes; HigherLocalFields HL.6 uses the relation along a curve; MotivicEtaleKTheory M.4 uses it in every degree to kill the boundaries in the inverse of the diagonal cycle map (edge Layer 10 → M.4).
- Mixed test: k=F₃(s), K=k(s^(1/3))(u), t=u². K/k(t) has inseparable degree 3 and separable degree 2, hence total degree 6; normalization is k(s^(1/3))[u], finite over k[t]. This test is neither a separable extension nor a purely inseparable extension.

*Needs:* §9.11; §9.13; §10.10; §10.24; §10.27; §10.28; Tau Ceti `TauCeti.Place.restrict`; Tau Ceti `TauCeti.Place.finite_setOf_restrict_eq`; Tau Ceti `TauCeti.Place.finite_setOf_ord_ne_zero`; Tau Ceti `TauCeti.Place.sum_ramificationIdx_mul_relativeDegree_eq_finrank_of_isSeparable`; Tau Ceti `TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable`; AlgebraicCurves Layer 2.

**Integral all-degree reciprocity for any function field.** Let F be any field and K/F a one-variable function field. For n≥0 and x∈Kᴹ_(n+1)(K), only finitely many ∂_P x are nonzero and Σ_(P∈Place F K)N_(κ(P)/F)∂_P x=0 in Kᴹ_n(F). Equivalently sum over the closed points of the proper regular model, using Kato norms for every finite residue extension, including inseparable ones. The regular model need not be smooth and no exact-constant-field hypothesis is imposed. (Weibel, III.7.5.1, III.7.6.1, pp. 248, 249; Suslin, §2, Theorem 2.6 and proof, p.597; torsion-quotient convention introduced p.594.)

*Checks.*

- For n=0 the equation is Σ_P[κ(P):F]ord_P(f)=0, the degree-zero principal-divisor formula.
- For n=1 write the sum multiplicatively to obtain the product of residue-field norms of tame symbols equal to 1.
- Over an imperfect field use the regular normalization and possibly inseparable κ(P)/F; smoothness and separability are not added as hidden hypotheses.

*Needs:* §9.13; §10.10; §10.24; §10.27; §10.28; AlgebraicCurves Layer 2; AlgebraicCurves Layer 12.

### 10.30 Weil reciprocity for the tame symbol on a proper regular curve

Let X be a proper regular integral curve over F with function field K, and f, g ∈ K^×. Then ∂_x{f, g} = 1 for all but finitely many closed points x, and ∏_{x ∈ X^{(1)}} N_{k(x)/F}(∂_x{f, g}) = 1 in F^×, where ∂_x is the roadmap's tame symbol (§9.2) at the discrete valuation of the local ring at x and N is the field norm. Equivalently, over the places P of K/F: ∏_P N_{k(P)/F}(∂_P{f, g}) = 1. The disjoint-support case f(div g) = g(div f), and its agreement with EllipticCurves Layer 2's milestone, is §10.31. (Weibel, V.6.12, the paragraph before 6.12.1, p. 416; Weibel, III.6.5.3, Weil Reciprocity Formula 6.5.3, p. 236.)

X is integral, proper and regular of dimension one over F; f and g are nonzero rational functions.

**Checks.**

- For X = ℙ¹ it is Weil's formula (f, g)_∞ · ∏_p N_p(f, g)_p = 1 of III.6.5.3.
- The sign (−1)^{v(f)v(g)} matters: on ℙ¹ over ℚ with f = t and g = t − 1 the factors are −1 at 0, 1 at 1 and −1 at ∞, with product 1; dropping the sign changes the factor at ∞, where v(f)v(g) = 1, and gives −1.
- Only finitely many factors differ from 1.
- Convention test over ℚ at 5: ∂{2,5} = 2 in 𝔽₅ˣ. Its inverse 3 is the K-book convention, not the residue of this roadmap.

*Needs:* §9.2; §9.11; §10.7; §10.24; §10.28; §10.29; Mathlib `Algebra.norm_norm`; Tau Ceti `TauCeti.Place.normResidue`.

### 10.31 Disjoint supports: f(div g) = g(div f), and EllipticCurves Layer 2's Weil reciprocity

Let K be a function field of one variable over F and f, g ∈ K^× whose principal divisors (Tau Ceti's Divisor.principal) have disjoint supports. At a place P in the support of div g one has ord_P f = 0 and the roadmap's tame symbol is ∂_P{f, g} = f(P)^{ord_P g}; at a place P in the support of div f it is ∂_P{f, g} = g(P)^{−ord_P f}; elsewhere it is 1 (§9.2; the sign (−1)^{ord_P f · ord_P g} is 1 on both supports). Applying the residue-field norms N_{k(P)/F} and taking the product, §10.30 becomes f(div g)·g(div f)^{−1} = 1, that is f(div g) = g(div f) for Tau Ceti's evaluation Divisor.eval, whose local factors are the norms N_{k(P)/F}(f(P)). In particular, for an elliptic curve — a Weierstrass curve W over F with W.IsElliptic, K = W.FunctionField, a function field of one variable by WeierstrassCurve.Affine.isFunctionField — this is the milestone 'Weil reciprocity f(div g) = g(div f)' of EllipticCurves Layer 2, a prerequisite of its divisor construction of the Weil pairing: that milestone is the disjoint-support, degree-two special case of Layer 10's theorem, stated with the same evaluation and the same principal divisors, and the two must be stated compatibly. The general theorem, in every degree and for every function field of one variable, stays Layer 10's (§10.29); the elliptic statement is a special case, not a proof of reciprocity for other curves. In the K-book's normalisation every local factor is inverted (∂^{Wb}_P{f, g} = f(P)^{−ord_P g} on the support of div g) and the identity is unchanged. (Weibel, III.6.5.3, Weil Reciprocity Formula 6.5.3, p. 236.)

`Suggested.lean` states this, with Tau Ceti's `Divisor.eval` and `Divisor.principal`, as `weil_reciprocity_of_disjoint`.

K/F is a function field of one variable and f, g ∈ K^× have principal divisors with disjoint supports. For the elliptic instance, W is a Weierstrass curve over F with W.IsElliptic and K = W.FunctionField; its places and divisors are those of Tau Ceti's function-field library, on which EllipticCurves Layer 0 builds.

**Checks.**

- On ℙ¹ over ℚ with f = t and g = (t − 1)/(t − 2): f(div g) = f(1)/f(2) = 1/2 and g(div f) = g(0)/g(∞) = (1/2)/1 = 1/2.
- On the elliptic curve y² = x³ − x over ℚ, f = x/(x − 2) and g = (x − 3)/(x − 5) have div f = 2(0, 0) − P₂ and div g = P₃ − P₅, where P_c is the inert place x = c of degree two (residue fields ℚ(√6), ℚ(√6), ℚ(√30) for c = 2, 3, 5). Then f(div g) = N(3)·N(5/3)^{−1} = 9·(9/25) = 81/25 and g(div f) = (3/5)²·N(1/3)^{−1} = (9/25)·9 = 81/25; without the residue-field norms the two sides would be 9/5 and 27/25.
- In the K-book's normalisation each local factor is inverted and the identity still holds.
- A special case, not the theorem: §10.29 is the statement in every degree for every function field of one variable, and this target does not replace it.

*Needs:* §9.2; §10.30; Tau Ceti `TauCeti.Divisor.eval`; Tau Ceti `TauCeti.Divisor.eval_eq_prod_normResidue`; Tau Ceti `TauCeti.Divisor.isUnitAtSupport_iff_disjoint`; Tau Ceti `TauCeti.Divisor.principal`; Tau Ceti `TauCeti.Place.normResidue`; Tau Ceti `WeierstrassCurve.Affine.isFunctionField`; EllipticCurves Layer 2.

**Tame products and divisor evaluation use the curve interfaces.** For a proper regular curve with function field K/F and f,g∈Kˣ, the product over closed points of N_(κ(P)/F)((−1)^(a_P b_P)res_P(f^(b_P)g^(−a_P))) equals 1, where a_P=ord_P f and b_P=ord_P g. If principal divisors are disjoint this identity is (Divisor.principal hF g).eval f=(Divisor.principal hF f).eval g. On an elliptic Weierstrass function field this is exactly EllipticCurves Layer2’s milestone, using its divisor evaluation. (Weibel, III.7.3, III.7.5.1, pp. 246, 248.)

*Checks.*

- For f=t,g=t−2 over ℚ, the factors at 0,2,∞ are −1/2,2,−1, with product 1.
- For f=t/(t−1),g=(t−2)/(t−3), disjoint divisors give both evaluations 4/3.
- At the 5-adic place, ∂{5,2}=3∈𝔽₅ˣ; the opposite convention gives 2, so the sign/inversion choice is observable.

*Needs:* §10.7; §10.28; §10.29; EllipticCurves Layer 2; Tau Ceti `TauCeti.Divisor.eval_eq_prod_normResidue`; Tau Ceti `TauCeti.Divisor.isUnitAtSupport_iff_disjoint`; Tau Ceti `TauCeti.Divisor.eval`; Tau Ceti `TauCeti.Divisor.principal`; Tau Ceti `TauCeti.Place.normResidue`; Tau Ceti `TauCeti.Place.normResidueOrOne`; Tau Ceti `TauCeti.Place.degree`.

### 10.32 Bass-Tate calculation for number fields

For a number field F with r1 real embeddings and n >= 3, K_n^M(F) is (Z/2)^r1 via the symbols at its real places. (Bass–Tate, Chapter II, Theorem 2.1(3), p.396, with proof pp.397–402 and the arithmetic inputs of §§1, 3–5, pp.393–395, 403–427; Weibel, III.7.2(d), p.246.)

F is a number field. n >= 3.

For the proof, first obtain finite generation from the finite-exceptional-prime filtration of Chapter II, Theorem 1.1 and Corollary 1.2: the residue targets vanish in degrees at least two over finite fields. For each odd prime ℓ, adjoining roots of unity through an extension of degree prime to ℓ and applying the projection formula makes restriction injective modulo ℓ. The local/global degree-two symbol pairing and the idele pairing of §§3–5 then kill every triple symbol modulo ℓ. In characteristic zero the same argument at two leaves precisely the real sign classes. Weak approximation supplies elements with one chosen negative real signature, and their repeated symbols give a section of the real-sign map with order-two image. Finite generation and the absence of all other primary quotients show that this section exhausts the group. The higher-degree statement follows by multiplying symbols, with the sign classes retained. Each step is needed: a sign detector alone does not prove surjectivity onto all of K⁽ᴹ⁾_n(F).

**Checks.**

- For F=ℚ and n=3 the answer is ℤ/2, detected by {−1,−1,−1}.
- For a totally imaginary number field it is zero for every n≥3.
- Degree two is excluded: K₂(ℚ) has nontrivial residues at infinitely many finite primes.

*Needs:* §5.4; §5.12; §5.15; §§10.6–10.9; §10.24; ClassFieldTheory Layers 5–6 and 10–14 (local/global symbol pairing and reciprocity); Mathlib `NumberField.InfinitePlace.nrRealPlaces`.

### 10.33 Bass-Tate vanishing over positive-characteristic global fields

If F has transcendence degree one over a finite field and n >= 3, K_n^M(F)=0. (Bass–Tate, Chapter II, Theorem 2.1(3), p.396, proof pp.397–402, using §§1, 3–5; Weibel, III.7.2(a), p.245.)

F has transcendence degree one over a finite field. n >= 3.

For a global function field the preceding finite-generation and prime-to-characteristic argument eliminates every prime-primary quotient away from the characteristic. In characteristic p, [F:Fᵖ]=p and the p-power/transfer argument in the proof of Theorem II.2.1 makes the high-degree group p-divisible, so finite generation eliminates its p-primary quotient as well. For a field of transcendence degree one that is not finitely generated, put each finite tuple of symbol entries in a global function subfield and use functoriality; this retains Weibel’s broader formulation.

**Checks.**

- K⁽ᴹ⁾₃(𝔽₂(t))=0, including characteristic two.
- The argument does not kill K⁽ᴹ⁾₂(𝔽_q(t)); its residue at an irreducible polynomial may be nontrivial.
- An arbitrary algebraic extension of 𝔽_q(t) is covered by the finite-tuple argument.

*Needs:* §5.4; §10.32’s arithmetic proof inputs; §10.24.

### Examples

- For e₁ ≠ e₂ monic of degree d and h = e₁ − e₂, {e₁, e₂} = {h, e₂} − {h, e₁} + {e₁, −1}; this corrects the sign in Weibel Ex. III.6.2.
- For E = ℚ((s)) over F = ℚ((t)) with s² = t: N(s) = −t and N(2) = 4, so the residue of N(2) is 2^e with e = 2.
- For α² + tα + a over 𝔽₂(a)((t)), the residue extension is purely inseparable of degree 2 and N(α) = a = N_{l/k}(√a): norms cannot be computed from distinct residue embeddings.

### Dependencies

Layers 5, 7 and 9; AlgebraicCurves Layers 2 and 12; EllipticCurves Layer 2; Tau Ceti `Place` and `Divisor`; Mathlib `Algebra.norm` and `spectralNorm`; GeneralAlgebraicKTheory §7.7; LocalFieldsRamification Layer 0; ClassFieldTheory Layers 5–6 and 10–14 for §§10.32–10.33.

## Layer 11: the localization comparison

The tame symbol is the boundary of the localization sequence of a discrete valuation ring, up to the sign fixed in §11.1; for a Dedekind domain the boundary is the tame symbol at each prime. In every degree the product map from Milnor K-theory intertwines the higher residues with the signed boundary, the total residue is a homomorphism into the direct sum, and the two specialisations are compared. Quillen transfers satisfy the norm–residue square and agree with Milnor norms on K₂; the degree-two comparison square records the inversion explicitly.

### 11.1 Identification with the boundary of the localisation sequence

Let R be a discrete valuation ring with fraction field F, residue field k and uniformiser π, and let ∂ : K_2(F) → K_1(k) = k^× be the boundary of the localisation sequence ⋯ → K_2(R) → K_2(F) → K_1(k) → K_1(R) → K_1(F) → K_0(k) → ⋯ (GeneralAlgebraicKTheory Layers 4 and 8: localisation for the torsion modules, dévissage, resolution). With the K-book's normalisation — ∂ right K_*(R)-linear, ∂(x·y) = ∂(x)·ȳ for y ∈ K_*(R) (GeneralAlgebraicKTheory Layers 4 and 8/localization-product-boundary, on GeneralAlgebraicKTheory Layer 7's products), and ∂[π] = [R/πR] = 1 ∈ K_0(k) — one has, on symbols (through K^M_2(F) → K_2(F)), ∂{f,g} = tameSymbol v g f = (tameSymbol v f g)^{−1}: the boundary is the K-book's tame symbol of Lemma III.6.3, the inverse of this roadmap's. With the left-linear normalisation ∂(y·x) = ȳ·∂(x) instead, ∂{f,g} = tameSymbol v f g. Both are stated and the sign is fixed here, not in the symbol formula. It builds no localisation sequence; SchemeKTheoryOperations and EllipticKTheory use this comparison, and §11.2 extends it to a Dedekind domain, prime by prime. (Weibel, V.6.6.1, p. 409; Weibel, V.6.6.1, proof, p. 409; Weibel, Example V.6.1.2, p. 406.)

R is a discrete valuation ring with fraction field F, residue field k, uniformiser π and valuation v. The localisation sequence and the K_*(R)-module structure of its terms are those of GeneralAlgebraicKTheory Layers 4 and 8 and GeneralAlgebraicKTheory Layer 7, with the side of the action fixed.

**Checks.**

- With the K-book's normalisation, on ℤ_(5) ⊂ ℚ: ∂{5, 2} = 2 whereas tameSymbol 5 2 = 3; ∂{2, 5} = 3.
- ∂{π, π} = −1 in both normalisations.
- Degree one: ∂[f] = ord_v(f)·[k], the valuation; this normalisation is the upstream GeneralAlgebraicKTheory Layers 4 and 8 ring boundary contract.
- No second localisation sequence is built.
- The degree-one input is the GeneralAlgebraicKTheory Layers 4 and 8 ring cone/cokernel boundary (GeneralAlgebraicKTheory Layers 4 and 8/localization-degree-one-index and GeneralAlgebraicKTheory Layers 4 and 8/dvr-degree-one-boundary); the RIGHT module action is GeneralAlgebraicKTheory Layers 4 and 8/localization-product-boundary on GeneralAlgebraicKTheory Layer 7's products. Neither input comes from SchemeKTheoryOperations.

*Needs:* §7.12; §8.2; §9.5; GeneralAlgebraicKTheory §8.12; GeneralAlgebraicKTheory §§8.11–8.12; GeneralAlgebraicKTheory §8.13; GeneralAlgebraicKTheory Layer 7.

### 11.2 The localisation theorem for K₂ of a Dedekind domain: the boundary is the tame symbol at each prime

Let R be a Dedekind domain with fraction field F and, for each nonzero prime 𝔭, residue field k(𝔭) = R/𝔭 and valuation v_𝔭. The finitely generated torsion R-modules form a Serre subcategory of the finitely generated R-modules with quotient the finite-dimensional F-vector spaces; Quillen's localisation theorem, dévissage (K_*(torsion modules) ≅ ⊕_𝔭 K_*(k(𝔭))) and resolution (R and F are regular) give the exact sequence ⊕_𝔭 K_2(k(𝔭)) → K_2(R) → K_2(F) −∂→ ⊕_𝔭 K_1(k(𝔭)) → K_1(R) → K_1(F), whose maps out of the residue-field terms are the transfers along R → k(𝔭). The 𝔭-component of ∂ is the boundary of the discrete valuation ring R_𝔭, so on symbols (through the product-normalized Matsumoto comparison of §8.3) ∂{f, g} = (tameSymbol v_𝔭 g f)_𝔭 = ((tameSymbol v_𝔭 f g)^{−1})_𝔭 in the K-book's right K_*(R)-linear normalisation, and (tameSymbol v_𝔭 f g)_𝔭 in the left-linear one (§11.1); the values lie in the direct sum by §9.13. Hence ker ∂ is the image of K_2(R) and coker ∂ ≅ ker(K_1(R) → K_1(F)). This is the K-book's Localization Theorem III.6.5, proved in V.6.6: the degree-two boundary comparison used in Layer 12. It builds no sequence beyond GeneralAlgebraicKTheory Layers 4 and 8's. (Weibel, III.6.5, Localization Theorem 6.5, p. 236; Weibel, V.6.6; Weibel, V.6.6.1 and the claim after it; Weibel, V.6.1, p. 406.)

R is a Dedekind domain with fraction field F; 𝔭 runs over the nonzero primes of R. Localisation, dévissage, resolution and transfers are GeneralAlgebraicKTheory Layers 4 and 8's; the K_*(R)-module structure used in the discrete-valuation-ring comparison is GeneralAlgebraicKTheory Layer 7's (through §11.1). The sign is the one fixed in §11.1; kernels and cokernels do not depend on it.

**Checks.**

- For R = ℤ the segment is ⊕_p K_2(𝔽_p) → K_2(ℤ) → K_2(ℚ) → ⊕_p 𝔽_p^× → K_1(ℤ) → K_1(ℚ); in the K-book's normalisation ∂{5, 2} has 5-component 2, where Layers 9–11's tameSymbol gives 3.
- For a discrete valuation ring (one prime) it is the degree-two part of the sequence in §11.1.
- coker ∂ is not zero in general: for the Dedekind domain ℝ[x, y]/(x² + y² − 1) it is the nonzero SK_1 of K-book Example III.1.5.4, although every tame symbol is onto.
- No second localisation sequence is built: ArithmeticKTheory N.2's all-degree Dedekind sequence restricts in degrees at most two to this one.

*Needs:* §4.1; §9.13; §11.1; GeneralAlgebraicKTheory §4.14; GeneralAlgebraicKTheory §4.8; GeneralAlgebraicKTheory §4.6; GeneralAlgebraicKTheory §7.7; Mathlib `IsDedekindDomain.HeightOneSpectrum`; GeneralAlgebraicKTheory Layers 4, 7 and 8.

### 11.3 The product map intertwines higher residues with the signed localization boundary

Let R be a discrete valuation ring with fraction field F, residue field k and parameter π. Write r_v,n : K⁽ᴹ⁾_n(F) → K⁽ᴹ⁾_(n−1)(k) for §9.11 with the parameter LAST; Φ_n for §8.2, defined by the ordered product of unit classes; and D_n : K_n(F) → K_(n−1)(k) for the actual GeneralAlgebraicKTheory Layers 4 and 8 localization connecting map with D₁[π]=1 and the RIGHT module convention. For every n≥1, D_n ∘ Φ_n = (−1)^(n−1) Φ_(n−1) ∘ r_v,n. Thus δ_n=(−1)^(n−1)D_n satisfies δ_nΦ_n=Φ_(n−1)r_v,n. In degree two Φ₂=θ₂♮m is the product-normalized Matsumoto equivalence, and D₂Φ₂{f,g}=t_v(f,g)⁻¹, whereas δ₂Φ₂=t_v. If θ₂♮(z)=θ₂(εz) for the globally fixed torus sign ε∈{±1}, then D₂θ₂m=−εr_v,2 in additive residue notation, or t_v^(−ε) multiplicatively. No value of ε is assumed and no higher Φ_n is asserted invertible. (Weibel, III.7.3, V.6.6.1, Exercise V.5.3, pp. 246, 405, 409.)

R is a commutative DVR; F is its fraction field and k its residue field. No completeness, finite residue field, coefficient field or characteristic restriction is assumed. GeneralAlgebraicKTheory Layers 4 and 8 supplies the torsion-module localization sequence, dévissage and resolution, and its right product boundary law. Φ₀ identifies the integer class with rank, and Φ₁ takes a unit to its K₁ class. The comparison θ₂♮, rather than an unspecified classical-to-Quillen isomorphism, is the one fixed by §8.3.

**Checks.**

- At ℚ with the 5-adic valuation: t₅(2,5)=2, D₂Φ₂{2,5}=3; t₅(5,2)=3, D₂Φ₂{5,2}=2; D₂Φ₂{5,5}=4 in 𝔽₅ˣ. These distinguish inversion from the identity.
- D₁Φ₁{π}=1. For k=ℚ(t), R=k[[π]] and x={2,t,π}, D₃Φ₃(x)=Φ₂{2,t}. The t-adic boundary of the right side is 1/2∈ℚˣ, while that of its negative is 2. This detects the positive degree-three sign; a finite-field K₂ target cannot do so.
- All-unit symbols have zero boundary. δ₂ and D₂ have the same kernel and inverse values, but their map equality is never asserted.
- Transport through θ₂ carries ε explicitly. A finite-field K₂=0 test cannot determine that sign.

*Needs:* §5.10; §8.1; §8.2; §8.3; §9.11; §11.1; GeneralAlgebraicKTheory §8.12; GeneralAlgebraicKTheory §8.13; GeneralAlgebraicKTheory §7.4; GeneralAlgebraicKTheory Layers 4, 7 and 8; GeneralAlgebraicKTheory Layer 7.

### 11.4 Package the finite-support family as a total Milnor residue homomorphism

Let V be an indexed family of normalized discrete valuations on a field F of finite character: for each a∈Fˣ only finitely many v∈V have ord_v(a)≠0. For n≥1 construct MilnorK.globalResidueHom(V,n) : K⁽ᴹ⁾_n(F) → ⨁_(v∈V) K⁽ᴹ⁾_(n−1)(k_v), the unique additive homomorphism with v-coordinate r_v,n. The direct sum is the dependent DirectSum, using Additive k_vˣ in degree one. It is not the direct sum of the individual homomorphisms: each input has finite support, while infinitely many component homomorphisms may be nonzero. For a Dedekind domain R with F=Frac(R) and V its nonzero primes, the total Quillen boundary satisfies D⁽ᴿ⁾_n Φ_n = (−1)^(n−1)(⨁_v Φ_(n−1)) globalResidueHom(V,n). In particular degree two transports the Dedekind sequence of §11.3 through Φ₂ and coordinatewise negation/inversion. (Weibel, III.6.5, III.7.4, V.6.6–6.6.1, pp. 236, 247, 409.)

n≥1, V is a set-indexed family with the explicit finite-character property, and every residue field is the residue field of its valuation ring. The global Quillen comparison clause uses the height-one-prime family of a Dedekind domain and its actual localization sequence. No full Quillen boundary into a direct sum is postulated for an arbitrary family of DVRs.

Provide the following API.

- `MilnorK.globalResidueHom`: The additive homomorphism to the dependent residue direct sum, constructed with the finite-support proof for each input.
- `MilnorK.globalResidueHom_apply`: For every v and x, the v-coordinate of globalResidueHom(V,n)(x) is r_v,n(x).
- `MilnorK.globalResidueHom_unique`: A homomorphism to this direct sum with all the same residue coordinates equals globalResidueHom(V,n).
- `MilnorK.globalResidueHom_support_subset`: For any finite symbol expression for x, the support of globalResidueHom(V,n)(x) is contained in the union of the nonzero-order supports of all its entries; equality is not asserted.
- `MilnorK.globalResidueHom_eq_zero_iff`: globalResidueHom(V,n)(x)=0 iff r_v,n(x)=0 for every v. Thus its kernel is the intersection of the individual residue kernels.
- `MilnorK.globalResidueHom_degree_one`: At n=1 the coordinates are ord_v(a); for Dedekind primes and for function-field places, compare to the principal divisor by coefficient extensionality.
- `MilnorK.globalResidueHom_degree_two`: At n=2 its coordinates in k_vˣ are t_v(f,g), with addition on Additive k_vˣ interpreted multiplicatively.
- `MilnorK.globalResidueHom_quillen`: For a Dedekind R, D⁽ᴿ⁾_n Φ_n=(−1)^(n−1)DirectSum.map(Φ_(n−1)) globalResidueHom(V,n). This compares actual maps, not only groups.
- `MilnorK.globalResidueHom_reindex`: Relabeling V by an equivalence, and transporting its valuations and residue fields along that equivalence, reindexes the output. No unrestricted field-extension naturality is claimed.

**Checks.**

- For V empty the codomain is trivial and every input maps to zero. For x=0 all coordinates are zero for any V.
- For F=ℚ and V the rational primes, globalResidueHom(V,1){25/2} has coefficient −1 at 2, coefficient 2 at 5, and zero elsewhere. These are the coefficients of the principal divisor of 25/2; degree zero of each residue group is ℤ, not a residue-field unit group.
- For F=ℚ and V the rational primes, globalResidueHom(V,2){2,5} has only its 5-coordinate nontrivial, with value 2∈𝔽₅ˣ. The coordinate at 2 is 1 because 𝔽₂ˣ is trivial. The Quillen-boundary coordinate is 3 at 5.
- For the same family, {2,−1}={2,1−2} maps to zero at every prime. Its entries have a nonzero-order support at 2, so the support bound can be strict.
- For ℚ at the prime 5, {5,2} has coordinate 3 and {5,5} has coordinate 4. Adding a symbol to its additive inverse yields the zero direct-sum element.
- For k=ℚ(t), F=k((π)) and V the singleton π-adic family, globalResidueHom(V,3){2,t,π} has coordinate {2,t}∈K⁽ᴹ⁾₂(k). Its image under Φ₂ has t-adic Quillen boundary 1/2∈ℚˣ. The actual D₃ has the positive coordinate Φ₂{2,t}; negating it would give t-adic boundary 2.
- For V=ℕ with every indexed valuation the same 5-adic valuation on ℚ, {2,5} has the nontrivial coordinate 2 at every index. Finite character fails, so this input cannot be sent to a dependent direct sum by these coordinates.

*Needs:* §9.13; §11.2; §11.3; Mathlib `DirectSum.mk`; Mathlib `DirectSum.ext`; Mathlib `DirectSum.map`; Mathlib `DirectSum.map_apply`; Mathlib `IsDedekindDomain.HeightOneSpectrum.Support.finite`; Tau Ceti `TauCeti.Place.finite_setOf_ord_ne_zero`; GeneralAlgebraicKTheory Layers 4, 7 and 8.

### 11.5 Compare unit-part specialization with the two Quillen product specializations

With R,F,k,π,Φ,D and r as in §11.3, let λ_π,n be the Milnor unit-part specialization of §9.11 and n≥1. Then λ_π,n(x)=r_v,n+1(x·{−π}) and Φ_n(λ_π,n(x))=(−1)^n D_(n+1)(Φ_n(x)·[−π]). For the K-book specialization q_π,n(z)=D_(n+1)([π]·z), one instead has q_π,n(Φ_n x)=Φ_n(λ_π,n(x)+r_v,n(x)·{−1}). Equivalently, q_π,nΦ_n=Φ_nλ_(−π),n. For π′=uπ with u∈Rˣ, both these compared specializations change by −Φ_n(r_v,n(x)·{ū}); r_v and D are independent of π. These are equalities of homomorphisms; they do not assert an all-degree isomorphism or identify q_π with λ_π. (Weibel, III.7.3 and its Serre algebra proof, V.6.6.4 and the specialization paragraph immediately following it, pp. 246, 410.)

n≥1; λ_π is §9.11 in the same parameter-last convention as r. q_π uses the K-book RIGHT-linear boundary and multiplication by [π] on the LEFT. The corrected formula uses [−π] on the RIGHT and the degree sign.

**Checks.**

- For R=ℤ_(5), λ₅,1{5}=0 in additive Milnor notation, but q₅,1([5])=[−1], corresponding to 4∈𝔽₅ˣ. The corrected expression −D₂([5]·[−5])=0.
- For the same R, λ₁₀,1{5}={3}, while q₁₀,1([5])={2}, because q₅{5}−{2}={−1/2}={2} in 𝔽₅ˣ. A uniformizer-independent specialization fails this test.
- For a unit u both specializations take Φ₁{u} to [ū]. In higher degree every all-unit symbol reduces in its original order.
- For k=ℚ(s), F=k((t)), x={s,t}, λ_t,2(x)=0 and q_t,2Φ₂(x)=Φ₂{s,−1}; the latter is detected by the s-adic residue −1. This tests the correction beyond degree one.

*Needs:* §8.2; §9.9; §9.11; §9.14; §9.15; §11.3; GeneralAlgebraicKTheory §8.13.

### 11.6 Quillen transfers and the localisation boundary: the norm–residue square

Let R ⊆ R′ be Dedekind domains with R′ finitely generated as an R-module, F ⊆ F′ their fraction fields (so F′/F is finite), and for a nonzero prime 𝔭 of R let 𝔭′ run over the primes of R′ above 𝔭. The transfers of GeneralAlgebraicKTheory Layers 4 and 8 along R → R′, F → F′ and k(𝔭) → k(𝔭′) (restriction of scalars; R′ is finitely generated and torsion-free, hence projective, over R) form a morphism from the localisation sequence of §11.2 for R′ to that for R. In particular ∂_𝔭 ∘ N_{F′/F} = Σ_{𝔭′|𝔭} N_{k(𝔭′)/k(𝔭)} ∘ ∂_{𝔭′} on K_n(F′): residue degrees enter through the transfers of the residue extensions and no ramification index appears (ramification enters restriction, §9.7). In degree two, the boundaries being the inverse tame symbols and the K_1-transfer of a finite field extension the field norm, tameSymbol_{v_𝔭}(N_{F′/F} x) = ∏_{𝔭′|𝔭} N_{k(𝔭′)/k(𝔭)}(tameSymbol_{v_𝔭′} x) for x ∈ K_2(F′), with N_{F′/F} Quillen's transfer; the identity holds in both normalisations. Moreover, for a finite field extension E/F restriction followed by transfer is multiplication by [E : F] on K_n(F), the projection formula applied to the class [E] = [E : F] of K_0(F) = ℤ. The Milnor-side statements are Layer 10's (§10.27, §10.9, §10.8); their agreement with these is §11.7. (Weibel, V.(6.6.3)-(6.6.4); Weibel, III.1.7.1 and the paragraph after it, p. 187; Weibel, III.5.6.3, p. 221.)

R ⊆ R′ are Dedekind domains, R′ is a finitely generated R-module, and F ⊆ F′ are their fraction fields. Transfers are those of GeneralAlgebraicKTheory §7.7; for fields they are the finite transfers of the forgetful functor (K-book III.1.7.1 and III.5.6.3).

**Checks.**

- Degree one: ord_𝔭(N_{F′/F} y) = Σ_{𝔭′|𝔭} f(𝔭′|𝔭)·ord_{𝔭′}(y); for ℚ(i)/ℚ at the ramified prime 2, N(1 + i) = 2 has ord_2 = 1 = f·ord_{(1+i)}(1 + i) with f = 1, while a formula with the ramification index e = 2 would give 2.
- For x = res(y) with y ∈ K_2(F), with §9.7 this gives tameSymbol_{v_𝔭}(y)^{Σ e f} = tameSymbol_{v_𝔭}(y)^{[F′:F]}, the fundamental identity.
- For fields, restriction followed by transfer on K_2 is multiplication by [E : F] (K-book III.5.6.3).
- The theorem concerns Quillen's transfer; Layer 10's Milnor norm is compared with it in §11.7, not identified with it by definition.

*Needs:* §11.2; GeneralAlgebraicKTheory §7.7; GeneralAlgebraicKTheory §4.8; GeneralAlgebraicKTheory §4.14; Mathlib `Algebra.norm`.

### 11.7 Layer 10's Milnor norm is Quillen's transfer on K₂

For a finite field extension E/F, under Matsumoto's isomorphisms K^M_2(E) ≅ K_2(E), K^M_2(F) ≅ K_2(F) (§7.12) and the identification of Steinberg with Quillen K_2 (§4.1), the Milnor norm N_{E/F} of §10.24 corresponds to Quillen's transfer of GeneralAlgebraicKTheory Layers 4 and 8. Consequently, in degree two and under the boundary identification of §11.2, the Milnor norm/residue formula §10.27 and the Quillen norm/residue square §11.6 are the same statement, as are §10.9 and the restriction–transfer clause of §11.6. The Milnor norms are those of Layer 10 and the K-theory transfers those of GeneralAlgebraicKTheory §7.7; neither is constructed here. For arbitrary finite extensions the proof uses the common arbitrary-field base-change contract, prime-to-p detection and degree-p symbol generation; quadratic extensions are a separate regression, not the scope of the result. (Weibel, III.6.1.5, Corollary 6.1.5, p. 232; Weibel, Exercise III.5.6, p. 229; Weibel, III.7.6, Definition 7.6 and Theorem 7.6.1, p. 249; Gille–Szamuely, Lemma 7.3.6–7.3.7 and proof of Theorem 7.3.2, pp. 198–203; Weibel, V.1.2/1.2.1; V.3.7.2 and Exercise V.3.11, pp. 366, 390, 398.)

E/F is a finite field extension. The two norms are compared on K_2 = K^M_2 through Matsumoto's theorem; in degrees zero and one both are the degree and the field norm.

**Checks.**

- For ℂ/ℝ both norms send {r, e^{iθ}} to 1 and {r, s} to {r, s}² (K-book Example III.6.1.6 and Corollary III.6.1.5).
- In degree one both are the field norm: N(1 + i) = 2 for ℚ(i)/ℚ.
- The comparison is a theorem, not a definition: Layer 10's norm is defined through the Bass–Tate sequence, Quillen's through restriction of scalars.
- Nonreduced test: E=F_p(s^(1/p)), F=F_p(s), F′=E gives E⊗_F E≅E[ε]/(ε^p), one residue field E and length p. Both base-change formulas read res∘N=p·id, not id.
- A nonquadratic test uses a degree-three extension over a 3-closed field and the symbols {y,x} with x in the base; a quadratic-only proof fails this case.

*Needs:* §4.1; §7.12; §10.2; §10.8; §10.9; §10.11; §10.12; §10.13; §10.24; GeneralAlgebraicKTheory §7.7; GeneralAlgebraicKTheory §7.8.

### 11.8 The degree-two residue comparison square

Let R be the discrete valuation ring, with fraction field F and residue field k. Write μ_F:K^M_2(F)≃K₂^St(F) for the Matsumoto equivalence of §7.12, c_F:K₂^St(F)≃K₂^Q(F) for §4.1 followed by the plus=Q comparison of GeneralAlgebraicKTheory §3.12, η_F=c_F∘μ_F, c_F♮=c_F∘(ε·) for the torus sign of §8.1, η_F♮=c_F♮∘μ_F=Φ₂ by §8.3, and det_k:K₁^Q(k)≃kˣ for the field determinant comparison of KTheoryLowDegrees §8.1. For the actual localization boundary B^R₂:K₂^Q(F)→K₁^Q(k), normalized by B₁[π]=1 and the right module rule B(x·j*y)=B(x)·i*y, the following equalities of homomorphisms hold: tameSymbolHom^M_v=tameSymbolHom^St_v∘μ_F=inv∘det_k∘B^R₂∘η_F♮. With the raw Hurewicz comparison, det_k∘B^R₂∘η_F=(tameSymbolHom^M_v)^(−ε). Also ∂^last_v in degree two agrees with tameSymbolHom^M_v under K^M_1(k)=kˣ. Setting B^L₂=−B^R₂ gives det_k∘B^L₂∘η_F♮=tameSymbolHom^M_v. Here inv denotes inversion of the abelian group kˣ. These equalities concern the actual symbol, product and connecting maps, not arbitrary chosen isomorphisms. The same inversion is applied at every prime in the Dedekind boundary and cancels from either norm/residue square. (Weibel, V.6.1.2, V.6.6–6.6.1; V.(6.6.3)–(6.6.4), pp. 406, 409–410; Weibel, III.6.3, III.7.1 and III.7.3, pp. 234, 245, 246.)

π∈Fˣ is a uniformizer of order one. The Milnor, classical, plus and Quillen identifications and the localization/product maps are the specified natural maps.

**Checks.**

- On {2,5} over ℚ at 5, tameSymbolHom has value 2, whereas det_k B^R₂ η♮ has value 3. The square commutes only with the displayed inversion.
- On {5,5}, both degree-two normalizations give −1, which is 4 in 𝔽_5; diagonal tests alone do not detect inversion.
- For finite integral closure S/R, both the Milnor and Quillen norm/residue squares have residue-field norms and no extra e_w factor. The restriction square has e_w instead.

*Needs:* §4.1; §7.12; §8.2; §9.5; §9.8; §9.16; §11.1; §11.2; §11.6; §11.7; KTheoryLowDegrees §8.1; GeneralAlgebraicKTheory §3.12; GeneralAlgebraicKTheory §3.14; GeneralAlgebraicKTheory §8.12; GeneralAlgebraicKTheory §8.13; GeneralAlgebraicKTheory Layers 4, 7 and 8; GeneralAlgebraicKTheory Layer 7.

### Examples

- On {2, 5} over ℚ at 5 the tame symbol is 2 while det ∘ B ∘ η♮ gives 3 = 2⁻¹: the square commutes only with the stated inversion; on {5, 5} both normalisations give −1, so diagonal tests do not detect it.

### Dependencies

Layers 4, 7–10; GeneralAlgebraicKTheory Layers 3, 4, 7 and 8; KTheoryLowDegrees §8.1.

## Layer 12: tame kernels and explicit arithmetic

The unramified subgroup of K₂ of a field with a family of discrete valuations; the exact sequences 0 → K₂(O_{F,S}) → K₂(F) → ⊕_{𝔭∉S} k(𝔭)^× → 0 and 0 → K₂(O_F) → K₂(O_{F,S}) → ⊕_{𝔭∈S} k(𝔭)^× → 0 for a number field; the real sign symbol; and K₂(ℤ) ≅ ℤ/2 generated by {−1, −1}, through Milnor's integer word reduction and the monomial-kernel theorem, and K₂(ℚ) ≅ ℤ/2 ⊕ ⊕_{p odd} 𝔽_p^×.

### 12.1 The unramified subgroup of K_2 of a field

Let F be a field with a family (v_i)_{i∈I} of discrete valuations — in the arithmetic case R is a Dedekind domain with fraction field F, I = HeightOneSpectrum R and v_𝔭 is the 𝔭-adic valuation; for a number field R = O_F and I is the set of finite places. The unramified subgroup U_I(F) ⊂ K_2(F) is the intersection over i of the kernels of the tame symbols ∂_{v_i} : K_2(F) → k(v_i)^× of Layers 9–11; for S ⊂ I the subgroup unramified outside S is the intersection over i ∉ S. The definition uses no localisation theorem; for a number field its identification with K_2(O_F) is §12.3. (Weibel, III.6.3, Lemma 6.3, p. 234; Weibel, III.6.5, Localization Theorem 6.5, p. 236.)

Each v_i is a discrete valuation of F with residue field k(v_i). When every element of F^× has nonzero valuation at only finitely many v_i (a Dedekind domain, the places of a function field), U_I(F) is the kernel of the residue sum K_2(F) → ⊕_i k(v_i)^×.

Provide the following API.

- `unramifiedSubgroup`: For a family v : I → discrete valuations of F, ⨅ i, ker(∂_{v i}) as a subgroup of K_2(F).
- `mem_unramifiedSubgroup_iff`: x ∈ U ↔ ∀ i, ∂_{v i} x = 1.
- `unramifiedOutside`: For S ⊆ I, ⨅ i ∉ S, ker(∂_{v i}); unramifiedOutside ∅ = unramifiedSubgroup, and it is monotone in S.
- `unramifiedSubgroup_eq_ker_residueSum`: Under finite support, U = ker(K_2(F) → ⨁ i, k(v i)ˣ).
- `symbol_mem_unramifiedSubgroup`: If u and w are units at every v_i then {u, w} ∈ U.
- `range_K2_le_unramifiedSubgroup`: For a Dedekind domain R with fraction field F and I = HeightOneSpectrum R, the image of K_2(R) → K_2(F) lies in U.
- `unramifiedSubgroup_map_le`: Restriction along a finite extension carrying the family into the family maps U into U.
- `transfer_mem_unramifiedSubgroup`: The transfer of a finite extension of number fields maps the unramified subgroup of the larger field into that of the smaller.
- `unramifiedSubgroup_heightOneSpectrum`: For I = HeightOneSpectrum R, v_𝔭 is Mathlib's HeightOneSpectrum.valuation F and k(v_𝔭) is identified with R ⧸ 𝔭.

**Checks.**

- For F = ℚ with the family of all primes, {−1, −1} ∈ U, since −1 is a unit at every prime.
- For an odd prime p, {−1, p} ∉ U over ℚ: its tame symbol at p is −1 ≠ 1 in 𝔽_p^×; a definition testing only symbols of units, or only one place, misses this.
- {3, 3} ∉ U over ℚ: the sign (−1)^{v(f)v(g)} makes its tame symbol at 3 equal to −1; a symbol without the sign would wrongly put {3, 3} in U.
- {2, −1} = 1 by the Steinberg relation (2 + (−1) = 1); correspondingly its tame symbol at 2 is −1 = 1 in 𝔽_2^× and all others are 1.
- For the empty family U = K_2(F), and unramifiedOutside I = K_2(F).
- For ℚ and the primes, x ∈ U exactly when the residue sum of x in ⨁_p 𝔽_p^× vanishes.
- For R = ℤ the valuation Mathlib attaches to (p) ∈ HeightOneSpectrum ℤ is the p-adic valuation and ℤ ⧸ (p) ≅ ZMod p, so the tame symbol at (p) lands in (ZMod p)ˣ.

*Needs:* §2.9; §6.19; §9.4; §9.7; §9.13; §10.27; Mathlib `IsDedekindDomain.HeightOneSpectrum`; Mathlib `IsDedekindDomain.HeightOneSpectrum.valuation`.

### 12.2 The tame-kernel sequence of the S-integers: residues at the primes outside S

Let F be a number field, S a finite set of nonzero primes of O_F (S = ∅ allowed) and O_{F,S} = Set.integer S F. The nonzero primes of O_{F,S} are the 𝔭O_{F,S} with 𝔭 ∉ S, with residue fields k(𝔭) = O_F/𝔭 (Tau Ceti's IsDedekindDomain.integerHeightOneSpectrumEquiv). Then 0 → K_2(O_{F,S}) → K_2(F) −(∂_𝔭)_{𝔭∉S}→ ⊕_{𝔭∉S} k(𝔭)^× → 0 is exact: the sum is over the finite primes OUTSIDE S. Equivalently K_2(O_{F,S}) → K_2(F) is injective with image the subgroup unramified outside S (§12.1), and the residue sum over the primes outside S is onto. The sequence is derived through the actual maps of the Dedekind localisation sequence, whose boundary is the tame symbol at each prime (§11.2, from Layer 11): injectivity because K_2 of each finite residue field vanishes, surjectivity because the cokernel of the residue sum is ker(K_1(O_{F,S}) → K_1(F)), which is zero by the Bass–Milnor–Serre theorem SK_1(O_{F,S}) = 0 (KTheoryLowDegrees Layers 10–11). The relative sequence comparing O_F with O_{F,S}, whose residues are at the primes IN S, is §12.4. (Weibel, III.6.5, Localization Theorem 6.5, p. 236; Weibel, V.6.8, Theorem 6.8, p. 412; Weibel, V.6.8, proof of Theorem 6.8, p. 412.)

F is a number field and S a finite set of nonzero primes of O_F. K_2 is the classical group of Layers 1–4, identified with Quillen's K_2 by §4.1; the sign of the boundary is fixed in §11.1 and does not affect kernels or images.

**Checks.**

- For F = ℚ and S = {p}: 0 → K_2(ℤ[1/p]) → K_2(ℚ) → ⊕_{ℓ≠p} 𝔽_ℓ^× → 0; the residue at p is not in the sum.
- For S = ∅ it is §12.3.
- Indexing test: {5, 2} ∈ K_2(ℚ) has nonzero tame symbol only at 5 (value 3 with Layers 9–11's normalisation), so it lies in the image of K_2(ℤ[1/5]) and not in that of K_2(ℤ[1/2]).

*Needs:* §4.1; §7.10; §11.1; §11.2; §12.1; KTheoryLowDegrees Layers 10–11; Mathlib `Set.integer`; Tau Ceti `IsDedekindDomain.integerHeightOneSpectrumEquiv`.

### 12.3 The tame-kernel exact sequence for the ring of integers

For a number field F with ring of integers O_F the sequence 0 → K_2(O_F) → K_2(F) −⊕∂_𝔭→ ⊕_𝔭 k(𝔭)^× → 0 is exact, the sum over all nonzero primes of O_F and the third map the residue sum of the tame symbols (sign fixed in §11.1): K_2(O_F) → K_2(F) is injective with image the unramified subgroup of §12.1, and the residue sum is onto. It is the case S = ∅ of §12.2: injectivity from K_2(k(𝔭)) = 0, surjectivity from SK_1(O_F) = 0 through the Dedekind localisation sequence (§11.2 and KTheoryLowDegrees Layers 10–11). ArithmeticKTheory specialises its all-degree localisation sequence to this one; this layer does not use ArithmeticKTheory. Surjectivity does not follow from the surjectivity of the individual tame symbols. (Weibel, III.6.5, Localization Theorem 6.5, p. 236; Weibel, V.6.8, Theorem 6.8, p. 412; Weibel, V.6.8, proof of Theorem 6.8, p. 412; Weibel, III.1.5.4, Example 1.5.4, p. 185.)

F is a number field; 𝔭 runs over the nonzero primes of O_F and k(𝔭) = O_F/𝔭. K_2 is the classical group of Layers 1–4, identified with Quillen's K_2 by §4.1.

**Checks.**

- For F = ℚ it is 1 → K_2(ℤ) → K_2(ℚ) → ⊕_p 𝔽_p^× → 1 (Application III.6.5.1).
- The third map is onto, but not because each tame symbol is: Example III.1.5.4 gives surjective tame symbols with a nonzero cokernel.
- The same sequence holds for every Dedekind domain whose fraction field is a global field (Soulé's Theorem V.6.8, n = 2).

*Needs:* §7.10; §11.2; §12.1; §12.2; KTheoryLowDegrees Layers 10–11; Mathlib `NumberField.RingOfIntegers`; Mathlib `Set.integer`.

### 12.4 The relative sequence comparing K₂(O_F) with K₂(O_{F,S}): residues at the primes in S

Let F be a number field and S a finite set of nonzero primes of O_F. Then 0 → K_2(O_F) → K_2(O_{F,S}) −(∂_𝔭)_{𝔭∈S}→ ⊕_{𝔭∈S} k(𝔭)^× → 0 is exact, the first map induced by O_F ⊆ O_{F,S} and the residues taken at the primes IN S (read on the image of K_2(O_{F,S}) in K_2(F)). The tame-kernel sequence of O_{F,S} itself, §12.2, has its residues at the primes OUTSIDE S; the two are distinct statements. Consequently #K_2(O_{F,S}) = #K_2(O_F)·∏_{𝔭∈S}(N𝔭 − 1) whenever K_2(O_F) is finite. This is the exact sequence comparing the S-integral tame kernel with the integral one. (Weibel, V.6.8, Theorem 6.8, p. 412.)

F is a number field and S a finite set of nonzero primes of O_F.

**Checks.**

- For F = ℚ and S = {p}: 0 → K_2(ℤ) → K_2(ℤ[1/p]) → 𝔽_p^× → 0, so K_2(ℤ[1/p]) has order 2(p − 1); ArithmeticKTheory uses this sequence.
- Indexing: the residues are at the primes in S; for S = ∅ the sequence is the identity of K_2(O_F).
- The order formula #K_2(O_{F,S}) = #K_2(O_F)·∏_{v∈S}(Nv − 1) that SpecialValuesBirchTate B.7 consumes follows because #k(𝔭)^× = N𝔭 − 1.

*Needs:* §12.1; §12.2; §12.3; Mathlib `Set.integer`.

### 12.5 The real sign symbol (Example III.6.2.1)

For x, y ∈ ℝ^× put (x, y)_∞ = −1 if x < 0 and y < 0, and +1 otherwise. It is bilinear and (x, 1 − x)_∞ = 1 for x ≠ 0, 1, so by Matsumoto's theorem it defines a homomorphism K_2(ℝ) → {±1}, onto because (−1, −1)_∞ = −1. For a field F with an embedding σ : F → ℝ (a real place of a number field) the composite K_2(F) → K_2(ℝ) → {±1} is the sign symbol at σ. (Weibel, III.6.2.1, Example 6.2.1, p. 232; Weibel, III.6.2.1, Example 6.2.1, continued, p. 232; Weibel, Exercise III.6.4, p. 243.)

The target {±1} is ℤˣ; σ is a ring embedding into ℝ.

Provide the following API.

- `realSignSymbol`: The homomorphism K_2(ℝ) →* ℤˣ with {x, y} ↦ −1 if x < 0 and y < 0, and 1 otherwise.
- `realSignSymbol_symbol`: Its value on a symbol {x, y}.
- `realSignSymbol_neg_one_neg_one`: realSignSymbol {−1, −1} = −1.
- `realSignSymbol_surjective`: It is onto ℤˣ.
- `signSymbolAt`: For σ : F →+* ℝ, the composite of K_2(σ) with realSignSymbol; for a number field one for each real place.
- `realSignSymbol_eq_milnorExamples`: Through Matsumoto's theorem, on K^M_2(ℝ): {x, y} ↦ −1 exactly when x < 0 and y < 0, which is the degree-two part of the graded map K^M_*(ℝ) → (ℤ/2)[t] of §5.12 (a lemma with no API name to compare with).

**Checks.**

- (−2, −3)_∞ = −1 and (−2, 3)_∞ = 1.
- (x, 1)_∞ = (1, y)_∞ = 1 for all x, y ∈ ℝ^×.
- The pairing equal to −1 when at least one entry is negative is not a Steinberg symbol: it is −1 at (2, −1) although 2 + (−1) = 1.
- For the real embedding of ℚ, signSymbolAt sends {−1, −1} to −1 and {p, q} to 1 for positive p, q.
- (x, y)_∞ = 1 exactly when x·a² + y·b² = 1 has a real solution, the Hilbert symbol of ℝ.

*Needs:* §2.9; §5.12; §7.12; Mathlib `NumberField.InfinitePlace.IsReal`.

### 12.6 Finite-rank integer word models for Silvester’s induction

Define an auxiliary family S_n over ℤ: S₀=S₁=1; S₂ is Milnor’s rank-two presented group of Definition 10.4; S_n=St(n,ℤ) from Layers 1–4 for n≥3. In rank two impose x_ij(a)x_ij(b)=x_ij(a+b) and w_ij(u)x_ji(a)w_ij(−u)=x_ij(−u²a), u∈ℤ×, where w_ij(u)=x_ij(u)x_ji(−u⁻¹)x_ij(u). Let φ_n be the elementary-matrix action on row vectors ℤ^n, W_n the subgroup generated by w_ij(1), and |b|₁=Σ_i |b_i|. Use the standard rank-raising maps S_n→S_(n+1) and the map into stable St(ℤ). This auxiliary S₂ is not the rank-two group with only the usual three-index Steinberg relations. (Milnor, Definition 10.4, p. 82; setup for Lemma 10.6, p. 85; Lemmas 9.2–9.4, pp. 71–72.)

n∈ℕ; the integer ring and row-vector action are fixed; finite St(n,ℤ) is that of §2.1 for n≥3.

Provide the following API.

- `IntegerSteinbergModel`: The auxiliary S_n with the explicit rank-two relation and the standard higher-rank carrier.
- `IntegerSteinbergModel.toElementary`: φ_n:S_n→E(n,ℤ), satisfying φ_n(x_ij(a))=e_ij(a).
- `IntegerSteinbergModel.stabilize`: S_n→S_(n+1) and compatible maps into stable St(ℤ); no low-rank injectivity is asserted.
- `IntegerSteinbergModel.monomialSubgroup`: W_n=⟨w_ij(1)⟩; its row-vector action preserves the integer ℓ¹ norm.
- `IntegerSteinbergModel.unitWord`: Every element is represented by signed unit generators followed by a W_n element; a norm-monotone representation is the next lemma, not part of this definition.

**Checks.**

- (2,−1)x₁₂(1)=(2,1) and (2,−1)x₂₁(1)=(1,−1).
- (2,−1)w₁₂(1)=(1,2), and both vectors have ℓ¹ norm 3.
- The auxiliary S₂ carries the conjugation relation of Definition 10.4; the ordinary two-index free Steinberg presentation is not substituted for it.

*Needs:* §2.1; §6.2; Mathlib `PresentedGroup`.

### 12.7 Silvester’s monotone integer word lemma

**Source gap.** The cited seven-case proof in Milnor has not been obtained from an accessible cleared copy. In particular the auxiliary rank-two case and termination argument remain proof-verification work.

For n≥2, a signed standard basis vector β∈ℤ^n and z∈S_n, there exist signed unit generators g₁,…,g_r and w∈W_n with z=g₁⋯g_r w and 1≤|βg₁|₁≤⋯≤|βg₁⋯g_r|₁. The word equality holds in S_n, not just after elementary matrices. (Milnor, Lemma 10.6 and its seven-case proof, pp. 85–90.)

S_n, W_n and the right row action are §12.6; β=±e_i; n≥2.

**Checks.**

- The result preserves the Steinberg word, not merely the resulting integer vector.
- At a=0 in Case 4 the first inequality is required; omitting that branch leaves the argument incomplete.
- The algorithm terminates by (λ,μ), not by a claimed decrease in word length.

*Needs:* §12.6.

### 12.8 The integer Steinberg kernel is contained in the monomial subgroup

**Source gap.** The cited Milnor proof has not been read from an accessible cleared copy; this containment, and hence the integer upper bound that uses it, remains conditional on that source check.

For every n≥1, ker(φ_n:S_n→E(n,ℤ))⊆W_n in the auxiliary finite-rank integer models. (Milnor, Lemma 10.7, pp. 90–92; Lemma 9.1, p. 71.)

The auxiliary S₂ has Milnor’s Definition 10.4; no injectivity of stabilization is assumed.

**Checks.**

- The induction includes n=2 using the auxiliary group; omitting this base does not prove the stable bound.
- The x=1 step uses the injective matrix map on commuting last-column root subgroups, not injectivity of φ_n on all S_n.

*Needs:* §12.6; §12.7.

### 12.9 The upper generation bound for K₂ of the integers

Every element of classical K₂(ℤ) is 1 or c={−1,−1}; this is the upper bound alone and does not assume c≠1. (Milnor, Theorem 10.1 and Corollary 10.2, p. 81; final proof, p. 92; Theorem 9.11, pp. 77–78.)

K₂(ℤ) is the stable Steinberg kernel; c is the Steinberg symbol {−1,−1} of §6.4.

**Checks.**

- The upper bound is available before the real sign and uses no calculation of K₂(ℚ).
- The rank-two auxiliary kernel is not asserted to have order two; the bound uses n≥3.

*Needs:* §2.9; §6.4; §12.8; §6.14.

### 12.10 K_2 of the integers is cyclic of order two, generated by {−1, −1}

K₂(ℤ) is cyclic of order two generated by c={−1,−1}. The upper generation theorem §12.9 proves every element is 1 or c by Silvester’s finite-rank word reduction and monomial-kernel calculation. Independently, the real sign sends c to −1, so c≠1; bimultiplicativity gives c²=1. Consequently K₂(ℤ)→K₂(ℝ)→{±1} is an isomorphism and splits K₂(ℤ)→K₂(ℝ). (Weibel, III.5.2.2, Example 5.2.2, p. 218; Weibel, III.6.2.1, Example 6.2.1, continued, p. 232; Weibel, III.5.2.2, Example 5.2.2, second paragraph, p. 218; Milnor, Corollary 10.2, p. 81, derived from Theorem 10.1 proved on p. 92.)

K_2 is the classical K_2 of Layers 1–4; {−1, −1} is the Steinberg symbol of the unit −1 of ℤ with itself.

**Checks.**

- {−1, −1} ≠ 1 in K_2(ℤ), while {−1, −1}² = 1.
- A real place is one way, not the only way, to detect {−1, −1}: in K_2(ℤ[i]) it vanishes ({−1, −1} = {i, −1}² = 1), yet K_2(ℤ[√−7]) is cyclic of order two generated by {−1, −1} although ℚ(√−7) has no real place (Tate, cited in III.5.2.2).
- In the certificate format of ArithmeticKTheory N.6, which owns certificates: one generator {−1, −1}, the relation 2g = 0, span by §12.9 and lower bound the real sign symbol; ArithmeticKTheory records that certificate and uses this target.

*Needs:* §2.9; §6.4; §12.5; §12.9.

### 12.11 K_2 of the rationals (Application III.6.5.1)

The residue sum of the tame symbols gives a split exact sequence 1 → K_2(ℤ) → K_2(ℚ) → ⊕_p 𝔽_p^× → 1, split by the real sign symbol through the isomorphism K_2(ℤ) ≅ {±1} of §12.10; hence K_2(ℚ) ≅ K_2(ℤ) ⊕ ⊕_p 𝔽_p^× ≅ ℤ/2 ⊕ ⊕_{p odd} 𝔽_p^× (𝔽_2^× being trivial), and K_2(ℚ) is infinite. ArithmeticKTheory uses this computation rather than repeating it. (Weibel, III.6.5.1, Application 6.5.1, p. 236.)

p runs over all primes (𝔽_2^× is trivial); exactness is the tame-kernel sequence for ℚ, which uses K_2(ℤ/p) = 1 and SK_1(ℤ) = 1.

**Checks.**

- {2, 3} is not in the image of K_2(ℤ): its tame symbol at 3 is −1 ≠ 1 in 𝔽_3^×.
- For an odd prime p, {−1, p} maps to the element −1 of 𝔽_p^× in the p-component and to 1 elsewhere.
- K_2(ℚ) is infinite while K_2(ℤ) has order two, the check ArithmeticKTheory N.8 asks for; the splitting uses the real place, and (p, q)_∞ = 1 for positive p, q.

*Needs:* §2.9; §7.10; §12.3; §12.5; §12.10; KTheoryLowDegrees Layers 10–11.

### Examples

- K₂(ℚ) is infinite: the residue at each odd prime p is onto 𝔽_p^×.
- The real sign symbol sends {−1, −1} to −1, which gives the lower bound c ≠ 1 in K₂(ℤ).

### Dependencies

Layers 2, 6, 7, 9 and 11; KTheoryLowDegrees Layers 10–11 (SK₁(O_{F,S}) = 0); Mathlib number fields; Tau Ceti `IsDedekindDomain.integerHeightOneSpectrumEquiv`.

## Layer 13: Dennis–Stein symbols and relative K₂

Dennis–Stein symbols ⟨r, s⟩ for commuting r, s with 1 − rs a unit, their relations (D1)–(D3) over commutative rings, the Dennis–Stein presentation of K₂ for threefold stable rings (van der Kallen) and for local rings, relative Steinberg groups and relative K₂ of an ideal with their comparison with the homotopy fibre (Keune–Loday), the presentation of relative K₂ of a radical ideal, the relative differential to I ⊗ Ω¹, K₂ of dual numbers with 2 invertible and the dyadic examples K₂(ℤ/2ⁿ) ≅ ℤ/2 for n ≥ 2.

### 13.1 Dennis-Stein symbols

For an associative unital ring R and commuting elements r, s of R with 1 − rs a unit, the Dennis-Stein symbol is ⟨r, s⟩ = x_ji(−s(1 − rs)⁻¹) x_ij(−r) x_ji(s) x_ij((1 − rs)⁻¹ r) (h_ij(1 − rs))⁻¹ in the stable Steinberg group St(R), for distinct indices i, j, where w_ij(u) = x_ij(u) x_ji(−u⁻¹) x_ij(u) and h_ij(u) = w_ij(u) w_ij(−1). Its image in E(R) is trivial — in the 2×2 block at (i, j) the four elementary factors multiply to diag(1 − rs, (1 − rs)⁻¹), which h_ij(1 − rs) cancels — so ⟨r, s⟩ lies in K_2(R). It does not depend on the choice of i ≠ j, it is 1 when r = 0 or s = 0, and when r is a unit it equals the Steinberg symbol {r, 1 − rs}; hence every Steinberg symbol {u, v} of commuting units is ⟨u, u⁻¹(1 − v)⟩. The convention is the modern one of the source. The pre-1980 symbol, defined when 1 + rs is a unit (the classical `1+ab` hypothesis), is ⟨−r, s⟩ in this notation; it is a different element and is not introduced as a second definition. The relations (D1)–(D3) are stated in §13.2 and the relative symbol is in §13.7. (Weibel, III.5.11, p. 226.)

`Suggested.lean` gives the word in St_n(R) as `Steinberg.dennisStein`.

R is an associative unital ring; r and s commute and 1 − rs is a unit of R. i ≠ j are indices; the word is read in the stable Steinberg group St(R), and the element does not depend on i, j. The classical `1 + ab` invertibility hypothesis is the pre-1980 convention: for commuting a, b with 1 + ab a unit the old symbol is ⟨−a, b⟩ in the notation used here, so that hypothesis is met through a ↦ −a.

Provide the following API.

- `K2.dennisStein`: For commuting r, s : R and a proof that 1 − r s is a unit, the element ⟨r, s⟩ : K₂(R).
- `K2.coe_dennisStein`: (⟨r, s⟩ : St(R)) = x_ji(−s u⁻¹) x_ij(−r) x_ji(s) x_ij(u⁻¹ r) h_ij(u)⁻¹ with u = 1 − r s, for any i ≠ j.
- `K2.dennisStein_index_indep`: The words for (i, j) and for (k, l) are equal in St(R).
- `K2.phi_dennisSteinWord`: The image in E(R) of x_ji(−s u⁻¹) x_ij(−r) x_ji(s) x_ij(u⁻¹ r) is diag(u, u⁻¹) at (i, j).
- `K2.dennisStein_zero_left`: ⟨0, s⟩ = 1.
- `K2.dennisStein_zero_right`: ⟨r, 0⟩ = 1.
- `K2.dennisStein_eq_steinbergSymbol`: For a unit r, ⟨r, s⟩ = {r, 1 − r s}.
- `K2.steinbergSymbol_eq_dennisStein`: For commuting units u, v, {u, v} = ⟨u, u⁻¹ (1 − v)⟩.
- `K2.map_dennisStein`: For a ring homomorphism f : R → R', K₂(f) ⟨r, s⟩ = ⟨f r, f s⟩.
- `K2.dennisStein_plusConvention`: If 1 + ab is a unit, the older plus-convention word P(a,b) equals the modern word ⟨−a,b⟩, by direct substitution into the displayed words; there is no additional inversion.

**Checks.**

- In GL₂(R), with u = 1 − r s a unit and r s = s r, e₂₁(−s u⁻¹) e₁₂(−r) e₂₁(s) e₁₂(u⁻¹ r) = diag(u, u⁻¹); a word with one sign or one factor changed fails this.
- ⟨r, 0⟩ = 1 and ⟨0, s⟩ = 1 for all r, s.
- In K₂(ℤ): ⟨−1, −2⟩ = {−1, 1 − (−1)(−2)} = {−1, −1}, which is non-trivial because the sign symbol of §12.5 sends it to −1.
- At (−1, −2) in ℚ the pre-1980 symbol is ⟨1, −2⟩ = {1, 3} = 1 (1 + (−1)(−2) = 3 is a unit), while the modern ⟨−1, −2⟩ = {−1, −1} ≠ 1 in K₂(ℚ); and over ℤ the modern symbol is defined at (1, 2) because 1 − 2 = −1 is a unit, where the old hypothesis 1 + 2 = 3 fails. An implementation of the old convention fails both.
- In K₂(ℚ), {2, 3} = ⟨2, −1⟩, the case u = 2, v = 3 of {u, v} = ⟨u, u⁻¹(1 − v)⟩.

*Needs:* §2.1; §2.5; §2.9; §2.11; §6.2; §6.3; §6.4; §6.14.

**Dennis–Stein convention and stable word.** For a commutative ring A, r,s∈A and u=1−rs∈Aˣ, the modern symbol D(r,s) is the stable Steinberg-kernel element x_ji(−s/u)x_ij(−r)x_ji(s)x_ij(r/u)h_ij(u)⁻¹. It is independent of the distinct indices i,j. For the older plus-convention word P(a,b)=x_ji(−b/(1+ab))x_ij(a)x_ji(b)x_ij(−a/(1+ab))h_ij(1+ab)⁻¹, the exact translation is D(r,s)=P(−r,s). If r is a unit, D(r,s)={r,1−rs}; if s is a unit, D(r,s)={1−rs,s}. The translation has no additional inversion. The four elementary factors of P have image diag(1+ab,(1+ab)⁻¹), so its final torus factor must be inverted. Morrow’s Remark 3.10, p.8, prints that factor without the inverse; the displayed word there would have image diag((1+ab)²,(1+ab)⁻²). (Dennis–Stein, Proposition 1.1, pp.283–285; van der Kallen 1977, §5.2, pp.488–489; Morrow, §3.3, p.7, for the unit formulas.)

A is commutative and unital; u=1−rs is a unit. All assertions about centrality and index independence take place after stabilization.

*Checks.*

- In ℚ(t), D(2,(1−t)/2)={2,t}, with tame residue 2 at t=0; inserting an inverse gives 1/2.
- For the older word at a=b=1 over ℚ, omitting the final inverse leaves elementary image diag(4,1/4), rather than the identity.
- The construction does not imply centrality for St(2,A).
- D(r,0)=D(0,s)=1 in multiplicative K₂ (zero in additive notation), and D(r,s) need not be alternating.

*Needs:* §2.11; §6.2; §6.3.

### 13.2 The Dennis-Stein relations (D1)–(D3)

For a commutative ring R the Dennis-Stein symbols satisfy (D1) ⟨r, s⟩⟨s, r⟩ = 1 when 1 − rs is a unit; (D2) ⟨r, s⟩⟨r, t⟩ = ⟨r, s + t − rst⟩ when 1 − rs and 1 − rt are units, the right side being defined because 1 − r(s + t − rst) = (1 − rs)(1 − rt); and (D3) ⟨r, st⟩ = ⟨rs, t⟩⟨tr, s⟩ when 1 − rst is a unit. Consequently ⟨r, 1⟩ = 1 whenever 1 − r is a unit (D3 with s = t = 1), which the source prints as ⟨r, 1⟩ = 0. When every entry involved is a unit or zero — in particular over a field — the relations follow from the unit case of the definition together with bilinearity and the Steinberg identity of Steinberg symbols. For a general commutative ring use Dennis–Stein, Proposition 1.1 and its proof, pp.283–285, after the direct change of variables P(a,b)=D(−a,b) from §13.1. (Weibel, III.5.11, p. 226; Weibel, Exercise III.5.13, p. 229.)

R is a commutative ring. The source displays (D1)–(D3) without hypotheses and cites Dennis–Stein, who work with commutative rings; the relations are not asserted for merely commuting elements of a noncommutative ring. Each symbol written is defined: the relevant 1 − rs, 1 − rt, 1 − rst are units.

**Checks.**

- In K₂(ℤ/4): (D3) with (r, s, t) = (2, 1, 1) gives ⟨2, 1⟩ = 1; (D2) with (2, 1, 2) gives ⟨2, 1⟩⟨2, 2⟩ = ⟨2, −1⟩; (D3) with (2, −1, −1) gives ⟨2, −1⟩² = ⟨2, 1⟩ = 1 (since −2 = 2); (D1) gives ⟨2, −1⟩ = ⟨−1, 2⟩⁻¹ = ⟨−1, 2⟩; and 2 = −2, so ⟨2, 2⟩ = ⟨−1, −2⟩ = {−1, −1}, the identity of K-book Ex. III.5.13.
- ⟨r, 1⟩ = 1 when 1 − r is a unit; it is not a separate generator and not '0'.
- Over a field the relations are consequences of the Steinberg relations; no relation beyond (D1)–(D3) is claimed.

*Needs:* §6.4; §6.7; §13.1.

**Dennis–Stein relations over a commutative ring.** The stable symbols satisfy (D1) D(r,s)=−D(s,r); (D2) D(r,s)+D(r,t)=D(r,s+t−rst) when 1−rs and 1−rt are units; (D3) D(r,st)=D(rs,t)+D(rt,s) when 1−rst is a unit. These hold over every commutative ring, independently of the extra hypotheses needed for a presentation theorem. (Dennis–Stein, Proposition 1.1(H1)–(H5) and proof, pp.283–285; Weibel, III.5.11, p. 226.)

A is commutative. Each displayed symbol must be admissible; the stated unit conditions imply this. In the older P convention, H1 gives D1 and H5 gives D3. For D2 put u=1+ab. H3 gives P(a,b+uc)=P(a,b)+P(a/u,uc)+{u,1+ac}, and H5 gives P(a/u,uc)=P(a,c)+P(ac/u,u)=P(a,c)+{1+ac,u}. Skew-symmetry cancels the last two unit symbols. Substituting a=−r, b=s, c=t yields the modern D2. Both u and 1+ac are units throughout; no division by a, b or c occurs.

*Checks.*

- The proofs apply to rings with zero divisors, including ℤ/4.
- For D2, 1−r(s+t−rst)=(1−rs)(1−rt).
- No Matsumoto theorem or local-presentation theorem is used in proving these relations.

*Needs:* §6.9; §13.1.

### 13.3 Threefold stability

A commutative ring A is threefold stable if for every three unimodular pairs (a_i,b_i), i=1,2,3, there is t∈A such that every a_i+b_i t is a unit. A pair is unimodular precisely when a_i A+b_i A=A. This predicate is a sufficient hypothesis for the stable Dennis–Stein presentation; it is not imposed on the separate all-local-ring theorem. (van der Kallen 1977, §5.2 and §5.4(3), pp.488–489.)

A is a commutative unital ring.

Provide the following API.

- `IsThreefoldStable`: The quantified simultaneous-unit predicate on three unimodular pairs.
- `IsThreefoldStable.exists_unit_perturbation`: The definition returns t and the three unit proofs for supplied pairs.
- `IsThreefoldStable.ringEquiv`: A ring equivalence preserves and reflects the predicate, compatibly with identity and composition.
- `isThreefoldStable_iff_residue_card_ge_four`: For semilocal A, threefold stability is equivalent to cardinality at least four of every residue field.

**Checks.**

- 𝔽₅ and ℤ/25 are threefold stable, since their residue fields have five elements.
- 𝔽₂ and 𝔽₃ are local but not threefold stable: the pairs (−c,1) exclude all t.
- 𝔽₅×𝔽₅ is threefold stable although it is not local.

*Needs:* Mathlib `IsUnit`.

### 13.4 Presentation of K_2 of a field or a commutative local ring by Dennis-Stein symbols

Theorem III.5.11.1(a). Let R be a commutative local ring, or a field. Then the homomorphism to K₂(R) from the abelian group D(R) generated by symbols ⟨r, s⟩ (r, s ∈ R with 1 − rs a unit) subject only to (D1), (D2) and (D3), sending each generator to the Dennis-Stein symbol, is an isomorphism. For a field this is equivalent to Matsumoto's theorem through ⟨r, s⟩ ↦ {r, 1 − rs} for r ≠ 0, ⟨0, s⟩ ↦ 1, and {a, b} ↦ ⟨a, a⁻¹(1 − b)⟩, and it is proved that way. For a commutative local ring that is not a field it is the theorem the source attributes to Maazen, Stienstra and van der Kallen, with Keune [103] as the correct reference; it is cited, not proved. The separate §13.5 extends the presentation to threefold stable commutative rings; it uses van der Kallen’s theorem, not an unstated stable-range generalization of III.5.11.1(a). (Weibel, III.5.11.1(a), p. 226; Weibel, III.5.11, p. 226.)

R is a commutative local ring, or a field.

**Checks.**

- For a field the Dennis-Stein and Matsumoto presentations correspond under {a, b} ↔ ⟨a, a⁻¹(1 − b)⟩, with ⟨0, s⟩ = 1.
- For a local ring that is not a field the statement is cited, with the reference the source names.
- No presentation is asserted outside the stated hypotheses.

*Needs:* §7.12; §13.1; §13.2.

### 13.5 Dennis–Stein presentation for threefold stable rings

Let D(A) be the abelian group on all admissible pairs (r,s), with relations D1–D3. If A is threefold stable, the map D(A)→K₂(A) sending a generator to the modern stable word is an isomorphism. More precisely D(A)≅K₂(n,A) for n≥3, and these isomorphisms commute with stabilization and ring maps between such rings. No corresponding claim is made for n=2. (van der Kallen 1977, Theorem 5.3, p.489; §§5.8–5.19, pp.491–495; Theorem 6.2 and §§6.3–6.23, pp.496–506; Theorem 7.1 and §§7.2–7.4, pp.507–508.)

A is commutative and threefold stable; n≥3 in the finite-rank assertion.

**Checks.**

- Both composites are identity, on D-generators and on arbitrary Steinberg-kernel words.
- The finite-rank range starts at three; §5.4(6) warns that the rank-two inverse can have kernel.
- The result covers local rings with residue cardinality ≥4 and nonlocal examples such as 𝔽₅×𝔽₅.

*Needs:* §2.9; §13.2; §13.3; §13.4.

### 13.6 The local Dennis–Stein presentation, including residue fields 𝔽₂ and 𝔽₃

For every commutative local ring A, the modern generator map D(A)→K₂(A) is an isomorphism, including residue fields 𝔽₂ and 𝔽₃. The field cases are Layer 7 and the field inverse of §13.1; local rings with residue cardinality ≥4 use the preceding theorem. **Proof gap:** the announcement supplies the statement, but the full presentation proof for nonfield local rings with residue field 𝔽₂ or 𝔽₃ has not been obtained. The threefold-stable proof does not cover these rings. Maazen–Stienstra, *A presentation for K₂ of split radical pairs*, pp.271–294, is a source to obtain; split pairs alone would still require a reduction for a nonsplit local ring. (van der Kallen–Maazen–Stienstra, §2.4, Theorem 1, p.935; Weibel, III.5.11.1(a), p. 226.)

A is a commutative local ring; there is no hypothesis on its residue-field cardinality.

**Checks.**

- ℤ/4 and ℤ/9 are admissible local examples even though neither is threefold stable.
- Later calculations with the local presentation for residue field 𝔽₂ or 𝔽₃ use the nonfield case of this target.

*Needs:* §7.12; §13.4; §13.5.

### 13.7 The relative Steinberg group and relative K_2 of an ideal

For a ring R and a two-sided ideal I, let R ⊕ I be the double ring with multiplication (r, x)(s, y) = (rs, ry + xs + xy), with pr(r, x) = r and add(r, x) = r + x. St′(R, I) is the normal subgroup of St(R ⊕ I) generated by the x_ij(0, v), v ∈ I; it is the kernel of St(pr). The relative Steinberg group St(R, I) is the quotient of St′(R, I) by the normal subgroup generated by the cross-commutators [x_ij(0, u), x_kl(v, −v)], u, v ∈ I (Keune and Loday's definition). St(add) induces St(R, I) → St(R), whose image is the normal subgroup generated by the x_ij(v), v ∈ I, and whose composite with St(R) → E(R) lands in E(R, I). K₂(R, I) is the kernel of St(R, I) → E(R, I). For s ∈ I and r commuting with s with 1 − rs a unit, the relative Dennis-Stein symbol ⟨r, s⟩ ∈ K₂(R, I) is the class of the Dennis-Stein word of ((r, 0), (0, s)) in St(R ⊕ I); it lies in St′(R, I) because pr sends it to ⟨r, 0⟩ = 1, and add sends it to ⟨r, s⟩ ∈ K₂(R). K₂(R, I) fits into the exact sequence K₂(R, I) → K₂(R) → K₂(R/I) → K₁(R, I) → K₁(R) → K₁(R/I) of Theorem III.5.7.1. Its identification with π₂ of the homotopy fibre of K(R) → K(R/I) (GeneralAlgebraicKTheory Layer 8) is due to Keune and Loday; proving it is part of §13.7. (Weibel, III.5.7, p. 222; Weibel, III.5.7.1, p. 223; Weibel, III.5.11, p. 226; Weibel, IV.1.11, p. 268.)

R is an associative unital ring and I a two-sided ideal; E(R, I), GL(I) and K₁(R, I) are those of KTheoryLowDegrees Layer 9. For the relative symbol: s ∈ I, r ∈ R commutes with s, and 1 − rs is a unit of R.

Provide the following API.

- `K2.RelSteinberg`: St(R, I): the normal closure of the x_ij(0, v) in St(R ⊕ I), modulo the cross-commutators [x_ij(0, u), x_kl(v, −v)].
- `K2.RelSteinberg.add`: The homomorphism St(R, I) → St(R) induced by add.
- `K2.RelSteinberg.range_add`: Its range is the normal subgroup of St(R) generated by the x_ij(v), v ∈ I.
- `K2.relK2`: K₂(R, I), the kernel of St(R, I) → E(R, I).
- `K2.relK2.toK2`: The map K₂(R, I) → K₂(R).
- `K2.relK2.exact`: Exactness of K₂(R, I) → K₂(R) → K₂(R/I) → K₁(R, I) → K₁(R) → K₁(R/I) (Theorem III.5.7.1).
- `K2.relK2.map`: A ring homomorphism f : R → R' with f(I) ⊆ I' induces K₂(R, I) → K₂(R', I'), with map_id and map_comp.
- `K2.relK2_bot`: K₂(R, ⊥) is trivial.
- `K2.relDennisStein`: For s ∈ I, r commuting with s and 1 − r s a unit, the relative symbol ⟨r, s⟩ ∈ K₂(R, I).
- `K2.toK2_relDennisStein`: relK2.toK2 ⟨r, s⟩ = ⟨r, s⟩.

**Checks.**

- For I = 0, St′(R, 0) is generated by x_ij(0, 0) = 1, so St(R, 0) and K₂(R, 0) are trivial.
- For R = ℤ/4 and I = 2ℤ/4: K₂(ℤ/2) = 1 (§7.10), so by exactness K₂(ℤ/4, I) → K₂(ℤ/4) is onto, and the relative symbol ⟨2, 2⟩ maps to ⟨2, 2⟩ = {−1, −1}.
- For I = R the range of St(R, R) → St(R) is all of St(R), and for I = 0 it is trivial.

*Needs:* §2.1; §2.5; §2.9; §13.1; KTheoryLowDegrees Layers 9 and 13; GeneralAlgebraicKTheory Layer 8.

### 13.8 Relative Steinberg K₂ and the homotopy fibre

For an ideal I of a unital ring A, use the augmented double A⋉I with multiplication (a,x)(b,y)=(ab,ay+xb+xy), projections p(a,x)=a and q(a,x)=a+x. St(A,I) is ker St(p) modulo the normal closure of the cross-commutators [x_ij(0,u),x_kl(v,−v)] with u,v∈I, i≠j and k≠l. The q-map gives St(A,I)→E(A,I); its kernel is classical relative K₂(A,I). **Proof gap:** the natural comparison with π₂ fib(K(A)→K(A/I)) and its compatibility with the K₃ connecting map have not been decomposed from the Keune–Loday proofs. The target retains that comparison, identifies its forgetful and connecting maps, and extends to the segment K₃(A)→K₃(A/I)→K₂(A,I)→K₂(A)→K₂(A/I)→K₁(A,I). (Weibel, Definition III.5.7, p. 222; Levine, §2.1, pp.289–290.)

A is unital and I is two-sided. Commutativity is imposed only for the symbol calculations below. The cross-commutator subgroup is normally generated; the four indices need not be pairwise distinct.

**Checks.**

- For I=0 the relative Steinberg group and relative K₂ are zero.
- For a split square-zero extension, the fibre calculation maps injectively to absolute K₂.
- A degree-one fibre comparison or excision claim does not prove this degree-two comparison.

*Needs:* §13.7; KTheoryLowDegrees §13.5; KTheoryLowDegrees §§13.3–13.5; GeneralAlgebraicKTheory §8.1.

### 13.9 Presentation of relative K₂ for an ideal in the Jacobson radical

Theorem III.5.11.1(b). Let I be an ideal contained in the Jacobson radical of a commutative ring R. Then K₂(R, I) is the abelian group generated by the relative Dennis-Stein symbols ⟨r, s⟩ with r ∈ R and s ∈ I, or r ∈ I and s ∈ R, subject only to (D1), (D2) when r∈I or both s,t∈I, and (D3) when r∈I or s∈I or t∈I. Every displayed pair must be a relative generator. For such pairs 1 − rs is automatically a unit, since rs lies in I and so in the Jacobson radical. The source states this theorem with part (a), attributes it as there, and does not prove it. (Weibel, III.5.11.1(b), p. 227; Weibel, III.5.11, p. 226; Weibel, Exercise III.5.14(a), p. 229.)

R is a commutative ring and I ⊆ R an ideal contained in the Jacobson radical of R.

Provide the following API.

- `K2.RelDSGen`: The subtype of R × R with at least one entry in I.
- `K2.relDSRel`: D1 and D2 on relative generators and D3 only for r ∈ I ∨ s ∈ I ∨ t ∈ I. The three generator witnesses for D3 are derived from that entry condition, never used as a weaker substitute.
- `K2.relDennisSteinGroup`: FreeAbelianGroup (RelDSGen I) modulo AddSubgroup.closure (relDSRel I), with the guarded D3 set.
- `K2.relDennisSteinGroup.toRelK2`: For I ≤ Ideal.jacobson ⊥, the relative generator map descends through exactly the source-allowed D1–D3 relations. **Proof gap:** bijectivity is relative_presentation; the full generation and kernel argument of Keune, Theorem 15, remains unobtained. Levine gives its statement, and the split-pair announcement does not prove it for an arbitrary ideal in the Jacobson radical.

**Checks.**

- For I = 0 the presentation gives the trivial group.
- For I² = 0 it specialises to §13.12.
- It is asserted for an ideal contained in the Jacobson radical of a commutative ring; scheme-theoretic radicality is not the hypothesis.
- Non-example: R = F_3[x,y]/(x²,y²), z = xy, I = (z), r = x, s = y, t = x+y. Here I² = 0 and I lies in the Jacobson radical; rs = st = tr = z but no entry is in I, so this triple is not admitted as relative D3. In the differential detector I ⊗_R Ω¹_{(R/I)/ℤ} ≅ F_3², ⟨x,z⟩−⟨z,x+y⟩−⟨z,y⟩ has image (1,1), not 0.
- On the actual ring DualNumber (DualNumber (ZMod 3)), let x be the inner epsilon, y the outer epsilon and I = (xy). The three D3 pairs for (x,y,x+y) are admissible but x, y and x+y are outside I; the corrected D3 clause rejects the triple.
- For the same ring/ideal, in the basis xy⊗dx, xy⊗dy of I ⊗_R Ω¹_{(R/I)/ℤ}, δ⟨x,xy⟩ = (2,0), δ⟨xy,x+y⟩ = (1,1), δ⟨xy,y⟩ = (0,1). The extra D3 defect is (1,1) ≠ 0; all source-allowed D1/D2/D3 defects vanish.
- For I = ⊥, relDennisSteinGroup I and relative K₂ are trivial; the guarded quotient has no spurious nonzero generators.

*Needs:* §13.2; §13.7; Mathlib `DualNumber`; Mathlib `DualNumber.eps`; Mathlib `Ideal.mul_mem_left`; Mathlib `Ideal.mul_mem_right`.

**Relative Dennis–Stein presentation with the generator condition.** For commutative A and I⊆Jac(A), classical K₂(A,I) is generated by D(r,s) with r∈I or s∈I. D1 and D2 are imposed only when all displayed symbols are relative. D3 is imposed only when at least one of its INPUTS r,s,t lies in I. For D2 this eligibility says r∈I or both s,t∈I. These are presentations of the relative group, not just of its image in K₂(A). The generation and full kernel proof of Keune’s Theorem 15 is part of this target. (Levine, The unnumbered theorem in §2.1, p.290, attributed to Keune Theorem 15; van der Kallen–Maazen–Stienstra, §2.6, Theorem 2, p.935.)

I is contained in the Jacobson radical, not merely a radical ideal in the scheme-theoretic sense. For the eligible symbols 1−rs is a unit; an element of I is not required to be nilpotent.

*Checks.*

- The guard is checked on r,s,t, before their products are formed.
- The square-zero calculations use this guarded presentation.
- For I=0 there are only zero-entry relative symbols, all zero.

*Needs:* §13.2; §13.8; Mathlib `Ideal.jacobson`.

### 13.10 The relative differential symbol

For commutative A and I⊆Jac(A), set B=A/I and Ω=Ω¹_{B/ℤ}. The relative symbol differential δ:K₂(A,I)→I⊗_A Ω is the additive homomorphism specified by δD(x,r)=x⊗d(r̄) and δD(r,x)=−x⊗d(r̄), for x∈I. It is surjective and natural for maps of pairs. If both entries lie in I the two formulas both give zero. Its construction from classical K₂ uses the guarded relative presentation of §13.9. (Weibel, Exercise III.5.14(a)–(b), p. 229; van der Kallen 1971, The unnumbered theorem and corollary, p.1204, with proof pp.1205–1207.)

A is commutative; I⊆Jac(A). The tensor product is over A via A→B on Ω, so I²⊗Ω vanishes. The base of differentials is ℤ.

Provide the following API.

- `relativeSymbolDifferential`: The unique additive map with the two displayed generator formulas.
- `relativeSymbolDifferential_left`: δD(x,r)=x⊗d(r̄) for x∈I.
- `relativeSymbolDifferential_right`: δD(r,x)=−x⊗d(r̄) for x∈I.
- `relativeSymbolDifferential_surjective`: Every x⊗d(b) has a preimage D(x,lift b).
- `relativeSymbolDifferential_natural`: For a ring map f:A→A′ with f(I)⊆I′, δ′K₂(f)= (f_I⊗Ω(f̄))δ, compatibly with identities and composites.

**Checks.**

- For A=ℚ[t][ε]/ε², I=(ε), δD(ε,t)=dt≠0 under I⊗Ω_{ℚ[t]/ℤ}≅Ω_{ℚ[t]/ℤ}.
- In the same pair, δD(t,ε)=−dt; omitting the relative-order sign fails this.
- δD(aε,bε)=0 for all a,b; this does not assert D(aε,bε)=0.
- For A=𝔽₃[x,y]/(x²,y²), I=(xy), the output-only D3 guard produces the nonzero defect (1,1) described above.

*Needs:* §13.9; Mathlib `KaehlerDifferential`; Mathlib `KaehlerDifferential.D`.

### 13.11 The square-zero kernel of the differential

If I²=0 in a commutative ring A, then I⊆Jac(A), and ker δ is exactly the subgroup S generated by the symbols D(x,y), x,y∈I. Consequently K₂(A,I)/S≅I⊗_A Ω¹_{(A/I)/ℤ}. Even when 2 is invertible, S need not vanish for a general square-zero ideal. (Weibel, Exercise III.5.14(a)–(b), p. 229.)

A is commutative and I²=0. It uses the relative presentation of §13.9.

**Checks.**

- The inverse is independent of lifts and has both inverse identities.
- Square-zero does not mean the double-entry symbols vanish.
- The non-example distinguishes an arbitrary square-zero ideal from the principal dual-number ideal.

*Needs:* §13.2; §13.10; Mathlib `TrivSqZeroExt`.

### 13.12 Square-zero ideals: the simplified relations and the source's test values

Let A be a commutative ring and I an ideal with I² = 0; the test instance is A = TrivSqZeroExt R M (R commutative, M an R-module) with I = TrivSqZeroExt.kerIdeal R M, whose square is zero. Then I is contained in the Jacobson radical; every ⟨a, s⟩ with a ∈ A, s ∈ I is defined, since 1 − as has inverse 1 + as; ⟨s, a⟩ = ⟨a, s⟩⁻¹; and s ↦ ⟨a, s⟩ is additive on I, because the term ast of (D2) lies in I² = 0. So by §13.9, K₂(A, I) is generated by the ⟨a, s⟩ with a ∈ A and s ∈ I. The source's test values, all stated as exercises, are: a surjection K₂(A, I) → I ⊗_A Ω¹_{A/I}, ⟨x, r⟩ ↦ x ⊗ dr, for any ideal contained in the Jacobson radical (Ex. III.5.14(a)); for I² = 0 its kernel is generated by the ⟨x, y⟩ with x, y ∈ I (Ex. III.5.14(b)); for the dual numbers R[ε] with 1/2 ∈ R the map K₂(R[ε], ε) → Ω¹_R is an isomorphism (van der Kallen, Ex. III.5.14(c)); and K₂(ℤ/2ⁿ) ≅ K₂(ℤ/4) ≅ {±1} for n ≥ 2, on {−1, −1} = ⟨−1, −2⟩ = ⟨2, 2⟩ (Ex. III.5.13). These test the relative theory, and GeneralAlgebraicKTheory Layer 8's relative K₂ through the Keune–Loday comparison; they extend no field presentation to a general ring. (Weibel, III.5.11.1(b), p. 227; Weibel, Exercise III.5.14(a), p. 229; Weibel, Exercise III.5.14(b),(c), p. 230; Weibel, Exercise III.5.13, p. 229.)

A is a commutative ring and I ⊆ A an ideal with I² = 0 (Theorem III.5.11.1(b) needs A commutative). The test ring is Mathlib's TrivSqZeroExt R M with I = TrivSqZeroExt.kerIdeal R M, for R commutative and M an R-module with the central bimodule structure, so that TrivSqZeroExt R M is commutative.

**Checks.**

- For I = 0 the relative group is trivial.
- For s, t ∈ I, ⟨a, s⟩⟨a, t⟩ = ⟨a, s + t⟩.
- For A = ℤ/4 and I = 2ℤ/4: I² = 0 and Ω¹ of 𝔽₂ is 0, so by Ex. III.5.14(a),(b) K₂(ℤ/4, I) is generated by ⟨2, 2⟩, which maps to {−1, −1} in K₂(ℤ/4).
- For the dual numbers, K₂(ℚ[ε], ε) ≅ Ω¹ of ℚ = 0, while K₂(ℚ(t)[ε], ε) ≅ Ω¹ of ℚ(t) ≠ 0 (⟨ε, t⟩ ↦ dt), by the van der Kallen isomorphism of Ex. III.5.14(c) as cited.
- No presentation of K₂ of a general ring is claimed.

*Needs:* §13.2; §13.7; §13.9; Mathlib `TrivSqZeroExt`; Mathlib `TrivSqZeroExt.commRing`; Mathlib `TrivSqZeroExt.kerIdeal`; Mathlib `TrivSqZeroExt.kerIdeal_sq`; Mathlib `TrivSqZeroExt.isUnit_iff_isUnit_fst`; GeneralAlgebraicKTheory Layer 8.

### 13.13 Relative K₂ of dual numbers with two invertible

For a commutative ring R with 2∈Rˣ, let A=R[ε]/ε² and I=εR. The homomorphism δ induces K₂(A,I)≅Ω¹_{R/ℤ}, taking D(aε,b) to a db. The splitting A→R identifies this relative group with the kernel of K₂(A)→K₂(R); its further identification with the homotopy-fibre group is §13.8. (van der Kallen 1971, The unnumbered theorem, corollary and Example 1, p.1204; proof pp.1205–1207; Weibel, Exercise III.5.14(c), p. 229.)

R is commutative and 2 is a unit. A and I are Mathlib's DualNumber, or the equivalent TrivSqZeroExt carrier, and its augmentation ideal; the presentation is that of §13.9.

**Checks.**

- For R=ℚ[t], the class D(ε,t) corresponds to dt and is nonzero.
- For an odd finite field R, Ω_{R/ℤ}=0, hence the relative group is zero.
- For R=ℤ, the relative group is ℤ/2 rather than Ω_{ℤ/ℤ}=0 (van der Kallen 1971); the hypothesis on two cannot be omitted.

*Needs:* §13.8; §13.11; Mathlib `DualNumber`; Mathlib `DualNumber.eps_mul_eps`.

### 13.14 A detector for K₂ of ℤ/4

For A=ℤ/4, define λ on admissible pairs by λ(2,2)=λ(2,3)=λ(3,2)=1 in ℤ/2, and λ=0 on the other admissible pairs. It satisfies D1–D3 and therefore induces K₂(ℤ/4)→ℤ/2 through the local presentation. Its inverse sends 1 to g=D(3,2)={−1,−1}, giving K₂(ℤ/4)≅ℤ/2. It uses the local presentation of §13.6, including its residue-field-𝔽₂ case. (Weibel, Exercise III.5.13, p. 229.)

The ring is ℤ/4; admissibility means rs is even. The source group is the actual local Steinberg kernel via §13.6.

Provide the following API.

- `zmodFourSymbolParity`: The displayed function on (ℤ/4)² with values in ℤ/2; only admissible pairs define K₂ generators.
- `zmodFourSymbolParity_relations`: The table satisfies D1–D3 on their exact admissible domains.
- `zmodFourK2Equiv`: The induced map K₂(ℤ/4)≃ℤ/2 has inverse 1↦D(3,2).
- `zmodFourK2Equiv_generator`: The equivalence sends {−1,−1} to 1 and the zero class to 0.

**Checks.**

- λ(2,2)=1, so nilpotent double-entry symbols need not vanish.
- λ(1,2)=λ(2,1)=0, agreeing with the unit symbol involving 1.
- λ(3,2)=1 and D(3,2)={3,3}; the zero detector would miss this class.
- (1,1) is not admissible since 1−1·1=0 is not a unit; its table value is not a K₂ generator.

*Needs:* §13.2; §13.6.

### 13.15 The uniform dyadic nilpotent example

For every n≥2, reduction ℤ/2ⁿ→ℤ/4 induces an isomorphism K₂(ℤ/2ⁿ)≅K₂(ℤ/4)≅ℤ/2, sending {−1,−1} to the nonzero class. In contrast K₂(𝔽₂)=0. The argument is uniform and uses only the local presentation, the unit-symbol calculus and ClassicalArithmeticCompletion Layer 1’s explicit unit generators. (Weibel, Exercise III.5.13; III.5.10–5.11, pp. 229, 225.)

n is an integer with n≥2. Use the local presentation of §13.6; no separate dyadic computation is assumed.

**Checks.**

- Both the uniform upper bound and the reduction detector are proved.
- The order-two argument is used before concluding 2D(−2,2)=0; nilpotence alone would not justify that step.
- The exclusion n=1 is required.

*Needs:* §6.4; §6.9; §7.10; §13.2; §13.6; §13.14; ClassicalArithmeticCompletion §1.1.

### Examples

- For A = ℤ/4 the function λ with λ(2, 2) = λ(2, 3) = λ(3, 2) = 1 satisfies (D1)–(D3) and detects g = ⟨3, 2⟩ = {−1, −1}, so K₂(ℤ/4) ≅ ℤ/2, while K₂(𝔽₂) = 0.
- For R[ε]/ε² with 2 invertible, K₂(A, εR) ≅ Ω¹_{R/ℤ}, ⟨aε, b⟩ ↦ a db.

### Dependencies

Layers 2, 6, 7 and 12; GeneralAlgebraicKTheory Layer 8; KTheoryLowDegrees Layer 9 and §§13.3–13.5; ClassicalArithmeticCompletion §1.1; Mathlib `DualNumber`, `TrivSqZeroExt`, `KaehlerDifferential`.

## Layer 14: Galois symbols, Hilbert symbols and Tate’s comparison

Symbols against cohomology and class field theory: the Galois symbol of MotivicEtaleKTheory M.3 is read in Tau Ceti's Kummer map and cup product; twists are trivialised by a primitive root with the change-of-root rule; the Brauer-valued symbol is represented by the cyclic algebra A_ζ(a, b); the m-th power norm residue symbol of a local field and the quadratic Hilbert symbol are Steinberg symbols; the norm residue symbol equals ζ^{−inv(β_ζ{a, b})}; global reciprocity for symbols of a number field; Tate's comparisons through the actual localization maps; and the degree-two étale Chern class after the product-normalized comparison equals −h_F.

### 14.1 The symbol formula, read in the Kummer map and cup product

For a field F and an integer m invertible in F, the Galois symbol h_F : K₂(F)/m → H²(F, μ_m^{⊗2}) of MotivicEtaleKTheory M.3 sends {a, b} to κ(a) ∪ κ(b), the cup product of the two Kummer classes for the canonical equivariant pairing μ_m × μ_m → μ_m^{⊗2} (K-book (6.10.2) and Proposition III.6.10.3). This target identifies that cup product with the one Tau Ceti computes: κ is Tau Ceti's kummerMap F m, with values in H¹(G_F, KummerCoeff F m), and the cup is explicitCup11 at the tensor pairing KummerCoeff F m × KummerCoeff F m → μ_m^{⊗2}, which is equivariant for the diagonal action and, the modules being discrete, jointly continuous. MotivicEtaleKTheory M.3 owns the Galois symbol, its symbol formula, the cohomological Steinberg relation κ(a) ∪ κ(1 − a) = 0 that makes h_F well defined on K₂(F) through Matsumoto's presentation (the source proves it by factoring t^m − a and the projection formula), and Tate's local, global and S-integer theorems. This layer constructs none of these and proves no Tate theorem: it uses the map for a general field and identifies its formula with the Kummer map and cup product. No primitive root is chosen. (Weibel, III.6.10.2, p. 242; Weibel, III.6.10.3, p. 242.)

F is a field, m ≥ 1 is invertible in F, and a, b ∈ F^×. μ_m^{⊗2} is the twice-twisted module of MotivicEtaleKTheory M.1, a discrete G_F-module with the diagonal action; no primitive root is chosen.

**Checks.**

- h_F{a, b} is the explicit (1, 1) cup of the two Tau Ceti Kummer classes in H²(F, μ_m^{⊗2}), with no primitive root chosen.
- h_F{a, 1 − a} = 0, from MotivicEtaleKTheory M.3.
- h_F{a, b} = 0 when b ∈ (F^×)^m, because κ(b) = 0 (ker_kummerMap).

*Needs:* §7.12; MotivicEtaleKTheory M.3; MotivicEtaleKTheory M.1; Tau Ceti `TauCeti.kummerMap`; Tau Ceti `TauCeti.ker_kummerMap`; Tau Ceti `TauCeti.KummerCoeff`; Tau Ceti `TauCeti.ContCohomology.explicitCup11`; Tau Ceti `TauCeti.ContCohomology.explicitCup11_eq_neg_flip`.

**The Kummer cup formula in Mathlib and Tau Ceti.** For a field F, m≥2 invertible in F and a,b∈Fˣ, the Galois symbol h_{F,m}:K₂(F)/m→H²(F,μ_m^{⊗2}) takes {a,b} to κ_m(a)∪κ_m(b). Here κ_m(a) is the additive class corresponding to TauCeti.kummerMap, whose cocycle is g↦g(α)/α for αᵐ=a. Under MotivicEtaleKTheory M.1’s cup-compatible field comparison, h agrees with explicitCup11 for the canonical tensor pairing into MotivicEtaleKTheory M.1’s weight-two twist. (Weibel, Formula (III.6.10.2), and Proposition III.6.10.3, pp. 241, 242.)

F is a field and m≥2 is a unit in F. No primitive root is assumed in F for this tensor-valued statement.

*Checks.*

- An m-th power in either slot gives zero.
- The tensor-valued map exists without μ_m⊆F; scalar trivialization requires the extra root choice.
- For m=2 and F=ℝ, {−1,−1} maps to the nonzero quaternion class after contraction.

*Needs:* §6.19; MotivicEtaleKTheory M.3 (Galois symbol); MotivicEtaleKTheory M.1 (finite Tate twists); MotivicEtaleKTheory M.1 (étale cohomology of a field); Tau Ceti `TauCeti.kummerMap_eq_kummerCocycleClass`; Tau Ceti `TauCeti.ContCohomology.explicitCup11`; Tau Ceti `TauCeti.kummerMap_eq_one_iff`.

### 14.2 Trivialising a twist by a primitive root, and the change-of-root rule

Let F be a field, m ≥ 1 invertible in F, and μ_m^{⊗j} (j ∈ ℤ) the finite Tate twists of MotivicEtaleKTheory M.1, built on Tau Ceti's KummerCoeff F m (j = 1) with the diagonal action on tensor powers, so that G_F acts on μ_m^{⊗j} through χ^j, χ the mod-m cyclotomic character. A primitive m-th root of unity ζ ∈ F determines the trivialisation τ_ζ^{(j)} : ℤ/m → μ_m^{⊗j}, 1 ↦ ζ^{⊗j} (through the dual for j < 0). It is an isomorphism of abelian groups, and it is G_F-equivariant — an isomorphism of discrete G_F-modules — because ζ ∈ F; without a primitive root in F, μ_m and ℤ/m need not be isomorphic G_F-modules. Change of root: if ζ' = ζ^u with u ∈ (ℤ/m)^×, then τ_{ζ'}^{(j)} = τ_ζ^{(j)} ∘ (u^j ·). So a statement that passes through τ_ζ names ζ, and a composite in which τ_ζ and τ_ζ⁻¹ each enter once is independent of ζ. The twists themselves are MotivicEtaleKTheory M.1's; the trivialisation and the rule are owned here. (Weibel, III.6.10, p. 242; Weibel, III.6.10.4, p. 243.)

F is a field, m ≥ 1 is invertible in F, and ζ ∈ F is a primitive m-th root of unity wherever τ_ζ is used. μ_m^{⊗j} carries the diagonal action, i.e. the action through χ^j; it is never identified with ℤ/m without naming ζ.

Provide the following API.

- `Twist.trivialisation`: For ζ ∈ F primitive of order m and j ∈ ℤ, τ_ζ^{(j)} : ZMod m ≃+ μ_m^{⊗j}, 1 ↦ ζ^{⊗j}.
- `Twist.trivialisation_one`: τ_ζ^{(j)} 1 = ζ^{⊗j}.
- `Twist.trivialisation_zero`: τ_ζ^{(0)} is the identity of ZMod m.
- `Twist.trivialisation_equivariant`: τ_ζ^{(j)} is G_F-equivariant, ζ being in F.
- `Twist.trivialisation_pow`: τ_{ζ^u}^{(j)} = τ_ζ^{(j)} ∘ (u^j ·) for u ∈ (ZMod m)ˣ.
- `Twist.trivialisation_tensor`: τ_ζ^{(i)} ⊗ τ_ζ^{(j)} = τ_ζ^{(i+j)} under ZMod m ⊗ ZMod m ≅ ZMod m and μ_m^{⊗i} ⊗ μ_m^{⊗j} ≅ μ_m^{⊗(i+j)}.
- `Twist.trivialisation_one_eq`: τ_ζ^{(1)} is IsPrimitiveRoot.zmodEquivZPowers followed by IsPrimitiveRoot.zpowers_eq, read in KummerCoeff F m.

**Checks.**

- τ_ζ^{(0)} = id for every ζ; in particular it does not depend on ζ.
- For m = 2 the only primitive root is −1, so τ^{(j)} is canonical for every j, the case ClassFieldTheory Layer 5 uses at kummerCupPairing (−1).
- For m = 5 and ζ' = ζ²: τ_{ζ'}^{(1)} = τ_ζ^{(1)} ∘ (2 ·) and τ_{ζ'}^{(2)} = τ_ζ^{(2)} ∘ (4 ·) = τ_ζ^{(2)} ∘ (−1 ·).
- Over ℚ with m = 3, μ_3 is not isomorphic to ℤ/3 as a G_ℚ-module (H⁰(ℚ, μ_3) = 1 but H⁰(ℚ, ℤ/3) = ℤ/3), whereas μ_3^{⊗2} ≅ ℤ/3 because the mod-3 cyclotomic character takes values ±1 and its square is trivial: a twist defined with the action χ instead of χ^j fails this.

*Needs:* MotivicEtaleKTheory M.1; Tau Ceti `TauCeti.KummerCoeff`; Mathlib `ZMod`; Mathlib `modularCyclotomicCharacter`; Mathlib `IsPrimitiveRoot.zmodEquivZPowers`; Mathlib `IsPrimitiveRoot.zpowers_eq`.

### 14.3 The Brauer-valued symbol attached to a primitive root

For a field F with m invertible and a primitive m-th root of unity ζ ∈ F, the Brauer-valued symbol β_ζ : K₂(F)/m → mBr(F) is the Galois symbol h_F of §14.1 followed by H²(F, μ_m^{⊗2}) = H²(F, μ_m ⊗ μ_m) → H²(F, μ_m), induced by id ⊗ (τ_ζ^{(1)})⁻¹, and by the injection H²(G_F, μ_m) → H²(G_F, (F^s)^×) = Br(F) with image the m-torsion (K-book Example III.6.10.1). Replacing ζ by ζ^u multiplies β_ζ by u⁻¹. The source identifies β_ζ, citing Tate [198], with the m-th power norm residue symbol {α, β} ↦ [A_ζ(α, β)] of cyclic algebras (Proposition III.6.9.2, Remark III.6.10.4); the algebraic cyclic-algebra identification is that of QuadraticFormInvariants 7B; the local cohomological Artin/invariant comparison is proved in §14.8 without using that presentation. This is the 'Brauer-valued symbol' the roadmap document's Layer 14 contract exports after the change-of-root scalar. It is built in the cohomological Brauer group H²(G_F, (F^s)^×); exporting it as a class of central simple algebras (the algebraic Brauer group) uses QuadraticFormInvariants Layer 7B's crossed-product comparison of the two, and for m = 2 and ζ = −1 that layer's ι[(a, b)] = (a) ∪ (b) identifies β_{−1}{a, b} with the class of the quaternion algebra (a, b). (Weibel, III.6.10.1, p. 242; Weibel, III.6.10.4, p. 243; Weibel, III.6.9.2, p. 241.)

F is a field, m ≥ 1 invertible in F, and ζ ∈ F a primitive m-th root of unity.

Provide the following API.

- `NormResidueSymbol.brauerSymbol`: For ζ ∈ F primitive of order m, β_ζ : K₂(F) →* Multiplicative (Br F), Br F written additively, with values of order dividing m.
- `NormResidueSymbol.brauerSymbol_symbol`: β_ζ {a, b} = the image of (id ⊗ τ_ζ⁻¹)_*(κ a ∪ κ b) in Br(F).
- `NormResidueSymbol.brauerSymbol_pow_root`: β_{ζ^u} = u⁻¹ • β_ζ for u ∈ (ZMod m)ˣ.
- `NormResidueSymbol.nsmul_brauerSymbol`: m • β_ζ x = 0.
- `NormResidueSymbol.brauerSymbol_algebraic`: Under QuadraticFormInvariants 7B's isomorphism between BrauerGroup F and H²(G_F, (F^s)^×), β_ζ lands in the m-torsion of BrauerGroup F; for m = 2 and ζ = −1, β_{−1}{a, b} is the quaternion class (a, b).

**Checks.**

- β_ζ{a, 1 − a} = 0 and β_ζ{a, c^m} = 0.
- For m = 5, β_{ζ²} = 3 • β_ζ, since 2⁻¹ = 3 in ZMod 5.
- For F = ℝ, m = 2, ζ = −1: β{−1, −1} is the non-trivial element of Br(ℝ) ≅ ℤ/2, because κ(−1) generates H¹(ℤ/2, 𝔽₂) and its square generates H²(ℤ/2, 𝔽₂) (the cohomology ring is 𝔽₂[t]); and β{a, b} = 0 unless a < 0 and b < 0, positive reals being squares. Under the cited identification this is the class of the Hamilton quaternions, the cyclic algebra A_{−1}(−1, −1) of K-book Example III.6.9.
- For m = 3 and F = ℚ(μ_3), β_{ζ²} = −β_ζ, so a definition that does not name ζ cannot be well defined unless it is 0.

*Needs:* §14.1; §14.2; ProfiniteCohomology Layer 9; MotivicEtaleKTheory M.1; QuadraticFormInvariants 7B.

**Primitive-root contraction and the Brauer symbol.** Suppose μ_m⊆F and ζ∈F is primitive of order m. The trivialization τ_{ζ,j}:ℤ/m≃μ_m^{⊗j} sends 1 to ζ^{⊗j} for j≥0 and uses the dual basis for j<0. Define the bilinear Galois-equivariant contraction c_ζ:μ_m⊗_{ℤ/m}μ_m→μ_m by c_ζ(ζⁱ⊗ζʲ)=ζ^{ij}. The Brauer symbol β_ζ is h_{F,m}, followed by c_ζ on H² and the Kummer injection H²(F,μ_m)→Br(F)[m]. For u∈(ℤ/m)ˣ, τ_{ζᵘ,j}=τ_{ζ,j}∘(uʲ·), c_{ζᵘ}=u⁻¹c_ζ and β_{ζᵘ}=u⁻¹β_ζ. The scalar trivialization of the weight-two twist alone changes by u⁻²; it is different from the Brauer contraction. (Weibel, Proposition III.6.9.2; Example III.6.10.1; Remark III.6.10.4, pp. 241, 242, 243; Milne CFT, III §4, Steps 1–2, pp.111–112.)

F is a field, m≥2 invertible in F, and ζ∈F is primitive of order m. The Brauer identification with central simple algebras is QuadraticFormInvariants 7B's, not defined here.

Provide the following API.

- `rootTwistTrivialization`: The ℤ/m-linear equivalence τ_{ζ,j}, with the tensor basis in nonnegative degree and dual basis in negative degree.
- `rootCupContraction`: The tensor-factorization of ClassFieldTheory's kummerCupPairing, with c_ζ(ζⁱ⊗ζʲ)=ζ^{ij}; this is a comparison of coefficient models.
- `brauerSymbol`: The unique additive map β_ζ with value [c_ζ(κ(a)∪κ(b))] on symbols.
- `rootTwistTrivialization_change`: τ_{ζᵘ,j}=τ_{ζ,j}∘(uʲ·) for u a unit modulo m.
- `brauerSymbol_change`: β_{ζᵘ}(x)=u⁻¹β_ζ(x), with the same target Br(F)[m].
- `brauerSymbol_map`: Root-preserving field embeddings carry β_ζ to β_{fζ}; identity and composition follow on symbols.
- `brauerSymbol_quaternion`: For m=2, β_{−1}{a,b} is the quaternion Brauer class supplied by QFI 7B.

*Checks.*

- For m=5 and ζ′=ζ², β_{ζ′}=3β_ζ, whereas the scalar weight-two coordinate changes by 4.
- For m=5, c_ζ(ζ²⊗ζ³)=ζ; multiplying the roots instead gives 1 and fails bilinearity.
- Over ℚ and m=3 the tensor-valued h exists but no primitive-root scalar trivialization over ℚ is available.
- At m=2, ζ=−1, β{−1,−1} over ℝ is Hamilton’s class and has invariant 1/2.

*Needs:* §14.1; MotivicEtaleKTheory M.1 (finite Tate twists); MotivicEtaleKTheory M.1 (étale Kummer sequences); Mathlib `IsPrimitiveRoot.zmodEquivZPowers`; QuadraticFormInvariants 7B; ClassFieldTheory Layer 5.

### 14.4 The cyclic symbol algebra

For a field F with m≥2 invertible and ζ primitive of order m in F, and a,b∈Fˣ, let A_ζ(a,b) be the F-algebra generated by X,Y with Xᵐ=a, Yᵐ=b and YX=ζXY. It has basis XⁱYʲ, 0≤i,j<m, dimension m², and is central simple, hence defines a Brauer class. The algebra remains defined when F(a^{1/m}) has degree less than m; the full cyclic extension degree is not a hypothesis. (Weibel, Cyclic Algebras III.6.9, and Remark III.6.10.4, pp. 240, 243; Milne CFT, III §4, Step 1, p.111 and Step 2, p.112.)

F is a field; m≥2 is invertible; ζ∈F is primitive; a,b are units.

Provide the following API.

- `cyclicSymbolAlgebra`: The algebra with the stated basis, relations and multiplication.
- `cyclicSymbolAlgebra.lift`: A pair of elements in an F-algebra satisfying Xᵐ=a, Yᵐ=b, YX=ζXY induces a unique F-algebra map.
- `cyclicSymbolAlgebra.basis`: The m² monomials XⁱYʲ form an F-basis.
- `cyclicSymbolAlgebra.baseChange`: Root-preserving field embeddings give the canonical scalar-extension algebra isomorphism, with identity and composition laws.
- `cyclicSymbolAlgebra.split`: After adjoining an m-th root of a, the algebra is isomorphic to Mat_m of that field; an m-th root of b is unnecessary.
- `cyclicSymbolAlgebra.quaternion`: For m=2 and ζ=−1 the algebra is the quaternion algebra (a,b).

**Checks.**

- If a∈F^{×m}, A_ζ(a,b)≅Mat_m(F); treating F(a^{1/m}) as a degree-m field would fail.
- For m=2, a=b=−1 over ℝ this is Hamilton’s algebra, not a split matrix algebra.
- For m=4, a=c² with c nonsquare, A_ζ(c²,b)≅Mat₂(A_{ζ²}(c,b)); its dimension is 16, not 4.
- Over ℚ₇ with m=3 and ζ reducing to 2, A_ζ(3,7) has invariant 1/3 in the arithmetic-Frobenius normalization.

*Needs:* §14.3; QuadraticFormInvariants 7B.

### 14.5 Cyclic algebras represent the Brauer symbol

Under the hypotheses of §14.4, [A_ζ(a,b)]=β_ζ{a,b} in Br(F)[m]. Use ClassFieldTheory's h2MuToBr_cup_kummerClass and the crossed-product comparison of QuadraticFormInvariants 7B. The comparison identifies the displayed symbol algebra, including its proper-degree matrix corner, with those cyclic-class and cup maps. (Milne CFT, III §4, Step 1 and Step 2, pp.111–112; Weibel, Remark III.6.10.4, p. 243.)

F is a field with μ_m⊆F, m invertible, ζ primitive, and a,b∈Fˣ.

**Checks.**

- Check the map-level equality on each {a,b}, not an abstract isomorphism of groups.
- For m=4 and a=c², the proof reduces to the quadratic corner and does not assume degree four.
- At m=2 this agrees with brauerCohomologyEquiv_quaternionClass already implemented in current Tau Ceti.

*Needs:* §14.1; §14.3; §14.4; Tau Ceti `TauCeti.ContCohomology.explicitCup11_eq_neg_flip`; QuadraticFormInvariants 7B; ClassFieldTheory Layer 5.

### 14.6 The norm residue symbol as a symbol on K₂ of a local field

Let F be a nonarchimedean local field with μ_m ⊆ F and m invertible in F. The m-th power norm residue symbol (x, y)_F ∈ μ_m, with its bimultiplicativity, its Steinberg relation (a, 1 − a)_F = 1, its skew symmetry and its nondegeneracy on F^×/F^×m, is ClassicalArithmeticCompletion's `normResidueSymbol` (§§1.14 and 1.25), normalised by the arithmetic-Frobenius local Artin map of ClassFieldTheory Layer 6; it agrees with the K-book's construction of Example III.6.2.3 through Kummer theory, with the variable order x ↦ (x, −)_F. This target adds its factorisation through K₂: by Matsumoto's theorem (§7.12) there is a unique homomorphism `normResidueK2` : K₂(F) → μ_m with {x, y} ↦ (x, y)_F. When μ(F) = μ_m it is split surjective (Moore's theorem belongs to KTheoryFiniteLocalFields). §14.9 uses it for every F with μ_m ⊆ F. (Weibel, III.6.2.3, p. 233.)

F is a nonarchimedean local field (complete for a discrete valuation with finite residue field), μ_m ⊆ F and m is invertible in F.

Provide the following API.

- `NormResidueSymbol.normResidueK2`: The homomorphism K₂(F) → μ_m, {x, y} ↦ (x, y)_F.

**Checks.**

- (x, y^m)_F = 1 and (x, 1)_F = 1 for all x, y.
- For F = ℚ₂ (μ(ℚ₂) = {±1}, m = 2), (−1, −1)_F = −1, the source's Example III.6.2.5.
- For F = ℚ₃ (m = 2), (3, −1)_F = −1: ℚ₃(√−1) is the unramified quadratic extension, whose norms have even valuation, so 3 is not a norm from it and its reciprocity image moves √−1. The non-square 3 pairs non-trivially, as nondegeneracy requires.
- For F = ℚ₂ and m = 2 the tame symbol of (−1, −1) is 1, both entries being units, but (−1, −1)_F = −1: when the residue characteristic divides m the norm residue symbol is not a character of the tame symbol.
- For F = ℚ_p, p odd, m = 2: (r, s)_F = ε(∂(r, s)) with ε : 𝔽_p^× → {±1} the surjection and ∂ the tame symbol of §9.2 (K-book Ex. III.6.7; the inversion between the roadmap's and the source's tame symbol is invisible because ε takes values ±1).

*Needs:* §7.12; Tau Ceti `TauCeti.kummerMap`; Tau Ceti `TauCeti.KummerCoeff`; Mathlib `rootsOfUnity`; ClassFieldTheory Layer 6; ClassFieldTheory Layer 4; ProfiniteCohomology Layer 9; LocalFieldsRamification Layer 1; ClassicalArithmeticCompletion §1.14; ClassicalArithmeticCompletion §1.25.

### 14.7 The Hilbert symbol as a Steinberg symbol

For unit arguments r, s ∈ F^× and a nonarchimedean local field F in which 2 is invertible, the source's Hilbert symbol c_F(r, s) ∈ {±1}, which is +1 exactly when rx² + sy² = 1 has a solution in F, equals the Hilbert symbol hilbertSymbol r s of QuadraticFormInvariants Layer 6C (+1 exactly when s = x² − ry² is solvable), which that layer defines and proves bimultiplicative and symmetric. It satisfies c_F(r, 1 − r) = 1 (x = y = 1), so by Matsumoto's theorem it defines a Steinberg symbol K₂(F) → {±1}. For F = ℝ and r, s ∈ ℝ^×, c_ℝ is the sign symbol. The total auxiliary conicSymbol allows all field elements, but its value at (0,0) is −1 and is not governed by the strict-negative Hilbert criterion. The definition makes sense over any field of characteristic different from 2 but is not bilinear there, and no Steinberg symbol is claimed. (Weibel, III.6.2.2, p. 233; Weibel, III.6.2.5, p. 234.)

F is a nonarchimedean local field with 2 invertible; for the real comparison, F = ℝ. The Hilbert/Steinberg comparisons require unit inputs (equivalently nonzero field elements); the total conic helper is not a symbol on all field elements.

Provide the following API.

- `NormResidueSymbol.hilbertSymbol_eq_one_iff_conic`: For r, s ∈ F^×, hilbertSymbol r s = 1 ↔ ∃ x y : F, r x² + s y² = 1.
- `NormResidueSymbol.hilbertK2`: The Steinberg symbol K₂(F) → ℤˣ, {r, s} ↦ hilbertSymbol r s.
- `NormResidueSymbol.hilbertK2_symbol`: hilbertK2 {r, s} = hilbertSymbol r s.
- `NormResidueSymbol.hilbertK2_real`: For r, s ∈ ℝ^×, outside the nonarchimedean local-field hypotheses of hilbertK2, the conic symbol agrees with the real Steinberg sign: value −1 exactly when both unit entries are negative.
- `NormResidueSymbol.hilbertK2_eq_normResidueK2`: For m = 2 it equals normResidueK2.

**Checks.**

- c_{ℚ₂}(−1, −1) = −1, since x² + y² = −1 has no solution in ℚ₂ (K-book Example III.6.2.5).
- For r, s ∈ ℝ^×, c_ℝ(r, s) = −1 exactly when (r : ℝ) < 0 and (s : ℝ) < 0: it is the sign symbol of K-book Example III.6.2.1, agreeing with §12.5. Zero inputs are excluded.
- c_F(r, s) = hilbertSymbol r s (QuadraticFormInvariants 6C) for every nonarchimedean local F with 2 invertible.
- c_F(1, s) = 1 (x = 1, y = 0) and c_F(r, 1 − r) = 1 (x = y = 1).
- Over ℚ, c_ℚ(3, −1) = c_ℚ(7, −1) = c_ℚ(21, −1) = −1: clearing denominators, 3a² = b² + c², 7a² = b² + c² and 21a² = b² + c² force b and c to be divisible by 3, 7 and 3 respectively (−1 is not a square modulo 3 or 7), and then a as well. So c_ℚ(21, −1) ≠ c_ℚ(3, −1) c_ℚ(7, −1), and the local-field hypothesis cannot be dropped.
- The total helper has conicSymbol ℝ 0 0 = −1, while ¬(0 < 0 ∧ 0 < 0). Thus its strict-negative comparison cannot be extended to arbitrary real inputs; the all-real no-solution criterion would use nonpositivity.

*Needs:* §7.12; QuadraticFormInvariants 6C.

### 14.8 The norm residue symbol against the local invariant of the Kummer cup product

For a nonarchimedean local field F with m invertible, μ_m⊆F and a primitive root ζ, let β_ζ{a,b} be the Brauer image of κ(a)∪κ(b) under ζ^i⊗ζ^j↦ζ^(ij). Let e_m:(Q/Z)[m]≃Z/m send [r/m] to r. With arithmetic Frobenius and the classical symbol (a,b)_F=Artin_F(a)(b^(1/m))/b^(1/m), one has (a,b)_F=ζ^(−e_m(inv_F β_ζ{a,b})). The sign is −1 for every m; it is invisible at m=2. At m=1 both sides are 1. This is a normalization comparison, with Artin and invariant maps from ClassFieldTheory Layers 5–6 and the Galois symbol from MotivicEtaleKTheory M.3. (Milne CFT, III Proposition 3.6, p.109; III.4 Steps 2–4 and Remark 4.5, pp. 112–114; Milne CFT, III Proposition 3.6 and its proof, p. 109.)

F is a nonarchimedean local field; m≥1 is invertible in F; μ_m⊆F; ζ has order m. Artin sends a uniformizer to arithmetic Frobenius. β_ζ pairs the ordered cup κ(a)∪κ(b), and e_m is the torsion coordinate, not multiplication by m in Q/Z.

**Checks.**

- The universal exponent is −e_m(inv β_ζ), with e_m([r/m])=r.
- The Q₇ cubic test gives inv_F(β_ζ{3,7})=1/3 and (3,7)=ζ⁻¹; m=2 alone is insufficient.
- Root change cancels in the formula; m=1 and m=2 retain their earlier regressions.

*Needs:* §14.2; §14.3; §14.6; ClassFieldTheory Layer 5; ClassFieldTheory Layer 6; QuadraticFormInvariants 6E.

**The Hilbert symbol and the normalized local invariant.** Let F be a nonarchimedean local field, m≥2 invertible in F and μ_m⊆F. Write H_m(a,b)=Art_F(a)(b^{1/m})/b^{1/m} for the symbol owned by ClassicalArithmeticCompletion Layer 1, with arithmetic Frobenius. If e_m:(ℚ/ℤ)[m]≃ℤ/m takes [k/m] to k, then H_m(a,b)=ζ^{−e_m(inv_F(β_ζ{a,b}))}. Equivalently the positive invariant coordinate computes H_m(b,a). The local cohomological symbol of ClassFieldTheory Layer 5 is the positive coordinate when its trace is the normalized Brauer-invariant map. (Milne CFT, III Proposition 3.6, p.109; III §4 Step 2, p.112, Steps 3–4 and Remark 4.5, pp.112–114.)

F is a nonarchimedean local field; m is invertible in F, possibly divisible by the residue characteristic when char F=0. ζ is primitive of order m in F; local reciprocity uses arithmetic Frobenius.

*Checks.*

- e_m is a coordinate isomorphism on m-torsion; multiplication by m inside ℚ/ℤ is zero and cannot be used for it.
- The cubic test fixes the exact sign; norm-kernel equality by itself permits many unit scalars.
- At m=2 the statement agrees with current QFI hilbertSymbol_eq_cohomological.

*Needs:* §14.5; ClassicalArithmeticCompletion §1.14; ClassicalArithmeticCompletion §1.15; ClassicalArithmeticCompletion §1.25; ClassFieldTheory Layer 5; ClassFieldTheory Layer 6; QuadraticFormInvariants 6E.

### 14.9 Global reciprocity for symbols in K₂ of a number field

Let F be a number field containing μ_m, ζ ∈ F a primitive m-th root of unity and x ∈ K₂(F). For each place v let (x)_v ∈ μ_m(F) be the image of x under the local symbol of F_v: at a finite place the norm residue symbol of §14.6 (which needs only μ_m ⊆ F_v), at a real place the constant 1 symbol if m = 1 and the sign symbol if m = 2 (there are no real places if m > 2), at a complex place 1; each μ_m(F) → μ_m(F_v) is an isomorphism. Then (a) (x)_v = 1 for all but finitely many v and ∏_v (x)_v = 1: on a symbol x = {a, b} this is the m-th power Hilbert reciprocity law ∏_v (a, b)_v = 1, from ClassicalArithmeticCompletion §1.52, and for m = 2 from ClassFieldTheory Layer 14's hilbertProductFormula through QuadraticFormInvariants 6E's sign dictionary; (b) Σ_v inv_v(res_v β_ζ(x)) = 0, ClassFieldTheory Layer 10's sumLocalInv_eq_zero applied to the Brauer class β_ζ(x) of §14.3, with the real-place invariants of Layer 10; (c) under §14.8, (a) and (b) are the same statement, with ζ explicit and exponent sign −1. Layer 14 proves (c) and the passage from symbols to K₂(F) (Matsumoto); it does not prove the reciprocity laws themselves. For F = ℚ and m = 2, (a) is quadratic reciprocity in the form of K-book Ex. III.6.8. (Weibel, Exercise III.6.8, p. 244.)

F is a number field with μ_m ⊆ F, ζ ∈ F a primitive m-th root of unity, and x ∈ K₂(F). The local symbols carry the normalisation of §14.6 (arithmetic Frobenius, variable order x ↦ (x, −)_v); ClassicalArithmeticCompletion Layer 1's law is used in that normalisation or converted to it. m ≥ 1; the real local factor is 1 for m = 1 and the quadratic sign for m = 2. A real embedding cannot contain a primitive m-th root when m > 2.

**Checks.**

- (x)_v = 1 for almost all v, and ∏_v (x)_v = 1.
- For m = 2 and F = ℚ: (r, s)_∞ (r, s)_2 ∏_{p odd} (r, s)_p = +1 (K-book Ex. III.6.8), which is ClassFieldTheory Layer 14's quadratic reciprocity.
- No reciprocity law is proved here: the m-th power law is ClassicalArithmeticCompletion Layer 1's, the quadratic law is ClassFieldTheory Layer 14's, and the vanishing of the sum of invariants is Layer 10's; Layer 14 contributes the statement on K₂(F) and the compatibility (c).
- m = 1, F = ℚ, x = {−1, −1}: every factor is 1, including the real place. An unconditional quadratic real factor would incorrectly make the product −1.
- m = 2, F = ℚ, x = {−1,−1}: the real factor and the dyadic factor are each −1 and cancel; each odd-prime factor is 1. This is not the m = 1 law.
- For m = 1, every finite-place family c valued in rootsOfUnity 1 F is identically 1 and has empty multiplicative support; the conditional real product is also 1. Instantiate the whole corrected law at F = ℚ, a = b = −1.
- For F = ℚ, m = 2 and {−1,−1}, conicSymbol ℝ (−1) (−1) = −1, conicSymbol ℚ_2 (−1) (−1) = −1, and their product is 1; at odd p both entries are units and the quadratic factor is 1.

*Needs:* §7.12; §14.3; §14.6; §14.8; ClassicalArithmeticCompletion Layer 1; Mathlib `IsDedekindDomain.HeightOneSpectrum.Support.finite`; Mathlib `rootsOfUnity_one`; ClassFieldTheory Layer 14; ClassFieldTheory Layer 6; ClassFieldTheory Layer 10; ProfiniteCohomology Layer 6; ProfiniteCohomology Layer 8; QuadraticFormInvariants 6E.

**Global reciprocity in Brauer-symbol coordinates.** Let F be a number field with μ_m⊆F and m≥2. For a,b∈Fˣ, all but finitely many local β_ζ{a,b} have invariant zero, and Σ_v inv_v β_ζ{a,b}=0. Under §14.8 this is the higher Hilbert product law ∏_v H_{m,v}(a,b)=1. Every place is included: those over m, dyadic places and archimedean places. (Milne CFT, V Example 5.4, p.179; VII Theorem 8.1(b), p.221.)

F is a number field containing the primitive root ζ of order m. For m>2 such an F has no real places; for m=2 they remain in the formula.

*Checks.*

- For m=2 and a=b=−1 over ℚ the nontrivial local factors occur at 2 and ∞ and multiply to one; omitting either place fails.
- No product over only unramified finite places is substituted.
- The theorem rests on ClassicalArithmeticCompletion §1.52; it is not a second proof of reciprocity.

*Needs:* §14.8; ClassicalArithmeticCompletion §1.24; ClassicalArithmeticCompletion §1.52; ClassFieldTheory Layer 10.

### 14.10 Tate comparisons through the actual localization maps

The comparison is MotivicEtaleKTheory M.3's Galois symbol: for a local field F, a prime ℓ≠char F and r≥1, h_{F,ℓʳ} is an isomorphism; for a number field F it is an isomorphism for every prime ℓ and r≥1, including ℓ=2 with real places. For O=O_{F,S}, S finite containing all archimedean places and primes above ℓ, the Galois symbol h_O gives K₂(O)⊗ℤ_ℓ≅H²_cont(O,ℤ_ℓ(2)) and K₂(O)/ℓʳ≅H²_et(O,μ_{ℓʳ}^{⊗2}). These commute with the maps to the fraction field, enlargement of S and the actual localization residue maps. This is a transport and compatibility target; MotivicEtaleKTheory M.3 owns the arithmetic proofs. (Weibel, III.6.10, p. 241.)

Local and number-field hypotheses are kept separate. No global-function-field statement is drawn from a number-field-only source. S contains all places above ℓ; no assertion is made with noninvertible coefficients on O.

**Checks.**

- For ℚ, S={2,∞}, K₂(ℤ[1/2])/2≅ℤ/2, represented by {−1,−1}, matching the finite étale group.
- An ideal-class contribution Pic(O)/ℓʳ is not discarded when passing to the fraction field.
- An arbitrary scheme’s étale cohomology is not identified with its function-field Galois cohomology.

*Needs:* §14.1; MotivicEtaleKTheory M.3 (Tate’s theorem for local fields); MotivicEtaleKTheory M.3 (Tate’s theorem for global fields); MotivicEtaleKTheory M.3 (Tate’s theorem for S-integers); MotivicEtaleKTheory M.3 (symbol–residue compatibility); MotivicEtaleKTheory M.1 (S-integer comparison); MotivicEtaleKTheory M.1 (étale localization sequence); MotivicEtaleKTheory M.2 (degree-two localization diagram).

### 14.11 Compatibility of the Galois symbol with the degree-two Chern class

**The product-normalized étale Chern comparison.** For a field F, m≥1 invertible in F and x∈K₂^cl(F), let θ₂ be Layers 1–4’s Hurewicz comparison and θ₂♮=θ₂∘(ε·) its product normalization from §8.3, with ε∈{±1}. Then c_{2,2}(red_m(θ₂♮x))=−h_{F,m}(x mod m) in H²_et(F,μ_m^{⊗2}), read through MotivicEtaleKTheory M.1’s field comparison. For the raw Hurewicz map, the scalar is −ε. Here c_{2,2}:K₂(F;ℤ/m)→H²_et(F,μ_m^{⊗2}) is the already constructed M.8 finite étale Chern map. (Soulé, Proposition 2.2.2.3 and proof, pp.42–44.)

F is a field and m is invertible in F; m≥1. At m=1 both coefficient groups are zero. Use the exact product comparison and retained torus sign from Layers 5–8, not an assumed sign-free identification. Only the integral-reduction image in finite-coefficient K₂ is asserted; K₁(F)[m] can contribute an additional Bockstein quotient. For prime-power coefficients, apply Soulé’s multiplication formula to the two degree-one Chern classes: the coefficient at total index two is −1, and κ(a)∪κ(b) is h{a,b}. This proves the equality on symbols and hence on integral K₂ by Matsumoto. For arbitrary m use compatibility with coefficient reduction and the Chinese remainder decomposition into prime powers. No equality on the additional Bockstein quotient follows from this argument.

*Checks.*

- For ℚ₇,m=3, the {3,7} example has positive cup invariant 1/3 and product-normalized Chern invariant −1/3; m=2 would not distinguish them.
- The comparison includes composite m: in the coefficient coordinate ℤ/6, a cup value 1 gives product-normalized Chern value 5. Its reductions are 1 modulo 2 and 2 modulo 3, and the Chinese remainder map recovers 5, rather than the sign-free value 1.
- For prime-power m, Soulé’s multiplication formula gives coefficient −1 on the external product of two degree-one classes; pullback along the field multiplication gives the same −κ(a)∪κ(b). The external product and its internal pullback must both retain this coefficient.
- Changing θ₂ to its opposite changes ε, not the intrinsic product-normalized statement.
- The equality is of maps after integral reduction, not an identification of the whole finite-coefficient K₂ with K₂/m.

*Needs:* §4.1; §8.1; §8.3; §14.1; MotivicEtaleKTheory M.8 (finite étale Chern maps); MotivicEtaleKTheory M.1 (étale cohomology of a field).

### Examples

- The comparison (a, b)_F = ζ^{−e_m(inv_F β_ζ{a, b})} carries a sign −1 for every m, invisible at m = 2.
- At a real place the local symbol is the sign symbol for m = 2 and trivial otherwise; a number field containing μ_m with m > 2 has no real place.

### Dependencies

Layers 4, 7, 9, 11 and 12; MotivicEtaleKTheory M.1, M.2, MotivicEtaleKTheory M.3, M.8; ClassicalArithmeticCompletion Layer 1; ClassFieldTheory Layers 4–6, 10 and 14; QuadraticFormInvariants 6C, 6E, 7B; ProfiniteCohomology Layers 6, 8, 9; Tau Ceti `KummerCoeff`, `kummerMap`, `ContCohomology.explicitCup11`.

## Downstream consumers

- **K3BlochGroups** uses the recognition theorem and the superperfectness of St(R) (Layer 1, §3.3), the finite-rank symbols of Layer 6, and the degree-three component of the graded map (§8.4), whose injectivity and cokernel it owns.
- **StableHomotopyKTheory** uses Layer 1 for π₁ of the homotopy fibre of a plus construction.
- **GeneralAlgebraicKTheory** and **KTheoryLowDegrees** use classical K₂, the Steinberg boundary and the relative Steinberg groups (Layers 2–4 and 13) in their low-degree comparisons.
- **MotivicEtaleKTheory** uses Matsumoto's theorem (M.3), the symbol–residue compatibility (Layer 9) and the Milnor norms with Suslin reciprocity (M.4, Layer 10).
- **ArithmeticKTheory** uses the tame-kernel sequences and K₂(ℤ), K₂(ℚ) (Layer 12) and the Tate comparisons (Layer 14).
- **EllipticKTheory** and **SchemeKTheoryOperations** use tame symbols, Weil–Suslin reciprocity and the localization comparison (Layers 9–11).
- **KTheoryFiniteLocalFields** uses Matsumoto's theorem, K₂(𝔽_q) = 0, the Hilbert-symbol comparison and global reciprocity (Layers 6–7 and 14).
- **HigherLocalFieldsAndHigherClassFieldTheory** uses Milnor K-theory, residues and norms (Layers 5, 9 and 10); **SpecialValuesBirchTate** uses tame kernels (Layer 12); **KatoEulerSystems** uses symbols and their residues.

## References

- [Weibel] C. A. Weibel, *The K-book: an introduction to algebraic K-theory*, Graduate Studies in Mathematics 145, AMS, 2013; author's copy https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf (cited by theorem number and printed page; printed page = PDF page − 8).
- [Bass–Tate] H. Bass and J. Tate, The Milnor ring of a global field, in *Algebraic K-Theory II*, Lecture Notes in Mathematics 342, Springer, 1973, 349–446; public proceedings copy https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf.
- [Milnor] J. Milnor, *Introduction to Algebraic K-Theory*, Annals of Mathematics Studies 72, Princeton University Press, 1971.
- [Matsumoto] H. Matsumoto, Sur les sous-groupes arithmétiques des groupes semi-simples déployés, Ann. Sci. ÉNS (4) 2 (1969), 1–62, https://www.numdam.org/article/ASENS_1969_4_2_1_1_0.pdf.
- [Steinberg] R. Steinberg, *Lectures on Chevalley Groups*, Yale University notes, 1967.
- [Löh] C. Löh, *Group Cohomology*, lecture notes, Universität Regensburg, 2019, https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf.
- [Loday] J.-L. Loday, K-théorie algébrique et représentations de groupes, Ann. Sci. ÉNS (4) 9 (1976), 309–377, https://www.numdam.org/item/ASENS_1976_4_9_3_309_0.pdf.
- [Suslin] A. A. Suslin, Reciprocity laws and the stable rank of polynomial rings, Math. USSR Izv. 15 (1980), 589–623.
- [Gille–Szamuely] P. Gille and T. Szamuely, *Central Simple Algebras and Galois Cohomology*, Cambridge Studies in Advanced Mathematics 101, 2006.
- [Milne CFT] J. S. Milne, *Class Field Theory*, course notes, version 4.03, https://www.jmilne.org/math/CourseNotes/CFT.pdf.
- [Soulé] C. Soulé, *Groupes arithmétiques et K-théorie des anneaux d'entiers de corps de nombres*, thèse, Paris VII, 1978, https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf.
- [Dennis–Stein] R. K. Dennis and M. R. Stein, K₂ of radical ideals and semi-local rings revisited, in *Algebraic K-Theory II*, Lecture Notes in Mathematics 342, Springer, 1973, 281–303; public proceedings copy https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf.
- [van der Kallen 1977] W. van der Kallen, The K₂ of rings with many units, Ann. Sci. ÉNS (4) 10 (1977), 473–515, https://www.numdam.org/item/ASENS_1977_4_10_4_473_0.pdf.
- [van der Kallen–Maazen–Stienstra] W. van der Kallen, H. Maazen and J. Stienstra, A presentation for some K₂(n, R), Bull. AMS 81 (1975), 934–936, https://webspace.science.uu.nl/~kalle101/maazenStK.pdf.
- [Keune] F. Keune, The relativization of K₂, J. Algebra 54 (1978), 159–177, https://doi.org/10.1016/0021-8693(78)90024-8 (full proof not obtained).
- [Loday relative] J.-L. Loday, Cohomologie et groupe de Steinberg relatifs, J. Algebra 54 (1978), 178–202, https://doi.org/10.1016/0021-8693(78)90025-X (full proof not obtained).
- [Maazen–Stienstra] H. Maazen and J. Stienstra, A presentation for K₂ of split radical pairs, J. Pure Appl. Algebra 10 (1977), 271–294, https://doi.org/10.1016/0022-4049(77)90007-X (full proof not obtained).
- [van der Kallen 1971] W. van der Kallen, Le K₂ des nombres duaux, C. R. Acad. Sci. Paris 273 (1971), 1204–1207, https://webspace.science.uu.nl/~kalle101/K2nd1971Gallica.pdf.
- [Morrow] M. Morrow, K₂ of localisations of local rings, J. Algebra 399 (2014), 190–204; author preprint https://arxiv.org/abs/1205.0860 (preprint page numbers).
- [Levine] M. Levine, The indecomposable K₃ of fields, Ann. Sci. ÉNS (4) 22 (1989), 255–344.
- [Stacks] The Stacks Project, https://stacks.math.columbia.edu, cited by tag.
