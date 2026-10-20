# K₂ symbols and Brauer groups, Part II

This roadmap owns the material moved from **K2SymbolsBrauer Layer 14, “Galois symbols, Hilbert symbols and Tate’s comparison”** by the maintainer’s decision of 20 October 2026. It starts with the classical K₂ and symbol theory of base Layers 1–13, and with MotivicEtaleKTheory’s coefficient modules and degree-two arithmetic comparison. It exports the dictionaries that let those objects interact with actual Brauer algebras, local reciprocity, localization and finite Chern maps.

The original Layer 14’s full target and Check inventory is retained below. Its repeated strengthened formulations are consolidated into single targets. The general tensor-valued symbol is available over any field with an invertible coefficient. Root-dependent statements explicitly require a primitive root in that field. Arithmetic theorems distinguish local fields, number fields and global function fields. Test cases do not replace these general hypotheses.

The packet is **complete**, and KBII.1–KBII.5 are **planned**. This means every target has a prerequisite chain ending in the audited libraries, an existing roadmap target or an explicit supplier contract. It does not mean the targets have been implemented or that all supplier contracts have been discharged. All implementation statuses are unchecked. No additional mathematical gap is hidden behind a finite test case.

## Dependency order and ownership

K2SymbolsBrauer Layers 1–13 precede MotivicEtaleKTheory M.1–M.3. This Part II comes after those layers **and** the independent low-degree finite Chern branch of M.8. It supplies RefinedTraceMethods, KTheoryFiniteLocalFields, EllipticKTheory and ArithmeticKTheory where they need the former Layer 14. M.3 must not import this Part II to construct its Galois symbol or its Tate theorem. The late KU-tate2 readiness checkpoint may inspect the completed comparison; it cannot be a prerequisite for constructing it.

The M.8 branch needed here uses finite coefficients, K₁ products and low-degree Chern operations. The complete higher regulator programme and M.7’s higher comparisons are not needed for this branch. The supplier request isolates those inputs so the dependency does not circle through a consumer of this Part II.

Existing work is used with its own maps:

| Supplier | Imported contract | New contribution here |
| --- | --- | --- |
| K2SymbolsBrauer T.2; base §§4.1, 7.2, 8.1–8.3 | Classical K₂, Matsumoto equivalence, field naturality, product-normalized comparison and its torus sign | Dictionaries and comparisons using that exact normalization |
| MotivicEtaleKTheory M.1 | All finite twists, étale/Galois field comparison, Kummer and localization sequences, continuous coefficients | Primitive-root bases and adapters between coefficient models |
| MotivicEtaleKTheory M.2 | Arithmetic duality and degree-two localization diagram, including real places | Commutativity after the present transports |
| MotivicEtaleKTheory M.3 | The general Galois symbol, Steinberg relation, residue formula and Tate arithmetic proofs | Explicit Kummer cup, localization and Brauer dictionaries |
| MotivicEtaleKTheory M.8, low-degree branch | Finite Chern maps and compatibility with integral reduction and products | The signed product-normalized equality with the Galois symbol |
| GeneralAlgebraicKTheory K.7 | Integral products and the requested finite-coefficient cofiber/reduction interface | Restriction of the comparison to the integral-reduction image |
| ClassFieldTheory Layers 5, 6, 10, 14 | Coefficient pairing, normalized invariant, arithmetic Artin map, all-place Brauer sum and quadratic product law | Tensor factorization, variable-order sign, extension to K₂ classes |
| QuadraticFormInvariants 6C, 6E, 7B | Local Hilbert symbol, cohomological Hilbert dictionary, generic crossed-product/Brauer equivalence and quaternion comparison | Total conic presentation, K₂ factorization, specified degree-m algebra and proper-degree corner |
| ClassicalArithmeticCompletion CA.1, §§1.14, 1.25, 1.52 | General arithmetic norm-residue pairing and degree-m Hilbert reciprocity | Its unique factorization through K₂ and comparison with the Brauer invariant |

The issue’s legacy supplier spelling “AlgebraicKTheory” has no current standalone atlas or read-only-roadmap counterpart. The finite-coefficient interface is requested from the existing general K-theory owner, GeneralAlgebraicKTheory K.7. It is not represented by an invented roadmap ID.

The general-field Merkurjev–Suslin/norm-residue theorem remains the property of MotivicEtaleKTheory M.5. No new proof of that theorem, the Bloch–Kato machinery, generic Brauer equivalence, Hilbert-symbol construction, arithmetic reciprocity or Tate’s theorem is planned here. The symbol dictionary needs M.3’s well-defined map rather than the full general-field isomorphism. Thus the exact moved scope does not acquire unrelated motivic foundations.

## Conventions and objects

Write K₂ᶜˡ(F) additively. Through the symbol-preserving Matsumoto equivalence, {a,b} denotes its two-unit symbol. A quotient /m means the cokernel of multiplication by m. Finite-coefficient K₂(F;Z/m) is a different group, with the Bockstein sequence specified in KBII.5.

For m≥1 invertible in F, κ_m(a) is the additive H¹ class corresponding to TauCeti.kummerMap F m. Its cocycle is g↦g(α)/α for α^m=a. The general symbol has target H²(F,μ_m^{⊗2}) and pairs κ_m(a) first with κ_m(b) second. M.1’s field comparison is cup compatible. Weight one is Tau Ceti’s KummerCoeff; weight j has cyclotomic action χ^j. For j<0 use duals. Twists are not replaced by trivial modules without a named root.

When ζ∈F is primitive of order m, τ_{ζ,j}:Z/m≃μ_m^{⊗j} names its tensor/dual basis. The weight-two scalar coordinate is τ_{ζ,2}^{−1}. The Brauer contraction is instead c_ζ:μ_m⊗μ_m→μ_m, ζ^i⊗ζ^j↦ζ^{ij}. It is bilinear in additive root coordinates; root multiplication is not that pairing. β_ζ is h followed by H²(c_ζ) and the field Kummer injection into Brauer m-torsion.

For the symbol algebra the convention is X^m=a, Y^m=b, **YX=ζXY**. The generator Y implements the automorphism α↦ζα. In QFI’s crossed product, u_σx=σ(x)u_σ and u_σu_τ=c(σ,τ)u_{στ}. These conventions determine the algebra’s cup class.

Local Artin sends a uniformizer to **arithmetic Frobenius**. The classical scalar is H_m(a,b)=Art_F(a)(b^{1/m})/b^{1/m}. The positive invariant coordinate of the ordered cup computes H_m(b,a). Consequently H_m(a,b) is the **negative** coordinate of β_ζ{a,b}. At m=2 the sign cannot be detected.

The local coordinate e_m:(Q/Z)[m]≃Z/m sends [k/m] to k. It is an existing normalized-invariant coordinate, not multiplication by m in Q/Z. Current Tau Ceti’s h2MuEquivZMod and toRatAddCircle_h2MuEquivZMod characterize this normalization. We use them through the coefficient-model adapter rather than constructing another coordinate isomorphism.

For residues the base tame convention has the uniformizer on the right: ∂ᴹ{u,π}=ū. Cohomological residue satisfies ∂κ(π)=1, and hence ∂h=−κ∂ᴹ. This residue identity requires invertibility in the residue field. It cannot be used to replace dyadic or wild norm-residue symbols by tame symbols.

For products, θ₂ is the base package’s raw Hurewicz comparison, ε=−1 the computed torus sign in §§8.1–8.3, and θ₂♮=θ₂∘(ε·). It is θ₂♮ that takes the classical two-unit symbol to the ordered product of K₁ classes. The Chern formula is −h after θ₂♮; the raw θ₂ formula is −εh=+h. An older target packet retains ε as a parameter, so the newer package’s exact sign is an explicit import contract.

## Baseline and current-work audit

The baseline is Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369** and Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174**. The reviewed K2SymbolsBrauer T.7 coverage audit was read before planning. Each declaration below was read at those pins; no existence claim is based on a name search alone.

- `tauceti:TauCeti.KummerCoeff` in `TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean`: Additive m-th roots of unity in the separable closure, with the continuous discrete Galois action.
- `tauceti:TauCeti.kummerMap` in `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean`: For IsUnit (m:F), the multiplicative Kummer map to the multiplicative type tag of H¹.
- `tauceti:TauCeti.kummerMap_eq_kummerCocycleClass` in `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean`: The Kummer map is represented by g(α)/α, α^m=a.
- `tauceti:TauCeti.ker_kummerMap` in `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean`: The Kummer kernel is the m-th power subgroup.
- `tauceti:TauCeti.kummerMap_eq_one_iff` in `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean`: Kummer triviality is equivalent to being an m-th power.
- `tauceti:TauCeti.ContCohomology.explicitCup11` in `TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean`: The degree-(1,1) cup for a jointly continuous equivariant biadditive coefficient pairing.
- `tauceti:TauCeti.ContCohomology.explicitCup11_eq_neg_flip` in `TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean`: Flipping degree-one cup classes negates the class, with the flipped coefficient pairing.
- `mathlib:IsPrimitiveRoot.zmodEquivZPowers` in `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean`: A primitive order-m element identifies ZMod m with the additive type tag of its powers.
- `mathlib:IsPrimitiveRoot.zpowers_eq` in `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean`: For units in an integral domain and nonzero m, the powers of a primitive root equal rootsOfUnity m.
- `mathlib:rootsOfUnity` in `Mathlib/RingTheory/RootsOfUnity/Basic.lean`: Subgroup of units with m-th power one.

The pin has the explicit continuous Kummer and cup operations. It does not have the new classical K₂, finite twists, finite K-theory and étale Chern carriers required for most milestones in this roadmap. Their signatures stay in this document rather than introducing replacement carriers into the suggested file.

The current read-only Tau Ceti library was also inspected at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. In particular `TauCeti/NumberTheory/ClassFieldTheory/Brauer/RootsOfUnity.lean`, lines 89–105, already supplies the normalized `h2MuEquivZMod` and `toRatAddCircle_h2MuEquivZMod`. Current generic and quaternion Brauer comparisons were checked through QFI’s contract. These current declarations are existing work, but they are not misreported as baseline declarations at f790474.

The current TauCetiRoadmap tree was inspected read-only, including the nine roadmaps newer than the atlas snapshot and their suggested declarations. Relevant LocalGaloisGroups and IntegralLattices targets were checked for overlapping coefficient, local-field and symbol constructions; none supplies the new K₂ adapters here. ClassFieldTheory and LocalFieldsRamification were read as complete upstream style exemplars, and QFI 6C/6E/7B as exact supplier contracts.

## Scope conservation from the former Layer 14

| Former target | New owner | Checks retained here |
| --- | --- | --- |
| §14.1, both Kummer-cup formulations | KBII.1/galois-symbol-dictionary | Ordered explicit cup, Steinberg, m-th powers in either slot, no root over Q at m=3, real Hamilton class |
| §14.2, all integer twists | KBII.1/root-trivialization; root-change-naturality | Weight zero, m=2 uniqueness, m=5 factors 2 and 4, negative weights, Q at m=3 action χ versus χ² |
| §14.3, both Brauer/contraction formulations | KBII.1/root-contraction; brauer-symbol; root-change-naturality | Pure tensor at m=5, factor 3 versus weight-two factor 4, Steinberg/powers, real invariant 1/2, cubic root inversion, field id/composition |
| §14.4 cyclic algebra | KBII.2/symbol-algebra; central-simple; proper-degree-corner | Full m² basis, split first argument, Hamilton, degree-four quadratic corner, Q₇ cubic invariant 1/3 |
| §14.5 algebra represents β | KBII.2/cup-brauer-comparison | Actual map equality, proper-degree corner and current quaternion compatibility |
| §14.6 local norm-residue factorization | KBII.3/norm-residue-k2; norm-residue-splitting | Powers/trivial arguments, Q₂ and Q₃ values, wild non-tame example, odd-prime tame character, section for full roots of unity |
| §14.7 conic/Hilbert factorization | KBII.3/conic-symbol; hilbert-k2 | Q₂, real units, QFI equality, trivial/Steinberg witnesses, Q nonbilinearity, total zero-input and nonpositive real criterion |
| §14.8, both invariant formulations | KBII.3/arithmetic-invariant | Universal minus sign, exact e_m, cubic Q₇ test, root cancellation, m=1 and m=2, QFI cohomological theorem, norm-kernel insufficiency |
| §14.9, both reciprocity formulations | KBII.4/place-symbol; finite-support; k2-reciprocity | Every K₂ class, almost-all-one family, all places including those over m, Q quadratic law, trivial m=1 real factor, dyadic/real cancellation at m=2, empty support at m=1 |
| §14.10 Tate maps | KBII.1/residue-dictionary; KBII.5/tate-local-compatibility; tate-global-compatibility; tate-s-integer-compatibility | Actual fraction-field/S-enlargement/residue squares, ℓ=2 and real places, Q with S={2,∞}, retained Picard terms, no arbitrary-scheme generic-point identification; explicit function-field supplier extension |
| §14.11 finite Chern comparison | KBII.5/finite-coefficient-boundary; finite-chern-comparison | Product sign, Q₇ cubic and Z/6 CRT, external/internal products, raw θ sign dependence, integral-reduction image and Bockstein quotient |

The original dependency list is realized through the supplier contracts above: base localization, signs and product maps are imported with M.3’s named nodes; ProfiniteCohomology’s functorial cups and coefficient maps are imported through the existing Tau Ceti/M.1 constructions; LocalFieldsRamification’s local-field structures enter through the existing CFT and CA contracts. No duplicate generic cohomology or local-field theory is introduced.

## KBII.1: Coefficient models and Brauer symbols

The imported general Galois symbol is the starting map. The new constructions name bases and compare coefficient models. The tensor-valued map exists before a root is chosen; only the contraction and Brauer-valued export require ζ in F.

### galois-symbol-dictionary: Galois symbols in the Kummer cup API

**Target (theorem).** For every field F and m≥1 invertible in F, the imported h_{F,m}:K₂ᶜˡ(F)/m→H²_et(F,μ_m^{⊗2}), transported by the cup-compatible field comparison of M.1, takes {a,b} to explicitCup11(κ_m(a),κ_m(b)) for the canonical tensor pairing. The statement requires no root of unity in F.

**Hypotheses and models.** a,b∈Fˣ; κ is the additive class corresponding to TauCeti.kummerMap, not its multiplicative type tag.

**Construction or proof.**

1. Use M.1’s identification of weight one with KummerCoeff and its tensor pairing into weight two. Its diagonal Galois action makes this pairing equivariant and discreteness makes it jointly continuous.
2. Use kummerMap_eq_kummerCocycleClass and the supplier’s symbol formula; Matsumoto-natural transports between classical K₂ and the Milnor presentation. No well-definedness or norm-residue theorem is reproved.

**API.**

- `galoisSymbol_eq_explicitCup11` (compatibility): The displayed equality on each symbol uses the cup-compatible field comparison.

**Checks.**

- `symbol_steinberg` (compatibility): h{a,1−a}=0 whenever a and 1−a are units, by the imported Steinberg relation.
- `symbol_power_slots` (degenerate): An m-th power in either slot maps to zero, by the Kummer kernel.
- `symbol_no_root` (non-example): For F=Q,m=3 the tensor-valued map exists despite the absence of a primitive cube root in Q.
- `symbol_real` (computation): For R,m=2 the cup of κ(−1) with itself contracts to Hamilton’s nonzero class.

**Needs.** `MotivicEtaleKTheory:M.1/finite-tate-twist`, `MotivicEtaleKTheory:M.1/field-etale-galois-comparison`, `MotivicEtaleKTheory:M.3/galois-symbol`, `K2SymbolsBrauer:T.2/matsumoto-natural`, `tauceti:TauCeti.KummerCoeff`, `tauceti:TauCeti.kummerMap`, `tauceti:TauCeti.kummerMap_eq_kummerCocycleClass`, `tauceti:TauCeti.ker_kummerMap`, `tauceti:TauCeti.kummerMap_eq_one_iff`, `tauceti:TauCeti.ContCohomology.explicitCup11`, `tauceti:TauCeti.ContCohomology.explicitCup11_eq_neg_flip`.

**Sources.** [Charles A. Weibel](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.10.2–6.10.3, pp.242–243: The ordered tensor-valued cup gives the symbol map; the Steinberg argument belongs to the supplier.

**Planet.** Galois symbol dictionary. **Implementation:** unchecked.

### root-trivialization: Primitive-root trivializations

**Target (construction).** For m≥1 a unit in F, ζ∈F primitive of order m and j∈Z, construct τ_{ζ,j}:ZMod m≃μ_m^{⊗j} as an equivariant ZMod m-linear equivalence. It takes 1 to the tensor basis in positive weights, uses the dual basis in negative weights, and is the identity in weight zero.

**Hypotheses and models.** Twists and all tensor/dual coherence maps are imported from M.1; ζ belongs to F, not just its separable closure.

**Construction or proof.**

1. At weight one compose zmodEquivZPowers with zpowers_eq and the coefficient embedding into the separable closure. Triviality of the Galois action follows because ζ lies in F.
2. Take tensor powers for j>0 and duals for j<0, using M.1’s evaluation and tensor coherence maps. The inverse sends the named basis to 1. The case m=1 is the equivalence between zero modules.

**Uses.** Former §14.3 and §14.8: turn the weight-two Galois symbol into a root-dependent weight-one Brauer symbol and compare invariant coordinates. Former §14.2: keep tensor, dual and root-change maps explicit.

**API.**

- `rootTwistTrivialization` (equivalence): τ_{ζ,j} is the displayed equivariant linear equivalence.
- `rootTwistTrivialization_one` (simp): τ_{ζ,j}(1) is the tensor or dual basis.
- `rootTwistTrivialization_zero` (simp): τ_{ζ,0}=id.
- `rootTwistTrivialization_weight_one` (compatibility): Weight one agrees with the two cited Mathlib primitive-root maps.
- `rootTwistTrivialization_tensor` (compatibility): τ_{ζ,i}⊗τ_{ζ,j} agrees with τ_{ζ,i+j} under the supplier’s tensor coherence.

**Checks.**

- `triv_weight_zero` (degenerate): Every root gives id at j=0, also for m=1.
- `triv_five` (computation): At m=5, replacing ζ by ζ² multiplies weight-one coordinates by 2 and weight-two coordinates by 4=−1.
- `triv_negative` (computation): At m=5 the same change multiplies the weight −1 basis by 3, the inverse of 2.
- `triv_two` (compatibility): For m=2 the unique primitive root −1 gives the canonical CFT weight-one trivialization.
- `triv_galois_action` (non-example): Over Q, μ₃ has nontrivial Galois action and is not a trivial Z/3-module; its tensor square has trivial action. Defining every twist with χ instead of χ^j fails.

**Needs.** `MotivicEtaleKTheory:M.1/finite-tate-twist`, `tauceti:TauCeti.KummerCoeff`, `mathlib:IsPrimitiveRoot.zmodEquivZPowers`, `mathlib:IsPrimitiveRoot.zpowers_eq`.

**Sources.** [Charles A. Weibel](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.10, pp.242–243: The primitive root converts the tensor coefficient to a cyclic coefficient; the all-weight extension is the tensor/dual construction here.

**Planet.** Primitive-root trivializations. **Implementation:** unchecked.

### root-contraction: Primitive-root contraction

**Target (construction).** Construct the equivariant linear map c_ζ:μ_m⊗_{Z/m}μ_m→μ_m with c_ζ(ζ^i⊗ζ^j)=ζ^{ij}. It is id⊗τ_{ζ,1}^{−1} followed by the scalar unitor and is the tensor factorization of CFT’s existing kummerCupPairing ζ.

**Hypotheses and models.** m≥1 invertible in F; ζ∈F primitive of order m; additive coefficient notation is used for the tensor universal property.

**Construction or proof.**

1. Apply the tensor universal property to the supplier’s biadditive pairing after identifying both factors by τ. Uniqueness is tested on pure tensors.
2. Check the scalar unitor and the CFT pairing on ζ^i,ζ^j. This is a comparison of coefficient models, not a second definition of the CFT pairing.

**Uses.** Brauer-symbol construction: induce the map from weight-two H² to weight-one H². Local invariant comparison: compare the existing positive cohomological pairing with the classical variable order.

**API.**

- `rootCupContraction` (constructor): The tensor factorization c_ζ.
- `rootCupContraction_tmul` (simp): c_ζ(ζ^i⊗ζ^j)=ζ^{ij}.
- `rootCupContraction_eq_pairing` (compatibility): Precomposition with the pure tensor map equals kummerCupPairing ζ.
- `rootCupContraction_unique` (extensionality): A linear map with the same pure-tensor values equals c_ζ.

**Checks.**

- `contraction_five` (computation): For m=5, c_ζ(ζ²⊗ζ³)=ζ, whereas root multiplication gives 1.
- `contraction_unit` (degenerate): c_ζ(1⊗t)=c_ζ(t⊗1)=1 in multiplicative root notation.
- `contraction_two` (compatibility): At m=2 this is CFT’s coefficient pairing at −1.
- `contraction_change` (characterisation): c_{ζ^u}=u^{−1}c_ζ for u∈(Z/m)ˣ, which distinguishes contraction from the u^{−2} scalar weight-two coordinate.

**Needs.** `K2SymbolsBrauerPartII:KBII.1/root-trivialization`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `MotivicEtaleKTheory:M.1/finite-tate-twist`.

**Sources.** [J. S. Milne](https://www.jmilne.org/math/CourseNotes/CFTc.pdf), III.4, Steps 1–2, pp.111–112: The primitive-root pairing contracts two Kummer coefficients; the tensor factorization makes its bilinearity explicit.

**Planet.** Primitive-root contraction. **Implementation:** unchecked.

### brauer-symbol: Brauer-valued symbol

**Target (construction).** Define β_ζ:K₂ᶜˡ(F)/m→Br(F)[m] by the imported h, H²(c_ζ), and the Kummer injection H²(F,μ_m)→H²(F,G_m). Use QFI 7B’s existing Brauer/cohomology equivalence to export the same class in the algebraic Brauer group. Also export its pullback to K₂ᶜˡ(F).

**Hypotheses and models.** F any field; m≥1 invertible in F; ζ∈F primitive of order m.

**Construction or proof.**

1. Compose the three specified maps and corestrict along the Kummer exact sequence’s m-torsion image. The field case uses Pic(Spec F)=0; the scheme case does not.
2. Apply QFI’s existing comparison to the cohomological class. Prove uniqueness from the formula on Matsumoto symbols; this does not require the general-field norm-residue isomorphism.

**Uses.** Cyclic algebra comparison: identify the Brauer class of A_ζ(a,b). Tate and reciprocity comparisons: supply the actual Brauer class to localization and invariant maps.

**API.**

- `brauerSymbol` (constructor): The additive map β_ζ, with the specified m-torsion codomain.
- `brauerSymbol_symbol` (simp): Its value on {a,b} is the Kummer injection of c_ζ(κ(a)∪κ(b)).
- `brauerSymbol_torsion` (structure): mβ_ζ(x)=0.
- `brauerSymbol_algebraic` (compatibility): QFI’s Brauer comparison takes the exported algebraic class to the specified cohomological class.
- `brauerSymbol_unique` (extensionality): The symbol formula determines the homomorphism uniquely.

**Checks.**

- `brauer_steinberg` (characterisation): β{a,1−a}=0 and β{a,c^m}=0.
- `brauer_m_one` (degenerate): At m=1 the map is zero.
- `brauer_real_hamilton` (computation): Over R,m=2, β{−1,−1} is Hamilton’s class with invariant 1/2; a positive argument gives zero.
- `brauer_quaternion` (compatibility): At m=2 the map agrees with current Tau Ceti’s brauerCohomologyEquiv_quaternionClass, imported from QFI 7B.

**Needs.** `K2SymbolsBrauerPartII:KBII.1/galois-symbol-dictionary`, `K2SymbolsBrauerPartII:KBII.1/root-contraction`, `MotivicEtaleKTheory:M.1/etale-kummer-sequences`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#7b-the-comparison-with-h²`.

**Sources.** [Charles A. Weibel](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.10.1 and 6.10.4, pp.242–243: Kummer degree two identifies with Brauer m-torsion, and contracting the symbol gives the Brauer-valued map.

**Planet.** Brauer-valued symbol. **Implementation:** unchecked.

### root-change-naturality: Root change and naturality

**Target (theorem).** For u∈(Z/m)ˣ, τ_{ζ^u,j}=τ_{ζ,j}∘(u^j·), c_{ζ^u}=u^{−1}c_ζ and β_{ζ^u}=u^{−1}β_ζ. The inverse weight-two scalar coordinate changes by u^{−2}. For a field embedding f:F→E carrying ζ to fζ, res_f β_ζ(x)=β_{fζ}(K₂(f)x), with identity and composition laws.

**Hypotheses and models.** m≥1 invertible in F; ζ primitive in F; j any integer; field restriction maps and twist base-change maps are M.1’s.

**Construction or proof.**

1. Check the all-weight identity on the tensor and dual bases. On ζ^i⊗ζ^j the new contraction is ζ^{u^{−1}ij}.
2. Use the naturality of h, the Kummer injection and the coefficient comparison. Equality on symbols gives equality of K₂ maps; compose the actual field maps, not abstract identifications.

**API.**

- `rootTwistTrivialization_change` (functoriality): The displayed u^j change for all integer j.
- `brauerSymbol_change` (compatibility): β_{ζ^u}=u^{−1}β_ζ.
- `brauerSymbol_map` (functoriality): Restriction along f preserves the named root and commutes with β, including id and composition.

**Checks.**

- `root_change_five` (computation): For m=5, β_{ζ²}=3β_ζ and the weight-two inverse coordinate changes by 4.
- `root_change_three` (computation): For Q(μ₃), replacing ζ by ζ² negates β.
- `root_change_no_root` (non-example): The Q,m=3 tensor symbol cannot be supplied a primitive-root scalar trivialization over Q.

**Needs.** `K2SymbolsBrauerPartII:KBII.1/root-trivialization`, `K2SymbolsBrauerPartII:KBII.1/root-contraction`, `K2SymbolsBrauerPartII:KBII.1/brauer-symbol`.

**Sources.** [Charles A. Weibel](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.10.1–6.10.4, pp.242–243: The maps depend on the primitive root; the scalar rules here follow by checking the specified bases.

**Planet.** Root-change formulas. **Implementation:** unchecked.

### residue-dictionary: Residue and tame-symbol conventions

**Target (theorem).** For a discretely valued field F whose residue field k has m invertible, use the base-package tame symbol with ∂ᴹ{u,π}=ū and the cohomological residue with ∂κ(π)=1. Then ∂h(x)=−κ(∂ᴹx). In particular the cup of two units is unramified. This is M.3’s residue compatibility transported to the present cup and coefficient models.

**Hypotheses and models.** The twists decrease from weight two to weight one under residue; m≥1; u a valuation unit and π a uniformizer. No formula with Kummer coefficients at the residue characteristic is asserted.

**Construction or proof.**

1. Import M.3’s actual residue square. For {u,π}, the ordered cup κ(u)∪κ(π) acquires the degree-one interchange sign, giving −κ(ū).
2. For unit-unit symbols the tame value is 1. Extend by the Matsumoto presentation and the supplier’s localization sequence; coefficient-model naturality is M.1’s.

**API.**

- `galoisSymbol_residue` (compatibility): ∂h=−κ∂ᴹ in the named conventions.
- `galoisSymbol_units_unramified` (compatibility): The symbol of two valuation units has zero residue.

**Checks.**

- `residue_uniformizer_right` (characterisation): For {u,π}, the residue is −κ(ū), not +κ(ū).
- `residue_units` (degenerate): Two units give zero residue.
- `residue_char` (non-example): When m is not invertible in k this Kummer residue statement cannot be used; the wild/equal-characteristic-p supplier is separate.

**Needs.** `K2SymbolsBrauerPartII:KBII.1/galois-symbol-dictionary`, `MotivicEtaleKTheory:M.3/symbol-residue-compatibility`.

**Sources.** [John Tate](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), §3, diagram (3.3) and Lemma 3.2, pp.263–264: Norm/restriction and coefficient compatibility are map-level ingredients. [Charles A. Weibel](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.10.2–6.10.3, pp.242–243: The tensor-valued symbol uses the ordered cup; the tame convention is fixed by the base package.

**Planet.** Symbol residue dictionary. **Implementation:** unchecked.

## KBII.2: Cyclic symbol algebras

A radical polynomial need not be irreducible. The finite free monomial construction and explicit splitting representation keep the algebra degree m in every case. The matrix corner then relates the reducible presentation to QFI’s existing field crossed product.

### symbol-algebra: Cyclic symbol algebra

**Target (construction).** For a,b∈Fˣ, m≥2 invertible in F and ζ∈F primitive of order m, construct the F-algebra A_ζ(a,b) with basis e_{i,j}=X^iY^j, 0≤i,j<m, and relations X^m=a, Y^m=b, YX=ζXY. Products use ζ^{jk} and the a,b carry factors when reducing e_{i,j}e_{k,l}. No degree-m field extension is required.

**Hypotheses and models.** F any field with the specified root and invertible coefficient; the monomial carrier is finite-dimensional, not an assumed cyclic field crossed product.

**Construction or proof.**

1. Define the twisted multiplication on the finite free F-module with the displayed basis. The scalar is ζ^{jk}a^{⌊(i+k)/m⌋}b^{⌊(j+l)/m⌋}. The carry identities and ζ^m=1 prove associativity and the unit formula.
2. Define X=e_{1,0},Y=e_{0,1}. The monomial relations give the universal map into any F-algebra containing a pair satisfying the three relations; reduction to normal form proves uniqueness.
3. Root-preserving scalar extension sends basis elements to the identically indexed basis. Prove its inverse, identity and composition on basis vectors.

**Uses.** Former §14.4 and §14.5: represent the Brauer symbol even when t^m−a is reducible. RefinedTraceMethods, KTheoryFiniteLocalFields and EllipticKTheory: provide an actual central simple algebra with a fixed root convention.

**API.**

- `cyclicSymbolAlgebra` (constructor): The finite free F-algebra A_ζ(a,b).
- `cyclicSymbolAlgebra_basis` (structure): The m² monomials form a basis; finrank=m².
- `cyclicSymbolAlgebra_relations` (relation): X^m=a, Y^m=b, YX=ζXY.
- `cyclicSymbolAlgebra_lift` (universal-property): A pair satisfying the three relations gives a unique F-algebra map.
- `cyclicSymbolAlgebra_baseChange` (functoriality): Scalar extension along a root-preserving field embedding has the canonical basis-preserving algebra equivalence, with id and composition.

**Checks.**

- `algebra_quaternion` (compatibility): For m=2,ζ=−1, the universal maps give the existing quaternion algebra (a,b).
- `algebra_reducible` (non-example): For a=c^m the algebra still has dimension m²; the radical field F(c) has degree 1 and is not its defining carrier.
- `algebra_four` (computation): At m=4 and a=c² the algebra has dimension 16, not the dimension 4 of its eventual quadratic corner.
- `algebra_relation_order` (characterisation): The multiplication yields YX=ζXY; using ζ^{il} in place of ζ^{jk} yields the opposite convention.

**Needs.** `K2SymbolsBrauerPartII:KBII.1/root-trivialization`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#7b-the-comparison-with-h²`.

**Sources.** [Charles A. Weibel](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.9, pp.240–241: The cyclic symbol algebra is given by these generator relations; the construction here retains reducible radical polynomials.

**Planet.** Cyclic symbol algebra. **Implementation:** unchecked.

### central-simple: Central simplicity of symbol algebras

**Target (theorem).** A_ζ(a,b) is central simple of degree m. After any field extension L/F with α^m=a it has a specified L-algebra isomorphism with Mat_m(L), requiring no m-th root of b.

**Hypotheses and models.** The hypotheses of the symbol-algebra construction; α∈Lˣ and L/F a field extension.

**Construction or proof.**

1. On L^m let X be diagonal with entries αζ^{−i} and Y the forward cyclic shift with wrap scalar b. Verify YX=ζXY and Y^m=b, including the wrap index.
2. The distinct X eigenvalues give all diagonal matrix idempotents; shifts generate every matrix unit, so the universal map is surjective. Both sides have dimension m², hence it is an isomorphism.
3. Faithfully flat descent from the splitting field proves simplicity and identifies the center with F. Export the existing Brauer carrier through QFI, rather than introducing another class group.

**API.**

- `cyclicSymbolAlgebra_isCentralSimple` (structure): The symbol algebra is central simple of degree m.
- `cyclicSymbolAlgebra_split` (equivalence): The specified root-of-a extension gives an isomorphism with Mat_m(L).

**Checks.**

- `algebra_split_first_slot` (degenerate): If a∈F^{×m}, the isomorphism is already over F.
- `algebra_hamilton` (computation): Over R at m=2,a=b=−1 it is Hamilton’s nonsplit algebra, so a splitting field cannot be omitted.
- `algebra_second_root` (non-example): The construction works with α^m=a over L and b not an m-th power in L.

**Needs.** `K2SymbolsBrauerPartII:KBII.2/symbol-algebra`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#7b-the-comparison-with-h²`.

**Sources.** [Charles A. Weibel](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.9 and Lemma 6.9.1, pp.240–241: Use the split symbol algebra, with the full-degree minimal polynomial justified by the basis. The general lemma as printed in the author copy needs correction E1.

**Planet.** Central simplicity. **Implementation:** unchecked.

### proper-degree-corner: Proper-degree matrix corner

**Target (theorem).** Let α^m=a, d=[F(α):F] and s=m/d. Then d divides m, c=α^d lies in F, c^s=a, and A_ζ(a,b)≃Mat_s(A_{ζ^s}(c,b)). The d=1 corner is F, with the evident trivial degree-one convention. This is an algebra equivalence after the specified root choice, and hence equality of Brauer classes.

**Hypotheses and models.** The symbol-algebra hypotheses and α in a separable closure. Root containment makes F(α)/F cyclic of degree d, with image the order-d subgroup of μ_m.

**Construction or proof.**

1. The étale subalgebra E=F[X]/(X^m−a) has s field factors of degree d; the polynomials X^d−cζ^{rd}, 0≤r<s, give these factors.
2. Conjugation by Y cycles their primitive idempotents transitively. Choose the factor X^d=c. Its corner is generated by X and Y^s, has degree d, satisfies X^d=c,(Y^s)^d=b and Y^sX=ζ^sXY^s.
3. Use the conjugate idempotents and invertible Y to construct matrix units. The corner basis and dimension identify it with the degree-d symbol algebra. The resulting matrix equivalence is compatible with its inclusion into the original algebra.

**Checks.**

- `corner_four_two` (computation): For m=4,a=c²,c nonsquare, obtain Mat₂(A_{ζ²}(c,b)); dimensions are 16 and 4 respectively.
- `corner_split` (degenerate): For d=1 obtain Mat_m(F).
- `corner_full` (degenerate): For d=m, the corner theorem is the identity presentation.
- `corner_no_degree_assumption` (non-example): A proof that assumes t^m−a irreducible cannot discharge the m=4,a=c² test.

**Needs.** `K2SymbolsBrauerPartII:KBII.2/symbol-algebra`, `K2SymbolsBrauerPartII:KBII.2/central-simple`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#7b-the-comparison-with-h²`.

**Sources.** [Charles A. Weibel](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.9, pp.240–241; III.6.10.4, p.243: The Brauer-symbol identification must apply without full radical degree; the étale-idempotent corner proof supplies that step.

**Planet.** Proper-degree matrix corner. **Implementation:** unchecked.

### cup-brauer-comparison: Cyclic algebra and cup comparison

**Target (theorem).** Under QFI 7B’s specified algebraic/cohomological Brauer equivalence, [A_ζ(a,b)]=β_ζ{a,b}. This equality uses the ordered cup κ(a)∪κ(b) and YX=ζXY and holds for every a,b∈Fˣ, including proper radical degree.

**Hypotheses and models.** F any field; m≥2 invertible; ζ primitive in F. At m=2 compare with the already implemented quaternion theorem.

**Construction or proof.**

1. In the full-degree case put L=F(α), α^m=a and σ(α)=ζα. QFI’s crossed-product convention sends the carry cocycle d(g,h)=b^{⌊(i(g)+i(h))/m⌋} to the algebra with YX=ζXY.
2. Choose β^m=b and write κ(a)(g)=ζ^{i(g)}, κ(b)(g)=ζ^{j(g)}. The 1-cochain f(g)=β^{i(g)} has δf=d(g,h)ζ^{j(g)i(h)}. Thus [d]=−[κ(b)∪κ(a)]=[κ(a)∪κ(b)] after contraction, using the pinned explicitCup11_eq_neg_flip.
3. For d<m use the proper-degree matrix corner and the same cocycle with i(g) in the order-d subgroup; scalar carry is b. This is also β_ζ{a,b}, because the α-cocycle is ζ^{s i_d(g)} and contraction gives (ζ^s)^{i_d(g)j(g)}. Do not assume an irreducible degree-m radical extension.
4. Use QFI’s generic crossed-product comparison. On local fields also identify this map with CFT’s cup-to-Brauer map. Verify agreement with the current quaternion comparison at m=2.

**API.**

- `cyclicSymbolAlgebra_brauerClass` (compatibility): The displayed equality in Br(F)[m].
- `brauerSymbol_quaternion` (compatibility): At m=2 the equality is the existing QFI quaternion comparison.

**Checks.**

- `cup_algebra_cubic` (computation): For Q₇,m=3,ζ reducing to 2, the class of A_ζ(3,7) and β_ζ{3,7} each have invariant 1/3.
- `cup_algebra_corner` (compatibility): For m=4,a=c² the proof agrees with the quadratic matrix corner.
- `cup_algebra_map` (characterisation): Equality holds on each ordered symbol under the specified Brauer comparison, not just by comparing group orders.

**Needs.** `K2SymbolsBrauerPartII:KBII.1/brauer-symbol`, `K2SymbolsBrauerPartII:KBII.2/proper-degree-corner`, `tauceti:TauCeti.ContCohomology.explicitCup11_eq_neg_flip`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#7b-the-comparison-with-h²`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

**Sources.** [Charles A. Weibel](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.9.2 and Remark III.6.10.4, pp.241,243: The cyclic algebra represents the contracted Galois symbol. [J. S. Milne](https://www.jmilne.org/math/CourseNotes/CFTc.pdf), III.4, Steps 1–2, pp.111–112: Relate the primitive-root cup to cyclic classes, while explicitly fixing the generator and variable convention.

**Planet.** Symbol algebra comparison. **Implementation:** unchecked.

## KBII.3: Local norm-residue and Hilbert symbols

The scalar arithmetic pairing and quadratic Hilbert pairing already have owners. Their factorization through K₂ and their exact comparison with β are the targets here. The conic helper is total, while its local bilinear restriction has unit inputs.

### norm-residue-k2: Norm-residue map on K₂

**Target (construction).** For a nonarchimedean local field F, m≥1 invertible in F and μ_m⊆F, construct the unique homomorphism N_{F,m}:K₂ᶜˡ(F)→μ_m(F) taking {a,b} to the supplier’s H_m(a,b)=Art_F(a)(b^{1/m})/b^{1/m}. The Artin map sends a uniformizer to arithmetic Frobenius.

**Hypotheses and models.** F is complete discretely valued with finite residue field. In characteristic zero, m may be divisible by the residue characteristic. No primitive root is required to define N.

**Construction or proof.**

1. Import ClassicalArithmeticCompletion §§1.14 and 1.25: the scalar symbol, root-choice independence, bilinearity, skew symmetry, Steinberg relation and perfect pairing on Fˣ/F^{×m}.
2. Apply the Matsumoto universal property and equivalence from K2SymbolsBrauer T.2. Uniqueness follows from symbol generation; m-th powers in either slot give the identity.

**Uses.** Former §14.8–§14.9: compare local norm symbols with Brauer invariants and assemble the global family. KTheoryFiniteLocalFields: supply its symbol map without assuming its Moore-theorem conclusion.

**API.**

- `normResidueK2` (constructor): The homomorphism N_{F,m}.
- `normResidueK2_symbol` (simp): N{a,b}=H_m(a,b) with Artin acting in the first slot.
- `normResidueK2_unique` (extensionality): Agreement on all symbols determines the map.
- `normResidueK2_mod` (structure): The map factors through K₂(F)/m.
- `normResidueK2_power` (simp): N{a,b^m}=N{a,1}=1.

**Checks.**

- `norm_q2` (computation): For Q₂,m=2, N{−1,−1}=−1.
- `norm_q3` (computation): For Q₃,m=2, N{3,−1}=−1: the quadratic extension by √−1 is unramified and its norms have even valuation.
- `norm_tame_wild` (non-example): For Q₂,m=2 the tame symbol of {−1,−1} is 1, but N is −1; N does not factor through the tame symbol.
- `norm_tame_odd` (compatibility): For Q_p,p odd,m=2, N is the quadratic residue character of the base tame symbol. Inversion of the tame convention is invisible at exponent two.
- `norm_m_one` (degenerate): For m=1 all values are 1.

**Needs.** `K2SymbolsBrauer:T.2/matsumoto-equivalence`, `ClassicalArithmeticCompletion:CA.1`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`, `mathlib:rootsOfUnity`.

**Sources.** [Charles A. Weibel](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.2.3 and 6.2.5, pp.233–234: The norm-residue scalar symbol is a Steinberg symbol and is nontrivial in the dyadic example. [J. S. Milne](https://www.jmilne.org/math/CourseNotes/CFTc.pdf), III.3, Proposition 3.6 and Lemma 3.7, p.109; III.4, p.114: The arithmetic reciprocity convention and variable order determine its normalization.

**Planet.** Norm-residue map on K₂. **Implementation:** unchecked.

### norm-residue-splitting: Splitting at the full roots of unity

**Target (theorem).** If the complete group μ(F) of roots of unity equals μ_m(F), then normResidueK2 is split surjective. More precisely choose ζ primitive of order m and a∈Fˣ with H_m(ζ,a)=ζ. The map ζ^i↦i{ζ,a} is a section μ_m→K₂ᶜˡ(F).

**Hypotheses and models.** The hypotheses of norm-residue-k2 and the additional equality μ(F)=μ_m(F). This is not Moore’s theorem about the whole kernel.

**Construction or proof.**

1. The class of ζ has order m in Fˣ/F^{×m}: if t^m=ζ^e then t^{m²}=1, so t∈μ(F)=μ_m and hence ζ^e=t^m=1. Thus m divides e.
2. Perfectness of the supplier’s finite norm-residue pairing gives a character of exact order m on the ζ class, hence some a whose value H_m(ζ,a) is primitive. Replace a by a suitable unit exponent to make the value exactly ζ.
3. Bilinearity gives m{ζ,a}={ζ^m,a}=0, so the displayed section is well defined. Its composite with N is id. This repairs the primitive-value step noted in E3 and uses no downstream Moore theorem.

**Checks.**

- `split_q2` (computation): For Q₂, μ(F)=μ₂; {−1,−1} gives the section of the quadratic norm map.
- `split_order` (characterisation): The chosen {ζ,a} has order exactly m, since its image has order m and it is killed by m.
- `split_weak_value` (non-example): For composite m, a nonidentity norm-symbol value need not generate μ_m; the proof requires order m.
- `split_not_moore` (non-example): The section does not identify the entire kernel with a divisible group; that is the downstream Moore target.

**Needs.** `K2SymbolsBrauerPartII:KBII.3/norm-residue-k2`, `K2SymbolsBrauerPartII:KBII.1/root-trivialization`.

**Sources.** [Charles A. Weibel](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.2.3, p.233: The split-surjectivity assertion is retained; the proof must choose a primitive value, not merely a nonidentity one.

**Planet.** Norm-residue splitting. **Implementation:** unchecked.

### conic-symbol: Total conic-solvability symbol

**Target (definition).** For any field F and r,s∈F, define conicSymbol F r s∈Zˣ to be 1 if ∃x,y∈F, rx²+sy²=1, and −1 otherwise. This is a total solvability sign. For unit inputs and char F≠2 it is 1 exactly when s=x²−ry² has a solution. Bilinearity is asserted only after the local-field or real restriction.

**Hypotheses and models.** The total definition works in every characteristic. The norm-equation bridge uses r,s∈Fˣ and char F≠2. The local comparison uses the supplier’s local hypotheses.

**Construction or proof.**

1. Define the value by decidable classical existence on the existing field carrier; no conic scheme or new Hilbert-symbol carrier is needed.
2. If a conic solution has y≠0 divide by y² to obtain the norm equation. If y=0 then r is a square and the split norm form represents every s in characteristic not two. For the reverse implication divide by a nonzero norm-coordinate; handle its zero case by the split difference-of-squares form.
3. Over R, no solution is equivalent to r≤0 and s≤0; if either is positive choose its inverse square root and set the other variable to zero. This includes the zero cases.

**Uses.** Former §14.7: compare the conic presentation with the imported Hilbert symbol without extending local bilinearity to arbitrary fields. Suggested Lean file: state the total real criterion and the rational nonbilinearity regression on pinned carriers.

**API.**

- `conicSymbol` (data): The total sign with the displayed existence criterion.
- `conicSymbol_eq_one_iff` (characterisation): Value 1 iff the displayed conic has an F-point in affine coordinates.
- `conicSymbol_symm` (simp): Swapping r and s preserves the value.
- `conicSymbol_eq_one_iff_norm` (compatibility): For r,s units and 2≠0, value 1 iff s=x²−ry².
- `conicSymbol_one_left` (simp): conicSymbol F 1 s=1.
- `conicSymbol_steinberg` (simp): conicSymbol F r (1−r)=1.
- `conicSymbol_real_eq_neg_one_iff` (characterisation): For all real r,s, value −1 iff r≤0 and s≤0.

**Checks.**

- `conic_zero` (degenerate): conicSymbol R 0 0=−1; the strict-negative criterion for unit Hilbert symbols cannot be applied here.
- `conic_real_units` (computation): For nonzero real r,s, value −1 iff both are negative.
- `conic_q2` (computation): conicSymbol Q₂ (−1) (−1)=−1.
- `conic_supplier` (compatibility): On units of a nonarchimedean local F with 2 invertible, conicSymbol equals QFI’s existing hilbertSymbol.
- `conic_q_nonbilinear` (non-example): Over Q, the values at (3,−1),(7,−1),(21,−1) are all −1, so the function is not multiplicative. Descent modulo 3 or 7 proves nonsolvability.
- `conic_trivial` (degenerate): The values at (1,s) and (r,1−r) are 1, witnessed by (1,0) and (1,1).

**Needs.** `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.

**Sources.** [Charles A. Weibel](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.2.2 and 6.2.5, pp.233–234: The conic formulation yields the local Hilbert sign; the total definition needs its own zero-input behavior.

**Planet.** Conic-solvability symbol. **Implementation:** unchecked.

### hilbert-k2: Quadratic Hilbert map on K₂

**Target (construction).** For a nonarchimedean local field F with 2 invertible, factor the existing QFI hilbertSymbol:Fˣ×Fˣ→Zˣ through K₂ᶜˡ(F). Its value on {r,s} equals conicSymbol F r s. For F=R construct the separate real sign factorization. In the nonarchimedean case the map agrees with normResidueK2 at m=2 under μ₂≃Zˣ.

**Hypotheses and models.** Unit arguments in every symbol formula. The real construction is stated separately from the nonarchimedean local-field instance.

**Construction or proof.**

1. Import QFI’s norm-equation characterization, symmetry and bilinearity. The conic bridge transfers the Steinberg witness (1,1) for r,1−r.
2. Use Matsumoto’s universal property for both the local Hilbert pairing and the real sign pairing. Compare m=2 with the arithmetic norm-residue symbol through the supplier’s norm criterion, or equivalently the existing cohomological Hilbert theorem.

**Uses.** Global local-factor family: provide the real m=2 factor. Quadratic reciprocity transport: identify conic, norm-residue and cohomological signs.

**API.**

- `hilbertSymbol_eq_one_iff_conic` (compatibility): For units, the supplier’s Hilbert symbol is 1 iff the conic is solvable.
- `hilbertK2` (constructor): The local homomorphism K₂(F)→Zˣ.
- `hilbertK2_symbol` (simp): hilbertK2{r,s}=hilbertSymbol r s=conicSymbol F r s.
- `hilbertK2_real` (constructor): The separate real homomorphism, with value −1 exactly for two negative unit arguments.
- `hilbertK2_eq_normResidueK2` (compatibility): At m=2 the homomorphisms agree under μ₂≃Zˣ.
- `hilbertK2_unique` (extensionality): The prescribed symbol values determine the maps.

**Checks.**

- `hilbert_q2` (computation): hilbertK2{−1,−1}=−1 over Q₂.
- `hilbert_real` (compatibility): The real map is the base package’s sign symbol, with both entries nonzero.
- `hilbert_zero_exclusion` (non-example): The total value at (0,0) is not a Hilbert-symbol value on Fˣ.
- `hilbert_steinberg` (degenerate): For r,1−r units, the value is 1.

**Needs.** `K2SymbolsBrauerPartII:KBII.3/conic-symbol`, `K2SymbolsBrauerPartII:KBII.3/norm-residue-k2`, `K2SymbolsBrauer:T.2/matsumoto-equivalence`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6e-the-two-hasse-invariants-agree-and-both-are-the-invariant-map`.

**Sources.** [Charles A. Weibel](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.2.1–6.2.2, p.233; III.6.2.5, p.234: The real sign and local conic Hilbert pairing give Steinberg symbols.

**Planet.** Hilbert map on K₂. **Implementation:** unchecked.

### arithmetic-invariant: Arithmetic invariant comparison

**Target (theorem).** For every nonarchimedean local field F, m≥1 invertible in F, μ_m⊆F and primitive ζ∈F, H_m(a,b)=ζ^{−e_m(inv_F β_ζ{a,b})}, where e_m:(Q/Z)[m]≃Z/m is characterized by e_m([k/m])=k. Equivalently the positive coordinate computes H_m(b,a). The same equality holds as homomorphisms on K₂(F).

**Hypotheses and models.** Artin uses arithmetic Frobenius. e_m and the normalized Brauer invariant are imported from CFT; multiplication by m in Q/Z is zero and is not e_m. Residue-characteristic divisors of m are permitted when char F=0.

**Construction or proof.**

1. Use CFT’s normalized degree-two coordinate and its cup-to-Brauer theorem. Milne III Proposition 3.6 evaluates a character against Artin; III.4 identifies the positive contracted cup coordinate with Art_F(b)(a^{1/m})/a^{1/m}.
2. Skew symmetry of the supplier’s arithmetic symbol changes this to the inverse of H_m(a,b). With the fixed order κ(a)∪κ(b), the exponent is therefore negative for all m.
3. Root change multiplies β by u^{−1} and replaces ζ by ζ^u, so the final expression is unchanged. Extend from symbols by Matsumoto generation.

**API.**

- `normResidueK2_eq_neg_invariant` (compatibility): The displayed identity of homomorphisms, with ζ explicit.
- `normResidueSymbol_eq_positive_invariant_flip` (compatibility): The positive coordinate computes H_m(b,a).

**Checks.**

- `invariant_cubic` (computation): For Q₇,m=3,ζ reducing to 2, inv β{3,7}=1/3, H₃(3,7)=ζ^{−1} and H₃(7,3)=ζ.
- `invariant_root_change` (compatibility): The expression remains the same under ζ↦ζ^u, β↦u^{−1}β.
- `invariant_small_m` (degenerate): At m=1 both sides are 1; at m=2 the minus sign is invisible and the result is QFI’s existing cohomological Hilbert comparison.
- `invariant_coordinate` (non-example): Replacing e_m by multiplication by m in Q/Z would make every value trivial; equality of norm kernels alone also fails to determine the scalar.

**Needs.** `K2SymbolsBrauerPartII:KBII.1/root-change-naturality`, `K2SymbolsBrauerPartII:KBII.2/cup-brauer-comparison`, `K2SymbolsBrauerPartII:KBII.3/norm-residue-k2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6e-the-two-hasse-invariants-agree-and-both-are-the-invariant-map`.

**Sources.** [J. S. Milne](https://www.jmilne.org/math/CourseNotes/CFTc.pdf), III.3, Proposition 3.6, p.109; III.4 Steps 2–4 and Remark 4.5, pp.112–114: The positive invariant of the ordered cup evaluates Artin in the opposite variable order.

**Planet.** Arithmetic invariant formula. **Implementation:** unchecked.

## KBII.4: All-place reciprocity on K₂

Every local value must be put in one global root group before the product is meaningful. Separate m=1, the real quadratic factor and complex triviality, then extend the existing reciprocity law from symbols to every K₂ class.

### place-symbol: Local factors on global K₂

**Target (construction).** For a number field F containing μ_m, m≥1, construct for each place v a homomorphism λ_{v,m}:K₂ᶜˡ(F)→μ_m(F). At finite places it is restriction to F_v followed by N_{F_v,m}. At complex places it is 1. At real places it is 1 for m=1 and the real Hilbert sign for m=2. For m>2 there are no real places. The completion embedding identifies μ_m(F) with μ_m(F_v), and this identification is inverted to put every value in one target.

**Hypotheses and models.** F a number field; a primitive root ζ∈F may be named for comparisons but is not needed for the factor family. Every finite and archimedean place is included.

**Construction or proof.**

1. Use the functorial classical K₂ maps and the appropriate local homomorphism. Root containment and separability give exactly m roots globally and in each completion, so the root map is an isomorphism.
2. A real field has primitive roots only for m=1,2. Use these two cases explicitly and the trivial complex factor. Check each local formula on symbols and retain the completion maps in the Brauer comparison.

**Uses.** Reciprocity on all K₂ classes: take a finite product of these factors. Former §14.9: retain the m=1 and real m=2 cases separately.

**API.**

- `placeNormResidueK2` (constructor): The local-factor homomorphism λ_{v,m} with common global root target.
- `placeNormResidueK2_finite` (simp): The finite factor is the completion pullback of N_{F_v,m}.
- `placeNormResidueK2_real` (simp): The real factor is trivial at m=1 and the sign at m=2.
- `placeNormResidueK2_complex` (simp): The complex factor is 1.
- `placeNormResidueK2_symbol` (compatibility): On {a,b}, obtain ClassicalArithmeticCompletion’s local scalar factors, with the prescribed Artin normalization.

**Checks.**

- `place_m_one` (degenerate): For Q,m=1,x={−1,−1}, every factor including the real one is 1.
- `place_q_two` (computation): For Q,m=2,x={−1,−1}, the factors at 2 and ∞ are −1 and the odd-prime factors are 1.
- `place_no_real_higher` (non-example): For m>2 root containment prevents real places; no quadratic real sign is inserted.
- `place_coefficient_transport` (compatibility): Transporting a global root into F_v and back is the identity; every local value lies in the same μ_m(F).

**Needs.** `K2SymbolsBrauerPartII:KBII.3/norm-residue-k2`, `K2SymbolsBrauerPartII:KBII.3/hilbert-k2`, `K2SymbolsBrauer:T.2/matsumoto-natural`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`.

**Sources.** [J. S. Milne](https://www.jmilne.org/math/CourseNotes/CFTc.pdf), V.5, Proposition 5.2, p.178; Example 5.4, p.179: The local norm-residue factors are indexed by every place, with archimedean conventions.

**Planet.** Local factors on K₂. **Implementation:** unchecked.

### finite-support: Finite support of local factors

**Target (theorem).** For every x∈K₂ᶜˡ(F), the set of places with λ_{v,m}(x)≠1 is finite. Likewise res_v β_ζ(x) has nonzero invariant at only finitely many places. These supports agree under the local arithmetic invariant formula, with its real and complex conventions.

**Hypotheses and models.** F number field containing μ_m; m≥1; ζ primitive when β is used.

**Construction or proof.**

1. For a symbol {a,b}, only finitely many finite places divide a or b or m. Away from these, both entries are valuation units and the prime-to-residue-characteristic local symbol is unramified and trivial. Alternatively use the supplier’s scalar finite-support theorem.
2. Every K₂ class is a finite sum of symbols by Matsumoto; the union of the resulting finite supports and the finite archimedean set is finite.
3. The local invariant comparison identifies support at finite places; the real Brauer invariant is 0 or 1/2 and the m=2 sign gives the same support. The remaining archimedean factors are trivial.

**Checks.**

- `support_m_one` (degenerate): At m=1 every factor family has empty multiplicative support.
- `support_q_hamilton` (computation): For Q,m=2,{−1,−1}, the nontrivial support is exactly {2,∞}.
- `support_bad_places` (non-example): The support estimate does not remove dyadic places or the places above m.
- `support_sum` (compatibility): For x+y the nontrivial support is contained in the union of the two supports.

**Needs.** `K2SymbolsBrauerPartII:KBII.4/place-symbol`, `K2SymbolsBrauerPartII:KBII.3/arithmetic-invariant`, `ClassicalArithmeticCompletion:CA.1/hilbert-product-formula-of-degree-n`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`.

**Sources.** [J. S. Milne](https://www.jmilne.org/math/CourseNotes/CFTc.pdf), V.5, Proposition 5.2, p.178; VII.8.1, p.221: The reciprocity families have finite support, including the Brauer-invariant family.

**Planet.** Finite support of local symbols. **Implementation:** unchecked.

### k2-reciprocity: Global reciprocity on K₂

**Target (theorem).** For F a number field containing μ_m and every x∈K₂ᶜˡ(F), ∏_v λ_{v,m}(x)=1 and Σ_v inv_v(res_v β_ζ(x))=0. Through the negative local-invariant coordinate these are the same law. The product ranges over all finite and archimedean places and is defined using the proved finite support.

**Hypotheses and models.** m≥1, ζ primitive if the Brauer expression is used. At real places m=1 is trivial and m=2 uses the real sign.

**Construction or proof.**

1. On symbols import ClassicalArithmeticCompletion §1.52’s degree-m Hilbert product law, with the explicit Artin convention; at m=2 also compare CFT Layer 14’s existing quadratic law through QFI.
2. Finite support permits multiplying the finitely many symbol families in a presentation of x. The resulting homomorphism is 1 on every generator and hence on every x.
3. Independently import CFT Layer 10’s sumLocalInv_eq_zero for β_ζ(x). Since every invariant is m-torsion, the torsion coordinate e_m turns the sum into the exponent of ζ in the product, with the common minus sign. Its injectivity proves equivalence, including real invariants.

**API.**

- `normResidueK2_product_formula` (compatibility): The all-place product is 1 for every K₂ class.
- `brauerSymbol_sum_invariant` (compatibility): The all-place sum of local invariants is zero.
- `normResidueK2_product_iff_sum` (equivalence): The two statements correspond under the specified negative coordinate.

**Checks.**

- `reciprocity_q_two` (computation): For Q,m=2,{−1,−1}, (−1)_∞(−1)_2∏_{p odd}1=1; omitting 2 or ∞ fails.
- `reciprocity_q_one` (degenerate): For the same Q class at m=1, all factors are 1; there is no real quadratic factor.
- `reciprocity_all_classes` (characterisation): The product law is a theorem on the entire classical K₂ group, not just a statement on pairs of units.
- `reciprocity_supplier` (compatibility): This proves transport and equivalence of the existing scalar and Brauer laws, not a second arithmetic proof of either law.

**Needs.** `K2SymbolsBrauerPartII:KBII.4/finite-support`, `K2SymbolsBrauerPartII:KBII.1/brauer-symbol`, `K2SymbolsBrauerPartII:KBII.3/arithmetic-invariant`, `ClassicalArithmeticCompletion:CA.1/hilbert-product-formula-of-degree-n`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6e-the-two-hasse-invariants-agree-and-both-are-the-invariant-map`.

**Sources.** [J. S. Milne](https://www.jmilne.org/math/CourseNotes/CFTc.pdf), V.5, Theorem 5.3 and Example 5.4, p.179; VII.8.1(b), p.221: The multiplicative local norm-symbol law and additive Brauer law are the imported reciprocity theorems.

**Planet.** Global reciprocity on K₂. **Implementation:** unchecked.

## KBII.5: Tate and finite Chern comparisons

The Tate results are imports with specified maps, not a second arithmetic proof. The finite Chern comparison uses the product-normalized classical-to-Quillen map and integral reduction. The function-field arithmetic extension and the low-degree finite Chern interface are explicit unclosed supplier obligations.

### tate-local-compatibility: Local Tate comparison maps

**Target (theorem).** For every local field F, prime ℓ≠char F and r≥1, import M.3’s isomorphism h_{F,ℓ^r}:K₂ᶜˡ(F)/ℓ^r≃H²(F,μ_{ℓ^r}^{⊗2}) and identify it with this roadmap’s Kummer-cup dictionary. For nonarchimedean F it commutes with the actual residue maps wherever ℓ is invertible in the residue field. For F=R or C use the supplier’s archimedean statements, not a nonarchimedean instance.

**Hypotheses and models.** Local means nondiscrete locally compact field; F=R,C are included with separate supplier cases. In mixed characteristic ℓ may equal the residue characteristic; the isomorphism remains, but the tame residue formula does not apply there.

**Construction or proof.**

1. Import the exact h-isomorphism and its map formula from M.3. Compose the named coefficient and field comparison equivalences from KBII.1, retaining both directions.
2. Use KBII.1’s residue dictionary for invertible residue coefficients. At residue-characteristic coefficients retain the local Tate isomorphism without claiming a tame-symbol formula.

**Checks.**

- `tate_local_cubic` (compatibility): For Q₇,ℓ=3,r=1 the isomorphism sends {3,7} to the cup used in the invariant-1/3 example.
- `tate_local_dyadic` (non-example): For Q₂,ℓ=2 the theorem is retained even though the tame residue formula is unavailable.
- `tate_real` (computation): At R and ℓ=2 the class {−1,−1} is nonzero; at C the finite quotient and H² vanish.
- `tate_equal_char` (non-example): For F of characteristic p, ℓ=p is excluded; no étale μ_p Kummer statement is asserted.

**Needs.** `K2SymbolsBrauerPartII:KBII.1/galois-symbol-dictionary`, `K2SymbolsBrauerPartII:KBII.1/residue-dictionary`, `MotivicEtaleKTheory:M.3/tate-local`.

**Sources.** [John Tate](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), §4, Proposition 4.5 and corollary, pp.267–268: The local arithmetic symbol is an isomorphism in degree two. [Charles A. Weibel](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.10.4, p.243: The degree-two norm-residue comparison includes local fields.

**Planet.** Local Tate comparison. **Implementation:** unchecked.

### tate-global-compatibility: Global Tate comparison maps

**Target (theorem).** For every global field F, every prime ℓ≠char F and r≥1, the supplier’s h_{F,ℓ^r}:K₂ᶜˡ(F)/ℓ^r≃H²(F,μ_{ℓ^r}^{⊗2}) is read through the present cup dictionary and commutes with completion and residue maps. For number fields this includes ℓ=2 and real places. Retain the ℓ-adic comparison of ℓ-primary K₂ modulo its maximal divisible subgroup with the ℓ-primary torsion of H²(F,Z_ℓ(2)), with the actual map induced by Tate’s diagram (3.3).

**Hypotheses and models.** Number fields and global function fields are separate supplier cases; for function fields the characteristic prime is excluded. The function-field extension of the current number-field M.3 contract is an explicit request, not inferred from a number-field-only theorem.

**Construction or proof.**

1. For number fields import M.3’s tate-global and tate-adic-comparison and identify their maps using the symbol formula and Tate’s diagram (3.3). Use the supplier’s restriction, transfer and coefficient maps to compare localizations.
2. For function fields consume the requested M.3 extension of Tate Theorems 5.1 and 5.4, whose source hypotheses include global function fields. M.3 owns the arithmetic proof and the required function-field reciprocity inputs.
3. Use the exact same cohomological residue square as in KBII.1. The output is a compatibility theorem for those arithmetic isomorphisms, not a reconstruction of the full norm-residue theorem or motivic machinery.

**Checks.**

- `tate_global_real_two` (non-example): No hypothesis ℓ odd or F totally imaginary is added to the number-field statement.
- `tate_global_function` (compatibility): For F=F_q(t), ℓ≠char F, retain the full global-field comparison via the named supplier extension; do not substitute the number-field theorem.
- `tate_global_maps` (characterisation): The completion square uses the actual K₂ field map and cohomological restriction, not an arbitrary isomorphism of finite groups.
- `tate_global_char` (non-example): The characteristic-p part in a global function field is not supplied by μ_p étale cohomology.

**Needs.** `K2SymbolsBrauerPartII:KBII.1/galois-symbol-dictionary`, `K2SymbolsBrauerPartII:KBII.1/residue-dictionary`, `MotivicEtaleKTheory:M.3/tate-global`, `MotivicEtaleKTheory:M.3/tate-adic-comparison`, `MotivicEtaleKTheory:M.3`.

**Sources.** [John Tate](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), Theorems 5.1 and 5.4, pp.268–270; diagram (3.3), pp.263–264; Theorem 3.5, p.265: Tate’s global-field degree-two and ℓ-primary comparisons use the specified symbol and connecting maps, including the function-field case.

**Planet.** Global Tate comparison. **Implementation:** unchecked.

### tate-s-integer-compatibility: S-integer Tate comparison maps

**Target (theorem).** For a number field F, finite S containing all archimedean places and all places above ℓ, O=O_{F,S}, and r≥1, transport the supplier’s K₂(O)⊗Z_ℓ≃H²_cont(O,Z_ℓ(2)) and K₂(O)/ℓ^r≃H²_et(O,μ_{ℓ^r}^{⊗2}). The squares for O→F, enlargement of S, coefficient reduction and the actual localization residues commute in the fixed tame convention. Include ℓ=2 and real places. Preserve the ideal-class terms of the Kummer and Tate exact sequences.

**Hypotheses and models.** ℓ any prime, including 2. Coefficients are invertible on O. Ordinary degree-two étale cohomology is the target here; no arbitrary scheme is identified with its function-field cohomology.

**Construction or proof.**

1. Import M.3’s tate-s-integer, tate-picard-sequence and M.2’s degree-two localization diagram. The comparison to the fraction field is a square of actual maps, with the residue sign already fixed.
2. For coefficient reduction and ℓ-adic passage use M.1’s continuous arithmetic coefficient complexes and the supplier’s exact sequences; do not infer finite-coefficient K₂(O)→K₂(F) injectivity from integral injectivity.
3. Retain 0→μ_ℓ⊗Pic(O)→K₂(O)/ℓ→(⊕_{v∈S, v not complex}μ_ℓ)_0→0 under Tate Theorem 6.2’s root-containment hypothesis. Also retain Pic(O)/ℓ^r in 0→Pic(O)/ℓ^r→H²_et(O,μ_{ℓ^r})→Br(O)[ℓ^r]→0. This latter sequence has weight one and is not silently substituted for the weight-two comparison.

**Checks.**

- `tate_s_q` (computation): For Q,S={2,∞}, K₂(Z[1/2])/2≃Z/2 generated by {−1,−1}, matching the finite étale group.
- `tate_s_picard` (non-example): For O with Pic(O)/ℓ nonzero, no passage to the fraction field discards the ideal-class term.
- `tate_s_maps` (compatibility): Enlarging S in two steps gives the same square as the composed localization, and the residue sign is −κ∂ᴹ.
- `tate_s_noninvertible` (non-example): Removing a place above ℓ invalidates the stated μ_{ℓ^r} comparison on O.
- `tate_scheme_generic` (non-example): No assertion identifies H² of an arbitrary scheme with H² of its function field.

**Needs.** `K2SymbolsBrauerPartII:KBII.1/residue-dictionary`, `K2SymbolsBrauerPartII:KBII.5/tate-global-compatibility`, `MotivicEtaleKTheory:M.3/tate-s-integer`, `MotivicEtaleKTheory:M.3/tate-picard-sequence`, `MotivicEtaleKTheory:M.1/etale-kummer-sequences`, `MotivicEtaleKTheory:M.1`, `MotivicEtaleKTheory:M.2`.

**Sources.** [John Tate](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), Equation (5.3), p.269; Theorems 5.4 and 6.2, pp.270–271: The S-integer localization sequence and the roots-of-unity/Picard exact sequence retain the ideal-class contribution. [Charles A. Weibel](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, p.515: Tate’s finite-coefficient S-integer comparison applies with the coefficient inverted on the ring.

**Planet.** S-integer Tate comparison. **Implementation:** unchecked.

### finite-coefficient-boundary: Integral reduction and the Bockstein boundary

**Target (theorem).** Use the supplier’s finite-coefficient K-theory and reduction red_m:K₂(F)→K₂(F;Z/m), with exact 0→K₂(F)/m→K₂(F;Z/m)→K₁(F)[m]→0. The Chern comparison in the next target is restricted to the image of integral reduction. It is not an identification of the entire finite-coefficient group with K₂(F)/m.

**Hypotheses and models.** m≥1; for étale Chern targets m is invertible in F. The finite-coefficient spectrum, connecting map and functorial exact sequence are supplier constructions.

**Construction or proof.**

1. Apply the coefficient cofiber sequence for multiplication by m on the supplier’s K-spectrum and take the degree-two/degree-one segment of its long exact sequence.
2. Factor red_m through the quotient and use exactness to identify its image with the kernel of the Bockstein. Preserve the actual integral reduction and product maps used by the Chern construction.

**API.**

- `finiteK2_integralReduction_image` (characterisation): The integral-reduction image equals the kernel of the K₁[m] Bockstein.
- `finiteK2_bockstein_exact` (compatibility): The displayed short exact sequence has the specified reduction and boundary maps.

**Checks.**

- `bockstein_mu` (non-example): For F with μ_m(F) nontrivial, K₁(F)[m]=μ_m(F) need not vanish, so the whole finite K₂ cannot be replaced by K₂/m.
- `bockstein_one` (degenerate): At m=1 every term is zero.
- `bockstein_natural` (compatibility): Field embeddings commute with reduction and Bockstein.

**Needs.** `GeneralAlgebraicKTheory:K.7`, `MotivicEtaleKTheory:M.8`.

**Sources.** [Christophe Soulé](https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf), §2.2.3.1, pp.45–46: The coefficient cofiber, exact K-theory sequence and integral reduction are defined explicitly; no finite-by-finite multiplication is required.

**Planet.** Finite-coefficient boundary. **Implementation:** unchecked.

### finite-chern-comparison: Product-normalized étale Chern comparison

**Target (theorem).** Let θ₂:K₂ᶜˡ(F)→K₂(F) be the base package’s raw Hurewicz comparison, ε=−1 its retained product sign, and θ₂♮=θ₂∘(ε·). For every field F, m≥1 invertible in F and x∈K₂ᶜˡ(F), c_{2,2}(red_m(θ₂♮x))=−h_{F,m}(x mod m) in H²_et(F,μ_m^{⊗2}). For the raw θ₂ the scalar is −ε=+1. The equality is on the integral-reduction image only.

**Hypotheses and models.** Finite étale Chern maps and finite-coefficient products are imported from the low-degree M.8 contract. θ₂♮ is the actual product-normalized map of K2SymbolsBrauer §8.3; changing the raw comparison changes ε, not this intrinsic formula.

**Construction or proof.**

1. For prime-power coefficients apply the M.8 version of Soulé’s multiplication formula to c_{1,1}(red a)=κ(a) and c_{1,1}(red b)=κ(b). At i=j=k=k′=1 the coefficient is −(i+j−1)!/((i−1)!(j−1)!)=−1.
2. The external product therefore has Chern class −κ(a)×κ(b), and pullback along the diagonal gives the same minus sign for the internal product. The base product-normalized comparison sends {a,b} to that internal K₁ product.
3. Use the Kummer-cup dictionary and Matsumoto symbol generation to get the equality on all integral K₂. For arbitrary m use coefficient-reduction compatibility and the Chinese remainder decomposition into prime powers. At m=1 both sides are zero.
4. The Bockstein exact sequence limits the conclusion to integral reduction. It gives no formula on a chosen lift of the additional K₁(F)[m] quotient.

**API.**

- `etaleChern_productNormalized_symbol` (compatibility): On a symbol, c₂,₂ red θ₂♮{a,b}=−κ(a)∪κ(b).
- `etaleChern_productNormalized` (compatibility): The displayed identity holds for every integral classical K₂ class.
- `etaleChern_rawHurewicz` (compatibility): The raw comparison gives scalar −ε; with ε=−1 this is +1.

**Checks.**

- `chern_cubic` (computation): For Q₇,m=3,{3,7}, the contracted cup invariant is 1/3 and the product-normalized Chern invariant is −1/3.
- `chern_six` (computation): In a Z/6 coefficient coordinate a cup value 1 gives Chern value 5; its reductions are 1 mod 2 and 2 mod 3. CRT recovers 5, not 1.
- `chern_external_internal` (compatibility): Both the external product and its internal pullback have coefficient −1.
- `chern_raw_sign` (characterisation): Replacing θ₂ by its negative also negates ε, leaving θ₂♮ and the intrinsic comparison unchanged.
- `chern_bockstein` (non-example): No equality on the whole finite-coefficient K₂ is inferred when K₁(F)[m] is nonzero.
- `chern_m_one` (degenerate): Both coefficient targets vanish at m=1.

**Needs.** `K2SymbolsBrauerPartII:KBII.1/galois-symbol-dictionary`, `K2SymbolsBrauerPartII:KBII.5/finite-coefficient-boundary`, `K2SymbolsBrauer:T.2/graded-map-degree-two-identification`, `K2SymbolsBrauer:T.2/unit-loop-product-symbol`, `MotivicEtaleKTheory:M.8`.

**Sources.** [Christophe Soulé](https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf), Proposition 2.2.2.3 and proof, pp.42–44: The degree-one times degree-one specialization has coefficient −1, before and after pulling the external product back to the field. [Christophe Soulé](https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf), Proposition in §2.2.3.2 and Lemma 2.2.3.2.1, pp.47–48; remark after Proposition 2.2.3.3, p.49: The finite Chern operation factors the integral operation through reduction. The source does not assert a general product formula on two arbitrary finite-coefficient classes.

**Planet.** Étale Chern comparison. **Implementation:** unchecked.

## Worked normalization and boundary examples

### The cubic test over Q₇

Choose ζ∈Q₇ reducing to 2∈F₇. This choice is unique among the two primitive cube roots with that reduction. The cubes in F₇ˣ are 1 and 6, so t³−3 is irreducible modulo 7 and adjoining α³=3 gives the unramified cubic extension. Arithmetic Frobenius sends α to α⁷=3²α=2α modulo the residue extension, hence sends α to ζα in the local field. The character χ with χ(Frob)=1/3 therefore has cyclic class (χ,7) of invariant 1/3.

With Yα=ζαY and Y³=7, this is A_ζ(3,7), and KBII.2 identifies its class with β_ζ{3,7}. The classical symbol with 7 in the Artin slot is H₃(7,3)=ζ. Skew symmetry gives H₃(3,7)=ζ^{−1}. Thus the positive invariant of the ordered cup computes the reversed scalar symbol. This proves why the negative exponent is needed. The norm kernels would be unchanged under several unit scalars and cannot determine this sign.

The same class tests the Chern formula independently. Contract h{3,7} using ζ; its Brauer invariant is 1/3. The product-normalized Chern class contracts to invariant −1/3. The local norm-residue minus sign and the Chern minus sign arise from different comparisons and must each be checked. They cannot be removed together by renaming a coefficient map.

### Degree four with a quadratic radical field

Assume F contains a primitive fourth root ζ and c is nonsquare. Put a=c² and choose α²=c, so α⁴=a and [F(α):F]=2. The étale algebra F[X]/(X⁴−c²) splits into the two quadratic factors X²−c and X²+c. Conjugation by Y exchanges their two idempotents. The corner for X²=c is generated by X and Y², with (Y²)²=b and Y²X=−XY². It is the quaternion algebra A_{ζ²}(c,b). Therefore A_ζ(c²,b) is its 2-by-2 matrix algebra, of dimension 16 over F. Defining the degree-four symbol algebra as a crossed product of the degree-two field extension would instead lose the matrix factor.

### A section when all roots of unity have order m

Suppose μ(F)=μ_m and ζ is primitive. If ζ^e=t^m for t∈Fˣ, then t^{m²}=1, so t∈μ(F)=μ_m and ζ^e=1. The class of ζ in Fˣ/F^{×m} has order exactly m. Perfectness of H_m makes the character a↦H_m(ζ,a) have order m, so it has a primitive value. Adjust the argument by a unit exponent to make that value ζ. Bilinearity gives m{ζ,a}=0. Thus ζ^i↦i{ζ,a} is well defined and N maps it to ζ^i. The existence of this section uses no assertion about the remaining kernel and therefore does not consume the downstream Moore theorem.

### Dyadic and real cancellation

For Q and m=2, the class {−1,−1} has Hilbert factor −1 at Q₂ and at R, and factor 1 at every odd prime. At odd primes both entries are valuation units and the quadratic tame character is trivial. The all-place product is 1, and the two nonzero Brauer invariants are each 1/2, whose sum in Q/Z is zero. Removing either 2 or ∞ changes the product. At m=1, every factor is 1 instead; the real quadratic sign must not be carried into that case.

The dyadic example also separates the norm-residue map from the tame symbol. Both entries are units, so the base tame symbol is 1, while the quadratic norm-residue value is −1. In mixed characteristic, m invertible in F does not mean it is invertible in the residue field.

### Total conics and the global non-example

At (0,0) over R the equation 0=1 has no solution, so the total conic sign is −1. Over all real inputs its negative criterion is r≤0 and s≤0. On units that becomes the familiar pair of strict inequalities. These are different domains.

For Q the three equations 3x²−y²=1, 7x²−y²=1 and 21x²−y²=1 have no rational solutions. Clearing denominators, a primitive integer solution to 3a²=b²+c² or 21a²=b²+c² forces b,c divisible by 3 because −1 is nonsquare modulo 3, and then forces a divisible by 3. The equation 7a²=b²+c² gives the same contradiction modulo 7. Hence all three conic signs are −1 and the sign is not multiplicative in the first argument. The local hypothesis in the Hilbert factorization cannot be discarded.

### Composite coefficients and the Bockstein boundary

A cup coordinate 1 in Z/6 has product-normalized Chern coordinate −1=5. Reducing the Chern coordinate gives 1 in Z/2 and 2 in Z/3, whose CRT lift is 5. Testing only the quadratic component would not detect the sign.

For finite K-theory, 0→K₂(F)/m→K₂(F;Z/m)→K₁(F)[m]→0 places the integral-reduction image in the kernel of a specified boundary. If μ_m(F) is nontrivial, its K₁[m] term is nonzero. The Chern comparison proved from integral products says nothing about an arbitrary lift of that quotient. A proof must preserve the reduction map rather than identify the whole middle group with the left group.

For S-integers there is a different boundary issue. Integral injectivity into the fraction field cannot be used to infer injectivity modulo ℓ^r. Tate’s μ_ℓ⊗Pic(O) contribution and the weight-one Kummer Pic(O)/ℓ^r term must remain in their respective exact sequences. They are not both discarded by passing to Galois cohomology of F.

## Supplier obligations and closure

The following requests are part of the packet’s prerequisite closure. “Import” means an existing owner’s contract is being consumed with the named maps. “Extension” identifies a missing or insufficiently explicit supplier interface. These are not claims that those interfaces have been implemented.

1. **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.** IMPORT existing ClassFieldTheory Layer 5, not a new construction: Kummer coefficient/cup pairing, h2MuToBr and its cup compatibility, normalized invMap and the coordinate e_m([k/m])=k for every coefficient invertible in the local field. Current Tau Ceti a91d3aa already has TauCeti.ClassFieldTheory.h2MuEquivZMod and toRatAddCircle_h2MuEquivZMod in Brauer/RootsOfUnity.lean:89–105; use them through the M.1 coefficient-model comparison, without re-planning them. The existing kummerCupPairing is factored through the tensor model in KBII.1. Needed by: `KBII.1/root-contraction`, `KBII.2/cup-brauer-comparison`, `KBII.3/arithmetic-invariant`.

2. **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`.** IMPORT existing ClassFieldTheory Layer 6: the actual arithmetic-Frobenius local Artin map, its character/invariant formula and Kummer evaluation. Keep the variable order Art(a) acting on b^(1/m), including residue-characteristic power coefficients in mixed characteristic. No local reciprocity proof is requested here. Needed by: `KBII.3/norm-residue-k2`, `KBII.3/arithmetic-invariant`.

3. **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`.** IMPORT existing ClassFieldTheory Layer 10: number-field completion/restriction maps, finite support and the all-place sumLocalInv_eq_zero for the actual Brauer class, with real invariant 1/2 and complex invariant 0. This contract is number-field only and is not used as a function-field theorem. Needed by: `KBII.4/place-symbol`, `KBII.4/finite-support`, `KBII.4/k2-reciprocity`.

4. **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`.** IMPORT existing ClassFieldTheory Layer 14: quadratic hilbertProductFormula over all places of a number field. Transport via QFI 6E; the degree-m product law is supplied by ClassicalArithmeticCompletion CA.1, not reconstructed here. Needed by: `KBII.4/k2-reciprocity`.

5. **`tauceti:TauCetiRoadmap/QuadraticFormInvariants#7b-the-comparison-with-h²`.** IMPORT existing QuadraticFormInvariants 7B: the generic algebraic/cohomological Brauer equivalence, crossed-product realization with u_σ x=σ(x)u_σ and u_σu_τ=c(σ,τ)u_{στ}, brauerCohomologyEquiv_crossedProductClass, naturality and the current brauerCohomologyEquiv_quaternionClass. These generic comparisons are not new Part II definitions. The new target is the specified A_ζ(a,b) and its equality under this comparison, including proper radical degree. Needed by: `KBII.1/brauer-symbol`, `KBII.2/symbol-algebra`, `KBII.2/central-simple`, `KBII.2/proper-degree-corner`, `KBII.2/cup-brauer-comparison`.

6. **`tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant`.** IMPORT existing QuadraticFormInvariants 6C: the unit-valued local quadratic Hilbert symbol, its norm-equation criterion, symmetry, bilinearity and explicit dyadic and odd-prime formulas. Only the total conic presentation and the factorization through classical K₂ are new here. Needed by: `KBII.3/conic-symbol`, `KBII.3/hilbert-k2`.

7. **`tauceti:TauCetiRoadmap/QuadraticFormInvariants#6e-the-two-hasse-invariants-agree-and-both-are-the-invariant-map`.** IMPORT existing QuadraticFormInvariants 6E: hilbertSymbol_eq_cohomological and the arithmetic normalization linking the quadratic Hilbert sign, quaternion class and local Brauer invariant. Do not duplicate this comparison. Needed by: `KBII.3/hilbert-k2`, `KBII.3/arithmetic-invariant`, `KBII.4/k2-reciprocity`.

8. **`ClassicalArithmeticCompletion:CA.1`.** IMPORT/ADAPTER contract for existing §§1.14,1.25: on every nonarchimedean local field with μ_m⊆F and m invertible in F, H_m(a,b)=Art_arith(a)(b^(1/m))/b^(1/m), independent of the chosen root, bimultiplicative, skew symmetric, Steinberg and perfect on Fˣ/F^{×m}. Include mixed-characteristic m divisible by the residue characteristic. Retain §1.52’s all-place degree-m Hilbert product law, with the exact arithmetic variable order. Its existing node hilbert-product-formula-of-degree-n is imported directly. This request makes the general local-field adapter explicit where the CA packet’s number-field completion formulas alone would be too narrow. Needed by: `KBII.3/norm-residue-k2`.

9. **`MotivicEtaleKTheory:M.1`.** IMPORT existing M.1 continuous coefficient complexes and étale localization maps used by the S-integer Tate squares, with weight-one KummerCoeff equal to the pinned Tau Ceti carrier and cup-compatible comparison. Finite twists and field comparison are imported by their precise existing node IDs. Ordinary scheme H² is not replaced by fraction-field H². Needed by: `KBII.5/tate-s-integer-compatibility`.

10. **`MotivicEtaleKTheory:M.2`.** IMPORT existing M.2 degree-two localization/duality diagram with the actual maps to local fields and the real-place convention at ℓ=2. Use this for the number-field S-integer compatibility square; no new arithmetic duality is planned here. Needed by: `KBII.5/tate-s-integer-compatibility`.

11. **`MotivicEtaleKTheory:M.3`.** EXTENSION required: extend the number-field tate-global contract to every global function field F at ℓ≠char F, all r≥1, with h_{F,ℓ^r} an isomorphism, natural completion and residue squares and Tate diagram (3.3)’s ℓ-primary comparison modulo maximal divisibility. Tate 1976 Theorems 5.1 and 5.4, pp.268–270, include this scope. M.3 must own its function-field reciprocity input rather than applying number-field-only CFT. The number-field nodes, all ℓ including 2 and real places, are imported unchanged. This request is necessary before KBII.5 is closed. Needed by: `KBII.5/tate-global-compatibility`.

12. **`GeneralAlgebraicKTheory:K.7`.** EXTENSION/interface request for finite coefficients: the cofiber of multiplication by m on the existing K-spectrum, integral reduction and the natural exact sequence 0→K₂(F)/m→K₂(F;Z/m)→K₁(F)[m]→0, with coefficient-reduction/CRT maps and the compatibility of reduction with the existing integral K₁×K₁ product. This requires no multiplication on an arbitrary Moore spectrum. Resolve the issue’s legacy AlgebraicKTheory supplier spelling through this existing owner, not a new phantom roadmap. Needed by: `KBII.5/finite-coefficient-boundary`.

13. **`MotivicEtaleKTheory:M.8`.** EXTENSION required, isolated low-degree branch: construct the finite étale Chern maps needed on the integral-reduction image for every m invertible in F, including powers of 2, c_{1,1}(red a)=κ(a), and c_{2,2} compatible with integral reduction, field restriction, coefficient reduction and CRT. On integral external products of K₁ classes supply Soulé Proposition 2.2.2.3, pp.42–44, with coefficient −1 in bidegree (1,1), and its internal pullback. The source proves the integral K-product formula with finite étale cohomology coefficients; compatibility with the specified finite-K reduction is a separate part of this request. No product on arbitrary finite K-classes is presumed. Give this low-degree branch inputs M.1 plus GeneralAlgebraicKTheory and the base K2SymbolsBrauer product comparison, with no dependency on this Part II or the late KU-tate2 checkpoint. Broader regulator/M.7 prerequisites are not needed for this branch. Use Soulé §2.2.3.2 and Lemma 2.2.3.2.1, pp.47–48, for factorization through finite reduction. The warning after Proposition 2.2.3.3, p.49, rules out importing an unproved finite-by-finite product formula; only reduction of integral products is needed. Needed by: `KBII.5/finite-coefficient-boundary`, `KBII.5/finite-chern-comparison`.

14. **`K2SymbolsBrauer:T.2/unit-loop-product-symbol`.** IMPORT the current base package §§8.1–8.3 product comparison, including the computed torus sign ε=−1 for its fixed raw Hurewicz route and θ₂♮=θ₂∘(ε·). The older target packet retains ε as a parameter; use the newer package statement and preserve the same θ₂. The intrinsic Chern comparison needs only θ₂♮; its raw-map +1 corollary additionally uses the computed sign. No change to base Layers 1–13 is made in this job. Needed by: `KBII.5/finite-chern-comparison`.

No additional mathematical gaps are recorded. The outstanding interfaces above keep the five stages planned rather than closed. In particular the function-field arithmetic proof belongs to M.3, finite-coefficient reduction to GeneralAlgebraicKTheory, and the low-degree finite Chern construction to M.8. Each needs its own supplier-level verification before this roadmap can be marked closed.

## Source findings and reading record

All statements above are written in our own words. The sources are used for mathematical locators and comparison conventions; no source passages are reproduced. The following findings are against precisely the versions read, and await independent review.

### E1: error at Author copy dated 29 August 2013, III Lemma 6.9.1, p.241; no version-of-record assertion

The lemma claims that a degree-n central simple algebra over a field containing μ_n splits as soon as it has a noncentral element u with u^n=1. The proof identifies F[u] with F[t]/(t^n−1) without proving its minimal polynomial has degree n.

**Correction.** Require that u have minimal polynomial t^n−1, or equivalently that the n spectral idempotents all be nonzero. For the split symbol algebra this follows from its monomial basis; alternatively use the explicit splitting representation in KBII.2.

**Check.** Take F=Q₅, which contains a primitive fourth root by Hensel lifting a root modulo 5. The quaternion D=(2,5) is division: its odd-residue Hilbert sign is −1 since 2 is nonsquare modulo 5. Then A=Mat₂(D) has degree 4 and is nonsplit. Its noncentral u=diag(1,−1) satisfies u⁴=1 but has minimal polynomial t²−1. This contradicts the author-copy statement. The corrected condition supplies n orthogonal nonzero idempotents, forcing the matrix size to be n.

**Scope and search.** Affects a stated result. new (author-copy finding; no correction located, not an exhaustive novelty claim). 2026-10-20: author K-book page and Books page inspected; the listed Kbook.errata.pdf and HTTP/HTTPS host variants return 404. Search indexing exposes an older errata beginning but not a complete current copy; no correction of III.6.9.1 was found. 2026-10-20: AMS DOI landing page was inaccessible to the browser; the full-book PDF endpoint did not serve. Only the freely hosted author copy was read. The finding is scoped to that copy and does not claim the version of record has the same wording.

### E2: misprint at Published article, Lemma (4.1), p.265, bottom row of its diagram; page image checked

The diagram labels the two cohomology targets of h₁ by H¹(G_F,μ_ℓ⊗μ_ℓ) and H¹(G_E,μ_ℓ⊗μ_ℓ).

**Correction.** Both superscripts are 2. The subscript 1 on h₁ refers to coefficient exponent ℓ rather than cohomological degree.

**Check.** Diagram (3.3), pp.263–264, defines h₁:K₂(F)/ℓ→H²(F,μ_ℓ^{⊗2}); the text immediately below Lemma (4.1) again identifies that H² group with μ_ℓ⊗Br(F)[ℓ]. The lemma’s restriction/transfer argument therefore uses H².

**Scope and search.** Affects nothing. new (no accessible correction located; not an exhaustive novelty claim). 2026-10-20: the full published GDZ scan read; targeted searches for Tate 1976 corrections and Lemma 4.1 found no primary erratum. A search result mentions a Collected Works correction list; that book was not read and no claim about its contents is made.

### E3: gap at Author copy dated 29 August 2013, III Example 6.2.3, p.233, final split-surjectivity argument

The argument obtains x with (ζ,x)≠1 and then presents ζ^i↦{ζ^i,x} as an inverse to the norm-residue map.

**Correction.** Choose x with (ζ,x) of exact order m, then replace x by a suitable exponent so that (ζ,x)=ζ. Perfectness of the norm-residue pairing and the exact order m of the ζ power class provide such an x under μ(F)=μ_m.

**Check.** A nonidentity element of μ_m need not have order m when m is composite. Even a primitive value ζ^e gives multiplication by e rather than the identity unless x is adjusted. The exact-order argument and adjustment in KBII.3 repair the proof without assuming Moore’s theorem.

**Scope and search.** Affects the proof. new (author-copy proof-gap finding; no correction located). 2026-10-20: same author-page/errata and AMS access checks as E1; the author-copy paragraph was read directly. No claim about the inaccessible version of record is made.

### E4: misprint at Author-hosted thesis transcription, Proposition 2.2.3.3, p.49; page image checked

The first factorial in the denominator is (1−i)! in the mixed integral/finite-coefficient product formula.

**Correction.** Read (i−1)!, as in Proposition 2.2.2.3 and the same universal-polynomial calculation on p.44.

**Check.** For i≥2 the printed factorial has negative argument. The proof explicitly imports the coefficient of the integral formula, which is −(i+j−1)!/((i−1)!(j−1)!). At i=j=1 both versions give −1, so this typo does not change the comparison planned here.

**Scope and search.** Affects nothing. new (author-hosted-transcription finding; no correction located). 2026-10-20: author-hosted thesis, pp.42–49, read and p.49 image checked. Targeted searches on the author domain and for Proposition 2.2.3.3 corrections found no correction. The original 1978 typescript was not compared; the finding is restricted to the hosted transcription.

The author-hosted Weibel copy was read; the version of record was not obtained. The AMS DOI landing page was inaccessible and its full-book endpoint did not serve the book. The author’s listed errata link returned 404 on the checked hosts. Search indexing exposed a partial older errata listing but did not provide the complete current document, so no completeness claim is made. The findings are scoped accordingly. The Tate finding was checked in the published page image. A search result mentioning a Collected Works correction list was not used as a read source. Soulé’s pp.45–49 additionally supply the coefficient exact sequence and the finite-Chern factorization; they explicitly leave the general product formula on two finite-coefficient inputs unasserted, which is why that formula is absent from this plan.

- [The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Charles A. Weibel, Author copy dated 29 August 2013, corresponding to Graduate Studies in Mathematics 145; findings below concern this copy only. III.6.2–6.2.5, pp.232–234; III.6.9–6.10.4, pp.240–243; VI.8.6, p.515, read 2026-10-20. SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
- [Class Field Theory](https://www.jmilne.org/math/CourseNotes/CFTc.pdf), J. S. Milne, Version 4.03, 6 August 2020; printed page numbers. III.3, Proposition 3.6 and Lemma 3.7, p.109; III.4, pp.111–115; V.5, pp.178–179; VII.8, pp.219–222, read 2026-10-20. SHA-256 `63e7c0a2b6a62ac365ba8b2145cc89ecffa1a53370c28d358a954a9abc60e4d5`.
- [Relations between K₂ and Galois cohomology](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), John Tate, Inventiones mathematicae 36 (1976), 257–274, version of record, GDZ scan. Entire article, pp.257–274, page images read 2026-10-20; especially §§2–6, diagram (3.3), Theorems 5.1, 5.4 and 6.2. SHA-256 `5d1ee68e3f9cc49ba6cac8269e1c9ca510411c6a154f36b559290849a72db7b7`.
- [Groupes arithmétiques et K-théorie des anneaux d’entiers de corps de nombres](https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf), Christophe Soulé, Doctorat d’État thesis, Université Paris VII, June 1978; author-hosted transcription. Proposition 2.2.2.3 and its proof, pp.42–44; §§2.2.3.1–2.2.3.3, pp.45–49, including finite-coefficient reduction, Chern factorization and the warning on finite-by-finite products; read 2026-10-20. SHA-256 `19bb0877616c262fcb83c9fe6ad88f98747f117f23805b6154e19174dbb659a7`.

The Gille–Szamuely book, which was not available among the cleared local sources, and the broad original Merkurjev–Suslin/Voevodsky proof sources are not cited as if read. Their general machinery belongs to the motivic supplier rather than this moved dictionary layer. The freely readable Weibel, Milne, Tate and Soulé texts supply the comparisons actually used here. No restricted book file or passage is included.

## Suggested Lean file and completion checks

The suggested file is not exhaustive; this document is definitive. It imports Mathlib and keeps one light real-bodied definition on an existing carrier, the total conic sign, three milestones statable on pinned field carriers, and two proved examples. It introduces no stand-in K-theory/cohomology carriers and contains no admitted data construction. The heavy coefficient, algebra, K₂ and Chern constructions remain document targets until their supplier carriers exist at the pin.

The file elaborated with `lean-check` at the recorded pins, with declaration-admission warnings only. The packet checker reports zero errors and zero warnings. The packet contains 23 nodes: 1 definition, 7 constructions and 15 theorems. There are at most six planets per layer: 6, 4, 5, 3 and 5. All five stages are planned, with complete moved-scope coverage and unchecked implementation status.
