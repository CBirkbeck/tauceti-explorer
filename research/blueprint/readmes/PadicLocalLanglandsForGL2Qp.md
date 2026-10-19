# Roadmap: p-adic local Langlands for GL₂(ℚ_p)

For an absolutely irreducible two-dimensional p-adic Galois representation V of G_{ℚ_p}, the correspondence constructs an admissible unitary Banach representation Π(V) of GL₂(ℚ_p). Colmez’s Montreal functor recovers V. The roadmap specifies that construction, its analytic and algebraic vectors, the mod-p representation categories and blocks, and the local deformation-ring and Breuil–Mézard results used by modularity lifting.

The targets are plans for formalisation. The six layers are **planned**, with the explicit proof and supplier gaps listed below; none is closed. A complete blueprint pass does not mean a completed formal proof. The [suggested Lean file](../suggested/PadicLocalLanglandsForGL2Qp.lean) states only the light definitions and examples whose carriers exist at Mathlib `082e2d3` and Tau Ceti `f790474`. It elaborates with 20 `sorry` warnings and no other warning. Heavy constructions remain mathematical targets in this document.

## Scope and suppliers

R30.1 fixes the GL₂(ℚ_p) conventions and operations specific to Colmez’s construction; coefficient rings, Fontaine’s equivalence and overconvergence belong to PhiGammaModulesAndIwasawaCohomology PG.0–PG.2 and PadicHodgeTheory. R30.2 specialises existing smooth and Banach categories. It owns the GL₂(ℚ_p) finiteness theorem, rather than deriving it formally from the general Grothendieck property. R30.3 constructs the glued module, Montreal functor and Π(D), with a separate family-stability theorem and Fontaine-heart theorem. R30.4 treats algebraic and analytic vectors, types, completions and Artinian deformations. R30.5 connects blocks to local Galois deformation rings. R30.6 keeps each local application’s prime and residual hypotheses visible.

The general smooth category and induction come from SmoothRepresentationsOfLocalGroups. Its current SR.0d.1 gives enough injectives. Existence of injective envelopes in the locally admissible fixed-central-character category is an additional representation-specific theorem (G6). The general admissible Banach category and Schikhof duality belong to LocallyAnalyticDistributionsPartII ND.6; this roadmap requests compact-open independence there, as required by RT-AREA-automorphic-1/17. ND.2 supplies analytic vectors. R30.2 creates no second general Banach category.

Current Tau Ceti already supplies `completedGroupAlgebra` over compact commutative coefficient rings, its compact-module action and `IsCompactModule`; the current ProfiniteProPGroups Layer 9 prerequisites reuses these. They are newer than the blueprint pins and are recorded separately below. Reuse them for O_L[[H]]; PadicMeasuresIwasawaAlgebras L5 is requested only for additional compact Nakayama and inverse-system results. SelmerIwasawaCohomology L2 supplies underlying p-primary Pontryagin duality; the O_L-linear scalar adapter remains G5. Ordinary module injective envelopes and projective covers do not supply envelopes in a representation category.

Classical local Langlands and rank-two decompositions are imported from GL2AutomorphicRepresentationsAndTransfer R16.1–R16.3. The inertial K-types needed here require an extra p-adic coefficient and dyadic contract (G11); the coefficient-characteristic-different-from-p theorem in R16.3 is not a substitute. Serre weights and compact-induction Hecke objects belong to FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5. Degree-two determinant laws and Cayley–Hamilton algebras belong to IntegralHeckeAndGaloisDeterminants; local Galois specialisations and potentially semistable rings belong to LocalGaloisDeformationRings. Cycles and multiplicities belong to DeformationAndDerivedPatchingAlgebra.

Completed cohomology and global modularity lifting remain with their global owners. The global proof inputs used for supercuspidal algebraic vectors and the all-residual Breuil–Mézard theorems are exposed in G1 and G17; a dependency on a later roadmap is not treated as proof closure. There is no claim here of a correspondence for GL₂(F) with F≠ℚ_p, or for higher rank.

## Conventions

- p is prime; L/ℚ_p is finite, O=O_L, ϖ is a uniformiser and k is the residue field. Enlarge coefficients when eigenvalues or characters require it.
- G=GL₂(ℚ_p), K=GL₂(ℤ_p), B is upper triangular, P has lower row (0,1), and P⁺ has upper row in ℤ_p with nonzero first entry. The Weyl element of Colmez’s glued module is (0 1;1 0). The different normaliser generator in the BCDT compact-group classification is (0 −1;ℓ 0), whose square is −ℓ.
- Smooth induction is unnormalised, with right translation. Normalised induction satisfies i_B^G(a,b)=Ind_B^G(aν^{1/2}⊗bν^{−1/2}), where ν=|·|. Uniformisers correspond to geometric Frobenii; x|x| corresponds to ε, whose Hodge–Tate weight is +1. The underlying numerical formula is x·p^{−v_p(x)}.
- Fontaine’s D(V) and V(D) are covariant. Pairings use O, L or L/O in the integral, rational or torsion category. The rank-two central character is det(V)ε^{−1}. The Montreal convention satisfies V(π)=MF(π)(ε). Its conversion to Emerton’s algebraic-vector normalisation remains G4.
- For the classical bridge, in the irreducible cases of Colmez’s list, rec(LL(M))=M^{F-ss}⊗ν^{−1/2}; with the supplier’s recᵀ=rec⊗ν^{−1/2}, this is recᵀ(LL(M))=M^{F-ss}⊗ν^{−1}. Colmez also permits a nonsplit Weil self-extension: only the comparison with rec semisimplifies Frobenius, retaining monodromy N. The reducible principal-series case has the full representation described in the target, rather than only its Langlands quotient.
- Use det=ψε and ψ|_I=ε^{a+b−1}det τ for weights a<b throughout. Paškūnas 2015 uses the name ψ_source for the determinant itself, so ψ_source=ψε. Tung reverses the ordered pair of weights. For nonzero fixed-determinant type rings, absolute/generic/special dimensions are 5/4/4 framed and 2/1/1 unframed when End ρ̄=k. Empty loci give zero rings.
- Finite length means length over O[G], not over O. An infinite-dimensional Steinberg representation is a length-one object. For a projective block generator P_B, put E_B=End(P_B) with composition; Hom(P_B,−) is a right E_B-module, while P_B is a left E_B-module. Dualising reverses sides.

## Reading the targets

Each target gives its exact statement, hypotheses, proof route, sources with theorem and page locators, and direct prerequisites. Definitions and constructions have named API items and at least three checks. Acceptance checks of theorems are specifications; they are not claims that Lean proofs already exist. The source catalogue identifies the editions read. Everything is stated in our own words.

## R30.1. Robba and character conventions

**Planets:** Characters of ℚ_p^× as Galois characters, Treillis D^♮ and D^♯, Rank-one (φ,Γ)-modules R(δ), Trianguline representations.

### The group GL₂(ℚ_p) and its standard subgroups

**Target `R30.1/gl2qp-subgroups` (definition).** Fix a prime p. Put G = GL₂(ℚ_p), K = GL₂(ℤ_p), Z ≅ ℚ_p^× the centre of scalar matrices, B the upper triangular Borel subgroup, T ⊂ B the diagonal torus, N ⊂ B the upper unipotent subgroup {(1 b; 0 1)}, and P the mirabolic subgroup {(a b; 0 1) : a ∈ ℚ_p^×, b ∈ ℚ_p} ≅ ℚ_p ⋊ ℚ_p^×. P(ℤ_p) = {(a b; 0 1) : a ∈ ℤ_p^×, b ∈ ℤ_p}, and P⁺ is the submonoid {(a b; 0 1) : a ∈ ℤ_p ∖ {0}, b ∈ ℤ_p} of P. Write w = (0 1; 1 0), φ_P = (p 0; 0 1), u = (1 1; 0 1) and σ_a = (a 0; 0 1) for a ∈ ℤ_p^×. KZ is the stabiliser of the vertex [ℤ_p²] of the Bruhat–Tits tree of PGL₂(ℚ_p), whose vertices are G/KZ; I₁ ⊂ K is the pro-p Iwahori subgroup of matrices congruent to (1 \*; 0 1) mod p, I the Iwahori subgroup, and K₁ = ker(K → GL₂(𝔽_p)). These subgroups carry the topology induced from the p-adic topology of M₂(ℚ_p); K, P(ℤ_p), I and I₁ are compact open in their ambient groups.

**Hypotheses.**

- p is a prime; all matrix groups are realised as units of 2×2 matrix rings over ℚ_p and ℤ_p (Mathlib's GL (Fin 2)).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Basic`, namespace `TauCeti.GL2Qp`.

**Uses.**

- Colmez, Introduction §5 and Théorème II.1.4: the action of G on D ⊠_δ P¹ is specified on P, on Z and on w
- Paškūnas 2013, §2–§3: projective envelopes are profinite O[[K]]-modules with a compatible G-action
- this roadmap R30.2/modp-principal-series: parabolic induction from B and compact induction from KZ

**API.**

- `GL2Qp.borel` (data): B as a subgroup of GL₂(ℚ_p): matrices with zero lower-left entry.
- `GL2Qp.mirabolic` (data): P as a subgroup: matrices with lower row (0, 1).
- `GL2Qp.mirabolicPlus` (data): P⁺ as a submonoid of GL₂(ℚ_p).
- `GL2Qp.maximalCompact` (data): K = GL₂(ℤ_p) as a subgroup of GL₂(ℚ_p), via the inclusion ℤ_p ⊂ ℚ_p.
- `GL2Qp.weylElement` (data): w = (0 1; 1 0) as an element of GL₂(ℚ_p).
- `GL2Qp.weylElement_sq` (simp): w \* w = 1.
- `GL2Qp.mem_mirabolic_iff` (characterisation): g ∈ P iff g 1 0 = 0 and g 1 1 = 1.
- `GL2Qp.mirabolicPlus_mul_mem` (structure): P⁺ is closed under multiplication and contains 1.
- `GL2Qp.closure_mirabolic_center_weyl` (characterisation): G is generated as a group by P(ℚ_p), Z and w.

**Proof route.**

- Each subgroup is cut out of Mathlib's Matrix.GeneralLinearGroup (Fin 2) ℚ_[p] by conditions on the entries (zero lower-left entry for B, lower row (0,1) for P, entries in ℤ_p with unit determinant for K).
- P⁺ is closed under multiplication because the product of (a b; 0 1) and (a' b'; 0 1) is (aa' ab'+b; 0 1), and a, a', b, b' ∈ ℤ_p with aa' ≠ 0.
- G = BK (Iwasawa decomposition) and G = ⊔ K diag(p^a, p^b) K with a ≥ b (Cartan) are recorded from GL2AutomorphicRepresentationsAndTransfer R16.1, which owns the rank-two Iwasawa and Cartan coordinates; they are cited, not planned again.
- Colmez's convention identifies an étale (φ,Γ)-module with a P⁺-module: u acts as multiplication by 1+T, φ_P as φ and σ_a as the element of Γ with χ(σ_a) = a (Colmez, Introduction §4, Remark 0.4(iv)).

**Checks.**

- `GL2Qp.weylElement_not_mem_borel` (non-example): w ∉ B.
- `GL2Qp.phi_mem_mirabolicPlus` (computation): (p 0; 0 1) ∈ P⁺ and its inverse (p⁻¹ 0; 0 1) ∉ P⁺.
- `GL2Qp.mirabolic_inf_center` (degenerate): P ∩ Z = {1}: a scalar matrix with lower-right entry 1 is the identity.
- `GL2Qp.unipotent_mem_mirabolicPlus` (computation): (1 1; 0 1) ∈ P⁺ and (1 p⁻¹; 0 1) ∉ P⁺.

**Acceptance.**

- w² = 1, w ∉ B, and wBw ∩ B = T.
- P⁺ is a submonoid of P containing P(ℤ_p) and φ_P, and P(ℚ_p) is generated by P⁺ and φ_P⁻¹.
- G = P·Z·K·{1, w} is not used; instead G is generated by P(ℚ_p), Z and w (Colmez, Introduction §4(iv): adding an action of w suffices to define an action of G).

**Sources.**

- COLMEZ10, Introduction §4–§5, pp. 8–10 (Remark 0.4(iv)); §III.1.1–III.1.2, pp. 70–72: Fixes the mirabolic P, the monoid P⁺ with the dictionary (1 1; 0 1) ↔ 1+T, (p 0; 0 1) ↔ φ, (a 0; 0 1) ↔ σ_a, and the tree of PGL₂ whose vertices are G/KZ.
- PASKUNAS13, §1 and §5, pp. 2–7: Uses the same G, K, Z, B and P, with the projective envelopes taken in categories of O[[K]]-modules with compatible G-action.

**Needs:** `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Subgroup`, `mathlib:Submonoid`, `mathlib:PadicInt`, `GL2AutomorphicRepresentationsAndTransfer:R16.1/iwasawa-cartan`.

### Characters of ℚ_p^× as Galois characters (Colmez's normalisation)

**Target `R30.1/character-dictionary` (definition).** For a topological ring Λ let T̂(Λ) be the group of continuous characters δ : ℚ_p^× → Λ^×. Through local class field theory normalised so that p corresponds to a geometric Frobenius, W_{ℚ_p}^{ab} ≅ ℚ_p^×, and a character δ ∈ T̂(Λ) is viewed as the character of the Weil group W_{ℚ_p} given by δ(g) = δ(p)^{−deg g} · δ(χ(g)), where deg g ∈ ℤ is defined by g(x) = x^{p^{deg g}} on 𝔽̄_p and χ is the cyclotomic character. When n ↦ δ(p^n) extends continuously to ℤ̂ (in particular when Λ = k_L, or Λ = L and δ is unitary, i.e. v_p(δ(p)) = 0), δ extends to a continuous character of G_{ℚ_p}. Under this dictionary the character x ↦ x|x| corresponds to χ, its reduction ω mod p to the mod p cyclotomic character, and the unramified character μ_λ (μ_λ(p) = λ, trivial on ℤ_p^×) to the unramified character sending a geometric Frobenius to λ. For δ ∈ T̂(L) its weight is w(δ) = log δ(u)/log u for any u ∈ ℤ_p^× not a root of unity; for unitary δ it is the generalised Hodge–Tate weight of δ (w(x|x|) = 1).

**Hypotheses.**

- L is a finite extension of ℚ_p with ring of integers O_L = O, uniformiser ϖ and residue field k_L = k.
- The normalisation (uniformisers ↦ geometric Frobenii) is the one of Colmez, Paškūnas and Colmez–Dospinescu–Paškūnas; GL2AutomorphicRepresentationsAndTransfer R16.3 uses the same Art_F(ϖ) = geometric Frobenius, and PadicHodgeTheory R06.2 states crystalline characters through Art^arith, the inverse normalisation.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Characters`, namespace `TauCeti.PadicChar`.

**Uses.**

- Colmez, Introduction §9: the central character δ_D = (x|x|)^{−1}α_D of Π(D) is defined from the character α_D of det V(D)
- Paškūnas 2013, Theorem 1.3: the determinant ζε of V(Π) is read through this dictionary
- CDP 2014, Corollary 1.2: V(Π) has determinant δε for Π with central character δ
- this roadmap R30.2/modp-principal-series: smooth characters δ₁, δ₂ : ℚ_p^× → k^× are matched with Galois characters to compute V(B(δ₁, δ₂)) = δ₁

**API.**

- `PadicChar` (data): T̂(Λ) as the group of continuous homomorphisms ℚ_p^× → Λ^× (Mathlib ContinuousMonoidHom).
- `PadicChar.normChar` (constructor): The unitary character x ↦ x|x| of ℚ_p^× with values in ℤ_p^× (it is p ↦ 1, u ↦ u on ℤ_p^×).
- `PadicChar.unramified` (constructor): μ_λ for λ ∈ Λ^×: p ↦ λ, trivial on ℤ_p^×.
- `PadicChar.weight` (projection): w(δ) ∈ L, the derivative of δ at 1 in the logarithmic coordinate.
- `PadicChar.toGalois` (constructor): For unitary δ (or Λ = k_L) the continuous character of G_{ℚ_p} attached by the geometric-Frobenius reciprocity map.
- `PadicChar.toGalois_normChar` (compatibility): toGalois(x|x|) = χ (Mathlib cyclotomicCharacter at ℚ̄_p).
- `PadicChar.toGalois_mul` (simp): toGalois(δ₁δ₂) = toGalois(δ₁)·toGalois(δ₂).
- `PadicChar.toGalois_unramified` (simp): toGalois(μ_λ) is unramified and sends a geometric Frobenius to λ.
- `PadicChar.arith_dictionary` (compatibility): Composed with the arithmetic normalisation of PadicHodgeTheory R06.2, toGalois(δ)∘Art^arith = δ⁻¹ on ℤ_p^×-part and δ(p)⁻¹ at p: the two normalisations differ by inversion.

**Proof route.**

- Local class field theory for ℚ_p: the reciprocity isomorphism ℚ_p^× ≅ W_{ℚ_p}^{ab} with p ↦ geometric Frobenius (trivial on μ_{p^∞}) and u ∈ ℤ_p^× ↦ the element acting on μ_{p^∞} by u, so that the inverse map is g ↦ p^{−deg g} χ(g) (cited from the Tau Ceti ClassFieldTheory roadmap through GL2AutomorphicRepresentationsAndTransfer R16.3, which fixes Art_F).
- Compute x|x| on p^{−deg g}χ(g): |p^{−deg g}χ(g)| = p^{deg g}, so (x|x|)(p^{−deg g}χ(g)) = χ(g); hence x|x| ↔ χ, and reducing mod ϖ gives ω.
- δ extends from W_{ℚ_p} = ℤ-extension to G_{ℚ_p} = ℤ̂-extension exactly when n ↦ δ(p)^n extends continuously to ℤ̂, which holds when δ(p) is a unit of a profinite or p-adically complete-with-unit-group-containing-it ring (k_L^×, O_L^×).
- The weight is well defined because δ restricted to a small open subgroup 1 + p^nℤ_p is u ↦ exp(w(δ) log u) (Colmez, Représentations triangulines, §0.1).

**Checks.**

- `PadicChar.normChar_apply_p` (computation): (x|x|)(p) = 1 and (x|x|)(u) = u for u ∈ ℤ_p^×.
- `PadicChar.weight_normChar` (computation): w(x|x|) = 1 and w(μ_λ) = 0.
- `PadicChar.toGalois_trivial` (degenerate): The trivial character corresponds to the trivial Galois character.
- `PadicChar.not_extends_id` (non-example): The character x ↦ x (δ(p) = p) is not unitary and does not extend to a continuous character of G_{ℚ_p} with values in L^×.

**Acceptance.**

- x|x| ↦ χ and ω ↦ the mod p cyclotomic character; the unramified μ_λ ↦ the unramified character with geometric Frobenius ↦ λ.
- For two characters, δ₁δ₂ ↦ (δ₁)(δ₂): the dictionary is a group isomorphism onto the continuous characters of W_{ℚ_p}.
- The character x ↦ x of ℚ_p^× (weight 1, δ(p) = p) does not extend to G_{ℚ_p}, since n ↦ p^n has no continuous extension to ℤ̂.

**Sources.**

- COLMEZ10, Introduction §1, pp. 5–6: Defines T̂(Λ), views δ as a character of W_{ℚ_p} through δ(g) = δ(p)^{−deg g}δ(χ(g)), extends it to G_{ℚ_p} when δ is unitary or Λ = k_L, and records that x|x| corresponds to χ and its reduction ω to the Teichmüller character.
- COLMEZ08TRI, §0.1, pp. 2–3: Same dictionary, the weight w(δ) = log δ(u)/log u, and the remark that the unitary character x|x| corresponds to χ with weight 1.
- CDP14, §1.1, p. 2 and footnote 2: States that unitary characters of ℚ_p^× are viewed as Galois characters by class field theory normalised so that uniformisers correspond to geometric Frobenii, and that ε corresponds to x|x|.

**Needs:** `mathlib:cyclotomicCharacter`, `mathlib:Field.absoluteGaloisGroup`, `mathlib:ContinuousMonoidHom`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `PadicHodgeTheory:R06.2/crystalline-character-classification`.

### Étale (φ,Γ)-modules over O_E, E, E† and R with the covariant Fontaine functor

**Target `R30.1/fontaine-functor-convention` (definition).** Let O_E be the ring of Laurent series Σ_{k∈ℤ} a_k T^k with a_k ∈ O_L and a_k → 0 as k → −∞, E = O_E[1/p], O_E⁺ = O_L[[T]], E† ⊂ E the overconvergent subfield and R the Robba ring over L, with the commuting actions φ(T) = (1+T)^p − 1 and σ_a(T) = (1+T)^a − 1 (a ∈ ℤ_p^× ≅ Γ). The categories in use are ΦΓ^et_tors (étale (φ,Γ)-modules of finite length over O_E), ΦΓ^et(O_E), ΦΓ^et(E), ΦΓ^et(E†) and ΦΓ^et(R) (slope 0, free of finite rank). The covariant Fontaine functors are D(V) = (A ⊗_{ℤ_p} V)^H and V(D) = ((O_L·A) ⊗_{O_E} D)^{φ=1}, with A the p-adic completion of the maximal unramified extension of A_{ℚ_p} and H = ker χ; they are exact quasi-inverse equivalences Rep_tors G_{ℚ_p} ≅ ΦΓ^et_tors, Rep_{O_L} G_{ℚ_p} ≅ ΦΓ^et(O_E) and Rep_L G_{ℚ_p} ≅ ΦΓ^et(E) ≅ ΦΓ^et(E†) ≅ ΦΓ^et(R) (D ↦ D† ↦ D_rig = R ⊗ D†). The Tate dual of a representation is V̌ = Hom(V, L ⊗ χ) (resp. Hom(V, O_L ⊗ χ), Hom(V, L/O_L ⊗ χ)), and V(Ď) = V̌ for the Tate dual Ď of R30.1/tate-dual. This node fixes these conventions for the whole roadmap; the rings, the equivalences and the overconvergence theorem are owned by PhiGammaModulesAndIwasawaCohomology PG.0–PG.2 and PadicHodgeTheory P7:annulus-foundations and are not constructed here.

**Hypotheses.**

- p any prime; L/ℚ_p finite.
- The overconvergence and Robba-ring steps are imported with their fixed-field hypotheses (PG.2) and Kedlaya's slope theory behind ΦΓ^et(E†) ≅ ΦΓ^et(R).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/PhiGamma`, namespace `TauCeti.PhiGammaModuleEt`.

**Uses.**

- Colmez, Théorème 0.17: Π(D) is built from D ∈ ΦΓ^et(E) and satisfies D(Π(D)) = Ď
- Colmez, Théorème IV.2.14: V(Π) is defined as the Tate dual of V(D(Π))
- Colmez, Théorème 0.19: D† and D_rig give the locally analytic vectors of Π(D)

**API.**

- `PhiGammaModuleEt.ofRep` (constructor): D(V) = (A ⊗ V)^H, imported from PG.1, covariant.
- `PhiGammaModuleEt.toRep` (constructor): V(D) = ((O_L·A) ⊗ D)^{φ=1}, the quasi-inverse.
- `PhiGammaModuleEt.ofRep_exact` (functoriality): D is exact and commutes with tensor products and duals.
- `PhiGammaModuleEt.overconvergent` (projection): D ↦ D† with D = E ⊗ D† (PG.2).
- `PhiGammaModuleEt.rig` (projection): D ↦ D_rig = R ⊗ D†, an equivalence onto slope-zero modules over R.
- `PhiGammaModuleEt.toRep_tateDual` (compatibility): V(Ď) = V̌ = Hom(V(D), L ⊗ χ).

**Proof route.**

- PG.0 supplies O_E, E, the commuting φ and Γ actions and the étale lattice interface; PG.1 Fontaine's equivalence in its integral, torsion and rational forms; PG.2 the Cherbonnier–Colmez overconvergence and the Robba realisation; PadicHodgeTheory P7:annulus-foundations/robba-ring the Robba ring itself and P7/robba-realisation-comparison the realisation D_rig.
- Colmez's Théorème I.3.1 states the equivalences with exactly the covariant functors above; this node records that choice so that R30.3's V(Π) (Tate dual of V(D(Π))) and Π(D) (with D(Π(D)) = Ď) have their stated variance.
- Exactness and compatibility with Tate duals are part of the imported equivalence; V(Ď) = V̌ follows from the pairing D × Ď → O_E dT/(1+T) (R30.1/tate-dual).

**Checks.**

- `PhiGammaModuleEt.ofRep_trivial` (computation): D(O_L) = O_E with its own φ and Γ.
- `PhiGammaModuleEt.ofRep_cyclotomic` (computation): D(O_L(χ)) = O_E·e with φ(e) = e and σ_a(e) = a e.
- `PhiGammaModuleEt.ofRep_zero` (degenerate): D(0) = 0 and V(0) = 0.
- `PhiGammaModuleEt.ofRep_not_contravariant` (non-example): D is covariant: a G_{ℚ_p}-map V → W gives D(V) → D(W); the contravariant convention D\*(V) = Hom(V, A)^H would send the cyclotomic character to the module with σ_a(e) = a⁻¹e.

**Acceptance.**

- For V = O_L (trivial), D(V) = O_E.
- For V = O_L(χ), D(V) = O_E ⊗ e with φ(e) = e and σ_a(e) = a e.
- D(V ⊗ W) = D(V) ⊗ D(W) and D is exact.

**Sources.**

- COLMEZ10, Introduction §4, Théorème 0.3, p. 8; §I.3.1, Théorème I.3.1, p. 33: Lists the categories ΦΓ^et_tors, ΦΓ^et(O_E), ΦΓ^et(E), ΦΓ^et(E†), ΦΓ^et(R), states their equivalences with Galois representations through D(V) = (A ⊗ V)^H and V(D) = ((O_L·A) ⊗ D)^{φ=1}, and defines the Tate dual V̌ with V(Ď) = V̌.
- COLMEZ10, Introduction §3, Théorème 0.1, p. 7: The Amice transform identifies measures on ℤ_p with E^♮ = O_E⁺[1/p] and distributions with R^♮, and E/E^♮ with C⁰(ℤ_p): the dictionary behind the (φ,Γ)-module translation of measures on ℙ¹.

**Needs:** `PhiGammaModulesAndIwasawaCohomology:PG.0`, `PhiGammaModulesAndIwasawaCohomology:PG.1`, `PhiGammaModulesAndIwasawaCohomology:PG.2`, `PadicHodgeTheory:P7:annulus-foundations/robba-ring`, `PadicHodgeTheory:P7/robba-realisation-comparison`, `mathlib:PowerSeries`, `mathlib:AbstractMeasure.amiceTransformEquiv`.

### The Tate dual of an étale (φ,Γ)-module and the rank-two twist

**Target `R30.1/tate-dual` (construction).** For D ∈ ΦΓ^et(O_E) (resp. ΦΓ^et(E), ΦΓ^et_tors) the Tate dual is Ď = Hom_{O_E}(D, O_E dT/(1+T)) (resp. with E dT/(1+T), (E/O_E) dT/(1+T)) with the induced φ and Γ, where dT/(1+T) carries φ(dT/(1+T)) = dT/(1+T) and σ_a(dT/(1+T)) = a dT/(1+T); the residue of the pairing gives a perfect pairing { , } : Ď × D → C, with C = O_L, L, or L/O_L in the integral, rational, or torsion category respectively, and V(Ď) = V̌. If D is free of rank 2 over O_E or E, then ∧²D = R_base ⊗ α_D, with R_base = O_E or E respectively, for the character α_D ∈ T̂(O_L) attached to det V(D) by R30.1/character-dictionary, δ_D := (x|x|)^{−1}α_D, and x ↦ x ⊗ δ_D^{−1} is an isomorphism D ≅ Ď ⊗ δ_D, i.e. Ď ≅ D ⊗ δ_D^{−1}.

**Hypotheses.**

- D belongs to the integral, rational, or torsion étale category with the indicated coefficient-valued dual; the rank-two determinant identity assumes D free of rank 2 over O_E or E.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/PhiGamma`, namespace `TauCeti.PhiGammaModuleEt`.

**Uses.**

- Colmez, Théorème 0.17(iii): D(Π(D)) = Ď
- Colmez, Théorème 0.14 and Proposition IV.4.16: the contragredient uses D ⊠_δ P¹ and Ď ⊠_{δ⁻¹} P¹ in duality
- Colmez, Théorème II.1.13: the pairing { , }_{P¹} on Ď ⊠_{δ⁻¹} P¹ × D ⊠_δ P¹ is built from { , }

**API.**

- `PhiGammaModuleEt.tateDual` (constructor): Ď with its φ and Γ.
- `PhiGammaModuleEt.residuePairing` (data): The continuous perfect residue pairing into O_L (integral), L (rational), or L/O_L (torsion), with the corresponding dual topology.
- `PhiGammaModuleEt.tateDual_tateDual` (equivalence): The canonical map D → (Ď)ˇ is an isomorphism.
- `PhiGammaModuleEt.toRep_tateDual'` (compatibility): Fontaine transports the Tate dual to Hom(V,C(χ)), where C is O_L, L, or L/O_L according to the category.
- `PhiGammaModuleEt.deltaChar` (projection): δ_D = (x|x|)^{−1}α_D for D of rank 2.
- `PhiGammaModuleEt.tateDual_rank_two` (characterisation): For rank 2, Ď ≅ D ⊗ δ_D^{−1} through the wedge pairing.

**Proof route.**

- The residue map res₀ : O_E dT → O_L gives the pairing {x, y} = res₀(⟨σ_{−1}x, y⟩) used by Colmez; perfectness follows from the perfectness of the residue pairing on O_E.
- For rank 2 the wedge pairing D × D → ∧²D = R_base ⊗ α_D is perfect; twisting by the character of dT/(1+T), which is that of x|x| (χ), identifies D with Hom(D, R_base ⊗ α_D) ⊗ ... and gives Ď ≅ D ⊗ δ_D^{−1}.
- V(Ď) = V̌ follows from Fontaine's equivalence applied to the pairing (R30.1/fontaine-functor-convention).

**Checks.**

- `PhiGammaModuleEt.tateDual_trivial` (computation): The Tate dual of O_E is O_E ⊗ (x|x|) (Galois side: O_L(χ)).
- `PhiGammaModuleEt.deltaChar_of_det_cyclotomic` (computation): If det V(D) = χ then δ_D is trivial.
- `PhiGammaModuleEt.tateDual_zero` (degenerate): The Tate dual of the zero module is zero.
- `PhiGammaModuleEt.tateDual_ne_linearDual` (non-example): Ď is not the O_E-linear dual Hom(D, O_E): for D = O_E the linear dual is O_E (trivial Galois character), whereas Ď corresponds to χ.

**Acceptance.**

- For D = O_E (trivial), Ď = O_E ⊗ (x|x|), i.e. V(Ď) = O_L(χ).
- For D of rank 2 with det V(D) = χ (α_D = x|x|), δ_D = 1 and Ď ≅ D.

**Sources.**

- COLMEZ10, §I.2.2–I.2.3, pp. 31–32; Introduction §9, p. 15: Defines the Tate dual Ď = Hom(D, E dT/(1+T)) with its residue pairing, and in rank 2 the characters α_D, δ_D = (x|x|)^{−1}α_D and the identification Ď = D ⊗ δ_D^{−1}.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.1/fontaine-functor-convention`, `PadicLocalLanglandsForGL2Qp:R30.1/character-dictionary`, `PhiGammaModulesAndIwasawaCohomology:PG.1`.

### The operator ψ and the lattices D⁺, D^♮ and D^♯

**Target `R30.1/psi-and-treillis` (construction).** Let D be an étale (φ,Γ)-module over O_E (torsion or free). Every x ∈ D is uniquely Σ_{i=0}^{p−1} (1+T)^i φ(x_i), and ψ(x) := x₀ is the left inverse of φ commuting with Γ (PhiGammaModulesAndIwasawaCohomology PG.4). Define D⁺ = {z : (φ^n(z))_n bounded}, D⁺⁺ = {z : φ^n(z) → 0}, D^{nr} = ∩_n φ^n(D), D^♮ = the smallest compact O_E⁺-submodule of D that is stable under ψ and generates D, and D^♯ = the largest compact O_E⁺-submodule of D stable under ψ on which ψ is surjective; for D ∈ ΦΓ^et(E) these are L·Δ^♮, L·Δ^♯ etc. for a φ- and Γ-stable O_E-lattice Δ. Then D⁺⁺ ⊂ D⁺ ⊂ D^♮ ⊂ D^♯, D⁺ = D^{nr} ⊕ D⁺⁺, a surjection D → D₁ of étale modules induces surjections D^♮ → D₁^♮ and D^♯ → D₁^♯, D^{nr} = 0 when V(D)^{H'} = 0 (e.g. D irreducible of rank ≥ 2), and for D torsion, in the residue pairing Ď × D → O_L the orthogonal of D^♮ is Ď⁺ and that of D^♯ is Ď⁺⁺, so D^♯/D^♮ is dual to Ď^{nr}.

**Hypotheses.**

- D étale over O_E; the existence of D^♮ and D^♯ is Colmez's (from his Iwasawa-theory paper [35]).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/PhiGamma`, namespace `TauCeti.PhiGammaModuleEt`.

**Uses.**

- Colmez, Théorème 0.17: Π(D) = (D ⊠ P¹)/(D^♮ ⊠ P¹)
- Colmez, Proposition 0.12(iii): β_{ℚ_p}(Π^∨) lies in D^♯ ⊠ ℚ_p and contains D^♮ ⊠ ℚ_p
- Colmez, §IV.1: D^♮_W(Π) and D⁺_W(Π) play the roles of D^♮ and D⁺ in the construction of D(Π)

**API.**

- `PhiGammaModuleEt.psi` (data): ψ : D → D, imported from PG.4.
- `PhiGammaModuleEt.plusPart` (constructor): D⁺ = {z : (φ^n z) bounded}.
- `PhiGammaModuleEt.natural` (constructor): D^♮, the smallest compact ψ-stable O_E⁺-submodule generating D.
- `PhiGammaModuleEt.sharp` (constructor): D^♯, the largest compact ψ-stable O_E⁺-submodule on which ψ is onto.
- `PhiGammaModuleEt.plus_le_natural_le_sharp` (relation): D⁺⁺ ⊂ D⁺ ⊂ D^♮ ⊂ D^♯.
- `PhiGammaModuleEt.natural_map_surjective` (functoriality): A surjection f : D → D₁ restricts to surjections D^♮ → D₁^♮ and D^♯ → D₁^♯.
- `PhiGammaModuleEt.psi_surjective_sharp` (characterisation): ψ(D^♯) = D^♯.
- `PhiGammaModuleEt.orthogonal_natural` (relation): For D torsion, (D^♮)^⊥ = Ď⁺ and (D^♯)^⊥ = Ď⁺⁺ in the residue pairing.

**Proof route.**

- ψ is imported from PG.4/linearized-psi with its uniqueness and Γ-compatibility.
- Existence of D^♮, D^♯ and the inclusions D⁺⁺ ⊂ D⁺ ⊂ D^♮ ⊂ D^♯ are recalled in Colmez §I.3.2 from his earlier paper ([35, II.4–II.5]); they are planned here as recalled statements with that proof route.
- Surjectivity under quotients (Proposition I.3.2), the description of D^{nr} (Proposition I.3.3) and the duality (Proposition I.3.4) follow from the finite-length theory for torsion modules and passage to the limit.

**Checks.**

- `PhiGammaModuleEt.natural_trivial` (computation): For D = E: D^♮ = E⁺ = L ⊗ O_L[[T]] and D^♯ = T^{−1}E⁺.
- `PhiGammaModuleEt.nr_trivial` (computation): For D = E: D^{nr} = L and D⁺⁺ = T E⁺.
- `PhiGammaModuleEt.natural_zero` (degenerate): For D = 0 all four lattices are 0.
- `PhiGammaModuleEt.natural_ne_sharp_trivial` (non-example): D^♮ ≠ D^♯ for D = E (T^{−1} ∈ D^♯ ∖ D^♮), so the two treillis are different objects.

**Acceptance.**

- Example: for D = E (trivial), D⁺ = D^♮ = E⁺, D⁺⁺ = T E⁺, D^{nr} = L and D^♯ = T^{−1}E⁺ (Colmez p. 33).
- D ↦ D^♮ and D ↦ D^♯ are not exact (Colmez §VII.4.7 shows D ↦ D^♮ ⊠ P¹ is not exact).

**Sources.**

- COLMEZ10, §I.3.2, pp. 33–35: the definitions, Example, Propositions I.3.2–I.3.4: Defines D⁺⁺, D⁺, D^{nr}, D^♮ and D^♯, computes them for D = E, records D⁺⁺ ⊂ D⁺ ⊂ D^♮ ⊂ D^♯ and D⁺ = D^{nr} ⊕ D⁺⁺, surjectivity on D^♮ and D^♯ under quotient maps, the description of D^{nr} and the orthogonality statements.
- COLMEZ10, Introduction §6, p. 11: Gives the three defining extremal properties of D⁺, D^♮ and D^♯ used for Colmez's functor.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.1/fontaine-functor-convention`, `PadicLocalLanglandsForGL2Qp:R30.1/tate-dual`, `PhiGammaModulesAndIwasawaCohomology:PG.4/linearized-psi`, `PhiGammaModulesAndIwasawaCohomology:PG.4/linearized-psi-uniqueness`, `PhiGammaModulesAndIwasawaCohomology:PG.4/psi-zero-splitting`.

### (P(ℤ_p),ψ)-modules and the P(ℚ_p)-module M ⊠ ℚ_p

**Target `R30.1/boxtimes-qp` (construction).** A (P(ℤ_p),ψ)-module is a topological O_L-module M with continuous P(ℤ_p)-action and a continuous surjective O_L-linear ψ commuting with diagonal units and satisfying ψ(u(pb)z)=u(b)ψ(z). Its module M ⊠ ℚ_p consists of sequences x_n with ψ(x_{n+1})=x_n. Diagonal units act coordinatewise; diag(p^k,1) gives y_n=x_{n+k} for n≥max(0,−k), and u(b) gives y_n=u(p^n b)x_n once p^n b∈ℤ_p; earlier coordinates are recovered using ψ. These determine the continuous mirabolic action. For O_L-valued measures on ℤ_p this inverse limit identifies with measures on ℚ_p and the affine action x↦ax+b. Compact-open restriction operators require in addition a compatible φ splitting ψ, as for an étale (φ,Γ)-module: Res_{a+p^nℤ_p}=u(a)φ^nψ^n u(−a), and D ⊠ ℤ_p^×=ker ψ. A central character δ extends this to the B-action.

**Hypotheses.**

- M a (P(ℤ_p),ψ)-module; δ ∈ T̂(O_L) for D ⊠_δ ℚ_p.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Mirabolic`, namespace `TauCeti.PsiModule`.

**Uses.**

- Colmez, Proposition 0.12(iii): β_{ℚ_p} : Π^∨ → D ⊠_δ ℚ_p is B-equivariant with kernel (Π^∨)^U
- Colmez, Théorème 0.17: D^♮ ⊠ P¹ is defined by Res_{ℚ_p} z ∈ D^♮ ⊠ ℚ_p
- Colmez, §13.1: Π\* ≅ D^♮ ⊠ ℚ_p as P(ℚ_p)-modules for trianguline Π

**API.**

- `PsiModule` (structure): Topological O_L-modules with continuous P(ℤ_p)-action and continuous surjective ψ satisfying the covariance identities.
- `PsiModule.boxtimesQp` (constructor): M ⊠ ℚ_p as ψ-compatible sequences.
- `PsiModule.boxtimesQp_action` (instance): The unique P(ℚ_p)-action given by the three formulas.
- `PsiModule.res` (projection): For the additional compatible φ structure, the compact-open restriction idempotents, satisfying Res_U Res_V=Res_{U∩V} and additivity for disjoint compact opens.
- `PsiModule.res_Zp` (simp): For an étale module D, Res_{ℤ_p} identifies D ⊠ ℤ_p with D; for k≥0 the zeroth coordinate after diag(p^k,1) is x_k.
- `PsiModule.boxtimesQp_measures` (compatibility): For M = D⁰(ℤ_p, O_L), M ⊠ ℚ_p ≅ D⁰(ℚ_p, O_L) P(ℚ_p)-equivariantly.
- `PsiModule.boxtimesZpUnits` (characterisation): D ⊠ ℤ_p^× = D^{ψ=0}.

**Proof route.**

- Uniqueness: the three formulas determine the action on the generators of P(ℚ_p) (R30.1/gl2qp-subgroups); existence is checked on relations, using that ψ commutes with (ℤ_p^× 0; 0 1) and the twisted commutation with unipotents (Colmez Proposition 0.5).
- For measures, (x^{(n)}) ↦ the measure on ℚ_p whose restriction to p^{−n}ℤ_p is x^{(n)} rescaled identifies the inverse limit with D⁰(ℚ_p, O_L).
- D ⊠ ℤ_p^× = D^{ψ=0} follows from the decomposition D = φ(D) ⊕ D^{ψ=0} (PG.4/psi-zero-splitting).
- The Zp-coefficient Amice equivalence supplies a linear starting point only. Extend the coefficients to O_L and prove convolution, affine-action and restriction compatibility before using the measure comparison (gap G5).

**Checks.**

- `PsiModule.boxtimesQp_measures_dirac` (computation): Under M ⊠ ℚ_p ≅ D⁰(ℚ_p), (a b; 0 1) sends the Dirac mass at x to the Dirac mass at ax + b.
- `PsiModule.boxtimesQp_zero` (degenerate): 0 ⊠ ℚ_p = 0.
- `PsiModule.phi_shift` (characterisation): (p 0; 0 1) acts on M ⊠ ℚ_p by the shift (x^{(n)}) ↦ (x^{(n+1)}), and (p^{−1} 0; 0 1) by (x^{(n)}) ↦ (y^{(n)}) with y^{(n)} = x^{(n−1)} for n ≥ 1 and y^{(0)} = ψ(x^{(0)}).
- `PsiModule.boxtimesQp_ne_M` (non-example): M ⊠ ℚ_p is not M: for M = D⁰(ℤ_p) it contains measures supported on p^{−1}ℤ_p ∖ ℤ_p.

**Acceptance.**

- For D⁰(ℤ_p, O_L): M ⊠ ℚ_p = D⁰(ℚ_p, O_L) with the affine action.
- Res_{ℤ_p}∘(p^k 0; 0 1) recovers x^{(k)}.

**Sources.**

- COLMEZ10, Introduction §5, Proposition 0.5, pp. 9–10; §I.3.3–I.3.4, pp. 35–40: Defines (P(ℤ_p),ψ)-modules, M ⊠ ℚ_p as ψ-compatible sequences with the unique P(ℚ_p)-action given by the three formulas, the measure example D⁰(ℤ_p) ⊠ ℚ_p = D⁰(ℚ_p), and the P(ℚ_p)-modules D ⊠ ℚ_p, D^♯ ⊠ ℚ_p and D^♮ ⊠ ℚ_p.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.1/gl2qp-subgroups`, `PadicLocalLanglandsForGL2Qp:R30.1/psi-and-treillis`, `PhiGammaModulesAndIwasawaCohomology:PG.4/psi-zero-splitting`, `mathlib:AbstractMeasure`.

### Rank-one (φ,Γ)-modules R(δ) over the Robba ring

**Target `R30.1/rank-one-robba-modules` (definition).** For δ ∈ T̂(L), R(δ) is the (φ,Γ)-module over the Robba ring R = R_L that is R itself with φ multiplied by δ(p) and γ ∈ Γ multiplied by δ(χ(γ)). (i) Every (φ,Γ)-module of rank 1 over R is isomorphic to R(δ) for a unique δ ∈ T̂(L). (ii) R(δ) has Kedlaya slope v_p(δ(p)); it is étale (slope 0) iff δ is unitary, and then R(δ) = D_rig(δ) for δ viewed as a Galois character. (iii) Ext¹(R(δ₂), R(δ₁)) = Ext¹(R, R(δ₁δ₂^{−1})) = H¹(δ₁δ₂^{−1}) is one-dimensional over L unless δ₁δ₂^{−1} is x^{−i} (i ∈ ℕ) or |x|x^i (i ≥ 1), when it is two-dimensional, with projectivisation ℙ¹(L).

**Hypotheses.**

- p ≠ 2 in the source read (Colmez, Représentations triangulines, §0.1 and its footnote 1); the p = 2 case of (i) and (iii) is recorded as gap G2 of this packet.
- L/ℚ_p finite; R = R_L the Robba ring over L.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Trianguline`, namespace `TauCeti.RobbaRankOne`.

**Uses.**

- Colmez, Représentations triangulines, §0.4: trianguline representations are those with D_rig(V) an extension of R(δ₂) by R(δ₁)
- LocalGaloisDeformationRings R08.1/phi-gamma-module-deformation-rings: trianguline deformations are parametrised by deformations of the characters δ
- this roadmap R30.4/trianguline-locally-analytic-vectors: Π(Δ(s)) for s = (δ₁, δ₂, ℒ)

**API.**

- `RobbaRankOne` (constructor): R(δ) for δ ∈ T̂(L).
- `RobbaRankOne.classification` (characterisation): Every rank-one (φ,Γ)-module over R is isomorphic to a unique R(δ).
- `RobbaRankOne.slope` (projection): slope(R(δ)) = v_p(δ(p)).
- `RobbaRankOne.isEtale_iff` (characterisation): R(δ) is étale iff δ is unitary, and then R(δ) ≅ D_rig(δ).
- `RobbaRankOne.tensor` (simp): R(δ₁) ⊗ R(δ₂) ≅ R(δ₁δ₂) and R(δ)^∨ ≅ R(δ^{−1}).
- `RobbaRankOne.finrank_ext` (relation): dim_L Ext¹(R(δ₂), R(δ₁)) is 1, or 2 exactly when δ₁δ₂^{−1} ∈ {x^{−i} : i ≥ 0} ∪ {|x|x^i : i ≥ 1}.

**Proof route.**

- (i): a rank-one module is R·e with φ(e) = a e and γ(e) = b(γ) e; Colmez's Proposition 3.1 shows that after changing e one may take a ∈ L^× and b a character of Γ with values in L^×, and δ is recovered by δ(p) = a, δ|_{ℤ_p^×} = b∘χ^{−1}.
- (ii): Kedlaya's slope filtration (PG.2 / PadicHodgeTheory P7) gives the slope v_p(δ(p)); étaleness iff slope 0.
- (iii): Colmez's computation of H⁰, H¹ of R(δ) via the Herr complex (PG.3) and the operator ∂ = (1+T)d/dT (Théorème 2.9 there).

**Checks.**

- `RobbaRankOne.normChar_eq_cyclotomic` (compatibility): R(x|x|) ≅ D_rig(L(χ)).
- `RobbaRankOne.trivial` (degenerate): R(1) ≅ R.
- `RobbaRankOne.finrank_ext_trivial` (computation): dim Ext¹(R, R) = 2.
- `RobbaRankOne.x_not_etale` (non-example): R(x) (δ(p) = p) is not étale: its slope is 1.

**Acceptance.**

- R(x|x|) = D_rig(χ).
- R(1) = R and R(x^{−i}) has H⁰ ≠ 0 (contains t^i).
- dim H¹(1) = 2 = dim Hom(ℚ_p^×, L).

**Sources.**

- COLMEZ08TRI, §0.3, Théorème 0.2, p. 3; Proposition 3.1, p. 17; Théorème 2.9, p. 13 of the author's version: Defines R(δ), proves that every rank-one (φ,Γ)-module over R is a unique R(δ), and computes Ext¹(R(δ₂), R(δ₁)) = H¹(δ₁δ₂^{−1}) as one-dimensional except for δ₁δ₂^{−1} = x^{−i} or |x|x^i where it is two-dimensional.
- COLMEZ08TRI, Remarque 0.3(i), p. 4: The slope of R(δ) is v_p(δ(p)).

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.1/character-dictionary`, `PadicLocalLanglandsForGL2Qp:R30.1/fontaine-functor-convention`, `PadicHodgeTheory:P7:annulus-foundations/robba-ring`, `PhiGammaModulesAndIwasawaCohomology:PG.2`, `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-complex`.

### Trianguline representations of dimension 2 and Colmez's parameter space

**Target `R30.1/trianguline-representation` (definition).** A two-dimensional L-representation V of G_{ℚ_p} is trianguline if D_rig(V) is an extension 0 → R(δ₁) → D_rig(V) → R(δ₂) → 0 (R30.1/rank-one-robba-modules). Colmez's space S parametrises s = (δ₁, δ₂, ℒ) with ℒ ∈ ℙ(Ext¹(R(δ₂), R(δ₁))) (a point except on the loci δ₁δ₂^{−1} = x^i|x| (i ≥ 1) or x^{−i} (i ≥ 0), where it is ℙ¹(L)); S₊ is cut out by v_p(δ₁(p)) + v_p(δ₂(p)) = 0 and v_p(δ₁(p)) ≥ 0, with u(s) = v_p(δ₁(p)), w(s) = w(δ₁) − w(δ₂), and S₊ = S^{ng} ⊔ S^{cris} ⊔ S^{st} ⊔ S^{ord} ⊔ S^{ncl}, S_irr = S^{ng}_\* ⊔ S^{cris}_\* ⊔ S^{st}_\* (∗: u(s) > 0). For s ∈ S_\* ∖ S^{ncl}_\*, D(s) is étale and V(s) := V(D(s)) is trianguline; V(s) is irreducible iff s ∈ S_irr; det V(s) = δ₁δ₂ and its generalized Hodge–Tate weights are w(δ₁), w(δ₂); every irreducible trianguline V is some V(s), and V(s) ≅ V(s') for s ≠ s' in S_irr iff s, s' ∈ S^{cris}_\* and s' = (x^{w(s)}δ₂, x^{−w(s)}δ₁, ∞). A two-dimensional crystalline V is trianguline iff the φ-eigenvalues on D_cris(V) lie in L; every two-dimensional semistable V is trianguline. The crystalline assertion is made after extending L to contain the Frobenius eigenvalues; the parameter classification cited here assumes p≠2 (G2).

**Hypotheses.**

- p ≠ 2 in the source read (Colmez, Représentations triangulines, §0.1, footnote 1); the p = 2 case is gap G2.
- V two-dimensional over L with L large enough to contain the needed eigenvalues.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Trianguline`, namespace `TauCeti.Trianguline`.

**Uses.**

- Colmez 2010, Remarque 0.18(iii): G-stability of D^♮ ⊠ P¹ is proved by analytic continuation from the trianguline (or crystabelline) case
- Colmez 2010, Remarque VI.6.51(i): Π^alg is supersingular iff V(D) is not trianguline
- Colmez 2014, La série principale unitaire, Théorème 0.1: Π(Δ(s)) and the unitary principal series
- roadmap Required examples: the trianguline example check

**API.**

- `Trianguline.IsTrianguline` (characterisation): V is trianguline iff D_rig(V) has a rank-one (φ,Γ)-stable saturated R-submodule.
- `Trianguline.param` (constructor): The triple s = (δ₁, δ₂, ℒ) of a non-split trianguline D.
- `Trianguline.rep` (constructor): V(s) for s ∈ S_\* ∖ S^{ncl}_\*.
- `Trianguline.det_rep` (simp): det V(s) = δ₁δ₂.
- `Trianguline.hodgeTate_rep` (relation): The generalized Hodge–Tate weights of V(s) are w(δ₁) and w(δ₂).
- `Trianguline.irreducible_iff` (characterisation): V(s) is irreducible iff s ∈ S_irr.
- `Trianguline.crystalline_iff` (compatibility): A two-dimensional crystalline V is trianguline iff the φ-eigenvalues on D_cris(V) are in L.

**Proof route.**

- The parameter space and its stratification are defined from the rank-one classification and the Ext¹ computation (R30.1/rank-one-robba-modules).
- Slope 0 of D(s) for s ∈ S_\* ∖ S^{ncl}_\* and irreducibility for s ∈ S_irr: Colmez's Théorème 0.5, via Kedlaya's slope filtration.
- generalized Hodge–Tate weights and determinant: Colmez's Propositions 4.4–4.5, via Sen theory on D_dif (PadicHodgeTheory P7/fontaine-dif-module).
- Crystalline and semistable criteria: Théorème 0.8 and Remarque 0.9, using Berger's dictionary D_cris, D_st from D_rig (PadicHodgeTheory P7/berger-dcris-dst-dictionary).

**Checks.**

- `Trianguline.semistable_isTrianguline` (characterisation): Every two-dimensional semistable V is trianguline.
- `Trianguline.split_sum` (degenerate): For unitary δ₁, δ₂, the split module R(δ₁) ⊕ R(δ₂) corresponds to δ₁ ⊕ δ₂, which is trianguline and not in the image of S_irr.
- `Trianguline.rep_cris_coincidence` (computation): For s = (δ₁, δ₂, ∞) ∈ S^{cris}_\*, V(s) ≅ V(x^{w(s)}δ₂, x^{−w(s)}δ₁, ∞).
- `Trianguline.not_supercuspidal` (non-example): A de Rham V with irreducible Weil–Deligne representation (supercuspidal type) is not trianguline.

**Acceptance.**

- An absolutely irreducible crystalline V with Frobenius eigenvalues in L is V(s) for s ∈ S^{cris}_\*.
- A V whose Weil–Deligne representation is irreducible (supercuspidal type) is not trianguline.

**Sources.**

- COLMEZ08TRI, §0.2–0.4, pp. 2–5: the space S_irr, Théorème 0.5, Remarque 0.7, Théorème 0.8, Remarque 0.9: Defines S, S₊, u(s), w(s), the strata ng, cris, st, ord, ncl and S_irr; shows D(s) is étale off S^{ncl}_\* and V(s) irreducible exactly on S_irr, with the only coincidences on S^{cris}_\*; gives generalized Hodge–Tate weights w(δ₁), w(δ₂) and the crystalline and semistable criteria.
- COLMEZ08TRI, Propositions 4.4, 4.5 and 4.8, pp. 23–24: det V(s) = δ₁δ₂, generalized Hodge–Tate weights w(δ₁) and w(δ₂), and V(s) irreducible iff s ∈ S_irr.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.1/rank-one-robba-modules`, `PadicHodgeTheory:P7/fontaine-dif-module`, `PadicHodgeTheory:P7/berger-dcris-dst-dictionary`, `PadicHodgeTheory:R06.2/admissible-representations`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`.

### Colmez's classical correspondence LL(M) against R16.3

**Target `R30.1/classical-normalisation-bridge` (comparison).** Let M be a two-dimensional representation of the Weil–Deligne group WD_{ℚ_p} over L that is not a twist of the trivial representation by a character, with Frobenius normalised as in PadicHodgeTheory R06.3/weil-deligne-parameter and characters read through R30.1/character-dictionary. Colmez's LL(M) is: Ind_B^G(δ₁ ⊗ δ₂|·|^{−1}) (≅ Ind_B^G(δ₂ ⊗ δ₁|·|^{−1})) for M = δ₁ ⊕ δ₂ with δ₁ ∉ {δ₂, δ₂|·|, δ₂|·|^{−1}}; for M = δ ⊕ δ|·| with N = 0, the reducible Ind_B^G(δ|·| ⊗ δ|·|^{−1}), an extension of δ∘det by St ⊗ (δ∘det); for M = δ ⊕ δ|·| with N ≠ 0, St ⊗ (δ∘det); for the non-split extension of δ by δ, Ind_B^G(δ ⊗ δ|·|^{−1}); and for M irreducible, the supercuspidal rec^{−1}(M⊗ν^{−1/2}). For a filtration with jumps a < b put LL(M, Fil) = LL(M) ⊗ W_{a,b−a} with W_{a,k} = Sym^{k−1} ⊗ det^a. The bridge theorem: for M not of the form δ ⊕ δ|·| with N = 0, LL(M) is the irreducible π with rec(π) ⊗ ν^{1/2} ≅ M^{F-ss}, where rec is the unitary correspondence of GL2AutomorphicRepresentationsAndTransfer R16.3 and ν = |·|; equivalently M^{F-ss} ≅ recᵀ(π) ⊗ ν for the Tate normalisation recᵀ(π) = rec(π) ⊗ ν^{−1/2} of R16.3/tate-unitary-normalization, so det M = ω_π·ν. In the case M = δ ⊕ δ|·| with N = 0, Colmez takes the full reducible principal series Ind_B^G(δ|·| ⊗ δ|·|^{−1}) instead of the one-dimensional Langlands quotient that rec^{−1} attaches. Colmez’s functor V and the Kisin–Emerton functor MF differ by a Tate twist: V(π) = MF(π)(ε). Colmez’s list permits a non-semisimple Weil self-extension. Only the comparison with rec uses its Frobenius semisimplification M^{F-ss}, retaining N; in particular special representations retain nonzero monodromy. In the supercuspidal case LL(M)=rec_T^{-1}(M⊗ν^{−1}) for the R16.3 Tate-normalised correspondence.

**Hypotheses.**

- M two-dimensional, not a character twist of the trivial representation.
- The geometric-Frobenius normalisation on both sides (R30.1/character-dictionary, R16.3).

**Uses.**

- Colmez, Théorème 0.21 and VI.6.50: Π(D)^lc = LL(D_pst)
- Emerton, lg Theorem 3.3.22: π_p(V) and the locally algebraic vectors Sym^{a−b−1} ⊗ det^{b+1} ⊗ π_p(V)
- CDP 2014, Theorem 1.3: completions of π ⊗ W are classified with π attached to Δ by the classical correspondence

**Proof route.**

- Write each case of Colmez's list in R16.3's normalised induction i_B^G(a, b) = Ind_B^G(a|·|^{1/2} ⊗ b|·|^{−1/2}): Ind_B^G(δ₁ ⊗ δ₂|·|^{−1}) = i_B^G(δ₁|·|^{−1/2}, δ₂|·|^{−1/2}), whose unitary parameter is (δ₁ ⊕ δ₂)|·|^{−1/2} by R16.3/principal-series-parameter; twisting by ν^{1/2} gives M, and R16.3/tate-unitary-normalization rewrites this as recᵀ ⊗ ν.
- The Steinberg case: R16.3/steinberg-monodromy gives the monodromy-nonzero parameter of St ⊗ (δ∘det), matching Colmez's N ≠ 0 case.
- The N = 0 non-generic case is where Colmez's LL differs from rec^{−1}: R16.3 attaches the one-dimensional Langlands quotient, Colmez the reducible principal series; record the difference explicitly.
- For a nonsplit Weil self-extension of δ, Colmez’s principal series has unitary parameter (δ ⊕ δ)ν^{−1/2}. Thus the classical parameter remembers M^{F-ss}, not the unipotent Frobenius extension; semisimplifying Frobenius does not discard N.
- Supercuspidal case: R16.3/supercuspidal-parameter with the same twist by ν^{1/2}.
- V(π) = MF(π)(ε): Colmez defines V(Π) as the Tate dual of V(D(Π)), Emerton defines MF(π) as its Pontryagin dual (Emerton lg §3.2, footnote 6), and the two duals differ by χ.

**Acceptance.**

- For M = μ_α ⊕ μ_β unramified with α/β ∉ {1, p, p^{−1}}, LL(M) = Ind_B^G(μ_α ⊗ μ_β|·|^{−1}) has central character μ_{αβ}|·|^{−1}, and its unitary parameter under R16.3 is (μ_α ⊕ μ_β)|·|^{−1/2}.
- For M = δ ⊕ δ|·| with N ≠ 0, LL(M) = St ⊗ (δ∘det), whose R16.3 parameter δ|·|^{1/2} ⊕ δ|·|^{−1/2} with nonzero monodromy becomes M after the twist by |·|^{1/2}.
- LL(M ⊗ η) = LL(M) ⊗ (η∘det) for a character η, and the central character of LL(M) is det(M)·|·|^{−1}.
- A nonsplit Weil self-extension of δ has the same classical parameter as (δ ⊕ δ)ν^{−1/2}; its non-semisimple Frobenius is not recovered from rec. This operation still retains N for the Steinberg case.

**Sources.**

- COLMEZ10, §VI.6.11, p. 192: Lists LL(M) for the reducible two-dimensional WD-representations (generic sum, δ ⊕ δ|·| with N = 0 or N ≠ 0, non-split self-extension), using δ(g) = δ(p)^{−deg g}δ(χ(g)), and defines LL(M, Fil) = LL(M) ⊗ W_{a,b−a} for jumps a < b.
- COLMEZ10, Introduction §11, p. 17: LL(D_pst) is irreducible except when N = 0 although the W_{ℚ_p}-action would allow N ≠ 0.
- EMERTON-LG, §3.2, p. 19 and footnote 6: MF(π) is the Pontryagin dual of the Galois representation of D(π); Colmez's V carries an additional cyclotomic twist.
- EMERTON-LG, Notation and conventions, pp. 11–13: Emerton normalises the local Artin map by ℓ ↦ geometric Frobenius and attaches to an irreducible Ind_B^G(χ₁ ⊗ χ₂) the Weil–Deligne representation χ₁ ⊕ χ₂|·|^{−1}.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.1/character-dictionary`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/steinberg-monodromy`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/tate-unitary-normalization`, `PadicHodgeTheory:R06.3/weil-deligne-parameter`, `PadicHodgeTheory:R06.3/convention-comparison-with-r01`.

**Remaining work for this layer.**

- Replace the stage-level imports PhiGammaModulesAndIwasawaCohomology PG.0–PG.2 by node ids once that packet plans PG.0–PG.2 (its coverage is not_read there).
- Close gap G2 (p = 2 for R(δ) and the trianguline parameter space) with a public source for the rank-one classification at p = 2.
- Settle gap G4 (Emerton's normalisations against Colmez's LL and V).
- G2. p = 2 for the trianguline classification
- G4. Emerton's normalisation of π_p(V) and of B(V) against Colmez's LL and Π(V)
- G5. Scalar and topological adapters for measures and O-linear duality

## R30.2. Smooth, Banach and analytic representation categories

**Planets:** Locally admissible mod p representations, Admissible unitary Banach representations, Classification of irreducible mod p representations.

### Smooth, locally finite and locally admissible torsion representations of GL₂(ℚ_p)

**Target `R30.2/smooth-torsion-categories` (definition).** Let G=GL₂(ℚ_p), O=O_L and ζ:Z→O^× be continuous. Mod^{sm}_{G,ζ}(O) consists of discrete O-torsion modules with O-linear G-action, open vector stabilisers and central character ζ. An object is admissible when π^H[ϖ^n] is finite over O for each compact open H and each n≥1, locally admissible when every cyclic O[G]-submodule is admissible, and locally finite when every cyclic O[G]-submodule has finite O[G]-length. Rep^{tors}G and Rep^{ℓf}G denote finite-length smooth objects with the indicated coefficient and central-character conventions; they do not denote all locally finite objects. These are specialisations of the existing general smooth category. The GL₂(ℚ_p) theorem identifying local admissibility and local finite length, and the representation-specific injective-envelope statement, are separate targets at R30.2/locally-admissible-finite-length.

**Hypotheses.**

- O = O_L, ϖ, k = k_L as in R30.1/character-dictionary; ζ continuous.
- The finite-length statement uses the classification of R30.2/modp-irreducibles, which is special to F = ℚ_p.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/SmoothTorsion`, namespace `TauCeti.GL2Qp`.

**Uses.**

- Paškūnas 2013, §1.1: blocks and the Gabriel decomposition of Mod^{l.fin}_{G,ζ}(O)
- Colmez, Théorème IV.2.13: D(Π) is defined on Rep^{tors}G
- CDN 2023, §1.3.3: blocks of Rep^{ℓf}G and of Rep^{δ}G

**API.**

- `GL2Qp.SmoothTorsionRep` (data): Objects of Mod^{sm}_{G,ζ}(O): TopRep O G that are IsSmoothDiscrete, ϖ-power torsion, with Z acting by ζ.
- `GL2Qp.IsAdmissible` (characterisation): π^H[ϖ^n] finitely generated over O for all compact open H and n.
- `GL2Qp.IsLocallyAdmissible` (characterisation): O[G]v admissible for all v.
- `GL2Qp.IsLocallyFinite` (characterisation): O[G]v of finite length for all v.
- `GL2Qp.locallyAdmissible_grothendieck` (instance): The locally admissible full subcategory, with its abelian/Grothendieck structure furnished by the representation-category result in G6; general smooth-category Grothendieck structure alone does not prove this.

**Proof route.**

- Import the smooth category over a ring, admissibility and local admissibility from SmoothRepresentationsOfLocalGroups SR.0 (SR.0.1–SR.0.4 and SR.0:derived-extension.1, which proves the Grothendieck property and supplies injective envelopes) and specialise to A = O/ϖ^n and G = GL₂(ℚ_p).
- Smoothness at the pin is Tau Ceti's IsSmoothDiscrete on TopRep (discrete module, open point stabilisers).
- Every irreducible smooth representation is admissible and finitely presented (CDN 2023 §1.2.3, from Barthel–Livné and Breuil), and both properties are stable under extensions, giving Rep^{ℓf}G ⊂ Rep^{adm}G ∩ Rep^{pf}G; hence a locally finite object is locally admissible and finite length objects are admissible.
- Locally admissible ⇒ locally finite: O[G]v is finitely generated and admissible, hence has admissible cosocle, hence finite length (CDN 2023 Théorème 1.21 for objects killed by ϖ, and dévissage along ϖ-adic filtrations).
- Gabriel's theory of locally finite Grothendieck categories applies (Paškūnas 2013 §2 and [35, §IV] there).

**Checks.**

- `GL2Qp.trivial_isLocallyFinite` (degenerate): The trivial one-dimensional representation over k is in Mod^{l.fin}_{G,1}(k).
- `GL2Qp.compactInduction_not_isLocallyFinite` (non-example): c-Ind_{KZ}^G Sym^r k² is smooth with central character but not locally finite.
- `GL2Qp.principalSeries_finiteLength` (computation): Ind_B^G(χ₁ ⊗ χ₂) over k has length 1 or 2.
- `GL2Qp.smooth_compat` (compatibility): A representation is in Mod^{sm}_G(k) iff its TopRep is IsSmoothDiscrete with k discrete (Tau Ceti IsSmoothDiscrete).
- `GL2Qp.steinberg_length_not_O_length` (non-example): Over k, Steinberg has length one over k[G] and infinite length as a k-module; local finiteness must accept it.

**Acceptance.**

- The trivial representation and Ind_B^G(χ₁ ⊗ χ₂) lie in Mod^{l.fin}_{G,ζ}(k) for the matching ζ.
- c-Ind_{KZ}^G σ is smooth but not locally finite: it is a free k[T]-module of infinite rank (FiniteFlat R07.5).

**Sources.**

- PASKUNAS13, §2, pp.14–15: Defines the torsion, locally admissible and profinite augmented representation categories, including coefficientwise Pontryagin duality.
- CDN23, §1.2.1–1.2.3, pp. 14–16; Théorème 1.21, p. 22: Barthel–Livné classification over F̄_p, Breuil's irreducibility, Berger's central character theorem, and the conclusion that every irreducible smooth representation of GL₂(ℚ_p) is admissible and finitely presented, so Rep^{ℓf}G ⊂ Rep^{adm}G ∩ Rep^{pf}G; a finitely generated smooth k_L[G']-module with admissible cosocle has finite length.
- COLMEZ10, Introduction §4, p. 8 (and footnote 3): Defines Rep^{tors}G as smooth admissible finite length O_L[G]-modules with a central character and notes that admissibility follows from the other conditions.

**Needs:** `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `tauceti:TauCeti.IsSmoothDiscrete`, `mathlib:TopRep`, `mathlib:CategoryTheory.IsGrothendieckAbelian`, `PadicLocalLanglandsForGL2Qp:R30.1/gl2qp-subgroups`.

### The Pontryagin dual category C_{G,ζ}(O) of compact O[[K]]-modules

**Target `R30.2/pontryagin-dual-category` (construction).** For compact open H⊂G, Mod^{pro aug}_G(O) is the category of profinite O[[H]]-modules with compatible continuous O[G]-action. The O-linear dual π^∨=Hom_O^{cont}(π,L/O), with (gμ)(v)=μ(g^{-1}v), gives an anti-equivalence from smooth O-torsion modules to this category. The full dual category C_{G,ζ}(O) corresponds to locally admissible smooth modules with central character ζ and has central action ζ^{-1}. Its projective envelopes are duals of injective envelopes in that smooth representation category, using R30.2/locally-admissible-finite-length. The smooth dual M^∨ is admissible exactly when M is finite over O[[H]]. Completed-group-algebra and compact Nakayama inputs are requested from their owners; O-linear duality requires G5.

**Hypotheses.**

- H compact open in G; O[[H]] = lim O/ϖ^n[H/H'] over open normal H'.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/DualCategory`, namespace `TauCeti.GL2Qp`.

**Uses.**

- Paškūnas 2013, §§3–5: the projective envelope P̃ of π^∨ and its endomorphism ring
- Nakamura 2023, Lemma B.23: the dual π\* of a deformation lies in C^ψ(O)
- CompletedCohomologyAndLocalGlobalCompatibility R31: Pontryagin duals of completed cohomology are objects of C(O)

**API.**

- `GL2Qp.DualCategory` (data): C_{G,ζ}(O): profinite O[[K]]-modules with compatible G-action and central character ζ^{−1} (dual convention).
- `GL2Qp.pontryaginDual` (constructor): π ↦ π^∨ = Hom^{cont}_O(π, L/O) with ⟨gμ, v⟩ = ⟨μ, g^{−1}v⟩.
- `GL2Qp.pontryaginDual_antiEquivalence` (equivalence): π ↦ π^∨ is an anti-equivalence Mod^{l.adm}_{G,ζ}(O) ≅ C_{G,ζ}(O).
- `GL2Qp.exists_projectiveEnvelope` (universal-property): Every object of C_{G,ζ}(O) has a projective envelope.
- `GL2Qp.dual_isAdmissible_iff_fg` (characterisation): The smooth dual M^∨ is admissible iff the compact module M is finitely generated over O[[K]].

**Proof route.**

- Pontryagin duality for discrete torsion O-modules versus compact O-modules (Mathlib PontryaginDual over the circle, specialised to L/O) gives the anti-equivalence on underlying modules; the G-action is transported and is compatible with the O[[H]]-module structure by smoothness.
- Admissibility ⇔ finite generation over O[[H]]: π^{H'}[ϖ] finite for all H' ⇔ π^∨/𝔪 finite-dimensional ⇔ π^∨ finitely generated by topological Nakayama (PadicMeasuresIwasawaAlgebras L5, compact inverse systems and topological Nakayama).
- Projective envelopes in C(O) are duals of injective envelopes in Mod^{l.adm}_{G,ζ}(O) (R30.2/smooth-torsion-categories).

**Checks.**

- `GL2Qp.pontryaginDual_trivial` (computation): (k)^∨ ≅ k with trivial action.
- `GL2Qp.pontryaginDual_zero` (degenerate): 0^∨ = 0.
- `GL2Qp.pontryaginDual_compactInduction_not_fg` (non-example): (c-Ind_{KZ}^G σ)^∨ is not finitely generated over O[[K]].
- `GL2Qp.pontryaginDual_dual` (characterisation): (π^∨)^∨ ≅ π naturally (Pontryagin biduality).

**Acceptance.**

- The dual of the trivial representation k is k.
- (c-Ind_{KZ}^G σ)^∨ is not finitely generated over O[[K]], matching non-admissibility.

**Sources.**

- PASKUNAS13, §2, p.14 (profinite augmented modules and O-linear Pontryagin duality): Gives the anti-equivalence with the contragredient action and the locally admissible dual subcategory.
- NAKAMURA23, Appendix B.3.2, p. 100 (arXiv): Uses C^ψ(O) and C(O), the Pontryagin duals of locally admissible representations with or without central character ψ.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.2/smooth-torsion-categories`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs`, `PadicMeasuresIwasawaAlgebras:L5`, `PadicLocalLanglandsForGL2Qp:R30.2/locally-admissible-finite-length`, `SelmerIwasawaCohomology:L2/pontryagin-dual`.

### Admissible unitary Banach representations of GL₂(ℚ_p)

**Target `R30.2/admissible-unitary-banach` (definition).** A unitary L-Banach representation Π of G is an L-Banach space with a continuous G-action admitting an open bounded G-stable O-lattice Θ; Π is admissible if Θ/ϖΘ is an admissible smooth k-representation (equivalently Θ^d = Hom^{cont}_O(Θ, O) is finitely generated over O[[K]], equivalently Π restricted to one, hence every, compact open subgroup is admissible in the sense of Schneider–Teitelbaum). Ban^{adm}_{G,ζ}(L) is the category of admissible unitary L-Banach representations with central character ζ; it is abelian, being anti-equivalent through Θ ↦ Θ^d ⊗ L to finitely generated L ⊗ O[[K]]-modules with compatible G-action. Π is residually of finite length if Θ/ϖΘ has finite length (independent of Θ, with Π̄^{ss} := (Θ/ϖΘ)^{ss} independent of Θ); Rep_L G (Colmez, CDP) is the full subcategory of Π with a central character and residually of finite length, Rep_{O_L}G the p-adically complete separated ϖ-torsion-free O[G]-modules Θ with Θ/ϖ^nΘ ∈ Rep^{tors}G. An absolutely irreducible Π is ordinary if it is a subquotient of a unitary parabolic induction (Ind_B^G η₁ ⊗ η₂)^{cont} of unitary characters. Residual finite length is an additional predicate on the reduction of an invariant lattice; equivalence of admissibility with residual finite length in the finite-length central-character category uses the correspondence, not the definition of an admissible Banach object.

**Hypotheses.**

- Coefficients L/ℚ_p finite; Π with central character for Ban^{adm}_{G,ζ}(L).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Banach`, namespace `TauCeti.GL2Qp`.

**Uses.**

- CDP 2014, Theorem 1.1: the bijection between absolutely irreducible non-ordinary objects and two-dimensional Galois representations
- CompletedCohomologyPartII CC.2 and CC.5: the arithmetic unitary Banach representations are objects of this category for GL₂(ℚ_p)
- Paškūnas 2013, Proposition 1.8: Ban^{adm}_{G,ζ}(L) decomposes into a direct sum over blocks

**API.**

- `GL2Qp.UnitaryBanachRep` (data): An L-Banach space with continuous G-action and an open bounded G-stable O-lattice.
- `GL2Qp.UnitaryBanachRep.IsAdmissible` (characterisation): Θ/ϖΘ admissible for an (equivalently every) open bounded G-stable lattice Θ.
- `GL2Qp.UnitaryBanachRep.isAdmissible_iff_fg` (characterisation): Π admissible iff Θ^d is finitely generated over O[[K]] (ND.6).
- `GL2Qp.UnitaryBanachRep.abelian` (instance): Ban^{adm}_{G,ζ}(L) is abelian.
- `GL2Qp.UnitaryBanachRep.IsResiduallyFiniteLength` (characterisation): Θ/ϖΘ has finite length.
- `GL2Qp.UnitaryBanachRep.residualSemisimplification` (projection): Π̄^{ss} := (Θ/ϖΘ)^{ss}, independent of Θ.
- `GL2Qp.UnitaryBanachRep.IsOrdinary` (characterisation): Absolutely irreducible and a subquotient of a unitary parabolic induction of unitary characters.
- `GL2Qp.UnitaryBanachRep.reduction` (functoriality): Θ ↦ Θ/ϖ^nΘ lands in Mod^{l.adm}_{G,ζ}(O/ϖ^n).

**Proof route.**

- Specialise LocallyAnalyticDistributionsPartII ND.6/banach-iwasawa-duality (Schneider–Teitelbaum Lemma 3.4 and Theorem 3.5 for the compact group K) and transport the G-action; independence of the compact open subgroup is the requested compact-open test (request to LocallyAnalyticDistributionsPartII ND.6).
- Θ/ϖΘ admissible ⇔ Θ^d/ϖ finitely generated over k[[K]] ⇔ Θ^d finitely generated over O[[K]] (topological Nakayama, R30.2/pontryagin-dual-category).
- Residual finite length and the independence of Π̄^{ss} from Θ: any two open bounded lattices are commensurable, and semisimplification of Θ/ϖ is a Brauer–Nesbitt type invariant (CDP §1.1).
- By CDP Corollary 1.6, an object of Ban^{adm}_G(L) has finite length iff it is residually of finite length (R30.3/cdp-correspondence).

**Checks.**

- `GL2Qp.UnitaryBanachRep.character_isAdmissible` (computation): A unitary character η∘det is a one-dimensional admissible unitary Banach representation, ordinary, with Π̄^{ss} = η̄∘det.
- `GL2Qp.UnitaryBanachRep.zero` (degenerate): The zero representation is admissible and residually of length 0.
- `GL2Qp.UnitaryBanachRep.not_unitary_of_central` (non-example): If Z acts by a character with |ζ(p)| ≠ 1 there is no bounded G-stable lattice.
- `GL2Qp.UnitaryBanachRep.compat_ND6` (compatibility): Restricted to K, Π is an admissible K-Banach representation in the sense of LocallyAnalyticDistributionsPartII ND.6, and Π ↦ Π′ matches ND.6's anti-equivalence.

**Acceptance.**

- The universal unitary completion of the smooth Steinberg is in Ban^{adm}_{G,1}(L).
- A continuous principal series induced from unitary characters is admissible and residually of finite length; every absolutely irreducible subquotient is ordinary.
- A representation with non-unitary central character is never unitary.

**Sources.**

- CDP14, §1.1, p. 1: Defines Ban^{adm}_G(L), lattices Θ with Θ ⊗ k admissible, residual finite length and Π̄^{ss}, ordinarity, and Rep_L(G).
- PASKUNAS13, §1.1, p. 3; §4: Defines Ban^{adm}_{G,ζ}(L) and Ban^{adm.fl}_{G,ζ}(L) and works with lattices whose reductions are in Mod^{l.fin}_{G,ζ}(O).
- COLMEZ10, Introduction §4, p. 8: Defines Rep_{O_L}G and Rep_L G through lattices with reductions in Rep^{tors}G.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.2/smooth-torsion-categories`, `PadicLocalLanglandsForGL2Qp:R30.2/pontryagin-dual-category`, `LocallyAnalyticDistributionsPartII:ND.6/banach-iwasawa-duality`, `LocallyAnalyticDistributionsPartII:ND.6`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs`, `mathlib:IsUltrametricDist`.

### Locally analytic and locally algebraic vectors of GL₂(ℚ_p)-representations

**Target `R30.2/analytic-and-algebraic-vectors` (definition).** For Π ∈ Ban^{adm}_G(L), v ∈ Π is locally analytic if g ↦ gv is a locally analytic function G → Π, and locally algebraic if g ↦ gv is locally a polynomial in a, b, c, d and (ad − bc)^{−1} with coefficients in Π. Π^{an} and Π^{alg} ⊂ Π^{an} are G-stable; Π^{an} is an admissible locally analytic representation, dense in Π, and Π ↦ Π^{an} is exact on Ban^{adm}_G(L) (Schneider–Teitelbaum), while Π^{alg} is zero in general. Π^{alg} = ⊕_W W ⊗ Hom_{𝔤}(W, Π)^{sm} over irreducible algebraic representations W = Sym^{k−1}L² ⊗ det^a (k ≥ 1, a ∈ ℤ); a representation is of type (ℓ, k) if only W_{ℓ,k} := Sym^{k−1} ⊗ det^ℓ occurs. Admissible locally analytic representations are the strong duals of coadmissible D(H, L)-modules for compact open H, with D(H, L) the Fréchet–Stein distribution algebra of LocallyAnalyticDistributionsPartII ND.1–ND.2.

**Hypotheses.**

- Π admissible unitary Banach; G = GL₂(ℚ_p) viewed as a locally ℚ_p-analytic group.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/AnalyticVectors`, namespace `TauCeti.GL2Qp`.

**Uses.**

- Colmez, Théorème 0.19: Π(D)^{an} is the image of D† ⊠ P¹
- Colmez, Théorème 0.20: Π(D)^{alg} ≠ 0 iff D is de Rham with distinct weights
- LocallyAnalyticCompletedCohomology LA.5 and LA.12: Π(V)^{la} and its Kirillov model

**API.**

- `GL2Qp.analyticVectors` (constructor): Π^{an}, a G-stable subspace with its locally convex inductive-limit topology.
- `GL2Qp.algebraicVectors` (constructor): Π^{alg} ⊂ Π^{an}.
- `GL2Qp.analyticVectors_dense` (characterisation): Π^{an} is dense in Π for Π ∈ Ban^{adm}_G(L).
- `GL2Qp.analyticVectors_exact` (functoriality): Π ↦ Π^{an} is exact on Ban^{adm}_G(L).
- `GL2Qp.algebraicVectors_decomposition` (characterisation): Π^{alg} = ⊕_W W ⊗ Hom_𝔤(W, Π)^{sm}.
- `GL2Qp.algebraicType` (data): W_{ℓ,k} = Sym^{k−1}L² ⊗ det^ℓ.

**Proof route.**

- Specialise the general theory of admissible locally analytic representations and of the functor Π ↦ Π^{an} (Schneider–Teitelbaum, requested from LocallyAnalyticDistributionsPartII ND.2) to G.
- Density and exactness of Π ↦ Π^{an}: from Fréchet–Stein flatness of D(H, L) over L ⊗ O[[H]] (ND.2/faithful-flatness) applied to the finitely generated dual of Π.
- Decomposition of Π^{alg}: an algebraic vector generates a finite-dimensional 𝔤-module, decomposed into irreducible algebraic representations; the multiplicity spaces are smooth (Colmez Proposition VI.2.4).

**Checks.**

- `GL2Qp.algebraicVectors_character` (computation): For Π = η∘det with η unitary and locally algebraic, Π^{alg} = Π.
- `GL2Qp.analyticVectors_zero` (degenerate): 0^{an} = 0^{alg} = 0.
- `GL2Qp.algebraicVectors_principalSeries_nonalgebraic` (non-example): If δ₁δ₂^{−1} is not locally algebraic, (Ind_B^G δ₁ ⊗ δ₂)^{cont} has no nonzero locally algebraic vector although its locally analytic vectors are dense.
- `GL2Qp.algebraicVectors_le_analytic` (characterisation): Π^{alg} ⊂ Π^{an}.

**Acceptance.**

- For Π = W finite-dimensional algebraic and unitary (only when W is a character), Π^{alg} = Π.
- Π^{alg} ⊂ Π^{an} ⊂ Π.
- For a unitary principal series (Ind_B^G δ₁ ⊗ δ₂)^{cont} with δ₁δ₂^{−1} not locally algebraic, Π^{alg} = 0.

**Sources.**

- COLMEZ10, Introduction §10–§11, pp. 16–17; §VI.2.1–VI.2.2, Proposition VI.2.4, p. 142: Defines locally analytic and locally algebraic vectors, recalls that Π^{an} is never zero by Schneider–Teitelbaum while Π^{alg} is zero in general, and decomposes Π^{alg} by algebraic types.
- CD14, §0.1, pp. 3–4: Uses Π^{an} for Π ∈ Rep_L(G) and Emerton's notion of universal unitary completion.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.2/admissible-unitary-banach`, `LocallyAnalyticDistributionsPartII:ND.1/distribution-algebra`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-module`, `LocallyAnalyticDistributionsPartII:ND.2/faithful-flatness`, `LocallyAnalyticDistributionsPartII:ND.2`.

### Universal unitary completions

**Target `R30.2/universal-unitary-completion` (construction).** For a locally convex L-representation W of G, a universal unitary completion is a unitary Banach G-representation Ŵ with continuous map ι:W→Ŵ such that every continuous G-map from W into a unitary Banach representation factors uniquely through ι. Existence is not assumed for arbitrary W. For a locally algebraic representation with a minimal open G-stable lattice Θ generated by finitely many G-orbits, its separated ϖ-adic completion, tensored with L, has this universal property. For Π in the admissible finite-length unitary category with central character, the universal unitary completion of Π^{an} is Π. The coherent-lattice criterion used for this last assertion is Colmez–Dospinescu Proposition 0.6 and Theorem 0.7.

**Hypotheses.**

- W locally convex with continuous G-action; for the existence statement a finitely generated G-stable lattice.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Banach`, namespace `TauCeti.GL2Qp`.

**Uses.**

- CDN 2020, Corollaire 2.13: Π(V)\* is the G-bounded part of (Π(V)^{an})\*
- Berger–Breuil, Introduction: B(V) is the completion of Alg(V) ⊗ Lisse(V)
- CDP 2014, Theorem 1.3: unitary completions of π ⊗ W are classified

**API.**

- `GL2Qp.universalUnitaryCompletion` (constructor): The separated completion of a minimal open invariant O-lattice generated by finitely many G-orbits, with W locally algebraic; not an existence theorem for every locally convex W.
- `GL2Qp.universalUnitaryCompletion.ι` (data): The continuous G-map W → Ŵ.
- `GL2Qp.universalUnitaryCompletion.lift` (universal-property): Every continuous G-map W → B to unitary Banach B factors uniquely through ι.
- `GL2Qp.universalUnitaryCompletion.lift_comp` (simp): lift(f) ∘ ι = f.
- `GL2Qp.universalUnitaryCompletion.of_analyticVectors` (characterisation): For Π ∈ Rep_L(G), Π is the universal completion of Π^{an} (Colmez–Dospinescu).

**Proof route.**

- For a minimal open invariant lattice, every map into a unitary Banach target sends it into a bounded lattice after scaling. Extend to the separated completion and prove uniqueness by density.
- For analytic vectors use the coherent-lattice result, Proposition 0.6 and Theorem 0.7 of Colmez–Dospinescu, followed by Theorem 0.2. This nonroutine input remains explicitly recorded in G7.

**Checks.**

- `GL2Qp.universalUnitaryCompletion_trivial` (computation): The universal unitary completion of the trivial representation L is L.
- `GL2Qp.universalUnitaryCompletion_zero` (degenerate): The universal completion of 0 is 0.
- `GL2Qp.universalUnitaryCompletion_nonunitary_central` (non-example): If Z acts on W by a non-unitary character, every map to a unitary Banach representation is zero, so Ŵ = 0 although W ≠ 0.
- `GL2Qp.universalUnitaryCompletion_analytic` (characterisation): For Π ∈ Rep_L(G), Hom_G(Π, B) → Hom_G(Π^{an}, B) is a bijection for every unitary B.

**Acceptance.**

- The universal completion of the trivial representation is L.
- For Π ∈ Rep_L(G), (Π^{an})^ ≅ Π (Colmez–Dospinescu).

**Sources.**

- CD14, Introduction, Theorem 0.2, Proposition 0.6, Theorem 0.7, pp.3,5–6: Proves universal completion of analytic vectors via coherent lattices, rather than a criterion asserting completion for every locally convex representation.
- BB10, Introduction, p. 2: Defines B(V) as the p-adic completion of Alg(V) ⊗ Lisse(V) with respect to a G-stable lattice, i.e. a universal unitary completion of the locally algebraic representation.
- CDN20, Proposition 2.9, p. 22; Corollaire 2.13 and its proof, p. 24 (arXiv): Identifies W_{M,ℒ} with (Π(V_{M,ℒ})^{an})\* and deduces Hom_{G_{ℚ_p}}(V_{M,ℒ}, H¹_et) ≅ Π(V_{M,ℒ})\* by taking G-bounded vectors, using that Π(V) is the universal completion of Π(V)^{an} (Colmez–Dospinescu, Théorème VII.11).

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.2/admissible-unitary-banach`, `PadicLocalLanglandsForGL2Qp:R30.2/analytic-and-algebraic-vectors`.

### Mod p principal series and Steinberg representations

**Target `R30.2/modp-principal-series` (definition).** For smooth characters δ₁, δ₂ : ℚ_p^× → k^× write δ₁ ⊗ δ₂ for the character (a b; 0 d) ↦ δ₁(a)δ₂(d) of B and Ind_B^G for smooth induction (locally constant φ : G → k with φ(bg) = (δ₁ ⊗ δ₂)(b)φ(g), G acting by right translation). Colmez's normalisation is B(δ₁, δ₂) := Ind_B^G(δ₂ ⊗ δ₁ω^{−1}), an object of Rep^{tors}G with central character ω^{−1}δ₁δ₂, irreducible unless δ₁ = ωδ, δ₂ = δ for some δ, in which case it is a non-split extension of St ⊗ (δ∘det) by δ∘det, St being the Steinberg representation Ind_B^G(1)/1. Paškūnas and CDP use π{χ₁, χ₂} := (Ind_B^G χ₁ ⊗ χ₂ω^{−1})^{ss} ⊕ (Ind_B^G χ₂ ⊗ χ₁ω^{−1})^{ss}, of length 2 in general, 3 or 4 for the exceptional pairs, and CDN write I(χ₁, χ₂) for the irreducible principal series attached to (χ₁, χ₂).

**Hypotheses.**

- δ₁, δ₂ smooth characters with values in k^× (after enlarging k).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/PrincipalSeries`, namespace `TauCeti.GL2Qp`.

**Uses.**

- Colmez, Théorème 0.10(iii): V(B(δ₁, δ₂)) = k_L(δ₁)
- Paškūnas 2013, blocks (ii)–(iv): blocks are formed from principal series constituents
- CDN 2023, Proposition 1.10: blocks {I(χ₁, χ₂), I(χ₂, χ₁)}

**API.**

- `GL2Qp.principalSeries` (constructor): Ind_B^G(δ₁ ⊗ δ₂) as a smooth k-representation.
- `GL2Qp.colmezPrincipalSeries` (constructor): B(δ₁, δ₂) = Ind_B^G(δ₂ ⊗ δ₁ω^{−1}).
- `GL2Qp.steinberg` (constructor): St = Ind_B^G(1 ⊗ 1)/1.
- `GL2Qp.principalSeries_centralChar` (simp): Z acts on Ind_B^G(δ₁ ⊗ δ₂) by δ₁δ₂.
- `GL2Qp.principalSeries_irreducible_iff` (characterisation): Ind_B^G(δ₁ ⊗ δ₂) is irreducible iff δ₁ ≠ δ₂.
- `GL2Qp.principalSeries_twist` (functoriality): Ind_B^G(δ₁ ⊗ δ₂) ⊗ (η∘det) ≅ Ind_B^G(δ₁η ⊗ δ₂η).

**Proof route.**

- Barthel–Livné: Ind_B^G(χ₁ ⊗ χ₂) is irreducible iff χ₁ ≠ χ₂, and Ind_B^G(χ ⊗ χ) is a non-split extension of St ⊗ χ by χ∘det (FiniteFlat R07.5 and Colmez Proposition III.3.7).
- The central character of Ind_B^G(δ₂ ⊗ δ₁ω^{−1}) is δ₂·δ₁ω^{−1} restricted to scalars.
- Intertwinings between Jordan–Hölder constituents of different principal series do not occur unless the parameters agree (Colmez Proposition III.3.5(ii)).

**Checks.**

- `GL2Qp.colmezPrincipalSeries_centralChar` (computation): B(δ₁, δ₂) has central character ω^{−1}δ₁δ₂.
- `GL2Qp.principalSeries_trivial_reducible` (degenerate): Ind_B^G(1 ⊗ 1) is reducible, with sub the trivial character and quotient St.
- `GL2Qp.steinberg_not_character` (non-example): St is infinite-dimensional, so it is not of the form χ∘det.
- `GL2Qp.principalSeries_dim_invariants` (computation): dim_k Ind_B^G(δ₁ ⊗ δ₂)^{I₁} = 2.

**Acceptance.**

- B(δ₁, δ₂) has central character ω^{−1}δ₁δ₂.
- B(ω, 1) is reducible: an extension of St by the trivial character.
- π{χ, χ} = (Ind_B^G χ ⊗ χω^{−1})^{⊕2,ss}.

**Sources.**

- COLMEZ10, Introduction §7, p. 13; §III.3.3–III.3.4, Proposition III.3.7, p. 87: Defines B(δ₁, δ₂) = Ind_B^G δ₂ ⊗ δ₁ω^{−1}, an object of Rep^{tors}G with central character ω^{−1}δ₁δ₂, irreducible unless δ₁ = ωδ, δ₂ = δ, when it is an extension of St ⊗ (δ∘det) by δ∘det.
- CDP14, §1.2, p. 3: Defines π{χ₁, χ₂} as the sum of the semisimplifications of the two principal series and notes its length is 2, 3 or 4.
- CDNKISIN, §1.1, Remarque 1.1, p. 4: Describes B(χε^{r+1}μ_T, χμ_{T^{−1}}) and compares its semisimplification with Barthel–Livné quotients, including the reversed extension for r = p−1, λ = ±1.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.1/character-dictionary`, `PadicLocalLanglandsForGL2Qp:R30.2/smooth-torsion-categories`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/serre-weights-compact-induction`, `SmoothRepresentationsOfLocalGroups:SR.2`.

### Classification of irreducible mod p representations of GL₂(ℚ_p)

**Target `R30.2/modp-irreducibles` (theorem).** Over a sufficiently large finite field k of characteristic p, put σ_r=Sym^r k² (0≤r≤p−1), extend σ_r to KZ with p acting trivially, and define Π(r,λ,χ)=(c-Ind_{KZ}^G σ_r)/(T−λ) ⊗ (χ∘det). Thus the central scalar p acts on the twist as χ(p)². The representation is irreducible except when λ=±1 and r∈{0,p−1}. Writing η=χμ_λ, the exceptional nonsplit sequences are 0→St⊗(η∘det)→Π(0,λ,χ)→η∘det→0 and 0→η∘det→Π(p−1,λ,χ)→St⊗(η∘det)→0. The absolutely irreducible smooth representations are characters, Steinberg twists, irreducible principal series Ind_B^G(χ₁⊗χ₂) with χ₁≠χ₂, and supersingular Π(r,0,χ). Every absolutely irreducible is a constituent of a Hecke quotient. Supersingular isomorphisms are generated by changing χ to χμ_{−1} and (r,χ) to (p−1−r,χω^r); they have no principal-series constituents. Over an algebraic closure irreducibles have a central character, are admissible and finitely presented, and descend to a finite field. Irreducibles over k are obtained by Galois descent.

**Hypotheses.**

- F = ℚ_p: the irreducibility of I(σ)/(T) (Breuil) and finite presentation of supersingulars fail for F ≠ ℚ_p (R30.2/no-correspondence-beyond-qp).

**Proof route.**

- Barthel–Livné: End_G(I(σ)) ≅ k[T], I(σ) free over k[T], every irreducible with central character is a quotient of some I(σ)/(T − λ), and the λ ≠ 0 quotients are principal series or their constituents (FiniteFlat R07.5).
- Breuil: I(σ)/(T) is irreducible for F = ℚ_p (Breuil 2003, Théorème 1.1, via Corollaires 4.1.1 and 4.1.4) and the isomorphisms between them (Théorème 1.3).
- Colmez Théorème III.3.2 and Proposition III.3.5 package (i)–(iii) in the notation Π(r, λ, χ).
- (iv): Berger's central character theorem; admissibility and finite presentation of ordinary and supersingular irreducibles (CDN 2023 §1.2.3); Galois descent of irreducibles (CDN 2023 Lemma 1.7).
- Use the orientations of Kisin (1.2.2); Colmez III.3.2 and CDN–Kisin Remark 1.1 reverse them (source issues E5–E6). At r=0, λ=1, χ=1, augmentation gives the character quotient, a direct check on the orientation.

**Acceptance.**

- The number of isomorphism classes of supersingular representations of GL₂(ℚ_p) over 𝔽̄_p with a fixed central character is finite, and over 𝔽̄_p they are in bijection with irreducible two-dimensional Galois representations with the matching determinant (Breuil Corollaire 1.4; R30.3/montreal-on-irreducibles).
- For p = 2, Π(0, 0, χ) ≅ Π(1, 0, χ) (take r = 0, p−1−r = 1 and ω trivial).
- Π(0,1,1) is reducible with Steinberg submodule and trivial-character quotient; augmentation detects the quotient.

**Sources.**

- COLMEZ10, §III.3.1, Théorème III.3.2 and Proposition III.3.5, pp. 85–86: Defines W_{r,χ} and Π(r, λ, χ), states that Π(r, λ, χ) is irreducible except for r ∈ {0, p−1} and λ = ±1, that every absolutely irreducible representation is a constituent of some Π(r, λ, χ), and lists the only intertwinings between supersingulars.
- BREUIL03, Théorème 1.1, p. 3; Théorème 1.3, p. 3; Corollaires 4.1.1 and 4.1.4, pp. 17–20: Proves that (c-Ind_{KZ}^G Sym^r)/(T) is irreducible for 0 ≤ r ≤ p−1 and determines the isomorphisms between these supersingular representations.
- CDNKISIN, §1.1, Proposition 1.2, p. 4: Lists the absolutely irreducible smooth k_L-representations of GL₂(ℚ_p) as characters, twists of the Steinberg, irreducible principal series and the supersingular quotients Π_{r,χ,P}.
- CDN23, §1.2.1–1.2.3 and Lemme 1.7, pp. 14–16: Gives the Barthel–Livné list, Breuil's and Berger's theorems, admissibility and finite presentation of irreducibles, and the Galois-orbit description of irreducibles over k_L.
- KISIN09, §1.2, (1.2.2), published p.648: Gives the nonsplit exceptional Hecke-quotient sequences with Steinberg submodule at r=0 and character submodule at r=p−1.

**Needs:** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/serre-weights-compact-induction`, `PadicLocalLanglandsForGL2Qp:R30.2/modp-principal-series`, `PadicLocalLanglandsForGL2Qp:R30.2/smooth-torsion-categories`.

### Irreducible mod ℓ representations of GL₂(ℤ_ℓ), U₀(ℓ) and Ũ₀(ℓ)

**Target `R30.2/mod-l-compact-irreducibles` (theorem).** Let ℓ be prime, U₀(ℓ)⊂GL₂(ℤ_ℓ) have lower-left entry divisible by ℓ, and Ũ₀(ℓ) be its full normaliser in GL₂(ℚ_ℓ). It is generated by U₀(ℓ) and w_ℓ=(0 −1;ℓ 0), with w_ℓ²=−ℓ·1. Over an algebraic closure of 𝔽_ℓ, irreducible continuous representations of GL₂(ℤ_ℓ) are σ_{n,m}=Sym^n k²⊗det^m for 0≤n≤ℓ−1 and m modulo ℓ−1; those of U₀(ℓ) are the characters (a b;ℓc d)↦ā^{m₁}d̄^{m₂}. For unequal m₁,m₂, the normaliser exchanges these characters and its irreducibles are two-dimensional, indexed by the unordered pair and a∈k^× specifying the scalar action of −ℓ. For equal exponents, the irreducibles are one-dimensional extensions, indexed by the value a∈k^× of w_ℓ. No quotient by ℓ^ℤ or condition that ℓ acts trivially is imposed.

**Hypotheses.**

- ℓ prime; smooth representations over an algebraic closure of 𝔽_ℓ with the discrete coefficient topology. The normaliser is the full locally compact group, with no trivial-central-scalar restriction.

**Proof route.**

- The pro-ℓ congruence kernel acts trivially on irreducible smooth characteristic-ℓ modules. Apply the finite GL₂(𝔽_ℓ) classification and the diagonal quotient of the Iwahori.
- For the normaliser use w_ℓ²=−ℓ and Clifford theory: distinct characters form a two-element orbit, while equal characters extend in dimension one. The scalar parameters record the noncompact central subgroup, as in BCDT §1.3.

**Acceptance.**

- There are ℓ(ℓ−1) isomorphism classes in (i).
- σ_{0,m} = det^m is one-dimensional; σ_{ℓ−1,0} has dimension ℓ.

**Sources.**

- BCDT01, §1.3, p. 854 (published pagination): Lists σ_{n,m}, the characters σ'_{m₁,m₂} of U₀(ℓ), and the representations σ'_{{m₁,m₂},a} and σ'_{{m},a} of Ũ₀(ℓ) as all the irreducible 𝔽̄_ℓ-representations of these groups.

**Needs:** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/serre-weights-compact-induction`, `PadicLocalLanglandsForGL2Qp:R30.1/gl2qp-subgroups`.

### What fails for GL₂(F) with F ≠ ℚ_p

**Target `R30.2/no-correspondence-beyond-qp` (comparison).** For a finite extension F ≠ ℚ_p of ℚ_p, the mod p theory of GL₂(F) differs from that of GL₂(ℚ_p) in ways that block the constructions of this roadmap: (i) supersingular representations of GL₂(F) over 𝔽̄_p are not finitely presented (Schraen, Wu); (ii) for F = ℚ_{p³} there are smooth irreducible k_L-representations of GL₂(F) that are not admissible, and a supersingular 𝔽_{p³}-representation with End = 𝔽̄_p which is not absolutely irreducible over any finite extension (Le); (iii) the quotients I(σ)/(T) are not irreducible and supersingular representations are not classified. Consequently nothing in this roadmap asserts a p-adic or mod p correspondence for GL₂(F), F ≠ ℚ_p: every theorem is stated for G = GL₂(ℚ_p).

**Hypotheses.**

- F/ℚ_p finite, F ≠ ℚ_p.

**Proof route.**

- (i) is CDN 2023 Théorème 1.27, citing Schraen and Wu; (ii) is CDN 2023 Remarques 1.8 and 1.28, citing Le; (iii) is the CDN 2023 §1.2.1 description, which leaves supersingulars of GL₂(F) unclassified.
- Colmez's Remarque 0.8(iii) records that standard presentations, which the construction of D(Π) needs, are expected to fail for GL₂(F), F ≠ ℚ_p.

**Acceptance.**

- The roadmap's statements carry the hypothesis F = ℚ_p wherever they use R30.2/modp-irreducibles, R30.3/montreal-functor or R30.5/blocks.

**Sources.**

- CDN23, §1.2.1, pp. 14–15; Remarque 1.8, p. 16; Théorème 1.27 and Remarque 1.28, p. 25: For F ≠ ℚ_p the supersingular representations are not finitely presented (Schraen, Wu); Le constructed irreducible non-admissible representations of GL₂(ℚ_{p³}) and a supersingular with End = 𝔽̄_p that is not absolutely irreducible.
- COLMEZ10, Remarque 0.8(iii), p. 12: Breuil–Paškūnas suggest that the existence of standard presentations fails in characteristic p for GL₂ of a nontrivial extension of ℚ_p.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.2/modp-irreducibles`.

### Local admissibility and finite length for GL₂(ℚ_p)

**Target `R30.2/locally-admissible-finite-length` (theorem).** For smooth O-torsion representations of GL₂(ℚ_p) with fixed central character, local admissibility is equivalent to local finite length as an O[G]-module. In particular a finitely generated admissible object has finite O[G]-length. The locally admissible category is abelian, and the locally admissible fixed-central-character category has injective envelopes.

**Hypotheses.**

- p prime; O finite over ℤ_p; fixed continuous central character; smooth discrete O-torsion objects.

**Proof route.**

- Use the GL₂(ℚ_p) finiteness theorem quoted by Paškūnas, not a formal consequence of being Grothendieck abelian.
- Combine finite-length admissibility from the mod-p classification with the finitely generated admissible finite-length theorem; apply the locally admissible injective-envelope result of §2. These representation-specific inputs are recorded in G6.

**Acceptance.**

- Finite length means length over O[G], never finite length over O.
- The infinite-dimensional Steinberg representation is admissible and has O[G]-length one.

**Sources.**

- PASKUNAS13, §2, pp.14–15, including the invocation of Emerton Theorem 2.3.8: States the local finite-length and locally admissible category identification and its dual category.
- TUNG21A, §1.1, p.4: Defines torsion-level admissibility and recalls the finite-length property for finitely generated admissible objects.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.2/smooth-torsion-categories`, `PadicLocalLanglandsForGL2Qp:R30.2/modp-irreducibles`.

This key target was added by the independent review.

**Remaining work for this layer.**

- LocallyAnalyticDistributionsPartII ND.6 to add the compact-open admissibility test requested here (red-team finding RT-AREA-automorphic-1/17).
- LocallyAnalyticDistributionsPartII ND.2 to plan admissible locally analytic representations and the functor Π ↦ Π^an requested here.
- G5. Scalar and topological adapters for measures and O-linear duality
- G6. Representation-specific finiteness and envelopes
- G7. Coherent lattices and universal analytic completion

## R30.3. Colmez’s correspondence and its analytic construction

**Planets:** The G-module D ⊠_δ ℙ¹, Colmez's Montreal functor, Semisimple mod p correspondence, Colmez's correspondence V ↦ Π(V), Colmez's theorem V(Π(V)) = V, p-adic local Langlands correspondence for GL₂(ℚ_p).

### The G-module D ⊠_δ ℙ¹

**Target `R30.3/boxtimes-p1` (construction).** Let D be an étale (φ,Γ)-module over O_E (torsion or free) or over E, and δ : ℚ_p^× → O_L^× a continuous unitary character. On D ⊠ ℤ_p^× = D^{ψ=0} there is an involution w_δ, the limit of Σ_{i ∈ ℤ_p^× mod p^n} δ(i^{−1})(1+T)^i σ_{−i^2}(φ^nψ^n((1+T)^{−i^{−1}}z)). Put D ⊠_δ ℙ¹ = {z = (z₁, z₂) ∈ D × D : Res_{ℤ_p^×}(z₂) = w_δ(Res_{ℤ_p^×}(z₁))}. There is a unique action of G on D ⊠_δ ℙ¹ such that Res_U(g·z) = H_g(Res_{g^{−1}U ∩ ℤ_p}(z₁)) + H_{gw}(Res_{(gw)^{−1}U ∩ pℤ_p}(z₂)) for every compact open U ⊂ ℚ_p, with the explicit skeleton: w(z₁, z₂) = (z₂, z₁); (a 0; 0 a) acts by δ(a); (a 0; 0 1), a ∈ ℤ_p^×, by ((a 0; 0 1)z₁, δ(a)(a^{−1} 0; 0 1)z₂); and the formulas for (p 0; 0 1) and (1 b; 0 1), b ∈ pℤ_p. Restrictions Res_U : D ⊠_δ ℙ¹ → D ⊠ U and Res_{ℚ_p} : D ⊠_δ ℙ¹ → D ⊠_δ ℚ_p are G- resp. B-compatible; Res_{ℤ_p}z = z₁ and Res_{ℤ_p}(w·z) = z₂. For D⁰(ℤ_p) = E^♮ the construction is the dual B(δ)\* of the space of continuous φ on ℚ_p with x ↦ δ(x)φ(1/x) continuous at 0, with g·φ = φ ⋆ g^{−1}, (φ ⋆ (a b; c d))(x) = δ(cx+d)φ((ax+b)/(cx+d)). Twisting: (D ⊠_δ ℙ¹) ⊗ (η∘det) ≅ (D ⊗ η) ⊠_{δη²} ℙ¹, and there is a perfect G-equivariant pairing { , }_{ℙ¹} between Ď ⊠_{δ^{−1}} ℙ¹ and D ⊠_δ ℙ¹. The pairing takes values in O_L, L, or L/O_L with the matching integral, rational, or torsion topology, as in R30.1/tate-dual.

**Hypotheses.**

- D étale; δ unitary continuous; the construction is analytic in (D, δ) over S ⊗̂ O_E for S a quotient of O_L[[X₁,…,X_d]] (Remarque 0.18(iv)).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/BoxtimesP1`, namespace `TauCeti.BoxtimesP1`.

**Uses.**

- Colmez, Théorème 0.17: Π(D) = (D ⊠ ℙ¹)/(D^♮ ⊠ ℙ¹)
- Colmez, Théorème 0.13: β_{ℙ¹} : Π^∨ → D ⊠_δ ℙ¹ is injective and G-equivariant
- Colmez–Dospinescu, Théorème 0.8: Π_δ(D) and the sequence 0 → Π_{δ^{−1}}(Ď)\* → D ⊠_δ ℙ¹ → Π_δ(D) → 0

**API.**

- `BoxtimesP1` (constructor): D ⊠_δ ℙ¹ for étale D and unitary δ.
- `BoxtimesP1.wDelta` (data): The involution w_δ of D^{ψ=0}.
- `BoxtimesP1.action` (instance): The unique continuous G-action characterised by the Res_U formula.
- `BoxtimesP1.res` (projection): Res_U : D ⊠_δ ℙ¹ → D ⊠ U and Res_{ℚ_p} to D ⊠_δ ℚ_p.
- `BoxtimesP1.res_Zp_w` (simp): Res_{ℤ_p}(z) = z₁ and Res_{ℤ_p}(w·z) = z₂.
- `BoxtimesP1.central` (simp): (a 0; 0 a)·z = δ(a)z.
- `BoxtimesP1.twist` (functoriality): (D ⊠_δ ℙ¹) ⊗ (η∘det) ≅ (D ⊗ η) ⊠_{δη²} ℙ¹.
- `BoxtimesP1.pairing` (relation): The continuous G-equivariant perfect pairing on the two glued modules, into the coefficient-dependent residue-duality target of R30.1/tate-dual.
- `BoxtimesP1.measures` (compatibility): For D = E^♮ (measures), D ⊠_δ ℙ¹ ≅ B(δ)\* G-equivariantly.

**Proof route.**

- Define w_δ on D^{ψ=0} by the limit formula; convergence and the involution property are Colmez's Lemme II.1.2 and Remarque II.1.3.
- Define the action of the generators by the skeleton formulas and prove uniqueness and existence of the G-action from the Res_U formula (Colmez Théorème II.1.4, p. 47), using P(ℚ_p), Z and w generating G (R30.1/gl2qp-subgroups) and the P(ℚ_p)-module D ⊠ ℚ_p (R30.1/boxtimes-qp).
- The measure case: the restriction maps to ℤ_p and to w·ℤ_p identify B(δ)\* with D⁰(ℤ_p) ⊠_δ ℙ¹, the pairs (μ₁, μ₂) with Res_{ℤ_p^×}μ₂ = w_δ(Res_{ℤ_p^×}μ₁) (Colmez §5, p. 10).
- Twisting (Colmez §II.1.3) and the pairing (Théorème II.1.13) from the residue pairing on Ď × D (R30.1/tate-dual).

**Checks.**

- `BoxtimesP1.w_swap` (computation): w·(z₁, z₂) = (z₂, z₁).
- `BoxtimesP1.zero` (degenerate): 0 ⊠_δ ℙ¹ = 0.
- `BoxtimesP1.measures_dirac` (compatibility): For D = E^♮, if z ∈ D ⊠_δ ℙ¹ corresponds to μ ∈ B(δ)\*, then g·z corresponds to the functional φ ↦ μ(φ ⋆ g), the transpose of the action g·φ = φ ⋆ g^{−1} on B(δ).
- `BoxtimesP1.not_split` (non-example): For general δ the extension of a Banach space by the dual of a Banach space underlying D ⊠_δ ℙ¹ is not G-equivariantly split: for D irreducible of rank 2 and δ = δ_D it is the non-split sequence of R30.3/colmez-correspondence.

**Acceptance.**

- The centre acts through δ.
- Res_{ℤ_p} and Res_{ℤ_p}∘w recover (z₁, z₂).
- { , }_{ℙ¹} is perfect and G-equivariant.

**Sources.**

- COLMEZ10, Introduction §5, pp. 9–11 and Théorème 0.6, p. 11: Constructs w_δ on D ⊠ ℤ_p^×, the module D ⊠_δ ℙ¹ of compatible pairs, the skeleton of the G-action, and states that the formulas define an action of G; the measure case recovers the dual of B(δ).
- COLMEZ10, §II.1, Théorème II.1.4, p. 47; Théorème II.1.13, p. 53: Proves the unique G-action characterised by the Res_U formula and the perfectness and G-equivariance of the pairing { , }_{ℙ¹}.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.1/boxtimes-qp`, `PadicLocalLanglandsForGL2Qp:R30.1/psi-and-treillis`, `PadicLocalLanglandsForGL2Qp:R30.1/tate-dual`, `PadicLocalLanglandsForGL2Qp:R30.1/gl2qp-subgroups`, `PadicLocalLanglandsForGL2Qp:R30.1/character-dictionary`.

### Colmez's Montreal functor Π ↦ D(Π), V(Π)

**Target `R30.3/montreal-functor` (construction).** For Π ∈ Rep^{tors}G choose a finite length K-stable W ⊂ Π that gives a standard presentation (W(Π) ≠ ∅; Π = I(W)/R(W, Π) is a standard presentation, which exists for every Π, Colmez Théorème III.3.1). Let I^Π_{ℤ_p}(W) be the O_L-span of the (p^n a; 0 1)·W with a + p^nℤ_p ⊂ ℤ_p, D^♮_W(Π) its Pontryagin dual (a quotient of Π^∨), and D⁺_W(Π) ⊂ Π^∨ the μ vanishing on (p^n a; 0 1)·W for a + p^nℤ_p ⊄ ℤ_p. These are Γ-modules over O_E⁺ (T acting by (1 1; 0 1) − 1, σ_a by (a 0; 0 1)), D⁺_W(Π) is a (φ,Γ)-module over O_E⁺ with φ = (p 0; 0 1), and D(Π) := O_E ⊗ D⁺_W(Π) ≅ O_E ⊗ D^♮_W(Π) is independent of W, with β_{ℤ_p} : Π^∨ → D(Π). Then D is an exact contravariant functor Rep^{tors}G → ΦΓ^et_tors, extended to Rep_{O_L}G by inverse limits and to Rep_L G by ⊗ L. V(Π) := the Tate dual of V(D(Π)) defines an exact covariant functor Rep^{tors}G → Rep_tors G_{ℚ_p}, Rep_{O_L}G → Rep_{O_L}G_{ℚ_p}, Rep_L G → Rep_L G_{ℚ_p}, with V(Π ⊗ (δ∘det)) = V(Π) ⊗ δ, and V(Π) = MF(Π)(ε) for Emerton's normalisation MF. Paškūnas's variant on the dual category: V̌(M) := V(M^∨)^∨(ζε) for M ∈ C_{G,ζ}(O), extended to pseudo-compact objects by limits. Limits are taken in the profinite augmented dual category; their exactness requires its compact Mittag–Leffler input, not arbitrary inverse-limit exactness.

**Hypotheses.**

- Π ∈ Rep^{tors}G (smooth, admissible, finite length, central character) or a lattice / Banach representation residually in it.
- F = ℚ_p (standard presentations; R30.2/no-correspondence-beyond-qp).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Montreal`, namespace `TauCeti.MontrealFunctor`.

**Uses.**

- Colmez, Théorème 0.17(iii): D(Π(D)) = Ď, i.e. V(Π(V)) = V
- Paškūnas 2013, Theorem 1.1 and §5: V̌ of the projective envelope gives the universal deformation
- Paškūnas–Tung, Theorem 1.2: the compatibility of υ : R^{ps} → Z_B with V̌
- Nakamura 2023, Appendix B.3: MF and V̌ on deformations and on P̃

**API.**

- `MontrealFunctor.D` (constructor): D : Rep^{tors}G → ΦΓ^et_tors, contravariant.
- `MontrealFunctor.V` (constructor): V(Π) = Tate dual of V(D(Π)), covariant.
- `MontrealFunctor.D_exact` (functoriality): D is exact.
- `MontrealFunctor.V_exact` (functoriality): V is exact on Rep^{tors}G, Rep_{O_L}G and Rep_L G.
- `MontrealFunctor.V_twist` (simp): V(Π ⊗ (δ∘det)) = V(Π) ⊗ δ.
- `MontrealFunctor.beta` (data): β_{ℤ_p} : Π^∨ → D(Π), P(ℤ_p)-equivariant with β ∘ (p^{−1} 0; 0 1) = ψ ∘ β.
- `MontrealFunctor.V_eq_MF` (compatibility): V(Π) ≅ MF(Π)(ε).
- `MontrealFunctor.Vcheck` (constructor): V̌(M) = V(M^∨)^∨(ζε) on C_{G,ζ}(O), extended to pseudo-compact objects.
- `MontrealFunctor.V_limit` (functoriality): On Rep_{O_L}G, V(Θ) = lim V(Θ/ϖ^nΘ); on Rep_L G, V(Π) = L ⊗ V(Θ).

**Proof route.**

- Existence of standard presentations (Colmez Théorème III.3.1), reduced by dévissage to irreducibles via the classification R30.2/modp-irreducibles.
- Construction of D^♮_W, D⁺_W and their module structures (Colmez §IV.1, Proposition IV.1.11–IV.1.12: β ∘ (p^{−1} 0; 0 1) = ψ ∘ β).
- Finite length of D(Π) for irreducible Π: explicit computation of D^♮_{W_r}(Π(r, λ)) as k_E⁺ ⊕ k_E⁺ (λ = 0) or k_E⁺ ⊕ k_E⁺/T (λ ≠ 0) (Théorème IV.2.1); exactness by Proposition IV.2.12 and dévissage (Théorème IV.2.13).
- Passage to V and its exactness via Fontaine's equivalence (Théorème IV.2.14; R30.1/fontaine-functor-convention).
- Comparison with MF: Emerton defines MF(π) as the Pontryagin dual of V(D(π)) (lg §3.2 and footnote 6), Colmez as the Tate dual; they differ by ε.

**Checks.**

- `MontrealFunctor.V_character` (computation): V(δ∘det) = 0.
- `MontrealFunctor.V_zero` (degenerate): V(0) = 0.
- `MontrealFunctor.V_steinberg` (computation): V(St ⊗ (δ∘det)) = k_L(ωδ).
- `MontrealFunctor.V_not_faithful` (non-example): V is not faithful on Rep^{tors}G: it kills every finite-dimensional representation χ∘det.

**Acceptance.**

- V(χ∘det) = 0 (Théorème 0.10(i)).
- V is exact: a short exact sequence in Rep^{tors}G gives a short exact sequence of Galois representations.
- V(Π ⊗ (δ∘det)) = V(Π) ⊗ δ.

**Sources.**

- COLMEZ10, Introduction §6, Théorèmes 0.7 and 0.9, pp. 11–13; §IV.1–IV.2, Théorèmes IV.2.1, IV.2.13 and IV.2.14, pp. 97–103: Constructs D^♮_W(Π), D⁺_W(Π), D(Π) and β_{ℤ_p}, shows D is exact contravariant into ΦΓ^et_tors (the key point being finite length, via the computation for Π(r, λ)), extends D to Rep_{O_L}G and Rep_L G, and defines V(Π) as the Tate dual of V(D(Π)), an exact covariant functor with V(Π ⊗ δ) = V(Π) ⊗ δ.
- PASKUNAS13, §1, pp. 2–3; §5: Uses Colmez's exact covariant O-linear functor V on Mod^{fin}_{G,ζ}(O), extends it to Banach representations through lattices, and introduces V̌.
- EMERTON-LG, §3.2, pp. 19–20 and footnote 6: Defines MF(π) as the Pontryagin dual of the Galois representation of D(π), notes V carries an extra cyclotomic twist, and tabulates MF on irreducibles.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.2/smooth-torsion-categories`, `PadicLocalLanglandsForGL2Qp:R30.2/modp-irreducibles`, `PadicLocalLanglandsForGL2Qp:R30.2/admissible-unitary-banach`, `PadicLocalLanglandsForGL2Qp:R30.2/pontryagin-dual-category`, `PadicLocalLanglandsForGL2Qp:R30.1/fontaine-functor-convention`, `PadicLocalLanglandsForGL2Qp:R30.1/psi-and-treillis`, `PadicLocalLanglandsForGL2Qp:R30.1/boxtimes-qp`.

### The Montreal functor on irreducibles and the mod p correspondence

**Target `R30.3/montreal-on-irreducibles` (theorem).** (i) V(δ∘det) = 0; (ii) V(St ⊗ (δ∘det)) = k_L(ωδ); (iii) V(B(δ₁, δ₂)) = k_L(δ₁) for B(δ₁, δ₂) = Ind_B^G(δ₂ ⊗ δ₁ω^{−1}); (iv) for Π supersingular, V(Π) is irreducible of dimension 2 over k_L; precisely V(Π(r, 0, δ) ⊗ (−1)^{v_p(x)}) = V(r, δ), Colmez's irreducible atome galoisien. (v) (Breuil's semisimple mod p correspondence) there is a unique bijection between isomorphism classes of supersingular representations of GL₂(ℚ_p) over 𝔽̄_p and irreducible two-dimensional representations of G_{ℚ_p} over 𝔽̄_p with π(r, 0, χ) ↦ ρ(r, χ) = ind(ω₂^{r+1}) ⊗ χ, det ρ(r, χ) = ω^{r+1}χ², compatible with the isomorphisms π(r, 0, χ) ≅ π(r, 0, χμ_{−1}) ≅ π(p−1−r, 0, χω^r) on the left and the corresponding ones on the right; V realises it up to the normalising twists in (iv). (vi) If δ₁ ∉ {δ₂, ω^{±1}δ₂}, Ext¹_G(B(δ₂, δ₁), B(δ₁, δ₂)) is one-dimensional and V of a non-split extension is the non-split extension of k_L(δ₂) by k_L(δ₁).

**Hypotheses.**

- Coefficients k_L, after enlarging k_L if needed; F = ℚ_p.

**Proof route.**

- (i)–(iii): compute D(Π) for each irreducible from the explicit D^♮_{W_r}(Π(r, λ)) (Colmez Théorème IV.2.1) and the description of principal series (Proposition III.3.8).
- (iv): D(Π) is irreducible of rank 2 for supersingular Π and identified by the action of Γ on D^♮/T together with determinants (Colmez Proposition VII.4.2, with Proposition VII.3.4 and Corollaire VII.3.5 for D^♮(ind ω₂^{−r})).
- (v): Breuil's Corollaire 1.4, from his Théorèmes 1.1 and 1.3 and the matching isomorphisms between the ρ(r, χ).
- (vi): Colmez Théorème 0.11(i) and §VII.2.

**Acceptance.**

- V(B(1, 1)) = V(Ind_B^G(1 ⊗ ω^{−1})) = k_L.
- For every p, V of a supersingular Π is induced from a character of G_{ℚ_{p²}} (an ind(ω₂^s) up to twist).
- dim V(π) ≤ 2 for every irreducible π.

**Sources.**

- COLMEZ10, Théorème 0.10 and Théorème 0.11, p. 13; Proposition VII.4.2, p. 210; Propositions VII.3.3–VII.3.4, pp. 206–207: Théorèmes 0.10–0.11 compute V on characters, Steinberg twists and principal series, show that supersingulars give irreducible two-dimensional representations, and compute the extension groups between principal series; Proposition VII.4.2 identifies V(Π(r, 0, δ) ⊗ (−1)^{v_p}) with the atome galoisien V(r, δ), whose (φ,Γ)-module and treillis are computed in Propositions VII.3.3–VII.3.4.
- BREUIL03, Corollaire 1.4 and the paragraph before it, pp. 3–4: States the unique bijection π(r, 0, χ) ↔ ρ(r, χ) = ind(ω₂^{r+1}) ⊗ χ between supersingulars and irreducible two-dimensional mod p Galois representations, with det ρ(r, χ) = ω^{r+1}χ², normalised with uniformisers ↦ geometric Frobenii.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.3/montreal-functor`, `PadicLocalLanglandsForGL2Qp:R30.2/modp-irreducibles`, `PadicLocalLanglandsForGL2Qp:R30.2/modp-principal-series`.

### Reconstruction of Π from D(Π): β_{ℙ¹} and the contragredient

**Target `R30.3/contragredient` (theorem).** Let Π ∈ Rep^{tors}G have no finite quotient, central character δ_Π, D = D(Π) and δ = δ_Π^{−1}. (i) β_{ℚ_p} : Π^∨ → D ⊠_δ ℚ_p, μ ↦ (β_{ℤ_p}((p^n 0; 0 1)μ))_n, is B-equivariant with kernel (Π^∨)^U, image in D^♯ ⊠ ℚ_p containing D^♮ ⊠ ℚ_p, with image equal to D^♮ ⊠ ℚ_p when Π has no finite subrepresentation. (ii) β_{ℙ¹} : μ ↦ (β_{ℤ_p}(μ), β_{ℤ_p}(wμ)) is an injective G-equivariant map Π^∨ → D ⊠_δ ℙ¹ with Res_{ℚ_p} ∘ β_{ℙ¹} = β_{ℚ_p}, landing in {z : Res_{ℚ_p}z ∈ D^♯ ⊠_δ ℚ_p}; the subspace D^♮ ⊠_δ ℙ¹ = {z : Res_{ℚ_p}z ∈ D^♮ ⊠_δ ℚ_p} is a G-stable compact open containing the image of the orthogonal of Π^{SL₂(ℚ_p)} with finite index, and its dual agrees with Π in the quotient category by finite O_L-length representations, with the finite kernel and cokernel retained. (iii) The contragredient Π̌ := (D ⊠_δ ℙ¹)/β_{ℙ¹}(Π^∨) lies in Rep^{tors}G, has no finite quotient, and its contragredient is Π. Examples: B(δ₁, δ₂)ˇ ≅ B(δ₂, δ₁) ⊗ δ_Π^{−1}; Šť is a non-split extension of B(1, ω) by 1; Π̌ ≅ Π ⊗ δ_Π^{−1} for supersingular Π.

**Hypotheses.**

- Π ∈ Rep^{tors}G without finite quotient; F = ℚ_p.

**Proof route.**

- β_{ℚ_p}: Proposition 0.12 and §IV.3.1 (Lemme IV.3.1: the kernel of α_{ℤ_p,W} has finite length).
- The key identity β_{ℤ_p^×} ∘ w = w_δ ∘ β_{ℤ_p^×} (Proposition IV.4.2) gives that β_{ℙ¹} lands in D ⊠_δ ℙ¹ and is G-equivariant (Théorème IV.4.7).
- G-stability and duality of D^♮ ⊠_δ ℙ¹ (Théorème IV.4.1) and the contragredient statements (Théorème 0.14, §IV.4.5, Proposition IV.4.18).

**Acceptance.**

- For Π supersingular, Π̌ ≅ Π ⊗ δ_Π^{−1}.
- The contragredient of the contragredient is Π.

**Sources.**

- COLMEZ10, Proposition 0.12, Théorèmes 0.13 and 0.14, Exemples 0.15, p. 14; Théorème IV.4.1, p. 106; Proposition IV.4.2 and Théorème IV.4.7, pp. 107–110: Constructs β_{ℚ_p} and β_{ℙ¹}, proves β_{ℙ¹} is injective and G-equivariant into D ⊠_δ ℙ¹, that D^♮ ⊠_δ ℙ¹ is G-stable with dual equivalent to Π, defines the contragredient and shows it is an involution, with the principal series, Steinberg and supersingular examples.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.3/montreal-functor`, `PadicLocalLanglandsForGL2Qp:R30.3/boxtimes-p1`, `PadicLocalLanglandsForGL2Qp:R30.1/psi-and-treillis`, `PadicLocalLanglandsForGL2Qp:R30.2/modp-principal-series`.

### Colmez's representation Π(D) and the correspondence V ↦ Π(V)

**Target `R30.3/pi-of-D` (construction).** For a rank-two rational étale module D, let δ_D=(x|x|)^{-1}α_D. Choose an étale O_E-lattice D₀. The raw inverse image of D₀^♮ ⊠ ℚ_p in D₀ ⊠_{δ_D}ℙ¹ is denoted N_ns; set N_sat={z:ϖ^n z∈N_ns for some n}. The integral D₀^♮ ⊠ℙ¹ is N_sat, and the rational subspace D^♮ ⊠ℙ¹ is L·N_sat, independent of D₀. For torsion modules use the raw inverse image directly. When this submodule is G-stable, Π(D) is the corresponding quotient of D ⊠ℙ¹; Π(V)=Π(D(V)). The torsion submodule is compact open, the integral one is compact, and the rational one is closed; compact openness is not asserted rationally. Saturation may change the integral raw submodule by finite O_L-length and is needed for torsion-freeness of the quotient. Family construction and specialisation are the separate target R30.3/family-stability; arbitrary base change over Spec S is not asserted.

**Hypotheses.**

- D étale of rank 2 over E (or O_E, torsion); G-stability of D^♮ ⊠ ℙ¹ is the theorem R30.3/colmez-correspondence.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/PiOfD`, namespace `TauCeti.PiOfD`.

**Uses.**

- CDP 2014, Theorem 1.1: every absolutely irreducible non-ordinary Π is Π(V)
- Kisin 2009 (JAMS), Hypothesis (1.2.6): lattices in Π(V) with prescribed K-types
- CDN 2020, Proposition 2.9: Π(V) is compared with p-adic étale cohomology of the Drinfeld tower

**API.**

- `PiOfD` (constructor): Π(D) = (D ⊠ ℙ¹)/(D^♮ ⊠ ℙ¹) for D étale of rank 2.
- `PiOfD.ofRep` (constructor): Π(V) := Π(D(V)) for two-dimensional V.
- `PiOfD.centralChar` (simp): Z acts on Π(D) through δ_D = (x|x|)^{−1}α_D, i.e. Π(V) has central character det(V)·ε^{−1} read through R30.1/character-dictionary.
- `PiOfD.twist` (functoriality): Π(D ⊗ η) ≅ Π(D) ⊗ (η∘det) for unitary η.
- `PiOfD.reduction` (compatibility): Reduction and inverse limits use the unsaturated integral quotient; passing to its torsion-free quotient accounts for the finite O_L-length saturation discrepancy. Do not assert equality of saturated fibres under arbitrary base change.
- `PiOfD.family` (functoriality): The family construction and its O_L-valued specialisation maps are specified by R30.3/family-stability, with finite-free coefficients and saturation distinguished.
- `PiOfD.maximal` (characterisation): Π(V) is the largest unitary residually finite length representation Π with V(Π) ≅ V and Π^{SL₂(ℚ_p)} = 0 (the last condition because V kills Π^{SL₂(ℚ_p)}).

**Proof route.**

- Use Colmez §II.2.1 to form the raw inverse image and its integral saturation, and invert ϖ for the rational construction.
- Under G-stability, Lemma II.2.10 puts the quotients in their respective torsion, integral and rational representation categories; the integral quotient is the raw inverse-limit quotient modulo O_L-torsion.
- Twisting follows from the glued module and saturated submodule. The maximality statement for Π(V) uses Colmez Theorem 0.17 with its stated SL₂-invariant condition.

**Checks.**

- `PiOfD.centralChar_cyclotomicDet` (computation): If det V = ε then Π(V) has trivial central character.
- `PiOfD.rank_one_excluded` (non-example): For D of rank 1 the module D^♮ ⊠ ℙ¹ is not G-stable in general, so Π(D) is not defined: the construction is special to rank 2.
- `PiOfD.V_Pi` (characterisation): V(Π(V)) ≅ V for V absolutely irreducible of dimension 2 (R30.3/colmez-correspondence).
- `PiOfD.saturation_torsion_free` (non-example): For a free integral rank-two D₀, a class killed by ϖ in the quotient by N_sat is zero; the raw quotient by N_ns need not pass this test.

**Acceptance.**

- For D of rank 2 with det V(D) = χ, δ_D = 1 and Π(D) has trivial central character.
- Π(D ⊗ η) = Π(D) ⊗ (η∘det) for a unitary character η.

**Sources.**

- COLMEZ10, §II.2.1–II.2.2, pp.55–59 (Remark II.2.3 and Lemma II.2.10); Theorem 0.17, pp.16–17: Defines the saturated integral and rational natural submodules and conditional quotients; separates the compact-open torsion case from the integral compact and rational closed cases.
- CDN23, §1.3.1, p. 17: Π(V) is the largest unitary residually finite length representation with V(Π(V)) = V and Π(V)^{SL₂(ℚ_p)} = 0; V(Π) is always of GL₂ type in the sense of Théorème 1.16.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.3/boxtimes-p1`, `PadicLocalLanglandsForGL2Qp:R30.1/tate-dual`, `PadicLocalLanglandsForGL2Qp:R30.1/psi-and-treillis`, `PadicLocalLanglandsForGL2Qp:R30.1/boxtimes-qp`, `PadicLocalLanglandsForGL2Qp:R30.1/fontaine-functor-convention`.

### Colmez's theorem: Π(D) is irreducible and D(Π(D)) = Ď

**Target `R30.3/colmez-correspondence` (theorem).** Let D ∈ ΦΓ^et(E) be irreducible of rank 2. (i) D^♮ ⊠ ℙ¹ is stable under G. (ii) Π(D) = (D ⊠ ℙ¹)/(D^♮ ⊠ ℙ¹) is a topologically irreducible object of Rep_L G, D^♮ ⊠ ℙ¹ ≅ Π(D)\* ⊗ δ_D, so there is an exact sequence 0 → Π(D)\* ⊗ δ_D → D ⊠ ℙ¹ → Π(D) → 0. (iii) D(Π(D)) = Ď; equivalently V(Π(V)) ≅ V for every absolutely irreducible two-dimensional V. The proof of (i) is by analytic continuation from a Zariski-dense set of crystabelline or trianguline points; Colmez's text records the needed Zariski density for p ≥ 5, for p = 3 except for twists of extensions of k_L by k_L(ω) and of ind ω₂² (those two cases following from Böckle's computation of mod 3 deformation rings), and for p = 2 when V^{ss} is not the sum of two equal characters (a computation of Chenevier); Colmez–Dospinescu–Paškūnas (characteristic zero methods, valid for all p) give the bijection of R30.3/cdp-correspondence, which includes V(Π) ≅ V for all absolutely irreducible V.

**Hypotheses.**

- D irreducible of rank 2 over E; p any prime with the case division recorded in the statement.

**Proof route.**

- Use the family-stability theorem and its explicit density input G8 to obtain G-stability, with the residual exceptions in Colmez’s footnote 7 retained.
- Duality, Corollary II.2.12, and the rank-two wedge pairing give the exact sequence and identify D(Π(D)) with Ď.
- For irreducibility, use the absence of finite-dimensional subobjects and quotients together with the theorem identifying dim V of irreducible factors, and exactness. Exactness and an irreducible Galois image alone do not exclude a nonzero finite-dimensional kernel or quotient (G8). The all-prime characteristic-zero proof of CDP is an alternative route, not a density theorem.

**Acceptance.**

- For V crystalline irreducible with distinct Frobenius eigenvalues, Π(V) is the Berger–Breuil completion.
- V(Π(V)) ≅ V.

**Sources.**

- COLMEZ10, Théorème 0.17, Remarque 0.18 and footnote 7, pp. 15–17; Théorème II.3.1, Remarque II.3.2 and Théorème II.3.3, pp. 62–63: States that D^♮ ⊠ ℙ¹ is G-stable, Π(D) is an irreducible object of Rep_L G with the exact sequence 0 → Π(D)\* ⊗ δ_D → D ⊠ ℙ¹ → Π(D) → 0 and D(Π(D)) = Ď; the proof is by analytic continuation from Zariski-dense crystabelline or trianguline families, with the residual cases at p = 2, 3 recorded in footnote 7.
- CDP14, Abstract and §1.1, pp. 1–3: Proves the bijection for all p by characteristic zero methods, whereas the characteristic p methods covered p ≥ 5.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.3/pi-of-D`, `PadicLocalLanglandsForGL2Qp:R30.3/montreal-functor`, `PadicLocalLanglandsForGL2Qp:R30.3/contragredient`, `PadicLocalLanglandsForGL2Qp:R30.1/trianguline-representation`, `LocalGaloisDeformationRings:R08.1/local-lifting-ring`, `PadicLocalLanglandsForGL2Qp:R30.3/family-stability`.

### The p-adic local Langlands correspondence for GL₂(ℚ_p)

**Target `R30.3/cdp-correspondence` (theorem).** (i) (Colmez–Dospinescu–Paškūnas; Paškūnas for p ≥ 5) V induces a bijection between isomorphism classes of absolutely irreducible non-ordinary Π ∈ Ban^{adm}_G(L) and absolutely irreducible two-dimensional continuous L-representations of G_{ℚ_p}; its inverse is V ↦ Π(V). (ii) Every absolutely irreducible Π ∈ Ban^{adm}_G(L) is residually of finite length, and after replacing L by its quadratic unramified extension Π̄^{ss} is absolutely irreducible supersingular or a subrepresentation of some π{χ₁, χ₂}. (iii) If Π is absolutely irreducible non-ordinary with central character δ, then det V(Π) = δε. (iv) An object of Ban^{adm}_G(L) has finite length iff it is residually of finite length. (v) dim_L V(Π) ≤ 2 for every absolutely irreducible Π, with equality iff Π is non-ordinary. (vi) For absolutely irreducible non-ordinary Π₁, Π₂: V(Π₁) ≅ V(Π₂) ⇒ Π₁ ≅ Π₂, and Hom_{L[P]}^{cont}(Π₁, Π₂) = Hom_{L[G]}^{cont}(Π₁, Π₂). (vii) For p ≥ 5 (Paškūnas): if Π is absolutely irreducible with central character and Θ an open bounded G-stable lattice then Θ ⊗ k has finite length and either is absolutely irreducible supersingular or has semisimplification inside (Ind_B^G χ₁ ⊗ χ₂ω^{−1})^{ss} ⊕ (Ind_B^G χ₂ ⊗ χ₁ω^{−1})^{ss}, with equality iff Π is non-ordinary.

**Hypotheses.**

- L/ℚ_p finite; Π admissible unitary with central character (automatic for absolutely irreducible Π by Dospinescu–Schraen's Schur lemma).

**Proof route.**

- For p≥5, use Paškūnas’s projective-envelope method, with its endomorphism comparison and crystalline-density input; those key arguments are not formal consequences of the listed local categories.
- For all p, the CDP argument uses residual finiteness, Schur’s lemma for Banach representations, and the infinitesimal character on locally analytic vectors. These inputs are recorded precisely in G8 rather than hidden in a reference to the introduction.
- The determinant follows from the central-character formula once the correspondence is established. Residual finite length for arbitrary finite-length objects uses dévissage and the lattice-independence theorem.

**Acceptance.**

- For V crystabelline irreducible, Π(V) is the Berger–Breuil completion and V(Π(V)) = V.
- The ordinary Π (characters, Ŝp ⊗ η, unitary principal series) have dim V(Π) ≤ 1.

**Sources.**

- CDP14, Theorem 1.1, p. 1; Corollary 1.2, p. 2; Theorem 1.4, p. 3; Corollaries 1.6–1.7, p. 4; Theorems 1.8–1.9, pp. 5–6: Proves the bijection between absolutely irreducible non-ordinary admissible unitary Banach representations and absolutely irreducible two-dimensional Galois representations for all p, the determinant δε, residual finiteness with the shape of Π̄^{ss}, the finite length criterion, dim V(Π) ≤ 2, injectivity and the equality of P- and G-homomorphisms.
- PASKUNAS13, Theorem 1.1, p. 2; Corollary 1.2 and Theorem 1.3, p. 3: For p ≥ 5: finite length and shape of Θ ⊗ k, dim V(Π) ≤ 2 with equality iff non-ordinary, and the bijection with determinant ζε.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.3/colmez-correspondence`, `PadicLocalLanglandsForGL2Qp:R30.3/montreal-functor`, `PadicLocalLanglandsForGL2Qp:R30.2/admissible-unitary-banach`, `PadicLocalLanglandsForGL2Qp:R30.2/modp-principal-series`, `PadicLocalLanglandsForGL2Qp:R30.2/analytic-and-algebraic-vectors`, `PadicLocalLanglandsForGL2Qp:R30.1/character-dictionary`.

### Injectivity of V on Ext¹ of atoms

**Target `R30.3/ext1-injectivity` (theorem).** For an automorphic atom Π of O_L-torsion length at most three in Colmez’s list, the covariant Montreal functor induces an injection on fixed-central-character self-extension groups Ext¹_G(Π,Π)→Ext¹_{G_{ℚ_p}}(V(Π),V(Π)). No general Ext isomorphism is asserted here. Kisin’s comparison of whole deformation functors is a separate theorem: it requires representability and the full deformation argument in R30.5/kisin-deformation-comparison. Tangent-space injectivity and density of closed points alone do not identify nonreduced deformation schemes.

**Hypotheses.**

- Atoms of length ≤ 3 (the cases of length 4 occur only for p = 2, 3 and are not covered by Colmez's Théorème VII.5.2); central characters fixed.

**Proof route.**

- Use Colmez Theorem VII.5.2: compute the atom self-extensions with the Jacquet functor and compare with the Galois extension groups.
- The deformation comparison is not deduced here. Its schematic crystalline-closure input is recorded in G9.

**Acceptance.**

- The self-extension map has zero kernel on the automorphic atoms specified in the statement; a dimension equality is a stronger assertion requiring the separate deformation-comparison theorem.

**Sources.**

- COLMEZ10, Introduction §13.2, pp. 21–22; Théorème VII.5.2, p. 223: Records Kisin's strategy (Ext¹ injectivity plus Zariski density of trianguline points) and proves the injectivity of Ext¹(Π, Π) → Ext¹(V(Π), V(Π)) for automorphic atoms of length at most 3.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.3/montreal-functor`, `PadicLocalLanglandsForGL2Qp:R30.3/montreal-on-irreducibles`, `PadicLocalLanglandsForGL2Qp:R30.1/trianguline-representation`.

### Locally analytic vectors of Π(D)

**Target `R30.3/analytic-vectors-of-pi` (theorem).** Let D ∈ ΦΓ^et(E) be irreducible of rank 2 and Π = Π(D). (i) D† ⊠ ℙ¹ = {(z₁, z₂) ∈ D ⊠ ℙ¹ : z₁, z₂ ∈ D†} is G-stable and its image in Π(D) is Π(D)^{an}; indeed Π^{an} = (D† ⊠ ℙ¹)/L·(D^♮ ⊠ ℙ¹). (ii) The G-action extends continuously to D_rig ⊠ ℙ¹, with an exact sequence 0 → (Π(D)^{an})\* ⊗ δ_D → D_rig ⊠ ℙ¹ → Π(D)^{an} → 0, and D^♮_rig ⊠ ℙ¹ = (Π̌^{an})\*. (iii) (Colmez–Dospinescu) Π(D) is the universal unitary completion of Π(D)^{an}. Here D is rational: D^♮ ⊠ℙ¹ already means the L-span of the saturated integral submodule. An extra symbol L· does not mean that the integral compact lattice equals its rational span.

**Hypotheses.**

- D irreducible of rank 2 over E.

**Proof route.**

- Apply R30.3/fontaine-heart-weyl, then the overconvergent heart/distribution comparison in G10, to prove stability of D† ⊠ℙ¹.
- Use Colmez Theorem V.2.20 and its extended pairing to obtain the locally analytic exact sequence.
- Use the universal-completion target and its coherent-lattice input G7.

**Acceptance.**

- Π(D)^{an} is dense in Π(D).
- For D crystabelline, Π(D)^{an} contains the locally algebraic principal series of R30.4.

**Sources.**

- COLMEZ10, Théorème 0.19, p. 16; Proposition V.2.1, p. 125; Théorème V.2.20, p. 134: D† ⊠ ℙ¹ is G-stable with image Π(D)^{an}, the action extends to D_rig ⊠ ℙ¹ with 0 → (Π^{an})\* ⊗ δ_D → D_rig ⊠ ℙ¹ → Π^{an} → 0, proved through the heart C(D) and w(C) = C'.
- CD14, Théorème 0.2, p. 4: Every Π ∈ Rep_L(G) is the universal unitary completion of Π^{an}.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.3/colmez-correspondence`, `PadicLocalLanglandsForGL2Qp:R30.2/analytic-and-algebraic-vectors`, `PadicLocalLanglandsForGL2Qp:R30.2/universal-unitary-completion`, `PhiGammaModulesAndIwasawaCohomology:PG.2`, `PhiGammaModulesAndIwasawaCohomology:PG.5/psi-complex`, `PadicLocalLanglandsForGL2Qp:R30.3/fontaine-heart-weyl`.

### Colmez’s family stability theorem

**Target `R30.3/family-stability` (theorem).** Let S be a p-torsion-free complete local quotient of O_L[[X₁,…,X_d]] with residue field k_L, and D a finite free rank-two étale module over S completed-tensored with O_E. The family natural submodule N_ns(D) is the inverse limit of the torsion natural submodules. It is G-stable. For a continuous local O_L-algebra map s:S→O_L, the corresponding unsaturated quotient specialises to the unsaturated quotient for D_s, which surjects onto the saturated Π(D_s). Coefficient extension gives the analogous O_M-valued points after extending the setup. No theorem of arbitrary Spec S base change or commutation of saturation with fibres is claimed.

**Hypotheses.**

- The coefficient, finite-free, topology and residue hypotheses above; central character δ_D determined by the determinant.

**Proof route.**

- Construct the family over finite Artinian quotients as in §II.2.4.
- Apply the family closedness criterion, Lemma II.3.6, to the crystabelline stability computation. The residual-prime density input needed for this step remains G8.
- Use Proposition II.2.15 for specialisation of the unsaturated construction, followed by saturation on the fibre.

**Acceptance.**

- For S=O_L the family statement reduces to integral rank two.
- Specialisation of a raw quotient is distinguished from its saturated torsion-free quotient.

**Sources.**

- COLMEZ10, §II.2.4, pp.60–61, Proposition II.2.15; Theorem II.3.3 and Lemma II.3.6, pp.63–64; §II.3.4, pp.69–70: States the finite-free family and its O_L-valued specialisation result, proved by a family closedness and density argument.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.3/pi-of-D`, `LocalGaloisDeformationRings:R08.1/local-lifting-ring`.

This key target was added by the independent review.

### Fontaine’s heart and the Weyl involution

**Target `R30.3/fontaine-heart-weyl` (theorem).** For an irreducible rank-two rational étale module D with central character δ_D, define C=(1−φ)D^{ψ=1} and C′=(1−δ_D(p)^{-1}φ)D^{ψ=δ_D(p)^{-1}} inside D^{ψ=0}. The Weyl involution w_{δ_D} sends C bijectively onto C′. The comparison of this heart with overconvergent Γ-distributions, used to extend w to D† and D_rig, is an additional analytic input specified in G10.

**Hypotheses.**

- D irreducible rank two over E; the natural glued submodule is G-stable.

**Proof route.**

- Use the restriction description of the natural glued submodule and its G-stability. Translate the ψ-eigenspace relation under w and the central action into the two displayed (1−cφ)-images, as in Proposition V.2.1.
- Do not replace this argument with the formal H¹ computation of a two-term ψ complex.

**Acceptance.**

- The second heart uses ψ-eigenvalue δ_D(p)^{-1}, not always 1.
- w²=1 gives equality of the two hearts, not merely containment.

**Sources.**

- COLMEZ10, Proposition V.2.1, p.125; Theorem V.1.12 and §V.2 for the additional analytic comparison: Identifies the two Fontaine hearts under the Weyl involution; the analytic comparison is a separate argument.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.3/colmez-correspondence`, `PadicLocalLanglandsForGL2Qp:R30.3/boxtimes-p1`, `PadicLocalLanglandsForGL2Qp:R30.1/psi-and-treillis`.

This key target was added by the independent review.

**Remaining work for this layer.**

- G5. Scalar and topological adapters for measures and O-linear duality
- G7. Coherent lattices and universal analytic completion
- G8. Correspondence proof inputs beyond family stability
- G9. Schematic deformation comparison
- G10. Overconvergent Fontaine-heart comparison

## R30.4. Algebraic vectors, types and completions

**Planets:** Locally algebraic vectors of Π(V), Kisin's hypothesis (1.2.6), Unitary completions and Breuil's ℒ-invariant.

### The algebraic and smooth factors LL(V) and Alg(V) of a de Rham V

**Target `R30.4/locally-algebraic-type` (definition).** Let V be a two-dimensional L-representation of G_{ℚ_p} that is de Rham with distinct Hodge–Tate weights a < b (PadicHodgeTheory R06.2/hodge-tate-weight-convention as used by Colmez). Let D_pst(V) be its (φ, N, G_{ℚ_p})-module and WD(V) the attached Frobenius-semisimple Weil–Deligne representation (PadicHodgeTheory R06.3/weil-deligne-parameter). Put LL(V) := LL(D_pst(V)), the smooth representation of R30.1/classical-normalisation-bridge (irreducible except for the N = 0, δ ⊕ δ|·| case, where it is the reducible principal series), Alg(V) := W_{a, b−a} = Sym^{b−a−1}L² ⊗ det^a, and LL(V, a, b) := LL(V) ⊗ Alg(V), a locally algebraic representation of G. For a (φ, N, G_{ℚ_p})-module M and a < b, LL(M, a, b) := LL(M) ⊗ W_{a,b−a} depends on M and (a, b) only, not on the Hodge filtration. The set F of admissible filtrations on M_dR with jumps a < b may be empty; when nonempty it is ℙ¹(M_dR) with at most two points removed, and for ℒ ∈ F, D_ℒ denotes the étale (φ,Γ)-module of the weakly admissible filtered module (M, ℒ).

**Hypotheses.**

- V two-dimensional de Rham with distinct Hodge–Tate weights; the weight convention of Colmez (Théorème 0.20) is recorded with its dictionary to PadicHodgeTheory R06.2.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/LocallyAlgebraic`, namespace `TauCeti.LocAlgType`.

**Uses.**

- Colmez, Théorème 0.21: Π(D)^{lc} = LL(D_pst)
- CDP 2014, Theorem 1.3: completions of π ⊗ W are parametrised by filtrations F(Δ, W)
- Kisin 2009, Hypothesis (1.2.6): σ(k, τ) ⊂ LL(V) ⊗ Alg(V) restricted to K

**API.**

- `LocAlgType.smoothFactor` (constructor): LL(V) := LL(D_pst(V)).
- `LocAlgType.algFactor` (constructor): Alg(V) := Sym^{b−a−1}L² ⊗ det^a.
- `LocAlgType.locAlg` (constructor): LL(V, a, b) := LL(V) ⊗ Alg(V).
- `LocAlgType.smoothFactor_twist` (functoriality): LL(V ⊗ η) = LL(V) ⊗ (η∘det) for smooth η.
- `LocAlgType.indep_filtration` (characterisation): LL(V, a, b) depends on (D_pst(V) as (φ, N, G_{ℚ_p})-module, a, b) only.
- `LocAlgType.admissibleFiltrations` (data): The weakly admissible filtration locus F; it is either empty or the complement of at most two points of ℙ¹(M_dR).

**Proof route.**

- WD(V) from D_pst(V) by Fontaine's recipe (PadicHodgeTheory R06.3/fontaine-weil-deligne-functor, using the p-adic monodromy theorem R06.3/p-adic-monodromy-theorem).
- LL(M) from R30.1/classical-normalisation-bridge.
- Independence of the filtration is by construction; the parametrisation of admissible filtrations by ℙ¹(M_dR) minus finitely many points is the Colmez–Fontaine theorem in rank 2 (PadicHodgeTheory R06.2/colmez-fontaine-bigness-criterion) applied to lines in M_dR.

**Checks.**

- `LocAlgType.algFactor_weights_0_1` (computation): For Hodge–Tate weights (0, 1), Alg(V) is the trivial representation.
- `LocAlgType.algFactor_dim` (computation): dim Alg(V) = b − a.
- `LocAlgType.equal_weights_excluded` (non-example): For equal Hodge–Tate weights no Alg(V) is defined, and Π(V)^{alg} = 0 (R30.4/locally-algebraic-vectors).
- `LocAlgType.crystalline_unramified` (compatibility): For V crystalline with generic Frobenius eigenvalues α, β, LL(V) is unramified and LL(V)^{K} is one-dimensional.

**Acceptance.**

- For V crystalline with distinct Frobenius eigenvalues α, β (α/β ≠ p^{±1}) and weights a < b, LL(V) is the unramified principal series attached to the two unramified characters μ_α, μ_β, and Alg(V) = Sym^{b−a−1} ⊗ det^a.
- LL(V ⊗ η) = LL(V) ⊗ (η∘det) for a de Rham character η, with the weight shift absorbed in Alg.

**Sources.**

- COLMEZ10, Introduction §11, Théorèmes 0.20–0.21 and Remarque 0.22, pp. 17–18; §VI.6.11, p. 192: Defines Π^{alg} = Π^{lc} ⊗ (Sym^{b−a−1} ⊗ det^a) for de Rham D with weights a < b, the classical LL(D_pst), LL(M, a, b) = LL(M) ⊗ (Sym^{b−a−1} ⊗ det^a), and the parametrisation of admissible filtrations by ℙ¹(M_dR) minus 0, 1 or 2 points.
- BB10, Introduction, p. 2: Defines Alg(V) and Lisse(V) for crystabelline V and B(V) as the completion of Alg(V) ⊗ Lisse(V).

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.1/classical-normalisation-bridge`, `PadicHodgeTheory:R06.3/weil-deligne-parameter`, `PadicHodgeTheory:R06.3/fontaine-weil-deligne-functor`, `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`, `PadicHodgeTheory:R06.2/colmez-fontaine-bigness-criterion`.

### Locally algebraic vectors of Π(V): Colmez's theorem

**Target `R30.4/locally-algebraic-vectors` (theorem).** Let D ∈ ΦΓ^et(E) be irreducible of rank 2, V = V(D) and Π = Π(D). (i) Π^{alg} ≠ 0 iff D is de Rham with distinct Hodge–Tate weights a < b; Π^{alg} = 0 if D is not de Rham; if Π^{alg} ≠ 0 then D is almost de Rham with distinct weights and Π^{alg} = Π^{lc} ⊗ (Sym^{b−a−1} ⊗ det^a) with Π^{lc} smooth admissible. (ii) Under the nonvanishing condition of (i), Π^{alg} depends, up to isomorphism, only on D_pst as (φ, N, G_{ℚ_p})-module and on (a, b), not on the filtration. (iii) Under that same condition, if dim J₀(Π^{alg}) = 2 then D is crystabelline and Π^{alg} = LL(D_pst) ⊗ Alg; if dim J₀(Π^{alg}) = 1, D is a locally algebraic twist of a semistable non-crystalline module and Π^{alg} = LL(D_pst) ⊗ Alg; if dim J₀(Π^{alg}) = 0, D is de Rham but becomes semistable over no abelian extension. (iv) Under that same condition, Π^{alg} is supersingular iff V is not trianguline. (v) For V de Rham with distinct weights, Π(V)^{alg} ≅ LL(V) ⊗ Alg(V) in Colmez’s convention; the conversion to Emerton’s printed weight formula is not asserted and remains G4/E3; in the potentially crystalline non-crystabelline (supercuspidal) case this identification is proved only by a global argument (Emerton, lg §7.4), recorded as gap G1.

**Hypotheses.**

- D irreducible of rank 2 over E; (ii)–(v) assume Π^{alg}≠0, equivalently V de Rham with distinct weights; the supercuspidal case of (v) uses the global input of G1. The Emerton–Colmez convention dictionary remains G4.

**Proof route.**

- (i) non-de Rham: the image of Π^{alg} in D_rig ⊠ ℤ_p^× lies in R(Γ) ⊗ C_e(D), which is w-stable iff D is de Rham (Proposition 0.26, Théorème 0.25 = VI.6.8, via Kato's explicit reciprocity law), giving VI.6.13.
- (i) de Rham: nonvanishing by Lemme VI.6.19 (Théorème VI.6.18); the type (ℓ, k) structure by Proposition VI.5.1 and the Kirillov model (Théorème VI.5.7).
- (ii): Théorème VI.6.42, comparing D_ℒ for varying filtrations inside N_rig ⊠ ℙ¹.
- (iii): Théorème VI.6.50, from the Jacquet module J₀ and D_crab (Théorème VI.6.30, Proposition VI.6.33).
- (iv): Remarque VI.6.51(i) with the trianguline classification (R30.1/trianguline-representation).
- (v): crystabelline and semistable-twist cases from (iii); the remaining case by Emerton's global argument via (ii) — choose a modular V' with the same D_pst and weights (Emerton lg §7.4) — recorded as gap G1 because its inputs (completed cohomology of modular curves, the weight part of Serre's conjecture) lie outside this roadmap and downstream of R30.6.

**Acceptance.**

- For V de Rham with Hodge–Tate weights 0 and 1, Alg(V) is trivial and Π(V)^{lisse} = Π(V)^{alg} = LL(V) (CDN 2020 §0.2).
- For V crystalline irreducible with weights 0 < k−1, Π(V)^{alg} is the locally algebraic principal series LL(V) ⊗ Sym^{k−2}.
- For V semistable non-crystalline with weights 0 < k−1, Π(V)^{alg} = (St ⊗ Sym^{k−2}) ⊗ δ for the smooth δ of D_crab.
- For V not de Rham, Π(V)^{alg} = 0 while Π(V)^{an} is dense.

**Sources.**

- COLMEZ10, Théorèmes 0.20–0.21, p. 17; Théorème 0.25 and Proposition 0.26, p. 20; Théorème VI.5.7, p. 167; Théorèmes VI.6.13 and VI.6.18, pp. 177–178; Théorème VI.6.42, p. 189; Théorème VI.6.50 and Remarque VI.6.51, pp. 192–193: Π(D)^{alg} is nonzero iff D is de Rham with distinct weights, with Π^{alg} = Π^{lc} ⊗ Sym^{b−a−1} ⊗ det^a; Π^{alg} is independent of the filtration; LL(D_pst) = Π^{lc} in the crystabelline and semistable-twist cases; supersingular Π^{alg} iff V not trianguline; the remaining case uses Emerton's global work.
- EMERTON-LG, Theorem 3.3.22 and Remark 3.3.23, p. 28; §7.4, pp. 96–98: The printed theorem uses Sym^{a−b−1} ⊗ det^{b+1} ⊗ π_p(V), while the proof uses det^b (E3); this is not an established dictionary with Colmez. The potentially crystalline non-crystabelline case uses a modular representation with matching Weil–Deligne type and weights and completed cohomology.
- CDP14, Theorem 1.3 and footnote 5, p. 2: The classification of completions uses Emerton's local-global compatibility; the authors note that a purely local proof is available for principal series and Steinberg types but not for supercuspidal ones.
- CDNKISIN, Remarque 0.2(v), p. 3: Even their purely local construction of Kisin rings has a hidden global ingredient: Emerton's local-global compatibility ensures that M and LL(M) correspond under the classical correspondence.
- CDN20, §0.2, p. 4 and footnote 4 (arXiv): For V de Rham of dimension 2 with weights 0 and 1, LL(V) = Π(V)^{lisse}, recovered from Π(V) by taking locally constant vectors.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.4/locally-algebraic-type`, `PadicLocalLanglandsForGL2Qp:R30.3/colmez-correspondence`, `PadicLocalLanglandsForGL2Qp:R30.3/analytic-vectors-of-pi`, `PadicLocalLanglandsForGL2Qp:R30.2/analytic-and-algebraic-vectors`, `PadicLocalLanglandsForGL2Qp:R30.1/trianguline-representation`, `PadicHodgeTheory:R06.3/de-rham-iff-dif-connection-trivial`, `PhiGammaModulesAndIwasawaCohomology:PG.5/psi-complex-h1`.

### Berger–Breuil: unitary completions of locally algebraic principal series

**Target `R30.4/berger-breuil-completion` (theorem).** Let V be an absolutely irreducible two-dimensional L-representation of G_{ℚ_p} that becomes crystalline over an abelian extension of ℚ_p and is φ-semisimple, with Hodge–Tate weights a < b. Let B(V) be the p-adic completion of the locally algebraic representation Alg(V) ⊗ Lisse(V) (a locally algebraic principal series) with respect to a G-stable finitely generated O-lattice. Then B(V) is nonzero, topologically irreducible and admissible, and it is the universal unitary completion of Alg(V) ⊗ Lisse(V); its dual is identified with the ψ-limit (lim_ψ D(V))_b. With Colmez's construction, B(V) ≅ Π(V).

**Hypotheses.**

- V crystabelline, φ-semisimple and absolutely irreducible; p any prime as in Berger–Breuil’s setup. Use their modified locally algebraic model when the usual irreducible smooth factor is one-dimensional. Kisin’s separate theorem retains p>2.

**Proof route.**

- Construct B(V) as the completion of the locally algebraic principal series (R30.2/universal-unitary-completion).
- Identify (lim_ψ D(V))_b with B(V)\* (Berger–Breuil Théorème 5.2.7) using the (φ,Γ)-module of the crystabelline V and the Amice transform (R30.1/fontaine-functor-convention).
- Nonvanishing, topological irreducibility and admissibility: Corollaires 5.3.1–5.3.3.
- B(V) ≅ Π(V): compare Théorème 5.2.7 with Colmez's Π(D)\* ≅ D^♮ ⊠ ℙ¹ ⊗ δ_D^{−1} (R30.3/colmez-correspondence) as in Kisin's proof of Theorem (1.2.8).

**Acceptance.**

- For V crystalline irreducible with Hodge–Tate weights 0, k−1 and distinct Frobenius eigenvalues, B(V) is the completion of LL(V) ⊗ Sym^{k−2}, LL(V) the unramified principal series of R30.4/locally-algebraic-type.
- B(V)^{alg} = Alg(V) ⊗ Lisse(V).

**Sources.**

- BB10, Introduction, pp. 2–3 (main Théorème); Théorème 5.2.7, p. 51; Corollaires 5.3.1–5.3.3, p. 52: For V absolutely irreducible, crystalline over an abelian extension and φ-semisimple, B(V) — the completion of Alg(V) ⊗ Lisse(V) — is nonzero, topologically irreducible and admissible; its dual is the ψ-limit of D(V).
- KISIN09, Theorem (1.2.8), published p.650: Identifies the crystalline completion in the stated range through the algebraic-vector input; retain the theorem’s Hypothesis (1.2.6).

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.2/universal-unitary-completion`, `PadicLocalLanglandsForGL2Qp:R30.4/locally-algebraic-type`, `PadicLocalLanglandsForGL2Qp:R30.1/fontaine-functor-convention`, `PadicLocalLanglandsForGL2Qp:R30.3/colmez-correspondence`.

### Henniart's K-types σ(τ), σ^cr(τ) and σ(w, τ)

**Target `R30.4/henniart-types` (definition).** Let τ : I_{ℚ_p} → GL₂(L) be a representation with open kernel that extends to W_{ℚ_p} (an inertial type). Henniart's theorem: there exists a smooth irreducible representation σ(τ) (resp. σ^cr(τ)) of K = GL₂(ℤ_p) on an L-vector space such that for every smooth absolutely irreducible infinite-dimensional representation π of G, Hom_K(σ(τ), π) ≠ 0 (resp. Hom_K(σ^cr(τ), π) ≠ 0) iff LL(π)|_{I_{ℚ_p}} ≅ τ (resp. and the monodromy N = 0), LL being the classical correspondence of R30.1/classical-normalisation-bridge. σ(τ) ≅ σ^cr(τ) except for scalar τ ≅ χ ⊕ χ, where σ(τ) ≅ s̃t ⊗ (χ∘det) (s̃t the Steinberg representation of GL₂(𝔽_p) inflated to K) and σ^cr(τ) ≅ χ∘det. For a Hodge type w = (a, b) with b > a put σ(w, τ) = σ(τ) ⊗ Sym^{b−a−1}L² ⊗ det^a and σ^cr(w, τ) likewise; Kisin writes σ(k, τ) = σ(τ) ⊗ Sym^{k−2}L² for w = (0, k−1). For a K-stable O-lattice Θ ⊂ σ(w, τ), σ̄(w, τ) := (Θ/ϖΘ)^{ss} is independent of Θ, and m_σ(w, τ) (resp. m^cr_σ(w, τ)) is the multiplicity of an irreducible smooth k-representation σ of K in σ̄(w, τ) (resp. σ̄^cr(w, τ)). For p>2 these types are unique. At p=2 choose a type with the required occurrence property; the semisimplified reductions σ̄(w,τ) and σ̄^cr(w,τ), hence their multiplicities, are independent of that choice. Occurrence in an infinite-dimensional irreducible smooth representation has multiplicity one.

**Hypotheses.**

- τ of Galois type; the classical correspondence normalised as in R30.1/classical-normalisation-bridge (Kisin §1.1: central character τ̃|_{ℚ_p^×}).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Types`, namespace `TauCeti.HenniartType`.

**Uses.**

- Paškūnas 2015, Theorem 1.1: the multiplicities m_σ(w, τ) in the Breuil–Mézard cycle identity
- Kisin 2009, Hypothesis (1.2.6): σ(k, τ) ↪ Θ ⊗ ℚ_p
- GL2ModularityLifting R32.2: patched modules M_∞(σ(k, τ)) and their supports

**API.**

- `HenniartType.sigma` (constructor): σ(τ), the smooth irreducible L-representation of K attached to τ.
- `HenniartType.sigmaCris` (constructor): σ^cr(τ).
- `HenniartType.hom_ne_zero_iff` (characterisation): Hom_K(σ(τ), π) ≠ 0 iff LL(π)|_I ≅ τ, for π absolutely irreducible infinite-dimensional.
- `HenniartType.sigmaCris_eq_sigma` (relation): σ^cr(τ) ≅ σ(τ) unless τ is scalar.
- `HenniartType.sigmaW` (constructor): σ(w, τ) = σ(τ) ⊗ Sym^{b−a−1} ⊗ det^a and σ^cr(w, τ).
- `HenniartType.reductionSS` (projection): σ̄(w, τ), the semisimplified reduction of a K-stable lattice, independent of the lattice.
- `HenniartType.mult` (projection): m_σ(w, τ) and m^cr_σ(w, τ) ∈ ℕ.

**Proof route.**

- Use the p-adic inertial-type occurrence theorem stated in Paškūnas 2016 §2.C; the coefficient-characteristic≠p inertia-multiplicity result in R16.3 does not supply it.
- Choose a K-stable lattice in the finite-dimensional continuous locally algebraic type. Its reduction is smooth and factors through a finite quotient, so Brauer–Nesbitt gives independence of the lattice. The characteristic-zero algebraic factor need not factor through a finite quotient.
- At p=2 use the choice-independence assertion of Paškūnas 2016, published p.1326; existence and the dyadic choice-independence argument remain G11.

**Checks.**

- `HenniartType.sigmaCris_trivial` (computation): σ^cr(1) is the trivial representation and σ(1) = s̃t, of dimension p.
- `HenniartType.mult_weight_two_trivial` (computation): For w = (0, 1), τ = 1: m^cr_σ = 1 for σ trivial and 0 otherwise.
- `HenniartType.sigma_scalar_ne` (non-example): For scalar τ = χ ⊕ χ, σ(τ) ≇ σ^cr(τ): their dimensions are p and 1.
- `HenniartType.sigma_twist` (degenerate): σ(τ ⊗ χ) ≅ σ(τ) ⊗ (χ∘det) for a character χ of ℤ_p^×.
- `HenniartType.dyadic_choice_independence` (compatibility): At p=2 two permitted choices of smooth type have the same semisimplified mod-ϖ reduction after tensoring with the fixed algebraic factor; do not require them isomorphic in characteristic zero.

**Acceptance.**

- For τ trivial: σ^cr(1) is trivial and σ(1) = s̃t, so m_σ(w, 1) counts constituents of s̃t ⊗ Sym^{b−a−1} ⊗ det^a mod ϖ.
- For w = (0, 1) and τ trivial, σ̄^cr(w, τ) is the trivial representation of K.

**Sources.**

- PASKUNAS15, §1, p. 2: States Henniart's existence and uniqueness of σ(τ) and σ^cr(τ) characterised by Hom_K(σ(τ), π) ≠ 0 iff LL(π)|_I ≅ τ (and N = 0 for σ^cr), the scalar-type exception s̃t ⊗ χ versus χ, σ(w, τ) = σ(τ) ⊗ Sym^{b−a−1} ⊗ det^a, its semisimplified reduction and the multiplicities m_σ(w, τ), m^cr_σ(w, τ).
- KISIN09, §1.1, published pp.645–646: Defines the type and algebraic factor; compare the all-prime K-type choice statement of Paškūnas 2016.
- PASKUNAS16, §2.C, published pp.1325–1326 (arXiv pp.21–22): States existence for all p, uniqueness only for p>2, and independence of the mod-p semisimplification from the chosen dyadic type.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.1/classical-normalisation-bridge`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/henniart-unicity`, `LocalGaloisDeformationRings:R08.3/hodge-and-galois-types`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/serre-weights-compact-induction`.

### Kisin's Hypothesis (1.2.6): lattices containing the K-type

**Target `R30.4/kisin-hypothesis` (theorem).** Let p be odd, k ≥ 2, τ : I_{ℚ_p} → GL₂(E) an inertial type of Galois type, ψ a continuous character with ψ|_{I} compatible with τ, and σ(k, τ) = σ(τ) ⊗ Sym^{k−2}E² the Henniart–Breuil–Mézard K-type (R30.4/henniart-types). For every finite E'/E and every two-dimensional E'-representation V of G_{ℚ_p} that is potentially semistable of type τ with Hodge–Tate weights 0, k−1 and determinant ψ·χ_cyc (Kisin's type (k, τ, ψ)), there exist an admissible O_{E'}-lattice Θ (p-adically complete and separated O[G]-module with Θ/p^n of finite length and admissible) with central character ψ such that V(Θ) ⊗ ℚ_p ≅ V, and a K-equivariant inclusion σ(k, τ) ↪ Θ ⊗ ℚ_p. Proven: for τ of abelian type (τ extends to an abelian representation of W_{ℚ_p}) by Kisin's Theorem (1.2.8); for every de Rham type by Emerton (lg Theorem 3.3.22) together with Colmez's Théorème VI.6.50 (crystabelline and semistable cases) and R30.4/locally-algebraic-vectors, the supercuspidal types depending on gap G1.

**Hypotheses.**

- p odd (Kisin §1.0); types of Galois type; V of type (k, τ, ψ) in Kisin's sense (1.1).
- For non-abelian (supercuspidal) types the statement rests on R30.4/locally-algebraic-vectors (v) and therefore on gap G1.

**Proof route.**

- Take Θ an open bounded G-stable lattice in Π(V) (R30.3/pi-of-D) with central character ψ, so V(Θ) ⊗ ℚ_p ≅ V (R30.3/colmez-correspondence; for reducible V use the lattices P(χ₁, χ₂) in continuous principal series, Kisin Lemma (1.2.10)).
- Π(V)^{alg} ≅ LL(V) ⊗ Alg(V) (R30.4/locally-algebraic-vectors), and Alg(V) = Sym^{k−2} for weights 0, k−1.
- Henniart's property of σ(τ) (R30.4/henniart-types): LL(V)|_K ⊇ σ(τ) because WD(V)|_I ≅ τ; hence σ(k, τ) ↪ Π(V)^{alg} ⊂ Π(V) = Θ ⊗ ℚ_p.
- Abelian types: Berger–Breuil and Colmez give the completion directly (Kisin Theorem (1.2.8), R30.4/berger-breuil-completion).

**Acceptance.**

- For τ trivial and k = 2, σ(2, 1) is the trivial K-representation and Θ ⊗ ℚ_p has a nonzero K-fixed vector.
- The hypothesis holds for all de Rham V with abelian type unconditionally.

**Sources.**

- KISIN09, Hypothesis (1.2.6), (1.2.7) and Theorem (1.2.8), published pp.649–650: States the locally algebraic-vector hypothesis and its use in the universal completion theorem.
- EMERTON-LG, Theorem 3.3.22, p. 28 and §7.4, pp. 96–98: Identifies the locally algebraic vectors of B(V) for all de Rham V with distinct weights, which gives Kisin's hypothesis for every type.
- DP22, Proof of Theorem 1.4, p. 4: Records that the compatibility between classical and p-adic local Langlands in Kisin's article is supplied by Emerton (lg Theorem 1.2.1) and Paškūnas (Duke 2015, Theorem 1.1).

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.4/locally-algebraic-vectors`, `PadicLocalLanglandsForGL2Qp:R30.4/berger-breuil-completion`, `PadicLocalLanglandsForGL2Qp:R30.3/pi-of-D`, `PadicLocalLanglandsForGL2Qp:R30.3/colmez-correspondence`, `PadicLocalLanglandsForGL2Qp:R30.4/henniart-types`.

### Classification of unitary completions; weights do not determine Π

**Target `R30.4/completions-of-locally-algebraic` (theorem).** Let π be an admissible absolutely irreducible infinite-dimensional smooth L-representation of G, W = Sym^{k−1}L² ⊗ det^a (k ≥ 1), Δ the Weil representation attached to π by the classical correspondence (viewed as a (φ, G_{ℚ_p})-module), and F(Δ, W) the set of weakly admissible absolutely irreducible filtered (φ, N, G_{ℚ_p})-modules with underlying Δ and filtration jumps −a, −a−k. (i) If Π is an admissible absolutely irreducible non-ordinary unitary completion of π ⊗ W then V(Π) is potentially semistable with Hodge–Tate weights a, a+k and D_pst(V(Π)) has underlying (φ, G_{ℚ_p})-module Δ. (ii) Π ↦ D_pst(V(Π)) is a bijection from such completions onto F(Δ, W), which is a point if π is a principal series and ℙ¹(L) if π is supercuspidal or a twist of the Steinberg. In particular St ⊗ |det|^{k/2} ⊗ Sym^k L² has exactly ℙ¹(L) pairwise non-isomorphic absolutely irreducible admissible unitary completions (Breuil's conjecture): a p-adic Banach representation is not determined by its Hodge–Tate weights and locally algebraic vectors. The filtration set F may be empty; nonzero completions are classified only for ℒ∈F, allowing a finite coefficient extension. There is no assertion that every (M,a,b) admits a completion.

**Hypotheses.**

- π infinite-dimensional; completions absolutely irreducible, admissible, non-ordinary; the supercuspidal case uses Emerton's local-global compatibility (CDP footnote 5), i.e. gap G1.

**Proof route.**

- Combine R30.3/cdp-correspondence (every such completion is Π(V)), R30.4/locally-algebraic-vectors (Π(V)^{alg} = LL(V) ⊗ Alg(V) and its independence of the filtration) and the converse that Π(D_ℒ) completes LL(M, a, b) for each ℒ ∈ F (Colmez Théorème VI.6.42, Remarque 0.22).
- Distinct ℒ give non-isomorphic Π(D_ℒ) since V(Π(D_ℒ)) = V(D_ℒ) are non-isomorphic.

**Acceptance.**

- For π = St ⊗ |det|^{k/2}, W = Sym^k: completions ↔ ℙ¹(L) (the L-invariant).
- For π an irreducible principal series, the completion is unique.

**Sources.**

- CDP14, Theorem 1.3 and the paragraph before it, p. 2: Proves that admissible absolutely irreducible non-ordinary completions of π ⊗ W correspond bijectively to F(Δ, W), a point for principal series and ℙ¹(L) for supercuspidal or Steinberg π.
- PASKUNAS13, §1, p. 3: Deduces that St ⊗ |det|^{k/2} ⊗ Sym^k L² admits precisely ℙ¹(L) non-isomorphic absolutely irreducible admissible unitary completions, confirming Breuil's conjecture.
- COLMEZ10, Remarque 0.22, p. 18: The filtrations with jumps a < b are parametrised by ℙ¹(M_dR) minus finitely many points and the Jordan–Hölder constituents of Π(D_ℒ)^{an} do not depend on ℒ; the filtration is encoded in the extension.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.3/cdp-correspondence`, `PadicLocalLanglandsForGL2Qp:R30.4/locally-algebraic-vectors`, `PadicLocalLanglandsForGL2Qp:R30.4/locally-algebraic-type`.

### Kirillov models of P-algebraic and locally algebraic vectors

**Target `R30.4/kirillov-model` (theorem).** Let D ∈ ΦΓ^et(E) be irreducible of rank 2, almost de Rham with Hodge–Tate weights ℓ < ℓ + k, Π = Π(D), and X^-_∞ ⊂ D̃_dif/D̃⁺_dif the L_∞[t]/t^k-module of Colmez §VI.4. (i) For z ∈ Π^{alg}, K_z(x) f_D = ι^-_0((x 0; 0 1)·z) defines K_z : ℚ_p^× → L_∞[t]/t^k with σ_a(K_z(x)) = K_z(ax), its coefficients locally constant with compact support in ℚ_p, and z ↦ K_z is a bijection of Π^{alg} onto its Kirillov model. (ii) Π^{alg}, if nonzero, is of type (ℓ, k) and irreducible, except in the special case where it is an extension of W_{ℓ,k} ⊗ (δ₀∘det) by W_{ℓ,k} ⊗ St ⊗ (δ₀∘det) for a smooth δ₀. (iii) The P-algebraic vectors with compact support Π^{P−alg}_c satisfy: z ↦ φ_z is a B-equivariant isomorphism Π^{P−alg}_c ≅ LP_c(ℚ_p^×, X^-_∞)^Γ (locally polynomial, compactly supported functions with Γ-equivariance), Π^{P−alg}_c ⊂ Π^{an}, and Π^{P−alg}_c ⊂ Π^{alg} when Π^{alg} ≠ 0. This is the P-equivariant embedding of functions on ℚ_p^× with values in D^-_dif into Π(V)^{la} used by consumers.

**Hypotheses.**

- D irreducible of rank 2, almost de Rham with weights ℓ < ℓ + k (for (i)–(ii)); (iii) for D irreducible of rank 2 with these weights.

**Proof route.**

- (i): Proposition VI.5.6 from Lemme VI.5.4 (the map z ↦ φ_z = ι^-_0 on the B-orbit).
- (ii): Théorème VI.5.7, from the Kirillov model and Proposition VI.2.12 on smooth representations with a Kirillov model.
- (iii): Proposition VI.5.8 (surjectivity via an explicit lift in Ñ_dif), Corollaire VI.5.9 and Proposition VI.5.12(i).

**Acceptance.**

- For D crystalline irreducible with weights 0, k, the Kirillov functions of Π^{alg} take values in L_∞[t]/t^k and are compactly supported in ℚ_p.
- Π^{P−alg}_c ≅ ⊕_{i∈ℤ} X^-_∞ via z ↦ (ι^-_i(z̃))_i (Lemme VI.5.10).

**Sources.**

- COLMEZ10, §VI.5.2–VI.5.4: Proposition VI.5.6 and Théorème VI.5.7, p. 167; Proposition VI.5.8, Corollaire VI.5.9 and Lemme VI.5.10, p. 168; Proposition VI.5.12(i), p. 169: Constructs K_z with σ_a(K_z(x)) = K_z(ax) and shows z ↦ K_z is a bijection onto the Kirillov model; Π^{alg} is of type (ℓ, k), irreducible or the special Steinberg extension; z ↦ φ_z identifies the compactly supported P-algebraic vectors with LP_c(ℚ_p^×, X^-_∞)^Γ, inside Π^{an}.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.4/locally-algebraic-vectors`, `PadicLocalLanglandsForGL2Qp:R30.3/analytic-vectors-of-pi`, `PadicHodgeTheory:P7/fontaine-dif-module`.

### Locally analytic vectors of the unitary principal series (trianguline case)

**Target `R30.4/trianguline-analytic-vectors` (theorem).** Let s = (δ₁, δ₂, ℒ) ∈ S_irr (R30.1/trianguline-representation), Δ(s) the trianguline (φ,Γ)-module over R, and Π(Δ(s)) = Π(V(s))^{an}. For η₁, η₂ ∈ T̂(L) let Ban(η₁, η₂) := Ind^{an}_B^G(η₂ ⊗ η₁χ^{−1}) (locally analytic induction). (i) J\*(Π(Δ)) ≠ 0 iff Δ is triangulable, i.e. iff Π(Δ̂[0]) is a unitary principal series. (ii) If s is generic (δ_s := χ^{−1}δ₁δ₂^{−1} ∉ {x^k : k ∈ ℕ}), there is an exact sequence 0 → Ban(δ₁, δ₂) → Π(Δ(s)) → Ban(δ₂, δ₁) → 0, and Π(Δ(s)) is the unique non-trivial such extension. (iii) If s is special, Ban(δ₁, δ₂) contains a (k+1)-dimensional subrepresentation W(δ₁, δ₂) with quotient St^{an}(δ₁, δ₂), Ext¹(R(δ₂), R(δ₁)) ≅ Ext¹(W(δ₁, δ₂), St^{an}(δ₁, δ₂)), and 0 → E_ℒ → Π(Δ(s)) → Ban(δ₂, δ₁) → 0 with E_ℒ the extension determined by ℒ; for δ_s = x^k these are Breuil's ℒ-invariant extensions. (iv) Π(V(s)) is the universal unitary completion of ker p_s.

**Hypotheses.**

- s ∈ S_irr; p ≠ 2 where Colmez's trianguline classification is used (gap G2).

**Proof route.**

- Compute the Jacquet-type module J\*(s) of Π(Δ(s)) (Colmez 2014, Théorème 0.6) from the description of Π(D)^{an} through D_rig ⊠ ℙ¹ (R30.3/analytic-vectors-of-pi).
- An eigenvector of B in J\*(Π) gives a G-map to Ind^{an}; this gives p_s : Π(Δ(s)) → Ban(δ₂, δ₁), shown surjective with the stated kernel (Théorème 0.7).
- Uniqueness of the extension: dim Ext¹(Ban(δ₂, δ₁), Ban(δ₁, δ₂)) = 1 for generic s (Remarque 0.8(i), citing Liu–Xie–Zhang); (iv) is Remarque 0.8(iii).

**Acceptance.**

- For V crystalline irreducible with distinct eigenvalues, Π(V)^{an} is an extension of two locally analytic principal series.
- For V semistable non-crystalline, the extension class of E_ℒ recovers the Fontaine–Mazur ℒ-invariant.

**Sources.**

- COLMEZ14LA, Théorème 0.1, p. 5; Propositions 0.2–0.5, pp. 5–6; Théorèmes 0.6–0.7 and Remarque 0.8, p. 7: J\*(Π(Δ)) ≠ 0 iff Δ is triangulable; for s ∈ S_irr the map p_s : Π(Δ(s)) → Ban(δ₂, δ₁) is onto with kernel Ban(δ₁, δ₂) in the generic case and Breuil's extension E_ℒ in the special case; Π(V(s)) is the universal completion of ker p_s.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.1/trianguline-representation`, `PadicLocalLanglandsForGL2Qp:R30.3/analytic-vectors-of-pi`, `PadicLocalLanglandsForGL2Qp:R30.2/analytic-and-algebraic-vectors`, `PadicLocalLanglandsForGL2Qp:R30.2/universal-unitary-completion`.

### Density of locally algebraic vectors and de Rham extensions (Dospinescu)

**Target `R30.4/de-rham-extensions` (theorem).** Let p ≥ 5 and Π ∈ Rep_L(δ) supersingular with Π^{alg} ≠ 0 (so Π = Π(V) with V de Rham with distinct weights). For an extension 0 → Π → Π₁ → Π → 0 in Rep_L(δ), the following are equivalent: (a) Π₁^{alg} is dense in Π₁; (b) Π₁^{alg} ≠ Π^{alg}; (c) V(Π₁) is de Rham. Consequently V induces an isomorphism Ext¹_{alg}(Π, Π) ≅ Ext¹_{g,ζ}(V(Π), V(Π)) onto the de Rham extensions with fixed determinant, and if Π ∈ Rep_L(δ) is the completion of its locally algebraic vectors then V(Π) is de Rham. The converse fails: V(Π) de Rham does not force Π to be the completion of Π^{alg}. In this statement supersingular is Banach terminology: absolutely irreducible and nonordinary. It does not require every mod-p constituent to be supersingular. Dospinescu’s contravariant Galois convention is the Tate dual V_packet(Π)^∨(1); de Rhamness is invariant under this change, but determinants must be converted.

**Hypotheses.**

- p ≥ 5; Π supersingular (all Jordan–Hölder factors of the reduction supersingular) with Π^{alg} ≠ 0; central character δ fixed.

**Proof route.**

- Describe Π^{P−fin} as a dense B-stable subspace of Π^{an} (Dospinescu Théorème 1.8) and the P-algebraic compactly supported vectors (R30.4/kirillov-model).
- Hodge–Tate case first (Théorème 1.9(a)–(b)), then the de Rham criterion via the inclusion Π₁^{P−alg}_c ⊂ Π₁^{alg} (Théorème 1.9(c)).
- The Ext¹ isomorphism (Théorème 1.3) and the completion criterion (Théorème 1.7) follow.

**Acceptance.**

- For Π₁ a non-de Rham self-extension, Π₁^{alg} = Π^{alg}.
- The trivial extension Π ⊕ Π has V de Rham and dense locally algebraic vectors.

**Sources.**

- DOSPINESCU15, Théorèmes 1.2 and 1.3, pp. 3–4; Théorème 1.7 and Remarque 1.1, pp. 2–6; Théorèmes 1.8–1.9, p. 7: For p ≥ 5 and supersingular Π with Π^{alg} ≠ 0: density of Π₁^{alg} ⇔ Π₁^{alg} ≠ Π^{alg} ⇔ V(Π₁) de Rham; the induced Ext¹ isomorphism onto de Rham extensions; completions of locally algebraic vectors have de Rham V(Π), with the converse failing.
- CDNKISIN, Introduction, p. 3 (second ingredient): Uses the extension of these results — Π(V) is the completion of its locally algebraic vectors in an extension E of V by V iff E is de Rham — to show their rings R^{[a,b]}_{M,ρ} are products of principal ideal domains.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.4/locally-algebraic-vectors`, `PadicLocalLanglandsForGL2Qp:R30.4/kirillov-model`, `PadicLocalLanglandsForGL2Qp:R30.3/cdp-correspondence`.

### De Rham deformations and algebraic-vector density

**Target `R30.4/artinian-de-rham-criterion` (theorem).** Let V₀ be absolutely irreducible of dimension two, E a finite local L-algebra with residue L, and V a free rank-two E-deformation of V₀ with fixed determinant and End_{E[G_{ℚ_p}]}V=E, obtained from the local absolutely irreducible deformation neighbourhood. Then Π(V)^{alg} is dense in Π(V) exactly when V is de Rham with distinct Hodge–Tate weights. This holds for every prime. In a fixed-determinant supercuspidal type the de Rham self-extension space is one-dimensional.

**Hypotheses.**

- The fixed-determinant absolutely irreducible deformation-neighbourhood hypotheses of CDN–Kisin §4.1; coefficient field sufficiently large; Hodge–Tate weights interpreted in the packet convention.

**Proof route.**

- Use the family construction over the local Galois deformation neighbourhood and its Banach/analytic exact sequences.
- Apply the infinitesimal (φ,Γ)-module calculation in CDN–Kisin Theorem 4.1. The proof is not a specialisation of the p≥5 statement in R30.4/de-rham-extensions; its all-prime analytic and infinitesimal inputs remain G15.

**Acceptance.**

- E=L recovers the irreducible algebraic-vector criterion.
- A repeated Hodge–Tate weight does not satisfy the density criterion.

**Sources.**

- CDNKISIN, §4.1, Theorem 4.1 and Remark 4.2, pp.13–15; §4.2, pp.16–17: Proves density versus de Rhamness for Artinian deformations of an absolutely irreducible representation; the fixed-type self-extension calculation feeds the Kisin-ring proof.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.3/family-stability`, `PadicLocalLanglandsForGL2Qp:R30.3/analytic-vectors-of-pi`, `PadicLocalLanglandsForGL2Qp:R30.4/locally-algebraic-vectors`.

This key target was added by the independent review.

### The analytic quotient is independent of the filtration

**Target `R30.4/analytic-quotient-filtration-independent` (theorem).** Fix the rank-two potentially semistable (φ,N,G)-module M, distinct weights (normalised to 0,k with k>0), and a nonempty weakly admissible filtration locus F. In the nonspecial case the canonical analytic representation Π(M,0,k)^{an} has an algebraic subrepresentation consisting of two copies of the filtration-independent Π(M,0,k)^{alg}. Its quotient Π′(M,0,k)^{an} is independent of the filtration. For every ℒ∈F there is an exact sequence 0→Π(M,0,k)^{alg}→Π(D_ℒ)^{an}→Π′(M,0,k)^{an}→0; Π(D_ℒ)^{an} is obtained from the canonical representation by quotienting by one algebraic copy. The special case has the modified algebraic piece described in Remark VI.6.44.

**Hypotheses.**

- Colmez §VI.6.9 setup; F nonempty; the two-copy assertion assumes the nonspecial case, including the supercuspidal application.

**Proof route.**

- Use the differential-equation module N_rig attached to M and the independence of its G-action, Proposition VI.6.41.
- The filtration-independent algebraic factors, Theorem VI.6.42, and the intersection calculation of Theorem VI.6.43 yield the analytic quotient and exact sequence. These differential-equation and intersection inputs are recorded in G18.

**Acceptance.**

- In the supercuspidal weight-(0,1) case the quotient is Π^{an}/Π^{lisse}.
- The theorem does not say that Π(D_ℒ)^{an} itself is independent of ℒ.

**Sources.**

- COLMEZ10, Proposition VI.6.41 and Theorem VI.6.42, p.189; Theorem VI.6.43 and Remark VI.6.44, p.190: Identifies a common analytic quotient for varying admissible filtration; the special case has a different algebraic piece.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.3/analytic-vectors-of-pi`, `PadicLocalLanglandsForGL2Qp:R30.4/locally-algebraic-type`, `PadicLocalLanglandsForGL2Qp:R30.4/locally-algebraic-vectors`.

This key target was added by the independent review.

**Remaining work for this layer.**

- Gap G1: a local proof, or an explicit-hypothesis treatment in consumers, of the supercuspidal case of Π(V)^alg = LL(V) ⊗ Alg(V).
- Gap G4 and source issue E3: reconcile Emerton's det^{b+1}/det^b and π_p(V) with LL(V).
- G1. The supercuspidal case of Π(V)^alg = LL(V) ⊗ Alg(V) has only a global proof
- G2. p = 2 for the trianguline classification
- G4. Emerton's normalisation of π_p(V) and of B(V) against Colmez's LL and Π(V)
- G11. Inertial K-types with p-adic coefficients
- G15. All-prime Artinian de Rham infinitesimal calculation
- G18. Differential-equation and Drinfeld geometry inputs

## R30.5. Blocks and deformation rings

**Planets:** Blocks of mod p representations, Classification of blocks, Projective envelopes P̃, Paškūnas's theorem: End(P̃) is a deformation ring, Local R = T for blocks, Breuil–Mézard cycle identity.

### Blocks of locally finite mod p representations

**Target `R30.5/blocks` (definition).** Blocks are equivalence classes of irreducible smooth objects under chains of nonzero Ext¹ in either direction, with fixed central character ζ. Write A_B for the locally finite-length block subcategory, π_B=⊕_{π∈B}π, J_B its injective envelope in A_B, and P_B=J_B^∨ in the dual profinite category. Put E_B=End_C(P_B), with ordinary composition. Then End_G(J_B)=E_B^{op}; their centres agree with the centre of the block category. For τ∈A_B, m_B(τ)=Hom_C(P_B,τ^∨) is a right pseudocompact E_B-module by precomposition, P_B is a left E_B-module, and τ≅(m_B(τ) completed-tensored_{E_B}P_B)^∨. This is an anti-equivalence with the appropriate right pseudocompact modules. The full locally finite-length category decomposes into its blocks; finite-length objects have only finitely many nonzero components. CDN’s Rep^{ℓf} is the finite-length subcategory; passage to all locally finite-length objects uses its Ind-completion, not a change of meaning of ℓf. Blocks over k correspond to Galois orbits of absolute blocks.

**Hypotheses.**

- ζ fixed; F = ℚ_p; blocks may be taken over k_L or 𝔽̄_p (rationality as in CDN 2023 Remarques 1.11 and 1.13).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Blocks`, namespace `TauCeti.Block`.

**Uses.**

- Paškūnas 2013, Theorems 1.5–1.7: Ẽ_B and its centre are computed in terms of deformation rings
- Paškūnas–Tung, Theorems 1.1–1.4: Z_B is noetherian and E_B finite over R^{ps}
- CDN 2023, Proposition 4.10: M = (k ⊗_{R^{ps}} S^∨)^∨ in the block of r̄^{ss}

**API.**

- `Block` (data): A block B: an equivalence class of irreducibles under Ext¹-linkage.
- `Block.subcategory` (constructor): Mod^{l.fin}_{G,ζ}(O)_B.
- `Block.injectiveEnvelope` (constructor): J_B, an injective envelope of π_B.
- `Block.projectiveEnvelope` (constructor): P_B = J_B^∨ in C_{G,ζ}(O).
- `Block.endRing` (constructor): E_B=End_C(P_B) with composition; End_G(J_B)=E_B^{op}.
- `Block.centre` (constructor): Z_B is the centre of E_B, canonically also the centre of End_G(J_B)=E_B^{op} and of the block category.
- `Block.decomposition` (equivalence): Mod^{l.fin}_{G,ζ}(O) ≅ ∏_B Mod^{l.fin}_{G,ζ}(O)_B.
- `Block.gabriel` (equivalence): τ↦Hom_C(P_B,τ^∨) is a right pseudocompact E_B-module; reconstruction is (m completed-tensored_{E_B}P_B)^∨, with P_B a left E_B-module.

**Proof route.**

- Mod^{l.fin}_{G,ζ}(O) is a locally finite Grothendieck category (R30.2/smooth-torsion-categories); Gabriel's decomposition of locally finite categories into blocks applies (Paškūnas 2013 §1.1 and [35, §IV] there).
- The anti-equivalence with compact Ẽ_B-modules is Gabriel's theorem for categories with a projective generator in the dual (R30.2/pontryagin-dual-category).
- Rationality: Lemma 1.6 and Lemma 1.7 of CDN 2023 (Hom and absolute irreducibility under field extension) give the Galois-orbit description.
- Gabriel’s block decomposition and pseudocompact Morita theorem are nonroutine category-theoretic inputs, retained as G12; no ordinary module-envelope structure supplies them.

**Checks.**

- `Block.supersingular_singleton` (computation): For π supersingular, the block of π is {π}.
- `Block.zero` (degenerate): The zero representation lies in every Mod^{l.fin}_{G,ζ}(O)_B.
- `Block.not_finite_length` (non-example): J_B is not of finite length, and E_B is not an artinian ring.
- `Block.galois_orbits` (characterisation): Blocks over k_L correspond to Gal(𝔽̄_p/k_L)-orbits of blocks over 𝔽̄_p.

**Acceptance.**

- A supersingular π alone forms a block {π}.
- The centre Z_B acts on every object of the block, functorially.

**Sources.**

- PASKUNAS13, §1.1, pp. 4–5: Defines the equivalence relation by Ext¹-chains, blocks, π_B, J_B, Ẽ_B, the Gabriel decomposition Mod^{l.fin}_{G,ζ}(O) ≅ ∏_B Mod^{l.fin}_{G,ζ}(O)_B and the anti-equivalence τ ↦ Hom_G(τ, J_B) with compact Ẽ_B-modules.
- CDN23, §1.3.3, pp. 18–19; Remarques 1.11 and 1.13: Defines blocks of Rep_{𝔽̄_p}G and of Rep^{ℓf}G, P_B, E_B, Z_B and the Gabriel equivalence m_B(Π) = Hom_G(P_B, Π^∨), with blocks over k_L in bijection with Galois orbits of blocks over 𝔽̄_p and with central character δ.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.2/smooth-torsion-categories`, `PadicLocalLanglandsForGL2Qp:R30.2/pontryagin-dual-category`, `PadicLocalLanglandsForGL2Qp:R30.2/modp-irreducibles`, `PadicLocalLanglandsForGL2Qp:R30.2/locally-admissible-finite-length`.

### Paškūnas's classification of blocks and the bijection B ↔ ρ̄_B

**Target `R30.5/blocks-classification` (theorem).** The blocks of Rep_{𝔽̄_p}G containing an absolutely irreducible representation are: (i) {π}, π supersingular; (ii) {Ind_B^G(δ₁ ⊗ δ₂ω^{−1}), Ind_B^G(δ₂ ⊗ δ₁ω^{−1})} with δ₂δ₁^{−1} ∉ {1, ω^{±1}}; (iii) for p > 2, {Ind_B^G(δ ⊗ δω^{−1})}; (iv) for p = 2, {1, Sp} ⊗ δ∘det; (v) for p ≥ 5, {1, Sp, Ind_B^G(ω ⊗ ω^{−1})} ⊗ δ∘det; (vi) for p = 3, {1, Sp, ω∘det, Sp ⊗ ω∘det} ⊗ δ∘det (δ, δ₁, δ₂ smooth characters, ω(x) = x|x| mod ϖ). There is a bijection B ↦ ρ̄_B between blocks over 𝔽̄_p and semisimple two-dimensional 𝔽̄_p-representations of G_{ℚ_p}, sending B to the semisimple representation whose irreducible constituents are the V(π), π ∈ B (up to the twist normalising V): ρ̄_B irreducible for (i), δ₁ ⊕ δ₂ for (ii), δ ⊕ δ for (iii), δ ⊕ δω for (iv)–(vi); in all cases (det ρ̄_B)ε^{−1} is the central character of B. Over k_L blocks correspond to Gal(𝔽̄_p/k_L)-orbits, and with central character δ to ρ̄ with det = δε.

**Hypotheses.**

- F = ℚ_p; the exceptional cases at p = 2, 3 as listed.

**Proof route.**

- Ext¹ computations between irreducibles (Breuil–Paškūnas, Colmez §VII, Emerton, completed by Paškūnas), with the criterion of Paškūnas's Theorem 1.1 (Blocks): Ext¹_G(π₂, π₁) ≠ 0 forces π₁, π₂ to be constituents of the reduction of one unitary principal series or Π(V).
- The decomposition of π{δ₁, δ₂} (Blocks, Proposition 3.11 and the case list on p. 11), including p = 2: π{δ, δ} ≅ (Sp^{⊕2} ⊕ 1^{⊕2}) ⊗ δ∘det, and p = 3: (1 ⊕ Sp ⊕ ω∘det ⊕ Sp ⊗ ω∘det) ⊗ δ∘det.
- The bijection with ρ̄_B from R30.3/montreal-on-irreducibles and Breuil's semisimple correspondence (CDN 2023 Remarque 1.15).

**Acceptance.**

- For p ≥ 5 the block of the trivial character is {1, Sp, Ind_B^G(ω ⊗ ω^{−1})} and ρ̄_B = 1 ⊕ ω.
- For p = 2 the block of the trivial character is {1, Sp} (Ind_B^G(ω ⊗ ω^{−1}) = Ind_B^G(1) is reducible with these constituents).

**Sources.**

- PASKUNAS-BLOCKS14, Theorem 1.1, p. 1; Corollary 1.2, p. 2; Proposition 3.11 and the decomposition list, pp. 8–11: Lists the blocks containing an absolutely irreducible representation, cases (i)–(vi) including p = 2 and p = 3, and decomposes π{δ₁, δ₂}.
- CDN23, Proposition 1.10, p. 18; Remarques 1.11, 1.13 and 1.15, pp. 18–19: Restates Paškūnas's list with the p = 2 and p = 3 degenerations, the Galois-orbit description over k_L, the central character condition, and the bijection B ↔ ρ̄_B with (det ρ̄_B)ε^{−1} equal to the central character.
- PASKUNAS13, §1.1, pp. 4–5: Lists blocks (i)–(iv) for p ≥ 5 and associates ρ̄ to each block through Breuil's semisimple mod p correspondence.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.5/blocks`, `PadicLocalLanglandsForGL2Qp:R30.3/montreal-on-irreducibles`, `PadicLocalLanglandsForGL2Qp:R30.2/modp-principal-series`, `PadicLocalLanglandsForGL2Qp:R30.2/modp-irreducibles`.

### Projective envelopes P̃ and Paškūnas's axiomatic framework

**Target `R30.5/projective-envelope` (construction).** Let π be an irreducible object of Mod^{l.fin}_{G,ζ}(O) with End_G(π) = k, S = π^∨, and P̃ ↠ S a projective envelope in C(O) (R30.2/pontryagin-dual-category); Ẽ := End_{C(O)}(P̃) is a local, pseudo-compact (hence compact, k being finite) ring with residue field k. Suppose Q ∈ C(k) of finite length satisfies (H1) Hom_{C(k)}(Q, S') = 0 for irreducible S' ≇ S; (H2) S occurs in Q with multiplicity 1; (H3) Ext¹_{C(k)}(Q, S') = 0 for S' ≇ S; (H4) Ext¹_{C(k)}(Q, S) finite-dimensional; (H5) Ext²_{C(k)}(Q, rad Q) = 0; (H0) Hom_{C(k)}(P̃[ϖ], rad Q) = 0. Then the natural topology on Ẽ is the 𝔪-adic one, P̃ is flat over Ẽ and k ⊗̂_{Ẽ} P̃ ≅ Q; the functor M ↦ Hom_{C(O)}(P̃, M) relates C(O) to compact Ẽ-modules, and V̌(P̃) carries a natural action of Ẽ (R30.3/montreal-functor). For a block, P_B = ⊕_{π∈B} P̃_π. The envelope condition is essential epimorphism from a projective object of C(O). Reuse the categorical vocabulary now present in Tau Ceti; no assertion of projectivity is transported from the underlying O-module category.

**Hypotheses.**

- π irreducible with End = k (after enlarging k); hypotheses (H0)–(H5) for the flatness statements.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Blocks`, namespace `TauCeti.ProjEnvelope`.

**Uses.**

- Paškūnas 2013, Theorem 1.6: Ẽ_B ≅ R^{ζε}_ρ for supersingular B
- Paškūnas 2015, §2: M(Θ) = (Hom^{cont}_{O[[K]]}(P̃, Θ^d))^d gives the Breuil–Mézard modules
- Nakamura 2023, Theorem B.24 and Proposition B.26: End(P̃^ψ) ≅ R^{ψε}_{ρ̄(ε)} and P̃ ≅ π\*_{π̄}

**API.**

- `ProjEnvelope.P` (constructor): P̃ ↠ π^∨, a projective envelope in C_{G,ζ}(O).
- `ProjEnvelope.endRing` (constructor): Ẽ = End_{C(O)}(P̃), local compact with residue field k.
- `ProjEnvelope.isProjectiveCover` (compatibility): P̃ → π^∨ is a projective cover in the sense of Tau Ceti's IsProjectiveCover, transported to C(O).
- `ProjEnvelope.flat` (characterisation): Under (H0)–(H5), P̃ is flat over Ẽ and k ⊗̂_Ẽ P̃ ≅ Q.
- `ProjEnvelope.topology` (characterisation): Under (H0)–(H5), the natural topology of Ẽ is 𝔪-adic.
- `ProjEnvelope.Vcheck_action` (functoriality): Ẽ acts on V̌(P̃) and V̌ is compatible with ⊗̂_Ẽ.

**Proof route.**

- Existence of projective envelopes: duals of injective envelopes (R30.2/pontryagin-dual-category).
- Locality and pseudo-compactness of Ẽ: Paškūnas 2013 §2.
- Under (H0)–(H5): Proposition 3.8 and its corollaries (Proposition 1.12 in the introduction) prove the coincidence of topologies, flatness and k ⊗̂ P̃ ≅ Q.

**Checks.**

- `ProjEnvelope.top` (characterisation): Hom_{C(O)}(P̃, S') = 0 for irreducible S' ≇ S and Hom(P̃, S) = k.
- `ProjEnvelope.residue` (computation): Ẽ/𝔪 = End(S) = k.
- `ProjEnvelope.not_finite_length` (non-example): P̃ is not of finite length in C(O) (it surjects onto the duals of all finite length objects with cosocle S).
- `ProjEnvelope.zero` (degenerate): Hom_{C(O)}(P̃, 0) = 0, and P̃ ≠ 0.

**Acceptance.**

- For G pro-p and π trivial (Paškūnas's example), Ẽ is the completed group algebra.
- P̃ is not of finite length.

**Sources.**

- PASKUNAS13, §1.2, pp. 6–8: hypotheses (H0)–(H5), Proposition 1.12, Remark 1.13; §§2–3, Proposition 3.8: Sets up P̃ ↠ S in C(O), shows Ẽ = End(P̃) is local and compact, states hypotheses (H0)–(H5) on a finite length Q and proves the topology on Ẽ is 𝔪-adic, P̃ flat over Ẽ and k ⊗̂_Ẽ P̃ ≅ Q.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.2/pontryagin-dual-category`, `PadicLocalLanglandsForGL2Qp:R30.5/blocks`, `PadicLocalLanglandsForGL2Qp:R30.3/montreal-functor`.

### The pseudodeformation ring R^{ps,δ}_B of a block

**Target `R30.5/block-pseudodeformation-ring` (construction).** For a block B and its semisimple residual Galois representation ρ̄_B, let δ lift the central character and d=δε. Define R_B^{ps,δ} as the completed universal degree-two determinant-law ring for G_{ℚ_p}, at the residual determinant of ρ̄_B, with determinant character fixed to d. Its universal data are the trace T and determinant d satisfying the degree-two determinant identities over every coefficient ring, including p=2. For p>2 trace alone can encode these data; at p=2 the trace-only pseudocharacter definition is not used. The Cayley–Hamilton quotient is R_B^{ps,δ}[[G_{ℚ_p}]] modulo the closed ideal generated by g²−T(g)g+d(g). This specialises the existing IHG determinant-law and universal Cayley–Hamilton constructions rather than developing a second general pseudodeformation theory.

**Hypotheses.**

- G_{ℚ_p} satisfies Mazur's finiteness condition Φ_p; for p = 2 use determinants (IHG.0/determinant-trace-bijective-small does not apply).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Blocks`, namespace `TauCeti.BlockPsRing`.

**Uses.**

- LocalGaloisDeformationRings R08.3/weil-deligne-type-ring: R_{B,M} is a quotient of R^{ps,δ_M}_B[1/p]
- CDN 2023, Théorème 1.16: ι^δ_B : R^{ps,δ}_B → Z^δ_B
- LocallyAnalyticCompletedCohomology LA.5: the finite map R^{ps} → Z_B and the functor m

**API.**

- `BlockPsRing.ring` (constructor): R^{ps,δ}_B, complete local noetherian with residue field k.
- `BlockPsRing.universal` (data): The universal degree-two determinant law D_B with determinant character δε, and its trace function T_B on G_{ℚ_p}. At p=2 retain the whole determinant law.
- `BlockPsRing.universal_property` (universal-property): Continuous local O-algebra maps R_B^{ps,δ}→A, for Artinian local A, correspond to degree-two determinant laws lifting the residual law of ρ̄_B and with fixed determinant character δε.
- `BlockPsRing.of_irreducible` (compatibility): If ρ̄_B is absolutely irreducible, R^{ps,δ}_B ≅ R^{δε}_{ρ̄_B} (deformations with fixed determinant).
- `BlockPsRing.cayleyHamilton` (constructor): R^{ps,δ}_B[[G_{ℚ_p}]]/J, the Cayley–Hamilton quotient.

**Proof route.**

- Use IHG’s GL₂ determinant-law/pseudocharacter equivalence over arbitrary rings, complete at the residual determinant law, and impose d=δε by its closed ideal.
- Use the pro-representability/noetherian input for this local Galois group and the fixed determinant specialisation, as stated in Paškūnas–Tung. At p=2 do not invoke the trace comparison requiring 2 invertible.
- Take IHG’s universal Cayley–Hamilton algebra with the specified coefficients. The fixed-determinant local specialisation is the extension requested from R08; the generic ring construction already belongs to IHG.

**Checks.**

- `BlockPsRing.residue` (computation): R^{ps,δ}_B ⊗ k = k and T^δ_B mod 𝔪 = tr ρ̄_B.
- `BlockPsRing.supersingular` (compatibility): For B = {π} supersingular, R^{ps,δ}_B ≅ R^{δε}_{V(π)}.
- `BlockPsRing.not_framed` (non-example): R^{ps,δ}_B is not the framed fixed-determinant deformation ring of ρ̄_B: for generic ρ̄_B = χ₁ ⊕ χ₂ it has relative dimension 3 over O, whereas R^{□,δε}_{ρ̄_B} has relative dimension 6.
- `BlockPsRing.det_fixed` (degenerate): The universal determinant of T^δ_B is the constant character δε.

**Acceptance.**

- For B = {π} supersingular, R^{ps,δ}_B is the universal deformation ring R^{δε}_{ρ̄} of the irreducible ρ̄ = ρ̄_B (Paškūnas 2013 Appendix A).
- R^{ps,δ}_B/𝔪 = k.

**Sources.**

- PASKUNAS13, §1.1, p. 5; Appendix A, pp. 148–150: Defines R^{ps,ζε}_{tr ρ̄}, the universal deformation ring of two-dimensional pseudocharacters with determinant ζε lifting tr ρ̄.
- CDN23, Théorème 1.16, p. 20: Uses R^{ps,δ}_B with its universal pseudocharacter T^δ_B.
- PASKUNAS-TUNG21, §1, pp. 2–3: Defines R^{ps,ζε}_{tr ρ̄}, the universal pseudorepresentation T and the Cayley–Hamilton quotient R^{ps}[[G_{ℚ_p}]]/J, noetherian by Chenevier.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.5/blocks-classification`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-dimension-two`, `IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-determinant`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-gln-pseudocharacter`, `IntegralHeckeAndGaloisDeterminants:IHG.1/universal-reductive-pseudocharacter-ring`, `IntegralHeckeAndGaloisDeterminants:IHG.1/universal-cayley-hamilton-algebra`.

### Paškūnas: endomorphism rings of projective envelopes are deformation rings

**Target `R30.5/paskunas-endomorphism-rings` (theorem).** Assume p ≥ 5 (and for (iii) p = 2 with B of type (i) or (ii)). (i) For every block B, the centre of Ẽ_B, hence of Mod^{l.fin}_{G,ζ}(O)_B, is naturally isomorphic to R^{ps,ζε}_{tr ρ̄_B}; Ẽ_B is finitely generated over its centre and is a matrix algebra over it after localising away from the reducible locus. (ii) If B = {π} with π supersingular, V(J_B)^∨(ζε) ≅ ρ^{un} and Ẽ_B ≅ R^{ζε}_ρ, ρ = V(π); if B is of type (ii), V(J_B)^∨(ζε) ≅ ρ₁^{un} ⊕ ρ₂^{un} and Ẽ_B ≅ End_{G_{ℚ_p}}(ρ₁^{un} ⊕ ρ₂^{un}), ρ₁, ρ₂ the non-split extensions. (iii) (p = 2, Paškūnas 2016) for B of types (i), (ii) the centre of Mod^{l.adm}_{G,ψ}(O)[B] is R^{ps,ψ} and, for B = {π}, E_B is the fixed-determinant deformation ring of ρ̄^{ss}. (iv) Ban^{adm}_{G,ζ}(L) = ⊕_B Ban^{adm}_{G,ζ}(L)_B; for B containing an absolutely irreducible object, Ban^{adm.fl}_{G,ζ}(L)_B ≅ ⊕_{𝔫 ∈ MaxSpec R^{ps}[1/p]} Ban^{adm.fl}_{G,ζ}(L)_{B,𝔫}, the 𝔫-part anti-equivalent to finite length modules over the 𝔫-adic completion of Ẽ_B[1/p]; when T_𝔫 is the trace of an absolutely irreducible V this is finite length modules over the completion of R^{ps}[1/p], with the unique irreducible Π_𝔫 the non-ordinary Π with V(Π_𝔫) ≅ V; when T_𝔫 = ψ₁ + ψ₂, the irreducibles are subquotients of the two unitary principal series. (v) For Π absolutely irreducible non-ordinary with V = V(Π), Ban^{adm.fl}_{G,ζ}(L)_Π is a direct summand equivalent to finite length R^{ζε}_V-modules via B ↦ Hom(V^u, V̌(B)).

**Hypotheses.**

- p ≥ 5 for (i), (ii), (iv), (v) (Paškūnas 2013); p = 2 and blocks (i), (ii) for (iii) (Paškūnas 2016); the remaining primes and blocks are covered by R30.5/local-r-equals-t.

**Proof route.**

- Verify (H0)–(H5) for Q built from π (R30.5/projective-envelope) by Ext computations in the block (Paškūnas 2013 §§6–10), giving Ẽ local with 𝔪-adic topology.
- V̌ gives Ẽ → R^{ζε}_ρ (or End of the universal deformations) for the generic blocks; it is an isomorphism by comparing graded rings (§§6, 8).
- Non-generic blocks: Cayley–Hamilton quotients and the centre (§§9–10).
- Banach representations: §§4, 11 and Proposition 1.8, Corollary 1.9, Theorems 1.10–1.11 by the Chinese remainder theorem over MaxSpec R^{ps}[1/p].

**Acceptance.**

- For B = {π} supersingular and p ≥ 5, Ẽ_B ≅ R^{ζε}_ρ is commutative.
- For generic reducible B, Ẽ_B is not commutative but its centre is R^{ps}.

**Sources.**

- PASKUNAS13, Theorems 1.4–1.7, Proposition 1.8, Corollary 1.9, Theorems 1.10–1.11, pp. 4–6: For p ≥ 5: blocks and their Banach parts are direct summands; the centre of Ẽ_B is R^{ps,ζε}_{tr ρ̄}; Ẽ_B ≅ R^{ζε}_ρ for supersingular blocks and End(ρ₁^{un} ⊕ ρ₂^{un}) for generic reducible blocks; the 𝔫-adic decomposition of finite length Banach representations.
- PASKUNAS16, Theorems 1.2–1.3 and Corollary 1.4, p. 3: For p = 2 and blocks of types (i), (ii): E_B is the fixed-determinant deformation ring of ρ̄^{ss} for supersingular blocks, the centre is R^{ps,ψ}, and V̌ gives the bijection with Galois representations.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.5/projective-envelope`, `PadicLocalLanglandsForGL2Qp:R30.5/block-pseudodeformation-ring`, `PadicLocalLanglandsForGL2Qp:R30.5/blocks-classification`, `PadicLocalLanglandsForGL2Qp:R30.3/montreal-functor`, `PadicLocalLanglandsForGL2Qp:R30.2/admissible-unitary-banach`, `LocalGaloisDeformationRings:R08.1/local-forget-framing`, `LocalGaloisDeformationRings:R08.1/local-fixed-determinant`.

### The local R = T theorem for every block (Paškūnas–Tung)

**Target `R30.5/local-r-equals-t` (theorem).** For every p and every block B with central character ζ (over k after enlarging it): (i) there is an O-algebra map υ : R^{ps,ζε}_{tr ρ̄_B} → Z_B such that for all τ ∈ Mod^{l.fin}_{G,ζ}(O)_B and g ∈ G_{ℚ_p}, V̌(c_τ(υ(T(g)))) = ρ_{V̌(τ^∨)}(g) + ρ_{V̌(τ^∨)}(g^{−1})ζε(g) in End^{cont}_{G_{ℚ_p}}(V̌(τ^∨)); equivalently (CDN) the unique ι^δ_B : R^{ps,δ}_B → Z^δ_B with ι^δ_B(T^δ_B(g)) = g + δε(g)g^{−1} in End(V(π)) for all π ∈ B. (ii) Z_B and E_B are finitely generated R^{ps}-modules; Z_B is noetherian, complete local with residue field k, O-torsion free with Z_B[1/p] normal. (iii) υ[1/p] : R^{ps}[1/p] ≅ Z_B[1/p]; if p ≥ 5, ι^δ_B is an isomorphism; if p = 3, Z_B = R^{ps}/(O-torsion); if p = 2, the cokernel of R^{ps}/(O-torsion) → Z_B is killed by 2. (iv) The essential image of Mod^{l.fin}_{G,ζ}(O)_B under V̌ is anti-equivalent to pseudo-compact (R^{ps}[[G_{ℚ_p}]]/J)_{tf}-modules. The universal character identity holds for every object of the block, through its central action, not only its irreducible specialisations.

**Hypotheses.**

- All p; B any block (after a finite extension of k).

**Proof route.**

- Construct υ (the main point of Paškūnas–Tung, by a new argument covering the exceptional blocks) using V̌ of P_B and Cayley–Hamilton algebras.
- Finiteness (Theorem 1.3) by bounding E_B over R^{ps}, using Chenevier's noetherianity of R^{ps}.
- Isomorphism after inverting p and the p = 2, 3 defects (Theorem 1.4); Corollary 1.5 for the properties of Z_B.
- CDN 2023 Théorème 1.16 restates (i)–(iii) with the explicit identity ι^δ_B(T^δ_B(g)) = g + δε(g)g^{−1}.

**Acceptance.**

- For B = {π} supersingular and p ≥ 5, ι^δ_B is the isomorphism R^{ζε}_ρ ≅ Ẽ_B of R30.5/paskunas-endomorphism-rings.
- At p = 2 the map R^{ps} → Z_B need not be surjective; its cokernel is 2-torsion.

**Sources.**

- PASKUNAS-TUNG21, Theorems 1.1–1.4 and Corollary 1.5, pp. 2–4: Constructs υ : R^{ps,ζε}_{tr ρ̄} → Z_B compatible with V̌, proves Z_B and E_B finite over R^{ps}, R^{ps}[1/p] ≅ Z_B[1/p], Z_B = R^{ps}_{tf} for p ≠ 2 with a 2-torsion cokernel for p = 2, and describes the essential image of V̌.
- CDN23, Théorème 0.17, p. 11; Théorème 1.16, p. 20: The unique ι^δ_B : R^{ps,δ}_B → Z^δ_B with ι^δ_B(T^δ_B(g)) = g + δε(g)g^{−1} in End(V(π)): an isomorphism for p ≥ 5, after inverting p in general, with the p = 3 and p = 2 statements.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.5/block-pseudodeformation-ring`, `PadicLocalLanglandsForGL2Qp:R30.5/blocks`, `PadicLocalLanglandsForGL2Qp:R30.5/projective-envelope`, `PadicLocalLanglandsForGL2Qp:R30.5/paskunas-endomorphism-rings`, `PadicLocalLanglandsForGL2Qp:R30.3/montreal-functor`.

### Kisin: deformations of π̄ and of ρ̄ coincide

**Target `R30.5/kisin-deformation-comparison` (theorem).** Let ρ̄ : G_{ℚ_p} → GL₂(𝔽) satisfy ρ̄ ≇ χ ⊗ (1 \*; 0 ε) for every character χ. (i) (Colmez) There is a finite length object π̄ of Mod^{adm}_G(𝔽), unique up to isomorphism, with MF(π̄) ≅ ρ̄, central character det(ρ̄)ε, and no nonzero finite-dimensional subobject or quotient. (ii) (Kisin) If moreover p ≥ 3 and End_{𝔽[G_{ℚ_p}]}(ρ̄) = 𝔽, the deformation functors Def(π̄) (orthonormalizable admissible deformations to complete local O-algebras) and Def(ρ̄) are representable and MF : Def(π̄) → Def(ρ̄) is an isomorphism; on a deformation π the centre acts through det(MF(π))ε; the same holds with fixed central character ψ and fixed determinant ψε^{−1}. (iii) (Emerton) Under (i) only, MF induces a fully faithful embedding Def\*(π̄) ↪ Def(ρ̄), an equivalence on the closed formal subfunctors Def^{crys} obtained by schematic closure of crystalline characteristic-zero points.

**Hypotheses.**

- ρ̄ not a twist of a non-split extension of ε by 1 in the stated direction; (ii) needs p ≥ 3 and End(ρ̄) = 𝔽.
- The excluded residual shape includes the split case; fixed central character ψ corresponds in MF convention to determinant ψε^{-1}.

**Proof route.**

- Use Emerton Assumption 3.3.1 and Theorem 3.3.2 for the unique finite-length object with no finite-dimensional subobject or quotient. The excluded extension shape includes the split extension.
- For the full deformation comparison use the representability and closed-immersion argument of Kisin §1.6, with schematic closure, as recorded in G9. Lemma (1.6.6) bounds Krull dimension by two; it is not a module-rank bound.
- For the crystalline-closure statement use Emerton Theorem 3.3.13 and Remark 3.3.14 with their actual formal subfunctors.

**Acceptance.**

- For ρ̄ absolutely irreducible, π̄ is the supersingular π with V(π) ≅ ρ̄(ε) normalisations as in R30.3/montreal-functor, and Def(π̄) ≅ Def(ρ̄).

**Sources.**

- EMERTON-LG, Assumption 3.3.1 and Theorem 3.3.2, p. 24; Definitions 3.3.6–3.3.11 and Theorem 3.3.13, pp. 25–26: For ρ̄ not of the form χ ⊗ (1 \*; 0 ε) there is a unique finite length π̄ with MF(π̄) ≅ ρ̄, central character det(ρ̄)ε and no finite-dimensional subobject or quotient; MF gives a fully faithful Def\*(π̄) ↪ Def(ρ̄), an equivalence on crystabelline loci.
- NAKAMURA23, Theorem B.18, Definition B.19, Theorem B.20, Remark B.21, Definition B.22, pp. 98–99 (arXiv): Restates Colmez's π̄ and Kisin's theorem that MF : Def(π̄) → Def(ρ̄) is an isomorphism for p ≥ 3 and End(ρ̄) = 𝔽, with the centre acting by det(MF(π))ε, and the fixed-determinant variants.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.3/ext1-injectivity`, `PadicLocalLanglandsForGL2Qp:R30.3/montreal-functor`, `PadicLocalLanglandsForGL2Qp:R30.3/montreal-on-irreducibles`, `PadicLocalLanglandsForGL2Qp:R30.1/trianguline-representation`, `LocalGaloisDeformationRings:R08.1/local-forget-framing`.

### P̃ is the dual of the universal deformation of π̄

**Target `R30.5/dual-of-universal-deformation` (theorem).** Assume p ≥ 5, End(ρ̄) = 𝔽, ρ̄ ≇ χ ⊗ (ε \*; 0 1) and ρ̄ ≇ χ ⊗ (1 \*; 0 ε). Let π̄ be as in R30.5/kisin-deformation-comparison, π_{π̄} its universal deformation over R_ρ̄ (and π^ψ_{π̄} with central character ψ over R^{ψε^{−1}}_ρ̄), and P̃^ψ, P̃ the projective envelopes of the dual of the socle in C^ψ(O), C(O). (i) For A ∈ Comp(O) and a deformation π with central character ψ, the A-dual π\* lies in C^ψ(O) and V̌(π\*) ≅ MF(π)(ε). (ii) (Paškūnas) V̌ induces End_{C^ψ(O)}(P̃^ψ) ≅ R^{ψε}_{ρ̄(ε)}, P̃^ψ is flat over it and V̌(P̃^ψ) is the universal deformation. (iii) There are G-equivariant topological isomorphisms P̃^ψ ≅ (π^ψ_{π̄})\*, R^{ψε^{−1}}_ρ̄-linear, and P̃ ≅ π\*_{π̄}, R_ρ̄-linear; with R_ρ̄ ≅ R^{ψε^{−1}}_ρ̄ ⊗̂ Λ and P̃ ≅ P̃^ψ ⊗̂ (1^{univ}∘det^{−1}), R_ρ̄ ≅ End_{C(O)}(P̃).

**Hypotheses.**

- p ≥ 5; End(ρ̄) = 𝔽; ρ̄ not a twist of (ε \*; 0 1) nor of (1 \*; 0 ε).

**Proof route.**

- (i): Lemma B.23, from the definition of V̌ and Pontryagin duality.
- (ii): Theorem B.24, quoting Paškūnas 2013 (R30.5/paskunas-endomorphism-rings).
- (iii): Lemma B.25 and Proposition B.26: compare the universal properties of P̃^ψ (projectivity, Hom(P̃^ψ, −) on the dual category) and of π^ψ_{π̄} through Kisin's isomorphism Def(π̄) ≅ Def(ρ̄); twist away the central character with the universal character of the centre (CEGGPS Theorem 6.18 as quoted).

**Acceptance.**

- The reduction of P̃ modulo 𝔪_{R_ρ̄} is π̄^∨.

**Sources.**

- NAKAMURA23, Lemma B.23, Theorem B.24, Lemma B.25, Proposition B.26, pp. 100–103 (arXiv): The dual of a deformation lies in C^ψ(O) with V̌(π\*) ≅ MF(π)(ε); End(P̃^ψ) ≅ R^{ψε}_{ρ̄(ε)} under p ≥ 5, End(ρ̄) = 𝔽 and ρ̄ ≇ χ ⊗ (ε \*; 0 1); P̃^ψ ≅ (π^ψ_{π̄})\* and P̃ ≅ π\*_{π̄} as G-equivariant topological isomorphisms.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.5/kisin-deformation-comparison`, `PadicLocalLanglandsForGL2Qp:R30.5/paskunas-endomorphism-rings`, `PadicLocalLanglandsForGL2Qp:R30.5/projective-envelope`.

### Removing P̃ from Hom

**Target `R30.5/removing-projective-envelope` (theorem).** Under the hypotheses of R30.5/dual-of-universal-deformation, for every compact R_ρ̄-module M the map M → Hom_{C(O)}(P̃, P̃ ⊗̂_{R_ρ̄} M), m ↦ (v ↦ v ⊗̂ m), is a topological R_ρ̄-linear isomorphism; consequently, for compact R_ρ̄-modules M₁, M₂, f ↦ id_{P̃} ⊗ f is an R_ρ̄-linear isomorphism Hom^{cont}_{R_ρ̄}(M₁, M₂) ≅ Hom^{cont}_{R_ρ̄[G]}(P̃ ⊗̂ M₁, P̃ ⊗̂ M₂).

**Hypotheses.**

- As in R30.5/dual-of-universal-deformation.

**Proof route.**

- P̃ is projective in C(O) and flat over R_ρ̄ = End(P̃) (R30.5/dual-of-universal-deformation, R30.5/projective-envelope); Hom(P̃, P̃ ⊗̂ M) commutes with inverse limits of finite length M and equals End(P̃) ⊗̂ M = M (Lemma B.27).
- Corollary B.28 follows by applying Lemma B.27 to M₂ and composing.

**Acceptance.**

- For M = R_ρ̄ this recovers End(P̃) = R_ρ̄.

**Sources.**

- NAKAMURA23, Lemma B.27 and Corollary B.28, p. 104 (arXiv): For compact R_ρ̄-modules M the map M → Hom_{C(O)}(P̃, P̃ ⊗̂ M) is a topological isomorphism, and f ↦ id ⊗ f identifies Hom_{R_ρ̄} with Hom_{R_ρ̄[G]} of the completed tensor products.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.5/dual-of-universal-deformation`, `PadicLocalLanglandsForGL2Qp:R30.5/projective-envelope`.

### The Breuil–Mézard cycle identity for ρ̄

**Target `R30.5/breuil-mezard-cycles` (definition).** Fix ρ̄:G_{ℚ_p}→GL₂(k) and the framed universal lifting ring R^□. Throughout this packet the type determinant is det=ψε, so for Hodge–Tate weights a<b require ψ|_I=ε^{a+b−1}det τ and ψε lifting det ρ̄. Let R^{□,ψ}(w,τ) and R^{□,ψ,cr}(w,τ) be the reduced O-torsion-free type quotients. When nonzero their absolute Krull dimension is 5, with generic fibre dimension 4 and special fibre dimension 4. If End ρ̄=k, the corresponding unframed type quotient has absolute dimension 2, generic fibre dimension 1 and special fibre dimension 1; adjoining three framing variables recovers the framed ring. The cycle identity asks for effective cycles C_σ(ρ̄) in Z₄(R^{□,ψ}/ϖ), independent of w,τ, whose sum with coefficients m_σ(w,τ) (respectively m^cr_σ) is the cycle of the potentially semistable (respectively crystalline) special fibre. Here Z_d(A) is the free group on primes with dim A/𝔭=d, and z_d(M) weights them by local module length. Taking Hilbert–Samuel multiplicities gives the numerical identity. Paškūnas 2015 instead labels the fixed determinant itself ψ_source; his ψ_source equals this packet’s ψε. Generic R08 type rings are reused; the missing all-prime fixed-determinant specialisation is G13.

**Hypotheses.**

- ρ̄ continuous; L large enough; framed or (when End ρ̄ = k) unframed rings, with the determinant normalisation of the source fixed explicitly.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/BreuilMezard`, namespace `TauCeti.BMCycles`.

**Uses.**

- Paškūnas 2015, Theorem 1.1: the cycle identity for p ≥ 5 and End ρ̄ = k
- Tung 2021, Theorem 1.2: the cycle identity for every ρ̄ when p > 2
- GL2ModularityLifting R32.2: patching multiplicities are compared with Σ m_σ μ_σ

**API.**

- `BMCycles.typeRing` (constructor): R^{□,ψ}(w, τ) and R^{□,ψ,cr}(w, τ) as quotients of R^{□,ψ}_ρ̄ (imported).
- `BMCycles.cycle` (constructor): z_d(M) ∈ Z_d(R) for a finite R-module M of dimension ≤ d.
- `BMCycles.Holds` (characterisation): BMCycles.Holds ρ̄ :⇔ there are C_σ(ρ̄) with z_4(R^{□,ψ}(w,τ)/ϖ) = Σ m_σ(w,τ)C_σ and the crystalline analogue for all (w, τ).
- `BMCycles.numerical_of_cycle` (relation): The cycle identity implies e(R^{□,ψ}(w,τ)/ϖ) = Σ m_σ(w,τ)e(C_σ).
- `BMCycles.normalisation_dictionary` (compatibility): Use det=ψε and ψ|_I=ε^{a+b−1}det τ throughout. Paškūnas 2015 ψ_source=ψε; Kisin k=b−a+1 after a determinant twist; Tung reverses the ordered pair to (b,a). Framing adds three variables when End ρ̄=k.
- `BMCycles.cycle_nonneg` (relation): Each C_σ(ρ̄) is effective (nonnegative coefficients).

**Proof route.**

- Reuse the R08 universal lifting and potentially semistable type-ring constructions. Their fixed-determinant p∤2 contract does not cover p=2; use the rank-two specialisation specified in G13.
- Use the cycle and Hilbert–Samuel APIs of R03; O-flatness lowers the special-fibre dimension by one. Framing adds three variables in the scalar-endomorphism case.
- The independence of type is the Breuil–Mézard property, proved only in the subsequent case theorems. The zero ring contributes zero cycles.

**Checks.**

- `BMCycles.zero_ring` (degenerate): If R^{□,ψ}(w, τ) = 0 then Σ_σ m_σ(w, τ)C_σ(ρ̄) = 0, so every σ with m_σ(w, τ) > 0 has C_σ(ρ̄) = 0.
- `BMCycles.weight_two_crystalline` (computation): For (w, τ) = ((0,1), 1) the crystalline identity has exactly one term, σ = trivial.
- `BMCycles.cycle_vs_multiplicity` (non-example): The numerical identity does not imply the cycle identity: distinct cycles can have equal Hilbert–Samuel multiplicities.
- `BMCycles.frame_independence` (characterisation): The cycle identity for R^{□,ψ} and for R^ψ_ρ̄ (End ρ̄ = k) are equivalent, the framed ring being formally smooth of relative dimension 3 over the unframed one.

**Acceptance.**

- For w = (0, 1) and τ trivial, the crystalline identity reads z_4(R^{□,ψ,cr}(0,1; 1)/ϖ) = C_{triv}(ρ̄).
- If no Serre weight σ of ρ̄ occurs in σ̄(w, τ), the identity forces R^{□,ψ}(w, τ) = 0.

**Sources.**

- PASKUNAS15, §1, pp. 2–3: the p-adic Hodge type, Henniart's σ(τ), the cycle groups z_d and Theorem 1.1: Fixes p-adic Hodge types (w, τ, ψ) with ψ|_I = ε^{a+b}det τ, the multiplicities m_σ(w, τ), the cycles z_d(M) = Σ ℓ(M_𝔭)𝔭, and states the cycle identity z₁(R^ψ_ρ̄(w, τ)/ϖ) = Σ m_σ(w, τ)z(σ, ρ̄).
- TUNG21A, Conjecture 1.1 and Theorem 1.2, pp. 3–4: States the numerical Breuil–Mézard conjecture e(R^{□,ψ}_r̄(λ, τ)/ϖ) = Σ m_σ̄(λ, τ)μ_σ̄(r̄) and its cycle version with 4-dimensional cycles C_σ̄(r̄), with det r = ψε and ψ|_I = ε^{a+b−1}det τ.
- KISIN09, Proposition (1.1.1), published p.645; §1.1, (1.1.2)–(1.1.5), pp.645–646: The fixed-determinant framed type ring has generic fibre dimension four; the weight/type convention is det=ψε.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.4/henniart-types`, `LocalGaloisDeformationRings:R08.1/local-lifting-ring`, `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`, `LocalGaloisDeformationRings:R08.3/pst-generic-fibre`, `DeformationAndDerivedPatchingAlgebra:R03.6/cycle-specialization-multiplicity`, `DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity`.

### Paškūnas's criterion: supports of M(Θ) and the cycle formula

**Target `R30.5/paskunas-cycle-criterion` (theorem).** Let R be a commutative complete local noetherian O-algebra with residue field k, N a compact R[[K]]-module with k completed-tensored_R N finite over O[[K]], and V a finite-dimensional continuous K-representation with invariant lattice Θ. Put M(Θ)=Hom^{cont}_{O[[K]]}(N,Θ^d)^d, a=Ann_R M(Θ), d=dim M(Θ). Assume N projective in Mod_K^{pro}(O), R/a equidimensional with all associated primes minimal, and a dense set Σ of closed generic points of Supp M(Θ) such that dim_{κ(n)}Hom_K(V,Π(κ(n)))=1 and dim_{κ(n)}Hom_K(V,Π(R_n/n²))≤d. Then R/a is reduced of dimension d, and z_{d−1}(R/(ϖ,a))=Σ_σ m_σ z_{d−1}(M(σ)). For N=P̃ and a scalar-endomorphism residual representation, the type support computation and the additional projectivity/Cohen–Macaulay inputs identify this quotient with the appropriate potentially semistable or crystalline ring. In Proposition 4.14 the potentially semistable occurrence implication has the stated full scope, while the crystalline iff additionally excludes ρ̄≅(δε \*;0 δ). The final ring equality is Corollary 6.5; it is not obtained by dropping that exception in Proposition 4.14. The noncommutative block ring E_B is not an arbitrary allowed choice for commutative R.

**Hypotheses.**

- (a)–(c) as stated; for the application p ≥ 5, End ρ̄ = k and ρ̄ ≇ (ε \*; 0 1) ⊗ η for the local freeness.

**Proof route.**

- Theorem 2.42: compact Hom duality gives finite M(Θ); generic rank one and the infinitesimal Hom bound imply reducedness. Projectivity gives exact reduction to the finite-length K-module and hence the cycle formula.
- Use Theorem 2.44 for projectivity and Cohen–Macaulay/equidimensional hypotheses: R Cohen–Macaulay, N R-flat, and projdim_{O[[P]]}(k completed-tensored_R N)+max_σ dim M(σ)≤dim R for a pro-p Sylow P⊂K. This nonroutine application is G14.
- Use Proposition 4.14 with its exception intact, then the deformation-ring and algebraic-vector arguments of Corollary 6.5 to obtain the full final type-ring equality.

**Acceptance.**

- For σ irreducible with Hom_K(σ, π) ≠ 0, the Hilbert–Samuel multiplicity of M(σ) is 1 (Theorem 6.6).

**Sources.**

- PASKUNAS15, §2.1 setup; Theorems 2.42–2.44, p.16; Proposition 4.14, p.23; Corollary 6.5, p.31: Gives the commutative-ring cycle criterion and its projectivity/CM hypotheses; the intermediate crystalline support iff excludes the cyclotomic extension shape.
- NAKAMURA23, §4.3, Theorem 4.7, p. 67 (arXiv): For p ≥ 5, End ρ̄_p = 𝔽 and ρ̄_p ≇ (ε \*; 0 1) ⊗ η: R_p/Ann(M^⋄_0(k, τ)) = R^⋄_p(k, τ) for ⋄ ∈ {st, cr}, with M^cr locally free of rank one over R^cr[1/p] and M^st locally free of rank one off the crystalline locus.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.5/projective-envelope`, `PadicLocalLanglandsForGL2Qp:R30.5/breuil-mezard-cycles`, `PadicLocalLanglandsForGL2Qp:R30.5/paskunas-endomorphism-rings`, `PadicLocalLanglandsForGL2Qp:R30.4/kisin-hypothesis`, `PadicLocalLanglandsForGL2Qp:R30.4/locally-algebraic-vectors`, `PadicLocalLanglandsForGL2Qp:R30.4/henniart-types`, `DeformationAndDerivedPatchingAlgebra:R03.6/cycle-specialization-multiplicity`.

### Kisin rings from the classical correspondence (Colmez–Dospinescu–Nizioł)

**Target `R30.5/kisin-ring-from-langlands` (construction).** Let M be an irreducible (φ, N, G_{ℚ_p})-module of rank 2, a < b integers with LL^{[a,b]}(M) := LL(M) ⊗ Sym^{b−a−1} ⊗ det^a having unitary central character, Λ a G-stable O_L-lattice in it, and B the block of finite length smooth representations determined by a semisimple ρ̄ : G_{ℚ_p} → GL₂(k_L). The B-adic completion Λ_B is the inverse limit of the finite length quotients of Λ all of whose Jordan–Hölder factors lie in B, LL^{[a,b]}_B(M) := L ⊗ Λ_B (independent of Λ), R^{[a,b]}_{M,B} := End_G(LL^{[a,b]}_B(M)) and ρ^{[a,b]}_M := V(LL^{[a,b]}_B(M)). Theorem (CDN, Théorème 0.1): R^{[a,b]}_{M,ρ̄} is commutative, the ring of bounded analytic functions on an analytic open of ℙ¹, algebraically a finite product of principal ideal domains; ρ^{[a,b]}_M is free of rank 2 over it and specialisation x ↦ ρ_x is a bijection between its L'-points and the L'-representations of G_{ℚ_p} with semisimplified residual representation ρ̄ and type (M, a, b) (potentially semistable with Hodge–Tate weights a, b and D_pst ≅ M). This is the GL₂(ℚ_p)-side construction of the rings R_{B,M} planned in LocalGaloisDeformationRings R08.3/weil-deligne-type-ring. The finite product may be empty, giving the zero ring when the type/block locus is empty. The universal property also holds on finite L-algebras as in Theorem 5.8, with its fixed determinant and residual-block convention.

**Hypotheses.**

- M irreducible (so LL(M) supercuspidal); unitary central character; the hidden global ingredient of R30.4/locally-algebraic-vectors (v), i.e. gap G1, through the identification of M with LL(M).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/KisinRings`, namespace `TauCeti.KisinRingLL`.

**Uses.**

- LocalGaloisDeformationRings R08.3/weil-deligne-type-ring: R_{B,M} for supercuspidal M
- CDN 2023, Théorème 0.1: objects in the factorisation of the p-adic étale cohomology of the Drinfeld tower
- CDN-Kisin, Propositions 5.9 and 5.11: a form of the Breuil–Mézard conjecture in the supercuspidal case

**API.**

- `KisinRingLL.completion` (constructor): Λ_B, the B-adic completion of a G-stable lattice.
- `KisinRingLL.ring` (constructor): R^{[a,b]}_{M,B} = End_G(LL^{[a,b]}_B(M)).
- `KisinRingLL.family` (constructor): ρ^{[a,b]}_M = V(LL^{[a,b]}_B(M)).
- `KisinRingLL.ring_comm` (characterisation): R^{[a,b]}_{M,B} is commutative, a finite product of PIDs.
- `KisinRingLL.family_free` (characterisation): ρ^{[a,b]}_M is free of rank 2 over R^{[a,b]}_{M,B}.
- `KisinRingLL.points` (universal-property): L'-points of Spec R^{[a,b]}_{M,B} ↔ L'-representations with semisimplified residual representation ρ̄ and type (M, a, b).

**Proof route.**

- Construct Λ_B and LL^{[a,b]}_B(M) by B-adic completion (CDN-Kisin §2).
- Local R = T (R30.5/local-r-equals-t) shows V(LL_B) is of GL₂ type and gives the R^{ps}-action.
- Use the all-prime Artinian de Rham criterion R30.4/artinian-de-rham-criterion, the formal parameterisation by a filtration line, and Theorem 5.4 to prove the type space smooth of pure dimension one. Corollary 5.5 then gives a finite product of principal ideal domains and rank-two freeness; Theorem 5.8 supplies the Artinian universal property.
- Comparison with Kisin's rings via the universal property of potentially semistable deformation rings (LocalGaloisDeformationRings R08.3).

**Checks.**

- `KisinRingLL.indep_lattice` (characterisation): LL^{[a,b]}_B(M) does not depend on the choice of Λ.
- `KisinRingLL.empty` (degenerate): If no representation of type (M, a, b) has semisimplified residual representation ρ̄, then R^{[a,b]}_{M,B} = 0.
- `KisinRingLL.not_local` (non-example): R^{[a,b]}_{M,B} is in general not local: it is a finite product of principal ideal domains, one factor per component.
- `KisinRingLL.compat_R08` (compatibility): R^{[a,b]}_{M,B} ≅ R_{B,M} of LocalGaloisDeformationRings R08.3/weil-deligne-type-ring after inverting p.

**Acceptance.**

- For ρ̄ generic, the result is compatible with Kisin's rings, up to the ambiguity M versus M ⊗ μ_{−1} (CDN Remarque 0.2(i)).

**Sources.**

- CDNKISIN, Theorem 0.1, pp.1–2; §4.1, Theorem 4.1, pp.13–15; Lemma 5.3 and Theorem 5.4, p.20; Corollaries 5.5–5.7 and Theorem 5.8, pp.21–22: Constructs the block-completed family and proves smoothness, PID decomposition and the universal property for fixed semisimplified residual data, for all p.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.5/local-r-equals-t`, `PadicLocalLanglandsForGL2Qp:R30.5/blocks`, `PadicLocalLanglandsForGL2Qp:R30.4/locally-algebraic-type`, `PadicLocalLanglandsForGL2Qp:R30.4/de-rham-extensions`, `PadicLocalLanglandsForGL2Qp:R30.3/montreal-functor`, `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`, `PadicLocalLanglandsForGL2Qp:R30.4/artinian-de-rham-criterion`.

### Admittance of residual representations by types (BCDT)

**Target `R30.5/admittance` (definition).** Let ℓ be a prime and ρ̄ : G_ℓ → GL₂(𝔽̄_ℓ) continuous. For the irreducible 𝔽̄_ℓ-representations σ_{n,m} of GL₂(ℤ_ℓ), σ'_{m₁,m₂} of U₀(ℓ) and σ'_{{m₁,m₂},a}, σ'_{{m},a} of Ũ₀(ℓ) (R30.2/mod-l-compact-irreducibles), Breuil–Conrad–Diamond–Taylor define when σ admits and simply admits ρ̄, explicitly in terms of ρ̄|_{I_ℓ} through the fundamental characters ω, ω₂, the peu/très ramifié condition, and central characters (ω^{−1}det ρ̄)|_{W_ℓ}; e.g. σ_{n,m} admits ρ̄ iff ρ̄|_{I_ℓ} ≅ ω₂^{1−ℓn−m(ℓ+1)} ⊕ ω₂^{ℓ−n−m(ℓ+1)} or ρ̄|_{I_ℓ} ≅ (ω^{1−m} \*; 0 ω^{−n−m}) (peu ramifié if n = 0), and σ_{n,0} admits ρ̄ iff the Serre weight of ρ̄^∨ ⊗ ω is n + 2. An ℓ-type τ (reducible: σ_τ a representation of GL₂(ℤ_ℓ); irreducible: of U₀(ℓ); extended type τ' with irreducible restriction to I_ℓ: of Ũ₀(ℓ)) admits σ if σ is a Jordan–Hölder constituent of Λ ⊗ 𝔽̄_ℓ for an invariant lattice Λ ⊂ σ_τ, simply if with multiplicity one; τ (simply) admits ρ̄ if it admits some σ that admits ρ̄ (resp. a unique such σ, simply, which simply admits ρ̄). The remaining cases are fixed as follows. Choose exponents in {0,…,ℓ−2}. An Iwahori character σ′_{m₁,m₂} admits ρ̄ when inertia is either the niveau-two pair with exponents 1−ℓm_i−m_j and ℓ−m_i−ℓm_j (m_i≥m_j and {m_i,m_j}={m₁,m₂}), or an extension with diagonal (ω^{1−m₁},ω^{−m₂}), or one with the two exponents interchanged. If m₁≠m₂ it simply admits precisely in the two extension cases; if m₁=m₂ it simply admits precisely for the très ramifié extension. A two-dimensional normaliser representation σ′_{{m₁,m₂},a} admits when its Iwahori restriction admits and its central character is ω^{-1}det ρ̄; it simply admits when that central condition holds and one of the two extension cases holds. The normaliser character σ′_{{m},a} requires Iwahori admittance and the same central condition; in the très ramifié case it additionally requires a quotient of ρ̄ equal to ω^{-m}χ for unramified χ with Frobenius value −a. For this normaliser character simple admittance equals admittance; for σ_{n,m} it also equals admittance. A type simply admits ρ̄ exactly when it has a unique admitted constituent, that constituent occurs with multiplicity one, and the constituent itself simply admits ρ̄.

**Hypotheses.**

- Weight 2 (potentially Barsotti–Tate) types as in BCDT; the definition uses ρ̄ rather than its Cartier dual because of the normalisations of CDT.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Types`, namespace `TauCeti.Admits`.

**Uses.**

- BCDT, Conjecture 1.3.1: admittance predicts the nonvanishing of the potentially Barsotti–Tate deformation rings R^D
- this roadmap R30.5/bcdt-admittance-criterion: the conjecture follows from the Breuil–Mézard cycle identity

**API.**

- `Admits.sigma` (characterisation): σ admits ρ̄: the explicit condition on ρ̄|_{I_ℓ} for each of the families σ_{n,m}, σ'_{m₁,m₂}, σ'_{{m₁,m₂},a}, σ'_{{m},a}.
- `Admits.simply` (characterisation): σ simply admits ρ̄.
- `Admits.type` (characterisation): τ admits ρ̄ iff some constituent of the reduction of σ_τ admits ρ̄.
- `Admits.serreWeight` (compatibility): σ_{n,0} admits ρ̄ iff the Serre weight of ρ̄^∨ ⊗ ω is n + 2.
- `Admits.simply_imp` (relation): Simple admittance implies admittance.

**Proof route.**

- Spell out each case of BCDT §1.3 on the classification of R30.2/mod-l-compact-irreducibles.
- Relate σ_{n,0} admitting ρ̄ to Serre's weight of ρ̄^∨ ⊗ ω (BCDT's parenthetical remark).
- The peu/très ramifié extension predicate and the fundamental-character conventions are required from the local Galois/Serre-weight owner, with the precise outstanding contract G16.

**Checks.**

- `Admits.sigma00` (computation): σ_{0,0} admits ρ̄ iff ρ̄|_{I_ℓ} ≅ (ω \*; 0 1) peu ramifié or ω₂ ⊕ ω₂^ℓ.
- `Admits.sigma_n_m_irreducible` (computation): For ρ̄|_{I_ℓ} ≅ ω₂^{1−ℓn} ⊕ ω₂^{ℓ−n} irreducible, σ_{n,0} admits ρ̄.
- `Admits.tres_ramifie_excluded` (non-example): σ_{0,0} does not admit ρ̄ with ρ̄|_{I_ℓ} ≅ (ω \*; 0 1) très ramifié.
- `Admits.no_type` (degenerate): A type whose reduction has no constituent admitting ρ̄ does not admit ρ̄.

**Acceptance.**

- σ_{0,0} admits ρ̄ iff ρ̄|_{I_ℓ} ≅ (ω \*; 0 1) peu ramifié or ρ̄|_{I_ℓ} ≅ ω₂ ⊕ ω₂^ℓ.
- Simple admittance implies admittance.

**Sources.**

- BCDT01, §1.3, pp. 854–856 (published; pp. 10–12 of Breuil's author copy): Defines, for each irreducible representation of GL₂(ℤ_ℓ), U₀(ℓ) and Ũ₀(ℓ), explicit conditions on ρ̄|_{I_ℓ} for admitting and simply admitting ρ̄, then admittance of ρ̄ by types through Jordan–Hölder constituents of reductions of σ_τ.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.2/mod-l-compact-irreducibles`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/cdt-inertia-multiplicity`.

### BCDT's Conjecture 1.3.1(1) from the Breuil–Mézard identity

**Target `R30.5/bcdt-admittance-criterion` (theorem).** Let p = ℓ, k ⊂ 𝔽̄_p finite, ρ̄ : G_{ℚ_p} → GL₂(k) continuous with centraliser k, τ an ℓ-type (resp. τ' an extended type with irreducible restriction to inertia) with tamely ramified determinant and non-central image. If ρ̄ satisfies the Breuil–Mézard cycle identity (R30.5/breuil-mezard-cycles) and C_σ(ρ̄) ≠ 0 exactly when σ is a Serre weight of ρ̄ in BCDT's sense (σ admits ρ̄), then τ (resp. τ') admits ρ̄ iff R^D_{V,O} ≠ 0 (resp. R^{D'}_{V,O} ≠ 0), i.e. iff ρ̄ has a potentially Barsotti–Tate lift of type τ (resp. extended type τ'). The identity holds for every ρ̄ when p > 2 (R30.6/tung-bm-p-odd) and when p = 2 (R30.6/tung-bm-p-two); Paškūnas 2015 gives C_σ(ρ̄) ≠ 0 iff Hom_K(σ, β) ≠ 0 for Colmez's atom β of ρ̄ when p ≥ 5 and End ρ̄ = k. Part (2) of the conjecture (simple admittance ⇔ acceptability) is not derived here: BCDT's 'acceptable' is a patching-theoretic condition, not a property of R^D alone. For the extended-type assertion the ordinary inertial cycle identity must be replaced by the corresponding extended-type cycle/nonvanishing comparison; this extra hypothesis is part of G3, since an inertial ring need not select an unramified quadratic branch.

**Hypotheses.**

- p = ℓ; the hypotheses of BCDT Conjecture 1.3.1; the identification of {σ : C_σ(ρ̄) ≠ 0} with BCDT's admitted weights (gap G3).
- For extended types, also assume the type-specific nonvanishing/cycle comparison in G3; ordinary inertial-type cycles alone do not distinguish the two unramified quadratic extensions.

**Proof route.**

- For U₀(ℓ)- and Ũ₀(ℓ)-types induce σ_τ to GL₂(ℤ_ℓ): σ' admits ρ̄ iff a constituent of Ind σ' admits ρ̄ (BCDT §1.3).
- By the cycle identity, z(R^D/ϖ) = Σ_σ m_σ(τ)C_σ(ρ̄); since R^D is O-flat, R^D ≠ 0 iff R^D/ϖ ≠ 0 iff some σ with m_σ(τ) > 0 has C_σ(ρ̄) ≠ 0.
- C_σ(ρ̄) ≠ 0 iff σ admits ρ̄: for p ≥ 5, End ρ̄ = k, from Paškūnas 2015 Theorem 1.1(iii) (z(σ, ρ̄) ≠ 0 iff Hom_K(σ, β) ≠ 0) and the K-socle of β; in general this matching of BCDT's explicit list with the cycles is recorded as gap G3.

**Acceptance.**

- Weight 2, τ trivial (crystalline): admittance by σ_{0,0} ⇔ ρ̄ has a crystalline lift with Hodge–Tate weights 0, 1 (finite flat).

**Sources.**

- BCDT01, §1.3, Conjecture 1.3.1, p. 856 (published; p. 12 of the author copy): Conjectures that, for ρ̄ with centraliser k and types with tamely ramified determinant and non-central image, τ admits ρ̄ iff R^D_{V,O} ≠ 0, and simply admits iff acceptable.
- PASKUNAS15, Theorem 1.1 and the paragraph after it, pp. 2–3: z(σ, ρ̄) is nonzero iff Hom_K(σ, β) ≠ 0 for the atom β attached to ρ̄ by Colmez, and then has multiplicity one except in one non-generic case.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.5/admittance`, `PadicLocalLanglandsForGL2Qp:R30.5/breuil-mezard-cycles`, `PadicLocalLanglandsForGL2Qp:R30.4/henniart-types`.

**Remaining work for this layer.**

- Gap G3: match BCDT's admittance with nonvanishing of the cycles C_σ for all ρ̄ and p.
- G1. The supercuspidal case of Π(V)^alg = LL(V) ⊗ Alg(V) has only a global proof
- G3. BCDT's admittance versus nonvanishing of Breuil–Mézard cycles
- G6. Representation-specific finiteness and envelopes
- G9. Schematic deformation comparison
- G11. Inertial K-types with p-adic coefficients
- G12. Gabriel block decomposition and pseudocompact Morita equivalence
- G13. Fixed-determinant potentially semistable rings at p=2
- G14. Projectivity and Cohen–Macaulay input for the cycle criterion
- G15. All-prime Artinian de Rham infinitesimal calculation
- G16. Local Galois predicates in admittance

## R30.6. Local applications and their hypotheses

**Planets:** Paškūnas's Breuil–Mézard theorem (p ≥ 5), Tung's Breuil–Mézard theorem (p odd), Tung's Breuil–Mézard theorem (p = 2), Paškūnas–Tung finiteness.

### Paškūnas 2015: Breuil–Mézard for p ≥ 5 and End ρ̄ = k

**Target `R30.6/paskunas-bm-scalar-endomorphisms` (theorem).** Let p ≥ 5 and ρ̄ : G_{ℚ_p} → GL₂(k) with End_{G_{ℚ_p}}(ρ̄) = k (ρ̄ absolutely irreducible or a non-split extension of two distinct characters), R_ρ̄ its universal deformation ring. For every p-adic Hodge type (w, τ, ψ) in the normalisation of R30.5/breuil-mezard-cycles (det = ψε, ψ|_I = ε^{a+b−1}det τ; Paškūnas’s source ψ equals this ψε): (i) there is a reduced O-torsion-free quotient, of absolute dimension two when nonzero, R^ψ_ρ̄(w, τ) (resp. R^{ψ,cr}_ρ̄(w, τ)) of R_ρ̄ whose L-points are the potentially semistable (resp. crystalline) deformations of type (w, τ, ψ); (ii) for each irreducible smooth k-representation σ of K there is a one-dimensional cycle z(σ, ρ̄) of R_ρ̄, independent of (w, τ), with z₁(R^ψ_ρ̄(w, τ)/ϖ) = Σ_σ m_σ(w, τ)z(σ, ρ̄) and z₁(R^{ψ,cr}_ρ̄(w, τ)/ϖ) = Σ_σ m^cr_σ(w, τ)z(σ, ρ̄); (iii) z(σ, ρ̄) ≠ 0 iff Hom_K(σ, β) ≠ 0, β the atom attached to ρ̄ by Colmez, and then its Hilbert–Samuel multiplicity is 1, except for ρ̄ ≅ (ω \*; 0 1) ⊗ χ with \* peu ramifié, where it is 2. The result is new only for ρ̄ ≅ (ω \*; 0 1) ⊗ χ; the other cases are Kisin's.

**Hypotheses.**

- p ≥ 5; End(ρ̄) = k. Split ρ̄ (Hu–Tan) and non-split self-extensions (χ \*; 0 χ) are not covered.

**Proof route.**

- Apply Paškūnas's criterion (R30.5/paskunas-cycle-criterion) to N = P̃ with End(P̃) = R^ψ_ρ̄ (R30.5/paskunas-endomorphism-rings, R30.5/dual-of-universal-deformation).
- Supports of M(Θ) for Θ ⊂ σ(w, τ): Proposition 4.14 via R30.4/kisin-hypothesis and R30.4/locally-algebraic-vectors.
- Cycles z(σ, ρ̄) := z₁(M(σ)), their nonvanishing and multiplicity: Theorem 6.6 and §6 (generic and non-generic cases; Theorem 6.24 for (χω \*; 0 χ)).

**Acceptance.**

- For ρ̄ absolutely irreducible, z(σ, ρ̄) ≠ 0 exactly for the Serre weights σ of ρ̄ (the K-socle of the supersingular π with V(π) ↔ ρ̄).
- For (w, τ) = ((0,1), 1) crystalline, R^{ψ,cr}_ρ̄((0,1), 1) is the finite flat deformation ring and its special fibre cycle is z(1, ρ̄).

**Sources.**

- PASKUNAS15, Theorem 1.1 and the paragraph after it, pp. 2–3: For p ≥ 5 and End ρ̄ = k: the reduced two-dimensional O-torsion free quotients R^ψ_ρ̄(w, τ), the cycle identities with z(σ, ρ̄) independent of the type, nonvanishing iff Hom_K(σ, β) ≠ 0 with multiplicity one except multiplicity two for (ω \*; 0 1) ⊗ χ peu ramifié; new only for (ω \*; 0 1) ⊗ χ, the rest being Kisin's.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.5/paskunas-cycle-criterion`, `PadicLocalLanglandsForGL2Qp:R30.5/breuil-mezard-cycles`, `PadicLocalLanglandsForGL2Qp:R30.5/paskunas-endomorphism-rings`, `PadicLocalLanglandsForGL2Qp:R30.5/dual-of-universal-deformation`, `PadicLocalLanglandsForGL2Qp:R30.4/kisin-hypothesis`.

### Hu–Tan: Breuil–Mézard for split non-scalar ρ̄, p ≥ 5

**Target `R30.6/hu-tan-bm-split` (theorem).** Let p ≥ 5 and ρ̄ ≅ χ₁ ⊕ χ₂ with χ₁ ≠ χ₂. For every (k, τ, ψ) (Hodge–Tate weights (0, k−1), WD(ρ)|_I = τ, det ρ = ψε, ψ|_I = ε^{k−2}det τ) there are 4-dimensional cycles Z_{n,m} of the framed ring R^□(ρ̄), independent of (k, τ, ψ), with Z(R^{□,ψ}(k, τ, ρ̄)/ϖ) = Σ_{n,m} a_{n,m}(k, τ)Z_{n,m} and Z(R^{□,ψ}_cr(k, τ, ρ̄)/ϖ) = Σ a^cr_{n,m}(k, τ)Z_{n,m}, where a_{n,m}(k, τ) is the multiplicity of σ_{n,m} = Sym^n k² ⊗ det^m in the reduction of Sym^{k−2} ⊗ σ(τ); moreover Z_{n,m} = Z(R^{□,ψ}_cr(n+2, (ω̃^m)^{⊕2}, ρ̄)/ϖ). The generic case χ₁χ₂^{−1} ∉ {1, ω^{±1}} is Remark 5.7; the non-generic case ρ̄ ≅ 1 ⊕ ω (up to twist) is Theorems 5.11–5.12, with explicit cycles in terms of the three minimal primes of the versal ring over J. The cycles are independent of the compatible lift ψ as well as of the type; changing framing is handled through the versal-ring comparison, not a scalar-endomorphism unframed universal ring for the split representation.

**Hypotheses.**

- p ≥ 5 (standing assumption); ρ̄ split with distinct characters; scalar ρ̄ and non-split self-extensions are not covered.

**Proof route.**

- Work with versal deformation rings and pseudodeformation rings R^{ps} (R30.5/block-pseudodeformation-ring), transferring to framed rings by formal smoothness of framed over versal rings.
- Use Paškūnas's E_B ≅ R^{ps,ζ} and the endomorphism rings of the projective envelopes of the two principal series (R30.5/paskunas-endomorphism-rings) with the criterion R30.5/paskunas-cycle-criterion.
- Non-generic case: explicit versal rings (Hu–Tan §3) and Theorems 5.11–5.12.

**Acceptance.**

- For ρ̄ = 1 ⊕ ω, Z(R^{ver}(k, τ, ρ̄)/ϖ) = a_{p−3,1}𝔭₁ + a_{0,0}𝔭₂ + a_{p−1,0}(𝔭₂ + 𝔭₃).

**Sources.**

- HU-TAN15, Notation, p. 1 (p ≥ 5); Theorem 1.1 (Kisin), p. 3; Theorem 1.3, p. 4; Remark 5.7, p. 30; Theorems 5.11–5.12, pp. 32–33 (arXiv): For p ≥ 5 and ρ̄ ≅ χ₁ ⊕ χ₂ with χ₁ ≠ χ₂ there are 4-dimensional cycles Z_{n,m} independent of the type with the Breuil–Mézard identities, Z_{n,m} the crystalline special fibre cycle of type (n+2, (ω̃^m)^{⊕2}); the non-generic case 1 ⊕ ω is Theorems 5.11–5.12.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.5/breuil-mezard-cycles`, `PadicLocalLanglandsForGL2Qp:R30.5/paskunas-endomorphism-rings`, `PadicLocalLanglandsForGL2Qp:R30.5/block-pseudodeformation-ring`, `PadicLocalLanglandsForGL2Qp:R30.5/paskunas-cycle-criterion`, `LocalGaloisDeformationRings:R08.1/local-lifting-ring`.

### Tung: Breuil–Mézard for every ρ̄ when p > 2

**Target `R30.6/tung-bm-p-odd` (theorem).** Let p > 2 and r̄ : G_{ℚ_p} → GL₂(k) any continuous representation. For each smooth irreducible k-representation σ̄ of K there is a 4-dimensional cycle C_σ̄(r̄) of R^{□,ψ}_r̄, independent of (λ, τ), such that for all p-adic Hodge types (λ, τ, ψ) (λ = (a, b), a > b; det r = ψε, ψ|_I = ε^{a+b−1}det τ) Z(R^{□,ψ}_r̄(λ, τ)/ϖ) = Σ m_σ̄(λ, τ)C_σ̄(r̄) and Z(R^{□,ψ,cr}_r̄(λ, τ)/ϖ) = Σ m^cr_σ̄(λ, τ)C_σ̄(r̄). In the global patching setup of Tung’s paper, every irreducible component meets the corresponding patched support; this is an input to the local cycle proof, not a construction of M_∞ from the local prerequisites. New only for p = 3 and r̄ a twist of an extension of 1 by ω; the proof is global, by patching.

**Hypotheses.**

- p > 2; r̄ arbitrary. The proof uses a globalisation of r̄ over an imaginary CM field and the patched module M_∞ of Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin with local-global compatibility: these global inputs are consumed here as a cited theorem and owned by the global patching roadmaps.

**Proof route.**

- Globalise r̄ (Emerton–Gee), patch (CEGGPS) to obtain M_∞ with an arithmetic action, use local–global compatibility to identify its support on each potentially semistable ring (Tung §3).
- Show every component of R^□_r̄(σ)[1/p] is automorphic using the blocks at p = 3 (§2, exceptional block computations with Colmez's functor) and the faithfulness/density results of Emerton–Paškūnas (§4).
- Deduce the cycle identity from the automorphy of all components (Emerton–Gee, Theorem 5.5.2).
- The globalisation, arithmetic-action patching theorem and component-support theorem are missing proof inputs recorded in G17. No higher-roadmap edge is introduced to hide this dependence.

**Acceptance.**

- For p ≥ 5 this recovers Paškūnas 2015 and Hu–Tan.
- Corollary 4.6: every irreducible component of R^□_r̄(σ)[1/p] is automorphic.

**Sources.**

- TUNG21A, Abstract and introduction, pp. 1–3; Conjecture 1.1, p. 3; Theorem 1.2, p. 4; Corollary 4.6, p. 14 (arXiv v4): For p > 2 proves the cycle version of the Breuil–Mézard conjecture for every r̄, new for p = 3 and twists of extensions of 1 by ω, by showing that every component of a potentially semistable deformation ring meets the support of the patched module.
- DP22, Proof of Theorem 1.4, p. 4: Uses Tung's main theorem to remove Kisin's remaining hypothesis for p = 3, and Hu–Tan for p ≥ 5.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.5/breuil-mezard-cycles`, `PadicLocalLanglandsForGL2Qp:R30.5/blocks-classification`, `PadicLocalLanglandsForGL2Qp:R30.5/local-r-equals-t`, `PadicLocalLanglandsForGL2Qp:R30.3/montreal-functor`, `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`.

### Paškūnas 2016: Breuil–Mézard at p = 2 for generic blocks

**Target `R30.6/paskunas-bm-p-two` (theorem).** Let p = 2 and ρ̄ with ρ̄^{ss} in a block of type (i) (supersingular) or (ii) (generic reducible). For the unframed (End ρ̄ = k) case there are cycles {C_σ} ⊂ Z₁(R^ψ/ϖ), one per irreducible σ of K, with z₁(R^ψ(w, τ)/ϖ) = Σ m_σ(w, τ)C_σ and z₁(R^{ψ,cr}(w, τ)/ϖ) = Σ m^cr_σ(w, τ)C_σ for all p-adic Hodge types (w, τ) (det = ψε, ψ|_I = ε^{a+b−1}det τ), C_σ ≠ 0 iff Hom_K(σ, π) ≠ 0, then with multiplicity 1; for ρ̄ = χ₁ ⊕ χ₂ split generic, framed cycles {C_{1,σ}, C_{2,σ}} ⊂ Z₄(R^{ψ,□}/ϖ) with z₄(R^{ψ,□}(w, τ)/ϖ) = Σ m_σ(w, τ)(C_{1,σ} + C_{2,σ}) and the crystalline analogue, C_{i,σ} ≠ 0 iff σ occurs in the K-socle of the corresponding principal series. Henniart's types are not unique for p = 2; the multiplicities do not depend on the choice.

**Hypotheses.**

- p = 2; blocks of types (i) and (ii) only; the remaining case r̄ ≅ (χ \*; 0 χ) is R30.6/tung-bm-p-two.

**Proof route.**

- Local: E_B is the fixed-determinant deformation ring (R30.5/paskunas-endomorphism-rings (iii)); verify Paškūnas's criterion (R30.5/paskunas-cycle-criterion), the multiplicity condition by Proposition 2.33 using Dospinescu's argument with det V̌(Π) = ψε and dim Ext¹ = 3 (Corollaries 2.24, 2.26), and the locally algebraic completion input for p = 2 (proof of Proposition 2.33). Proposition 2.33 works at all p in the generic residual setting and explicitly replaces the p≥5 hypothesis using these determinant and Ext computations; the Artinian de Rham node gives the separate all-prime family criterion.
- Theorem 2.34 for the unframed ring; Theorem 2.37 for split ρ̄ via [Paškūnas 2015, Theorem 7.3, Remark 7.4].

**Acceptance.**

- For σ in the K-socle of π, C_σ is a multiplicity-one cycle.

**Sources.**

- PASKUNAS16, §2, pp. 20–21 (p-adic Hodge types and Henniart's types at p = 2); Proposition 2.33, p. 22; Theorem 2.34, p. 23; Theorem 2.37, p. 24 (arXiv v2): Defines the p-adic Hodge types with ψε ≡ det ρ̄ and ψ|_I = ε^{a+b−1}det τ, notes that Henniart's types are not unique for p = 2 while the multiplicities are, and proves the unframed and framed cycle identities with nonvanishing iff σ is in the K-socle and multiplicity one.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.5/paskunas-endomorphism-rings`, `PadicLocalLanglandsForGL2Qp:R30.5/paskunas-cycle-criterion`, `PadicLocalLanglandsForGL2Qp:R30.5/breuil-mezard-cycles`, `PadicLocalLanglandsForGL2Qp:R30.4/henniart-types`, `PadicLocalLanglandsForGL2Qp:R30.4/artinian-de-rham-criterion`.

### Tung: Breuil–Mézard at p = 2 for every r̄

**Target `R30.6/tung-bm-p-two` (theorem).** Let p = 2. For every continuous r̄ : G_{ℚ_2} → GL₂(k) the cycle and numerical Breuil–Mézard conjectures (Tung's Conjectures 5.1.2 and 5.1.3, the cycle identity of R30.5/breuil-mezard-cycles) hold; this is new for r̄ ≅ (χ \*; 0 χ). The proof is by patching: if 2 splits completely in a totally real F, the support of M_∞(σ°) ⊗ ℚ₂ meets every irreducible component of R_∞(σ)[1/2] (Theorem 8.0.1).

**Hypotheses.**

- p = 2; the global patching inputs are cited, owned by the global roadmaps.

**Proof route.**

- Patching over totally real fields with 2 totally split (Tung §§4–7) and the globalisation lemmas (§4.3).
- The local 2-adic blocks and Colmez's functor at p = 2 (R30.5/blocks-classification, R30.5/local-r-equals-t) control the patched module.
- Theorem 8.0.1 gives automorphy of all components, hence Corollary 8.0.2.
- The globalisation and patched component-support arguments are the explicit proof gap G17. The global modularity-lifting theorem itself belongs to R32 and is not restated as a local result.

**Acceptance.**

- For r̄ ≅ (χ \*; 0 χ), the identity holds with the framed cycles of Tung's Conjecture 5.1.3.

**Sources.**

- TUNG21B, Theorems A–C, pp. 2–3; Theorem 8.0.1 and Corollary 8.0.2, p. 38 (arXiv v3): Proves modularity of 2-adic potentially semistable representations with distinct weights and the Breuil–Mézard conjectures for every r̄ at p = 2 (new for (χ \*; 0 χ)) by showing every component of R_∞(σ)[1/2] meets the support of the patched module.
- DP22, Proof of Theorem 1.5, p. 4: Cites Paškūnas 2016 Theorem 1.1 and Tung 2021b Theorem A for the 2-adic modularity lifting input.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.5/breuil-mezard-cycles`, `PadicLocalLanglandsForGL2Qp:R30.5/blocks-classification`, `PadicLocalLanglandsForGL2Qp:R30.5/local-r-equals-t`, `PadicLocalLanglandsForGL2Qp:R30.6/paskunas-bm-p-two`.

### Kisin's local multiplicity inequality through Colmez's functor

**Target `R30.6/kisin-local-inequality` (theorem).** Let p>2 and assume ρ̄ is not a twist of (ωχ \*;0 χ), including the split case, and assume Kisin Hypothesis (1.2.6) for the type. The local potentially semistable multiplicity is at most μ_Aut=Σ a_{n,m}μ_{n,m}(ρ̄), with the crystalline counterpart using a^cr_{n,m}. Use the framed ring when ρ̄ has non-scalar endomorphisms; when End ρ̄=k the unframed version has the same Hilbert–Samuel multiplicity after removing three framing variables. The proof passes from pseudodeformations to the representation ring through the cases in Kisin §§1.6–1.7. In the scalar-semisimplification case n=p−2, Gee–Kisin Appendix B.1 corrects the multiplicities to 1 for a nontrivial ramified extension, 2 for a nontrivial unramified extension, and 4 for the split extension. The claimed formal smoothness of R^{ord} in (1.7.5) must be deleted. In Corollary (1.7.14), for the low-weight scalar-type crystalline statement, the exceptional clause includes all scalar semisimplifications as well as split distinct-character representations: it is not just the scalar split case. Appendix B.2 also fixes the residual action on the line in Lemma (1.7.4). The excluded cyclotomic extension shape is treated by the later Breuil–Mézard theorems, not silently by this local inequality.

**Hypotheses.**

- p odd; ρ̄ not of the cyclotomic extension shape (ωχ \*;0 χ), split included; Kisin Hypothesis (1.2.6); apply Gee–Kisin B.1–B.2. The low-weight crystalline equality additionally has scalar τ and 2≤k≤p+1, with the corrected exceptional smoothness clause.

**Proof route.**

- Kisin §1.6 constructs the deformation-family module and bounds the Krull dimension of its support by two (Lemma (1.6.6)); this is not a rank-two module assertion. Use the computed Montreal functor on Hecke quotients for the multiplicity bound.
- Pass to representation rings using the applicable cases of §1.7 under the residual exclusion. Fixed-det framed and unframed multiplicities agree after adjoining three variables when End ρ̄=k.
- Apply Gee–Kisin B.1 to the scalar multiplicities, delete the faulty formal-smoothness conclusion of (1.7.5), enlarge the exception in (1.7.14), and apply B.2’s line-character correction.

**Acceptance.**

- When the local inequality is combined with the global inequality of patching, equality e = μ_Aut follows (Kisin (2.3.2)–(2.3.4)); for p ≥ 5 Paškūnas 2015 proves the local equality directly.

**Sources.**

- KISIN09, §1.1, (1.1.3)–(1.1.6), published pp.646–647; §§1.5–1.7, pp.657–674: The local multiplicity inequality has a residual cyclotomic-extension exclusion and needs the scalar corrections of Gee–Kisin Appendix B.1–B.2.
- GEE-KISIN14, Appendix B.1–B.2, p.38: Corrects scalar multiplicities to 1/2/4 by ramified nontrivial/unramified nontrivial/split class, deletes formal smoothness in (1.7.5), enlarges the exception in (1.7.14), and fixes the residual line in (1.7.4).

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.4/kisin-hypothesis`, `PadicLocalLanglandsForGL2Qp:R30.4/henniart-types`, `PadicLocalLanglandsForGL2Qp:R30.3/montreal-on-irreducibles`, `PadicLocalLanglandsForGL2Qp:R30.5/block-pseudodeformation-ring`, `DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity`.

### Finiteness of the mod p category of GL₂(ℚ_p) (Paškūnas–Tung)

**Target `R30.6/paskunas-tung-finiteness` (theorem).** For every p and every block B: Z_B is noetherian and E_B is a finitely generated Z_B-module; υ makes Z_B and E_B finitely generated over R^{ps,ζε}_{tr ρ̄_B} (R30.5/local-r-equals-t). For N in C(O)_B the following are equivalent: there is a surjection P_B^{⊕n} ↠ N; m(N) is finitely generated over E_B; m(N) is finitely generated over R^{ps}; k ⊗̂_{R^{ps}} N has finite length; the cosocle of N has finite length — and they hold if N is finitely generated over O[[H]] for a compact open H. For x : R^{ps} → L' with T_x not of the form ψ + ψε, Ban^{adm.fl}_{G,ζ}(L')_{B,𝔪_x} is equivalent to finite length modules over the completion of (R^{ps}[[G_{ℚ_p}]]/J) ⊗ L' at 𝔪_x; if T_x = tr ρ with ρ absolutely irreducible, to finite length R^{ζε}_ρ-modules, and every Π' killed by 𝔪_x is a finite sum of copies of the irreducible Π with V̌(Π) ↔ ρ. For the Cayley–Hamilton algebra use the side/opposite convention of Paškūnas–Tung Corollary 6.16. Under the convention E_B=End(P_B), compact Hom modules are right E_B-modules; dualising reverses the module side.

**Hypotheses.**

- All p; B any block.

**Proof route.**

- Theorem 1.3 of Paškūnas–Tung (finite generation over R^{ps}), noetherianity of R^{ps} by Chenevier, hence Theorem 1.1.
- Corollary 6.7: the equivalences, from exactness of m and Nakayama over R^{ps}.
- Corollary 6.16: Banach representations at a maximal ideal of R^{ps}[1/p], via Paškūnas 2013 Theorem 4.36 and Corollaries 6.10–6.11.

**Acceptance.**

- For Π absolutely irreducible non-ordinary, Ban^{adm.fl}_{G,ζ}(L)_Π ≅ finite length R^{ζε}_{V(Π)}-modules, for every p.

**Sources.**

- PASKUNAS-TUNG21, Theorems 1.1–1.4 and Corollary 1.5, pp. 2–4; Corollary 6.7, p. 26; Corollary 6.16, pp. 30–31: Z_B noetherian with E_B finite over it and over R^{ps}; the five equivalent finiteness conditions on N ∈ C(O)_B; the description of finite length Banach representations at maximal ideals of R^{ps}[1/p], in particular deformations of an absolutely irreducible ρ.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.5/local-r-equals-t`, `PadicLocalLanglandsForGL2Qp:R30.5/blocks`, `PadicLocalLanglandsForGL2Qp:R30.5/block-pseudodeformation-ring`, `PadicLocalLanglandsForGL2Qp:R30.2/admissible-unitary-banach`.

### Every π in a block occurs in k ⊗_{R^{ps}} S^∨

**Target `R30.6/block-occurrence` (theorem).** Let B be a block with central character ζ and S a smooth admissible locally finite-length O-torsion object of that block whose restriction to K is injective. Put M=(k completed-tensored_{R_B^{ps,ζ}}S^∨)^∨. Then M has finite O[G]-length. Suppose a characteristic-zero point x of R_B^{ps,ζ} has absolutely irreducible degree-two Galois representation and the specialised compact module N_x, obtained by specialising S^∨ after inverting p, is nonzero. The corresponding Banach representation is the continuous L_x-linear dual of N_x, with its Schikhof lattice; N_x itself is on the compact side. Under this hypothesis every irreducible π∈B occurs in M. The Galois representation/central character is interpreted with Paškūnas’s V̌ convention. In the automorphic application the existence of such x comes from a global supercuspidal form; it is a separate hypothesis here.

**Hypotheses.**

- S admissible in Rep^ζ_B G with injective restriction to K; for the occurrence statement, the existence of the point x (a global input in applications).

**Proof route.**

- Finite length: S^∨ is finitely generated over O[[K]] by admissibility, so Paškūnas–Tung Corollary 6.7 gives that k ⊗̂_{R^{ps}} S^∨ has finite length (R30.6/paskunas-tung-finiteness).
- If π does not occur, projectivity of P_π gives vanishing of Hom_C(P_π, S^∨/m_{ps}^j S^∨) for every j, then of Hom_C(P_π,S^∨), then on the lattice duals of the specialised Banach object. The Hom is in the compact category, not a smooth Hom with P_π as its source.
- Π_x ≅ Π^{⊕d} with Π absolutely irreducible non-ordinary (Paškūnas–Tung Corollary 6.16), and by compatibility of the p-adic and mod p correspondences π occurs in the reduction of a lattice of Π: a contradiction.

**Acceptance.**

- For B = {π} supersingular the statement reduces to M ≠ 0.

**Sources.**

- CDN23, Propositions 4.7, 4.8 and 4.10 with proof, pp. 49–50: For the localised quaternionic automorphic forms S, M = (k_L ⊗_{R^{ps,ζ}_B} S^∨)^∨ has finite length by Paškūnas–Tung Corollary 6.7, and every π ∈ B occurs in it, using projective envelopes, Paškūnas–Tung Corollary 6.16 and a supercuspidal-at-p automorphic point.
- PASKUNAS-TUNG21, Corollaries 6.7 and 6.16, pp. 26–31: The finiteness criterion and the structure of Banach representations killed by 𝔪_x.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.6/paskunas-tung-finiteness`, `PadicLocalLanglandsForGL2Qp:R30.5/projective-envelope`, `PadicLocalLanglandsForGL2Qp:R30.5/blocks`, `PadicLocalLanglandsForGL2Qp:R30.3/cdp-correspondence`.

### Breuil–Strauch through the Drinfeld tower (Dospinescu–Le Bras)

**Target `R30.6/breuil-strauch` (theorem).** Let π be a supercuspidal representation of G = GL₂(ℚ_p) with trivial central character, ρ = JL(π) the corresponding representation of D^×, Σ_n the n-th Drinfeld covering of the half-plane Ω, and V(π) the set of absolutely irreducible Π ∈ Ban^{adm}(G) with Π^{lisse} ≅ π. (i) V(π) ≅ Proj(M_dR(π)) through Π ↦ Fil⁰ D_dR(V(Π)), V(Π) ranging over the absolutely irreducible two-dimensional potentially crystalline representations with Hodge–Tate weights 0, 1 and D_pst(V) ≅ M(π) (classical correspondence normalised à la Tate). (ii) For Π ∈ V(π) and n large (ρ trivial on 1 + p^nO_D) there is a topological G-isomorphism, unique up to scalar, (O(Σ_n)^ρ)\* ≅ Π^{an}/Π^{lisse}. (iii) There is a canonical (up to scalar) isomorphism of Fréchet G-modules H¹_dR(Σ_n)^ρ ≅ M\*_dR ⊗ π\* such that for each line ℒ ⊂ M_dR, the inverse image of ℒ^⊥ ⊗ π\* in Ω¹(Σ_n)^ρ is (Π^{an}_ℒ)\*, and the resulting 0 → O(Σ_n)^ρ → (Π^{an}_ℒ)\* → π\* → 0 is dual to (ii).

**Hypotheses.**

- π supercuspidal with trivial central character (extends to π ⊗ Sym^k, DLB Remarque 1.3(a)); n large.

**Proof route.**

- (i): CDP (R30.3/cdp-correspondence) with det V(Π) = χ_cyc and the Colmez–Fontaine theorem; all filtrations are weakly admissible since the Weil representation of M(π) is irreducible (R30.4/completions-of-locally-algebraic).
- Use R30.4/analytic-quotient-filtration-independent, rather than only the algebraic independence theorem VI.6.42. Identifying this common quotient with functions on the Drinfeld cover needs the geometric inputs G18.
- (iii): comparison with de Rham cohomology of Σ_n (DLB Théorème 1.4).

**Acceptance.**

- Π^{an}_ℒ is an extension 0 → π → Π^{an}_ℒ → Π(π, 0) → 0 with Π(π, 0) independent of ℒ.

**Sources.**

- DLB17, Définition 1.1, Théorème 1.2, Remarque 1.3, pp. 4–5; Théorème 1.4, p. 6 (arXiv): For supercuspidal π with trivial central character: V(π) ≅ Proj(M_dR(π)) via the Hodge filtration; (O(Σ_n)^ρ)\* ≅ Π^{an}/Π^{lisse} for Π ∈ V(π); the de Rham cohomology H¹_dR(Σ_n)^ρ ≅ M\*_dR ⊗ π\* with (Π^{an}_ℒ)\* the inverse image of ℒ^⊥ ⊗ π\*.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.3/cdp-correspondence`, `PadicLocalLanglandsForGL2Qp:R30.4/locally-algebraic-vectors`, `PadicLocalLanglandsForGL2Qp:R30.4/completions-of-locally-algebraic`, `PadicLocalLanglandsForGL2Qp:R30.3/analytic-vectors-of-pi`, `PadicLocalLanglandsForGL2Qp:R30.4/analytic-quotient-filtration-independent`.

### The local inputs to modularity lifting, case by case

**Target `R30.6/hypothesis-table` (comparison).** The local results of this layer consumed by GL2ModularityLifting R32 and by Dieulefait–Pacetti's proof of Serre's conjecture, each with its hypotheses: (1) p ≥ 5, End ρ̄ = k: Paškūnas 2015 Theorem 1.1 (R30.6/paskunas-bm-scalar-endomorphisms), including the compatibility of classical and p-adic local Langlands (Emerton lg Theorem 1.2.1 and Paškūnas 2015 remove Kisin's condition on locally algebraic vectors); (2) p ≥ 5, ρ̄ = χ₁ ⊕ χ₂ with χ₁ ≠ χ₂: Hu–Tan Theorem 1.3 (R30.6/hu-tan-bm-split), removing the remaining hypothesis of Kisin's lifting theorem for p ≥ 5 (Hu–Tan Theorem 1.4); (3) p = 3, every r̄ (new for twists of extensions of 1 by ω): Tung 2021a Theorem 1.2 (R30.6/tung-bm-p-odd), global via patching; (4) p = 2: Paškūnas 2016 Theorem 1.1 with Theorems 2.34, 2.37 for generic blocks (R30.6/paskunas-bm-p-two) and Tung 2021b Theorem A and Corollary 8.0.2 for every r̄ (R30.6/tung-bm-p-two); Dieulefait–Pacetti’s p=2 potentially Barsotti–Tate input is a different Kisin 2009 paper, not KISIN09 (The Fontaine–Mazur conjecture for GL₂); the former is not imported from the latter here; (5) all odd p: Kisin's local inequality with Gee–Kisin's corrections (R30.6/kisin-local-inequality) and Kisin's Hypothesis (1.2.6) (R30.4/kisin-hypothesis). Dieulefait–Pacetti Theorem 1.4 (p odd: odd ρ with ρ̄|_{G_{ℚ(√p\*)}} absolutely irreducible, de Rham at p with weights {0, k−1}, k > 1, modular residual) uses (1)–(3) and (5); Theorem 1.5 (p = 2, non-solvable image) uses (4). The block, deformation-ring and locally algebraic inputs are local; their occurrence in global completed cohomology is CompletedCohomologyAndLocalGlobalCompatibility R31. The Kisin local-inequality row retains the residual exclusion in R30.6/kisin-local-inequality; it is not an all-residual substitute for Tung’s theorem.

**Hypotheses.**

- Each row carries the hypotheses of its source; no unqualified 'p-adic local Langlands theorem' is asserted.

**Proof route.**

- Read off the case division in Dieulefait–Pacetti's proofs of Theorems 1.4 and 1.5 (p. 4) and match each cited theorem with its node in this layer.
- Check that every row's prime and residual hypotheses are those of the node it points to.

**Acceptance.**

- For p = 3 and r̄ = (ω \*; 0 1) ⊗ χ only row (3) applies.
- For p = 2 and r̄ = (χ \*; 0 χ) only Tung 2021b applies.

**Sources.**

- DP22, Theorems 1.4 and 1.5 with their proofs, p. 4 (arXiv v2): Theorem 1.4 (p odd) incorporates Hu–Tan Theorem 1.4 for p ≥ 5 and Tung's main theorem for p = 3 to remove Kisin's hypotheses, with Emerton and Paškūnas for the local Langlands compatibility; Theorem 1.5 (p = 2) cites Kisin's Theorem 0.1, Paškūnas 2016 Theorem 1.1 and Tung 2021b Theorem A.
- HU-TAN15, Theorem 1.4, p. 5 (arXiv): The Fontaine–Mazur type consequence that removes the remaining hypothesis of Kisin's lifting theorem for split non-scalar ρ̄ and p ≥ 5.

**Needs:** `PadicLocalLanglandsForGL2Qp:R30.6/paskunas-bm-scalar-endomorphisms`, `PadicLocalLanglandsForGL2Qp:R30.6/hu-tan-bm-split`, `PadicLocalLanglandsForGL2Qp:R30.6/tung-bm-p-odd`, `PadicLocalLanglandsForGL2Qp:R30.6/paskunas-bm-p-two`, `PadicLocalLanglandsForGL2Qp:R30.6/tung-bm-p-two`, `PadicLocalLanglandsForGL2Qp:R30.6/kisin-local-inequality`, `PadicLocalLanglandsForGL2Qp:R30.4/kisin-hypothesis`.

**Remaining work for this layer.**

- Point GL2ModularityLifting R32.1/R32.2 and LocallyAnalyticCompletedCohomology LA.5/LA.12 at the R30.6 and R30.4 nodes that answer their requests (listed in the handoff note).
- G12. Gabriel block decomposition and pseudocompact Morita equivalence
- G13. Fixed-determinant potentially semistable rings at p=2
- G14. Projectivity and Cohen–Macaulay input for the cycle criterion
- G15. All-prime Artinian de Rham infinitesimal calculation
- G16. Local Galois predicates in admittance
- G17. Global proof of the all-residual Breuil–Mézard cases
- G18. Differential-equation and Drinfeld geometry inputs

## Proof and supplier gaps

### G1. The supercuspidal case of Π(V)^alg = LL(V) ⊗ Alg(V) has only a global proof

For V de Rham, potentially crystalline but not crystabelline (π_p(V) supercuspidal), the identification of the smooth factor of Π(V)^alg with LL(D_pst) is proved by Emerton (lg §7.4) by choosing a modular V' with the same Weil–Deligne type and weights (Colmez VI.6.42) and computing in completed cohomology of modular curves with the weight part of Serre's conjecture; CDP footnote 5 and CDN-Kisin Remarque 0.2(v) record that no purely local proof is known to them. The global inputs (completed H¹ of modular curves: CompletedCohomologyAndLocalGlobalCompatibility R31; Serre weights: ClassicalSerreModularity) lie downstream of R30.6 (R30.6 → R31.4), so citing them would create a stage cycle. This packet states the theorem with the global input named in its proof steps and leaves the dependency open: either a local proof is planned here, or the consumers that need the supercuspidal case carry the global input as an explicit hypothesis.

**Needed by:** `PadicLocalLanglandsForGL2Qp:R30.4/locally-algebraic-vectors`, `PadicLocalLanglandsForGL2Qp:R30.4/kisin-hypothesis`, `PadicLocalLanglandsForGL2Qp:R30.4/completions-of-locally-algebraic`, `PadicLocalLanglandsForGL2Qp:R30.5/kisin-ring-from-langlands`, `PadicLocalLanglandsForGL2Qp:R30.5/paskunas-cycle-criterion`.

### G2. p = 2 for the trianguline classification

Colmez's Représentations triangulines assumes p ≠ 2 (§0.1, footnote 1). The rank-one classification R(δ) and the Ext¹ dimension count for p = 2 are expected from Kedlaya–Pottharst–Xiao (Cohomology of arithmetic families of (φ,Γ)-modules, 2014), which was not read; a source for p = 2 must be fixed before these nodes are used at p = 2.

**Needed by:** `PadicLocalLanglandsForGL2Qp:R30.1/rank-one-robba-modules`, `PadicLocalLanglandsForGL2Qp:R30.1/trianguline-representation`, `PadicLocalLanglandsForGL2Qp:R30.4/trianguline-analytic-vectors`.

### G3. BCDT's admittance versus nonvanishing of Breuil–Mézard cycles

Deducing BCDT Conjecture 1.3.1(1) from the cycle identity needs: C_σ(ρ̄) ≠ 0 iff σ admits ρ̄ in BCDT's explicit sense. Paškūnas 2015 Theorem 1.1(iii) gives C_σ ≠ 0 iff Hom_K(σ, β) ≠ 0 for p ≥ 5 and End ρ̄ = k; matching the K-socle of β with BCDT's list (which is phrased for ρ̄ rather than its Cartier dual, BCDT §1.3) and covering the remaining ρ̄ and primes is not done here.

**Needed by:** `PadicLocalLanglandsForGL2Qp:R30.5/bcdt-admittance-criterion`.

### G4. Emerton's normalisation of π_p(V) and of B(V) against Colmez's LL and Π(V)

The bridge node fixes Colmez's LL(M) against R16.3 and records V(π) = MF(π)(ε). Emerton attaches χ₁ ⊕ χ₂|·|^{−1} to Ind_B^G(χ₁ ⊗ χ₂) (lg pp. 11–13), uses MF and the factor det^{b+1} (Theorem 3.3.22) or det^b (§7.4, see source issue E3); his table MF(Ind_B^G χ₁ ⊗ χ₂) = χ₁ (p. 19) and Colmez's V(B(δ₁, δ₂)) = δ₁ with B(δ₁, δ₂) = Ind_B^G(δ₂ ⊗ δ₁ω^{−1}) are not reconciled here; the induction and weight conventions of Emerton §3 must be read to write the dictionary B(V) ↔ Π(V(ε^{±1})) and π_p(V) ↔ LL(V).

**Needed by:** `PadicLocalLanglandsForGL2Qp:R30.1/classical-normalisation-bridge`, `PadicLocalLanglandsForGL2Qp:R30.4/locally-algebraic-vectors`.

### G5. Scalar and topological adapters for measures and O-linear duality

The pinned Amice equivalence has Zp coefficients and is only stated as a linear equivalence. Establish its O_L-valued convolution and affine-action extension. For Hom_O(−,L/O), identify the scalar-linear duality with the underlying p-primary Pontryagin duality, using the inverse different (and a chosen generator if identifying L/O with its Zp-dual); prove biduality and the contragredient continuous action. Circle-valued Mathlib.PontryaginDual is not this contract. Paškūnas 2013 §2, p.14 gives the required representation-category duality; the general underlying p-primary supplier is SelmerIwasawaCohomology:L2/pontryagin-dual.

**Needed by:** `PadicLocalLanglandsForGL2Qp:R30.1/boxtimes-qp`, `PadicLocalLanglandsForGL2Qp:R30.2/pontryagin-dual-category`, `PadicLocalLanglandsForGL2Qp:R30.3/boxtimes-p1`.

### G6. Representation-specific finiteness and envelopes

The smooth Grothendieck category in current SmoothRepresentationsOfLocalGroups SR.0d.1 gives enough injectives, not automatically injective envelopes in its locally admissible fixed-central-character subcategory. Plan the GL₂(ℚ_p) finitely generated admissible finite-length theorem and existence of injective envelopes inside the locally admissible category from Paškūnas 2013 §2, pp.14–15 and its explicit Emerton input. Reuse current Tau Ceti categorical IsEssentialMono/IsEssentialEpi and injective/projective objects; the pinned ordinary module-envelope structures have been removed as false imports. This is a representation-category application, not another general envelope theory.

**Needed by:** `PadicLocalLanglandsForGL2Qp:R30.2/smooth-torsion-categories`, `PadicLocalLanglandsForGL2Qp:R30.2/locally-admissible-finite-length`, `PadicLocalLanglandsForGL2Qp:R30.2/pontryagin-dual-category`, `PadicLocalLanglandsForGL2Qp:R30.5/blocks`, `PadicLocalLanglandsForGL2Qp:R30.5/projective-envelope`.

### G7. Coherent lattices and universal analytic completion

Plan the coherent-lattice criterion of Colmez–Dospinescu Proposition 0.6 and Theorem 0.7 (pp.5–6) at target level, and connect it to their Theorem 0.2. The universal property and a separated completion construction do not themselves prove the existence or coherence of these analytic lattices.

**Needed by:** `PadicLocalLanglandsForGL2Qp:R30.2/universal-unitary-completion`, `PadicLocalLanglandsForGL2Qp:R30.3/analytic-vectors-of-pi`.

### G8. Correspondence proof inputs beyond family stability

Specify crystalline/trianguline schematic density for each residual representation, including the p=2 scalar and p=3 exceptional cases, before using the family closedness argument. Alternatively plan CDP’s characteristic-zero proof with its Banach Schur theorem, residual finite-length theorem, infinitesimal-character calculation and the theorem excluding finite-dimensional subobjects and quotients of Π(D). Exactness of V alone is insufficient. The source theorems are stated, but their key proof inputs are not supplied by the existing prerequisite list.

**Needed by:** `PadicLocalLanglandsForGL2Qp:R30.3/colmez-correspondence`, `PadicLocalLanglandsForGL2Qp:R30.3/cdp-correspondence`, `PadicLocalLanglandsForGL2Qp:R30.3/family-stability`.

### G9. Schematic deformation comparison

Plan representability and the crystalline schematic-closure comparison of Emerton Theorems 3.3.13–3.3.14 and Kisin §1.6, including the closed-immersion argument and equality on nonreduced Artinian test rings. Do not infer equality of deformation rings from injectivity on tangent spaces and a Zariski-dense set of characteristic-zero points.

**Needed by:** `PadicLocalLanglandsForGL2Qp:R30.3/ext1-injectivity`, `PadicLocalLanglandsForGL2Qp:R30.5/kisin-deformation-comparison`, `PadicLocalLanglandsForGL2Qp:R30.5/dual-of-universal-deformation`, `PadicLocalLanglandsForGL2Qp:R30.5/removing-projective-envelope`.

### G10. Overconvergent Fontaine-heart comparison

Besides Proposition V.2.1, the locally analytic-vector theorem needs Colmez’s analytic freeness and overconvergent distribution comparison for Fontaine’s heart (Theorem V.1.12 and §V.2). PhiGammaModulesAndIwasawaCohomology PG.5/psi-complex-h1 identifies a formal ψ-kernel; it supplies neither this analytic comparison nor the Galois Iwasawa-cohomology comparison.

**Needed by:** `PadicLocalLanglandsForGL2Qp:R30.3/analytic-vectors-of-pi`, `PadicLocalLanglandsForGL2Qp:R30.3/fontaine-heart-weyl`.

### G11. Inertial K-types with p-adic coefficients

The existing R16.3/cdt-inertia-multiplicity contract uses coefficient characteristic different from the residue characteristic and cannot be imported for these characteristic-p reductions. Supply the finite-dimensional p-adic inertial K-type occurrence and multiplicity-one result, plus p=2 independence of reduced multiplicities under choice of type, as stated in Paškūnas 2016 §2.C, published p.1326. Reuse R16.2’s existing classical type objects wherever their hypotheses agree; record this extra dyadic contract in the supplier request.

**Needed by:** `PadicLocalLanglandsForGL2Qp:R30.4/henniart-types`, `PadicLocalLanglandsForGL2Qp:R30.5/breuil-mezard-cycles`, `PadicLocalLanglandsForGL2Qp:R30.5/paskunas-cycle-criterion`.

### G12. Gabriel block decomposition and pseudocompact Morita equivalence

Supply Gabriel’s theorem for locally finite Grothendieck categories and its pseudocompact projective-generator form, as used in Paškūnas 2013 §2 and Paškūnas 2016 §2.B. It must preserve End(P) versus End(J)^{op}, right Hom modules, completed tensor products and the passage from the finite-length subcategory to its Ind-completion. Categorical envelopes alone do not supply this theorem.

**Needed by:** `PadicLocalLanglandsForGL2Qp:R30.5/blocks`, `PadicLocalLanglandsForGL2Qp:R30.5/projective-envelope`, `PadicLocalLanglandsForGL2Qp:R30.6/paskunas-tung-finiteness`.

### G13. Fixed-determinant potentially semistable rings at p=2

R08.3/pst-deformation-ring supplies general type rings, but R08.3/fixed-determinant-pst-rings and R08.1/local-fixed-determinant split off determinant variables only under p∤n. For n=2 this does not cover p=2. Extend the owner’s rank-two fixed-determinant quotient contract at p=2, with reduced O-torsion-free pointwise universal property, absolute/generic/special dimensions 5/4/4 framed and 2/1/1 unframed when End ρ̄=k, and zero ring allowed. Paškūnas 2016 §2.C and Tung’s all-prime statements are sources; no dyadic splitting of determinant variables is assumed.

**Needed by:** `PadicLocalLanglandsForGL2Qp:R30.5/breuil-mezard-cycles`, `PadicLocalLanglandsForGL2Qp:R30.5/paskunas-cycle-criterion`, `PadicLocalLanglandsForGL2Qp:R30.6/paskunas-bm-scalar-endomorphisms`, `PadicLocalLanglandsForGL2Qp:R30.6/paskunas-bm-p-two`, `PadicLocalLanglandsForGL2Qp:R30.6/tung-bm-p-two`.

### G14. Projectivity and Cohen–Macaulay input for the cycle criterion

Apply Paškūnas 2015 Theorem 2.44 to the actual compact projective generator. Verify R Cohen–Macaulay, N R-flat and the projective-dimension bound over a pro-p Sylow Iwasawa algebra, then obtain K-projectivity and Cohen–Macaulay M(Θ). Projectivity in the full G-dual category does not alone give projectivity after restriction to K.

**Needed by:** `PadicLocalLanglandsForGL2Qp:R30.5/paskunas-cycle-criterion`, `PadicLocalLanglandsForGL2Qp:R30.6/paskunas-bm-scalar-endomorphisms`, `PadicLocalLanglandsForGL2Qp:R30.6/paskunas-bm-p-two`.

### G15. All-prime Artinian de Rham infinitesimal calculation

Theorem 4.1 of CDN–Kisin §§4.1–4.2 extends the algebraic-vector density/de Rham criterion to Artinian coefficients, using the infinitesimal action and D_dif calculation. Plan that calculation and the one-dimensional fixed-type de Rham extension space, rather than invoking Dospinescu’s p≥5 theorem at p=2. Paškūnas 2016 Proposition 2.33 separately explains the extension of the generic-block argument using determinant compatibility and dim Ext¹=3.

**Needed by:** `PadicLocalLanglandsForGL2Qp:R30.4/artinian-de-rham-criterion`, `PadicLocalLanglandsForGL2Qp:R30.5/kisin-ring-from-langlands`, `PadicLocalLanglandsForGL2Qp:R30.6/paskunas-bm-p-two`.

### G16. Local Galois predicates in admittance

Fix the fundamental-character and Cartier-dual convention and import the peu/très ramifié classification of extension classes from the local Galois/Serre-weight owner. BCDT §1.3, pp.10–12 supplies the complete case table, but the ramification predicate and its Serre-weight comparison are additional inputs, not consequences of the compact-group classification. Reuse R07.5’s Serre-weight/Hecke objects rather than defining them here again.

**Needed by:** `PadicLocalLanglandsForGL2Qp:R30.5/admittance`, `PadicLocalLanglandsForGL2Qp:R30.5/bcdt-admittance-criterion`, `PadicLocalLanglandsForGL2Qp:R30.6/paskunas-bm-scalar-endomorphisms`.

### G17. Global proof of the all-residual Breuil–Mézard cases

Tung’s all-residual local cycle theorems use globalisation, patched arithmetic actions, automorphy of every component, and the Emerton–Gee cycle deduction. These are not supplied by the local prerequisites. Specify those key inputs at the lower owner or make them explicit named hypotheses in consumers; do not cite higher completed-cohomology/modularity-lifting roadmaps and create a stage cycle. The local theorem statements and prime/residual hypotheses are verified, while this proof closure remains open.

**Needed by:** `PadicLocalLanglandsForGL2Qp:R30.6/tung-bm-p-odd`, `PadicLocalLanglandsForGL2Qp:R30.6/tung-bm-p-two`.

### G18. Differential-equation and Drinfeld geometry inputs

Plan the filtration-independent G-action on N_rig ⊠ℙ¹ and the intersection calculation in Colmez VI.6.41–VI.6.43. The Breuil–Strauch geometric comparison then also needs the Drinfeld covering spaces and their function/differential Fréchet representations, the Jacquet–Langlands isotypic projector, and the de Rham comparison in Dospinescu–Le Bras Theorems 1.2 and 1.4. Classical local Langlands and the abstract analytic-vector category do not supply this geometry.

**Needed by:** `PadicLocalLanglandsForGL2Qp:R30.4/analytic-quotient-filtration-independent`, `PadicLocalLanglandsForGL2Qp:R30.6/breuil-strauch`.

## Exact supplier requests

**`PhiGammaModulesAndIwasawaCohomology:PG.0`.** The coefficient rings O_E = O_L-valued Laurent series with a_k → 0 as k → −∞, E = O_E[1/p], O_E⁺ = O_L[[T]], with φ(T) = (1+T)^p − 1 and σ_a(T) = (1+T)^a − 1, and the categories ΦΓ^et_tors, ΦΓ^et(O_E), ΦΓ^et(E) of étale (φ,Γ)-modules over them (Colmez 2010, Introduction §4).

Used by `PadicLocalLanglandsForGL2Qp:R30.1/fontaine-functor-convention`.

**`PhiGammaModulesAndIwasawaCohomology:PG.1`.** Fontaine's equivalences Rep_tors G_{ℚ_p} ≅ ΦΓ^et_tors, Rep_{O_L}G_{ℚ_p} ≅ ΦΓ^et(O_E), Rep_L G_{ℚ_p} ≅ ΦΓ^et(E) through the covariant D(V) = (A ⊗ V)^H and V(D) = ((O_L·A) ⊗ D)^{φ=1}, exact, compatible with tensor products and with Tate duals V(Ď) = V̌ = Hom(V, L ⊗ χ) (Colmez 2010, Théorème I.3.1).

Used by `PadicLocalLanglandsForGL2Qp:R30.1/fontaine-functor-convention`, `PadicLocalLanglandsForGL2Qp:R30.1/tate-dual`.

**`PhiGammaModulesAndIwasawaCohomology:PG.2`.** Overconvergence D = E ⊗ D† for every étale D over E and the equivalence ΦΓ^et(E†) ≅ ΦΓ^et(R) (slope zero, Kedlaya), with D_rig = R ⊗ D† (Colmez 2010, Remarque 0.4(ii)–(iii)); Kedlaya's slope of R(δ) is v_p(δ(p)).

Used by `PadicLocalLanglandsForGL2Qp:R30.1/fontaine-functor-convention`, `PadicLocalLanglandsForGL2Qp:R30.1/rank-one-robba-modules`, `PadicLocalLanglandsForGL2Qp:R30.3/analytic-vectors-of-pi`.

**`LocallyAnalyticDistributionsPartII:ND.6`.** Compact-open independence for Banach representations of a locally compact p-adic Lie group G (red-team finding RT-AREA-automorphic-1/17): a unitary K-Banach representation of G with a G-stable unit ball is admissible for one compact open subgroup iff for every compact open subgroup, so that admissibility of G(ℚ_p)-representations may be tested on a compact open; together with the existing ND.6/banach-iwasawa-duality this is the general admissible unitary Banach category that R30.2 specialises to GL₂(ℚ_p).

Used by `PadicLocalLanglandsForGL2Qp:R30.2/admissible-unitary-banach`.

**`LocallyAnalyticDistributionsPartII:ND.2`.** Admissible locally analytic representations of a locally ℚ_p-analytic group G (duals of coadmissible D(H, K)-modules for a compact open H) and, for an admissible unitary Banach representation Π, the subspace Π^{an} of locally analytic vectors: admissible, dense, with Π ↦ Π^{an} exact (Schneider–Teitelbaum, Inventiones 2003, Theorem 7.1).

Used by `PadicLocalLanglandsForGL2Qp:R30.2/analytic-and-algebraic-vectors`.

**`SmoothRepresentationsOfLocalGroups:SR.0`.** Reuse smooth discrete representations and admissibility at a fixed torsion coefficient level O/ϖ^n (SR.0.4). For general O-torsion representations use finiteness of π^H[ϖ^n] for every compact open H and n. The GL₂(ℚ_p) local-admissibility/local-finite-length identification is a separate theorem here.

Used by `PadicLocalLanglandsForGL2Qp:R30.2/smooth-torsion-categories`.

**`SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`.** Reuse the general smooth-category Grothendieck and enough-injectives result (current upstream SR.0d.1). This does not assert injective envelopes for the locally admissible fixed-central-character subcategory; that representation-specific extension is R30.2/locally-admissible-finite-length, gap G6.

Used by `PadicLocalLanglandsForGL2Qp:R30.2/smooth-torsion-categories`.

**`SmoothRepresentationsOfLocalGroups:SR.2`.** Imported from the Tau Ceti roadmap: smooth and compact induction with Frobenius reciprocity (SR.2.1), used for Ind_B^G and c-Ind_{KZ}^G.

Used by `PadicLocalLanglandsForGL2Qp:R30.2/modp-principal-series`.

**`PadicMeasuresIwasawaAlgebras:L5`.** Supply topological Nakayama for pseudocompact O_L[[H]]-modules, including the finite-generation test modulo the maximal ideal and exactness of the required compact inverse systems with their separation hypotheses. Reuse current Tau Ceti completedGroupAlgebra and IsCompactModule for carriers and module structures; only these additional lemmas are requested.

Used by `PadicLocalLanglandsForGL2Qp:R30.2/pontryagin-dual-category`.

**`tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs`.** Reuse the completed-group-algebra and compact-module theory of the current upstream document. Its current Tau Ceti implementation works over any compact commutative coefficient ring, so specialise it to O_L and compact open H; no second completed group algebra is planned. The newer declarations are recorded in upstreamNotes rather than asserted at the old baseline pins.

Used by `PadicLocalLanglandsForGL2Qp:R30.2/pontryagin-dual-category`, `PadicLocalLanglandsForGL2Qp:R30.2/admissible-unitary-banach`.

**`GL2AutomorphicRepresentationsAndTransfer:R16.2`.** Reuse the existing classical inertial-type objects. Extend their occurrence contract to finite-dimensional p-adic K-types with multiplicity one, uniqueness for p>2, and at p=2 choice-independence of semisimplified reductions after the algebraic factor; Paškūnas 2016 §2.C, published pp.1325–1326. R16.3/cdt-inertia-multiplicity has coefficients of characteristic different from p and does not supply this. Gap G11.

Used by `PadicLocalLanglandsForGL2Qp:R30.4/henniart-types`.

**`LocalGaloisDeformationRings:R08.3`.** Reuse general potentially semistable type rings and extend the fixed-determinant rank-two contract to p=2 without dividing by two. Require the reduced O-torsion-free pointwise universal property and framed/unframed dimensions specified in G13; existing determinant splitting assumes p∤n. The degree-two determinant-law carrier and Cayley–Hamilton algebra remain owned by IntegralHeckeAndGaloisDeterminants.

Used by `PadicLocalLanglandsForGL2Qp:R30.5/block-pseudodeformation-ring`, `PadicLocalLanglandsForGL2Qp:R30.5/breuil-mezard-cycles`, `PadicLocalLanglandsForGL2Qp:R30.5/paskunas-cycle-criterion`, `PadicLocalLanglandsForGL2Qp:R30.6/paskunas-bm-scalar-endomorphisms`, `PadicLocalLanglandsForGL2Qp:R30.6/paskunas-bm-p-two`, `PadicLocalLanglandsForGL2Qp:R30.6/tung-bm-p-two`.

## Pinned library declarations

These are the 14 retained declarations independently read at the pins. A matching name is not treated as a stronger mathematical contract.

- `mathlib:AbstractMeasure` in `Mathlib/NumberTheory/Padics/Measure/Basic.lean`: Measures D(X, R) on a profinite space with values in R, with Dirac masses and pushforward.
- `mathlib:AbstractMeasure.amiceTransformEquiv` in `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean`: The Zp-linear Amice equivalence between Zp-valued measures on Zp and Zp power series. General O_L coefficients and compatibility with convolution require a scalar and algebra adapter.
- `mathlib:CategoryTheory.IsGrothendieckAbelian` in `Mathlib/CategoryTheory/Abelian/GrothendieckCategory/Basic.lean`: Grothendieck abelian categories.
- `mathlib:ContinuousMonoidHom` in `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean`: Continuous monoid homomorphisms, used for continuous characters ℚ_p^× → Λ^×.
- `mathlib:Field.absoluteGaloisGroup` in `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean`: The absolute Galois group of a field with its Krull topology.
- `mathlib:IsUltrametricDist` in `Mathlib/Topology/MetricSpace/Ultra/Basic.lean`: Ultrametric distances, the nonarchimedean normed-space foundation for Banach representations.
- `mathlib:Matrix.GeneralLinearGroup` in `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`: GL n R as the units of the matrix ring; GL₂(ℚ_p) and GL₂(ℤ_p) are instances.
- `mathlib:PadicInt` in `Mathlib/NumberTheory/Padics/PadicIntegers.lean`: The p-adic integers ℤ_[p].
- `mathlib:PowerSeries` in `Mathlib/RingTheory/PowerSeries/Basic.lean`: Formal power series rings, the carrier of O_L[[T]] = O_E⁺.
- `mathlib:Subgroup` in `Mathlib/Algebra/Group/Subgroup/Defs.lean`: Subgroups, used for B, P, K, Z and congruence subgroups.
- `mathlib:Submonoid` in `Mathlib/Algebra/Group/Submonoid/Defs.lean`: Submonoids, used for the monoid P⁺.
- `mathlib:TopRep` in `Mathlib/RepresentationTheory/Continuous/TopRep.lean`: Representations whose action by each group element is a continuous linear endomorphism. Joint continuity is a separate requirement; for smooth discrete modules it follows from open stabilisers.
- `mathlib:cyclotomicCharacter` in `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean`: The cyclotomic character of the automorphisms of a field with enough roots of unity (continuous on Gal(L/K)).
- `tauceti:TauCeti.IsSmoothDiscrete` in `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`: A TopRep is smooth discrete: discrete module and open point stabilisers.

## Current upstream reuse

**SmoothRepresentationsOfLocalGroups.** Read current upstream at 0d144d044dacebca17b654695b6f1ad58f159b27. SR.0d.1 provides a Grothendieck smooth category and enough injectives, not the locally admissible fixed-central-character envelope theorem. The latter is kept in this packet as a representation-specific target with G6.

**ProfiniteProPGroups.** Current upstream Layer 9 prerequisites reuses TauCeti.completedGroupAlgebra and compact modules. Current Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 has Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean and Module.lean with arbitrary compact commutative coefficient rings, including O_L. Reuse this API and IsCompactModule; do not develop a second completed group algebra in PMIA or R30. Only compact Nakayama/duality adapters remain requested. These are newer than the fixed blueprint pins and are not baseline declarations here.

**TauCeti.** At current library a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, CategoryTheory/Injective/Envelope.lean supplies IsEssentialMono and CategoryTheory/Projective/Cover.lean supplies IsEssentialEpi. Combine them with categorical injective/projective objects for the representation categories. Their existence theorem remains G6; ordinary module covers at f790474 are not a substitute.

**PadicMeasuresIwasawaAlgebras.** No current upstream directory under this name was present in the checked read-only checkout. Its atlas L1 is not treated as an already imported full O_L[[H]] compact-module theory. The current completed-algebra library is the reuse target; L5 retains only the additional compact Nakayama/inverse-system request.

## Source catalogue

### COLMEZ10

Pierre Colmez. **Représentations de GL2(Qp) et (φ,Γ)-modules**. Astérisque 330 (2010), 281–509; read in the author's version kirilov.pdf (236 pp.), whose page numbers are cited; accessed 2026-10-18; independently collated published Proposition III.3.2 p.359. [Source](https://webusers.imj-prg.fr/~pierre.colmez/kirilov.pdf).

**Locators read.**

- Introduction §§1–13, pp. 5–23
- §I.3, pp. 32–40
- §II.1–II.3, pp. 46–69
- §III.3.1, pp. 84–86
- §IV.1–IV.2, pp. 93–103
- §IV.4.1–IV.4.2, pp. 106–110
- §V.2.20, p. 134
- §VI.5.2–VI.5.4, pp. 165–169
- §VI.6.3–VI.6.11, pp. 176–193
- §VII.3–VII.4.2, pp. 205–211
- §VII.5.2, p. 223
- §V.1–V.2 locators for Fontaine’s heart, pp.121–125, and §VI.6.9, pp.189–190; the analytic proof closure is retained as G10/G18

SHA-256: `8663e1189fe79387240cbfa6d7a2788217dfe4f3a522b4b4ffc36b3dc347917e`.

### COLMEZ08TRI

Pierre Colmez. **Représentations triangulines de dimension 2**. Astérisque 319 (2008), 213–258; author's version Trianguline-ast.pdf; accessed 2026-10-18. [Source](https://webusers.imj-prg.fr/~pierre.colmez/Trianguline-ast.pdf).

**Locators read.**

- §0.1–0.4, pp. 2–5 (including footnote 1: p ≠ 2)
- Proposition 3.1, p. 17
- Propositions 4.4–4.8, pp. 23–24

SHA-256: `47abd3af7224912064f10fe7b3328741c68189a53aa685881928b16b8c7d5832`.

### COLMEZ14LA

Pierre Colmez. **La série principale unitaire de GL2(Qp) : vecteurs localement analytiques**. Automorphic forms and Galois representations, vol. 1, LMS Lecture Note Series 415 (2014), 286–358; author's version locan.pdf; accessed 2026-10-18. [Source](https://webusers.imj-prg.fr/~pierre.colmez/locan.pdf).

**Locators read.**

- Introduction §§0.1–0.4, Théorèmes 0.1, 0.6, 0.7, Remarque 0.8, pp. 3–8

SHA-256: `ce00ca9dd90610b4f4a46d8e37ca27f5000565fad706fea7188f1a5168f21560`.

### PASKUNAS13

Vytautas Paškūnas. **The image of Colmez's Montreal functor**. Publ. Math. IHÉS 118 (2013), 1–191; read arXiv:1005.2008v3. [Source](https://arxiv.org/abs/1005.2008).

**Locators read.**

- §1 (Theorems 1.1–1.11, Proposition 1.12, hypotheses (H0)–(H5)), pp. 2–8
- Table of contents for §§2–12 and Appendix A

SHA-256: `053eec49b476e949f640f5a5d268142b6711b39c985e245b9ffbf5aafa7c279c`.

### CDP14

Pierre Colmez, Gabriel Dospinescu, Vytautas Paškūnas. **The p-adic local Langlands correspondence for GL2(Qp)**. Cambridge J. Math. 2 (2014), 1–47; read arXiv:1310.2235v1. [Source](https://arxiv.org/abs/1310.2235).

**Locators read.**

- §1.1–1.5, Theorems 1.1, 1.3, 1.4, 1.8, 1.9, Corollaries 1.2, 1.6, 1.7, footnotes 2–5, pp. 1–6
- Bibliography entry [34]

SHA-256: `6f72e34264237472e4ee3366e54d445eacd88c523adadb0c152e1ed27a7c81b6`.

### PASKUNAS-BLOCKS14

Vytautas Paškūnas. **Blocks for mod p representations of GL2(Qp)**. Automorphic forms and Galois representations, vol. 2, LMS Lecture Note Series 415 (2014); read arXiv:1104.5602v2. [Source](https://arxiv.org/abs/1104.5602).

**Locators read.**

- Theorem 1.1 and Corollary 1.2, pp. 1–3
- Proposition 3.11 and the decomposition of π{δ₁, δ₂}, pp. 8–11

SHA-256: `3631c015fe4ec983bf9893e03f11b7e5c2e17b8a8ba29a3b753aaef2fbb80a35`.

### PASKUNAS15

Vytautas Paškūnas. **On the Breuil–Mézard conjecture**. Duke Math. J. 164 (2015), 297–359; read arXiv:1209.5205v3. [Source](https://arxiv.org/abs/1209.5205).

**Locators read.**

- §1, pp. 1–3
- Theorem 2.42, p. 16
- Proposition 4.14, p. 23
- Corollary 6.5 and Theorem 6.6, p. 31

SHA-256: `fce17b369313877b7efedab0844e8ece721a0c249dee1ef212f1d1303fc82c18`.

### HU-TAN15

Yongquan Hu, Fucheng Tan. **The Breuil–Mézard conjecture for non-scalar split residual representations**. Ann. Sci. ÉNS (4) 48 (2015), 1383–1421; read arXiv:1309.1658v2 (page numbers of the arXiv file). [Source](https://arxiv.org/abs/1309.1658).

**Locators read.**

- Notation, p. 1
- §1, Theorems 1.1 (Kisin), 1.3, 1.4, pp. 3–5
- Remark 5.7 and Theorems 5.11–5.12, pp. 30–33

SHA-256: `d36f237d7269e9dac7d32d80f1e4d6fe5c20b210ae067075b2dedb51e73d9bb2`.

### TUNG21A

Shen-Ning Tung. **On the automorphy of 2-dimensional potentially semi-stable deformation rings of G_Qp**. Algebra Number Theory 15 (2021), 2173–2194; read arXiv:1803.07451v4. [Source](https://arxiv.org/abs/1803.07451).

**Locators read.**

- Abstract and introduction, pp. 1–3
- Conjecture 1.1 and Theorem 1.2, pp. 3–4
- Corollary 4.6, p. 14

SHA-256: `22017bc9beb585c2aae5421d2fe1a8a9049d8a93e4f8bb8cf684149616db1ba2`.

### PASKUNAS16

Vytautas Paškūnas. **On 2-dimensional 2-adic Galois representations of local and global fields**. Algebra Number Theory 10 (2016), 1301–1358; read arXiv:1509.00332v2; independently collated the published §2.C pp.1325–1326 and Theorem 2.37 p.1329. [Source](https://arxiv.org/abs/1509.00332).

**Locators read.**

- §1 (Theorems 1.1–1.3, Corollary 1.4, outline), pp. 1–4
- §2.C: p-adic Hodge types, Henniart's types at p = 2, Proposition 2.33, Theorems 2.34 and 2.37, pp. 20–24

SHA-256: `727addeb49ee302052a493cf097a868a70c340286981598b5e7382fcd8f86749`.

### TUNG21B

Shen-Ning Tung. **On the modularity of 2-adic potentially semi-stable deformation rings**. Math. Z. 298 (2021), 107–159; read arXiv:1908.06174v3. [Source](https://arxiv.org/abs/1908.06174).

**Locators read.**

- Introduction, Theorems A–C, pp. 1–3
- §8, Theorem 8.0.1 and Corollary 8.0.2, p. 38

SHA-256: `a601da3762c35dab9ebdac5fb5106f1e3f627304dfc2390ac43fe2ac862c6de8`.

### PASKUNAS-TUNG21

Vytautas Paškūnas, Shen-Ning Tung. **Finiteness properties of the category of mod p representations of GL2(Qp)**. read arXiv:2104.08948v2. [Source](https://arxiv.org/abs/2104.08948).

**Locators read.**

- §1, Theorems 1.1–1.4 and Corollary 1.5, pp. 1–4
- Corollary 6.7, p. 26
- Corollaries 6.14–6.16, pp. 30–31

SHA-256: `82a559a17eb455f9c41f9ca1c6c613b22dc92020812c0107579452c1f9ba9e21`.

### CDN23

Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł. **Factorisation de la cohomologie étale p-adique de la tour de Drinfeld**. Forum Math. Pi 11 (2023), e16; read arXiv:2204.11214v2. [Source](https://arxiv.org/abs/2204.11214).

**Locators read.**

- Théorème 0.17, p. 11
- §1.2–1.5 (Lemmes 1.6–1.7, Remarque 1.8, Proposition 1.10, Remarques 1.11–1.15, Théorèmes 1.16, 1.21, 1.24, 1.26, 1.27, Remarque 1.28), pp. 14–25
- Propositions 4.7, 4.8 and 4.10 with proof, pp. 49–50

SHA-256: `c5711666b845a48f6fc2cd944b22bbde0c45567fe29dacb00a3429619baecbee`.

### CDNKISIN

Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł. **Correspondance de Langlands locale p-adique et anneaux de Kisin**. read arXiv:2204.11217v2 (24 April 2023). [Source](https://arxiv.org/abs/2204.11217).

**Locators read.**

- Introduction, Théorème 0.1 and Remarque 0.2, pp. 1–3
- §1.1, Remarque 1.1 and Proposition 1.2, p. 4
- §4.1, Theorem 4.1 and Remark 4.2, pp.13–15; §4.2, Proposition 4.5, pp.16–17
- §5, Lemma 5.3, Theorem 5.4, Corollaries 5.5–5.7, Theorem 5.8, pp.20–22

SHA-256: `de7a6eeb831a23e6fec0da595b05526ad23678089bfb541f1476ec3ec52b4840`.

### CDN20

Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł. **Cohomologie p-adique de la tour de Drinfeld : le cas de la dimension 1**. J. Amer. Math. Soc. 33 (2020), 311–362; read arXiv:1704.08928v2 (arXiv page numbers cited). [Source](https://arxiv.org/abs/1704.08928).

**Locators read.**

- Introduction §0.2 and Remarque 0.5, pp. 4–8
- Proposition 2.9, p. 22; Proposition 2.12 and Corollaire 2.13, pp. 24–25

SHA-256: `15e4868f5b11ad113e2806b5e9884d7b100f529e67c6cd6030f24cf8e3ae9073`.

### CD14

Pierre Colmez, Gabriel Dospinescu. **Complétés universels de représentations de GL2(Qp)**. Algebra Number Theory 8 (2014); read arXiv:1301.7647v1. [Source](https://arxiv.org/abs/1301.7647).

**Locators read.**

- §0, Théorèmes 0.2, 0.5, 0.7, 0.8, 0.10, Remarque 0.3, Corollaires 0.11–0.15, pp. 3–9

SHA-256: `77894b68a0f006b0355d9c0ca3a8391bd6199aad88f3685ce2e616f2ba231dd3`.

### DOSPINESCU15

Gabriel Dospinescu. **Extensions de représentations de de Rham et vecteurs localement algébriques**. Compositio Math. 151 (2015); read arXiv:1302.4567v1. [Source](https://arxiv.org/abs/1302.4567).

**Locators read.**

- §1, Remarque 1.1, Théorèmes 1.2, 1.3, 1.7, 1.8, 1.9, pp. 2–7

SHA-256: `012ce70e15f922252947adc4f67a995dd58c28c64204490a82bef3157ec0da1b`.

### BB10

Laurent Berger, Christophe Breuil. **Sur quelques représentations potentiellement cristallines de GL2(Qp)**. Astérisque 330 (2010), 155–211; read arXiv:math/0601545v1. [Source](https://arxiv.org/abs/math/0601545).

**Locators read.**

- Introduction and main Théorème, pp. 2–3
- Théorème 5.2.7 and Corollaires 5.3.1–5.3.3, pp. 51–52

SHA-256: `d47ab53c35b8344d7c395f325747c7d629d2425e044efd71184ffcd5bad6f4f9`.

### EMERTON-LG

Matthew Emerton. **Local-global compatibility in the p-adic Langlands programme for GL2/Q**. Preprint (2011), author's file lg.pdf; accessed 2026-10-18. [Source](https://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf).

**Locators read.**

- §1.2 (Theorems 1.2.1–1.2.6), pp. 3–6
- Notation and conventions, pp. 11–13
- §3.2, pp. 18–21 (MF, footnote 6, table of MF)
- §3.3, Assumption 3.3.1–Remark 3.3.23, pp. 24–28
- §7.4, pp. 96–98

SHA-256: `bf4f8556ef04be02daed0b1dba35c91ce4a7b2f4cbbf28d0d8351b1fc369eb13`.

### GEE-KISIN14

Toby Gee, Mark Kisin. **The Breuil–Mézard conjecture for potentially Barsotti–Tate representations**. Forum Math. Pi 2 (2014), e1; read arXiv:1208.3179. [Source](https://arxiv.org/abs/1208.3179).

**Locators read.**

- Appendix B (errata to Kisin 2009), items B.1–B.5, Lemmas B.5.1–B.5.2, pp. 38–41

SHA-256: `65cb5797bbe10e328843b5fdc73f2623c80e19fa89ceb72ce6cd296881eb68f9`.

### KISIN09

Mark Kisin. **The Fontaine–Mazur conjecture for GL2**. J. Amer. Math. Soc. 22 (2009), 641–690; published PDF served by Harvard DASH. Locators below are journal pages.. [Source](https://dash.harvard.edu/server/api/core/bitstreams/7312037d-4c56-6bd4-e053-0100007fdf3b/content).

**Locators read.**

- §1.1–1.2, pp.645–650: type rings, Hecke quotients, Hypothesis (1.2.6), Theorem (1.2.8)
- §§1.5–1.7, pp.657–674: local inequality, schematic comparison and scalar cases; collated with Gee–Kisin Appendix B.1–B.2

SHA-256: `aec5c28dfd531cbd8d50859b943c85d86004a72cff92d84272e7c88d4fecbf38`.

### NAKAMURA23

Kentaro Nakamura. **Zeta morphisms for rank two universal deformations**. Invent. Math. 234 (2023), 171–290; read arXiv:2006.13647v2 (arXiv page numbers cited); independently collated published Theorem B.18 p.279 and Lemma B.25 p.283. [Source](https://arxiv.org/abs/2006.13647).

**Locators read.**

- Theorem 4.7, p. 67
- Appendix B.3, B.17–B.28, pp. 97–104

SHA-256: `0d8fa462594a20ef96d755d31a13ba23081f1454bfe9809a5fda54fd30311ba7`.

### DLB17

Gabriel Dospinescu, Arthur-César Le Bras. **Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique**. Ann. of Math. 186 (2017), 321–411; read arXiv:1509.00606v2. [Source](https://arxiv.org/abs/1509.00606).

**Locators read.**

- §1, Définition 1.1, Théorème 1.2, Remarque 1.3, Théorème 1.4, pp. 4–6

SHA-256: `bdf8f14fb4bfb4fe43980fdbff088b33469a16a9c0260616a0630de48de8cd68`.

### BREUIL03

Christophe Breuil. **Sur quelques représentations modulaires et p-adiques de GL2(Qp) : I**. Compositio Math. 138 (2003), 165–188; author's version GL2(Qp)I.pdf; accessed 2026-10-18. [Source](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/GL2%28Qp%29I.pdf).

**Locators read.**

- §1, Théorème 1.1, Corollaire 1.2, Théorème 1.3, Corollaire 1.4, pp. 2–4

SHA-256: `ceac657c69a8439e50bf28a4f385766714579669781cace1fa77f698cb4b3f33`.

### BCDT01

Christophe Breuil, Brian Conrad, Fred Diamond, Richard Taylor. **On the modularity of elliptic curves over Q: wild 3-adic exercises**. J. Amer. Math. Soc. 14 (2001), 843–939; read Breuil's author copy STW.pdf (same text; pp. 10–12 there correspond to pp. 854–856 of the journal). [Source](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/STW.pdf).

**Locators read.**

- §1.3 (reduction of types, admittance, Conjecture 1.3.1), pp. 10–12 of the author copy

SHA-256: `cbbdc24c26cdfcbd77f0e084194643e8804a724f004eb02e431ead9d932c498d`.

### DP22

Luis Dieulefait, Ariel Pacetti. **A simplified proof of Serre's conjecture**. RACSAM 117 (2023), article 153; read arXiv:2108.07577v2. [Source](https://arxiv.org/abs/2108.07577).

**Locators read.**

- Introduction and Theorems 1.4–1.5 with proofs, pp. 1–4

SHA-256: `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6`.

## Source corrections and edition collation

### E1: PASKUNAS16

**misprint; nothing.** Theorem 2.37, p. 24, arXiv:1509.00332v2.

The source asserts: The preprint introduces the displayed cycle equalities using the word for inequalities.

**Correction:** The statement asserts equalities of cycles z₄(R^{ψ,□}(w,τ)/ϖ) = Σ_σ m_σ(w,τ)(C_{1,σ} + C_{2,σ}) and the crystalline analogue.

**Reason:** The displays and proof assert equalities. The final paper, Theorem 2.37, published p.1329, uses equality consistently.

**Prior correction:** Corrected in the published Algebra & Number Theory 10 (2016), Theorem 2.37, p.1329.

**Search and collation.**

- arXiv:1509.00332v2, p.24
- Published MSP PDF, Theorem 2.37, p.1329

**Independent verdict:** confirmed.

### E2: PASKUNAS16

**misprint; nothing.** §2.C, arXiv:1509.00332v2 p.21; persists in the published paper pp.1325–1326.

The source asserts: A deformation of type (w, τ, ψ) is required to have determinant equal to ψ, while the same paragraph imposes ψε ≡ det ρ̄ mod ϖ and ψ|_{I} = ε^{a+b−1}det τ.

**Correction:** The determinant should be ψε.

**Reason:** With Hodge–Tate weights a, b the determinant restricted to inertia is ε^{a+b}det τ, which matches ψε and not ψ under ψ|_I = ε^{a+b−1}det τ; the paper's rings R^ψ parametrise deformations with determinant ψε (§1.1.1, p. 4) and R^{ps,ψ} pairs (t, d) with d = ψε.

**Prior correction:** new

**Search and collation.**

- arXiv:1509.00332v2, §2.C
- Published MSP PDF pp.1325–1326 and its §1.1.1 determinant convention
- MSP article and author/preprint listings; no separate correction found

**Independent verdict:** confirmed.

### E3: EMERTON-LG

**error; a stated result.** Theorem 3.3.22 and Remark 3.3.23, p. 28, against §7.4, pp. 96–98 (preprint lg.pdf).

The source asserts: Theorem 3.3.22 and Remark 3.3.23 give B(V)^{l.alg} ≅ Sym^{a−b−1}E² ⊗ det^{b+1} ⊗ π_p(V) for weights a > b, while the proof in §7.4 establishes, and repeatedly writes, Sym^{a−b−1}E² ⊗ det^b ⊗ π_p(V).

**Correction:** The exponent of det in the statement and in the proof must agree; which one is right depends on the normalisation of π_p(V) (lg pp. 11–13) and of the Hodge–Tate weights, and is to be settled with gap G4.

**Reason:** The same object B(V')^{l.alg} is described with det^{b+1} in the theorem and with det^b in (7.4.1)–(7.4.3) and the displays that follow, with π_p(V) unchanged.

**Prior correction:** new

**Search and collation.**

- Author-hosted lg.pdf, Theorem 3.3.22 p.28 and §7.4 pp.96–98
- Author publication listing; no replacement or erratum located

**Independent verdict:** confirmed.

### E4: CDP14

**misprint; nothing.** §1.1, sentence after Theorem 1.3, p. 2, arXiv:1310.2235v1.

The source asserts: The preprint’s discussion following Theorem 1.3 points to Emerton Theorem 3.2.22.

**Correction:** Emerton [34] (lg) has no Theorem 3.2.22; the result meant is Theorem 3.3.22 (the locally algebraic vectors of B(V)).

**Reason:** Reference [34] of CDP is Emerton's lg preprint, whose numbered statements in §3.2 stop before 3.2.22 and whose Theorem 3.3.22 is the cited compatibility.

**Prior correction:** new

**Search and collation.**

- arXiv:1310.2235v1, p.2
- Emerton author preprint §3.2 and Theorem 3.3.22
- International Press published-PDF endpoint returned HTTP 403; no claim about the inaccessible version of record

**Independent verdict:** confirmed.

### E5: COLMEZ10

**error; a stated result.** Proposition III.3.2, author copy p.85; published Astérisque 330 p.359.

The source asserts: The exceptional Hecke quotients at r=0 and r=p−1 are given the opposite character/Steinberg submodule order.

**Correction:** For r=0 the Steinberg twist is the submodule and the character is the quotient; for r=p−1 the character is the submodule and Steinberg is the quotient.

**Reason:** At r=0, λ=1, χ=1, augmentation of compact induction gives a character quotient. Kisin (1.2.2), published p.648, gives the matching two nonsplit sequences.

**Prior correction:** The correct orientations are already given by Kisin 2009, (1.2.2), p.648.

**Search and collation.**

- Colmez author kirilov.pdf, III.3.2
- Numdam version of record, p.359
- Kisin published (1.2.2), p.648; author/publication search found no separate Colmez erratum

**Independent verdict:** confirmed.

### E6: CDNKISIN

**error; a stated result.** Remark 1.1, p.4, author preprint arXiv:2204.11217v2 (version in sources).

The source asserts: The two exceptional Hecke sequences are oriented with the same reversed character/Steinberg submodule order as Colmez III.3.2.

**Correction:** Use the orientations in R30.2/modp-irreducibles and Kisin (1.2.2): r=0 has character quotient; r=p−1 has character submodule.

**Reason:** The r=0 augmentation quotient distinguishes the two orders. The corresponding formula in Kisin’s published paper confirms it.

**Prior correction:** Correct sequences are in Kisin 2009, (1.2.2), p.648.

**Search and collation.**

- CDN–Kisin author/arXiv copy, Remark 1.1 p.4
- Kisin published (1.2.2), p.648
- Preprint/publication listings checked; this finding is confined to the accessible author preprint

**Independent verdict:** confirmed.

### E7: NAKAMURA23

**error; a stated result.** Theorem B.18, arXiv v2 p.98; published Invent. Math. 234 (2023), p.279.

The source asserts: The claimed representation is required to have no finite-dimensional subquotient.

**Correction:** Replace that requirement by no nonzero finite-dimensional subobject or quotient, as in Emerton Theorem 3.3.2.

**Reason:** Emerton’s theorem permits finite-dimensional internal Jordan–Hölder constituents. Its special cyclotomic-extension atom can have a character constituent between its non-finite-dimensional outer pieces. The stronger condition would exclude an object the theorem is meant to construct.

**Prior correction:** The cited original result already has the correct condition: Emerton Theorem 3.3.2, p.24.

**Search and collation.**

- Nakamura arXiv:2006.13647v2 Theorem B.18
- Springer version of record Theorem B.18 p.279
- Emerton lg.pdf Assumption 3.3.1 and Theorem 3.3.2
- Exact-title erratum search and publisher article page on 2026-10-19; no separate correction found

**Independent verdict:** confirmed.

### E8: KISIN09

**error; a stated result.** §1.1 scalar case and §§1.6–1.7; corrected by Gee–Kisin Appendix B.1, p.38.

The source asserts: In (1.1.6), the nontrivial scalar-semisimplification extension class is assigned multiplicity one; the trivial class is not explicitly defined and multiplicity two is suggested.

**Correction:** For n=p−2 use 1 for a nontrivial ramified extension, 2 for a nontrivial unramified extension, and 4 for the split extension.

**Reason:** Gee–Kisin Appendix B.1 shows that the nontrivial unramified extension has multiplicity two, while the nontrivial ramified extension has multiplicity one and the trivial class has multiplicity four.

**Prior correction:** Gee–Kisin 2014, Appendix B.1, p.38.

**Search and collation.**

- Kisin published §§1.1,1.6–1.7
- Gee–Kisin arXiv:1208.3179, Appendix B.1 p.38

**Independent verdict:** confirmed.

### E9: KISIN09

**error; a stated result.** Lemma (1.7.4), (1.7.5), Corollary (1.7.14), published §§1.7; Gee–Kisin Appendix B.1–B.2, p.38.

The source asserts: The ordinary-ring discussion asserts formal smoothness, the later low-weight crystalline smoothness exception is too small, and the residual character of a distinguished line is misstated.

**Correction:** Delete the formal-smoothness assertion in (1.7.5). In (1.7.14) include all scalar semisimplifications and split distinct-character representations in the exceptional smoothness clause. Use Appendix B.2’s corrected line action in (1.7.4).

**Reason:** These are the explicit repairs in Gee–Kisin B.1–B.2; the old smoothness conclusion is not restored by correcting just the multiplicity.

**Prior correction:** Gee–Kisin 2014, Appendix B.1–B.2, p.38.

**Search and collation.**

- Kisin published §1.7
- Gee–Kisin arXiv:1208.3179, Appendix B.1–B.2 p.38

**Independent verdict:** confirmed.

Edition records, read on the dates shown:

- author copy, 2026-10-18: [text](https://webusers.imj-prg.fr/~pierre.colmez/kirilov.pdf), SHA-256 `8663e1189fe79387240cbfa6d7a2788217dfe4f3a522b4b4ffc36b3dc347917e`.
- preprint, 2026-10-18: [text](https://arxiv.org/abs/1509.00332v2), SHA-256 `727addeb49ee302052a493cf097a868a70c340286981598b5e7382fcd8f86749`.
- preprint, 2026-10-18: [text](https://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf), SHA-256 `bf4f8556ef04be02daed0b1dba35c91ce4a7b2f4cbbf28d0d8351b1fc369eb13`.
- preprint, 2026-10-18: [text](https://arxiv.org/abs/1310.2235v1), SHA-256 `6f72e34264237472e4ee3366e54d445eacd88c523adadb0c152e1ed27a7c81b6`. The International Press published PDF returned HTTP 403 on 2026-10-19; E4 is scoped only to the accessible preprint.
- published, 2026-10-19: [text](https://dash.harvard.edu/server/api/core/bitstreams/7312037d-4c56-6bd4-e053-0100007fdf3b/content), SHA-256 `aec5c28dfd531cbd8d50859b943c85d86004a72cff92d84272e7c88d4fecbf38`.
- published, 2026-10-19: [text](https://msp.org/ant/2016/10-6/ant-v10-n6-p06-p.pdf), SHA-256 `64063e7bb3651bc4f911722e16cc005f020c975575c958b41445820ca6d6b186`.
- published, 2026-10-19: [text](https://www.numdam.org/article/AST_2010__330__281_0.pdf), SHA-256 `ccf1a070d4fd5d8b5aaf14591fd0c7390f4ec048c986b1f88a32e90f8c933568`.
- published, 2026-10-19: [text](https://link.springer.com/content/pdf/10.1007/s00222-023-01203-7.pdf), SHA-256 `47682f856244439d8cc3d3e6e0a4e1f804e6a710ec1a2dde8fad76f94aea20e4`.
- preprint, 2026-10-19: [text](https://arxiv.org/abs/2204.11217v2), SHA-256 `de7a6eeb831a23e6fec0da595b05526ad23678089bfb541f1476ec3ec52b4840`. E6 is scoped to this accessible preprint, not to an unidentified version of record.

## Ownership follow-up

**PadicLocalLanglandsForGL2Qp, LocallyAnalyticDistributionsPartII, CompletedCohomologyPartII, PadicMeasuresIwasawaAlgebras.** Red-team RT-AREA-automorphic-1/17 requires one general owner of admissible unitary Banach representations. ND.6/banach-iwasawa-duality already supplies Schikhof duality for compact groups; add compact-open independence there. Current Tau Ceti completed-algebra carriers are reused. The prior assertion that PMIA is a present upstream Banach-category supplier was not verified. Make LocallyAnalyticDistributionsPartII ND.6 the general owner: add to it the compact-open admissibility test for locally compact G (requested here), and let CompletedCohomologyPartII CC.2/CC.5 and this roadmap's R30.2/admissible-unitary-banach import ND.6. R30.2 constructs no second category.

**PadicLocalLanglandsForGL2Qp, LocalGaloisDeformationRings.** LocalGaloisDeformationRings (an upstream-tier roadmap) cites PadicLocalLanglandsForGL2Qp:R30.5 for R^{ps,δ}_B and for CDN's rings R_{B,M}. R^{ps,δ}_B is Galois-side (IntegralHeckeAndGaloisDeterminants IHG.1 specialised to GL₂ with fixed determinant), whereas R_{B,M} is built from the GL₂(ℚ_p) side (B-adic completion, local R = T). The general degree-two determinant-law and Cayley–Hamilton carriers remain in IHG. Their fixed-determinant local Galois specialisation belongs to R08, with the p=2 extension requested in G13. This packet only indexes that ring by representation blocks and owns the representation-theoretic centre comparison and CDN Kisin-ring family. A lower-tier package needing the latter must state its exact theorem as a named hypothesis until an acyclic proof is supplied.

**PadicLocalLanglandsForGL2Qp, GL2ModularityLifting.** GL2ModularityLifting cites PadicLocalLanglandsForGL2Qp R30.6 seven times (upstream order file); its R22.1 packet requests the Breuil–Mézard cycle theorems, Kisin's local inequality and Kisin's Hypothesis (1.2.6). Point those prerequisites at R30.6/paskunas-bm-scalar-endomorphisms, R30.6/hu-tan-bm-split, R30.6/tung-bm-p-odd, R30.6/kisin-local-inequality and R30.4/kisin-hypothesis; when GL2ModularityLifting is packaged before this roadmap, state these as explicit named local inputs with these nodes as their owners.
