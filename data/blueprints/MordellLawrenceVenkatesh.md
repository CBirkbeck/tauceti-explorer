# Mordell by p-adic period mappings

This roadmap follows Brian Lawrence and Akshay Venkatesh, *Diophantine problems and p-adic period mappings*, arXiv:1807.02721v3. Its target is the finiteness of C(K) for a smooth projective geometrically connected curve C of genus at least two over a number field K. The proof uses period maps and Kodaira–Parshin monodromy. It imports the bounded-representation finiteness input, rather than the Mordell corollary of the height argument.

A complete target-level revision of the Lawrence–Venkatesh proof of Mordell (arXiv:1807.02721v3, §§2–8): 146 nodes across LV.0–LV.11, with precise prerequisite chains, planning APIs and three tests for each definition/construction. Generic theories extend their existing owners through pending Part II proposals. Current-stage imports are separated from beyond-stage requests; every missing contract and suggested-signature comparison is explicit. Complete denotes the planning pass required by PROTOCOL §0; no stage is closed and no implementation is claimed. The historical independent needs_changes review and its audit are preserved; this revision requires a new independent review.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit has no LV layer entry. The declaration audit therefore checks the pinned source statements directly, including existing affine equivalences, Weierstrass curves, covering monodromy, CM fields, Grassmannian functors and transvections.

The historical [REV-DESIGN-LV report](../reviews/REV-DESIGN-LV.md) and the packet’s review object remain unchanged. This revision is DESIGN-LV~2; it requires a new independent review. All twelve layers are planned under PROTOCOL §0, with their chains ending in pinned declarations, owner nodes, precise requests or recorded gaps. No layer is closed.

## Proof route

LV.0 provides the linear and finite-group estimates and the symplectic subgroup criterion. LV.1 turns global purity into a Hodge-weight constraint at friendly places and supplies the finite set of semisimple Galois representations. LV.2 identifies the cohomology of good fibres using horizontal transport and crystalline comparison. LV.3 constructs both period maps and compares their common local series; monodromy gives the dimension of the period image. LV.4 compares that dimension with Frobenius-centralizer orbits and obtains a local finiteness criterion.

LV.6 first applies the method to S-units using the Legendre family. LV.7 establishes the stronger criterion needed for Mordell, with the small-Frobenius-orbit statistic and the Lagrangian general-position estimate. LV.8 constructs the Hurwitz and reduced-Prym families. LV.5 and LV.9 supply the surface and covering comparisons, while LV.10 proves full Kodaira–Parshin monodromy using liftable curves. LV.11 chooses the auxiliary prime and friendly place, proves the small-orbit bound, and applies the criterion to C(K).

## Conventions and owner boundaries

A surface carrier records a compact connected oriented topological two-manifold with boundary and a finite set of interior punctures. Classification, genus, homology and the intersection form are separate results. Simple closed curves are oriented embeddings, with the smooth convention of LV compared to tame topological embeddings through the explicit smoothing and isotopy gap. Disk-bounding circles belong to the carrier; essentialness is a predicate.

Mathlib fundamental-group multiplication satisfies p*q=q.trans p. Endpoint point-pushing along α acts on based loops by α*γ*α⁻¹, traversing α⁻¹, γ, α. A positive Dehn twist acts on homology by x↦x+î(x,[e])[e]. The algebraic transvection convention is T_v^r(x)=x+rω(v,x)v. Consequently the lifted (q−1)-st twist acts on primitive homology as T_ẽ^(−q), equivalently x↦x+qî(x,ẽ)ẽ. The exponent q−1 and the pairing order are both essential.

Finite étale Grassmannians impose rank on each component of the coefficient algebra. For E=k×k and V=E², k²×0 has the right total k-dimension but is not a free rank-one E-point. The Lagrangian period variety uses the perfect trace pairing and the componentwise quotient-rank convention. Crystalline general position retains the semilinear similitude hypothesis required by the comparison of transported forms.

General surface and mapping-class theory extends GeometricTopology; fibrations, asphericity and branched transfer extend AlgebraicTopology. Generic algebraic subgroup and symplectic structure extends ReductiveGroups. Deligne’s generic square-zero generation theorem is imported from LefschetzPencilsAndVanishingCycles LPV.5. Étale splitting and scheme interfaces stay with SchemeAndStackFoundations; moduli, cohomology, continuous Mackey and local character interfaces stay with their existing owners. The precise Part II proposals are listed below. Current IDs remain until the orchestrator accepts transfers.

## Coverage

| Layer | Targets | Planets | Status |
| --- | ---: | ---: | --- |
| LV.0 | 21 | 3 | planned, open contracts |
| LV.1 | 17 | 4 | planned, open contracts |
| LV.2 | 11 | 4 | planned, open contracts |
| LV.3 | 19 | 5 | planned, open contracts |
| LV.4 | 5 | 1 | planned, open contracts |
| LV.5 | 16 | 4 | planned, open contracts |
| LV.6 | 10 | 4 | planned, open contracts |
| LV.7 | 8 | 2 | planned, open contracts |
| LV.8 | 11 | 4 | planned, open contracts |
| LV.9 | 12 | 5 | planned, open contracts |
| LV.10 | 10 | 2 | planned, open contracts |
| LV.11 | 6 | 1 | planned, open contracts |

## Suggested signatures

The [suggested file](../suggested/MordellLawrenceVenkatesh.lean) elaborates against the pinned Mathlib build. It imports individual Mathlib modules and no Tau Ceti modules: the shared Tau checkout is newer, so this does not claim elaboration of Tau interfaces at the pin. The file gives concrete centralizer, affine-group, transvection, CM-subfield, finite-filtration, permutation, abstract-surjection, Weierstrass and linear-kernel signatures, with 27 labelled examples and additional checks.

Every API and test below is labelled stated, partial or omitted. “Stated” means its proposed form appears in the suggested file; no implementation is claimed. “Partial” means a genuine baseline carrier or theorem is present but its named mathematical comparison remains open. “Omitted” means the exact missing interface is recorded as a gap and named in the comment ledger; the file does not replace it with an arbitrary proposition or an assumed theorem field. The four additional baseline-expressible theorem signatures are the semisimple trace criterion, primitive integral lift, signed primitive spanning and simultaneous primitive intersection avoidance.

## LV.0 — Semilinear centralizers, the affine group Aff(q) and symplectic monodromy lemmas

### Splitting of a finite separable extension after base change to a splitting field

**Node:** `MordellLawrenceVenkatesh:LV.0/galois-tensor-splitting` · lemma; implementation unchecked.

Let E/F be a finite separable field extension and Ω a field containing F over which the minimal polynomial of a primitive element of E splits (for instance an algebraically closed field containing F). Let Σ = Hom_F(E, Ω). The Ω-algebra map E ⊗_F Ω → Ω^Σ, e ⊗ x ↦ (τ(e)x)_{τ∈Σ}, is an isomorphism.

**Hypotheses.** E/F finite separable; Ω ⊇ F a field in which the minimal polynomial of a primitive element of E splits.

**Construction or proof.**

1. Choose a primitive element α with E = F(α) (primitive element theorem) and let f be its minimal polynomial, which is separable.
2. E ⊗_F Ω ≅ Ω[X]/(f); since f splits over Ω into the distinct linear factors X − τ(α), τ ∈ Σ, the ideals (X − τ(α)) are pairwise coprime and the Chinese remainder theorem gives Ω[X]/(f) ≅ ∏_τ Ω[X]/(X − τ(α)) ≅ Ω^Σ.
3. Trace the composite on e ⊗ x to identify it with e ⊗ x ↦ (τ(e)x)_τ.

**Prerequisites.** `mathlib:Field.exists_primitive_element`; `mathlib:Ideal.quotientInfRingEquivPiQuotient`.

**Owner proposal.** SchemeAndStackFoundations; General finite étale algebra and its module-idempotent decomposition. Extend SF.0 via Part II; field/CRT baseline is reused.

**Acceptance.**

- For E = ℚ(i), F = ℚ, Ω = ℂ: ℚ(i) ⊗ ℂ ≅ ℂ × ℂ via i ↦ (i, −i).
- The decomposition is functorial in M and compatible with tensor products.

**Sources.**

- lv2020, §2.1, proof of Lemma 2.1, p. 9: The splitting used in the proof of Lemma 2.1; the node isolates it as a lemma.

**Signature gap:** Named theorem interfaces — LV.0.

### The centralizer of a semilinear automorphism

**Node:** `MordellLawrenceVenkatesh:LV.0/semilinear-centralizer` · definition; implementation unchecked.

Let σ be a field automorphism of E and φ : V → V a σ-semilinear bijection of a finite-dimensional E-vector space (φ(ev) = σ(e)φ(v)). The centralizer Z(φ) := {f ∈ End_E(V) : f ∘ φ = φ ∘ f}. It is a subalgebra of End_E(V) over the fixed field F = E^σ (not an E-subspace in general), and its unit group Z(φ)^× = Z(φ) ∩ GL_E(V) is the group of E-linear automorphisms commuting with φ.

**Hypotheses.** σ ∈ Aut(E); φ σ-semilinear and bijective; dim_E V < ∞.

**Construction or proof.**

1. Define Z(φ) as the kernel of the F-linear map End_E(V) → End(V), f ↦ fφ − φf; check that fφ − φf is additive and that for c ∈ F, (cf)φ = c(fφ) since σ(c) = c.
2. Closure under composition and identity is immediate, so Z(φ) is an F-subalgebra.

**Prerequisites.** The elementary field/module carrier specified above..

**Uses.**

- MordellLawrenceVenkatesh:LV.0/semilinear-centralizer-finrank: bound the dimension of Frobenius-centralizer orbits. The consumer is Dimension of the centralizer of a semilinear automorphism (LV Lemma 2.1).
- MordellLawrenceVenkatesh:LV.4/filtered-phi-orbit: bound the dimension of Frobenius-centralizer orbits. The consumer is Filtrations with isomorphic filtered φ-modules form a Frobenius-centralizer orbit of bounded dimension.

**Planning API.**

- `semilinearCentralizer` (constructor; signature partial): Z(φ) as an F-subalgebra of End_E(V), F = fixedField σ.
  The prototype accepts any base field fixed pointwise by σ and any semilinear map. Specialization to the full fixed field and an invertible φ requires the fixed-field/tower adapters; the tensor-descent formula needs the descended-module comparison.
- `mem_semilinearCentralizer` (characterisation; signature stated): f ∈ Z(φ) ↔ f ∘ φ = φ ∘ f.
- `semilinearCentralizer_le_pow` (relation; signature stated): Z(φ) ⊆ Z(φ^n) for every n ≥ 1 (φ^n is σ^n-semilinear).
- `units_semilinearCentralizer` (characterisation; signature partial): Z(φ)^× = {g ∈ GL_E(V) : gφ = φg}; it acts on subspaces of V and on filtrations preserving the φ-stable structure.
  The file gives the linear-equivalence map of a unit and its evaluation. The reverse map and multiplicative equivalence with the commuting subgroup of GL_E(V), together with its filtration action, remain to be stated.
- `semilinearCentralizer_linear` (compatibility; signature partial): When σ = id, Z(φ) is the usual centralizer of the linear map φ (Mathlib Subalgebra.centralizer).
  The file compares with the explicit commuting subalgebra. The final equality to the pinned Subalgebra.centralizer API still needs its singleton-set adapter.
- `semilinearCentralizer_conj` (functoriality; signature stated): For an E-linear iso u : V ≅ W, u Z(φ) u⁻¹ = Z(uφu⁻¹).
- `semilinearCentralizer_scalar` (example; signature omitted): If φ = σ ⊗ 1 on E ⊗_F V₀ then Z(φ) = End_F(V₀) ⊗ 1.
- `semilinearCentralizer_fixedScalar` (simp; signature stated): For a base field F fixed pointwise by σ, scalar multiplication by every a∈F commutes with φ.

**Mathematical tests.**

- `semilinearCentralizer.reviewTest1` (computation; signature stated): For V=E and φ=σ, multiplication by a belongs to Z(φ) iff σ(a)=a.
- `semilinearCentralizer.reviewTest2` (degenerate; signature stated): For σ=id and φ=id on E², Z(φ)=M₂(E).
- `semilinearCentralizer.reviewTest3` (non-example; signature stated): For E=ℂ over ℝ and φ=complex conjugation on E, multiplication by i is not in Z(φ), while multiplication by 1 is. The same obstruction occurs in ℚ(i).

**Acceptance.**

- Z(id_V) = End_E(V) when σ = id.
- For E = ℚ_{p²}, φ = σ ⊕ σ on E², Z(φ) = M_2(ℚ_p).

**Sources.**

- lv2020, §2.1, Lemma 2.1, p. 9: Definition of Z(φ) and its F-structure.

**Planet:** Semilinear centralizer.

**Signature gap:** Suggested signatures — semilinear-centralizer.

### Dimension of the centralizer of a semilinear automorphism (LV Lemma 2.1)

**Node:** `MordellLawrenceVenkatesh:LV.0/semilinear-centralizer-finrank` · theorem; implementation unchecked.

Let σ be an automorphism of the field E of finite order e with fixed field F, V an E-vector space of dimension d and φ a σ-semilinear bijection of V. Then dim_F Z(φ) = dim_E Z(φ^e), where φ^e is E-linear; in particular dim_F Z(φ) ≤ d².

**Hypotheses.** σ of finite order e, F = E^σ; dim_E V = d; φ σ-semilinear and bijective.

**Construction or proof.**

1. By Artin's theorem E/F is Galois with group ⟨σ⟩ of order e.
2. Let F̄ be an algebraic closure of F and Σ = Hom_F(E, F̄); by the splitting lemma V̄ = V ⊗_F F̄ = ⊕_{τ∈Σ} V̄^τ.
3. φ̄ = φ ⊗ 1 is F̄-linear and maps V̄^τ onto V̄^{τσ^{-1}}; the orbits of σ on Σ form one cycle τ₀, τ₀σ^{-1}, …, τ₀σ^{-(e−1)}.
4. Z(φ) ⊗_F F̄ is the centralizer of φ̄ inside End_{E⊗F̄}(V̄) (kernels commute with the flat base change F → F̄); an element (f_τ) of it is determined by f_{τ₀}, which commutes with φ̄^e|V̄^{τ₀}, and every such f_{τ₀} extends uniquely by f_{τ₀σ^{-i}} = φ̄^i f_{τ₀} φ̄^{-i}. Hence Z(φ) ⊗ F̄ ≅ centralizer of φ̄^e on V̄^{τ₀}.
5. (V̄^{τ₀}, φ̄^e) is the base change of (V, φ^e) along τ₀ : E → F̄, so its centralizer has F̄-dimension dim_E Z(φ^e).
6. Compare dimensions using invariance of dimension under base change; the bound follows from Z(φ^e) ⊆ End_E(V).

**Prerequisites.** `MordellLawrenceVenkatesh:LV.0/galois-tensor-splitting`; `MordellLawrenceVenkatesh:LV.0/semilinear-centralizer`; `mathlib:IsGalois.of_fixed_field`; `mathlib:FixedPoints.finrank_eq_card`; `mathlib:Module.finrank_baseChange`; `mathlib:Module.Flat.ker_lTensor_eq`; `MordellLawrenceVenkatesh:LV.0/galois-module-splitting`.

**Acceptance.**

- E = ℚ_{p²}, F = ℚ_p, φ = σ ⊕ σ on E²: both sides equal 4.
- If φ^e is a scalar then dim_F Z(φ) = d².
- If φ^e has distinct eigenvalues in E then dim_F Z(φ) ≤ d.

**Sources.**

- lv2020, §2.1, Lemma 2.1 and proof, p. 9: Statement of Lemma 2.1.
- lv2020, §2.1, proof of Lemma 2.1, p. 9: The key step, reproduced as proof steps 4–5.

**Signature gap:** Named theorem interfaces — LV.0.

### Frobenius centralizers over unramified extensions of a p-adic field

**Node:** `MordellLawrenceVenkatesh:LV.0/semilinear-centralizer-unramified` · lemma; implementation unchecked.

Let K_v/ℚ_p be finite unramified of degree f_v, L/K_v finite unramified of degree r, and σ_L the arithmetic Frobenius of L over ℚ_p. Let V be an L-vector space of dimension n and φ a σ_L-semilinear bijection. Then Z(φ) ⊆ Z(φ^{f_v}); the latter is a K_v-subalgebra of End_L(V) with dim_{K_v} Z(φ^{f_v}) = dim_L Z(φ^{f_v r}) ≤ n²; its unit group is the group of K_v-points of the K_v-group scheme of units of this K_v-algebra, a smooth connected affine group of dimension dim_{K_v} Z(φ^{f_v}).

**Hypotheses.** K_v/ℚ_p unramified of degree f_v; L/K_v unramified of degree r; φ σ_L-semilinear bijective, dim_L V = n.

**Construction or proof.**

1. σ_L^{f_v} generates Gal(L/K_v), which is cyclic of order r with fixed field K_v (unramified extensions of local fields are Galois with Frobenius generator).
2. φ^{f_v} is σ_L^{f_v}-semilinear; apply the dimension formula for semilinear centralizers with e = r.
3. Z(φ) ⊆ Z(φ^{f_v}) is the power relation of the centralizer API.
4. The unit group of a finite-dimensional K_v-algebra A is represented by the open subscheme of the affine space of A where the norm is invertible; it is smooth and connected of dimension dim A.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — LocalFieldsRamification Layer 2 (unramified extensions and Frobenius). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.0/semilinear-centralizer-finrank`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

**Acceptance.**

- K_v = ℚ_p, L = ℚ_{p^r}, V = L with φ = σ_L: Z(φ) = ℚ_p and Z(φ^{1}) = ℚ_p has dimension 1 = dim_L Z(φ^r).
- The bound dim ≤ 4d² for n = 2d used in LV Lemma 6.2.

**Sources.**

- lv2020, §6, proof of Lemma 6.2, p. 31: The application of Lemma 2.1 to an unramified extension of K_v.

**Signature gap:** Named theorem interfaces — LV.0.

### The affine group Aff(q) of a prime field

**Node:** `MordellLawrenceVenkatesh:LV.0/affine-group` · definition; implementation unchecked.

For a prime q ≥ 3, Aff(q) is the subgroup of Sym(𝔽_q) consisting of the permutations x ↦ ax + b with a ∈ 𝔽_q^×, b ∈ 𝔽_q. It is isomorphic to the semidirect product 𝔽_q^+ ⋊ 𝔽_q^×; λ : Aff(q) → 𝔽_q^×, (x ↦ ax+b) ↦ a, is a surjective homomorphism with kernel the translations 𝔽_q^+; H_q = 𝔽_q^× (the maps x ↦ ax) is the stabilizer of 0. Implement the affine group by reusing AffineEquiv over ZMod q; the faithful permutation image above is a comparison, not a second independent group carrier.

**Hypotheses.** q ≥ 3 prime.

**Construction or proof.**

1. Define Aff(q) as the image of the injective homomorphism 𝔽_q^+ ⋊ 𝔽_q^× → Sym(𝔽_q), (b, a) ↦ (x ↦ ax + b).
2. λ is the projection to 𝔽_q^×; its kernel is the image of 𝔽_q^+.
3. The stabilizer of 0 consists of the maps with b = 0.

The prime-field Aff(q) carrier is the faithful permutation image of pinned AffineEquiv. Reuse its group and affine structure; the LV targets are the finite action, cycle/counting comparisons and applications, with no parallel generic affine-equivalence theory.

**Prerequisites.** `mathlib:ZMod.card_units_eq_totient`; `mathlib:AffineEquiv`.

**Uses.**

- MordellLawrenceVenkatesh:LV.0/affine-group-cycle-type: calculate monodromy and count covers through affine transformations. The consumer is Cycle types of elements of Aff(q).
- MordellLawrenceVenkatesh:LV.0/affine-group-centralizer: calculate monodromy and count covers through affine transformations. The consumer is Aff(q) is centre-free, has trivial centralizer and is self-normalizing in Sym(𝔽_q).
- MordellLawrenceVenkatesh:LV.0/commutator-product-map: calculate monodromy and count covers through affine transformations. The consumer is The commutator-product map on Aff(q)^{2s} (LV Lemma 2.11).
- MordellLawrenceVenkatesh:LV.8/affine-group-idempotents: calculate monodromy and count covers through affine transformations. The consumer is The idempotents e, e′ and e″ of ℚ[Aff(q)].
- MordellLawrenceVenkatesh:LV.9/affine-cover-normal-form: calculate monodromy and count covers through affine transformations. The consumer is Normal form of a singly ramified Aff(q)-cover (LV Proposition 8.5).

**Planning API.**

- `affineGroup` (constructor; signature stated): Aff(q) as a subgroup of Equiv.Perm (ZMod q).
- `affineGroup.mk` (constructor; signature stated): For a ∈ (ZMod q)ˣ and b ∈ ZMod q, the element x ↦ ax + b; mk a b = mk a' b' ↔ a = a' ∧ b = b'.
- `affineGroup.mulEquivSemidirect` (equivalence; signature stated): Aff(q) ≃* Multiplicative (ZMod q) ⋊ (ZMod q)ˣ with the scaling action.
- `affineGroup.linearPart` (data; signature stated): The surjective homomorphism λ : Aff(q) →* (ZMod q)ˣ, λ(mk a b) = a.
- `affineGroup.ker_linearPart` (characterisation; signature stated): ker λ = the translations {mk 1 b}, a normal subgroup isomorphic to ZMod q.
- `affineGroup.mk_mul_mk` (simp; signature stated): mk a b * mk a' b' = mk (a a') (a b' + b); (mk a b)⁻¹ = mk a⁻¹ (−a⁻¹ b).
- `affineGroup.card` (other; signature stated): |Aff(q)| = q(q − 1).
- `affineGroup.stabilizer_zero` (characterisation; signature stated): The stabilizer of 0 is H_q = {mk a 0} ≃* (ZMod q)ˣ; its index is q and Aff(q) acts on 𝔽_q ≅ Aff(q)/H_q.
- `affineGroup.commutator_eq` (relation; signature stated): [mk a b, mk a' b'] = mk 1 (b(1 − a') − b'(1 − a)); the commutator subgroup is the translation subgroup.
- `affineGroup.isPretransitive` (instance; signature stated): Aff(q) acts sharply 2-transitively on 𝔽_q.
- `affineGroup.example_three` (example; signature stated): Aff(3) = Equiv.Perm (ZMod 3).
- `affineGroup.mulEquivAffineEquiv` (compatibility; signature stated): The permutation image Aff(q) is canonically isomorphic as a group to (ZMod q) ≃ᵃ[ZMod q] (ZMod q), preserving evaluation, the linear part and translations.

**Mathematical tests.**

- `affineGroup.reviewTest1` (computation; signature stated): In Aff(5), (2,1)(3,4)=(1,4), with (a,b) acting by x↦ax+b.
- `affineGroup.reviewTest2` (degenerate; signature stated): The identity is (1,0) and (a,b)⁻¹=(a⁻¹,−a⁻¹b).
- `affineGroup.reviewTest3` (compatibility; signature stated): The action on 𝔽₃ identifies Aff(3) with Sym(𝔽₃), of cardinality 6.

**Acceptance.**

- Aff(3) ≅ S_3 = Sym(𝔽_3).
- |Aff(5)| = 20 and Aff(5) is the Frobenius group F₂₀.

**Sources.**

- lv2020, §2.6, p. 14: Definition of Aff(q) as a permutation group and its semidirect-product structure.

**Planet:** Affine group.

### Cycle types of elements of Aff(q)

**Node:** `MordellLawrenceVenkatesh:LV.0/affine-group-cycle-type` · lemma; implementation unchecked.

Let q ≥ 3 be prime and g = (x ↦ ax + b) ∈ Aff(q). If a ≠ 1, then g has exactly one fixed point and all its other cycles have length ord(a), the order of a in 𝔽_q^×. If a = 1 and b ≠ 0, g is a q-cycle. If g = 1 all cycles are fixed points. In particular the cycle type of g in Sym(𝔽_q) determines whether λ(g) = 1, and when λ(g) ≠ 1 it determines ord(λ(g)).

**Hypotheses.** q ≥ 3 prime.

**Construction or proof.**

1. If a ≠ 1, conjugating by the translation moving the unique fixed point b/(1 − a) to 0 turns g into x ↦ ax, whose nonzero orbits are cosets of ⟨a⟩ in 𝔽_q^×.
2. If a = 1, b ≠ 0, the orbit of any x is x + 𝔽_q b = 𝔽_q since q is prime.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.0/affine-group`.

**Acceptance.**

- In Aff(5), x ↦ 2x + 1 has cycle type (1, 4); x ↦ 4x has cycle type (1, 2, 2); x ↦ x + 1 is a 5-cycle.

**Sources.**

- lv2020, §8.3, p. 42: The list of cycle structures used in §8.3.

**Signature gap:** Named theorem interfaces — LV.0.

### Aff(q) is centre-free, has trivial centralizer and is self-normalizing in Sym(𝔽_q)

**Node:** `MordellLawrenceVenkatesh:LV.0/affine-group-centralizer` · lemma; implementation unchecked.

For a prime q ≥ 3: (a) the centralizer of Aff(q) in Sym(𝔽_q) is trivial; in particular Aff(q) has trivial centre; (b) the normalizer of Aff(q) in Sym(𝔽_q) is Aff(q). Consequently, for a group Γ, two surjections Γ → Aff(q) are conjugate under Sym(𝔽_q) (as transitive actions on 𝔽_q with image Aff(q)) if and only if they are conjugate under Aff(q), and a surjection Γ → Aff(q) has trivial stabilizer under conjugation by Aff(q).

**Hypotheses.** q ≥ 3 prime.

**Construction or proof.**

1. (a) A permutation c commuting with all translations satisfies c(x + 1) = c(x) + 1, so c is a translation x ↦ x + t; commuting with x ↦ ax (a ≠ 1) forces at = t, so t = 0.
2. (b) If s ∈ Sym(𝔽_q) normalizes Aff(q), it normalizes the unique Sylow q-subgroup 𝔽_q^+ (normal, of index q − 1 prime to q); after composing with a translation s fixes 0 and normalizes ⟨x ↦ x+1⟩, so s(x + 1) = s(x) + c for some c ≠ 0, whence s(x) = cx ∈ Aff(q).
3. The consequences follow: a Sym-conjugacy between two surjections is given by an element normalizing Aff(q); the stabilizer of a surjection φ under conjugation is the centralizer of φ(Γ) = Aff(q), which is trivial.

The prime-field Aff(q) carrier is the faithful permutation image of pinned AffineEquiv. Reuse its group and affine structure; the LV targets are the finite action, cycle/counting comparisons and applications, with no parallel generic affine-equivalence theory.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.0/affine-group`.

**Acceptance.**

- Aff(3) = S_3 is self-normalizing and centre-free.
- The translation subgroup of Aff(q) has nontrivial centralizer (itself), so surjectivity is needed.

**Sources.**

- lv2020, §8.2, footnote 5, p. 39: Part (b).
- lv2020, §8.2.1, p. 40: Part (a); centre-freeness is the hypothesis of Proposition 7.1.

**Signature gap:** Named theorem interfaces — LV.0.

### The commutator-product map on Aff(q)^{2s} (LV Lemma 2.11)

**Node:** `MordellLawrenceVenkatesh:LV.0/commutator-product-map` · theorem; implementation unchecked.

Let q ≥ 3 be prime, s ≥ 1 and f : Aff(q)^{2s} → 𝔽_q^+, f(g₁, g₁', …, g_s, g_s') = [g₁, g₁'] ⋯ [g_s, g_s'] (with [x, y] = xyx⁻¹y⁻¹). Let Λ : Aff(q)^{2s} → (𝔽_q^×)^{2s} apply λ componentwise. Then: (a) if f(g) ≠ 0, then g generates Aff(q) if and only if the entries of Λ(g) generate 𝔽_q^×, and in that case g generates Aff(q); (b) the image of {g : f(g) ≠ 0, g generates Aff(q)} under Λ is exactly the set of 2s-tuples whose entries generate 𝔽_q^×; (c) every fibre of this restricted map over a point of its image has exactly q^{2s−1}(q − 1) elements.

**Hypotheses.** q ≥ 3 prime; s ≥ 1.

**Construction or proof.**

1. Write g_i = mk(y_i, b_i), g_i' = mk(y_i', b_i'); by the commutator formula f(g) = Σ_i (b_i(1 − y_i') − b_i'(1 − y_i)), an affine-linear function of b = (b_i, b_i') ∈ 𝔽_q^{2s} for fixed y.
2. If the y's generate 𝔽_q^× then some y_i or y_i' differs from 1 (q ≥ 3), so f is a nonconstant affine-linear function on the fibre 𝔽_q^{2s}; exactly q^{2s} − q^{2s−1} points have f ≠ 0.
3. If f(g) ≠ 0, the subgroup ⟨g⟩ contains a nonzero translation, hence all of 𝔽_q^+ (prime order), and ⟨g⟩ = Aff(q) iff its image λ(⟨g⟩) = ⟨y⟩ is 𝔽_q^×.
4. Conversely a generating tuple has generating image under the surjection λ. Combine.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.0/affine-group`.

**Acceptance.**

- q = 3, s = 1: the image consists of the 3 pairs in {±1}² generating {±1}, each fibre has 3·2 = 6 elements, giving the 18 generating pairs of S_3 (all with nonzero commutator).
- q = 3, s = 2: 15 · 54 = 810 tuples, giving 135 conjugacy classes.

**Sources.**

- lv2020, §2.6, Lemma 2.11, p. 14: Statement of Lemma 2.11.
- lv2020, §2.6, proof of Lemma 2.11, p. 14: Proof step 2.

**Signature gap:** Named theorem interfaces — LV.0.

### Counting generating tuples of ℤ/N

**Node:** `MordellLawrenceVenkatesh:LV.0/generating-tuples-card` · lemma; implementation unchecked.

For integers N ≥ 1 and k ≥ 2, the number of k-tuples (y₁, …, y_k) ∈ (ℤ/N)^k whose entries generate ℤ/N as a group is J_k(N) = N^k ∏_{ℓ | N prime} (1 − ℓ^{−k}), and J_k(N) ≥ N^k/2.

**Hypotheses.** N ≥ 1; k ≥ 2.

**Construction or proof.**

1. A tuple generates ℤ/N iff for every prime ℓ | N not all entries lie in ℓℤ/N (the maximal subgroups of ℤ/N are the ℓℤ/N).
2. By the Chinese remainder theorem the count is multiplicative in N; for N = ℓ^a the non-generating tuples are those in (ℓℤ/ℓ^a)^k, of which there are ℓ^{(a−1)k}, giving ℓ^{ak}(1 − ℓ^{−k}).
3. ∏_ℓ (1 − ℓ^{−k}) ≥ ∏_ℓ (1 − ℓ^{−2}) ≥ 1 − Σ_ℓ ℓ^{−2}.
4. Σ_{ℓ prime} ℓ^{−2} ≤ 1/4 + Σ_{j≥1} (2j+1)^{−2} < 1/4 + Σ_{j≥1} 1/(4j(j+1)) = 1/2, since (2j+1)² > 4j(j+1).

**Prerequisites.** `mathlib:Ideal.quotientInfRingEquivPiQuotient`; `mathlib:ZMod.card_units_eq_totient`.

**Acceptance.**

- N = 6, k = 2: J₂(6) = 36 · (3/4) · (8/9) = 24 ≥ 18.
- N prime: J_k(N) = N^k − 1.

**Sources.**

- lv2020, §5, proof of Theorem 5.4, p. 28: The count and the lower bound ≥ N^{2g}/2 used in Theorem 5.4.

**Signature gap:** Named theorem interfaces — LV.0.

### Isotropic subgroups for a perfect pairing on a finite abelian group

**Node:** `MordellLawrenceVenkatesh:LV.0/isotropic-subgroup-card` · lemma; implementation unchecked.

Let A be a finite abelian group and ⟨·,·⟩ : A × A → ℚ/ℤ a biadditive pairing that is perfect in the sense that a ↦ ⟨·, a⟩ is a bijection from A to its character module Hom(A, ℚ/ℤ). If B ≤ A satisfies ⟨B, B⟩ = 0 then |B|² ≤ |A|. No symmetry of the pairing is assumed. (A pairing with values in ℤ/N ⊂ ℚ/ℤ, or in a cyclic group μ_N^∨ ≅ ℤ/N after a choice of generator, is a special case.)

**Hypotheses.** A finite abelian; the pairing is perfect on the right.

**Construction or proof.**

1. B^⊥ := {a : ⟨b, a⟩ = 0 for all b ∈ B} contains B by isotropy.
2. The composite A → Hom(A, ℚ/ℤ) → Hom(B, ℚ/ℤ) is surjective: the first map is bijective and restriction of ℚ/ℤ-valued characters along the injection B ↪ A is surjective.
3. Its kernel is B^⊥, so |B^⊥| = |A| / |Hom(B, ℚ/ℤ)|; and |Hom(B, ℚ/ℤ)| = |B| because ℚ/ℤ-valued characters of the finite group B are the same as ℂ-valued ones (t ↦ exp(2πit) identifies ℚ/ℤ with the roots of unity in ℂ^×) and there are |B| of those.
4. Hence |B| ≤ |B^⊥| = |A|/|B|.

**Prerequisites.** `mathlib:CharacterModule`; `mathlib:CharacterModule.dual_surjective_of_injective`; `mathlib:AddChar.card_eq`.

**Acceptance.**

- A = (ℤ/N)² with the determinant pairing: a cyclic subgroup of order N is isotropic and |B|² = |A|.
- The symmetric case agrees with Tau Ceti's IsNondegenerate.card_orthogonalQuotient_mul_card_sq.

**Sources.**

- lv2020, §5, proof of Theorem 5.4, p. 28: The statement; LV apply it to the image of 2M with an alternating pairing.

**Signature gap:** Named theorem interfaces — LV.0.

### Minimal subrepresentations of a representation with an invariant form up to similitude

**Node:** `MordellLawrenceVenkatesh:LV.0/minimal-subrepresentation-half` · lemma; implementation unchecked.

Let G be a group, k a field, V a finite-dimensional k-linear representation of G and B a nondegenerate bilinear form on V that is symmetric or alternating, with B(gx, gy) = χ(g)B(x, y) for a character χ : G → k^×. If V is not irreducible and W ⊆ V is a nonzero subrepresentation of minimal dimension, then dim W ≤ dim V / 2.

**Hypotheses.** B nondegenerate, symmetric or alternating; G preserves B up to the scalar χ; V reducible.

**Construction or proof.**

1. W^⊥ is a subrepresentation because G preserves B up to scalars, and so is W ∩ W^⊥.
2. By minimality W ∩ W^⊥ is 0 or W.
3. If W ⊆ W^⊥ then dim W ≤ dim V − dim W.
4. If W ∩ W^⊥ = 0 then W^⊥ is a nonzero subrepresentation of dimension dim V − dim W (V ≠ W since V is reducible), so by minimality dim W ≤ dim W^⊥ = dim V − dim W.

**Prerequisites.** `mathlib:LinearMap.BilinForm.finrank_orthogonal`.

**Acceptance.**

- V = V₁ ⊕ V₂ orthogonal with dim V₁ = 1, dim V₂ = 3: the minimal W has dim 1 ≤ 2.
- The Tate module of an abelian variety with the Weil pairing (χ the cyclotomic character).

**Sources.**

- lv2020, §6, proof of Lemma 6.1, p. 32: The inequality (6.8) in the proof of the Sublemma.

**Signature gap:** Named theorem interfaces — LV.0.

### Symplectic transvections

**Node:** `MordellLawrenceVenkatesh:LV.0/symplectic-transvection` · definition; implementation unchecked.

Let (V, ω) be a finite-dimensional symplectic space over a field k of characteristic zero (ω nondegenerate alternating, written ⟨·,·⟩). For v ∈ V and r ∈ k, T_v^r : V → V is x ↦ x + r⟨v, x⟩v, and T_v := T_v^1. It is the Mathlib transvection with linear form r⟨v, ·⟩ and vector v (the form vanishes on v).

**Hypotheses.** (V, ω) symplectic over k, char k = 0.

**Construction or proof.**

1. Define T_v^r := LinearMap.transvection (r·⟨v, ·⟩) v; since ⟨v, v⟩ = 0 it is invertible with inverse T_v^{−r}.
2. Check ⟨T_v^r x, T_v^r y⟩ = ⟨x, y⟩ using bilinearity and ⟨v, v⟩ = 0.

**Prerequisites.** `mathlib:LinearMap.transvection`; `tauceti:TauCeti.BilinForm.isometryGroup`; `mathlib:LinearEquiv.transvection`.

**Owner proposal.** tauceti:TauCetiRoadmap/ReductiveGroups; Reusable linear/group theory; compare pinned carriers before transfer. Current accepted IDs remain stable.

**Uses.**

- MordellLawrenceVenkatesh:LV.0/zariski-closure-transvection-powers: turn lifted twists into one-parameter symplectic subgroups. The consumer is The Zariski closure of the powers of a transvection.
- MordellLawrenceVenkatesh:LV.9/liftable-curve: turn lifted twists into one-parameter symplectic subgroups. The consumer is Liftable curves and their transvections.

**Planning API.**

- `symplecticTransvection` (constructor; signature partial): T_v^r ∈ Sp(V, ω) (as an element of TauCeti.BilinForm.isometryGroup ω).
  The file gives an actual LinearEquiv preserving the explicit alternating form. Its coercion into the pinned TauCeti.BilinForm.isometryGroup needs the pinned Tau carrier adapter.
- `symplecticTransvection_apply` (simp; signature stated): T_v^r x = x + r⟨v, x⟩ v.
- `symplecticTransvection_add` (relation; signature stated): T_v^r T_v^s = T_v^{r+s}; T_v^0 = 1; (T_v^r)⁻¹ = T_v^{−r}.
- `symplecticTransvection_smul` (relation; signature stated): T_{cv}^r = T_v^{c² r}.
- `conj_symplecticTransvection` (functoriality; signature stated): g T_v^r g⁻¹ = T_{gv}^r for g ∈ Sp(V, ω).
- `isUnipotent_symplecticTransvection` (other; signature stated): T_v^r is unipotent: (T_v^r − 1)² = 0.
- `fixedPoints_symplecticTransvection` (characterisation; signature stated): For v ≠ 0 and r ≠ 0 the fixed space of T_v^r is v^⊥, of codimension 1, and the image of T_v^r − 1 is k·v.
- `eq_symplecticTransvection_of_codim_one` (characterisation; signature partial): A unipotent element of Sp(V, ω) whose fixed space has codimension 1 equals T_v^r for some v ≠ 0, r ≠ 0.
  The file assumes a specified nonzero vector normal to the fixed hyperplane. The codimension-one formulation requires identifying every such hyperplane using the nondegenerate form/dual equivalence.
- `symplecticTransvection_eq_transvection` (compatibility; signature stated): T_v^r = LinearMap.transvection (r • ω v) v.
- `symplecticTransvection_sl2` (example; signature partial): On (k², det) the transvections T_e^r, T_f^r are the elementary matrices of SL(2, k).
  The file gives the first elementary matrix over ℚ. General-field matrices and the second elementary matrix are the remaining rank-two adapter.

**Mathematical tests.**

- `symplecticTransvection.reviewTest1` (computation; signature stated): For ω(e,f)=1, T_e^2(f)=f+2e and T_e^2(e)=e.
- `symplecticTransvection.reviewTest2` (degenerate; signature stated): T_0^r=id and T_v^0=id.
- `symplecticTransvection.reviewTest3` (compatibility; signature stated): As a linear map, T_v^r equals LinearMap.transvection (r • ω(v,·)) v; its inverse is T_v^(−r).

**Acceptance.**

- In the basis (e, f) of k² with ⟨e, f⟩ = 1, T_e^r = [[1, r], [0, 1]] and T_f^r = [[1, 0], [−r, 1]].
- T_0^r = id.

**Sources.**

- lv2020, §2.7, (2.4), p. 15: Definition of T_v^r and the characterization recorded as an API item.

**Planet:** Symplectic transvection.

**Signature gap:** Suggested signatures — symplectic-transvection.

### The Zariski closure of the powers of a transvection

**Node:** `MordellLawrenceVenkatesh:LV.0/zariski-closure-transvection-powers` · lemma; implementation unchecked.

Let (V, ω) be symplectic over a field k of characteristic zero and v ∈ V nonzero. The Zariski closure in Sp(V) of the cyclic group {T_v^n : n ∈ ℤ} is the one-parameter unipotent subgroup U_v = {T_v^r : r ∈ k}, the image of the closed immersion 𝔾_a → Sp(V), r ↦ T_v^r. More generally the Zariski closure of {T_v^{nr₀} : n ∈ ℤ} is U_v for every r₀ ≠ 0.

**Hypotheses.** char k = 0; v ≠ 0.

**Construction or proof.**

1. r ↦ T_v^r is a homomorphism 𝔾_a → Sp(V) and a closed immersion (its coordinate functions include r·(a linear form) with nonzero coefficient).
2. The image of ℤ r₀ is an infinite subset of 𝔾_a(k) = k because char k = 0; an infinite subset of the affine line is Zariski dense.
3. The Zariski closure of the image equals the image of the closure under a closed immersion.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.0/symplectic-transvection`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.

**Acceptance.**

- V = k², v = e: the closure of {[[1, n], [0, 1]]} is the upper unipotent subgroup.
- In characteristic p the closure of ℤ is finite; the hypothesis char k = 0 is needed.

**Sources.**

- lv2020, §2.7, proof of Lemma 2.13, p. 15: The algebraic-group generation uses the full unipotent subgroups, which this lemma extracts from the integer powers.

**Signature gap:** Named theorem interfaces — LV.0.

### Two transvections with nonzero pairing (LV Lemma 2.13)

**Node:** `MordellLawrenceVenkatesh:LV.0/transvection-pair-closure` · lemma; implementation unchecked.

Let (V, ω) be symplectic over a field k of characteristic zero and v₁, v₂ ∈ V linearly independent with ⟨v₁, v₂⟩ ≠ 0. The Zariski closure of the subgroup generated by T_{v₁} and T_{v₂} contains T_v^r for every v ∈ span(v₁, v₂) and every r ∈ k; in fact it contains the subgroup Sp(P) × 1 of Sp(V) for P = span(v₁, v₂), acting trivially on P^⊥.

**Hypotheses.** char k = 0; v₁, v₂ linearly independent; ⟨v₁, v₂⟩ ≠ 0.

**Construction or proof.**

1. P = span(v₁, v₂) is a nondegenerate plane, V = P ⊕ P^⊥, and T_{v₁}, T_{v₂} act trivially on P^⊥.
2. The closure contains U_{v₁} and U_{v₂} (Zariski closure of transvection powers).
3. In the basis (v₁, v₂/⟨v₁,v₂⟩) of P, U_{v₁} and U_{v₂} are the upper and lower elementary unipotent subgroups of SL(P) = Sp(P); every element of SL(2, k) is a product of elementary transvections, so the closure contains SL(P) × 1.
4. For v ∈ P, T_v^r restricted to P lies in Sp(P) and is the identity on P^⊥.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.0/zariski-closure-transvection-powers`; `mathlib:Matrix.SL2.transvection_induction`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.

**Acceptance.**

- V = k², v₁ = e, v₂ = f: the closure of ⟨[[1,1],[0,1]], [[1,0],[−1,1]]⟩ (a finite-index subgroup of SL₂(ℤ)) is SL₂.
- If ⟨v₁, v₂⟩ = 0 the two transvections commute and the closure is two-dimensional unipotent.

**Sources.**

- lv2020, §2.7, Lemma 2.13, p. 15: Statement (LV work over ℚ; the proof is valid over any field of characteristic zero).

**Signature gap:** Named theorem interfaces — LV.0.

### Transvections along a connected intersection graph (LV Lemma 2.14)

**Node:** `MordellLawrenceVenkatesh:LV.0/transvection-graph-closure` · lemma; implementation unchecked.

Let (V, ω) be symplectic over a field k of characteristic zero and S ⊆ V a finite set of vectors. Form the graph on S with an edge between v, v' when ⟨v, v'⟩ ≠ 0. If this graph is connected then the Zariski closure of the subgroup generated by {T_v : v ∈ S} contains T_w for every w in the span of S. If moreover S spans V, the closure is Sp(V).

**Hypotheses.** char k = 0; S finite with connected intersection graph.

**Construction or proof.**

1. Induct on |S|: remove a vertex v whose deletion leaves S₀ connected (a leaf of a spanning tree); by induction the closure G contains T_w for all w ∈ W = span(S₀).
2. For w ∈ W with ⟨w, v⟩ ≠ 0, the transvection-pair lemma applied to T_w, T_v (both in G) gives T_x ∈ G for x = w + v, and T_{cx} for all c.
3. The set {w ∈ W : ⟨w, v⟩ ≠ 0} is a nonempty Zariski-open subset of W (nonempty since v has a neighbour in S₀), so {T_{w+v}} is dense in {T_{w+v} : w ∈ W} and the closedness of G gives all T_x for x ∈ W + kv.
4. If S spans V, the transvections generate Sp(V) as an abstract group, so the closure is Sp(V).

The last sentence (generation of Sp(V) by transvections when S spans) is the form used in LV Lemma 8.9; generation of Sp(V) by symplectic transvections is requested from ReductiveGroups Layer 7 together with the other structure of Sp. Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.0/transvection-pair-closure`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `LefschetzPencilsAndVanishingCycles:LPV.5`.

**Acceptance.**

- A symplectic basis e₁, f₁, e₂, f₂ is not connected; adding e₁ + e₂ connects it.
- For S a chain of vanishing cycles the closure is Sp(span S).

**Sources.**

- lv2020, §2.7, Lemma 2.14, p. 15: Statement; the proof is the induction reproduced above.

**Signature gap:** Named theorem interfaces — LV.0.

### Goursat's lemma for simple Lie algebras (Ribet)

**Node:** `MordellLawrenceVenkatesh:LV.0/lie-algebra-goursat` · lemma; implementation unchecked.

Let 𝔤₁, …, 𝔤_N be simple Lie algebras over a field k and 𝔥 ⊆ 𝔤₁ × ⋯ × 𝔤_N a Lie subalgebra whose projection to 𝔤_i × 𝔤_j is surjective for every pair i < j (and to each 𝔤_i when N = 1). Then 𝔥 = 𝔤₁ × ⋯ × 𝔤_N.

**Hypotheses.** each 𝔤_i simple (LieAlgebra.IsSimple); all pairwise projections surjective.

**Construction or proof.**

1. Induct on the number of factors. The projection to the first n−1 factors is the whole product by the induction hypothesis.
2. Apply the general kernel/quotient Goursat construction to h ≤ (∏ᵢ<n sᵢ) × sₙ. Its kernel in the first product is an ideal, hence a product of factors by ideals-of-simple-products.
3. If the last projection kernel is all of sₙ, h is the product. Otherwise the quotient of the first product is simple and isomorphic to sₙ, hence exactly one surviving factor; the corresponding pairwise projection is a graph, contradicting pairwise surjectivity.

**Prerequisites.** `mathlib:LieAlgebra.IsSimple`; `MordellLawrenceVenkatesh:LV.0/two-factor-lie-goursat`; `MordellLawrenceVenkatesh:LV.0/ideals-of-simple-products`.

**Acceptance.**

- 𝔤 × 𝔤 with the diagonal: not surjective onto the pair, and indeed a proper subalgebra.
- N = 3 with 𝔥 = {(x, y, x)}: fails the hypothesis for the pair (1, 3).

**Sources.**

- lv2020, §2.7, before Lemma 2.12, p. 14: LV cite Ribet's Lemma 5.2.1 for the Lie-algebra Goursat lemma used in Lemma 2.12.

**Signature gap:** Named theorem interfaces — LV.0.

### A closed subgroup of Sp(V) × Sp(V) with surjective projections and an unbalanced unipotent pair

**Node:** `MordellLawrenceVenkatesh:LV.0/symplectic-pair-lemma` · lemma; implementation unchecked.

Let k be an algebraically closed field of characteristic zero, (V, ω) symplectic of dimension ≥ 2 and G ⊆ Sp(V) × Sp(V) a Zariski-closed subgroup whose projections π₁, π₂ to both factors are surjective. If some g ∈ G has π₁(g), π₂(g) unipotent with fixed spaces of different dimensions, then Lie(G) = 𝔰𝔭(V) × 𝔰𝔭(V) and G = Sp(V) × Sp(V).

**Hypotheses.** k algebraically closed of characteristic 0; π₁(G) = π₂(G) = Sp(V); g ∈ G with π₁(g), π₂(g) unipotent and dim Fix π₁(g) ≠ dim Fix π₂(g).

**Construction or proof.**

1. Lie(G) ⊆ 𝔰𝔭(V) × 𝔰𝔭(V) projects onto both factors (surjective homomorphisms of smooth groups in characteristic zero are surjective on Lie algebras).
2. By Goursat for the simple Lie algebra 𝔰𝔭(V), either Lie(G) is the whole product (then G° = Sp(V)² since Sp(V) is connected, so G = Sp(V)²), or Lie(G) is the graph of an automorphism θ of 𝔰𝔭(V).
3. In the second case θ = Ad(h) for some h ∈ Sp(V)(k) (automorphisms of 𝔰𝔭(V) over an algebraically closed field are inner), and G° is the graph {(x, hxh^{-1})} (connected subgroups are determined by their Lie algebras in characteristic zero).
4. Every (a, b) ∈ G normalizes G°, so a⁻¹h⁻¹bh centralizes Sp(V) and b = ±hah⁻¹ (centre {±1}).
5. Apply this to g: π₂(g) = ±hπ₁(g)h⁻¹; a unipotent element is not the negative of a unipotent element in characteristic zero, so π₂(g) = hπ₁(g)h⁻¹ has a fixed space of the same dimension — a contradiction.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation — ReductiveGroups Layer 2 (Lie algebras of algebraic groups); tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components); tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups — ReductiveGroups Layer 6 (reductive and semisimple groups, centres); tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory — ReductiveGroups Layer 7 (structure theory). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.0/lie-algebra-goursat`; `tauceti:TauCeti.Symplectic.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra`; `tauceti:LinearMap.GeneralLinearGroup.IsUnipotent`; `mathlib:LieAlgebra.Symplectic.sp`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `MordellLawrenceVenkatesh:LV.0/two-factor-lie-goursat`.

**Acceptance.**

- The diagonal subgroup satisfies the projection hypothesis but has no unbalanced pair.
- For V = k² with g = (u, 1), u a nontrivial transvection, the lemma gives SL₂ × SL₂.

**Sources.**

- lv2020, §2.7, Lemma 2.12, p. 14–15: The unipotent hypothesis whose role is made explicit in proof step 5 (LV give no written proof).

**Signature gap:** Named theorem interfaces — LV.0.

### Zariski-closed subgroups of Sp(V)^N (LV Lemma 2.12)

**Node:** `MordellLawrenceVenkatesh:LV.0/symplectic-goursat` · theorem; implementation unchecked.

Let k be a field of characteristic zero, (V, ω) a symplectic space of dimension ≥ 2 and G ⊆ Sp(V)^N a Zariski-closed subgroup such that (i) each projection π_i : G → Sp(V) is surjective and (ii) for all i ≠ j there is g ∈ G with π_i(g), π_j(g) unipotent with fixed spaces of different dimensions. Then G = Sp(V)^N.

**Hypotheses.** char k = 0; (i) surjective projections; (ii) unbalanced unipotent pairs for all i ≠ j.

**Construction or proof.**

1. Base change to an algebraic closure k̄: the hypotheses persist (surjectivity and closedness are geometric; the elements g are k-points) and G = Sp(V)^N can be checked over k̄.
2. For each pair i < j apply the pair lemma to the image of G in Sp(V) × Sp(V) (closed, as the image of a homomorphism of algebraic groups): Lie of that image is 𝔰𝔭(V)².
3. Hence Lie(G) ⊆ 𝔰𝔭(V)^N surjects onto every pair of factors; by the Lie-algebra Goursat lemma Lie(G) = 𝔰𝔭(V)^N.
4. G° is a connected closed subgroup of the connected group Sp(V)^N with the same Lie algebra, hence G° = Sp(V)^N and G = Sp(V)^N.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation — ReductiveGroups Layer 2 (Lie algebras of algebraic groups); tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.0/symplectic-pair-lemma`; `MordellLawrenceVenkatesh:LV.0/lie-algebra-goursat`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`.

**Acceptance.**

- N = 1: the statement reduces to hypothesis (i).
- The variant in LV Lemma 4.3: SL₂ = Sp₂, and an element (1, …, u, …, 1) with u a nontrivial unipotent gives the unbalanced pairs.

**Sources.**

- lv2020, §2.7, Lemma 2.12, p. 14–15: Statement of Lemma 2.12 (continued by condition (ii) and the conclusion G = Sp(V)^N).

**Signature gap:** Named theorem interfaces — LV.0.

### Idempotent decomposition of a module over a split étale algebra

**Node:** `MordellLawrenceVenkatesh:LV.0/galois-module-splitting` · lemma; implementation unchecked.

For a finite set I, a commutative field Ω and any module M over Ω^I, multiplication by the coordinate idempotents gives a natural Ω-linear equivalence M ≃ ⊕ᵢ eᵢM. Applied to E ⊗_F Ω ≃ Ω^Hom_F(E,Ω), eτM is exactly the simultaneous eigenspace (e ⊗ 1)m = τ(e)m. No finite-dimensionality of M is required.

**Hypotheses.** I finite; Ω a field; M a unital Ω^I-module.

**Construction or proof.**

1. The orthogonal coordinate idempotents sum to 1; m maps to (eᵢm)ᵢ and the inverse sums the components.
2. Orthogonality proves both composites are identities; intertwining the E-action identifies the eigenspaces.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.0/galois-tensor-splitting`.

**Owner proposal.** SchemeAndStackFoundations; General finite étale algebra and its module-idempotent decomposition. Extend SF.0 via Part II; field/CRT baseline is reused.

**Acceptance.**

- For ℚ(i) ⊗ ℂ, the two idempotents split a module into the i and −i eigenspaces.
- For I empty, the unital module is zero; for I singleton the decomposition is the identity.

**Sources.**

- lv2020, §2.1, proof of Lemma 2.1, p. 9: The splitting used in the proof of Lemma 2.1; the node isolates it as a lemma.

**Signature gap:** Named theorem interfaces — LV.0.

### Two-factor Goursat dichotomy for simple Lie algebras

**Node:** `MordellLawrenceVenkatesh:LV.0/two-factor-lie-goursat` · lemma; implementation unchecked.

Let k be a field and s,t nonabelian simple k-Lie algebras. If h ≤ s × t projects surjectively to both factors, either h = s × t or h is the graph of a k-Lie equivalence s ≃ t.

**Hypotheses.** s and t nonabelian simple k-Lie algebras; h projects onto each factor.

**Construction or proof.**

1. The kernels of the two restricted projections induce ideals I = {x | (x,0) ∈ h} in s and J = {y | (0,y) ∈ h} in t: lift any element of a factor to h before taking the bracket.
2. Simplicity makes I and J either zero or the whole factor. If either is whole, surjectivity shows both are whole and h is the product.
3. Otherwise both projections are bijective; compose one inverse with the other to obtain the equivalence and graph description.

**Prerequisites.** The elementary field/module carrier specified above..

**Owner proposal.** tauceti:TauCetiRoadmap/ReductiveGroups; Reusable linear/group theory; compare pinned carriers before transfer. Current accepted IDs remain stable.

**Acceptance.**

- The diagonal in sl₂(k) × sl₂(k) is the graph case.
- The product has both kernel ideals nonzero.
- Nonabelian simplicity is essential: an abelian diagonal cannot be handled by the later product-ideal argument.

**Sources.**

- lv2020, §2.6, proof of Lemma 2.12, p. 14: Expanded linear-algebra input of the graph case, not a theorem asserted by an upstream stage.

**Signature gap:** Named theorem interfaces — LV.0.

### Ideals in a finite product of nonabelian simple Lie algebras

**Node:** `MordellLawrenceVenkatesh:LV.0/ideals-of-simple-products` · lemma; implementation unchecked.

If (sᵢ)ᵢ∈I is a finite family of nonabelian simple k-Lie algebras, every ideal in ∏ᵢ sᵢ is the product of a subset of the factors.

**Hypotheses.** I finite; each sᵢ nonabelian simple.

**Construction or proof.**

1. For x in the ideal and xᵢ ≠ 0, bracket x with vectors supported in coordinate i. Since the centre of a nonabelian simple Lie algebra is zero, one such bracket is nonzero.
2. These brackets lie in the intersection of the ideal with the i-th factor, which is an ideal there and hence the whole factor.
3. Subtract all the resulting coordinate vectors from x; finiteness proves that the original ideal is precisely the sum/product of its nonzero coordinate factors.

**Prerequisites.** The elementary field/module carrier specified above..

**Owner proposal.** tauceti:TauCetiRoadmap/ReductiveGroups; Reusable linear/group theory; compare pinned carriers before transfer. Current accepted IDs remain stable.

**Acceptance.**

- There is no diagonal ideal in s × s when s is nonabelian simple.
- Zero and the whole product correspond to the empty and full subsets.

**Sources.**

- lv2020, §2.6, proof of Lemma 2.12, p. 14: Expanded ideal argument needed in the inductive multi-factor Goursat proof.

**Signature gap:** Named theorem interfaces — LV.0.

### Exact follow-ups for LV.0

- Supply/resolve LV-import-01 — Closures of abstract algebraic subgroups (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-02 — Lie differentials and connected subgroup equality (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-03 — Normal subgroups of symplectic groups (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-04 — Symplectic Lie structure and transvections (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — semilinear-centralizer (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — symplectic-transvection (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.0 (exact interface and affected nodes are in gaps).
- Resolve exact supplier contracts LV-import-01, LV-import-02, LV-import-03, LV-import-04, LV-import-05, LV-import-76; the stage imports name plans, not proofs.

## LV.1 — Galois representations: Faltings's finiteness lemma, friendly places and purity of Hodge weights

### Semisimple representations in characteristic zero are determined by their traces

**Node:** `MordellLawrenceVenkatesh:LV.1/trace-determines-semisimple` · theorem; implementation unchecked.

Let G be a group, k a field of characteristic zero and V, W finite-dimensional semisimple k-linear representations of G with tr(g | V) = tr(g | W) for every g ∈ G. Then V ≅ W as representations.

**Hypotheses.** char k = 0; V, W finite-dimensional and semisimple.

**Construction or proof.**

1. Replace k[G] by its finite-dimensional image A in End(V⊕W). Both V and W are semisimple A-modules and their sum is faithful; the Jacobson radical kills every simple module, so faithfulness makes it zero.
2. Use the finite-dimensional semisimple-algebra decomposition of A. Each primitive central idempotent e_i projects onto the i-th simple isotypic summand.
3. Equality of traces on all group elements extends k-linearly to A. Thus the traces of e_i on V and W agree. Each trace is multiplicity times the positive k-dimension of the corresponding simple module; characteristic zero forces equal multiplicities.
4. The semisimple modules are therefore isomorphic. Compare with the pinned TauCeti Hom-dimension multiplicity criterion; neither a splitting-field assumption nor semisimplicity of the full infinite group algebra is used.

Wedderburn–Artin in algebra form is Mathlib IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing; the multiplicity criterion is the cited Tau Ceti theorem.

**Prerequisites.** `tauceti:TauCeti.nonempty_linearEquiv_of_finrank_linearMap_eq`; `mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`; `mathlib:Representation`; `mathlib:Representation.asModule`.

**Acceptance.**

- For a finite group this recovers Representation.nonempty_equiv_of_character_eq.
- The hypothesis char k = 0 is needed: over 𝔽_p, V and V ⊕ V^{⊕ p} have the same traces.

**Sources.**

- deligne-bourbaki-616, §3, proof of Théorème 3.1, p. 17 (numdam file): Deligne's argument ends by concluding from equality of characters that the semisimple representations are isomorphic; this node is that step.

### Finiteness of integer Weil polynomials of fixed degree and weight

**Node:** `MordellLawrenceVenkatesh:LV.1/weil-polynomials-finite` · lemma; implementation unchecked.

For a real number q > 1 and integers d ≥ 0 and w, the set of monic P ∈ ℤ[X] of degree d all of whose complex roots have absolute value q^{w/2} is finite.

**Hypotheses.** q > 1; d ≥ 0.

**Construction or proof.**

1. By the coefficient bound for monic split polynomials over ℂ with roots of norm ≤ B = q^{w/2}, the i-th coefficient has absolute value at most B^{d−i}·C(d, i).
2. The coefficients are integers bounded independently of P, so there are finitely many possibilities.

**Prerequisites.** `mathlib:Polynomial.coeff_le_of_roots_le`.

**Acceptance.**

- For q = p, d = 2, w = 1, the polynomials X² − aX + p with |a| ≤ 2√p are examples; X² − p is also in the stated set, so the positive-constant-term list is not exhaustive.
- d = 0: only P = 1.

**Sources.**

- faltings-1983, §5, proof of Satz 5, p. 362: Faltings uses exactly this finiteness (via the Weil conjectures) for the local L-factors.

**Signature gap:** Named theorem interfaces — LV.1.

### A finite set of Frobenius traces determines a representation (Faltings–Deligne)

**Node:** `MordellLawrenceVenkatesh:LV.1/frobenius-test-set` · theorem; implementation unchecked.

Let K be a number field, T a finite set of finite places of K, p a prime and d ≥ 1. There is a finite set T' of finite places of K, disjoint from T, with the following property: if ρ₁, ρ₂ : G_K → GL_d(ℚ_p) are continuous representations unramified outside T such that tr ρ₁(Frob_v) = tr ρ₂(Frob_v) for all v ∈ T', then tr ρ₁ = tr ρ₂ on G_K; if moreover ρ₁ and ρ₂ are semisimple, then ρ₁ ≅ ρ₂.

**Hypotheses.** K a number field; T finite set of finite places (in applications T contains the places above p); continuous representations of dimension d unramified outside T.

**Construction or proof.**

1. Let K'' be the compositum of all finite Galois extensions of K of degree at most p^{2d²} unramified outside T; it is a finite Galois extension of K by Hermite–Minkowski.
2. By Chebotarev choose a finite set T' of finite places of K, disjoint from T and unramified in K'', whose Frobenius classes cover Gal(K''/K).
3. Given ρ₁, ρ₂, choose G_K-stable ℤ_p-lattices (compactness) and let M ⊆ M_d(ℤ_p) × M_d(ℤ_p) be the ℤ_p-span of the image of G_K under ρ₁ × ρ₂; M is a ℤ_p-subalgebra, free of rank ≤ 2d², spanned by the image of G_K.
4. The image of G_K in (M/pM)^× has fewer than p^{2d²} elements and is cut out by a Galois extension of K unramified outside T, hence of K''; so every element of this image is the image of a conjugate of some Frob_v, v ∈ T'.
5. The linear form δ = tr ∘ pr₁ − tr ∘ pr₂ on M vanishes on all conjugates of ρ(Frob_v), v ∈ T' (traces are conjugation invariant); these elements span M/pM, so by Nakayama they span M over ℤ_p, and δ = 0 on M ⊇ ρ(G_K).
6. If ρ₁, ρ₂ are semisimple, equality of traces gives ρ₁ ≅ ρ₂ (trace criterion over ℚ_p).

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev — Chebotarev Layer 10 (Dirichlet-density Chebotarev, infinitude of every Frobenius class). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.1/trace-determines-semisimple`; `FaltingsFinitenessAndIsogenyTheorems:R28.1/hermite-minkowski-finiteness-of-extensions-unramified-outside-S`; `ArithmeticGaloisRepresentations:R01.1`; `mathlib:IsArithFrobAt`; `tauceti:NumberField.artinSymbol`; `mathlib:Submodule.le_of_le_smul_of_le_jacobson_bot`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Acceptance.**

- K = ℚ, T = {p}, d = 1: T' reduces to a set of primes whose classes generate the relevant ray class group.
- Two non-isomorphic non-semisimple representations with the same semisimplification show the semisimplicity hypothesis is needed for the last clause.

**Sources.**

- deligne-bourbaki-616, §3, proof of Théorème 3.1, pp. 17–18 (numdam file): Deligne's Nakayama step (OCR of the numdam scan): the Frobenius images generate M linearly.
- faltings-1983, §5, proof of Satz 5, pp. 362–363: Faltings's version of the same argument (for Tate modules), with the rank bound on M.
- lv2020, §2.3, proof of Lemma 2.3, p. 10: LV cite this argument for Lemma 2.3.

**Signature gap:** Named theorem interfaces — LV.1.

### Faltings's finiteness lemma (LV Lemma 2.3)

**Node:** `MordellLawrenceVenkatesh:LV.1/faltings-finiteness` · theorem; implementation unchecked.

Let K be a number field, T a finite set of finite places of K, p a prime and w, d ≥ 0 integers. Up to isomorphism there are only finitely many semisimple continuous representations ρ : G_K → GL_d(ℚ_p) that are unramified outside T, pure of weight w outside T and have integral Frobenius polynomials outside T. (LV state the lemma with 'unramified outside S' for a set S not containing the places above p, while applying it to p-adic cohomology; the correct and intended hypothesis allows T to contain the places above p.)

**Hypotheses.** T finite set of finite places, containing the places above p in all applications; ρ semisimple, continuous, of dimension d; for v ∉ T: ρ unramified at v, the characteristic polynomial of ρ(Frob_v^geom) lies in ℤ[X] and has all complex roots of absolute value q_v^{w/2}.

**Construction or proof.**

1. If d = 0 there is only the zero representation. For the remaining proof assume d ≥ 1, as required by the Frobenius test-set lemma.
2. Let T' be a Frobenius test set for (K, T, p, d).
3. For v ∈ T' the characteristic polynomial of ρ(Frob_v^geom) is one of the finitely many integer Weil polynomials of degree d and weight w for q = q_v; it determines the characteristic polynomial, hence the trace, of ρ(Frob_v) = ρ(Frob_v^geom)^{-1}.
4. So the tuple (tr ρ(Frob_v))_{v∈T'} takes finitely many values, and representations with the same tuple are isomorphic by the test-set theorem.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.1/frobenius-test-set`; `MordellLawrenceVenkatesh:LV.1/weil-polynomials-finite`; `WeightsInEtaleCohomology:R34.1`; `DeligneWeightsAndPurity:DWP.0`.

**Acceptance.**

- d = 1, w = 0, T = ∅ over ℚ: only the trivial character (finite order characters unramified everywhere).
- Without integrality the lemma fails: twists by characters with algebraic non-integral Frobenius values of the right absolute value.

**Sources.**

- lv2020, §2.3, Lemma 2.3, p. 9: Statement of Lemma 2.3 (continued by the integrality condition (c)).

**Planet:** Faltings’s finiteness lemma.

**Signature gap:** Named theorem interfaces — LV.1.

### CM or totally real fields via complex conjugations

**Node:** `MordellLawrenceVenkatesh:LV.1/cm-or-totally-real-criterion` · lemma; implementation unchecked.

Fix an algebraic closure ℚ̄ and let C ⊆ Gal(ℚ̄/ℚ) be the set of complex conjugations (the automorphisms ι⁻¹ ∘ conj ∘ ι for embeddings ι : ℚ̄ → ℂ). A number field F ⊆ ℚ̄ is totally real or CM if and only if c₁c₂ fixes F pointwise for all c₁, c₂ ∈ C. In that case there is an automorphism s_F of F with s_F² = 1 and c ∘ τ = τ ∘ s_F for every c ∈ C and every embedding τ : F → ℚ̄; s_F = 1 iff F is totally real, and s_F is the complex conjugation of F when F is CM.

**Hypotheses.** F ⊆ ℚ̄ a number field.

**Construction or proof.**

1. If F is CM, every complex embedding φ satisfies φ ∘ complexConj = conj ∘ φ; translating through ι gives c ∘ τ = τ ∘ s_F for all c ∈ C and τ, hence c₁c₂τ = τ. If F is totally real, every c ∈ C fixes every τ(F).
2. Conversely the hypothesis is conjugation invariant, so c₁c₂ ∘ τ = τ for every τ, i.e. c ∘ τ is independent of c ∈ C.
3. Taking τ the inclusion and c' = gcg⁻¹ with g ∈ Gal(ℚ̄/F) shows c(F) is fixed by Gal(ℚ̄/F), so c(F) = F and s_F := c|_F is an automorphism with c ∘ τ = τ ∘ s_F for all τ.
4. If s_F = 1 all embeddings are real; otherwise F^{s_F} is totally real, [F : F^{s_F}] = 2 and no embedding of F is real, so F is CM (Milne, Proposition 1.4 (b) ⇒ (a)).

**Prerequisites.** `mathlib:NumberField.IsCMField`; `mathlib:NumberField.IsCMField.complexEmbedding_complexConj`; `mathlib:NumberField.maximalRealSubfield`.

**Acceptance.**

- ℚ(i) is CM with s = conjugation; ℚ(√2) is totally real; ℚ(2^{1/3}) is neither, and indeed two complex conjugations act differently on its conjugate fields.

**Sources.**

- milne-cm, Chapter I, Proposition 1.4 and Remark 1.6, p. 10: Proposition 1.4 (b): a CM field is characterized by a single automorphism realizing complex conjugation under every embedding.
- milne-cm, Chapter I, Remark 1.6, p. 10: The fixed-field description used in the converse direction.

**Signature gap:** Named theorem interfaces — LV.1.

### The largest CM-or-totally-real subfield of a number field

**Node:** `MordellLawrenceVenkatesh:LV.1/largest-cm-subfield` · definition; implementation unchecked.

Let K ⊆ ℚ̄ be a number field, H ⊆ Gal(ℚ̄/ℚ) the closed subgroup topologically generated by {c₁c₂ : c₁, c₂ ∈ C} and H⁺ the closed subgroup generated by C. Put E_K := K ∩ ℚ̄^H and E_K⁺ := K ∩ ℚ̄^{H⁺}. Then E_K⁺ is the maximal totally real subfield of K, E_K is the largest subfield of K that is totally real or CM, [E_K : E_K⁺] ≤ 2, and E_K is CM if and only if K has a CM subfield (in which case E_K is the maximal CM subfield of LV Definition 2.7 and E_K⁺ its maximal totally real subfield).

**Hypotheses.** K ⊆ ℚ̄ a number field.

**Construction or proof.**

1. A subfield F ⊆ K is fixed by H iff it is totally real or CM (criterion lemma), so E_K is the largest such subfield; similarly F is fixed by H⁺ iff it is totally real.
2. H has index at most 2 in H⁺ (every c ∈ C lies in cH for a fixed c), so [E_K : E_K⁺] ≤ 2.
3. If K contains a CM field F then F ⊆ E_K is not totally real, so E_K ≠ E_K⁺ and E_K is CM; conversely E_K CM gives a CM subfield.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.1/cm-or-totally-real-criterion`; `mathlib:InfiniteGalois.fixedField_fixingSubgroup`; `mathlib:InfiniteGalois.fixingSubgroup_fixedField`; `mathlib:NumberField.maximalRealSubfield`.

**Uses.**

- MordellLawrenceVenkatesh:LV.1/infinity-type-factorization: factor infinity types and determine friendly places. The consumer is Functions on embeddings with constant conjugate sum factor through the largest CM subfield (Artin–Weil).
- MordellLawrenceVenkatesh:LV.1/friendly-place: factor infinity types and determine friendly places. The consumer is Friendly places (LV Definition 2.7).
- MordellLawrenceVenkatesh:LV.11/friendly-auxiliary-place: factor infinity types and determine friendly places. The consumer is Choice of the friendly place v (LV §5).

**Planning API.**

- `largestCMSubfield` (constructor; signature stated): E_K as an IntermediateField ℚ K.
- `largestTotallyRealSubfield` (constructor; signature stated): E_K⁺, equal to Mathlib's maximalRealSubfield K.
- `largestTotallyRealSubfield_eq_maximalRealSubfield` (compatibility; signature stated): E_K⁺ = NumberField.maximalRealSubfield K as subfields of K.
- `le_largestCMSubfield_iff` (characterisation; signature stated): A subfield F ≤ K satisfies F ≤ E_K iff F is totally real or CM.
- `isCMField_largestCMSubfield_iff` (characterisation; signature partial): IsCMField E_K ↔ K has a CM subfield ↔ E_K ≠ E_K⁺.
  The prototype proves equivalence with existence of a CM subfield. The additional equivalence with E_K≠E_K⁺ needs the tower/type comparison.
- `finrank_largestCMSubfield_div` (other; signature stated): [E_K : E_K⁺] ∈ {1, 2}.
- `largestCMSubfield_map` (functoriality; signature stated): For a field isomorphism σ : K ≃ K', σ(E_K) = E_{K'}.
- `embeddings_eq_on_largestCMSubfield_iff` (characterisation; signature omitted): Two embeddings τ, τ' : K → ℚ̄ agree on E_K iff τ' = hτ for some h in the closure H.
- `largestCMSubfield_cyclotomic` (example; signature omitted): E_{ℚ(ζ_n)} = ℚ(ζ_n) for n ≥ 3; E_{ℚ(2^{1/3})} = ℚ.

**Mathematical tests.**

- `largestCMSubfield.reviewTest1` (computation; signature stated): For every CM number field K, E_K=K; in particular this applies to ℚ(i,√2).
- `largestCMSubfield.reviewTest2` (degenerate; signature stated): For every totally real number field K, E_K=K and E_K⁺=K.
- `largestCMSubfield.reviewTest3` (non-example; signature stated): If [K:ℚ]=3 and K is not totally real, E_K=ℚ; this distinguishes ℚ(real cube root of 2) from a totally real cubic field.

**Acceptance.**

- K = ℚ(ζ_n), n ≥ 3: E_K = K.
- K = ℚ(2^{1/3}): E_K = E_K⁺ = ℚ.
- K = ℚ(i, √2) = ℚ(ζ₈) is CM, so E_K = K; in particular a field containing i and a fourth root of 2 has a CM subfield strictly larger than ℚ(i).
- E_{ℚ(i,√2)}=ℚ(i,√2) and E⁺=ℚ(√2).
- For a totally real number field K, E_K=E_K⁺=K.
- For K=ℚ(real cube root of 2), E_K=ℚ, although the chosen embedding of K is real.

**Sources.**

- milne-cm, Chapter I, Remark 1.7, pp. 10–11: Existence of the largest totally real subfield; the remark continues with the largest CM subfield K ∩ ℚ^cm.
- milne-cm, Chapter I, Corollary 1.5, p. 10: Why a largest CM subfield exists.

**Planet:** Largest CM subfield.

**Signature gap:** Suggested signatures — largest-cm-subfield.

### Functions on embeddings with constant conjugate sum factor through the largest CM subfield (Artin–Weil)

**Node:** `MordellLawrenceVenkatesh:LV.1/infinity-type-factorization` · lemma; implementation unchecked.

Let K ⊆ ℚ̄ be a number field, w ∈ ℤ and m : Hom(K, ℚ̄) → ℤ with m(c ∘ τ) + m(τ) = w for all τ and all complex conjugations c ∈ C. Then m(τ) depends only on τ|_{E_K}. If K has no CM subfield then m(τ) = w/2 for all τ; in particular w is even.

**Hypotheses.** m(c∘τ) + m(τ) = w for all c ∈ C and all τ.

**Construction or proof.**

1. For c₁, c₂ ∈ C, m(c₁c₂τ) = w − m(c₂τ) = m(τ); so m is invariant under the subgroup generated by the c₁c₂, and, being locally constant for the (continuous) action on the finite set Hom(K, ℚ̄), under its closure H.
2. By the infinite Galois correspondence, two embeddings that agree on E_K = K ∩ ℚ̄^H differ by an element of H; hence m factors through restriction to E_K.
3. If K has no CM subfield then E_K is totally real, so c ∘ τ and τ agree on E_K; hence m(cτ) = m(τ) and 2m(τ) = w.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.1/largest-cm-subfield`; `mathlib:InfiniteGalois.fixedField_fixingSubgroup`.

**Acceptance.**

- K = ℚ(i), m(id) = 1, m(conj) = 0, w = 1: the infinity type of the CM elliptic curve with multiplication by ℤ[i].
- K = ℚ: m ≡ w/2.

**Sources.**

- milne-cm, Chapter I, Infinity types, proof of Proposition 4.9, pp. 37–38: The factorization step (a) ⇒ (b)(i) of Proposition 4.9.
- milne-cm, Chapter I, Infinity types, proof of Proposition 4.9, p. 38: The case without CM subfield.
- lv2020, §2.4, before the proof of Lemma 2.8, p. 12: LV's statement of the input.

**Signature gap:** Named theorem interfaces — LV.1.

### Friendly places (LV Definition 2.7)

**Node:** `MordellLawrenceVenkatesh:LV.1/friendly-place` · definition; implementation unchecked.

Let K be a number field and v a finite place of K. If K has a CM subfield, v is friendly when it is unramified over ℚ and lies above a place of E_K⁺ that is inert in the CM field E_K. If K has no CM subfield, v is friendly when it is unramified over ℚ.

**Hypotheses.** K a number field; v a finite place of K.

**Construction or proof.**

1. Define IsFriendly v by cases on whether E_K is CM, using the largest CM subfield and the decomposition behaviour of the place of E_K⁺ below v.
2. Record the group-theoretic reformulation: for an embedding ι_p : ℚ̄ → ℚ̄_p inducing v on K and its decomposition group D ⊆ Gal(ℚ̄/ℚ), v is friendly iff v is unramified over ℚ and, when E_K is CM, some δ ∈ D satisfies δ ∘ τ = τ ∘ s_{E_K} on E_K for the embedding τ = inclusion.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.1/largest-cm-subfield`; `mathlib:IsArithFrobAt`.

**Uses.**

- MordellLawrenceVenkatesh:LV.1/friendly-exponent-half: force equal conjugate Hodge weights at the chosen place. The consumer is At a friendly place a place-constant function with the conjugation relation takes the value w/2.
- MordellLawrenceVenkatesh:LV.6/legendre-generic-simplicity: force equal conjugate Hodge weights at the chosen place. The consumer is Generic simplicity of the Legendre curves (LV Lemma 4.4).
- MordellLawrenceVenkatesh:LV.7/generic-simplicity-sublemma: force equal conjugate Hodge weights at the chosen place. The consumer is Bad points produce a Frobenius-stable subspace with large Hodge filtration (Sublemma in LV §6).
- MordellLawrenceVenkatesh:LV.11/friendly-auxiliary-place: force equal conjugate Hodge weights at the chosen place. The consumer is Choice of the friendly place v (LV §5).

**Planning API.**

- `IsFriendly` (constructor; signature omitted): The predicate on HeightOneSpectrum (𝓞 K).
- `IsFriendly.isUnramified` (projection; signature omitted): A friendly place is unramified over ℚ.
- `isFriendly_iff_of_not_hasCMSubfield` (characterisation; signature omitted): If K has no CM subfield, IsFriendly v ↔ v is unramified over ℚ.
- `isFriendly_iff_exists_decomposition` (characterisation; signature omitted): IsFriendly v ↔ v unramified over ℚ ∧ (E_K CM → ∃ δ in the decomposition group at v with δ acting on E_K as its complex conjugation).
- `isFriendly_of_frobenius` (other; signature omitted): If Frob_℘ ∈ Gal(K'/ℚ) (K' Galois over ℚ containing K) restricts to the nontrivial automorphism of E_K over E_K⁺, then the place of K below ℘ is friendly when unramified over ℚ (used with Chebotarev in LV.11).
- `isFriendly_map` (functoriality; signature omitted): Friendliness is preserved by isomorphisms of number fields.
- `isFriendly_rat` (example; signature omitted): Over ℚ every prime is friendly; over ℚ(i) exactly the primes above p ≡ 3 mod 4.

**Mathematical tests.**

- `IsFriendly.reviewTest1` (computation; signature omitted): For K=ℚ(i), the place above 3 is friendly, while either place above 5 is not.
- `IsFriendly.reviewTest2` (degenerate; signature omitted): Every unramified finite place of a number field with no CM subfield is friendly.
- `IsFriendly.reviewTest3` (non-example; signature omitted): The ramified place above 2 of ℚ(i) is not friendly.

**Acceptance.**

- K = ℚ: every prime is friendly.
- K = ℚ(i): v is friendly iff it lies above p ≡ 3 mod 4.
- K = ℚ(2^{1/3}): every place unramified over ℚ is friendly.

**Sources.**

- lv2020, §2.4, Definition 2.7, p. 12: The definition, continued by the no-CM case.

**Planet:** Friendly place.

**Signature gap:** Suggested signatures — friendly-place.

### At a friendly place a place-constant function with the conjugation relation takes the value w/2

**Node:** `MordellLawrenceVenkatesh:LV.1/friendly-exponent-half` · lemma; implementation unchecked.

Let K ⊆ ℚ̄ be a number field, p a prime, ι_p : ℚ̄ → ℚ̄_p an embedding, and for each τ ∈ Hom(K, ℚ̄) let v(τ) be the place of K above p induced by ι_p ∘ τ. Let m : Hom(K, ℚ̄) → ℤ satisfy m(c∘τ) + m(τ) = w for all c ∈ C and τ, and assume m(τ) depends only on v(τ). Then for every friendly place v above p, m(τ) = w/2 whenever v(τ) = v.

**Hypotheses.** m(c∘τ) + m(τ) = w; m constant on {τ : v(τ) = v'} for each v' | p; v friendly above p.

**Construction or proof.**

1. If K has no CM subfield, the factorization lemma gives m ≡ w/2.
2. Otherwise fix τ₀ with v(τ₀) = v. Friendliness gives δ in the decomposition group of ι_p with δ ∘ τ₀ = τ₀ ∘ s_{E_K} on E_K; then v(δ ∘ τ₀) = v.
3. For any c ∈ C, c ∘ τ₀ = τ₀ ∘ s_{E_K} on E_K (criterion lemma), so δ ∘ τ₀ and c ∘ τ₀ agree on E_K and m(δτ₀) = m(cτ₀) by the factorization lemma.
4. Place-constancy gives m(δτ₀) = m(τ₀); hence m(τ₀) = m(cτ₀) = w − m(τ₀).

**Prerequisites.** `MordellLawrenceVenkatesh:LV.1/infinity-type-factorization`; `MordellLawrenceVenkatesh:LV.1/friendly-place`; `MordellLawrenceVenkatesh:LV.1/cm-or-totally-real-criterion`.

**Acceptance.**

- K = ℚ(i), p ≡ 3 mod 4: the unique place above p is friendly and the conclusion is m ≡ w/2 on both embeddings.
- K = ℚ(i), p ≡ 1 mod 4: the two places above p may carry exponents (1, 0) — the CM elliptic curve — so friendliness is necessary.

**Sources.**

- lv2020, §2.4, proof of Lemma 2.8, pp. 12–13: The use of friendliness in LV's proof; the node gives a direct group-theoretic argument replacing the Serre-torus computation.

**Signature gap:** Named theorem interfaces — LV.1.

### De Rham ℚ_p-valued characters are locally algebraic

**Node:** `MordellLawrenceVenkatesh:LV.1/de-rham-character-locally-algebraic` · lemma; implementation unchecked.

Let F/ℚ_p be a finite extension and ψ : G_F → ℚ_p^× a continuous character that is de Rham, and let k ∈ ℤ be the unique filtration jump of the one-dimensional F-space D_dR(ψ). Then ψ·χ_cyc^{k} has finite image on the inertia group I_F; equivalently, ψ ∘ Art_F agrees with u ↦ N_{F/ℚ_p}(u)^{k} on an open subgroup of 𝒪_F^×. (With the conventions of this roadmap, D_dR(ℚ_p(n)) has its jump at −n and χ_cyc(Art_F(u)) = N_{F/ℚ_p}(u)^{-1}.)

**Hypotheses.** F/ℚ_p finite; ψ continuous, de Rham, ℚ_p-valued.

**Construction or proof.**

1. η := ψ·χ_cyc^{k} is de Rham and D_dR(η) = D_dR(ψ) ⊗ D_dR(ℚ_p(k)) has its jump at k − k = 0 (tensor compatibility of D_dR and the computation of D_dR(ℚ_p(n))).
2. A de Rham representation is Hodge–Tate with gr D_dR = D_HT, so (ℂ_F(η))^{G_F} ≠ 0.
3. η(G_F) ⊆ ℚ_p^× is a commutative p-adic Lie group of dimension ≤ 1; by the Tate–Sen theorem (ℂ_F(η))^{G_F} = 0 unless η(I_F) is finite. Hence η(I_F) is finite.
4. By local class field theory Art_F(𝒪_F^×) is the image of inertia in G_F^{ab} and χ_cyc ∘ Art_F = N_{F/ℚ_p}^{-1} on units, so ψ ∘ Art_F(u) = N(u)^{k}·η(Art_F(u)); the finite-order character η ∘ Art_F is trivial on an open subgroup.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors — ClassFieldTheory Layer 7 (absolute local Artin map and its cyclotomic normalization). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `PadicHodgeTheory:R06.2`; `mathlib:cyclotomicCharacter`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

**Acceptance.**

- ψ = χ_cyc^{-1} = ℚ_p(−1): k = 1 and ψ ∘ Art_F = N on units.
- An unramified character: k = 0.
- With coefficients in a larger field the exponent may vary with the embedding; the ℚ_p-rationality forces the single exponent k.

**Sources.**

- brinon-conrad, Example 6.3.1 and Proposition 6.3.2, p. 76: Proof steps 1–2.
- brinon-conrad, Theorem 2.2.7, p. 15: Proof step 3 (Tate–Sen).
- lv2020, §2.4, p. 12: LV's appeal to local algebraicity.

**Signature gap:** Named theorem interfaces — LV.1.

### Global purity forces the conjugation relation on Hodge–Tate exponents

**Node:** `MordellLawrenceVenkatesh:LV.1/pure-character-conjugation-relation` · lemma; implementation unchecked.

Let K be a number field, p a prime, ι_p : ℚ̄ → ℚ̄_p an embedding, and η : G_K → ℚ_p^× a continuous character that is unramified outside a finite set T of finite places containing those above p, pure of weight w outside T, and de Rham at every place v' | p with filtration jump k_{v'}. For τ ∈ Hom(K, ℚ̄) put m(τ) := k_{v(τ)}. Then m(c ∘ τ) + m(τ) = w for every complex conjugation c ∈ C and every τ.

**Hypotheses.** η continuous, unramified outside finite T ⊇ {v | p}; η pure of weight w outside T; η de Rham at every place above p.

**Construction or proof.**

1. By class field theory η ∘ Art_K is a continuous character of the idele class group, trivial on principal ideles, whose component at ℘ ∉ T is unramified with η(Art_℘(ϖ_℘)) = η(Frob_℘).
2. By local algebraicity there is an open subgroup U ⊆ ∏_{v'|p} 𝒪_{v'}^× on which the p-component equals x ↦ ∏_{v'|p} N_{K_{v'}/ℚ_p}(x_{v'})^{k_{v'}} = ∏_τ ι_p(τ(x))^{m(τ)} for x ∈ K.
3. Let Λ ⊆ K^× be the subgroup of totally positive α with α ∈ U and α a unit in the kernel of η_℘ at every ℘ ∈ T above no p. Reciprocity gives ∏_τ τ(α)^{m(τ)} = ∏_{℘∉T} η(Frob_℘)^{−v_℘(α)} for α ∈ Λ, an algebraic number. Only its intersection with the global units has finite index in the unit group. For the weight comparison choose a positive rational integer n > 1 congruent to 1 modulo sufficiently high powers at T; such n exists by the Chinese remainder theorem and lies in the subgroup used in this argument.
4. Purity (|ι(η(Frob_℘))| = q_℘^{−w/2}) gives |ι_∞(∏_τ τ(α)^{m(τ)})| = |N_{K/ℚ}(α)|^{w/2} for every embedding ι_∞ : ℚ̄ → ℂ, i.e. Σ_τ (m(τ) − w/2) log|ι_∞τ(α)| = 0.
5. Grouping τ by the archimedean place of ι_∞ ∘ τ gives Σ_u a_u log|α|_u = 0 for all α ∈ Λ, with a_u the sum of m(τ) − w/2 over the embeddings inducing u. The vectors (log|α|_u)_u, α ∈ Λ, span ℝ^{places}: Λ contains a subgroup of the units, whose log vectors span the trace-zero hyperplane by Dirichlet's unit theorem, and an integer n > 1 whose log vector is not in that hyperplane. So every a_u = 0. Only its intersection with the global units has finite index in the unit group. For the weight comparison choose a positive rational integer n > 1 congruent to 1 modulo sufficiently high powers at T; such n exists by the Chinese remainder theorem and lies in the subgroup used in this argument.
6. For a complex place u the two embeddings are τ and c_ι ∘ τ with c_ι = ι_∞⁻¹ ∘ conj ∘ ι_∞, giving m(τ) + m(c_ι τ) = w; every c ∈ C is of the form c_ι. For a real place c_ι ∘ τ = τ and a_u = 0 reads 2m(τ) = w.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity — ClassFieldTheory Layer 11 (global Artin reciprocity and local–global compatibility); tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors — ClassFieldTheory Layer 7 (absolute local Artin map and its cyclotomic normalization). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.1/de-rham-character-locally-algebraic`; `WeightsInEtaleCohomology:R34.1`; `mathlib:NumberField.Units.dirichletUnitTheorem.unitLattice_span_eq_top`; `mathlib:NumberField.Units.logEmbedding`; `mathlib:Set.unit`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

**Acceptance.**

- η = χ_cyc^{−1} over any K: m ≡ 1 and w = 2.
- K = ℚ(i), p ≡ 1 mod 4 split as v₁v₂: the two ℚ_p-valued characters cut out by the ℤ[i]-action on H¹ of y² = x³ − x have exponents (1, 0) and (0, 1) at (v₁, v₂); the relation m(τ) + m(cτ) = 1 holds, and the value w/2 is not attained at the non-friendly places.

**Sources.**

- lv2020, §2.4, proof of Lemma 2.8, p. 12: The reciprocity-and-purity step, reproduced in proof steps 3–4.

**Signature gap:** Named theorem interfaces — LV.1.

### Pure characters at friendly places (LV Lemma 2.8, stated on units)

**Node:** `MordellLawrenceVenkatesh:LV.1/pure-character-friendly` · theorem; implementation unchecked.

Let v be a friendly place of the number field K above p and η : G_K → ℚ_p^× a continuous character, unramified outside a finite set, pure of weight w outside that set, and de Rham at every place above p. Then w is even, the filtration jump of D_dR(η|_{G_{K_v}}) is w/2, and η ∘ Art_{K_v} agrees with N_{K_v/ℚ_p}^{w/2} on an open subgroup of 𝒪_{K_v}^×. (LV state η²|_{K_v^×} = χ·Norm^w on all of K_v^×; on a uniformizer this fails already for η = χ_cyc^{−1} over ℚ, and only the restriction to units, which is what LV use, is asserted here.)

**Hypotheses.** v friendly above p; η continuous, finitely ramified, pure of weight w, de Rham above p.

**Construction or proof.**

1. Enlarge the ramification set to contain the places above p; the conjugation relation holds for m(τ) = k_{v(τ)}.
2. m is place-constant by construction, so the friendly-exponent lemma gives k_v = w/2; since k_v ∈ ℤ, w is even.
3. Local algebraicity at v gives the statement on units.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.1/pure-character-conjugation-relation`; `MordellLawrenceVenkatesh:LV.1/friendly-exponent-half`; `MordellLawrenceVenkatesh:LV.1/de-rham-character-locally-algebraic`.

**Acceptance.**

- K = ℚ: η = χ_cyc^{−w/2}·(finite order on inertia).
- For η = χ_cyc^{−1} over ℚ: η∘Art(p) = 1 while p² ≠ 1, so the identity cannot hold on uniformizers.

**Sources.**

- lv2020, §2.4, Lemma 2.8, p. 12: Statement of Lemma 2.8 (continued: η²|_{K_v^*} = χ · Norm^w, w even, Hodge–Tate weight w/2).
- lv2020, §2.4, after Lemma 2.8, p. 12: Why the ℚ_p-coefficient hypothesis matters (place-constancy of m).

**Signature gap:** Named theorem interfaces — LV.1.

### The weight of a filtration (LV (2.2))

**Node:** `MordellLawrenceVenkatesh:LV.1/filtration-weight` · definition; implementation unchecked.

For a nonzero finite-dimensional vector space D over a field with a finite exhaustive separated decreasing filtration, weight_F(D) := t_H(D)/dim D ∈ ℚ, where t_H(D) = Σ_j j·dim gr^j D is the Hodge number of the filtered space. When F⁰D = D and the jumps are ≥ 0 this is LV's Σ_{j≥0} j dim gr^j(D)/dim D.

**Hypotheses.** D nonzero, finite-dimensional, finitely filtered.

**Construction or proof.**

1. Define weight_F as the rational number t_H(D)/dim D using the Hodge number of the filtered vector space (PadicHodgeTheory R06.2, Brinon–Conrad Definition 8.1.1).

**Prerequisites.** `PadicHodgeTheory:R06.2`.

**Uses.**

- MordellLawrenceVenkatesh:LV.1/hodge-weight-pure-representation: translate global purity into weighted local dimensions. The consumer is Hodge weight of a pure representation at a friendly place (LV Lemma 2.9).

**Planning API.**

- `filtrationWeight` (constructor; signature stated): weight_F(D) = t_H(D)/dim D for a nonzero filtered vector space.
- `filtrationWeight_eq` (characterisation; signature stated): weight_F(D) · dim D = Σ_j j dim gr^j D.
- `filtrationWeight_det` (relation; signature stated): t_H(det D) = t_H(D), so the jump of det D is dim D · weight_F(D).
- `filtrationWeight_directSum` (relation; signature stated): weight_F(D ⊕ D') = (dim D weight_F(D) + dim D' weight_F(D'))/(dim D + dim D').
- `filtrationWeight_restrictScalars` (compatibility; signature stated): For F'/F finite and D an F'-filtered space viewed over F, t_H over F is [F':F] times t_H over F', so the weight is unchanged.
- `filtrationWeight_sub_quotient` (relation; signature stated): t_H is additive on strict short exact sequences.
- `filtrationWeight_twist` (relation; signature stated): Shifting the filtration by n adds n to the weight.
- `filtrationWeight_example` (example; signature stated): A two-step filtration with dim F¹ = a on a space of dimension n has weight a/n.

**Mathematical tests.**

- `filtrationWeight.reviewTest1` (computation; signature stated): A two-dimensional filtration with jumps 0 and 1 has weight 1/2.
- `filtrationWeight.reviewTest2` (degenerate; signature stated): A one-dimensional ℚ-vector space with its only filtration jump at 0 has filtration weight 0.
- `filtrationWeight.reviewTest3` (compatibility; signature stated): A one-dimensional filtration with jump −1 has weight −1; after direct sum with a line of jump 1 the weight is 0.

**Acceptance.**

- H¹_dR of an abelian variety of dimension g with the Hodge filtration: weight 1/2.
- D_dR(ℚ_p(−1)): weight 1.

**Sources.**

- lv2020, §2.5, (2.2), p. 13: Definition (2.2).
- brinon-conrad, Definition 8.1.1, p. 102: The Hodge number t_H used in the definition.

**Planet:** Weight of a filtration.

### Hodge weight of a pure representation at a friendly place (LV Lemma 2.9)

**Node:** `MordellLawrenceVenkatesh:LV.1/hodge-weight-pure-representation` · theorem; implementation unchecked.

Let K be a number field, v a friendly place above p, and V a continuous representation of G_K on a nonzero finite-dimensional ℚ_p-vector space that is unramified outside a finite set, pure of weight w outside it, and de Rham (for instance crystalline) at every place above p. Then the weight of the Hodge filtration on D_dR(V|_{G_{K_v}}) equals w/2.

**Hypotheses.** v friendly above p; V finitely ramified, pure of weight w, de Rham above p.

**Construction or proof.**

1. det V is a continuous character, pure of weight w·dim V (the product of the Frobenius eigenvalues) and de Rham above p.
2. D_dR(det V) = det D_dR(V) as filtered spaces, so its jump is t_H(D_dR(V)).
3. The friendly-place theorem for det V gives t_H(D_dR(V|_{K_v})) = w·dim V/2.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.1/pure-character-friendly`; `MordellLawrenceVenkatesh:LV.1/filtration-weight`; `PadicHodgeTheory:R06.2`; `WeightsInEtaleCohomology:R34.1`.

**Acceptance.**

- V = H¹_et(A_{K̄}, ℚ_p) for an abelian variety with good reduction above p: weight 1/2, matching dim F¹ = g.

**Sources.**

- lv2020, §2.5, Lemma 2.9 and proof, p. 13: Statement and proof of Lemma 2.9 (LV state it with D_cris; the de Rham version is equivalent for crystalline V).

**Signature gap:** Named theorem interfaces — LV.1.

### D_dR of an induced representation at a place

**Node:** `MordellLawrenceVenkatesh:LV.1/de-rham-of-induced` · lemma; implementation unchecked.

Let L/K be a finite extension of number fields, v a place of K above p, and ρ a continuous representation of G_L on a finite-dimensional ℚ_p-space that is de Rham at every place u of L above v. Then Ind_{G_L}^{G_K} ρ restricted to G_{K_v} is de Rham and D_dR,K_v(Ind ρ|_{G_{K_v}}) ≅ ⊕_{u|v} D_dR,L_u(ρ|_{G_{L_u}}) as filtered K_v-vector spaces (each summand viewed over K_v by restriction of scalars).

**Hypotheses.** L/K finite; ρ de Rham at the places above v.

**Construction or proof.**

1. The double cosets G_{K_v}\G_K/G_L correspond to the places u | v, and Mackey's formula gives Res_{G_{K_v}} Ind_{G_L}^{G_K} ρ ≅ ⊕_{u|v} Ind_{G_{L_u}}^{G_{K_v}} Res_{G_{L_u}} ρ (the decomposition is algebraic and compatible with the topologies since all indices are finite).
2. For a finite extension F'/F of p-adic fields, D_dR,F(Ind_{G_{F'}}^{G_F} W) = (Ind W ⊗ B_dR)^{G_F} = (W ⊗ B_dR)^{G_{F'}} = D_dR,F'(W), compatibly with filtrations (Shapiro for invariants, PadicHodgeTheory R06.2).

**Prerequisites.** `PadicHodgeTheory:R06.2`; `ArithmeticGaloisRepresentations:R01.1`; `tauceti:Rep.mackeyDecomposition`.

**Acceptance.**

- L = K: the formula is trivial.
- ρ trivial and L/K unramified of degree r at v inert: D_dR(Ind 1) = L_u with the trivial filtration, of K_v-dimension r.

**Sources.**

- lv2020, §2.5, proof of Lemma 2.10, p. 14: LV's proof applies p-adic Hodge theory to the induced representation and splits it over the places u | v.

**Signature gap:** Named theorem interfaces — LV.1.

### Hodge weights summed over places above a friendly place (LV Lemma 2.10)

**Node:** `MordellLawrenceVenkatesh:LV.1/hodge-weight-sum-over-places` · theorem; implementation unchecked.

Let L/K be a finite extension of number fields, v a friendly place of K above p, and ρ : G_L → GL_n(ℚ_p), with n > 0, continuous, finitely ramified, pure of weight w outside a finite set and de Rham at every place of L above p. Let a_u(ρ) be the weight of the Hodge filtration of D_dR(ρ|_{G_{L_u}}). Then Σ_{u|v} [L_u : K_v]·a_u(ρ) = [L : K]·w/2.

**Hypotheses.** v friendly place of K above p; ρ finitely ramified, pure of weight w, de Rham above p; n > 0, so the average filtration weights are defined..

**Construction or proof.**

1. V = Ind_{G_L}^{G_K} ρ is continuous, finitely ramified, de Rham above p and pure of weight w outside a finite set (the Frobenius eigenvalues of an induced representation at an unramified place are roots of those of ρ at the places above it, with the same normalized absolute values).
2. The Hodge-weight theorem for V at v gives weight w/2 for D_dR(V|_{K_v}).
3. By the induction lemma, D_dR(V|_{K_v}) = ⊕_{u|v} D_dR,L_u(ρ) with K_v-dimensions [L_u:K_v]·n and t_H = [L_u:K_v]·n·a_u(ρ); compare with dim V = [L:K]·n.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.1/hodge-weight-pure-representation`; `MordellLawrenceVenkatesh:LV.1/de-rham-of-induced`; `WeightsInEtaleCohomology:R34.1`; `ArithmeticGaloisRepresentations:R01.1`.

**Acceptance.**

- L = K: Lemma 2.9.
- K = ℚ, p unramified in L: Σ_{u|p} f_u a_u = [L:ℚ] w/2, the form used in LV Lemma 4.4.

**Sources.**

- lv2020, §2.5, Lemma 2.10, p. 13–14: Statement of Lemma 2.10 (continued on p. 14 with the displayed identity).

**Signature gap:** Named theorem interfaces — LV.1.

### The Galois representation on H¹ of an abelian variety

**Node:** `MordellLawrenceVenkatesh:LV.1/abelian-variety-cohomology-properties` · theorem; implementation unchecked.

Let A be an abelian variety over a number field L with good reduction outside a finite set S_A of finite places, p a prime and ρ_A = H¹_et(A_{L̄}, ℚ_p) (the ℚ_p-dual of V_p(A)), of dimension 2 dim A. Then: (a) ρ_A is unramified outside S_A ∪ {u | p}; (b) for u ∉ S_A ∪ {u | p} the characteristic polynomial of ρ_A(Frob_u^geom) is the characteristic polynomial of the q_u-Frobenius endomorphism of the reduction A_u, which lies in ℤ[X] and has all complex roots of absolute value q_u^{1/2}; so ρ_A is pure of weight 1 with integral Frobenius polynomials outside S_A ∪ {u | p}; (c) ρ_A is crystalline at every u | p with u ∉ S_A; (d) a polarization of A induces a perfect alternating G_L-equivariant pairing ρ_A × ρ_A → ℚ_p(−1).

**Hypotheses.** A abelian variety over a number field L; good reduction outside S_A.

**Construction or proof.**

1. (a) Néron–Ogg–Shafarevich for u ∤ p; (b) the good-reduction Frobenius polynomial of the Tate module and the Weil bound for abelian varieties over finite fields, dualized; (c) good reduction implies crystalline Tate modules; (d) the Weil pairing of the polarization on Tate modules, dualized.

**Prerequisites.** `NeronModelsAndSemistableAbelianVarieties:R11.5`; `ArithmeticGaloisRepresentations:R01.6`; `DeligneWeightsAndPurity:DWP.1`; `PadicHodgeTheory:R06.6`; `AbelianSchemesAndArithmeticModuli:A3`; `SchemeAndStackFoundations:SF.3`.

**Acceptance.**

- An elliptic curve with good reduction at u: X² − a_u X + q_u with |a_u| ≤ 2√q_u.
- The pairing in (d) for the Legendre curve is the cup product on H¹.

**Sources.**

- lv2020, §6, proof of Proposition 5.3, p. 29–30: The representations to which Lemmas 2.3 and 2.10 are applied in §6.
- lv2020, §6, proof of Lemma 6.1, p. 32: Part (d) is the form used in (6.8).

**Signature gap:** Named theorem interfaces — LV.1.

### Exact follow-ups for LV.1

- Supply/resolve LV-import-06 — Continuous Mackey and semisimple image algebras (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-12 — Local de Rham characters and induction (exact interface and affected nodes are in gaps).
- Supply/resolve Faithful image-algebra trace criterion (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — largest-cm-subfield (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — friendly-place (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.1 (exact interface and affected nodes are in gaps).
- Resolve exact supplier contracts LV-import-06, LV-import-07, LV-import-08, LV-import-09, LV-import-10, LV-import-11, LV-import-12, LV-import-13, LV-import-14, LV-import-15, LV-import-16, LV-import-17, LV-import-18; the stage imports name plans, not proofs.

## LV.2 — Abelian-by-finite families, good models and Gauss–Manin transport on residue disks

### Abelian-by-finite families (LV Definition 5.1)

**Node:** `MordellLawrenceVenkatesh:LV.2/abelian-by-finite-family` · definition; implementation unchecked.

Let B be a scheme and Y a B-scheme. An abelian-by-finite family over Y is a pair of morphisms X →f Y' →π Y together with a polarization λ of f, where π is finite étale and (f : X → Y', zero section, λ) is a polarized abelian scheme of constant relative dimension d. The composite π ∘ f is smooth and proper of relative dimension d. For a point y of Y, E_y := Γ(π^{-1}(y), 𝒪) is a finite étale κ(y)-algebra and the fibre X_y = (π∘f)^{-1}(y) is naturally an E_y-scheme. A polarized abelian scheme over Y is the case π = id.

**Hypotheses.** π : Y' → Y finite étale; f : X → Y' abelian scheme of relative dimension d with polarization λ.

**Construction or proof.**

1. Bundle the data (Y', π, X, f, zero section, λ) with the finite-étale and abelian-scheme predicates.
2. The composite is smooth and proper as a composite of smooth proper morphisms.

**Prerequisites.** `AbelianSchemesAndArithmeticModuli:A1`; `AbelianSchemesAndArithmeticModuli:A2`; `mathlib:AlgebraicGeometry.IsFinite`; `mathlib:AlgebraicGeometry.Etale`; `mathlib:AlgebraicGeometry.IsProper`; `mathlib:AlgebraicGeometry.Smooth`.

**Uses.**

- MordellLawrenceVenkatesh:LV.2/good-model: retain the finite étale algebra acting on each cohomology fibre. The consumer is Good models over rings of S-integers.
- MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group: retain the finite étale algebra acting on each cohomology fibre. The consumer is The algebraic monodromy group of an abelian-by-finite family and full monodromy (LV (3.5), (5.1)).
- MordellLawrenceVenkatesh:LV.6/legendre-family: retain the finite étale algebra acting on each cohomology fibre. The consumer is The Legendre family and its cyclic variant (LV §4.2).
- MordellLawrenceVenkatesh:LV.8/kodaira-parshin-family: retain the finite étale algebra acting on each cohomology fibre. The consumer is The Kodaira–Parshin family (LV Definitions 7.2–7.3).

**Planning API.**

- `AbelianByFiniteFamily` (constructor; signature omitted): The structure (Y', π, X, f, e, λ) over a B-scheme Y.
- `AbelianByFiniteFamily.relDim` (data; signature omitted): The relative dimension d of f.
- `AbelianByFiniteFamily.total` (projection; signature omitted): The composite π ∘ f : X → Y, smooth and proper of relative dimension d.
- `AbelianByFiniteFamily.baseChange` (functoriality; signature omitted): Pullback along Y₁ → Y and along B₁ → B, with base change of π, f and λ; compatible with composition and identity.
- `AbelianByFiniteFamily.fibreAlgebra` (data; signature omitted): E_y = Γ(π^{-1}(y), 𝒪), a finite étale κ(y)-algebra whose factors are the residue fields of the points of Y' over y.
- `AbelianByFiniteFamily.fibre` (projection; signature omitted): The fibre X_y as an E_y-scheme; over each point y' of π^{-1}(y) it is the polarized abelian variety X_{y'} over κ(y').
- `AbelianByFiniteFamily.ofAbelianScheme` (coercion; signature omitted): A polarized abelian scheme over Y is an abelian-by-finite family with π = id.
- `AbelianByFiniteFamily.restrictScalars` (other; signature omitted): The total space as a smooth proper Y-scheme, forgetting the factorization.

**Mathematical tests.**

- `AbelianByFiniteFamily.reviewTest1` (degenerate; signature omitted): For π=id_Y, the construction associated to a polarized abelian scheme has fibre algebra κ(y).
- `AbelianByFiniteFamily.reviewTest2` (computation; signature omitted): For Y′=Y⊔Y and two dimension-d abelian schemes, the fibre algebra is κ(y)×κ(y), and the total fibre is their disjoint union, not their product.
- `AbelianByFiniteFamily.reviewTest3` (compatibility; signature omitted): Pulling back along id_Y gives an isomorphic abelian-by-finite family, preserving its polarization and factorization.

**Acceptance.**

- The polarized abelian scheme X → Y with π = id.
- The Legendre variant X → ℙ¹∖{0, μ_m, ∞} → ℙ¹∖{0,1,∞} of LV §4.2 (LV.6).
- The Kodaira–Parshin family X_q → Y'_q → Y (LV.8).

**Sources.**

- lv2020, §5, Definition 5.1, p. 25: The definition.

**Planet:** Abelian-by-finite family.

**Signature gap:** Suggested signatures — abelian-by-finite-family.

### Good models over rings of S-integers

**Node:** `MordellLawrenceVenkatesh:LV.2/good-model` · definition; implementation unchecked.

Let K be a number field, S a finite set of places containing the archimedean ones and 𝒪 = 𝒪_S. A good model over 𝒪 of an abelian-by-finite family X → Y' → Y over a smooth K-variety Y is an abelian-by-finite family 𝒳 → 𝒴' → 𝒴 over 𝒪 whose base change to K is the given one, with 𝒴 smooth and of finite type over 𝒪 (and proper over 𝒪 when Y is proper over K), and such that the relative de Rham cohomology H¹_dR(𝒳/𝒴') and its Hodge filtration F¹ are locally free with locally free quotient and commute with base change, and the Gauss–Manin connection of X/Y extends to 𝒳/𝒴 over 𝒪 (LV §3.1). For the integral symplectic structures used below, also require the degree of the polarization to be invertible on the model; this is achieved by enlarging S. This is the strengthened good-model convention of this packet, and allows nonproper bases for the S-unit application.

**Hypotheses.** Y smooth over K; 𝒪 = 𝒪_S.

**Construction or proof.**

1. Define the predicate on a model; for abelian schemes the local freeness and base change of H¹_dR and F¹ and the integral Gauss–Manin connection are properties of the relative de Rham realization over any smooth 𝒪-base (AbelianSchemesAndArithmeticModuli A4), so the defining conditions reduce to: 𝒳 → 𝒴' → 𝒴 is an abelian-by-finite family over 𝒪 with 𝒴/𝒪 smooth (proper when Y is) recovering the given family over K.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.2/abelian-by-finite-family`; `AbelianSchemesAndArithmeticModuli:A4`; `mathlib:Set.integer`; `mathlib:AlgebraicGeometry.IsProper.eq_valuativeCriterion`.

**Uses.**

- MordellLawrenceVenkatesh:LV.2/good-model-exists: obtain integral horizontal sections and good reduction. The consumer is Existence of good models after enlarging S.
- MordellLawrenceVenkatesh:LV.2/de-rham-bundle: obtain integral horizontal sections and good reduction. The consumer is The de Rham bundle of an abelian-by-finite family.
- MordellLawrenceVenkatesh:LV.4/fibre-representation-crystalline: obtain integral horizontal sections and good reduction. The consumer is The fibre representations are crystalline with the de Rham cohomology of the fibre as filtered φ-module.
- MordellLawrenceVenkatesh:LV.6/legendre-family: obtain integral horizontal sections and good reduction. The consumer is The Legendre family and its cyclic variant (LV §4.2).
- MordellLawrenceVenkatesh:LV.7/proposition-5-3: obtain integral horizontal sections and good reduction. The consumer is Rational points on the base of an abelian-by-finite family (LV Proposition 5.3).

**Planning API.**

- `IsGoodModel` (constructor; signature omitted): The predicate that an abelian-by-finite family over 𝒪_S is a good model of a family over K.
- `IsGoodModel.baseChange` (functoriality; signature omitted): A good model over 𝒪_S gives a good model over 𝒪_{S'} for S ⊆ S'.
- `IsGoodModel.integralPoints` (characterisation; signature omitted): If Y is proper, every K-point of Y extends uniquely to an 𝒪-point of 𝒴.
- `IsGoodModel.fibre_goodReduction` (other; signature omitted): For y ∈ 𝒴(𝒪) and y' over y, X_{y'} has good reduction at every place of K(y') not above S, and K(y')/K is unramified outside S.
- `IsGoodModel.deRham_locallyFree` (projection; signature omitted): H¹_dR(𝒳/𝒴') and F¹ are locally free with locally free quotient.
- `IsGoodModel.of_polarizedAbelianScheme` (example; signature omitted): The case π = id.

**Mathematical tests.**

- `IsGoodModel.reviewTest1` (computation; signature omitted): The principally polarized Legendre family over ℤ[1/2][t,1/(t(1−t))] satisfies the good-model conditions.
- `IsGoodModel.reviewTest2` (compatibility; signature omitted): A good model over 𝒪_S remains a good model after enlarging S.
- `IsGoodModel.reviewTest3` (non-example; signature omitted): Multiplying a principal polarization by p makes its integral de Rham pairing nonperfect at p; the strengthened good-model convention requires p to be inverted.

**Acceptance.**

- The Legendre family over ℤ[1/2][t, 1/(t(1−t))] is a good model of its generic fibre with S = {2, ∞}.
- If Y is proper, Y(K) = 𝒴(𝒪) by the valuative criterion, so every rational point is integral.

**Sources.**

- lv2020, §5, Definition 5.1, p. 25: The definition.
- lv2020, §3.1, p. 15: The assumptions of §3.1 referred to by Definition 5.1.

**Planet:** Good model.

**Signature gap:** Suggested signatures — good-model.

### Existence of good models after enlarging S

**Node:** `MordellLawrenceVenkatesh:LV.2/good-model-exists` · lemma; implementation unchecked.

Let X → Y' → Y be an abelian-by-finite family over a smooth (respectively smooth proper) K-variety Y. There is a finite set S of places of K such that the family has a good model over 𝒪_S with 𝒴 smooth (respectively smooth and proper) over 𝒪_S. Any two good models become isomorphic over 𝒪_{S'} for some finite S' ⊇ S.

**Hypotheses.** Y smooth (proper) over K; K a number field.

**Construction or proof.**

1. K = colim 𝒪_S over finite S; the finitely presented schemes Y, Y', X, the morphisms π, f, the zero section and the polarization descend to some 𝒪_S (limit arguments), and so do the properties smooth, proper, finite étale, and 'abelian scheme' (smooth proper group scheme with geometrically connected fibres) after enlarging S.
2. The degree-one de Rham realization of an abelian scheme over a smooth 𝒪_S-base has the required local freeness, base change and integral Gauss–Manin connection.
3. Uniqueness: an isomorphism over K of finitely presented objects descends to some 𝒪_{S'}.
4. Enlarge S further to invert the degree of the chosen polarization, so its de Rham pairing is perfect over the integral model.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.2/good-model`; `SchemeAndStackFoundations:SF.0`; `AbelianSchemesAndArithmeticModuli:A4`; `mathlib:AlgebraicGeometry.spread_out_of_isGermInjective`.

**Acceptance.**

- X = E × Y for a fixed elliptic curve E over K: S = the bad places of E and of Y.

**Sources.**

- lv2020, §3.1, p. 15: Why the conditions can be arranged after enlarging S.

**Signature gap:** Named theorem interfaces — LV.2.

### The de Rham bundle of an abelian-by-finite family

**Node:** `MordellLawrenceVenkatesh:LV.2/de-rham-bundle` · construction; implementation unchecked.

For a good model 𝒳 →f 𝒴' →π 𝒴 over 𝒪 = 𝒪_S, put ℰ := π_*𝒪_{𝒴'} (a finite étale 𝒪_𝒴-algebra) and ℋ := π_* H¹_dR(𝒳/𝒴'). Then ℋ is a locally free ℰ-module of rank 2d, with: (a) the Hodge sub-bundle F¹ℋ = π_*F¹, locally free of ℰ-rank d with locally free quotient; (b) the polarization pairing ⟨·,·⟩ : ℋ × ℋ → ℰ, ℰ-bilinear, alternating and perfect, for which F¹ℋ is Lagrangian; (c) the Gauss–Manin connection ∇ : ℋ → ℋ ⊗ Ω¹_{𝒴/𝒪}, integrable, satisfying ∇(e·x) = d_ℰ(e)·x + e·∇x for the canonical integrable connection d_ℰ on the étale algebra ℰ, and horizontal pairing d_ℰ⟨x, x'⟩ = ⟨∇x, x'⟩ + ⟨x, ∇x'⟩. For y ∈ 𝒴(R) with R an 𝒪-algebra, y^*ℋ = H¹_dR(X_y/R) as a module over E_y = y^*ℰ, compatibly with (a)–(c) and with the de Rham cohomology of the total space X → Y.

**Hypotheses.** good model over 𝒪_S.

**Construction or proof.**

1. Apply the degree-one de Rham realization of the polarized abelian scheme 𝒳/𝒴' (relative H¹_dR, Hodge exact sequence, Gauss–Manin connection relative to 𝒪, cup-product pairing induced by λ, base change).
2. Push forward along the finite étale π: π_* of a locally free module is locally free; ℰ acts through π_*𝒪_{𝒴'}; since π is étale, Ω¹_{𝒴'/𝒪} = π^*Ω¹_{𝒴/𝒪}, so the Gauss–Manin connection of 𝒳/𝒴' pushes forward to a connection on ℋ with the stated Leibniz rule; it coincides with the Gauss–Manin connection of the composite 𝒳 → 𝒴.
3. The pairing pushes forward to an ℰ-valued pairing; perfectness and the Lagrangian property of F¹ are fibrewise statements for abelian varieties.
4. Base change of π_* along y is exact because π is finite flat.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.2/good-model`; `AbelianSchemesAndArithmeticModuli:A4`; `AbelianSchemesAndArithmeticModuli:A2`; `mathlib:AlgebraicGeometry.Etale`; `mathlib:AlgebraicGeometry.IsFinite`.

**Uses.**

- MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-padic: transport the algebra action, Hodge subspace and pairing together. The consumer is p-adic Gauss–Manin transport on a residue disk (LV (3.7)).
- MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-complex: transport the algebra action, Hodge subspace and pairing together. The consumer is Complex Gauss–Manin transport and Betti parallel transport (LV (3.8)).
- MordellLawrenceVenkatesh:LV.2/crystalline-frobenius-on-fibres: transport the algebra action, Hodge subspace and pairing together. The consumer is Crystalline Frobenius on the de Rham cohomology of the fibres and its compatibility with Gauss–Manin transport (LV (3.9)).
- MordellLawrenceVenkatesh:LV.3/padic-period-map: transport the algebra action, Hodge subspace and pairing together. The consumer is The p-adic period map on a residue disk.

**Planning API.**

- `deRhamBundle` (constructor; signature omitted): ℋ as a locally free ℰ-module of rank 2d on 𝒴.
- `deRhamBundle.hodge` (data; signature omitted): The Hodge sub-bundle F¹ℋ of ℰ-rank d.
- `deRhamBundle.pairing` (data; signature omitted): The ℰ-bilinear perfect alternating pairing with F¹ℋ Lagrangian.
- `deRhamBundle.gaussManin` (data; signature omitted): The integrable connection ∇ with the ℰ-Leibniz rule and horizontal pairing.
- `deRhamBundle.fibreEquiv` (equivalence; signature omitted): y^*ℋ ≃ H¹_dR(X_y/R) as E_y-modules with filtration and pairing.
- `deRhamBundle.fibreDecomp` (characterisation; signature omitted): Over a field L ⊇ K, H¹_dR(X_y/L) = ∏ over the factors of E_y ⊗ L of the de Rham cohomology of the corresponding abelian varieties (LV (6.2)).
- `deRhamBundle.baseChange` (functoriality; signature omitted): Compatibility with base change of the family and with restriction to open subschemes of 𝒴.
- `deRhamBundle.eq_gaussManin_total` (compatibility; signature omitted): ∇ is the Gauss–Manin connection of the smooth proper morphism 𝒳 → 𝒴 on H¹_dR(𝒳/𝒴) = ℋ.
- `deRhamBundle.legendre` (example; signature omitted): For the Legendre family, the basis dx/y, x dx/y and its connection matrix.

**Mathematical tests.**

- `deRhamBundle.reviewTest1` (computation; signature omitted): For a constant elliptic scheme A×𝒴, ℋ has rank 2, F¹ rank 1, and its connection is d in a constant frame.
- `deRhamBundle.reviewTest2` (compatibility; signature omitted): For a disjoint union over Y′=Y⊔Y, ℋ and F¹ split into the corresponding two summands, with componentwise pairing.
- `deRhamBundle.reviewTest3` (non-example; signature omitted): For a polarization of degree divisible by p, its integral pairing at p must not be declared perfect without the added unit-degree hypothesis.

**Acceptance.**

- For the Legendre family, ℰ = 𝒪 and ℋ has basis dx/y, x dx/y with the Picard–Fuchs connection.
- For π = id, ℋ = H¹_dR(𝒳/𝒴) with its usual structures.

**Sources.**

- lv2020, §6, proof of Proposition 5.3, p. 29: The E_y-structure and the symplectic pairing on the fibres.
- lv2020, §4.3, proof of Lemma 4.2, p. 22: The ℰ-linearity of the Gauss–Manin connection.

**Signature gap:** Suggested signatures — de-rham-bundle.

### Residue disks and their coordinates

**Node:** `MordellLawrenceVenkatesh:LV.2/residue-disk` · definition; implementation unchecked.

Let 𝒴 be smooth of finite type and relative dimension m over 𝒪_S, and let v ∉ S with K_v/ℚ_p unramified. For y₀ ∈ 𝒴(𝒪_v), define Ω_v(y₀) = {y ∈ 𝒴(𝒪_v) : y and y₀ have the same reduction}. After base change to 𝒪_v choose parameters z₁,…,z_m along this section. The completed local ring at its special point is 𝒪_v[[z₁,…,z_m]], and these coordinates identify Ω_v(y₀) with (p𝒪_v)^m. Parameters and Taylor coefficients can be chosen over 𝒪_(v) when y₀ comes from an 𝒪_(v)-section; that extra hypothesis is needed for the common K-coefficient series used later.

**Hypotheses.** 𝒴 smooth over 𝒪_S of relative dimension m; v ∉ S, K_v/ℚ_p unramified; y₀ ∈ 𝒴(𝒪_v).

**Construction or proof.**

1. Parameters exist because 𝒴 is smooth over 𝒪 at ȳ₀ and y₀ is a section through ȳ₀.
2. Since K_v is unramified, 𝒪_v = W(k_v) and the completed local ring of the smooth 𝒪_v-scheme at the k_v-point ȳ₀ is 𝒪_v[[z]].
3. 𝒪_v-points reducing to ȳ₀ are continuous 𝒪_v-algebra maps 𝒪_v[[z]] → 𝒪_v, i.e. values z ∈ (p𝒪_v)^m (formal smoothness and completeness).
4. For general 𝒪_v-sections carry out the parameter construction after base change to 𝒪_v; use the rational-section variant only when the section is defined over 𝒪_(v). Finiteness of the residue partition uses finite type and the finite residue field.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — LocalFieldsRamification Layer 2 (unramified extensions and Frobenius). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `SchemeAndStackFoundations:SF.0`; `mathlib:AlgebraicGeometry.Smooth`; `mathlib:MvPowerSeries`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

**Uses.**

- MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-padic: work on a complete disk with convergent coordinates and finitely many residue classes. The consumer is p-adic Gauss–Manin transport on a residue disk (LV (3.7)).
- MordellLawrenceVenkatesh:LV.3/padic-period-map: work on a complete disk with convergent coordinates and finitely many residue classes. The consumer is The p-adic period map on a residue disk.
- MordellLawrenceVenkatesh:LV.7/proposition-5-3: work on a complete disk with convergent coordinates and finitely many residue classes. The consumer is Rational points on the base of an abelian-by-finite family (LV Proposition 5.3).

**Planning API.**

- `residueDisk` (constructor; signature omitted): Ω_v(y₀) as a subset of 𝒴(𝒪_v).
- `residueDisk.coords` (data; signature omitted): The bijection z : Ω_v(y₀) ≃ (p𝒪_v)^m attached to a system of parameters.
- `residueDisk.coords_germ` (characterisation; signature omitted): Taylor expansion in coordinates based at an 𝒪_v-section has coefficients in 𝒪_v. For an 𝒪_(v)-section and parameters defined there, the coefficients lie in 𝒪_(v).
- `residueDisk.mem_iff` (characterisation; signature omitted): y ∈ Ω_v(y₀) ↔ y and y₀ have the same reduction.
- `residueDisk.coords_change` (other; signature omitted): Two systems of parameters differ by an 𝒪_v-analytic isomorphism given by power series in 𝒪_v[[z]].
- `residueDisk.finiteEtale` (functoriality; signature omitted): Over the completed disk a finite étale cover splits into disks over finite unramified 𝒪_v-algebras. Its 𝒪_v-points over Ω_v are exactly the sections from residue-degree-one factors; a degree > 1 field factor contributes points only after unramified base change.
- `residueDisk.cover` (other; signature omitted): 𝒴(𝒪_v) is the finite disjoint union of the residue disks of its points; if 𝒴 is proper, Y(K_v) = 𝒴(𝒪_v).
- `residueDisk.affineLine` (example; signature omitted): The residue disks of 𝔸¹(ℤ_p) are the cosets of pℤ_p.

**Mathematical tests.**

- `residueDisk.reviewTest1` (computation; signature omitted): On 𝔸¹ over ℤ₅, Ω₅(2)=2+5ℤ₅ and t↦t−2 identifies it with 5ℤ₅.
- `residueDisk.reviewTest2` (degenerate; signature omitted): On Spec ℤ₅ the residue disk is a singleton, matching the zero-dimensional coordinate space.
- `residueDisk.reviewTest3` (non-example; signature omitted): Spec 𝒪_L→Spec ℤ₅ for the unramified quadratic extension L/ℚ₅ has no ℤ₅-valued point; its two geometric points are not two ℤ₅-sections.

**Acceptance.**

- 𝒴 = 𝔸¹: Ω_v(y₀) = y₀ + p𝒪_v with z = t − t₀.
- Changing parameters changes the bijection by an 𝒪_v-analytic automorphism of (p𝒪_v)^m.

**Sources.**

- lv2020, §3.3, pp. 16–17: Choice of parameters; LV continue: the completed local ring is O_v[[z_1, …, z_m]].

**Signature gap:** Suggested signatures — residue-disk.

### Formal horizontal sections of an integrable connection with integral coefficients

**Node:** `MordellLawrenceVenkatesh:LV.2/formal-horizontal-sections` · lemma; implementation unchecked.

Let R be a subring of a field K of characteristic zero, r ≥ 1, and A_1, …, A_m ∈ M_r(R[[z_1, …, z_m]]) satisfying the integrability condition ∂_k A_l − ∂_l A_k + [A_k, A_l] = 0. There is a unique Φ ∈ GL_r(K[[z]]) with Φ(0) = 1 and ∂_k Φ = −A_k Φ for all k. Writing Φ = Σ_α Φ_α z^α, one has α!·Φ_α ∈ M_r(R) for every multi-index α, where α! = ∏ α_i!; the same holds for Φ^{-1}, which solves ∂_k Ψ = Ψ A_k.

**Hypotheses.** char K = 0; A_k integral over R; integrability.

**Construction or proof.**

1. The equations give the recursion (α_k + 1)Φ_{α+e_k} = −Σ_{β ≤ α} A_{k,α−β} Φ_β; integrability makes the values obtained through different k agree, so a unique formal solution exists (induction on |α|).
2. Multiplying by α!: (α + e_k)! Φ_{α+e_k} = −Σ_{β≤α} (α!/β!) A_{k,α−β} (β! Φ_β), and α!/β! is an integer for β ≤ α; induction gives integrality of α!Φ_α.
3. Φ^{-1} satisfies the transposed system with the same shape of recursion.

**Prerequisites.** `mathlib:MvPowerSeries`.

**Acceptance.**

- m = 1, r = 1, A = −1: Φ = exp(z) with α!Φ_α = 1.
- A = 0: Φ = 1.

**Sources.**

- lv2020, §3.3, (3.6) and the following paragraph, pp. 16–17: The formal solution; the integrality estimate is the 'direct computation' LV refer to.

**Signature gap:** Named theorem interfaces — LV.2.

### p-adic convergence of formal horizontal sections on the residue disk

**Node:** `MordellLawrenceVenkatesh:LV.2/horizontal-sections-padic-convergence` · lemma; implementation unchecked.

In the setting of the formal-solution lemma, let R = 𝒪_(v) ⊆ K for a finite place v with K_v/ℚ_p unramified and p > 2. Then Φ and Φ^{-1} converge absolutely for z ∈ K_v^m with |z_i|_v < |p|_v^{1/(p−1)}. More precisely the series x ↦ Φ(p x) has coefficients p^{|α|}Φ_α ∈ M_r(𝒪_v) tending to zero, so it is a restricted power series over 𝒪_v in x ∈ 𝒪_v^m; in particular Φ(z) ∈ GL_r(𝒪_v) and Φ(z) ≡ 1 mod p for z ∈ (p𝒪_v)^m.

**Hypotheses.** K_v/ℚ_p unramified; p > 2; A_k with 𝒪_(v)-integral coefficients.

**Construction or proof.**

1. By the formal-solution lemma |Φ_α|_v ≤ |α!|_v^{-1}, and Legendre's bound v_p(n!) ≤ n/(p−1) gives |α!|_v^{-1} ≤ p^{|α|/(p−1)} (v unramified, so |p|_v = p^{-1}).
2. Hence |p^{|α|}Φ_α|_v ≤ p^{−|α|(p−2)/(p−1)} → 0 for p ≥ 3, and Φ(z) converges for |z_i| < p^{−1/(p−1)}.
3. The constant term is 1 and all other terms of Φ(px) are divisible by p (as |α|(p−2)/(p−1) > 0 and the valuation is an integer ≥ 1 once positive), so Φ(z) ≡ 1 mod p and is invertible; the same for Φ^{-1}.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.2/formal-horizontal-sections`; `mathlib:Nat.factorization_factorial_le_div_pred`; `mathlib:MvPowerSeries.IsRestricted`.

**Acceptance.**

- p = 3: Φ = exp(z) converges on |z| < 3^{-1/2}, which contains 3ℤ_3.
- p = 2 fails: exp(z) does not converge on 2ℤ_2, which is why LV assume p > 2.

**Sources.**

- lv2020, §3.3, p. 17: The hypotheses used for convergence on the residue disk; LV state convergence for |z_i|_v < |p|_v^{1/(p−1)} just before.

**Signature gap:** Named theorem interfaces — LV.2.

### Complex convergence of formal horizontal sections (majorants)

**Node:** `MordellLawrenceVenkatesh:LV.2/horizontal-sections-complex-convergence` · lemma; implementation unchecked.

In the setting of the formal-solution lemma, let ι : K → ℂ be an embedding and suppose that the entries of the ι-images of all A_k converge on a polydisk around 0. Then ι(Φ) converges on a polydisk around 0 and is the holomorphic fundamental solution there: ∂_k ι(Φ) = −ι(A_k) ι(Φ), ι(Φ)(0) = 1.

**Hypotheses.** ι : K → ℂ; ι(A_k) convergent near 0.

**Construction or proof.**

1. Cauchy's estimates give M, ρ > 0 with ‖ι(A_{k,α})‖ ≤ M ρ^{−|α|} for all k and α; the series Â(z) = M/(1 − (z_1+⋯+z_m)/ρ) has coefficients M·(|α|!/α!)·ρ^{−|α|} ≥ M ρ^{−|α|}, so it majorizes every ι(A_k).
2. The scalar system ∂_k Φ̂ = Â Φ̂ (k = 1…m) is integrable and has the solution Φ̂ = (1 − (z_1+⋯+z_m)/ρ)^{−Mρ}, which converges for Σ|z_i| < ρ.
3. By induction on |α| using the recursion, ‖ι(Φ_α)‖ ≤ Φ̂_α; so ι(Φ) converges where Φ̂ does, and termwise differentiation gives the differential equation.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.2/formal-horizontal-sections`; `mathlib:HasFPowerSeriesOnBall`; `mathlib:FormalMultilinearSeries.radius`.

**Acceptance.**

- m = 1, A = −a/(1 − z) with a ∈ ℚ: ∂Φ = aΦ/(1 − z) and Φ = (1 − z)^{−a}, converging for |z| < 1.

**Sources.**

- lv2020, §3.3, p. 17: LV assert ι-adic absolute convergence for small |z_i|_ℂ; the node supplies Cauchy's majorant argument.

**Signature gap:** Named theorem interfaces — LV.2.

### p-adic Gauss–Manin transport on a residue disk (LV (3.7))

**Node:** `MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-padic` · construction; implementation unchecked.

Let 𝒳 → 𝒴' → 𝒴 be a good model, v ∉ S with K_v/ℚ_p unramified and p > 2, y₀ ∈ 𝒴(𝒪_v), and choose parameters z at y₀ and a basis v_1, …, v_r of ℋ on a neighbourhood of ȳ₀ (compatible with the Hodge filtration at y₀). For y ∈ Ω_v(y₀) the matrix Φ(z(y)) of horizontal sections defines an 𝒪_v-linear isomorphism T_v(y) : ℋ_{y₀} → ℋ_y, the Gauss–Manin transport. It is independent of the choices of basis and parameters, satisfies T_v(y₀) = id, is compatible with the ℰ-structure along the transport 𝓔_{y₀} ≅ 𝓔_y (LV (6.3)), preserves the polarization pairing, and satisfies T_v(y'') = T_{v}(y', y'') ∘ T_v(y') for the transport based at y' ∈ Ω_v(y₀).

**Hypotheses.** good model; v ∉ S, K_v/ℚ_p unramified, p > 2; y, y₀ in one residue disk.

**Construction or proof.**

1. For an 𝒪_v-section the connection matrix has coefficients in 𝒪_v[[z]]. For a section and coordinates defined over 𝒪_(v), its coefficients are in 𝒪_(v)[[z]]; only this latter case gives the common formal solution over K.
2. The formal solution Φ converges on (p𝒪_v)^m with values in GL_r(𝒪_v); define T_v(y) as the map sending the fibre at y₀ of a horizontal formal section to its value at y.
3. Independence of choices: two formal horizontal frames differ by a constant matrix, and a change of parameters is an analytic substitution.
4. ℰ is itself a module with integrable connection d_ℰ; its transport is a ring isomorphism, and the Leibniz rule makes T_v(y) semilinear over it; horizontality of the pairing makes T_v(y) preserve it.
5. The cocycle identity follows from uniqueness of horizontal sections.

 REVIEW CONVENTION: at a local point y, write 𝓔_y = y*ℰ and ℋ_y = y*ℋ for integral fibres, and E_y = 𝓔_y[1/p] for the local étale K_v-algebra. Global residue fields K(y′) and their completions are available only for K-rational y. A common formal series over K requires a K-rational base point; arbitrary complex or 𝒪_v base points only give series over their respective coefficient fields.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.2/de-rham-bundle`; `MordellLawrenceVenkatesh:LV.2/residue-disk`; `MordellLawrenceVenkatesh:LV.2/horizontal-sections-padic-convergence`.

**Uses.**

- MordellLawrenceVenkatesh:LV.2/crystalline-frobenius-on-fibres: compare filtered Frobenius modules by horizontal transport. The consumer is Crystalline Frobenius on the de Rham cohomology of the fibres and its compatibility with Gauss–Manin transport (LV (3.9)).
- MordellLawrenceVenkatesh:LV.3/padic-period-map: compare filtered Frobenius modules by horizontal transport. The consumer is The p-adic period map on a residue disk.
- MordellLawrenceVenkatesh:LV.3/period-maps-common-series: compare filtered Frobenius modules by horizontal transport. The consumer is The complex and p-adic period maps are given by one tuple of power series over K.
- MordellLawrenceVenkatesh:LV.4/fibre-filtered-phi-transport: compare filtered Frobenius modules by horizontal transport. The consumer is The filtered φ-module of a fibre read off from the period map (LV (6.6)–(6.7)).
- MordellLawrenceVenkatesh:LV.4/finiteness-criterion: compare filtered Frobenius modules by horizontal transport. The consumer is Finiteness criterion on a residue disk of a curve.
- MordellLawrenceVenkatesh:LV.6/legendre-generic-simplicity: compare filtered Frobenius modules by horizontal transport. The consumer is Generic simplicity of the Legendre curves (LV Lemma 4.4).

**Planning API.**

- `gaussManinTransport` (constructor; signature omitted): T_v(y) : ℋ_{y₀} ≃ ℋ_y for y ∈ Ω_v(y₀).
- `gaussManinTransport_self` (simp; signature omitted): T_v(y₀) = id.
- `gaussManinTransport_trans` (relation; signature omitted): Transitivity T_v(y'') = T_{y'}(y'') ∘ T_v(y') for y', y'' in one disk.
- `gaussManinTransport_algebra` (other; signature omitted): The integral transport is a ring isomorphism 𝓔_{y₀} ≃ 𝓔_y, and T_v(y) is semilinear over it; after inverting p it identifies the local étale K_v-algebras.
- `gaussManinTransport_pairing` (relation; signature omitted): ⟨T_v(y)x, T_v(y)x'⟩ = T_ℰ(⟨x, x'⟩).
- `gaussManinTransport_matrix` (characterisation; signature omitted): In a basis near ȳ₀, the matrix of T_v(y) is Φ(z(y)), with entries restricted power series in z/p.
- `gaussManinTransport_indep` (extensionality; signature omitted): T_v(y) does not depend on the basis or on the parameters.
- `gaussManinTransport_pairs` (equivalence; signature omitted): For K-rational y and y₀, the local-factor bijection becomes the bijection of pairs (y′,w) over (y,v) with K(y′)_w ≅ K(y₀′)_{w₀}. For general local points use the factors of 𝓔_y[1/p].
- `gaussManinTransport_constant` (example; signature omitted): For a constant family T_v(y) = id.

**Mathematical tests.**

- `gaussManinTransport.reviewTest1` (degenerate; signature omitted): For a constant family, T_{y₀,y}=id in the constant frame.
- `gaussManinTransport.reviewTest2` (compatibility; signature omitted): T_{y₁,y₂}∘T_{y₀,y₁}=T_{y₀,y₂}, and T_{y,y₀}=T_{y₀,y}⁻¹ within a residue disk.
- `gaussManinTransport.reviewTest3` (non-example; signature omitted): Transport need not carry F¹ at y₀ to F¹ at y; that stronger condition would make the nonconstant Legendre period map constant.

**Acceptance.**

- For the constant family the transport is the identity.
- For ℰ: the transport identifies E_{y₀} ⊗ K_v = ∏ K(y₀')_w with E_y ⊗ K_v factor by factor, giving the bijection (6.4) of pairs (y', w) over (y, v) and (y₀', w₀) over (y₀, v).

**Sources.**

- lv2020, §3.3, (3.7), p. 17: The transport (3.7).
- lv2020, §6, (6.3)–(6.6), p. 30: Compatibility with the ℰ-structure used in §6.

**Planet:** Gauss–Manin transport.

**Signature gap:** Suggested signatures — gauss-manin-transport-padic.

### Complex Gauss–Manin transport and Betti parallel transport (LV (3.8))

**Node:** `MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-complex` · construction; implementation unchecked.

Let ι:K→ℂ, y₀∈Y(ℂ), and Ω_ℂ a contractible open neighbourhood. Horizontal sections of the analytic Gauss–Manin bundle define T_ℂ(y):ℋ^an_{y₀}≃ℋ^an_y. Under de Rham–Betti comparison this is parallel transport in R¹(π∘f)_*ℂ along paths in Ω_ℂ, compatible with the étale algebra and polarization. If y₀ is K-rational and local coordinates and frames are defined over K, its matrix near y₀ is ι(Φ)(z(y)) for the same K-coefficient formal solution as in the p-adic construction.

**Hypotheses.** ι : K → ℂ; Ω_ℂ contractible.

**Construction or proof.**

1. The complex convergence lemma gives a holomorphic fundamental matrix from the formal horizontal solution over ℂ. When the base point and frame are defined over K, uniqueness identifies it with ι(Φ). Continue along paths in the contractible neighbourhood.
2. Horizontal sections of the analytic Gauss–Manin connection are the locally constant sections of the Betti local system (de Rham–Betti comparison for proper smooth families with Gauss–Manin compatibility, in degree one for abelian schemes).
3. ℰ ⊗ ℂ corresponds to the locally constant functions on the covering Y'(ℂ) → Y(ℂ), giving the decomposition over the points above y.

 REVIEW CONVENTION: at a local point y, write 𝓔_y = y*ℰ and ℋ_y = y*ℋ for integral fibres, and E_y = 𝓔_y[1/p] for the local étale K_v-algebra. Global residue fields K(y′) and their completions are available only for K-rational y. A common formal series over K requires a K-rational base point; arbitrary complex or 𝒪_v base points only give series over their respective coefficient fields.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.2/de-rham-bundle`; `MordellLawrenceVenkatesh:LV.2/horizontal-sections-complex-convergence`; `ComplexComparisonPartII:C5`; `AbelianSchemesAndArithmeticModuli:A5`; `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`; `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`.

**Uses.**

- MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group: identify the analytic period map with topological monodromy. The consumer is The algebraic monodromy group of an abelian-by-finite family and full monodromy (LV (3.5), (5.1)).
- MordellLawrenceVenkatesh:LV.3/complex-period-map: identify the analytic period map with topological monodromy. The consumer is The complex period map and its equivariant continuation to the universal cover.
- MordellLawrenceVenkatesh:LV.3/period-maps-common-series: identify the analytic period map with topological monodromy. The consumer is The complex and p-adic period maps are given by one tuple of power series over K.

**Planning API.**

- `gaussManinTransportComplex` (constructor; signature omitted): T_ℂ(y) for y in a contractible neighbourhood of y₀.
- `gaussManinTransportComplex_eq_parallel` (compatibility; signature omitted): T_ℂ(y) is Betti parallel transport under the de Rham–Betti comparison.
- `gaussManinTransportComplex_series` (characterisation; signature omitted): For a K-rational base point with coordinates and frame over K, the matrix near that point is ι(Φ)(z(y)). For an arbitrary complex point use the corresponding complex formal solution.
- `gaussManinTransportComplex_trans` (relation; signature omitted): Transitivity along paths in Ω_ℂ.
- `gaussManinTransportComplex_pairing` (relation; signature omitted): Compatibility with the polarization and the ℰ-structure.
- `gaussManinTransportComplex_monodromy` (other; signature omitted): Analytic continuation along a loop γ at y₀ gives the monodromy μ(γ).
- `gaussManinTransportComplex_legendre` (example; signature omitted): The Legendre family's period matrix.

**Mathematical tests.**

- `gaussManinTransportComplex.reviewTest1` (degenerate; signature omitted): Constant families have identity transport in a constant frame.
- `gaussManinTransportComplex.reviewTest2` (compatibility; signature omitted): On a contractible chart, de Rham transport equals Betti parallel transport under comparison.
- `gaussManinTransportComplex.reviewTest3` (non-example; signature omitted): Continuation around a standard puncture of the Legendre base has nontrivial unipotent monodromy, so it is not identity transport around every loop.

**Acceptance.**

- For the Legendre family, T_ℂ(y) is given by the periods of dx/y and x dx/y along a transported basis of H₁.
- Monodromy: for a loop γ at y₀ the analytic continuation of T_ℂ is the monodromy of the local system.

**Sources.**

- lv2020, §3.3, (3.8), p. 17: The complex transport.
- lv2020, §3.2, p. 16: The Betti local system and its monodromy.

**Signature gap:** Suggested signatures — gauss-manin-transport-complex.

### Crystalline Frobenius on the de Rham cohomology of the fibres and its compatibility with Gauss–Manin transport (LV (3.9))

**Node:** `MordellLawrenceVenkatesh:LV.2/crystalline-frobenius-on-fibres` · construction; implementation unchecked.

In the unramified p-adic setting with p>2, put V_y=ℋ_y[1/p] and E_y=𝓔_y[1/p] for y∈𝒴(𝒪_v). The crystalline Frobenius on H¹_cris(X_ȳ/W(k_v))[1/p] transports under Berthelot–Ogus comparison to a bijective map φ_y of V_y. It is semilinear for arithmetic Frobenius on K_v and on each unramified field factor L_i of E_y; on the corresponding abelian-variety cohomology it is its crystalline Frobenius. For y and y₀ in the same disk, T_v(y)φ_{y₀}=φ_yT_v(y). When y is K-rational the factors L_i are the completions K(y′)_w indexed by pairs over (y,v).

**Hypotheses.** good model; v ∉ S, K_v/ℚ_p unramified, p > 2; y ∈ 𝒴(𝒪_v).

**Construction or proof.**

1. The Berthelot–Ogus comparison identifies crystalline cohomology of the special fibre with the de Rham cohomology of any smooth proper lift; the crystalline Frobenius is σ-semilinear and bijective after inverting p.
2. The relative crystalline cohomology of 𝒳_{k_v}/𝒴_{k_v} is a crystal whose value on the formal completion of 𝒴 along ȳ₀ is ℋ with ∇, and whose transition isomorphisms between the two sections y, y₀ (same reduction) are given by the Taylor series of ∇; for p > 2 and v unramified this series converges on the PD-thickening defined by p and equals T_v(y).
3. Crystalline Frobenius is functorial for the transition isomorphisms of the crystal, hence commutes with T_v(y).
4. The finite étale 𝒴' contributes H⁰, on which crystalline Frobenius is the Frobenius of the étale algebra; the E-semilinearity follows from compatibility of Frobenius with cup product.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — LocalFieldsRamification Layer 2 (unramified extensions and Frobenius). REVIEW CONVENTION: at a local point y, write 𝓔_y = y*ℰ and ℋ_y = y*ℋ for integral fibres, and E_y = 𝓔_y[1/p] for the local étale K_v-algebra. Global residue fields K(y′) and their completions are available only for K-rational y. A common formal series over K requires a K-rational base point; arbitrary complex or 𝒪_v base points only give series over their respective coefficient fields. Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-padic`; `MordellLawrenceVenkatesh:LV.2/de-rham-bundle`; `CrystallineCohomology:CR.1`; `CrystallineCohomology:CR.2`; `CrystallineCohomology:CR.3`; `CrystallineCohomology:CR.7`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

**Uses.**

- MordellLawrenceVenkatesh:LV.3/padic-period-map: fix a Frobenius operator while the Hodge subspace varies. The consumer is The p-adic period map on a residue disk.
- MordellLawrenceVenkatesh:LV.4/fibre-representation-crystalline: fix a Frobenius operator while the Hodge subspace varies. The consumer is The fibre representations are crystalline with the de Rham cohomology of the fibre as filtered φ-module.
- MordellLawrenceVenkatesh:LV.4/fibre-filtered-phi-transport: fix a Frobenius operator while the Hodge subspace varies. The consumer is The filtered φ-module of a fibre read off from the period map (LV (6.6)–(6.7)).
- MordellLawrenceVenkatesh:LV.7/frobenius-stable-lagrangian-avoidance: fix a Frobenius operator while the Hodge subspace varies. The consumer is Lagrangians meeting a Frobenius-stable subspace in half its dimension (LV Lemma 6.3).
- MordellLawrenceVenkatesh:LV.7/generic-simplicity-family: fix a Frobenius operator while the Hodge subspace varies. The consumer is Generic simplicity along the family (LV Lemma 6.1).

**Planning API.**

- `crystallineFrobenius` (constructor; signature omitted): φ_y on ℋ_y ⊗ K_v for y ∈ 𝒴(𝒪_v).
- `crystallineFrobenius_semilinear` (other; signature omitted): φ_y(a x)=σ(a)φ_y(x) for a∈K_v, and φ_y(e x)=Frob(e)φ_y(x) for e∈E_y=𝓔_y[1/p].
- `crystallineFrobenius_bijective` (other; signature omitted): φ_y is bijective.
- `crystallineFrobenius_transport` (relation; signature omitted): T_v(y) ∘ φ_{y₀} = φ_y ∘ T_v(y) for y in the disk of y₀.
- `crystallineFrobenius_factor` (compatibility; signature omitted): On a factor L_i of E_y=𝓔_y[1/p], φ_y is crystalline Frobenius semilinear over arithmetic Frobenius of L_i/ℚ_p. For rational y, L_i=K(y′)_w.
- `crystallineFrobenius_pairing` (relation; signature omitted): ⟨φx, φx'⟩ = p·Frob⟨x, x'⟩ for the polarization pairing.
- `crystallineFrobenius_example` (example; signature omitted): Ordinary and supersingular elliptic curves.

**Mathematical tests.**

- `crystallineFrobenius.reviewTest1` (computation; signature omitted): For H¹ of y²=x³−x over ℚ₃, crystalline Frobenius has characteristic polynomial X²+3.
- `crystallineFrobenius.reviewTest2` (compatibility; signature omitted): The polarization pairing satisfies ω(φx,φy)=p·Frob(ω(x,y)), not equality without the factor p.
- `crystallineFrobenius.reviewTest3` (non-example; signature omitted): Over an unramified quadratic extension, φ(a x)=σ(a)φ(x); for σ(a)≠a and x≠0 it is not linear over that extension.

**Acceptance.**

- For an elliptic curve with ordinary reduction, φ has slopes 0 and 1 on the two-dimensional H¹_dR; for supersingular reduction both slopes are 1/2.
- For the constant family X = A × 𝒴, φ_y = φ_{y₀} under the identity transport.

**Sources.**

- lv2020, §3.3, (3.9), p. 17: Diagram (3.9) and its sources.
- lv2020, §3.3, p. 17: The semilinearity of φ_v.
- berthelot-ogus, §7, Corollary 7.4, p. 7.4: The comparison of crystalline cohomology with the de Rham cohomology of a lift (formula lost in the text extraction).

**Planet:** Crystalline Frobenius.

**Signature gap:** Suggested signatures — crystalline-frobenius-on-fibres.

### Exact follow-ups for LV.2

- Supply/resolve LV-import-28 — Spreading polarized families and good models (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — abelian-by-finite-family (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — good-model (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — de-rham-bundle (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — residue-disk (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — gauss-manin-transport-padic (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — gauss-manin-transport-complex (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — crystalline-frobenius-on-fibres (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.2 (exact interface and affected nodes are in gaps).
- Resolve exact supplier contracts LV-import-19, LV-import-20, LV-import-21, LV-import-22, LV-import-23, LV-import-24, LV-import-25, LV-import-26, LV-import-27, LV-import-28, LV-import-29; the stage imports name plans, not proofs.

## LV.3 — Lagrangian period varieties and the complex and p-adic period maps

### Adapted symplectic bases

**Node:** `MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis` · lemma; implementation unchecked.

Every basis of a Lagrangian L in a finite-dimensional symplectic space extends to a symplectic basis (e_i,f_i); the span of the f_i is a Lagrangian complement. This holds in every characteristic.

**Hypotheses.** k a field (no condition on the characteristic); ω alternating and nondegenerate; dim_k V = 2d.

**Construction or proof.**

1. (b) The map V → L^*, u ↦ ω(u, ·)|_L, is surjective with kernel L^⊥ = L; for any complement W of L it restricts to an isomorphism W ≅ L^*. Let g_i ∈ W be dual to e_i, i.e. ω(g_i, e_j) = −δ_ij. Put f_i = g_i + Σ_{j<i} a_ij e_j with a_ij = −ω(g_i, g_j); for j < i one computes ω(f_i, f_j) = ω(g_i, g_j) + a_ij = 0 (a triangular correction that needs no division by 2), and ω(e_i, f_j) = δ_ij, so (e_i, f_i) is a symplectic basis and L' = span(f_i) is a Lagrangian complement of L.

**Prerequisites.** `mathlib:LinearMap.BilinForm.IsAlt`; `mathlib:LinearMap.BilinForm.Nondegenerate`; `mathlib:LinearMap.BilinForm.orthogonal`; `mathlib:LinearMap.BilinForm.finrank_orthogonal`; `tauceti:TauCeti.BilinForm.isometryGroup`; `MordellLawrenceVenkatesh:LV.3/isotropic-dimension`.

**Owner proposal.** AlgebraicModuliForArithmeticGeometry; General symplectic and finite-étale Grassmannian interfaces, used beyond LV.

**Acceptance.**

- In the standard symplectic plane, any nonzero vector can be completed to a symplectic basis.
- The triangular correction works also in characteristic two, without dividing by 2.

**Sources.**

- lv2020, §6, Lemma 6.4, p. 33: LV use Lagrangian Grassmannians and standard symplectic bases (proof of Lemma 6.4) without proof; the node supplies the linear algebra.

**Signature gap:** Named theorem interfaces — LV.3.

### Dimension criterion for Lagrangians

**Node:** `MordellLawrenceVenkatesh:LV.3/isotropic-dimension` · lemma; implementation unchecked.

Every isotropic subspace L of a 2d-dimensional symplectic space has dimension at most d. It is Lagrangian (L=L^⊥) exactly when its dimension is d.

**Hypotheses.** k a field (no condition on the characteristic); ω alternating and nondegenerate; dim_k V = 2d.

**Construction or proof.**

1. (a) dim L + dim L^⊥ = 2d for nondegenerate ω, and L ⊆ L^⊥ for isotropic L.

**Prerequisites.** `mathlib:LinearMap.BilinForm.IsAlt`; `mathlib:LinearMap.BilinForm.Nondegenerate`; `mathlib:LinearMap.BilinForm.orthogonal`; `mathlib:LinearMap.BilinForm.finrank_orthogonal`; `tauceti:TauCeti.BilinForm.isometryGroup`.

**Owner proposal.** AlgebraicModuliForArithmeticGeometry; General symplectic and finite-étale Grassmannian interfaces, used beyond LV.

**Acceptance.**

- In a symplectic plane a line is Lagrangian, but the whole plane is not isotropic.

**Sources.**

- lv2020, §6, Lemma 6.4, p. 33: LV use Lagrangian Grassmannians and standard symplectic bases (proof of Lemma 6.4) without proof; the node supplies the linear algebra.

**Signature gap:** Named theorem interfaces — LV.3.

### Transitivity on Lagrangian subspaces

**Node:** `MordellLawrenceVenkatesh:LV.3/lagrangian-transitivity` · lemma; implementation unchecked.

Sp(V,ω)(k) acts transitively on the Lagrangian subspaces of V.

**Hypotheses.** k a field (no condition on the characteristic); ω alternating and nondegenerate; dim_k V = 2d.

**Construction or proof.**

1. (c) Given Lagrangians L_1, L_2, choose symplectic bases adapted to each by (b); the linear map sending one basis to the other is symplectic and maps L_1 to L_2.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis`; `MordellLawrenceVenkatesh:LV.3/isotropic-dimension`.

**Owner proposal.** AlgebraicModuliForArithmeticGeometry; General symplectic and finite-étale Grassmannian interfaces, used beyond LV.

**Acceptance.**

- d = 1: every line of (k², det) is Lagrangian and SL₂(k) = Sp₂(k) acts transitively on ℙ¹(k).

**Sources.**

- lv2020, §6, Lemma 6.4, p. 33: LV use Lagrangian Grassmannians and standard symplectic bases (proof of Lemma 6.4) without proof; the node supplies the linear algebra.

**Signature gap:** Named theorem interfaces — LV.3.

### Symmetric graph charts

**Node:** `MordellLawrenceVenkatesh:LV.3/lagrangian-transverse-chart` · lemma; implementation unchecked.

For complementary Lagrangians L,L′, the Lagrangians transverse to L′ are uniquely the graphs of maps S:L→L′ such that ω(x,Sy)=ω(y,Sx). In an adapted symplectic basis these are symmetric matrices.

**Hypotheses.** k a field (no condition on the characteristic); ω alternating and nondegenerate; dim_k V = 2d.

**Construction or proof.**

1. (d) A complement of L' is the graph of a unique linear S : L → L'. Since ω vanishes on L × L and on L' × L', ω(x + Sx, y + Sy) = ω(x, Sy) + ω(Sx, y), which vanishes for all x, y exactly when ω(x, Sy) = ω(y, Sx); a d-dimensional isotropic graph is Lagrangian by (a).

**Prerequisites.** `MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis`; `MordellLawrenceVenkatesh:LV.3/isotropic-dimension`.

**Owner proposal.** AlgebraicModuliForArithmeticGeometry; General symplectic and finite-étale Grassmannian interfaces, used beyond LV.

**Acceptance.**

- In k⁴ with basis (e₁, e₂, f₁, f₂): span(e₁, f₂) is Lagrangian, span(e₁, f₁) is not; the graph of the symmetric matrix [[1, 2], [2, 3]] over span(e) is Lagrangian and the graph of [[0, 1], [0, 0]] is not.

**Sources.**

- lv2020, §6, Lemma 6.4, p. 33: LV use Lagrangian Grassmannians and standard symplectic bases (proof of Lemma 6.4) without proof; the node supplies the linear algebra.

**Signature gap:** Named theorem interfaces — LV.3.

### Arnold chart cover

**Node:** `MordellLawrenceVenkatesh:LV.3/arnold-chart-cover` · lemma; implementation unchecked.

In a symplectic basis (e_i,f_i), put Λ_I=span(e_i:i∈I;f_j:j∉I). Every Lagrangian is transverse to some Λ_I.

**Hypotheses.** k a field (no condition on the characteristic); ω alternating and nondegenerate; dim_k V = 2d.

**Construction or proof.**

1. (e) Let K = L ∩ span(e_1, …, e_d). Choose I such that (e_i)_{i∈I} is a basis of a complement of K in span(e) (exchange lemma). If u = Σ_{i∈I} a_i e_i + Σ_{j∉I} b_j f_j lies in L, pairing with κ ∈ K ⊆ L gives Σ_{j∉I} b_j κ_j = 0, where κ_j is the e_j-coordinate of κ; the projection of K onto span(e_j : j ∉ I) is bijective, so b = 0; then u ∈ K ∩ span(e_I) = 0.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis`; `MordellLawrenceVenkatesh:LV.3/isotropic-dimension`.

**Owner proposal.** AlgebraicModuliForArithmeticGeometry; General symplectic and finite-étale Grassmannian interfaces, used beyond LV.

**Acceptance.**

- (e) for L = span(f₁, e₂) and the basis above: L is transverse to Λ_{{1}} = span(e₁, f₂).

**Sources.**

- lv2020, §6, Lemma 6.4, p. 33: LV use Lagrangian Grassmannians and standard symplectic bases (proof of Lemma 6.4) without proof; the node supplies the linear algebra.

**Signature gap:** Named theorem interfaces — LV.3.

### The Lagrangian Grassmannian

**Node:** `MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian` · definition; implementation unchecked.

Let k be a field and (V, ω) a symplectic k-vector space of dimension 2d, as in the lemma on Lagrangian subspaces. LGr(V, ω) is the functor on commutative k-algebras A ↦ {W ∈ G(d, A ⊗ V; A) : ω_A(W, W) = 0}, where G(d, A ⊗ V; A) is Mathlib's Grassmannian of submodules with locally free quotient of rank d (for W isotropic of corank d this is the same as W being a rank-d direct summand); it is represented by a closed subscheme of the Grassmannian scheme Gr(V, d). Its k'-points for a field k' ⊇ k are the Lagrangian subspaces of V ⊗ k'. It carries the action of Sp(V, ω), the open charts U_{L'} (Lagrangians transverse to a fixed Lagrangian L'), each isomorphic to the affine space of symmetric maps L → L' ≅ L^*, and the Plücker embedding into ℙ(∧^d V) restricted from Gr(V, d).

**Hypotheses.** k a field; (V, ω) symplectic of dimension 2d.

**Construction or proof.**

1. Define the subfunctor of Mathlib's Grassmannian functor by the isotropy condition; it is compatible with base change because ω_A is.
2. Representability: on the Grassmannian scheme the isotropy condition is the vanishing of the section of (∧²𝒲)^∨ induced by ω on the tautological subbundle 𝒲, a closed condition (R09.1).
3. Charts: U_{L'} is the intersection with the open Schubert chart of subspaces transverse to L'; by the symmetric-graph-chart lemma, over every A its points are the graphs of symmetric A-linear maps, so U_{L'} ≅ 𝔸^{d(d+1)/2}.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis`; `mathlib:Module.Grassmannian`; `mathlib:Module.Grassmannian.functor`; `AlgebraicModuliForArithmeticGeometry:R09.1`; `MordellLawrenceVenkatesh:LV.3/isotropic-dimension`; `MordellLawrenceVenkatesh:LV.3/lagrangian-transitivity`; `MordellLawrenceVenkatesh:LV.3/lagrangian-transverse-chart`; `MordellLawrenceVenkatesh:LV.3/arnold-chart-cover`.

**Owner proposal.** AlgebraicModuliForArithmeticGeometry; General symplectic and finite-étale Grassmannian interfaces, used beyond LV.

**Uses.**

- MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian-geometry: parametrize isotropic half-dimensional subspaces scheme-theoretically. The consumer is The Lagrangian Grassmannian is smooth, projective and geometrically irreducible of dimension d(d+1)/2.
- MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety: parametrize isotropic half-dimensional subspaces scheme-theoretically. The consumer is The Lagrangian period variety of a symplectic module over a finite étale algebra.
- MordellLawrenceVenkatesh:LV.7/lagrangian-general-position: parametrize isotropic half-dimensional subspaces scheme-theoretically. The consumer is General position for tuples of Lagrangians (LV Lemma 6.4).

**Planning API.**

- `LagrangianGrassmannian` (constructor; signature omitted): LGr(V, ω) as a closed subscheme of Gr(V, d) representing the isotropic-submodule subfunctor.
- `LagrangianGrassmannian.functor` (data; signature omitted): The subfunctor A ↦ {W ∈ G(d, A ⊗ V; A) : ω_A(W, W) = 0} of Module.Grassmannian.functor.
- `LagrangianGrassmannian.mem_points_iff` (characterisation; signature omitted): For a field k' ⊇ k, the k'-points are the Lagrangian subspaces of V ⊗ k'.
- `LagrangianGrassmannian.chart` (data; signature omitted): For a Lagrangian L' with complement L, the open subscheme U_{L'} ≅ 𝔸(Sym(L → L')) of Lagrangians transverse to L'.
- `LagrangianGrassmannian.chart_cover` (other; signature omitted): For a symplectic basis, the 2^d charts U_{Λ_I} cover LGr(V, ω).
- `LagrangianGrassmannian.plucker` (data; signature omitted): The closed immersion LGr(V, ω) → ℙ(∧^d V) restricted from the Plücker embedding.
- `LagrangianGrassmannian.action` (data; signature omitted): The action of Sp(V, ω) on LGr(V, ω) induced by g ↦ (W ↦ gW).
- `LagrangianGrassmannian.baseChange` (functoriality; signature omitted): LGr(V, ω) ⊗ k' = LGr(V ⊗ k', ω ⊗ k') for a field extension k'/k.
- `LagrangianGrassmannian.dimOne` (example; signature omitted): For d = 1, LGr(V, ω) = ℙ(V).

**Mathematical tests.**

- `LagrangianGrassmannian.reviewTest1` (computation; signature omitted): For a symplectic plane over k, LGr is ℙ¹_k.
- `LagrangianGrassmannian.reviewTest2` (degenerate; signature omitted): For V=0, LGr is Spec k, with its unique zero submodule.
- `LagrangianGrassmannian.reviewTest3` (non-example; signature omitted): In a standard four-dimensional symplectic space, span(e₁,f₁) has half dimension but is not a point of LGr, since ω(e₁,f₁)=1.

**Acceptance.**

- d = 1: LGr(V) = ℙ(V) = ℙ¹.
- d = 2: LGr(V) is the hyperplane section of the Plücker quadric Gr(2, 4) ⊆ ℙ⁵ given by the class of ω, a smooth quadric threefold.

**Sources.**

- lv2020, §6, Lemma 6.4, p. 33: The object.
- lv2020, §6, proof of Lemma 6.4, p. 33: LV use LGr as a closed subvariety of a Grassmannian.

**Planet:** Lagrangian Grassmannian.

**Signature gap:** Suggested signatures — lagrangian-grassmannian.

### The Lagrangian Grassmannian is smooth, projective and geometrically irreducible of dimension d(d+1)/2

**Node:** `MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian-geometry` · lemma; implementation unchecked.

For (V, ω) as in the Lagrangian Grassmannian node, LGr(V, ω) is smooth and projective over k, geometrically irreducible, of dimension d(d+1)/2, and Sp(V, ω)(k̄) acts transitively on LGr(V, ω)(k̄). Consequently every Zariski-closed subset of LGr(V, ω)_{k'} (k' ⊇ k a field) other than the whole space has dimension < d(d+1)/2, and a set of k'-points is Zariski dense if and only if no nonzero homogeneous polynomial in the Plücker coordinates that is nonzero on LGr vanishes on it.

**Hypotheses.** k a field; (V, ω) symplectic of dimension 2d.

**Construction or proof.**

1. Projective: closed in the projective Grassmannian.
2. Smooth of dimension d(d+1)/2: by (e) of the linear-algebra node the charts U_{Λ_I} cover, and each is an affine space of that dimension.
3. Over an algebraic closure each coordinate graph chart is affine space. The Lagrangian span(e_i+f_i) is transverse to every coordinate Λ_I, hence every pair of these irreducible open charts meets; their union is irreducible.
4. Transitivity is (c) of the linear-algebra node over k̄.
5. The dimension statements are dimension theory for integral varieties (a proper closed subset of an integral variety has smaller dimension).
6. For the standard coordinate Lagrangians Λ_I, the single Lagrangian span(e_i + f_i) is transverse to every Λ_I. Thus every pair of the coordinate graph charts has nonempty intersection; the one-complement statement alone would not prove this.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian`; `MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis`; `SchemeAndStackFoundations:SF.0`; `mathlib:AlgebraicGeometry.IsIntegral`; `mathlib:IrreducibleSpace`; `MordellLawrenceVenkatesh:LV.3/isotropic-dimension`; `MordellLawrenceVenkatesh:LV.3/lagrangian-transitivity`; `MordellLawrenceVenkatesh:LV.3/lagrangian-transverse-chart`; `MordellLawrenceVenkatesh:LV.3/arnold-chart-cover`.

**Owner proposal.** AlgebraicModuliForArithmeticGeometry; General symplectic and finite-étale Grassmannian interfaces, used beyond LV.

**Acceptance.**

- d = 1: ℙ¹, dimension 1.
- d = 2: dimension 3.
- d = 3: dimension 6, while Gr(3, 6) has dimension 9.

**Sources.**

- lv2020, §6, proof of Lemma 6.2, p. 31: The dimension d(d+1)/2 per factor, used by LV.

**Signature gap:** Named theorem interfaces — LV.3.

### The Lagrangian period variety of a symplectic module over a finite étale algebra

**Node:** `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety` · definition; implementation unchecked.

Let k be a field, E a finite étale k-algebra, V a free E-module of rank 2d and ω : V × V → E an E-bilinear, alternating, perfect pairing. Put ω_tr := tr_{E/k} ∘ ω, a nondegenerate alternating k-bilinear form on the k-space V of dimension 2d[E:k]. The period variety LGr_E(V, ω) is the closed subscheme of LGr(V, ω_tr) whose A-points are the Lagrangian W ⊆ A ⊗_k V that are E ⊗_k A-submodules. Equivalently, its A-points are the E ⊗ A-submodules W with (A ⊗ V)/W locally free of rank d[E:k] over A and ω_A(W, W) = 0. Its points over a field k' ⊇ k are the free (E ⊗ k')-submodules of rank d of V ⊗ k' that are isotropic for ω; it is LV's Res^E_k LGr(V, ω).

**Hypotheses.** E finite étale over k; V free of rank 2d over E; ω E-bilinear, alternating, perfect.

**Construction or proof.**

1. ω_tr is nondegenerate because the trace form of an étale algebra is nondegenerate and ω is perfect.
2. For an E-stable W, ω(W, W) = 0 if and only if tr(e·ω(x, y)) = ω_tr(ex, y) = 0 for all e, x, y, i.e. if and only if ω_tr(W, W) = 0.
3. E-stability is a closed condition on the Grassmannian (stability of the tautological subbundle under the finitely many endomorphisms given by a k-basis of E; R09.1), so LGr_E(V, ω) is a closed subscheme of LGr(V, ω_tr).
4. Over a field, an E-stable isotropic W splits along the idempotents of E ⊗ k' into ω-isotropic pieces of rank ≤ d; the total dimension d[E:k] forces rank exactly d in each factor, giving the description of the points.

 The E-stable Grassmannian must impose constant E-rank on every component. For E=k×k and V=E², W=k²×0 has the correct total k-dimension but is not an E-line. The Lagrangian locus is defined with this quotient-rank convention, agreeing with Module.Grassmannian.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian`; `MordellLawrenceVenkatesh:LV.0/galois-tensor-splitting`; `mathlib:AlgebraicGeometry.Etale`; `AlgebraicModuliForArithmeticGeometry:R09.1`.

**Owner proposal.** AlgebraicModuliForArithmeticGeometry; General symplectic and finite-étale Grassmannian interfaces, used beyond LV.

**Uses.**

- MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety-splitting: respect the finite étale algebra and its componentwise ranks. The consumer is Geometry of the period variety.
- MordellLawrenceVenkatesh:LV.3/padic-period-map: respect the finite étale algebra and its componentwise ranks. The consumer is The p-adic period map on a residue disk.
- MordellLawrenceVenkatesh:LV.3/complex-period-map: respect the finite étale algebra and its componentwise ranks. The consumer is The complex period map and its equivariant continuation to the universal cover.
- MordellLawrenceVenkatesh:LV.4/fibre-filtered-phi-transport: respect the finite étale algebra and its componentwise ranks. The consumer is The filtered φ-module of a fibre read off from the period map (LV (6.6)–(6.7)).
- MordellLawrenceVenkatesh:LV.4/filtered-phi-orbit: respect the finite étale algebra and its componentwise ranks. The consumer is Filtrations with isomorphic filtered φ-modules form a Frobenius-centralizer orbit of bounded dimension.

**Planning API.**

- `periodVariety` (constructor; signature omitted): LGr_E(V, ω) as a closed subscheme of LGr(V, tr ∘ ω).
- `periodVariety.mem_iff` (characterisation; signature omitted): W ∈ LGr_E(V, ω)(A) ↔ W is an E ⊗ A-submodule, (A ⊗ V)/W locally free of rank d[E:k], and ω_A(W, W) = 0.
- `periodVariety.mem_points_iff_free` (characterisation; signature omitted): Over a field k' ⊇ k the points are the free rank-d (E ⊗ k')-submodules isotropic for ω.
- `periodVariety.traceForm` (data; signature omitted): ω_tr = tr_{E/k} ∘ ω, nondegenerate and alternating.
- `periodVariety.baseChange` (functoriality; signature omitted): LGr_E(V, ω) ⊗ k' = LGr_{E⊗k'}(V ⊗ k', ω ⊗ k').
- `periodVariety.prodEquiv` (equivalence; signature omitted): For E = E₁ × E₂ (so V = V₁ × V₂), LGr_E(V, ω) ≅ LGr_{E₁}(V₁, ω₁) × LGr_{E₂}(V₂, ω₂), the projections sending W to e_i W.
- `periodVariety.semilinearAction` (data; signature omitted): The group of k-linear automorphisms g of V for which some s ∈ Aut_k(E) satisfies g(ex) = s(e)g(x) and ω(gx, gy) = s(ω(x, y)) acts on LGr_E(V, ω); it contains the E-linear symplectic group Sp_E(V, ω).
- `periodVariety.plucker` (data; signature omitted): The Plücker embedding LGr_E(V, ω) → ℙ(∧^{d[E:k]} V) restricted from LGr(V, ω_tr).
- `periodVariety.stableGrassmannian` (data; signature omitted): Gr_E(V,d) is the componentwise rank-d part of the E-stable locus in Gr_k(V,d[E:k]): over A require the quotient to be finite locally free of rank d over E⊗_k A. This is Res_{E/k} Gr_E(V,d), not the whole stable locus; it contains LGr_E(V,ω), and GL_E(V) acts on it.
- `periodVariety.dimOne` (example; signature omitted): For d = 1 every E-line is isotropic and LGr_E(V, ω) is the variety of free rank-one E-submodules (LV §4.3).

**Mathematical tests.**

- `periodVariety.reviewTest1` (compatibility; signature omitted): For E=k the period variety equals LGr(V,ω).
- `periodVariety.reviewTest2` (computation; signature omitted): For E=k×k and V=E² with the standard form, the period variety is ℙ¹×ℙ¹ and has dimension 2.
- `periodVariety.reviewTest3` (non-example; signature omitted): For E=k×k and V=E², W=k²×0 is E-stable with half the total k-dimension but has component ranks (2,0); it is not a rank-one E-point of the ambient Weil-restricted Grassmannian.

**Acceptance.**

- E = k: LGr_E(V, ω) = LGr(V, ω).
- E = k × k, d = 1: ℙ¹ × ℙ¹.
- E = ℚ(√2), k = ℚ, d = 1: the points over ℚ are the lines of ℚ(√2)², i.e. ℙ¹(ℚ(√2)), and the variety becomes ℙ¹ × ℙ¹ over ℚ(√2).

**Sources.**

- lv2020, §6, proof of Proposition 5.3, p. 29: LV define H_v as a Weil restriction; the node defines the same variety as a closed subscheme of a Grassmannian of k-subspaces, which avoids Weil restriction.
- lv2020, §6, proof of Proposition 5.3, p. 29: The E-stable Lagrangians of the trace form.

**Planet:** Lagrangian period variety.

**Signature gap:** Suggested signatures — lagrangian-period-variety.

### Geometry of the period variety

**Node:** `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety-splitting` · lemma; implementation unchecked.

Let k, E, V, ω be as in the period-variety node and let k' ⊇ k be a field over which E splits, Σ = Hom_k(E, k'). Then E ⊗ k' = k'^Σ, V ⊗ k' = ⊕_{τ∈Σ} V_τ with each (V_τ, ω_τ) a 2d-dimensional symplectic k'-space, and LGr_E(V, ω) ⊗ k' ≅ ∏_{τ∈Σ} LGr(V_τ, ω_τ). Consequently LGr_E(V, ω) is smooth, projective and geometrically irreducible of dimension [E:k]·d(d+1)/2; Sp_E(V, ω)(k̄) = ∏_τ Sp(V_τ, ω_τ)(k̄) acts transitively on its k̄-points; and for a decomposition E = E₁ × E₂ the projection LGr_E(V, ω) → LGr_{E₁}(V₁, ω₁) is surjective (with a section through any point) and maps Zariski-dense sets of points to Zariski-dense sets. For d = 1, LGr_E(V, ω) ⊗ k' ≅ ∏_τ ℙ(V_τ) ≅ (ℙ¹)^Σ.

**Hypotheses.** E finite étale over k; k' splits E.

**Construction or proof.**

1. The splitting of E ⊗ k' and of V ⊗ k' by idempotents is the Galois splitting lemma of LV.0; ω ⊗ k' is diagonal because it is E-bilinear.
2. An E ⊗ k'-stable isotropic W of the right rank is ⊕_τ W_τ with W_τ Lagrangian in V_τ, which gives the product decomposition functorially in k'-algebras.
3. Smoothness, projectivity, dimension and geometric irreducibility follow from the corresponding statements for each factor (products of smooth projective geometrically irreducible varieties) and descend along k'/k.
4. Transitivity is factorwise transitivity.
5. Surjectivity of the projection and density: the projection is a product projection over k'; for a continuous surjection the image of a dense set is dense.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety`; `MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian-geometry`; `MordellLawrenceVenkatesh:LV.0/galois-tensor-splitting`; `SchemeAndStackFoundations:SF.0`; `MordellLawrenceVenkatesh:LV.0/galois-module-splitting`.

**Owner proposal.** AlgebraicModuliForArithmeticGeometry; General symplectic and finite-étale Grassmannian interfaces, used beyond LV.

**Acceptance.**

- E = ℚ(ζ₈), k = ℚ, d = 1: dimension 4 = [E:ℚ].
- The S-unit case of LV §4.3: E = K_v(t₀^{1/m}) of degree m ≥ 8 over K_v, d = 1, so dim H_v = m ≥ 8.
- The case of LV Lemma 6.2: E₁ = K(y')_w of degree ≥ 8 over K_v gives a factor of dimension ≥ 4d(d+1).

**Sources.**

- lv2020, §6, p. 30: The product decomposition of H_v.
- lv2020, §4.3, p. 23: The d = 1 case over ℂ used for the S-unit theorem.

**Signature gap:** Named theorem interfaces — LV.3.

### The algebraic monodromy group of an abelian-by-finite family and full monodromy (LV (3.5), (5.1))

**Node:** `MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group` · definition; implementation unchecked.

Let X →f Y' →π Y be an abelian-by-finite family of relative dimension d over a smooth connected complex variety Y, and y₀ ∈ Y(ℂ). The Betti local system 𝕍 := R¹(π∘f)_*ℚ on Y(ℂ) has fibre V_B = H¹_B(X_{y₀}(ℂ), ℚ) = ⊕_{y' ∈ π^{-1}(y₀)} H¹_B(X_{y'}(ℂ), ℚ), and parallel transport defines μ : π₁(Y(ℂ), y₀) → GL(V_B), normalized so that μ(δ) is transport backwards along the loop δ. The algebraic monodromy group Γ ⊆ GL(V_B ⊗ ℂ) is the Zariski closure of μ(π₁(Y(ℂ), y₀)). Each μ(δ) permutes the summands H¹_B(X_{y'}) according to the monodromy of the covering π and preserves the total polarization form Σ_{y'} ω_{y'}. The family has full monodromy if Γ ⊇ ∏_{y' ∈ π^{-1}(y₀)} Sp(H¹_B(X_{y'}(ℂ), ℂ), ω_{y'}). For a family over a K-variety and ι : K → ℂ, these notions refer to the base change along ι, and the de Rham–Betti comparison identifies V_B ⊗ ℂ with V_ℂ = ℋ_{y₀} ⊗_ι ℂ, the summands with the factors of E₀ ⊗_ι ℂ = ℂ^{π^{-1}(y₀)}, and ω_{y'} with the components of ω₀.

**Hypotheses.** Y smooth connected over ℂ (or over K with ι); y₀ ∈ Y(ℂ).

**Construction or proof.**

1. The local system and its monodromy come from the proper smooth morphism π∘f (Ehresmann) and the covering π.
2. Zariski closure of the abstract subgroup μ(π₁) in the algebraic group GL(V_B ⊗ ℂ) (ReductiveGroups Layer 3); it is contained in the closed subgroup of elements normalizing the subalgebra ℂ^{π^{-1}(y₀)} of End(V_B ⊗ ℂ) and preserving Σω_{y'}, because μ(π₁) is.
3. Full monodromy is a property of the pair (Γ, decomposition); it does not depend on y₀, since transport along a path conjugates the data.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components); tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.2/abelian-by-finite-family`; `MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-complex`; `AbelianSchemesAndArithmeticModuli:A5`; `ComplexComparisonPartII:C5`; `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`; `mathlib:IsCoveringMap.monodromyPerm`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`; `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`.

**Uses.**

- MordellLawrenceVenkatesh:LV.3/complex-period-map: use a full symplectic product to force period-image density. The consumer is The complex period map and its equivariant continuation to the universal cover.
- MordellLawrenceVenkatesh:LV.3/complex-period-closure-contains-orbit: use a full symplectic product to force period-image density. The consumer is The Zariski closure of the complex period image contains the monodromy orbit (LV Lemma 3.1).
- MordellLawrenceVenkatesh:LV.3/padic-period-image-dense: use a full symplectic product to force period-image density. The consumer is Zariski closure of the p-adic period image (LV Lemma 3.3) and density under full monodromy.
- MordellLawrenceVenkatesh:LV.6/legendre-monodromy: use a full symplectic product to force period-image density. The consumer is Monodromy of the Legendre family.
- MordellLawrenceVenkatesh:LV.6/variant-family-full-monodromy: use a full symplectic product to force period-image density. The consumer is Big monodromy for the cyclic variant of the Legendre family (LV Lemma 4.3).
- MordellLawrenceVenkatesh:LV.10/kodaira-parshin-full-monodromy: use a full symplectic product to force period-image density. The consumer is The Kodaira–Parshin family has full monodromy (LV §8.2.3).

**Planning API.**

- `monodromyRep` (constructor; signature omitted): μ : π₁(Y(ℂ), y₀) →* GL(V_B), transport backwards along loops.
- `algebraicMonodromyGroup` (constructor; signature omitted): Γ, the Zariski closure of the image of μ in GL(V_B ⊗ ℂ).
- `HasFullMonodromy` (constructor; signature omitted): The predicate Γ ⊇ ∏_{y'} Sp(H¹_B(X_{y'}), ω_{y'}).
- `algebraicMonodromyGroup_le_normalizer` (relation; signature omitted): Γ normalizes ℂ^{π^{-1}(y₀)} ⊆ End(V_B ⊗ ℂ) and preserves Σ_{y'} ω_{y'}; hence Γ acts on H_ℂ = LGr_{E₀⊗ℂ}(V_ℂ).
- `hasFullMonodromy_iff_basepoint` (characterisation; signature omitted): Full monodromy does not depend on y₀ ∈ Y(ℂ).
- `algebraicMonodromyGroup_deRham` (compatibility; signature omitted): Under the de Rham–Betti comparison V_B ⊗ ℂ ≅ V_ℂ the summands correspond to the factors of E₀ ⊗_ι ℂ and ω_{y'} to the components of ω₀.
- `HasFullMonodromy.orbit_eq` (other; signature omitted): If the family has full monodromy then Γ·h = H_ℂ(ℂ) for every h ∈ H_ℂ(ℂ) (transitivity on the period variety).
- `hasFullMonodromy_legendre` (example; signature omitted): The Legendre family has full monodromy; a constant family does not.

**Mathematical tests.**

- `monodromyRep.reviewTest1` (computation; signature omitted): The Legendre family has algebraic monodromy SL₂, though its integral image omits −I.
- `monodromyRep.reviewTest2` (degenerate; signature omitted): A constant positive-dimensional polarized family has algebraic monodromy 1 and fails full monodromy.
- `monodromyRep.reviewTest3` (compatibility; signature omitted): A change of base point conjugates the monodromy group by parallel transport and preserves the full-monodromy predicate.

**Acceptance.**

- The Legendre monodromy is generated, in a suitable integral symplectic basis, by [[1,2],[0,1]] and [[1,0],[−2,1]]. This group has index 2 in Γ(2), excludes −I, and is Zariski dense in SL₂; its projective image is Γ(2)/{±I}.
- A constant family A × Y has Γ = 1 and does not have full monodromy (for d ≥ 1).

**Sources.**

- lv2020, §3.2, (3.5), p. 16: The monodromy representation and its Zariski closure Γ.
- lv2020, §5, (5.1), p. 25: Definition of full monodromy.

**Planet:** Full monodromy.

**Signature gap:** Suggested signatures — algebraic-monodromy-group.

### The p-adic period map on a residue disk

**Node:** `MordellLawrenceVenkatesh:LV.3/padic-period-map` · construction; implementation unchecked.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. The p-adic period map is Φ_v : Ω_v → H(K_v), Φ_v(y) := T_v(y)^{-1}(F¹ℋ_y ⊗ K_v), where T_v(y) is the Gauss–Manin transport of LV.2. It satisfies Φ_v(y₀) = h₀ and, for every y ∈ Ω_v, T_v(y) is an isomorphism of E-semilinear filtered φ-modules (ℋ_{y₀} ⊗ K_v, φ_{y₀}, Φ_v(y)) ≅ (ℋ_y ⊗ K_v, φ_y, F¹ℋ_y ⊗ K_v), semilinear over the transport isomorphism E₀ ⊗ K_v ≅ E_y ⊗ K_v.

**Hypotheses.** Setting P.

**Construction or proof.**

1. T_v(y) is semilinear over the ring isomorphism E₀ ⊗ K_v ≅ E_y ⊗ K_v and carries ω₀ to ω_y up to that isomorphism, so the preimage of the E_y-stable Lagrangian F¹ℋ_y ⊗ K_v is an (E₀ ⊗ K_v)-stable Lagrangian of the right rank, i.e. a K_v-point of H.
2. T_v(y₀) = id gives Φ_v(y₀) = h₀.
3. The compatibility with Frobenius is part (b) of the crystalline Frobenius node of LV.2; the filtration statement is the definition of Φ_v.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-padic`; `MordellLawrenceVenkatesh:LV.2/crystalline-frobenius-on-fibres`; `MordellLawrenceVenkatesh:LV.2/de-rham-bundle`; `MordellLawrenceVenkatesh:LV.2/residue-disk`; `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety`.

**Uses.**

- MordellLawrenceVenkatesh:LV.3/period-maps-common-series: pull moving Hodge subspaces back to one fixed fibre. The consumer is The complex and p-adic period maps are given by one tuple of power series over K.
- MordellLawrenceVenkatesh:LV.4/fibre-filtered-phi-transport: pull moving Hodge subspaces back to one fixed fibre. The consumer is The filtered φ-module of a fibre read off from the period map (LV (6.6)–(6.7)).
- MordellLawrenceVenkatesh:LV.6/legendre-generic-simplicity: pull moving Hodge subspaces back to one fixed fibre. The consumer is Generic simplicity of the Legendre curves (LV Lemma 4.4).

**Planning API.**

- `padicPeriodMap` (constructor; signature omitted): Φ_v : Ω_v → H(K_v), y ↦ T_v(y)⁻¹(F¹ℋ_y ⊗ K_v).
- `padicPeriodMap_base` (simp; signature omitted): Φ_v(y₀) = h₀.
- `padicPeriodMap_mem` (other; signature omitted): Φ_v(y) is an (E₀ ⊗ K_v)-stable Lagrangian subspace of V_v.
- `padicPeriodMap_transport` (compatibility; signature omitted): T_v(y) : (V_v, φ_{y₀}, Φ_v(y)) ≅ (ℋ_y ⊗ K_v, φ_y, F¹) as filtered φ-modules, semilinear over E₀ ⊗ K_v ≅ E_y ⊗ K_v.
- `padicPeriodMap_rebase` (relation; signature omitted): For y₁ ∈ Ω_v the period map based at y₁ is Φ_v^{y₁}(y) = T_v(y₁)(Φ_v^{y₀}(y)), since T_{y₁,y} = T_{y₀,y} ∘ T_{y₀,y₁}^{−1}.
- `padicPeriodMap_constant` (example; signature omitted): A constant family has constant period map.

**Mathematical tests.**

- `padicPeriodMap.reviewTest1` (degenerate; signature omitted): For a constant family Φ_v(y)=F¹V for every y in the disk.
- `padicPeriodMap.reviewTest2` (compatibility; signature omitted): At y₀, Φ_v(y₀)=F¹V; at a new base y₁, Φ_v^{y₁}(y)=T_{y₀,y₁}(Φ_v^{y₀}(y)).
- `padicPeriodMap.reviewTest3` (non-example; signature omitted): For Legendre and a good odd residue characteristic, Φ_v is not constant on a residue disk.

**Acceptance.**

- For a constant family A × 𝒴, Φ_v is constant with value h₀.
- For the Legendre family, Φ_v(λ) is the line of V_v transported back from F¹ = ⟨dx/y⟩ at λ, and Φ_v is not constant on any residue disk.

**Sources.**

- lv2020, §3.4, p. 18: The p-adic period map.
- lv2020, §6, proof of Proposition 5.3, p. 29: The period map lands in the period variety of E₀-stable Lagrangians.

**Planet:** p-adic period map.

**Signature gap:** Suggested signatures — padic-period-map.

### The complex period map and its equivariant continuation to the universal cover

**Node:** `MordellLawrenceVenkatesh:LV.3/complex-period-map` · construction; implementation unchecked.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. Let Ω_ℂ ⊆ Y(ℂ) be a connected, simply connected open neighbourhood of y₀ (for Y = Y_ι^an). The complex period map is Φ_ℂ : Ω_ℂ → H_ℂ(ℂ), Φ_ℂ(y) := T_ℂ(y)^{-1}(F¹ℋ_y ⊗ ℂ). Let q : Ỹ → Y(ℂ) be the universal cover with base point ỹ₀ over y₀. The map Φ̃ : Ỹ → H_ℂ(ℂ), [γ] ↦ T_γ^{-1}(F¹ℋ_{γ(1)} ⊗ ℂ) (T_γ the parallel transport along the path γ from y₀), is holomorphic, satisfies Φ̃(ỹ₀) = h₀, agrees with Φ_ℂ ∘ q on the sheet over Ω_ℂ through ỹ₀, and is equivariant: Φ̃(δ·x) = μ(δ)·Φ̃(x) for δ ∈ π₁(Y(ℂ), y₀) acting by deck transformations.

**Hypotheses.** Setting P; Ω_ℂ connected and simply connected.

**Construction or proof.**

1. On Ω_ℂ the transport T_ℂ(y) is defined (LV.2) and is semilinear over E₀ ⊗ ℂ ≅ E_y ⊗ ℂ and symplectic, so Φ_ℂ lands in H_ℂ, as in the p-adic case.
2. Parallel transport in the local system R¹(π∘f)_*ℂ depends only on the homotopy class of γ, which defines Φ̃ on the universal cover (Tau Ceti's universal cover as homotopy classes of paths from the base point).
3. Local holomorphy follows from the complex convergence theorem for horizontal sections (LV.2) and holomorphic local frames of the Hodge subbundle. Transition between these frames is holomorphic; no appeal to the common-series lemma is needed.
4. Equivariance: T_{δ·γ} = T_γ ∘ T_δ for the concatenation δ·γ (first δ, then γ), so Φ̃(δ·x) = T_δ^{-1}(Φ̃(x)) = μ(δ)·Φ̃(x).

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-complex`; `MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group`; `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety`; `ComplexComparisonPartII:C0`; `tauceti:TauCeti.UniversalCover`; `mathlib:IsCoveringMap.existsUnique_continuousMap_lifts`; `MordellLawrenceVenkatesh:LV.2/horizontal-sections-complex-convergence`; `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`.

**Uses.**

- MordellLawrenceVenkatesh:LV.3/period-maps-common-series: use equivariance and analytic continuation to bound the period-image closure. The consumer is The complex and p-adic period maps are given by one tuple of power series over K.
- MordellLawrenceVenkatesh:LV.3/complex-period-closure-contains-orbit: use equivariance and analytic continuation to bound the period-image closure. The consumer is The Zariski closure of the complex period image contains the monodromy orbit (LV Lemma 3.1).

**Planning API.**

- `complexPeriodMap` (constructor; signature omitted): Φ_ℂ : Ω_ℂ → H_ℂ(ℂ).
- `complexPeriodMap.lift` (constructor; signature omitted): Φ̃ : Ỹ → H_ℂ(ℂ) on the universal cover.
- `complexPeriodMap.lift_base` (simp; signature omitted): Φ̃(ỹ₀) = h₀.
- `complexPeriodMap.lift_equivariant` (relation; signature omitted): Φ̃(δ·x) = μ(δ)·Φ̃(x).
- `complexPeriodMap.lift_holomorphic` (other; signature omitted): Φ̃ is holomorphic in Plücker charts.
- `complexPeriodMap.lift_eq` (compatibility; signature omitted): Φ̃ = Φ_ℂ ∘ q on the sheet over Ω_ℂ containing ỹ₀.
- `complexPeriodMap.mem` (other; signature omitted): Φ̃ takes values in H_ℂ(ℂ), the (E₀ ⊗ ℂ)-stable Lagrangians.
- `complexPeriodMap.legendre` (example; signature omitted): The Legendre period map on the upper half-plane.

**Mathematical tests.**

- `complexPeriodMap.reviewTest1` (degenerate; signature omitted): For a constant family the lifted period map is constant.
- `complexPeriodMap.reviewTest2` (compatibility; signature omitted): On the sheet through the chosen lift of y₀, the universal-cover map equals the chart period map composed with the covering projection.
- `complexPeriodMap.reviewTest3` (non-example; signature omitted): The Legendre period map is nonconstant; its projective deck action factors through Γ(2)/{±I}, so replacing the action by the trivial action fails.

**Acceptance.**

- For a constant family Φ̃ is constant.
- For the Legendre family and d = 1, Φ̃ is the map from the upper half-plane cover of ℙ¹ ∖ {0, 1, ∞} to ℙ¹ given by the ratio of the periods of dx/y, equivariant for Γ(2). Equivariance here is projective; the integral linear monodromy is the index-two subgroup described in algebraic-monodromy-group.

**Sources.**

- lv2020, §3.4, p. 18: The continuation and its equivariance.

**Planet:** Complex period map.

**Signature gap:** Suggested signatures — complex-period-map.

### The complex and p-adic period maps are given by one tuple of power series over K

**Node:** `MordellLawrenceVenkatesh:LV.3/period-maps-common-series` · lemma; implementation unchecked.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. Let r = 2dn and choose parameters z = (z_1, …, z_m) at the reduction of y₀ as in LV.2 and a frame v_1, …, v_r of ℋ near it with v_1, …, v_{dn} a frame of F¹ℋ. Index Plücker coordinates of Gr(V, dn) by the dn-element subsets I of {1, …, r}, and let B_I ∈ K[[z]] be the I-th maximal minor of the r × dn matrix formed by the first dn columns of Φ^{-1}, where Φ ∈ GL_r(K[[z]]) is the formal horizontal frame of LV.2. Then: (a) α!·B_{I,α} ∈ 𝒪_(v) for every multi-index α; (b) x ↦ B_I(px) is a restricted power series over 𝒪_v and B_{I₀}(px) ≡ 1 mod p for I₀ = {1, …, dn}; (c) for y ∈ Ω_v, Φ_v(y) has Plücker coordinates (B_I(z(y)))_I; (d) there is ρ > 0 such that the series ι(B_I) converge on U_ℂ = {|z_i| < ρ}, z is a biholomorphism from a neighbourhood of y₀ in Y(ℂ) onto a domain containing U_ℂ, and Φ_ℂ(y) has Plücker coordinates (ι(B_I)(z(y)))_I for z(y) ∈ U_ℂ; (e) B_I(0) = δ_{I,I₀}, the Plücker coordinates of h₀.

**Hypotheses.** Setting P; frame adapted to F¹ near the reduction of y₀.

**Construction or proof.**

1. In the frame (v_i), T_v(y) has matrix Φ(z(y)) (LV.2), and F¹ℋ_y is spanned by v_1(y), …, v_{dn}(y); hence T_v(y)^{-1}(F¹ℋ_y) is the column span of the first dn columns of Φ(z(y))^{-1}, whose Plücker coordinates are the maximal minors.
2. Φ^{-1} satisfies ∂_k Ψ = Ψ A_k and has α!-integral coefficients (LV.2); series with α!-integral coefficients form a ring, because (fg)_γ γ! = Σ_{α ≤ γ} binom(γ, α)(f_α α!)(g_{γ−α}(γ−α)!), so the minors B_I are α!-integral.
3. Restrictedness and the congruence follow as in LV.2 from Legendre's bound v_p(α!) ≤ |α|/(p−1) with p > 2; the congruence Φ^{-1}(px) ≡ 1 mod p gives B_{I₀}(px) ≡ 1, so the coordinates have no common zero on the disk.
4. Complex side: the complex transport has matrix ι(Φ)(z(y)) near y₀ (LV.2), and algebraic parameters at y₀ are holomorphic coordinates whose Taylor expansions are the images of the algebraic ones (ComplexComparisonPartII C0), so the same minors give Φ_ℂ.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.3/padic-period-map`; `MordellLawrenceVenkatesh:LV.3/complex-period-map`; `MordellLawrenceVenkatesh:LV.2/formal-horizontal-sections`; `MordellLawrenceVenkatesh:LV.2/horizontal-sections-padic-convergence`; `MordellLawrenceVenkatesh:LV.2/horizontal-sections-complex-convergence`; `MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-padic`; `MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-complex`; `ComplexComparisonPartII:C0`; `mathlib:Nat.factorization_factorial_le_div_pred`; `mathlib:MvPowerSeries.IsRestricted`; `mathlib:MvPowerSeries`.

**Acceptance.**

- Constant family: B_I = δ_{I,I₀} identically.
- Legendre family near λ₀ (n = d = 1, r = 2): (B_{{1}}, B_{{2}}) is the first column of Φ^{-1}, whose entries satisfy the Picard–Fuchs system of the frame (dx/y, x dx/y).

**Sources.**

- lv2020, §3.3, p. 16: The common power series.
- lv2020, §1.2, p. 4: How the series are used.

**Signature gap:** Named theorem interfaces — LV.3.

### The Zariski closure of the complex period image contains the monodromy orbit (LV Lemma 3.1)

**Node:** `MordellLawrenceVenkatesh:LV.3/complex-period-closure-contains-orbit` · lemma; implementation unchecked.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. Assume Y(ℂ) is connected, and let U ⊆ Ω_ℂ be a nonempty open subset. Then Γ·h₀ ⊆ Z for every Zariski-closed subset Z ⊆ H_ℂ containing Φ_ℂ(U); that is, Γ·h₀ is contained in the Zariski closure of Φ_ℂ(U). If the family has full monodromy, Φ_ℂ(U) is Zariski dense in H_ℂ.

**Hypotheses.** Setting P; Y(ℂ) connected; U ⊆ Ω_ℂ open, nonempty.

**Construction or proof.**

1. Let Z be defined by homogeneous Plücker polynomials Q_1, …, Q_s. In a local holomorphic frame of the pulled-back Hodge bundle, Q_i ∘ Φ̃ is a holomorphic function up to a nowhere vanishing factor; it vanishes on the nonempty open set q^{-1}(U) ∩ (sheet), hence on the connected manifold Ỹ by the identity theorem. So Φ̃(Ỹ) ⊆ Z.
2. By equivariance, μ(δ)·h₀ = Φ̃(δ·ỹ₀) ∈ Z for all δ ∈ π₁.
3. The transporter {g ∈ GL(V_ℂ) : g·h₀ ∈ Z} is Zariski closed and contains μ(π₁), hence contains Γ.
4. Under full monodromy Γ·h₀ = H_ℂ(ℂ) (transitivity on the period variety), so every closed Z ⊇ Φ_ℂ(U) is all of H_ℂ.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.3/complex-period-map`; `MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group`; `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety-splitting`; `ComplexComparisonPartII:C4`; `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.

**Acceptance.**

- Constant family: Γ·h₀ = {h₀} = Φ_ℂ(U).
- Legendre family: the closure of Φ_ℂ(U) is ℙ¹.

**Sources.**

- lv2020, §3.4, Lemma 3.1, p. 18: Statement of Lemma 3.1.
- lv2020, §3.4, proof of Lemma 3.1, p. 18: The proof, reproduced in the proof steps.

**Signature gap:** Named theorem interfaces — LV.3.

### A power series vanishing on an open polydisk is zero

**Node:** `MordellLawrenceVenkatesh:LV.3/convergent-series-vanishing` · lemma; implementation unchecked.

Let F be ℂ or a complete nontrivially nonarchimedean valued field of characteristic zero, and let f ∈ F[[z_1, …, z_m]] converge absolutely on U = {z ∈ F^m : |z_i| < ε} for some ε > 0. If f(z) = 0 for all z ∈ U, then f = 0.

**Hypotheses.** F = ℂ or complete nonarchimedean of characteristic 0; absolute convergence on U; The nonarchimedean absolute value is nontrivial..

**Construction or proof.**

1. The series defines an analytic function on U whose formal multilinear series at 0 has homogeneous terms f_n (the degree-n parts of f).
2. Since the function vanishes near 0, every homogeneous term vanishes at every point: f_n(y) = 0 for all y ∈ F^m (HasFPowerSeriesAt.apply_eq_zero, valid over any nontrivially normed field).
3. F is infinite, so a polynomial vanishing on F^m is zero (MvPolynomial.funext); hence f_n = 0 for all n.

**Prerequisites.** `mathlib:HasFPowerSeriesAt.apply_eq_zero`; `mathlib:MvPolynomial.funext`; `mathlib:HasFPowerSeriesOnBall`; `mathlib:MvPowerSeries`.

**Acceptance.**

- Σ z^k/k! over ℚ_p converges on |z| < p^{−1/(p−1)} and is nonzero there.
- z₁z₂ vanishes on the coordinate axes, which contain no open polydisk.
- Excluded case: over trivially valued ℚ with ε=1 the open disk is {0}, so f=z vanishes there without being zero.

**Sources.**

- lv2020, §3.4, proof of Lemma 3.2, p. 19: The step of LV's proof that this node justifies.

**Signature gap:** Named theorem interfaces — LV.3.

### Complex and v-adic Zariski closures of a power-series map descend to one K-subscheme (LV Lemma 3.2)

**Node:** `MordellLawrenceVenkatesh:LV.3/power-series-zariski-closure` · lemma; implementation unchecked.

Let K be a number field with an embedding ι : K → ℂ and a finite place v, and let B_0, …, B_N ∈ K[[z_1, …, z_m]] be such that the series B_i converge absolutely without common zero on U_v = {|z_i|_v < ε_v} ⊆ K_v^m, and the series ι(B_i) converge absolutely without common zero on U_ℂ = {|z_i| < ε_ℂ} ⊆ ℂ^m (ε_v, ε_ℂ > 0). Let I ⊆ K[x_0, …, x_N] be the ideal generated by the homogeneous Q with Q(B_0, …, B_N) = 0 in K[[z]], and Z ⊆ ℙ^N_K the closed subscheme it defines. Then I is a homogeneous prime ideal, Z is integral, and Z ⊗ K_v (respectively Z ⊗_ι ℂ) is the Zariski closure of B^v(U_v) ⊆ ℙ^N(K_v) (respectively of B^ℂ(U_ℂ) ⊆ ℙ^N(ℂ)); in particular these closures are integral and have the same dimension.

**Hypotheses.** absolute convergence without common zeros on U_v and U_ℂ.

**Construction or proof.**

1. A homogeneous Q_v ∈ K_v[x] of degree e vanishes on B^v(U_v) if and only if Q_v(B) vanishes on U_v, if and only if Q_v(B) = 0 in K_v[[z]] (vanishing lemma for convergent series).
2. The coefficients of Q_v(B) are K-linear forms in the coefficients of Q_v; the solutions of this system in the finite-dimensional space of degree-e forms are cut out by finitely many of the equations, and the solution space of a finite K-linear system commutes with the flat base change K → K_v. So the vanishing ideal of B^v(U_v) is I ⊗ K_v; likewise over ℂ.
3. The ideal is the kernel of x_i↦t B_i into the graded domain K[[z]][t]; the same construction over K_v or ℂ proves primality after base change.
4. Dimensions of a closed subscheme and of its base change agree.
5. The homogeneous ideal I is the kernel of the graded map K[x₀,…,x_N] → K[[z]][t] sending x_i to t B_i, hence prime because the target is a domain. The ungraded kernel of x_i ↦ B_i need not be homogeneous and is not the justification.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.3/convergent-series-vanishing`; `mathlib:Module.Flat.ker_lTensor_eq`; `mathlib:MvPolynomial.vanishingIdeal`; `mathlib:MvPolynomial.zeroLocus`; `AlgebraicModuliForArithmeticGeometry:R09.1`.

**Acceptance.**

- B = (1, z, z²): Z is the conic x₀x₂ = x₁².
- B = (1, Σ z^k/k!) with ε_v = |p|^{1/(p−1)}: Z = ℙ¹, since the image is infinite.

**Sources.**

- lv2020, §3.4, Lemma 3.2, p. 18: Statement of Lemma 3.2 (LV use one radius for both disks; the proof does not need that).
- lv2020, §3.4, proof of Lemma 3.2, p. 19: The ideal.
- lv2020, §3.4, proof of Lemma 3.2, p. 19: The base-change step.

**Signature gap:** Named theorem interfaces — LV.3.

### Zariski closure of the p-adic period image (LV Lemma 3.3) and density under full monodromy

**Node:** `MordellLawrenceVenkatesh:LV.3/padic-period-image-dense` · theorem; implementation unchecked.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. Assume Y(ℂ) is connected. There is an integral closed K-subscheme Z ⊆ H such that Z ⊗ K_v is the Zariski closure of Φ_v(Ω_v) in H_v and Z ⊗_ι ℂ is the Zariski closure of Φ_ℂ(U_ℂ) for a polydisk U_ℂ around y₀ as in the common-series node; Z ⊗_ι ℂ ⊇ Γ·h₀. In particular dim_{K_v} of the closure of Φ_v(Ω_v) is at least the dimension of the Zariski closure of Γ·h₀. If the family has full monodromy then Z = H: Φ_v(Ω_v) is Zariski dense in H_v, and its image under every factor projection of H_v (along a decomposition of E₀ ⊗ K_v into a product of K_v-algebras) is Zariski dense in that factor.

**Hypotheses.** Setting P; Y(ℂ) connected.

**Construction or proof.**

1. Apply LV Lemma 3.2 to the Plücker series B_I of the common-series node with U_v = {|z_i|_v < 1} = (p𝒪_v)^m (v unramified) and U_ℂ; Z is the resulting integral K-subscheme of the Plücker space.
2. Z ⊆ H: the ideal of H is contained in I ⊗ K_v ∩ K[x] = I, because Φ_v takes values in H.
3. LV Lemma 3.1 with U = z^{-1}(U_ℂ) gives Γ·h₀ ⊆ Z ⊗ ℂ; dimensions agree after base change.
4. Full monodromy: Γ·h₀ = H_ℂ(ℂ), so Z ⊗ ℂ = H ⊗ ℂ, hence Z = H (a closed subscheme is determined by its base change along a field extension); the factor statement follows from the splitting lemma.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.3/power-series-zariski-closure`; `MordellLawrenceVenkatesh:LV.3/period-maps-common-series`; `MordellLawrenceVenkatesh:LV.3/complex-period-closure-contains-orbit`; `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety-splitting`; `MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group`.

**Acceptance.**

- Legendre family: Z = H = ℙ¹ and Φ_v is nonconstant on every residue disk.
- Constant family: Z = {h₀}.

**Sources.**

- lv2020, §3.4, Lemma 3.3, p. 19: Statement of Lemma 3.3.
- lv2020, §6, proof of Proposition 5.3, p. 29: The density statement used in §6.

**Signature gap:** Named theorem interfaces — LV.3.

### Finite-extension Strassmann adapter for residue disks

**Node:** `MordellLawrenceVenkatesh:LV.3/strassmann` · theorem; implementation unchecked.

Let F be a finite extension of ℚ_p with its complete nonarchimedean absolute value with valuation ring 𝒪_F, and f = Σ_{n≥0} a_n x^n ∈ F[[x]] with a_n → 0 and not all a_n zero. Let N(f) be the largest n with |a_n| = max_k |a_k|. Then f has at most N(f) zeros in 𝒪_F. In particular a nonzero restricted power series over 𝒪_F has finitely many zeros in 𝒪_F.

**Hypotheses.** F a finite extension of ℚ_p with its usual complete nonarchimedean absolute value; a_n → 0, f ≠ 0.

**Construction or proof.**

1. Induction on N = N(f). If N = 0 then |a_0| > |a_n| for n ≥ 1, so |f(x)| = |a_0| ≠ 0 for |x| ≤ 1.
2. If f(α) = 0 with α ∈ 𝒪_F, then f(x) = f(x) − f(α) = (x − α)g(x) with g = Σ_j b_j x^j, b_j = Σ_{n>j} a_n α^{n−1−j}. Then b_j → 0, |b_j| ≤ |a_N| for all j, |b_{N−1}| = |a_N| and |b_j| < |a_N| for j ≥ N; so N(g) = N − 1.
3. Every zero of f in 𝒪_F other than α is a zero of g, so f has at most 1 + (N − 1) zeros.

Import ArithmeticDynamics:DY.6/strassmann-theorem for ℚp. The finite-extension coefficient interface is a recorded extension gap; this node is its LV residue-disk specialization, not a parallel proof of the generic theorem.

**Prerequisites.** `mathlib:PowerSeries.IsRestricted`; `ArithmeticDynamics:DY.6/strassmann-theorem`.

**Owner proposal.** ArithmeticDynamics; The generic Strassmann extension belongs with the existing DY.6 theorem; retain this LV adapter ID until the extension transfer is accepted.

**Acceptance.**

- Over ℚ_p, f = 1 + pX + X² + pX⁵ has N(f) = 2; it has no zeros in ℤ₂ or ℤ₃ and two zeros in ℤ₅ (Conrad, Example 4.2).
- X^n − p has N = n and no zeros in ℤ_p for n ≥ 2.

**Sources.**

- conrad-strassmann, Theorem 4.1 and proof, PDF pp. 6–8: Strassmann's theorem over ℚ_p; the proof applies verbatim over any complete nonarchimedean field.
- conrad-strassmann, Theorem 4.1 and proof, PDF pp. 6–8: Definition of N(f).

**Signature gap:** Named theorem interfaces — LV.3.

### On a curve, the p-adic period map meets a closed subset not containing its image in finitely many points

**Node:** `MordellLawrenceVenkatesh:LV.3/padic-period-preimage-finite` · theorem; implementation unchecked.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. Assume m = 1 (Y is a curve). (a) For every Zariski-closed subset Z' ⊆ H_v with Φ_v(Ω_v) ⊄ Z'(K_v), the set {y ∈ Ω_v : Φ_v(y) ∈ Z'(K_v)} is finite. (b) Assume moreover that Y(ℂ) is connected, and let Z_v be the Zariski closure of Φ_v(Ω_v). If Z' ⊆ H_v is closed with dim Z' < dim Z_v, then Φ_v(Ω_v) ⊄ Z', so (a) applies; under full monodromy Z_v = H_v. (c) For a decomposition E₀ ⊗ K_v = E₁ × E' with factor projection pr₁ : H_v → H₁ = LGr_{E₁}(V₁, ω₁), let Z₁ be the Zariski closure of pr₁Φ_v(Ω_v); if B₁ ⊆ H₁ is closed with dim B₁ < dim Z₁, then {y ∈ Ω_v : pr₁Φ_v(y) ∈ B₁(K_v)} is finite; under full monodromy Z₁ = H₁.

**Hypotheses.** Setting P with m = 1.

**Construction or proof.**

1. (a) Choose y₁ with Φ_v(y₁) ∉ Z'. Closed subsets of projective space are cut out by homogeneous forms, so some homogeneous Q with coefficients in 𝒪_v vanishes on Z' and not at Φ_v(y₁).
2. g(x) := Q(B(px)) is a restricted power series over 𝒪_v in one variable (restricted series form a subring), and g(x₁) ≠ 0 for x₁ = z(y₁)/p, so g ≠ 0.
3. y ↦ z(y)/p is a bijection Ω_v ≅ 𝒪_v and Φ_v(y) ∈ Z' forces g(z(y)/p) = 0; Strassmann's theorem bounds the number of zeros.
4. (b) If Φ_v(Ω_v) ⊆ Z' then Z_v ⊆ Z' and dim Z_v ≤ dim Z'. The full-monodromy statement is LV Lemma 3.3 with density.
5. (c) Apply (a) to Z' = pr₁^{-1}(B₁): if Φ_v(Ω_v) ⊆ pr₁^{-1}(B₁), then pr₁Φ_v(Ω_v) ⊆ B₁ and Z₁ ⊆ B₁, contradicting dim B₁ < dim Z₁. Under full monodromy the projection of a dense set is dense (splitting lemma).

**Prerequisites.** `MordellLawrenceVenkatesh:LV.3/padic-period-image-dense`; `MordellLawrenceVenkatesh:LV.3/strassmann`; `MordellLawrenceVenkatesh:LV.3/period-maps-common-series`; `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety-splitting`; `mathlib:MvPowerSeries.IsRestricted.subring`; `mathlib:MvPowerSeries.IsRestricted`.

**Acceptance.**

- Legendre family, Z' = {a point}: only finitely many λ in a residue disk have Φ_v(λ) equal to a given line.
- The hypothesis m = 1 is needed: for m ≥ 2 the preimage of a proper closed subset is in general an analytic subset of positive dimension.

**Sources.**

- lv2020, §3.4, after Lemma 3.3, p. 19: LV's analytic-subset formulation; for curves the node makes finiteness explicit.
- lv2020, §1.2, p. 4: The finiteness mechanism.

**Signature gap:** Named theorem interfaces — LV.3.

### Exact follow-ups for LV.3

- Supply/resolve LV-import-01 — Closures of abstract algebraic subgroups (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-28 — Spreading polarized families and good models (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-30 — Symplectic Grassmannian schemes and charts (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-31 — Dimension and transcendence-degree interfaces (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-32 — Algebraic group orbits and transporters (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-34 — Completed analytic local rings (exact interface and affected nodes are in gaps).
- Supply/resolve Finite-extension analytic zero theorem adapter (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — abelian-by-finite-family (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — good-model (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — de-rham-bundle (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — residue-disk (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — gauss-manin-transport-padic (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — gauss-manin-transport-complex (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — crystalline-frobenius-on-fibres (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — lagrangian-grassmannian (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — lagrangian-period-variety (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — algebraic-monodromy-group (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — padic-period-map (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — complex-period-map (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.0 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.2 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.3 (exact interface and affected nodes are in gaps).
- Resolve exact supplier contracts LV-import-01, LV-import-19, LV-import-20, LV-import-21, LV-import-22, LV-import-23, LV-import-24, LV-import-25, LV-import-26, LV-import-27, LV-import-28, LV-import-29, LV-import-30, LV-import-31, LV-import-32, LV-import-33, LV-import-34, LV-import-35; the stage imports name plans, not proofs.

## LV.4 — Crystalline comparison on residue disks and the finiteness criterion

### The fibre representations are crystalline with the de Rham cohomology of the fibre as filtered φ-module

**Node:** `MordellLawrenceVenkatesh:LV.4/fibre-representation-crystalline` · comparison; implementation unchecked.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. For y ∈ Y(K) ∩ Ω_v (such a point extends to an 𝒪_{S_y}-point of 𝒴 for a finite set S_y ⊇ S of places not containing v; S_y = S when y ∈ 𝒴(𝒪)) and a closed point y' of π^{-1}(y) with residue field K(y'), X_{y'} is an abelian variety over K(y') with good reduction at the places not above S_y, in particular at the places above v, and ρ_{y'} := H¹_et(X_{y'} ×_{K(y')} K̄, ℚ_p) is a representation of G_{K(y')}; for a place w of K(y') above v, K(y')_w is unramified over K_v, and ρ_{y',w} is the restriction of ρ_{y'} to G_{K(y')_w}. Then ρ_{y',w} is crystalline, and there is an isomorphism of filtered φ-modules over L := K(y')_w, D_cris(ρ_{y',w}) ≅ (H¹_dR(X_{y'} ⊗ L / L), φ_{y',w}, F¹), where D_cris(V) = (V ⊗_{ℚ_p} B_cris)^{G_L} is the covariant functor, φ_{y',w} is the crystalline Frobenius of the good-reduction model 𝒳_{y'} ⊗ 𝒪_L transported through the Berthelot–Ogus isomorphism (the (y', w)-factor of φ_y from LV.2), and F¹ is the Hodge filtration (jumps 0 and 1). The isomorphism is functorial in the abelian scheme and compatible with the polarization pairings.

**Hypotheses.** Setting P; y ∈ Y(K) ∩ Ω_v; w | v a place of K(y').

**Construction or proof.**

1. Since y lies in the residue disk it is a point of 𝒴(𝒪_v) ∩ Y(K) = 𝒴(𝒪_(v)) (𝒴 separated), so it spreads out to 𝒴(𝒪_{S_y}); the fibre of the good model over the 𝒪_L-point induced by y' is an abelian scheme 𝒳_{y'} ⊗ 𝒪_L over 𝒪_L = W(k_w) with generic fibre X_{y'} ⊗ L (LV.2).
2. The crystalline comparison for its p-adic completion (CohomologyComparisons CP.2, node crystalline-comparison-over-discretely-valued-base) gives a G_L-equivariant B_cris-linear isomorphism H¹_et ⊗ B_cris ≅ H¹_cris(𝒳_{k_w}/W(k_w)) ⊗ B_cris compatible with Frobenius and filtrations; the étale cohomology of the rigid generic fibre is that of the algebraic variety X_{y'} ⊗ L, and restricting ρ_{y'} to G_L computes H¹_et((X_{y'} ⊗ L)_{L̄}, ℚ_p).
3. Taking G_L-invariants with B_cris^{G_L} = W(k_w)[1/p] = L gives D_cris(ρ_{y',w}) ≅ H¹_cris(𝒳_{k_w}/W(k_w))[1/p] with its Frobenius, and dim_L D_cris = 2d, so ρ_{y',w} is crystalline.
4. Because L is unramified, D_cris(ρ)_L = D_dR(ρ) as filtered spaces (Brinon–Conrad Proposition 9.1.9), and the comparison identifies D_dR(ρ_{y',w}) with H¹_dR(X_{y'} ⊗ L/L) and its Hodge filtration; under this identification the crystalline Frobenius is the Berthelot–Ogus transport of LV.2 (requested compatibility, PadicHodgeTheory R06.5).

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — LocalFieldsRamification Layer 2 (unramified extensions and Frobenius). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base`; `PadicHodgeTheory:R06.2`; `PadicHodgeTheory:R06.5`; `PadicHodgeTheory:R06.6`; `CrystallineCohomology:CR.2`; `SchemeAndStackFoundations:SF.2`; `MordellLawrenceVenkatesh:LV.2/good-model`; `MordellLawrenceVenkatesh:LV.2/crystalline-frobenius-on-fibres`; `MordellLawrenceVenkatesh:LV.1/abelian-variety-cohomology-properties`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

**Acceptance.**

- A good-reduction elliptic curve E over ℚ_p: D_cris(H¹_et(E_{ℚ̄_p}, ℚ_p)) = H¹_dR(E/ℚ_p) with φ of characteristic polynomial X² − a_pX + p and F¹ = H⁰(E, Ω¹), a line.
- For the Tate twist ℚ_p(−1) = H²_et(ℙ¹): D_cris is one-dimensional with φ = p and the filtration jump in degree 1.

**Sources.**

- lv2020, §3.5, p. 19: Crystallinity of the fibre representations.
- lv2020, §3.5, p. 19: LV continue: ρ_y is carried to the triple (H^q_dR(X_y/K_v), φ_v, Hodge filtration).
- brinon-conrad, §9.1, Proposition 9.1.9, p. 133: The filtration on D_cris over an unramified field is that of D_dR.

**Signature gap:** Named theorem interfaces — LV.4.

### The filtered φ-module of a fibre read off from the period map (LV (6.6)–(6.7))

**Node:** `MordellLawrenceVenkatesh:LV.4/fibre-filtered-phi-transport` · lemma; implementation unchecked.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. For y ∈ Y(K) ∩ Ω_v (such a point extends to an 𝒪_{S_y}-point of 𝒴 for a finite set S_y ⊇ S of places not containing v; S_y = S when y ∈ 𝒴(𝒪)) and a closed point y' of π^{-1}(y) with residue field K(y'), X_{y'} is an abelian variety over K(y') with good reduction at the places not above S_y, in particular at the places above v, and ρ_{y'} := H¹_et(X_{y'} ×_{K(y')} K̄, ℚ_p) is a representation of G_{K(y')}; for a place w of K(y') above v, K(y')_w is unramified over K_v, and ρ_{y',w} is the restriction of ρ_{y'} to G_{K(y')_w}. Let (y₀', w₀) be the pair over (y₀, v) corresponding to (y', w) under the transport bijection of LV.2, τ : K(y')_w ≅ K(y₀')_{w₀} =: L₀ the transported field isomorphism, V₀ the (y₀', w₀)-factor of V_v = ℋ_{y₀} ⊗ K_v with the restriction φ₀ of φ_{y₀} (σ_{L₀}-semilinear), and pr₀ : H_v → H₀ := LGr_{L₀}(V₀, ω₀) the factor projection. Then pr₀Φ_v(y) = T_v(y)^{-1}(F¹H¹_dR(X_{y'} ⊗ K(y')_w)) (LV (6.7)), and D_cris(ρ_{y',w}) transported along τ is isomorphic in MF^φ_{L₀} to (V₀, φ₀, pr₀Φ_v(y)).

**Hypotheses.** Setting P; y ∈ Y(K) ∩ Ω_v.

**Construction or proof.**

1. The transport T_v(y) is semilinear over the ring isomorphism E₀ ⊗ K_v ≅ E_y ⊗ K_v, which is the product of the field isomorphisms of the corresponding factors; hence it maps the factor V₀ τ^{-1}-semilinearly onto the factor H¹_dR(X_{y'} ⊗ K(y')_w) of ℋ_y ⊗ K_v and commutes with the factor projections of the period varieties.
2. Φ_v(y) = T_v(y)^{-1}(F¹ℋ_y ⊗ K_v) and F¹ is the product of the factorwise Hodge filtrations, which gives (6.7).
3. T_v(y) commutes with Frobenius (LV.2), and τ commutes with the absolute Frobenii because both fields are unramified over ℚ_p; so T_v(y) restricted to V₀ is an isomorphism of filtered φ-modules from (V₀, φ₀, pr₀Φ_v(y)) to the τ-transport of (H¹_dR(X_{y'} ⊗ K(y')_w), φ_{y',w}, F¹).
4. Compose with the fibre comparison (fibre-representation-crystalline).

**Prerequisites.** `MordellLawrenceVenkatesh:LV.4/fibre-representation-crystalline`; `MordellLawrenceVenkatesh:LV.3/padic-period-map`; `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety`; `MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-padic`; `MordellLawrenceVenkatesh:LV.2/crystalline-frobenius-on-fibres`; `PadicHodgeTheory:R06.2`.

**Acceptance.**

- π = id: y' = y, E₀ = K, and the lemma says that T_v(y) is an isomorphism (V_v, φ_{y₀}, Φ_v(y)) ≅ D_cris(ρ_y|G_{K_v}) (LV §3.5).
- The Legendre variant family of LV §4.2 with v inert in K(t₀^{1/m}): one factor, L₀ = K_v(t₀^{1/m}) of degree m over K_v.

**Sources.**

- lv2020, §6, (6.7), p. 30: The projection formula (6.7).
- lv2020, §6, proof of Lemma 6.2, p. 31: The fibre filtered φ-module used in Lemma 6.2.
- lv2020, §3.5, p. 19: The category of filtered φ-modules.

**Signature gap:** Named theorem interfaces — LV.4.

### Filtrations with isomorphic filtered φ-modules form a Frobenius-centralizer orbit of bounded dimension

**Node:** `MordellLawrenceVenkatesh:LV.4/filtered-phi-orbit` · lemma; implementation unchecked.

Let K_v/ℚ_p be finite unramified of degree f_v, L ⊇ K_v finite unramified, W a finite-dimensional L-vector space with a σ_L-semilinear bijection φ, and F, F' L-subspaces of W of the same dimension k, viewed as two-step filtrations W ⊇ F ⊇ 0. (a) (W, φ, F) ≅ (W, φ, F') in MF^φ_L if and only if F' = gF for some g ∈ Z(φ)^×. (b) Let A = Z(φ^{f_v}), a K_v-subalgebra of End_L(W) with dim_{K_v} A ≤ (dim_L W)², and G its K_v-group of units, which acts on the K_v-variety Gr_L(W, k) of L-stable subspaces. Then Z(φ)^× ⊆ G(K_v), so every F' as in (a) lies in G(K_v)·F, and the Zariski closure of G(K_v)·F in Gr_L(W, k) has dimension ≤ dim_{K_v} A. (c) Consequently, for filtrations F_1, …, F_s, the set of F' with (W, φ, F') isomorphic to one of the (W, φ, F_i) is contained in a closed subset of Gr_L(W, k) of dimension ≤ dim_{K_v} A.

**Hypotheses.** K_v ⊆ L finite unramified over ℚ_p; φ σ_L-semilinear bijective.

**Construction or proof.**

1. (a) An isomorphism (W, φ, F) → (W, φ, F') is an L-linear bijection g commuting with φ and carrying F onto F'.
2. (b) Z(φ) ⊆ Z(φ^{f_v}) and the dimension bound are LV Lemma 2.1 in the form of the LV.0 node for unramified extensions; elements of A are L-linear, so G acts on the L-stable Grassmannian; the Zariski closure of an orbit of a K_v-group has dimension at most the dimension of the group (orbit morphism, ReductiveGroups Layer 3).
3. (c) A finite union of closed sets of dimension ≤ dim A.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.0/semilinear-centralizer`; `MordellLawrenceVenkatesh:LV.0/semilinear-centralizer-unramified`; `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety`; `PadicHodgeTheory:R06.2`; `SchemeAndStackFoundations:SF.0`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.

**Acceptance.**

- For a good-reduction elliptic curve over ℚ_p, the distinct-root Frobenius has centralizer dimension 2, exceeding dim ℙ¹=1. A Frobenius eigenline is fixed by that centralizer; a non-eigenline has an open orbit. Thus openness of the Hodge-line orbit requires the additional non-eigenline hypothesis.
- K_v = ℚ_{p²} and E/ℚ_p supersingular with a_p = 0: φ² = −p is scalar and dim_{K_v} Z(φ²) = 4; if E is ordinary, φ² has distinct eigenvalues and dim_{K_v} Z(φ²) = 2.

**Sources.**

- lv2020, §3.5, proof of Proposition 3.4, pp. 19–20: The passage from Z(φ) to the algebraic group of units of Z(φ^{f_v}).
- lv2020, §6, proof of Lemma 6.2, p. 31: The orbit statement (a).
- brinon-conrad, §7.3, Definition 7.3.4, p. 98: Morphisms of filtered φ-modules.

**Signature gap:** Named theorem interfaces — LV.4.

### Finiteness criterion on a residue disk of a curve

**Node:** `MordellLawrenceVenkatesh:LV.4/finiteness-criterion` · theorem; implementation unchecked.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. For y ∈ Y(K) ∩ Ω_v (such a point extends to an 𝒪_{S_y}-point of 𝒴 for a finite set S_y ⊇ S of places not containing v; S_y = S when y ∈ 𝒴(𝒪)) and a closed point y' of π^{-1}(y) with residue field K(y'), X_{y'} is an abelian variety over K(y') with good reduction at the places not above S_y, in particular at the places above v, and ρ_{y'} := H¹_et(X_{y'} ×_{K(y')} K̄, ℚ_p) is a representation of G_{K(y')}; for a place w of K(y') above v, K(y')_w is unramified over K_v, and ρ_{y',w} is the restriction of ρ_{y'} to G_{K(y')_w}. Assume m = 1. Fix (y₀', w₀) over (y₀, v), put L₀ := K(y₀')_{w₀}, let V₀, φ₀, H₀ and pr₀ be as in the transport lemma, Z₀ the Zariski closure of pr₀Φ_v(Ω_v) in H₀, and c := dim_{K_v} Z(φ₀^{f_v}) (so c ≤ 4d²). Let 𝒮 ⊆ Y(K) ∩ Ω_v be a set such that, for y ∈ 𝒮 and (y', w) the pair corresponding to (y₀', w₀), the pairs (K(y')_w, ρ_{y',w}) lie in finitely many isomorphism classes (an isomorphism of pairs is a field isomorphism with a compatible isomorphism of representations). If c < dim Z₀, then 𝒮 is finite. If Y(ℂ) is connected and the family has full monodromy, then dim Z₀ = [L₀ : K_v]·d(d+1)/2, so the hypothesis c < dim Z₀ holds whenever [L₀ : K_v] ≥ 8. Assume d ≥ 1 throughout this criterion.

**Hypotheses.** Setting P with m = 1; finitely many isomorphism classes of pairs along 𝒮; c < dim Z₀; d ≥ 1; the dimension estimate and minimal positive subrepresentation argument use positive relative dimension..

**Construction or proof.**

1. Transport of structure: an isomorphism of pairs (α, ρ₁ ≅ ρ₂) induces D_cris(ρ₂) ≅ α_*D_cris(ρ₁). After transport to L₀ by the field isomorphisms τ of the transport lemma, two points of 𝒮 in the same class of pairs give filtered φ-modules over L₀ that differ by transport along an element of Aut(L₀/ℚ_p), a group of order [L₀ : ℚ_p]. So the modules (V₀, φ₀, pr₀Φ_v(y)), y ∈ 𝒮, lie in finitely many isomorphism classes of MF^φ_{L₀}.
2. By the orbit lemma there are F_1, …, F_s with pr₀Φ_v(y) ∈ ⋃ G(K_v)·F_i for all y ∈ 𝒮, and B₀ := H₀ ∩ ⋃ closure(G(K_v)·F_i) is closed of dimension ≤ c < dim Z₀.
3. By the finite-preimage theorem of LV.3 (part (c)), {y ∈ Ω_v : pr₀Φ_v(y) ∈ B₀} is finite, and it contains 𝒮.
4. Under full monodromy Z₀ = H₀, which has dimension [L₀ : K_v]·d(d+1)/2 by the splitting lemma; for [L₀ : K_v] ≥ 8 this is ≥ 4d(d+1) > 4d² ≥ c.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.4/fibre-filtered-phi-transport`; `MordellLawrenceVenkatesh:LV.4/filtered-phi-orbit`; `MordellLawrenceVenkatesh:LV.3/padic-period-preimage-finite`; `MordellLawrenceVenkatesh:LV.3/padic-period-image-dense`; `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety-splitting`; `MordellLawrenceVenkatesh:LV.0/semilinear-centralizer-unramified`; `MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-padic`.

**Acceptance.**

- The variant Legendre family of LV §4 (d = 1, L₀ of degree m ≥ 8): c ≤ 4 < m = dim Z₀.
- d = 1 and L₀ = K_v (the Legendre family itself): c = 2 > 1 = dim Z₀, and the criterion does not apply (LV §1.3).

**Sources.**

- lv2020, §3.5, proof of Proposition 3.4, p. 20: From finitely many Galois representations to finitely many filtered φ-modules.
- lv2020, §6, proof of Lemma 6.2, p. 31: The factorwise version used in §6.
- lv2020, §6, proof of Lemma 6.2, p. 31: The dimension count.

**Planet:** Period-map finiteness criterion.

**Signature gap:** Named theorem interfaces — LV.4.

### Fibres with good reduction and semisimple Galois representation (LV Proposition 3.4, for curves)

**Node:** `MordellLawrenceVenkatesh:LV.4/proposition-3-4` · theorem; implementation unchecked.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. Assume n = 1 (π = id, so X → Y is a polarized abelian scheme, E₀ = K and H = LGr(V, ω₀)), m = 1 and Y(ℂ) connected, and write ρ_y = H¹_et(X_y ×_K K̄, ℚ_p). If dim_{K_v} Z(φ_{y₀}^{f_v}) < dim_ℂ(Γ·h₀) (LV (3.13)), then the set {y ∈ 𝒴(𝒪) : y ≡ y₀ mod v, ρ_y semisimple} is finite.

**Hypotheses.** Setting P with n = 1 and m = 1; Y(ℂ) connected; LV (3.13).

**Construction or proof.**

1. For y ∈ 𝒴(𝒪), X_y has good reduction outside S, so ρ_y has dimension 2d, is unramified outside T := S ∪ {places above p} and pure of weight 1 with integral Frobenius polynomials outside T (LV.1).
2. Faltings's finiteness lemma (LV.1) leaves finitely many isomorphism classes of semisimple ρ_y, hence finitely many classes of pairs (K_v, ρ_y|G_{K_v}).
3. With (y₀', w₀) = (y₀, v), Z₀ is the closure Z_v of Φ_v(Ω_v), and dim Z_v ≥ dim(Γ·h₀) by LV Lemma 3.3; so c < dim Z₀ and the finiteness criterion applies.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.4/finiteness-criterion`; `MordellLawrenceVenkatesh:LV.1/faltings-finiteness`; `MordellLawrenceVenkatesh:LV.1/abelian-variety-cohomology-properties`; `MordellLawrenceVenkatesh:LV.3/padic-period-image-dense`; `NeronModelsAndSemistableAbelianVarieties:R11.5`.

**Acceptance.**

- The Legendre family over K with K_v = ℚ_p: dim Z(φ) = 2 > 1 = dim(Γ·h₀) = dim ℙ¹, so (3.13) fails; this is why LV pass to abelian-by-finite families.
- π = id, K_v = ℚ_p and φ_{y₀} with 2d distinct eigenvalues: c = 2d, so under full monodromy (3.13) holds exactly when d(d+1)/2 > 2d, i.e. d ≥ 4.

**Sources.**

- lv2020, §3.5, Proposition 3.4, pp. 19–20: LV's conclusion; for a curve the proper analytic subvariety is finite.
- lv2020, §3.5, proof of Proposition 3.4, p. 20: The use of Faltings's lemma.
- lv2020, §1.3, p. 4: The Legendre acceptance example.

**Signature gap:** Named theorem interfaces — LV.4.

### Exact follow-ups for LV.4

- Supply/resolve LV-import-01 — Closures of abstract algebraic subgroups (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-06 — Continuous Mackey and semisimple image algebras (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-28 — Spreading polarized families and good models (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-30 — Symplectic Grassmannian schemes and charts (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-31 — Dimension and transcendence-degree interfaces (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-32 — Algebraic group orbits and transporters (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-34 — Completed analytic local rings (exact interface and affected nodes are in gaps).
- Supply/resolve Faithful image-algebra trace criterion (exact interface and affected nodes are in gaps).
- Supply/resolve Finite-extension analytic zero theorem adapter (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — semilinear-centralizer (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — abelian-by-finite-family (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — good-model (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — de-rham-bundle (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — residue-disk (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — gauss-manin-transport-padic (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — gauss-manin-transport-complex (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — crystalline-frobenius-on-fibres (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — lagrangian-grassmannian (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — lagrangian-period-variety (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — algebraic-monodromy-group (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — padic-period-map (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — complex-period-map (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.0 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.1 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.2 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.3 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.4 (exact interface and affected nodes are in gaps).
- Resolve exact supplier contracts LV-import-01, LV-import-05, LV-import-06, LV-import-07, LV-import-08, LV-import-09, LV-import-13, LV-import-14, LV-import-15, LV-import-16, LV-import-17, LV-import-18, LV-import-19, LV-import-20, LV-import-21, LV-import-22, LV-import-23, LV-import-24, LV-import-25, LV-import-26, LV-import-27, LV-import-28, LV-import-29, LV-import-30, LV-import-31, LV-import-32, LV-import-33, LV-import-34, LV-import-35, LV-import-36, LV-import-37, LV-import-38; the stage imports name plans, not proofs.

## LV.5 — Surfaces, mapping class groups and families of branched covers

### Surfaces with boundary and punctures

**Node:** `MordellLawrenceVenkatesh:LV.5/surface` · definition; implementation unchecked.

A surface carrier is Σ ∖ P, where Σ is a compact connected oriented Hausdorff second-countable topological 2-manifold with boundary and P is a finite subset of its interior. Boundary charts and orientation are actual topological data; genus, Euler characteristic, integral homology and intersection perfectness are consequences, not fields of this structure.

**Hypotheses.** Σ compact connected oriented 2-manifold with boundary; P finite subset of the interior.

**Construction or proof.**

1. Form the complement of P with its subspace topology and induced oriented manifold-with-boundary atlas. No classification or homology theorem is used to define the carrier.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology — AlgebraicTopology Stage 2 (singular homology, local coefficient systems); tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality — AlgebraicTopology Stage 6 (cohomology, products, Poincaré duality, intersection pairing); tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group — GeometricTopology Layer 1 (cutting and gluing manifolds along submanifolds). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** The elementary field/module carrier specified above..

**Owner proposal.** tauceti:TauCetiRoadmap/GeometricTopology; GeometricTopology Part II proposal; current LV node is retained until accepted transfer.

**Uses.**

- MordellLawrenceVenkatesh:LV.5/surface-classification: control cutting, integral homology and the intersection pairing. The consumer is Classification of compact surfaces.
- MordellLawrenceVenkatesh:LV.5/mapping-class-group: control cutting, integral homology and the intersection pairing. The consumer is The mapping class group.
- MordellLawrenceVenkatesh:LV.5/dehn-twist: control cutting, integral homology and the intersection pairing. The consumer is Dehn twists.
- MordellLawrenceVenkatesh:LV.5/dehn-twist-homology: control cutting, integral homology and the intersection pairing. The consumer is Action of Dehn twists and multitwists on homology.
- MordellLawrenceVenkatesh:LV.5/primitive-classes-simple: control cutting, integral homology and the intersection pairing. The consumer is Primitive homology classes are represented by simple closed curves.
- MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence: control cutting, integral homology and the intersection pairing. The consumer is The configuration fibration of a surface and its fundamental groups.
- MordellLawrenceVenkatesh:LV.9/primitive-homology: control cutting, integral homology and the intersection pairing. The consumer is Primitive homology of a covering.
- MordellLawrenceVenkatesh:LV.9/affine-cover-normal-form: control cutting, integral homology and the intersection pairing. The consumer is Normal form of a singly ramified Aff(q)-cover (LV Proposition 8.5).

**Planning API.**

- `Surface` (constructor; signature omitted): A surface as a punctured compact connected oriented 2-manifold with boundary.
- `Surface.numPunctures` (data; signature omitted): The number n of punctures.
- `Surface.cut` (other; signature omitted): The surface S_α obtained by cutting along a simple closed curve or proper arc, with its gluing map (GeometricTopology Layer 1).
- `Surface.examples` (example; signature omitted): Closed surfaces, the thrice- and four-times-punctured spheres, the torus with one boundary circle.

**Mathematical tests.**

- `Surface.reviewTest1` (computation; signature omitted): The compact annulus with P empty is a surface carrier with two boundary components.
- `Surface.reviewTest2` (compatibility; signature omitted): Removing one interior point from an oriented compact torus gives the once-punctured torus with its induced orientation.
- `Surface.reviewTest3` (non-example; signature omitted): The real projective plane admits no orientation and is excluded.

**Acceptance.**

- The carrier includes closed oriented surfaces, annuli and punctured surfaces; their type and homology are provided separately.

**Sources.**

- lv2020, §8.1, p. 39: LV's convention, adopted verbatim.
- farb-margalit, §1.1, p. 18: The genus used in the type.

**Planet:** Surface.

**Signature gap:** Suggested signatures — surface.

### Classification of compact surfaces

**Node:** `MordellLawrenceVenkatesh:LV.5/surface-classification` · theorem; implementation unchecked.

Every closed connected orientable surface is homeomorphic to the connected sum of a sphere with g ≥ 0 tori, for a unique g; every compact connected orientable surface is obtained from a closed one by removing b ≥ 0 open disks with disjoint closures, and the pair (g, b) determines it up to homeomorphism. Consequently two surfaces (in the sense of the surface node) are homeomorphic by an orientation-preserving homeomorphism if and only if they have the same type (g, b, n).

**Hypotheses.** compact connected orientable 2-manifolds (with boundary).

**Construction or proof.**

1. For a closed compact topological surface use Gallier–Xu Appendix E: finite coordinate disks; straighten the finite boundary graph using plane Jordan–Schönflies; subdivide polygonal faces to obtain a finite triangulation. Boundary surfaces require collars and a compatible extension, explicitly recorded as a Part II interface.
2. View the triangulation as a finite polygon cell complex. Elementary operations P1 (subdivide an edge) and P2 (split a face along a new edge), and their inverses, preserve the realized surface.
3. Lemma 6.1 eliminates adjacent aa⁻¹, reduces inner vertices and merges faces. Isolate one boundary contour at a time. Pair consistently oriented sides into commutators (handles); inconsistent pairs form crosscaps. In the oriented case only the handle form remains.
4. Compute χ=2−2g−b for the resulting handle polygon. Boundary count and χ determine g, so the normal form is unique up to homeomorphism. Punctures are the removed marked points, not additional boundary charts.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations — AlgebraicTopology Stage 4 (CW pairs and cellular homology); tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead — AlgebraicTopology Stage 8 (relative homotopy, long exact sequences); tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group — GeometricTopology Layer 1 (cutting and gluing manifolds along submanifolds). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.5/surface`; `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`.

**Owner proposal.** tauceti:TauCetiRoadmap/GeometricTopology; GeometricTopology Part II proposal; current LV node is retained until accepted transfer.

**Acceptance.**

- The torus has genus 1 and H₁ ≅ ℤ².
- A compact Riemann surface is a closed orientable surface, and its genus is half the rank of H₁.

**Sources.**

- farb-margalit, §1.1, Theorem 1.1, p. 18: The statement; Farb–Margalit refer to the literature for the proof, which is outlined here.
- gallier-xu, Lemma 6.1 and Theorem 6.1, pp. 92–98; Appendix E, Theorem E.3, pp. 161–163: A read proof source for canonical polygon reduction; Appendix E gives the topological triangulation route.

**Signature gap:** Named theorem interfaces — LV.5.

### The mapping class group

**Node:** `MordellLawrenceVenkatesh:LV.5/mapping-class-group` · definition; implementation unchecked.

For a surface S, Mod(S) is the group of isotopy classes of orientation-preserving homeomorphisms of S that restrict to the identity on ∂S, isotopies being required to fix ∂S pointwise; homeomorphisms may permute the punctures. For x in the interior, S* denotes S with the marked point x (equivalently S ∖ {x} with the new puncture fixed), and Mod(S*) the corresponding group of classes fixing x. Mod(S) acts on H₁(S; ℤ) preserving î (the symplectic representation Ψ), on the set of isotopy classes of simple closed curves, and, through Out(π₁(S)), on the set of isomorphism classes of finite coverings of S.

**Hypotheses.** S a surface.

**Construction or proof.**

1. Homeomorphisms isotopic relative to ∂S induce the same map on H₁, on isotopy classes of curves and on conjugacy classes of homomorphisms π₁(S) → G, so the actions factor through Mod(S).
2. The action on coverings: f sends the class of a covering p : Z → S to the class of f ∘ p : Z → S; in terms of monodromy this is precomposition with the outer automorphism (f⁻¹)_* of π₁(S).

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.5/surface`; `MordellLawrenceVenkatesh:LV.5/surface-classification`; `tauceti:TauCeti.CoveringSpace.monodromyEquivalence`; `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`; `MordellLawrenceVenkatesh:LV.5/surface-homology`.

**Owner proposal.** tauceti:TauCetiRoadmap/GeometricTopology; GeometricTopology Part II proposal; current LV node is retained until accepted transfer.

**Uses.**

- MordellLawrenceVenkatesh:LV.5/change-of-coordinates: descend surface homeomorphisms and covering actions through isotopy. The consumer is Change of coordinates for simple closed curves.
- MordellLawrenceVenkatesh:LV.5/dehn-twist: descend surface homeomorphisms and covering actions through isotopy. The consumer is Dehn twists.
- MordellLawrenceVenkatesh:LV.5/point-push: descend surface homeomorphisms and covering actions through isotopy. The consumer is The point-pushing homomorphism.
- MordellLawrenceVenkatesh:LV.5/birman-exact-sequence: descend surface homeomorphisms and covering actions through isotopy. The consumer is The Birman exact sequence and pushes of simple loops.
- MordellLawrenceVenkatesh:LV.5/capping-surjective: descend surface homeomorphisms and covering actions through isotopy. The consumer is Capping boundary circles and forgetting points are surjective on mapping class groups.
- MordellLawrenceVenkatesh:LV.5/covering-dehn-twist-lift: descend surface homeomorphisms and covering actions through isotopy. The consumer is Lifting powers of Dehn twists to finite coverings.
- MordellLawrenceVenkatesh:LV.9/affine-cover: descend surface homeomorphisms and covering actions through isotopy. The consumer is Aff(q)-covers and singly ramified Aff(q)-covers (LV §8.2).

**Planning API.**

- `MappingClassGroup` (constructor; signature omitted): Mod(S) = Homeo⁺(S, ∂S)/isotopy rel ∂S.
- `MappingClassGroup.marked` (constructor; signature omitted): Mod(S*) for a marked interior point x.
- `MappingClassGroup.homologyRep` (data; signature omitted): Ψ : Mod(S) → Aut(H₁(S; ℤ), î).
- `MappingClassGroup.actCurves` (data; signature omitted): The action on isotopy classes of simple closed curves.
- `MappingClassGroup.actCovers` (data; signature omitted): The action on isomorphism classes of finite coverings of S via Out(π₁ S).
- `MappingClassGroup.forget` (data; signature omitted): Forget : Mod(S*) → Mod(S), filling in the marked point; surjective.
- `MappingClassGroup.examples` (example; signature omitted): Mod(D²) = 1 (Alexander lemma) and Mod(annulus) = ℤ.

**Mathematical tests.**

- `MappingClassGroup.reviewTest1` (degenerate; signature omitted): The boundary-fixed mapping class group of a disk is trivial.
- `MappingClassGroup.reviewTest2` (computation; signature omitted): The boundary-fixed mapping class group of an annulus is ℤ, with its Dehn twist corresponding to 1.
- `MappingClassGroup.reviewTest3` (non-example; signature omitted): The mapping class group of the three-punctured sphere allowing permutations is Sym(3); its pure subgroup is trivial. These two groups must not be identified.

**Acceptance.**

- The pure mapping class group of the thrice-punctured sphere is trivial (Farb–Margalit §3.6).
- Mod of an annulus is ℤ, generated by the twist map.

**Sources.**

- farb-margalit, §2.1, printed pp. 46–47 (PDF pp. 56–57): Mapping classes act on configurations of curves.

**Planet:** Mapping class group.

**Signature gap:** Suggested signatures — mapping-class-group.

### Change of coordinates for simple closed curves

**Node:** `MordellLawrenceVenkatesh:LV.5/change-of-coordinates` · lemma; implementation unchecked.

Let S be a surface. (a) Two nonseparating simple closed curves in S are related by an orientation-preserving homeomorphism of S fixing ∂S and the punctures. (b) Two ordered pairs (a, b), (a', b') of simple closed curves meeting transversally in exactly one point, with the same algebraic intersection sign if orientations on the curves are prescribed, are related by such a homeomorphism. (c) If S is closed of genus g, there is a geometric symplectic basis: simple closed curves a_1, b_1, …, a_g, b_g with a_i ∩ b_i one transverse point and all other pairs disjoint, whose classes form a symplectic basis of H₁(S; ℤ); any two such systems are related by a homeomorphism. (d) Every nonseparating simple closed curve a admits a simple closed curve b meeting it transversally once.

**Hypotheses.** S a surface; for (c) S closed.

**Construction or proof.**

1. Cut S along the given curves; the cut surfaces have the same type (Euler characteristic, number of boundary components, punctures and connectivity are determined by the combinatorial data), so by the classification theorem they are homeomorphic by a homeomorphism respecting the boundary circles coming from the curves.
2. Glue back: choose the homeomorphism compatibly with the gluing maps on the boundary circles (a homeomorphism of a circle is isotopic to a rotation or a reflection, and orientations are prescribed).
3. (c) and (d) follow from (a), (b) and the standard picture on the connected sum of tori.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group — GeometricTopology Layer 1 (cutting and gluing manifolds along submanifolds). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.5/surface-classification`; `MordellLawrenceVenkatesh:LV.5/mapping-class-group`; `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`; `MordellLawrenceVenkatesh:LV.5/simple-closed-curve`.

**Owner proposal.** tauceti:TauCetiRoadmap/GeometricTopology; GeometricTopology Part II proposal; current LV node is retained until accepted transfer.

**Acceptance.**

- On the torus, the curves (1, 0) and (1, k) are related by T^k in the other coordinate.
- A separating and a nonseparating curve are not related.

**Sources.**

- farb-margalit, §1.3, p. 38: The principle; Farb–Margalit leave the verifications to the reader.

**Signature gap:** Named theorem interfaces — LV.5.

### Dehn twists

**Node:** `MordellLawrenceVenkatesh:LV.5/dehn-twist` · definition; implementation unchecked.

For a simple closed curve α in a surface S, a regular neighbourhood N ≅ S¹ × [0, 1] (orientation-preserving) and the twist map T(θ, t) = (θ + 2πt, t) of the annulus, the Dehn twist T_α is φ ∘ T ∘ φ⁻¹ on N and the identity outside N. Its class T_a ∈ Mod(S) depends only on the isotopy class a of α; T_{f(a)} = f T_a f⁻¹ for f ∈ Mod(S); twists about disjoint curves commute; T_a = 1 when a bounds a disk or a once-punctured disk.

**Hypotheses.** α a simple closed curve in S.

**Construction or proof.**

1. Well-definedness from the uniqueness of regular neighbourhoods up to isotopy.
2. Conjugation formula: f T_α f⁻¹ is the twist in the neighbourhood f(N) of f(α).
3. Disjoint curves have disjoint neighbourhoods, so the twists commute; a twist in the neighbourhood of a curve bounding a (once-punctured) disk is isotopic to the identity by the Alexander lemma.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.5/mapping-class-group`; `MordellLawrenceVenkatesh:LV.5/surface`; `MordellLawrenceVenkatesh:LV.5/surface-homology`; `MordellLawrenceVenkatesh:LV.5/simple-closed-curve`.

**Owner proposal.** tauceti:TauCetiRoadmap/GeometricTopology; GeometricTopology Part II proposal; current LV node is retained until accepted transfer.

**Uses.**

- MordellLawrenceVenkatesh:LV.5/dehn-twist-homology: compute the homological action of twists and their lifts. The consumer is Action of Dehn twists and multitwists on homology.
- MordellLawrenceVenkatesh:LV.5/point-push: compute the homological action of twists and their lifts. The consumer is The point-pushing homomorphism.
- MordellLawrenceVenkatesh:LV.5/birman-exact-sequence: compute the homological action of twists and their lifts. The consumer is The Birman exact sequence and pushes of simple loops.
- MordellLawrenceVenkatesh:LV.5/covering-dehn-twist-lift: compute the homological action of twists and their lifts. The consumer is Lifting powers of Dehn twists to finite coverings.
- MordellLawrenceVenkatesh:LV.9/normal-form-curves: compute the homological action of twists and their lifts. The consumer is Curves on the torus part of the normal form (LV Lemma 8.11).
- MordellLawrenceVenkatesh:LV.10/covers-distinguished-by-curve: compute the homological action of twists and their lifts. The consumer is Distinct covers are distinguished by the cycle type along a simple closed curve (LV Lemma 8.8).

**Planning API.**

- `dehnTwist` (constructor; signature omitted): T_a ∈ Mod(S) for an isotopy class a of simple closed curves.
- `dehnTwist_conj` (relation; signature omitted): f T_a f⁻¹ = T_{f(a)}.
- `dehnTwist_commute` (relation; signature omitted): T_a T_b = T_b T_a when a and b are disjoint.
- `dehnTwist_eq_one` (simp; signature omitted): T_a = 1 if a bounds a disk or a once-punctured disk.
- `dehnTwist_support` (other; signature omitted): T_α is supported in any prescribed regular neighbourhood of α.
- `multitwist` (data; signature omitted): ∏ T_{e_i}^{m_i} for pairwise disjoint curves e_i.
- `dehnTwist_torus` (example; signature omitted): The twists about the two standard curves of the torus.

**Mathematical tests.**

- `dehnTwist.reviewTest1` (degenerate; signature omitted): A twist about a curve bounding a disk or a once-punctured disk is identity in Mod(S).
- `dehnTwist.reviewTest2` (non-example; signature omitted): A twist about the core of the annulus is not identity when both boundary circles are fixed pointwise.
- `dehnTwist.reviewTest3` (compatibility; signature omitted): For f orientation-preserving, T_{f(a)}=f T_a f⁻¹, whereas reversing the surface orientation changes the twist direction.

**Acceptance.**

- On the torus with the standard basis, T_b acts on H₁ by the matrix [[1, 0], [±1, 1]].
- The boundary twist of a once-punctured disk is trivial in Mod.

**Sources.**

- farb-margalit, §3.1.1, p. 68: The definition of T_α.

**Planet:** Dehn twist.

**Signature gap:** Suggested signatures — dehn-twist.

### Action of Dehn twists and multitwists on homology

**Node:** `MordellLawrenceVenkatesh:LV.5/dehn-twist-homology` · lemma; implementation unchecked.

Let S be a surface and b an oriented simple closed curve. For every x ∈ H₁(S; ℤ) and k ∈ ℤ, Ψ(T_b^k)(x) = x + k·î(x, b)·[b]. Consequently, for pairwise disjoint oriented simple closed curves e_1, …, e_r and integers m_i, the multitwist ∏ T_{e_i}^{m_i} acts by x ↦ x + Σ_i m_i î(x, e_i)[e_i]; in particular it is unipotent, and it is the identity on the î-orthogonal of span{[e_i]}.

**Hypotheses.** S a surface; b an oriented simple closed curve.

**Construction or proof.**

1. The twist is supported in an annulus N around b. Represent x by a cycle transverse to b; each transverse crossing of b is replaced by an arc that runs once around N, which changes the cycle by ±[b] with the sign of the crossing.
2. Summing over crossings gives x + î(x, b)[b] for k = 1; iterate, using î(b, b) = 0.
3. For disjoint curves the twists commute and î(e_i, e_j) = 0, so the formulas compose additively.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology — AlgebraicTopology Stage 2 (singular homology, local coefficient systems); tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality — AlgebraicTopology Stage 6 (cohomology, products, Poincaré duality, intersection pairing). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.5/dehn-twist`; `MordellLawrenceVenkatesh:LV.5/surface`; `MordellLawrenceVenkatesh:LV.5/change-of-coordinates`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `MordellLawrenceVenkatesh:LV.5/surface-homology`; `MordellLawrenceVenkatesh:LV.5/simple-closed-curve`.

**Owner proposal.** tauceti:TauCetiRoadmap/GeometricTopology; GeometricTopology Part II proposal; current LV node is retained until accepted transfer.

**Acceptance.**

- On S_g with a geometric symplectic basis, T_{b_1} sends a_1 to a_1 ± b_1 and fixes the other basis vectors (Farb–Margalit Proposition 6.3).
- A separating curve has class in the radical of the intersection form, so its twist acts trivially on H₁. Its class is zero on a closed surface; it need not vanish on a surface with several boundary components (the annulus core is a counterexample).

**Sources.**

- farb-margalit, §6.3, Proposition 6.3, p. 176: Farb–Margalit continue: Ψ(T_b^k)([a]) = [a] + k·î(a, b)[b]; the proof is local, which gives the statement on any surface.

**Signature gap:** Named theorem interfaces — LV.5.

### Primitive homology classes are represented by simple closed curves

**Node:** `MordellLawrenceVenkatesh:LV.5/primitive-classes-simple` · lemma; implementation unchecked.

Let g ≥ 1. A nonzero class of H₁(S_g; ℤ) is represented by an oriented simple closed curve if and only if it is primitive; a simple closed curve is nonseparating if and only if its class is nonzero, and then its class is primitive. The same holds on a closed surface with one puncture or with one boundary circle (where H₁ is identified with that of the closed surface), and every class of H₁ is a sum of classes of simple closed curves.

**Hypotheses.** g ≥ 1.

**Construction or proof.**

1. Farb–Margalit's topological Euclidean algorithm: write the class in a geometric symplectic basis and reduce the coordinates by twists, which preserve simplicity.
2. A nonseparating curve has a dual curve meeting it once (change of coordinates), so its class pairs to 1 with an integral class and is primitive; a separating curve bounds a subsurface and is null-homologous.
3. One puncture or one boundary circle: the inclusion into the capped surface induces an isomorphism on H₁ and simple closed curves can be isotoped off the cap.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.5/change-of-coordinates`; `MordellLawrenceVenkatesh:LV.5/dehn-twist-homology`; `MordellLawrenceVenkatesh:LV.5/surface`; `MordellLawrenceVenkatesh:LV.5/surface-homology`; `MordellLawrenceVenkatesh:LV.5/simple-closed-curve`.

**Owner proposal.** tauceti:TauCetiRoadmap/GeometricTopology; GeometricTopology Part II proposal; current LV node is retained until accepted transfer.

**Acceptance.**

- (2, 0) ∈ H₁(T²) is not represented by a simple closed curve; (2, 3) is.
- On S_2 the class a_1 + a_2 is represented by a simple closed curve.

**Sources.**

- farb-margalit, §6.2, Proposition 6.2, p. 173: Statement for closed surfaces.

**Signature gap:** Named theorem interfaces — LV.5.

### The point-pushing homomorphism

**Node:** `MordellLawrenceVenkatesh:LV.5/point-push` · construction; implementation unchecked.

Let S be a surface and x an interior point. For a loop α in S based at x, extend the motion of x along α to an isotopy φ_t of S fixed near ∂S (isotopy extension for points) and let Push(α) ∈ Mod(S*) be the class of φ_1, regarded as a homeomorphism of S fixing x. Push(α) depends only on the homotopy class of α, and Push : π₁(S, x) → Mod(S*) is a homomorphism (with the composition convention fixed by the path-concatenation convention of Mathlib's fundamental group). Its image lies in the kernel of Forget : Mod(S*) → Mod(S), and Push(α) acts on π₁(S, x) by conjugation by α.

**Hypotheses.** S a surface; x in the interior of S.

**Construction or proof.**

1. Isotopy extension for a point in the interior of a surface gives φ_t.
2. Independence of the choices: the evaluation map Homeo(S, ∂S) → S ∖ ∂S, f ↦ f(x), is a locally trivial fibre bundle with fibre Homeo(S*, ∂S); the connecting map of its homotopy sequence is Push, which is therefore well defined on π₁(S, x) and a homomorphism (Farb–Margalit §4.2).
3. φ_1 is isotopic to the identity in S by construction, so Forget(Push(α)) = 1; tracking the base point along the isotopy shows that φ_1 acts on π₁(S, x) by conjugation by α.

Use Mathlib FundamentalGroup.mul_def: α*β traverses β first, then α. Push(α) is the endpoint mapping class of an isotopy moving the marked point along α. Its action is γ ↦ α*γ*α⁻¹: in left-to-right path notation this traverses α⁻¹,γ,α. Fix the positive twist by x ↦ x+î(x,[curve])[curve]; name the two boundary curves so Push(α)=T_a T_b⁻¹. This convention must be checked by the annulus isotopy, not inferred from a sign-free formula.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.5/mapping-class-group`; `MordellLawrenceVenkatesh:LV.5/dehn-twist`; `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`; `mathlib:FundamentalGroup.mul_def`.

**Owner proposal.** tauceti:TauCetiRoadmap/GeometricTopology; GeometricTopology Part II proposal; current LV node is retained until accepted transfer.

**Uses.**

- MordellLawrenceVenkatesh:LV.5/birman-exact-sequence: identify monodromy of the moving branch point with point-pushing. The consumer is The Birman exact sequence and pushes of simple loops.

**Planning API.**

- `pointPush` (constructor; signature omitted): Push : π₁(S, x) →* Mod(S*).
- `pointPush_apply` (characterisation; signature omitted): Push(α) is the class of the end map of any isotopy extending the motion of x along α.
- `forget_pointPush` (simp; signature omitted): Forget (Push α) = 1.
- `pointPush_action` (relation; signature omitted): With Mathlib multiplication p*q=q.trans p, endpoint point-pushing acts on based loops by γ ↦ α*γ*α⁻¹; equivalently the path α⁻¹ followed by γ followed by α.
- `pointPush_homology` (other; signature omitted): Push(α) acts trivially on H₁(S) and on H₁(S ∖ {x}) when S is closed.
- `pointPush_torus` (example; signature omitted): On the torus Push is trivial.

**Mathematical tests.**

- `pointPush.reviewTest1` (degenerate; signature omitted): The constant loop pushes to identity.
- `pointPush.reviewTest2` (computation; signature omitted): Every loop on the torus pushes to identity in its once-marked mapping class group, using the translation isotopy.
- `pointPush.reviewTest3` (non-example; signature omitted): On a closed genus-two surface, pushing a nontrivial simple loop gives a nontrivial mapping class in the forgetful kernel, although its action on H₁ is identity.

**Acceptance.**

- S = S_{0,3} and α a loop around one puncture: Push(α) is a single Dehn twist about the curve enclosing that puncture and x.
- S a torus: Push is trivial (π₁ is abelian and the fibration has a section), so the injectivity statement of the Birman sequence needs χ(S) < 0.

**Sources.**

- farb-margalit, §4.2, Theorem 4.6, p. 102: The push map and its well-definedness, which Farb–Margalit identify as the content of the theorem.

**Planet:** Point-pushing map.

**Signature gap:** Suggested signatures — point-push.

### The Birman exact sequence and pushes of simple loops

**Node:** `MordellLawrenceVenkatesh:LV.5/birman-exact-sequence` · theorem; implementation unchecked.

Let S be a surface with χ(S) < 0 and x an interior point. Then 1 → π₁(S, x) → Mod(S*) → Mod(S) → 1 (Push, then Forget) is exact. For a simple loop α at x, Push([α]) = T_a T_b⁻¹, where a and b are the simple closed curves in S ∖ {x} obtained by pushing α off itself to the left and to the right; a and b are nonseparating in S ∖ {x} if and only if α is nonseparating in S.

**Hypotheses.** χ(S) < 0; x in the interior of S.

**Construction or proof.**

1. Exactness at Mod(S*): a class in the kernel of Forget is isotopic to the identity in S, and the track of x is a loop α whose push is that class (up to inversion); Forget is surjective because a homeomorphism can be isotoped to fix x.
2. Injectivity: Push(α) acts on π₁(S, x) by conjugation by α, and π₁(S) has trivial centre when χ(S) < 0.
3. The formula for simple loops: the isotopy pushing x once around α is supported in the annulus between a and b, where it equals T_a T_b⁻¹; nonseparation is read off from the complement of the annulus.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead — AlgebraicTopology Stage 8 (relative homotopy, long exact sequences); tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.5/point-push`; `MordellLawrenceVenkatesh:LV.5/mapping-class-group`; `MordellLawrenceVenkatesh:LV.5/dehn-twist`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`; `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`.

**Owner proposal.** tauceti:TauCetiRoadmap/GeometricTopology; GeometricTopology Part II proposal; current LV node is retained until accepted transfer.

**Acceptance.**

- S = S_{0,3} and α a loop around one puncture: a bounds a once-punctured disk, so Push(α) = T_b⁻¹ with b enclosing that puncture and x.
- For S closed of genus ≥ 2 and α nonseparating, Push(α) is a nontrivial element acting trivially on H₁(S).

**Sources.**

- farb-margalit, §4.2, Theorem 4.6, p. 102: The Birman exact sequence.
- farb-margalit, §4.2, Fact 4.7, p. 103: Push of a simple loop.
- farb-margalit, §4.2, p. 104: Nonseparation.

**Signature gap:** Named theorem interfaces — LV.5.

### Capping boundary circles and forgetting points are surjective on mapping class groups

**Node:** `MordellLawrenceVenkatesh:LV.5/capping-surjective` · lemma; implementation unchecked.

Let S be a surface and S' the surface obtained by capping a boundary circle β with a once-marked disk. Then 1 → ⟨T_β⟩ → Mod(S) → Mod(S', p) → 1 is exact (Mod(S', p) fixing the marked point p). Consequently, capping all boundary circles with disks induces a surjection Mod(S) → Mod(Ŝ) onto the mapping class group of the capped surface, compatible with the maps on H₁.

**Hypotheses.** S a surface with boundary circle β.

**Construction or proof.**

1. The capping sequence is Farb–Margalit Proposition 3.19.
2. Forgetting the marked points is surjective (Birman exact sequence, right-hand map), and a composite of surjections is surjective.
3. The inclusion S ⊆ Ŝ is equivariant, which gives the compatibility on H₁.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.5/mapping-class-group`; `MordellLawrenceVenkatesh:LV.5/birman-exact-sequence`.

**Owner proposal.** tauceti:TauCetiRoadmap/GeometricTopology; GeometricTopology Part II proposal; current LV node is retained until accepted transfer.

**Acceptance.**

- Capping the torus with one boundary circle gives Mod(T°) → Mod(T²) = SL₂(ℤ), surjective.

**Sources.**

- farb-margalit, §3.6.2, Proposition 3.19, p. 89: The capping homomorphism.

**Signature gap:** Named theorem interfaces — LV.5.

### Surjectivity of the symplectic representation

**Node:** `MordellLawrenceVenkatesh:LV.5/symplectic-representation-surjective` · theorem; implementation unchecked.

For g ≥ 1 the symplectic representation Ψ : Mod(S_g) → Sp(2g, ℤ) is surjective.

**Hypotheses.** g ≥ 1.

**Construction or proof.**

1. By Proposition 6.3 the twists about curves in a geometric symplectic basis and about the curves a_i + a_{i+1} map to symplectic transvections.
2. These transvections generate Sp(2g, ℤ) (Farb–Margalit's first proof, via a generating set of Sp(2g, ℤ); the second proof uses transitivity on primitive vectors, Proposition 6.2).

**Prerequisites.** `MordellLawrenceVenkatesh:LV.5/dehn-twist-homology`; `MordellLawrenceVenkatesh:LV.5/primitive-classes-simple`; `MordellLawrenceVenkatesh:LV.5/change-of-coordinates`.

**Owner proposal.** tauceti:TauCetiRoadmap/GeometricTopology; GeometricTopology Part II proposal; current LV node is retained until accepted transfer.

**Acceptance.**

- g = 1: Mod(T²) ≅ SL₂(ℤ), generated by the images of the two standard twists.

**Sources.**

- farb-margalit, §6.3, Theorem 6.4, p. 177: The theorem.

**Signature gap:** Named theorem interfaces — LV.5.

### The configuration fibration of a surface and its fundamental groups

**Node:** `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence` · lemma; implementation unchecked.

Let S be a connected oriented surface without boundary and F(S) := {(x, y) ∈ S × S : x ≠ y} with p(x, y) = y. Then p is a locally trivial fibre bundle with fibre S ∖ {y}, and for y₀ ≠ x₀ the sequence π₁(S ∖ {y₀}, x₀) → π₁(F(S), (x₀, y₀)) → π₁(S, y₀) → 1 (the first map x ↦ (x, y₀)) is exact; its image Γ̄ is normal, and conjugation by π₁(F(S)) preserves the conjugacy class c of a small loop around y₀ in S ∖ {y₀}. For S = Y closed of genus g ≥ 1 the first map is injective. For S of genus g ≥ 1 closed, π₁(S ∖ {y₀}, x₀) is free on classes x_1, x_1', …, x_g, x_g' such that a small loop around y₀ is conjugate to [x_1, x_1'] ⋯ [x_g, x_g'], and H₁(S ∖ {y₀}) → H₁(S) is an isomorphism.

**Hypotheses.** S connected without boundary; y₀ ≠ x₀.

**Construction or proof.**

1. Local triviality: for y in a disk D around y₀ choose homeomorphisms h_y of S supported in a slightly larger disk, continuous in y, with h_y(y₀) = y; then (x, y) ↦ (h_y⁻¹ x, y) trivializes p over D.
2. A locally trivial bundle over a paracompact base has the homotopy lifting property, which gives exactness of the long exact sequence in low degrees: surjectivity on π₁ because the fibre is path connected, exactness in the middle by lifting null-homotopies.
3. The monodromy of the bundle along a loop is a homeomorphism of the fibre that is the identity near the end at y₀ up to isotopy, so it preserves the peripheral class c.
4. Injectivity for closed S of genus ≥ 1: π₂(S) = 0, since the universal cover of S is a plane (or by the free-group structure of π₁ of the punctured surface).
5. Presentation: by the classification, S is a 4g-gon with edge word ∏ [a_i, b_i]; removing an interior point of the 2-cell, the punctured surface deformation retracts onto the wedge of 2g circles, whose fundamental group is free (van Kampen), and the boundary of the 2-cell reads ∏[x_i, x_i'].

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid — AlgebraicTopology Stage 1 (van Kampen theorem and group presentations); tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead — AlgebraicTopology Stage 8 (relative homotopy, long exact sequences); tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group — GeometricTopology Layer 1 (cutting and gluing manifolds along submanifolds); tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.5/surface-classification`; `MordellLawrenceVenkatesh:LV.5/surface`; `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`; `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`; `MordellLawrenceVenkatesh:LV.5/surface-homology`.

**Owner proposal.** tauceti:TauCetiRoadmap/GeometricTopology; GeometricTopology Part II proposal; current LV node is retained until accepted transfer.

**Acceptance.**

- S = ℂ ∖ {0}: F(S) → S has fibre ℂ ∖ {0, y}, with π₁ free of rank 2.
- g = 1: π₁(T² ∖ {pt}) is free on two generators x, x' and the puncture loop is [x, x'].

**Sources.**

- lv2020, §7.3, proof of Lemma 7.4, p. 38: LV's statement; the vanishing needed for injectivity is that of π₂ of the base Y.
- lv2020, §5, p. 26: The presentation of the punctured surface group.

**Signature gap:** Named theorem interfaces — LV.5.

### Lifting powers of Dehn twists to finite coverings

**Node:** `MordellLawrenceVenkatesh:LV.5/covering-dehn-twist-lift` · lemma; implementation unchecked.

Let S be a surface, Z° → S a connected finite covering of degree n with monodromy Cov : π₁(S, s₀) → Sym(F) (F the fibre), and e a simple closed curve in S. Let n_e be the order of Cov(e) and (d_1, …, d_k) its cycle type. Then the preimage of e is a disjoint union of simple closed curves e_1, …, e_k, with e_i of degree d_i over e; T_e^{n_e} fixes the isomorphism class of the covering, and the homeomorphism ∏_i T_{e_i}^{n_e/d_i} (twists supported in the preimages of a regular neighbourhood of e) lifts T_e^{n_e}. If the centralizer of the image of Cov in Sym(F) is trivial, this is the only lift. The same holds for the compactified (branched) coverings when S is a punctured closed surface and the twists are supported away from the punctures.

**Hypotheses.** Z° → S finite connected covering; e simple closed curve.

**Construction or proof.**

1. The preimage of an annulus N around e is a disjoint union of annuli N_i, with N_i → N the connected d_i-fold covering of annuli, whose core curve e_i maps with degree d_i.
2. On N_i, the twist T^{n_e/d_i} of the core covers T^{n_e} on N: in the coordinates (θ, t) ↦ (d_i θ, t), the map (θ, t) ↦ (θ + 2π(n_e/d_i)t, t) covers (θ, t) ↦ (θ + 2πn_e t, t), and both are the identity near the boundary circles, so the lift extends by the identity.
3. Lifts of a homeomorphism differ by deck transformations, i.e. by elements of the centralizer of the monodromy image, which is trivial by assumption.
4. Branched case: the twists are supported away from the branch points, so the lift extends over the filled-in points.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.5/dehn-twist`; `MordellLawrenceVenkatesh:LV.5/mapping-class-group`; `mathlib:IsCoveringMap.monodromyPerm`; `mathlib:IsCoveringMap.liftHomotopy`; `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`; `MordellLawrenceVenkatesh:LV.5/simple-closed-curve`.

**Owner proposal.** tauceti:TauCetiRoadmap/GeometricTopology; GeometricTopology Part II proposal; current LV node is retained until accepted transfer.

**Acceptance.**

- The double cover of the four-times-punctured sphere by a four-times-punctured torus, with e enclosing two punctures: Cov(e) = 1, k = 2, and T_e lifts to T_{e_1}T_{e_2}.
- An Aff(q)-cover and a curve with Cov(e) a q-cycle: k = 1, and T_e^q lifts to T_{e_1}.

**Sources.**

- lv2020, §8.3, p. 42: LV continue: D_e^{n_e} lifts to the product of the commuting twists D_{e_i}^{n_e/d_i}.

**Signature gap:** Named theorem interfaces — LV.5.

### Monodromy of families of branched covers over configuration spaces

**Node:** `MordellLawrenceVenkatesh:LV.5/configuration-family-monodromy` · lemma; implementation unchecked.

Let Σ be a closed oriented surface, B ⊂ Σ finite, S = Σ ∖ B with χ(S) ≤ −1 (so χ(S ∖ {y}) < 0), and F(S) → S the configuration fibration. Let 𝒵° → F(S) be a finite covering and, for y ∈ S, let Z_y be the compact surface obtained by filling in the punctures of the covering Z°_y → Σ ∖ (B ∪ {y}) (the branched covering of Σ). Then: (a) ⋃_y Z_y is a locally trivial fibre bundle 𝒵̄ → S with fibre Z_{y₀}; (b) for a loop γ at y₀, the monodromy of 𝒵̄ along γ is represented by a homeomorphism h_γ of Z_{y₀} that lifts a homeomorphism φ_γ of Σ fixing B ∪ {y₀} whose class in Mod(Σ ∖ (B ∪ {y₀})) is Push(γ) (for S* = S with marked point y₀); (c) consequently the monodromy action of π₁(S, y₀) on H₁(Z_{y₀}; ℤ) is given by lifts of point-pushing maps; if the lift of Push(γ) is unique (trivial centralizer of the monodromy of Z°_{y₀}), the action is the lifted action, and in general it differs from a chosen lift by a deck transformation.

**Hypotheses.** χ(S) ≤ −1; 𝒵° → F(S) finite covering.

**Construction or proof.**

1. Isotopy extension: the loop γ extends to an isotopy φ_t of Σ fixing B with φ_t(y₀) = γ(t), which trivializes F(S) over γ by (x, t) ↦ (φ_t(x), γ(t)).
2. Lift the trivialization to 𝒵° by the homotopy lifting property of coverings, starting from the identity at t = 0; the end map h_γ° is a homeomorphism of Z°_{y₀} lifting φ_1.
3. A homeomorphism of punctured-disk coverings that lifts a homeomorphism of the base extending over the puncture extends over the filled-in points; this gives h_γ on Z_{y₀} and the local triviality (a).
4. φ_1 represents Push(γ) by definition of the push map; the monodromy of the homology local system of 𝒵̄ is induced by h_γ.
5. Two lifts of φ_1 differ by a deck transformation of Z°_{y₀}.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology — AlgebraicTopology Stage 2 (singular homology, local coefficient systems); tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence`; `MordellLawrenceVenkatesh:LV.5/birman-exact-sequence`; `MordellLawrenceVenkatesh:LV.5/covering-dehn-twist-lift`; `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`; `mathlib:IsCoveringMap.liftHomotopy`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`; `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`.

**Owner proposal.** tauceti:TauCetiRoadmap/GeometricTopology; GeometricTopology Part II proposal; current LV node is retained until accepted transfer.

**Acceptance.**

- The Legendre family: Σ = ℙ¹(ℂ), B = {0, 1, ∞}, Z_λ the double cover branched at {0, 1, λ, ∞}.
- The Kodaira–Parshin family: B = ∅, Σ = Y(ℂ) of genus ≥ 2, Z_y the Aff(q)-covers branched at y.

**Sources.**

- lv2020, §8.2.3, p. 41: LV assert the compatibility of the topological monodromy with the lifted point-pushing action; the node supplies the argument.
- farb-margalit, §4.2, Theorem 4.6, p. 102: Push maps.

**Signature gap:** Named theorem interfaces — LV.5.

### Homology, type and intersection form of an oriented surface

**Node:** `MordellLawrenceVenkatesh:LV.5/surface-homology` · lemma; implementation unchecked.

For an oriented surface Σ ∖ P of type (g,b,n), χ = 2−2g−b−n. If b+n=0, H₁(−;ℤ) ≃ ℤ^(2g); otherwise H₁ ≃ ℤ^(2g+b+n−1). The intersection form has a standard unimodular symplectic rank-2g summand and a radical of rank max(b+n−1,0); in particular it is perfect when b+n≤1.

**Hypotheses.** Σ compact connected oriented surface; P finite in its interior.

**Construction or proof.**

1. Apply classification to the capped compact carrier to define genus and boundary count; choose its finite polygon/CW model.
2. The cellular chain computation gives the handle basis and the boundary/peripheral generators, with their single sum relation when there are boundary components or punctures.
3. Apply Poincaré–Lefschetz duality. Handles intersect in standard pairs; boundary and peripheral loops form the radical. Removing punctures is modeled by replacing each with a small boundary circle.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.5/surface`; `MordellLawrenceVenkatesh:LV.5/surface-classification`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Owner proposal.** tauceti:TauCetiRoadmap/GeometricTopology; GeometricTopology Part II proposal; current LV node is retained until accepted transfer.

**Planning API.**

- `Surface.genus` (data; signature omitted): The genus g.
- `Surface.numBoundary` (data; signature omitted): The number b of boundary circles.
- `Surface.eulerChar_eq` (characterisation; signature omitted): χ(S) = 2 − 2g − b − n, computed from singular homology.
- `Surface.intersectionForm` (data; signature omitted): The algebraic intersection form î on H₁(S; ℤ), alternating.
- `Surface.intersectionForm_perfect` (other; signature omitted): î is perfect when b + n ≤ 1.

**Mathematical tests.**


**Acceptance.**

- Annulus: H₁=ℤ, zero intersection form, χ=0.
- Once-punctured torus: H₁=ℤ² with a perfect alternating form, χ=−1.
- Thrice-punctured sphere: H₁=ℤ², zero form, χ=−1.

**Sources.**

- farb-margalit, §1.1, Theorem 1.1, p. 18: The statement; Farb–Margalit refer to the literature for the proof, which is outlined here.

**Signature gap:** Named theorem interfaces — LV.5.

### Oriented simple closed curves

**Node:** `MordellLawrenceVenkatesh:LV.5/simple-closed-curve` · definition; implementation unchecked.

An oriented simple closed curve in S is an embedding S¹→int(S), up to ambient isotopy and orientation-preserving reparameterization. Its class in integral H₁ is induced by the standard orientation of S¹. Separating means that the complement of its image is disconnected. Essential/nonperipheral is a separate predicate: a disk-bounding embedded circle is still a simple closed curve.

**Hypotheses.** S an oriented topological surface.

**Construction or proof.**

1. Use the existing topological embedding carrier with the circle orientation. Form the stated isotopy quotient in the proposed surface owner, and show its image, separation and homology class are well-defined.

The smooth convention in LV is compared with tame topological embeddings after choosing a compatible surface smoothing. The smoothing/isotopy/collar comparison is required of GeometricTopology Part II; it is not assumed supplied by the current smooth-manifold gluing stage.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.5/surface`; `MordellLawrenceVenkatesh:LV.5/surface-homology`.

**Owner proposal.** tauceti:TauCetiRoadmap/GeometricTopology; GeometricTopology Part II proposal; current LV node is retained until accepted transfer.

**Uses.**

- MordellLawrenceVenkatesh:LV.5/change-of-coordinates: Use an actual embedded curve, its orientation and isotopy-invariant homology class.
- MordellLawrenceVenkatesh:LV.5/dehn-twist: Use an actual embedded curve, its orientation and isotopy-invariant homology class.
- MordellLawrenceVenkatesh:LV.5/dehn-twist-homology: Use an actual embedded curve, its orientation and isotopy-invariant homology class.
- MordellLawrenceVenkatesh:LV.5/primitive-classes-simple: Use an actual embedded curve, its orientation and isotopy-invariant homology class.
- MordellLawrenceVenkatesh:LV.5/covering-dehn-twist-lift: Use an actual embedded curve, its orientation and isotopy-invariant homology class.
- MordellLawrenceVenkatesh:LV.9/preimage-classes-independent: Use an actual embedded curve, its orientation and isotopy-invariant homology class.
- MordellLawrenceVenkatesh:LV.9/liftable-curve: Use an actual embedded curve, its orientation and isotopy-invariant homology class.
- MordellLawrenceVenkatesh:LV.9/normal-form-curves: Use an actual embedded curve, its orientation and isotopy-invariant homology class.
- MordellLawrenceVenkatesh:LV.10/covers-distinguished-by-curve: Use an actual embedded curve, its orientation and isotopy-invariant homology class.

**Planning API.**

- `SimpleClosedCurve` (constructor; signature omitted): The oriented embedding/isotopy quotient, without an essentialness condition.
- `SimpleClosedCurve.homologyClass` (data; signature omitted): The induced oriented integral H₁ class.
- `SimpleClosedCurve.IsSeparating` (characterisation; signature omitted): The complement of the image is disconnected.
- `SimpleClosedCurve.reverse` (compatibility; signature omitted): Reverse the parameter orientation; the homology class changes sign and separation is unchanged.
- `SimpleClosedCurve.map` (compatibility; signature omitted): Map by an orientation-preserving homeomorphism, compatibly with H₁ and separation.
- `SimpleClosedCurve.cut` (other; signature omitted): Use the topological collar to cut along the image, recording its boundary and gluing data.

**Mathematical tests.**

- `SimpleClosedCurve.reviewTest1` (computation; signature omitted): A horizontal circle on the oriented torus is nonseparating and represents a primitive H₁ class.
- `SimpleClosedCurve.reviewTest2` (degenerate; signature omitted): The boundary of a small disk is a separating simple closed curve with homology class zero; it is inessential, not excluded from the carrier.
- `SimpleClosedCurve.reviewTest3` (non-example; signature omitted): A figure-eight immersion is not an embedding and does not define a simple closed curve.

**Acceptance.**

- Orientation reversal and ambient isotopy have the stated effects; self-intersection excludes an immersion.

**Sources.**

- lv2020, §8.3, p. 42: LV uses oriented smooth embedded circles. The topological isotopy quotient extends this convention using the proposed compatible smoothing and collar comparison; this comparison is an explicit owner gap.

**Signature gap:** Suggested signatures — simple-closed-curve.

### Exact follow-ups for LV.5

- Supply/resolve LV-import-39 — Surface triangulation, collars and tameness (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-41 — Surface homology basis and pairing (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-44 — Fibration sequences and surface asphericity (exact interface and affected nodes are in gaps).
- Supply/resolve Topological surface classification proof interfaces (exact interface and affected nodes are in gaps).
- Supply/resolve Mapping-class prerequisites beyond smooth gluing (exact interface and affected nodes are in gaps).
- Supply/resolve Surface isotopy quotient signatures (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — surface (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — mapping-class-group (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — dehn-twist (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — point-push (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — simple-closed-curve (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.5 (exact interface and affected nodes are in gaps).
- Resolve exact supplier contracts LV-import-39, LV-import-40, LV-import-41, LV-import-42, LV-import-43, LV-import-44, LV-import-45; the stage imports name plans, not proofs.

## LV.6 — The S-unit theorem

### Reductions for the S-unit equation

**Node:** `MordellLawrenceVenkatesh:LV.6/s-unit-reductions` · lemma; implementation unchecked.

Let K be a number field, S a finite set of places containing the archimedean ones and U(K, S) := {t ∈ 𝒪_S^× : 1 − t ∈ 𝒪_S^×}. (a) If K'/K is finite and S' ⊇ the places of K' above S, then U(K, S) ⊆ U(K', S'); so finiteness of U(K', S') implies finiteness of U(K, S). In particular one may assume μ_8 ⊆ K and that S contains the places above 2. (b) Assume μ_8 ⊆ K, let m be the largest power of 2 dividing #μ(K) (so m ≥ 8), and U₁ := {t ∈ U(K, S) : t ∉ K^{×2}}. Then U(K, S) ⊆ ⋃_{0 ≤ j ≤ log₂ m} {s^{2^j} : s ∈ U₁}; hence U(K, S) is finite if U₁ is.

**Hypotheses.** K number field; S finite, containing the archimedean places.

**Construction or proof.**

1. (a) 𝒪_{K,S} ⊆ 𝒪_{K',S'} and units stay units.
2. (b) If s ∈ K^× and s^k ∈ U(K, S) for some k ≥ 1, then s ∈ U(K, S): s is integral over 𝒪_S and a unit, and 1 − s^k = ∏_{η ∈ μ_k(K̄)} (1 − ηs) is a product of S-integers of K(μ_k) that is a unit, so 1 − s is an S-unit (its inverse is integral over 𝒪_S and lies in K).
3. Let t ∈ U. If t is not an m-th power, choose j < log₂ m maximal with t = s^{2^j} for some s ∈ K; then s is not a square, so s ∈ U₁ by the previous step.
4. If t = s^m, then among s and ζs (ζ a primitive m-th root of unity) one is not a square: otherwise ζ would be a square, i.e. K would contain a primitive 2m-th root of unity, contradicting the maximality of m. Both are m-th roots of t, so the non-square one lies in U₁.

**Prerequisites.** `mathlib:Set.integer`; `mathlib:Set.unit`.

**Acceptance.**

- K = ℚ, S = {2, ∞}: U = {−1, 2, 1/2}.
- K = ℚ(ζ₈): μ(K) = μ₈, so m = 8.

**Sources.**

- lv2020, §4.1, p. 20: Reduction (a).
- lv2020, §4.1, p. 20: Reduction (b).
- lv2020, §4.1, p. 20: The m-th power case.

**Signature gap:** Named theorem interfaces — LV.6.

### The Kummer fields of non-square S-unit solutions

**Node:** `MordellLawrenceVenkatesh:LV.6/kummer-cyclic-field` · lemma; implementation unchecked.

In the setting of (b) of the reductions, assume moreover that S contains the places above 2. For t ∈ U₁: (a) the class of t in K^×/K^{×m} has order exactly m; (b) X^m − t is irreducible over K and L_t := K[X]/(X^m − t) is a cyclic extension of K of degree m, unramified at every finite place outside S; (c) the fields L_t (t ∈ U₁) fall into finitely many isomorphism classes, so U₁ = U_{1,L_1} ∪ ⋯ ∪ U_{1,L_r} with U_{1,L} := {t ∈ U₁ : L_t ≅ L}.

**Hypotheses.** μ_8 ⊆ K, m the 2-part of #μ(K); S contains the places above 2 and the archimedean places; t ∈ U₁.

**Construction or proof.**

1. (a) If t^k = a^m with k a proper divisor of m, then t ∈ a^{m/k}μ_k ⊆ K^{×2}·μ_k; μ_k consists of squares since k | m/2 and μ_m ⊆ K, contradicting t ∉ K^{×2}.
2. (b) Kummer theory with μ_m ⊆ K: for a root α of X^m − t, σ ↦ σ(α)/α embeds Gal(K(α)/K) into μ_m with image μ_d, d = [K(α) : K]; then α^d ∈ K, so t^d ∈ K^{×m}, and conversely t^k ∈ K^{×m} forces α^k ∈ K and d | k. So d equals the order of t, which is m by (a); X^m − t is irreducible, K(α) is its splitting field and Gal(K(α)/K) ≅ μ_m is cyclic.
3. Unramified outside S: at a finite place w ∉ S, t and m are w-units, so 𝒪_w[X]/(X^m − t) is standard étale (the derivative mX^{m−1} is a unit modulo X^m − t) and K_w[X]/(X^m − t) is a product of unramified extensions of K_w.
4. (c) Hermite–Minkowski: there are finitely many extensions of K of degree m unramified outside S (FaltingsFinitenessAndIsogenyTheorems R28.1).

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — LocalFieldsRamification Layer 2 (unramified extensions and Frobenius). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.6/s-unit-reductions`; `FaltingsFinitenessAndIsogenyTheorems:R28.1/hermite-minkowski-finiteness-of-extensions-unramified-outside-S`; `mathlib:isCyclic_of_isSplittingField_X_pow_sub_C`; `mathlib:autEquivZmod`; `mathlib:autEquivRootsOfUnity`; `mathlib:StandardEtalePair`; `mathlib:Polynomial.separable_X_pow_sub_C_unit`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

**Acceptance.**

- K = ℚ(ζ₈), S = {places above 2, ∞}: every L_t is a cyclic octic extension of ℚ(ζ₈) unramified outside 2.
- t = ζ₈ lies in U₁ for K = ℚ(ζ₈) (1 − ζ₈ generates the prime above 2, and ζ₈ is not a square in K), and L_t = ℚ(ζ₆₄), cyclic of degree 8 over K.

**Sources.**

- lv2020, §4.1, pp. 20–21: (a).
- lv2020, §4.1, p. 21: (c).

**Signature gap:** Named theorem interfaces — LV.6.

### An auxiliary place inert in a cyclic extension

**Node:** `MordellLawrenceVenkatesh:LV.6/inert-auxiliary-place` · lemma; implementation unchecked.

Let L/K be a cyclic extension of number fields, S a finite set of places of K and T a finite set of places. There is a finite place v ∉ S ∪ T, unramified in L, whose Frobenius generates Gal(L/K), whose residue characteristic p is odd, unramified in K and not below any place of S. For such v, L ⊗_K K_v is a field, unramified of degree [L : K] over K_v, and K_v/ℚ_p is unramified.

**Hypotheses.** L/K cyclic; S, T finite.

**Construction or proof.**

1. Apply Chebotarev (Tau Ceti Chebotarev Layer 10) to the conjugacy class of a generator σ, excluding the finitely many places in S ∪ T, above 2, above primes ramified in K and above primes lying below S.
2. The decomposition group of a place above v is generated by Frob_v = σ, hence is all of Gal(L/K); so there is one place above v, with residue degree [L : K] and ramification index 1, and L ⊗_K K_v is that completion.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev — Chebotarev Layer 10 (Dirichlet-density Chebotarev, infinitude of every Frobenius class); tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — LocalFieldsRamification Layer 2 (unramified extensions and Frobenius). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `tauceti:NumberField.artinSymbol`; `tauceti:NumberField.exists_isArithFrobAt`; `tauceti:NumberField.Chebotarev.frobeniusPrimeSet`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

**Acceptance.**

- K = ℚ(i) and L = ℚ(ζ₈), a quadratic extension of K: every prime p ≡ 5 mod 8 splits in K, and the places of K above it are inert in L because 2 is not a square modulo p.
- For m = 8 and K = ℚ(ζ₈), v has residue degree 8 in L_t.

**Sources.**

- lv2020, §4.1, p. 21: The auxiliary place.
- lv2020, §4.1, p. 21: Inertness.

**Signature gap:** Named theorem interfaces — LV.6.

### The Legendre family and its cyclic variant (LV §4.2)

**Node:** `MordellLawrenceVenkatesh:LV.6/legendre-family` · construction; implementation unchecked.

Let 𝒪 be a ring with 2 ∈ 𝒪^× and 𝒴 := Spec 𝒪[t, 1/(t(1 − t))] = ℙ¹_𝒪 ∖ {0, 1, ∞}. The Weierstrass curve E : y² = x(x − 1)(x − t) over 𝒴 has discriminant 16t²(t − 1)², a unit, so it is an elliptic curve over 𝒴 (an abelian scheme of relative dimension 1 with its principal polarization), with j = 2⁸(t² − t + 1)³/(t²(t − 1)²). For m a power of 2, put 𝒴' := Spec 𝒪[u, 1/(u(1 − u^m))] and π : 𝒴' → 𝒴, t ↦ u^m; π is finite étale of degree m, since 𝒪[t, 1/(t(1−t))][u]/(u^m − t) ≅ 𝒪[u, 1/(u(1 − u^m))] is standard étale. Let X → 𝒴' be the Legendre curve with parameter u, y² = x(x − 1)(x − u) (the pullback of E along the open immersion 𝒴' ⊆ 𝒴, u ↦ t, which is defined since u − 1 divides u^m − 1). Then X → 𝒴' → 𝒴 is an abelian-by-finite family of relative dimension 1; for 𝒪 = 𝒪_S with S ⊇ places above 2 it is a good model of its generic fibre, and for t₀ ∈ 𝒴(K) the fibre algebra is E_{t₀} = K[u]/(u^m − t₀), with X_{t₀} geometrically the disjoint union of the curves E_u, u^m = t₀.

**Hypotheses.** 2 ∈ 𝒪^×; m a power of 2.

**Construction or proof.**

1. Compute the discriminant of the Weierstrass equation; a Weierstrass curve with unit discriminant over a ring is elliptic (Mathlib) and is an abelian scheme with its canonical principal polarization.
2. π is standard étale: u^m − t is monic in u with derivative mu^{m−1}, a unit because m and u = t/u^{m−1} are.
3. The good-model conditions of LV.2 hold for abelian schemes over the smooth 𝒪_S-scheme 𝒴 (AbelianSchemesAndArithmeticModuli A4).
4. The fibre of π over t₀ is Spec K[u]/(u^m − t₀), and the fibre of X over it is the Legendre curve with parameter u.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.2/abelian-by-finite-family`; `MordellLawrenceVenkatesh:LV.2/good-model`; `AbelianSchemesAndArithmeticModuli:A1`; `AbelianSchemesAndArithmeticModuli:A2`; `AbelianSchemesAndArithmeticModuli:A4`; `mathlib:WeierstrassCurve`; `mathlib:WeierstrassCurve.IsElliptic`; `mathlib:WeierstrassCurve.j`; `mathlib:StandardEtalePair`.

**Uses.**

- MordellLawrenceVenkatesh:LV.6/legendre-monodromy: supply the elliptic family and cyclic finite étale base for the S-unit argument. The consumer is Monodromy of the Legendre family.
- MordellLawrenceVenkatesh:LV.6/variant-family-full-monodromy: supply the elliptic family and cyclic finite étale base for the S-unit argument. The consumer is Big monodromy for the cyclic variant of the Legendre family (LV Lemma 4.3).
- MordellLawrenceVenkatesh:LV.6/legendre-generic-simplicity: supply the elliptic family and cyclic finite étale base for the S-unit argument. The consumer is Generic simplicity of the Legendre curves (LV Lemma 4.4).
- MordellLawrenceVenkatesh:LV.6/s-unit-residue-disk-finite: supply the elliptic family and cyclic finite étale base for the S-unit argument. The consumer is Finiteness in a residue disk (LV Lemma 4.2).

**Planning API.**

- `legendreCurve` (constructor; signature partial): The Weierstrass curve y² = x(x − 1)(x − t) over 𝒪[t, 1/(t(1−t))].
  The actual Weierstrass curve is stated over an arbitrary ring. The relative elliptic-scheme/abelian-scheme comparison over the localized parameter ring is the missing owner interface.
- `legendreCurve.isElliptic` (instance; signature stated): Its discriminant 16t²(t − 1)² is a unit when 2 is.
- `legendreCurve.j_eq` (simp; signature stated): j = 2⁸(t² − t + 1)³/(t²(t − 1)²).
- `legendreVariant` (constructor; signature omitted): The abelian-by-finite family X → 𝒴' → 𝒴 with π(u) = u^m.
- `legendreVariant.isGoodModel` (other; signature omitted): It is a good model over 𝒪_S when S contains the places above 2.
- `legendreVariant.fibreAlgebra` (characterisation; signature omitted): E_{t₀} = K[u]/(u^m − t₀).
- `legendreVariant.analytic` (compatibility; signature omitted): Over ℂ, the total space of X over 𝒴'(ℂ) = ℂ ∖ ({0} ∪ μ_m) is the restriction of the Legendre family over ℂ ∖ {0, 1}.
- `legendreCurve.j_one_seven_two_eight` (example; signature stated): j(−1) = j(2) = j(1/2) = 1728.

**Mathematical tests.**

- `legendreCurve.reviewTest1` (computation; signature stated): The Legendre coefficients have Δ=16t²(t−1)² and j=256(t²−t+1)³/(t²(t−1)²).
- `legendreCurve.reviewTest2` (computation; signature partial): For m=2, t₀=4 over ℚ, the finite étale fibre algebra is ℚ×ℚ and the two curves are E₂ and E_{−2}.
- `legendreCurve.reviewTest3` (non-example; signature stated): At t=0 or t=1, Δ=0, so the Legendre equation does not define an elliptic fibre.

**Acceptance.**

- t = −1, 2, 1/2 (the S-units of ℚ with S = {2, ∞}) all give j = 1728, the curve y² = x³ − x up to twist.
- m = 2, t₀ = 4: E_{t₀} = K[u]/(u² − 4) ≅ K × K and X_{t₀} = E_2 ⊔ E_{−2}.

**Sources.**

- lv2020, §4.2, p. 21: The covering π.
- lv2020, §4.2, p. 21: The family over Y'.

**Planet:** Legendre family.

**Signature gap:** Suggested signatures — legendre-family.

### Monodromy of the Legendre family

**Node:** `MordellLawrenceVenkatesh:LV.6/legendre-monodromy` · theorem; implementation unchecked.

Let B = ℂ ∖ {0, 1}, λ₀ ∈ (0, 1), and let γ₀ (resp. γ₁) be the standard positively oriented loop, accessed along the real interval from λ₀, encircling 0 (resp. 1) once and no other point of {0, 1}. There are classes a, b ∈ H₁(E_{λ₀}(ℂ); ℤ) with î(a, b) = ±1 such that the monodromy of the Legendre family along γ₀ (resp. γ₁) acts on H₁(E_{λ₀}(ℂ); ℤ) as ε₀T_a² (resp. ε₁T_b²) with ε_i ∈ {±1}, where T_c(x) = x + î(x, c)c. Consequently: (a) the monodromy of γ₀² (resp. γ₁²) is the nontrivial unipotent T_a⁴ (resp. T_b⁴); (b) the algebraic monodromy group of the Legendre family is SL(H¹_B(E_{λ₀}, ℂ)) = Sp, i.e. the family has full monodromy; (c) the Zariski closure of the monodromy of any subgroup of π₁(B, λ₀) containing powers γ₀^k and γ₁^k (k ≥ 1) is also SL₂.

**Hypotheses.** λ₀ ∈ (0, 1); γ₀ and γ₁ are the standard positive generators accessed along the real intervals toward 0 and 1..

**Construction or proof.**

1. Topological model: E_λ(ℂ) is the double cover of ℙ¹(ℂ) branched at {0, 1, λ, ∞}, and the family is the configuration family of LV.5 with Σ = ℙ¹(ℂ), B = {0, 1, ∞}, S = ℂ ∖ {0, 1} (χ = −1) and 𝒵° = {y² = x(x − 1)(x − λ), y ≠ 0}; the analytic local system R¹f_*ℤ is its homology local system (Ehresmann; AbelianSchemesAndArithmeticModuli A5).
2. By LV.5, the monodromy along γ is ± the action of the lift of Push(γ), the sign coming from the deck involution, which acts on H₁ of the elliptic curve by −1.
3. Push(γ₀) = T_{c₀}^{±1} in Mod(ℂ ∖ {0, 1, λ₀}), where c₀ bounds a disk D₀ containing exactly 0 and λ₀ (Birman: the other push-off bounds a once-punctured disk).
4. The monodromy of the double cover around c₀ is trivial (two branch points), so c₀ lifts to two curves c', c'' and T_{c₀} lifts to T_{c'}T_{c''}. The preimage of D₀ is an annulus with boundary c' ⊔ c'' (Euler characteristic 2·1 − 2 = 0), exchanged by the deck involution, so [c''] = −[c'] =: −a and T_{c'}T_{c''} acts by x ↦ x + 2î(x, a)a (LV.5, Dehn twists on homology). The complement of the annulus is also an annulus, so c' is nonseparating and a is primitive.
5. Likewise γ₁ gives T_b² with b from a disk D₁ containing exactly λ₀ and 1. Taking D₀, D₁ to be thin neighbourhoods of the segments [0, λ₀] and [λ₀, 1], the core circles of the two annuli are the preimages of the segments, which meet in exactly one point, transversally (in the local coordinate w² = x − λ₀ the segments lift to the two axes); so î(a, b) = ±1.
6. (b), (c): the Zariski closure contains the closures of {T_a^{4kn}} and {T_b^{4kn}}, i.e. the root groups U_a, U_b (LV.0), which generate Sp(H₁ ⊗ ℂ) = SL₂ because î(a, b) ≠ 0 (LV Lemma 2.13 in LV.0).

**Prerequisites.** `MordellLawrenceVenkatesh:LV.6/legendre-family`; `MordellLawrenceVenkatesh:LV.5/configuration-family-monodromy`; `MordellLawrenceVenkatesh:LV.5/birman-exact-sequence`; `MordellLawrenceVenkatesh:LV.5/covering-dehn-twist-lift`; `MordellLawrenceVenkatesh:LV.5/dehn-twist-homology`; `MordellLawrenceVenkatesh:LV.5/primitive-classes-simple`; `MordellLawrenceVenkatesh:LV.0/zariski-closure-transvection-powers`; `MordellLawrenceVenkatesh:LV.0/transvection-pair-closure`; `MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group`; `AbelianSchemesAndArithmeticModuli:A5`; `ComplexComparisonPartII:C5`.

**Acceptance.**

- In a basis (a, b) with î(a, b) = 1, T_a² = [[1, −2], [0, 1]] and T_b² = [[1, 0], [2, 1]] (columns are images); these generate Sanov's free subgroup of index 2 in Γ(2), which is Zariski dense in SL₂.
- T_a²T_b² = [[−3, −2], [2, 1]] has trace −2: up to sign, the monodromy around ∞ is −1 times a nontrivial unipotent (the Legendre curve has potentially multiplicative, non-semistable reduction at ∞).

**Sources.**

- lv2020, §4.4, proof of Lemma 4.3, p. 24: LV use the classical local monodromy of the Legendre family; the node derives it from point-pushing.
- farb-margalit, §4.2, Fact 4.7, p. 103: Push of a simple loop, used for γ₀ and γ₁.

**Signature gap:** Named theorem interfaces — LV.6.

### A closed subgroup of a product of SL₂'s with surjective projections and factorwise unipotents is everything

**Node:** `MordellLawrenceVenkatesh:LV.6/closed-subgroup-with-factor-unipotents` · lemma; implementation unchecked.

Let k be an algebraically closed field of characteristic zero, V_1, …, V_r two-dimensional k-vector spaces and H ⊆ ∏_j SL(V_j) a Zariski-closed subgroup such that (i) each projection pr_j(H) is SL(V_j), and (ii) for each j, H contains an element whose j-th component is a nontrivial unipotent and whose other components are 1. Then H = ∏_j SL(V_j).

**Hypotheses.** char k = 0, k algebraically closed; (i) surjective projections; (ii) factorwise nontrivial unipotents.

**Construction or proof.**

1. N_j := H ∩ (1 × ⋯ × SL(V_j) × ⋯ × 1) is a closed subgroup of SL(V_j) normalized by pr_j(H) = SL(V_j), hence a closed normal subgroup of SL(V_j).
2. By (ii) it contains a nontrivial unipotent, which is not ±1; closed normal subgroups of SL₂ are SL₂ or contained in {±1} (ReductiveGroups Layer 6), so N_j = SL(V_j).
3. Hence H ⊇ ∏_j N_j = ∏_j SL(V_j).

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components); tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups — ReductiveGroups Layer 6 (reductive and semisimple groups, centres). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `tauceti:LinearMap.GeneralLinearGroup.IsUnipotent`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

**Acceptance.**

- The diagonal SL₂ ⊆ SL₂ × SL₂ satisfies (i) but not (ii).
- r = 1: (i) alone already gives H = SL₂.

**Sources.**

- lv2020, §4.4, proof of Lemma 4.3, p. 24: LV's appeal to a variant of the Goursat lemma; the node states the variant used.

**Signature gap:** Named theorem interfaces — LV.6.

### Big monodromy for the cyclic variant of the Legendre family (LV Lemma 4.3)

**Node:** `MordellLawrenceVenkatesh:LV.6/variant-family-full-monodromy` · theorem; implementation unchecked.

For every m ≥ 1, the family over ℂ ∖ {0, 1} whose fibre over t is ⊔_{z^m = t} E_z (the analytification of X → Y' → Y of the Legendre-variant node) has full monodromy: for t₀ ∈ ℂ ∖ {0, 1}, the Zariski closure of the monodromy on ⊕_{z^m = t₀} H¹_B(E_z, ℚ) contains ∏_z SL(H¹_B(E_z, ℂ)).

**Hypotheses.** m ≥ 1.

**Construction or proof.**

1. Full monodromy does not depend on the base point, so take t₀ ∈ (0, 1) and u₀ = t₀^{1/m} ∈ (0, 1), with roots u_j = ζ^j u₀.
2. Y' → Y (u ↦ u^m) is a connected cyclic covering, so π₁(Y', u₀) is a normal subgroup of π₁(Y, t₀) of index m whose elements lift to closed loops at every u_j and act factorwise, by Legendre monodromy along the lifts (Y' ⊆ ℂ ∖ {0, 1}).
3. Let H be the Zariski closure of the image of π₁(Y', u₀). The loop δ₀ running m times around the circle |t| = t₀ lifts at u₀ to the circle |u| = u₀, a simple loop around 0 avoiding 1; a small loop δ₁ around t = 1 (joined to t₀ along the real segment) lifts at u₀ to a simple loop around 1, and at u_j (j ≠ 0) to a loop around ζ^j joined along the ray arg u = 2πj/m, which is null-homotopic in ℂ ∖ {0, 1}. Both δ₀ and δ₁ lie in π₁(Y', u₀).
4. By the Legendre monodromy theorem (c), pr_{u₀}(H) = SL₂; and μ(δ₁²) is the nontrivial unipotent T_b⁴ in the u₀-factor and 1 elsewhere.
5. The loop once around t = 0 permutes the roots cyclically and normalizes H (π₁(Y') is normal); conjugating by its powers transports both properties to every factor.
6. The factorwise-unipotent criterion gives H = ∏ SL(H¹_B(E_{u_j}, ℂ)) ⊆ Γ.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components); tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.6/legendre-monodromy`; `MordellLawrenceVenkatesh:LV.6/closed-subgroup-with-factor-unipotents`; `MordellLawrenceVenkatesh:LV.6/legendre-family`; `MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`; `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`.

**Acceptance.**

- m = 2, t₀ = 1/4: two factors u = ±1/2, and the loop around t = 1 acts as (±T_b², 1).
- m = 1 is the Legendre monodromy theorem.

**Sources.**

- lv2020, §4.3, Lemma 4.3, p. 21: Statement of Lemma 4.3.
- lv2020, §4.4, proof of Lemma 4.3, p. 24: Transitivity.
- lv2020, §4.4, proof of Lemma 4.3, p. 24: The factorwise unipotent.

**Planet:** Full monodromy of the cyclic Legendre family.

**Signature gap:** Named theorem interfaces — LV.6.

### Generic simplicity of the Legendre curves (LV Lemma 4.4)

**Node:** `MordellLawrenceVenkatesh:LV.6/legendre-generic-simplicity` · theorem; implementation unchecked.

Let L be a number field and p > 2 a prime unramified in L. There are only finitely many z ∈ L such that z and 1 − z are units at every place of L above p and H¹_et(E_{z, L̄}, ℚ_p) (equivalently V_p(E_z)) is reducible as a G_L-representation.

**Hypotheses.** p > 2 unramified in L.

**Construction or proof.**

1. The admissible z fall into finitely many classes modulo the places above p (their residues avoid 0 and 1); fix a class with representative z₀ ∈ L. For z in the class, E_z has good reduction at every w | p (16z²(z − 1)² is a w-unit and p > 2).
2. Suppose W ⊂ H¹(E_z) is a G_L-stable line. W is pure of weight 1, finitely ramified and crystalline at the places above p. Lemma 2.10 (LV.1) with K = ℚ and v = p (friendly, as ℚ has no CM subfield and p is unramified) gives Σ_{w|p} [L_w : ℚ_p]·a_w(W) = [L : ℚ]/2 with a_w(W) ∈ {0, 1}; since Σ_{w|p} [L_w : ℚ_p] = [L : ℚ], some w has a_w(W) = 1.
3. At that w, with D_z := D_cris(H¹(E_z)|G_{L_w}) = (H¹_dR(E_z/L_w), φ_z, F¹) (LV.4), the line W^dR := D_cris(W) satisfies W^dR ⊆ F¹ (the filtration is induced), so W^dR = F¹D_z.
4. Weak admissibility of D_cris gives t_N = t_H for W^dR (= 1) and for D_z (= 1). So φ_z has slope 1 on W^dR and slope 0 on D_z/W^dR, the L_w-linear φ_z^{[L_w:ℚ_p]} has eigenvalues of different valuations, and W^dR is the unique φ_z-stable line of slope 1, ℓ(D_z).
5. The Gauss–Manin transport T_w(z) : (D_{z₀}, φ_{z₀}) ≅ (D_z, φ_z) (LV.2) carries ℓ(D_{z₀}) to ℓ(D_z) when either exists; hence the period map satisfies Φ_w(z) = T_w(z)^{-1}(F¹D_z) = ℓ₀ := ℓ(D_{z₀}), a fixed point of ℙ(D_{z₀}) (if ℓ(D_{z₀}) does not exist, no z in the class is reducible at w).
6. The Legendre family over L has full monodromy (Legendre monodromy theorem) and ℂ ∖ {0, 1} is connected, so by LV.3 the set {z ∈ Ω_w(z₀) : Φ_w(z) = ℓ₀} is finite (a point has dimension 0 < 1). Take the union over the finitely many w | p and classes.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.6/legendre-family`; `MordellLawrenceVenkatesh:LV.6/legendre-monodromy`; `MordellLawrenceVenkatesh:LV.1/hodge-weight-sum-over-places`; `MordellLawrenceVenkatesh:LV.1/friendly-place`; `MordellLawrenceVenkatesh:LV.1/abelian-variety-cohomology-properties`; `MordellLawrenceVenkatesh:LV.4/fibre-representation-crystalline`; `MordellLawrenceVenkatesh:LV.3/padic-period-map`; `MordellLawrenceVenkatesh:LV.3/padic-period-preimage-finite`; `MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-padic`; `PadicHodgeTheory:R06.2`; `WeightsInEtaleCohomology:R34.1`; `ComplexComparisonPartII:C4`.

**Acceptance.**

- L = ℚ, p = 3 and z ≡ 2 mod 3: E_z reduces to y² = x³ − x over 𝔽₃, which is supersingular (a₃ = 0); both slopes are 1/2, so no z in this class has reducible V₃(E_z).
- LV remark that much stronger results are known (Serre's open image theorem); the point is the purity-plus-period-map mechanism reused in LV.7.

**Sources.**

- lv2020, §4.3, Lemma 4.4, p. 22: Statement of Lemma 4.4.
- lv2020, §4.4, proof of Lemma 4.4, p. 24: The purity step.
- lv2020, §4.4, proof of Lemma 4.4, p. 24: The slope step.
- lv2020, §4.4, proof of Lemma 4.4, p. 24: The conclusion; LV derive nonconstancy of the period map from Torelli, the node from full monodromy.

**Planet:** Generic simplicity of Legendre curves.

**Signature gap:** Named theorem interfaces — LV.6.

### Finiteness in a residue disk (LV Lemma 4.2)

**Node:** `MordellLawrenceVenkatesh:LV.6/s-unit-residue-disk-finite` · theorem; implementation unchecked.

Assume μ_8 ⊆ K and that S contains the places above 2; let m be the 2-part of #μ(K), L a cyclic extension of K of degree m, v a finite place as in the auxiliary-place lemma (v ∉ S, Frob_v generates Gal(L/K), p = char k_v odd and unramified in K, no place of S above p), and t₀ ∈ 𝒪_S. Then {t ∈ U_{1,L} : t ≡ t₀ mod v} is finite.

**Hypotheses.** μ_8 ⊆ K; S ⊇ places above 2; v as in the auxiliary-place lemma.

**Construction or proof.**

1. We may assume t₀ ∈ U_{1,L}. Use the Legendre-variant family over 𝒪_S with y₀ = t₀ ∈ 𝒴(𝒪_S): E₀ = K[u]/(u^m − t₀) ≅ L, and since v is inert in L, E₀ ⊗ K_v = L₀ is a field of degree m over K_v; there is a single pair (y₀', w₀) over (t₀, v) and, for t in the disk, a single pair (t', w) over (t, v), with K(t') ≅ L.
2. The fibre over t' is the Legendre curve E_z over K(t'), z a root of u^m = t. For an isomorphism α : K(t') ≅ L, α(z) and 1 − α(z) are units above p (t is an S-unit and 1 − z divides 1 − t), and p is unramified in L (L/K is unramified outside S). By Lemma 4.4, outside a finite set of t (those with α(z) in the finite exceptional set, for one of the m choices of α), ρ_{t'} is simple.
3. Faltings's finiteness lemma over L (dimension 2, weight 1, unramified outside the places above S and p, integral Frobenius polynomials) leaves finitely many isomorphism classes for the semisimple ρ_{t'}; hence the pairs (K(t'), ρ_{t'}), and the local pairs (K(t')_w, ρ_{t',w}), lie in finitely many classes.
4. Apply the LV.4 finiteness criterion: the family has full monodromy (Lemma 4.3), ℂ ∖ {0, 1} is connected, [L₀ : K_v] = m ≥ 8 and c ≤ (dim_{L₀} H¹_dR)² = 4 < m = dim Z₀.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.6/legendre-generic-simplicity`; `MordellLawrenceVenkatesh:LV.6/variant-family-full-monodromy`; `MordellLawrenceVenkatesh:LV.6/legendre-family`; `MordellLawrenceVenkatesh:LV.6/kummer-cyclic-field`; `MordellLawrenceVenkatesh:LV.6/inert-auxiliary-place`; `MordellLawrenceVenkatesh:LV.4/finiteness-criterion`; `MordellLawrenceVenkatesh:LV.1/faltings-finiteness`; `MordellLawrenceVenkatesh:LV.1/abelian-variety-cohomology-properties`; `MordellLawrenceVenkatesh:LV.0/semilinear-centralizer-unramified`; `ComplexComparisonPartII:C4`.

**Acceptance.**

- K = ℚ(ζ₈), m = 8: c ≤ 4 < 8 = dim H_v.
- Without the variant (m = 1) the criterion fails, as for the Legendre family over ℚ_p (LV §1.3).

**Sources.**

- lv2020, §4.1, Lemma 4.2, p. 21: Statement of Lemma 4.2.
- lv2020, §4.3, proof of Lemma 4.2, p. 22: Reduction to a fixed class of pairs.
- lv2020, §4.3, proof of Lemma 4.2, p. 23: The centralizer bound.

**Signature gap:** Named theorem interfaces — LV.6.

### The S-unit theorem (LV Theorem 4.1)

**Node:** `MordellLawrenceVenkatesh:LV.6/s-unit-theorem` · theorem; implementation unchecked.

For a number field K and a finite set S of places containing the archimedean ones, U(K, S) := {t ∈ 𝒪_S^× : 1 − t ∈ 𝒪_S^×} is finite.

**Hypotheses.** K number field; S finite.

**Construction or proof.**

1. By the reductions, assume μ_8 ⊆ K and that S contains the places above 2; it suffices to show that U₁ is finite.
2. U₁ is the finite union of the U_{1,L} over the Kummer fields L (Hermite–Minkowski).
3. For each L choose v by the auxiliary-place lemma. 𝒴(𝒪_S) meets finitely many residue classes modulo v (k_v is finite); in each class that meets U_{1,L} choose t₀ in it and apply Lemma 4.2.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.6/s-unit-reductions`; `MordellLawrenceVenkatesh:LV.6/kummer-cyclic-field`; `MordellLawrenceVenkatesh:LV.6/inert-auxiliary-place`; `MordellLawrenceVenkatesh:LV.6/s-unit-residue-disk-finite`.

**Acceptance.**

- K = ℚ, S = {2, ∞}: U = {−1, 2, 1/2}.
- K = ℚ, S = {2, 3, ∞}: U contains −1, 2, 1/2, 3, −2, 4, −3, 9, −8, and their images under t ↦ 1 − t and t ↦ 1/t.

**Sources.**

- lv2020, §4, Theorem 4.1, p. 20: The set shown to be finite.
- lv2020, §4, p. 20: LV's framing.

**Planet:** S-unit theorem.

**Signature gap:** Named theorem interfaces — LV.6.

### Exact follow-ups for LV.6

- Supply/resolve LV-import-01 — Closures of abstract algebraic subgroups (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-03 — Normal subgroups of symplectic groups (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-06 — Continuous Mackey and semisimple image algebras (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-12 — Local de Rham characters and induction (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-28 — Spreading polarized families and good models (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-30 — Symplectic Grassmannian schemes and charts (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-31 — Dimension and transcendence-degree interfaces (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-32 — Algebraic group orbits and transporters (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-34 — Completed analytic local rings (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-39 — Surface triangulation, collars and tameness (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-41 — Surface homology basis and pairing (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-44 — Fibration sequences and surface asphericity (exact interface and affected nodes are in gaps).
- Supply/resolve Topological surface classification proof interfaces (exact interface and affected nodes are in gaps).
- Supply/resolve Mapping-class prerequisites beyond smooth gluing (exact interface and affected nodes are in gaps).
- Supply/resolve Faithful image-algebra trace criterion (exact interface and affected nodes are in gaps).
- Supply/resolve Finite-extension analytic zero theorem adapter (exact interface and affected nodes are in gaps).
- Supply/resolve Surface isotopy quotient signatures (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — semilinear-centralizer (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — symplectic-transvection (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — largest-cm-subfield (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — friendly-place (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — abelian-by-finite-family (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — good-model (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — de-rham-bundle (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — residue-disk (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — gauss-manin-transport-padic (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — gauss-manin-transport-complex (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — crystalline-frobenius-on-fibres (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — lagrangian-grassmannian (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — lagrangian-period-variety (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — algebraic-monodromy-group (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — padic-period-map (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — complex-period-map (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — surface (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — mapping-class-group (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — dehn-twist (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — point-push (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — simple-closed-curve (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — legendre-family (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.0 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.1 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.2 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.3 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.4 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.5 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.6 (exact interface and affected nodes are in gaps).
- Resolve exact supplier contracts LV-import-01, LV-import-03, LV-import-05, LV-import-06, LV-import-07, LV-import-08, LV-import-09, LV-import-10, LV-import-11, LV-import-12, LV-import-13, LV-import-14, LV-import-15, LV-import-16, LV-import-17, LV-import-18, LV-import-19, LV-import-20, LV-import-21, LV-import-22, LV-import-23, LV-import-24, LV-import-25, LV-import-26, LV-import-27, LV-import-28, LV-import-29, LV-import-30, LV-import-31, LV-import-32, LV-import-33, LV-import-34, LV-import-35, LV-import-36, LV-import-37, LV-import-38, LV-import-39, LV-import-40, LV-import-41, LV-import-42, LV-import-43, LV-import-44, LV-import-45, LV-import-46, LV-import-47, LV-import-48; the stage imports name plans, not proofs.

## LV.7 — Rational points on the base of an abelian-by-finite family

### The proportion of small Frobenius orbits (LV Definition 5.2)

**Node:** `MordellLawrenceVenkatesh:LV.7/size-v` · definition; implementation unchecked.

Let K be a number field, v a finite place and E a nonempty finite set with a continuous action of G_K that is unramified at v (the inertia groups at the places of K̄ above v act trivially). For an arithmetic Frobenius Frob_v at a place of K̄ above v, size_v(E) := #{e ∈ E : the ⟨Frob_v⟩-orbit of e has fewer than 8 elements} / #E. It does not depend on the choice of place above v or of Frobenius. For a finite étale K-scheme Z, size_v(Z) := size_v(Z(K̄)). If f : E → E' is a G_K-equivariant map all of whose fibres have the same cardinality, then size_v(E) ≤ size_v(E') (LV (5.3)).

**Hypotheses.** E finite, nonempty, G_K-action unramified at v.

**Construction or proof.**

1. Two choices of Frobenius are conjugate by some g ∈ G_K modulo inertia; g maps the small-orbit elements for one choice bijectively onto those for the other.
2. (5.3): all fibres having the same cardinality c > 0, f is surjective and #E = c·#E'. The orbit of e maps onto the orbit of f(e), so small-orbit elements of E lie over small-orbit elements of E', and #small(E) ≤ c·#small(E').

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — LocalFieldsRamification Layer 2 (unramified extensions and Frobenius). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `mathlib:IsArithFrobAt`; `tauceti:NumberField.exists_isArithFrobAt`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

**Uses.**

- MordellLawrenceVenkatesh:LV.7/generic-simplicity-sublemma: compare the proportion of points in short Frobenius orbits. The consumer is Bad points produce a Frobenius-stable subspace with large Hodge filtration (Sublemma in LV §6).
- MordellLawrenceVenkatesh:LV.7/proposition-5-3: compare the proportion of points in short Frobenius orbits. The consumer is Rational points on the base of an abelian-by-finite family (LV Proposition 5.3).
- MordellLawrenceVenkatesh:LV.11/size-bound: compare the proportion of points in short Frobenius orbits. The consumer is The size bound (LV (5.4)).

**Planning API.**

- `sizeV` (constructor; signature partial): size_v(E) ∈ ℚ for a nonempty finite G_K-set unramified at v.
  The file defines the permutation core. A continuous G_K-set unramified at v must supply the Frobenius permutation through the local-place interface.
- `sizeV_indep` (extensionality; signature partial): Independence of the place above v and of the Frobenius.
  Permutation conjugacy invariance is stated. The arithmetic Frobenius and place independence needs its conjugacy comparison.
- `sizeV_le_of_fibres` (relation; signature stated): size_v(E) ≤ size_v(E') for an equivariant map with fibres of constant cardinality.
- `sizeV_mem_Icc` (other; signature stated): 0 ≤ size_v(E) ≤ 1.
- `sizeV_scheme` (coercion; signature omitted): size_v of a finite étale K-scheme through its K̄-points.
- `sizeV_eq_places` (characterisation; signature omitted): For Z = Spec E with E finite étale and unramified at v: size_v(Z) = Σ_{[E_w : K_v] < 8} [E_w : K_v] / [E : K], the sum over the factors E_w of E ⊗_K K_v.
- `sizeV_cycle` (example; signature stated): A single k-cycle: size 1 if k < 8, else 0.

**Mathematical tests.**

- `sizeV.reviewTest1` (computation; signature stated): A single 7-cycle has size_v=1; a single 8-cycle has size_v=0.
- `sizeV.reviewTest2` (computation; signature stated): A disjoint union of one fixed point and one 8-cycle has size_v=1/9, not 1/2.
- `sizeV.reviewTest3` (compatibility; signature stated): An 8-cycle mapping to a singleton is equivariant with constant fibre size and gives 0≤1 in the monotonicity inequality.

**Acceptance.**

- E = 𝔽_{q^k}-points of a set permuted by Frobenius as a single k-cycle: size_v(E) = 1 if k < 8 and 0 otherwise.
- For E = Υ ⊆ (ℤ/N)^{2g} and E → Υ with fibres of constant size (LV.11), size_v(E) ≤ size_v(Υ).

**Sources.**

- lv2020, §5, Definition 5.2, p. 25: The numerator of (5.2).
- lv2020, §5, (5.3), p. 25: The monotonicity (5.3).

**Planet:** Proportion of small Frobenius orbits.

**Signature gap:** Suggested signatures — size-v.

### Frobenius orbits on geometric points are the places above v

**Node:** `MordellLawrenceVenkatesh:LV.7/frobenius-orbits-places` · lemma; implementation unchecked.

Let E be a finite étale K-algebra unramified at the finite place v, and fix a place v̄ of K̄ above v. The ⟨Frob_v⟩-orbits on Hom_K(E, K̄) are in bijection with the factors E_w of E ⊗_K K_v (the pairs (i, w) with E = ∏ E_i and w a place of E_i above v), the orbit of (i, w) having [E_w : K_v] elements; in particular Σ_w [E_w : K_v] = [E : K].

**Hypotheses.** E finite étale over K, unramified at v.

**Construction or proof.**

1. Completion at v̄ identifies the decomposition group D_{v̄} with G_{K_v} and Hom_K(E_i, K̄) with Hom_{K_v}(E_i ⊗ K_v, K̄_v) = ⊔_{w|v} Hom_{K_v}(E_{i,w}, K̄_v) as D_{v̄}-sets.
2. G_{K_v} acts transitively on Hom_{K_v}(E_{i,w}, K̄_v), a set with [E_{i,w} : K_v] elements; since E_{i,w}/K_v is unramified, the action factors through the unramified quotient, topologically generated by Frob_v, so the ⟨Frob_v⟩-orbits are the G_{K_v}-orbits.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — LocalFieldsRamification Layer 2 (unramified extensions and Frobenius). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.0/galois-tensor-splitting`; `mathlib:IsArithFrobAt`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

**Acceptance.**

- E = K(√a) with v inert: one orbit of size 2.
- E = K × K: two fixed points.

**Sources.**

- lv2020, §6, proof of Lemma 6.1, p. 32: LV identify the cycle structure with the local degrees [K(y')_w : K_v].
- lv2020, §6, (6.1), p. 30: The factors indexed by pairs (y', w).

**Signature gap:** Named theorem interfaces — LV.7.

### General position for tuples of Lagrangians (LV Lemma 6.4)

**Node:** `MordellLawrenceVenkatesh:LV.7/lagrangian-general-position` · lemma; implementation unchecked.

Let (V, ω) be a symplectic space of dimension 2d ≥ 2 over a field k of characteristic zero and r ≥ 5. Let E_r ⊆ LGr(V, ω)^r be the set of tuples (F_1, …, F_r) of Lagrangians (over k̄) for which some subspace 0 ≠ W ≠ V satisfies dim(F_j ∩ W) ≥ dim(W)/2 for all j. Then E_r is Zariski closed and E_r ≠ LGr(V, ω)^r; in particular dim E_r < r·d(d+1)/2.

**Hypotheses.** char k = 0; r ≥ 5.

**Construction or proof.**

1. Closedness: in Gr(V) × LGr(V, ω)^r (Gr(V) the disjoint union of the Grassmannians Gr(V, w), 0 < w < 2d) the conditions dim(F_j ∩ W) ≥ ⌈w/2⌉ are rank conditions on the tautological bundles, hence closed; E_r is the image of this closed set under the projection, which is proper because Gr(V) is projective.
2. In a symplectic basis (e_i, e_i') with ⟨e_i, e_i'⟩ = 1 take F_1 = span(e_i), F_2 = span(e_i'), F_3 = span(e_i + e_i'), F_4 = span(e_i + 2i·e_i'); these are Lagrangian and pairwise transverse (2i ≠ 1 in characteristic zero).
3. If W works for F_1, …, F_4, then W = (W ∩ F_1) ⊕ (W ∩ F_2) with both summands of dimension dim W/2, and likewise for F_3, F_4; the projections along F_1 ⊕ F_2 give isomorphisms W ∩ F_3 ≅ W ∩ F_1 and W ∩ F_3 ≅ W ∩ F_2, so Φ_{12;3} : F_1 → F_2 (e_i ↦ e_i') maps W ∩ F_1 onto W ∩ F_2, and similarly Φ_{12;4} (e_i ↦ 2i·e_i').
4. Hence W ∩ F_1 is stable under Φ_{12;4}⁻¹Φ_{12;3}, which is diagonal with the distinct eigenvalues (2i)⁻¹; so W ∩ F_1 is spanned by a subset of the e_i, W ∩ F_2 = Φ_{12;3}(W ∩ F_1), and there are finitely many candidates W_1, …, W_M.
5. For each proper nonzero W_s the set of Lagrangians F with dim(F ∩ W_s) ≥ dim(W_s)/2 is a proper closed subset of LGr(V, ω): otherwise every pair of transverse Lagrangians L, L' would split W_s as (W_s ∩ L) ⊕ (W_s ∩ L') with equal dimensions, and letting L' run over the graphs of symmetric maps into L (which can send a given nonzero vector anywhere in L) forces L ⊆ W_s and symmetrically L' ⊆ W_s, so W_s = V.
6. LGr(V, ω)(k) is Zariski dense (it contains an affine space), so some F_5 ∈ LGr(V, ω)(k) avoids these finitely many proper closed subsets; (F_1, …, F_5, F_6, …, F_r) ∉ E_r for any F_6, …, F_r.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian`; `MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian-geometry`; `MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis`; `AlgebraicModuliForArithmeticGeometry:R09.1`; `SchemeAndStackFoundations:SF.0`; `MordellLawrenceVenkatesh:LV.3/isotropic-dimension`; `MordellLawrenceVenkatesh:LV.3/lagrangian-transitivity`; `MordellLawrenceVenkatesh:LV.3/lagrangian-transverse-chart`; `MordellLawrenceVenkatesh:LV.3/arnold-chart-cover`.

**Acceptance.**

- d = 1 (lines in a plane): W is a line and the condition says W = F_j for all j, so E_r is the small diagonal, of dimension 1 < r.
- The explicit F_1, …, F_4 of LV for d = 2: span(e₁, e₂), span(e₁', e₂'), span(e₁ + e₁', e₂ + e₂'), span(e₁ + 2e₁', e₂ + 4e₂').

**Sources.**

- lv2020, §6, Lemma 6.4, p. 33: Statement (with r ≥ 8).
- lv2020, §6, proof of Lemma 6.4, p. 33: The bound r ≥ 5.
- lv2020, §6, proof of Lemma 6.4, p. 33: Closedness.
- lv2020, §6, proof of Lemma 6.4, p. 34: The last step, justified in the fifth proof step.

**Signature gap:** Named theorem interfaces — LV.7.

### Lagrangians meeting a Frobenius-stable subspace in half its dimension (LV Lemma 6.3)

**Node:** `MordellLawrenceVenkatesh:LV.7/frobenius-stable-lagrangian-avoidance` · lemma; implementation unchecked.

Let K_v be a field of characteristic zero, L_w/K_v a cyclic extension of degree r ≥ 5 with generator σ_w, (V, ω) a symplectic L_w-space of dimension 2d, and φ : V → V a bijective σ_w-semilinear map that is a similitude: ω(φx, φy) = c·σ_w(ω(x, y)) for some c ∈ K_v^×. Let H_w := LGr_{L_w}(V, ω), a K_v-variety of dimension r·d(d+1)/2. There is a Zariski-closed B_w ⊂ H_w with dim B_w < dim H_w such that every Lagrangian L_w-subspace F ∈ H_w(K_v) for which some φ-stable L_w-subspace 0 ≠ W ≠ V satisfies dim_{L_w}(F ∩ W) ≥ dim_{L_w}(W)/2 lies in B_w(K_v).

**Hypotheses.** [L_w : K_v] = r ≥ 5, Gal(L_w/K_v) = ⟨σ_w⟩; φ bijective, σ_w-semilinear, a similitude of ω.

**Construction or proof.**

1. Over K̄_v, V ⊗_{K_v} K̄_v = ⊕_{i=1}^r V_i along the embeddings τ_i = τ_1 ∘ σ_w^{−(i−1)} of L_w; the K̄_v-linear map φ ⊗ 1 maps V_i onto V_{i+1}, so ψ_i := (φ ⊗ 1)^{i−1} : V_1 ≅ V_i are similitudes.
2. By the splitting lemma (LV.3), F ↦ (ψ_i⁻¹(F_i))_i identifies H_w ⊗ K̄_v with LGr(V_1, ω_1)^r.
3. A φ-stable W gives W ⊗ K̄_v = ⊕ W_i with ψ_i⁻¹(W_i) = W_1 for all i (the cyclic identification V_r → V_1 is not used), and dim(F_i ∩ W_i) = dim_{L_w}(F ∩ W); so the image of F lies in E_r of LV Lemma 6.4.
4. Let B_w be the image of E_r under the integral surjection H_w ⊗ K̄_v → H_w; it is closed of dimension dim E_r < r·d(d+1)/2.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.7/lagrangian-general-position`; `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety-splitting`; `MordellLawrenceVenkatesh:LV.0/galois-tensor-splitting`; `MordellLawrenceVenkatesh:LV.2/crystalline-frobenius-on-fibres`; `SchemeAndStackFoundations:SF.0`.

**Acceptance.**

- For d=1 and φ^r with distinct eigenvalues, at most two φ-stable L_w-lines can be bad filtrations. The particular descended bad locus constructed in the proof can have positive dimension; it need not itself be finite.
- The hypothesis applies to φ₀^{f_v} for the crystalline Frobenius φ₀ on a factor V₀ of LV.4, with c = p^{f_v}.

**Sources.**

- lv2020, §6, Lemma 6.3, p. 33: Hypothesis (r ≥ 8 in LV; the proof needs r ≥ 5).
- lv2020, §6, Lemma 6.3, p. 33: Conclusion; W must be nonzero and proper, as in the Sublemma.
- lv2020, §6, proof of Lemma 6.3, p. 33: The identification of the factors.

**Signature gap:** Named theorem interfaces — LV.7.

### Bad points produce a Frobenius-stable subspace with large Hodge filtration (Sublemma in LV §6)

**Node:** `MordellLawrenceVenkatesh:LV.7/generic-simplicity-sublemma` · lemma; implementation unchecked.

Setting of Proposition 5.3: K is a number field with an embedding ι : K → ℂ; Y is a smooth projective geometrically connected curve over K; X → Y' →π Y is an abelian-by-finite family of relative dimension d with full monodromy (relative to ι) admitting a good model 𝒳 → 𝒴' → 𝒴 over 𝒪 = 𝒪_S with 𝒴 proper, so that Y(K) = 𝒴(𝒪); v ∉ S is a friendly place of K whose residue characteristic p is odd and lies below no place of S (so K_v/ℚ_p is unramified and Setting P of LV.3 applies at every y₀ ∈ Y(K)). Let y ∈ Y(K) with size_v(π^{-1}(y)) < 1/(d + 1) be bad: for every (y', w) over (y, v) with [K(y')_w : K_v] ≥ 8, ρ_{y'} is not simple. Then some (y', w) over (y, v) with [K(y')_w : K_v] ≥ 8 has a φ-stable K(y')_w-subspace 0 ≠ W^dR ≠ H¹_dR(X_{y'}/K(y')_w) with dim F¹W^dR ≥ dim(W^dR)/2, where F¹W^dR = W^dR ∩ F¹. Assume d ≥ 1 throughout this criterion.

**Hypotheses.** Setting of Proposition 5.3; y bad with size_v(π^{-1}(y)) < 1/(d+1); d ≥ 1; the dimension estimate and minimal positive subrepresentation argument use positive relative dimension..

**Construction or proof.**

1. For each closed point y' over y choose a nonzero subrepresentation W_{y'} ⊆ ρ_{y'} of minimal dimension, and for w | v let W^dR_{y',w} := D_cris(W_{y'}|G_{K(y')_w}) ⊆ H¹_dR(X_{y'}/K(y')_w) (LV.4), φ-stable with the induced filtration; its K(y')_w-dimension is dim W_{y'}.
2. (6.8): if [K(y')_w : K_v] ≥ 8 then ρ_{y'} is not simple; it carries a nondegenerate alternating pairing preserved up to the cyclotomic character, so dim W_{y'} ≤ d (LV.0).
3. All places of K(y') above p are good (no place of S lies above p), so W_{y'} is crystalline there, pure of weight 1 and finitely ramified; Lemma 2.10 (LV.1) at the friendly place v gives (6.9): Σ_{w|v} [K(y')_w : K_v]·a_{y',w} = [K(y') : K]/2 with a_{y',w} = dim F¹W^dR_{y',w}/dim W^dR_{y',w}.
4. Suppose a_{y',w} < 1/2, hence a_{y',w} ≤ 1/2 − 1/(2d), for all pairs of local degree ≥ 8. Summing (6.9) over y' and using a ≤ 1 for the other pairs gives (1/2)·Σ_{deg<8} deg ≥ (1/(2d))·Σ_{deg≥8} deg (LV (6.11)).
5. By the orbit–place dictionary the local degrees are the Frobenius orbit sizes on π^{-1}(y)(K̄), so d·#small ≥ #large, i.e. size_v(π^{-1}(y)) ≥ 1/(d + 1), a contradiction.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.7/size-v`; `MordellLawrenceVenkatesh:LV.7/frobenius-orbits-places`; `MordellLawrenceVenkatesh:LV.1/hodge-weight-sum-over-places`; `MordellLawrenceVenkatesh:LV.1/friendly-place`; `MordellLawrenceVenkatesh:LV.1/abelian-variety-cohomology-properties`; `MordellLawrenceVenkatesh:LV.0/minimal-subrepresentation-half`; `MordellLawrenceVenkatesh:LV.4/fibre-representation-crystalline`; `PadicHodgeTheory:R06.2`; `WeightsInEtaleCohomology:R34.1`.

**Acceptance.**

- For π=id, size_v=1, so the size hypothesis fails even when d=1. The S-unit generic-simplicity result uses a separate argument and is not a special case of this sublemma.
- If all orbits have size ≥ 8 (size_v = 0), the counting forces a_{y',w} ≥ 1/2 for some pair outright.

**Sources.**

- lv2020, §6, proof of Lemma 6.1, p. 31: Badness.
- lv2020, §6, proof of Lemma 6.1, p. 32: (6.8).
- lv2020, §6, proof of Lemma 6.1, p. 32: The counting.

**Signature gap:** Named theorem interfaces — LV.7.

### Generic simplicity along the family (LV Lemma 6.1)

**Node:** `MordellLawrenceVenkatesh:LV.7/generic-simplicity-family` · lemma; implementation unchecked.

Setting of Proposition 5.3: K is a number field with an embedding ι : K → ℂ; Y is a smooth projective geometrically connected curve over K; X → Y' →π Y is an abelian-by-finite family of relative dimension d with full monodromy (relative to ι) admitting a good model 𝒳 → 𝒴' → 𝒴 over 𝒪 = 𝒪_S with 𝒴 proper, so that Y(K) = 𝒴(𝒪); v ∉ S is a friendly place of K whose residue characteristic p is odd and lies below no place of S (so K_v/ℚ_p is unramified and Setting P of LV.3 applies at every y₀ ∈ Y(K)). Let y₀ ∈ Y(K) with size_v(π^{-1}(y₀)) < 1/(d + 1) and Ω_v = Ω_v(y₀). There is a finite set F of points y ∈ Ω_v ∩ Y(K) with size_v(π^{-1}(y)) < 1/(d + 1) such that every other such y has a pair (y', w) over (y, v) with [K(y')_w : K_v] ≥ 8 and ρ_{y'} simple. Assume d ≥ 1 throughout this criterion.

**Hypotheses.** Setting of Proposition 5.3; y₀ ∈ Y(K)*; d ≥ 1; the dimension estimate and minimal positive subrepresentation argument use positive relative dimension..

**Construction or proof.**

1. Let y be bad. The sublemma gives (y', w) of local degree ≥ 8 and W^dR; let (y₀', w₀) be the corresponding pair over (y₀, v), which has the same local degree (the transport identifies K(y')_w with L₀ = K(y₀')_{w₀}).
2. Transport W^dR by T_v(y)⁻¹ to a φ₀-stable subspace W₀ of the factor V₀ (LV.4 transport lemma); then dim(pr₀Φ_v(y) ∩ W₀) = dim F¹W^dR ≥ dim(W₀)/2. As φ₀ is σ_{L₀}-semilinear and a similitude, φ₀^{f_v} satisfies the hypotheses of Lemma 6.3 over K_v, and W₀ is φ₀^{f_v}-stable; so pr₀Φ_v(y) ∈ B_{(y₀',w₀)}.
3. Under full monodromy the closure of pr₀Φ_v(Ω_v) is H₀, of dimension > dim B_{(y₀',w₀)}; by LV.3 (finite preimages, part (c)) only finitely many y ∈ Ω_v have pr₀Φ_v(y) ∈ B_{(y₀',w₀)}.
4. Take F to be the union over the finitely many pairs (y₀', w₀) of local degree ≥ 8 (LV fix one pair; the union is what the sublemma requires).

**Prerequisites.** `MordellLawrenceVenkatesh:LV.7/generic-simplicity-sublemma`; `MordellLawrenceVenkatesh:LV.7/frobenius-stable-lagrangian-avoidance`; `MordellLawrenceVenkatesh:LV.4/fibre-filtered-phi-transport`; `MordellLawrenceVenkatesh:LV.3/padic-period-preimage-finite`; `MordellLawrenceVenkatesh:LV.3/padic-period-image-dense`; `MordellLawrenceVenkatesh:LV.2/crystalline-frobenius-on-fibres`; `ComplexComparisonPartII:C4`.

**Acceptance.**

- For π=id, the size hypothesis is never satisfied; this criterion gives no assertion about the Legendre family itself.
- If no pair over (y₀, v) has local degree ≥ 8 then size_v(π^{-1}(y₀)) = 1, so y₀ is excluded by hypothesis.

**Sources.**

- lv2020, §6, Lemma 6.1, p. 30: Statement of Lemma 6.1.
- lv2020, §6, proof of Lemma 6.1, p. 32: The choice of a pair of degree ≥ 8.

**Signature gap:** Named theorem interfaces — LV.7.

### Galois representations really vary in the family (LV Lemma 6.2)

**Node:** `MordellLawrenceVenkatesh:LV.7/representations-vary` · lemma; implementation unchecked.

Setting of Proposition 5.3: K is a number field with an embedding ι : K → ℂ; Y is a smooth projective geometrically connected curve over K; X → Y' →π Y is an abelian-by-finite family of relative dimension d with full monodromy (relative to ι) admitting a good model 𝒳 → 𝒴' → 𝒴 over 𝒪 = 𝒪_S with 𝒴 proper, so that Y(K) = 𝒴(𝒪); v ∉ S is a friendly place of K whose residue characteristic p is odd and lies below no place of S (so K_v/ℚ_p is unramified and Setting P of LV.3 applies at every y₀ ∈ Y(K)). Let y₀ ∈ Y(K) and Ω_v = Ω_v(y₀). Fix a finite extension K'_v/K_v with [K'_v : K_v] ≥ 8 and a representation ρ₀ of G_{K'_v}. Only finitely many y ∈ Ω_v ∩ Y(K) admit a pair (y', w) over (y, v) with (K(y')_w, ρ_{y',w}) ≅ (K'_v, ρ₀). Assume d ≥ 1 throughout this criterion.

**Hypotheses.** Setting of Proposition 5.3; [K'_v : K_v] ≥ 8; d ≥ 1; the dimension estimate and minimal positive subrepresentation argument use positive relative dimension..

**Construction or proof.**

1. For each of the finitely many pairs (y₀', w₀) over (y₀, v) with local degree [K'_v : K_v], apply the LV.4 finiteness criterion to the set of y whose corresponding pair realizes the class (K'_v, ρ₀) (a single class of pairs).
2. Its hypothesis holds: under full monodromy dim Z₀ = [K'_v : K_v]·d(d+1)/2 ≥ 4d(d+1) > 4d² ≥ c.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.4/finiteness-criterion`; `MordellLawrenceVenkatesh:LV.3/padic-period-image-dense`; `MordellLawrenceVenkatesh:LV.0/semilinear-centralizer-unramified`; `ComplexComparisonPartII:C4`.

**Acceptance.**

- d = 1 and [K'_v : K_v] = 8: c ≤ 4 < 8 = dim H₀.
- The conditions (i), (ii) of Lemma 6.1 are not needed for this finiteness.

**Sources.**

- lv2020, §6, Lemma 6.2, p. 31: Statement of Lemma 6.2.
- lv2020, §6, Lemma 6.2, p. 31: The conclusion.

**Signature gap:** Named theorem interfaces — LV.7.

### Rational points on the base of an abelian-by-finite family (LV Proposition 5.3)

**Node:** `MordellLawrenceVenkatesh:LV.7/proposition-5-3` · theorem; implementation unchecked.

Setting of Proposition 5.3: K is a number field with an embedding ι : K → ℂ; Y is a smooth projective geometrically connected curve over K; X → Y' →π Y is an abelian-by-finite family of relative dimension d with full monodromy (relative to ι) admitting a good model 𝒳 → 𝒴' → 𝒴 over 𝒪 = 𝒪_S with 𝒴 proper, so that Y(K) = 𝒴(𝒪); v ∉ S is a friendly place of K whose residue characteristic p is odd and lies below no place of S (so K_v/ℚ_p is unramified and Setting P of LV.3 applies at every y₀ ∈ Y(K)). Then Y(K)* := {y ∈ Y(K) : size_v(π^{-1}(y)) < 1/(d + 1)} is finite. Assume d ≥ 1 throughout this criterion.

**Hypotheses.** Setting of Proposition 5.3; d ≥ 1; the dimension estimate and minimal positive subrepresentation argument use positive relative dimension..

**Construction or proof.**

1. Y(K) = 𝒴(𝒪) meets finitely many residue disks at v; for each disk meeting Y(K)* choose y₀ ∈ Y(K)* in it. It suffices to show Ω_v(y₀) ∩ Y(K)* is finite.
2. By Lemma 6.1, outside a finite set every y ∈ Ω_v ∩ Y(K)* has a pair (y', w) with [K(y')_w : K_v] ≥ 8 and ρ_{y'} simple.
3. K(y') has degree ≤ deg π over K and is unramified outside S (𝒴' → 𝒴 is finite étale over 𝒪_S), so it lies in finitely many isomorphism classes (Hermite–Minkowski). For each such field, the simple representations ρ_{y'} (dimension 2d, unramified outside the places above S and p, pure of weight 1 with integral Frobenius polynomials) lie in finitely many classes (Faltings's lemma, LV.1). So the pairs (K(y'), ρ_{y'}), and the local pairs (K(y')_w, ρ_{y',w}) with w | v, lie in finitely many classes.
4. Lemma 6.2 applied to each of these local classes of degree ≥ 8 leaves finitely many y.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.7/generic-simplicity-family`; `MordellLawrenceVenkatesh:LV.7/representations-vary`; `MordellLawrenceVenkatesh:LV.7/size-v`; `MordellLawrenceVenkatesh:LV.1/faltings-finiteness`; `MordellLawrenceVenkatesh:LV.1/abelian-variety-cohomology-properties`; `MordellLawrenceVenkatesh:LV.2/good-model`; `MordellLawrenceVenkatesh:LV.2/residue-disk`; `FaltingsFinitenessAndIsogenyTheorems:R28.1/hermite-minkowski-finiteness-of-extensions-unramified-outside-S`; `NeronModelsAndSemistableAbelianVarieties:R11.5`.

**Acceptance.**

- LV.11 applies the proposition to the Kodaira–Parshin family, for which size_v(π^{-1}(y)) < 1/(d_q + 1) for all y ∈ Y(K), so Y(K)* = Y(K).
- For π = id, size_v(π^{-1}(y)) = 1 for all y and the proposition is empty, which is why LV pass to abelian-by-finite families.

**Sources.**

- lv2020, §5, Proposition 5.3, p. 26: Hypotheses of Proposition 5.3.
- lv2020, §5, Proposition 5.3, p. 26: LV require v ∉ S friendly; the §3 set-up used in §6 also requires p > 2 and no place of S above p, stated explicitly here.
- lv2020, §6, p. 31: The finiteness of the fields.

**Planet:** Finiteness for abelian-by-finite families.

**Signature gap:** Named theorem interfaces — LV.7.

### Exact follow-ups for LV.7

- Supply/resolve LV-import-01 — Closures of abstract algebraic subgroups (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-06 — Continuous Mackey and semisimple image algebras (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-12 — Local de Rham characters and induction (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-28 — Spreading polarized families and good models (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-30 — Symplectic Grassmannian schemes and charts (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-31 — Dimension and transcendence-degree interfaces (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-32 — Algebraic group orbits and transporters (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-34 — Completed analytic local rings (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-49 — Finite étale geometric points at a place (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-50 — Componentwise rank in stable Grassmannians (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-51 — Dimensions under finite morphisms (exact interface and affected nodes are in gaps).
- Supply/resolve Faithful image-algebra trace criterion (exact interface and affected nodes are in gaps).
- Supply/resolve Finite-extension analytic zero theorem adapter (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — semilinear-centralizer (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — largest-cm-subfield (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — friendly-place (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — abelian-by-finite-family (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — good-model (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — de-rham-bundle (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — residue-disk (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — gauss-manin-transport-padic (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — gauss-manin-transport-complex (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — crystalline-frobenius-on-fibres (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — lagrangian-grassmannian (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — lagrangian-period-variety (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — algebraic-monodromy-group (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — padic-period-map (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — complex-period-map (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — size-v (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.0 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.1 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.2 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.3 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.4 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.7 (exact interface and affected nodes are in gaps).
- Resolve exact supplier contracts LV-import-01, LV-import-05, LV-import-06, LV-import-07, LV-import-08, LV-import-09, LV-import-10, LV-import-11, LV-import-12, LV-import-13, LV-import-14, LV-import-15, LV-import-16, LV-import-17, LV-import-18, LV-import-19, LV-import-20, LV-import-21, LV-import-22, LV-import-23, LV-import-24, LV-import-25, LV-import-26, LV-import-27, LV-import-28, LV-import-29, LV-import-30, LV-import-31, LV-import-32, LV-import-33, LV-import-34, LV-import-35, LV-import-36, LV-import-37, LV-import-38, LV-import-48, LV-import-49, LV-import-50, LV-import-51; the stage imports name plans, not proofs.

## LV.8 — Hurwitz spaces of singly ramified covers and the Kodaira–Parshin family

### The complex points of a curve form a closed surface of the same genus

**Node:** `MordellLawrenceVenkatesh:LV.8/curve-topological-genus` · lemma; implementation unchecked.

Let Y be a smooth projective geometrically connected curve of genus g over a subfield K ⊆ ℂ. Then Y(ℂ) is a connected closed orientable surface of genus g; for y ∈ Y(ℂ), π₁(Y(ℂ) ∖ {y}) is free of rank 2g with the peripheral class as in LV.5, and H₁(Y(ℂ); ℤ) ≅ ℤ^{2g}.

**Hypotheses.** Y smooth projective geometrically connected of genus g; K ⊆ ℂ.

**Construction or proof.**

1. Y(ℂ) is a compact Riemann surface, hence a closed orientable surface, and it is connected (ComplexComparisonPartII C4).
2. By the algebraic de Rham–Betti comparison, dim_ℂ H¹(Y(ℂ), ℂ) = dim H¹_dR(Y/K) = dim H⁰(Y, Ω¹) + dim H¹(Y, 𝒪) = 2g (Hodge exact sequence, Serre duality and the definition of the genus).
3. The classification of surfaces gives the topological type; the statements on π₁ are those of the configuration-fibration node of LV.5.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus — AlgebraicCurves Layer 3 (divisors and the genus). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.5/surface-classification`; `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence`; `ComplexComparisonPartII:C4`; `ComplexComparisonPartII:C5`; `SchemeAndStackFoundations:SF.3`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`; `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`.

**Acceptance.**

- An elliptic curve: Y(ℂ) is a torus.
- A smooth plane quartic: a closed surface of genus 3.

**Sources.**

- lv2020, §5, p. 26: The topological input used through the comparison with étale fundamental groups.

**Signature gap:** Named theorem interfaces — LV.8.

### Surjections nontrivial on a peripheral class and their symmetries (LV Lemma 7.4, group part)

**Node:** `MordellLawrenceVenkatesh:LV.8/singly-ramified-surjections` · definition; implementation unchecked.

Let Γ be a group (or a profinite group, with continuous homomorphisms), G a finite group with trivial centre and c a set of elements of Γ closed under conjugation. S(Γ, c, G) is the set of surjective homomorphisms φ : Γ → G with φ(γ) ≠ 1 for γ ∈ c. It carries commuting actions of Γ, γ·φ := φ ∘ Ad(γ)⁻¹, and of G, φ·h := Ad(h⁻¹) ∘ φ; G acts freely, and S(Γ, c, G)/G is the set of G-conjugacy classes of such surjections, on which Γ acts trivially. The stabilizer of φ in Γ × G^op is {(γ, h) : h⁻¹ = φ(γ)}, and φ is determined by its stabilizer.

**Hypotheses.** G finite with trivial centre; c conjugation-stable.

**Construction or proof.**

1. γ·φ = Ad(φ(γ))⁻¹ ∘ φ, so the Γ-action preserves G-orbits and commutes with the G-action.
2. φ·h = φ means Ad(h⁻¹) is trivial on the image G, so h is central, hence h = 1.
3. (γ, h) fixes φ iff Ad(φ(γ)h)⁻¹ ∘ φ = φ, iff φ(γ)h is central (φ is surjective), i.e. h = φ(γ)⁻¹; so φ is recovered from its stabilizer as the map sending γ to the inverse of its partner h.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.0/affine-group-centralizer`; `MordellLawrenceVenkatesh:LV.0/commutator-product-map`.

**Uses.**

- MordellLawrenceVenkatesh:LV.8/surjection-action-extension: construct and descend a finite cover with a commuting free G-action. The consumer is Unique extension of the action to an overgroup.

**Planning API.**

- `singlyRamifiedSurjections` (constructor; signature partial): S(Γ, c, G) as a set of (continuous) surjective homomorphisms nontrivial on c.
  The abstract-group subtype is stated. The profinite variant requires continuous homomorphisms and the finite-discrete target adapter.
- `singlyRamifiedSurjections.actLeft` (data; signature stated): The Γ-action γ·φ = φ ∘ Ad(γ)⁻¹.
- `singlyRamifiedSurjections.actRight` (data; signature stated): The G-action φ·h = Ad(h⁻¹) ∘ φ, free when Z(G) = 1.
- `singlyRamifiedSurjections.quotient` (data; signature stated): S(Γ, c, G)/G, the conjugacy classes, with trivial Γ-action.
- `singlyRamifiedSurjections.stabilizer_eq` (characterisation; signature stated): Stab_{Γ × G^op}(φ) = {(γ, φ(γ)⁻¹)}.
- `singlyRamifiedSurjections.comap` (functoriality; signature partial): For a surjection Γ → Γ̄ through which the Γ-action factors, S(Γ̄, c̄, G) = S(Γ, c, G).
  The equivalence is stated with the exact kernel-annihilation hypothesis. Derive it from factorization of the Γ-action using centrelessness; add the continuous quotient adapter.
- `singlyRamifiedSurjections.aff3` (example; signature stated): The Aff(3) count 810/135.

**Mathematical tests.**

- `singlyRamifiedSurjections.reviewTest1` (computation; signature stated): For Γ free of rank 4, c its product-of-commutators peripheral class and G=Aff(3), |S|=810 and |S/G|=135.
- `singlyRamifiedSurjections.reviewTest2` (degenerate; signature stated): For c containing the identity, S is empty.
- `singlyRamifiedSurjections.reviewTest3` (non-example; signature stated): If the target has nontrivial centre, its conjugation action on surjections is not free; that case is excluded from the free-action conclusion.

**Acceptance.**

- G = S₃ = Aff(3), Γ free on x₁, x₁', x₂, x₂' and c the conjugacy class of [x₁, x₁'][x₂, x₂']: #S(Γ, c, G) = 810 and #S/G = 135 (LV Lemma 2.11 in LV.0).
- If G had a nontrivial centre Z, the G-action would not be free (Z acts trivially).

**Sources.**

- lv2020, §7.3, proof of Lemma 7.4, p. 38: The set-up.
- lv2020, §7.3, proof of Lemma 7.4, p. 38: The actions.

**Signature gap:** Suggested signatures — singly-ramified-surjections.

### Unique extension of the action to an overgroup

**Node:** `MordellLawrenceVenkatesh:LV.8/surjection-action-extension` · lemma; implementation unchecked.

In the setting of the node on singly ramified surjections, let Γ̃ ⊇ Γ̄ be a group containing a normal subgroup Γ̄ through which the Γ-action on S = S(Γ, c, G) factors (via a surjection Γ → Γ̄ with image c̄ of c), and suppose conjugation by Γ̃ preserves c̄. Then every φ ∈ S factors through Γ̄, and γ̃·φ := φ ∘ Ad(γ̃)⁻¹|_{Γ̄} defines an action of Γ̃ on S commuting with G and extending the Γ̄-action. It is the only such action: any action of Γ̃ on S commuting with G and extending the Γ̄-action is given by this formula.

**Hypotheses.** Γ̄ ⊴ Γ̃; conjugation by Γ̃ preserves c̄; Γ acts on S through Γ̄.

**Construction or proof.**

1. If n ∈ ker(Γ → Γ̄), then n acts trivially: Ad(φ(n))⁻¹ ∘ φ = φ, so φ(n) is central, hence trivial; so φ factors through Γ̄.
2. The formula is an action commuting with G, and it preserves surjectivity and nontriviality on c̄ because Ad(γ̃) preserves Γ̄ and c̄.
3. Uniqueness: for an action ⋆ commuting with G and extending the Γ̄-action, the stabilizer of γ̃ ⋆ φ in Γ̄ × G^op is the conjugate by γ̃ of the stabilizer of φ (since Γ̄ is normal and the actions commute); a surjection is determined by its stabilizer, and φ ∘ Ad(γ̃)⁻¹ has that stabilizer.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.8/singly-ramified-surjections`.

**Acceptance.**

- Γ̃ = Γ̄ ⋊ ℤ with ℤ acting by an automorphism preserving c̄: the extended action is precomposition with the inverse automorphism.
- Profinite version: for Γ̄ the geometric and Γ̃ the arithmetic étale fundamental group of a punctured curve over K, with c̄ the inertia generators at the puncture (a set stable under the cyclotomic twist σ(ι) = ι^{χ(σ)}).

**Sources.**

- lv2020, §7.3, proof of Lemma 7.4, p. 38: The statement.
- lv2020, §7.3, proof of Lemma 7.4, p. 38: The uniqueness argument.

**Signature gap:** Named theorem interfaces — LV.8.

### The complex Hurwitz space of G-covers branched at one point (LV §7.3)

**Node:** `MordellLawrenceVenkatesh:LV.8/hurwitz-cover-complex` · construction; implementation unchecked.

Y is a smooth projective geometrically connected curve of genus g ≥ 2 over a number field K ⊂ ℂ, and G is a finite group with trivial centre. Fix y₀ ≠ y₁ in Y(ℂ), Γ := π₁(Y(ℂ) ∖ {y₀}, y₁), c the conjugacy class of a small loop around y₀, and Γ̃ := π₁(F(Y(ℂ)), (y₁, y₀)) for the configuration space F(Y(ℂ)) = Y(ℂ)² ∖ Δ. The Γ̃ × G-set S(Γ, c, G) (extension lemma, with Γ ⊴ Γ̃ by LV.5) defines a covering Z° → F(Y(ℂ)) with free G-action, whose quotient Z°/G is the pullback along (y, y') ↦ y' of a finite covering e : Y' → Y(ℂ) with fibres S(y) := S(π₁(Y(ℂ) ∖ {y}), c_y, G)/G. So Z° → Y' × Y(ℂ) ∖ Γ_e (Γ_e the graph of e) is a G-torsor. By Riemann existence Y' is a smooth projective curve and Z° is algebraic; Z := the normalization of Y' × Y in Z° is a smooth projective surface with a G-action and a finite morphism f : Z → Y' × Y, and the composite Z → Y' is a smooth proper relative curve whose fibre Z_{y'} → Y over y' is the connected G-covering classified by y' ∈ S(e(y')), branched exactly at e(y'); near f⁻¹(Γ_e), f is (z, w) ↦ (z, wⁿ) in suitable local coordinates. The finite étale parameter scheme Y′ may be disconnected (or empty for some G); it is not required to be a geometrically connected curve. Its individual relative curve fibres are connected.

**Hypotheses.** Y is a smooth projective geometrically connected curve of genus g ≥ 2 over a number field K ⊂ ℂ, and G is a finite group with trivial centre.; y₀ ≠ y₁.

**Construction or proof.**

1. The Γ̃-action on S(Γ, c, G) exists by the extension lemma (Γ̄ = Γ is normal in Γ̃ and Γ̃ preserves c, LV.5); covering-space theory gives Z° with fibre S at (y₁, y₀) and G acting freely.
2. Γ acts trivially on S/G, so the Γ̃-action on S/G factors through π₁(Y(ℂ), y₀) (LV.5 exact sequence), and Z°/G is the pullback of the covering e with fibre S/G.
3. Riemann existence (SGA 1 XII 5.1): finite étale coverings of the analytifications of Y and of Y' × Y ∖ Γ_e are algebraic; Y' is proper because it is finite over Y.
4. Local structure: in coordinates (z, u) on Y' × Y near Γ_e with Γ_e = {u = ẽ(z)} (e is étale), put w := u − ẽ(z); over the punctured polydisk the G-torsor is a disjoint union of copies of (z, w') ↦ (z, w'ⁿ), where n is the order of φ(c), and its normalization over the polydisk is the same map on the full polydisk, smooth over z.
5. The normalization of Y' × Y in Z° analytifies to the normalization of the analytic space (ComplexComparisonPartII C0/C4), which is the space just described; so Z → Y' is smooth and proper with the stated fibres.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.8/surjection-action-extension`; `MordellLawrenceVenkatesh:LV.8/curve-topological-genus`; `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence`; `ComplexComparisonPartII:C0`; `ComplexComparisonPartII:C2`; `ComplexComparisonPartII:C4`; `InverseGaloisAndArithmeticFundamentalGroups:IG.3`; `tauceti:TauCeti.CoveringSpace.monodromyEquivalence`; `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`; `mathlib:CommAlgCat.FiniteEtale`; `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`.

**Uses.**

- MordellLawrenceVenkatesh:LV.8/hurwitz-descent: algebraize the configuration-space covering before descent. The consumer is Descent of the Hurwitz covering to K (LV Lemma 7.4).
- MordellLawrenceVenkatesh:LV.8/hurwitz-space: algebraize the configuration-space covering before descent. The consumer is Hurwitz spaces of G-covers branched at one point (LV Proposition 7.1).
- MordellLawrenceVenkatesh:LV.10/kodaira-parshin-full-monodromy: algebraize the configuration-space covering before descent. The consumer is The Kodaira–Parshin family has full monodromy (LV §8.2.3).

**Planning API.**

- `hurwitzComplex` (constructor; signature omitted): The complex curve Y' with e : Y' → Y and the G-covering Z → Y' × Y.
- `hurwitzComplex.fibre` (equivalence; signature omitted): e⁻¹(y) ≃ S(y) naturally in y.
- `hurwitzComplex.torsor` (other; signature omitted): Z → Y' × Y is a G-torsor off the graph Γ_e.
- `hurwitzComplex.localForm` (characterisation; signature omitted): Near Γ_e, Z → Y' × Y is (z, w) ↦ (z, wⁿ).
- `hurwitzComplex.relativeCurve` (other; signature omitted): Z → Y' is smooth and proper, with fibre Z_{y'} the G-cover branched at e(y').
- `hurwitzComplex.configuration` (compatibility; signature omitted): Z° is the covering of the configuration space attached to S(Γ, c, G); its monodromy is described by LV.5.
- `hurwitzComplex.aff3` (example; signature omitted): Degree 135 for Aff(3) and g = 2.

**Mathematical tests.**

- `hurwitzComplex.reviewTest1` (computation; signature omitted): For g=2 and G=Aff(3), Y′→Y has degree 135.
- `hurwitzComplex.reviewTest2` (degenerate; signature omitted): For G=1 (centre-free), S is empty and Y′ is empty; no branched cover is manufactured.
- `hurwitzComplex.reviewTest3` (compatibility; signature omitted): Off the graph of Y′→Y, the constructed map is a G-torsor; at the graph its local model is (z,w)↦(z,w^n) with n>1 for the nontrivial peripheral image.

**Acceptance.**

- G = Aff(3) = S₃, g = 2: e : Y' → Y has degree 135.
- For G abelian the construction does not apply (nontrivial centre), and indeed abelian covers cannot be branched at a single point (the peripheral class is a product of commutators).

**Sources.**

- lv2020, §7.3, p. 36: The fibres of e.
- lv2020, §7.3, p. 37: Local structure.
- sga1, Exposé XII, Théorème 5.1, p. 251: Riemann existence: finite étale coverings of X^an are algebraic.

**Planet:** Hurwitz cover.

**Signature gap:** Suggested signatures — hurwitz-cover-complex.

### Descent of the Hurwitz covering to K (LV Lemma 7.4)

**Node:** `MordellLawrenceVenkatesh:LV.8/hurwitz-descent` · lemma; implementation unchecked.

Y is a smooth projective geometrically connected curve of genus g ≥ 2 over a number field K ⊂ ℂ, and G is a finite group with trivial centre. Let Z° → (Y² ∖ Δ)_ℂ be the G-covering of the complex Hurwitz-space node. (1) It extends uniquely, with its G-action, to a finite étale G-covering Z°_K → (Y² ∖ Δ)_K. (2) For y₀ ∈ Y(K), the set S(y₀), defined with the geometric étale fundamental group of Y_{K̄} ∖ {y₀} and its G_K-action through the outer action, is G_K-equivariantly identified with the fibre over y₀ of the covering Y'_K of (3). (3) Z°_K/G extends uniquely to a finite étale covering of Y_K × Y_K of the form Y'_K × Y_K → Y_K × Y_K, for a finite étale covering Y'_K → Y_K with (Y'_K)_ℂ = Y'.

**Hypotheses.** Y is a smooth projective geometrically connected curve of genus g ≥ 2 over a number field K ⊂ ℂ, and G is a finite group with trivial centre..

**Construction or proof.**

1. Étale fundamental groups: Γ̄ := image of π₁^et(Y_{K̄} ∖ {y₀}, y₁) in Γ̃^geom := π₁^et((Y² ∖ Δ)_{K̄}, (y₁, y₀)), which is the kernel of Γ̃^geom → π₁^et(Y_{K̄}, y₀): the étale sequence is the profinite completion of the topological one (Riemann existence and invariance of π₁ under K̄ ⊆ ℂ) and profinite completion is right exact. Only this middle exactness is used; injectivity on the left is not needed.
2. The Γ̃^geom-action on the fibre S of Z° (a finite continuous set) restricts on Γ̄ to the conjugation action, so by the extension lemma every φ factors through Γ̄ and the Γ̃^geom-action is given by the conjugation formula.
3. Γ̄ is normal in the arithmetic group Γ̃ := π₁^et((Y² ∖ Δ)_K, (y₁, y₀)) (it is the intersection of Γ̃^geom with the kernel to π₁^et(Y_K)), and conjugation by Γ̃ preserves the set of inertia generators at y₀ up to the cyclotomic character, hence preserves 'nontrivial on c'. The conjugation formula extends the action to Γ̃ × G, uniquely; by the Galois-category description of finite étale coverings (InverseGalois IG.0/IG.1) this is (1).
4. (3): Γ acts trivially on S/G, so the Γ̃-action on S/G factors through π₁^et(Y_K, y₀), which gives Y'_K; uniqueness holds because finite étale coverings are determined by their Γ̃-sets.
5. (2): restrict Z°_K/G to the K-subvariety (Y ∖ {y₀}) × {y₀}; it is the constant covering with fibre Y'_{K,y₀}, on which π₁^et((Y ∖ {y₀})_K) acts through G_K. The same restriction of Z°_K has fibre S with the conjugation action (extension lemma), whose quotient by G is S(y₀) with the outer G_K-action. No K-rational point y₁ is needed.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.8/surjection-action-extension`; `MordellLawrenceVenkatesh:LV.8/hurwitz-cover-complex`; `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence`; `InverseGaloisAndArithmeticFundamentalGroups:IG.0`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `InverseGaloisAndArithmeticFundamentalGroups:IG.3`; `mathlib:CategoryTheory.PreGaloisCategory.IsFundamentalGroup`; `tauceti:TauCeti.FiniteCoveringSpace.instProfiniteCompletionIsFundamentalGroup`.

**Acceptance.**

- If Y(K) = {y₀}, (2) still holds: the G_K-action on S(y₀) is defined through the outer action.
- For G = Aff(q) and y₀ ∈ Y(K), the fibre map (5.5) of this layer is a G_K-equivariant map from S(y₀) to H¹(Y_{K̄}, ℤ/(q − 1)).

**Sources.**

- lv2020, §7.3, Lemma 7.4, p. 37: (1).
- lv2020, §7.3, proof of Lemma 7.4, p. 38: LV cite exactness including injectivity; the node uses only middle exactness.
- lv2020, §7.3, proof of Lemma 7.4, p. 39: (3).

**Signature gap:** Named theorem interfaces — LV.8.

### Hurwitz spaces of G-covers branched at one point (LV Proposition 7.1)

**Node:** `MordellLawrenceVenkatesh:LV.8/hurwitz-space` · theorem; implementation unchecked.

Y is a smooth projective geometrically connected curve of genus g ≥ 2 over a number field K ⊂ ℂ, and G is a finite group with trivial centre. There are a finite étale morphism π : Y' → Y of K-curves and a smooth proper relative curve Z → Y' with a morphism Z → Y' × Y of relative curves over Y' and a G-action on Z over Y' × Y such that: (i) for y ∈ Y(K̄) there is a bijection between π⁻¹(y) and the set of G-conjugacy classes of surjections π₁^geom(Y ∖ {y}) → G nontrivial on a loop around y, G_K-equivariant when y ∈ Y(K); (ii) Z → Y' × Y is a G-torsor away from the graph of π, and for y' ∈ Y'(K̄) the fibre Z_{y'} → Y is the connected G-covering classified by y', ramified exactly at π(y'). The finite étale parameter scheme Y′ may be disconnected (or empty for some G); it is not required to be a geometrically connected curve. Its individual relative curve fibres are connected.

**Hypotheses.** Y is a smooth projective geometrically connected curve of genus g ≥ 2 over a number field K ⊂ ℂ, and G is a finite group with trivial centre..

**Construction or proof.**

1. Take Y' := Y'_K from the descent lemma and Z := the normalization of Y' × Y in Z°_K.
2. Normalization commutes with the base change K → ℂ in characteristic zero (normality is preserved by separable field extensions), so Z_ℂ is the complex Z of the analytic construction; smoothness and properness of Z → Y' and the fibre description descend from ℂ.
3. (i) is the descent lemma (2) together with the analytic identification of fibres; (ii) holds over ℂ and hence over K.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.8/hurwitz-descent`; `MordellLawrenceVenkatesh:LV.8/hurwitz-cover-complex`; `SchemeAndStackFoundations:SF.0`; `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`.

**Acceptance.**

- G = Aff(3), g = 2: π has degree 135.
- The fibres of Z → Y' have genus 1 + |G|(g − 1) + (|G| − |G|/n)/2 by Riemann–Hurwitz, n the order of the monodromy at the branch point.

**Sources.**

- lv2020, §7.1, Proposition 7.1, p. 34: Hypotheses.
- lv2020, §7.1, Proposition 7.1, p. 35: Galois equivariance in (i).
- lv2020, §7.1, Proposition 7.1, p. 35: (ii).
- lv2020, §7.3, p. 37: The normalization step.

**Planet:** Hurwitz spaces of singly branched covers.

**Signature gap:** Named theorem interfaces — LV.8.

### The idempotents e, e′ and e″ of ℚ[Aff(q)]

**Node:** `MordellLawrenceVenkatesh:LV.8/affine-group-idempotents` · lemma; implementation unchecked.

For a prime q ≥ 3, G = Aff(q) and H = H_q the stabilizer of 0, let e_H := (1/#H) Σ_{h∈H} h and e_G := (1/#G) Σ_{g∈G} g in ℚ[G], e := e_H − e_G, e' := 1 − e and e'' := #G·e' ∈ ℤ[G]. Then e_H, e_G, e, e' are idempotents, e_G e_H = e_H e_G = e_G, and all four are fixed by the anti-involution g ↦ g⁻¹. For every ℚ[G]-module M: e·M = M^H ∩ ker(e_G), which is a complement of M^G in M^H, and ker(e'' : M → M) = e·M.

**Hypotheses.** q ≥ 3 prime.

**Construction or proof.**

1. e_H and e_G are the averaging idempotents of the subgroups H and G, and e_G e_H = e_H e_G = e_G because G ⊇ H.
2. (e_H − e_G)² = e_H − 2e_G + e_G = e_H − e_G; e' is the complementary idempotent.
3. e'' = #G − (#G/#H)Σ_{h∈H} h + Σ_{g∈G} g has integer coefficients.
4. e·M ⊆ M^H ∩ ker e_G, and conversely x in the intersection satisfies e·x = x; ker e'' = ker e' = e·M.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.0/affine-group`.

**Acceptance.**

- q = 3: G = S₃, H = ⟨(1 2)⟩; on the permutation module ℚ³, e projects onto the 1-dimensional complement of the constants in (ℚ³)^H.
- On the regular representation, dim e·ℚ[G] = #(G/H) − 1 = q − 1.

**Sources.**

- lv2020, §7.2, p. 36: The idempotent construction precedes this sentence.

**Signature gap:** Named theorem interfaces — LV.8.

### The reduced relative Prym of a family of Aff(q)-covers

**Node:** `MordellLawrenceVenkatesh:LV.8/reduced-prym` · construction; implementation unchecked.

Let q ≥ 3 be prime, B a reduced scheme of finite type over a field of characteristic zero and Z → B a smooth proper relative curve with geometrically connected fibres and an action of G = Aff(q) over B. Let P := Pic⁰_{Z/B}, an abelian scheme with its canonical principal polarization, on which G acts (by pushforward; the idempotents are invariant under g ↦ g⁻¹, so the choice does not matter), and e'' ∈ End(P). If the dimension of ker(e''_b) is constant in b ∈ B, the reduced Prym is X := (ker e'')°, the relative identity component, an abelian subscheme of P with the restricted polarization; its fibre at b is (ker e''_b)°.

**Hypotheses.** G = Aff(q) acting on the relative curve Z/B; dim ker(e''_b) constant.

**Construction or proof.**

1. Relative Picard scheme of a smooth proper curve with geometrically connected fibres: Pic⁰_{Z/B} is an abelian scheme with principal polarization (JacobianChallenge Layer D, AlgebraicModuli A0-extension, AbelianSchemes A2).
2. Functoriality gives the G-action and e'' ∈ ℤ[G] → End(P).
3. In characteristic zero with constant fibre dimension, the relative identity component of the proper group scheme ker e'' is an abelian subscheme (EGA IV 15.6.4; AbelianSchemes A1), compatible with base change; the polarization restricts.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme — JacobianChallenge Layer D (relative Picard functor and Jacobian scheme). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.8/affine-group-idempotents`; `AlgebraicModuliForArithmeticGeometry:A0-extension`; `AbelianSchemesAndArithmeticModuli:A1`; `AbelianSchemesAndArithmeticModuli:A2`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`.

**Uses.**

- MordellLawrenceVenkatesh:LV.8/reduced-prym-homology: extract the degree-q Prym summand of the relative Jacobian. The consumer is Homology of the reduced Prym is the primitive homology of the degree-q cover.
- MordellLawrenceVenkatesh:LV.8/kodaira-parshin-family: extract the degree-q Prym summand of the relative Jacobian. The consumer is The Kodaira–Parshin family (LV Definitions 7.2–7.3).

**Planning API.**

- `reducedPrym` (constructor; signature omitted): X := (ker e'')° ⊆ Pic⁰_{Z/B} for a relative curve with Aff(q)-action and constant kernel dimension.
- `reducedPrym.isAbelianScheme` (instance; signature omitted): X is an abelian scheme over B.
- `reducedPrym.polarization` (data; signature omitted): The restriction of the principal polarization of Pic⁰.
- `reducedPrym.fibre` (compatibility; signature omitted): X_b = (ker e''_b)° for every point b.
- `reducedPrym.baseChange` (functoriality; signature omitted): Formation of X commutes with base change on B.
- `reducedPrym.dim` (other; signature omitted): The relative dimension of X over a base whose complex fibres are singly ramified Aff(q)-covers of a genus-g curve is (2g − 1)(q − 1)/2.
- `reducedPrym.example` (example; signature omitted): q = 3, g = 2: relative dimension 3.

**Mathematical tests.**

- `reducedPrym.reviewTest1` (computation; signature omitted): For singly branched Aff(3)-covers of a genus-two curve, the reduced Prym has dimension 3.
- `reducedPrym.reviewTest2` (degenerate; signature omitted): If G acts trivially on Pic⁰, e=e_H−e_G=0, so e′′=|G| and the connected kernel is the zero abelian scheme.
- `reducedPrym.reviewTest3` (compatibility; signature omitted): After base change to a geometric point b, the reduced Prym is (ker e′′_b)°, with the polarization restricted from Pic⁰; the polarization is not automatically principal.

**Acceptance.**

- If Z_b → Z_b/G has genus-0 quotient the Prym has dimension given by Riemann–Hurwitz for Z_b/H.
- For the Kodaira–Parshin family the fibre dimension is constant, equal to (2g − 1)(q − 1)/2 (reduced-Prym homology lemma).

**Sources.**

- lv2020, §7.2, p. 36: The definition.
- lv2020, §7.2, p. 35: The dimension.

**Planet:** Reduced relative Prym.

**Signature gap:** Suggested signatures — reduced-prym.

### Homology of the reduced Prym is the primitive homology of the degree-q cover

**Node:** `MordellLawrenceVenkatesh:LV.8/reduced-prym-homology` · lemma; implementation unchecked.

Let Z → Y be a connected Aff(q)-Galois covering of compact Riemann surfaces branched over exactly one point y with inertia generated by a q-cycle (a nontrivial translation), g(Y) = g, C' := Z/H_q and π' : C' → Y the associated degree-q covering. Then H₁((ker e'')°(ℂ), ℚ) = e·H₁(Z, ℚ) inside H₁(Pic⁰(Z)(ℂ), ℚ) = H₁(Z, ℚ), and the pushforward along p : Z → C' restricts to an isomorphism e·H₁(Z, ℚ) ≅ H₁^Pr(C', Y; ℚ) := ker(π'_* : H₁(C', ℚ) → H₁(Y, ℚ)) that multiplies intersection forms by q − 1; the Riemann form of the restricted polarization is the restriction of the intersection form up to sign. In particular dim_ℚ H₁^Pr(C', Y) = (2g − 1)(q − 1) and dim (ker e'')° = (g − 1/2)(q − 1). These identifications are natural for homeomorphisms of Z commuting with G and covering a homeomorphism of Y.

**Hypotheses.** Z → Y Aff(q)-Galois, branched at one point with q-cycle inertia.

**Construction or proof.**

1. Complex uniformization: H₁(Pic⁰(Z)(ℂ), ℤ) = H₁(Z, ℤ) with the intersection form as Riemann form (AbelianSchemes A5, JacobianChallenge), and for an endomorphism ε of a complex abelian variety, H₁((ker ε)°, ℚ) = ker(ε on H₁(·, ℚ)); ker e'' = e·H₁ by the idempotent lemma.
2. p : Z → C' is an unramified H_q-Galois covering: the ramification index q of Z → Y at points over y equals that of C' → Y, whose unique point over y has index q. Transfer (AlgebraicTopology Stage 5) gives p_* : H₁(Z, ℚ)^{H} ≅ H₁(C', ℚ) with p^*p_* = Σ_{h∈H} h, and ⟨p_*x, p_*x'⟩ = (q − 1)⟨x, x'⟩ for H-invariant x, x'.
3. For the G-covering Z → Y (unramified off y, and H₁(Y ∖ {y}) = H₁(Y)), Σ_{g∈G} g = π^*π_* on H₁(Z, ℚ), so ker e_G = ker π_*; under p_* this becomes ker π'_*, since π_* = π'_* p_*.
4. Riemann–Hurwitz: 2g(C') − 2 = q(2g − 2) + (q − 1), so 2g(C') − 2g = (2g − 1)(q − 1).
5. Naturality: all maps are induced by the coverings and commute with lifted homeomorphisms.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent — AlgebraicTopology Stage 5 (covers, transfer, fibrations); tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality — AlgebraicTopology Stage 6 (cohomology, products, Poincaré duality, intersection pairing); tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme — JacobianChallenge Layer D (relative Picard functor and Jacobian scheme). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.8/reduced-prym`; `MordellLawrenceVenkatesh:LV.8/affine-group-idempotents`; `MordellLawrenceVenkatesh:LV.8/curve-topological-genus`; `AbelianSchemesAndArithmeticModuli:A5`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

**Acceptance.**

- q = 3, g = 2: C' has genus 5 and dim H₁^Pr(C', Y) = 6 = 2·3.
- H₁^Pr is the orthogonal complement of π'^*H₁(Y) in H₁(C') (LV.9).

**Sources.**

- lv2020, §8.2.3, p. 41: LV's use of the identification of H₁ of the reduced Prym with primitive homology.
- lv2020, §7.2, p. 35: The dimension.

**Signature gap:** Named theorem interfaces — LV.8.

### The Kodaira–Parshin family (LV Definitions 7.2–7.3)

**Node:** `MordellLawrenceVenkatesh:LV.8/kodaira-parshin-family` · definition; implementation unchecked.

Let Y be a smooth projective geometrically connected curve of genus g ≥ 2 over a number field K and q ≥ 3 a prime. The Kodaira–Parshin curve family Z_q → Y'_q → Y is the Hurwitz space of LV Proposition 7.1 for G = Aff(q), and the Kodaira–Parshin family is X_q → Y'_q → Y with X_q the reduced Prym of Z_q → Y'_q. It is an abelian-by-finite family of relative dimension d_q = (g − 1/2)(q − 1), it admits a good model over 𝒪_S for some finite S (with 𝒴 proper), and for y ∈ Y(K) the fibre π⁻¹(y) is G_K-equivariantly the set of Aff(q)-conjugacy classes of surjections π₁^geom(Y_{K̄} ∖ {y}) → Aff(q) nontrivial on a loop around y (LV property (iii)).

**Hypotheses.** g ≥ 2; q ≥ 3 prime.

**Construction or proof.**

1. Aff(q) has trivial centre (LV.0), so the Hurwitz space exists.
2. The fibre dimension of ker e'' is constant by the homology lemma (computed at complex points, which lie over every point of Y'_q), so the reduced Prym is an abelian scheme of relative dimension d_q with polarization.
3. Good model: LV.2 (existence after enlarging S), with 𝒴 proper because Y is.
4. Property (iii) is Proposition 7.1 (i); Aff(q)-conjugacy and Sym(𝔽_q)-conjugacy classes agree (LV.0).

**Prerequisites.** `MordellLawrenceVenkatesh:LV.8/hurwitz-space`; `MordellLawrenceVenkatesh:LV.8/reduced-prym`; `MordellLawrenceVenkatesh:LV.8/reduced-prym-homology`; `MordellLawrenceVenkatesh:LV.0/affine-group-centralizer`; `MordellLawrenceVenkatesh:LV.2/abelian-by-finite-family`; `MordellLawrenceVenkatesh:LV.2/good-model-exists`.

**Uses.**

- MordellLawrenceVenkatesh:LV.8/kodaira-parshin-fibre-map: combine the arithmetic fibre count and topological monodromy in one family. The consumer is The map from Kodaira–Parshin fibres to H¹(Y, ℤ/(q − 1)) (LV (5.5)).
- MordellLawrenceVenkatesh:LV.10/kodaira-parshin-full-monodromy: combine the arithmetic fibre count and topological monodromy in one family. The consumer is The Kodaira–Parshin family has full monodromy (LV §8.2.3).
- MordellLawrenceVenkatesh:LV.11/size-bound: combine the arithmetic fibre count and topological monodromy in one family. The consumer is The size bound (LV (5.4)).
- MordellLawrenceVenkatesh:LV.11/faltings-theorem: combine the arithmetic fibre count and topological monodromy in one family. The consumer is Faltings's theorem (LV Theorem 5.4).

**Planning API.**

- `kodairaParshinCurves` (constructor; signature omitted): Z_q → Y'_q → Y.
- `kodairaParshin` (constructor; signature omitted): X_q → Y'_q → Y as an abelian-by-finite family.
- `kodairaParshin.relDim` (simp; signature omitted): d_q = (g − 1/2)(q − 1), i.e. 2d_q = (2g − 1)(q − 1).
- `kodairaParshin.exists_goodModel` (other; signature omitted): A good model over some 𝒪_S with 𝒴 proper.
- `kodairaParshin.fibreEquiv` (equivalence; signature omitted): π⁻¹(y)(K̄) ≃ conjugacy classes of surjections π₁^geom(Y ∖ y) → Aff(q) nontrivial at y, G_K-equivariantly for y ∈ Y(K).
- `kodairaParshin.fibreHomology` (compatibility; signature omitted): H₁(X_{q,y'}(ℂ), ℚ) ≅ H₁^Pr(Z_{q,y'} ×^{Aff(q)} 𝔽_q, Y(ℂ); ℚ).
- `kodairaParshin.example` (example; signature omitted): q = 3, g = 2: d = 3, fibre of size 135.

**Mathematical tests.**

- `kodairaParshinCurves.reviewTest1` (computation; signature omitted): For g=2 and q=3, relative dimension is 3 and the parameter fibre has 135 points.
- `kodairaParshinCurves.reviewTest2` (computation; signature omitted): For g=2 and q=107, relative dimension is 159.
- `kodairaParshinCurves.reviewTest3` (non-example; signature omitted): The associated degree-q curve and the Aff(q)-Galois curve have different degrees, q and q(q−1); the reduced Prym uses the degree-q quotient, not the full Prym of the Galois curve.

**Acceptance.**

- q = 3, g = 2: d_3 = 3 and #π⁻¹(y) = 135.
- q = 107, g = 2: d_q = 159.

**Sources.**

- lv2020, §7.1, Definition 7.2, p. 35: Definition 7.2.
- lv2020, §7.2, Definition 7.3, p. 36: Definition 7.3.
- lv2020, §5, p. 26: Property (ii).

**Planet:** Kodaira–Parshin family.

**Signature gap:** Suggested signatures — kodaira-parshin-family.

### The map from Kodaira–Parshin fibres to H¹(Y, ℤ/(q − 1)) (LV (5.5))

**Node:** `MordellLawrenceVenkatesh:LV.8/kodaira-parshin-fibre-map` · lemma; implementation unchecked.

Let y ∈ Y(K), N = q − 1, and fix a generator of 𝔽_q^× to identify λ : Aff(q) → 𝔽_q^× with a surjection onto ℤ/N. Composition with λ defines a G_K-equivariant map ψ : π⁻¹(y)(K̄) → M := H¹_et(Y_{K̄}, ℤ/N) = Hom(π₁^geom(Y_{K̄}), ℤ/N). In coordinates given by a standard generating system of the free group π₁(Y(ℂ) ∖ {y}) (M ≅ (ℤ/N)^{2g}), the image Υ of ψ is the set of 2g-tuples whose entries generate ℤ/N, and every fibre of ψ over Υ has q^{2g−2} elements. In particular #π⁻¹(y) = q^{2g−2}·J_{2g}(N).

**Hypotheses.** y ∈ Y(K); q ≥ 3 prime.

**Construction or proof.**

1. For a surjection φ nontrivial at y, φ(c) lies in [Aff(q), Aff(q)] = 𝔽_q^+ because the peripheral class is a product of commutators; so λ ∘ φ kills the peripheral class and factors through π₁^geom(Y_{K̄}) (the kernel of π₁(Y ∖ y) → π₁(Y) is normally generated by c, also after profinite completion). λ ∘ φ depends only on the conjugacy class of φ since ℤ/N is abelian.
2. Equivariance: G_K acts on both sides through its outer action on the geometric fundamental groups, and trivially on ℤ/N.
3. Homomorphisms to finite groups from the profinite completion of a free group are homomorphisms from the free group; in the standard generators, surjections nontrivial at y are the generating tuples g ∈ Aff(q)^{2g} with ∏[g_i, g_i'] ≠ 0, and LV Lemma 2.11 (LV.0) shows that the image of Λ is the set of generating tuples of 𝔽_q^× and each fibre has q^{2g−1}(q − 1) tuples.
4. Aff(q) acts freely by conjugation (trivial centre) and preserves the fibres of Λ, so each fibre of ψ has q^{2g−1}(q − 1)/(q(q − 1)) = q^{2g−2} elements.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.8/kodaira-parshin-family`; `MordellLawrenceVenkatesh:LV.8/curve-topological-genus`; `MordellLawrenceVenkatesh:LV.0/commutator-product-map`; `MordellLawrenceVenkatesh:LV.0/generating-tuples-card`; `MordellLawrenceVenkatesh:LV.0/affine-group-centralizer`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `InverseGaloisAndArithmeticFundamentalGroups:IG.3`; `EtaleDualityAndPerverseSheaves:EDC.2`.

**Acceptance.**

- q = 3, g = 2: M = (ℤ/2)⁴, Υ has 15 elements, the fibres have 9, and #π⁻¹(y) = 135.
- The count J_{2g}(N) ≥ N^{2g}/2 is LV.0's generating-tuple count.

**Sources.**

- lv2020, §5, p. 26: Property (iii).
- lv2020, §5, proof of Theorem 5.4, p. 27: Equal fibres.
- lv2020, §5, proof of Theorem 5.4, p. 27: The image.

**Signature gap:** Named theorem interfaces — LV.8.

### Exact follow-ups for LV.8

- Supply/resolve LV-import-28 — Spreading polarized families and good models (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-39 — Surface triangulation, collars and tameness (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-41 — Surface homology basis and pairing (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-44 — Fibration sequences and surface asphericity (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-55 — Analytic normalization of finite covers (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-57 — Finite étale Riemann existence and base change (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-59 — Peripheral inertia and finite cohomology action (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-60 — Finite normalization over excellent schemes (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-63 — Relative norm-kernel identity components (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-66 — Finite-coefficient curve cohomology and Weil pairing (exact interface and affected nodes are in gaps).
- Supply/resolve Topological surface classification proof interfaces (exact interface and affected nodes are in gaps).
- Supply/resolve Mapping-class prerequisites beyond smooth gluing (exact interface and affected nodes are in gaps).
- Supply/resolve Generic projector and relative Prym comparisons (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — abelian-by-finite-family (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — good-model (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — surface (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — singly-ramified-surjections (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — hurwitz-cover-complex (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — reduced-prym (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — kodaira-parshin-family (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.0 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.2 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.5 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.8 (exact interface and affected nodes are in gaps).
- Resolve exact supplier contracts LV-import-19, LV-import-20, LV-import-21, LV-import-28, LV-import-35, LV-import-39, LV-import-40, LV-import-41, LV-import-42, LV-import-43, LV-import-44, LV-import-45, LV-import-52, LV-import-53, LV-import-54, LV-import-55, LV-import-56, LV-import-57, LV-import-58, LV-import-59, LV-import-60, LV-import-61, LV-import-62, LV-import-63, LV-import-64, LV-import-65, LV-import-66, LV-import-74; the stage imports name plans, not proofs.

## LV.9 — Aff(q)-covers of surfaces: primitive homology, lifted monodromy and normal form

### Aff(q)-covers and singly ramified Aff(q)-covers (LV §8.2)

**Node:** `MordellLawrenceVenkatesh:LV.9/affine-cover` · definition; implementation unchecked.

For a surface Y (with boundary or punctures allowed), an Aff(q)-cover is a connected surface Z with a degree-q covering map π : Z → Y whose monodromy on a fibre, for some labelling of the fibre by 𝔽_q, has image Aff(q). After a choice of base point it determines a homomorphism Cov : π₁(Y, y₀) → Aff(q), well defined up to Aff(q)-conjugation (the normalizer of Aff(q) in Sym(𝔽_q) is Aff(q)); two Aff(q)-covers are isomorphic (homeomorphic over Y) if and only if their classes Cov agree. The cycle type of Cov(η) is well defined for η ∈ π₁(Y, y₀) and for free loops. For a closed Y of genus g and y ∈ Y, a singly ramified Aff(q)-cover is an Aff(q)-cover of Y ∖ {y} with nontrivial monodromy around y (a q-cycle); its compactification Z has genus gq − (q − 1)/2 and a single point over y. Up to isomorphism there are finitely many, Z_1, …, Z_N, and Mod(Y ∖ {y}) acts on this finite set.

**Hypotheses.** q ≥ 3 prime.

**Construction or proof.**

1. Covering-space classification (LV.5): isomorphism classes of connected degree-q coverings correspond to conjugacy classes of transitive actions π₁ → Sym(𝔽_q); if the image is Aff(q), conjugacy under Sym(𝔽_q) is conjugacy under the normalizer Aff(q) (LV.0).
2. The monodromy around y lies in [Aff(q), Aff(q)] = 𝔽_q^+ (the peripheral class is a product of commutators), so if nontrivial it is a q-cycle; the compactification has one point over y with ramification index q, and Riemann–Hurwitz gives 2g(Z) − 2 = q(2g − 2) + (q − 1).
3. π₁(Y ∖ {y}) is finitely generated, so there are finitely many homomorphisms to Aff(q); mapping classes act through Out(π₁(Y ∖ {y})).

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.5/mapping-class-group`; `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence`; `MordellLawrenceVenkatesh:LV.0/affine-group-centralizer`; `MordellLawrenceVenkatesh:LV.0/affine-group-cycle-type`; `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`.

**Uses.**

- MordellLawrenceVenkatesh:LV.9/primitive-homology: classify the degree-q covers on which mapping classes act. The consumer is Primitive homology of a covering.
- MordellLawrenceVenkatesh:LV.9/lifted-monodromy: classify the degree-q covers on which mapping classes act. The consumer is Lifted mapping classes and the monodromy maps Mon (LV (8.2)–(8.5)).
- MordellLawrenceVenkatesh:LV.9/affine-cover-normal-form: classify the degree-q covers on which mapping classes act. The consumer is Normal form of a singly ramified Aff(q)-cover (LV Proposition 8.5).
- MordellLawrenceVenkatesh:LV.10/covers-distinguished-by-curve: classify the degree-q covers on which mapping classes act. The consumer is Distinct covers are distinguished by the cycle type along a simple closed curve (LV Lemma 8.8).
- MordellLawrenceVenkatesh:LV.10/kodaira-parshin-full-monodromy: classify the degree-q covers on which mapping classes act. The consumer is The Kodaira–Parshin family has full monodromy (LV §8.2.3).

**Planning API.**

- `AffineCover` (constructor; signature omitted): An Aff(q)-cover of a surface with its monodromy class Cov.
- `AffineCover.cov` (data; signature omitted): Cov : π₁(Y, y₀) → Aff(q) up to conjugacy.
- `AffineCover.iso_iff` (characterisation; signature omitted): Z₁ ≅ Z₂ over Y ↔ Cov₁ and Cov₂ are Aff(q)-conjugate.
- `AffineCover.cycleType` (data; signature omitted): The cycle type of Cov(η), a partition of q, for loops η.
- `SinglyRamified` (constructor; signature omitted): Singly ramified Aff(q)-covers of (Y, y) and their compactifications.
- `SinglyRamified.genus` (simp; signature omitted): g(Z) = gq − (q − 1)/2.
- `SinglyRamified.finite` (instance; signature omitted): Finitely many isomorphism classes Z_1, …, Z_N.
- `SinglyRamified.modAction` (data; signature omitted): The action of Mod(Y ∖ {y}) on {Z_1, …, Z_N}.
- `SinglyRamified.example` (example; signature omitted): q = 3, g = 2: N = 135, genus 5.

**Mathematical tests.**

- `AffineCover.reviewTest1` (computation; signature omitted): For q=3 and g=2 there are 135 singly ramified isomorphism classes, each compactified source of genus 5.
- `AffineCover.reviewTest2` (non-example; signature omitted): A connected cyclic degree-3 cover with monodromy C₃ is not an Aff(3)-cover, despite being transitive.
- `AffineCover.reviewTest3` (non-example; signature omitted): A trivial disconnected degree-q covering is not an Aff(q)-cover.

**Acceptance.**

- q = 3, g = 2: N = 135 and each Z_i has genus 5.
- The trivial cover (q disjoint copies) is not an Aff(q)-cover.

**Sources.**

- lv2020, §8.2, p. 39: The definition.
- lv2020, §8.2, p. 39: Isomorphism.

**Planet:** Affine cover.

**Signature gap:** Suggested signatures — affine-cover.

### Primitive homology of a covering

**Node:** `MordellLawrenceVenkatesh:LV.9/primitive-homology` · definition; implementation unchecked.

For a positive-degree finite (possibly branched) cover π:Z→Y of closed oriented surfaces, allowing disconnected Z, primitive rational homology is H₁^Pr(Z,Y):=ker(π_*:H₁(Z;ℚ)→H₁(Y;ℚ)). The supplied linear-map kernel is its baseline-expressible carrier. Transfer and perfectness are imported/comparison results, not fields of the definition.

**Hypotheses.** π finite covering of closed oriented surfaces, possibly branched; The degree q is positive, and the covering is orientation-preserving away from its branch points; the source may be a finite disjoint union of closed oriented surfaces..

**Construction or proof.**

1. Apply Submodule.ker to the actual singular-homology pushforward. The branched transfer interface is requested separately; the decomposition and symplectic comparison are the next theorem.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent — AlgebraicTopology Stage 5 (covers, transfer, fibrations); tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality — AlgebraicTopology Stage 6 (cohomology, products, Poincaré duality, intersection pairing). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.9/affine-cover`.

**Uses.**

- MordellLawrenceVenkatesh:LV.9/lifted-monodromy: remove the constant base homology summand. The consumer is Lifted mapping classes and the monodromy maps Mon (LV (8.2)–(8.5)).
- MordellLawrenceVenkatesh:LV.9/preimage-classes-independent: remove the constant base homology summand. The consumer is Classes of the preimage circles (LV Lemma 8.2).
- MordellLawrenceVenkatesh:LV.9/liftable-curve: remove the constant base homology summand. The consumer is Liftable curves and their transvections.
- MordellLawrenceVenkatesh:LV.10/push-monodromy-noncentral: remove the constant base homology summand. The consumer is Point-pushing acts non-centrally on each factor (LV Lemma 8.6).
- MordellLawrenceVenkatesh:LV.10/liftable-curve-system: remove the constant base homology summand. The consumer is A connected spanning system of liftable curves (LV Lemma 8.10).

**Planning API.**

- `primitiveHomology` (constructor; signature partial): H₁^Pr(Z, Y) = ker(π_* : H₁(Z; ℚ) → H₁(Y; ℚ)).
  The file gives the actual linear kernel. Identification of p with singular H₁ pushforward is required of the branched-cover owner.
- `transfer` (data; signature omitted): π^* : H₁(Y; ℚ) → H₁(Z; ℚ) with π_*π^* = q.
- `isCompl_primitiveHomology` (other; signature partial): H₁(Z) = π^*H₁(Y) ⊕ H₁^Pr(Z, Y), with projection x ↦ x − q⁻¹π^*π_*x.
  The file gives the linear complement under p∘t=q id. The topological transfer must supply this identity.
- `primitiveHomology_eq_orthogonal` (characterisation; signature partial): H₁^Pr(Z, Y) = (π^*H₁(Y))^⊥.
  The linear projection-formula characterization is stated. Identify both forms with the topological intersection pairings.
- `primitiveHomology.symplectic` (data; signature partial): The restricted intersection form is nondegenerate and alternating.
  The restriction is alternating and nondegenerate for explicit B_Z and the projection formula. Supply the surface-duality and transfer comparisons.
- `primitiveHomology.equivariant` (functoriality; signature partial): A lift of a homeomorphism of Y preserves π^*H₁(Y) and H₁^Pr.
  The kernel preservation under commuting linear equivalences is stated. The topological transfer-range equivariance is an additional comparison.
- `primitiveHomology.finrank` (simp; signature partial): dim H₁^Pr = 2g(Z) − 2g(Y).
  The rank-nullity signature takes an explicit surjective pushforward; surface classification and Riemann–Hurwitz supply the genus ranks.
- `primitiveHomology.trivialCover` (example; signature partial): The sum-zero subspace for a trivial cover.
  The file uses the finite direct-product sum map. Compare with singular homology of a finite disjoint union.

**Mathematical tests.**

- `primitiveHomology.reviewTest1` (degenerate; signature stated): For the identity covering, primitive homology is zero and the primitive projection is zero.
- `primitiveHomology.reviewTest2` (computation; signature stated): For the trivial disconnected double cover, primitive homology consists of pairs (x,−x), with intersection form twice the form on the base.
- `primitiveHomology.reviewTest3` (compatibility; signature partial): For a singly ramified Aff(3)-cover of a genus-two surface, primitive homology has dimension 6, and the projection x↦x−(1/3)π*π_*x kills the transfer image.

**Acceptance.**

- A trivial (disconnected) cover of degree q: H₁^Pr = {(x_i) : Σ x_i = 0}.
- For a singly ramified Aff(q)-cover of a genus-g surface, dim H₁^Pr = 2g(Z) − 2g = (2g − 1)(q − 1).

**Sources.**

- lv2020, §8.2, p. 39: The splitting.
- lv2020, §8.2, pp. 39–40: Orthogonality and the induced form.

**Planet:** Primitive homology.

**Signature gap:** Suggested signatures — primitive-homology.

### Lifted mapping classes and the monodromy maps Mon (LV (8.2)–(8.5))

**Node:** `MordellLawrenceVenkatesh:LV.9/lifted-monodromy` · construction; implementation unchecked.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y. For a singly ramified Aff(q)-cover Z, let Mod(Y ∖ {y})_Z be the stabilizer of its isomorphism class. Each f ∈ Mod(Y ∖ {y})_Z has a unique lift f̃ ∈ Mod(Z) (the centralizer of Aff(q) in Sym(𝔽_q) is trivial), giving a homomorphism Mod(Y ∖ {y})_Z → Mod(Z) and Mon_Z : Mod(Y ∖ {y})_Z → Sp(H₁^Pr(Z, Y)). Let Mod(Y ∖ {y})' := ⋂_i Mod(Y ∖ {y})_{Z_i}, a normal subgroup of finite index (the kernel of the action on {Z_1, …, Z_N}); Mon := (Mon_{Z_i})_i : Mod(Y ∖ {y})' → ∏_i Sp(H₁^Pr(Z_i, Y)) (LV (8.3)); π₁(Y, y)' := Push⁻¹(Mod(Y ∖ {y})'), a normal subgroup of finite index in π₁(Y, y), and Mon ∘ Push on it (LV (8.5)). For f ∈ Push(π₁(Y, y)) ∩ Mod(Y ∖ {y})_Z, the lift acts trivially on π^*H₁(Y).

**Hypotheses.** Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y..

**Construction or proof.**

1. Existence of a lift: f preserves the class of Cov, so the pullback covering is isomorphic to Z; composing gives a homeomorphism of Z° covering f, which extends over the point above y (LV.5).
2. Uniqueness: two lifts differ by a deck transformation, i.e. by an element of the centralizer of the monodromy group Aff(q) in Sym(𝔽_q), which is trivial (LV.0); the same argument applies to isotopies, so lifting is well defined on mapping classes and multiplicative.
3. Mon_Z preserves the intersection form and the decomposition of the primitive-homology node, so it lands in Sp(H₁^Pr).
4. The action of Mod(Y ∖ {y}) on the finite set {Z_i} has a normal kernel of finite index; its preimage under the homomorphism Push is normal of finite index.
5. A point-push is isotopic to the identity on Y, so it acts trivially on H₁(Y ∖ {y}) = H₁(Y); by equivariance of the transfer its lift acts trivially on π^*H₁(Y).

**Prerequisites.** `MordellLawrenceVenkatesh:LV.9/affine-cover`; `MordellLawrenceVenkatesh:LV.9/primitive-homology`; `MordellLawrenceVenkatesh:LV.5/birman-exact-sequence`; `MordellLawrenceVenkatesh:LV.5/covering-dehn-twist-lift`; `MordellLawrenceVenkatesh:LV.5/configuration-family-monodromy`; `MordellLawrenceVenkatesh:LV.0/affine-group-centralizer`; `tauceti:TauCeti.BilinForm.isometryGroup`; `MordellLawrenceVenkatesh:LV.9/primitive-homology-decomposition`.

**Uses.**

- MordellLawrenceVenkatesh:LV.9/preimage-classes-independent: define compatible symplectic representations of stabilizers and point-pushes. The consumer is Classes of the preimage circles (LV Lemma 8.2).
- MordellLawrenceVenkatesh:LV.9/liftable-curve: define compatible symplectic representations of stabilizers and point-pushes. The consumer is Liftable curves and their transvections.
- MordellLawrenceVenkatesh:LV.10/push-monodromy-noncentral: define compatible symplectic representations of stabilizers and point-pushes. The consumer is Point-pushing acts non-centrally on each factor (LV Lemma 8.6).
- MordellLawrenceVenkatesh:LV.10/lifted-monodromy-dense-factor: define compatible symplectic representations of stabilizers and point-pushes. The consumer is Zariski density on one factor (LV Lemma 8.9).
- MordellLawrenceVenkatesh:LV.10/lifted-monodromy-dense-product: define compatible symplectic representations of stabilizers and point-pushes. The consumer is Zariski density on the product (LV Lemma 8.7).
- MordellLawrenceVenkatesh:LV.10/push-monodromy-dense: define compatible symplectic representations of stabilizers and point-pushes. The consumer is Zariski density of the point-pushing monodromy (LV Theorem 8.1).
- MordellLawrenceVenkatesh:LV.10/kodaira-parshin-full-monodromy: define compatible symplectic representations of stabilizers and point-pushes. The consumer is The Kodaira–Parshin family has full monodromy (LV §8.2.3).

**Planning API.**

- `liftMappingClass` (constructor; signature omitted): Mod(Y ∖ {y})_Z →* Mod(Z), f ↦ f̃.
- `liftMappingClass_unique` (extensionality; signature omitted): f̃ is the only mapping class of Z covering f.
- `monodromyMap` (constructor; signature omitted): Mon_Z : Mod(Y ∖ {y})_Z →* Sp(H₁^Pr(Z, Y)).
- `stabilizerAll` (data; signature omitted): Mod(Y ∖ {y})' = ⋂ Mod(Y ∖ {y})_{Z_i}, normal of finite index.
- `pushSubgroup` (data; signature omitted): π₁(Y, y)' = Push⁻¹(Mod(Y ∖ {y})'), normal of finite index.
- `monodromyMap.prod` (data; signature omitted): Mon : Mod(Y ∖ {y})' → ∏_i Sp(H₁^Pr(Z_i, Y)).
- `monodromyMap_push_transfer` (other; signature omitted): Lifts of point-pushes act trivially on π^*H₁(Y).
- `monodromyMap_twist` (compatibility; signature omitted): Mon_Z(T_e^{n_e}) is the multitwist ∏ T_{e_i}^{n_e/d_i} on homology.
- `monodromyMap.example` (example; signature omitted): q = 3, g = 2: 135 factors.

**Mathematical tests.**

- `liftMappingClass.reviewTest1` (degenerate; signature omitted): Lifting the identity gives the identity mapping class and identity linear monodromy.
- `liftMappingClass.reviewTest2` (computation; signature omitted): For q=3 and g=2, the product monodromy has 135 factors, each acting on a six-dimensional primitive space.
- `liftMappingClass.reviewTest3` (compatibility; signature omitted): The lift of a point-push acts trivially on the transfer summand π*H₁(Y), while it can act nontrivially on primitive homology.

**Acceptance.**

- q = 3, g = 2: Mon has 135 factors, each Sp of a 6-dimensional space.
- For f = T_e^M with M a multiple of n_e (LV.5 lifting), Mon_Z(f) is the multitwist action on H₁^Pr.

**Sources.**

- lv2020, §8.2.1, p. 40: Unique lifts.
- lv2020, §8.2.1, p. 40: Mon.
- lv2020, §8.2.2, p. 40: The finite-index subgroup.
- lv2020, §8.2.2, p. 40: The point-pushing subgroup.

**Planet:** Lifted monodromy.

**Signature gap:** Suggested signatures — lifted-monodromy.

### Classes of the preimage circles (LV Lemma 8.2)

**Node:** `MordellLawrenceVenkatesh:LV.9/preimage-classes-independent` · lemma; implementation unchecked.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y. Let Z be a singly ramified Aff(q)-cover and e ⊂ Y ∖ {y} a nonseparating simple closed curve whose preimage consists of the circles e_1, …, e_k (of degrees d_i). Then [e_1], …, [e_k] are linearly independent in H₁(Z; ℚ); their span meets π^*H₁(Y) in ℚ·π^*[e] = ℚ·Σ_i[e_i], and its projection to H₁^Pr(Z, Y) has dimension k − 1. Consequently Mon_Z(T_e^{n_e}) − 1 has rank exactly k − 1 on H₁^Pr(Z, Y), and so does Mon_Z(T_e^{M}) − 1 for every positive multiple M of n_e.

**Hypotheses.** Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y.; e nonseparating.

**Construction or proof.**

1. By change of coordinates, Y has a CW structure with one 2-cell containing y in its interior and with e in the 1-skeleton; Y ∖ {y} deformation retracts onto the 1-skeleton (a wedge of 2g circles), and Z ∖ π⁻¹(y) onto its preimage graph. Since π⁻¹(y) is one point, H₁(Z ∖ π⁻¹(y)) = H₁(Z), so H₁(Z) is the cycle space of the preimage graph.
2. The e_i are cycles with pairwise disjoint edge supports in that graph, so they are linearly independent.
3. If Σ c_i[e_i] = π^*z then applying π_* gives q z = (Σ c_i d_i)[e], so the intersection with π^*H₁(Y) is ℚ·π^*[e], where π^*[e] = Σ_i[e_i] ≠ 0; the projection therefore has dimension k − 1.
4. The lift of T_e^{n_e} is the multitwist ∏ T_{e_i}^{n_e/d_i}; by LV.5 it acts by x ↦ x + Σ (n_e/d_i)⟨x, e_i⟩e_i, whose image is the span of the [e_i] (the functionals ⟨·, e_i⟩ are independent). It acts on π^*H₁(Y) as T_e^{n_e}, with image ℚ·π^*[e]; so on H₁^Pr the image has dimension k − 1.
5. N := Mon_Z(T_e^{n_e}) − 1 satisfies N² = 0 (the e_i are pairwise disjoint), so Mon_Z(T_e^{m n_e}) − 1 = mN has the same rank.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations — AlgebraicTopology Stage 4 (CW pairs and cellular homology). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.9/lifted-monodromy`; `MordellLawrenceVenkatesh:LV.9/primitive-homology`; `MordellLawrenceVenkatesh:LV.5/covering-dehn-twist-lift`; `MordellLawrenceVenkatesh:LV.5/dehn-twist-homology`; `MordellLawrenceVenkatesh:LV.5/change-of-coordinates`; `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`; `MordellLawrenceVenkatesh:LV.5/simple-closed-curve`; `MordellLawrenceVenkatesh:LV.9/primitive-homology-decomposition`.

**Acceptance.**

- Trivial monodromy along e: k = q and the rank is q − 1.
- Monodromy a q-cycle: k = 1 and T_e^q acts trivially on H₁^Pr.

**Sources.**

- lv2020, §8.3, Lemma 8.2, p. 42: Statement (the proof uses a CW structure with e in the 1-skeleton, which requires e nonseparating; the node states that hypothesis).
- lv2020, §8.3, proof of Lemma 8.2, p. 42: The proof.

**Signature gap:** Named theorem interfaces — LV.9.

### The rank of a lifted twist detects the cycle type (LV Lemma 8.3)

**Node:** `MordellLawrenceVenkatesh:LV.9/twist-rank-detects-cycle-type` · lemma; implementation unchecked.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y. Let e ⊂ Y ∖ {y} be a nonseparating simple closed curve and M a positive multiple of n_e. Then the rank of Mon_Z(T_e^M) − 1 on H₁^Pr(Z, Y) equals k − 1, where k is the number of cycles of Cov(e), and k determines the cycle type of Cov(e): k = q for the identity, k = 1 for a q-cycle, and k = 1 + (q − 1)/r for an element with nontrivial linear part of order r.

**Hypotheses.** Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y.; e nonseparating; n_e | M; M > 0..

**Construction or proof.**

1. The rank statement is LV Lemma 8.2 (preimage-classes-independent).
2. The possible cycle types in Aff(q) are (1^q), (q) and (1, r, …, r) with r | q − 1, r > 1 (LV.0); the number of cycles k distinguishes them.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.9/preimage-classes-independent`; `MordellLawrenceVenkatesh:LV.0/affine-group-cycle-type`.

**Acceptance.**

- q = 5: the identity, a 5-cycle, and elements with linear part of order 2 or 4 give k = 5, 1, 3, 2.
- Two covers with different cycle types along e give Mon(T_e^M) with fixed spaces of different codimensions.

**Sources.**

- lv2020, §8.3, Lemma 8.3, p. 42: Statement (LV take M with D_e^M in the stabilizer; the node takes M a multiple of n_e).

**Signature gap:** Named theorem interfaces — LV.9.

### Liftable curves and their transvections

**Node:** `MordellLawrenceVenkatesh:LV.9/liftable-curve` · definition; implementation unchecked.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y. A simple closed curve e ⊂ Y ∖ {y} is liftable for Z if λ(Cov(e)) generates 𝔽_q^×..

**Hypotheses.** Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y..

**Construction or proof.**

1. Define liftability by the order of the linear part; conjugation changes neither that order nor the underlying unbased curve. The lift, nonzero primitive class, intersection identity and monodromy formula are established separately in liftable-curve-transvection.

The form-order convention matters: LV.0 uses ω(v,x), while the Dehn-twist formula uses the intersection ω(x,v). Thus the parameter is −q when those forms are identified.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.9/affine-cover`; `MordellLawrenceVenkatesh:LV.5/simple-closed-curve`; `MordellLawrenceVenkatesh:LV.0/affine-group-cycle-type`.

**Uses.**

- MordellLawrenceVenkatesh:LV.10/liftable-curve-system: obtain rank-one transvections and their intersection graph. The consumer is A connected spanning system of liftable curves (LV Lemma 8.10).
- MordellLawrenceVenkatesh:LV.10/lifted-monodromy-dense-factor: obtain rank-one transvections and their intersection graph. The consumer is Zariski density on one factor (LV Lemma 8.9).

**Planning API.**

- `IsLiftable` (constructor; signature omitted): λ(Cov(e)) generates 𝔽_q^×.
- `IsLiftable.nonseparating` (other; signature omitted): Liftable curves are nonseparating.
- `IsLiftable.liftPlus` (data; signature omitted): The degree-one lift e⁺.
- `IsLiftable.primitiveClass` (data; signature omitted): ẽ ∈ H₁^Pr(Z, Y), nonzero.
- `IsLiftable.mon_twist` (simp; signature omitted): With ω equal to the topological intersection pairing, Mon_Z(T_e^{q−1}) = T_{ẽ}^{−q} in the LV.0 convention T_v^r(x)=x+rω(v,x)v. Equivalently the actual action is x↦x+qω(x,ẽ)ẽ.
- `IsLiftable.inner_eq` (relation; signature omitted): Ã·B̃ = A⁺·B⁺ − q⁻¹ A·B.
- `IsLiftable.example` (example; signature omitted): Aff(3) and a reflection monodromy.

**Mathematical tests.**

- `IsLiftable.reviewTest1` (computation; signature omitted): For q=3, reflection monodromy x↦−x+b is liftable, with one degree-one lift and one degree-two lift.
- `IsLiftable.reviewTest2` (non-example; signature omitted): A nonzero translation has linear part 1 and is not liftable for q≥3.
- `IsLiftable.reviewTest3` (compatibility; signature omitted): For a liftable curve e, T_e^(q−1) acts on primitive homology by x↦x+q·î(x,ẽ)ẽ; the exponent on the base twist is q−1, not q.

**Acceptance.**

- q = 3: a curve with Cov(e) = (x ↦ −x + b) is liftable, with e⁺ over the fixed point.
- A curve with Cov(e) a translation is not liftable.

**Sources.**

- lv2020, §8.3, p. 42: The definition.
- lv2020, §8.3, p. 43: The transvection (for D_e^{q−1}).
- lv2020, §8.3, p. 43: The derivation of (8.6).

**Planet:** Liftable curve.

**Signature gap:** Suggested signatures — liftable-curve.

### Liftable-curve monodromy and primitive intersection

**Node:** `MordellLawrenceVenkatesh:LV.9/liftable-curve-transvection` · theorem; implementation unchecked.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y. A simple closed curve e ⊂ Y ∖ {y} is liftable for Z if λ(Cov(e)) generates 𝔽_q^×. Then e is nonseparating, Cov(e) has cycle type (1, q − 1), the preimage of e is e⁺ ⊔ e⁻ with e⁺ of degree 1 and e⁻ of degree q − 1, and ẽ := the projection of [e⁺] to H₁^Pr(Z, Y) is nonzero. Mon_Z(T_e^{q−1}) is the symplectic transvection x ↦ x + q⟨x, ẽ⟩ẽ of H₁^Pr(Z, Y), and for liftable curves A, B one has Ã·B̃ = A⁺·B⁺ − q⁻¹ A·B (LV (8.6)).

**Hypotheses.** Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y..

**Construction or proof.**

1. λ ∘ Cov factors through H₁(Y), so a separating curve has trivial λ-part; hence liftable curves are nonseparating.
2. A generator a of 𝔽_q^× has order q − 1, so Cov(e) has cycle type (1, q − 1) and n_e = q − 1; the lift of T_e^{q−1} is T_{e⁺}^{q−1}T_{e⁻}.
3. For x ∈ H₁^Pr, ⟨x, π^*[e]⟩ = ⟨π_*x, e⟩ = 0 and π^*[e] = [e⁺] + [e⁻], so the multitwist sends x to x + ⟨x, e⁺⟩((q − 1)e⁺ − e⁻) = x + ⟨x, e⁺⟩(q e⁺ − π^*[e]); since ẽ = e⁺ − q⁻¹π^*[e] and ⟨x, ẽ⟩ = ⟨x, e⁺⟩, this is x + q⟨x, ẽ⟩ẽ. ẽ ≠ 0 by LV Lemma 8.2 (k − 1 = 1).
4. (8.6): qÃ = qA⁺ − π^*A, so q²(Ã·B̃) = q²(A⁺·B⁺) − 2q(A·B) + q(A·B) by the transfer identities.

The form-order convention matters: LV.0 uses ω(v,x), while the Dehn-twist formula uses the intersection ω(x,v). Thus the parameter is −q when those forms are identified.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.9/preimage-classes-independent`; `MordellLawrenceVenkatesh:LV.9/primitive-homology`; `MordellLawrenceVenkatesh:LV.9/lifted-monodromy`; `MordellLawrenceVenkatesh:LV.0/symplectic-transvection`; `MordellLawrenceVenkatesh:LV.0/affine-group-cycle-type`; `MordellLawrenceVenkatesh:LV.5/simple-closed-curve`; `MordellLawrenceVenkatesh:LV.9/primitive-homology-decomposition`; `MordellLawrenceVenkatesh:LV.9/liftable-curve`.

**Acceptance.**

- q = 3: a curve with Cov(e) = (x ↦ −x + b) is liftable, with e⁺ over the fixed point.
- A curve with Cov(e) a translation is not liftable.

**Sources.**

- lv2020, §8.3, p. 42: The definition.
- lv2020, §8.3, p. 43: The transvection (for D_e^{q−1}).
- lv2020, §8.3, p. 43: The derivation of (8.6).

**Signature gap:** Named theorem interfaces — LV.9.

### Mapping classes of a surface with two boundary circles realize Sp(V, b) (LV Lemma 8.4)

**Node:** `MordellLawrenceVenkatesh:LV.9/boundary-fixing-symplectic-surjective` · lemma; implementation unchecked.

Let W be a compact surface of genus h ≥ 1 with two boundary circles, V := H₁(W; ℤ) (free of rank 2h + 1) with the degenerate alternating form induced by V → H₁(W, ∂W; ℤ) and Poincaré–Lefschetz duality; its radical V⁰ is spanned by the class b of a boundary circle. Let Sp(V, b) be the group of automorphisms of V preserving the form and fixing b. Then Mod(W) → Sp(V, b) is surjective. Consequently Mod(W) acts transitively on the set of classes ℓ ∈ H₁(W, ∂W; ℤ) ≅ Hom(V, ℤ) with ℓ(b) = 1, and every such class is represented by a simple proper arc from one boundary circle to the other; and for classes v, u ∈ V with ⟨v, u⟩ = 1 represented by simple closed curves and k ∈ ℤ, the class v + k b is represented by a simple closed curve.

**Hypotheses.** h ≥ 1; two boundary circles.

**Construction or proof.**

1. 1 → Hom(V/V⁰, V⁰) → Sp(V, b) → Sp(V/V⁰) → 1 is exact, the kernel acting by f ↦ 1 + f.
2. Capping both boundary circles surjects Mod(W) onto the mapping class group of the closed genus-h surface (LV.5), which surjects onto Sp(V/V⁰) (Farb–Margalit Theorem 6.4).
3. For v ∉ V⁰ represented by a simple closed curve, v + b is also represented by one (band the curve with a boundary circle, replacing b by −b if necessary); T_{v+b}T_v⁻¹ acts by x ↦ x + ⟨x, v⟩b, and these elements generate Hom(V/V⁰, V⁰) because simple closed curves span V/V⁰ and the form on V/V⁰ is unimodular.
4. Transitivity: the kernel acts on {ℓ : ℓ(b) = 1} by ℓ ↦ ℓ − μ for μ ∈ Hom(V/V⁰, ℤ), transitively; any simple proper arc joining the two boundary circles has a class with ℓ(b) = ±1, and mapping classes carry it to every class in the orbit.
5. Applying (T_{u+b}T_u⁻¹)^k to a simple closed curve representing v gives a simple closed curve representing v + k⟨v, u⟩b = v + kb.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality — AlgebraicTopology Stage 6 (cohomology, products, Poincaré duality, intersection pairing). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.5/capping-surjective`; `MordellLawrenceVenkatesh:LV.5/symplectic-representation-surjective`; `MordellLawrenceVenkatesh:LV.5/dehn-twist-homology`; `MordellLawrenceVenkatesh:LV.5/primitive-classes-simple`; `MordellLawrenceVenkatesh:LV.5/change-of-coordinates`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Acceptance.**

- h = 1 (a torus with two holes): V ≅ ℤ³ with radical ℤb, and Sp(V, b) ≅ SL₂(ℤ) ⋉ ℤ².
- The boundary twist T_b acts trivially on V, consistent with b spanning the radical.

**Sources.**

- lv2020, §8.4, Lemma 8.4, p. 44: Statement.
- lv2020, §8.4, proof of Lemma 8.4, p. 44: The proof.
- lv2020, §8.4, p. 44: The transitivity consequence.

**Signature gap:** Named theorem interfaces — LV.9.

### Normal form of a singly ramified Aff(q)-cover (LV Proposition 8.5)

**Node:** `MordellLawrenceVenkatesh:LV.9/affine-cover-normal-form` · theorem; implementation unchecked.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y. Let Z be a singly ramified Aff(q)-cover. Then Y is the union of S°_{g−1} (genus g − 1, one boundary circle) and T° (genus 1, one boundary circle) glued along their boundary circles, such that: y lies in the interior of T°; the cover is trivial over S°_{g−1}; its restriction to T° has trivial monodromy around ∂T°; and for a standard free basis β₁, β₂ of π₁(T ∖ {y}) (T the capped torus, β_i crossing the cutting curve α_i once and not the other), Cov(β₁) projects to a generator of 𝔽_q^× and Cov(β₂) is a nonzero translation. Consequently, after conjugation, Cov(β₁) = (x ↦ cx) with c a generator and Cov(β₂) = (x ↦ x + 1), and Cov factors through the map π₁(Y ∖ {y}) → π₁(T ∖ {y}) collapsing S°_{g−1}.

**Hypotheses.** Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y..

**Construction or proof.**

1. The surjection λ∘Cov : H₁(Y;ℤ) → ℤ/(q−1) has rank 2g≥4. Apply primitive-integral-lift (including its CRT argument), then integral Poincaré duality to obtain a primitive class α₁; primitive-classes-simple represents it by a simple curve avoiding y.
2. Take parallel copies α₁^± on either side of y; they cobound an annulus containing y, so Cov(α₁^+)Cov(α₁^−)⁻¹ is conjugate to the monodromy around y, and both lie in 𝔽_q^+ (their λ-part is ⟨α₁, α₁⟩ = 0); so they are not both trivial.
3. Cutting along α₁^± and discarding the annulus gives Y¹ of genus g − 1 with boundary circles b₊, b₋; Cov restricted to π₁(Y¹) has image in 𝔽_q^+ and factors through H₁(Y¹; ℤ), with Cov(b₊) = −Cov(b₋) ≠ 0; conjugating by a scaling, Cov(b₊) = 1.
4. The induced map H₁(Y¹; ℤ) → 𝔽_q^+ lifts to ℓ : H₁(Y¹; ℤ) → ℤ with ℓ(b₊) = 1 (b₊ is primitive); by Poincaré–Lefschetz duality ℓ = ⟨·, α₂⟩ with α₂ ∈ H₁(Y¹, ∂Y¹; ℤ), which by LV Lemma 8.4 is represented by a simple proper arc joining b₊ to b₋.
5. Cutting Y¹ along α₂ gives Y² of genus g − 1 with one boundary circle, over which the cover is trivial (Cov is ℓ mod q, which vanishes on curves disjoint from α₂); the complement of Y² in Y is a regular neighbourhood of α₁^± ∪ α₂ together with the annulus, a torus T° with one boundary circle containing y (Euler characteristics: (3 − 2g) + (−1) = 2 − 2g).
6. The monodromy around ∂T° = ∂Y² is trivial; β₁ crosses α₁ once, so λ(Cov(β₁)) = ±λ(generator); β₂ crosses α₂ once and not α₁, so Cov(β₂) = ±1 ∈ 𝔽_q^+. Conjugating fixes the fixed point of Cov(β₁) at 0 and Cov(β₂) = +1 (replace β₂ by its inverse if necessary).
7. π₁(Y ∖ {y}) is the amalgam of π₁(S°_{g−1}) and π₁(T° ∖ {y}) over ∂ (van Kampen); Cov kills π₁(S°_{g−1}) and ∂, so it factors through π₁(T° ∖ {y})/⟨⟨∂⟩⟩ = π₁(T ∖ {y}), free on β₁, β₂.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid — AlgebraicTopology Stage 1 (van Kampen theorem and group presentations); tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality — AlgebraicTopology Stage 6 (cohomology, products, Poincaré duality, intersection pairing); tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group — GeometricTopology Layer 1 (cutting and gluing manifolds along submanifolds). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.9/affine-cover`; `MordellLawrenceVenkatesh:LV.9/boundary-fixing-symplectic-surjective`; `MordellLawrenceVenkatesh:LV.5/primitive-classes-simple`; `MordellLawrenceVenkatesh:LV.5/surface`; `MordellLawrenceVenkatesh:LV.5/change-of-coordinates`; `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence`; `MordellLawrenceVenkatesh:LV.0/affine-group`; `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid`; `MordellLawrenceVenkatesh:LV.5/surface-homology`; `MordellLawrenceVenkatesh:LV.9/primitive-integral-lift`.

**Acceptance.**

- g = 2, q = 3: T° carries an S₃-cover of the once-punctured torus with Cov(β₁) = (x ↦ −x), Cov(β₂) = (x ↦ x + 1).
- Two normal forms with c₁ = c₂ give isomorphic covers.

**Sources.**

- lv2020, §8.4, p. 43: The first cut.
- lv2020, §8.4, p. 45: Splitting over the genus g − 1 part.
- lv2020, §8.4, Proposition 8.5, p. 45: Statement.
- lv2020, §8.4, Proposition 8.5, p. 45: Statement.

**Planet:** Normal form of affine covers.

**Signature gap:** Named theorem interfaces — LV.9.

### Curves on the torus part of the normal form (LV Lemma 8.11)

**Node:** `MordellLawrenceVenkatesh:LV.9/normal-form-curves` · lemma; implementation unchecked.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y. In the normal form, fix p ∈ ∂T°, a labelling of the fibre over p by 𝔽_q with Cov(β₁) = (x ↦ cx), Cov(β₂) = (x ↦ x + 1). There are simple closed curves γ_j (0 ≤ j ≤ q) on T° ∖ {y}, based at p and meeting ∂T° only at p, such that: (i) λ(Cov(γ_j)) = c for all j; (ii) Cov(γ_j) fixes exactly j modulo q (for j = q: fixes 0); (iii) the classes of the degree-one lifts γ_j⁺ span H₁ of the restricted cover T̃° modulo the homology of its boundary; (iv) all γ_j have the same germs at p.

**Hypotheses.** Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y.; normal form fixed.

**Construction or proof.**

1. Let d be a push-off of β₂ into the interior of T° ∖ {y}, on the side away from y, crossing β₁ once near the end of β₁. Then T_d^k(β₁) is a simple loop at p representing β₁β₂^k (with the twist direction chosen accordingly), for every k ≥ 0, and it has the germs of β₁ at p because T_d is supported away from p.
2. Cov(β₁β₂^k) = (x ↦ c(x + k)) fixes ck/(1 − c). The map k ↦ k* := [ck/(1 − c)] (k < q), q* := q, is a bijection of [0, q]; put γ_{k*} := T_d^k(β₁). This gives (i), (ii), (iv).
3. (iii): the covering of T° extends over the torus T with a single point over y, so it suffices that the lifts span H₁ of the covering T̃ of T ∖ {y} (compare H₁(T̃°)/H₁(∂T̃°) with H₁(T̃)). The group π₁(T̃ ∖ {pt}, p̃) is the stabilizer H of 0 in the free group ⟨β₁, β₂⟩, and the lift of γ_j corresponds to β₂^{−j*}β₁β₂^{j+j*} ∈ H.
4. In the abelianization, the j=0 word is β₁ and the j=q word is β₂^(−q) β₁ β₂^(2q), whose difference from β₁ is β₂^q. Schreier gives H generated by β₂^q and β₂^(−[cj])β₁β₂^j for 0≤j<q. The bijection between pairs of exponents modulo q changes each word only by left or right powers of β₂^q, so these words are in the subgroup generated by β₂^q and the lifted words. Thus the lifted homology classes span H_ab. This does not assert that those homology classes themselves generate the nonabelian H.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.9/affine-cover-normal-form`; `MordellLawrenceVenkatesh:LV.5/dehn-twist`; `MordellLawrenceVenkatesh:LV.5/covering-dehn-twist-lift`; `mathlib:Subgroup.closure_mul_image_eq`; `MordellLawrenceVenkatesh:LV.5/simple-closed-curve`.

**Acceptance.**

- q = 3, c = −1: Cov(β₁β₂^k) = (x ↦ −x − k) fixes −k/2.
- The γ_j have classes (1, k) in H₁(T), and their lifts span a lattice of rank 2 + (q − 1) in H₁(T̃).

**Sources.**

- lv2020, §8.6, Lemma 8.11, p. 48: Statement.
- lv2020, §8.6, proof of Lemma 8.11, p. 49: LV assert this from a picture; the node realizes the curves as twists T_d^k(β₁).
- lv2020, §8.6, proof of Lemma 8.11, p. 50: The group-theoretic step.

**Signature gap:** Named theorem interfaces — LV.9.

### Primitive integral lift of a cyclic quotient

**Node:** `MordellLawrenceVenkatesh:LV.9/primitive-integral-lift` · lemma; implementation unchecked.

Let r≥2 and N≥1. Every surjective homomorphism ℤ^r → ℤ/N has a lift ℤ^r → ℤ that is surjective (a primitive integral covector).

**Hypotheses.** r≥2; N≥1; the cyclic quotient map is surjective.

**Construction or proof.**

1. Choose integer coordinate lifts a₁,…,aᵣ. Their joint gcd with N is 1. If needed, add N to one of a₂,…,aᵣ to make g=gcd(a₂,…,aᵣ) nonzero.
2. For each prime dividing g and N, a₁ is already nonzero modulo that prime. For each prime dividing g but not N, choose k so a₁+Nk is nonzero modulo that prime; use the Chinese remainder theorem for the finitely many choices.
3. Then gcd(a₁+Nk,a₂,…,aᵣ)=1, so Bézout gives a surjective integral covector reducing to the given cyclic quotient. Extend a primitive covector to a unimodular basis for its use in normal forms.

**Prerequisites.** The elementary field/module carrier specified above..

**Acceptance.**

- For (2,2) mod 3, replace the first coefficient by 5 to obtain gcd(5,2)=1.
- Rank one would be false: multiplication by 2 on ℤ/5 has no surjective integral lift.

**Sources.**

- lv2020, §8.4, p. 43: The source asserts a primitive integral lift; this supplies its number-theoretic proof and the necessary rank bound.

### Transfer complement and symplectic primitive homology

**Node:** `MordellLawrenceVenkatesh:LV.9/primitive-homology-decomposition` · lemma; implementation unchecked.

Let π : Z → Y be a finite covering of positive degree q between closed oriented surfaces (allowing disconnected source), orientation-preserving away from the branch points, possibly branched over finitely many points. With rational coefficients, π_* : H₁(Z) → H₁(Y) and the transfer π^* : H₁(Y) → H₁(Z) satisfy π_*π^* = q, ⟨π^*a, π^*b⟩ = q⟨a, b⟩ and ⟨π^*a, x⟩ = ⟨a, π_*x⟩ for the intersection forms. Hence H₁(Z) = π^*H₁(Y) ⊕ H₁^Pr(Z, Y) with H₁^Pr(Z, Y) := ker π_* = (π^*H₁(Y))^⊥, the projection onto H₁^Pr is x ↦ x − q⁻¹π^*π_*x, and the intersection form restricts to a symplectic form on H₁^Pr(Z, Y). Homeomorphisms of Z covering homeomorphisms of Y preserve the decomposition.

**Hypotheses.** π finite covering of closed oriented surfaces, possibly branched; The degree q is positive, and the covering is orientation-preserving away from its branch points; the source may be a finite disjoint union of closed oriented surfaces..

**Construction or proof.**

1. Define π^* on the unbranched part (AlgebraicTopology Stage 5 transfer) and use that removing finitely many points from a closed surface, or their preimages, does not change H₁ modulo the classes of small loops, which are zero in the closed surface.
2. π_*π^* = q is the degree; the projection formula ⟨π^*a, x⟩ = ⟨a, π_*x⟩ holds for transverse cycles by counting preimages of intersection points; ⟨π^*a, π^*b⟩ = q⟨a, b⟩ follows.
3. Hence π^* is injective, π^*H₁(Y) ∩ ker π_* = 0, and the decomposition and orthogonality follow by dimension count; nondegeneracy on ker π_* follows from nondegeneracy on H₁(Z) and on π^*H₁(Y).

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent — AlgebraicTopology Stage 5 (covers, transfer, fibrations); tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality — AlgebraicTopology Stage 6 (cohomology, products, Poincaré duality, intersection pairing). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.9/affine-cover`; `MordellLawrenceVenkatesh:LV.5/surface`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `MordellLawrenceVenkatesh:LV.5/surface-homology`; `MordellLawrenceVenkatesh:LV.9/primitive-homology`.

**Owner proposal.** tauceti:TauCetiRoadmap/AlgebraicTopology; General rational branched-cover homology; retain IDs until the Part II transfer is accepted.

**Acceptance.**

- A trivial (disconnected) cover of degree q: H₁^Pr = {(x_i) : Σ x_i = 0}.
- For a singly ramified Aff(q)-cover of a genus-g surface, dim H₁^Pr = 2g(Z) − 2g = (2g − 1)(q − 1).

**Sources.**

- lv2020, §8.2, p. 39: The splitting.
- lv2020, §8.2, pp. 39–40: Orthogonality and the induced form.

**Signature gap:** Named theorem interfaces — LV.9.

### Exact follow-ups for LV.9

- Supply/resolve LV-import-39 — Surface triangulation, collars and tameness (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-41 — Surface homology basis and pairing (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-44 — Fibration sequences and surface asphericity (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-67 — Rational branched-cover transfer (exact interface and affected nodes are in gaps).
- Supply/resolve Topological surface classification proof interfaces (exact interface and affected nodes are in gaps).
- Supply/resolve Mapping-class prerequisites beyond smooth gluing (exact interface and affected nodes are in gaps).
- Supply/resolve Generic projector and relative Prym comparisons (exact interface and affected nodes are in gaps).
- Supply/resolve Surface isotopy quotient signatures (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — symplectic-transvection (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — surface (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — mapping-class-group (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — dehn-twist (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — point-push (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — simple-closed-curve (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — affine-cover (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — primitive-homology (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — lifted-monodromy (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — liftable-curve (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.0 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.5 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.9 (exact interface and affected nodes are in gaps).
- Resolve exact supplier contracts LV-import-39, LV-import-40, LV-import-41, LV-import-42, LV-import-43, LV-import-44, LV-import-45, LV-import-67, LV-import-68, LV-import-69, LV-import-70; the stage imports name plans, not proofs.

## LV.10 — The monodromy theorem for Kodaira–Parshin families

### Point-pushing acts non-centrally on each factor (LV Lemma 8.6)

**Node:** `MordellLawrenceVenkatesh:LV.10/push-monodromy-noncentral` · lemma; implementation unchecked.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, Z_1, …, Z_N represent the isomorphism classes of singly ramified Aff(q)-covers of (Y, y), and Mon, Mod(Y ∖ {y})', π₁(Y, y)' are as in LV.9. For every i, the image of π₁(Y, y)' under Mon_{Z_i} ∘ Push is not contained in the centre {±1} of Sp(H₁^Pr(Z_i, Y)); more precisely it contains a nontrivial unipotent element.

**Hypotheses.** Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, Z_1, …, Z_N represent the isomorphism classes of singly ramified Aff(q)-covers of (Y, y), and Mon, Mod(Y ∖ {y})', π₁(Y, y)' are as in LV.9..

**Construction or proof.**

1. Put Z = Z_i in normal form (LV.9) and choose a nonseparating simple closed curve w in S°_{g−1} (g − 1 ≥ 1) and a curve w' in S°_{g−1} meeting w once. Finger-move w along an arc to y to get a simple loop γ at y, isotopic to w in Y, whose left push-off a is isotopic to w in Y ∖ {y} and whose right push-off b bounds, together with a, an annulus containing y (Farb–Margalit Fact 4.7). Then Push(γ) = T_a T_b⁻¹.
2. Cov(a) = Cov(w) = 1 and Cov(b) is conjugate to Cov(a) times the monodromy around y, a q-cycle. So a lifts to the q copies w_1, …, w_q of w in the copies of S°_{g−1}, b lifts to one circle b̃ of degree q, and T_a^q T_b^{−q} lifts to ∏_j T_{w_j}^q · T_{b̃}⁻¹ (LV.5). The preimage of the annulus is a sphere with q + 1 holes (Riemann–Hurwitz), so Σ_j [w_j] = [b̃] in H₁(Z).
3. Hence u := Mon_Z(Push(γ)^q) acts on H₁(Z) by x ↦ x + q Σ_j ⟨x, w_j⟩w_j − ⟨x, b̃⟩b̃ = x + Σ_{j,l} (qδ_{jl} − 1)⟨x, w_j⟩w_l. For x = [w'_1] (the copy of w' in the first sheet), ⟨x, w_j⟩ = ±δ_{1j}, and (u − 1)x = ±((q − 1)w_1 − Σ_{l≠1} w_l) ≠ 0 because the w_l are linearly independent (LV Lemma 8.2). So u is a nontrivial unipotent on H₁(Z).
4. u is the identity on π^*H₁(Y) (lifts of point-pushes) and preserves the decomposition, so u is a nontrivial unipotent on H₁^Pr(Z, Y).
5. π₁(Y, y)' has finite index k in π₁(Y, y) and is normal, so γ^{qk!} ∈ π₁(Y, y)' and Mon_Z(Push(γ^{qk!})) = u^{k!}, a nontrivial unipotent (characteristic zero), which is not ±1.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.9/affine-cover-normal-form`; `MordellLawrenceVenkatesh:LV.9/lifted-monodromy`; `MordellLawrenceVenkatesh:LV.9/preimage-classes-independent`; `MordellLawrenceVenkatesh:LV.9/primitive-homology`; `MordellLawrenceVenkatesh:LV.5/birman-exact-sequence`; `MordellLawrenceVenkatesh:LV.5/covering-dehn-twist-lift`; `MordellLawrenceVenkatesh:LV.5/dehn-twist-homology`; `MordellLawrenceVenkatesh:LV.5/change-of-coordinates`; `tauceti:LinearMap.GeneralLinearGroup.IsUnipotent`; `MordellLawrenceVenkatesh:LV.9/primitive-homology-decomposition`.

**Acceptance.**

- q = 3, g = 2: u − 1 has rank 2 on the 6-dimensional primitive homology (the matrix qI − J on the three copies has rank q − 1 = 2).
- LV leave this lemma to the reader and sketch an argument via the theorem of the fixed part, Torelli and de Franchis; the node gives a topological proof.

**Sources.**

- lv2020, §8.5, Lemma 8.6, p. 46: Statement.
- lv2020, §8.5, proof of Lemma 8.6, p. 46: The source gives no proof; the node supplies one.
- farb-margalit, §4.2, Fact 4.7, p. 103: Push as a product of twists.

**Signature gap:** Named theorem interfaces — LV.10.

### Distinct covers are distinguished by the cycle type along a simple closed curve (LV Lemma 8.8)

**Node:** `MordellLawrenceVenkatesh:LV.10/covers-distinguished-by-curve` · lemma; implementation unchecked.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, Z_1, …, Z_N represent the isomorphism classes of singly ramified Aff(q)-covers of (Y, y), and Mon, Mod(Y ∖ {y})', π₁(Y, y)' are as in LV.9. For non-isomorphic Z₁, Z₂ among the Z_i there is a nonseparating simple closed curve η ⊂ Y ∖ {y} such that Cov₁(η) and Cov₂(η) have different cycle types.

**Hypotheses.** Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, Z_1, …, Z_N represent the isomorphism classes of singly ramified Aff(q)-covers of (Y, y), and Mon, Mod(Y ∖ {y})', π₁(Y, y)' are as in LV.9..

**Construction or proof.**

1. Case 1: λ₁ := λ ∘ Cov₁ and λ₂ := λ ∘ Cov₂, as maps H₁(Y; ℤ) → 𝔽_q^×, have different kernels. Choose a basis e_1, …, e_{2g} of H₁(Y; ℤ) with ker λ₁ = ⟨(q − 1)e_1, e_2, …⟩; some e_j (j ≥ 2) is not in ker λ₂. A simple closed curve η representing e_j (primitive) has Cov₁(η) ∈ 𝔽_q^+ (cycle type (1^q) or (q)) and λ₂(Cov₂(η)) ≠ 1 (cycle type (1, r, …, r), r > 1).
2. Case 2: equal kernels. Cut Y along the same α₁ for both covers (LV.9 normal form), normalize Cov_i(b₊) = 1, and let g_i : H₁(Y¹; ℤ) → 𝔽_q^+ be the induced maps. If g₁ ≠ g₂, pick a class v_s of a geometric symplectic basis of the capped part with g₁(v_s) ≠ g₂(v_s), and k ≡ −g₁(v_s) mod q; by LV Lemma 8.4 the class v_s + k b₊ is represented by a simple closed curve η ⊂ Y¹, nonseparating in Y, with Cov₁(η) = 1 and Cov₂(η) a q-cycle.
3. Case 3: g₁ = g₂. Cut along the same α₂, so both covers are in normal form on the same decomposition Y = S°_{g−1} ∪ T°, with Cov_i(β₁) = (x ↦ c_i x), Cov_i(β₂) = (x ↦ x + 1) and c₁ ≠ c₂ (otherwise Cov₁ = Cov₂, since both factor through the free group ⟨β₁, β₂⟩).
4. In T° ∖ {y} choose disjoint simple arcs ℓ₁, ℓ₂ from ∂T° to ∂T°, parallel copies of β₂ separated by y, whose closures in T ∖ {y} represent β₂ and β₁β₂β₁⁻¹; in S°_{g−1} choose simple arcs w, w' joining their endpoints on ∂, disjoint from each other except for one transverse crossing (possible since g − 1 ≥ 1). The closed curves d := ℓ₁ ∪ w and x := ℓ₂ ∪ w' are simple, nonseparating, and cross exactly once.
5. For m ≥ 1, η := T_d^m(x) is simple; as a free loop it is x·d^{±m}, and its image under the collapse π₁(Y ∖ {y}) → π₁(T ∖ {y}) is conjugate to β₁β₂β₁⁻¹β₂^{±m}. Hence Cov_i(η) is conjugate to translation by c_i^{±1} ± m (the exponent of c_i fixed by the composition convention). Choose m ∈ [1, q − 1] with c₁^{±1} ± m ≡ 0: Cov₁(η) = 1 while Cov₂(η) is translation by c₂^{±1} − c₁^{±1} ≠ 0, a q-cycle. The class of η is [x] ± m[d], whose S_{g−1}-component [w'] ± m[w] is primitive, so η is nonseparating.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid — AlgebraicTopology Stage 1 (van Kampen theorem and group presentations). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.9/affine-cover-normal-form`; `MordellLawrenceVenkatesh:LV.9/boundary-fixing-symplectic-surjective`; `MordellLawrenceVenkatesh:LV.9/affine-cover`; `MordellLawrenceVenkatesh:LV.5/primitive-classes-simple`; `MordellLawrenceVenkatesh:LV.5/dehn-twist`; `MordellLawrenceVenkatesh:LV.5/change-of-coordinates`; `MordellLawrenceVenkatesh:LV.0/affine-group-cycle-type`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid`; `MordellLawrenceVenkatesh:LV.5/simple-closed-curve`.

**Acceptance.**

- q = 3: Aff(3) = S₃ and cycle types (1³), (3), (1, 2) are all realized.
- LV draw the curve of case 3 for exponent 2 (their Figure 4); the node constructs it for every exponent as a twist of x about d.

**Sources.**

- lv2020, §8.5, Lemma 8.8, p. 47: Statement.
- lv2020, §8.5, proof of Lemma 8.8, p. 47: Case 3 in LV, justified by a figure.
- lv2020, §8.5, proof of Lemma 8.8, p. 47: Conclusion.

**Signature gap:** Named theorem interfaces — LV.10.

### A connected spanning system of liftable curves (LV Lemma 8.10)

**Node:** `MordellLawrenceVenkatesh:LV.10/liftable-curve-system` · lemma; implementation unchecked.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, Z_1, …, Z_N represent the isomorphism classes of singly ramified Aff(q)-covers of (Y, y), and Mon, Mod(Y ∖ {y})', π₁(Y, y)' are as in LV.9. For a singly ramified Aff(q)-cover Z there are liftable curves A_1, …, A_M on Y ∖ {y} such that (a) the classes Ã_s span H₁^Pr(Z, Y), and (b) the graph with an edge between A_s and A_t whenever Ã_s·Ã_t ≠ 0 is connected.

**Hypotheses.** Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, Z_1, …, Z_N represent the isomorphism classes of singly ramified Aff(q)-covers of (Y, y), and Mon, Mod(Y ∖ {y})', π₁(Y, y)' are as in LV.9..

**Construction or proof.**

1. Put Z in normal form with base point p ∈ ∂D ≅ ∂D' and take the curves γ_j of LV Lemma 8.11; label the sheets of the trivial cover over S°_{g−1} by 𝔽_q using the labelling at p.
2. Let W be a set of simple loops at p in S°_{g−1}, one for each primitive class. For w ∈ W, one of γ_j·w^{±1} is represented by a simple closed curve A(w, j) (smooth the concatenation at p; the branches of γ_j and w lie on opposite sides of ∂, and by (iv) the admissible sign depends only on w). Its monodromy has linear part c, so A(w, j) is liftable, with [A(w, j)⁺] = [γ_j⁺] ± [w_j] (w_j the lift of w to the j-th sheet).
3. For each sheet j, differences of [A(w,j)⁺] as w varies are the differences of signed primitive representatives. Apply signed-primitive-spanning, rather than assuming arbitrary signed basis differences span. Combine this with Lemma 8.11 and Mayer–Vietoris to span H₁(Z;ℚ), then project to primitive homology.
4. The projected intersection equals a constant plus ±(δⱼₖ−1/q) times the intersection of the sheet classes. The coefficient is nonzero. Apply primitive-intersection-avoidance to the two nonzero integral linear forms given by pairing against w₁ and w₂, making both products dominate their fixed constants. Either chosen sign works. Thus every two vertices have a common adjacent vertex.
5. Finally choose finitely many vertices spanning the finite-dimensional primitive homology and finitely many paths in the connected graph joining them. Their union is the finite connected spanning system required by the statement.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-3-subdivision-excision-and-mayer--vietoris — AlgebraicTopology Stage 3 (excision and Mayer–Vietoris). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.9/normal-form-curves`; `MordellLawrenceVenkatesh:LV.9/affine-cover-normal-form`; `MordellLawrenceVenkatesh:LV.9/liftable-curve`; `MordellLawrenceVenkatesh:LV.9/primitive-homology`; `MordellLawrenceVenkatesh:LV.5/primitive-classes-simple`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-3-subdivision-excision-and-mayer--vietoris`; `MordellLawrenceVenkatesh:LV.10/signed-primitive-spanning`; `MordellLawrenceVenkatesh:LV.10/primitive-intersection-avoidance`; `MordellLawrenceVenkatesh:LV.9/primitive-homology-decomposition`; `MordellLawrenceVenkatesh:LV.9/liftable-curve-transvection`.

**Acceptance.**

- g = 2, q = 3: W can be taken to be the primitive classes of the genus-1 part, and finitely many A(w, j) already span the 6-dimensional primitive homology.
- The constant term [γ_j⁺]·[γ_k⁺] − q⁻¹[γ_j]·[γ_k] is bounded independently of w₃, which is what makes 'large enough' possible.

**Sources.**

- lv2020, §8.5, Lemma 8.10, p. 48: Statement.
- lv2020, §8.6, p. 50: The concatenated curves.
- lv2020, §8.6, p. 51: Part (b).

**Signature gap:** Named theorem interfaces — LV.10.

### Zariski density on one factor (LV Lemma 8.9)

**Node:** `MordellLawrenceVenkatesh:LV.10/lifted-monodromy-dense-factor` · lemma; implementation unchecked.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, Z_1, …, Z_N represent the isomorphism classes of singly ramified Aff(q)-covers of (Y, y), and Mon, Mod(Y ∖ {y})', π₁(Y, y)' are as in LV.9. For each i, the image of Mon_{Z_i} : Mod(Y ∖ {y})_{Z_i} → Sp(H₁^Pr(Z_i, Y)) is Zariski dense, and so is the image of every finite-index subgroup, in particular of Mod(Y ∖ {y})'.

**Hypotheses.** Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, Z_1, …, Z_N represent the isomorphism classes of singly ramified Aff(q)-covers of (Y, y), and Mon, Mod(Y ∖ {y})', π₁(Y, y)' are as in LV.9..

**Construction or proof.**

1. For the liftable curves A_s of LV Lemma 8.10 (liftable-curve-system), Mon(T_{A_s}^{q−1}) = T_{Ã_s}^q (LV.9), so the Zariski closure contains the root groups {T_{Ã_s}^r} (LV.0).
2. The Ã_s span and have connected intersection graph, so by LV Lemma 2.14 (LV.0) the closure is Sp(H₁^Pr(Z_i, Y)).
3. The closure of the image of a finite-index subgroup has the same identity component (ReductiveGroups Layer 3), and Sp is connected.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.10/liftable-curve-system`; `MordellLawrenceVenkatesh:LV.9/liftable-curve`; `MordellLawrenceVenkatesh:LV.9/lifted-monodromy`; `MordellLawrenceVenkatesh:LV.0/zariski-closure-transvection-powers`; `MordellLawrenceVenkatesh:LV.0/transvection-graph-closure`; `tauceti:TauCeti.Symplectic.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`; `MordellLawrenceVenkatesh:LV.9/liftable-curve-transvection`.

**Acceptance.**

- q = 3, g = 2: the closure is Sp₆ for each of the 135 covers.
- The q-th powers of the transvections T_{Ã_s} already have Zariski closure containing the full root groups.

**Sources.**

- lv2020, §8.5, Lemma 8.9, p. 47: Statement (LV write MCG(Y)_{Z_i}; the group is Mod(Y ∖ {y})_{Z_i}).

**Signature gap:** Named theorem interfaces — LV.10.

### Zariski density on the product (LV Lemma 8.7)

**Node:** `MordellLawrenceVenkatesh:LV.10/lifted-monodromy-dense-product` · lemma; implementation unchecked.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, Z_1, …, Z_N represent the isomorphism classes of singly ramified Aff(q)-covers of (Y, y), and Mon, Mod(Y ∖ {y})', π₁(Y, y)' are as in LV.9. The image of Mon : Mod(Y ∖ {y})' → ∏_i Sp(H₁^Pr(Z_i, Y)) is Zariski dense.

**Hypotheses.** Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, Z_1, …, Z_N represent the isomorphism classes of singly ramified Aff(q)-covers of (Y, y), and Mon, Mod(Y ∖ {y})', π₁(Y, y)' are as in LV.9..

**Construction or proof.**

1. Identify the factors (all of dimension (2g − 1)(q − 1)) with one symplectic space by symplectic isomorphisms; let G be the Zariski closure.
2. Each projection of G is Sp (one-factor density lemma; the projection of the closure is the closure of the projection).
3. For i ≠ j, the curve η of LV Lemma 8.8 gives different cycle types of Cov_i(η), Cov_j(η); for M a common multiple of the orders n_η for all Z_k, T_η^M ∈ Mod(Y ∖ {y})', and Mon_i(T_η^M), Mon_j(T_η^M) are unipotent with fixed spaces of different codimensions (LV Lemma 8.3).
4. LV Lemma 2.12 (LV.0, symplectic Goursat) gives G = ∏_i Sp.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.10/lifted-monodromy-dense-factor`; `MordellLawrenceVenkatesh:LV.10/covers-distinguished-by-curve`; `MordellLawrenceVenkatesh:LV.9/twist-rank-detects-cycle-type`; `MordellLawrenceVenkatesh:LV.9/lifted-monodromy`; `MordellLawrenceVenkatesh:LV.0/symplectic-goursat`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.

**Acceptance.**

- N = 1 is the one-factor density lemma.
- Without Lemma 8.8, the closure could be the graph of a conjugation between two factors.

**Sources.**

- lv2020, §8.5, Lemma 8.7, p. 46: Statement: the map has Zariski-dense image.

**Signature gap:** Named theorem interfaces — LV.10.

### Closed normal subgroups of products of symplectic groups

**Node:** `MordellLawrenceVenkatesh:LV.10/normal-subgroups-of-symplectic-products` · lemma; implementation unchecked.

Let k be an algebraically closed field of characteristic zero, (V_i, ω_i) (1 ≤ i ≤ N) symplectic spaces of dimension ≥ 2 and H ⊆ ∏_i Sp(V_i) a Zariski-closed normal subgroup whose projection to each factor is not contained in the centre {±1}. Then H = ∏_i Sp(V_i).

**Hypotheses.** char k = 0, k algebraically closed; projections non-central.

**Construction or proof.**

1. For h ∈ H with h_i ∉ {±1} and s in the i-th factor subgroup, the commutator [h, s] = (1, …, [h_i, s], …, 1) lies in H.
2. Let N_i be the closed subgroup generated by all commutators [h_i,s], s∈Sp(V_i). The identity [h_i,st]=[h_i,s]·s[h_i,t]s⁻¹ makes N_i normal. If it were central, the regular map s↦[h_i,s] from connected Sp(V_i) to {±1} would be constant with value 1, forcing h_i central, a contradiction.
3. Closed normal subgroups of Sp(V_i) are Sp(V_i) or central (ReductiveGroups Layer 6), so H contains the i-th factor subgroup for every i.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components); tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups — ReductiveGroups Layer 6 (reductive and semisimple groups, centres). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `tauceti:TauCeti.Symplectic.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

**Owner proposal.** tauceti:TauCetiRoadmap/ReductiveGroups; Reusable linear/group theory; compare pinned carriers before transfer. Current accepted IDs remain stable.

**Acceptance.**

- N = 1: a closed normal subgroup of Sp(V) containing a non-central element is Sp(V).
- The subgroup {±1}^N is normal and central in each factor, so the hypothesis is needed.

**Sources.**

- lv2020, §8.5, p. 46: The group theory used to pass from Lemma 8.7 to Theorem 8.1.

**Signature gap:** Named theorem interfaces — LV.10.

### Zariski density of the point-pushing monodromy (LV Theorem 8.1)

**Node:** `MordellLawrenceVenkatesh:LV.10/push-monodromy-dense` · theorem; implementation unchecked.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, Z_1, …, Z_N represent the isomorphism classes of singly ramified Aff(q)-covers of (Y, y), and Mon, Mod(Y ∖ {y})', π₁(Y, y)' are as in LV.9. The map Mon ∘ Push : π₁(Y, y)' → ∏_{i=1}^N Sp(H₁^Pr(Z_i, Y)) has Zariski-dense image.

**Hypotheses.** Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, Z_1, …, Z_N represent the isomorphism classes of singly ramified Aff(q)-covers of (Y, y), and Mon, Mod(Y ∖ {y})', π₁(Y, y)' are as in LV.9..

**Construction or proof.**

1. Push(π₁(Y, y)) = ker(Forget) is normal in Mod(Y ∖ {y}), so Push(π₁(Y, y)') = Push(π₁(Y, y)) ∩ Mod(Y ∖ {y})' is normal in Mod(Y ∖ {y})'.
2. The Zariski closure H of its image is therefore normal in the closure of Mon(Mod(Y ∖ {y})'), which is ∏_i Sp by LV Lemma 8.7 (subgroups normalizing a group normalize its closure).
3. By LV Lemma 8.6 each projection of H is non-central; the lemma on closed normal subgroups of symplectic products gives H = ∏_i Sp.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.10/push-monodromy-noncentral`; `MordellLawrenceVenkatesh:LV.10/lifted-monodromy-dense-product`; `MordellLawrenceVenkatesh:LV.10/normal-subgroups-of-symplectic-products`; `MordellLawrenceVenkatesh:LV.9/lifted-monodromy`; `MordellLawrenceVenkatesh:LV.5/birman-exact-sequence`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.

**Acceptance.**

- q = 3, g = 2: the closure is a product of 135 copies of Sp₆.
- The theorem is the topological form of full monodromy for the Kodaira–Parshin family.

**Sources.**

- lv2020, §8.2.2, Theorem 8.1, p. 41: Statement (the map (8.5)).

**Planet:** Point-pushing monodromy theorem.

**Signature gap:** Named theorem interfaces — LV.10.

### The Kodaira–Parshin family has full monodromy (LV §8.2.3)

**Node:** `MordellLawrenceVenkatesh:LV.10/kodaira-parshin-full-monodromy` · theorem; implementation unchecked.

Let Y be a smooth projective geometrically connected curve of genus g ≥ 2 over a number field K ⊂ ℂ and q ≥ 3 a prime. The Kodaira–Parshin family X_q → Y'_q → Y has full monodromy: for y ∈ Y(ℂ), the Zariski closure of the monodromy of π₁(Y(ℂ), y) on H¹_B(X_{q,y}(ℂ), ℚ) = ⊕_{y' ↦ y} H¹_B(X_{q,y'}(ℂ), ℚ) contains ∏_{y'} Sp(H¹_B(X_{q,y'}(ℂ)), ω_{y'}).

**Hypotheses.** g ≥ 2; q ≥ 3 prime.

**Construction or proof.**

1. Y(ℂ) is a closed surface of genus g (LV.8). The fibre π⁻¹(y) is the set of Aff(q)-conjugacy classes of surjections π₁(Y(ℂ) ∖ {y}) → Aff(q) nontrivial at y, which is in bijection with the singly ramified Aff(q)-covers Z_1, …, Z_N via y' ↦ Z_{q,y'} ×^{Aff(q)} 𝔽_q (LV.9).
2. The analytic Kodaira–Parshin curve family restricted to Y(ℂ) is the configuration family of LV.5 attached to the Hurwitz covering (LV.8); so the monodromy of γ ∈ π₁(Y(ℂ), y) permutes the y' as Push(γ) permutes the Z_i, and for γ ∈ π₁(Y, y)' it acts on the y'-summand of H₁ by the lift of Push(γ), which is unique on the degree-q quotient (trivial centralizer) and commutes with the Aff(q)-action on Z_{q,y'}.
3. The identification H₁(X_{q,y'}(ℂ), ℚ) ≅ H₁^Pr(Z_i, Y; ℚ) (LV.8) is natural for such lifts and matches the polarization with the intersection form up to a nonzero factor; so on π₁(Y, y)' the monodromy on ⊕_{y'} H₁(X_{q,y'}) is Mon ∘ Push, and the monodromy on H¹_B is its contragredient.
4. By LV Theorem 8.1 the Zariski closure of the image of π₁(Y, y)' is ∏ Sp; dualizing preserves this, and the image of π₁(Y(ℂ), y) contains that of π₁(Y, y)'. This is LV (5.1), and full monodromy does not depend on y or ι.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.10/push-monodromy-dense`; `MordellLawrenceVenkatesh:LV.8/kodaira-parshin-family`; `MordellLawrenceVenkatesh:LV.8/hurwitz-space`; `MordellLawrenceVenkatesh:LV.8/hurwitz-cover-complex`; `MordellLawrenceVenkatesh:LV.8/reduced-prym-homology`; `MordellLawrenceVenkatesh:LV.8/curve-topological-genus`; `MordellLawrenceVenkatesh:LV.9/affine-cover`; `MordellLawrenceVenkatesh:LV.9/lifted-monodromy`; `MordellLawrenceVenkatesh:LV.5/configuration-family-monodromy`; `MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group`; `AbelianSchemesAndArithmeticModuli:A5`; `ComplexComparisonPartII:C5`.

**Acceptance.**

- q = 3, g = 2: the closure contains a product of 135 copies of Sp₆.
- Property (i) before LV Theorem 5.4.

**Sources.**

- lv2020, §8.2.3, p. 41: The comparison with primitive homology.
- lv2020, §8.2.3, p. 41: The conclusion.
- lv2020, §5, p. 26: Property (i).

**Planet:** Full monodromy of Kodaira–Parshin families.

**Signature gap:** Named theorem interfaces — LV.10.

### Signed primitive lattice representatives affinely span

**Node:** `MordellLawrenceVenkatesh:LV.10/signed-primitive-spanning` · lemma; implementation unchecked.

Let r≥2. Choose one signed representative ε(v)v from each pair {v,−v} of primitive vectors of ℤ^r. The differences of these representatives span ℚ^r.

**Hypotheses.** r≥2; one sign representative of every primitive unoriented vector.

**Construction or proof.**

1. If a rational linear functional ℓ has constant value c on the chosen representatives, then ℓ(v)∈{c,−c} on every primitive vector.
2. For i≠j every eᵢ+n eⱼ is primitive, for all integers n. The sequence ℓ(eᵢ)+nℓ(eⱼ) taking only two values forces ℓ(eⱼ)=0. Vary j to conclude ℓ=0 and c=0.
3. The annihilator of the span of all differences is zero; finite-dimensional duality proves it is the entire rational space. This is a rational spanning claim, not an integral index-one claim.

**Prerequisites.** The elementary field/module carrier specified above..

**Acceptance.**

- For rank two, arbitrary signs still give rational affine span ℚ².
- Rank one is excluded: one signed representative gives no nonzero difference.

**Sources.**

- lv2020, §8.6, p. 50: Justifies the unsigned-to-signed spanning assertion in the liftable curve argument.

### Primitive vectors avoiding two intersection constraints

**Node:** `MordellLawrenceVenkatesh:LV.10/primitive-intersection-avoidance` · lemma; implementation unchecked.

On ℤ^r with r≥2, let ℓ₁,ℓ₂ be nonzero rational linear forms. For every bound B there is a primitive integral vector w with |ℓ₁(w)|>B and |ℓ₂(w)|>B.

**Hypotheses.** r≥2; both rational linear forms are nonzero.

**Construction or proof.**

1. Choose u=(1,n,n²,…,n^(r−1)) outside the finitely many roots of the two nonzero evaluation polynomials. Then u is primitive and both forms are nonzero on u.
2. Extend u to an integral basis and let v be another basis vector. Every w=v+m u is primitive, since its coordinates in this basis include 1.
3. As |m| grows both absolute values tend to infinity. Signs assigned to primitive representatives leave these absolute values unchanged.

**Prerequisites.** The elementary field/module carrier specified above..

**Acceptance.**

- For the standard symplectic lattice of rank two, use this with the pairing against any two nonzero primitive classes.
- A zero form would make the conclusion false.

**Sources.**

- lv2020, §8.6, p. 51: Supplies the simultaneous large-intersection step, with primitivity retained.

### Exact follow-ups for LV.10

- Supply/resolve LV-import-01 — Closures of abstract algebraic subgroups (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-02 — Lie differentials and connected subgroup equality (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-03 — Normal subgroups of symplectic groups (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-04 — Symplectic Lie structure and transvections (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-28 — Spreading polarized families and good models (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-32 — Algebraic group orbits and transporters (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-39 — Surface triangulation, collars and tameness (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-41 — Surface homology basis and pairing (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-44 — Fibration sequences and surface asphericity (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-55 — Analytic normalization of finite covers (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-57 — Finite étale Riemann existence and base change (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-59 — Peripheral inertia and finite cohomology action (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-60 — Finite normalization over excellent schemes (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-63 — Relative norm-kernel identity components (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-67 — Rational branched-cover transfer (exact interface and affected nodes are in gaps).
- Supply/resolve Topological surface classification proof interfaces (exact interface and affected nodes are in gaps).
- Supply/resolve Mapping-class prerequisites beyond smooth gluing (exact interface and affected nodes are in gaps).
- Supply/resolve Generic projector and relative Prym comparisons (exact interface and affected nodes are in gaps).
- Supply/resolve Distinguishing-curve disjoint-arc realization (exact interface and affected nodes are in gaps).
- Supply/resolve Surface isotopy quotient signatures (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — symplectic-transvection (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — abelian-by-finite-family (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — good-model (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — de-rham-bundle (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — gauss-manin-transport-complex (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — algebraic-monodromy-group (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — surface (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — mapping-class-group (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — dehn-twist (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — point-push (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — simple-closed-curve (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — singly-ramified-surjections (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — hurwitz-cover-complex (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — reduced-prym (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — kodaira-parshin-family (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — affine-cover (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — primitive-homology (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — lifted-monodromy (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — liftable-curve (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.0 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.2 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.5 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.8 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.9 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.10 (exact interface and affected nodes are in gaps).
- Resolve exact supplier contracts LV-import-01, LV-import-02, LV-import-03, LV-import-04, LV-import-19, LV-import-20, LV-import-21, LV-import-22, LV-import-23, LV-import-28, LV-import-32, LV-import-33, LV-import-35, LV-import-39, LV-import-40, LV-import-41, LV-import-42, LV-import-43, LV-import-44, LV-import-45, LV-import-52, LV-import-53, LV-import-54, LV-import-55, LV-import-56, LV-import-57, LV-import-58, LV-import-59, LV-import-60, LV-import-61, LV-import-62, LV-import-63, LV-import-64, LV-import-65, LV-import-67, LV-import-68, LV-import-69, LV-import-70, LV-import-71, LV-import-74, LV-import-76; the stage imports name plans, not proofs.

## LV.11 — Faltings's theorem after Lawrence and Venkatesh

### Choice of the prime q (LV §5, conditions (i)–(iii))

**Node:** `MordellLawrenceVenkatesh:LV.11/admissible-prime` · lemma; implementation unchecked.

Let K be a number field with Galois closure K' over ℚ, g ≥ 2 and B > 0. There is a prime q > B such that: (i) 4 ∤ q − 1, and no odd prime ℓ < 8[K : ℚ] divides q − 1; (ii) no odd prime dividing q − 1 divides disc(K); consequently, writing q − 1 = 2m' (m' odd), ℚ(ζ_{q−1}) = ℚ(ζ_{m'}), K' ∩ ℚ(ζ_{q−1}) = ℚ and Gal(K'(ζ_{m'})/ℚ) ≅ Gal(K'/ℚ) × (ℤ/m')^× ≅ Gal(K'/ℚ) × (ℤ/(q − 1))^×; (iii) 8·2^{g+1}/(q − 1)^g < 1/((g − 1/2)(q − 1) + 1).

**Hypotheses.** K number field; g ≥ 2.

**Construction or proof.**

1. Let L be the set of odd primes ℓ with ℓ < 8[K : ℚ] or ℓ | disc(K), and N := 4∏_{ℓ∈L} ℓ. By Dirichlet's theorem there are primes q > B with q ≡ −1 mod N; then q − 1 ≡ 2 mod 4 and q − 1 ≡ −2 ≢ 0 mod ℓ for ℓ ∈ L, which gives (i) and (ii).
2. (ii): the primes ramified in K' are those ramified in K, i.e. those dividing disc(K) (Mathlib). The odd primes dividing q − 1 are unramified in K', so |disc K'| is coprime to m', and the Tau Ceti compositum isomorphism gives Gal(K'(ζ_{m'})/ℚ) ≅ Gal(K'/ℚ) × (ℤ/m')^×; also (ℤ/2m')^× = (ℤ/m')^× and ℚ(ζ_{2m'}) = ℚ(ζ_{m'}) since m' is odd.
3. (iii): the left side is O(q^{−g}) and the right side is of order q^{−1}; since g ≥ 2 the inequality holds for all large q.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — LocalFieldsRamification Layer 2 (unramified extensions and Frobenius). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `mathlib:Nat.forall_exists_prime_gt_and_eq_mod`; `mathlib:NumberField.not_dvd_discr_iff_isUnramifiedIn`; `mathlib:NumberField.exists_not_isUnramifiedIn`; `mathlib:IsCyclotomicExtension.Rat.ramificationIdx_eq_of_not_dvd`; `tauceti:IsCyclotomicExtension.Rat.prime_dvd_of_dvd_natAbs_discr`; `tauceti:IsCyclotomicExtension.galEquivProd`; `mathlib:ZMod.card_units_eq_totient`; `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

**Acceptance.**

- K = ℚ, g = 2: q = 107 is admissible: 106 = 2·53, none of 3, 5, 7 divides 106, and 64/106² ≈ 0.00570 < 1/160 = 0.00625.
- K = ℚ, g = 2: the least q ≡ −1 mod 420 is 419 (418 = 2·11·19), also admissible.

**Sources.**

- lv2020, §5, proof of Theorem 5.4, p. 26: The choice of q.
- lv2020, §5, proof of Theorem 5.4, p. 26: Linear disjointness; the node makes the role of the prime 2 explicit.

**Signature gap:** Named theorem interfaces — LV.11.

### Choice of the friendly place v (LV §5)

**Node:** `MordellLawrenceVenkatesh:LV.11/friendly-auxiliary-place` · lemma; implementation unchecked.

Let K and q be as in the lemma on the choice of q (admissible-prime) and T a finite set of places of K. There is a finite place v ∉ T of K such that: (a) v is friendly; (b) its residue characteristic p is odd, unramified in K and lies below no place of T; (c) (q_v, q − 1) = 1; (d) for every odd prime r | q − 1, the class of q_v in (ℤ/r)^× has order at least 8.

**Hypotheses.** q admissible in the sense of the choice-of-q lemma; T finite.

**Construction or proof.**

1. Choose σ ∈ Gal(K'/ℚ): if K has a CM subfield, let E be its largest CM subfield and E⁺ the maximal totally real subfield of E, and take σ ∈ Gal(K'/E⁺) acting nontrivially on E; otherwise take any σ.
2. By the Chinese remainder theorem choose a ∈ (ℤ/m')^× reducing to a primitive root modulo every prime r | m'.
3. By Chebotarev applied to K'(ζ_{m'})/ℚ and the class of (σ, a) (Tau Ceti Chebotarev Layer 10 with the compositum Frobenius lemma), there are infinitely many primes p, unramified in K'(ζ_{m'}), with a prime ℘ above p whose Frobenius restricts to σ on K' and with p ≡ a mod m'; exclude p = 2, the primes ramified in K and those below T.
4. Let v be the place of K below ℘ and f its residue degree, so q_v = p^f with f ≤ [K : ℚ]. (c): p is odd and prime to m'. (d): p has order r − 1 modulo r, so q_v has order (r − 1)/gcd(r − 1, f) ≥ (r − 1)/[K : ℚ] ≥ 8, since r ≥ 8[K : ℚ] + 1 by (i) of the choice-of-q lemma.
5. (a): if E exists, the decomposition group of ℘ in Gal(K'/ℚ) is generated by σ ∈ Gal(K'/E⁺), so the place of E⁺ below ℘ has residue degree 1 over p and its Frobenius in Gal(E/E⁺) is σ|_E ≠ 1; it is therefore inert in E, and v lies above it. In all cases v is unramified over ℚ.

Upstream Tau Ceti inputs, cited directly at their upstream owners: tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev — Chebotarev Layer 10 (Dirichlet-density Chebotarev, infinitude of every Frobenius class). Review: upstream edges identify ownership and requested contracts, not existing proofs; see supplier audit and open gaps.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.11/admissible-prime`; `MordellLawrenceVenkatesh:LV.1/friendly-place`; `MordellLawrenceVenkatesh:LV.1/largest-cm-subfield`; `tauceti:NumberField.Chebotarev.mem_frobeniusPrimeSet_galEquivProd_symm_iff`; `tauceti:AlgHom.IsArithFrobAt.autToPow_eq_absNorm`; `tauceti:IsCyclotomicExtension.galEquivProd`; `mathlib:Ideal.quotientInfRingEquivPiQuotient`; `mathlib:IsArithFrobAt`; `tauceti:NumberField.exists_isArithFrobAt`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Acceptance.**

- K = ℚ (no CM subfield): every odd prime p that is a primitive root modulo each prime factor of (q − 1)/2 works; for q = 107, 2 is a primitive root modulo 53, so any odd prime p ≡ 2 mod 53 works, for example p = 373 = 7·53 + 2. Any numerical auxiliary prime must also avoid the finite bad-reduction and ramification set; 373 is only usable when it avoids that set.
- K imaginary quadratic (a CM field): v must lie above a prime inert in K.

**Sources.**

- lv2020, §5, proof of Theorem 5.4, p. 27: The method.
- lv2020, §5, proof of Theorem 5.4, p. 27: Friendliness.

**Signature gap:** Named theorem interfaces — LV.11.

### The Weil pairing on H¹(Y, ℤ/(q − 1)) and the Frobenius at v

**Node:** `MordellLawrenceVenkatesh:LV.11/weil-pairing-frobenius` · lemma; implementation unchecked.

Let Y be a smooth projective geometrically connected curve of genus g over K with good reduction outside a finite set S of places, N ≥ 2, and v ∉ S a finite place with (q_v, N) = 1. Then M := H¹_et(Y_{K̄}, ℤ/N) is free of rank 2g over ℤ/N and unramified at v, it carries a perfect alternating G_K-equivariant pairing ⟨·,·⟩ : M × M → μ_N^∨ := Hom(μ_N, ℤ/N), and the Frobenius T := Frob_v satisfies ⟨Tm₁, Tm₂⟩ = q_v⁻¹⟨m₁, m₂⟩.

**Hypotheses.** good reduction at v; (q_v, N) = 1.

**Construction or proof.**

1. Poincaré duality for curves with ℤ/N coefficients (cup product and the trace H²(Y_{K̄}, μ_N) ≅ ℤ/N) gives the perfect alternating equivariant pairing into Hom(μ_N, ℤ/N); freeness of rank 2g follows from H¹ = Hom(π₁^geom, ℤ/N) and the comparison with the topological fundamental group (LV.8).
2. Unramifiedness: smooth proper base change for the good model at v, N being invertible there.
3. The arithmetic Frobenius acts on μ_N by ζ ↦ ζ^{q_v}, hence on μ_N^∨ by multiplication by q_v⁻¹; equivariance of the pairing gives the relation.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.8/curve-topological-genus`; `EtaleDualityAndPerverseSheaves:EDC.2`; `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- N = 2: M ≅ Jac(Y)[2] (as μ₂ = ℤ/2) with the Weil pairing, and T preserves the pairing since q_v is odd.
- For an elliptic curve and N = q − 1, the relation is det T = q_v⁻¹ on H¹.

**Sources.**

- lv2020, §5, proof of Theorem 5.4, p. 27: The pairing.
- lv2020, §5, proof of Theorem 5.4, p. 27: The Frobenius relation ⟨Tv₁, Tv₂⟩ = q_v⁻¹⟨v₁, v₂⟩.

**Signature gap:** Named theorem interfaces — LV.11.

### Few elements lie in small Frobenius orbits

**Node:** `MordellLawrenceVenkatesh:LV.11/small-orbit-count` · lemma; implementation unchecked.

Let N = 2m' with m' odd, M a free ℤ/N-module of rank 2g with a perfect alternating pairing into a cyclic group C ≅ ℤ/N, and T an automorphism of M with ⟨Tm₁, Tm₂⟩ = u⟨m₁, m₂⟩ for a unit u ∈ (ℤ/N)^× such that u^i ≢ 1 mod r for every prime r | m' and 1 ≤ i ≤ 7. Then |ker(T^i − 1)| ≤ 2^g N^g for 1 ≤ i ≤ 7, and at most 7·2^g N^g ≤ 8·2^g N^g elements of M lie in T-orbits with fewer than 8 elements.

**Hypotheses.** N = 2m', m' odd; pairing perfect and alternating; u^i ≢ 1 mod r for r | m', 1 ≤ i ≤ 7.

**Construction or proof.**

1. For m₁, m₂ ∈ ker(T^i − 1): (u^i − 1)⟨m₁, m₂⟩ = 0, and u^i − 1 is a unit modulo m', so the ℤ/m'-component of ⟨m₁, m₂⟩ vanishes and ⟨2m₁, 2m₂⟩ = 4⟨m₁, m₂⟩ = 0.
2. 2M ≅ (ℤ/m')^{2g} with the pairing (2a, 2b) ↦ 4⟨a, b⟩ ∈ 2C ≅ ℤ/m' is perfect (2 is invertible modulo m'); by LV.0 (isotropic subgroups) |2·ker(T^i − 1)|² ≤ |2M| = m'^{2g}.
3. The kernel of x ↦ 2x on ker(T^i − 1) lies in M[2] ≅ (ℤ/2)^{2g}, so |ker(T^i − 1)| ≤ 2^{2g}·m'^g = 2^g N^g.
4. An element in an orbit of size s < 8 lies in ker(T^s − 1) with 1 ≤ s ≤ 7.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.0/isotropic-subgroup-card`; `mathlib:CharacterModule`.

**Acceptance.**

- N = 106 = 2·53, g = 2: |ker(T^i − 1)| ≤ 4·106² = 44944, while |M| = 106⁴ ≈ 1.26·10⁸.
- LV state the union over 1 ≤ i ≤ 8; for i = 8 the unit condition may fail when q_v has order exactly 8 modulo r, but orbits of size < 8 only need i ≤ 7.

**Sources.**

- lv2020, §5, proof of Theorem 5.4, p. 27: The count.
- lv2020, §5, proof of Theorem 5.4, p. 28: The bound.

**Signature gap:** Named theorem interfaces — LV.11.

### The size bound (LV (5.4))

**Node:** `MordellLawrenceVenkatesh:LV.11/size-bound` · lemma; implementation unchecked.

Let Y be a smooth projective geometrically connected curve of genus g ≥ 2 over K, q an admissible prime, X_q → Y'_q → Y the Kodaira–Parshin family with a good model over 𝒪_S (𝒴 proper), and v ∉ S a place satisfying (b)–(d) of the friendly-place lemma for T ⊇ S. Then size_v(π⁻¹(y)) < 1/(d_q + 1) for every y ∈ Y(K).

**Hypotheses.** q admissible; v as in the friendly-place lemma.

**Construction or proof.**

1. π⁻¹(y) is finite étale over 𝒪_S, hence unramified at v. The fibre map ψ : π⁻¹(y)(K̄) → M = H¹(Y_{K̄}, ℤ/(q − 1)) is G_K-equivariant with image Υ (the generating 2g-tuples) and fibres of constant size (LV.8), so size_v(π⁻¹(y)) ≤ size_v(Υ) (LV (5.3)).
2. The Frobenius T at v preserves Υ and satisfies ⟨Tm₁, Tm₂⟩ = q_v⁻¹⟨m₁, m₂⟩; by (c), (d), u = q_v⁻¹ satisfies the unit condition of the orbit count, and q − 1 = 2m' with m' odd by admissibility. So at most 8·2^g(q − 1)^g elements of Υ lie in small orbits.
3. |Υ| = J_{2g}(q − 1) ≥ (q − 1)^{2g}/2 (LV.0), so size_v(Υ) ≤ 8·2^{g+1}/(q − 1)^g < 1/((g − 1/2)(q − 1) + 1) = 1/(d_q + 1) by (iii).

**Prerequisites.** `MordellLawrenceVenkatesh:LV.11/small-orbit-count`; `MordellLawrenceVenkatesh:LV.11/weil-pairing-frobenius`; `MordellLawrenceVenkatesh:LV.11/admissible-prime`; `MordellLawrenceVenkatesh:LV.11/friendly-auxiliary-place`; `MordellLawrenceVenkatesh:LV.8/kodaira-parshin-fibre-map`; `MordellLawrenceVenkatesh:LV.8/kodaira-parshin-family`; `MordellLawrenceVenkatesh:LV.7/size-v`; `MordellLawrenceVenkatesh:LV.0/generating-tuples-card`.

**Acceptance.**

- K = ℚ, g = 2, q = 107: size_v ≤ 64/106² ≈ 0.0057 < 1/160.
- The bound does not depend on y.

**Sources.**

- lv2020, §5, (5.4), p. 26: The strategy.
- lv2020, §5, proof of Theorem 5.4, p. 27: Equal fibres.

**Signature gap:** Named theorem interfaces — LV.11.

### Faltings's theorem (LV Theorem 5.4)

**Node:** `MordellLawrenceVenkatesh:LV.11/faltings-theorem` · theorem; implementation unchecked.

Let K be a number field and Y a smooth projective geometrically connected curve over K of genus g ≥ 2. Then Y(K) is finite.

**Hypotheses.** K number field; Y smooth projective geometrically connected of genus g ≥ 2.

**Construction or proof.**

1. Fix an embedding K ⊂ ℂ. Choose an admissible prime q and form the Kodaira–Parshin family X_q → Y'_q → Y (LV.8); choose S such that it has a good model over 𝒪_S with 𝒴 proper.
2. The family has full monodromy (LV.10), and Y(ℂ) is connected.
3. Choose v by the friendly-place lemma with T the set of places in S, above 2, and above the primes lying below S; then v is friendly, v ∉ S, its residue characteristic is odd and lies below no place of S, and (c), (d) hold.
4. By the size bound, Y(K)* = Y(K) for d = d_q; Proposition 5.3 (LV.7) shows that Y(K)* is finite.

**Prerequisites.** `MordellLawrenceVenkatesh:LV.11/size-bound`; `MordellLawrenceVenkatesh:LV.11/admissible-prime`; `MordellLawrenceVenkatesh:LV.11/friendly-auxiliary-place`; `MordellLawrenceVenkatesh:LV.7/proposition-5-3`; `MordellLawrenceVenkatesh:LV.10/kodaira-parshin-full-monodromy`; `MordellLawrenceVenkatesh:LV.8/kodaira-parshin-family`; `MordellLawrenceVenkatesh:LV.2/good-model-exists`; `ComplexComparisonPartII:C4`.

**Acceptance.**

- The statement coincides with that of HeightsRationalPointsAndObstructions RP.4 (see the restructure proposal).
- For K = ℚ and g = 2 the proof runs with q = 107 (d_q = 159) and a prime p ≡ 2 mod 53. Any numerical auxiliary prime must also avoid the finite bad-reduction and ramification set; 373 is only usable when it avoids that set.

**Sources.**

- lv2020, §5, Theorem 5.4, p. 26: The theorem.
- lv2020, §5, proof of Theorem 5.4, p. 26: The assembly.

**Planet:** Faltings’s theorem.

**Signature gap:** Named theorem interfaces — LV.11.

### Exact follow-ups for LV.11

- Supply/resolve LV-import-01 — Closures of abstract algebraic subgroups (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-02 — Lie differentials and connected subgroup equality (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-03 — Normal subgroups of symplectic groups (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-04 — Symplectic Lie structure and transvections (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-06 — Continuous Mackey and semisimple image algebras (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-12 — Local de Rham characters and induction (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-28 — Spreading polarized families and good models (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-30 — Symplectic Grassmannian schemes and charts (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-31 — Dimension and transcendence-degree interfaces (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-32 — Algebraic group orbits and transporters (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-34 — Completed analytic local rings (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-39 — Surface triangulation, collars and tameness (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-41 — Surface homology basis and pairing (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-44 — Fibration sequences and surface asphericity (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-49 — Finite étale geometric points at a place (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-50 — Componentwise rank in stable Grassmannians (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-51 — Dimensions under finite morphisms (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-55 — Analytic normalization of finite covers (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-57 — Finite étale Riemann existence and base change (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-59 — Peripheral inertia and finite cohomology action (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-60 — Finite normalization over excellent schemes (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-63 — Relative norm-kernel identity components (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-66 — Finite-coefficient curve cohomology and Weil pairing (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-67 — Rational branched-cover transfer (exact interface and affected nodes are in gaps).
- Supply/resolve LV-import-73 — Unramified global Galois-closure completions (exact interface and affected nodes are in gaps).
- Supply/resolve Topological surface classification proof interfaces (exact interface and affected nodes are in gaps).
- Supply/resolve Mapping-class prerequisites beyond smooth gluing (exact interface and affected nodes are in gaps).
- Supply/resolve Faithful image-algebra trace criterion (exact interface and affected nodes are in gaps).
- Supply/resolve Generic projector and relative Prym comparisons (exact interface and affected nodes are in gaps).
- Supply/resolve Distinguishing-curve disjoint-arc realization (exact interface and affected nodes are in gaps).
- Supply/resolve Finite-extension analytic zero theorem adapter (exact interface and affected nodes are in gaps).
- Supply/resolve Surface isotopy quotient signatures (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — semilinear-centralizer (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — symplectic-transvection (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — largest-cm-subfield (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — friendly-place (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — abelian-by-finite-family (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — good-model (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — de-rham-bundle (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — residue-disk (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — gauss-manin-transport-padic (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — gauss-manin-transport-complex (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — crystalline-frobenius-on-fibres (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — lagrangian-grassmannian (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — lagrangian-period-variety (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — algebraic-monodromy-group (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — padic-period-map (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — complex-period-map (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — surface (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — mapping-class-group (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — dehn-twist (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — point-push (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — simple-closed-curve (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — size-v (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — singly-ramified-surjections (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — hurwitz-cover-complex (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — reduced-prym (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — kodaira-parshin-family (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — affine-cover (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — primitive-homology (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — lifted-monodromy (exact interface and affected nodes are in gaps).
- Supply/resolve Suggested signatures — liftable-curve (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.0 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.1 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.2 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.3 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.4 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.5 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.7 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.8 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.9 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.10 (exact interface and affected nodes are in gaps).
- Supply/resolve Named theorem interfaces — LV.11 (exact interface and affected nodes are in gaps).
- Resolve exact supplier contracts LV-import-01, LV-import-02, LV-import-03, LV-import-04, LV-import-05, LV-import-06, LV-import-07, LV-import-08, LV-import-09, LV-import-10, LV-import-11, LV-import-12, LV-import-13, LV-import-14, LV-import-15, LV-import-16, LV-import-17, LV-import-18, LV-import-19, LV-import-20, LV-import-21, LV-import-22, LV-import-23, LV-import-24, LV-import-25, LV-import-26, LV-import-27, LV-import-28, LV-import-29, LV-import-30, LV-import-31, LV-import-32, LV-import-33, LV-import-34, LV-import-35, LV-import-36, LV-import-37, LV-import-38, LV-import-39, LV-import-40, LV-import-41, LV-import-42, LV-import-43, LV-import-44, LV-import-45, LV-import-48, LV-import-49, LV-import-50, LV-import-51, LV-import-52, LV-import-53, LV-import-54, LV-import-55, LV-import-56, LV-import-57, LV-import-58, LV-import-59, LV-import-60, LV-import-61, LV-import-62, LV-import-63, LV-import-64, LV-import-65, LV-import-66, LV-import-67, LV-import-68, LV-import-69, LV-import-70, LV-import-71, LV-import-72, LV-import-73, LV-import-74, LV-import-75, LV-import-76; the stage imports name plans, not proofs.

## Supplier contracts

A requested stage is a planned supplier, not a proved declaration. Where the stage’s text is narrower than the needed contract, its current import and required extension are separated below. The full packet records the audit date, source-document locator and stage-text hash where available.

### LV-import-01 — tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components

Closed subgroup schemes, quotient morphisms and identity components of affine algebraic groups.

Consumers: `MordellLawrenceVenkatesh:LV.0/zariski-closure-transvection-powers`, `MordellLawrenceVenkatesh:LV.0/transvection-pair-closure`, `MordellLawrenceVenkatesh:LV.0/transvection-graph-closure`, `MordellLawrenceVenkatesh:LV.0/symplectic-pair-lemma`, `MordellLawrenceVenkatesh:LV.0/symplectic-goursat`, `MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group`, `MordellLawrenceVenkatesh:LV.6/closed-subgroup-with-factor-unipotents`, `MordellLawrenceVenkatesh:LV.6/variant-family-full-monodromy`, `MordellLawrenceVenkatesh:LV.10/lifted-monodromy-dense-factor`, `MordellLawrenceVenkatesh:LV.10/lifted-monodromy-dense-product`, `MordellLawrenceVenkatesh:LV.10/normal-subgroups-of-symplectic-products`, `MordellLawrenceVenkatesh:LV.10/push-monodromy-dense`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: AlgebraicGroup.abstractSubgroupClosure; finite-index closures have the same identity component; closure/image compatibility; normalizer compatibility; powers of a nontrivial additive one-parameter subgroup are dense in characteristic zero. Use algebraically closed characteristic-zero fields for the point-set assertions.

extensionOwner: tauceti:TauCetiRoadmap/ReductiveGroups

supplierDocument: content/tau-ceti/ReductiveGroups/README.md

### LV-import-02 — tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation

The Lie algebra and adjoint representation of a smooth affine algebraic group, with its dimension tools.

Consumers: `MordellLawrenceVenkatesh:LV.0/symplectic-pair-lemma`, `MordellLawrenceVenkatesh:LV.0/symplectic-goursat`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: AlgebraicGroup.lie_product; differential of a smooth surjective homomorphism is onto; connected closed H⊆G with Lie H=Lie G implies H=G in characteristic zero.

extensionOwner: tauceti:TauCetiRoadmap/ReductiveGroups

supplierDocument: content/tau-ceti/ReductiveGroups/README.md

### LV-import-03 — tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups

Semisimple groups, centres and central isogenies.

Consumers: `MordellLawrenceVenkatesh:LV.0/symplectic-pair-lemma`, `MordellLawrenceVenkatesh:LV.6/closed-subgroup-with-factor-unipotents`, `MordellLawrenceVenkatesh:LV.10/normal-subgroups-of-symplectic-products`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: Sp(V) over an algebraically closed characteristic-zero field, dim V≥2: centre={±1}; every proper closed normal subgroup is central. Connectedness is separately reused from the pinned Sp coordinate-group theorem.

extensionOwner: tauceti:TauCetiRoadmap/ReductiveGroups

supplierDocument: content/tau-ceti/ReductiveGroups/README.md

### LV-import-04 — tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Root data, root subgroups and the structure theory of split reductive groups.

Consumers: `MordellLawrenceVenkatesh:LV.0/symplectic-pair-lemma`, `MordellLawrenceVenkatesh:LV.0/transvection-graph-closure`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: sp(V) is nonabelian simple; every Lie automorphism is Ad(h) for h∈Sp(V); arbitrary-form transvections generate Sp(V). Compare with the existing coordinate symplectic root-group API.

extensionOwner: tauceti:TauCetiRoadmap/ReductiveGroups

supplierDocument: content/tau-ceti/ReductiveGroups/README.md

### LV-import-05 — tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius

A finite unramified extension L/K of p-adic fields is cyclic Galois of degree f(L/K), generated by the arithmetic Frobenius, and the arithmetic Frobenius of L over ℚ_p restricts on L to a generator whose f(K/ℚ_p)-th power generates Gal(L/K).

Consumers: `MordellLawrenceVenkatesh:LV.0/semilinear-centralizer-unramified`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/LocalFieldsRamification/README.md

### LV-import-06 — ArithmeticGaloisRepresentations:R01.1

Continuous finite-dimensional p-adic representations, stable integral lattices, and continuous induction/restriction from open subgroups.

Consumers: `MordellLawrenceVenkatesh:LV.1/frobenius-test-set`, `MordellLawrenceVenkatesh:LV.1/de-rham-of-induced`, `MordellLawrenceVenkatesh:LV.1/hodge-weight-sum-over-places`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: ContinuousRep.mackeyDecomposition for closed D and open H; restriction semisimplicity for finite-index normal subgroups in characteristic zero; comparison with pinned Rep.mackeyDecomposition, which is algebraic and has no continuity hypotheses.

extensionOwner: ArithmeticGaloisRepresentations

supplierDocument: content/campaign/ArithmeticGaloisRepresentations/README.md

### LV-import-07 — WeightsInEtaleCohomology:R34.1

For a number field K, a finite set T of finite places and a continuous representation ρ of G_K on a finite-dimensional ℚ_p-space: the predicates 'pure of weight w outside T' (unramified at v ∉ T and every root of the characteristic polynomial of ρ(Frob_v^geom) is an algebraic number with all complex absolute values q_v^{w/2}) and 'integral Frobenius polynomials outside T', with stability under subrepresentations, quotients, direct sums, duals (w ↦ −w), tensor products (weights add), determinants (weight w·dim), Tate twists (ℚ_p(n) has weight −2n), restriction to G_L (T replaced by the places above T) and induction from G_L for L/K finite (same weight, T enlarged by the places ramified in L). The listed dual/inverse operations preserve purity, not integrality in general: the dual of a weight-positive integral character can have nonintegral Frobenius eigenvalues. Integrality is retained for subquotients, direct sums, tensor products, restriction and finite induction under their stated hypotheses.

Consumers: `MordellLawrenceVenkatesh:LV.1/faltings-finiteness`, `MordellLawrenceVenkatesh:LV.1/pure-character-conjugation-relation`, `MordellLawrenceVenkatesh:LV.1/hodge-weight-pure-representation`, `MordellLawrenceVenkatesh:LV.1/hodge-weight-sum-over-places`, `MordellLawrenceVenkatesh:LV.6/legendre-generic-simplicity`, `MordellLawrenceVenkatesh:LV.7/generic-simplicity-sublemma`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/WeightsInEtaleCohomology/README.md

### LV-import-08 — DeligneWeightsAndPurity:DWP.0

Weil q-numbers of weight w: algebraic numbers all of whose complex absolute values are q^{w/2}, with stability under products, inverses and conjugation.

Consumers: `MordellLawrenceVenkatesh:LV.1/faltings-finiteness`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/DeligneWeightsAndPurity/README.md

### LV-import-09 — tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev

For a finite Galois extension L/K of number fields, a conjugacy class C of Gal(L/K) and a finite set T of places of K, there is a finite place v ∉ T unramified in L whose Artin symbol is C (infinitude of frobeniusPrimeSet K L C).

Consumers: `MordellLawrenceVenkatesh:LV.1/frobenius-test-set`, `MordellLawrenceVenkatesh:LV.6/inert-auxiliary-place`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/Chebotarev/README.md

### LV-import-10 — tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

For a number field K and a continuous character η : G_K → ℚ_p^× unramified outside a finite set T: η ∘ Art_K is a continuous character of the idele class group, trivial on principal ideles, whose component at a finite place ℘ ∉ T is unramified with value η(Frob_℘) (arithmetic Frobenius) on a uniformizer, whose component at a place above p is η|_{G_{K_℘}} ∘ Art_{K_℘}, and whose archimedean component is trivial on the identity component.

Consumers: `MordellLawrenceVenkatesh:LV.1/pure-character-conjugation-relation`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/ClassFieldTheory/README.md

### LV-import-11 — tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors

For a finite extension F/ℚ_p: Art_F(𝒪_F^×) is the image of the inertia group in G_F^ab, and χ_cyc(Art_F(u)) = N_{F/ℚ_p}(u)^{−1} for u ∈ 𝒪_F^× (cyclotomicCharacter_artinMap).

Consumers: `MordellLawrenceVenkatesh:LV.1/de-rham-character-locally-algebraic`, `MordellLawrenceVenkatesh:LV.1/pure-character-conjugation-relation`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/ClassFieldTheory/README.md

### LV-import-12 — PadicHodgeTheory:R06.2

Exact tensor de Rham period functors with strict filtrations, duals, determinants, Hodge–Tate comparison and weak admissibility.

Consumers: `MordellLawrenceVenkatesh:LV.1/de-rham-character-locally-algebraic`, `MordellLawrenceVenkatesh:LV.1/filtration-weight`, `MordellLawrenceVenkatesh:LV.1/hodge-weight-pure-representation`, `MordellLawrenceVenkatesh:LV.1/de-rham-of-induced`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: LocalDeRhamCharacter.tateSen_invariants (Brinon–Conrad 2.2.7); local algebraicity of a de Rham ℚp-character; D_dR of finite induction as a filtered restriction-of-scalars space; preservation of crystalline representations for unramified induction.

extensionOwner: PadicHodgeTheory

supplierDocument: content/campaign/PadicHodgeTheory/README.md

### LV-import-13 — ArithmeticGaloisRepresentations:R01.6

For an abelian variety A over a number field L with good reduction at a finite place u ∤ p: V_p(A) is unramified at u and the characteristic polynomial of Frob_u on V_p(A) equals the characteristic polynomial of the q_u-Frobenius endomorphism of the reduction, a monic polynomial in ℤ[X] of degree 2 dim A independent of p (good-reduction Frobenius polynomial).

Consumers: `MordellLawrenceVenkatesh:LV.1/abelian-variety-cohomology-properties`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/ArithmeticGaloisRepresentations/README.md

### LV-import-14 — NeronModelsAndSemistableAbelianVarieties:R11.5

Néron–Ogg–Shafarevich: an abelian variety over a number field with good reduction at u has V_p unramified at u for every p different from the residue characteristic of u.

Consumers: `MordellLawrenceVenkatesh:LV.1/abelian-variety-cohomology-properties`, `MordellLawrenceVenkatesh:LV.4/proposition-3-4`, `MordellLawrenceVenkatesh:LV.7/proposition-5-3`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/NeronModelsAndSemistableAbelianVarieties/README.md

### LV-import-15 — DeligneWeightsAndPurity:DWP.1

Weil's theorem: every complex root of the characteristic polynomial of the Frobenius endomorphism of an abelian variety over 𝔽_q has absolute value q^{1/2}.

Consumers: `MordellLawrenceVenkatesh:LV.1/abelian-variety-cohomology-properties`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/DeligneWeightsAndPurity/README.md

### LV-import-16 — PadicHodgeTheory:R06.6

For an abelian variety A over a finite extension F/ℚ_p with good reduction, V_p(A) and H¹_et(A_{F̄}, ℚ_p) are crystalline G_F-representations.

Consumers: `MordellLawrenceVenkatesh:LV.1/abelian-variety-cohomology-properties`, `MordellLawrenceVenkatesh:LV.4/fibre-representation-crystalline`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/PadicHodgeTheory/README.md

### LV-import-17 — AbelianSchemesAndArithmeticModuli:A3

A polarization λ of an abelian variety A over a field of characteristic ≠ p induces a perfect alternating Galois-equivariant pairing V_p(A) × V_p(A) → ℚ_p(1) (the λ-Weil pairing), hence a perfect alternating pairing on H¹_et(A, ℚ_p) with values in ℚ_p(−1).

Consumers: `MordellLawrenceVenkatesh:LV.1/abelian-variety-cohomology-properties`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/AbelianSchemesAndArithmeticModuli/README.md

### LV-import-18 — SchemeAndStackFoundations:SF.3

For an abelian variety A over a field F of characteristic ≠ p, a Galois-equivariant isomorphism H¹_et(A_{F̄}, ℚ_p) ≅ Hom(V_p(A), ℚ_p), compatible with pullback along homomorphisms and with the cup product/Weil pairing.

Consumers: `MordellLawrenceVenkatesh:LV.1/abelian-variety-cohomology-properties`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/SchemeAndStackFoundations/README.md

### LV-import-19 — AbelianSchemesAndArithmeticModuli:A1

Abelian schemes over an arbitrary base (smooth proper group schemes with geometrically connected fibres), their relative dimension, base change and homomorphisms.

Consumers: `MordellLawrenceVenkatesh:LV.2/abelian-by-finite-family`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/AbelianSchemesAndArithmeticModuli/README.md

### LV-import-20 — AbelianSchemesAndArithmeticModuli:A2

Polarizations of abelian schemes (λ : A → A^∨ with the positivity condition), stable under base change; the polarization of a relative Jacobian.

Consumers: `MordellLawrenceVenkatesh:LV.2/abelian-by-finite-family`, `MordellLawrenceVenkatesh:LV.2/de-rham-bundle`, `MordellLawrenceVenkatesh:LV.6/legendre-family`, `MordellLawrenceVenkatesh:LV.8/reduced-prym`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/AbelianSchemesAndArithmeticModuli/README.md

### LV-import-21 — AbelianSchemesAndArithmeticModuli:A4

For an abelian scheme f : A → T of relative dimension d over a smooth 𝒪_S-scheme T: relative H¹_dR(A/T) locally free of rank 2d with Hodge exact sequence 0 → f_*Ω¹ → H¹_dR → R¹f_*𝒪 → 0 (locally free terms), compatible with arbitrary base change; the Gauss–Manin connection relative to 𝒪_S, integrable; the cup-product pairing induced by a polarization of invertible degree, perfect and alternating, with F¹ Lagrangian and horizontal for ∇; all compatible with base change and with the analytic comparison over ℂ.

Consumers: `MordellLawrenceVenkatesh:LV.2/good-model`, `MordellLawrenceVenkatesh:LV.2/good-model-exists`, `MordellLawrenceVenkatesh:LV.2/de-rham-bundle`, `MordellLawrenceVenkatesh:LV.6/legendre-family`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/AbelianSchemesAndArithmeticModuli/README.md

### LV-import-22 — AbelianSchemesAndArithmeticModuli:A5

For an abelian scheme over a smooth complex variety T, the degree-one de Rham–Betti comparison H¹_dR(A/T)^an ≅ R¹f_*ℂ ⊗ 𝒪^an identifies ∇ with the connection whose horizontal sections are R¹f_*ℂ, and R¹f_*ℤ is a local system (Ehresmann).

Consumers: `MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-complex`, `MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group`, `MordellLawrenceVenkatesh:LV.6/legendre-monodromy`, `MordellLawrenceVenkatesh:LV.10/kodaira-parshin-full-monodromy`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/AbelianSchemesAndArithmeticModuli/README.md

### LV-import-23 — ComplexComparisonPartII:C5

For a smooth proper morphism of complex algebraic varieties, the analytic Gauss–Manin connection on the relative algebraic de Rham cohomology has the Betti local system R^q f_*ℂ as sheaf of horizontal sections (relative Gauss–Manin compatibility of the algebraic de Rham–Betti comparison).

Consumers: `MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-complex`, `MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group`, `MordellLawrenceVenkatesh:LV.6/legendre-monodromy`, `MordellLawrenceVenkatesh:LV.10/kodaira-parshin-full-monodromy`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/ComplexComparisonPartII/README.md

### LV-import-24 — CrystallineCohomology:CR.1

Crystals on the crystalline site of a smooth k-scheme and their description, on a p-adic formal lift, as modules with integrable quasi-nilpotent connection whose transition isomorphisms between two sections with the same reduction are given by the Taylor series of the connection (convergent on the PD-thickening; for p > 2 and an unramified base the ideal (p) has topologically nilpotent divided powers).

Consumers: `MordellLawrenceVenkatesh:LV.2/crystalline-frobenius-on-fibres`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/CrystallineCohomology/README.md

### LV-import-25 — CrystallineCohomology:CR.2

For a smooth proper lift 𝔛 over W(k) of a smooth proper k-scheme X₀: the natural isomorphism H^q_cris(X₀/W(k)) ≅ H^q_dR(𝔛/W(k)) (Berthelot–Ogus Corollary 7.4) and its naturality in the lift.

Consumers: `MordellLawrenceVenkatesh:LV.2/crystalline-frobenius-on-fibres`, `MordellLawrenceVenkatesh:LV.4/fibre-representation-crystalline`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/CrystallineCohomology/README.md

### LV-import-26 — CrystallineCohomology:CR.3

The Frobenius endomorphism of H^q_cris(X₀/W(k)) of a smooth proper k-scheme, semilinear for the Witt vector Frobenius and bijective after inverting p, functorial in X₀ and compatible with cup products.

Consumers: `MordellLawrenceVenkatesh:LV.2/crystalline-frobenius-on-fibres`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/CrystallineCohomology/README.md

### LV-import-27 — CrystallineCohomology:CR.7

Relative Gauss–Manin interface: for a smooth proper morphism g : 𝒳 → 𝒴 of smooth formal schemes over W(k) with locally free H^q_dR commuting with base change, the higher direct image R^q g_cris* 𝒪 is a crystal on 𝒴_k whose associated module with connection is (H^q_dR(𝒳/𝒴), ∇_GM), and whose value at a W(k')-point y is H^q_cris(𝒳_{ȳ}/W(k')), compatibly with Frobenius.

Consumers: `MordellLawrenceVenkatesh:LV.2/crystalline-frobenius-on-fibres`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/CrystallineCohomology/README.md

### LV-import-28 — SchemeAndStackFoundations:SF.0

Finitely presented schemes, fibre products, smooth/étale/proper morphisms and their base-change operations.

Consumers: `MordellLawrenceVenkatesh:LV.2/good-model-exists`, `MordellLawrenceVenkatesh:LV.2/residue-disk`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: Scheme.spreadOut_finitePresentation with descent of group law, finite étale and abelian-scheme properties after enlarging S; Smooth.completedLocalRing_equiv_powerSeries at an 𝒪v-point over an unramified DVR and its bijection of a residue disk with (p𝒪v)^m.

extensionOwner: SchemeAndStackFoundations

supplierDocument: content/campaign/SchemeAndStackFoundations/README.md

### LV-import-29 — tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius

For K_v/ℚ_p unramified, 𝒪_v = W(k_v), |p|_v = p^{-1}, and every finite unramified extension of K_v is cyclic with the arithmetic Frobenius as generator.

Consumers: `MordellLawrenceVenkatesh:LV.2/residue-disk`, `MordellLawrenceVenkatesh:LV.2/crystalline-frobenius-on-fibres`, `MordellLawrenceVenkatesh:LV.4/fibre-representation-crystalline`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/LocalFieldsRamification/README.md

### LV-import-30 — AlgebraicModuliForArithmeticGeometry:R09.1

Grassmannian/flag representability, Plücker embeddings, base change and closed endomorphism-stability loci of subbundles.

Consumers: `MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian`, `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety`, `MordellLawrenceVenkatesh:LV.3/power-series-zariski-closure`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: SymplecticGrassmannian.isotropic_closed; locally constant rank on every component of a finite étale algebra (not just total rank); Lagrangian affine charts by symmetric matrices and their base-change comparison. Zariski-closure descent for the period series is proved in the local LV node.

extensionOwner: AlgebraicModuliForArithmeticGeometry

supplierDocument: content/campaign/AlgebraicModuliForArithmeticGeometry/README.md

### LV-import-31 — SchemeAndStackFoundations:SF.0

Finite-type schemes, their open subschemes, products and field-base-change carriers.

Consumers: `MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian-geometry`, `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety-splitting`, `MordellLawrenceVenkatesh:LV.4/filtered-phi-orbit`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: FiniteTypeScheme.dimension_eq_transcendenceDegree; proper closed subsets of irreducible schemes have smaller dimension; dim closure(image f)≤dim source; geometric irreducibility/dimension of products and scalar extension; irreducibility from overlapping irreducible opens.

extensionOwner: SchemeAndStackFoundations

supplierDocument: content/campaign/SchemeAndStackFoundations/README.md

### LV-import-32 — tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components

Closed subgroup schemes and their quotient/component interfaces.

Consumers: `MordellLawrenceVenkatesh:LV.3/complex-period-closure-contains-orbit`, `MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group`, `MordellLawrenceVenkatesh:LV.4/filtered-phi-orbit`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: AlgebraicGroup.orbitMorphism; closed transporter as an inverse image under orbitMorphism; dim orbit closure≤dim group. These are additional statements, not consequences imported from a stage title.

extensionOwner: tauceti:TauCetiRoadmap/ReductiveGroups

supplierDocument: content/tau-ceti/ReductiveGroups/README.md

### LV-import-33 — tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence

For a connected complex manifold (more generally a connected, locally path-connected, semilocally simply connected space) X with base point x₀: the universal cover as homotopy classes of paths from x₀ with the deck action of π₁(X, x₀) by precomposition; the pullback of a local system to the universal cover is constant, and parallel transport along homotopic paths agrees, so that transport defines the monodromy representation compatibly with deck transformations.

Consumers: `MordellLawrenceVenkatesh:LV.3/complex-period-map`, `MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/UniversalCovers/README.md

### LV-import-34 — ComplexComparisonPartII:C0

Faithful flatness and comparison of algebraic and analytic local rings.

Consumers: `MordellLawrenceVenkatesh:LV.3/complex-period-map`, `MordellLawrenceVenkatesh:LV.3/period-maps-common-series`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: Analytification.completedLocalRingEquiv; regular parameters become holomorphic coordinates and the induced completed-ring map sends regular functions to their convergent Taylor series.

extensionOwner: ComplexComparisonPartII

supplierDocument: content/campaign/ComplexComparisonPartII/README.md

### LV-import-35 — ComplexComparisonPartII:C4

For a smooth geometrically connected curve Y over a subfield of ℂ, projective or the complement of finitely many points in a projective one, Y(ℂ) with the analytic topology is connected.

Consumers: `MordellLawrenceVenkatesh:LV.3/complex-period-closure-contains-orbit`, `MordellLawrenceVenkatesh:LV.6/legendre-generic-simplicity`, `MordellLawrenceVenkatesh:LV.6/s-unit-residue-disk-finite`, `MordellLawrenceVenkatesh:LV.7/generic-simplicity-family`, `MordellLawrenceVenkatesh:LV.7/representations-vary`, `MordellLawrenceVenkatesh:LV.8/curve-topological-genus`, `MordellLawrenceVenkatesh:LV.8/hurwitz-cover-complex`, `MordellLawrenceVenkatesh:LV.11/faltings-theorem`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/ComplexComparisonPartII/README.md

### LV-import-36 — PadicHodgeTheory:R06.5

For a proper smooth scheme 𝔛 over W(k) (k perfect) with generic fibre X over K = W(k)[1/p]: H^i_et(X_K̄, ℚ_p) is crystalline and D_cris(H^i_et(X_K̄, ℚ_p)) ≅ (H^i_dR(X/K), φ, Hodge filtration) in MF^φ_K, where φ is the crystalline Frobenius of 𝔛_k transported by the Berthelot–Ogus isomorphism H^i_cris(𝔛_k/W(k))[1/p] ≅ H^i_dR(X/K); the isomorphism is functorial in 𝔛, compatible with cup products, and uses the identification of the étale cohomology of the rigid generic fibre of the completion with that of X (the case i = 1 for abelian schemes suffices).

Consumers: `MordellLawrenceVenkatesh:LV.4/fibre-representation-crystalline`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/PadicHodgeTheory/README.md

### LV-import-37 — PadicHodgeTheory:R06.2

For an unramified p-adic field K: the category MF^φ_K of filtered φ-modules (σ-semilinear bijective φ, exhaustive separated decreasing filtration; morphisms K-linear, φ-equivariant and filtration-preserving; isomorphisms carry filtrations onto filtrations); the covariant functor D_cris = (− ⊗ B_cris)^{G_K} from crystalline representations to MF^φ_K; its compatibility with transport of structure along a field isomorphism K ≅ K' (pairs (K, V) and (K', V')).

Consumers: `MordellLawrenceVenkatesh:LV.4/fibre-representation-crystalline`, `MordellLawrenceVenkatesh:LV.4/fibre-filtered-phi-transport`, `MordellLawrenceVenkatesh:LV.4/filtered-phi-orbit`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/PadicHodgeTheory/README.md

### LV-import-38 — SchemeAndStackFoundations:SF.2

For a proper variety X over a field K, a field extension L/K and compatible separable closures K̄ ⊆ L̄: the base-change map H^i_et(X_K̄, ℚ_p) → H^i_et(X_L̄, ℚ_p) is a G_L-equivariant isomorphism (G_L acting on the source through G_L → G_K).

Consumers: `MordellLawrenceVenkatesh:LV.4/fibre-representation-crystalline`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/SchemeAndStackFoundations/README.md

### LV-import-39 — tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group

Smooth manifold gluing, collars and isotopy extension in the stated smooth category.

Consumers: `MordellLawrenceVenkatesh:LV.5/surface`, `MordellLawrenceVenkatesh:LV.5/surface-classification`, `MordellLawrenceVenkatesh:LV.5/change-of-coordinates`, `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence`, `MordellLawrenceVenkatesh:LV.9/affine-cover-normal-form`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: CompactSurface.triangulable from Jordan–Schönflies; topological collars and tameness of simple curves; cutting/regluing topological surfaces; extension of the closed triangulation theorem to boundary collars. The current Layer 1 expressly defers smoothing and triangulation.

extensionOwner: tauceti:TauCetiRoadmap/GeometricTopology

supplierDocument: content/tau-ceti/GeometricTopology/README.md

### LV-import-40 — tauceti:TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid

The based van Kampen theorem for two open sets with path-connected intersection and the free-group presentation of the fundamental group of a finite wedge of circles.

Consumers: `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/AlgebraicTopology/README.md

### LV-import-41 — tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology

Integral singular homology and local coefficients with basepoint-change and monodromy formulas.

Consumers: `MordellLawrenceVenkatesh:LV.5/surface`, `MordellLawrenceVenkatesh:LV.5/dehn-twist-homology`, `MordellLawrenceVenkatesh:LV.5/configuration-family-monodromy`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: Surface-specific finite CW models, the integral handle/peripheral basis and intersection radical are assembled in surface-homology after classification; the stage does not prove this surface computation.

extensionOwner: tauceti:TauCetiRoadmap/GeometricTopology

supplierDocument: content/tau-ceti/AlgebraicTopology/README.md

### LV-import-42 — tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations

Cellular homology of finite CW complexes, used for the 4g-gon model of a closed orientable surface (H₁ ≅ ℤ^{2g}, H₂ ≅ ℤ) and for graphs.

Consumers: `MordellLawrenceVenkatesh:LV.5/surface-classification`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/AlgebraicTopology/README.md

### LV-import-43 — tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality

Poincaré–Lefschetz duality for compact oriented surfaces with boundary, the resulting intersection pairing on H₁ (perfect for closed surfaces), and its compatibility with orientation-preserving homeomorphisms.

Consumers: `MordellLawrenceVenkatesh:LV.5/surface`, `MordellLawrenceVenkatesh:LV.5/dehn-twist-homology`, `MordellLawrenceVenkatesh:LV.8/reduced-prym-homology`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/AlgebraicTopology/README.md

### LV-import-44 — tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead

The long exact homotopy sequence of a relative pair, and relative Hurewicz/Whitehead comparison.

Consumers: `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence`, `MordellLawrenceVenkatesh:LV.5/birman-exact-sequence`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: SerreFibration.homotopyExactSequence from the Stage-5 bundle-to-fibration bridge, and CompactSurface.aspherical for positive genus; use π₂ of the base, not of the fibre, to prove injection of π₁(fibre).

extensionOwner: tauceti:TauCetiRoadmap/AlgebraicTopology

supplierDocument: content/tau-ceti/AlgebraicTopology/README.md

### LV-import-45 — tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence

Classification of (possibly disconnected) covering spaces of a connected, locally path-connected, semilocally simply connected space by π₁-sets, with the fibre monodromy and path/homotopy lifting; lifts of homeomorphisms of the base to a connected covering exist when the induced outer automorphism preserves the conjugacy class of the monodromy, and two lifts differ by a deck transformation.

Consumers: `MordellLawrenceVenkatesh:LV.5/mapping-class-group`, `MordellLawrenceVenkatesh:LV.5/birman-exact-sequence`, `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence`, `MordellLawrenceVenkatesh:LV.5/covering-dehn-twist-lift`, `MordellLawrenceVenkatesh:LV.5/configuration-family-monodromy`, `MordellLawrenceVenkatesh:LV.6/variant-family-full-monodromy`, `MordellLawrenceVenkatesh:LV.8/hurwitz-cover-complex`, `MordellLawrenceVenkatesh:LV.9/affine-cover`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/UniversalCovers/README.md

### LV-import-46 — tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius

For a finite place w of a number field K and a monic f ∈ 𝒪_w[X] with separable reduction, K_w[X]/(f) is a finite product of unramified extensions of K_w (so an extension generated by a root of f is unramified at w); for a finite extension L/K and a place v unramified in L whose decomposition group is generated by Frob_v, there are [L : K]/ord(Frob_v) places above v, each of residue degree ord(Frob_v).

Consumers: `MordellLawrenceVenkatesh:LV.6/kummer-cyclic-field`, `MordellLawrenceVenkatesh:LV.6/inert-auxiliary-place`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/LocalFieldsRamification/README.md

### LV-import-47 — AbelianSchemesAndArithmeticModuli:A1

An elliptic curve over an affine scheme T = Spec R, given by a Weierstrass equation with unit discriminant (Mathlib WeierstrassCurve.IsElliptic over R), is an abelian scheme of relative dimension 1 over T, with its canonical principal polarization, compatibly with base change.

Consumers: `MordellLawrenceVenkatesh:LV.6/legendre-family`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/AbelianSchemesAndArithmeticModuli/README.md

### LV-import-48 — PadicHodgeTheory:R06.2

For a crystalline representation V of G_F (F/ℚ_p finite unramified): D_cris(V) is weakly admissible, i.e. t_N(D) = t_H(D) and t_N(D') ≥ t_H(D') for φ-stable subobjects D' with the induced filtration (Brinon–Conrad Theorem 9.3.4 with N = 0); subrepresentations of crystalline representations are crystalline and D_cris carries them to φ-stable subspaces with the induced filtration; t_N(D) is the p-adic valuation of the determinant of φ in any F-basis.

Consumers: `MordellLawrenceVenkatesh:LV.6/legendre-generic-simplicity`, `MordellLawrenceVenkatesh:LV.7/generic-simplicity-sublemma`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/PadicHodgeTheory/README.md

### LV-import-49 — tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius

Unramified local extensions, Frobenius and residue-degree/decomposition-group calculations.

Consumers: `MordellLawrenceVenkatesh:LV.7/size-v`, `MordellLawrenceVenkatesh:LV.7/frobenius-orbits-places`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: FiniteEtaleAlgebra.geometricPoints_decompositionAtPlace: Hom_K(E,K̄) is the disjoint union of local embeddings with its decomposition-group action. This comparison requires the number-field/completion embedding dictionary in addition to local ramification theory.

extensionOwner: tauceti:TauCetiRoadmap/LocalFieldsRamification

supplierDocument: content/tau-ceti/LocalFieldsRamification/README.md

### LV-import-50 — AlgebraicModuliForArithmeticGeometry:R09.1

Projectivity of each rank Grassmannian, proper projections and rank-condition closed loci for intersections of subbundles.

Consumers: `MordellLawrenceVenkatesh:LV.7/lagrangian-general-position`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: The finite étale stable-Grassmannian locus must impose componentwise rank d on each rank-2d component; the total-rank condition alone has extra components.

extensionOwner: AlgebraicModuliForArithmeticGeometry

supplierDocument: content/campaign/AlgebraicModuliForArithmeticGeometry/README.md

### LV-import-51 — SchemeAndStackFoundations:SF.0

Finite-type schemes, products, scalar extensions and finite/integral morphism carriers.

Consumers: `MordellLawrenceVenkatesh:LV.7/lagrangian-general-position`, `MordellLawrenceVenkatesh:LV.7/frobenius-stable-lagrangian-avoidance`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: The dimension contracts of request 30; finite surjective maps preserve dimension and send closed subsets to closed subsets of the same dimension.

extensionOwner: SchemeAndStackFoundations

supplierDocument: content/campaign/SchemeAndStackFoundations/README.md

### LV-import-52 — ComplexComparisonPartII:C5

For a smooth proper morphism of complex algebraic varieties, the analytic Gauss–Manin connection on the relative algebraic de Rham cohomology has the Betti local system R^q f_*ℂ as sheaf of horizontal sections (relative Gauss–Manin compatibility of the algebraic de Rham–Betti comparison). For a smooth projective curve over ℂ, H¹(Y(ℂ), ℂ) ≅ H¹_dR(Y/ℂ) has dimension 2g.

Consumers: `MordellLawrenceVenkatesh:LV.8/curve-topological-genus`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/ComplexComparisonPartII/README.md

### LV-import-53 — tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality

For a smooth proper geometrically connected curve X/k, the coherent genus is dim H¹(X,𝒪); Serre duality identifies H⁰(X,ω) with H¹(X,𝒪) dual, hence h⁰(ω)=g. In characteristic zero for a smooth curve ω=Ω¹.

Consumers: `MordellLawrenceVenkatesh:LV.8/curve-topological-genus`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/JacobianChallenge/README.md

### LV-import-54 — SchemeAndStackFoundations:SF.3

The algebraic de Rham cohomology of a smooth projective curve and its Hodge exact sequence 0 → H⁰(Ω¹) → H¹_dR → H¹(𝒪) → 0; the relative version for smooth proper curves over a base, with base change.

Consumers: `MordellLawrenceVenkatesh:LV.8/curve-topological-genus`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/SchemeAndStackFoundations/README.md

### LV-import-55 — ComplexComparisonPartII:C0

Comparison of algebraic and analytic local rings.

Consumers: `MordellLawrenceVenkatesh:LV.8/hurwitz-cover-complex`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: Analytification.normalization_finiteCover: compatibility of relative normalization in a finite covering with analytification; reflect normality and smoothness in characteristic zero using the local-ring comparison.

extensionOwner: ComplexComparisonPartII

supplierDocument: content/campaign/ComplexComparisonPartII/README.md

### LV-import-56 — ComplexComparisonPartII:C2

Projective GAGA for coherent sheaves and morphisms on smooth projective complex varieties (used to compare algebraic and analytic finite morphisms and their normalizations).

Consumers: `MordellLawrenceVenkatesh:LV.8/hurwitz-cover-complex`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/ComplexComparisonPartII/README.md

### LV-import-57 — InverseGaloisAndArithmeticFundamentalGroups:IG.3

The branch-cycle Riemann-existence route for covers of punctured complex curves.

Consumers: `MordellLawrenceVenkatesh:LV.8/hurwitz-cover-complex`, `MordellLawrenceVenkatesh:LV.8/hurwitz-descent`, `MordellLawrenceVenkatesh:LV.8/kodaira-parshin-fibre-map`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: FiniteEtaleCurve.riemannExistence (SGA 1 XII 5.1) as an equivalence compatible with pointed monodromy; compare this to the branch-cycle construction via compactification. EtaleFundamentalGroup.algebraicallyClosedBaseChange in characteristic zero (SGA 1 XIII 4) identifies K̄ and ℂ cover categories. Only curves are required here, not a new general-variety proof.

extensionOwner: InverseGaloisAndArithmeticFundamentalGroups

supplierDocument: content/campaign/InverseGaloisAndArithmeticFundamentalGroups/README.md

### LV-import-58 — InverseGaloisAndArithmeticFundamentalGroups:IG.0

Galois categories: finite étale coverings of a connected scheme are equivalent to finite continuous π₁^et-sets, functorially in pointed schemes; for Spec K this is the Galois correspondence.

Consumers: `MordellLawrenceVenkatesh:LV.8/hurwitz-descent`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/InverseGaloisAndArithmeticFundamentalGroups/README.md

### LV-import-59 — InverseGaloisAndArithmeticFundamentalGroups:IG.1

Arithmetic/geometric étale fundamental-group exact sequences and inertia at punctures.

Consumers: `MordellLawrenceVenkatesh:LV.8/hurwitz-descent`, `MordellLawrenceVenkatesh:LV.8/kodaira-parshin-fibre-map`, `MordellLawrenceVenkatesh:LV.11/weil-pairing-frobenius`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: Peripheral inertia transforms by the cyclotomic character up to conjugacy; the Galois-equivariant comparison H¹_et(−,A)=Hom_cont(π₁_et,A) for finite abelian A, compatible with the topological H¹ comparison.

extensionOwner: InverseGaloisAndArithmeticFundamentalGroups

supplierDocument: content/campaign/InverseGaloisAndArithmeticFundamentalGroups/README.md

### LV-import-60 — SchemeAndStackFoundations:SF.0

The normalization carrier (reuse pinned Scheme.Hom.normalization), finite-type schemes and field-base-change operations.

Consumers: `MordellLawrenceVenkatesh:LV.8/hurwitz-space`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: Normalization.finite for excellent finite-type schemes in a finite separable function-field extension; commutation with characteristic-zero field extension, including decomposition into components. Do not infer finiteness or smoothness from the carrier definition.

extensionOwner: SchemeAndStackFoundations

supplierDocument: content/campaign/SchemeAndStackFoundations/README.md

### LV-import-61 — tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme

For a smooth proper curve Z → B with geometrically connected fibres (B reduced of finite type over a field of characteristic zero): Pic⁰_{Z/B} is an abelian scheme with its canonical principal polarization, functorial for automorphisms of Z over B, compatible with base change; over ℂ, H₁(Pic⁰(Z_b)(ℂ), ℤ) = H₁(Z_b(ℂ), ℤ) with the intersection form as Riemann form.

Consumers: `MordellLawrenceVenkatesh:LV.8/reduced-prym`, `MordellLawrenceVenkatesh:LV.8/reduced-prym-homology`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/JacobianChallenge/README.md

### LV-import-62 — AlgebraicModuliForArithmeticGeometry:A0-extension

Representability of the relative degree-zero Picard functor of a smooth proper curve with geometrically connected fibres by a smooth proper group scheme (the input identified with the dual abelian scheme in A2).

Consumers: `MordellLawrenceVenkatesh:LV.8/reduced-prym`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/AlgebraicModuliForArithmeticGeometry/README.md

### LV-import-63 — AbelianSchemesAndArithmeticModuli:A1

Abelian schemes, homomorphisms, fibre dimensions and base change.

Consumers: `MordellLawrenceVenkatesh:LV.8/reduced-prym`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: AbelianScheme.ker_identityComponent: over a reduced finite-type characteristic-zero base, an endomorphism with constant kernel fibre dimension has an abelian kernel identity component compatible with base change. Include smoothness of the kernel and the representability/open-component argument, not just an absolute fibre statement.

extensionOwner: AbelianSchemesAndArithmeticModuli

supplierDocument: content/campaign/AbelianSchemesAndArithmeticModuli/README.md

### LV-import-64 — AbelianSchemesAndArithmeticModuli:A5

For a complex abelian variety A = V/Λ and an endomorphism ε: H₁((ker ε)°, ℚ) = ker(ε on Λ ⊗ ℚ); polarizations correspond to Riemann forms on H₁, and restriction of a polarization to an abelian subvariety corresponds to restriction of the Riemann form.

Consumers: `MordellLawrenceVenkatesh:LV.8/reduced-prym-homology`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/campaign/AbelianSchemesAndArithmeticModuli/README.md

### LV-import-65 — tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent

For a finite regular covering p : Z → C with deck group H: transfer p^* with p_*p^* = #H and p^*p_* = Σ_{h∈H} h_* on rational homology, so p_* : H₁(Z, ℚ)^H ≅ H₁(C, ℚ); compatibility with maps of coverings.

Consumers: `MordellLawrenceVenkatesh:LV.8/reduced-prym-homology`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/AlgebraicTopology/README.md

### LV-import-66 — EtaleDualityAndPerverseSheaves:EDC.2

Étale trace, duality and cup-product pairings under the stated invertible-coefficient hypotheses.

Consumers: `MordellLawrenceVenkatesh:LV.8/kodaira-parshin-fibre-map`, `MordellLawrenceVenkatesh:LV.11/weil-pairing-frobenius`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: SmoothProperCurve.h1_finiteCoefficients_free of rank 2g and alternating/perfect pairing with values in Hom(μ_N,ℤ/N), including even N; compare with the Jacobian Weil pairing. Good-reduction unramifiedness comes separately from proper-smooth base change.

extensionOwner: EtaleDualityAndPerverseSheaves

supplierDocument: content/campaign/EtaleDualityAndPerverseSheaves/README.md

### LV-import-67 — tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent

Transfer for unbranched finite covers and its norm/degree identities, with compatibility of maps.

Consumers: `MordellLawrenceVenkatesh:LV.9/primitive-homology`, `MordellLawrenceVenkatesh:LV.9/primitive-homology-decomposition`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: BranchedSurfaceCover.transfer on rational H₁: extend from the punctured cover by filling peripheral cycles, prove p_*p^*=q and the intersection projection formula; for a regular cover p^*p_*=Σh_*. This is a Part II extension, not supplied by the unbranched theorem.

extensionOwner: tauceti:TauCetiRoadmap/AlgebraicTopology

supplierDocument: content/tau-ceti/AlgebraicTopology/README.md

### LV-import-68 — tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality

Poincaré–Lefschetz duality for compact oriented surfaces with boundary, the resulting intersection pairing on H₁ (perfect for closed surfaces), and its compatibility with orientation-preserving homeomorphisms. Poincaré–Lefschetz duality H₁(W; ℤ) ≅ Hom(H₁(W, ∂W; ℤ), ℤ) for compact oriented surfaces with boundary.

Consumers: `MordellLawrenceVenkatesh:LV.9/primitive-homology`, `MordellLawrenceVenkatesh:LV.9/boundary-fixing-symplectic-surjective`, `MordellLawrenceVenkatesh:LV.9/affine-cover-normal-form`, `MordellLawrenceVenkatesh:LV.9/primitive-homology-decomposition`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/AlgebraicTopology/README.md

### LV-import-69 — tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations

Cellular homology of finite CW complexes, used for the 4g-gon model of a closed orientable surface (H₁ ≅ ℤ^{2g}, H₂ ≅ ℤ) and for graphs. The cycle space of a finite graph is its first homology, and cycles with disjoint edge supports are linearly independent.

Consumers: `MordellLawrenceVenkatesh:LV.9/preimage-classes-independent`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/AlgebraicTopology/README.md

### LV-import-70 — tauceti:TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid

The based van Kampen theorem for two open sets with path-connected intersection and the free-group presentation of the fundamental group of a finite wedge of circles. Van Kampen for a surface cut along a separating circle.

Consumers: `MordellLawrenceVenkatesh:LV.9/affine-cover-normal-form`, `MordellLawrenceVenkatesh:LV.10/covers-distinguished-by-curve`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/AlgebraicTopology/README.md

### LV-import-71 — tauceti:TauCetiRoadmap/AlgebraicTopology#stage-3-subdivision-excision-and-mayer--vietoris

The Mayer–Vietoris sequence for a surface decomposed along finitely many disjoint circles, with the pinned sign convention.

Consumers: `MordellLawrenceVenkatesh:LV.10/liftable-curve-system`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/AlgebraicTopology/README.md

### LV-import-72 — tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev

For a finite Galois extension M/ℚ (here M = K'(ζ_{m'})), an element ρ ∈ Gal(M/ℚ) and a finite set of primes, there are infinitely many primes p outside the set, unramified in M, with a prime of M above p whose arithmetic Frobenius is ρ (infinitude of frobeniusPrimeSet for the conjugacy class of ρ).

Consumers: `MordellLawrenceVenkatesh:LV.11/friendly-auxiliary-place`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/Chebotarev/README.md

### LV-import-73 — tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius

Composita of local unramified extensions remain unramified.

Consumers: `MordellLawrenceVenkatesh:LV.11/admissible-prime`.

contractAudit: Current stage supplies the need above; the additional named contract remains a recorded gap. Extend the existing owner via Part II; do not rewrite its accepted stages.

extensionNeed: NumberField.unramified_galoisClosure_iff: compare completions of conjugates and their compositum in the Galois closure, using the global-local decomposition dictionary.

extensionOwner: tauceti:TauCetiRoadmap/LocalFieldsRamification

supplierDocument: content/tau-ceti/LocalFieldsRamification/README.md

### LV-import-74 — tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts

Layer 12E: for the smooth proper geometrically connected model of a separably generated function field, the function-field genus equals dim H¹(X,𝒪). The comparison imports JacobianChallenge A–B; neither Riemann–Roch proof is re-planned here.

Consumers: `MordellLawrenceVenkatesh:LV.8/curve-topological-genus`.

contractAudit: The supplier stage text explicitly includes this kind of carrier, construction or theorem. The request retains its exact mathematical hypotheses; it is an import request, not an existing Lean declaration.

supplierDocument: content/tau-ceti/AlgebraicCurves/README.md

### LV-import-75 — SchemeAndStackFoundations:SF.2

Proper-smooth base change with finite coefficients ℤ/N, N invertible on the base: the geometric H¹ local system at a good-reduction place v∤N is unramified. Retain the coefficient and specialization hypotheses.

Consumers: `MordellLawrenceVenkatesh:LV.11/weil-pairing-frobenius`.

contractAudit: Actual stage supplies proper/smooth base change; this is its finite-coefficient specialization, not an additional purity theorem.

### LV-import-76 — LefschetzPencilsAndVanishingCycles:LPV.5

The characteristic-zero irreducible symplectic Lie algebra generated by rank-one square-zero operators x↦ω(δ,x)δ is sp(V) (Deligne Weil I 5.11). Supply its coefficient-field/base-change form; the geometric ℓ-adic open-image application is not the LV graph criterion.

Consumers: `MordellLawrenceVenkatesh:LV.0/transvection-graph-closure`.

contractAudit: LPV.5 explicitly owns the generic Deligne square-zero generation theorem. LV supplies connected-graph irreducibility and passes from Lie algebra to Zariski closure.

## Exact gaps

### G1 — LV-import-01 — Closures of abstract algebraic subgroups

AlgebraicGroup.abstractSubgroupClosure; finite-index closures have the same identity component; closure/image compatibility; normalizer compatibility; powers of a nontrivial additive one-parameter subgroup are dense in characteristic zero. Use algebraically closed characteristic-zero fields for the point-set assertions. Proposed Part II parent: tauceti:TauCetiRoadmap/ReductiveGroups.

Consumers: `MordellLawrenceVenkatesh:LV.0/zariski-closure-transvection-powers`, `MordellLawrenceVenkatesh:LV.0/transvection-pair-closure`, `MordellLawrenceVenkatesh:LV.0/transvection-graph-closure`, `MordellLawrenceVenkatesh:LV.0/symplectic-pair-lemma`, `MordellLawrenceVenkatesh:LV.0/symplectic-goursat`, `MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group`, `MordellLawrenceVenkatesh:LV.6/closed-subgroup-with-factor-unipotents`, `MordellLawrenceVenkatesh:LV.6/variant-family-full-monodromy`, `MordellLawrenceVenkatesh:LV.10/lifted-monodromy-dense-factor`, `MordellLawrenceVenkatesh:LV.10/lifted-monodromy-dense-product`, `MordellLawrenceVenkatesh:LV.10/normal-subgroups-of-symplectic-products`, `MordellLawrenceVenkatesh:LV.10/push-monodromy-dense`.

### G2 — LV-import-02 — Lie differentials and connected subgroup equality

AlgebraicGroup.lie_product; differential of a smooth surjective homomorphism is onto; connected closed H⊆G with Lie H=Lie G implies H=G in characteristic zero. Proposed Part II parent: tauceti:TauCetiRoadmap/ReductiveGroups.

Consumers: `MordellLawrenceVenkatesh:LV.0/symplectic-pair-lemma`, `MordellLawrenceVenkatesh:LV.0/symplectic-goursat`.

### G3 — LV-import-03 — Normal subgroups of symplectic groups

Sp(V) over an algebraically closed characteristic-zero field, dim V≥2: centre={±1}; every proper closed normal subgroup is central. Connectedness is separately reused from the pinned Sp coordinate-group theorem. Proposed Part II parent: tauceti:TauCetiRoadmap/ReductiveGroups.

Consumers: `MordellLawrenceVenkatesh:LV.0/symplectic-pair-lemma`, `MordellLawrenceVenkatesh:LV.6/closed-subgroup-with-factor-unipotents`, `MordellLawrenceVenkatesh:LV.10/normal-subgroups-of-symplectic-products`.

### G4 — LV-import-04 — Symplectic Lie structure and transvections

sp(V) is nonabelian simple; every Lie automorphism is Ad(h) for h∈Sp(V); arbitrary-form transvections generate Sp(V). Compare with the existing coordinate symplectic root-group API. Proposed Part II parent: tauceti:TauCetiRoadmap/ReductiveGroups.

Consumers: `MordellLawrenceVenkatesh:LV.0/symplectic-pair-lemma`, `MordellLawrenceVenkatesh:LV.0/transvection-graph-closure`.

### G5 — LV-import-06 — Continuous Mackey and semisimple image algebras

ContinuousRep.mackeyDecomposition for closed D and open H; restriction semisimplicity for finite-index normal subgroups in characteristic zero; comparison with pinned Rep.mackeyDecomposition, which is algebraic and has no continuity hypotheses. Proposed Part II parent: ArithmeticGaloisRepresentations.

Consumers: `MordellLawrenceVenkatesh:LV.1/frobenius-test-set`, `MordellLawrenceVenkatesh:LV.1/de-rham-of-induced`, `MordellLawrenceVenkatesh:LV.1/hodge-weight-sum-over-places`.

### G6 — LV-import-12 — Local de Rham characters and induction

LocalDeRhamCharacter.tateSen_invariants (Brinon–Conrad 2.2.7); local algebraicity of a de Rham ℚp-character; D_dR of finite induction as a filtered restriction-of-scalars space; preservation of crystalline representations for unramified induction. Proposed Part II parent: PadicHodgeTheory.

Consumers: `MordellLawrenceVenkatesh:LV.1/de-rham-character-locally-algebraic`, `MordellLawrenceVenkatesh:LV.1/filtration-weight`, `MordellLawrenceVenkatesh:LV.1/hodge-weight-pure-representation`, `MordellLawrenceVenkatesh:LV.1/de-rham-of-induced`.

### G7 — LV-import-28 — Spreading polarized families and good models

Scheme.spreadOut_finitePresentation with descent of group law, finite étale and abelian-scheme properties after enlarging S; Smooth.completedLocalRing_equiv_powerSeries at an 𝒪v-point over an unramified DVR and its bijection of a residue disk with (p𝒪v)^m. Proposed Part II parent: SchemeAndStackFoundations.

Consumers: `MordellLawrenceVenkatesh:LV.2/good-model-exists`, `MordellLawrenceVenkatesh:LV.2/residue-disk`.

### G8 — LV-import-30 — Symplectic Grassmannian schemes and charts

SymplecticGrassmannian.isotropic_closed; locally constant rank on every component of a finite étale algebra (not just total rank); Lagrangian affine charts by symmetric matrices and their base-change comparison. Zariski-closure descent for the period series is proved in the local LV node. Proposed Part II parent: AlgebraicModuliForArithmeticGeometry.

Consumers: `MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian`, `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety`, `MordellLawrenceVenkatesh:LV.3/power-series-zariski-closure`.

### G9 — LV-import-31 — Dimension and transcendence-degree interfaces

FiniteTypeScheme.dimension_eq_transcendenceDegree; proper closed subsets of irreducible schemes have smaller dimension; dim closure(image f)≤dim source; geometric irreducibility/dimension of products and scalar extension; irreducibility from overlapping irreducible opens. Proposed Part II parent: SchemeAndStackFoundations.

Consumers: `MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian-geometry`, `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety-splitting`, `MordellLawrenceVenkatesh:LV.4/filtered-phi-orbit`.

### G10 — LV-import-32 — Algebraic group orbits and transporters

AlgebraicGroup.orbitMorphism; closed transporter as an inverse image under orbitMorphism; dim orbit closure≤dim group. These are additional statements, not consequences imported from a stage title. Proposed Part II parent: tauceti:TauCetiRoadmap/ReductiveGroups.

Consumers: `MordellLawrenceVenkatesh:LV.3/complex-period-closure-contains-orbit`, `MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group`, `MordellLawrenceVenkatesh:LV.4/filtered-phi-orbit`.

### G11 — LV-import-34 — Completed analytic local rings

Analytification.completedLocalRingEquiv; regular parameters become holomorphic coordinates and the induced completed-ring map sends regular functions to their convergent Taylor series. Proposed Part II parent: ComplexComparisonPartII.

Consumers: `MordellLawrenceVenkatesh:LV.3/complex-period-map`, `MordellLawrenceVenkatesh:LV.3/period-maps-common-series`.

### G12 — LV-import-39 — Surface triangulation, collars and tameness

CompactSurface.triangulable from Jordan–Schönflies; topological collars and tameness of simple curves; cutting/regluing topological surfaces; extension of the closed triangulation theorem to boundary collars. The current Layer 1 expressly defers smoothing and triangulation. Proposed Part II parent: tauceti:TauCetiRoadmap/GeometricTopology.

Consumers: `MordellLawrenceVenkatesh:LV.5/surface`, `MordellLawrenceVenkatesh:LV.5/surface-classification`, `MordellLawrenceVenkatesh:LV.5/change-of-coordinates`, `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence`, `MordellLawrenceVenkatesh:LV.9/affine-cover-normal-form`.

### G13 — LV-import-41 — Surface homology basis and pairing

Surface-specific finite CW models, the integral handle/peripheral basis and intersection radical are assembled in surface-homology after classification; the stage does not prove this surface computation. Proposed Part II parent: tauceti:TauCetiRoadmap/GeometricTopology.

Consumers: `MordellLawrenceVenkatesh:LV.5/surface`, `MordellLawrenceVenkatesh:LV.5/dehn-twist-homology`, `MordellLawrenceVenkatesh:LV.5/configuration-family-monodromy`.

### G14 — LV-import-44 — Fibration sequences and surface asphericity

SerreFibration.homotopyExactSequence from the Stage-5 bundle-to-fibration bridge, and CompactSurface.aspherical for positive genus; use π₂ of the base, not of the fibre, to prove injection of π₁(fibre). Proposed Part II parent: tauceti:TauCetiRoadmap/AlgebraicTopology.

Consumers: `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence`, `MordellLawrenceVenkatesh:LV.5/birman-exact-sequence`.

### G15 — LV-import-49 — Finite étale geometric points at a place

FiniteEtaleAlgebra.geometricPoints_decompositionAtPlace: Hom_K(E,K̄) is the disjoint union of local embeddings with its decomposition-group action. This comparison requires the number-field/completion embedding dictionary in addition to local ramification theory. Proposed Part II parent: tauceti:TauCetiRoadmap/LocalFieldsRamification.

Consumers: `MordellLawrenceVenkatesh:LV.7/size-v`, `MordellLawrenceVenkatesh:LV.7/frobenius-orbits-places`.

### G16 — LV-import-50 — Componentwise rank in stable Grassmannians

The finite étale stable-Grassmannian locus must impose componentwise rank d on each rank-2d component; the total-rank condition alone has extra components. Proposed Part II parent: AlgebraicModuliForArithmeticGeometry.

Consumers: `MordellLawrenceVenkatesh:LV.7/lagrangian-general-position`.

### G17 — LV-import-51 — Dimensions under finite morphisms

The dimension contracts of request 30; finite surjective maps preserve dimension and send closed subsets to closed subsets of the same dimension. Proposed Part II parent: SchemeAndStackFoundations.

Consumers: `MordellLawrenceVenkatesh:LV.7/lagrangian-general-position`, `MordellLawrenceVenkatesh:LV.7/frobenius-stable-lagrangian-avoidance`.

### G18 — LV-import-55 — Analytic normalization of finite covers

Analytification.normalization_finiteCover: compatibility of relative normalization in a finite covering with analytification; reflect normality and smoothness in characteristic zero using the local-ring comparison. Proposed Part II parent: ComplexComparisonPartII.

Consumers: `MordellLawrenceVenkatesh:LV.8/hurwitz-cover-complex`.

### G19 — LV-import-57 — Finite étale Riemann existence and base change

FiniteEtaleCurve.riemannExistence (SGA 1 XII 5.1) as an equivalence compatible with pointed monodromy; compare this to the branch-cycle construction via compactification. EtaleFundamentalGroup.algebraicallyClosedBaseChange in characteristic zero (SGA 1 XIII 4) identifies K̄ and ℂ cover categories. Only curves are required here, not a new general-variety proof. Proposed Part II parent: InverseGaloisAndArithmeticFundamentalGroups.

Consumers: `MordellLawrenceVenkatesh:LV.8/hurwitz-cover-complex`, `MordellLawrenceVenkatesh:LV.8/hurwitz-descent`, `MordellLawrenceVenkatesh:LV.8/kodaira-parshin-fibre-map`.

### G20 — LV-import-59 — Peripheral inertia and finite cohomology action

Peripheral inertia transforms by the cyclotomic character up to conjugacy; the Galois-equivariant comparison H¹_et(−,A)=Hom_cont(π₁_et,A) for finite abelian A, compatible with the topological H¹ comparison. Proposed Part II parent: InverseGaloisAndArithmeticFundamentalGroups.

Consumers: `MordellLawrenceVenkatesh:LV.8/hurwitz-descent`, `MordellLawrenceVenkatesh:LV.8/kodaira-parshin-fibre-map`, `MordellLawrenceVenkatesh:LV.11/weil-pairing-frobenius`.

### G21 — LV-import-60 — Finite normalization over excellent schemes

Normalization.finite for excellent finite-type schemes in a finite separable function-field extension; commutation with characteristic-zero field extension, including decomposition into components. Do not infer finiteness or smoothness from the carrier definition. Proposed Part II parent: SchemeAndStackFoundations.

Consumers: `MordellLawrenceVenkatesh:LV.8/hurwitz-space`.

### G22 — LV-import-63 — Relative norm-kernel identity components

AbelianScheme.ker_identityComponent: over a reduced finite-type characteristic-zero base, an endomorphism with constant kernel fibre dimension has an abelian kernel identity component compatible with base change. Include smoothness of the kernel and the representability/open-component argument, not just an absolute fibre statement. Proposed Part II parent: AbelianSchemesAndArithmeticModuli.

Consumers: `MordellLawrenceVenkatesh:LV.8/reduced-prym`.

### G23 — LV-import-66 — Finite-coefficient curve cohomology and Weil pairing

SmoothProperCurve.h1_finiteCoefficients_free of rank 2g and alternating/perfect pairing with values in Hom(μ_N,ℤ/N), including even N; compare with the Jacobian Weil pairing. Good-reduction unramifiedness comes separately from proper-smooth base change. Proposed Part II parent: EtaleDualityAndPerverseSheaves.

Consumers: `MordellLawrenceVenkatesh:LV.8/kodaira-parshin-fibre-map`, `MordellLawrenceVenkatesh:LV.11/weil-pairing-frobenius`.

### G24 — LV-import-67 — Rational branched-cover transfer

BranchedSurfaceCover.transfer on rational H₁: extend from the punctured cover by filling peripheral cycles, prove p_*p^*=q and the intersection projection formula; for a regular cover p^*p_*=Σh_*. This is a Part II extension, not supplied by the unbranched theorem. Proposed Part II parent: tauceti:TauCetiRoadmap/AlgebraicTopology.

Consumers: `MordellLawrenceVenkatesh:LV.9/primitive-homology`.

### G25 — LV-import-73 — Unramified global Galois-closure completions

NumberField.unramified_galoisClosure_iff: compare completions of conjugates and their compositum in the Galois closure, using the global-local decomposition dictionary. Proposed Part II parent: tauceti:TauCetiRoadmap/LocalFieldsRamification.

Consumers: `MordellLawrenceVenkatesh:LV.11/admissible-prime`.

### G26 — Topological surface classification proof interfaces

Gallier–Xu Chapter 6 and Appendix E have now been read and hashed. The polygon reduction is planned explicitly. Still missing in the pinned libraries: Jordan–Schönflies disk extension in the required topological category, finite triangulation and its boundary-collar extension, and realization/homeomorphism preservation for polygon subdivisions. These are the precise GeometricTopology Part II imports, not a missing source citation.

Consumers: `MordellLawrenceVenkatesh:LV.5/surface`, `MordellLawrenceVenkatesh:LV.5/surface-classification`, `MordellLawrenceVenkatesh:LV.5/surface-homology`.

### G27 — Mapping-class prerequisites beyond smooth gluing

GeometricTopology Part II must export centrelessness of the surface group (g≥2), isotopy extension/identity-component control, capping and arbitrary finite forgetting surjectivity, and generation of Sp(2g,ℤ). AlgebraicTopology Part II must provide surface asphericity and the fibration LES from actual bundles. Point-pushing uses FundamentalGroup.mul_def (reverse traversal); the annular twist convention still requires the named local isotopy verification.

Consumers: `MordellLawrenceVenkatesh:LV.5/change-of-coordinates`, `MordellLawrenceVenkatesh:LV.5/point-push`, `MordellLawrenceVenkatesh:LV.5/birman-exact-sequence`, `MordellLawrenceVenkatesh:LV.5/capping-surjective`, `MordellLawrenceVenkatesh:LV.5/symplectic-representation-surjective`, `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence`.

### G28 — Faithful image-algebra trace criterion

Export the finite-dimensional image-algebra/Jacobson-radical bridge and primitive-central-idempotent decomposition needed by the displayed proof from the ArithmeticGaloisRepresentations Part II proposal. Trace(e_i)=multiplicity×dim(simple_i) separates multiplicities in characteristic zero; compare with pinned TauCeti Hom-dimension criterion. No finite-dimensionality or semisimplicity of k[G] is assumed.

Consumers: `MordellLawrenceVenkatesh:LV.1/trace-determines-semisimple`.

### G29 — Generic projector and relative Prym comparisons

Plan subgroup averaging once in rational group-algebra/representation infrastructure: e_H²=e_H, e_G e_H=e_G=e_H e_G, hence (e_H−e_G)²=e_H−e_G; #G(1−e_H+e_G) is integral. The relative kernel-component theorem is LV-import-63. Rational homology comparison also needs the branched transfer interface LV-import-67. The restricted polarization is not asserted principal.

Consumers: `MordellLawrenceVenkatesh:LV.8/affine-group-idempotents`, `MordellLawrenceVenkatesh:LV.8/reduced-prym`, `MordellLawrenceVenkatesh:LV.8/reduced-prym-homology`, `MordellLawrenceVenkatesh:LV.9/primitive-homology`.

### G30 — Distinguishing-curve disjoint-arc realization

LV Figure 4 displays a sample exponent, but does not itself prove the all-exponent curve construction. The plan records a specific model of two proper arcs in the punctured torus and two arcs in the spare handle whose completed loops intersect exactly once; verify their boundary endpoint order, collapse words β₂ and β₁β₂β₁⁻¹, and nonseparating homology. Once this model is supplied, applying T_d^m realizes the required word for every m. The primitive integral lift and signed-spanning/large-intersection arguments are now separate proved-outline targets.

Consumers: `MordellLawrenceVenkatesh:LV.10/covers-distinguished-by-curve`.

### G31 — Finite-extension analytic zero theorem adapter

ArithmeticDynamics:DY.6/strassmann-theorem already owns the ℚp theorem and is imported. Its stated carrier is ℚp, while LV uses K_v. Extend that owner by the finite-extension/nonarchimedean coefficient form; retain the same largest-maximal-coefficient proof, applied after rescaling the closed residue disk. Do not plan a second generic Strassmann theorem in LV.

Consumers: `MordellLawrenceVenkatesh:LV.3/strassmann`, `MordellLawrenceVenkatesh:LV.3/padic-period-preimage-finite`.

### G32 — Surface isotopy quotient signatures

The GeometricTopology Part II owner must provide the ambient-isotopy relation on oriented circle embeddings into the interior, reparameterization comparison, cutting collars and integral homology map. No opaque curve predicate is used in the Lean frontier. In addition, compare LV smooth embedded circles with the topological isotopy quotient using a compatible smoothing, and prove isotopy invariance of the integral fundamental class, separation and cutting collars.

Consumers: `MordellLawrenceVenkatesh:LV.5/simple-closed-curve`.

### G33 — Suggested signatures — semilinear-centralizer

Fixed-field module descent and the full unit-group/tensor-descent comparisons (LV.0 semilinear bound); no theorem result is included as a structure field. Exact omitted names: semilinearCentralizer_scalar. Partial comparison names: semilinearCentralizer, units_semilinearCentralizer, semilinearCentralizer_linear.

Consumers: `MordellLawrenceVenkatesh:LV.0/semilinear-centralizer`.

### G34 — Suggested signatures — symplectic-transvection

The pinned Tau isometry-group coercion and the full codimension-one/dual-hyperplane and arbitrary-field SL₂ comparisons for the explicit Mathlib linear-equivalence core. Exact omitted names: . Partial comparison names: symplecticTransvection, eq_symplecticTransvection_of_codim_one, symplecticTransvection_sl2.

Consumers: `MordellLawrenceVenkatesh:LV.0/symplectic-transvection`.

### G35 — Suggested signatures — largest-cm-subfield

The absolute-closure embedding/orbit interface for H, and an explicit cyclotomic-field carrier connected to NumberField.IsCMField, including the real-subfield tower. Exact omitted names: embeddings_eq_on_largestCMSubfield_iff, largestCMSubfield_cyclotomic. Partial comparison names: isCMField_largestCMSubfield_iff.

Consumers: `MordellLawrenceVenkatesh:LV.1/largest-cm-subfield`.

### G36 — Suggested signatures — friendly-place

Finite places with unramified Galois closure, restriction to E_K and E_K⁺, inertness/splitting, and the Frobenius/complex-conjugation orbit criterion of LV Definition 2.7. This needs the ClassFieldTheory/Chebotarev and ArithmeticGalois place interfaces. Exact omitted names: IsFriendly, IsFriendly.isUnramified, isFriendly_iff_of_not_hasCMSubfield, isFriendly_iff_exists_decomposition, isFriendly_of_frobenius, isFriendly_map, isFriendly_rat, IsFriendly.reviewTest1, IsFriendly.reviewTest2, IsFriendly.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.1/friendly-place`.

### G37 — Suggested signatures — abelian-by-finite-family

A diagram of schemes with finite étale base, polarized AbelianScheme over that base, relative dimension and finite-étale fibre-algebra comparisons; requires SF.2/SF.3 and AbelianSchemes R12.1 exact APIs. Exact omitted names: AbelianByFiniteFamily, AbelianByFiniteFamily.relDim, AbelianByFiniteFamily.total, AbelianByFiniteFamily.baseChange, AbelianByFiniteFamily.fibreAlgebra, AbelianByFiniteFamily.fibre, AbelianByFiniteFamily.ofAbelianScheme, AbelianByFiniteFamily.restrictScalars, AbelianByFiniteFamily.reviewTest1, AbelianByFiniteFamily.reviewTest2, AbelianByFiniteFamily.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.2/abelian-by-finite-family`.

### G38 — Suggested signatures — good-model

Spread-out polarized abelian-by-finite diagrams over O_S, generic-fibre isomorphisms and good-reduction specializations; requires request LV-import-28 and integral point/base-change interfaces. Exact omitted names: IsGoodModel, IsGoodModel.baseChange, IsGoodModel.integralPoints, IsGoodModel.fibre_goodReduction, IsGoodModel.deRham_locallyFree, IsGoodModel.of_polarizedAbelianScheme, IsGoodModel.reviewTest1, IsGoodModel.reviewTest2, IsGoodModel.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.2/good-model`.

### G39 — Suggested signatures — de-rham-bundle

Relative H¹_dR as a locally free O_Y-module with the finite étale algebra action, Hodge subbundle, polarization pairing, integrable connection and fibre/base-change comparisons; requires CohomologyComparisons R17.1–R17.4. Exact omitted names: deRhamBundle, deRhamBundle.hodge, deRhamBundle.pairing, deRhamBundle.gaussManin, deRhamBundle.fibreEquiv, deRhamBundle.fibreDecomp, deRhamBundle.baseChange, deRhamBundle.eq_gaussManin_total, deRhamBundle.legendre, deRhamBundle.reviewTest1, deRhamBundle.reviewTest2, deRhamBundle.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.2/de-rham-bundle`.

### G40 — Suggested signatures — residue-disk

Integral points reducing to a fixed smooth special-fibre point, analytic parameter equivalences, finite cover by disks and finite-étale product decomposition over K_v; requires formal/completed-local and p-adic analytic owner APIs. Exact omitted names: residueDisk, residueDisk.coords, residueDisk.coords_germ, residueDisk.mem_iff, residueDisk.coords_change, residueDisk.finiteEtale, residueDisk.cover, residueDisk.affineLine, residueDisk.reviewTest1, residueDisk.reviewTest2, residueDisk.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.2/residue-disk`.

### G41 — Suggested signatures — gauss-manin-transport-padic

Horizontal analytic parallel transport on a full residue disk with integrability, convergence, inverse, algebra action and pairing; requires the connection/analytic formalism and the LV convergence result. Exact omitted names: gaussManinTransport, gaussManinTransport_self, gaussManinTransport_trans, gaussManinTransport_algebra, gaussManinTransport_pairing, gaussManinTransport_matrix, gaussManinTransport_indep, gaussManinTransport_pairs, gaussManinTransport_constant, gaussManinTransport.reviewTest1, gaussManinTransport.reviewTest2, gaussManinTransport.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-padic`.

### G42 — Suggested signatures — gauss-manin-transport-complex

Complex analytic parallel transport and Riemann–Hilbert comparison with the rational/Betti local system, continued on the universal cover; requires ComplexComparisonPartII and owner local-system APIs. Exact omitted names: gaussManinTransportComplex, gaussManinTransportComplex_eq_parallel, gaussManinTransportComplex_series, gaussManinTransportComplex_trans, gaussManinTransportComplex_pairing, gaussManinTransportComplex_monodromy, gaussManinTransportComplex_legendre, gaussManinTransportComplex.reviewTest1, gaussManinTransportComplex.reviewTest2, gaussManinTransportComplex.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.2/gauss-manin-transport-complex`.

### G43 — Suggested signatures — crystalline-frobenius-on-fibres

Actual crystalline H¹ of the special fibre, its invertible semilinear Frobenius and crystalline–de Rham/parallel-transport comparison, including similitude pairing; requires CrystallineCohomology R14.4 and p-adic cohomology comparisons. Exact omitted names: crystallineFrobenius, crystallineFrobenius_semilinear, crystallineFrobenius_bijective, crystallineFrobenius_transport, crystallineFrobenius_factor, crystallineFrobenius_pairing, crystallineFrobenius_example, crystallineFrobenius.reviewTest1, crystallineFrobenius.reviewTest2, crystallineFrobenius.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.2/crystalline-frobenius-on-fibres`.

### G44 — Suggested signatures — lagrangian-grassmannian

The representing Grassmannian scheme, tautological subbundle, closed isotropy section, symmetric graph charts, Plücker embedding and symplectic group action; Mathlib supplies the functor, not this representing-scheme package. Exact omitted names: LagrangianGrassmannian, LagrangianGrassmannian.functor, LagrangianGrassmannian.mem_points_iff, LagrangianGrassmannian.chart, LagrangianGrassmannian.chart_cover, LagrangianGrassmannian.plucker, LagrangianGrassmannian.action, LagrangianGrassmannian.baseChange, LagrangianGrassmannian.dimOne, LagrangianGrassmannian.reviewTest1, LagrangianGrassmannian.reviewTest2, LagrangianGrassmannian.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian`.

### G45 — Suggested signatures — lagrangian-period-variety

Finite-étale componentwise-rank Grassmannian, trace pairing, E-stable isotropic closed locus and semilinear algebraic-group action; the full stable locus is not the fixed-rank Weil restriction (LV-import-30 and LV-import-50). Exact omitted names: periodVariety, periodVariety.mem_iff, periodVariety.mem_points_iff_free, periodVariety.traceForm, periodVariety.baseChange, periodVariety.prodEquiv, periodVariety.semilinearAction, periodVariety.plucker, periodVariety.stableGrassmannian, periodVariety.dimOne, periodVariety.reviewTest1, periodVariety.reviewTest2, periodVariety.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety`.

### G46 — Suggested signatures — algebraic-monodromy-group

Betti local-system monodromy, algebraic subgroup closure and its de Rham tensor/algebra normalizer comparison; requires LV-import-01/32 and the actual comparison isomorphisms. Exact omitted names: monodromyRep, algebraicMonodromyGroup, HasFullMonodromy, algebraicMonodromyGroup_le_normalizer, hasFullMonodromy_iff_basepoint, algebraicMonodromyGroup_deRham, HasFullMonodromy.orbit_eq, hasFullMonodromy_legendre, monodromyRep.reviewTest1, monodromyRep.reviewTest2, monodromyRep.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.3/algebraic-monodromy-group`.

### G47 — Suggested signatures — padic-period-map

Analytic Grassmannian-valued map obtained from the actual Hodge subbundle and horizontal transport, with the E-linear/isotropic and rebase comparisons. Exact omitted names: padicPeriodMap, padicPeriodMap_base, padicPeriodMap_mem, padicPeriodMap_transport, padicPeriodMap_rebase, padicPeriodMap_constant, padicPeriodMap.reviewTest1, padicPeriodMap.reviewTest2, padicPeriodMap.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.3/padic-period-map`.

### G48 — Suggested signatures — complex-period-map

Holomorphic lifted Grassmannian map on the universal cover, with rational monodromy equivariance and the local power-series comparison to the p-adic map. Exact omitted names: complexPeriodMap, complexPeriodMap.lift, complexPeriodMap.lift_base, complexPeriodMap.lift_equivariant, complexPeriodMap.lift_holomorphic, complexPeriodMap.lift_eq, complexPeriodMap.mem, complexPeriodMap.legendre, complexPeriodMap.reviewTest1, complexPeriodMap.reviewTest2, complexPeriodMap.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.3/complex-period-map`.

### G49 — Suggested signatures — surface

Bare compact oriented topological two-manifold-with-boundary and its punctured interior complement, with collars and tame cutting; requires GeometricTopology Part II. Genus, homology and classification are separate results. Exact omitted names: Surface, Surface.numPunctures, Surface.cut, Surface.examples, Surface.reviewTest1, Surface.reviewTest2, Surface.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.5/surface`.

### G50 — Suggested signatures — mapping-class-group

Ambient-isotopy quotient of orientation-preserving homeomorphisms fixing boundary and preserving marked points, plus forgetful, homology, curve and covering actions; requires GeometricTopology Part II. Exact omitted names: MappingClassGroup, MappingClassGroup.marked, MappingClassGroup.homologyRep, MappingClassGroup.actCurves, MappingClassGroup.actCovers, MappingClassGroup.forget, MappingClassGroup.examples, MappingClassGroup.reviewTest1, MappingClassGroup.reviewTest2, MappingClassGroup.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.5/mapping-class-group`.

### G51 — Suggested signatures — dehn-twist

Annulus collar construction and isotopy independence, supported multitwists, boundary behaviour and intersection-form convention; requires the surface/isotopy/collar interface. Exact omitted names: dehnTwist, dehnTwist_conj, dehnTwist_commute, dehnTwist_eq_one, dehnTwist_support, multitwist, dehnTwist_torus, dehnTwist.reviewTest1, dehnTwist.reviewTest2, dehnTwist.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.5/dehn-twist`.

### G52 — Suggested signatures — point-push

Isotopy extension of a marked point, endpoint mapping class and its based-loop action with Mathlib multiplication; the exact Birman sequence requires centrelessness/isotopy-control gaps. Exact omitted names: pointPush, pointPush_apply, forget_pointPush, pointPush_action, pointPush_homology, pointPush_torus, pointPush.reviewTest1, pointPush.reviewTest2, pointPush.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.5/point-push`.

### G53 — Suggested signatures — simple-closed-curve

Oriented smooth/tame embedding and its ambient-isotopy quotient, homology orientation, complement separation and collar-cutting data; requires the smoothing/isotopy comparison. Exact omitted names: SimpleClosedCurve, SimpleClosedCurve.homologyClass, SimpleClosedCurve.IsSeparating, SimpleClosedCurve.reverse, SimpleClosedCurve.map, SimpleClosedCurve.cut, SimpleClosedCurve.reviewTest1, SimpleClosedCurve.reviewTest2, SimpleClosedCurve.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.5/simple-closed-curve`.

### G54 — Suggested signatures — legendre-family

Finite-étale parameter-cover scheme u↦u^m and relative Legendre abelian scheme, compared with the concrete Weierstrass/AdjoinRoot cores. Exact omitted names: legendreVariant, legendreVariant.isGoodModel, legendreVariant.fibreAlgebra, legendreVariant.analytic. Partial comparison names: legendreCurve, legendreCurve.reviewTest2.

Consumers: `MordellLawrenceVenkatesh:LV.6/legendre-family`.

### G55 — Suggested signatures — size-v

Unramified finite G_K-set and Frobenius-place adapter, followed by finite-étale geometric-point and completed-field-degree comparisons (LV-import-49). Exact omitted names: sizeV_scheme, sizeV_eq_places. Partial comparison names: sizeV, sizeV_indep.

Consumers: `MordellLawrenceVenkatesh:LV.7/size-v`.

### G56 — Suggested signatures — singly-ramified-surjections

Profinite continuous homomorphism and quotient-factorization comparisons for the abstract-group carrier; the centreless stabilizer convention is already stated. Exact omitted names: . Partial comparison names: singlyRamifiedSurjections, singlyRamifiedSurjections.comap.

Consumers: `MordellLawrenceVenkatesh:LV.8/singly-ramified-surjections`.

### G57 — Suggested signatures — hurwitz-cover-complex

Actual finite analytic covering of the base with surjection-class fibres and universal branched covering family, including local z↦z^q models, from the exact Riemann-existence/configuration interfaces. Exact omitted names: hurwitzComplex, hurwitzComplex.fibre, hurwitzComplex.torsor, hurwitzComplex.localForm, hurwitzComplex.relativeCurve, hurwitzComplex.configuration, hurwitzComplex.aff3, hurwitzComplex.reviewTest1, hurwitzComplex.reviewTest2, hurwitzComplex.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.8/hurwitz-cover-complex`.

### G58 — Suggested signatures — reduced-prym

Relative identity component of the norm-kernel on Jacobians, its polarization and H¹ projector comparison, requiring LV-import-63 and the generic-projector gap. Exact omitted names: reducedPrym, reducedPrym.isAbelianScheme, reducedPrym.polarization, reducedPrym.fibre, reducedPrym.baseChange, reducedPrym.dim, reducedPrym.example, reducedPrym.reviewTest1, reducedPrym.reviewTest2, reducedPrym.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.8/reduced-prym`.

### G59 — Suggested signatures — kodaira-parshin-family

Finite étale Hurwitz scheme and smooth proper branched-curve diagram, followed by the reduced-Prym abelian scheme, spreading model and primitive-homology comparison. Exact omitted names: kodairaParshinCurves, kodairaParshin, kodairaParshin.relDim, kodairaParshin.exists_goodModel, kodairaParshin.fibreEquiv, kodairaParshin.fibreHomology, kodairaParshin.example, kodairaParshinCurves.reviewTest1, kodairaParshinCurves.reviewTest2, kodairaParshinCurves.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.8/kodaira-parshin-family`.

### G60 — Suggested signatures — affine-cover

Covering-space classification with a labelled Aff(q) monodromy representation, compactification at a single puncture and ramification/genus comparisons; not a structure containing these theorems as assumptions. Exact omitted names: AffineCover, AffineCover.cov, AffineCover.iso_iff, AffineCover.cycleType, SinglyRamified, SinglyRamified.genus, SinglyRamified.finite, SinglyRamified.modAction, SinglyRamified.example, AffineCover.reviewTest1, AffineCover.reviewTest2, AffineCover.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.9/affine-cover`.

### G61 — Suggested signatures — primitive-homology

Singular H₁ pushforward and rational branched transfer with the projection formula, surface pairing and genus computation; linear-map kernels alone do not supply these identities. Exact omitted names: transfer. Partial comparison names: primitiveHomology, isCompl_primitiveHomology, primitiveHomology_eq_orthogonal, primitiveHomology.symplectic, primitiveHomology.equivariant, primitiveHomology.finrank, primitiveHomology.trivialCover. The example states the rank-10/rank-4 kernel computation and kills the normalized transfer. The Aff(3) genus-two cover must supply those actual homology ranks and the transfer identity.

Consumers: `MordellLawrenceVenkatesh:LV.9/primitive-homology`.

### G62 — Suggested signatures — lifted-monodromy

Unique lift of a mapping class preserving a covering class, its rational H₁ representation and compatibility with transfer, products and the lifted Dehn multitwist. Exact omitted names: liftMappingClass, liftMappingClass_unique, monodromyMap, stabilizerAll, pushSubgroup, monodromyMap.prod, monodromyMap_push_transfer, monodromyMap_twist, monodromyMap.example, liftMappingClass.reviewTest1, liftMappingClass.reviewTest2, liftMappingClass.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.9/lifted-monodromy`.

### G63 — Suggested signatures — liftable-curve

Actual embedded curve, monodromy linear part, unique degree-one lift and primitive class; its computation is now the separate liftable-curve-transvection theorem. Exact omitted names: IsLiftable, IsLiftable.nonseparating, IsLiftable.liftPlus, IsLiftable.primitiveClass, IsLiftable.mon_twist, IsLiftable.inner_eq, IsLiftable.example, IsLiftable.reviewTest1, IsLiftable.reviewTest2, IsLiftable.reviewTest3. Partial comparison names: .

Consumers: `MordellLawrenceVenkatesh:LV.9/liftable-curve`.

### G64 — Named theorem interfaces — LV.0

State these theorem signatures only after the precise carriers and import contracts listed on their nodes are supplied. No arbitrary proposition or theorem-valued field substitutes for those hypotheses. Exact targets: galois-tensor-splitting, semilinear-centralizer-finrank, semilinear-centralizer-unramified, affine-group-cycle-type, affine-group-centralizer, commutator-product-map, generating-tuples-card, isotropic-subgroup-card, minimal-subrepresentation-half, zariski-closure-transvection-powers, transvection-pair-closure, transvection-graph-closure, lie-algebra-goursat, symplectic-pair-lemma, symplectic-goursat, galois-module-splitting, two-factor-lie-goursat, ideals-of-simple-products.

Consumers: `MordellLawrenceVenkatesh:LV.0/galois-tensor-splitting`, `MordellLawrenceVenkatesh:LV.0/semilinear-centralizer-finrank`, `MordellLawrenceVenkatesh:LV.0/semilinear-centralizer-unramified`, `MordellLawrenceVenkatesh:LV.0/affine-group-cycle-type`, `MordellLawrenceVenkatesh:LV.0/affine-group-centralizer`, `MordellLawrenceVenkatesh:LV.0/commutator-product-map`, `MordellLawrenceVenkatesh:LV.0/generating-tuples-card`, `MordellLawrenceVenkatesh:LV.0/isotropic-subgroup-card`, `MordellLawrenceVenkatesh:LV.0/minimal-subrepresentation-half`, `MordellLawrenceVenkatesh:LV.0/zariski-closure-transvection-powers`, `MordellLawrenceVenkatesh:LV.0/transvection-pair-closure`, `MordellLawrenceVenkatesh:LV.0/transvection-graph-closure`, `MordellLawrenceVenkatesh:LV.0/lie-algebra-goursat`, `MordellLawrenceVenkatesh:LV.0/symplectic-pair-lemma`, `MordellLawrenceVenkatesh:LV.0/symplectic-goursat`, `MordellLawrenceVenkatesh:LV.0/galois-module-splitting`, `MordellLawrenceVenkatesh:LV.0/two-factor-lie-goursat`, `MordellLawrenceVenkatesh:LV.0/ideals-of-simple-products`.

### G65 — Named theorem interfaces — LV.1

State these theorem signatures only after the precise carriers and import contracts listed on their nodes are supplied. No arbitrary proposition or theorem-valued field substitutes for those hypotheses. Exact targets: weil-polynomials-finite, frobenius-test-set, faltings-finiteness, cm-or-totally-real-criterion, infinity-type-factorization, friendly-exponent-half, de-rham-character-locally-algebraic, pure-character-conjugation-relation, pure-character-friendly, hodge-weight-pure-representation, de-rham-of-induced, hodge-weight-sum-over-places, abelian-variety-cohomology-properties.

Consumers: `MordellLawrenceVenkatesh:LV.1/weil-polynomials-finite`, `MordellLawrenceVenkatesh:LV.1/frobenius-test-set`, `MordellLawrenceVenkatesh:LV.1/faltings-finiteness`, `MordellLawrenceVenkatesh:LV.1/cm-or-totally-real-criterion`, `MordellLawrenceVenkatesh:LV.1/infinity-type-factorization`, `MordellLawrenceVenkatesh:LV.1/friendly-exponent-half`, `MordellLawrenceVenkatesh:LV.1/de-rham-character-locally-algebraic`, `MordellLawrenceVenkatesh:LV.1/pure-character-conjugation-relation`, `MordellLawrenceVenkatesh:LV.1/pure-character-friendly`, `MordellLawrenceVenkatesh:LV.1/hodge-weight-pure-representation`, `MordellLawrenceVenkatesh:LV.1/de-rham-of-induced`, `MordellLawrenceVenkatesh:LV.1/hodge-weight-sum-over-places`, `MordellLawrenceVenkatesh:LV.1/abelian-variety-cohomology-properties`.

### G66 — Named theorem interfaces — LV.2

State these theorem signatures only after the precise carriers and import contracts listed on their nodes are supplied. No arbitrary proposition or theorem-valued field substitutes for those hypotheses. Exact targets: good-model-exists, formal-horizontal-sections, horizontal-sections-padic-convergence, horizontal-sections-complex-convergence.

Consumers: `MordellLawrenceVenkatesh:LV.2/good-model-exists`, `MordellLawrenceVenkatesh:LV.2/formal-horizontal-sections`, `MordellLawrenceVenkatesh:LV.2/horizontal-sections-padic-convergence`, `MordellLawrenceVenkatesh:LV.2/horizontal-sections-complex-convergence`.

### G67 — Named theorem interfaces — LV.3

State these theorem signatures only after the precise carriers and import contracts listed on their nodes are supplied. No arbitrary proposition or theorem-valued field substitutes for those hypotheses. Exact targets: lagrangian-symplectic-basis, isotropic-dimension, lagrangian-transitivity, lagrangian-transverse-chart, arnold-chart-cover, lagrangian-grassmannian-geometry, lagrangian-period-variety-splitting, period-maps-common-series, complex-period-closure-contains-orbit, convergent-series-vanishing, power-series-zariski-closure, padic-period-image-dense, strassmann, padic-period-preimage-finite.

Consumers: `MordellLawrenceVenkatesh:LV.3/lagrangian-symplectic-basis`, `MordellLawrenceVenkatesh:LV.3/isotropic-dimension`, `MordellLawrenceVenkatesh:LV.3/lagrangian-transitivity`, `MordellLawrenceVenkatesh:LV.3/lagrangian-transverse-chart`, `MordellLawrenceVenkatesh:LV.3/arnold-chart-cover`, `MordellLawrenceVenkatesh:LV.3/lagrangian-grassmannian-geometry`, `MordellLawrenceVenkatesh:LV.3/lagrangian-period-variety-splitting`, `MordellLawrenceVenkatesh:LV.3/period-maps-common-series`, `MordellLawrenceVenkatesh:LV.3/complex-period-closure-contains-orbit`, `MordellLawrenceVenkatesh:LV.3/convergent-series-vanishing`, `MordellLawrenceVenkatesh:LV.3/power-series-zariski-closure`, `MordellLawrenceVenkatesh:LV.3/padic-period-image-dense`, `MordellLawrenceVenkatesh:LV.3/strassmann`, `MordellLawrenceVenkatesh:LV.3/padic-period-preimage-finite`.

### G68 — Named theorem interfaces — LV.4

State these theorem signatures only after the precise carriers and import contracts listed on their nodes are supplied. No arbitrary proposition or theorem-valued field substitutes for those hypotheses. Exact targets: fibre-representation-crystalline, fibre-filtered-phi-transport, filtered-phi-orbit, finiteness-criterion, proposition-3-4.

Consumers: `MordellLawrenceVenkatesh:LV.4/fibre-representation-crystalline`, `MordellLawrenceVenkatesh:LV.4/fibre-filtered-phi-transport`, `MordellLawrenceVenkatesh:LV.4/filtered-phi-orbit`, `MordellLawrenceVenkatesh:LV.4/finiteness-criterion`, `MordellLawrenceVenkatesh:LV.4/proposition-3-4`.

### G69 — Named theorem interfaces — LV.5

State these theorem signatures only after the precise carriers and import contracts listed on their nodes are supplied. No arbitrary proposition or theorem-valued field substitutes for those hypotheses. Exact targets: surface-classification, change-of-coordinates, dehn-twist-homology, primitive-classes-simple, birman-exact-sequence, capping-surjective, symplectic-representation-surjective, fadell-neuwirth-sequence, covering-dehn-twist-lift, configuration-family-monodromy, surface-homology.

Consumers: `MordellLawrenceVenkatesh:LV.5/surface-classification`, `MordellLawrenceVenkatesh:LV.5/change-of-coordinates`, `MordellLawrenceVenkatesh:LV.5/dehn-twist-homology`, `MordellLawrenceVenkatesh:LV.5/primitive-classes-simple`, `MordellLawrenceVenkatesh:LV.5/birman-exact-sequence`, `MordellLawrenceVenkatesh:LV.5/capping-surjective`, `MordellLawrenceVenkatesh:LV.5/symplectic-representation-surjective`, `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence`, `MordellLawrenceVenkatesh:LV.5/covering-dehn-twist-lift`, `MordellLawrenceVenkatesh:LV.5/configuration-family-monodromy`, `MordellLawrenceVenkatesh:LV.5/surface-homology`.

### G70 — Named theorem interfaces — LV.6

State these theorem signatures only after the precise carriers and import contracts listed on their nodes are supplied. No arbitrary proposition or theorem-valued field substitutes for those hypotheses. Exact targets: s-unit-reductions, kummer-cyclic-field, inert-auxiliary-place, legendre-monodromy, closed-subgroup-with-factor-unipotents, variant-family-full-monodromy, legendre-generic-simplicity, s-unit-residue-disk-finite, s-unit-theorem.

Consumers: `MordellLawrenceVenkatesh:LV.6/s-unit-reductions`, `MordellLawrenceVenkatesh:LV.6/kummer-cyclic-field`, `MordellLawrenceVenkatesh:LV.6/inert-auxiliary-place`, `MordellLawrenceVenkatesh:LV.6/legendre-monodromy`, `MordellLawrenceVenkatesh:LV.6/closed-subgroup-with-factor-unipotents`, `MordellLawrenceVenkatesh:LV.6/variant-family-full-monodromy`, `MordellLawrenceVenkatesh:LV.6/legendre-generic-simplicity`, `MordellLawrenceVenkatesh:LV.6/s-unit-residue-disk-finite`, `MordellLawrenceVenkatesh:LV.6/s-unit-theorem`.

### G71 — Named theorem interfaces — LV.7

State these theorem signatures only after the precise carriers and import contracts listed on their nodes are supplied. No arbitrary proposition or theorem-valued field substitutes for those hypotheses. Exact targets: frobenius-orbits-places, lagrangian-general-position, frobenius-stable-lagrangian-avoidance, generic-simplicity-sublemma, generic-simplicity-family, representations-vary, proposition-5-3.

Consumers: `MordellLawrenceVenkatesh:LV.7/frobenius-orbits-places`, `MordellLawrenceVenkatesh:LV.7/lagrangian-general-position`, `MordellLawrenceVenkatesh:LV.7/frobenius-stable-lagrangian-avoidance`, `MordellLawrenceVenkatesh:LV.7/generic-simplicity-sublemma`, `MordellLawrenceVenkatesh:LV.7/generic-simplicity-family`, `MordellLawrenceVenkatesh:LV.7/representations-vary`, `MordellLawrenceVenkatesh:LV.7/proposition-5-3`.

### G72 — Named theorem interfaces — LV.8

State these theorem signatures only after the precise carriers and import contracts listed on their nodes are supplied. No arbitrary proposition or theorem-valued field substitutes for those hypotheses. Exact targets: curve-topological-genus, surjection-action-extension, hurwitz-descent, hurwitz-space, affine-group-idempotents, reduced-prym-homology, kodaira-parshin-fibre-map.

Consumers: `MordellLawrenceVenkatesh:LV.8/curve-topological-genus`, `MordellLawrenceVenkatesh:LV.8/surjection-action-extension`, `MordellLawrenceVenkatesh:LV.8/hurwitz-descent`, `MordellLawrenceVenkatesh:LV.8/hurwitz-space`, `MordellLawrenceVenkatesh:LV.8/affine-group-idempotents`, `MordellLawrenceVenkatesh:LV.8/reduced-prym-homology`, `MordellLawrenceVenkatesh:LV.8/kodaira-parshin-fibre-map`.

### G73 — Named theorem interfaces — LV.9

State these theorem signatures only after the precise carriers and import contracts listed on their nodes are supplied. No arbitrary proposition or theorem-valued field substitutes for those hypotheses. Exact targets: preimage-classes-independent, twist-rank-detects-cycle-type, liftable-curve-transvection, boundary-fixing-symplectic-surjective, affine-cover-normal-form, normal-form-curves, primitive-homology-decomposition.

Consumers: `MordellLawrenceVenkatesh:LV.9/preimage-classes-independent`, `MordellLawrenceVenkatesh:LV.9/twist-rank-detects-cycle-type`, `MordellLawrenceVenkatesh:LV.9/liftable-curve-transvection`, `MordellLawrenceVenkatesh:LV.9/boundary-fixing-symplectic-surjective`, `MordellLawrenceVenkatesh:LV.9/affine-cover-normal-form`, `MordellLawrenceVenkatesh:LV.9/normal-form-curves`, `MordellLawrenceVenkatesh:LV.9/primitive-homology-decomposition`.

### G74 — Named theorem interfaces — LV.10

State these theorem signatures only after the precise carriers and import contracts listed on their nodes are supplied. No arbitrary proposition or theorem-valued field substitutes for those hypotheses. Exact targets: push-monodromy-noncentral, covers-distinguished-by-curve, liftable-curve-system, lifted-monodromy-dense-factor, lifted-monodromy-dense-product, normal-subgroups-of-symplectic-products, push-monodromy-dense, kodaira-parshin-full-monodromy.

Consumers: `MordellLawrenceVenkatesh:LV.10/push-monodromy-noncentral`, `MordellLawrenceVenkatesh:LV.10/covers-distinguished-by-curve`, `MordellLawrenceVenkatesh:LV.10/liftable-curve-system`, `MordellLawrenceVenkatesh:LV.10/lifted-monodromy-dense-factor`, `MordellLawrenceVenkatesh:LV.10/lifted-monodromy-dense-product`, `MordellLawrenceVenkatesh:LV.10/normal-subgroups-of-symplectic-products`, `MordellLawrenceVenkatesh:LV.10/push-monodromy-dense`, `MordellLawrenceVenkatesh:LV.10/kodaira-parshin-full-monodromy`.

### G75 — Named theorem interfaces — LV.11

State these theorem signatures only after the precise carriers and import contracts listed on their nodes are supplied. No arbitrary proposition or theorem-valued field substitutes for those hypotheses. Exact targets: admissible-prime, friendly-auxiliary-place, weil-pairing-frobenius, small-orbit-count, size-bound, faltings-theorem.

Consumers: `MordellLawrenceVenkatesh:LV.11/admissible-prime`, `MordellLawrenceVenkatesh:LV.11/friendly-auxiliary-place`, `MordellLawrenceVenkatesh:LV.11/weil-pairing-frobenius`, `MordellLawrenceVenkatesh:LV.11/small-orbit-count`, `MordellLawrenceVenkatesh:LV.11/size-bound`, `MordellLawrenceVenkatesh:LV.11/faltings-theorem`.

## Ownership and restructuring proposals

- Generic compact-surface and mapping-class theory extends the existing GeometricTopology direction; fibrations, asphericity and branched transfer extend AlgebraicTopology. LV.5 retains its current node IDs pending orchestration; no upstream roadmap is re-planned. Create GeometricTopology, Part II: compact surfaces and mapping class groups, with GeometricTopology as parent. Transfer the listed LV.5 targets, including classification, surface homology, twists, point-pushing and Birman, to that extension after scope approval. Create AlgebraicTopology, Part II: surface fibrations and branched transfer, with AlgebraicTopology as parent; import its named fibration LES, asphericity, branched rational transfer and projection formulas. LV.9–10 retain only the Aff(q)-cover comparisons and LV generation argument.
  Retained nodes: `MordellLawrenceVenkatesh:LV.5/surface`, `MordellLawrenceVenkatesh:LV.5/surface-classification`, `MordellLawrenceVenkatesh:LV.5/mapping-class-group`, `MordellLawrenceVenkatesh:LV.5/change-of-coordinates`, `MordellLawrenceVenkatesh:LV.5/dehn-twist`, `MordellLawrenceVenkatesh:LV.5/dehn-twist-homology`, `MordellLawrenceVenkatesh:LV.5/primitive-classes-simple`, `MordellLawrenceVenkatesh:LV.5/point-push`, `MordellLawrenceVenkatesh:LV.5/birman-exact-sequence`, `MordellLawrenceVenkatesh:LV.5/capping-surjective`, `MordellLawrenceVenkatesh:LV.5/symplectic-representation-surjective`, `MordellLawrenceVenkatesh:LV.5/fadell-neuwirth-sequence`, `MordellLawrenceVenkatesh:LV.5/covering-dehn-twist-lift`, `MordellLawrenceVenkatesh:LV.5/configuration-family-monodromy`, `MordellLawrenceVenkatesh:LV.5/surface-homology`, `MordellLawrenceVenkatesh:LV.5/simple-closed-curve`.
  Proposed exports: Topological surface models — Jordan–Schönflies disk extension, Finite triangulation, boundary collars and tame cutting, Canonical polygon form and classification, Type, integral homology basis and intersection radical; Mapping classes and twists — Isotopy quotient of orientation-preserving homeomorphisms, Change of coordinates, Dehn twist and its integral homology action, Primitive classes represented by nonseparating curves, Integral symplectic generation and representation surjectivity; Point-pushing and configurations — Centrelessness and identity-component isotopy control, Point-pushing with the pinned composition convention, Birman exact sequence, Capping and general forgetting surjectivity, Configuration fibration, Lifted twists and cover-family monodromy.
- HeightsRationalPointsAndObstructions RP.4 (through FaltingsFinitenessAndIsogenyTheorems R28.5 and its Satz 7 node) and MordellLawrenceVenkatesh LV.11 prove the same statement, Faltings's theorem, by different routes. State the theorem once, as a single named declaration (proposed home: tauceti:TauCetiRoadmap/AlgebraicCurves or SchemeAndStackFoundations SF.3, which own curves and genus), and let RP.4 and LV.11 each target a proof of that declaration. RP.4 keeps Parshin's covering reduction, Shafarevich finiteness and Siegel's theorem; LV.11 keeps the p-adic period route. Neither roadmap depends on the other.
- LefschetzPencilsAndVanishingCycles LPV.5 proves (Deligne, Weil I 5.11) that an irreducible symplectic Lie algebra generated by square-zero operators x ↦ ⟨x, δ⟩δ is all of sp(V), and MordellLawrenceVenkatesh LV.0 proves the group-level transvection-generation lemmas LV 2.13–2.14 and the symplectic Goursat lemma 2.12. Both rest on the same structure theory of Sp(V) (centre, almost simplicity, simplicity of sp(V), inner automorphisms, generation by transvections), which ReductiveGroups owns but does not state for Sp. Create ReductiveGroups, Part II: symplectic subgroups and generation, with ReductiveGroups as parent, importing Layers 2,3,6,7 and the pinned Sp connectedness/root groups. Its named targets are arbitrary-form comparisons, Sp centre and normal-subgroup dichotomy, sp simplicity and inner automorphisms, abstract-subgroup Zariski closure, orbit dimensions, two-factor Lie Goursat and ideals of simple products. LPV.5 owns Deligne square-zero Lie generation; LV keeps the graph and unbalanced-unipotent applications. Transfer generic LV nodes only after orchestration, rather than extending accepted upstream layers in place.
- DiophantineApproximationAndTranscendence DT.2 (Subspace theorem and S-unit equations) and MordellLawrenceVenkatesh LV.6 both prove finiteness of the solutions of the S-unit equation t + (1 − t) = 1, by the Subspace theorem and by p-adic period maps respectively. State the S-unit theorem once as a named declaration (proposed home: DT.2, which also treats decomposable forms), and let LV.6 target a second proof of that declaration without either roadmap depending on the other.
- The exact contracts in LV import requests exceed the current named stage targets. Their general theory belongs to this existing owner. Create SchemeAndStackFoundations, Part II: noetherian models, formal coordinates and dimension, with SchemeAndStackFoundations as parent. Build on its existing stages; do not rewrite or duplicate their targets. LV retains only its family-specific assembly.
  Proposed exports: Noetherian models, formal coordinates and dimension — Finite étale tensor splitting and functorial module-idempotent decomposition, Spread out finitely presented structures and good models, Completed smooth local ring and residue-disk coordinates, Finite-type dimension inequalities and geometric products, Excellent normalization and characteristic-zero base change.
- The exact contracts in LV import requests exceed the current named stage targets. Their general theory belongs to this existing owner. Create AlgebraicModuliForArithmeticGeometry, Part II: symplectic and étale grassmannians, with AlgebraicModuliForArithmeticGeometry as parent. Build on its existing stages; do not rewrite or duplicate their targets. LV retains only its family-specific assembly.
  Proposed exports: Symplectic and étale Grassmannians — Adapted symplectic bases, Lagrangian symmetric-matrix charts, Isotropic closed equations, Finite étale componentwise-rank decomposition.
- The exact contracts in LV import requests exceed the current named stage targets. Their general theory belongs to this existing owner. Create AbelianSchemesAndArithmeticModuli, Part II: kernel components and rational projectors, with AbelianSchemesAndArithmeticModuli as parent. Build on its existing stages; do not rewrite or duplicate their targets. LV retains only its family-specific assembly.
  Proposed exports: Kernel components and rational projectors — Relative constant-dimensional kernel identity component, Base change and smoothness in characteristic zero, Polarization restriction to the kernel component.
- The exact contracts in LV import requests exceed the current named stage targets. Their general theory belongs to this existing owner. Create ArithmeticGaloisRepresentations, Part II: continuous finite induction, with ArithmeticGaloisRepresentations as parent. Build on its existing stages; do not rewrite or duplicate their targets. LV retains only its family-specific assembly.
  Proposed exports: Continuous finite induction — Topological Mackey comparison, Restriction of semisimple representations to finite-index normal subgroups, Faithful semisimple image algebra and character/trace comparison, Finite Frobenius trace test sets, Finiteness of bounded-dimensional pure integral semisimple representations.
- The exact contracts in LV import requests exceed the current named stage targets. Their general theory belongs to this existing owner. Create PadicHodgeTheory, Part II: local characters and induction, with PadicHodgeTheory as parent. Build on its existing stages; do not rewrite or duplicate their targets. LV retains only its family-specific assembly.
  Proposed exports: Local characters and induction — Tate–Sen character invariant criterion, Local algebraicity of de Rham characters, Filtered de Rham induction and unramified crystalline induction.
- The exact contracts in LV import requests exceed the current named stage targets. Their general theory belongs to this existing owner. Create ComplexComparisonPartII, Part II: completions and normalization, with ComplexComparisonPartII as parent. Build on its existing stages; do not rewrite or duplicate their targets. LV retains only its family-specific assembly.
  Proposed exports: Completions and normalization — Completed algebraic/analytic local-ring comparison, Analytification of finite normalization, Smoothness reflection under the local comparison.
- The exact contracts in LV import requests exceed the current named stage targets. Their general theory belongs to this existing owner. Create InverseGaloisAndArithmeticFundamentalGroups, Part II: finite curve cover comparisons, with InverseGaloisAndArithmeticFundamentalGroups as parent. Build on its existing stages; do not rewrite or duplicate their targets. LV retains only its family-specific assembly.
  Proposed exports: Finite curve cover comparisons — Branch-cycle to finite-étale Riemann existence, Algebraically closed characteristic-zero base change, Cyclotomic inertia and finite abelian H¹ comparison.
- The exact contracts in LV import requests exceed the current named stage targets. Their general theory belongs to this existing owner. Create EtaleDualityAndPerverseSheaves, Part II: integral pairings on curves, with EtaleDualityAndPerverseSheaves as parent. Build on its existing stages; do not rewrite or duplicate their targets. LV retains only its family-specific assembly.
  Proposed exports: Integral pairings on curves — Finite-coefficient H¹ freeness, Perfect alternating curve pairing for every invertible N, Jacobian Weil pairing comparison.
- ArithmeticDynamics DY.6 already owns the ℚ_p Strassmann theorem. ArithmeticDynamics, Part II: finite-extension analytic zero bounds, with ArithmeticDynamics as parent. Export the restricted-power-series bound over finite extensions K_v/ℚ_p and its analytic coordinate transport; LV imports the residue-disk specialization.
  Retained nodes: `MordellLawrenceVenkatesh:LV.3/strassmann`.

## Source corrections

The existing confirmed source-issue records are retained, including their original review attribution and correction-search provenance. Nodes use the corrected statements. This revision does not claim a fresh journal-edition errata search.

- `MordellLawrenceVenkatesh/E2`, §2.3, Lemma 2.3: arXiv v3 p. 9, standing notation p. 8; published pp. 902–904. Applications in §§3.4, 4.3, 6.: Use a finite set T = S ∪ {w : w divides p} in the finiteness lemma and its applications; impose its Frobenius weight and integrality conditions away from T. The standing S excludes every place above p. Good reduction makes p-adic cohomology crystalline there, but does not make it unramified. For example H²_et(P¹,Q_p)=Q_p(−1) is ramified at p although P¹ has good reduction. The finiteness argument allows any fixed finite ramification set: enlargement to T is harmless.
- `MordellLawrenceVenkatesh/E3`, §2.4, Lemma 2.8: arXiv v3 p. 12; published p. 908.: The identity holds on the local units: η²|_{O_{K_v}^*} = χ · Norm_{K_v/Q_p}^w with χ of finite order. It does not hold on all of K_v^*. The final sentence — w even, Hodge–Tate weight w/2 at v — is correct, and is what Lemmas 2.9 and 2.10 use. Counterexample: K = Q (which has no CM subfield, so every finite place is friendly), v = p, η = χ_cyc^{-1}. Then η is ramified only at p, locally algebraic there, and pure of weight w = 2, since geometric Frobenius at ℓ acts by ℓ. As an idele class character η(p) = 1, because the local Artin image of a uniformizer acts trivially on μ_{p^∞} in either normalisation; so η²(p) = 1 while Norm_{Q_p/Q_p}(p)^w = p², and χ(p) = p^{-2} has infinite order. On units η(u) = u and η² = Norm², so the identity does hold there. The proof cannot give more: local algebraicity is the hypothesis that η_p 'agrees, in a neighbourhood of the identity, with the Q_p-points of an algebraic homomorphism' (p. 12), and the closing step — 'any Q_p-rational character of (Res_{E/Q} G_m)^1 is trivial upon pullback to E_v^*' — is a statement about that algebraic character, hence controls η only on an open subgroup of E_v^*, not on a uniformizer.
- `MordellLawrenceVenkatesh/E7`, Proposition 5.3 and §6: arXiv v3 pp. 26, 29, compared with §§3.1, 3.3, pp. 15–17; published pp. 927, 931–932.: To apply §3 literally, explicitly restrict to odd residue characteristic and to the §3 good-reduction setup. For the proposition as stated at p=2, replace the whole residue disk by finitely many smaller congruence disks and carry out the argument on each. No counterexample to Proposition 5.3 is asserted. Friendliness ensures K_v/Q_p is unramified, but does not imply p>2. The quoted estimate for flat sections is |z|<p^(−1/(p−1)). At p=2, points with |z|=1/2 in a residue disk are on its boundary, so that estimate does not justify §6’s assertion that the analytic domain contains the entire residue disk. Subdivision into disks modulo 4 avoids this issue. The original claim that other primes above p must be good for crystallinity at v was incorrect: v∉S already supplies good reduction at v.
- `MordellLawrenceVenkatesh/E8`, Proof of Theorem 5.4: arXiv v3 pp. 27–28; published pp. 929–930.: 1 ⩽ i ⩽ 7 in both unions, and 'orbits of size less than 8' in the last clause. The displayed bound 8 · 2^g (q − 1)^g is unchanged (it is then a bound for seven submodules, so a fortiori valid), and so is the rest of the proof. size_v counts the elements lying in Frobenius orbits of size < 8 (Definition 5.2), that is, the elements killed by T^i − 1 for some i ⩽ 7; i = 8 is not needed. It is also not available: the next step reads 'For every odd prime factor r of q − 1 we know that q_v^i is not congruent to 1 modulo r', and that is precisely condition (iii) imposed on v two pages earlier, that the class of q_v in (Z/r)^* has order at least 8. An order exactly 8 is allowed, and then q_v^8 ≡ 1 mod r, so (q_v^8 − 1) need not be prime to r and the conclusion 2⟨m_1, m_2⟩ = 0 fails for i = 8. With i ⩽ 7 every step is correct.
- `MordellLawrenceVenkatesh/E10`, Definition of H^bad and Lemma 6.3: arXiv v3 pp. 32–33; published pp. 937–938.: Require 0≠W≠V in the bad-locus definition and in Lemma 6.3, and specify that its open subset A is nonempty. Compatibility of φ with the form in the proof is a separate issue, E25. Both W=0 and W=V are φ-stable and satisfy the printed inequality for every Lagrangian F. Consequently the literal bad locus is the entire parameter space. The printed lemma also allows A=∅, so read literally it is vacuous rather than false. Lemma 6.4 and the preceding sublemma use nonzero proper W.
- `MordellLawrenceVenkatesh/E11`, §7.1, Proposition 7.1(ii): arXiv v3 p. 35; published p. 940.: π_1^geom(Y − π(y'), y_0). y' is a point of Y', not of Y, so 'Y − y'' is not defined. The preceding sentence says the cover Z_{y'} → Y is ramified exactly at π(y'), and part (i) attaches to y' a conjugacy class of surjections π_1^geom(Y − y, *) ↠ G with y = π(y'); so the group meant is the one of the punctured curve Y − π(y').
- `MordellLawrenceVenkatesh/E12`, §7.3, proof of Lemma 7.4: arXiv v3 p. 38; published p. 945.: '… because the π_2 of Y vanishes': the relevant group is π_2 of the base of the fibration, not of its fibre. The fibration is the second map of (7.5), (Y² − Δ, y) → (Y, y_0), (y, y') ↦ y', whose fibre over y_0 is Y − {y_0}. Its long exact sequence reads π_2(Y) → π_1(Y − {y_0}) → π_1(Y² − Δ) → π_1(Y) → π_0, so injectivity on the left is governed by π_2 of the base Y; π_2 of the fibre enters the sequence one step earlier and is irrelevant to it. The conclusion is correct because Y is a closed surface of genus ⩾ 2, hence aspherical, so π_2(Y) = 0 — and in any case only the middle exactness, which gives the normality of Γ in Γ̃^geom that the argument goes on to use, is needed.
- `MordellLawrenceVenkatesh/E13`, §8.3, Lemma 8.2: arXiv v3 p. 42; published p. 951.: Require e to be nonseparating in Y, equivalently [e] ≠ 0 in H_1(Y; Q). A simple curve bounding a disk away from the branch point is permitted by the paper’s definition. Its q inverse images bound disks, so all q homology classes are zero, contradicting the claimed independence and primitive rank q−1. For a nonseparating curve one can choose the one-face CW decomposition used in the proof; the lifted edge classes are independent and transfer supplies the single relation after primitive projection. The required distinguishing curves can be chosen nonseparating, including curves with q-cycle monodromy; they are not all liftable curves in the paper’s special sense.
- `MordellLawrenceVenkatesh/E14`, §8.3, Lemma 8.3: arXiv v3 p. 42; published p. 951.: Take a nonseparating simple closed curve e in Y−{y} and a positive sufficiently divisible M (for example a positive multiple of the order of Cov(e), and of the relevant stabilizer indices). Then the rank is k−1, where k is the number of cycles of Cov(e). The lemma is deduced from Lemma 8.2, which needs e nonseparating (finding E13), and it fails without that hypothesis. If e bounds a disk in Y − {y} then Mon(D_e^M) = Id and the rank is 0, while Cov(e) = 1; if e is nonseparating with Cov(e) a q-cycle then k = 1 and the rank is again 0. Two different conjugacy classes give the same rank, so the rank does not determine the class. With e nonseparating the three possible cycle types in Aff(q) — (1^q), (q) and (1, r, …, r) — have k = q, 1 and 1 + (q − 1)/r cycles respectively, all distinct, and the lemma holds. The applications, in the proof of Lemma 8.9, are to nonseparating curves.
- `MordellLawrenceVenkatesh/E22`, §2.7, second hypothesis of Lemma 2.12: arXiv v3 p. 14; published p. 911.: Add i≠j to the second hypothesis. For i=j, the two projected operators are identical and cannot have fixed spaces of different dimensions. The printed hypothesis is therefore impossible when N≥1, making the implication vacuous and unusable in Lemma 8.7. Pairwise distinct factors are intended.
- `MordellLawrenceVenkatesh/E23`, §3.4, conclusion of Lemma 3.2: arXiv v3 p. 18; published p. 917.: The base extension to K_v is the closure of B_v(U_v), and the base extension to C is the closure of B_C(U_C). The respective closures are subschemes of projective spaces over the opposite fields from those paired with them in the sentence. The proof constructs the common ideal over K and gives the correctly matched base changes.
- `MordellLawrenceVenkatesh/E24`, End of §8.3: arXiv v3 p. 43; published p. 951.: Use D_e^{q−1}, or a suitable further positive multiple in the common cover stabilizer. Its lift is D_{e+}^{q−1}D_{e−}; it induces a nontrivial transvection on primitive homology. For a liftable e the multiplier of Cov(e) generates F_q^×. A dual curve meeting e once has its abelian multiplier changed by this generator under D_e. Conjugation in Aff(q) preserves multipliers, so D_e does not stabilize the cover. The preceding lifting formula instead applies to the (q−1)-st power. If u is the primitive projection of [e+], then the projection of [e−] is −u and the lift acts by x↦x+q⟨u,x⟩u, up to the intersection-sign convention.
- `MordellLawrenceVenkatesh/E25`, Lemma 6.3 and its reduction to Lemma 6.4: arXiv v3 p. 33; published pp. 937–938.: For the printed proof, require φ to be a semilinear similitude: ω(φx,φy)=c·σ(ω(x,y)) for some c≠0. Alternatively prove a general-position result for the different transported symplectic forms, rather than invoking Lemma 6.4 for one form. The printed assumptions make φ bijective and Frobenius-semilinear only. Identifying the embedding components V_i via φ need not make their Lagrangians Lagrangian for one common form. Over an unramified extension of degree 8, take φ=Aσ with A=diag(2,1,1,1) and the standard symplectic form pairing e_1,e_3 and e_2,e_4. F=span(e_1+e_2,e_3−e_4) is Lagrangian, but the pairing on A^{-1}F is −1/2. Thus the common-form hypothesis needed for the displayed invocation of Lemma 6.4 is not justified.
- `MordellLawrenceVenkatesh/E26`, §6, definition of G_v and H_v: arXiv v3 p. 29; published p. 932.: Use Gr(V_v,d) and rank d, where d is the relative abelian dimension in Proposition 5.3. The coefficient algebra in that sentence is E_{0,v}. V_v has rank 2d over E_{0,v}; its first Hodge step and its Lagrangians have rank d. The letter g denotes the genus of the base curve and need not equal d: the Kodaira–Parshin formula gives d=(q−1)(g−1/2), for example d=3 when g=2,q=3.
- `MordellLawrenceVenkatesh/E29`, Theorem 4.1 proof, PDF p. 7, final display (public PDF matching the packet hash): The remainder is b_{n+m} α^m. Iterating b_n=a_{n+1}+αb_{n+1} m times gives α^m. For m=1, g=x and f=x(x−α), the printed formula gives b₀=1−α instead of 0. The corrected remainder still tends to zero, so the theorem and limiting proof survive.
- `MordellLawrenceVenkatesh/E30`, Version 5.0, printed p. 177 (PDF p. 187), sentence after Proposition 6.3: Allow [a]=±[a′] for oriented curves on the closed surface. Reverse the orientation of a nonseparating curve: the twist is unchanged and its nonzero primitive homology class is negated. Equality of the rank-one symplectic operators conversely identifies the primitive line up to sign. This sentence is not needed for the surjectivity theorem.

## Sources and provenance

- **lv2020**: Brian Lawrence; Akshay Venkatesh, [Diophantine problems and p-adic period mappings](https://arxiv.org/pdf/1807.02721v3). arXiv:1807.02721v3 (25 October 2019), 76 pp.; published Invent. Math. 221 (2020), 893–999, doi:10.1007/s00222-020-00966-7. Locators are to the arXiv v3 pagination. Accessed 2026-10-06; SHA-256 `e3013516c1123635f0373cd5b623eafa3d816f043ee54760dec724d329bc6b9b`.
  Passages: §1 Introduction (pp. 1–8); §2 Notation and preparatory results (pp. 8–15); §3 Fibers with good reduction in a family (pp. 15–20); §4 The S-unit equation (pp. 20–24); §5 Outline of the argument for Mordell's conjecture (pp. 25–28); §6 Rational points on the base of an abelian-by-finite family (pp. 28–34); §7 The Kodaira–Parshin family (pp. 34–39); §8 The monodromy of Kodaira–Parshin families (pp. 39–51); §9 (pp. 51–55), read to confirm that the Mordell argument does not use it; References (pp. 74–76).
- **brinon-conrad**: Olivier Brinon; Brian Conrad, [CMI summer school notes on p-adic Hodge theory (preliminary version)](https://math.stanford.edu/~conrad/papers/notes.pdf). Preliminary version (2009), 290 pp. Accessed 2026-10-06; SHA-256 `f27d508bc64b3c9e2e9de5041429b2cb6a909b2cd72ff8096c20493f27b5a187`.
  Passages: §2.2 Theorem 2.2.7 (Tate–Sen), p. 15; §6.3 Example 6.3.1, Propositions 6.3.2–6.3.3, pp. 76–77; §8.1 Definition 8.1.1, Proposition 8.1.2, pp. 102–103; §8.2 Definition 8.2.1, p. 110; §9.1 Propositions 9.1.9 and 9.1.11, pp. 134–135; §9.3 Theorem 9.3.4, p. 147; §7.3, Definition 7.3.4, p. 98: filtered φ-modules; §9.1, Proposition 9.1.9, p. 133: crystalline implies de Rham.
- **farb-margalit**: Benson Farb; Dan Margalit, [A primer on mapping class groups](https://pagine.dm.unipi.it/~a019210/Farb%20Magalit_Primer%20on%20Teichmuller%20theory.pdf). Version 5.0 (the authors' freely distributed version, 509 pp.; published by Princeton University Press, 2012). Page numbers are the printed ones. Accessed 2026-10-06; SHA-256 `46c4cc848134ba38d6e7fe15462aac3069796db23b0e34a50a9018773d7fc7f2`.
  Passages: §1.1 Theorem 1.1 (classification of surfaces) and the conventions following it (pp. 18–19); §1.3 The change of coordinates principle (pp. 38–43); §3.1.1 Dehn twists and their action on curves, Facts 3.6–3.9 (pp. 64–75); §3.6.2 Proposition 3.19 (pp. 89–90); §4.2 Theorem 4.6, Fact 4.7 and the proof (pp. 101–105); §6.2 Proposition 6.2 (p. 173); §6.3 Proposition 6.3, Theorem 6.4 (pp. 176–177).
- **milne-cm**: J. S. Milne, [Complex Multiplication](https://www.jmilne.org/math/CourseNotes/CM.pdf). Course notes (version posted at jmilne.org, accessed 2026-09-16) Accessed 2026-10-06; SHA-256 `0ac337a885d72f6938f15724b897f568fe350d0d754d0b52370b8f3a01d2e2b5`.
  Passages: Chapter I, CM-algebras: Proposition 1.4, Corollary 1.5, Remarks 1.6–1.7 (pp. 10–11); Chapter I, Infinity types: Proposition 4.9 and its proof (pp. 37–38).
- **sga1**: A. Grothendieck; M. Raynaud, [Revêtements étales et groupe fondamental (SGA 1)](https://arxiv.org/pdf/math/0206203). Updated edition, arXiv:math/0206203 (Documents Mathématiques 3, SMF 2003) Accessed 2026-10-06; SHA-256 `8e64218d356456c534eebf996940f0f957e43b54f1a080241debe12cbaf60d3c`.
  Passages: Exposé XII §5, Théorème 5.1 (Riemann existence), pp. 251–252; Exposé XIII §4, Proposition 4.3 and Exemples 4.4, pp. 307–309.
- **deligne-bourbaki-616**: Pierre Deligne, [Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)](http://www.numdam.org/item/SB_1983-1984__26__25_0.pdf). Séminaire Bourbaki, exposé 616 (1983/84), Astérisque 121–122 (1985) Accessed 2026-10-06; SHA-256 `b0865c63f3c65e768c388e5d575a1395ab401c0edaf45a49305679fb16c73a77`.
  Passages: §3, Théorème 3.1 and its proof (pp. 17–18 of the numdam file).
- **faltings-1983**: Gerd Faltings, [Endlichkeitssätze für abelsche Varietäten über Zahlkörpern](https://math.uchicago.edu/~drinfeld/Deligne%27s_conjecture_Manin_conf/Faltings_argument/Faltings.pdf). Invent. Math. 73 (1983), 349–366 Accessed 2026-10-06; SHA-256 `0b7fb3e505d5d63e3e6c5913daf15bd843488e59f80f8d5176b154ac8faa3fc2`.
  Passages: §3 Lemma 4 (p. 357); §5 Satz 5 and its proof (pp. 362–363).
- **conrad-strassmann**: Keith Conrad, [Strassmann's theorem and an application](https://kconrad.math.uconn.edu/blurbs/gradnumthy/strassmannapplication.pdf). Expository note (version posted on the author's web page, accessed 2026-09-16) Accessed 2026-10-06; SHA-256 `dc8941f405710c59aaebeb6b6b7868c33c44dfd37079fbd02352adf8639920e8`.
  Passages: §2, Theorem 2.1, Corollary 2.2 and proof, PDF p. 2; §4, Theorem 4.1 and proof, PDF pp. 6–8.
- **berthelot-ogus**: Pierre Berthelot; Arthur Ogus, [Notes on Crystalline Cohomology](https://math.bu.edu/people/yangzhe/BO_Crystalline.pdf). Princeton University Press / University of Tokyo Press, 1978 Accessed 2026-10-06; SHA-256 `f3565d2ce264c92a71f8f98495df563bbacfcbe75ee83b834aa620931c2e5534`.
  Passages: §7, Corollaries 7.3–7.4 and Corollary 7.9 (pp. 7.4–7.16).
- **gallier-xu**: Jean Gallier; Dianna Xu, [A Guide to the Classification Theorem for Compact Surfaces](https://www.cis.upenn.edu/~jean/surfclassif-root.pdf). Springer, Geometry and Computing 9 (2013), author-hosted full text; printed page locators. Accessed 2026-10-06; SHA-256 `9ed2237db5452d291704ade393e6e1d8456741c739f2bd6afc662f1efae4fca1`.
  Passages: Chapter 6, §§6.1–6.2, pp. 79–98: cell complexes, elementary subdivision, canonical polygon forms and classification; Appendix E, pp. 159–163: Jordan–Schönflies inputs and triangulation of compact surfaces.

Gallier–Xu provides the canonical polygon argument and the closed-surface triangulation route. Appendix E invokes Jordan–Schönflies; the boundary-collar and smoothing extension is an explicit GeometricTopology Part II contract. Source availability is therefore distinguished from availability of a formal interface.

## Pinned declaration audit

Each declaration below was read with its surrounding hypotheses at the recorded pin. A declaration’s existence supplies only its displayed scope, not the stronger consumer comparison.

- `mathlib:AddChar.card_eq` — A finite abelian group has as many ℂ-valued additive characters as elements. Source module: `Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean`.
- `mathlib:AlgebraicGeometry.Etale` — Étale morphisms of schemes. Source module: `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean`.
- `mathlib:AlgebraicGeometry.IsFinite` — Finite morphisms of schemes. Source module: `Mathlib/AlgebraicGeometry/Morphisms/Finite.lean`.
- `mathlib:AlgebraicGeometry.IsIntegral` — Integral schemes: nonempty with all rings of sections over nonempty opens integral domains. Source module: `Mathlib/AlgebraicGeometry/Properties.lean`.
- `mathlib:AlgebraicGeometry.IsProper` — Proper morphisms of schemes (separated, universally closed, locally of finite type). Source module: `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean`.
- `mathlib:AlgebraicGeometry.IsProper.eq_valuativeCriterion` — Valuative criterion: proper = valuative criterion ∧ quasi-compact ∧ quasi-separated ∧ locally of finite type. Source module: `Mathlib/AlgebraicGeometry/ValuativeCriterion.lean`.
- `mathlib:AlgebraicGeometry.Scheme.Hom.normalization` — The relative normalization of Y in X for a morphism f : X ⟶ Y. Source module: `Mathlib/AlgebraicGeometry/Normalization.lean`.
- `mathlib:AlgebraicGeometry.Smooth` — Smooth morphisms of schemes. Source module: `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean`.
- `mathlib:AlgebraicGeometry.spread_out_of_isGermInjective` — A morphism of stalks Spec 𝒪_{X,x} → Spec 𝒪_{Y,y} over S spreads out to an open neighbourhood of x when Y is locally of finite type and X is germ-injective at x. Source module: `Mathlib/AlgebraicGeometry/SpreadingOut.lean`.
- `mathlib:AlgebraicTopology.singularHomologyFunctor` — Singular homology in degree n with coefficients in an object of a category with homology. Source module: `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean`.
- `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` — Identity theorem: analytic functions on a preconnected open set that agree near a point agree on the set. Source module: `Mathlib/Analysis/Analytic/Uniqueness.lean`.
- `mathlib:CategoryTheory.PreGaloisCategory.IsFundamentalGroup` — A compact topological group acting naturally, continuously, transitively on Galois objects and faithfully on fibres is a fundamental group of the Galois category. Source module: `Mathlib/CategoryTheory/Galois/IsFundamentalgroup.lean`.
- `mathlib:CharacterModule` — The character module A →+ AddCircle (1 : ℚ) (ℚ/ℤ-valued characters) of an abelian group A. Source module: `Mathlib/Algebra/Module/CharacterModule.lean`.
- `mathlib:CharacterModule.dual_surjective_of_injective` — Restriction of ℚ/ℤ-valued characters along an injective map is surjective (ℚ/ℤ is injective). Source module: `Mathlib/Algebra/Module/CharacterModule.lean`.
- `mathlib:CommAlgCat.FiniteEtale` — The category of finite étale R-algebras. Source module: `Mathlib/RingTheory/Etale/Finite.lean`.
- `mathlib:Field.exists_primitive_element` — Primitive element theorem for finite separable extensions: some α has F⟮α⟯ = ⊤. Source module: `Mathlib/FieldTheory/PrimitiveElement.lean`.
- `mathlib:FixedPoints.finrank_eq_card` — For a finite group G acting faithfully on a field F, [F : F^G] = |G|. Source module: `Mathlib/FieldTheory/Fixed.lean`.
- `mathlib:FormalMultilinearSeries.radius` — The radius of convergence of a formal multilinear series. Source module: `Mathlib/Analysis/Analytic/ConvergenceRadius.lean`.
- `mathlib:HasFPowerSeriesAt.apply_eq_zero` — If a formal multilinear series represents the zero function near x (over any nontrivially normed field), all its homogeneous terms p n (fun _ ↦ y) vanish. Source module: `Mathlib/Analysis/Analytic/Uniqueness.lean`.
- `mathlib:HasFPowerSeriesOnBall` — A function is given by a power series on a ball of positive radius. Source module: `Mathlib/Analysis/Analytic/Basic.lean`.
- `mathlib:Ideal.quotientInfRingEquivPiQuotient` — Chinese remainder theorem: for pairwise coprime ideals f i, R ⧸ ⨅ f i ≃+* Π R ⧸ f i. Source module: `Mathlib/RingTheory/Ideal/Quotient/Operations.lean`.
- `mathlib:InfiniteGalois.fixedField_fixingSubgroup` — Infinite Galois correspondence: the fixed field of the fixing subgroup of an intermediate field L is L. Source module: `Mathlib/FieldTheory/Galois/Infinite.lean`.
- `mathlib:InfiniteGalois.fixingSubgroup_fixedField` — Infinite Galois correspondence: the fixing subgroup of the fixed field of a closed subgroup H is H. Source module: `Mathlib/FieldTheory/Galois/Infinite.lean`.
- `mathlib:IrreducibleSpace` — A nonempty topological space that is not the union of two proper closed subsets. Source module: `Mathlib/Topology/Irreducible.lean`.
- `mathlib:IsArithFrobAt` — σ is an arithmetic Frobenius at Q: σ(x) ≡ x^q mod Q with q the residue cardinality of the base. Source module: `Mathlib/RingTheory/Frobenius.lean`.
- `mathlib:IsCoveringMap.existsUnique_continuousMap_lifts` — General continuous-map lifting on a path-connected locally path-connected domain, given explicit existence of path lifts and endpoint uniqueness. These hypotheses are not automatic for arbitrary domains; the simply-connected criterion is a separate corollary/interface. Source module: `Mathlib/Topology/Homotopy/Lifting.lean`.
- `mathlib:IsCoveringMap.monodromyPerm` — The monodromy action of the fundamental group on the fibre of a covering map. Source module: `Mathlib/Topology/Homotopy/Lifting.lean`.
- `mathlib:IsCyclotomicExtension.Rat.ramificationIdx_eq_of_not_dvd` — In ℚ(ζ_m), a prime p ∤ m has ramification index 1. Source module: `Mathlib/NumberTheory/NumberField/Cyclotomic/Ideal.lean`.
- `mathlib:IsGalois.of_fixed_field` — Artin: for a finite group G acting on a field E, the extension E/E^G is Galois. Source module: `Mathlib/FieldTheory/Galois/Basic.lean`.
- `mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing` — Wedderburn–Artin: a semisimple algebra is a finite product of matrix algebras over division algebras. Source module: `Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean`.
- `mathlib:LieAlgebra.IsSimple` — A Lie algebra is simple: its only ideals are ⊥ and ⊤ and it is not abelian. Source module: `Mathlib/Algebra/Lie/Semisimple/Defs.lean`.
- `mathlib:LieAlgebra.Symplectic.sp` — The symplectic Lie algebra sp as the skew-adjoint matrices for the standard form J. Source module: `Mathlib/Algebra/Lie/Classical.lean`.
- `mathlib:LinearMap.BilinForm.IsAlt` — A bilinear form is alternating: B x x = 0 for all x. Source module: `Mathlib/LinearAlgebra/BilinearForm/Properties.lean`.
- `mathlib:LinearMap.BilinForm.Nondegenerate` — A bilinear form is nondegenerate (separating in each variable). Source module: `Mathlib/LinearAlgebra/BilinearForm/Properties.lean`.
- `mathlib:LinearMap.BilinForm.finrank_orthogonal` — For a nondegenerate bilinear form, dim W^⊥ = dim V − dim W. Source module: `Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean`.
- `mathlib:LinearMap.BilinForm.orthogonal` — The orthogonal complement of a submodule with respect to a bilinear form. Source module: `Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean`.
- `mathlib:LinearMap.transvection` — The linear map x ↦ x + f(x)·v for a linear form f and a vector v. Source module: `Mathlib/LinearAlgebra/Transvection/Basic.lean`.
- `mathlib:Matrix.SL2.transvection_induction` — Every element of SL(2, F) over a field is a product of elementary transvections (induction principle). Its coefficients are a field; it is not integral symplectic generation. Source module: `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean`.
- `mathlib:Module.Flat.ker_lTensor_eq` — For flat M, the kernel of the base change of a linear map f is the base change of ker f. Source module: `Mathlib/RingTheory/Flat/Equalizer.lean`.
- `mathlib:Module.Grassmannian` — G(k, M; R): submodules N of an R-module M with M ⧸ N finite projective of constant rank k (EGA quotient convention). Source module: `Mathlib/RingTheory/Grassmannian.lean`.
- `mathlib:Module.Grassmannian.functor` — The Grassmannian functor A ↦ G(k, A ⊗[R] M; A) on commutative R-algebras, with base change of submodules. Source module: `Mathlib/RingTheory/Grassmannian.lean`.
- `mathlib:Module.finrank_baseChange` — finrank R (R ⊗[S] M') = finrank S M' (dimension is invariant under base change). Source module: `Mathlib/LinearAlgebra/Dimension/Constructions.lean`.
- `mathlib:MvPolynomial.funext` — Over an infinite integral domain, multivariate polynomials with the same evaluations at all points are equal. Source module: `Mathlib/Algebra/MvPolynomial/Funext.lean`.
- `mathlib:MvPolynomial.vanishingIdeal` — The ideal of polynomials vanishing on a set of points. Source module: `Mathlib/RingTheory/Nullstellensatz.lean`.
- `mathlib:MvPolynomial.zeroLocus` — The common zero set of an ideal of polynomials. Source module: `Mathlib/RingTheory/Nullstellensatz.lean`.
- `mathlib:MvPowerSeries` — Multivariate formal power series (σ →₀ ℕ) → R. Source module: `Mathlib/RingTheory/MvPowerSeries/Basic.lean`.
- `mathlib:MvPowerSeries.IsRestricted` — A multivariate power series over a normed ring is c-restricted if ‖coeff t‖·∏ c_i^{t_i} → 0 cofinitely. Source module: `Mathlib/RingTheory/MvPowerSeries/Restricted.lean`.
- `mathlib:MvPowerSeries.IsRestricted.subring` — Over an ultrametric normed ring, the c-restricted multivariate power series form a subring. Source module: `Mathlib/RingTheory/MvPowerSeries/Restricted.lean`.
- `mathlib:Nat.factorization_factorial_le_div_pred` — Legendre's bound v_p(n!) ≤ n/(p−1). Source module: `Mathlib/Data/Nat/Choose/Factorization.lean`.
- `mathlib:Nat.forall_exists_prime_gt_and_eq_mod` — Dirichlet: for a unit a of ZMod q and any n there is a prime p > n with p ≡ a mod q. Source module: `Mathlib/NumberTheory/LSeries/PrimesInAP.lean`.
- `mathlib:NumberField.IsCMField` — A CM field: totally complex and quadratic over its maximal real subfield. Source module: `Mathlib/NumberTheory/NumberField/CMField.lean`.
- `mathlib:NumberField.IsCMField.complexEmbedding_complexConj` — For a CM field K and every complex embedding φ, φ(complexConj x) = conj(φ x). Source module: `Mathlib/NumberTheory/NumberField/CMField.lean`.
- `mathlib:NumberField.Units.dirichletUnitTheorem.unitLattice_span_eq_top` — Dirichlet: the real span of the logarithmic unit lattice (coordinates at the infinite places w ≠ w₀) is the whole space. Source module: `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean`.
- `mathlib:NumberField.Units.logEmbedding` — The logarithmic embedding u ↦ (mult w · log w(u))_{w ≠ w₀} of the units of 𝓞_K. Source module: `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean`.
- `mathlib:NumberField.exists_not_isUnramifiedIn` — A number field of degree > 1 over ℚ has a ramified prime (ℚ has no unramified extension). Source module: `Mathlib/NumberTheory/NumberField/ExistsRamified.lean`.
- `mathlib:NumberField.maximalRealSubfield` — The subfield of x ∈ K with φ(x) real for every complex embedding φ (the maximal totally real subfield). Source module: `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean`.
- `mathlib:NumberField.not_dvd_discr_iff_isUnramifiedIn` — A rational prime p does not divide disc(K) iff p is unramified in K. Source module: `Mathlib/NumberTheory/NumberField/Discriminant/Different.lean`.
- `mathlib:Polynomial.coeff_le_of_roots_le` — For a monic polynomial split over a normed field with all roots of norm ≤ B, ‖coeff i‖ ≤ B^(d−i)·C(d, i). Source module: `Mathlib/Topology/Algebra/Polynomial.lean`.
- `mathlib:Polynomial.separable_X_pow_sub_C_unit` — X^n − u is separable when u is a unit and n is a unit. Source module: `Mathlib/FieldTheory/Separable.lean`.
- `mathlib:PowerSeries.IsRestricted` — The one-variable restricted power series predicate. Source module: `Mathlib/RingTheory/PowerSeries/Restricted.lean`.
- `mathlib:Set.integer` — The subalgebra of S-integers of the fraction field of a Dedekind domain. Source module: `Mathlib/RingTheory/DedekindDomain/SInteger.lean`.
- `mathlib:Set.unit` — The subgroup of S-units. Source module: `Mathlib/RingTheory/DedekindDomain/SInteger.lean`.
- `mathlib:StandardEtalePair` — A pair f, g ∈ R[X] with f monic and f' invertible in R[X][1/g]/(f); its algebra R[X][1/g]/(f) is étale over R (instance). Source module: `Mathlib/RingTheory/Etale/StandardEtale.lean`.
- `mathlib:Subgroup.closure_mul_image_eq` — Schreier's lemma: generators of a subgroup H from a right transversal R ∋ 1 and generators S of G. Source module: `Mathlib/GroupTheory/Schreier.lean`.
- `mathlib:Submodule.le_of_le_smul_of_le_jacobson_bot` — Nakayama: for N' finitely generated and I in the Jacobson radical, N' ≤ N ⊔ I•N' implies N' ≤ N. Source module: `Mathlib/RingTheory/Nakayama.lean`.
- `mathlib:WeierstrassCurve` — Weierstrass curves y² + a₁xy + a₃y = x³ + a₂x² + a₄x + a₆ over a ring. Source module: `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`.
- `mathlib:WeierstrassCurve.IsElliptic` — A Weierstrass curve is elliptic if its discriminant is a unit. Source module: `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`.
- `mathlib:WeierstrassCurve.j` — The j-invariant Δ⁻¹c₄³ of an elliptic Weierstrass curve. Source module: `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`.
- `mathlib:ZMod.card_units_eq_totient` — The unit group of ZMod n has φ(n) elements. Source module: `Mathlib/Data/Nat/Totient.lean`.
- `mathlib:autEquivRootsOfUnity` — For L the splitting field of an irreducible X^n − a over a field with a primitive n-th root of unity, Gal(L/K) ≃* rootsOfUnity n K. Source module: `Mathlib/FieldTheory/KummerExtension.lean`.
- `mathlib:autEquivZmod` — Under the same hypotheses, Gal(L/K) ≃* Multiplicative (ZMod n). Source module: `Mathlib/FieldTheory/KummerExtension.lean`.
- `mathlib:cyclotomicCharacter` — The p-adic cyclotomic character (L ≃+* L) →* ℤ_[p]ˣ. Its target is the p-adic unit group; prime-to-p finite roots of unity require the separate finite-character interface. Source module: `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean`.
- `mathlib:isCyclic_of_isSplittingField_X_pow_sub_C` — If K has a primitive n-th root of unity and X^n − a is irreducible, the Galois group of its splitting field is cyclic. Source module: `Mathlib/FieldTheory/KummerExtension.lean`.
- `tauceti:AlgHom.IsArithFrobAt.autToPow_eq_absNorm` — An arithmetic Frobenius at 𝔭 ∤ m acts on a primitive m-th root of unity by ζ ↦ ζ^{N𝔭}. Source module: `TauCeti/NumberTheory/NumberField/Cyclotomic/Frobenius.lean`.
- `tauceti:IsCyclotomicExtension.Rat.prime_dvd_of_dvd_natAbs_discr` — A prime dividing the discriminant of ℚ(ζ_m) divides m. Source module: `TauCeti/NumberTheory/NumberField/Cyclotomic/Finrank.lean`.
- `tauceti:IsCyclotomicExtension.galEquivProd` — For L/K Galois (number fields), M = L(μ_m) and m coprime to |disc L|: Gal(M/K) ≃* Gal(L/K) × (ZMod m)ˣ by restriction and the cyclotomic character. Source module: `TauCeti/NumberTheory/NumberField/Cyclotomic/Compositum.lean`.
- `tauceti:LinearMap.GeneralLinearGroup.IsUnipotent` — A linear automorphism g is unipotent if g − 1 is nilpotent. Source module: `TauCeti/LinearAlgebra/GeneralLinearGroup/Unipotent.lean`.
- `tauceti:NumberField.Chebotarev.frobeniusPrimeSet` — The set of primes of K unramified in L whose Artin symbol is a given conjugacy class C. Source module: `TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean`.
- `tauceti:NumberField.Chebotarev.mem_frobeniusPrimeSet_galEquivProd_symm_iff` — For 𝔭 unramified in M = L(μ_m) with 𝔭 ∤ m: 𝔭 lies in the Frobenius fibre of the class of galEquivProd⁻¹(σ, τ) iff it lies in the fibre of [σ] over L and N𝔭 ≡ τ mod m. Source module: `TauCeti/NumberTheory/Chebotarev/Crossing/CompositumFrobenius.lean`.
- `tauceti:NumberField.artinSymbol` — The Frobenius conjugacy class in Gal(L/K) of a prime 𝔭 of 𝓞_K unramified in L. Source module: `TauCeti/NumberTheory/NumberField/ArtinSymbol.lean`.
- `tauceti:NumberField.exists_isArithFrobAt` — For a finite Galois extension L/K of number fields and a nonzero prime Q of 𝓞_L there is an arithmetic Frobenius in Gal(L/K). Source module: `TauCeti/NumberTheory/NumberField/Frobenius.lean`.
- `tauceti:Rep.mackeyDecomposition` — Mackey decomposition Res_K Ind_H A ≅ ⊕ over double cosets of the induced restricted representations, for subgroups H, K of any group. This is algebraic Rep, without continuity; the topological finite-index comparison is separately requested from R01.1. Source module: `TauCeti/RepresentationTheory/Induction/Mackey/Decomposition.lean`.
- `tauceti:TauCeti.BilinForm.isometryGroup` — The subgroup of linear automorphisms preserving a bilinear form B (Sp(V, ω) when B = ω is alternating nondegenerate). Source module: `TauCeti/LinearAlgebra/BilinearForm/Isometry.lean`.
- `tauceti:TauCeti.CoveringSpace.monodromyEquivalence` — Covering spaces of a path-connected, locally path-connected, semilocally simply connected space ≌ functors from the fundamental groupoid to types. Source module: `TauCeti/AlgebraicTopology/UniversalCover/Classification/MonodromyEquivalence.lean`.
- `tauceti:TauCeti.FiniteCoveringSpace.instProfiniteCompletionIsFundamentalGroup` — The profinite completion of π₁(X, x₀) is a fundamental group of the Galois category of finite covering spaces of X. Source module: `TauCeti/AlgebraicTopology/UniversalCover/Classification/ProfiniteFiberFunctor.lean`.
- `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation` — The monodromy representation of a local coefficient system at a base point. Source module: `TauCeti/AlgebraicTopology/LocalCoefficient.lean`.
- `tauceti:TauCeti.Symplectic.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra` — The symplectic group scheme Sp_{2m} is geometrically connected over every field. Source module: `TauCeti/Algebra/AlgebraicGroup/Symplectic/Connected.lean`.
- `tauceti:TauCeti.UniversalCover` — The universal cover of a pointed space as homotopy classes of paths from the base point. Source module: `TauCeti/AlgebraicTopology/UniversalCover/Basic.lean`.
- `tauceti:TauCeti.nonempty_linearEquiv_of_finrank_linearMap_eq` — Over a finite-dimensional semisimple algebra, finite modules with equal Hom-dimensions from every simple left ideal are isomorphic. Source module: `TauCeti/RingTheory/Semisimple/Multiplicity.lean`.
- `mathlib:AffineEquiv` — Affine equivalences between module torsors, with their underlying equivalence and linear part; self-equivalences have the existing group structure. Source module: `Mathlib/LinearAlgebra/AffineSpace/AffineEquiv.lean`.
- `mathlib:IsCoveringMap.liftHomotopy` — For a covering p:E→X, a continuous H:I×A→X and a continuous initial lift f:A→E, construct a continuous lift with the given initial value; no simply-connected-domain hypothesis. Source module: `Mathlib/Topology/Homotopy/Lifting.lean`.
- `mathlib:FundamentalGroup.mul_def` — p*q=q.trans p: fundamental-group multiplication traverses q before p. Source module: `Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean`.
- `mathlib:LinearEquiv.transvection` — For a ring R and R-module V, a dual form f and vector v with f(v)=0 give the linear equivalence x↦x+f(x)v, with inverse x↦x−f(x)v. Source module: `Mathlib/LinearAlgebra/Transvection/Basic.lean`.
- `mathlib:Representation` — For a semiring k, monoid G and k-module V, a representation is G→*End_k(V). Source module: `Mathlib/RepresentationTheory/Basic.lean`.
- `mathlib:Representation.asModule` — Type synonym for V with the k[G]-module action induced by the representation; asModuleEquiv identifies it with V as a k-module. Source module: `Mathlib/RepresentationTheory/Basic.lean`.
