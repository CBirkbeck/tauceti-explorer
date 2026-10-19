# K-theory of number fields and S-integers, Part II

This continuation studies the arithmetic action on symplectic K-theory of the integers. Its central objects are extensions of an odd cyclotomic twist by a finite trivial Galois module. CM abelian varieties supply enough explicit classes to determine the extension, and relative group homology supplies its universal property. The endpoint is the finite, p-adic and locally split universal-extension theorem, together with the resulting divisibility of Hodge characteristic numbers for principally polarized abelian families over Q.

The base roadmap ArithmeticKTheory supplies arithmetic K-groups and their étale-cohomological descriptions. Higher Hermitian K-theory remains GeometryOfNumbersAndQuadraticArithmetic GN.6; spectra and group completion remain StableHomotopyKTheory H.4–H.6; the general main theorem of CM remains ComplexMultiplicationAndExplicitReciprocity CM.2. This document plans the CM coefficient-line calculations, the ppav realization comparison, and the identification of the resulting Galois action. Its 42 targets form a complete planning pass. All nine layers are **planned**, with three explicit gaps and 24 precise supplier requests; none is claimed implemented or closed.

The reader document contains the whole roadmap: statements, hypotheses, proof routes, APIs, discriminating Checks and dependencies. The companion [suggested Lean file](../suggested/ArithmeticKTheoryPartII.lean) records only formulas and statements on existing representation and linear-map carriers. The [packet](../packets/ArithmeticKTheoryPartII.json) carries machine-readable target identities. Missing spectra, moduli and realization carriers are mathematical targets here, rather than postulated data in that file.

## Conventions and the endpoint

Throughout the finite-coefficient arithmetic statements, p is an odd prime, n≥1, q=p^n and Λ_q=Z/q. Set K_q=Q(ζ_q), ζ_q=exp(2πi/q), O_q=Z[ζ_q], O′_q=O_q[1/p] and Z′=Z[1/p]. The field H_q is the maximal everywhere-unramified abelian p-extension of K_q inside C. It is distinct from the **full** Hilbert class field H used in CM reciprocity and from the narrow Hilbert field of K_q⁺. The compatible fields H_q form H_∞; Γ=Gal(H_∞/Q). The local theorem uses the separate group G=Gal(Q(p)/Q), with Q(p) maximal unramified outside p, and a decomposition subgroup G_𝔭 obtained by extending a conjugation-fixed prime of H_∞ to Q(p); the extended prime need not itself be fixed.

All representations are left representations. M_q(j)=μ_q(C)^{⊗j} carries χ_cyc^j; negative twists are dual tensor powers. Z_p(j) has its p-adic topology. Arithmetic Frobenius fixes the normalization of the Artin map. Stable homotopy of a space means the homotopy of its **unreduced** suspension spectrum Σ∞₊. At q=3 the construction uses iterated Bott/self-maps, without a homotopy-associative multiplication on S/3. A finite v₁-period is allowed to grow with n; the p-adic inverse limit is not assigned a uniform period.

Write p_±=(1±ψ⁻¹)/2 for the duality projectors. The unscaled hyperbolic map has c_B H=1+ψ⁻¹; hence its positive-factor retraction is (1/2)c_B. The arithmetic kernel inclusion normalized to have Betti projection one is (1/2)H. Inverting 2 never changes its value into 1.

Hermitian forms are linear in the first variable. For a CM coefficient line, the integral alternating form is ω=−Tr b and the positive Hermitian form is h=−2i Σ_{τ∈Φ}τb, with Im h=ω. If J_H is multiplication by i for that CM type, then ω(v,J_Hv)=−h(v,v). Tau Ceti's compatible-structure convention asks for a positive value, so its compatible structure for ω is −J_H; equivalently J_H is compatible with −ω. All Hodge comparisons retain this sign conversion. The unitary map c_H uses Lie(A); with ω=Lie(A)^∨, write ĉh_m(ω)=(−1)^m ch_m(ω)=ch_m(Lie(A)). Thus an odd raw Hodge character has the negative of the c_H pairing, a unit sign that preserves divisibility.

For k≥1, the main extension is

\[
0\longrightarrow K_{4k-2}(\mathbb Z;\mathbb Z_p)
\longrightarrow KSp_{4k-2}(\mathbb Z;\mathbb Z_p)
\xrightarrow{c_H}\mathbb Z_p(2k-1)\longrightarrow0.
\]

Its kernel is finite and Γ acts trivially on it. It is initial among continuous extensions of the displayed twist by finite-type compact trivial Γ-modules, and remains initial with its unique conjugation-equivariant section included in the data. With G in place of Γ the universal property instead requires a G_𝔭-section. Finite coefficients use G_q=Gal(H_q/Q). Bott inversion gives the same statements for every integer k. An abelian-group direct-sum formula does not give a Galois-equivariant section when the kernel is nonzero.

For the characteristic-number endpoint, X/Q is smooth projective, A→X is principally polarized, and dim X=Σn_j with n_j positive odd. If p>max n_j and p divides the numerator of some arithmetic Bernoulli number B_{n_i+1}, then ∫_X∏ch_{n_j}(Lie(A/X)^∨) lies in p Z_(p). The strict inequality and the positive-degree finite-type Hurewicz range 1≤i≤2p−3 are part of the statement. G2 and G3 record the printed endpoint and prime-boundary problems separately.

## Inputs and ownership

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Actual declarations and their hypotheses were read, as were the reviewed library audits for the base arithmetic, Hermitian, homotopy and ppav suppliers. The current readonly Tau Ceti library and all nine roadmaps newer than the atlas snapshot were searched before adding targets. The full current GrothendieckEulerForms and AlgebraicVectorBundles README/Suggested pairs were read as structural models; the current ProfiniteArithmetic boundary was also checked.

| Owner | Imported interface and extension boundary |
| --- | --- |
| Mathlib | Representation, LinearMap, CommRing.Pic, Module.Invertible, absolute groupHomology and its inhomogeneous chains, CategoryTheory.Under. The native bar differential uses inverse actions, so AK2.5 supplies a named convention comparison. |
| Tau Ceti | SymplecticForm.exists_compatible over finite-dimensional real vector spaces. Contractibility of the compatible space and the topological K-theory comparison require their separate supplier. |
| ArithmeticKTheory N.3/N.6/N.7 | Integral finite generation; Bott/étale even-group tables, Kummer edge, comparison ranges and Bernoulli indexing. Existing Keune/class-group-descent statements alone do not supply the exact all-degree tables. |
| MotivicEtaleKTheory M.7 | The exact bott-etale-descent node supplies Thomason's comparison. Its Adams, coefficient and transfer compatibilities are requested through S.6/N.6. |
| GeneralAlgebraicKTheory K.7; SchemeKTheoryOperations S.6 | Coherent tensor products and integral duality/Adams operations. An additive spectrum construction is not by itself multiplicative. |
| StableHomotopyKTheory H.4/H.5/H.6 | Special Γ-spaces, coherent subset models, symplectic group completion, additive spectrum adjunction, Moore/Bockstein and Milnor interfaces. v₁/coefficient and height-one localization coherence is requested explicitly. |
| GeometryOfNumbersAndQuadraticArithmetic GN.6 | The skew-integer Hermitian fiber sequence and odd-primary splitting with the corrected factor two. Existing higher GW carriers are reused. |
| ComplexMultiplicationAndExplicitReciprocity CM.1/CM.2; AbelianSchemesAndArithmeticModuli A5 | CM lattice classification, Serre tensor, polarized Hodge algebraization and Siegel uniformization. The w_τ groupoid reciprocity adapter extends CM.2. |
| PELModuli M1/M2 | ppav stacks, full-level atlases and projective-embedding/isomorphism schemes. AK2.4 specializes these to a graded Γ-diagram. |
| EtaleHomotopyTypes EH.5/EH.6 | smooth-cech-descent, graded-etale-p, comparison-zigzag and automorphism-naturality. Its open strictification G7 propagates to G1 here. |
| ClassFieldTheory Layers 11/13; Chebotarev Layer 10 | The existing arithmetic Artin map, full and narrow class fields, sign-prime existence and local splitting dictionary. These upstream theories are never replanned. |
| ArithmeticGaloisDuality R02.1/R02.2/R02.4 | Continuous compact coefficients, relative homological Hochschild–Serre and Poitou–Tate. Homological and continuous adapters are precise requests. |
| RefinedTraceMethods RT.4:topological; BorelRegulators R.3 | ku/KU, Hodge Chern characters and symplectic stable cohomology/finite-type comparison; the arithmetic identification of that action is owned here. |
| KTheoryFiniteLocalFields L.1; IntegralIwasawaTheory I.5/L3 | Sphere-unit comparison, Bernoulli nonvanishing criterion and conditional Vandiver control. Their generic theorems retain those owners. |

Each target below lists its direct prerequisite identities. Exact existing nodes are used where their statements suffice. A layer reference with an open request is an interface obligation, not a declaration claimed to exist. The complete contracts follow the target layers.


## Layer AK2.0: Cyclotomic Bott and Picard classes

**Build inputs:** `ArithmeticGaloisDuality:R02.2`, `ArithmeticGaloisDuality:R02.4`, `ArithmeticKTheory:N.6`, `GeneralAlgebraicKTheory:K.7`, `KTheoryFiniteLocalFields:L.1`, `MotivicEtaleKTheory:M.7`, `RefinedTraceMethods:RT.4:topological`, `SchemeKTheoryOperations:S.6`, `StableHomotopyKTheory:H.4`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.6`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.


### Universal cyclic Bott class

**Target:** `ArithmeticKTheoryPartII:AK2.0/universal-bott` (theorem).

For odd q, the Bockstein followed by Hurewicz identifies π₂(Σ∞₊B(Z/q);Z/q) with H₁(B(Z/q);Z)=Z/q. Let β_q correspond to 1. Its image in connective complex K-theory under the tautological character is the Bott generator in degree two. Raising the character to a∈(Z/q)× sends β_q to aβ_q. For q>4 its powers generate a split polynomial subalgebra (Z/q)[β_q] in stable homotopy; at q=3 only iterated Bott maps from the supplier contract are used.

**Hypotheses:** p is an odd prime, n≥1 and q=p^n; coefficients Λ_q=Z/q. ζ_q=exp(2πi/q); twists M(j)=μ_q(C)^{⊗j} carry the left action χ_cyc^j; negative powers mean dual tensor powers.

**Prerequisites:** `StableHomotopyKTheory:H.6/moore-spectrum`, `StableHomotopyKTheory:H.6/bockstein-long-exact-sequence`, `StableHomotopyKTheory:H.6/moore-spectrum-multiplication`, `RefinedTraceMethods:RT.4:topological`.

**Proof route:**

1. Compute the low-degree stable-homotopy/Bockstein sequence using the absence of odd-primary stable stems in degrees one and two.

2. Compare the tautological cyclic representation with the topological Bott class, and use its powers for the retraction.

3. Use H.6’s nonassociative exception at q=3 rather than treating all odd Moore spectra as associative rings.

**Acceptance Checks:**

- For q=5 and a=2, the degree-two class maps to twice the generator; the unit in degree zero is retained because suspension is unreduced.

- At q=3 no assertion of a homotopy-associative Moore multiplication is admitted.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), §2.1, Lemma 2.3, pp. 235–237.

**Source match:** Lemma 2.3 identifies the Bockstein-normalized cyclic class and its character image; the polynomial assertion uses the odd Moore multiplication exception stated immediately before it.


### Picard-to-K map

**Target:** `ArithmeticKTheoryPartII:AK2.0/picard-k-map` (construction).

For a commutative ring R, specialize the imported Picard-groupoid construction to invertible R-modules, isomorphisms, and tensor product. Its components are Mathlib’s CommRing.Pic R and its unit automorphisms are R×. The tensor functor to projective modules gives a multiplicative map Σ∞₊|Pic(R)|→K(R), using K.7’s coherent tensor product separately from additive group completion. For a Dedekind domain, representatives by fractional ideals give morphisms from I to J by a∈Frac(R)× satisfying aI=J; these are not restricted to R×.

**Prerequisites:** `mathlib:CommRing.Pic`, `mathlib:Module.Invertible`, `StableHomotopyKTheory:H.5:spectra/picard-one-truncated-spectra`, `GeneralAlgebraicKTheory:K.7`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.4`.

**Proof route:**

1. Use the existing invertible-module carrier and its tensor equivalences, with Core morphisms.

2. Import the generic additive spectrum adjunction and the distinct coherent tensor-product comparison.

3. Verify the automorphism and component comparisons before forming the induced map.

**Uses:** AK2.0 Picard Bott formula: Turns β_q times ideal classes into K-theory classes. AK2.3 Betti calculation: Separates ideal multiplication from symplectic orthogonal addition.

**API:**

- **picard_components** (equivalence): π₀|Pic(R)|≅CommRing.Pic R, carrying tensor product to multiplication.

- **picard_unitLoops** (equivalence): Aut_R(R)≅R×; the map on loops agrees with the unit-to-K₁ map.

- **picard_mapTensor** (compatibility): Tensor of lines maps to K-theory multiplication, while direct sum is K-theory addition.

- **picard_baseChange** (functoriality): Ring maps induce a commuting Picard-to-K square with extension of scalars.

**Definition Checks:**

1. (computation) For a field F, π₀ is trivial and π₁=F×, so the groupoid is not replaced by its component set.

2. (computation) Over Z, the class of the tensor unit maps to 1∈K₀(Z); sending every object to additive zero fails.

3. (non-example) For R=Z, the fractional ideals 2Z and 3Z are isomorphic by multiplication by 3/2; restricting morphisms to Z× incorrectly removes that arrow.

**Acceptance Checks:**

- Check that a representative decomposition by Pic(R) is natural as a module comparison only after choices, without asserting a canonical product decomposition of ring spectra.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), §2.4, Definition 2.6 and (2.3)–(2.4), pp. 239–240; Appendix A.1, pp. 301–304.

**Source match:** Definition 2.6 gives the invertible-module groupoid and its tensor-induced K-map. The fractional-ideal presentation is corrected by E19; Appendix A supplies the additive machine, with multiplicative coherence requested separately.


### Cyclotomic Picard classes

**Target:** `ArithmeticKTheoryPartII:AK2.0/picard-bott` (theorem).

Put K_q=Q(ζ_q), O_q=Z[ζ_q] and O′_q=O_q[1/p]. For k≥1 the map (Pic(O_q)/q)⊗μ_q^{⊗(2k−1)}→K_{4k−2}(O_q;Z/q)^(+) sending [L]⊗ζ_q^{⊗(2k−1)} to β(ζ_q)^{2k−1}([L]−1) is an isomorphism onto the positive eigensummand. For all k∈Z the same formula in Bott-inverted K-theory is an isomorphism. Inverting p does not change this Picard group because the unique prime over p is principal. These identifications are Galois-equivariant; ψ⁻¹ acts by +1 on the target.

**Hypotheses:** p is an odd prime, n≥1 and q=p^n; coefficients Λ_q=Z/q. ζ_q=exp(2πi/q); twists M(j)=μ_q(C)^{⊗j} carry the left action χ_cyc^j; negative powers mean dual tensor powers.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.0/universal-bott`, `ArithmeticKTheoryPartII:AK2.0/picard-k-map`, `KTheoryFiniteLocalFields:L.1/bott-element`, `ArithmeticKTheory:N.6`, `MotivicEtaleKTheory:M.7/bott-etale-descent`, `SchemeKTheoryOperations:S.6`.

**Proof route:**

1. Use the N.6 even-degree cohomology and comparison contract, including its exceptional degree-one boundary.

2. Identify the H² term by the Kummer exact sequence and vanishing of the relevant Brauer group for O′_q.

3. Compare the Kummer edge with the Picard-to-K map and Bott multiplication; retain conjugation and cyclotomic weights.

**Acceptance Checks:**

- For the trivial ideal L=O_q, [L]−1 maps to zero.

- For k=1 the formula lies in K₂ and uses one Bott factor, not β².

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Corollary 2.12, pp. 245–246; Proposition 2.9, pp. 242–243.

**Source match:** Corollary 2.12 identifies reduced ideal classes times an odd Bott power with the positive even group; Proposition 2.9 supplies the connective comparison ranges, retaining degree one as an exception.


### Cyclotomic transfer descent

**Target:** `ArithmeticKTheoryPartII:AK2.0/transfer-descent` (theorem).

For every k∈Z, transfer induces an isomorphism (K^{(β)}_{4k−2}(O′_q;Z/q)^(+))_{Gal(K_q/Q)}≅K^{(β)}_{4k−2}(Z[1/p];Z/q)^(+). There is the parallel isomorphism in degree 4k for the negative eigensummand. In the positive comparison range these identify ordinary groups over O_q and Z. Transfer commutes with the duality involution here after accounting for the inverse different, whose ideal class is principal.

**Hypotheses:** p is an odd prime, n≥1 and q=p^n; coefficients Λ_q=Z/q. ζ_q=exp(2πi/q); twists M(j)=μ_q(C)^{⊗j} carry the left action χ_cyc^j; negative powers mean dual tensor powers.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.0/picard-bott`, `ArithmeticKTheory:N.6`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `ArithmeticGaloisDuality:R02.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `SchemeKTheoryOperations:S.6`.

**Proof route:**

1. Use Poitou–Tate to dualize the transfer into restriction on compactly supported H¹.

2. Apply the relative homological Hochschild–Serre edge; the odd twist and central conjugation eliminate the outer terms.

3. Compare duality with transfer using the trace-dual line and its principal ideal class.

**Acceptance Checks:**

- The source is coinvariants, not invariants; the degree-4k companion uses the negative sign.

- No ordinary degree-one Bott comparison is inferred.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Proposition 2.15 and proof, pp. 247–248; Lemmas 2.11 and 2.14, pp. 243–247.

**Source match:** Proposition 2.15 proves the coinvariant transfer isomorphism from the two étale tables. Its duality discussion uses the trace-dual inverse different, whose principal class removes the twist in this case.


### Artin–Bott transfer square

**Target:** `ArithmeticKTheoryPartII:AK2.0/artin-transfer` (theorem).

Let H_q/K_q be the maximal everywhere-unramified abelian p-extension inside C, and G_q=Gal(H_q/Q). Arithmetic Artin reciprocity identifies Pic(O_q)⊗Z_p with Gal(H_q/K_q). For every k∈Z and M_q=μ_q^{⊗(2k−1)}, the Artin/Bott identifications and transfer give a commuting square from H₁(Gal(H_q/K_q);M_q) to K^{(β)}_{4k−2}(O_q;Z/q)^(+) and from H₁(G_q;M_q) to K^{(β)}_{4k−2}(Z;Z/q)^(+). Its vertical arrows are group-homology pushforward and K-transfer. The bottom map is an isomorphism; H₁(G_q;M_q)≅H₁(G_q,⟨c⟩;M_q), where c is complex conjugation.

**Hypotheses:** p is an odd prime, n≥1 and q=p^n; coefficients Λ_q=Z/q. ζ_q=exp(2πi/q); twists M(j)=μ_q(C)^{⊗j} carry the left action χ_cyc^j; negative powers mean dual tensor powers.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.0/transfer-descent`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `ArithmeticGaloisDuality:R02.2`, `mathlib:groupHomology`.

**Proof route:**

1. Compare Picard classes with the unramified p-class field using arithmetic Frobenius consistently.

2. The homological Hochschild–Serre sequence identifies H₁(G_q;M_q) with twisted class-group coinvariants: the quotient’s homology with the odd twist vanishes by central c.

3. Use the vanishing of H₀ and H₁ of ⟨c⟩ on M_q, since c acts by −1 and 2 is a unit.

**Acceptance Checks:**

- Replacing arithmetic reciprocity by its inverse requires changing both horizontal maps.

- For a regular prime with trivial p-class groups the bottom H₁ and arithmetic kernel are zero.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Proposition 2.17, pp. 248–250; §7.2, pp. 284–285.

**Source match:** Proposition 2.17 compares the Artin class-group map and K-transfer. Section 7.2 uses the odd conjugation action to identify the absolute kernel with the relative group for ⟨c⟩.


**Layer coverage:** planned. Integrate R1–R3, R7–R9 and the relative homological input R13; no ordinary degree-one comparison is assumed.

**Planets:** Universal cyclic Bott class, Picard-to-K map, Cyclotomic Picard classes, Cyclotomic transfer descent, Artin–Bott transfer square.


## Layer AK2.1: Betti–Hodge maps and Bott inversion

**Build inputs:** `GeometryOfNumbersAndQuadraticArithmetic:GN.6`, `RefinedTraceMethods:RT.4:topological`, `StableHomotopyKTheory:H.4`, `StableHomotopyKTheory:H.6`.


### Betti and Hodge maps

**Target:** `ArithmeticKTheoryPartII:AK2.1/betti-hodge` (construction).

Use H.4’s symplectic group completion of finite free unimodular alternating Z-modules, with basepoint component BSp∞(Z)⁺, as KSp(Z). Define c_B:KSp(Z)→K(Z) by forgetting the form. Define c_H:KSp(Z)→ku using Sp(Z)→Sp(R)^top←U^top and the homotopy equivalence on the right. On topological complex K-theory ψ⁻¹ is complex conjugation. Hermitian forms are linear in their first variable; the Hodge complex structure is fixed by the condition that its imaginary Hermitian pairing equals the supplied alternating form.

**Prerequisites:** `StableHomotopyKTheory:H.4/hermitian-group-completion-integers`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6`, `RefinedTraceMethods:RT.4:topological`, `tauceti:TauCeti.SymplecticForm.exists_compatible`.

**Proof route:**

1. Import the KSp carrier and its plus/group-completion equivalence; apply forgetful and scalar-extension functors.

2. Use the compatible-complex-structure space and its contractibility to identify topological symplectic and unitary classifying spaces.

3. Compare the Hodge structure sign with the existing compatible-form theorem; do not choose a discontinuous arbitrary inverse.

**Uses:** AK2.3 CM calculations and splitting: Provides the two detecting maps. AK2.6 universal extension: c_H is the quotient and c_B singles out the conjugation splitting.

**API:**

- **betti_orthogonalSum** (compatibility): c_B preserves orthogonal addition and scalar extension.

- **hodge_unitaryComparison** (characterisation): On a positive Hermitian vector space c_H is its unitary class with the stated imaginary-part convention.

- **betti_hyperbolic** (compatibility): For unscaled hyperbolic H, c_B H=1+ψ⁻¹; on the positive summand its value is twice the identity.

- **hodge_duality** (compatibility): Conjugating the complex structure induces ψ⁻¹ on ku.

**Definition Checks:**

1. (computation) A symplectic plane has Betti rank 2 and Hodge rank 1.

2. (compatibility) In degree 4k−2 complex conjugation is −1 on ku; in degree 4k it is +1.

3. (non-example) For a rank-one module, c_B H([Z])=2[Z] even after inverting 2; an unscaled retraction c_B H=id is rejected.

**Acceptance Checks:**

- The standard rank-two symplectic lattice maps to 2 in K₀(Z) and 1 in π₀ku.

- The two maps are maps of spectra before any Galois action is imposed; c_B is not declared Galois-equivariant on all KSp groups.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), §§3.1–3.3, pp. 250–254.

**Source match:** Definitions 3.1 and 3.3 use forgetting the form and the topological symplectic-to-unitary equivalence. The linear-first imaginary-part convention requires the recorded sign adapter to the native compatible structure.


### Bott-inverted symplectic K-theory

**Target:** `ArithmeticKTheoryPartII:AK2.1/bott-ksp` (construction).

For q=p^n choose the compatible Adams v₁ self-map on a mod-q Moore spectrum of degree m=2p^{n−1}(p−1) supplied by H.6, and let T_q be its telescope. Put KSp^{(β)}(Z;Z/q)=KSp(Z)∧T_q, with the associated ordinary-to-periodic map. Define the Z_p version by the homotopy inverse limit over the coefficient tower. The Betti and Hodge maps extend to K^{(β)} and KU. The q=3 construction uses an iterated self-map, with no associative Moore-ring assumption.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.1/betti-hodge`, `StableHomotopyKTheory:H.6`, `StableHomotopyKTheory:H.6/moore-spectrum-change-of-coefficients`, `RefinedTraceMethods:RT.4:topological`.

**Proof route:**

1. Import the compatible telescope and change-of-coefficients contract.

2. Smash with KSp and extend the detection maps through the telescope.

3. Form the p-adic homotopy limit, retaining the Milnor sequence until finiteness eliminates its derived limit.

**Uses:** AK2.3 periodic comparison: Extends the Betti–Hodge computation to all integer degrees. AK2.7 all-twist theorem: Realizes negative odd cyclotomic twists.

**API:**

- **kspBott_map** (functoriality): The comparison is natural in coefficient reduction and the imported symplectic spectrum.

- **kspBott_shift** (equivalence): At level q the self-map gives a degree-m periodic equivalence.

- **kspBott_hodge** (compatibility): c_H extends to KU and agrees with the connective map in its comparison range.

- **kspBott_limit** (characterisation): The Z_p object is holim_n of the q-level objects, with its Milnor exact sequence.

**Definition Checks:**

1. (computation) For q=5, m=8; this definition does not give a degree-two Bott class over Z without adjoining ζ₅.

2. (non-example) At q=3 an iterated v₁ self-map is allowed, whereas associativity of S/3 is not.

3. (compatibility) The coefficient reduction from p^{n+1} to p^n intertwines telescope maps after compatible iteration; independently chosen periodicity isomorphisms do not suffice.

**Acceptance Checks:**

- Finite coefficients admit the stated v₁-periodicity. No fixed-period assertion is made for the inverse-limit Z_p groups.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), §2.6, Remark 2.8, pp. 240–243; §3.6, pp. 257–258.

**Source match:** Remark 2.8 and §3.6 use v₁ self-maps and compatible periodic spectra, with p-adic groups defined by completion. The iterated mod-3 construction is retained without an associative Moore product.


**Layer coverage:** planned. Integrate R4–R6 and the telescope/coefficient compatibilities.

**Planets:** Betti and Hodge maps, Bott-inverted symplectic K-theory.


## Layer AK2.2: CM coefficient lines and prescribed types

**Build inputs:** `AbelianSchemesAndArithmeticModuli:A5`, `ArithmeticKTheoryPartII:AK2.0`, `ComplexMultiplicationAndExplicitReciprocity:CM.1`, `ComplexMultiplicationAndExplicitReciprocity:CM.2`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.


### Hermitian coefficient-line groupoids

**Target:** `ArithmeticKTheoryPartII:AK2.2/hermitian-lines` (definition).

For a CM field E, maximal order O with conjugation, and an invertible O-module ω with semilinear involution ι, let P(O,ω,ι) have invertible O-modules L with a perfect O-linear pairing b:L⊗_O bar L≅ω such that swapping the two factors agrees with ι. Arrows are O-linear isometries. Set P⁺=P(O,O,conjugation) and P⁻=P(O,ω_{O/Z},−conjugation), where the inverse different is the trace-dual line. Tensoring coefficient lines gives P⁺ an action on P⁻. A P⁻ object has a CM type determined by the signs of Im τ(b(x,x)), x≠0. This specializes CM.2’s polarized lattices; it is not another definition of CM lattices.

**Prerequisites:** `ComplexMultiplicationAndExplicitReciprocity:CM.2/polarized-cm-lattice-data`, `mathlib:Module.Invertible`, `ArithmeticKTheoryPartII:AK2.0/picard-k-map`.

**Proof route:**

1. Reuse invertible modules, conjugate scalar action and the trace-dual inverse-different interface.

2. Impose perfectness and the coefficient-line swap condition; isometries form the Core groupoid.

3. Tensor forms and coefficient lines, and compare the skew form with the existing polarized-lattice sign convention.

**Uses:** AK2.2 CM type realization: Tracks underlying ideal classes without losing polarization. AK2.3 CM classes: Supplies μ_q automorphisms and the coefficient-line tensor functors.

**API:**

- **hermitianLine_ext** (extensionality): An isometry is determined by its underlying O-linear equivalence.

- **hermitianLine_tensor** (structure): Tensoring takes coefficient lines (ω,ι),(η,κ) to (ω⊗η,ι⊗κ), with the standard associativity and unit isometries.

- **hermitianLine_normUnits** (equivalence): Aut(L,b)≅{u∈O× | u bar u=1}.

- **hermitianLine_typeTensor** (compatibility): A totally positive P⁺ line preserves type on P⁻; (O,−1) changes Φ to bar Φ.

**Definition Checks:**

1. (computation) For E=Q(i), O=Z[i], the standard positive line has automorphisms {±1,±i}, not every nonzero element of E.

2. (non-example) For odd q, the norm-one units of O_q include μ_{2q}; identifying the automorphism group with μ_q loses −1.

3. (compatibility) Tensor of two skew coefficient-line objects changes the coefficient involution to a positive one; declaring P⁻ closed under the same tensor law fails.

**Acceptance Checks:**

- The full automorphism group of an object is the norm-one unit group; μ_q is only a specified subgroup when E=K_q.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), §§4.2–4.3, pp. 260–265.

**Source match:** Definitions 4.2–4.4 give perfect coefficient-line pairings, isometries, conjugate tensor factors and the P⁺ action on P⁻. Norm-one units are the automorphisms; μ_q is only the subgroup used for Bott classes.


### Trace polarization and CM realization

**Target:** `ArithmeticKTheoryPartII:AK2.2/serre-tate-comparison` (comparison).

There is a functor ST:P⁻_E→A_g(C) with g=[E:Q]/2. It sends (L,b) to the principally polarized CM abelian variety obtained from the symplectic lattice (L_Z,−Tr_{E/Q}b) and its unique compatible complex structure of type Φ(L,b). The positive Hermitian form is h(x,y)=−2i Σ_{τ∈Φ}τ b(x,y), with Im h=−Tr b. For this linear-first convention, ω(v,J_H v)=−h(v,v); hence the compatible almost-complex structure in Tau Ceti’s convention is −J_H for ω=Im h. Equivalently J_H is compatible with −ω. This sign adapter is required before invoking exists_compatible. The O-action is faithful and its Rosati involution restricts to conjugation. ST identifies P⁻ with the rank-one projective O-homology locus of CM.2’s classification. For a positive Hermitian O-line X, ST(L⊗X)≅ST(L)⊗_O X compatibly with polarization; (O,−1) gives complex conjugation.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.2/hermitian-lines`, `ComplexMultiplicationAndExplicitReciprocity:CM.2/arbitrary-dimensional-classification`, `ComplexMultiplicationAndExplicitReciprocity:CM.1/cm-serre-tensor`, `AbelianSchemesAndArithmeticModuli:A5/polarized-hodge-equivalence`, `tauceti:TauCeti.SymplecticForm.exists_compatible`.

**Proof route:**

1. Check perfection of −Tr b against the inverse different and compare the sign with CM.2’s ξ convention.

2. Apply the imported polarized Hodge equivalence and CM classification, rather than reproving algebraization.

3. Use the existing Serre tensor functor and show its polarization agrees with tensoring coefficient lines.

**Acceptance Checks:**

- For E=Q(i), the lattice rank is two and the resulting abelian variety has dimension one.

- An isometry of CM lines induces a polarized O-linear isomorphism; an arbitrary isogeny is not such an arrow.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), §§4.1–4.3, pp. 259–265; Appendix A.5 discussion, pp. 316–317.

**Source match:** Section 4.3 constructs the trace polarization and positive Hermitian form for a unique CM type, then applies complex uniformization. The native almost-complex convention reverses J_H; positive-line Serre tensor and the negative unit line have distinct effects.


### Split primes with prescribed signs

**Target:** `ArithmeticKTheoryPartII:AK2.2/sign-prime` (theorem).

For E=K_q and E⁺ its real subfield, any sign function on the real embeddings of E⁺ is realized by t∈O_{E⁺} whose principal ideal is a prime away from p splitting in E, so (t)O_E=x bar x for a prime ideal x of O_E. The narrow Hilbert class field used in the proof is the full narrow class field of E⁺, distinct from the p-Hilbert field H_q.

**Hypotheses:** p is an odd prime, n≥1 and q=p^n; coefficients Λ_q=Z/q. ζ_q=exp(2πi/q); twists M(j)=μ_q(C)^{⊗j} carry the left action χ_cyc^j; negative powers mean dual tensor powers.

**Prerequisites:** `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Proof route:**

1. Encode the prescribed sign pattern by a narrow ideal class, using the existing narrow class-group/sign exact sequence.

2. The narrow Hilbert class field is unramified at finite places, whereas E/E⁺ is ramified at the prime above p; hence their intersection is E⁺.

3. Apply Chebotarev to the desired class and trivial Frobenius in E/E⁺, and choose a generator with the specified signs.

**Acceptance Checks:**

- For a real field with one embedding, both positive and negative sign patterns must be supported.

- The proof refers to embeddings of E⁺ into R, not to nonexistent real embeddings of E.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Lemma 4.8, pp. 266–267.

**Source match:** Lemma 4.8 applies Chebotarev to the narrow class field of the real subfield and its disjoint CM extension. E2 corrects the real-embedding and rational-prime notation in the printed proof.


### CM types and ideal differences

**Target:** `ArithmeticKTheoryPartII:AK2.2/cm-type-realization` (theorem).

For q odd, every CM type Φ on K_q and every invertible ideal L of O_q admit B₁,B₂∈P⁻_{K_q}, both of type Φ, whose underlying ideal classes satisfy [B₁][B₂]^{−1}=[L][bar L]^{−1}. Thus all types occur, while prescribed anti-conjugate ideal differences can be realized without changing the Hodge type.

**Hypotheses:** p is an odd prime, n≥1 and q=p^n; coefficients Λ_q=Z/q. ζ_q=exp(2πi/q); twists M(j)=μ_q(C)^{⊗j} carry the left action χ_cyc^j; negative powers mean dual tensor powers.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.2/hermitian-lines`, `ArithmeticKTheoryPartII:AK2.2/sign-prime`.

**Proof route:**

1. Use a purely imaginary generator δ of the inverse different to start with underlying modules O_q and L/bar L.

2. Apply the prescribed-sign split-prime theorem to correct each polarization sign while keeping their ratio of ideal classes unchanged.

3. Verify the resulting pairings are perfect and the types equal Φ.

**Acceptance Checks:**

- For L=O_q the two underlying classes have equal ratio one.

- Changing a single conjugate pair in Φ must be realizable without changing the requested ideal ratio.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Proposition 4.7 and proof, pp. 265–267.

**Source match:** Proposition 4.7 realizes every type and the anti-conjugate ideal ratio. Its split-prime sign correction permits the two representatives to have the same type without fixing each individual ideal class.


**Layer coverage:** planned. Integrate the CFT/Chebotarev sign-prime adapters and existing CM/A5 comparisons.

**Planets:** Hermitian coefficient-line groupoids, Split primes with prescribed signs, CM types and ideal differences.


## Layer AK2.3: CM generation and the Betti–Hodge computation

**Build inputs:** `ArithmeticKTheory:N.6`, `ArithmeticKTheoryPartII:AK2.0`, `ArithmeticKTheoryPartII:AK2.1`, `ArithmeticKTheoryPartII:AK2.2`, `GeneralAlgebraicKTheory:K.7`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6`, `MotivicEtaleKTheory:M.7`, `RefinedTraceMethods:RT.4:topological`, `StableHomotopyKTheory:H.4`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.6`.


### CM Bott classes

**Target:** `ArithmeticKTheoryPartII:AK2.3/cm-class` (construction).

For (L,b)∈P⁻_{K_q} and k≥1, let z_{L,b}=β_q^{2k−1}[L,b]∈KSp_{4k−2}(Z;Z/q). Here β acts through the specified μ_q subgroup of norm-one automorphisms, the unreduced stable nerve of P⁻, and its trace-form map to KSp. Products are supplied as iterated maps at q=3. Tensoring positive lines acts through this stable construction; a class [L,b] is in degree zero and its Bott translate has degree 4k−2.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.0/universal-bott`, `ArithmeticKTheoryPartII:AK2.2/hermitian-lines`, `ArithmeticKTheoryPartII:AK2.2/serre-tate-comparison`, `ArithmeticKTheoryPartII:AK2.1/betti-hodge`, `GeneralAlgebraicKTheory:K.7`, `StableHomotopyKTheory:H.4/group-completion-adjunction`, `StableHomotopyKTheory:H.5:spectra`.

**Proof route:**

1. Use μ_q→Aut(L,b) to obtain the cyclic stable source.

2. Apply the trace-form functor and the additive spectrum adjunction, importing the compatible tensor/module pairing.

3. Fix Bott powers and coefficient maps before passing between different CM objects.

**Uses:** AK2.3 generation: Builds arithmetic-kernel and Hodge-quotient generators. AK2.6 cocycle comparison: Computes Galois differences on explicit geometric classes.

**API:**

- **cmClass_isometry** (simp): Isometric CM lines define the same z class.

- **cmClass_betti** (compatibility): Its Betti image is the K-transfer of the corresponding Bott/ideal class.

- **cmClass_type** (compatibility): Its Hodge image depends on the CM type through the type character sum.

- **cmClass_coefficients** (functoriality): Reduction of coefficients and restriction of roots of unity commute with the class map through the compatible Bott tower.

**Definition Checks:**

1. (computation) At k=1 the output lies in degree two; replacing β^{2k−1} by β^k fails for k=2.

2. (computation) At q=5, the types {1,2} and {−1,2} give Hodge scalars 3 and 1 in F₅ for k=1.

3. (compatibility) For two CM lines of the same type Φ their Hodge images agree. Their Betti difference is tr(β^{2k−1}([L₁]−[L₂])); a nonzero transfer therefore gives distinct classes with equal Hodge images.

**Acceptance Checks:**

- The construction keeps the degree-zero component rather than replacing the stable nerve by reduced homology.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), §5, pp. 267–272, especially (5.1) and (5.3).

**Source match:** The maps (5.1)–(5.3) use the specified root-of-unity automorphisms of CM lines to send the universal stable Bott class to KSp. Their degree and coefficient conventions give the exponent 2k−1.


### Hodge type character formula

**Target:** `ArithmeticKTheoryPartII:AK2.3/hodge-character` (theorem).

If Φ⊂(Z/q)× is the type of (L,b), then c_H(β_q^i[L,b])=(Σ_{a∈Φ}a^i)·bott^i in π_{2i}(ku;Z/q). For odd i, the span of these scalars as Φ varies is all Z/q: changing the choice in one conjugate pair changes the sum by ±2a^i, a unit. Consequently c_H:KSp_{4k−2}(Z;Z/q)→Z/q is onto for k≥1, independently of the Betti–Hodge splitting theorem.

**Hypotheses:** p is an odd prime, n≥1 and q=p^n; coefficients Λ_q=Z/q. ζ_q=exp(2πi/q); twists M(j)=μ_q(C)^{⊗j} carry the left action χ_cyc^j; negative powers mean dual tensor powers.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.3/cm-class`, `ArithmeticKTheoryPartII:AK2.2/cm-type-realization`, `RefinedTraceMethods:RT.4:topological`.

**Proof route:**

1. Decompose the CM Hodge representation into characters indexed by Φ.

2. Apply the universal Bott character formula to each summand.

3. Change one conjugate pair and use that 2 and a are units. This proves surjectivity without using Theorem 3.5.

**Acceptance Checks:**

- For q=5, i=1, changing {1,2} to {−1,2} changes 3 to 1, a unit difference.

- For even i conjugate-pair switching has zero difference; the oddness hypothesis is essential.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Proposition 5.2, pp. 268–270; Proposition 3.8, pp. 256–257.

**Source match:** Proposition 5.2 computes the unitary character sum. Switching one conjugate pair changes an odd power sum by a unit, giving the independent surjectivity input for Proposition 3.8.


### Betti transfer formula

**Target:** `ArithmeticKTheoryPartII:AK2.3/betti-transfer` (theorem).

For (L,b)∈P⁻_{K_q}, c_B(z_{L,b})=tr_{O_q/Z}(β(ζ_q)^{2k−1}([L]−1)). This depends only on L. The term tr(β^{2k−1}) vanishes because conjugation acts with sign −1 on the odd Bott power whereas transfer lands in the positive eigensummand.

**Hypotheses:** p is an odd prime, n≥1 and q=p^n; coefficients Λ_q=Z/q. ζ_q=exp(2πi/q); twists M(j)=μ_q(C)^{⊗j} carry the left action χ_cyc^j; negative powers mean dual tensor powers.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.3/cm-class`, `ArithmeticKTheoryPartII:AK2.0/picard-bott`, `ArithmeticKTheoryPartII:AK2.0/transfer-descent`.

**Proof route:**

1. Compare the trace-form forgetful functor with restriction of scalars of the underlying O_q-module.

2. Use Picard-to-K multiplicativity for the ideal factor.

3. Remove the unit term by conjugation and the invertibility of 2.

**Acceptance Checks:**

- If L=O_q the Betti image is zero even when its Hodge image is nonzero.

- The exponent is 2k−1 throughout, including the Galois difference calculation.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), §5.2, diagram (5.7) and Corollary 5.4, pp. 271–272.

**Source match:** Diagram (5.7) and Corollary 5.4 identify forgetting the form with K-transfer. Conjugation removes the transferred odd Bott unit term, leaving the reduced ideal class.


### Betti–Hodge splitting theorem

**Target:** `ArithmeticKTheoryPartII:AK2.3/betti-hodge-splitting` (theorem).

For i≥0 and q odd, (p_+c_B,p_-c_H):KSp_i(Z;Z/q)≅K_i(Z;Z/q)^(+)⊕π_i(ku;Z/q)^(−), where p_±=(1±ψ⁻¹)/2. In degree 4k−2, k≥1, this is K_{4k−2}(Z;Z/q)⊕Z/q, with the arithmetic term identified with H²_et(Z[1/p];μ_q^{⊗2k}). For i>0 the p-adic groups vanish for i≡0,1 mod4, are K_i(Z;Z_p)⊕Z_p for i≡2 mod4, and are K_i(Z;Z_p) for i≡3 mod4. The direct-sum splitting is an abelian-group assertion, not a Galois-equivariant splitting of the main extension.

**Hypotheses:** p is an odd prime, n≥1 and q=p^n; coefficients Λ_q=Z/q. ζ_q=exp(2πi/q); twists M(j)=μ_q(C)^{⊗j} carry the left action χ_cyc^j; negative powers mean dual tensor powers.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.1/betti-hodge`, `ArithmeticKTheoryPartII:AK2.3/hodge-character`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6`, `ArithmeticKTheory:N.6`, `RefinedTraceMethods:RT.4:topological`, `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`.

**Proof route:**

1. Import the Karoubi fiber sequence and odd-primary Witt calculation with the corrected unscaled-H normalization.

2. Compute its Betti–Hodge composite: the hyperbolic part maps by 1+ψ⁻¹, hence by 2 on the positive factor.

3. Use the Hodge-unit calculation to identify the other factor, then pass to the p-adic limit using finite generation.

**Acceptance Checks:**

- Degree zero is Z/q→Z/q via p_+c_B, multiplication by 2 on a symplectic-plane generator, hence an isomorphism for odd q.

- For p=3 the p-adic degree-three group agrees with K₃(Z;Z₃)=Z/3; the Hodge factor is zero.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Theorem 3.5 and Corollary 3.6, pp. 253–256.

**Source match:** Theorem 3.5 and Corollary 3.6 give the odd-primary two-factor comparison and positive p-adic degree table. The proof uses c_BH=1+ψ⁻¹, so E18 corrects the earlier retraction normalization.


### CM classes generate symplectic K-theory

**Target:** `ArithmeticKTheoryPartII:AK2.3/cm-generation` (theorem).

For every odd q and k≥1, the map π^s_{4k−2}(|P⁻_{K_q}|;Z/q)→KSp_{4k−2}(Z;Z/q) is onto. For an ideal L, choose pairs of CM lines for L and O_q having a common type. The four-class difference has zero Hodge image and Betti image 2·tr(β^{2k−1}([L]−1)). The arithmetic transfer is onto and 2 is a unit; combine these kernel generators with one Hodge-unit combination.

**Hypotheses:** p is an odd prime, n≥1 and q=p^n; coefficients Λ_q=Z/q. ζ_q=exp(2πi/q); twists M(j)=μ_q(C)^{⊗j} carry the left action χ_cyc^j; negative powers mean dual tensor powers.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.3/hodge-character`, `ArithmeticKTheoryPartII:AK2.3/betti-transfer`, `ArithmeticKTheoryPartII:AK2.2/cm-type-realization`, `ArithmeticKTheoryPartII:AK2.0/transfer-descent`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6`, `ArithmeticKTheoryPartII:AK2.3/betti-hodge-splitting`.

**Proof route:**

1. Use the Betti–Hodge isomorphism, already proved using the independent type-sum surjectivity argument, to detect all classes.

2. Evaluate the four CM classes with the preceding Hodge and Betti formulas.

3. Generate the arithmetic kernel by transfer and obtain the quotient by the independent Hodge-surjectivity calculation.

**Acceptance Checks:**

- The four-class Betti image contains the factor 2; removing it before division by its unit is an error.

- Hodge surjectivity precedes the splitting; CM generation uses that splitting and is not used to prove it.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Proposition 5.1, pp. 267–268, and §5.3, pp. 272–273.

**Source match:** Proposition 5.1 is proved in §5.3 by four CM classes with one common type: their Hodge terms cancel and their Betti term is twice the transferred reduced ideal class. The prior independent Hodge calculation avoids a dependency cycle.


### Periodic and K(1)-local comparison

**Target:** `ArithmeticKTheoryPartII:AK2.3/periodic-comparison` (theorem).

The Betti–Hodge map for KSp^{(β)} gives KSp^{(β)}_i(Z;Z/q)≅K^{(β)}_i(Z;Z/q)^(+)⊕π_i(KU;Z/q)^(−) for every integer i. For i≥0 it agrees with connective KSp. After p-completion this periodic spectrum is L_{K(1)}KSp(Z), with the localization comparison specified by H.6’s telescope contract. The analogous comparison for algebraic K-theory is imported; the exceptional degree-one comparison over Z is retained there.

**Hypotheses:** p is an odd prime, n≥1 and q=p^n; coefficients Λ_q=Z/q. ζ_q=exp(2πi/q); twists M(j)=μ_q(C)^{⊗j} carry the left action χ_cyc^j; negative powers mean dual tensor powers.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.1/bott-ksp`, `ArithmeticKTheoryPartII:AK2.3/betti-hodge-splitting`, `StableHomotopyKTheory:H.6`, `MotivicEtaleKTheory:M.7/bott-etale-descent`.

**Proof route:**

1. Apply compatible telescopes to the odd-primary splitting.

2. Use the imported connective ku→KU range and arithmetic comparison theorem.

3. Apply the height-one localization comparison, not a formal assertion that every telescope is a K(1)-localization.

**Acceptance Checks:**

- At i=−2 the KU-negative factor occurs; it is absent in degree −4.

- The positive-degree comparison for KSp does not imply that K₁(Z)→K₁^{(β)}(Z) is an isomorphism.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Corollary 3.10 and Remark 3.11, pp. 257–258.

**Source match:** Corollary 3.10 gives the all-degree periodic splitting and connective KSp range. Remark 3.11 identifies the completed height-one localization, with the generic telescope comparison requested from H.6.


**Layer coverage:** planned. Integrate the corrected GN.6 splitting R5, topological K-theory R4 and height-one telescope R6.

**Planets:** CM Bott classes, Hodge type character formula, Betti transfer formula, Betti–Hodge splitting theorem, CM classes generate symplectic K-theory, Periodic and K(1)-local comparison.


## Layer AK2.4: Arithmetic ppav realization and spectrum action

**Build inputs:** `AbelianSchemesAndArithmeticModuli:A5`, `ArithmeticKTheoryPartII:AK2.2`, `ArithmeticKTheoryPartII:AK2.3`, `EtaleHomotopyTypes:EH.5`, `EtaleHomotopyTypes:EH.6`, `PELModuli:M1`, `PELModuli:M2`, `StableHomotopyKTheory:H.4`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.6`.


### Polarized abelian Γ-groupoid

**Target:** `ArithmeticKTheoryPartII:AK2.4/ppav-gamma` (construction).

For a finite pointed set T, define A(T) from principally polarized abelian varieties (A,λ) and a unital ring map φ:Z^T→End(A) whose image is fixed by the Rosati involution defined by λ. Put e=1−e_* and select eA. Arrows are polarized isomorphisms of selected factors commuting with the Z^T-action. For f:T→U, restriction along f*:Z^U→Z^T defines the Γ map. The stack is equivalent to (∐_{g≥0}A_g)^{T\{*}}. This is a ppav specialization of H.4’s Γ construction and the imported ppav moduli stack, not a second generic Γ-space.

**Prerequisites:** `StableHomotopyKTheory:H.4/gamma-space`, `StableHomotopyKTheory:H.4/coherent-subset-construction`, `PELModuli:M1`, `PELModuli:M2`, `AbelianSchemesAndArithmeticModuli:A5/polarized-hodge-equivalence`.

**Proof route:**

1. Use the imported ppav stack and split Rosati-selfadjoint idempotents into orthogonal polarized factors.

2. Define restriction using f* and compare its selected factor to the product over non-basepoint fibers.

3. Verify coherence of the product decompositions using the generic Γ-space supplier.

**Uses:** AK2.4 rigidification: Algebraizes coherent orthogonal addition. AK2.4 spectrum action: Ensures the Galois action respects the infinite-loop structure.

**API:**

- **ppavGamma_restrict** (functoriality): Pointed-set composition gives restriction functors with the specified coherent identifications.

- **ppavGamma_segal** (equivalence): Projection to the non-basepoint factors identifies A(T) with A(S⁰)^{T\{*}}.

- **ppavGamma_grade** (data): Grades are dimension vectors (g_t); a pointed map sums entries in each non-basepoint fiber.

- **ppavGamma_trace** (compatibility): Integral homology with the polarization gives the imported symplectic Γ model.

**Definition Checks:**

1. (computation) For T={*,a,b}, two non-basepoint factors of dimensions 1 and 2 have grade (1,2).

2. (computation) Folding a and b to one non-basepoint gives their product, dimension 3; sending b to * removes that selected factor.

3. (degenerate) For T={*}, all ambient ppav objects have selected factor zero and unique selected-factor morphisms; the nerve is contractible rather than literally one point.

**Acceptance Checks:**

- A({*}) is equivalent to the terminal groupoid, so its nerve is contractible; a chosen strict terminal model is a further equivalence.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Appendix A.4, pp. 313–315.

**Source match:** Appendix A.4 uses Rosati-selfadjoint idempotents and selected-factor isomorphisms to model ppav products over finite pointed sets. E15 and E17 fix strict terminality and which datum defines Rosati.


### Rigidified ppav simplicial model

**Target:** `ArithmeticKTheoryPartII:AK2.4/rigidified-model` (construction).

Rigidify the selected factor in A(T) by a projective embedding from the third power of the ample line bundle Δ*L, where L represents the principal polarization correspondence. Let U(T) be the coproduct of the resulting quasi-projective parameter schemes over embedding dimension and Hilbert polynomial. Its Čech nerve Z(T)_r has r+1 embeddings together with compatible isomorphisms of their ppav objects. It is a specified coproduct of quasi-projective simplicial schemes over Q, graded by dimension vectors. The construction is Γ-functorial through the imported product/rigidification coherence contract; it does not claim the entire unbounded coproduct is one quasi-projective scheme.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.4/ppav-gamma`, `PELModuli:M1`, `PELModuli:M2`, `EtaleHomotopyTypes:EH.5/smooth-cech-descent`.

**Proof route:**

1. Use the ample polarization line to obtain embeddings on each finite Hilbert-polynomial piece.

2. Take the isomorphism schemes and form the Čech nerve in the smooth stack atlas.

3. Retain the explicit dimension grading and coherent product maps when changing embeddings.

**Uses:** AK2.4 Betti model: Compares algebraic moduli with BSp. AK2.4 field action: Provides a Q-defined graded simplicial object for étale realization.

**API:**

- **ppavModel_cechFaces** (structure): Faces omit one embedding and compose its adjacent isomorphisms; degeneracies repeat an embedding.

- **ppavModel_grades** (compatibility): Every face and degeneracy preserves the dimension vector, and Γ maps push it forward by summing fibers.

- **ppavModel_refinement** (equivalence): Changing projective embedding gives a common atlas refinement and an equivalent realized groupoid.

- **ppavModel_descent** (compatibility): Betti realization computes the analytic ppav stack by EH.5 smooth descent.

**Definition Checks:**

1. (degenerate) The zero-dimensional ppav is represented and gives the monoidal unit.

2. (computation) At simplicial degree one the data contain two embeddings and one isomorphism, not one embedding.

3. (non-example) For T=S⁰, arbitrarily large genera occur in different grades; replacing U(T) by a single fixed finite-type parameter scheme omits objects.

**Acceptance Checks:**

- For r=0 the nerve is U(T), not a double fiber product; all descent is applied on smooth atlas pieces.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Appendix A.4, pp. 314–315.

**Source match:** Appendix A.4 constructs embedding atlases and their Čech nerve. The target specifies Hilbert-polynomial pieces and r+1 factors rather than asserting finite type for the whole unbounded union.


### Betti model of symplectic K-theory

**Target:** `ArithmeticKTheoryPartII:AK2.4/betti-model` (theorem).

The analytic ppav stack of genus g is H_g//Sp_{2g}(Z), where Siegel space H_g is contractible. Its Betti realization is therefore weakly equivalent to BSp_{2g}(Z). Level N≥4 gives a smooth finite-level atlas; quotient singular complexes are compared by weak equivalences, not literal simplicial isomorphisms. For every finite pointed T, Sing_an Z_C(T)≃N SP_T(Z) naturally as special Γ-spaces; at S⁰ this is ∐_g BSp_{2g}(Z). Applying the existing Segal machine gives KSp(Z).

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.4/rigidified-model`, `StableHomotopyKTheory:H.4/hermitian-group-completion-integers`, `StableHomotopyKTheory:H.4/segal-delooping-theorem`, `AbelianSchemesAndArithmeticModuli:A5/siegel-analytic-family`, `EtaleHomotopyTypes:EH.5/smooth-cech-descent`, `PELModuli:M2`, `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.4`.

**Proof route:**

1. Import polarized complex uniformization and contractibility of Siegel space.

2. Use the level cover and smooth descent to identify the analytic stack quotient.

3. Compare the homology lattice functor on each selected factor and use H.4’s group-completion comparison.

**Acceptance Checks:**

- For g=0 the analytic component is a point; for g=1 its homotopy type retains SL₂(Z) isotropy.

- A special Γ-space has Ω-equivalences in levels n≥1. Its zeroth replacement is group completion: N→Z on genus components, not an equivalence before completion.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Appendix A.3–A.4, Proposition A.13, pp. 311–315.

**Source match:** The uniformization in A.3 and Proposition A.13 identify the analytic ppav nerve with the symplectic Γ model. Siegel contractibility gives each BSp component; the zeroth Segal step is group completion.


### Galois action on the symplectic spectrum

**Target:** `ArithmeticKTheoryPartII:AK2.4/spectrum-action` (construction).

Algebraic conjugation sends a complex ppav with structure map φ to the same underlying scheme with structure map Spec(σ⁻¹)∘φ, and transports its polarization and arrows. This gives a left Aut(C)-action: σ·(τ·A)=(στ)·A. For an odd prime p, use componentwise graded p-completed étale realization of the Q-defined Z(T), with EH.6’s comparison, to obtain a homotopy-coherent Aut(C)-action by spectrum maps on KSp(Z)^∧_p and compatible mod-p^n spectra. For p>3 the vanishing of H₁(A_g;F_p) allows the direct finite-type comparison on each genus. For p=3 first smash each connected component, pointed by a rational ppav, with the simply connected Moore space M(Z/p^n,2), realize this simplicially, compare, then desuspend twice and pass through the tower. Naturality includes the discrete complex-point map. The action is independent, up to the supplied coherent equivalences, of rigidifications and basepoint choices.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.4/betti-model`, `EtaleHomotopyTypes:EH.6/graded-etale-p`, `EtaleHomotopyTypes:EH.6/comparison-zigzag`, `EtaleHomotopyTypes:EH.6/automorphism-naturality`, `StableHomotopyKTheory:H.4/segal-delooping-theorem`, `StableHomotopyKTheory:H.6`, `EtaleHomotopyTypes:EH.6`.

**Proof route:**

1. Check finite-dimensional mod-p cohomology separately on each dimension vector; do not p-complete the infinite component set as one object.

2. Apply EH.6 automorphism naturality to discrete points and its Betti comparison. For p=3 use the Moore-smash construction before invoking simple-connectivity.

3. Apply the homotopy-coherent Segal and coefficient-tower interface. G1 records the point-set and Moore-smash coherence that must be supplied, rather than deducing a quotient action from surjectivity alone.

**Uses:** AK2.5 CM reciprocity: Transports explicit geometric CM conjugation to stable classes. AK2.7 main theorem: Gives compatible finite and p-adic actions.

**API:**

- **kspGalois_mul** (structure): Algebraic conjugation uses Spec(σ⁻¹)∘φ and satisfies σ·(τ·A)=(στ)·A; the induced spectral action respects composition with coherent homotopies.

- **kspGalois_discretePoints** (compatibility): The discrete ppav-to-KSp map is equivariant for algebraic conjugation.

- **kspGalois_coefficients** (functoriality): All coefficient reduction maps and the p-adic limit are equivariant.

- **kspGalois_conjugationBetti** (compatibility): Complex conjugation satisfies c_B∘c=c_B, using its continuous analytic comparison; this is not asserted for arbitrary σ.

**Definition Checks:**

1. (compatibility) Check the inverse in the structure-map formula by composing σ then τ. The discrete groupoid A_g(C) has many isomorphism-class components, while its analytic realization is connected for fixed g; those models must not be identified.

2. (non-example) For the coproduct ∐_N Spec C the construction preserves the discrete N grading; ungraded profinite completion of components fails.

3. (non-example) At p=3, the genus-one H₁ obstruction prevents direct use of the H¹=0 comparison. Moore smashing must precede it.

**Acceptance Checks:**

- All q-level actions commute with reduction, so the p-adic action is defined on the spectrum, not merely separately on groups.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), §6.1, (6.1) and Proposition 6.2, pp. 274–276; Appendix A.5, pp. 315–317.

**Source match:** Proposition 6.2 and A.5 compare algebraic conjugation with componentwise arithmetic realization. The p=3 Moore construction and coherent Γ/coefficient compatibility remain the explicitly propagated G1/R22 obligation.


### Finite-genus detection of the action

**Target:** `ArithmeticKTheoryPartII:AK2.4/finite-genus-surjection` (theorem).

For q odd, k≥1 and g≥φ(q), the map π^s_{4k−2}(|A_g(C)^δ|;Z/q)→KSp_{4k−2}(Z;Z/q) is onto and equivariant for the action just constructed. This conservative bound suffices: CM objects have genus φ(q)/2 and can be stabilized to g by a rational principally polarized abelian variety. The q-level action is uniquely determined by equivariance of all discrete ppav maps in these degrees. Complex conjugation fixes c_B; the Hodge twist is established by CM formulas in AK2.5.

**Hypotheses:** p is an odd prime, n≥1 and q=p^n; coefficients Λ_q=Z/q. ζ_q=exp(2πi/q); twists M(j)=μ_q(C)^{⊗j} carry the left action χ_cyc^j; negative powers mean dual tensor powers.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.4/spectrum-action`, `ArithmeticKTheoryPartII:AK2.3/cm-generation`, `ArithmeticKTheoryPartII:AK2.2/serre-tate-comparison`.

**Proof route:**

1. Use CM generation and the ST functor, which lands in genus φ(q)/2.

2. Stabilize by a rational ppav of the remaining dimension. The stated larger bound avoids importing the misindexed genus in the printed proof.

3. Existence comes from the spectrum action; surjectivity proves uniqueness, without assuming the kernel of a surjection is Galois-stable.

**Acceptance Checks:**

- For q=5 a CM lattice has genus 2, and the stated surjection applies at g=4 by adding a rational genus-2 factor.

- The zero-rank rational stabilizer is allowed; its class must be the orthogonal unit.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Propositions 6.1–6.2 and Lemma 6.4, pp. 275–276.

**Source match:** Propositions 6.1–6.2 and Lemma 6.4 combine CM generation, the discrete-point map and continuous conjugation. The printed genus in the proof is repaired by rational stabilization at the stated conservative bound.


**Layer coverage:** planned. Discharge G1/R22, ppav stack/atlas R10–R11 and additive spectrum coherence R21.

**Planets:** Polarized abelian Γ-groupoid, Rigidified ppav simplicial model, Betti model of symplectic K-theory, Galois action on the symplectic spectrum, Finite-genus detection of the action.


## Layer AK2.5: Relative extensions and CM reciprocity

**Build inputs:** `ArithmeticGaloisDuality:R02.2`, `ArithmeticKTheoryPartII:AK2.2`, `ArithmeticKTheoryPartII:AK2.4`, `ComplexMultiplicationAndExplicitReciprocity:CM.1`, `ComplexMultiplicationAndExplicitReciprocity:CM.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.


### Groupoid CM reciprocity formula

**Target:** `ArithmeticKTheoryPartII:AK2.5/cm-reciprocity` (theorem).

Let E/Q be a Galois CM field with full Hilbert class field H. Choose lifts w_τ:H→C of τ:E→C with w_{cτ}=c w_τ=w_τ c. Transport by σ∈Aut(C) sends type Φ to σΦ. On isometry classes in a fixed-type fiber it is tensoring by a Hermitian line (X,h)∈P⁺_E, depending only on σ and Φ; its archimedean signs need not be positive. In particular σ=c uses (O,−1). Under arithmetic Artin reciprocity its ideal class is represented by ∏_{τ∈Φ} w_{στ}^{−1}σw_τ∈Gal(H/E). Transport commutes naturally with Serre tensor by positive Hermitian lines. For E=K_q the induced stable map sends β_q^j[L,b] to β_q^jF_σ[L,b]; at q=3 interpret powers as the compatible iterated Bott maps. This Bott-linearity is needed before applying reciprocity to the spanning stable CM classes. The formula is in Gal(H/E); H_q denotes the p-subfield only after specialization.

**Prerequisites:** `ComplexMultiplicationAndExplicitReciprocity:CM.2/polarization-reciprocity-dictionary`, `ComplexMultiplicationAndExplicitReciprocity:CM.1/cm-serre-tensor`, `ArithmeticKTheoryPartII:AK2.2/serre-tate-comparison`, `ArithmeticKTheoryPartII:AK2.4/spectrum-action`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`, `ComplexMultiplicationAndExplicitReciprocity:CM.2`.

**Proof route:**

1. Invoke the CM owner’s polarization/reflex reciprocity dictionary with arithmetic Artin normalization.

2. Translate its idelic expression to the chosen conjugation-compatible lifts and the ideal class of X; R12 requests this precise groupoid adapter.

3. Use the Serre-tensor comparison and the discrete-point equivariance to transport the formula to stable CM classes.

4. Use positive-line Serre tensor naturality to obtain a module map on stable nerves, then the Bott-linearity of Theorem 6.6(ii); positivity is used for this acting subgroup, not for the translating line X.

**Acceptance Checks:**

- For σ=1 all factors are identity with normalized identical lifts.

- For E=K_q, σ sends the type subset to χ_cyc(σ)Φ while the transported O-action remains the specified one.

- For σ=c the line (O,−1) changes Φ to its conjugate. A positive translating line would preserve Φ and contradict this case.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Theorem 6.6 and (6.3)–(6.4), pp. 277–278.

**Source match:** Theorem 6.6(i) computes the translating P⁺ line on each type fiber and its Artin class; this line can have negative signatures, as the c example shows. Part (ii) gives the stable Bott-linearity needed for the arithmetic cocycle.


### Split extension category

**Target:** `ArithmeticKTheoryPartII:AK2.5/extension-category` (definition).

For a commutative ring Λ, group G, subgroup H and left Λ[G]-module M, let C_Λ(G,H;M) have objects (V,π,s) with π:V→M a surjective G-linear map, trivial G-action on T=ker π, and an H-linear section s:M→V with π∘s=id_M. A morphism f is G-linear, satisfies π′f=π and fs=s′, and may induce any Λ-linear map on kernels. The unsectioned category C_Λ(G;M) remembers only (V,π). The H-split subcategory of that category forgets the chosen section.

**Prerequisites:** `mathlib:Representation`, `mathlib:LinearMap`, `mathlib:CategoryTheory.Under`.

**Proof route:**

1. Define the category on existing module and representation carriers with the displayed section equation.

2. Kernels use the inherited representation; demand that each group element act identically there.

3. Compose the underlying maps; the commuting equations are stable under identity and composition.

**Uses:** AK2.5 universal object: Defines the category whose kernel is relative H₁. AK2.6 and AK2.7 universal KSp: Makes initiality a precise assertion with its allowed kernel maps.

**API:**

- **splitExtension_kernelTrivial** (data): Every element of G fixes every vector in ker π.

- **splitExtension_cocycle** (constructor): α(g,m)=g·s(m)−s(g·m) lies in ker π, vanishes on H and satisfies α(gg′,m)=α(g,g′·m)+α(g′,m).

- **splitExtension_morphism** (characterisation): A morphism is exactly a G-linear map over M preserving the section; its kernel map need not be an identity.

- **splitExtension_coordinates** (equivalence): (m,t)↦s(m)+t identifies V with M⊕T over Λ[H], with G-action (g·m,t+α(g,m)).

**Definition Checks:**

1. (degenerate) With H=G, every object is a G-split M⊕T; the object M→M with zero kernel is initial as well as terminal.

2. (computation) For G=1, M=Λ and T=Λ, projection and the inclusion section satisfy πs=id_M, while sπ≠id_V.

3. (characterisation) The map M⊕T→M killing T is a valid morphism to the terminal object; requiring identity on kernels would wrongly exclude it.

**Acceptance Checks:**

- Distinguish C_Λ(G,{1};M), with a chosen Λ-linear section, from the unsectioned category.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Definition 7.3, pp. 279–280.

**Source match:** Definition 7.3 allows arbitrary induced kernel maps and requires a section over H. E5 corrects the section equation, keeping the sectioned and unsectioned categories distinct.


### Relative bar convention comparison

**Target:** `ArithmeticKTheoryPartII:AK2.5/relative-bar` (construction).

For the relative chain complex C_*(G,H;M)=C_*(G;M)/C_*(H;Res M) imported from R02.2, construct its FGV left-coefficient presentation and comparison. It has C₀=0 and H₁ presented by generators [g]⊗m, linear in m, relations [h]⊗m=0 for h∈H and [gg′]⊗m=[g]⊗g′m+[g′]⊗m. Supply an explicit natural chain equivalence with Mathlib’s inhomogeneous-chain convention, whose differential uses inverse actions, before invoking its groupHomology. The canonical α_univ(g,m)=[g]⊗m is a relative 1-cycle class.

**Prerequisites:** `mathlib:groupHomology`, `mathlib:groupHomology.inhomogeneousChains`, `mathlib:Representation`, `ArithmeticGaloisDuality:R02.2`.

**Proof route:**

1. In degrees zero, one and two use T₀=id, T₁([g]⊗m)=[g⁻¹]⊗m and T₂([g,g′]⊗m)=[g′⁻¹,g⁻¹]⊗m. Check d_native T₁=T₀ d_FGV and d_native T₂=T₁ d_FGV using the actual inverse-action differential. Extend this to a natural comparison in all degrees through R13.

2. Pass to the quotient by H-chains, whose degree-zero inclusion is the identity.

3. Read the degree-two boundary as the cocycle relation. Compare its long exact sequence and subgroup functoriality with the imported relative homology interface.

**Uses:** AK2.5 extension equivalence: Represents all possible extension cocycles. AK2.6 Artin cocycle comparison: Identifies the canonical kernel map including its sign convention.

**API:**

- **relativeBar_H0** (simp): H₀(G,H;M)=0 because the degree-zero relative chains vanish.

- **relativeBar_generators** (universal-property): A Λ-linear map H₁(G,H;M)→T is equivalent to a linear-in-m function obeying the H-vanishing and cocycle relations.

- **relativeBar_native** (equivalence): The natural chain comparison has T₀=id, T₁([g]⊗m)=[g⁻¹]⊗m and T₂([g,g′]⊗m)=[g′⁻¹,g⁻¹]⊗m. These formulas intertwine the low differentials and descend to the pair quotient; the full comparison identifies the imported absolute and relative homology.

- **relativeBar_pairMap** (functoriality): A map of pairs and an equivariant coefficient map send [g]⊗m to [f(g)]⊗u(m).

**Definition Checks:**

1. (degenerate) For H=G every relative chain group is zero, hence H₁=0.

2. (computation) For G=Z, H=1 and trivial M=Z, H₁≅Z with [r]⊗m↦rm.

3. (computation) For G=C₂, H=1 and M=Z/5 with sign action, the relation [c²]⊗m=[c]⊗(−m)+[c]⊗m imposes zero; H₁(G,1;M)≅Z/5. Omitting the coefficient action would incorrectly force it to vanish.

4. (computation) For G=C₃=⟨g⟩ and M=F₇ with g·m=2m, d_FGV([g]⊗1)=1, while d_native([g]⊗1)=3 since g⁻¹ acts by 4. After T₁ the native boundary of [g⁻¹]⊗1 is 1. A sign C₂ test alone cannot distinguish these inverse conventions.

**Acceptance Checks:**

- The target presentation must retain the coefficient action in the [gg′] relation.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), §7.1, (7.5)–(7.8) and Lemma 7.4, pp. 280–281.

**Source match:** Equations (7.5)–(7.8) and Lemma 7.4 present relative H₁ by the left-coefficient cocycle relation. The source is compared explicitly with the inverse-action native differential in degrees one and two; R13 owns the full natural comparison.


### Universal relative extension

**Target:** `ArithmeticKTheoryPartII:AK2.5/universal-relative-extension` (theorem).

There is an equivalence C_Λ(G,H;M)≃(H₁(G,H;M)↓Mod_Λ). Its initial object has underlying module M⊕H₁(G,H;M), projection to M, section m↦(m,0), and action g·(m,t)=(g·m,t+[g]⊗m). Every extension is its pushout through the unique cocycle-induced kernel map. If H₀(H;M)=H₁(H;M)=0, forgetting the section is an equivalence to C_Λ(G;M); if only H₀ vanishes, it is an equivalence to its H-split subcategory. In this roadmap these forgetful assertions are used for finite free M and H=⟨c⟩ with c acting by −1 over an odd-primary coefficient ring.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.5/extension-category`, `ArithmeticKTheoryPartII:AK2.5/relative-bar`, `mathlib:CategoryTheory.Under`.

**Proof route:**

1. Extract α from an extension and factor it through the relative bar presentation.

2. Conversely use a map from H₁ to define the displayed action; check associativity by the bar boundary relation.

3. Forgetting a section uses the Hom/Ext vanishing from the subgroup homology groups, checked over Λ rather than Z. In the conjugation case the idempotent (1−c)/2 gives the unique section.

**Acceptance Checks:**

- For G=H=C₂ and M a sign Z/5 module, H₁(G,H;M)=0 and the initial extension is M itself.

- A nonzero universal kernel precludes a G-equivariant splitting: an initial split object would admit both identity and the map killing its kernel.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Lemmas 7.4 and 7.6, pp. 281–282.

**Source match:** Lemmas 7.4 and 7.6 identify extensions with the undercategory of relative H₁ and justify forgetting the section under homological vanishing. In the actual odd sign case the conjugation idempotent supplies its unique section.


**Layer coverage:** planned. Integrate CM adapter R12 and relative-bar/native convention R13.

**Planets:** Groupoid CM reciprocity formula, Split extension category, Relative bar convention comparison, Universal relative extension.


## Layer AK2.6: The finite universal Galois extension

**Build inputs:** `ArithmeticKTheoryPartII:AK2.0`, `ArithmeticKTheoryPartII:AK2.3`, `ArithmeticKTheoryPartII:AK2.4`, `ArithmeticKTheoryPartII:AK2.5`.


### Finite arithmetic Galois action

**Target:** `ArithmeticKTheoryPartII:AK2.6/finite-action` (theorem).

For q odd and k≥1, the spectrum action on V_q=KSp_{4k−2}(Z;Z/q) factors through G_q=Gal(H_q/Q). The Hodge map gives an exact G_q-sequence 0→T_q→V_q→M_q→0 with M_q=μ_q^{⊗(2k−1)}, trivial action on T_q, and T_q≅K_{4k−2}(Z;Z/q). The restriction c_H:ker c_B→M_q is an isomorphism and its inverse is the unique ⟨c⟩-equivariant splitting. The Hodge map has weight 2k−1; the Betti map is only conjugation-invariant on V_q.

**Hypotheses:** p is an odd prime, n≥1 and q=p^n; coefficients Λ_q=Z/q. ζ_q=exp(2πi/q); twists M(j)=μ_q(C)^{⊗j} carry the left action χ_cyc^j; negative powers mean dual tensor powers.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.3/betti-hodge-splitting`, `ArithmeticKTheoryPartII:AK2.3/cm-generation`, `ArithmeticKTheoryPartII:AK2.5/cm-reciprocity`, `ArithmeticKTheoryPartII:AK2.4/finite-genus-surjection`.

**Proof route:**

1. Compute Galois transport on the spanning CM Bott classes using reciprocity and the type character formula.

2. If σ fixes H_q then its CM type is fixed and its Hermitian tensor line has zero p-primary ideal class. Its ideal class therefore vanishes modulo q, so both detection differences vanish; the full ideal class need not be principal.

3. Differences between classes of a fixed CM type give fixed arithmetic-kernel generators. Complex conjugation gives the unique splitting because it is −1 on M_q and +1 on T_q.

**Acceptance Checks:**

- For σ in Gal(C/H_q), every CM generator is fixed in V_q although its geometric ppav representative need not be fixed.

- Under the abelian-group coordinates T_q⊕M_q the action may have a nonzero off-diagonal cocycle; it is not declared diagonal.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Lemma 7.7, pp. 282–284.

**Source match:** Lemma 7.7 uses the spanning CM classes and reciprocity to factor the action, identify the odd Hodge character and fix the arithmetic kernel. Its conjugation splitting is not an equivariant splitting for the whole Galois group. Fixing the p-Hilbert field kills the p-primary ideal class, which suffices modulo q, without forcing the whole ideal class to be principal.


### CM reciprocity identifies the universal cocycle

**Target:** `ArithmeticKTheoryPartII:AK2.6/cocycle-identification` (theorem).

Give the extension V_q the ⟨c⟩-section s=(c_H|ker c_B)^{-1}. Its cocycle α(σ,m)=σs(m)−s(σm) defines H₁(G_q,⟨c⟩;M_q)→T_q. Under the Artin–Bott transfer isomorphism of AK2.0 this map is the identity. Explicitly a CM type Φ supplies the coefficient (Σ_{a∈Φ}a^{2k−1}) and reciprocity supplies the product of lift differences; their relative-bar class is [σ] times that coefficient. Equality is in homology modulo boundaries and the ⟨c⟩-chains.

**Hypotheses:** p is an odd prime, n≥1 and q=p^n; coefficients Λ_q=Z/q. ζ_q=exp(2πi/q); twists M(j)=μ_q(C)^{⊗j} carry the left action χ_cyc^j; negative powers mean dual tensor powers.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.6/finite-action`, `ArithmeticKTheoryPartII:AK2.0/artin-transfer`, `ArithmeticKTheoryPartII:AK2.5/relative-bar`, `ArithmeticKTheoryPartII:AK2.5/cm-reciprocity`, `ArithmeticKTheoryPartII:AK2.3/hodge-character`, `ArithmeticKTheoryPartII:AK2.3/betti-transfer`.

**Proof route:**

1. Write the projection V_q→T_q along the conjugation section as the appropriately normalized (1+c) operator.

2. Use reciprocity to express the CM Galois difference as the transfer of β^{2k−1}([X]−1), retaining that exponent.

3. Apply the cocycle relation to the chosen w_τ and pair conjugate embeddings; the correction terms cancel as relative boundaries, not as raw bar generators.

4. A type-sum unit combination identifies the induced homomorphism on every m∈M_q.

**Acceptance Checks:**

- At k=2 every Bott term has exponent 3 and the coefficient has χ³ weight.

- Changing the compatible lifts changes representatives by boundaries and leaves the homology map unchanged.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), §7.3, (7.12)–(7.19), pp. 285–287.

**Source match:** The calculation (7.12)–(7.19) identifies the section defect with the Artin–Bott homology class after quotienting boundaries. E6 retains the odd Bott exponent, and the kernel inclusion is scaled consistently with E18.


### Finite-coefficient universal extension theorem

**Target:** `ArithmeticKTheoryPartII:AK2.6/finite-universality` (theorem).

For odd p, q=p^n and k≥1, the arithmetic sequence 0→K_{4k−2}(Z;Z/q)→KSp_{4k−2}(Z;Z/q)→μ_q^{⊗(2k−1)}→0 is initial in C_{Z/q}(G_q,⟨c⟩;μ_q^{⊗(2k−1)}) and in the unsectioned category C_{Z/q}(G_q;μ_q^{⊗(2k−1)}). Its kernel is canonically H₁(G_q,⟨c⟩;μ_q^{⊗(2k−1)}) through Artin–Bott transfer. The inclusion of the arithmetic K group is the inverse of c_B on the Hodge kernel; relative to the standard hyperbolic H on this positive summand it is (1/2)H.

**Hypotheses:** p is an odd prime, n≥1 and q=p^n; coefficients Λ_q=Z/q. ζ_q=exp(2πi/q); twists M(j)=μ_q(C)^{⊗j} carry the left action χ_cyc^j; negative powers mean dual tensor powers.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.6/cocycle-identification`, `ArithmeticKTheoryPartII:AK2.5/universal-relative-extension`, `ArithmeticKTheoryPartII:AK2.6/finite-action`.

**Proof route:**

1. Use the explicit cocycle identification to compare the universal relative extension with the KSp extension.

2. The resulting kernel map is an isomorphism and so is the map of extensions.

3. Forget the uniquely determined conjugation section using vanishing for the sign module.

**Acceptance Checks:**

- If the arithmetic kernel is zero, the Hodge map is an isomorphism and initiality reduces to the zero-kernel case.

- If the kernel is nonzero, the extension cannot have a G_q-equivariant section even though it splits as a Z/q-module.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Theorem 7.1 and Remark 7.2, pp. 279–280; completion of proof in §7.3, pp. 285–287.

**Source match:** Theorem 7.1(iii), Remark 7.2 and the end of §7.3 identify the cocycle-induced kernel map as an isomorphism. This proves initiality, with the normalized inclusion (1/2)H and the uniquely determined conjugation section.


**Layer coverage:** planned. Discharge the propagated action obligation G1 and integrate the Artin–Bott and relative-bar supplier contracts.

**Planets:** Finite arithmetic Galois action, CM reciprocity identifies the universal cocycle, Finite-coefficient universal extension theorem.


## Layer AK2.7: Continuous, local and all-twist extensions

**Build inputs:** `ArithmeticGaloisDuality:R02.1`, `ArithmeticGaloisDuality:R02.2`, `ArithmeticKTheory:N.3:finite-generation`, `ArithmeticKTheory:N.6`, `ArithmeticKTheory:N.7`, `ArithmeticKTheoryPartII:AK2.3`, `ArithmeticKTheoryPartII:AK2.4`, `ArithmeticKTheoryPartII:AK2.5`, `ArithmeticKTheoryPartII:AK2.6`, `IntegralIwasawaTheory:L3`, `KTheoryFiniteLocalFields:L.1`, `StableHomotopyKTheory:H.6`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.


### Continuous universal extensions

**Target:** `ArithmeticKTheoryPartII:AK2.7/continuous-extension` (construction).

Let Γ be a profinite group, H a closed subgroup and M a finite free Z_p-module with continuous action. In C^cts_{Z_p}(Γ,H;M), objects and morphisms are the continuous counterparts of AK2.5 with finitely generated p-complete kernel and middle module and a continuous H-section. Completed relative homology is computed by the completed bar complex, equivalently the inverse system over open normal U and coefficient powers p^n with the induced pair and coefficient coinvariants. For the Γ and G occurring below, finite-coefficient homology is finite and the resulting H₁ is finitely generated; thus its completed universal extension is initial in this category. Surjective finite towers remove the relevant lim¹ obstruction.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.5/universal-relative-extension`, `ArithmeticGaloisDuality:R02.1`, `ArithmeticGaloisDuality:R02.2`, `StableHomotopyKTheory:H.6/milnor-sequence`.

**Proof route:**

1. Use the compact continuous module and completed homology contract from the cohomology owner.

2. Reduce a finite-type compact extension modulo p^n, also quotienting the group by an open subgroup that acts trivially on the finite data.

3. Pass the universal maps and their uniqueness through compact inverse limits. Verify finiteness and derived-limit vanishing for the actual groups rather than for arbitrary profinite Γ.

**Uses:** AK2.7 main theorem: Specifies the topological category for p-adic initiality. AK2.7 local theorem: Allows a closed decomposition subgroup and completed relative homology.

**API:**

- **continuousExtension_reduce** (functoriality): For finite-free M the reduction 0→T/p^nT→V/p^nV→M/p^nM→0 is exact, with induced continuous action and H-section. Freeness removes the Tor term; this is not asserted for arbitrary torsion quotients M.

- **continuousExtension_bar** (compatibility): Continuous cocycles factor uniquely through completed H₁, with the finite quotient coefficient coinvariants included.

- **continuousExtension_limit** (universal-property): Compatible universal finite extensions give the continuous universal extension under the stated compact finite-type and limit hypotheses.

- **continuousExtension_forget** (equivalence): For odd sign action by c, the unique section is continuous and forgetting it is an equivalence.

**Definition Checks:**

1. (degenerate) For Γ=H=1 and M=Z_p the initial object has zero kernel, not a free extra kernel.

2. (computation) For Γ=C₂=⟨c⟩, H=1 and M=Z_p with sign action, completed relative H₁ is Z_p. The universal object is Z_p⊕Z_p with c(m,t)=(−m,t+m). Reducing modulo p^n gives the nonzero-kernel AK2.5 object over Z/p^n; its kernel is Z/p^n, not zero.

3. (compatibility) For Γ=Z_p, H=1 and M=Z_p trivial, the completed H₁ is Z_p; replacing Γ by a discrete group or forgetting its topology is not the defining construction.

**Acceptance Checks:**

- Continuity of a Z_p-module homomorphism is retained in the categorical statement.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), §7.4, pp. 288–289; §7.5, pp. 290–292.

**Source match:** Sections 7.4–7.5 pass finite universal extensions to compact p-adic modules via completed relative homology. The target states finite-type and limit hypotheses for the actual arithmetic groups and keeps finite-free reduction exact.


### p-adic universal extension theorem

**Target:** `ArithmeticKTheoryPartII:AK2.7/padic-universality` (theorem).

Let H_∞=∪_{n≥1}H_{p^n} and Γ=Gal(H_∞/Q). For k≥1 the spectrum action gives a continuous exact sequence 0→K_{4k−2}(Z;Z_p)→KSp_{4k−2}(Z;Z_p)→Z_p(2k−1)→0. The arithmetic kernel is finite with trivial Γ-action. With its unique conjugation-equivariant section it is initial in C^cts_{Z_p}(Γ,⟨c⟩;Z_p(2k−1)); forgetting that section gives initiality in the unsectioned category of finite-type compact continuous extensions. Its kernel is H₁^cts(Γ,⟨c⟩;Z_p(2k−1)).

**Hypotheses:** p odd prime; k≥1; the finite-type compact coefficient category is fixed as in AK2.7/continuous-extension.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.6/finite-universality`, `ArithmeticKTheoryPartII:AK2.7/continuous-extension`, `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`, `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `ArithmeticKTheoryPartII:AK2.4/spectrum-action`, `ArithmeticKTheory:N.7`.

**Proof route:**

1. Use the compatible finite G_q actions and universal extensions, and the nesting of the p-Hilbert fields.

2. The K-theory coefficient tower has finite groups; its inverse-limit comparison has no lim¹ term. The underlying arithmetic group in this degree is finite.

3. Apply the continuous completed-bar universal property and preserve the unique c-section through the limit.

**Acceptance Checks:**

- The acting group here is Γ, not the unramified-outside-p group introduced in the local theorem.

- At a regular prime the kernel vanishes; at an irregular degree with nonzero kernel, a Γ-equivariant section is impossible.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Theorem 7.8 and proof, p. 289.

**Source match:** Theorem 7.8 takes the compatible p-Hilbert tower limit of Theorem 7.1. E7 repairs the acting-group and theorem-number slips; finiteness makes the homotopy-limit comparison exact.


### Local splitting and relative homology

**Target:** `ArithmeticKTheoryPartII:AK2.7/local-homology` (theorem).

Let Q(p) be the maximal extension of Q unramified outside p and G=Gal(Q(p)/Q). First choose a compatible c-fixed prime above p in H_∞. Extend that place arbitrarily to Q(p), obtaining G_𝔭, and let D_q⊂G_q be its image. The subgroup D_q contains c; the extended place itself is not required to be c-fixed and no assertion c∈G_𝔭 is used. The natural map of pairs (G,G_𝔭)→(G_q,D_q) induces H₁^cts(G,G_𝔭;M_q)≅H₁(G_q,D_q;M_q)≅H₁(G_q,⟨c⟩;M_q). Here D_q≅Gal(K_q/Q) because the principal prime above p splits in H_q/K_q. The KSp extension is uniquely D_q-split and its section has image ker c_B.

**Hypotheses:** p is an odd prime, n≥1 and q=p^n; coefficients Λ_q=Z/q. ζ_q=exp(2πi/q); twists M(j)=μ_q(C)^{⊗j} carry the left action χ_cyc^j; negative powers mean dual tensor powers.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.6/finite-action`, `ArithmeticKTheoryPartII:AK2.5/relative-bar`, `ArithmeticKTheoryPartII:AK2.7/continuous-extension`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`, `ArithmeticGaloisDuality:R02.2`.

**Proof route:**

1. The finite prime sets in the p-Hilbert tower have odd size, so each has a c-fixed member. Compactness of the inverse system gives compatible fixed members; extend the resulting place arbitrarily to Q(p).

2. Use the principal cyclotomic prime to identify D_q and its action. Its central conjugation kills homology of the odd coefficient twist.

3. Apply the relative Hochschild–Serre edge to the kernels of the cyclotomic quotients. Class field theory identifies the maximal abelian p-extension unramified everywhere and split at p with H_q.

**Acceptance Checks:**

- The c-fixed condition is imposed in H_∞. Its image puts c in every D_q and identifies ker c_B with the local section, even if the extended place in Q(p) is not fixed by c.

- D_q is the cyclotomic quotient, while Gal(H_q/K_q) is the p-class-group kernel; they must not be interchanged.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), §7.5 setup and Remark 7.11, pp. 289–291; Lemmas 7.12–7.13, pp. 291–292.

**Source match:** The §7.5 setup chooses c-fixed primes only in H_∞ and extends the place to Q(p). Lemmas 7.12–7.13 compare the relative homology kernels using the cyclotomic decomposition quotient and class field theory.


### Universal locally split Galois extension

**Target:** `ArithmeticKTheoryPartII:AK2.7/local-universality` (theorem).

For odd p and k≥1, the sequence of AK2.7/padic-universality, inflated to G, has a unique G_𝔭-equivariant splitting with image ker c_B and is initial in C^cts_{Z_p}(G,G_𝔭;Z_p(2k−1)). Equivalently its associated lisse Z_p-sheaf on Spec Z[1/p] is the universal extension of Z_p(2k−1) by a constant finite-type Z_p-sheaf whose pullback to Spec Q_p is split. Its kernel is H₁^cts(G,G_𝔭;Z_p(2k−1)).

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.7/local-homology`, `ArithmeticKTheoryPartII:AK2.7/padic-universality`, `ArithmeticKTheoryPartII:AK2.7/continuous-extension`, `ArithmeticGaloisDuality:R02.1`.

**Proof route:**

1. At finite coefficients compare the universal kernel with relative H₁ for the local pair.

2. Take the compatible inverse limit; uniqueness follows from an element of G_𝔭 with χ=−1.

3. Translate continuous finite-free/finite-type representations and their extension sheaves through the existing lisse-sheaf supplier.

**Acceptance Checks:**

- The global extension need not split although its Q_p pullback does.

- The sheaf formulation uses arithmetic descent and the specified local pullback, not a newly defined KSp sheaf at every scheme.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Theorem 7.10 and proof, pp. 290–292.

**Source match:** Theorem 7.10 applies the local relative-homology comparison and inverse limits. The local section is unique because its image group contains an element acting by −1 on the quotient; the global kernel can remain nonzero.


### Bott-inverted universal extension theorem

**Target:** `ArithmeticKTheoryPartII:AK2.7/all-twists` (theorem).

For every integer k, including k≤0, replace the K and KSp groups in the finite, p-adic and local universal extensions by their Bott-inverted versions. Their quotients remain μ_q^{⊗(2k−1)} or Z_p(2k−1), and all three initiality statements hold in the same coefficient categories. At finite q one may move k to a positive integer using a compatible period for both the group and cyclotomic twist. Then pass to the p-adic limit; this passage does not make the Z_p groups periodic.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.3/periodic-comparison`, `ArithmeticKTheoryPartII:AK2.6/finite-universality`, `ArithmeticKTheoryPartII:AK2.7/padic-universality`, `ArithmeticKTheoryPartII:AK2.7/local-universality`.

**Proof route:**

1. Use the finite v₁-period and the matching χ-power period to compare with a positive k.

2. Transport the universal property through the resulting equivariant extension isomorphism.

3. Use coefficient compatibility to pass to Γ and the local G pair, without choosing one period independent of n.

**Acceptance Checks:**

- At k=0 the quotient has twist −1 and the group is in degree −2.

- A degree shift chosen solely from topological KU periodicity is insufficient unless its cyclotomic twist is unchanged.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Theorem 7.14 and Remark 7.15, p. 293.

**Source match:** Theorem 7.14 transports finite-level universality through compatible v₁ periods, then takes the p-adic limit. Remark 7.15 distinguishes this all-twist statement from a single uniform p-adic period.


### Trivial action in degree 4k−1

**Target:** `ArithmeticKTheoryPartII:AK2.7/odd-degree` (theorem).

For p odd and k≥1, Aut(C) acts trivially on KSp_{4k−1}(Z;Z_p). The sphere-unit map π^s_{4k−1}(S;Z_p)→K_{4k−1}(Z;Z_p) is onto, by Quillen’s finite-field comparison at an auxiliary prime ℓ topologically generating Z_p×. The symplectic unit made from a rational elliptic curve maps under c_B to twice that unit. Since c_B is an isomorphism in this degree and 2 is invertible, the rational symplectic unit is onto and is Galois-fixed.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.3/betti-hodge-splitting`, `ArithmeticKTheoryPartII:AK2.4/spectrum-action`, `KTheoryFiniteLocalFields:L.1`, `ArithmeticKTheory:N.6`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Proof route:**

1. Invoke the precise sphere-unit/finite-field contract R18 and the norm-residue comparison.

2. Check the local invariants have cyclotomic exponent 2k, not 2k−1.

3. Use an elliptic curve defined over Q to make the symplectic unit map equivariant for the trivial sphere action.

**Acceptance Checks:**

- For p=3,k=1 the Z/3 group in degree three has trivial action even though adjacent degree two may carry a nontrivial extension.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), §7.7, pp. 294–295, including footnote 13.

**Source match:** Section 7.7 obtains surjectivity of the rational elliptic symplectic unit through the finite-field sphere-unit comparison. The factor two is invertible, giving trivial action; E9 corrects the comparison reference and twist.


### Vandiver and conjugation-fixed primes

**Target:** `ArithmeticKTheoryPartII:AK2.7/vandiver-fixed-prime` (theorem).

For q=p^n, the primes of H_q above p form a torsor under Gal(H_q/K_q). After choosing a c-fixed prime, c acts on this torsor by its action on that p-class group. Thus there is exactly one c-fixed prime precisely when its plus part is zero; under the Iwasawa control interface this is equivalent to Vandiver(p). This assertion concerns c-fixed primes. The entire prime set is a singleton only when the full p-class group vanishes, the regular-prime condition.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.7/local-homology`, `IntegralIwasawaTheory:L3`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

**Proof route:**

1. Identify the prime torsor because p is principal and splits in H_q/K_q.

2. Translate c-fixed points to the plus part of the odd p-group.

3. Use the Iwasawa owner’s finite-level/tower Vandiver comparison; retain its hypothesis as a condition, not a theorem for all primes.

**Acceptance Checks:**

- A nonzero minus class group gives multiple primes above p but only one c-fixed prime; it must not be called a failure of Vandiver.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Remark 7.9, pp. 289–290.

**Source match:** Remark 7.9 concerns the conjugation-fixed part of the prime torsor. The corrected formulation distinguishes its plus-class-group condition from vanishing of the entire p-class group and leaves the tower control theorem with its owner.


**Layer coverage:** planned. Integrate compact continuous homology R14, local class-field inputs R8/R13, finite-field unit comparison R18 and Vandiver control R19.

**Planets:** Continuous universal extensions, p-adic universal extension theorem, Local splitting and relative homology, Universal locally split Galois extension, Bott-inverted universal extension theorem, Trivial action in degree 4k−1.


## Layer AK2.8: Stable integral homology and characteristic numbers

**Build inputs:** `ArithmeticKTheory:N.7`, `ArithmeticKTheoryPartII:AK2.3`, `ArithmeticKTheoryPartII:AK2.4`, `ArithmeticKTheoryPartII:AK2.7`, `BorelRegulators:R.3`, `IntegralIwasawaTheory:I.5`, `PELModuli:M1`, `RefinedTraceMethods:RT.4:topological`, `StableHomotopyKTheory:H.4`, `StableHomotopyKTheory:H.6`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.


### Integral homology indecomposables

**Target:** `ArithmeticKTheoryPartII:AK2.8/integral-indecomposables` (definition).

For a connected H-space X of finite type, let I=H_{>0}(X;Z_p) be the augmentation ideal and I_r=H_{>0}(X;Z/p^r). Let β_r:H_j(X;Z/p^r)→H_{j−1}(X;Z_p) be the coefficient Bockstein. Put D=I²+Σ_{r≥1}β_r(I_r²), the Z_p-submodule of integral decomposables, and Q^int_*(X)=I/D. Products in the squares have both factors in strictly positive degree; D is not the indecomposable quotient itself. Coefficients here are ordinary singular homology with Z_p on an integral finite-type X.

**Prerequisites:** `StableHomotopyKTheory:H.6/bockstein-long-exact-sequence`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Proof route:**

1. Import the Pontryagin product and coefficient Bockstein with their naturality.

2. Form the positive augmentation ideal, the products in each coefficient ring, and the sum of their Bockstein images.

3. Take a quotient of graded Z_p-modules. Do not apply this convention to arbitrary discrete p-complete homotopy groups without a coefficient comparison.

**Uses:** AK2.8 product comparison: Removes the Tor generators that ordinary indecomposables retain. AK2.8 characteristic numbers: Transfers an integral Hodge pairing from homology to homotopy.

**API:**

- **integralInd_map** (functoriality): H-maps preserve D and induce maps on Q^int.

- **integralInd_positive** (simp): Q^int_0=0; positive-degree products and Bocksteins of products vanish in the quotient.

- **integralInd_primitivePairing** (compatibility): An integral primitive cohomology class that also kills the Bockstein products pairs through Q^int.

- **integralInd_hurewicz** (compatibility): The ordinary Hurewicz map π_i(X)⊗Z_p→H_i(X;Z_p) composes with the quotient for i≥1.

**Definition Checks:**

1. (degenerate) For X=point the ideal and quotient are both zero, including degree zero.

2. (computation) For X=S¹×S¹, the product of its two degree-one generators vanishes in Q^int_2, while the degree-one quotient is Z_p².

3. (computation) For X=RP∞ and p=2, Q^int_i is Z/2 precisely in degrees 2^a−1, a≥1, and zero in other positive degrees; quotienting only by I² incorrectly leaves every odd degree.

**Acceptance Checks:**

- Retain the finite-type hypotheses used by the product and Hurewicz comparisons.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), §8 and §8.1, (8.2)–(8.3), Example 8.3, pp. 297–299.

**Source match:** Equations (8.2)–(8.3) and Example 8.3 motivate killing both integral products and Bocksteins of coefficient products. E11 separates the denominator from its quotient and retains positive integral finite-type homology.


### Product formula for integral indecomposables

**Target:** `ArithmeticKTheoryPartII:AK2.8/indecomposable-product` (theorem).

For connected H-spaces X,Y with finitely generated integral homology in every degree, inclusions and projections give Q^int_i(X×Y)≅Q^int_i(X)⊕Q^int_i(Y). Positive tensor products vanish in I². A Künneth Tor generator from p^r- and p^s-torsion factors is β_d(xy), d=min(r,s), and vanishes in the enlarged denominator. This is an integral product assertion, not a rationalization argument.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.8/integral-indecomposables`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `StableHomotopyKTheory:H.6/bockstein-long-exact-sequence`.

**Proof route:**

1. Use inclusions and projections to obtain a split injection on the quotient.

2. Apply integral Künneth and decompose finite-type Z_p-modules into free and cyclic torsion summands.

3. Represent each mixed Tor class as a Bockstein of a positive product to obtain surjectivity.

**Acceptance Checks:**

- The product of two K(Z/p,1) factors has mixed Tor classes before quotienting; their images must vanish after taking Q^int.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Lemma 8.5, p. 299.

**Source match:** Lemma 8.5 proves the product comparison by integral Künneth. Mixed tensor products are decomposable and mixed Tor classes are represented by Bocksteins of products, so both disappear in this quotient.


### Low-range integral Hurewicz theorem

**Target:** `ArithmeticKTheoryPartII:AK2.8/low-hurewicz` (theorem).

Let p be odd and E a spectrum with π_i(E)=0 for i≤0 and finitely generated integral homotopy groups in every degree. Put X=Ω∞E. For 1≤i≤2p−3, the Hurewicz quotient π_i(E)⊗Z_p→Q^int_i(X) is an isomorphism. This repaired statement uses an integral finite-type spectrum, not arbitrary p-complete E with ordinary discrete Z_p-homology. The printed endpoint i=2p−2 is a distinct unresolved target G2; it is not part of this theorem.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.8/indecomposable-product`, `ArithmeticKTheoryPartII:AK2.8/integral-indecomposables`, `StableHomotopyKTheory:H.6`.

**Proof route:**

1. Use the H.6 low-degree Postnikov/operation contract R13a: below 2p−2 the needed delooped truncation splits as an H-space into Eilenberg–MacLane factors.

2. For finite-type cyclic/free integral factors, compute homology and Bocksteins in this range; the quotient is generated by the fundamental class.

3. Apply the product formula and Postnikov homology invariance. Do not extend the H-space splitting across the possible P¹ k-invariant at the printed endpoint.

**Acceptance Checks:**

- For E=ΣHZ and p=3, the theorem identifies π₁⊗Z₃=Z₃ with Q^int_1(S¹), and does not claim the endpoint degree four.

- E=ΣHZ_p with Z_p treated as a discrete integral group fails finite generation and is outside the hypotheses.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Theorem 8.4 and its proof, pp. 298–299, with restricted range and finite-type correction.

**Source match:** Theorem 8.4 supplies the Postnikov/product proof route. E11–E12 restrict its interpretation to positive integral finite-type spectra and stop before the possible delooped P¹ extension; the endpoint is left as G2.


### Integral stable symplectic comparison

**Target:** `ArithmeticKTheoryPartII:AK2.8/stable-symplectic-homology` (theorem).

Let p be odd. For 1≤i≤2p−3, the stable Hurewicz quotient KSp_i(Z)⊗Z_p→Q^int_i(BSp∞(Z)) is an isomorphism and is Aut(C)-equivariant for the arithmetic action from the ppav model. Stabilization is used in the conservative range g>2i+5. In even degree i=2m in this range, put ω=Lie(A)^∨ and define ĉh_m(ω)=(−1)^m ch_m(ω)=ch_m(Lie(A)). For m<p this primitive integral class pairs through the quotient and evaluates as c_H on the matching Bott generator. The unnormalized ch_m(ω) evaluates as (−1)^m c_H. The primitive condition kills products; its integral lift and Bockstein compatibility kill the enlarged denominator.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.8/low-hurewicz`, `ArithmeticKTheoryPartII:AK2.3/betti-hodge-splitting`, `ArithmeticKTheoryPartII:AK2.4/spectrum-action`, `StableHomotopyKTheory:H.4/hermitian-group-completion-integers`, `BorelRegulators:R.3`, `RefinedTraceMethods:RT.4:topological`.

**Proof route:**

1. Use the imported integral symplectic stability and finite-type arithmetic-group homology, then H.6’s simple-space finite-type theorem, to show the positive connected cover of integral KSp has finitely generated homotopy groups. The odd-primary Betti–Hodge formula alone does not prove integral finite generation.

2. Import the symplectic stability comparison, retain its conservative explicit rank bound, and use the plus-construction homology invariance.

3. Apply the corrected Hurewicz theorem and primitive Hodge/Bockstein compatibility; spectrum-level naturality makes the isomorphism equivariant.

**Acceptance Checks:**

- In degree zero the indecomposable quotient is zero, so no isomorphism with KSp₀⊗Z_p is asserted.

- At an even application degree 2m, m<p gives 2m≤2p−4, strictly within the proven range.

- For m odd, dualizing the tangent representation negates its Chern character. The normalized class ĉh_m pairs to 1 on a c_H-normalized Bott generator; ch_m(ω) pairs to −1.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), §§3.3, 4.3 and 7.2, pp. 251–253, 262–263, 284; §8, (8.2) and Theorem 8.4, pp. 296–299.

**Source match:** The proof of Theorem 8.1 applies stable homology and Theorem 8.4 to KSp. The earlier unitary and tangent-space identifications fix the dual Hodge sign; R17 supplies integral finite type, and only the repaired Hurewicz range is used.


### Rational stable Hodge generators

**Target:** `ArithmeticKTheoryPartII:AK2.8/rational-stable-hodge` (theorem).

The stable rational p-adic cohomology of Sp_{2g}(Z) is Q_p[x₂,x₆,x₁₀,…], with primitive generator x_{4k−2} represented by ĉh_{2k−1}(ω)=−ch_{2k−1}(ω)=ch_{2k−1}(Lie(A)). Using the unnormalized Hodge character instead changes only the generator sign. Its arithmetic action is cyclotomic weight 2k−1 in cohomology with the convention that x_{4k−2} is fixed as a class in H^{4k−2}(−;Q_p(2k−1)); the untwisted class therefore has inverse cyclotomic character. Products have the sum of the weights. The rational algebra calculation and stability are imported from BorelRegulators; the identification with the ppav action is the new comparison here.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.4/spectrum-action`, `ArithmeticKTheoryPartII:AK2.3/betti-hodge-splitting`, `BorelRegulators:R.3`, `RefinedTraceMethods:RT.4:topological`.

**Proof route:**

1. Use the existing stable rational cohomology calculation with primitive generators.

2. Identify the generators with Hodge Chern characters via the topological map.

3. Apply algebraic Chern-class naturality in the Tate-twisted cohomology group to determine the action and its weight convention.

**Acceptance Checks:**

- On the untwisted degree-two generator the action is χ^{-1}; on its square it is χ^{-2}. Confusing homology with cohomology reverses these weights.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Introduction, §§1.1–1.2, pp. 226–231; §8, pp. 295–297.

**Source match:** The introduction states the stable polynomial symplectic cohomology and its Hodge interpretation. Algebraic Chern classes are fixed with their Tate coefficients, so untwisted cohomology has inverse cyclotomic weight; tangent normalization fixes the generator sign.


### Bernoulli divisibility for ppav families

**Target:** `ArithmeticKTheoryPartII:AK2.8/characteristic-divisibility` (theorem).

Let X/Q be smooth projective of dimension d, and A→X a principally polarized abelian scheme with Hodge bundle ω=Lie(A/X)^∨. For a partition d=n₁+⋯+n_r into positive odd integers and an odd prime p>max_j n_j, suppose p divides the numerator of the arithmetic Bernoulli number B_{n_i+1} for some i. Then s=∫_{X(C)}∏_j ch_{n_j}(ω) belongs to p Z_(p). The strict prime inequality makes all Chern-character factorial denominators units. The boundary case p=max n_j is recorded as G3, not included in the result.

**Prerequisites:** `ArithmeticKTheoryPartII:AK2.8/stable-symplectic-homology`, `ArithmeticKTheoryPartII:AK2.7/local-universality`, `IntegralIwasawaTheory:I.5`, `ArithmeticKTheory:N.7`, `RefinedTraceMethods:RT.4:topological`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`, `PELModuli:M1`.

**Proof route:**

1. The algebraic classifying map and fundamental class give an equivariant Z_p(d)→H_{2d}(A_g(C);Z_p). Cap with the integral Chern characters other than the chosen part to obtain Z_p(n_i)→H_{2n_i}.

2. If s were a p-adic unit this would split the Hodge pairing. Stabilize by a rational ppav and pass through integral indecomposables and the safe-range Hurewicz comparison.

3. Multiply the chosen odd Hodge pairing by −1 to identify it with c_H on tangent K-theory. A unit splitting remains a unit splitting, so this yields a global Galois section with quotient Z_p(n_i). The Iwasawa/Bernoulli contract makes its arithmetic kernel nonzero, contradicting initiality.

**Acceptance Checks:**

- For the one-part partition n₁=11 and p=691, B₁₂=−691/2730 gives s∈691 Z_(691).

- A partition containing the part p falls outside the theorem even if a different Bernoulli factor is divisible by p. No integral cap product with ch_p is inferred.

**Source:** [Feng–Galatius–Venkatesh](https://doi.org/10.1007/s00222-022-01127-8), Theorem 8.1 and proof, pp. 295–297, with strict prime bound.

**Source match:** Theorem 8.1 caps the algebraic fundamental class with Hodge characters and contradicts universal initiality using a nonzero Bernoulli kernel. The target uses p>max n_j and the safe even Hurewicz range; G3 retains the prime equality boundary.


**Layer coverage:** planned. Integrate stability/finite-type R17, low-range topology R13a and Bernoulli criterion R15–R16; retain G2 endpoint and G3 prime boundary explicitly.

**Planets:** Integral homology indecomposables, Product formula for integral indecomposables, Low-range integral Hurewicz theorem, Integral stable symplectic comparison, Rational stable Hodge generators, Bernoulli divisibility for ppav families.


## Exact supplier contracts

These requests extend existing owners. They do not add implementation in this continuation or claim its prerequisite graph is closed. The generic projective and symplectic Γ models of FGV Examples A.4–A.5 stay with H.4/K.2, while AK2.4 owns the ppav comparison. No additional stand-in K-theory carrier is introduced.


### R1: ArithmeticKTheory:N.6

Extend N.6 by the exact FGV Lemmas 2.11 and 2.14 tables for O′_q and Z[1/p] in every integer degree: degree 4k−2 has (+)=H²(μ_q^{2k}) and (−)=H⁰(μ_q^{2k−1}); degree 4k has (+)=H⁰(μ_q^{2k}) and (−)=H²(μ_q^{2k+1}); degree 2j−1 is H¹(μ_q^j) with ψ⁻¹ acting by (−1)^j. Retain Adams ψ⁻¹ signs, the Kummer edge on [L]−1, transfer and coefficient naturality. Supply the ordinary-to-Bott comparison: all i≥0 for the p-inverted rings and i=0 or i≥2 for O_q,Z, leaving degree one exceptional. Existing Keune and class-group-descent nodes do not state this table.

**Consumers:** `ArithmeticKTheoryPartII:AK2.0/picard-bott`, `ArithmeticKTheoryPartII:AK2.0/transfer-descent`, `ArithmeticKTheoryPartII:AK2.3/betti-hodge-splitting`, `ArithmeticKTheoryPartII:AK2.7/odd-degree`.


### R2: GeneralAlgebraicKTheory:K.7

Supply the coherent spectrum-level tensor/external product, unit, associativity and symmetry for projective modules, and its restriction to invertible modules; provide compatibility of Picard tensor multiplication and the suspension-spectrum class map with K(R) multiplication. Additive group completion alone gives no ring spectrum.

**Consumers:** `ArithmeticKTheoryPartII:AK2.0/picard-k-map`, `ArithmeticKTheoryPartII:AK2.3/cm-class`.


### R3: SchemeKTheoryOperations:S.6

Extend S.6 by the integral odd-primary ψ⁻¹/duality involution, projectors (1±ψ⁻¹)/2 and transfer comparison using the inverse different, plus Adams-equivariance of the M.7 descent filtration. A rational weight decomposition alone does not suffice.

**Consumers:** `ArithmeticKTheoryPartII:AK2.0/picard-bott`, `ArithmeticKTheoryPartII:AK2.0/transfer-descent`.


### R4: RefinedTraceMethods:RT.4:topological

Export ku, KU, Bott and conjugation with π_*ku=Z[β], π_*KU=Z[β,β⁻¹], ψ⁻¹(β)=−β; topological Sp(R)←U homotopy equivalence, contractible compatible-complex-structure space, and the tangent Chern-character pairing normalized to evaluate to 1 on the matching Bott generator. For ω=Lie(A)^∨ explicitly compare this with ĉh_m(ω)=(−1)^m ch_m(ω); the raw odd Hodge pairing evaluates to −1. Include integral lifts for ch_m when m<p, primitive coproduct and coefficient-Bockstein compatibility. Existing connective-ku and homotopy-of-ku nodes are imported; these exact naturality and symplectic interfaces extend them.

**Consumers:** `ArithmeticKTheoryPartII:AK2.0/universal-bott`, `ArithmeticKTheoryPartII:AK2.1/betti-hodge`, `ArithmeticKTheoryPartII:AK2.3/hodge-character`, `ArithmeticKTheoryPartII:AK2.8/stable-symplectic-homology`, `ArithmeticKTheoryPartII:AK2.8/rational-stable-hodge`, `ArithmeticKTheoryPartII:AK2.8/characteristic-divisibility`.


### R5: GeometryOfNumbersAndQuadraticArithmetic:GN.6

Supply the skew-symmetric integer specialization: K(Z)_{hC₂}→KSp(Z)→τ_{≥0}L^{−s}(Z), its odd-primary Witt groups, and the splitting after inverting 2. Use standard unscaled H, identify its orbit summand with K(Z)^(+) by p_+, and use (1/2)c_B as retraction. The identity c_B H=1+ψ⁻¹ must hold on spectra and c_B H([Z])=2[Z]. Existing higher-GW carriers and integer skew calculations do not supply this exact map-level normalization.

**Consumers:** `ArithmeticKTheoryPartII:AK2.1/betti-hodge`, `ArithmeticKTheoryPartII:AK2.3/cm-generation`, `ArithmeticKTheoryPartII:AK2.3/betti-hodge-splitting`.


### R6: StableHomotopyKTheory:H.6

Extend H.6 with compatible Adams v₁ self-maps of odd Moore spectra, their reduction maps after iteration, telescope independence, height-one localization after p-completion, and the associated Milnor comparisons. Include the q=3 iterated-Bott construction with no associative S/3 assertion. Supply the spectrum-level finite-type/Postnikov/Serre interfaces used in AK2.8; the smaller low-range operation calculation is specified separately in R13a below.

**Consumers:** `ArithmeticKTheoryPartII:AK2.1/bott-ksp`, `ArithmeticKTheoryPartII:AK2.3/periodic-comparison`, `ArithmeticKTheoryPartII:AK2.4/spectrum-action`, `ArithmeticKTheoryPartII:AK2.8/low-hurewicz`.


### R7: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

Use the existing arithmetic-normalized Artin reciprocity and its norm/tower compatibility. Export its cyclotomic ideal-class dictionary on the same invertible-module Picard group used here, including sign choices for the CM lift product. This is an adapter to the existing Artin map, not a second reciprocity theory.

**Consumers:** `ArithmeticKTheoryPartII:AK2.0/transfer-descent`, `ArithmeticKTheoryPartII:AK2.0/artin-transfer`, `ArithmeticKTheoryPartII:AK2.5/cm-reciprocity`.


### R8: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields

Export the maximal unramified abelian p-subfield H_q of the existing Hilbert class field of K_q, Pic(O_q)⊗Z_p≅Gal(H_q/K_q), principal-prime splitting and compatible cyclotomic towers. Supply the full narrow Hilbert class field/sign dictionary for E⁺ and the local-p-split unramified p-class-field comparison used in AK2.7. Distinguish H_q from the full CM Hilbert field H.

**Consumers:** `ArithmeticKTheoryPartII:AK2.0/artin-transfer`, `ArithmeticKTheoryPartII:AK2.2/sign-prime`, `ArithmeticKTheoryPartII:AK2.5/cm-reciprocity`, `ArithmeticKTheoryPartII:AK2.7/local-homology`, `ArithmeticKTheoryPartII:AK2.7/vandiver-fixed-prime`.


### R9: tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev

Consume the existing Chebotarev theorem for the compositum of the narrow Hilbert field of E⁺ and E/E⁺, with a specified narrow class and splitting in E. Also supply an auxiliary rational prime ℓ topologically generating Z_p× and avoiding the finite bad set for the finite-field K-theory comparison. No new density or Artin-symbol definition belongs here.

**Consumers:** `ArithmeticKTheoryPartII:AK2.2/sign-prime`, `ArithmeticKTheoryPartII:AK2.7/odd-degree`.


### R10: PELModuli:M1

Specialize the owned moduli stack to all principally polarized abelian schemes A_g, including polarized isomorphism descent, products, selfadjoint idempotent factors and their coherence. Export algebraic classifying maps over Q and their integral fundamental-class/cap-product compatibility needed for the family application.

**Consumers:** `ArithmeticKTheoryPartII:AK2.4/ppav-gamma`, `ArithmeticKTheoryPartII:AK2.4/rigidified-model`, `ArithmeticKTheoryPartII:AK2.8/characteristic-divisibility`.


### R11: PELModuli:M2

Provide full symplectic level N≥4 smooth atlases for A_g and their quotient-stack comparison; represent polarized isomorphism schemes and each projective-embedding/Hilbert-polynomial piece for the rigidified Čech model. The unbounded union is a specified coproduct, not a single finite-type scheme.

**Consumers:** `ArithmeticKTheoryPartII:AK2.4/ppav-gamma`, `ArithmeticKTheoryPartII:AK2.4/rigidified-model`, `ArithmeticKTheoryPartII:AK2.4/betti-model`.


### R12: ComplexMultiplicationAndExplicitReciprocity:CM.2

Add the groupoid adapter from the existing polarized reciprocity dictionary to FGV Theorem 6.6: chosen lifts w_{cτ}=cw_τ=w_τc, type Φ↦σΦ, Hermitian tensor line X∈P⁺ with its possibly negative archimedean signatures (X=(O,−1) for c), and arithmetic Artin class ∏_{τ∈Φ}w_{στ}^{−1}σw_τ in Gal(H/E), natural on isometries and compatible with Serre tensor/polarization. Also export Theorem 6.6(ii): the stable action commutes with the compatible Bott maps, including iterates at q=3, by positive-line Serre tensor naturality. Keep the generic main theorem of CM at this owner.

**Consumers:** `ArithmeticKTheoryPartII:AK2.5/cm-reciprocity`.


### R13: ArithmeticGaloisDuality:R02.2

Supply the homological and relative-pair versions of the Hochschild–Serre edge for the finite extensions 1→Gal(H_q/K_q)→G_q→Gal(K_q/Q)→1 and for (G,G_𝔭)→(G_q,D_q). The central conjugation on odd twists must eliminate the outside terms. Provide the explicit native-bar inversion/convention adapter and the generic relative chain quotient and its long exact sequence; no homological conclusion is inferred from a cohomological spectral sequence without duality.

**Consumers:** `ArithmeticKTheoryPartII:AK2.0/transfer-descent`, `ArithmeticKTheoryPartII:AK2.0/artin-transfer`, `ArithmeticKTheoryPartII:AK2.5/relative-bar`, `ArithmeticKTheoryPartII:AK2.7/local-homology`.


### R13a: StableHomotopyKTheory:H.6

For a positive connected integral finite-type spectrum E, give an H-space splitting of the truncation of Ω∞E through degree 2p−3 after the p-local finite-type comparison, using the first possible nontrivial reduced operation in degree 2p−2. Compute the free and finite cyclic Eilenberg–MacLane homology/Bockstein quotients in that range. Do not claim an H-space splitting at 2p−2; G2 isolates the P¹-extension there.

**Consumers:** `ArithmeticKTheoryPartII:AK2.8/low-hurewicz`.


### R14: ArithmeticGaloisDuality:R02.1

Extend the owned compact continuous coefficient framework with completed relative bar homology and its universal continuous cocycle property for finite-free M and finite-type compact targets, including quotient coefficient coinvariants and the finite inverse-limit exactness checks. Export the arithmetic representation/lisse Z_p-sheaf equivalence on Spec Z[1/p] and local Q_p restriction, rather than defining a second étale sheaf category.

**Consumers:** `ArithmeticKTheoryPartII:AK2.7/continuous-extension`, `ArithmeticKTheoryPartII:AK2.7/local-universality`.


### R15: IntegralIwasawaTheory:I.5

In the exact range 1≤m<p with m odd, identify H²_et(Z[1/p];Z_p(m+1))≠0 precisely when p divides the numerator of arithmetic B_{m+1}, with the chosen twist, duality and Euler-characteristic normalization. Export the nonzero-kernel consequence used by FGV Theorem 8.1; equality of characteristic ideals without the specialization/control comparison is insufficient.

**Consumers:** `ArithmeticKTheoryPartII:AK2.8/characteristic-divisibility`.


### R16: ArithmeticKTheory:N.7

Supply the N.6-to-I.5 bridge for the even arithmetic K-group K_{2m}(Z;Z_p), its Bernoulli numerator criterion for odd 1≤m<p, and the regular-prime zero-kernel checks. Retain arithmetic Bernoulli indexing B₁=−1/2 and finite/infinite-level class-group distinctions.

**Consumers:** `ArithmeticKTheoryPartII:AK2.8/characteristic-divisibility`, `ArithmeticKTheoryPartII:AK2.7/padic-universality`.


### R17: BorelRegulators:R.3

Extend the stable arithmetic calculation from the existing SL exterior-algebra node to the symplectic case: H^*(Sp∞(Z);Q_p)=Q_p[x₂,x₆,…] with primitive Hodge generators; integral homology stability in the conservative range g>2i+5 and finite generation of each stable integral homology group. Through H.6’s simple-space finite-type theorem obtain finite-type positive KSp. Export block-sum/plus-construction and Hodge-generator comparisons; the arithmetic Galois identification stays here.

**Consumers:** `ArithmeticKTheoryPartII:AK2.8/stable-symplectic-homology`, `ArithmeticKTheoryPartII:AK2.8/rational-stable-hodge`.


### R18: KTheoryFiniteLocalFields:L.1

Extend the finite-field computation to the precise Quillen sphere-unit comparison at ℓ topologically generating Z_p×: π^s_{4k−1}(S;Z_p)→K_{4k−1}(F_ℓ;Z_p) is onto and the comparison from K_{4k−1}(Z;Z_p) is an isomorphism in the FGV application. Retain the χ^{2k} twist and its norm-residue input from N.6. The order of a finite-field K-group alone is insufficient.

**Consumers:** `ArithmeticKTheoryPartII:AK2.7/odd-degree`.


### R19: IntegralIwasawaTheory:L3

Supply the control comparison equating Vandiver(p) with vanishing of the plus part of Cl(K_{p^n})[p∞] at every n, and distinguish it from regularity of p. The prime-torsor statement then follows here; no unconditional Vandiver claim is made.

**Consumers:** `ArithmeticKTheoryPartII:AK2.7/vandiver-fixed-prime`.


### R20: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality

Use the existing integral singular homology, Pontryagin/Künneth and fundamental/cap-class interfaces, extended to finite-type Z_p and finite coefficients with connecting Bocksteins, plus classifying-stack comparison through the ppav supplier. Require product and cap naturality, graded signs and the Tor representative β_d(xy). This is an interface request to the existing topology programme, not replanning it.

**Consumers:** `ArithmeticKTheoryPartII:AK2.8/integral-indecomposables`, `ArithmeticKTheoryPartII:AK2.8/indecomposable-product`, `ArithmeticKTheoryPartII:AK2.8/characteristic-divisibility`.


### R21: StableHomotopyKTheory:H.5:spectra

Export the suspension-spectrum/infinite-loop adjunction and additive group-completion counit for coherent symmetric monoidal groupoids, naturally on the CM groupoid maps and their tensor-module pairings. The source need not have categorical coproducts, and one operation gives no ring spectrum. Ensure that the associated Γ machine has positive-level Ω equivalences and zeroth group completion.

**Consumers:** `ArithmeticKTheoryPartII:AK2.0/picard-k-map`, `ArithmeticKTheoryPartII:AK2.3/cm-class`, `ArithmeticKTheoryPartII:AK2.4/betti-model`.


### R22: EtaleHomotopyTypes:EH.6

Extend EH.6/G7 to the graded Γ-diagrams Z(T): provide homotopy-coherent realization compatible with products, pointed finite Moore smashing before completion at p=3, Γ maps, Aut(C), coefficient reduction and p-adic homotopy limits. A functor to homotopy categories or independent weak equivalences at each T is insufficient to induce a spectrum action. G1 tracks this specialization.

**Consumers:** `ArithmeticKTheoryPartII:AK2.4/spectrum-action`.


### R23: StableHomotopyKTheory:H.4

Supply the existing strict projective/symplectic Γ models in FGV Examples A.4–A.5: projective objects (n,φ:R^T→M_n(R)) select eR^n and all e-summand isomorphisms; symplectic objects have selfadjoint idempotents and selected-factor isometries. Compare with coherent-subset Γ group completion. At {*} the ambient-object groupoid is contractible, not literally terminal; the zeroth group completion sends genus N to Z.

**Consumers:** `ArithmeticKTheoryPartII:AK2.0/picard-k-map`, `ArithmeticKTheoryPartII:AK2.4/betti-model`.


## Explicit gaps and source findings


### G1: Coherent ppav realization and the p=3 Moore construction

EH.6/G7 remains open. Verify the Γ/product/coefficient-compatible realization of the graded rigidified ppav atlas, including Moore smashing before completion at p=3, and strictification or a genuine homotopy-coherent spectral action. Appendix A.5 identifies the homotopy groups but does not by itself supply all point-set choices in the current atlas framework. R22 and H.5 R21 must be integrated before the action is a closed proof plan.


### G2: Hurewicz endpoint 2p−2

The source’s Postnikov H-space splitting can fail at the printed endpoint because of a P¹ k-invariant. Prove that the endpoint class survives the integral indecomposable quotient by treating that extension directly, or supply another primary proof. The planned theorem stops at 2p−3 and the even application degrees are at most 2p−4, so the Bernoulli result does not depend on this unresolved endpoint.


### G3: Characteristic-number prime boundary

The source proof does not justify p=max_j n_j: the denominator n_j! of ch_{n_j} can have a factor p, so the integral cap-product step fails. Establish a different integral characteristic-class argument for that boundary or retain the strict inequality permanently. The planned divisibility theorem assumes p>max_j n_j.


The source findings below record their mathematical effect in our own words. E1–E18 were inherited from PAPER-FENG-GALATIUS-VENKATESH-22 and checked against the version of record. E19 was found during this design. The endpoint gaps do not assert the printed conclusions are false. Independent review REV-DESIGN-ArithmeticKTheoryPartII confirmed all 19 findings at their locators, with the qualifications recorded below and in each packet verdict. E10 and E12 concern proof obligations, not counterexamples; E14 concerns the unqualified use, while Proposition A.2 itself states finite-type hypotheses. Bounded publisher/arXiv and title-plus-erratum searches on 2026-10-19 located no published correction; this is not a claim of novelty or exhaustive absence.


**E1** (error; §4.1, p. 259). For dimension g, bound commutative semisimple Q-subalgebras of End⁰(A) by 2g and specify the chosen CM order inside that algebra. A faithful action on H₁ has rank 2g; for a square of a CM elliptic curve the endomorphism algebra is a matrix algebra, not a CM field.


**E2** (misprint; §4.4, Lemma 4.8 and its proof, pp. 266–267). Use the real subfield O_q⁺ and the prime over the rational prime p. K_q is totally imaginary and q=p^n need not itself be prime.


**E3** (misprint; §6.2, Proposition 6.1 and its proof, p. 275). Its genus is φ(q)/2. The larger bound g≥φ(q) remains a valid conservative statement after rational stabilization. The CM lattice has Z-rank φ(q), twice the abelian dimension.


**E4** (misprint; §6.3, the paragraph before Theorem 6.6 and Theorem 6.6(i), (6.3), p. 277). The product lies in Gal(H/E), where E is the fixed CM field and H its full Hilbert field. Each w_{στ}^{−1}σw_τ fixes E.


**E5** (misprint; §7.1, Definition 7.3, p. 280). Require π∘s=id_M. The other composite is an endomorphism of V and is only a projector onto the section image.


**E6** (misprint; §7.3, p. 286). Use β^{2k−1} and the transferred reduced ideal class in every occurrence. Only that exponent gives degree 4k−2 and agrees with the subsequent diagram.


**E7** (misprint; §7.4, Theorem 7.8 and its proof, p. 289). Use Γ=Gal(H_∞/Q), its conjugation subgroup and the finite extensions from Theorem 7.1. The unramified-outside-p group G belongs to the local-splitting theorem, not this limit statement.


**E8** (misprint; §7.5, Remark 7.9, p. 290). Require uniqueness within the c-fixed prime set. Uniqueness among all primes is the regular-prime condition. The primes form the p-class-group torsor; c-fixed points detect the plus part, while the whole torsor detects both signs.


**E9** (misprint; §7.7, the proof, footnote 13 and the reference to Theorem 3.3, p. 294). Use Theorem 3.5 and exponent 2k for Q_p/Z_p(2k). The finite-field comparison uses the action on the indicated even twist, and the Betti–Hodge isomorphism is numbered 3.5.


**E10** (gap; §8, Theorem 8.1 and the first step of its proof, p. 296). Use p>max_j n_j; record the equality case as unresolved. The factorial in ch_p can introduce a p denominator, preventing the asserted integral cap product.


**E11** (error; §8.1, (8.3), Theorem 8.4, and (8.2), pp. 297–298). Define the quotient I/(I²+Σβ_r(I_r²)); for ordinary singular Z_p-homology use an integral spectrum with finitely generated homotopy and source π_i⊗Z_p, in positive degrees. For discrete K(Z_p,1), ordinary H₁ with Z_p coefficients is Z_p⊗_Z Z_p. Also Q^int has no degree-zero part.


**E12** (gap; §8.1, proof of Theorem 8.4, p. 299). Stop the proved range at 2p−3 and retain a separate obligation at 2p−2. The P¹ extension in the deloop can connect π₁ and π_{2p−2} of its loop space. The claimed endpoint may still be true, but this splitting does not prove it.


**E13** (misprint; §8, Remark 8.2, p. 297). Pair Shimura examples with volume computations and curve families with the Torelli map. Those are the constructions used to produce the respective families. No target theorem changes.


**E14** (gap; Appendix A.2, property (iii), p. 305, and the comparison in A.5, p. 315; compare Proposition A.2, p. 309). Use degreewise finite-dimensional mod-p cohomology on each specified connected grade and take their coproduct after completion. Proposition A.2 states its finite-type hypotheses; the issue is applying an unqualified statement to infinitely many genus components. Completing those as one pro-finite object changes degree-zero homology.


**E15** (error; Appendix A.1, Definition A.1 (p. 301), with Examples A.4–A.5 (pp. 303–304) and A.4 (p. 314)). Use a contractible value at the one-point set, or an equivalent reduced model. At the basepoint all selected summands vanish but many ambient objects remain, uniquely isomorphic in the selected-factor category.


**E16** (error; Appendix A.3, Example A.10, p. 311). Use a smooth base in the ppav application; degree r has r+1 factors. A smooth map over a singular base need not have an analytic manifold base, and degree zero of its nerve must be the source.


**E17** (misprint; Appendix A.4 (p. 313) and A.5 (p. 317)). Rosati is defined by the polarization; a fixed genus is the union of the discrete isomorphism-class components of that dimension. The action is tested against an already defined Rosati involution, and discrete complex ppav moduli have many isomorphism classes.


**E18** (error; Published Invent. Math. 230 (2022), §3.4, splitting discussion pp. 254–255, especially the paragraph after (3.5); compare §3.5, proof of Theorem 3.5, p. 256). Use (1/2)c_B as retraction of H, or rescale H when keeping c_B as projection; identify the positive factor using p_+. For a line, the underlying hyperbolic module has rank two. Thus c_BH=1+ψ⁻¹=2 on the positive summand, and inversion of 2 does not turn it into 1.


**E19** (misprint; §2.4, paragraph following Definition 2.6, p. 239, version of record). For a morphism I→J allow a∈Frac(R)× with aI=J. Ring units describe automorphisms of an invertible ideal, not all isomorphisms between different ideals. For R=Z, multiplication by 3/2 is an isomorphism 2Z→3Z, whereas no element of Z× carries 2Z onto 3Z. The abstract module-groupoid definition already has this arrow.


## Source and validation record

Primary source: Tony Feng, Søren Galatius and Akshay Venkatesh, *The Galois action on symplectic K-theory*, Inventiones Mathematicae 230 (2022), 225–319. The [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-022-01127-8.pdf) was read in full on 2026-10-19, including Appendix A. Its SHA-256 is `5da9a2b28d13b2b22a262a81650188025020d92238ec2b47404d177ef91d7b4d`. All locators use journal pagination. The arXiv version-history page was checked for provenance; no preprint pagination is used. Sources cited by FGV are routed to their existing suppliers, with exact contracts above; this record does not claim their books or proofs were independently read. No restricted book was used.

Independent review REV-DESIGN-ArithmeticKTheoryPartII accepted this complete planning pass on 2026-10-19 after checking all 42 targets, eight baseline statements, supplier contracts and 19 source findings. All nine layers remain planned, all implementation statuses unchecked, and G1–G3 and the 24 requests remain open. The 48 API items and 37 tests are planning contracts. The 106-line suggested file elaborated with `lean-check` at the pins: exit zero, nine expected admitted-proof warnings and no other warnings or errors. It has two light real-bodied definitions, three API theorems and eight examples; the two new convention examples have checked proofs. The packet checker reports zero errors and zero warnings. Compilation checks this native-carrier interface only, without formalizing the high-level targets.
