# Roadmap: K-theory of finite and local fields

**Summary.** Compute the higher algebraic K-groups of finite fields and nonarchimedean local fields, together with the maps that arithmetic applications use. The build starts with Brauer lifting and Quillen's finite-field model, passes through henselian rigidity and integral K₂, and constructs the logarithmic trace calculations needed at the residue characteristic. Its end results distinguish integral groups, finite coefficients and derived completion, identify the completed local groups through Galois cohomology, and compare all these maps with completion of number fields. The characteristic-two hermitian applications and finite-rank symplectic Chern-class calculation retain their separate hypotheses.

## Scope and ownership

This roadmap owns the finite-field Brauer lift and its comparison with the plus construction, the finite-field calculation with its operations and transfers, henselian rigidity in this application, Moore's local K₂ structure theorem, the Hesselholt–Madsen logarithmic DVR model and its explicit calculations, the assembly of local higher K-groups, and their arithmetic completion interfaces.

The following are boundaries, rather than additional targets. GeneralAlgebraicKTheory supplies exact-category K-theory, its plus comparison, localization, dévissage, products and transfers. KTheoryLowDegrees supplies determinant and semilocal K₁. K2SymbolsBrauer supplies Matsumoto's presentation, ordinary residues, Hilbert symbols and their class-field-theoretic interpretation. RefinedTraceMethods supplies ordinary HH, THH, cyclotomic spectra, the general trace and the modern comparison machinery. CrystallineCohomology supplies ordinary and logarithmic de Rham–Witt objects and their universal properties. StableHomotopyKTheory supplies spectra, plus constructions, coefficient cofibres and completion. The finite-coefficient étale comparison here uses motivic foundations from MotivicEtaleKTheory; it does not assume that roadmap's later regulator applications. General higher Chern classes and rational regulators remain there and in PadicHodgeRegulators.

Tau Ceti's GrothendieckEulerForms already owns the Grothendieck-group framework; the library's dimension equivalences give K₀ of a field. LocalFieldsRamification, LocalGaloisGroups, ClassFieldTheory, ProfiniteCohomology and NumberFieldArithmetic already own the local fields, arithmetic reciprocity, Galois coefficients and completion algebras used below. RepresentationTheory/InductionRestriction owns Brauer induction and the integral virtual-character lattice. QuadraticFormInvariants and the current quadratic-form library own their classical Witt rings and cancellation; the symmetric bilinear characteristic-two groups below are a different application of Poincaré-category L-theory. General Poincaré GW/L spectra, the fundamental square and the finite-vcd₂ homotopy-limit theorem are supplier contracts, not reconstructed in this roadmap. The current library's general additive Tate module is also a supplier, not a second inverse-limit construction here.

## Conventions

Use connective algebraic K-theory unless a nonconnective localization theorem is explicitly invoked. For m ≥ 1 set K(R; ℤ/m) = cofib(m: K(R) → K(R)); write Kₙ(R; ℤ/m) for its homotopy group. The Bockstein lands in Kₙ₋₁(R)[m], not in a quotient. Write K(R; ℤₚ) = holimν K(R; ℤ/p^ν). An integral group, its tensor product with ℤₚ, its ordinary inverse-limit completion, and the homotopy group of this completed spectrum have separate meanings throughout.

A finite field has q = p^f elements, with p prime and f ≥ 1; hence q ≥ 2. A local field E has integer ring O, uniformizer π, finite residue field k = 𝔽q and normalized valuation v(π) = 1. The letter A also denotes a complete mixed-characteristic DVR with perfect residue field k, which need not be finite. Its absolute ramification index is e = v(p). In the mixed-characteristic Hesselholt–Madsen calculations in Layer 5, p is odd. Statements allowing p = 2 say so explicitly.

Write K₂ symbols additively, and roots of unity multiplicatively. The localization boundary is left linear: ∂(x·y) = r(x)·∂y for an integral class x, and ∂[π] = 1. Thus ∂{u,π} = ū and ∂{π,u} = ū⁻¹ for u ∈ O×. This is the inverse of the tame symbol used in the K-book's symbol presentation. Local reciprocity sends a uniformizer to arithmetic Frobenius. Our Hilbert symbol is (a,b)ₘ = rec(a)(b^(1/m))/b^(1/m); Sharifi §9.3 reverses the two inputs. Accordingly the tame Hilbert symbol is the negative power of our localization boundary, as computed in Layer 3.

Tate twists use the cyclotomic Galois action. The notation ℚₗ/ℤₗ(i) denotes that twist of a divisible torsion group; it is not its ordinary i-fold tensor product as an abelian group. Put Wᵢ(E) = H⁰(E, ℚ/ℤ(i)) and wᵢ(E) = #Wᵢ(E) when i ≠ 0 and this group is finite. A cyclic description ℤ/w specifies an abstract isomorphism unless a generator or an equivariant map is supplied.

For classical traces, TRⁿ = T^(C_{p^(n−1)}) for n ≥ 1. R is cyclotomic restriction; F is inclusion of fixed points; V is transfer. Adjacent-level maps require n ≥ 2. On TR = holim_R TRⁿ the map R becomes the identity, and TC is the homotopy equalizer of id and F. Multiplication comes from that equalizer of ring maps, not from treating id − F as a ring map. A pro-isomorphism is never silently replaced by a levelwise isomorphism.

K-book citations refer to the author draft of 29 August 2013; its PDF page is the printed page plus eight. HM03 means the January 2004 author version of the 2003 Annals paper, with its own page numbers. Other versions are fixed under References.

## Exact supplier contracts

### From Mathlib and Tau Ceti

At the pinned Mathlib revision, use `GaloisField`, `FiniteField.frobeniusAlgEquivOfAlgebraic`, `IsGalois.card_aut_eq_finrank`, `FiniteField.norm_surjective`, `FiniteField.algebraMap_norm_eq_pow`, `Algebra.norm` and `LinearMap.det_restrictScalars`. `Matrix.card_GL_field` supplies the order of GL, not its stable cohomology. `AdjoinRoot.tensorAlgEquiv` and primitive-element/Galois APIs supply the algebraic ingredients for decomposing a finite Galois tensor square. Their use requires a genuine separable extension, not merely an equality of cardinalities.

Use `WittVector` with its ghost components, injectivity over p-torsion-free rings, Teichmüller map, Frobenius and Verschiebung, and `TruncatedWittVector` with truncation. These are the carriers for Wₙ; quotienting by the ideal pWₙ(A) is not componentwise reduction. `KaehlerDifferential.D`, exterior powers, polynomial derivatives and Eisenstein polynomials supply the ordinary algebra underlying logarithmic differentials. There is no de Rham–Witt complex or THH/TR/TC carrier at these pins.

Use `HenselianRing`, `HenselianLocalRing`, `IsDiscreteValuationRing`, `IsLocalRing.ResidueField`, `IsNonarchimedeanLocalField`, `AdicCompletion`, `NumberField`, `HeightOneSpectrum.adicCompletion` and their ring maps. Tau Ceti's `HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem` supplies prime-to-residue-characteristic root lifting; `rootsOfUnityEquivResidueField`, `teichmuller` and `normalizedValuation` identify the tame units and fix v(π). `HeightOneSpectrum.adicCompletionExtension` and `residueFieldEquivAdicCompletion` supply the arithmetic maps and residue identification.

Use `TauCeti.SplitK0.finrankEquiv` and `TauCeti.AbelianK0.finrankEquiv` for the existing dimension identifications, together with the exact-category comparison supplied below. For virtual representations use `FDRep`, `TauCeti.AbelianK0`, `TauCeti.repRing`, `repRingCharacter`, `virtualCharacters`, and `Representation.baseChange`. The character map is injective on the integral virtual-character lattice; it does not turn a modular representation into an honest complex representation.

Mathlib's `groupCohomology`, `groupHomology`, `tateCohomology`, projective resolutions and mapping cones provide the algebraic Tate comparison. Tau Ceti's `TateCohomology.H0LinearEquivTrivialIntZModCard` fixes the trivial integral-coefficient computation. The current library module `TauCeti.Algebra.Module.Torsion.TateModule` supplies compatible p-power torsion families, projections, functorial maps, the ℤₚ action and the finite-rank freeness criterion. Consume this carrier for Tₚ(B). The additional elementary lemmas needed for completion are stated in §6.2 on this carrier; they are not declarations already supplied by this module. Its `nonempty_linearEquiv_of_natCard`, `free_of_natCard` and `finrank_eq_of_natCard` supply the finite-rank freeness criterion. The latter statement does not identify the Tate module of an infinite direct sum with an unrestricted product. Tₚ(ℤ) = 0, whereas the ordinary p-adic completion of ℤ is ℤₚ.

For cardinal arguments use `exists_isTranscendenceBasis`, `IsTranscendenceBasis.isAlgebraic`, `AlgebraicIndependent.aevalEquiv`, `MvPolynomial.cardinalMk_le_max`, and `Algebra.IsAlgebraic.cardinalMk_le_max`, with its domain and torsion-free scalar hypotheses. `PowerSeries.mk`, `PowerSeries.coeff_mk` and `HahnSeries.ofPowerSeries_injective` embed binary sequences into Laurent series. These inputs do not assert uncountability of a K-group by themselves.

### From the foundational K-theory roadmaps

GeneralAlgebraicKTheory Layers 1–3 and 7 must provide one functor K on exact/Waldhausen categories, its `BGL(R)⁺` comparison on positive homotopy, filtered-colimit and finite-product preservation, dévissage, projective resolution, localization, and restriction of scalars for finite projective algebras. Products must include external and mixed finite-coefficient pairings, projection formulas and the left-linear DVR boundary above. Its general DVR sequence must retain the residue coefficient line when dualities are present. KTheoryLowDegrees Layers 3, 5 and 6 supply SK₁ = 0 for commutative semilocal rings, determinant K₁(F) ≃ F×, norm as degree-one transfer, and the valuation boundary.

StableHomotopyKTheory Layers H.1–3, H.5 and H.6 supply coherent classifying spaces, plus acyclicity and its universal property for maps to H-spaces, homotopy fibres, coefficient cofibres and their natural maps, Milnor's exact sequence for countable towers, and invariance of lim and lim¹ under pro-isomorphism. In its package, H.6 is Layer 7: §§7.13–7.15 supply the completion extension and finite-generation comparison, §7.31 supplies multiplicative Moore structures for prime powers outside {2,3,4,8}, and §7.33 supplies Browder's finite-field product refinement. Surjective or Mittag–Leffler towers have vanishing lim¹, without a finite-group hypothesis. Completion preserves fibre sequences. A spectrum whose homotopy is uniformly killed by a fixed power of 2 is derived 2-complete.

**Gap: Eilenberg–Moore.** The multiplicative Eilenberg–Moore spectral sequence required by §1.7 is not an export of H.6. Its simply connected, finite-type pullback theorem, product comparison and convergence need a registered foundational target; a spectral sequence of a filtered spectrum alone does not provide them.

RefinedTraceMethods' topological K-theory layer supplies BU, KU, Bott periodicity, the Atiyah λ-ring map Rℂ(G) → KU⁰(BG), integer Adams H-maps and their action k^i on π₂ᵢBU. It must also supply Atiyah–Segal completion for finite G, KU¹(BG) = 0, and the compact Hausdorff augmentation-kernel argument controlling lim¹ over GLₙ. For every prime ℓ ≠ p, the ℓ-completed variant supplies continuous Adams operations for k ∈ ℤₗ×. Together these accommodate a prime-to-p profinite change of the Brauer embedding; an operation on KU completed at the residue prime p alone would not do so. General integer exponentiation does not implement such a global change. SchemeKTheoryOperations Layer 6 supplies higher λ/Adams operations, their composition law, Hiller's universality, and ψᵖ = Frobenius on characteristic-p algebras. Its perfect characteristic-p consequence is unique p-divisibility of positive K-groups, with the source hypotheses retained.

K2SymbolsBrauer Layers 2–4 and 7 supply the comparison of Milnor and Quillen K₂, Steinberg relations, residues and transfers, Hilbert-symbol bilinearity, nondegeneracy, exponent changes and reciprocity. No second finite-field symbol computation is built here. For the cardinal argument use its higher Milnor residues and norm/restriction degree identity.

**Gap: topological exports.** RT.4:topological currently states KU/Bott, but does not state the Atiyah–Segal, tower lim¹ or continuous completed-Adams exports required above. Those precise exports need a registered supplier target before §§1.3–1.7 can have a closed prerequisite chain.

### From trace, differential and arithmetic suppliers

RefinedTraceMethods Layers 1–3 supply cyclic HH with Connes B, cyclic homology and SBI, characteristic-zero HKR and filtered-colimit compatibility, genuine and modern cyclotomic spectra, the bounded-below comparison between them, the cyclotomic trace, nilpotent relative comparison with its completion hypotheses, and rational relative K ≃ HC shifted by one. The classical linear Waldhausen model below is required because its logarithmic DVR value is not ordinary THH of the fraction field.

CrystallineCohomology Layer CR.4 supplies the classical characteristic-p and relative p-typical Witt complexes, including R,F,V,d and the projection formula. Its logarithmic algebra layer supplies prelog rings and universal log differentials. This roadmap owns the mixed-characteristic DVR presentations, homotopy-orbit comparison and trace calculation.

**Gap: absolute logarithmic Witt complexes.** The required initial Witt complex of a prelog ℤ_(p)-algebra, with its absolute differential, standard filtration, `FdV = d` at odd p and `Fd[a] = [a]^(p−1)d[a]`, is not the relative Wₙ(A)-linear complex in CrystallineCohomology §CR.4.6. Nor is its semistable characteristic-p embedding model a universal prelog construction. The initial-object, level-one and filtration statements needed from HM03 Proposition3.2.2/Addendum3.2.3 p.49 still need an owner; HM04 TheoremD pp.1–3 proves the nonlogarithmic analogue, so its extension to prelog rings must be established before §§5.3–5.6 can consume them.

LocalFieldsRamification Layers 0–2 supply finite extensions as local fields, the henselian DVR integer ring, finite roots of unity, the units/principal-units decomposition, unramified extensions and their residue Frobenius. A coefficient-ring presentation for an arbitrary perfect residue field requires the complete Cohen/Witt lifting theorem; the finite-residue unramified-extension theorem alone is insufficient. This additional input is made an explicit target in §5.2. ClassFieldTheory Layers 5–8 supply local reciprocity with arithmetic Frobenius, its norm kernel, finite-module local duality, finiteness and the local Euler characteristic. In particular consume `kummerEquiv_mixed`, `finite_H`, `tateDualityPairing_perfect_mixed`, `eulerCharacteristic_mixed`, and Layer 6’s `cd_p_absoluteGaloisGroup_eq_two`; these are statements for finite smooth discrete coefficients over finite p-adic fields. Layer 7 fixes the absolute Artin map and its cyclotomic unit normalization. ProfiniteCohomology Layer 9 supplies surjectivity of Kummer's map; the pinned `TauCeti.kummerClassMap_injective` supplies its injective half. LocalGaloisGroups Layers 0 and 5–6 supply the cyclotomic-character image and its local reciprocity comparison, including `range_localCyclotomicCharacter_ratPadic` and its finite-extension index bound; use LocalFieldsRamification for the inertia/residue sequence. NumberFieldArithmetic Layer 5 supplies completion maps in towers and `K_v ⊗[K] L ≃ ∏_(w|v) L_w` with its value on pure tensors.

MotivicEtaleKTheory Layers 1 and 4–7 supply field étale/Galois comparison, henselian étale rigidity for invertible coefficients, diagonal motivic cohomology as Milnor K-theory, norm residue for invertible coefficients, Bloch–Gabber–Kato in characteristic p, with the separate Geisser–Levine p-torsion and logarithmic-symbol comparison additionally required as specified below. More precisely, M.6a–b supply the filtered motivic spectrum, layer identification and convergence; M.7 supplies étale sheafification, its comparison map and the Quillen–Lichtenbaum range. These foundational comparisons are used in §6.6 independently of M.8's regulators. The map Kᵢᴹ → Kᵢ → Kᵢᴹ has composite (−1)^(i−1)(i−1)! (K-book Lemma V.11.13, p.458). ArithmeticGaloisDuality's continuous-coefficient layer supplies cohomology of ℤₚ(i), ℚₚ(i) and ℚₚ/ℤₚ(i), with lim¹ controlled before exchanging cohomology and limits, and its local-conditions layer supplies unramified inflation subgroups. The finite-coefficient Chern/étale-edge construction in §6.6 is an early export of this roadmap; it must precede regulator theory.

GeometryOfNumbersAndQuadraticArithmetic §6.8a supplies the general Poincaré categories, symmetric structures, GW and L spectra, Ξ: L → K^(tC₂), the cartesian GW/L/K homotopy-fixed/Tate square, and the classical-to-symmetric connective comparison. Its §6.9 supplies symmetric localization with the derived residue coefficient line; its §6.10 supplies the finite-vcd₂ characteristic-not-two homotopy-limit theorem. Consume its `finiteEvenFieldHomotopyLimit` for finite characteristic-two fields, including the bilinear Witt calculation, equivariant rank comparison and metabolic shifts; those are not additional targets here. HermitianKTheoryOfPoincareCategories HK.0–1 supplies general shift transport and periodicity, and HK.7 supplies field L-theory comparisons between flavours. The bounded-exponent Witt theorem for nonreal local fields is a separate input of §6.13. For the finite-rank Sp calculation require the Lang/geometric étale comparison compatible with compact Sp → SU, not merely the order of a finite classical group. These contracts are distinct from the classical characteristic-not-two quadratic Witt ring already present in Tau Ceti.

**Gap: early Chern and geometric exports.** M.8 currently owns the universal Chern construction, while M.7 uses this roadmap’s rigidity layer. Consequently M.7 and M.8 cannot be inputs to the early finite-field operation used in §1.11. The independent universal-class/Moore-Hurewicz construction with the exact `chern_unit_bott` and `chern_edge_finiteField` exports of §6.6 still needs an earlier supplier or an explicitly moved foundational target. M.1’s field/scheme cohomology alone also does not supply the Lang/classifying-group étale spectral sequence required in §1.11. Its required groups, transgression and comparison maps are stated there.

**Gap: characteristic-p comparison.** M.5 names Bloch–Gabber–Kato, but its current exports do not state the separate Geisser–Levine K-theory comparison required in §§5.17,6.10–6.11. That theorem and the regular-local filtered-colimit passage must be supplied independently of those applications.

## How to read the build

Layer 1 supplies finite residue terms and their functorial models. Layer 2 extracts the prime-to-p information from henselian rigidity. Layer 3 settles integral K₂, including the wild roots of unity. Layer 4 establishes the classical logarithmic trace and its localization interface. Layer 5 performs the residue-characteristic calculations, with the low-degree argument ordered before the Tate-spectral-sequence induction. Layer 6 combines them with local duality and abelian-group structure; Layer 7 exports the resulting maps to arithmetic consumers. Heavy constructions are stated here with their intended APIs; the suggested Lean file records only signatures expressible using the pinned carriers.

## Layer 1: finite fields, Brauer lifting and Quillen's model

### 1.1 Finite coefficients and their products

Define `coeff R m` and `coeffGroup R m n` by the coefficient cofiber for m ≥ 1. The API consists of `reduce`, `bockstein`, `coeff_exact`, natural ring maps and finite-projective `coeffTransfer`, identity/composition laws, filtered-colimit preservation, coefficient inclusion and reduction for m | m′, and a Chinese-remainder equivalence for coprime moduli. In all degrees the exact sequence is

```text
0 → Kₙ(R)/m → Kₙ(R; ℤ/m) → Kₙ₋₁(R)[m] → 0.
```

Negative groups vanish for connective K, and degree zero is K₀(R)/m. Preserve the inclusion map a ↦ (m′/m)a separately from reduction; their Bockstein squares have different multipliers (K-book IV.2.4–2.5, pp.280–281; PDF288–289). *Needs:* coefficient cofibres and the functor K.

Construct products for m = ℓ^ν outside {2,3,4,8} using multiplicative Moore spectra, and the additional finite-field products supplied by Browder when positive even integral groups vanish. Record associativity, unit, graded symmetry and naturality at the exact multiplicative level actually constructed; an arbitrary cofiber is not an Eilenberg–Mac Lane module (K-book IV.2, Products and Theorem2.8/Scholium2.8.1, pp.281–282).

**Checks.**

- For m = 1 the spectrum and all coefficient groups are zero.
- K₁(𝔽₅; ℤ/4) = ℤ/4, and degree zero agrees with the supplied dimension equivalence modulo 4.
- K₂(𝔽₃; ℤ/2) = ℤ/2 although integral K₂(𝔽₃) = 0; tensoring the integral group gives the wrong answer.
- K₂(ℤ; ℤ/2) = ℤ/4. This detects the false assertion that every coefficient group is a ℤ/m-module (K-book ExampleIV.2.5.1, p.280).

### 1.2 Bott classes

Construct `bott ω` for a root ω of exact order m ≥ 2 using the Moore-space map to Bμₘ and then BGL(R)⁺. Its Bockstein is [ω]. Extend the construction to all μₘ when discussing additivity, retain naturality only with the appropriate image-root hypothesis, and prove compatibility with coefficient reduction and compatible roots. Any other Bockstein lift differs by K₂(R)/m. The map ω ↦ βω is additive when m is not congruent to 2 modulo 4; unrestricted additivity is false (K-book IV.2.5.2–2.5.3 and Exercise2.4(b), pp.280–281,284). *Needs:* §1.1 and the plus model.

**Checks.**

- For ω = 2 in 𝔽₅× and m = 4, β₂ generates K₂(𝔽₅; ℤ/4), as its Bockstein generates 𝔽₅×.
- For ℤ and m = 2, β₋₁ has order four and 2β₋₁ is the image of {−1,−1}; additivity on μ₂ would incorrectly kill this double.
- Over a field of characteristic two there is no root of exact order two. Over 𝔽₃ the corresponding coefficient Bott class exists and has order two.
- The determinant of the Bockstein is exactly ω, rather than ω⁻¹.

### 1.3 Brauer characters

Fix a compatible embedding ι: 𝔽̄p× → ℂ×. For a finite-dimensional 𝔽q-representation V of a finite group G, define `brauerCharacter V g` as the sum of the lifts under ι of all eigenvalues of g, counted with multiplicity. This uses the semisimple prime-to-p part of g and ignores its unipotent part. Prove `character_one`, conjugacy invariance, short-exact-sequence additivity, tensor multiplicativity, restriction and scalar-extension compatibility, the p-part reduction, and the Frobenius-twist formula χ_(Φ*V)(g) = χ_V(g^p). On the finite eigenvalue group μ_N, changing ι by an integer u coprime to N changes χ(g) to χ(g^u); a global change uses a unit in the prime-to-p profinite integers (Haine Definition5.7, pp.8–9; Mestel §5.3, p.11). *Needs:* finite-field eigenvalues and the virtual-character supplier.

**Checks.**

- The one-dimensional representation of 𝔽q× on 𝔽q has character z ↦ ι(z).
- For GL₂(𝔽₃)'s natural representation, χ of a nontrivial unipotent is 2 and χ(−I) = −2; direct enumeration gives normalized squared norm 2.
- For a trivial group, χ is the constant dim V; for a p-group every element has that value.
- Reducing a nontrivial complex character of C_p modulo p gives the trivial modular representation. Its Brauer character is 1, so Brauer character is not the original complex character of an arbitrary lift.

### 1.4 Green's integrality and the virtual Brauer lift

Prove that every symmetric integral polynomial in the lifted eigenvalues of a finite-field representation gives an integral virtual complex character. Reduce via elementary subgroups and the supplied Brauer characterization, keeping the integral lattice rather than only a rational class function (Green's theorem, Haine5.8 p.9; Mestel Theorem14 p.11). Define `brauerLift : R_𝔽q(G) →+* R_ℂ(G)` through character injectivity. Its API is character recovery, augmentation preservation, unit, restriction, scalar extension, λ-operations and Adams compatibility. In particular ψ^q fixes its image (K-book IV.5.8 p.315; Haine5.9–5.10 p.9).

Prove reduced stabilization: for diag(g,1), the lift of the next standard representation restricts to the current lift plus 1. Consequently ρₙ = β(stdₙ) − n is compatible with stabilization. For 𝔽_(q^r)× acting on 𝔽_(q^r), its lift is ∑_(j<r)ι^(q^j), by the separable tensor decomposition (Mestel §5.4 p.12; K-book IV.5.3.1 p.313). *Needs:* §1.3 and λ-ring suppliers.

**Checks.**

- The lift for a trivial group is the identity ℤ → ℤ; for a p-group it is dimension times the trivial character.
- The natural GL₂(𝔽₃) lift has norm 2 and no linear constituent, and is virtual rather than the character of a two-dimensional complex representation. A homomorphism GL₂(𝔽₃) → U(2) cannot define this lift.
- For r = 2 the cyclic lift has exactly the two characters ι and ι^q, each once.
- Subtracting n is essential: the unreduced standard lifts restrict with an extra trivial line.

### 1.5 The Adams homotopy fibre

Define `FPsi q` for q ≥ 2 as the homotopy equalizer of id and ψ^q on connected BU, equivalently the homotopy fibre of 1 − ψ^q. Its API gives projection to BU, the specified path between the two composites, an H-space structure, the lifting property, commuting Adams operations and the boundary from π₂ᵢBU. Prove π₂ᵢ = 0 for i ≥ 1 and π₂ᵢ₋₁ ≃ ℤ/(q^i−1); the space is connected. The induced ψ^k acts as k^i on the odd group. A map X → BU fixed by ψ^q lifts uniquely in homotopy classes if [X,U] = 0; a chosen homotopy always gives a lift, but uniqueness needs that hypothesis (Haine6.3,6.7–6.10 p.10; Mestel Lemmas12–13 pp.9–10). *Needs:* Bott periodicity, Adams maps and homotopy fibres.

**Checks.**

- π₁FPsi4 = ℤ/3, π₃FPsi2 = ℤ/3 and π₃FPsi3 = ℤ/8.
- q = 1 is excluded: the fibre of the zero map is BU × ΩBU and has nonzero positive even homotopy.
- The strict fixed-point subset of a chosen Adams representative fails homotopy invariance; the defining datum includes a path.
- The projection to BU annihilates all odd homotopy groups, so it cannot itself be the finite-field K-theory comparison.

### 1.6 Quillen's map

Define `quillenMap : BGL(𝔽q) → FPsi q` by lifting the Atiyah classes of the compatible reduced Brauer lifts. Finite-group KU¹ vanishing gives the finite-rank uniqueness; passage to stable GL requires the compact Hausdorff lim¹ argument, not an unproved algebraic Mittag–Leffler assertion. Prove finite-rank compatibility, extension across plus, determinant compatibility on π₁ and independence of choices on the induced K-groups (Haine Construction6.11 p.11; Atiyah–Segal Theorem2.1 and Proposition4.2, pp.3–4,10; K-book IV.1.12 p.269). At a fixed rank, an integer change of the finite eigenvalue embedding is represented by its Adams operation. Extending this to a global profinite embedding change requires the continuous completed Adams construction, with comparison back to the finite groups; retain that as a separate interface, not an integer-power formula valid on all roots. *Needs:* §§1.4–1.5 and the Atiyah–Segal contract.

**Checks.**

- At q = 2 both π₁ and K₁ are zero; at q = 5 the unit 2 maps to a generator of π₁ ≃ ℤ/4.
- The composite to BU is zero on odd K-groups even when K₃(𝔽₂) = ℤ/3 is nonzero.
- At rank two over 𝔽₃ the construction uses a virtual class, not a group homomorphism to U(2).

### 1.7 Cohomological detection and the finite-field theorem

For ℓ ≠ p let r be the order of q in 𝔽ℓ×. Compute H*(FPsi q; 𝔽ℓ) additively as a polynomial part on c_(jr) of degree 2jr and an exterior part on e_(jr) of degree 2jr−1, j ≥ 1. For odd ℓ prove this as a ring description, with the prescribed pullback of Chern classes and transgressions. The Eilenberg–Moore computation uses a simply connected base and finite type, so those hypotheses accompany the spectral sequence (Mestel Theorems19–20 pp.15–16 and Theorem30 p.25).

Normalize the odd classes before comparing generators: use the mapping-cylinder relative Chern difference c̃_(jr)⊗1−1⊗c̃_(jr) to obtain the class ẽ_(jr) with coefficients ℤ/(q^(jr)−1), whose Bockstein is the pullback of c̃_(jr). Define e_(jr) by its mod-ℓ reduction. An arbitrary nonzero exterior generator does not specify this normalization. Compute the positive-degree rational and mod-p cohomology of FPsi q as zero, since q^i−1 is invertible in those coefficient fields (Mestel Definition24 p.20, Theorem30 p.25 and §7 p.17). For ℓ = 2 retain the additive computation and supply the separate multiplicative argument when it is used.

For odd ℓ write n = rm+k, 0 ≤ k < r. Exhibit a Sylow ℓ-subgroup in C^m ⋊ Σ_m, using the cyclic torus 𝔽_(q^r)× and the GL order with the lifting-the-exponent calculation. Prove the normalizer-invariant detection and stability lemmas that identify stable GL cohomology with the preceding classes; an order calculation alone is not detection (Mestel Lemmas32–34 and Theorem35, pp.27–29). Supply the separate ℓ = 2 detection argument required for integral homology. Prove stable GL has zero positive mod-p homology and rational homology, then assemble the prime-by-prime equivalence of Quillen's map (Mestel §9, Theorem37 p.30, citing Quillen's original stable calculation). The finite-rank analogue of mod-p acyclicity is false: GL₂(𝔽₂) ≃ S₃ has nonzero H₁ with 𝔽₂ coefficients.

The precise odd-prime detection target is restriction
H*(GLₙ(𝔽q);𝔽ℓ) ≃ H*(C^m;𝔽ℓ)^(Σ_m⋊Π^m), where C = 𝔽_(q^r)× and Π = Gal(𝔽_(q^r)/𝔽q). The normalizer acts through permutations and the indicated field automorphisms. Prove Quillen's finite-rank map induces a surjection from H*(FPsi q;𝔽ℓ) to this cohomology and an injection in every fixed degree once n is sufficiently large; then take the stable limit. This records both detection and the stability range needed by the equivalence, rather than inferring either from the dimension of one group (Mestel Theorem35 and §9 p.29).

The final step is the homological Whitehead theorem for connected simple H-spaces and plus acyclicity. The simple-space statement is needed because FPsi q need not be simply connected. Deduce

```text
BGL(𝔽q)⁺ ≃ FPsi q,
K₂ᵢ(𝔽q) = 0,        K₂ᵢ₋₁(𝔽q) ≃ ℤ/(q^i−1)  (i ≥ 1).
```

These are K-book TheoremIV.1.12 and CorollaryIV.1.13, p.269. The plus and Q models must agree, including their degree-two symbol comparison. *Needs:* §§1.3–1.6, group (co)homology, detection, simple-space Whitehead, and the supplied K-theory models. The original detection and stable mod-p arguments are substantive proof obligations, not consequences of the cyclic answer.

**Checks.**

- For q = 4, ℓ = 3, r = 1, the normalized degree-one class has Bockstein the integral Chern pullback of order three; replacing this class by its negative changes that Bockstein.
- For q = 2, ℓ = 3, r = 2, the first exterior class has degree three and H¹ is zero. Introducing a degree-one exterior generator would fail this case.
- For q = 2, ℓ = 7, r = 3, the first exterior class instead has degree five; the indexing depends on the multiplicative order, rather than just on ℓ.
- Positive mod-p cohomology of the fibre is zero, while H₁(GL₂(𝔽₂);𝔽₂) is nonzero; the stable hypothesis on the GL assertion is essential.

### 1.8 Adams, Galois action, restriction and transfer

Using the higher-operation supplier, prove absolute Frobenius p acts as ψᵖ, hence by p^i on K₂ᵢ₋₁(𝔽q); ψ^k acts by k^i. This identification is through the Brauer comparison and universality, rather than an arbitrary automorphism of a cyclic group (K-book IV.5.5.2,5.7–5.9.2 pp.314–316; Haine Theorem3.1(c) p.5).

Define `finiteFieldRes` and `finiteFieldTransfer` by extension and restriction of scalars for 𝔽q ⊂ 𝔽_(q^d), d ≥ 1. Their API includes identities, composition in towers, agreement of plus/Q transfers independently of the chosen basis, Galois invariance, projection formulas, and compatibility with coefficients and Bockstein. Prove tr·res = d and res·tr = ∑g; the algebraic input is S⊗_R S ≃ ∏g S with the factor maps given by the actual Galois embeddings (K-book IV.1.1.3 p.261, IV.6.3.2 p.320 and ExerciseIV.6.13 p.327).

For i ≥ 1 restriction on K₂ᵢ₋₁ is injective onto Galois invariants and transfer is onto. With compatible choices of cyclic generators, restriction is multiplication by (q^(di)−1)/(q^i−1), and transfer is reduction modulo q^i−1. Arithmetic q-Frobenius acts on the source field's group by q^i. These formulas express the canonical maps but do not choose canonical generators. In degree zero restriction is identity and transfer multiplication by d, so the transfer-surjectivity assertion is explicitly positive-degree (K-book CorollaryIV.1.13 p.269). All products of two positive integral classes vanish, by parity; degree-zero integer multiplication remains (RemarkIV.1.13.1 p.269). Agreement with determinant, the field norm and the existing Milnor K₂ calculation is a comparison target, rather than a new determinant or symbol theorem.

**Checks.**

- For 𝔽₂ ⊂ 𝔽₄ in degree three, res: ℤ/3 → ℤ/15 has image 5ℤ/15, tr·res = 2 and res·tr = 5 = 1+4. Restriction is not onto and transfer is not injective.
- For 𝔽₃ ⊂ 𝔽₉ in degree one, transfer is x ↦ x⁴ and is onto; res·tr is 1+Frob₃ on the multiplicative group.
- The identity extension gives both identity maps. A degree-two extension gives multiplication by 2 on K₀ transfer, which is not onto ℤ.
- K₁(𝔽₃)·K₁(𝔽₃) lands in zero K₂, whereas 2 ∈ K₀ acts by ordinary doubling.

### 1.9 Coefficients, algebraic closure and derived completion

For m ≥ 1 and i ≥ 1 deduce K₂ᵢ₋₁(𝔽q; ℤ/m) ≃ K₂ᵢ(𝔽q; ℤ/m) ≃ ℤ/gcd(m,q^i−1). If m | q−1, the finite-field product structure has generators β in degree two and ζ in degree one with ring (ℤ/m)[β,ζ]/(ζ²), using Browder's refinement where small Moore moduli require it (K-book IV.1.13.1 p.269, IV.2.8 p.282). Do not infer a canonical product from the additive Bockstein sequence alone.

Take filtered colimits to obtain K₂ᵢ(𝔽̄p) = 0 and K₂ᵢ₋₁(𝔽̄p) ≃ ⊕_(ℓ≠p)ℚℓ/ℤℓ(i), compatibly with cyclotomic Galois action. For p ∤ m the coefficient ring is (ℤ/m)[β], with Galois action on β^i given by the i-th twist; for p-power coefficients all positive groups vanish (K-book VI.1, finite-characteristic calculation and Corollary1.3.1, p.465).

Define `completed R ℓ` as the homotopy limit of coefficient spectra, `toCompleted` as its natural map, and `completedReduce ν` as projection. Its API includes naturality, transfer, products of rings, reduction modulo ℓ^ν and the Milnor exact sequence with lim¹ Kₙ₊₁(R; ℤ/ℓ^ν). Negative homotopy vanishes here because the connective degree-zero reduction tower is surjective. Finite coefficient groups ensure the relevant lim¹ vanishes; finite generation of adjacent integral K-groups gives the usual tensor description (K-book IV.2.9 p.282; Handbook item59 p.164). *Needs:* §§1.1–1.8 and completion foundations.

**Checks.**

- At the characteristic prime, K₀(𝔽q; ℤₚ) = ℤₚ and all positive completed groups vanish; for ℓ ≠ p the odd answer is the ℓ-primary part of ℤ/(q^i−1).
- The zero ring has zero completed spectrum. A field has completed K₀ = ℤₗ; surjectivity of its K₁ coefficient transition maps kills the possible degree-zero lim¹.
- K₂(ℂ; ℤₗ) = ℤₗ although integral K₂(ℂ) is uniquely divisible and limν K₂(ℂ)/ℓ^ν = 0. The missing term is the Tate module of K₁(ℂ), not an error in the integral group (K-book VI.1.1,1.3 pp.463–465).
- K₂(𝔽₃; ℤ/2) survives although integral positive even groups vanish, while K₂(𝔽̄₃; ℤ/3) is zero.

### 1.10 Perfect characteristic-two and classical finite-field comparisons

For every finite field, including odd q, prove the classical symmetric GW comparison for signs ±1 on connective covers (Calmès et al. III Theorem3.1.3 p.50). For a perfect characteristic-two field k, extend the finite-field homotopy-limit supplier to arbitrary perfect k: use unique 2-divisibility of positive K-groups from the Adams supplier, and surjective Frobenius to identify every one-dimensional symmetric bilinear form with ⟨1⟩. Prove 𝔽₂ → k induces equivalences on 2-completed K and integral symmetric L, then deduce the shifted integral GW homotopy-limit equivalence for every integer shift. Retain the coefficient line, its involution and shift until applying metabolic transport. This extension uses symmetric bilinear forms, not quadratic Arf-invariant theory (III Remark3.1.6 pp.51–52; II Corollary4.4.13 p.107). *Needs:* §1.7, completion, the finite-field supplier and the precise Poincaré/homotopy-limit contracts.

**Checks.**

- Over 𝔽₂ the unit form maps to the nonzero element, while a hyperbolic form maps to zero.
- Over 𝔽₄, K₁ = ℤ/3 is nonzero integrally although it disappears on 2-completion; the rank assertion is not an integral K-equivalence.
- For an arbitrary perfect characteristic-two k the argument uses Frobenius/Adams, not finite-field cardinality.
- Odd q is outside the full-spectrum assertion obtained by this even-field proof.

### 1.11 Finite-rank symplectic degree three

Let q be odd and r ≥ 1. Use SU(2) = Sp(1) = S³, the compact-group sphere quotients and stabilization to prove Sp(r) → SU(2r) induces an isomorphism on H³(−;𝔽₂). Prove the Lang/geometric étale comparison carries this to the finite classical groups. Establish that the integral H₂ of the relevant Sp and SL groups has odd order, including the exceptional rank-one q = 3 and q = 9 multipliers. It need not be zero. The homology UCT then identifies H₃(−;ℤ)/2 with H₃(−;𝔽₂), naturally, and gives the stabilization-compatible order-two comparison (Abdurrahman–Venkatesh Lemma2.7.1 and proof, pp.16–17).

More precisely, for G = Sp₂ᵣ or SL₂ᵣ require the geometric edge comparison H³(G(𝔽q);𝔽₂) → H³_et(G_(𝔽̄q);𝔽₂) to be an isomorphism between one-dimensional spaces, compatible with Sp₂ᵣ → SL₂ᵣ and stabilization. In the Lang fibration compute the degree-four transgression as multiplication by q²−1; it vanishes modulo two for odd q. The comparison with compact-group degree-three cohomology then fixes the nonzero map, rather than merely two abstract groups of order two (Abdurrahman–Venkatesh proof of Lemma2.7.1, equation(2.10), pp.16–17). *Needs:* compact-classical comparison, Lang's theorem, geometric étale cohomology and its fibration spectral sequence.

Identify BSL(𝔽q)⁺ with the universal cover of BGL(𝔽q)⁺ via determinant; it is 2-connected because K₂(𝔽q) = 0. Hurewicz identifies K₃(𝔽q) with H₃(SL(𝔽q);ℤ). Bockstein identifies K₃/2 with K₃(−;ℤ/2), and K₂(−;ℤ/2) with K₁[2]. For a nonsquare a, compute

```text
c₂,₁([a]·β₋₁) = −κ(a) ⊗ (−1)  in H¹(𝔽q, μ₂⊗²).
```

Here κ is Kummer, and the second −1 is the nontrivial element of μ₂, not the square class of −1. Weibel's higher Chern formula gives an isomorphism for i = 2 and modulus two: its multiplier is −(i−1)! = −1. Combined with the previous identifications, it yields an order-two étale Chern isomorphism for finite-rank symplectic H₃, compatible with stabilization (Weibel, *Étale Chern classes at the prime 2*, Theorems3.2–3.3 pp.13–15 and Proposition5.1 p.24; Abdurrahman–Venkatesh Lemma2.7.2 p.17). The early Chern construction and its product formula are specified in §6.6, without a regulator dependency.

**Checks.**

- For 𝔽₅ take a = 2: its Kummer class is nonzero even though −1 is a square.
- Replacing a by −1 would incorrectly give zero.
- For 𝔽₃ use a = −1, which is a nonsquare there.
- Rank zero has zero H₃ and is excluded.
- The q = 3 and q = 9 H₂ exceptions are handled by odd order, not by asserting universal vanishing.

*Needs:* §§1.1–1.8, §6.6's independent early Chern construction, compact-classical and Lang comparison, and group-homology UCT.

### Examples

The groups in degrees one, two and three are respectively 0,0,ℤ/3 for 𝔽₂ and ℤ/2,0,ℤ/8 for 𝔽₃. These force the fibre model to retain odd homotopy even when determinant is trivial. Over 𝔽₅, finite coefficients modulo four have two adjacent positive groups ℤ/4; the integral even group remains zero. Under 𝔽₂ ⊂ 𝔽₄, the degree-three transfer/restriction pair distinguishes the geometric-series multiplier 5 from the degree 2.

### Dependencies

This layer consumes the foundational K, plus, coefficient, KU/Adams, character and group-cohomology contracts stated above. The even-field hermitian application additionally consumes the Poincaré square and shifted symmetric theory. The finite-rank Sp application consumes the Lang comparison and the independent early Chern construction; it does not consume Layer 6's local-field computation.

## Layer 2: henselian rings away from the residue characteristic

### 2.1 Rigidity for henselian pairs

For a commutative henselian pair (R,I), with I in the Jacobson radical, and m ≥ 1 invertible in R, prove reduction K(R;ℤ/m) → K(R/I;ℤ/m) is an equivalence. Invertibility can be checked in R/I. Deduce mod-m acyclicity of the stable congruence group GL(I). State the result for connective K-theory; arbitrary negative K-groups are not included (Gabber rigidity, K-book IV.2.10 p.283; Clausen–Mathew–Morrow Theorem1.4 p.3 and Remark4.37 pp.36–37). *Needs:* Layer 1 coefficient functors, henselian pairs, the congruence-group comparison, and the rigidity proof.

Specialize to any henselian local ring O with residue 𝔽q and p ∤ m. Reduction is the equivalence used in every identification, and gives degree zero ℤ/m and positive adjacent groups ℤ/gcd(m,q^i−1). Taking derived ℓ-completion, ℓ ≠ p, gives ℤℓ in degree zero, ℤ/(q^i−1)_ℓ in degree 2i−1 and zero in degree 2i. The limit is taken on spectra, with the Milnor term justified (K-book V.6.10 p.415; Handbook Proposition58 and item59 p.164). Neither completeness nor a DVR hypothesis is needed for this specialization.

**Checks.**

- For R = R/I a field the equivalence is identity; for I = 0 this also tests all coefficient maps.
- For ℤ₅ and m = 4 the first two positive groups are both ℤ/4.
- Taking m = p is outside the theorem: K₁(ℤₚ;ℤ/p) retains principal units, whereas K₁(𝔽p;ℤ/p) is zero.
- A unit ideal in a nonzero ring is not a henselian pair under the Jacobson-radical hypothesis.

### 2.2 Localization, signs and Bocksteins

Specialize the supplied DVR localization sequence to O ⊂ L with residue k. Retain the actual dévissage map K(k) → K(O), not a nonexistent projective restriction of scalars for the residue field. Identify its K₀ map as zero and the boundary K₁(L) → K₀(k) as v. Prove the coefficient sequence and its mixed pairing have the fixed left-linear boundary. Reduction commutes with ∂, while Bockstein anticommutes:

```text
∂ red = red ∂,                 ∂ β_m = −β_m ∂.
```

The second identity is a two-boundary sign from the cofiber square, not a convention that can be discarded independently (K-book V.6.1.1–1.2 p.406, V.6.6 pp.409–410, and V.6.9.2 pp.414–415). *Needs:* localization, products and §1.1.

For a henselian DVR and m invertible in k, prove exactness

```text
0 → Kₙ(O;ℤ/m) → Kₙ(L;ℤ/m) → Kₙ₋₁(k;ℤ/m) → 0  (n ≥ 1).
```

Its section is sπ(a) = r⁻¹(a)·[π]. This uses the coefficient/integral mixed pairing, so no small-modulus ring structure is assumed. For n = 0 the map is an isomorphism. Exactness without this explicit rigidity section holds for a general DVR with m invertible in k, by passage to its henselization (K-book TheoremV.6.9.1 pp.413–414).

### 2.3 Integral torsion and the canonical even splitting

For a henselian local O with finite residue 𝔽q and every ℓ ≠ p, use rigidity in two adjacent degrees and Bockstein to prove reduction identifies the ℓ^ν-torsion and the quotients modulo ℓ^ν in K₂ᵢ₋₁. Prove K₂ᵢ(O), i ≥ 1, is uniquely ℓ-divisible, checking injectivity as well as surjectivity of multiplication by ℓ. The prime-to-p torsion subgroup of K₂ᵢ₋₁(O) maps isomorphically to K₂ᵢ₋₁(k). Its canonical complement is the kernel of reduction and is a ℤ_(p)-module. These are integral conclusions obtained from divisibility arguments, not from equating integral and completed carriers (Handbook Proposition58 p.164; K-book VI.7.2–7.3 pp.508–509).

If O is a henselian DVR, prove

```text
0 → K₂ᵢ(O) → K₂ᵢ(L) → K₂ᵢ₋₁(k) → 0.
```

Lift the right group through the prime-to-p torsion of O and multiply by [π]. The resulting section is independent of π: changing π multiplies by an integral unit class, whose product with the prime-to-p torsion class is finite prime-to-p torsion in the uniquely prime-to-p divisible even group, hence zero. Its image is exactly the prime-to-p torsion of K₂ᵢ(L). This gives the canonical internal decomposition K₂ᵢ(L) = K₂ᵢ(O) ⊕ K₂ᵢ(L)_(p′). For i ≥ 2 prove K₂ᵢ₋₁(O) → K₂ᵢ₋₁(L) is an isomorphism. For i = 1 retain instead 0 → O× → L× → ℤ → 0 (K-book V.6.9.2 p.414; Handbook Proposition58 p.164). *Needs:* §§2.1–2.2 and Layer 1's finite residue terms.

### 2.4 Uniformizers and the coefficient algebra

For π′ = uπ prove the coefficient sections satisfy sπ′(a) − sπ(a) = r⁻¹(a)·[u]. The valuation section changes by u in degree one, whereas the integral positive-even torsion section of §2.3 is unchanged. For the specialization λπ(y) = ∂([π]·y), compute λπ′(y) = λπ(y) + [ū]·∂y (K-book V.6.6.4 p.410; Handbook Theorem56 proof p.163). This formula follows from left linearity and uses precisely the specified order of factors.

If m ≥ 2 divides q−1, every positive coefficient degree of L has two copies of ℤ/m. For m = ℓ^ν outside {2,3,4,8}, construct its ring as a free K*(O;ℤ/m)-module on 1,zπ, with zπ = [π] of degree one. With β,ζ from §1.9 its basis over (ℤ/m)[β] is

```text
1, ζ, zπ, ζzπ,        ζ² = 0,        zπ² = [−1] zπ.
```

The last square is zero when q ≡ 1 modulo 2m or q is even. Keeping four basis elements corrects the two-element polynomial-base claim in K-book PropositionV.6.10, p.415. The two-element basis there is valid only over the entire residue K-ring. *Needs:* §§1.9,2.2–2.3 and the multiplicative Moore restrictions.

**Checks.**

- For L = ℚ₅, m = 4, the additive positive groups have rank two over ℤ/4, even though this modulus is excluded from the generic ring construction.
- In K₁(L;ℤ/4), changing π = 5 to 10 adds [2], which is nonzero.
- In integral K₂ the sections ū ↦ {ω(ū),5} and ū ↦ {ω(ū),10} agree.
- The equality ∂{ω(2),5} = 2 and ∂{5,ω(2)} = 3 in 𝔽₅× fixes the two-factor sign.
- For residue 𝔽₂ the prime-to-p finite summands are zero, but the valuation summand in K₁ remains ℤ.

### 2.5 Prime-to-p local coefficients and the e-invariant

For L the fraction field of a henselian DVR with residue 𝔽q, prove the integral prime-to-p torsion in both K₂ᵢ and K₂ᵢ₋₁ is cyclic of order q^i−1. For odd degree ≥ 3 and for the even integral complement, the remaining group is a ℤ_(p)-module. In degree one retain the valuation factor separately. For ℓ ≠ p the completed groups are ℤ/(q^i−1)_ℓ in even degrees ≥ 2 and odd degrees ≥ 3; K₁(L;ℤℓ) additionally has ℤℓ. Finite coefficient groups use the uniformizer-dependent direct sum of §§2.1–2.2; these are three separate statements (Handbook §5.6 pp.163–164; K-book VI.7.3 p.509).

For a genuine local field L and i ≠ 0, show inertia acts trivially on ℚℓ/ℤℓ(i), arithmetic Frobenius acts by q^i, and Wᵢ^(ℓ)(L) is cyclic of order (q^|i|−1)_ℓ. Negative i is allowed since q is an ℓ-adic unit. Along finite subextensions of Lˢᵉᵖ, residue fields exhaust 𝔽̄q and reduction gives an equivariant isomorphism K₂ᵢ₋₁(Lˢᵉᵖ){ℓ} ≃ ℚℓ/ℤℓ(i) for i ≥ 1. All abstract isomorphisms between these rank-one divisible torsion Galois modules commute with their scalar Galois actions. Restriction from L identifies its ℓ-primary odd torsion with the invariants, giving the local ℓ-primary e-invariant isomorphism (K-book VI.1.7.1 and Exercise1.3 pp.468–469; VI.2.3.1 pp.471–472). *Needs:* §2.3, finite-extension local arithmetic, the residue Galois sequence and §1.9. The case i = 0 has infinite invariants and is excluded from wᵢ.

### Examples

For ℚ₃, K₂(ℚ₃){2} and K₁(ℚ₃){2} are ℤ/2, but completed K₁ at 2 is ℤ₂ ⊕ ℤ/2. For 𝔽₂((t)) the entire prime-to-2 finite summand in K₂ is zero. These examples leave the residue-characteristic divisible information undecided, as required before Layer 3. The tame boundary at 5 computed above changes under swapping the inputs, while the boundary map itself never depends on a choice of uniformizer.

### Dependencies

Layer 1, the general K localization/product contracts, Gabber rigidity, henselian root lifting and the local residue/Galois suppliers. No residue-characteristic trace calculation is used in this layer.

## Layer 3: integral K₂ and Moore's theorem

### 3.1 The full norm-residue map

For a local field E let μ(E) be its finite group of roots of unity and w = #μ(E) = (q−1)p^a; a = 0 in equal characteristic. Define `normResidueMap : Multiplicative K₂(E) →* μ(E)` by h_E{a,b} = (a,b)_w. Here w is invertible in E, including equal characteristic where p ∤ w. No primitive root is chosen in the definition. Its API comprises well-definedness through Steinberg symbols, bilinearity, the identity on a zero K₂ class, functorial exponent projections, compatibility with local reciprocity and the tame formula below (K-book III.6.2.3 pp.233–234; Handbook §5.6 p.163). For d | w prove (a,b)_d = h_E{a,b}^(w/d).

For w = ∏ℓ ℓ^aℓ the primary projection is not simply the d-th symbol. If d = ℓ^aℓ and uℓ(w/d) ≡ 1 modulo d, prove πℓh_E = ((−,−)_d)^uℓ. The congruence has an inverse because gcd(d,w/d) = 1. The wild p-component occurs exactly in mixed characteristic with μ_p ⊂ E; it is not a function of the residue tame symbol (K-book ExerciseIII.6.7 p.244). *Needs:* existing Hilbert symbols and local reciprocity, plus Matsumoto comparison.

**Checks.**

- For 𝔽₂((t)), w = 1 and h_E is trivial, even though K₂(E) will be a large group.
- For ℚ₅, h_E{5,2} = ω(2) and h_E{2,5} = ω(3); the outputs are inverse primitive fourth roots.
- For ℚ₂, h_E{−1,−1} = −1 while its tame boundary in 𝔽₂× is 1. This detects the wild component.
- For E = ℚ₂(ζ₃), q = 4 and w = 6, the 3-primary projection is the square of the cubic symbol, not the cubic symbol itself.

### 3.2 Coordinate formula and reciprocity witness

For d | q−1, two integral units have trivial d-th symbol. For a uniformizer and unit, arithmetic reciprocity acting on an unramified Kummer root gives (π,u)_d = ω(ū)^((q−1)/d). By bilinearity, for r,s ∈ ℤ and units u,v,

```text
∂{π^r u,π^s v} = (−1)^(rs) ū^s v̄^(−r),
(π^r u,π^s v)_d = ω((−1)^(rs) ū^(−s) v̄^r)^((q−1)/d).
```

The first expression is `tameCoordinate r s ū v̄`; define this light coordinate expression on the unit group of any commutative ring, including the zero ring. Its light API is multiplicativity in the two valuation/unit pairs, inversion on swapping the pairs, the diagonal value (−1)^r² for u = v, and invariance under π′ = cπ with u′ = c^(−r)u, v′ = c^(−s)v. Its agreement with the actual localization boundary is a separate K₂ comparison, not a definition of K₂. The second expression proves `(−,−)_d = (ω∘∂)^(−(q−1)/d)` with the conventions fixed above (Sharifi Definition9.3.2 p.195, Theorem9.3.8 and proof pp.197–198, with exchanged inputs; K-book III.6.3 p.234). *Needs:* Layer 2's boundary sign and the arithmetic-Frobenius supplier.

**Checks.**

- Over the zero ring and over 𝔽₂ the unit group is trivial, so every coordinate value is 1; the zero-ring extension does not assert that a zero ring is a residue field.
- With k = 𝔽₅, r = 0,s = 1,u = 2,v = 1, `tameCoordinate` is 2; swapping gives 3. The corresponding fourth Hilbert values are respectively ω(3) and ω(2).
- At r = s = 1,u = v = 1 over 𝔽₅ the boundary and the fourth symbol are −1. The sign factor cannot be suppressed.
- For r = −1,s = 1,u = 2,v = 3 over 𝔽₅ the coordinate is −2·3 = −1, testing negative valuations and negative integer powers. Over 𝔽₂ every coordinate is 1.
- Replacing π by 2π in the first example replaces the unit part of the second input by 3; the coordinate remains 2. This checks the parameter-change direction.

For d | w prove (x,y)_d = 1 exactly when x lies in the norm group of E(y^(1/d))/E. Its index is the degree of that extension, equivalently the order of y in E×/E×d. For d = 2 this says x = a²−yb² for some a,b ∈ E, with x ≠ 0. This is a norm criterion with the first variable as the norm, consistent with our reciprocity order (Sharifi Proposition9.3.4(b) pp.195–196 after interchange; K-book III.6.2.3 p.233).

### 3.3 Surjectivity and the norm-residue kernel

Fix a generator ζ of the whole group μ(E). Prove its class in E×/E×w has order w: a smaller order would produce a root of unity of order larger than w in E. Nondegeneracy of the Hilbert pairing then makes (ζ,−)_w onto μ(E). Choose x with (ζ,x)_w = ζ, not merely with a nontrivial value. Since w{ζ,x} = 0, the formula ζ^j ↦ j{ζ,x} is a well-defined section. For composite w, a nontrivial symbol value need not generate; this is why the precise choice of x matters (K-book III.6.2.3 and Moore proof pp.233–234).

Define `normResidueKernel E` as the additive subgroup corresponding to ker h_E, denoted U(E). Its API is `mem_iff`, inclusion, the canonical exact sequence 0 → U(E) → K₂(E) → μ(E) → 0, wK₂(E) ⊂ U(E), compatibility with primary components, and comparison with the tame kernel. At this stage the displayed formula for a section uses choices; prove uniqueness only after torsion freeness below. Localization gives the canonical sequence 0 → K₂(O) → K₂(E) → k× → 0 and identifies K₂(O) with the tame kernel (K-book V.6.6.2 p.410; Handbook Proposition58 p.164). *Needs:* §§3.1–3.2 and Layer 2.

**Checks.**

- Over ℚ₂ the class {−1,−1} belongs to K₂(ℤ₂) but is outside U(E); the two kernels are different.
- Over 𝔽q((t)), h_E = ω∘∂⁻¹, hence U(E) = K₂(𝔽q[[t]]).
- At w = 1 the kernel is all of K₂(E), and the exact sequence has zero finite quotient.
- In every field, {a,1−a} lies in the kernel when a ≠ 0,1, by the Steinberg relation. The ℚ₅ symbol {5,2} does not, giving a non-example with order-four image.

### 3.4 Divisibility at all primes

For ℓ ≠ p prove U(E) is uniquely ℓ-divisible. The canonical prime-to-p torsion splitting of Layer 2 identifies both K₂(E)/ℓ and K₂(E)[ℓ] with their μ(E) counterparts under h_E; surjectivity and injectivity on the kernel follow separately (K-book VI.7.2–7.3 pp.508–509).

Prove for **every** field F of characteristic p that K₂(F)[p] = 0. The proof uses the characteristic-p Artin–Schreier/Hilbert-90 argument for K₂; it is a genuine target, not a consequence of the local theorem it will establish (K-book TheoremIII.6.7 p.238). For local E of characteristic p, prove [E:E^p] = p and Ω²_E = 0; Bloch–Gabber–Kato then gives K₂(E)/p = 0. A field with two independent p-basis elements is outside that latter argument (K-book III.7.7.2 p.251).

In mixed characteristic use Merkurjev–Suslin K₂(E)/p^ν ≃ H²(E,μ_(p^ν)⊗²), local duality and the full symbol to identify the quotient with μ(E)/p^ν. This proves p-divisibility of U(E) without assuming Moore's theorem in the cohomological input. Supply separately Merkurjev's theorem that U(E)[p] = 0, equivalently that the p-primary torsion of K₂(E) injects under h_E. The latter original torsion proof is not replaced by a cardinality argument about quotients (K-book Moore proof p.234 and VI.7 discussion p.508; Handbook Theorem57 proof p.163, citing Merkurjev 1983). *Needs:* §3.3, norm residue independent of Moore, local duality and the general characteristic-p K₂ theorem.

### 3.5 Moore's structure and the integer-ring subgroup

Prove U(E) is uncountable using the theorem that K₂(F) has the cardinality of F whenever F contains ℚ(t), or 𝔽p(t₁,t₂) in characteristic p. The appropriate subfields exist by the local field's uncountable transcendence degree. A finite μ(E) quotient preserves uncountability. Do not use Ω²_E to establish equal-characteristic uncountability, since that differential group is zero (K-book III.6.3.2 p.235; Fesenko §6.1 pp.61–62).

Combine §§3.3–3.4 to prove Moore's theorem: U(E) is an uncountable uniquely divisible group, h_E identifies K₂(E)_tors with μ(E), and

```text
K₂(E) = U(E) ⊕ K₂(E)_tors,
U(E) = wK₂(E) = ⋂_(m≥1)mK₂(E) = Div(K₂(E)).
```

The internal decomposition and inverse of h_E on torsion are canonical. Any initially chosen section equals this inverse because Hom(μ(E),U(E)) = 0. Only a subsequent identification μ(E) ≃ ℤ/w requires a generator (K-book TheoremIII.6.2.4 pp.233–234; Handbook Theorem57 p.163).

Prove K₂(O) = U(E) ⊕ K₂(O)_tors with torsion μ_(p∞)(E). The quotient by K₂(O) is k×, and h_E on that quotient is the inverse tame identification, with the p^a exponent projection retained. In equal characteristic K₂(O) = U(E); its complement in K₂(E) is the canonical prime-to-p torsion section ū ↦ {ω(ū),π}. Under h_E this section sends ū to ω(ū)⁻¹. In mixed characteristic the integer-ring torsion is nonzero exactly when μ_p ⊂ E (Handbook Theorem57 p.163 and Proposition58 p.164; K-book errata for the lines before VI.7.1). *Needs:* §§3.1–3.4 and the maximal-divisible algebra of §6.1, whose proof is independent of local K-theory.

### Examples

For ℚ₂, U is uniquely divisible and K₂(ℤ₂)/U = ℤ/2, detected by {−1,−1}; the tame quotient is zero. The symbol {−1,5} is zero: it has order dividing two and trivial quadratic symbol, as the norm equation 5 = 1²+2² shows, so it lies in the torsion-free kernel. Equivalently the conic 1 = −2²+5·1² gives the reciprocal norm criterion. For ℚ₃, h{3,−1} = −1 and {−1,−1} = 0; here μ₃ is absent, so K₂(ℤ₃) = U. For ℚ₃(ζ₃), integer-ring K₂ has a nonzero order-three torsion group. For 𝔽₂((t)), K₂(E) = U(E) is uncountable and uniquely divisible. These cases distinguish mixed characteristic, wild roots and a trivial residue unit group.

### Dependencies

Layer 2, K2SymbolsBrauer's symbols and reciprocity, ClassFieldTheory's local duality, the independent norm-residue theorem in degree two, characteristic-p logarithmic differentials, and abelian-group divisibility. The mixed-characteristic p-torsion-freeness theorem and the general characteristic-p K₂ torsion theorem remain explicit proof obligations of this layer.

## Layer 4: the logarithmic trace and localization

### 4.1 The classical linear Waldhausen model

For a small category C enriched in abelian groups, with cofibrations and weak equivalences satisfying Waldhausen's axioms, construct `linearWaldhausenTHH C` in the Hesselholt–Madsen model. Its (n,V)-space is the realization of THH^(n)(NʷS^(n)C;S^V), using Eilenberg–Mac Lane spectra of the Hom groups and Bökstedt's homotopy-colimit indexing. The cyclic structure gives the circle action; permutation of the S-directions gives the symmetric-spectrum action. Construct the cyclotomic root-pullback map from geometric fixed points and prove it is an equivalence on all finite p-power fixed points. Positive-level structure maps must be equivalences on every finite cyclic fixed point, not just nonequivariant equivalences (HM03 §1.1 pp.7–12 and Proposition1.2.3 p.15).

The API comprises exact-functor maps with identity/composition coherence, homotopies from natural weak equivalences, the trace K(C) → T(C)^T from the fixed zero simplices, and multiplication for a strict symmetric monoidal C with biexact tensor product. The comparison with RefinedTraceMethods' ordinary THH is only asserted where the resolution/Morita theorem below applies. Dependence on the linear Waldhausen input must be preserved; replacing C by its localized stable category would change the logarithmic construction.

**Checks.**

- The zero category gives a contractible spectrum.
- For finite projective R-modules, π₀ = R/[R,R]; for commutative R, π₁ = Ω¹_(R/ℤ), agreeing with ordinary THH in these degrees.
- For R = 𝔽p, the answer is 𝔽p[σ], |σ| = 2; it is not just the degree-zero ring.
- Cᵇ_q(P_ℤₚ) has logarithmic π₀ = ℤₚ and nonzero mod-p π₀, whereas THH(ℚₚ) is p-inverted and has zero mod-p homotopy. A construction through the Dwyer–Kan localization would fail this check.

### 4.2 Classical TR, Frobenius and TC

Specialize genuine fixed points to define `linearTR n C p = T(C)^(C_{p^(n−1)})`, n ≥ 1. Give its API R,F,V, the residual circle action, trace maps from the constant K pro-spectrum, `RF = FR`, `RV = VR`, `FV = p`, projection formulas, and multiplicativity of R and F. V is an additive transfer, not a ring homomorphism. Identify π₀TRⁿ(A;p) with the supplied Wₙ(A), compatibly with all three operators (HM03 §1.1 pp.8–10; HM97a Theorem2.3 p.18 (PDF22); Hesselholt–Madsen's Witt identification used in HM03 §3.3 p.51).

Define `linearTRLimit` as the preferred homotopy limit along R and `linearTC` as hofib(id−F) there. Its API has the Milnor lim¹ sequence, the TC fibre sequence, the multiplicative trace and compatibility with finite/completed coefficients. The inverse-limit maps are preferred coherent maps of spectra; an equality of group-level inverse limits alone does not construct them (HM03 §1.1 pp.8–9).

**Checks.**

- TR¹ = T. For 𝔽p, π₀TR² = ℤ/p², R and F both reduce modulo p, and V is multiplication by p.
- Over ℤ at p = 3, R[2]₂ = 2 while F[2]₂ = 8. Defining R as fixed-point inclusion would conflate distinct operators.
- TC(𝔽p;p) has π₀ = π₋₁ = ℤₚ and no other groups. It is not connective.
- Over 𝔽̄p, 1−F on W(𝔽̄p) is onto and TC = Hℤₚ; the negative group from the finite-field case disappears.
- The finite-level fibre of R−F is not TC: its degree-zero and degree-minus-one groups for 𝔽p are ℤ/pⁿ and ℤ/p^(n−1), rather than ℤₚ.

### 4.3 Circle operators and coefficient splitting

Use the complex orientation on T = S(ℂ). Define `connesOperator` from the stable class σ[T] ∈ π₁ˢ(T₊), characterized by Hurewicz value [T] and zero collapse to S⁰, followed by the circle action. Prove naturality, the product derivation formula, and d² = dη = ηd. Thus d² = 0 when η acts trivially, in particular when 2 is invertible. Retain the circle-transfer relation FdV = d+(p−1)η before specializing to odd p. A nonzero η alone does not show ηd is nonzero (HM03 §1.1 p.9, retaining its circle-transfer correction).

For an Hℤ/m-module spectrum X use the canonical coefficient class ε with βε = 1 to split Mₘ∧X ≃ X∨ΣX naturally in Hℤ/m-module maps. This gives π_q(X;ℤ/m) ≃ π_qX ⊕ π_(q−1)X (HM03 (2.1.1) p.31). This theorem does not apply to arbitrary K(R)/m merely because it is a Moore cofiber.

**Checks.**

- A trivial circle action gives d = 0 because the chosen stable circle class has zero collapse.
- On HH(ℤ[x]), d(x) = dx, fixing the orientation against `KaehlerDifferential.D`.
- On mod-p THH(𝔽p), dε = σ with βε = 1; reversing the orientation would change the sign.
- At p = 2 retain d² = ηd. An explicit example with ηd ≠ 0 requires its own calculation; no such example is assumed here. This prevents the unsupported inference from a nonzero Hopf class to a nonzero square.

### 4.4 Norm, homotopy orbits and modern comparison

Construct the norm–restriction cofiber sequence

```text
T(C)_(hC_{p^(n−1)}) → TRⁿ(C;p) →R TRⁿ⁻¹(C;p),  n ≥ 2,
```

and its map to the orbit/fixed/Tate cofiber sequence, with comparison maps Γ and Γ̂. Preserve multiplicative and module structures. The homotopy-orbit spectral sequence has E²_(s,t) = H_s(C_(p^(n−1)), (F^(n−1))*π_tT(C)), with the Wₙ(A)-action through F^(n−1), and is first quadrant when T(C) is connective. Its F,V satisfy FV = p, with the circle-transfer correction at p = 2; the odd-prime version is differential graded (HM03 §1.1 pp.9–10 and (3.3.2) p.51).

For bounded-below T(C), apply the genuine/modern comparison to identify these classical TR and TC with RefinedTraceMethods' modern cyclotomic objects, including Γ, Γ̂ and the trace. The index shift is fixed by TRⁿ ↔ C_(p^(n−1)). Prove integral TC and p-typical TC agree after p-completion, with the map defined before completion (Nikolaus–Scholze II.4.4–II.4.10 pp.263–265 in the published paper; HM97a Theorem3.1 p.19 (PDF23)). Bounded below is an actual input, not an automatic property of every genuine cyclotomic spectrum. *Needs:* §§4.1–4.3 and the general genuine/modern theorem.

### 4.5 Tate cochains, products and the filtered Tate spectrum

For a finite G, a commutative k and a projective kG-resolution P → k, compare the HM cochain model H_(−*)( (P̃⊗Hom(P,M))^G ) with the supplied `tateCohomology`. Define the comparison using the norm and augmentation quasi-isomorphisms; prove independence of resolution and compatibility of cup products induced by the two resolution diagonals. Its API identifies positive degrees with ordinary cohomology, degrees ≤ −2 with shifted homology, and the exact sequence

```text
0 → Ĥ⁻¹(G,M) → M_G →N M^G → Ĥ⁰(G,M) → 0.
```

Only the comparison model is new here; the underlying algebraic Tate object is supplied (HM03 Definition4.1.1, Lemma4.1.2 pp.59–60).

For C_r of odd order r, acting trivially on a commutative k with r = 0 in k, compute Ĥ*(C_r,k) = Λ_k(u)⊗k[t,t⁻¹], |u| = 1, |t| = 2. Fix the low-degree boundary by ∂(ut⁻¹) = −1 (HM03 Proposition4.2.1 and Addendum4.2.2 pp.62–64). The odd-order hypothesis is needed for this exterior multiplication formula.

For a finite group G and a G-spectrum T define its Tate spectrum as (ẼG∧F(EG₊,T))^G with a fibrant replacement. Filter both cells to construct `tateSpectralSequence` with E²_(s,t) = Ĥ^(−s)(G,π_tT), abutting conditionally to π_(s+t)T^(tG). Its API includes naturality, pairings inducing the algebraic cup product, ring/module structures, comparison from E² with Greenlees' filtration, and explicit convergence hypotheses. Do not upgrade conditional convergence to strong convergence merely from bounded-below T (HM03 §4.3 pp.64–68, Remark4.3.6). For a circle spectrum restrict the cellular chain module of T/C; in odd cyclic order killed on coefficients prove d² = t·d_Connes, with the preceding sign conventions (HM03 §4.4 pp.68–71).

**Checks.**

- For C₃ on 𝔽₃, every Tate cohomology group is 𝔽₃; for the trivial group all groups vanish.
- For C₅ on ℤ, Ĥ⁰ = ℤ/5 and Ĥ⁻¹ = 0, agreeing with the library computation. Ĥ⁰ is not H⁰ = ℤ.
- A trivial Eilenberg–Mac Lane 𝔽p spectrum gives the usual Tate groups and a collapsed spectral sequence; induced modules give zero.
- For mod-p THH(𝔽p) at odd p the E² ring has u,ε,t±¹,σ, and d²ε = tσ; E³ is Λ(u)⊗𝔽p[t±¹]. Omitting ε or this differential gives an incorrect answer.
- For trivial-action Hℤ, π₀ of Tate is ℤ/p, whereas π₀ of homotopy fixed points is ℤ. The ẼG factor cannot be omitted.

### 4.6 Additivity and fibration for the linear model

For the functors Φ = THH(−;S^V)^(C_r), verify the HM axioms: the zero category is contractible, products are preserved, and degreewise equivalences remain equivalences under the indicated realization. Prove exact simplicial homotopies induce homotopies, natural transformations through weak equivalences give such homotopies on Nʷ, and adjoining the isomorphism nerve leaves Φ(NʷS C) unchanged (HM03 Lemmas1.3.1–1.3.4 pp.16–17).

Prove McCarthy additivity in all four forms: decomposition of the cofibration-sequence category into source and quotient; its unrestricted special case; homotopy between middle object and source-plus-quotient; and additivity on cofibration sequences of exact functors. These equivalent formulations supply both splitting and naturality. Use them to make the relative S-construction square cartesian and obtain its canonical contraction and delooping (HM03 Theorem1.3.5 and (1.3.6), pp.17–18).

With a cylinder satisfying the cylinder axiom and saturated weak equivalences, prove replacing w by w∩cofibrations preserves Φ(NʷC). Prove the swallowing equivalence for v ⊂ w and its inverse. With the extension axiom added, prove Waldhausen's fibration square for the subcategory of w-acyclic objects. Every one of the cylinder, saturation and extension hypotheses must be checked for the complex categories used below (HM03 Lemmas1.3.9–1.3.10 and Theorem1.3.11, pp.19–21). *Needs:* §4.1 and the structural Waldhausen supplier. These are the specialized linear fixed-point statements, not new general K-theory fibration theorems.

For the later Bockstein computation, establish the signed three-by-three cofiber chase. Write the three rows Eᵢ₁ → Eᵢ₂ → Eᵢ₃ → ΣEᵢ₁ as fᵢ₁,fᵢ₂,fᵢ₃, and the three columns similarly as g₁ⱼ,g₂ⱼ,g₃ⱼ. All squares commute except the final suspended corner, which anticommutes. If a ∈ π_dE₁₂, b ∈ π_dE₂₁ and c ∈ π_(d+1)E₃₃ satisfy g₃₃(c) = (Σf₁₂)(Σa) and f₃₃(c) = (Σg₂₁)(Σb), prove f₂₁(b)+g₁₂(a) comes from π_dE₁₁ through its diagonal map to E₂₂. The plus sign depends on that anticommuting corner. Apply it to multiplication by p on the norm/restriction cofiber sequence in §5.10 (HM03 Lemma3.3.10 p.58). *Needs:* cofiber exactness, suspension signs and §4.2's norm sequence.

### 4.7 Resolution and torsion complexes

For a full additive subcategory E of an abelian category, closed under extensions and kernels of epimorphisms between its objects, prove E → Cᵇ(E) induces the Φ-equivalence between isomorphisms and quasi-isomorphisms. Do not drop kernel closure (HM03 Theorem1.4.1 pp.21–22). Apply the Dundas–McCarthy criterion: an exact F induces a fixed-point THH equivalence if the weak-equivalence object-space comparison for S ENDₙ(F) is an equivalence for every n ≥ 0 (HM03 Proposition1.5.1 p.24, citing the original criterion).

For a commutative noetherian central ring A, an A-algebra B and ideal I, prove a bounded complex of B-modules finite over A with I-power-torsion homology is quasi-isomorphic to a bounded complex of finite I-power-torsion modules. Apply this with a DVR and its maximal ideal to compare torsion modules, complexes with torsion homology and projective complexes. Keep the noetherian centrality and bounded finite-generation assumptions in the replacement lemma (HM03 Lemma1.5.3 p.25, Theorem1.5.2 pp.24–25 and Proposition1.5.4 p.26). *Needs:* §4.6, finite projective resolutions over the DVR, and the END criterion.

### 4.8 The logarithmic DVR spectra and the trace square

For a DVR A with fraction field K define `logTHH A K = T(Cᵇ_q(P_A))`, where q denotes isomorphisms after tensoring with K. Define the ordinary DVR model with quasi-isomorphisms z, and its torsion-homology subcategory. The API includes the map j from the z-model to the q-model, finite-extension functoriality, multiplication, the logarithmic TR and TC objects and π₀logTHH = A. Prove the z-model and torsion subcategory agree with ordinary THH(A) and THH(k), respectively, using §4.7; hence their TR values agree too (HM03 Definition1.5.5 and Theorem1.5.6 pp.26–28).

Prove all three underlying spectra are connective (HM03 Proposition2.3.4 pp.38–39). This verifies the bounded-below input in §4.4, including the q-model, without identifying it with THH(K). Construct the natural cofiber sequences TRⁿ(k;p) → TRⁿ(A;p) → TRⁿ(A|K;p) and their preferred homotopy limits, compatible with R,F,V and the circle. The middle-to-right map is a ring map; the transfer and boundary are module maps. Passing to TC gives a natural map from K-theory localization to TC localization with third term TC(A|K;p), not TC(K;p). Vertical traces are multiplicative where the source and target carry the relevant ring structures; the suspended boundary is not asserted to be a ring map (HM03 Theorem1.5.6 and Addendum1.5.7 pp.27–28).

**Checks.**

- For A = ℤₚ, mod-p π₀logTHH = 𝔽p and, for odd p, π₁ = 𝔽p·dlog p; the second group differs from ordinary THH(ℤₚ).
- THH(ℚₚ) has zero mod-p groups, so neither the logarithmic spectrum nor its TC can be replaced by the fraction-field THH construction.
- Rationalizing j gives the expected common differential-form description over K; integral and mod-p comparisons remain distinct.
- The residue term is a module through A → k. Multiplicativity of j does not make the residue transfer a unital ring map.

### Examples

The prime-field TC calculation has a degree-minus-one ℤₚ even though K(𝔽p) is connective, explaining why trace comparison later uses a connective cover or a positive degree range. For A = ℤ₃, R[2] and F[2] differ by 6 in degree zero at length two, even though they agree after evaluating on 𝔽₃. The cyclic Tate boundary ut⁻¹ ↦ −1 and dε = σ fix the orientations used in the ramified calculations.

### Dependencies

RefinedTraceMethods' genuine/modern trace foundations, StableHomotopyKTheory's coefficient and convergence theorems, the existing algebraic Tate object and Waldhausen constructions, and the supplied K localization theorem. The linear additivity, torsion-resolution comparison and logarithmic localization are the specialized proof obligations here.

## Layer 5: logarithmic Witt and residue-characteristic calculations

### 5.1 Perfect fields and the prime-field cyclotomic model

For every perfect field k of characteristic p, prove Bökstedt periodicity π*T(k) = k[σ], |σ| = 2. At every n ≥ 1 identify π*TRⁿ(k;p) = Wₙ(k)[σₙ], with Fσₙ = σₙ₋₁, Vσₙ₋₁ = pσₙ, and Rσₙ = pλₙσₙ₋₁ for a specified unit λₙ; track coefficient Frobenius and Verschiebung separately from these generator equations. Taking R-limits kills positive degrees and yields TR = HW(k). Therefore TC has π₀ = ℤₚ, π₋₁ = coker(1−F:W(k)→W(k)), and no other groups, with the spectrum splitting Hℤₚ∨Σ⁻¹Hcoker(1−F). For finite k the cokernel is ℤₚ and for algebraically closed k it is zero (HM97a Proposition4.4 and Theorem4.5 pp.30–32 (PDF34–36), TheoremB p.ii; HM03 §5.1 pp.74–75). *Needs:* Layer 4, perfectness, Witt operators and control of the R-limit, including lim¹.

For k = 𝔽p prove the first multiplicative extension in the circle homotopy-fixed filtration: p has initial filtration class u v, and p^a has (uv)^a. Consequently

```text
π*TC⁻(𝔽p) = ℤₚ[ũ,v]/(ũv−p),  |ũ| = 2, |v| = −2,
π*TP(𝔽p) = ℤₚ[v,v⁻¹],
can(v) = v,   can(ũ) = pv⁻¹.
```

Both have zero odd homotopy. The canonical map is an isomorphism in nonpositive even degrees and has image p^aℤₚ in degree 2a ≥ 0. Cyclotomic Frobenius has the opposite ranges: it is an isomorphism in nonnegative degrees and has image p^aℤₚ in degree −2a. Its degree-zero map is identity. Use the cyclotomic shift model THH(𝔽p) ≃ sh_p(Hℤₚ^triv) to choose the simultaneous normalization φ(v) = pv, φ(ũ) = v⁻¹. Derive the T/C_p-equivariant equivalence Hℤₚ^(tC_p) ≃ THH(𝔽p)^(tC_p), identify φ_p as the connective-cover map and identify genuine C_(p^n) fixed points with τ≥0Hℤₚ^(tC_(p^(n+1))) (Nikolaus–Scholze IV.4.6–IV.4.16, pp.358–364). These are calculations of the supplied TC⁻,TP and cyclotomic shift, not additional definitions of those general functors.

For a discrete commutative 𝔽p-algebra B, export the p-complete fibre sequence TC(B) → TC⁻(B) →_(can−φ) TP(B), with TP = TC⁻[v⁻¹] and can an equivalence after inverting p. The stronger E₂ characteristic-p statement needs a chosen nullhomotopy of p and remains in the general supplier (Nikolaus–Scholze pp.364–365). These statements allow p = 2.

**Checks.**

- The relation ũv = p has a nonzero right side; an 𝔽p-polynomial ring would lose the extension.
- In degree 2, can has image pℤₚ and φ is onto; in degree −2 the roles reverse.
- Their difference is an isomorphism off degree zero and gives exactly the degree-zero and degree-minus-one TC groups of Layer 4.
- For 𝔽̄p the Artin–Schreier–Witt surjectivity changes the cokernel, so the finite-field negative group is not universal.

### 5.2 Coefficient rings, ghost coordinates and ramification

For a complete DVR A of mixed characteristic (0,p) with perfect residue k, construct a residue-identity embedding f:W(k)→A and, for a uniformizer π, an Eisenstein presentation A ≃ W(k)[X]/(φ_K), where

```text
φ_K(X) = X^e + pθ_K(X),     deg θ_K < e,     θ_K(0) ∈ W(k)×,
−p = π^e θ_K(π)⁻¹.
```

The embedding and presentation must be supplied at this generality by the Cohen/Witt coefficient-ring theorem; the finite-residue proof using the maximal unramified p-adic subfield is a special case, not a proof for all perfect k (HM03 (2.2.1) p.33; Sharifi Lemma6.3.3, Proposition6.3.4 and Lemma6.4.1 pp.130–133 for the finite-residue case). Its API includes the residue identity, finite freeness, derivative and ramification formulas, presentation change and finite-extension compatibility. For p odd, use this presentation throughout §§5.3–5.15.

Reuse ghost injectivity over p-torsion-free rings. Prove the Dwork image criterion: in a p-torsion-free ring with a Frobenius lift φ, a ghost sequence belongs to the Witt image exactly when w_s ≡ φ(w_(s−1)) modulo p^s, s ≥ 1 (HM03 §3.1 p.44). Prove for odd p the congruences V(1) ≡ [−p]ₙ and [−1]ₙ ≡ −1 modulo pWₙ(R), and p-th-power additivity [x+y]ₙ^p ≡ [x]ₙ^p+[y]ₙ^p. Do not assume either Witt addition or the quotient ideal is componentwise (HM03 Lemmas3.1.1–3.1.2 and equation(3.1.3), pp.45–46).

**Checks.**

- For A = ℤₚ take e = 1, π = p and θ = −1; for an unramified extension W(𝔽_(p^f)), use the same e but a larger coefficient field.
- For A = ℤₚ[ζₚ], π = ζₚ−1 and e = p−1, so the formulas involve π rather than substituting p.
- The sign congruences are not asserted uniformly at p = 2.
- At n = 1 the Witt quotient is A/p, while n = 0 is the zero-length Witt object.

### 5.3 The residue coefficient map and modified Verschiebung

Define `wittResidueMap n : k →+* Wₙ(A)/p` by x ↦ [f(x̃)]ₙ^p, where x̃ lifts x^(1/p) to W(k). Prove independence of lift, additivity, multiplicativity, identity, compatibility Rρₙ = ρₙ₋₁ and Fρₙ = ρₙ₋₁Frob_k. This is the k-algebra structure used in all dimension statements; it is not the raw Teichmüller map (HM03 §3.1 p.45).

Define `modifiedVerschiebung` between successive quotients by Vπ(a) = θ_K([π]ₙ)V(a). Its API includes FVπ = 0, Vπ(1) = [π]ₙ^e, FdVπ(a) = θ_K([π])^p da in the log-Witt setting, the projection formula and the exact unit factors in iterates. Specifically Vπ^s(a) = θ_K([π]ₙ)V^s(c_sa), with c_s = ∏_(1≤j<s)F^j(θ_K([π]_(n−j))). These units cannot be omitted merely because images of the operators agree (HM03 (3.1.4) pp.45–46).

Prove Wₙ(A)/p has k-dimension ne, basis Vπ^s([π]^i) for 0 ≤ s < n, 0 ≤ i < e, and multiplication

```text
[π]^i Vπ^t([π]^j) = Vπ^t([π]^(p^t i+j)),
Vπ^s([π]^i)Vπ^t([π]^j) = 0          (0 < s ≤ t),
Vπ^s([π]^(e+i)) = Vπ^(s+1)([π]^(pi)),   Vπ^n = 0.
```

The last relation reduces out-of-range exponents (HM03 Proposition3.1.5 pp.46–47). *Needs:* §5.2 and the actual Witt-vector carrier.

**Checks.**

- ρ₁ is the coefficient inclusion k → A/p; ρₙ(0) = 0 and ρₙ(1) = 1.
- Over ℤ₃ at n = 2, the map without the p-th power fails additivity: [2]₂ is not [1]₂+[1]₂ modulo 3W₂(ℤ₃).
- Over ℤₚ, θ = −1, so Vπ = −V. At odd p and n = 2 their values on 1 are distinct, detecting the sign.
- At n = 1 the source W₀(A)/p is zero; no negative-length source is introduced. The basis has e elements, not one unless the DVR is unramified.

### 5.4 Logarithmic differentials of the DVR

Apply the supplied universal log differential to M = A∩K×. Prove the residue exact sequence 0 → Ω¹_A → ω¹_(A,M) → k → 0, where res(a dlog b) = āv(b). For the relative module over W(k), prove it is cyclic on dlog π with annihilator ideal (πφ′_K(π)), and

```text
πφ′_K(π) = p(πθ′_K(π)−eθ_K(π)) ∈ pA.
```

The ideal is contained in pA; it equals pA precisely in the tame case p ∤ e. Reversing this containment would give a false ramified statement (HM03 Lemma2.2.3 and Corollary2.2.5, pp.34–35).

Describe the absolute module as the coefficient-differential divisible part plus the relative cyclic torsion description; identify the divisible part as the image of A⊗_(W(k))Ω¹_(W(k)). Prove ω^i for i ≥ 2 is uniquely divisible, using the exterior powers of this part. Identify ω¹[p] = (A/p)·dlog(−p), free of rank one over A/p. For finite extensions of complete DVRs prove logarithmic differential base change is an isomorphism exactly when the relative ramification index is prime to p; ordinary differential base change has the stronger unramified requirement (HM03 Lemmas2.2.4,2.2.6 and Corollary2.2.5, pp.34–36). The ordinary cyclic HH of a perfect characteristic-p field is concentrated in degree zero; derived HH over ℤ is a different construction, and THH has Bökstedt's degree-two class (HM03 proof of Lemma2.2.4 p.34). *Needs:* §5.2 and universal log differentials, not a duplicate construction of them.

**Checks.**

- res(dlog π) = 1 whereas res(du) = 0 for an integral unit.
- Over ℤₚ, the relative annihilator is pA.
- For π^p = p, the ideal has the extra valuation contributed by e = p and is strictly smaller than pA.
- Tame ramification and unramified residue extension must both be tested, since logarithmic and ordinary base change have different criteria.

### 5.5 The twisted derivation and the homotopy-orbit module

For a prelog ℤ_(p)-algebra (R,M) define `frobeniusIterD : Wₙ(R) → ω¹_(R,M)` by

```text
F^(n−1)d(a₀,…,aₙ₋₁) = ∑_(j<n)a_j^(p^(n−1−j)−1) da_j.
```

It is a derivation for the module structure through F^(n−1), and d(F^(n−1)a) = p^(n−1)F^(n−1)da. Define `hW n i` as the quotient of ω^(i−1)⊕ω^i with the twisted Wₙ(R)-action

```text
a·(ω₁,ω₂) = (F^(n−1)a·ω₁, F^(n−1)a·ω₂−F^(n−1)da·ω₁)
```

by the image of ω ↦ (p^(n−1)ω,−dω). The API includes the two structure maps, the exact sequence from ω^(i−1)[p^(n−1)] through ω^i to hW and then ω^(i−1)/p^(n−1), naturality for log-ring maps, and the map N:hW→Wₙω given by dV^(n−1)ω₁+V^(n−1)ω₂. Prove exactness hW→Wₙω→_R Wₙ₋₁ω→0 for every such log ring. For the complete mixed-characteristic DVR (A,M) of §5.2 with its canonical log structure, additionally prove unique divisibility of Wₙω^i for i ≥ 2; this is not a theorem for arbitrary (R,M) (HM03 Lemma3.2.5, Proposition3.2.6 and Corollary3.2.7 pp.49–50). *Needs:* the universal log-Witt complex and its actual F,V,d relations.

**Checks.**

- n = 1 gives hW₁ω^i ≃ ω^i; degree zero gives hWₙω⁰ ≃ R with the twisted action.
- On [a]ₙ the derivation is a^(p^(n−1)−1)da, and on V^(n−1)[a] it is da.
- The naive rule D₀(a) = d(a₀) fails twisted Leibniz: at n = 2,p = 3 on ℤ[x], D₀([x]²) = 2x dx, but F([x])D₀([x])+F([x])D₀([x]) = 2x³ dx. The actual Fd([x]²) is 2x⁵ dx.
- Over ℤₚ in length two, hW₂ω¹ has the expected extension by ω⁰/p, so dropping the first summand loses the orbit contribution.
- For R = 𝔽p[x,y] with trivial log structure, W₁Ω² contains the nonzero p-torsion class dx∧dy. Unique divisibility would fail; the DVR hypothesis on that conclusion is essential.

### 5.6 A basis for log-Witt forms modulo p

For the DVR of §5.2 at odd p, prove Wₙω*/p is concentrated in degrees zero and one, both of k-dimension ne. Set r(i) = v_p(i−pe/(p−1)) for 0 ≤ i < e; this argument is nonzero, so its p-adic valuation is finite. A degree-one basis consists of Vπ^s(π^i dlog π) when s ≤ r(i), and dVπ^s(π^i) when s > r(i), with 0 ≤ s < n. Prove the complementary vanishing statements and, with r=r(i)<n,

```text
dVπ^r(π^i) = p^(−r)(i−pe/(p−1)) Vπ^r(π^i dlog π).
```

The coefficient is a p-adic unit before reduction. Specify the module action, rather than only the dimensions. Put B_s = (p^(s+1)−1)/(p−1)−1. For 0 ≤ s,t < n, the products with dVπ^t(π^j) are

```text
s=0:   dVπ^t(π^(p^t i+j)) − i Vπ^t(π^(p^t i+j)dlog π),
0<s≤t: −i Vπ^t(θ(π)^(p^(t−s)B_s) π^(p^(t−s)i+j)dlog π),
s≥t:    j Vπ^s(θ(π)^(p^(s−t)B_t) π^(i+p^(s−t)j)dlog π).
```

The overlapping cases agree. Products with Vπ^t(π^j dlog π) are Vπ^t(π^(p^t i+j)dlog π) if s = 0, Vπ^s(π^(i+p^s j)dlog π) if t = 0, and zero if s,t > 0. Reduce large exponents using §5.3 (HM03 Proposition3.4.1 pp.58–59). The linear independence here ultimately uses §5.14's TR dimension computation; first establish the spanning relations without it, then return to independence. *Needs:* §§5.3–5.5 and, for the final dimension, §5.14. This ordering avoids assuming the desired basis to prove that same dimension.

**Checks.**

- At n=1 the degree-zero and degree-one spaces each have dimension e, while degree two is zero. Confusing integral forms with their mod-p quotient would fail the last assertion.
- For p=3,e=1 the sole exponent i=0 has r(0)=1; level s=1 uses Vπ(dlog π), whereas s=2 uses dVπ²(1). Replacing the cutoff s≤r(i) by s<r(i) chooses the wrong generator at s=1.
- For p=3,e=1,s=t=1,i=j=0, both overlapping formulas give zero for Vπ(1)dVπ(1). At s=t=0 the two expressions give jπ^(i+j)dlog π. Omitting the −i term in the first expression would fail this degree-zero-level calculation.

### 5.7 Logarithmic trace structure maps

Construct `logTRAlpha n : M →* TRⁿ₀(A|K;p)` as a ↦ [a]ₙ, and `logTRDlog n : M → TRⁿ₁(A|K;p)` from the trace of multiplication by a as a self-weak-equivalence after inverting π. A nonzero a need not be an A-module automorphism. Its API is dlog(ab) = dlog a+dlog b, R- and F-invariance, dα(a) = α(a)dlog a, agreement with u⁻¹du for units, and the valuation boundary ∂dlog₁a = v(a). At odd p, or at n = 1 with the separate degree-one argument, prove the required logarithmic differential graded ring structure (HM03 §2.3 pp.36–39, Theorem3.3.1 p.51). *Needs:* §4.8 and the Connes operator.

**Checks.**

- dlogₙ1 = 0, while ∂dlog₁π = 1.
- For an integral unit, the boundary is zero and dlog₁u = u⁻¹du, agreeing with Ω¹_A inside logTHH.
- dlog π cannot come from ordinary THH(A), since every class in that image has zero boundary.
- Multiplication by π is a weak equivalence in the q-model but not an A-module automorphism; defining dlog only on Aut_A(A) would omit it.

### 5.8 Ordinary THH of a complete DVR

For the mixed-characteristic DVR at odd p, prove the Lindenstrauss–Madsen p-completed calculation: π₀T(A;ℤₚ) = A, π₂ₘ₋₁ = A/(mφ′_K(π)) for m ≥ 1, and positive even groups vanish. Track the uniquely divisible integral pieces before taking completion; the completed formula does not assert their vanishing integrally (HM03 proof of Proposition2.3.4 pp.39–40, citing Lindenstrauss–Madsen).

Describe the mod-p ring. If p | e it is (A/p)⊗Λ(α₁)⊗S(α₂). If p ∤ e, let C be the subalgebra of that algebra spanned by aα₁^εα₂^m with a ∈ 𝔪/p, or ε = 1, or p | m; quotient by the ideal generated by aα₁α₂^(m−1), a ∈ 𝔪^(e−1)/p and p ∤ m. In the wild case each degree has dimension e. In the tame case the dimension is e in degrees congruent to −1 or 0 modulo 2p and e−1 otherwise. Under reduction to k, α₁ maps to zero and α₂ to a specified unit times σ (HM03 §2.4 p.40). *Needs:* §§5.2–5.4, the ordinary THH computation and Bockstein. For A = ℤₚ, e = 1, positive degrees outside those two residue classes are zero; this is a useful negative control against extending the wild polynomial answer to all DVRs.

### 5.9 Logarithmic THH and κ

Prove ω^q_(A,M) → π_qT(A|K) is an isomorphism for q ≤ 2 and rationally in every degree. The logarithmic group in degree two is uniquely divisible. Define κ ∈ π₂(T(A|K);ℤ/p) as the unique Bockstein preimage of dlog(−p), and prove

```text
π*(T(A|K);ℤ/p) ≃ ω*_(A,M) ⊗_ℤ 𝔽p[κ],    |κ| = 2,
dκ = κ dlog(−p).
```

The API for `logKappa` includes its Bockstein characterization, naturality under extensions of the DVR, the polynomial-module decomposition, and the displayed Connes formula. First obtain the formula with a unit coefficient; then identify that unit as 1 via the reduction calculation below. This is TheoremB, not a claim about ordinary THH (HM03 Proposition2.3.4 p.39, Theorem2.4.1 p.41 and Remark5.3.3 p.81).

The p-completed groups of logTHH have π₀ = A, π₂ₘ₋₁ = A/(mπφ′_K(π)), and positive even groups zero. The displayed identifications of odd groups are noncanonical and do not determine extension functoriality. For a finite tamely ramified Galois extension L/K, with integer rings B/A and group G, prove T(A|K) → T(B|L)^(hG) induces an isomorphism on homotopy with mod-p coefficients. Use the normal integral basis theorem to make the group-cohomology spectral sequence collapse; ordinary invariants describe the resulting groups only after that argument. For a wild cyclotomic extension ℚₚ(ζ_(p^n))/ℚₚ, n > 1, this descent assertion fails (HM03 Remark2.4.2 p.43 and Theorem2.4.3 p.44). *Needs:* §§4.8,5.4,5.7–5.8, group-cohomology spectra and the tame normal integral basis theorem.

**Checks.**

- Over ℤ₃, the Bockstein of κ is the nonzero class dlog(−3); replacing κ by −κ gives its negative and fails the normalization. The degree-one dlog 3 class distinguishes logarithmic from ordinary THH of ℤ₃.
- Every mod-p degree of logTHH has dimension e, including the unramified e = 1 case.
- The coefficient of κ is not obtained by applying the ordinary THH generator formula without the log relation.
- Positive integral uniquely divisible groups can survive while all their completed positive-even images vanish.

### 5.10 Low-degree TR without circular induction

Give TR* the supplied log-Witt universal map. Compare hWₙω^i with the homotopy-orbit group hTRⁿ_i for i ≤ 1. In degree two prove the exact sequence A/p^(n−1) → hWₙω² → hTRⁿ₂ → 0, with first map a ↦ (da,0): it is the kernel of the comparison that is this image, and hTRⁿ₂ is its cokernel. For n ≥ 2 identify the p-completed group by

```text
(F^(n−1))* (A/p^(n−1)) →_d (F^(n−1))* (ω¹_(A,M)/p^(n−1))
    → hTRⁿ₂(A|K;p,ℤₚ) → 0.
```

Define `[dlog π]ₙ` as the image of dlog π in this degree-two cokernel, not as the degree-one TR logarithmic class. Prove F:hTRⁿ₂(A|K;p,ℤₚ)→hTRⁿ⁻¹₂(A|K;p,ℤₚ) is onto with kernel generated as a Wₙ(A)-module by p^(n−2)[dlog π]ₙ (HM03 Lemmas3.3.3,3.3.5 pp.51–53). At n = 2 the target hTR¹₂ after p-completion is zero, so the displayed class generates the source; at n = 1 the cokernel is zero because p⁰ = 1. These endpoint checks distinguish this quotient class from dlog₁π ∈ TR¹₁.

Prove first the low-degree short exact sequence and unique divisibility of TRⁿ₂ only for n ≤ 3, using the direct argument in the remark on p.56. This proves the connecting formula

```text
∂κ = dV(1) − V(dlog(−p))
```

of Addendum3.3.9 pp.56–57 without using the later all-level Frobenius-surjectivity theorem. Use it in the Tate induction in §§5.12–5.13; then return to prove, for all n, 0→hTRⁿ_i→TRⁿ_i→TRⁿ⁻¹_i→0 for i ≤ 1, unique divisibility of TRⁿ₂(A|K;p) and TRⁿ₂(A;p), and Wₙω^q ≃ TRⁿ_q for q ≤ 2, rationally in every degree (HM03 Propositions3.3.6–3.3.7 and Theorem3.3.8 pp.53–56; Lemma5.6.1 p.94). *Needs:* §§5.5,5.7–5.9, the orbit spectral sequence and Layer 4 localization. The all-level conclusion is deliberately postponed until Frobenius surjectivity has an independent proof.

**Checks.**

- At n=1 the p-completed degree-two orbit group is zero, while dlog₁π is a nonzero degree-one logarithmic class. These cannot be the same definition.
- For n=2 the Frobenius target is zero, so the W₂(A)-span of [dlog π]₂ is the whole source. The exponent p^(n−2) is one here; replacing it by p^(n−1) would kill the generator.
- In the quotient presentation exact logarithmic forms da map to zero. In particular the image of dπ=πdlog π vanishes; the quotient is not the entire module of logarithmic differentials.

### 5.11 Ramified coordinates and TR Bott classes

Suppose μ_p ⊂ K and choose primitive ζ. Construct the polynomial u_K of degree < e with u_K(π)^(p−1) = θ_K(π) and

```text
dlog ζ = −π^(e/(p−1))u_K(π)⁻¹ dlog(−p).
```

The divisibility p−1 | e follows from μ_p ⊂ K. The API for `lubinTateUnit` includes its degree bound, unit constant coefficient, the chosen-root normalization through dlog ζ, and the extension formulas below; the root equation alone admits several choices. Set α_K = u_K(π)⁻¹κ. Prove the presentation Λ(dlog π)⊗k[α_K,π]/(π^e), with dπ = πdlog π and dα_K = eα_Kdlog π. For a finite totally ramified extension with relative Eisenstein unit θ_rel, identify π_K ↦ −θ_rel⁻¹π_L^(e_rel), dlog π_K ↦ e_rel dlog π_L−dlog θ_rel, and α_K ↦ (−θ_rel)^(e_K/(p−1))α_L. These are formulas on the chosen coordinates, not invariant choices of roots (HM03 Lemma5.2.1, Addendum5.2.2 and Proposition5.2.3, pp.75–77).

Define `trBott n ζ` as the trace of the K-theory Bott class with ℤ/p^ν coefficients. Its API is Bockstein dlogₙζ, uniqueness from the low-degree integral divisibility, compatibility with R,F and roots/coefficient changes, and additivity in ζ at odd p. For ν = 1, prove b₁ = −π^(e/(p−1))α_K and b^(p−1) equals the image of the chosen v₁ class, independent of the primitive root (HM03 §5.2 pp.76–78 and Lemma6.1.2 p.97). *Needs:* §§1.2,5.10 and the ramified coordinates.

**Checks.**

- For K = ℚₚ(ζₚ), π = ζₚ−1 and e = p−1, the formula is b₁ = −πα_K; replacing π by p would give a different valuation and is wrong.
- For p = 3 and this π, θ(π) = 1+π in A/3 = 𝔽₃[π]/(π²). The normalized unit is u_K(π) = 1−π, whose square is 1+π; it gives α_K = (1+π)κ and b₁ = −πκ.
- The other square root −u_K still satisfies the root equation but reverses the nonzero dlog ζ formula. That formula selects the unit associated with ζ.
- For K = ℚ₃, e = 1 and μ₃ is absent; the μ_p-dependent unit and Bott-coordinate presentation above cannot be applied. Logarithmic κ itself still exists by §5.9.
- The trivial root has b = 0. If dlogₙζ ≠ 0, b has no integral lift; it is a coefficient class.
- Bockstein agrees with the trace of βζ from Layer 1, fixing both the sign and the root used.
- For a tame ramification index prime to p the differential multiplier remains visible; in a wild extension it can vanish modulo p.

### 5.12 Reduction, infinite cycles and the comparison theorem

When p | e, compute ordinary THH reduction to A/p, using the classes of §5.16:

```text
ρ*(κ̃) = σ − θ(π)⁻¹c₂
          − ε((e/p)π^(e−1)+θ′(π))θ(π)⁻¹dπ,
κ̃ ↦ σ under A → k,
dκ̃ = −θ′(π)θ(π)⁻¹dπ κ̃.
```

Here βε = 1, and the displayed map is a map of differential graded k-algebras. This determines the universal coefficient in dκ = κdlog(−p), also for fields with p ∤ e (HM03 Proposition5.3.1 p.78, Lemma5.3.2 p.80 and Remark5.3.3 p.81).

For a perfect field k of odd characteristic, the mod-p Tate sequence has E² = Λ(u₁,ε)⊗k[t^±1,σ] and differential d²ε = tσ. Identify Γ̂(ε) and Γ̂(σ) by the permanent representatives u₁t⁻¹ and t⁻¹. For every mixed-characteristic K, dlog π is a permanent cycle representing Γ̂(dlogₙπ). If μ_p ⊂ K and 1 ≤ n < v_p(e), the representatives of Γ̂([π]ₙ) and Γ̂([π]ₙ^(e/p^n)) are π^(p^n) and −τα. Prove this first in ordinary THH, then through its map to logarithmic THH. Also identify −tκ^p and (−tκ)^(p^n) as permanent cycles representing the unit-image of v₁ and V(1) whenever they survive as nonzero classes. Do not infer nonvanishing just from permanence (HM03 Corollary4.4.2 p.72, Propositions5.3.4–5.3.6 pp.81–83 and Addendum5.3.7 p.83).

Prove the elementary input: if f ∈ k[[x]] is a unit and xf′/f = Σ aᵢxⁱ in characteristic p, then a_(pi) = aᵢ^p. Use it with the C_p differential calculation in §5.13 to prove Γ̂:T(A|K)→T(A|K)^{tC_p} induces an isomorphism with mod-p coefficients in every nonnegative degree, for every K in the standing scope. Extend to Γ̂ and Γ at every level and with ℤ/p^ν coefficients. For the all-level step, apply NS CorollaryII.4.9 p.265 with its strict bound i > −1, using its function-spectrum variant for the dual of the finite mod-p Moore spectrum. The cyclotomic equivalences identify the required geometric fixed-point inputs with the same bounded-below spectrum; the cartesian fixed/homotopy-fixed/Tate square converts the base Γ̂ hypothesis to the fixed-point comparison. Then use the coefficient cofiber sequences to pass to p^ν, retaining connectivity of the fixed-point source at the degree-zero endpoint. This finite-Moore argument does not assume finite residue field or interchange an uncontrolled inverse limit with homotopy. It is a connective comparison; negative Tate groups are not asserted to vanish (HM03 Lemma5.4.1 and Proposition5.4.2 pp.84–86, Theorem5.4.3 p.86 and Addendum5.4.4 p.87). *Needs:* §§4.3–4.5,5.9–5.11 and the appendix calculations in §5.16.

**Checks.**

- Over k, the nonzero differential on ε removes σ as a polynomial generator but preserves its inverse-filtration representative t⁻¹.
- For n = v_p(e), the deep-ramification representative −τα requires the endpoint replacement in §5.16.
- Γ̂ is an isomorphism in degree zero, while the Tate target has negative homotopy groups.
- The formal series f = 1−x gives aᵢ = −1, and therefore passes the p-th-power identity, including characteristic two as an elementary identity.

### 5.13 All Tate differentials and surviving bases

Assume μ_p ⊂ K or K = K₀. For a polynomial with coefficients in the perfect field k, superscript (j) means applying Frobenius j times to its coefficients, allowing negative j. At C_(p^n), use α = u_K^(-n)(π)⁻¹κ and τ = u_K^(-n)(π)^p t; put u_(K₀) = 1. The E²-algebra is

```text
Λ(uₙ,dlog π) ⊗ k[π,α,τ^±1]/(π^e).
χ(a,r,d) = (pa−d)e/(p−1)+r,
R_v = 2(p^(v+1)−1)/(p−1),    B_v = R_v/2−1.
```

For K₀ the value χ can be rational with denominator prime to p; use its p-adic valuation, with v_p(0) = ∞. For a ∈ ℤ, 0 ≤ r < e and d ≥ 0, the differentials on x = τ^aπ^rα^d with v = v_p(χ) < n, and on the exterior generator, are

```text
d^(R_v)(x) = λ(τα)^B_v τ dlog π · x,
d^(R_n−1)(uₙ) = μ(τα)^B_n τ,
λ = −λ_v p^(−v)χ · u_K^(v−n)(π^(p^v))^(−p),
μ = μₙ u_K(π^(p^n))^(−p).
```

Here λ_v,μₙ are the fixed nonzero elements of 𝔽ₚ supplied by the unramified calculation; λ and μ are units in A/p. All remaining differentials follow by multiplication and linearity; dlog π is permanent. The exact nonzero units matter when specifying a comparison on chosen generators, even though their values do not affect the dimensions (HM03 Theorem5.5.1 and Remark5.5.2 p.87).

Prove the page description as well as the differential lengths. For R_(s−1) < q ≤ R_s, 0 ≤ s < n, with R_(−1) = 0, the q-page is the sum of Λ(uₙ) times monomials x dlog π with v_p(χ) = v, 1 ≤ v < s, d < B_v, and Λ(uₙ,dlog π) times monomials x with v_p(χ) ≥ s. The final page is the sum of Λ(uₙ) times x dlog π with 1 ≤ v < n, v_p(χ) = v, d < B_v, and Λ(dlog π) times x with v_p(χ) ≥ n, d < B_n. Empty ranges contribute zero. Keep the filtration and bidegrees on this description; a dimension count alone loses Bott multiplication (HM03 Lemma5.5.3 p.88).

In the unramified case obtain the successive nonzero differentials on t^(p^(v−1)), 1 ≤ v < n, and on uₙ, together with the permanent classes tκ^p and dlog(−p). Identify (−tκ)^(p^(s+1))dlog(−p), 1 ≤ s < n, with dV^(n−s)(1). In the deep-ramification range n < v_p(e), the successive differentials instead begin on π^(p^v), 0 ≤ v < n, with coefficient −λ_v; τ, α and dlog π survive (HM03 Propositions5.5.4–5.5.5 pp.89–94). *Needs:* §5.12, the low-level argument of §5.10, and the explicit Witt bases of §5.6. Complete the general induction using extensions with enough ramification and descent, retaining the coefficient changes under ramified base change.

**Checks.**

- For n = 1 the first differential is d² and the exterior generator dies on page 2p+1.
- When χ = 0 its valuation is ∞, so the monomial never enters a finite-v differential.
- With p = 3, e = 2 and x = α, χ = −1 and d² is nonzero; with x = τ α³, χ = 0.
- For n = 1, B₁ = p, so the final α-exponent bound is d < p.
- The deep-ramification and unramified cases have different first generators and cannot be identified by simply setting π = p in a ramified formula.

### 5.14 Bott multiplication and the pro-Witt comparison

Deduce integral surjectivity of F:TRⁿ_(2i+1)(A|K;p)→TRⁿ⁻¹_(2i+1)(A|K;p), for i ≥ 0, n ≥ 2, from the Tate calculation. This closes the all-level argument postponed in §5.10. If μ_p ⊂ K or K = K₀, prove dim_k TRⁿ_q(A|K;p,ℤ/p) = ne for every q ≥ 0 (HM03 Lemma5.6.1 pp.94–95 and Proposition6.1.1 p.97).

For μ_p ⊂ K, compute Bott multiplication on the final-page basis. If r+e/(p−1) = a′e+r′, 0 ≤ r′ < e, multiplication by b sends the monomial τ^aπ^rα^d(dlog π)^δ to a nonzero unit times

```text
τ^(a+a′) π^r′ α^(d+a′+1) (dlog π)^δ.
```

Check χ is preserved. If q = q₁(p−1)+q₀, 0 ≤ q₀ < p−1, the representative of b^q has, up to its specified unit, exponents τ^q₁ π^(q₀e/(p−1)) α^(q₁+q). Prove that the image of the logarithmic Witt complex is exactly the portion with χ ≥ 0 (HM03 Lemmas6.1.2–6.1.3 pp.97–99).

Construct the natural pro-isomorphism

```text
W•ω*_(A,M) ⊗_ℤ S_(ℤ/p^ν)(μ_(p^ν))
    → TR•_*(A|K;p,ℤ/p^ν),     μ_(p^ν) in degree 2,
```

when μ_(p^ν) ⊂ K. Equivalently, first reduce W•ω* modulo p^ν and then tensor over ℤ/p^ν; the integral Witt complex itself is not an ℤ/p^ν-module. R,F,V act as on Witt forms and identically on the root factor, and the differential of that factor is zero. This is an isomorphism of pro-graded groups with the stated operations. Do not upgrade it to a classification of every finite-level coefficient ring, especially for ν > 1. For ν = 1 prove the filtration estimate: choose N with p(q+1)e/(p−1) < p^N; the comparison is an isomorphism on associated grades s < n−N for Filˢ Eₙ = VˢE_(n−s)+dVˢE_(n−s). That estimate, and the fact that a sufficiently deep filtration is killed by restriction, prove the pro assertion (HM03 Theorem6.1.4 pp.99–101, TheoremC p.5). Also prove the torsion pro-isomorphism W•(A)⊗μ_(p^ν)→W•ω¹[p^ν], x⊗ζ↦xdlog ζ (Remark6.1.5 p.101). *Needs:* §§5.6,5.10–5.13 and coefficient Bockstein sequences.

**Checks.**

- For e = p−1 the Bott carry occurs already at r = e−1 and adds one to the α exponent beyond its degree contribution.
- At n = 1,q = 0 the dimension is e; at n = 2 it is 2e.
- In total degree zero the source at level n is Wₙ(A)/p^νWₙ(A). At n = 1 this is A/p^ν, whereas W₁(A) = A has characteristic zero and cannot itself be a module over ℤ/p^ν.
- Equality of these dimensions does not imply a levelwise Witt–Bott isomorphism.
- If K lacks primitive p^ν-th roots, no such root-factor formula is asserted over K without descent.
- At ν = 1, the exponent inequality gives a concrete restriction level that removes each negative-χ obstruction.

### 5.15 TC, Galois cohomology and the local trace

For finite extensions K/ℚₚ, p odd, identify mod-p logarithmic TC in nonnegative degree:

```text
TC_(2s)(A|K;p,ℤ/p) ≃ H⁰(K,ℤ/p(s)) ⊕ H²(K,ℤ/p(s+1)),
TC_(2s+1)(A|K;p,ℤ/p) ≃ H¹(K,ℤ/p(s+1)),      s ≥ 0.
```

The even splitting here is the natural one from HM03 Theorem6.1.6 p.101; retain its proof through the Frobenius-fixed unit map in degree zero. Use the local Witt-complex calculation and Galois descent to obtain the positive-degree finite-coefficient comparison for every perfect-residue mixed-characteristic K in the standing odd-p scope. For higher ν retain the natural even short exact sequence and the abstract splitting unless a coherent natural higher-coefficient splitting has been constructed. A coefficient induction showing the abstract groups does not itself construct such a splitting.

For that perfect-residue extension, establish the additional arithmetic inputs at their stated scope: Br(k)[p] = 0, the p-torsion residue identification Br(K)[p] ≃ H¹(k,ℤ/p), the Artin–Schreier identification H¹(k,ℤ/p) ≃ k/(x^p−x), and cd_p(K) ≤ 2. These give H²(K,μ_p) and the cohomological vanishing used in the descent argument. The finite-residue local duality contract alone does not supply them when k is infinite; their proof is part of this application from the general henselian/Galois-cohomology foundations (HM03 proof of Theorem6.1.6 pp.100–102, citing Serre's residue sequence and cohomological-dimension theorem). *Needs:* henselian residue theory, the inertia exact sequence, Artin–Schreier theory, normal bases and continuous cohomology.

First use the finite-algebra trace theorem: for A finite as a W(k)-module, with k perfect of characteristic p, connective K(A)^∧_p is the connective cover of TC(A;p)^∧_p (HM97a TheoremsC–D p.ii (PDF2), §5 pp.32–35 and AppendixB pp.50–52). Combine this with the torsion-complex comparison and the two localization sequences of Layer 4 to prove

```text
K_i(K;ℤ/p^ν) → TC_i(A|K;p,ℤ/p^ν) is an isomorphism,   i ≥ 1.
```

The degree-zero comparison is not an isomorphism in general. This is the local trace theorem, rather than the assertion that THH(K) computes the logarithmic object (HM03 Theorem6.1.10 p.104 and introductory TheoremA pp.1–3). The odd groups become H¹(K,ℤ/p^ν(i)); the even groups fit the H²/H⁰ exact sequence recorded in §6.6. *Needs:* §§4.6–4.8,5.14 and the local Galois supplier, including its finite-module duality.

**Checks.**

- In degree zero the extra H²(K,ℤ/p(1)) is already a warning against extending the positive-degree trace theorem.
- For K = ℚ₃ and degree two, H²(K,ℤ/3(2)) = 0, while H⁰(K,ℤ/3(1)) = 0, so the mod-3 group is zero.
- For K = ℚ₃(ζ₃), both terms can be nonzero; replacing the full even group by the H² term loses the coefficient Bockstein contribution.

### 5.16 Monoid algebras and truncated polynomial THH

Prove the circle-equivariant equivalence T(A)∧N^cy(Π)→T(A[Π]) and its compatibility with the cyclotomic structure for a pointed monoid Π. For Π_e = {0,1,x,…,x^(e−1)}, split the cyclic bar construction by weight s ≥ 0, with weight zero S⁰. For positive s put d = floor((s−1)/e) and λ_d = ⊕_(i=1)^d ℂ(i). Give the cofiber sequence

```text
S^λ_d ∧ (𝕋/C_(s/e))₊ → S^λ_d ∧ (𝕋/C_s)₊ → N^cy(Π_e;s).
```

The first term is a point when e ∤ s. The second term generally is not; declaring both terms trivial loses all weights not divisible by e. Import the representation spheres from genuine equivariant homotopy theory, the divided power algebra from Mathlib, and the big Witt object from Habiro rings (HM97b TheoremB p.75 and Theorem4.2.10 p.95; Hesselholt05 Theorem5 p.17; HM03 AppendixA.1 pp.105–106).

When e = 0 in k, compute classical relative Hochschild homology as k[π]/(π^e)⊗Λ(c₁)⊗Γ(c₂), with |c₁| = 1, |c₂| = 2, dπ = c₁ and dγ_m(c₂) = 0. The periodic bimodule resolution has differential on c₂ given by the divided difference of x^e. For a perfect field k of characteristic p and p | e, the corresponding THH algebra has an additional polynomial σ in degree two, and its Connes differential is

```text
dγ_(m+1)(c₂) = −(e/p)π^(e−1)c₁γ_m(c₂)σ.
```

This separates the ordinary Hochschild differential from the topological one (HM03 equation(A.1.3) and PropositionA.1.4 pp.106–107).

With mod-p coefficients and odd p, prove the Tate differentials d²ε = tσ, d²π = tc₁ and d²γ_(m+1)(c₂) = −(e/p)tπ^(e−1)c₁γ_m(c₂)σ; identify the modified divided-power generator on the E³ page and prove all higher differentials vanish. For 1 ≤ n ≤ v_p(e), Γ̂([π]ₙ) is represented by π^(p^n). The representative of Γ̂([π]ₙ^(e/p^n)) is tc₂ for n < v_p(e), and −(e/p^n)uₙπ^(e−1)c₁ at n = v_p(e). Keep this endpoint in the reduction argument of §5.12 (HM03 AddendumA.1.6 and PropositionA.1.7 p.109). *Needs:* §§4.1,4.3–4.5, the supplied equivariant spheres, and divided powers.

**Checks.**

- At e = 1 the relative augmentation ideal is zero; the cofiber model must be contractible in positive weights.
- For e = p, the coefficient e/p equals 1, so the THH divided-power differential need not vanish, although e = 0 in k.
- For e = p² it vanishes modulo p.
- In weight s = 1 < e, the circle-orbit term survives even though e ∤ s.
- At n = v_p(e), the displayed odd representative replaces tc₂.

### 5.17 Twisted TR and relative K-theory of nilpotent thickenings

For a regular noetherian 𝔽ₚ-algebra A and a complex circle representation λ, put ℓ_s = dim_ℂ λ^(C_(p^s)) for s ≥ 0 and ℓ_s = ∞ otherwise. Prove

```text
TRⁿ_(q−λ)(A;p) ≃
  ⊕_(r=1)^n ⊕_(ℓ_(n−r) ≤ m < ℓ_(n−1−r)) W_rΩ_A^(q−2m).
```

For λ = 0 only r = n contributes and the formula becomes ⊕_(m≥0) WₙΩ_A^(q−2m). Establish the smooth case first and extend through filtered colimits using geometric regularity over a perfect field; do not apply Popescu to arbitrary singular algebras (Hesselholt05 Theorem11 and Proposition12 p.30; Hesselholt96 TheoremB p.2).

For e = p^v e′ with p ∤ e′, I_p = {j ≥ 1 : p ∤ j}, and d(r,j) = floor((p^(r−1)j−1)/e), define L_q(j) = lim_R TR^r_(q−λ_d(r,j))(A;p) and L′_q(j) with TR^(r−v), r ≥ v+1. Prove the relative TC exact sequence

```text
∏_(j∈e′I_p) L′_(q−1)(j) --e′V^v→ ∏_(j∈I_p) L_(q−1)(j)
  → TC_q(A[x]/(x^e),(x);p) → ∏_(j∈e′I_p) L′_(q−2)(j) → … .
```

The restriction level r belongs inside each inverse limit. It is not a second product index. Give the analogous finite-coefficient sequence for arbitrary A and the degree bounds that make the relevant contributions finite (Hesselholt05 Proposition8 p.24 and Lemma9 p.26).

Deduce for regular noetherian 𝔽ₚ-algebras the exact sequence whose first two terms are

```text
⊕_(m≥1) ⊕_(j∈e′I_p) W_(s−v)Ω_A^(q−2m)
   --e′V^v→ ⊕_(m≥1) ⊕_(j∈I_p) W_sΩ_A^(q−2m)
   → K_(q−1)(A[x]/(x^e),(x)) → … ,
p^(s−1)j ≤ me < p^s j,       W_s = 0 for s ≤ 0.
```

The following terms use q−1−2m. This is integral relative K-theory and its groups are p-primary torsion. For a perfect field k, simplify it to K_(2m−1)(k[x]/(x^n),(x)) ≃ 𝕎_(mn)(k)/V_n𝕎_m(k), and K_(2m) = 0, m ≥ 1. The absolute augmentation sequence splits through k→k[x]/(x^n). Here 𝕎_N denotes big Witt vectors for the initial truncation set {1,…,N}, not the divisor truncation set of N (Hesselholt05 Theorem13 p.33; HM97b TheoremA p.74).

In characteristic zero, prove first the rational relative cyclic-homology formula ⊕_(i≥1,e∤i) HH_(q−2 floor((i−1)/e))(A)⊗ℚ ≃ HC_q(A[x]/(x^e),(x))⊗ℚ. For regular noetherian ℚ-algebras, use nilpotent relative K/HC comparison and HKR to obtain

```text
K_(q−1)(A[x]/(x^e),(x)) ≃ ⊕_(m≥1) (Ω_A^(q−2m))^(e−1).
```

These groups are uniquely divisible and the relative spectrum admits its rational Eilenberg–Mac Lane decomposition (Hesselholt05 Proposition7 p.22 and Theorem10 p.28). Finally prove, for smooth k-algebras and then regular noetherian 𝔽ₚ-algebras, TRⁿ_* ≃ WₙΩ*⊗Wₙ(k)[σₙ], with Fσₙ = σₙ₋₁ and Rσₙ = pλₙσₙ₋₁ for units λₙ. The positive polynomial terms are pro-zero under R; the remaining de Rham–Witt transition system gives the required Milnor-limit comparison TR_* ≃ WΩ*. Derive the long exact TC sequence with 1−F on WΩ, including its relative version. This supplies the equal-characteristic calculation in Layer 6 (Hesselholt96 TheoremsB–C p.2 and §1.2 p.5; GH06 Introduction p.3).

**Checks.**

- For n = 1 the truncated-polynomial relative groups are zero, since V₁ is the identity.
- For a perfect k and n = p, the relative K₁ agrees with the principal units 1+xk[x]/(x^p); its additive presentation is 𝕎_p(k)/V_p𝕎₁(k).
- For A[ε] in characteristic zero, K₁ relative is A and K₂ relative is Ω¹_A.
- For λ = 0, the inequality with ℓ_(−1) = ∞ preserves every nonnegative σ exponent.
- For e prime to p the first map is eV⁰ on its indicated weight summands, not multiplication by p.

### Examples

Carry out the log-THH and the first two Witt levels for ℤ₃, ℤ₃[ζ₃], and a totally ramified extension with e divisible by 9. Contrast their common formula dim_k TRⁿ_q = ne with their different Tate representatives. For the nilpotent example 𝔽₃[x]/(x²), K₁ relative has three elements and even positive relative groups vanish. The dual numbers over ℚ have relative K₁ = ℚ and K₂ = 0; over ℚ(t) the latter is the nonzero absolute differential module ℚ(t)dt.

### Dependencies

Layers 1 and 4; LocalFields and the existing complete-DVR, Witt, divided-power and differential APIs; CrystallineCohomology for the logarithmic Witt complex; equivariant homotopy theory for representation spheres and genuine fixed points; the general nilpotent relative trace theorem; local Galois cohomology for §5.15. These calculations do not require the later integral local K-group classification or a p-adic regulator.

## Layer 6: completed and integral higher K-groups of local fields

### 6.1 The maximal divisible subgroup

For an additive abelian group A define `maxDivisible A` as the supremum of its divisible additive subgroups. A subgroup is divisible when multiplication by every positive integer is surjective on that subgroup. Prove the supremum is divisible, contains every divisible subgroup, and has reduced quotient. The API is membership through a divisible subgroup, `eq_top_iff`, `quotient_reduced`, a noncanonical internal complement, functoriality under additive homomorphisms, finite-product compatibility, and triviality on finite groups. These are the declarations represented in Suggested.lean. Also prove Div(A) ⊆ ⋂_(m≥1)mA and the classification Div(A) ≃ ℚ^(κ)⊕⊕_ℓ(ℚ_ℓ/ℤ_ℓ)^(λ_ℓ). The inclusions and cardinal ranks are intrinsic; the decomposition and complement are choices (K-book VI.1.6 proof p.467 and VI.7.3 p.509).

Isolate the useful criterion: if w ≥ 1 and mA = wA for every positive multiple m of w, then wA = Div(A) = ⋂_(m≥1)mA. If A/wA is cyclic of order w, obtain an abstract splitting A ≃ Div(A)⊕ℤ/w. For a torsion-free ℤ_(p)-module T with dim_(𝔽p)T/pT = t finite, prove T/p^νT ≃ (ℤ/p^ν)^t, its completion is ℤₚ^t, and the completion kernel is Div(T), a ℚ-vector space. Lifts of a basis mod p generate P ≃ ℤ_(p)^t, with P∩Div(T) = 0; P completes isomorphically onto T^∧, T/(P+Div(T)) is a ℚ-vector space, and T^∧/image(T) is a ℚ-vector space. This does not split the inclusion P→T (K-book VI.7.3 proof p.509 and WarningVI.7.5 p.510; Handbook Corollary63 p.166). *Needs:* injectivity of divisible abelian groups, elementary structure of finite p-power quotients, and the general completion supplier.

**Checks.**

- Div(ℚ×ℤ/6×ℤ) = ℚ×0×0. Every fixed wℤ is nonzero, whereas Div(ℤ) = 0.
- For a finite group A, Div(A) = 0; for A = ℚ/ℤ it is all of A. Quotients need not preserve reducedness: ℤₚ is reduced, while ℤₚ/ℤ_(p) is a nonzero ℚ-vector space.
- Taking T = ℤₚ and P = ℤ_(p) gives a rank-one completion isomorphism and a uniquely divisible quotient T/P. It does not make ℤₚ a direct sum of P and that quotient.
- At t = 0 a torsion-free ℤ_(p)-module T with T/pT = 0 is a ℚ-vector space; its p-completion is zero.

### 6.2 The completion exact sequence

Use the supplied Tate module of an abelian group, with transition multiplication by p on p-power torsion. On that carrier prove `tateModule_left_exact` for an exact sequence 0→B′→B→B″, `tateModule_torsionFree`, and `tateModule_eq_zero_of_boundedExponent`: if p^N kills B[p^∞] for some N, then Tₚ(B)=0. The bounded-exponent proof evaluates a compatible family at level n as p^N times its level n+N entry. Apply the supplied finite-rank criterion to prove `tateModule_prufer_pow` for B=(ℚₚ/ℤₚ)^r, finite r (Handbook59 p.164, interpreting its inverse limit of torsion). Specialize StableHomotopyKTheory §7.13’s supplied completion extension to K(R). Under finiteness of K_n(R;ℤ/p^ν) and K_(n+1)(R;ℤ/p^ν) for all ν, identify

```text
0 → lim_ν K_n(R)/p^ν → K_n(R;ℤₚ) → T_p K_(n−1)(R) → 0,
ker(K_n(R)→K_n(R;ℤₚ)) = ⋂_ν p^ν K_n(R).
```

State the more general version with explicit Mittag–Leffler/derived-limit hypotheses, rather than silently dropping finiteness. If adjacent integral K-groups are finitely generated, the middle group is K_n(R)⊗ℤₚ. Without that hypothesis the Tate term can contribute an entire ℤₚ factor and a naive tensor product need not be the completion. The kernel is not automatically the maximal divisible subgroup (K-book IV.2.9 p.282; Handbook Completed K-theory59 and Warning60 p.164). *Needs:* coefficient Bockstein and Milnor sequences, plus the already supplied Tate module.

**Checks.**

- A finite-exponent p-primary torsion group has zero Tate module; ℚₚ/ℤₚ has Tate module ℤₚ and zero ordinary p-completion.
- For a finitely generated group A, lim A/p^ν = A⊗ℤₚ.
- The ℤₚ contribution to completed K₂(ℂ) comes from T_pK₁(ℂ), while the ordinary p-completion of its divisible integral K₂ is zero.
- Tₚ(0)=0 and Tₚ(ℤ)=0, while Tₚ((ℚₚ/ℤₚ)^2) has rank two. The latter calculation rules out using the p-torsion subgroup itself, which has exponent p. The zero and bounded-exponent cases follow by the same compatibility argument, without a finite-generation hypothesis.

### 6.3 Cyclotomic invariants of a p-adic field

Let L/ℚₚ be finite, d = [L:ℚₚ], residue field 𝔽_q. Import W_i(L) = H⁰(L,ℚ/ℤ(i)) and its primary parts from the arithmetic/Galois supplier. The new result here is their local evaluation. For i ≠ 0, W_i^(p)(L) is finite cyclic. For odd p put r = [L(ζₚ):L], p^a = #μ_(p^∞)(L(ζₚ)). Then

```text
w_i^(p)(L) = p^(a+v_p(i)) if r | i, and 1 otherwise.
```

For p = 2 put 2^a = #μ_(2^∞)(L(√−1)), a ≥ 2. If √−1 ∈ L, the order is 2^(a+v₂(i)). If √−1 ∉ L and i is odd, it is 2. For even i and √−1 ∉ L, it is 2^(a+v₂(i)) in the exceptional case and 2^(a+v₂(i)−1) otherwise. Exceptional means that Gal(L(ζ_(2^ν))/L) is noncyclic for all sufficiently large ν; this is a condition on the cyclotomic tower, not on ramification alone. Prove w_(−i)^(p) = w_i^(p), and, for i ≥ 1,

```text
w_i(L) = (q^i−1)w_i^(p)(L).
```

The generic W_i object and its functorial maps remain with their supplier. For ℚₚ the odd-prime formula is p^(1+v_p(i)) if p−1 | i and 1 otherwise; for ℚ₂ it is 2 for odd i and 2^(2+v₂(i)) for even i (K-book PropositionVI.2.2 pp.470–471, ExampleVI.2.3.1 p.471). *Needs:* cyclotomic local extensions, the cyclotomic character, and finite-field Frobenius.

**Checks.**

- w₁^(p)(ℚₚ) = 1 for odd p and w₁^(2)(ℚ₂) = 2.
- The values w₂^(2)(ℚ₂) = 8 and w₆^(3)(ℚ₃) = 9 detect both the dyadic exception and the valuation of the twist.
- An unramified extension leaves the p-primary w₂ equal to 8,3,1 for p = 2,3,≥5 respectively; adjoining ζₚ instead makes the odd-prime p-primary part nontrivial in every positive twist.
- At i = 0 the invariant is infinite and these finite-order formulas do not apply.

### 6.4 Galois cohomology with all three coefficient systems

For i ≠ 0, prove H⁰(L,ℤ/p^ν(i)) = W_i^(p)(L)[p^ν], of order gcd(p^ν,w_i^(p)). On these groups, coefficient inclusions are eventually identities and coefficient reductions are eventually multiplication by p. Thus H⁰(L,ℤₚ(i)) = H⁰(L,ℚₚ(i)) = 0, whereas H⁰(L,ℚₚ/ℤₚ(i)) = W_i^(p)(L).

Import finite local Tate duality, including p = 2, in the precise form H²(L,ℤ/p^ν(j)) ≃ Hom(H⁰(L,ℤ/p^ν(1−j)),ℚ/ℤ), and cohomological dimension two. Deduce H²(L,ℤₚ(i+1)) ≃ ℤ/w_i^(p) for i ≠ 0: finite-level reductions are eventually bijections, while inclusions through a sufficiently large coefficient jump are zero. Consequently H²(L,ℚₚ/ℤₚ(i+1)) = 0. Twist one is exceptional: H²(L,ℚₚ/ℤₚ(1)) ≃ ℚₚ/ℤₚ.

For i ∉ {0,1}, local Euler characteristic and the coefficient sequence identify the torsion subgroup of H¹(L,ℤₚ(i)) canonically with W_i^(p)(L); the torsion-free quotient has rank d. Hence, noncanonically,

```text
H¹(L,ℤₚ(i)) ≃ ℤₚ^d ⊕ ℤ/w_i^(p),
H¹(L,ℚₚ/ℤₚ(i)) ≃ (ℚₚ/ℤₚ)^d ⊕ ℤ/w_(i−1)^(p).
```

The second follows from the natural exact sequence with H¹(L,ℤₚ(i))⊗ℚₚ/ℤₚ and H²(L,ℤₚ(i)). At i = 1, the free rank is d+1 by Kummer theory and the valuation; do not insert it into a formula whose rank is d (K-book VI.7 cohomology calculation p.508 and RemarkVI.7.4.3 p.510; Handbook §5.6 p.165). *Needs:* §6.3, local finite-module duality and Euler characteristic, continuous cohomology and its coefficient limits.

**Checks.**

- Over ℚ₂, H⁰(ℤ/2^ν(2)) stabilizes as a group of order eight, but its inverse limit along reductions is zero.
- Its dual H²(ℤ/2^ν(3)) has inverse limit ℤ/8.
- H¹(ℚ₃,ℤ₃(1)) has rank two, while H¹(ℚ₃,ℤ₃(2)) has rank one.
- In twist one the divisible H² is nonzero, unlike every twist i+1 with i ≠ 0.

### 6.5 Residue-characteristic coefficients and the valuation ring

For a local field E of either characteristic, valuation ring V and residue characteristic p, prove K_n(V;ℤ/p^ν)→K_n(E;ℤ/p^ν) and K_n(V;ℤₚ)→K_n(E;ℤₚ) are isomorphisms for n ≥ 2. In degree one give instead the short exact valuation sequences with quotient ℤ/p^ν and ℤₚ respectively. Use Layer 1 to remove all positive-degree p-coefficient groups of the residue field, and retain its degree-zero term (K-book proof of VI.7.4 p.510; Handbook §5.6 p.165). *Needs:* localization, the finite-field computation, and the coefficient Milnor sequence.

**Checks.**

- The class of a uniformizer maps to 1 in ℤ/p^ν, so the degree-one map cannot be onto.
- Principal units contribute on both sides of that sequence.
- In degree zero both rings have rank group ℤ and finite coefficients ℤ/p^ν; the stated high-degree proof cannot be applied by ignoring this surviving rank term.

### 6.6 The early étale edge comparison

Construct the coefficient edge map `etaleEdgeOne i ν` from K_(2i−1)(F;ℤ/ℓ^ν) to H¹(F,ℤ/ℓ^ν(i)), for i ≥ 1, ℓ invertible in F and cd_ℓ(F) ≤ 2, using the foundational motivic/étale comparison, its descent spectral sequence, and the Bott normalization of Layer 1. Its API must specify naturality among these fields, coefficient inclusions and reductions, products and the even H⁰ edge, the Kummer identification at i = 1, and trace compatibility in the odd-residue-characteristic local application. This is the early operation consumed by local K-theory and the finite-field symplectic comparison. Its construction requires the foundational motivic complexes, norm-residue comparison and descent theorem; those suppliers are stated above independently of any later local-field computation.

In the larger odd-p mixed-characteristic scope of Layer 5, construct the Dwyer–Friedlander comparison γ_K: K_n(K;ℤ/p^ν) → K_n^ét(K;ℤ/p^ν) and prove it is an isomorphism for n ≥ 1. Specify the étale object by the Thomason–Godement construction over finite Galois subextensions L/K, whose terms are K(L;ℤ/p^ν)^(hGal(L/K)). Its descent spectral sequence has E²_(s,t) = H^(−s)(K, colim_L K_t(L;ℤ/p^ν)). Require the separably closed coefficient calculation: even t ≥ 0 gives μ_(p^ν)^(⊗t/2), and odd t gives zero. The trace identifies this spectral sequence with the logarithmic TC comparison of §5.15. Do not assert that an arbitrary presheaf's homotopy fixed points satisfy descent without the sheafification and convergence argument (HM03 construction(6.1.8), spectral sequence(6.1.9), Theorem6.1.10 pp.102–104). *Needs:* §5.15, the foundational étale sheafification construction and the separably closed coefficient theorem.

Prove for finite L/ℚₚ and every p, including two,

```text
etaleEdgeOne : K_(2i−1)(L;ℤ/p^ν) ≃ H¹(L,ℤ/p^ν(i)),
0 → H²(L,ℤ/p^ν(i+1)) → K_(2i)(L;ℤ/p^ν)
  → H⁰(L,ℤ/p^ν(i)) → 0,                         i ≥ 1.
```

The right edge is restriction to the separable closure followed by its Bott identification. Its composite with K_(2i)(L)/p^ν is zero. At odd p, Layer 5 also proves the comparison for the larger perfect-residue mixed-characteristic scope and gives a natural mod-p even splitting. At odd p retain the natural exact sequence, abstractly split, for higher coefficients; a coherent natural splitting is a separate proof obligation. At p = 2 assert only the exact sequence, with no splitting. Use the motivic descent argument for finite p-adic fields, not the odd-prime Tate calculation (Handbook Theorem61 and proof p.165; HM03 TheoremA p.2 and Theorem6.1.10 pp.103–104; K-book ExerciseVI.7.3 p.512).

Distinguish this edge operation from the ordinary higher Chern class c_(i,1). Fix the finite-field normalization by `chern_edge_finiteField`: c_(i,1)=(−1)^(i−1)(i−1)!·etaleEdgeOne. With a primitive coefficient root ζ, normalize the edge of [ζ]β_ζ^(i−1) as κ(ζ)⊗ζ^(⊗(i−1)); then c_(i,1) has the displayed multiplier, with no unspecified choice of sign. For the early weight-two operation also require `chern_unit_bott`: c_(2,1)([a]β_ζ)=−κ(a)⊗ζ, including modulus two. These are the exact independent exports consumed in §1.11. Construct them from universal étale Chern classes and the Moore/Hurewicz comparison before applying any later regulator theory. The general comparison must retain its product and coefficient hypotheses; an ordinary Chern class is not an isomorphism in unrestricted characteristic (Handbook first étale Chern class p.153; WeibelChern Proposition5.1 p.24). The full later regulator is a downstream construction, not an input to this theorem. *Needs:* the foundational suppliers just listed, §§1.2,5.15,6.4–6.5, and cd_p(L) = 2.

**Checks.**

- At i = 1 the edge is the ordinary Kummer map, and c_(1,1) has multiplier +1. At i = 2 over 𝔽₇ with modulus three and ζ=2, c_(2,1)([2]β₂)=−κ(2)⊗2, the negative of the normalized edge. Since 2 is not a cube in 𝔽₇×, this nonzero order-three value detects the sign that mod-two tests cannot distinguish.
- At i = 3 with mod-2 coefficients, the factor 2! is zero. For 𝔽₃ the relevant K₅ mod 2 and H¹(𝔽₃,ℤ/2(3)) both have order two; an ordinary c_(3,1) with this normalization is zero, whereas the edge is an isomorphism. The same factorial obstruction prevents calling every local odd-degree isomorphism an ordinary Chern class.
- For ℚ₂ in degree two, K₂(ℚ₂;ℤ/2) ≃ ℤ/4, not (ℤ/2)²: naturality of the mod-two Bott class gives 2β₋₁ = red{−1,−1}, which is nonzero by its quadratic Hilbert symbol −1. Bockstein sends β₋₁ to −1. Thus the H² and H⁰ terms, each of order two, form a nonsplit extension (K-book IV.2.5.1–2.5.3 pp.280–281 and III.6.2.3–6.2.4 pp.233–234). Replacing the middle group by either H² alone or H²⊕H⁰ is false.
- For a finite field of characteristic p, an ℓ-adic edge with ℓ ≠ p is unramified Frobenius cohomology. This does not authorize an unramified description for p-adic coefficients at a place over p.

### 6.7 Completed groups and explicit small-prime values

Finite-level groups over L/ℚₚ are finite, so pass to inverse limits in §6.6. The H⁰ term has limit zero by §6.4. Obtain canonical cohomological identifications, and abstract module descriptions,

```text
K_(2i)(L;ℤₚ) ≃ H²(L,ℤₚ(i+1)) ≃ ℤ/w_i^(p),       i ≥ 1,
K_(2i−1)(L;ℤₚ) ≃ H¹(L,ℤₚ(i)) ≃ ℤₚ^d ⊕ ℤ/w_i^(p), i ≥ 2.
```

These are also the groups of V in degrees ≥ 2. The odd torsion identification with W_i^(p) is canonical; the free summand is not. For divisible coefficients obtain K_(2i)(L;ℚₚ/ℤₚ) ≃ W_i^(p), i ≥ 1, and K_(2i−1)(L;ℚₚ/ℤₚ) ≃ (ℚₚ/ℤₚ)^d⊕ℤ/w_(i−1)^(p), i ≥ 2. Derive the latter from coefficient colimits or the universal-coefficient sequence, with the coefficient inclusion maps retained (K-book VI.7.4 and CorollaryVI.7.4.1 pp.509–510; Handbook Theorem61 p.165).

Evaluate over ℚ₂: K₂ completed = ℤ/2, K₃ = ℤ₂⊕ℤ/8, K₄ = ℤ/8, K₅ = ℤ₂⊕ℤ/2. Over ℚ₃: K₂ completed = 0, K₃ = ℤ₃⊕ℤ/3, K₄ = ℤ/3, K₁₁ = ℤ₃⊕ℤ/9. Over ℚₚ, p ≥ 5, K₃ completed = ℤₚ; for every odd p, K_(2p−3) completed = ℤₚ⊕ℤ/p. For unramified L, completed K₃ is ℤₚ^d plus torsion of order 8,3,1 at p = 2,3,≥5. For ramified L such as ℚₚ(ζₚ), p-primary K₃ torsion can occur for every odd p. *Needs:* §§6.2–6.6.

**Checks.**

- K₃ at two has order-eight torsion, not order two.
- A formula replacing w_i^(p) by w_i would wrongly retain prime-to-p torsion under p-completion.
- The ordinary integral groups are uncountable by §6.10, despite the finite generation over ℤₚ of these completed groups.
- The i = 1 odd formula has rank d+1 and is deliberately outside the rank-d display.

### 6.8 Integral groups, divisible ranks and lattices

For i ≥ 2, identify the torsion subgroup of K_(2i−1)(L) with ℤ/w_i(L), with its e-invariant an isomorphism to W_i(L). The torsion-free quotient T_i is a ℤ_(p)-module. Prove the abstract splitting K_(2i−1)(L) ≃ T_i⊕ℤ/w_i(L); keep the torsion subgroup canonical and the complement noncanonical. The identification of the p-part of this torsion with W_i^(p) must agree with the connecting map in H¹ of §6.4 (K-book PropositionVI.7.3(a) p.509; Handbook Theorem61 p.165).

For i ≥ 1 put D_i = Div(K_(2i)(L)). Prove first that the integral Bockstein filtration agrees with the étale filtration: K_(2i)(L)/p^ν maps isomorphically onto H²(L,ℤ/p^ν(i+1)) in §6.6, and its quotient K_(2i−1)(L)[p^ν] maps isomorphically onto H⁰(L,ℤ/p^ν(i)). In particular K_(2i)(L)/p^ν is cyclic of order gcd(p^ν,w_i^(p)). This identifies the actual integral image and torsion quotient, beyond the abstract order of the finite-coefficient group (K-book proof of PropositionVI.7.3 p.509, using VI.4.5(ii) p.483). Then establish

```text
D_i = w_i(L)K_(2i)(L) = ⋂_(m≥1)mK_(2i)(L),
K_(2i)(L) ≃ D_i ⊕ ℤ/w_i(L),
K_(2i)(V) ≃ D_i ⊕ ℤ/w_i^(p)(L),
D_i ≃ ℚ^(κ_i) ⊕ (ℚₚ/ℤₚ)^(λ_i),       λ_i ≤ d.
```

D_i is a divisible ℤ_(p)-module; unique divisibility holds exactly when λ_i = 0. For i = 1 Moore's theorem identifies D₁ = U(L) and λ₁ = 0. No vanishing assertion for the unknown higher λ_i is needed here (K-book PropositionVI.7.3(b) p.509 and WarningVI.7.5 p.510).

Use §6.2 to identify T_pK_(2i)(L) = T_pD_i ≃ ℤₚ^(λ_i). With t_i = dim_(𝔽p)T_i/pT_i, prove

```text
0 → lim_ν K_(2i−1)(L)/p^ν → K_(2i−1)(L;ℤₚ)
  → T_pD_(i−1) → 0,
t_i + λ_(i−1) = d,      i ≥ 2.
```

After a torsion splitting, the left term is T_i^∧⊕ℤ/w_i^(p), not generally T_i⊗ℤₚ. In particular t₂ = d. Derive the finite-level odd group, for i ≥ 2,

```text
K_(2i−1)(L;ℤ/p^ν) ≃ (ℤ/p^ν)^d
  ⊕ ℤ/gcd(p^ν,w_i^(p)) ⊕ ℤ/gcd(p^ν,w_(i−1)^(p)).
```

Both adjacent w-invariants bound the stable range; ν large relative only to w_i is insufficient (K-book RemarkVI.7.3.1 p.509 and CorollaryVI.7.4.1 p.510; Handbook p.165).

Finally find P ≃ ℤ_(p)^d in K₃(V) = K₃(L), meeting torsion trivially, whose completion maps isomorphically to the free quotient of completed K₃. Write T₂ = Div(T₂)⊕R, with P ⊂ R and R/P a ℚ-vector space. This does not prove R = P⊕(R/P). An injective divisible kernel splits; a divisible quotient need not split (Handbook Corollary63 p.166; K-book CorollaryVI.7.4.2 and WarningVI.7.5 p.510). *Needs:* §§2.3,2.5,3.5,6.1–6.7 and the e-invariant detection theorem.

**Checks.**

- At i = 1 the even torsion of V is the wild p-primary factor, which can be nonzero.
- For ℚ₂, i = 2, ν = 1 the odd finite-coefficient group has three order-two factors: one free reduction and two adjacent torsion contributions.
- For ℚ₃, i = 3, the w₂ contribution survives even though w₃^(3) = 1.
- The rank identity at i = 2 uses λ₁ = 0; extending t_i = d to every i would assume the vanishing of all higher divisible p-ranks.

### 6.9 What the integral completion map retains

For even degree, identify the completion map with the projection of K_(2i)(L)/D_i ≃ ℤ/w_i(L) onto its p-primary part. It is onto, with

```text
ker κ = w_i^(p)K_(2i)(L) = D_i ⊕ K_(2i)(L){p′}.
```

On p-primary torsion its kernel is precisely D_i{p}; on the cohomological target it is the isomorphism of §6.7. For odd degree i ≥ 2, prove

```text
ker κ = Div(K_(2i−1)(L)) ⊕ K_(2i−1)(L){p′},
0 → T_i^∧/image(T_i) → coker κ → T_pD_(i−1) → 0.
```

The first kernel summand is a ℚ-vector space. The first cokernel term is a ℚ-vector space. The image is dense in the closed subgroup lim K_(2i−1)(L)/p^ν inside the completed group; it is dense in the whole completed group exactly when λ_(i−1) = 0. On p-primary torsion κ is an isomorphism onto the torsion of H¹(L,ℤₚ(i)). Record all these kernels and cokernels when using integral classes to define a regulator; an isomorphism after p-completion cannot recover the invisible divisible classes (K-book VI.7.4 proof and WarningVI.7.5 p.510; Handbook Warning60 p.164 and Remark62 p.165). *Needs:* §§6.1–6.2,6.7–6.8.

**Checks.**

- For even degree the prime-to-p residue factor has order q^i−1 and is killed, while any divisible p-primary factor is also killed.
- In odd degree the finite p-primary torsion survives injectively.
- For K₃ the image is dense by λ₁ = 0; density is weaker than surjectivity and does not supply a lattice splitting.
- A rank-d completed group alone does not determine t_i and λ_(i−1) separately.

### 6.10 Uncountability and the Milnor summand

Prove an independent positive-characteristic cardinality argument. For finite k, E = k((t)) is uncountable, while an algebraic extension of a rational function field on a countable set over k is countable. Thus any transcendence basis B of E/k is uncountable. Put F = k(B). Fix distinct a₁,…,a_r ∈ B, r ≥ 0. Iterated discrete residues, in the last-slot normalization, define integer-valued maps on K^M_(r+1)(F) that separate the symbols {a₁,…,a_r,b_j}, j ∈ B∖{a₁,…,a_r}. Specify the order of the valuations so that each matching symbol has residue +1. If an integral relation becomes zero over E, its finite presentation descends to a finite intermediate extension F⊂L⊂E. Transfer back to F multiplies it by [L:F], with no separability assumption. Applying the separating maps proves every coefficient zero. Hence algebraic Milnor K_n(E) contains an uncountable independent family for every n ≥ 1. This uses actual Milnor K-theory, not its topological quotient (K-book III.7.3 p.246, III.7.5.3 p.248, and III.7.6.1 discussion p.249).

For either kind of local field, prove K^M_n(E) is uniquely divisible for n ≥ 3 using norm-residue comparison, local cohomological dimension and the separate torsion/divisibility theorem. The positive-characteristic vanishing of ordinary forms in degree ≥ 2 does not prove uncountability; the preceding residue argument supplies that missing step. Use the comparison K^M_n→K_n and its reverse map with composite (−1)^(n−1)(n−1)! to get a retraction after dividing in K^M_n. Its image lies in K_n(V), since the finite residue K-group cannot receive a nonzero map from a divisible group. Together with the uncountable Moore kernel for n = 2, conclude K_n(E) and K_n(V) are uncountable and not finitely generated for all n ≥ 2 (K-book PropositionVI.7.1 pp.507–508 and LemmaV.11.13 p.458; Handbook §5.6 p.163). *Needs:* the supplied Milnor residues, arbitrary finite-extension transfer, filtered-colimit compatibility, norm-residue/divisibility theorems, and Milnor–Quillen comparison.

**Checks.**

- At r = 0 the symbols are units and the separating map is an ordinary valuation.
- A purely inseparable intermediate extension still has positive integer degree, so multiplication by that degree detects the integer residues.
- The proof gives uncountability even though Ω²_(k((t))) = 0.
- Tensoring a finite-rank completed group with ℚₚ does not contradict the uncountable rational summand in integral K-theory.

### 6.11 Equal characteristic: de Rham–Witt and the integral answer

Let V = 𝔽_q[[t]], E = 𝔽_q((t)), I = (t). From the p-basis of size one, prove WₙΩ^j_V = WₙΩ^j_E = 0 for j ≥ 2. On the relative infinite de Rham–Witt groups, prove 1−F is onto and its kernel is the big de Rham–Witt group 𝕎Ω^(j−1)_(𝔽q) = ∏_(p∤r,r≥1) WΩ^(j−1)_(𝔽q). It is nonzero only at j = 1, where it is ∏_(p∤r)W(𝔽_q) (GH06 TheoremB p.3, Proposition2.8 p.16 and end of §2 p.18).

Use GH06 Theorem3.1 p.19: for a regular local 𝔽ₚ-algebra A, the trace identifies K_j(A;ℤₚ) with ker(1−F:WΩ^j_A→WΩ^j_A). Its relative A[[t]] version requires A finite over A^p. For V the coefficient-field splitting gives K(V) ≃ K(𝔽_q)∨K(V,I), and

```text
K_j(V,I;ℤₚ) ≃ 𝕎Ω^(j−1)_(𝔽q),
K₁(V;ℤₚ) ≃ U₁ = 1+t𝔽_q[[t]],
K₁(E;ℤₚ) ≃ U₁×ℤₚ,
K_j(V;ℤₚ) = K_j(E;ℤₚ) = 0,                   j ≥ 2.
```

Prove finite-coefficient vanishing for j ≥ 2 as well, either from the same comparison and coefficient sequence or from CMM Theorem6.5 pp.52–53 with p-dimension one. Deduce unique p-divisibility in degrees ≥ 2 and absence of p-torsion in degrees ≥ 1. Combine prime-to-p rigidity, Layer 2 localization and the uncountability of §6.10 to obtain, for n ≥ 2,

```text
K_n(V) ≃ K_n(𝔽_q) ⊕ U_n,
K_n(E) ≃ K_n(V) ⊕ K_(n−1)(𝔽_q),
U_n = ker(K_n(V)→K_n(𝔽_q)) uniquely divisible and uncountable.
```

The coefficient field fixes the first splitting; Layer 2 gives the canonical integral high-degree localization splitting. Thus K_(2i)(E) ≃ U_(2i)⊕ℤ/(q^i−1), and K_(2i+1)(E) ≃ U_(2i+1)⊕ℤ/(q^(i+1)−1), i ≥ 1; Div(K_n(E)) = U_n. For p ∤ m the coefficient groups split into the two finite-field terms; for p^ν they vanish above degree one. This is the equal-characteristic integral answer, not a zero integral group (K-book TheoremVI.7.2 p.508; Handbook Theorem56 pp.162–163). *Needs:* §§1.9,2.1–2.3,5.17,6.5,6.10 and the regular-local characteristic-p trace theorem.

**Checks.**

- For 𝔽₂((t)), integral K₂ is uniquely divisible and uncountable, though every mod-2^ν K₂ vanishes.
- For 𝔽₃((t)), K₂ has a residual order-two summand, and K₃ an order-eight summand.
- In degree one U₁ is nonzero and multiplication by p is injective but not onto; the high-degree unique-divisibility claim cannot include it.
- The product over p-prime indices is required to recover all principal units, not just one copy of W(𝔽_q).

### 6.12 The odd-prime homotopy type

For finite L/ℚₚ, p odd, put r = [L(ζₚ):L], p^a = #μ_(p^∞)(L(ζₚ)), choose a topological generator g of ℤₚˣ, and set k = g^(p^(a−1)(p−1)/r). With the p-adic Adams operation, let FΨ^k be the fibre of Ψ^k−1:ℤ×BU→BU after p-completion. Prove the space equivalences

```text
(ℤ×BGL(L)⁺)^∧_p ≃ FΨ^k × BFΨ^k × U^d,
(ℤ×BGL(V)⁺)^∧_p ≃ FΨ^k × BFΨ^k × U^(d−1) × SU.
```

Here U, SU and BU denote their p-completed stable complex unitary spaces, and BFΨ is the delooping supplied by the infinite-loop structure. This fibre includes virtual rank; its component group is ℤₚ. It is not the connected finite-field fibre from Layer 1. Its positive odd homotopy is ℤₚ/(k^i−1), with order w_i^(p)(L). Prove the equivalence at the space level, with the required p-adic Adams-operation and splitting input, rather than inferring it from equality of homotopy groups (HM03 TheoremD p.6; K-book TheoremVI.7.9 p.511; Handbook Theorem67 p.167). *Needs:* §6.7, p-complete complex K-theory and p-adic Adams operations. **Gap:** the cited statements identify the answer, but the space-level splitting proof has not been resolved into prior targets; the homotopy splitting theorem is not an independent supplied prerequisite.

**Checks.**

- For d = 1 the exponent U^(d−1) is zero.
- The valuation-ring factor SU removes the degree-one valuation contribution.
- The π₀ of the completed left side is ℤₚ, not zero.
- No claim at p = 2 follows from choosing a generator of ℤ₂ˣ, since that group is not procyclic.

### 6.13 Dyadic hermitian rigidity and homotopy fixed points

For finite L/ℚ₂ and its valuation ring V, import the genuine hermitian K/GW/L spectra and their shifted Poincaré structures from the supplier above. Prove that the comparison GW(−;(Qˢ)[m])→K(−;(Qˢ)[m])^(hC₂) of full spectra is a 2-adic equivalence for L and V, for every integer shift m. Use the dyadic valuation localization sequence to prove the relevant L-theory spectrum of V is derived 2-complete, using finite exponent of its Witt groups. Apply the supplied cartesian fundamental comparison square Ξ to deduce the integral equivalence GW(V)≃K(V)^(hC₂) as full spectra in every specified symmetric Poincaré shift. The completeness step concerns L-theory; it cannot be replaced by the false claim that integral K(V) is 2-complete. Nor does the resulting integral assertion for V automatically give an integral assertion for L (Calmès et al. III Theorem3.1.1 p.49, Proposition3.1.4 pp.50–51 and Remark3.1.10 pp.52–53). *Needs:* the generic hermitian fibre/Tate square, local quadratic-form classification supplied by QuadraticFormInvariants, GeometryOfNumbersAndQuadraticArithmetic §6.10’s finite-even-field comparison, and the finite-vcd₂ homotopy-limit theorem with its shift transport. The ordinary étale K-comparison of §6.6 alone does not imply the hermitian comparison.

**Checks.**

- At V = ℤ₂ reduction has characteristic two, so an argument that assumes 2 ∈ Vˣ is unavailable.
- Shifting the Poincaré structure changes the duality convention and must commute with comparison.
- After 2-completion both L and V satisfy the theorem; the integral conclusion above is asserted for V with its L-theory completeness proof.
- Uncountable uniquely divisible integral K-groups from §6.10 are consistent with a 2-adic comparison and forbid calling integral K(V) itself derived complete.

### Examples

Compute the displayed completed groups for ℚ₂, ℚ₃, an unramified quadratic extension and ℚ₅(ζ₅); compare their integral torsion and completion kernels. For E = 𝔽₃((t)), retain the order-two K₂ quotient and the uncountable divisible kernel even though completed K₂ is zero. Use T = ℤₚ as an elementary model of a dense integral image with a nontrivial rational cokernel. These examples distinguish integral, finite-coefficient, ordinary-completed and derived-completed information.

### Dependencies

Layers 1–5, LocalFields, ClassFieldTheory and the finite local-Galois cohomology interfaces; the supplied generic Tate module; foundational motivic and étale comparison, with norm-residue theory; Milnor K-theory and its transfer/residue/comparison theorems; de Rham–Witt and regular-local trace theory; p-adic Adams operations; and the generic hermitian/Poincaré package. The later arithmetic regulator and global arithmetic K-group classifications consume this layer.

## Layer 7: completion maps for arithmetic applications

### 7.1 Arithmetic completion maps

For a number field F, finite place v, completion F_v and integer ring O_v, define `completionMap v` by extension of scalars from F to F_v on projectives and hence on K-theory. Give its integral-ring and localized-ring versions O_F→O_v and (O_F)_v→O_v, finite-coefficient versions and completed versions. Its API is the rank identity, actual field embedding on K₁, preservation of products and symbols, Bockstein and coefficient-map compatibility, and compatibility with the integer-ring maps. Use the pinned completion ring maps and residue-field equivalence; do not choose a field isomorphism merely because the residue cardinalities agree (K-book V.6.8.2 p.413; Handbook Example65 p.166).

**Checks.**

- On K₀(F) = ℤ, `completionMap` is the identity, not multiplication by a local degree. Transfer has the degree multiplier instead.
- For F = ℚ, v = 5, the unit 2 maps to the 5-adic unit 2 and 10 has valuation one. A residue-only map would lose the latter information.
- Symbols commute with completion: {−1,−1} maps to a nonzero order-two class in K₂(ℚ₂) and to zero in K₂(ℚ₃), as detected by the corresponding Hilbert symbols. Thus completion is not generally injective on K₂, although F×→F_v× is injective on K₁.
- A class coming from K_n(O_F) maps through K_n(O_v), including before changing coefficients.

### 7.2 Restriction, transfer and local boundaries

For E/F finite and w | v, prove c_w res_(E/F) = res_(E_w/F_v)c_v. For transfer prove

```text
c_v Tr_(E/F) = Σ_(w|v) Tr_(E_w/F_v)c_w.
```

Use F_v⊗_F E ≃ ∏_(w|v)E_w, finite-product preservation and flat base change for restriction of scalars; retain the sum over all places. The same compatibility holds on integer rings, finite coefficients and completed spectra (K-book IV.6.3.3 p.320 and TheoremV.3.7.2 p.390). *Needs:* §7.1 and the exact scalar-extension/decomposition supplier contracts.

For a Dedekind domain R and nonzero prime 𝔭, show the 𝔭-component of its global localization boundary is the boundary for R_𝔭. Localization of torsion modules is projection onto that residue summand under dévissage. For a DVR R and completion R̂, show the map of localization sequences is the identity on K(k), after identifying the two residue fields. Deduce the homotopy-cartesian square with rows K(R)→K(R̂) and K(F)→K(F̂), its Mayer–Vietoris sequence, and ∂̂c = ∂, integrally and with finite or completed coefficients. This is the DVR application of general Karoubi patching; the general theorem remains a foundational supplier (K-book V.6.6.1 p.409 and PropositionV.7.5/ExampleV.7.5.1 p.424). It follows that ∂_v = ∂̂_v c_v for number fields and S-integers at v ∉ S, and ker c_v ⊆ ker ∂_v. *Needs:* §2.2, exact dévissage, flat completion and coherent localization.

**Checks.**

- On K₀ the transfer identity is [E:F] = Σ_(w|v)[E_w:F_v]; on K₁ it is the product of local norms.
- For x of v-valuation r the two degree-one boundaries both give r, not er after an identity completion.
- For {2,5} at v = 5 the left-linear tame boundary is 2, while the reversed symbol has boundary 3.
- The cartesian square supplies a relative comparison; it does not assert K(R)≃K(R̂) integrally.

### 7.3 Hilbert symbols after completion

Put w_v = #μ(F_v) and h_v = h_(F_v)c_v:K₂(F)→μ(F_v). Prove h_v{a,b} = (a,b)_(F_v,w_v). For μ_m ⊂ F, identify its m-symbol with h_v^(w_v/m), with the target inclusion μ_m(F)≃μ_m(F_v) understood only for this m. On torsion classes x ∈ K₂(F), prove c_v(x) = 0 exactly when h_v(x) = 1: the intersection of the local uniquely divisible kernel with torsion is zero. For d | #k(v)−1, identify the d-symbol as the negative (#k(v)−1)/d power of the Teichmüller lift of ∂_v. These compatibilities are the interface with global reciprocity and wild kernels; no global kernel theorem is assumed here (K-book III.6.2.4 p.233 and V.6.8.2 p.413; the sign conversion is §3.2). *Needs:* §§3.1–3.5,7.1–7.2 and the global Hilbert-symbol supplier.

**Checks.**

- Over ℚ₅ the symbols (5,2)₄ and (2,5)₄ are respectively 2 and 3 in μ₄ after the chosen residue identification.
- For torsion {−1,−1}, the dyadic detection is nontrivial, while odd local symbols vanish.
- A nonzero element of the local divisible kernel is not detected by h_v; the torsion hypothesis in the kernel criterion is essential.

### 7.4 Étale operations and unramified classes

Prove naturality under completion for the early edge of §6.6 and for the ordinary finite-coefficient étale Chern operations, keeping their factorial relation. On cohomology the map is pullback along Spec F_v→Spec F, equivalently restriction to a decomposition group after choosing a place above v; conjugation makes the resulting cohomology map independent of that choice. At degree one this is Kummer naturality. Pass to continuous coefficients only with the limit comparison already established (K-book DefinitionV.11.5 p.454 and ExampleV.11.10 p.456; Handbook §5.4 p.153).

For m invertible at v and x in the image of K_n(O_F[1/m];ℤ/m), show its local Chern class is unramified and equals the inflation of the finite-field Chern class of its reduction. Use henselian rigidity both for K-theory and for étale cohomology, and specify j = 2i−n ≥ 0; for negative j the target is zero. At n = 3,i = 2 this gives the weight-two local class used in the Bloch-unit application, without assuming the analogous statement at v | m (CGZ §4.1, Lemma4.1 and its proof p.22). *Needs:* §§1.8,2.1,6.6,7.1–7.2, henselian étale rigidity and the supplied Chern naturality theorem.

**Checks.**

- Kummer sends a global unit a to the class of its actual local image.
- At v ∤ m, an integral class reduces through K_n(k(v);ℤ/m); at v | m the same argument is unavailable.
- The weight-two operation has factorial 1, whereas weight three at m = 2 need not be an isomorphism.
- Unramifiedness concerns the local cohomology class, not the assertion that every class of K_n(F_v;ℤ/m) comes from O_v.

### 7.5 Cyclotomic trace and arithmetic completion

Use naturality of the ordinary cyclotomic trace under O_F→O_v to compare K(O_F)→TC(O_F;p) with K(O_v)→TC(O_v;p). Compose the latter with the logarithmic localization map of §4.8. Prove this equals K(O_F)→K(F)→K(F_v)→TC(O_v|F_v;p), including the specified homotopy of the square. For odd residue characteristic, with ℤ/p^ν coefficients and degree ≥ 1, the last local trace is the isomorphism from §5.15. This computes the local target without identifying TC(F_v) with the logarithmic TC object (HM03 Introduction pp.2–3 and Theorem6.1.10 pp.103–104). *Needs:* §§4.6–4.8,5.15,7.1–7.2 and trace naturality as a map of localization sequences.

**Checks.**

- The two composites on a projective O_F-module agree after scalar extension.
- The square commutes with the residue boundary, including its left-linear normalization.
- In degree zero the positive-degree local trace theorem cannot be used.
- At p = 2, the odd-prime proof does not furnish this particular trace isomorphism even though §6.6 gives the arithmetic étale comparison by another route.

### 7.6 The semilocal completed map above p

Define `semilocalCompletion F p` in degree n as

```text
λ_(F,p):K_n(F) → ∏_(v|p) K_n(F_v;ℤₚ),
x ↦ (κ_v(c_v(x)))_v.
```

Its API is the component formula, the description by F→F⊗_ℚℚₚ≃∏_(v|p)F_v, compatibility with finite and completed coefficients, products and Bocksteins, and the restriction/transfer formulas induced from §7.2. Finite products commute with both K-theory and completion; no infinite-product assertion is needed. In degree three this is the map used before the p-adic regulator on the semilocal algebra (K-book ExampleVI.7.8 p.511; Handbook Example65 p.166).

**Checks.**

- For F = ℚ there is one factor, and the map is ordinary completion followed by coefficient completion.
- For F = ℚ(i), p = 5 there are two factors. The global element 2+i has valuations 1 and 0, in some order, because its norm is 5 and the two residue values are 0 and 4. Omitting either factor breaks the norm identity.
- On K₀ the output is the diagonal rank tuple; transfer back to ℚ multiplies each factor by its local degree and sums.
- In K₁, the order-two element −1 vanishes after 5-completion. This tests that the last κ is part of λ, rather than an integral tuple of local classes.
- For a finite E/F, the v-component of λ_(F,p)Tr is the sum over w | v of local transfers of λ_(E,p), including at ramified places.

### Examples

Follow {2,5} from K₂(ℚ) to its tame boundary and norm-residue value at five, then compare {−1,−1} at two and three. Follow a weight-two integral class at a prime away from its coefficient modulus through rigidity to the finite-field Chern class. For ℚ(i) at five, compute both K₁ components before and after coefficient completion and verify their local-norm product. These examples test the maps, not just the abstract groups.

### Dependencies

Layers 1–6, number-field completion and semilocal tensor decomposition, flat K-theory base change, local and global reciprocity interfaces, henselian étale rigidity, and naturality of trace/Chern/edge operations. ArithmeticKTheory owns global localization, global wild-kernel structure and finiteness; this layer supplies their local maps.

## Downstream consumers

ArithmeticKTheory uses the finite residue groups, transfer normalization, integral local torsion/divisibility, and completion maps in its localization and wild-kernel arguments. Its generic w-invariants remain with their arithmetic owner. K3BlochGroups uses the finite-field K₃ group and its compatible local weight-two edge, while HabiroNumberFields uses the prime-to-residue-characteristic reduction square. HabiroRings supplies the big Witt carrier used here and receives the relative truncated-polynomial calculations.

PadicHodgeRegulators uses completed K₃ of unramified local factors and the semilocal map λ_(F,p), with the p = 2,3 torsion retained. It constructs the later regulator and its analytic/de Rham comparison. MotivicEtaleKTheory and the hermitian roadmap may consume the early edge and the local/finite-field comparisons established here; this does not reverse the dependency on their general foundational objects. Profinite arithmetic applications may use the Tate-module comparison but must distinguish the integral completion kernel from the full divisible subgroup.

## References

All descriptions and theorem formulations above are in this roadmap's own words. The linked versions fix the numbering used here; online author files were accessed on 19 October 2026.

- **K-book:** Charles Weibel, *The K-book: An Introduction to Algebraic K-theory*, author draft dated 29 August 2013, [public author PDF](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf). Main local references: III.6.2.4 pp.233–234; IV.1 and IV.2 pp.269–284; V.7.5 p.424; VI.2.2–2.3 pp.470–471; VI.7 pp.507–512. PDF pages are printed pages plus eight. The [archived errata](https://web.archive.org/web/20191110143141id_/https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf), p.2, correct the prime-to-residue-characteristic restriction on the K₂ integer-ring torsion statement.
- **Handbook:** Charles Weibel, “Algebraic K-theory of rings of integers in local and global fields,” *Handbook of K-theory*, Chapter I.5, pp.139–190, [published chapter](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/KZsurvey-published.pdf). Relevant §§5.4–5.6, especially pp.153,162–167; PDF p.1 is printed p.139.
- **Haine:** Peter Haine, *On the K-theory of finite fields*, 25 September 2016, [notes](https://math.berkeley.edu/~phaine/files/KFF.pdf), Theorem3.1 pp.4–5, Definition5.7 and Theorem5.8 p.9, §§6.3–6.11 pp.10–11. These give the finite-field/Brauer proof route, with the foundational comparison inputs stated separately above.
- **Mestel:** David Mestel, *Algebraic K-theory of finite fields*, 2014, [essay](https://www.cs.ox.ac.uk/people/david.mestel/essay.pdf), §§4–9 pp.9–30, especially Theorems14–15,19–20,35,37–38. It supplies additional details of the cohomological comparison and its spectral-sequence inputs.
- **Atiyah–Segal:** Michael Atiyah and Graeme Segal, “Equivariant K-theory and completion,” *J. Differential Geometry* 3 (1969), 1–18, [public scan](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/atiyahsegal1.pdf), Theorem2.1 pp.3–4 and Proposition4.2 p.10. Used as the completion input in the Brauer construction.
- **CMM:** Dustin Clausen, Akhil Mathew and Matthew Morrow, *K-theory and topological cyclic homology of henselian pairs*, arXiv:1803.10897v2, 20 July 2020, [versioned PDF](https://arxiv.org/pdf/1803.10897v2), Theorem1.4 p.3, Theorem4.29 p.33, Corollary4.36/Remark4.37 pp.36–37 and Theorems6.5–6.6 pp.52–53. The source's original arXiv year is not its version date.
- **Fesenko:** Ivan Fesenko, “Topological Milnor K-groups of higher local fields,” *Geometry & Topology Monographs* 3 (2000), 61–74, [public chapter](https://msp.org/gtm/2000/03/gtm-2000-03-006p.pdf), §§6.0–6.1 pp.61–62. Used only with the distinction between algebraic and topological Milnor groups retained.
- **Sharifi:** Romyar Sharifi, *Algebraic Number Theory*, author notes dated 26 September 2026, [public notes](https://math.ucla.edu/~sharifi/notes/algnum.pdf), §§6.3–6.4 pp.130–133 and Definition9.3.2/Proposition9.3.4/Theorem9.3.8 pp.195–198. His Hilbert inputs are reversed relative to this roadmap's reciprocity convention.
- **HM97a:** Lars Hesselholt and Ib Madsen, “On the K-theory of finite algebras over Witt vectors of perfect fields,” *Topology* 36 (1997), 29–101, [author PDF](https://www.math.nagoya-u.ac.jp/~larsh/papers/004/paper.pdf), introductory TheoremsA–F pp.i–iv (PDF1–4); §§2.3,3.1,4.2–4.5,5.1,6.1 and AppendixB for the classical trace and Tate machinery. Locators in the body use the author PDF's own numbering.
- **HM97b:** Lars Hesselholt and Ib Madsen, “Cyclic polytopes and the K-theory of truncated polynomial algebras,” [author PDF](https://www.math.nagoya-u.ac.jp/~larsh/papers/007/polytope.pdf), TheoremsA–B pp.74–75 (PDF2–3) and Theorem4.2.10 p.95 (PDF23). Used for the representation-sphere/cyclic-polytope calculation and integral relative groups.
- **HM03:** Lars Hesselholt and Ib Madsen, “On the K-theory of local fields,” *Annals of Mathematics* 158 (2003), 1–113, [arXiv:math/9910186v2](https://arxiv.org/pdf/math/9910186v2), author version 22 January 2004. TheoremsA–D pp.1–7; §§2–3 pp.32–64; §§4.3–4.4 pp.65–74; §§5–6 pp.75–104; AppendixA pp.105–110. The individual numbered results are cited next to their uses.
- **HM04:** Lars Hesselholt and Ib Madsen, “On the de Rham–Witt complex in mixed characteristic,” [author PDF](https://www.math.nagoya-u.ac.jp/~larsh/papers/013/final.pdf), introductory TheoremsA–E and the following remark pp.1–3. TheoremD treats the nonlogarithmic complex; its extension to the universal prelog complex is the foundation gap stated above.
- **Hesselholt96:** Lars Hesselholt, “On the p-typical curves in Quillen's K-theory,” [author PDF](https://www.math.nagoya-u.ac.jp/~larsh/papers/005/acta.pdf), TheoremsB–C p.2, §1.2 p.5 and the Milnor-limit argument in the proof of Corollary2.4.7 p.24.
- **Hesselholt05:** Lars Hesselholt, “K-theory of truncated polynomial algebras,” handbook survey, [author PDF](https://www.math.nagoya-u.ac.jp/~larsh/papers/s01/handbook.pdf), §§3.5–3.13; all Hesselholt05 page locators denote PDF pages. Theorem5 is PDFp.17 (printed87), Proposition7 PDFp.22 (printed92), Proposition8 PDFp.24 (printed94), Lemma9 PDFp.26 (printed96), and Theorems10–11,13 PDFpp.28,30,33 (printed98,100,103).
- **GH06:** Thomas Geisser and Lars Hesselholt, “On the K-theory of complete regular local 𝔽ₚ-algebras,” [author PDF](https://www.math.nagoya-u.ac.jp/~larsh/papers/011/paper.pdf), TheoremsA–B pp.2–3, Proposition2.8 p.16, end of §2 p.18 and Theorem3.1 p.19. The numbered regular-local characteristic-p statements, rather than the filename, fix the results used here.
- **NS:** Thomas Nikolaus and Peter Scholze, “On topological cyclic homology,” *Acta Mathematica* 221 (2018), 203–409, [published PDF](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf). Classical/modern comparison: §§II.4 and IV.4, especially TheoremII.4.10 and CorollaryIV.4.8, PropositionIV.4.9 and CorollaryIV.4.10 pp.360–361, with the cyclotomic refinements pp.362–365. The [arXiv version](https://arxiv.org/pdf/1707.01799) has different PDF pagination.
- **Calmès et al. III:** Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus and Wolfgang Steimle, *Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings*, [arXiv:2009.07225v4](https://arxiv.org/pdf/2009.07225v4). Use §3.1 pp.49–53, R10, the shifted localization discussion in §1.3 and Corollary2.2.5 p.39. This source treats symmetric bilinear characteristic-two theory in its Poincaré convention.
- **Calmès et al. II:** the same authors, *Hermitian K-theory for stable ∞-categories II: Cobordism categories and additivity*, [author version accessed 19 October 2026](https://arxiv.org/pdf/2009.07224), Example1.2.5 pp.20–21 and Theorem4.4.11/Corollary4.4.13 pp.106–107. These are generic supplier results, including the fundamental cartesian square.
- **AV:** Amina Abdurrahman and Akshay Venkatesh, *Symplectic L-functions and symplectic Reidemeister torsion*, [arXiv:2303.13436v1](https://arxiv.org/pdf/2303.13436v1), and [author revision dated 6 October 2026](https://www.math.ias.edu/~akshay/research/RT.pdf), §2.7 pp.16–17 in both versions. Retain their 4r−1 degree range and coefficient exclusions in §1.11.
- **WeibelChern:** Charles Weibel, “Étale Chern classes at the prime 2,” [author PDF](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chernclass.pdf), §§1.5–1.6,2.1–2.8,3.3 and Proposition5.1 p.24. The factorial comparison is a warning about identifying ordinary higher Chern operations with an étale edge map.
- **CGZ:** Frank Calegari, Stavros Garoufalidis and Don Zagier, *Bloch groups, algebraic K-theory, units, and Nahm's conjecture*, [arXiv:1712.04887v3](https://arxiv.org/pdf/1712.04887v3), §4.1, Lemma4.1 and proof p.22. Used for the local weight-two reduction square, with its invertibility assumption retained.
