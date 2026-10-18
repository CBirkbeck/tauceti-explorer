# Roadmap: p-adic local Langlands for GL₂(ℚ_p)

**Summary.** For G = GL₂(ℚ_p) the p-adic local Langlands correspondence attaches to every absolutely irreducible two-dimensional continuous representation V of G_{ℚ_p} over a finite extension L of ℚ_p an admissible unitary L-Banach representation Π(V) of G, and conversely Colmez's Montreal functor Π ↦ V(Π) recovers V. This roadmap builds the correspondence from étale (φ,Γ)-modules — the G-module D ⊠_δ ℙ¹, Colmez's functors D and V, the representation Π(D) and the theorem V(Π(V)) = V — together with the three categories it lives between (smooth mod p representations, admissible unitary Banach representations, locally analytic representations), the classification of irreducible mod p representations and of blocks, the locally algebraic vectors of Π(V) and their comparison with the classical correspondence, projective envelopes and their endomorphism rings (Paškūnas, Paškūnas–Tung), and the local Breuil–Mézard theorems consumed by modularity lifting, with the cases p ≥ 5, p = 3 and p = 2 kept separate. Its end results are the Colmez–Dospinescu–Paškūnas bijection, Colmez's description of locally algebraic vectors, Kisin's Hypothesis (1.2.6), the local R = T theorem for every block, and a table of the local inputs used by the GL₂ modularity lifting theorems, each with its exact hypotheses.

The targets below are specifications for formalisation. Every definition comes with the API it needs and with checks that a plausible wrong definition fails; every theorem carries its hypotheses, its source and the earlier targets, library declarations and supplier layers it rests on. The companion [Suggested.lean](../suggested/PadicLocalLanglandsForGL2Qp.lean) proposes Lean forms for the targets whose carriers exist at the pinned libraries; it is not the roadmap and not exhaustive, and this document is definitive.

## Scope and ownership

This roadmap owns:

- The conventions the correspondence rests on: GL₂(ℚ_p), its mirabolic subgroup and the monoid P⁺; Colmez's dictionary between characters of ℚ_p^× and Galois characters; the covariant Fontaine functor and Tate dual in Colmez's normalisation; ψ and the treillis D⁺, D^♮, D^♯; (P(ℤ_p),ψ)-modules and M ⊠ ℚ_p; rank-one (φ,Γ)-modules R(δ) over the Robba ring and two-dimensional trianguline representations; the bridge between Colmez's classical correspondence LL(M) and that of GL2AutomorphicRepresentationsAndTransfer R16.3 (Layer R30.1).
- The local representation categories of GL₂(ℚ_p), as specialisations of general theories owned elsewhere: smooth torsion, locally finite and locally admissible representations; their Pontryagin duals; admissible unitary Banach representations; locally analytic and locally algebraic vectors; universal unitary completions; the mod p principal series; the Barthel–Livné–Breuil classification of irreducible mod p representations; the mod ℓ irreducibles of GL₂(ℤ_ℓ), U₀(ℓ) and Ũ₀(ℓ); and what fails for GL₂(F), F ≠ ℚ_p (R30.2).
- Colmez's construction: D ⊠_δ ℙ¹, the Montreal functor D, V and Paškūnas's V̌, their values on irreducibles and Breuil's semisimple mod p correspondence, the contragredient, Π(D) and Π(V), Colmez's theorem, the Colmez–Dospinescu–Paškūnas bijection, Ext¹ injectivity and the locally analytic vectors of Π(D) (R30.3).
- Locally algebraic vectors and classical compatibility: LL(V) ⊗ Alg(V), Colmez's theorem on Π(V)^alg, the Berger–Breuil completions, Henniart's K-types, Kisin's Hypothesis (1.2.6), the classification of unitary completions, Kirillov models, the locally analytic vectors of the unitary principal series, and Dospinescu's de Rham extension theorem (R30.4).
- Blocks and their classification, projective envelopes, the pseudodeformation ring of a block, Paškūnas's endomorphism-ring theorems, the local R = T theorem, Kisin's deformation comparison, Nakamura's description of P̃ and the removal of P̃ from Hom, the Breuil–Mézard cycle identity and Paškūnas's support criterion, the Colmez–Dospinescu–Nizioł Kisin rings, and Breuil–Conrad–Diamond–Taylor admittance (R30.5).
- The local theorems consumed by modularity lifting, row by row: Paškūnas (p ≥ 5), Hu–Tan, Tung (p odd), Paškūnas and Tung at p = 2, Kisin's local inequality with Gee–Kisin's corrections, Paškūnas–Tung finiteness, block occurrence, Breuil–Strauch, and the hypothesis table (R30.6).

It leaves the following to the roadmaps and libraries named, and does not restate them.

- **Coefficient rings and Fontaine's equivalence** belong to PhiGammaModulesAndIwasawaCohomology: PG.0 (O_E, E, the φ and Γ actions), PG.1 (Fontaine's equivalence), PG.2 (overconvergence and the Robba realisation), PG.3 (Herr complexes) and PG.4 (ψ). The Robba ring itself, Berger's dictionary and D_dif belong to PadicHodgeTheory (P7:annulus-foundations, P7, R06.2–R06.3).
- **The smooth category** of a locally profinite group over a ring, admissibility, local admissibility, injective envelopes, smooth and compact induction belong to the Tau Ceti roadmap SmoothRepresentationsOfLocalGroups (SR.0, SR.0:derived-extension, SR.2).
- **Completed group algebras** O[[H]] and topological Nakayama belong to the Tau Ceti roadmap PadicMeasuresIwasawaAlgebras (L1, L5).
- **Admissible Banach representations of compact p-adic Lie groups**, Schikhof duality and the Schneider–Teitelbaum anti-equivalence belong to LocallyAnalyticDistributionsPartII ND.6 (`ND.6/banach-iwasawa-duality`); distribution algebras and coadmissible modules to ND.1–ND.2. This roadmap specialises them to GL₂(ℚ_p) and requests from ND.6 the compact-open admissibility test and from ND.2 the functor of locally analytic vectors.
- **Serre weights**, compact induction c-Ind_{KZ}^G σ and the Barthel–Livné Hecke algebra belong to FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5 (`R07.5/serre-weights-compact-induction`).
- **The classical local Langlands correspondence for GL₂**, its normalisations and Henniart's unicity of supercuspidal types belong to GL2AutomorphicRepresentationsAndTransfer R16.1–R16.3.
- **Galois deformation rings**: framed and fixed-determinant rings (LocalGaloisDeformationRings R08.1, GlobalGaloisDeformations R04.2), Kisin's potentially semistable rings (R08.3), pseudocharacters (IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1), cycles and Hilbert–Samuel multiplicities (DeformationAndDerivedPatchingAlgebra R03.3, R03.6).
- **Global inputs**: completed cohomology and local–global compatibility (CompletedCohomologyAndLocalGlobalCompatibility R31), patching and the lifting theorems (GL2ModularityLifting R32). The local results here are consumed there; Tung's and Paškūnas's patching arguments at p = 2, 3 are cited as theorems.
- **Not in this roadmap**: no correspondence for GL₂(F) with F ≠ ℚ_p or for GL_n with n > 2; no geometric realisation in the cohomology of the Drinfeld tower beyond the Breuil–Strauch statement of R30.6; no trianguline variety or eigenvariety.

## Conventions

1. **Coefficients.** p is a prime, L/ℚ_p finite with ring of integers O = O_L, uniformiser ϖ and residue field k = k_L; L is enlarged when an eigenvalue or a character requires it.
2. **The group.** G = GL₂(ℚ_p), K = GL₂(ℤ_p), Z the centre, B the upper triangular Borel subgroup, P = {(a b; 0 1)} the mirabolic subgroup, P⁺ = {(a b; 0 1) : a ∈ ℤ_p ∖ {0}, b ∈ ℤ_p}, w = (0 1; 1 0). Smooth induction Ind_B^G(δ₁ ⊗ δ₂) consists of locally constant φ with φ(bg) = δ₁(a)δ₂(d)φ(g) for b = (a b; 0 d), G acting by right translation; normalised induction is i_B^G(a, b) = Ind_B^G(a|·|^{1/2} ⊗ b|·|^{−1/2}).
3. **Class field theory.** Uniformisers correspond to geometric Frobenii. A character δ of ℚ_p^× is the Weil character δ(g) = δ(p)^{−deg g}δ(χ(g)); x|x| corresponds to the cyclotomic character χ = ε and its reduction ω to the mod p cyclotomic character; μ_λ is the unramified character with μ_λ(p) = λ. The Hodge–Tate weight of χ is +1 (PadicHodgeTheory R06.2/hodge-tate-weight-convention); Colmez's statements with weights a < b use this convention.
4. **(φ,Γ)-modules.** D(V) = (A ⊗ V)^H and V(D) = ((O_L·A) ⊗ D)^{φ=1} (covariant). The Tate dual of V is Hom(V, L ⊗ χ). For D of rank 2, δ_D = (x|x|)^{−1}α_D with α_D the character of det V(D).
5. **Colmez's functor.** V(Π) is the Tate dual of V(D(Π)); it is covariant and exact. Emerton's MF(π) is the Pontryagin dual of V(D(π)), so V(π) = MF(π)(ε). Paškūnas's V̌(M) = V(M^∨)^∨(ζε) on the dual category.
6. **Central characters.** Π(V) has central character δ_D = det(V)·ε^{−1} read through Convention 3; equivalently det V(Π) = δε for Π with central character δ.
7. **Breuil–Mézard normalisations.** Paškūnas 2015: types (w, τ, ψ) with w = (a, b), b > a, det = ψ, ψ|_I = ε^{a+b}det τ. Kisin, Hu–Tan, Tung, Paškūnas 2016: det = ψε (Kisin's weights (0, k−1), ψ|_I = ε^{k−2}det τ; Tung's λ = (a, b) with a > b, ψ|_I = ε^{a+b−1}det τ). The dictionary is R30.5/breuil-mezard-cycles, API item `BMCycles.normalisation_dictionary`.
8. **Names.** New declarations live under `TauCeti.`; namespaces in each target are proposals following Mathlib's conventions.

## Exact supplier contracts

**From Mathlib** (`082e2d37e8b0463410cdb532e111cd43d5a66174`). `Matrix.GeneralLinearGroup`, `Matrix.SpecialLinearGroup`, `Subgroup`, `Submonoid`, `PadicInt`, `cyclotomicCharacter`, `Field.absoluteGaloisGroup`, `ContinuousMonoidHom`, `PowerSeries`, `AbstractMeasure` and `AbstractMeasure.amiceTransformEquiv` (the Amice transform as a linear equivalence), `TopRep`, `CategoryTheory.IsGrothendieckAbelian`, `PontryaginDual`, `IsUltrametricDist`.

**From Tau Ceti** (`f790474821cf4256814db967cb154e7af3d0c369`). `TauCeti.IsSmoothDiscrete` (smooth discrete objects of `TopRep`: discrete module, open point stabilisers), `TauCeti.IsInjectiveEnvelope`, `TauCeti.IsProjectiveCover`. The completed group algebra `TauCeti.completedGroupAlgebra` appears in Tau Ceti after the pinned commit; it is consumed through PadicMeasuresIwasawaAlgebras L1.

**From PhiGammaModulesAndIwasawaCohomology.** PG.0–PG.2 as stage contracts (requested: that packet has not yet planned them), and the nodes `PG.3/herr-complex`, `PG.4/linearized-psi`, `PG.4/linearized-psi-uniqueness`, `PG.4/psi-zero-splitting`, `PG.5/psi-complex`, `PG.5/psi-complex-h1`.

**From PadicHodgeTheory.** `P7:annulus-foundations/robba-ring`, `P7/robba-realisation-comparison`, `P7/fontaine-dif-module`, `P7/berger-dcris-dst-dictionary`, `R06.2/admissible-representations`, `R06.2/hodge-tate-weight-convention`, `R06.2/crystalline-character-classification`, `R06.2/colmez-fontaine-bigness-criterion`, `R06.3/de-rham-iff-dif-connection-trivial`, `R06.3/p-adic-monodromy-theorem`, `R06.3/fontaine-weil-deligne-functor`, `R06.3/weil-deligne-parameter`, `R06.3/convention-comparison-with-r01`.

**From GL2AutomorphicRepresentationsAndTransfer.** R16.1 (Iwasawa and Cartan coordinates), `R16.2/henniart-unicity`, `R16.3/principal-series-parameter`, `R16.3/steinberg-monodromy`, `R16.3/supercuspidal-parameter`, `R16.3/tate-unitary-normalization`, `R16.3/cdt-inertia-multiplicity`.

**From SmoothRepresentationsOfLocalGroups (Tau Ceti).** SR.0 (smooth category over a ring, admissibility, local admissibility), SR.0:derived-extension (Grothendieck property, injective envelopes), SR.2 (smooth and compact induction).

**From PadicMeasuresIwasawaAlgebras (Tau Ceti).** L1 (completed group algebras), L5 (compact inverse systems, topological Nakayama).

**From LocallyAnalyticDistributionsPartII.** `ND.1/distribution-algebra`, `ND.2/coadmissible-module`, `ND.2/faithful-flatness`, `ND.6/banach-iwasawa-duality`, and the requested extensions of ND.2 and ND.6.

**From FiniteFlatGroupsAndIntegralPadicHodgeTheory.** `R07.5/serre-weights-compact-induction`.

**From LocalGaloisDeformationRings, GlobalGaloisDeformations, IntegralHeckeAndGaloisDeterminants, DeformationAndDerivedPatchingAlgebra.** `R08.1/local-lifting-ring`, `R08.1/local-forget-framing`, `R08.1/local-fixed-determinant`, `R08.3/hodge-and-galois-types`, `R08.3/pst-deformation-ring`, `R08.3/pst-generic-fibre`; `R04.2/universal-lifting-ring`; `IHG.0/pseudocharacter`, `IHG.0/determinant-trace-bijective-small`, `IHG.1/universal-reductive-pseudocharacter-ring`; `R03.6/cycle-specialization-multiplicity`, `key/hilbert-samuel-multiplicity`.

## How to read the build

The layers are R30.1 to R30.6 in dependency order. Each target is a paragraph giving its statement with all hypotheses, its proof route, the API of a definition or construction as a list of named lemmas, its source with the locator, and *Needs*: the earlier targets, library declarations and supplier layers it rests on. The checks of a definition or construction are the **Checks** bullets under it, one per unit test; theorems carry **Acceptance** bullets. Each layer ends with its dependencies.

## R30.1. Robba rings and (φ,Γ)-modules

This layer constructs no second Robba ring or (φ,Γ)-module carrier: the coefficient rings, Fontaine's equivalence and overconvergence are imported from PhiGammaModulesAndIwasawaCohomology PG.0–PG.2 and the Robba ring from PadicHodgeTheory P7:annulus-foundations. It fixes the conventions Colmez's construction uses — the subgroups of GL₂(ℚ_p) and the dictionary between P⁺ and (φ,Γ), the dictionary between characters of ℚ_p^× and Galois characters, the covariant Fontaine functor and the Tate dual — and builds the (φ,Γ)-module operations specific to the GL₂(ℚ_p) construction: the treillis D^♮ ⊂ D^♯ and the P(ℚ_p)-modules M ⊠ ℚ_p. It plans rank-one modules R(δ) and trianguline representations, which index the unitary principal series, and proves the normalisation bridge between Colmez's classical correspondence LL(M) and R16.3.

**Targets of the layer.** The group GL₂(ℚ_p) and its standard subgroups; Characters of ℚ_p^× as Galois characters (Colmez's normalisation); Étale (φ,Γ)-modules over O_E, E, E† and R with the covariant Fontaine functor; The Tate dual of an étale (φ,Γ)-module and the rank-two twist; The operator ψ and the lattices D⁺, D^♮ and D^♯; (P(ℤ_p),ψ)-modules and the P(ℚ_p)-module M ⊠ ℚ_p; Rank-one (φ,Γ)-modules R(δ) over the Robba ring; Trianguline representations of dimension 2 and Colmez's parameter space; Colmez's classical correspondence LL(M) against R16.3.

**Planets.** Characters of ℚ_p^× as Galois characters; Treillis D^♮ and D^♯; Rank-one (φ,Γ)-modules R(δ); Trianguline representations.

### The group GL₂(ℚ_p) and its standard subgroups

**Target `R30.1/gl2qp-subgroups` (definition).** Fix a prime p. Put G = GL₂(ℚ_p), K = GL₂(ℤ_p), Z ≅ ℚ_p^× the centre of scalar matrices, B the upper triangular Borel subgroup, T ⊂ B the diagonal torus, N ⊂ B the upper unipotent subgroup {(1 b; 0 1)}, and P the mirabolic subgroup {(a b; 0 1) : a ∈ ℚ_p^×, b ∈ ℚ_p} ≅ ℚ_p ⋊ ℚ_p^×. P(ℤ_p) = {(a b; 0 1) : a ∈ ℤ_p^×, b ∈ ℤ_p}, and P⁺ is the submonoid {(a b; 0 1) : a ∈ ℤ_p ∖ {0}, b ∈ ℤ_p} of P. Write w = (0 1; 1 0), φ_P = (p 0; 0 1), u = (1 1; 0 1) and σ_a = (a 0; 0 1) for a ∈ ℤ_p^×. KZ is the stabiliser of the vertex [ℤ_p²] of the Bruhat–Tits tree of PGL₂(ℚ_p), whose vertices are G/KZ; I₁ ⊂ K is the pro-p Iwahori subgroup of matrices congruent to (1 \*; 0 1) mod p, I the Iwahori subgroup, and K₁ = ker(K → GL₂(𝔽_p)). These subgroups carry the topology induced from the p-adic topology of M₂(ℚ_p); K, P(ℤ_p), I and I₁ are compact open in their ambient groups.

**Hypotheses.**
- p is a prime; all matrix groups are realised as units of 2×2 matrix rings over ℚ_p and ℤ_p (Mathlib's GL (Fin 2)).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Basic`, namespace `TauCeti.GL2Qp`.

**Uses.**
- Colmez, Introduction §5 and Théorème II.1.4: the action of G on D ⊠_δ P¹ is specified on P, on Z and on w.
- Paškūnas 2013, §2–§3: projective envelopes are profinite O[[K]]-modules with a compatible G-action.
- this roadmap R30.2/modp-principal-series: parabolic induction from B and compact induction from KZ.

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

*Proof sketch.* Each subgroup is cut out of Mathlib's Matrix.GeneralLinearGroup (Fin 2) ℚ_[p] by conditions on the entries (zero lower-left entry for B, lower row (0,1) for P, entries in ℤ_p with unit determinant for K). P⁺ is closed under multiplication because the product of (a b; 0 1) and (a' b'; 0 1) is (aa' ab'+b; 0 1), and a, a', b, b' ∈ ℤ_p with aa' ≠ 0. G = BK (Iwasawa decomposition) and G = ⊔ K diag(p^a, p^b) K with a ≥ b (Cartan) are recorded from GL2AutomorphicRepresentationsAndTransfer R16.1, which owns the rank-two Iwasawa and Cartan coordinates; they are cited, not planned again. Colmez's convention identifies an étale (φ,Γ)-module with a P⁺-module: u acts as multiplication by 1+T, φ_P as φ and σ_a as the element of Γ with χ(σ_a) = a (Colmez, Introduction §4, Remark 0.4(iv)).

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

*Needs:* `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Subgroup`, `mathlib:Submonoid`, `mathlib:PadicInt`, `GL2AutomorphicRepresentationsAndTransfer:R16.1`.

### Characters of ℚ_p^× as Galois characters (Colmez's normalisation)

**Target `R30.1/character-dictionary` (definition).** For a topological ring Λ let T̂(Λ) be the group of continuous characters δ : ℚ_p^× → Λ^×. Through local class field theory normalised so that p corresponds to a geometric Frobenius, W_{ℚ_p}^{ab} ≅ ℚ_p^×, and a character δ ∈ T̂(Λ) is viewed as the character of the Weil group W_{ℚ_p} given by δ(g) = δ(p)^{−deg g} · δ(χ(g)), where deg g ∈ ℤ is defined by g(x) = x^{p^{deg g}} on 𝔽̄_p and χ is the cyclotomic character. When n ↦ δ(p^n) extends continuously to ℤ̂ (in particular when Λ = k_L, or Λ = L and δ is unitary, i.e. v_p(δ(p)) = 0), δ extends to a continuous character of G_{ℚ_p}. Under this dictionary the character x ↦ x|x| corresponds to χ, its reduction ω mod p to the mod p cyclotomic character, and the unramified character μ_λ (μ_λ(p) = λ, trivial on ℤ_p^×) to the unramified character sending a geometric Frobenius to λ. For δ ∈ T̂(L) its weight is w(δ) = log δ(u)/log u for any u ∈ ℤ_p^× not a root of unity; for unitary δ it is the generalised Hodge–Tate weight of δ (w(x|x|) = 1).

**Hypotheses.**
- L is a finite extension of ℚ_p with ring of integers O_L = O, uniformiser ϖ and residue field k_L = k.
- The normalisation (uniformisers ↦ geometric Frobenii) is the one of Colmez, Paškūnas and Colmez–Dospinescu–Paškūnas; GL2AutomorphicRepresentationsAndTransfer R16.3 uses the same Art_F(ϖ) = geometric Frobenius, and PadicHodgeTheory R06.2 states crystalline characters through Art^arith, the inverse normalisation.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Characters`, namespace `TauCeti.PadicChar`.

**Uses.**
- Colmez, Introduction §9: the central character δ_D = (x|x|)^{−1}α_D of Π(D) is defined from the character α_D of det V(D).
- Paškūnas 2013, Theorem 1.3: the determinant ζε of V(Π) is read through this dictionary.
- CDP 2014, Corollary 1.2: V(Π) has determinant δε for Π with central character δ.
- this roadmap R30.2/modp-principal-series: smooth characters δ₁, δ₂ : ℚ_p^× → k^× are matched with Galois characters to compute V(B(δ₁, δ₂)) = δ₁.

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

*Proof sketch.* Local class field theory for ℚ_p: the reciprocity isomorphism ℚ_p^× ≅ W_{ℚ_p}^{ab} with p ↦ geometric Frobenius (trivial on μ_{p^∞}) and u ∈ ℤ_p^× ↦ the element acting on μ_{p^∞} by u, so that the inverse map is g ↦ p^{−deg g} χ(g) (cited from the Tau Ceti ClassFieldTheory roadmap through GL2AutomorphicRepresentationsAndTransfer R16.3, which fixes Art_F). Compute x|x| on p^{−deg g}χ(g): |p^{−deg g}χ(g)| = p^{deg g}, so (x|x|)(p^{−deg g}χ(g)) = χ(g); hence x|x| ↔ χ, and reducing mod ϖ gives ω. δ extends from W_{ℚ_p} = ℤ-extension to G_{ℚ_p} = ℤ̂-extension exactly when n ↦ δ(p)^n extends continuously to ℤ̂, which holds when δ(p) is a unit of a profinite or p-adically complete-with-unit-group-containing-it ring (k_L^×, O_L^×). The weight is well defined because δ restricted to a small open subgroup 1 + p^nℤ_p is u ↦ exp(w(δ) log u) (Colmez, Représentations triangulines, §0.1).

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

*Needs:* `mathlib:cyclotomicCharacter`, `mathlib:Field.absoluteGaloisGroup`, `mathlib:ContinuousMonoidHom`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `PadicHodgeTheory:R06.2/crystalline-character-classification`.

### Étale (φ,Γ)-modules over O_E, E, E† and R with the covariant Fontaine functor

**Target `R30.1/fontaine-functor-convention` (definition).** Let O_E be the ring of Laurent series Σ_{k∈ℤ} a_k T^k with a_k ∈ O_L and a_k → 0 as k → −∞, E = O_E[1/p], O_E⁺ = O_L[[T]], E† ⊂ E the overconvergent subfield and R the Robba ring over L, with the commuting actions φ(T) = (1+T)^p − 1 and σ_a(T) = (1+T)^a − 1 (a ∈ ℤ_p^× ≅ Γ). The categories in use are ΦΓ^et_tors (étale (φ,Γ)-modules of finite length over O_E), ΦΓ^et(O_E), ΦΓ^et(E), ΦΓ^et(E†) and ΦΓ^et(R) (slope 0, free of finite rank). The covariant Fontaine functors are D(V) = (A ⊗_{ℤ_p} V)^H and V(D) = ((O_L·A) ⊗_{O_E} D)^{φ=1}, with A the p-adic completion of the maximal unramified extension of A_{ℚ_p} and H = ker χ; they are exact quasi-inverse equivalences Rep_tors G_{ℚ_p} ≅ ΦΓ^et_tors, Rep_{O_L} G_{ℚ_p} ≅ ΦΓ^et(O_E) and Rep_L G_{ℚ_p} ≅ ΦΓ^et(E) ≅ ΦΓ^et(E†) ≅ ΦΓ^et(R) (D ↦ D† ↦ D_rig = R ⊗ D†). The Tate dual of a representation is V̌ = Hom(V, L ⊗ χ) (resp. Hom(V, O_L ⊗ χ), Hom(V, L/O_L ⊗ χ)), and V(Ď) = V̌ for the Tate dual Ď of R30.1/tate-dual. This node fixes these conventions for the whole roadmap; the rings, the equivalences and the overconvergence theorem are owned by PhiGammaModulesAndIwasawaCohomology PG.0–PG.2 and PadicHodgeTheory P7:annulus-foundations and are not constructed here.

**Hypotheses.**
- p any prime; L/ℚ_p finite.
- The overconvergence and Robba-ring steps are imported with their fixed-field hypotheses (PG.2) and Kedlaya's slope theory behind ΦΓ^et(E†) ≅ ΦΓ^et(R).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/PhiGamma`, namespace `TauCeti.PhiGammaModuleEt`.

**Uses.**
- Colmez, Théorème 0.17: Π(D) is built from D ∈ ΦΓ^et(E) and satisfies D(Π(D)) = Ď.
- Colmez, Théorème IV.2.14: V(Π) is defined as the Tate dual of V(D(Π)).
- Colmez, Théorème 0.19: D† and D_rig give the locally analytic vectors of Π(D).

**API.**
- `PhiGammaModuleEt.ofRep` (constructor): D(V) = (A ⊗ V)^H, imported from PG.1, covariant.
- `PhiGammaModuleEt.toRep` (constructor): V(D) = ((O_L·A) ⊗ D)^{φ=1}, the quasi-inverse.
- `PhiGammaModuleEt.ofRep_exact` (functoriality): D is exact and commutes with tensor products and duals.
- `PhiGammaModuleEt.overconvergent` (projection): D ↦ D† with D = E ⊗ D† (PG.2).
- `PhiGammaModuleEt.rig` (projection): D ↦ D_rig = R ⊗ D†, an equivalence onto slope-zero modules over R.
- `PhiGammaModuleEt.toRep_tateDual` (compatibility): V(Ď) = V̌ = Hom(V(D), L ⊗ χ).

*Proof sketch.* PG.0 supplies O_E, E, the commuting φ and Γ actions and the étale lattice interface; PG.1 Fontaine's equivalence in its integral, torsion and rational forms; PG.2 the Cherbonnier–Colmez overconvergence and the Robba realisation; PadicHodgeTheory P7:annulus-foundations/robba-ring the Robba ring itself and P7/robba-realisation-comparison the realisation D_rig. Colmez's Théorème I.3.1 states the equivalences with exactly the covariant functors above; this node records that choice so that R30.3's V(Π) (Tate dual of V(D(Π))) and Π(D) (with D(Π(D)) = Ď) have their stated variance. Exactness and compatibility with Tate duals are part of the imported equivalence; V(Ď) = V̌ follows from the pairing D × Ď → O_E dT/(1+T) (R30.1/tate-dual).

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

*Needs:* `PhiGammaModulesAndIwasawaCohomology:PG.0`, `PhiGammaModulesAndIwasawaCohomology:PG.1`, `PhiGammaModulesAndIwasawaCohomology:PG.2`, `PadicHodgeTheory:P7:annulus-foundations/robba-ring`, `PadicHodgeTheory:P7/robba-realisation-comparison`, `mathlib:PowerSeries`, `mathlib:AbstractMeasure.amiceTransformEquiv`.

### The Tate dual of an étale (φ,Γ)-module and the rank-two twist

**Target `R30.1/tate-dual` (construction).** For D ∈ ΦΓ^et(O_E) (resp. ΦΓ^et(E), ΦΓ^et_tors) the Tate dual is Ď = Hom_{O_E}(D, O_E dT/(1+T)) (resp. with E dT/(1+T), (E/O_E) dT/(1+T)) with the induced φ and Γ, where dT/(1+T) carries φ(dT/(1+T)) = dT/(1+T) and σ_a(dT/(1+T)) = a dT/(1+T); the residue of the pairing gives a perfect pairing { , } : Ď × D → O_L, and V(Ď) = V̌. If D has rank 2, then ∧²D = E ⊗ α_D for the character α_D ∈ T̂(O_L) attached to det V(D) by R30.1/character-dictionary, δ_D := (x|x|)^{−1}α_D, and x ↦ x ⊗ δ_D^{−1} is an isomorphism D ≅ Ď ⊗ δ_D, i.e. Ď ≅ D ⊗ δ_D^{−1}.

**Hypotheses.**
- D étale over O_E or E; for the rank-two identity, D of rank 2.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/PhiGamma`, namespace `TauCeti.PhiGammaModuleEt`.

**Uses.**
- Colmez, Théorème 0.17(iii): D(Π(D)) = Ď.
- Colmez, Théorème 0.14 and Proposition IV.4.16: the contragredient uses D ⊠_δ P¹ and Ď ⊠_{δ⁻¹} P¹ in duality.
- Colmez, Théorème II.1.13: the pairing { , }_{P¹} on Ď ⊠_{δ⁻¹} P¹ × D ⊠_δ P¹ is built from { , }.

**API.**
- `PhiGammaModuleEt.tateDual` (constructor): Ď with its φ and Γ.
- `PhiGammaModuleEt.residuePairing` (data): The perfect O_L-bilinear pairing { , } : Ď × D → O_L.
- `PhiGammaModuleEt.tateDual_tateDual` (equivalence): The canonical map D → (Ď)ˇ is an isomorphism.
- `PhiGammaModuleEt.toRep_tateDual'` (compatibility): V(Ď) ≅ V(D)ˇ = Hom(V(D), L ⊗ χ).
- `PhiGammaModuleEt.deltaChar` (projection): δ_D = (x|x|)^{−1}α_D for D of rank 2.
- `PhiGammaModuleEt.tateDual_rank_two` (characterisation): For rank 2, Ď ≅ D ⊗ δ_D^{−1} through the wedge pairing.

*Proof sketch.* The residue map res₀ : O_E dT → O_L gives the pairing {x, y} = res₀(⟨σ_{−1}x, y⟩) used by Colmez; perfectness follows from the perfectness of the residue pairing on O_E. For rank 2 the wedge pairing D × D → ∧²D = E ⊗ α_D is perfect; twisting by the character of dT/(1+T), which is that of x|x| (χ), identifies D with Hom(D, E ⊗ α_D) ⊗ ... and gives Ď ≅ D ⊗ δ_D^{−1}. V(Ď) = V̌ follows from Fontaine's equivalence applied to the pairing (R30.1/fontaine-functor-convention).

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

*Needs:* `R30.1/fontaine-functor-convention`, `R30.1/character-dictionary`, `PhiGammaModulesAndIwasawaCohomology:PG.1`.

### The operator ψ and the lattices D⁺, D^♮ and D^♯

**Target `R30.1/psi-and-treillis` (construction).** Let D be an étale (φ,Γ)-module over O_E (torsion or free). Every x ∈ D is uniquely Σ_{i=0}^{p−1} (1+T)^i φ(x_i), and ψ(x) := x₀ is the left inverse of φ commuting with Γ (PhiGammaModulesAndIwasawaCohomology PG.4). Define D⁺ = {z : (φ^n(z))_n bounded}, D⁺⁺ = {z : φ^n(z) → 0}, D^{nr} = ∩_n φ^n(D), D^♮ = the smallest compact O_E⁺-submodule of D that is stable under ψ and generates D, and D^♯ = the largest compact O_E⁺-submodule of D stable under ψ on which ψ is surjective; for D ∈ ΦΓ^et(E) these are L·Δ^♮, L·Δ^♯ etc. for a φ- and Γ-stable O_E-lattice Δ. Then D⁺⁺ ⊂ D⁺ ⊂ D^♮ ⊂ D^♯, D⁺ = D^{nr} ⊕ D⁺⁺, a surjection D → D₁ of étale modules induces surjections D^♮ → D₁^♮ and D^♯ → D₁^♯, D^{nr} = 0 when V(D)^{H'} = 0 (e.g. D irreducible of rank ≥ 2), and for D torsion, in the residue pairing Ď × D → O_L the orthogonal of D^♮ is Ď⁺ and that of D^♯ is Ď⁺⁺, so D^♯/D^♮ is dual to Ď^{nr}.

**Hypotheses.**
- D étale over O_E; the existence of D^♮ and D^♯ is Colmez's (from his Iwasawa-theory paper [35]).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/PhiGamma`, namespace `TauCeti.PhiGammaModuleEt`.

**Uses.**
- Colmez, Théorème 0.17: Π(D) = (D ⊠ P¹)/(D^♮ ⊠ P¹).
- Colmez, Proposition 0.12(iii): β_{ℚ_p}(Π^∨) lies in D^♯ ⊠ ℚ_p and contains D^♮ ⊠ ℚ_p.
- Colmez, §IV.1: D^♮_W(Π) and D⁺_W(Π) play the roles of D^♮ and D⁺ in the construction of D(Π).

**API.**
- `PhiGammaModuleEt.psi` (data): ψ : D → D, imported from PG.4.
- `PhiGammaModuleEt.plusPart` (constructor): D⁺ = {z : (φ^n z) bounded}.
- `PhiGammaModuleEt.natural` (constructor): D^♮, the smallest compact ψ-stable O_E⁺-submodule generating D.
- `PhiGammaModuleEt.sharp` (constructor): D^♯, the largest compact ψ-stable O_E⁺-submodule on which ψ is onto.
- `PhiGammaModuleEt.plus_le_natural_le_sharp` (relation): D⁺⁺ ⊂ D⁺ ⊂ D^♮ ⊂ D^♯.
- `PhiGammaModuleEt.natural_map_surjective` (functoriality): A surjection f : D → D₁ restricts to surjections D^♮ → D₁^♮ and D^♯ → D₁^♯.
- `PhiGammaModuleEt.psi_surjective_sharp` (characterisation): ψ(D^♯) = D^♯.
- `PhiGammaModuleEt.orthogonal_natural` (relation): For D torsion, (D^♮)^⊥ = Ď⁺ and (D^♯)^⊥ = Ď⁺⁺ in the residue pairing.

*Proof sketch.* ψ is imported from PG.4/linearized-psi with its uniqueness and Γ-compatibility. Existence of D^♮, D^♯ and the inclusions D⁺⁺ ⊂ D⁺ ⊂ D^♮ ⊂ D^♯ are recalled in Colmez §I.3.2 from his earlier paper ([35, II.4–II.5]); they are planned here as recalled statements with that proof route. Surjectivity under quotients (Proposition I.3.2), the description of D^{nr} (Proposition I.3.3) and the duality (Proposition I.3.4) follow from the finite-length theory for torsion modules and passage to the limit.

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

*Needs:* `R30.1/fontaine-functor-convention`, `R30.1/tate-dual`, `PhiGammaModulesAndIwasawaCohomology:PG.4/linearized-psi`, `PhiGammaModulesAndIwasawaCohomology:PG.4/linearized-psi-uniqueness`, `PhiGammaModulesAndIwasawaCohomology:PG.4/psi-zero-splitting`.

### (P(ℤ_p),ψ)-modules and the P(ℚ_p)-module M ⊠ ℚ_p

**Target `R30.1/boxtimes-qp` (construction).** A (P(ℤ_p),ψ)-module is an O_L-module M with an action of P(ℤ_p) and an O_L-linear ψ commuting with (ℤ_p^× 0; 0 1) and satisfying ψ((1 pb; 0 1)z) = (1 b; 0 1)ψ(z). An étale (φ,Γ)-module is one through the dictionary of R30.1/gl2qp-subgroups and ψ of R30.1/psi-and-treillis; so are D^♮ and D^♯. For such M, M ⊠ ℚ_p is the module of sequences (x^{(n)})_{n∈ℕ} in M with ψ(x^{(n+1)}) = x^{(n)}, and there is a unique action of P(ℚ_p) on M ⊠ ℚ_p with (a 0; 0 1)·(x^{(n)}) = ((a 0; 0 1)x^{(n)}) for a ∈ ℤ_p^×, (p^k 0; 0 1)·(x^{(n)}) = (x^{(n+k)}) and (1 b; 0 1)·(x^{(n)}) = ((1 p^n b; 0 1)x^{(n)})_{n ≥ −v_p(b)}. For M the O_L-valued measures D⁰(ℤ_p, O_L) (with ψ = (p^{−1} 0; 0 1) ∘ Res_{pℤ_p}), M ⊠ ℚ_p = D⁰(ℚ_p, O_L) with (a b; 0 1) acting by x ↦ ax + b. Restrictions Res_U : D ⊠ ℚ_p → D ⊠ U to compact opens U ⊂ ℚ_p are defined, D ⊠ ℤ_p = D and D ⊠ ℤ_p^× = D^{ψ=0}; adjoining the action of the centre (d 0; 0 d) by δ(d) gives the B-module D ⊠_δ ℚ_p.

**Hypotheses.**
- M a (P(ℤ_p),ψ)-module; δ ∈ T̂(O_L) for D ⊠_δ ℚ_p.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Mirabolic`, namespace `TauCeti.PsiModule`.

**Uses.**
- Colmez, Proposition 0.12(iii): β_{ℚ_p} : Π^∨ → D ⊠_δ ℚ_p is B-equivariant with kernel (Π^∨)^U.
- Colmez, Théorème 0.17: D^♮ ⊠ P¹ is defined by Res_{ℚ_p} z ∈ D^♮ ⊠ ℚ_p.
- Colmez, §13.1: Π\* ≅ D^♮ ⊠ ℚ_p as P(ℚ_p)-modules for trianguline Π.

**API.**
- `PsiModule` (structure): (P(ℤ_p),ψ)-modules over O_L.
- `PsiModule.boxtimesQp` (constructor): M ⊠ ℚ_p as ψ-compatible sequences.
- `PsiModule.boxtimesQp_action` (instance): The unique P(ℚ_p)-action given by the three formulas.
- `PsiModule.res` (projection): Res_U : M ⊠ ℚ_p → M ⊠ U for compact open U.
- `PsiModule.res_Zp` (simp): M ⊠ ℤ_p = M and Res_{ℤ_p}((p^k 0; 0 1)·x) = x^{(k)}.
- `PsiModule.boxtimesQp_measures` (compatibility): For M = D⁰(ℤ_p, O_L), M ⊠ ℚ_p ≅ D⁰(ℚ_p, O_L) P(ℚ_p)-equivariantly.
- `PsiModule.boxtimesZpUnits` (characterisation): D ⊠ ℤ_p^× = D^{ψ=0}.

*Proof sketch.* Uniqueness: the three formulas determine the action on the generators of P(ℚ_p) (R30.1/gl2qp-subgroups); existence is checked on relations, using that ψ commutes with (ℤ_p^× 0; 0 1) and the twisted commutation with unipotents (Colmez Proposition 0.5). For measures, (x^{(n)}) ↦ the measure on ℚ_p whose restriction to p^{−n}ℤ_p is x^{(n)} rescaled identifies the inverse limit with D⁰(ℚ_p, O_L). D ⊠ ℤ_p^× = D^{ψ=0} follows from the decomposition D = φ(D) ⊕ D^{ψ=0} (PG.4/psi-zero-splitting).

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

*Needs:* `R30.1/gl2qp-subgroups`, `R30.1/psi-and-treillis`, `PhiGammaModulesAndIwasawaCohomology:PG.4/psi-zero-splitting`, `mathlib:AbstractMeasure`.

### Rank-one (φ,Γ)-modules R(δ) over the Robba ring

**Target `R30.1/rank-one-robba-modules` (definition).** For δ ∈ T̂(L), R(δ) is the (φ,Γ)-module over the Robba ring R = R_L that is R itself with φ multiplied by δ(p) and γ ∈ Γ multiplied by δ(χ(γ)). (i) Every (φ,Γ)-module of rank 1 over R is isomorphic to R(δ) for a unique δ ∈ T̂(L). (ii) R(δ) has Kedlaya slope v_p(δ(p)); it is étale (slope 0) iff δ is unitary, and then R(δ) = D_rig(δ) for δ viewed as a Galois character. (iii) Ext¹(R(δ₂), R(δ₁)) = Ext¹(R, R(δ₁δ₂^{−1})) = H¹(δ₁δ₂^{−1}) is one-dimensional over L unless δ₁δ₂^{−1} is x^{−i} (i ∈ ℕ) or |x|x^i (i ≥ 1), when it is two-dimensional, with projectivisation ℙ¹(L).

**Hypotheses.**
- p ≠ 2 in the source read (Colmez, Représentations triangulines, §0.1 and its footnote 1); the p = 2 case of (i) and (iii) is recorded as gap G2 of this packet.
- L/ℚ_p finite; R = R_L the Robba ring over L.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Trianguline`, namespace `TauCeti.RobbaRankOne`.

**Uses.**
- Colmez, Représentations triangulines, §0.4: trianguline representations are those with D_rig(V) an extension of R(δ₂) by R(δ₁).
- LocalGaloisDeformationRings R08.1/phi-gamma-module-deformation-rings: trianguline deformations are parametrised by deformations of the characters δ.
- this roadmap R30.4/trianguline-locally-analytic-vectors: Π(Δ(s)) for s = (δ₁, δ₂, ℒ).

**API.**
- `RobbaRankOne` (constructor): R(δ) for δ ∈ T̂(L).
- `RobbaRankOne.classification` (characterisation): Every rank-one (φ,Γ)-module over R is isomorphic to a unique R(δ).
- `RobbaRankOne.slope` (projection): slope(R(δ)) = v_p(δ(p)).
- `RobbaRankOne.isEtale_iff` (characterisation): R(δ) is étale iff δ is unitary, and then R(δ) ≅ D_rig(δ).
- `RobbaRankOne.tensor` (simp): R(δ₁) ⊗ R(δ₂) ≅ R(δ₁δ₂) and R(δ)^∨ ≅ R(δ^{−1}).
- `RobbaRankOne.finrank_ext` (relation): dim_L Ext¹(R(δ₂), R(δ₁)) is 1, or 2 exactly when δ₁δ₂^{−1} ∈ {x^{−i} : i ≥ 0} ∪ {|x|x^i : i ≥ 1}.

*Proof sketch.* (i): a rank-one module is R·e with φ(e) = a e and γ(e) = b(γ) e; Colmez's Proposition 3.1 shows that after changing e one may take a ∈ L^× and b a character of Γ with values in L^×, and δ is recovered by δ(p) = a, δ|_{ℤ_p^×} = b∘χ^{−1}. (ii): Kedlaya's slope filtration (PG.2 / PadicHodgeTheory P7) gives the slope v_p(δ(p)); étaleness iff slope 0. (iii): Colmez's computation of H⁰, H¹ of R(δ) via the Herr complex (PG.3) and the operator ∂ = (1+T)d/dT (Théorème 2.9 there).

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

*Needs:* `R30.1/character-dictionary`, `R30.1/fontaine-functor-convention`, `PadicHodgeTheory:P7:annulus-foundations/robba-ring`, `PhiGammaModulesAndIwasawaCohomology:PG.2`, `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-complex`.

### Trianguline representations of dimension 2 and Colmez's parameter space

**Target `R30.1/trianguline-representation` (definition).** A two-dimensional L-representation V of G_{ℚ_p} is trianguline if D_rig(V) is an extension 0 → R(δ₁) → D_rig(V) → R(δ₂) → 0 (R30.1/rank-one-robba-modules). Colmez's space S parametrises s = (δ₁, δ₂, ℒ) with ℒ ∈ ℙ(Ext¹(R(δ₂), R(δ₁))) (a point except on the loci δ₁δ₂^{−1} = x^i|x| (i ≥ 1) or x^{−i} (i ≥ 0), where it is ℙ¹(L)); S₊ is cut out by v_p(δ₁(p)) + v_p(δ₂(p)) = 0 and v_p(δ₁(p)) ≥ 0, with u(s) = v_p(δ₁(p)), w(s) = w(δ₁) − w(δ₂), and S₊ = S^{ng} ⊔ S^{cris} ⊔ S^{st} ⊔ S^{ord} ⊔ S^{ncl}, S_irr = S^{ng}_\* ⊔ S^{cris}_\* ⊔ S^{st}_\* (∗: u(s) > 0). For s ∈ S_\* ∖ S^{ncl}_\*, D(s) is étale and V(s) := V(D(s)) is trianguline; V(s) is irreducible iff s ∈ S_irr; det V(s) = δ₁δ₂ and its Hodge–Tate weights are w(δ₁), w(δ₂); every irreducible trianguline V is some V(s), and V(s) ≅ V(s') for s ≠ s' in S_irr iff s, s' ∈ S^{cris}_\* and s' = (x^{w(s)}δ₂, x^{−w(s)}δ₁, ∞). A two-dimensional crystalline V is trianguline iff the φ-eigenvalues on D_cris(V) lie in L; every two-dimensional semistable V is trianguline.

**Hypotheses.**
- p ≠ 2 in the source read (Colmez, Représentations triangulines, §0.1, footnote 1); the p = 2 case is gap G2.
- V two-dimensional over L with L large enough to contain the needed eigenvalues.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Trianguline`, namespace `TauCeti.Trianguline`.

**Uses.**
- Colmez 2010, Remarque 0.18(iii): G-stability of D^♮ ⊠ P¹ is proved by analytic continuation from the trianguline (or crystabelline) case.
- Colmez 2010, Remarque VI.6.51(i): Π^alg is supersingular iff V(D) is not trianguline.
- Colmez 2014, La série principale unitaire, Théorème 0.1: Π(Δ(s)) and the unitary principal series.
- roadmap Required examples: the trianguline example check.

**API.**
- `Trianguline.IsTrianguline` (characterisation): V is trianguline iff D_rig(V) has a rank-one (φ,Γ)-stable saturated R-submodule.
- `Trianguline.param` (constructor): The triple s = (δ₁, δ₂, ℒ) of a non-split trianguline D.
- `Trianguline.rep` (constructor): V(s) for s ∈ S_\* ∖ S^{ncl}_\*.
- `Trianguline.det_rep` (simp): det V(s) = δ₁δ₂.
- `Trianguline.hodgeTate_rep` (relation): The Hodge–Tate weights of V(s) are w(δ₁) and w(δ₂).
- `Trianguline.irreducible_iff` (characterisation): V(s) is irreducible iff s ∈ S_irr.
- `Trianguline.crystalline_iff` (compatibility): A two-dimensional crystalline V is trianguline iff the φ-eigenvalues on D_cris(V) are in L.

*Proof sketch.* The parameter space and its stratification are defined from the rank-one classification and the Ext¹ computation (R30.1/rank-one-robba-modules). Slope 0 of D(s) for s ∈ S_\* ∖ S^{ncl}_\* and irreducibility for s ∈ S_irr: Colmez's Théorème 0.5, via Kedlaya's slope filtration. Hodge–Tate weights and determinant: Colmez's Propositions 4.4–4.5, via Sen theory on D_dif (PadicHodgeTheory P7/fontaine-dif-module). Crystalline and semistable criteria: Théorème 0.8 and Remarque 0.9, using Berger's dictionary D_cris, D_st from D_rig (PadicHodgeTheory P7/berger-dcris-dst-dictionary).

**Checks.**
- `Trianguline.semistable_isTrianguline` (characterisation): Every two-dimensional semistable V is trianguline.
- `Trianguline.split_sum` (degenerate): For unitary δ₁, δ₂, the split module R(δ₁) ⊕ R(δ₂) corresponds to δ₁ ⊕ δ₂, which is trianguline and not in the image of S_irr.
- `Trianguline.rep_cris_coincidence` (computation): For s = (δ₁, δ₂, ∞) ∈ S^{cris}_\*, V(s) ≅ V(x^{w(s)}δ₂, x^{−w(s)}δ₁, ∞).
- `Trianguline.not_supercuspidal` (non-example): A de Rham V with irreducible Weil–Deligne representation (supercuspidal type) is not trianguline.

**Acceptance.**
- A crystalline V with Frobenius eigenvalues in L is V(s) for s ∈ S^{cris}_\*.
- A V whose Weil–Deligne representation is irreducible (supercuspidal type) is not trianguline.

**Sources.**
- COLMEZ08TRI, §0.2–0.4, pp. 2–5: the space S_irr, Théorème 0.5, Remarque 0.7, Théorème 0.8, Remarque 0.9: Defines S, S₊, u(s), w(s), the strata ng, cris, st, ord, ncl and S_irr; shows D(s) is étale off S^{ncl}_\* and V(s) irreducible exactly on S_irr, with the only coincidences on S^{cris}_\*; gives Hodge–Tate weights w(δ₁), w(δ₂) and the crystalline and semistable criteria.
- COLMEZ08TRI, Propositions 4.4, 4.5 and 4.8, pp. 23–24: det V(s) = δ₁δ₂, Hodge–Tate weights w(δ₁) and w(δ₂), and V(s) irreducible iff s ∈ S_irr.

*Needs:* `R30.1/rank-one-robba-modules`, `PadicHodgeTheory:P7/fontaine-dif-module`, `PadicHodgeTheory:P7/berger-dcris-dst-dictionary`, `PadicHodgeTheory:R06.2/admissible-representations`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`.

### Colmez's classical correspondence LL(M) against R16.3

**Target `R30.1/classical-normalisation-bridge` (comparison).** Let M be a two-dimensional representation of the Weil–Deligne group WD_{ℚ_p} over L that is not a twist of the trivial representation by a character, with Frobenius normalised as in PadicHodgeTheory R06.3/weil-deligne-parameter and characters read through R30.1/character-dictionary. Colmez's LL(M) is: Ind_B^G(δ₁ ⊗ δ₂|·|^{−1}) (≅ Ind_B^G(δ₂ ⊗ δ₁|·|^{−1})) for M = δ₁ ⊕ δ₂ with δ₁ ∉ {δ₂, δ₂|·|, δ₂|·|^{−1}}; for M = δ ⊕ δ|·| with N = 0, the reducible Ind_B^G(δ|·| ⊗ δ|·|^{−1}), an extension of δ∘det by St ⊗ (δ∘det); for M = δ ⊕ δ|·| with N ≠ 0, St ⊗ (δ∘det); for the non-split extension of δ by δ, Ind_B^G(δ ⊗ δ|·|^{−1}); and for M irreducible, the supercuspidal rec^{−1}(M). For a filtration with jumps a < b put LL(M, Fil) = LL(M) ⊗ W_{a,b−a} with W_{a,k} = Sym^{k−1} ⊗ det^a. The bridge theorem: for M not of the form δ ⊕ δ|·| with N = 0, LL(M) is the irreducible π with rec(π) ⊗ ν^{1/2} ≅ M, where rec is the unitary correspondence of GL2AutomorphicRepresentationsAndTransfer R16.3 and ν = |·|; equivalently M ≅ recᵀ(π) ⊗ ν for the Tate normalisation recᵀ(π) = rec(π) ⊗ ν^{−1/2} of R16.3/tate-unitary-normalization, so det M = ω_π·ν. In the case M = δ ⊕ δ|·| with N = 0, Colmez takes the full reducible principal series Ind_B^G(δ|·| ⊗ δ|·|^{−1}) instead of the one-dimensional Langlands quotient that rec^{−1} attaches. Colmez’s functor V and the Kisin–Emerton functor MF differ by a Tate twist: V(π) = MF(π)(ε).

**Hypotheses.**
- M two-dimensional, not a character twist of the trivial representation.
- The geometric-Frobenius normalisation on both sides (R30.1/character-dictionary, R16.3).

**Uses.**
- Colmez, Théorème 0.21 and VI.6.50: Π(D)^lc = LL(D_pst).
- Emerton, lg Theorem 3.3.22: π_p(V) and the locally algebraic vectors Sym^{a−b−1} ⊗ det^{b+1} ⊗ π_p(V).
- CDP 2014, Theorem 1.3: completions of π ⊗ W are classified with π attached to Δ by the classical correspondence.

*Proof sketch.* Write each case of Colmez's list in R16.3's normalised induction i_B^G(a, b) = Ind_B^G(a|·|^{1/2} ⊗ b|·|^{−1/2}): Ind_B^G(δ₁ ⊗ δ₂|·|^{−1}) = i_B^G(δ₁|·|^{−1/2}, δ₂|·|^{−1/2}), whose unitary parameter is (δ₁ ⊕ δ₂)|·|^{−1/2} by R16.3/principal-series-parameter; twisting by ν^{1/2} gives M, and R16.3/tate-unitary-normalization rewrites this as recᵀ ⊗ ν. The Steinberg case: R16.3/steinberg-monodromy gives the monodromy-nonzero parameter of St ⊗ (δ∘det), matching Colmez's N ≠ 0 case. The N = 0 non-generic case is where Colmez's LL differs from rec^{−1}: R16.3 attaches the one-dimensional Langlands quotient, Colmez the reducible principal series; record the difference explicitly. Supercuspidal case: R16.3/supercuspidal-parameter with the same twist by ν^{1/2}. V(π) = MF(π)(ε): Colmez defines V(Π) as the Tate dual of V(D(Π)), Emerton defines MF(π) as its Pontryagin dual (Emerton lg §3.2, footnote 6), and the two duals differ by χ.

**Acceptance.**
- For M = μ_α ⊕ μ_β unramified with α/β ∉ {1, p, p^{−1}}, LL(M) = Ind_B^G(μ_α ⊗ μ_β|·|^{−1}) has central character μ_{αβ}|·|^{−1}, and its unitary parameter under R16.3 is (μ_α ⊕ μ_β)|·|^{−1/2}.
- For M = δ ⊕ δ|·| with N ≠ 0, LL(M) = St ⊗ (δ∘det), whose R16.3 parameter δ|·|^{1/2} ⊕ δ|·|^{−1/2} with nonzero monodromy becomes M after the twist by |·|^{1/2}.
- LL(M ⊗ η) = LL(M) ⊗ (η∘det) for a character η, and the central character of LL(M) is det(M)·|·|^{−1}.

**Sources.**
- COLMEZ10, §VI.6.11, p. 192: Lists LL(M) for the reducible two-dimensional WD-representations (generic sum, δ ⊕ δ|·| with N = 0 or N ≠ 0, non-split self-extension), using δ(g) = δ(p)^{−deg g}δ(χ(g)), and defines LL(M, Fil) = LL(M) ⊗ W_{a,b−a} for jumps a < b.
- COLMEZ10, Introduction §11, p. 17: LL(D_pst) is irreducible except when N = 0 although the W_{ℚ_p}-action would allow N ≠ 0.
- EMERTON-LG, §3.2, p. 19 and footnote 6: MF(π) is the Pontryagin dual of the Galois representation of D(π); Colmez's V carries an additional cyclotomic twist.
- EMERTON-LG, Notation and conventions, pp. 11–13: Emerton normalises the local Artin map by ℓ ↦ geometric Frobenius and attaches to an irreducible Ind_B^G(χ₁ ⊗ χ₂) the Weil–Deligne representation χ₁ ⊕ χ₂|·|^{−1}.

*Needs:* `R30.1/character-dictionary`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/steinberg-monodromy`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/tate-unitary-normalization`, `PadicHodgeTheory:R06.3/weil-deligne-parameter`, `PadicHodgeTheory:R06.3/convention-comparison-with-r01`.

### Dependencies of R30.1

Other roadmaps: `GL2AutomorphicRepresentationsAndTransfer:R16.1`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/steinberg-monodromy`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/tate-unitary-normalization`, `PadicHodgeTheory:P7/berger-dcris-dst-dictionary`, `PadicHodgeTheory:P7/fontaine-dif-module`, `PadicHodgeTheory:P7/robba-realisation-comparison`, `PadicHodgeTheory:P7:annulus-foundations/robba-ring`, `PadicHodgeTheory:R06.2/admissible-representations`, `PadicHodgeTheory:R06.2/crystalline-character-classification`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`, `PadicHodgeTheory:R06.3/convention-comparison-with-r01`, `PadicHodgeTheory:R06.3/weil-deligne-parameter`, `PhiGammaModulesAndIwasawaCohomology:PG.0`, `PhiGammaModulesAndIwasawaCohomology:PG.1`, `PhiGammaModulesAndIwasawaCohomology:PG.2`, `PhiGammaModulesAndIwasawaCohomology:PG.3/herr-complex`, `PhiGammaModulesAndIwasawaCohomology:PG.4/linearized-psi`, `PhiGammaModulesAndIwasawaCohomology:PG.4/linearized-psi-uniqueness`, `PhiGammaModulesAndIwasawaCohomology:PG.4/psi-zero-splitting`. Within this roadmap the layer uses the earlier layers only.

## R30.2. The local representation categories

The three categories of the correspondence are specialisations of general theories: smooth torsion representations (SmoothRepresentationsOfLocalGroups SR.0), admissible unitary Banach representations (LocallyAnalyticDistributionsPartII ND.6, with the compact-open test requested there) and locally analytic representations (ND.1–ND.2). The layer specialises them to GL₂(ℚ_p), adds Pontryagin duals and universal unitary completions, and proves the mod p input special to ℚ_p: the classification of irreducible smooth representations (Barthel–Livné, Breuil), their admissibility and finite presentation, and the mod ℓ irreducibles of GL₂(ℤ_ℓ), U₀(ℓ) and Ũ₀(ℓ). A comparison target records what fails for GL₂(F), F ≠ ℚ_p.

**Targets of the layer.** Smooth, locally finite and locally admissible torsion representations of GL₂(ℚ_p); The Pontryagin dual category C_{G,ζ}(O) of compact O[[K]]-modules; Admissible unitary Banach representations of GL₂(ℚ_p); Locally analytic and locally algebraic vectors of GL₂(ℚ_p)-representations; Universal unitary completions; Mod p principal series and Steinberg representations; Classification of irreducible mod p representations of GL₂(ℚ_p); Irreducible mod ℓ representations of GL₂(ℤ_ℓ), U₀(ℓ) and Ũ₀(ℓ); What fails for GL₂(F) with F ≠ ℚ_p.

**Planets.** Locally admissible mod p representations; Admissible unitary Banach representations; Classification of irreducible mod p representations.

### Smooth, locally finite and locally admissible torsion representations of GL₂(ℚ_p)

**Target `R30.2/smooth-torsion-categories` (definition).** Let ζ : Z → O^× be a continuous character. Mod^{sm}_{G}(O) is the category of smooth representations of G = GL₂(ℚ_p) on O-torsion modules (every vector has open stabiliser; the module carries the discrete topology), and Mod^{sm}_{G,ζ}(O) its full subcategory on which Z acts through ζ. A smooth π is admissible if π^H[ϖ^n] is a finitely generated O-module for every compact open H and n; locally admissible if O[G]v is admissible for every v; locally finite if O[G]v has finite length for every v. Mod^{l.adm}_{G,ζ}(O) ⊂ Mod^{sm}_{G,ζ}(O) and Mod^{l.fin}_{G,ζ}(O) are the corresponding full subcategories, and Rep^{tors}G (Colmez) is the category of smooth admissible O_L[G]-modules of finite length with a central character; Rep^{ℓf}G is the category of finite length smooth objects. These specialise the smooth category of SmoothRepresentationsOfLocalGroups SR.0 (coefficients A = O/ϖ^n, G = GL₂(ℚ_p)); they are abelian, closed under subquotients and arbitrary direct sums (for l.adm and l.fin), and are Grothendieck categories in which every object has an injective envelope. For G = GL₂(ℚ_p) every irreducible smooth representation is admissible and finitely presented, so Rep^{ℓf}G ⊂ Rep^{adm}G ∩ Rep^{pf}G and the finite length objects of Mod^{l.adm}_{G,ζ}(O) and Mod^{l.fin}_{G,ζ}(O) coincide with Rep^{tors}G.

**Hypotheses.**
- O = O_L, ϖ, k = k_L as in R30.1/character-dictionary; ζ continuous.
- The finite-length statement uses the classification of R30.2/modp-irreducibles, which is special to F = ℚ_p.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/SmoothTorsion`, namespace `TauCeti.GL2Qp`.

**Uses.**
- Paškūnas 2013, §1.1: blocks and the Gabriel decomposition of Mod^{l.fin}_{G,ζ}(O).
- Colmez, Théorème IV.2.13: D(Π) is defined on Rep^{tors}G.
- CDN 2023, §1.3.3: blocks of Rep^{ℓf}G and of Rep^{δ}G.

**API.**
- `GL2Qp.SmoothTorsionRep` (data): Objects of Mod^{sm}_{G,ζ}(O): TopRep O G that are IsSmoothDiscrete, ϖ-power torsion, with Z acting by ζ.
- `GL2Qp.IsAdmissible` (characterisation): π^H[ϖ^n] finitely generated over O for all compact open H and n.
- `GL2Qp.IsLocallyAdmissible` (characterisation): O[G]v admissible for all v.
- `GL2Qp.IsLocallyFinite` (characterisation): O[G]v of finite length for all v.
- `GL2Qp.locallyAdmissible_grothendieck` (instance): Mod^{l.adm}_{G,ζ}(O) is a Grothendieck abelian category.
- `GL2Qp.exists_injectiveEnvelope` (universal-property): Every object of Mod^{l.adm}_{G,ζ}(O) has an injective envelope.
- `GL2Qp.finiteLength_isAdmissible` (relation): A finite length smooth representation of GL₂(ℚ_p) is admissible and finitely presented.
- `GL2Qp.isLocallyFinite_iff_isLocallyAdmissible` (equivalence): For GL₂(ℚ_p) with central character, locally finite ⇔ locally admissible.

*Proof sketch.* Import the smooth category over a ring, admissibility and local admissibility from SmoothRepresentationsOfLocalGroups SR.0 (SR.0.1–SR.0.4 and SR.0:derived-extension.1, which proves the Grothendieck property and supplies injective envelopes) and specialise to A = O/ϖ^n and G = GL₂(ℚ_p). Smoothness at the pin is Tau Ceti's IsSmoothDiscrete on TopRep (discrete module, open point stabilisers). Every irreducible smooth representation is admissible and finitely presented (CDN 2023 §1.2.3, from Barthel–Livné and Breuil), and both properties are stable under extensions, giving Rep^{ℓf}G ⊂ Rep^{adm}G ∩ Rep^{pf}G; hence a locally finite object is locally admissible and finite length objects are admissible. Locally admissible ⇒ locally finite: O[G]v is finitely generated and admissible, hence has admissible cosocle, hence finite length (CDN 2023 Théorème 1.21 for objects killed by ϖ, and dévissage along ϖ-adic filtrations). Gabriel's theory of locally finite Grothendieck categories applies (Paškūnas 2013 §2 and [35, §IV] there).

**Checks.**
- `GL2Qp.trivial_isLocallyFinite` (degenerate): The trivial one-dimensional representation over k is in Mod^{l.fin}_{G,1}(k).
- `GL2Qp.compactInduction_not_isLocallyFinite` (non-example): c-Ind_{KZ}^G Sym^r k² is smooth with central character but not locally finite.
- `GL2Qp.principalSeries_finiteLength` (computation): Ind_B^G(χ₁ ⊗ χ₂) over k has length 1 or 2.
- `GL2Qp.smooth_compat` (compatibility): A representation is in Mod^{sm}_G(k) iff its TopRep is IsSmoothDiscrete with k discrete (Tau Ceti IsSmoothDiscrete).

**Acceptance.**
- The trivial representation and Ind_B^G(χ₁ ⊗ χ₂) lie in Mod^{l.fin}_{G,ζ}(k) for the matching ζ.
- c-Ind_{KZ}^G σ is smooth but not locally finite: it is a free k[T]-module of infinite rank (FiniteFlat R07.5).

**Sources.**
- PASKUNAS13, §1, pp. 2–4; §2: Defines Mod^{sm}_{G,ζ}(O), Mod^{l.fin}_{G,ζ}(O) and works with injective envelopes in locally finite categories, citing Gabriel.
- CDN23, §1.2.1–1.2.3, pp. 14–16; Théorème 1.21, p. 22: Barthel–Livné classification over F̄_p, Breuil's irreducibility, Berger's central character theorem, and the conclusion that every irreducible smooth representation of GL₂(ℚ_p) is admissible and finitely presented, so Rep^{ℓf}G ⊂ Rep^{adm}G ∩ Rep^{pf}G; a finitely generated smooth k_L[G']-module with admissible cosocle has finite length.
- COLMEZ10, Introduction §4, p. 8 (and footnote 3): Defines Rep^{tors}G as smooth admissible finite length O_L[G]-modules with a central character and notes that admissibility follows from the other conditions.

*Needs:* `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `tauceti:TauCeti.IsSmoothDiscrete`, `mathlib:TopRep`, `mathlib:CategoryTheory.IsGrothendieckAbelian`, `tauceti:TauCeti.IsInjectiveEnvelope`, `R30.1/gl2qp-subgroups`.

### The Pontryagin dual category C_{G,ζ}(O) of compact O[[K]]-modules

**Target `R30.2/pontryagin-dual-category` (construction).** Fix a compact open H ⊂ G (one may take H = K or I₁). Mod^{pro aug}_G(O) is Emerton's category of profinite O[[H]]-modules with an O[G]-action that agrees with the O[[H]]-action on O[H]; π ↦ π^∨ = Hom^{cont}_O(π, L/O) is an anti-equivalence Mod^{sm}_G(O) ≅ Mod^{pro aug}_G(O). C_{G,ζ}(O) is the full subcategory anti-equivalent to Mod^{l.adm}_{G,ζ}(O) (or to Mod^{l.fin}_{G,ζ}(O)), C_{G,ζ}(k) the objects killed by ϖ. Since anti-equivalences reverse arrows, every object of C_{G,ζ}(O) has a projective envelope; an object M of C(O) is admissible iff M is a finitely generated O[[H]]-module (equivalently M^∨ is admissible), and O[[H]] is the completed group algebra of PadicMeasuresIwasawaAlgebras L1.

**Hypotheses.**
- H compact open in G; O[[H]] = lim O/ϖ^n[H/H'] over open normal H'.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/DualCategory`, namespace `TauCeti.GL2Qp`.

**Uses.**
- Paškūnas 2013, §§3–5: the projective envelope P̃ of π^∨ and its endomorphism ring.
- Nakamura 2023, Lemma B.23: the dual π\* of a deformation lies in C^ψ(O).
- CompletedCohomologyAndLocalGlobalCompatibility R31: Pontryagin duals of completed cohomology are objects of C(O).

**API.**
- `GL2Qp.DualCategory` (data): C_{G,ζ}(O): profinite O[[K]]-modules with compatible G-action and central character ζ^{−1} (dual convention).
- `GL2Qp.pontryaginDual` (constructor): π ↦ π^∨ = Hom^{cont}_O(π, L/O) with ⟨gμ, v⟩ = ⟨μ, g^{−1}v⟩.
- `GL2Qp.pontryaginDual_antiEquivalence` (equivalence): π ↦ π^∨ is an anti-equivalence Mod^{l.adm}_{G,ζ}(O) ≅ C_{G,ζ}(O).
- `GL2Qp.exists_projectiveEnvelope` (universal-property): Every object of C_{G,ζ}(O) has a projective envelope.
- `GL2Qp.dual_isAdmissible_iff_fg` (characterisation): M ∈ C(O) is admissible iff it is finitely generated over O[[K]].

*Proof sketch.* Pontryagin duality for discrete torsion O-modules versus compact O-modules (Mathlib PontryaginDual over the circle, specialised to L/O) gives the anti-equivalence on underlying modules; the G-action is transported and is compatible with the O[[H]]-module structure by smoothness. Admissibility ⇔ finite generation over O[[H]]: π^{H'}[ϖ] finite for all H' ⇔ π^∨/𝔪 finite-dimensional ⇔ π^∨ finitely generated by topological Nakayama (PadicMeasuresIwasawaAlgebras L5, compact inverse systems and topological Nakayama). Projective envelopes in C(O) are duals of injective envelopes in Mod^{l.adm}_{G,ζ}(O) (R30.2/smooth-torsion-categories).

**Checks.**
- `GL2Qp.pontryaginDual_trivial` (computation): (k)^∨ ≅ k with trivial action.
- `GL2Qp.pontryaginDual_zero` (degenerate): 0^∨ = 0.
- `GL2Qp.pontryaginDual_compactInduction_not_fg` (non-example): (c-Ind_{KZ}^G σ)^∨ is not finitely generated over O[[K]].
- `GL2Qp.pontryaginDual_dual` (characterisation): (π^∨)^∨ ≅ π naturally (Pontryagin biduality).

**Acceptance.**
- The dual of the trivial representation k is k.
- (c-Ind_{KZ}^G σ)^∨ is not finitely generated over O[[K]], matching non-admissibility.

**Sources.**
- PASKUNAS13, §1.2, pp. 6–7; §2: Introduces Mod^{pro aug}_G(O) after Emerton, the anti-equivalence π ↦ π^∨, the subcategories C(O) and C(k), and the existence of projective envelopes in C(O) by dualising injective envelopes.
- NAKAMURA23, Appendix B.3.2, p. 100 (arXiv): Uses C^ψ(O) and C(O), the Pontryagin duals of locally admissible representations with or without central character ψ.

*Needs:* `R30.2/smooth-torsion-categories`, `PadicMeasuresIwasawaAlgebras:L1`, `PadicMeasuresIwasawaAlgebras:L5`, `mathlib:PontryaginDual`, `tauceti:TauCeti.IsProjectiveCover`.

### Admissible unitary Banach representations of GL₂(ℚ_p)

**Target `R30.2/admissible-unitary-banach` (definition).** A unitary L-Banach representation Π of G is an L-Banach space with a continuous G-action admitting an open bounded G-stable O-lattice Θ; Π is admissible if Θ/ϖΘ is an admissible smooth k-representation (equivalently Θ^d = Hom^{cont}_O(Θ, O) is finitely generated over O[[K]], equivalently Π restricted to one, hence every, compact open subgroup is admissible in the sense of Schneider–Teitelbaum). Ban^{adm}_{G,ζ}(L) is the category of admissible unitary L-Banach representations with central character ζ; it is abelian, being anti-equivalent through Θ ↦ Θ^d ⊗ L to finitely generated L ⊗ O[[K]]-modules with compatible G-action. Π is residually of finite length if Θ/ϖΘ has finite length (independent of Θ, with Π̄^{ss} := (Θ/ϖΘ)^{ss} independent of Θ); Rep_L G (Colmez, CDP) is the full subcategory of Π with a central character and residually of finite length, Rep_{O_L}G the p-adically complete separated ϖ-torsion-free O[G]-modules Θ with Θ/ϖ^nΘ ∈ Rep^{tors}G. An absolutely irreducible Π is ordinary if it is a subquotient of a unitary parabolic induction (Ind_B^G η₁ ⊗ η₂)^{cont} of unitary characters.

**Hypotheses.**
- Coefficients L/ℚ_p finite; Π with central character for Ban^{adm}_{G,ζ}(L).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Banach`, namespace `TauCeti.GL2Qp`.

**Uses.**
- CDP 2014, Theorem 1.1: the bijection between absolutely irreducible non-ordinary objects and two-dimensional Galois representations.
- CompletedCohomologyPartII CC.2 and CC.5: the arithmetic unitary Banach representations are objects of this category for GL₂(ℚ_p).
- Paškūnas 2013, Proposition 1.8: Ban^{adm}_{G,ζ}(L) decomposes into a direct sum over blocks.

**API.**
- `GL2Qp.UnitaryBanachRep` (data): An L-Banach space with continuous G-action and an open bounded G-stable O-lattice.
- `GL2Qp.UnitaryBanachRep.IsAdmissible` (characterisation): Θ/ϖΘ admissible for an (equivalently every) open bounded G-stable lattice Θ.
- `GL2Qp.UnitaryBanachRep.isAdmissible_iff_fg` (characterisation): Π admissible iff Θ^d is finitely generated over O[[K]] (ND.6).
- `GL2Qp.UnitaryBanachRep.abelian` (instance): Ban^{adm}_{G,ζ}(L) is abelian.
- `GL2Qp.UnitaryBanachRep.IsResiduallyFiniteLength` (characterisation): Θ/ϖΘ has finite length.
- `GL2Qp.UnitaryBanachRep.residualSemisimplification` (projection): Π̄^{ss} := (Θ/ϖΘ)^{ss}, independent of Θ.
- `GL2Qp.UnitaryBanachRep.IsOrdinary` (characterisation): Absolutely irreducible and a subquotient of a unitary parabolic induction of unitary characters.
- `GL2Qp.UnitaryBanachRep.reduction` (functoriality): Θ ↦ Θ/ϖ^nΘ lands in Mod^{l.adm}_{G,ζ}(O/ϖ^n).

*Proof sketch.* Specialise LocallyAnalyticDistributionsPartII ND.6/banach-iwasawa-duality (Schneider–Teitelbaum Lemma 3.4 and Theorem 3.5 for the compact group K) and transport the G-action; independence of the compact open subgroup is the requested compact-open test (request to LocallyAnalyticDistributionsPartII ND.6). Θ/ϖΘ admissible ⇔ Θ^d/ϖ finitely generated over k[[K]] ⇔ Θ^d finitely generated over O[[K]] (topological Nakayama, R30.2/pontryagin-dual-category). Residual finite length and the independence of Π̄^{ss} from Θ: any two open bounded lattices are commensurable, and semisimplification of Θ/ϖ is a Brauer–Nesbitt type invariant (CDP §1.1). By CDP Corollary 1.6, an object of Ban^{adm}_G(L) has finite length iff it is residually of finite length (R30.3/cdp-correspondence).

**Checks.**
- `GL2Qp.UnitaryBanachRep.character_isAdmissible` (computation): A unitary character η∘det is a one-dimensional admissible unitary Banach representation, ordinary, with Π̄^{ss} = η̄∘det.
- `GL2Qp.UnitaryBanachRep.zero` (degenerate): The zero representation is admissible and residually of length 0.
- `GL2Qp.UnitaryBanachRep.not_unitary_of_central` (non-example): If Z acts by a character with |ζ(p)| ≠ 1 there is no bounded G-stable lattice.
- `GL2Qp.UnitaryBanachRep.compat_ND6` (compatibility): Restricted to K, Π is an admissible K-Banach representation in the sense of LocallyAnalyticDistributionsPartII ND.6, and Π ↦ Π′ matches ND.6's anti-equivalence.

**Acceptance.**
- The universal unitary completion of the smooth Steinberg is in Ban^{adm}_{G,1}(L).
- (Ind_B^G η₁ ⊗ η₂)^{cont} for unitary η_i is admissible, residually of finite length and ordinary.
- A representation with non-unitary central character is never unitary.

**Sources.**
- CDP14, §1.1, p. 1: Defines Ban^{adm}_G(L), lattices Θ with Θ ⊗ k admissible, residual finite length and Π̄^{ss}, ordinarity, and Rep_L(G).
- PASKUNAS13, §1.1, p. 3; §4: Defines Ban^{adm}_{G,ζ}(L) and Ban^{adm.fl}_{G,ζ}(L) and works with lattices whose reductions are in Mod^{l.fin}_{G,ζ}(O).
- COLMEZ10, Introduction §4, p. 8: Defines Rep_{O_L}G and Rep_L G through lattices with reductions in Rep^{tors}G.

*Needs:* `R30.2/smooth-torsion-categories`, `R30.2/pontryagin-dual-category`, `LocallyAnalyticDistributionsPartII:ND.6/banach-iwasawa-duality`, `LocallyAnalyticDistributionsPartII:ND.6`, `PadicMeasuresIwasawaAlgebras:L1`, `mathlib:IsUltrametricDist`.

### Locally analytic and locally algebraic vectors of GL₂(ℚ_p)-representations

**Target `R30.2/analytic-and-algebraic-vectors` (definition).** For Π ∈ Ban^{adm}_G(L), v ∈ Π is locally analytic if g ↦ gv is a locally analytic function G → Π, and locally algebraic if g ↦ gv is locally a polynomial in a, b, c, d and (ad − bc)^{−1} with coefficients in Π. Π^{an} and Π^{alg} ⊂ Π^{an} are G-stable; Π^{an} is an admissible locally analytic representation, dense in Π, and Π ↦ Π^{an} is exact on Ban^{adm}_G(L) (Schneider–Teitelbaum), while Π^{alg} is zero in general. Π^{alg} = ⊕_W W ⊗ Hom_{𝔤}(W, Π)^{sm} over irreducible algebraic representations W = Sym^{k−1}L² ⊗ det^a (k ≥ 1, a ∈ ℤ); a representation is of type (ℓ, k) if only W_{ℓ,k} := Sym^{k−1} ⊗ det^ℓ occurs. Admissible locally analytic representations are the strong duals of coadmissible D(H, L)-modules for compact open H, with D(H, L) the Fréchet–Stein distribution algebra of LocallyAnalyticDistributionsPartII ND.1–ND.2.

**Hypotheses.**
- Π admissible unitary Banach; G = GL₂(ℚ_p) viewed as a locally ℚ_p-analytic group.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/AnalyticVectors`, namespace `TauCeti.GL2Qp`.

**Uses.**
- Colmez, Théorème 0.19: Π(D)^{an} is the image of D† ⊠ P¹.
- Colmez, Théorème 0.20: Π(D)^{alg} ≠ 0 iff D is de Rham with distinct weights.
- LocallyAnalyticCompletedCohomology LA.5 and LA.12: Π(V)^{la} and its Kirillov model.

**API.**
- `GL2Qp.analyticVectors` (constructor): Π^{an}, a G-stable subspace with its locally convex inductive-limit topology.
- `GL2Qp.algebraicVectors` (constructor): Π^{alg} ⊂ Π^{an}.
- `GL2Qp.analyticVectors_dense` (characterisation): Π^{an} is dense in Π for Π ∈ Ban^{adm}_G(L).
- `GL2Qp.analyticVectors_exact` (functoriality): Π ↦ Π^{an} is exact on Ban^{adm}_G(L).
- `GL2Qp.algebraicVectors_decomposition` (characterisation): Π^{alg} = ⊕_W W ⊗ Hom_𝔤(W, Π)^{sm}.
- `GL2Qp.algebraicType` (data): W_{ℓ,k} = Sym^{k−1}L² ⊗ det^ℓ.

*Proof sketch.* Specialise the general theory of admissible locally analytic representations and of the functor Π ↦ Π^{an} (Schneider–Teitelbaum, requested from LocallyAnalyticDistributionsPartII ND.2) to G. Density and exactness of Π ↦ Π^{an}: from Fréchet–Stein flatness of D(H, L) over L ⊗ O[[H]] (ND.2/faithful-flatness) applied to the finitely generated dual of Π. Decomposition of Π^{alg}: an algebraic vector generates a finite-dimensional 𝔤-module, decomposed into irreducible algebraic representations; the multiplicity spaces are smooth (Colmez Proposition VI.2.4).

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

*Needs:* `R30.2/admissible-unitary-banach`, `LocallyAnalyticDistributionsPartII:ND.1/distribution-algebra`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-module`, `LocallyAnalyticDistributionsPartII:ND.2/faithful-flatness`, `LocallyAnalyticDistributionsPartII:ND.2`.

### Universal unitary completions

**Target `R30.2/universal-unitary-completion` (construction).** Let W be a locally convex L-representation of G (for instance a locally algebraic representation π ⊗ W or Π^{an}). A universal unitary completion of W is a unitary L-Banach representation Ŵ with a continuous G-map ι : W → Ŵ such that every continuous G-map W → B into a unitary Banach representation B factors uniquely through ι. It exists iff W has a G-stable separated O-lattice that is finitely generated over O[G] after restricting to any finitely generated O[G]-submodule (Emerton's criterion); when W = π ⊗ W_alg is locally algebraic with π finitely generated and Θ a finitely generated G-stable lattice, Ŵ = L ⊗ (lim Θ/ϖ^nΘ) modulo ϖ-divisible elements. Colmez–Dospinescu: for Π ∈ Rep_L(G), Π is the universal unitary completion of Π^{an}.

**Hypotheses.**
- W locally convex with continuous G-action; for the existence statement a finitely generated G-stable lattice.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Banach`, namespace `TauCeti.GL2Qp`.

**Uses.**
- CDN 2020, Corollaire 2.13: Π(V)\* is the G-bounded part of (Π(V)^{an})\*.
- Berger–Breuil, Introduction: B(V) is the completion of Alg(V) ⊗ Lisse(V).
- CDP 2014, Theorem 1.3: unitary completions of π ⊗ W are classified.

**API.**
- `GL2Qp.universalUnitaryCompletion` (constructor): Ŵ for W with a finitely generated G-stable lattice.
- `GL2Qp.universalUnitaryCompletion.ι` (data): The continuous G-map W → Ŵ.
- `GL2Qp.universalUnitaryCompletion.lift` (universal-property): Every continuous G-map W → B to unitary Banach B factors uniquely through ι.
- `GL2Qp.universalUnitaryCompletion.lift_comp` (simp): lift(f) ∘ ι = f.
- `GL2Qp.universalUnitaryCompletion.of_analyticVectors` (characterisation): For Π ∈ Rep_L(G), Π is the universal completion of Π^{an} (Colmez–Dospinescu).

*Proof sketch.* Construct Ŵ as the Hausdorff completion of W for the gauge of a finitely generated G-stable lattice; the universal property follows because any continuous G-map to a unitary B sends a finitely generated lattice into a bounded set. Uniqueness up to unique isomorphism from the universal property. Colmez–Dospinescu Théorème 0.2: for Π ∈ Rep_L(G) the restriction Hom_G(Π, B) → Hom_G(Π^{an}, B) is bijective for every unitary Banach B; their proof uses coherence of Π (Théorème 0.7) and the description of Π(D)^{an} (R30.3/analytic-vectors-of-pi).

**Checks.**
- `GL2Qp.universalUnitaryCompletion_trivial` (computation): The universal unitary completion of the trivial representation L is L.
- `GL2Qp.universalUnitaryCompletion_zero` (degenerate): The universal completion of 0 is 0.
- `GL2Qp.universalUnitaryCompletion_nonunitary_central` (non-example): If Z acts on W by a non-unitary character, every map to a unitary Banach representation is zero, so Ŵ = 0 although W ≠ 0.
- `GL2Qp.universalUnitaryCompletion_analytic` (characterisation): For Π ∈ Rep_L(G), Hom_G(Π, B) → Hom_G(Π^{an}, B) is a bijection for every unitary B.

**Acceptance.**
- The universal completion of the trivial representation is L.
- For Π ∈ Rep_L(G), (Π^{an})^ ≅ Π (Colmez–Dospinescu).

**Sources.**
- CD14, Théorème 0.2 and Remarque 0.3, p. 4; Théorème 0.7, p. 6: Proves that Π ∈ Rep_L(G) is the universal unitary completion of Π^{an} and credits the notion of universal completion to Emerton; Théorème 0.7 gives the coherence of Π used in the proof.
- BB10, Introduction, p. 2: Defines B(V) as the p-adic completion of Alg(V) ⊗ Lisse(V) with respect to a G-stable lattice, i.e. a universal unitary completion of the locally algebraic representation.
- CDN20, Proposition 2.9, p. 22; Corollaire 2.13 and its proof, p. 24 (arXiv): Identifies W_{M,ℒ} with (Π(V_{M,ℒ})^{an})\* and deduces Hom_{G_{ℚ_p}}(V_{M,ℒ}, H¹_et) ≅ Π(V_{M,ℒ})\* by taking G-bounded vectors, using that Π(V) is the universal completion of Π(V)^{an} (Colmez–Dospinescu, Théorème VII.11).

*Needs:* `R30.2/admissible-unitary-banach`, `R30.2/analytic-and-algebraic-vectors`.

### Mod p principal series and Steinberg representations

**Target `R30.2/modp-principal-series` (definition).** For smooth characters δ₁, δ₂ : ℚ_p^× → k^× write δ₁ ⊗ δ₂ for the character (a b; 0 d) ↦ δ₁(a)δ₂(d) of B and Ind_B^G for smooth induction (locally constant φ : G → k with φ(bg) = (δ₁ ⊗ δ₂)(b)φ(g), G acting by right translation). Colmez's normalisation is B(δ₁, δ₂) := Ind_B^G(δ₂ ⊗ δ₁ω^{−1}), an object of Rep^{tors}G with central character ω^{−1}δ₁δ₂, irreducible unless δ₁ = ωδ, δ₂ = δ for some δ, in which case it is a non-split extension of St ⊗ (δ∘det) by δ∘det, St being the Steinberg representation Ind_B^G(1)/1. Paškūnas and CDP use π{χ₁, χ₂} := (Ind_B^G χ₁ ⊗ χ₂ω^{−1})^{ss} ⊕ (Ind_B^G χ₂ ⊗ χ₁ω^{−1})^{ss}, of length 2 in general, 3 or 4 for the exceptional pairs, and CDN write I(χ₁, χ₂) for the irreducible principal series attached to (χ₁, χ₂).

**Hypotheses.**
- δ₁, δ₂ smooth characters with values in k^× (after enlarging k).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/PrincipalSeries`, namespace `TauCeti.GL2Qp`.

**Uses.**
- Colmez, Théorème 0.10(iii): V(B(δ₁, δ₂)) = k_L(δ₁).
- Paškūnas 2013, blocks (ii)–(iv): blocks are formed from principal series constituents.
- CDN 2023, Proposition 1.10: blocks {I(χ₁, χ₂), I(χ₂, χ₁)}.

**API.**
- `GL2Qp.principalSeries` (constructor): Ind_B^G(δ₁ ⊗ δ₂) as a smooth k-representation.
- `GL2Qp.colmezPrincipalSeries` (constructor): B(δ₁, δ₂) = Ind_B^G(δ₂ ⊗ δ₁ω^{−1}).
- `GL2Qp.steinberg` (constructor): St = Ind_B^G(1 ⊗ 1)/1.
- `GL2Qp.principalSeries_centralChar` (simp): Z acts on Ind_B^G(δ₁ ⊗ δ₂) by δ₁δ₂.
- `GL2Qp.principalSeries_irreducible_iff` (characterisation): Ind_B^G(δ₁ ⊗ δ₂) is irreducible iff δ₁ ≠ δ₂.
- `GL2Qp.principalSeries_twist` (functoriality): Ind_B^G(δ₁ ⊗ δ₂) ⊗ (η∘det) ≅ Ind_B^G(δ₁η ⊗ δ₂η).

*Proof sketch.* Barthel–Livné: Ind_B^G(χ₁ ⊗ χ₂) is irreducible iff χ₁ ≠ χ₂, and Ind_B^G(χ ⊗ χ) is a non-split extension of St ⊗ χ by χ∘det (FiniteFlat R07.5 and Colmez Proposition III.3.7). The central character of Ind_B^G(δ₂ ⊗ δ₁ω^{−1}) is δ₂·δ₁ω^{−1} restricted to scalars. Intertwinings between Jordan–Hölder constituents of different principal series do not occur unless the parameters agree (Colmez Proposition III.3.5(ii)).

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

*Needs:* `R30.1/character-dictionary`, `R30.2/smooth-torsion-categories`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/serre-weights-compact-induction`, `SmoothRepresentationsOfLocalGroups:SR.2`.

### Classification of irreducible mod p representations of GL₂(ℚ_p)

**Target `R30.2/modp-irreducibles` (theorem).** Let k be a finite extension of 𝔽_p (or 𝔽̄_p), and for 0 ≤ r ≤ p−1, χ : ℚ_p^× → k^× smooth and λ ∈ k, let W_{r,χ} = Sym^r k² ⊗ (χ∘det) as a KZ-module (p acting trivially), I(W_{r,χ}) = c-Ind_{KZ}^G W_{r,χ} with End_G = k[T] (Barthel–Livné operator T), and Π(r, λ, χ) = I(W_{r,χ})/(T − λ). (i) Π(r, λ, χ) is irreducible except for r = 0, λ = ±1 (an extension of St ⊗ (χμ_λ∘det) by χμ_λ∘det) and r = p−1, λ = ±1 (an extension of χμ_λ∘det by St ⊗ (χμ_λ∘det)). (ii) Every absolutely irreducible smooth k-representation of G is a Jordan–Hölder constituent of some Π(r, λ, χ); concretely the absolutely irreducible ones are: characters χ∘det; St ⊗ (χ∘det); irreducible principal series Ind_B^G(χ₁ ⊗ χ₂) with χ₁ ≠ χ₂; and supersingular Π(r, 0, χ). (iii) The only isomorphisms between supersingulars are Π(r, 0, χ) ≅ Π(r, 0, χμ_{−1}) ≅ Π(p−1−r, 0, χω^r) ≅ Π(p−1−r, 0, χω^rμ_{−1}); there are no intertwinings between supersingulars and principal-series constituents, nor between constituents of different principal series. (iv) Every irreducible smooth representation of G over 𝔽̄_p has a central character (Berger), is admissible and finitely presented, and is defined over a finite field; Gal(𝔽̄_p/k)-orbits of 𝔽̄_p-irreducibles correspond bijectively to irreducible k-representations.

**Hypotheses.**
- F = ℚ_p: the irreducibility of I(σ)/(T) (Breuil) and finite presentation of supersingulars fail for F ≠ ℚ_p (R30.2/no-correspondence-beyond-qp).

*Proof sketch.* Barthel–Livné: End_G(I(σ)) ≅ k[T], I(σ) free over k[T], every irreducible with central character is a quotient of some I(σ)/(T − λ), and the λ ≠ 0 quotients are principal series or their constituents (FiniteFlat R07.5). Breuil: I(σ)/(T) is irreducible for F = ℚ_p (Breuil 2003, Théorème 1.1, via Corollaires 4.1.1 and 4.1.4) and the isomorphisms between them (Théorème 1.3). Colmez Théorème III.3.2 and Proposition III.3.5 package (i)–(iii) in the notation Π(r, λ, χ). (iv): Berger's central character theorem; admissibility and finite presentation of ordinary and supersingular irreducibles (CDN 2023 §1.2.3); Galois descent of irreducibles (CDN 2023 Lemma 1.7).

**Acceptance.**
- The number of isomorphism classes of supersingular representations of GL₂(ℚ_p) over 𝔽̄_p with a fixed central character is finite, and over 𝔽̄_p they are in bijection with irreducible two-dimensional Galois representations with the matching determinant (Breuil Corollaire 1.4; R30.3/montreal-on-irreducibles).
- For p = 2, Π(0, 0, χ) ≅ Π(1, 0, χ) (take r = 0, p−1−r = 1 and ω trivial).
- Π(0, 1, 1) is reducible: trivial character as sub, Steinberg as quotient.

**Sources.**
- COLMEZ10, §III.3.1, Théorème III.3.2 and Proposition III.3.5, pp. 85–86: Defines W_{r,χ} and Π(r, λ, χ), states that Π(r, λ, χ) is irreducible except for r ∈ {0, p−1} and λ = ±1, that every absolutely irreducible representation is a constituent of some Π(r, λ, χ), and lists the only intertwinings between supersingulars.
- BREUIL03, Théorème 1.1, p. 3; Théorème 1.3, p. 3; Corollaires 4.1.1 and 4.1.4, pp. 17–20: Proves that (c-Ind_{KZ}^G Sym^r)/(T) is irreducible for 0 ≤ r ≤ p−1 and determines the isomorphisms between these supersingular representations.
- CDNKISIN, §1.1, Proposition 1.2, p. 4: Lists the absolutely irreducible smooth k_L-representations of GL₂(ℚ_p) as characters, twists of the Steinberg, irreducible principal series and the supersingular quotients Π_{r,χ,P}.
- CDN23, §1.2.1–1.2.3 and Lemme 1.7, pp. 14–16: Gives the Barthel–Livné list, Breuil's and Berger's theorems, admissibility and finite presentation of irreducibles, and the Galois-orbit description of irreducibles over k_L.

*Needs:* `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/serre-weights-compact-induction`, `R30.2/modp-principal-series`, `R30.2/smooth-torsion-categories`.

### Irreducible mod ℓ representations of GL₂(ℤ_ℓ), U₀(ℓ) and Ũ₀(ℓ)

**Target `R30.2/mod-l-compact-irreducibles` (theorem).** Let ℓ be a prime, U₀(ℓ) = {(a b; c d) ∈ GL₂(ℤ_ℓ) : c ∈ ℓℤ_ℓ} and Ũ₀(ℓ) its normaliser in GL₂(ℚ_ℓ) modulo ℓ^ℤ, generated by U₀(ℓ) and w_ℓ = (0 1; ℓ 0). Over 𝔽̄_ℓ: (i) the irreducible continuous representations of GL₂(ℤ_ℓ) are σ_{n,m} = Sym^n(𝔽̄_ℓ²) ⊗ det^m with 0 ≤ n ≤ ℓ−1 and m ∈ ℤ/(ℓ−1); (ii) those of U₀(ℓ) are the characters σ'_{m₁,m₂} : (a b; ℓc d) ↦ ā^{m₁} d̄^{m₂}; (iii) those of Ũ₀(ℓ) (with ℓ acting trivially) are the two-dimensional inductions σ'_{{m₁,m₂},a} for m₁ ≠ m₂ (with −ℓ acting by a) and the characters σ'_{{m},a} extending σ'_{m,m} with w_ℓ acting by a.

**Hypotheses.**
- ℓ prime (in the applications ℓ = p); representations over 𝔽̄_ℓ, continuous for the profinite topology, ℓ acting trivially on Ũ₀(ℓ)-representations.

*Proof sketch.* (i): such a representation factors through GL₂(𝔽_ℓ) because the kernel K₁ is pro-ℓ; the irreducible 𝔽̄_ℓ[GL₂(𝔽_ℓ)]-modules are Sym^n ⊗ det^m (Serre weights, FiniteFlat R07.5). (ii): U₀(ℓ) acts through its quotient by a pro-ℓ normal subgroup onto the torus (𝔽_ℓ^×)², an abelian group of order prime to ℓ. (iii): Clifford theory for the index-two (modulo ℓ^ℤ) extension Ũ₀(ℓ) ⊃ U₀(ℓ)ℓ^ℤ, with w_ℓ swapping σ'_{m₁,m₂} and σ'_{m₂,m₁}.

**Acceptance.**
- There are ℓ(ℓ−1) isomorphism classes in (i).
- σ_{0,m} = det^m is one-dimensional; σ_{ℓ−1,0} has dimension ℓ.

**Sources.**
- BCDT01, §1.3, p. 854 (published pagination): Lists σ_{n,m}, the characters σ'_{m₁,m₂} of U₀(ℓ), and the representations σ'_{{m₁,m₂},a} and σ'_{{m},a} of Ũ₀(ℓ) as all the irreducible 𝔽̄_ℓ-representations of these groups.

*Needs:* `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/serre-weights-compact-induction`, `R30.1/gl2qp-subgroups`.

### What fails for GL₂(F) with F ≠ ℚ_p

**Target `R30.2/no-correspondence-beyond-qp` (comparison).** For a finite extension F ≠ ℚ_p of ℚ_p, the mod p theory of GL₂(F) differs from that of GL₂(ℚ_p) in ways that block the constructions of this roadmap: (i) supersingular representations of GL₂(F) over 𝔽̄_p are not finitely presented (Schraen, Wu); (ii) for F = ℚ_{p³} there are smooth irreducible k_L-representations of GL₂(F) that are not admissible, and a supersingular 𝔽_{p³}-representation with End = 𝔽_p which is not absolutely irreducible over any finite extension (Le); (iii) the quotients I(σ)/(T) are not irreducible and supersingular representations are not classified. Consequently nothing in this roadmap asserts a p-adic or mod p correspondence for GL₂(F), F ≠ ℚ_p: every theorem is stated for G = GL₂(ℚ_p).

**Hypotheses.**
- F/ℚ_p finite, F ≠ ℚ_p.

*Proof sketch.* (i) is CDN 2023 Théorème 1.27, citing Schraen and Wu; (ii) is CDN 2023 Remarques 1.8 and 1.28, citing Le; (iii) is the CDN 2023 §1.2.1 description, which leaves supersingulars of GL₂(F) unclassified. Colmez's Remarque 0.8(iii) records that standard presentations, which the construction of D(Π) needs, are expected to fail for GL₂(F), F ≠ ℚ_p.

**Acceptance.**
- The roadmap's statements carry the hypothesis F = ℚ_p wherever they use R30.2/modp-irreducibles, R30.3/montreal-functor or R30.5/blocks.

**Sources.**
- CDN23, §1.2.1, pp. 14–15; Remarque 1.8, p. 16; Théorème 1.27 and Remarque 1.28, p. 25: For F ≠ ℚ_p the supersingular representations are not finitely presented (Schraen, Wu); Le constructed irreducible non-admissible representations of GL₂(ℚ_{p³}) and a supersingular with End = 𝔽_p that is not absolutely irreducible.
- COLMEZ10, Remarque 0.8(iii), p. 12: Breuil–Paškūnas suggest that the existence of standard presentations fails in characteristic p for GL₂ of a nontrivial extension of ℚ_p.

*Needs:* `R30.2/modp-irreducibles`.

### Dependencies of R30.2

Other roadmaps: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/serre-weights-compact-induction`, `LocallyAnalyticDistributionsPartII:ND.1/distribution-algebra`, `LocallyAnalyticDistributionsPartII:ND.2`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-module`, `LocallyAnalyticDistributionsPartII:ND.2/faithful-flatness`, `LocallyAnalyticDistributionsPartII:ND.6`, `LocallyAnalyticDistributionsPartII:ND.6/banach-iwasawa-duality`, `PadicMeasuresIwasawaAlgebras:L1`, `PadicMeasuresIwasawaAlgebras:L5`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension`, `SmoothRepresentationsOfLocalGroups:SR.2`. Within this roadmap the layer uses the earlier layers only.

## R30.3. Colmez's construction

The G-module D ⊠_δ ℙ¹ is built from an étale (φ,Γ)-module and a unitary character without presupposing any correspondence. From it come Colmez's Montreal functor Π ↦ D(Π), V(Π) (exact, covariant), its values on irreducibles and Breuil's semisimple mod p correspondence, the reconstruction of Π from D(Π) through the contragredient, and Π(D) = (D ⊠ ℙ¹)/(D^♮ ⊠ ℙ¹). Colmez's theorem gives D(Π(D)) = Ď; Colmez–Dospinescu–Paškūnas complete the bijection for every p. The layer ends with the locally analytic vectors of Π(D).

**Targets of the layer.** The G-module D ⊠_δ ℙ¹; Colmez's Montreal functor Π ↦ D(Π), V(Π); The Montreal functor on irreducibles and the mod p correspondence; Reconstruction of Π from D(Π): β_{ℙ¹} and the contragredient; Colmez's representation Π(D) and the correspondence V ↦ Π(V); Colmez's theorem: Π(D) is irreducible and D(Π(D)) = Ď; The p-adic local Langlands correspondence for GL₂(ℚ_p); Injectivity of V on Ext¹ of atoms; Locally analytic vectors of Π(D).

**Planets.** The G-module D ⊠_δ ℙ¹; Colmez's Montreal functor; Semisimple mod p correspondence; Colmez's correspondence V ↦ Π(V); Colmez's theorem V(Π(V)) = V; p-adic local Langlands correspondence for GL₂(ℚ_p).

### The G-module D ⊠_δ ℙ¹

**Target `R30.3/boxtimes-p1` (construction).** Let D be an étale (φ,Γ)-module over O_E (torsion or free) or over E, and δ : ℚ_p^× → O_L^× a continuous unitary character. On D ⊠ ℤ_p^× = D^{ψ=0} there is an involution w_δ, the limit of Σ_{i ∈ ℤ_p^× mod p^n} δ(i^{−1})(1+T)^i σ_{−i^2}(φ^nψ^n((1+T)^{−i^{−1}}z)). Put D ⊠_δ ℙ¹ = {z = (z₁, z₂) ∈ D × D : Res_{ℤ_p^×}(z₂) = w_δ(Res_{ℤ_p^×}(z₁))}. There is a unique action of G on D ⊠_δ ℙ¹ such that Res_U(g·z) = H_g(Res_{g^{−1}U ∩ ℤ_p}(z₁)) + H_{gw}(Res_{(gw)^{−1}U ∩ pℤ_p}(z₂)) for every compact open U ⊂ ℚ_p, with the explicit skeleton: w(z₁, z₂) = (z₂, z₁); (a 0; 0 a) acts by δ(a); (a 0; 0 1), a ∈ ℤ_p^×, by ((a 0; 0 1)z₁, δ(a)(a^{−1} 0; 0 1)z₂); and the formulas for (p 0; 0 1) and (1 b; 0 1), b ∈ pℤ_p. Restrictions Res_U : D ⊠_δ ℙ¹ → D ⊠ U and Res_{ℚ_p} : D ⊠_δ ℙ¹ → D ⊠_δ ℚ_p are G- resp. B-compatible; Res_{ℤ_p}z = z₁ and Res_{ℤ_p}(w·z) = z₂. For D⁰(ℤ_p) = E^♮ the construction is the dual B(δ)\* of the space of continuous φ on ℚ_p with x ↦ δ(x)φ(1/x) continuous at 0, with g·φ = φ ⋆ g^{−1}, (φ ⋆ (a b; c d))(x) = δ(cx+d)φ((ax+b)/(cx+d)). Twisting: (D ⊠_δ ℙ¹) ⊗ (η∘det) ≅ (D ⊗ η) ⊠_{δη²} ℙ¹, and there is a perfect G-equivariant pairing { , }_{ℙ¹} between Ď ⊠_{δ^{−1}} ℙ¹ and D ⊠_δ ℙ¹.

**Hypotheses.**
- D étale; δ unitary continuous; the construction is analytic in (D, δ) over S ⊗̂ O_E for S a quotient of O_L[[X₁,…,X_d]] (Remarque 0.18(iv)).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/BoxtimesP1`, namespace `TauCeti.BoxtimesP1`.

**Uses.**
- Colmez, Théorème 0.17: Π(D) = (D ⊠ ℙ¹)/(D^♮ ⊠ ℙ¹).
- Colmez, Théorème 0.13: β_{ℙ¹} : Π^∨ → D ⊠_δ ℙ¹ is injective and G-equivariant.
- Colmez–Dospinescu, Théorème 0.8: Π_δ(D) and the sequence 0 → Π_{δ^{−1}}(Ď)\* → D ⊠_δ ℙ¹ → Π_δ(D) → 0.

**API.**
- `BoxtimesP1` (constructor): D ⊠_δ ℙ¹ for étale D and unitary δ.
- `BoxtimesP1.wDelta` (data): The involution w_δ of D^{ψ=0}.
- `BoxtimesP1.action` (instance): The unique continuous G-action characterised by the Res_U formula.
- `BoxtimesP1.res` (projection): Res_U : D ⊠_δ ℙ¹ → D ⊠ U and Res_{ℚ_p} to D ⊠_δ ℚ_p.
- `BoxtimesP1.res_Zp_w` (simp): Res_{ℤ_p}(z) = z₁ and Res_{ℤ_p}(w·z) = z₂.
- `BoxtimesP1.central` (simp): (a 0; 0 a)·z = δ(a)z.
- `BoxtimesP1.twist` (functoriality): (D ⊠_δ ℙ¹) ⊗ (η∘det) ≅ (D ⊗ η) ⊠_{δη²} ℙ¹.
- `BoxtimesP1.pairing` (relation): { , }_{ℙ¹} : (Ď ⊠_{δ^{−1}} ℙ¹) × (D ⊠_δ ℙ¹) → O_L is perfect and G-equivariant.
- `BoxtimesP1.measures` (compatibility): For D = E^♮ (measures), D ⊠_δ ℙ¹ ≅ B(δ)\* G-equivariantly.

*Proof sketch.* Define w_δ on D^{ψ=0} by the limit formula; convergence and the involution property are Colmez's Lemme II.1.2 and Remarque II.1.3. Define the action of the generators by the skeleton formulas and prove uniqueness and existence of the G-action from the Res_U formula (Colmez Théorème II.1.4, p. 47), using P(ℚ_p), Z and w generating G (R30.1/gl2qp-subgroups) and the P(ℚ_p)-module D ⊠ ℚ_p (R30.1/boxtimes-qp). The measure case: the restriction maps to ℤ_p and to w·ℤ_p identify B(δ)\* with D⁰(ℤ_p) ⊠_δ ℙ¹, the pairs (μ₁, μ₂) with Res_{ℤ_p^×}μ₂ = w_δ(Res_{ℤ_p^×}μ₁) (Colmez §5, p. 10). Twisting (Colmez §II.1.3) and the pairing (Théorème II.1.13) from the residue pairing on Ď × D (R30.1/tate-dual).

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

*Needs:* `R30.1/boxtimes-qp`, `R30.1/psi-and-treillis`, `R30.1/tate-dual`, `R30.1/gl2qp-subgroups`, `R30.1/character-dictionary`.

### Colmez's Montreal functor Π ↦ D(Π), V(Π)

**Target `R30.3/montreal-functor` (construction).** For Π ∈ Rep^{tors}G choose a finite length K-stable W ⊂ Π generating Π (W(Π) ≠ ∅; Π = I(W)/R(W, Π) is a standard presentation, which exists for every Π, Colmez Théorème III.3.1). Let I^Π_{ℤ_p}(W) be the O_L-span of the (p^n a; 0 1)·W with a + p^nℤ_p ⊂ ℤ_p, D^♮_W(Π) its Pontryagin dual (a quotient of Π^∨), and D⁺_W(Π) ⊂ Π^∨ the μ vanishing on (p^n a; 0 1)·W for a + p^nℤ_p ⊄ ℤ_p. These are Γ-modules over O_E⁺ (T acting by (1 1; 0 1) − 1, σ_a by (a 0; 0 1)), D⁺_W(Π) is a (φ,Γ)-module over O_E⁺ with φ = (p 0; 0 1), and D(Π) := O_E ⊗ D⁺_W(Π) ≅ O_E ⊗ D^♮_W(Π) is independent of W, with β_{ℤ_p} : Π^∨ → D(Π). Then D is an exact contravariant functor Rep^{tors}G → ΦΓ^et_tors, extended to Rep_{O_L}G by inverse limits and to Rep_L G by ⊗ L. V(Π) := the Tate dual of V(D(Π)) defines an exact covariant functor Rep^{tors}G → Rep_tors G_{ℚ_p}, Rep_{O_L}G → Rep_{O_L}G_{ℚ_p}, Rep_L G → Rep_L G_{ℚ_p}, with V(Π ⊗ (δ∘det)) = V(Π) ⊗ δ, and V(Π) = MF(Π)(ε) for Emerton's normalisation MF. Paškūnas's variant on the dual category: V̌(M) := V(M^∨)^∨(ζε) for M ∈ C_{G,ζ}(O), extended to pseudo-compact objects by limits.

**Hypotheses.**
- Π ∈ Rep^{tors}G (smooth, admissible, finite length, central character) or a lattice / Banach representation residually in it.
- F = ℚ_p (standard presentations; R30.2/no-correspondence-beyond-qp).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Montreal`, namespace `TauCeti.MontrealFunctor`.

**Uses.**
- Colmez, Théorème 0.17(iii): D(Π(D)) = Ď, i.e. V(Π(V)) = V.
- Paškūnas 2013, Theorem 1.1 and §5: V̌ of the projective envelope gives the universal deformation.
- Paškūnas–Tung, Theorem 1.2: the compatibility of υ : R^{ps} → Z_B with V̌.
- Nakamura 2023, Appendix B.3: MF and V̌ on deformations and on P̃.

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

*Proof sketch.* Existence of standard presentations (Colmez Théorème III.3.1), reduced by dévissage to irreducibles via the classification R30.2/modp-irreducibles. Construction of D^♮_W, D⁺_W and their module structures (Colmez §IV.1, Proposition IV.1.11–IV.1.12: β ∘ (p^{−1} 0; 0 1) = ψ ∘ β). Finite length of D(Π) for irreducible Π: explicit computation of D^♮_{W_r}(Π(r, λ)) as k_E⁺ ⊕ k_E⁺ (λ = 0) or k_E⁺ ⊕ k_E⁺/T (λ ≠ 0) (Théorème IV.2.1); exactness by Proposition IV.2.12 and dévissage (Théorème IV.2.13). Passage to V and its exactness via Fontaine's equivalence (Théorème IV.2.14; R30.1/fontaine-functor-convention). Comparison with MF: Emerton defines MF(π) as the Pontryagin dual of V(D(π)) (lg §3.2 and footnote 6), Colmez as the Tate dual; they differ by ε.

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

*Needs:* `R30.2/smooth-torsion-categories`, `R30.2/modp-irreducibles`, `R30.2/admissible-unitary-banach`, `R30.2/pontryagin-dual-category`, `R30.1/fontaine-functor-convention`, `R30.1/psi-and-treillis`, `R30.1/boxtimes-qp`.

### The Montreal functor on irreducibles and the mod p correspondence

**Target `R30.3/montreal-on-irreducibles` (theorem).** (i) V(δ∘det) = 0; (ii) V(St ⊗ (δ∘det)) = k_L(ωδ); (iii) V(B(δ₁, δ₂)) = k_L(δ₁) for B(δ₁, δ₂) = Ind_B^G(δ₂ ⊗ δ₁ω^{−1}); (iv) for Π supersingular, V(Π) is irreducible of dimension 2 over k_L; precisely V(Π(r, 0, δ) ⊗ (−1)^{v_p(x)}) = V(r, δ), Colmez's irreducible atome galoisien. (v) (Breuil's semisimple mod p correspondence) there is a unique bijection between isomorphism classes of supersingular representations of GL₂(ℚ_p) over 𝔽̄_p and irreducible two-dimensional representations of G_{ℚ_p} over 𝔽̄_p with π(r, 0, χ) ↦ ρ(r, χ) = ind(ω₂^{r+1}) ⊗ χ, det ρ(r, χ) = ω^{r+1}χ², compatible with the isomorphisms π(r, 0, χ) ≅ π(r, 0, χμ_{−1}) ≅ π(p−1−r, 0, χω^r) on the left and the corresponding ones on the right; V realises it up to the normalising twists in (iv). (vi) If δ₁ ∉ {δ₂, ω^{±1}δ₂}, Ext¹_G(B(δ₂, δ₁), B(δ₁, δ₂)) is one-dimensional and V of a non-split extension is the non-split extension of k_L(δ₂) by k_L(δ₁).

**Hypotheses.**
- Coefficients k_L, after enlarging k_L if needed; F = ℚ_p.

*Proof sketch.* (i)–(iii): compute D(Π) for each irreducible from the explicit D^♮_{W_r}(Π(r, λ)) (Colmez Théorème IV.2.1) and the description of principal series (Proposition III.3.8). (iv): D(Π) is irreducible of rank 2 for supersingular Π and identified by the action of Γ on D^♮/T together with determinants (Colmez Proposition VII.4.2, with Proposition VII.3.4 and Corollaire VII.3.5 for D^♮(ind ω₂^{−r})). (v): Breuil's Corollaire 1.4, from his Théorèmes 1.1 and 1.3 and the matching isomorphisms between the ρ(r, χ). (vi): Colmez Théorème 0.11(i) and §VII.2.

**Acceptance.**
- V(B(1, 1)) = V(Ind_B^G(1 ⊗ ω^{−1})) = k_L.
- For every p, V of a supersingular Π is induced from a character of G_{ℚ_{p²}} (an ind(ω₂^s) up to twist).
- dim V(π) ≤ 2 for every irreducible π.

**Sources.**
- COLMEZ10, Théorème 0.10 and Théorème 0.11, p. 13; Proposition VII.4.2, p. 210; Propositions VII.3.3–VII.3.4, pp. 206–207: Théorèmes 0.10–0.11 compute V on characters, Steinberg twists and principal series, show that supersingulars give irreducible two-dimensional representations, and compute the extension groups between principal series; Proposition VII.4.2 identifies V(Π(r, 0, δ) ⊗ (−1)^{v_p}) with the atome galoisien V(r, δ), whose (φ,Γ)-module and treillis are computed in Propositions VII.3.3–VII.3.4.
- BREUIL03, Corollaire 1.4 and the paragraph before it, pp. 3–4: States the unique bijection π(r, 0, χ) ↔ ρ(r, χ) = ind(ω₂^{r+1}) ⊗ χ between supersingulars and irreducible two-dimensional mod p Galois representations, with det ρ(r, χ) = ω^{r+1}χ², normalised with uniformisers ↦ geometric Frobenii.

*Needs:* `R30.3/montreal-functor`, `R30.2/modp-irreducibles`, `R30.2/modp-principal-series`.

### Reconstruction of Π from D(Π): β_{ℙ¹} and the contragredient

**Target `R30.3/contragredient` (theorem).** Let Π ∈ Rep^{tors}G have no finite quotient, central character δ_Π, D = D(Π) and δ = δ_Π^{−1}. (i) β_{ℚ_p} : Π^∨ → D ⊠_δ ℚ_p, μ ↦ (β_{ℤ_p}((p^n 0; 0 1)μ))_n, is B-equivariant with kernel (Π^∨)^U, image in D^♯ ⊠ ℚ_p containing D^♮ ⊠ ℚ_p, with equality when Π has no finite subrepresentation. (ii) β_{ℙ¹} : μ ↦ (β_{ℤ_p}(μ), β_{ℤ_p}(wμ)) is an injective G-equivariant map Π^∨ → D ⊠_δ ℙ¹ with Res_{ℚ_p} ∘ β_{ℙ¹} = β_{ℚ_p}, landing in {z : Res_{ℚ_p}z ∈ D^♯ ⊠_δ ℚ_p}; the subspace D^♮ ⊠_δ ℙ¹ = {z : Res_{ℚ_p}z ∈ D^♮ ⊠_δ ℚ_p} is a G-stable compact open containing the image of the orthogonal of Π^{SL₂(ℚ_p)} with finite index, and its dual is equivalent to Π. (iii) The contragredient Π̌ := (D ⊠_δ ℙ¹)/β_{ℙ¹}(Π^∨) lies in Rep^{tors}G, has no finite quotient, and its contragredient is Π. Examples: B(δ₁, δ₂)ˇ ≅ B(δ₂, δ₁) ⊗ δ_Π^{−1}; Šť is a non-split extension of B(1, ω) by 1; Π̌ ≅ Π ⊗ δ_Π^{−1} for supersingular Π.

**Hypotheses.**
- Π ∈ Rep^{tors}G without finite quotient; F = ℚ_p.

*Proof sketch.* β_{ℚ_p}: Proposition 0.12 and §IV.3.1 (Lemme IV.3.1: the kernel of α_{ℤ_p,W} has finite length). The key identity β_{ℤ_p^×} ∘ w = w_δ ∘ β_{ℤ_p^×} (Proposition IV.4.2) gives that β_{ℙ¹} lands in D ⊠_δ ℙ¹ and is G-equivariant (Théorème IV.4.7). G-stability and duality of D^♮ ⊠_δ ℙ¹ (Théorème IV.4.1) and the contragredient statements (Théorème 0.14, §IV.4.5, Proposition IV.4.18).

**Acceptance.**
- For Π supersingular, Π̌ ≅ Π ⊗ δ_Π^{−1}.
- The contragredient of the contragredient is Π.

**Sources.**
- COLMEZ10, Proposition 0.12, Théorèmes 0.13 and 0.14, Exemples 0.15, p. 14; Théorème IV.4.1, p. 106; Proposition IV.4.2 and Théorème IV.4.7, pp. 107–110: Constructs β_{ℚ_p} and β_{ℙ¹}, proves β_{ℙ¹} is injective and G-equivariant into D ⊠_δ ℙ¹, that D^♮ ⊠_δ ℙ¹ is G-stable with dual equivalent to Π, defines the contragredient and shows it is an involution, with the principal series, Steinberg and supersingular examples.

*Needs:* `R30.3/montreal-functor`, `R30.3/boxtimes-p1`, `R30.1/psi-and-treillis`, `R30.2/modp-principal-series`.

### Colmez's representation Π(D) and the correspondence V ↦ Π(V)

**Target `R30.3/pi-of-D` (construction).** Let D ∈ ΦΓ^et(E) be of rank 2, α_D the character of ∧²D, δ_D = (x|x|)^{−1}α_D (R30.1/tate-dual), and D ⊠ ℙ¹ := D ⊠_{δ_D} ℙ¹ (central character δ_D). Put D^♮ ⊠ ℙ¹ = {z ∈ D ⊠ ℙ¹ : Res_{ℚ_p}(z) ∈ D^♮ ⊠ ℚ_p} and, when it is G-stable, Π(D) := (D ⊠ ℙ¹)/(D^♮ ⊠ ℙ¹). For a two-dimensional L-representation V of G_{ℚ_p}, Π(V) := Π(D(V)). The same recipe applies to D ∈ ΦΓ^et(O_E) and to torsion D, compatibly with reduction mod p up to finite length pieces, and in families over S ⊗̂ O_E. The construction does not presuppose the correspondence: Π(D) is defined from D alone, and the identities D(Π(D)) = Ď and V(Π(V)) = V are theorems (R30.3/colmez-correspondence).

**Hypotheses.**
- D étale of rank 2 over E (or O_E, torsion); G-stability of D^♮ ⊠ ℙ¹ is the theorem R30.3/colmez-correspondence.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/PiOfD`, namespace `TauCeti.PiOfD`.

**Uses.**
- CDP 2014, Theorem 1.1: every absolutely irreducible non-ordinary Π is Π(V).
- Kisin 2009 (JAMS), Hypothesis (1.2.6): lattices in Π(V) with prescribed K-types.
- CDN 2020, Proposition 2.9: Π(V) is compared with p-adic étale cohomology of the Drinfeld tower.

**API.**
- `PiOfD` (constructor): Π(D) = (D ⊠ ℙ¹)/(D^♮ ⊠ ℙ¹) for D étale of rank 2.
- `PiOfD.ofRep` (constructor): Π(V) := Π(D(V)) for two-dimensional V.
- `PiOfD.centralChar` (simp): Z acts on Π(D) through δ_D = (x|x|)^{−1}α_D, i.e. Π(V) has central character det(V)·ε^{−1} read through R30.1/character-dictionary.
- `PiOfD.twist` (functoriality): Π(D ⊗ η) ≅ Π(D) ⊗ (η∘det) for unitary η.
- `PiOfD.reduction` (compatibility): Π of a lattice reduces mod ϖ to Π of the reduction, up to finite length pieces.
- `PiOfD.family` (functoriality): For D over S ⊗̂ O_E, Π(D) interpolates the Π(D_s), s ∈ Spec S.
- `PiOfD.maximal` (characterisation): Π(V) is the largest unitary residually finite length representation Π with V(Π) ≅ V and Π^{SL₂(ℚ_p)} = 0 (the last condition because V kills Π^{SL₂(ℚ_p)}).

*Proof sketch.* Define δ_D and D ⊠ ℙ¹ from R30.3/boxtimes-p1 and R30.1/tate-dual. D^♮ ⊠ ℙ¹ is defined through Res_{ℚ_p} and D^♮ ⊠ ℚ_p (R30.1/psi-and-treillis, R30.1/boxtimes-qp); it is compact open in D ⊠ ℙ¹. Π(D) is the quotient; its topology is the quotient topology, and for D over E it is an L-Banach space with the unit ball the image of the integral version.

**Checks.**
- `PiOfD.centralChar_cyclotomicDet` (computation): If det V = ε then Π(V) has trivial central character.
- `PiOfD.zero` (degenerate): For D = 0 (rank 0) the construction gives 0; Π(D) is only claimed irreducible for irreducible D of rank 2.
- `PiOfD.rank_one_excluded` (non-example): For D of rank 1 the module D^♮ ⊠ ℙ¹ is not G-stable in general, so Π(D) is not defined: the construction is special to rank 2.
- `PiOfD.V_Pi` (characterisation): V(Π(V)) ≅ V for V absolutely irreducible of dimension 2 (R30.3/colmez-correspondence).

**Acceptance.**
- For D of rank 2 with det V(D) = χ, δ_D = 1 and Π(D) has trivial central character.
- Π(D ⊗ η) = Π(D) ⊗ (η∘det) for a unitary character η.

**Sources.**
- COLMEZ10, Introduction §9, p. 15; Remarque 0.18, pp. 15–16; §II.2.2, p. 58: Defines δ_D = (x|x|)^{−1}α_D, D ⊠ ℙ¹ = D ⊠_{δ_D} ℙ¹, D^♮ ⊠ ℙ¹ and the conditional representation Π(D) = (D ⊠ ℙ¹)/(D^♮ ⊠ ℙ¹), and V ↦ Π(V) as the composite with Fontaine's equivalence, compatible with reduction and families.
- CDN23, §1.3.1, p. 17: Π(V) is the largest unitary residually finite length representation with V(Π(V)) = V and Π(V)^{SL₂(ℚ_p)} = 0; V(Π) is always of GL₂ type in the sense of Théorème 1.16.

*Needs:* `R30.3/boxtimes-p1`, `R30.1/tate-dual`, `R30.1/psi-and-treillis`, `R30.1/boxtimes-qp`, `R30.1/fontaine-functor-convention`.

### Colmez's theorem: Π(D) is irreducible and D(Π(D)) = Ď

**Target `R30.3/colmez-correspondence` (theorem).** Let D ∈ ΦΓ^et(E) be irreducible of rank 2. (i) D^♮ ⊠ ℙ¹ is stable under G. (ii) Π(D) = (D ⊠ ℙ¹)/(D^♮ ⊠ ℙ¹) is a topologically irreducible object of Rep_L G, D^♮ ⊠ ℙ¹ ≅ Π(D)\* ⊗ δ_D, so there is an exact sequence 0 → Π(D)\* ⊗ δ_D → D ⊠ ℙ¹ → Π(D) → 0. (iii) D(Π(D)) = Ď; equivalently V(Π(V)) ≅ V for every absolutely irreducible two-dimensional V. The proof of (i) is by analytic continuation from a Zariski-dense set of crystabelline or trianguline points; Colmez's text records the needed Zariski density for p ≥ 5, for p = 3 except for twists of extensions of k_L by k_L(ω) and of ind ω₂² (those two cases following from Böckle's computation of mod 3 deformation rings), and for p = 2 when V^{ss} is not the sum of two equal characters (a computation of Chenevier); Colmez–Dospinescu–Paškūnas (characteristic zero methods, valid for all p) give the bijection of R30.3/cdp-correspondence, which includes V(Π) ≅ V for all absolutely irreducible V.

**Hypotheses.**
- D irreducible of rank 2 over E; p any prime with the case division recorded in the statement.

*Proof sketch.* (i) ⇒ (ii), (iii): Corollaire II.2.12 and Remarque II.3.2(i): G-stability gives Π(D) ∈ Rep_L G with D(Π(D)) = Ď, and the identification D^♮ ⊠ ℙ¹ ≅ Π(D)\* ⊗ δ_D follows from Ď ≅ D ⊗ δ_D^{−1}. (i) by analytic continuation: the construction is analytic in families (Théorème II.3.3, the family version of (i)) and the crystabelline (or trianguline) points are Zariski-dense in the deformation space of each residual representation (Colmez, Introduction footnote 7, citing his trianguline paper and Kisin's Astérisque article, Böckle for two residual types at p = 3 and Chenevier for p = 2). Crystabelline points: G-stability is checked by explicit computation for crystabelline D (Colmez §II.3.3, pp. 64–69), or alternatively via Corollaire IV.4.13. Irreducibility: Π(D) has irreducible reduction for supersingular reductions; for the general case use V(Π(D)) irreducible of dimension 2 and exactness of V.

**Acceptance.**
- For V crystalline irreducible with distinct Frobenius eigenvalues, Π(V) is the Berger–Breuil completion.
- V(Π(V)) ≅ V.

**Sources.**
- COLMEZ10, Théorème 0.17, Remarque 0.18 and footnote 7, pp. 15–17; Théorème II.3.1, Remarque II.3.2 and Théorème II.3.3, pp. 62–63: States that D^♮ ⊠ ℙ¹ is G-stable, Π(D) is an irreducible object of Rep_L G with the exact sequence 0 → Π(D)\* ⊗ δ_D → D ⊠ ℙ¹ → Π(D) → 0 and D(Π(D)) = Ď; the proof is by analytic continuation from Zariski-dense crystabelline or trianguline families, with the residual cases at p = 2, 3 recorded in footnote 7.
- CDP14, Abstract and §1.1, pp. 1–3: Proves the bijection for all p by characteristic zero methods, whereas the characteristic p methods covered p ≥ 5.

*Needs:* `R30.3/pi-of-D`, `R30.3/montreal-functor`, `R30.3/contragredient`, `R30.1/trianguline-representation`, `LocalGaloisDeformationRings:R08.1/local-lifting-ring`.

### The p-adic local Langlands correspondence for GL₂(ℚ_p)

**Target `R30.3/cdp-correspondence` (theorem).** (i) (Colmez–Dospinescu–Paškūnas; Paškūnas for p ≥ 5) V induces a bijection between isomorphism classes of absolutely irreducible non-ordinary Π ∈ Ban^{adm}_G(L) and absolutely irreducible two-dimensional continuous L-representations of G_{ℚ_p}; its inverse is V ↦ Π(V). (ii) Every absolutely irreducible Π ∈ Ban^{adm}_G(L) is residually of finite length, and after replacing L by its quadratic unramified extension Π̄^{ss} is absolutely irreducible supersingular or a subrepresentation of some π{χ₁, χ₂}. (iii) If Π is absolutely irreducible non-ordinary with central character δ, then det V(Π) = δε. (iv) An object of Ban^{adm}_G(L) has finite length iff it is residually of finite length. (v) dim_L V(Π) ≤ 2 for every absolutely irreducible Π, with equality iff Π is non-ordinary. (vi) For absolutely irreducible non-ordinary Π₁, Π₂: V(Π₁) ≅ V(Π₂) ⇒ Π₁ ≅ Π₂, and Hom_{L[P]}^{cont}(Π₁, Π₂) = Hom_{L[G]}^{cont}(Π₁, Π₂). (vii) For p ≥ 5 (Paškūnas): if Π is absolutely irreducible with central character and Θ an open bounded G-stable lattice then Θ ⊗ k has finite length and either is absolutely irreducible supersingular or has semisimplification inside (Ind_P^G χ₁ ⊗ χ₂ω^{−1})^{ss} ⊕ (Ind_P^G χ₂ ⊗ χ₁ω^{−1})^{ss}, with equality iff Π is non-ordinary.

**Hypotheses.**
- L/ℚ_p finite; Π admissible unitary with central character (automatic for absolutely irreducible Π by Dospinescu–Schraen's Schur lemma).

*Proof sketch.* p ≥ 5: Paškūnas's projective envelope method, showing that End(P̃) surjects onto, and then equals, a deformation ring (R30.5/paskunas-endomorphism-rings), with Theorem 1.3 deduced from Berger–Breuil, Colmez and Kisin. All p: CDP's characteristic zero argument — residual finiteness from the blocks for p = 2 (Paškūnas), Schur's lemma for Banach representations (Dospinescu–Schraen), the locally analytic vectors of unitary principal series, and the infinitesimal action on locally analytic vectors (CDP §1.1–1.5). (iii) from the explicit construction of Π(V) and local class field theory (R30.1/character-dictionary).

**Acceptance.**
- For V crystabelline irreducible, Π(V) is the Berger–Breuil completion and V(Π(V)) = V.
- The ordinary Π (characters, Ŝp ⊗ η, unitary principal series) have dim V(Π) ≤ 1.

**Sources.**
- CDP14, Theorem 1.1, p. 1; Corollary 1.2, p. 2; Theorem 1.4, p. 3; Corollaries 1.6–1.7, p. 4; Theorems 1.8–1.9, pp. 5–6: Proves the bijection between absolutely irreducible non-ordinary admissible unitary Banach representations and absolutely irreducible two-dimensional Galois representations for all p, the determinant δε, residual finiteness with the shape of Π̄^{ss}, the finite length criterion, dim V(Π) ≤ 2, injectivity and the equality of P- and G-homomorphisms.
- PASKUNAS13, Theorem 1.1, p. 2; Corollary 1.2 and Theorem 1.3, p. 3: For p ≥ 5: finite length and shape of Θ ⊗ k, dim V(Π) ≤ 2 with equality iff non-ordinary, and the bijection with determinant ζε.

*Needs:* `R30.3/colmez-correspondence`, `R30.3/montreal-functor`, `R30.2/admissible-unitary-banach`, `R30.2/modp-principal-series`, `R30.2/analytic-and-algebraic-vectors`, `R30.1/character-dictionary`.

### Injectivity of V on Ext¹ of atoms

**Target `R30.3/ext1-injectivity` (theorem).** Let Π ∈ Rep_{k_L}G be an automorphic atom of length at most 3 (the reduction of a unitary principal series or of Π(V), in Colmez's list). Then V induces an injection Ext¹_G(Π, Π) → Ext¹_{G_{ℚ_p}}(V(Π), V(Π)) (extensions with central character); for supersingular atoms this is an isomorphism onto the extensions with determinant fixed. Kisin's deformation-theoretic argument deduces from this injectivity that V induces a closed immersion of deformation spaces, which is an isomorphism because its image contains the Zariski-dense trianguline points.

**Hypotheses.**
- Atoms of length ≤ 3 (the cases of length 4 occur only for p = 2, 3 and are not covered by Colmez's Théorème VII.5.2); central characters fixed.

*Proof sketch.* Compute Ext¹ on the G-side with the Jacquet functor and the extensions of §VII.2 (Colmez §VII.5.1–VII.5.2), and on the Galois side with (φ,Γ)-module cohomology (Appendix VIII). Kisin's argument: injectivity on tangent spaces gives a closed immersion of deformation functors; trianguline density gives surjectivity (Colmez, Introduction §13.2).

**Acceptance.**
- For Π supersingular with V(Π) = ρ̄, dim Ext¹_G(Π, Π)_ζ = dim Ext¹(ρ̄, ρ̄)_{det}.

**Sources.**
- COLMEZ10, Introduction §13.2, pp. 21–22; Théorème VII.5.2, p. 223: Records Kisin's strategy (Ext¹ injectivity plus Zariski density of trianguline points) and proves the injectivity of Ext¹(Π, Π) → Ext¹(V(Π), V(Π)) for automorphic atoms of length at most 3.

*Needs:* `R30.3/montreal-functor`, `R30.3/montreal-on-irreducibles`, `R30.1/trianguline-representation`.

### Locally analytic vectors of Π(D)

**Target `R30.3/analytic-vectors-of-pi` (theorem).** Let D ∈ ΦΓ^et(E) be irreducible of rank 2 and Π = Π(D). (i) D† ⊠ ℙ¹ = {(z₁, z₂) ∈ D ⊠ ℙ¹ : z₁, z₂ ∈ D†} is G-stable and its image in Π(D) is Π(D)^{an}; indeed Π^{an} = (D† ⊠ ℙ¹)/L·(D^♮ ⊠ ℙ¹). (ii) The G-action extends continuously to D_rig ⊠ ℙ¹, with an exact sequence 0 → (Π(D)^{an})\* ⊗ δ_D → D_rig ⊠ ℙ¹ → Π(D)^{an} → 0, and D^♮_rig ⊠ ℙ¹ = (Π̌^{an})\*. (iii) (Colmez–Dospinescu) Π(D) is the universal unitary completion of Π(D)^{an}.

**Hypotheses.**
- D irreducible of rank 2 over E.

*Proof sketch.* (i): D† ⊠ ℤ_p^× is w-stable, proved through Fontaine's heart C(D) = (1−φ)D^{ψ=1}, a free Λ[1/p]-module of rank 2 with w(C(D)) = C'(D) (Proposition V.2.1) and D† ⊠ ℤ_p^× = E†(Γ) ⊗_Λ C(D). (ii): Colmez Théorème V.2.20, using the duality { , }_{ℙ¹} extended to D_rig ⊠ ℙ¹ (Proposition V.2.10). (iii): Colmez–Dospinescu Théorème 0.2 (R30.2/universal-unitary-completion).

**Acceptance.**
- Π(D)^{an} is dense in Π(D).
- For D crystabelline, Π(D)^{an} contains the locally algebraic principal series of R30.4.

**Sources.**
- COLMEZ10, Théorème 0.19, p. 16; Proposition V.2.1, p. 125; Théorème V.2.20, p. 134: D† ⊠ ℙ¹ is G-stable with image Π(D)^{an}, the action extends to D_rig ⊠ ℙ¹ with 0 → (Π^{an})\* ⊗ δ_D → D_rig ⊠ ℙ¹ → Π^{an} → 0, proved through the heart C(D) and w(C) = C'.
- CD14, Théorème 0.2, p. 4: Every Π ∈ Rep_L(G) is the universal unitary completion of Π^{an}.

*Needs:* `R30.3/colmez-correspondence`, `R30.2/analytic-and-algebraic-vectors`, `R30.2/universal-unitary-completion`, `PhiGammaModulesAndIwasawaCohomology:PG.2`, `PhiGammaModulesAndIwasawaCohomology:PG.5/psi-complex`.

### Dependencies of R30.3

Other roadmaps: `LocalGaloisDeformationRings:R08.1/local-lifting-ring`, `PhiGammaModulesAndIwasawaCohomology:PG.2`, `PhiGammaModulesAndIwasawaCohomology:PG.5/psi-complex`. Within this roadmap the layer uses the earlier layers only.

## R30.4. Locally algebraic vectors and classical compatibility

For V de Rham with distinct Hodge–Tate weights the locally algebraic vectors of Π(V) are LL(V) ⊗ Alg(V); without de Rham they vanish, and Hodge–Tate weights alone do not determine Π(V). The crystabelline and semistable cases are local (Colmez); the supercuspidal case has only Emerton's global proof, recorded as gap G1. The layer also plans Henniart's K-types, Kisin's Hypothesis (1.2.6) on lattices containing σ(k, τ), the classification of unitary completions, Kirillov models, the locally analytic vectors of the unitary principal series and Dospinescu's density criterion.

**Targets of the layer.** The algebraic and smooth factors LL(V) and Alg(V) of a de Rham V; Locally algebraic vectors of Π(V): Colmez's theorem; Berger–Breuil: unitary completions of locally algebraic principal series; Henniart's K-types σ(τ), σ^cr(τ) and σ(w, τ); Kisin's Hypothesis (1.2.6): lattices containing the K-type; Classification of unitary completions; weights do not determine Π; Kirillov models of P-algebraic and locally algebraic vectors; Locally analytic vectors of the unitary principal series (trianguline case); Density of locally algebraic vectors and de Rham extensions (Dospinescu).

**Planets.** Locally algebraic vectors of Π(V); Kisin's hypothesis (1.2.6); Unitary completions and Breuil's ℒ-invariant.

### The algebraic and smooth factors LL(V) and Alg(V) of a de Rham V

**Target `R30.4/locally-algebraic-type` (definition).** Let V be a two-dimensional L-representation of G_{ℚ_p} that is de Rham with distinct Hodge–Tate weights a < b (PadicHodgeTheory R06.2/hodge-tate-weight-convention as used by Colmez). Let D_pst(V) be its (φ, N, G_{ℚ_p})-module and WD(V) the attached Frobenius-semisimple Weil–Deligne representation (PadicHodgeTheory R06.3/weil-deligne-parameter). Put LL(V) := LL(D_pst(V)), the smooth representation of R30.1/classical-normalisation-bridge (irreducible except for the N = 0, δ ⊕ δ|·| case, where it is the reducible principal series), Alg(V) := W_{a, b−a} = Sym^{b−a−1}L² ⊗ det^a, and LL(V, a, b) := LL(V) ⊗ Alg(V), a locally algebraic representation of G. For a (φ, N, G_{ℚ_p})-module M and a < b, LL(M, a, b) := LL(M) ⊗ W_{a,b−a} depends on M and (a, b) only, not on the Hodge filtration. The set F of admissible filtrations on M_dR with jumps a < b is ℙ¹(M_dR) minus 0, 1 or 2 points when nonempty, and for ℒ ∈ F, D_ℒ denotes the étale (φ,Γ)-module of the weakly admissible filtered module (M, ℒ).

**Hypotheses.**
- V two-dimensional de Rham with distinct Hodge–Tate weights; the weight convention of Colmez (Théorème 0.20) is recorded with its dictionary to PadicHodgeTheory R06.2.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/LocallyAlgebraic`, namespace `TauCeti.LocAlgType`.

**Uses.**
- Colmez, Théorème 0.21: Π(D)^{lc} = LL(D_pst).
- CDP 2014, Theorem 1.3: completions of π ⊗ W are parametrised by filtrations F(Δ, W).
- Kisin 2009, Hypothesis (1.2.6): σ(k, τ) ⊂ LL(V) ⊗ Alg(V) restricted to K.

**API.**
- `LocAlgType.smoothFactor` (constructor): LL(V) := LL(D_pst(V)).
- `LocAlgType.algFactor` (constructor): Alg(V) := Sym^{b−a−1}L² ⊗ det^a.
- `LocAlgType.locAlg` (constructor): LL(V, a, b) := LL(V) ⊗ Alg(V).
- `LocAlgType.smoothFactor_twist` (functoriality): LL(V ⊗ η) = LL(V) ⊗ (η∘det) for smooth η.
- `LocAlgType.indep_filtration` (characterisation): LL(V, a, b) depends on (D_pst(V) as (φ, N, G_{ℚ_p})-module, a, b) only.
- `LocAlgType.admissibleFiltrations` (data): F ⊂ ℙ¹(M_dR), the admissible filtrations with jumps a < b, cofinite of codimension ≤ 2 points.

*Proof sketch.* WD(V) from D_pst(V) by Fontaine's recipe (PadicHodgeTheory R06.3/fontaine-weil-deligne-functor, using the p-adic monodromy theorem R06.3/p-adic-monodromy-theorem). LL(M) from R30.1/classical-normalisation-bridge. Independence of the filtration is by construction; the parametrisation of admissible filtrations by ℙ¹(M_dR) minus finitely many points is the Colmez–Fontaine theorem in rank 2 (PadicHodgeTheory R06.2/colmez-fontaine-bigness-criterion) applied to lines in M_dR.

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

*Needs:* `R30.1/classical-normalisation-bridge`, `PadicHodgeTheory:R06.3/weil-deligne-parameter`, `PadicHodgeTheory:R06.3/fontaine-weil-deligne-functor`, `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`, `PadicHodgeTheory:R06.2/colmez-fontaine-bigness-criterion`.

### Locally algebraic vectors of Π(V): Colmez's theorem

**Target `R30.4/locally-algebraic-vectors` (theorem).** Let D ∈ ΦΓ^et(E) be irreducible of rank 2, V = V(D) and Π = Π(D). (i) Π^{alg} ≠ 0 iff D is de Rham with distinct Hodge–Tate weights a < b; Π^{alg} = 0 if D is not de Rham; if Π^{alg} ≠ 0 then D is almost de Rham with distinct weights and Π^{alg} = Π^{lc} ⊗ (Sym^{b−a−1} ⊗ det^a) with Π^{lc} smooth admissible. (ii) Π^{alg} depends, up to isomorphism, only on D_pst as (φ, N, G_{ℚ_p})-module and on (a, b), not on the filtration. (iii) If dim J₀(Π^{alg}) = 2 then D is crystabelline and Π^{alg} = LL(D_pst) ⊗ Alg; if dim J₀(Π^{alg}) = 1, D is a locally algebraic twist of a semistable non-crystalline module and Π^{alg} = LL(D_pst) ⊗ Alg; if dim J₀(Π^{alg}) = 0, D is de Rham but becomes semistable over no abelian extension. (iv) Π^{alg} is supersingular iff V is not trianguline. (v) In all cases, Π(V)^{alg} ≅ LL(V) ⊗ Alg(V) (with Emerton's normalisations Sym^{a−b−1} ⊗ det^{b+1} ⊗ π_p(V) for his weights a > b); in the potentially crystalline non-crystabelline (supercuspidal) case this identification is proved only by a global argument (Emerton, lg §7.4), recorded as gap G1.

**Hypotheses.**
- D irreducible of rank 2 over E; for (v) in the supercuspidal case, the global input of gap G1.

*Proof sketch.* (i) non-de Rham: the image of Π^{alg} in D_rig ⊠ ℤ_p^× lies in R(Γ) ⊗ C_e(D), which is w-stable iff D is de Rham (Proposition 0.26, Théorème 0.25 = VI.6.8, via Kato's explicit reciprocity law), giving VI.6.13. (i) de Rham: nonvanishing by Lemme VI.6.19 (Théorème VI.6.18); the type (ℓ, k) structure by Proposition VI.5.1 and the Kirillov model (Théorème VI.5.7). (ii): Théorème VI.6.42, comparing D_ℒ for varying filtrations inside N_rig ⊠ ℙ¹. (iii): Théorème VI.6.50, from the Jacquet module J₀ and D_crab (Théorème VI.6.30, Proposition VI.6.33). (iv): Remarque VI.6.51(i) with the trianguline classification (R30.1/trianguline-representation). (v): crystabelline and semistable-twist cases from (iii); the remaining case by Emerton's global argument via (ii) — choose a modular V' with the same D_pst and weights (Emerton lg §7.4) — recorded as gap G1 because its inputs (completed cohomology of modular curves, the weight part of Serre's conjecture) lie outside this roadmap and downstream of R30.6.

**Acceptance.**
- For V de Rham with Hodge–Tate weights 0 and 1, Alg(V) is trivial and Π(V)^{lisse} = Π(V)^{alg} = LL(V) (CDN 2020 §0.2).
- For V crystalline irreducible with weights 0 < k−1, Π(V)^{alg} is the locally algebraic principal series LL(V) ⊗ Sym^{k−2}.
- For V semistable non-crystalline with weights 0 < k−1, Π(V)^{alg} = (St ⊗ Sym^{k−2}) ⊗ δ for the smooth δ of D_crab.
- For V not de Rham, Π(V)^{alg} = 0 while Π(V)^{an} is dense.

**Sources.**
- COLMEZ10, Théorèmes 0.20–0.21, p. 17; Théorème 0.25 and Proposition 0.26, p. 20; Théorème VI.5.7, p. 167; Théorèmes VI.6.13 and VI.6.18, pp. 177–178; Théorème VI.6.42, p. 189; Théorème VI.6.50 and Remarque VI.6.51, pp. 192–193: Π(D)^{alg} is nonzero iff D is de Rham with distinct weights, with Π^{alg} = Π^{lc} ⊗ Sym^{b−a−1} ⊗ det^a; Π^{alg} is independent of the filtration; LL(D_pst) = Π^{lc} in the crystabelline and semistable-twist cases; supersingular Π^{alg} iff V not trianguline; the remaining case uses Emerton's global work.
- EMERTON-LG, Theorem 3.3.22 and Remark 3.3.23, p. 28; §7.4, pp. 96–98: B(V)^{l.alg} ≅ Sym^{a−b−1} ⊗ det^{b+1} ⊗ π_p(V) for de Rham V with weights a > b; the potentially crystalline non-crystabelline case is proved by choosing a modular representation with the same Weil–Deligne type and weights and computing in completed cohomology.
- CDP14, Theorem 1.3 and footnote 5, p. 2: The classification of completions uses Emerton's local-global compatibility; the authors note that a purely local proof is available for principal series and Steinberg types but not for supercuspidal ones.
- CDNKISIN, Remarque 0.2(v), p. 3: Even their purely local construction of Kisin rings has a hidden global ingredient: Emerton's local-global compatibility ensures that M and LL(M) correspond under the classical correspondence.
- CDN20, §0.2, p. 4 and footnote 4 (arXiv): For V de Rham of dimension 2 with weights 0 and 1, LL(V) = Π(V)^{lisse}, recovered from Π(V) by taking locally constant vectors.

*Needs:* `R30.4/locally-algebraic-type`, `R30.3/colmez-correspondence`, `R30.3/analytic-vectors-of-pi`, `R30.2/analytic-and-algebraic-vectors`, `R30.1/trianguline-representation`, `PadicHodgeTheory:R06.3/de-rham-iff-dif-connection-trivial`, `PhiGammaModulesAndIwasawaCohomology:PG.5/psi-complex-h1`.

### Berger–Breuil: unitary completions of locally algebraic principal series

**Target `R30.4/berger-breuil-completion` (theorem).** Let V be an absolutely irreducible two-dimensional L-representation of G_{ℚ_p} that becomes crystalline over an abelian extension of ℚ_p and is φ-semisimple, with Hodge–Tate weights a < b. Let B(V) be the p-adic completion of the locally algebraic representation Alg(V) ⊗ Lisse(V) (a locally algebraic principal series) with respect to a G-stable finitely generated O-lattice. Then B(V) is nonzero, topologically irreducible and admissible, and it is the universal unitary completion of Alg(V) ⊗ Lisse(V); its dual is identified with the ψ-limit (lim_ψ D(V))_b. With Colmez's construction, B(V) ≅ Π(V).

**Hypotheses.**
- V crystabelline (crystalline over an abelian extension), φ-semisimple, absolutely irreducible; p odd in Berger–Breuil's source; the exceptional cases α = β|·|^{±1} handled by Paškūnas for p > 2 (Emerton lg footnote 9).

*Proof sketch.* Construct B(V) as the completion of the locally algebraic principal series (R30.2/universal-unitary-completion). Identify (lim_ψ D(V))_b with B(V)\* (Berger–Breuil Théorème 5.2.7) using the (φ,Γ)-module of the crystabelline V and the Amice transform (R30.1/fontaine-functor-convention). Nonvanishing, topological irreducibility and admissibility: Corollaires 5.3.1–5.3.3. B(V) ≅ Π(V): compare Théorème 5.2.7 with Colmez's Π(D)\* ≅ D^♮ ⊠ ℙ¹ ⊗ δ_D^{−1} (R30.3/colmez-correspondence) as in Kisin's proof of Theorem (1.2.8).

**Acceptance.**
- For V crystalline irreducible with Hodge–Tate weights 0, k−1 and distinct Frobenius eigenvalues, B(V) is the completion of LL(V) ⊗ Sym^{k−2}, LL(V) the unramified principal series of R30.4/locally-algebraic-type.
- B(V)^{alg} = Alg(V) ⊗ Lisse(V).

**Sources.**
- BB10, Introduction, pp. 2–3 (main Théorème); Théorème 5.2.7, p. 51; Corollaires 5.3.1–5.3.3, p. 52: For V absolutely irreducible, crystalline over an abelian extension and φ-semisimple, B(V) — the completion of Alg(V) ⊗ Lisse(V) — is nonzero, topologically irreducible and admissible; its dual is the ψ-limit of D(V).
- KISIN09, Theorem (1.2.8) and its proof, p. 9 of the author's preprint: For V irreducible of abelian type the lattice required by Hypothesis (1.2.6) is the Berger–Breuil completion, matched with Colmez's construction by comparing Berger–Breuil Théorème 5.2.7 with Colmez's results.

*Needs:* `R30.2/universal-unitary-completion`, `R30.4/locally-algebraic-type`, `R30.1/fontaine-functor-convention`, `R30.3/colmez-correspondence`.

### Henniart's K-types σ(τ), σ^cr(τ) and σ(w, τ)

**Target `R30.4/henniart-types` (definition).** Let τ : I_{ℚ_p} → GL₂(L) be a representation with open kernel that extends to W_{ℚ_p} (an inertial type). Henniart's theorem: there is a unique smooth irreducible representation σ(τ) (resp. σ^cr(τ)) of K = GL₂(ℤ_p) on an L-vector space such that for every smooth absolutely irreducible infinite-dimensional representation π of G, Hom_K(σ(τ), π) ≠ 0 (resp. Hom_K(σ^cr(τ), π) ≠ 0) iff LL(π)|_{I_{ℚ_p}} ≅ τ (resp. and the monodromy N = 0), LL being the classical correspondence of R30.1/classical-normalisation-bridge. σ(τ) ≅ σ^cr(τ) except for scalar τ ≅ χ ⊕ χ, where σ(τ) ≅ s̃t ⊗ (χ∘det) (s̃t the Steinberg representation of GL₂(𝔽_p) inflated to K) and σ^cr(τ) ≅ χ∘det. For a Hodge type w = (a, b) with b > a put σ(w, τ) = σ(τ) ⊗ Sym^{b−a−1}L² ⊗ det^a and σ^cr(w, τ) likewise; Kisin writes σ(k, τ) = σ(τ) ⊗ Sym^{k−2}L² for w = (0, k−1). For a K-stable O-lattice Θ ⊂ σ(w, τ), σ̄(w, τ) := (Θ/ϖΘ)^{ss} is independent of Θ, and m_σ(w, τ) (resp. m^cr_σ(w, τ)) is the multiplicity of an irreducible smooth k-representation σ of K in σ̄(w, τ) (resp. σ̄^cr(w, τ)).

**Hypotheses.**
- τ of Galois type; the classical correspondence normalised as in R30.1/classical-normalisation-bridge (Kisin §1.1: central character τ̃|_{ℚ_p^×}).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Types`, namespace `TauCeti.HenniartType`.

**Uses.**
- Paškūnas 2015, Theorem 1.1: the multiplicities m_σ(w, τ) in the Breuil–Mézard cycle identity.
- Kisin 2009, Hypothesis (1.2.6): σ(k, τ) ↪ Θ ⊗ ℚ_p.
- GL2ModularityLifting R32.2: patched modules M_∞(σ(k, τ)) and their supports.

**API.**
- `HenniartType.sigma` (constructor): σ(τ), the smooth irreducible L-representation of K attached to τ.
- `HenniartType.sigmaCris` (constructor): σ^cr(τ).
- `HenniartType.hom_ne_zero_iff` (characterisation): Hom_K(σ(τ), π) ≠ 0 iff LL(π)|_I ≅ τ, for π absolutely irreducible infinite-dimensional.
- `HenniartType.sigmaCris_eq_sigma` (relation): σ^cr(τ) ≅ σ(τ) unless τ is scalar.
- `HenniartType.sigmaW` (constructor): σ(w, τ) = σ(τ) ⊗ Sym^{b−a−1} ⊗ det^a and σ^cr(w, τ).
- `HenniartType.reductionSS` (projection): σ̄(w, τ), the semisimplified reduction of a K-stable lattice, independent of the lattice.
- `HenniartType.mult` (projection): m_σ(w, τ) and m^cr_σ(w, τ) ∈ ℕ.

*Proof sketch.* Henniart's appendix to Breuil–Mézard constructs σ(τ) case by case (principal series types by induction from the Iwahori, supercuspidal types from GL2AutomorphicRepresentationsAndTransfer R16.2/henniart-unicity) and proves uniqueness. The scalar-type exception: for τ = χ ⊕ χ, the unramified principal series twisted by χ contains χ∘det while St ⊗ χ contains only s̃t ⊗ χ, which separates N = 0 from N ≠ 0. Independence of σ̄(w, τ) from Θ: Brauer–Nesbitt for the finite group K/K_n through which σ(w, τ) factors modulo ϖ.

**Checks.**
- `HenniartType.sigmaCris_trivial` (computation): σ^cr(1) is the trivial representation and σ(1) = s̃t, of dimension p.
- `HenniartType.mult_weight_two_trivial` (computation): For w = (0, 1), τ = 1: m^cr_σ = 1 for σ trivial and 0 otherwise.
- `HenniartType.sigma_scalar_ne` (non-example): For scalar τ = χ ⊕ χ, σ(τ) ≇ σ^cr(τ): their dimensions are p and 1.
- `HenniartType.sigma_twist` (degenerate): σ(τ ⊗ χ) ≅ σ(τ) ⊗ (χ∘det) for a character χ of ℤ_p^×.

**Acceptance.**
- For τ trivial: σ^cr(1) is trivial and σ(1) = s̃t, so m_σ(w, 1) counts constituents of s̃t ⊗ Sym^{b−a−1} ⊗ det^a mod ϖ.
- For w = (0, 1) and τ trivial, σ̄^cr(w, τ) is the trivial representation of K.

**Sources.**
- PASKUNAS15, §1, p. 2: States Henniart's existence and uniqueness of σ(τ) and σ^cr(τ) characterised by Hom_K(σ(τ), π) ≠ 0 iff LL(π)|_I ≅ τ (and N = 0 for σ^cr), the scalar-type exception s̃t ⊗ χ versus χ, σ(w, τ) = σ(τ) ⊗ Sym^{b−a−1} ⊗ det^a, its semisimplified reduction and the multiplicities m_σ(w, τ), m^cr_σ(w, τ).
- KISIN09, §1.1, pp. 4–6 of the author's preprint: Recalls Henniart's σ(τ) from the appendix to Breuil–Mézard with the classical correspondence normalised by the central character, and sets σ(k, τ) = σ(τ) ⊗ Sym^{k−2}E².

*Needs:* `R30.1/classical-normalisation-bridge`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/henniart-unicity`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/cdt-inertia-multiplicity`, `LocalGaloisDeformationRings:R08.3/hodge-and-galois-types`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/serre-weights-compact-induction`.

### Kisin's Hypothesis (1.2.6): lattices containing the K-type

**Target `R30.4/kisin-hypothesis` (theorem).** Let p be odd, k ≥ 2, τ : I_{ℚ_p} → GL₂(E) an inertial type of Galois type, ψ a continuous character with ψ|_{I} compatible with τ, and σ(k, τ) = σ(τ) ⊗ Sym^{k−2}E² the Henniart–Breuil–Mézard K-type (R30.4/henniart-types). For every finite E'/E and every two-dimensional E'-representation V of G_{ℚ_p} that is potentially semistable of type τ with Hodge–Tate weights 0, k−1 and determinant ψ·χ_cyc (Kisin's type (k, τ, ψ)), there exist an admissible O_{E'}-lattice Θ (p-adically complete and separated O[G]-module with Θ/p^n of finite length and admissible) with central character ψ such that V(Θ) ⊗ ℚ_p ≅ V, and a K-equivariant inclusion σ(k, τ) ↪ Θ ⊗ ℚ_p. Proven: for τ of abelian type (τ extends to an abelian representation of W_{ℚ_p}) by Kisin's Theorem (1.2.8); for every de Rham type by Emerton (lg Theorem 3.3.22) together with Colmez's Théorème VI.6.50 (crystabelline and semistable cases) and R30.4/locally-algebraic-vectors, the supercuspidal types depending on gap G1.

**Hypotheses.**
- p odd (Kisin §1.0); types of Galois type; V of type (k, τ, ψ) in Kisin's sense (1.1).
- For non-abelian (supercuspidal) types the statement rests on R30.4/locally-algebraic-vectors (v) and therefore on gap G1.

*Proof sketch.* Take Θ an open bounded G-stable lattice in Π(V) (R30.3/pi-of-D) with central character ψ, so V(Θ) ⊗ ℚ_p ≅ V (R30.3/colmez-correspondence; for reducible V use the lattices P(χ₁, χ₂) in continuous principal series, Kisin Lemma (1.2.10)). Π(V)^{alg} ≅ LL(V) ⊗ Alg(V) (R30.4/locally-algebraic-vectors), and Alg(V) = Sym^{k−2} for weights 0, k−1. Henniart's property of σ(τ) (R30.4/henniart-types): LL(V)|_K ⊇ σ(τ) because WD(V)|_I ≅ τ; hence σ(k, τ) ↪ Π(V)^{alg} ⊂ Π(V) = Θ ⊗ ℚ_p. Abelian types: Berger–Breuil and Colmez give the completion directly (Kisin Theorem (1.2.8), R30.4/berger-breuil-completion).

**Acceptance.**
- For τ trivial and k = 2, σ(2, 1) is the trivial K-representation and Θ ⊗ ℚ_p has a nonzero K-fixed vector.
- The hypothesis holds for all de Rham V with abelian type unconditionally.

**Sources.**
- KISIN09, §1.1 and Hypothesis (1.2.6), Theorem (1.2.8), (1.2.7), pp. 4–9 of the author's preprint: Defines type (k, τ, ψ) (potentially semistable of type τ, Hodge–Tate weights 0, k−1, determinant ψχ_cyc), states Hypothesis (1.2.6) asking for an admissible lattice with V(Θ) ⊗ ℚ_p = V and a K-equivariant σ(k, τ) ↪ Θ ⊗ ℚ_p, and proves it for τ of abelian type.
- EMERTON-LG, Theorem 3.3.22, p. 28 and §7.4, pp. 96–98: Identifies the locally algebraic vectors of B(V) for all de Rham V with distinct weights, which gives Kisin's hypothesis for every type.
- DP22, Proof of Theorem 1.4, p. 4: Records that the compatibility between classical and p-adic local Langlands in Kisin's article is supplied by Emerton (lg Theorem 1.2.1) and Paškūnas (Duke 2015, Theorem 1.1).

*Needs:* `R30.4/locally-algebraic-vectors`, `R30.4/berger-breuil-completion`, `R30.3/pi-of-D`, `R30.3/colmez-correspondence`, `R30.4/henniart-types`.

### Classification of unitary completions; weights do not determine Π

**Target `R30.4/completions-of-locally-algebraic` (theorem).** Let π be an admissible absolutely irreducible infinite-dimensional smooth L-representation of G, W = Sym^{k−1}L² ⊗ det^a (k ≥ 1), Δ the Weil representation attached to π by the classical correspondence (viewed as a (φ, G_{ℚ_p})-module), and F(Δ, W) the set of weakly admissible absolutely irreducible filtered (φ, N, G_{ℚ_p})-modules with underlying Δ and filtration jumps −a, −a−k. (i) If Π is an admissible absolutely irreducible non-ordinary unitary completion of π ⊗ W then V(Π) is potentially semistable with Hodge–Tate weights a, a+k and D_pst(V(Π)) has underlying (φ, G_{ℚ_p})-module Δ. (ii) Π ↦ D_pst(V(Π)) is a bijection from such completions onto F(Δ, W), which is a point if π is a principal series and ℙ¹(L) if π is supercuspidal or a twist of the Steinberg. In particular St ⊗ |det|^{k/2} ⊗ Sym^k L² has exactly ℙ¹(L) pairwise non-isomorphic absolutely irreducible admissible unitary completions (Breuil's conjecture): a p-adic Banach representation is not determined by its Hodge–Tate weights and locally algebraic vectors.

**Hypotheses.**
- π infinite-dimensional; completions absolutely irreducible, admissible, non-ordinary; the supercuspidal case uses Emerton's local-global compatibility (CDP footnote 5), i.e. gap G1.

*Proof sketch.* Combine R30.3/cdp-correspondence (every such completion is Π(V)), R30.4/locally-algebraic-vectors (Π(V)^{alg} = LL(V) ⊗ Alg(V) and its independence of the filtration) and the converse that Π(D_ℒ) completes LL(M, a, b) for each ℒ ∈ F (Colmez Théorème VI.6.42, Remarque 0.22). Distinct ℒ give non-isomorphic Π(D_ℒ) since V(Π(D_ℒ)) = V(D_ℒ) are non-isomorphic.

**Acceptance.**
- For π = St ⊗ |det|^{k/2}, W = Sym^k: completions ↔ ℙ¹(L) (the L-invariant).
- For π an irreducible principal series, the completion is unique.

**Sources.**
- CDP14, Theorem 1.3 and the paragraph before it, p. 2: Proves that admissible absolutely irreducible non-ordinary completions of π ⊗ W correspond bijectively to F(Δ, W), a point for principal series and ℙ¹(L) for supercuspidal or Steinberg π.
- PASKUNAS13, §1, p. 3: Deduces that St ⊗ |det|^{k/2} ⊗ Sym^k L² admits precisely ℙ¹(L) non-isomorphic absolutely irreducible admissible unitary completions, confirming Breuil's conjecture.
- COLMEZ10, Remarque 0.22, p. 18: The filtrations with jumps a < b are parametrised by ℙ¹(M_dR) minus finitely many points and the Jordan–Hölder constituents of Π(D_ℒ)^{an} do not depend on ℒ; the filtration is encoded in the extension.

*Needs:* `R30.3/cdp-correspondence`, `R30.4/locally-algebraic-vectors`, `R30.4/locally-algebraic-type`.

### Kirillov models of P-algebraic and locally algebraic vectors

**Target `R30.4/kirillov-model` (theorem).** Let D ∈ ΦΓ^et(E) be irreducible of rank 2, almost de Rham with Hodge–Tate weights ℓ < ℓ + k, Π = Π(D), and X^-_∞ ⊂ D̃_dif/D̃⁺_dif the L_∞[t]/t^k-module of Colmez §VI.4. (i) For z ∈ Π^{alg}, K_z(x) f_D = ι^-_0((x 0; 0 1)·z) defines K_z : ℚ_p^× → L_∞[t]/t^k with σ_a(K_z(x)) = K_z(ax), its coefficients locally constant with compact support in ℚ_p, and z ↦ K_z is a bijection of Π^{alg} onto its Kirillov model. (ii) Π^{alg}, if nonzero, is of type (ℓ, k) and irreducible, except in the special case where it is an extension of W_{ℓ,k} ⊗ (δ₀∘det) by W_{ℓ,k} ⊗ St ⊗ (δ₀∘det) for a smooth δ₀. (iii) The P-algebraic vectors with compact support Π^{P−alg}_c satisfy: z ↦ φ_z is a B-equivariant isomorphism Π^{P−alg}_c ≅ LP_c(ℚ_p^×, X^-_∞)^Γ (locally polynomial, compactly supported functions with Γ-equivariance), Π^{P−alg}_c ⊂ Π^{an}, and Π^{P−alg}_c ⊂ Π^{alg} when Π^{alg} ≠ 0. This is the P-equivariant embedding of functions on ℚ_p^× with values in D^-_dif into Π(V)^{la} used by consumers.

**Hypotheses.**
- D irreducible of rank 2, almost de Rham with weights ℓ < ℓ + k (for (i)–(ii)); (iii) for D irreducible of rank 2 with these weights.

*Proof sketch.* (i): Proposition VI.5.6 from Lemme VI.5.4 (the map z ↦ φ_z = ι^-_0 on the B-orbit). (ii): Théorème VI.5.7, from the Kirillov model and Proposition VI.2.12 on smooth representations with a Kirillov model. (iii): Proposition VI.5.8 (surjectivity via an explicit lift in Ñ_dif), Corollaire VI.5.9 and Proposition VI.5.12(i).

**Acceptance.**
- For D crystalline irreducible with weights 0, k, the Kirillov functions of Π^{alg} take values in L_∞[t]/t^k and are compactly supported in ℚ_p.
- Π^{P−alg}_c ≅ ⊕_{i∈ℤ} X^-_∞ via z ↦ (ι^-_i(z̃))_i (Lemme VI.5.10).

**Sources.**
- COLMEZ10, §VI.5.2–VI.5.4: Proposition VI.5.6 and Théorème VI.5.7, p. 167; Proposition VI.5.8, Corollaire VI.5.9 and Lemme VI.5.10, p. 168; Proposition VI.5.12(i), p. 169: Constructs K_z with σ_a(K_z(x)) = K_z(ax) and shows z ↦ K_z is a bijection onto the Kirillov model; Π^{alg} is of type (ℓ, k), irreducible or the special Steinberg extension; z ↦ φ_z identifies the compactly supported P-algebraic vectors with LP_c(ℚ_p^×, X^-_∞)^Γ, inside Π^{an}.

*Needs:* `R30.4/locally-algebraic-vectors`, `R30.3/analytic-vectors-of-pi`, `PadicHodgeTheory:P7/fontaine-dif-module`.

### Locally analytic vectors of the unitary principal series (trianguline case)

**Target `R30.4/trianguline-analytic-vectors` (theorem).** Let s = (δ₁, δ₂, ℒ) ∈ S_irr (R30.1/trianguline-representation), Δ(s) the trianguline (φ,Γ)-module over R, and Π(Δ(s)) = Π(V(s))^{an}. For η₁, η₂ ∈ T̂(L) let Ban(η₁, η₂) := Ind^{an}_B^G(η₂ ⊗ η₁χ^{−1}) (locally analytic induction). (i) J\*(Π(Δ)) ≠ 0 iff Δ is triangulable, i.e. iff Π(Δ̂[0]) is a unitary principal series. (ii) If s is generic (δ_s := χ^{−1}δ₁δ₂^{−1} ∉ {x^k : k ∈ ℕ}), there is an exact sequence 0 → Ban(δ₁, δ₂) → Π(Δ(s)) → Ban(δ₂, δ₁) → 0, and Π(Δ(s)) is the unique non-trivial such extension. (iii) If s is special, Ban(δ₁, δ₂) contains a (k+1)-dimensional subrepresentation W(δ₁, δ₂) with quotient St^{an}(δ₁, δ₂), Ext¹(R(δ₂), R(δ₁)) ≅ Ext¹(W(δ₁, δ₂), St^{an}(δ₁, δ₂)), and 0 → E_ℒ → Π(Δ(s)) → Ban(δ₂, δ₁) → 0 with E_ℒ the extension determined by ℒ; for δ_s = x^k these are Breuil's ℒ-invariant extensions. (iv) Π(V(s)) is the universal unitary completion of ker p_s.

**Hypotheses.**
- s ∈ S_irr; p ≠ 2 where Colmez's trianguline classification is used (gap G2).

*Proof sketch.* Compute the Jacquet-type module J\*(s) of Π(Δ(s)) (Colmez 2014, Théorème 0.6) from the description of Π(D)^{an} through D_rig ⊠ ℙ¹ (R30.3/analytic-vectors-of-pi). An eigenvector of B in J\*(Π) gives a G-map to Ind^{an}; this gives p_s : Π(Δ(s)) → Ban(δ₂, δ₁), shown surjective with the stated kernel (Théorème 0.7). Uniqueness of the extension: dim Ext¹(Ban(δ₂, δ₁), Ban(δ₁, δ₂)) = 1 for generic s (Remarque 0.8(i), citing Liu–Xie–Zhang); (iv) is Remarque 0.8(iii).

**Acceptance.**
- For V crystalline irreducible with distinct eigenvalues, Π(V)^{an} is an extension of two locally analytic principal series.
- For V semistable non-crystalline, the extension class of E_ℒ recovers the Fontaine–Mazur ℒ-invariant.

**Sources.**
- COLMEZ14LA, Théorème 0.1, p. 5; Propositions 0.2–0.5, pp. 5–6; Théorèmes 0.6–0.7 and Remarque 0.8, p. 7: J\*(Π(Δ)) ≠ 0 iff Δ is triangulable; for s ∈ S_irr the map p_s : Π(Δ(s)) → Ban(δ₂, δ₁) is onto with kernel Ban(δ₁, δ₂) in the generic case and Breuil's extension E_ℒ in the special case; Π(V(s)) is the universal completion of ker p_s.

*Needs:* `R30.1/trianguline-representation`, `R30.3/analytic-vectors-of-pi`, `R30.2/analytic-and-algebraic-vectors`, `R30.2/universal-unitary-completion`.

### Density of locally algebraic vectors and de Rham extensions (Dospinescu)

**Target `R30.4/de-rham-extensions` (theorem).** Let p ≥ 5 and Π ∈ Rep_L(δ) supersingular with Π^{alg} ≠ 0 (so Π = Π(V) with V de Rham with distinct weights). For an extension 0 → Π → Π₁ → Π → 0 in Rep_L(δ), the following are equivalent: (a) Π₁^{alg} is dense in Π₁; (b) Π₁^{alg} ≠ Π^{alg}; (c) V(Π₁) is de Rham. Consequently V induces an isomorphism Ext¹_{alg}(Π, Π) ≅ Ext¹_{g,ζ}(V(Π), V(Π)) onto the de Rham extensions with fixed determinant, and if Π ∈ Rep_L(δ) is the completion of its locally algebraic vectors then V(Π) is de Rham. The converse fails: V(Π) de Rham does not force Π to be the completion of Π^{alg}.

**Hypotheses.**
- p ≥ 5; Π supersingular (all Jordan–Hölder factors of the reduction supersingular) with Π^{alg} ≠ 0; central character δ fixed.

*Proof sketch.* Describe Π^{P−fin} as a dense B-stable subspace of Π^{an} (Dospinescu Théorème 1.8) and the P-algebraic compactly supported vectors (R30.4/kirillov-model). Hodge–Tate case first (Théorème 1.9(a)–(b)), then the de Rham criterion via the inclusion Π₁^{P−alg}_c ⊂ Π₁^{alg} (Théorème 1.9(c)). The Ext¹ isomorphism (Théorème 1.3) and the completion criterion (Théorème 1.7) follow.

**Acceptance.**
- For Π₁ a non-de Rham self-extension, Π₁^{alg} = Π^{alg}.
- The trivial extension Π ⊕ Π has V de Rham and dense locally algebraic vectors.

**Sources.**
- DOSPINESCU15, Théorèmes 1.2 and 1.3, pp. 3–4; Théorème 1.7 and Remarque 1.1, pp. 2–6; Théorèmes 1.8–1.9, p. 7: For p ≥ 5 and supersingular Π with Π^{alg} ≠ 0: density of Π₁^{alg} ⇔ Π₁^{alg} ≠ Π^{alg} ⇔ V(Π₁) de Rham; the induced Ext¹ isomorphism onto de Rham extensions; completions of locally algebraic vectors have de Rham V(Π), with the converse failing.
- CDNKISIN, Introduction, p. 3 (second ingredient): Uses the extension of these results — Π(V) is the completion of its locally algebraic vectors in an extension E of V by V iff E is de Rham — to show their rings R^{[a,b]}_{M,ρ} are products of principal ideal domains.

*Needs:* `R30.4/locally-algebraic-vectors`, `R30.4/kirillov-model`, `R30.3/cdp-correspondence`.

### Dependencies of R30.4

Other roadmaps: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/serre-weights-compact-induction`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/henniart-unicity`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/cdt-inertia-multiplicity`, `LocalGaloisDeformationRings:R08.3/hodge-and-galois-types`, `PadicHodgeTheory:P7/fontaine-dif-module`, `PadicHodgeTheory:R06.2/colmez-fontaine-bigness-criterion`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`, `PadicHodgeTheory:R06.3/de-rham-iff-dif-connection-trivial`, `PadicHodgeTheory:R06.3/fontaine-weil-deligne-functor`, `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`, `PadicHodgeTheory:R06.3/weil-deligne-parameter`, `PhiGammaModulesAndIwasawaCohomology:PG.5/psi-complex-h1`. Within this roadmap the layer uses the earlier layers only.

## R30.5. Blocks, projective envelopes and deformation rings

Blocks decompose the locally finite mod p category; for each block the projective envelope P_B of the dual of its irreducibles has an endomorphism ring Ẽ_B whose centre is the pseudodeformation ring of the residual Galois representation (Paškūnas for p ≥ 5; Paškūnas–Tung for every p, with the p = 3 and p = 2 defects). Supersingular, generic reducible and exceptional blocks are treated separately. The layer adds Kisin's comparison of deformation functors, Nakamura's description of P̃ as the dual of the universal deformation, the Breuil–Mézard cycle identity with Paškūnas's support criterion, the Kisin rings of Colmez–Dospinescu–Nizioł and Breuil–Conrad–Diamond–Taylor admittance.

**Targets of the layer.** Blocks of locally finite mod p representations; Paškūnas's classification of blocks and the bijection B ↔ ρ̄_B; Projective envelopes P̃ and Paškūnas's axiomatic framework; The pseudodeformation ring R^{ps,δ}_B of a block; Paškūnas: endomorphism rings of projective envelopes are deformation rings; The local R = T theorem for every block (Paškūnas–Tung); Kisin: deformations of π̄ and of ρ̄ coincide; P̃ is the dual of the universal deformation of π̄; Removing P̃ from Hom; The Breuil–Mézard cycle identity for ρ̄; Paškūnas's criterion: supports of M(Θ) and the cycle formula; Kisin rings from the classical correspondence (Colmez–Dospinescu–Nizioł); Admittance of residual representations by types (BCDT); BCDT's Conjecture 1.3.1(1) from the Breuil–Mézard identity.

**Planets.** Blocks of mod p representations; Classification of blocks; Projective envelopes P̃; Paškūnas's theorem: End(P̃) is a deformation ring; Local R = T for blocks; Breuil–Mézard cycle identity.

### Blocks of locally finite mod p representations

**Target `R30.5/blocks` (definition).** On the set of isomorphism classes of irreducible objects of Mod^{l.fin}_{G,ζ}(O) (equivalently of Rep^{ℓf}G with central character ζ) put τ ∼ π if there is a chain τ = τ₀, τ₁, …, τ_n = π of irreducibles with τ_i ≅ τ_{i+1} or Ext¹_G(τ_i, τ_{i+1}) ≠ 0 or Ext¹_G(τ_{i+1}, τ_i) ≠ 0. An equivalence class B is a block, Mod^{l.fin}_{G,ζ}(O)_B the full subcategory of objects all of whose irreducible subquotients lie in B, π_B = ⊕_{π∈B} π, J_B an injective envelope of π_B, P_B = J_B^∨ (a projective envelope of π_B^∨ in C_{G,ζ}(O)), Ẽ_B = End_G(J_B) ≅ End_{C(O)}(P_B)^{op} with its pseudo-compact topology, and Z_B its centre, which is the centre of the category Mod^{l.fin}_{G,ζ}(O)_B. Gabriel: Mod^{l.fin}_{G,ζ}(O) ≅ ∏_B Mod^{l.fin}_{G,ζ}(O)_B, and τ ↦ m_B(τ) := Hom_G(τ, J_B) (equivalently Hom_{C(O)}(P_B, τ^∨)) is an anti-equivalence of Mod^{l.fin}_{G,ζ}(O)_B with compact Ẽ_B-modules, with Π ≅ ⊕_B (m_B(Π) ⊗_{Ẽ_B} P_B)^∨ for finite length Π. Blocks over k_L are Gal(𝔽̄_p/k_L)-orbits of blocks over 𝔽̄_p.

**Hypotheses.**
- ζ fixed; F = ℚ_p; blocks may be taken over k_L or 𝔽̄_p (rationality as in CDN 2023 Remarques 1.11 and 1.13).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Blocks`, namespace `TauCeti.Block`.

**Uses.**
- Paškūnas 2013, Theorems 1.5–1.7: Ẽ_B and its centre are computed in terms of deformation rings.
- Paškūnas–Tung, Theorems 1.1–1.4: Z_B is noetherian and E_B finite over R^{ps}.
- CDN 2023, Proposition 4.10: M = (k ⊗_{R^{ps}} S^∨)^∨ in the block of r̄^{ss}.

**API.**
- `Block` (data): A block B: an equivalence class of irreducibles under Ext¹-linkage.
- `Block.subcategory` (constructor): Mod^{l.fin}_{G,ζ}(O)_B.
- `Block.injectiveEnvelope` (constructor): J_B, an injective envelope of π_B.
- `Block.projectiveEnvelope` (constructor): P_B = J_B^∨ in C_{G,ζ}(O).
- `Block.endRing` (constructor): Ẽ_B = End_G(J_B) with its pseudo-compact topology.
- `Block.centre` (constructor): Z_B, the centre of Ẽ_B, equal to the centre of the block subcategory.
- `Block.decomposition` (equivalence): Mod^{l.fin}_{G,ζ}(O) ≅ ∏_B Mod^{l.fin}_{G,ζ}(O)_B.
- `Block.gabriel` (equivalence): τ ↦ Hom_G(τ, J_B) is an anti-equivalence onto compact Ẽ_B-modules.

*Proof sketch.* Mod^{l.fin}_{G,ζ}(O) is a locally finite Grothendieck category (R30.2/smooth-torsion-categories); Gabriel's decomposition of locally finite categories into blocks applies (Paškūnas 2013 §1.1 and [35, §IV] there). The anti-equivalence with compact Ẽ_B-modules is Gabriel's theorem for categories with a projective generator in the dual (R30.2/pontryagin-dual-category). Rationality: Lemma 1.6 and Lemma 1.7 of CDN 2023 (Hom and absolute irreducibility under field extension) give the Galois-orbit description.

**Checks.**
- `Block.supersingular_singleton` (computation): For π supersingular, the block of π is {π}.
- `Block.zero` (degenerate): The zero representation lies in every Mod^{l.fin}_{G,ζ}(O)_B.
- `Block.not_finite_length` (non-example): J_B is not of finite length, and Ẽ_B is not an artinian ring.
- `Block.galois_orbits` (characterisation): Blocks over k_L correspond to Gal(𝔽̄_p/k_L)-orbits of blocks over 𝔽̄_p.

**Acceptance.**
- A supersingular π alone forms a block {π}.
- The centre Z_B acts on every object of the block, functorially.

**Sources.**
- PASKUNAS13, §1.1, pp. 4–5: Defines the equivalence relation by Ext¹-chains, blocks, π_B, J_B, Ẽ_B, the Gabriel decomposition Mod^{l.fin}_{G,ζ}(O) ≅ ∏_B Mod^{l.fin}_{G,ζ}(O)_B and the anti-equivalence τ ↦ Hom_G(τ, J_B) with compact Ẽ_B-modules.
- CDN23, §1.3.3, pp. 18–19; Remarques 1.11 and 1.13: Defines blocks of Rep_{𝔽̄_p}G and of Rep^{ℓf}G, P_B, E_B, Z_B and the Gabriel equivalence m_B(Π) = Hom_G(P_B, Π^∨), with blocks over k_L in bijection with Galois orbits of blocks over 𝔽̄_p and with central character δ.

*Needs:* `R30.2/smooth-torsion-categories`, `R30.2/pontryagin-dual-category`, `R30.2/modp-irreducibles`, `tauceti:TauCeti.IsInjectiveEnvelope`, `tauceti:TauCeti.IsProjectiveCover`.

### Paškūnas's classification of blocks and the bijection B ↔ ρ̄_B

**Target `R30.5/blocks-classification` (theorem).** The blocks of Rep_{𝔽̄_p}G containing an absolutely irreducible representation are: (i) {π}, π supersingular; (ii) {Ind_B^G(δ₁ ⊗ δ₂ω^{−1}), Ind_B^G(δ₂ ⊗ δ₁ω^{−1})} with δ₂δ₁^{−1} ∉ {1, ω^{±1}}; (iii) for p > 2, {Ind_B^G(δ ⊗ δω^{−1})}; (iv) for p = 2, {1, Sp} ⊗ δ∘det; (v) for p ≥ 5, {1, Sp, Ind_B^G(ω ⊗ ω^{−1})} ⊗ δ∘det; (vi) for p = 3, {1, Sp, ω∘det, Sp ⊗ ω∘det} ⊗ δ∘det (δ, δ₁, δ₂ smooth characters, ω(x) = x|x| mod ϖ). There is a bijection B ↦ ρ̄_B between blocks over 𝔽̄_p and semisimple two-dimensional 𝔽̄_p-representations of G_{ℚ_p}, sending B to the semisimple representation whose irreducible constituents are the V(π), π ∈ B (up to the twist normalising V): ρ̄_B irreducible for (i), δ₁ ⊕ δ₂ for (ii), δ ⊕ δ for (iii), δ ⊕ δω for (iv)–(vi); in all cases (det ρ̄_B)ε^{−1} is the central character of B. Over k_L blocks correspond to Gal(𝔽̄_p/k_L)-orbits, and with central character δ to ρ̄ with det = δε.

**Hypotheses.**
- F = ℚ_p; the exceptional cases at p = 2, 3 as listed.

*Proof sketch.* Ext¹ computations between irreducibles (Breuil–Paškūnas, Colmez §VII, Emerton, completed by Paškūnas), with the criterion of Paškūnas's Theorem 1.1 (Blocks): Ext¹_G(π₂, π₁) ≠ 0 forces π₁, π₂ to be constituents of the reduction of one unitary principal series or Π(V). The decomposition of π{δ₁, δ₂} (Blocks, Proposition 3.11 and the case list on p. 11), including p = 2: π{δ, δ} ≅ (Sp^{⊕2} ⊕ 1^{⊕2}) ⊗ δ∘det, and p = 3: (1 ⊕ Sp ⊕ ω∘det ⊕ Sp ⊗ ω∘det) ⊗ δ∘det. The bijection with ρ̄_B from R30.3/montreal-on-irreducibles and Breuil's semisimple correspondence (CDN 2023 Remarque 1.15).

**Acceptance.**
- For p ≥ 5 the block of the trivial character is {1, Sp, Ind_B^G(ω ⊗ ω^{−1})} and ρ̄_B = 1 ⊕ ω.
- For p = 2 the block of the trivial character is {1, Sp} (Ind_B^G(ω ⊗ ω^{−1}) = Ind_B^G(1) is reducible with these constituents).

**Sources.**
- PASKUNAS-BLOCKS14, Theorem 1.1, p. 1; Corollary 1.2, p. 2; Proposition 3.11 and the decomposition list, pp. 8–11: Lists the blocks containing an absolutely irreducible representation, cases (i)–(vi) including p = 2 and p = 3, and decomposes π{δ₁, δ₂}.
- CDN23, Proposition 1.10, p. 18; Remarques 1.11, 1.13 and 1.15, pp. 18–19: Restates Paškūnas's list with the p = 2 and p = 3 degenerations, the Galois-orbit description over k_L, the central character condition, and the bijection B ↔ ρ̄_B with (det ρ̄_B)ε^{−1} equal to the central character.
- PASKUNAS13, §1.1, pp. 4–5: Lists blocks (i)–(iv) for p ≥ 5 and associates ρ̄ to each block through Breuil's semisimple mod p correspondence.

*Needs:* `R30.5/blocks`, `R30.3/montreal-on-irreducibles`, `R30.2/modp-principal-series`, `R30.2/modp-irreducibles`.

### Projective envelopes P̃ and Paškūnas's axiomatic framework

**Target `R30.5/projective-envelope` (construction).** Let π be an irreducible object of Mod^{l.fin}_{G,ζ}(O) with End_G(π) = k, S = π^∨, and P̃ ↠ S a projective envelope in C(O) (R30.2/pontryagin-dual-category); Ẽ := End_{C(O)}(P̃) is a local, pseudo-compact (hence compact, k being finite) ring with residue field k. Suppose Q ∈ C(k) of finite length satisfies (H1) Hom_{C(k)}(Q, S') = 0 for irreducible S' ≇ S; (H2) S occurs in Q with multiplicity 1; (H3) Ext¹_{C(k)}(Q, S') = 0 for S' ≇ S; (H4) Ext¹_{C(k)}(Q, S) finite-dimensional; (H5) Ext²_{C(k)}(Q, rad Q) = 0; (H0) Hom_{C(k)}(P̃[ϖ], rad Q) = 0. Then the natural topology on Ẽ is the 𝔪-adic one, P̃ is flat over Ẽ and k ⊗̂_{Ẽ} P̃ ≅ Q; the functor M ↦ Hom_{C(O)}(P̃, M) relates C(O) to compact Ẽ-modules, and V̌(P̃) carries a natural action of Ẽ (R30.3/montreal-functor). For a block, P_B = ⊕_{π∈B} P̃_π.

**Hypotheses.**
- π irreducible with End = k (after enlarging k); hypotheses (H0)–(H5) for the flatness statements.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Blocks`, namespace `TauCeti.ProjEnvelope`.

**Uses.**
- Paškūnas 2013, Theorem 1.6: Ẽ_B ≅ R^{ζε}_ρ for supersingular B.
- Paškūnas 2015, §2: M(Θ) = (Hom^{cont}_{O[[K]]}(P̃, Θ^d))^d gives the Breuil–Mézard modules.
- Nakamura 2023, Theorem B.24 and Proposition B.26: End(P̃^ψ) ≅ R^{ψε}_{ρ̄(ε)} and P̃ ≅ π\*_{π̄}.

**API.**
- `ProjEnvelope.P` (constructor): P̃ ↠ π^∨, a projective envelope in C_{G,ζ}(O).
- `ProjEnvelope.endRing` (constructor): Ẽ = End_{C(O)}(P̃), local compact with residue field k.
- `ProjEnvelope.isProjectiveCover` (compatibility): P̃ → π^∨ is a projective cover in the sense of Tau Ceti's IsProjectiveCover, transported to C(O).
- `ProjEnvelope.flat` (characterisation): Under (H0)–(H5), P̃ is flat over Ẽ and k ⊗̂_Ẽ P̃ ≅ Q.
- `ProjEnvelope.topology` (characterisation): Under (H0)–(H5), the natural topology of Ẽ is 𝔪-adic.
- `ProjEnvelope.Vcheck_action` (functoriality): Ẽ acts on V̌(P̃) and V̌ is compatible with ⊗̂_Ẽ.

*Proof sketch.* Existence of projective envelopes: duals of injective envelopes (R30.2/pontryagin-dual-category). Locality and pseudo-compactness of Ẽ: Paškūnas 2013 §2. Under (H0)–(H5): Proposition 3.8 and its corollaries (Proposition 1.12 in the introduction) prove the coincidence of topologies, flatness and k ⊗̂ P̃ ≅ Q.

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

*Needs:* `R30.2/pontryagin-dual-category`, `R30.5/blocks`, `R30.3/montreal-functor`, `tauceti:TauCeti.IsProjectiveCover`.

### The pseudodeformation ring R^{ps,δ}_B of a block

**Target `R30.5/block-pseudodeformation-ring` (construction).** For a block B with semisimple ρ̄_B (R30.5/blocks-classification) and a continuous character δ lifting the central character, R^{ps,δ}_B := R^{ps,δε}_{tr ρ̄_B} is the complete local noetherian O-algebra pro-representing deformations of the two-dimensional pseudocharacter tr ρ̄_B of G_{ℚ_p} with determinant δε, with universal pseudocharacter T^δ_B : G_{ℚ_p} → R^{ps,δ}_B. It is the universal pseudocharacter ring of IntegralHeckeAndGaloisDeterminants IHG.1 for GL₂, completed at tr ρ̄_B and cut out by the determinant condition; for p = 2 Chenevier's determinants replace pseudocharacters (IHG.0). R^{ps,δ}_B[[G_{ℚ_p}]]/J denotes the largest Cayley–Hamilton quotient.

**Hypotheses.**
- G_{ℚ_p} satisfies Mazur's finiteness condition Φ_p; for p = 2 use determinants (IHG.0/determinant-trace-bijective-small does not apply).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Blocks`, namespace `TauCeti.BlockPsRing`.

**Uses.**
- LocalGaloisDeformationRings R08.3/weil-deligne-type-ring: R_{B,M} is a quotient of R^{ps,δ_M}_B[1/p].
- CDN 2023, Théorème 1.16: ι^δ_B : R^{ps,δ}_B → Z^δ_B.
- LocallyAnalyticCompletedCohomology LA.5: the finite map R^{ps} → Z_B and the functor m.

**API.**
- `BlockPsRing.ring` (constructor): R^{ps,δ}_B, complete local noetherian with residue field k.
- `BlockPsRing.universal` (data): T^δ_B : G_{ℚ_p} → R^{ps,δ}_B, a two-dimensional pseudocharacter with determinant δε.
- `BlockPsRing.universal_property` (universal-property): O-algebra maps R^{ps,δ}_B → A (A artinian local) ↔ pseudocharacters lifting tr ρ̄_B with determinant δε.
- `BlockPsRing.of_irreducible` (compatibility): If ρ̄_B is absolutely irreducible, R^{ps,δ}_B ≅ R^{δε}_{ρ̄_B} (deformations with fixed determinant).
- `BlockPsRing.cayleyHamilton` (constructor): R^{ps,δ}_B[[G_{ℚ_p}]]/J, the Cayley–Hamilton quotient.

*Proof sketch.* Universal pseudocharacter rings: IHG.1/universal-reductive-pseudocharacter-ring for H = GL₂, completed at the residual pseudocharacter (noetherian by Chenevier, since G_{ℚ_p} satisfies Φ_p). The determinant condition: impose det = δε via the determinant of the pseudocharacter (a quotient by a closed ideal). For p > 2, pseudocharacters and determinants agree (IHG.0/determinant-trace-bijective-small with d = 2 and 2 invertible).

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

*Needs:* `R30.5/blocks-classification`, `IntegralHeckeAndGaloisDeterminants:IHG.1/universal-reductive-pseudocharacter-ring`, `IntegralHeckeAndGaloisDeterminants:IHG.0/pseudocharacter`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-trace-bijective-small`, `GlobalGaloisDeformations:R04.2/universal-lifting-ring`.

### Paškūnas: endomorphism rings of projective envelopes are deformation rings

**Target `R30.5/paskunas-endomorphism-rings` (theorem).** Assume p ≥ 5 (and for (iii) p = 2 with B of type (i) or (ii)). (i) For every block B, the centre of Ẽ_B, hence of Mod^{l.fin}_{G,ζ}(O)_B, is naturally isomorphic to R^{ps,ζε}_{tr ρ̄_B}; Ẽ_B is finitely generated over its centre and is a matrix algebra over it after localising away from the reducible locus. (ii) If B = {π} with π supersingular, V(J_B)^∨(ζε) ≅ ρ^{un} and Ẽ_B ≅ R^{ζε}_ρ, ρ = V(π); if B is of type (ii), V(J_B)^∨(ζε) ≅ ρ₁^{un} ⊕ ρ₂^{un} and Ẽ_B ≅ End_{G_{ℚ_p}}(ρ₁^{un} ⊕ ρ₂^{un}), ρ₁, ρ₂ the non-split extensions. (iii) (p = 2, Paškūnas 2016) for B of types (i), (ii) the centre of Mod^{l.adm}_{G,ψ}(O)[B] is R^{ps,ψ} and, for B = {π}, E_B is the fixed-determinant deformation ring of ρ̄^{ss}. (iv) Ban^{adm}_{G,ζ}(L) = ⊕_B Ban^{adm}_{G,ζ}(L)_B; for B containing an absolutely irreducible object, Ban^{adm.fl}_{G,ζ}(L)_B ≅ ⊕_{𝔫 ∈ MaxSpec R^{ps}[1/p]} Ban^{adm.fl}_{G,ζ}(L)_{B,𝔫}, the 𝔫-part anti-equivalent to finite length modules over the 𝔫-adic completion of Ẽ_B[1/p]; when T_𝔫 is the trace of an absolutely irreducible V this is finite length modules over the completion of R^{ps}[1/p], with the unique irreducible Π_𝔫 the non-ordinary Π with V(Π_𝔫) ≅ V; when T_𝔫 = ψ₁ + ψ₂, the irreducibles are subquotients of the two unitary principal series. (v) For Π absolutely irreducible non-ordinary with V = V(Π), Ban^{adm.fl}_{G,ζ}(L)_Π is a direct summand equivalent to finite length R^{ζε}_V-modules via B ↦ Hom(V^u, V̌(B)).

**Hypotheses.**
- p ≥ 5 for (i), (ii), (iv), (v) (Paškūnas 2013); p = 2 and blocks (i), (ii) for (iii) (Paškūnas 2016); the remaining primes and blocks are covered by R30.5/local-r-equals-t.

*Proof sketch.* Verify (H0)–(H5) for Q built from π (R30.5/projective-envelope) by Ext computations in the block (Paškūnas 2013 §§6–10), giving Ẽ local with 𝔪-adic topology. V̌ gives Ẽ → R^{ζε}_ρ (or End of the universal deformations) for the generic blocks; it is an isomorphism by comparing graded rings (§§6, 8). Non-generic blocks: Cayley–Hamilton quotients and the centre (§§9–10). Banach representations: §§4, 11 and Proposition 1.8, Corollary 1.9, Theorems 1.10–1.11 by the Chinese remainder theorem over MaxSpec R^{ps}[1/p].

**Acceptance.**
- For B = {π} supersingular and p ≥ 5, Ẽ_B ≅ R^{ζε}_ρ is commutative.
- For generic reducible B, Ẽ_B is not commutative but its centre is R^{ps}.

**Sources.**
- PASKUNAS13, Theorems 1.4–1.7, Proposition 1.8, Corollary 1.9, Theorems 1.10–1.11, pp. 4–6: For p ≥ 5: blocks and their Banach parts are direct summands; the centre of Ẽ_B is R^{ps,ζε}_{tr ρ̄}; Ẽ_B ≅ R^{ζε}_ρ for supersingular blocks and End(ρ₁^{un} ⊕ ρ₂^{un}) for generic reducible blocks; the 𝔫-adic decomposition of finite length Banach representations.
- PASKUNAS16, Theorems 1.2–1.3 and Corollary 1.4, p. 3: For p = 2 and blocks of types (i), (ii): E_B is the fixed-determinant deformation ring of ρ̄^{ss} for supersingular blocks, the centre is R^{ps,ψ}, and V̌ gives the bijection with Galois representations.

*Needs:* `R30.5/projective-envelope`, `R30.5/block-pseudodeformation-ring`, `R30.5/blocks-classification`, `R30.3/montreal-functor`, `R30.2/admissible-unitary-banach`, `LocalGaloisDeformationRings:R08.1/local-forget-framing`, `LocalGaloisDeformationRings:R08.1/local-fixed-determinant`.

### The local R = T theorem for every block (Paškūnas–Tung)

**Target `R30.5/local-r-equals-t` (theorem).** For every p and every block B with central character ζ (over k after enlarging it): (i) there is an O-algebra map υ : R^{ps,ζε}_{tr ρ̄_B} → Z_B such that for all τ ∈ Mod^{l.fin}_{G,ζ}(O)_B and g ∈ G_{ℚ_p}, V̌(c_τ(υ(T(g)))) = ρ_{V̌(τ^∨)}(g) + ρ_{V̌(τ^∨)}(g^{−1})ζε(g) in End^{cont}_{G_{ℚ_p}}(V̌(τ^∨)); equivalently (CDN) the unique ι^δ_B : R^{ps,δ}_B → Z^δ_B with ι^δ_B(T^δ_B(g)) = g + δε(g)g^{−1} in End(V(π)) for all π ∈ B. (ii) Z_B and E_B are finitely generated R^{ps}-modules; Z_B is noetherian, complete local with residue field k, O-torsion free with Z_B[1/p] normal. (iii) υ[1/p] : R^{ps}[1/p] ≅ Z_B[1/p]; if p ≥ 5, ι^δ_B is an isomorphism; if p = 3, Z_B = R^{ps}/(O-torsion); if p = 2, the cokernel of R^{ps}/(O-torsion) → Z_B is killed by 2. (iv) The essential image of Mod^{l.fin}_{G,ζ}(O)_B under V̌ is anti-equivalent to pseudo-compact (R^{ps}[[G_{ℚ_p}]]/J)_{tf}-modules.

**Hypotheses.**
- All p; B any block (after a finite extension of k).

*Proof sketch.* Construct υ (the main point of Paškūnas–Tung, by a new argument covering the exceptional blocks) using V̌ of P_B and Cayley–Hamilton algebras. Finiteness (Theorem 1.3) by bounding E_B over R^{ps}, using Chenevier's noetherianity of R^{ps}. Isomorphism after inverting p and the p = 2, 3 defects (Theorem 1.4); Corollary 1.5 for the properties of Z_B. CDN 2023 Théorème 1.16 restates (i)–(iii) with the explicit identity ι^δ_B(T^δ_B(g)) = g + δε(g)g^{−1}.

**Acceptance.**
- For B = {π} supersingular and p ≥ 5, ι^δ_B is the isomorphism R^{ζε}_ρ ≅ Ẽ_B of R30.5/paskunas-endomorphism-rings.
- At p = 2 the map R^{ps} → Z_B need not be surjective; its cokernel is 2-torsion.

**Sources.**
- PASKUNAS-TUNG21, Theorems 1.1–1.4 and Corollary 1.5, pp. 2–4: Constructs υ : R^{ps,ζε}_{tr ρ̄} → Z_B compatible with V̌, proves Z_B and E_B finite over R^{ps}, R^{ps}[1/p] ≅ Z_B[1/p], Z_B = R^{ps}_{tf} for p ≠ 2 with a 2-torsion cokernel for p = 2, and describes the essential image of V̌.
- CDN23, Théorème 0.17, p. 11; Théorème 1.16, p. 20: The unique ι^δ_B : R^{ps,δ}_B → Z^δ_B with ι^δ_B(T^δ_B(g)) = g + δε(g)g^{−1} in End(V(π)): an isomorphism for p ≥ 5, after inverting p in general, with the p = 3 and p = 2 statements.

*Needs:* `R30.5/block-pseudodeformation-ring`, `R30.5/blocks`, `R30.5/projective-envelope`, `R30.5/paskunas-endomorphism-rings`, `R30.3/montreal-functor`.

### Kisin: deformations of π̄ and of ρ̄ coincide

**Target `R30.5/kisin-deformation-comparison` (theorem).** Let ρ̄ : G_{ℚ_p} → GL₂(𝔽) satisfy ρ̄ ≇ χ ⊗ (1 \*; 0 ε) for every character χ. (i) (Colmez) There is a finite length object π̄ of Mod^{adm}_G(𝔽), unique up to isomorphism, with MF(π̄) ≅ ρ̄, central character det(ρ̄)ε, and no finite-dimensional subquotient. (ii) (Kisin) If moreover p ≥ 3 and End_{𝔽[G_{ℚ_p}]}(ρ̄) = 𝔽, the deformation functors Def(π̄) (orthonormalizable admissible deformations to complete local O-algebras) and Def(ρ̄) are representable and MF : Def(π̄) → Def(ρ̄) is an isomorphism; on a deformation π the centre acts through det(MF(π))ε; the same holds with fixed central character ψ and fixed determinant ψε^{−1}. (iii) (Emerton) Under (i) only, MF induces a fully faithful embedding Def\*(π̄) ↪ Def(ρ̄), an equivalence on the crystabelline loci Def^{crys}.

**Hypotheses.**
- ρ̄ not a twist of a non-split extension of ε by 1 in the stated direction; (ii) needs p ≥ 3 and End(ρ̄) = 𝔽.

*Proof sketch.* (i): Colmez's construction of atoms and Emerton's Theorem 3.3.2. (ii): injectivity on tangent spaces Ext¹(π̄, π̄) → Ext¹(ρ̄, ρ̄) (R30.3/ext1-injectivity) gives a closed immersion of deformation spaces; the image contains the Zariski-dense trianguline (crystabelline) points (R30.1/trianguline-representation), hence equality. (iii): Emerton Theorem 3.3.13.

**Acceptance.**
- For ρ̄ absolutely irreducible, π̄ is the supersingular π with V(π) ≅ ρ̄(ε) normalisations as in R30.3/montreal-functor, and Def(π̄) ≅ Def(ρ̄).

**Sources.**
- EMERTON-LG, Assumption 3.3.1 and Theorem 3.3.2, p. 24; Definitions 3.3.6–3.3.11 and Theorem 3.3.13, pp. 25–26: For ρ̄ not of the form χ ⊗ (1 \*; 0 ε) there is a unique finite length π̄ with MF(π̄) ≅ ρ̄, central character det(ρ̄)ε and no finite-dimensional subobject or quotient; MF gives a fully faithful Def\*(π̄) ↪ Def(ρ̄), an equivalence on crystabelline loci.
- NAKAMURA23, Theorem B.18, Definition B.19, Theorem B.20, Remark B.21, Definition B.22, pp. 98–99 (arXiv): Restates Colmez's π̄ and Kisin's theorem that MF : Def(π̄) → Def(ρ̄) is an isomorphism for p ≥ 3 and End(ρ̄) = 𝔽, with the centre acting by det(MF(π))ε, and the fixed-determinant variants.

*Needs:* `R30.3/ext1-injectivity`, `R30.3/montreal-functor`, `R30.3/montreal-on-irreducibles`, `R30.1/trianguline-representation`, `LocalGaloisDeformationRings:R08.1/local-forget-framing`.

### P̃ is the dual of the universal deformation of π̄

**Target `R30.5/dual-of-universal-deformation` (theorem).** Assume p ≥ 5, End(ρ̄) = 𝔽, ρ̄ ≇ χ ⊗ (ε \*; 0 1) and ρ̄ ≇ χ ⊗ (1 \*; 0 ε). Let π̄ be as in R30.5/kisin-deformation-comparison, π_{π̄} its universal deformation over R_ρ̄ (and π^ψ_{π̄} with central character ψ over R^{ψε^{−1}}_ρ̄), and P̃^ψ, P̃ the projective envelopes of the dual of the socle in C^ψ(O), C(O). (i) For A ∈ Comp(O) and a deformation π with central character ψ, the A-dual π\* lies in C^ψ(O) and V̌(π\*) ≅ MF(π)(ε). (ii) (Paškūnas) V̌ induces End_{C^ψ(O)}(P̃^ψ) ≅ R^{ψε}_{ρ̄(ε)}, P̃^ψ is flat over it and V̌(P̃^ψ) is the universal deformation. (iii) There are G-equivariant topological isomorphisms P̃^ψ ≅ (π^ψ_{π̄})\*, R^{ψε^{−1}}_ρ̄-linear, and P̃ ≅ π\*_{π̄}, R_ρ̄-linear; with R_ρ̄ ≅ R^{ψε^{−1}}_ρ̄ ⊗̂ Λ and P̃ ≅ P̃^ψ ⊗̂ (1^{univ}∘det^{−1}), R_ρ̄ ≅ End_{C(O)}(P̃).

**Hypotheses.**
- p ≥ 5; End(ρ̄) = 𝔽; ρ̄ not a twist of (ε \*; 0 1) nor of (1 \*; 0 ε).

*Proof sketch.* (i): Lemma B.23, from the definition of V̌ and Pontryagin duality. (ii): Theorem B.24, quoting Paškūnas 2013 (R30.5/paskunas-endomorphism-rings). (iii): Lemma B.25 and Proposition B.26: compare the universal properties of P̃^ψ (projectivity, Hom(P̃^ψ, −) on the dual category) and of π^ψ_{π̄} through Kisin's isomorphism Def(π̄) ≅ Def(ρ̄); twist away the central character with the universal character of the centre (CEGGPS Theorem 6.18 as quoted).

**Acceptance.**
- The reduction of P̃ modulo 𝔪_{R_ρ̄} is π̄^∨.

**Sources.**
- NAKAMURA23, Lemma B.23, Theorem B.24, Lemma B.25, Proposition B.26, pp. 100–103 (arXiv): The dual of a deformation lies in C^ψ(O) with V̌(π\*) ≅ MF(π)(ε); End(P̃^ψ) ≅ R^{ψε}_{ρ̄(ε)} under p ≥ 5, End(ρ̄) = 𝔽 and ρ̄ ≇ χ ⊗ (ε \*; 0 1); P̃^ψ ≅ (π^ψ_{π̄})\* and P̃ ≅ π\*_{π̄} as G-equivariant topological isomorphisms.

*Needs:* `R30.5/kisin-deformation-comparison`, `R30.5/paskunas-endomorphism-rings`, `R30.5/projective-envelope`.

### Removing P̃ from Hom

**Target `R30.5/removing-projective-envelope` (theorem).** Under the hypotheses of R30.5/dual-of-universal-deformation, for every compact R_ρ̄-module M the map M → Hom_{C(O)}(P̃, P̃ ⊗̂_{R_ρ̄} M), m ↦ (v ↦ v ⊗̂ m), is a topological R_ρ̄-linear isomorphism; consequently, for compact R_ρ̄-modules M₁, M₂, f ↦ id_{P̃} ⊗ f is an R_ρ̄-linear isomorphism Hom^{cont}_{R_ρ̄}(M₁, M₂) ≅ Hom^{cont}_{R_ρ̄[G]}(P̃ ⊗̂ M₁, P̃ ⊗̂ M₂).

**Hypotheses.**
- As in R30.5/dual-of-universal-deformation.

*Proof sketch.* P̃ is projective in C(O) and flat over R_ρ̄ = End(P̃) (R30.5/dual-of-universal-deformation, R30.5/projective-envelope); Hom(P̃, P̃ ⊗̂ M) commutes with inverse limits of finite length M and equals End(P̃) ⊗̂ M = M (Lemma B.27). Corollary B.28 follows by applying Lemma B.27 to M₂ and composing.

**Acceptance.**
- For M = R_ρ̄ this recovers End(P̃) = R_ρ̄.

**Sources.**
- NAKAMURA23, Lemma B.27 and Corollary B.28, p. 104 (arXiv): For compact R_ρ̄-modules M the map M → Hom_{C(O)}(P̃, P̃ ⊗̂ M) is a topological isomorphism, and f ↦ id ⊗ f identifies Hom_{R_ρ̄} with Hom_{R_ρ̄[G]} of the completed tensor products.

*Needs:* `R30.5/dual-of-universal-deformation`, `R30.5/projective-envelope`.

### The Breuil–Mézard cycle identity for ρ̄

**Target `R30.5/breuil-mezard-cycles` (definition).** Let ρ̄ : G_{ℚ_p} → GL₂(k), R^□ = R^□_ρ̄ its framed deformation ring (LocalGaloisDeformationRings R08.1) and R^{□,ψ} the fixed-determinant quotient (det = ψε). For a p-adic Hodge type (w, τ, ψ), w = (a, b) with b > a and ψ|_{I} = ε^{a+b}det τ (Paškūnas's normalisation; Kisin and Tung use det = ψε with ψ|_I = ε^{k−2}det τ), let R^{□,ψ}(w, τ) and R^{□,ψ,cr}(w, τ) be Kisin's reduced O-flat potentially semistable (resp. crystalline) quotients (LocalGaloisDeformationRings R08.3/pst-deformation-ring), of relative dimension 4 when nonzero (2 for the unframed version when End ρ̄ = k). For a noetherian R and d, Z_d(R) is the free abelian group on primes 𝔭 with dim R/𝔭 = d and z_d(M) = Σ ℓ_{R_𝔭}(M_𝔭)[𝔭] (DeformationAndDerivedPatchingAlgebra R03.6/cycle-specialization-multiplicity). ρ̄ satisfies the Breuil–Mézard cycle identity if there are cycles C_σ(ρ̄) ∈ Z_4(R^{□,ψ}/ϖ) (resp. z(σ, ρ̄) ∈ Z_1(R^ψ_ρ̄/ϖ) unframed), one for each irreducible smooth k-representation σ of K, independent of (w, τ), with z_4(R^{□,ψ}(w, τ)/ϖ) = Σ_σ m_σ(w, τ)C_σ(ρ̄) and z_4(R^{□,ψ,cr}(w, τ)/ϖ) = Σ_σ m^cr_σ(w, τ)C_σ(ρ̄), the multiplicities m_σ, m^cr_σ being those of R30.4/henniart-types. The numerical version replaces cycles by Hilbert–Samuel multiplicities e(R^{□,ψ}(w, τ)/ϖ) = Σ_σ m_σ(w, τ)μ_σ(ρ̄).

**Hypotheses.**
- ρ̄ continuous; L large enough; framed or (when End ρ̄ = k) unframed rings, with the determinant normalisation of the source fixed explicitly.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/BreuilMezard`, namespace `TauCeti.BMCycles`.

**Uses.**
- Paškūnas 2015, Theorem 1.1: the cycle identity for p ≥ 5 and End ρ̄ = k.
- Tung 2021, Theorem 1.2: the cycle identity for every ρ̄ when p > 2.
- GL2ModularityLifting R32.2: patching multiplicities are compared with Σ m_σ μ_σ.

**API.**
- `BMCycles.typeRing` (constructor): R^{□,ψ}(w, τ) and R^{□,ψ,cr}(w, τ) as quotients of R^{□,ψ}_ρ̄ (imported).
- `BMCycles.cycle` (constructor): z_d(M) ∈ Z_d(R) for a finite R-module M of dimension ≤ d.
- `BMCycles.Holds` (characterisation): BMCycles.Holds ρ̄ :⇔ there are C_σ(ρ̄) with z_4(R^{□,ψ}(w,τ)/ϖ) = Σ m_σ(w,τ)C_σ and the crystalline analogue for all (w, τ).
- `BMCycles.numerical_of_cycle` (relation): The cycle identity implies e(R^{□,ψ}(w,τ)/ϖ) = Σ m_σ(w,τ)e(C_σ).
- `BMCycles.normalisation_dictionary` (compatibility): Paškūnas's (w, τ, ψ) with w = (a, b), b > a, and det = ψ corresponds to Tung's (λ, τ, ψ') with det = ψ'ε via ψ = ψ'ε and λ = (b, a): the same Hodge–Tate weights listed in decreasing order, and the same K-type Sym^{b−a−1} ⊗ det^a ⊗ σ(τ).
- `BMCycles.cycle_nonneg` (relation): Each C_σ(ρ̄) is effective (nonnegative coefficients).

*Proof sketch.* The rings R^{□,ψ}(w, τ) exist with the stated dimensions by Kisin (LocalGaloisDeformationRings R08.3/pst-deformation-ring and pst-generic-fibre). Cycles and multiplicities: DeformationAndDerivedPatchingAlgebra R03.6 (z_d and specialization) and key/hilbert-samuel-multiplicity; the cycle identity implies the numerical one by taking multiplicities. Independence of (w, τ) is part of the definition: the C_σ depend only on ρ̄ and σ.

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
- KISIN09, §1.1, Proposition (1.1.1), pp. 4–5 of the author's preprint: Defines type (k, τ, ψ) with determinant ψχ_cyc and the reduced p-torsion-free quotients R^{□,ψ}(k, τ, ψ) with smooth 5-dimensional generic fibre components.

*Needs:* `R30.4/henniart-types`, `LocalGaloisDeformationRings:R08.1/local-lifting-ring`, `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`, `LocalGaloisDeformationRings:R08.3/pst-generic-fibre`, `DeformationAndDerivedPatchingAlgebra:R03.6/cycle-specialization-multiplicity`, `DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity`.

### Paškūnas's criterion: supports of M(Θ) and the cycle formula

**Target `R30.5/paskunas-cycle-criterion` (theorem).** Let N be a projective object in Mod^{pro}_K(O) with a compatible action of a complete local noetherian O-algebra R (R30.5/projective-envelope, e.g. N = P̃ with R = Ẽ_B or R^ψ_ρ̄), V a continuous representation of K on a finite-dimensional L-space with K-stable lattice Θ, M(Θ) := Hom^{cont}_{O[[K]]}(N, Θ^d)^d, 𝔞 its R-annihilator, d = dim R/𝔞, and for 𝔫 ∈ m-Spec R[1/p], Π(κ(𝔫)) the Banach representation attached to 𝔫. If (a) N is projective in Mod^{pro}_K(O); (b) R/𝔞 is equidimensional with all associated primes minimal; (c) there is a dense subset Σ ⊂ Supp M(Θ) ∩ m-Spec R[1/p] with dim Hom_K(V, Π(κ(𝔫))) = 1 and dim Hom_K(V, Π(R_𝔫/𝔫²)) ≤ d for 𝔫 ∈ Σ, then R/𝔞 is reduced of dimension d and z_{d−1}(R/(ϖ, 𝔞)) = Σ_σ m_σ z_{d−1}(M(σ)), m_σ the multiplicity of σ in Θ/ϖ. Applied to N = P̃ (p ≥ 5, End ρ̄ = k): for V = σ(w, τ) or σ^cr(w, τ), dim Hom_K(V, Π(κ(𝔫))) ≤ 1 with equality iff ρ^{un}_𝔫 is potentially semistable (resp. crystalline) of type (w, τ, ψ) (Proposition 4.14), so R^ψ_ρ̄/Ann M(Θ) = R^ψ_ρ̄(w, τ) (resp. the crystalline quotient) (Corollary 6.5); M^cr(k, τ) is locally free of rank one over R^cr(k, τ)[1/p] and M^st(k, τ) over the complement of the crystalline locus (Nakamura Theorem 4.7).

**Hypotheses.**
- (a)–(c) as stated; for the application p ≥ 5, End ρ̄ = k and ρ̄ ≇ (ε \*; 0 1) ⊗ η for the local freeness.

*Proof sketch.* Paškūnas 2015 Theorem 2.42: projectivity of N gives exactness of Θ ↦ M(Θ); (b)–(c) control the generic rank along Σ, giving reducedness and the cycle formula by specialisation (DeformationAndDerivedPatchingAlgebra R03.6/cycle-specialization-multiplicity). Proposition 4.14: by R30.4/kisin-hypothesis and R30.4/locally-algebraic-vectors, Hom_K(σ(w, τ), Π(V)) ≠ 0 iff V is potentially semistable of type (w, τ) (Henniart's property, R30.4/henniart-types), with multiplicity one. Corollary 6.5 and Theorem 6.6 assemble these with R30.5/paskunas-endomorphism-rings.

**Acceptance.**
- For σ irreducible with Hom_K(σ, π) ≠ 0, the Hilbert–Samuel multiplicity of M(σ) is 1 (Theorem 6.6).

**Sources.**
- PASKUNAS15, Theorem 2.42, p. 16; Proposition 4.14, p. 23; Corollary 6.5 and Theorem 6.6, p. 31: Under projectivity of N, equidimensionality and the multiplicity-one condition on a dense set, R/𝔞 is reduced of dimension d with the cycle formula; for V = σ(w, τ) the multiplicity condition holds exactly on the potentially semistable locus; hence R^ψ_ρ̄/Ann M(Θ) = R^ψ_ρ̄(w, τ) and the cycle identity with multiplicity-one M(σ).
- NAKAMURA23, §4.3, Theorem 4.7, p. 67 (arXiv): For p ≥ 5, End ρ̄_p = 𝔽 and ρ̄_p ≇ (ε \*; 0 1) ⊗ η: R_p/Ann(M^⋄_0(k, τ)) = R^⋄_p(k, τ) for ⋄ ∈ {st, cr}, with M^cr locally free of rank one over R^cr[1/p] and M^st locally free of rank one off the crystalline locus.

*Needs:* `R30.5/projective-envelope`, `R30.5/breuil-mezard-cycles`, `R30.5/paskunas-endomorphism-rings`, `R30.4/kisin-hypothesis`, `R30.4/locally-algebraic-vectors`, `R30.4/henniart-types`, `DeformationAndDerivedPatchingAlgebra:R03.6/cycle-specialization-multiplicity`.

### Kisin rings from the classical correspondence (Colmez–Dospinescu–Nizioł)

**Target `R30.5/kisin-ring-from-langlands` (construction).** Let M be an irreducible (φ, N, G_{ℚ_p})-module of rank 2, a < b integers with LL^{[a,b]}(M) := LL(M) ⊗ Sym^{b−a−1} ⊗ det^a having unitary central character, Λ a G-stable O_L-lattice in it, and B the block of finite length smooth representations determined by a semisimple ρ̄ : G_{ℚ_p} → GL₂(k_L). The B-adic completion Λ_B is the inverse limit of the finite length quotients of Λ all of whose Jordan–Hölder factors lie in B, LL^{[a,b]}_B(M) := L ⊗ Λ_B (independent of Λ), R^{[a,b]}_{M,B} := End_G(LL^{[a,b]}_B(M)) and ρ^{[a,b]}_M := V(LL^{[a,b]}_B(M)). Theorem (CDN, Théorème 0.1): R^{[a,b]}_{M,ρ̄} is commutative, the ring of bounded analytic functions on an analytic open of ℙ¹, algebraically a finite product of principal ideal domains; ρ^{[a,b]}_M is free of rank 2 over it and specialisation x ↦ ρ_x is a bijection between its L'-points and the L'-representations of G_{ℚ_p} with reduction ρ̄ and type (M, a, b) (potentially semistable with Hodge–Tate weights a, b and D_pst ≅ M). This is the GL₂(ℚ_p)-side construction of the rings R_{B,M} planned in LocalGaloisDeformationRings R08.3/weil-deligne-type-ring.

**Hypotheses.**
- M irreducible (so LL(M) supercuspidal); unitary central character; the hidden global ingredient of R30.4/locally-algebraic-vectors (v), i.e. gap G1, through the identification of M with LL(M).

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/KisinRings`, namespace `TauCeti.KisinRingLL`.

**Uses.**
- LocalGaloisDeformationRings R08.3/weil-deligne-type-ring: R_{B,M} for supercuspidal M.
- CDN 2023, Théorème 0.1: objects in the factorisation of the p-adic étale cohomology of the Drinfeld tower.
- CDN-Kisin, Propositions 5.9 and 5.11: a form of the Breuil–Mézard conjecture in the supercuspidal case.

**API.**
- `KisinRingLL.completion` (constructor): Λ_B, the B-adic completion of a G-stable lattice.
- `KisinRingLL.ring` (constructor): R^{[a,b]}_{M,B} = End_G(LL^{[a,b]}_B(M)).
- `KisinRingLL.family` (constructor): ρ^{[a,b]}_M = V(LL^{[a,b]}_B(M)).
- `KisinRingLL.ring_comm` (characterisation): R^{[a,b]}_{M,B} is commutative, a finite product of PIDs.
- `KisinRingLL.family_free` (characterisation): ρ^{[a,b]}_M is free of rank 2 over R^{[a,b]}_{M,B}.
- `KisinRingLL.points` (universal-property): L'-points of Spec R^{[a,b]}_{M,B} ↔ L'-representations with reduction ρ̄ and type (M, a, b).

*Proof sketch.* Construct Λ_B and LL^{[a,b]}_B(M) by B-adic completion (CDN-Kisin §2). Local R = T (R30.5/local-r-equals-t) shows V(LL_B) is of GL₂ type and gives the R^{ps}-action. The de Rham extension criterion (R30.4/de-rham-extensions, extended) shows R^{[a,b]}_{M,B} is smooth and a product of principal ideal domains; the identification with bounded analytic functions on an open of ℙ¹ (§§3–5). Comparison with Kisin's rings via the universal property of potentially semistable deformation rings (LocalGaloisDeformationRings R08.3).

**Checks.**
- `KisinRingLL.indep_lattice` (characterisation): LL^{[a,b]}_B(M) does not depend on the choice of Λ.
- `KisinRingLL.empty` (degenerate): If no representation of type (M, a, b) has reduction ρ̄, then R^{[a,b]}_{M,B} = 0.
- `KisinRingLL.not_local` (non-example): R^{[a,b]}_{M,B} is in general not local: it is a finite product of principal ideal domains, one factor per component.
- `KisinRingLL.compat_R08` (compatibility): R^{[a,b]}_{M,B} ≅ R_{B,M} of LocalGaloisDeformationRings R08.3/weil-deligne-type-ring after inverting p.

**Acceptance.**
- For ρ̄ generic, the result is compatible with Kisin's rings, up to the ambiguity M versus M ⊗ μ_{−1} (CDN Remarque 0.2(i)).

**Sources.**
- CDNKISIN, Introduction, pp. 1–3: the construction, Théorème 0.1 and Remarque 0.2: Defines the B-adic completion of a lattice in LL^{[a,b]}(M), the ring R^{[a,b]}_{M,ρ} = End_G(LL^{[a,b]}_B(M)) and ρ^{[a,b]}_M = V(LL^{[a,b]}_B(M)), and proves they are the universal family of representations of type (M, a, b) with reduction ρ, R being bounded analytic functions on an open of ℙ¹ and a finite product of PIDs; Remarque 0.2(v) notes the hidden global input.

*Needs:* `R30.5/local-r-equals-t`, `R30.5/blocks`, `R30.4/locally-algebraic-type`, `R30.4/de-rham-extensions`, `R30.3/montreal-functor`, `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`.

### Admittance of residual representations by types (BCDT)

**Target `R30.5/admittance` (definition).** Let ℓ be a prime and ρ̄ : G_ℓ → GL₂(𝔽̄_ℓ) continuous. For the irreducible 𝔽̄_ℓ-representations σ_{n,m} of GL₂(ℤ_ℓ), σ'_{m₁,m₂} of U₀(ℓ) and σ'_{{m₁,m₂},a}, σ'_{{m},a} of Ũ₀(ℓ) (R30.2/mod-l-compact-irreducibles), Breuil–Conrad–Diamond–Taylor define when σ admits and simply admits ρ̄, explicitly in terms of ρ̄|_{I_ℓ} through the fundamental characters ω, ω₂, the peu/très ramifié condition, and central characters (ω^{−1}det ρ̄)|_{W_ℓ}; e.g. σ_{n,m} admits ρ̄ iff ρ̄|_{I_ℓ} ≅ ω₂^{1−ℓn−m(ℓ+1)} ⊕ ω₂^{ℓ−n−m(ℓ+1)} or ρ̄|_{I_ℓ} ≅ (ω^{1−m} \*; 0 ω^{−n−m}) (peu ramifié if n = 0), and σ_{n,0} admits ρ̄ iff the Serre weight of ρ̄^∨ ⊗ ω is n + 2. An ℓ-type τ (reducible: σ_τ a representation of GL₂(ℤ_ℓ); irreducible: of U₀(ℓ); extended type τ' with irreducible restriction to I_ℓ: of Ũ₀(ℓ)) admits σ if σ is a Jordan–Hölder constituent of Λ ⊗ 𝔽̄_ℓ for an invariant lattice Λ ⊂ σ_τ, simply if with multiplicity one; τ (simply) admits ρ̄ if it admits some σ that admits ρ̄ (resp. a unique such σ, simply, which simply admits ρ̄).

**Hypotheses.**
- Weight 2 (potentially Barsotti–Tate) types as in BCDT; the definition uses ρ̄ rather than its Cartier dual because of the normalisations of CDT.

**Suggested home.** `TauCeti/RepresentationTheory/PadicLanglands/GL2Qp/Types`, namespace `TauCeti.Admits`.

**Uses.**
- BCDT, Conjecture 1.3.1: admittance predicts the nonvanishing of the potentially Barsotti–Tate deformation rings R^D.
- this roadmap R30.5/bcdt-admittance-criterion: the conjecture follows from the Breuil–Mézard cycle identity.

**API.**
- `Admits.sigma` (characterisation): σ admits ρ̄: the explicit condition on ρ̄|_{I_ℓ} for each of the families σ_{n,m}, σ'_{m₁,m₂}, σ'_{{m₁,m₂},a}, σ'_{{m},a}.
- `Admits.simply` (characterisation): σ simply admits ρ̄.
- `Admits.type` (characterisation): τ admits ρ̄ iff some constituent of the reduction of σ_τ admits ρ̄.
- `Admits.serreWeight` (compatibility): σ_{n,0} admits ρ̄ iff the Serre weight of ρ̄^∨ ⊗ ω is n + 2.
- `Admits.simply_imp` (relation): Simple admittance implies admittance.

*Proof sketch.* Spell out each case of BCDT §1.3 on the classification of R30.2/mod-l-compact-irreducibles. Relate σ_{n,0} admitting ρ̄ to Serre's weight of ρ̄^∨ ⊗ ω (BCDT's parenthetical remark).

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

*Needs:* `R30.2/mod-l-compact-irreducibles`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/cdt-inertia-multiplicity`.

### BCDT's Conjecture 1.3.1(1) from the Breuil–Mézard identity

**Target `R30.5/bcdt-admittance-criterion` (theorem).** Let p = ℓ, k ⊂ 𝔽̄_p finite, ρ̄ : G_{ℚ_p} → GL₂(k) continuous with centraliser k, τ an ℓ-type (resp. τ' an extended type with irreducible restriction to inertia) with tamely ramified determinant and non-central image. If ρ̄ satisfies the Breuil–Mézard cycle identity (R30.5/breuil-mezard-cycles) and C_σ(ρ̄) ≠ 0 exactly when σ is a Serre weight of ρ̄ in BCDT's sense (σ admits ρ̄), then τ (resp. τ') admits ρ̄ iff R^D_{V,O} ≠ 0 (resp. R^{D'}_{V,O} ≠ 0), i.e. iff ρ̄ has a potentially Barsotti–Tate lift of type τ (resp. extended type τ'). The identity holds for every ρ̄ when p > 2 (R30.6/tung-bm-p-odd) and when p = 2 (R30.6/tung-bm-p-two); Paškūnas 2015 gives C_σ(ρ̄) ≠ 0 iff Hom_K(σ, β) ≠ 0 for Colmez's atom β of ρ̄ when p ≥ 5 and End ρ̄ = k. Part (2) of the conjecture (simple admittance ⇔ acceptability) is not derived here: BCDT's 'acceptable' is a patching-theoretic condition, not a property of R^D alone.

**Hypotheses.**
- p = ℓ; the hypotheses of BCDT Conjecture 1.3.1; the identification of {σ : C_σ(ρ̄) ≠ 0} with BCDT's admitted weights (gap G3).

*Proof sketch.* For U₀(ℓ)- and Ũ₀(ℓ)-types induce σ_τ to GL₂(ℤ_ℓ): σ' admits ρ̄ iff a constituent of Ind σ' admits ρ̄ (BCDT §1.3). By the cycle identity, z(R^D/ϖ) = Σ_σ m_σ(τ)C_σ(ρ̄); since R^D is O-flat, R^D ≠ 0 iff R^D/ϖ ≠ 0 iff some σ with m_σ(τ) > 0 has C_σ(ρ̄) ≠ 0. C_σ(ρ̄) ≠ 0 iff σ admits ρ̄: for p ≥ 5, End ρ̄ = k, from Paškūnas 2015 Theorem 1.1(iii) (z(σ, ρ̄) ≠ 0 iff Hom_K(σ, β) ≠ 0) and the K-socle of β; in general this matching of BCDT's explicit list with the cycles is recorded as gap G3.

**Acceptance.**
- Weight 2, τ trivial (crystalline): admittance by σ_{0,0} ⇔ ρ̄ has a crystalline lift with Hodge–Tate weights 0, 1 (finite flat).

**Sources.**
- BCDT01, §1.3, Conjecture 1.3.1, p. 856 (published; p. 12 of the author copy): Conjectures that, for ρ̄ with centraliser k and types with tamely ramified determinant and non-central image, τ admits ρ̄ iff R^D_{V,O} ≠ 0, and simply admits iff acceptable.
- PASKUNAS15, Theorem 1.1 and the paragraph after it, pp. 2–3: z(σ, ρ̄) is nonzero iff Hom_K(σ, β) ≠ 0 for the atom β attached to ρ̄ by Colmez, and then has multiplicity one except in one non-generic case.

*Needs:* `R30.5/admittance`, `R30.5/breuil-mezard-cycles`, `R30.4/henniart-types`.

### Dependencies of R30.5

Other roadmaps: `DeformationAndDerivedPatchingAlgebra:R03.6/cycle-specialization-multiplicity`, `DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/cdt-inertia-multiplicity`, `GlobalGaloisDeformations:R04.2/universal-lifting-ring`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-trace-bijective-small`, `IntegralHeckeAndGaloisDeterminants:IHG.0/pseudocharacter`, `IntegralHeckeAndGaloisDeterminants:IHG.1/universal-reductive-pseudocharacter-ring`, `LocalGaloisDeformationRings:R08.1/local-fixed-determinant`, `LocalGaloisDeformationRings:R08.1/local-forget-framing`, `LocalGaloisDeformationRings:R08.1/local-lifting-ring`, `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`, `LocalGaloisDeformationRings:R08.3/pst-generic-fibre`. Within this roadmap the layer uses the earlier layers only.

## R30.6. The local results consumed by modern lifting

The layer states the local theorems used by the modularity lifting theorems one by one, each with its prime and residual hypotheses, rather than one unqualified p-adic local Langlands theorem: Paškūnas (p ≥ 5, End ρ̄ = k), Hu–Tan (p ≥ 5, split non-scalar), Tung (p > 2, all ρ̄, global by patching), Paškūnas and Tung at p = 2, Kisin's local inequality with the corrections of Gee–Kisin, Paškūnas–Tung finiteness, the occurrence of every member of a block in k ⊗_{R^ps} S^∨, and Breuil–Strauch. All results here are local; their occurrence in completed cohomology belongs to CompletedCohomologyAndLocalGlobalCompatibility R31 and their application to lifting to GL2ModularityLifting R32.

**Targets of the layer.** Paškūnas 2015: Breuil–Mézard for p ≥ 5 and End ρ̄ = k; Hu–Tan: Breuil–Mézard for split non-scalar ρ̄, p ≥ 5; Tung: Breuil–Mézard for every ρ̄ when p > 2; Paškūnas 2016: Breuil–Mézard at p = 2 for generic blocks; Tung: Breuil–Mézard at p = 2 for every r̄; Kisin's local multiplicity inequality through Colmez's functor; Finiteness of the mod p category of GL₂(ℚ_p) (Paškūnas–Tung); Every π in a block occurs in k ⊗_{R^{ps}} S^∨; Breuil–Strauch through the Drinfeld tower (Dospinescu–Le Bras); The local inputs to modularity lifting, case by case.

**Planets.** Paškūnas's Breuil–Mézard theorem (p ≥ 5); Tung's Breuil–Mézard theorem (p odd); Tung's Breuil–Mézard theorem (p = 2); Paškūnas–Tung finiteness.

### Paškūnas 2015: Breuil–Mézard for p ≥ 5 and End ρ̄ = k

**Target `R30.6/paskunas-bm-scalar-endomorphisms` (theorem).** Let p ≥ 5 and ρ̄ : G_{ℚ_p} → GL₂(k) with End_{G_{ℚ_p}}(ρ̄) = k (ρ̄ absolutely irreducible or a non-split extension of two distinct characters), R_ρ̄ its universal deformation ring. For every p-adic Hodge type (w, τ, ψ) in the normalisation of R30.5/breuil-mezard-cycles (det = ψ, ψ|_I = ε^{a+b}det τ): (i) there is a reduced, two-dimensional, O-torsion free quotient R^ψ_ρ̄(w, τ) (resp. R^{ψ,cr}_ρ̄(w, τ)) of R_ρ̄ whose L-points are the potentially semistable (resp. crystalline) deformations of type (w, τ, ψ); (ii) for each irreducible smooth k-representation σ of K there is a one-dimensional cycle z(σ, ρ̄) of R_ρ̄, independent of (w, τ), with z₁(R^ψ_ρ̄(w, τ)/ϖ) = Σ_σ m_σ(w, τ)z(σ, ρ̄) and z₁(R^{ψ,cr}_ρ̄(w, τ)/ϖ) = Σ_σ m^cr_σ(w, τ)z(σ, ρ̄); (iii) z(σ, ρ̄) ≠ 0 iff Hom_K(σ, β) ≠ 0, β the atom attached to ρ̄ by Colmez, and then its Hilbert–Samuel multiplicity is 1, except for ρ̄ ≅ (ω \*; 0 1) ⊗ χ with \* peu ramifié, where it is 2. The result is new only for ρ̄ ≅ (ω \*; 0 1) ⊗ χ; the other cases are Kisin's.

**Hypotheses.**
- p ≥ 5; End(ρ̄) = k. Split ρ̄ (Hu–Tan) and non-split self-extensions (χ \*; 0 χ) are not covered.

*Proof sketch.* Apply Paškūnas's criterion (R30.5/paskunas-cycle-criterion) to N = P̃ with End(P̃) = R^ψ_ρ̄ (R30.5/paskunas-endomorphism-rings, R30.5/dual-of-universal-deformation). Supports of M(Θ) for Θ ⊂ σ(w, τ): Proposition 4.14 via R30.4/kisin-hypothesis and R30.4/locally-algebraic-vectors. Cycles z(σ, ρ̄) := z₁(M(σ)), their nonvanishing and multiplicity: Theorem 6.6 and §6 (generic and non-generic cases; Theorem 6.24 for (χω \*; 0 χ)).

**Acceptance.**
- For ρ̄ absolutely irreducible, z(σ, ρ̄) ≠ 0 exactly for the Serre weights σ of ρ̄ (the K-socle of the supersingular π with V(π) ↔ ρ̄).
- For (w, τ) = ((0,1), 1) crystalline, R^{ψ,cr}_ρ̄((0,1), 1) is the finite flat deformation ring and its special fibre cycle is z(1, ρ̄).

**Sources.**
- PASKUNAS15, Theorem 1.1 and the paragraph after it, pp. 2–3: For p ≥ 5 and End ρ̄ = k: the reduced two-dimensional O-torsion free quotients R^ψ_ρ̄(w, τ), the cycle identities with z(σ, ρ̄) independent of the type, nonvanishing iff Hom_K(σ, β) ≠ 0 with multiplicity one except multiplicity two for (ω \*; 0 1) ⊗ χ peu ramifié; new only for (ω \*; 0 1) ⊗ χ, the rest being Kisin's.

*Needs:* `R30.5/paskunas-cycle-criterion`, `R30.5/breuil-mezard-cycles`, `R30.5/paskunas-endomorphism-rings`, `R30.5/dual-of-universal-deformation`, `R30.4/kisin-hypothesis`.

### Hu–Tan: Breuil–Mézard for split non-scalar ρ̄, p ≥ 5

**Target `R30.6/hu-tan-bm-split` (theorem).** Let p ≥ 5 and ρ̄ ≅ χ₁ ⊕ χ₂ with χ₁ ≠ χ₂. For every (k, τ, ψ) (Hodge–Tate weights (0, k−1), WD(ρ)|_I = τ, det ρ = ψε, ψ|_I = ε^{k−2}det τ) there are 4-dimensional cycles Z_{n,m} of the framed ring R^□(ρ̄), independent of (k, τ, ψ), with Z(R^{□,ψ}(k, τ, ρ̄)/ϖ) = Σ_{n,m} a_{n,m}(k, τ)Z_{n,m} and Z(R^{□,ψ}_cr(k, τ, ρ̄)/ϖ) = Σ a^cr_{n,m}(k, τ)Z_{n,m}, where a_{n,m}(k, τ) is the multiplicity of σ_{n,m} = Sym^n k² ⊗ det^m in the reduction of Sym^{k−2} ⊗ σ(τ); moreover Z_{n,m} = Z(R^{□,ψ}_cr(n+2, (ω̃^m)^{⊕2}, ρ̄)/ϖ). The generic case χ₁χ₂^{−1} ∉ {1, ω^{±1}} is Remark 5.7; the non-generic case ρ̄ ≅ 1 ⊕ ω (up to twist) is Theorems 5.11–5.12, with explicit cycles in terms of the three minimal primes of the versal ring over J.

**Hypotheses.**
- p ≥ 5 (standing assumption); ρ̄ split with distinct characters; scalar ρ̄ and non-split self-extensions are not covered.

*Proof sketch.* Work with versal deformation rings and pseudodeformation rings R^{ps} (R30.5/block-pseudodeformation-ring), transferring to framed rings by formal smoothness of framed over versal rings. Use Paškūnas's E_B ≅ R^{ps,ζ} and the endomorphism rings of the projective envelopes of the two principal series (R30.5/paskunas-endomorphism-rings) with the criterion R30.5/paskunas-cycle-criterion. Non-generic case: explicit versal rings (Hu–Tan §3) and Theorems 5.11–5.12.

**Acceptance.**
- For ρ̄ = 1 ⊕ ω, Z(R^{ver}(k, τ, ρ̄)/ϖ) = a_{p−3,1}𝔭₁ + a_{0,0}𝔭₂ + a_{p−1,0}(𝔭₂ + 𝔭₃).

**Sources.**
- HU-TAN15, Notation, p. 1 (p ≥ 5); Theorem 1.1 (Kisin), p. 3; Theorem 1.3, p. 4; Remark 5.7, p. 30; Theorems 5.11–5.12, pp. 32–33 (arXiv): For p ≥ 5 and ρ̄ ≅ χ₁ ⊕ χ₂ with χ₁ ≠ χ₂ there are 4-dimensional cycles Z_{n,m} independent of the type with the Breuil–Mézard identities, Z_{n,m} the crystalline special fibre cycle of type (n+2, (ω̃^m)^{⊕2}); the non-generic case 1 ⊕ ω is Theorems 5.11–5.12.

*Needs:* `R30.5/breuil-mezard-cycles`, `R30.5/paskunas-endomorphism-rings`, `R30.5/block-pseudodeformation-ring`, `R30.5/paskunas-cycle-criterion`, `LocalGaloisDeformationRings:R08.1/local-lifting-ring`.

### Tung: Breuil–Mézard for every ρ̄ when p > 2

**Target `R30.6/tung-bm-p-odd` (theorem).** Let p > 2 and r̄ : G_{ℚ_p} → GL₂(k) any continuous representation. For each smooth irreducible k-representation σ̄ of K there is a 4-dimensional cycle C_σ̄(r̄) of R^{□,ψ}_r̄, independent of (λ, τ), such that for all p-adic Hodge types (λ, τ, ψ) (λ = (a, b), a > b; det r = ψε, ψ|_I = ε^{a+b−1}det τ) Z(R^{□,ψ}_r̄(λ, τ)/ϖ) = Σ m_σ̄(λ, τ)C_σ̄(r̄) and Z(R^{□,ψ,cr}_r̄(λ, τ)/ϖ) = Σ m^cr_σ̄(λ, τ)C_σ̄(r̄). Consequently every irreducible component of R^□_r̄(σ)[1/p] meets the support of the patched module M_∞(σ) (is automorphic). New only for p = 3 and r̄ a twist of an extension of 1 by ω; the proof is global, by patching.

**Hypotheses.**
- p > 2; r̄ arbitrary. The proof uses a globalisation of r̄ over an imaginary CM field and the patched module M_∞ of Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin with local-global compatibility: these global inputs are consumed here as a cited theorem and owned by the global patching roadmaps.

*Proof sketch.* Globalise r̄ (Emerton–Gee), patch (CEGGPS) to obtain M_∞ with an arithmetic action, use local–global compatibility to identify its support on each potentially semistable ring (Tung §3). Show every component of R^□_r̄(σ)[1/p] is automorphic using the blocks at p = 3 (§2, exceptional block computations with Colmez's functor) and the faithfulness/density results of Emerton–Paškūnas (§4). Deduce the cycle identity from the automorphy of all components (Emerton–Gee, Theorem 5.5.2).

**Acceptance.**
- For p ≥ 5 this recovers Paškūnas 2015 and Hu–Tan.
- Corollary 4.6: every irreducible component of R^□_r̄(σ)[1/p] is automorphic.

**Sources.**
- TUNG21A, Abstract and introduction, pp. 1–3; Conjecture 1.1, p. 3; Theorem 1.2, p. 4; Corollary 4.6, p. 14 (arXiv v4): For p > 2 proves the cycle version of the Breuil–Mézard conjecture for every r̄, new for p = 3 and twists of extensions of 1 by ω, by showing that every component of a potentially semistable deformation ring meets the support of the patched module.
- DP22, Proof of Theorem 1.4, p. 4: Uses Tung's main theorem to remove Kisin's remaining hypothesis for p = 3, and Hu–Tan for p ≥ 5.

*Needs:* `R30.5/breuil-mezard-cycles`, `R30.5/blocks-classification`, `R30.5/local-r-equals-t`, `R30.3/montreal-functor`, `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`.

### Paškūnas 2016: Breuil–Mézard at p = 2 for generic blocks

**Target `R30.6/paskunas-bm-p-two` (theorem).** Let p = 2 and ρ̄ with ρ̄^{ss} in a block of type (i) (supersingular) or (ii) (generic reducible). For the unframed (End ρ̄ = k) case there are cycles {C_σ} ⊂ Z₁(R^ψ/ϖ), one per irreducible σ of K, with z₁(R^ψ(w, τ)/ϖ) = Σ m_σ(w, τ)C_σ and z₁(R^{ψ,cr}(w, τ)/ϖ) = Σ m^cr_σ(w, τ)C_σ for all p-adic Hodge types (w, τ) (det = ψε, ψ|_I = ε^{a+b−1}det τ), C_σ ≠ 0 iff Hom_K(σ, π) ≠ 0, then with multiplicity 1; for ρ̄ = χ₁ ⊕ χ₂ split generic, framed cycles {C_{1,σ}, C_{2,σ}} ⊂ Z₄(R^{ψ,□}/ϖ) with z₄(R^{ψ,□}(w, τ)/ϖ) = Σ m_σ(w, τ)(C_{1,σ} + C_{2,σ}) and the crystalline analogue, C_{i,σ} ≠ 0 iff σ occurs in the K-socle of the corresponding principal series. Henniart's types are not unique for p = 2; the multiplicities do not depend on the choice.

**Hypotheses.**
- p = 2; blocks of types (i) and (ii) only; the remaining case r̄ ≅ (χ \*; 0 χ) is R30.6/tung-bm-p-two.

*Proof sketch.* Local: E_B is the fixed-determinant deformation ring (R30.5/paskunas-endomorphism-rings (iii)); verify Paškūnas's criterion (R30.5/paskunas-cycle-criterion), the multiplicity condition by Proposition 2.33 using Dospinescu's argument with det V̌(Π) = ψε and dim Ext¹ = 3 (Corollaries 2.24, 2.26), and the locally algebraic completion input for p = 2 (proof of Proposition 2.33). Theorem 2.34 for the unframed ring; Theorem 2.37 for split ρ̄ via [Paškūnas 2015, Theorem 7.3, Remark 7.4].

**Acceptance.**
- For σ in the K-socle of π, C_σ is a multiplicity-one cycle.

**Sources.**
- PASKUNAS16, §2, pp. 20–21 (p-adic Hodge types and Henniart's types at p = 2); Proposition 2.33, p. 22; Theorem 2.34, p. 23; Theorem 2.37, p. 24 (arXiv v2): Defines the p-adic Hodge types with ψε ≡ det ρ̄ and ψ|_I = ε^{a+b−1}det τ, notes that Henniart's types are not unique for p = 2 while the multiplicities are, and proves the unframed and framed cycle identities with nonvanishing iff σ is in the K-socle and multiplicity one.

*Needs:* `R30.5/paskunas-endomorphism-rings`, `R30.5/paskunas-cycle-criterion`, `R30.5/breuil-mezard-cycles`, `R30.4/henniart-types`, `R30.4/de-rham-extensions`.

### Tung: Breuil–Mézard at p = 2 for every r̄

**Target `R30.6/tung-bm-p-two` (theorem).** Let p = 2. For every continuous r̄ : G_{ℚ_2} → GL₂(k) the cycle and numerical Breuil–Mézard conjectures (Tung's Conjectures 5.1.2 and 5.1.3, the cycle identity of R30.5/breuil-mezard-cycles) hold; this is new for r̄ ≅ (χ \*; 0 χ). The proof is by patching: if 2 splits completely in a totally real F, the support of M_∞(σ°) ⊗ ℚ₂ meets every irreducible component of R_∞(σ)[1/2] (Theorem 8.0.1). Globally (Theorem A): for p = 2 a two-dimensional odd ρ with distinct Hodge–Tate weights at 2, modular residual representation with non-solvable image, is modular.

**Hypotheses.**
- p = 2; the global patching inputs are cited, owned by the global roadmaps.

*Proof sketch.* Patching over totally real fields with 2 totally split (Tung §§4–7) and the globalisation lemmas (§4.3). The local 2-adic blocks and Colmez's functor at p = 2 (R30.5/blocks-classification, R30.5/local-r-equals-t) control the patched module. Theorem 8.0.1 gives automorphy of all components, hence Corollary 8.0.2.

**Acceptance.**
- For r̄ ≅ (χ \*; 0 χ), the identity holds with the framed cycles of Tung's Conjecture 5.1.3.

**Sources.**
- TUNG21B, Theorems A–C, pp. 2–3; Theorem 8.0.1 and Corollary 8.0.2, p. 38 (arXiv v3): Proves modularity of 2-adic potentially semistable representations with distinct weights and the Breuil–Mézard conjectures for every r̄ at p = 2 (new for (χ \*; 0 χ)) by showing every component of R_∞(σ)[1/2] meets the support of the patched module.
- DP22, Proof of Theorem 1.5, p. 4: Cites Paškūnas 2016 Theorem 1.1 and Tung 2021b Theorem A for the 2-adic modularity lifting input.

*Needs:* `R30.5/breuil-mezard-cycles`, `R30.5/blocks-classification`, `R30.5/local-r-equals-t`, `R30.6/paskunas-bm-p-two`.

### Kisin's local multiplicity inequality through Colmez's functor

**Target `R30.6/kisin-local-inequality` (theorem).** Let p be odd and ρ̄ : G_{ℚ_p} → GL₂(𝔽). Assume Kisin's Hypothesis (1.2.6) for the type (k, τ, ψ) (R30.4/kisin-hypothesis). Then e(R^ψ(k, τ, ψ)/π) ≤ μ_Aut(k, τ, ψ) := Σ_{n,m} a_{n,m}(k, τ) μ_{n,m}(ρ̄), where a_{n,m} are the multiplicities of σ_{n,m} in σ̄(k, τ) and μ_{n,m}(ρ̄) are Kisin's explicit non-negative integers (1.1.6), determined by the crystalline conjecture (1.1.5) in weights k ∈ [2, p+1] (one case left undefined there, see B.1 below). The inequality is proved through Colmez's functor: for ρ̄ absolutely irreducible on the pseudo-representation ring (Proposition (1.6.10)) and then for the deformation ring (Corollary (1.7.2)); for non-trivial extensions of ω₂ by ω₁ with ω₁ ≠ ωω₂, Proposition (1.6.15) and Corollary (1.7.2) (unframed ring, End ρ̄ = 𝔽); for sums of two distinct characters Proposition (1.7.8); for ρ̄ with scalar semisimplification Propositions (1.6.18) and (1.7.10); the crystalline variant e(R^{ψ,cr}/π) ≤ μ^cr_Aut is Proposition (1.7.13), with equality and formal smoothness statements for k ≤ p+1 in Corollary (1.7.14). Gee–Kisin, Appendix B, corrects: (B.1) the definition of μ_{n,m}(ρ̄) when ρ̄ ≅ (μ_λ \*; 0 μ_λ) ⊗ ω^m with n = p−2 (multiplicity 1 if \* is non-trivial; not determined by Kisin when \* is trivial); (B.2) the functor of Lemma (1.7.4) needs the condition that G_{ℚ_p} acts on L_A ⊗_A 𝔽 via ω₁.

**Hypotheses.**
- p odd; Hypothesis (1.2.6) for the type; the corrections of Gee–Kisin Appendix B (B.1–B.2) applied.

*Proof sketch.* Kisin §1.6: the closure Θ(r) of the image of c-Ind_{KZ}^G L_{k,τ} → Π_r for each deformation r of the pseudo-representation (Hypothesis (1.2.6)) gives a module V(U) over the pseudo-representation ring with rank bounded by 2 (Lemma (1.6.6)); the Hilbert–Samuel multiplicity of its specialisation is bounded by the multiplicities of σ_{n,m} computed with V on Π(r, λ, χ) (Kisin §1.5, Lemma (1.5.2)–(1.5.3)). Kisin §1.7: pass from pseudo-representations to representations (Lemma (1.7.1), Corollary (1.7.2), Propositions (1.7.8), (1.7.10), (1.7.13)). Apply Gee–Kisin's errata B.1–B.2.

**Acceptance.**
- When the local inequality is combined with the global inequality of patching, equality e = μ_Aut follows (Kisin (2.3.2)–(2.3.4)); for p ≥ 5 Paškūnas 2015 proves the local equality directly.

**Sources.**
- KISIN09, §1.1, Conjectures (1.1.3) and (1.1.5) and (1.1.6), pp. 6–7; §1.5–§1.7: Lemma (1.6.6), Propositions (1.6.10), (1.6.15), (1.6.18), Lemma (1.7.1), Corollary (1.7.2), Propositions (1.7.8), (1.7.10), (1.7.13), Corollary (1.7.14), pp. 16–35 of the author's preprint: Bounds the Hilbert–Samuel multiplicity of potentially semistable (and crystalline) deformation rings by μ_Aut using lattices from Hypothesis (1.2.6) and Colmez's functor, first on pseudo-representation rings then on deformation rings.
- GEE-KISIN14, Appendix B, items B.1–B.2, p. 38 (arXiv): Errata to Kisin's paper: the multiplicity μ_{n,m}(ρ̄) for ρ̄ ≅ (μ_λ \*; 0 μ_λ) ⊗ ω^m with n = p−2 is 1 when \* is non-trivial and not defined explicitly otherwise; Lemma (1.7.4) needs G_{ℚ_p} to act on L_A ⊗ 𝔽 via ω₁.

*Needs:* `R30.4/kisin-hypothesis`, `R30.4/henniart-types`, `R30.3/montreal-on-irreducibles`, `R30.5/block-pseudodeformation-ring`, `DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity`.

### Finiteness of the mod p category of GL₂(ℚ_p) (Paškūnas–Tung)

**Target `R30.6/paskunas-tung-finiteness` (theorem).** For every p and every block B: Z_B is noetherian and E_B is a finitely generated Z_B-module; υ makes Z_B and E_B finitely generated over R^{ps,ζε}_{tr ρ̄_B} (R30.5/local-r-equals-t). For N in C(O)_B the following are equivalent: there is a surjection P_B^{⊕n} ↠ N; m(N) is finitely generated over E_B; m(N) is finitely generated over R^{ps}; k ⊗̂_{R^{ps}} N has finite length; the cosocle of N has finite length — and they hold if N is finitely generated over O[[H]] for a compact open H. For x : R^{ps} → L' with T_x not of the form ψ + ψε, Ban^{adm.fl}_{G,ζ}(L')_{B,𝔪_x} is equivalent to finite length modules over the completion of (R^{ps}[[G_{ℚ_p}]]/J) ⊗ L' at 𝔪_x; if T_x = tr ρ with ρ absolutely irreducible, to finite length R^{ζε}_ρ-modules, and every Π' killed by 𝔪_x is a finite sum of copies of the irreducible Π with V̌(Π) ↔ ρ.

**Hypotheses.**
- All p; B any block.

*Proof sketch.* Theorem 1.3 of Paškūnas–Tung (finite generation over R^{ps}), noetherianity of R^{ps} by Chenevier, hence Theorem 1.1. Corollary 6.7: the equivalences, from exactness of m and Nakayama over R^{ps}. Corollary 6.16: Banach representations at a maximal ideal of R^{ps}[1/p], via Paškūnas 2013 Theorem 4.36 and Corollaries 6.10–6.11.

**Acceptance.**
- For Π absolutely irreducible non-ordinary, Ban^{adm.fl}_{G,ζ}(L)_Π ≅ finite length R^{ζε}_{V(Π)}-modules, for every p.

**Sources.**
- PASKUNAS-TUNG21, Theorems 1.1–1.4 and Corollary 1.5, pp. 2–4; Corollary 6.7, p. 26; Corollary 6.16, pp. 30–31: Z_B noetherian with E_B finite over it and over R^{ps}; the five equivalent finiteness conditions on N ∈ C(O)_B; the description of finite length Banach representations at maximal ideals of R^{ps}[1/p], in particular deformations of an absolutely irreducible ρ.

*Needs:* `R30.5/local-r-equals-t`, `R30.5/blocks`, `R30.5/block-pseudodeformation-ring`, `R30.2/admissible-unitary-banach`.

### Every π in a block occurs in k ⊗_{R^{ps}} S^∨

**Target `R30.6/block-occurrence` (theorem).** Let B be a block with central character ζ and S ∈ Rep^ζ_B G an admissible object with S|_K injective in Rep^ζ_K, and put M := (k ⊗_{R^{ps,ζ}_B} S^∨)^∨. Then M has finite length. If moreover there is x : R^{ps,ζ}_B → ℚ̄_p whose specialised pseudocharacter is the trace of an absolutely irreducible ρ_x with Π_x := S^∨[1/p]/ker(x) ≠ 0, then every π ∈ B is an irreducible subquotient of M. In CDN's application S is the localised space of automorphic forms on a definite quaternion algebra S_{ψ,λ,𝔪} and x exists by a supercuspidal-at-p automorphic form; that global input belongs to CompletedCohomologyAndLocalGlobalCompatibility R31.

**Hypotheses.**
- S admissible in Rep^ζ_B G with injective restriction to K; for the occurrence statement, the existence of the point x (a global input in applications).

*Proof sketch.* Finite length: S^∨ is finitely generated over O[[K]] by admissibility, so Paškūnas–Tung Corollary 6.7 gives that k ⊗̂_{R^{ps}} S^∨ has finite length (R30.6/paskunas-tung-finiteness). Occurrence: if π ∈ B does not occur in M, then Hom_G(P_π, S^∨/𝔪^j_{ps}S^∨) = 0 for all j, hence Hom_G(P_π, S^∨) = 0 since S^∨ = lim S^∨/𝔪^j S^∨, hence Hom_G(P_π, Θ^d) = 0 for every G-stable lattice Θ of Π_x. Π_x ≅ Π^{⊕d} with Π absolutely irreducible non-ordinary (Paškūnas–Tung Corollary 6.16), and by compatibility of the p-adic and mod p correspondences π occurs in the reduction of a lattice of Π: a contradiction.

**Acceptance.**
- For B = {π} supersingular the statement reduces to M ≠ 0.

**Sources.**
- CDN23, Propositions 4.7, 4.8 and 4.10 with proof, pp. 49–50: For the localised quaternionic automorphic forms S, M = (k_L ⊗_{R^{ps,ζ}_B} S^∨)^∨ has finite length by Paškūnas–Tung Corollary 6.7, and every π ∈ B occurs in it, using projective envelopes, Paškūnas–Tung Corollary 6.16 and a supercuspidal-at-p automorphic point.
- PASKUNAS-TUNG21, Corollaries 6.7 and 6.16, pp. 26–31: The finiteness criterion and the structure of Banach representations killed by 𝔪_x.

*Needs:* `R30.6/paskunas-tung-finiteness`, `R30.5/projective-envelope`, `R30.5/blocks`, `R30.3/cdp-correspondence`.

### Breuil–Strauch through the Drinfeld tower (Dospinescu–Le Bras)

**Target `R30.6/breuil-strauch` (theorem).** Let π be a supercuspidal representation of G = GL₂(ℚ_p) with trivial central character, ρ = JL(π) the corresponding representation of D^×, Σ_n the n-th Drinfeld covering of the half-plane Ω, and V(π) the set of absolutely irreducible Π ∈ Ban^{adm}(G) with Π^{lisse} ≅ π. (i) V(π) ≅ Proj(M_dR(π)) through Π ↦ Fil⁰ D_dR(V(Π)), V(Π) ranging over the absolutely irreducible two-dimensional potentially crystalline representations with Hodge–Tate weights 0, 1 and D_pst(V) ≅ M(π) (classical correspondence normalised à la Tate). (ii) For Π ∈ V(π) and n large (ρ trivial on 1 + p^nO_D) there is a topological G-isomorphism, unique up to scalar, (O(Σ_n)^ρ)\* ≅ Π^{an}/Π^{lisse}. (iii) There is a canonical (up to scalar) isomorphism of Fréchet G-modules H¹_dR(Σ_n)^ρ ≅ M\*_dR ⊗ π\* such that for each line ℒ ⊂ M_dR, the inverse image of ℒ^⊥ ⊗ π\* in Ω¹(Σ_n)^ρ is (Π^{an}_ℒ)\*, and the resulting 0 → O(Σ_n)^ρ → (Π^{an}_ℒ)\* → π\* → 0 is dual to (ii).

**Hypotheses.**
- π supercuspidal with trivial central character (extends to π ⊗ Sym^k, DLB Remarque 1.3(a)); n large.

*Proof sketch.* (i): CDP (R30.3/cdp-correspondence) with det V(Π) = χ_cyc and the Colmez–Fontaine theorem; all filtrations are weakly admissible since the Weil representation of M(π) is irreducible (R30.4/completions-of-locally-algebraic). (ii): independence of Π^{an}/Π^{lisse} from the filtration (Colmez Théorème VI.6.43, R30.4/locally-algebraic-vectors (ii)) combined with the geometry of Σ_n (DLB §§5–11). (iii): comparison with de Rham cohomology of Σ_n (DLB Théorème 1.4).

**Acceptance.**
- Π^{an}_ℒ is an extension 0 → π → Π^{an}_ℒ → Π(π, 0) → 0 with Π(π, 0) independent of ℒ.

**Sources.**
- DLB17, Définition 1.1, Théorème 1.2, Remarque 1.3, pp. 4–5; Théorème 1.4, p. 6 (arXiv): For supercuspidal π with trivial central character: V(π) ≅ Proj(M_dR(π)) via the Hodge filtration; (O(Σ_n)^ρ)\* ≅ Π^{an}/Π^{lisse} for Π ∈ V(π); the de Rham cohomology H¹_dR(Σ_n)^ρ ≅ M\*_dR ⊗ π\* with (Π^{an}_ℒ)\* the inverse image of ℒ^⊥ ⊗ π\*.

*Needs:* `R30.3/cdp-correspondence`, `R30.4/locally-algebraic-vectors`, `R30.4/completions-of-locally-algebraic`, `R30.3/analytic-vectors-of-pi`.

### The local inputs to modularity lifting, case by case

**Target `R30.6/hypothesis-table` (comparison).** The local results of this layer consumed by GL2ModularityLifting R32 and by Dieulefait–Pacetti's proof of Serre's conjecture, each with its hypotheses: (1) p ≥ 5, End ρ̄ = k: Paškūnas 2015 Theorem 1.1 (R30.6/paskunas-bm-scalar-endomorphisms), including the compatibility of classical and p-adic local Langlands (Emerton lg Theorem 1.2.1 and Paškūnas 2015 remove Kisin's condition on locally algebraic vectors); (2) p ≥ 5, ρ̄ = χ₁ ⊕ χ₂ with χ₁ ≠ χ₂: Hu–Tan Theorem 1.3 (R30.6/hu-tan-bm-split), removing the remaining hypothesis of Kisin's lifting theorem for p ≥ 5 (Hu–Tan Theorem 1.4); (3) p = 3, every r̄ (new for twists of extensions of 1 by ω): Tung 2021a Theorem 1.2 (R30.6/tung-bm-p-odd), global via patching; (4) p = 2: Paškūnas 2016 Theorem 1.1 with Theorems 2.34, 2.37 for generic blocks (R30.6/paskunas-bm-p-two) and Tung 2021b Theorem A and Corollary 8.0.2 for every r̄ (R30.6/tung-bm-p-two); Kisin's Theorem 0.1 (potentially Barsotti–Tate, k = 2) for p = 2 as cited by Dieulefait–Pacetti; (5) all odd p: Kisin's local inequality with Gee–Kisin's corrections (R30.6/kisin-local-inequality) and Kisin's Hypothesis (1.2.6) (R30.4/kisin-hypothesis). Dieulefait–Pacetti Theorem 1.4 (p odd: odd ρ with ρ̄|_{G_{ℚ(√p\*)}} absolutely irreducible, de Rham at p with weights {0, k−1}, k > 1, modular residual) uses (1)–(3) and (5); Theorem 1.5 (p = 2, non-solvable image) uses (4). The block, deformation-ring and locally algebraic inputs are local; their occurrence in global completed cohomology is CompletedCohomologyAndLocalGlobalCompatibility R31.

**Hypotheses.**
- Each row carries the hypotheses of its source; no unqualified 'p-adic local Langlands theorem' is asserted.

*Proof sketch.* Read off the case division in Dieulefait–Pacetti's proofs of Theorems 1.4 and 1.5 (p. 4) and match each cited theorem with its node in this layer. Check that every row's prime and residual hypotheses are those of the node it points to.

**Acceptance.**
- For p = 3 and r̄ = (ω \*; 0 1) ⊗ χ only row (3) applies.
- For p = 2 and r̄ = (χ \*; 0 χ) only Tung 2021b applies.

**Sources.**
- DP22, Theorems 1.4 and 1.5 with their proofs, p. 4 (arXiv v2): Theorem 1.4 (p odd) incorporates Hu–Tan Theorem 1.4 for p ≥ 5 and Tung's main theorem for p = 3 to remove Kisin's hypotheses, with Emerton and Paškūnas for the local Langlands compatibility; Theorem 1.5 (p = 2) cites Kisin's Theorem 0.1, Paškūnas 2016 Theorem 1.1 and Tung 2021b Theorem A.
- HU-TAN15, Theorem 1.4, p. 5 (arXiv): The Fontaine–Mazur type consequence that removes the remaining hypothesis of Kisin's lifting theorem for split non-scalar ρ̄ and p ≥ 5.

*Needs:* `R30.6/paskunas-bm-scalar-endomorphisms`, `R30.6/hu-tan-bm-split`, `R30.6/tung-bm-p-odd`, `R30.6/paskunas-bm-p-two`, `R30.6/tung-bm-p-two`, `R30.6/kisin-local-inequality`, `R30.4/kisin-hypothesis`.

### Dependencies of R30.6

Other roadmaps: `DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity`, `LocalGaloisDeformationRings:R08.1/local-lifting-ring`, `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`. Within this roadmap the layer uses the earlier layers only.

## Required examples and checks

- **A crystalline two-dimensional representation with distinct Hodge–Tate weights.** For V crystalline irreducible with weights 0 < k−1 and distinct Frobenius eigenvalues, Π(V) is the Berger–Breuil completion of LL(V) ⊗ Sym^{k−2} (`R30.4/berger-breuil-completion`), Π(V)^alg = LL(V) ⊗ Sym^{k−2} (`R30.4/locally-algebraic-vectors`), and V(Π(V)) ≅ V (`R30.3/colmez-correspondence`).
- **A trianguline example.** For s ∈ S_irr generic, Π(V(s))^an is the unique non-trivial extension of Ban(δ₂, δ₁) by Ban(δ₁, δ₂) (`R30.4/trianguline-analytic-vectors`); for s ∈ S^{st}_\* the special extension encodes the ℒ-invariant (`R30.4/completions-of-locally-algebraic`).
- **An exceptional mod p block.** For p = 3 the block of the trivial character is {1, Sp, ω∘det, Sp ⊗ ω∘det} and for p = 2 it is {1, Sp} (`R30.5/blocks-classification`); there R^{ps} → Z_B has O-torsion kernel effects (p = 3) and a 2-torsion cokernel (p = 2) (`R30.5/local-r-equals-t`), and the Breuil–Mézard identity is Tung's (`R30.6/tung-bm-p-odd`, `R30.6/tung-bm-p-two`).
- **Central characters.** Π(V) has central character det(V)ε^{−1} (`R30.3/pi-of-D`, API `PiOfD.centralChar`); det V(Π) = δε for Π with central character δ (`R30.3/cdp-correspondence` (iii)).
- **No GL₂(F) correspondence for F ≠ ℚ_p.** `R30.2/no-correspondence-beyond-qp` records the failures (supersingulars not finitely presented, irreducible non-admissible representations, unclassified supersingulars); every theorem here is stated for GL₂(ℚ_p).
- **Hodge–Tate weights do not determine Π.** St ⊗ |det|^{k/2} ⊗ Sym^k has ℙ¹(L) non-isomorphic completions (`R30.4/completions-of-locally-algebraic`).

## Recorded gaps

**G1. The supercuspidal case of Π(V)^alg = LL(V) ⊗ Alg(V) has only a global proof.** For V de Rham, potentially crystalline but not crystabelline (π_p(V) supercuspidal), the identification of the smooth factor of Π(V)^alg with LL(D_pst) is proved by Emerton (lg §7.4) by choosing a modular V' with the same Weil–Deligne type and weights (Colmez VI.6.42) and computing in completed cohomology of modular curves with the weight part of Serre's conjecture; CDP footnote 5 and CDN-Kisin Remarque 0.2(v) record that no purely local proof is known to them. The global inputs (completed H¹ of modular curves: CompletedCohomologyAndLocalGlobalCompatibility R31; Serre weights: ClassicalSerreModularity) lie downstream of R30.6 (R30.6 → R31.4), so citing them would create a stage cycle. This packet states the theorem with the global input named in its proof steps and leaves the dependency open: either a local proof is planned here, or the consumers that need the supercuspidal case carry the global input as an explicit hypothesis. *Needed by:* `R30.4/locally-algebraic-vectors`, `R30.4/kisin-hypothesis`, `R30.4/completions-of-locally-algebraic`, `R30.5/kisin-ring-from-langlands`, `R30.5/paskunas-cycle-criterion`.

**G2. p = 2 for the trianguline classification.** Colmez's Représentations triangulines assumes p ≠ 2 (§0.1, footnote 1). The rank-one classification R(δ) and the Ext¹ dimension count for p = 2 are expected from Kedlaya–Pottharst–Xiao (Cohomology of arithmetic families of (φ,Γ)-modules, 2014), which was not read; a source for p = 2 must be fixed before these nodes are used at p = 2. *Needed by:* `R30.1/rank-one-robba-modules`, `R30.1/trianguline-representation`, `R30.4/trianguline-analytic-vectors`.

**G3. BCDT's admittance versus nonvanishing of Breuil–Mézard cycles.** Deducing BCDT Conjecture 1.3.1(1) from the cycle identity needs: C_σ(ρ̄) ≠ 0 iff σ admits ρ̄ in BCDT's explicit sense. Paškūnas 2015 Theorem 1.1(iii) gives C_σ ≠ 0 iff Hom_K(σ, β) ≠ 0 for p ≥ 5 and End ρ̄ = k; matching the K-socle of β with BCDT's list (which is phrased for ρ̄ rather than its Cartier dual, BCDT §1.3) and covering the remaining ρ̄ and primes is not done here. *Needed by:* `R30.5/bcdt-admittance-criterion`.

**G4. Emerton's normalisation of π_p(V) and of B(V) against Colmez's LL and Π(V).** The bridge node fixes Colmez's LL(M) against R16.3 and records V(π) = MF(π)(ε). Emerton attaches χ₁ ⊕ χ₂|·|^{−1} to Ind_B^G(χ₁ ⊗ χ₂) (lg pp. 11–13), uses MF and the factor det^{b+1} (Theorem 3.3.22) or det^b (§7.4, see source issue E3); his table MF(Ind_B^G χ₁ ⊗ χ₂) = χ₁ (p. 19) and Colmez's V(B(δ₁, δ₂)) = δ₁ with B(δ₁, δ₂) = Ind_B^G(δ₂ ⊗ δ₁ω^{−1}) are not reconciled here; the induction and weight conventions of Emerton §3 must be read to write the dictionary B(V) ↔ Π(V(ε^{±1})) and π_p(V) ↔ LL(V). *Needed by:* `R30.1/classical-normalisation-bridge`, `R30.4/locally-algebraic-vectors`.

## Requests to other roadmaps

- **PhiGammaModulesAndIwasawaCohomology:PG.0.** The coefficient rings O_E = O_L-valued Laurent series with a_k → 0 as k → −∞, E = O_E[1/p], O_E⁺ = O_L[[T]], with φ(T) = (1+T)^p − 1 and σ_a(T) = (1+T)^a − 1, and the categories ΦΓ^et_tors, ΦΓ^et(O_E), ΦΓ^et(E) of étale (φ,Γ)-modules over them (Colmez 2010, Introduction §4). *Needed by:* `R30.1/fontaine-functor-convention`.
- **PhiGammaModulesAndIwasawaCohomology:PG.1.** Fontaine's equivalences Rep_tors G_{ℚ_p} ≅ ΦΓ^et_tors, Rep_{O_L}G_{ℚ_p} ≅ ΦΓ^et(O_E), Rep_L G_{ℚ_p} ≅ ΦΓ^et(E) through the covariant D(V) = (A ⊗ V)^H and V(D) = ((O_L·A) ⊗ D)^{φ=1}, exact, compatible with tensor products and with Tate duals V(Ď) = V̌ = Hom(V, L ⊗ χ) (Colmez 2010, Théorème I.3.1). *Needed by:* `R30.1/fontaine-functor-convention`, `R30.1/tate-dual`.
- **PhiGammaModulesAndIwasawaCohomology:PG.2.** Overconvergence D = E ⊗ D† for every étale D over E and the equivalence ΦΓ^et(E†) ≅ ΦΓ^et(R) (slope zero, Kedlaya), with D_rig = R ⊗ D† (Colmez 2010, Remarque 0.4(ii)–(iii)); Kedlaya's slope of R(δ) is v_p(δ(p)). *Needed by:* `R30.1/fontaine-functor-convention`, `R30.1/rank-one-robba-modules`, `R30.3/analytic-vectors-of-pi`.
- **LocallyAnalyticDistributionsPartII:ND.6.** Compact-open independence for Banach representations of a locally compact p-adic Lie group G (red-team finding RT-AREA-automorphic-1/17): a unitary K-Banach representation of G with a G-stable unit ball is admissible for one compact open subgroup iff for every compact open subgroup, so that admissibility of G(ℚ_p)-representations may be tested on a compact open; together with the existing ND.6/banach-iwasawa-duality this is the general admissible unitary Banach category that R30.2 specialises to GL₂(ℚ_p). *Needed by:* `R30.2/admissible-unitary-banach`.
- **LocallyAnalyticDistributionsPartII:ND.2.** Admissible locally analytic representations of a locally ℚ_p-analytic group G (duals of coadmissible D(H, K)-modules for a compact open H) and, for an admissible unitary Banach representation Π, the subspace Π^{an} of locally analytic vectors: admissible, dense, with Π ↦ Π^{an} exact (Schneider–Teitelbaum, Inventiones 2003, Theorem 7.1). *Needed by:* `R30.2/analytic-and-algebraic-vectors`.
- **SmoothRepresentationsOfLocalGroups:SR.0.** Imported from the Tau Ceti roadmap: the smooth category over a coefficient ring A (here A = O/ϖ^n) for G = GL₂(ℚ_p), with admissible and locally admissible objects (SR.0.4, finiteness-conditions). *Needed by:* `R30.2/smooth-torsion-categories`.
- **SmoothRepresentationsOfLocalGroups:SR.0:derived-extension.** Imported from the Tau Ceti roadmap: the smooth category is Grothendieck abelian with injective envelopes (SR.0:derived-extension.1). *Needed by:* `R30.2/smooth-torsion-categories`.
- **SmoothRepresentationsOfLocalGroups:SR.2.** Imported from the Tau Ceti roadmap: smooth and compact induction with Frobenius reciprocity (SR.2.1), used for Ind_B^G and c-Ind_{KZ}^G. *Needed by:* `R30.2/modp-principal-series`.
- **PadicMeasuresIwasawaAlgebras:L1.** Imported from the Tau Ceti roadmap: the completed group algebra O[[H]] of a profinite group H with its compact topology and the action on compact modules. *Needed by:* `R30.2/pontryagin-dual-category`, `R30.2/admissible-unitary-banach`.
- **PadicMeasuresIwasawaAlgebras:L5.** Imported from the Tau Ceti roadmap: compact inverse systems and topological Nakayama over O[[H]]. *Needed by:* `R30.2/pontryagin-dual-category`.
- **GL2AutomorphicRepresentationsAndTransfer:R16.1.** The rank-two Iwasawa and Cartan decompositions of GL₂(ℚ_p) (R16.1, 'Rank-two Iwasawa and Cartan coordinates'). *Needed by:* `R30.1/gl2qp-subgroups`.

## Mistakes found in the sources

- **PadicLocalLanglandsForGL2Qp/E1** (misprint; PASKUNAS16, Theorem 2.37, p. 24, arXiv:1509.00332v2). The theorem announces that 'we have inequalities' between the cycles z₄(R^{ψ,□}(w,τ)/ϖ) and Σ_σ m_σ(w,τ)(C_{1,σ} + C_{2,σ}), but the displayed relations are equalities. *Correction:* The statement asserts equalities of cycles z₄(R^{ψ,□}(w,τ)/ϖ) = Σ_σ m_σ(w,τ)(C_{1,σ} + C_{2,σ}) and the crystalline analogue. *Reason:* The displayed formulas are equalities, the proof deduces them from Theorem 2.34 (itself an equality of cycles) and Paškūnas 2015 Theorem 7.3, and the companion Theorem 2.34 says 'equalities'. Affects nothing; new.
- **PadicLocalLanglandsForGL2Qp/E2** (misprint; PASKUNAS16, §2.C, definition of p-adic Hodge type, p. 21, arXiv:1509.00332v2). A deformation of type (w, τ, ψ) is required to have determinant equal to ψ, while the same paragraph imposes ψε ≡ det ρ̄ mod ϖ and ψ|_{I} = ε^{a+b−1}det τ. *Correction:* The determinant should be ψε. *Reason:* With Hodge–Tate weights a, b the determinant restricted to inertia is ε^{a+b}det τ, which matches ψε and not ψ under ψ|_I = ε^{a+b−1}det τ; the paper's rings R^ψ parametrise deformations with determinant ψε (§1.1.1, p. 4) and R^{ps,ψ} pairs (t, d) with d = ψε. Affects nothing; new.
- **PadicLocalLanglandsForGL2Qp/E3** (misprint; EMERTON-LG, Theorem 3.3.22 and Remark 3.3.23, p. 28, against §7.4, pp. 96–98 (preprint lg.pdf)). Theorem 3.3.22 and Remark 3.3.23 give B(V)^{l.alg} ≅ Sym^{a−b−1}E² ⊗ det^{b+1} ⊗ π_p(V) for weights a > b, while the proof in §7.4 establishes, and repeatedly writes, Sym^{a−b−1}E² ⊗ det^b ⊗ π_p(V). *Correction:* The exponent of det in the statement and in the proof must agree; which one is right depends on the normalisation of π_p(V) (lg pp. 11–13) and of the Hodge–Tate weights, and is to be settled with gap G4. *Reason:* The same object B(V')^{l.alg} is described with det^{b+1} in the theorem and with det^b in (7.4.1)–(7.4.3) and the displays that follow, with π_p(V) unchanged. Affects nothing; new.
- **PadicLocalLanglandsForGL2Qp/E4** (misprint; CDP14, §1.1, sentence after Theorem 1.3, p. 2, arXiv:1310.2235v1). The proof of Theorem 1.3 cites Emerton's local-global compatibility as '[34], th. 3.2.22'. *Correction:* Emerton [34] (lg) has no Theorem 3.2.22; the result meant is Theorem 3.3.22 (the locally algebraic vectors of B(V)). *Reason:* Reference [34] of CDP is Emerton's lg preprint, whose numbered statements in §3.2 stop before 3.2.22 and whose Theorem 3.3.22 is the cited compatibility. Affects nothing; new.

## Structure proposals

- **rescope** (PadicLocalLanglandsForGL2Qp, LocallyAnalyticDistributionsPartII, CompletedCohomologyPartII, PadicMeasuresIwasawaAlgebras). Red-team finding RT-AREA-automorphic-1/17 asks for one general owner of admissible unitary Banach representations, with R30.2 specialising it. The fix records named PadicMeasuresIwasawaAlgebras L1 (round 1) and CompletedCohomologyPartII CC.0 (rounds 5–6); PadicMeasuresIwasawaAlgebras is now a Tau Ceti roadmap whose README has no Banach representation theory, while LocallyAnalyticDistributionsPartII ND.6/banach-iwasawa-duality (accepted) already plans Schikhof duality and Schneider–Teitelbaum Theorem 3.5 for compact p-adic Lie groups. *Proposal:* Make LocallyAnalyticDistributionsPartII ND.6 the general owner: add to it the compact-open admissibility test for locally compact G (requested here), and let CompletedCohomologyPartII CC.2/CC.5 and this roadmap's R30.2/admissible-unitary-banach import ND.6. R30.2 constructs no second category.
- **rescope** (PadicLocalLanglandsForGL2Qp, LocalGaloisDeformationRings). LocalGaloisDeformationRings (an upstream-tier roadmap) cites PadicLocalLanglandsForGL2Qp:R30.5 for R^{ps,δ}_B and for CDN's rings R_{B,M}. R^{ps,δ}_B is Galois-side (IntegralHeckeAndGaloisDeterminants IHG.1 specialised to GL₂ with fixed determinant), whereas R_{B,M} is built from the GL₂(ℚ_p) side (B-adic completion, local R = T). *Proposal:* When LocalGaloisDeformationRings is packaged, move the pseudodeformation ring of a residual 2-dimensional pseudocharacter with fixed determinant down into it (this packet's R30.5/block-pseudodeformation-ring then indexes it by blocks), and state CDN's Théorème 0.1/5.11 there as an explicit named input pointing to R30.5/kisin-ring-from-langlands, not as a citation of this higher roadmap.
- **rescope** (PadicLocalLanglandsForGL2Qp, GL2ModularityLifting). GL2ModularityLifting cites PadicLocalLanglandsForGL2Qp R30.6 seven times (upstream order file); its R22.1 packet requests the Breuil–Mézard cycle theorems, Kisin's local inequality and Kisin's Hypothesis (1.2.6). *Proposal:* Point those prerequisites at R30.6/paskunas-bm-scalar-endomorphisms, R30.6/hu-tan-bm-split, R30.6/tung-bm-p-odd, R30.6/kisin-local-inequality and R30.4/kisin-hypothesis; when GL2ModularityLifting is packaged before this roadmap, state these as explicit named local inputs with these nodes as their owners.

## References

- **COLMEZ10.** Pierre Colmez, *Représentations de GL2(Qp) et (φ,Γ)-modules*, Astérisque 330 (2010), 281–509; read in the author's version kirilov.pdf (236 pp.), whose page numbers are cited; accessed 2026-10-18. https://webusers.imj-prg.fr/~pierre.colmez/kirilov.pdf
- **COLMEZ08TRI.** Pierre Colmez, *Représentations triangulines de dimension 2*, Astérisque 319 (2008), 213–258; author's version Trianguline-ast.pdf; accessed 2026-10-18. https://webusers.imj-prg.fr/~pierre.colmez/Trianguline-ast.pdf
- **COLMEZ14LA.** Pierre Colmez, *La série principale unitaire de GL2(Qp) : vecteurs localement analytiques*, Automorphic forms and Galois representations, vol. 1, LMS Lecture Note Series 415 (2014), 286–358; author's version locan.pdf; accessed 2026-10-18. https://webusers.imj-prg.fr/~pierre.colmez/locan.pdf
- **PASKUNAS13.** Vytautas Paškūnas, *The image of Colmez's Montreal functor*, Publ. Math. IHÉS 118 (2013), 1–191; read arXiv:1005.2008v3. https://arxiv.org/abs/1005.2008
- **CDP14.** Pierre Colmez, Gabriel Dospinescu, Vytautas Paškūnas, *The p-adic local Langlands correspondence for GL2(Qp)*, Cambridge J. Math. 2 (2014), 1–47; read arXiv:1310.2235v1. https://arxiv.org/abs/1310.2235
- **PASKUNAS-BLOCKS14.** Vytautas Paškūnas, *Blocks for mod p representations of GL2(Qp)*, Automorphic forms and Galois representations, vol. 2, LMS Lecture Note Series 415 (2014); read arXiv:1104.5602v2. https://arxiv.org/abs/1104.5602
- **PASKUNAS15.** Vytautas Paškūnas, *On the Breuil–Mézard conjecture*, Duke Math. J. 164 (2015), 297–359; read arXiv:1209.5205v3. https://arxiv.org/abs/1209.5205
- **HU-TAN15.** Yongquan Hu, Fucheng Tan, *The Breuil–Mézard conjecture for non-scalar split residual representations*, Ann. Sci. ÉNS (4) 48 (2015), 1383–1421; read arXiv:1309.1658v2 (page numbers of the arXiv file). https://arxiv.org/abs/1309.1658
- **TUNG21A.** Shen-Ning Tung, *On the automorphy of 2-dimensional potentially semi-stable deformation rings of G_Qp*, Algebra Number Theory 15 (2021), 2173–2194; read arXiv:1803.07451v4. https://arxiv.org/abs/1803.07451
- **PASKUNAS16.** Vytautas Paškūnas, *On 2-dimensional 2-adic Galois representations of local and global fields*, Algebra Number Theory 10 (2016), 1301–1358; read arXiv:1509.00332v2. https://arxiv.org/abs/1509.00332
- **TUNG21B.** Shen-Ning Tung, *On the modularity of 2-adic potentially semi-stable deformation rings*, Math. Z. 298 (2021), 107–159; read arXiv:1908.06174v3. https://arxiv.org/abs/1908.06174
- **PASKUNAS-TUNG21.** Vytautas Paškūnas, Shen-Ning Tung, *Finiteness properties of the category of mod p representations of GL2(Qp)*, read arXiv:2104.08948v2. https://arxiv.org/abs/2104.08948
- **CDN23.** Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, *Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*, Forum Math. Pi 11 (2023), e16; read arXiv:2204.11214v2. https://arxiv.org/abs/2204.11214
- **CDNKISIN.** Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, *Correspondance de Langlands locale p-adique et anneaux de Kisin*, read arXiv:2204.11217v2 (24 April 2023). https://arxiv.org/abs/2204.11217
- **CDN20.** Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, *Cohomologie p-adique de la tour de Drinfeld : le cas de la dimension 1*, J. Amer. Math. Soc. 33 (2020), 311–362; read arXiv:1704.08928v2 (arXiv page numbers cited). https://arxiv.org/abs/1704.08928
- **CD14.** Pierre Colmez, Gabriel Dospinescu, *Complétés universels de représentations de GL2(Qp)*, Algebra Number Theory 8 (2014); read arXiv:1301.7647v1. https://arxiv.org/abs/1301.7647
- **DOSPINESCU15.** Gabriel Dospinescu, *Extensions de représentations de de Rham et vecteurs localement algébriques*, Compositio Math. 151 (2015); read arXiv:1302.4567v1. https://arxiv.org/abs/1302.4567
- **BB10.** Laurent Berger, Christophe Breuil, *Sur quelques représentations potentiellement cristallines de GL2(Qp)*, Astérisque 330 (2010), 155–211; read arXiv:math/0601545v1. https://arxiv.org/abs/math/0601545
- **EMERTON-LG.** Matthew Emerton, *Local-global compatibility in the p-adic Langlands programme for GL2/Q*, Preprint (2011), author's file lg.pdf; accessed 2026-10-18. https://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf
- **GEE-KISIN14.** Toby Gee, Mark Kisin, *The Breuil–Mézard conjecture for potentially Barsotti–Tate representations*, Forum Math. Pi 2 (2014), e1; read arXiv:1208.3179. https://arxiv.org/abs/1208.3179
- **KISIN09.** Mark Kisin, *The Fontaine–Mazur conjecture for GL2*, J. Amer. Math. Soc. 22 (2009), 641–690; read the author's AMS-TeX preprint fmc.dvi (50 pp., TeX output 2008) through a text extraction of the DVI file, so formulas were partly garbled; page numbers are the preprint's. http://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi
- **NAKAMURA23.** Kentaro Nakamura, *Zeta morphisms for rank two universal deformations*, Invent. Math. 234 (2023), 171–290; read arXiv:2006.13647v2 (arXiv page numbers cited). https://arxiv.org/abs/2006.13647
- **DLB17.** Gabriel Dospinescu, Arthur-César Le Bras, *Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique*, Ann. of Math. 186 (2017), 321–411; read arXiv:1509.00606v2. https://arxiv.org/abs/1509.00606
- **BREUIL03.** Christophe Breuil, *Sur quelques représentations modulaires et p-adiques de GL2(Qp) : I*, Compositio Math. 138 (2003), 165–188; author's version GL2(Qp)I.pdf; accessed 2026-10-18. https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/GL2%28Qp%29I.pdf
- **BCDT01.** Christophe Breuil, Brian Conrad, Fred Diamond, Richard Taylor, *On the modularity of elliptic curves over Q: wild 3-adic exercises*, J. Amer. Math. Soc. 14 (2001), 843–939; read Breuil's author copy STW.pdf (same text; pp. 10–12 there correspond to pp. 854–856 of the journal). https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/STW.pdf
- **DP22.** Luis Dieulefait, Ariel Pacetti, *A simplified proof of Serre's conjecture*, RACSAM 117 (2023), article 153; read arXiv:2108.07577v2. https://arxiv.org/abs/2108.07577
