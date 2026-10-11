# Weight-zero crystalline automorphy lifting

This roadmap extends the potential-automorphy infrastructure to crystalline weight-zero lifts over CM and totally real fields with p arbitrarily ramified. It assembles the adequate-image Taylor–Wiles arithmetic tower, geometric local-component comparison, nilpotent derived Hecke actions and solvable preparation needed for the weight-zero lifting theorem, and exports the adequate ordinary companion. Local compatibility, crystalline generic reducedness, connects and abstract patching retain their existing owners.

The first target is an automorphy lifting theorem for crystalline representations with labelled Hodge–Tate weights {0,…,n−1}, allowing arbitrary ramification of p in the ground field. A residual automorphic seed on the same crystalline local components supplies the initial supported point. Distinct auxiliary tame characters let the proof compare global components without discarding their p-component labels. The second target exports the adequate ordinary lifting theorem used by the ordinary application of the Bianchi programme. Its local ordinary theory and seed weight are independent of the weight-zero crystalline specialization.

The roadmap extends PotentialAutomorphyInfrastructure. CrystallineLocalGlobalCompatibilityCM supplies the crystalline torsion comparison and the abstract two-system support theorem; PotentialAutomorphyInfrastructurePartII supplies connects. The weight-zero crystalline lifting-ring direction supplies generic reducedness. GlobalGaloisDeformations and DeformationAndDerivedPatchingAlgebra own deformation functors and abstract patching; this roadmap assembles their arithmetic weight-zero instance. SmoothRepresentationsOfLocalGroups owns the selected-block local representation calculations. Soluble base change, local Langlands, ordinarity and class field theory retain their existing owners.

The intended library module is TauCeti/NumberTheory/AutomorphyLifting/WeightZero, with namespace WeightZero. The node identifiers in the companion packet specify its targets. The suggested file types the algebraic interfaces that can be expressed against the baseline; its indexed arithmetic omissions remain part of the specification.

## Notation and conventions

Use a finite p-adic coefficient field E, its ring of integers O, uniformizer ϖ and residue field k, enlarged finitely when needed to contain the relevant characters and geometric component fields. The global theorem is stated over Q̄_p; choose a stable integral model and then a sufficiently large finite E for deformation rings. Absolute residual irreducibility makes the integral model well defined up to the relevant conjugation. Write r̄ for the residual representation, c for CM conjugation and F⁺ for the maximal totally real subfield. In WZ.3, f=[F⁺:Q], s=|S| and d=n²f. The letter q denotes the number of Taylor–Wiles primes; q_v is a residue-field cardinality. In WZ.4 the soluble global extension is named E in the theorem statements; its role is distinct from the coefficient field and can be renamed L in an implementation.

Use geometric local Artin reciprocity and geometric Frobenius in the automorphic Galois dictionary. The spherical polynomial is Σ_{i=0}^n(−1)^i q_v^{i(i−1)/2}T_{v,i}X^{n−i}, with T_{v,0}=1. Weight zero means trivial archimedean infinitesimal character and labelled HT weights {0,…,n−1}; ordinary weight λ has exponents λ_{τ,n−i+1}+i−1 in its inertia formula. The deformation problems have variable determinant and carry no polarization. A fixed-determinant quotient changes the tangent and framing counts.

All components are geometric generic-fibre components descended to a finite coefficient field; arrange their geometric irreducibility before taking completed tensors. A point represented by a map to O also gives a characteristic-zero point after inverting p. Local generic regularity gives a unique p-component label through that point. A nilpotent quotient map identifies spectra but does not create a strict deformation-ring action on a complex. Support is first computed over the honest Hecke image and then transported by the spectral map.

The main crystalline and ordinary statements include n=1. The prepared profile and arithmetic patching branches use n≥2, as required by the CN and adelic suppliers; GL₁ is handled directly by the rank-one local algebraicity and global Hecke-character correspondence. The scalar-outside-cyclotomic hypothesis implies p is odd and ζ_p∉F. Thus a p=2 input never enters the prepared arithmetic branch.

## Existing interfaces

At Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, use the following directly verified declarations. Arithmetic carrier types are supplied by the cited roadmap layers rather than private stand-ins.

- **mathlib:Representation** (Mathlib.RepresentationTheory.Basic): A group homomorphism H→*End_O(O), used for the coefficient action; it imposes no topology or smoothness condition.
- **mathlib:Representation.trivial** (Mathlib.RepresentationTheory.Basic): The identity-endomorphism representation on the same O-module, the exact comparison for trivial auxiliary characters.
- **mathlib:PrimeSpectrum.comap** (Mathlib.RingTheory.Spectrum.Prime.RingHom): The inverse-image map on primes of a commutative ring homomorphism, for spectral transport of the nilpotent Hecke support.
- **mathlib:range_comap_of_surjective** (Mathlib.RingTheory.Spectrum.Prime.RingHom): For a surjective homomorphism the image of Spec comap is the zero locus of its kernel; specialized with a nilpotent kernel this is the whole spectrum.
- **mathlib:Module.support** (Mathlib.RingTheory.Support): The subset of primes where a localized module is nontrivial; used on cohomology modules over the honest Hecke image, followed by Spec pullback.

The current ClassFieldTheory local/global Artin normalization and conductor interfaces are used for GL₁. Current LocalGaloisGroups and ProfiniteArithmetic supply their existing profinite and local-Galois substrate; their carriers do not by themselves supply crystalline deformation rings or an adequate arithmetic tower.

## WZ.0. Prepared arithmetic data and inverse coefficients

For n≥2, fix prepared weight-zero CM arithmetic data: S=S_p⊔R⊔A, the imaginary-quadratic splitting certificates, strict complementary p-degree inequality, adequate and decomposed-generic residual seed, Iwahori bad places and two auxiliary H²=0 places. Construct the actual good level with hyperspecial factors at p, Iwahori factors at R and pro-residue-characteristic Iwahori factors at A. Define its inverse auxiliary character coefficient on the existing scalar module and its fixed trivial residual comparison. Instantiate the variable-determinant crystalline/tame/unrestricted global deformation problem and compatible local/global residual identifications. Export coefficient enlargement and framing count n²|S|−1. The generic selector and scalar coefficient have complete APIs and discriminating four-place, inverse-value, empty and reduction tests.

**Layer dependencies:** `ArithmeticGaloisRepresentations:G7`, `AutomorphicGaloisRepresentationsPartII:AG2.7`, `CrystallineLocalGlobalCompatibilityCM:CL.7`, `ArithmeticLocallySymmetricSpaces:ALS.1`, `PotentialAutomorphyInfrastructure:PA.4`, `GlobalGaloisDeformations:G8`, `LocalGaloisDeformationRings:R08.2`, `LocalGaloisDeformationRings:R08.3`, `DeformationAndDerivedPatchingAlgebra:R03.1`.

### Prepared weight-zero lifting data

**Target:** `WeightZero.PreparedWeightZeroData` (definition); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.0/prepared-profile`.

Fix an imaginary CM field F with maximal totally real subfield F⁺ and conjugation c, n≥2, an odd prime p>n, ι:Q̄_p≅C, and a regular algebraic cuspidal π of GL_n(A_F) of weight zero. PreparedWeightZeroData consists of finite S containing S_p and R⊂S\S_p, with A=S\(R∪S_p), and the following certificates. Every rational prime below S or ramified in F splits in some imaginary quadratic subfield of F. For each p-place v̄ of F⁺ there is another v̄′ above p such that the sum of [F⁺_w:Q_p] over w above p different from both is strictly greater than [F⁺:Q]/2. The residual r̄_ι(π) is absolutely irreducible and decomposed generic, and its restriction to G_{F(ζ_p)} has adequate image. π is unramified at S_p and outside S. At v∈R, π_v has Iwahori fixed vectors, q_v≡1 modulo p and r̄_v is trivial. At v∈A, π_v is unramified, v∉R^c and H²(F_v,ad r̄)=0. A contains two places of different residue characteristics. Enlarge the finite p-adic coefficient field E to contain the Galois closure of F, the residual values, ζ_p, all auxiliary characters and fields of definition of geometric local components. Its ring of integers is O, uniformizer ϖ and residue field k. Neither a polarization nor a fixed determinant is part of these data.

**Construction or proof.**

1. Take the eight arithmetic conditions as separate fields with their actual mathematical meanings; their conjunction is a reusable profile, not a replacement for the supplier definitions of adequacy or decomposed genericity.
2. Use CN Theorem 4.3.1 to identify the seed local representations as crystalline with weights {0,…,n−1}. Coefficient extension is allowed before fixing universal rings.

**Consumer interface.** WZ.1 and WZ.3: Provides the level, local deformation conditions and CN complementary-degree inequality. WZ.4: Specifies exactly the conditions to arrange by solvable preparation.

**API.**

- `WeightZero.PreparedWeightZeroData.partition` (projection): S is the disjoint union S_p⊔R⊔A; all p-places are in the first piece.
- `WeightZero.PreparedWeightZeroData.split` (projection): Every v∈S splits over F⁺ and F/F⁺ is unramified at all finite places, by the imaginary quadratic splitting condition.
- `WeightZero.PreparedWeightZeroData.crystallineSeed` (compatibility): The seed r_ι(π) is crystalline of weight zero at every p-place, by CL.7/thm-4-3-1.
- `WeightZero.PreparedWeightZeroData.extendCoefficients` (functoriality): A finite extension E′/E transports the profile and universal deformation data; after geometric components are defined over E their labels persist under further extension.

**Unit tests.**

- `WeightZero.test_profile_partition` (characterisation): An auxiliary place in A is neither a p-place nor a ramified-type place; changing its assignment to R without trivial residual inertia violates the R certificate.
- `WeightZero.test_profile_degree_boundary` (non-example): With four equal-degree p-places of F⁺, deleting two leaves exactly half the degree and fails the strict inequality; with five equal-degree places it passes.
- `WeightZero.test_profile_ramified_prime` (compatibility): When p ramifies in F, the profile still uses the crystalline quotient, not a Fontaine–Laffaille smoothness certificate.
- `WeightZero.test_profile_no_scalar_at_two` (degenerate): At p=2 the scalar-outside-cyclotomic hypothesis of the final theorem has no witness, since ζ₂∈F; consequently no exceptional p=2 input reaches this profile.

**Acceptance.**

- An absolutely ramified p is allowed.
- The complementary degree sum uses a global degree over Q.
- Pairwise distinct residual Frobenius eigenvalues are not substituted for decomposed genericity.

**Direct dependencies:** `ArithmeticGaloisRepresentations:G7/adequate-subgroup`, `ArithmeticGaloisRepresentations:G7/taylor-wiles-image-conditions`, `AutomorphicGaloisRepresentationsPartII:AG2.7`, `CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-3-1`.

**Sources:** BCGNT25, §3.2, eight preparation conditions, pp. 32–33; Remark 3.2.2, p. 32. Prepared weight-zero lifting data; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.

### Prepared local level factors

**Target:** `WeightZero.LevelFactors` (construction); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.0/prepared-level`.

For the prepared profile, construct K=∏_v K_v inside GL_n(A_F,f), with K_v=GL_n(O_{F_v}) for v∉S or v∈S_p, K_v=Iw_v for v∈R, and K_v=Iw_{v,1} for v∈A. Here Iw is the preimage of the upper triangular Borel under reduction and Iw_{v,1} is its pro-residue-characteristic Iwahori radical, the preimage of the upper unipotent subgroup. These are supplier compact-open groups. The algebraic interface LevelFactors selects among three supplied subgroup families using S,S_p,R; the arithmetic specialization proves compactness, openness, factorization and neatness of their adelic product, and π^K≠0. The two auxiliary residue characteristics ensure neatness; no assertion that a single pro-v factor always suffices is made.

**Construction or proof.**

1. Select the hyperspecial branch first, then the R branch, then the auxiliary branch; the partition prevents conflicting local conditions.
2. Form the adelic compact-open product using ALS.1. At R use Iwahori invariants and at A use unramified seed vectors. Apply the two-prime neatness argument of ACC Lemma 6.5.2.

**Consumer interface.** Proposition 3.2.3 and Theorem 3.2.5: Fixes the cohomology object and its untwisted/twisted coefficient actions.

**API.**

- `WeightZero.LevelFactors.hyperspecial` (simp): If v∉S or v∈S_p, LevelFactors(S,S_p,R,K₀,K_I,K_P)(v)=K₀(v).
- `WeightZero.LevelFactors.iwahori` (simp): If v∈S, v∉S_p and v∈R, the selected subgroup is K_I(v).
- `WeightZero.LevelFactors.proIwahori` (simp): If v∈S, v∉S_p and v∉R, the selected subgroup is K_P(v).
- `WeightZero.LevelFactors.neatProduct` (compatibility): For the prepared arithmetic profile and the supplier local subgroups, the adelic product is a neat compact-open group and is the level used in ALS.1.

**Unit tests.**

- `WeightZero.test_level_hyperspecial` (computation): On four indexed places with S={1,2,3}, S_p={1}, R={2}, both the outside place 0 and place 1 select K₀.
- `WeightZero.test_level_iwahori` (computation): In that four-place example, place 2 selects K_I.
- `WeightZero.test_level_auxiliary` (computation): In that four-place example, place 3 selects K_P.
- `WeightZero.test_level_distinguishes_pro` (non-example): If K_P(3)≠K_I(3), the level at auxiliary place 3 is not K_I(3).

**Acceptance.**

- S_p always has hyperspecial level.
- A has pro-v Iwahori, not full Iwahori.
- K is good in the geometric supplier sense.

**Direct dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.0/prepared-profile`, `ArithmeticLocallySymmetricSpaces:ALS.1`, `PotentialAutomorphyInfrastructure:PA.4/neatness-auxiliary-places`.

**Sources:** BCGNT25, §3.2, local level following condition (8), p. 32. Prepared local level factors; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.

### Inverse auxiliary character coefficients

**Target:** `WeightZero.AuxiliaryCoefficient` (definition); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.0/auxiliary-coefficient`.

Given a finite index set I, groups G_i, a group H, a commutative coefficient ring O, characters χ_i:G_i→Oˣ and a homomorphism θ:H→∏_i G_i, define AuxiliaryCoefficient(χ,θ) to be the representation on the existing O-module O in which h acts on x by (∏_i χ_i(θ(h)_i))⁻¹x. In the arithmetic specialization I consists of pairs (v,i) with v∈R and 1≤i≤n, G_(v,i)=k(v)ˣ, H=K_S and θ is the diagonal reduction of the Iwahori factors, trivial on the other factors. The characters reduce to one modulo ϖ. Require either the entire tuple to be trivial, or the characters at each v∈R to be pairwise distinct; independent choices of these two alternatives at different places are not the stated profile. This definition is the proof-specific coefficient O(χ⁻¹), reusing Mathlib Representation and the scalar module O; it is not a new theory of one-dimensional representations.

**Construction or proof.**

1. Compose the product character with θ, invert it, and let its units act by scalar multiplication as O-linear endomorphisms.
2. The character and scalar-action laws supply the representation laws. Reduction of every χ_i to one makes the entire residual coefficient action trivial, with the identity on O/ϖ as comparison map.

**Consumer interface.** Theorem 3.2.5, patched systems (2),(3),(5): Its fixed residual identity produces the comparison of perfect complexes and common derived Hecke images.

**API.**

- `WeightZero.AuxiliaryCoefficient.apply` (simp): For every h and x the action is (∏_iχ_i(θ(h)_i))⁻¹x.
- `WeightZero.AuxiliaryCoefficient.trivial` (compatibility): If all χ_i=1, the representation equals Representation.trivial O H O on the same module.
- `WeightZero.AuxiliaryCoefficient.ext` (extensionality): Equality of aggregate characters on every h implies equality of the coefficient representations; equality of individual χ_i is sufficient but not necessary.
- `WeightZero.AuxiliaryCoefficient.reduce` (compatibility): For a ring map r:O→k with r(χ_i(g))=1 for every i,g, r(h·x)=r(x); this is the identity comparison with trivial residual coefficients.

**Unit tests.**

- `WeightZero.test_coefficient_inverse` (computation): For one index, H=Qˣ and the identity character/projection, the unit 2 acts on 1 as 1/2.
- `WeightZero.test_coefficient_empty` (degenerate): With I empty, every h fixes every x.
- `WeightZero.test_coefficient_trivial` (compatibility): The all-trivial tuple gives exactly Mathlib Representation.trivial, not a merely abstractly isomorphic module.
- `WeightZero.test_coefficient_reduction` (compatibility): If all characters reduce to one under r:O→k, the reduction of h·x equals r(x).

**Acceptance.**

- The inverse is essential: a character value 2 acts on 1 by 1/2.
- An empty R produces the trivial coefficient.
- Reduction has a specified comparison, not merely an isomorphism class.

**Direct dependencies:** `mathlib:Representation`, `mathlib:Representation.trivial`, `WeightZeroCrystallineAutomorphyLifting:WZ.0/prepared-level`.

**Sources:** BCGNT25, §3.2, character alternatives and O(χ⁻¹), pp. 32–33. Inverse auxiliary character coefficients; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.

### Weight-zero variable-determinant deformation problem

**Target:** `WeightZero.CrystallineGlobalProblem` (construction); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.0/crystalline-global-problem`.

For the prepared profile and an allowed χ tuple, instantiate the imported variable-determinant global problem S_χ=(r̄,S,{O},{D_v}). At v∈S_p choose the framed crystalline quotient with HT_τ={0,…,n−1}; at v∈R use D_v^χ, whose characteristic polynomial on inertia is ∏_{i=1}^n(X−χ_{v,i}(Art_v⁻¹σ)); at v∈A use the full framed lifting functor. D_v^χ uses the character of k(v)ˣ inflated to O_{F_v}ˣ and geometric local Artin reciprocity. The associated unframed ring R_{S_χ}, S-framed ring R^S_{S_χ}, and local base R_loc^χ=completed tensor over O of all R_v are the supplier representing objects, with chosen universal representatives. Write R_p for the completed tensor of the crystalline p-factors, the same for χ and 1. Provide the residual identifications R_loc^χ/ϖ≅R_loc^1/ϖ and R_{S_χ}/ϖ≅R_{S_1}/ϖ, compatible with the chosen residual universal representations. No determinant is imposed and the framing count is n²|S|−1.

**Construction or proof.**

1. Insert the three local conditions in the G8 functor, using the crystalline point criterion and the tame characteristic-polynomial quotient.
2. Use G8 representability and its chosen S-framing comparison. Away from p, the χ and trivial characteristic-polynomial ideals agree modulo ϖ; extend through completed tensor products and global representing functors.

**Consumer interface.** Proposition 3.2.3: Receives the actual torsion Hecke Galois representation. Lemma 3.2.4 and patching: Supplies local components and the residual comparison for both systems.

**API.**

- `WeightZero.CrystallineGlobalProblem.localCondition` (projection): Restriction selects precisely D_crys,0, D^χ or D□ according to S_p,R,A.
- `WeightZero.CrystallineGlobalProblem.classifies` (universal-property): Continuous local O-algebra maps from R_{S_χ} correspond to strict-equivalence classes of lifts satisfying these local conditions.
- `WeightZero.CrystallineGlobalProblem.framing` (compatibility): For nonempty S, R^S_{S_χ} is a power series ring in n²|S|−1 framing variables over R_{S_χ}, after choosing universal representatives.
- `WeightZero.CrystallineGlobalProblem.residualComparison` (equivalence): The χ and trivial systems have compatible modulo-ϖ ring isomorphisms and identical p-local factor.

**Unit tests.**

- `WeightZero.test_problem_empty_R` (degenerate): If R is empty, S_χ=S_1 and both residual identifications are the identity.
- `WeightZero.test_problem_inertia_rank_two` (computation): For n=2 and trivial χ at v∈R, the inertia polynomial is (X−1)², not an assertion that the full inertia matrix is the identity.
- `WeightZero.test_problem_p_factor` (compatibility): For every allowed χ the crystalline p-factor R_p is unchanged.
- `WeightZero.test_problem_variable_determinant` (non-example): The n²|S|−1 framing count persists; imposing a fixed determinant produces a different quotient and cannot be silently substituted.

**Acceptance.**

- Twisting auxiliary inertia does not alter R_p.
- Residual comparison is compatible with local-to-global maps.
- The determinant-variable tangent count is used throughout.

**Direct dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.0/prepared-profile`, `WeightZeroCrystallineAutomorphyLifting:WZ.0/auxiliary-coefficient`, `GlobalGaloisDeformations:G8/variable-determinant-problem`, `GlobalGaloisDeformations:G8/variable-determinant-representability`, `LocalGaloisDeformationRings:R08.2/ihara-avoidance-components`, `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`, `DeformationAndDerivedPatchingAlgebra:R03.1/tensor-associativity`.

**Sources:** BCGNT25, §3.1.1, p. 30; §3.2, S_χ and universal representatives, pp. 32–33. Weight-zero variable-determinant deformation problem; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.

## WZ.1. Crystalline Hecke maps and cuspidal recognition

Produce the weight-zero crystalline deformation-to-derived-Hecke surjection modulo a uniformly nilpotent ideal, using CL.7 torsion crystalline compatibility together with the tame and unrestricted local conditions. Retain the geometric-Frobenius alternating Hecke polynomial and define support by spectral pullback from the honest Hecke image. Prove rational cohomological recognition of cuspidal weight-zero eigensystems after absolutely irreducible residual localization, including the supported seed point and Frobenius identification. Neither a strict deformation-ring action on a chain complex nor an integral R=T is an input.

**Layer dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.0`, `CrystallineLocalGlobalCompatibilityCM:CL.7`, `ArithmeticLocallySymmetricSpaces:ALS.3`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `IntegralHeckeAndGaloisDeterminants:IHG.3`, `IntegralHeckeAndGaloisDeterminants:IHG.5`, `ArithmeticLocallySymmetricSpaces:ALS.5`, `AutomorphicSpectralTheory:AS.5`, `AutomorphicGaloisRepresentationsPartII:AG2.7`.

### Weight-zero deformation-to-Hecke surjection

**Target:** `WeightZero.CrystallineDeformationHeckeMap` (theorem); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.1/crystalline-deformation-hecke-map`.

For S_χ and O(χ⁻¹) above, let T_χ be the localized derived spherical Hecke image on RΓ(X_K,O(χ⁻¹)) at the non-Eisenstein ideal m attached to r̄. There is δ≥1 depending only on n and [F:Q], an ideal J_χ of T_χ with J_χ^δ=0, and a continuous surjection of local O-algebras f_χ:R_{S_χ}→T_χ/J_χ. For every v∉S the universal representation after applying f_χ has geometric-Frobenius polynomial P_v(X)=Σ_{i=0}^n(−1)^i q_v^{i(i−1)/2}T_{v,i}X^{n−i}, T_{v,0}=1. The quotient is essential. Via Spec(T_χ/J_χ)≅Spec T_χ and Spec pullback along f_χ, the union of the supports of its cohomology groups is a well-defined closed subset of Spec R_{S_χ}; it does not require a genuine R_{S_χ}-module chain action.

**Construction or proof.**

1. Use CN CL.7 at each p-place with T=S∪S^c, weight zero and the crystalline parabolic branch. The prepared splitting conditions verify the extra ramified-prime hypothesis for T, and the strict degree bound implies CN’s weak bound.
2. Combine the local crystalline factorizations with the tame and unrestricted conditions of ACC Proposition 6.5.3. Enlarge the nilpotent error ideal by the finite sum/product bounds, retaining a bound depending only on n and the global degree.
3. Construct the universal deformation map, prove surjectivity from Frobenius Hecke coefficients, then use the nilpotent spectral identification to transport support.

**Acceptance.**

- δ does not depend on χ, coefficient exponent or Taylor–Wiles depth.
- For n=1 the polynomial is X−T_{v,1}; for n=3 its last coefficient is negative.
- No integral R=T assertion or lift through J_χ is inferred.

**Direct dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.0/crystalline-global-problem`, `WeightZeroCrystallineAutomorphyLifting:WZ.0/prepared-level`, `WeightZeroCrystallineAutomorphyLifting:WZ.0/auxiliary-coefficient`, `CrystallineLocalGlobalCompatibilityCM:CL.7/thm-4-2-15`, `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`, `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image`, `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image-finite`, `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`, `IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion`, `IntegralHeckeAndGaloisDeterminants:IHG.5/uniform-nilpotent-limit`, `mathlib:PrimeSpectrum.comap`, `mathlib:range_comap_of_surjective`, `mathlib:Module.support`, `IntegralHeckeAndGaloisDeterminants:IHG.5`.

**Sources:** BCGNT25, Proposition 3.2.3 and its proof, p. 33. Weight-zero deformation-to-Hecke surjection; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.

### Cuspidal recognition of characteristic-zero support

**Target:** `WeightZero.WeightZeroCohomologicalRecognition` (theorem); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.1/weight-zero-cohomological-recognition`.

At the good prepared GL_n level with trivial coefficients, a characteristic-zero Hecke eigensystem in H*(X_K,E)_m, with the specified absolutely irreducible residual system, is realized by a regular algebraic cuspidal automorphic representation Π of weight zero with Π^K≠0. Conversely the prepared seed π supplies a nonzero such eigensystem and the associated O-valued deformation point after finite coefficient extension. Comparing geometric-Frobenius polynomials identifies the attached semisimple Galois representation with a given lift represented by that eigensystem. The ordinary cohomology comparison must exclude the noncuspidal summands using the residual irreducibility hypothesis; the inclusion of cuspidal cohomology alone is insufficient.

**Construction or proof.**

1. Use the Betti-to-automorphic comparison and the residual non-Eisenstein cuspidality consequence of ACC Theorem 2.4.10.
2. Read weight zero from the trivial coefficient infinitesimal character and K-fixed vectors from the finite automorphic factor. Use characteristic-zero Galois attachment and Frobenius uniqueness for identification.

**Acceptance.**

- A seed π with π^K≠0 produces nonzero rational cohomology.
- A bare arbitrary spherical eigensystem is not asserted cuspidal.

**Direct dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.0/prepared-level`, `ArithmeticLocallySymmetricSpaces:ALS.5`, `AutomorphicSpectralTheory:AS.5`, `AutomorphicGaloisRepresentationsPartII:AG2.7`.

**Sources:** BCGNT25, §3.1.2, pp. 30–31; §3.2, maximal ideal m, p. 32. Cuspidal recognition of characteristic-zero support; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.; ACC23v2, Theorem 2.4.10 and proof, pp. 52–55. Residual cuspidality and the rational GL_n cohomological interval.

## WZ.2. Local tensor components and their transport

Prove the five local-tensor component assertions: O-flat equidimension 1+n²|S|+n(n−1)[F:Q]/2 and characteristic-zero generic points; unique generalization from each special generic point; bijection of distinct-type components with crystalline p-components; uniqueness of the crystalline component through a characteristic-zero point; and residual transport retaining the p-component label. Import weight-zero special-fibre generic reducedness from its sibling and the general DVR/geometric completed-tensor bridge from the algebra owners. Include finite coefficient descent and the same assertions after adding identical patching variables. Export PL.1’s precise base-field crystalline connects interpretation.

**Layer dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.0`, `LocalGaloisDeformationRings:R08.3`, `LocalGaloisDeformationRings:R08.2`, `DeformationAndDerivedPatchingAlgebra:P9`, `PotentialAutomorphyInfrastructurePartII:PL.1`.

### Dimension and characteristic of local tensor components

**Target:** `WeightZero.LocalTensorDimension` (theorem); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.2/local-tensor-dimension`.

For either the all-trivial χ tuple or one pairwise distinct at every R-place, R_loc^χ is O-flat and equidimensional, of Krull dimension D=1+n²|S|+n(n−1)[F:Q]/2; every irreducible component has a characteristic-zero generic point. All local quotients used here are nonzero: the seed gives crystalline points, the trivial residual tame problems have lifts of the specified types, and the auxiliary unrestricted factors are formally smooth. After finite coefficient enlargement so their components and special-fibre components are geometrically irreducible, completed tensor components are indexed by products of local components. For a subset T⊂S the relative dimensions sum with a single coefficient dimension, rather than adding |T| copies of the O-dimension.

**Construction or proof.**

1. Use crystalline flatness and dimension 1+n²+n(n−1)[F_v:Q_p]/2 at p; each R- and A-factor has dimension 1+n².
2. Apply the geometrically irreducible completed-tensor component and dimension theorem of BLGHT Lemma 3.3 and ACC Lemma 6.2.25. Sum local p-degrees to [F:Q], keeping one O-dimension.

**Acceptance.**

- For n=2 and [F:Q]=2, D=3+4|S|.
- No factor or tensor component has a generic point in characteristic p.

**Direct dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.0/crystalline-global-problem`, `LocalGaloisDeformationRings:R08.3/pst-generic-fibre`, `LocalGaloisDeformationRings:R08.3/pcris-generic-smooth`, `LocalGaloisDeformationRings:R08.2/ihara-avoidance-components`, `LocalGaloisDeformationRings:R08.2/unrestricted-away-from-p`, `DeformationAndDerivedPatchingAlgebra:P9`.

**Sources:** BCGNT25, Lemma 3.2.4(1) and proof, pp. 33–34. Dimension and characteristic of local tensor components; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.

### Unique generic generalization from the special fibre

**Target:** `WeightZero.UniqueSpecialGeneralization` (theorem); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.2/unique-special-generalization`.

Every generic point of Spec(R_loc^χ/ϖ) is the specialization of exactly one generic point of Spec R_loc^χ. At a p-factor, apply the sibling weight-zero generic-reducedness theorem for p>n and the generic commutative-algebra bridge: at a special-fibre minimal prime, O-flatness and generic reducedness make the localized ring a one-dimensional regular local ring with maximal ideal generated by ϖ, hence a DVR with a unique minimal prime. The tensor assertion is obtained from the product description of geometric local and special-fibre components. This is a statement about minimal primes, not a claim that the entire integral ring or entire special fibre is regular or reduced.

**Construction or proof.**

1. Import BCGNT Theorem 2.5.5 for each p-factor from the local lifting-ring sibling. The rank-two BT-specific CN Lemma 5.3.3 is used only for its general algebra argument, supplied by P9.
2. Use the tame unique-generalization theorem at R and formal smoothness at A. Pass to finite completed tensors after geometric coefficient extension.

**Acceptance.**

- p>n is retained; no small-prime extrapolation is made.
- A generically reduced special fibre is weaker than a globally reduced one.

**Direct dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.2/local-tensor-dimension`, `LocalGaloisDeformationRings:R08.2/ihara-avoidance-components`, `LocalGaloisDeformationRings:R08.2/unrestricted-away-from-p`, `LocalGaloisDeformationRings:R08.3`, `DeformationAndDerivedPatchingAlgebra:P9`.

**Sources:** BCGNT25, Lemma 3.2.4(2), pp. 33–34; Theorem 2.5.5, pp. 28–29. Unique generic generalization from the special fibre; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.; CN25v3, Lemma 5.3.3; Proposition 5.4.2 and Corollary 5.4.3, pp. 76–79. Generalization argument and the imported two-system support/fibre theorems.

### Distinct auxiliary types preserve the p-component labels

**Target:** `WeightZero.DistinctTypeComponentProjection` (theorem); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.2/distinct-type-component-projection`.

If for every v∈R the χ_{v,i} are pairwise distinct, the projection Spec R_loc^χ→Spec R_p induces a bijection of irreducible components. The non-p factors are geometrically irreducible after coefficient enlargement: distinct-character tame factors by ACC Proposition 6.2.17 and auxiliary factors by formal smoothness. There may be many crystalline p-components. The bijection removes the non-p labels and does not identify different p-components.

**Construction or proof.**

1. Use the local irreducibility statements for every non-p factor.
2. In the product description of tensor components each non-p component set is a singleton, leaving exactly the p-factor component set.

**Acceptance.**

- If R=∅ the distinctness requirement is vacuous.
- Multiple p-components remain multiple after changing tame types.

**Direct dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.2/local-tensor-dimension`, `LocalGaloisDeformationRings:R08.2/ihara-avoidance-components`, `LocalGaloisDeformationRings:R08.2/unrestricted-away-from-p`, `DeformationAndDerivedPatchingAlgebra:P9`.

**Sources:** BCGNT25, Lemma 3.2.4(3) and proof, pp. 33–34. Distinct auxiliary types preserve the p-component labels; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.

### Unique p-component at characteristic-zero points

**Target:** `WeightZero.UniqueCharacteristicZeroPComponent` (theorem); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.2/unique-characteristic-zero-p-component`.

Each characteristic-zero point of Spec R_p lies on a unique irreducible component. Indeed its generic fibre is regular, using Kisin’s crystalline generic-fibre smoothness for every local factor and the corresponding completed-tensor generic regularity. For crystalline weight-zero lifts, the connects hypothesis is used through the common-component interpretation in BCGNT Remark 3.2.2, with the geometric components descended to the chosen E. The component assigned to a given point is independent of frames and further coefficient enlargement. Do not replace this interpretation with potential diagonalizability: the theorem only requires a common component.

**Construction or proof.**

1. Apply crystalline generic smoothness and the completed-tensor regularity comparison. A regular local ring at the point is a domain, giving uniqueness of the component through it.
2. Use the supplier’s weight-zero base-field crystalline connects comparison to identify the two local point labels; it must be stronger than mere existence of a common component after an unspecified ramified extension.

**Acceptance.**

- The statement concerns R_p[1/p], not integral smoothness.
- It does not assert all crystalline lifts connect.

**Direct dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.0/crystalline-global-problem`, `LocalGaloisDeformationRings:R08.3/pcris-generic-smooth`, `DeformationAndDerivedPatchingAlgebra:P9`, `PotentialAutomorphyInfrastructurePartII:PL.1`.

**Sources:** BCGNT25, Lemma 3.2.4(4) and Remark 3.2.2, pp. 32–34. Unique p-component at characteristic-zero points; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.

### Residual component transport through distinct types

**Target:** `WeightZero.ResidualComponentTransport` (theorem); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.2/residual-component-transport`.

Let C be an irreducible component of Spec R_loc^1 and C_p its image component in Spec R_p. Via R_loc^1/ϖ≅R_loc^χ/ϖ for a pairwise-distinct tuple, every generic point of C∩Spec(R_loc^1/ϖ) generalizes to the generic point of the χ-component labelled C_p under the component bijection. Two untwisted components with the same p-label therefore have special generic points generalizing to the same χ-component. The assertion also holds after adjoining the same finite set of patching power-series variables, including existence and codimension one of these special generic points.

**Construction or proof.**

1. Contract a special generic point to the common p-special fibre. Its p-generalization is unique by weight-zero generic reducedness.
2. Use the distinct-type component projection to lift that p-label to the unique χ-component. Apply the completed tensor and power-series component comparison to retain the same labels after patching.

**Acceptance.**

- Different p-labels are not merged by this comparison.
- The shared residual identification is fixed before speaking of the same special point.

**Direct dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.2/unique-special-generalization`, `WeightZeroCrystallineAutomorphyLifting:WZ.2/distinct-type-component-projection`, `WeightZeroCrystallineAutomorphyLifting:WZ.2/unique-characteristic-zero-p-component`, `DeformationAndDerivedPatchingAlgebra:P9`.

**Sources:** BCGNT25, Lemma 3.2.4(5) and proof; Theorem 3.2.5 proof, pp. 33–35. Residual component transport through distinct types; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.

## WZ.3. Adequate crystalline patching and prepared lifting

Construct the adequate selected-block crystalline finite-level tower: q primes, one diamond coordinate per selected eigenvalue, g=q−n²[F⁺:Q] presentation variables, compatible residual systems and uniformly nilpotent crystalline Hecke maps. Dualize the localized cover comparison to obtain derived augmentation and use P8 to instantiate the six patched objects. Prove the adequate dimension balance and dual degree shift q₀=n(n−1)[F⁺:Q]/2+1. Verify CL.8’s two-system datum, then apply its support and augmentation theorems to prove Theorem 3.2.5 for two prepared points with the same crystalline p-component labels. Multiple unrelated crystalline components are not asserted automorphic.

**Layer dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.0`, `WeightZeroCrystallineAutomorphyLifting:WZ.1`, `ArithmeticGaloisRepresentations:G7`, `GlobalGaloisDeformations:G7`, `GlobalGaloisDeformations:G8`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.5`, `ArithmeticLocallySymmetricSpaces:ALS.6`, `IntegralHeckeAndGaloisDeterminants:IHG.5`, `DeformationAndDerivedPatchingAlgebra:P8`, `WeightZeroCrystallineAutomorphyLifting:WZ.2`, `ArithmeticLocallySymmetricSpaces:ALS.5`, `CrystallineLocalGlobalCompatibilityCM:CL.8`.

### Adequate crystalline finite-level tower

**Target:** `WeightZero.AdequateCrystallineTower` (construction); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.3/adequate-crystalline-finite-level-tower`.

For n≥2 and the prepared profile, choose q≥n²f, strictly greater than the dual Selmer dimensions of both residual-identical systems, where f=[F⁺:Q]. For each N≥1 construct Q_N of cardinality q disjoint from S, with q_v≡1 mod p^N, Q_N∩Q_N^c=∅ and underlying rational primes splitting in a fixed imaginary quadratic subfield F₀⊂F. At each v select one eigenvalue α_v of r̄(Frob_v), of generalized-eigenspace multiplicity d_v≥1, and use the (n−d_v,d_v) parahoric and its last-block determinant diamond quotient Δ_v, the p-primary quotient of k(v)ˣ. The deformation condition is MT D_v^1: the distinguished rank-d_v block is inertia-scalar through its diamond character and its complement is unramified. Put Δ_N=∏_{v∈Q_N}Δ_v. There are compatible presentations from R_loc^1[[z_1,…,z_g]] and R_loc^χ[[z_1,…,z_g]] onto the corresponding S-framed global rings, g=q−n²f. Localized dual cohomology C_N,C′_N=RHom_O(RΓ(X_{K₁(Q_N)},O or O(χ⁻¹))_{m_N},O)[−d], d=n²f, is perfect over O[Δ_N], has uniformly bounded perfect representatives after reduction, derived augmentation to C_0,C′_0, and common modulo-ϖ complexes. Surjections R_{S_1,Q_N}→T_N/I_N and R_{S_χ,Q_N}→T′_N/I′_N are O[Δ_N]-linear with one uniform nilpotence bound and common residual action modulo the sum of the two error images. N=0 is the base level with trivial Δ₀. Quotients Δ∞=Z_p^q→Δ_N can be chosen with kernels tending to zero (contained in p^NΔ∞), not merely with bounded ranks.

**Additional explicit hypotheses:** n≥2; the prepared profile; ζ_p∉F; an allowed all-trivial or everywhere-distinct χ tuple; q chosen as in the statement.

**Construction or proof.**

1. Apply MT Proposition 6.7 and its adequate projector/dual-Selmer argument simultaneously to the two systems, whose special-fibre deformation problems coincide. The scalar-outside hypothesis in the final theorem implies ζ_p∉F; include this certificate in the arithmetic application of the prime theorem.
2. Use MT §§2–3 block parahoric calculations, not the enormous-image all-distinct-eigenvalue tower. MT Theorem 7.6 gives derived invariants on cohomology; duality gives the stated derived coinvariant augmentation. Good covers and ALS finiteness give uniform bounded perfect models. Use the SR.2/SR.5/ALS.6 convention comparison required by source issue E7; the printed first-selected-block partitions are not a literal instance of the last-selected-block level specified here.
3. Use MT Theorem 7.7 for the selected-block tame Galois condition and CN Theorem 4.2.15 for the crystalline p-condition. Combine them with the WZ.1 Hecke argument and fixed residual coefficient identity. The auxiliary Q and Q^c levels satisfy CN’s parabolic alternatives.
4. Lift compatible presentations through formal smoothness of the power-series source; use the common residual identification when choosing both sets of lifts. Feed these finite-level data to the existing P8 interface.

**Consumer interface.** WZ.3/weight-zero-patched-system: Discharges every finite-level input of P8 while retaining the actual crystalline p-condition.

**API.**

- `WeightZero.AdequateCrystallineTower.primes` (projection): For each N, |Q_N|=q, q_v≡1 mod p^N, Q_N∩Q_N^c=∅ and Q_N avoids S.
- `WeightZero.AdequateCrystallineTower.presentations` (data): Both S-framed rings are quotients of their local bases with g=q−n²f formal variables; the presentations agree modulo ϖ.
- `WeightZero.AdequateCrystallineTower.augment` (compatibility): C_N⊗^L_{O[Δ_N]}O≅C₀ and C′_N⊗^L_{O[Δ_N]}O≅C′₀ compatibly with Hecke actions and residual comparisons.
- `WeightZero.AdequateCrystallineTower.residual` (equivalence): The identity on residual coefficients induces a specified common perfect complex and a common Hecke image modulo both nilpotent errors.
- `WeightZero.AdequateCrystallineTower.uniform` (projection): One δ controls all I_N and I′_N and one finite degree interval/term-rank bound controls the residual perfect representatives.

**Unit tests.**

- `WeightZero.test_tower_repeated_eigenvalue` (non-example): A selected generalized eigenspace of dimension 2 uses one diamond coordinate and the (n−2,2) parahoric; demanding n distinct eigenvalues rejects an allowed datum.
- `WeightZero.test_tower_base_level` (degenerate): At N=0, Q₀=∅ and Δ₀=1; derived augmentation is the identity on C₀.
- `WeightZero.test_tower_rank` (computation): For a prepared n=2, f=5 profile with both dual Selmer dimensions less than 20, take q=20: Δ∞ has rank 20, not 40, and g=0. Five equal-degree p-places satisfy the profile’s strict complementary-degree condition.
- `WeightZero.test_tower_dual_augmentation` (compatibility): The coefficient-trivialization comparison commutes with derived augmentation; ordinary tensor coinvariants without duality do not supply this test.
- `WeightZero.test_tower_depth` (non-example): A constant quotient Z_p^q→(Z/p)^q for all N fails the shrinking-kernel condition even though the number of generators stays q.
- `WeightZero.test_tower_selected_block` (non-example): For n=3 and a selected eigenvalue of multiplicity d=1, the ordered blocks are (2,1), the last degree-one polynomial is X−α, and the diamond character acts on that last rank-one block. Using (1,2) with a last-block diamond would select a rank-two block and fails this specification.

**Acceptance.**

- Only q diamond directions occur, not qn.
- The selected α may be repeated, including d_v=n; the zero-size complementary block is allowed.
- The proof uses MT §§2–7 and the proof pattern of §8, not Theorem 8.1 under its p>n² Fontaine–Laffaille assumptions.
- Require ζ_p∉F for the prime selection; this is supplied by the scalar witness, not by adequacy alone.

**Direct dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.0/prepared-profile`, `WeightZeroCrystallineAutomorphyLifting:WZ.0/crystalline-global-problem`, `WeightZeroCrystallineAutomorphyLifting:WZ.0/auxiliary-coefficient`, `WeightZeroCrystallineAutomorphyLifting:WZ.1/crystalline-deformation-hecke-map`, `ArithmeticGaloisRepresentations:G7/adequate-subgroup`, `GlobalGaloisDeformations:G7`, `GlobalGaloisDeformations:G8/variable-determinant-presentation`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.5`, `ArithmeticLocallySymmetricSpaces:ALS.6`, `IntegralHeckeAndGaloisDeterminants:IHG.5`, `DeformationAndDerivedPatchingAlgebra:P8/finite-level-patching-data`.

**Sources:** BCGNT25, Theorem 3.2.5 proof, items (1)–(5), pp. 34–35. Adequate crystalline finite-level tower; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.; MT23, Proposition 6.7, p. 22; Theorems 7.6–7.7, pp. 26–28; §8, pp. 28–30. Adequate selected-block arithmetic input and finite-level patching pattern.

### Adequate dimension and dual cohomological balance

**Target:** `WeightZero.AdequateDimensionBalance` (theorem); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.3/adequate-dimension-balance`.

Let n≥2, f=[F⁺:Q]≥1, s=|S|≥1 and q≥n²f. Set j=n²s−1, g=q−n²f, d=n²f, ℓ₀=nf−1, and a=n(n−1)f/2. The adequate tower has dim S∞=1+j+q=n²s+q and dim R∞=1+n²s+n(n−1)f+g=dim S∞−ℓ₀. Rational localized GL_n cohomology is nonzero precisely in degrees [a,a+ℓ₀], by the seed and cuspidal comparison. Since 2a+ℓ₀=d−1, its dual shifted by [−d] is nonzero precisely in [a+1,a+1+ℓ₀]. Thus the two-system patching datum uses q₀=a+1 on C∞, rather than unshifted a; each special-fibre dimension is one less by O-flatness. The polynomial identities 1+(n²s−1)+q=n²s+q and (1+n²s+n(n−1)f+q−n²f)+(nf−1)=n²s+q hold over Z without truncation; integrality of a follows because n(n−1) is even.

**Construction or proof.**

1. Count n²s−1 framing variables and q adequate diamond variables. Use WZ.2 for the local dimension and g for the global presentation.
2. Use the rational cuspidal GL_n degree interval from ACC Theorem 2.4.10(2); the same seed ensures the localized interval is nonzero.
3. Duality sends a degree i to d−i. Calculate d−(a+ℓ₀)=a+1, and check the patching codimension is ℓ₀.

**Acceptance.**

- For n=2,f=1,s=1,q=4: j=3,g=0,dim S∞=8,dim R∞=7,ℓ₀=1,a=1 and the dual interval is [2,3].
- No qn count from the enormous tower is used.
- Complex duality and the shift convention are checked against the supplier, not silently identified with the original cohomology degrees.

**Direct dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.3/adequate-crystalline-finite-level-tower`, `WeightZeroCrystallineAutomorphyLifting:WZ.2/local-tensor-dimension`, `WeightZeroCrystallineAutomorphyLifting:WZ.1/weight-zero-cohomological-recognition`, `ArithmeticLocallySymmetricSpaces:ALS.5`, `CrystallineLocalGlobalCompatibilityCM:CL.8/two-system-patching-data`.

**Sources:** BCGNT25, Theorem 3.2.5 proof, item (6), pp. 34–35. Adequate dimension and dual cohomological balance; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.; ACC23v2, Theorem 2.4.10 and proof, pp. 52–55. Residual cuspidality and the rational GL_n cohomological interval.

### Weight-zero two-system patched objects

**Target:** `WeightZero.WeightZeroPatchedSystem` (construction); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.3/weight-zero-patched-system`.

Apply P8 patching to the adequate crystalline tower for the all-trivial and everywhere-distinct χ systems. Obtain S∞=O[[x₁,…,x_{j+q}]] with O-augmentation a∞, perfect complexes C∞,C′∞ and a specified modulo-ϖ isomorphism. The augmentation of C∞ is C₀=RHom_O(RΓ(X_K,O)_m,O)[−d], and likewise for the twisted system. Their finite S∞-subalgebras T∞,T′∞ of derived endomorphisms have the same residual image. Put R∞=R_loc^1[[z₁,…,z_g]] and R′∞=R_loc^χ[[z₁,…,z_g]], as complete local S∞-algebras using patched scalar lifts. There are surjections R∞→T∞/I∞ and R′∞→T′∞/I′∞ with uniformly nilpotent ideals, an S∞-compatible isomorphism R∞/ϖ≅R′∞/ϖ, and common residual action after quotienting the sum of the two error images. There is a quotient R∞/a∞→R_{S_1} and a map T∞→T(K,O)_m, obtained by augmentation and the duality anti-isomorphism on endomorphisms; the resulting square with R_{S_1}→T(K,O)_m^red commutes. With q₀=a+1, ℓ₀=nf−1, these objects satisfy every hypothesis of CL.8/two-system-patching-data, including geometric component conditions from WZ.2 and the one-less special-fibre dimensions. These are instances of the supplier objects, not new definitions of perfect complexes or abstract patching.

**Construction or proof.**

1. Feed the tower and boundedness/augmentation interfaces to P8. Patch the two systems with the same choices and preserve their fixed residual comparison.
2. Construct the patched scalar lifts and deformation maps, pass uniform errors to the patched ideals, and use duality to identify augmentation Hecke images.
3. Use WZ.2 component transport with the same g variables and WZ.3 dimension balance to instantiate the existing CL.8 datum.

**Consumer interface.** Theorem 3.2.5: Supplies exactly the datum consumed by CN Proposition 5.4.2 and Corollary 5.4.3.

**API.**

- `WeightZero.WeightZeroPatchedSystem.augment` (equivalence): Both derived augmentation fibres are their stated dual base complexes, with the fixed shift [−d].
- `WeightZero.WeightZeroPatchedSystem.residual` (equivalence): The two residual perfect complexes, residual rings and Hecke images are identified compatibly modulo the sum of nilpotent errors.
- `WeightZero.WeightZeroPatchedSystem.heckeSquare` (compatibility): The square from the patched deformation-to-Hecke quotient to R_{S_1}→T(K,O)_m^red commutes.
- `WeightZero.WeightZeroPatchedSystem.dimensions` (projection): dim R∞=dim R′∞=dim S∞−ℓ₀ and each flat special-fibre dimension is one less.
- `WeightZero.WeightZeroPatchedSystem.toTwoSystemDatum` (constructor): The patched objects and WZ.2 component facts give an instance of CL.8’s existing two-system patching datum with q₀=a+1.

**Unit tests.**

- `WeightZero.test_patched_shift` (computation): For n=2,f=1, d=4 and original degrees [1,2], the dual fibre has degrees [2,3].
- `WeightZero.test_patched_residual_square` (compatibility): The two actions on the common residual complex agree only after both error images are killed; quotienting just one is not the specified square.
- `WeightZero.test_patched_empty_R` (degenerate): When R=∅ the two coefficient systems and residual identifications can be taken identical, although the patching apparatus remains the same.
- `WeightZero.test_patched_codimension` (non-example): Replacing g=q−n²f by qn−n²f fails dim R∞=dim S∞−ℓ₀ for n≥2,q>0.

**Acceptance.**

- The six items of BCGNT’s patching output are individually available.
- The nilpotent quotient maps are retained until spectra are compared.
- The augmentation square ends in the reduced Hecke algebra, not a falsely asserted integral R=T.

**Direct dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.3/adequate-crystalline-finite-level-tower`, `WeightZeroCrystallineAutomorphyLifting:WZ.3/adequate-dimension-balance`, `WeightZeroCrystallineAutomorphyLifting:WZ.2/residual-component-transport`, `DeformationAndDerivedPatchingAlgebra:P8/compatible-patch-choices`, `DeformationAndDerivedPatchingAlgebra:P8/ultrapatching-of-perfect-complexes`, `DeformationAndDerivedPatchingAlgebra:P8/patched-error-nilpotent`, `DeformationAndDerivedPatchingAlgebra:P8/patched-hecke-injective`, `DeformationAndDerivedPatchingAlgebra:P8/patched-deformation-surjective`, `DeformationAndDerivedPatchingAlgebra:P8/patched-scalar-lift`, `CrystallineLocalGlobalCompatibilityCM:CL.8/two-system-patching-data`.

**Sources:** BCGNT25, Theorem 3.2.5 proof, items (1)–(6), pp. 34–35. Weight-zero two-system patched objects; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.; MT23, Proposition 6.7, p. 22; Theorems 7.6–7.7, pp. 26–28; §8, pp. 28–30. Adequate selected-block arithmetic input and finite-level patching pattern.; CN25v3, Lemma 5.3.3; Proposition 5.4.2 and Corollary 5.4.3, pp. 76–79. Generalization argument and the imported two-system support/fibre theorems.

### Prepared weight-zero support propagation

**Target:** `WeightZero.PreparedWeightZeroSupport` (theorem); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.3/prepared-weight-zero-support`.

In the prepared n≥2 setting let f₁,f₂:R_{S_1}→O be continuous local O-algebra maps with lifts ρ₁,ρ₂. Suppose ker f₁ belongs to the spectral support of H*(X_K,O)_m transported by WZ.1, and for every v|p the two crystalline weight-zero local lifts connect, equivalently have the same local crystalline component labels in the interpretation exported by PL.1. Then ker f₂ belongs to the same support. The statement changes the global lift while retaining its p-component labels; it does not allow changing those labels arbitrarily.

**Construction or proof.**

1. For ζ_p∉F the following proof uses the stated MT prime selection. If ζ_p∈F, the prepared source statement has no scalar-outside assumption: an adequate tower with the required dimension must be verified separately. This boundary is the explicit GAP-CYCLOTOMIC and is not claimed established by MT Proposition 6.7.
2. Lift f₁,f₂ through the augmentation quotient to characteristic-zero patched points. CL.8 Proposition 5.4.2(1) supplies an automorphic component C_a through the first point; choose the component C through the second.
3. Their p-labels agree by connects and generic regularity. WZ.2 identifies special-fibre generic points of C and C_a with the same distinct-type patched component. Apply Proposition 5.4.2(2) to put C in patched support.
4. Apply Corollary 5.4.3 to the augmentation point and undo duality to obtain support on base cohomology. The nilpotent spectral identifications agree with those in WZ.1.

**Acceptance.**

- All hypotheses of the two-system support theorem are verified, including the special generic-point existence and the dual degree range.
- No near-faithfulness over every crystalline component is claimed.
- Coefficient enlargement and chosen frames do not affect the conclusion.
- The full prepared statement includes ζ_p∈F; its extra tower verification is an open mathematical proof input. The final global theorem only uses ζ_p∉F, forced by its scalar-outside witness.

**Direct dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.3/weight-zero-patched-system`, `WeightZeroCrystallineAutomorphyLifting:WZ.2/residual-component-transport`, `WeightZeroCrystallineAutomorphyLifting:WZ.2/unique-characteristic-zero-p-component`, `CrystallineLocalGlobalCompatibilityCM:CL.8/prop-5-4-2`, `CrystallineLocalGlobalCompatibilityCM:CL.8/cor-5-4-3`, `WeightZeroCrystallineAutomorphyLifting:WZ.1/crystalline-deformation-hecke-map`, `GlobalGaloisDeformations:G7`.

**Sources:** BCGNT25, Theorem 3.2.5 and proof, pp. 34–35. Prepared weight-zero support propagation; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.; CN25v3, Lemma 5.3.3; Proposition 5.4.2 and Corollary 5.4.3, pp. 76–79. Generalization argument and the imported two-system support/fibre theorems.

## WZ.4. Solvable preparation and global weight-zero lifting

Construct soluble CM preparation of the global theorem while every original p-place splits completely: preserve the original p-adic fields, full residual/cyclotomic images, decomposed genericity and scalar witness; enlarge split real degree and arrange all eight prepared certificates. Use prepared support and cuspidal recognition to realize the prescribed lift automorphically. Supply a separate GL₁ algebraic-character realization using class field theory and rank-one p-adic Hodge algebraicity. Descend by actual all-place LLC-compatible soluble base change and Varma’s weak local–global consequence. Conclude crystalline weight-zero automorphy for CM or totally real F, p>n, with unramifiedness at p and all places where the lift and seed are both unramified.

**Layer dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.0`, `WeightZeroCrystallineAutomorphyLifting:WZ.3`, `WeightZeroCrystallineAutomorphyLifting:WZ.1`, `PotentialAutomorphyInfrastructure:PA.5`, `PotentialAutomorphyInfrastructure:PA.4`, `AutomorphicGaloisRepresentationsPartII:AG2.7`, `PotentialAutomorphyInfrastructurePartII:PL.1`, `AutomorphicGaloisRepresentationsPartII:AG2.5`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `PotentialAutomorphyInfrastructure:PA.2`, `PadicHodgeTheory:R06.2`, `AutomorphicGaloisRepresentationsPartII:AG2.0`.

### Solvable preparation with p split completely

**Target:** `WeightZero.SolvableWeightZeroPreparation` (construction); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.4/solvable-weight-zero-preparation`.

Given the hypotheses of the global weight-zero theorem for n≥2, construct a finite soluble Galois extension E/F, imaginary CM (a compositum with a p-split imaginary quadratic field first if F is totally real), and the cuspidal soluble base change π_E. All places of F above p split completely in E, so E_w=F_v: absolute ramification of p is unchanged. Arrange the eight prepared conditions over E, with ρ_E satisfying S_1, and π_E giving a supported S_1-point whose local p-components agree with those of ρ_E. Retain the full residual and cyclotomic residual images, decomposed genericity and a scalar-outside witness by disjointness from the residual/cyclotomic field and splitting a finite family of test places V₀,V₁,V₂ detecting these images and decomposed genericity. First enlarge the real degree by a cyclic totally real extension of degree t>4 split at p and the test places; then soluble local prescriptions at bad places away from p arrange Iwahori seed vectors, unipotent ρ_E, trivial residual local representations and q_w≡1 mod p. Adjoin three imaginary quadratic fields with prescribed splitting at p and the test places to supply the imaginary-quadratic splitting condition at every bad or ramified rational prime. Choose two auxiliary scalar-Frobenius places of distinct residue characteristics away from all bad places to give H²=0 and neatness. The complements of the two selected p-places have degree at least (1−2/t)[E⁺:Q]>[E⁺:Q]/2, because each original completion occurs in at least t split copies. This differs from a Fontaine–Laffaille preparation: it never requires absolute unramifiedness at p or killing the residual p-representation.

**Construction or proof.**

1. Use ACC §6.5.12’s image-detecting V₀,V₁,V₂ and the supplier’s soluble local-prescription theorem, adding the p-split requirement; for a totally real starting field choose the first imaginary quadratic extension disjoint from the residual/cyclotomic field and split at p and V.
2. Arrange the complementary degree bound by the p-split cyclic real extension. Only make local modifications away from p; base change preserves the seed’s p-unramifiedness and the common crystalline labels at these unchanged completions.
3. Use the three-quadratic reciprocity/Dirichlet construction from ACC §6.5.12 with p in the split set. Add the two auxiliary places. Verify all eight fields of the profile, and use cohomological recognition for the supported seed point.

**Consumer interface.** Global weight-zero lifting theorem: Reduces the actual global hypotheses to the prepared support theorem without changing p-adic fields.

**API.**

- `WeightZero.SolvableWeightZeroPreparation.pSplit` (projection): Every v|p of F splits completely in E, so restriction identifies the local ρ and seed representations at E_w with those at F_v.
- `WeightZero.SolvableWeightZeroPreparation.prepared` (constructor): The extension, level, bad-place set R and two auxiliary places provide PreparedWeightZeroData and both S_1-points.
- `WeightZero.SolvableWeightZeroPreparation.images` (compatibility): Residual global and cyclotomic images agree with the original ones, and the split test places preserve decomposed genericity and the scalar-outside witness.
- `WeightZero.SolvableWeightZeroPreparation.degree` (projection): With t>4 split copies at every p-place, removing two selected completions leaves strictly more than half the global real degree.
- `WeightZero.SolvableWeightZeroPreparation.seed` (compatibility): The base-changed cuspidal seed gives a supported point, and connects at p supplies the same component labels as ρ_E.

**Unit tests.**

- `WeightZero.test_preparation_ramified_p` (compatibility): If F_v/Q_p is ramified, E_w=F_v remains ramified; the construction still passes the prepared profile.
- `WeightZero.test_preparation_four_copies` (non-example): For equal-degree copies t=4, deleting two leaves half and fails; t=5 passes.
- `WeightZero.test_preparation_real_input` (characterisation): A totally real starting F acquires a CM extension and the original p-completions survive via complete splitting.
- `WeightZero.test_preparation_image_loss` (non-example): An extension contained in the residual field can shrink the residual image and is excluded by the disjointness/image certificates.

**Acceptance.**

- The extension is soluble and the restricted lift stays absolutely irreducible, ensuring cuspidal base change/descent.
- All p-completions are unchanged, including ramified ones.
- The preparation preserves equality of residual images, not only containment of an adequate subgroup.
- The strict degree inequality is proved numerically, rather than imported from a Fontaine–Laffaille-only construction.

**Direct dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.0/prepared-profile`, `WeightZeroCrystallineAutomorphyLifting:WZ.3/prepared-weight-zero-support`, `WeightZeroCrystallineAutomorphyLifting:WZ.1/weight-zero-cohomological-recognition`, `PotentialAutomorphyInfrastructure:PA.5/soluble-base-change-and-descent`, `PotentialAutomorphyInfrastructure:PA.5/residual-lifting-hypothesis-restriction`, `PotentialAutomorphyInfrastructure:PA.4/neatness-auxiliary-places`, `PotentialAutomorphyInfrastructure:PA.5`, `AutomorphicGaloisRepresentationsPartII:AG2.7`, `PotentialAutomorphyInfrastructurePartII:PL.1`.

**Sources:** BCGNT25, Theorem 3.2.1 proof, p. 35. Solvable preparation with p split completely; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.; ACC23v2, §6.5.12, pp. 175–179. Soluble preparation and descent; replace absolute-unramified p preparation with complete splitting.

### Automorphic realization after prepared support transfer

**Target:** `WeightZero.PreparedWeightZeroRealization` (theorem); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.4/prepared-weight-zero-realization`.

For the two prepared points produced above, apply WZ.3 support propagation to ρ_E and WZ.1 cuspidal recognition. Obtain a regular algebraic cuspidal Π_E of weight zero with r_ι(Π_E)≅ρ_E and Π_E^K≠0. Its local factors are unramified at every p-place and every place outside S. At auxiliary A-places no unramifiedness follows merely from K-fixed vectors; their possible ramification is removed during the descent argument using weak local–global compatibility and the prescribed unramified Galois parameter.

**Construction or proof.**

1. The seed is in support and the prescribed lift has the same crystalline component labels, so the support theorem puts it in base cohomology support.
2. Read a characteristic-zero Hecke eigensystem from the support point, apply the residual cuspidal recognition theorem and identify attached Galois representations by Frobenius comparison.
3. Use the actual hyperspecial level factors to infer the stated local unramifiedness.

**Acceptance.**

- Auxiliary pro-Iwahori fixed vectors do not alone imply hyperspecial fixed vectors.
- Cuspidality uses absolute residual irreducibility.

**Direct dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.4/solvable-weight-zero-preparation`, `WeightZeroCrystallineAutomorphyLifting:WZ.3/prepared-weight-zero-support`, `WeightZeroCrystallineAutomorphyLifting:WZ.1/weight-zero-cohomological-recognition`, `AutomorphicGaloisRepresentationsPartII:AG2.5`.

**Sources:** BCGNT25, Theorem 3.2.1 proof, p. 35; §3.1.2, pp. 30–31. Automorphic realization after prepared support transfer; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.

### Rank-one character realization

**Target:** `WeightZero.RankOneCharacterRealization` (theorem); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.4/rank-one-character-realization`.

For n=1, a continuous p-adic character of G_F unramified almost everywhere and de Rham with the prescribed integral labelled weights is the p-adic realization of an algebraic Hecke character via global class field theory. In the crystalline weight-zero case, its infinity weight is zero and its finite local factor is unramified at p; at any finite place where the Galois character is unramified the corresponding Hecke character is unramified. In the ordinary case its prescribed weight λ determines the algebraic infinity type, and its automorphic character is ι-ordinary in the existing PA.2 sense. GL₁ cuspidality is automatic. This separate branch covers n=1 without applying n≥2 neatness, cuspidal comparison or patching statements.

**Construction or proof.**

1. Use global Artin reciprocity and the rank-one de Rham/algebraic-character correspondence, fixing geometric reciprocity and the HT normalization of the automorphic Galois dictionary.
2. Crystallinity of a rank-one weight-zero character makes its inertia character trivial; identify finite conductors by local reciprocity. For ordinary λ use its locally algebraic inertia formula.

**Acceptance.**

- The p=2 scalar-outside-cyclotomic hypothesis is impossible in both final lifting statements.
- GL₁ does not depend on an n≥2 cohomological comparison.
- The rank-one algebraic correspondence must be supplied explicitly; an abstract reciprocity isomorphism alone is insufficient.

**Direct dependencies:** `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `PotentialAutomorphyInfrastructure:PA.2/iota-ordinary-automorphic-representation`, `PadicHodgeTheory:R06.2`, `AutomorphicGaloisRepresentationsPartII:AG2.0`.

**Sources:** BCGNT25, Theorem 3.2.1, pp. 31–32, rank-one boundary. Rank-one character realization; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.

### Global weight-zero crystalline automorphy lifting

**Target:** `WeightZero.WeightZeroCrystallineAutomorphyLifting` (theorem); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.4/weight-zero-crystalline-automorphy-lifting`.

Let F be an imaginary CM or totally real field, n≥1 and p>n a prime. Let ρ:G_F→GL_n(Q̄_p) be continuous and unramified almost everywhere, crystalline at every v|p with HT_τ(ρ)={0,…,n−1}. Assume r̄ is absolutely irreducible and decomposed generic, r̄(G_{F(ζ_p)}) is adequate, and there is σ∈G_F outside G_{F(ζ_p)} with r̄(σ) scalar. Fix ι:Q̄_p≅C and a regular algebraic cuspidal π of GL_n(A_F) of weight zero with r̄_ι(π)≅r̄. For every v|p assume π_v unramified and r_ι(π)|_{G_{F_v}} connects to ρ|_{G_{F_v}}. Then there is a regular algebraic cuspidal Π of weight zero with r_ι(Π)≅ρ. Π_v is unramified for every v|p and for every finite v where both ρ and π are unramified. There is no absolute-unramifiedness condition on F at p, no polarization and no stronger enormous-image hypothesis.

**Construction or proof.**

1. Dispose of n=1 by the character-realization theorem. For n≥2 use solvable preparation, prepared support and cuspidal realization over E.
2. Descend Π_E using soluble descent and irreducibility of ρ|_{G_E}; identify the descended Galois representation with ρ. At p complete splitting identifies local factors, retaining unramifiedness.
3. At common unramified places away from p use the ACC §6.5.12 descent argument: weak local–global compatibility controls the finite inertia and monodromy parameter; the unramified Galois lift and unramified seed permit the prescribed unramified descent. Keep this supplier local descent/conductor consequence explicit.

**Acceptance.**

- Totally real input is handled by an explicit first CM extension.
- Unramifiedness at p comes from hyperspecial vectors and complete splitting.
- The conclusion uses weight zero; the undefined preprint λ is not carried into the statement.

**Direct dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.4/solvable-weight-zero-preparation`, `WeightZeroCrystallineAutomorphyLifting:WZ.4/prepared-weight-zero-realization`, `WeightZeroCrystallineAutomorphyLifting:WZ.4/rank-one-character-realization`, `PotentialAutomorphyInfrastructure:PA.5/soluble-base-change-and-descent`, `AutomorphicGaloisRepresentationsPartII:AG2.5`, `PotentialAutomorphyInfrastructurePartII:PL.1`.

**Sources:** BCGNT25, Theorem 3.2.1, pp. 31–32; proof, p. 35. Global weight-zero crystalline automorphy lifting; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.; ACC23v2, §6.5.12, pp. 175–179. Soluble preparation and descent; replace absolute-unramified p preparation with complete splitting.

## WZ.5. Adequate ordinary automorphy lifting

Verify the adequate selected-block substitution in the ordinary prepared patching argument, using existing ordinary characters, local weight-algebra branches and normalized dual completed homology. Include full-inertia character formulas after preparation, roots-of-unity compatibility between seed and lift weights, pointwise maximal-dimensional ordinary component support and weight specialization. Export MT Theorem 1.3 for potentially semistable regular ordinary lifts over CM or totally real fields, with adequate cyclotomic residual image, decomposed genericity and a scalar-outside witness. The final ordinary cuspidal representation has the lift’s weight and is unramified away from p wherever both lift and seed are unramified. The seed weight may differ.

**Layer dependencies:** `ArithmeticGaloisRepresentations:G7`, `GlobalGaloisDeformations:G7`, `PotentialAutomorphyInfrastructure:PA.2`, `PotentialAutomorphyInfrastructure:PA.5`, `DeformationAndDerivedPatchingAlgebra:P8`, `DeformationAndDerivedPatchingAlgebra:P9`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.5`, `ArithmeticLocallySymmetricSpaces:ALS.6`, `PotentialAutomorphyInfrastructure:PA.4`, `LocalGaloisDeformationRings:R08.5`, `WeightZeroCrystallineAutomorphyLifting:WZ.4`, `AutomorphicGaloisRepresentationsPartII:AG2.5`.

### Adequate ordinary patching verification

**Target:** `WeightZero.AdequateOrdinaryPatchingVerification` (theorem); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.5/adequate-ordinary-patching-verification`.

In the ordinary preparation of ACC §§6.6.1 and 6.6.10, with ζ_p∉F, replace the enormous-image Taylor–Wiles prime tower by MT Proposition 6.7’s adequate selected-block tower, retaining the ordinary local rings and the ordinary Hecke characters from PA.2. The last-block diamond quotient has q directions and the presentation has g=q−n²[F⁺:Q] variables. MT §§2–7 gives level growth, augmentation and the selected-block Galois condition away from p. PA.2 ordinary local–global compatibility supplies the p-local triangular identities; the ordinary preparation extends the p-local characters to the full chosen inertia and ensures the weight compatibility at roots of unity needed for its local deformation rings. P8 patching and P9 support propagation then give the adequate analogue of the prepared ordinary support/lifting result used in ACC’s proof of its ordinary theorem. No weight-zero generic-reducedness input or Fontaine–Laffaille restriction is used. The statement is the verification of the adequate substitution in MT Theorem 1.3’s proof, not a second definition of ordinarity or a new proof of its existing local theory. The prepared ordinary hypotheses are ACC §6.6.1 conditions (1)–(15), with adequate replacing enormous: n≥2, p>n, a good imaginary-quadratic-split CM field, a residual absolutely irreducible decomposed-generic seed, R with trivial local residual representation and q_v≡1 mod p, two auxiliary H²=0 places, and p-local residual triviality with [F_v:Q_p]>n(n+1)/2+1. The seed has ordinary Iw_v(1,1)-fixed vectors and weight μ. The lift has the same reduction, is unramified outside S and unipotently ramified at R, and its ordered diagonal characters have the λ formula on all chosen inertia. For every p-power root of unity x∈O_{F_v} and i, require ∏_ττ(x)^{λ_{τ,n+1−i}−μ_{ιτ,n+1−i}}=1. Work over the ordinary weight-algebra branch Λ given by a minimal prime of the weight algebra, with Λ-linear normalized dual completed homology and its weight-character specialization. At the λ point the distinct inertia characters put it on a maximal-dimensional ordinary component; do not assert all ordinary components are smooth or in support.

**Construction or proof.**

1. Use the ordinary variant of ACC’s preparation, with adequate image preserved by equality of residual images and test-prime splitting. Preserve the scalar-outside-cyclotomic witness of the final theorem; it supplies ζ_p∉F for MT Proposition 6.7. The prepared assertion here explicitly requires that noncontainment certificate.
2. Use MT Proposition 6.7, §§2–7 and the §8 modification of ACC’s patching proof. Ordinary local rings have their existing smooth component properties, so the adequate arithmetic tower is the changed input. Use the SR.2/SR.5/ALS.6 convention comparison required by source issue E7; the printed first-selected-block partitions are not a literal instance of the last-selected-block level specified here.
3. Use the ordinary Λ-linear nilpotent maps, normalized dual completed-homology augmentation and weight specialization from PA.2/PA.4 (ACC Propositions 6.6.7–6.6.9 and Corollary 6.6.6). Apply P9/ACC Corollary 6.3.9 at the λ point: distinct inertia characters give the required maximal-dimensional ordinary component. This proves the prepared lift, rather than full support on all ordinary components.

**Acceptance.**

- p>n, not p>n², is the ordinary numerical hypothesis.
- The seed weight need not equal the lift weight.
- The old enormous tower’s qn presentation is not silently retained.

**Direct dependencies:** `ArithmeticGaloisRepresentations:G7/adequate-subgroup`, `GlobalGaloisDeformations:G7`, `PotentialAutomorphyInfrastructure:PA.2/ordinary-galois-characters`, `PotentialAutomorphyInfrastructure:PA.2/ordinary-local-global`, `PotentialAutomorphyInfrastructure:PA.5/ordinary-base-change-fields`, `DeformationAndDerivedPatchingAlgebra:P8`, `DeformationAndDerivedPatchingAlgebra:P9`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.5`, `ArithmeticLocallySymmetricSpaces:ALS.6`, `PotentialAutomorphyInfrastructure:PA.4`, `LocalGaloisDeformationRings:R08.5`.

**Sources:** MT23, Theorem 1.3, pp. 2–3; §8, pp. 28–30; Proposition 6.7, p. 22. Adequate ordinary patching verification; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.; MT23, Proposition 6.7, p. 22; Theorems 7.6–7.7, pp. 26–28; §8, pp. 28–30. Adequate selected-block arithmetic input and finite-level patching pattern.; ACC23v2, §6.6.1–6.6.10, pp. 179–189. Prepared ordinary local conditions, weight specialization and pointwise support/descent.

### Adequate ordinary automorphy lifting

**Target:** `WeightZero.AdequateOrdinaryAutomorphyLifting` (theorem); packet node `WeightZeroCrystallineAutomorphyLifting:WZ.5/adequate-ordinary-automorphy-lifting`.

Let F be imaginary CM or totally real, n≥1, p>n, and ρ:G_F→GL_n(Q̄_p) continuous and unramified almost everywhere. For every v|p assume ρ_v potentially semistable and ordinary with regular HT weights: for a dominant λ∈(Z_+^n)^{Hom(F,Q̄_p)}, it is conjugate upper triangular with diagonal ψ_{v,i}, whose restriction on an open subgroup of inertia is ∏_{τ:F_v→Q̄_p}τ(Art_v⁻¹σ)^{−(λ_{τ,n−i+1}+i−1)}, using geometric Artin reciprocity. Assume r̄ absolutely irreducible and decomposed generic, r̄(G_{F(ζ_p)}) adequate, and a scalar value r̄(σ) with σ outside G_{F(ζ_p)}. Suppose a regular algebraic cuspidal ι-ordinary π exists with r̄_ι(π)≅r̄, for an isomorphism ι:Q̄_p≅C. Then there is a regular algebraic cuspidal ι-ordinary Π of weight ιλ with r_ι(Π)≅ρ. For v∤p where both ρ and π are unramified, Π_v is unramified. No unramifiedness at p is asserted; the seed’s weight can differ from λ. This exports MT Theorem 1.3 for BCGNT’s ordinary application without planning the Dwork or symmetric-power construction using it.

**Construction or proof.**

1. For n=1 use rank-one character realization. For n≥2 follow the ordinary solvable preparation and the adequate prepared lifting verification.
2. Use ordinary soluble base change/descent, identify the descended representation with ρ, and read its weight from the prescribed inertia characters.
3. Use the common-unramified conductor/descent argument away from p; the same weak local–global consequence as in WZ.4 is needed.

**Acceptance.**

- Every MT Theorem 1.3 hypothesis appears, including potential semistability and the open-inertia character formula.
- The ordinary companion retains adequate image and the scalar witness.
- The common-unramified conclusion is restricted to v∤p.

**Direct dependencies:** `WeightZeroCrystallineAutomorphyLifting:WZ.5/adequate-ordinary-patching-verification`, `WeightZeroCrystallineAutomorphyLifting:WZ.4/rank-one-character-realization`, `PotentialAutomorphyInfrastructure:PA.2/iota-ordinary-automorphic-representation`, `PotentialAutomorphyInfrastructure:PA.2/iota-ordinary-soluble-base-change`, `PotentialAutomorphyInfrastructure:PA.5/soluble-base-change-and-descent`, `AutomorphicGaloisRepresentationsPartII:AG2.5`.

**Sources:** MT23, Theorem 1.3, pp. 2–3; proof framework §8, pp. 28–30. Adequate ordinary automorphy lifting; this node records the proof-specific arithmetic instance, with supplier-owned objects kept as inputs.; ACC23v2, §6.6.1–6.6.10, pp. 179–189. Prepared ordinary local conditions, weight specialization and pointwise support/descent.; BCGNT25, §6.2, proof of Theorem 6.2.4, p. 60. Application of the adequate ordinary theorem, preserving common-unramified places.

## Dependency contracts

Each contract below specifies an input needed from its owning layer. The packet gives the precise consuming nodes. The generic supplier object is imported once; only its arithmetic specialization is a target here.

- **`ArithmeticLocallySymmetricSpaces:ALS.1`:** Good compact-open adelic products for the specified hyperspecial/Iwahori/pro-v Iwahori factors, their local systems and two-residue-characteristic neatness (n≥2); export the diagonal residue homomorphism at R.
- **`ArithmeticLocallySymmetricSpaces:ALS.5`:** ACC Theorem 2.4.10(1)–(2), pp. 52–55: after localization at an absolutely irreducible residual system, rational ordinary Betti cohomology is cuspidal, occurs in every degree of [n(n−1)f/2,n(n−1)f/2+nf−1] when nonzero, and its Hecke eigensystems are exactly the specified cuspidal weight-zero systems. Include dual-shift conventions.
- **`AutomorphicSpectralTheory:AS.5`:** Franke’s automorphic-cohomology decomposition and the exclusion of proper-parabolic summands under residual irreducibility used in ACC Theorem 2.4.10; an inclusion of cuspidal cohomology alone is insufficient.
- **`AutomorphicGaloisRepresentationsPartII:AG2.7`:** The characteristic-zero weight-zero cuspidal Galois attachment and residual non-Eisenstein maximal-ideal dictionary; Frobenius uniqueness; split image-detecting test-place preservation of decomposed genericity under soluble restriction, without assuming enormous image.
- **`IntegralHeckeAndGaloisDeterminants:IHG.5`:** Arithmetic tame-type and unrestricted-place factorization from ACC Theorem 3.1.1/Proposition 6.5.3, pp. 167–168, compatible with crystalline CN maps at p and the geometric-Frobenius Hecke dictionary; uniform finite sum/product error bounds and deformation-to-Hecke surjectivity. Generic nilpotent algebra alone does not provide these local Galois conditions.
- **`LocalGaloisDeformationRings:R08.3`:** Import the designated WeightZeroCrystallineLiftingRings sibling’s BCGNT Theorem 2.5.5, pp. 28–29: for every p>n and local K/Q_p, the framed weight-zero crystalline quotient has generically reduced special fibre. The sibling has no stage id in this catalogue; do not invent one or relocate its proof here. R08.3 is the explicit supplier bridge to be pointed at the sibling’s stage once allocated.
- **`DeformationAndDerivedPatchingAlgebra:P9`:** General Noetherian O-flat generically-reduced-special-fibre ⇒ DVR at special-fibre minimal primes ⇒ unique generic generalization; geometric coefficient descent and completed-tensor/power-series component products, codimension-one special generic points, dimension additivity and generic regularity. CN Lemma 5.3.3 is rank-two BT-specific; extract its general algebra argument instead of importing that narrower assertion.
- **`PotentialAutomorphyInfrastructurePartII:PL.1`:** For two crystalline weight-zero lifts with the same residual representation, export the BCGNT Remark 3.2.2 interpretation of connects as common geometric component of the base-field crystalline quotient, and independence of frames/coefficient enlargement. The existing connects definition quantifies sufficiently large K′; verify this comparison instead of assuming common base-field components from it.
- **`GlobalGaloisDeformations:G7`:** Part II adequate-image Taylor–Wiles prime and selected-block local D_v^1 interfaces of MT §6/Proposition 6.7, pp. 19–22, with q prime places, Δ∞ rank q and g=q−n²f relative presentation variables, ζ_p∉F, |Q|=q, Q∩Q^c=∅ and prescribed imaginary-quadratic splitting. Extend the enormous qn direction; retain G8’s variable-determinant functor. For the full BCGNT prepared Theorem 3.2.5, also verify the ζ_p∈F boundary or supply an alternative adequate tower with a correct balanced presentation; MT Proposition 6.7 assumes ζ_p∉F. The final global theorem uses only the noncontainment case.
- **`SmoothRepresentationsOfLocalGroups:SR.2`:** Part II parahoric (n−d,d) invariants, last-block determinant diamond quotient, localized eigenvalue projectors and MT Theorem 2.14’s modular parahoric comparison, including d=n and repeated chosen eigenvalues; prove the actual localized level-growth input, not just an abstract finite-cover statement. Reconcile the source block convention before importing the global comparison: MT §3 defines the diamond kernel on the last block (pp. 10–11), and §2 selects that block (pp. 7–9), while §5 and Theorem 7.6 put the selected multiplicity d first (pp. 18, 26). Export the (n−d,d) convention with the selected polynomial, projector, last-block diamond and D_v^1 action transported together, including the boundary Hecke map; a permutation of the partition alone does not establish compatibility.
- **`SmoothRepresentationsOfLocalGroups:SR.5`:** Part II integral/residue-field selected-block Hecke calculation and local-parameter compatibility from MT §§2–3, pp. 3–15, used in its Theorems 7.6–7.7. Existing characteristic-zero Bernstein families do not supply this modular comparison. Handle nongeneric local complex representations in the actual local calculation. Reconcile the source block convention before importing the global comparison: MT §3 defines the diamond kernel on the last block (pp. 10–11), and §2 selects that block (pp. 7–9), while §5 and Theorem 7.6 put the selected multiplicity d first (pp. 18, 26). Export the (n−d,d) convention with the selected polynomial, projector, last-block diamond and D_v^1 action transported together, including the boundary Hecke map; a permutation of the partition alone does not establish compatibility.
- **`ArithmeticLocallySymmetricSpaces:ALS.6`:** MT Theorem 7.6, pp. 26–27, localized K→K₀(Q) comparison and RΓ(K₀(Q))≅RΓ(Δ_Q,RΓ(K₁(Q))); after duality export derived O[Δ_Q]-coinvariant augmentation and uniformly bounded perfect representatives, compatibly for χ and 1. Coordinate selected-block inputs with SR.2/SR.5. Reconcile the source block convention before importing the global comparison: MT §3 defines the diamond kernel on the last block (pp. 10–11), and §2 selects that block (pp. 7–9), while §5 and Theorem 7.6 put the selected multiplicity d first (pp. 18, 26). Export the (n−d,d) convention with the selected polynomial, projector, last-block diamond and D_v^1 action transported together, including the boundary Hecke map; a permutation of the partition alone does not establish compatibility.
- **`DeformationAndDerivedPatchingAlgebra:P8`:** Reuse the existing finite-level/two-system patching API over O and over the ordinary branch Λ, preserving residual comparisons and a uniform error bound; ordinary completed-homology towers use weight specialization and the normalized dual action, not the weight-zero coefficient complex.
- **`PotentialAutomorphyInfrastructure:PA.5`:** Part II soluble local-prescription preparation with every p-place and every residual/cyclotomic/genericity test place split completely, disjoint residual fields and cyclic real degree enlargement; bad-away-p semistable/unipotent prescriptions and the corrected three-imaginary-quadratic splitting construction. Existing Fontaine–Laffaille preparation assumes p absolutely unramified and cannot be imported verbatim.
- **`AutomorphicGaloisRepresentationsPartII:AG2.5`:** Varma’s nonselfdual semisimplified local–global comparison: if the automorphic local parameter becomes unramified over a finite extension (hence has N=0 and finite inertia) and its attached Galois representation is already unramified, the local parameter is unramified. Together with the all-place local LLC-compatible soluble descent, this removes auxiliary and descended common-unramified ramification; no stronger full monodromy theorem is required.
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`:** Use the existing geometric local/global Artin compatibility and reciprocity, with local conductor normalization from Layer 7, for the rank-one algebraic Hecke-character realization. The rank-one locally algebraic p-adic character comparison is an arithmetic corollary owned here, not a redesign of reciprocity.
- **`PadicHodgeTheory:R06.2`:** Part II coefficient-valued rank-one character comparison: Rank-one de Rham characters are locally algebraic on open inertia with the labelled HT exponents; a crystalline rank-one character of all weights zero is unramified. State this with geometric Artin reciprocity and verify it at ramified p-adic fields. The existing potentially-unramified-and-characters node is Q_p-valued and does not provide arbitrary labelled coefficient-E exponents.
- **`AutomorphicGaloisRepresentationsPartII:AG2.0`:** Rank-one algebraic Hecke-character/GL₁ automorphic dictionary with HT convention, geometric local reciprocity, finite conductors and the p-adic realization; support the rank-one global class-field argument rather than invoking polarized higher-rank geometry.
- **`PotentialAutomorphyInfrastructure:PA.4`:** Adequate ordinary Part II instance of ACC §6.6.1–6.6.10: Λ-normalized dual completed homology, roots-of-unity weight compatibility, nilpotent maps and weight specialization (Corollary 6.6.6; Propositions 6.6.7–6.6.9). Replace only the enormous prime input by MT’s adequate tower and apply the pointwise maximal-dimensional-component argument; do not claim ordinary full support.
- **`LocalGaloisDeformationRings:R08.5`:** Ordinary local rings over a chosen minimal-prime branch of the weight algebra, ACC Lemma 6.2.26(3): a characteristic-zero ordinary lift with distinct inertia characters lies on a maximal-dimensional component. Supply the ordinary dimension and point criterion used by ACC Corollary 6.3.9.

The full prepared support theorem has a distinct cyclotomic boundary. Under ζ_p∉F the stated adequate tower gives its arithmetic proof. Under ζ_p∈F the eight source preparation conditions still make sense, but MT Proposition 6.7 is unavailable as stated. An adequate tower and its balanced presentation in this boundary are a separate required G7 input. The final global lifting theorem uses the noncontainment branch because its scalar witness forces ζ_p∉F.

## Source and convention checks

Use the following public versions, with internal page numbers. The packet records PDF hashes and the access date, 11 October 2026. All statements and proof outlines here are our own mathematical specifications.

- [The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://www.math.uchicago.edu/~fcale/papers/SatoTate.pdf), George Boxer, Frank Calegari, Toby Gee, James Newton and Jack A. Thorne. Forum of Mathematics, Pi 13 (2025), e10; author-hosted published copy, DOI 10.1017/fmp.2024.29. Read scope: §3.1–3.2, pp. 30–35, complete owned direction; Theorem 2.5.5 and its use in Lemma 3.2.4, pp. 28–29, 33–34; sibling-owned result only; §6.2, proof of Theorem 6.2.4, p. 60, ordinary lifting application only.
- [Automorphy lifting with adequate image](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A36C754C24E9258E1E062C62378BF1E/S2050509423000038a.pdf/automorphy-lifting-with-adequate-image.pdf), Konstantin Miagkov and Jack A. Thorne. Forum of Mathematics, Sigma 11 (2023), e8, DOI 10.1017/fms.2023.3; published PDF. Read scope: Theorems 1.2–1.3, pp. 1–3; §§2–3, pp. 3–15, selected-block local representation calculations; §5, pp. 17–20, block order and boundary Hecke maps; §6, pp. 20–22, especially Proposition 6.7; Theorems 7.6–7.7, pp. 26–28; §8, pp. 28–30, finite-level tower and adequate substitution.
- [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3), Ana Caraiani and James Newton. arXiv:2301.10509v3; theorem locators refer to this version. Read scope: Theorems 4.2.15 and 4.3.1, pp. 71–73, imported crystalline compatibility; Lemma 5.3.3 and Proposition 5.4.2–Corollary 5.4.3, pp. 76–79, imported commutative algebra and two-system support.
- [Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999v2), Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne. arXiv:1812.09999v2, 16 June 2022; source for the 2023 publication; PDF internal pagination used here. Read scope: Theorem 2.4.10 and proof, pp. 52–55; Lemma 6.2.25–6.2.26, pp. 146–147; §6.4.1–6.4.2 patching interface, pp. 157–165, selected statements; Proposition 6.5.3 and proof, pp. 167–168; §6.5.12, pp. 175–179, entire soluble preparation/descent argument; §6.6.1 and §§6.6.7–6.6.10, pp. 179–189, ordinary weight/augmentation and descent interfaces.

The prepared complementary-degree inequality uses [F⁺:Q]/2. The constant Hecke coefficient includes (−1)^n. The adequate presentation uses g=q−n²f, with q diamond directions. The source recollections dropping a factor of n do not define a different presentation. Soluble descent uses local LLC-compatible base change at every finite place, and the quadratic preparation includes the residual-image test-prime congruences. These corrections are recorded with source locators in the packet.

The suggested file has the exact subgroup selector and inverse scalar-action signatures, their algebraic APIs and eight tests, together with the integer dimension-count core. Every arithmetic target, API item and test without a baseline carrier is indexed there by its packet name. No omitted condition is represented by an unconstrained proposition field. Instantiating the actual supplier carriers, proving the listed APIs and running the discriminating examples are requirements of the corresponding layers.

The MT selected-block convention also requires a supplier comparison. Its local projector and diamond kernel select the last block (§§2–3, pp. 7–11), while later displayed partitions put that block first (§5, pp. 18–20; Theorem 7.6, p. 26). The tower here consistently uses (n−d,d), selected block last. SR.2/SR.5/ALS.6 must transport the selected polynomial, projector, level, diamond action and boundary Hecke map together before applying the global comparison. Source issue E7 and the corresponding open gap record this requirement.
