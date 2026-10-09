# Arithmetic Galois representations and conductors — R01.2

This part makes local restriction and the Weil–Deligne construction usable as a library interface. Its input is the R01.1 continuous-representation carrier and the existing local-field and Weil-group suppliers. Its output is a local representation independent of its embedding up to coherent isomorphism, residual fundamental characters with their fields of values specified, and a Weil–Deligne object whose monodromy and two semisimplifications cannot be confused. Conductors and inertial types in R01.3 and R01.4 consume that output; R01.5 uses local Frobenius data. The full representation, its Frobenius semisimplification and its categorical semisimplification have different arithmetic uses, so all three remain named objects.

The definitive statements below are plans, not implementation claims. This packet refines the accepted [parent packet](../packets/ArithmeticGaloisRepresentations.json) without editing it or reusing its node IDs. WORKERS.md and the current detail.json set target-level granularity: minor proof steps remain in the proof sketches. The parent’s older request to turn every auxiliary lemma into a node is superseded by that rule. The resulting pass is **complete**, and stage R01.2 is **planned**, with the explicitly identified supplier-binding gap. It is not marked closed.

## Conventions and ownership

For a number field F, choose F̄ once. A finite place v is represented by a nonzero prime of O_F, and a place w of F̄ above v is a maximal ideal of O_{F̄}. The completion F_v and the chosen embedding ι:F̄→F̄_v give a continuous map j_ι:G_{F_v}→G_F. Its construction is Mathlib’s `Field.absoluteGaloisGroup.mapOfAlgebra`, using the algebra structure of the specified ι. The more general `map` chooses a closure embedding and does not expose this particular choice; it cannot be substituted when proving the change-of-embedding equations.

The parent completion comparison remains an input: j_ι is a closed embedding with image D_w and is a homeomorphism onto that image. At every finite Galois extension L/F, the image of D_w is the stabilizer of the contracted prime. NumberFieldArithmetic Layer 5.6 supplies the finite comparison `decompositionHom` with Gal(L_w/F_v), its bijectivity, and the `completionCongr` conjugation square. The absolute comparison passes to compact inverse limits over these finite extensions; injectivity uses the parent Krasner-based algebraic-closure generation lemma. Local inertia and wild inertia map onto I_w and P_w, and D_w/I_w identifies with the absolute Galois group of the finite residue field. These comparisons retain their parent IDs rather than becoming a second completion theory here.

A change ι′=ιg gives j_ι′(h)=g⁻¹j_ι(h)g. Consequently ρ(g) intertwines ρ_ι′ with ρ_ι. For three embeddings, the corresponding maps compose with the multiplication law in G_F. Postcomposing ι with a local automorphism gives the same comparison through its image under j_ι. This coherence does not give equality of two homomorphisms on their fixed carrier, and the isomorphism need not be the identity. The distinction is essential for local cohomology and the Selmer restriction maps noted in the EllipticCurves Layer 7 link.

For a local field K, let k_K=F_q, q=p^f. The local inertia I_K, wild inertia P_K, unramified quotient, Frobenius lifts and tame characters belong to **LocalFieldsRamification**, Layers 2 and 4. The local Weil group belongs to **ClassFieldTheory**, Layer 9. Its degree is arithmetic: deg(Φ)=1 when Φ acts by x↦x^q on the residue closure. A geometric lift F=Φ⁻¹ has degree −1. Thus the norm character used here is ω(w)=q^{deg(w)}, and ω(Φ)=q. The local reciprocity convention is a supplier convention; it is not reconstructed from a sign guessed from notation.

The Weil topology is part of the input. Inertia is a compact open subgroup with its original profinite topology, and W_K/I_K is discrete Z. W_K sits densely in G_K, but its Weil topology is not the induced topology. ClassFieldTheory’s `WeilGroup` type synonym and `isOpenEmbedding_inertiaToWeil` specify exactly this distinction. Merely making inertia open would allow an incorrectly refined inertia topology. A WD object uses a smooth Weil action, meaning open kernel on inertia, with coefficients regarded discretely. An ℓ-adic representation uses the ℓ-adic topology and the R01.1 jointly continuous action. Neither condition is replaced by continuity of each separate linear operator.

All WD coefficients are characteristic zero and all WD spaces are finite dimensional. The nilpotent exponential is a finite sum, with the factorial denominators interpreted in that coefficient field. Quasi-unipotence is asserted here for **finite residue fields** and ℓ≠p. The more general residue-field hypotheses mentioned in the parent’s Serre–Tate reading request do not enlarge this target. For E/Q_ℓ finite, the supplied tame coordinate t:I_K→Q_ℓ is the trivialisation of the actual Tate-twisted character, not an arbitrary additive homomorphism. The intrinsic monodromy is a map Z_ℓ(1)→End_E(V). Its scalar representative N_t satisfies ρ(σ)=exp(t(σ)N_t) on open inertia, so replacing t by at replaces N_t by a⁻¹N_t.

## Existing library and supplier audit

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet records sixteen declarations whose statements and ambient hypotheses were read at that pin. They provide the stabilizer and additive inertia, closure-induced continuous maps, algebraic representations and their tensor/dual operations, semisimplicity and Schur’s lemma, trace, the nilpotent exponential, the residue roots-of-unity equivalence, and multiplicative Jordan decomposition. In particular the Jordan decomposition is imported; this part has no new Jordan–Chevalley definition.

The current read-only Tau Ceti tree was also checked, at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, with its Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Its actual `LocalField/Tame/Character` and `PadicCharacter` modules already export `TauCeti.inertiaKummerCharacter`, `inertiaKummerCharacter_pow_div`, `inertiaTameCharacter`, `quotientWildInertiaSubgroupEquiv`, `inertiaPadicTameCharacter` and `IsArithFrobeniusLift.inertiaPadicTameCharacter_conj`. They include the finite root formula, choice independence, surjectivity, wild-inertia kernel and Frobenius equivariance. These post-pin results are **not** reported as pinned declarations or planned again. Their arithmetic residual interpretation is the new bridge here.

For K=Q_p, use the unramified degree-n field U to read the order-(p^n−1) roots as F_{p^n}× through the pinned `rootsOfUnityEquivResidueFieldUnits U`. For general residue degree f, choose an unramified U large enough that n divides its absolute residue degree, then select its F_{p^n} subfield. One cannot demand residue cardinality p^n from an extension of K when f does not divide n. The whole-residue adapter requires k to contain k_U. The separate subfield adapter accepts the selected S=F_{p^n}⊆k_U, proof that the reduced component lies in S, and only an embedding S→k. An order-(p^n−1) component is included into μ_{#k_U−1} before reduction. Thus the general bridge does not impose an embedding of the larger field k_U into k. It never embeds all of the algebraic residue closure into a finite field.

The current LocalFieldsRamification, ClassFieldTheory, NumberFieldArithmetic and LocalGaloisGroups README and Suggested interfaces were read. LocalGaloisGroups concerns the local cyclotomic and maximal pro-p theory; it does not supply or acquire ownership of a second WD or tame-character theory. The link audit agrees that R01.2 imports Layer 4’s tame character and constructs its residual fundamental-character interpretation. All cross-roadmap requests below are precise supplier bindings, not requests to duplicate their definitions.

| Supplier | Exact input used |
|---|---|
| LocalFieldsRamification Layer 2 | Unramified extensions inside K̄, residue embeddings and roots-of-unity reduction. |
| LocalFieldsRamification Layer 4 | I_K, P_K, finite tame components and power transitions; the ℓ-adic tame quotient and its equivariance. Current Tau Ceti implements these characters. |
| ClassFieldTheory Layer 9 | `WeilGroup`, `weilDegree`, `weilToAbsolute`, `inertiaToWeil`, and its open embedding with the original inertia topology. |
| NumberFieldArithmetic Layer 5.6 | Finite-level `decompositionHom`, its bijectivity, `completionCongr` and residue/Frobenius compatibility. |
| R01.1 parent nodes | Continuous finite projective representations; restriction and coefficient operations; lattices; algebraic semisimplification and Brauer–Nesbitt. |

## The local construction and its acceptance boundary

Grothendieck’s quasi-unipotence theorem is retained under its parent ID. Its finite-residue-field proof is supplied by Bushnell–Henniart §32.5, pp. 204–205: after shrinking inertia, the image is congruent to 1 modulo ℓ²; the prime-to-ℓ kernel of the tame coordinate has no nontrivial image in the successive ℓ-power congruence quotients. The resulting action factors through the tame coordinate. Frobenius permutes its eigenvalues by the q-th power, forcing roots of unity, and congruence modulo ℓ² forces those roots to be 1, including at ℓ=2. A nonzero tame coordinate then determines N by the finite logarithm. No p-adic analytic exponential convergence assertion is used for nilpotent N.

Fix geometric F. Correct ρ(F^nσ) by multiplying on the right by exp(−t(σ)N_t). The smooth Weil action r and the same N_t form WD(ρ). On the open subgroup controlled by the monodromy theorem, the two exponentials cancel. The parent inverse construction recovers ρ(F^nσ)=r(F^nσ)exp(t(σ)N_t). The equivalence concerns continuous representations of W_K. A representation on W_K extends continuously to the compact G_K exactly when its image is bounded; for these finite-dimensional ℓ-adic objects the Frobenius eigenvalues must be units. This hypothesis prevents applying the equivalence indiscriminately to G_K.

For geometric F′=Fτ, the conjugator is exp(t(τ)N_t/(q−1)). For F′=τF the conjugator has coefficient (1−q⁻¹)⁻¹ instead. The multiplication side is part of the formula. The parent’s independently confirmed source issues `ArithmeticGaloisRepresentations/E202` and `E250`, at Deligne’s Lemme 8.4.3, p. 569, already record the inverse-coordinate scaling and the side-dependent conjugator corrections. This part applies those corrections and does not create duplicate errata records. Bushnell–Henniart §32.6, p. 207, independently supplies the Fτ formula.

The monodromy filtration and its tensor/dual linear algebra stay with the accepted LPV.1 owner and the parent’s WD stability comparison. Euler factors, epsilon factors and purity also retain their parent nodes. Their acceptance formulas remain available to consumers, including the geometric local factor on (ker N)^I. Those ancillary results do not turn the present signature-binding gap into a claim of a closed stage.

The [suggested file](../suggested/ArithmeticGaloisRepresentations--R01.2.lean) exposes its limitations precisely. The genuine W_K carrier and current tame-character modules are not available at the pinned build. Therefore the file uses an explicitly parameterized W, arithmetic degree and q for the WD linear algebra. The monodromy selector consumes the fully stated unique-existence witness from the parent theorem, and the corrected-action constructor consumes its explicit open corrected-kernel consequence. These hypotheses are not replacements for the local theorem: the accepted parent theorem supplies them on the genuine local field. There are no unknown proposition fields.

The supplier-dependent signatures omitted from this prototype are: the canonical completion-place definition and absolute closed-embedding comparison; transport of local inertia and wild inertia onto their global subgroups; the construction of the selected unramified Kummer component inside the residue subfield; Grothendieck’s theorem instantiated on `ClassFieldTheory.WeilGroup`; and the categorical exact-equivalence operations on the R01.1 bundled continuous objects. Each has a retained parent node or a supplier request. The named definitions, API items and fifty new tests below do appear in the file. The classification prototype states the indecomposable clause, finite special-block decomposition and uniqueness of each irreducible-factor/length pair. Finite-length uniqueness of the decomposition follows by the stated string argument.

The confirmed source misprint `ArithmeticGaloisRepresentations/E7947` concerns Bushnell–Henniart §31.2 Exercise, p.201 in the 2006 edition: its dimension index for the irreducible Weil factor repeats the special-block length. These are independent parameters. Sp(2), with a one-dimensional trivial factor and block length two, disproves the literal restriction. The statements below use the corrected indexing; the intended classification is unaffected.

## R01.2 targets and interfaces

In the declarations below, `ArithmeticLocal` abbreviates `TauCeti.ArithmeticLocal` and `WeilDeligneRep` abbreviates `TauCeti.WeilDeligneRep`. All hypotheses are mathematical requirements even where the suggested signatures expose a general algebraic parameterization. Tests are assertion signatures intended to fail plausible incorrect definitions; elaboration does not prove them.

### 1. Decomposition and inertia at a global place

D_w is the stabilizer of w under G_F acting on O_{F̄}; I_w consists of σ with σx−x in w for every x in O_{F̄}. Both are subgroups of G_F, with I_w ≤ D_w. These are specializations of MulAction.stabilizer and AddSubgroup.inertia, not new abstract group constructions. The global wild subgroup is the image of the existing local P_{F_v} under the parent completion comparison; its intrinsic finite-level characterization remains the parent node.

**Hypotheses.** F is a number field; F̄ is the fixed algebraic closure. w is a maximal ideal of O_{F̄} above a nonzero finite prime v, except in the explicitly labelled bottom-ideal test.

**Construction or proof.** Use the action of algebraic-closure automorphisms on integral elements and pointwise ideals. Define D by stabilizer and I by additive inertia; the residue action shows I ≤ D. Conjugating the ideal conjugates each subgroup. At finite Galois levels use the parent decomposition comparison and NumberFieldArithmetic.decompositionHom. Compact inverse limits give the global comparison; the parent Krasner node supplies injectivity.

**API.**

| Declaration | Contract |
|---|---|
| `ArithmeticLocal.decompositionAt` | D_w = MulAction.stabilizer G_F w. |
| `ArithmeticLocal.inertiaAt` | I_w = AddSubgroup.inertia(w.toAddSubgroup, G_F). |
| `ArithmeticLocal.mem_decompositionAt` | σ ∈ D_w iff σw=w. |
| `ArithmeticLocal.mem_inertiaAt` | σ ∈ I_w iff every σx−x lies in w. |
| `ArithmeticLocal.inertiaAt_le` | I_w ≤ D_w. |
| `ArithmeticLocal.decompositionAt_conj` | D_{σw} = σD_wσ⁻¹. |
| `ArithmeticLocal.inertiaAt_conj` | I_{σw} = σI_wσ⁻¹. |

**Unit tests.**

- `ArithmeticLocal.decompositionAt_stabilizer` (compatibility): D_w is exactly the Mathlib stabilizer, including its action convention.
- `ArithmeticLocal.inertiaAt_bottom` (degenerate): For a number field F, additive inertia at the zero ideal of O_{F̄} is trivial, since integral elements generate F̄ as a field.
- `ArithmeticLocal.inertiaAt_gaussian_two` (computation): For L=Q(i), i²=−1, the image of inertia above 2 in Gal(L/Q) has cardinality 2.

**Source.** deligne73, §3.12, printed p. 533 (Del-33): Deligne restricts finite-image complex global representations at a chosen place. The explicit subgroup carriers here are specializations of the pinned stabilizer/additive-inertia definitions; the absolute completion comparison is the retained parent construction.

**Dependencies.** `mathlib:MulAction.stabilizer`, `mathlib:AddSubgroup.inertia`, `ArithmeticGaloisRepresentations:R01.2/decomposition-group-at-a-place`, `ArithmeticGaloisRepresentations:R01.2/algebraic-closure-of-a-completion-is-generated-by-the-global-closure`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

### 2. Local restriction and coherent change of embedding

For an embedding ι:F̄→F̄_v compatible with F→F_v, j_ι=Field.absoluteGaloisGroup.mapOfAlgebra for its specified algebra structure and ρ_ι=ρ∘j_ι on the R01.1 finite projective carrier. The uncurried action remains continuous. For ι′=ι∘g, j_ι′=conj(g⁻¹)∘j_ι and ρ(g):ρ_ι′→ρ_ι intertwines. These chosen isomorphisms compose when three embeddings are compared; the representation maps themselves need not be equal. Restriction of tensors, duals, twists and coefficient extensions is inherited from R01.1.

**Hypotheses.** F is a number field; F̄ is the fixed algebraic closure. v is finite, ρ is an R01.1 jointly continuous representation over a topological commutative ring on a finite projective module. ι is an actual closure embedding, not the unspecified choice made by Field.absoluteGaloisGroup.map.

**Construction or proof.** Use mapOfAlgebra, whose closure algebra structure is ι. Compose the algebraic representation and its jointly continuous action with the continuous map j_ι. From ι′=ιg obtain j_ι′(h)=g⁻¹j_ι(h)g; multiply by ρ(g) to obtain the intertwining equation. The multiplication law gives the coherence equation. Import transitivity and the image D_w from the parent node. The parent local-restriction node retains the Mackey and finite-image comparisons.

**API.**

| Declaration | Contract |
|---|---|
| `ArithmeticLocal.restrictAlong` | The underlying representation is ρ.comp j; specialize j to j_ι. |
| `ArithmeticLocal.restrictAlong_apply` | ρ_j(h)=ρ(j(h)). |
| `ArithmeticLocal.restrictAlong_continuous` | Joint continuity of ρ and continuity of j imply joint continuity of ρ_j. |
| `ArithmeticLocal.restrictAlong_id` | Restriction along the identity is ρ. |
| `ArithmeticLocal.restrictAlong_comp` | Restricting along j and then k equals restricting along j∘k. |
| `ArithmeticLocal.restrictAlong_change` | ρ(g)ρ_{conj(g⁻¹)j}(h)=ρ_j(h)ρ(g). |

**Unit tests.**

- `ArithmeticLocal.restrictAlong_trivial` (degenerate): Restricting the trivial representation remains trivial.
- `ArithmeticLocal.restrictAlong_agrees_comp` (compatibility): The underlying representation equals Mathlib composition, not a representation on a new carrier.
- `ArithmeticLocal.restrictAlong_conjugate_not_equal` (non-example): If ρ(g⁻¹j(h)g)≠ρ(j(h)) for some h, the two restriction homomorphisms are unequal despite the canonical intertwiner.

**Source.** deligne73, §3.12, printed p. 533: Deligne restricts finite-image complex representations at a chosen place. The arbitrary-coefficient jointly continuous restriction and coherent change-of-embedding equation here are derived from R01.1 restriction, the pinned closure map and representation composition.

**Dependencies.** `ArithmeticGaloisRepresentations:R01.2/global-place-subgroup-carriers`, `mathlib:Field.absoluteGaloisGroup.mapOfAlgebra`, `mathlib:Representation`, `ArithmeticGaloisRepresentations:R01.1/continuous-representation`, `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`, `ArithmeticGaloisRepresentations:R01.2/local-restriction`.

### 3. Residual fundamental characters

Let K have residue field F_{p^f} and let n>0. Choose in K̄ a finite unramified U/K whose absolute residue degree g is divisible by n (for example g=lcm(f,n)), and let S⊆k_U be its subfield of cardinality p^n. The existing order-(p^n−1) tame Kummer component has integral values in μ_{p^n−1}(O_U). Reduce those values, restrict them to S×, then use a specified embedding S→k. This defines θ_n:I_K→k×, with kernel containing wild inertia; its n fundamental conjugates are θ_n^{p^i}, 0≤i<n. For K=Q_p one may take g=n and S=k_U. The residual character, its Teichmüller lift and an ℓ-adic character remain separate objects. No embedding k_U→k is required when only S embeds into k.

**Hypotheses.** K has finite residue field F_{p^f}; n>0; U/K is a specified finite unramified extension with n dividing its absolute residue degree. S⊆k_U has cardinality p^n and ι:S→k is a specified field embedding. The finite tame components and their root formula come from LocalFieldsRamification Layer 4; the unramified fields and residue comparison come from Layer 2.

**Construction or proof.** Import the finite component of inertiaTameCharacter; its roots are unramified and integral. Transport the order-(p^n−1) roots into U and include them into μ_{#k_U−1}(O_U). Reduce using rootsOfUnityEquivResidueFieldUnits U. Their residues satisfy x^{p^n−1}=1 and hence lie in S×; restrict the values to S before applying ι. If K=Q_p and U has degree n, S is the whole residue field. Surjectivity, independence of uniformizer/root and transition under powering are imported finite-level properties, preserved by reduction. For n=2 over Q_p, norm compatibility gives θ₂^{p+1}=θ₁; composition with residue Frobenius gives θ₂ and θ₂^p. Parent cyclotomic comparison gives θ₁=χ̄_p|I.

**API.**

| Declaration | Contract |
|---|---|
| `ArithmeticLocal.residualFundamental` | Whole-residue adapter: for θ:I→μ_{#k_U−1}(O_U) and an embedding ι:k_U→k, compose reduction with ι. This special case requires k to contain all of k_U. |
| `ArithmeticLocal.residualFundamental_apply` | The value is ι applied to the residue of θ(σ). |
| `ArithmeticLocal.residualFundamental_order` | Every value has order dividing #k_U−1. |
| `ArithmeticLocal.residualFundamental_surjective` | With identity residue embedding and surjective θ the character is onto k_U×. |
| `ArithmeticLocal.residualFundamental_kernel` | Its kernel equals the finite Kummer component’s kernel, because both reduction and ι are injective on these roots. |
| `ArithmeticLocal.residualFundamentalSubfield` | Given S⊆k_U, θ:I→μ_{#k_U−1}(O_U), proofs that all reduced values lie in S, and ι:S→k, restrict the reduced units to S× and embed into k×. |
| `ArithmeticLocal.residualFundamentalSubfield_apply` | The value is ι applied to the reduced value θ(σ) regarded as an element of S. |
| `ArithmeticLocal.residualFundamentalSubfield_order` | Every value has order dividing #S−1, in particular p^n−1 when #S=p^n. |
| `ArithmeticLocal.residualFundamentalSubfield_kernel` | The kernel equals θ.ker: reduction on these roots and the embedding of S are injective. |
| `ArithmeticLocal.residualFundamentalSubfield_surjective` | If the reduced θ covers S×, the subfield adapter with identity coefficient embedding is onto S×. |

**Unit tests.**

- `ArithmeticLocal.residualFundamental_identity` (compatibility): For the identity residue embedding, it equals rootsOfUnityEquivResidueFieldUnits composed with θ.
- `ArithmeticLocal.residualFundamental_one` (degenerate): A trivial supplied component gives the trivial residual character.
- `ArithmeticLocal.residualFundamental_teichmuller` (computation): If θ(σ) is the Teichmüller lift of a residue unit a, its residual value is ι(a).
- `ArithmeticLocal.residualFundamentalSubfield_top` (compatibility): For S=k_U and the coefficient embedding induced from ι:k_U→k, the subfield adapter equals residualFundamental U θ ι.
- `ArithmeticLocal.residualFundamentalSubfield_one` (degenerate): A trivial component gives the trivial character for every selected subfield and embedding.
- `ArithmeticLocal.residualFundamentalSubfield_primitive` (computation): If θ(σ) has order m, its subfield residual value also has order m; primitive order is preserved even when only S embeds into k.

**Source.** serre72, §1.3 Proposition 2, p. 264; §1.7 fundamental-character examples, p. 267: Finite tame components become finite-field unit characters by reduction; residue-field embeddings give their conjugates.

**Dependencies.** `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`, `tauceti:TauCeti.rootsOfUnityEquivResidueFieldUnits`, `ArithmeticGaloisRepresentations:R01.2/tame-inertia-and-fundamental-characters`.

### 4. Level of a finite tame character

For p prime, k of characteristic p and χ:I_t→k× with finite image, its level is the least positive n for which χ(σ)^{p^n−1}=1 for every σ. Equivalently it is the multiplicative order of p modulo the exponent m of the image, with the convention level(1)=1 when m=1. It is the length of the Frobenius orbit of χ. Thus a primitive level-two character has level 2 even when its norm to F_p× is trivial (in particular at p=2).

**Hypotheses.** p is prime; k is a field of characteristic p; χ has finite image. Continuous residual inertia characters have finite image because their coefficients are discrete and inertia is compact.

**Construction or proof.** A finite subgroup of a field’s units is cyclic, of order m prime to p. The set of positive n with m dividing p^n−1 is nonempty; its least element divides precisely the other such n. Use this to prove the degree/divisibility API. Frobenius χ↦χ^p has orbit length this least n. This distinguishes field of values from dimension or residue cardinality of K. A one-dimensional character kills conjugation: the arithmetic p-power relation in the tame quotient of G_{Q_p} forces (χ|I)^p=χ|I. Thus its level is 1, excluding a primitive level-two fundamental character as such a restriction.

**API.**

| Declaration | Contract |
|---|---|
| `ArithmeticLocal.tameLevel` | Least positive n with every value satisfying x^{p^n−1}=1; the prototype uses the infimum in N. |
| `ArithmeticLocal.tameLevel_pos` | The finite-image, characteristic-p hypotheses imply a positive level. |
| `ArithmeticLocal.tameLevel_dvd_iff` | For n>0, level χ divides n iff all values satisfy x^{p^n−1}=1. |
| `ArithmeticLocal.tameLevel_frobenius` | level(χ^p)=level χ. |
| `ArithmeticLocal.tameLevel_one_iff` | level χ=1 iff χ^p=χ. |

**Unit tests.**

- `ArithmeticLocal.tameLevel_trivial` (degenerate): The trivial character has level 1, not 0.
- `ArithmeticLocal.tameLevel_two` (computation): If all values have order dividing p²−1 and one value has order p²−1, the level is 2.
- `ArithmeticLocal.tameLevel_one_from_extension` (non-example): For j:I→G, a one-dimensional character χ:G→k× with finite inertia image, and Φ satisfying Φj(σ)Φ⁻¹=j(σ)^p, the restriction χ∘j has level 1. Specialize to the tame quotient of G_{Q_p}.

**Source.** serre72, §1.7, pp. 266–267, finite characters and the fundamental-character examples: The finite tame character group and its fundamental-character conjugates supply the finite-field interpretation; the minimal degree follows from their Frobenius orbit.

**Dependencies.** `ArithmeticGaloisRepresentations:R01.2/residual-fundamental-character-bridge`, `ArithmeticGaloisRepresentations:R01.2/tame-inertia-and-fundamental-characters`.

### 5. Weil–Deligne object

A Weil–Deligne object is (V,r,N), with r a representation of W_K whose inertia kernel is open, N a nilpotent Ω-linear endomorphism, and r(w)N=q^{deg(w)}Nr(w). Inertia is compact, so its image under r is finite. The coefficients of r are treated discretely for smoothness: joint ℓ-adic continuity of a Galois representation is a different condition. Arithmetic Φ has degree 1 and gives q; geometric F has degree −1 and gives q⁻¹. This replaces the bundled carrier of the parent at assembly.

**Hypotheses.** K is nonarchimedean local, with finite residue cardinality q>1. W_K and its topology, compact open I_K and the surjective arithmetic degree come from ClassFieldTheory Layer 9. Ω is a characteristic-zero field and V is finite dimensional. The generic prototype exposes W, degree and q without claiming it constructs W_K.

**Construction or proof.** Take the underlying Mathlib Representation on a finite-dimensional space; record the open inertia kernel and nilpotent N. Impose the scalar conjugation equation with arithmetic degree. Cosets of the open kernel cover compact inertia, proving finite inertial image. The nilpotent zero operator includes every smooth Weil representation, including ramified ones.

**API.**

| Declaration | Contract |
|---|---|
| `WeilDeligneRep` | Fields r, open_inertia_kernel, N, nilpotent and relation; V’s finite-dimensionality is a parameter. |
| `WeilDeligneRep.relation_arith` | For deg Φ=1, r(Φ)N=qNr(Φ). |
| `WeilDeligneRep.relation_geom` | For deg F=−1, r(F)N=q⁻¹Nr(F). |
| `WeilDeligneRep.relation_inertia` | N commutes with the inertia action. |
| `WeilDeligneRep.finite_inertia_image` | Open kernel on compact inertia implies finite inertia image. |
| `WeilDeligneRep.ext` | On the same V, equality of r and N implies equality of objects. |
| `WeilDeligneRep.ofSmooth` | A smooth Weil representation r gives (r,0). |
| `WeilDeligneRep.ofSmooth_N` | The zero-monodromy inclusion has N=0. |

**Unit tests.**

- `WeilDeligneRep.zero_monodromy` (degenerate): The trivial smooth representation has N=0.
- `WeilDeligneRep.arithmetic_sign` (non-example): For q>1 and N≠0 the arithmetic relation cannot simultaneously hold with q⁻¹ in place of q.
- `WeilDeligneRep.smooth_not_unramified` (non-example): A smooth ramified r with r(σ)≠1 stays ramified in (r,0); zero monodromy does not assert unramifiedness.

**Source.** deligne73, Definition 8.4.1 and (8.4.1.1), printed p. 568 (Del-68): The object combines a smooth Weil action and nilpotent endomorphism with the Frobenius scaling relation. bh06, §31.1, pp. 200–201; §32.2, p. 203: The carrier and its coefficient-field extension are described with a finite-dimensional smooth Weil representation.

**Dependencies.** `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `mathlib:Representation`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`.

### 6. Weil–Deligne morphisms

A morphism (V,r,N)→(V′,r′,N′) is an Ω-linear map f with fr(w)=r′(w)f for all w and fN=N′f. Identity and composition are the underlying linear ones. An isomorphism has an invertible underlying linear map satisfying both equations. Kernels and cokernels inherit r and N, giving the abelian finite-length category used by semisimplification; these structural assertions remain proof steps, not independent planet nodes.

**Hypotheses.** K is nonarchimedean local, with finite residue cardinality q>1. W_K and its topology, compact open I_K and the surjective arithmetic degree come from ClassFieldTheory Layer 9. Ω is a characteristic-zero field and V is finite dimensional. The generic prototype exposes W, degree and q without claiming it constructs W_K.

**Construction or proof.** Build the morphism structure from a linear map and the two explicit equations. Identity, zero and composition satisfy both equations; associativity follows from linear composition. Kernels and quotients are stable under r and N. Nilpotence descends, and the same open inertia kernel still acts trivially. Finite dimensionality bounds strict subobject chains.

**API.**

| Declaration | Contract |
|---|---|
| `WeilDeligneRep.Hom` | A linear map with equivariant and monodromy equations. |
| `WeilDeligneRep.Iso` | A linear equivalence with the same equations. |
| `WeilDeligneRep.Hom.id` | Identity is a WD morphism. |
| `WeilDeligneRep.Hom.comp` | Compose the underlying linear maps. |
| `WeilDeligneRep.Hom.ext` | Morphisms are equal when their linear maps are equal. |
| `WeilDeligneRep.Hom.comp_apply` | (g∘f)(v)=g(f(v)). |
| `WeilDeligneRep.Hom.comp_id` | Composition with identity on the source preserves f. |
| `WeilDeligneRep.Hom.id_comp` | Composition with identity on the target preserves f. |
| `WeilDeligneRep.Hom.comp_assoc` | WD morphism composition is associative. |
| `WeilDeligneRep.Iso.refl` | The identity linear equivalence gives a WD isomorphism D→D. |
| `WeilDeligneRep.Iso.symm` | Invert the underlying linear equivalence and obtain a WD isomorphism in the reverse direction. |
| `WeilDeligneRep.Iso.trans` | Compose two WD isomorphisms, with underlying equivalence g∘f. |
| `WeilDeligneRep.Iso.refl_apply` | The identity WD isomorphism sends v to v. |
| `WeilDeligneRep.Iso.symm_apply` | The inverse WD isomorphism acts by the inverse linear equivalence. |
| `WeilDeligneRep.Iso.trans_apply` | The composite WD isomorphism sends v to g(f(v)). |

**Unit tests.**

- `WeilDeligneRep.Hom.id_value` (computation): Identity sends each vector to itself.
- `WeilDeligneRep.Hom.zero` (degenerate): The zero linear map is a morphism between any two objects.
- `WeilDeligneRep.Hom.requires_monodromy` (non-example): On the same vector space, when N≠N′ the identity linear map is not a WD morphism, even if the Weil actions agree.

**Source.** bh06, §31.1, p. 200; §31.2, p. 200; §32.2, p. 203: Morphisms commute with both the Weil action and monodromy; the finite-dimensional category carries the usual linear operations.

**Dependencies.** `ArithmeticGaloisRepresentations:R01.2/weil-deligne-object-carrier`, `mathlib:Representation`.

### 7. Direct sum of Weil–Deligne objects

D⊕D′ has underlying V×V′, diagonal Weil action and N⊕N′. This is a biproduct in WD_Ω(K).

**Hypotheses.** K is nonarchimedean local, with finite residue cardinality q>1. W_K and its topology, compact open I_K and the surjective arithmetic degree come from ClassFieldTheory Layer 9. Ω is a characteristic-zero field and V is finite dimensional. The generic prototype exposes W, degree and q without claiming it constructs W_K.

**Construction or proof.** Use the product representation, with each action and N acting componentwise. Intersect the open inertia kernels; nilpotence is bounded by the maximum of the two exponents. The coordinate inclusions and projections satisfy the two morphism equations. Pair two morphisms into the product and add two morphisms out of it. Componentwise equivariance and monodromy give both equations; equality on all vectors gives uniqueness. These two universal properties establish the biproduct claim.

**API.**

| Declaration | Contract |
|---|---|
| `WeilDeligneRep.sum` | WD object on V×V′. |
| `WeilDeligneRep.sum_r` | r(w)(v,v′)=(r(w)v,r′(w)v′). |
| `WeilDeligneRep.sum_N` | N(v,v′)=(Nv,N′v′). |
| `WeilDeligneRep.sum_inclusion` | v↦(v,0) is a WD morphism. |
| `WeilDeligneRep.sum_projection` | (v,v′)↦v is a WD morphism. |
| `WeilDeligneRep.sumFamily` | Finite direct sum on a dependent product of finite-dimensional spaces; the empty family gives the zero object. |
| `WeilDeligneRep.sumFamily_r` | The Weil action of the finite family is componentwise. |
| `WeilDeligneRep.sumFamily_N` | The monodromy of the finite family is componentwise. |
| `WeilDeligneRep.sum_lift` | For f:X→D and g:X→D′ there is a unique WD morphism h:X→D⊕D′ with h(x)=(f(x),g(x)). |
| `WeilDeligneRep.sum_desc` | For f:D→X and g:D′→X there is a unique WD morphism h:D⊕D′→X with h(v,v′)=f(v)+g(v′). |

**Unit tests.**

- `WeilDeligneRep.sum_rank` (computation): The underlying dimension is dim V+dim V′.
- `WeilDeligneRep.sum_kernel` (characterisation): N_sum(v,v′)=0 iff Nv=0 and N′v′=0.
- `WeilDeligneRep.sum_zero` (degenerate): If both monodromies vanish, the direct-sum monodromy vanishes.
- `WeilDeligneRep.sum_special_weights` (computation): At arithmetic degree 1, Sp(2)⊕Sp(1) sends (e₁,1) to (q e₁,1), detecting a mistaken trivial action or a shared scalar on both summands.

**Source.** bh06, §31.2, p. 200: The additive category admits direct sums with componentwise monodromy.

**Dependencies.** `ArithmeticGaloisRepresentations:R01.2/weil-deligne-object-carrier`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-morphism-carrier`.

### 8. Tensor product of Weil–Deligne objects

D⊗D′ has underlying V⊗ΩV′, the Mathlib tensor representation, and N⊗1+1⊗N′. Both summands are necessary. Tensoring WD morphisms gives WD morphisms.

**Hypotheses.** K is nonarchimedean local, with finite residue cardinality q>1. W_K and its topology, compact open I_K and the surjective arithmetic degree come from ClassFieldTheory Layer 9. Ω is a characteristic-zero field and V is finite dimensional. The generic prototype exposes W, degree and q without claiming it constructs W_K.

**Construction or proof.** Use Representation.tprod for the action. The two monodromy summands commute; if N^a=0 and N′^b=0 with a,b>0, the binomial expansion vanishes in degree a+b−1. Tensor the scaling relations; their common scalar is q^{deg w}. Intersect inertia kernels and use tensor-product functoriality.

**API.**

| Declaration | Contract |
|---|---|
| `WeilDeligneRep.tensor` | The tensor WD object. |
| `WeilDeligneRep.tensor_r` | The Weil representation equals Representation.tprod. |
| `WeilDeligneRep.tensor_N` | N(v⊗v′)=Nv⊗v′+v⊗N′v′. |
| `WeilDeligneRep.tensor_map` | 1⊗f is a WD morphism for every WD morphism f. |
| `WeilDeligneRep.tensor_nilpotent_bound` | N_tensor^{a+b−1}=0 if the positive nilpotence bounds are a and b. |

**Unit tests.**

- `WeilDeligneRep.tensor_rank` (computation): The dimension is dim V·dim V′.
- `WeilDeligneRep.tensor_zero_N` (degenerate): Both zero monodromies give zero tensor monodromy.
- `WeilDeligneRep.tensor_both_summands` (non-example): If Nv⊗v′≠0, the tensor monodromy evaluated on v⊗v′ differs from v⊗N′v′; omitting the first summand fails.

**Source.** bh06, §31.2, p. 200: Tensor monodromy is the sum of the operators on the two factors.

**Dependencies.** `ArithmeticGaloisRepresentations:R01.2/weil-deligne-object-carrier`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-morphism-carrier`, `mathlib:Representation.tprod`.

### 9. Dual Weil–Deligne object

D∨ has underlying V∨, action r∨(w)(f)=f∘r(w⁻¹) and monodromy −N∨, so N_dual(f)(v)=−f(Nv). A morphism dualizes contravariantly.

**Hypotheses.** K is nonarchimedean local, with finite residue cardinality q>1. W_K and its topology, compact open I_K and the surjective arithmetic degree come from ClassFieldTheory Layer 9. Ω is a characteristic-zero field and V is finite dimensional. The generic prototype exposes W, degree and q without claiming it constructs W_K.

**Construction or proof.** Use Representation.dual for the inverse-transpose action. Define monodromy by negative transpose. The Leibniz identity for the evaluation pairing forces the minus sign. Transpose the conjugation relation, and retain nilpotence and the open inertia kernel.

**API.**

| Declaration | Contract |
|---|---|
| `WeilDeligneRep.dual` | The WD object on the linear dual. |
| `WeilDeligneRep.dual_r` | Its Weil representation equals Mathlib Representation.dual. |
| `WeilDeligneRep.dual_N` | N_dual(f)(v)=−f(Nv). |
| `WeilDeligneRep.dual_map` | f:D→D′ induces f∨:D′∨→D∨. |
| `WeilDeligneRep.dual_rank` | The dual has the same dimension. |

**Unit tests.**

- `WeilDeligneRep.dual_zero_N` (degenerate): Zero N gives zero dual N.
- `WeilDeligneRep.dual_negative_sign` (non-example): If f(Nv)≠0, dual monodromy differs from the positive transpose.
- `WeilDeligneRep.dual_pairing` (compatibility): (r∨(w)f)(r(w)v)=f(v).

**Source.** bh06, §31.2, p. 200: Dual monodromy has the negative transpose sign and tensor-compatible evaluation.

**Dependencies.** `ArithmeticGaloisRepresentations:R01.2/weil-deligne-object-carrier`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-morphism-carrier`, `mathlib:Representation.dual`.

### 10. Special Weil–Deligne representation

Sp(n), n≥0, has basis e₀,…,e_{n−1}, r(w)e_i=q^{i deg(w)}e_i, N(e_i)=e_{i+1}, and N(e_{n−1})=0. Sp(0) is the zero object and Sp(1) is trivial. This is the unnormalised convention of the parent: the normalized Sp(n) in Bushnell–Henniart §31.1 is obtained by twisting this object by ω^{(1−n)/2}; classification absorbs that twist into the irreducible Weil factor. No square root of q is required here.

**Hypotheses.** K is nonarchimedean local, with finite residue cardinality q>1. W_K and its topology, compact open I_K and the surjective arithmetic degree come from ClassFieldTheory Layer 9. Ω is a characteristic-zero field and V is finite dimensional. The generic prototype exposes W, degree and q without claiming it constructs W_K. The generic special constructor explicitly requires q≠0 ([NeZero q]); this is weaker than the arithmetic hypothesis q>1 and ensures negative-degree weights are invertible.

**Construction or proof.** With q≠0, the powers q^{i deg(w)} define multiplicative invertible weights, including at negative degree. Construct their diagonal action and the single nilpotent Jordan string. The next weight is q times the preceding weight, proving the arithmetic relation. Inertia acts trivially. Powers of N shift by their exponent; N^n=0, and for n>0 its kernel is the final basis line.

**API.**

| Declaration | Contract |
|---|---|
| `WeilDeligneRep.special` | The unnormalised WD object Sp(n) on Fin n→Ω, with explicit [NeZero q] so every Weil weight is invertible. |
| `WeilDeligneRep.special_r` | At coordinate i, r(w) multiplies by q^{i deg(w)}. |
| `WeilDeligneRep.special_N` | Coordinate 0 becomes 0; coordinate i>0 takes the former coordinate i−1. |
| `WeilDeligneRep.special_nilpotence` | N^n=0. |
| `WeilDeligneRep.special_kernel` | For n>0, ker N has dimension 1. |
| `WeilDeligneRep.special_inertia` | Every inertia element acts as the identity. |

**Unit tests.**

- `WeilDeligneRep.special_zero` (degenerate): Sp(0) has zero monodromy.
- `WeilDeligneRep.special_one` (computation): Sp(1) has trivial Weil action and N=0.
- `WeilDeligneRep.special_two` (computation): For Sp(2), N(e₀)=e₁, rather than the reverse shift or zero.
- `WeilDeligneRep.special_geometric_weight` (computation): For degree −1, the Weil action on Sp(2) sends e₁ to q⁻¹e₁, detecting the Frobenius sign and the negative-power convention.

**Source.** bh06, §31.1, p. 200, special representations; §31.2 Exercise, p. 201: The special monodromy string is the building block for Frobenius-semisimple indecomposables; its normalization is translated by the stated character twist.

**Dependencies.** `ArithmeticGaloisRepresentations:R01.2/weil-deligne-object-carrier`.

### 11. The monodromy operator

For K with residue cardinality q=p^f, ℓ≠p, E/Q_ℓ finite, V/E finite dimensional and a jointly continuous representation ρ of W_K, import the parent Grothendieck theorem. For an additive trivialisation t of t_ℓ, let N_t be its unique nilpotent endomorphism with ρ(σ)=exp(t(σ)N_t) on some open subgroup of inertia. The intrinsic operator is Z_ℓ(1)→End_E(V); the scalar N_t depends inversely on the trivialisation. Thus N_{at}=a⁻¹N_t. It obeys ρ(w)N_t=q^{deg(w)}N_tρ(w), is zero exactly when the inertia image is finite, and upon L/K restriction becomes e(L/K)N_t with compatible tame coordinates.

**Hypotheses.** K is nonarchimedean local with finite residue field; ℓ is prime different from p. E is finite over Q_ℓ with its ℓ-adic topology; V is finite dimensional with module topology; the action is jointly continuous. t is the actual tame character after a trivialisation, not an arbitrary homomorphism from inertia.

**Construction or proof.** Use the parent quasi-unipotence theorem and the existing tame character. Bushnell–Henniart §32.5 proves existence for finite residue fields: shrink to matrices congruent to 1 modulo ℓ², kill the prime-to-ℓ kernel, factor through t, and use the q-power eigenvalue permutation to obtain unipotence. A nilpotent logarithm of a nonzero tame coordinate determines N uniquely. Finite exponential/logarithm inversion is the parent result and Mathlib exp API. Compare ρ(σ)=exp(t(σ)N_t) after scaling t and conjugating by w; uniqueness gives the inverse scaling and arithmetic relation. The suggested signature chooses from the explicit unique-existence witness. It does not purport to prove that witness for a fake Weil group.

**API.**

| Declaration | Contract |
|---|---|
| `ArithmeticLocal.monodromyOperator` | Choose the unique N supplied by Grothendieck’s explicit nilpotent/open-inertia exponential characterization. |
| `ArithmeticLocal.monodromyOperator_nilpotent` | The chosen N is nilpotent. |
| `ArithmeticLocal.monodromyOperator_spec` | There is an open J in inertia with ρ(σ)=exp(t(σ)N) for all σ∈J. |
| `ArithmeticLocal.monodromyOperator_unique` | Any nilpotent operator with that open-inertia property equals the chosen operator. |
| `ArithmeticLocal.monodromyOperator_scale` | For a≠0, changing t to at replaces N by a⁻¹N. |

**Unit tests.**

- `ArithmeticLocal.monodromyOperator_zero` (degenerate): A representation trivial on inertia has N=0.
- `ArithmeticLocal.monodromyOperator_exp_generator` (computation): When ρ|I=exp(tN₀) for nilpotent N₀, the chosen operator is N₀.
- `ArithmeticLocal.monodromyOperator_witness_independent` (characterisation): Two proofs of the unique-existence witness produce the same operator.

**Source.** bh06, §32.5 Theorem and Lemma, pp. 204–205; §32.6 (32.6.1), pp. 205–206: A continuous ℓ-adic Weil representation has a unique nilpotent operator controlling open inertia, and conjugation scales it by the Weil norm. deligne73, §8.1–8.2, printed pp. 566–567: The intrinsic operator uses the Tate-twisted tame character before choosing a scalar coordinate.

**Dependencies.** `ArithmeticGaloisRepresentations:R01.2/grothendieck-quasi-unipotence`, `ArithmeticGaloisRepresentations:R01.2/nilpotent-exponential-and-unipotent-logarithm`, `ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`, `mathlib:IsNilpotent.exp`, `mathlib:IsNilpotent.exp_add_of_commute`.

### 12. Weil–Deligne representation of an ℓ-adic representation

Choose a geometric Frobenius F (degree −1) and the trivialisation t. Every w is uniquely F^nσ with σ∈I_K. Set r_{F,t}(F^nσ)=ρ(F^nσ)exp(−t(σ)N_t); retain N_t. This is a Weil–Deligne object. The correction has open kernel on inertia, is multiplicative by the tame equivariance and the monodromy relation, and leaves r(F)=ρ(F). It gives the parent exact fully faithful tensor equivalence for continuous ℓ-adic Weil representations. Only the bounded objects extend continuously to G_K; no assertion is made that every WD object comes from G_K.

**Hypotheses.** All monodromy-operator hypotheses hold; F is geometric and t uses the same choice as N_t.

**Construction or proof.** Use the unique F^nσ coordinates from arithmetic degree. Apply exp_add_of_commute and the tame conjugation equation to multiply corrected operators. On the open subgroup where ρ(σ)=exp(t(σ)N_t), the correction cancels; thus r has open inertia kernel. Because exp(−tN_t) commutes with N_t, the conjugation relation is unchanged. Import the parent inverse construction, exactness, tensor/dual/restriction/induction compatibility and inertia-invariants comparison instead of introducing a second equivalence node.

**API.**

| Declaration | Contract |
|---|---|
| `ArithmeticLocal.ofEllAdic` | The corrected object (r_{F,t},N_t). The prototype takes N, its relation, tame equivariance and the explicit open corrected-kernel consequence as inputs. |
| `ArithmeticLocal.ofEllAdic_r` | r(F^nσ)=ρ(F^nσ)exp(−t(σ)N). |
| `ArithmeticLocal.ofEllAdic_N` | The object’s monodromy is the supplied N_t. |
| `ArithmeticLocal.ofEllAdic_smooth` | For N_t=0, the corrected Weil action is the original ρ. |

**Unit tests.**

- `ArithmeticLocal.ofEllAdic_frobenius` (computation): The corrected geometric Frobenius is exactly ρ(F).
- `ArithmeticLocal.ofEllAdic_cancels_inertia` (characterisation): For σ where ρ(σ)=exp(t(σ)N), corrected r(σ)=1.
- `ArithmeticLocal.ofEllAdic_zero_operator` (degenerate): With N=0, the object has monodromy zero and its Weil representation equals ρ.

**Source.** bh06, §32.6 Theorem, formulas (32.6.2)–(32.6.3), pp. 206–207: The exponential correction converts a continuous ℓ-adic action to a smooth Weil action and gives an equivalence. deligne73, §8.4.2, printed p. 569: The scalar WD object is formed after choosing geometric Frobenius and a Tate-twist coordinate.

**Dependencies.** `ArithmeticGaloisRepresentations:R01.2/canonical-local-monodromy-operator`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-object-carrier`, `mathlib:IsNilpotent.exp_add_of_commute`, `ArithmeticGaloisRepresentations:R01.2/grothendieck-monodromy-and-the-weil-deligne-functor`, `ArithmeticGaloisRepresentations:R01.2/ell-adic-representation-of-a-weil-deligne-representation`.

### 13. Choice independence of the Weil–Deligne object

For geometric F′=Fτ, τ∈I_K, let A=exp((q−1)⁻¹t(τ)N_t). Then A r_{F,t}(w)=r_{F′,t}(w) A and A N_t=N_t A. For t′=at, a∈Q_ℓ×, r_{F,t′}=r_{F,t} and N_{t′}=a⁻¹N_t. For any nonzero b in the coefficient field, (r,bN) is isomorphic to (r,N), by an automorphism commuting with r. Consequently the isomorphism class WD(ρ) is independent of F and t; the rescaling isomorphism is not asserted canonical. Global change of embedding also preserves this class through coherent local restriction.

**Hypotheses.** The corrected object satisfies its stated local hypotheses, q>1; a is nonzero. The rescaling lemma on generic (W,deg,q) additionally requires compact inertia and surjective degree; the genuine Weil group supplies both.

**Construction or proof.** For F′=Fτ compare the two coordinate formulas. Since ρ(F)Nρ(F)⁻¹=q⁻¹N, conjugation by exp(cN) contributes exp((q−1)cN), giving c=t(τ)/(q−1). For t′=at use uniqueness of monodromy: the product t′N′ is unchanged. Choose a power of Frobenius centralizing the finite inertial image. Split its generalized eigenvalues into q-power orbits, on which N moves by one step. Rescale those steps to obtain a commuting isomorphism from N to bN; descend the construction over the coefficient field as in the parent rescaling node. Use the parent exact equivalence to transport global local-restriction isomorphisms.

**Acceptance.** For geometric F′=Fτ, τ∈I_K, let A=exp((q−1)⁻¹t(τ)N_t). Then A r_{F,t}(w)=r_{F′,t}(w) A and A N_t=N_t A. For t′=at, a∈Q_ℓ×, r_{F,t′}=r_{F,t} and N_{t′}=a⁻¹N_t. For any nonzero b in the coefficient field, (r,bN) is isomorphic to (r,N), by an automorphism commuting with r. Consequently the isomorphism class WD(ρ) is independent of F and t; the rescaling isomorphism is not asserted canonical. Global change of embedding also preserves this class through coherent local restriction.

**Source.** bh06, §32.6, p. 207, change of Frobenius; §32.5, p. 204, uniqueness: The geometric Frobenius change has the explicit exponential conjugator, and the tame-coordinate scaling follows from uniqueness. deligne73, Lemme 8.4.3, printed p. 569: The WD isomorphism class is independent of Frobenius and the scalar Tate coordinate; the latter must be interpreted with the inverse scaling pinned here.

**Dependencies.** `ArithmeticGaloisRepresentations:R01.2/corrected-weil-action-construction`, `ArithmeticGaloisRepresentations:R01.2/coherent-local-restriction`, `ArithmeticGaloisRepresentations:R01.2/rescaling-the-monodromy-operator`, `mathlib:IsNilpotent.exp_add_of_commute`.

### 14. Frobenius semisimplicity

A WD object is Frobenius semisimple if r(w) is semisimple for every w of nonzero degree. With finite inertial image this is equivalent to semisimplicity of r(Φ) for one arithmetic lift, or to semisimplicity of r as a Weil representation. It imposes no condition N=0. The corresponding ℓ-adic condition is semisimplicity of off-inertia Frobenius operators after the exponential correction, as in the parent equivalence.

**Hypotheses.** K is nonarchimedean local, with finite residue cardinality q>1. W_K and its topology, compact open I_K and the surjective arithmetic degree come from ClassFieldTheory Layer 9. Ω is a characteristic-zero field and V is finite dimensional. The generic prototype exposes W, degree and q without claiming it constructs W_K.

**Construction or proof.** A power of Frobenius commutes with the finite inertial image. Maschke’s theorem handles that finite image in characteristic zero. The semisimple and unipotent Jordan factors show that semisimplicity at one degree-one lift is equivalent to semisimplicity at every nonzero degree. This controls r alone; a nonzero nilpotent operator can still link distinct Frobenius weights.

**API.**

| Declaration | Contract |
|---|---|
| `WeilDeligneRep.IsFrobeniusSemisimple` | Every r(w) with nonzero degree is a semisimple endomorphism. |
| `WeilDeligneRep.isFrobeniusSemisimple_iff_arith` | For compact inertia and deg Φ=1, the predicate is equivalent to semisimplicity of r(Φ). |
| `WeilDeligneRep.isFrobeniusSemisimple_iff_weil_semisimple` | For compact inertia and surjective degree, it equals Mathlib semisimplicity of the Weil representation. |
| `WeilDeligneRep.isFrobeniusSemisimple_iso` | The predicate is invariant under WD isomorphism. |
| `WeilDeligneRep.isFrobeniusSemisimple_special` | Every Sp(n) is Frobenius semisimple when q>1. |

**Unit tests.**

- `WeilDeligneRep.fss_special_nonzero_N` (non-example): Sp(2) is Frobenius semisimple and has nonzero N.
- `WeilDeligneRep.fss_trivial` (degenerate): The trivial zero-monodromy object is Frobenius semisimple.
- `WeilDeligneRep.fss_excludes_unipotent_frobenius` (non-example): If r(Φ) is not semisimple for an arithmetic lift, the object is not Frobenius semisimple.

**Source.** bh06, §28.7 Proposition, pp. 185–186; §32.7 Proposition and Theorem, p. 208: Semisimplicity of the Weil action is detected at Frobenius, and is distinguished from semisimplicity of a Deligne object. deligne73, Definition 8.6, printed p. 570: Frobenius semisimplicity describes the corrected Weil operators while retaining monodromy.

**Dependencies.** `ArithmeticGaloisRepresentations:R01.2/weil-deligne-object-carrier`, `ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object`, `mathlib:Representation.IsSemisimpleRepresentation`, `tauceti:LinearMap.GeneralLinearGroup.jordanDecomposition`, `tauceti:LinearMap.GeneralLinearGroup.jordanDecomposition_spec`.

### 15. Frobenius semisimplification

For arithmetic Φ let r(Φ)=su be the existing multiplicative Jordan decomposition. Its unipotent part u commutes with r(W_K) and N. Define r^{Fss}(w)=r(w)u^{−deg(w)}, and D^{Fss}=(V,r^{Fss},N). This construction is independent of the arithmetic lift as an object on the same V, is idempotent, and keeps the full monodromy and inertial action.

**Hypotheses.** K is nonarchimedean local, with finite residue cardinality q>1. W_K and its topology, compact open I_K and the surjective arithmetic degree come from ClassFieldTheory Layer 9. Ω is a characteristic-zero field and V is finite dimensional. The generic prototype exposes W, degree and q without claiming it constructs W_K.

**Construction or proof.** Use the pinned Jordan–Chevalley decomposition, not a new matrix theory. A Frobenius power centralizes the finite inertial image. Its unipotent part centralizes that image and Frobenius; conjugation on N has nonzero scalar weight, so the unipotent factor acts trivially on N. Centrality makes r^{Fss} multiplicative; its inertia action is unchanged and its Frobenius is s. The unipotent part at another arithmetic lift is the same u; independence and idempotence follow.

**API.**

| Declaration | Contract |
|---|---|
| `WeilDeligneRep.frobeniusUnit` | r(Φ) as a GeneralLinearGroup unit, using r(Φ⁻¹) as inverse. |
| `WeilDeligneRep.frobeniusSemisimplify` | The object D^{Fss} on the same V; compact inertia and q>1 are explicit prototype inputs. |
| `WeilDeligneRep.frobeniusSemisimplify_r` | r^{Fss}(w)=r(w)u_Φ^{−deg(w)}. |
| `WeilDeligneRep.frobeniusSemisimplify_N` | N^{Fss}=N. |
| `WeilDeligneRep.frobeniusSemisimplify_fss` | The resulting object is Frobenius semisimple. |
| `WeilDeligneRep.frobeniusSemisimplify_independent` | Two arithmetic lifts give equal objects on V. |
| `WeilDeligneRep.frobeniusSemisimplify_id` | For a Frobenius-semisimple object the result equals D. |

**Unit tests.**

- `WeilDeligneRep.fss_preserves_special` (computation): Sp(2) is unchanged by Frobenius semisimplification.
- `WeilDeligneRep.fss_inertia_unchanged` (compatibility): The new Weil action on every inertia element is the old one.
- `WeilDeligneRep.fss_uses_jordan` (compatibility): The new arithmetic Frobenius is exactly the Tau Ceti semisimplePart of r(Φ).

**Source.** deligne73, §8.5, (8.5.1), Definition 8.6, printed p. 570: The unipotent Frobenius factor is removed from the Weil action while the nilpotent operator is retained.

**Dependencies.** `ArithmeticGaloisRepresentations:R01.2/weil-deligne-object-carrier`, `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimple-predicate`, `tauceti:LinearMap.GeneralLinearGroup.jordanDecomposition`, `tauceti:LinearMap.GeneralLinearGroup.jordanDecomposition_spec`, `tauceti:LinearMap.GeneralLinearGroup.unipotentPart`, `tauceti:LinearMap.GeneralLinearGroup.semisimplePart`.

### 16. Categorical semisimplification

The semisimplification of D in the finite-length abelian WD category has isomorphism class (r^{ss},0), where r^{ss} is the semisimplification of its Weil representation. A chosen representative may be transported back onto V, but that representative and the transport are not canonical. In characteristic zero it is characterized up to isomorphism by N=0, semisimple r and tr r^{ss}(w)=tr r(w) for all w. No exact or canonical semisimplification functor is asserted.

**Hypotheses.** K is nonarchimedean local, with finite residue cardinality q>1. W_K and its topology, compact open I_K and the surjective arithmetic degree come from ClassFieldTheory Layer 9. Ω is a characteristic-zero field and V is finite dimensional. The generic prototype exposes W, degree and q without claiming it constructs W_K.

**Construction or proof.** For a nonzero simple WD object, ker N is a nonzero stable subobject, so N=0. Its Weil action is then irreducible. A WD composition series is also a filtration for r; additivity of trace identifies its sum of simple factors with the R01.1 semisimplification of r. The parent Brauer–Nesbitt/semisimplification results give uniqueness up to isomorphism. Every subquotient retains the same open inertia kernel. Choose a representative and linear transport to V only for the prototype; the mathematical output is the isomorphism class.

**API.**

| Declaration | Contract |
|---|---|
| `WeilDeligneRep.categoricalSemisimplify` | A chosen representative of the categorical semisimplification on V. |
| `WeilDeligneRep.categoricalSemisimplify_N` | Its monodromy is zero. |
| `WeilDeligneRep.categoricalSemisimplify_r` | Its Weil representation is semisimple. |
| `WeilDeligneRep.categoricalSemisimplify_trace` | Its character equals the character of D.r. |
| `WeilDeligneRep.categoricalSemisimplify_unique` | Any zero-monodromy semisimple object on V with the same character is isomorphic to it. |

**Unit tests.**

- `WeilDeligneRep.ss_special_kills_N` (computation): Categorical semisimplification kills the nonzero monodromy of Sp(2).
- `WeilDeligneRep.ss_trivial` (degenerate): The trivial object is unchanged up to isomorphism.
- `WeilDeligneRep.ss_not_fss_on_special` (non-example): Sp(2)^{Fss} is not isomorphic to Sp(2)^{ss}, because the former has nonzero monodromy and the latter has zero monodromy.

**Source.** bh06, §31.1–31.2, pp. 200–201; §32.7, p. 208: The Deligne category and its nonzero-monodromy special objects distinguish categorical semisimplicity from Frobenius semisimplicity; the simple-object argument derives the zero-monodromy semisimplification.

**Dependencies.** `ArithmeticGaloisRepresentations:R01.2/weil-deligne-object-carrier`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-morphism-carrier`, `ArithmeticGaloisRepresentations:R01.1/semisimplification`, `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces`, `mathlib:LinearMap.trace`, `mathlib:Representation.IsSemisimpleRepresentation`.

### 17. Classification by special blocks

Over an algebraically closed characteristic-zero Ω, every nonzero indecomposable Frobenius-semisimple WD object is r₀⊗Sp(n), n≥1, for an irreducible smooth Weil representation r₀, viewed with zero monodromy. Every Frobenius-semisimple object is a finite direct sum of such blocks, and the pairs (isomorphism class of r₀,n) are unique up to permutation. The zero object corresponds to the empty sum. The r₀ factor absorbs the half-norm twist in the normalization used by Bushnell–Henniart.

**Hypotheses.** K is nonarchimedean local, with finite residue cardinality q>1. W_K and its topology, compact open I_K and the surjective arithmetic degree come from ClassFieldTheory Layer 9. Ω is a characteristic-zero field and V is finite dimensional. The generic prototype exposes W, degree and q without claiming it constructs W_K. Ω is algebraically closed; indecomposable means that no nontrivial direct-sum decomposition exists.

**Construction or proof.** Use finite inertia image and Frobenius semisimplicity to decompose the Weil representation into irreducibles. Monodromy is a morphism to the appropriate norm twist. Schur’s lemma makes it move among multiplicity spaces along norm-twist strings; q>1 in characteristic zero prevents a finite cycle. Classify the resulting finite nilpotent strings by their lengths and initial irreducible Weil factor. A single string is r₀⊗Sp(n); multiple strings split as direct sums. The multiplicities and ranks of powers of N along each twist orbit determine the strings uniquely. This supplies the finite-length decomposition argument rather than assuming an unstated general Krull–Schmidt theorem.

**Acceptance.** Over an algebraically closed characteristic-zero Ω, every nonzero indecomposable Frobenius-semisimple WD object is r₀⊗Sp(n), n≥1, for an irreducible smooth Weil representation r₀, viewed with zero monodromy. Every Frobenius-semisimple object is a finite direct sum of such blocks, and the pairs (isomorphism class of r₀,n) are unique up to permutation. The zero object corresponds to the empty sum. The r₀ factor absorbs the half-norm twist in the normalization used by Bushnell–Henniart.

**Source.** bh06, §31.2 Exercise, p. 201; §31.1 normalization, p. 200: The exercise identifies indecomposable Frobenius-semisimple objects as special blocks with an irreducible Weil factor, in the source’s normalized convention. The stated nilpotent-string argument derives finite decomposition and uniqueness; those stronger clauses are not attributed verbatim to the exercise. The printed dimension index of the irreducible factor is corrected independently of the block length; see confirmed source issue ArithmeticGaloisRepresentations/E7947.

**Dependencies.** `ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-tensor-product`, `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimple-predicate`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-morphism-carrier`, `ArithmeticGaloisRepresentations:R01.1/semisimplification`, `mathlib:Representation.IsIrreducible.algebraMap_intertwiningMap_bijective_of_isAlgClosed`.

### 18. Full, Frobenius-semisimple and semisimple objects

For D=Sp(2), D^{Fss}=D, N(D)≠0 and N(D^{ss})=0, so D^{Fss} and D^{ss} are not isomorphic. To distinguish the full object from its Fss as well, take an unramified two-dimensional Weil action with arithmetic Frobenius a nontrivial unipotent Jordan block and N=0: Fss and ss are trivial while the full action is not. In general D, D^{Fss} and D^{ss} denote three separate operations; neither semisimplification may be silently substituted in conductor or inertial-type calculations.

**Hypotheses.** K is nonarchimedean local, with finite residue cardinality q>1. W_K and its topology, compact open I_K and the surjective arithmetic degree come from ClassFieldTheory Layer 9. Ω is a characteristic-zero field and V is finite dimensional. The generic prototype exposes W, degree and q without claiming it constructs W_K.

**Construction or proof.** Compute Sp(2) directly from its basis and use the Fss identity API. Any WD isomorphism conjugates N and therefore preserves its rank; rank 1 cannot equal rank 0. For the second example the degree map into Z is discrete and inertia acts trivially. The Jordan block’s semisimple part is the identity. Its invariant line shows that the original action is not semisimple.

**Acceptance.** For D=Sp(2), D^{Fss}=D, N(D)≠0 and N(D^{ss})=0, so D^{Fss} and D^{ss} are not isomorphic. To distinguish the full object from its Fss as well, take an unramified two-dimensional Weil action with arithmetic Frobenius a nontrivial unipotent Jordan block and N=0: Fss and ss are trivial while the full action is not. In general D, D^{Fss} and D^{ss} denote three separate operations; neither semisimplification may be silently substituted in conductor or inertial-type calculations.

**Source.** deligne73, §8.5–8.6, printed p. 570: Frobenius semisimplification retains N; the two test objects separate it from both the full action and categorical semisimplification. bh06, §31.1, p. 200; §32.7, p. 208: The special representation is the explicit nonzero-monodromy test for Frobenius versus categorical semisimplicity.

**Dependencies.** `ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object`, `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification-construction`, `ArithmeticGaloisRepresentations:R01.2/categorical-semisimplification-construction`.

## Layer acceptance and assembly

The acceptance sequence begins with the actual closure embedding, checks its decomposition image and the coherent conjugation maps, and then tests the residual characters at levels one and two. For Q_p the decisive arithmetic identities are θ₁=χ̄_p|I and θ₂^{p+1}=θ₁. A primitive θ₂ has level two and is not the restriction of a one-dimensional global local character; its two Frobenius conjugates are θ₂ and θ₂^p. At p=2 its norm is trivial but θ₂ has order three and still has level two.

For ℓ≠p the monodromy theorem must instantiate with the actual tame character, an ℓ-adic finite coefficient field and joint continuity. The exponential characterization must determine a unique N, respect inverse scalar change, and give the arithmetic q relation. The corrected action must cancel open inertia and preserve Frobenius. The explicit Fτ conjugator must satisfy both the Weil intertwining equation and the monodromy equation. An isomorphism of Weil representations that fails the latter is not a WD isomorphism.

The final acceptance objects are the zero and rank-one objects, Sp(2), and the unramified Jordan-block action. Sp(2) retains rank-one monodromy under Fss and loses it under categorical ss. The unramified Jordan-block example changes under Fss even though its N was already zero. These examples jointly detect identifying any two of the three operations. Tensor monodromy must include both summands; dual monodromy must have the negative sign. The special-block classification includes the empty direct sum for the zero object and absorbs the source’s normalization twist into r₀.

The Frobenius predicate and constructions cite pinned Jordan decomposition directly, instead of taking the bundled parent Frobenius/classification target as a prerequisite. Assembly replaces the parent bundled carrier and operations with these named refinements, while preserving the principal parent IDs for its comparisons and all ancillary targets. It imports the parent local restriction Mackey formula, ramification sets, Frobenius polynomials, unramified and cyclotomic characters, residual two-dimensional tame classification, inverse WD construction, Euler factors and induced-factor comparison, purity, local constants, and Tate-curve examples. This part closes the classification source-reading request using the cleared Bushnell–Henniart edition. It does not certify the parent’s unrelated local-constant/global-functional-equation gaps, generalized-residue-field reading request, or LPV filtration binding as closed.

Use exactly six planets for the assembled R01.2 layer: **Fundamental characters**, **Weil–Deligne representation**, **Monodromy operator**, **Weil–Deligne functor**, **Frobenius semisimplification**, and **Special-block classification**. Replace the parent planet selection rather than displaying the union. There is no new roadmap direction or Part II proposal: all new arithmetic comparisons stay with the existing R01.2 owner.

## Sources and verification

All source-dependent statements are written in the worker’s own words, with section and printed-page locators. No source passage or extracted book text is included.

- Pierre Deligne, *Les constantes des équations fonctionnelles des fonctions L*, LNM 349 (1973), pp. 501–597, [IAS scan](https://publications.ias.edu/sites/default/files/Number20.pdf). The finite-image complex restriction in §3.12 and §§8.1–8.6 were read; the formula-sensitive pages were checked as images. In particular §8.4.2 is on printed p. 569, Definition 8.4.1 on p. 568, and §§8.5–8.6 on p. 570.
- Jean-Pierre Serre, *Propriétés galoisiennes des points d’ordre fini des courbes elliptiques*, Invent. Math. 15 (1972), pp. 259–331, [author-institution scan](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5874918517843398173_Serre_proprie_te_s_galoisiennes_des_courbes_elliptiques.pdf). Proposition 2, p. 264, and the finite and fundamental characters on pp. 266–267 were read on images.
- Colin J. Bushnell and Guy Henniart, *The Local Langlands Conjecture for GL(2)*, Springer 2006, [publisher record](https://doi.org/10.1007/3-540-31511-X). The maintainer-cleared edition was read in place: §28.7 Proposition pp. 185–186, §§31.1–31.2 pp. 200–201 and §§32.2–32.7 pp. 203–208. Its special representation is normalized; the translation to the unnormalised parent convention is explicit above. Tate’s article in Corvallis Part 2 was not needed after this source supplied the classification and equivalence.

The packet records access date 2026-10-09 and SHA-256 values for the public scans. The packet checker validates closure references and counts eighteen nodes, one hundred and three API items, fifty unit tests and six planets. The suggested file is checked with the shared pinned `lean-check` build; its final elaboration result is recorded in the handoff. Stage R01.2 remains planned with one supplier-binding gap and four supplier requests. None of these counts is an implementation claim.

Independent review: [REV-ArithmeticGaloisRepresentations--R01.2](../reviews/REV-ArithmeticGaloisRepresentations--R01.2.md), accepted after the documented corrections. The supplier-binding and retained ancillary gaps remain explicit.
