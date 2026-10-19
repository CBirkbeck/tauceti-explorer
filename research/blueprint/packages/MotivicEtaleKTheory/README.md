# Roadmap: motivic and étale methods for arithmetic K-theory

**Summary.** Build the comparison maps that connect algebraic K-theory, higher Chow groups, motivic cohomology and twisted Galois cohomology. The main results are the norm residue isomorphism, its logarithmic differential analogue in characteristic p, the motivic spectral sequence with its actual cycle layers and normalized character, and the arithmetic Quillen–Lichtenbaum comparisons, including the corrections at real places. The final layer supplies regulators and their compatibility with norms, local conditions and determinant lines. These are constructions and comparison theorems; conjectural special-value identities remain explicitly conditional statements about the resulting lines.

## Scope and ownership

This roadmap owns the arithmetic realization and comparison maps for finite, adic and divisible Galois Tate twists in the existing cohomology theories; Bloch's higher cycle complexes; finite correspondences and effective motives; the operations, norm varieties and Rost motives needed for norm residue; logarithmic differential symbols; the homotopy coniveau construction for K-theory; comparison with periodic étale K-theory; and the normalized higher Chern and regulator maps. The coefficient carriers, scheme K-theory, Milnor K-theory, ordinary Chow groups, generic spectral sequences and general determinant functors have their own owners.

In particular, the following boundaries are part of the build:

- ProfiniteCohomology supplies discrete continuous cohomology, change of groups, Kummer theory and cup products in all degrees. ArithmeticGaloisDuality supplies Tate-twist coefficients beyond the native carriers, compact coefficients, derived limits, arithmetic local/global duality and compact supports with Tate cohomology at real places. The present real restriction kernels and ordinary-real mapping fibres are different objects.
- K2SymbolsBrauer supplies the tensor/Steinberg presentation of Milnor K-theory in every degree, Matsumoto's theorem, norms, tame residues, and their comparison with Quillen transfers. It also owns the Brauer/Hilbert-symbol interpretation and the comparison of the degree-two Chern class with the Galois symbol. The cohomological Steinberg relation and the proof of Tate's K₂ comparison are here.
- SchemeKTheoryOperations supplies the K-spectrum of perfect complexes, localization, derived coefficients, scheme Adams operations, the full weighted gamma filtration and the ordinary K₀ Chern classes. GeneralizedCohomology supplies concrete spectra; StableHomotopyKTheory supplies exact couples and coefficient products; EnhancedDerivedSheaves supplies their sheaf and coherent-diagram framework. Neither an E₂ page nor an abstract group with that page defines the K-theory used here.
- SchemeAndStackFoundations supplies sites, dimensions, cycle pushforward, Picard groups, ordinary Chow groups and intersections. AlgebraicVectorBundles supplies vector bundles, their operations and projectivizations. Its discussion of successor characteristic classes does not supply higher Chow groups or the homotopy coniveau tower.
- MotivesAndAlgebraicCycles supplies geometric motives, Tate stabilization and the comparison between the Suslin and higher-cycle presentations. Its effective category and transfer input are the ones constructed here. The comparison is used only after the independent cycle and transfer constructions; it is not an input to their definitions.
- ArithmeticKTheory supplies arithmetic K-group finiteness and the invariant w_j(F). KTheoryFiniteLocalFields supplies henselian rigidity; GeneralAlgebraicKTheory supplies ordinary finite-field K-theory. K3BlochGroups consumes the weight-two edge map to identify indecomposable K₃; that identification is not an input to the weight-two cycle calculation.
- HodgeStructures supplies linear pure/mixed Hodge structures. Logarithmic Deligne–Beilinson complexes require its geometric successor, including compactification independence and semipurity. PadicHodgeTheory supplies period comparisons; PadicHodgeRegulators supplies the syntomic regulator and local exponential interfaces. SelmerIwasawaCohomology supplies the Selmer mapping fibre and local condition complexes. BorelRegulators owns the Borel comparison constants. PadicMeasuresIwasawaAlgebras, layer 5, supplies the graded determinant functor. Only their regulator adapters are constructed here.

The elliptic Tate module, its continuous Galois representation and its Weil pairing are already in Tau Ceti. No new elliptic Tate module or elementary Galois-cohomology theory is a target. Explicit class-group, signature or Euler-polynomial computations are hypotheses or examples, not a dependency on a computational number-theory roadmap.

## Conventions

Fields have a specified separable closure when a Galois action is written concretely; comparison maps are independent of that choice up to the canonical conjugacy identifications. Write G_F for the absolute Galois group. A finite coefficient modulus m is positive and invertible on the field or scheme in question. A prime ℓ is invertible wherever a prime-to-characteristic twist or étale comparison is used. Characteristic-p logarithmic forms belong to a separate construction.

Twist weight j is an integer for étale coefficients and nonnegative for effective motivic complexes. The twist pairing has no extra sign from its weights. Cohomological degree gives the cup sign. Algebraic K_n means the actual K-spectrum's homotopy group; K_n(X;Z/m) means the homotopy group of its coefficient cofibre, and need not equal K_n(X)/m. Completion means a derived inverse limit of spectra. Homological cycle degree n corresponds to motivic degree 2j−n in weight j.

For a DVR, fix the cohomological residue by ∂κ(π)=1. The Milnor residue supplied by K2SymbolsBrauer puts the uniformizer last: ∂^M{u₁,…,u_{n−1},π}={ū₁,…,ū_{n−1}}. Consequently the norm residue map satisfies ∂h_n=(−1)^{n−1}h_{n−1}∂^M. At n=2 the residue of κ(u)∪κ(π) is −κ(ū). The cubical differential below is Σ_i(−1)^i(∂ᵢ∞−∂ᵢ0). These conventions are retained through comparison roofs, rather than hidden in an unspecified sign.

For a number field F, S is finite and contains all archimedean places. Where ℓ-adic coefficients are used on R=O_{F,S}, S also contains the places above ℓ. Write r₁,r₂ for the numbers of real and complex places and s for the number of finite places in S. Ordinary cohomology at a real place, Tate cohomology there, and the kernel of real restriction always have distinct notation. A direct sum over all closed points is used with finite or discrete coefficients; compact coefficients require a finite set of removed points or a specified completed residue object.

## Exact supplier contracts

### From Mathlib and Tau Ceti

At Mathlib 082e2d3 and Tau Ceti f790474, use `KaehlerDifferential`, `KaehlerDifferential.D`, its universal property, `ExteriorPower`, tensor products, additive quotients, chain complexes and derived categories. In particular `KaehlerDifferential.D` is a derivation, and `KaehlerDifferential.map_D` specifies scalar-base change on generators. Tau Ceti's `KaehlerDifferential.mapSemilinear`, `mapSemilinear_D`, `mapSemilinear_smul` and `mapSemilinear_comp` supply pullback along an arbitrary algebra homomorphism, with semilinearity rather than an incorrect linearity over the source field. No ordinary differential module is reconstructed.

Use `TauCeti.KummerCoeff`, `TauCeti.kummerShortExact`, `TauCeti.kummerMap`, `TauCeti.kummerMap_eq_one_iff` and `TauCeti.kummerClassMap_injective` from `FieldTheory.GaloisCohomology`. Their coefficients have the actual action on roots in the separable closure. Surjectivity of the Kummer class map comes from ProfiniteCohomology's Hilbert 90 milestone. `TauCeti.ContCohomology.explicitCup11` and `explicitCup_projection11` fix the low-degree cup/projection convention; the all-degree supplier compares its maps with these. The generic continuous-cohomology and sheaf-cohomology carriers are reused, not replaced by quotient presentations specific to this roadmap.

Current Tau Ceti additionally supplies `WeierstrassCurve.tateModuleGaloisRepresentation`, its joint-continuity theorem, `WeierstrassCurve.finrank_tateModule`, and the modules in `AlgebraicGeometry.EllipticCurve.TateModule.{Basic,Galois,WeilPairing,Determinant}`. These provide the integral rank-two representation and its determinant; the regulator layer only fixes its variance and twists. Current `Geometry.Hodge.Tate` supplies the Hodge-side Tate objects. Mathlib’s `NumberField.Units.regulator`, `logEmbedding` and `regOfFamily_eq_det`, together with current Tau Ceti’s number-field unit regulator module, supply the weight-one real regulator; only its comparison with the higher regulator normalization is needed here. These current-library contracts do not assume that they are available in the older pinned Lean build.

Current `TauCeti.PadicTateTwist` in `RingTheory.RootsOfUnity.PadicTateTwist` already gives Z_ℓ(1), its projections, rank-one theorem, componentwise Galois representation, cyclotomic scalar formula and joint continuity. `TauCeti.ZModTwist` in `Topology.Algebra.Group.Profinite.ProP.ZModTwist` gives the finite coefficient module for any continuous ℓ-adic character, with `reduce`, `mulPow`, `shortExact`, their composition and commutation laws, surjectivity and injectivity. Apply it to the jth power of `TauCeti.continuousLocalCyclotomicCharacter`; the finite modulus is a separate level parameter, not the twist weight. `FieldTheory.Galois.AbsoluteGaloisGroup.Cyclotomic.Prescription` supplies the root-of-unity comparison in weight one. These native constructions, and `PrimeToPTateModule` for prime-to-characteristic roots, are imported. The comparison targets below identify them with sheaf-theoretic arithmetic coefficients and with the tensor/dual convention; they do not reconstruct their group actions or coefficient exact sequences. ArithmeticGaloisDuality's compact-coefficient layer supplies the remaining general tensor/dual and rational/divisible coefficient formalism.

### Cohomological and geometric suppliers

ProfiniteCohomology layers 3–9 compare explicit low-degree classes with the canonical theory and supply finite quotients, restriction, corestriction, Shapiro and Kummer theory. Layers 10–12 supply all degrees, cohomological dimension and cup products. The compact-coefficient section of ArithmeticGaloisDuality supplies the Milnor short exact sequence, rationalization and transfers for compact lattices; its arithmetic sections supply G_{F,S}, finiteness, Euler characteristic and Poitou–Tate duality. ClassFieldTheory layers 5 and 10 supply local invariants and global reciprocity. None of these general constructions is repeated as a milestone below.

SchemeAndStackFoundations layers 2 and 5 supply the field étale/Galois equivalence, cohomological Brauer group, ordinary cycles and Chow operations. EtaleDualityAndPerverseSheaves' coefficient layer supplies finite étale Tate-twist sheaves and purity in the regular prime-to-characteristic setting. ClassicalAdicEtaleCohomology's henselian comparison supplies finite locally constant coefficients over a henselian local ring. The new assertions concern compatibility with the particular twists and cycle maps, and the passage to continuous coefficient towers.

### K-theory and realization suppliers

SchemeKTheoryOperations' support/localization layers supply K(Y on W)=fib(K(Y)→K(Y\W)), Cartan comparison on regular schemes, projective bundle formulas and higher operations. Its operations and gamma layers supply the actual ψ^a and the weighted filtration, including products of gamma operations. GeneralizedCohomology G2 and G3.4,3.8–3.9 supply concrete spectra, Eilenberg–MacLane spectra, telescopes and derived completion. StableHomotopyKTheory 7.24–7.34 supplies filtered spectra, exact couples and Moore pairings. EnhancedDerivedSheaves' enhancement, Postnikov/descent, coherent-diagram and monoidal layers supply the compatible sheaf models, total fibres and derived coefficient triangles. These contracts must preserve connecting maps, not merely induce isomorphisms of graded groups.

DerivedDeRhamCohomology's ordinary de Rham and Cartier layers supply the differential, wedge, exact additive subgroups and inverse Cartier. CrystallineCohomology's ordinary and logarithmic de Rham–Witt layers supply the genuine sheaves W_rΩ^j_log, their restriction and Verschiebung coefficient sequences. TopologicalKTheory T4 and T7 supply complex and real Bott periodicity, BO/KO, complexification and the coefficient ring; GeneralizedCohomology G5.4 supplies its spectrum realization. Layer 11 computes the dyadic coefficient extension using those actual objects. ArithmeticKTheory's finiteness layer supplies finite generation of the relevant number-ring K-groups. PadicHodgeRegulators' étale–syntomic and local-exponential layers supply the regulator comparisons, with their exact good-reduction, semistable or de Rham hypotheses. Membership in a local H¹ condition does not supply a map of Selmer complexes.

GeneralAlgebraicKTheory 1.5,3.12,7.4–7.8,11.15–11.16 supplies plus/Q comparison, exact-category spectra, products and transfers; 13.8a–13.8c supplies the finite-field calculation. SchemeKTheoryOperations adds scheme supports. The positive DVR K₁ boundary is retained; higher Milnor/cohomological residues use the convention above. EnhancedDerivedSheaves E2.6–E2.7 and E5:spectra-comparison supplies coherent hyperdescent and its concrete/abstract spectrum comparison.

### Required quadratic and geometric extensions

The quadratic input to 6.4 has two parts. QuadraticFormInvariantsPartII Q2.1–Q2.2 specifies all-length roundness, isotropic Pfister hyperbolicity, the subform theorem and the Arason–Pfister dimension bound. A further **algebraic Pfister-symbol comparison** must identify isometry of n-fold forms ⊗〈1,−a_i〉 with equality of their pure symbols in K^M_n(F)/2, for every n≥1 and char F≠2, naturally under field extension. Its hyperbolic/zero-symbol corollary, together with roundness, identifies the neighbor's rational-point condition. This is the Elman–Lam chain-equivalence theorem, independent of norm residue. QuadraticFormInvariantsPartII Q2.3's cohomological invariant and its zero criterion use norm residue and cannot supply this input to that theorem's own proof. The algebraic chain-equivalence export is a supplier gap. (Elman–Lam, Theorem 2 and Corollary 1, p.972, with the proof outline pp.972–973.)

The geometric input to 12.2 is a **logarithmic Deligne–Beilinson supplier** for smooth quasiprojective complex varieties: the filtered logarithmic de Rham/Betti cone with coefficient inclusion Z(j)⊂C, its real smooth-form model D_log, pullback and conjugation, independence of a smooth SNC compactification, homotopy invariance, and support semipurity. For a closed Z of codimension at least p, the latter says H_D,Z^a(X,R(p))=0 for a<2p and H_D,Z^{2p}=⊕_W R[W] over the codimension-p components of Z. The comparison must preserve the Tate factor (2πi)^p, the product and support connecting maps. HodgeStructures supplies linear structures; the present HodgeStructuresPartII concerns connections and variations and does not supply this geometric contract. ComplexComparisonPartII C5.3,C5.5–C5.7 gives relevant Hodge and logarithmic de Rham inputs but not this Deligne support theory. This geometric export is a supplier gap, rather than an implicit consequence of linear mixed Hodge structures. (Burgos, Definition 10.1 and (10.2)–(10.5), pp.89–91; Burgos–Feliu, §§1.8–1.9, Definition 1.28 and (1.30), pp.10–11.)

## How to read the build

Layers 1–3 give the coefficient and weight-two arithmetic comparison, independently of the later all-weight proof. Layers 4–7 construct cycles, transfers, operations and the two norm residue theorems. Layers 8–9 identify the actual K-theory tower and its rational character. Layers 10–11 apply those constructions to periodic étale comparison and real-place extensions. Layer 12 realizes the resulting classes. Within the norm residue proof the induction is on weight: lower-weight comparison precedes norm-variety existence, the Rost motive and the next Hilbert 90 step. The logarithmic characteristic-p proof has its own base cases and is not obtained by specializing a prime-to-p twist.

## Layer 1: twists, coefficient towers and cycle-map residues

### 1.1 The finite arithmetic coefficient dictionary

For a field F, m≥1 invertible in F and j∈Z, write `finiteTwist F m j` for the supplied discrete coefficient object: Z/m at j=0, `KummerCoeff F m` at j=1, tensor powers over Z/m for j>1, and the contragredient Z/m-dual for j<0. Construct `finiteTwist_etaleDictionary`, its identification with the stalk of μ_m^⊗j and with the native character module at each prime-power level, compatible with Chinese remaindering for composite m. The new comparison API identifies the supplied tensor pairing `twistPair`, evaluation duality, coefficient reduction and weight-one Kummer coefficient with their sheaf counterparts. Require `finiteTwist_dictionary_pair`, `finiteTwist_dictionary_reduce` and `finiteTwist_one`. The action on this rank-one module is χ_m^j; the pairings use tensor concatenation, not multiplication of roots. Cartier duality pairs weights j and 1−j to μ_m. (Weibel, III.6.10, p.242; VI.1.7, p.468.) *Needs:* the native coefficient and arithmetic representation suppliers.

**Checks.**

- m=1 gives the zero module at every weight, including weight zero and negative weights.
- Over ℝ with m=4, conjugation acts by −1 in weight one and by +1 in weight two; assigning trivial actions fails the first calculation.
- Replacing a primitive root ζ by ζ^a multiplies the weight-j tensor generator by a^j; coordinates of a fixed element change by a^(−j). The construction requires no root choice.
- Evaluation of a weight −1 functional on a weight-one generator is the ordinary scalar in weight zero; no cohomological sign is inserted.

### 1.2 Compact and divisible twists

For ℓ≠char F let T_j=Z_ℓ(j), V_j=T_j⊗Q_ℓ and D_j=V_j/T_j be the supplied compact, rational and divisible coefficient objects; weight one uses the native `PadicTateTwist` over the separable closure. Construct `adicTwist_etaleDictionary` extending 1.1 to the coefficient towers and their sheaf realizations. It identifies T_j/ℓ^r with finiteTwist(F,ℓ^r,j) and D_j[ℓ^r] with T_j/ℓ^r, with transition ζ↦ζ^ℓ in weight one. Denote the supplied lattice inclusion [x]↦[ℓ^s x] from level r to r+s by `twistCoeffIncl`; its native prime-power form is `ZModTwist.mulPow`. The new API compares these inclusions, reductions and the quotient-to-D_j map with their arithmetic realizations, including the connecting maps of T_j --ℓ^r→ T_j→T_j/ℓ^r, T_j→V_j→D_j and 0→T_j/ℓ^r→T_j/ℓ^{r+s}→T_j/ℓ^s→0. Require `adicTwist_dictionary_coeffTriangle`, `twistCoeffIncl_etale` and compatibility of tensor pairings with finite reduction. The exact sequences and their injectivity/composition laws are imported coefficient theorems. (Tate, §3, p.262; Weibel, VI.8.2–8.3, pp.513–514.) *Needs:* 1.1 and compact-coefficient limits.

**Checks.**

- For j=1 the map level 1→2 is the inclusion μ_ℓ⊂μ_{ℓ²}. In lattice coordinates it sends 1 mod ℓ to ℓ mod ℓ².
- For j=2 and these same levels, factorwise inclusion multiplies the tensor generator by ℓ² and is zero. `twistCoeffIncl` instead multiplies it by ℓ and is nonzero. Thus the naive factorwise colimit vanishes in weights ≥2, whereas D_j does not.
- Weight zero gives Q_ℓ/Z_ℓ with its trivial action; negative weights use the dual action but the same coefficient inclusion.
- The quotient map in the r=s=1 exact sequence has kernel ℓ(Z/ℓ²), not the image of a tensorwise root inclusion in weight two.

### 1.3 Primewise divisible coefficients and cup products

Let `divisibleTwist F j`=⊕_{ℓ≠char F}D_j be the supplied discrete module. Construct its arithmetic realization dictionary with the prime-primary decomposition, finite coefficient inclusions and restriction, identifying its underlying roots-of-unity group with action χ^j. Specialize the supplied all-degree cup to the twist pairing as `twistedCup`; the new theorem compares this specialization under the étale/Galois dictionary, retaining its associativity, unit, degree sign (−1)^{ab}, restriction and projection formula. For finite separable E/F, cor∘res=[E:F]. The explicit degree-(1,1) cup is the supplied `explicitCup11`. The generic cup construction and its laws remain with ProfiniteCohomology. (Weibel, III.6.10(6.10.2), p.242; VI.1.7 and Corollary 4.1.1, pp.468,480.) *Needs:* 1.1–1.2 and the discrete-cohomology supplier.

**Checks.**

- Over Q, the weight-two invariant subgroup has order 24, with 2-primary part of order 8 and 3-primary part of order 3. The tensor square of Q/Z is zero and cannot be this module.
- Weight-zero invariants are the entire prime-to-characteristic Q/Z; no finite-order invariant is claimed in weight zero.
- Over ℝ, x=κ₂(−1) satisfies x²≠0. Graded commutativity does not imply that an odd-degree square vanishes at 2.
- Restriction to an extension of degree e followed by corestriction multiplies a degree-zero invariant by e; corestriction is a module map, not a unital ring map.

### 1.4 Continuous étale coefficients and comparison maps

On a scheme X with ℓ invertible, specialize the supplied finite étale twist sheaf and define `continuousEtaleComplex X j`=Rlim_r RΓ_et(X,T_j/ℓ^r). Its H^a is continuous étale cohomology. Give `continuousEtale_milnor` with kernel lim¹H^{a−1}, `continuousEtale_reduce` and the coefficient Bocksteins; finite previous cohomology groups suffice for that lim¹ to vanish. Define rational coefficients by rationalizing this complex and discrete divisible coefficients by the correctly normalized filtered colimit; for qcqs X this agrees with sheaf cohomology of the colimit. Cup and pullback commute with these constructions. On Spec F prove `twist_fieldComparison` with continuous Galois cohomology, including compact coefficients and finite separable transfer. For every field and all degrees, H^a(F,V_j)=H^a(F,T_j)⊗Q_ℓ: compactness of the cochain domains permits bounded denominators, without finite generation of H^a. (Tate, §2, pp.258–261; Milne, I.Proposition 0.22, p.16; Weibel, VI.8.2, pp.513–514; Stacks, Tag 03QQ.) *Needs:* the field étale/Galois and compact-limit suppliers, 1.1–1.3.

**Checks.**

- For a separably closed field, positive cohomological degrees vanish and degree zero is the specified coefficient module.
- For a finite field, H¹_cont(Spec F_q,Z_ℓ)=Z_ℓ. Ordinary étale H¹ of the *discrete* constant Z_ℓ is zero: continuous homomorphisms from the compact Galois group have finite image in torsion-free discrete Z_ℓ.
- An empty scheme has zero cohomology. A zero coefficient tower has zero limit and lim¹.
- Without a Mittag–Leffler argument, the comparison to lim H^a is the displayed short exact sequence, not an unconditional isomorphism.

### 1.5 Arithmetic étale comparison and Kummer sequences

For R=O_{F,S} and a finite G_{F,S}-module M of order invertible on R, identify the cohomology of its locally constant étale sheaf with H^a(G_{F,S},M) for every a≥0. Name `sInteger_etaleComparison`, its compatibility with products, coefficient boundaries, enlargement of S, generic-point inflation and finite étale transfers. Apply it levelwise and then by Rlim to T_j. For n invertible on any scheme X, the supplied Kummer exact sequence gives the particular natural exact rows

```text
0 → O(X)×/n → H¹_et(X,μ_n) → Pic(X)[n] → 0,
0 → Pic(X)/n → H²_et(X,μ_n) → Br′(X)[n] → 0.
```

Here Br′ is the torsion subgroup of H²_et(G_m); no equality with the whole H² is imposed on arbitrary X. Prove `kummer_sUnitComparison` identifying the first row on R with its arithmetic Galois version. (Milne, ADT II.2.9, pp.170–171; Weibel, III.6.10.1 and VI.8.5, pp.242,514.) *Needs:* 1.4 and the arithmetic/site/Picard suppliers.

**Checks.**

- For a field, Pic=0 and the first map is the existing Kummer isomorphism; over R its kernel remains the nth powers.
- A nonzero Pic(X)[n] contributes classes not represented by global units; deleting the last term fails this example.
- At n=1 every displayed finite-coefficient group is zero.
- A finite extension unramified outside S corresponds to an open subgroup, and the composite transfer/pullback is its degree.

### 1.6 Henselian specialization and residues

For a henselian local ring A with residue k and m invertible in k, identify finite-twist cohomology on A and k, then pass to continuous ℓ-adic twists. For a regular Dedekind scheme B, a finite closed set Z, V=B\Z and m invertible on B, specialize purity to obtain

```text
… → H^a(B,Z/m(j)) → H^a(V,Z/m(j))
  → ⊕_{v∈Z}H^{a−1}(k(v),Z/m(j−1)) → H^{a+1}(B,Z/m(j)) → … .
```

Name `twistResidue`, `twistResidue_kummer`, `twistResidue_unitLeft` and `twistResidue_unitRight`; they satisfy ∂κ(a)=v(a), ∂(κ(u)∪x)=−κ(ū)∪∂x and ∂(x∪κ(u))=∂x∪κ(ū). Finite Z permits the continuous T_j and V_j versions. Finite and divisible discrete coefficients also permit passage to the generic point and the sum over all closed points. (Milne, ADT II.1.1(b), p.149; Geisser, Theorem 1.2(1),(3), p.774; Tate, (5.3), p.269.) *Needs:* 1.4–1.5 and henselian comparison/purity.

**Checks.**

- A=Z_p is henselian; Z_(p) is not a substitute for it. The residue comparison is not claimed for every local ring.
- For u a unit and π a uniformizer, ∂κ(u)=0 and ∂κ(π)=1; the ordered two-term product κ(u)∪κ(π) has residue −κ(ū).
- Removing no points gives the identity map and zero residue target.
- For B=Spec Z[1/ℓ], the ℓ-adic completion of Q× has residue families tending to zero ℓ-adically at infinitely many primes. They need not lie in the algebraic direct sum ⊕Z_ℓ. Thus there is no unqualified compact generic-point direct-sum sequence.

### Examples

Take the DVR F_q[[π]], ℓ∤q. Kummer classes of constants are unramified, the uniformizer has residue 1, and swapping these two degree-one factors changes the residue's sign. For ℓ=2 this sign becomes invisible modulo 2 but persists at higher coefficient levels. Over ℝ the action on T_j alternates with j while the degree sign in the cup remains cohomological. These examples test both independent gradings.

### Dependencies

The representation, cohomology, étale site, purity and arithmetic coefficient contracts above; no higher K-theory comparison is used in this layer. The invariant w_j is consumed from ArithmeticKTheory only after its finite-order hypotheses are satisfied.

## Layer 2: arithmetic cohomology and real restrictions

### 2.1 Ordinary real restriction, its kernel and its fibre

For S containing the dyadic and infinite places, define `realRestriction` α^a:H^a(R,M)→⊕_{σ real}H^a(ℝ,M), with M a finite 2-power twist, T_j or D_j. Define `realKernel` H̃^a=ker α^a and `positiveComplex`=fib(RΓ(R,M)→⊕RΓ(ℝ,M)). Require their natural maps, coefficient compatibility, the fibre long exact sequence and
0→coker α^{a−1}→H^a_+→H̃^a→0. Ordinary real cohomology, not Tate cohomology, is used in this fibre. For n>0, H^n(ℝ,D_j)=Z/2 when j−n is odd and is zero otherwise; H^n(ℝ,T_j)=Z/2 when n≡j mod 2 and zero otherwise. Modulo 2 it is Z/2 in every nonnegative degree. (Weibel, VI.(9.2),(9.6.2), pp.518,521.) *Needs:* Layer 1 and the supplied cyclic cohomology calculation.

**Checks.**

- For a totally imaginary field the sum is empty, so the fibre and kernel both equal ordinary global cohomology.
- At odd ℓ, real positive degrees vanish, but H⁰(real,M) can survive. Thus H̃^a=H^a for a≥1 and H^a_+=H^a for a≥2; the degree-one assertion needs its cokernel term.
- For F=Q(√2) and M=Z/3, α⁰ is the diagonal Z/3→(Z/3)², with cokernel Z/3. Identifying H¹_+ with H̃¹ would lose this subgroup.
- For D₀ over ℝ, H¹=Z/2 and H²=0; for T₀ the corresponding positive groups are H¹=0 and H²=Z/2.

### 2.2 High degrees and the scope of duality

For a number field and S containing the ℓ-adic and infinite places, cd_ℓ(G_{F,S})≤2 if ℓ is odd or F is totally imaginary. At ℓ=2, passage to F(i) gives virtual dimension at most two. For 2-primary discrete torsion M, `realRestriction_high` is an isomorphism for a≥3, and for finite M the degree-two restriction is surjective. For finite S and D_j its degree-two kernel is H²_cont(R,T_j)⊗Q₂/Z₂. Consequently degree-two restriction for D_j is an isomorphism *when this compact H² is finite*. Its higher-weight finiteness is established with arithmetic K-theory, not assumed as a consequence of duality alone. (Weibel, VI.8.2 and §9.2, pp.513,518; ArithmeticGaloisDuality's dimension/duality results.) *Needs:* 2.1 and arithmetic duality.

The field F(i) need not be unramified outside S when 2 is not in S. Its use here has exactly the dyadic hypothesis. No ordinary finite cd₂ assertion is made for fields with real places.

**Checks.**

- For a totally imaginary field the high-degree real sum is zero. Over the real field with mod-two coefficients it is nonzero in every degree; virtual dimension cannot replace ordinary dimension.
- At odd ℓ the real positive groups vanish because 2 is invertible on the coefficients.
- A finite compact H² tensors to zero with Q₂/Z₂. A free Z₂ summand instead gives Q₂/Z₂ and prevents the asserted degree-two isomorphism.

### 2.3 Brauer and mod-two dimensions

For finite S containing a finite place, identify Br′(O_{F,S}) with the kernel of
(Z/2)^{r₁}⊕(Q/Z)^s→Q/Z, the map summing local invariants (a real generator has invariant 1/2). This map is onto. No invertibility hypothesis on a chosen prime is needed for this Brauer assertion. If S has no finite place the rightmost surjectivity is omitted, and its cokernel belongs to H³_et(G_m). At odd ℓ the ℓ-torsion has dimension s−1. (Milne, ADT II.2.1, p.163; Weibel, VI.(8.1.1), p.513.)

For 1/2∈R and r₁>0, set t=dim Pic(R)/2 and u=dim Pic⁺(R)/2, using the S-narrow class group. Prove `modTwo_dimensions`:

```text
dim H¹ = r₁+r₂+s+t,             dim H² = r₁+s+t−1,
0 → H̃¹ → H¹ → F₂^{r₁} → Pic⁺(R)/2 → Pic(R)/2 → 0,
ε=u−t=dim coker α¹,            0≤ε<r₁,
dim H̃¹=r₂+s+u,                dim H̃²=t+s−1.
```

Use ε for the signature defect, to distinguish it from twist weight. (Weibel, VI.9.6.1–9.6.3, pp.520–521.) *Needs:* 1.5, 2.1–2.2, class-field invariants and S-unit/narrow-class exactness.

**Checks.**

- For Q and S={∞,2}, s=1,t=u=0: dim H¹=2, dim H²=1, dim H̃¹=1 and dim H̃²=0.
- With S only infinite, a totally imaginary field has no real invariant summands and the map 0→Q/Z cannot be onto.
- The all-negative S-unit −1 has nonzero signature, so ε<r₁; replacing the strict bound by an equality ε=r₁ contradicts it.

### 2.4 Adic finiteness, ranks and split real restriction

For finite S as above and every weight j, finite-level cohomology is finite and H^a_cont(R,T_j) is finitely generated over Z_ℓ. Require `adic_torsionSequence`: its torsion subgroup is coker[H^{a−1}(R,V_j)→H^{a−1}(R,D_j)]. In degree one and j≠0 this is H⁰(F,D_j). For j≠0 the rank difference rank H¹−rank H² is r₂ for even j and r₁+r₂ for odd j, including ℓ=2. Bounded real-place factors do not change these ranks. (Tate, Propositions (2.1)–(2.3) and their corollaries, pp.260–261; Milne, I.Corollary 4.15, p.62, and I.Theorem 5.1, p.67; Weibel, VI.Exercises 8.2–8.3, p.516, for the positive-weight specialization.)

For even j, `evenTwist_realSplit` says α¹:H¹(F,D_j)→(Z/2)^{r₁} is a split surjection; the same holds over O_{F,S} after enlarging S sufficiently. The splitting is not designated canonical. (Weibel, VI.Lemma 9.3, p.518.) *Needs:* Layer 1 and 2.1–2.3. At weight zero H⁰(F,V₀) is nonzero, so the weight-nonzero torsion formula is not reused without its cokernel.

**Checks.**

- At j=0 the map H⁰(V₀)→H⁰(D₀) is onto, so its cokernel is zero even though H⁰(D₀) is nonzero. The nonzero-weight shortcut would fail.
- For Q and j=2 the rank difference is zero; for Q and j=3 it is one. For an imaginary quadratic field both are one.
- For no real embeddings the splitting target is zero. At a real embedding even j gives H¹(D_j)=Z/2, while odd j gives zero.

### 2.5 The localization diagram in degree two

For m=ℓ^r invertible on R, place the snake-lemma row of K₂ localization above the finite étale localization row:

```text
0 → K₂(R)[m] → K₂(F)[m] → ⊕ μ_m(k(v))
  → K₂(R)/m → K₂(F)/m → ⊕ k(v)×/m → 0,
H¹(R,Z/m(2)) → H¹(F,Z/m(2)) → ⊕H⁰(k(v),Z/m(1))
  → H²(R,Z/m(2)) → H²(F,Z/m(2)) → ⊕H¹(k(v),Z/m(1)) → 0.
```

The sums are over v∉S. The last surjectivity in the second row uses injectivity H³(R)→H³(F): use dimension two away from real 2-cohomology and the real-place isomorphism otherwise. Construct `kTwo_localizationComparison` only after Layer 3 supplies its symbol maps. The right residue column is **negative** Kummer for the fixed tame convention; the preceding torsion residue column carries the corresponding boundary sign. A field comparison does not uniquely determine the ring column. When μ_m⊂F, the kernel H²(R,Z/m(2))→H²(F,Z/m(2)) is (Pic(R)/m)⊗μ_m. (Tate, diagram (3.3) and Theorem 6.2, pp.263,270; Weibel, VI.8.5–8.6, pp.514–515.) *Needs:* 1.6, 2.2 and the K₂ localization supplier; completion of the square needs Layer 3.

**Checks.**

- For {u,π}, the upper tame residue is ū while the lower residue is −κ(ū); a positive Kummer residue column fails at odd modulus.
- If Pic(R)/m is nonzero, a map into H²(R) can change by that kernel while agreeing over F. Thus field-level uniqueness is insufficient.
- For m=1 the finite quotient rows vanish, while the integral localization supplying the first row remains a distinct assertion.

### Examples

The Q, S={∞,2} calculation tests the class, unit and signature terms simultaneously. The two-real-place Z/3 calculation tests the difference between a mapping fibre and a kernel even when all positive real cohomology vanishes. In a totally imaginary field the real sum disappears, but the Picard kernel of generic restriction can still be nonzero.

### Dependencies

Layer 1; ArithmeticGaloisDuality's local/global dimension, finiteness and Euler characteristic; ClassFieldTheory's local invariants and reciprocity; number-field units and narrow class groups. The localization comparison is an output with Layer 3, not an input to Tate's field theorem.

## Layer 3: Tate's degree-two comparison

### 3.1 The finite and adic Steinberg relations

For every field F, m invertible in F and a≠0,1, prove κ_m(a)∪κ_m(1−a)=0 in H²(F,Z/m(2)). The coefficient pairing is the tensor pairing of 1.1. The representative signature `kummerCup_steinberg` pushes this vanishing through any continuous equivariant biadditive pairing of the two actual Kummer coefficient modules. Factor t^m−a, use restriction and the norm of 1−a^(1/m), and apply the projection formula. This proves the relation before any norm residue isomorphism is invoked. (Weibel, III.Proposition 6.10.3 and its proof, pp.242–243.)

For ℓ≠char F, let d_F:F×→H¹(F,T₁) be the boundary of the exact sequence with middle term lim(F_s×, x↦x^ℓ) and last map projection to coordinate zero. Its finite reductions are the Kummer classes. Prove separately d_F(a)∪d_F(1−a)=0 in H²(F,T₂). Tate's argument shows that the subgroup generated by the relevant corestricted Steinberg classes is ℓ-divisible and has zero image in this compact cohomology group. The finite-level vanishing alone would leave a lim¹ ambiguity. (Tate, Theorem 3.1 and its proof, pp.262–263.)

**Checks.**

- At m=1 both classes and their cup vanish. A unit entry equal to 1 has zero Kummer class for every modulus.
- Over ℝ modulo 2 the admissible entries a=−1 and 1−a=2 have zero cup because 2 is a square. The nonzero cup of −1 with itself has entries whose sum is not 1.
- For an algebraically closed field every finite Kummer class is zero. This does not justify replacing the adic proof by vanishing of all its reductions.

### 3.2 Galois symbols and their functoriality

Use Matsumoto's presentation to define `galoisSymbol` h_{F,m}:K₂(F)/m→H²(F,Z/m(2)) by {a,b}↦κ_m(a)∪κ_m(b), and `adicGaloisSymbol` h_F:K₂(F)→H²(F,T₂) by {a,b}↦d_F(a)∪d_F(b). Their API consists of `symbol_onSymbol`, uniqueness on symbols, additivity, skew symmetry, vanishing on {a,−a}, reduction of coefficients, arbitrary field-extension restriction and finite-extension transfer. For a finite separable E/F, cor h_E=h_F N_{E/F}; for a purely inseparable extension of degree p^e, use multiplication by p^e after the canonical identification of prime-to-p Galois coefficients. A general finite extension is the composite of those cases. Norm compatibility is required on all K₂ classes, not only on symbols with one entry in F. The latter case follows directly from the projection formula and is a proof ingredient. (Tate, Theorem 3.1 and Lemma 3.2, pp.262–263; Weibel, III.6.10, p.242.)

Require `symbol_residue`: for a DVR of fraction field F and residue k, with m invertible in k,

```text
∂ h_{F,m}(x)=−κ_m(∂^M x),
∂ h_{F,m}{u,π}=−κ_m(ū),       ∂ h_{F,m}{u,w}=0
```

for units u,w. The sign comes from moving the uniformizer past the first degree-one class. It completes the localization diagram of 2.5. The ring symbol will be constructed from that diagram and Tate's arithmetic comparison, not by asserting unique extension of the field map. (Tate, proof of Theorem 6.2, p.270, for the tame-symbol calculation; the cohomological sign follows from the residue convention in 1.6.)

**Checks.**

- m=1 gives the map between zero groups. If either symbol entry is an mth power its finite symbol is zero.
- Over ℝ at m=2, h{−1,−1} is nonzero, as detected by the nonsplit quaternion algebra. An alternating pairing in characteristic two would give the wrong answer.
- Over Q at m=3, the symbol {3,7} has nonzero residue −κ₃(3) at 7, because 3 is not a cube in F₇×. An equivariant biadditive pairing μ₃×μ₃→μ₃ is zero over Q and cannot replace the tensor pairing.
- Over an algebraically closed field all the degree-two targets vanish. Over a local field h_F kills its divisible K₂ summand, so injectivity of h_F on all of K₂ is not promised.
- Reduction of h_Q{−1,−1} at ℓ=2 is the preceding nonzero real class after real restriction. For a uniformizer last at an odd modulus, the displayed residue is negative Kummer.

### 3.3 Tate's diagram and the prime-power step

Put E=F(μ_ℓ), Δ=Gal(E/F). Construct γ:(μ_ℓ⊗E×)^Δ→K₂(F)[ℓ] and the isomorphism i:(μ_ℓ⊗E×)^Δ→H¹(F,Z/ℓ(2)). When μ_ℓ⊂F these send z⊗a to {z,a} and z∪κ(a). Otherwise descend along the prime-to-ℓ extension E/F. Give the commuting diagram with rows

```text
(μ_ℓ⊗E×)^Δ --γ--> K₂(F) --ℓ--> K₂(F) → K₂(F)/ℓ → 0,
H¹(F,Z/ℓ(2)) --δ--> H²(F,T₂) --ℓ--> H²(F,T₂) → H²(F,Z/ℓ(2)).
```

The upper row is exact except possibly at its first K₂ term over a general field; the lower row is the coefficient exact sequence. API: `gamma_onRootSymbol`, `gamma_descent`, `i_onKummer`, `tateDiagram_commutes`. If h_{F,ℓ} is injective, prove ker h_F is the maximal ℓ-divisible subgroup and coker h_F has no ℓ-torsion. The ℓ-primary torsion of K₂ then splits as its maximal divisible subgroup and a subgroup carried isomorphically onto the torsion of H²(F,T₂). If h_{F,ℓ} is bijective, prove H³(F,T₂)[ℓ]=0 and that h_{F,ℓ^r} is bijective for every r≥1. This is a coefficient-diagram argument; it does not assume an injective multiplication map between arbitrary Milnor quotients. (Tate, Diagram 3.3, Lemma 3.4, Theorem 3.5 and its corollary, pp.263–265.)

**Checks.**

- If μ_ℓ⊂F, γ(z⊗a^ℓ)=ℓ{z,a}=0 and its image is ℓ-torsion, while its source need not be finite.
- For ℓ=2, E=F and no averaging by 2 is used in descent. For ℓ odd, [E:F] divides ℓ−1 and is invertible on every group in the descent step.
- A divisible subgroup may be nonzero over a local field; the conclusion identifies it as the kernel rather than declaring K₂ reduced.
- The bottom row need not end in a surjection without the degree-three conclusion. That conclusion is proved from bijectivity at ℓ before being used to pass to ℓ².

### 3.4 Injectivity criteria, local fields and global fields

Prove descent of injectivity and bijectivity of h_{F,ℓ} from E=F(μ_ℓ). With μ_ℓ⊂F, establish h{a,b}=0 iff b is a norm from F(a^(1/ℓ)), equivalently {a,b}∈ℓK₂(F). For a not an ℓth power, the kernel of restriction on H² to F(a^(1/ℓ)) consists of the symbols with first entry a. If u:F×⊗F×→H² sends a⊗b to h{a,b}, identify ker h with ker u modulo the subgroup generated by decomposable elements of ker u. The two chain conditions used to show that quotient is zero are:

- Equal values u(a⊗b)=u(c⊗d) admit x,y with the chain of equal values u(x⊗b), u(x⊗y), u(c⊗y).
- Any two values u(a₁⊗b₁),u(a₂⊗b₂) admit presentations u(c₁⊗d),u(c₂⊗d) with a common second entry.

A cyclic ℓ-torsion Brauer group implies these conditions. (Tate, Lemma 4.1, Proposition 4.3, Theorem 4.4 and Proposition 4.5, pp.265–267.)

For a nondiscrete locally compact field F, including ℝ and C, h_{F,ℓ^r} is an isomorphism for every ℓ≠char F and r≥1. For every global field F the same holds; moreover K₂(F) is torsion and has no nonzero divisible subgroup, and h_F identifies its ℓ-primary part with the torsion of H²(F,T₂). For global function fields, the proof additionally requires the function-field versions of global reciprocity, the tame-kernel localization theorem, and finiteness of the K₂ kernel of a smooth affine curve. These are explicit supplier-extension targets here: for a smooth projective geometrically connected curve C over F_q with function field F and a nonempty finite set S of closed points, prove reciprocity for its completions and the finite tame kernel for O(C\S), then apply Tate's argument. The number-field proof uses the existing ClassFieldTheory and K2SymbolsBrauer contracts. No characteristic-p prime-to-p assertion is inferred from a change of characteristic. (Tate, corollary to Proposition 4.5, p.268; Theorems 5.1 and 5.4, pp.268–270.)

**Checks.**

- If a is an ℓth power the extension is F itself and every b is a norm; the restriction-kernel assertion explicitly excludes that case.
- Over ℝ at ℓ=2, norms from C are positive, so −1 is not a norm and {−1,−1} survives. Over C every finite symbol vanishes.
- For F₂((t)) at ℓ=3 the local target is zero since 3∤(2−1); characteristic two itself does not exclude prime-to-two comparison.

### 3.5 The ring symbol, Picard kernel and torsion generators

For a number field F and S containing the infinite and ℓ-adic places, prove H²_cont(R,T₂) finite and injective into H²(F,T₂), with image the torsion classes unramified outside S. The adic symbol induces an isomorphism `sIntegerSymbol`:K₂(R)⊗Z_ℓ≃H²_cont(R,T₂). Construct its finite reductions K₂(R)/ℓ^r≃H²_et(R,Z/ℓ^r(2)), including real places at ℓ=2; show compatibility with generic restriction, coefficient boundaries and S-enlargement. The degree-three obstruction vanishes for this weight even at real places. (Tate, Proposition 2.3 and Theorems 5.4,6.2, pp.261,270; Weibel, VI.8.6, p.515.)

If μ_ℓ⊂F, prove the exact row

```text
0 → μ_ℓ⊗Pic(R) → K₂(R)/ℓ → (⊕_{v∈S, v noncomplex} μ_ℓ)_(sum=0) → 0.
```

The last map is field restriction, h_{F,ℓ}, and the local invariant maps. Real summands occur only at ℓ=2. Thus the ring symbol is an isomorphism even when the field restriction has a nontrivial Picard kernel. For number fields, prove im γ=K₂(F)[ℓ]. Its kernel has order ℓ^(r₂+e), where e=1 precisely when [F(μ_ℓ):F]≤2, and e=0 otherwise. Finally H¹(F,T₂)≃Z_ℓ^{r₂}⊕Z/ℓ^a, where a is the largest nonnegative integer for which F(μ_{ℓ^a}) is contained in a composite of quadratic extensions of F. Here e is unrelated to the signature defect ε of 2.3. (Tate, Theorems 6.1–6.3, pp.270–271; Theorem 6.5 and corollary, p.272.)

**Checks.**

- Over Q at ℓ=2 the exponent is a=3 and the H¹ torsion is Z/8; replacing multiquadratic containment by containment in Q would give the wrong exponent.
- With μ_ℓ contained in F, a nonzero Pic(R)/ℓ survives as the generic-restriction kernel. Field injectivity alone would delete it.
- At a real place and weight two, H³(ℝ,Z₂(2))=0 but H² can be Z/2. The absence of the obstruction does not remove the real summand.

### Examples

Over Q and ℓ=2, the cyclotomic exponent in 3.5 is a=3, since Q(μ₈) is multiquadratic and Q(μ₁₆) is not. Thus H¹(Q,Z₂(2)) has torsion Z/8. Over C the local comparison has zero degree-two target. Over ℝ at ℓ=2 it detects {−1,−1}. At an odd residue modulus, {u,π} tests the negative sign in the localization comparison; a class-group example with Pic(R)/ℓ≠0 tests why the ring statement is independent of the field statement.

### Dependencies

Layers 1–2; K2SymbolsBrauer's Matsumoto, norm, tame-symbol and number-ring localization layers; ClassFieldTheory's invariant maps; ProfiniteCohomology's Kummer and cyclic-algebra comparisons. The global function-field extensions in 3.4 are local targets needed to retain Tate's full generality. This layer does not use the all-weight norm residue theorem of Layer 6.

## Layer 4: higher cycles and motivic complexes

### 4.1 Simplexes, cubes and admissible cycles

For a base B, let Δ_B^n=Spec B[t₀,…,t_n]/(Σt_i−1). For an order-preserving map g:[m]→[n], pullback sends t_j to Σ_{g(i)=j}t_i. The empty sum is zero; faces set one coordinate to zero and degeneracies add adjacent coordinates. Define `admissibleCycles` z^q(X,n) as the free abelian group on integral codimension-q closed subschemes of X×Δ^n meeting every face in codimension at least q. Include the whole simplex among the faces. Dimension-indexed z_r is allowed for negative r; over a Dedekind base, the dimension of a subscheme dominating the base is its generic-fibre dimension plus one. Require `simplex_map`, `face_comp`, `cycle_face`, `cycle_support`, and the comparison of dimension and codimension indexing for equidimensional X. (Geisser, §§2–3, pp.775–779; MVW, §17, pp.135–137.)

The cubical presentation uses □=P¹\{1}, with faces 0 and ∞, and quotient by degenerate cycles. The coordinate x↦1−1/x sends the omitted point to 0 and the two faces to ∞ and 1; keep the coordinate change explicit. Give face/degeneracy maps on cycles, preservation of admissibility, quotient maps and their naturality. Admissibility is a simultaneous condition on all iterated faces, not merely on codimension-one faces. (Park, §2.1 and Definition 2.2.1, pp.3–6; Levine, *Bloch's higher Chow groups revisited*, §4.)

**Checks.**

- n=0 has only the whole face and recovers ordinary codimension-q cycles. For X=Spec F, z^q(X,n)=0 if q>n.
- A cycle lying inside a codimension-one face is inadmissible unless it is zero. A cycle meeting each single face properly can still fail at a multiple intersection, which the definition must reject.
- A constant cube in positive degree is degenerate and becomes zero, while a nonconstant admissible graph need not.
- On Δ², the two restrictions setting t₀=t₁=0 agree. Mapping an empty fibre to a nonzero coordinate would violate this identity.

### 4.2 Complexes, normalization and motivic grading

Define the simplicial differential d=Σ_{i=0}^n(−1)^i∂_i. In the cubical quotient use d=Σ_{i=1}^n(−1)^i(∂_i∞−∂_i0). Prove d²=0 and define `higherChow` CH^q(X,n)=H_n z^q(X,•). Require functorial homology maps, coefficient complexes and the associated Bockstein sequence; finite-coefficient higher Chow groups mean homology after derived coefficient reduction. The cubical normalized subcomplex has all 0-faces and the ∞-faces numbered ≥2 zero, with differential −∂₁∞, and its inclusion is a quasi-isomorphism. Construct the simplicial–cubical comparison through the two augmented normalized bicomplexes, prove both comparison arrows quasi-isomorphisms and establish their compatibility with products. (Park, Theorem 2.2.1 and §2.2; Levine, *Bloch's higher Chow groups revisited*, Theorem 4.7, p.296.)

On a smooth scheme over a field, define the motivic complex Z(q) with degree i term z^q(−,2q−i), followed by the specified Zariski or Nisnevich sheafification. Define H^a_M(X,Z(q)) by hypercohomology. Prove H^a_M(X,Z(q))≃CH^q(X,2q−a), using descent below. Over a general Dedekind base retain the hypercohomological definition; equality with the homology of global sections is a theorem under the local hypotheses of 4.7, not a definition. API: `cycleComplex`, `motivicComplex`, `higherChow_motivic`, `cube_normalized`, `simplex_cubeComparison`, and coefficient boundary compatibility. (Geisser, §§2–3 and Theorem 3.2, pp.775–780.)

**Checks.**

- A cubical one-chain has boundary ∂₁0−∂₁∞. Reversing this gives the opposite graph-divisor map below.
- At n=2 the two ways of reaching each vertex occur with opposite signs, so d²=0 before taking homology.
- CH^q(X,0)=H^{2q}_M(X,Z(q)); H^q_M(F,Z(q)) is cycle degree q, not cycle degree zero.
- The normalized complex in degree one retains a possible ∞-face and its differential has a minus sign. Killing both faces would change the homology.

### 4.3 Functoriality, moving and localization

For flat f:X→Y of constant relative dimension d, construct f*:z_r(Y,•)→z_{r+d}(X,•). For proper f construct f_*:z_r(X,•)→z_r(Y,•), using extension degrees on generically finite components and zero otherwise. Require composition, flat base change and agreement with ordinary cycle operations in degree zero. Over a field, prove A¹-homotopy invariance for separated equidimensional finite-type X, without assuming smoothness or quasiprojectivity. (Geisser, §§2–3, pp.775–780; MVW, Properties 17.4(1), p.136.)

For smooth quasiprojective X over a field and a finite family W of locally closed subsets, the cycles meeting W and all faces properly form a quasi-isomorphic subcomplex. Over a smooth affine X the corresponding assertion is available for finitely many morphisms into X, with the codimension conditions on each source. For mixed characteristic use the smooth-affine Dedekind version with the prescribed smooth closed test schemes, rather than assuming an unrestricted field moving lemma. These are targets `moving_subcomplex`, `moving_finiteDiagram` and `moving_dedekindAffine`; their coherent finite-diagram form is used by Layers 5 and 8. (Levine, *Chow's moving lemma and the homotopy coniveau tower*, §§2–3; Spitzweck, Proposition 5.8, pp.18–20.)

For Z⊂X closed of pure codimension c, U=X\Z, construct the supported-cycle identification and localization triangle

```text
z^(q−c)(Z,•) → z^q(X,•) → z^q(U,•) → z^(q−c)(Z,•)[−1]
```

in homological notation. The connecting map is CH^q(U,n)→CH^(q−c)(Z,n−1). Over fields this holds in the usual finite-type setting; over Dedekind bases use Geisser's sheaf-level localization, and the global complex statement for spectra essentially of finite type over a DVR. Require `cycle_localization`, the supported-complex version without an equidimensional Z, naturality, and the finite-coefficient boundary square. (Geisser, Theorem 3.2 and Corollary 3.3, pp.779–780.)

**Checks.**

- For the empty testing family the moved subcomplex is the full cycle complex. A cycle containing a prescribed test point in codimension one fails good position.
- An integral component collapsed by a proper map to smaller dimension pushes to zero; a generically degree-e component pushes with coefficient e.
- For Z empty localization is the identity on X; for Z=X its open term is zero. A divisor boundary lowers the cycle degree by one and the weight by one.

### 4.4 Products, low weights and the diagonal symbol

For schemes over a field, external product followed by diagonal pullback on a moved subcomplex gives CH^p(X,m)×CH^q(X,n)→CH^(p+q)(X,m+n) for smooth quasiprojective X. Require associativity, unit, graded commutativity with sign (−1)^{mn}, arbitrary pullback between smooth schemes, and proper projection formula with the appropriate moved model. Products of closed-fibre cycles over a Dedekind base require derived intersection and are not defined by the naive exterior product over that base. (MVW, Proposition 17.6, Theorem 17.21 and Theorem 19.1, pp.137,143,156–160, give integral moving and pullback; the product agrees with the tensor product of motivic complexes.)

Prove CH^q(X,0)=CH^q(X), Z(0)≃Z and Z(1)≃O×[−1] on smooth schemes over a field. Thus H¹_M(X,Z(1))=O(X)× and H²_M(X,Z(1))=Pic(X), while H⁰_M(X,Z(0)) is Z on each connected component and positive weight-zero cohomology vanishes in the stated smooth setting. Deduce `picard_aOne` from cycle homotopy invariance and the supplied divisor–Picard comparison; Picard homotopy invariance is not assumed in proving cycle homotopy invariance. For a field, H^a_M(F,Z(q))=0 when a>q; for a smooth d-dimensional scheme it vanishes when a>q+d or a>2q. Retain the same bounds after finite coefficient reduction where supplied by the cycle complex. (MVW, Theorems 4.1 and 5.1; Geisser, Theorem 1.1 and §3, pp.774–775,778–779.)

Construct the diagonal map `milnorCycle`:K^M_q(F)≃CH^q(F,q), using admissible cubical points for symbols, with entries equal to 1 interpreted as zero in the degenerate quotient. Prove products, finite-extension norms and residue compatibility. Normalize the comparison with étale realization so that its residue is (−1)^{q−1} times the uniformizer-last Milnor residue. At q=2 this identifies K₂(F) with H²_M(F,Z(2)); H^a_M(F,Z(2))=0 for a≥3 and H²_M(F,Z/m(2))=K₂(F)/m. The H¹ group belongs to the indecomposable K₃ comparison consumed by K3BlochGroups. (MVW, Theorem 5.1; Totaro, Theorem 1, pp.177–179; Weibel, VI.4.1, pp.480–481.)

**Checks.**

- On a field, CH¹(F,1)=F× and CH¹(F,0)=0; on a projective curve the latter becomes Pic and need not vanish.
- The unit in CH⁰(F,0) is [Spec F]. A product of two degree-one symbols changes sign on interchange; at 2 this need not force its square to vanish.
- A point with a coordinate 1 gives the zero symbol. For a,1−a the explicit two-chain relation must give the Steinberg relation, rather than merely imposing it on the target.
- For F₂, F₂× is trivial, so CH¹(F₂,1)=0. Weight zero remains Z and is not inferred from that calculation.

### 4.5 Projective bundles and support purity

For E of rank r+1 on a smooth X, r≥0, prove the isomorphism ⊕_{i=0}^r CH^(q−i)(X,n)→CH^q(P(E),n), (a_i)↦Σξ^iπ*a_i with ξ=c₁(O(1)). Include its inverse, base-change compatibility and the relation from the Chern polynomial. For a closed pure-codimension-c inclusion i:Z→X, identify cycles supported on Z with z^(q−c)(Z,•), giving the motivic support shift Z(q−c)[−2c] when the corresponding sheaf purity statement applies. Do not require smoothness of Z merely for the cycle-support identification; do require the regular/smooth hypotheses of the sheaf purity comparison being used. (MVW, Theorems 15.12 and 15.15, pp.123–124, and comparison Theorem 19.1, pp.156–160; Geisser, Corollary 3.3, p.780, for cycle supports.)

**Checks.**

- Rank-one E gives P(E)=X and just the i=0 summand; rank zero is excluded from this formula and has empty projectivization.
- On P¹_F, the class ξ generates CH¹, and ξ²=0. A formula with O(−1) without changing signs fails this generator test.
- A closed point of a regular curve shifts weight by one and cohomological degree by two. For an empty support the supported complex is zero.

### 4.6 Graphs and the last Gersten terms

For an integral codimension-(q−1) subscheme Y and f∈k(Y)×, form the admissible graph in the cubical coordinate and its closure with the moving conditions imposed. Its boundary is div_Y(f) with the convention of 4.2. For a pair f,g at codimension q−2, compare the two graph faces with ord(f)Γ_g−ord(g)Γ_f and the tame-symbol relations. The last three terms are

```text
⊕_{x∈X^(q−2)} K₂(k(x)) → ⊕_{x∈X^(q−1)} k(x)× → ⊕_{x∈X^(q)} Z.
```

The first arrow is the tame-symbol boundary with the sign required by the graph comparison. Prove the quotient relation Γ_{ab}−Γ_a−Γ_b=0 by an admissible chain; a map from a free group on functions alone does not supply this relation. Require `graph_boundary`, `graph_mul_homology`, `graph_tameSquare` and naturality under the existing cycle operations. (MVW, Theorem 5.1, pp.27–30, and §19, pp.156–160; Geisser, proof of Theorem 4.2, pp.783–786, for the admissible graph homotopy.)

**Checks.**

- On A¹, f=t has divisor [0], fixing the boundary sign. A constant unit has zero divisor.
- The graph for ab represents the sum of the graphs for a and b in CH¹(F,1); it is not equality of the generating cycles.
- On a DVR, the graph of {u,π} maps to ū under the Milnor tame symbol and to the sign-adjusted graph of that unit. Combining this with 3.2 gives the negative cohomological residue.

### 4.7 Descent and mixed-characteristic restrictions

Prove Zariski and Nisnevich descent for the cycle complex on smooth schemes over a field; a distinguished square gives a homotopy-cartesian square of complexes. Over a Dedekind base define the sheaf complex and establish localization before passing to hypercohomology. For an essentially smooth local scheme over a field, identify the Gersten resolution with the coniveau complex and obtain injectivity into its generic point in the relevant degrees. In mixed characteristic Geisser's Gersten statement is exact after the first two terms; exactness at those terms requires the indicated injectivity conjecture or an additional established case. Keep the unconditional exact tail, the conditional initial exactness and the sheaf vanishing above weight as separate targets. No mixed-characteristic Gersten conjecture is silently promoted to a theorem. (MVW, Proposition 19.12, p.162; Geisser, Theorem 1.1, pp.774–775, and §4, pp.782–786.)

**Checks.**

- On the empty scheme the cycle complex is zero; on a disjoint union it is the direct sum of the complexes of the components.
- For a field the coniveau complex has only its generic-point term. For a DVR the first possible boundary is the residue to its closed point.
- In mixed characteristic the unconditional exact tail does not imply injectivity of the first map. Imposing that injectivity is an additional hypothesis in the displayed Gersten conclusion.

### Examples

The graph of t on A¹ is the basic one-dimensional boundary calculation. The projective line gives CH¹(P¹,0)=Z and CH¹(P¹,1)=F× via the projective-bundle decomposition. For a field with a nontrivial Milnor symbol, its cubical point lies in cycle degree equal to weight; this distinguishes the diagonal from the ordinary Chow group of the field. Over a DVR, localization lowers both weight and cycle degree by one and tests the indexing independently of any motivic comparison theorem.

### Dependencies

SchemeAndStackFoundations' dimension, ordinary cycle, divisor, intersection and Chow operations; AlgebraicVectorBundles' projectivizations; K2SymbolsBrauer's Milnor presentation and tame symbols. Moving, higher-cycle complexes, their descent, and the mixed-characteristic qualifications are constructed in this layer. The transfer and motive comparison in Layer 5 consumes these results and cannot be used to establish their definitions.

## Layer 5: transfers and effective motives

### 5.1 Finite correspondences

For smooth connected X over a field k and separated finite-type Y, an elementary finite correspondence X⇝Y is an integral closed subscheme of X×Y finite and surjective over X. Define `finiteCorrespondence` as the free abelian group on these generators, componentwise in the source. For smooth X,Y,Z compose correspondences by intersecting their pullbacks in X×Y×Z and pushing to X×Z. Smoothness of the middle scheme supplies the normality needed to ensure that components are finite and surjective over the source. Prove associativity, bilinearity, diagonal identity and compatibility of the graph functor with composition. Disjoint union is a direct sum; product over k gives the symmetric monoidal structure. API: `correspondence_generator`, `correspondence_comp`, `graph_comp`, `correspondence_ext`, `correspondence_tensor`, and degree compatibility for finite field maps. (MVW, Definitions 1.1,1.5, Lemma 1.7 with the authors' normality correction, and 1.9, pp.3–6.)

**Checks.**

- Cor(Spec k,Spec k)=Z, composition multiplies the integer degrees, and the diagonal is 1.
- For finite separable E/k, composing the graph and transpose graph of Spec E→Spec k multiplies the unit correspondence by [E:k].
- An integral subscheme of X×Y supported only over a proper closed subset of a connected X is not an elementary correspondence.
- For a disconnected source the identity is the sum of the component diagonals; requiring surjectivity onto every component of X for each generator would lose these identities.

### 5.2 Sheaves with transfers and their tensor product

For a commutative coefficient ring A define `presheafWithTransfers` to be an additive functor Cor_k^op→A-Mod, and `representableTransfer X`=Cor_k(−,X)⊗A. Give additive Yoneda, projectivity of representables, resolutions by sums of representables, evaluation and restriction along graphs. Define Nisnevich and étale sheaves with transfers by the underlying topology on Sm/k. Prove that sheafification uniquely retains transfers, that these sheaf categories are Grothendieck abelian with enough injectives, and Ext^n(A_tr(X),F)=H^n(X,F). The distinguished-square criterion includes the value zero on the empty scheme. Čech exactness applies to a cover in the chosen topology, not to an arbitrary surjective étale map viewed as a Nisnevich cover. (MVW, Definition 2.1, Lemma 6.2, Propositions 6.12,6.14, Theorems 6.17,13.1, Proposition 13.4 and Lemma 12.7, pp.13,37–45,90,99–101.)

Construct `transferTensor` by the cocontinuous right-exact extension of A_tr(X)⊗_tr A_tr(Y)=A_tr(X×Y), and its bounded-above derived tensor by totalized representable resolutions. Require independence of resolutions, the internal-Hom adjunction, associativity, symmetry, unit, the map from the ordinary presheaf tensor, and compatibility with Nisnevich and étale sheafification. Pointed representables turn smash products into this tensor product. The tensor-triangulated shift constraints satisfy rl=−lr. (MVW, Definition 8.2, Examples 8.9–8.10, Proposition 8.17, Definition 8A.1 and Proposition 8A.7, pp.56–64; Definition 14.2, p.109.)

**Checks.**

- Evaluation of A_tr(Spec k) recovers the constant transfer sheaf A; its tensor with a representable is that representable.
- Additive Yoneda identifies a map out of A_tr(X) with its value at the identity correspondence, not with an arbitrary underlying presheaf section ignoring transfers.
- An upper distinguished square gives a pullback of section groups, while the empty-cover condition forces F(∅)=0.
- The derived tensor of two copies of Z/m has a nonzero Tor group in degree −1. Replacing derived tensor by ordinary tensor misses it.
- Interchanging two cochain shifts of degree one multiplies a pure tensor by −1; the transfer tensor does not remove that sign.

### 5.3 Suslin complexes and homotopy-invariant sheaves

Define `suslinComplex F` by U↦F(U×Δ^•). For a complex use its direct-sum totalization. If F has transfers then so does the complex, and its homology presheaves are A¹-invariant. Define the pointed G_m smash representable using the complement of the coordinate insertions at 1, and set Z(q)=C_*Z_tr(G_m^∧q)[−q] for q≥0. Require the low-weight comparisons of 4.4, products factoring through ⊗_tr, coefficient change by derived tensor, and functoriality in fields and smooth schemes. A change of the base field with the *same* scheme viewed through a finite separable base is compatible with this construction; it does not say the cohomology of X and X_E is always isomorphic. (MVW, Definitions 2.12–2.14,3.1, Construction 3.11 and Theorems 4.1,5.1, pp.16–30.)

Over a perfect field, prove that Nisnevich sheafification of an A¹-invariant presheaf with transfers has A¹-invariant cohomology in every degree. Obtain the Zariski–Nisnevich comparison for such sheaves and bounded-above complexes with invariant cohomology, the vanishing of C_* after a zero Nisnevich sheafification, and the local/henselian comparison needed to test quasi-isomorphisms. Over any field, an A¹-invariant transfer presheaf vanishing on all field extensions has zero Zariski sheafification; use this for field detection of quasi-isomorphisms. (MVW, Corollary 11.2, Propositions 13.7,13.9–13.14, Theorem 13.8 and its proof completed in Theorem 24.1, pp.83,100–103,197–201.)

**Checks.**

- q=0 gives Z and q=1 gives O×[−1]. Pointing G_m at 0 is impossible and would not give this weight-one object.
- The two evaluations at 0,1 on U×A¹ are chain homotopic in C_*; their equality on degree-zero sections alone is insufficient.
- The zero presheaf has zero complex and zero sheafification. The constant transfer sheaf Z is not killed by A¹ localization.
- Field detection quantifies over every field extension, including finitely generated extensions of positive transcendence degree, rather than only algebraic extensions of k.

### 5.4 The effective category and cancellation

Define DM^{eff,−}(k,A) as the Verdier localization of D^−(Nisnevich sheaves with transfers) by the thick subcategory generated by cones of A_tr(X×A¹)→A_tr(X), closed under the sums existing in D^−. Write M(X) for the image of A_tr(X). Construct motives of simplicial schemes by totalization, reduced motives for pointed objects, and the descended tensor product with M(X)⊗M(Y)=M(X×Y). Over perfect k identify the category with the A¹-local complexes, using C_* as the localization functor, and prove Hom(M(X),A(q)[p])=H^{p,q}_M(X,A). API: `effectiveMotive`, `motive_map`, `motive_product`, `motive_simplex`, `aOneLocalization_adjunction`, `motivic_representability`. (MVW, Definition 14.1, Lemma 14.4, Proposition 14.8, Theorem 14.11 and Proposition 14.16, pp.109–114.)

Over a perfect field and every commutative coefficient ring A, prove cancellation: Hom(M,N)→Hom(M(1),N(1)) is bijective. The cancellation construction uses finite correspondences and the explicit divisor operation, without a resolution-of-singularities hypothesis. In particular H^{p,q}(X,A) is the split G_m-reduced summand of H^{p+1,q+1}(X×G_m,A). Tate stabilization is supplied by MotivesAndAlgebraicCycles after this theorem. (Voevodsky, *Cancellation theorem*, Corollary 4.10, preprint p.14; compare the stronger hypothesis in MVW, Theorem 16.25, p.131.)

**Checks.**

- M(A¹)→M(Spec k) is an isomorphism, while the reduced M(G_m) is A(1)[1] and need not vanish.
- M(∅)=0, M(X⊔Y)=M(X)⊕M(Y), and M(Spec k) is the tensor unit.
- In the G_m formula, pullback along the projection has a splitting given by the point 1. The reduced summand is a quotient by this split image, not the entire cohomology group.
- Cancellation at a perfect field of positive characteristic uses the cancellation theorem itself; it cannot be justified by citing a theorem that assumes resolution in that characteristic.

### 5.5 Cycle transfers and the cycle comparison

For W∈Cor_k(X,Y), define W* on the moved subcomplex of z^q(Y,•) by intersection with W×Δ^• and proper pushforward to X×Δ^•. For affine Y the moving theorem makes the inclusion a quasi-isomorphism. For general smooth Y use an affine vector-bundle torsor and prove independence of the torsor, moving data and common refinements. Establish composition, graph compatibility, degree-zero agreement with ordinary Chow transfers and compatibility with products and localization. These are `higherCycle_transfer`, `transfer_graph`, `transfer_comp`, `transfer_independence`. (MVW, Propositions 17.6,17.10–17.11, Definition 17.17 and Theorem 17.21, pp.137–142.)

The Suslin-to-higher-cycle comparison then uses the equidimensional-cycle moving theorem: compare C_* of the equidimensional cycle sheaf with z^q and prove its compatibility with finite correspondences. This comparison and its assembly in geometric motives are the MotivesAndAlgebraicCycles contract; the explicit transfer construction above is its input. (MVW, Theorems 18.3,18A.1,19.1,19.8 and Proposition 19.6, pp.149–164.)

**Checks.**

- A graph correspondence recovers the pullback of 4.3. A finite field map and its transpose give restriction and the norm on CH^q(F,q).
- At q=0, transfer along a degree-e field extension sends the fundamental cycle to e times the fundamental cycle.
- Two affine torsors over the same Y are compared through their fibre product, so the resulting transfer maps coincide in the derived category. Equality of their E₂ pages alone is insufficient.

### 5.6 Rigidity and the étale comparison

For an A¹-invariant presheaf with transfers whose groups are annihilated by an integer prime to char k, prove that its étale sheafification is the locally constant sheaf associated to its discrete G_k-module of separable-closure sections. Over separably closed k the henselization of A^d at the origin has the same sections as k. Construct the étale A¹ localization; prove K→Tot C_*K an A¹-weak equivalence, uniqueness of a local representative, and A¹ locality for the locally constant finite-coefficient sheaves used here. The bounded-above C_*K locality theorem uses the finite-cohomological-dimension hypothesis where MVW requires it. (MVW, Theorem 7.20 and Proposition 7.21, pp.51–52; Definition 9.2, Definition 9.17 and Lemma 9.31, pp.67–74.)

For m invertible in k, use this rigidity and the tensor construction to prove Z/m(q)_et≃μ_m^⊗q for every q≥0. The change-of-topology morphism is multiplicative, transfer-compatible and agrees in weight one with the Kummer map. This is an identification of the *étale-sheafified* motivic complex; the truncation comparison on the Nisnevich site is the later Beilinson–Lichtenbaum theorem. (MVW, Theorems 10.2–10.3, pp.75–76; Corollary 4.9, p.27.)

For a purely inseparable extension k'/k in characteristic p, flat pullback induces an isomorphism on higher Chow groups after inverting p. Prove it first for finite extensions using push-pull and their degrees, then pass to filtered colimits. Also prove continuity of cycle complexes and field motivic cohomology over finitely generated subextensions and nonempty smooth-model opens. No integral equivalence of effective categories over an imperfect field is assumed. (MVW, Lemmas 3.9,5.3, pp.23,30.)

**Checks.**

- A constant Z/m transfer sheaf, m invertible, has the same sections on a separably closed field and on the henselization of affine space at its rational origin. The zero sheaf has zero sections on both.
- Étale Z/m(0) is the constant coefficient sheaf, while Z/m(1) is μ_m in degree zero. The latter is the étale-sheafified Kummer triangle, not the unsheafified unit group in degree one.
- Over a finite field, positive étale cohomology of these sheaves can be nonzero; local constancy does not identify global derived sections with degree-zero sections.
- For a finite purely inseparable extension of degree p^e, push-pull is p^e. It becomes invertible after inverting p; no integral isomorphism is inferred from that calculation.

### Examples

The finite extension Spec E→Spec F gives a transfer multiplying CH⁰ by [E:F] and acting on CH¹(E,1)=E× by the norm. This tests the relation between correspondences and cycles. The object M(G_m)=A⊕A(1)[1] tests the reduced motive and cancellation shift. On a separably closed field with m invertible, étale motivic cohomology is μ_m^⊗q in degree zero and zero in positive degrees, even though the unsheafified motivic complex carries more information over general smooth schemes.

### Dependencies

Layer 4; SchemeAndStackFoundations' sites and finite correspondences' underlying cycle intersections; Mathlib's abelian and derived categories; GeneralizedCohomology G2's homotopical localization infrastructure. MotivesAndAlgebraicCycles takes the effective and cancellation constructions as input to geometric motives and stabilization. The unstable motivic homotopy category required for operations is a further construction in Layer 6, not a consequence of having only this triangulated category.

## Layer 6: operations, norm varieties and norm residue

### 6.1 Motivic reduced powers and the coefficient algebra

Over a perfect field k and ℓ≠char k, construct the pointed Nisnevich A¹ homotopy category and its simplicial and G_m suspension functors, together with the motivic Eilenberg–MacLane spaces representing the complexes of Layer 5. This unstable representability and its suspension comparison are required local targets; a triangulated effective category alone does not supply total power operations. Construct the total power on H̃^{2d,d} by the symmetric-group action on the ℓ-fold external product, with the Thom normalization used below, and extend by the two suspensions. (Voevodsky, *Reduced power operations*, §§2–5, pp.3–18, and §§7–9, pp.23–37.)

Construct `derivedSymmetricPower` on pointed simplicial radditive presheaves, using projective resolutions before Nisnevich/A¹ localization; prove preservation of the generating local equivalences. A radditive presheaf takes finite coproducts to products and the initial object to a point. Require the derived finite-correspondence/forgetful adjunction, its suspension comparison and the geometric classifying-space model colim(V_n−bad locus)/G. Prove `motivicEML_represents` comparing the cycle model with K(A,p,q). For a perfect field k admitting resolution of singularities, with exponential characteristic c, a finitely generated Z[1/c]-module A, a coefficient field E in which c is invertible, and p≥2q≥0, p>0, prove `motivicEML_splitTate`: the reduced E-motive of the pointed space K(A,p,q) is a direct sum of E(b)[a] with a≥2b and b≥q. Characteristic-zero fields satisfy these assumptions with c=1. The ordinary motive also has the basepoint summand E(0)[0]; the bound b≥q applies to the reduced summand. Construct this through derived symmetric powers, preserving the action of multiplication by d on the nth symmetric summand as d^n. Deduce the finite-smash Künneth isomorphism for K(Z/ℓ,2q,q) used in the uniqueness of operations. (Voevodsky, *Simplicial radditive functors*, Theorems 3.51,4.8, pp.235–236,238; *Motivic Eilenberg–MacLane spaces*, Theorems 1.7,3.25 and Corollaries 3.28,3.33, pp.12–14,71–74; *On motivic cohomology with Z/ℓ-coefficients*, Lemma 2.3, p.5.)

Define `motivicPower` P^i of bidegree (2i(ℓ−1),i(ℓ−1)), `motivicBockstein` β of bidegree (1,0) from 0→Z/ℓ→Z/ℓ²→Z/ℓ→0, and B^i=βP^i. At 2 write Sq^{2i}=P^i and Sq^{2i+1}=B^i. The coefficient calculation for BΣ_ℓ uses generators c of bidegree (2ℓ−3,ℓ−1), d of bidegree (2ℓ−2,ℓ−1), with c²=0 for odd ℓ and c²=τd+ρc for ℓ=2. Here ρ=[−1]∈H^{1,1}(k,F₂) and τ∈H^{0,1}(k,F₂). Require naturality, suspension stability, P⁰=id, P^i=B^i=0 for i<0, β²=0, the total-power coefficient extraction and independence of the chosen representing model. (Voevodsky, *Reduced power operations*, Theorem 6.10 and §§8–9, preprint pp.21–37.)

**Checks.**

- β on weight-zero constants agrees with the coefficient connecting map and β²=0. β is not a map shifting weight by one.
- Over C, ρ=0 but τ≠0. The relation for c² remains τd, so topological exterior coefficients do not describe the motivic answer.
- Over ℝ, ρ≠0 and the extra ρc term survives. A construction using only the complex-field coefficient algebra fails this case.
- P^d(u)=u^ℓ for u of bidegree (2d,d); at d=0 this is the identity on F_ℓ constants. The zero pointed object has zero reduced cohomology and all operations zero.
- The zeroth smash in the Künneth formula is the coefficient ring. For A=0, K(A,p,q) is contractible: its reduced motive is zero and its ordinary motive is E(0)[0]. For q>0 the ordinary unit violates b≥q, so omitting “reduced” gives a false statement even for A=0. At q=0,p>0 the split-Tate statement is still permitted; p=q=0 is handled separately.
- The split-Tate assertion is restricted to p≥2q: K(Z/ℓ,0,1)=μ_ℓ can have a non-Tate rational motive when k lacks the roots. Derived symmetric power zero is the tensor unit, whereas a positive symmetric power of zero is zero.
- Representable presheaves are radditive; the constant two-element presheaf fails at the initial object, and sections over X⊔Y must be a product. On the nth symmetric summand d=1 acts identically and d=0 kills every n>0 summand.

### 6.2 Relations and Milnor operations

Prove the Cartan and instability relations with motivic coefficients. For odd ℓ, P^i(uv)=ΣP^r(u)P^{i−r}(v), and β(uv)=β(u)v+(−1)^{deg u}uβ(v). At 2, the even Cartan formula has the additional τΣ Sq^{2s+1}(u)Sq^{2i−2s−1}(v), and the odd formula has the additional ρΣ Sq^{2s+1}(u)Sq^{2i−2s−1}(v), with s=0,…,i−1; the remaining sums are the even-even and odd-even/even-odd sums of total index 2i and 2i+1 respectively. Instability gives P^n(u)=0 when n>p−q and n≥q for u∈H^{p,q}. (Voevodsky, *Reduced power operations*, Propositions 9.5–9.7, preprint pp.34–37.)

For odd ℓ and 0<a<ℓb, prove

```text
P^a P^b = Σ_{t=0}^{floor(a/ℓ)} (−1)^(a+t)
  binom((ℓ−1)(b−t)−1,a−ℓt) P^(a+b−t) P^t.
```

For odd ℓ and 0<a≤ℓb the companion relation, writing B^i=βP^i, is

```text
P^a B^b = Σ_(t=0)^floor(a/ℓ) (−1)^(a+t)
  binom((ℓ−1)(b−t),a−ℓt) B^(a+b−t)P^t
 + Σ_(t=0)^floor((a−1)/ℓ) (−1)^(a+t−1)
  binom((ℓ−1)(b−t)−1,a−ℓt−1) P^(a+b−t)B^t.
```

Binomial coefficients outside their nonnegative range are zero. At 2 construct the coefficient-weighted Adem reduction by dualizing the following explicit Hopf-algebroid presentation. Its monomial basis is τ(E)ξ(R), with each τ exponent 0 or 1, ξ₀=1 and τ_i²=τξ_{i+1}+ρτ_{i+1}+ρτ₀ξ_{i+1}. The coproducts are Δξ_k=Σ_(i=0)^k ξ_{k−i}^{2^i}⊗ξ_i and Δτ_k=τ_k⊗1+Σ_(i=0)^k ξ_{k−i}^{2^i}⊗τ_i; the right unit sends τ to τ+ρτ₀ and ρ to ρ. Coefficients use this right unit when they cross the tensor factors. Define `motivicAdemNormalForm` by coefficient extraction against this basis, and prove that it equals composition of the operations constructed in 6.1 and terminates in the admissible basis. This gives every two-primary relation with its τ and ρ factors, rather than postulating unweighted topological coefficients. In particular Sq²Sq²=τSq³Sq¹. Require uniqueness of admissible normal forms and the free left H^{*,*}(k,F_ℓ)-basis of admissible monomials. Every summand has the input bidegree; a formula with output index a+b+t instead of a+b−t fails that requirement. (Voevodsky, *Reduced power operations*, Theorems 10.2–10.3, Lemma 11.1, Corollary 11.5, Theorem 12.6, Lemma 12.11 and Remark 12.12, preprint pp.38–45,50–55.)

Define `milnorOperation Q_i` by duality with τ_i in the dual Steenrod algebra, where |τ_i|=(2ℓ^i−1,ℓ^i−1), |ξ_i|=(2ℓ^i−2,ℓ^i−1). Let q_i be dual to ξ_i. Require Q₀=β, Q_i²=0, dual-basis evaluation and the coproduct. At odd ℓ use Q_{i+1}=P^{ℓ^i}Q_i−Q_iP^{ℓ^i}, anticommutation and the signed derivation rule. At 2 retain the ρ terms in the coproduct: Q₂=[Sq⁴,Q₁]+ρQ₀Q₁Sq². For a Thom class t_V prove q_n(t_V)=s_{ℓ^n−1}(V)t_V. With the odd-prime recursion just fixed, the identity for b=(ℓ^n−1)/(ℓ−1) is Q₀P^b=Σ_{i=0}^n(−1)^i P^{b−(ℓ^i−1)/(ℓ−1)}Q_i. (Voevodsky, *Reduced power operations*, §§12–14, especially Propositions 13.4,13.6, Example 13.7 and Corollary 14.3, pp.46–57; compare *On motivic cohomology with Z/ℓ-coefficients*, Lemma 5.13, preprint p.28, whose Q convention changes the signs.)

**Checks.**

- Q₀ has bidegree (1,0), Q₁ has (2ℓ−1,ℓ−1), and each summand of the displayed odd-prime identity has the same bidegree.
- At 2 over ℝ the term ρQ₀Q₁Sq² cannot be dropped from the Q₂ formula. Over C it vanishes but the τ correction in Sq²Sq² remains.
- For a line bundle L, s_d(L)=c₁(L)^d. On the zero bundle every positive Newton class is zero, fixing the Thom operation's characteristic class.
- The n=1 odd-prime identity is βP¹=P¹β−Q₁. Choosing all plus signs with the stated recursion gives the opposite Q₁ term.

### 6.3 Degree invariants, norm varieties and the motivic degree theorem

For smooth projective X of dimension d≥1 define s_d(X)=deg s_d(T_X), the Newton power-sum characteristic number. For dimension zero put s₀(X)=deg X. Define `nuVariety ℓ n X` by dim X=ℓ^n−1 and ℓ²∤s_{ℓ^n−1}(X). Define `nuLeVariety` by requiring in addition a morphism from a ν_i-variety for every i<n. API: base extension, characteristic-number computation, the zero-dimensional case, and the morphisms in `nuLeVariety`. For n≥1 prove ℓ∣s_{ℓ^n−1}(X). (Voevodsky, *On motivic cohomology with Z/ℓ-coefficients*, Lemma 4.1 and Definition 6.2, preprint pp.20,33.)

For a nonzero symbol a∈K^M_n(k)/ℓ, n≥2, define a `normVariety` as a smooth projective geometrically integral splitting variety of dimension ℓ^{n−1}−1 which is ℓ-generic: every splitting field has a finite extension of degree prime to ℓ over which X has a point. A `rostVariety` also has the ν_{≤n−1} property and exact norm row H_{−1,−1}(X×X)→H_{−1,−1}(X)→k×, with first map pr₁*−pr₂*. Define the middle group by motivic homology, compare it with A₀(X,K₁), and use the quotient by these differences for the norm assertion. Require splitting after extension, genericity transport, the norm map and quotient exactness. (Haesemeyer–Weibel, Introduction and Definition 0.5, pp.1–4.)

Construct the stable normal-bundle degree map τ:T^N→Th_X(V), its Thom class and the unique lift to the cone Th_X(V)/T^N. Prove Q_n(t̃)=(s_d(X)/ℓ)v modulo ℓ for d=ℓ^n−1. This construction needs motivic stable duality and the purity/Thom comparison; these are local targets in precisely this stable-normal-bundle setting. For a ν_n-variety in an embedded motive category, deduce vanishing of the Q_n Margolis homology of the reduced Čech suspension. Finally, if M(X)→s N→r 1 factors the structure map, and α∈H^{p,q} of the base with p>q satisfies α≠0, αr=0 and Q_nα=0, prove sτ≠0. (Voevodsky, Lemmas 4.1,4.3 and Theorem 4.4, preprint pp.20–23.)

**Checks.**

- At n=0 a degree-ℓ finite scheme has s₀=ℓ, hence is ν₀; defining s₀ as the rank of its tangent bundle would instead give zero.
- At ℓ=2, a smooth conic has s₁=2 and is ν₁. A dimension check alone does not make an arbitrary conic a splitting variety for a prescribed symbol.
- A splitting variety with a k-point forces a=0, contradicting the nonzero-symbol hypothesis in the norm-variety application.
- When s_d(X) is divisible by ℓ² the displayed Thom coefficient is zero modulo ℓ, so the nonvanishing conclusion cannot be used.

### 6.4 Constructing the norm varieties

For ℓ=2, char k=0 and a=(a₁,…,a_n), use the Pfister neighbor q_a=(⊗_{i<n}〈1,−a_i〉)⊥〈−a_n〉. Its quadric has dimension 2^{n−1}−1; for n≥2 it is geometrically integral and s_d≡2 mod 4. Lower Pfister-neighbor quadrics give the ν_{≤n−1} maps. Prove Q_a(F)≠∅ iff the symbol vanishes in K^M_n(F)/2, hence its 2-generic property. Use the algebraic Pfister-symbol extension specified above, together with QuadraticFormInvariantsPartII Q2.1–Q2.2; its cohomological Q2.3 criterion is not an input. For n=1 use the finite quadratic splitting scheme separately. (Voevodsky, *Motivic cohomology with Z/2-coefficients*, §4 and Theorem 7.4, pp.77–80,96–97; Haesemeyer–Weibel, Introduction, pp.1–4.)

For odd ℓ, and also uniformly at 2, construct Rost's chain-lemma data over a characteristic-zero ℓ-special field: a smooth projective cellular S of dimension ℓ^n−ℓ, line bundles J_i,J'_i and nonzero ℓ-forms γ_i,γ'_i, with the recursive symbol identities

```text
{a₁,…,a_n}={a₁,…,a_(n−2),γ_(n−1),γ'_(n−1)},
{a₁,…,a_(i−1),γ_i}={a₁,…,a_(i−2),γ_(i−1),γ'_(i−1)}.
```

Their zero loci split the symbol and have degree indices divisible by ℓ; the top power of c₁(J₁) has degree prime to ℓ and γ₁ is not an ℓth-power form. The projectivized Kummer-algebra bundle has dimension ℓ^n−1 and characteristic number not divisible by ℓ². Prove the norm principle reducing [z,β] of degree ℓ^ν, ν>1, in the quotient A₀(X,K₁) to [x,α] of degree ℓ, and deduce injectivity of its norm to k×. An ℓ-special field here has every finite extension of degree a power of ℓ; the identity extension is included. (Haesemeyer–Weibel, Theorems 0.1,0.3,8.1 and Corollary 9.8, author PDF pp.1–3,22–23,25.)

Include the DN degree theorem over characteristic-zero k: for G=μ_ℓ^n, n≥1, X=∏_{i=1}^r X_i, r≥1, with smooth projective irreducible G-varieties X_i of dimension d=ℓ^n−1, each k(X_i) splitting a weight-(n+1) symbol u_i which remains nonzero over k(X₁×⋯×X_{i−1}), and ℓ²∤s_d(X_i), let Y be smooth projective irreducible and G-fixed-point equivalent to m copies of X, ℓ∤m. A prime-to-ℓ finite extension of k(Y) with a point of X has a smooth projective model W with morphisms to X and Y; W→X is dominant of degree prime to ℓ. The map W→Y is generically finite, not necessarily finite after resolution. Fixed-point equivalence requires isolated fixed points and matching tangent representations over a separable closure. (Haesemeyer–Weibel, Appendix A, Theorem A.1, author PDF pp.28–31.)

Construct the degree-theory inputs `cobordismDegree` and `heightCharacteristic`: identify Ω_*(k) with the Lazard ring and complex bordism MU_{2*}, and choose a height-n formal-group-law map ψ:L_*→F_ℓ[v_n], deg v_n=d. Put t_{d,r}(Z)=[v_n^r]ψ[Z]. For M(X) generated by smooth projective Z→X with dim Z<dim X, prove [W]−deg(f)[X]∈M(X) for an equal-dimensional smooth projective morphism f, taking deg f=0 when nondominant. If X=X^(r)→⋯→X^(0)=Spec k has dimensions id and every zero-cycle on each generic fibre has degree divisible by ℓ, prove t_{d,r}(W)=deg(f)t_{d,r}(X). Require t_{d,1}(X)=u·s_d(X)/ℓ mod ℓ for a fixed u∈F_ℓ×, its product law, and `fixedPoint_heightCharacteristic`: equal isolated tangent data for compact complex μ_ℓ^n-manifolds gives equal ψ-classes. Spread to a finitely generated characteristic-zero field and embed it into C for this last comparison. These are construction targets, including the smooth cobordism relations and realization comparison, preceding `dnDegree_primeTo`. (Same appendix, Theorems A.2,A.5,A.10 and Lemma A.6, pp.28–31.)

Assuming norm residue in weight n−1 for **all** characteristic-zero fields, construct a norm variety for every nonzero weight-n symbol over a characteristic-zero field containing μ_ℓ. Prove its ν_{≤n−1} property and the Rost norm exactness, integrally over an ℓ-special field and after Z_(ℓ) localization in general. The n=1 initial object is Spec k(a₁^(1/ℓ)); its norm exactness is Hilbert 90. This lower-weight induction hypothesis must precede existence; no norm-variety existence proof is allowed to use the weight-n conclusion. Require `pfisterNeighbor_splits`, `chainLemma_symbol`, `chainLemma_degree`, `rostNorm_reduction`, `dnDegree_primeTo` and `normVariety_exists_lowerWeight`. (Voevodsky, Theorem 6.3, preprint pp.33–34; Haesemeyer–Weibel, Theorem 0.7, pp.3–4.)

**Checks.**

- For n=2,ℓ=2 the neighbor has rank three and its quadric dimension one. For n=1 the finite splitting scheme has dimension zero and is treated separately.
- A symbol containing an ℓth-power entry is zero, so the nonzero-symbol existence theorem is inapplicable. Its splitting property alone would not force the stated ν characteristic number.
- On an ℓ-special field every nontrivial finite degree is an ℓ-power; a prime-to-ℓ finite extension is therefore the identity. The norm reduction must still allow degree ℓ rather than assuming a rational point.
- The DN statement at r=1 retains the condition ℓ∤m. If m=ℓ its degree conclusion is unavailable, and a characteristic-number comparison modulo ℓ² detects the failure.
- The degree formula for identity f has zero difference; a nondominant equal-dimensional f has degree zero. At r=1 a ν_n-variety has nonzero t_{d,1}; on a product these nonzero values multiply, while an ℓ-divisible zero-cycle degree alone does not specify the required fibre tower.
- In the induction the input has weight n−1 and the constructed splitting variety has dimension ℓ^{n−1}−1. The chain-lemma bundle of dimension ℓ^n−1 belongs to the next construction and cannot be substituted without changing the indices.

### 6.5 Čech motives and the Rost summand

Define `cechMotive X` using X^{n+1}, projection faces and diagonal degeneracies, its augmentation to the unit, and its reduced suspension. A rational point contracts it; a degree-e point annihilates the reduced cohomology by transfer. With Z_(ℓ) coefficients its augmentation is a motivic equivalence precisely when X has a zero-cycle of degree prime to ℓ. For nonempty X it is an étale-motivic equivalence. Define DM_𝒳 as the objects N for which N⊗M(𝒳)→N is an isomorphism, when 𝒳 is embedded. Require the tensor-ideal property, the right adjunction for tensoring with M(𝒳), and the criterion that M(Y) lies in this category iff its structure map factors through M(𝒳). For a symbol use the Čech scheme of the union of its smooth splitting schemes; then M(Y) belongs precisely when Y splits the symbol. (Voevodsky, *Motivic cohomology with Z/2-coefficients*, Lemma 7.3 and Appendix B, Lemmas 9.2–9.3, pp.96,100–102; *Motives over simplicial schemes*, Lemmas 6.9,6.11,6.18, preprint pp.20–24; *On motivic cohomology with Z/ℓ-coefficients*, §6, pp.34–35.)

For n≥2, put b=(ℓ^{n−1}−1)/(ℓ−1). Given δ∈H^{n,n−1}(𝒳,F_ℓ) with Q₀⋯Q_{n−1}δ≠0, let μ=β_integral Q₁⋯Q_{n−2}δ∈H^{2b+1,b}(𝒳,Z_(ℓ)). Construct the triangle 1_𝒳(b)[2b]→M→1_𝒳→μ1_𝒳(b)[2b+1] and M_i=S^iM for i<ℓ via the averaging projector. Require both filtration triangles, rational splitting M_i⊗Q≃⊕_{j≤i}Q(jb)[2jb], and the operation obtained at i=ℓ−1. Its value on H^{2m+1,m} is cβP^m for one c∈F_ℓ×; the nonzero scalar is part of the theorem. Construct λ:M(X)→M_{ℓ−1}, its dual, and the projector Dλ(λDλ)⁻¹λ on M(X). Its image is the generalized Rost motive, with the restrictedness and internal-duality conclusions needed in the induction. Finally compare M(𝒳) with M(Č(X)). (Voevodsky, Lemma 3.1, Theorem 3.8, triangles 5.3,5.5–5.6, Lemmas 5.7,5.11,5.15, Theorem 5.16, Corollary 5.17 and Proposition 5.18, preprint pp.13–19,24–32.)

**Checks.**

- Č(Spec k) is contractible; Č(∅) is not augmented-equivalent to the unit. The nonempty hypothesis in the étale assertion is essential.
- A degree-ℓ splitting point does not give a prime-to-ℓ zero-cycle and does not contract the ℓ-local Čech motive.
- S⁰M=1_𝒳 and S¹M=M. The construction never averages with 1/ℓ!, which is unavailable in Z_(ℓ).
- For ℓ=2, the Rost motive is M itself and has the two rational Tate summands 1 and Q(b)[2b]. The projector squares to itself because λDλ is inverted, rather than simply taking Dλλ.
- A zero scalar c would make the symmetric-power operation comparison unusable; the theorem explicitly gives a unit.

### 6.6 The induction and the norm residue isomorphism

Define the graded ring map `normResidue` K^M_*(F)/m→⊕_nH^n(F,Z/m(n)) as the identity in degree zero and the iterated Kummer cup in positive degrees. Its API is uniqueness on degree-one generators, coefficient reduction, arbitrary extension restriction, finite-extension norms, products and the residue rule ∂h_n=(−1)^{n−1}h_{n−1}∂^M. The Steinberg relation of 3.1 proves well-definedness; the diagonal cycle comparison of 4.4 and 5.5 identifies it with change of topology. (Weibel, III.6.10, pp.242–243, and VI.Theorem 4.1, pp.480–481; Voevodsky, §6, preprint pp.33–42.)

Let H90(q,ℓ) mean H^{q+1}_L(F,Z_(ℓ)(q))=0 for every field F over the base. Under H90 in weights ≤w, prove that the cone of Z(w)→τ_{≤w+1}Rπ_*π*Z(w) is zero after ℓ localization. Consequently integral comparison is an isomorphism in degrees p≤q+1 and injective at q+2, while finite comparison is an isomorphism for p≤q and injective at q+1. Establish the exact cyclic Milnor Hilbert 90 row K^M_q(E) --1−σ→ K^M_q(E) --N→ K^M_q(F), and the dense-open invariance of the comparison cone under the lower-weight hypothesis. The proof uses purity, field detection and the coniveau sequence, with no assumption that the conclusion already holds in weight w. (Voevodsky, *Motivic cohomology with Z/2-coefficients*, Theorem 6.6, Corollaries 6.9–6.10 and Lemmas 6.11–6.13, pp.90–94.)

Assume H90(q,ℓ) for q<n over all characteristic-zero fields. For each nonzero weight-n symbol construct δ with the nonvanishing Q-chain, prove the reduced Čech vanishing for q≤n−1,p≤q+1, and use the Rost motive to prove H^{n+1,n}(𝒳,Z_(ℓ))=0. The exact restriction row from this group to H^{n+1,n}_L(k,Z_(ℓ)) and then to k(X) makes the last restriction injective. Successively adjoining splitting fields and using continuity proves H90(n,ℓ) for every characteristic-zero field. Descend from adjoining μ_ℓ by prime-to-ℓ transfer. Finally the positive-characteristic passage gives, for every field F with ℓ≠char F and every n≥0, the isomorphism K^M_n(F)/ℓ≃H^n(F,Z/ℓ(n)). (Voevodsky, *On motivic cohomology with Z/ℓ-coefficients*, Lemmas 6.4–6.9, Proposition 6.11, Theorems 6.1,6.16–6.17, preprint pp.33–42; *Motivic cohomology with Z/2-coefficients*, proof of Theorem 7.4, pp.96–97.)

**Checks.**

- n=0 is Z/m→Z/m, not the zero map. At n=1 the comparison is precisely Kummer, including the kernel of mth powers.
- At n=2 it agrees with 3.2 under Matsumoto. Thus the real class {−1,−1} survives at 2 and the odd-modulus residue remains negative.
- For a separably closed field and n>0 both sides modulo ℓ vanish. At m=1 every graded component is zero, including degree zero.
- The induction hypothesis ranges over extensions such as k(X), not only the original field. Using existence of norm varieties after assuming the weight-n theorem would make this proof circular.

### Examples

The conic for a quaternion symbol supplies the first positive-dimensional norm variety at 2 and has s₁=2. A nonsquare a in weight one gives a degree-two scheme instead of a geometrically integral conic. The calculation Sq²Sq²=τSq³Sq¹ over C shows why motivic operations remain different from topological operations even after ρ vanishes. The formula βP¹=P¹β−Q₁ at an odd prime fixes the operation convention used in constructing μ and the Rost projector.

### Dependencies

Layers 1,3–5; MotivesAndAlgebraicCycles' stabilized category after cancellation; the all-length Pfister splitting successor of QuadraticFormInvariants; local unstable representability, stable degree-map duality and the DN characteristic-number comparison as specified above. The induction is by weight and uses only lower-weight norm residue in norm-variety existence. No arithmetic spectral sequence or regulator theorem is an input.

## Layer 7: logarithmic symbols in characteristic p

### 7.1 Absolute logarithmic one-forms

For every field F define `logOne` on F× by u↦u⁻¹du in Ω_{F/Z}. Prove `logOne_mul`, `logOne_inv`, `logOne_pow` and compatibility with the universal derivation. The map is additive when the multiplicative source is written additively. Under a Z-algebra map f:F→E, the supplied semilinear map on differentials sends logOne(u) to logOne(fu). Require `logOne_natural` for arbitrary field maps, including nontrivial endomorphisms; no F-linearity of this pullback is asserted. (Weibel, III.7, differential symbol and Lemma 7.7, pp.250–251.)

**Checks.**

- logOne(1)=0 and logOne(u⁻¹)=−logOne(u). Zero has no preimage in the unit domain.
- In F_p(t), logOne(t)=t⁻¹dt≠0 while logOne(t^p)=0. Thus this is not the zero map on an imperfect field.
- Frobenius pullback on Ω_{F_p(t)/Z} kills dt and logOne(t). It sends a scalar through Frobenius, so treating it as an arbitrary F-linear pullback gives the wrong functoriality.
- The composite with every F-linear map out of Ω agrees with u⁻¹D(u) for the corresponding derivation D. This distinguishes the construction from an abstract group map with the same kernel.

### 7.2 Tensor symbols and the Steinberg quotient

For n≥0 define `logSymbol` on n units as their ordered logarithmic wedge in Ω_F^n. In the Lean companion this is represented in the existing exterior algebra via `ExteriorAlgebra.ιMulti`; the image belongs to exterior degree n. Extend by the tensor universal property over Z to `tensorDifferentialSymbol`. Require `logSymbol_steinberg`: if two distinct entries sum to 1, their differentials are negatives of one another and the wedge is zero, also at p=2. Factor uniquely through the tensor/Steinberg presentation of K^M_n(F) to `milnorDifferentialSymbol`. Require `symbol_onPureTensor`, the empty-wedge identification with 1∈F, multilinearity, alternation of the *forms*, Steinberg vanishing, uniqueness, arbitrary field-map naturality and product compatibility dlog(xy)=dlog(x)∧dlog(y) with the given order. The Milnor source is not itself an exterior algebra on F×. (Weibel, III.Lemma 7.7, pp.250–251; Bloch–Kato, §2, p.113.)

**Checks.**

- The empty tuple has value 1 in exterior degree zero, whereas a tuple containing the unit 1 in positive degree has value zero.
- A repeated entry gives zero in the exterior algebra, not just a class killed by 2. In particular `logSymbol ![u,u]=0` remains valid in characteristic two.
- For a+b=1 with both units, da∧db=da∧(−da)=0. This supplies an actual Steinberg calculation rather than using the quotient relation to define the target.
- On F_p(s,t), logSymbol(s,t)=s⁻¹t⁻¹ds∧dt is nonzero and changes sign when the entries are interchanged; at p=2 the alternation statement still holds.
- Multiplication of a degree-zero integer class with a positive-degree symbol acts by the corresponding repeated addition, as required by the ring map.

### 7.3 Cartier kernels and the mod-p comparison

Now assume char F=p>0. The characteristic annihilates every Ω_F^n, including n=0, so the differential symbol factors through k_n(F)=K^M_n(F)/p. Write B_F⁰=0 and B_F^n=dΩ_F^{n−1} for n>0 as additive subgroups. Using the supplied inverse Cartier, define `artinSchreierDifferential` wp=C⁻¹−projection:Ω_F^n→Ω_F^n/B_F^n. Require additivity, naturality and the formula

```text
wp(x dlog a₁∧⋯∧dlog a_n)=[(x^p−x)dlog a₁∧⋯∧dlog a_n].
```

Define `logarithmicForms` ν_n(F)=ker wp as an additive subgroup and `modPLogarithmicSymbol`:k_n(F)→ν_n(F) by the already constructed differential symbol. API: kernel membership, underlying-form evaluation, factorization through reduction, naturality, wedge product and compatibility with the degree-zero prime-field inclusion. Neither B_F^n nor ν_n is in general an F-submodule. (Weibel, Definition III.7.7.1 and Theorem 7.7.2, p.251; Bloch–Kato, §2, pp.113–114.)

Prove the initial calculations independently of the general theorem: ν₀(F)=F_p and k₀(F)=Z/p with the evident isomorphism; if F is perfect then Ω_F^n=0 and k_n(F)=0 for n>0, the latter by extracting a pth root of a symbol entry. In weight one prove `logOne_eq_zero_iff`, namely ker(logOne)=(F×)^p, equivalently injectivity k₁(F)→ν₁(F), for every field without a perfection or finite-p-basis assumption. (Bloch–Kato, §2, Theorem 2.1 and the perfect-field initial calculation in Corollary 2.2.1, pp.113–114; Weibel, III.Theorem 7.7.2, p.251.)

**Checks.**

- In weight zero wp(x)=x^p−x and its kernel is precisely the prime field; it is generally smaller than F.
- In F_p(t), wp(t dlog t)=(t^p−t)dlog t modulo exact forms, whereas wp(dlog t)=0. Multiplication by arbitrary elements of F does not preserve the kernel.
- For perfect F, positive-degree logarithmic groups vanish, but ν₀=F_p remains nonzero.
- In characteristic two, the Steinberg and kernel calculations use da∧da=0, not division by 2.
- In F_p(t), t is not a pth power and logOne(t)≠0. This rejects an injectivity statement whose source was inadvertently quotiented by all units.

### 7.4 The Bloch–Gabber–Kato theorem and its proof inputs

For every characteristic-p field F and every q≥0 prove `blochGabberKato`:k_q(F)≃ν_q(F), naturally for field maps and compatibly with products. The proof separates logarithmic generation from injectivity. For q≥1, a finite ordered p-basis and F×=(F×)^(p−1), order the increasing q-tuples lexicographically and let Ω^q_{F,<s} be the span of earlier logarithmic basis wedges. Prove `logarithmicLeadingTerm_eliminate`: if a≠0 and (a^p−a)ω_s lies in Ω^q_{F,<s}+dΩ_F^{q−1}, then aω_s is, modulo Ω^q_{F,<s}, a wedge of q logarithmic differentials. The entries can be taken in F^p(b_j:j≤s(i))×. Induct on q and on the leading tuple, using Cartier's degree-one theorem and the degree-p purely inseparable linear-functional lemma. (Sobiech, Proposition 1.3, preprint v1 p.3, with the lexicographic filtration p.2; Kurihara–Fesenko, §A2.1, Proposition, p.37, and proof, pp.38–40.)

For `logarithmicGeneration_primeToDescent`, pass to the tower adjoining (p−1)st roots until that power map is onto. Every finite subextension has degree prime to p, and norm/trace makes restriction injective on the symbol cokernel. Finite-p-basis generation there, followed by filtered-colimit descent, proves generation over arbitrary F. This does not solve arbitrary Artin–Schreier equations by prime-to-p extensions. Injectivity uses Bloch–Kato's relative elimination, pure-transcendental induction and specialization. (Kurihara–Fesenko, §A2.1, pp.37–38; §A2.2, p.40; Bloch–Kato, Theorem 2.1, Lemma 2.2, Diagram 2.3.1, Proposition 2.4 and Lemma 2.5, pp.113–118; Weibel, III.Theorem 7.7.2, p.251.)

The surjectivity input is logically distinct in the original proof: Bloch–Kato cite Kato's differential calculation rather than proving it in their Theorem 2.1. Its formal interface `logarithmicGeneration` is: every ω with C⁻¹ω=[ω] is a finite sum of logarithmic wedges with F_p coefficients. The symbol map commutes with field embeddings and norm/trace; no functorial choice of p-basis or expression is required. No p-basis finiteness restriction belongs to the final theorem. (Bloch–Kato, opening of §2 and proof after Theorem 2.1, p.113; Kurihara–Fesenko, §A2.1, pp.36–40.)

The relative elimination used for injectivity has a more specific statement. Let R be a semilocal Dedekind ring essentially of finite type over a perfect characteristic-p field, K its fraction field and I its radical. Let k_q(R) be the unramified subgroup of k_q(K), and put k_q(R,I)=ker(k_q(R)→k_q(R/I)); define ν_q(R,I) by the analogous differential restriction kernel. Choose the p-basis and its ordered increasing q-tuples as in Bloch–Kato, with first entries units giving a p-basis modulo I and last entry of valuation prime to p at every maximal ideal. Write ω_s for the corresponding dlog wedge and Ω^q_{K,<s} for earlier wedges. If a∈I and (a^p−a)ω_s∈Ω^q_{K,<s}+dΩ_K^{q−1}, there is a finite succession of Galois extensions K'/K of total degree prime to p such that, for the normalization R' and radical I', a symbol {y₁,…,y_q} lies in k_q(R',I'), its wedge α lies in ν_q(R',I'), and aω_s−α∈Ω^q_{K',<s}∩Ω^q_{R',I'}. Require `relativeLeadingTerm_eliminate`, `relativeSymbol_normTrace` and the leading-tuple induction proving k_q(R,I)→ν_q(R,I) surjective. Norm/trace descent uses invertibility of [K':K] modulo p. The relative specialization diagram and pure-transcendental argument then give field injectivity. This relative lemma does not by itself replace the separate logarithmic-generation theorem. (Bloch–Kato, Diagram 2.3.1, Proposition 2.4 and Lemma 2.5, pp.114–116.)

**Checks.**

- In degree zero the symbol is Z/p→F, 1↦1, and its image is exactly the solutions of x^p=x. It is not an F-linear isomorphism to F unless F=F_p.
- For q=1, the kernel of dlog is F×p; on F_p(t) the leading form dlog t survives. On a perfect field all positive-degree symbols modulo p vanish.
- The relative construction requires a∈I and a symbol specializing to zero. An unrestricted field symbol need not lie in this relative kernel and cannot be inserted in its diagram.
- The degree of K'/K is prime to p, so trace composed with restriction is invertible modulo p. A degree-p extension would not justify the descent.
- Over F_p, X^p−X−1 has irreducible degree p: its root lies in no finite extension of degree prime to p. The generation argument adjoins (p−1)st roots for its auxiliary linear-functional lemma; it cannot replace this polynomial by a generically solvable prime-to-p equation. At p=2 that root tower is the identity.
- An infinite p-basis causes no infinite sum: any differential and any finite symbol uses finitely many entries, and continuity supplies the final passage.

### 7.5 Witt symbols and the coefficient-row induction

For r≥1 define `wittLogarithmicSymbol` h_r:K^M_q(F)/p^r→H⁰_et(F,W_rΩ^q_log) by the wedge of logarithmic differentials of Teichmüller units; in degree zero send 1 to 1∈Z/p^r. The target is the genuine étale logarithmic de Rham–Witt sheaf of the crystalline supplier, independently of the symbol image. Require `wittSymbol_onSymbol`, reduction, naturality, product and the comparison h₁ with 7.4. The crystalline coefficient contract includes Illusie's pro-object reduction theorem and its logarithmic differential criterion; it is not a claim that his Corollary 5.7.5 already proves norm residue. (Bloch–Kato, Corollary 2.8, pp.117–118; Illusie, I §5.7, Corollary 5.7.5 and Proposition 5.7.9, pp.596–598.)

For an arbitrary abelian group A, first prove the right-exact row C₁→C_r→C_{r−1}→0, C_r=A/p^rA, whose first map is [a]↦[p^{r−1}a]. Its kernel is (A[p^{r−1}]+pA)/pA. On the Tor terms the reduction A[p^r]→A[p^{r−1}] is multiplication by p. Compare this row with the logarithmic Witt coefficient row. By induction from 7.4 prove h_r bijective and *then* deduce injectivity of the first Milnor coefficient map in this special setting. It also follows that the p-primary torsion of K^M_q(F) is p-divisible. This conclusion asserts neither its vanishing nor divisibility of all of K^M_q(F). (Bloch–Kato, proof of Corollary 2.8, pp.117–118.)

**Checks.**

- q=0 gives Z/p^r≃Z/p^r and the first coefficient map sends 1 to p^{r−1}, not to 1.
- For A=Z/p and r=2, the proposed first map C₁→C₂ is zero. Thus short exactness for arbitrary A would be false.
- At r=1, h_r is precisely the Cartier-kernel symbol, not a new map to a separately defined image subgroup.
- In F_p(t), dlog[t] is nonzero after reduction to r=1. Perfect fields instead have zero logarithmic Witt groups in positive degrees.
- The Tor map from A[p²] to A[p] sends a to pa; an identity map would violate the coefficient triangle.

### 7.6 Prime powers away from the characteristic and continuity

For ℓ≠char F and r≥1, use the mod-ℓ norm residue theorem, its resolution-free motivic comparison, and the derived coefficient triangles to prove K^M_q(F)/ℓ^r≃H^q(F,Z/ℓ^r(q)) for all q≥0. Construct the comparison as a map of coefficient triangles and identify its Bocksteins. The relevant twist is T_q/ℓ^r with the reductions of Layer 1; no tensorwise inclusion of roots is substituted for a coefficient inclusion. The field-to-sheaf implication uses Geisser–Levine's resolution-free theorem, not the older Suslin–Voevodsky proof with its resolution hypothesis. (Weibel, VI.Theorem 4.1, pp.480–481; Kahn, Theorem 2.34 and Corollary 2.38(a), pp.609–612, reproving the resolution-free Geisser–Levine theorem; Geisser, proof of Theorem 1.2, pp.787–789.)

Prove filtered-colimit compatibility of Milnor quotients, finite Galois cohomology, differential modules and their Cartier kernels, and logarithmic Witt étale sections for a filtered union of fields. Symbol maps commute with these identifications. For a purely inseparable E/F in characteristic p, restriction on Milnor quotients and Galois cohomology is an isomorphism when the modulus is prime to p, using norms and pure inseparability on the two sides. In characteristic p the Cartier and Witt comparisons use their own continuity, not an assertion of prime-to-p invariance for p-coefficients. (Bloch–Kato, §2 after Theorem 2.1, p.113; MVW, Lemma 3.9, p.23; Geisser, Lemma 2.1, published pp.775–776.)

**Checks.**

- An algebraic closure is the filtered union of its finite subextensions; every fixed finite symbol and every equality between such symbols descends to a finite stage.
- For F_p(t)⊂F_p(t^(1/p)), restriction modulo an integer prime to p is invertible by the degree-p norm relation.
- The same extension kills the degree-one mod-p class of t after restriction. Thus the prime-to-p invariance is false at modulus p.

### Examples

Over F_p(s,t), the two-symbol {s,t} modulo p is detected by s⁻¹t⁻¹ds∧dt. Over a perfect field the same positive-degree target is zero, while the degree-zero comparison is always the nonzero prime field. The group A=Z/p in the coefficient-row example is the negative control for a naive prime-power induction. The Lean companion fixes the concrete logarithmic forms, repeated-entry alternation and the absolute-base convention; the Cartier and Witt constructions retain their independent geometric definitions.

### Dependencies

Layers 4–6 for prime-to-characteristic comparison; K2SymbolsBrauer's Milnor tensor/Steinberg presentation; Mathlib's Kähler differentials and exterior algebra; Tau Ceti's semilinear map; DerivedDeRhamCohomology's ordinary differential and Cartier theorem; CrystallineCohomology's logarithmic de Rham–Witt sheaves and coefficient sequences. The characteristic-p field proof is independent of norm varieties. Its p-basis generation input is the additional explicit target in 7.4.

## Layer 8: the actual homotopy coniveau tower

### 8.1 Facewise supports and support spectra

Let X be smooth separated of finite type over a perfect field k. Define `admissibleSupports X p n` as the inclusion poset of closed W⊂X×Δ^n meeting X×F in codimension at least p for every nonempty face F, including Δ^n. Impose the condition on each component of X; empty intersections satisfy it. For a finite set C of locally closed pure-codimension strata and e:C→N, define `constrainedSupports` by codimension at least p−e(C) within C×F, with nonpositive bounds vacuous. For finitely many f_i:Y_i→X define `mapAdaptedSupports` by also requiring every inverse image to be admissible. API: finite-union upper bounds, shrinking supports, face/degeneracy pullback, constraint monotonicity and common refinements. On an affine chart with face ideal I_τ=(t_i:i∉τ), admissibility is equivalent to height at least p for every prime of R/I_τ containing the image of the support ideal. (Levine, *The homotopy coniveau tower*, §2.1 and §4.1, preprint pp.9–11,22; *Chow's moving lemma*, Definitions 2.3.1,2.6.1, pp.9–13.)

For a presheaf E of fibrant spectra, zero on ∅ and taking finite disjoint unions to products, use E^W(Y)=fib(E(Y)→E(Y\W)). Define

```text
E^(p)(X,n)=hocolim_{W∈admissibleSupports(X,p,n)} E^W(X×Δ^n),
E^(p)(X)=|n↦E^(p)(X,n)|,       L_E^p=cofib(E^(p+1)→E^(p)).
```

Require support enlargement, the simplicial structure, derived realization, tower transitions, adjacent layer triangles, adapted-support maps and the augmentation E(X)→E^(0)(X). For E=K use the actual nonconnective perfect-complex K-spectrum and its localization equivalence to K(Y on W). No K-group or E₂ page is part of the definition. (Levine, *The homotopy coniveau tower*, §§2.1–2.2, pp.9–12; *K-theory and motivic cohomology of schemes, I*, §3, pp.12–14.)

**Checks.**

- At p=0 every closed support is admissible, including all of X×Δ^n. At n=0 the condition is the ordinary support codimension.
- For X=Spec F and p>n, the support poset contains only ∅ and its supported value is zero. The realized tower can nevertheless have terms in arbitrarily high simplex degree.
- A divisor lying in the face t₀=0 fails admissibility for p=1 on that face; testing height only in the ambient simplex would accept it incorrectly.
- For X=∅ the tower is zero. For a disconnected X, a bad support on one component cannot be hidden by a dimension computation on another.
- For a closed immersion f, a support admissible on X can have inadmissible inverse image on Y. Thus map-adapted supports are a substantive restriction.

### 8.2 Moving, localization and coherent functoriality

For E A¹-invariant and Nisnevich excisive, with the finite-field transfer property when k is finite, prove that inclusion of the constrained tower is a Nisnevich-local equivalence; on an affine open it is an equivalence of realized spectra. For finitely many maps move supports into simultaneous good position. This is an equivalence after realization, not cofinality of the original support posets. For K, verify the axioms using the existing A¹ and Nisnevich theorems and supported connectivity. The finite Galois extension comparison after inverting its degree is carried out with supports; descent through auxiliary extensions of coprime degrees returns an integral theorem over finite perfect fields. (Levine, *Chow's moving lemma*, Theorem 2.6.2, Proposition 3.3.4 and §4.1, pp.13–27; *The homotopy coniveau tower*, Theorems 4.1.1,6.4.1, pp.20–22,35–36.)

For j:U=X\Z→X define E_Z^(p)(X) by the same admissible supports constrained to Z×Δ^n. Prove its fibre sequence into E^(p)(X)→E^(p)(U), étale excision for maps inducing an isomorphism over Z, and the resulting layer localization, Nisnevich descent and Zariski Mayer–Vietoris. On finite-dimensional noetherian X the tower agrees with derived Zariski sections. Prove towerwise A¹ invariance and E≃E^(0). (Levine, *The homotopy coniveau tower*, Theorem 3.2.1 and Corollary 3.2.2, pp.14–18; *Chow's moving lemma*, Theorem 3.3.5, pp.24–25.)

Construct `functorialConiveauTower` on all of Sm/k using the moving equivalences together for all p and all finite diagrams. For f:Y→X the map is represented by E^(p)(X)←E^(p)(X)_f→E^(p)(Y). Require identities, composition, coherent comparison of choices, transition naturality and compatibility of every layer triangle. For K the p=0 map is derived pullback of perfect complexes. The comparison maps are a coherent tower, not separately chosen group maps. (Levine, *The homotopy coniveau tower*, Theorem 4.1.1, pp.20–22; *Chow's moving lemma*, Theorems 7.4.1,7.5.6 and Corollary 7.5.7, pp.47–58.)

**Checks.**

- A chain Z⊂X with empty U gives the identity supported term. For Z=∅ its supported term is zero and restriction to U=X is the identity.
- Two composable closed immersions are treated by a common adapted support family; composing two unrelated inverses to moving equivalences is not the construction.
- Projection X×A¹→X gives an equivalence of the entire tower, including its transitions and layer boundaries.
- The finite-field argument uses two auxiliary extension degrees with gcd 1. Inverting just one degree would prove only a localized result.

### 8.3 Semilocal simplexes and well-connectedness

For a field F/k define `semilocalSimplex F n` by localizing F[t₀,…,t_n]/(Σt_i−1) at the functions nonzero at every vertex. Its multirelative boundary object is the total homotopy fibre of the punctured cube of all faces. Require continuity from smooth neighborhoods, the induced face maps and compatibility with iterated fibre constructions. The fibre of restriction to the closed union V(t₀⋯t_n) is a different object unless a closed-descent theorem identifies it with this cube. Define Ω_T E(Y)=E^{Y×0}(Y×P¹). A `wellConnectedTheory` satisfies supported connectivity and concentration in degree zero of (Ω_T^dE)^(0/1)(F) for every d≥0 and finitely generated F/k, with coefficient group π₀Ω_T^dE(F). API: the coefficient map, functoriality in E and F, and the T-loop tower comparison. (Levine, *The homotopy coniveau tower*, Definition 3.3.1, §5.1, Definition 6.1.1 and Lemma 6.1.3, pp.18–19,26–27,30–31.)

For a smooth closed immersion Z→X of codimension d with a trivialized normal bundle, prove E_Z^(p)(X)≃(Ω_T^dE)^(p−d)(Z), naturally for trivialized pairs. In particular the zero section in Y×P¹ identifies the shifted tower with Ω_T of the tower. A nonpositive level is interpreted as level zero, while a negative *layer* is zero. The trivialization is part of the purity data. Prove the criterion for well-connectedness: π₀((Ω_T^dE)(Δ^n_{0,F},∂))=0 for n≥1, every d≥0 and finitely generated F. It is a statement about π₀ of the total face fibre, not concentration of that entire fibre in degree zero. (Levine, Theorem 3.3.4, Proposition 4.2.2 and Proposition 6.3.4, preprint pp.19–20,24–25,34–35.)

For K prove this criterion using semilocal K-theory and the projective-bundle equivalence Ω_T^dK≃K. Normalize the rank-one coefficient to +1. Obtain (Ω_T^dK)^(0/1)(F)≃HZ. Prove also the tower idempotence for 0≤a≤b, (E^(a))^(b)≃E^(b)≃(E^(b))^(a), and layer orthogonality L^a_{L_E^b}=0 for a≠b and L_E^b for a=b, applied to the functorial *presheaf* tower. (Levine, Lemma 5.2.1, Propositions 5.2.2–5.2.3, Theorem 5.3.1 and Theorem 6.4.1, pp.27–29,35–36.)

**Checks.**

- At n=1 the semilocal ring retains both vertices 0,1. Localizing only at one vertex gives a different relative problem.
- At n=0 the multirelative object is the value at Spec F; the vanishing criterion starts at n=1 and does not force K₀(F)=0.
- Rank sends the class of O to +1. Using the negative orientation would reverse the generator in every cycle layer.
- K(F) has higher homotopy in general; only its zeroth coniveau layer is HZ.
- At p<d the supported *layer* in the purity formula vanishes, whereas level-zero support information may remain. Confusing levels with layers fails this test.

### 8.4 Pointwise ranks and the cycle-layer equivalence

Apply idempotence to obtain a simplicial point model B_X^p with realization L_K^p(X) and degree-n decomposition as the wedge of (Ω_T^pK)^(0/1)(k(x))≃HZ over codimension-p points whose closures are admissible. Define `pointwiseCycleMap` by rank on each coefficient and the inclusion of the actual cycle generator [closure{x}]. Require support compatibility, rank normalization, pointwise equivalence and degeneracy maps. Then prove face compatibility from the supported K-theory maps. For a proper face intersection at y its coefficient is

```text
Σ_i (−1)^i length Tor_i^(O_{X×Δ^n,y})(O_W,y,O_{X×F,y}).
```

This finite Euler characteristic equals the cycle intersection multiplicity. It is not assigned as the definition of the K-theory face map. Consequently the simplicial comparison realizes to `coniveauCycleLayer`:L_K^p(X)≃H(z^p(X,•)), with π_m=CH^p(X,m)=H^{2p−m}_M(X,Z(p)) for m≥0 and π_m=0 for m<0. Require compatibility with the functorial tower pullbacks, open restriction and supported localization. (Levine, Corollary 5.3.2, Theorem 6.4.2 and equation 6.4.1, preprint pp.29–30,36–37.)

**Checks.**

- A transverse reduced face intersection has Tor only in degree zero and coefficient +1. An intersection of length e has coefficient e, not one.
- If the derived intersection has two nonzero Tor terms, the coefficient is their length difference. Summing lengths without signs is incorrect.
- A codimension-p point gives the genuine admissible cycle generator, so the coefficient map is the identity Z→Z there.
- For X=Spec F,p=0, the zero layer is HZ. For a field and p=1, its π₁ is F× via CH¹(F,1), testing the homological indexing.

### 8.5 Global coherent models and the Friedlander–Suslin comparison

For Y_n=X×Δ^n define `faceExactCoherent Y_n` to consist of coherent sheaves whose positive Tor with every face vanishes. Ordinary face restriction is exact on this exact category; degeneracies are flat. Define its supported spectrum as the fibre of K(Coh_∂(Y_n))→K(Coh_∂(Y_n\W)), then the admissible-support homotopy colimit and derived realization. Require exact restriction, support enlargement, coherent strictification and generic-length cycle maps. For smooth quasiprojective X prove degreewise supported Cartan equivalence from perfect-complex K to this model and an equivalence of whole towers after realization and after Zariski derived sections. (Levine, *K-theory and motivic cohomology of schemes, I*, §2.2, Remark 2.3, Lemma 3.3, Remark 3.4 and Appendix B.2–B.9, pp.8–9,13,81–84.)

Compare further with the Friedlander–Suslin tower of bounded complexes of their big vector bundles, whose cohomological supports lie in the facewise admissible family C^p(X,n). Construct the supported equivalence before the filtered colimit, preserve every transition and the K augmentation, and identify the generic-length cycle map. Their global cycle layer is related by the sheafwise quasi-isomorphism zigzag

```text
z^p(−,•) → z^p(−×A^p,•) ← C_* z_equi(A^p,0).
```

After derived Zariski sections this gives H(RΓ_Zar(X,Z(p))[2p]). Use all the deloopings of their layer prespectrum; do not insert an additional suspension from its first delooping B. The result is a filtered comparison of towers, from which the spectral-sequence comparison follows. (Friedlander–Suslin, §5 equations 5.0.1–5.0.2, §6 equation 6.0, Proposition 12.1, Corollary 12.2, Proposition 13.10 and Appendix C.4–C.7, pp.794,798,829–830,837–838,866–867.)

**Checks.**

- A vector bundle is face-exact; a sheaf supported entirely on a face generally has nonzero Tor there and is rejected.
- The structure sheaf of a reduced integral admissible support has generic length one; a generic length-e sheaf maps to e times its cycle.
- At p=0 the global comparison agrees with the original K-spectrum augmentation.
- With the shift [2p], π_m is H^{2p−m}(X,Z(p)); an additional delooping would incorrectly send K₁ of a field's weight-one layer to cycle degree zero.

### 8.6 Exact couples, indexing and convergence

Construct the exact couple of the actual tower, with D₁(p,m)=π_mK^(p)(X) and E₁(p,m)=π_mL_K^p(X). Its connecting map goes to (p+1,m−1); its native differential d_s goes (p,m)→(p+s,m−1). Under (a,b)=(p−m,−p) and r=s+1 obtain

```text
E₂^(a,b)=H_M^(a−b)(X,Z(−b)) ⇒ K_(−a−b)(X),
d_r:E_r^(a,b) → E_r^(a+r,b−r+1).
```

Require comparison of exact couples under filtered maps and coefficients, the filtration on the actual abutment, edge maps, and the boundary-sign comparison with cycle localization. For dim X=d, prove π_mK^(p)(X)=0 for p>d+m. Use this separately in degrees m and m+1 to kill lim and lim¹, so holim_pK^(p)(X)=0 and the quotient tower cofib(K^(p)→K) has homotopy limit K. Thus the sequence converges strongly with a finite filtration in every fixed nonnegative K-degree. (Levine, *The homotopy coniveau tower*, §2.2 and §7.1, pp.12,38–39; Friedlander–Suslin, Theorem 13.13 and Proposition 13.17, pp.839–842.)

**Checks.**

- At p=0,m=0 the reindexing gives (a,b)=(0,0), and the field's weight-zero layer abuts to K₀. At p=1,m=1 it gives (0,−1) and motivic H¹(−,Z(1)).
- A native d₁ raises p by one and lowers m by one; its reindexed target is (a+2,b−1), so it is d₂ rather than d₁ on the displayed page.
- For dim X=0 and m=1 the tower vanishes for p>1; for a curve it vanishes for p>2. It need not vanish uniformly in m.
- Controlling degree m alone does not kill lim¹ in the Milnor sequence. The proof also invokes the bound in degree m+1.

### 8.7 Products and operations on the tower

Construct products by common good-position supports, exterior K-product and the simplicial shuffle. Require products of all transition triangles and, for u≥1, maps

```text
(F^p/F^(p+u))∧(F^q/F^(q+u)) → F^(p+q)/F^(p+q+u).
```

They are coherent for finite diagrams and agree on layers with the higher-cycle product, so the exact-couple pages have the motivic product and differential derivation sign (−1)^(total K-degree). Integral K acts on every coefficient version. A coefficient ring product is asserted only with a supplied compatible Moore-spectrum multiplication; do not make a natural ring out of K(−;Z/2). The safe prime-power graded-commutative coefficient range excludes 2,3,4,8; all moduli retain the module structure. (Levine, *K-theory and motivic cohomology of schemes, I*, §§11.2–11.8, pp.43–48, §§11.14–11.15, pp.51–52, Appendix C §§3–4, pp.90–91, Appendix D §§4–7, pp.94–96; Weibel, IV.2, coefficient-product discussion, pp.283–285.)

Construct higher Adams operations through their coherent finite-diagram models, not by declaring an integral operation on arbitrary stable spectra. On weight-j cycle layers ψ^a acts by a^j; it commutes with exact-couple boundaries. Hence (a^{j+r−1}−a^j)d_r=0. Rationally choose a>1 to obtain degeneration and, in fixed K-degree m, canonical Adams eigenspace projectors among finitely many weights 0≤j≤d+m. Prove the character isomorphism K_m(X)_Q^{(j)}≃H^{2j−m}_M(X,Q(j)) and agreement of the weighted gamma and homotopy-coniveau filtrations, each equal to the direct sum of weights ≥p. The gamma filtration uses products of gamma operations with their weights. (Levine, *K-theory and motivic cohomology of schemes, I*, §§12.5–12.12, pp.54–59, §§13.1–13.3, pp.59–61, Theorem 13.10 and Corollary 13.11, pp.65–68, Theorem 14.5, Lemma 14.6 and Theorem 14.7, pp.70–74.)

**Checks.**

- The rank-one unit in K₀ has weight zero and multiplies each layer by the identity; products of weights p and q land in weight p+q.
- For u=1 the quotient pairing is the cycle-layer product. For larger u, changing a lift by F^(p+u) changes the product by F^(p+q+u), which is zero in the stated quotient.
- With ψ² on weights one and two, the eigenvalues are 2 and 4. Their nonzero difference kills the relevant rational differential, whereas over finite coefficients that difference need not be invertible.
- The excluded moduli 2 and 4 retain their integral-K module action. No commutative coefficient-ring product is inferred for them.

### Examples

For a field, weight zero contributes K₀=Z and weight one contributes K₁=F×. On a smooth curve the dimension bound gives π_mK^(p)=0 for p>m+1, so the filtration is finite in each degree without making the whole tower finite. A transverse point in a face has rank coefficient +1; two nonzero Tor terms give an alternating length. These computations fix the cycle orientation, the layer shift and the differential degree independently.

### Dependencies

Layers 4–5 for cycles, moving, descent and transfer compatibility; SchemeKTheoryOperations for the actual supported K-spectrum, localization, Cartan comparison and operations; GeneralizedCohomology G2 for spectra, fibres and realizations, and StableHomotopyKTheory 7.24–7.29 for exact couples. The point-layer calculation precedes Adams operations and rational degeneration. Agreement of E₂ pages is a consequence of the filtered comparisons in 8.5, never their proof.

## Layer 9: normalized higher Chern classes and cycle edges

### 9.1 Universal classes and the additive higher character

Let k be perfect and X smooth quasiprojective of finite type over k, of dimension d. Construct `motivicChern j m` from the stable universal geometric class on BGL and evaluation on the actual K-space, with values in H_M^{2j−m}(X,Z(j)), for j≥1,m≥0. Use the projective-bundle relation on the simplicial universal bundle, Zariski descent and the comparison of the plus-construction and geometric K-space models. The API consists of `motivicChern_pullback`, `motivicChern_degreeZero`, `motivicChern_add_positive`, `motivicChern_units`, and `motivicChern_relative`: the last retains homotopies and supports before taking iterated fibres. For m>0 the operation is additive because its evaluation is on a suspension. For m=0 it obeys Whitney sum; c₂ is generally nonlinear. The convention c_{0,0}=rank is separate from the constant coefficient 1 of the total Chern series. Put c_{0,m}=0 for m>0. (Weibel, V.11.3–11.8, pp.452–455, Theorem 11.11, pp.457–459; Riou, Theorem 6.2.1.2, pp.31–32.)

Define `motivicChernCharacter j m` with rational coefficients. At m=0 consume the geometric Newton-polynomial character N_j(c₁,…,c_j)/j!, with weight-zero component rank. At m>0 set ch₀=0 and, for j≥1,

```text
a_j = (−1)^(j−1)/(j−1)!,       ch_{j,m} = a_j c_{j,m}.
```

The light definition `positiveChernFactor` has domain positive natural numbers and codomain Q. Its API is `positiveChernFactor_cancel`, a_j(−1)^{j−1}(j−1)!=1, and `positiveChernFactor_recurrence`, j a_{j+1}=−a_j for j≥1. There is no division by an integral factorial in integral motivic cohomology. In each fixed m the total character has only weights 0≤j≤d+m, by the dimension of X×Δ^m. Require Q-linearity, pullback naturality and extension to the relative K-spaces used below. The uniqueness theorem for operations represented on Z×Gr identifies this evaluation with the universal one; arbitrary homomorphisms on abstract K-groups do not suffice. (Weibel, V.11.11.1 and Lemma 11.13, pp.457–459; Riou, Proposition 6.2.2.1, Remark 6.2.2.3, Lemma 6.2.3.2 and Definition 6.2.3.9, pp.32–35.)

**Checks.**

- A trivial rank-r bundle has rank r and all positive Chern classes zero. For a line bundle L, c₁([L])=c₁(L) and c_j([L])=0 for j>1.
- On P², with h=c₁(O(1)), c₂([O(1)]+[O(1)])=h², although each summand has c₂=0. The character instead gives ch([O(1)])=1+h+h²/2 and is additive.
- On K₁(F)=F×, c_{1,1} and ch_{1,1} are determinant, not its inverse. On a Milnor degree-two symbol c_{2,2}({u,v})=−{u,v}, so ch₂ restores +{u,v}.
- The scalar values a₁=1,a₂=−1,a₃=1/2,a₄=−1/6 distinguish both the sign and the factorial. For degree-three symbols c₃=2 times the motivic symbol, and ch₃ is the symbol itself.
- The recurrence begins at j=1. Substituting weight zero into it would incorrectly identify a positive-degree convention with rank. On a field ch_{0,0}(r)=r but ch_{0,m}=0 for m>0.

### 9.2 Products, Adams weights and the inverse cycle construction

Prove `motivicCharacter_product`: for x∈K_m(X),y∈K_n(Y), the weight-j character of x×y is Σ_{u+v=j}ch_u(x)×ch_v(y), using the common cycle orientation. In particular on a field the composite K_j^M(F)→K_j(F)→H^{j,j}(F,Q) is the usual symbol, and ψ^a on its weight j is a^j. The unnormalized higher Chern product has its universal binomial and factorial coefficients; it is not an individual multiplicative map. The proof uses the universal tensor formula before looping, since products of lower universal classes vanish on one suspension but need not vanish on a product of suspensions. (Weibel, Theorem V.11.11 and Lemma V.11.13, pp.457–459; Levine, *K-theory and motivic cohomology of schemes, I*, §§11.2–11.8, pp.43–48, §§11.14–11.15, pp.51–52, §§12.5–12.12, pp.54–59.)

Construct `rationalCycleClass j m`:CH^j(X,m)_Q→K_m(X)_Q^{(j)}. Start with the multirelative K₀ class of the structure sheaf of an admissible cycle, with face-relative lifts and additivity relations, then take its Adams weight-j projection. A structure-sheaf class on the ambient space is not automatically a pure weight class. Relative K₀ here is the total homotopy fibre for the face diagram; merely imposing vanishing restrictions on K₀ does not provide the required boundary trivializations. The API includes `rationalCycleClass_boundary`, descent through cycle homology, rational linearity, pullbacks after moving, products and the weight-j image property. Prove ch_j∘cyc_j=id and ch_i∘cyc_j=0 for i≠j. Use the splitting principle and deformation to the normal cone to compare the supported universal class with the cycle generator. (Levine, *Bloch's higher Chow groups revisited*, Lemmas 2.1–2.2, pp.258–265, Theorem 3.1, pp.276–278, Theorems 3.3–3.4, pp.279–284.)

**Checks.**

- The reduced codimension-j generic cycle has coefficient +1. A length-e generic coherent module has coefficient e, as in the rank map of 8.4.
- In degree zero [O_Z] can have components of weights greater than codim Z. Projecting to weight j is essential; calling its raw class pure fails already for embeddings with nontrivial normal Chern classes.
- A degenerate cubical cycle maps to zero in normalized homology; its relative K-space homotopy is part of the construction, not an extra vanishing assertion about an unrelated K₀ class.
- For two weight-one unit classes the normalized product has coefficient +1. Using c₂ directly gives coefficient −1 and violates `motivicCharacter_product`.

### 9.3 Identifying the spectral-sequence comparison

Prove `coniveauEdge_eq_character`: the rational edge from the actual tower on its weight-j Adams summand equals ch_{j,m}, through the cycle-layer equivalence of 8.4. Conversely `rationalCycleClass` splits that edge. Compare the relative universal operation on the semilocal simplex to the pointwise rank map, extend by moving, and use the coherent tower naturality. This proves

```text
K_m(X)_Q^(j) ≃ H_M^(2j−m)(X,Q(j)),
K_m(X)_Q ≃ ⊕_(j=0)^(d+m) H_M^(2j−m)(X,Q(j)).
```

The isomorphism is the normalized character, not an unspecified rational vector-space isomorphism. The simultaneous Adams eigenspaces use ψ^a=a^j for all a≥2, with finite-weight interpolation projectors in fixed degree. Recover the weighted gamma filtration and the homotopy-coniveau filtration as the sum of the eigenspaces of weights at least p. The filtration on higher K-groups uses products of gamma operations with their total weight; an unweighted subgroup generated by single operations gives the wrong comparison. (Levine, *The homotopy coniveau tower*, Theorem 11.3.2 and Remark 11.3.4, pp.63–64; *K-theory and motivic cohomology of schemes, I*, §§13.1–13.3, pp.59–61, Theorem 13.10 and Corollary 13.11, pp.65–68, Theorem 14.5, Lemma 14.6 and Theorem 14.7, pp.70–74; Weibel, VI Example 4.9, pp.485–486.)

**Checks.**

- For a field at m=0 only weight zero occurs and the character is rank. At m=1 its weight-one component is the unit class.
- On P², the three rational K₀ weights are 0,1,2, and the character of O(1) is 1+h+h²/2.
- For distinct weights one and two, the ψ² projector uses the denominator 4−2. It exists rationally and is not an integral projector at the prime 2.

### 9.4 Supported localization and its normalization

Construct the supported character on the fibre K_Z(X), with its map to supported motivic cohomology, before identifying supports with the K-theory of a regular closed subscheme. It is natural for support enlargement, forgetting supports and the localization triangle. For a smooth immersion i:Z→X of codimension c, the cohomological localization boundary has degree

```text
H_M^a(U,Q(j)) → H_M^(a−2c+1)(Z,Q(j−c)).
```

Under purity the rational pushforward comparison includes the normal-bundle Todd factor. At the level of total supported character it is a map of the localization triangles; it is not a claim that an arbitrary purity identification commutes with each weight without this correction. In the divisor case on a smooth curve the normal line at each closed point has trivial positive rational Chern classes, so ∂_M ch_j=ch_{j−1}∂_K. Fix ∂_K(π)=+[k] for a DVR with uniformizer π and ∂_M(π)=+1 in H^{0,0}(k). In higher dimension the proper Riemann–Roch input remains with the K-theory owner, at its admitted generality. (Levine, *Bloch's higher Chow groups revisited*, §§2–3, pp.258–284; Weibel, V.11.11–11.14, pp.457–462; Levine, *K-theory and motivic cohomology of schemes, I*, localization and product constructions, §§3,11, pp.12–15,43–52.)

**Checks.**

- For a smooth curve and j=1,m=1, the square sends π to +1 on both sides. Rank is the weight-zero character on the residue K₀, so setting ch₀ identically zero fails.
- The standing Milnor boundary has ∂^M{u,π}={ū}, whereas the cohomological residue has ∂(κ(u)∪κ(π))=−κ(ū). The motivic comparison carries the same minus sign on this degree-two symbol. The Matsumoto comparison with the supplied K-boundary must transport this convention explicitly; the positive K₁ uniformizer boundary does not make every higher symbol boundary positive.
- Empty supports give zero and full supports give the ordinary character. The supported product of classes on Z₁ and Z₂ lands on Z₁∩Z₂.
- A codimension-c immersion lowers the twist by c and the cohomological boundary degree by 2c−1. A degree shift by c alone would fail the divisor uniformizer test.

### Examples

For Spec F, the degree-zero character is rank, the weight-one K₁ character is the identity on units, and the weight-two character is minus the second universal Chern class. On P², ch(O(1))=exp(h)=1+h+h²/2. These computations distinguish the K₀ Newton formula from the additive formula on positive K-degree. The curve localization calculation fixes the positive rank generator and the order of the tame boundary at once.

### Dependencies

Layers 4 and 8 for cycles and the coherent coniveau tower; SchemeKTheoryOperations for geometric degree-zero Chern classes, gamma operations and its stated Riemann–Roch range; GeneralAlgebraicKTheory and StableHomotopyKTheory for the actual universal K-space, coherent relative diagrams and determinant-free spectrum operations. The relative evaluation and cycle-class comparison are explicit constructions of this layer, not assumptions supplied by a bare rational degeneration theorem.

## Layer 10: étale descent and arithmetic comparison

### 10.1 The truncated cycle comparison without resolution

For X smooth over an arbitrary field, m≥1 invertible in the field and j≥0, construct the cycle map and prove `beilinsonLichtenbaum`:

```text
Z/m(j) ≃ τ≤j Rα_* μ_m^⊗j,        α:X_et → X_Zar.
```

It induces an isomorphism on global H^a for a≤j and an injection for a=j+1. The assertion concerns complexes before global sections; it is not obtained by inserting only the field-diagonal norm residue isomorphism into a spectral sequence. First construct the contravariant cycle-complex model on smooth schemes and extend a theory to normal-crossing schemes by totalizing its open-closed intersection diagram. For each finitely generated K/k, let ĥ□^p_K be A^p_K semilocalized at all its 0/1 vertices, and ∂ĥ□^p its union of coordinate faces. These semilocal cubes differ from the cycle cubes (P¹\{1})^p. For a bounded-above complex C with d=sup{i:H^i(C)≠0}, define `smoothableTheory C` by requiring every x∈H^d_oc(∂ĥ□^p_K,C), p>0, to have the form g*y for a map g:∂ĥ□^p_K→U to an essentially smooth semilocal K-scheme and y∈H^d_oc(U,C). The zero complex satisfies the condition directly. (Kahn, Theorem 1.17, p.593, Proposition 2.7 and Definition 2.8, p.600, §2.4, p.601, Definition 2.31, p.609.)

Define `typeAtInfinity C K` by the Mayer–Vietoris mapping telescope of the suspended boundary complexes RΓ_oc(∂ĥ□^{p+1}_K,C)[p], with the actual suspension maps arising from the union of a cube face and the remaining faces. Use compatible resolved complexes to form the telescope, rather than choosing unrelated maps in a derived category. Require H^i(C∞(K))=colim_p H^{i+p}_oc(∂ĥ□^{p+1}_K,C), naturality in K and C, exactness on triangles and compatibility with derived tensor by bounded-above constant complexes. Define `malleableTheory C` by requiring, for every finitely generated K/k, both H^q(ĥ□^p_K,C)=0 for all p≥0,q>d and C∞(K)=0. Under the first condition the second is equivalent to vanishing H^q_oc(∂ĥ□^p_K,C)=0 for all p>0,q>d, and equivalently to vanishing in degree d+1 for every p>0. A bounded-above representative supplies the zero-complex convention. API: `openClosedExtension_mayerVietoris`, `semilocalSuspension`, `typeAtInfinity_cohomology`, `typeAtInfinity_triangle` and `malleable_iff_boundaryVanishing`. (Kahn, Proposition 2.12 and Corollary 2.13, pp.601–602, Definition 2.14 and Lemma 2.15, pp.603–604, Definition 2.16, p.604.)

Prove positive-weight motivic cohomology malleable, and prove the relevant truncated étale theory smoothable by rigidity. The precise uniqueness target is this: over a perfect k, let B(n) be a homotopy-invariant pure graded cohomology theory of Kahn's Definition 2.19, with bounded-above complexes and B(n)=0 for n<0; let A be a bounded-above constant coefficient complex acyclic above d; and let f_n:Z(n)⊗ᴸA→B(n) be a morphism of such theories with f₀ an isomorphism. Then all positive-weight f_n are isomorphisms iff all B(n) are malleable, equivalently iff all B(n) are smoothable and H^{n+d}(K,Z(n)⊗ᴸA)→H^{n+d}(K,B(n)) is surjective for every finitely generated K/k and n>0. The purity, product and localization axioms are part of the theory hypothesis. Require `malleable_motivic`, `smoothable_truncatedEtale` and `cohomologyTheory_uniqueness`. Apply this with A=Z/ℓ and Layer 6's field-symbol surjectivity; then use coefficient triangles for ℓ-powers. Start over the perfect prime field and pass by continuity to arbitrary fields. The characteristic-p logarithmic comparison uses Layer 7 and the same uniqueness theorem. This supplies a resolution-free proof of the Geisser–Levine implication. (Kahn, Definition 2.19, pp.604–605, Theorem 2.28 and Corollary 2.29, p.608, Theorem 2.34, pp.609–610, Lemmas 2.36–2.37 and Corollary 2.38, pp.611–612; Weibel, VI Theorem 4.1, p.480.)

**Checks.**

- At j=0 the map is the identity on the constant finite sheaf, before either suspension or norm varieties enter.
- At j=1 the comparison recovers the Kummer triangle and the weight-one complex G_m[−1]. In degree two it includes the Picard contribution rather than identifying every class with a unit.
- For a field the weight-j diagonal is precisely K_j^M/m→H^j(μ_m^⊗j). The global assertion above the diagonal is only injectivity in degree j+1, not an isomorphism in every degree.
- A constant theory in degree zero is smoothable but not malleable in positive weight; A¹-invariance alone does not force the uniqueness conclusion. The complex Z[0]⊕Z[−1] fails smoothability because a semilocal square boundary has an extra degree-one class (Kahn, Remark 2.33, p.609).
- At m=1 both sides are zero. At m divisible by the field characteristic the displayed μ_m theorem is not asserted; the logarithmic comparison has a different target and shift.

### 10.2 Smooth Dedekind bases

Let B be the spectrum of a Dedekind ring and X equidimensional and essentially smooth over B. For m invertible on B and j≥0 prove `dedekindEtaleCycle`:Z/m(j)_et≃μ_m^⊗j, and the Zariski comparison Z/m(j)≃τ≤jRα_*μ_m^⊗j. Thus the global comparison is an isomorphism for a≤j and an injection for a=j+1. Use the genuine mixed-base cycle complex, localization at a closed fibre, its étale purity map Z(j−1)[−2]→Ri!Z(j) in the source's truncated range, rigidity at henselian local rings and the field comparison. The integral comparison is truncated at j+1; after derived reduction modulo m the safe truncation in the finite statement is j. No untruncated integral purity at residue-characteristic torsion is inferred. The API includes change of coefficient, localization boundary, pullback along essentially smooth maps and compatibility of the field and arithmetic cycle maps. (Geisser, Theorem 1.2(1)–(4), pp.774–775, §5, pp.787–789.)

**Checks.**

- B=Spec Z[1/ℓ],m=ℓ^r gives the arithmetic complex used below; B=Spec Z with the same m does not satisfy invertibility at ℓ.
- On a closed fibre of codimension one purity lowers weight by one and shifts by two. Applying the unshifted field complex would give the wrong localization degree.
- Weight zero gives constant coefficients, whereas weight one uses the full Kummer sequence, including Pic/m. Henselian rigidity compares with the residue field only when the modulus is invertible there.

### 10.3 Periodic étale K-theory and Bott descent

Define `periodicEtaleK X m` by derived sections of the hypercomplete periodic finite-coefficient K-sheaf on X_et, and `etaleKComparison`:K(X)/m→K^et(X;Z/m) by sheafification and periodicization. Here /m is the cofiber of multiplication by m on the actual K-spectrum. Construct its local homotopy sheaves: π_{2j}=μ_m^⊗j for every integer j, and π_{2j+1}=0. The API includes finite coefficient triangles, the derived completion, descent filtration, functorial comparison and the integral K-module action. A connective sheaf has no negative Bott degrees and is not this target. (Thomason, Theorems 2.43–2.46, pp.498–501, §3.34 and Theorems 4.1,4.11, pp.516–520; Feng–Galatius–Venkatesh, §2.6.1, pp.11–12.)

Prove `correctedThomasonDescent` for separated regular noetherian X of finite Krull dimension, ℓ invertible on X, uniformly bounded ℓ-torsion cohomological dimensions of *all* residue fields, and a finite Tate–Tsen filtration of each residue field as in Thomason (2.112). The filtration starts with the cyclotomic extension and successive induced Galois steps of cohomological dimension at most one. At ℓ=2 require X over Z[1/2,i] for this version and use Appendix A for small exponents. For an admissible Bott element or power β in the specified coefficient construction, the comparison

```text
K(X;Z/ℓ^r)[β⁻¹] ≃ K^et(X;Z/ℓ^r)
```

is an equivalence. There need not be a preferred degree-two β over X. Prove the corrected cd-one input: for arbitrary cd-one extensions the kernel and cokernel on homotopy are annihilated by a Bott power. The stronger inverse before inversion is used only for countably generated extensions. This is the 1989 repair of the original argument and is sufficient for the periodic theorem. (Thomason, (2.112), Theorems 2.43–2.46 and 4.1, pp.498–501,516–518; erratum, corrected Theorem 2.42(a),(b), pp.675–677.)

The Postnikov filtration gives a strongly convergent descent sequence

```text
E₂^(s,t) = H_et^s(X,Z/ℓ^r(t/2)) for even t, and 0 for odd t,
E₂^(s,t) ⇒ K^et_(t−s)(X;Z/ℓ^r),
d_r:(s,t) → (s+r,t+r−1).
```

Bound the cohomological direction uniformly to justify strong convergence and the finite filtration in each abutment degree. Define `etaleDescentFiltration`, its edge maps and its coefficient-boundary maps from this filtration. Neither finite Krull dimension alone nor finite cd of the closed points alone is the source's hypothesis. (Thomason, Theorem 4.1, pp.516–518; Feng–Galatius–Venkatesh, Remark 2.8, p.12.)

**Checks.**

- On a geometric point the even homotopy is Z/ℓ^r in every positive and negative even degree; a connective replacement fails this test.
- A differential sends the abutment degree t−s to t−s−1. The often-confused bidegree (r,1−r) belongs to the motivic indexing of Layer 8, not this descent indexing.
- The generic point is among the residue fields in the uniform cd bound. A bound checked only on closed finite residue fields is insufficient.
- Reducing an admissible Bott power changes the coefficient level with its prescribed exponent. A single formal degree-two generator without a cyclotomic trivialization does not define this telescope.
- At ℓ=2 a real embedding has infinite ordinary cd₂ and cannot be admitted by the finite-cd theorem. Layer 11 treats that case through its real-place fibre.

### 10.4 The Quillen–Lichtenbaum range

For any field F with ℓ invertible and finite d=cd_ℓ(F), prove `quillenLichtenbaumField`:K_n(F;Z/ℓ^r)→K_n^et(F;Z/ℓ^r) is an isomorphism for n≥d−1 and an injection for n=d−2, in nonnegative degrees. Compare the motivic and étale filtrations using 10.1 and bound the terms outside a≤j. Use the sheafified comparison of towers for this general field statement; the finite cd bound makes its relevant descent filtration finite. It needs neither a chosen Bott element nor a Tate–Tsen filtration. The Bott argument of 10.3 is an additional route in its stated range, not a restriction on this theorem. Pass to derived inverse limits with the comparison controlled also one degree above the boundary, so lim¹ is accounted for. (Feng–Galatius–Venkatesh, Proposition 2.9 and proof, §2.6.2, pp.12–13; Weibel, VI Theorems 4.1–4.2, pp.480–481.)

For F a number field and S finite containing the archimedean and ℓ-adic places put R=O_{F,S}. If ℓ is odd, or ℓ=2 and F is totally imaginary, prove `quillenLichtenbaumSIntegers`: the comparison is an isomorphism for n≥1 and injective for n=0. Use the mixed-base motivic tower, 10.2 and finite-cd étale descent; no containment of μ₄ is assumed in the totally imaginary dyadic case. The ring's étale cd is at most two. Localization shows that starting from a ring of S-integers before inverting ℓ preserves the completed K-groups for n≥2; it changes K₁ by the new prime units. The proof uses the finite-field K calculation at the removed primes, whose residue characteristics are ℓ. (Feng–Galatius–Venkatesh, Proposition 2.9 and Lemma 2.10, pp.12–13; Weibel, VI Theorem 8.2, pp.513–514.)

**Checks.**

- For a separably closed field d=0, all nonnegative degrees lie in the isomorphism range. No negative connective K-group is required by the statement.
- For a finite field at ℓ different from its characteristic, d=1 gives an isomorphism from degree zero. For an arithmetic ring of cd at most two, the guaranteed range begins at degree one.
- A real number field at ℓ=2 fails the finite-cd hypothesis and uses Layer 11. Its real coefficient K₂ already has the extension Z/4.

### 10.5 Coefficients, completion and arithmetic degrees

For R and ℓ in 10.4 and j≥2 prove `arithmeticFiniteOdd` and `arithmeticFiniteEven`:

```text
K_(2j−1)(R;Z/ℓ^r) ≃ H_et¹(R,μ_(ℓ^r)^⊗j),
0 → H_et²(R,μ_(ℓ^r)^⊗j) → K_(2j−2)(R;Z/ℓ^r)
  → H_et⁰(R,μ_(ℓ^r)^⊗(j−1)) → 0.
```

Retain the even-degree extension and all maps induced by coefficient triangles. At a finite level the H⁰ term can be nonzero, so even K with finite coefficients is not simply H². Prove that the inverse-limit H⁰ of the positive compact twist is zero, and that the finite towers have the Mittag–Leffler properties needed in the adjacent degrees. Derived inverse limits then give `arithmeticAdicComparison`:

```text
π_(2j−1)(K(R)^∧_ℓ) ≃ H_cont¹(R,Z_ℓ(j)),
π_(2j−2)(K(R)^∧_ℓ) ≃ H_cont²(R,Z_ℓ(j)).
```

Finite generation of the number-ring K-groups identifies these with K_n(R)⊗Z_ℓ. This finite generation is about O_{F,S}, not K_n(F) in every degree. Naturality includes coefficient reductions, Bocksteins and finite étale transfers. (Weibel, VI Theorems 4.1–4.2, pp.480–481, Theorem 8.2 and proof, pp.513–514; Calmès et al., Lemma 3.2.4 proof, arXiv v4 p.57.)

**Checks.**

- At j=2 the adic K₂ term is H²(Z_ℓ(2)), while finite K₂ has a quotient H⁰(μ_(ℓ^r)). In particular a field containing roots of unity detects the quotient that a tensor-only coefficient definition loses.
- For j=1 the even slot would contain H⁰(Z_ℓ(0))=Z_ℓ. Thus the displayed two-group adic identification starts at j=2 and is not a K₀ formula.
- For R=Z[1/ℓ], K₁ has the extra unit ℓ compared with Z. Localization invariance before inverting ℓ begins in degree two.
- A positive compact twist has zero arithmetic H⁰ although its finite reductions may have invariants. Interchanging H⁰ with a tensor product would hide exactly this distinction.

### 10.6 Transfers and the duality sign

For finite étale f:Y→X satisfying 10.3 at an odd prime, construct `etaleDescentTransfer` from restriction of scalars on the actual K presheaf before coefficients. Strictify it on a presheaf of big vector bundles and compare the Godement resolutions. It induces on E₂ the étale trace, given at a geometric stalk by summing the fibres over that point, and converges to the periodic K-transfer. Require its compatibility with finite coefficient maps, Bocksteins, composition, base change and the projection formula. Transfer is additive, not a ring map. Under 10.5 it becomes corestriction in H¹ and H². A ramified Dedekind pushforward requires finite-perfect pushforward, supported purity and the dualizing different; it is a separate comparison. (Blumberg–Mandell, arXiv:1508.00014v3, Theorem 10.1, Lemma 10.2 and Proposition 10.4, pp.43–46; Feng–Galatius–Venkatesh, Proposition 2.15 and Remark 2.16, pp.15–16.)

For a∈Z prime to ℓ prove `etaleAdamsWeight`: ψ^a on the degree-2j sheaf and its cohomology is multiplication by a^j, including negative j in the periodic target; the comparison intertwines these operations. In particular dualization ψ^{−1} has scalar (−1)^j. On the perfect complexes of any ring O of S-integers in a number field, the two symmetric Poincaré structures with opposite signs induce the same underlying duality on K. For n≥2 their C₂-actions on K_{2n−1}(O)[1/2] and K_{2n−2}(O)[1/2] are both (−1)^n. Prove this by finite generation and the odd-prime completed comparisons, not by an assertion about arbitrary hermitian K-theory. (Feng–Galatius–Venkatesh, §2.6.1 after (2.6), p.12; Calmès et al., Lemma 3.2.4 and proof, v4 pp.56–57.)

**Checks.**

- For a split cover of degree d the stalk trace and transfer after restriction are multiplication by d; at degree zero they send rank one to d.
- The trace of a product obeys tr(f*x·y)=x·tr(y). For the disjoint union of two copies, tr(1)=2 and tr(1·1)=2, whereas tr(1)tr(1)=4; multiplicativity fails.
- Dualization is +1 in weight two and −1 in weight three, on both adjacent arithmetic degrees. Its parity is the weight, not the K-degree.
- An a divisible by ℓ is not admitted as an invertible operation on a Bott-inverted coefficient spectrum. Ramified restriction of scalars alone does not justify compatibility with duality without its different-line comparison.

### Examples

For a finite field, cd_ℓ=1 and the comparison in positive K-degrees recovers K_{2j−1}(F_q)=Z/(q^j−1) and K_{2j}(F_q)=0. For an arithmetic ring at an odd prime, the two-column adic calculation gives the H¹ and H² groups, while the finite even-degree filtration retains the roots-of-unity term. Dualization on weight j has sign (−1)^j in both degrees; this is the arithmetic input needed for the number-ring duality application.

### Dependencies

Layers 1–7 supply coefficient complexes, arithmetic cohomology, cycles and norm residue; Layers 8–9 supply the motivic tower and its normalized character. SchemeAndStackFoundations supplies the site, hypercovers and sheaf cohomology; EnhancedDerivedSheaves E2 supplies hyperdescent; GeneralizedCohomology G3.8–3.9 supplies derived coefficient limits; StableHomotopyKTheory supplies exact couples. ProfiniteCohomology and the arithmetic duality owners supply cd and the cohomological transfer. The normal-crossing uniqueness argument of 10.1 and the corrected Bott descent proof of 10.3 are owned here. No inference from a field theorem to a mixed-characteristic arithmetic scheme bypasses 10.2.

## Layer 11: real places and the dyadic extensions

### 11.1 The real comparison and its nontrivial extension

For m≥1,n≥1 prove `suslinRealComparison`:K_n(ℝ;Z/m)≃π_n(BO;Z/m), with the coefficient spectrum on the right, not π_n(BO)⊗Z/m. Use the real Bott-periodic KO/BO carrier and its real realization; complex KU does not give this theorem. Rank deals separately with degree zero. The supplier's Bott periodicity and the integral K-module structure determine the extension in the mod-two real calculation. (Weibel, VI Theorem 3.1(c) and proof, pp.475–479.)

For its proof, import henselian-pair rigidity from KTheoryFiniteLocalFields §2.1 independently of that roadmap's later motivic comparison. Construct `realUniversal_barContraction`: for H=R[GL_N] and A_p the henselization of H^⊗p at its augmentation ideal I_p, the universal bar chains [X₁,…,X_p] form a boundary in the product total complex of reduced C_*(GL(I_•);Z/m). Map these chains to germs of continuous functions near the identity. For every finite chain-degree bound choose a common neighborhood on which the contraction is defined; no one radius for all degrees is required. Then prove `realDiscreteContinuous_homology`: H_i(BSL_N(R)^δ;Z/m)→H_i(BSL_N(R)^top;Z/m) is an isomorphism for i≤(N−1)/2, using the small-neighborhood fibre, homological stability and the split surjection for the Lie-group comparison. Pass to stable N and the plus construction; handle K₁ and K₂ separately from the simply connected argument in degrees ≥3. (Weibel, VI Propositions 3.5,3.7, Lemma 3.6 and Corollary 3.8, pp.477–479.)

Compute `realMotivicDifferential`: the real mod-two motivic E₂ term is F₂ exactly for b≤a≤0; the nonzero d₂ from columns a≡1,2 mod 4 is an isomorphism whenever its target lies in that region. The sequence degenerates at E₃. For positive n its period-eight group orders, in residues 0 through 7, are 2,2,4,2,2,1,1,1. Moreover K_{8k+2}(ℝ;Z/2)=Z/4, not (Z/2)². Resolve this extension by the real topological coefficient comparison. Use module multiplication by integral Bott classes; no natural multiplication on the mod-two Moore spectrum is asserted. (Weibel, VI Theorem 9.1, Table 9.1.1 and proof, pp.517–518.)

**Checks.**

- For m=1 both coefficient spectra are zero. Degree zero at a real field is rank modulo m and is handled separately from the positive comparison.
- In degree two modulo 2 the answer is Z/4. Tensoring the integral degree-two group with Z/2 would lose the coefficient extension.
- The period-eight residues 5,6,7 have trivial mod-two group, while residue 2 has order four. Replacing KO by KU fails this pattern.
- The stability bound is i≤1 for N=3 and only i=0 for N=1; stable homology cannot be inferred in arbitrary finite rank. In the universal contraction the augmentation ideal is proper, whereas a unit ideal is outside henselian rigidity.
- For I=0 the congruence group is trivial and its reduced bar complex vanishes. The degree-one universal bar chain is a cycle; its contraction belongs to degree two, fixing the homological direction.

### 11.2 Real restriction as a map of coefficient fibres

Let F have r₁>0 real embeddings, S finite containing the dyadic and archimedean places, and R=O_{F,S}. For A=Z/2^r or Q₂/Z₂ define `realKRestrictionFibre A` by

```text
C_A → K(R;A) → ⊕_(v real) K(R_v;A) → ΣC_A.
```

Its API consists of coefficient reductions and inclusions, Bockstein maps, the actual fibre long exact sequence and its comparison with motivic restriction. Write α_h(j):H^h(R,A(j))→⊕_vH^h(R_v,A(j)) and H̃^h=ker α_h. The fibre cohomology retains coker α_{h−1} as well as ker α_h. Construct `realRestrictionBoundarySquare` for every boundary and coefficient triangle, at the complex or spectrum level before passing to kernels. These H̃ groups are ordinary restriction kernels; positive cohomology and Tate-modified cohomology have different definitions. In high degrees real restriction is controlled by Layer 2's arithmetic theorem, and 11.1 determines the differentials and extensions. (Weibel, VI (9.2), Lemma 9.3 and Theorem 9.4 proof, pp.518–520.)

**Checks.**

- For the identity map of one real spectrum its fibre is zero, so both its restriction kernel and preceding restriction cokernel vanish. For a zero target the fibre is the source.
- The fibre long exact sequence contains the preceding cokernel; replacing it by the kernel in every degree loses a nonzero term when restriction fails to be surjective.
- K₂(ℝ;Z/2)=Z/4 detects the nontrivial coefficient extension. A calculation of only the E∞ graded pieces would allow the wrong group (Z/2)².
- At a real embedding ordinary cd₂ is infinite. Merely substituting ℓ=2 into a finite-cd two-column descent calculation cannot recover these groups.

### 11.3 Divisible dyadic coefficients

Put D_j=Q₂/Z₂(j), and for j>0 let w_j(F)_2 be the order of H⁰(F,D_j). The subscript means the 2-primary order, not the full integral w_j used with all primes. For n=8k+r≥0 construct `dyadicDivisibleComparison` with the following groups or exact sequences. Every H¹ in this table is H¹(R,D_j) with its displayed j, and H̃¹ is the real-restriction kernel of 11.2.

| r | K_{8k+r}(R;Q₂/Z₂) |
|---|---|
| 0 | Z/w_{4k}(F)_2 for k≥1; Q₂/Z₂ for k=0 |
| 1 | H¹(R,D_{4k+1}) |
| 2 | Z/2 |
| 3 | H¹(R,D_{4k+2}) |
| 4 | Z/(2w_{4k+2}(F)_2) ⊕ (Z/2)^{r₁−1} |
| 5 | 0→(Z/2)^{r₁−1}→K_{8k+5}→H¹(R,D_{4k+3})→0 |
| 6 | 0 |
| 7 | H̃¹(R,D_{4k+4}) |

Keep the maps and filtration in the residue-five extension and the coefficient-boundary squares; do not choose a splitting. The direct sums in the other stated cases are group isomorphisms without a preferred choice of summand. Derive the table from the real motivic differentials and the arithmetic restriction theorem, including the preceding cokernels. The n=0 term uses the trivial twist and is divisible, not a finite group denoted w₀. (Weibel, VI Theorem 9.4 and proof, pp.519–520.)

**Checks.**

- At n=0 the answer is Q₂/Z₂. A finite symbol w₀ would contradict divisibility.
- For r₁=1 the factor (Z/2)^(r₁−1) vanishes. The residue-five extension therefore becomes an isomorphism to its H¹ quotient.
- The residue-two term is Z/2 and the residue-six term is zero. Eightfold periodic residue notation does not make those two terms equal.

### 11.4 The mod-two filtration and its signature defect

Write H^a=H_et^a(R,Z/2), H̃^a=ker[H^a→⊕_vH^a(R_v,Z/2)], and define `signatureDefect` ε(R)=dim_F₂coker[H¹→(Z/2)^{r₁}]. At this coefficient level every twist is canonically constant; this simplification does not extend to Z₂(j). Its API includes the unit-signature description through Kummer, change of S and comparison with real restriction. Prove `dyadicModTwoFiltration` for positive n=8k+r:

| r | K_{8k+r}(R;Z/2), with its filtration |
|---|---|
| 0 | H̃² ⊕ Z/2 |
| 1 | H¹ |
| 2 | 0→H²→K_{8k+2}→Z/2→0 |
| 3 | 0→(Z/2)^{r₁−1}→K_{8k+3}→H¹→0 |
| 4 | 0→(Z/2)^ε→K_{8k+4}→H²→0 |
| 5 | 0→(Z/2)^{r₁−1}→K_{8k+5}→H̃¹→0 |
| 6 | (Z/2)^ε ⊕ H̃² |
| 7 | H̃¹ |

Only the displayed direct-sum cases assert a group splitting, and none asserts a canonical splitting. The d₂ is determined by restriction to real places and E₃=E∞. In degree zero retain the additional Pic(R)/2 contribution from the Kummer sequence instead of extrapolating this table. (Weibel, VI §§9.6–9.7, Theorem 9.7 and Figure 9.7.1, pp.520–522.)

**Checks.**

- For a field with one real place and surjective signatures, ε=0. The rank-r₁−1 terms vanish when r₁=1; they are not rank r₁ terms.
- Increasing S can enlarge the unit signature image, so ε can decrease. It is not an invariant of F alone.
- A nonzero Pic(R)/2 class contributes in degree zero even if its unit signatures are unchanged. This rules out applying the positive-degree row r=0 to K₀.
- The real two-step coefficient extension is cyclic of order four. Treating every mod-two K-group as an F₂-vector space fails before any arithmetic specialization.

### 11.5 Integral dyadic torsion

For i≥2 let H²(i)=H_cont²(R,Z₂(i)), and for even i let H̃²(i) be its kernel of real restriction. Define `milnorDegreeFourRank` ρ(F)=dim_F₂ im[K₄^M(F)→K₄(F)], using the source's 2-torsion image. Its API includes invariance under enlarging S and the inequalities ε(R)≤ρ(F)<r₁. For n≥2 prove `dyadicIntegralTorsion`, with k determined by n=8k+r:

| r | K_{8k+r}(R){2} |
|---|---|
| 0 | H²(4k+1) |
| 1 | Z/2 |
| 2 | H²(4k+2) |
| 3 | (Z/2)^{r₁−1} ⊕ Z/(2w_{4k+2}(F)_2) |
| 4 | 0→(Z/2)^ρ→K_{8k+4}(R){2}→H²(4k+3)→0 |
| 5 | 0 |
| 6 | H̃²(4k+4) |
| 7 | Z/w_{4k+4}(F)_2 |

The residue-four extension is retained. Derive the table by coefficient boundaries from 11.3–11.4 and the finitely generated arithmetic K-groups; the groups with divisible coefficients are not the integral torsion groups. Explain separately why ρ is independent of S while ε need not be, and carry the induced extension maps when S changes. (Weibel, VI Theorem 9.11, pp.524–525; Corollary 9.10 and Example 9.10.1, pp.523–524.)

**Checks.**

- For F=Q(√7) and R=Z[√7,1/2], ρ=1 and ε=1. The units 8+3√7 and 3+√7 are positive at both embeddings, and −1 supplies only the diagonal negative signature. After inverting 7, √7 is a unit with opposite signs, so ε becomes 0 while ρ remains 1. The residue-four extension is nonsplit in the latter case; its 2-primary group is Z/32, rather than Z/2⊕Z/16 (Weibel, Example 9.10.1, p.524).
- For F=Q(√2), ρ=0; the rank-ρ subobject in residue four disappears. Thus ε alone does not determine that subobject in all number fields.
- At n=2 the answer is H²(2). At n=5 the integral dyadic torsion vanishes, although K₅ with divisible coefficients need not vanish.
- The bound ρ<r₁ implies ρ=0 for r₁=1. The theorem does not cover r₁=0 by inserting a negative exponent r₁−1; the totally imaginary case belongs to Layer 10.

### Examples

At one real embedding the groups in degrees one and two with mod-two coefficients have orders two and four, and the second is cyclic. For a real arithmetic ring the same comparison fixes extensions that the motivic page alone leaves undecided. The quadratic examples above separate the field invariant ρ from the S-dependent signature defect and prevent a spurious canonical splitting in degree 8k+4.

### Dependencies

Layers 1–2 for coefficients, ordinary real restriction and arithmetic cohomology; Layers 8 and 10 for the motivic and coefficient comparisons. The mixed-base cycle theorem of 10.2 and arithmetic localization supply the arithmetic version of the motivic calculation. TopologicalKTheory T7 and GeneralizedCohomology G5.4 supply the real Bott carrier and spectrum realization; the coefficient extension is computed in 11.1. The finite-cd hypotheses of 10.3 are deliberately replaced by the actual real-place fibre in this layer.

## Layer 12: realizations, regulators and arithmetic lines

### 12.1 Finite étale Chern maps and supported cycle classes

For a regular scheme X, m≥1 invertible on X and i,n≥1, construct `finiteEtaleChern i n`:K_n(X;Z/m)→H_et^{2i−n}(X,μ_m^⊗i) from the universal finite characteristic class. Its API comprises pullback, coefficient maps with their Bocksteins, and universal product formulas in the admitted coefficient-product range (m odd or 8∣m; Weibel, V.11.3.2, pp.453–454). For fields the Milnor diagonal is

```text
c_(i,i)({u₁,…,u_i}) = (−1)^(i−1)(i−1)! · κ(u₁)∪⋯∪κ(u_i).
```

The coefficient homotopy groups are those of the K-spectrum cofiber, so the construction retains the extension in the universal coefficient sequence. Degree-zero classes instead obey Whitney sum. An individual c_i is not a ring character; only after rational normalization do the total characters have the product formula of Layer 9. The étale realization of `motivicChern` agrees with this universal class wherever both constructions apply. (Weibel, V.11.5–11.8, Example 11.10, Lemma 11.10.1 and Theorem 11.11, pp.453–459.)

Let K be a nonarchimedean local field and ℓ different from its residue characteristic. For a regular proper flat model 𝒳 over O_K whose generic fibre is smooth projective of pure dimension, and d>0, construct `supportedCycleCharacter`:F^dK₀^Z(𝒳)→H_Z^{2d}(𝒳,Q_ℓ(d)) using the Gillet supported character, with its support and filtration conventions. Its generic-fibre restriction agrees with the refined étale cycle class of a codimension-d cycle. Require forgetting supports, restriction to the generic fibre and the supported product into Z₁∩Z₂ in weight d₁+d₂. This is the supported *character*, not the unnormalized ordinary c_d. Do not infer an arbitrary vertical-cycle assertion on the model from the generic-fibre lemma. (Li–Liu, Appendix B, pp.57–62, Lemma B.6, p.61, and footnote 22, p.62.)

**Checks.**

- At i=1,n=1 the finite map is Kummer of determinant. At i=2,n=2 it is minus the Kummer cup; at i=3,n=3 it is twice the triple cup.
- If m divides (i−1)!, the displayed diagonal Chern map can vanish even when norm residue is an isomorphism. Dividing by that factorial modulo m is not a valid normalization.
- A reduced generic codimension-d cycle has supported character coefficient +1; its ordinary top Chern class would have coefficient (−1)^{d−1}(d−1)!.
- Disjoint supports have zero supported product. An empty support gives zero and full support gives the ordinary character. Restricting to the generic fibre can kill a vertical support and cannot test its entire arithmetic class.

### 12.2 Deligne complexes and the regulator roof

For smooth projective X/C and j≥1 use the required geometric supplier's Deligne complex Z(j)_D, with Z(j)=(2πi)^jZ in degree zero, followed by O_X in degree one and Ω_X^r through r=j−1; at j=0 it is Z[0]. Its universal characteristic class gives c_D:K_m(X)→H_D^{2j−m}(X,Z(j)). Composing the rational character of Layer 9 gives the rational and real regulators. For nonproper X use that supplier's logarithmic Deligne–Beilinson complex and mixed-Hodge realization, with compactification independence, semipurity and homotopy invariance. Ordinary analytic Deligne cohomology on an open variety is not substituted for that complex. (Weibel, V Example 11.12(3), p.458; Burgos, §10.1, Definition 10.1, (10.2)–(10.5), Definition 10.3 and Examples 10.4–10.5, pp.89–92.)

For smooth equidimensional quasiprojective X/C and p,n≥0 construct `cubicalDeligneRegulator`:CH^p(X,n)→H_D^{2p−n}(X,R(p)). In cube degree q, form the filtered colimit over admissible codimension-p supports Z of

```text
D_log,Z = fib(D_log(X×□^q,p) → D_log((X×□^q)\Z,p)).
```

Truncate this *support complex* at 2p, normalize the cubical direction, totalize and reindex cohomological degree by 2p−*. Call the resulting chain complex B_supp. Its projection to top support cohomology is a quasi-isomorphism; semipurity identifies the latter with normalized cycles tensored with R. Forgetting the support component gives B_supp→A, the corresponding total complex without supports. The inclusion τ≤2pD_log(X,p)[2p−*]→A is a quasi-isomorphism. Invert these two quasi-isomorphisms in D(Ab) to obtain the regulator roof. The API is `supportProjection_quasiIso`, `deligneConstantInclusion_quasiIso`, `cubicalRegulator_flatPullback`, its homological pullback after moving, its product, conjugation and localization-boundary comparisons. For a real variety take conjugation invariants in the real normalized complex with the stated Tate action. Flat chain pullback and arbitrary smooth-variety pullback on homology are distinguished. (Burgos–Feliu, Definition 1.28 and §1.11, pp.11–12, §§2.1–2.5, Lemma 2.11, Propositions 2.8,2.13,2.19, pp.13–18, §3.1 and Proposition 3.3, p.19.)

The standing cycle boundary is ∂_M=Σ_i(−1)^i(∂_i^∞−∂_i^0), opposite to the source's ∂_BF. Use `cubicalOrientationChange` J_q=(−1)^q simultaneously on cycles and both total complexes. Then ∂_BF J_q=J_{q−1}∂_M and cube degree zero is fixed. With total differential d_D+(−1)^{form degree}∂_M the same sign transport commutes with the support projection. Changing only the cycle complex, or only the higher character, changes the odd-degree regulator. Prove `beilinsonRegulatorComparison`: composition of the actual rational higher character with this roof equals the regulator from universal Deligne classes. The proof compares universal classes on Grassmannians and then their simplicial descent, retaining the relative diagrams. (Burgos–Feliu, Remark 3.4 and Theorem 3.5 with proof, pp.19–23.)

**Checks.**

- In cube degree one J₁=−1 and in degree zero J₀=1, so ∂_BF(−z)=∂_M(z). A sign change in just one of the two complexes fails this chain identity.
- For p=0 a codimension-zero support gives the constant cycle class; for empty supports the fibre is zero. The truncation is applied after the support cone, since truncation need not commute with that cone.
- At j=0 the projective Deligne complex is Z[0], and H_D⁰(point,Z(0))=Z. Appending O even at weight zero would instead give ker(Z→C)=0 in degree zero.
- At a complex point and p≥1, the real target H_D¹(C,R(p)) is C/(2πi)^pR. Quotienting by (2πi)^pZ instead gives a different integral target.
- At p=1 the real regulator of a unit u is log|u|. Inversion changes its sign, and a root of unity has regulator zero.
- On a line bundle in K₀ use exp(c₁), whereas on positive K-degree use (−1)^{p−1}c_p/(p−1)!. The weight-three coefficient is 1/2, not 1/6.

### 12.3 The early number-field regulator and integral images

For a number field F and j≥2 construct `numberFieldDeligneRegulator` with target

```text
H_D¹(F⊗R,R(j)) ≃ (∏_(σ:F→C) R(j−1))^conjugation.
```

Here R(j−1)=(2πi)^{j−1}R and the point quotient C/R(j) is identified with that line as a real vector space with conjugation. Before suspension the universal class is (2πi)^j pr_j/j!, where pr_j is the jth power-sum characteristic class. Its simplicial first-infinitesimal-diagonal realization, embeddings, Adams weight and products commute with the map. This construction is available independently of the later Borel comparison and independently of p-adic Hodge theory. Its API includes embedding permutation, conjugation, rational linearity and comparison with the roof of 12.2. (Burgos, §4.4, Proposition 4.20 and Definition 4.21, pp.30–31, Theorem 4.24 and Remark 4.25, p.32, §§10.1–10.4, pp.89–97.)

For a specified regular arithmetic model 𝒳 of X define `integralMotivicImage` as I=im[H_M^a(𝒳,Z(j))→H_M^a(X,Z(j))], `integralMotivicLatticeCandidate` as L=I/I_tors, and `rationalIntegralPart` as im[H_M^a(𝒳,Q(j))→H_M^a(X,Q(j))]. The API retains the source model, maps under change of model and localization, the quotient map to L and realization of these maps. A regulator lattice is the image of L only after finite generation and injectivity have been established in the particular case. A full-rank comparison with the realization is an additional theorem or hypothesis. The rational integral part is a Q-subspace and is never called a Z-lattice. (Bloch–Kato, §5.1, p.369; Kato, §2.1(a)–(d), pp.167–168.)

**Checks.**

- Complex conjugation acts on R(j−1) by (−1)^{j−1}. Hence the target dimension is r₂ for even j and r₁+r₂ for odd j, agreeing with the number-field K_{2j−1} rank.
- At j=2 a real embedding contributes zero, while a complex pair contributes one real dimension. Ignoring the Tate action would incorrectly add r₁ dimensions.
- If the integral image is zero its candidate lattice is zero. If it has torsion, the regulator kills that torsion before a lattice can be compared.
- Replacing I by its Q-span loses the index of a finite-index sublattice. For example 2Z⊂Z has equal rational span but regulator covolumes in ratio two.
- Enlarging the set of allowed bad primes changes the model image through localization; no canonical equality of all integral images is built into the definition.

### 12.4 Realization and Euler-factor conventions

Use the existing representations Q_ℓ(j), H¹_et(E_bar,Q_ℓ)(j), T_ℓE and their Weil-pairing identification H¹(E)(j)≃V_ℓE(j−1). For a good place v∤ℓ set q=#k_v and a=q+1−#E(k_v). Let Fr mean arithmetic Frobenius and Fr^{-1} geometric Frobenius. Define `geometricEulerPolynomial` from det(1−Fr^{-1}X) on the cohomological realization. The dictionary is

```text
Q_ℓ(j):             1 − q^(−j) X,
H¹(E)(j):           1 − a q^(−j) X + q^(1−2j) X².
```

For a homological lattice T put T*=Hom(T,Z_ℓ(1)) and define `rubinEulerPolynomial`=det(1−Fr^{-1}X|T*)=det(1−q^{-1}Fr X|T). It is 1−q^{j−1}X for Z_ℓ(j) and 1−a q^{j−1}X+q^{2j−1}X² for T_ℓE(j). To apply the latter to H¹(E)(j), substitute j−1 for the homological Tate-module twist. The API includes the dual-twist determinant identity, unramified base change and transport through the native Weil pairing. Negative powers are evaluated in Q_ℓ, with q a unit. At bad places use the local owner's inertia and monodromy factor; a good-place formula is not a replacement for it. (Bloch–Kato, §5.1, p.369, §§5.5.1–5.7, p.372; the Frobenius characteristic polynomial and Weil pairing are the native elliptic supplier contracts above.)

**Checks.**

- In Tate weight one the Rubin polynomial is 1−X, while the geometric cohomological polynomial is 1−q^{-1}X. Their different twists and variance are visible even in rank one.
- For T=T_ℓE without an extra twist, the Rubin polynomial is 1−a q^{-1}X+q^{-1}X². For H¹(E) the geometric polynomial is 1−aX+qX².
- The rank-two constant coefficient is one and the quadratic coefficient in the geometric H¹(E)(j) polynomial is q^{1−2j}, fixing the determinant as well as the trace.
- A residue field has q≥2. The algebraic substitution q=1 checks the determinant identity formally but is not an allowed arithmetic place.

### 12.5 Norm-compatible regulator families

For a tower of finite extensions F_n/F with the specified S_n, define `normCompatibleKFamily` as classes x_n in K_m(O_{F_n,S_n};Z/p^{r_n}) whose transition is the actual K-transfer after coefficient reduction. Its regulator image is a compatible family in H^a(G_{F_n,S_n},Z/p^{r_n}(j)) with corestriction transitions. The API is evaluation, transition, base change and `regulator_norm`, all built from the finite étale transfer comparison where ramified places have been placed in S. Interpretation as a homotopy group of an inverse-limit spectrum retains the derived completion and any lim¹ term. It is not a definition of completed K-theory by an underived inverse limit of unrelated groups. (Weibel, V.11.12, pp.457–459; Feng–Galatius–Venkatesh, Proposition 2.15, pp.15–16.)

For the concrete Soulé family take p odd, A=O_F[1/p], A_n its integral closure in F(μ_{p^n}), norm-compatible units u_n and roots ζ_n with ζ_{n+1}^p=ζ_n. The Bott lift β(ζ_n)∈K₂(A_n;Z/p^n) has Bockstein ζ_n. For i≥2 set

```text
x_n = N_(A_n/A)(u_n · β(ζ_n)^(i−1)) ∈ K_(2i−1)(A;Z/p^n).
```

Prove `souleFamily_coefficientCompatibility` using coefficient reduction of the Bott lift, the extension norm and the projection formula. These x_n are all on the fixed base A, so their transition is coefficient reduction alone. Use a cofinal set of moduli with the required Moore pairings: exclude 2,3,4,8 for the graded-commutative coefficient product contract; at p=3 start at exponent two and recover lower levels by reduction. The K₁ entry acts through the integral K-module product. The case i=1 is a norm-compatible unit construction, not an instance of the positive Bott-power theorem. (Soulé, §§4.1–4.4 and Lemma 1, pp.238–240.)

**Checks.**

- Unit degree one plus i−1 Bott factors of degree two gives exactly 2i−1. A degree-2i class has the wrong source for the arithmetic H¹ regulator.
- At i=2 the family is N(u_nβ_n), and reducing level n+1 gives N(u_nβ_n) by the projection formula. Reducing without the norm on the units would fail this identity.
- If u_n=1 its K₁ class is zero in additive K notation, so x_n=0. Raising a unit to an integer a multiplies the resulting additive family by a.
- The fixed-base Soulé family and the extension-level family have different transition maps. Applying a second norm to x_n, already over A, is a type error.

Given a family satisfying the genuine Euler relation N_{Mv/M}x_{Mv}=P_v(Fr_v^{-1})x_M, prove `regulatorEulerRelation` with the identical corestriction relation. Its proof is equivariance and transfer compatibility, with the polynomials of 12.4 and the Galois element used by the Euler-system owner. Coefficient Frobenius in defining P_v is distinct from the group-ring element substituted into that polynomial. Norm compatibility alone has P_v=1 and does not create an Euler system with a nontrivial Euler factor. Existence of a Tate or elliptic Euler family remains with EulerSystemsAndKolyvaginSystems. (Soulé, §§4.3–4.4, pp.239–240; Kato, §2.1 after (2.1.5), p.167.)

### 12.6 Local Tate conditions and elliptic Selmer adapters

For a finite extension K/Q_p and j≥2 prove `localTateRegulatorComparison`: the rational étale Chern regulator K_{2j−1}(K)→H¹(K,Q_p(j)) is the syntomic Chern class followed by the period map, with the same integral Chern normalization before rationalization. The p-adic Hodge supplier gives

```text
H¹_f(K,Q_p(j)) = H¹_e(K,Q_p(j)) = H¹(K,Q_p(j)),
dim_Qp H¹ = [K:Q_p],
exp_BK:D_dR(Q_p(j))/Fil⁰ ≃ H¹_e(K,Q_p(j)).
```

At j=1 use the rational completed Kummer image of O_K×, which is H¹_f of dimension [K:Q_p]; full H¹ has one additional valuation direction. For T=Z_p(j), define the integral local condition as the inverse image of the rational condition, retaining every torsion class. The normalized character divides the Chern regulator by (j−1)! with its sign, and is a rational change. (Nekovář–Nizioł, Proposition 5.7 and proof, p.1777; Bloch–Kato, (3.7.3), p.354, Example 3.9, Definition 3.10 and Example 3.10.1, pp.359–360.)

For an elliptic curve E/F use the native T=T_pE,V=V_pE. The local Kummer theorem identifies H¹_f(F_v,V) at v|p with the image of lim_mE(F_v)/p^m tensored with Q_p. Away p the rational finite Kummer image is zero, but its integral and discrete local terms are retained. The Weil pairing identifies V*(1)=V. The higher realization H¹(E)(j)=V_pE(j−1) has its own crystalline, semistable or de Rham hypotheses and local comparison; the untwisted elliptic Kummer theorem does not prove its finite condition for every twist. Nekovář–Nizioł's general semistable factorization is a statement about H¹_st, and equality with H¹_f requires additional input. (Bloch–Kato, §§3.7–3.8, pp.353–354, Example 3.10.1, pp.359–360; Nekovář–Nizioł, §5.2, Theorem 5.9 and proof, p.1779.)

Construct `selmerRegulator` on the kernel-defined Selmer group after proving that every local restriction satisfies the chosen local condition: unramified away p for a class extending over O_v, and the finite condition at p in the admitted regime. For a map of Selmer *complexes*, supply maps from the motivic complex to the actual U_v^+ together with homotopies comparing their composites with local restriction. Membership of individual H¹ classes alone supplies no such chain map. Require the supplier's H⁰-surjectivity and local H¹-injectivity hypotheses before identifying H¹ of the mapping fibre with the kernel-defined Selmer group. Its API includes localization, lattice-to-rational compatibility, transfer where local conditions are preserved, and the map of the chosen mapping-fibre triangles. (Kato, §2.1(a)–(d), pp.167–168; Bloch–Kato, §5.1, p.369.)

**Checks.**

- For Q_p(1), a uniformizer class has nonzero valuation and lies outside H¹_f, whereas a unit class lies inside. Thus the j≥2 full-H¹ statement cannot be extended to j=1.
- In weights j≥2 the exponential source has dimension [K:Q_p] and Fil⁰ is zero. A formula with dimension [K:Q_p]+1 is the weight-one full-cohomology formula.
- A torsion lattice class maps to zero rationally and belongs to the inverse-image finite condition. Defining the integral condition by a torsion-free span would lose it.
- At v∤p, a local elliptic finite Kummer class is zero after tensoring with Q_p; this does not imply its finite-coefficient version is zero.
- A collection of local H¹ memberships, without chosen homotopies, gives a Selmer-group value but fails the input type of `selmerRegulator` on complexes.

### 12.7 Determinant lines and local factors

Let Λ be the admitted coefficient DVR or order, T a Tate or elliptic lattice, and C_c(T) the supplied bounded perfect compact-support complex with its real-place convention. Define `arithmeticDeterminantLine` Δ_p(T)=det_Λ^{-1}C_c(T) in the graded determinant category. Its API comprises rationalization, derived coefficient base change where perfectness persists, and the distinguished-triangle isomorphisms. For the Selmer mapping fibre C_f and local-condition maps U_v^+→C_v, construct the triangle C_c→C_f→⊕_vU_v^+→C_c[1], and prove `selmerLocalDeterminant`:

```text
det_Λ^(−1) C_f ≃ det_Λ^(−1) C_c ⊗ (⊗_v det_Λ^(−1) U_v^+).
```

Fix the indicated graded order of factors and the commutativity signs. Coefficient change is compatible only when local conditions commute with that derived base change. At p=2 require the modified real complex and its boundedness/perfectness theorem; absent it restrict this determinant specialization to odd p. (Kato, §1.2 and §2.1, pp.165–168; the generic graded determinant functor is PadicMeasuresIwasawaAlgebras, layer 5.)

For a chosen Tate or elliptic motive, form its rational fundamental line from its specified motivic K factors, Betti/de Rham realizations and period spaces. The realization owners supply those factors with their exact variance, degree and finiteness assumptions; their formula is case-dependent. Construct `fundamentalLineRealComparison` and `fundamentalLinePadicComparison` separately after the actual regulator and period isomorphisms have been supplied. At this stage they are conditional comparison theorems about lines. A Tamagawa-number assertion additionally asks for a rational zeta element with the prescribed real leading-value image and an integral basis image in Δ_p(T). No existence of that element, of motivic finiteness, or of every regulator isomorphism is asserted here. (Kato, (2.1.1)–(2.1.5) and §2.1(a)–(d), pp.166–168; Bloch–Kato, §5.1, p.369.)

**Checks.**

- If C_c=0 its determinant is the unit line with grading zero. For the triangle C_c→C_f→U, a one-dimensional U in degree zero contributes its inverse determinant, not its determinant.
- For C=[Λ --a→ Λ] in degrees zero and one, a≠0, the acyclic rational trivialization of det C sends e₀⊗e₁^{-1} to a. The inverse determinant lattice therefore has image a^{-1}Λ; for a=π^s its valuation is −s, equal to −length H¹(C). This two-term calculation fixes the inversion convention.
- Swapping two odd graded line factors changes sign. A formula in ungraded lines cannot encode the fixed ordering used in the fundamental-line comparison.
- A nonperfect unbounded real cochain complex is not an input to det_Λ. A rational isomorphism of lines does not establish that a chosen integral element is a basis.

### 12.8 The number-field Chern lattice index

Let F be a number field, R=O_{F,S}, j≥2 and L_K=K_{2j−1}(R)/torsion, free of Borel rank r. In H_M¹(F,Q(j)) put L_ch=ch_j(L_K) and L_c=c_{j,2j−1}(L_K). Prove `chernImageScaling`:L_c=(−1)^{j−1}(j−1)!L_ch. Let I be the torsion-free integral motivic image in this rational space. Under the explicit hypotheses that I is finitely generated of full rank, that L_c⊂I is integral and has finite index e, and that the real regulator extends to an isomorphism on the associated real vector space, prove `chernRegulatorCovolume`:

```text
covol(r_D L_ch) = e / ((j−1)!)^r · covol(r_D I).
```

The API includes change of integral basis, absolute determinant of a coordinate change, localization of the chosen model and comparison with the Borel normalization. If r_B=A∘r_D, its covolume has the extra |det A|, including the actual factor of two from BorelRegulators. That comparison is downstream of the early Deligne regulator of 12.3. Neither the rational integral part nor a rational eigenspace equality proves the integral finite-index hypotheses. (Weibel, V.11.10–11.14, pp.455–462, VI §§8.1–8.2, pp.513–514; Bloch–Kato, §5.1, p.369; Burgos, Theorem 10.9, pp.95–97, for the comparison of regulator conventions.)

**Checks.**

- For j=2 the scalar is −1, so the two image lattices have equal covolume. For j=3 it is 2 and the ch lattice has covolume e/2^r times that of I.
- For rank zero the factorial power is one and the index of the zero lattice in itself is one. A formula dividing by r would have no meaning.
- For r=1,I=Z,L_c=2Z and j=3, e=2 and L_ch=Z, giving ratio one. Reversing the index gives ratio 1/4 and is false.
- The sign in L_c matters for oriented determinant lines but disappears under absolute covolume. A Borel coordinate change by scalar two in each of r coordinates contributes 2^r, independent of the factorial.

### Examples

Units give the weight-one pair of regulators: logarithmic absolute value at infinity and Kummer at p. Positive Tate weights j≥2 have full local H¹ finite condition, while a uniformizer remains the weight-one counterexample. Soulé's unit/Bott construction gives degree 2i−1 norm-compatible K-classes and therefore corestriction-compatible regulators. The two-term determinant and rank-one lattice calculations fix the inversions and factorials needed before formulating an integral special-value comparison.

### Dependencies

Layers 1,9–11 for twists, normalized characters and arithmetic coefficient comparisons. HodgeStructures, Part II supplies the geometric logarithmic Deligne complex, semipurity and compactification independence; HodgeStructures itself supplies only the linear Hodge objects. PadicHodgeTheory supplies the period objects; PadicHodgeRegulators' étale–syntomic, local-exponential and elliptic layers supply syntomic Chern classes, period maps and the stated local finite-condition theorems. SelmerIwasawaCohomology supplies local-condition complexes and the Selmer mapping fibre. Native elliptic Tate modules and Weil pairings come from Tau Ceti; their higher realization and bad-place local factors come from ArithmeticGaloisRepresentations. PadicMeasuresIwasawaAlgebras supplies determinant lines; PeriodsAndSpecialValues supplies the selected rational fundamental-line factors; BorelRegulators supplies the Borel lattice and its normalization comparison. These are hypotheses of the conditional determinant comparisons, not consequences of norm residue.

## Downstream consumers

ArithmeticKTheory uses the finite, adic and divisible comparisons of Layers 10–11 to identify the torsion and completed arithmetic K-groups, retaining the real-place extensions. KTheoryFiniteLocalFields uses the field comparison and coefficient boundaries. K2SymbolsBrauer, EllipticKTheory and SpecialValuesBirchTate use the independent weight-two route of Layers 1–3. K3BlochGroups uses the higher-character normalization and the precise distinction between integral classes and rational images.

MotivesAndAlgebraicCycles uses the effective category and cancellation of Layer 5 before stabilizing and constructing its higher realizations. GeneralizedHeegnerCycles uses the actual cycle transfers and supported realization maps. Polylogarithms uses the higher cycle complexes, rational Chern character and Deligne comparison; its functional equations remain its own targets. HigherLocalFieldsAndHigherClassFieldTheory uses the characteristic-p differential and Witt symbols, including their residue and norm compatibilities, rather than a prime-to-characteristic Tate twist at p.

BorelRegulators uses the early Deligne regulator and the rational character before returning its Borel comparison constant to the lattice calculation in 12.8. PadicHodgeRegulators uses cycle classes and normalized higher characters from Layers 4 and 9; its syntomic and exponential theorems supply the inputs of 12.6. This order avoids using a completed global Selmer regulator to construct the local regulator it needs. PeriodsAndSpecialValues uses the determinant comparison maps with their stated finiteness and integral-index hypotheses. KatoEulerSystems and EulerSystemsAndKolyvaginSystems use the transfer-compatible realizations of norm families, and provide the separate existence and Euler relations of their arithmetic classes.

IntegralIwasawaTheory and HabiroNumberFields use the coefficient dictionaries, arithmetic cohomology and completed comparison maps. Passing to a tower retains derived limits and connecting morphisms. An equality of finite-level cardinalities, a rational regulator isomorphism or an abstract isomorphism of graded groups does not replace those maps.

## References

Locators use printed pagination for published sources and numbered PDF pages for the specified preprints. These public copies fix the versions used above.

- S. Bloch and K. Kato, [*p-adic étale cohomology*](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), Publications mathématiques de l’IHÉS **63** (1986), 107–152. Section 2, especially Theorem 2.1 and Lemma 2.5, supplies the differential-symbol injectivity and relative elimination argument. The logarithmic-generation input is distinguished from that injectivity theorem in 7.4.
- S. Bloch and K. Kato, [*L-functions and Tamagawa numbers of motives*](https://math.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf), The Grothendieck Festschrift I (1990), 333–400.
- R. Elman and T. Y. Lam, [*Pfister forms and K-theory of fields*](https://doi.org/10.1090/S0002-9904-1971-12823-9), Bulletin of the AMS **77** (1971), 971–974; [author-uploaded copy](https://www.researchgate.net/publication/303337178_Pfister_forms_and_K-theory_of_fields). Theorem 2 and its Corollary 1, p.972, specify the algebraic comparison required before the norm-residue induction.
- A. J. Blumberg and M. A. Mandell, [*The fiber of the cyclotomic trace for the sphere spectrum*](https://arxiv.org/abs/1508.00014), version 3.
- J. I. Burgos Gil, [*The Regulators of Beilinson and Borel*](https://www.icmat.es/miembros/burgos/files/brbr.pdf), CRM Monograph Series **15** (2002).
- J. I. Burgos Gil and E. Feliu, [*Higher arithmetic Chow groups*](https://arxiv.org/abs/0907.5169), version 1.
- B. Calmès, E. Dotto, Y. Harpaz, F. Hebestreit, M. Land, K. Moi, D. Nardin, T. Nikolaus and W. Steimle, [*Hermitian K-theory for stable ∞-categories III: Grothendieck-Witt groups of rings*](https://arxiv.org/abs/2009.07225), version 4.
- T. Feng, S. Galatius and A. Venkatesh, [*The Galois action on symplectic K-theory*](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf), author PDF, §§2.1–2.3.
- E. M. Friedlander and A. Suslin, [*The spectral sequence relating algebraic K-theory to motivic cohomology*](https://www.numdam.org/item/ASENS_2002_4_35_6_773_0.pdf), Annales scientifiques de l’École normale supérieure **35** (2002), 773–875.
- T. Geisser, [*Motivic cohomology over Dedekind rings*](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), Mathematische Zeitschrift **248** (2004), 773–794. Theorems 1.1–1.2, §§2–5 and Corollary 4.3 distinguish mixed-base moving, the unresolved integral initial Gersten terms, and finite étale comparison.
- C. Haesemeyer and C. Weibel, [*Norm varieties and the chain lemma (after Markus Rost)*](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chain-final.pdf), author PDF dated 2 January 2009, 32 pages.
- L. Illusie, [*Complexe de de Rham–Witt et cohomologie cristalline*](https://numdam.org/item/10.24033/asens.1374.pdf), Annales scientifiques de l’École normale supérieure **12** (1979), 501–661. Part I, §5.7, Corollary 5.7.5 and Proposition 5.7.9 provide the logarithmic Witt coefficient interface; they are not themselves the Bloch–Gabber–Kato theorem.
- B. Kahn, [*The Geisser–Levine method revisited and algebraic cycles over a finite field*](https://webusers.imj-prg.fr/~bruno.kahn/preprints/glrMathAnn.pdf), Mathematische Annalen **324** (2002), 581–617. Theorem 1.17, §§2.4–2.6, Theorem 2.34 and Corollary 2.38 give the resolution-free uniqueness route, including type at infinity, smoothability and malleability.
- K. Kato, [*Tamagawa number conjecture for zeta values*](https://arxiv.org/abs/math/0304233), version 1. Section 2.1, printed pp.165–168, supplies the integral fundamental-line and zeta-element formulation used conditionally in 12.7.
- M. Kurihara and I. Fesenko, [*Appendix to Section 2*](https://arxiv.org/pdf/math/0012134v1), Geometry & Topology Monographs **3** (2000), 31–41. Section A2.1, pp.36–40, supplies the logarithmic-generation proof, including the leading-term proposition and prime-to-p descent; §A2.2, p.40, separates the injectivity argument.
- M. Levine, [*Bloch’s higher Chow groups revisited*](https://www.numdam.org/article/AST_1994__226__235_0.pdf), Astérisque **226** (1994), 235–320.
- M. Levine, [*Chow’s moving lemma and the homotopy coniveau tower*](https://arxiv.org/abs/math/0510201), version 1.
- M. Levine, [*The homotopy coniveau tower*](https://arxiv.org/abs/math/0510334), version 1. Sections 1–2, 5–7 and 9–10 identify the pointwise cycle layer and the coherent tower, including well-connectedness and convergence.
- M. Levine, [*K-theory and motivic cohomology of schemes, I*](https://www.esaga.uni-due.de/f/marc.levine/publ/KthyMotI12.01.pdf), author PDF. The moving and multiplicative support constructions, §§11–14 and Appendices C–D supply the operations on the tower and the comparison with the gamma filtration.
- C. Li and Y. Liu, [*Chow groups and L-derivatives of automorphic motives for unitary groups*](https://www.math.columbia.edu/~chaoli/AIPF.pdf), author PDF, Appendix B, especially Lemma B.6. Only the supported Chern-character construction under the regular-model hypotheses of 12.1 is used; the automorphic theorems are outside this roadmap.
- C. Mazza, V. Voevodsky and C. Weibel, [*Lecture Notes on Motivic Cohomology*](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/Lecture_notes_on_motivic_cohology_published.pdf), Clay Mathematics Monographs **2** (2006). Lectures 1–3, 6–10, 13–15 and 17–18 supply correspondences, effective motives, cancellation interfaces and the comparison with higher Chow groups.
- J. S. Milne, [*Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), second edition with author’s corrections. Chapter I §§0,4–5 supplies the compact-limit, finite-coefficient global-duality and Euler-characteristic interfaces. The corrected discussion of strict cohomological dimension is retained.
- J. Nekovář and W. Nizioł, [*Syntomic cohomology and p-adic regulators for varieties over p-adic fields*](https://msp.org/ant/2016/10-8/ant-v10-n8-p04-p.pdf), Algebra & Number Theory **10** (2016), 1695–1790, with appendices by L. Berger and F. Déglise. Proposition 5.7 and Theorem 5.9, pp.1777,1779, give the regulator comparison and semistable local-condition factorization.
- J. Park, [*On localization for cubical higher Chow groups*](https://arxiv.org/abs/2108.13561), version 2.
- J. Riou, [*Algebraic K-theory, A¹-homotopy and Riemann–Roch theorems*](https://arxiv.org/abs/0907.2710), version 2.
- C. Soulé, [*Éléments cyclotomiques en K-théorie*](https://www.numdam.org/item/AST_1987__147-148__225_0.pdf), Astérisque **147–148** (1987), 225–257.
- M. Sobiech, [*Annihilators of differential forms over fields of characteristic p*](https://arxiv.org/abs/2105.01319), version 1. Proposition 1.3, p.3, states the leading-term logarithmic lemma with the lexicographic filtration defined on p.2.
- M. Spitzweck, [*A commutative P¹-spectrum representing motivic cohomology over Dedekind domains*](https://arxiv.org/abs/1207.4078), version 3.
- J. Tate, [*Relations between K₂ and Galois cohomology*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), Inventiones mathematicae **36** (1976), 257–274.
- R. W. Thomason, [*Algebraic K-theory and étale cohomology*](https://numdam.org/item/10.24033/asens.1495.pdf), Annales scientifiques de l’École normale supérieure **18** (1985), 437–552, together with the [*erratum*](https://numdam.org/item/10.24033/asens.1596.pdf), **22** (1989), 675–677. Layer 10 uses the corrected descent hypotheses and Bott-localized comparison.
- B. Totaro, [*Milnor K-theory is the simplest part of algebraic K-theory*](https://www.math.ucla.edu/~totaro/papers/public_html/milnor.pdf), author PDF.
- V. Voevodsky, [*Reduced power operations in motivic cohomology*](https://arxiv.org/abs/math/0107109), version 1.
- V. Voevodsky, [*Motivic cohomology with Z/2-coefficients*](https://www.numdam.org/item/10.1007/s10240-003-0010-6.pdf), Publications mathématiques de l’IHÉS **98** (2003), 59–104.
- V. Voevodsky, [*Cancellation theorem*](https://arxiv.org/abs/math/0202012), version 1.
- V. Voevodsky, [*Motives over simplicial schemes*](https://arxiv.org/abs/0805.4431), version 1.
- V. Voevodsky, [*Motivic Eilenberg–MacLane spaces*](https://www.numdam.org/item/PMIHES_2010__112__1_0.pdf), Publications mathématiques de l’IHÉS **112** (2010), 1–99.
- V. Voevodsky, [*Simplicial radditive functors*](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/simplicial_radditive_published.pdf), Journal of K-Theory **5** (2010), 201–244.
- V. Voevodsky, [*On motivic cohomology with Z/l-coefficients*](https://arxiv.org/abs/0805.4430), version 2.
- C. Weibel, [*The K-book: An Introduction to Algebraic K-theory*](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), author PDF dated 29 August 2013. Chapters III, V and VI supply the symbol, higher-character and arithmetic-comparison statements and the worked real-place extension calculations. Page numbers above follow the printed page labels in that PDF.
- The Stacks Project, [Tag 03QQ](https://stacks.math.columbia.edu/tag/03QQ), for the field étale/Galois comparison, and the scheme-theoretic tags cited at their uses. These are interfaces with the existing étale-site supplier, not replacements for its construction.
